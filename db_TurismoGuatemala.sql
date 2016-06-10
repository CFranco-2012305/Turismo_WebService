/*
SQLyog Trial v12.2.3 (32 bit)
MySQL - 10.1.13-ViJuK : Database - db_TurismoGuatemala
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_TurismoGuatemala` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_TurismoGuatemala`;

/*Table structure for table `archivo` */

DROP TABLE IF EXISTS `archivo`;

CREATE TABLE `archivo` (
  `id_Archivo` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `tipo_Contenido` VARCHAR(255) DEFAULT NULL,
  `contenido` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id_Archivo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `archivo` */

/*Table structure for table `atraccion` */

DROP TABLE IF EXISTS `atraccion`;

CREATE TABLE `atraccion` (
  `id_Atraccion` INT(10) NOT NULL AUTO_INCREMENT,
  `costo` DOUBLE DEFAULT NULL,
  `tiempoVisita` VARCHAR(255) DEFAULT NULL,
  `reservacion` VARCHAR(255) DEFAULT NULL,
  `numero` INT(20) DEFAULT NULL,
  `id_Lugar` INT(10) DEFAULT NULL,
  `id_Archivo` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id_Atraccion`),
  KEY `id_Lugar` (`id_Lugar`),
  KEY `id_Archivo` (`id_Archivo`),
  CONSTRAINT `atraccion_ibfk_1` FOREIGN KEY (`id_Lugar`) REFERENCES `lugar` (`id_Lugar`),
  CONSTRAINT `atraccion_ibfk_2` FOREIGN KEY (`id_Archivo`) REFERENCES `archivo` (`id_Archivo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `atraccion` */

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `id_Hotel` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `numero` INT(20) DEFAULT NULL,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `direccion` VARCHAR(255) DEFAULT NULL,
  `id_Lugar` INT(10) DEFAULT NULL,
  `id_Archivo` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id_Hotel`),
  KEY `id_Lugar` (`id_Lugar`),
  KEY `id_Archivo` (`id_Archivo`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_Lugar`) REFERENCES `lugar` (`id_Lugar`),
  CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`id_Archivo`) REFERENCES `archivo` (`id_Archivo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `hotel` */

/*Table structure for table `lugar` */

DROP TABLE IF EXISTS `lugar`;

CREATE TABLE `lugar` (
  `id_Lugar` INT(10) NOT NULL AUTO_INCREMENT,
  `departamentoEstado` VARCHAR(255) DEFAULT NULL,
  `direccion` VARCHAR(255) DEFAULT NULL,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `id_Archivo` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id_Lugar`),
  KEY `id_Archivo` (`id_Archivo`),
  CONSTRAINT `lugar_ibfk_1` FOREIGN KEY (`id_Archivo`) REFERENCES `archivo` (`id_Archivo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `lugar` */

/*Table structure for table `mapa` */

DROP TABLE IF EXISTS `mapa`;

CREATE TABLE `mapa` (
  `id_Mapa` INT(10) NOT NULL AUTO_INCREMENT,
  `origen` VARCHAR(255) DEFAULT NULL,
  `destino` VARCHAR(255) DEFAULT NULL,
  `id_Archivo` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id_Mapa`),
  KEY `id_Archivo` (`id_Archivo`),
  CONSTRAINT `mapa_ibfk_1` FOREIGN KEY (`id_Archivo`) REFERENCES `archivo` (`id_Archivo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `mapa` */

/*Table structure for table `restaurante` */

DROP TABLE IF EXISTS `restaurante`;

CREATE TABLE `restaurante` (
  `id_Restaurante` INT(10) NOT NULL AUTO_INCREMENT,
  `pagina` VARCHAR(255) DEFAULT NULL,
  `numero` VARCHAR(255) DEFAULT NULL,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `id_Lugar` INT(10) DEFAULT NdULL,
  `id_Archivo` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id_Restaurante`),
  KEY `id_Lugar` (`id_Lugar`),
  KEY `id_Archivo` (`id_Archivo`),
  CONSTRAINT `restaurante_ibfk_1` FOREIGN KEY (`id_Lugar`) REFERENCES `lugar` (`id_Lugar`),
  CONSTRAINT `restaurante_ibfk_2` FOREIGN KEY (`id_Archivo`) REFERENCES `archivo` (`id_Archivo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `restaurante` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id_Rol` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id_Rol`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_Usuario` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `correo` VARCHAR(255) DEFAULT NULL,
  `contraseña` VARCHAR(255) DEFAULT NULL,
  `nick` VARCHAR(255) DEFAULT NULL,
  `telefono` INT(15) DEFAULT NULL,
  `nacionalidad` VARCHAR(255) DEFAULT NULL,
  `id_Rol` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`),
  KEY `id_Rol` (`id_Rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_Rol`) REFERENCES `rol` (`id_Rol`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

INSERT  INTO `rol`(`id_Usuario`,`nombre`,`descripcion`) VALUES (1,'Amin','control');


INSERT  INTO `usuario`(`id_Usuario`,`nombre`,`correo`,`contraseña`,`nick`,`telefono`,`nacionalidad`,`id_Rol`) VALUES (1,'carlos Franco','vijuk@outlook.com','contraseña','VIJUK',11111111,'Guatemala',1);
INSERT  INTO `usuario`(`id_Usuario`,`nombre`,`correo`,`contraseña`,`nick`,`telefono`,`nacionalidad`,`id_Rol`) VALUES (2,'Pablo Franco','pabloalejandrofranco@outlook.com','contraseña','alefranco',11111111,'Guatemala',1);
INSERT  INTO `usuario`(`id_Usuario`,`nombre`,`correo`,`contraseña`,`nick`,`telefono`,`nacionalidad`,`id_Rol`) VALUES (3,'Emmanuel Franco','emamma@outlook.com','contraseña','EMMA',11111111,'Guatemala',1);
INSERT  INTO `usuario`(`id_Usuario`,`nombre`,`correo`,`contraseña`,`nick`,`telefono`,`nacionalidad`,`id_Rol`) VALUES (4,'Joel perez','tayson@outlook.com','contraseña','TAYSON',11111111,'Guatemala',1);
INSERT  INTO `usuario`(`id_Usuario`,`nombre`,`correo`,`contraseña`,`nick`,`telefono`,`nacionalidad`,`id_Rol`) VALUES (5,'JOUSE us','us@outlook.com','contraseña','US',11111111,'Guatemala',1);
INSERT  INTO `usuario`(`id_Usuario`,`nombre`,`correo`,`contraseña`,`nick`,`telefono`,`nacionalidad`,`id_Rol`) VALUES (6,'Pablo chokon','chokon@outlook.com','contraseña','PHANTON',11111111,'Guatemala',1);


/* Procedure structure for procedure `sp_autenticarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_autenticarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticarUsuario`(IN _nick varchar(128),in _contraseña varchar(128))
BEGIN
	select nombre,correo,nick from usuario where usuario.`nick`=_nick and usuario.`contraseña`=md5(_contraseña);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listaUsuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listaUsuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listacontactos`(in _id_Rol int)
BEGIN
	SELECT usuario.id_Usuario,usuario.nombre,usuario.correo,usuario.nick,usuario.direccion,usuario.nombre,usuario.telefono,rol.nombre AS  rol,rol.id_Rol FROM usuario
	LEFT JOIN rol ON rol.id_Rol=usuario.id_Rol
	where rol.id_Rol=_id_Rol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_registroUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_registroUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registroUsuario`(IN _nombre varchar(128),IN _correo varchar(128),in _nick varchar(128),_contraseña varchar(128),in _direccion varchar(128),in _telefono int(11),in _rol int)
BEGIN
	insert into usuario values(null,_nombre,_correo,_nick,md5(_contraseña),_direccion,_telefono,2);
    END */$$
DELIMITER ;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;`cdcol`
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;