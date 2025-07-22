-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-07-2025 a las 09:18:38
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trivia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL,
  `totalPreguntas` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`id`, `usuario`, `password`, `totalPreguntas`) VALUES
(1, 'admin', 'admin', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

DROP TABLE IF EXISTS `partida`;
CREATE TABLE IF NOT EXISTS `partida` (
  `id_partida` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_set` int DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  PRIMARY KEY (`id_partida`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_set` (`id_set`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tema` int NOT NULL,
  `pregunta` text NOT NULL,
  `tipo` enum('opcion_multiple','cierto_falso') NOT NULL DEFAULT 'opcion_multiple',
  `opcion_a` text NOT NULL,
  `opcion_b` text NOT NULL,
  `opcion_c` text,
  `correcta` varchar(1) NOT NULL,
  `dificultad` enum('Basico','Intermedio','Experto') NOT NULL DEFAULT 'Basico',
  PRIMARY KEY (`id`),
  KEY `tema` (`tema`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `tema`, `pregunta`, `tipo`, `opcion_a`, `opcion_b`, `opcion_c`, `correcta`, `dificultad`) VALUES
(1, 1, '¿Qué función se utiliza para imprimir texto en PHP?', 'opcion_multiple', 'print()', 'printf()', 'echo', 'C', 'Basico'),
(2, 1, 'En PHP, una variable puede comenzar con un número.', 'cierto_falso', 'Cierto', 'Falso', NULL, 'B', 'Basico'),
(3, 1, 'La función \"isset()\" en PHP verifica si una variable está definida y no es null', 'cierto_falso', 'Cierto', 'Falso', NULL, 'A', 'Basico'),
(4, 2, '¿Cuál comando se utiliza para crear un nuevo controlador en Laravel?', 'opcion_multiple', 'php artisan make:model', 'php artisan make:controller', 'php artisan make:view', 'B', 'Basico'),
(5, 2, 'Laravel es un framework de PHP de código abierto', 'cierto_falso', 'Cierto', 'Falso', NULL, 'A', 'Basico'),
(6, 2, '¿Qué motor de plantillas utiliza Laravel por defecto?', 'opcion_multiple', 'Twig', 'Smarty', 'Blade', 'C', 'Basico'),
(7, 1, '¿Cuál es la extesión predeterminada de un archivo PHP?', 'opcion_multiple', '.html', '.php', '.js', 'B', 'Intermedio'),
(8, 1, '¿Cuál de las siguientes variables contiene información del servidor y entorno de ejecución?', 'opcion_multiple', '$_SESSION', '$_GET', '$_SERVER', 'C', 'Experto'),
(9, 3, 'JavaScript no es un lenguaje tipado dinámicamente', 'cierto_falso', 'Cierto', 'Falso', '', 'B', 'Intermedio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premio`
--

DROP TABLE IF EXISTS `premio`;
CREATE TABLE IF NOT EXISTS `premio` (
  `id_premio` int NOT NULL AUTO_INCREMENT,
  `nombre_premio` varchar(100) NOT NULL,
  `descripcion_premio` varchar(255) DEFAULT NULL,
  `avatar_premio` varchar(255) DEFAULT NULL,
  `tipo_premio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_premio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_usuario`
--

DROP TABLE IF EXISTS `reporte_usuario`;
CREATE TABLE IF NOT EXISTS `reporte_usuario` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `tiempo_promedio_pregunta` time DEFAULT NULL,
  `tiempo_promedio_nivel` time DEFAULT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `set_pregunta`
--

DROP TABLE IF EXISTS `set_pregunta`;
CREATE TABLE IF NOT EXISTS `set_pregunta` (
  `id_set_pregunta` int NOT NULL AUTO_INCREMENT,
  `nombre_set_pregunta` varchar(100) DEFAULT NULL,
  `dificultad_set_pregunta` varchar(100) DEFAULT NULL,
  `qr_set_pregunta` varchar(100) DEFAULT NULL,
  `id_tema` int NOT NULL,
  PRIMARY KEY (`id_set_pregunta`),
  KEY `id_tema` (`id_tema`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

DROP TABLE IF EXISTS `temas`;
CREATE TABLE IF NOT EXISTS `temas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`id`, `nombre`) VALUES
(1, 'PHP'),
(2, 'Laravel'),
(3, 'JavaScript');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `puntos` int DEFAULT '0',
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
