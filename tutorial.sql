CREATE TABLE IF NOT EXISTS `tutorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(10) unsigned NOT NULL,
  `content` text(100000) NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
 
  KEY `FK_tutorial_owner` (`owner`),
 
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

