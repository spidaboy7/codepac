-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2012 at 01:13 AM
-- Server version: 5.1.62
-- PHP Version: 5.3.2-1ubuntu4.17

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
  `up_vote` int(10) DEFAULT '0',
  `down_vote` int(10) DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question` (`question`),
  KEY `FK_answer_owner` (`owner`),
  KEY `FK_answer_answer` (`replied_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `question`, `content`, `owner`, `replied_id`, `create_date`, `up_vote`, `down_vote`, `update_time`) VALUES
(1, 1, 'fasdfasd', 1, NULL, '2012-07-20 12:44:44', 4, 29, '0000-00-00 00:00:00'),
(2, 1, 'gds', 1, NULL, '2012-07-22 11:09:02', 4, 6, '0000-00-00 00:00:00'),
(3, 1, 'fasfd', 1, NULL, '2012-07-22 11:09:23', 0, 0, '0000-00-00 00:00:00'),
(4, 1, 'adsas\r\n', 1, NULL, '2012-07-22 11:09:42', 0, 0, '0000-00-00 00:00:00'),
(5, 1, 'vzdfsvxc ', 1, NULL, '2012-07-22 11:12:31', 0, 0, '0000-00-00 00:00:00'),
(6, 1, '<pre><code>System.out.code("hey dude");\r\nthis.setGear("here");\r\n</code></pre>', 1, NULL, '2012-07-22 11:44:04', 0, 0, '0000-00-00 00:00:00'),
(7, 3, '<pre><code>System.out.code("hey dude");\r\nthis.setGear("here");\r\n</code></pre>', 1, NULL, '2012-07-22 11:45:14', 1, 0, '0000-00-00 00:00:00'),
(8, 3, 'fasdfasdfas', 1, NULL, '2012-07-22 12:08:00', 0, 0, '0000-00-00 00:00:00'),
(9, 3, 'fasdfsd', 1, NULL, '2012-07-22 12:13:18', 0, 0, '0000-00-00 00:00:00'),
(10, 3, 'fasdfads', 1, NULL, '2012-07-22 12:15:31', 0, 0, '0000-00-00 00:00:00'),
(11, 1, 'System.print.out.ln("CODEPAC")\r\ni have no worries,i should learn is hardwork before you get older all the time i feel like loosing an inch on years of living', 1, NULL, '2012-07-23 21:36:11', 0, 0, '0000-00-00 00:00:00'),
(12, 1, 'i dont believe its true what you just said', 31, NULL, '2012-07-23 21:38:05', 0, 0, '0000-00-00 00:00:00'),
(13, 1, 'element.style {\r\n}\r\nMatched CSS Rules\r\n1media="screen, projection"\r\nhtml {\r\nfont-size: 100.01%;\r\n}\r\n1media="screen, projection"\r\nhtml {\r\nmargin: 0;\r\npadding: 0;\r\nborder: 0;\r\n}\r\nhtml[lang=en] {\r\n-webkit-locale: en;\r\n}\r\nuser agent stylesheethtml {\r\ndisplay: block;\r\n}', 31, NULL, '2012-07-23 21:39:24', 0, 0, '0000-00-00 00:00:00'),
(14, 1, 'fvafasf', 1, NULL, '2012-07-24 10:22:06', 0, 0, '0000-00-00 00:00:00'),
(15, 1, 'gfasfas', 1, NULL, '2012-07-24 10:25:28', 3, 3, '0000-00-00 00:00:00'),
(16, 1, '<pre><code>System.out.println("Hello CODEPAC");\r\n</code></pre>', 1, NULL, '2012-07-24 10:33:04', 0, 0, NULL),
(17, 1, '<p>gagafgaearesraewrwerwerwerewrawerfaraereareawreraewrewrareraew</p>\r\n\r\n<ul>\r\n<li><p>Chaning the other words</p></li>\r\n<li><p>I just came here</p></li>\r\n</ul>', 1, NULL, '2012-07-24 10:54:06', 0, 0, NULL),
(23, 1, '<pre><code>&lt;?php\r\n</code></pre>\r\n\r\n<p>class AnswerController extends Controller\r\n{\r\n        /**\r\n         * @var string the default layout for the views. Defaults to ''//layouts/column2'', meaning\r\n         * using two-column layout. See ''protected/views/layouts/column2.php''.\r\n         */\r\n        public $layout=''//layouts/column2'';\r\n        public $_question=null;</p>\r\n\r\n<pre><code>    /**\r\n     * @return array action filters\r\n     */\r\n    public function filters()\r\n    {\r\n            return array(\r\n                    ''accessControl'', // perform access control for CRUD operations                       \r\n                    ''questionContext + create'',//Checks to ensure a question existis before creating an answer entry\r\n            );\r\n    }\r\n    /*Executes the question context filtering\r\n    *This method is used by ''questionContext +create ''filter\r\n    *Its called before  everytime the actionCreate method  is being called\r\n    **/\r\n    public function filterQuestionContext($filterChain){\r\n    $questionId=null;\r\n    if(isset($_GET[''id''])){\r\n            $questionId=$_GET[''id''];\r\n    }\r\n    else{\r\n            if(isset($_POST[''id'']))\r\n                    $questionId=$_POST[''id''];\r\n    }\r\n    $this-&gt;loadQuestion($questionId);\r\n    $filterChain-&gt;run();\r\n    }\r\n</code></pre>\r\n\r\n<p>"AnswerController.php" 210L, 5355C                                                                                                         8,1-8         Top</p>', 1, NULL, '2012-07-24 12:08:53', 1, 1, NULL),
(24, 1, '<p>hey man</p>', 1, NULL, '2012-08-20 19:04:19', 9, 1, NULL),
(25, 8, '<p>can <code>System.out.println("syme")</code></p>', 1, NULL, '2012-09-06 11:25:59', 1, 1, NULL),
(26, 3, '<p></div></p>', 1, NULL, '2012-09-21 11:36:13', 0, 0, NULL),
(27, 3, '<p></div></p>', 1, NULL, '2012-09-21 11:36:36', 0, 0, NULL),
(28, 3, '<p></div></p>', 1, NULL, '2012-09-21 11:36:52', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `replied_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `tutorial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `tutorial` (`tutorial`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `owner`, `replied_id`, `create_date`, `update_time`, `tutorial`) VALUES
(1, 'hey man', 1, NULL, '2012-08-20 11:23:31', '0000-00-00 00:00:00', 1);

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
(1, 0, 'user', 6, 1, ''),
(1, 0, 'role', 4, 0, ''),
(1, 0, 'role', 5, 0, ''),
(1, 0, 'role', 6, 0, ''),
(1, 0, 'role', 7, 0, ''),
(1, 1, 'user', 3, 1, ''),
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
(31, 1, 1, 1, 1, 1, 1, 'admin', 63),
(32, 1, 1, 1, 1, 1, 1, '', NULL),
(33, 1, 1, 1, 1, 1, 1, '', NULL),
(34, 1, 1, 1, 1, 1, 1, '', NULL),
(35, 1, 1, 1, 1, 1, 1, '', NULL),
(36, 1, 1, 1, 1, 1, 1, '', NULL),
(37, 1, 1, 1, 1, 1, 1, '', NULL),
(38, 1, 1, 1, 1, 1, 1, '', NULL),
(39, 1, 1, 1, 1, 1, 1, '', NULL);

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
  `facebook_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `street`, `city`, `about`, `facebook_id`) VALUES
(1, 1, '2011-05-20 11:29:14', 'protected', 'admin', 'admin', 0, 1, 'webmaster@example.com', '', '', '', 0),
(35, 35, '0000-00-00 00:00:00', 'protected', 'chan', 'fabrice', 1, 1, 'quifabchan@gmail.com', NULL, NULL, NULL, 0),
(36, 36, '0000-00-00 00:00:00', 'protected', 'kwichan', 'chankwi', 1, 1, 'quifabchan@facebook.com', NULL, NULL, NULL, 0),
(37, 37, '0000-00-00 00:00:00', 'protected', 'webmaster@example.com', 'Tim', 1, 1, 'norkans7@gmail.com', NULL, NULL, NULL, 0),
(38, 38, '0000-00-00 00:00:00', 'protected', 'tech', 'codepac', 1, 1, 'eliemagambo@gmail.com', NULL, NULL, NULL, 0),
(39, 39, '0000-00-00 00:00:00', 'protected', 'gatete', 'gatete', 1, 1, 'dagatim@yahoo.fr', NULL, NULL, NULL, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `profile_field`
--

INSERT INTO `profile_field` (`id`, `field_group_id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
(1, 0, 'email', 'E-Mail', '', 'VARCHAR', 255, 0, 1, '', '', '', 'CEmailValidator', '', 0, 3, NULL),
(2, 0, 'firstname', 'First name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, NULL),
(3, 0, 'lastname', 'Last name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, NULL),
(4, 0, 'street', 'Street', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, NULL),
(5, 0, 'city', 'City', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, NULL),
(6, 0, 'about', 'About', '', 'TEXT', 255, 0, 0, '', '', '', '', '', 0, 3, NULL),
(7, 0, 'facebook_id', 'en', 'facebook_id', 'INTEGER', 10, 10, 0, '', '', 'facebook_id is incorrect', '', '', 0, 0, NULL);

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
  `vote` int(10) DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `title`, `content`, `owner`, `status`, `create_date`, `update_time`, `vote`, `views`) VALUES
(1, 'Hey man..change', 'Hello There', 1, NULL, '2012-07-20 09:57:48', '0000-00-00 00:00:00', 0, 3),
(2, 'Tim', '<p>Sytem.out.println("hey man");</p>', 1, NULL, '2012-07-20 10:09:36', '0000-00-00 00:00:00', 0, 1),
(3, 'Jimmy', '<pre><code>System.out.println("")\r\n</code></pre>', 1, NULL, '2012-07-20 10:11:10', '0000-00-00 00:00:00', 0, 0),
(4, 'domain', '<pre><code> &lt;script type="text/javascript" src="/codepac/css/wmd/jQuery/jquery-1.2.6.min.js "&gt;&lt;/script&gt;\r\n    &lt;script type="text/javascript" src="/codepac/css/wmd/showdown.js"&gt;&lt;/script&gt;\r\n    &lt;script type="text/javascript" src="/codepac/css/prettify/src/prettify.js"&gt;&lt;/script&gt;\r\n\r\n    &lt;!-- blueprint CSS framework --&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/screen.css" media="screen, projection" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/print.css" media="print" /&gt;\r\n    &lt;!--[if lt IE 8]&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/ie.css" media="screen, projection" /&gt;\r\n    &lt;![endif]--&gt;\r\n\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/main.css" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/form.css" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/prettify/src/prettify.css" /&gt;\r\n    &lt;link rel="stylesheet" type="text/css" href="&lt;?php echo Yii::app()-&gt;request-&gt;baseUrl; ?&gt;/css/wmd/wmd.css" /&gt;\r\n\r\n    &lt;title&gt;&lt;?php echo CHtml::encode($this-&gt;pageTitle); ?&gt;&lt;/title&gt;\r\n</code></pre>\r\n\r\n<p></head></p>\r\n\r\n<p><body onload="styleCode()"></p>\r\n\r\n<div class="container" id="page">\r\n\r\n        <div id="header">\r\n                <div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>\r\n\r\n<pre><code>    &lt;/div&gt;&lt;!-- header --&gt;\r\n\r\n    &lt;div id="mainmenu"&gt;\r\n            &lt;?php $this-&gt;widget(''zii.widgets.CMenu'',array(\r\n                    ''items''=&gt;array(\r\n                            array(''label''=&gt;''Home'', ''url''=&gt;array(''/site/index'')),\r\n                            array(''label''=&gt;''About'', ''url''=&gt;array(''/site/page'', ''view''=&gt;''about'')),\r\n                            array(''label''=&gt;''Contact'', ''url''=&gt;array(''/site/contact'')),\r\n                            array(''label''=&gt;''Login'', ''url''=&gt;array(''/user/auth''), ''visible''=&gt;Yii::app()-&gt;user-&gt;isGuest),\r\n                            array(''label''=&gt;''Logout (''.Yii::app()-&gt;user-&gt;name.'')'', ''url''=&gt;array(''/user/user/logout''), ''visible''=&gt;!Yii::app()-&gt;user-&gt;isGuest),\r\n                            array(''label''=&gt;''My profile '', ''url''=&gt;array(''/user/user/''), ''visible''=&gt;!Yii::app()-&gt;user-&gt;isGuest),\r\n                                                                                                                                       6,19-26       17%\r\n</code></pre>', 31, NULL, '2012-07-20 10:52:02', '0000-00-00 00:00:00', 0, 0),
(5, 'tittle', '<p>mkkl,l;.<code>System.out.println("")</code></p>', 1, NULL, '2012-08-17 18:33:07', NULL, 0, 0),
(6, 'hey', '<p>i am</p>', 1, NULL, '2012-08-20 19:02:55', NULL, 0, 0),
(7, 'Jquery loading twice on yii framework', '<p>Hi,i have a problem with JQuery,it is listed in code once but when i load the source code of my page after loading,it is shown twice,i think the framework register it when the page loads but i dont know how to prevent it to load automatically,</p>\r\n\r\n<p>here are my source code:</p>\r\n\r\n<pre><code>&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;\r\n</code></pre>\r\n\r\n<p><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r\n<head>\r\n        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n        <meta name="language" content="en" />\r\n        <script type="text/javascript" src="/codepac/css/wmd/showdown.js"></script>\r\n        <script type="text/javascript" src="/codepac/css/wmd/jQuery/jquery-1.2.6.min.js "></script>\r\n        <script type="text/javascript" src="/codepac/css/custom_js.js "></script>\r\n        <script type="text/javascript" src="/codepac/css/prettify/src/prettify.js"></script></p>\r\n\r\n<p>notice that it is loaded once here but when i open the source code in my browser it comes like this:</p>\r\n\r\n<pre><code>&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;\r\n</code></pre>\r\n\r\n<p><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r\n<head>\r\n    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n    <meta name="language" content="en" />\r\n        <script type="text/javascript" src="/codepac/css/wmd/showdown.js"></script>\r\n    <script type="text/javascript" src="/codepac/css/wmd/jQuery/jquery-1.2.6.min.js "></script>\r\n    <script type="text/javascript" src="assets/1233435/c/yii.jquery.min.js "></script>\r\n        <script type="text/javascript" src="/codepac/css/prettify/src/prettify.js"></script></p>\r\n\r\n<pre><code>&lt;!-- blueprint CSS framework --&gt;\r\n&lt;link rel="stylesheet" type="text/css" href="/codepacu/css/screen.css" media="screen, projection" /&gt;\r\n&lt;link rel="stylesheet" type="text/css" href="/codepacu/css/print.css" media="print" /&gt;\r\n&lt;!--[if lt IE 8]&gt;\r\n</code></pre>', 38, NULL, '2012-09-05 15:14:07', NULL, 0, 2),
(8, 'facebook login not redirecting me to the correct page', '<p>I integrated facebook with my application,after a successful login,instead of directing me to the home page,it keeps reloading the login page,any answer is appreciated!Thanks</p>\r\n\r\n<p>here is the piece of code i think are causing me trouble:</p>\r\n\r\n<pre><code>window.fbAsyncInit = function() {\r\nFB.init({\r\n    appId   : ''&lt;?php echo $facebook-&gt;getAppId(); ?&gt;'',\r\n    session : &lt;?php echo json_encode($fb_session); ?&gt;, // don''t refetch the session when PHP already has it\r\n    status  : &lt;?php echo $fbconfig[''status'']; ?&gt;, // check login status\r\n    cookie  : &lt;?php echo $fbconfig[''cookie'']; ?&gt;, // enable cookies to allow the server to access the session\r\n    xfbml   : &lt;?php echo $fbconfig[''xfbml'']; ?&gt; // parse XFBML\r\n});\r\n\r\n// whenever the user logs in, we refresh the page\r\nFB.Event.subscribe(''auth.login'', function() {\r\n    window.location.reload();\r\n});\r\n</code></pre>\r\n\r\n<p>There are the facebook login code,you can find more details <a href="http://developers.facebook.com/blog/post/2011/05/13/how-to--handle-expired-access-tokens/">here</a></p>', 38, NULL, '2012-09-05 15:21:33', NULL, 0, 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `title`, `description`, `is_membership_possible`, `price`, `duration`) VALUES
(1, 'UserManager', 'This users can manage Users', 0, 0, 0),
(2, 'Demo', 'Users having the demo role', 0, 0, 0),
(3, 'Business', 'Example Business account', 0, 9.99, 7),
(4, 'Premium', 'Example Premium account', 0, 19.99, 28),
(5, 'moderator', 'They can moderate post and comments', 0, NULL, NULL);

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
-- Table structure for table `tutorial`
--

CREATE TABLE IF NOT EXISTS `tutorial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` mediumtext NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tutorial`
--

INSERT INTO `tutorial` (`id`, `title`, `content`, `owner`, `create_date`, `update_time`) VALUES
(1, 'here i am', '<pre><code>\r\nSystem.out.println("Hello there man");\r\n</code></pre>', 1, '2012-08-16 11:38:13', '0000-00-00 00:00:00'),
(2, 'here is what we do', 'a', 1, '2012-08-16 20:46:30', '0000-00-00 00:00:00'),
(3, 'introduction to git and github', 'github is source version control', 38, '2012-09-05 14:30:43', '0000-00-00 00:00:00'),
(4, 'fixing skype microphone problem on ubuntu', '<p>Through the years, Ubuntu started to support most major vendor''s hardwares. Now in 9.10, all drivers on my laptop works with the default Ubuntu install. Except for the errant microphone which let me down every time i had to skype someone. Well, not anymore. Here''s a quick fix :\r\n</p>\r\nOpen a terminal and type in alsamixer hit enter.\r\n <br/>\r\nyour screen will be looking like  this \r\n<br/>\r\n\r\n<img src="../../../../images/site/skpe_alsamixer.png">', 38, '2012-09-05 14:38:20', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `avatar`, `notifyType`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', '', 1305883754, 1349958399, 1349958570, 1348219987, 1, 1, 'gravatar', 'Instant'),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', '', 1305883754, 1342611533, 1342613024, 0, 0, 1, NULL, 'Instant'),
(27, 'dagatim', 'b17c4501a6a6717f92f3ca13eaa4df54', '1', 1342687905, 0, 0, 0, 0, -2, 'gravatar', 'Instant'),
(28, 'elie', 'b17c4501a6a6717f92f3ca13eaa4df54', 'e374833fcf2a7c69cddb914790764deb', 1342693969, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(29, 'eliedagatim', 'b17c4501a6a6717f92f3ca13eaa4df54', '6af288352864552732465d53842eee98', 1342696146, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(30, 'elie1', 'b17c4501a6a6717f92f3ca13eaa4df54', 'b9b334ed4855ee55e581c3868c753a9d', 1342696366, 0, 0, 0, 0, 1, 'gravatar', 'Instant'),
(31, 'eliemagambo', 'b17c4501a6a6717f92f3ca13eaa4df54', '1', 1342696777, 1343072245, 1342774495, 0, 0, 1, 'gravatar', 'Instant'),
(32, 'chan', 'f118026e0fafb7d711605a747e7d09df', '6950af380d5eaa64d8e8348d5cd8f16a', 1343201820, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(33, 'timo', 'b17c4501a6a6717f92f3ca13eaa4df54', 'fc814c702a459cb89cb69b1cc3990917', 1343202203, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(34, 'chan1', '1593e1fe0a7f4cab10122b98c034741d', '523c5513f8ad878258c66727d189d5c1', 1343202293, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(35, 'fabrice', '9970101954ff9f37f462eb285599ce91', '90d400670af306b5f5469e602a4c98c6', 1343202567, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(36, 'kwizera', '587f65f3d9864531b96f8ba66b186453', '8d6e73d126fd131d6ddd74008d641b67', 1343202671, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(37, 'norkans', '08c85fea4614256805347e08b1a9c29e', '92abc713daa763e2b03a99153598019c', 1343230290, 0, 0, 0, 0, 0, 'gravatar', 'Instant'),
(38, 'codepac', 'c0a84fd807f7b3131ca819aee3614bf5', '1', 1346765506, 1346848169, 0, 0, 0, 1, 'images/user/38_1_tim.png', 'Instant'),
(39, 'tim', 'b17c4501a6a6717f92f3ca13eaa4df54', '1', 1348577322, 1349362292, 1349362374, 0, 0, 1, 'gravatar', 'Instant');

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
(1, 5),
(2, 3),
(2, 5),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(27, 5),
(28, 5),
(38, 5);

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
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_tutorial_coment` FOREIGN KEY (`tutorial`) REFERENCES `tutorial` (`id`) ON DELETE CASCADE;

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

--
-- Constraints for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD CONSTRAINT `FK_tutorial_owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;
