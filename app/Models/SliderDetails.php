<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Support\Facades\Storage;

class SliderDetails extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = 'SliderDetails';

    protected $appends = ['original_image', 'thumb_one'];

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

            return !empty($image) ? Storage::url($image) : null;
        }
    }

    public function getThumbOneAttribute()
    {
        $image = json_decode($this->image, true);
        if ($image) {
            $image = $image['200x200'] ?? null;

            return !empty($image) ? Storage::url($image) : null;
        }
    }
    public function slider()
    {
        return $this->belongsTo(SliderDetails::class, 'slider_id');
    }
}
