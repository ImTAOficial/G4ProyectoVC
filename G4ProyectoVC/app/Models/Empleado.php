<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;

    protected $table = 'Empleado';

    protected $fillable = [
        'NombreEmpleado',
        'ApellidoEmpleado',
        'Fecha_ContratacionEmpleado',
        'PuestoEmpleado',
        'EmailEmpleado',
        'TelefonoEmpleado',
        'Password_Empleado',
    ];

    protected $hidden = [
        'Password_Empleado',
    ];

    public $timestamps = false;
}
