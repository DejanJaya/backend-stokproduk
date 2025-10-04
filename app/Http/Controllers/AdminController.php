<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function index()
    {
        $listadmin = User::select(['id', 'nama_depan', 'nama_belakang', 'email', 'tgl_lahir', 'jenis_kelamin'])->get();
        return response()->json($listadmin);
    }
    public function edit($id)
    {
        $data = User::find($id);
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'nama_depan' => 'required',
            'nama_belakang' => 'required',
            'email' => 'required|string|email|unique:users',
            'tgl_lahir' => 'required',
            'jenis_kelamin' => 'required',
            'password' =>  'required|string|same:confirmed_password'
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()->all()]);
        }
        $admin = User::create([
            'nama_depan' => $request->nama_depan,
            'nama_belakang' => $request->nama_belakang,
            'email' => $request->email,
            'tgl_lahir' => $request->tgl_lahir,
            'jenis_kelamin' => $request->jenis_kelamin,
            'password' => Hash::make($request->password),
        ]);

        return response()->json($admin);
    }

    public function update(Request $request, $id)
    {
        $validate = Validator::make($request->all(), [
            'nama_depan' => 'required',
            'nama_belakang' => 'required',
            'email' => 'required|string|email',
            'tgl_lahir' => 'required',
            'jenis_kelamin' => 'required',
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()->all()]);
        }
        $admin = User::find($id);

        $admin->nama_depan = $request->nama_depan;
        $admin->nama_belakang = $request->nama_belakang;
        $admin->email = $request->email;
        $admin->tgl_lahir = $request->tgl_lahir;
        $admin->jenis_kelamin = $request->jenis_kelamin;

        if ($request->password) {
            $admin->password = Hash::make($request->password);
        }
        $admin->save();

        return response()->json($admin);
    }

    public function delete($id)
    {
        User::destroy($id);
        return response()->json(['Data Admin Berhasil di delete']);
    }
}
