<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Theme extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "Theme";

    protected $fillable = ['title', 'slug', 'sorting', 'status'];
}
