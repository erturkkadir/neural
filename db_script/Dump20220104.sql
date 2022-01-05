CREATE DATABASE  IF NOT EXISTS `neural` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `neural`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 192.168.1.166    Database: neural
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.10.1

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
-- Table structure for table `global`
--

DROP TABLE IF EXISTS `global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global` (
  `status` enum('Free','Learn') NOT NULL DEFAULT 'Free',
  `eps` float DEFAULT '0.1',
  `test` double DEFAULT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neuron`
--

DROP TABLE IF EXISTS `neuron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neuron` (
  `nr_no` bigint NOT NULL AUTO_INCREMENT COMMENT 'Neuron Number',
  `nr_x` int NOT NULL COMMENT 'x position of neuron',
  `nr_y` int NOT NULL COMMENT 'y position of neuron',
  `nr_z` int NOT NULL COMMENT 'z position of neuron',
  `nr_shiftr` float NOT NULL DEFAULT '0' COMMENT 'real part of shift factor',
  `nr_shifti` float NOT NULL DEFAULT '0' COMMENT 'imag part of shift factor',
  `nr_inpr` float NOT NULL DEFAULT '0' COMMENT 'real part of neuron input',
  `nr_inpi` float NOT NULL DEFAULT '0' COMMENT 'imag part of neuron input',
  `nr_outr` float NOT NULL DEFAULT '0' COMMENT 'real part of neuron output',
  `nr_outi` float NOT NULL DEFAULT '0' COMMENT 'imag part of neuron output',
  `nr_type` enum('input','hidden','output') NOT NULL DEFAULT 'hidden' COMMENT 'neuron type (input, hidden or output)',
  `nr_class` enum('standart','lstm','rnn','sensor') DEFAULT 'standart' COMMENT 'neuron class (standart, lstm, rnn, sensor)',
  `nr_delr` float NOT NULL DEFAULT '0' COMMENT 'real delta value',
  `nr_deli` float NOT NULL DEFAULT '0' COMMENT 'imag delta value',
  `nr_desr` float NOT NULL DEFAULT '0' COMMENT 'real part of desired',
  `nr_desi` float NOT NULL DEFAULT '0' COMMENT 'imag part of desired',
  `nr_train` tinyint NOT NULL DEFAULT '0' COMMENT 'if induced to train or not',
  `nr_status` tinyint NOT NULL DEFAULT '0' COMMENT 'neuron status (induced=1)',
  `nr_forgetr` float DEFAULT '0',
  `nr_forgeti` float DEFAULT '0',
  `nr_cellstate_r` float DEFAULT '0',
  `nr_cellstate_i` int DEFAULT '0',
  `nr_outputgate_r` float DEFAULT '0',
  `nr_outputgate_i` float DEFAULT '0',
  `nr_inputstate_r` float DEFAULT '0',
  `nr_inputstate_i` float DEFAULT '0',
  PRIMARY KEY (`nr_no`),
  UNIQUE KEY `xyz_dx` (`nr_x`,`nr_y`,`nr_z`)
) ENGINE=InnoDB AUTO_INCREMENT=14745383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `rg_name` varchar(20) NOT NULL,
  `rg_sta_x` int NOT NULL DEFAULT '0',
  `rg_end_x` int NOT NULL DEFAULT '0',
  `rg_sta_y` int NOT NULL DEFAULT '0',
  `rg_end_y` int NOT NULL DEFAULT '0',
  `rg_sta_z` int NOT NULL DEFAULT '0',
  `rg_end_z` int NOT NULL DEFAULT '0',
  `rg_num_neuron` int NOT NULL DEFAULT '0',
  `rg_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table describes brain regions and allowed limit in 3D space';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `r` float DEFAULT NULL,
  `i` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weight`
--

DROP TABLE IF EXISTS `weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weight` (
  `we_no` int NOT NULL AUTO_INCREMENT,
  `we_fromx` int NOT NULL COMMENT 'from neuron x',
  `we_fromy` int NOT NULL COMMENT 'from neuron y',
  `we_fromz` int NOT NULL COMMENT 'from neuron z',
  `we_tox` int NOT NULL COMMENT 'to neuron x',
  `we_toy` int NOT NULL COMMENT 'to neuron y',
  `we_toz` int NOT NULL COMMENT 'to neuron z',
  `we_real` float NOT NULL DEFAULT '0' COMMENT 'real part of weight',
  `we_imag` float NOT NULL DEFAULT '0' COMMENT 'imag part of weight',
  `we_preal` float NOT NULL DEFAULT '0' COMMENT 'real value of previous weight',
  `we_pimag` float NOT NULL DEFAULT '0' COMMENT 'imag value of previous weight',
  PRIMARY KEY (`we_no`),
  UNIQUE KEY `one_conn` (`we_fromx`,`we_fromy`,`we_fromz`,`we_tox`,`we_toy`,`we_toz`)
) ENGINE=InnoDB AUTO_INCREMENT=14552 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `words_tr`
--

DROP TABLE IF EXISTS `words_tr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words_tr` (
  `word` varchar(255) NOT NULL DEFAULT 'Free',
  `num` int DEFAULT '0',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'neural'
--

--
-- Dumping routines for database 'neural'
--
/*!50003 DROP FUNCTION IF EXISTS `cadd_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cadd_i`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
BEGIN

declare r float;
set r = p1imag + p2imag;
 
RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cadd_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cadd_r`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
BEGIN

declare r float;
set r = p1real+p2real;
 
RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cdiv_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cdiv_i`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
BEGIN

declare denom, r float;
 
 set denom = (p2real*p2real + p2imag*p2imag);
 
 set r = (p1imag*p2real-p1real*p2imag)/denom;
 
 RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cdiv_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cdiv_r`(
        `p1real` FLOAT,
        `p1imag` FLOAT,
        `p2real` FLOAT,
        `p2imag` FLOAT
    ) RETURNS float
    NO SQL
BEGIN
declare denom, r  float;
 
 set denom = (p2real*p2real + p2imag*p2imag);
 
 set r = (p1real*p2real+p1imag*p2imag)/denom;
 
 RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cmul_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cmul_i`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
    DETERMINISTIC
BEGIN
 
 RETURN p1real*p2imag + p1imag*p2real;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cmul_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cmul_r`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
 
 RETURN p1real*p2real - p1imag*p2imag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `csub_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `csub_i`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
BEGIN

declare r float;
set r = p1imag - p2imag;
 
RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `csub_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `csub_r`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
BEGIN

declare r float;
set r = p1real - p2real;
 
RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `myrandom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `myrandom`(
        `pmin` INTEGER,
        `pmax` INTEGER
    ) RETURNS int
    NO SQL
    DETERMINISTIC
BEGIN

  RETURN floor(pmin+RAND()*(pmax-pmin));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sigm_imag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `sigm_imag`(
 `a` FLOAT,
 `b` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
/* y = 1 / (1 + Exp(-z))     */
/* z is a complex number     */

declare c, aa, bb, rr float;

set c = Exp(-a);
set aa = c * cos(b) + 1;
set bb = c * sin(b);
set rr = (aa * aa) + (bb * bb);


if (rr = 0) then 
 return 1;
else
 return bb / rr;
end if; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sigm_real` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `sigm_real`(
 `a` DOUBLE,
 `b` DOUBLE
 ) RETURNS double
    DETERMINISTIC
BEGIN

/* y = 1 / (1 + Exp(-z))     */
/* z is a complex number     */

declare c, aa, bb, rr float;


/*
return 1.0 / (1.0 + exp(-a) );
*/


set c = Exp(-a);
set aa = c * cos(b) + 1;
set bb = c * sin(b);
set rr = (aa * aa) + (bb * bb);

if (rr = 0) then 
 return 1;
else
 return aa / rr;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `target_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `target_node`(
        `pmin` INTEGER,
        `pmax` INTEGER
    ) RETURNS int
    NO SQL
    DETERMINISTIC
BEGIN
  RETURN floor(pmin+(RAND()*(pmax-pmin)) );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backprop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `backprop`(
 OUT `res` BOOLEAN
 )
BEGIN
/*****************************************************************/
/* in the output layer y = desired output, yp is actual output   */
/* err = y - yp ===> desired output - actual output is d y prime */
/* dyp = err * sigm(actual) sigm is derived one( ie s * (1-s) )  */
/*  */

declare nrn, done integer;
declare res boolean;
declare eps float;
set eps = 1.0;
set done = 0;
set nrn = 0;

/* calculate delta and update shift accordingly */
update neuron set 
	nr_delr = nr_desr - nr_outr, 
    nr_deli = nr_desi - nr_outi,        
    nr_shiftr = nr_shiftr + (nr_desr - nr_outr) * nr_outr * ( 1.0 - nr_outr),
    nr_shifti = nr_shifti + (nr_desi - nr_outi) * nr_outi * ( 1.0 - nr_outi)    
where 
	nr_train = 1;  /* only the record needs to be trained and forward reaches here */
    
/* update weights accordingly */    
update 
	neuron n1, weight w, neuron n2  /* n1 is the last one, n2 is the previous*/
set 
	w.we_real = w.we_real + (n2.nr_outr * (1.0 - n2.nr_outr)),
    w.we_imag = w.we_imag + (n2.nr_outi * (1.0 - n2.nr_outi)),
    n2.nr_desr = n2.nr_desr*0.9, /* This is important part, whether we want increase or descrease  */  
    n2.nr_desi = n2.nr_desi*0.9,
    n1.nr_train = 0,
    n2.nr_train = 1
where
	n1.nr_train = 1 and 
	n1.nr_x = w.we_tox and n1.nr_y = w.we_toy and n1.nr_z = w.we_toz and 
	w.we_fromx = n2.nr_x and w.we_fromy = n2.nr_y and w.we_fromz = n2.nr_z;
      
set @res = true; 

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backpropogation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `backpropogation`(
 OUT `res` BOOLEAN
 )
BEGIN
/*****************************************************************/
/* in the output layer y = desired output, yp is actual output   */
/* err = y - yp ===> desired output - actual output is d y prime */
/* dyp = err * sigm(actual) sigm is derived one( ie s * (1-s) )  */
/*  */

declare nrn, done integer;
declare res boolean;
declare eps float;
set eps = 1.0;
set done = 0;
set nrn = 0;
/* start from output layer till to input layer */

/* Is there any data to propogate */
select count(*) into nrn from neuron where nr_type='output' and nr_train = 1;

if (nrn<1) then
 call noting_to_backpropogate(); 
end if;
/* Yes there is some data to process, so start with output layer */
/* ****************************************************************** */ 
update neuron n1 /* find deltas for output layer */
,
(select
n2.nr_x as x, n2.nr_y as y, n2.nr_z as z,
(n2.nr_desr - n2.nr_outr) * (1.0 - n2.nr_outr)* n2.nr_outr as delr,
(n2.nr_desi - n2.nr_outi) * (1.0 - n2.nr_outi)* n2.nr_outi as deli
from
neuron n2
where
 n2.nr_type='output' and 
 n2.nr_train = 1) n
 
set 
 n1.nr_delr = n.delr,
 n1.nr_deli = n.deli

where
 n1.nr_x = n.x and 
 n1.nr_y = n.y and 
 n1.nr_z = n.z;
/* ****************************************************************** */ 
 
update weight wu, /* update the weight to output layer */ 

(select
 w.we_fromx, w.we_fromy, w.we_fromz,
 w.we_tox, w.we_toy, w.we_toz, 
 w.we_real,
 w.we_imag, 
 w.we_real - eps * (n.nr_delr * b.nr_outr + n.nr_deli * b.nr_outi) as nw_real,
 w.we_imag - eps * (n.nr_deli * b.nr_outr - n.nr_delr * b.nr_outi) as nw_imag 
from 
 neuron n, weight w, neuron b
where
 n.nr_type = 'output' and 
 n.nr_train = 1 and 
 w.we_tox = n.nr_x and
 w.we_toy = n.nr_y and 
 w.we_toz = n.nr_z and 
 w.we_fromx = b.nr_x and 
 w.we_fromy = b.nr_y and 
 w.we_fromz = b.nr_z) wn
set 
 wu.we_preal = wu.we_real,
 wu.we_pimag = wu.we_imag,
 wu.we_real = wn.nw_real,
 wu.we_imag = wn.nw_imag
where
 wu.we_fromx = wn.we_fromx and 
 wu.we_fromy = wn.we_fromy and 
 wu.we_fromz = wn.we_fromz and 
 
 wu.we_tox = wn.we_tox and 
 wu.we_toy = wn.we_toy and 
 wu.we_toz = wn.we_toz; 



/*calculate new shift value of the neuron at output layer */
update neuron n
set 
 n.nr_shiftr = n.nr_shiftr - eps * (n.nr_shiftr * n.nr_delr + n.nr_shifti * n.nr_deli),
 n.nr_shifti = n.nr_shifti - eps * (n.nr_shifti * n.nr_delr - n.nr_shiftr * n.nr_deli)
where
 n.nr_type = 'output' and 
 n.nr_train = 1;



/* induce the previous layer in order to be updated and relax output layer*/ 
update 
 neuron o, weight w, neuron n /* o output layer n previous layer */
set
 n.nr_train = 1,
 o.nr_train = 0
where
 o.nr_type = 'output' and
 o.nr_train = 1 and 
 o.nr_x = w.we_tox and
 o.nr_y = w.we_toy and
 o.nr_z = w.we_toz and
 w.we_fromx = n.nr_x and 
 w.we_fromy = n.nr_y and 
 w.we_fromz = n.nr_z; 
 

/* Loop until input layer */
while not done do
 begin
 call train(@res);
 select sum(nr_train) into nrn from neuron where nr_type = 'input';
 if (nrn>0) then
 update neuron set nr_train = 0 where nr_type='input';
 set done = 1; 
 end if;
 end;
end while; 
 
 
set @res = true; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bolum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `bolum`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
declare denom float;

set denom = (p2real * p2real - p2real * p2real );

if not (denom=0) then 
 begin
 set preal = (p1real * p2real + p1imag * primag) / denom;
 set pimag = (p1imag * p2real - p1real * p2imag) / denom;
 end;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `carp`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
set preal = p1real * p2real - p1imag * p2imag;
set pimag = p1real * p2imag + p1imag * p2real;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `cika`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
set preal = p1real - p2real ;
set pimag = p1imag - p2imag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createnn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `createnn`(
        IN `px` INTEGER,
        IN `py` INTEGER,
        IN `pz` INTEGER,
        IN `inp_width` INTEGER,
        IN `cen_width` INTEGER
    )
BEGIN
/* ********************************************************************************* */
/* CREATES A MODEL FROM SCRATCH 						   	 						 */
/* Input Params 											 						 */
/* px : Number of cell in x direction (100)				     						 */
/* py : Number of cell in y direction (100) 				 					     */
/* pz : Number of cell in z direction (100)				    						 */
/* inp_width : Number of input layer on the outher surface   						 */
/* cen_width : Half of the number of output layer in the core	     				 */
/*  																				 */
/* ************* EXAMPLE *********************************************************** */		
/*  																				 */
/* px = 41   py = 42  pz = 38   inp_width = 6  cen_width = 5 						 */	
/* Number of Output cells 															 */
/*   Out = (2*cen_width) * (2*cen_width) * (2*cen_width) = 1000    		         	 */	
/*  																				 */
/* Number of Hidden cells 								   				  			 */	
/*   Hidden = (px-2*inp_width) * (py-2*inp_width) * (pz-2*inp_width) - Out = 21620   */
/*  																				 */
/* Number of Input cells 								   				 			 */	
/*   Input = (px * py * pz) - (px-2*inp_width) * (py-2*inp_width) * (pz-2*inp_width) */
/*   Input = 42816																	 */
/*															 						 */
/* ********************************************************************************* */
/* Rev 2 13th Dec 2021															     */
/* All rights reserved and restricted, do not copy or use 	 						 */
/* ********************************************************************************* */

declare x, y, z integer;
declare x_min, x_max, y_min, y_max, z_min, z_max integer;
declare ntype varchar(20);

set x = 0;
set y = 0;
set z = 0;

set x_min = (px-cen_width)/2;
set y_min = (py-cen_width)/2;
set z_min = (pz-cen_width)/2;

set x_max = (px+cen_width)/2;
set y_max = (py+cen_width)/2;
set z_max = (pz+cen_width)/2;

commit;
delete from neuron;
commit;

/*
if(px<2*(inp_width+cen_width) + 1) then call number_does_not_match(); end if;
if(py<2*(inp_width+cen_width) + 1) then call number_does_not_match(); end if;
if(pz<2*(inp_width+cen_width) + 1) then call number_does_not_match(); end if;
*/

start transaction;
set z = 0;
while z<pz do 
	set y = 0;
	while y<py do 
		set x = 0;
    	while x<px do 
	        set ntype = 'hidden';
        	if ( (x<inp_width) or (y<inp_width) or (z<inp_width) or 
                 (x >= (px-inp_width)) or (y >= (py-inp_width)) or (z >= (pz-inp_width)) ) 
		    then set ntype='input'; end if; 

            if( (x >= x_min and x < x_max) and 
				(y >= y_min and y < y_max) and 
                (z >= z_min and z < z_max) )  
            then set ntype='output'; end if;
 
            insert into neuron(nr_x, nr_y, nr_z, nr_shiftr, nr_shifti, nr_inpr, nr_inpi, nr_outr, nr_outi, nr_type,  nr_class, nr_delr, nr_deli, nr_desr, nr_desi, nr_train, nr_status)
                        values(   x,    y,    z,    rand(), rand()/10,       0,       0,       0,       0,   ntype,'standart',       0,       0,       0,       0,        0,         0);
        	set x = x + 1;
        end while;
    	set y = y + 1;    
    end while; 
    set z = z + 1;
end while; 
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createnn_y` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `createnn_y`(
        IN `px` INTEGER,
        IN `py` INTEGER,
        IN `pz` INTEGER,
        IN `inp_width` INTEGER,
        IN `cen_width` INTEGER
    )
BEGIN
/* ********************************************************************************* */
/* CREATES A MODEL FROM SCRATCH 						   	 						 */
/* Input Params 											 						 */
/* px : Number of cell in x direction (100)				     						 */
/* py : Number of cell in y direction (100) 				 					     */
/* pz : Number of cell in z direction (100)				    						 */
/* inp_width : Number of input layer on the outher surface   						 */
/* cen_width : Half of the number of output layer in the core	     				 */
/*  																				 */
/* ************* EXAMPLE *********************************************************** */		
/*  																				 */
/* px = 41   py = 42  pz = 38   inp_width = 6  cen_width = 5 						 */	
/* Number of Output cells 															 */
/*   Out = (2*cen_width) * (2*cen_width) * (2*cen_width) = 1000    		         	 */	
/*  																				 */
/* Number of Hidden cells 								   				  			 */	
/*   Hidden = (px-2*inp_width) * (py-2*inp_width) * (pz-2*inp_width) - Out = 21620   */
/*  																				 */
/* Number of Input cells 								   				 			 */	
/*   Input = (px * py * pz) - (px-2*inp_width) * (py-2*inp_width) * (pz-2*inp_width) */
/*   Input = 42816																	 */
/*															 						 */
/* ********************************************************************************* */
/* Kadir Erturk April 16th, 2016 							 						 */
/* Rev 2 13th Dec 2021															     */
/* All rights reserved and restricted, do not copy or use 	 						 */
/* ********************************************************************************* */

declare x, y, z integer;
declare x_min, x_max, y_min, y_max, z_min, z_max integer;
declare ntype varchar(20);

set x = 0;
set y = 0;
set z = 0;

set x_min = px/2-cen_width;
set y_min = py/2-cen_width;
set z_min = pz/2-cen_width;

set x_max = px/2+cen_width;
set y_max = py/2+cen_width;
set z_max = pz/2+cen_width;

commit;
delete from neuron;
commit;

if(px<2*(inp_width+cen_width) + 1) then call number_does_not_match(); end if;
if(py<2*(inp_width+cen_width) + 1) then call number_does_not_match(); end if;
if(pz<2*(inp_width+cen_width) + 1) then call number_does_not_match(); end if;

start transaction;
while z<pz do 
	while y<py do 
    	while x<px do 
	        set ntype = 'hidden';
        	if ( (x<inp_width) or (y<inp_width) or (z<inp_width) or 
                 (x >= (px-inp_width)) or (y >= (py-inp_width)) or (z >= (pz-inp_width)) ) 
		    then set ntype='input'; end if; 

            if( (x > x_min and x <= x_max) and (y > y_min and y <= y_max) and (z > z_min and z <= z_max) )  
            then set ntype='output'; end if;
 
            insert into neuron(nr_x, nr_y, nr_z, nr_shiftr, nr_shifti, nr_inpr, nr_inpi, nr_outr, nr_outi, nr_type,  nr_class, nr_delr, nr_deli, nr_desr, nr_desi, nr_train, nr_status)
                        values(   x,    y,    z,    rand(), rand()/10,       0,       0,       0,       0,   ntype,'standart',       0,       0,       0,       0,        0,         0);
        	set x = x + 1;
        end while;
        set x = 0;
    	set y = y + 1;    
    end while; 
    set x = 0;
    set y = 0;
	set z = z + 1;
end while; 
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createwei` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `createwei`(
        IN `px` INTEGER,
        IN `py` INTEGER,
        IN `pz` INTEGER,
        IN `d_x` INTEGER,
        IN `d_y` INTEGER,
        IN `d_z` INTEGER
    )
BEGIN
/********************************************************************************/
/* Creates random connection weight array between neurons       				*/
/* px, py, pz are the dimension or neurons, has to be match    					*/
/* with createnn procedure sizes. The connection can only go   					*/
/* d_x, d_y, d_z in xyz direction respectively.									*/
/* Diverging, coverging, reverberating, parallel								*/
/*																				*/
/* Another concurrent application will alter/add/delete connections				*/
/* this init data is only for startup, 											*/ 
/* Basic rules 																	*/
/* A connection can go to forward layer or same layer, cannot go backward		*/
/* The connections from one neuron to another is in between n_min and n_max  	*/
/* Expected sizes																*/
/*   min : px*py*px*n_min, ex : 10*10*10*10 = 10.000							*/
/*   max : px*py*px*n_max, ex : 10*10*10*20 = 20.000							*/
/*																				*/
/*	takes 30 mins to complete for call createnn(50, 50, 50, 5, 5, 5);			*/
/********************************************************************************/

declare n_min, n_max, n_conn integer;  
declare x, y, z, i, j, k, to_x, to_y, to_z integer;
declare str, tmp varchar(16000);
set z = 0, y = 0, x = 0, i = 0, j = 0, k = 0;
set n_min = 10; 	/* min number of connection a neuron can have */
set n_max = 20;		/* max number of connection a neuron can have */
commit;

/* weight table will be extremly big so in order to save insertion time		 	*/
/* 1. create table without index,												*/ 
/* 2. insert records,															*/
/* 3. create indexes															*/

drop table if exists `weight` ;
CREATE TABLE `weight` (
  `we_no` int NOT NULL AUTO_INCREMENT,
  `we_fromx` int NOT NULL COMMENT 'from neuron x',
  `we_fromy` int NOT NULL COMMENT 'from neuron y',
  `we_fromz` int NOT NULL COMMENT 'from neuron z',
  `we_tox` int NOT NULL COMMENT 'to neuron x',
  `we_toy` int NOT NULL COMMENT 'to neuron y',
  `we_toz` int NOT NULL COMMENT 'to neuron z',
  `we_real` float NOT NULL DEFAULT '0' COMMENT 'real part of weight',
  `we_imag` float NOT NULL DEFAULT '0' COMMENT 'imag part of weight',
  `we_preal` float NOT NULL DEFAULT '0' COMMENT 'real value of previous weight',
  `we_pimag` float NOT NULL DEFAULT '0' COMMENT 'imag value of previous weight',
  PRIMARY KEY (`we_no`),
  UNIQUE KEY `one_conn` (`we_fromx`,`we_fromy`,`we_fromz`,`we_tox`,`we_toy`,`we_toz`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
commit;

set str = "";
set z = 0;

start transaction;
while z<pz do 			/* No outward connections in z on the last layer	*/ 
	set y = 0;
	while y<py do 		/* No outward connections in y on the last layer	*/ 	
		set x = 0;
    	while x<px do 	/* No outward connections in x on the last latyer	*/         	
            set n_conn = myrandom(n_min, n_max);  /* number of allowed conn		*/
            set i = 0;
            while i<n_conn do 
				set to_x = x + target_node(-d_x, d_x);  	/* pick next x randomly 	*/
                set to_y = y + target_node(-d_y, d_y);  	/* pick next y randomly 	*/
                set to_z = z + target_node(-d_z, d_z);		/* pick next z randomly 	*/   
               
                if ( (to_x>=0 and to_y>=0 and to_z>=0) and (to_x<px and to_y<py and to_z<pz) ) then 
					set tmp = concat("(", cast(x as char), ",", cast(y as char),",", cast(z as char), ",");  
					set tmp = concat(tmp, cast(to_x as char), ",", cast(to_y as char),",", cast(to_z as char), ",");
					set tmp = concat(tmp, cast(rand() as char), ",", cast(rand() as char),",", cast(rand() as char), ",", cast(rand() as char), ")," );
					set str = concat(str, tmp);                
				end if;
				set i = i + 1;
            end while;
			if(length(str)>20) then
				set str = CONCAT("REPLACE INTO weight(we_fromx, we_fromy, we_fromz,	we_tox,	we_toy,	we_toz, we_real,we_imag, we_preal, we_pimag) VALUES ", str);
				set str = SUBSTRING(str, 1, length(str)-1);			
				/*  
				call debug_msg(str); 			
				call non();                
				*/
                start transaction;
				SET @sql = concat("", str);
				PREPARE stmt FROM @sql;
				EXECUTE stmt;
				DEALLOCATE PREPARE stmt;                
			end if;
            set str = "";
            set x = x + 1;            
        end while;       
    	set y = y + 1;    
    end while; 
    set z = z + 1;
end while; 

/* There is no connection from output layer */
CREATE TEMPORARY TABLE IF NOT EXISTS tmp ENGINE=MEMORY AS 
(select we_no from weight w, neuron n where n.nr_type='output' and  n.nr_x = w.we_fromx and  n.nr_y = w.we_fromy and n.nr_z = w.we_fromz);
delete from weight w where w.we_no in (select we_no from tmp);
drop table tmp;
/* this block to delete any connection from output layer */

/* There is no connection to input layers */
CREATE TEMPORARY TABLE IF NOT EXISTS tmp ENGINE=MEMORY AS 
(select we_no from weight w, neuron n where n.nr_type='input' and  n.nr_x = w.we_tox and  n.nr_y = w.we_toy and n.nr_z = w.we_toz);
delete from weight w where w.we_no in (select we_no from tmp);
drop table tmp;


commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `debug_msg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `debug_msg`(msg TEXT)
BEGIN
	SELECT msg as 'DEBUG';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletenn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `deletenn`(
 IN `pnno` INTEGER
 )
BEGIN
delete from networkd where nno=pnno;
delete from networkm where nno=pnno;
delete from neuron where nno=pnno;
delete from weight where nno=pnno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ffwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `ffwd`(
 OUT `res` INTEGER
 )
BEGIN
declare nrn, done integer;
declare res boolean;
set done = 0;

select count(*) into nrn from neuron where nr_type='input' and nr_status = 1;

if (nrn<1) then
 call noting_to_propogate(); 
end if;


while not done do
 begin
 call forward(@res);
 select sum(nr_status) into nrn from neuron where nr_type = 'output';
 if (nrn>0) then
 call forward(@res);
 update neuron set nr_status = 0 where nr_type='output';
 set done = 1; 
 end if;
 end;
end while; 


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `forward` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `forward`(
        OUT `res` BOOLEAN
    )
BEGIN
/* ******************************************************* */
/* ONLY CALCULATE ONE STEP IF THERE IS ANY INDUCED NEURON */
/* */ 
/* 1. This procedure update output of all induced neurons */
/* Since frequency is almost 50 hz, this procedure ideally */
/* need to be called 50 times per second */
/* */
/* 2.Induce all linked neuron so that they will be */
/* calculated in the next step set passive to all induced */
/* neurons at the current stage */
/* ******************************************************* */
/* Kadir Erturk April 16th, 2014 */ 
/* All rights reserved and restricted, do not copy or use */ 
/* ******************************************************* */
start transaction;
UPDATE neuron n3,
(select 
	t.x, t.y, t.z, 
	sigm_real(
    sum(cmul_r(n.nr_outr, n.nr_outi, w.we_real, w.we_imag)) + t.nr_shiftr,
    sum(cmul_i(n.nr_outr, n.nr_outi, w.we_real, w.we_imag)) + t.nr_shifti ) as r,
    
    sigm_imag(
    sum(cmul_r(n.nr_outr, n.nr_outi, w.we_real, w.we_imag)) + t.nr_shiftr,
    sum(cmul_i(n.nr_outr, n.nr_outi, w.we_real, w.we_imag)) + t.nr_shifti ) as i
 from 	
	(select distinct w.we_tox as x, w.we_toy as y, w.we_toz as z, n0.nr_shiftr, n0.nr_shifti from neuron n1, weight w, neuron n0 where n1.nr_status = 1 and 
		n1.nr_x = w.we_fromx and n1.nr_y = w.we_fromy and n1.nr_z = w.we_fromz and w.we_tox = n0.nr_x and w.we_toy = n0.nr_y and w.we_toz = n0.nr_z ) as t,
    weight w, neuron n
where 
	t.x = w.we_tox and t.y = w.we_toy and t.z = w.we_toz and
    w.we_fromx = n.nr_x and 
    w.we_fromy = n.nr_y and 
    w.we_fromz = n.nr_z and 
    n.nr_status = 1
group by  
	t.x, t.y, t.z, t.nr_shiftr, t.nr_shifti) n4 
SET  
 n3.nr_outr = n4.r,
 n3.nr_outi = n4.i
WHERE
 n3.nr_x = n4.x and n3.nr_y = n4.y and n3.nr_z = n4.z;
 
update 
 neuron c, weight w, neuron f
set
 c.nr_status = 0,
 f.nr_status = 1
where
 c.nr_status = 1 and 
 c.nr_x = w.we_fromx and 
 c.nr_y = w.we_fromy and 
 c.nr_z = w.we_fromz and 
 
 f.nr_x = w.we_tox and 
 f.nr_y = w.we_toy and 
 f.nr_z = w.we_toz ; 
 
 set res = 1; 
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `forward_backup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `forward_backup`(
        OUT `res` BOOLEAN
    )
BEGIN
/* ******************************************************* */
/* ONLY CALCULATE ONE STEP IF THERE IS ANY INDUCED NEURON */
/* */ 
/* 1. This procedure update output of all induced neurons */
/* Since frequency is almost 50 hz, this procedure ideally */
/* need to be called 50 times per second */
/* */
/* 2.Induce all linked neuron so that they will be */
/* calculated in the next step set passive to all induced */
/* neurons at the current stage */
/* ******************************************************* */
/* Kadir Erturk April 16th, 2014 */ 
/* All rights reserved and restricted, do not copy or use */ 
/* ******************************************************* */
start transaction;
update neuron n3,
(select
 n1.nr_x as x, n1.nr_y as y, n1.nr_z as z, 
 sigm_real(
 sum(cmul_r(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shiftr,
 sum(cmul_i(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shifti
 ) as r,
 sigm_imag(
 sum(cmul_r(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shiftr,
 sum(cmul_i(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shifti
 ) as i
from
 neuron n1, weight w, neuron n0 
where
  
 n1.nr_x = w.we_fromx and 
 n1.nr_y = w.we_fromy and 
 n1.nr_z = w.we_fromz and
 
 n0.nr_status = 1 and
 n0.nr_x = w.we_tox and 
 n0.nr_y = w.we_toy and 
 n0.nr_z = w.we_toz
GROUP BY
 n1.nr_x, n1.nr_y, n1.nr_z) n4 
 set 
 n3.nr_outr = n4.r,
 n3.nr_outi = n4.i
 where
 n3.nr_x = n4.x and 
 n3.nr_y = n4.y and 
 n3.nr_z = n4.z;
 
update 
 neuron c, weight w, neuron f
set
 c.nr_status = 0,
 f.nr_status = 1
where
 c.nr_status = 1 and 
 c.nr_x = w.we_fromx and 
 c.nr_y = w.we_fromy and 
 c.nr_z = w.we_fromz and 
 
 f.nr_x = w.we_tox and 
 f.nr_y = w.we_toy and 
 f.nr_z = w.we_toz ; 
 
 set res = 1; 
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sigmoid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `sigmoid`(
 IN `preal` FLOAT,
 IN `pimag` FLOAT,
 OUT `rreal` FLOAT,
 OUT `rimag` FLOAT
 )
BEGIN
/* ********************************************** */
/* Complex Valued Sigmod Function                 */
/*                                                */
/* r = (1+e(-a)cosb) / (1+e(-2a) + 2e(-a)cosb)    */
/* i = e(-a)sinb / (1+e(-2a) + 2e(-a)cosb)        */
/* ********************************************** */
/* Copyright by Kadir Erturk 16th April, 2014     */
/* Please refer to gedenek.com/index.html         */
/* ********************************************** */
declare up float;
declare dn float;

set up := 1.0 + exp(-preal) * cos(pimag);
set dn := 1.0 + exp(-2*preal) + (2*exp(-preal)* cos(pimag));
set rreal := up/dn;

set up := exp(-preal) * sin(pimag);
set dn := 1.0 + exp(-2*preal) + (2*exp(-preal)* cos(pimag));
set rimag := up/dn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `topl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `topl`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
set preal = p1real + p2real ;
set pimag = p1imag + p2imag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `train`(
 OUT `res` BOOLEAN
 )
BEGIN
declare eps float;
set eps = 1.0;
update neuron nu, 

(select 
 n.nr_x, n.nr_y, n.nr_z,
 (1.0 - n.nr_outr) * (1 + n.nr_outr) * sum(w.we_real * n1.nr_delr + w.we_imag * n1.nr_deli) as r,
 (1.0 - n.nr_outi) * (1 + n.nr_outi) * sum(w.we_real * n1.nr_deli - w.we_imag * n1.nr_delr) as i
from 
 neuron n, weight w, neuron n1
where 
 n.nr_train = 1 and 
 w.we_tox = n.nr_x and
 w.we_toy = n.nr_y and 
 w.we_toz = n.nr_z and
 
 w.we_fromx = n1.nr_x and 
 w.we_fromy = n1.nr_y and 
 w.we_fromz = n1.nr_z 
group by 
 n.nr_x, n.nr_y, n.nr_z
order by 
 n.nr_x, n.nr_y, n.nr_z) nz
set 
 nu.nr_delr = r,
 nu.nr_deli = i
where
 nu.nr_x = nz.nr_x and 
 nu.nr_y = nz.nr_y and 
 nu.nr_z = nz.nr_z;
 
 
 update weight wu, /* update the weight to output layer */ 

(select
 w.we_fromx, w.we_fromy, w.we_fromz,
 w.we_tox, w.we_toy, w.we_toz, 
 w.we_real,
 w.we_imag, 
 w.we_real - eps * (n.nr_delr * b.nr_outr + n.nr_deli * b.nr_outi) as nw_real,
 w.we_imag - eps * (n.nr_deli * b.nr_outr - n.nr_delr * b.nr_outi) as nw_imag 
from 
 neuron n, weight w, neuron b
where
 n.nr_train = 1 and 
 n.nr_type = 'hidden' and 
 w.we_tox = n.nr_x and
 w.we_toy = n.nr_y and 
 w.we_toz = n.nr_z and 
 w.we_fromx = b.nr_x and 
 w.we_fromy = b.nr_y and 
 w.we_fromz = b.nr_z) wn
set 
 wu.we_preal = wu.we_real,
 wu.we_pimag = wu.we_imag,
 wu.we_real = wn.nw_real,
 wu.we_imag = wn.nw_imag
where
 wu.we_fromx = wn.we_fromx and 
 wu.we_fromy = wn.we_fromy and 
 wu.we_fromz = wn.we_fromz and 
 
 wu.we_tox = wn.we_tox and 
 wu.we_toy = wn.we_toy and 
 wu.we_toz = wn.we_toz;
 
 
 
update neuron n
set 
 n.nr_shiftr = n.nr_shiftr - eps * (n.nr_shiftr * n.nr_delr + n.nr_shifti * n.nr_deli),
 n.nr_shifti = n.nr_shifti - eps * (n.nr_shiftr * n.nr_deli - n.nr_shifti * n.nr_delr)
where
 n.nr_train = 1 and
 n.nr_type = 'hidden';
 
 
update 
 neuron o, weight w, neuron n 
set
 n.nr_train = 1,
 o.nr_train = 0
where
 o.nr_train = 1 and
 o.nr_x = w.we_tox and
 o.nr_y = w.we_toy and
 o.nr_z = w.we_toz and
 w.we_fromx = n.nr_x and 
 w.we_fromy = n.nr_y and 
 w.we_fromz = n.nr_z;
 
 set res=true;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-04 16:47:01
