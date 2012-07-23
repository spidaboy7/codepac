-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 22, 2012 at 03:02 PM
-- Server version: 5.1.62
-- PHP Version: 5.3.2-1ubuntu4.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codepacu`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`id`, `title`, `comment`, `subject`) VALUES
(1, 'message_write', NULL, NULL),
(2, 'message_receive', NULL, NULL),
(3, 'user_create', NULL, NULL),
(4, 'user_update', NULL, NULL),
(5, 'user_remove', NULL, NULL),
(6, 'user_admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `replied_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question` (`question`),
  KEY `FK_answer_owner` (`owner`),
  KEY `FK_answer_answer` (`replied_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `question`, `content`, `owner`, `replied_id`, `create_date`, `update_time`) VALUES
(1, 1, 'fasdfasd', 1, NULL, '2012-07-20 12:44:44', '0000-00-00 00:00:00'),
(2, 1, 'gds', 1, NULL, '2012-07-22 11:09:02', '0000-00-00 00:00:00'),
(3, 1, 'fasfd', 1, NULL, '2012-07-22 11:09:23', '0000-00-00 00:00:00'),
(4, 1, 'adsas\r\n', 1, NULL, '2012-07-22 11:09:42', '0000-00-00 00:00:00'),
(5, 1, 'vzdfsvxc ', 1, NULL, '2012-07-22 11:12:31', '0000-00-00 00:00:00'),
(6, 1, '<pre><code>System.out.code("hey dude");\r\nthis.setGear("here");\r\n</code></pre>', 1, NULL, '2012-07-22 11:44:04', '0000-00-00 00:00:00'),
(7, 3, '<pre><code>System.out.code("hey dude");\r\nthis.setGear("here");\r\n</code></pre>', 1, NULL, '2012-07-22 11:45:14', '0000-00-00 00:00:00'),
(8, 3, 'fasdfasdfas', 1, NULL, '2012-07-22 12:08:00', '0000-00-00 00:00:00'),
(9, 3, 'fasdfsd', 1, NULL, '2012-07-22 12:13:18', '0000-00-00 00:00:00'),
(10, 3, 'fasdfads', 1, NULL, '2012-07-22 12:15:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE IF NOT EXISTS `friendship` (
  `inviter_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `acknowledgetime` int(11) DEFAULT NULL,
  `requesttime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`inviter_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friendship`
--


-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE IF NOT EXISTS `membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `end_date` int(11) DEFAULT NULL,
  `payment_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `membership`
--


-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `message_read` tinyint(1) NOT NULL,
  `answered` tinyint(1) NOT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `message`
--


-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `title`, `text`) VALUES
(1, 'Prepayment', NULL),
(2, 'Paypal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `principal_id` int(11) NOT NULL,
  `subordinate_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('user','role') NOT NULL,
  `action` int(11) NOT NULL,
  `template` tinyint(1) NOT NULL,
  `comment` text,
  PRIMARY KEY (`principal_id`,`subordinate_id`,`type`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`principal_id`, `subordinate_id`, `type`, `action`, `template`, `comment`) VALUES
(1, 0, 'role', 4, 0, ''),
(1, 0, 'role', 5, 0, ''),
(1, 0, 'role', 6, 0, ''),
(1, 0, 'role', 7, 0, ''),
(2, 0, 'role', 1, 0, 'Users can write messagse'),
(2, 0, 'role', 2, 0, 'Users can receive messagse'),
(2, 0, 'role', 3, 0, 'Users are able to view visits of his profile');

-- --------------------------------------------------------

--
-- Table structure for table `privacysetting`
--

CREATE TABLE IF NOT EXISTS `privacysetting` (
  `user_id` int(10) unsigned NOT NULL,
  `message_new_friendship` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_message` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_profilecomment` tinyint(1) NOT NULL DEFAULT '1',
  `appear_in_search` tinyint(1) NOT NULL DEFAULT '1',
  `show_online_status` tinyint(1) NOT NULL DEFAULT '1',
  `log_profile_visits` tinyint(1) NOT NULL DEFAULT '1',
  `ignore_users` varchar(255) DEFAULT NULL,
  `public_profile_fields` bigint(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privacysetting`
--

INSERT INTO `privacysetting` (`user_id`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
(1, 1, 1, 1, 1, 1, 1, '', 63),
(2, 1, 1, 1, 1, 1, 1, NULL, NULL),
(3, 1, 1, 1, 1, 1, 1, '', NULL),
(4, 1, 1, 1, 1, 1, 1, '', NULL),
(5, 1, 1, 1, 1, 1, 1, '', NULL),
(6, 1, 1, 1, 1, 1, 1, '', NULL),
(7, 1, 1, 1, 1, 1, 1, '', NULL),
(8, 1, 1, 1, 1, 1, 1, '', NULL),
(9, 1, 1, 1, 1, 1, 1, '', NULL),
(10, 1, 1, 1, 1, 1, 1, '', NULL),
(11, 1, 1, 1, 1, 1, 1, '', NULL),
(12, 1, 1, 1, 1, 1, 1, '', NULL),
(13, 1, 1, 1, 1, 1, 1, '', NULL),
(14, 1, 1, 1, 1, 1, 1, '', NULL),
(15, 1, 1, 1, 1, 1, 1, '', NULL),
(16, 1, 1, 1, 1, 1, 1, '', NULL),
(17, 1, 1, 1, 1, 1, 1, '', NULL),
(18, 1, 1, 1, 1, 1, 1, '', NULL),
(19, 1, 1, 1, 1, 1, 1, '', NULL),
(20, 1, 1, 1, 1, 1, 1, '', NULL),
(21, 1, 1, 1, 1, 1, 1, '', NULL),
(22, 1, 1, 1, 1, 1, 1, '', NULL),
(23, 1, 1, 1, 1, 1, 1, '', NULL),
(24, 1, 1, 1, 1, 1, 1, '', NULL),
(25, 1, 1, 1, 1, 1, 1, '', NULL),
(26, 1, 1, 1, 1, 1, 1, '', NULL),
(27, 1, 1, 1, 1, 1, 1, '', NULL),
(28, 1, 1, 1, 1, 1, 1, '', NULL),
(29, 1, 1, 1, 1, 1, 1, '', NULL),
(30, 1, 1, 1, 1, 1, 1, '', NULL),
(31, 1, 1, 1, 1, 1, 1, 'admin', 63);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `privacy` enum('protected','private','public') NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `show_friends` tinyint(1) DEFAULT '1',
  `allow_comments` tinyint(1) DEFAULT '1',
  `email` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `street`, `city`, `about`) VALUES
(1, 1, '2011-05-20 11:29:14', 'protected', 'admin', 'admin', 0, 1, 'webmaster@example.com', NULL, NULL, NULL),
(31, 31, '0000-00-00 00:00:00', 'protected', 'gatete', 'gatete', 0, 1, 'eliemagambo@gmail.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_comment`
--

CREATE TABLE IF NOT EXISTS `profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profile_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile_field`
--

CREATE TABLE IF NOT EXISTS `profile_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `varname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hint` text NOT NULL,
  `field_type` varchar(50) NOT NULL DEFAULT '',
  `field_size` int(3) NOT NULL DEFAULT '0',
  `field_size_min` int(3) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(255) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `related_field_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `profile_field`
--

INSERT INTO `profile_field` (`id`, `field_group_id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
(1, 0, 'email', 'E-Mail', '', 'VARCHAR', 255, 0, 1, '', '', '', 'CEmailValidator', '', 0, 3, NULL),
(2, 0, 'firstname', 'First name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, NULL),
(3, 0, 'lastname', 'Last name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, NULL),
(4, 0, 'street', 'Street', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, NULL),
(5, 0, 'city', 'City', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, NULL),
(6, 0, 'about', 'About', '', 'TEXT', 255, 0, 0, '', '', '', '', '', 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_visit`
--

CREATE TABLE IF NOT EXISTS `profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_visit`
--

INSERT INTO `profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1, 2, 1342633395, 1342633395, 1),
(1, 9, 1342632461, 1342632461, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `title`, `content`, `owner`, `status`, `create_date`, `update_time`) VALUES
(1, 'Hey man..change', 'Hello There', 1, NULL, '2012-07-20 09:57:48', '0000-00-00 00:00:00'),
(2, 'Tim', '<p>Sytem.out.println("hey man");</p>', 1, NULL, '2012-07-20 10:09:36', '0000-00-00 00:00:00'),
(3, 'Jimmy', '<pre><code>System.out.println("")\r\n</code></pre>', 1, NULL, '2012-07-20 10:11:10', '0000-00-00 00:00:00'),
(4, 'domain', '<pre><code> &lt;script type="text/javascript" src="/codepac/css/wmd/jQuery/jquery-1.2.6.min.js "&gt;&lt;/script&gt;\r\n    &lt;script type="text/javascript" src="/codepac/css/wmd/showdown.js"&gt;&lt;/script&gt;\r\n    &lt;script type="text/javascript" src="/codepac/css/prettify/src/prettify.js"&gt;&lt;/script&gt;\r\n\r\n    &lt;!-- blueprint CSS framework --&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/screen.css" media="screen, projection" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/print.css" media="print" /&gt;\r\n    &lt;!--[if lt IE 8]&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/ie.css" media="screen, projection" /&gt;\r\n    &lt;![endif]--&gt;\r\n\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/main.css" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/form.css" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/prettify/src/prettify.css" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/wmd/wmd.css" /&gt;\r\n\r\n    &lt;title&gt;&lt;?php echo CHtml::encode($this-&gt;pageTitle); ?&gt;&lt;/title&gt;\r\n</code></pre>\r\n\r\n<p></head></p>\r\n\r\n<p><body onload="styleCode()"></p>\r\n\r\n<div class="container" id="page">\r\n\r\n        <div id="header">\r\n                <div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>\r\n\r\n<pre><code>    &lt;/div&gt;&lt;!-- header --&gt;\r\n\r\n    &lt;div id="mainmenu"&gt;\r\n            &lt;?php $this-&gt;widget(''zii.widgets.CMenu'',array(\r\n                    ''items''=&gt;array(\r\n                            array(''label''=&gt;''Home'', ''url''=&gt;array(''/site/index'')),\r\n                            array(''label''=&gt;''About'', ''url''=&gt;array(''/site/page'', ''view''=&gt;''about'')),\r\n                            array(''label''=&gt;''Contact'', ''url''=&gt;array(''/site/contact'')),\r\n                            array(''label''=&gt;''Login'', ''url''=&gt;array(''/user/auth''), ''visible''=&gt;Yii::app()-&gt;user-&gt;isGuest),\r\n                            array(''label''=&gt;''Logout (''.Yii::app()-&gt;user-&gt;name.'')'', ''url''=&gt;array(''/user/user/logout''), ''visible''=&gt;!Yii::app()-&gt;user-&gt;isGuest),\r\n                            array(''label''=&gt;''My profile '', ''url''=&gt;array(''/user/user/''), ''visible''=&gt;!Yii::app()-&gt;user-&gt;isGuest),\r\n                                                                                                                                       6,19-26       17%\r\n</code></pre>', 31, NULL, '2012-07-20 10:52:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_membership_possible` tinyint(1) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) DEFAULT NULL COMMENT 'How long a membership is valid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `title`, `description`, `is_membership_possible`, `price`, `duration`) VALUES
(1, 'UserManager', 'This users can manage Users', 0, 0, 0),
(2, 'Demo', 'Users having the demo role', 0, 0, 0),
(3, 'Business', 'Example Business account', 0, 9.99, 7),
(4, 'Premium', 'Example Premium account', 0, 19.99, 28);

-- --------------------------------------------------------

--
-- Table structure for table `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
  `message` varbinary(255) NOT NULL,
  `translation` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`message`,`language`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translation`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `activationKey` varchar(128) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) NOT NULL DEFAULT '0',
  `lastaction` int(10) NOT NULL DEFAULT '0',
  `lastpasswordchange` int(10) NOT NULL DEFAULT '0',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `notifyType` enum('None','Digest','Instant','Treshhold') DEFAULT 'Instant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `avatar`, `notifyType`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 1305883754, 1342949492, 1342954303, 0, 1, 1, 'gravatar', 'Instant'),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', '', 1305883754, 1342611533, 1342613024, 0, 0, 1, NULL, 'Instant'),
(27, 'dagatim', 'b17c4501a6a6717f92f3ca13eaa4df54', '1', 1342687905, 0, 0, 0, 0, 1, 'gravatar', 'Instant'),
(28, 'elie', 'b17c4501a6a6717f92f3ca13eaa4df54', 'e374833fcf2a7c69cddb914790764deb', 1342693969, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(29, 'eliedagatim', 'b17c4501a6a6717f92f3ca13eaa4df54', '6af288352864552732465d53842eee98', 1342696146, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(30, 'elie1', 'b17c4501a6a6717f92f3ca13eaa4df54', 'b9b334ed4855ee55e581c3868c753a9d', 1342696366, 0, 0, 0, 0, 1, 'gravatar', 'Instant'),
(31, 'eliemagambo', 'b17c4501a6a6717f92f3ca13eaa4df54', '1', 1342696777, 1342774275, 1342774495, 0, 0, 1, 'gravatar', 'Instant');

-- --------------------------------------------------------

--
-- Table structure for table `usergroup`
--

CREATE TABLE IF NOT EXISTS `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `usergroup`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `jointime` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_id`, `group_id`, `jointime`) VALUES
(2, 1, 1305281400),
(2, 2, 1305282762);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_messages`
--

CREATE TABLE IF NOT EXISTS `user_group_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_group_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(2, 3),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `yumtextsettings`
--

CREATE TABLE IF NOT EXISTS `yumtextsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('en_us','de','fr','pl','ru','es','ro') NOT NULL DEFAULT 'en_us',
  `text_email_registration` text,
  `subject_email_registration` text,
  `text_email_recovery` text,
  `text_email_activation` text,
  `text_friendship_new` text,
  `text_friendship_confirmed` text,
  `text_profilecomment_new` text,
  `text_message_new` text,
  `text_membership_ordered` text,
  `text_payment_arrived` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `yumtextsettings`
--

INSERT INTO `yumtextsettings` (`id`, `language`, `text_email_registration`, `subject_email_registration`, `text_email_recovery`, `text_email_activation`, `text_friendship_new`, `text_friendship_confirmed`, `text_profilecomment_new`, `text_message_new`, `text_membership_ordered`, `text_payment_arrived`) VALUES
(1, 'en_us', 'You have registered to www.codepac.org. To confirm your E-Mail address, please visit {activation_url}', 'You have registered to www.codepac.org', 'You have requested a new Password. To set your new Password,\n										please go to {activation_url}', 'Your account has been activated. Thank you for your registration.', 'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}', 'The User {username} has accepted your friendship request', 'You have a new profile comment from {username}: {message} visit your profile: {link_profile}', 'You have received a new message from {username}: {message}', 'Your order of membership {membership} on {order_date} has been taken. Your order Number is {id}. You have choosen the payment style {payment}.', 'Your payment has been received on {payment_date} and your Membership {id} is now active'),
(2, 'de', 'Sie haben sich für unsere Applikation registriert. Bitte bestätigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}', 'Sie haben sich für eine Applikation registriert.', 'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen link: {activation_url}', 'Ihr Konto wurde freigeschaltet.', 'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n							 Nachricht: {message}\n\n							 Klicken sie <a href="{link_friends}">hier</a>, um diese Anfrage zu bestätigen oder zu ignorieren. Alternativ können sie <a href="{link_profile}">hier</a> auf ihre Profilseite zugreifen.', 'Der Benutzer {username} hat ihre Freundschaftsanfrage bestätigt.', '\n							 Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n							 {message}\n\n							 <a href="{link}">hier</a> geht es direkt zu Ihrer Pinnwand!', 'Sie haben eine neue Nachricht von {username} bekommen: {message}', 'Ihre Bestellung der Mitgliedschaft {membership} wurde am {order_date} entgegen genommen. Die gewählte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.', 'Ihre Zahlung wurde am {payment_date} entgegen genommen. Ihre Mitgliedschaft mit der Nummer {id} ist nun Aktiv.'),
(3, 'es', 'Te has registrado en esta aplicación. Para confirmar tu dirección de correo electrónico, por favor, visita {activation_url}.', 'Te has registrado en esta aplicación.', 'Has solicitado una nueva contraseña. Para establecer una nueva contraseña, por favor ve a {activation_url}', 'Tu cuenta ha sido activada. Gracias por registrarte.', 'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve a tus contactos: {link}', 'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}', 'Please translatore thisse hiere toh tha espagnola langsch {username}', 'Has recibido un mensaje de {username}: {message}', 'Tu orden de membresía {membership} de fecha {order_date} fué tomada. Tu número de orden es {id}. Escogiste como modo de pago {payment}.', 'Tu pago fué recibido en fecha {payment_date}. Ahora tu Membresía {id} ya está activa'),
(4, 'fr', '', '', '', '', '', '', '', '', '', ''),
(5, 'ro', '', '', '', '', '', '', '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_answer_answer` FOREIGN KEY (`replied_id`) REFERENCES `answer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_answer_owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_questions_answer` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_questions_user` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;
