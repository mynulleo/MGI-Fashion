<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class InvoiceDetails extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "InvoiceDetails";

    // file image push
    public function accounthead()
    {
        return $this->belongsTo(AccountHead::class, 'account_head_id');
    }

    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }

    // date format
}
