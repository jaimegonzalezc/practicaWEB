-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 192.168.0.12    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Calendario`
--

DROP TABLE IF EXISTS `Calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calendario` (
  `FechaIni` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Estado` char(45) DEFAULT NULL,
  `Empleado_Usuarios_DNI` varchar(9) NOT NULL,
  `Recursos_humanos_Usuarios_DNI` varchar(9) NOT NULL,
  PRIMARY KEY (`Empleado_Usuarios_DNI`,`Recursos_humanos_Usuarios_DNI`),
  KEY `fk_Calendario_Empleado1_idx` (`Empleado_Usuarios_DNI`),
  KEY `fk_Calendario_Recursos_humanos1_idx` (`Recursos_humanos_Usuarios_DNI`),
  KEY `Primario` (`FechaIni`,`FechaFin`,`Empleado_Usuarios_DNI`),
  CONSTRAINT `fk_Calendario_Empleado1` FOREIGN KEY (`Empleado_Usuarios_DNI`) REFERENCES `Empleado` (`Usuarios_DNI`),
  CONSTRAINT `fk_Calendario_Recursos_humanos1` FOREIGN KEY (`Recursos_humanos_Usuarios_DNI`) REFERENCES `Recursos_humanos` (`Usuarios_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendario`
--

LOCK TABLES `Calendario` WRITE;
/*!40000 ALTER TABLE `Calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `Usuarios_DNI` varchar(9) NOT NULL,
  PRIMARY KEY (`Usuarios_DNI`),
  CONSTRAINT `fk_Empleados_Trabajadores1` FOREIGN KEY (`Usuarios_DNI`) REFERENCES `Usuarios` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_estan_proyectos`
--

DROP TABLE IF EXISTS `Empleados_estan_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_estan_proyectos` (
  `Poyectos_idPoyectos` int NOT NULL,
  `Empleados_Trabajadores_DNI` varchar(9) NOT NULL,
  `Horas` int DEFAULT NULL,
  PRIMARY KEY (`Poyectos_idPoyectos`,`Empleados_Trabajadores_DNI`),
  KEY `fk_Trabajadores_estan_proyectos_Empleados1_idx` (`Empleados_Trabajadores_DNI`),
  CONSTRAINT `fk_Trabajadores_estan_proyectos_Empleados1` FOREIGN KEY (`Empleados_Trabajadores_DNI`) REFERENCES `Empleado` (`Usuarios_DNI`),
  CONSTRAINT `fk_Trabajadores_estan_proyectos_Poyectos1` FOREIGN KEY (`Poyectos_idPoyectos`) REFERENCES `Poyectos` (`idPoyectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_estan_proyectos`
--

LOCK TABLES `Empleados_estan_proyectos` WRITE;
/*!40000 ALTER TABLE `Empleados_estan_proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleados_estan_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `CIF` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  PRIMARY KEY (`CIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa_tiene_proyectos`
--

DROP TABLE IF EXISTS `Empresa_tiene_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa_tiene_proyectos` (
  `Empresa_CIF` int NOT NULL,
  `Poyectos_idPoyectos` int NOT NULL,
  PRIMARY KEY (`Empresa_CIF`,`Poyectos_idPoyectos`),
  KEY `fk_Empresa_tiene_proyectos_Poyectos1_idx` (`Poyectos_idPoyectos`),
  CONSTRAINT `fk_Empresa_tiene_proyectos_Empresa` FOREIGN KEY (`Empresa_CIF`) REFERENCES `Empresa` (`CIF`),
  CONSTRAINT `fk_Empresa_tiene_proyectos_Poyectos1` FOREIGN KEY (`Poyectos_idPoyectos`) REFERENCES `Poyectos` (`idPoyectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa_tiene_proyectos`
--

LOCK TABLES `Empresa_tiene_proyectos` WRITE;
/*!40000 ALTER TABLE `Empresa_tiene_proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empresa_tiene_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poyectos`
--

DROP TABLE IF EXISTS `Poyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Poyectos` (
  `idPoyectos` int NOT NULL,
  `FechaIni` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPoyectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poyectos`
--

LOCK TABLES `Poyectos` WRITE;
/*!40000 ALTER TABLE `Poyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Poyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recursos_humanos`
--

DROP TABLE IF EXISTS `Recursos_humanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recursos_humanos` (
  `Usuarios_DNI` varchar(9) NOT NULL,
  KEY `fk_Recursos_humanos_Usuarios1_idx` (`Usuarios_DNI`),
  CONSTRAINT `fk_Recursos_humanos_Usuarios1` FOREIGN KEY (`Usuarios_DNI`) REFERENCES `Usuarios` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recursos_humanos`
--

LOCK TABLES `Recursos_humanos` WRITE;
/*!40000 ALTER TABLE `Recursos_humanos` DISABLE KEYS */;
INSERT INTO `Recursos_humanos` VALUES ('41414141E');
/*!40000 ALTER TABLE `Recursos_humanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `DNI` varchar(9) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  `Departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES ('41414141E','Mario','Gutierrez',23213123,'dfsdffds','123456789','Recursos Humanos');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 23:44:59
