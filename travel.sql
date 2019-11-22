-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.16 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.2.0.5623
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 travel 的数据库结构
CREATE DATABASE IF NOT EXISTS `travel` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travel`;

-- 导出  表 travel.home 结构
DROP TABLE IF EXISTS `home`;
CREATE TABLE IF NOT EXISTS `home` (
  `home_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_author` int(11) DEFAULT NULL,
  `home_info` varchar(50) DEFAULT NULL,
  `home_picture` text,
  `home_video` text,
  `home_create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`home_id`),
  KEY `FK_home_user` (`home_author`),
  CONSTRAINT `FK_home_user` FOREIGN KEY (`home_author`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  travel.home 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `home` DISABLE KEYS */;
/*!40000 ALTER TABLE `home` ENABLE KEYS */;

-- 导出  表 travel.level 结构
DROP TABLE IF EXISTS `level`;
CREATE TABLE IF NOT EXISTS `level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_identity` int(11) DEFAULT NULL,
  `level_name` char(50) DEFAULT NULL,
  `level_create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`level_id`),
  KEY `FK_level_user` (`level_identity`),
  CONSTRAINT `FK_level_user` FOREIGN KEY (`level_identity`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  travel.level 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
REPLACE INTO `level` (`level_id`, `level_identity`, `level_name`, `level_create_time`) VALUES
	(1, 1, '管理员', '2019-11-20 08:21:13'),
	(2, 2, '代理', '2019-11-20 08:21:38'),
	(3, 3, '用户', '2019-11-20 08:28:08');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;

-- 导出  表 travel.menu 结构
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_author` int(11) DEFAULT NULL COMMENT '作者',
  `menu_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `menu_context` text COMMENT '内容',
  `menu_kind` int(11) DEFAULT NULL COMMENT '分类',
  `menu_picture` text COMMENT '图片',
  `menu_video` text COMMENT '视频',
  `menu_create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`menu_id`),
  KEY `FK_menu_user` (`menu_author`),
  KEY `FK_menu_type` (`menu_kind`),
  CONSTRAINT `FK_menu_type` FOREIGN KEY (`menu_kind`) REFERENCES `type` (`type_id`),
  CONSTRAINT `FK_menu_user` FOREIGN KEY (`menu_author`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  travel.menu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- 导出  表 travel.type 结构
DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  travel.type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
REPLACE INTO `type` (`type_id`, `type_name`) VALUES
	(1, '旅游');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

-- 导出  表 travel.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` char(50) DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `user_nickname` char(50) DEFAULT NULL COMMENT '昵称',
  `user_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `user_create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  travel.user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`user_id`, `user_name`, `user_password`, `user_nickname`, `user_status`, `user_create_time`) VALUES
	(1, 'admin', 'admin', '系统管理员', 0, '2019-11-20 08:18:56'),
	(2, 'daili', 'daili', '模块管理员', 0, '2019-11-20 08:19:59'),
	(3, 'user', 'user', '普通用户', 0, '2019-11-20 08:27:59');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
