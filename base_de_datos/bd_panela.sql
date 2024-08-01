-- Base de datos sencilla de un listado de maquinas usado en una empresa mediana de produccion de panelas

-- --------------------------------------------------------
-- Juan Diego Duarte
-- Version 1
-- Abril, 2024
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='contiene los equipos que componen las maquinas';

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='continene las diferentes maquinas que intervienen en la elaboracion de panela\r\n';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla credicel_parts_maq_panela.partes_de_equipos
CREATE TABLE IF NOT EXISTS `partes_de_equipos` (
  `id_partes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` varchar(50) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `codigo_partes` varchar(50) DEFAULT NULL,
  `partes_id_equipos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_partes`),
  UNIQUE KEY `codigo_partes` (`codigo_partes`),
  KEY `FK1_equipos_partes` (`partes_id_equipos`),
  CONSTRAINT `FK1_equipos_partes` FOREIGN KEY (`partes_id_equipos`) REFERENCES `equipos_secundario` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='contiene las partes que componen los equipos';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla credicel_parts_maq_panela.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `codigo_ubicacion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `capacidad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ubicacion`),
  UNIQUE KEY `codigo_ubicacion` (`codigo_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='describe la ubicacion de la maquina en las areas de la empresa\r\n';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
