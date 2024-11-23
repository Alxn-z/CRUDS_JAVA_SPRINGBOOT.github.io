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

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS eventos;
CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nombre VARCHAR(255) NOT NULL,
    lugar VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS reseñas;
CREATE TABLE reseñas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT,
    usuario_id INT,
    calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
    comentario TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS comentarios;
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reseña_id INT,
    usuario_id INT,
    comentario TEXT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reseña_id) REFERENCES reseñas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportando datos para la tabla `usuarios`



INSERT INTO usuarios (nombre, email, password) VALUES 
('Juan Perez', 'juan.perez@example.com', 'password123'),
('Maria Lopez', 'maria.lopez@example.com', 'password456'),
('Carlos Sanchez', 'carlos.sanchez@example.com', 'password789');

INSERT INTO eventos (usuario_id, nombre, lugar, fecha, descripcion) VALUES 
(1, 'Conferencia de Tecnología', 'Centro de Convenciones', '2023-11-15', 'Una conferencia sobre las últimas tendencias en tecnología.'),
(2, 'Concierto de Rock', 'Estadio Nacional', '2023-12-01', 'Un concierto de rock con bandas locales e internacionales.'),
(3, 'Feria de Emprendedores', 'Parque Central', '2023-12-10', 'Una feria para emprendedores locales para mostrar sus productos y servicios.');


INSERT INTO reseñas (evento_id, usuario_id, calificacion, comentario) VALUES 
(1, 1, 5, 'Excelente evento, muy bien organizado.'),
(2, 2, 4, 'Muy buen concierto, pero el sonido podría mejorar.'),
(3, 3, 3, 'La feria estuvo bien, pero faltaron más expositores.');

INSERT INTO comentarios (reseña_id, usuario_id, comentario) VALUES 
(1, 1, 'Muy buena reseña, estoy de acuerdo con todo.'),
(2, 2, 'No estoy de acuerdo con la calificación, el evento fue excelente.'),
(3, 3, 'Gracias por la reseña, me ayudó a decidir si asistir al evento.');
-- Dump completed on 2024-11-02 15:56:00

DELETE FROM eventos WHERE id = 3;
