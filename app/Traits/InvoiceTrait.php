<?php

namespace App\Traits;

use Exception;
use App\Models\Invoice;
use App\Models\PromoCode;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

trait InvoiceTrait
{

    /**
     * Create invoice with details (minimal data)
     *
     * @param array $data
     * @return int $invoiceId
     */
    public function createInvoice(array $data)
    {
        DB::beginTransaction();

        try {
            $promocode = $data['promo_code'];
            $original_amount = $data['amount'];
            $amount = $data['amount'];
            $discount = 0;
            $invoiceId = null;

            if ($promocode) {
                $discount = $this->getPromoDiscount($promocode, $data['amount']);
            }

            if ($discount > 0) {
                $amount = ($original_amount - $discount);
            }

            if ($amount > 0) {

                // ✅ Generate invoice_no
                $invoiceNo = Invoice::generateInvoiceNumber();
                // ✅ Insert main invoice
                $invoiceId = DB::table('invoices')->insertGetId([
                    'organization_id'      => $data['organization_id'],
                    'invoice_no'        => $invoiceNo,
                    'invoice_date'      => now()->toDateString(),
                    'original_amount'   => $original_amount,
                    'discount'          => $discount,
                    'amount'            => $amount,
                    'promo_code'        => $data['promo_code'],
                    'payment_status'    => 'unpaid',
                    'status'            => 'active',
                    'created_at'        => now(),
                    'updated_at'        => now(),
                ]);

                // ✅ Insert invoice_details
                DB::table('invoice_details')->insert([
                    'invoice_id'      => $invoiceId,
                    'account_head_id' => $data['account_head_id'],
                    'amount'          => $data['amount'],
                    'status'          => 'active',
                    'created_at'      => now(),
                    'updated_at'      => now()
                ]);
            }

            DB::commit();
            return $invoiceId;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function getPromoDiscount($promocode, $amount)
    {
        $today = date('Y-m-d');
        $discount_amount =  0;
        $data = PromoCode::where('code', $promocode)
            ->where('start_date', '<=', $today)
            ->where('end_date', '>=', $today)
            ->where('status', 'active')
            ->first();


        if ($data) {
            if ($data->percentage !== null && $data->percentage > 0) {
                $discount_amount = round(($data->percentage * $amount) / 100, 2);
            } elseif ($data->amount !== null && $data->amount > 0) {
                $discount_amount = $data->amount;
            }
        }
        return $discount_amount;
    }
}
