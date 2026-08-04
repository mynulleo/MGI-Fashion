<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebsiteController;


// Event Route...
Route::get('events', [WebsiteController::class, 'events'])->name('event.index');
Route::get('event/{slug}', [WebsiteController::class, 'eventShow'])->name('event.show');
// News Route...
Route::get('news', [WebsiteController::class, 'news'])->name('news.index');
Route::get('news/{slug}', [WebsiteController::class, 'newsShow'])->name('news.show');
// Notice Route...
Route::get('notice', [WebsiteController::class, 'notice'])->name('notice.index');
Route::get('notice/{slug}', [WebsiteController::class, 'noticeShow'])->name('notice.show');
// Contact Us Route...
// Route::post('contact', [WebsiteController::class, 'contactStore'])->name('contact.store');
// Gallery Route...
Route::get('albums', [WebsiteController::class, 'albums'])->name('albums.index');
Route::get('photos/{album_id}', [WebsiteController::class, 'photos'])->name('photos.index');
Route::get('videos/{album_id}', [WebsiteController::class, 'videos'])->name('videos.index');
