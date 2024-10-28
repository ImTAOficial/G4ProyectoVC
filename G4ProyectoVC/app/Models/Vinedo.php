<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vinedo extends Model
{
    use HasFactory;

    protected $table = 'vinedo';
    
    public $timestamps = false;

    protected $fillable = [
        'NombreVinedo',
        'Variedad_Uva',
        'Fecha_Plantacion',
        'RiegoVinedo',
        'Estado_Sanitario',
        'Azucar_Uva',
        'Punto_Optimo_Cosecha',
    ];

    public function enfermedades()
    {
        return $this->belongsToMany(Enfermedad::class, 'vinedo_enfermedad', 'vinedo_id', 'enfermedad_id');
    }
}
