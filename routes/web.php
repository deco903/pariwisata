<?php

use Illuminate\Support\Facades\Route;

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

// Route::get('/', function () {
//     return view('template.frontend.default');
// });



Auth::routes();
// Route::get('/home', 'HomeController@index')->name('home');
Route::get('/administrator', 'DashboardController@index')->name('dashboard');
Route::group(['middleware' => 'role:administrator','auth',
'prefix' => 'administrator'], function(){
    //province => city
    Route::resource('province','ProvinceController');
    Route::get('province/{province}/city','CityController@index')->name('city.index');
    Route::get('province/{province}/city/create','CityController@create')->name('city.create');
    Route::post('province/{province}/city/create','CityController@store')->name('city.store');
    Route::get('province/{province}/city/{city}/edit','CityController@edit')->name('city.edit');
    Route::put('province/{province}/city/{city}/edit','CityController@update')->name('city.update');
    Route::delete('province/{province}/city/{city}/delete','CityController@destroy')->name('city.delete');
    //content
    //Route::resource('content','ContentController');
    //publish
    Route::get('/content/{content}/status','ContentController@editStatus')->name('content.editStatus');
    Route::put('/content/{content}/status','ContentController@updateStatus')->name('content.updatestatus');
    //user
    Route::resource('user','UserController');
});
    //administrator have access rights content because there is a policy function previously 
    Route::resource('administrator/content','ContentController');

    Route::get('/','HomepageController@index')->name('homepage');
    //to replace id on URL from number to slug
    Route::get('/{province}/{city}/{content}','HomepageController@detailContent')->name('detailContent');
    Route::get('/province/{province}','HomepageController@getContentProvince')->name('getContentProvince');
    Route::get('/province','HomepageController@getProvince')->name('getProvince');
    Route::get('/result','HomepageController@result')->name('result');
    Route::get('/content','HomepageController@otherContent')->name('otherContent');
