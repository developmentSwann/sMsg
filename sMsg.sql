CREATE TABLE `twt_names` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL DEFAULT 'Nom utilisateur',
  `max` varchar(100) NOT NULL DEFAULT 'Oui'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `twt_names`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `twt_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
