<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

use App\Models\Base\BaseModel;

class Testimonial extends BaseModel
{
	protected $guarded = ['id'];

	protected $logName = "Testimonial";
	protected $appends = ['original_image', 'image_one'];


	// file image push
	protected static function boot()
	{
		parent::boot();
		static::creating(function ($url) {
			$url->slug = Testimonial::createSlug($url->name);
		});
	}
	public static function createSlug($name)
	{
		$slug = Str::slug($name);
		$count = Testimonial::where(['slug' => $slug])->count();
		if ($count > 0) {
			$slug = $slug . $count;
		}

		return $slug;
	}
	public function getRouteKeyName()
	{
		return 'slug';
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
		// return getJsonMediaUrl($this->image, 0);
		$imageOnePath = getJsonMediaUrl($this->image, 0);
		if (!empty($imageOnePath)) {
			$file = strstr($imageOnePath, 'upload/');
			if (Storage::disk('public')->exists($file)) {
				return $imageOnePath;
			}
			// return emptyImage();
			return null;
		}
	}
	// date format
}
