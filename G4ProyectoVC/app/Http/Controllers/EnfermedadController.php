<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Enfermedad;

class EnfermedadController extends Controller
{
    public function crearEnfermedad(Request $request)
    {
        $validatedData = $request->validate([
            'Nombre_Enfermedad' => 'required|string|max:100',
            'Descripcion_Enfermedad' => 'nullable|string',
            'Tratamiento_Enfermedad' => 'nullable|string',
        ]);

        $enfermedad = new Enfermedad();
        $enfermedad->Nombre_Enfermedad = $validatedData['Nombre_Enfermedad'];
        $enfermedad->Descripcion_Enfermedad = $validatedData['Descripcion_Enfermedad'];
        $enfermedad->Tratamiento_Enfermedad = $validatedData['Tratamiento_Enfermedad'];
        $enfermedad->save();

        return redirect()->back()->with('success', 'Enfermedad creada exitosamente.');
    }
}
