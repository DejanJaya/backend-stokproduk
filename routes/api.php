<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\KategoriProdukController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\TransaksiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

// Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('profile', [AuthController::class, 'profile']);

    Route::get('/admin', [AdminController::class, 'index']);
    Route::post('/admin', [AdminController::class, 'store']);
    Route::get('/admin/{id}', [AdminController::class, 'edit']);
    Route::put('/admin/{id}', [AdminController::class, 'update']);
    Route::delete('/admin/{id}', [AdminController::class, 'delete']);

    Route::get('/kategori', [KategoriProdukController::class, 'index']);
    Route::post('/kategori', [KategoriProdukController::class, 'store']);
    Route::get('/kategori/{id}', [KategoriProdukController::class, 'edit']);
    Route::put('/kategori/{id}', [KategoriProdukController::class, 'update']);
    Route::delete('/kategori/{id}', [KategoriProdukController::class, 'delete']);

    Route::get('/produk', [ProdukController::class, 'index']);
    Route::post('/produk', [ProdukController::class, 'store']);
    Route::get('/produk/{id}', [ProdukController::class, 'edit']);
    Route::put('/produk/{id}', [ProdukController::class, 'update']);
    Route::delete('/produk/{id}', [ProdukController::class, 'delete']);

    // list transaksi
    Route::get('/transaksi', [TransaksiController::class, 'index']);

    // Simpan transaksi baru (Stock In/Out)
    Route::post('/transaksi', [TransaksiController::class, 'store']);
});
