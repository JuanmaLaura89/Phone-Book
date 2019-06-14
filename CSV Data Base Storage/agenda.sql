-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 13-06-2019 a las 15:10:17
-- Versión del servidor: 5.0.45
-- Versión de PHP: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `agenda`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `correo`
-- 

CREATE TABLE `correo` (
  `IdContact` int(10) NOT NULL,
  `EMailAddress` varchar(255) NOT NULL,
  `EmailType` varchar(12) NOT NULL,
  PRIMARY KEY  (`IdContact`,`EMailAddress`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `correo`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `direccion`
-- 

CREATE TABLE `direccion` (
  `IdContact` int(10) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  PRIMARY KEY  (`IdContact`,`Address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `direccion`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `persona`
-- 

CREATE TABLE `persona` (
  `IdContact` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `BirdtDate` date NOT NULL,
  PRIMARY KEY  (`IdContact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `persona`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `telefono`
-- 

CREATE TABLE `telefono` (
  `IdContact` int(10) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `PhoneType` varchar(8) NOT NULL,
  PRIMARY KEY  (`IdContact`,`PhoneNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `telefono`
-- 

