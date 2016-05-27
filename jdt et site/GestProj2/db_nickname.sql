-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 18 Mai 2016 à 11:55
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `db_nickname`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_section`
--

CREATE TABLE IF NOT EXISTS `t_section` (
  `idSection` tinyint(4) NOT NULL AUTO_INCREMENT,
  `secName` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idSection`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_section`
--

INSERT INTO `t_section` (`idSection`, `secName`) VALUES
(1, 'Informatique'),
(2, 'WebDesign'),
(3, 'Théorie du complot'),
(4, 'Physique'),
(5, 'Automatique');

-- --------------------------------------------------------

--
-- Structure de la table `t_teacher`
--

CREATE TABLE IF NOT EXISTS `t_teacher` (
  `idTeacher` tinyint(4) NOT NULL AUTO_INCREMENT,
  `teaLastName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `teaFirstName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `teaGender` enum('Femme','Homme','Autre') CHARACTER SET utf8 NOT NULL,
  `teaNickName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `teaOrigin` text CHARACTER SET utf8 NOT NULL,
  `fkSection` tinyint(4) NOT NULL,
  `teaPicture` varchar(80) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `teaModifiedBy` varchar(50) NOT NULL,
  PRIMARY KEY (`idTeacher`),
  KEY `fkSection` (`fkSection`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Contenu de la table `t_teacher`
--

INSERT INTO `t_teacher` (`idTeacher`, `teaLastName`, `teaFirstName`, `teaGender`, `teaNickName`, `teaOrigin`, `fkSection`, `teaPicture`, `isDelete`, `teaModifiedBy`) VALUES
(0, 'Yvan', 'Cochet', 'Homme', 'Le_chat_poilu', 'Bo goce', 3, '', 0, 'admin'),
(22, 'Pereira Dos Santos', 'Eduardo Miguel', 'Homme', 'HD-Remix', 'Provient du remake de street fighter 2', 1, '', 1, 'admin'),
(28, 'sallai', 'nolan', 'Homme', 'morpilou', '', 2, '../../userContent/profilesPictures/05-2016-181463553591.jpg', 0, 'user');

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `useName` varchar(20) NOT NULL,
  `usePassword` varchar(100) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_user`
--

INSERT INTO `t_user` (`idUser`, `useName`, `usePassword`) VALUES
(3, 'admin', '$2y$10$eqgkYc4O.Zt8cfbTQjziQ.mZLbjenQaL4XzE30lvu264cNb78neFS'),
(4, 'user', '$2y$10$1gMqGsdSKU1b86gB8IGIde6/k952ekenuRt9VKM8LaepdVl3Gn3Bq');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_teacher`
--
ALTER TABLE `t_teacher`
  ADD CONSTRAINT `t_teacher_ibfk_1` FOREIGN KEY (`fkSection`) REFERENCES `t_section` (`idSection`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
