<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Parcela;

class ParcelaController extends Controller
{
    public function crearParcela(Request $request)
    {
        $validatedData = $request->validate([
            'NombreParcela' => 'required|string|max:100',
            'UbicacionParcela' => 'required|string|max:100',
            'AreaParcela' => 'required|numeric',
            'DimensionParcela' => 'required|string|max:100',
            'Tipo_SueloParcela' => 'required|string|max:50',
            'Fecha_AdquisicionParcela' => 'required|date',
        ]);

        $parcela = new Parcela();
        $parcela->NombreParcela = $validatedData['NombreParcela'];
        $parcela->UbicacionParcela = $validatedData['UbicacionParcela'];
        $parcela->AreaParcela = $validatedData['AreaParcela'];
        $parcela->DimensionParcela = $validatedData['DimensionParcela'];
        $parcela->Tipo_SueloParcela = $validatedData['Tipo_SueloParcela'];
        $parcela->Fecha_AdquisicionParcela = $validatedData['Fecha_AdquisicionParcela'];
        $parcela->save();

        return redirect()->back()->with('success', 'Parcela creada exitosamente.');
    }
}
