--
-- Base de données : `devise`
--

-- --------------------------------------------------------

--
-- Structure de la table `donnee`
--

DROP TABLE IF EXISTS `donnee`;
CREATE TABLE IF NOT EXISTS `donnee` (
  `monnaie` varchar(25) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_change` datetime NOT NULL,
  `taux_change` decimal(25,20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `donnee_monnaie_FK` (`monnaie`)
) ENGINE=InnoDB AUTO_INCREMENT=19681 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `monnaie`
--

DROP TABLE IF EXISTS `monnaie`;
CREATE TABLE IF NOT EXISTS `monnaie` (
  `monnaie` varchar(25) NOT NULL,
  PRIMARY KEY (`monnaie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `donnee`
--
ALTER TABLE `donnee`
  ADD CONSTRAINT `donnee_monnaie_FK` FOREIGN KEY (`monnaie`) REFERENCES `monnaie` (`monnaie`);
COMMIT;