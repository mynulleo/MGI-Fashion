<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Package extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "Package";

    // file image push

    public function getStartDateAttribute($value)
    {
        $startDate = null;
        if ($value) {
            $startDate = date('d M, Y', strtotime($value));
        }

        return $startDate;
    }

    public function getSmsAttribute($value)
    {
        return $value ? 1 : 0;
    }

    public function getScheduleInvoiceAttribute($value)
    {
        return $value ? 1 : 0;
    }

    public function getRemainderSmsAttribute($value)
    {
        return $value ? 1 : 0;
    }

    public function getDisplayWebAttribute($value)
    {
        return $value ? 1 : 0;
    }


    public static function getPackageAmount($package_id, $period, $field)
    {
        $amount = 0;
        $package = Package::where('id', $package_id)
            ->where('status', 'active')
            ->first();

        if ($package && $field == 'registration') {
            $amount = $package['registration_fee'];
        }

        if ($package && $field == 'renew') {
            $amount = $package->price;
            if ($period == 'yearly') {
                $amount = $package->yearly_price;
            }
        }
        return $amount;
    }

    // date format
}
