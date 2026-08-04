<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Invoice;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;
use Storage;

class InvoiceController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Invoice::with(['Organization:id,Organization_name', 'invoice_details'])->latest();

        // ✅ account_head_id → invoice_details টেবিলে filter
        if (!empty($request->account_head_id)) {
            $query->whereHas('invoice_details', function ($q) use ($request) {
                $q->where('account_head_id', $request->account_head_id);
            });
        }

        // ✅ payment_status → invoices টেবিলে
        if (!empty($request->payment_status)) {
            $query->where('payment_status', $request->payment_status);
        }

        // ✅ invoice date range
        if (!empty($request->from_invoice_date) && !empty($request->to_invoice_date)) {
            $query->whereBetween('invoice_date', [
                date('Y-m-d', strtotime($request->from_invoice_date)),
                date('Y-m-d', strtotime($request->to_invoice_date))
            ]);
        } elseif (!empty($request->from_invoice_date)) {
            $query->whereDate('invoice_date', '>=', date('Y-m-d', strtotime($request->from_invoice_date)));
        } elseif (!empty($request->to_invoice_date)) {
            $query->whereDate('invoice_date', '<=', date('Y-m-d', strtotime($request->to_invoice_date)));
        }

        // ✅ payment date range
        if (!empty($request->from_payment_date) && !empty($request->to_payment_date)) {
            $query->whereBetween('payment_date', [
                date('Y-m-d', strtotime($request->from_payment_date)),
                date('Y-m-d', strtotime($request->to_payment_date))
            ]);
        } elseif (!empty($request->from_payment_date)) {
            $query->whereDate('payment_date', '>=', date('Y-m-d', strtotime($request->from_payment_date)));
        } elseif (!empty($request->to_payment_date)) {
            $query->whereDate('payment_date', '<=', date('Y-m-d', strtotime($request->to_payment_date)));
        }

        // ✅ field_name & value (যদি generic search থাকে)
        if (!empty($request->field_name) && !empty($request->value)) {
            $query->whereLike($request->field_name, $request->value);
        }

        if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination);
            return new Resource($datas);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('layouts.backend_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();
                $organization = $data['Organization'];
                $invoice_details = $data['invoice_details'];
                unset($data['Organization']);
                unset($data['invoice_details']);

                $data['invoice_no'] = Invoice::generateInvoiceNumber();
                $data['organization_id'] = $organization['id'];
                $data['invoice_date'] = vue_to_server_date($data['invoice_date']);
                if (array_key_exists('payment_date', $data)) {
                    $data['payment_date'] = vue_to_server_date($data['payment_date']);
                }

                // push the insert text
                $invoice = Invoice::create($data);
                // Save multiple invoice_details if invoice created
                if ($invoice && !empty($invoice_details)) {
                    foreach ($invoice_details as $detail) {
                        $invoice->invoice_details()->create([
                            'account_head_id' => $detail['account_head_id'] ?? null,
                            'amount' => $detail['amount'] ?? 0,
                        ]);
                    }
                }
                return $this->responseReturn("create", $invoice);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Invoice  $invoice
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Invoice $invoice)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        // Load Organization with its package relation
        $invoice->load(['invoice_details.accounthead', 'Organization.package']);

        return response()->json($invoice);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Invoice  $invoice
     * @return \Illuminate\Http\Response
     */
    public function edit(Invoice $invoice)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Invoice  $invoice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Invoice $invoice)
    {
        if ($this->validateCheck($request, $invoice->id)) {
            try {
                $data = $request->all();
                // push the update text
                $invoice->fill($data)->save();

                return $this->responseReturn("update", $invoice);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Invoice  $invoice
     * @return \Illuminate\Http\Response
     */
    public function destroy(Invoice $invoice)
    {
        // delete


        $res = $invoice->delete();
        return $this->responseReturn("delete", $res);
    }

    public function paynow($invoiceid)
    {
        if (!$invoiceid) {
            return response()->json([
                'success' => false,
                'message' => 'Invoice ID not provided'
            ], 400);
        }

        $invoice = Invoice::find($invoiceid);

        if (!$invoice) {
            return response()->json([
                'success' => false,
                'message' => 'Invoice not found'
            ], 404);
        }

        try {
            $invoice->paid_amount = $invoice->amount;
            $invoice->payment_date = date('Y-m-d');
            $invoice->card_type = 'cash';
            $invoice->payment_status = 'paid';
            $invoice->save();

            return response()->json([
                'success' => true,
                'message' => 'Cash Payment completed successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error updating invoice: ' . $e->getMessage()
            ], 500);
        }
    }

    public function bill(Request $request, $invoiceid)
    {
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        $invoice = Invoice::with(
            [
                'Organization:id,Organization_name,owner_name,mobile,email,address',
                'invoice_details.accounthead:id,title'
            ]
        )->where('id', $invoiceid)->first();
        return $invoice;
    }

    public function moneyreceipt(Request $request, $invoiceid)
    {
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }

        $invoice = Invoice::with(
            [
                'Organization:id,Organization_name,owner_name,mobile,email,address',
                'invoice_details.accounthead:id,title'
            ]
        )->where('id', $invoiceid)->first();
        return $invoice;
    }


    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return true;
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
