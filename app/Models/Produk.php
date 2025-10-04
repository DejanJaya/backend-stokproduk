<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Produk extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_produk',
        'deskripsi',
        'gambar',
        'kategori_id',
        'stok'
    ];

    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'kategori_id');
    }
    public function transaksiDetails()
    {
        return $this->hasMany(TransaksiDetail::class, 'produk_id');
    }
}
