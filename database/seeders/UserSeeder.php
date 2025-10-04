<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'nama_depan' => 'Admin',
            'nama_belakang' => 'Satu',
            'email' => 'admin@gmail.com',
            'tgl_lahir' => '1993-08-01',
            'jenis_kelamin' => 'L',
            'password' => Hash::make('12345'),
        ]);
    }
}
