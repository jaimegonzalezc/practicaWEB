-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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

CREATE SCHEMA mydb;

USE mydb;


DROP TABLE IF EXISTS `Calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calendario` (
  `FechaIni` datetime NOT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Estado` char(45) DEFAULT NULL,
  `Empleado_Usuarios_DNI` varchar(9) NOT NULL,
  `Recursos_humanos_Usuarios_DNI` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`Empleado_Usuarios_DNI`,`FechaIni`),
  KEY `fk_Calendario_Empleado1_idx` (`Empleado_Usuarios_DNI`),
  KEY `fk_Calendario_Recursos_humanos1_idx` (`Recursos_humanos_Usuarios_DNI`),
  KEY `Primario` (`FechaIni`,`FechaFin`,`Empleado_Usuarios_DNI`),
  CONSTRAINT `fk_Calendario_Empleado1` FOREIGN KEY (`Empleado_Usuarios_DNI`) REFERENCES `Empleado` (`Usuarios_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendario`
--

LOCK TABLES `Calendario` WRITE;
/*!40000 ALTER TABLE `Calendario` DISABLE KEYS */;
INSERT INTO `Calendario` VALUES ('2021-01-20 10:00:00','2021-01-20 12:30:00','Cita Médica','Pendiente','09192134T',''),('2021-01-21 08:00:00','2021-01-22 08:00:00','Baja por Enfermedad','Pendiente','14031482X',''),('2021-01-19 08:00:00','2021-01-26 08:00:00','Vacaciones','Pendiente','29178375T',''),('2021-01-25 14:00:00','2021-01-25 18:00:00','Asistencia Actividad Escolar Hijo/a','Pendiente','43129384Z',''),('2021-01-29 08:00:00','2021-02-19 08:00:00','Vacaciones','Pendiente','88582816H','');
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
INSERT INTO `Empleado` VALUES ('04736798V'),('09192134T'),('11048449P'),('12467442Q'),('14031482X'),('14609728J'),('16566487R'),('24279390S'),('27100634X'),('29178375T'),('29575254Z'),('31397981Z'),('34423305X'),('34755255R'),('36584871J'),('42697238S'),('43129384Z'),('43448118Z'),('48719030Q'),('48762797Z'),('52095501H'),('55197048S'),('56076979N'),('61033398T'),('64604119V'),('65470411Z'),('67751808H'),('69235870M'),('73299779K'),('76117277L'),('76150589G'),('77799542H'),('78024326T'),('78414747L'),('86678371L'),('87695338H'),('88571987E'),('88582816H'),('88696373R'),('88773836T'),('89112665Q'),('90939505N'),('92754069Z'),('93770032K'),('94172699G'),('95984896P'),('96073721F'),('97429213V'),('98451907Q'),('99352482A'),('99629091Z');
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_estan_proyectos`
--

DROP TABLE IF EXISTS `Empleados_estan_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_estan_proyectos` (
  `Proyectos_idProyectos` int NOT NULL AUTO_INCREMENT,
  `Empleados_Trabajadores_DNI` varchar(9) NOT NULL,
  `Horas` int DEFAULT NULL,
  PRIMARY KEY (`Proyectos_idProyectos`,`Empleados_Trabajadores_DNI`),
  CONSTRAINT `fk_Trabajadores_estan_proyectos_Poyectos1` FOREIGN KEY (`Proyectos_idProyectos`) REFERENCES `Proyectos` (`idProyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_estan_proyectos`
--

LOCK TABLES `Empleados_estan_proyectos` WRITE;
/*!40000 ALTER TABLE `Empleados_estan_proyectos` DISABLE KEYS */;
INSERT INTO `Empleados_estan_proyectos` VALUES (1,'27100634X',2),(1,'29178375T',10),(1,'52095501H',4),(1,'64604119V',6),(1,'88571987E',0),(1,'96073721F',24),(1,'98451907Q',11),(2,'14609728J',4),(2,'34423305X',22),(2,'36584871J',15),(2,'43448118Z',15),(2,'48762797Z',3),(2,'61033398T',24),(2,'65470411Z',21),(2,'73299779K',5),(2,'76117277L',14),(2,'78414747L',8),(2,'86678371L',25),(2,'88696373R',12),(2,'93770032K',21),(2,'95984896P',15),(3,'24279390S',0),(3,'55197048S',5),(3,'69235870M',5),(3,'87695338H',22),(3,'88582816H',15),(3,'90939505N',16),(3,'94172699G',0),(3,'99352482A',18),(4,'12467442Q',0),(4,'34755255R',3),(4,'42697238S',13),(4,'67751808H',23),(4,'78024326T',13),(5,'11048449P',23),(5,'31397981Z',18),(5,'48719030Q',18),(5,'76150589G',9),(5,'77799542H',8),(5,'88773836T',6),(5,'97429213V',23),(6,'04736798V',18),(6,'09192134T',19),(6,'14031482X',23),(6,'16566487R',1),(6,'29575254Z',9),(6,'43129384Z',21),(6,'56076979N',20),(6,'89112665Q',7),(6,'92754069Z',18),(6,'99629091Z',5);
/*!40000 ALTER TABLE `Empleados_estan_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `CIF` varchar(9) NOT NULL,
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
INSERT INTO `Empresa` VALUES ('B84452978','10 FOOT WORLD ESPAÑA SL','C/ San Juan De La Cruz 2',28223,'Pozuelo De Alarcon','Madrid',902543213),('B86562311','1 MAS 1 COMUNICACION SL','C/ Puenteareas 1 Esc.iz 1º 11',28002,'Madrid','Madrid',902543211),('B86813110','09 MICRAS SL','C/ Veronica, Numero 55, 21a',28440,'Guadarrama','Madrid',902543210),('B86904208','2013 COMMONS SL','C/ Almanzora 26',28023,'Madrid','Madrid',902543215),('B86949401','10 ATMOSFERAS ESTUDIO SL','C/ Fuencarral Numero 139, 4c',28010,'Madrid','Madrid',902543212),('B87219895','1LIFEOL SL','Paseo Conde De Los Gaitanes, 53 - Casa 2',28109,'Alcobendas','Madrid',902543214);
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa_tiene_proyectos`
--

DROP TABLE IF EXISTS `Empresa_tiene_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa_tiene_proyectos` (
  `Proyectos_idProyectos` int NOT NULL AUTO_INCREMENT,
  `Empresa_CIF` varchar(9) NOT NULL,
  PRIMARY KEY (`Proyectos_idProyectos`,`Empresa_CIF`),
  KEY `fk_Empresa_tiene_proyectos_Poyectos1_idx` (`Proyectos_idProyectos`),
  KEY `fk_Empresa_tiene_proyectos_Empresa1_idx` (`Empresa_CIF`),
  CONSTRAINT `fk_Empresa_tiene_proyectos_Empresa1` FOREIGN KEY (`Empresa_CIF`) REFERENCES `Empresa` (`CIF`),
  CONSTRAINT `fk_Empresa_tiene_proyectos_Poyectos1` FOREIGN KEY (`Proyectos_idProyectos`) REFERENCES `Proyectos` (`idProyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa_tiene_proyectos`
--

LOCK TABLES `Empresa_tiene_proyectos` WRITE;
/*!40000 ALTER TABLE `Empresa_tiene_proyectos` DISABLE KEYS */;
INSERT INTO `Empresa_tiene_proyectos` VALUES (1,'B84452978'),(2,'B86562311'),(3,'B86813110'),(4,'B86904208'),(5,'B86949401'),(6,'B87219895');
/*!40000 ALTER TABLE `Empresa_tiene_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyectos`
--

DROP TABLE IF EXISTS `Proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proyectos` (
  `idProyectos` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `FechaIni` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idProyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyectos`
--

LOCK TABLES `Proyectos` WRITE;
/*!40000 ALTER TABLE `Proyectos` DISABLE KEYS */;
INSERT INTO `Proyectos` VALUES (1,'Creación Programa gestión','Descripcion del proyecto numero 1','2021-01-02','2021-01-18'),(2,'Creación base de datos','Descripcion del proyecto numero 2','2021-01-02','2021-01-08'),(3,'Mejora SGBD propietario','Descripcion del proyecto numero 3','2021-01-06','2021-01-16'),(4,'Creación Página Web Pública','Descripcion del proyecto numero 4','2021-01-01','2021-01-14'),(5,'Aplicación Web Gestión Servidores','Descripcion del proyecto numero 5','2021-01-06','2021-01-13'),(6,'Desarrollo librería Java propietaria','Descripcion del proyecto numero 6','2021-01-03','2021-01-22');
/*!40000 ALTER TABLE `Proyectos` ENABLE KEYS */;
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
INSERT INTO `Recursos_humanos` VALUES ('00658957F'),('01789952T'),('04547919Z'),('06353369X'),('08177467R'),('15510863P'),('16714169T'),('18859981G'),('20274811N'),('27241752T'),('27245623F'),('27381399Z'),('28221072A'),('29331692E'),('29906649W'),('29926877J'),('30190249N'),('33198947B'),('35168941D'),('35551896Z'),('37433151F'),('41525689V'),('47102529R'),('47232621M'),('48065756B'),('49413892W'),('54891198L'),('55004209P'),('55511965Q'),('58172047X'),('60454749P'),('60626019C'),('66370250R'),('66692500K'),('66804832K'),('67949644P'),('69614823X'),('71681785P'),('72144663B'),('72535310A'),('73657648X'),('76506273Q'),('84028999V'),('84890631T'),('85788245Q'),('91728249V'),('95068159M'),('97602472V'),('97821731V');
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
INSERT INTO `Usuarios` VALUES ('00658957F','Jose','Jimenez',916584308,'jose.jimenez@gmail.com','jimenezjose1234','Recursos Humanos'),('01789952T','Maria','Moreno',916584296,'maria.moreno@gmail.com','morenomaria1234','Recursos Humanos'),('04547919Z','Antonio','Martin',916584243,'antonio.martin@gmail.com','martinantonio1234','Recursos Humanos'),('04736798V','Jose','Hernandez',916584310,'jose.hernandez@gmail.com','hernandezjose1234','Tecnico'),('06353369X','Maria Carmen','Sanchez',916584256,'mariacarmen.sanchez@gmail.com','sanchezmariacarmen1234','Recursos Humanos'),('08177467R','Manuel','Rodriguez',916584267,'manuel.rodriguez@gmail.com','rodriguezmanuel1234','Recursos Humanos'),('09192134T','Manuel','Sanchez',916584272,'manuel.sanchez@gmail.com','sanchezmanuel1234','Tecnico'),('11048449P','Antonio','Diaz',916584247,'antonio.diaz@gmail.com','diazantonio1234','Tecnico'),('12467442Q','Antonio','Ruiz',916584245,'antonio.ruiz@gmail.com','ruizantonio1234','Tecnico'),('14031482X','Carmen','Martin',916584323,'carmen.martin@gmail.com','martincarmen1234','Tecnico'),('14609728J','Maria','Garcia',916584282,'maria.garcia@gmail.com','garciamaria1234','Tecnico'),('15510863P','Antonio','Hernandez',916584246,'antonio.hernandez@gmail.com','hernandezantonio1234','Recursos Humanos'),('16566487R','Carmen','Diaz',916584327,'carmen.diaz@gmail.com','diazcarmen1234','Tecnico'),('16714169T','Carmen','Gomez',916584322,'carmen.gomez@gmail.com','gomezcarmen1234','Recursos Humanos'),('18859981G','Jose','Fernandez',916584301,'jose.fernandez@gmail.com','fernandezjose1234','Recursos Humanos'),('20274811N','Antonio','Rodriguez',916584235,'antonio.rodriguez@gmail.com','rodriguezantonio1234','Recursos Humanos'),('24279390S','Carmen','Alvarez',916584329,'carmen.alvarez@gmail.com','alvarezcarmen1234','Tecnico'),('27100634X','Antonio','Garcia',916584234,'antonio.garcia@gmail.com','garciaantonio1234','Tecnico'),('27241752T','Antonio','Gomez',916584242,'antonio.gomez@gmail.com','gomezantonio1234','Recursos Humanos'),('27245623F','Antonio','Moreno',916584248,'antonio.moreno@gmail.com','morenoantonio1234','Recursos Humanos'),('27381399Z','Maria Carmen','Gonzalez',916584252,'mariacarmen.gonzalez@gmail.com','gonzalezmariacarmen1234','Recursos Humanos'),('28221072A','Maria Carmen','Martinez',916584255,'mariacarmen.martinez@gmail.com','martinezmariacarmen1234','Recursos Humanos'),('29178375T','Maria','Gonzalez',916584284,'maria.gonzalez@gmail.com','gonzalezmaria1234','Tecnico'),('29331692E','Manuel','Jimenez',916584276,'manuel.jimenez@gmail.com','jimenezmanuel1234','Recursos Humanos'),('29575254Z','Antonio','Lopez',916584238,'antonio.lopez@gmail.com','lopezantonio1234','Tecnico'),('29906649W','Jose','Moreno',916584312,'jose.moreno@gmail.com','morenojose1234','Recursos Humanos'),('29926877J','Carmen','Gonzalez',916584316,'carmen.gonzalez@gmail.com','gonzalezcarmen1234','Recursos Humanos'),('30190249N','Manuel','Ruiz',916584277,'manuel.ruiz@gmail.com','ruizmanuel1234','Recursos Humanos'),('31397981Z','Jose','Alvarez',916584313,'jose.alvarez@gmail.com','alvarezjose1234','Tecnico'),('33198947B','Manuel','Gonzalez',916584268,'manuel.gonzalez@gmail.com','gonzalezmanuel1234','Recursos Humanos'),('34423305X','Manuel','Diaz',916584279,'manuel.diaz@gmail.com','diazmanuel1234','Tecnico'),('34755255R','Maria','Perez',916584289,'maria.perez@gmail.com','perezmaria1234','Tecnico'),('35168941D','Maria Carmen','Diaz',916584263,'mariacarmen.diaz@gmail.com','diazmariacarmen1234','Recursos Humanos'),('35551896Z','Maria Carmen','Jimenez',916584260,'mariacarmen.jimenez@gmail.com','jimenezmariacarmen1234','Recursos Humanos'),('36584871J','Jose','Martinez',916584303,'jose.martinez@gmail.com','martinezjose1234','Tecnico'),('37433151F','Carmen','Ruiz',916584325,'carmen.ruiz@gmail.com','ruizcarmen1234','Recursos Humanos'),('41525689V','Maria','Martinez',916584287,'maria.martinez@gmail.com','martinezmaria1234','Recursos Humanos'),('42697238S','Manuel','Lopez',916584270,'manuel.lopez@gmail.com','lopezmanuel1234','Tecnico'),('43129384Z','Carmen','Garcia',916584314,'carmen.garcia@gmail.com','garciacarmen1234','Tecnico'),('43448118Z','Manuel','Fernandez',916584269,'manuel.fernandez@gmail.com','fernandezmanuel1234','Tecnico'),('47102529R','Maria Carmen','Martin',916584259,'mariacarmen.martin@gmail.com','martinmariacarmen1234','Recursos Humanos'),('47232621M','Maria','Diaz',916584295,'maria.diaz@gmail.com','diazmaria1234','Recursos Humanos'),('48065756B','Antonio','Fernandez',916584237,'antonio.fernandez@gmail.com','fernandezantonio1234','Recursos Humanos'),('48719030Q','Carmen','Fernandez',916584317,'carmen.fernandez@gmail.com','fernandezcarmen1234','Tecnico'),('48762797Z','Jose','Lopez',916584302,'jose.lopez@gmail.com','lopezjose1234','Tecnico'),('49413892W','Manuel','Garcia',916584266,'manuel.garcia@gmail.com','garciamanuel1234','Recursos Humanos'),('52095501H','Maria','Martin',916584291,'maria.martin@gmail.com','martinmaria1234','Tecnico'),('54891198L','Manuel','Perez',916584273,'manuel.perez@gmail.com','perezmanuel1234','Recursos Humanos'),('55004209P','Maria Carmen','Gomez',916584258,'mariacarmen.gomez@gmail.com','gomezmariacarmen1234','Recursos Humanos'),('55197048S','Maria','Rodriguez',916584283,'maria.rodriguez@gmail.com','rodriguezmaria1234','Tecnico'),('55511965Q','Carmen','Jimenez',916584324,'carmen.jimenez@gmail.com','jimenezcarmen1234','Recursos Humanos'),('56076979N','Maria Carmen','Ruiz',916584261,'mariacarmen.ruiz@gmail.com','ruizmariacarmen1234','Tecnico'),('58172047X','Manuel','Martinez',916584271,'manuel.martinez@gmail.com','martinezmanuel1234','Recursos Humanos'),('60454749P','Maria Carmen','Fernandez',916584253,'mariacarmen.fernandez@gmail.com','fernandezmariacarmen1234','Recursos Humanos'),('60626019C','Francisco','Rodriguez',916584331,'francisco.rodriguez@gmail.com','rodriguezfrancisco1234','Recursos Humanos'),('61033398T','Antonio','Alvarez',916584249,'antonio.alvarez@gmail.com','alvarezantonio1234','Tecnico'),('64604119V','Manuel','Martin',916584275,'manuel.martin@gmail.com','martinmanuel1234','Tecnico'),('65470411Z','Maria','Fernandez',916584285,'maria.fernandez@gmail.com','fernandezmaria1234','Tecnico'),('66370250R','Maria Carmen','Moreno',916584264,'mariacarmen.moreno@gmail.com','morenomariacarmen1234','Recursos Humanos'),('66692500K','Jose','Sanchez',916584304,'jose.sanchez@gmail.com','sanchezjose1234','Recursos Humanos'),('66804832K','Francisco','Gonzalez',916584332,'francisco.gonzalez@gmail.com','gonzalezfrancisco1234','Recursos Humanos'),('67751808H','Jose','Ruiz',916584309,'jose.ruiz@gmail.com','ruizjose1234','Tecnico'),('67949644P','Manuel','Gomez',916584274,'manuel.gomez@gmail.com','gomezmanuel1234','Recursos Humanos'),('69235870M','Maria','Hernandez',916584294,'maria.hernandez@gmail.com','hernandezmaria1234','Tecnico'),('69614823X','Jose','Martin',916584307,'jose.martin@gmail.com','martinjose1234','Recursos Humanos'),('71681785P','Maria Carmen','Rodriguez',916584251,'mariacarmen.rodriguez@gmail.com','rodriguezmariacarmen1234','Recursos Humanos'),('72144663B','Carmen','Lopez',916584318,'carmen.lopez@gmail.com','lopezcarmen1234','Recursos Humanos'),('72535310A','Carmen','Rodriguez',916584315,'carmen.rodriguez@gmail.com','rodriguezcarmen1234','Recursos Humanos'),('73299779K','Antonio','Sanchez',916584240,'antonio.sanchez@gmail.com','sanchezantonio1234','Tecnico'),('73657648X','Manuel','Alvarez',916584281,'manuel.alvarez@gmail.com','alvarezmanuel1234','Recursos Humanos'),('76117277L','Francisco','Garcia',916584330,'francisco.garcia@gmail.com','garciafrancisco1234','Tecnico'),('76150589G','Maria','Jimenez',916584292,'maria.jimenez@gmail.com','jimenezmaria1234','Tecnico'),('76506273Q','Carmen','Martinez',916584319,'carmen.martinez@gmail.com','martinezcarmen1234','Recursos Humanos'),('77799542H','Antonio','Martinez',916584239,'antonio.martinez@gmail.com','martinezantonio1234','Tecnico'),('78024326T','Francisco','Fernandez',916584333,'francisco.fernandez@gmail.com','fernandezfrancisco1234','Tecnico'),('78414747L','Jose','Diaz',916584311,'jose.diaz@gmail.com','diazjose1234','Tecnico'),('84028999V','Antonio','Perez',916584241,'antonio.perez@gmail.com','perezantonio1234','Recursos Humanos'),('84890631T','Jose','Garcia',916584298,'jose.garcia@gmail.com','garciajose1234','Recursos Humanos'),('85788245Q','Carmen','Moreno',916584328,'carmen.moreno@gmail.com','morenocarmen1234','Recursos Humanos'),('86678371L','Carmen','Perez',916584321,'carmen.perez@gmail.com','perezcarmen1234','Tecnico'),('87695338H','Maria Carmen','Lopez',916584254,'mariacarmen.lopez@gmail.com','lopezmariacarmen1234','Tecnico'),('88571987E','Jose','Rodriguez',916584299,'jose.rodriguez@gmail.com','rodriguezjose1234','Tecnico'),('88582816H','Maria Carmen','Hernandez',916584262,'mariacarmen.hernandez@gmail.com','hernandezmariacarmen1234','Tecnico'),('88696373R','Maria Carmen','Perez',916584257,'mariacarmen.perez@gmail.com','perezmariacarmen1234','Tecnico'),('88773836T','Maria Carmen','Garcia',916584250,'mariacarmen.garcia@gmail.com','garciamariacarmen1234','Tecnico'),('89112665Q','Maria','Ruiz',916584293,'maria.ruiz@gmail.com','ruizmaria1234','Tecnico'),('90939505N','Maria','Lopez',916584286,'maria.lopez@gmail.com','lopezmaria1234','Tecnico'),('91728249V','Antonio','Gonzalez',916584236,'antonio.gonzalez@gmail.com','gonzalezantonio1234','Recursos Humanos'),('92754069Z','Jose','Gonzalez',916584300,'jose.gonzalez@gmail.com','gonzalezjose1234','Tecnico'),('93770032K','Maria Carmen','Alvarez',916584265,'mariacarmen.alvarez@gmail.com','alvarezmariacarmen1234','Tecnico'),('94172699G','Manuel','Moreno',916584280,'manuel.moreno@gmail.com','morenomanuel1234','Tecnico'),('95068159M','Antonio','Jimenez',916584244,'antonio.jimenez@gmail.com','jimenezantonio1234','Recursos Humanos'),('95984896P','Jose','Gomez',916584306,'jose.gomez@gmail.com','gomezjose1234','Tecnico'),('96073721F','Maria','Gomez',916584290,'maria.gomez@gmail.com','gomezmaria1234','Tecnico'),('97429213V','Jose','Perez',916584305,'jose.perez@gmail.com','perezjose1234','Tecnico'),('97602472V','Carmen','Hernandez',916584326,'carmen.hernandez@gmail.com','hernandezcarmen1234','Recursos Humanos'),('97821731V','Maria','Sanchez',916584288,'maria.sanchez@gmail.com','sanchezmaria1234','Recursos Humanos'),('98451907Q','Manuel','Hernandez',916584278,'manuel.hernandez@gmail.com','hernandezmanuel1234','Tecnico'),('99352482A','Maria','Alvarez',916584297,'maria.alvarez@gmail.com','alvarezmaria1234','Tecnico'),('99629091Z','Carmen','Sanchez',916584320,'carmen.sanchez@gmail.com','sanchezcarmen1234','Tecnico');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Usuarios_AI` AFTER INSERT ON `Usuarios` FOR EACH ROW BEGIN
	if(new.Departamento like 'Recursos Humanos') then
		INSERT INTO `Recursos_humanos` (Usuarios_DNI) values (new.DNI);
	else if(new.Departamento like 'Tecnico') then
		INSERT INTO `Empleado` (Usuarios_DNI) values (new.DNI);
        end if;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Usuarios_AU` AFTER UPDATE ON `Usuarios` FOR EACH ROW BEGIN
	if(old.Departamento <> new.Departamento) then
		if(new.Departamento like 'Recursos Humanos') then
			DELETE FROM `Empleado` WHERE Usuarios_DNI like old.DNI;
			INSERT INTO `Recursos_humanos` (Usuarios_DNI) values (old.DNI);
		else
			DELETE FROM `Recursos_humanos` WHERE Usuarios_DNI like old.DNI;
			INSERT INTO `Empleado` (Usuarios_DNI) values (old.DNI);
		end if;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-25 13:04:12