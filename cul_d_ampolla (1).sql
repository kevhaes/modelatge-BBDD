-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2020 a las 22:20:00
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_d_ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(10) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `id_provider` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `id_provider`) VALUES
(0, 'Okley', 1),
(1, 'Friky ', 1),
(3, 'Boss', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(10) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_street_name` varchar(50) NOT NULL,
  `client_street_num` int(5) NOT NULL,
  `client_floor` varchar(5) NOT NULL,
  `client_door` varchar(5) NOT NULL,
  `client_city` varchar(50) NOT NULL,
  `client_ccode` varchar(5) NOT NULL,
  `client_country` varchar(25) NOT NULL,
  `client_mail` varchar(20) NOT NULL,
  `client_phone` varchar(20) NOT NULL,
  `recomanded_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `client_name`, `client_street_name`, `client_street_num`, `client_floor`, `client_door`, `client_city`, `client_ccode`, `client_country`, `client_mail`, `client_phone`, `recomanded_by`) VALUES
(3, 'Irene Abad', 'kjhknbkjkb', 8, '41', '5', 'madrid', '5616', 'españa', 'kjbnads@bla.com', '5456545', 1),
(4, 'Adriana E V', 'sdfsdafsfd', 5, '12', '5', 'Barcelona', '08542', 'españa', 'kjsdaaads@bla.com', '54565589', 1),
(5, 'David Smith', 'mdlskmvsd', 5, '5', '8', 'Mataro', '561', 'España', 'dssSADF@DSV.com', '5166632', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employers`
--

CREATE TABLE `employers` (
  `id` int(10) NOT NULL,
  `id_employer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employers`
--

INSERT INTO `employers` (`id`, `id_employer`) VALUES
(1, 15616),
(2, 15645),
(3, 56841);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id` int(10) NOT NULL,
  `glas_grad_r` int(5) NOT NULL,
  `glas_grad_l` int(5) NOT NULL,
  `glas_frame type` int(5) NOT NULL,
  `glas_frame_color` int(5) NOT NULL,
  `glas_glas_color` int(5) NOT NULL,
  `glas_price` double NOT NULL,
  `brand_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id`, `glas_grad_r`, `glas_grad_l`, `glas_frame type`, `glas_frame_color`, `glas_glas_color`, `glas_price`, `brand_id`) VALUES
(1, 1, 2, 5, 4, 7, 75, 0),
(10, -1, -5, 2, 3, 4, 50, 3),
(15, -1, -5, 2, 3, 4, 150, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id` int(10) NOT NULL,
  `provider_name` varchar(50) NOT NULL,
  `provider_street_name` varchar(50) NOT NULL,
  `provider_street_num` int(5) NOT NULL,
  `provider_floor` varchar(5) NOT NULL,
  `provider_door` varchar(5) NOT NULL,
  `provider_city` varchar(50) NOT NULL,
  `provider_ccode` varchar(5) NOT NULL,
  `provider_country` varchar(25) NOT NULL,
  `provider_nif` varchar(10) NOT NULL,
  `provider_phone` varchar(20) NOT NULL,
  `provider_fax` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id`, `provider_name`, `provider_street_name`, `provider_street_num`, `provider_floor`, `provider_door`, `provider_city`, `provider_ccode`, `provider_country`, `provider_nif`, `provider_phone`, `provider_fax`) VALUES
(1, 'Tony Ulleres', 'lknlkjvdnv', 48, '8', '1', 'Madrid', '5822', 'Espanja', '65151a', '541651', '5461516'),
(2, 'Rocksy glasses', 'ndjkasdnkjs', 15, '5', '4', 'Tokio', '4561', 'Japan', '1515165b', '156461', '456161'),
(3, 'Enric Ulleres', 'lkjnklvsndvd', 15, '4', '8', 'Brusselas', '1000', 'Belgium', '451631b', '1561684', '6516845');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomandations`
--

CREATE TABLE `recomandations` (
  `id` int(10) NOT NULL,
  `id_client` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recomandations`
--

INSERT INTO `recomandations` (`id`, `id_client`) VALUES
(1, 0),
(2, 3),
(3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(10) NOT NULL,
  `id_client` int(10) NOT NULL,
  `id_employer` int(10) NOT NULL,
  `id_glasses` int(10) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `id_client`, `id_employer`, `id_glasses`, `sale_date`) VALUES
(1, 3, 1, 15, '2020-02-13 21:16:23'),
(2, 4, 2, 10, '2020-02-13 21:15:33'),
(3, 5, 3, 1, '2020-02-13 21:16:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `recomanded_by` (`recomanded_by`);

--
-- Indices de la tabla `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `glasses_ibfk_1` (`brand_id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `recomandations`
--
ALTER TABLE `recomandations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_employer` (`id_employer`),
  ADD KEY `id_glasses` (`id_glasses`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`recomanded_by`) REFERENCES `recomandations` (`id`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`id_employer`) REFERENCES `employers` (`id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
