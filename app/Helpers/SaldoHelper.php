<?php

namespace App\Helpers;

use App\Models\Tabungan;

class SaldoHelper
{

    public static function recalculateSaldo($userId)
    {
        $transactions = Tabungan::where('user_id', $userId)
            ->orderBy('id', 'asc')
            ->get();

        // $transactions2 = Tabungan::where('user_id', $userId)
        //     ->where('id', $id)
        //     ->first();

        $balance = 0;
        foreach ($transactions as $trx) {
            if ($trx->type === 'pendapatan') {
                $balance += $trx->jumlah_uang;
            } else {
                $balance -= $trx->jumlah_uang;
            }

            if ($balance < 0) {
                return false; // saldo minus → invalid
            }

            $trx->balance = $balance;
            $trx->save();
        }
        return true;
    }
}
