Edfd
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  `Correo` VARCHAR(45) NULL DEFAULT NULL,
  `Contraseña` VARCHAR(45) NULL DEFAULT NULL,
  `Departamento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `Usuarios_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Usuarios_DNI`),
  CONSTRAINT `fk_Empleados_Trabajadores1`
    FOREIGN KEY (`Usuarios_DNI`)
    REFERENCES `mydb`.`Usuarios` (`DNI`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Recursos_humanos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recursos_humanos` (
  `Usuarios_DNI` VARCHAR(9) NOT NULL,
  INDEX `fk_Recursos_humanos_Usuarios1_idx` (`Usuarios_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Recursos_humanos_Usuarios1`
    FOREIGN KEY (`Usuarios_DNI`)
    REFERENCES `mydb`.`Usuarios` (`DNI`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Calendario` (
  `FechaIni` DATETIME NULL DEFAULT NULL,
  `FechaFin` DATETIME NULL DEFAULT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `Estado` CHAR(45) NULL DEFAULT NULL,
  `Empleado_Usuarios_DNI` VARCHAR(9) NOT NULL,
  `Recursos_humanos_Usuarios_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Empleado_Usuarios_DNI`, `Recursos_humanos_Usuarios_DNI`),
  INDEX `fk_Calendario_Empleado1_idx` (`Empleado_Usuarios_DNI` ASC) VISIBLE,
  INDEX `fk_Calendario_Recursos_humanos1_idx` (`Recursos_humanos_Usuarios_DNI` ASC) VISIBLE,
  INDEX `Primario` (`FechaIni` ASC, `FechaFin` ASC, `Empleado_Usuarios_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Calendario_Empleado1`
    FOREIGN KEY (`Empleado_Usuarios_DNI`)
    REFERENCES `mydb`.`Empleado` (`Usuarios_DNI`),
  CONSTRAINT `fk_Calendario_Recursos_humanos1`
    FOREIGN KEY (`Recursos_humanos_Usuarios_DNI`)
    REFERENCES `mydb`.`Recursos_humanos` (`Usuarios_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Poyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Poyectos` (
  `idPoyectos` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NULL DEFAULT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `FechaIni` DATE NULL DEFAULT NULL,
  `FechaFin` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idPoyectos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Empleados_estan_proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleados_estan_proyectos` (
  `Poyectos_idPoyectos` INT NOT NULL AUTO_INCREMENT,
  `Empleados_Trabajadores_DNI` VARCHAR(9) NOT NULL,
  `Horas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Poyectos_idPoyectos`, `Empleados_Trabajadores_DNI`),
  CONSTRAINT `fk_Trabajadores_estan_proyectos_Poyectos1`
    FOREIGN KEY (`Poyectos_idPoyectos`)
    REFERENCES `mydb`.`Poyectos` (`idPoyectos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `CIF` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `CP` INT NULL DEFAULT NULL,
  `Ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `Provincia` VARCHAR(45) NULL DEFAULT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CIF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa_tiene_proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa_tiene_proyectos` (
  `Poyectos_idPoyectos` INT NOT NULL AUTO_INCREMENT,
  `Empresa_CIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Poyectos_idPoyectos`, `Empresa_CIF`),
  INDEX `fk_Empresa_tiene_proyectos_Poyectos1_idx` (`Poyectos_idPoyectos` ASC) VISIBLE,
  INDEX `fk_Empresa_tiene_proyectos_Empresa1_idx` (`Empresa_CIF` ASC) VISIBLE,
  CONSTRAINT `fk_Empresa_tiene_proyectos_Empresa1`
    FOREIGN KEY (`Empresa_CIF`)
    REFERENCES `mydb`.`Empresa` (`CIF`),
  CONSTRAINT `fk_Empresa_tiene_proyectos_Poyectos1`
    FOREIGN KEY (`Poyectos_idPoyectos`)
    REFERENCES `mydb`.`Poyectos` (`idPoyectos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `mydb`;

DELIMITER $$
USE `mydb`$$
CREATE
DEFINER=`root`@`%`
TRIGGER `mydb`.`Usuarios_AI`
AFTER INSERT ON `mydb`.`Usuarios`
FOR EACH ROW
BEGIN
	if(new.Departamento like 'Recursos Humanos') then
		INSERT INTO `Recursos_humanos` (Usuarios_DNI) values (new.DNI);
	else if(new.Departamento like 'Tecnico') then
		INSERT INTO `Empleado` (Usuarios_DNI) values (new.DNI);
        end if;
	end if;
END$$

USE `mydb`$$
CREATE
DEFINER=`root`@`%`
TRIGGER `mydb`.`Usuarios_AU`
AFTER UPDATE ON `mydb`.`Usuarios`
FOR EACH ROW
BEGIN
	if(old.Departamento <> new.Departamento) then
		if(new.Departamento like 'Recursos Humanos') then
			DELETE FROM `Empleado` WHERE Usuarios_DNI like old.DNI;
			INSERT INTO `Recursos_humanos` (Usuarios_DNI) values (old.DNI);
		else
			DELETE FROM `Recursos_humanos` WHERE Usuarios_DNI like old.DNI;
			INSERT INTO `Empleado` (Usuarios_DNI) values (old.DNI);
		end if;
	end if;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
