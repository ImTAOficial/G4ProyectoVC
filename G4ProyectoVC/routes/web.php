<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\EmpleadoController;

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



