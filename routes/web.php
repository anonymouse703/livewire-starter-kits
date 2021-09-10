<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\ClientTable;
use App\Http\Livewire\RoomCategoryTable;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return view('dashboard');
// })->name('dashboard');

Route::group(['middleware' => [
    'auth:sanctum',
    'verified'
]], function(){

    Route::get('/dashboard',function(){
        return view('dashboard');
    })->name('dashboard');

    Route::get('/client', ClientTable::class)->name('client');
    Route::get('/room-category', RoomCategoryTable::class)->name('room-category');

});
