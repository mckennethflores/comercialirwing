-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2024 at 02:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comercialirwingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidadmedidaid` int(11) NOT NULL,
  `imagen` varchar(77) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `unidadmedidaid`, `imagen`, `condicion`) VALUES
(1, 1, '123', 'Comino', 103, '', 16, '', 1),
(2, 1, '234', 'Pimienta', 41, '', 16, '', 1),
(3, 1, '754', 'Orégano', -119, '', 16, '', 1),
(4, 1, '987', 'Tomillo', 65, '', 16, '', 1),
(5, 1, '659', 'Canela', 98, '', 16, '', 1),
(6, 1, '697', 'Romero', 90, 'Romero', 16, '', 1),
(7, 2, '698', 'Almendra', 100, '', 16, '', 1),
(8, 2, '989', 'Cashu', 100, 'Cashu', 16, '', 1),
(9, 2, '668', 'Avellana', 100, 'Avellana', 16, '', 1),
(10, 2, '448', 'Girasol', 100, '', 16, '', 1),
(11, 2, '554', 'Calabaza', 100, '', 16, '', 1),
(12, 2, '552', 'Ajonjolí', 100, '', 16, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'molienda', '', 1),
(2, 'tostado', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

CREATE TABLE `contacto` (
  `idcontacto` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `dni` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `whatsapp` varchar(12) DEFAULT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `dni`, `email`, `celular`, `whatsapp`, `tipo`) VALUES
(1, '', '', '', '', '', '', 1),
(2, 'Clientes', 'Varios', '', 'fernandanunezv@globalfgroup.com', '', '', 2),
(5, 'KATERYN', 'VALDEZ', '', 'katerynv13@gmail.com', '942189613', '942189613', 2),
(6, 'juan', 'perez', '12345678', '@', '01999999', '999999999', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cotizacion`
--

CREATE TABLE `cotizacion` (
  `idcotizacion` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(25) NOT NULL,
  `serie_comprobante` varchar(12) DEFAULT NULL,
  `num_comprobante` varchar(15) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `igv` decimal(11,2) NOT NULL,
  `total_cotizacion` decimal(11,2) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `tipomoneda` varchar(30) DEFAULT NULL,
  `idcontacto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cotizacion`
--

INSERT INTO `cotizacion` (`idcotizacion`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `subtotal`, `igv`, `total_cotizacion`, `estado`, `tipomoneda`, `idcontacto`) VALUES
(1, 2, 14, 'COTIZACION', '1', '0001', '2024-02-07 00:00:00', '18.00', '14.58', '2.62', '17.20', 'Aceptado', 'SOLES', 6);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_cotizacion`
--

CREATE TABLE `detalle_cotizacion` (
  `iddetalle_cotizacion` int(11) NOT NULL,
  `idcotizacion` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `unidadmedida` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_cotizacion` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(1, 1, 1, 1, '1.00', '1.00'),
(2, 1, 2, 1, '1.00', '1.00'),
(3, 1, 3, 1, '1.00', '1.00'),
(4, 1, 4, 1, '1.00', '1.00'),
(5, 1, 5, 1, '1.00', '1.00'),
(6, 2, 1, 5, '1.00', '1.00'),
(7, 2, 2, 4, '1.00', '1.00'),
(8, 2, 3, 3, '1.00', '1.00'),
(9, 3, 1, 5, '1.00', '1.00'),
(10, 3, 2, 6, '1.00', '1.00'),
(11, 3, 3, 7, '1.00', '1.00'),
(12, 4, 2, 5, '1.00', '1.00'),
(13, 4, 3, 8, '1.00', '1.00'),
(14, 4, 4, 9, '1.00', '1.00'),
(15, 4, 1, 52, '1.00', '1.00'),
(16, 4, 5, 6, '1.00', '1.00');

--
-- Triggers `detalle_ingreso`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(20) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(1, 1, 1, 5, '1.00', '0.00'),
(2, 1, 2, 10, '1.00', '0.00'),
(3, 1, 3, 15, '1.00', '0.00'),
(4, 2, 1, 5, '1.00', '0.00'),
(5, 2, 2, 10, '1.00', '0.00'),
(6, 2, 3, 5, '1.00', '0.00'),
(7, 3, 1, 10, '1.00', '0.00'),
(8, 3, 6, 10, '20.00', '0.00'),
(9, 4, 1, 2, '1.00', '0.00'),
(10, 4, 2, 3, '1.00', '0.00'),
(11, 4, 3, 1, '1.00', '0.00'),
(12, 4, 4, 5, '1.00', '0.00'),
(13, 4, 5, 9, '1.00', '0.00'),
(14, 5, 1, 5, '1.00', '0.00'),
(15, 5, 2, 10, '1.00', '0.00'),
(16, 6, 1, 10, '1.00', '0.00'),
(17, 6, 2, 15, '1.00', '0.00'),
(18, 6, 3, 166, '1.00', '0.00');

--
-- Triggers `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad 
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(25) NOT NULL,
  `serie_comprobante` varchar(10) DEFAULT NULL,
  `num_comprobante` varchar(12) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `tipo_servicio` varchar(100) NOT NULL,
  `tipo_empaquetado` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`, `tipo_servicio`, `tipo_empaquetado`, `descripcion`) VALUES
(1, 306, 14, 'Boleta', '', '', '2024-02-23 00:00:00', '0.00', '5.00', 'Aceptado', '', '', ''),
(2, 301, 14, 'VENTA', '', '', '2024-02-23 00:00:00', '0.00', '3.00', 'Aceptado', 'TOSTADO', 'EMPAQUETADO', 'ENTREDA DE MERCADERIA PARA TOSTAR'),
(3, 301, 14, 'VENTA', '', '', '2024-02-23 00:00:00', '0.00', '18.00', 'Aceptado', 'TOSTADO', 'EMPAQUETADO', ''),
(4, 300, 14, 'VENTA', '', '', '2024-02-23 00:00:00', '0.00', '80.00', 'Aceptado', 'TOSTADO', 'GRANEL', 'ingreso de marcaderia para tostar');

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas'),
(8, 'Backup'),
(9, 'Reportes'),
(10, 'Consulta Ventas por producto'),
(11, 'Cotización');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo_documento` varchar(25) DEFAULT NULL,
  `num_documento` varchar(25) DEFAULT NULL,
  `direccion` varchar(120) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `letra_puesto` varchar(100) NOT NULL DEFAULT 'NO',
  `numero_puesto` varchar(100) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `letra_puesto`, `numero_puesto`) VALUES
(2, 'Cliente', 'FR SYSTEM S.A.C.', 'RUC', '20601579317', 'Av. Garcilaso de la Vega 1260 Of. 6 Lima', '+51938222552', 'informes@frsystem.com.pe', 'NO', 'NO'),
(300, 'Cliente', 'DIONICIA HUARA', 'DNI', '1', 'MINORISTA', '', '', 'J', '1000'),
(301, 'Cliente', 'RAFAEL CISNEROS', 'DNI', '', 'MINORISTA', '', '', 'NO', 'NO'),
(302, 'Cliente', 'LERMA', 'DNI', '', '', '', '', 'NO', 'NO'),
(303, 'Cliente', 'MARCOS', 'DNI', '', '', '', '', 'NO', 'NO'),
(304, 'Cliente', 'VALERIO', 'DNI', '', '', '', '', 'NO', 'NO'),
(305, 'Cliente', 'HECTOR VIGO', 'DNI', '', '', '', '', 'NO', 'NO'),
(306, 'Proveedor', 'PROVEEDOR SAC', 'DNI', '2', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `id` int(11) NOT NULL,
  `indice` varchar(150) NOT NULL,
  `valor` varchar(150) NOT NULL DEFAULT 'unidadmedida',
  `condicion` int(5) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `unidadmedida`
--

INSERT INTO `unidadmedida` (`id`, `indice`, `valor`, `condicion`) VALUES
(3, 'Sacos', 'unidadmedida', 1),
(13, 'kILOS', 'unidadmedida', 1),
(11, 'UNIDADES', 'unidadmedida', 1),
(12, 'LITROS', 'unidadmedida', 1),
(14, 'CAJAS', 'unidadmedida', 1),
(15, 'METROS', 'unidadmedida', 1),
(16, 'MTS', 'unidadmedida', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo_documento` varchar(25) NOT NULL,
  `num_documento` varchar(25) NOT NULL,
  `direccion` varchar(120) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cargo` varchar(25) DEFAULT NULL,
  `login` varchar(25) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(55) NOT NULL,
  `condicion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(14, 'IRWING  CISNEROS', 'DNI', '77435280', 'LIMA', '902861465', 'irwing@gmail.com', 'GERENTE', 'IRWING', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1678404332.jpg', 1),
(15, 'ASISTENTE 1', 'DNI', '004121254', '', '942189613', 'katerynv13@gmail.com', 'VENTAS', 'asistente1', 'e0a4da5f528721c554349ae48cd2e5b0e2857d512e10a0033baaa7dad7633a5e', '', 1),
(16, 'ASISTENTE 2', 'DNI', '48127291', '', '981116573', 'andreasantinisa@gmail.com', 'ADMINISTRADOR', 'asistente2', 'ea0176024cc85d4179283d68427a507b014929b80f5ca68d51cb4878587cf2f2', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(86, 14, 1),
(87, 14, 2),
(88, 14, 3),
(89, 14, 4),
(90, 14, 5),
(91, 14, 6),
(92, 14, 7),
(93, 14, 8),
(94, 14, 9),
(95, 14, 10),
(96, 14, 11),
(97, 16, 1),
(98, 16, 2),
(99, 16, 3),
(100, 16, 4),
(101, 16, 6),
(102, 16, 7),
(103, 16, 9),
(104, 16, 11),
(105, 15, 1),
(106, 15, 2),
(107, 15, 3),
(108, 15, 4),
(109, 15, 6),
(110, 15, 7),
(111, 15, 8),
(112, 15, 9),
(113, 15, 10),
(114, 15, 11);

-- --------------------------------------------------------

--
-- Table structure for table `valores`
--

CREATE TABLE `valores` (
  `idvalores` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `orden` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `valores`
--

INSERT INTO `valores` (`idvalores`, `nombre`, `valor`, `orden`) VALUES
(1, 'Contacto', 'TYPE_USER', '1'),
(2, 'Vendedor', 'TYPE_USER', '2');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(25) NOT NULL,
  `serie_comprobante` varchar(12) DEFAULT NULL,
  `num_comprobante` varchar(15) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `igv` decimal(11,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `tipomoneda` varchar(30) NOT NULL,
  `idvendedor` int(11) NOT NULL,
  `tipo_servicio` varchar(100) NOT NULL,
  `tipo_empaquetado` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `subtotal`, `igv`, `total_venta`, `estado`, `tipomoneda`, `idvendedor`, `tipo_servicio`, `tipo_empaquetado`, `descripcion`) VALUES
(1, 300, 14, 'ENTRADA', '1', '1', '2024-02-23 00:00:00', '0.00', '25.42', '4.58', '30.00', 'Aceptado', '', 2, 'TOSTADO', 'GRANEL', 'demo informacion'),
(2, 300, 14, 'SALIDA', '1', '1', '2024-02-23 00:00:00', '0.00', '16.95', '3.05', '20.00', 'Aceptado', '', 2, 'TOSTADO', 'EMPAQUETADO', ''),
(3, 300, 14, 'VENTA', '1', '1', '2024-02-23 00:00:00', '0.00', '177.97', '32.03', '210.00', 'Aceptado', '', 2, 'MOLIENDA', 'GRANEL', ''),
(4, 300, 14, 'VENTA', '1', '1', '2024-02-23 00:00:00', '0.00', '16.95', '3.05', '20.00', 'Aceptado', '', 2, 'TOSTADO', 'EMPAQUETADO', 'ESTA INFORMACION ES IMPORTANTE'),
(5, 300, 14, 'VENTA', '1', '1', '2024-02-23 00:00:00', '0.00', '12.71', '2.29', '15.00', 'Aceptado', '', 2, 'TOSTADO', 'GRANEL', 'limpiarCadena'),
(6, 300, 14, 'SERVICIO', '1', '1', '2024-02-23 00:00:00', '0.00', '161.86', '29.14', '191.00', 'Aceptado', '', 2, 'MOLIENDA', 'GRANEL', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indexes for table `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`idcontacto`) USING BTREE;

--
-- Indexes for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`idcotizacion`) USING BTREE,
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- Indexes for table `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  ADD PRIMARY KEY (`iddetalle_cotizacion`) USING BTREE,
  ADD KEY `fk_detalle_cotizacion_cotizacion_idx` (`idcotizacion`) USING BTREE,
  ADD KEY `fk_detalle_cotizacion_articulo_idx` (`idarticulo`) USING BTREE;

--
-- Indexes for table `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_ingreso_idx` (`idingreso`),
  ADD KEY `fk_detalle_ingreso_articulo_idx` (`idarticulo`);

--
-- Indexes for table `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`);

--
-- Indexes for table `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indexes for table `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indexes for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_usuario_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`);

--
-- Indexes for table `valores`
--
ALTER TABLE `valores`
  ADD PRIMARY KEY (`idvalores`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacto`
--
ALTER TABLE `contacto`
  MODIFY `idcontacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `idcotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  MODIFY `iddetalle_cotizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `valores`
--
ALTER TABLE `valores`
  MODIFY `idvalores` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
