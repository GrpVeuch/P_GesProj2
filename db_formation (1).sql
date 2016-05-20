-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 20 Mai 2016 à 08:46
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `db_formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `do`
--

CREATE TABLE IF NOT EXISTS `do` (
  `idTeacher` int(11) NOT NULL AUTO_INCREMENT,
  `idFormation` int(11) NOT NULL,
  PRIMARY KEY (`idTeacher`,`idFormation`),
  KEY `FK_Do_idFormation` (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `do`
--

INSERT INTO `do` (`idTeacher`, `idFormation`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `frequent`
--

CREATE TABLE IF NOT EXISTS `frequent` (
  `idClasses` int(11) NOT NULL AUTO_INCREMENT,
  `idStudent` int(11) NOT NULL,
  PRIMARY KEY (`idClasses`,`idStudent`),
  KEY `FK_Frequent_idStudent` (`idStudent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frequent`
--

INSERT INTO `frequent` (`idClasses`, `idStudent`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `participate`
--

CREATE TABLE IF NOT EXISTS `participate` (
  `idStudent` int(11) NOT NULL AUTO_INCREMENT,
  `idFormation` int(11) NOT NULL,
  PRIMARY KEY (`idStudent`,`idFormation`),
  KEY `FK_Participate_idFormation` (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `participate`
--

INSERT INTO `participate` (`idStudent`, `idFormation`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `teach`
--

CREATE TABLE IF NOT EXISTS `teach` (
  `idTeacher` int(11) NOT NULL,
  `idClasses` int(11) NOT NULL,
  PRIMARY KEY (`idTeacher`,`idClasses`),
  KEY `FK_Teach_idClasses` (`idClasses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `teach`
--

INSERT INTO `teach` (`idTeacher`, `idClasses`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_classes`
--

CREATE TABLE IF NOT EXISTS `t_classes` (
  `idClasses` int(11) NOT NULL AUTO_INCREMENT,
  `claStartDate` date NOT NULL,
  `claLocation` varchar(50) NOT NULL,
  `claLength` int(11) NOT NULL,
  `claComment` text,
  `claNoSequence` int(11) NOT NULL,
  `idFormation` int(11) NOT NULL,
  PRIMARY KEY (`idClasses`),
  KEY `FK_t_classes_idFormation` (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_classes`
--

INSERT INTO `t_classes` (`idClasses`, `claStartDate`, `claLocation`, `claLength`, `claComment`, `claNoSequence`, `idFormation`) VALUES
(1, '2016-05-16', 'ETML', 12, 'Aucun', 1, 1),
(2, '2016-05-23', 'ETML', 12, 'Aucun', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_comment`
--

CREATE TABLE IF NOT EXISTS `t_comment` (
  `idComment` int(11) NOT NULL AUTO_INCREMENT,
  `comDate` date NOT NULL,
  `comComment` text NOT NULL,
  `idStatistic` int(11) NOT NULL,
  PRIMARY KEY (`idComment`),
  KEY `FK_t_Comment_idStatistic` (`idStatistic`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_comment`
--

INSERT INTO `t_comment` (`idComment`, `comDate`, `comComment`, `idStatistic`) VALUES
(1, '2016-05-09', 'L''enseignant peut répondre à toutes les questions posées par les étudiants.', 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_formation`
--

CREATE TABLE IF NOT EXISTS `t_formation` (
  `idFormation` int(11) NOT NULL AUTO_INCREMENT,
  `forName` varchar(60) NOT NULL,
  `forMaxStudent` int(11) NOT NULL,
  `forStartTime` date NOT NULL,
  `forLength` int(11) NOT NULL,
  `forType` varchar(25) NOT NULL,
  `forLocation` varchar(50) NOT NULL,
  `forPrice` int(11) NOT NULL,
  `forComment` text,
  PRIMARY KEY (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_formation`
--

INSERT INTO `t_formation` (`idFormation`, `forName`, `forMaxStudent`, `forStartTime`, `forLength`, `forType`, `forLocation`, `forPrice`, `forComment`) VALUES
(1, '306', 16, '2016-05-16', 12, 'Module ICT', 'ETML', 10, 'Aucun'),
(2, '133', 16, '2016-05-02', 12, 'Module ICT', 'ETML', 9, 'Aucun');

-- --------------------------------------------------------

--
-- Structure de la table `t_statistic`
--

CREATE TABLE IF NOT EXISTS `t_statistic` (
  `idStatistic` int(11) NOT NULL AUTO_INCREMENT,
  `staDate` date NOT NULL,
  `staQuestion` text NOT NULL,
  `staNote` text NOT NULL,
  `idFormation` int(11) NOT NULL,
  PRIMARY KEY (`idStatistic`),
  KEY `FK_t_statistic_idFormation` (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_statistic`
--

INSERT INTO `t_statistic` (`idStatistic`, `staDate`, `staQuestion`, `staNote`, `idFormation`) VALUES
(1, '2016-05-09', 'L''enseignant connaît son sujet', 'Plutôt vrai', 1),
(2, '2016-05-09', 'L''évaluation du cours est pertinante', 'Tout à fait vrai', 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_student`
--

CREATE TABLE IF NOT EXISTS `t_student` (
  `idStudent` int(11) NOT NULL AUTO_INCREMENT,
  `stuLastName` varchar(60) NOT NULL,
  `stuFirstName` varchar(60) NOT NULL,
  `stuStatus` varchar(25) NOT NULL,
  `stuAVS` varchar(50) DEFAULT NULL,
  `stuPhone` varchar(10) NOT NULL,
  `stuStreet` varchar(100) NOT NULL,
  `stuPostalCode` varchar(10) NOT NULL,
  `stuCity` varchar(25) NOT NULL,
  `stuMail` varchar(70) NOT NULL,
  PRIMARY KEY (`idStudent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_student`
--

INSERT INTO `t_student` (`idStudent`, `stuLastName`, `stuFirstName`, `stuStatus`, `stuAVS`, `stuPhone`, `stuStreet`, `stuPostalCode`, `stuCity`, `stuMail`) VALUES
(1, 'Di Giacomo', 'Théo', 'Student', NULL, '0794580511', 'Ch.des Cheasaux 11a', '1053', 'Cugy', 'theo.digiacomo@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `t_teacher`
--

CREATE TABLE IF NOT EXISTS `t_teacher` (
  `idTeacher` int(11) NOT NULL AUTO_INCREMENT,
  `teaLastName` varchar(60) NOT NULL,
  `teaFirstName` varchar(60) NOT NULL,
  `teaPhone` varchar(10) NOT NULL,
  `teaStreet` varchar(100) NOT NULL,
  `teaPostalCode` varchar(10) NOT NULL,
  `teaCity` varchar(25) NOT NULL,
  `teaMail` varchar(70) NOT NULL,
  PRIMARY KEY (`idTeacher`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_teacher`
--

INSERT INTO `t_teacher` (`idTeacher`, `teaLastName`, `teaFirstName`, `teaPhone`, `teaStreet`, `teaPostalCode`, `teaCity`, `teaMail`) VALUES
(1, 'Hardegger', 'Cindy', '0791234567', 'Ch.Du Jesaispasou 13b', '0000', 'Troupaumé', 'cindy.hardegger@gmail.com');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `do`
--
ALTER TABLE `do`
  ADD CONSTRAINT `FK_Do_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `t_formation` (`idFormation`),
  ADD CONSTRAINT `FK_Do_idTeacher` FOREIGN KEY (`idTeacher`) REFERENCES `t_teacher` (`idTeacher`);

--
-- Contraintes pour la table `frequent`
--
ALTER TABLE `frequent`
  ADD CONSTRAINT `FK_Frequent_idClasses` FOREIGN KEY (`idClasses`) REFERENCES `t_classes` (`idClasses`),
  ADD CONSTRAINT `FK_Frequent_idStudent` FOREIGN KEY (`idStudent`) REFERENCES `t_student` (`idStudent`);

--
-- Contraintes pour la table `participate`
--
ALTER TABLE `participate`
  ADD CONSTRAINT `FK_Participate_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `t_formation` (`idFormation`),
  ADD CONSTRAINT `FK_Participate_idStudent` FOREIGN KEY (`idStudent`) REFERENCES `t_student` (`idStudent`);

--
-- Contraintes pour la table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `FK_Teach_idClasses` FOREIGN KEY (`idClasses`) REFERENCES `t_classes` (`idClasses`),
  ADD CONSTRAINT `FK_Teach_idTeacher` FOREIGN KEY (`idTeacher`) REFERENCES `t_teacher` (`idTeacher`);

--
-- Contraintes pour la table `t_classes`
--
ALTER TABLE `t_classes`
  ADD CONSTRAINT `FK_t_classes_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `t_formation` (`idFormation`);

--
-- Contraintes pour la table `t_comment`
--
ALTER TABLE `t_comment`
  ADD CONSTRAINT `FK_t_Comment_idStatistic` FOREIGN KEY (`idStatistic`) REFERENCES `t_statistic` (`idStatistic`);

--
-- Contraintes pour la table `t_statistic`
--
ALTER TABLE `t_statistic`
  ADD CONSTRAINT `FK_t_statistic_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `t_formation` (`idFormation`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
