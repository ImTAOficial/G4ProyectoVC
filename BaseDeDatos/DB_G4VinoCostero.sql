-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2024 a las 03:14:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_g4vinocostero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_trabajador`
--

CREATE TABLE `asignacion_trabajador` (
  `ID_Asignacion` int(11) NOT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `ID_Rol` int(11) DEFAULT NULL,
  `Fecha_Asignacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `ID_Bodega` int(11) NOT NULL,
  `NombreBodega` varchar(100) NOT NULL,
  `UbicacionBodega` varchar(100) NOT NULL,
  `CapacidadBodega` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba_agua`
--

CREATE TABLE `bomba_agua` (
  `ID_Bomba` int(11) NOT NULL,
  `ID_Vinedo` int(11) DEFAULT NULL,
  `UbicacionBomba_Agua` varchar(100) DEFAULT NULL,
  `EstadoBomba_Agua` tinyint(4) DEFAULT NULL,
  `Fecha_Ultima_RevBomba_Agua` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cata`
--

CREATE TABLE `cata` (
  `ID_Cata` int(11) NOT NULL,
  `ID_Vino` int(11) DEFAULT NULL,
  `FechaCata` date NOT NULL,
  `ObservacionCata` varchar(100) NOT NULL,
  `PuntuacionCata` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `NombreCliente` varchar(100) NOT NULL,
  `ApellidoCliente` varchar(100) NOT NULL,
  `EmailCliente` varchar(100) DEFAULT NULL,
  `TelefonoCliente` varchar(12) DEFAULT NULL,
  `DireccionCliente` varchar(100) DEFAULT NULL,
  `NitCliente` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datofinanciero`
--

CREATE TABLE `datofinanciero` (
  `ID_DatoFinanciero` int(11) NOT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `Costo_Produccion` decimal(10,2) NOT NULL,
  `IngresoDatoFinanciero` decimal(10,2) NOT NULL,
  `BeneficioDatoFinanciero` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarque`
--

CREATE TABLE `embarque` (
  `ID_Embarque` int(11) NOT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `Fecha_Embarque` date NOT NULL,
  `Transportista` varchar(100) NOT NULL,
  `EstadoEmbarque` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `NombreEmpleado` varchar(100) NOT NULL,
  `ApellidoEmpleado` varchar(100) NOT NULL,
  `Fecha_ContratacionEmpleado` date NOT NULL,
  `PuestoEmpleado` varchar(100) NOT NULL,
  `EmailEmpleado` varchar(100) DEFAULT NULL,
  `TelefonoEmpleado` varchar(12) NOT NULL,
  `Password_Empleado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_Empleado`, `NombreEmpleado`, `ApellidoEmpleado`, `Fecha_ContratacionEmpleado`, `PuestoEmpleado`, `EmailEmpleado`, `TelefonoEmpleado`, `Password_Empleado`) VALUES
(2, 'Antonio', 'Herrera', '2024-10-21', 'Administrador', 'admin@gmail.com', '12345678', '$2y$12$0wyKelH/aAFAmhFoxBeb4us.sfsXRfbW9ylO/smeLmLQ1d61YnvpS'),
(3, 'Antonio1', 'Herrera1', '2024-10-21', 'Administrador', 'admin1@gmail.com', '12345671', '$2y$12$Y5omzcMV8nrfbqgMJrIe1Os.iRBJp/GVxrA9Nn3hmWtPZG6ZDu74y'),
(4, 'Antonio', 'Herrera3', '2024-10-19', 'Administrador', 'admin3@gmail.com', '12345671', '$2y$12$rERItxOyCRaBG7bH.EdH8Oba8zEadBIAPLpi7SdGL7R.fl8tdXR42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `ID_Enfermedad` int(11) NOT NULL,
  `Nombre_Enfermedad` varchar(100) NOT NULL,
  `Descripcion_Enfermedad` text DEFAULT NULL,
  `Tratamiento_Enfermedad` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_10_21_011721_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcela`
--

CREATE TABLE `parcela` (
  `ID_Parcela` int(11) NOT NULL,
  `NombreParcela` varchar(100) NOT NULL,
  `UbicacionParcela` varchar(100) NOT NULL,
  `AreaParcela` decimal(10,2) NOT NULL,
  `DimensionParcela` varchar(100) NOT NULL,
  `Tipo_SueloParcela` varchar(50) NOT NULL,
  `Fecha_AdquisicionParcela` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `ID_Produccion` int(11) NOT NULL,
  `ID_Vinedo` int(11) NOT NULL,
  `Fecha_Cosecha` date NOT NULL,
  `Cantidad_Uva` decimal(10,2) NOT NULL,
  `Calidad_Uva` varchar(50) NOT NULL,
  `Fases_Produccion` text NOT NULL,
  `Fecha_Embotellamiento` date DEFAULT NULL,
  `Cantidad_Embotellada` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntocontrol`
--

CREATE TABLE `puntocontrol` (
  `ID_PuntoControl` int(11) NOT NULL,
  `ID_Produccion` int(11) DEFAULT NULL,
  `Fecha_Control` date NOT NULL,
  `DetallePuntoControl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_Rol` int(11) NOT NULL,
  `NombreRol` varchar(100) NOT NULL,
  `DescripcionRol` text NOT NULL,
  `ResponsabilidadRol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensor`
--

CREATE TABLE `sensor` (
  `ID_Sensor` int(11) NOT NULL,
  `ID_Vinedo` int(11) DEFAULT NULL,
  `Tipo_Sensor` varchar(50) NOT NULL,
  `UbicacionSensor` varchar(100) NOT NULL,
  `Fecha_InstalacionSensor` date NOT NULL,
  `Datos_TemperaturaSensor` text NOT NULL,
  `Datos_HumedadSensor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CP9FHD7PGssv7p9pbqPT3pTaot6xosowiRCEkoaj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUoxeWlEcVpBRXRxVml2NEt1MmNBa0V0NUVBMXNzNkl5bE5NeW1sZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1729540938),
('Gz4klfx08ocNLRLJvqf6h5hQOyr7OlWq5cFmOdKh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmZyVXg4RGJDcW1BUXNLMVFuWGtGSFM0QU9NWHZsdGlVVjRYU1ZjbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729484312),
('iIPrOK85O7MGH0GUyV3FK3nmpUtzd8TlCTDnEt1p', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHo5ZlNTdEZrbVR5VGV5UFdvSWxnaGp3alRyU0hVWTlhSDgxenlmdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYXNzd29yZC9yZXF1ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1729523921),
('P4mtyW3N0KU9lol8CUlftDuqvouuoS6hEtwhpYJl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN0NyTFViaTRKcGt1OXdQR3c0Q0pDMjVxRFJNRGZ0V3c0ZWpHYmc4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9fQ==', 1729489875),
('VuHjGYjq6jgHCrjud03E8hJGJJepKWsu0sLNC5z2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY09HYUFya210N2k1TFV0RDNxQWN4VEpoYVUxNXY0T0pJZDlpYUg3RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729559572);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `ID_Venta` int(11) NOT NULL,
  `ID_Vino` int(11) DEFAULT NULL,
  `Fecha_Venta` date NOT NULL,
  `CantidadVenta` int(11) NOT NULL,
  `PrecioVenta` decimal(10,2) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vinedo`
--

CREATE TABLE `vinedo` (
  `ID_Vinedo` int(11) NOT NULL,
  `ID_Parcela` int(11) NOT NULL,
  `NombreVinedo` varchar(100) NOT NULL,
  `Variedad_Uva` varchar(50) NOT NULL,
  `Fecha_Plantacion` date NOT NULL,
  `RiegoVinedo` tinyint(4) NOT NULL,
  `ID_Enfermedad` int(11) NOT NULL,
  `Estado_Sanitario` varchar(50) NOT NULL,
  `Azucar_Uva` decimal(5,2) NOT NULL,
  `Punto_Optimo_Cosecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vino`
--

CREATE TABLE `vino` (
  `ID_Vino` int(11) NOT NULL,
  `ID_Produccion` int(11) DEFAULT NULL,
  `NombreVino` varchar(100) NOT NULL,
  `TipoVino` varchar(50) NOT NULL,
  `YearVino` year(4) NOT NULL,
  `Cantidad_ProducidaVino` decimal(10,2) NOT NULL,
  `ID_Bodega` int(11) DEFAULT NULL,
  `Fecha_AlmacenamientoVino` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_trabajador`
--
ALTER TABLE `asignacion_trabajador`
  ADD PRIMARY KEY (`ID_Asignacion`),
  ADD KEY `FK_Asignacion_Rol_idx` (`ID_Rol`),
  ADD KEY `FK_Asignacion_Empleado_idx` (`ID_Empleado`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`ID_Bodega`);

--
-- Indices de la tabla `bomba_agua`
--
ALTER TABLE `bomba_agua`
  ADD PRIMARY KEY (`ID_Bomba`),
  ADD KEY `FK_BombaAgua_Vinedo_idx` (`ID_Vinedo`);

--
-- Indices de la tabla `cata`
--
ALTER TABLE `cata`
  ADD PRIMARY KEY (`ID_Cata`),
  ADD KEY `FK_Cata_Vino_idx` (`ID_Vino`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `datofinanciero`
--
ALTER TABLE `datofinanciero`
  ADD PRIMARY KEY (`ID_DatoFinanciero`),
  ADD KEY `FK_DatoFinanciero_Venta_idx` (`ID_Venta`);

--
-- Indices de la tabla `embarque`
--
ALTER TABLE `embarque`
  ADD PRIMARY KEY (`ID_Embarque`),
  ADD KEY `FK_Embarque_Venta_idx` (`ID_Venta`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`ID_Enfermedad`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parcela`
--
ALTER TABLE `parcela`
  ADD PRIMARY KEY (`ID_Parcela`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`ID_Produccion`),
  ADD KEY `FK_Produccion_Vinedo_idx` (`ID_Vinedo`);

--
-- Indices de la tabla `puntocontrol`
--
ALTER TABLE `puntocontrol`
  ADD PRIMARY KEY (`ID_PuntoControl`),
  ADD KEY `FK_PuntoControl_Produccion_idx` (`ID_Produccion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`ID_Sensor`),
  ADD KEY `FK_Sensor_Vinedo_idx` (`ID_Vinedo`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `FK_Venta_Cliente_idx` (`ID_Cliente`),
  ADD KEY `FK_Venta_Vino_idx` (`ID_Vino`);

--
-- Indices de la tabla `vinedo`
--
ALTER TABLE `vinedo`
  ADD PRIMARY KEY (`ID_Vinedo`),
  ADD KEY `FK_Vinedo_Parcela_idx` (`ID_Parcela`),
  ADD KEY `FK_Vinedo_Enfermedad_idx` (`ID_Enfermedad`);

--
-- Indices de la tabla `vino`
--
ALTER TABLE `vino`
  ADD PRIMARY KEY (`ID_Vino`),
  ADD KEY `FK_Produccion_Vino_idx` (`ID_Produccion`),
  ADD KEY `FK_Bodega_Vino_idx` (`ID_Bodega`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion_trabajador`
--
ALTER TABLE `asignacion_trabajador`
  MODIFY `ID_Asignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `ID_Bodega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba_agua`
--
ALTER TABLE `bomba_agua`
  MODIFY `ID_Bomba` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cata`
--
ALTER TABLE `cata`
  MODIFY `ID_Cata` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datofinanciero`
--
ALTER TABLE `datofinanciero`
  MODIFY `ID_DatoFinanciero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `embarque`
--
ALTER TABLE `embarque`
  MODIFY `ID_Embarque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `ID_Enfermedad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `parcela`
--
ALTER TABLE `parcela`
  MODIFY `ID_Parcela` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `ID_Produccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntocontrol`
--
ALTER TABLE `puntocontrol`
  MODIFY `ID_PuntoControl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_Rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sensor`
--
ALTER TABLE `sensor`
  MODIFY `ID_Sensor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `ID_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vinedo`
--
ALTER TABLE `vinedo`
  MODIFY `ID_Vinedo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vino`
--
ALTER TABLE `vino`
  MODIFY `ID_Vino` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_trabajador`
--
ALTER TABLE `asignacion_trabajador`
  ADD CONSTRAINT `FK_Asignacion_Empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Asignacion_Rol` FOREIGN KEY (`ID_Rol`) REFERENCES `rol` (`ID_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bomba_agua`
--
ALTER TABLE `bomba_agua`
  ADD CONSTRAINT `FK_BombaAgua_Vinedo` FOREIGN KEY (`ID_Vinedo`) REFERENCES `vinedo` (`ID_Vinedo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cata`
--
ALTER TABLE `cata`
  ADD CONSTRAINT `FK_Cata_Vino` FOREIGN KEY (`ID_Vino`) REFERENCES `vino` (`ID_Vino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `datofinanciero`
--
ALTER TABLE `datofinanciero`
  ADD CONSTRAINT `FK_DatoFinanciero_Venta` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `embarque`
--
ALTER TABLE `embarque`
  ADD CONSTRAINT `FK_Embarque_Venta` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `FK_Produccion_Vinedo` FOREIGN KEY (`ID_Vinedo`) REFERENCES `vinedo` (`ID_Vinedo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `puntocontrol`
--
ALTER TABLE `puntocontrol`
  ADD CONSTRAINT `FK_PuntoControl_Produccion` FOREIGN KEY (`ID_Produccion`) REFERENCES `produccion` (`ID_Produccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `FK_Sensor_Vinedo` FOREIGN KEY (`ID_Vinedo`) REFERENCES `vinedo` (`ID_Vinedo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_Venta_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Venta_Vino` FOREIGN KEY (`ID_Vino`) REFERENCES `vino` (`ID_Vino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vinedo`
--
ALTER TABLE `vinedo`
  ADD CONSTRAINT `FK_Vinedo_Enfermedad` FOREIGN KEY (`ID_Enfermedad`) REFERENCES `enfermedad` (`ID_Enfermedad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Vinedo_Parcela` FOREIGN KEY (`ID_Parcela`) REFERENCES `parcela` (`ID_Parcela`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vino`
--
ALTER TABLE `vino`
  ADD CONSTRAINT `FK_Bodega_Vino` FOREIGN KEY (`ID_Bodega`) REFERENCES `bodega` (`ID_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Produccion_Vino` FOREIGN KEY (`ID_Produccion`) REFERENCES `produccion` (`ID_Produccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
