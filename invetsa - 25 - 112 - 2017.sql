-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-12-2017 a las 01:44:10
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `invetsa`
--
CREATE DATABASE IF NOT EXISTS `invetsa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `invetsa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE `accion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accion`
--

INSERT INTO `accion` (`id`, `nombre`, `id_hoja_verificacion`, `imei`) VALUES
(1, 'Laboratorio de preparación de vacuna', 8, '000000000000000'),
(2, 'Equipo Invetsa-Temp y otros', 8, '000000000000000'),
(3, 'Sala de vacunación', 8, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

CREATE TABLE `centros` (
  `id` int(11) NOT NULL,
  `nombre` text,
  `direccion` text,
  `tipo` text,
  `latitud` decimal(13,7) DEFAULT NULL,
  `longitud` decimal(13,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`id`, `nombre`, `direccion`, `tipo`, `latitud`, `longitud`) VALUES
(1, 'casa', 'farma', 'Farmacia', '-17.3255000', '-63.2485000'),
(2, 'target', 'farma', 'Farmacia', '-17.3255000', '-63.2485000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `id_pais`, `deleted_at`) VALUES
(1, 'SANTA CRUZ', 1, NULL),
(2, 'LA PAZ', 1, NULL),
(3, 'COCHABAMBA', 1, NULL),
(4, 'TARIJA', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

CREATE TABLE `compania` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compania`
--

INSERT INTO `compania` (`id`, `nombre`, `direccion`) VALUES
(1, 'INVETSA', 'casa'),
(2, 'Nolberto Zabala', 'casa'),
(3, 'Edgar Elio', 'casas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_indice`
--

CREATE TABLE `control_indice` (
  `id` int(11) NOT NULL,
  `nro_pollos_vacunado` int(11) DEFAULT '0',
  `puntaje` int(11) DEFAULT '0',
  `nro_pollos_controlados` int(11) DEFAULT '0',
  `nro_pollos_no_vacunados` int(11) DEFAULT '0',
  `nro_heridos` int(11) DEFAULT '0',
  `nro_mojados` int(11) DEFAULT '0',
  `nro_mala_posicion` int(11) DEFAULT '0',
  `nro_pollos_vacunados_correctamente` int(11) DEFAULT '0',
  `id_hoja_verificacion` int(11) NOT NULL,
  `id_vacunador` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `indice_eficiencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `control_indice`
--

INSERT INTO `control_indice` (`id`, `nro_pollos_vacunado`, `puntaje`, `nro_pollos_controlados`, `nro_pollos_no_vacunados`, `nro_heridos`, `nro_mojados`, `nro_mala_posicion`, `nro_pollos_vacunados_correctamente`, `id_hoja_verificacion`, `id_vacunador`, `imei`, `indice_eficiencia`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, '000000000000000', 0),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 8, 4, '000000000000000', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_accion`
--

CREATE TABLE `detalle_accion` (
  `id` int(11) NOT NULL,
  `esperado` varchar(50) DEFAULT NULL,
  `encontrado` varchar(50) DEFAULT NULL,
  `id_accion` int(11) NOT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_accion`
--

INSERT INTO `detalle_accion` (`id`, `esperado`, `encontrado`, `id_accion`, `id_hoja_verificacion`, `imei`) VALUES
(1, 'Temperatura 24 a 27 ºC', '', 1, 8, '000000000000000'),
(1, 'Guantes y Lentes', 'SI', 2, 8, '000000000000000'),
(1, 'Mesa circular-lineal-individual', 'Circular', 3, 8, '000000000000000'),
(2, 'Ventilación forzada', 'SI', 1, 8, '000000000000000'),
(2, 'Recipiente de agua', 'SI', 2, 8, '000000000000000'),
(2, 'Cambio agujas c/2,000 pollos', 'SI', 3, 8, '000000000000000'),
(3, 'Limpieza después c/vacunación', 'SI', 1, 8, '000000000000000'),
(3, 'Tº 27 a 37 ºC (promedio 32 ºC)', '', 2, 8, '000000000000000'),
(3, 'T º 24 a 27 º C', '', 3, 8, '000000000000000'),
(4, 'Humedad 65 % HR', '', 1, 8, '000000000000000'),
(4, 'Rompe ampollas', 'SI', 2, 8, '000000000000000'),
(4, 'Ventilación forzada', 'SI', 3, 8, '000000000000000'),
(5, 'Presión positiva', 'SI', 1, 8, '000000000000000'),
(5, 'Aguja 18 G x 18 1 ½” (rosada)', 'SI', 2, 8, '000000000000000'),
(5, 'Limpieza después c/vacunación', 'SI', 3, 8, '000000000000000'),
(6, 'Desinfección post limpieza', 'SI', 1, 8, '000000000000000'),
(6, 'Algodón', 'SI', 2, 8, '000000000000000'),
(6, 'Nº de maquinas', '', 3, 8, '000000000000000'),
(7, 'Colorante Marek dosis', '', 2, 8, '000000000000000'),
(7, 'Cajas plásticas / cartón', 'Plasticas', 3, 8, '000000000000000'),
(8, 'Conectores “Y”', 'SI', 2, 8, '000000000000000'),
(8, 'Humedad 60 a 70 % HR', '', 3, 8, '000000000000000'),
(9, 'Calentador de agua', 'SI', 2, 8, '000000000000000'),
(9, 'Presión negativa', 'SI', 3, 8, '000000000000000'),
(10, 'Termómetro', 'SI', 2, 8, '000000000000000'),
(10, 'Desinfección post limpieza', 'SI', 3, 8, '000000000000000'),
(11, 'Soporte de ampollas', 'SI', 2, 8, '000000000000000'),
(12, 'Jeringas  5 y/o 10 ml', '', 2, 8, '000000000000000'),
(13, 'Alcohol', 'SI', 2, 8, '000000000000000'),
(14, 'Papel Toalla', 'SI', 2, 8, '000000000000000'),
(15, 'Tubería nueva para vacuna', 'Nuevo', 2, 8, '000000000000000'),
(16, 'Esterilizador/Autoclave', '', 2, 8, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inspeccion_funcionamiento`
--

CREATE TABLE `detalle_inspeccion_funcionamiento` (
  `id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `criterio_evaluacion` text,
  `estado` tinyint(4) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `bueno` int(11) DEFAULT NULL,
  `malo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_inspeccion_funcionamiento`
--

INSERT INTO `detalle_inspeccion_funcionamiento` (`id`, `id_inspeccion`, `criterio_evaluacion`, `estado`, `imei`, `id_servicio`, `bueno`, `malo`) VALUES
(1, 1, 'UBICACION DE MAQUINA', NULL, '000000000000000', 1, 0, 0),
(1, 1, 'NIVELACION DE LA MAQUINA', NULL, '000000000000000', 2, 0, 0),
(1, 1, 'UBICACION DE LA MAQUINA', NULL, '000000000000000', 3, 0, 0),
(1, 2, 'MATERIALES UTILIZADOS', NULL, '000000000000000', 1, 0, 0),
(1, 2, 'MATERIALES UTILIZADOS', NULL, '000000000000000', 2, 0, 0),
(1, 2, 'MATERIALES UTILIZADOS', NULL, '000000000000000', 3, 0, 0),
(2, 1, 'PRESION DE COMPRESORA', NULL, '000000000000000', 1, 0, 0),
(2, 1, 'PRESION DE COMPRESORA', NULL, '000000000000000', 2, 0, 0),
(2, 1, 'PRESION DE COMPRESORA', NULL, '000000000000000', 3, 0, 0),
(2, 2, 'CAMBIO DE PIEZAS DESCARTABLES', NULL, '000000000000000', 1, 0, 0),
(2, 2, 'CAMBIO DE PIEZAS DESCARTABLES', NULL, '000000000000000', 2, 0, 0),
(2, 2, 'CAMBIO DE PIEZAS DESCARTABLES', NULL, '000000000000000', 3, 0, 0),
(3, 1, 'PRESION DE MAQUINA', NULL, '000000000000000', 1, 0, 0),
(3, 1, 'PRESION DE MAQUINA', NULL, '000000000000000', 2, 0, 0),
(3, 1, 'PRESIÓN DE MAQUINA', NULL, '000000000000000', 3, 0, 0),
(3, 2, 'LIMPIEZA DE PLACA TWIN TOUCH', NULL, '000000000000000', 1, 0, 0),
(3, 2, 'ENJUAGUE DE TUBERIAS', NULL, '000000000000000', 2, 0, 0),
(3, 2, 'LIMPIEZA PLATO COLOCACION', NULL, '000000000000000', 3, 0, 0),
(4, 1, 'ACTIVACION', NULL, '000000000000000', 1, 0, 0),
(4, 1, 'RETIRO DE CAJAS', NULL, '000000000000000', 2, 0, 0),
(4, 1, 'ACTIVACIÓN', NULL, '000000000000000', 3, 0, 0),
(4, 2, 'ESTERILIZADO DE VALVULA', NULL, '000000000000000', 1, 0, 0),
(4, 2, 'ESTERILIZADO DE VALVULAS', NULL, '000000000000000', 2, 0, 0),
(4, 2, 'ESTERILIZADO DE JERINGA', NULL, '000000000000000', 3, 0, 0),
(5, 1, 'FUNCIONAMIENTO DE CONTADORES', NULL, '000000000000000', 1, 0, 0),
(5, 1, 'ACTIVACION DE FOSKI', NULL, '000000000000000', 2, 0, 0),
(5, 1, 'FUNCION DE CONTADORES', NULL, '000000000000000', 3, 0, 0),
(5, 2, 'LIMPIEZA DE MODULO INYECTOR', NULL, '000000000000000', 1, 0, 0),
(5, 2, 'ESTERILIZADO DE TUBERIAS', NULL, '000000000000000', 2, 0, 0),
(5, 2, 'LIMPIEZA MODULO INYECTOR', NULL, '000000000000000', 3, 0, 0),
(6, 1, 'FUNCIONAMIENTO DE SILBATO', NULL, '000000000000000', 1, 0, 0),
(6, 1, 'BOQUILLAS', NULL, '000000000000000', 2, 0, 0),
(6, 1, 'FUNCIONAMIENTO SILBATO', NULL, '000000000000000', 3, 0, 0),
(6, 2, 'LIMPIEZA DE CEREBRO', NULL, '000000000000000', 1, 0, 0),
(6, 2, 'ESTERILIZADO DE BOUILLAS', NULL, '000000000000000', 2, 0, 0),
(6, 2, 'LIMPIEZA DEL CEREBRO', NULL, '000000000000000', 3, 0, 0),
(7, 1, 'SALIDA DE AGUJA', NULL, '000000000000000', 1, 0, 0),
(7, 1, 'DISPERSION DE SOLUCION VACUNAL', NULL, '000000000000000', 2, 0, 0),
(7, 1, 'SALIDA DE AGUJA', NULL, '000000000000000', 3, 0, 0),
(7, 2, 'SECADO', NULL, '000000000000000', 1, 0, 0),
(7, 2, 'SECADO', NULL, '000000000000000', 2, 0, 0),
(7, 2, 'SECADO', NULL, '000000000000000', 3, 0, 0),
(8, 1, 'CALIBRACION', NULL, '000000000000000', 1, 0, 0),
(8, 1, 'CALIBRACION', NULL, '000000000000000', 2, 0, 0),
(8, 1, 'CALIBRACION', NULL, '000000000000000', 3, 0, 0),
(8, 2, 'PROTECCION', NULL, '000000000000000', 1, 0, 0),
(8, 2, 'PROTECCION', NULL, '000000000000000', 2, 0, 0),
(8, 2, 'PROTECCION', NULL, '000000000000000', 3, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inspeccion_visual`
--

CREATE TABLE `detalle_inspeccion_visual` (
  `id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(4) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `bueno` text,
  `regular` text,
  `malo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_inspeccion_visual`
--

INSERT INTO `detalle_inspeccion_visual` (`id`, `id_inspeccion`, `codigo`, `descripcion`, `estado`, `imei`, `id_servicio`, `bueno`, `regular`, `malo`) VALUES
(1, 1, 'AV-131', 'BASE DE ALUMINIO', NULL, '000000000000000', 1, '', '', ''),
(1, 1, 'SV-2001', 'CUBIERTA DE ACRILICO', NULL, '000000000000000', 2, '', '', ''),
(1, 1, 'ZT50', 'PLATO DIVISOR DEL MEDIO DEL GABINETE', NULL, '000000000000000', 3, '', '', ''),
(2, 1, 'AV-1331', 'BLOQUE POSTERIOR', NULL, '000000000000000', 1, '', '', ''),
(2, 1, 'SV-602', 'MESA DE METAL', NULL, '000000000000000', 2, '', '', ''),
(2, 1, 'ZT51M-ZT51', 'CUBIERTA TRASERA CON LOGO MERIAL', NULL, '000000000000000', 3, '', '', ''),
(3, 1, 'AV-13413', 'BLOQUE DE CILINDRO DE FUERZA', NULL, '000000000000000', 1, '', '', ''),
(3, 1, 'S/CODIGO', 'GARRUCHAS', NULL, '000000000000000', 2, '', '', ''),
(3, 1, 'ZT52', 'BISAGRA PARA LA CUBIERTA DEL FRENTE', NULL, '000000000000000', 3, '', '', ''),
(4, 1, 'AV-13421', 'BLOQUE DE JERINGA', NULL, '000000000000000', 1, '', '', ''),
(4, 1, 'SV-100', 'ENSAMBLAJE DE JERINGA', NULL, '000000000000000', 2, '', '', ''),
(4, 1, 'ZT53S-ZT53', 'CUBIERTA DEL FRENTE EN ACERO INOX', NULL, '000000000000000', 3, '', '', ''),
(5, 1, 'AV-13511', 'BLOQUE DELANTERO GUIA', NULL, '000000000000000', 1, '', '', ''),
(5, 1, 'SV-101', 'BASE DE ALUMINIO', NULL, '000000000000000', 2, '', '', ''),
(5, 1, 'ZT54-ZT54D', 'TAPA INFERIOR DEL GABINETE', NULL, '000000000000000', 3, '', '', ''),
(6, 1, 'AV-137', 'VALVULA DE CONTROL', NULL, '000000000000000', 1, '', '', ''),
(6, 1, 'SV-106', 'VALVULA DE CONTROL', NULL, '000000000000000', 2, '', '', ''),
(6, 1, 'ZT55', 'PATA DE GOMA', NULL, '000000000000000', 3, '', '', ''),
(7, 1, 'AV-1378', 'REPTS. DE VALVULA DE CONTROL', NULL, '000000000000000', 1, '', '', ''),
(7, 1, 'SV-1378', 'REPTS. DE VALVULA DE CONTROL', NULL, '000000000000000', 2, '', '', ''),
(7, 1, 'ZT46', 'TORNILLO P/L CUBIERTA DE PLATO', NULL, '000000000000000', 3, '', '', ''),
(8, 1, 'AV-111', 'PLACA TWIN TOUCH', NULL, '000000000000000', 1, '', '', ''),
(8, 1, 'SV-934', 'ACOPLADURA RAPIDA DE VALVULA', NULL, '000000000000000', 2, '', '', ''),
(8, 1, 'ZT45', 'TUERCA MONTAJE DEL PLATO DE COLOCACION', NULL, '000000000000000', 3, '', '', ''),
(9, 1, 'AV-114', 'BOLITAS DE TEFLON (bueno)', NULL, '000000000000000', 1, '', '', ''),
(9, 1, 'SV-104', 'SEGURO', NULL, '000000000000000', 2, '', '', ''),
(9, 1, 'ZT44', 'BOTON DE TOQUE', NULL, '000000000000000', 3, '', '', ''),
(10, 1, 'SV-1344', 'CILINDRO DE FUERZA', NULL, '000000000000000', 2, '', '', ''),
(10, 1, 'ZT43', 'MICRO VALVULA P.ACTIVAR CILINDRO DE AIRE', NULL, '000000000000000', 3, '', '', ''),
(11, 1, 'AV-114', 'BOLITAS DE TEFLON (malo)', NULL, '000000000000000', 1, '', '', ''),
(11, 1, '5708', 'SUBPLACA ASOCIABLE', NULL, '000000000000000', 2, '', '', ''),
(11, 1, 'ZT42', 'CUBIERTA DEL PLATO DE COLOCACION', NULL, '000000000000000', 3, '', '', ''),
(12, 1, 'AV-117', 'CONECTOR DE AIRE DE TWIN SHOT', NULL, '000000000000000', 1, '', '', ''),
(12, 1, '5709', 'SUBPLACA SENCILLA', NULL, '000000000000000', 2, '', '', ''),
(12, 1, 'ZT41', 'PLATO DE COLOCACION', NULL, '000000000000000', 3, '', '', ''),
(13, 1, 'AV-121', 'SEGURO DE TAPA', NULL, '000000000000000', 1, '', '', ''),
(13, 1, 'SV-2008', 'FRASCO NALGENE', NULL, '000000000000000', 2, '', '', ''),
(13, 1, 'ZT40', 'PLATO DE COLOCACION EMSAMBLAJE CUBIERTA', NULL, '000000000000000', 3, '', '', ''),
(14, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO (bueno)', NULL, '000000000000000', 1, '', '', ''),
(14, 1, 'SV-607', 'ACRILICOS FIJADORES DE FRASCOS', NULL, '000000000000000', 2, '', '', ''),
(14, 1, 'ZT410', 'TORNILLO PARA ZT409NS(x2)', NULL, '000000000000000', 3, '', '', ''),
(15, 1, 'SV-2002', 'ENSAMBLAJE DE BOQUILLAS', NULL, '000000000000000', 2, '', '', ''),
(15, 1, 'ZT409', 'PLACA DE MONTAJE PARA TTP', NULL, '000000000000000', 3, '', '', ''),
(16, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO (malo)', NULL, '000000000000000', 1, '', '', ''),
(16, 1, 'SV-1030', 'ACOPLADORA 90', NULL, '000000000000000', 2, '', '', ''),
(16, 1, 'ZT407', 'CONECTOR Y (4mm)', NULL, '000000000000000', 3, '', '', ''),
(17, 1, 'AV-1357', 'SEGURO DE VALVULA', NULL, '000000000000000', 1, '', '', ''),
(17, 1, 'SV-933', 'ACOPLADORA TEE', NULL, '000000000000000', 2, '', '', ''),
(17, 1, 'ZT406', 'SENSOR DE SANGRADO', NULL, '000000000000000', 3, '', '', ''),
(18, 1, '5647', 'CLAMP DE TUBERIA DE 1/2', NULL, '000000000000000', 1, '', '', ''),
(18, 1, 'SV-936', 'BOQUILLAS', NULL, '000000000000000', 2, '', '', ''),
(18, 1, 'ZT405', 'TORNILLO PARA ZT403NS(x2)', NULL, '000000000000000', 3, '', '', ''),
(19, 1, '5548', 'CLAMP DE TUBERIA DE 5/16', NULL, '000000000000000', 1, '', '', ''),
(19, 1, 'SV-611', 'SOSTENEDOR DE BOQUILLA', NULL, '000000000000000', 2, '', '', ''),
(19, 1, 'ZT403', 'BOTON TACTIL', NULL, '000000000000000', 3, '', '', ''),
(20, 1, '5732', 'DETECTOR DE POSICION', NULL, '000000000000000', 1, '', '', ''),
(20, 1, 'SV-608', 'CLAMP. ADHESIVOS DE 1/4', NULL, '000000000000000', 2, '', '', ''),
(20, 1, 'ZT401', 'TTP CUERPO DE LA PLACA', NULL, '000000000000000', 3, '', '', ''),
(21, 1, '3543', 'CONECTOR DE 5/32', NULL, '000000000000000', 1, '', '', ''),
(21, 1, 'SV-609', 'LOGO DE SPRA-VAC', NULL, '000000000000000', 2, '', '', ''),
(21, 1, 'ZT400', 'CONJUNTO DE PLACA TACTIL DOBLE TTP', NULL, '000000000000000', 3, '', '', ''),
(22, 1, 'AV-1346', 'ACOPLADURA COLDER MACHO', NULL, '000000000000000', 1, '', '', ''),
(22, 1, 'SV-605', 'CORTINAS', NULL, '000000000000000', 2, '', '', ''),
(22, 1, 'ZT57SM', 'JERINGA SECUNDARIA DE 0.1ml', NULL, '000000000000000', 3, '', '', ''),
(23, 1, 'AV-1344', 'CILINDRO DE FUERZA', NULL, '000000000000000', 1, '', '', ''),
(23, 1, 'SV-606', 'VARILLAS', NULL, '000000000000000', 2, '', '', ''),
(23, 1, 'ZT58SM', 'JERINGA SECUNDARIA DE 0.2ml', NULL, '000000000000000', 3, '', '', ''),
(24, 1, 'AV-1345', 'CILINDRO DE AJUSTE', NULL, '000000000000000', 1, '', '', ''),
(24, 1, 'SV-2011', 'FOSKI SWITCH', NULL, '000000000000000', 2, '', '', ''),
(24, 1, 'ZT63M', 'TUERCA SEGURIDAD PUNTA JERINGA', NULL, '000000000000000', 3, '', '', ''),
(25, 1, '5720', 'CONECTOR RAPIDO 5/32', NULL, '000000000000000', 1, '', '', ''),
(25, 1, 'SV-1139', 'SEGURO DE FOSKI', NULL, '000000000000000', 2, '', '', ''),
(25, 1, 'ZT626', 'CONECTOR PARA ZT621NS-ZT625NS', NULL, '000000000000000', 3, '', '', ''),
(26, 1, '5641', 'CONECTOR DE AIRE DE BRONCE', NULL, '000000000000000', 1, '', '', ''),
(26, 1, 'SV-2004', 'ENSAMBLAJE FILTRO REGULADOR', NULL, '000000000000000', 2, '', '', ''),
(26, 1, 'ZT623NS', 'TUBERIA PARA CONECTAR JERINGAS P./S.(x10)NS', NULL, '000000000000000', 3, '', '', ''),
(27, 1, 'AV-13411', 'SELLO DE CILINDRO DE FUERZA', NULL, '000000000000000', 1, '', '', ''),
(27, 1, 'SV-809', 'REGULADOR DE AIRE', NULL, '000000000000000', 2, '', '', ''),
(27, 1, 'ZT623', 'TUBERIA PARA CONECTAR JERINGAS P./S.(x10)', NULL, '000000000000000', 3, '', '', ''),
(28, 1, 'AV-13422', 'RETENEDOR DE JERINGA', NULL, '000000000000000', 1, '', '', ''),
(28, 1, 'SV-810', 'MANOMETRO', NULL, '000000000000000', 2, '', '', ''),
(28, 1, 'ZT661M', 'JUEGO EMPAQUES 1MILLON INY.0.1ML.', NULL, '000000000000000', 3, '', '', ''),
(29, 1, 'AV-13521', 'SOSTENEDOR DE LA AGUJA', NULL, '000000000000000', 1, '', '', ''),
(29, 1, 'S720', 'CONECTOR RAPIDO 5/32', NULL, '000000000000000', 2, '', '', ''),
(29, 1, 'ZT681M', 'JUEGO EMPAQUES 1MILLON INY.0.2ML.', NULL, '000000000000000', 3, '', '', ''),
(30, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (bueno)', NULL, '000000000000000', 1, '', '', ''),
(30, 1, 'SV-817', 'CONECTOR RAPIDO HEMBRA', NULL, '000000000000000', 2, '', '', ''),
(30, 1, 'ZT01-ZT01N', 'MANOMETRO', NULL, '000000000000000', 3, '', '', ''),
(31, 1, 'SV-818', 'CONECTOR RAPIDO MACHO', NULL, '000000000000000', 2, '', '', ''),
(31, 1, 'ZT02', 'CONTADOR DE LOTE', NULL, '000000000000000', 3, '', '', ''),
(32, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (malo)', NULL, '000000000000000', 1, '', '', ''),
(32, 1, 'SV-1163', 'MENISCO CALIBRADOR', NULL, '000000000000000', 2, '', '', ''),
(32, 1, 'ZT03', 'CONTADOR TOTALIZADOR', NULL, '000000000000000', 3, '', '', ''),
(33, 1, 'AV-1374', 'EMPAQUE O ASIENTO (bueno)', NULL, '000000000000000', 1, '', '', ''),
(33, 1, '5083', 'JERINGA DESCARTABLE', NULL, '000000000000000', 2, '', '', ''),
(33, 1, 'ZT04', 'CUBIERTA DEL CONT. LOTE', NULL, '000000000000000', 3, '', '', ''),
(34, 1, '5441', 'TUBERIA DE POLYVINILO', NULL, '000000000000000', 2, '', '', ''),
(34, 1, 'ZT05', 'CUBIERTA CONT. TOTALIZADOR', NULL, '000000000000000', 3, '', '', ''),
(35, 1, 'AV-1374', 'EMPAQUE O ASIENTO (malo)', NULL, '000000000000000', 1, '', '', ''),
(35, 1, '3520', 'TUBERIA PEQUEÑA', NULL, '000000000000000', 2, '', '', ''),
(35, 1, 'ZT06', 'PLACA PARA FIJAR EL CONT. LOTE', NULL, '000000000000000', 3, '', '', ''),
(36, 1, 'AV-1375', 'EMPAQUE O CAPTURA (bueno)', NULL, '000000000000000', 1, '', '', ''),
(36, 1, 'SV-1110', 'TUBERIA DE TEFLON', NULL, '000000000000000', 2, '', '', ''),
(36, 1, 'ZT07', 'PLACA PARA FIJAR EL CONT. TOTALIZADOR', NULL, '000000000000000', 3, '', '', ''),
(37, 1, 'SV-1115', 'TUBERIA LATEX', NULL, '000000000000000', 2, '', '', ''),
(37, 1, 'ZT17', 'FILTRO REGULADOR', NULL, '000000000000000', 3, '', '', ''),
(38, 1, 'AV-1375', 'EMPAQUE O CAPTURA (malo)', NULL, '000000000000000', 1, '', '', ''),
(38, 1, '', 'MOTOR', NULL, '000000000000000', 2, '', '', ''),
(38, 1, 'ZT18', 'CONECTOR ESPIGADO EN CODO 1/4 P/FILTRO', NULL, '000000000000000', 3, '', '', ''),
(39, 1, 'AV-1377', 'BOLITAS DE ACERO (bueno)', NULL, '000000000000000', 1, '', '', ''),
(39, 1, '', 'MANOMETRO', NULL, '000000000000000', 2, '', '', ''),
(39, 1, 'ZT23', 'CONECTOR MACHO PARA AIRE', NULL, '000000000000000', 3, '', '', ''),
(40, 1, '', 'REGULADOR DE AIRE', NULL, '000000000000000', 2, '', '', ''),
(40, 1, 'ZT24', 'CONECTOR HEMBRA PARA AIRE', NULL, '000000000000000', 3, '', '', ''),
(41, 1, 'AV-1377', 'BOLITAS DE ACERO (malo)', NULL, '000000000000000', 1, '', '', ''),
(41, 1, '', 'TANQUE DE COMPRESORA', NULL, '000000000000000', 2, '', '', ''),
(41, 1, 'ZT25', 'ACOPLE REDUCTOR CONECTOR DEL MANOMETRO', NULL, '000000000000000', 3, '', '', ''),
(42, 1, 'AV-1376', 'RESORTES (bueno)', NULL, '000000000000000', 1, '', '', ''),
(42, 1, '', 'RUEDAS', NULL, '000000000000000', 2, '', '', ''),
(42, 1, 'ZT28', 'TAPON DE GOMA(VAL.AGUJA)', NULL, '000000000000000', 3, '', '', ''),
(43, 1, '', 'CABLES ELECTRICOS', NULL, '000000000000000', 2, '', '', ''),
(43, 1, 'ZT26', 'EMPAQUE P/CONECTOR MACHO AIRE(x10)', NULL, '000000000000000', 3, '', '', ''),
(44, 1, 'AV-1376', 'RESORTES (malo)', NULL, '000000000000000', 1, '', '', ''),
(44, 1, '', 'VALVULA DE PURGAR', NULL, '000000000000000', 2, '', '', ''),
(44, 1, 'ZT30', 'PLATO DE MONTAJE C/TORNILLOS-MANOMETRO', NULL, '000000000000000', 3, '', '', ''),
(45, 1, 'AV-13523', 'REGULADORES SALIDA DE AGUJA', NULL, '000000000000000', 1, '', '', ''),
(45, 1, '', 'MANGUERA', NULL, '000000000000000', 2, '', '', ''),
(45, 1, 'ZT14', 'BOTON DE REINICIO DEL CONTADOR', NULL, '000000000000000', 3, '', '', ''),
(46, 1, 'AV-1347', 'ACOPLADURA COLDER HEMBRA', NULL, '000000000000000', 1, '', '', ''),
(46, 1, 'ZT16', 'MECANISMO INTERNO BOTON DE INICIADOR', NULL, '000000000000000', 3, '', '', ''),
(47, 1, 'AV-230', 'DISTRIBUIDOR DE AIRE', NULL, '000000000000000', 1, '', '', ''),
(47, 1, 'ZT08', 'INTERRUPTOR ENCENDIDO / APAGADO', NULL, '000000000000000', 3, '', '', ''),
(48, 1, 'AV-1032', 'CONECTOR RAPIDO ENTRADA', NULL, '000000000000000', 1, '', '', ''),
(48, 1, 'ZT10', 'MEC. INTERNO P/INTERRUPTOR ON/OFF', NULL, '000000000000000', 3, '', '', ''),
(49, 1, '5430', 'SILBATO', NULL, '000000000000000', 1, '', '', ''),
(49, 1, 'ZT11', 'BOTON DE PRUEBA', NULL, '000000000000000', 3, '', '', ''),
(50, 1, '5443', 'CONECTOR RAPIDO HEMBRA', NULL, '000000000000000', 1, '', '', ''),
(50, 1, 'ZT13', 'MEC. INTERNO DEL BOTON DE PRUEBA', NULL, '000000000000000', 3, '', '', ''),
(51, 1, '5445', 'CONECTOR RAPIDO MACHO', NULL, '000000000000000', 1, '', '', ''),
(51, 1, 'ZT091', 'INTERRUPTOR PRE-SELECCION METODO INY.', NULL, '000000000000000', 3, '', '', ''),
(52, 1, '5728', 'VALVULA DE CUATRO SALIDAS', NULL, '000000000000000', 1, '', '', ''),
(52, 1, 'ZT092', 'MEC. INTERNO P/INTERRUPTOR PRE-SELECCION', NULL, '000000000000000', 3, '', '', ''),
(53, 1, '5700', 'VALVULA DE UNA SALIDA', NULL, '000000000000000', 1, '', '', ''),
(53, 1, 'ZT27', 'VALVULA NEUMATICA DE LA AGUJA', NULL, '000000000000000', 3, '', '', ''),
(54, 1, '5709', ' SUBPLACA SENCILLA', NULL, '000000000000000', 1, '', '', ''),
(54, 1, 'ZT37', 'CELULA LOGICA AZUL', NULL, '000000000000000', 3, '', '', ''),
(55, 1, '5730', 'RELAY SENSOR', NULL, '000000000000000', 1, '', '', ''),
(55, 1, 'ZT38', 'CELULA LOGICA GRIS', NULL, '000000000000000', 3, '', '', ''),
(56, 1, '5701', 'CELULA NEGATIVA', NULL, '000000000000000', 1, '', '', ''),
(56, 1, 'ZT39', 'CELULA LOGICA AMARILLA', NULL, '000000000000000', 3, '', '', ''),
(57, 1, '5738', 'VALVULA DE LA AGUJA', NULL, '000000000000000', 1, '', '', ''),
(57, 1, 'ZT355', 'VALVULA DE ACTIVACION PARA EL ZT35', NULL, '000000000000000', 3, '', '', ''),
(58, 1, '5703', 'VALVULA DE IMPULSO', NULL, '000000000000000', 1, '', '', ''),
(58, 1, 'ZT367', 'ON-OFF INTERRUPTOR DE PRUEBA', NULL, '000000000000000', 3, '', '', ''),
(59, 1, '5600', 'PATAS DE CAUCHO', NULL, '000000000000000', 1, '', '', ''),
(59, 1, 'ZT365', 'ON-OFF MECANISMO DE CAMBIO DE PRUEBA', NULL, '000000000000000', 3, '', '', ''),
(60, 1, '5710', 'SWITCH DE TRES POSICIONES', NULL, '000000000000000', 1, '', '', ''),
(60, 1, 'ZT368', 'SIMPLE/DOBLE MECANISMO(INTERRUPTOR DE MODO)', NULL, '000000000000000', 3, '', '', ''),
(61, 1, '5726', 'REGULADOR DE AIRE', NULL, '000000000000000', 1, '', '', ''),
(61, 1, 'ZT366', 'SIMPLE/DOBLE MECANISMO DEL INTERRUPTOR', NULL, '000000000000000', 3, '', '', ''),
(62, 1, '5724', 'MANOMETRO', NULL, '000000000000000', 1, '', '', ''),
(62, 1, 'ZT363', 'CONECTOR RECTO 4MM', NULL, '000000000000000', 3, '', '', ''),
(63, 1, '5423', 'CONTADOR TOTAL', NULL, '000000000000000', 1, '', '', ''),
(63, 1, 'ZT370', 'VALVULA RETENCION EN LINEA(VAL. FLUJO LIBRE)', NULL, '000000000000000', 3, '', '', ''),
(64, 1, '5426', 'PROTECTOR DE CONT. TOTAL', NULL, '000000000000000', 1, '', '', ''),
(64, 1, 'ZT362', 'VALVULA UNIDIRECCIONAL', NULL, '000000000000000', 3, '', '', ''),
(65, 1, '5422', 'CONTADOR PREFIJADO', NULL, '000000000000000', 1, '', '', ''),
(65, 1, 'ZT357', 'CONECTOR T (4mm)', NULL, '000000000000000', 3, '', '', ''),
(66, 1, '5418', 'RE-ESTABLECEDOR DE CONTADOR', NULL, '000000000000000', 1, '', '', ''),
(66, 1, 'ZT356', 'DISTRIBUIDOR DE AIRE MULTIPLE', NULL, '000000000000000', 3, '', '', ''),
(67, 1, '5425', 'PROTECTOR DE CONT.PREFIJADO', NULL, '000000000000000', 1, '', '', ''),
(67, 1, 'ZT358', 'CONECTOR EN CRUZ (4mm)', NULL, '000000000000000', 3, '', '', ''),
(68, 1, 'AV-138', 'JERINGA DESCARTABLE', NULL, '000000000000000', 1, '', '', ''),
(68, 1, 'ZT361', 'VALVULA 3 SALIDAS', NULL, '000000000000000', 3, '', '', ''),
(69, 1, '3520', 'TUBERIA PEQUENA (bueno)', NULL, '000000000000000', 1, '', '', ''),
(69, 1, 'ZT360', 'CELULA+BASE(RELE SENSOR AMARILLO)', NULL, '000000000000000', 3, '', '', ''),
(70, 1, 'ZT369', 'VALVULA DE IMPULSO+CONECTOR', NULL, '000000000000000', 3, '', '', ''),
(71, 1, '3520', 'TUBERIA PEQUENA (malo)', NULL, '000000000000000', 1, '', '', ''),
(71, 1, 'ZT625NS', 'ESPACIADOR ENTRADA D/L SEGUNDA JERINGA', NULL, '000000000000000', 3, '', '', ''),
(72, 1, 'SV-11155', 'TUBERIA LATEX (bueno)', NULL, '000000000000000', 1, '', '', ''),
(72, 1, 'ZT19', 'CILINDRO DE AIRE CON TUERCA DE MONTAJE', NULL, '000000000000000', 3, '', '', ''),
(73, 1, 'ZT20', 'CONECTOR DE 4mm P/CILINDRO DE AIRE', NULL, '000000000000000', 3, '', '', ''),
(74, 1, 'SV-11155', 'TUBERIA LATEX (malo)', NULL, '000000000000000', 1, '', '', ''),
(74, 1, 'ZT191', 'DETECTOR MANETICO DE POSICION P/CILINDRO DE AIIRE', NULL, '000000000000000', 3, '', '', ''),
(75, 1, 'ZT21B', 'CONECTOR PARA ACOPLE DE JERINGA', NULL, '000000000000000', 3, '', '', ''),
(76, 1, 'ZT212', 'IMPULSADOR ESPACIADOR D/L JERINGA SECUNDARIA', NULL, '000000000000000', 3, '', '', ''),
(77, 1, 'ZT33', 'RESORTE P/SOSTENEDOR DE LA JERINGA', NULL, '000000000000000', 3, '', '', ''),
(78, 1, 'ZT311', 'SOSTENEDOR DE LA JERINGA', NULL, '000000000000000', 3, '', '', ''),
(79, 1, 'ZT91', 'TORNILLOS DE FIJACION 6x20 PARA ZT31(x2)', NULL, '000000000000000', 3, '', '', ''),
(80, 1, 'ZT911', 'TORNILLOS DE FIJACION 6x50', NULL, '000000000000000', 3, '', '', ''),
(81, 1, 'ZT34', 'PLACA P/MONT. DEL SOSTENEDOR D/L JERINGA', NULL, '000000000000000', 3, '', '', ''),
(82, 1, 'ZT49', 'PLATO GUIA P/SOSTENEDOR D/L JERINGA', NULL, '000000000000000', 3, '', '', ''),
(83, 1, 'ZT84', 'PROBETA CALIBRADOR', NULL, '000000000000000', 3, '', '', ''),
(84, 1, 'ZT83M', 'PIEZA FINAL DEL PISTON DE LA JERINGA', NULL, '000000000000000', 3, '', '', ''),
(85, 1, 'ZT82M', 'RESORTES DEL EMBOLO D/L JERINGA', NULL, '000000000000000', 3, '', '', ''),
(86, 1, 'ZT81M', 'TUERCA TAPA D/EMBOLO D/L JERINGA', NULL, '000000000000000', 3, '', '', ''),
(87, 1, 'ZT90', 'TORNILLO 4x16 P/L PIEZA FINAL JERINGA ZT83M', NULL, '000000000000000', 3, '', '', ''),
(88, 1, 'ZT101', 'ACEITE VASELINA EN SPRAY (VEGETAL)', NULL, '000000000000000', 3, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_limpieza`
--

CREATE TABLE `detalle_limpieza` (
  `id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `criterio_evaluacion` text,
  `bueno` int(11) DEFAULT NULL,
  `malo` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_puntuacion`
--

CREATE TABLE `detalle_puntuacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `id_puntuacion` int(11) NOT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_puntuacion`
--

INSERT INTO `detalle_puntuacion` (`id`, `nombre`, `estado`, `id_puntuacion`, `id_sistema`, `imei`) VALUES
(1, 'Comisura', 0, 1, 1, '000000000000000'),
(1, 'Comisura', 0, 1, 2, '000000000000000'),
(1, 'Comisura', 0, 1, 3, '000000000000000'),
(1, 'Comisura', 0, 1, 4, '000000000000000'),
(1, 'Pechuga', 0, 2, 1, '000000000000000'),
(1, 'Pechuga', 0, 2, 2, '000000000000000'),
(1, 'Pechuga', 0, 2, 3, '000000000000000'),
(1, 'Pechuga', 0, 2, 4, '000000000000000'),
(1, 'Fragil', 0, 3, 1, '000000000000000'),
(1, 'Fragil', 0, 3, 2, '000000000000000'),
(1, 'Fragil', 0, 3, 3, '000000000000000'),
(1, 'Fragil', 0, 3, 4, '000000000000000'),
(1, 'A favor de la Bursa', 0, 4, 1, '000000000000000'),
(1, 'A favor de la Bursa', 0, 4, 2, '000000000000000'),
(1, 'A favor de la Bursa', 0, 4, 3, '000000000000000'),
(1, 'A favor de la Bursa', 0, 4, 4, '000000000000000'),
(1, 'Normal', 0, 5, 1, '000000000000000'),
(1, 'Normal', 0, 5, 2, '000000000000000'),
(1, 'Normal', 0, 5, 3, '000000000000000'),
(1, 'Normal', 0, 5, 4, '000000000000000'),
(1, 'Normal', 0, 6, 1, '000000000000000'),
(1, 'Normal', 0, 6, 2, '000000000000000'),
(1, 'Normal', 0, 6, 3, '000000000000000'),
(1, 'Normal', 0, 6, 4, '000000000000000'),
(1, 'Normales', 0, 7, 1, '000000000000000'),
(1, 'Normales', 0, 7, 2, '000000000000000'),
(1, 'Normales', 0, 7, 3, '000000000000000'),
(1, 'Normales', 0, 7, 4, '000000000000000'),
(1, 'Normal', 0, 8, 1, '000000000000000'),
(1, 'Normal', 0, 8, 2, '000000000000000'),
(1, 'Normal', 0, 8, 3, '000000000000000'),
(1, 'Normal', 0, 8, 4, '000000000000000'),
(1, 'Normal', 0, 9, 1, '000000000000000'),
(1, 'Normal', 0, 9, 2, '000000000000000'),
(1, 'Normal', 0, 9, 3, '000000000000000'),
(1, 'Normal', 0, 9, 4, '000000000000000'),
(1, 'Normal', 0, 10, 1, '000000000000000'),
(1, 'Normal', 0, 10, 2, '000000000000000'),
(1, 'Normal', 0, 10, 3, '000000000000000'),
(1, 'Normal', 0, 10, 4, '000000000000000'),
(1, 'LLena', 0, 11, 1, '000000000000000'),
(1, 'LLena', 0, 11, 2, '000000000000000'),
(1, 'LLena', 0, 11, 3, '000000000000000'),
(1, 'LLena', 0, 11, 4, '000000000000000'),
(1, 'Normal', 0, 12, 1, '000000000000000'),
(1, 'Normal', 0, 12, 2, '000000000000000'),
(1, 'Normal', 0, 12, 3, '000000000000000'),
(1, 'Normal', 0, 12, 4, '000000000000000'),
(1, '0', 0, 13, 1, '000000000000000'),
(1, '0', 0, 13, 2, '000000000000000'),
(1, '0', 0, 13, 3, '000000000000000'),
(1, '0', 0, 13, 4, '000000000000000'),
(1, 'Normal', 0, 14, 1, '000000000000000'),
(1, 'Normal', 0, 14, 2, '000000000000000'),
(1, 'Normal', 0, 14, 3, '000000000000000'),
(1, 'Normal', 0, 14, 4, '000000000000000'),
(1, 'Acervulina', 0, 15, 1, '000000000000000'),
(1, 'Acervulina', 0, 15, 2, '000000000000000'),
(1, 'Acervulina', 0, 15, 3, '000000000000000'),
(1, 'Acervulina', 0, 15, 4, '000000000000000'),
(1, 'Normal', 0, 16, 1, '000000000000000'),
(1, 'Normal', 0, 16, 2, '000000000000000'),
(1, 'Normal', 0, 16, 3, '000000000000000'),
(1, 'Normal', 0, 16, 4, '000000000000000'),
(1, 'Reactiva', 0, 17, 1, '000000000000000'),
(1, 'Reactiva', 0, 17, 2, '000000000000000'),
(1, 'Reactiva', 0, 17, 3, '000000000000000'),
(1, 'Reactiva', 0, 17, 4, '000000000000000'),
(1, 'Reactiva', 0, 18, 1, '000000000000000'),
(1, 'Reactiva', 0, 18, 2, '000000000000000'),
(1, 'Reactiva', 0, 18, 3, '000000000000000'),
(1, 'Reactiva', 0, 18, 4, '000000000000000'),
(1, 'Presencia', 0, 19, 1, '000000000000000'),
(1, 'Presencia', 0, 19, 2, '000000000000000'),
(1, 'Presencia', 0, 19, 3, '000000000000000'),
(1, 'Presencia', 0, 19, 4, '000000000000000'),
(2, 'Paladar Duro', 0, 1, 1, '000000000000000'),
(2, 'Paladar Duro', 0, 1, 2, '000000000000000'),
(2, 'Paladar Duro', 0, 1, 3, '000000000000000'),
(2, 'Paladar Duro', 0, 1, 4, '000000000000000'),
(2, 'Pierna', 0, 2, 1, '000000000000000'),
(2, 'Pierna', 0, 2, 2, '000000000000000'),
(2, 'Pierna', 0, 2, 3, '000000000000000'),
(2, 'Pierna', 0, 2, 4, '000000000000000'),
(2, 'Flexible', 0, 3, 1, '000000000000000'),
(2, 'Flexible', 0, 3, 2, '000000000000000'),
(2, 'Flexible', 0, 3, 3, '000000000000000'),
(2, 'Flexible', 0, 3, 4, '000000000000000'),
(2, 'A favor de la Bursa', 0, 4, 1, '000000000000000'),
(2, 'A favor de la Bursa', 0, 4, 2, '000000000000000'),
(2, 'A favor de la Bursa', 0, 4, 3, '000000000000000'),
(2, 'A favor de la Bursa', 0, 4, 4, '000000000000000'),
(2, 'Anormal', 0, 5, 1, '000000000000000'),
(2, 'Anormal', 0, 5, 2, '000000000000000'),
(2, 'Anormal', 0, 5, 3, '000000000000000'),
(2, 'Anormal', 0, 5, 4, '000000000000000'),
(2, 'Normal', 0, 6, 1, '000000000000000'),
(2, 'Normal', 0, 6, 2, '000000000000000'),
(2, 'Normal', 0, 6, 3, '000000000000000'),
(2, 'Normal', 0, 6, 4, '000000000000000'),
(2, 'Aerosaculitis Abdominal', 0, 7, 1, '000000000000000'),
(2, 'Aerosaculitis Abdominal', 0, 7, 2, '000000000000000'),
(2, 'Aerosaculitis Abdominal', 0, 7, 3, '000000000000000'),
(2, 'Aerosaculitis Abdominal', 0, 7, 4, '000000000000000'),
(2, 'Congestionada', 0, 8, 1, '000000000000000'),
(2, 'Congestionada', 0, 8, 2, '000000000000000'),
(2, 'Congestionada', 0, 8, 3, '000000000000000'),
(2, 'Congestionada', 0, 8, 4, '000000000000000'),
(2, 'Congestionado', 0, 9, 1, '000000000000000'),
(2, 'Congestionado', 0, 9, 2, '000000000000000'),
(2, 'Congestionado', 0, 9, 3, '000000000000000'),
(2, 'Congestionado', 0, 9, 4, '000000000000000'),
(2, 'Inflamado', 0, 10, 1, '000000000000000'),
(2, 'Inflamado', 0, 10, 2, '000000000000000'),
(2, 'Inflamado', 0, 10, 3, '000000000000000'),
(2, 'Inflamado', 0, 10, 4, '000000000000000'),
(2, 'Vacia', 0, 11, 1, '000000000000000'),
(2, 'Vacia', 0, 11, 2, '000000000000000'),
(2, 'Vacia', 0, 11, 3, '000000000000000'),
(2, 'Vacia', 0, 11, 4, '000000000000000'),
(2, 'Proventriculitis', 0, 12, 1, '000000000000000'),
(2, 'Proventriculitis', 0, 12, 2, '000000000000000'),
(2, 'Proventriculitis', 0, 12, 3, '000000000000000'),
(2, 'Proventriculitis', 0, 12, 4, '000000000000000'),
(2, '1', 0, 13, 1, '000000000000000'),
(2, '1', 0, 13, 2, '000000000000000'),
(2, '1', 0, 13, 3, '000000000000000'),
(2, '1', 0, 13, 4, '000000000000000'),
(2, 'Enteritis (yeyuno)', 0, 14, 1, '000000000000000'),
(2, 'Enteritis (yeyuno)', 0, 14, 2, '000000000000000'),
(2, 'Enteritis (yeyuno)', 0, 14, 3, '000000000000000'),
(2, 'Enteritis (yeyuno)', 0, 14, 4, '000000000000000'),
(2, 'Maxima', 0, 15, 1, '000000000000000'),
(2, 'Maxima', 0, 15, 2, '000000000000000'),
(2, 'Maxima', 0, 15, 3, '000000000000000'),
(2, 'Maxima', 0, 15, 4, '000000000000000'),
(2, 'Tiflitis Erosiva', 0, 16, 1, '000000000000000'),
(2, 'Tiflitis Erosiva', 0, 16, 2, '000000000000000'),
(2, 'Tiflitis Erosiva', 0, 16, 3, '000000000000000'),
(2, 'Tiflitis Erosiva', 0, 16, 4, '000000000000000'),
(2, 'No reactiva', 0, 17, 1, '000000000000000'),
(2, 'No reactiva', 0, 17, 2, '000000000000000'),
(2, 'No reactiva', 0, 17, 3, '000000000000000'),
(2, 'No reactiva', 0, 17, 4, '000000000000000'),
(2, '', 0, 18, 1, '000000000000000'),
(2, '', 0, 18, 2, '000000000000000'),
(2, '', 0, 18, 3, '000000000000000'),
(2, '', 0, 18, 4, '000000000000000'),
(2, 'Ausencia', 0, 19, 1, '000000000000000'),
(2, 'Ausencia', 0, 19, 2, '000000000000000'),
(2, 'Ausencia', 0, 19, 3, '000000000000000'),
(2, 'Ausencia', 0, 19, 4, '000000000000000'),
(3, 'Paladar Blando', 0, 1, 1, '000000000000000'),
(3, 'Paladar Blando', 0, 1, 2, '000000000000000'),
(3, 'Paladar Blando', 0, 1, 3, '000000000000000'),
(3, 'Paladar Blando', 0, 1, 4, '000000000000000'),
(3, 'Esternon', 0, 2, 1, '000000000000000'),
(3, 'Esternon', 0, 2, 2, '000000000000000'),
(3, 'Esternon', 0, 2, 3, '000000000000000'),
(3, 'Esternon', 0, 2, 4, '000000000000000'),
(3, 'Duro', 0, 3, 1, '000000000000000'),
(3, 'Duro', 0, 3, 2, '000000000000000'),
(3, 'Duro', 0, 3, 3, '000000000000000'),
(3, 'Duro', 0, 3, 4, '000000000000000'),
(3, 'Relacion 1/1', 0, 4, 1, '000000000000000'),
(3, 'Relacion 1/1', 0, 4, 2, '000000000000000'),
(3, 'Relacion 1/1', 0, 4, 3, '000000000000000'),
(3, 'Relacion 1/1', 0, 4, 4, '000000000000000'),
(3, 'Aerosaculitis Toracica', 0, 7, 1, '000000000000000'),
(3, 'Aerosaculitis Toracica', 0, 7, 2, '000000000000000'),
(3, 'Aerosaculitis Toracica', 0, 7, 3, '000000000000000'),
(3, 'Aerosaculitis Toracica', 0, 7, 4, '000000000000000'),
(3, 'Hemorragica', 0, 8, 1, '000000000000000'),
(3, 'Hemorragica', 0, 8, 2, '000000000000000'),
(3, 'Hemorragica', 0, 8, 3, '000000000000000'),
(3, 'Hemorragica', 0, 8, 4, '000000000000000'),
(3, 'Palido Friable', 0, 10, 1, '000000000000000'),
(3, 'Palido Friable', 0, 10, 2, '000000000000000'),
(3, 'Palido Friable', 0, 10, 3, '000000000000000'),
(3, 'Palido Friable', 0, 10, 4, '000000000000000'),
(3, '2', 0, 13, 1, '000000000000000'),
(3, '2', 0, 13, 2, '000000000000000'),
(3, '2', 0, 13, 3, '000000000000000'),
(3, '2', 0, 13, 4, '000000000000000'),
(3, 'Equimosis', 0, 14, 1, '000000000000000'),
(3, 'Equimosis', 0, 14, 2, '000000000000000'),
(3, 'Equimosis', 0, 14, 3, '000000000000000'),
(3, 'Equimosis', 0, 14, 4, '000000000000000'),
(3, 'Tenella', 0, 15, 1, '000000000000000'),
(3, 'Tenella', 0, 15, 2, '000000000000000'),
(3, 'Tenella', 0, 15, 3, '000000000000000'),
(3, 'Tenella', 0, 15, 4, '000000000000000'),
(3, 'Placas diftericas', 0, 16, 1, '000000000000000'),
(3, 'Placas diftericas', 0, 16, 2, '000000000000000'),
(3, 'Placas diftericas', 0, 16, 3, '000000000000000'),
(3, 'Placas diftericas', 0, 16, 4, '000000000000000'),
(4, 'Necrosis de la Punta de la Lengua', 0, 1, 1, '000000000000000'),
(4, 'Necrosis de la Punta de la Lengua', 0, 1, 2, '000000000000000'),
(4, 'Necrosis de la Punta de la Lengua', 0, 1, 3, '000000000000000'),
(4, 'Necrosis de la Punta de la Lengua', 0, 1, 4, '000000000000000'),
(4, 'Con Mucosidad', 0, 8, 1, '000000000000000'),
(4, 'Con Mucosidad', 0, 8, 2, '000000000000000'),
(4, 'Con Mucosidad', 0, 8, 3, '000000000000000'),
(4, 'Con Mucosidad', 0, 8, 4, '000000000000000'),
(4, 'Moteado', 0, 10, 1, '000000000000000'),
(4, 'Moteado', 0, 10, 2, '000000000000000'),
(4, 'Moteado', 0, 10, 3, '000000000000000'),
(4, 'Moteado', 0, 10, 4, '000000000000000'),
(4, '3', 0, 13, 1, '000000000000000'),
(4, '3', 0, 13, 2, '000000000000000'),
(4, '3', 0, 13, 3, '000000000000000'),
(4, '3', 0, 13, 4, '000000000000000'),
(4, 'Desp. Mucosa', 0, 14, 1, '000000000000000'),
(4, 'Desp. Mucosa', 0, 14, 2, '000000000000000'),
(4, 'Desp. Mucosa', 0, 14, 3, '000000000000000'),
(4, 'Desp. Mucosa', 0, 14, 4, '000000000000000'),
(4, 'Necrafix', 0, 15, 1, '000000000000000'),
(4, 'Necrafix', 0, 15, 2, '000000000000000'),
(4, 'Necrafix', 0, 15, 3, '000000000000000'),
(4, 'Necrafix', 0, 15, 4, '000000000000000'),
(4, 'Gaseosos(cont)', 0, 16, 1, '000000000000000'),
(4, 'Gaseosos(cont)', 0, 16, 2, '000000000000000'),
(4, 'Gaseosos(cont)', 0, 16, 3, '000000000000000'),
(4, 'Gaseosos(cont)', 0, 16, 4, '000000000000000'),
(5, 'Punto de exudado', 0, 10, 1, '000000000000000'),
(5, 'Punto de exudado', 0, 10, 2, '000000000000000'),
(5, 'Punto de exudado', 0, 10, 3, '000000000000000'),
(5, 'Punto de exudado', 0, 10, 4, '000000000000000'),
(5, 'Enteritis mucoide', 0, 14, 1, '000000000000000'),
(5, 'Enteritis mucoide', 0, 14, 2, '000000000000000'),
(5, 'Enteritis mucoide', 0, 14, 3, '000000000000000'),
(5, 'Enteritis mucoide', 0, 14, 4, '000000000000000'),
(5, 'Liquido(cont)', 0, 16, 1, '000000000000000'),
(5, 'Liquido(cont)', 0, 16, 2, '000000000000000'),
(5, 'Liquido(cont)', 0, 16, 3, '000000000000000'),
(5, 'Liquido(cont)', 0, 16, 4, '000000000000000'),
(6, 'Transito Rapido', 0, 14, 1, '000000000000000'),
(6, 'Transito Rapido', 0, 14, 2, '000000000000000'),
(6, 'Transito Rapido', 0, 14, 3, '000000000000000'),
(6, 'Transito Rapido', 0, 14, 4, '000000000000000'),
(6, 'Sangre(cont)', 0, 16, 1, '000000000000000'),
(6, 'Sangre(cont)', 0, 16, 2, '000000000000000'),
(6, 'Sangre(cont)', 0, 16, 3, '000000000000000'),
(6, 'Sangre(cont)', 0, 16, 4, '000000000000000'),
(7, 'Gas/espuma', 0, 14, 1, '000000000000000'),
(7, 'Gas/espuma', 0, 14, 2, '000000000000000'),
(7, 'Gas/espuma', 0, 14, 3, '000000000000000'),
(7, 'Gas/espuma', 0, 14, 4, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `direccion`, `id_ciudad`, `deleted_at`) VALUES
(1, 'AVESCA', 'sin dirección', 1, NULL),
(2, 'AVÍCOLA FELICIDAD', 'CALLE VILOMA S/N SIPE – SIPE  ZONA CHURQUI', 2, NULL),
(3, 'AVÍCOLA MODELO', 'YAPACANI Km 137', 1, NULL),
(4, 'AVÍCOLA DON LUCAS\n', 'CARRETERA A LAS BRECHAS # 7', 1, NULL),
(5, 'AVÍCOLA EL PICHON', 'CARRETERA A CAMIRI Km 120', 1, NULL),
(6, 'AVÍCOLA POLO', 'Av. ELIAS MENESES # 0430 ', 2, NULL),
(7, 'AVÍCOLA R Y R', 'FINAL CALLE COLOMBIA S/N (KM 20 CARRETERA A SANTA CRUZ)', 2, NULL),
(8, 'AVÍCOLA SAN JAVIER\n', 'CHIMORE CARRETERA NUEVA CBBA ', 1, NULL),
(9, 'AVÍCOLA WARNES', 'CARRETERA A LA BELGICA km 26', 1, NULL),
(10, 'AVIGUA', 'CARRETERA A CAMIRI Km 140', 1, NULL),
(11, 'AVIROSI', 'C/ SUCRE # 748', 4, NULL),
(12, 'CAISY', 'SAN JUAN DE YAPACANI Km 150', 1, NULL),
(13, 'DANIEL MEDINA', '', 1, NULL),
(14, 'DOMENICO MANICONE', 'AV. JUAN DE LA ROSA # 1153', 1, NULL),
(15, 'EDMUNDO BONILLA', 'CARRETERA A LA GUARDIA km 24', 1, NULL),
(16, 'HACIENDA PAUCARPATA', 'CALLE PAUCARPATA S/N – ZONA PAUCARPATA (QUILLACOLLO)', 2, NULL),
(17, 'HIPOLITO CAMPOS', 'KM 17 DOBLE VIA A LA GUARDIA', 1, NULL),
(18, 'HUMBOLDT', 'CARRETERA A COTOCA Km 5', 1, NULL),
(19, 'IMBA', 'CERCA DE PRODASA', 1, NULL),
(20, 'INACRUZ', 'CARRETERA A LA GUARDIA Km 15', 1, NULL),
(21, 'INAVI', 'SANTA CRUZ - MONTERO Km 50', 1, NULL),
(22, 'JAVIER ESPINOZA', 'MONTERO ', 1, NULL),
(23, 'AVICOLA ESPINOZA', 'CARRETERA A OKINAWA', 1, NULL),
(24, 'JORGE MENESES', 'CARRETERA AL NORTE Km 88 \"SANTA ROSA\"', 1, NULL),
(25, 'JORGE VARGAS', '', 1, NULL),
(26, 'JOSE GUZMAN ', 'ZONA VALLE HERMOSO', 2, NULL),
(28, 'JOSE LUIS SEJAS', 'CHIMORE', 2, NULL),
(29, 'LUCIO MEJIA', 'CARRETERA A CAMIRI Km 45', 1, NULL),
(30, 'MIGUEL ANGEL CANSECO', 'Av/ JAIME MENDOZA # 1158', 2, NULL),
(31, 'PIO LINDO', 'CARRETERA AL NORTE Km 10', 1, NULL),
(32, 'PIO RICO', 'CARRETERA A OKINAWA Km 10', 1, NULL),
(33, 'POLLO ANDALUZ', 'C/ VIRGINIA LEMA # 667', 4, NULL),
(34, 'PROAVI', 'ALBOLEDA Km 85', 1, NULL),
(35, 'PRODASA', 'LA BELGICA', 1, NULL),
(36, 'AVICOLA SOFIA', 'CARRETERA A CAMIRI  Km 18', 1, NULL),
(37, 'Z.ZEBALLOS', ' FINAL Av/ MOSCU ', 1, NULL),
(38, 'ZARAGOZA', 'ZONA LOS LOTES B/EL PALMAR ', 1, NULL),
(39, 'AVILAND', 'CAÑADA LARGA KM 100', 1, NULL),
(40, 'PROAVI', 'CARRETERA A WARNES Km 23', 1, NULL),
(41, 'AVÍCOLA MODELO CBBA', 'Calle  Intiraymi # 100 (granja recria) ZONA CHOQUECHAMPI – SACABA', 2, NULL),
(42, 'BENJAMÍN AMURRIO', 'OFICINA DE AVICOLA ANSALDO', 2, NULL),
(43, 'IMBA CBBA', 'Km 4 ½ Av VICTOR USTARIZ', 2, NULL),
(44, 'PIO LINDO CBBA', 'CALLE LA LIBERTAD ESQ. FILIPINAS # 132 VALLE HERMOSO Km 5', 2, NULL),
(45, 'PIO RICO CBBA', 'OFICINA CBBA/Tadeo Haenke 1783', 2, NULL),
(46, 'BENJAMÍN AMURRIO 2', 'C. CAFETALES ESQ DURASNEROS # 16 (alto Quero Quero)\r\n', 2, NULL),
(47, 'PIO RICO CBBA 2', 'ESTA MAQUINA FUE EXTRAVIADA SE DEBE FACTURAR AL CLIENTE\r\n', 2, NULL),
(48, 'PRODASA 2', 'CARRETERA A CAMIRI  Km 115', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galpon`
--

CREATE TABLE `galpon` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_granja` int(11) NOT NULL,
  `cantidad_pollo` int(11) DEFAULT NULL,
  `codigo` text NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galpon`
--

INSERT INTO `galpon` (`id`, `id_empresa`, `id_granja`, `cantidad_pollo`, `codigo`, `deleted_at`) VALUES
(1, 1, 1, 100, 'A1', NULL),
(8, 2, 2, 150, 'A1', NULL),
(9, 2, 2, 156, 'A2', NULL),
(10, 1, 1, 100, 'A2', NULL),
(11, 1, 1, 100, 'A3', NULL),
(12, 1, 1, 100, 'A4', NULL),
(13, 1, 1, 100, 'A5', NULL),
(14, 1, 1, 100, 'A6', NULL),
(15, 1, 1, 100, 'A7', NULL),
(16, 1, 1, 100, 'A8', NULL),
(17, 1, 1, 100, 'A9', NULL),
(18, 1, 1, 100, 'B1', NULL),
(19, 1, 4, 100, 'Galpon 1', NULL),
(20, 1, 4, 200, 'Galpon 2', NULL),
(21, 1, 4, 250, 'Galpon 3', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `granja`
--

CREATE TABLE `granja` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `zona` text,
  `nombre` text NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `granja`
--

INSERT INTO `granja` (`id`, `id_empresa`, `zona`, `nombre`, `deleted_at`) VALUES
(1, 1, 'SIPE SIPE', 'ISABELITA', NULL),
(2, 2, 'PIO LINDO CBBA', 'PIO LINDO', NULL),
(3, 1, 'Los Prado.', 'Tonki', NULL),
(4, 1, 'El Tajibo.', 'Frame', NULL),
(5, 1, 'El Brillante.', 'Brilan', NULL),
(6, 2, 'Ciudad de Montero', 'SinBa', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoja_verificacion`
--

CREATE TABLE `hoja_verificacion` (
  `id` int(11) NOT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `revision` varchar(20) DEFAULT NULL,
  `firma_invetsa` text,
  `firma_empresa` text,
  `productividad` decimal(4,2) DEFAULT NULL,
  `sumatoria_manipulacion_vacuna` decimal(10,2) DEFAULT NULL,
  `promedio_mantenimiento` decimal(10,2) DEFAULT NULL,
  `puntaje_control_indice` decimal(10,2) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sqlite` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `imagen_jefe` text,
  `responsable_invetsa` text,
  `responsable_incubadora` text,
  `total_vc` decimal(10,2) DEFAULT NULL,
  `puntaje_total` decimal(10,2) DEFAULT NULL,
  `irregularidad_15` text,
  `recomendaciones` text,
  `otras_irregularidades` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hoja_verificacion`
--

INSERT INTO `hoja_verificacion` (`id`, `hora_ingreso`, `hora_salida`, `codigo`, `revision`, `firma_invetsa`, `firma_empresa`, `productividad`, `sumatoria_manipulacion_vacuna`, `promedio_mantenimiento`, `puntaje_control_indice`, `id_unidad`, `id_empresa`, `id_sqlite`, `imei`, `fecha`, `id_tecnico`, `imagen_jefe`, `responsable_invetsa`, `responsable_incubadora`, `total_vc`, `puntaje_total`, `irregularidad_15`, `recomendaciones`, `otras_irregularidades`) VALUES
(8, '00:00:00', '00:00:00', 'R.51', '00', 'hoja_verificacion/firma/8_firma_invetsa_2017-12-25.txt', 'hoja_verificacion/firma/8_firma_empresa_2017-12-25.txt', '0.00', '0.20', '0.15', '0.00', 0, 1, 11, '000000000000000', '2017-12-25', 2, 'hoja_verificacion/imagen/8_foto_jefe_2017-12-25.txt', 'asdfa', 'asdfas', '0.00', '0.00', '', 'aaa', 'asda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indice_eficiencia`
--

CREATE TABLE `indice_eficiencia` (
  `id` int(11) NOT NULL,
  `puntaje` decimal(13,2) DEFAULT '0.00',
  `minimo` decimal(13,2) DEFAULT '0.00',
  `maximo` decimal(13,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `indice_eficiencia`
--

INSERT INTO `indice_eficiencia` (`id`, `puntaje`, `minimo`, `maximo`) VALUES
(1, '0.00', '0.00', '96.84'),
(2, '0.25', '96.85', '96.99'),
(3, '1.00', '97.00', '100.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_funcionamiento`
--

CREATE TABLE `inspeccion_funcionamiento` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `frecuencia_de_uso` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inspeccion_funcionamiento`
--

INSERT INTO `inspeccion_funcionamiento` (`id`, `observaciones`, `frecuencia_de_uso`, `id_servicio`, `imei`) VALUES
(1, 'as', 'sdfasd', 1, '000000000000000'),
(1, 'adsad', 'aa', 2, '000000000000000'),
(1, 'asdf', 'asdfasdf', 3, '000000000000000'),
(2, 'sdfas', 'asdf', 1, '000000000000000'),
(2, 'as', 'a', 2, '000000000000000'),
(2, 'as', 'a', 3, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_visual`
--

CREATE TABLE `inspeccion_visual` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `piezas_cambiadas` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inspeccion_visual`
--

INSERT INTO `inspeccion_visual` (`id`, `observaciones`, `piezas_cambiadas`, `id_servicio`, `imei`) VALUES
(1, '', '', 1, '000000000000000'),
(1, '', '', 2, '000000000000000'),
(1, 'asdf', '', 3, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limpieza`
--

CREATE TABLE `limpieza` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `cantidad_aves_vacunadas` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_genetica`
--

CREATE TABLE `linea_genetica` (
  `id` int(11) NOT NULL,
  `descripcion` text,
  `cobb` text,
  `ross` text,
  `hybro` text,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `linea_genetica`
--

INSERT INTO `linea_genetica` (`id`, `descripcion`, `cobb`, `ross`, `hybro`, `id_hoja_verificacion`, `imei`) VALUES
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 1, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 2, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 3, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 4, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 5, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 6, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 7, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 8, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manipulacion_dilucion`
--

CREATE TABLE `manipulacion_dilucion` (
  `id` int(11) NOT NULL,
  `descripcion` text,
  `puntaje` decimal(2,2) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `manipulacion_dilucion`
--

INSERT INTO `manipulacion_dilucion` (`id`, `descripcion`, `puntaje`, `id_hoja_verificacion`, `imei`, `observacion`) VALUES
(1, 'Verificación del nivel de nitrógeno en formato (mínimo 6 pulgadas), obligatorio los días de vacunación       15  pulg.', '0.00', 8, '000000000000000', ''),
(2, 'Diluyente usado en buenas condiciones rojo y. transparente              Gentamicina 10%  9 ml  x  800ml ', '0.00', 8, '000000000000000', ''),
(3, 'Jeringas descartables individuales para cada tipo de vacuna, colorante y antibiótico    (no usan) (Lab. Invesa)', '0.00', 8, '000000000000000', ''),
(4, 'Tiempo mínimo para añadir antibiótico y colorante antes de preparar la vacuna  15 minutos', '0.10', 8, '000000000000000', ''),
(5, 'Uso de colorante y dosis de 0.5 ml para bolsas 200 y 400 ml , 1 ml para 800 ml y 1.5 ml para 1200 y 1600 ml', '0.00', 8, '000000000000000', ''),
(6, 'Jeringa cargada con 2 ml de diluyente para extraer la vacuna ya descongelada ', '0.00', 8, '000000000000000', ''),
(7, 'Uso de guantes y protector ocular para manipulación de vacunas congeladas al retirar la vacuna del tanque ', '0.10', 8, '000000000000000', ''),
(8, 'Buenas condiciones de funcionamiento del Invetsa-temp de 27 a 37 º C (promedio 32º C)', '0.00', 8, '000000000000000', ''),
(9, 'Numero de ampollas retiradas por vez para descongelación, máximo 2 ampollas     2 ampollas', '0.00', 8, '000000000000000', ''),
(10, 'Tiempo máximo para descongelamiento de la ampolla de 1 minuto y reconstitución en diluyente 30 segundos', '0.00', 8, '000000000000000', ''),
(11, 'Uso de pajilla de aluminio para descongelamiento de las ampollas en el agua, evita introducir la mano en el agua', '0.00', 8, '000000000000000', ''),
(12, 'Favorecer el descongelamiento de la ampolla en forma suave (movimiento circulares y verticales)', '0.00', 8, '000000000000000', ''),
(13, 'Secar las ampollas con papel toalla y usar el rompe ampollas', '0.00', 8, '000000000000000', ''),
(14, 'Uso del soporte de ampollas, absorción y reconstitución de la vacuna en el diluyente suave y sin presión en Jeringa', '0.00', 8, '000000000000000', ''),
(15, 'Uso de aguja adecuada para la extracción de la vacuna, 18 G x 1 ½” (color rosado)', '0.00', 8, '000000000000000', ''),
(16, 'Realización de enjuague de ampollas (incluye cuerpo y tapa de la ampolla)', '0.00', 8, '000000000000000', ''),
(17, 'Secuencia correcta de preparación de la vacuna (antibiótico, colorante y 15 minutos después  vacunas congeladas)', '0.00', 8, '000000000000000', ''),
(18, 'Tiempo de consumo de la solución vacunal preparada máximo 45 minutos y homogenizar la vacuna cada 10 minut.', '0.00', 8, '000000000000000', ''),
(19, 'Perfecta distribución de las mangueras que conducen la vacuna (levemente estiradas, evitando el efecto hamaca)', '0.00', 8, '000000000000000', ''),
(20, 'Conteo celular - % de Viabilidad mayor a 86 %  Vaxxitek  x  4000 ds  Serie RM 470   Vence 13-07-18 ', '0.00', 8, '000000000000000', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_limpieza`
--

CREATE TABLE `mantenimiento_limpieza` (
  `id` int(11) NOT NULL,
  `nro_maquina` int(11) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `id_vacunador` int(11) NOT NULL,
  `imei` text,
  `irregularidad1` int(11) NOT NULL DEFAULT '0',
  `irregularidad2` int(11) NOT NULL DEFAULT '0',
  `irregularidad3` int(11) NOT NULL DEFAULT '0',
  `irregularidad4` int(11) NOT NULL DEFAULT '0',
  `irregularidad5` int(11) NOT NULL DEFAULT '0',
  `irregularidad6` int(11) DEFAULT '0',
  `irregularidad7` int(11) NOT NULL DEFAULT '0',
  `irregularidad8` int(11) NOT NULL DEFAULT '0',
  `irregularidad9` int(11) NOT NULL DEFAULT '0',
  `irregularidad10` int(11) NOT NULL DEFAULT '0',
  `irregularidad11` int(11) NOT NULL DEFAULT '0',
  `irregularidad12` int(11) NOT NULL DEFAULT '0',
  `irregularidad13` int(11) NOT NULL DEFAULT '0',
  `irregularidad14` int(11) NOT NULL DEFAULT '0',
  `irregularidad15` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mantenimiento_limpieza`
--

INSERT INTO `mantenimiento_limpieza` (`id`, `nro_maquina`, `id_hoja_verificacion`, `id_vacunador`, `imei`, `irregularidad1`, `irregularidad2`, `irregularidad3`, `irregularidad4`, `irregularidad5`, `irregularidad6`, `irregularidad7`, `irregularidad8`, `irregularidad9`, `irregularidad10`, `irregularidad11`, `irregularidad12`, `irregularidad13`, `irregularidad14`, `irregularidad15`) VALUES
(0, 1, 8, 1, '000000000000000', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 2, 8, 4, '000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `maquina`
--

INSERT INTO `maquina` (`id`, `codigo`, `nombre`) VALUES
(1, 'UV-0003', 'ULVAVAC\n'),
(2, 'UV-4832', 'ULVAVAC\n'),
(3, 'SPC-0167\n', 'SPRAVAC DE CAMPO\n'),
(4, ' SLV-0002\n', 'SOLOVAC'),
(5, 'TT-1508\n', 'TWIN SHOT'),
(6, 'TT-2106\r\n', 'TWIN SHOT'),
(7, 'TT-3431\r\n', 'TWIN SHOT'),
(8, 'TT-1908\r\n', 'TWIN SHOT'),
(9, 'TT-2109\r\n', 'TWIN SHOT'),
(10, 'TT-3020\r\n', 'TWIN SHOT'),
(11, 'UV-0007\r\n', 'ULVAVAC'),
(12, 'UV-0030\r\n', 'ULVAVAC'),
(13, 'TT-3021\r\n', 'TWIN SHOT'),
(14, 'TT-3022\r\n', 'TWIN SHOT'),
(15, 'TT-3403\r\n', 'TWIN SHOT'),
(16, 'TT-3234\r\n', 'TWIN SHOT'),
(17, 'TT-3432', 'TWIN SHOT'),
(18, 'TT-3651', 'TWIN SHOT'),
(19, 'TT-3652\r\n', 'TWIN SHOT'),
(20, 'TT-3653', 'TWIN SHOT'),
(21, 'TT-3654', 'TWIN SHOT'),
(22, 'TT-1921', 'TWIN SHOT'),
(23, 'TT-3318', 'TWIN SHOT'),
(24, 'TT- 1906', 'TWIN SHOT'),
(25, 'SPP-0001', 'SPRAVAC'),
(26, 'UV-0035', 'ULVAVAC'),
(27, 'UV-0019', 'ULVAVAC'),
(28, 'UV-0041', 'ULVAVAC'),
(29, 'SLV-0009', 'SOLOVAC'),
(30, 'SPC-0165', 'SPRAVAC DE CAMPO'),
(31, 'TT-1095', 'TWIN SHOT'),
(32, 'TT-1909', 'TWIN SHOT'),
(33, 'ZT-0350', 'ZOOTEC'),
(34, 'ZT-0351', 'ZOOTEC'),
(35, 'ZT-0352', 'ZOOTEC'),
(36, 'ZT-0353', 'ZOOTEC'),
(37, 'ZT-0354', 'ZOOTEC'),
(38, 'ZT-0355', 'ZOOTEC'),
(39, 'ZT-0356', 'ZOOTEC'),
(40, 'SPP-0003', 'SPRAVAC'),
(41, 'TT-2393', 'TWIN SHOT'),
(42, 'ZT-549', 'ZOOTEC'),
(43, 'ZT-550', 'ZOOTEC'),
(44, 'ZT-551', 'ZOOTEC'),
(45, 'ZT-552', 'ZOOTEC'),
(46, 'ZT-1047', 'ZOOTEC'),
(47, 'ZT-1041', 'ZOOTEC'),
(48, 'SPP-0006', 'SPRAVAC'),
(49, 'UV-0028', 'ULVAVAC'),
(50, 'UV-0044', 'ULVAVAC'),
(51, 'SPC-0166', 'SPRAVAC DE CAMPO'),
(52, 'UV-0031', 'ULVAVAC'),
(53, 'UV-0038', 'ULVAVAC'),
(54, 'TT-3592', 'TWIN SHOT'),
(55, 'SPP-1759', 'SPRAVAC'),
(56, 'UV-4826', 'ULVAVAC'),
(57, 'UV-0039', 'ULVAVAC'),
(58, 'UV-4830', 'ULVAVAC'),
(59, 'TT-2491', 'TWIN SHOT'),
(60, 'TT-3104', 'TWIN SHOT'),
(61, 'TT-3101', 'TWIN SHOT'),
(62, 'TT-3102', 'TWIN SHOT'),
(63, 'UV-0032', 'ULVAVAC'),
(64, 'UV-0033', 'ULVAVAC'),
(65, 'SPC-0168', 'SPRAVAC DE CAMPO'),
(66, 'UV-0004', 'ULVAVAC'),
(67, 'UV-0022', 'ULVAVAC'),
(68, 'SLV-0012', 'SOLOVAC'),
(69, 'SLV-0013', 'SOLOVAC'),
(70, 'SLV-0006', 'SOLOVAC'),
(71, 'SLV-0007', 'SOLOVAC'),
(72, 'TT-3470', 'TWIN SHOT'),
(73, 'TT-3476', 'TWIN SHOT'),
(74, 'TT-3779', 'TWIN SHOT'),
(75, 'TT-3778', 'TWIN SHOT'),
(76, 'TT-3777', 'TWIN SHOT'),
(77, 'TT-3776', 'TWIN SHOT'),
(78, 'TT-1439', 'TWIN SHOT'),
(79, 'UV-0012', 'ULVAVAC'),
(80, 'UV-0013', 'ULVAVAC'),
(81, 'UV-4843', 'ULVAVAC'),
(82, 'TT-3109', 'TWIN SHOT'),
(83, 'TT-3009', 'TWIN SHOT'),
(84, 'TT-3466', 'TWIN SHOT'),
(85, 'SPP-0002', 'SPRAVAC'),
(86, 'UV-0435', 'ULVAVAC'),
(87, 'UV-4844', 'ULVAVAC'),
(88, 'UV-0042', 'ULVAVAC'),
(89, 'UV-0034', 'ULVAVAC'),
(90, 'TT-3103', 'TWIN SHOT'),
(91, 'TT-3460', 'TWIN SHOT'),
(92, 'TT-3014', 'TWIN SHOT'),
(93, 'TT-2361', 'TWIN SHOT'),
(94, 'TT-2392', 'TWIN SHOT'),
(95, 'UV-0015', 'ULVAVAC'),
(96, 'UV-0016', 'ULVAVAC'),
(97, 'UV-0036', 'ULVAVAC'),
(98, 'SPC-0170', 'SPRAVAC DE CAMPO'),
(99, 'TT-2487', 'TWIN SHOT'),
(100, 'TT-2489', 'TWIN SHOT'),
(101, 'TT-2492', 'TWIN SHOT'),
(102, 'TT-1506', 'TWIN SHOT'),
(103, 'TT-1920', 'TWIN SHOT'),
(104, 'TT-2866', 'TWIN SHOT'),
(105, 'SPP-1199', 'SPRAVAC'),
(106, 'SLV-0004', 'SOLOVAC'),
(107, 'SLV-005', 'SOLOVAC'),
(108, 'SLV-0014', 'SOLOVAC'),
(109, 'ZT-7125', 'ZOOTEC'),
(110, 'ZT-7124', 'ZOOTEC'),
(111, 'ZT-7123', 'ZOOTEC'),
(112, 'ZT-0362', 'ZOOTEC'),
(113, 'ZT-0553', 'ZOOTEC'),
(114, 'ZT-0381', 'ZOOTEC'),
(115, 'SPP-1140', 'SPRAVAC'),
(116, 'UV-0028', 'ULVAVAC'),
(117, 'UV-0003', 'ULVAVAC'),
(118, 'UV-0006', 'ULVAVAC'),
(119, 'UV-0017', 'ULVAVAC'),
(120, 'SPC-0173', 'SPRAVAC DE CAMPO'),
(121, 'TT-3215', 'TWIN SHOT'),
(122, 'TT-3319', 'TWIN SHOT'),
(123, 'TT-3429', 'TWIN SHOT'),
(124, 'TT-1488', 'TWIN SHOT'),
(125, 'TT-1489', 'TWIN SHOT'),
(126, 'TT-3469', 'TWIN SHOT'),
(127, 'ZT-1030', 'ZOOTEC'),
(128, 'ZT-1033', 'ZOOTEC'),
(129, 'ZT-1035', 'ZOOTEC'),
(130, 'ZT-1037', 'ZOOTEC'),
(131, 'ZT-0103', 'ZOOTEC'),
(132, 'ZT-0104', 'ZOOTEC'),
(133, 'ZT-0105', 'ZOOTEC'),
(134, 'ZT-0361', 'ZOOTEC'),
(135, 'ZT-0363', 'ZOOTEC'),
(136, 'ZT-0364', 'ZOOTEC'),
(137, 'ZT-0365', 'ZOOTEC'),
(138, 'ZT-0366', 'ZOOTEC'),
(139, 'ZT-0367', 'ZOOTEC'),
(140, 'ZT-0368', 'ZOOTEC'),
(141, 'ZT-0369', 'ZOOTEC'),
(142, 'ZT-0370', 'ZOOTEC'),
(143, 'ZT-0371', 'ZOOTEC'),
(144, 'ZT-0372', 'ZOOTEC'),
(145, 'ZT-0379', 'ZOOTEC'),
(146, 'ZT-0380', 'ZOOTEC'),
(147, 'ZT-0382', 'ZOOTEC'),
(148, 'SPP-0004', 'SPRAVAC'),
(149, '1', 'INTELLIJECT'),
(150, 'ZT-0373', 'ZOOTEC'),
(151, 'ZT-0374', 'ZOOTEC'),
(152, 'ZT-0375', 'ZOOTEC'),
(153, 'ZT-0376', 'ZOOTEC'),
(154, 'ZT-0377', 'ZOOTEC'),
(155, 'ZT-0378', 'ZOOTEC'),
(156, 'ZT-7117', 'ZOOTEC'),
(157, 'ZT-7118', 'ZOOTEC'),
(158, 'ZT-7119', 'ZOOTEC'),
(159, 'ZT-7120', 'ZOOTEC'),
(160, 'ZT-7121', 'ZOOTEC'),
(161, 'ZT-7122', 'ZOOTEC'),
(162, 'SPP-0005', 'SPRAVAC'),
(163, 'UV-4842\r\n', 'ULVAVAC'),
(164, 'UV-0025\r\n', 'ULVAVAC'),
(165, 'TT-1460', 'TWIN SHOT'),
(166, 'TT-1906', 'TWIN SHOT'),
(167, 'TT-3008', 'TWIN SHOT'),
(168, 'TT-3234', 'TWIN SHOT'),
(169, 'TT-3022', 'TWIN SHOT'),
(170, 'TT-3403', 'TWIN SHOT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`) VALUES
(1, 'BOLIVIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peso`
--

CREATE TABLE `peso` (
  `id` int(11) NOT NULL,
  `peso_corporal` decimal(10,2) DEFAULT NULL,
  `peso_bursa` decimal(10,2) DEFAULT NULL,
  `peso_brazo` decimal(10,2) DEFAULT NULL,
  `peso_timo` decimal(10,2) DEFAULT NULL,
  `peso_higado` decimal(10,2) DEFAULT NULL,
  `indice_bursal` decimal(10,2) DEFAULT NULL,
  `indice_timico` decimal(10,2) DEFAULT NULL,
  `indice_hepatico` decimal(10,2) DEFAULT NULL,
  `bursometro` decimal(10,2) DEFAULT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peso`
--

INSERT INTO `peso` (`id`, `peso_corporal`, `peso_bursa`, `peso_brazo`, `peso_timo`, `peso_higado`, `indice_bursal`, `indice_timico`, `indice_hepatico`, `bursometro`, `id_sistema`, `imei`) VALUES
(1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '000000000000000'),
(1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '000000000000000'),
(1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3, '000000000000000'),
(1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 4, '000000000000000'),
(2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '000000000000000'),
(2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '000000000000000'),
(2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3, '000000000000000'),
(2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 4, '000000000000000'),
(3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '000000000000000'),
(3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '000000000000000'),
(3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3, '000000000000000'),
(3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 4, '000000000000000'),
(4, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '000000000000000'),
(4, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '000000000000000'),
(4, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3, '000000000000000'),
(4, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 4, '000000000000000'),
(5, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '000000000000000'),
(5, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '000000000000000'),
(5, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3, '000000000000000'),
(5, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 4, '000000000000000'),
(6, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1, '000000000000000'),
(6, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '000000000000000'),
(6, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3, '000000000000000'),
(6, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 4, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntuacion`
--

INSERT INTO `puntuacion` (`id`, `nombre`, `id_sistema`, `imei`) VALUES
(1, 'Pico(aftas)', 1, '000000000000000'),
(1, 'Pico(aftas)', 2, '000000000000000'),
(1, 'Pico(aftas)', 3, '000000000000000'),
(1, 'Pico(aftas)', 4, '000000000000000'),
(2, 'Petequias', 1, '000000000000000'),
(2, 'Petequias', 2, '000000000000000'),
(2, 'Petequias', 3, '000000000000000'),
(2, 'Petequias', 4, '000000000000000'),
(3, 'Tarsos', 1, '000000000000000'),
(3, 'Tarsos', 2, '000000000000000'),
(3, 'Tarsos', 3, '000000000000000'),
(3, 'Tarsos', 4, '000000000000000'),
(4, 'Relacion Morfomotrica Bursa/Bazo', 1, '000000000000000'),
(4, 'Relacion Morfomotrica Bursa/Bazo', 2, '000000000000000'),
(4, 'Relacion Morfomotrica Bursa/Bazo', 3, '000000000000000'),
(4, 'Relacion Morfomotrica Bursa/Bazo', 4, '000000000000000'),
(5, 'Apariencia de los Pliegues Internos de la Bursa', 1, '000000000000000'),
(5, 'Apariencia de los Pliegues Internos de la Bursa', 2, '000000000000000'),
(5, 'Apariencia de los Pliegues Internos de la Bursa', 3, '000000000000000'),
(5, 'Apariencia de los Pliegues Internos de la Bursa', 4, '000000000000000'),
(6, 'Tamano y Apariencia del Timo', 1, '000000000000000'),
(6, 'Tamano y Apariencia del Timo', 2, '000000000000000'),
(6, 'Tamano y Apariencia del Timo', 3, '000000000000000'),
(6, 'Tamano y Apariencia del Timo', 4, '000000000000000'),
(7, 'Sacos Aereos', 1, '000000000000000'),
(7, 'Sacos Aereos', 2, '000000000000000'),
(7, 'Sacos Aereos', 3, '000000000000000'),
(7, 'Sacos Aereos', 4, '000000000000000'),
(8, 'Traquea', 1, '000000000000000'),
(8, 'Traquea', 2, '000000000000000'),
(8, 'Traquea', 3, '000000000000000'),
(8, 'Traquea', 4, '000000000000000'),
(9, 'Cornetes Nasales', 1, '000000000000000'),
(9, 'Cornetes Nasales', 2, '000000000000000'),
(9, 'Cornetes Nasales', 3, '000000000000000'),
(9, 'Cornetes Nasales', 4, '000000000000000'),
(10, 'Higados', 1, '000000000000000'),
(10, 'Higados', 2, '000000000000000'),
(10, 'Higados', 3, '000000000000000'),
(10, 'Higados', 4, '000000000000000'),
(11, 'Vesicula Biliar', 1, '000000000000000'),
(11, 'Vesicula Biliar', 2, '000000000000000'),
(11, 'Vesicula Biliar', 3, '000000000000000'),
(11, 'Vesicula Biliar', 4, '000000000000000'),
(12, 'Proventriculo', 1, '000000000000000'),
(12, 'Proventriculo', 2, '000000000000000'),
(12, 'Proventriculo', 3, '000000000000000'),
(12, 'Proventriculo', 4, '000000000000000'),
(13, 'Ulceracion de Mollejas', 1, '000000000000000'),
(13, 'Ulceracion de Mollejas', 2, '000000000000000'),
(13, 'Ulceracion de Mollejas', 3, '000000000000000'),
(13, 'Ulceracion de Mollejas', 4, '000000000000000'),
(14, 'Intestinos', 1, '000000000000000'),
(14, 'Intestinos', 2, '000000000000000'),
(14, 'Intestinos', 3, '000000000000000'),
(14, 'Intestinos', 4, '000000000000000'),
(15, 'Coccidia', 1, '000000000000000'),
(15, 'Coccidia', 2, '000000000000000'),
(15, 'Coccidia', 3, '000000000000000'),
(15, 'Coccidia', 4, '000000000000000'),
(16, 'Ciegos', 1, '000000000000000'),
(16, 'Ciegos', 2, '000000000000000'),
(16, 'Ciegos', 3, '000000000000000'),
(16, 'Ciegos', 4, '000000000000000'),
(17, 'Tonsillas lleocecales', 1, '000000000000000'),
(17, 'Tonsillas lleocecales', 2, '000000000000000'),
(17, 'Tonsillas lleocecales', 3, '000000000000000'),
(17, 'Tonsillas lleocecales', 4, '000000000000000'),
(18, 'Placa de Peyer', 1, '000000000000000'),
(18, 'Placa de Peyer', 2, '000000000000000'),
(18, 'Placa de Peyer', 3, '000000000000000'),
(18, 'Placa de Peyer', 4, '000000000000000'),
(19, 'Necrosis cabeza de Femur', 1, '000000000000000'),
(19, 'Necrosis cabeza de Femur', 2, '000000000000000'),
(19, 'Necrosis cabeza de Femur', 3, '000000000000000'),
(19, 'Necrosis cabeza de Femur', 4, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_mantenimiento`
--

CREATE TABLE `servicio_mantenimiento` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_salidas` time DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `revision` varchar(20) DEFAULT NULL,
  `firma_jefe_planta` text,
  `firma_invetsa` text,
  `id_maquina` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `id_sqlite` int(11) NOT NULL,
  `imei` varchar(18) NOT NULL,
  `formulario` text,
  `imagen_jefe` text,
  `jefe_planta` text,
  `encargado_maquina` text,
  `ultima_visita` text,
  `planta_de_incubacion` text,
  `direccion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio_mantenimiento`
--

INSERT INTO `servicio_mantenimiento` (`id`, `fecha`, `hora_ingreso`, `hora_salidas`, `codigo`, `revision`, `firma_jefe_planta`, `firma_invetsa`, `id_maquina`, `id_tecnico`, `id_compania`, `id_sqlite`, `imei`, `formulario`, `imagen_jefe`, `jefe_planta`, `encargado_maquina`, `ultima_visita`, `planta_de_incubacion`, `direccion`) VALUES
(1, '2017-12-25', '00:00:00', '00:00:00', 'R.52', '00', 'servicio_mantenimiento/firma/1_firma_empresa_2017-12-25.txt', 'servicio_mantenimiento/firma/1_firma_invetsa_2017-12-25.txt', 12, 2, 1, 11, '000000000000000', 'TWIN SHOT', 'servicio_mantenimiento/imagen/1_foto_jefe_2017-12-25.txt', '', 'asdfas', 'asdf', '', 'a'),
(2, '2017-12-25', '00:00:00', '00:00:00', 'R.52', '00', 'servicio_mantenimiento/firma/2_firma_empresa_2017-12-25.txt', 'servicio_mantenimiento/firma/2_firma_invetsa_2017-12-25.txt', 26, 2, 1, 13, '000000000000000', 'SPRAVAC', 'servicio_mantenimiento/imagen/2_foto_jefe_2017-12-25.txt', '', 'asf', 'a', '', 'ass'),
(3, '2017-12-25', '00:00:00', '00:00:00', 'R.53', '00', 'servicio_mantenimiento/firma/3_firma_empresa_2017-12-25.txt', 'servicio_mantenimiento/firma/3_firma_invetsa_2017-12-25.txt', 49, 2, 1, 14, '000000000000000', 'ZOOTEC', 'servicio_mantenimiento/imagen/3_foto_jefe_2017-12-25.txt', '', 'ssssssss', 'asda', '', 'asdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_integral`
--

CREATE TABLE `sistema_integral` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `revision` varchar(20) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `observaciones` text,
  `fecha` date DEFAULT NULL,
  `nro_pollos` int(11) DEFAULT NULL,
  `imagen1` text,
  `imagen2` text,
  `imagen3` text,
  `imagen4` text,
  `imagen5` text,
  `imagen6` text,
  `imagen7` text,
  `imagen8` text,
  `imagen9` text,
  `imagen10` text,
  `id_galpon` int(11) DEFAULT NULL,
  `id_granja` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sqlite` varchar(18) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `firma_invetsa` text,
  `firma_empresa` text,
  `id_tecnico` int(11) DEFAULT NULL,
  `imagen_jefe` text,
  `referencia` text NOT NULL,
  `comentarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistema_integral`
--

INSERT INTO `sistema_integral` (`id`, `codigo`, `revision`, `edad`, `sexo`, `observaciones`, `fecha`, `nro_pollos`, `imagen1`, `imagen2`, `imagen3`, `imagen4`, `imagen5`, `imagen6`, `imagen7`, `imagen8`, `imagen9`, `imagen10`, `id_galpon`, `id_granja`, `id_empresa`, `id_sqlite`, `imei`, `firma_invetsa`, `firma_empresa`, `id_tecnico`, `imagen_jefe`, `referencia`, `comentarios`) VALUES
(1, 'R.50', '00', 21, 'M', 'asdf', '2017-12-25', 0, 'sistema_integral_de_monitoreo/imagen/1_imagen_1_2017-12-25.txt', 'sistema_integral_de_monitoreo/imagen/1_imagen_2_2017-12-25.txt', 'sistema_integral_de_monitoreo/imagen/1_imagen_3_2017-12-25.txt', 'sistema_integral_de_monitoreo/imagen/1_imagen_4_2017-12-25.txt', 'sistema_integral_de_monitoreo/imagen/1_imagen_5_2017-12-25.txt', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, '1', '000000000000000', 'sistema_integral_de_monitoreo/firma/1_firma_invetsa_2017-12-25.txt', 'sistema_integral_de_monitoreo/firma/1_firma_empresa_2017-12-25.txt', 2, 'sistema_integral_de_monitoreo/imagen/1_foto_jefe_2017-12-25.txt', '', 'asf'),
(2, 'R.50', '00', 21, 'M', '', '2017-12-26', 0, 'sistema_integral_de_monitoreo/imagen/2_imagen_1_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/2_imagen_2_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/2_imagen_3_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/2_imagen_4_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/2_imagen_5_2017-12-26.txt', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, '2', '000000000000000', 'sistema_integral_de_monitoreo/firma/2_firma_invetsa_2017-12-26.txt', 'sistema_integral_de_monitoreo/firma/2_firma_empresa_2017-12-26.txt', 2, 'sistema_integral_de_monitoreo/imagen/2_foto_jefe_2017-12-26.txt', '', ''),
(3, 'R.50', '00', 21, 'M', '', '2017-12-26', 0, 'sistema_integral_de_monitoreo/imagen/3_imagen_1_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/3_imagen_2_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/3_imagen_3_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/3_imagen_4_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/3_imagen_5_2017-12-26.txt', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, '3', '000000000000000', 'sistema_integral_de_monitoreo/firma/3_firma_invetsa_2017-12-26.txt', 'sistema_integral_de_monitoreo/firma/3_firma_empresa_2017-12-26.txt', 2, 'sistema_integral_de_monitoreo/imagen/3_foto_jefe_2017-12-26.txt', '', ''),
(4, 'R.50', '00', 21, 'M', '', '2017-12-26', 0, 'sistema_integral_de_monitoreo/imagen/4_imagen_1_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_2_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_3_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_4_2017-12-26.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_5_2017-12-26.txt', NULL, NULL, NULL, NULL, NULL, 8, 2, 2, '4', '000000000000000', 'sistema_integral_de_monitoreo/firma/4_firma_invetsa_2017-12-26.txt', 'sistema_integral_de_monitoreo/firma/4_firma_empresa_2017-12-26.txt', 2, 'sistema_integral_de_monitoreo/imagen/4_foto_jefe_2017-12-26.txt', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `codigo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `nombre`, `codigo`) VALUES
(1, 'CARLOS DELGADO', '1234'),
(2, 'RUBEN MENDEZ', '000000000000000'),
(3, 'DANIA CESPEDES', '357359062188411'),
(4, 'RONALD FORONDA', '359674060694113'),
(5, 'JOAN SEJAS', '1000'),
(6, 'ROLANDO FLORES', '1000'),
(7, 'FERNANDO ROJAS', '1000'),
(8, 'PATRICIA QUIROZ', '1000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `id_empresa`, `nombre`) VALUES
(2, 1, 'PLANTA DE INCUBACIÓN'),
(3, 1, 'PLANTA DE INCUBACIÓN'),
(4, 1, 'PLANTA DE INCUBACIÓN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `privilegio` tinyint(4) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `usuario`, `password`, `remember_token`, `privilegio`, `estado`) VALUES
(0, 'Gustavo', 'Arancibia Chaira', 'admin', '$2y$10$6/uCYvnatJ4PkzEggl0UlOprhx5yLrof1uGYHNPXuQ/Jxsp.RP152', 'nJ9a3Il0unneW8LVKmo3Dr3tIOJoGJUTCxWUZ55dSqmM9M6iMo1o574dhNwK', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunador`
--

CREATE TABLE `vacunador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vacunador`
--

INSERT INTO `vacunador` (`id`, `nombre`) VALUES
(1, 'Caleft'),
(2, 'Maria'),
(3, 'Efrain'),
(4, 'Carla'),
(5, 'Bertha'),
(6, 'Noemi'),
(7, 'Peni'),
(8, 'Elizabeth'),
(9, 'Roly'),
(10, 'Heber'),
(11, 'Jaime'),
(12, 'Sara'),
(13, 'Emanuel'),
(14, 'Pedro'),
(15, 'Elio'),
(16, 'Edgar'),
(17, 'Serii'),
(18, 'Carlos'),
(19, 'Perlita'),
(20, 'Gari'),
(21, 'Carlos Rosmery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viabilidad_celular`
--

CREATE TABLE `viabilidad_celular` (
  `id` int(11) NOT NULL,
  `antibiotico` text,
  `dosis` text,
  `tiempo` text,
  `vc` decimal(10,2) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viabilidad_celular`
--

INSERT INTO `viabilidad_celular` (`id`, `antibiotico`, `dosis`, `tiempo`, `vc`, `id_hoja_verificacion`, `imei`) VALUES
(1, '', '', '', '0.00', 1, '000000000000000'),
(2, '', '', '', '0.00', 1, '000000000000000'),
(3, '', '', '', '0.00', 1, '000000000000000'),
(4, '', '', '', '0.00', 1, '000000000000000'),
(1, '', '', '', '0.00', 2, '000000000000000'),
(2, '', '', '', '0.00', 2, '000000000000000'),
(3, '', '', '', '0.00', 2, '000000000000000'),
(4, '', '', '', '0.00', 2, '000000000000000'),
(1, '', '', '', '0.00', 3, '000000000000000'),
(2, '', '', '', '0.00', 3, '000000000000000'),
(3, '', '', '', '0.00', 3, '000000000000000'),
(4, '', '', '', '0.00', 3, '000000000000000'),
(1, '', '', '', '0.00', 4, '000000000000000'),
(2, '', '', '', '0.00', 4, '000000000000000'),
(3, '', '', '', '0.00', 4, '000000000000000'),
(4, '', '', '', '0.00', 4, '000000000000000'),
(1, '', '', '', '0.00', 5, '000000000000000'),
(2, '', '', '', '0.00', 5, '000000000000000'),
(3, '', '', '', '0.00', 5, '000000000000000'),
(4, '', '', '', '0.00', 5, '000000000000000'),
(1, '', '', '', '0.00', 6, '000000000000000'),
(2, '', '', '', '0.00', 6, '000000000000000'),
(3, '', '', '', '0.00', 6, '000000000000000'),
(4, '', '', '', '0.00', 6, '000000000000000'),
(1, '', '', '', '0.00', 7, '000000000000000'),
(2, '', '', '', '0.00', 7, '000000000000000'),
(3, '', '', '', '0.00', 7, '000000000000000'),
(4, '', '', '', '0.00', 7, '000000000000000'),
(1, '', '', '', '0.00', 8, '000000000000000'),
(2, '', '', '', '0.00', 8, '000000000000000'),
(3, '', '', '', '0.00', 8, '000000000000000'),
(4, '', '', '', '0.00', 8, '000000000000000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_indice`
--
ALTER TABLE `control_indice`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`),
  ADD KEY `id_vacunador` (`id_vacunador`);

--
-- Indices de la tabla `detalle_accion`
--
ALTER TABLE `detalle_accion`
  ADD PRIMARY KEY (`id`,`id_accion`,`id_hoja_verificacion`),
  ADD KEY `id_accion` (`id_accion`,`id_hoja_verificacion`);

--
-- Indices de la tabla `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
  ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`),
  ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indices de la tabla `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
  ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`),
  ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indices de la tabla `detalle_limpieza`
--
ALTER TABLE `detalle_limpieza`
  ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`),
  ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indices de la tabla `detalle_puntuacion`
--
ALTER TABLE `detalle_puntuacion`
  ADD PRIMARY KEY (`id`,`id_puntuacion`,`id_sistema`),
  ADD KEY `id_puntuacion` (`id_puntuacion`,`id_sistema`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `galpon`
--
ALTER TABLE `galpon`
  ADD PRIMARY KEY (`id`,`id_granja`,`id_empresa`),
  ADD KEY `id_granja` (`id_granja`,`id_empresa`);

--
-- Indices de la tabla `granja`
--
ALTER TABLE `granja`
  ADD PRIMARY KEY (`id`,`id_empresa`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_unidad` (`id_unidad`,`id_empresa`);

--
-- Indices de la tabla `indice_eficiencia`
--
ALTER TABLE `indice_eficiencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspeccion_funcionamiento`
--
ALTER TABLE `inspeccion_funcionamiento`
  ADD PRIMARY KEY (`id`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `inspeccion_visual`
--
ALTER TABLE `inspeccion_visual`
  ADD PRIMARY KEY (`id`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `limpieza`
--
ALTER TABLE `limpieza`
  ADD PRIMARY KEY (`id`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `linea_genetica`
--
ALTER TABLE `linea_genetica`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indices de la tabla `manipulacion_dilucion`
--
ALTER TABLE `manipulacion_dilucion`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indices de la tabla `mantenimiento_limpieza`
--
ALTER TABLE `mantenimiento_limpieza`
  ADD PRIMARY KEY (`id`,`id_vacunador`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`),
  ADD KEY `id_vacunador` (`id_vacunador`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peso`
--
ALTER TABLE `peso`
  ADD PRIMARY KEY (`id`,`id_sistema`),
  ADD KEY `id_sistema` (`id_sistema`);

--
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`id`,`id_sistema`),
  ADD KEY `id_sistema` (`id_sistema`);

--
-- Indices de la tabla `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_maquina` (`id_maquina`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_compania` (`id_compania`);

--
-- Indices de la tabla `sistema_integral`
--
ALTER TABLE `sistema_integral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_galpon` (`id_galpon`,`id_granja`,`id_empresa`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id`,`id_empresa`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vacunador`
--
ALTER TABLE `vacunador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `viabilidad_celular`
--
ALTER TABLE `viabilidad_celular`
  ADD KEY `viabilidad_celular_ibfk_1` (`id_hoja_verificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `compania`
--
ALTER TABLE `compania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `galpon`
--
ALTER TABLE `galpon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `granja`
--
ALTER TABLE `granja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `indice_eficiencia`
--
ALTER TABLE `indice_eficiencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sistema_integral`
--
ALTER TABLE `sistema_integral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `vacunador`
--
ALTER TABLE `vacunador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
