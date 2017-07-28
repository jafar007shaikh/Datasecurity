-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.7-beta-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cloud
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ cloud;
USE cloud;

--
-- Table structure for table `cloud`.`encrptfiles`
--

DROP TABLE IF EXISTS `encrptfiles`;
CREATE TABLE `encrptfiles` (
  `filename` varchar(300) NOT NULL default '',
  `pass` varchar(100) NOT NULL default '',
  `date1` varchar(100) NOT NULL default '',
  `UserId` varchar(50) default NULL,
  `key1` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloud`.`encrptfiles`
--

/*!40000 ALTER TABLE `encrptfiles` DISABLE KEYS */;
INSERT INTO `encrptfiles` (`filename`,`pass`,`date1`,`UserId`,`key1`) VALUES 
 ('tic-tac-toe.arff','8b4c35a202a126f75a3941a0516a090f5aa274ff','Sat Aug 01 13:05:22 IST 2015','admin','tic'),
 ('tic-tac-toe.arff','8b4c35a202a126f75a3941a0516a090f5aa274ff','Sat Aug 01 13:06:14 IST 2015','admin','tic');
/*!40000 ALTER TABLE `encrptfiles` ENABLE KEYS */;


--
-- Table structure for table `cloud`.`register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `name` varchar(45) NOT NULL default '',
  `UserId` varchar(45) NOT NULL default '',
  `Pass` varchar(45) NOT NULL default '',
  `contact` varchar(45) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloud`.`register`
--

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`name`,`UserId`,`Pass`,`contact`) VALUES 
 ('Govind','Govind12','1234','7745623212'),
 ('ram','ram12','ramram','12235443212'),
 ('abc','abc12','b2157e7b2ae716a747597717f1efb7a0','123'),
 ('anjaili','anjali15','e10adc3949ba59abbe56e057f20f883e','78956544450'),
 ('xyz','xyz','eb62f6b9306db575c2d596b1279627a4','7896543210'),
 ('a1','a123','ab56b4d92b40713acc5af89985d4b786','789743132154'),
 ('abc','abc12','900150983cd24fb0d6963f7d28e17f72','1234567890'),
 ('admin','admin','21232f297a57a5a743894a0e4a801fc3','7822212478');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;


--
-- Table structure for table `cloud`.`tblshare`
--

DROP TABLE IF EXISTS `tblshare`;
CREATE TABLE `tblshare` (
  `filename` varchar(300) NOT NULL default '',
  `UserId` varchar(45) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloud`.`tblshare`
--

/*!40000 ALTER TABLE `tblshare` DISABLE KEYS */;
INSERT INTO `tblshare` (`filename`,`UserId`) VALUES 
 ('C:UsersNavjotDocumentsanjali netbeans projectEncryptFILESdataset.txt','anjali16'),
 ('C:UsersNavjotDocumentsanjali netbeans projectEncryptFILESdataset.txt','anjali16'),
 ('C:UsersNavjotDocumentsanjali netbeans projectEncryptFILESdataset.txt','anjali16'),
 ('code.txt','anjali16'),
 ('code.txt','anjali16'),
 ('code.txt','anjali16'),
 ('code.txt','anjali16'),
 ('code.txt','anjali16'),
 ('code.txt','anjali16'),
 ('code.txt','anjali16'),
 ('dataset.txt','anjali16'),
 ('111.png','anjali16'),
 ('Tulips.jpg','anjali16'),
 ('upload.txt','anjali16'),
 ('oala.jpg','null'),
 ('oala.jpg','anjali16'),
 ('esert.jpg','anjali16'),
 ('esert.jpg','anjali16'),
 ('ellyfish.jpg','anjali16'),
 ('Chrysanthemum.jpg','anjali16'),
 ('ab.txt','anjali16'),
 ('ab.txt','anjali16'),
 ('lyrics.txt','anjali16'),
 ('tic-tac-toe.arff','admin');
/*!40000 ALTER TABLE `tblshare` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
