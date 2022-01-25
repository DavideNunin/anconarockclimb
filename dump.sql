-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: arc
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `arc`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `arc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `arc`;

--
-- Table structure for table `Abbonamento`
--

DROP TABLE IF EXISTS `Abbonamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Abbonamento` (
  `Transazione` int(11) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `CodSegretario` varchar(16) DEFAULT NULL,
  `Durata` varchar(20) DEFAULT NULL,
  `Ingressi` int(11) DEFAULT NULL,
  `EntrateRimanenti` int(11) DEFAULT NULL,
  PRIMARY KEY (`Transazione`,`Tipo`),
  KEY `CodSegretario` (`CodSegretario`),
  CONSTRAINT `Abbonamento_ibfk_1` FOREIGN KEY (`CodSegretario`) REFERENCES `Segretario` (`CodSegretario`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Abbonamento_ibfk_2` FOREIGN KEY (`Transazione`) REFERENCES `TransazioneAbb` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Ingressi` > 0 and `EntrateRimanenti` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abbonamento`
--

LOCK TABLES `Abbonamento` WRITE;
/*!40000 ALTER TABLE `Abbonamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Abbonamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accesso`
--

DROP TABLE IF EXISTS `Accesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accesso` (
  `CF` varchar(16) NOT NULL,
  `Codsessione` int(11) NOT NULL,
  PRIMARY KEY (`CF`,`Codsessione`),
  KEY `Codsessione` (`Codsessione`),
  CONSTRAINT `Accesso_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `Iscritto` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Accesso_ibfk_2` FOREIGN KEY (`Codsessione`) REFERENCES `Sessione` (`CodSessione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accesso`
--

LOCK TABLES `Accesso` WRITE;
/*!40000 ALTER TABLE `Accesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Afferenza`
--

DROP TABLE IF EXISTS `Afferenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Afferenza` (
  `CodSessione` int(11) NOT NULL,
  `Corso` varchar(20) NOT NULL,
  PRIMARY KEY (`CodSessione`,`Corso`),
  KEY `Corso` (`Corso`),
  CONSTRAINT `Afferenza_ibfk_1` FOREIGN KEY (`CodSessione`) REFERENCES `Sessione` (`CodSessione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Afferenza_ibfk_2` FOREIGN KEY (`Corso`) REFERENCES `Corso` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Afferenza`
--

LOCK TABLES `Afferenza` WRITE;
/*!40000 ALTER TABLE `Afferenza` DISABLE KEYS */;
/*!40000 ALTER TABLE `Afferenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assicurazione`
--

DROP TABLE IF EXISTS `Assicurazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assicurazione` (
  `Transazione` int(11) NOT NULL,
  `CodSegretario` varchar(16) DEFAULT NULL,
  `Massimale` decimal(15,2) DEFAULT NULL,
  `Condizione` text DEFAULT NULL,
  `DataAssicurazione` date DEFAULT NULL,
  PRIMARY KEY (`Transazione`),
  CONSTRAINT `Assicurazione_ibfk_1` FOREIGN KEY (`Transazione`) REFERENCES `TransazioneAss` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Massimale` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assicurazione`
--

LOCK TABLES `Assicurazione` WRITE;
/*!40000 ALTER TABLE `Assicurazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assicurazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bilancio`
--

DROP TABLE IF EXISTS `Bilancio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bilancio` (
  `Anno` year(4) NOT NULL,
  `CodSegretario` varchar(16) DEFAULT NULL,
  `CapitaleSociale` decimal(15,2) DEFAULT NULL,
  `LiqImm` decimal(15,2) DEFAULT NULL,
  `LiqDiff` decimal(15,2) DEFAULT NULL,
  `Immobilizzazioni` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Anno`),
  KEY `CodSegretario` (`CodSegretario`),
  CONSTRAINT `Bilancio_ibfk_1` FOREIGN KEY (`CodSegretario`) REFERENCES `Segretario` (`CodSegretario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`CapitaleSociale` > 0 and `Immobilizzazioni` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bilancio`
--

LOCK TABLES `Bilancio` WRITE;
/*!40000 ALTER TABLE `Bilancio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bilancio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BustaPaga`
--

DROP TABLE IF EXISTS `BustaPaga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BustaPaga` (
  `Codice` int(11) NOT NULL,
  `Dipendente` varchar(16) DEFAULT NULL,
  `Transazione` int(11) DEFAULT NULL,
  `CodSegretario` varchar(16) DEFAULT NULL,
  `Mensilita` varchar(15) DEFAULT NULL,
  `Anno` year(4) DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  KEY `Dipendente` (`Dipendente`),
  KEY `CodSegretario` (`CodSegretario`),
  KEY `Transazione` (`Transazione`),
  CONSTRAINT `BustaPaga_ibfk_1` FOREIGN KEY (`Dipendente`) REFERENCES `Dipendente` (`CF`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `BustaPaga_ibfk_2` FOREIGN KEY (`CodSegretario`) REFERENCES `Segretario` (`CodSegretario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `BustaPaga_ibfk_3` FOREIGN KEY (`Transazione`) REFERENCES `TransazioneBP` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Mensilita` = 'Gennaio' or `Mensilita` = 'Febbraio' or `Mensilita` = 'Marzo' or `Mensilita` = 'Aprile' or `Mensilita` = 'Maggio' or `Mensilita` = 'Giugno' or `Mensilita` = 'Luglio' or `Mensilita` = 'Agosto' or `Mensilita` = 'Settembre' or `Mensilita` = 'Ottobre' or `Mensilita` = 'Novembre' or `Mensilita` = 'Dicembre' or `Mensilita` = 'Tredicesima')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BustaPaga`
--

LOCK TABLES `BustaPaga` WRITE;
/*!40000 ALTER TABLE `BustaPaga` DISABLE KEYS */;
/*!40000 ALTER TABLE `BustaPaga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Corso`
--

DROP TABLE IF EXISTS `Corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Corso` (
  `Nome` varchar(20) NOT NULL,
  `CodIstruttore` varchar(16) DEFAULT NULL,
  `Luogo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Nome`),
  KEY `CodIstruttore` (`CodIstruttore`),
  CONSTRAINT `Corso_ibfk_1` FOREIGN KEY (`CodIstruttore`) REFERENCES `Istruttore` (`CodIstruttore`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Corso`
--

LOCK TABLES `Corso` WRITE;
/*!40000 ALTER TABLE `Corso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dipendente`
--

DROP TABLE IF EXISTS `Dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dipendente` (
  `CF` varchar(16) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dipendente`
--

LOCK TABLES `Dipendente` WRITE;
/*!40000 ALTER TABLE `Dipendente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EsecuzioneAcq`
--

DROP TABLE IF EXISTS `EsecuzioneAcq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EsecuzioneAcq` (
  `Prodotto` varchar(20) NOT NULL,
  `Transazione` int(11) NOT NULL,
  `Quantita` int(11) DEFAULT NULL,
  PRIMARY KEY (`Prodotto`,`Transazione`),
  KEY `Transazione` (`Transazione`),
  CONSTRAINT `EsecuzioneAcq_ibfk_1` FOREIGN KEY (`Prodotto`) REFERENCES `Prodotto` (`Nome`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `EsecuzioneAcq_ibfk_2` FOREIGN KEY (`Transazione`) REFERENCES `TransazioneAcq` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Quantita` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EsecuzioneAcq`
--

LOCK TABLES `EsecuzioneAcq` WRITE;
/*!40000 ALTER TABLE `EsecuzioneAcq` DISABLE KEYS */;
/*!40000 ALTER TABLE `EsecuzioneAcq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Iscritto`
--

DROP TABLE IF EXISTS `Iscritto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Iscritto` (
  `CF` varchar(16) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CF`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`Email` like '%@%.%')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Iscritto`
--

LOCK TABLES `Iscritto` WRITE;
/*!40000 ALTER TABLE `Iscritto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Iscritto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Istruttore`
--

DROP TABLE IF EXISTS `Istruttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Istruttore` (
  `CodIstruttore` varchar(16) NOT NULL,
  `Certificazione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CodIstruttore`),
  CONSTRAINT `Istruttore_ibfk_1` FOREIGN KEY (`CodIstruttore`) REFERENCES `Dipendente` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Istruttore`
--

LOCK TABLES `Istruttore` WRITE;
/*!40000 ALTER TABLE `Istruttore` DISABLE KEYS */;
/*!40000 ALTER TABLE `Istruttore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrarioDip`
--

DROP TABLE IF EXISTS `OrarioDip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrarioDip` (
  `CodOrario` int(11) NOT NULL,
  `OraInizio` time DEFAULT NULL,
  `OraFine` time DEFAULT NULL,
  `DataOrarioDip` date DEFAULT NULL,
  PRIMARY KEY (`CodOrario`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`OraInizio` > '00:00:00' and `OraInizio` < '23:59:59'),
  CONSTRAINT `CONSTRAINT_2` CHECK (`OraFine` > '00:00:00' and `OraFine` < '23:59:59'),
  CONSTRAINT `CONSTRAINT_3` CHECK (`OraInizio` < `OraFine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrarioDip`
--

LOCK TABLES `OrarioDip` WRITE;
/*!40000 ALTER TABLE `OrarioDip` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrarioDip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prenotazione`
--

DROP TABLE IF EXISTS `Prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prenotazione` (
  `Iscritto` varchar(16) NOT NULL,
  `Sessione` int(11) DEFAULT NULL,
  `DataPrenotazione` datetime NOT NULL,
  PRIMARY KEY (`Iscritto`,`DataPrenotazione`),
  KEY `Sessione` (`Sessione`),
  CONSTRAINT `Prenotazione_ibfk_1` FOREIGN KEY (`Iscritto`) REFERENCES `Iscritto` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Prenotazione_ibfk_2` FOREIGN KEY (`Sessione`) REFERENCES `Sessione` (`CodSessione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prenotazione`
--

LOCK TABLES `Prenotazione` WRITE;
/*!40000 ALTER TABLE `Prenotazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prenotazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prodotto`
--

DROP TABLE IF EXISTS `Prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prodotto` (
  `Nome` varchar(20) NOT NULL,
  `CodSegretario` varchar(16) DEFAULT NULL,
  `Tipologia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Nome`),
  KEY `CodSegretario` (`CodSegretario`),
  CONSTRAINT `Prodotto_ibfk_1` FOREIGN KEY (`CodSegretario`) REFERENCES `Segretario` (`CodSegretario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prodotto`
--

LOCK TABLES `Prodotto` WRITE;
/*!40000 ALTER TABLE `Prodotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Segretario`
--

DROP TABLE IF EXISTS `Segretario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Segretario` (
  `CodSegretario` varchar(16) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodSegretario`),
  CONSTRAINT `Segretario_ibfk_1` FOREIGN KEY (`CodSegretario`) REFERENCES `Dipendente` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Email` like '%@%.%')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Segretario`
--

LOCK TABLES `Segretario` WRITE;
/*!40000 ALTER TABLE `Segretario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Segretario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessione`
--

DROP TABLE IF EXISTS `Sessione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sessione` (
  `CodSessione` int(11) NOT NULL,
  `OraInizio` time DEFAULT NULL,
  `OraFine` time DEFAULT NULL,
  `Capienza` int(11) NOT NULL,
  `PostiRim` int(11) NOT NULL,
  `DataSessione` date DEFAULT NULL,
  PRIMARY KEY (`CodSessione`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`OraInizio` > '00:00:00' and `OraInizio` < '23:59:59'),
  CONSTRAINT `CONSTRAINT_2` CHECK (`OraFine` > '00:00:00' and `OraFine` < '23:59:59'),
  CONSTRAINT `CONSTRAINT_3` CHECK (`OraInizio` < `OraFine`),
  CONSTRAINT `CONSTRAINT_4` CHECK (`Capienza` > 0 and `Capienza` <= 30),
  CONSTRAINT `CONSTRAINT_5` CHECK (`PostiRim` >= 0 and `PostiRim` <= `Capienza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessione`
--

LOCK TABLES `Sessione` WRITE;
/*!40000 ALTER TABLE `Sessione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sessione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Svolgimento`
--

DROP TABLE IF EXISTS `Svolgimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Svolgimento` (
  `Dipendente` varchar(16) NOT NULL,
  `CodOrario` int(11) NOT NULL,
  PRIMARY KEY (`Dipendente`,`CodOrario`),
  KEY `CodOrario` (`CodOrario`),
  CONSTRAINT `Svolgimento_ibfk_1` FOREIGN KEY (`Dipendente`) REFERENCES `Dipendente` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Svolgimento_ibfk_2` FOREIGN KEY (`CodOrario`) REFERENCES `OrarioDip` (`CodOrario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Svolgimento`
--

LOCK TABLES `Svolgimento` WRITE;
/*!40000 ALTER TABLE `Svolgimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Svolgimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono`
--

DROP TABLE IF EXISTS `Telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefono` (
  `Numero` varchar(20) NOT NULL,
  `CF` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `CF` (`CF`),
  CONSTRAINT `Telefono_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `Dipendente` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono`
--

LOCK TABLES `Telefono` WRITE;
/*!40000 ALTER TABLE `Telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transazione`
--

DROP TABLE IF EXISTS `Transazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transazione` (
  `ID` int(11) NOT NULL,
  `Importo` decimal(15,2) DEFAULT NULL,
  `DataTransazione` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`Importo` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transazione`
--

LOCK TABLES `Transazione` WRITE;
/*!40000 ALTER TABLE `Transazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransazioneAbb`
--

DROP TABLE IF EXISTS `TransazioneAbb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransazioneAbb` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `TransazioneAbb_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Transazione` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransazioneAbb`
--

LOCK TABLES `TransazioneAbb` WRITE;
/*!40000 ALTER TABLE `TransazioneAbb` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransazioneAbb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransazioneAcq`
--

DROP TABLE IF EXISTS `TransazioneAcq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransazioneAcq` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `TransazioneAcq_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Transazione` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransazioneAcq`
--

LOCK TABLES `TransazioneAcq` WRITE;
/*!40000 ALTER TABLE `TransazioneAcq` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransazioneAcq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransazioneAss`
--

DROP TABLE IF EXISTS `TransazioneAss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransazioneAss` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `TransazioneAss_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Transazione` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransazioneAss`
--

LOCK TABLES `TransazioneAss` WRITE;
/*!40000 ALTER TABLE `TransazioneAss` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransazioneAss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransazioneBP`
--

DROP TABLE IF EXISTS `TransazioneBP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransazioneBP` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `TransazioneBP_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Transazione` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransazioneBP`
--

LOCK TABLES `TransazioneBP` WRITE;
/*!40000 ALTER TABLE `TransazioneBP` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransazioneBP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-25 16:05:51
