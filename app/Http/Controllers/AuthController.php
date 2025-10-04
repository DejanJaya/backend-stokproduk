<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|same:confirmed_password',
        ]);

        if ($validator->fails()) {
            return response()->json(["errors" => $validator->errors()->all()]);
        }

        //create user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $input['name'] = $user->name;
        $input['email'] = $user->email;
        $input['token'] = $user->createToken('App')->plainTextToken;

        return response()->json($input);
    }

    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['errors' => ["Email atau Password salah"]]);
        }

        $user = Auth::user();

        $input['id'] = $user->id;
        $input['nama_depan'] = $user->nama_depan;
        $input['nama_belakang'] = $user->nama_belakang;
        $input['email'] = $user->email;
        $input['tgl_lahir'] = $user->tgl_lahir;
        $input['jenis_kelamin'] = $user->jenis_kelamin;
        $input['token'] = $user->createToken('App')->plainTextToken;

        return response()->json($input);
    }

    public function profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|',
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json(["errors" => $validator->errors()->all()]);
        }

        //create user
        $user = Auth::user();
        $user->name = $request->name;
        $user->email = $request->email;

        if ($request->password) {
            $user->password = Hash::make($request->password);
        }
        $user->save();

        $input['name'] = $user->name;
        $input['email'] = $user->email;

        return response()->json($input);
    }
}
