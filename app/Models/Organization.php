<?php

/**
 * @Quill Information Technology
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Organization extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "Organization";

    public function getRegDateAttribute($value)
    {
        $regDate = null;
        if ($value) {
            $regDate = date('d M, Y', strtotime($value));
        }

        return $regDate;
    }

    public function getExpiredDateAttribute($value)
    {
        $expireDate = null;
        if ($value) {
            $expireDate = date('d M, Y', strtotime($value));
        }

        return $expireDate;
    }

    public static function generatesaasno()
    {
        $organizationno = 111;
        $organization = Organization::latest()->first(['id', 'saasno']);
        if ($organization) {
            $organizationno = $organization->saasno + 1;
        }

        return $organizationno;
    }

    // file image push

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }

    public function invoice()
    {
        return $this->hasMany(Invoice::class);
    }

    public function organization_users()
    {
        return $this->hasMany(OrganizationUser::class);
    }

    // date format
}
