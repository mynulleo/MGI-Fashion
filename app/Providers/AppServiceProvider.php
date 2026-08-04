<?php

namespace App\Providers;

use App\Action\Util\DeleteAction;
use App\Models\Feature;
use App\Models\Website\FrontMenu;
use App\Models\System\SiteSetting;
use App\Models\Website\News;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Schema\Blueprint;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('deleteAction', function ($app) {
            return new DeleteAction();
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        Blueprint::macro('userlog', function () {
            $this->string('created_by', 100)->nullable();
            $this->string('created_ip', 50)->nullable();
            $this->string('updated_by', 100)->nullable();
            $this->string('updated_ip', 50)->nullable();
        });

        //
        View()->composer('*', function ($view) {
            $view->with('siteSetting', SiteSetting::first());
            $view->with('footerfeatures', Feature::select('title')->where('status', 'active')->get());
            $view->with('footerMenu', FrontMenu::where('position', 'footer')->get());
            $view->with('footerBottomMenu', FrontMenu::where('position', 'footer_bottom')->get());
            $view->with('frontMenus', app()->make('frontMenuObj'));
            $view->with('allFrontMenu', FrontMenu::getAllMenu());
        });
    }
}
