<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TransaksiDetail extends Model
{
    protected $fillable = ['transaksi_id', 'produk_id', 'quantity'];

    public function transaksi()
    {
        return $this->belongsTo(Transaksi::class, 'transaksi_id');
    }

    public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id');
    }
}
