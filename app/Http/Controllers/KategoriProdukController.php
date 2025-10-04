<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KategoriProdukController extends Controller
{
    public function index()
    {
        $listkategori = Kategori::all();
        return response()->json($listkategori);
    }

    public function edit($id)
    {
        $data = Kategori::find($id);
        return response()->json($data);
    }
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'nama_kategori' => 'required',
            'deskripsi' => 'required'
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()->all()]);
        }
        $kategori = Kategori::create([
            'nama_kategori' => $request->nama_kategori,
            'deskripsi' => $request->deskripsi,
        ]);

        return response()->json($kategori);
    }

    public function update(Request $request, $id)
    {
        $validate = Validator::make($request->all(), [
            'nama_kategori' => 'required',
            'deskripsi' => 'required'
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()->all()]);
        }
        $kategori = Kategori::find($id);
        $kategori->update([
            'nama_kategori' => $request->nama_kategori,
            'deskripsi' => $request->deskripsi,
        ]);

        return response()->json($kategori);
    }

    public function delete($id)
    {
        Kategori::destroy($id);
        return response()->json(['Data Kategori Berhasil di delete']);
    }
}
