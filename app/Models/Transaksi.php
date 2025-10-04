<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $fillable = ['user_id', 'type', 'tgl_input'];

    public function admin()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function details()
    {
        return $this->hasMany(TransaksiDetail::class, 'transaksi_id');
    }
}
