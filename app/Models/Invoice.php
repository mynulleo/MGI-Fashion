<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Invoice extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "Invoice";

    // file image push
    public static function generateInvoiceNumber()
    {
        $invoiceno = 111;
        // invoices টেবিল থেকে সর্বশেষ ইনভয়েস নাম্বার বের করা
        $lastInvoice = self::orderBy('id', 'desc')->first();
        if ($lastInvoice) {
            // last invoice number integer এ কনভার্ট
            $lastNumber = intval($lastInvoice->invoice_no);
            // ১ যোগ করে নতুন নাম্বার রিটার্ন করা
            $invoiceno =  $lastNumber + 1;
        }
        return $invoiceno;
    }
    // date format

    public function organization()
    {
        return $this->belongsTo(Organization::class);
    }

    public function invoice_details()
    {
        return $this->hasMany(InvoiceDetails::class, 'invoice_id', 'id')->oldest('id');
    }

    /* payment success status update */
    public static function paymentSuccess($request)
    {
        $invArr = Invoice::where('invoice_no', $request->tran_id)->first();
        $organization_id = $invArr->organization_id;
        $month_duration = $request->value_b;

        // -----------invoice update------------
        $data['payment_status']   = 'paid';
        $data['trxid']            = $request->bank_tran_id ?? "";
        $data['card_type']        = $request->card_type ?? "";
        $data['payment_date']     = date('Y-m-d');
        $data['paid_amount']      = $invArr->amount ?? "";
        $res =  $invArr->update($data);

        return true;
    }
}
