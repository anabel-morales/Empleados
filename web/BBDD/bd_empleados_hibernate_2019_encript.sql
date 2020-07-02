-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5709
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_empleados_hibernate_2019_encript
CREATE DATABASE IF NOT EXISTS `bd_empleados_hibernate_2019_encript` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_empleados_hibernate_2019_encript`;

-- Volcando estructura para tabla bd_empleados_hibernate_2019_encript.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `localizacion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_empleados_hibernate_2019_encript.departamento: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
REPLACE INTO `departamento` (`id`, `codigo`, `descripcion`, `localizacion`) VALUES
	(1, '10', 'Ventas', 'Madrid'),
	(2, '20', 'Contabilidad', 'Valencia'),
	(3, '30', 'Logística', 'Albacete'),
	(4, '40', 'Gerencia', 'Madrid'),
	(8, '50', 'I&D', 'Alicante'),
	(11, '60', 'Ventas', 'Granada');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Volcando estructura para tabla bd_empleados_hibernate_2019_encript.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varbinary(50) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `password` varchar(200) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `profesion` varchar(15) NOT NULL,
  `salario` double DEFAULT NULL,
  `fechaNac` date NOT NULL,
  `fechaIng` date NOT NULL,
  `idDepartamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `FK_idx` (`idDepartamento`),
  CONSTRAINT `FK` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_empleados_hibernate_2019_encript.empleado: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
REPLACE INTO `empleado` (`id`, `codigo`, `nif`, `password`, `apellidos`, `nombre`, `profesion`, `salario`, `fechaNac`, `fechaIng`, `idDepartamento`) VALUES
	(28, _binary 0x2CEFBFBD7259EFBFBDEFBFBDEFBFBD3D75160F4056EFBFBD05EFBFBD, '99987765D', '1b47e87d02781e58a171f3221a7e4c032e67f2d0', 'López Pérez', 'Diego', 'Vendedor', 27000, '1991-01-18', '2019-12-20', 11),
	(29, _binary 0xEFBFBDEFBFBDEFBFBDEFBFBD6F48EFBFBD343C3C4FCA9F7E2FEFBFBD, '08861760T', 'e7097cce199f6eda0670bf5c2486f94d18406983', 'Antúnez Picazo', 'Luisa', 'Vendedor', 27000, '1996-05-29', '2019-12-20', 11),
	(30, _binary 0xEFBFBDEFBFBDDB94EFBFBD2B3A5B103BEFBFBD5D3BEFBFBDEFBFBD69, '22117719B', '61632e2a55f7e115822cc70c24cf22542a4720b5', 'Diaz Querol', 'Emilia', 'Vendedor', 27000, '1983-11-10', '2019-12-20', 11);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para vista bd_empleados_hibernate_2019_encript.emple_depart
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `emple_depart` (
	`id` INT(11) NOT NULL,
	`nif` VARCHAR(9) NOT NULL COLLATE 'utf8_general_ci',
	`nombre` VARCHAR(15) NOT NULL COLLATE 'utf8_general_ci',
	`apellidos` VARCHAR(25) NOT NULL COLLATE 'utf8_general_ci',
	`descripcion` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`localizacion` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista bd_empleados_hibernate_2019_encript.emple_depart
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `emple_depart`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emple_depart` AS select `e`.`id` AS `id`,`e`.`nif` AS `nif`,`e`.`nombre` AS `nombre`,`e`.`apellidos` AS `apellidos`,`d`.`descripcion` AS `descripcion`,`d`.`localizacion` AS `localizacion` from (`empleado` `e` join `departamento` `d`) where (`e`.`idDepartamento` = `d`.`id`) order by `e`.`id` ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
