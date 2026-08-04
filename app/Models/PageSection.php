<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PageSection extends BaseModel
{
    protected $guarded = ['id'];
    protected $appends = ['original_image', 'image_one', 'image_two', 'image_three'];
    protected $logName = "PageSection";

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($url) {
            $url->slug = PageSection::createSlug($url->title);
        });
    }

    private static function createSlug($name)
    {
        $slug = Str::slug($name);
        $count = PageSection::where(['slug' => $slug])->count();
        if ($count > 0) {
            $slug = $slug . $count;
        }

        return $slug;
    }
    /* public function getIconAttribute($value)
    {
    if (!empty($value)) {
    return url(path: "") . "/public/storage/" . $value;
    }
    return null;
    } */
    /* public function getIconAttribute($value)
    {
        if (!empty($value)) {
            $iconPath = url('public/storage/' . $value);
            $file = 'public/' . $value;
            if (Storage::disk('public')->exists($file)) {
                return $iconPath;
            }else{
                return "no_server_image";
            }
        }
        return null;
    } */

    public function setImageAttribute($value)
    {
        if (!is_string($value)) {
            $this->attributes['image'] = json_encode($value);
        } else {
            $this->attributes['image'] = $value;
        }
    }

    /* public function getImageThumbAttribute()
    {
    $images = (array) json_decode($this->image);
    if (count($images) > 0) {
    $image = $images['200x200'] ?? null;
    return !empty($image) ? url('/') . '/public/storage/' . $image : null;
    }
    } */

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
        return $this->belongsTo(Page::class, 'page_id');
    }
}
