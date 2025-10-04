<?php

namespace App\Http\Controllers;

use App\Models\Produk;
use App\Models\Transaksi;
use App\Models\TransaksiDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TransaksiController extends Controller
{
    // List semua transaksi beserta detail produk
    public function index()
    {
        $transaksi = Transaksi::with('admin', 'details.produk')->orderBy('tgl_input', 'desc')->get();
        return response()->json($transaksi);
    }

    // Simpan transaksi baru
    public function store(Request $request)
    {
        $validated = Validator::make($request->all(), [
            'type' => 'required|in:in,out',
            'tgl_input' => 'required|date',
            'products' => 'required|array',
            'products.*.produk_id' => 'required|exists:produks,id',
            'products.*.quantity' => 'required|integer|min:1'
        ]);
        if ($validated->fails()) {
            return response()->json(['errors' => $validated->errors()->all()]);
        }

        $transaksi = Transaksi::create([
            'user_id' => Auth::user()->id,
            'type' => $request->type,
            'tgl_input' => $request->tgl_input,
        ]);

        foreach ($request->products as $item) {
            $produk = Produk::find($item['produk_id']);

            // Validasi stok untuk stock out
            if ($request->type === 'out' && $item['quantity'] > $produk->stok) {
                return response()->json([
                    'errors' => 'Stok tidak cukup untuk produk ' . $produk->name
                ]);
            }

            // Update stok
            if ($request->type === 'in') {
                $produk->stok += $item['quantity'];
            } else {
                $produk->stok -= $item['quantity'];
            }
            $produk->save();

            // Simpan detail transaksi
            TransaksiDetail::create([
                'transaksi_id' => $transaksi->id,
                'produk_id' => $item['produk_id'],
                'quantity' => $item['quantity']
            ]);
        }

        return response()->json(['message' => 'Transaksi berhasil']);
    }
}
