<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vinedo;
use App\Models\Enfermedad;

class VinedoController extends Controller
{
    public function crearVinedo(Request $request)
    {
        $validatedData = $request->validate([
            'NombreVinedo' => 'required|string|max:100',
            'Variedad_Uva' => 'required|string|max:50',
            'Fecha_Plantacion' => 'required|date',
            'RiegoVinedo' => 'required|integer',
            'ID_Enfermedad' => 'required|array',
            'Estado_Sanitario' => 'required|string|max:50',
            'Azucar_Uva' => 'required|numeric',
            'Punto_Optimo_Cosecha' => 'required|date',
        ]);

        $vinedo = new Vinedo();
        $vinedo->NombreVinedo = $validatedData['NombreVinedo'];
        $vinedo->Variedad_Uva = $validatedData['Variedad_Uva'];
        $vinedo->Fecha_Plantacion = $validatedData['Fecha_Plantacion'];
        $vinedo->RiegoVinedo = $validatedData['RiegoVinedo'];
        $vinedo->Estado_Sanitario = $validatedData['Estado_Sanitario'];
        $vinedo->Azucar_Uva = $validatedData['Azucar_Uva'];
        $vinedo->Punto_Optimo_Cosecha = $validatedData['Punto_Optimo_Cosecha'];
        $vinedo->save();

        $vinedo->enfermedades()->sync($validatedData['ID_Enfermedad']);

        return redirect()->back()->with('success', 'Viñedo creado exitosamente.');
    }

    public function mostrarFormulario()
    {
        $enfermedades = Enfermedad::all();
        return view('vinedo', compact('enfermedades'));
    }
}
