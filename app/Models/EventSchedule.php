<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\ParentModel;

class EventSchedule extends ParentModel
{
    protected $guarded = ['id'];

    protected $logName = 'EventSchedule';
    public function getScheduleDateAttribute($value)
    {
        return $value ? date('d M, Y', strtotime($value)) : null;
    }
}
