-- MySQL Script generated by MySQL Workbench
-- Sat Oct 19 21:58:24 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_G4VinoCostero
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_G4VinoCostero` DEFAULT CHARACTER SET utf8;
USE `DB_G4VinoCostero`;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Parcela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Parcela` (
  `ID_Parcela` INT NOT NULL AUTO_INCREMENT,
  `NombreParcela` VARCHAR(100) NOT NULL,
  `UbicacionParcela` VARCHAR(100) NOT NULL,
  `AreaParcela` DECIMAL(10,2) NOT NULL,
  `DimensionParcela` VARCHAR(100) NOT NULL,
  `Tipo_SueloParcela` VARCHAR(50) NOT NULL,
  `Fecha_AdquisicionParcela` DATE NOT NULL,
  PRIMARY KEY (`ID_Parcela`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Enfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Enfermedad` (
  `ID_Enfermedad` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Enfermedad` VARCHAR(100) NOT NULL,
  `Descripcion_Enfermedad` TEXT NULL,
  `Tratamiento_Enfermedad` TEXT NULL,
  PRIMARY KEY (`ID_Enfermedad`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Vinedo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Vinedo` (
  `ID_Vinedo` INT NOT NULL AUTO_INCREMENT,
  `ID_Parcela` INT NOT NULL,
  `NombreVinedo` VARCHAR(100) NOT NULL,
  `Variedad_Uva` VARCHAR(50) NOT NULL,
  `Fecha_Plantacion` DATE NOT NULL,
  `RiegoVinedo` TINYINT NOT NULL,
  `ID_Enfermedad` INT NOT NULL,
  `Estado_Sanitario` VARCHAR(50) NOT NULL,
  `Azucar_Uva` DECIMAL(5,2) NOT NULL,
  `Punto_Optimo_Cosecha` DATE NOT NULL,
  PRIMARY KEY (`ID_Vinedo`),
  INDEX `FK_Vinedo_Parcela_idx` (`ID_Parcela`),
  INDEX `FK_Vinedo_Enfermedad_idx` (`ID_Enfermedad`),
  CONSTRAINT `FK_Vinedo_Parcela`
    FOREIGN KEY (`ID_Parcela`)
    REFERENCES `DB_G4VinoCostero`.`Parcela` (`ID_Parcela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vinedo_Enfermedad`
    FOREIGN KEY (`ID_Enfermedad`)
    REFERENCES `DB_G4VinoCostero`.`Enfermedad` (`ID_Enfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Produccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Produccion` (
  `ID_Produccion` INT NOT NULL AUTO_INCREMENT,
  `ID_Vinedo` INT NOT NULL,
  `Fecha_Cosecha` DATE NOT NULL,
  `Cantidad_Uva` DECIMAL(10,2) NOT NULL,
  `Calidad_Uva` VARCHAR(50) NOT NULL,
  `Fases_Produccion` TEXT NOT NULL,
  `Fecha_Embotellamiento` DATE NULL,
  `Cantidad_Embotellada` DECIMAL(10,2) NULL,
  PRIMARY KEY (`ID_Produccion`),
  INDEX `FK_Produccion_Vinedo_idx` (`ID_Vinedo`),
  CONSTRAINT `FK_Produccion_Vinedo`
    FOREIGN KEY (`ID_Vinedo`)
    REFERENCES `DB_G4VinoCostero`.`Vinedo` (`ID_Vinedo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Bodega` (
  `ID_Bodega` INT NOT NULL AUTO_INCREMENT,
  `NombreBodega` VARCHAR(100) NOT NULL,
  `UbicacionBodega` VARCHAR(100) NOT NULL,
  `CapacidadBodega` DECIMAL(10,2) NULL,
  PRIMARY KEY (`ID_Bodega`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Cliente` (
  `ID_Cliente` INT NOT NULL AUTO_INCREMENT,
  `NombreCliente` VARCHAR(100) NOT NULL,
  `ApellidoCliente` VARCHAR(100) NOT NULL,
  `EmailCliente` VARCHAR(100) NULL,
  `TelefonoCliente` VARCHAR(12) NULL,
  `DireccionCliente` VARCHAR(100) NULL,
  `NitCliente` VARCHAR(10) NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Vino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Vino` (
  `ID_Vino` INT NOT NULL AUTO_INCREMENT,
  `ID_Produccion` INT NULL,
  `NombreVino` VARCHAR(100) NOT NULL,
  `TipoVino` VARCHAR(50) NOT NULL,
  `YearVino` YEAR NOT NULL,
  `Cantidad_ProducidaVino` DECIMAL(10,2) NOT NULL,
  `ID_Bodega` INT NULL,
  `Fecha_AlmacenamientoVino` DATE NOT NULL,
  PRIMARY KEY (`ID_Vino`),
  INDEX `FK_Produccion_Vino_idx` (`ID_Produccion`),
  INDEX `FK_Bodega_Vino_idx` (`ID_Bodega`),
  CONSTRAINT `FK_Produccion_Vino`
    FOREIGN KEY (`ID_Produccion`)
    REFERENCES `DB_G4VinoCostero`.`Produccion` (`ID_Produccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bodega_Vino`
    FOREIGN KEY (`ID_Bodega`)
    REFERENCES `DB_G4VinoCostero`.`Bodega` (`ID_Bodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Venta` (
  `ID_Venta` INT NOT NULL AUTO_INCREMENT,
  `ID_Vino` INT NULL,
  `Fecha_Venta` DATE NOT NULL,
  `CantidadVenta` INT NOT NULL,
  `PrecioVenta` DECIMAL(10,2) NOT NULL,
  `ID_Cliente` INT NULL,
  PRIMARY KEY (`ID_Venta`),
  INDEX `FK_Venta_Cliente_idx` (`ID_Cliente`),
  INDEX `FK_Venta_Vino_idx` (`ID_Vino`),
  CONSTRAINT `FK_Venta_Cliente`
    FOREIGN KEY (`ID_Cliente`)
    REFERENCES `DB_G4VinoCostero`.`Cliente` (`ID_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Venta_Vino`
    FOREIGN KEY (`ID_Vino`)
    REFERENCES `DB_G4VinoCostero`.`Vino` (`ID_Vino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Empleado` (
  `ID_Empleado` INT NOT NULL AUTO_INCREMENT,
  `NombreEmpleado` VARCHAR(100) NOT NULL,
  `ApellidoEmpleado` VARCHAR(100) NOT NULL,
  `Fecha_ContratacionEmpleado` DATE NOT NULL,
  `PuestoEmpleado` VARCHAR(100) NOT NULL,
  `EmailEmpleado` VARCHAR(100) NULL,
  `TelefonoEmpleado` VARCHAR(12) NOT NULL,
  `Password_Empleado` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Rol` (
  `ID_Rol` INT NOT NULL AUTO_INCREMENT,
  `NombreRol` VARCHAR(100) NOT NULL,
  `DescripcionRol` TEXT NOT NULL,
  `ResponsabilidadRol` TEXT NOT NULL,
  PRIMARY KEY (`ID_Rol`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Asignacion_Trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Asignacion_Trabajador` (
  `ID_Asignacion` INT NOT NULL AUTO_INCREMENT,
  `ID_Empleado` INT NULL,
  `ID_Rol` INT NULL,
  `Fecha_Asignacion` DATE NOT NULL,
  PRIMARY KEY (`ID_Asignacion`),
  INDEX `FK_Asignacion_Rol_idx` (`ID_Rol`),
  INDEX `FK_Asignacion_Empleado_idx` (`ID_Empleado`),
  CONSTRAINT `FK_Asignacion_Rol`
    FOREIGN KEY (`ID_Rol`)
    REFERENCES `DB_G4VinoCostero`.`Rol` (`ID_Rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Asignacion_Empleado`
    FOREIGN KEY (`ID_Empleado`)
    REFERENCES `DB_G4VinoCostero`.`Empleado` (`ID_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Sensor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Sensor` (
  `ID_Sensor` INT NOT NULL AUTO_INCREMENT,
  `ID_Vinedo` INT NULL,
  `Tipo_Sensor` VARCHAR(50) NOT NULL,
  `UbicacionSensor` VARCHAR(100) NOT NULL,
  `Fecha_InstalacionSensor` DATE NOT NULL,
  `Datos_TemperaturaSensor` TEXT NOT NULL,
  `Datos_HumedadSensor` TEXT NOT NULL,
  PRIMARY KEY (`ID_Sensor`),
  INDEX `FK_Sensor_Vinedo_idx` (`ID_Vinedo`),
  CONSTRAINT `FK_Sensor_Vinedo`
    FOREIGN KEY (`ID_Vinedo`)
    REFERENCES `DB_G4VinoCostero`.`Vinedo` (`ID_Vinedo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Bomba_Agua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Bomba_Agua` (
  `ID_Bomba` INT NOT NULL AUTO_INCREMENT,
  `ID_Vinedo` INT NULL,
  `UbicacionBomba_Agua` VARCHAR(100) NULL,
  `EstadoBomba_Agua` TINYINT NULL,
  `Fecha_Ultima_RevBomba_Agua` DATE NOT NULL,
  PRIMARY KEY (`ID_Bomba`),
  INDEX `FK_BombaAgua_Vinedo_idx` (`ID_Vinedo`),
  CONSTRAINT `FK_BombaAgua_Vinedo`
    FOREIGN KEY (`ID_Vinedo`)
    REFERENCES `DB_G4VinoCostero`.`Vinedo` (`ID_Vinedo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`PuntoControl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`PuntoControl` (
  `ID_PuntoControl` INT NOT NULL AUTO_INCREMENT,
  `ID_Produccion` INT NULL,
  `Fecha_Control` DATE NOT NULL,
  `DetallePuntoControl` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_PuntoControl`),
  INDEX `FK_PuntoControl_Produccion_idx` (`ID_Produccion`),
  CONSTRAINT `FK_PuntoControl_Produccion`
    FOREIGN KEY (`ID_Produccion`)
    REFERENCES `DB_G4VinoCostero`.`Produccion` (`ID_Produccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Cata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Cata` (
  `ID_Cata` INT NOT NULL AUTO_INCREMENT,
  `ID_Vino` INT NULL,
  `FechaCata` DATE NOT NULL,
  `ObservacionCata` VARCHAR(100) NOT NULL,
  `PuntuacionCata` DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (`ID_Cata`),
  INDEX `FK_Cata_Vino_idx` (`ID_Vino`),
  CONSTRAINT `FK_Cata_Vino`
    FOREIGN KEY (`ID_Vino`)
    REFERENCES `DB_G4VinoCostero`.`Vino` (`ID_Vino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`Embarque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`Embarque` (
  `ID_Embarque` INT NOT NULL AUTO_INCREMENT,
  `ID_Venta` INT NULL,
  `Fecha_Embarque` DATE NOT NULL,
  `Transportista` VARCHAR(100) NOT NULL,
  `EstadoEmbarque` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Embarque`),
  INDEX `FK_Embarque_Venta_idx` (`ID_Venta`),
  CONSTRAINT `FK_Embarque_Venta`
    FOREIGN KEY (`ID_Venta`)
    REFERENCES `DB_G4VinoCostero`.`Venta` (`ID_Venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DB_G4VinoCostero`.`DatoFinanciero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_G4VinoCostero`.`DatoFinanciero` (
  `ID_DatoFinanciero` INT NOT NULL AUTO_INCREMENT,
  `ID_Venta` INT NULL,
  `Costo_Produccion` DECIMAL(10,2) NOT NULL,
  `IngresoDatoFinanciero` DECIMAL(10,2) NOT NULL,
  `BeneficioDatoFinanciero` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_DatoFinanciero`),
  INDEX `FK_DatoFinanciero_Venta_idx` (`ID_Venta`),
  CONSTRAINT `FK_DatoFinanciero_Venta`
    FOREIGN KEY (`ID_Venta`)
    REFERENCES `DB_G4VinoCostero`.`Venta` (`ID_Venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Finalización de las restricciones de SQL
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
