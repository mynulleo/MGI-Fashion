<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use Illuminate\Support\Str;
use App\Models\Base\BaseModel;

class Category extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = 'Category';

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($category) {
            if (empty($category->slug) && !empty($category->title)) {
                $category->slug = static::createSlug($category->title);
            }
        });
        static::updating(function ($category) {
            if (empty($category->slug) && !empty($category->title)) {
                $category->slug = static::createSlug($category->title, $category->id);
            }
        });
    }

    public static function createSlug($title, $id = 0)
    {
        $slug = Str::slug($title);
        $count = static::where('slug', $slug)->where('id', '!=', $id)->count();
        if ($count > 0) {
            $slug = $slug . '-' . ($count + 1);
        }

        return $slug;
    }

    function projects()
    {
        return $this->hasMany(Project::class);
    }

    function products()
    {
        return $this->hasMany(Product::class);
    }
}
