<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Enfermedad extends Model
{
    use HasFactory;

    protected $table = 'enfermedad';
    
    public $timestamps = false;

    protected $fillable = [
        'Nombre_Enfermedad',
        'Descripcion_Enfermedad',
        'Tratamiento_Enfermedad',
    ];

    public function vinedos()
    {
        return $this->belongsToMany(Vinedo::class, 'vinedo_enfermedad', 'enfermedad_id', 'vinedo_id');
    }
}
