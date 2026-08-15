<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use App\Models\Base\BaseModel;

class Product extends BaseModel
{
	protected $table = 'products';
	protected $guarded = ['id'];
	protected $logName = "Product";
	protected $appends = ['original_image', 'image_one', 'image_two', 'meta_tag_indicator', 'meta_description_indicator'];

	protected static function boot()
	{
		parent::boot();
		static::creating(function ($url) {
			$url->slug = Product::createSlug($url->title);
		});
	}
	public static function createSlug($title)
	{
		$slug = Str::slug($title);
		$count = Product::where(['slug' => $slug])->count();
		if ($count > 0) {
			$slug = $slug . $count;
		}

		return $slug;
	}
	public function getRouteKeyName()
	{
		return 'slug';
	}
	// file image push
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
		$imageOnePath = getJsonMediaUrl($this->image, 0);
		if (!empty($imageOnePath)) {
			$file = strstr($imageOnePath, 'upload/');
			if (Storage::disk('public')->exists($file)) {
				return $imageOnePath;
			}
			return null;
		}
	}

	public function getImageTwoAttribute()
	{
		$imageTwoPath = getJsonMediaUrl($this->image, 1);
		if (!empty($imageTwoPath)) {
			$file = strstr($imageTwoPath, 'upload/');
			if (Storage::disk('public')->exists($file)) {
				return $imageTwoPath;
			}
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

	public function setStartDateAttribute($value)
	{
		$this->attributes['start_date'] = convertToDatabaseDate($value);
	}

	public function getStartDateAttribute($value)
	{
		return date('d M, Y', strtotime($value));
	}

	public function setEndDateAttribute($value)
	{
		if (empty($value) || strtolower($value) === 'undefined') {
			$this->attributes['end_date'] = null;
		} else {
			$this->attributes['end_date'] = convertToDatabaseDate($value);
		}
	}

	public function getEndDateAttribute($value)
	{
		return !empty($value)
			? date('d M, Y', strtotime($value))
			: '';
	}
	public function category()
	{
		return $this->belongsTo(Category::class, 'category_id', 'id');
	}

	public function getPdfAttribute($value)
	{
		if ($value) {
			return Storage::url($value);
		}
		return  $value;
	}
}
