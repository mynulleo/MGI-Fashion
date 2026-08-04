<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Contacts extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = 'Contacts';

    protected $appends = ['created_time'];

    public function getCreatedTimeAttribute()
    {
        return $this->created_at ? $this->created_at->format('d M, Y') : null;
    }
}
