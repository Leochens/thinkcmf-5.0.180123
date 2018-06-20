-- phpMyAdmin SQL Dump
-- version 4.0.10.11
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2018-06-10 10:39:04
-- 服务器版本: 5.5.54-log
-- PHP 版本: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";   

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `record`
--

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `rank` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`, `rank`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `comment_author_id` int(11) NOT NULL,
  `content` varchar(300) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- 表的结构 `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friend_id` (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `friends`
--

INSERT INTO `friends` (`user_id`, `friend_id`) VALUES
(18, 18);

-- --------------------------------------------------------

--
-- 表的结构 `massages`
--

CREATE TABLE IF NOT EXISTS `massages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(3) DEFAULT '1' COMMENT '1评论 2回复 3加好友 4系统',
  `from_id` int(11) DEFAULT NULL COMMENT '发消息的人id 0为系统消息',
  `to_id` int(11) DEFAULT NULL COMMENT '接收消息的人 ',
  `content` varchar(300) DEFAULT NULL,
  `extra` text,
  `create_time` datetime DEFAULT NULL,
  `link` text COMMENT '点击跳转链接',
  `head_pic` varchar(300) DEFAULT NULL COMMENT '用户头像图片链接 0为系统',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `massages`
--

INSERT INTO `massages` (`id`, `type`, `from_id`, `to_id`, `content`, `extra`, `create_time`, `link`, `head_pic`) VALUES
(1, '1', 3, 5, '测试消息', '', '2018-05-21 17:41:49', 'http://record.mokis.top', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `records`
--

CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '无标题',
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` varchar(2) NOT NULL DEFAULT '1' COMMENT '1普通用户记录 2 管理员记录',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- 转存表中的数据 `records`
--

INSERT INTO `records` (`id`, `title`, `content`, `user_id`, `create_time`, `type`, `hits`) VALUES
(52, '无标题', '在我的说说中，您可以查看自己已经发布的说说。可以对它们进行操作，点击卡片的右上角，即可调出操作面板，可以进行说说的删除、编辑、分享等操作。', 18, '2018-06-10 10:23:53', '1', 0),
(53, '无标题', '在好友列表，您可以方便的查看您关注的用户，并可以执行删除操作。', 18, '2018-06-10 10:25:19', '1', 0),
(54, '无标题', '在注销登录菜单里，您可以退出登录。', 18, '2018-06-10 10:25:50', '1', 0),
(55, '无标题', '在添加好友菜单里，输入您好友的id，就可以找到他并且关注他喽，但是要注意，您添加他为好友但是并不代表他页添加您为好友了哦，所以快告诉他你的用户名，让他加你为好友吧！', 18, '2018-06-10 10:27:50', '1', 0),
(56, '无标题', '在添加说说菜单里，您可以发布您的说说，您的说说会被您的好友看到，您的好友可以对您的说说进行评论，同时，您也可以回复好友对您说说的评论。还有，您可以对喜欢的说说进行点赞哦~', 18, '2018-06-10 10:29:38', '1', 0),
(57, '无标题', '首先映入眼帘的就是好友说说啦，这里显示的是您好友发表的说说，按照时间降序排列。下面就是贴心的Leochens(咳咳，作者)为您准备的使用说明书啦。', 18, '2018-06-10 10:31:53', '1', 0),
(58, '无标题', '欢迎使用Leoc趣说，在Leoc趣说上您可以发表您的生活趣事，和他人分享你的快乐。也可以驻足围观他人的身边事，在Leoc上您可以做最真实的自我，和万千用户一起，分享生活，享受幸福！\r\n\r\n\r\n可以点击左边的github链接在github上找到项目哦，这是个开源项目，如果觉得好别忘了fork一下哦。\r\n ——Leochens', 18, '2018-06-10 10:33:32', '1', 1);

--
-- 触发器 `records`
--
DROP TRIGGER IF EXISTS `tri_del_comment`;
DELIMITER //
CREATE TRIGGER `tri_del_comment` BEFORE DELETE ON `records`
 FOR EACH ROW delete from comments
	where
	OLD.id=comments.record_id
//
DELIMITER ;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `record_comment`
--
CREATE TABLE IF NOT EXISTS `record_comment` (
`id` int(11)
,`record_id` int(11)
,`comment_author_id` int(11)
,`content` varchar(300)
,`create_time` datetime
,`parent_id` int(11)
,`name` varchar(32)
,`record_author_id` int(11)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `single_user_records`
--
CREATE TABLE IF NOT EXISTS `single_user_records` (
`user_id` int(11)
,`author` varchar(32)
,`id` int(11)
,`title` varchar(64)
,`content` text
,`create_time` datetime
,`hits` int(11)
);
-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `is_forbidden` varchar(2) NOT NULL DEFAULT '0' COMMENT '用户是否被禁言',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `is_forbidden`) VALUES
(18, 'test_user', 'e10adc3949ba59abbe56e057f20f883e', '0');

--
-- 触发器 `users`
--
DROP TRIGGER IF EXISTS `tri_delete_on_records_friends`;
DELIMITER //
CREATE TRIGGER `tri_delete_on_records_friends` BEFORE DELETE ON `users`
 FOR EACH ROW BEGIN
  DELETE FROM records WHERE user_id = OLD.id;
	DELETE FROM friends WHERE (user_id = OLD.id or friend_id = OLD.id);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `user_friends`
--
CREATE TABLE IF NOT EXISTS `user_friends` (
`user_id` int(11)
,`user_name` varchar(32)
,`friend_id` int(11)
,`friend_name` varchar(32)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `user_friends_cnt`
--
CREATE TABLE IF NOT EXISTS `user_friends_cnt` (
`user_id` int(11)
,`cnt` bigint(21)
);
-- --------------------------------------------------------

--
-- 视图结构 `record_comment`
--
DROP TABLE IF EXISTS `record_comment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `record_comment` AS select `comments`.`id` AS `id`,`comments`.`record_id` AS `record_id`,`comments`.`comment_author_id` AS `comment_author_id`,`comments`.`content` AS `content`,`comments`.`create_time` AS `create_time`,`comments`.`parent_id` AS `parent_id`,`users`.`name` AS `name`,`users`.`id` AS `record_author_id` from (`comments` join `users`) where (`comments`.`comment_author_id` = `users`.`id`);

-- --------------------------------------------------------

--
-- 视图结构 `single_user_records`
--
DROP TABLE IF EXISTS `single_user_records`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `single_user_records` AS select `users`.`id` AS `user_id`,`users`.`name` AS `author`,`records`.`id` AS `id`,`records`.`title` AS `title`,`records`.`content` AS `content`,`records`.`create_time` AS `create_time`,`records`.`hits` AS `hits` from (`users` join `records`) where (`users`.`id` = `records`.`user_id`);

-- --------------------------------------------------------

--
-- 视图结构 `user_friends`
--
DROP TABLE IF EXISTS `user_friends`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_friends` AS (select `users`.`id` AS `user_id`,`users`.`name` AS `user_name`,`x`.`id` AS `friend_id`,`x`.`name` AS `friend_name` from ((`users` join `friends`) join `users` `x`) where ((`users`.`id` = `friends`.`user_id`) and `x`.`id` in (select `friends`.`friend_id` from `users`)));

-- --------------------------------------------------------

--
-- 视图结构 `user_friends_cnt`
--
DROP TABLE IF EXISTS `user_friends_cnt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_friends_cnt` AS select `friends`.`user_id` AS `user_id`,count(0) AS `cnt` from `friends` where `friends`.`user_id` in (select `users`.`id` from `users`) group by `friends`.`user_id`;

--
-- 限制导出的表
--

--
-- 限制表 `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`);

--
-- 限制表 `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`);

--
-- 限制表 `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
