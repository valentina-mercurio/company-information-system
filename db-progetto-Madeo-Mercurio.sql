-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db_progetto_madeo_mercurio
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `articolo`
--

DROP TABLE IF EXISTS `articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articolo` (
  `Codice_articolo` int NOT NULL,
  `Nome` varchar(145) NOT NULL,
  `Stato` enum('In elaborazione','Presente','Assente') NOT NULL,
  PRIMARY KEY (`Codice_articolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articolo`
--

LOCK TABLES `articolo` WRITE;
/*!40000 ALTER TABLE `articolo` DISABLE KEYS */;
INSERT INTO `articolo` VALUES (1,'Sistema di Controllo della Pressione degli Pneumatici (TPMS)','In elaborazione'),(2,'Sensori di Pioggia e Luce','Presente'),(3,'Regolatore di Velocità Adattivo (Adaptive Cruise Control)','Presente'),(4,'Modulo di Controllo del Motore (Engine Control Module, ECM)','Assente'),(5,'Airbag e Sensori di Collisione','Presente'),(6,'Sistema di Frenata Antibloccaggio (ABS)','Presente'),(7,'Moduli di Comunicazione CAN (Controller Area Network)','In elaborazione');
/*!40000 ALTER TABLE `articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrello_ordine_cliente`
--

DROP TABLE IF EXISTS `carrello_ordine_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrello_ordine_cliente` (
  `ID_ordine_cliente` varchar(6) NOT NULL,
  `Codice_articolo` int NOT NULL,
  `Quantita_articoli` int NOT NULL,
  PRIMARY KEY (`ID_ordine_cliente`,`Codice_articolo`),
  UNIQUE KEY `Codice_articolo_UNIQUE` (`Codice_articolo`),
  UNIQUE KEY `ID_ordine_cliente_UNIQUE` (`ID_ordine_cliente`),
  KEY `fk_Ordine_Cliente_has_Articolo_Articolo1_idx` (`Codice_articolo`),
  KEY `fk_Ordine_Cliente_has_Articolo_Ordine_Cliente1_idx` (`ID_ordine_cliente`),
  CONSTRAINT `fk_Articolo_carrello_cliente` FOREIGN KEY (`Codice_articolo`) REFERENCES `articolo` (`Codice_articolo`),
  CONSTRAINT `fk_Ordine_carrello_cliente` FOREIGN KEY (`ID_ordine_cliente`) REFERENCES `ordine_cliente` (`ID_ordine_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello_ordine_cliente`
--

LOCK TABLES `carrello_ordine_cliente` WRITE;
/*!40000 ALTER TABLE `carrello_ordine_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrello_ordine_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrello_ordine_fornitore`
--

DROP TABLE IF EXISTS `carrello_ordine_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrello_ordine_fornitore` (
  `ID_materia_prima` varchar(5) NOT NULL,
  `ID_ordine_fornitore` varchar(5) NOT NULL,
  `Quantita_materie_prime` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_materia_prima`,`ID_ordine_fornitore`),
  KEY `fk_Materia_prima_has_Ordine_fornitore_Ordine_fornitore1_idx` (`ID_ordine_fornitore`),
  KEY `fk_Materia_prima_has_Ordine_fornitore_Materia_prima1_idx` (`ID_materia_prima`),
  CONSTRAINT `fk_Materia_prima_carrello_fornitore` FOREIGN KEY (`ID_materia_prima`) REFERENCES `materia_prima` (`ID_materia_prima`),
  CONSTRAINT `fk_Ordine_fornitore_carrello` FOREIGN KEY (`ID_ordine_fornitore`) REFERENCES `ordine_fornitore` (`ID_ordine_fornitore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello_ordine_fornitore`
--

LOCK TABLES `carrello_ordine_fornitore` WRITE;
/*!40000 ALTER TABLE `carrello_ordine_fornitore` DISABLE KEYS */;
INSERT INTO `carrello_ordine_fornitore` VALUES ('00005','OF001','10'),('00009','OF002','5');
/*!40000 ALTER TABLE `carrello_ordine_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_cliente` varchar(4) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `CAP` int DEFAULT NULL,
  `Indirizzo` varchar(45) DEFAULT NULL,
  `Citta` varchar(45) DEFAULT NULL,
  `PI/CF` varchar(16) DEFAULT NULL,
  `Tipologia` enum('Azienda','Privato') DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('CA01','mprauto@gmail.com',88044,'Via della Liberazione','Marcellinara','10056447000',NULL),('CA02','autofficinassrr@gmail.coom',87036,'Via Roma','Rende','10002358150',NULL),('CA06','baiauto@gmail.com',10,'Via dei Portici','Roma','10458886000',NULL),('CA07','lelloautoemoto@gmail.com',2010,'Via Bari','Rieti','10005268980',NULL),('CP03','mariorossi@gmail.com',20019,'Via Fiera','Milano','RSSMRA88D04D086G',NULL),('CP04','giuliaantonacci@gmail.com',20068,'Corso Magellano ','Linate','NTCGLA98M46C352G',NULL),('CP05','antoniettavoli@gmail.com',88100,'Via Europa Unita','Catanzaro','VLINTT78G62D005F',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizione` (
  `Codice_articolo` int NOT NULL,
  `ID_materia_prima` varchar(5) NOT NULL,
  `Quantita_materie_prime_articoli` int NOT NULL,
  PRIMARY KEY (`Codice_articolo`,`ID_materia_prima`),
  KEY `fk_Articolo_has_Materia_prima_Materia_prima1_idx` (`ID_materia_prima`),
  KEY `fk_Articolo_has_Materia_prima_Articolo1_idx` (`Codice_articolo`),
  CONSTRAINT `fk_Articolo_composizione` FOREIGN KEY (`Codice_articolo`) REFERENCES `articolo` (`Codice_articolo`),
  CONSTRAINT `fk_Materia_prima_composizione` FOREIGN KEY (`ID_materia_prima`) REFERENCES `materia_prima` (`ID_materia_prima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES (1,'00001',1),(1,'00002',2),(1,'00004',4),(1,'00005',2),(2,'00001',1),(2,'00002',2),(2,'00004',4),(3,'00001',1),(3,'00002',2),(3,'00004',4),(3,'00005',10),(4,'00001',1),(4,'00002',3),(4,'00003',2),(4,'00004',2),(5,'00001',1),(5,'00002',1),(5,'00004',4),(5,'00007',1),(5,'00012',3),(6,'00001',1),(6,'00002',3),(6,'00004',3),(6,'00008',2),(7,'00001',2),(7,'00002',3),(7,'00003',4);
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitore` (
  `ID_fornitore` varchar(3) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Ragione_sociale` varchar(45) DEFAULT NULL,
  `Indirizzo` varchar(45) DEFAULT NULL,
  `P.I.` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_fornitore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES ('F01','LiSupplier','SPA','SP80 SNC',158786000,'alsupplier@gmail.com'),('F02','GoldF','SRL','Viale Navigli',58800100,'doldf@gmail.com');
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `ID_materia_prima` varchar(5) NOT NULL,
  `Descrizione` varchar(45) NOT NULL,
  `Stato` enum('Presente','Assente') NOT NULL,
  PRIMARY KEY (`ID_materia_prima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES ('00001','Silicio','Presente'),('00002','Rame','Presente'),('00003','Alluminio','Assente'),('00004','Plastica','Presente'),('00005','Litio','Assente'),('00006','Vetro','Presente'),('00007','Nylon','Presente'),('00008','Acciaio INOX','Presente'),('00009','Oro','Assente'),('00010','Stagno','Presente'),('00011','Piombo','Presente'),('00012','Azoto','Presente');
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine_cliente`
--

DROP TABLE IF EXISTS `ordine_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine_cliente` (
  `ID_ordine_cliente` varchar(6) NOT NULL,
  `Data_ordine` date NOT NULL,
  `Stato` enum('Accettato','In elaborazione','Evaso') NOT NULL,
  `Importo` float NOT NULL,
  `Data_presa_in_carico` date DEFAULT NULL,
  `Data_stimata_consegna_ordine` date DEFAULT NULL,
  `Cliente` varchar(4) NOT NULL,
  PRIMARY KEY (`ID_ordine_cliente`),
  UNIQUE KEY `Cliente_UNIQUE` (`Cliente`),
  KEY `cliente_idx` (`Cliente`),
  CONSTRAINT `fk_Cliente_ordine` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine_cliente`
--

LOCK TABLES `ordine_cliente` WRITE;
/*!40000 ALTER TABLE `ordine_cliente` DISABLE KEYS */;
INSERT INTO `ordine_cliente` VALUES ('OC0001','2023-10-22','Evaso',3250,'2023-10-23','2023-10-31','CA01'),('OC0002','2023-10-22','Evaso',5896,'2023-10-26','2023-11-18','CA02'),('OC0003','2023-11-02','Evaso',502,'2023-11-02','2023-11-09','CP03'),('OC0004','2023-11-06','In elaborazione',1208,NULL,NULL,'CP04'),('OC0005','2023-11-06','Evaso',365,'2023-11-06','2024-01-04','CP05'),('OC0006','2023-12-08','Accettato',51874,'2024-01-03','2024-01-30','CA06'),('OC0007','2023-12-20','Accettato',12050,'2024-01-03','2024-01-25','CA07');
/*!40000 ALTER TABLE `ordine_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine_fornitore`
--

DROP TABLE IF EXISTS `ordine_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine_fornitore` (
  `ID_ordine_fornitore` varchar(5) NOT NULL,
  `Descrizione` varchar(45) DEFAULT NULL,
  `Data_ordine_fornitore` date DEFAULT NULL,
  `ID_fornitore` varchar(3) NOT NULL,
  PRIMARY KEY (`ID_ordine_fornitore`),
  KEY `fk_Ordine_fornitore_Fornitore1_idx` (`ID_fornitore`),
  CONSTRAINT `fk_Fornitore_ordine` FOREIGN KEY (`ID_fornitore`) REFERENCES `fornitore` (`ID_fornitore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine_fornitore`
--

LOCK TABLES `ordine_fornitore` WRITE;
/*!40000 ALTER TABLE `ordine_fornitore` DISABLE KEYS */;
INSERT INTO `ordine_fornitore` VALUES ('OF001','Litio','2024-11-26','F01'),('OF002','Oro','2024-11-30','F02');
/*!40000 ALTER TABLE `ordine_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spedizione`
--

DROP TABLE IF EXISTS `spedizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spedizione` (
  `ID_spedizione` varchar(5) NOT NULL,
  `ID_cliente` varchar(4) NOT NULL,
  `ID_ordine_cliente` varchar(6) NOT NULL,
  `Data_spedizione` date NOT NULL,
  `CAP_spedizione` int NOT NULL,
  `Indirizzo_spedizione` varchar(45) NOT NULL,
  `Citta` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_spedizione`),
  UNIQUE KEY `ID_cliente_UNIQUE` (`ID_cliente`),
  UNIQUE KEY `ID_ordine_cliente_UNIQUE` (`ID_ordine_cliente`),
  KEY `cliente_idx` (`ID_cliente`),
  KEY `ordine_idx` (`ID_ordine_cliente`),
  CONSTRAINT `fk_Cliente_spedizione` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`),
  CONSTRAINT `fk_Ordine_spedizione` FOREIGN KEY (`ID_ordine_cliente`) REFERENCES `ordine_cliente` (`ID_ordine_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spedizione`
--

LOCK TABLES `spedizione` WRITE;
/*!40000 ALTER TABLE `spedizione` DISABLE KEYS */;
INSERT INTO `spedizione` VALUES ('S0001','CA01','OC0001','2023-10-31',88044,'Via della Liberazione','Marcellinara'),('S0002','CA02','OC0002','2023-11-18',87036,'Via Roma','Rende'),('S0003','CP03','OC0003','2023-11-09',20019,'Via Fiera','Linate'),('S0004','CP05','OC0005','2023-01-04',88100,'Via Europa Unita','Catanzaro');
/*!40000 ALTER TABLE `spedizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_progetto_madeo_mercurio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 20:09:58
