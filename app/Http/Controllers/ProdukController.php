<?php

namespace App\Http\Controllers;

use App\Models\Produk;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProdukController extends Controller
{
    public function index()
    {
        $listproduk = Produk::with('kategori')->get();
        return response()->json($listproduk);
    }

    public function edit($id)
    {
        $data = Produk::find($id);
        return response()->json($data);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_produk' => 'required|string|max:255',
            'deskripsi'   => 'nullable|string',
            'stok'        => 'required|integer|min:0',
            'kategori_id' => 'required',
            'gambar'      => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        // Kalau validasi gagal
        if ($validator->fails()) {
            return response()->json([
                'errors'  => $validator->errors()->all()
            ]);
        }

        $validated = $validator->validated();

        // Upload file jika ada
        if ($request->hasFile('gambar')) {
            $path = $request->file('gambar')->store('produks', 'public');
            $validated['gambar'] = $path;
        }

        $produk = Produk::create($validated);

        return response()->json($produk);
    }

    public function update(Request $request, $id)
    {
        $produk = Produk::find($id);

        $validator = Validator::make($request->all(), [
            'nama_produk' => 'required|string|max:255',
            'deskripsi'   => 'nullable|string',
            'stok'        => 'required|integer|min:0',
            'kategori_id' => 'required',
            'gambar'      => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all()
            ]);
        }

        $validated = $validator->validated();

        // jika ada gambar baru
        if ($request->hasFile('gambar')) {
            // hapus gambar lama kalau ada
            if ($produk->gambar && Storage::disk('public')->exists($produk->gambar)) {
                Storage::disk('public')->delete($produk->gambar);
            }

            $path = $request->file('gambar')->store('produks', 'public');
            $validated['gambar'] = $path;
        }

        $produk->update($validated);

        return response()->json($produk);
    }

    public function delete($id)
    {
        $produk = Produk::find($id);

        // Hapus gambar
        if ($produk->gambar && Storage::disk('public')->exists($produk->gambar)) {
            Storage::disk('public')->delete($produk->gambar);
        }

        $produk->delete();

        return response()->json(['Data Produk Berhasil di delete']);
    }
}
