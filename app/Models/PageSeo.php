<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Support\Facades\Storage;

class PageSeo extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "PageSeo";
    protected $appends = ['original_image', 'image_one', 'image_two', 'image_three'];

    public function getMetaTagAttribute($value)
    {
        return $value ? json_decode($value) : null;
    }

    public function setImageAttribute($value)
    {
        if (!is_string($value)) {
            $this->attributes['image'] = json_encode($value);
        } else {
            $this->attributes['image'] = $value;
        }
    }

    public function getOriginalImageAttribute()
    {
        $image = json_decode($this->image, true);

        if ($image) {

            $image = $image['original'] ?? null;

            return !empty($image) ? url('/') . '/public/storage/' . $image : null;
        }
    }
    public function getImageOneAttribute()
    {
        return getJsonMediaUrl($this->image, 0);
    }

    public function getImageTwoAttribute()
    {
        return getJsonMediaUrl($this->image, 1);
    }
    public function getImageThreeAttribute()
    {
        return getJsonMediaUrl($this->image, 2);
    }

    public function page()
    {
        return $this->belongsTo(Page::class, 'page_id', 'id');
    }
}
