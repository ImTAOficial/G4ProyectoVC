<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vinedo;
use App\Models\Enfermedad;
use App\Models\Parcela;

class VinedoController extends Controller
{
    public function crearVinedo(Request $request)
    {
        $validatedData = $request->validate([
            'ID_Parcela' => 'required|integer',
            'NombreVinedo' => 'required|string|max:100',
            'Variedad_Uva' => 'required|string|max:50',
            'Fecha_Plantacion' => 'required|date',
            'RiegoVinedo' => 'required|integer',
            'ID_Enfermedad' => 'required|integer', // Asegúrate de que no es un array
            'Estado_Sanitario' => 'required|string|max:50',
            'Azucar_Uva' => 'required|numeric',
            'Punto_Optimo_Cosecha' => 'required|date',
        ]);

        $vinedo = new Vinedo();
        $vinedo->ID_Parcela = $validatedData['ID_Parcela'];
        $vinedo->NombreVinedo = $validatedData['NombreVinedo'];
        $vinedo->Variedad_Uva = $validatedData['Variedad_Uva'];
        $vinedo->Fecha_Plantacion = $validatedData['Fecha_Plantacion'];
        $vinedo->RiegoVinedo = $validatedData['RiegoVinedo'];
        $vinedo->ID_Enfermedad = $validatedData['ID_Enfermedad'];
        $vinedo->Estado_Sanitario = $validatedData['Estado_Sanitario'];
        $vinedo->Azucar_Uva = $validatedData['Azucar_Uva'];
        $vinedo->Punto_Optimo_Cosecha = $validatedData['Punto_Optimo_Cosecha'];
        $vinedo->save();

        return redirect()->back()->with('success', 'Viñedo creado exitosamente.');
    }

    public function mostrarFormulario()
    {
        $enfermedades = Enfermedad::all();
        $parcelas = Parcela::all();
        return view('vinedo', compact('enfermedades', 'parcelas'));
    }

}
