<?php

namespace App\Traits;

use Exception;
use App\Models\Invoice;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use App\Library\SslCommerz\SslCommerzNotification;

trait PaymentTrait
{

    public function payment($invoice_id, $month = null)
    {
        $invoice = Invoice::with('Organization', 'invoice_details')->find($invoice_id);
        // dd($invoice);
        if (empty($invoice)) {
            return response()->json(['error' => "Sorry Invoice doesn't match our records"], 200);
        }
        $name = $invoice->Organization->Organization_name ?? "";
        $email = $invoice->Organization->email ?? "";
        $phone = $invoice->Organization->mobile ?? "";
        $address = $invoice->Organization->address ?? "";
        $pro = "Organization Subscription";
        $tranID = $invoice->invoice_no;

        $post_data = [];
        $post_data['total_amount'] = ($invoice->amount); # You cant not pay less than 10
        $post_data['currency'] = "BDT";
        $post_data['tran_id'] = $tranID; // tran_id must be unique

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $name ?? '';
        $post_data['cus_email'] = $email ?? '';
        $post_data['cus_add1'] = $address;
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = $phone ?? '';
        $post_data['cus_fax'] = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "Store Test";
        $post_data['ship_add1'] = "Dhaka";
        $post_data['ship_add2'] = "Dhaka";
        $post_data['ship_city'] = "Dhaka";
        $post_data['ship_state'] = "Dhaka";
        $post_data['ship_postcode'] = "1000";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Bangladesh";

        // $post_data['multi_card_name'] = "brac_visa,dbbl_visa,city_visa,ebl_visa,sbl_visa,brac_master,dbbl_master,city_master,ebl_master,sbl_master,city_amex,qcash,dbbl_nexus,bankasia,abbank,ibbl,mtbl,dbblmobilebanking,city,upay,tapnpay,nagad,tap";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = $pro;
        $post_data['product_category'] = "Goods";
        $post_data['product_profile'] = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = "subcription";
        $post_data['value_b'] = $month;
        $post_data['value_c'] = "";
        $post_data['value_d'] = "";

        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'hosted');

        $data = [
            'url' => '',
            'error' => ''
        ];
        if ($payment_options) {
            $data['url'] = $payment_options;
        } else {
            $data['error'] = 'No redirect url found';
        }

        return $data;
    }
}
