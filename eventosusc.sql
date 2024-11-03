CREATE DATABASE  IF NOT EXISTS `eventosusc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eventosusc`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: eventosusc
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `doc` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS eventos;

CREATE TABLE Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    lugar VARCHAR(255) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    descripcion TEXT
);

CREATE TABLE Comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT,
    usuario_id INT,
    comentario TEXT,
    fecha DATETIME

);

-- Exportando datos para la tabla `usuarios`




LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,111,'Johan'),(2,222,'Alan');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



LOCK TABLES eventos WRITE;
/*!40000 ALTER TABLE eventos DISABLE KEYS */;
INSERT INTO eventos (id, nombre, lugar, fecha_hora, descripcion) VALUES 
(100,'Concierto de Rock', 'Sede Pampalinda', '2024-11-15 20:00:00', 'Un gran concierto con varias bandas.'),
(200,'Conferencia de Tecnología', 'Centro de Convenciones', '2025-01-15 09:00:00', 'Evento con ponentes internacionales sobre innovación tecnológica.');
/*!40000 ALTER TABLE eventos ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES comentarios WRITE;
/*!40000 ALTER TABLE comentarios DISABLE KEYS */;
INSERT INTO comentarios (id, evento_id, usuario_id, comentario, fecha) VALUES 
(1, 101, 1, 'Comentario de prueba 1', '2024-11-02 10:00:00'),
(2, 102, 2, 'Comentario de prueba 2', '2024-11-02 11:00:00');
/*!40000 ALTER TABLE comentarios ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2024-11-02 15:56:00

