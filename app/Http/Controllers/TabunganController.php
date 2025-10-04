<?php

namespace App\Http\Controllers;

use App\Helpers\SaldoHelper;
use App\Models\Saldo;
use App\Models\Tabungan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class TabunganController extends Controller
{
    public function index()
    {
        $tabungan = Tabungan::select('tabungans.id', 'users.name', 'tabungans.type', 'tabungans.jumlah_uang', 'tabungans.description', 'tabungans.tgl_input')
            ->join('users', 'tabungans.user_id', '=', 'users.id')
            ->orderBy('tabungans.created_at', 'desc')
            ->get();
        return response()->json($tabungan);
    }

    public function saldo()
    {
        $userId = Auth::user()->id;

        $lastTransaction = Saldo::where('user_id', $userId)
            ->value('saldo');

        $saldo = $lastTransaction ? $lastTransaction : 0;

        return response()->json([
            'saldo' => $saldo
        ]);
    }

    public function edit($id)
    {
        $tabungan = Tabungan::find($id);
        return response()->json($tabungan);
    }


    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'type' => 'required',
            'jumlah_uang' => 'required|numeric',
            'description' => 'required',
            'tgl_input' => 'required'
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()->all()]);
        }
        $userId = Auth::user()->id;
        $tabungan = Tabungan::create([
            'user_id' => $userId,
            'type' => $request->type,
            'jumlah_uang' => $request->jumlah_uang,
            'description' => $request->description,
            'tgl_input' => $request->tgl_input
        ]);

        $saldoId = Saldo::where('user_id', $userId)
            ->value('saldo');

        if ($tabungan->type == 'pendapatan') {
            $newSaldo = ($saldoId ? $saldoId : 0) + $tabungan->jumlah_uang;
        } else {
            $newSaldo = ($saldoId ? $saldoId : 0) - $tabungan->jumlah_uang;
        }

        if ($newSaldo < 0) {
            $tabungan->delete();
            return response()->json(['errors' => ['Saldo anda tidak cukup']]);
        }

        Saldo::updateOrCreate(
            [
                'user_id' => $userId
            ],
            [
                'saldo' => $newSaldo
            ]
        );

        return response()->json($tabungan);
    }


    public function update(Request $request, $id)
    {
        $validate = Validator::make($request->all(), [
            'type' => 'required',
            'jumlah_uang' => 'required|numeric',
            'description' => 'required',
            'tgl_input' => 'required'
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()->all()]);
        }

        $userId = Auth::user()->id;
        $tabungan = Tabungan::find($id);

        $saldoId = Saldo::where('user_id', $userId)
            ->value('saldo');

        if ($request->type == 'pendapatan') {
            $newSaldo = ($saldoId ? $saldoId : 0) + $request->jumlah_uang;
        } else {
            $newSaldo = ($saldoId ? $saldoId : 0) - $request->jumlah_uang;
        }

        if ($newSaldo < 0) {
            return response()->json(['errors' => ['Saldo anda tidak cukup']]);
        } else {
            $tabungan->update([
                'user_id' => $userId,
                'type' => $request->type,
                'jumlah_uang' => $request->jumlah_uang,
                'description' => $request->description,
                'tgl_input' => $request->tgl_input,
            ]);
        }

        Saldo::updateOrCreate(
            [
                'user_id' => $userId
            ],
            [
                'saldo' => $newSaldo
            ]
        );

        return response()->json($tabungan);
    }

    public function delete($id)
    {
        $userId = Auth::user()->id;

        $saldoId = Saldo::where('user_id', $userId)
            ->value('saldo');
        $tabungan =  Tabungan::find($id);

        if ($tabungan->type == 'pendapatan') {
            $newSaldo = ($saldoId ? $saldoId : 0) - $tabungan->jumlah_uang;
        } else {
            $newSaldo = $saldoId;
        }

        if ($newSaldo <= 0) {
            return response()->json(['errors' => 'Saldo anda tidak cukup']);
        } else {
            Tabungan::destroy($id);
            Saldo::updateOrCreate(
                [
                    'user_id' => $userId
                ],
                [
                    'saldo' => $newSaldo
                ]
            );
            return response()->json(['Data Berhasil dihapus']);
        }
    }

    public function chart()
    {
        $userId = Auth::user()->id;

        $data = DB::table('tabungans')
            ->selectRaw('
        MONTH(tgl_input) as bulan_angka,
        MONTHNAME(tgl_input) as bulan,
        SUM(CASE WHEN type = "pendapatan" THEN jumlah_uang ELSE 0 END) as total_pendapatan,
        SUM(CASE WHEN type = "pengeluaran" THEN jumlah_uang ELSE 0 END) as total_pengeluaran
    ')
            ->where('user_id', $userId)
            ->groupBy('bulan_angka', 'bulan')   // <- tambahin kedua kolom
            ->orderBy('bulan_angka')
            ->get();
        return response()->json($data);

        // return response()->json([
        //     'labels' => $data->pluck('bulan'),
        //     'pendapatan' => $data->pluck('total_pendapatan'),
        //     'pengeluaran' => $data->pluck('total_pengeluaran'),
        // ]);
    }
}
