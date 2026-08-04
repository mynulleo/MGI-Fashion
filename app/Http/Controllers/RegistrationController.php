<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Package;
use App\Traits\SMSTrait;
use App\Models\PromoCode;
use App\Models\Organization;
use App\Traits\InvoiceTrait;
use App\Traits\PaymentTrait;
use Illuminate\Http\Request;
use App\Traits\SMSTraitTrait;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Mail;

class RegistrationController extends Controller
{
    use InvoiceTrait, PaymentTrait, SMSTrait;

    public function registration(Request $request)
    {
        $package_id = null;
        $period = null;
        $data = $request->all();
        $today = date('Y-m-d');

        $packages = Package::where('status', 'active')
            ->where('display_web', 1)
            ->get();
        $promocode = PromoCode::where('start_date', '<=', $today)
            ->where('end_date', '>=', $today)
            ->where('status', 'active')
            ->exists();
        if ($data) {
            $package_id = $data['package'];
            $period = $data['payment_period'];
        }
        return view(
            themeBlade('pages.registration'),
            [
                'package_id' => $package_id,
                'period' => $period,
                'packages' => $packages,
                'promocode' => $promocode
            ]
        );
    }

    public function store(Request $request)
    {
        // ✅ ভ্যালিডেশন কল
        $this->validateOrganization($request);

        // ✅ সর্বশেষ saasno বের করা
        $lastOrganization = Organization::orderBy('id', 'desc')->first();
        $newsaasno = $lastOrganization ? $lastOrganization->saasno + 1 : 111;

        // ✅ নতুন Organization তৈরি
        $organization = new Organization();
        $organization->saasno     = $newsaasno;
        $organization->Organization_name  = $request->Organization_name;
        $organization->owner_name      = $request->owner_name;
        $organization->nid             = $request->nid;
        $organization->email           = $request->email;
        $organization->mobile          = $request->mobile;
        $organization->address         = $request->address;
        $organization->package_id      = $request->package_id; // ✅ প্যাকেজ আইডি যোগ
        $organization->payment_period  = $request->payment_period;
        $organization->promo_code      = $request->promo_code;
        $organization->reg_date        = Carbon::now()->format('Y-m-d');

        if ($organization->save()) {
            $organization_id = $organization->id;
            $account_head_id = 2;
            $package_amount  = Package::getPackageAmount($request->package_id, $request->payment_period, 'registration');
            $invoicedata = [
                'organization_id'    => $organization_id,
                'account_head_id' => $account_head_id,
                'amount'          => $package_amount,
                'promo_code'      => $request->promo_code
            ];
            $invoiceid = $this->createInvoice($invoicedata);

            $mail = Mail::send(themeBlade('mail.registration'), ['name' => $request->owner_name], function ($message) use ($request) {
                $message->to($request->email)
                    ->subject('BD Organization এ আপনার রেজিস্ট্রেশন সফল হয়েছে!');
            });

            if ($invoiceid) {
                // ssl payment
                $payment = $this->payment($invoiceid);

                if (!empty($payment['url'])) {
                    return redirect()->away($payment['url']);
                }
            }

            $site = App::make('siteSettingObj');
            $sms = "BD Organization: New user registered - " . $organization->Organization_name . " (" . $organization->mobile . "). Please check admin dashboard.";
            $this->sendSms($site->mobile1, $sms);

            return redirect()->back()->with('success', '🎉 রেজিস্ট্রেশন সফলভাবে সম্পন্ন হয়েছে। আমাদের টিম আপনার জন্য সফটওয়্যার কনফিগার করবে। ২৪ ঘণ্টার মধ্যে আপনি একটি ইমেইল
                                            পাবেন যেখানে আপনার সফটওয়্যারের URL এবং লগইন ক্রেডেনশিয়াল পাঠানো হবে।');
        }

        return redirect()->back()->with('error', '🎉 রেজিস্ট্রেশন সফলভাবে সম্পন্ন হয়েছে। কিন্তু পেমেন্টে সম্যসা হয়েছে, অনুগ্রহপুরর্বক সাপোর্ট টিম এর সাথে যোগাযোগ করুন।');
    }



    /**
     * Organization ভ্যালিডেশন
     */
    private function validateOrganization(Request $request)
    {
        $today = date('Y-m-d');
        $request->validate([
            'Organization_name' => 'required|string|max:255',
            'owner_name'     => 'required|string|max:255',
            'nid'            => 'required|string|max:50|unique:Organizations,nid',
            'email'          => 'required|email|unique:Organizations,email',
            'mobile'         => [
                'required',
                'size:11',              // ঠিক 11 সংখ্যা
                'regex:/^0[0-9]{10}$/', // প্রথম সংখ্যা 0, বাকি 10 সংখ্যা 0-9
            ],
            'address'        => 'required|string',
            'payment_period' => 'required',
            'package_id'     => 'required|exists:packages,id',
            'promo_code'     => [
                'nullable',
                function ($attribute, $value, $fail) use ($today) {
                    if ($value) {
                        $isValid = PromoCode::where('code', $value)
                            ->where('start_date', '<=', $today)
                            ->where('end_date', '>=', $today)
                            ->where('status', 'active')
                            ->exists();

                        if (!$isValid) {
                            $fail('আপনার প্রোমো কোডটি সঠিক নয় বা মেয়াদোত্তীর্ণ।');
                        }
                    }
                },
            ],
        ], [
            'Organization_name.required' => 'বাসস্থানের নাম অবশ্যই দিতে হবে।',
            'owner_name.required'     => 'মালিকের নাম অবশ্যই দিতে হবে।',
            'nid.required'            => 'জাতীয় পরিচয়পত্র নম্বর দিতে হবে।',
            'nid.unique'              => 'এই জাতীয় পরিচয়পত্র নম্বর ইতিমধ্যে ব্যবহার করা হয়েছে।',
            'email.required'          => 'ই-মেইল ঠিকানা দিতে হবে।',
            'email.email'             => 'সঠিক ই-মেইল ঠিকানা দিন।',
            'email.unique'            => 'এই ই-মেইল ইতিমধ্যে ব্যবহার করা হয়েছে।',
            'mobile.required'         => 'মোবাইল নম্বর দিতে হবে।',
            'mobile.size'             => 'মোবাইল নম্বর অবশ্যই 11 সংখ্যা হতে হবে।',
            'mobile.regex'            => 'মোবাইল নম্বর অবশ্যই 0 দিয়ে শুরু হতে হবে এবং শুধুমাত্র সংখ্যা থাকতে হবে।',
            'address.required'        => 'ঠিকানা দিতে হবে।',
            'payment_period.required' => 'প্যাকেজ পিরিওড নির্বাচন করতে হবে।',
            'package_id.required'     => 'একটি প্যাকেজ নির্বাচন করতে হবে।',
            'package_id.exists'       => 'সঠিক প্যাকেজ আইডি দিন।',
            'promo_code.exists'       => 'আপনার প্রোমো কোডটি সঠিক নয়।',
        ]);
    }
}
