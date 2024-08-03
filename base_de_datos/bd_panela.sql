-- Base de datos sencilla de un listado de maquinas usado en una empresa mediana de produccion de panelas

-- --------------------------------------------------------
-- Juan Diego Duarte
-- Version 1
-- Abril, 2024
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------


-- Volcando estructura de base de datos para credicel_parts_maq_panela
CREATE DATABASE IF NOT EXISTS `credicel_parts_maq_panela` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `credicel_parts_maq_panela`;

-- Volcando estructura para tabla credicel_parts_maq_panela.equipos_secundario
CREATE TABLE IF NOT EXISTS `equipos_secundario` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `marca` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `modelo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `codigo_equipo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `caracteristica_tecnica` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `equipos_id_maquina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `codigo_equipo` (`codigo_equipo`),
  KEY `FK1_maquina_equip_sec` (`equipos_id_maquina`),
  CONSTRAINT `FK1_maquina_equip_sec` FOREIGN KEY (`equipos_id_maquina`) REFERENCES `maquina` (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='contiene los equipos que componen las maquinas';

-- Volcando datos para la tabla credicel_parts_maq_panela.equipos_secundario: ~25 rows (aproximadamente)
DELETE FROM `equipos_secundario`;
/*!40000 ALTER TABLE `equipos_secundario` DISABLE KEYS */;
INSERT INTO `equipos_secundario` (`id_equipo`, `nombre`, `marca`, `modelo`, `codigo_equipo`, `caracteristica_tecnica`, `equipos_id_maquina`) VALUES
	(1, 'motor', 'siemenes', 'EN 44', 'm01', '25 HP', 3),
	(2, 'reductor', 'Nord', ' 2524', 'r01', '43:1', 3),
	(3, 'Molino de mazas', 'NA', '3 Mazas 14"', 'm02', '2000 psi', 3),
	(4, 'balanza 300 Kg', 'Rocket', 'Ak-04', 'b01', '300 Kg, 2 kg', 1),
	(5, 'Estibador', 'littemulte', 'pwh25', 'e01', '2500 kg', 2),
	(6, 'motor', 'siemens', '2YA67', 'm03', '3 hp', 4),
	(7, 'bomba', 'sihi', 'Gp-2', 'b02', '15 m3/h', 4),
	(8, 'tanque', 'NA', 'NA', 't01', '1000 L', 4),
	(9, 'motor', 'siemenes', '2YA70', 'm04', '5 hp', 5),
	(10, 'bomba', 'sihi', 'gp-4', 'b03', '25 m3/h', 5),
	(11, 'tanque', 'NA', 'NA', 't02', '10000 L', 5),
	(12, 'motor', 'siemens', '2YA67', 'm05', '3 hp', 5),
	(13, 'reductor', 'Nord', '2520', 'r02', '110:1', 5),
	(14, 'Fondo 1', 'NA', 'NA', 'f01', '300 L', 6),
	(15, 'Fondo 2', 'NA', 'NA', 'f02', '300 L', 6),
	(16, 'tanque', 'NA', 'NA', 't03', '2000 L', 6),
	(17, 'Fondo 1', 'NA', 'NA', 'f03', '300 Kg', 7),
	(18, 'Fondo 2', 'NA', 'NA', 'f04', '300 Kg', 7),
	(19, 'gavera 200 g', 'NA', 'Rectangular plana', 'g01', '30 x 200 g', 8),
	(20, 'motor', 'siemens', '2YA67', 'm06', '3 Hp', 9),
	(21, 'reductor', 'nord', '2522', 'r03', '85:1', 9),
	(23, 'transportador', 'cadenpal', '4"', 't09', '5 ton /h ', 9),
	(24, 'motor', 'siemens', '2YA75', 'm07', '10 Hp', 11),
	(25, 'ventilador', 'NA', 'NA', 'v01', '1000 CFM', 11),
	(26, 'horno', 'NA', 'CIMPA', 'h01', '1000 Kg/h', 10);
/*!40000 ALTER TABLE `equipos_secundario` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_parts_maq_panela.maquina
CREATE TABLE IF NOT EXISTS `maquina` (
  `id_maquina` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci DEFAULT NULL,
  `codigo_maquina` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci DEFAULT NULL,
  `fabricante` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci DEFAULT NULL,
  `capacidad` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci DEFAULT NULL,
  `maquina_id_ubicacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_maquina`),
  UNIQUE KEY `codigo_maquina` (`codigo_maquina`),
  KEY `FK1_ubicacion_maquinas` (`maquina_id_ubicacion`),
  CONSTRAINT `FK1_ubicacion_maquinas` FOREIGN KEY (`maquina_id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='continene las diferentes maquinas que intervienen en la elaboracion de panela\r\n';

-- Volcando datos para la tabla credicel_parts_maq_panela.maquina: ~11 rows (aproximadamente)
DELETE FROM `maquina`;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` (`id_maquina`, `nombre`, `codigo_maquina`, `fabricante`, `capacidad`, `maquina_id_ubicacion`) VALUES
	(1, 'balanzas', 'B01', 'Rocket', '0-300 Kg', 1),
	(2, 'estibadores', 'E01', 'LittleMutle', '2500 Kg', 1),
	(3, 'molino', 'M01', 'NA', '2000 Kg/h', 2),
	(4, 'tanque jugo residual', 'T01', 'NA', '1000 L', 2),
	(5, 'tanques de clarificacion', 'T02', 'NA', '10000 L', 3),
	(6, 'fondos de evaporacion', 'F01', 'NA', '300 L', 4),
	(7, 'fondos de concentracion', 'F02', 'NA', '300 kg', 5),
	(8, 'gaveras', 'G02', 'NA', '300 Kg', 6),
	(9, 'transportador de bagazo', 'T03', 'NA', '1000 Kg/h', 7),
	(10, 'caldera', 'C01', 'CIMPA', '1000 Kg/h', 7),
	(11, 'ventilador de la caldera', 'V01', 'VentColombia', '1000 CFM', 7);
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_parts_maq_panela.partes_de_equipos
CREATE TABLE IF NOT EXISTS `partes_de_equipos` (
  `id_partes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` varchar(50) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `codigo_partes` varchar(50) DEFAULT NULL,
  `partes_id_maquina` int(11) DEFAULT NULL,
  `partes_id_equipos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_partes`),
  KEY `FK2_maquinas_parte` (`partes_id_maquina`),
  KEY `FK2_equipos_parte` (`partes_id_equipos`),
  CONSTRAINT `FK2_equipos_parte` FOREIGN KEY (`partes_id_equipos`) REFERENCES `equipos_secundario` (`id_equipo`),
  CONSTRAINT `FK2_maquinas_parte` FOREIGN KEY (`partes_id_maquina`) REFERENCES `maquina` (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='contiene las partes que componen los equipos';

-- Volcando datos para la tabla credicel_parts_maq_panela.partes_de_equipos: ~9 rows (aproximadamente)
DELETE FROM `partes_de_equipos`;
/*!40000 ALTER TABLE `partes_de_equipos` DISABLE KEYS */;
INSERT INTO `partes_de_equipos` (`id_partes`, `nombre`, `cantidad`, `referencia`, `material`, `codigo_partes`, `partes_id_maquina`, `partes_id_equipos`) VALUES
	(1, 'Rodamiento', '2', '6204', '100Cr6', 'mtor01', 4, 4),
	(2, 'rodamiento', '2', '6309', '100Cr6', 'mtro02', 3, 3),
	(3, 'rodamiento', '2', '6314', '100Cr6', 'mtro03', 3, 17),
	(4, 'impulsor', '1', 'NA', 'Fundicion', 'mtoi01', 4, 18),
	(5, 'celda de carga', '1', 'kce-23', 'inox', 'mtrc01', 1, 1),
	(6, 'rodamiento', '8', '6204', '100cr6', 'mtor01', 2, 2),
	(7, 'retenedor', '2', '12-32-8', 'buna', 'mtor2', 2, 2),
	(8, 'sensor', '1', 'mp100', 'inox', 'mtos01', 4, 24),
	(10, 'mazas', '3', '14" x 3/8"', 'fundicion gris', 'mtom01', 3, 3),
	(11, 'tornabagazo', '1', '29" x 3/8"', 'Acero al carbon', 'mtot01', 3, 3),
	(12, 'cadena_transportadora', '55', 'paso 4", raspetas', 'AC', 'mtoc01', 9, 23);
/*!40000 ALTER TABLE `partes_de_equipos` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_parts_maq_panela.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `codigo_ubicacion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `capacidad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ubicacion`),
  UNIQUE KEY `codigo_ubicacion` (`codigo_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='describe la ubicacion de la maquina en las areas de la empresa\r\n';

-- Volcando datos para la tabla credicel_parts_maq_panela.ubicacion: ~6 rows (aproximadamente)
DELETE FROM `ubicacion`;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` (`id_ubicacion`, `nombre`, `codigo_ubicacion`, `capacidad`) VALUES
	(1, 'Bodega de apronte', 'U01', '30 Ton'),
	(2, 'Molienda', 'U02', '2 Ton/h'),
	(3, 'Clarificacion', 'U03', '300 L/h'),
	(4, 'Evaporacion', 'U04', '300 L/h'),
	(5, 'Concentracion', 'U05', '300 L/h'),
	(6, 'Moldeo', 'U06', '100 Kg/h'),
	(7, 'Bodega de bagazo', 'U07', '30 Ton');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
