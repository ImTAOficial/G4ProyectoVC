<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Empleado;
use Illuminate\Support\Facades\Hash;

class EmpleadoController extends Controller
{
    
    public function store(Request $request)
    {
        
        // Validar los datos
        $validatedData = $request->validate([
            'NombreEmpleado' => 'required|string|max:100',
            'ApellidoEmpleado' => 'required|string|max:100',
            'Fecha_ContratacionEmpleado' => 'required|date',
            'PuestoEmpleado' => 'required|string|max:100',
            'EmailEmpleado' => 'required|email|max:100',
            'TelefonoEmpleado' => 'required|string|max:12',
            'Password_Empleado' => 'required|string|min:8',
        ]);

        // Crear el nuevo empleado
        $empleado = new Empleado();
        $empleado->NombreEmpleado = $validatedData['NombreEmpleado'];
        $empleado->ApellidoEmpleado = $validatedData['ApellidoEmpleado'];
        $empleado->Fecha_ContratacionEmpleado = $validatedData['Fecha_ContratacionEmpleado'];
        $empleado->PuestoEmpleado = $validatedData['PuestoEmpleado'];
        $empleado->EmailEmpleado = $validatedData['EmailEmpleado'];
        $empleado->TelefonoEmpleado = $validatedData['TelefonoEmpleado'];
        $empleado->Password_Empleado = Hash::make($validatedData['Password_Empleado']);
        $empleado->save();

        // Redirigir con mensaje de éxito
        return redirect()->back()->with('success', 'Empleado creado exitosamente.');
    }
}
