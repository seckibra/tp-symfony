-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 10 jan. 2020 à 02:02
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `monsite`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E6612469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `category_id`, `title`, `content`, `date`) VALUES
(1, 1, 'psg écrase saint-étienne', 'L’AS Saint-Étienne peut en témoigner : les quatre fantastiques ne sont pas qu’une invention de Marvel. Les Verts se sont coltiné en pleine face les quatre stars offensives du Paris Saint-Germain ce mercredi soir en quart de finale de la Coupe de la Ligue BKT (6-1). Au coup d’envoi, Thomas Tuchel avait donc décidé d’aligner Angel Di Maria, Neymar, Kylian Mbappé et Mauro Icardi. Résultat des courses : six buts et des stats pour les quatre.', '2015-01-01'),
(2, 1, 'Marseille rennes vendredi', 'le 2e affronte le 3e ce vendredi.\r\nLe Roazhon Park sera complet pour la première fois de la saison, vendredi (20h45) pour la réception de l\'Olympique de Marseille, dans le cadre de la 20e journée de Ligue 1. Le Stade Rennais a officialisé la nouvelle ce mercredi.', '2015-01-01'),
(3, 1, 'test', 'test', '2020-01-10');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `label`) VALUES
(1, 'sport', 'c\'est du sport foot volley basket ...'),
(2, 'culture', 'boring'),
(3, 'divers', 'c\'est du divers');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191108095049', '2019-11-08 09:50:57'),
('20200102004601', '2020-01-02 00:47:30'),
('20200102024658', '2020-01-02 02:47:07'),
('20200109190056', '2020-01-09 19:01:23'),
('20200109212944', '2020-01-09 21:30:11'),
('20200110001608', '2020-01-10 00:16:35');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'ibou500@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WHlTbDAvdGs2dENtV3lMTg$JTPgofyt7OowZGgxSt0wqbzhfabQmKCvUiBo2lIHFVg'),
(2, 'admin@admin.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$aHNqUzJ1VGg2dVN0Yy5PSQ$msV2y9dmql13KZUV5iYoytGham8U78SK7AGlesAMylE');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
