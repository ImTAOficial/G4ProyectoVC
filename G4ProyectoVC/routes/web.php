<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\VinedoController;
use App\Http\Controllers\EnfermedadController;
use App\Http\Controllers\ParcelaController;

Route::get('/', function () {
    return view('dashboard');
});

Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('login', [LoginController::class, 'login']);
Route::get('register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('register', [RegisterController::class, 'register']);
Route::get('password/request', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
Route::post('password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');

Route::get('dashboard', function () {
    return view('dashboard');
})->name('dashboard');

// Test de comunicación para la DB
Route::get('db-test', function () {
    try {
        \DB::connection()->getPdo();
        return 'Database connection is working';
    } catch (\Exception $e) {
        return 'Could not connect to the database. Error: ' . $e->getMessage();
    }
});

Route::get('registroempleado', function () {
    return view('registroempleado');
})->name('registroempleado');

// Ruta para crear un empleado
Route::post('empleado/crear', [EmpleadoController::class, 'store'])->name('empleado.crear');

// Ruta para mostrar el formulario de viñedo y crear un viñedo
Route::get('vinedo', [VinedoController::class, 'mostrarFormulario'])->name('vinedo');
Route::post('vinedo/crear', [VinedoController::class, 'crearVinedo'])->name('vinedo.crear');

// Ruta para crear una enfermedad
Route::post('/enfermedad/crear', [EnfermedadController::class, 'crearEnfermedad'])->name('enfermedad.crear');

// Ruta para mostrar el formulario de parcela y crear una parcela
Route::get('parcelas', function () {
    return view('parcelas');
})->name('parcelas');

Route::post('parcela/crear', [ParcelaController::class, 'crearParcela'])->name('parcela.crear');

// Otras rutas existentes
Route::get('enfermedad', function () {
    return view('enfermedad');
})->name('enfermedad');

Route::get('parcelas', function () {
    return view('parcelas');
})->name('parcelas');

Route::get('bombadeagua', function () {
    return view('bombadeagua');
})->name('bombadeagua');

Route::get('sensores', function () {
    return view('sensores');
})->name('sensores');
