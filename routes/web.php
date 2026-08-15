<?php

use App\Models\Career;
use App\Models\Client;
use App\Models\Service;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SitemapController;
use App\Http\Controllers\WebsiteController;
use App\Http\Controllers\Web\NewsController;
use App\Http\Controllers\Web\CareerController;
use App\Http\Controllers\Web\ClientController;
use App\Http\Controllers\Web\ProjectController;
use App\Http\Controllers\Web\ServiceController;
use App\Http\Controllers\RegistrationController;
use App\Http\Controllers\Auth\AdminLoginController;

// Home Route...
Route::get('/', [WebsiteController::class, 'index'])->name('home');
Route::get('page/{slug}', [WebsiteController::class, 'content'])->name('page');

Route::get('contact', [WebsiteController::class, 'contact'])->name('contact');
Route::post('contact', [WebsiteController::class, 'contactStore'])->name('contact.store');
Route::get('faq', [WebsiteController::class, 'faq'])->name('faq');
Route::get('project', [WebsiteController::class, 'projectlist'])->name('projectlist');
Route::get('project/{slug}', [WebsiteController::class, 'project'])->name('project');
Route::get('product', [WebsiteController::class, 'projectlist'])->name('productlist');
Route::get('product/{slug}', [WebsiteController::class, 'project'])->name('product');


// ssl payment gateway start
Route::post('/success-from-ssl', [App\Http\Controllers\SslCommerzPaymentController::class, 'success']);
Route::post('/failed-from-ssl', [App\Http\Controllers\SslCommerzPaymentController::class, 'fail']);
Route::post('ssl-payment-cancel', [App\Http\Controllers\SslCommerzPaymentController::class, 'cancel']);
Route::post('/warning-from-ssl', [App\Http\Controllers\SslCommerzPaymentController::class, 'cancel']);
Route::post('/warning-from-ssl', [App\Http\Controllers\SslCommerzPaymentController::class, 'cancel']);
Route::post('/ipn', [App\Http\Controllers\SslCommerzPaymentController::class, 'ipn']);
// ssl payment gateway end

Route::get('search', [WebsiteController::class, 'search'])->name('search');


// Admin Route...
Route::group(['prefix' => '', 'as' => 'admin.'], function () {
    Route::get('/qpanel', [AdminLoginController::class, 'login'])->name('qpanel');
    Route::post('/qlogin', [AdminLoginController::class, 'login']);
    Route::get('/login-check', [AdminLoginController::class, 'loginCheck'])->name('loginCheck');
});

//Sitemap
Route::get('sitemap.xml', SitemapController::class)->name('sitemap.xml');

// CKEditor files management only for authenticated user
Route::view('ckfinder/ckfinder', 'ckfinder.ckfinder')->name('ckfinder.ckfinder')->middleware('auth:admin');
