<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use Illuminate\Support\Str;
use App\Models\Base\BaseModel;
use Illuminate\Support\Facades\Storage;


class Service extends BaseModel
{
	protected $guarded = ['id'];
	protected $logName = "Service";
	protected $appends = ['original_image', 'image_one', 'original_image_small', 'image_small_one', 'meta_tag_indicator', 'meta_description_indicator'];


	protected static function boot()
	{
		parent::boot();
		static::creating(function ($url) {
			$url->slug = Service::createSlug($url->title);
		});
	}
	public static function createSlug($name)
	{
		$slug = Str::slug($name);
		$count = Service::where(['slug' => $slug])->count();
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
	public function setImageSmallAttribute($value)
	{
		if (!is_string($value)) {
			$this->attributes['image_small'] = json_encode($value);
		} else {
			$this->attributes['image_small'] = $value;
		}
	}

	public function getOriginalImageSmallAttribute()
	{
		$image_small = json_decode($this->image_small, true);

		if ($image_small) {

			$image_small = $image_small['original'] ?? null;

			return !empty($image_small) ? url('/') . '/public/storage/' . $image_small : null;
		}
	}

	public function getImageSmallOneAttribute()
	{
		// return getJsonMediaUrl($this->image, 0);
		$imagesmallOnePath = getJsonMediaUrl($this->image_small, 0);
		if (!empty($imagesmallOnePath)) {
			$file = strstr($imagesmallOnePath, 'upload/');
			if (Storage::disk('public')->exists($file)) {
				return $imagesmallOnePath;
			}
			// return emptyImage();
			return null;
		}
	}

	public function setMetaTagAttribute($value)
	{
		$this->attributes['meta_tag'] = is_array($value) ? json_encode($value) : $value;
	}

	public function getMetaTagAttribute($value)
	{
		return json_decode($value, true) ?? [];
	}

	public function getMetaTagIndicatorAttribute()
	{
		if (count($this->meta_tag) > 0) {
			return "<center><span style='color: green;'>&#10003;</span></center>";  // Green checkmark
		} else {
			return "<center><span style='color: red;'>&#x2717;</span></center>";    // Red cross
		}
	}

	public function getMetaDescriptionIndicatorAttribute()
	{
		if (!empty($this->meta_description)) {
			return "<center><span style='color: green;'>&#10003;</span></center>";  // Green checkmark
		} else {
			return "<center><span style='color: red;'>&#x2717;</span></center>";    // Red cross
		}
	}




	// date format
}
