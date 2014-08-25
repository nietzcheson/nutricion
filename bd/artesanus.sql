-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-05-2014 a las 17:52:00
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `artesanus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(100) NOT NULL,
  `pais` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `ciudad`, `pais`) VALUES
(1, 'Bogotá', 1),
(2, 'Medellín', 1),
(3, 'Cancún', 2),
(4, 'Distrito federal', 2),
(5, 'Cali', 1),
(6, 'Potosí', 2),
(7, 'Cartagena', 1),
(8, 'Medellín', 1),
(9, 'Querétaro', 2),
(10, 'Villavicencio', 1),
(11, 'Guajira', 1),
(12, 'Tunja', 1),
(13, 'Barrancabermeja', 1),
(14, 'Guamal', 1),
(15, 'Puebla', 2),
(16, 'Barbosa', 1),
(17, 'Manizales', 1),
(18, 'Mesetas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE IF NOT EXISTS `generos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `genero`) VALUES
(1, 'Femenino'),
(2, 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombres`
--

CREATE TABLE IF NOT EXISTS `nombres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `genero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `nombres`
--

INSERT INTO `nombres` (`id`, `nombre`, `genero`) VALUES
(1, 'Cristian', 2),
(2, 'Dulce', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `pais`) VALUES
(1, 'Colombia'),
(2, 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(100) NOT NULL,
  `llave` varchar(50) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `permiso`, `llave`) VALUES
(1, 'Tareas de administración', 'admin_access'),
(2, 'Agregar Posts', 'nuevo_post'),
(3, 'Editar Post', 'editar_post'),
(4, 'Eliminar Post', 'eliminar_post');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_role`
--

CREATE TABLE IF NOT EXISTS `permisos_role` (
  `role` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  `valor` tinyint(4) NOT NULL,
  UNIQUE KEY `role` (`role`,`permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_role`
--

INSERT INTO `permisos_role` (`role`, `permiso`, `valor`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(2, 2, 0),
(2, 3, 1),
(2, 4, 0),
(3, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_usuario`
--

CREATE TABLE IF NOT EXISTS `permisos_usuario` (
  `usuario` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  `valor` tinyint(4) NOT NULL,
  UNIQUE KEY `usuario` (`usuario`,`permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_usuario`
--

INSERT INTO `permisos_usuario` (`usuario`, `permiso`, `valor`) VALUES
(2, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cuerpo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=317 ;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `titulo`, `cuerpo`, `imagen`) VALUES
(6, 'Título1', 'saffas', 'upl_535c4960a2f32.jpg'),
(8, 'Título2', 'Cuerpo2', 'upl_535c554c829e4.jpg'),
(9, 'Título3', 'Cuerpo3', 'upl_535c55ee24542.jpg'),
(10, 'Titulo4', 'Cuerpo4', 'upl_535c569432569.png'),
(11, 'imagen1', 'Cuerpo', 'upl_535c569432569.png'),
(12, '241421412', '142241241', 'upl_535c569432569.png'),
(13, '42142', '424242142', 'upl_535c569432569.png'),
(14, '332124', '421421421142', 'upl_535c569432569.png'),
(15, 'asffsafas', '1212442412', 'upl_535c569432569.png'),
(16, '42421421', '421412412124', 'upl_535c569432569.png'),
(17, 'titulo0', 'cuerpo0', 'imagenupl_535c569432569.png'),
(18, 'titulo1', 'cuerpo1', 'imagenupl_535c569432569.png'),
(19, 'titulo2', 'cuerpo2', 'imagenupl_535c569432569.png'),
(20, 'titulo3', 'cuerpo3', 'imagenupl_535c569432569.png'),
(21, 'titulo4', 'cuerpo4', 'imagenupl_535c569432569.png'),
(22, 'titulo5', 'cuerpo5', 'imagenupl_535c569432569.png'),
(23, 'titulo6', 'cuerpo6', 'imagenupl_535c569432569.png'),
(24, 'titulo7', 'cuerpo7', 'imagenupl_535c569432569.png'),
(25, 'titulo8', 'cuerpo8', 'imagenupl_535c569432569.png'),
(26, 'titulo9', 'cuerpo9', 'imagenupl_535c569432569.png'),
(27, 'titulo10', 'cuerpo10', 'imagenupl_535c569432569.png'),
(28, 'titulo11', 'cuerpo11', 'imagenupl_535c569432569.png'),
(29, 'titulo12', 'cuerpo12', 'imagenupl_535c569432569.png'),
(30, 'titulo13', 'cuerpo13', 'imagenupl_535c569432569.png'),
(31, 'titulo14', 'cuerpo14', 'imagenupl_535c569432569.png'),
(32, 'titulo15', 'cuerpo15', 'imagenupl_535c569432569.png'),
(33, 'titulo16', 'cuerpo16', 'imagenupl_535c569432569.png'),
(34, 'titulo17', 'cuerpo17', 'imagenupl_535c569432569.png'),
(35, 'titulo18', 'cuerpo18', 'imagenupl_535c569432569.png'),
(36, 'titulo19', 'cuerpo19', 'imagenupl_535c569432569.png'),
(37, 'titulo20', 'cuerpo20', 'imagenupl_535c569432569.png'),
(38, 'titulo21', 'cuerpo21', 'imagenupl_535c569432569.png'),
(39, 'titulo22', 'cuerpo22', 'imagenupl_535c569432569.png'),
(40, 'titulo23', 'cuerpo23', 'imagenupl_535c569432569.png'),
(41, 'titulo24', 'cuerpo24', 'imagenupl_535c569432569.png'),
(42, 'titulo25', 'cuerpo25', 'imagenupl_535c569432569.png'),
(43, 'titulo26', 'cuerpo26', 'imagenupl_535c569432569.png'),
(44, 'titulo27', 'cuerpo27', 'imagenupl_535c569432569.png'),
(45, 'titulo28', 'cuerpo28', 'imagenupl_535c569432569.png'),
(46, 'titulo29', 'cuerpo29', 'imagenupl_535c569432569.png'),
(47, 'titulo30', 'cuerpo30', 'imagenupl_535c569432569.png'),
(48, 'titulo31', 'cuerpo31', 'imagenupl_535c569432569.png'),
(49, 'titulo32', 'cuerpo32', 'imagenupl_535c569432569.png'),
(50, 'titulo33', 'cuerpo33', 'imagenupl_535c569432569.png'),
(51, 'titulo34', 'cuerpo34', 'imagenupl_535c569432569.png'),
(52, 'titulo35', 'cuerpo35', 'imagenupl_535c569432569.png'),
(53, 'titulo36', 'cuerpo36', 'imagenupl_535c569432569.png'),
(54, 'titulo37', 'cuerpo37', 'imagenupl_535c569432569.png'),
(55, 'titulo38', 'cuerpo38', 'imagenupl_535c569432569.png'),
(56, 'titulo39', 'cuerpo39', 'imagenupl_535c569432569.png'),
(57, 'titulo40', 'cuerpo40', 'imagenupl_535c569432569.png'),
(58, 'titulo41', 'cuerpo41', 'imagenupl_535c569432569.png'),
(59, 'titulo42', 'cuerpo42', 'imagenupl_535c569432569.png'),
(60, 'titulo43', 'cuerpo43', 'imagenupl_535c569432569.png'),
(61, 'titulo44', 'cuerpo44', 'imagenupl_535c569432569.png'),
(62, 'titulo45', 'cuerpo45', 'imagenupl_535c569432569.png'),
(63, 'titulo46', 'cuerpo46', 'imagenupl_535c569432569.png'),
(64, 'titulo47', 'cuerpo47', 'imagenupl_535c569432569.png'),
(65, 'titulo48', 'cuerpo48', 'imagenupl_535c569432569.png'),
(66, 'titulo49', 'cuerpo49', 'imagenupl_535c569432569.png'),
(67, 'titulo50', 'cuerpo50', 'imagenupl_535c569432569.png'),
(68, 'titulo51', 'cuerpo51', 'imagenupl_535c569432569.png'),
(69, 'titulo52', 'cuerpo52', 'imagenupl_535c569432569.png'),
(70, 'titulo53', 'cuerpo53', 'imagenupl_535c569432569.png'),
(71, 'titulo54', 'cuerpo54', 'imagenupl_535c569432569.png'),
(72, 'titulo55', 'cuerpo55', 'imagenupl_535c569432569.png'),
(73, 'titulo56', 'cuerpo56', 'imagenupl_535c569432569.png'),
(74, 'titulo57', 'cuerpo57', 'imagenupl_535c569432569.png'),
(75, 'titulo58', 'cuerpo58', 'imagenupl_535c569432569.png'),
(76, 'titulo59', 'cuerpo59', 'imagenupl_535c569432569.png'),
(77, 'titulo60', 'cuerpo60', 'imagenupl_535c569432569.png'),
(78, 'titulo61', 'cuerpo61', 'imagenupl_535c569432569.png'),
(79, 'titulo62', 'cuerpo62', 'imagenupl_535c569432569.png'),
(80, 'titulo63', 'cuerpo63', 'imagenupl_535c569432569.png'),
(81, 'titulo64', 'cuerpo64', 'imagenupl_535c569432569.png'),
(82, 'titulo65', 'cuerpo65', 'imagenupl_535c569432569.png'),
(83, 'titulo66', 'cuerpo66', 'imagenupl_535c569432569.png'),
(84, 'titulo67', 'cuerpo67', 'imagenupl_535c569432569.png'),
(85, 'titulo68', 'cuerpo68', 'imagenupl_535c569432569.png'),
(86, 'titulo69', 'cuerpo69', 'imagenupl_535c569432569.png'),
(87, 'titulo70', 'cuerpo70', 'imagenupl_535c569432569.png'),
(88, 'titulo71', 'cuerpo71', 'imagenupl_535c569432569.png'),
(89, 'titulo72', 'cuerpo72', 'imagenupl_535c569432569.png'),
(90, 'titulo73', 'cuerpo73', 'imagenupl_535c569432569.png'),
(91, 'titulo74', 'cuerpo74', 'imagenupl_535c569432569.png'),
(92, 'titulo75', 'cuerpo75', 'imagenupl_535c569432569.png'),
(93, 'titulo76', 'cuerpo76', 'imagenupl_535c569432569.png'),
(94, 'titulo77', 'cuerpo77', 'imagenupl_535c569432569.png'),
(95, 'titulo78', 'cuerpo78', 'imagenupl_535c569432569.png'),
(96, 'titulo79', 'cuerpo79', 'imagenupl_535c569432569.png'),
(97, 'titulo80', 'cuerpo80', 'imagenupl_535c569432569.png'),
(98, 'titulo81', 'cuerpo81', 'imagenupl_535c569432569.png'),
(99, 'titulo82', 'cuerpo82', 'imagenupl_535c569432569.png'),
(100, 'titulo83', 'cuerpo83', 'imagenupl_535c569432569.png'),
(101, 'titulo84', 'cuerpo84', 'imagenupl_535c569432569.png'),
(102, 'titulo85', 'cuerpo85', 'imagenupl_535c569432569.png'),
(103, 'titulo86', 'cuerpo86', 'imagenupl_535c569432569.png'),
(104, 'titulo87', 'cuerpo87', 'imagenupl_535c569432569.png'),
(105, 'titulo88', 'cuerpo88', 'imagenupl_535c569432569.png'),
(106, 'titulo89', 'cuerpo89', 'imagenupl_535c569432569.png'),
(107, 'titulo90', 'cuerpo90', 'imagenupl_535c569432569.png'),
(108, 'titulo91', 'cuerpo91', 'imagenupl_535c569432569.png'),
(109, 'titulo92', 'cuerpo92', 'imagenupl_535c569432569.png'),
(110, 'titulo93', 'cuerpo93', 'imagenupl_535c569432569.png'),
(111, 'titulo94', 'cuerpo94', 'imagenupl_535c569432569.png'),
(112, 'titulo95', 'cuerpo95', 'imagenupl_535c569432569.png'),
(113, 'titulo96', 'cuerpo96', 'imagenupl_535c569432569.png'),
(114, 'titulo97', 'cuerpo97', 'imagenupl_535c569432569.png'),
(115, 'titulo98', 'cuerpo98', 'imagenupl_535c569432569.png'),
(116, 'titulo99', 'cuerpo99', 'imagenupl_535c569432569.png'),
(117, 'titulo100', 'cuerpo100', 'imagenupl_535c569432569.png'),
(118, 'titulo101', 'cuerpo101', 'imagenupl_535c569432569.png'),
(119, 'titulo102', 'cuerpo102', 'imagenupl_535c569432569.png'),
(120, 'titulo103', 'cuerpo103', 'imagenupl_535c569432569.png'),
(121, 'titulo104', 'cuerpo104', 'imagenupl_535c569432569.png'),
(122, 'titulo105', 'cuerpo105', 'imagenupl_535c569432569.png'),
(123, 'titulo106', 'cuerpo106', 'imagenupl_535c569432569.png'),
(124, 'titulo107', 'cuerpo107', 'imagenupl_535c569432569.png'),
(125, 'titulo108', 'cuerpo108', 'imagenupl_535c569432569.png'),
(126, 'titulo109', 'cuerpo109', 'imagenupl_535c569432569.png'),
(127, 'titulo110', 'cuerpo110', 'imagenupl_535c569432569.png'),
(128, 'titulo111', 'cuerpo111', 'imagenupl_535c569432569.png'),
(129, 'titulo112', 'cuerpo112', 'imagenupl_535c569432569.png'),
(130, 'titulo113', 'cuerpo113', 'imagenupl_535c569432569.png'),
(131, 'titulo114', 'cuerpo114', 'imagenupl_535c569432569.png'),
(132, 'titulo115', 'cuerpo115', 'imagenupl_535c569432569.png'),
(133, 'titulo116', 'cuerpo116', 'imagenupl_535c569432569.png'),
(134, 'titulo117', 'cuerpo117', 'imagenupl_535c569432569.png'),
(135, 'titulo118', 'cuerpo118', 'imagenupl_535c569432569.png'),
(136, 'titulo119', 'cuerpo119', 'imagenupl_535c569432569.png'),
(137, 'titulo120', 'cuerpo120', 'imagenupl_535c569432569.png'),
(138, 'titulo121', 'cuerpo121', 'imagenupl_535c569432569.png'),
(139, 'titulo122', 'cuerpo122', 'imagenupl_535c569432569.png'),
(140, 'titulo123', 'cuerpo123', 'imagenupl_535c569432569.png'),
(141, 'titulo124', 'cuerpo124', 'imagenupl_535c569432569.png'),
(142, 'titulo125', 'cuerpo125', 'imagenupl_535c569432569.png'),
(143, 'titulo126', 'cuerpo126', 'imagenupl_535c569432569.png'),
(144, 'titulo127', 'cuerpo127', 'imagenupl_535c569432569.png'),
(145, 'titulo128', 'cuerpo128', 'imagenupl_535c569432569.png'),
(146, 'titulo129', 'cuerpo129', 'imagenupl_535c569432569.png'),
(147, 'titulo130', 'cuerpo130', 'imagenupl_535c569432569.png'),
(148, 'titulo131', 'cuerpo131', 'imagenupl_535c569432569.png'),
(149, 'titulo132', 'cuerpo132', 'imagenupl_535c569432569.png'),
(150, 'titulo133', 'cuerpo133', 'imagenupl_535c569432569.png'),
(151, 'titulo134', 'cuerpo134', 'imagenupl_535c569432569.png'),
(152, 'titulo135', 'cuerpo135', 'imagenupl_535c569432569.png'),
(153, 'titulo136', 'cuerpo136', 'imagenupl_535c569432569.png'),
(154, 'titulo137', 'cuerpo137', 'imagenupl_535c569432569.png'),
(155, 'titulo138', 'cuerpo138', 'imagenupl_535c569432569.png'),
(156, 'titulo139', 'cuerpo139', 'imagenupl_535c569432569.png'),
(157, 'titulo140', 'cuerpo140', 'imagenupl_535c569432569.png'),
(158, 'titulo141', 'cuerpo141', 'imagenupl_535c569432569.png'),
(159, 'titulo142', 'cuerpo142', 'imagenupl_535c569432569.png'),
(160, 'titulo143', 'cuerpo143', 'imagenupl_535c569432569.png'),
(161, 'titulo144', 'cuerpo144', 'imagenupl_535c569432569.png'),
(162, 'titulo145', 'cuerpo145', 'imagenupl_535c569432569.png'),
(163, 'titulo146', 'cuerpo146', 'imagenupl_535c569432569.png'),
(164, 'titulo147', 'cuerpo147', 'imagenupl_535c569432569.png'),
(165, 'titulo148', 'cuerpo148', 'imagenupl_535c569432569.png'),
(166, 'titulo149', 'cuerpo149', 'imagenupl_535c569432569.png'),
(167, 'titulo150', 'cuerpo150', 'imagenupl_535c569432569.png'),
(168, 'titulo151', 'cuerpo151', 'imagenupl_535c569432569.png'),
(169, 'titulo152', 'cuerpo152', 'imagenupl_535c569432569.png'),
(170, 'titulo153', 'cuerpo153', 'imagenupl_535c569432569.png'),
(171, 'titulo154', 'cuerpo154', 'imagenupl_535c569432569.png'),
(172, 'titulo155', 'cuerpo155', 'imagenupl_535c569432569.png'),
(173, 'titulo156', 'cuerpo156', 'imagenupl_535c569432569.png'),
(174, 'titulo157', 'cuerpo157', 'imagenupl_535c569432569.png'),
(175, 'titulo158', 'cuerpo158', 'imagenupl_535c569432569.png'),
(176, 'titulo159', 'cuerpo159', 'imagenupl_535c569432569.png'),
(177, 'titulo160', 'cuerpo160', 'imagenupl_535c569432569.png'),
(178, 'titulo161', 'cuerpo161', 'imagenupl_535c569432569.png'),
(179, 'titulo162', 'cuerpo162', 'imagenupl_535c569432569.png'),
(180, 'titulo163', 'cuerpo163', 'imagenupl_535c569432569.png'),
(181, 'titulo164', 'cuerpo164', 'imagenupl_535c569432569.png'),
(182, 'titulo165', 'cuerpo165', 'imagenupl_535c569432569.png'),
(183, 'titulo166', 'cuerpo166', 'imagenupl_535c569432569.png'),
(184, 'titulo167', 'cuerpo167', 'imagenupl_535c569432569.png'),
(185, 'titulo168', 'cuerpo168', 'imagenupl_535c569432569.png'),
(186, 'titulo169', 'cuerpo169', 'imagenupl_535c569432569.png'),
(187, 'titulo170', 'cuerpo170', 'imagenupl_535c569432569.png'),
(188, 'titulo171', 'cuerpo171', 'imagenupl_535c569432569.png'),
(189, 'titulo172', 'cuerpo172', 'imagenupl_535c569432569.png'),
(190, 'titulo173', 'cuerpo173', 'imagenupl_535c569432569.png'),
(191, 'titulo174', 'cuerpo174', 'imagenupl_535c569432569.png'),
(192, 'titulo175', 'cuerpo175', 'imagenupl_535c569432569.png'),
(193, 'titulo176', 'cuerpo176', 'imagenupl_535c569432569.png'),
(194, 'titulo177', 'cuerpo177', 'imagenupl_535c569432569.png'),
(195, 'titulo178', 'cuerpo178', 'imagenupl_535c569432569.png'),
(196, 'titulo179', 'cuerpo179', 'imagenupl_535c569432569.png'),
(197, 'titulo180', 'cuerpo180', 'imagenupl_535c569432569.png'),
(198, 'titulo181', 'cuerpo181', 'imagenupl_535c569432569.png'),
(199, 'titulo182', 'cuerpo182', 'imagenupl_535c569432569.png'),
(200, 'titulo183', 'cuerpo183', 'imagenupl_535c569432569.png'),
(201, 'titulo184', 'cuerpo184', 'imagenupl_535c569432569.png'),
(202, 'titulo185', 'cuerpo185', 'imagenupl_535c569432569.png'),
(203, 'titulo186', 'cuerpo186', 'imagenupl_535c569432569.png'),
(204, 'titulo187', 'cuerpo187', 'imagenupl_535c569432569.png'),
(205, 'titulo188', 'cuerpo188', 'imagenupl_535c569432569.png'),
(206, 'titulo189', 'cuerpo189', 'imagenupl_535c569432569.png'),
(207, 'titulo190', 'cuerpo190', 'imagenupl_535c569432569.png'),
(208, 'titulo191', 'cuerpo191', 'imagenupl_535c569432569.png'),
(209, 'titulo192', 'cuerpo192', 'imagenupl_535c569432569.png'),
(210, 'titulo193', 'cuerpo193', 'imagenupl_535c569432569.png'),
(211, 'titulo194', 'cuerpo194', 'imagenupl_535c569432569.png'),
(212, 'titulo195', 'cuerpo195', 'imagenupl_535c569432569.png'),
(213, 'titulo196', 'cuerpo196', 'imagenupl_535c569432569.png'),
(214, 'titulo197', 'cuerpo197', 'imagenupl_535c569432569.png'),
(215, 'titulo198', 'cuerpo198', 'imagenupl_535c569432569.png'),
(216, 'titulo199', 'cuerpo199', 'imagenupl_535c569432569.png'),
(217, 'titulo200', 'cuerpo200', 'imagenupl_535c569432569.png'),
(218, 'titulo201', 'cuerpo201', 'imagenupl_535c569432569.png'),
(219, 'titulo202', 'cuerpo202', 'imagenupl_535c569432569.png'),
(220, 'titulo203', 'cuerpo203', 'imagenupl_535c569432569.png'),
(221, 'titulo204', 'cuerpo204', 'imagenupl_535c569432569.png'),
(222, 'titulo205', 'cuerpo205', 'imagenupl_535c569432569.png'),
(223, 'titulo206', 'cuerpo206', 'imagenupl_535c569432569.png'),
(224, 'titulo207', 'cuerpo207', 'imagenupl_535c569432569.png'),
(225, 'titulo208', 'cuerpo208', 'imagenupl_535c569432569.png'),
(226, 'titulo209', 'cuerpo209', 'imagenupl_535c569432569.png'),
(227, 'titulo210', 'cuerpo210', 'imagenupl_535c569432569.png'),
(228, 'titulo211', 'cuerpo211', 'imagenupl_535c569432569.png'),
(229, 'titulo212', 'cuerpo212', 'imagenupl_535c569432569.png'),
(230, 'titulo213', 'cuerpo213', 'imagenupl_535c569432569.png'),
(231, 'titulo214', 'cuerpo214', 'imagenupl_535c569432569.png'),
(232, 'titulo215', 'cuerpo215', 'imagenupl_535c569432569.png'),
(233, 'titulo216', 'cuerpo216', 'imagenupl_535c569432569.png'),
(234, 'titulo217', 'cuerpo217', 'imagenupl_535c569432569.png'),
(235, 'titulo218', 'cuerpo218', 'imagenupl_535c569432569.png'),
(236, 'titulo219', 'cuerpo219', 'imagenupl_535c569432569.png'),
(237, 'titulo220', 'cuerpo220', 'imagenupl_535c569432569.png'),
(238, 'titulo221', 'cuerpo221', 'imagenupl_535c569432569.png'),
(239, 'titulo222', 'cuerpo222', 'imagenupl_535c569432569.png'),
(240, 'titulo223', 'cuerpo223', 'imagenupl_535c569432569.png'),
(241, 'titulo224', 'cuerpo224', 'imagenupl_535c569432569.png'),
(242, 'titulo225', 'cuerpo225', 'imagenupl_535c569432569.png'),
(243, 'titulo226', 'cuerpo226', 'imagenupl_535c569432569.png'),
(244, 'titulo227', 'cuerpo227', 'imagenupl_535c569432569.png'),
(245, 'titulo228', 'cuerpo228', 'imagenupl_535c569432569.png'),
(246, 'titulo229', 'cuerpo229', 'imagenupl_535c569432569.png'),
(247, 'titulo230', 'cuerpo230', 'imagenupl_535c569432569.png'),
(248, 'titulo231', 'cuerpo231', 'imagenupl_535c569432569.png'),
(249, 'titulo232', 'cuerpo232', 'imagenupl_535c569432569.png'),
(250, 'titulo233', 'cuerpo233', 'imagenupl_535c569432569.png'),
(251, 'titulo234', 'cuerpo234', 'imagenupl_535c569432569.png'),
(252, 'titulo235', 'cuerpo235', 'imagenupl_535c569432569.png'),
(253, 'titulo236', 'cuerpo236', 'imagenupl_535c569432569.png'),
(254, 'titulo237', 'cuerpo237', 'imagenupl_535c569432569.png'),
(255, 'titulo238', 'cuerpo238', 'imagenupl_535c569432569.png'),
(256, 'titulo239', 'cuerpo239', 'imagenupl_535c569432569.png'),
(257, 'titulo240', 'cuerpo240', 'imagenupl_535c569432569.png'),
(258, 'titulo241', 'cuerpo241', 'imagenupl_535c569432569.png'),
(259, 'titulo242', 'cuerpo242', 'imagenupl_535c569432569.png'),
(260, 'titulo243', 'cuerpo243', 'imagenupl_535c569432569.png'),
(261, 'titulo244', 'cuerpo244', 'imagenupl_535c569432569.png'),
(262, 'titulo245', 'cuerpo245', 'imagenupl_535c569432569.png'),
(263, 'titulo246', 'cuerpo246', 'imagenupl_535c569432569.png'),
(264, 'titulo247', 'cuerpo247', 'imagenupl_535c569432569.png'),
(265, 'titulo248', 'cuerpo248', 'imagenupl_535c569432569.png'),
(266, 'titulo249', 'cuerpo249', 'imagenupl_535c569432569.png'),
(267, 'titulo250', 'cuerpo250', 'imagenupl_535c569432569.png'),
(268, 'titulo251', 'cuerpo251', 'imagenupl_535c569432569.png'),
(269, 'titulo252', 'cuerpo252', 'imagenupl_535c569432569.png'),
(270, 'titulo253', 'cuerpo253', 'imagenupl_535c569432569.png'),
(271, 'titulo254', 'cuerpo254', 'imagenupl_535c569432569.png'),
(272, 'titulo255', 'cuerpo255', 'imagenupl_535c569432569.png'),
(273, 'titulo256', 'cuerpo256', 'imagenupl_535c569432569.png'),
(274, 'titulo257', 'cuerpo257', 'imagenupl_535c569432569.png'),
(275, 'titulo258', 'cuerpo258', 'imagenupl_535c569432569.png'),
(276, 'titulo259', 'cuerpo259', 'imagenupl_535c569432569.png'),
(277, 'titulo260', 'cuerpo260', 'imagenupl_535c569432569.png'),
(278, 'titulo261', 'cuerpo261', 'imagenupl_535c569432569.png'),
(279, 'titulo262', 'cuerpo262', 'imagenupl_535c569432569.png'),
(280, 'titulo263', 'cuerpo263', 'imagenupl_535c569432569.png'),
(281, 'titulo264', 'cuerpo264', 'imagenupl_535c569432569.png'),
(282, 'titulo265', 'cuerpo265', 'imagenupl_535c569432569.png'),
(283, 'titulo266', 'cuerpo266', 'imagenupl_535c569432569.png'),
(284, 'titulo267', 'cuerpo267', 'imagenupl_535c569432569.png'),
(285, 'titulo268', 'cuerpo268', 'imagenupl_535c569432569.png'),
(286, 'titulo269', 'cuerpo269', 'imagenupl_535c569432569.png'),
(287, 'titulo270', 'cuerpo270', 'imagenupl_535c569432569.png'),
(288, 'titulo271', 'cuerpo271', 'imagenupl_535c569432569.png'),
(289, 'titulo272', 'cuerpo272', 'imagenupl_535c569432569.png'),
(290, 'titulo273', 'cuerpo273', 'imagenupl_535c569432569.png'),
(291, 'titulo274', 'cuerpo274', 'imagenupl_535c569432569.png'),
(292, 'titulo275', 'cuerpo275', 'imagenupl_535c569432569.png'),
(293, 'titulo276', 'cuerpo276', 'imagenupl_535c569432569.png'),
(294, 'titulo277', 'cuerpo277', 'imagenupl_535c569432569.png'),
(295, 'titulo278', 'cuerpo278', 'imagenupl_535c569432569.png'),
(296, 'titulo279', 'cuerpo279', 'imagenupl_535c569432569.png'),
(297, 'titulo280', 'cuerpo280', 'imagenupl_535c569432569.png'),
(298, 'titulo281', 'cuerpo281', 'imagenupl_535c569432569.png'),
(299, 'titulo282', 'cuerpo282', 'imagenupl_535c569432569.png'),
(300, 'titulo283', 'cuerpo283', 'imagenupl_535c569432569.png'),
(301, 'titulo284', 'cuerpo284', 'imagenupl_535c569432569.png'),
(302, 'titulo285', 'cuerpo285', 'imagenupl_535c569432569.png'),
(303, 'titulo286', 'cuerpo286', 'imagenupl_535c569432569.png'),
(304, 'titulo287', 'cuerpo287', 'imagenupl_535c569432569.png'),
(305, 'titulo288', 'cuerpo288', 'imagenupl_535c569432569.png'),
(306, 'titulo289', 'cuerpo289', 'imagenupl_535c569432569.png'),
(307, 'titulo290', 'cuerpo290', 'imagenupl_535c569432569.png'),
(308, 'titulo291', 'cuerpo291', 'imagenupl_535c569432569.png'),
(309, 'titulo292', 'cuerpo292', 'imagenupl_535c569432569.png'),
(310, 'titulo293', 'cuerpo293', 'imagenupl_535c569432569.png'),
(311, 'titulo294', 'cuerpo294', 'imagenupl_535c569432569.png'),
(312, 'titulo295', 'cuerpo295', 'imagenupl_535c569432569.png'),
(313, 'titulo296', 'cuerpo296', 'imagenupl_535c569432569.png'),
(314, 'titulo297', 'cuerpo297', 'imagenupl_535c569432569.png'),
(315, 'titulo298', 'cuerpo298', 'imagenupl_535c569432569.png'),
(316, 'titulo299', 'cuerpo299', 'imagenupl_535c569432569.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE IF NOT EXISTS `prueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_role`, `role`) VALUES
(1, 'Administrador'),
(2, 'Gestor'),
(3, 'Editor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL,
  `codigo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `pass`, `email`, `role`, `estado`, `fecha`, `codigo`) VALUES
(1, 'administrador', 'admin', '0cc3b1041fdbc83413c58642107c6bdc15dcbb26', 'admin@admin.com', 1, 1, '0000-00-00 00:00:00', 0),
(2, 'cristian', 'cristian', '0cc3b1041fdbc83413c58642107c6bdc15dcbb26', 'c@c.com', 2, 0, '2014-04-24 16:09:05', 2312990396);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
