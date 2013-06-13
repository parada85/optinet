-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-06-2013 a las 13:43:34
-- Versión del servidor: 5.5.29
-- Versión de PHP: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `dboptinet1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Arqueo`
--

CREATE TABLE `Arqueo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) DEFAULT NULL,
  `fechaarqueo` datetime NOT NULL,
  `efectivo` double NOT NULL,
  `efectivocont` double NOT NULL,
  `boletas` int(11) NOT NULL,
  `boletascont` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B2EA45AC952BE730` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cita`
--

CREATE TABLE `Cita` (
  `id` int(11) NOT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `fechacita` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9E05355CA7FB1C0C` (`medico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Devolucion`
--

CREATE TABLE `Devolucion` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `total` double NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D109CB7F2A5805D` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `idioma` varchar(7) NOT NULL,
  `tema` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `claveusuario` varchar(255) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `movil` varchar(9) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fechaalta` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `tipo1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D9D9BF527F8F253B` (`dni`),
  UNIQUE KEY `UNIQ_D9D9BF52F85E0677` (`username`),
  UNIQUE KEY `UNIQ_D9D9BF52E7927C74` (`email`),
  KEY `IDX_D9D9BF52D60322AC` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `role_id`, `dni`, `nombre`, `idioma`, `tema`, `username`, `apellido1`, `apellido2`, `email`, `localidad`, `provincia`, `claveusuario`, `telefono`, `movil`, `password`, `salt`, `direccion`, `fechaalta`, `activo`, `tipo1`) VALUES
(1, 1, '48884094n', 'Empleado0', 'es', 'cobalt', 'empleado0', 'Apellido1', 'Apellido2', 'empleado0@gmail.com', 'Localidad', 'Provincia', 'GJVcsgnzM6GtbJ6Vml4e', '956894082', '625032634', 'FpM0RQzvp8eYZ/wZbjpQ1kKPcdo=', '01897791ba82f63ad66ce25d95f024e7', 'Direccion', '2013-06-13 13:42:55', 1, 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Familia`
--

CREATE TABLE `Familia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_91D4FBD33A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Festivo`
--

CREATE TABLE `Festivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Informe`
--

CREATE TABLE `Informe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cita_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `odavsc` varchar(255) DEFAULT NULL,
  `odavcc` varchar(255) DEFAULT NULL,
  `odesf` varchar(255) DEFAULT NULL,
  `odcil` varchar(255) DEFAULT NULL,
  `odeje` varchar(255) DEFAULT NULL,
  `odav` varchar(255) DEFAULT NULL,
  `oiavsc` varchar(255) DEFAULT NULL,
  `oiavcc` varchar(255) DEFAULT NULL,
  `oiesf` varchar(255) DEFAULT NULL,
  `oicil` varchar(255) DEFAULT NULL,
  `oieje` varchar(255) DEFAULT NULL,
  `oiav` varchar(255) DEFAULT NULL,
  `problema` varchar(255) NOT NULL,
  `pupilar` varchar(255) NOT NULL,
  `worth` varchar(255) NOT NULL,
  `Amsler` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B1C8D8451E011DDF` (`cita_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Lineasoperacion`
--

CREATE TABLE `Lineasoperacion` (
  `producto_id` int(11) NOT NULL,
  `operacion_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `pcompra` double NOT NULL,
  `iva` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`producto_id`,`operacion_id`),
  KEY `IDX_80D0C6677645698E` (`producto_id`),
  KEY `IDX_80D0C667E6D597C3` (`operacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Lineaspedido`
--

CREATE TABLE `Lineaspedido` (
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `iva` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`,`producto_id`),
  KEY `IDX_810B9754854653A` (`pedido_id`),
  KEY `IDX_810B9757645698E` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Log`
--

CREATE TABLE `Log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) DEFAULT NULL,
  `fechalog` datetime NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B7722E25952BE730` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `titulacion` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_34E5914C665648E9` (`color`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Modificacion`
--

CREATE TABLE `Modificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) DEFAULT NULL,
  `fechamod` datetime NOT NULL,
  `entidad` varchar(255) NOT NULL,
  `identificador` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3A9B910C952BE730` (`empleado_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Modificacion`
--

INSERT INTO `Modificacion` (`id`, `empleado_id`, `fechamod`, `entidad`, `identificador`, `tipo`, `info`) VALUES
(1, NULL, '2013-06-13 13:42:55', 'Empleado', '1', 'Inserción', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Operacion`
--

CREATE TABLE `Operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `fechaoper` datetime NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_56BE4BE8DE734E51` (`cliente_id`),
  KEY `IDX_56BE4BE8952BE730` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedido`
--

CREATE TABLE `Pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `recepciona_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `fecharecepcion` datetime DEFAULT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C34013F8CB305D73` (`proveedor_id`),
  KEY `IDX_C34013F8952BE730` (`empleado_id`),
  KEY `IDX_C34013F8EE063E04` (`recepciona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Permiso`
--

CREATE TABLE `Permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_32C79202952BE730` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `familia_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `reservado` int(11) NOT NULL,
  `apartado` int(11) NOT NULL,
  `pventa` double NOT NULL,
  `pcompra` double NOT NULL,
  `iva` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5ECD6443A02A2F00` (`descripcion`),
  KEY `IDX_5ECD6443CB305D73` (`proveedor_id`),
  KEY `IDX_5ECD6443D02563A3` (`familia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9431EA6D3A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reserva`
--

CREATE TABLE `Reserva` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `pago` varchar(255) NOT NULL,
  `totalpago` double NOT NULL,
  `avisada` datetime DEFAULT NULL,
  `adelanto` int(11) NOT NULL,
  `total` double NOT NULL,
  `apartado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D73017A7F2A5805D` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Role`
--

CREATE TABLE `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Role`
--

INSERT INTO `Role` (`id`, `name`) VALUES
(1, 'ROLE_A'),
(2, 'ROLE_U'),
(3, 'ROLE_M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `movil` varchar(9) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EDD889C17F8F253B` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta`
--

CREATE TABLE `Venta` (
  `id` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `pago` varchar(255) NOT NULL,
  `totalpago` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Arqueo`
--
ALTER TABLE `Arqueo`
  ADD CONSTRAINT `FK_B2EA45AC952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `Cita`
--
ALTER TABLE `Cita`
  ADD CONSTRAINT `FK_9E05355CBF396750` FOREIGN KEY (`id`) REFERENCES `Operacion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9E05355CA7FB1C0C` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

--
-- Filtros para la tabla `Devolucion`
--
ALTER TABLE `Devolucion`
  ADD CONSTRAINT `FK_1D109CB7BF396750` FOREIGN KEY (`id`) REFERENCES `Operacion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D109CB7F2A5805D` FOREIGN KEY (`venta_id`) REFERENCES `Venta` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_D9D9BF52D60322AC` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);

--
-- Filtros para la tabla `Informe`
--
ALTER TABLE `Informe`
  ADD CONSTRAINT `FK_B1C8D8451E011DDF` FOREIGN KEY (`cita_id`) REFERENCES `Cita` (`id`);

--
-- Filtros para la tabla `Lineasoperacion`
--
ALTER TABLE `Lineasoperacion`
  ADD CONSTRAINT `FK_80D0C667E6D597C3` FOREIGN KEY (`operacion_id`) REFERENCES `Operacion` (`id`),
  ADD CONSTRAINT `FK_80D0C6677645698E` FOREIGN KEY (`producto_id`) REFERENCES `Producto` (`id`);

--
-- Filtros para la tabla `Lineaspedido`
--
ALTER TABLE `Lineaspedido`
  ADD CONSTRAINT `FK_810B9757645698E` FOREIGN KEY (`producto_id`) REFERENCES `Producto` (`id`),
  ADD CONSTRAINT `FK_810B9754854653A` FOREIGN KEY (`pedido_id`) REFERENCES `Pedido` (`id`);

--
-- Filtros para la tabla `Log`
--
ALTER TABLE `Log`
  ADD CONSTRAINT `FK_B7722E25952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `FK_34E5914CBF396750` FOREIGN KEY (`id`) REFERENCES `empleado` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Modificacion`
--
ALTER TABLE `Modificacion`
  ADD CONSTRAINT `FK_3A9B910C952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `Operacion`
--
ALTER TABLE `Operacion`
  ADD CONSTRAINT `FK_56BE4BE8952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK_56BE4BE8DE734E51` FOREIGN KEY (`cliente_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `FK_C34013F8EE063E04` FOREIGN KEY (`recepciona_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK_C34013F8952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK_C34013F8CB305D73` FOREIGN KEY (`proveedor_id`) REFERENCES `Proveedor` (`id`);

--
-- Filtros para la tabla `Permiso`
--
ALTER TABLE `Permiso`
  ADD CONSTRAINT `FK_32C79202952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `FK_5ECD6443D02563A3` FOREIGN KEY (`familia_id`) REFERENCES `Familia` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_5ECD6443CB305D73` FOREIGN KEY (`proveedor_id`) REFERENCES `Proveedor` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `Reserva`
--
ALTER TABLE `Reserva`
  ADD CONSTRAINT `FK_D73017A7BF396750` FOREIGN KEY (`id`) REFERENCES `Operacion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D73017A7F2A5805D` FOREIGN KEY (`venta_id`) REFERENCES `Venta` (`id`);

--
-- Filtros para la tabla `Venta`
--
ALTER TABLE `Venta`
  ADD CONSTRAINT `FK_4E26C151BF396750` FOREIGN KEY (`id`) REFERENCES `Operacion` (`id`) ON DELETE CASCADE;
