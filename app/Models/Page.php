<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Page extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "Page";

    public function pageSections()
    {
        return $this->hasMany(PageSection::class, 'page_id');
    }
}
