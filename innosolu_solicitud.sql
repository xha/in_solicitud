-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-06-2018 a las 00:56:56
-- Versión del servidor: 5.6.22-71.0-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `innosolu_solicitud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_accion`
--

CREATE TABLE `is_accion` (
  `id_accion` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `activo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_accion`
--

INSERT INTO `is_accion` (`id_accion`, `descripcion`, `activo`) VALUES
(1, 'site-activar', b'1'),
(2, 'site-reporte', b'1'),
(3, 'facturacion-index', b'1'),
(4, 'facturacion-view', b'1'),
(5, 'facturacion-create', b'1'),
(6, 'facturacion-update', b'1'),
(7, 'facturacion-imprimir', b'1'),
(8, 'servicio-index', b'1'),
(9, 'servicio-view', b'1'),
(10, 'servicio-update', b'1'),
(11, 'servicio-imprimir', b'1'),
(12, 'servicio-create', b'1'),
(13, 'site-imprimir-hoja', b'1'),
(14, 'solicitud-create', b'1'),
(15, 'solicitud-view', b'1'),
(16, 'solicitud-imprimir', b'1'),
(17, 'solicitud-update', b'1'),
(18, 'site-buscar-servicios', b'1'),
(19, 'cliente-create', b'1'),
(20, 'cliente-view', b'1'),
(21, 'cliente-update', b'1'),
(22, 'cliente-imprimir', b'1'),
(23, 'tipo-servicio-create', b'1'),
(24, 'tipo-servicio-view', b'1'),
(25, 'tipo-servicio-update', b'1'),
(26, 'tipo-servicio-imprimir', b'1'),
(27, 'sucursal-create', b'1'),
(28, 'sucursal-view', b'1'),
(29, 'sucursal-update', b'1'),
(30, 'sucursal-imprimir', b'1'),
(31, 'departamento-create', b'1'),
(32, 'departamento-view', b'1'),
(33, 'departamento-update', b'1'),
(34, 'departamento-imprimir', b'1'),
(35, 'rol-create', b'1'),
(36, 'rol-view', b'1'),
(37, 'rol-update', b'1'),
(38, 'rol-imprimir', b'1'),
(39, 'accion-create', b'1'),
(40, 'accion-view', b'1'),
(41, 'accion-update', b'1'),
(42, 'accion-imprimir', b'1'),
(43, 'rol-accion-create', b'1'),
(44, 'rol-accion-view', b'1'),
(45, 'rol-accion-update', b'1'),
(46, 'rol-accion-imprimir', b'1'),
(47, 'cliente-index', b'1'),
(48, 'tipo-servicio-index', b'1'),
(49, 'departamento-index', b'1'),
(50, 'rol-index', b'1'),
(51, 'accion-index', b'1'),
(52, 'rol-accion-index', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_cliente`
--

CREATE TABLE `is_cliente` (
  `id_cliente` int(11) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `letra_rif` varchar(1) NOT NULL DEFAULT 'V',
  `rif` decimal(10,0) NOT NULL,
  `representante` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `porcentaje` decimal(5,2) DEFAULT '0.00',
  `costo_hora` decimal(10,2) DEFAULT '0.00',
  `horas` decimal(4,0) NOT NULL DEFAULT '0',
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `id_costo` int(11) DEFAULT '0',
  `id_porcentaje` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_cliente`
--

INSERT INTO `is_cliente` (`id_cliente`, `razon_social`, `letra_rif`, `rif`, `representante`, `direccion`, `telefono`, `correo`, `porcentaje`, `costo_hora`, `horas`, `activo`, `id_costo`, `id_porcentaje`) VALUES
(0, 'SIN ASIGNAR', 'V', '12345', NULL, NULL, NULL, NULL, '0.00', '0.00', '0', b'1', 0, 0),
(1, 'OFFICE PAPER, ARTICULOS DE OFICINA, C.A.', 'J', '29954813', '', '', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(2, 'GREY ADUANA', 'J', '3704580', 'Vicente Martinez', 'Sorocaima, Edif. San Vicente, Piso 2 Maiquetia, Estado Vargas', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(3, 'A.T.M. AGENTES ADUANALES, C.A', 'J', '301730097', 'Wilheml Chacin', 'Sorocaima, Edif San Vicente, Piso 2 Maiquetia, Estado Vargas', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(4, 'OCAMAR', 'G', '200004535', '', 'Final Calle Los Ba?os, Servicio Autonomo de la Armada, Antigua Escuela Naval', '', '', '25.00', '0.00', '0', b'1', 0, 0),
(5, 'INTER WORLD IWSC AGENTES ADUANALES, C.A.', 'J', '300368496', '', 'Calle Los Ba?os, Edif.Inversiones Lourde Ofic. 2-15 y 2-16, Maiquetia, Vargas', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(6, 'SERVIMAR 2000, C.A.', 'J', '310425060', '', 'C.C. Litoral, Piso 4, Oficina D, Maiquet Estado Vargas', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(7, 'REPUESTOS SAN MIGUEL', 'J', '624054', '', 'Ppal de Pariata, Maiquetia, Edo. Vargas ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(8, 'TRANSPORTE S.L.S, C.A.', 'J', '307458631', '', '3ra. Calle Del Cementerio con 3ra transv Casa Nro.12-19, Sect.Pariata, Maiquetia', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(9, 'INVERSIONES ADUANERAS PERMAR, C.A.', 'J', '3337129', '', 'Urbanizacion Miramar, Calle Miramar Edif. Aerocav, Piso 2', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(10, 'RESTAURANT. CABO KENNEDY', 'J', '2565845', '', 'PPAL DEL CARIBE, EDO VARGAS ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(11, 'CORPORACION PG, C.A', 'J', '3215252', 'ZULAY RAMIREZ', 'PTO DEL LITORAL CENTRAL, ALMACEN 17 VARGAS 2A, MAIQUETIA, EDO.VARGAS', '', '', '25.00', '0.00', '0', b'1', 0, 0),
(12, 'PG AGENCIAMIENTO Y ESTIBA,C.A', 'J', '302473985', 'ZULAY RAMIREZ', 'Av. SOUBLETTE, EDIF. DEVESA, PISO 4 OFIC. 4-A, MAIQUETIA EDO. VARGAS.', '', '', '25.00', '0.00', '0', b'1', 0, 0),
(13, 'LANCHAJES DE VENEZUELA,C.A', 'J', '306146040', '', 'CATIA LA MAR, WEEK END ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(14, 'INTER WORLD SYSTEM CARGO C.A.', 'J', '307133490', 'Jos? Manuel Blanco', 'Av.paseo los andes,CC las Colinas, Ofic3 Urb. Las Minas, San Antonio, Edo.Miranda', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(15, 'MATERIALES LA LUCHA, C.A.', 'J', '100950', '', 'Av. Principal frente al Barrio La Lucha Galp?n Nro S/N Sector Barrio La Lucha', '0212-351.56.56', 'materialeslalucha@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(16, 'DIST. PERFUMES SENDEROS, C.A.', 'J', '300035425', 'SRA. WENDYS FERNANDEZ SANTOS', 'Terminal Nacional del Aeropuerto, Fte. Pto. 10, Catia la Mar, Edo. Vargas.', '', '', '10.00', '0.00', '0', b'1', 0, 0),
(17, 'DISTRIBUIDORA RODATLANTICA, C.A', 'J', '305361029', '', 'CALLE 9 CO C/3. URB. ATLANTIDA. CATIA LA MAR EDO. VARGAS.', '0212-3522614', '', '0.00', '0.00', '0', b'1', 0, 0),
(18, 'DISTRIBUIDORA DECOPINTURA, C.A', 'J', '315994399', '', 'AV.13 DE LA ATLANTIDA,CENTRO PEMYSA,LO- CAL PB-2, CATIA LA MAR, EDO. VARGAS.', '0212-3521824/89', '', '0.00', '0.00', '0', b'1', 0, 0),
(19, 'BRUNECSA AGENCIA ADUANALES', 'J', '3488585', '', 'CENTRO EMPRESARIAL PARIATA, PISO 2 OFICINA 5-B, PARIATA, EDO. VARGAS', '0212-3317020', '', '0.00', '0.00', '0', b'1', 0, 0),
(20, 'ADUANERA PEFECA S.A.', 'J', '65059214', 'GUSTAVO MEDINA', 'Centro Profesional Pariata, P-3, Ofic 3B Pariata, Edo. Vargas', '0212-3313029', '', '0.00', '0.00', '0', b'1', 0, 0),
(21, 'CENTRO DE SOLUC. Y SERV. LITOWASH, C.A.', 'J', '309981242', 'Srta. Fatima - Sr. Noe', 'Centro Comercial Litoral, MAiquetia Edo. Vargas', '0414-3075915 /', '', '0.00', '0.00', '0', b'1', 0, 0),
(22, 'AGENCIA MARITIMA DE REPRESENTACIONES,C.A', 'J', '70060840', 'Sr. Rafael Castillo', 'Calle 77 (Av.5 de Julio) N? 3E-45, Edif Geminis, Piso 12, Sect. Valles Frios', '0212-3551593', '', '20.00', '0.00', '0', b'1', 0, 0),
(23, 'FERREACRILICOS LITORAL, C.A.', 'J', '315638312', 'EDUARDO ACU?A', 'CALLE REAL DE PARIATA, C.C. GARAJONAY LOCALES 3.4.5 Y 6, MAIQUETIA, EDO.VARGAS', '0212-331.29.68', 'acunaeduardo@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(24, 'INVERSIONES ANGELITOS CENTER, C.A', 'J', '316654354', 'MIGUEL RONDON', 'JEFATURA A CRISTO EDIFICIO AHMAR.P.B LOCAL COMERCIAL. MAIQUETIA EDO.VARGAS', '0212-3314445 04', 'novedadesangelito@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(25, 'NOVEDADES ANGELITO MRG C.A.', 'J', '307292644', 'MIGUEL RONDON', 'IGLESIA A CRISTO, EDF LA FONTE, LOCAL2, MAIQUETIA EDO. VARGAS', '02123314445', '', '0.00', '0.00', '0', b'1', 0, 0),
(26, 'TRANSPORTE Y MAQUINARIAS TEMMA, C.A.', 'J', '3018791', '', 'AV. SOUBLETTE, ALMACEN N?A3-01 SECTOR ALMACENES VARGAS PTO. DE LA GUAIRA.', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(27, 'INVERSIONES ANGELITO STORE, C.A.', 'J', '310560978', '', 'MAIQUETIA EDO. VARGAS ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(28, 'INVERSIONES H.C LO NUESTRO, C.A', 'J', '315153742', 'INGRID JAIMES', 'JEFATURA A CRISTO- EDIF. SANTA CRUZ PISO 01-OFIC. No.5', '0416.6089203', '', '0.00', '0.00', '0', b'1', 0, 0),
(29, 'INVERSIONES ANGELITO FASHION, C.A.', 'J', '314222180', '', 'MAIQUETIA EDO. VARGAS ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(30, 'JARDIN Y FLORISTERIA MAGALY FLOWER, C.A', 'J', '293846005', 'SRA. MAGALY', 'CALLE PRINCIPAL,EDIF. VILA, PISO PB, LOC AL 1, MAIQUETIA. EDO. VARGAS.', '0212.3313079/04', '', '0.00', '0.00', '0', b'1', 0, 0),
(31, 'INVERSIONES ANGELITO SPORT, C.A.', 'J', '309685430', '', 'MAIQUETIA EDO. VARGAS ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(32, 'ECHEZURRIA, FERREIRA & ASOCIADOS C.A.', 'J', '296512280', 'DANIEL GUEVARA', 'AV. LA ATLANTIDA, CALLE 11, CON AV. TACAGUA PISO 1, OFIC. 1, CATIA LA MAR', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(33, 'CENTRO INTEGRAL PRESTIGIO', 'J', '312234202', 'Lila', 'Centro Comercial Costa del Sol, Nivel 1, Local 31, El Caribe, Estado Vargas', '02123776806 - 0', '', '0.00', '0.00', '0', b'1', 0, 0),
(34, 'BOLIVARIANA DE PUERTOS (BOLIPUERTOS), S.A.', 'J', '297599070', '', 'AV. FRANCISCO DE MIRANDA EDIF TORRE MINFRA PISO 12. OFC S/N.CHACAO. CARACAS', '', '', '25.00', '0.00', '0', b'1', 0, 0),
(35, 'INNOVA SOLUCIONES Y SISTEMAS C.A.', 'J', '294154476', 'MARIA FUENTES', 'Urb. Sorocaima, Edif. San Vicente, piso 1, Ofic. 1-B Maiquet?a, Edo. Vargas.', '0212-8808313', 'innovasoluciones@cantv.net', '0.00', '0.00', '0', b'1', 0, 0),
(36, 'AGENCIA DE FESTEJOS DEYBER, C.A.', 'J', '123456789', 'EDWIN', 'CCS ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(37, 'CONDOMINIO CENTRO COMERCIAL LITORAL', 'J', '303767257', '', 'AV. SOUBLETE , CENTRO COMERCIAL LITORAL, NIVEL2, LOCAL N?.47 MAIQUETIA, EDO. VARGAS ', '0212-3315672', 'CONDOMINIO_CCL@HOTMAIL.COM', '0.00', '0.00', '0', b'1', 0, 0),
(38, 'SOIMCA SOLUCIONES IMPRESAS, C.A.', 'J', '311781846', 'CARLOS DIAZ', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(39, 'PEFECA S.A.', 'J', '3241598', 'GUSTAVO R. MEDINA', 'CALLE REAL DE PARIATA CENTRO PROFECIONAL PARIATA ', '02123313029', 'GUSTAVORMEDINAM@CANTV.NET', '0.00', '0.00', '0', b'1', 0, 0),
(40, 'MULTISERVICIOS MAGENTA, C.A', 'J', '294503713', 'LILIA MARCANO', '3ª CALLE DEL CEMENTERIO CON 3ª TRANSVERSAL, PARIATA, MAIQUETIA. EDO. VARGAS ', '0212-3312671', '', '0.00', '0.00', '0', b'1', 0, 0),
(41, 'ARLIGO AGENTES ADUANALES, C.A', 'J', '1465766', 'JULIETA GONZALEZ', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(42, 'DISTRIBUIDORA SENDEROSY PERFUMES, C.A', 'J', '300035425', '', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(43, 'CORPORACION VENEZOLANA DE NAVEGACION, C.A', 'G', '200101644', 'NATACHA RAMOS', 'Av. Francisco de Miranda, Edif MINFRA, Piso 12, Ofic S/N, Sector Chacao ', '(0426) 543.1624', ': venavegadm@gmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(44, 'FERRETERIA Y PINTURAS MILLENNIUM C.A.', 'J', '306499784', '', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(45, 'MINISTERIO DEL PODER POPULAR PARA TRANSPORTE ACUATIO Y AEREO', 'G', '200100060', '', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(46, 'REVISTA PTJ CUERPO ESPECIAL II, C.A', 'J', '307717084', 'HENRY GONZALEZ', 'AV. UNIVERSIDAD ENTRE ESQUINA A TRASPOSO A SOCIEDAD, EDIF REYES PI??AL PISO 2, OFICINA 303. CARACAS', '0212-5422734', 'revptj@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(47, 'ESTACIONAMIENTO MULTISERVICIOS LITORAL CENTRAL, C.A', 'J', '310293082', 'LEON DIAZ', 'FRENTE CALLE DENOMINADA  DE RAMOS, SOROCAIMA MAIQUETIA. EDO. VARGAS ', '0212-3312016', 'leondiaz@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(48, 'SUMINISTROS, SERVICIOS Y MANTENIMIENTOS RODAMA, C.A.', 'J', '301062051', 'FELIX AMADOR', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(49, 'COMERCIAL COSTA AVILA , C.A', 'J', '314030647', 'LINO FERNANDEZ', 'AV. SOUBLETTE SECTOR EL CARDONAL  CASA S/N VARGAS ', '0212-3313724', '', '0.00', '0.00', '0', b'1', 0, 0),
(50, 'COMERCIALIZADORA JULVICAR 2012, C.A', 'J', '401076025', 'JULIO CESAR VILLANUEVA', ' ', '04142457736', 'JULVICAR2012@GMAIL.COM', '0.00', '0.00', '0', b'1', 0, 0),
(51, 'REPRESENTACIONES MOVIGLED, C.A', 'J', '400211590', 'LISBETH VILLAREAL', 'URB. PAEZ CALLE CENTRAL VEREDA 2 CASA 22-02 CATIA LA MAR ESTADO VARGAS', '0212-3510476', 'representacionesmovigled@gmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(52, 'MULTIPLEX IMPORTS,C.A', 'J', '400128447', 'LUZMAR VALERO', ' ', '0212-8371973', 'multipleximports@gmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(53, 'INVERSIONES FERTORCA,C.A', 'J', '403103526', 'ALFONSO PEREZ', ' ', '02125413585', 'inversionesfertorca@gmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(54, 'PLAYA GRANDE YACHTING CLUB, A.C', 'J', '297142', 'ESMERALDA DI PALMA', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(55, 'EXTINTORES INDUSTRIALES EL VIGIA, C.A', 'J', '301294718', 'FRANCISCO MATA', ' ', '0212-332.0114', 'extintoreselvigia@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(56, 'FLOTAMAR, C.A', 'J', '1243003', 'YENNI HERNANDEZ', ' ', '0212-3525875', 'flotamar.admon.yh@hotmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(57, 'MULTISERVICIOS VEMOLAN, C.A', 'J', '294338747', 'WILLIAMS', 'AV. SOUBLETTE EDIF. CENTRO LA GUAIRA, PISO PB LOCAL E. SECTOR EL CARDONAL ', '0212-8811033', '', '0.00', '0.00', '0', b'1', 0, 0),
(58, 'COMUNICACIONES SATERK 2006, C.A', 'J', '316498697', 'SALYN TERKMANI', ' ', '02123527467', '', '0.00', '0.00', '0', b'1', 0, 0),
(59, 'REPRESENTACIONES 1073-I, C.A', 'J', '304448511', 'LUISA RODRIGUEZ', ' ', '0212-3521073', 'repuestos1073.luisa@gmail.com', '0.00', '0.00', '0', b'1', 0, 0),
(60, 'FUNDACI??N DE DESARROLLO NACIONAL AEROPORTUARIO Y PORTUARIO (FUNDENAP)', 'G', '200105844', 'LIC KATTY RIOS', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(61, 'J J AGENTE ADUANA, C.A', 'J', '298397306', 'ADRIAN PIñ??ERO', ' ', '0212-3517420', 'SVALBUENA@JJADUANAS.COM', '0.00', '0.00', '0', b'1', 0, 0),
(62, 'INSTITUTO DE PREVISION SOCIAL DE LAS FUERZAS ARMADAS IPSFA', 'G', '200036923', '', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(63, 'AUTOREPUESTO PLANETA, C.A', 'J', '299091669', 'LUZMAR VALERO', ' ', '', '', '10.00', '0.00', '0', b'1', 0, 0),
(64, 'RAMIREZ PRATO Y ASOCIADOS', 'J', '309245812', 'JOSE BORGUES', 'AV. PPAL. MACARACUAY EDIF. MULTICENTRO MACARACUAY P10 OFIC.3-5', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(65, 'CONSTRUVARCA,C.A', 'G', '200121459', 'OMAR ESCALANTE', ' ', '02123512747', '', '0.00', '0.00', '0', b'1', 0, 0),
(66, 'INVERSIONES WENA 2011, C.A.', 'J', '314032267', 'ALEJANDRA RONDON', 'AV ERNESTO BLOHN CC CIUDAD TAMANACO NIVEL C-1 LOCAL 47-K-02 URB CHACAO CARACAS (CHACAO) MIRANDA', '02129599636', '', '0.00', '0.00', '0', b'1', 0, 0),
(67, 'TORONJA EL RECREO, C.A.', 'J', '405438711', 'ALEJANDRA RONDON', 'AV CASANOVA CON CALLE EL RECREO, CC EL RECREO NIVEL PB, LOCAL LC2-C4B, URB EL RECREO, CARACAS', '0212-7611007', '', '0.00', '0.00', '0', b'1', 0, 0),
(68, 'ABOLENGO VENEZOLANA, C.A.', 'J', '401779883', 'ALEJANDRA RONDON', 'AV FCO DE MIRANDA CC LIDER NIVEL CALIFORNIA OF CA-63 SECTOR BOLEITA - MIRANDA', '02122360321', '', '0.00', '0.00', '0', b'1', 0, 0),
(69, 'ARROYO LIDER, C.A.', 'J', '294607152', '', 'AV FRANCISCO DE MIRANDA CC LIDER, NIVEL FERIA LOCAL F-21 URB BOLEITA SUR CARACAS', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(70, 'CORPORACION NAT NOH,C.A.', 'J', '406116246', '', 'AV FRACISCO DE MIRANDA CC LIDER, NIVEL GALERIA LOCAL G-13 SECTOR BOLEITA CARACAS', '0212-2360132', '', '0.00', '0.00', '0', b'1', 0, 0),
(71, 'GALEA JOYAS, C.A.', 'J', '309616985', '', 'CENTRO COMERCIAL CIUDAD TAMANACO, SEGUNDA ETAPA NIVEL PB LOCAL 43-K-01-C, CHUAO', '0212-9591593', '', '0.00', '0.00', '0', b'1', 0, 0),
(72, 'CHRONO STORE SAMBIL, C.A.', 'J', '299527149', '', 'AV FRANCISCO DE MIRANDA CC SAMBIL NIVEL LIBERTADOR LOCAL 06 URB CHACAO', '0212-2633172', '', '0.00', '0.00', '0', b'1', 0, 0),
(73, 'INVERSIONES CETERA, C.A.', 'J', '401733522', '', 'AV CASANOVA, CALLE EL RECREO CC EL RECREO NIVEL PB LOCAL LC2-C4C SECTOR EL RECREO CARCAS', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(74, 'CHRONO GALERIAS, C.A.', 'J', '316039811', '', 'AV EL PAJUI CENTRO COMERCIAL GALERIAS LOS NARANJOS NIVEL FERIA LOCAL MT-22 A Y B, LOS NARANJOS EL CAFETAL', '0212-9856411', '', '0.00', '0.00', '0', b'1', 0, 0),
(75, 'INVERSIONES ALL YOU CAN PIZZA EL HATILLO, C.A.', 'J', '406984817', '', 'CALLE SUCRE, CASA EL CRONICON NRO 59 SECTOR EL HATILLO EL HATILLO CARACAS', '0212-2571144', '', '0.00', '0.00', '0', b'1', 0, 0),
(76, 'INVERSIONES MIS ANGELES 03, C.A', 'J', '315435535', 'INES', ' ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(77, 'FUNDACION VARGAS ALIMENTOS', 'G', '200121041', '', 'AV PRINCIPAL LOCAL ALMACEN NRO A-2-3 ZONA PUERTO DEL LITORAL CENTRAL MAIQUETIA VARGAS', '0212-3318218', '', '0.00', '0.00', '0', b'1', 0, 0),
(78, 'ARROYO EXPRESS, C,A,', 'J', '312305983', '', 'UNIDAD CATOLICA ANDRES BELLO, CENTRO DE SERVICIO ', '', '', '0.00', '0.00', '0', b'1', 0, 0),
(79, 'INVERSORA IPSFA C.A.', 'J', '303436005', 'JOAO FERREIRA', ' ', '02126937460', '', '0.00', '0.00', '0', b'1', 0, 0),
(80, 'INVERSIONES SANCHEZ&LOPEZ,C.A', 'J', '294154476', 'OSWALDO SANCHEZ', '', '', '', '0.00', '0.00', '0', b'1', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_costo`
--

CREATE TABLE `is_costo` (
  `id_costo` int(11) NOT NULL,
  `costo` decimal(10,2) DEFAULT '0.00',
  `activo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_costo`
--

INSERT INTO `is_costo` (`id_costo`, `costo`, `activo`) VALUES
(0, '0.00', b'1'),
(1, '15000.00', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_departamento`
--

CREATE TABLE `is_departamento` (
  `id_departamento` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_departamento`
--

INSERT INTO `is_departamento` (`id_departamento`, `descripcion`, `activo`) VALUES
(1, 'Presupuesto', b'1'),
(2, 'Compras', b'1'),
(3, 'Tesoreria', b'1'),
(4, 'Gerencia', b'1'),
(5, 'Contabilidad', b'1'),
(6, 'RRHH', b'1'),
(7, 'Ingresos', b'1'),
(8, 'Sistema', b'1'),
(9, 'Otros', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_facturacion`
--

CREATE TABLE `is_facturacion` (
  `id_facturacion` int(11) NOT NULL,
  `observacion` text,
  `porcentaje` decimal(5,2) DEFAULT '0.00',
  `costo_hora` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  `total_horas` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pagado` bit(1) NOT NULL DEFAULT b'0',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_facturacion`
--

INSERT INTO `is_facturacion` (`id_facturacion`, `observacion`, `porcentaje`, `costo_hora`, `total`, `total_horas`, `fecha_registro`, `pagado`, `activo`) VALUES
(1, '', '10.00', '40000.00', '8000.00', '2.00', '2017-07-17 19:12:36', b'0', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_facturacion_servicio`
--

CREATE TABLE `is_facturacion_servicio` (
  `id_servicio` int(11) NOT NULL,
  `id_facturacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_facturacion_servicio`
--

INSERT INTO `is_facturacion_servicio` (`id_servicio`, `id_facturacion`) VALUES
(1, 1),
(19, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_permisos`
--

CREATE TABLE `is_permisos` (
  `uid` int(10) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_porcentaje`
--

CREATE TABLE `is_porcentaje` (
  `id_porcentaje` int(11) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `activo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_porcentaje`
--

INSERT INTO `is_porcentaje` (`id_porcentaje`, `porcentaje`, `activo`) VALUES
(0, '0.00', b'1'),
(1, '10.00', b'1'),
(2, '20.00', b'1'),
(3, '30.00', b'1'),
(4, '40.00', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_pregunta`
--

CREATE TABLE `is_pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_pregunta`
--

INSERT INTO `is_pregunta` (`id_pregunta`, `descripcion`, `activo`) VALUES
(1, 'Lugar de Nacimiento', b'1'),
(2, 'Nombre de la madre', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_rol`
--

CREATE TABLE `is_rol` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_rol`
--

INSERT INTO `is_rol` (`id_rol`, `descripcion`, `activo`) VALUES
(0, 'En Espera', b'1'),
(1, 'Usuario', b'1'),
(2, 'Asesor', b'1'),
(3, 'Administrador', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_rol_accion`
--

CREATE TABLE `is_rol_accion` (
  `id_accion` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_rol_accion`
--

INSERT INTO `is_rol_accion` (`id_accion`, `id_rol`) VALUES
(2, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(47, 2),
(48, 2),
(49, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_servicio`
--

CREATE TABLE `is_servicio` (
  `id_servicio` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` decimal(4,0) NOT NULL,
  `hora_salida` decimal(4,0) NOT NULL,
  `total_horas` int(11) NOT NULL DEFAULT '0',
  `id_solicitud` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_servicio`
--

INSERT INTO `is_servicio` (`id_servicio`, `descripcion`, `fecha`, `hora_entrada`, `hora_salida`, `total_horas`, `id_solicitud`, `activo`, `id_usuario`) VALUES
(1, 'Se elimino factura 001674 y las retenciones 20150500000177 y islr 00000298. Se movieron los correlativos para que al realizarla nuevamente quedaran con el mismo que se le habia puesto anteriormente. Se realizo el pago y las retenciones pertinentes', '2017-05-17', '1150', '1230', 1, 1, b'0', 3),
(2, '- Instalación del Modulo de Nomina en una estación de trabajo de Facturación para agilizar el proceso de transcripción de la Nomina\r\n- Creación del usuario e Inducción a Carela Maria Laura Velázquez para la carga de los presupuestos para la facturación de la serie “B” de Comercialización\r\n- Instalación del Sistema Administrativo en la Laptop del Coronel Frenlix Corrales Director Gerente de Inversora IPSFA\r\n', '2017-05-18', '830', '1700', 9, 2, b'0', 4),
(3, '- Cierre del mes de Enero del Sistema Saint Enterprise Administrativo\r\n- Inicio de la carga de los presupuestos del mes de Febrero\r\n- Inducción a Yohemi Lopez para la carga de los presupuestos para la facturación de ABES\r\n- Se completo la carga de todos los presupuesto en del mes de febrero en la unidad de negocios de ABES y Comercialización\r\n', '2017-05-19', '800', '1500', 7, 2, b'0', 4),
(4, 'CUMPLIENDO CON LA SOLICITUD DE LEONOR PADILLA DE COBRANZA, SE ACTIVO NC PARA LA EMISION DE DOCUMENTO PARA EL CLIENTE 1004 POR CONCEPTO DE REVERSO DE PAGO 900MIL $ CASO PDVSA 2015. ES A TITULO DEMOSTRATIVO PARA EL CLIENTE, ESTAS TRANSACCIONES SERÁN ELIMINADAS UNA VEZ CERRADO EL CASO.\r\nSE SOLICITA POR PARTE DE COBRANZA REVERSAR LA 129 FACTURAS CANCELADAS CON ESTE PAGO EN DIC2015, PARA LO CUAL SE SOLICITA LA BASE DE DATOS DE PUERTO LA CRUZ. IGMER BELLO ACUERDA ENVIAR LA DATA EL SÁBADO 20/05/2017 UNAS VEZ TERMINADO EL PROCESO DE NC.', '2017-05-19', '1000', '1130', 2, 3, b'1', 5),
(5, 'SE REALIZA QUERY PARA REVERSAR LAS FACTURAS CANCELADAS  BAJO EL NRO DE RECIBO DE CAJA 0000184 al 0000192 EMITIDOS EL  31/12/2015\r\nVER CORREO ANEXO DEL 22/05/2017', '2017-05-22', '1000', '1700', 7, 3, b'1', 5),
(6, 'Instalación y configuración con los parámetros anteriores de un nuevo router para solucionar problemas de conexión presentadas con el anterior', '2017-05-23', '1400', '1500', 1, 4, b'1', 4),
(7, 'SE AJUSTO EL CORRELATIVO DEL SISTEMA SAINT AL MISMO NUMERO DEL DE LA IMPRESORA FISCAL TANTO EN FACTURA COMO DEVOLUCIONES. LAS DEVOLUCIONES FUERON CORREGIDAS EN SU TOTALIDAD. PERO LAS FACTURAS AUN FALTA. \r\nNOTA: SE SUGIERE PARAR UN DIA PARA PODER RELIZAR EL SOPORTE CORRESPONDIENTE YA QUE HAY UNA SOLA PC PARA REALIZAR EL TRABAJO MAS EL TRABAJO DE FACTURACION.', '2017-05-23', '1030', '1620', 6, 5, b'1', 3),
(8, 'Instalacion y configuracion de los cambios realizados en los modulos de modificar orden y presupuesto.\r\nAdiestramiento al personal de presupuesto (bosquejo de tablas basicas y procesos de asignacion, modificacion e imputacion).\r\n\r\nPD: queda pendiente que al terminar de procesar las ordenes de compra, llevarla a sus respectivas fechas\r\n', '2017-05-24', '900', '1200', 3, 2, b'1', 1),
(9, 'Presentaba varias transacciones fallidas con las conciliaciones anteriores, se pudo detectar que el disco donde esta el sql ser quedo sin espacio, esto origina que no se puedan guardar bien las transacciones. Se libero espacio y se solvento los errores de las transacciones bancarias para conciliacion. Se concilio el mes de diciembre sin problemas', '2017-05-25', '1030', '1200', 2, 6, b'1', 1),
(10, 'Se habilito el mes de enero para poder conciliar en cuentas por pagar.\r\nSe elimino 1 de 2 recibos que fueron mal cargados en cuentas por cobrar, Glpi 21311', '2017-05-26', '1045', '1130', 1, 7, b'1', 1),
(11, 'DHCP del servidor estaba deshabilitado, se habilito y comprobo las conexiones de los equipos', '2017-05-26', '1200', '1350', 2, 8, b'1', 1),
(12, 'SE TERMINO DE CAMBIAR CORRELATIVO (AJUSTE DE NUMEROD =NUMEROF) DONDE HUBO ALGUNAS INCONSISTENCIAS PS HAN SACADO FACTURAS POR EL TIPO DE VENTA (PUNTO DE VENTA]) EN VEZ DE VENTA NORMAL.', '2017-05-26', '800', '1700', 9, 5, b'1', 3),
(13, 'SE ELIMINO RETENCIONES IVA 2017050000295  E ISLR 180 POR NO TENER CARGADO EL MONTO EXENTO DE LA FACTURA ORIGINAL. SE CORRIERON LOS CORRELATIVOS Y SE VOLVIO A GENERAR EL PAGO Y RETENCIONES.', '2017-06-01', '1150', '1230', 1, 9, b'1', 3),
(14, 'Se creo un script donde contiene las Estaciones de Trabajo, Los usuarios, el menu y la Licencia Saint.\r\nSe respaldaron y actualizaron las bases de datos de Almacen, Puerto la Cruz, Puerto Cabello y Maracaibo', '2017-06-02', '1100', '1430', 4, 10, b'1', 1),
(15, 'SE REVISO REPORTE DE TRANSACCIONES DE VENTAS DEL MES DE MAYO, YA QUE LOS USUARIOS ENCONTRABAN DIFERENCIA EN EL REPORTE DEL 01/05/2017 AL 30/05/2017 Y EL 01/05/2017 AL 23/05/2017.LA DIFERENCIA SE ENCONTRABA EN QUE LA NOTA DE CRÉDITO No. 0000096 LA CUAL FUE REALIZADA EL DIA 30/05/2017.\r\nALLÍ ERA QUE SE ENCONTRABA LA DIFERENCIA.\r\n\r\nNOTA: PERSONAL PRESENTE ING. RAFAEL HERNANDEZ', '2017-06-05', '1320', '1340', 1, 11, b'1', 3),
(16, 'SE COLOCO EL NUMERO DE LA FACTURA Y CONTROL MANUALMENTE EN LA BASE DE DATOS. \r\n\r\n\r\nNOTA: SE QUEDO EN REVISAR LA BD, PARA VERIFICAR LA RAZON POR LA CUAL NO SE GRABO DICHA INFORMACION AL REALIZARLA DESDE EL MODULO DE BANCO. SEGUN EL USUARIO', '2017-06-05', '1520', '1540', 1, 12, b'1', 3),
(17, 'SE COLOCO EL NUMERO DE LA FACTURA Y CONTROL MANUALMENTE EN LA BASE DE DATOS. \r\n\r\n\r\nNOTA: SE QUEDO EN REVISAR LA BD, PARA VERIFICAR LA RAZON POR LA CUAL NO SE GRABO DICHA INFORMACION AL REALIZARLA DESDE EL MODULO DE BANCO. SEGUN EL USUARIO', '2017-06-05', '1520', '1540', 1, 12, b'1', 3),
(18, 'Se ejecuto creo y se probo el job de las bases de datos de Puerto la Cruz y Almacen de forma automatica', '2017-06-06', '930', '1300', 4, 13, b'1', 1),
(19, 'Se realiza conexión remota con datos enviados por Whatsapp \r\n1.- Se reviso proceso de integración de compras, detectando que faltaba asignar cuenta contable a la aplicación de anticipos realizadas directamente en la compra. realizado el ajuste se proceso exitosamente el pre comprobante de compras de MAY2017\r\n2.- Se reviso los concepto de aporte patronales y ya aparece el concepto patronal de Banavih en las nomina \r\n\r\nVer Soportes Anexo\r\n\r\nPersonal Presente Vía Telefónica:\r\nLic. Lilibeth\r\n', '2017-06-06', '1347', '1445', 1, 14, b'0', 5),
(20, 'AJUSTE DE PORCENTAJE EN RETENCIONES DE IVA 20170600000299/297, YA QUE POR ERROR LE COLOCO EL 75% DE RETENCION EN VEZ DEL 100%', '2017-06-08', '940', '1000', 1, 16, b'1', 3),
(21, 'Se conectaron las bases de datos de Puerto La Cruz, Almacen y Maracaibo', '2017-06-08', '930', '1330', 4, 13, b'1', 1),
(22, 'Se actualizo Presupuesto con los cambios solicitados (descuentos, impuesto al lujo)\r\n\r\nPD: no se pudo proceder con los causados debido a que el personal de presupuesto se encontraba indispuesto', '2017-06-05', '900', '1100', 2, 2, b'1', 1),
(23, 'Se adiestro al personal de presupeusto para realizar causados, devoluciones y anulaciones de las solicitudes de ordenes de pago', '2017-06-07', '1030', '1200', 2, 2, b'1', 1),
(24, 'Se ajusto correlativo factura Saint de la No. 001611 a la 001618. Y se sustituyo la 001609 por 001616/ 001610 por la 001617 estas ultimas fueron realizadas el día de hoy 09/06/2017 ', '2017-06-09', '1000', '1100', 1, 17, b'1', 3),
(25, 'AJUSTE DE ANTICIPO No. 000000020 DEL CLIENTE  COD. 1197', '2017-05-09', '1500', '1525', 1, 18, b'1', 3),
(26, 'Se realizaron los jobs y los scripts respectivos para la restauracion de las distintas bases de datos en el servidor principal.\r\n\r\nSe revisaron los backups de las sucursales, cambiando la hora de las mismas en algunas ya que el personal apagaba el equipo y no realizaba la accion.\r\n\r\nPD: Pto Cabello estaba ya configurado, pero a la fecha da un error de permisologia de usuairo, mas el script fuera del Sql funciona bien', '2017-06-09', '1030', '1330', 3, 13, b'1', 1),
(27, '1) SE REALIZÓ LA CORRECCION DE LOS NUMEROS DE CONTROL REGISTRADOS EN EL SISTEMA SAINT DE LAS FACTURAS Y NOTAS DE CREDITOS EMITIDAS DESDE EL 25-05-2017. AFECTANDOSE LAS SIGUIENTES TABLAS:\r\na) SAFACT\r\nb) SAACXC\r\nc) SAOPER_01\r\nd) SBTRAN\r\ne) SBDTRN  \r\n', '2017-06-13', '1145', '1240', 1, 19, b'1', 6),
(28, 'Se configuro el agente de SQLServer en Almacen de modo automatico ya que en modo manual no ejecuta las tareas.\r\n\r\nSe valido que las bases de datos se estuviesen respaldando y ejecutando la restauracion, el cual no se realizaba desde el 9. Sin novedad al ejecutar el script\r\n\r\nPD: Se debe chequear el script de restauracion para revision de fechas y posibles mejoras', '2017-06-14', '1030', '1200', 2, 20, b'1', 1),
(29, 'Inicio de la carga de las facturas emitidas el mes de enero según libro de ventas ', '2017-06-05', '900', '1400', 5, 2, b'1', 4),
(30, 'Continuación de la carga de las facturas emitidas el mes de enero según libro de ventas ', '2017-06-06', '900', '1400', 5, 2, b'1', 4),
(31, 'Finalización de la carga de las facturas emitidas el mes de enero según libro de ventas ', '2017-06-07', '900', '1500', 6, 2, b'1', 4),
(32, '1-. ADIESTRAMIENTO EN CXC (SE LE EXPLICO A LA SRTA. MARIA OJEDA COMO CANCELAR LAS FACTURAS DE CXC CON SUS RESPECTIVOS DEPOSITOS. LAS TRANSACCIONES REALIZADA FUERON PAGOS SENCILLOS )\r\n2-.SE LE EXPLICO AL SR. CRISTIAN DE TRIBUTOS COMO CARGAR LOS MONTOS DE FACTURAS A LOS CUALES SE LES APLICO RETENCIONES DE IVA (CXC)', '2017-06-14', '900', '1200', 3, 2, b'1', 3),
(33, 'Se verifico el estado de avances de la carga de información por departamento y las asignaciones pendiente para la culminación del registro del primer trimestre del año.', '2017-06-13', '1000', '1400', 4, 2, b'1', 4),
(34, 'Se adiestro el personal de compras para el uso del Modificar Orden, Modalidad contrato, con el fin de generar las ordenes de servicio con un nuevo correlativo.\r\n\r\nSe realizaron ajustes a unas ordenes de compra que tenian fecha 20170101 con hora 00:00, el cual con este formato no es visible en presupuesto.', '2017-06-16', '900', '1000', 1, 2, b'1', 1),
(35, 'Cobranza:\r\n1-. Chequeo del estatus de la carga de información correspondiente al mes de enero \r\n     -Se terminó el registro las cobranzas correspondientes al departamento de vehículo sin novedad\r\n2-. Se adiestro al personal para crear las facturas de cuentas por cobrar de meses anteriores que fueron cobradas el mes enero\r\n\r\nRecursos Humanos:\r\n1-. Chequeo del estatus de la carga de información correspondiente al mes de enero\r\n2-. El Jefe de Personal informo que termina la carga del mes de enero el día de hoy 19-06-2017 en la tarde\r\n3.- Solicito la activación de módulo de liquidación ', '2017-06-19', '940', '1200', 3, 2, b'1', 4),
(36, 'Se actualizo el modulo de modificar orden agregando la opcion del correlativo para las ordenes de servicio.\r\n\r\nSe adiestro el personal para el uso de la nueva opcion de servicios.', '2017-06-20', '1000', '1200', 2, 2, b'1', 1),
(37, 'Se rebajo el logs de transacciones', '2017-06-21', '1000', '1040', 1, 21, b'1', 1),
(38, 'Creación de una base de datos para los registros correspondientes desde el mes de enero hasta el mes de junio con el nombre de AEINVER\r\nLimpieza de la base de datos AEINVERSORA para registros de información a partir del mes de julio 2017\r\nSolicitud de información por departamentos para la puesta en funcionamiento del sistema Saint Enterprise Administrativo el 01 de julio de 2017:\r\n\r\n-	Departamento de Vehículos, Inventario al 30 de junio de 2017 (T.F. Libia Cardenas)\r\n\r\n\r\n-	Departamento de Mi Casa Bien Equipada, Inventario al 30 de junio de 2017 (Yutziana Cortez)\r\n\r\n\r\n-	Departamento de Tesorería, saldos bancarios al 30 de junio de 2017 (Lorena Valera)\r\n\r\n\r\n\r\n', '2017-06-26', '900', '1200', 3, 2, b'1', 4),
(39, 'SE VERIFICO QUE NO HAY NINGÚN ERROR AL APLICAR LOS ANTICIPOS, EL PROBLEMA CONSISTE EN QUE AL EJECUTAR LA TRANSACCIÓN SE ESTA  OMITIENDO COLOCAR EL MONTO DEL ANTICIPO EN EL CAMPO QUE CORRESPONDE, Y ESTE SE VA COMO SI EL PAGO SE ESTUVIERA HACIENDO POR EFECTIVO. (ESTE ULTIMO SE VERIFICO POR BASE DE DATOS CON EL USUARIO Y EL PERSONAL DE INFORMÁTICA) QUEDANDO ESTOS SATISFECHO CON LO ANTES EXPUESTO.', '2017-06-26', '1000', '1300', 3, 22, b'1', 3),
(40, 'Ajuste de roles de usuario en Sucursal. A solicitud del Sr. Jonathan Pacheco. Se les dejo como permiso en el modulo administrativo solo acceso a crear clientes y todo lo referente a crear productos, cambio de precios, instancias de productos y ver los distintos reportes administrativo. Se le explico al Sr. Orlando como modificar los roles en la sede ppal.', '2017-06-27', '1300', '1340', 1, 23, b'1', 3),
(41, 'SE EXPLICO COMO REALIZAR LAS ND BANCARIAS PARA PODER REBAJAR BANCO CUANDO HAY UN CHEQUE DEVUELTO POR CONCEPTO DE COBRANZA', '2017-06-28', '1000', '1119', 2, 24, b'1', 3),
(42, 'Se instalo el Saint\r\nSe configuro los respaldos automaticos con el Mega\r\nSe creo el plan de mantenimiento de Saint y Sisalma', '2017-07-03', '930', '1400', 5, 20, b'1', 1),
(43, 'Se modifico una orden que estaba generando problemas con el correlativo', '2017-11-27', '1000', '1100', 1, 26, b'1', 1),
(44, '- SE ACTUALIZO EL SISTEMA SAINT  ADMINISTRATIVO A LA VERSION 9032 Y CONTABILIDAD A 842\r\n- SE CREO EL PLAN DE MANTENIMIENTO\r\n- SE AGREGO EL BACKUP A GOOGLE DRIVE', '2017-12-14', '1330', '1440', 2, 27, b'1', 1),
(45, 'Creación de las Bases de Datos, Instalación y configuración del Saint Enterprise Administrativo, Contabilidad y Nomina, en el servidor de trabajo suministrado por la empresa Bolivariana de Puertos.\r\nPara la configuración de las estaciones de trabajo se informó que el personal va a asistir a un acto y por este motivo se aplazó esta instalación para el día de mañana.\r\n', '2018-01-24', '1000', '1300', 3, 28, b'1', 4),
(46, 'SE PROCEDIÓ A LA INSTALACIÓN DEL SISTEMA SAINT INTERPRISE A SU VERSIÓN 9.0.3.3  EN LOS SIGUIENTES DEPARTAMENTOS: \r\n*COMPRAS: 20 PC INSTALADAS DE LAS CUALES 3 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TESORERÍA: 14 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*PRESUPUESTO: 7 PC INSTALADAS DE LAS CUALES 2  NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TRIBUTOS: 7 PC INSTALADAS Y CONECTADAS DE MANERA CORRECTA.\r\n*INGRESOS: 32 PC DE LAS CUALES 5 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*13 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE USUARIO.\r\n\r\nEL DEPARTAMENTO DE TECNOLOGÍA DE BOQUITUERTOS ACORDÓ SOLUCIONAR LOS PERMISOS DE LOS USUARIOS QUE QUEDARON PENDIENTE.\r\n', '2018-02-09', '830', '1736', 10, 31, b'1', 7),
(47, 'SE PROCEDIÓ A LA ACTUALIZACION DEL SISTEMA SAINT INTERPRISE A SU VERSIÓN 9.0.3.5 EN LOS SIGUIENTES DEPARTAMENTOS: \r\n*COMPRAS: 20 PC INSTALADAS DE LAS CUALES 3 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TESORERÍA: 14 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*PRESUPUESTO: 7 PC INSTALADAS DE LAS CUALES 2 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TRIBUTOS: 7 PC INSTALADAS Y CONECTADAS DE MANERA CORRECTA.\r\n*INGRESOS: 32 PC DE LAS CUALES 5 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*13 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE USUARIO.\r\n\r\nEL DEPARTAMENTO DE TECNOLOGÍA DE BOQUITUERTOS ACORDÓ SOLUCIONAR LOS PERMISOS DE LOS USUARIOS QUE QUEDARON PENDIENTE.', '2018-02-15', '830', '1450', 7, 31, b'1', 7),
(48, 'SE PROCEDIÓ A LA ACTUALIZACION DEL SISTEMA SAINT INTERPRISE A SU VERSIÓN 9.0.3.5 EN LOS SIGUIENTES DEPARTAMENTOS:\r\n*COMPRAS: 20 PC INSTALADAS DE LAS CUALES 3 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TESORERÍA: 14 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*PRESUPUESTO: 7 PC INSTALADAS DE LAS CUALES 2 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TRIBUTOS: 7 PC INSTALADAS Y CONECTADAS DE MANERA CORRECTA.\r\n*INGRESOS: 32 PC DE LAS CUALES 5 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*13 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE USUARIO.\r\n\r\nEL DEPARTAMENTO DE TECNOLOGÍA DE BOQUITUERTOS ACORDÓ SOLUCIONAR LOS PERMISOS DE LOS USUARIOS QUE QUEDARON PENDIENTE.', '2018-02-15', '830', '1450', 7, 31, b'1', 8),
(49, 'SE PROCEDIÓ A LA ACTUALIZACION DEL SISTEMA SAINT INTERPRISE A SU VERSIÓN 9.0.3.5 EN LOS SIGUIENTES DEPARTAMENTOS:\r\n*COMPRAS: 20 PC INSTALADAS DE LAS CUALES 3 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TESORERÍA: 14 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*PRESUPUESTO: 7 PC INSTALADAS DE LAS CUALES 2 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TRIBUTOS: 7 PC INSTALADAS Y CONECTADAS DE MANERA CORRECTA.\r\n*INGRESOS: 32 PC DE LAS CUALES 5 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*13 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE USUARIO.\r\n\r\nEL DEPARTAMENTO DE TECNOLOGÍA DE BOQUITUERTOS ACORDÓ SOLUCIONAR LOS PERMISOS DE LOS USUARIOS QUE QUEDARON PENDIENTE.', '2018-02-15', '830', '1450', 7, 31, b'1', 8),
(50, 'SE PROCEDIÓ A LA INSTALACIÓN DEL SISTEMA SAINT INTERPRISE A SU VERSIÓN 9.0.3.3 EN LOS SIGUIENTES DEPARTAMENTOS:\r\n*COMPRAS: 20 PC INSTALADAS DE LAS CUALES 3 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TESORERÍA: 14 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*PRESUPUESTO: 7 PC INSTALADAS DE LAS CUALES 2 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*TRIBUTOS: 7 PC INSTALADAS Y CONECTADAS DE MANERA CORRECTA.\r\n*INGRESOS: 32 PC DE LAS CUALES 5 NO CONECTARON POR PROBLEMAS DE PERMISO DE ALGUNOS USUARIOS.\r\n*13 PC INSTALADAS DE LAS CUALES 1 NO CONECTO POR PROBLEMAS DE PERMISO DE USUARIO.\r\n\r\nEL DEPARTAMENTO DE TECNOLOGÍA DE BOQUITUERTOS ACORDÓ SOLUCIONAR LOS PERMISOS DE LOS USUARIOS QUE QUEDARON PENDIENTE.', '2018-02-09', '830', '1736', 10, 31, b'1', 8),
(51, 'Instalación y conexión del Saint Enterprise Administrativo en la versión 9.0.3.5, en un total de 87 estaciones de trabajo en Bolipuertos Puerto Cabello, entre los días 14 de febrero y 16 de febrero con la siguiente distribución:\r\n\r\n   - Compras: 9 Estaciones de Trabajo\r\n   - Administración: 15 Estaciones de Trabajo\r\n   - Tributos: 15 Estaciones de Trabajo, 1 Estación de Trabajo No Conecta\r\n   - Servicio Portuario: 3 Estaciones de Trabajo\r\n   - Contabilidad: 19 Estaciones de Trabajo\r\n   - Tesorería: 14 Estaciones de Trabajo\r\n   - Ejecución Presupuestaria: 12 Estaciones de Trabajo\r\n\r\nEn la instalación de la aplicación el acompañamiento por el departamento de tecnología caracas fue realizado por el Sr. Javier Suniaga, de parte del departamento de tecnología de Puerto Cabello el acompañamiento fue realizado por el personal de soporte técnico del puerto. \r\n\r\nNota: No se pudo cumplir con el requerimiento solicitado por el departamento de tecnología para realizar la conexión de la aplicación por validación de Windows, por que presenta unas diferencias entre los dominios de Caracas y Puerto Cabello. Por tal motivo se creó un usuario único para realizar las conexiones llamado “saintpto”\r\n', '2018-02-14', '700', '1900', 12, 31, b'0', 4),
(52, 'ADIESTRAMIENTO PARA EL PERSONAL DE CUENTAS POR COBRAR. VISUALIZAR LIBROS DE VENTAS POR SUCURSAL.\r\n', '2018-02-07', '900', '1200', 3, 29, b'1', 8),
(53, 'SE CREARON USUARIOS AL PERSONAL DE CONTABILIDAD Y SE CONECTARON TODOS LOS PROGRAMAS PARA SU VISUALIZACIÓN.', '2018-02-07', '1300', '1500', 2, 29, b'1', 8),
(54, 'SE ASESORO AL PERSONAL DE ALQUILER: TIPO DE OPERACIÓN, CUERYS DOBLES FECHA DE FACTURAS ERRADAS, SE ELIMINO ANTICIPO ERRADO, SE COLOCO TRIGGER PARA CORREGIR AJUSTES EN SALDOS DE FACTURAS.', '2018-02-07', '1500', '1600', 1, 29, b'1', 8),
(55, 'CONFIGURACIÓN DE CONEXIONES DE SERVIDOR Y ESTACIONES DE TRABAJO, POR REESTRUCTURACION DE INMOBILIARIO EN INVERSORA.', '2018-02-14', '1000', '1600', 6, 2, b'1', 8),
(56, 'SE INSTALO SISTEMA SAINT EN 6 EQUIPOS DE CONTABILIDAD CON CONEXIÓN A TODOS LOS PROGRAMAS Y SE CREO UN USUARIO.', '2018-02-23', '1100', '1330', 3, 29, b'1', 8),
(57, 'SE ASESORO AL PERSONAL DE ALQUILER: TIPO DE OPERACIÓN, CUERYS DOBLES FECHA DE FACTURAS ERRADAS, SE ELIMINO ANTICIPO ERRADO, SE COLOCO TRIGGER PARA CORREGIR AJUSTES EN SALDOS DE FACTURAS.', '2018-02-07', '1500', '1600', 1, 29, b'1', 7),
(58, 'SE CREARON USUARIOS AL PERSONAL DE CONTABILIDAD Y SE CONECTARON TODOS LOS PROGRAMAS PARA SU VISUALIZACIÓN.', '2018-02-07', '1300', '1500', 2, 29, b'1', 7),
(59, 'ADIESTRAMIENTO PARA EL PERSONAL DE CUENTAS POR COBRAR. VISUALIZAR LIBROS DE VENTAS POR SUCURSAL.', '2018-02-07', '900', '1200', 3, 33, b'1', 7),
(60, 'SE REALIZO LA INSTALACIÓN DEL MODULO\"MODIFICAR ORDEN\" EN SAINT ADMINISTRATIVO Y ACTIVACIÓN DE USUARIOS EN EL DEPARTAMENTO DE COMPRAS.\r\nCOMPRAS: 19 PC CON EL MODULO INSTALADO, MAS 1 QUE FALTA MANTENIMIENTO.\r\n20 USUARIOS ACTIVOS EN SAINT.', '2018-02-19', '1330', '1640', 4, 31, b'1', 8),
(61, '-SE REALIZO MODIFICACIÓN PARA CONECTAR AL SERVIDOR CON LA SIGUIENTE RUTA (10.50.11.47:8080/presupuesto_lag/?id=laguaira) PARA USAR EL MODULO DE PLANIFICACIÓN Y PRESUPUESTO.\r\n-7 PC DEL DEPARTAMENTO DE EJECUCIÓN DE PRESUPUESTO.\r\n-8 PC EN LA GERENCIA DE PLANIFICACIÓN Y ORGANIZACIÓN.\r\nSE ACTUALIZÓ SISTEMA SAINT EN 2 PC QUE QUEDARON PENDIENTE POR FALTA DE MANTENIMIENTO EN EL DEPARTAMENTO DE EJECUCIÓN DE PRESUPUESTO.\r\n\r\n', '2018-02-27', '900', '1600', 7, 31, b'1', 8),
(62, 'SE REALIZO LA INSTALACIÓN DEL MODULO\"MODIFICAR ORDEN\" EN SAINT ADMINISTRATIVO Y ACTIVACIÓN DE USUARIOS EN EL DEPARTAMENTO DE COMPRAS.\r\nCOMPRAS: 19 PC CON EL MODULO INSTALADO, MAS 1 QUE FALTA MANTENIMIENTO.\r\n20 USUARIOS ACTIVOS EN SAINT.', '2018-02-19', '1330', '1640', 4, 28, b'1', 7),
(63, '-SE REALIZO MODIFICACIÓN PARA CONECTAR AL SERVIDOR CON LA SIGUIENTE RUTA (10.50.11.47:8080/presupuesto_lag/?id=laguaira) PARA USAR EL MODULO DE PLANIFICACIÓN Y PRESUPUESTO.\r\n-7 PC DEL DEPARTAMENTO DE EJECUCIÓN DE PRESUPUESTO.\r\n-8 PC EN LA GERENCIA DE PLANIFICACIÓN Y ORGANIZACIÓN.\r\nSE ACTUALIZÓ SISTEMA SAINT EN 2 PC QUE QUEDARON PENDIENTE POR FALTA DE MANTENIMIENTO EN EL DEPARTAMENTO DE EJECUCIÓN DE PRESUPUESTO.\r\n', '2018-02-27', '900', '1600', 7, 28, b'1', 7),
(64, '-SE LOGRO VER LA LICENCIA SISTEMA SAINT ENPERPRISE VERSIÓN 9.0.3.5. EN EL DPTO DE COMPRAS EN 17 PC, QUEDANDO PENDIENTE 3 PC QUE NO CONECTARON CON EL SERVIDOR Y REQUIEREN MANTENIMIENTO.\r\n-SE AJUSTO EL FORMATO DE LA ORDEN DE COMPRA.\r\n-SE REALIZO LA PRIMERA ORDEN DE COMPRAS CON ÉXITO.\r\n-SE IMPARTIÓ EL ADIESTRAMIENTO SOBRE EL MANEJO DEL SISTEMA.\r\nFUERON ACTUALIZADOS LOS USUARIOS SAINT (DPTO DE PRESUPUESTO-TRIBUTOS).\r\n\r\n', '2018-02-23', '930', '1600', 7, 28, b'1', 7),
(65, '-LOS DÍAS 21/02/2018 Y 22/02/2018 NO SE LOGRO VER LA LICENCIA POR PROBLEMAS EN PUERTO 10000 QUE DA SALIDA A LA LICENCIA DEL SISTEMA SAINT ENTERPRISE VERSIÓN 9.0.3.5 EN EL DPTO DE COMPRAS.\r\n-EL DPTO DE TECNOLOGÍA DE BOLIPUERTOS LA GUAIRA Y NOSOTROS, ACORDAMOS ESTAR AL PENDIENTE HACER EL DEBIDO MANTENIMIENTO DE LAS MAQUINAS QUE AUN NO CONECTAN MIENTRAS SE RESUELVE EL PROBLEMA.\r\n', '2018-02-21', '930', '1200', 3, 28, b'1', 7),
(66, 'Actividades realizadas en Bolipuerto Puerto Cabello desde el 21-02-2018 hasta el 23-02-2018, acompañado por el Sr Jose Cacique, las actividades se enumera a continuación:\r\n-	Verificación de los usuarios importados a la base de datos\r\n-	Se inactivaron todos los usuarios importados\r\n-	Se activaron los usuario de adquisiciones para ingresar a la aplicaciones\r\n-	Se resolvieron problemas de validación licencia por bloqueo del puerto 10000\r\n-	Puesta en marcha el módulo de Ordenes de Compras para el personal de Adquisiciones\r\n-	Impresión del reporte Presupuestario y Ejecución presupuestaria para su revisión\r\n', '2018-02-23', '700', '2200', 15, 31, b'1', 4),
(67, '-SE REALIZO CONFIGURACIÓN DE IMPRESORA FISCAL ( SE REALIZARON FACTURAS, REPORTE X, REPORTE Z, CIERRE DE CAJA). LA CONEXIÓN ENTRE SISTEMA E IMPRESORA FISCAL FUNCIONO CORRECTAMENTE (VER SOPORTES)\r\n-SE  CREARON USUARIOS DE LA COORDINACIÓN DE INGRESOS CXC, ANÁLISIS FINANCIERO, TESORERÍA  Y COMPRAS  (VER SOPORTES ANEXOS) \r\n-SE INICIO ADIESTRAMIENTO DEL MODULO DE COMPRAS (QUEDANDO LA CONTINUACIÓN DE  ESTE PARA EL DÍA 02/03/2018)\r\n\r\n\r\nASESORES: IBRAHIN RESPLANDOR, YUSBEILI MARTINEZ, ANDY REYES', '2018-03-01', '830', '1616', 8, 31, b'1', 4),
(68, 'Servicio Departamento de Compras:\r\n\r\n- Actualizacion del usuario 14323172 en Modif.Orden, ya que presentaba problemas para ingresar.\r\n- Se desintalo e instalo nuevamente el Saint 9.0.3.5 y el Modificar Orden en la maquina BP-61.92 del usuario 15831947 por presentar problemas con la version del modificar_oc.\r\n- Fue asignado roles para visualizar y modificar los inventarios y  productos a los usuarios 15637456 / 16309969.\r\n- A solicitud del usuario 16309969, Se procedio a verificar Orden de Compras  nº2018000011 ya que esta duplicando el monto del iva. (pendiente por atender).\r\n- A solicitud del usuario 16309969, en Reporte de relaciones de ordenes emitidas se necesita eliminar la Orden n°2018000000 ya que la misma se creo cuando se cambio el correlativo. (pendiente por atender)\r\n- Problemas con los decimales en Modificar Orden, Usuario 14323172 presentando problemas con la orden n°2018000020 los decimales en el modulo de M.O no separa ni con ( , ) ni con ( . ). (pendiente por atender)', '2018-03-07', '900', '1500', 6, 31, b'0', 7),
(70, 'Servicio Departamento Compras:\r\n- Se modifico para conectar al servidor la ruta ( 10.50.11.47:8080/presupuesto_lag/?id=Lg%20Guiaira )  para usar el modulo de planificación y presupuesto en 20 PC del departamento. \r\n\r\nServicio Departamento Presupuesto:\r\n-Fue recibido el listado de los usuarios que van a utilizar el modulo de planificación y presupuesto (COMPRAS-PLANIFICACION-PRESUPUESTO).\r\n-Se modifico para conectar al servidor la ruta ( 10.50.11.47:8080/presupuesto_lag/?id=Lg%20Guiaira )  para usar el modulo de planificación y presupuesto en 7 PC del departamento.\r\n\r\nServicio Departamento tributos:\r\n- Se le asigno la estacion a las 7 pc y se concetaron.\r\n\r\nASESORAS: GENESIS TOVAR; AIRAM ESCALONA', '2018-03-01', '900', '1230', 4, 31, b'1', 7),
(71, 'Servicio Departamento de Presusuesto:\r\n\r\n- (RESUELTO); Usuarios MGOYA, ESCARANO, DVIVAS, MPGONZALEZ, GCAMPOS, MRODRIGUEZ y APINEDA activos para utilizar la ruta http://10.50.11.47:8080/presupuesto_lag/?id=laguaira\r\n\r\nServicio Departamento Compras:\r\n\r\n- (RESUELTO); Problemas con la orden n°2018000020 por no separar los decimales en Modificar Orden, Usuario 14323172.\r\n- (RESUELTO); Orden de Compras, el ususario 16309969 solicito ser revisada la Orden de Compras nº2018000011 ya que esta duplicando el monto del iva.\r\n- (RESUELTO); Reporte de compras incompleto al pasar del millon.\r\n-(RESUELTO); A solicitud del usuario 16309969, en Reporte de relaciones de ordenes emitidas se necesita eliminar la Orden n°2018000000 ya que la misma se creo cuando se cambio el correlativo. \r\n-Se comprometió la orden n°2018000018 con éxito.\r\n- (RESUELTO); Usuario 5096201 con problemas con el modificar orden, se reinstalo y quedo operativo.\r\n- (RESUELTO); usuario 14323172 \"perdio\" la ruta de presupuesto y fue instalada nuevamente.\r\n- (RESUELTO); La Orden de compras 2018000012 pendiente por modificar la fecha de emision, usuario:5095613 se equivoco y coloco fecha errada, la correcta es 19/01/2018\r\n- (PENDIENTE); Reportes de ordenes pendientes, usuario 16309969 solicito ser modificado el monto de la orden n°2018000011 la misma fue la que presento la duplicidad en el monto del iva (fue corregido) pero en el reporte no se actualizo.\r\n\r\n\r\nASESORAS: GENESIS TOVAR; AIRAM ESCALONA.\r\nCorreo: bolipuertos.issca@gmail.com\r\nTlfs: 0212-3316140 / 0414-2992745 / 0412-0990190', '2018-03-08', '830', '1640', 9, 31, b'1', 7),
(72, 'Nota: Se realizo inducion  debido a que la lincencia saint no esta activa y la base de datosesta en cero, Hay que migrar la data\r\n\r\n *Se instalo el modulo de compra\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nHoja de servicio perteneciente a: Isabel Leon', '2018-02-27', '1400', '1600', 2, 31, b'0', 12),
(73, 'Servicio Inversora IPSFA\r\n Se procede a verificar licencia ya que la misma no se encuentra activa en la maquina del usuario Yorley Saez.', '2018-03-12', '1100', '1200', 1, 2, b'0', 7),
(74, 'ADIESTRAMIENTO, PERSONAL DE CONTABILIDAD.\r\n\r\nYUSBEILI MARTINEZ\r\nGENESIS TOVAR\r\nAIRAM ESCALONA', '2018-03-13', '900', '1200', 3, 2, b'1', 8),
(75, 'Servicio Inversora Ipsfa\r\n\r\n*Se procedio a realizar la conexion del Saint de los departamentos Facturacion, Ventas, Comercializacion, Tesoreria, Tributos y de cada uno de los Gerentes, culminando el proceso con exito.\r\n*Usuarios: Daisary Hernandez V-22671475; Roberto Jimenez V-18602012; Edith Burgillo V-17815110 solicitaron la creacion del usuario saint (Resuelto).\r\n*Version de Saint de CAP. Luque actualizada a su version 9.0.3.2.\r\n  \r\n\r\n\r\nAsesores/Soporte:\r\nGenesis Tovar\r\nAiram Escalona \r\nAndy Reyes\r\nYusbeily Martinez', '2018-03-13', '1100', '1640', 6, 2, b'0', 7),
(76, 'Servicio Inversora Ipsfa\r\n\r\n*Se procedio a a realizar la conexion del sistema Saint de  los departamentos  Mantenimientos, Presupuesto, Bienes y Registro de Proveedores.\r\n', '2018-03-14', '930', '1200', 3, 2, b'1', 7),
(77, 'Servicio Casa Equipada\r\n\r\n-A solicitud de usuario DGONZALEZ, se le habilito el Rol para ver los reportes de inventario y para cargar los productos.\r\n-Usuario DGONZALEZ indica tener problemas con duplicidad en las notas de entrega, las mismas fueron revisadas y no hay error ya que tienen n° de factura fiscal y no estan pendiente.\r\nNotas de entrega:\r\nN°00016877: FF:00761709 / F-014964\r\nN°00016851: FF:00761709 / F-014964 \r\nN°00016903: FF:00761606 / F-014861\r\nN°00016902: FF:00761606 / F-014861\r\n-Se eliminaro 2 pedidos y 4 presupuestos.', '2018-03-14', '1300', '1500', 2, 34, b'0', 7),
(78, '1-. ADIESTRAMIENTO MODULO DE CONTABILIDAD\r\n-CREAR EMPRESAS, TERCEROS, CENTROS DE COSTOS, PLAN DE CUENTAS\r\n-CONFIGURACION DE LA EMPRESA CONTABLE ( ESTABLECER PERIODO FISCAL, MASCARA DE CUENTAS CONTABLES, MASCARAS DE CENTROS DE COSTOS\r\n-COMO PROCESAR COMPROBANTES CONTABLES  \r\n\r\nASESORA:\r\nYUSBEILI MARTINEZ', '2018-03-13', '900', '1200', 3, 35, b'0', 7),
(79, '1-ADIESTRAMIENTO MODULO CONTABLE\r\n-CONFIGURACION DE LOS ACTIVOS (CREAR TIPOS DE ACTIVOS, DEPARTAMENTOS, UBICACIONES, ACTIVOS)\r\n-DEPRECIACIONES Y COMO PROCESAR LOS COMPROBANTES\r\n-COMO CONFIGUARAR Y CAMBIAR LOS NUMEROS DE LOS COMPROBANTES\r\n-EMISION DE REPORTES\r\n- ACOMPAÑAMIENTO A CONTABILIDAD EN CONFIGURACION Y ADAPTACION DEL MODULO CONTABLE (PLAN DE CUENTAS, TERCERO, Y CREAR BANCOS)\r\n\r\nNOTA : QUEDA PENDIENTE PARA LA PROXIMA SEMANA EL ADIESTRAMIENTO DEL CONTABILIZADOR  \r\n\r\nASESORA:\r\nYUSBEILI MARTINEZ', '2018-03-14', '840', '1530', 7, 35, b'0', 7),
(80, 'Se instalo la aplicación Saint modulo contabilidad en las maquinas de: Edid Burguillos y Luis Figueras.\r\n\r\nSe instalo la aplicación Saint modulo administrativo en el área de tesorería en la computadora que va a utilizar la lic. Marisol Herrera.\r\n\r\nEn el área de recursos humanos se verifico que los usuarios ingresaran al modulo de nomina\r\n  \r\nRealizado por :\r\n Andy Reyes \r\nCI:15.846.560\r\nServicios y Soporte Técnico', '2018-03-15', '900', '1620', 8, 2, b'1', 12),
(81, 'Se realizo la actualización (versión 90.25) a la (versión 90.32) y conexión en el modulo administrativo en los equipos de los usuarios:\r\n* Bienes y Servicios: \r\n-Yorley: 4 Equipos \r\n-Disney Vargas 52032 \r\n-Didlay Sanabria G925HDA\r\n-Blanca Cedeño HPLC1851W\r\n-Cap. Cesar Gonzalez\r\n* Facturación: 3 Equipos\r\n- Dos equipos nuevos se le creo el modulo administrativo \r\n-Se creo el usuario Saint a la pasante Emily Jean ci:26.546.043\r\n* Tesorería:\r\n-Se realizo 2 aplicaciones y conexión\r\n-Cap. Luque se le actualizo la versión y se le  realizo el cambio de usuario a tesorería\r\n-Darialby actualización\r\n-Se le creo usuario Saint a Dariani Suarez ci25.329.665 \r\n \r\n\r\nRealizado por:\r\nAndy Reyes\r\nCI:15.846.560\r\nSoporte Tecnico', '2018-02-15', '930', '1630', 7, 2, b'0', 11),
(82, '- SE ACTUALIZO EL MODULO DE PRESUPUESTO SEGÚN LA RUTA DEL NUEVO SERVIDOR\r\n- SE CONFIGURO EL EQUIPO DE PRESUPUESTO Y COMPRAS PARA EL USO DE PRESUPUESTO\r\n- SE CONFIGURO EL MODULO DE MODIFICAR ORDEN PARA COMPRAS CON LA RUTA DEL NUEVO SERVIDOR\r\n- SE VALIDO LA LICENCIA DE SAINT DENTRO DEL MISMO SERVIDOR DE INVERSORA', '2018-03-13', '1400', '1700', 3, 2, b'1', 1),
(83, 'SE REALIZARON PRUEBAS PARA COMPROMETER ORDENES EN EL DEPARTAMENTO DE COMPRAS, LAS MISMAS GENERARON ALGUNOS ERRORES QUE SE RESOLVIERON CON AYUDA DE PROGRAMADORES Y SOPORTE TÉCNICO. \r\n\r\nAiram Escalona \r\nGénesis Tovar', '2018-03-09', '830', '1700', 9, 31, b'0', 8),
(84, 'SE INSTALÓ EL MÓDULO MODIFICAR ORDEN CON LA VERSIÓN 1.0.3, EN 20 PC, TOTALIDAD DE EQUIPOS EN EL DPTO DE COMPRAS. EN 17 PC SE EJECUTO SIN INCONVENIENTES Y 3 CON PROBLEMAS AL EJECUTAR. ', '2018-03-12', '800', '1200', 4, 31, b'1', 8),
(85, 'Servicio inversora\r\n-Se actualizo a la versión de saint 9032 al usuario EBURGILLO. \r\n-Actualización en el departamento de contabilidad la version 8.5.1 del modulo de contabilidad.\r\n-Se creo usuario  YSAEZ en el modulo de contabilidad.\r\n-Se creo usuario KQUIROGA en el modulo de contabilidad.\r\n\r\nASESORES: \r\nGENESIS TOVAR \r\nANDY REYES', '2018-03-14', '1000', '1600', 6, 2, b'0', 7),
(86, 'SERVICIO CASA EQUIPADA:\r\n\"GOBIERNO DE CALLE DEL 19 AL 24 DE MARZO\".\r\n-CONFIGURACION DE ESTACION DE TRABAJO.\r\n-VERIFICACION DE IMPRESORA FISCAL, SE VERIFICO LA CONEXION Y LA IMPRESION; LA MISMA SE DESBLOQUEA Y SE IMPRIME EL REPORTE X SIN PROBLEMAS.\r\n-INSTALACION DE SQL SERVER.\r\n\r\nSOPORTE: \r\nHIBRAHIN RESPLANDOR\r\nANDY REYES\r\n', '2018-03-19', '1000', '1200', 2, 34, b'0', 4),
(87, 'Servicio inversora \r\n\r\n-Tesoreria intento cargar las cuentas por cobrar pero contabilidad no tenia las cuentas contables ni los terceros en el sistema y por tal motivo no se logro comenzar a carga.\r\n\r\n \r\n', '2018-03-19', '1000', '1200', 2, 2, b'0', 7),
(88, 'SERVICIO INVERSORA\r\n\r\n-SE ESTABLECIO LA ESTACION DE TRABAJO DE USUARIO LVELAZQUEZ, LA MISMA PRESENTABA PROBLEMAS AL TOTALIZAR. \r\n\r\n- (PROCESO)SE EXTRAJO DE LA BASE DE DATOS LAS OPERACIONES DEL 9% QUE SE EMITIERON EN EL DIA PARA COMPLETAR LIBRO DE VENTAS.\r\n\r\nSOPORTE:\r\nHIBRAHIN RESPLANDOR \r\nGENESIS TOVAR \r\nANDY REYES', '2018-03-19', '1300', '1630', 4, 2, b'0', 4),
(89, 'Se tenía pautado para el día de hoy 20/03/2018 una inducción para el personal de facturación el cual fue suspendido y no se nos participó con anticipación vía correo electrónico.', '2018-03-20', '800', '1000', 2, 2, b'1', 4),
(90, 'Para agilizar el trabajo con referencia al libro de ventas que no se visualizan las operaciones del 9% y del 15% del IVA, se extrajeron los valores desde la base de datos correspondientes a esas operaciones de los meses de Octubre, Noviembre y Diciembre. Se exportaron los datos a un archivo de Excel para su verificación.\r\n\r\n\r\nEn facturación presentaron una complicación  al momento de realizar múltiples facturas de un único presupuesto, se detectó que la impresora predeterminada no era la matriz de punto que se utiliza para la facturación y por tal motivo los márgenes no correspondían. \r\n', '2018-03-20', '1000', '1500', 5, 2, b'1', 4),
(91, 'Se instalo la aplicación gestión de pago versión 86 en los siguientes departamentos:\r\n-Gerente de Recursos Humanos (RRHH) Wilmar  Chavez \r\n\r\n-Nomina:  6 computadores la cual se le logro instalar 4 Jacquelin Ordosgoitti,Mirce Hernandez,Eyuz Ledezma,Maricer Ojeda Se dejo pendiente 2 maquinas por que dan error acceso al archivo.\r\n \r\n-Ingreso: 6 computadores la cual se le logro instalar 5 Viviana Ramirez, Jorfran Perez, Maria Renna, Yenmifer Ramirez, Andrea Sanchez Se dejo pendiente 1 maquina por que dan error acceso al archivo.\r\n\r\n-Bienestar Social: 6 computadores la cual se le logro instalar 5 Luis Gonzalez,Oscar Castillo, Maiglyn Gonzalez,Jenelys Barrera, Marines Marquez Se dejo pendiente 1 maquina por que dan error acceso al archivo.\r\n\r\n-Relaciones Laborales:  2 computadores la cual se le logro instalar completas Sayrelis Ramirez, Gayle Rodriguez\r\n\r\nRealizado por: \r\nAndy Reyes \r\nMariann Diaz\r\n\r\n\r\n', '2018-03-20', '1300', '1630', 4, 31, b'0', 7),
(92, 'Se reporto en Automotores Fuerte Tiuna problemas con la aplicación que administra la cola de impresión de la impresora fiscal (Spooler), se hizo contacto con el proveedor de la aplicación y se soluciono el problema que presento la aplicación y se realizo la facturación pendiente sin problemas.', '2018-03-21', '830', '1230', 4, 33, b'1', 4),
(93, 'Se creó un nuevo formato por que necesitan que se visualice en la facturación del servicio de vigilancia un comentario particular para este tipo de facturas', '2018-03-21', '1400', '1500', 1, 2, b'1', 4),
(94, 'Se configuro la  conexion del modulo administrativo en la maquina de la lic Erika Namias, al intentar  ingresar en las casillas reporte + ventas +relacion de ventas por produtos despues de espesificar tipo de factura, fecha y selecionar la opcion preeliminar aroja el siguiente error:\r\nSintaxis incorrecta cerca de la palabra clave \'SELECT\'\r\n Nota anexso imp pnt de pantalla\r\nRealizado por :\r\nAndy Reyes\r\nCI:15846560', '2018-03-21', '900', '1500', 6, 2, b'1', 7),
(95, '-SERVICIO DE ACOMPAÑAMIENTO EN EL DPTO DE COMPRAS.\r\n-REALIZARON 5 ORDENES SIN NINGÚN INCONVENIENTE (COMPRAS).\r\n-SE CERRO EL MES DE ENERO (TRIBUTOS).\r\n', '2018-03-21', '900', '1215', 4, 31, b'1', 8),
(96, 'SE REALIZO SEGUIMIENTO DE LOS DEPARTAMENTOS QUE ESTÁN TRABAJANDO CON SAINT.\r\n\r\n-COMPRAS: (TRABAJANDO SIN INCONVENIENTES).\r\n-PRESUPUESTO: ACTIVO PARA TRABAJAR, NO HAN COMENZADO POR NO TENER DIRECTRICES DEL TRABAJO A REALIZAR.\r\n-TRIBUTOS: REALIZA LAS RETENCIONES Y ORDENES DE PAGO DESPUÉS QUE COMPROMETEN LAS ORDENES Y HACER EL CAUSADO POR PARTE DE LOS DPTOS ANTERIORES.\r\nOBSERVACIÓN: PENDIENTE MODULO POR INSTALAR.\r\n- RRHH: SE INSTALO EL MODULO DE NOMINA EN 25 PC, QUEDANDO PENDIENTE 1 PC POR FALTA DE MANTENIMIENTO. \r\n-ADMINISTRACION: SE INSTALO SISTEMA SAINT EN 1 PC CON USUARIO CREADO (LCDA. NAYADE CASTILLO).\r\nSE ACORDO CON LA LCDA. REALIZAR ADIESTRAMIENTO GENERAL Y REDACTAR ACTA DE CONFORMIDAD. (REALIZARA LA SOLICITUD VIA CORREO ELECTRONICO).\r\n\r\n\r\nANDY REYES\r\nAIRAM ESCALONA', '2018-03-22', '900', '1600', 7, 31, b'0', 8),
(97, 'Se le instalo la aplicación Saint administrativo versión 9035 en la computadora de la gerente de finanzas lic Edelyn Ramos con conexión a los otros puertos,  \r\nSe le creo usuario a lic Edelyn Ramos \r\n\r\nRealizado por:\r\nAndy Reyes\r\nCI:15846560', '2018-03-20', '1200', '1300', 1, 31, b'0', 7),
(98, 'Se realizó verificación de instalación realizada los días 19-02-2018 y 20-02-2018 de la aplicación Saint Contabilidad Ver. 8.5.0 en el departamento de contabilidad para 6 estaciones de trabajo si reportar algún problema a la fecha.', '2018-03-23', '830', '900', 1, 36, b'1', 4),
(99, 'Se realiza verificación de instalación de la aplicación Saint Enterprise Ver.9.0.3.5 y el Acceso al módulo Web de Presupuesto para 3 estaciones de trabajo en el departamento de Cuentas por Pagar o  Ejecución Presupuestaria, se configuro 1 usuario llamado Sra. Belkis Lanz para ingresar al módulo de presupuesto con el ROL de Ejecutor, está pendiente verificar el usuario de la coordinadora Sra. Joan Gonzalez por no estar presente el día de hoy', '2018-03-23', '900', '930', 1, 36, b'1', 4),
(100, 'Se realiza verificación de instalación realizada el día 19-02-2018 de la aplicación Saint Enterprise Ver.9.0.3.5 para 4 estaciones de trabajo en el departamento de Tributos, y se crearon los usuario Luis Osorio, Karina Mariche, Greice Bustamante y Anly Moreno para acceder al sistema.', '2018-03-23', '930', '1000', 1, 36, b'1', 4),
(101, 'Se realizó configuración del acceso al módulo Web de Presupuesto para 5 estaciones de trabajo en el departamento de presupuesto, se configuraron 4 usuarios nuevos, Edy Rubio, Leonardo Castro, Elizabeth Gomez y Diorkys Aular con el ROL de PLANIFICADOR2.', '2018-03-23', '1000', '1100', 1, 36, b'1', 4),
(102, 'Se realizó configuración del acceso al módulo Web de Presupuesto a 2 estaciones de trabajo en el departamento de Planificación y Control de Gestión, se configuraron 2 usuarios nuevos, Ileana Alfonzo y Yolanda Da’Silva con el ROL de PLANIFICADOR2', '2018-03-23', '1100', '1130', 1, 36, b'1', 4),
(103, 'Se instalaron las cuatros maquinas que faltaban por la aplicación gestión de pago versión 8.6.0 en las siguientes áreas de recursos humanos: \r\n-Nomina :2 \r\n-Ingreso: 1\r\n-Bienestar social: 1', '2018-03-23', '1330', '1430', 1, 36, b'1', 7),
(104, 'Se realiza verificación de instalación realizada el día 19-02-2018 de la aplicación Saint Enterprise Ver.9.0.3.5 para 8 estaciones de trabajo en el departamento de tesorería, y se crearon los usuario Loredena Albertazzi, José Quintong,Karlas Durand,Ahurely Naveda ,Jeffeson Becerrit, Sugey Carrillo y Francisco Pérez para acceder al sistema.\r\n\r\n\r\nRealizado por:\r\nAndy reyes\r\nCI.15846560\r\n', '2018-03-23', '1430', '1600', 2, 36, b'1', 7),
(108, 'Se realiza verificación de instalación realizada el día 19-02-2018 de la aplicación Saint Enterprise Ver.9.0.3.5 para 7 estaciones de trabajo CCS OA -046,BPSB 02266-1,COMP 918 ,CCS OA-019,CCS OA 018,CCS OA-043 y una lapto en el departamento compras almacén servicios generales y transportes se crearon los usuario: Alicia Contreras ,Sharon Lara ,Josmirey Antiquera ,Gregory Jimenez Jesus Carion,Jonas Pino, Miguel Mora para acceder al sistema. \r\n\r\n\r\nRealizado por:\r\nAndy reyes\r\nCI.15846560\r\n', '2018-04-03', '1130', '1230', 1, 37, b'1', 7),
(109, 'Se realiza verificación de instalación realizada el día 19-02-2018 de la aplicación Saint Enterprise Ver.9.0.3.5 para 5 estaciones de trabajo CCS OA -015,CCS OA-047,CCS OA-048 , BP-54.17 en el departamento análisis financiero, y se crearon los usuario: Maiderling Martinez ,Jhonny Urbina ,Cruz Quiñonez ,Esther Liendo ,Alexandra Garcia para acceder al sistema.\r\n\r\n\r\nRealizado por:\r\nAndy reyes\r\nCI.15846560\r\n', '2018-04-03', '930', '1030', 1, 37, b'1', 7),
(110, 'Se realiza verificación de instalación realizada el día 19-02-2018 de la aplicación Saint Enterprise Ver.9.0.3.5 para 4 estaciones de trabajo CCS OA -013,CCS OA-016,CCS OSLA 002 y CCS OA 041 en el departamento de cuentas por cobrar, y se crearon los usuario: Rubiselly Muñoz ,Freddy Gonzalez ,Ninoska Murillo y Eucary Perez para acceder al sistema.\r\n\r\n\r\nRealizado por:\r\nAndy reyes\r\nCI.15846560?\r\n', '2018-04-03', '1030', '1130', 1, 37, b'1', 7),
(111, 'Se realiza verificación de instalación realizada el día 19-02-2018 de la aplicación Saint Enterprise Ver.9.0.3.0 a la  Ver.9.0.3.5 para 6 estaciones de trabajo CCS OA -046,BPSB 02266-1,COMP 918 ,CCS OA-019,CCS OA 018,CCS OA-043 en el departamento compras\r\n\r\nRealizado por:\r\nAndy reyes\r\nCI.15846560\r\n', '2018-04-03', '1130', '1230', 1, 37, b'1', 7),
(112, 'Creación de usuarios para el acceso al sistema Saint enterprise,\r\n-COMPRAS:\r\nCCS OA -046  Alicia Contreras\r\nBPSB 02266-1 Sharon Lara\r\nCOMP 918 Josmirey Antiquera\r\nCCS OA-019 Gregory Jimenez\r\nALMACÉN:\r\nCCS OA 018 Jesus Carion\r\nTRANSPORTE:\r\nCCS OA-043 Jonas Pino\r\nSERVICIOS GENERALES:\r\nLapto Miguel Mora\r\n\r\n\r\n\r\nRealizado por:\r\nAndy reyes\r\nCI.15846560', '2018-04-03', '1130', '1230', 1, 37, b'1', 7),
(113, 'SERVICIO AUTOMOTORES IPSFA\r\n\r\n- IMPRESORA FISCAL APAGADA, SE COLOCO CLAVE DE SPOOLER Y SE IMPRIMIO REPORTES X,Z Y FACTURACION CON EXITO.', '2018-04-05', '930', '1040', 2, 32, b'1', 8),
(114, 'Servicio departamento Tesoreria:\r\n-Se realizo acompañamiento al personal para comenzar a realizar la carga de las ventas en el sistema saint.\r\n\r\nServicio departamento facturacion:\r\n-Se verificaron las notas de credito con problemas.\r\n-Mariger Alvarez; solicita que se modifique el formato de notas de credito al nuevo formato.\r\n\r\nServicio departamento tributos: \r\n-Se desactivaron las alicuotas de rebajas del iva.\r\n-El reporte fue modificado y  expresa impuesto al lujo como lo solicito el personal de tributo.\r\n-A solicitud del personal se va a generar un reporte especial de nota de credito, para expresar las operaciones de anulacion de facturas correspondientes al periodo donde aplico la rebaja del iva decretada por el presidente.\r\n\r\n\r\nASESORES:\r\nMARIA FUENTES \r\nGENESIS TOVAR\r\n\r\n', '2018-04-05', '930', '1400', 5, 2, b'1', 7),
(115, 'En el departamento de contabilidad se realizo la conexión del modulo Saint contabilidad en las siguientes equipos:\r\n*IP-61114\r\n*BP-6188\r\n*BP-61107\r\n*BP-61108\r\nQuedando pendiente por conexión 7 equipos\r\n\r\nRealizado por:\r\nAndy Reyes\r\nci:15846560', '2018-04-05', '830', '1830', 10, 38, b'1', 7),
(116, '-Se realizo la conexión de Modulo de banco con el modulo de contabilidad de caracas en (11) Equipos\r\n \r\n-Se Crearon los usuario en el departamento de contabilidad: (Modulo de banco)  \r\nLilian Guzmán\r\nAnderson Zapata\r\nDaniela Fuenmayor\r\nYosmary Alvarado\r\nYamilex Araujo\r\nAlejandra Viloria \r\nIndrid Maza\r\nMiriam Erazo\r\nLilibeth corro\r\nCelia Torrealba\r\nAna Garcia\r\n\r\nRealizado por:\r\nAndy reyes\r\nGenesis Tovar ', '2018-04-04', '930', '1600', 7, 38, b'1', 7),
(117, 'SERVICIO INVERSORA:\r\n\r\n-	SE MODIFICÓ FORMATO DE PEDIDO Y PRESUPUESTO PARA DARLE MAYOR ESPACIO AL PRECIO EN NÚMEROS Y LETRAS.\r\n-	SE CREARON 2 TIPOS DE OPERACIONES: SERIE A Y SERIE H.\r\n-	SE EXPLICÓ COMO AGREGAR PARTES DEL PRODUCTO.\r\n-	SE EXPLICÓ QUE EL SISTEMA MANEJA VARIOS PRECIOS PARA UN MISMO PRODUCTO.\r\n-	SE MODIFICÓ EL NÚMERO DE DOS FACTURAS.\r\n-	SE AJUSTÓ EL NUMERO DEL CORRELATIVO DE FACTURA A LA SERIA H.\r\n\r\nIBRAHIM RESPLANDOR\r\nAIRAM ESCALONA\r\n\r\n', '2018-04-06', '900', '1200', 3, 2, b'1', 8),
(118, 'En el departamento de contabilidad se realizo la conexión del modulo Saint contabilidad en las siguientes equipos:\r\n*BP-61111\r\n*BP-61112\r\n*BP-61113\r\n*BP-61115\r\n*BP-61109\r\n*BP-61116\r\n*BP-6178\r\nQuedando pendiente 1 equipo (reportado a sistema para su reparación)\r\nSe le desbloqueo la clave en el modulo de contabilidad a Lilibeth Corro\r\nSe le creo usuario en el modulo contabilidad a Yosmary Alvarez\r\n\r\nRealizado por:\r\nAndy Reyes\r\nCI:15846560', '2018-04-06', '1030', '1700', 7, 38, b'1', 7),
(119, 'Reportaron el día 09-04-2018 perdida de una factura y diferencias en los correlativos de facturación, se verifico la base de datos y se detectó que emitieron la factura con el vendedor “B” en vez de vendedor “H”, por esto motivo y la configuración que tiene la aplicación asigno otro correlativo se corrigió el problema y se les recordó al personal de facturación que la configuración solicitada por tributos para diferenciar los libros de ventas se realizan en Operación al momento de totalizar.\r\n\r\n\r\nLa Sra. Mariger Alvarez entrega una copia del formato de Notas de Crédito para realizar el formato.\r\n\r\n\r\nLa Sra. Andrea Gomez solicita reporte de facturación por instrumento de pago, para cumplir este requerimiento se le pidió un modelo en Excel con los campos que necesita visualizar.\r\n\r\n\r\nLa Sra. Marilyn Manzo solicita reporte de servicios por facturas detallados, no global como lo muestra por defecto el sistema.\r\n', '2018-04-10', '830', '1210', 4, 2, b'1', 4),
(120, '          RESUMEN DE SERVICIOS:\r\n\r\n1.       Desactivación de las alícuotas del 7% y 9%  en todos las sucursales y verificación de la facturación\r\n2.       Formatos de pre factura y factura en formato euro\r\n3.       Ajustes en la base de datos de carenero con tablas adicionales para el manejo del $\r\n4.       Ajuste del error de usuario al generar una nota de crédito a la Fact H001807, por motivos de corrección del código de servicio documentación 05-8003, ya que el mismo se facturo exento de IVA y al generar la nota de crédito calcula el mismo código con IVA\r\n5.       Apoyo remoto con la activación de la sede de  punto fijo \r\n6.       Ajuste en comprobantes de retención del 75% del  IVA\r\n7.       Caso Maracaibo para generar 21 facturas pendiente por nota de crédito, error del usuario  en la creación del cliente PETROZAMORA y la creación de servicios exentos\r\n8.       Revisión en caracas de reportes de cuentas por cobrar e informe para auditoria por diferencia en el cierre.\r\n\r\nPARA UN TOTAL DE  20 HORAS EN EL 1°TRIMESTRE DE 2018.', '2018-03-31', '700', '800', 1, 39, b'1', 11),
(121, '-Se realizo la conexión de la base de dato CEBOLIPUERTOS en los siguientes equipos:\r\n*IP-61114 *BP-6188 *BP-61107 *BP-61108 *BP-61111 *BP-61112 *BP-61113 *BP-61115\r\n*BP-61109 *BP-61116 *BP-6178 *BP-61.106.\r\n- Nota *BP-61.89 (dañada reportada a sistema)\r\n\r\n-Se realizo la conexión de Modulo de banco con el modulo de contabilidad\r\n\r\n-Se Crearon los usuario en el departamento de contabilidad:\r\nLilian Guzmán\r\nAnderson Zapata\r\nDaniela Fuenmayor\r\nYosmary Alvarez\r\nYamilex Araujo\r\nAlejandra Viloria \r\nIndrid Maza\r\nMiriam Erazo\r\nLilibeth corro\r\nCelia Torrealba\r\nAna Garcia \r\n\r\n-Los usuario lograron ingresar al modulo de Saint contabilidad  y consolidar la información registrada en el modulo de banco\r\n-En el menú de reportes estados financieros - estado de situación financiera arrojo el siguiente error:Balance general no esta configurado revise la configuración ganancias o , anexo imagen\r\n-En el menú de reportes estados financieros -estado de resultados arrojo el siguiente error:Estado de ganancia o perdidas no esta configurado revise la configuración   , anexo imagen\r\n-Se reportaron los casos a Maria y Ibrahin \r\n\r\nRealizado por:\r\nAndy Reyes\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2018-04-12', '830', '1730', 9, 40, b'0', 7);
INSERT INTO `is_servicio` (`id_servicio`, `descripcion`, `fecha`, `hora_entrada`, `hora_salida`, `total_horas`, `id_solicitud`, `activo`, `id_usuario`) VALUES
(122, 'Servicio Tesorería Inversora\r\n\r\n-Se realizo acompañamiento para que el personal del mismo comenzara a realizar la carga de los acientos de  intermediación. (Sra. Karina Tesoreria)\r\n-Se modificaron las cuentas que no estaban activas al momento de hacer la carga. (Sra. Adriana Contabilidad)\r\n-Pendiente la carga de la nomina en banco, ya que las cuentas no estan activas.\r\n', '2018-04-12', '900', '1230', 4, 2, b'1', 7),
(123, 'Actualizacion del sistema Saint Enterprise Administrativo de la versión 9.0.3.1 a la versión 9.0.3.5 en 6 estaciones de trabajo y 1 servidor.\r\n\r\n\r\n\r\nrealizado: Andy Reyes, Fraddy Diaz y Yusbeilis Martinez', '2018-04-16', '900', '1030', 2, 41, b'0', 11),
(124, '-Se revisaron 15 equipo en el departamento de compra  que estaban presentando el siguiente error estación  trabajo no asignada al intentar ingresar al sistema.\r\n- Se elimino la conexión y se realizo el proceso para una nueva conexión con el servidor, se asignaron las estaciones dejaron operativo el sistema \r\nEQUIPOS:\r\nBP-61114\r\nBP-6192\r\nBP-6193\r\nBP-6191\r\nBP-61141\r\nBP-61133\r\nBP-61145\r\nBP-61146\r\nBP-61148\r\nBP-61143\r\nBP-61142\r\nBP-61140\r\nBP--61147\r\nNota error en conexión \r\nBP-61152\r\nBP-3294\r\n\r\nRealizado por: \r\nAndy Reyes', '2018-04-16', '1540', '1700', 2, 42, b'1', 11),
(125, 'Servicio Estaciones de Servicio:\r\n\r\n- Se realizo acompañamiento para verificar dos (2) facturas con las que tenian dudas para trabajarlas.\r\n\r\nServicio Contabilidad:\r\n\r\n- Se realizo visita para verificar los reportes de banco.\r\n- (PENDIENTE) Solicitan verificar los permisos para realizar el cierre de caja.\r\n- (PENDIENTE) Solicitan verificar sede Maracaibo, el instrumento de pago no da alerta cuando hay duplicidad  con el banco.', '2018-04-17', '1030', '1200', 2, 33, b'1', 7),
(126, '-Se realizo las dos conexiones faltantes de los equipo del departamento de compra \r\nBP-61152\r\nBP-3294\r\n- Se modifico la orden de compra nª 2018000021 porque no se apresiaban algunos productos (anexo copia)\r\n-Se modifico la coletilla en donde firma el Gerente General de MY.Jose.A.ContrerasT por el CNEL.Efrain J.Sanchez.R en la orden de compra 2018000021 porque para la fecha de emision 31/01/2018 era la persona encargada (anexo copia)\r\n-Se crea usuario en el modulo de presupuesto a Mariam Cordero CI16309969\r\n \r\nRealizado por \r\nANDY Reyes', '2018-04-18', '830', '1200', 4, 43, b'1', 7),
(127, 'SE VERIFICO NUEVAMENTE QUE LOS DIFERENTES DEPARTAMENTOS ESTEN TRABAJANDO DESDE EL SISTEMA SAINT:\r\n\r\n-PRESUPUESTO: EN ESPERA QUE EL DPTO DE COMPRAS TERMINE CON EL MES DE FEBRERO PARA COMENZAR CON MARZO QUE SI TIENEN CAUSADOS.\r\n-TESORERIA: EN ESPERA AL IGUAL QUE PRESUPUESTO.\r\n-CONTABILIDAD: EN ESPERA PARA CONTINUAR EL CICLO.\r\n-INGRESOS: TRABAJANDO INGRESOS Y CUENTAS POR COBRAR SIN PROBLEMAS.\r\n\r\nASESORIA Y SOPORTE:\r\nANDY REYES\r\nAIRAM ESCALONA', '2018-04-18', '1330', '1630', 3, 40, b'1', 8),
(128, 'Se realizo adiestramiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén  \r\n\r\nAsesora Mariann Diaz', '2018-04-11', '930', '1230', 3, 37, b'0', 8),
(129, 'Se realizo acompañamiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén\r\n\r\nAsesora Mariann Diaz', '2018-04-12', '930', '1200', 3, 37, b'0', 8),
(130, 'Se realizo acompañamiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén\r\n\r\nAsesora Mariann Diaz', '2018-04-13', '930', '1200', 3, 37, b'0', 8),
(131, 'Se realizo acompañamiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén\r\n\r\nAsesora Mariann Diaz', '2018-04-16', '900', '1200', 3, 37, b'0', 8),
(132, 'Se realizo acompañamiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén. \r\n\r\nTambién se realizo adiestramiento al personal de presupuesto a enlazar los productos ya cargados en el inventario a las partidas presupuestarias.\r\n\r\nAsesora Mariann Diaz', '2018-04-17', '900', '1300', 4, 37, b'0', 8),
(133, 'Se realizo acompañamiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén. \r\n\r\nAsesora Mariann Diaz y Airam Escalona\r\n', '2018-04-20', '900', '1600', 7, 44, b'0', 8),
(134, 'Se revisaron los siguientes equipos en el departamento de tributos que estaban arrojando error estación de trabajo no asignada\r\nBP-61118\r\nBP-61119\r\nBP-61117\r\nBP-61120\r\nBP-61104\r\nBP-61122\r\n\r\nCONTABILIDAD y INGRESO\r\nSe dejo informado al personal de contabilidad que deben de ingresar los centro de costo a cada cuenta \r\n\r\nRealizado Por \r\nAndy Reyes', '2018-04-23', '1100', '1300', 2, 45, b'0', 7),
(135, 'Se realizo acompañamiento para cargar los productos en el inventario a el Sr. Carrion Jefe de Almacén. \r\n\r\nAsesora Mariann Diaz y Airam Escalona', '2018-04-23', '900', '1600', 7, 44, b'1', 8),
(136, '-SE REALIZO VISITA AL DPTO DE CONTABILIDAD PARA SABER SI HABÍAN REALIZADO LA CONFIGURACIÓN DE LOS CENTROS DE COSTOS CON LAS CUENTAS CONTABLES CORRESPONDIENTES, LOS CUALES INDICARON QUE ESPERAN POR AUTORIZACIÓN DE CARACAS. \r\n-SE CONSULTO CON LA LIC. MARÍA DIAZ DE INGRESOS, LA INFORMACIÓN SUMINISTRADA POR CONTABILIDAD, YA QUE LA SRA. JOSMARY DURAN (INGRESOS) NO TENIA LA INFORMACIÓN.\r\n-SE RESOLVIÓ EL PROBLEMA DE (ESTACIÓN NO ASIGNADA) EN COMPRAS.\r\n\r\nAIRAM ESCALONA\r\nANDY REYES\r\n\r\n', '2018-04-25', '1030', '1115', 1, 44, b'1', 8),
(137, '- SE CAMBIO LA FECHA DE LAS MODIFICACIONES SEGUN GLPI\r\nN° 01 de Fecha 22/01/2018 por Bs. 1.585.000.000,00.\r\nN° PLC-02-2018 de fecha 08/02/2018 por Bs. 3.317.000.000,00 \r\nSC.N°01-2018 fecha 08/02/2018 por Bs. 1.970.000.000,00\r\n\r\n- SE CAMBIO LA PARTIDA ERRONEA EN LA MODIFICACION (DE 403.04.04.00 A 403.04.01.00) \r\n\r\n- SE COLOCO LA DENOMINACION EN LAS PARTIDAS QUE APARECIAN VACIAS\r\n\r\n- SE ARREGLARON LOS CORRELATIVOS DE COMPROMETIDO Y CAUSADO \r\n', '2018-04-24', '1100', '1200', 1, 46, b'1', 1),
(138, 'SERVICIO:\r\n\r\n-CONTABILIDAD\r\nSE REALIZO CONFIGURACIÓN DE SAINT CON CONTABILIDAD Y BANCO.\r\nSE  MODIFICO USUARIO (ALEJANDRA VILORIA).\r\nPENDIENTE: SI LA INFORMACIÓN GUARDADA EN CÓDIGO DE LA CUENTA 002 SE UNE CON EL 2, SI SE VA A MANTENER LA CONTABILIDAD LAG 2018 EN LA DE CCS, LA INFORMACIÓN CARGADA RECIENTE DE BANCO SE GRABO EN LA CONTABILIDAD CCS.\r\n\r\n-INGRESOS\r\nSE REALIZO PRUEBA CON LOS CENTROS DE COSTO Y BANCO SATISFACTORIAMENTE. (SOPORTE ANEXO)\r\nINFORMACIÓN CARGADA RECIENTEMENTE QUEDO GRABADA, SE CONSOLIDA CON LA CONTABILIDAD LAG 2018 QUE ESTA EN CCS\r\n\r\nASESORES\r\nANDY REYES\r\nAIRAM ESCALONA\r\n', '2018-04-30', '1030', '1300', 3, 47, b'1', 8),
(139, 'Servicio Empresas\r\n\r\n-Se realizo visita para verificar una carga de depositos en banco.\r\n\r\n', '2018-04-30', '1440', '1515', 1, 33, b'1', 7),
(140, '*Servicio Facturacion\r\n\r\n-(RESUELTO); Se modifico a nivel de sistema problema con el IVA 7%.\r\n-(RESUELTO); Se creo formato de nota de credito.\r\n\r\n*Servicio Tributos\r\n\r\n-(RESUELTO); Se realizaron las modificaciones a nivel de reporte para que no duplicara los montos de los productos.\r\n', '2018-05-03', '1400', '1530', 2, 2, b'1', 7),
(141, 'Servicio Automotores los Proceres\r\n\r\n-(RESUELTO); se soluciono problema con factura n°012970 con problemas de impresion.', '2018-05-03', '1415', '1430', 1, 33, b'1', 7),
(142, 'SERVICIO:\r\n\r\nSE REALIZO CAMBIOS EN LOS FORMATOS DE FACTURAS, NOTAS DE CRÉDITO Y PRESUPUESTOS, PARA INCLUIR EL MONTO EN Bs. SOBERANO.', '2018-05-02', '900', '1530', 7, 48, b'1', 8),
(143, 'SERVICIO:\r\n\r\nSE REALIZO CAMBIOS EN LOS FORMATOS DE FACTURAS, NOTAS DE CRÉDITO Y PRESUPUESTOS, PARA INCLUIR EL MONTO EN Bs. SOBERANO.', '2018-05-03', '900', '1600', 7, 48, b'1', 8),
(144, 'SERVICIO:\r\n\r\nSE REALIZO CAMBIOS EN LOS FORMATOS DE FACTURAS, NOTAS DE CRÉDITO Y PRESUPUESTOS, PARA INCLUIR EL MONTO EN Bs. SOBERANO.\r\n\r\nYUSBEILI MARTINEZ\r\nAIRAM ESCALONA', '2018-04-30', '1400', '1700', 3, 48, b'1', 8),
(145, 'Se configuraron dos maquinas fiscales  en estaciones de trabajos que a continuación detallo:\r\n-Estación de trabajo caja n°1\r\nImpresora fiscal \r\nModelo: Tally Dascom 1125\r\nSeria:1000003752\r\n\r\n-Estación de trabajo caja n°2\r\nImpresora fiscal \r\nModelo: Bixolon\r\nSeria:2108113855\r\n \r\nNota: No hay enlaces entre SAINT y la Impresora Fiscal referente a los impuestos SAINT se visualiza con el 12% pero cuando obtenemos el físico es con un 27% \r\nRealizado por:\r\nANDY REYES', '2018-05-10', '1030', '1325', 3, 49, b'1', 11),
(146, '1-.Se modificó por base de datos todos los centros de costos de acuerdo a los q tenían en la contabilidad 2017. Ver anexo. \r\nNota : Se verifico q al ingresar en el. Modulo de banco se visualizan  los centros de costos de firma adecuada. \r\n2-. Se instalo el contabilizado en 12 pc de la Gerencia de Contabilidad. \r\n3-. Se verificó  q la información del. Mes de enero de ingresos q da error al bajar a contabilidad da porque las cuentas contables q fueron utilizadas no existen en contabilidad 2018/2017/2016  la misma pertenecen a unas cuentas de la contabilidad 2010.\r\n  Nota: la única forma de qué esto sucediera es q el modulo de banco estuviese configurado con la contabilidad 2010 y adicionalmente  el personal no se fijo en las cuentas q estaban tomando.  ', '2018-05-07', '900', '1300', 4, 50, b'0', 11),
(147, 'Cliente Book\r\n1-. Se modificó  factura  y Notas de Crédito Con el total en Bs. S. Vía remota', '2018-05-06', '700', '1300', 6, 51, b'1', 11),
(148, 'Cliente La Lucha\r\n1-.Se ajusto nómina de acuerdo al aumento salarial ', '2018-05-06', '700', '1100', 4, 41, b'1', 11),
(149, '-Se conecto vía vpn con espacio arrendado (alquiler) del ipsfa para eliminar dos facturas según memorando solicitado por la sra Doraima\r\n-Se restringe todo tipo de reporte, proveedores,  compras, impuesto, libro de compra iva, retención iva sobre compras, en las siguientes unidades de negocios:\r\n*ESTACIONES\r\n*AUTOMOTORES\r\n*ALQUILER\r\n*ESPACIOS INMOBILIARIO\r\n\r\n-Se restringe la duplicación de depósitos duplicados, nota de crédito  y nota de débitos duplicados en el modulo de banco \r\n\r\nRealizado por: \r\nANDY REYES\r\nYUSBEILI MARTINEZ\r\n', '2018-05-09', '800', '1400', 6, 52, b'1', 11),
(150, 'MI CASA BIEN EQUIPADA\r\n-Se restringe la duplicación de depósitos duplicados, nota de crédito y nota de débitos duplicados en el modulo de banco \r\n\r\n\r\nRealizado por:\r\nANDY REYES', '2018-05-11', '800', '830', 1, 34, b'1', 11),
(151, 'Se instalo en la PC indentificada con el n°BP-2360 la aplicacion saint modulo administrativo en el area de ingreso correo enviado por sistema ya que dicho equipo fue formatiado\r\n\r\n Realizado por:\r\nAndy Reyes', '2018-05-14', '1030', '1130', 1, 53, b'1', 11),
(152, 'No se logro realizar la reparación del sistema ya que el equipo BP-23115 en el departamento de ingreso no tiene conexión a la espera por el departamento de soporte para regresar y culminar la agsinacion \r\n\r\nRealizado por: \r\nAndy Reyes\r\nGenesis Tovar', '2018-05-16', '930', '1100', 2, 53, b'1', 11),
(153, 'Se crea conexión con Bolipuertos Caracas en el departamento de ingreso en 11 PC identificada con los siguientes números:\r\nBP-23163\r\nBP-2350\r\nBP-2351\r\nBP-2387\r\nBP-23115\r\nBP-23117\r\nBP-2348\r\nBP-23169\r\nBP-2372\r\nBP-2354\r\nBP-2373\r\n-Se les crearon usuarios al personal de ingreso a la conexión bolipuertos caracas \r\n-Se creo un nuevo grupo ingreso la guaira  para colocar los usuarios creado, están por definir el alcance de cada rol \r\n-Nombre de los usuarios creados\r\nJosmary Duran, \r\nIrama Cabezo\r\nJosefina Molina\r\nIrides Hernandez\r\nDayci Giron\r\nMaria F Garcia\r\nYelinne Molina\r\nYulika Ugas\r\nIzamilu Zalazar\r\nVanessa Hernandez\r\nYarisma Gutierrez\r\nRealizado por:\r\nAndy Reyes\r\n', '2018-05-18', '1400', '1630', 3, 54, b'1', 11),
(154, 'Se instalo la aplicacion saint administrativo en el equipo  BP-23156 de ingreso que estaba pendiente\r\nSe crea usuario saint a la lic Maria C Diaz \r\n\r\nRealizado por\r\nAndy Reyes', '2018-05-22', '1400', '1430', 1, 47, b'1', 11),
(155, 'En el area de presupuesto se realizo configuracion de dos maquinas que arrojaba estacion de trabajo  no agsinada\r\nBP-61153\r\nBP-61136\r\nanexo GLPI\r\n Realizado por \r\nAndy Reyes', '2018-05-22', '1430', '1500', 1, 47, b'1', 11),
(156, 'Se instalaron las aplicaciones saint administrativo y saint contabilidad en la pc BP-6189 en el departamento de contabilidad \r\nNOTA esta maquina estaba pendiente \r\nRealizado por \r\nAndy Reyes ', '2018-05-22', '900', '1200', 3, 45, b'1', 11),
(157, '1-. INSTALACION DE:\r\n-SQL SERVER 2014\r\n-SAINT ENTERPRISE ADMINISTRATIVO 9035\r\n-SAINT LICENSE MANAGER (SLM) 2.4\r\n-SAINT ENTERPRISE CONTABILIDAD\r\n-ACTIVACION DE LICENCIA PLUS  ENTP294434861712071\r\n2-.SE CREARON LOS USUARIOS EN EL MODULO ADMINISTRATIVOS: OSANCHEZ, PPACHINO, JLOPEZ, FNARANJO, RSANCHEZ, KMENESES, JULOPEZ\r\n3-. SE EXPLICO COMO CREAR DEPOSITOS, CLASIFICACION DE PRODUCTOS Y PRODUCTOS\r\n4-. SE DEJO COMO TAREA CARGAR LOS PRODUCTOS Y SUS CLASIFICACIONES.', '2018-05-24', '1400', '1740', 4, 55, b'1', 11),
(159, 'Se conecto vía remota con automotores para eliminación de facturas las cuales fueron guardadas en el sistema Saint mas nos fueron impresas detallo información:\r\n- Automotores los Próceres: factura 013202 y 013213 en este caso el SPOLER de la maquina fiscal no estaba activo \r\n- Automotores Fuerte Tiuna: factura *23495 se le cayo la VPN y las factura no se imprimian\r\n\r\nNota: Estos casos fueron dos en la mañana y uno en la tarde', '2018-05-28', '800', '1000', 2, 56, b'1', 10),
(160, '-Se conectaron las PC traídas de IPSFA Maracay a la red local de caracas se ingresaron a los módulos administrativo,banco,y venta y no arrojo ningún error.\r\n-Se insieron prueba de conexión vía VPN local a local  se conecto sin problemas y se ingreso al sistema Saint en los módulos administrativo,banco,y venta\r\n-Se insiero prueba de conexión vía VPN cantv se conecto sin problemas y se ingreso al sistema Saint en los módulos administrativo,banco,y venta', '2018-05-30', '930', '1400', 5, 56, b'1', 10),
(161, 'IPSFA ALQUILER CIUDAD BOLÍVAR\r\n\r\n-SE MODIFICARON LOS NÚMEROS DE CONTROL DE LAS SIGUIENTES FACTURAS: D00120015 A LA D0012057\r\n\r\n-SE MODIFICARON LOS NÚMEROS DE CONTROL DE LAS SIGUIENTES NOTAS DE CRÉDITOS :D0000098 A LA D0000102\r\n\r\n-EL PERSONAL NO HABÍA COLOCADO EL NUMERO DE CONTROL SEGÚN SU SERIE', '2018-05-31', '1000', '1200', 2, 58, b'1', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_solicitud`
--

CREATE TABLE `is_solicitud` (
  `id_solicitud` int(11) NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tipo_servicio` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `usuario_solicitante` int(11) DEFAULT NULL,
  `usuario_asignado` int(11) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_solicitud`
--

INSERT INTO `is_solicitud` (`id_solicitud`, `titulo`, `descripcion`, `fecha`, `id_tipo_servicio`, `id_sucursal`, `id_cliente`, `usuario_solicitante`, `usuario_asignado`, `activo`) VALUES
(1, '', 'ELIMINAR FACTURA 001674 Y SUS RETENCIONES Y PAGOS', '2017-05-17 19:43:27', 1, 2, 56, NULL, NULL, b'0'),
(2, 'PROYECTO IMPLEMENTACION DE SAINT', 'Implementación del Sistema Saint Enterprise', '2017-05-19 16:02:12', 2, 1, 79, NULL, NULL, b'1'),
(3, '', 'SE SOLICITA SOPORTE PARA GENERAR NC CORRESPONDIENTE AL CASO DEL PAGO EN $$ DEL 2015 DE PDVSA  POR UN MONTO DE 900MIL $$.\r\nPOR NEGOCIACIÓN DE OCAMAR CON EL CLIENTE SE ACUERDA REVERSAR TODOS LOS PAGOS EJECUTADOS SOBRE ESTA ORDEN DE PAGO Y REALIZAR NC PARA LA POSTERIOR POSTERIOR ENTREGA DE RELACIÓN DE FACTURAS A SER CANCELADAS', '2017-05-23 15:28:13', 2, 1, 4, NULL, NULL, b'0'),
(4, 'Instalacion de Router', 'Cambio de Router por presentar fallas de conexión ', '2017-05-23 19:04:37', 2, 2, 77, NULL, NULL, b'0'),
(5, 'CAMBIO DE CORRELATIVO DEL SISTEMA SAINT  ', 'CAMBIO DE CORRELATIVO DEL SISTEMA SAINT  CON RESPECTO A LA IMPRESORA FISCAL TANTO EN FACTURA COMO EN NOTAS DE CREDITOS', '2017-05-23 20:16:32', 1, 2, 65, NULL, NULL, b'0'),
(6, 'Solución al error de la conciliacion', 'Presentaba problema al cerrar una conciliacion', '2017-05-25 15:59:04', 1, 2, 34, NULL, NULL, b'0'),
(7, 'Requerimientos Saint', 'CASO SAINT. Al momento de la cancelacion se genero dos recibos de cajas 29721 y 29722 de la factura ALG-113543. favor eliminar uno. GLPI ID 21311', '2017-05-26 15:28:29', 1, 2, 34, NULL, NULL, b'0'),
(8, 'Problemas en la red', 'Problemas en la red', '2017-05-26 17:40:29', 2, 2, 77, NULL, NULL, b'0'),
(9, 'MODIFICACION EN RETENCION IVA ', 'MODIFICACION EN RETENCION IVA ', '2017-06-01 16:25:03', 2, 2, 37, NULL, NULL, b'0'),
(10, 'Actualizacion de tablas y Respaldos', 'Actualizacion de tablas y Respaldos', '2017-06-02 17:10:44', 2, 2, 4, NULL, NULL, b'0'),
(11, 'DIFERENCIA EN REPORTE DE TRANSACCIONES DE VENTA', 'DIFERENCIA EN REPORTE DE VENTAS', '2017-06-05 17:34:56', 2, 2, 4, NULL, NULL, b'0'),
(12, 'ERROR EN NUMERO DE RETENCION ISLR', 'AL REALIZAR LA RETENCION DE ISLR DESDE EL MODULO DE BANCO EL MISMO NO TRAE EL NUMERO DE FACTURA NI DE CONTROL', '2017-06-05 19:39:30', 2, 2, 37, NULL, NULL, b'1'),
(13, 'Respaldo y restauracion automatica de BD de los puertos', 'Respaldo y restauracion automatica de BD de los puertos', '2017-06-06 18:20:20', 2, 8, 4, NULL, NULL, b'0'),
(14, 'ERROR DE COMPROBANTE DE INTEGRACION DE COMPRAS  - BANAVIH ', 'Se recibe llamada telefónica de la Lic. Liliana\r\nSolicito revisión del contabilizado por error que presentaba el sistema al momento de integrar compras de MAY2017.\r\nIgualmente nos solicito revisar aporte patronal de Banavih, que no se mostraba en la nomina.', '2017-06-07 19:20:46', 2, 1, 56, NULL, NULL, b'0'),
(15, 'AJUSTE DE PORCENTAJE EN RETENCIONES DE IVA', '', '2017-06-08 15:06:15', 1, 1, 3, NULL, NULL, b'1'),
(16, 'AJUSTE DE PORCENTAJE EN RETENCIONES DE IVA', 'AJUSTE DE PORCENTAJE EN RETENCIONES DE IVA', '2017-06-08 15:08:03', 2, 2, 37, NULL, NULL, b'0'),
(17, 'Modificar correlativo fact saint', 'Modificar correlativo fact saint, ya que al llevarse la impresora fiscal para modificar el margen de los precios hicieron facturas fiscal las cuales aumentaron el correlativo.', '2017-06-09 15:55:46', 2, 2, 65, NULL, NULL, b'0'),
(18, 'AJUSTE DE ANTICIPOS', 'AJUSTE DE ANTICIPO ', '2017-06-09 16:25:18', 2, 2, 4, NULL, NULL, b'0'),
(19, 'CORRECCION DE NUMEROS DE CONTROL DE FACTURAS', 'SE REQUIERE LA CORRECCION EN EL SISTEMA SAINT, DE LOS NUMEROS DE CONTROL DE LAS FACTURAS Y NOTAS DE CREDITOS EMITIDAS DESDE EL SISTEMA SISALMA DESDE EL 25 DE MAYO HASTA LA PRESENTE FECHA, YA QUE SE PRESENTÓ UN SALTO EN EL CORRELATIVO DE LOS MISMOS.', '2017-06-13 17:16:21', 2, 2, 4, NULL, NULL, b'0'),
(20, 'Seguimiento al script de respaldo y restauracion', 'Seguimiento al script de respaldo y restauracion', '2017-06-14 15:42:11', 1, 2, 4, NULL, NULL, b'0'),
(21, 'Disco Duro Full', 'Se tranco el Sql por disco duro saturado', '2017-06-21 14:39:02', 2, 2, 15, NULL, NULL, b'0'),
(22, 'ERROR AL APLICAR ANTICIPO', 'ERROR AL APLICAR ANTICIPO', '2017-06-26 16:51:25', 2, 1, 4, NULL, NULL, b'0'),
(23, 'Ajuste de roles de usuario en Sucursal', 'Ajuste de roles de usuario en Sucursal a solicitud del Sr. Jonathan Pacheco', '2017-06-27 17:37:57', 2, 2, 65, NULL, NULL, b'0'),
(24, 'COMO REALIZAR LA TRANSACCIÓN DE UN CH DEVUELTO CXC', 'COMO REALIZAR LA TRANSACCIÓN DE UN CH DEVUELTO CXC', '2017-06-28 15:13:18', 2, 2, 4, NULL, NULL, b'0'),
(25, 'Conectividad de Almacen', 'Configuracion del servidor de Almacen', '2017-07-03 18:20:39', 2, 2, 4, NULL, NULL, b'1'),
(26, 'Modificar una Orden ', 'Modificar una orden', '2017-11-28 18:59:23', 1, 2, 37, NULL, NULL, b'0'),
(27, 'Actualizacion de Sistema', 'Actualizacion de Sistema', '2017-12-14 18:40:48', 1, 2, 39, NULL, NULL, b'0'),
(28, 'PROYECTO BOLIPUERTOS ', '', '2018-01-24 16:49:19', 2, 1, 34, NULL, NULL, b'0'),
(29, 'CONTRATOS DE SISTEMA SAINT EN EMPRESAS', '', '2018-02-02 13:45:07', 1, 1, 62, NULL, NULL, b'0'),
(30, 'CONTRATOS DE SISTEMA SAINT EN FARMACIA', '', '2018-02-02 13:45:34', 1, 1, 62, NULL, NULL, b'1'),
(31, 'INSTALACIÓN Y ADIESTRAMIENTO DEL SISTEMA SAINT ', 'INSTALACIÓN Y ADIESTRAMIENTO DEL SISTEMA SAINT ', '2018-02-16 16:36:33', 1, 2, 34, NULL, NULL, b'0'),
(32, 'INSTALACIÓN Y ADIESTRAMIENTO DEL SISTEMA SAINT', 'ASESORÍA, INSTALACIÓN, ACTUALIZACIÓN, ADIESTRAMIENTO DEL SISTEMA SAINT', '2018-02-28 15:05:59', 1, 1, 62, NULL, NULL, b'1'),
(33, 'INSTALACIÓN Y ADIESTRAMIENTO DEL SISTEMA SAINT', 'ASESORÍA, INSTALACIÓN, ACTUALIZACIÓN, ADIESTRAMIENTO DEL SISTEMA SAINT', '2018-02-28 15:06:00', 1, 1, 62, NULL, NULL, b'1'),
(34, 'Asesoria Saint (CASA EQUIPADA)', '', '2018-03-14 18:04:39', 1, 1, 62, NULL, NULL, b'0'),
(35, 'ADIESTRAMIENTOS INVERSORA IPSFA', 'ADIESTRAMIENTOS INVERSORA IPSFA', '2018-03-14 19:36:53', 1, 1, 79, NULL, NULL, b'0'),
(36, 'PROYECTO BOLIPUERTOS ', '', '2018-03-23 12:38:43', 2, 1, 34, NULL, NULL, b'0'),
(37, 'A', '', '2018-03-23 20:51:43', 1, 1, 34, NULL, NULL, b'0'),
(38, '', '', '2018-04-06 13:29:18', 2, 2, 34, NULL, NULL, b'0'),
(39, 'SOPORTE Y ASESORIA TRIMESTRAL', ' SOPORTE Y ASESORIA TRIMESTRAL', '2018-04-10 18:53:03', 1, 2, 4, NULL, NULL, b'0'),
(40, '', '', '2018-04-12 20:09:26', 2, 2, 34, NULL, NULL, b'0'),
(41, 'actualizacion version 9.0.3.5', 'realizacion de actualización del sistema saint enterprise administrativo de la version 9.0.3.1 a la versión 9.0.3.5 en 6 estaciones de trabajo y 1 servidor', '2018-04-16 14:20:24', 1, 2, 15, NULL, NULL, b'1'),
(42, 'ASESORÍA DEPARTAMENTO DE COMPRA  ', '', '2018-04-17 15:13:18', 2, 2, 34, NULL, NULL, b'0'),
(43, 'ASESORÍA DEPARTAMENTO DE COMPRA	', 'VERIFICACIÓN DE SISTEMA', '2018-04-18 12:50:43', 2, 2, 34, NULL, NULL, b'0'),
(44, 'A', '', '2018-04-20 17:01:14', 1, 1, 34, NULL, NULL, b'0'),
(45, 'soporte ', '', '2018-04-23 16:30:22', 2, 2, 34, NULL, NULL, b'1'),
(46, 'Soporte', 'GLPI- ID 23304', '2018-04-26 22:06:25', 1, 2, 34, NULL, NULL, b'0'),
(47, '', '', '2018-04-30 15:53:12', 1, 2, 34, NULL, NULL, b'0'),
(48, '', '', '2018-05-04 13:03:10', 2, 2, 4, NULL, NULL, b'1'),
(49, 'Configuracion', '', '2018-05-10 17:10:40', 2, 2, 15, NULL, NULL, b'0'),
(50, 'ASESORIA Y SOPORTE TECNICO', 'ASESORIA', '2018-05-10 18:26:56', 1, 2, 34, NULL, NULL, b'1'),
(51, 'ASESORIA', 'Cliente Book\r\n1-. Se modificó  factura  y Notas de Crédito Con el total en Bs. S. Vía remota', '2018-05-10 18:36:56', 1, 1, 0, NULL, NULL, b'1'),
(52, '', '', '2018-05-11 14:17:06', 1, 1, 62, NULL, NULL, b'0'),
(53, 'soporte tecnico', '', '2018-05-14 15:01:29', 2, 2, 34, NULL, NULL, b'0'),
(54, 'conexion', '', '2018-05-18 19:45:52', 2, 2, 34, NULL, NULL, b'0'),
(55, 'INSTALACION Y CONFIGURACION DE SISTEMA', 'INSTALACION Y CONFIGURACION DE SISTEMA', '2018-05-24 21:31:09', 2, 2, 80, NULL, NULL, b'1'),
(56, '', '', '2018-05-29 15:12:07', 1, 1, 62, NULL, NULL, b'0'),
(57, '', '', '2018-05-29 15:19:35', 1, 2, 35, NULL, NULL, b'1'),
(58, 'FACTURAS ', 'MODIFICACION', '2018-05-31 18:49:30', 1, 4, 62, NULL, NULL, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_sucursal`
--

CREATE TABLE `is_sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_sucursal`
--

INSERT INTO `is_sucursal` (`id_sucursal`, `descripcion`, `activo`) VALUES
(1, 'CARACAS', b'1'),
(2, 'LA GUAIRA', b'1'),
(3, 'PUERTO CABELLO', b'1'),
(4, 'PUERTO ORDAZ', b'1'),
(5, 'PORLAMAR', b'1'),
(6, 'MARACAIBO', b'1'),
(7, 'PUERTO LA CRUZ', b'1'),
(8, 'GUANTA', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_tipo_servicio`
--

CREATE TABLE `is_tipo_servicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_tipo_servicio`
--

INSERT INTO `is_tipo_servicio` (`id_tipo_servicio`, `descripcion`, `activo`) VALUES
(1, 'Asesoría', b'1'),
(2, 'Soporte Técnico', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `is_usuario`
--

CREATE TABLE `is_usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `respuesta_seguridad` varchar(1000) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefono` varchar(20) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_rol` int(11) NOT NULL DEFAULT '1',
  `id_pregunta` int(11) NOT NULL DEFAULT '1',
  `id_cliente` int(11) DEFAULT '1',
  `id_porcentaje` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `is_usuario`
--

INSERT INTO `is_usuario` (`id_usuario`, `usuario`, `correo`, `cedula`, `clave`, `nombre`, `apellido`, `sexo`, `respuesta_seguridad`, `fecha_registro`, `telefono`, `observacion`, `activo`, `id_rol`, `id_pregunta`, `id_cliente`, `id_porcentaje`) VALUES
(1, 'hleon', 'sirit20@gmail.com', '16509142', '9a3fb0d04e7b2df161e612b09e1aa023', 'Hilger', 'Leon', 'M', 'ccs', '2017-04-12 17:51:46', NULL, NULL, 1, 3, 1, 1, 0),
(3, 'ymartinez', 'yusbeilimartinez.issca@gmail.com', '15779971', '8751724c9a35da98229f2347284f9cfc', 'Yusbeili', 'Martinez', 'F', 'hayde', '2017-05-08 11:28:14', NULL, NULL, 1, 3, 2, 3, 0),
(4, 'ibrahinr', 'ibrahinr@gmail.com', '15947674', '5e5b158b29d1655feec2dcddb1c3d789', 'Ibrahin', 'Resplandor', 'M', 'caracas', '2017-05-18 13:04:22', NULL, 'Innova', 1, 3, 1, 35, 0),
(5, 'MFUENTES', 'mariangelfuentes@gmail.com', '10575633', '3e5f9f19a11d82749f8120ad7111339e', 'MARIA DE LOS ANGELES', 'FUENTES', 'F', 'CARMEN', '2017-05-23 11:20:22', NULL, 'INNOVA SOLUCIONES Y SISTEMA', 1, 3, 2, 35, 0),
(6, 'RMUJICAS', 'rams080165@gmail.com', '6861995', '92386ab285a8328467744775799f8986', 'REINALDO', 'MUJICA', 'M', 'YOLANDA', '2017-06-13 12:41:27', NULL, 'INNOVA SOLUCIONES Y SISTEMAS C.A.', 1, 2, 2, 35, 0),
(7, 'Gtovar', 'Gtovar.issca@gmail.com', 'V-20192934', 'd5b88eda1b22d4b8da4bdf594023a73c', 'Genesis ', 'Tovar', 'F', 'Aida ', '2018-01-23 17:49:01', NULL, 'Innova ', 1, 3, 2, 35, 0),
(8, 'Aescalona', 'Aescalona.issca@gmail.com', '19444419', 'b57741a8e44fbd8a9304032477e5c670', 'Airam', 'Escalona', 'F', 'Teresita', '2018-01-23 17:51:20', NULL, 'Innova', 1, 3, 2, 35, 0),
(9, 'Aescalona1', 'Aescalona3020@gmail.com', '19444419', 'b57741a8e44fbd8a9304032477e5c670', 'Airam', 'Escalona', 'F', 'Teresita', '2018-01-23 17:52:36', NULL, 'Innova', 0, 1, 2, 1, 0),
(10, 'AREYES', 'AREYES.ISSCA@GMAIL.COM', '15846560', '9b4682be3c243b728aae98bfab414f58', 'ANDY', 'REYES', 'M', 'CARUPANO', '2018-02-02 13:51:54', NULL, 'INNOVA', 1, 3, 1, 3, 0),
(11, 'FDIAZ', 'fdiaz.issca@gmail.com', '15267132', '3bde62c32d4b3a395392c900f84ec168', 'FRADDY', 'DIAZ', 'F', 'GUAIRA', '2018-03-08 19:38:36', NULL, 'INNOVA', 1, 3, 1, 35, 0),
(12, 'RCOLINA', 'RCOLINA.ISSCA@GMAIL.COM', '20827170', '9c2529b719b5c946b05fd2099c404e1f', 'RAQUEL', 'COLINA', 'F', 'CARACAS', '2018-03-08 19:40:33', NULL, 'INNOVA', 1, 2, 1, 3, 0),
(13, 'mdiaz', 'mdiaz.issca@gmail.com', '18140453', 'bb422fbda17ee83c1d33f72b12cd5c88', 'MARIANN', 'DIAZ', 'F', 'LA GUAIRA', '2018-03-20 20:32:15', NULL, 'INNOVA SOLUCIONES Y SISTEMAS C.A', 0, 1, 1, 1, 0),
(14, 'YUSBEILI', 'yuba583@hotmail.com', '15779971', '97fabdd9b0748d5e3ce7edcd7fa59ea7', 'YUSBEILI ', 'MARTINEZ', 'F', 'NADA', '2018-05-02 15:43:04', NULL, 'INNOVA', 1, 3, 1, 3, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `is_accion`
--
ALTER TABLE `is_accion`
  ADD PRIMARY KEY (`id_accion`);

--
-- Indices de la tabla `is_cliente`
--
ALTER TABLE `is_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `fk_cliente_costo` (`id_costo`),
  ADD KEY `fk_cliente_porcentaje` (`id_porcentaje`);

--
-- Indices de la tabla `is_costo`
--
ALTER TABLE `is_costo`
  ADD PRIMARY KEY (`id_costo`);

--
-- Indices de la tabla `is_departamento`
--
ALTER TABLE `is_departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `is_facturacion`
--
ALTER TABLE `is_facturacion`
  ADD PRIMARY KEY (`id_facturacion`);

--
-- Indices de la tabla `is_facturacion_servicio`
--
ALTER TABLE `is_facturacion_servicio`
  ADD KEY `fk_facturacion_servicio1` (`id_servicio`),
  ADD KEY `fk_facturacion_servicio2` (`id_facturacion`);

--
-- Indices de la tabla `is_permisos`
--
ALTER TABLE `is_permisos`
  ADD KEY `fk_usuario_cliente` (`id_cliente`),
  ADD KEY `fk_usuario_rol` (`id_rol`);

--
-- Indices de la tabla `is_porcentaje`
--
ALTER TABLE `is_porcentaje`
  ADD PRIMARY KEY (`id_porcentaje`);

--
-- Indices de la tabla `is_pregunta`
--
ALTER TABLE `is_pregunta`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `is_rol`
--
ALTER TABLE `is_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `is_rol_accion`
--
ALTER TABLE `is_rol_accion`
  ADD PRIMARY KEY (`id_accion`,`id_rol`),
  ADD KEY `fk_rol_accion1` (`id_rol`);

--
-- Indices de la tabla `is_servicio`
--
ALTER TABLE `is_servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_servicio_solicitud` (`id_solicitud`),
  ADD KEY `fk_servicio_usuario` (`id_usuario`);

--
-- Indices de la tabla `is_solicitud`
--
ALTER TABLE `is_solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `fk_solicitud_sucursal` (`id_sucursal`),
  ADD KEY `fk_solicitud_cliente` (`id_cliente`);

--
-- Indices de la tabla `is_sucursal`
--
ALTER TABLE `is_sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `is_tipo_servicio`
--
ALTER TABLE `is_tipo_servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indices de la tabla `is_usuario`
--
ALTER TABLE `is_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario1` (`id_pregunta`),
  ADD KEY `fk_usuario2` (`id_rol`),
  ADD KEY `fk_usuario3` (`id_cliente`),
  ADD KEY `fk_usuario_porcentaje` (`id_porcentaje`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `is_accion`
--
ALTER TABLE `is_accion`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT de la tabla `is_cliente`
--
ALTER TABLE `is_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT de la tabla `is_costo`
--
ALTER TABLE `is_costo`
  MODIFY `id_costo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `is_departamento`
--
ALTER TABLE `is_departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `is_facturacion`
--
ALTER TABLE `is_facturacion`
  MODIFY `id_facturacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `is_porcentaje`
--
ALTER TABLE `is_porcentaje`
  MODIFY `id_porcentaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `is_pregunta`
--
ALTER TABLE `is_pregunta`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `is_rol`
--
ALTER TABLE `is_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `is_servicio`
--
ALTER TABLE `is_servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT de la tabla `is_solicitud`
--
ALTER TABLE `is_solicitud`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT de la tabla `is_sucursal`
--
ALTER TABLE `is_sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `is_tipo_servicio`
--
ALTER TABLE `is_tipo_servicio`
  MODIFY `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `is_usuario`
--
ALTER TABLE `is_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `is_cliente`
--
ALTER TABLE `is_cliente`
  ADD CONSTRAINT `fk_cliente_costo` FOREIGN KEY (`id_costo`) REFERENCES `is_costo` (`id_costo`),
  ADD CONSTRAINT `fk_cliente_porcentaje` FOREIGN KEY (`id_porcentaje`) REFERENCES `is_porcentaje` (`id_porcentaje`);

--
-- Filtros para la tabla `is_facturacion_servicio`
--
ALTER TABLE `is_facturacion_servicio`
  ADD CONSTRAINT `fk_facturacion_servicio1` FOREIGN KEY (`id_servicio`) REFERENCES `is_servicio` (`id_servicio`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_facturacion_servicio2` FOREIGN KEY (`id_facturacion`) REFERENCES `is_facturacion` (`id_facturacion`);

--
-- Filtros para la tabla `is_permisos`
--
ALTER TABLE `is_permisos`
  ADD CONSTRAINT `fk_usuario_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `is_cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `is_rol` (`id_rol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `is_rol_accion`
--
ALTER TABLE `is_rol_accion`
  ADD CONSTRAINT `fk_rol_accion1` FOREIGN KEY (`id_rol`) REFERENCES `is_rol` (`id_rol`),
  ADD CONSTRAINT `fk_rol_accion2` FOREIGN KEY (`id_accion`) REFERENCES `is_accion` (`id_accion`);

--
-- Filtros para la tabla `is_servicio`
--
ALTER TABLE `is_servicio`
  ADD CONSTRAINT `fk_servicio_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `is_solicitud` (`id_solicitud`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_servicio_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `is_usuario` (`id_usuario`);

--
-- Filtros para la tabla `is_solicitud`
--
ALTER TABLE `is_solicitud`
  ADD CONSTRAINT `fk_solicitud_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `is_cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_solicitud_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `is_sucursal` (`id_sucursal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `is_usuario`
--
ALTER TABLE `is_usuario`
  ADD CONSTRAINT `fk_usuario1` FOREIGN KEY (`id_pregunta`) REFERENCES `is_pregunta` (`id_pregunta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario2` FOREIGN KEY (`id_rol`) REFERENCES `is_rol` (`id_rol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario3` FOREIGN KEY (`id_cliente`) REFERENCES `is_cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_porcentaje` FOREIGN KEY (`id_porcentaje`) REFERENCES `is_porcentaje` (`id_porcentaje`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
