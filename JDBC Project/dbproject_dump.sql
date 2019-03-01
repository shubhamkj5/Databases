-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproject
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `earning_per_year`
--

DROP TABLE IF EXISTS `earning_per_year`;
/*!50001 DROP VIEW IF EXISTS `earning_per_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `earning_per_year` AS SELECT 
 1 AS `Income`,
 1 AS `release_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `film` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `view_duration` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '4.99',
  `length` smallint(5) unsigned DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'ACADEMY DINOSAUR','A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies',2006,6,0.99,86,'PG','Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42'),(2,'ACE GOLDFINGER','A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China',2006,3,4.99,48,'G','Trailers,Deleted Scenes','2006-02-15 05:03:42'),(3,'ADAPTATION HOLES','A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory',2006,7,2.99,50,'NC-17','Trailers,Deleted Scenes','2006-02-15 05:03:42'),(4,'AFFAIR PREJUDICE','A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank',2006,5,2.99,117,'G','Commentaries,Behind the Scenes','2006-02-15 05:03:42'),(5,'AFRICAN EGG','A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico',2006,6,2.99,130,'G','Deleted Scenes','2006-02-15 05:03:42'),(6,'AGENT TRUMAN','A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China',2006,3,2.99,169,'PG','Deleted Scenes','2006-02-15 05:03:42'),(7,'AIRPLANE SIERRA','A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat',2006,6,4.99,62,'PG-13','Trailers,Deleted Scenes','2006-02-15 05:03:42'),(8,'AIRPORT POLLOCK','A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India',2006,6,4.99,54,'R','Trailers','2006-02-15 05:03:42'),(9,'ALABAMA DEVIL','A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat',2006,3,2.99,114,'PG-13','Trailers,Deleted Scenes','2006-02-15 05:03:42'),(13,'ALI FOREVER','A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies',2006,4,4.99,150,'PG','Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42'),(14,'ALICE FANTASIA','A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia',2006,6,0.99,94,'NC-17','Trailers,Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42'),(15,'ALIEN CENTER','A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention',2006,5,2.99,46,'NC-17','Trailers,Commentaries,Behind the Scenes','2006-02-15 05:03:42'),(16,'ALLEY EVOLUTION','A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans',2006,6,2.99,180,'NC-17','Trailers,Commentaries','2006-02-15 05:03:42'),(17,'ALONE TRIP','A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House',2006,3,0.99,82,'R','Trailers,Behind the Scenes','2006-02-15 05:03:42'),(18,'ALTER VICTORY','A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies',2006,6,0.99,57,'PG-13','Trailers,Behind the Scenes','2006-02-15 05:03:42'),(19,'AMADEUS HOLY','A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon',2006,6,0.99,113,'PG','Commentaries,Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42'),(22,'Avengers Infinity War','Super Marvel',2017,33,5.20,3,'PG','Trailers','2019-02-28 23:24:11'),(24,'Avengers Infinity War','Super Marvel',2017,33,5.20,3,'PG','Trailers','2019-03-01 00:58:02'),(27,'Avengers Endgame','Super Marvel',2017,37,5.20,3,'PG','Trailers','2019-03-01 02:20:46');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `film_insert_date` BEFORE INSERT ON `film` FOR EACH ROW SET NEW.last_update = NOW() */;;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `film_update_date` BEFORE UPDATE ON `film` FOR EACH ROW SET NEW.last_update = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `views_per_rating`
--

DROP TABLE IF EXISTS `views_per_rating`;
/*!50001 DROP VIEW IF EXISTS `views_per_rating`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `views_per_rating` AS SELECT 
 1 AS `View_Minutes`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dbproject'
--

--
-- Dumping routines for database 'dbproject'
--
/*!50003 DROP FUNCTION IF EXISTS `average_earning_per_feature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `average_earning_per_feature`(
feature varchar(25)
) RETURNS varchar(25) CHARSET utf8mb4
BEGIN
  DECLARE Income  varchar(25); 

	select avg(rental_rate*length)
	into Income
	from film
	where special_features like CONCAT('%', feature, '%');
 RETURN Income;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `average_earning_per_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `average_earning_per_rating`(
rating varchar(25)
) RETURNS varchar(25) CHARSET utf8mb4
BEGIN
  DECLARE Income  varchar(25); 
	select avg(rental_rate*length)
	into Income
	from film
	where rating = rating;
 RETURN Income;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_film` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_film`(
   p_id smallint(5)
)
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
   START TRANSACTION;  
DELETE FROM `dbproject`.`film`
WHERE film_id=p_id;

IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_film` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_film`(
  p_title    VARCHAR(255),
  p_description text,
  p_release_year year(4),
  p_view_duration tinyint(3),
  p_rental_rate decimal(4,2),
  p_length smallint(5),
  p_rating enum('G','PG','PG-13','R','NC-17'),
  p_special_features set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes')
)
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
   START TRANSACTION;  

INSERT INTO `dbproject`.`film`
(
`title`,
`description`,
`release_year`,
`view_duration`,
`rental_rate`,
`length`,
`rating`,
`special_features`)
VALUES
(
p_title ,
p_description,
p_release_year ,
p_view_duration,
p_rental_rate,
p_length,
p_rating,
p_special_features
);

IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_film` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_film`(
  p_id smallint(5),
  p_title    VARCHAR(255),
  p_description text,
  p_release_year year(4),
  p_view_duration tinyint(3),
  p_rental_rate decimal(4,2),
  p_length smallint(5),
  p_rating enum('G','PG','PG-13','R','NC-17'),
  p_special_features set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes')
 
)
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
   START TRANSACTION;  

UPDATE `dbproject`.`film`
SET
`title` = p_title,
`description` = p_description,
`release_year` = p_release_year,
`view_duration` = p_view_duration,
`rental_rate` = p_rental_rate,
`length` = p_length,
`rating` = p_rating,
`special_features` = p_special_features

WHERE `film_id` = p_id;


IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `earning_per_year`
--

/*!50001 DROP VIEW IF EXISTS `earning_per_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `earning_per_year` AS select (`film`.`view_duration` * `film`.`rental_rate`) AS `Income`,`film`.`release_year` AS `release_year` from `film` group by `film`.`release_year` order by `Income` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `views_per_rating`
--

/*!50001 DROP VIEW IF EXISTS `views_per_rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `views_per_rating` AS select (`film`.`view_duration` * `film`.`length`) AS `View_Minutes`,`film`.`rating` AS `rating` from `film` group by `film`.`rating` order by `View_Minutes` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-01  4:00:29
