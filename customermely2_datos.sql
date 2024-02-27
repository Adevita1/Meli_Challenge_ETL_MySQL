-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-09-2023 a las 17:38:23
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `customermely`
--
CREATE DATABASE IF NOT EXISTS `customermely` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `customermely`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriahistorico`
--

CREATE TABLE `categoriahistorico` (
  `idcategoriaHistorico` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  `fecha_last_update` date NOT NULL,
  `categoriaHistoricocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  `fecha_last_update` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`idCategory`, `description`, `path`, `fecha_last_update`) VALUES
(1, 'Tecnologia', '/categoria/tecnologia', '2023-08-30'),
(2, 'Celulares y Telefonos', '/categoria/tecnologia/celulares', '2023-08-30'),
(3, 'Celulares y Smatphone', '/caegoria/smartphone', '2023-08-30'),
(5, 'smatphone', '/category/smartphone', '2023-08-30'),
(6, 'celulares', '/category/celulares', '2023-08-30'),
(7, 'telefonos', '/category/telefonos', '2023-08-30'),
(8, 'tecnologia', '/cateogy/tecnologia', '2023-08-30'),
(9, 'accesorios', '/category/accesorios', '2023-08-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`customer_id`, `nombre`, `apellido`, `fecha_nacimiento`, `direccion`, `email`, `telefono`, `sexo`) VALUES
(1, 'Hernan', 'Mariani', '1996-08-14', 'Hernandez 146', 'hernan@popi.com', '5454144478', 'Masculino'),
(2, 'Fabian', 'Montoya', '1998-06-15', 'Avellaneda 16', 'monto@gimail.com', '54548877123', 'Masculino'),
(3, 'Monica', 'Filiberti', '1997-10-16', 'Gomez 4165', 'moni@moni.com', '5550001111', 'Femenino'),
(4, 'Vanesa', 'Benegas', '2023-08-30', 'Frias 4545', 'vane@vane.com', '4545454545', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `idItem` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fk_categoria_id` int(11) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_baja` date NOT NULL,
  `order_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`idItem`, `nombre`, `descripcion`, `fk_categoria_id`, `precio`, `estado`, `fecha_baja`, `order_id`) VALUES
(1, 'Smatmovile', 'smartphone', 3, '150', 'nuevo', '2023-08-30', ''),
(2, 'Tecnosmart', 'accesorio tecnologia', 1, '50', 'nuevo', '2023-08-30', ''),
(3, 'Electrophone', 'celphone', 2, '100', 'nuevo', '2023-08-30', ''),
(4, 'CelphoneTel', 'Telephone', 7, '200', 'nuevo', '2023-08-30', ''),
(5, 'Accesorysmart', 'accesorios', 9, '10', 'nuevo', '2023-08-30', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `total_monto` decimal(10,0) DEFAULT NULL,
  `fk_id_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `order`
--

INSERT INTO `order` (`order_id`, `fk_customer_id`, `fecha_compra`, `total_monto`, `fk_id_item`) VALUES
(1, 2, '2023-08-30', '100', 2),
(2, 3, '2023-08-30', '200', 1),
(3, 1, '2023-08-30', '150', 4),
(4, 4, '2023-08-30', '150', 5),
(5, 3, '2023-08-30', '50', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precioestado`
--

CREATE TABLE `precioestado` (
  `id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_registro` date NOT NULL,
  `idItem` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fecha_de_venta` date NOT NULL,
  `order_qty` int(11) NOT NULL,
  `precio_de_venta` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoriahistorico`
--
ALTER TABLE `categoriahistorico`
  ADD PRIMARY KEY (`idcategoriaHistorico`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`),
  ADD KEY `categoria_id_idx` (`fk_categoria_id`);

--
-- Indices de la tabla `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_id_idx` (`fk_customer_id`),
  ADD KEY `fk_id_item_idx` (`fk_id_item`);

--
-- Indices de la tabla `precioestado`
--
ALTER TABLE `precioestado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idItem_idx` (`idItem`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD KEY `order_qty_idx` (`order_qty`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoriahistorico`
--
ALTER TABLE `categoriahistorico`
  MODIFY `idcategoriaHistorico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `precioestado`
--
ALTER TABLE `precioestado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `categoria_id` FOREIGN KEY (`fk_categoria_id`) REFERENCES `category` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_item` FOREIGN KEY (`fk_id_item`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `precioestado`
--
ALTER TABLE `precioestado`
  ADD CONSTRAINT `idItem` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `order_qty` FOREIGN KEY (`order_qty`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
