<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tabungan extends Model
{
    protected $fillable = ['user_id', 'type', 'jumlah_uang', 'description', 'tgl_input'];
}
