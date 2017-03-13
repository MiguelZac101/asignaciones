-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-03-2017 a las 15:11:07
-- Versión del servidor: 5.5.50-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `symfony`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`id`, `title`, `body`) VALUES
(1, 'Nuevo post actualizado!', 'Nuevo body'),
(3, 'Nuevo post 3', 'Nuevo body'),
(4, 'Nuevo post', 'Nuevo body');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('ROLE_ADMIN','ROLE_USER') COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'miguel', 'miguel', 'zac', 'maqzac@yahoo.es', '123456', 'ROLE_ADMIN', 1, '2017-01-20 15:46:03', '2017-01-20 15:46:03'),
(2, 'danielita', 'danielita', 'lopez', 'danielita@hotmail.com', '123456', 'ROLE_USER', 1, '2017-01-20 16:20:15', '2017-01-20 16:20:15'),
(3, 'Miguel', 'zac', 'zac', 'm@m', '123', 'ROLE_USER', 1, '2017-02-22 12:10:28', '2017-02-22 12:10:28'),
(4, 'diego', 'diego', 'centeno', 'd@d', '123', 'ROLE_ADMIN', 1, '2017-02-22 12:19:50', '2017-02-22 12:19:50'),
(7, 'miguel101x', 'miguel', 'zac', 'mzx@m.es', '123', 'ROLE_ADMIN', 1, '2017-03-01 11:21:17', '2017-03-03 14:49:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
