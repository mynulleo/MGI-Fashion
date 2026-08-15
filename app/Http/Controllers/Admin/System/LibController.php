<?php

namespace App\Http\Controllers\Admin\System;

use App\Http\Controllers\Controller;
use App\Models\AccountHead;
use App\Models\Contacts;
use App\Models\Project;
use App\Models\Package;
use App\Models\System\Menu;
use App\Models\Website\Gallery\Slider;
use Illuminate\Support\Facades\App;

class LibController extends Controller
{
    private $variable = [];

    private function index()
    {
        return [
            'variable' => $this->variable,
            'app_env' => config("app.env"),
            'notify_contacts' => $this->notifyContacts(),
            'profile_menus' => $this->profileMenus(),
            'packages' => $this->getPackages(),
            'account_heads' => $this->getAccountHead(),
            'payment_status' => $this->getPaymentStatus(),
            'projects' => $this->getProjects(),
            'template_types' => $this->getTemplateType(),
            'roles' => $this->getRoles(),
        ];
    }

    /**
     * Initialize date of system
     *
     * @return array
     */
    public function systems()
    {

        return [
            'global' => $this->index(),
            'permissions' => App::make('premitedMenuArr'),
            'site' => App::make('siteSettingObj'),
            'menus' => App::make('sideMenus'),
            'sliderPosition' => $this->sliderPostionList(),
            'sliderLists' => Slider::get(),
            'sliderButtonTypes' => $this->sliderButtonTypes(),
            'categoriesModuleNames' => $this->categoriesModuleNames(),
            'user' => auth('admin')->user(),
        ];
    }

    /**
     * Get latest five contact message for notification message bar
     *
     * @return App\Models\Contacts
     */
    public function notifyContacts()
    {
        return Contacts::active()
            ->latest()
            ->take(5)
            ->get(['id', 'name', 'subject', 'created_at']);
    }

    public function profileMenus()
    {
        return Menu::where('show_profile', 1)
            ->oldest('sorting')
            ->get(['icon', 'menu_name', 'route_name', 'params']);
    }

    /**
     * Slider button lists
     *
     * @return array
     */
    public function sliderButtonTypes()
    {
        return [
            'Inside',
            'Outside',
        ];
    }

    /**
     * Slider position list
     *
     * @return array
     */
    public function sliderPostionList()
    {
        return [
            'Header',
            'Footer',
        ];
    }

    public function getTemplateType()
    {
        return [
            ['name' => 'Email', 'value' => 'Email'],
            ['name' => 'SMS', 'value' => 'SMS'],
        ];
    }

    public function getRoles()
    {
        return [
            ['name' => 'Administrator', 'value' => 1],
            ['name' => 'System Admin', 'value' => 2],
            ['name' => 'Owner', 'value' => 8],
            ['name' => 'Manager', 'value' => 9],
            ['name' => 'Accounts', 'value' => 10],
            ['name' => 'Operator', 'value' => 11],
        ];
    }

    /**
     * Member designation type
     *
     * @return array
     */
    public function categoriesModuleNames()
    {
        return [
            // ['name' => 'Notice', 'value' => 'Notice'],
            ['name' => 'Product', 'value' => 'Product'],
        ];
    }

    public function getPaymentStatus()
    {
        return [
            ['name' => 'Paid', 'value' => 'paid'],
            ['name' => 'Unpaid', 'value' => 'unpaid'],
        ];
    }

    /**
     * Get Current environment
     *
     * @return string
     */
    public function environment()
    {

        $currentUrl = url()->current();

        if (
            str_contains($currentUrl, 'localhost')
            || str_contains($currentUrl, '127.0.0.1')
            || str_contains($currentUrl, '192.168.')
            || str_contains($currentUrl, '103.169.160.21')
        ) {
            return 'local';
        } else {
            return 'production';
        }
    }

    public function getPackages()
    {
        return Package::where('status', 'active')->get(['id', 'title']);
    }

    public function getAccountHead()
    {
        return AccountHead::where('status', 'active')->get(['id', 'title']);
    }

    public function getProjects()
    {
        return Project::where('status', 'active')->where('enable_login_system', 1)->get(['id', 'title']);
    }
}
