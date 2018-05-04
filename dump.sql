-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: example
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogposts`
--

DROP TABLE IF EXISTS `blogposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogposts`
--

LOCK TABLES `blogposts` WRITE;
/*!40000 ALTER TABLE `blogposts` DISABLE KEYS */;
INSERT INTO `blogposts` VALUES (1240,'Via skripts pÃ¥ server sidan sÃ¥ kan man skapa mer dynamiska och sÃ¤krare sidor Ã¤n om man bara hade anvÃ¤nd CGI program fÃ¶r att skapa sidan. Server script arkitekturen fungerar pÃ¥ det sÃ¤ttet att klienten skickar en â€fÃ¶rfrÃ¥ganâ€ oftast med Post eller Get till servern som servern sedan bearbetar. Denna fÃ¶rfrÃ¥gan skickas med hjÃ¤lp av ett protokoll, detta protokoll Ã¤r nÃ¤stan alltid http eller https dÃ¤r skillnaden Ã¤r att https Ã¤r krypterar datan som skickas. Anledningen att man behÃ¶ver kryptera datan Ã¤r fÃ¶r att skydda sig mot â€mannen i mittenâ€ attacker. Dessa attacker gÃ¥r ut pÃ¥ att fÃ¥ tag pÃ¥ sÃ¥rbar data typ som kreditkorts uppgifter. NÃ¤r datan kommer fram sÃ¥ dekrypteras datan om den Ã¤r krypterar och sedan skickar ett program som heter apache2 det vidare till en PHP fil, apache2 Ã¤r ne typ av webbserver. I PHP filen sÃ¥ kÃ¶rs PHP koden som i sin tur lÃ¤gger in html kod beroende pÃ¥ vilken data som skickas. NÃ¤r all kod har blivit bearbetad sÃ¥ skickas den tillbaka till klienten i from av en html fil, detta kalas respons. Ett exempel Ã¤r om man skriver in fel lÃ¶sen ord sÃ¥ kommer inte server skicka klienten vidare till bloggen istÃ¤llet sÃ¥ stannar klienten pÃ¥ samma sida. \r\nFÃ¶r att kunna skapa en server sÃ¥ anvÃ¤ndes Vagrant, vagrant i sin tur anvÃ¤nder sig av VirtualBox fÃ¶r att skapa en virtuell maskin som server kÃ¶rs pÃ¥. \r\nKlient: en klient Ã¤r nÃ¥gonting som Ã¤r uppkopplat till en server, det kan vara en mobil eller en dator. \r\nserver: en server kan ses som en kraftfull dator som ska kunna hantera alla klienter som besÃ¶ker eller ska anvÃ¤nda serverns funktioner.\r\nWebb server: en webb server Ã¤r en del av servern, ett program som anvÃ¤ndes fÃ¶r att hantera webb servrar Ã¤r apache2.\r\nScript sprÃ¥k: ett skript sprÃ¥k Ã¤r ett hÃ¶gnivÃ¥ sprÃ¥k som anvÃ¤ndes fÃ¶r att ge datorn instruktioner. \r\nNÃ¤tverksprotokoll: ett nÃ¤tverksprotokoll beskriver hur datan ska skickas och hur den ska bearbetas.\r\nDatabas: en databas Ã¤r en del av en server, det Ã¤r dÃ¤r information sparras. \r\nVirtualBox: VirtualBox Ã¤r ett program som anvÃ¤nds fÃ¶r att skapa virtuella maskiner. \r\n\r\nDen fÃ¶rsta risken som min sida kan bli pÃ¥verkad av Ã¤r injektion. Eftersom ingen av min â€inputsâ€ Ã¤r skyddade sÃ¥ kan vem som helst skriva in sql kod fÃ¶r att fÃ¥ fram information som de vill ha. \r\nDen andra risken Ã¤r â€broken accses controlâ€. Eftersom min sida inte omdirigerar klienten om den inte Ã¤r inloggad sÃ¥ kan den komma till sidor som den inte ska genom att skriva in det i url:en. Den kan Ã¤ven komma logga in pÃ¥ konton utan lÃ¶senord genom att skriva anvÃ¤ndares id i url:en.\r\nDen tredje risken Ã¤r â€cross site scriptingâ€. Eftersom min sida inte skyddar inputs sÃ¥ kan man skriva scripts i kommentarer eller blogginlÃ¤gg fÃ¶r att fÃ¥ koden att kÃ¶ras. \r\nDen fjÃ¤rde risken Ã¤r â€broken authenticationâ€. Eftersom min kod inte anvÃ¤nder â€mulit factor authenticationâ€ sÃ¥ vet inte server om det Ã¤r rÃ¤tt person som loggar in. \r\n','blogginlÃ¤gg',1);
/*!40000 ALTER TABLE `blogposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogpost_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `blogpost_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1240,'15254407802016-09-04(1).png');
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1240,'hf','hf');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-04 13:38:23
