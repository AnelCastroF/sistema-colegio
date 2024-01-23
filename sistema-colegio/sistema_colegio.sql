-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2024 a las 00:24:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `cursos` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `cursos`) VALUES
(1, 'Matematicas'),
(2, 'Comunicacion'),
(3, 'Ciencia y Ambiente'),
(4, 'Personal Social'),
(5, 'Historia'),
(6, 'Geografia'),
(7, 'Ingles'),
(8, 'Raz. Verbal'),
(9, 'Raz. Matematico'),
(10, 'Fisica'),
(11, 'Quimica'),
(12, 'Geometria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(9) NOT NULL,
  `dni` int(8) NOT NULL,
  `fecha_nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `matricula`, `id_grado`, `direccion`, `telefono`, `dni`, `fecha_nac`) VALUES
(3, 'Joaquin Cañari', 'F1420', 11, 'Av. colonial 2323', 949494949, 80808080, '0000-00-00'),
(4, 'Vanesa Ruiz', 'L5668', 10, 'Av. colonial 5356', 902365856, 85692144, '0000-00-00'),
(5, 'Pedro Ruiz', 'Y58961', 11, 'Av. colonial 5142', 965487215, 75123658, '2008-12-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id` int(11) NOT NULL,
  `ciclo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `ciclo`) VALUES
(10, 'Primero secundaria'),
(11, 'Segundo secundaria'),
(12, 'Tercero secundaria'),
(13, 'Cuarto secundaria'),
(14, 'Quinto secundaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_alumno`
--

CREATE TABLE `notas_alumno` (
  `nombre` varchar(70) NOT NULL,
  `id_cursos` varchar(50) NOT NULL,
  `id_grado` varchar(50) NOT NULL,
  `nota` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Docente'),
(3, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `correo`, `telefono`, `password`, `fecha`, `rol`) VALUES
(11, 'Manuel', 'manuel@gmail.com', '9975201478', '123456', '2024-01-22 21:47:44', 2),
(12, 'vanessa', 'vanessa@gmail.com', '9975201478', '123456', '2024-01-22 21:11:57', 3),
(13, 'Susana', 'susana@gmail.com', '9975201478', '123456', '2024-01-22 21:52:24', 1),
(14, 'joaquin', 'joaquin@gmail.com', '9975201478', '123456', '2024-01-22 21:12:12', 3),
(15, 'pedro', 'pedro@gmail.com', '9975201478', '123456', '2024-01-22 21:12:19', 3),
(16, 'daniela', 'daniela@gmail.com', '9975201478', '123456', '2024-01-22 21:12:26', 2),
(17, 'edith', 'edith@gmail.com', '9975201478', '123456', '2024-01-22 21:12:33', 3),
(19, 'anel', 'anel@gmail.com', '9975201478', '123456', '2024-01-20 18:31:27', 3),
(20, 'rafael', 'rafel@gmail.com', '999555222', '123456', '2024-01-22 21:44:27', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estudiantes_grado` (`id_grado`) USING BTREE;

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `fk_info_estudiantes_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `permisos` FOREIGN KEY (`rol`) REFERENCES `permisos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
