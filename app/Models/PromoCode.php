<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class PromoCode extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "PromoCode";

    public function getStartDateAttribute($value)
    {
        $regDate = null;
        if ($value) {
            $regDate = date('d M, Y', strtotime($value));
        }

        return $regDate;
    }

    public function getEndDateAttribute($value)
    {
        $regDate = null;
        if ($value) {
            $regDate = date('d M, Y', strtotime($value));
        }

        return $regDate;
    }
    // file image push

    // date format
}
