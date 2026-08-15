<?php

use App\Helpers\GlobalHelper;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\RobotController;
use App\Http\Controllers\Admin\Support\SupportController;
use App\Http\Controllers\Admin\System\ModuleController;
use App\Http\Controllers\Admin\ThemeController;
use Illuminate\Support\Facades\Route;

// Backend Route...
Route::group(['prefix' => 'backend', 'as' => 'backend.'], function () {

    // Auth Route...
    Route::post('forget', [App\Http\Controllers\Auth\AdminLoginController::class, 'forget'])->name('forget');
    Route::any('password-reset', [App\Http\Controllers\Auth\AdminLoginController::class, 'reset'])->name('reset');
});

// Authorized Route...
Route::group(['middleware' => 'auth:admin'], function () {

    // Support Route...
    Route::get('support/countries', [SupportController::class, 'countries']);
    Route::get('support/page', [SupportController::class, 'page']);
    Route::get('get-modules', [ModuleController::class, 'getModules']);

    Route::get('/frontend-routes', function () {
        return response()->json(GlobalHelper::getAllRouteNames());
    });

    // Custom Pagination Example Route...
    Route::get('custom/pagination', [ProfileController::class, 'news']);

    // Sitemap Route...
    Route::get('sitemap-data', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'sitemapData'])->name('sitemapData');

    // Auth Route...
    Route::post('logout', [App\Http\Controllers\Auth\AdminLoginController::class, 'logout'])->name('logout');

    // Systems Route...
    Route::get('systems-update', [App\Http\Controllers\Admin\System\RoleController::class, 'systemsRoleUpdate']);
    Route::get('get-permissions', [App\Http\Controllers\Admin\System\RoleController::class, 'getPermissions']);
    Route::get('get-menus/{any?}', [App\Http\Controllers\Admin\System\MenuController::class, 'menus']);
    Route::get('initialize-systems', [App\Http\Controllers\Admin\System\LibController::class, 'systems']);
    Route::get('sync-active-theme', [ThemeController::class, 'syncActiveTheme'])->name('syncActiveTheme');




    // Category Route...
    Route::get('get-category/{type}', [App\Http\Controllers\Admin\CategoryController::class, 'getCategory']);
    Route::get('Organizationinfo/{saasno}', [App\Http\Controllers\Admin\OrganizationController::class, 'Organizationinfo']);
    Route::get('paynow/{invoiceid}', [App\Http\Controllers\Admin\InvoiceController::class, 'paynow']);

    // Admin Route...
    Route::post('check-old-password', [App\Http\Controllers\Admin\AdminController::class, 'checkOldPassword']);
    Route::post('change-password', [App\Http\Controllers\Admin\AdminController::class, 'passwordChange']);
    Route::get('get-dashboard-menus', [App\Http\Controllers\Admin\System\MenuController::class, 'dashboardMenu']);

    // Module Route...
    Route::view('module', 'admin.layouts.admin_app')->name('module.index');
    Route::get('module/check-model', [App\Http\Controllers\Admin\System\ModuleController::class, 'checkModel']);

    // Table Route...
    Route::get('table-sorting', [App\Http\Controllers\Base\SortingController::class, 'sorting']);
    Route::get('get-last-sorting', [App\Http\Controllers\Base\SortingController::class, 'lastSorting']);

    // Menu Route...
    Route::get('parent-menus', [App\Http\Controllers\Admin\Website\FrontMenuController::class, 'getParentMenu']);
    Route::get('get-content', [App\Http\Controllers\Admin\Website\ContentController::class, 'index']);
    Route::get('get-album/{type}', [App\Http\Controllers\Admin\Website\Gallery\AlbumController::class, 'album']);
    Route::get('module-delete', [App\Http\Controllers\Admin\System\ModuleController::class, 'moduleDelete'])->name('module.delete');

    // Slider Route...
    Route::get('slider-height-width/{id}', [App\Http\Controllers\Admin\Website\Gallery\SliderDetailsController::class, 'heightWidth']);

    Route::get('backend-parent-menus', [App\Http\Controllers\Admin\System\MenuController::class, 'getParentMenu'])->name('backendParentMenu');
    Route::get('/getcategory', [App\Http\Controllers\Admin\ProductController::class, 'getcategory'])->name('getcategory');

    // User Permission Based Routing...
    Route::middleware('auth.access')->group(function () {

        // Dashboard Route...
        Route::get('dashboard', [App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('dashboard.index');

        // Content Route...
        Route::get('content', [App\Http\Controllers\Admin\Website\ContentController::class, 'index'])->name('content.index');
        Route::post('content', [App\Http\Controllers\Admin\Website\ContentController::class, 'store'])->name('content.store');
        Route::get('content/create', [App\Http\Controllers\Admin\Website\ContentController::class, 'create'])->name('content.create');
        Route::get('content/{id}', [App\Http\Controllers\Admin\Website\ContentController::class, 'show'])->name('content.show');
        Route::get('content/{id}/edit', [App\Http\Controllers\Admin\Website\ContentController::class, 'edit'])->name('content.edit');
        Route::get('content-file/{slug}', [App\Http\Controllers\Admin\Website\ContentController::class, 'file'])->name('content.file');
        Route::post('content-file/{content}', [App\Http\Controllers\Admin\Website\ContentController::class, 'storeFile'])->name('content.storeFile');
        Route::delete('content/{id}', [App\Http\Controllers\Admin\Website\ContentController::class, 'destroy'])->name('content.destroy');

        // Profile route
        Route::get('profile', [AdminController::class, 'profileDetails'])->name('profile.profileDetails');
        Route::put('profile', [AdminController::class, 'updateProfile'])->name('profile.updateProfile');

        // Frontend Route...
        Route::resource('album', App\Http\Controllers\Admin\Website\Gallery\AlbumController::class);
        Route::resource('photo', App\Http\Controllers\Admin\Website\Gallery\PhotoController::class);
        Route::resource('video', App\Http\Controllers\Admin\Website\Gallery\VideoController::class);
        Route::resource('slider', App\Http\Controllers\Admin\Website\Gallery\SliderController::class);
        Route::resource('frontMenu', App\Http\Controllers\Admin\Website\FrontMenuController::class);
        Route::resource('news', App\Http\Controllers\Admin\Website\NewsController::class);
        Route::resource('notice', App\Http\Controllers\Admin\Website\NoticeController::class);
        Route::resource('category', App\Http\Controllers\Admin\CategoryController::class);
        Route::resource('contacts', App\Http\Controllers\Admin\ContactsController::class);
        Route::resource('faq', App\Http\Controllers\Admin\FaqController::class);
        Route::resource('product', App\Http\Controllers\Admin\ProductController::class);
        Route::resource('project', App\Http\Controllers\Admin\ProductController::class);
        // Slider Details Route...
        Route::resource('slider-details', App\Http\Controllers\Admin\Website\Gallery\SliderDetailsController::class);

        // Module Route...
        Route::match(['get', 'post'], 'module/create', [App\Http\Controllers\Admin\System\ModuleController::class, 'create'])->name('module.create');

        // Activity Log Route...
        Route::get('activityLog', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'index'])->name('activityLog.index');
        Route::get('activityLog/{id}', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'show'])->name('activityLog.show');
        Route::get('allRead', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'allRead'])->name('activityLog.allRead');
        Route::delete('activityLog/{id}', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'destroy'])->name('activityLog.destroy');
        Route::post('activityLog/{activity}/restore', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'restore'])->name('activityLog.restore');

        // Admin Route...
        Route::resource('role', App\Http\Controllers\Admin\System\RoleController::class);
        Route::resource('menu', App\Http\Controllers\Admin\System\MenuController::class);

        Route::get('siteSetting', [App\Http\Controllers\Admin\System\SiteSettingController::class, 'show'])->name('siteSetting.show');
        Route::post('siteSetting', [App\Http\Controllers\Admin\System\SiteSettingController::class, 'store'])->name('siteSetting.store');
        Route::get('siteSetting/edit', [App\Http\Controllers\Admin\System\SiteSettingController::class, 'edit'])->name('siteSetting.store');

        Route::resource('admin', App\Http\Controllers\Admin\AdminController::class);
        // Route::resource('plugin', App\Http\Controllers\Admin\PluginController::class);

        Route::resource('page', App\Http\Controllers\Admin\PageController::class);
        Route::resource('pageSeo', App\Http\Controllers\Admin\PageSeoController::class);
        Route::resource('pageSection', App\Http\Controllers\Admin\PageSectionController::class);

        // robot txt
        Route::get('/robots', [App\Http\Controllers\Admin\RobotController::class, 'index'])->name('robots.index');
        Route::get('robots-file', [App\Http\Controllers\Admin\RobotController::class, 'getfilecontent'])->name('robots.getfilecontent');
        Route::post('robots-file', [RobotController::class, 'savefilecontent'])->name('robots.savefilecontent');

        // for xml
        Route::get('/searchData', [App\Http\Controllers\Admin\XMLController::class, 'index'])->name('searchData.index');

        Route::get('/generate-xml', [App\Http\Controllers\Admin\XMLController::class, 'generateXmlFile'])->name('searchData.generateXmlFile');
        Route::get('/xml-file', [App\Http\Controllers\Admin\XMLController::class, 'getXmlFile'])->name('searchData.getXmlFile');
        Route::get('/get-broken-url', [App\Http\Controllers\Admin\XMLController::class, 'getBrokenUrl'])->name('searchData.getBrokenUrl');

        Route::resource('mediaValidator', App\Http\Controllers\Admin\MediaValidatorController::class);
        Route::resource('helpInfo', App\Http\Controllers\Admin\HelpInfoController::class);

        Route::resource('theme', App\Http\Controllers\Admin\ThemeController::class);
        Route::resource('service', App\Http\Controllers\Admin\ServiceController::class);

        Route::resource('testimonial', App\Http\Controllers\Admin\TestimonialController::class);
        Route::resource('organization', App\Http\Controllers\Admin\OrganizationController::class);
        Route::resource('package', App\Http\Controllers\Admin\PackageController::class);
        Route::resource('invoice', App\Http\Controllers\Admin\InvoiceController::class);
        Route::resource('accountHead', App\Http\Controllers\Admin\AccountHeadController::class);
        Route::resource('feature', App\Http\Controllers\Admin\FeatureController::class);
        Route::resource('promoCode', App\Http\Controllers\Admin\PromoCodeController::class);
        Route::resource('template', App\Http\Controllers\Admin\TemplateController::class);
        Route::resource('emailHistory', App\Http\Controllers\Admin\EmailHistoryController::class);

        // Resident Approval & Actions Start
        Route::post('organization-approved', [App\Http\Controllers\Admin\OrganizationController::class, 'approval'])->name('organization.approval');
        Route::post('organization/block', [App\Http\Controllers\Admin\OrganizationController::class, 'block'])->name('organization.block');
        Route::post('organization/unblock', [App\Http\Controllers\Admin\OrganizationController::class, 'unblock'])->name('organization.unblock');
        Route::post('organization/updatedb', [App\Http\Controllers\Admin\OrganizationController::class, 'updatedb'])->name('organization.updatedb');
        Route::post('organization/newuser', [App\Http\Controllers\Admin\OrganizationController::class, 'newuser'])->name('organization.newuser');
        Route::post('organization/changepass', [App\Http\Controllers\Admin\OrganizationController::class, 'changepass'])->name('organization.changepass');

        // invoice extra action
        Route::get('invoice/bill/{id}', [App\Http\Controllers\Admin\InvoiceController::class, 'bill'])->name('invoice.bill');
        Route::get('invoice/moneyreceipt/{id}', [App\Http\Controllers\Admin\InvoiceController::class, 'moneyreceipt'])->name('invoice.moneyreceipt');

        // Resident Approval & Actions Start

    });
    Route::get('mediaValidator/{modelName}/getFields', [App\Http\Controllers\Admin\MediaValidatorController::class, 'getFields'])->name('mediaValidator.getFields');
    Route::get('helpInfo/{modelName}/{pageType}/', [App\Http\Controllers\Admin\HelpInfoController::class, 'getHelpInfo'])->name('get.HelpInfo');
});
