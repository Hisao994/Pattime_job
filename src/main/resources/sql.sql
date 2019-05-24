-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.58 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 recruit 的数据库结构
CREATE DATABASE IF NOT EXISTS `recruit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `recruit`;


-- 导出  表 recruit.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兼职发布表id',
  `admin_username` varchar(30) NOT NULL COMMENT 'admin用户名',
  `admin_password` varchar(100) NOT NULL COMMENT 'admin密码',
  `admin_jointime` date NOT NULL COMMENT 'admin加入时间',
  `admin_lastip` varchar(200) DEFAULT NULL COMMENT 'ip',
  `admin_permission` int(11) NOT NULL COMMENT '管理员权限：是否为子管理 0/1',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 recruit.applyinfo 结构
CREATE TABLE IF NOT EXISTS `applyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `merchant_wantedjob_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。


-- 导出  表 recruit.job 结构
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keycode` varchar(255) DEFAULT NULL COMMENT '对外键',
  `parameter` varchar(255) DEFAULT NULL COMMENT '值',
  `fathernode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。


-- 导出  表 recruit.merchant_baseinfo 结构
CREATE TABLE IF NOT EXISTS `merchant_baseinfo` (
  `merchant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `merchant_name` varchar(50) DEFAULT NULL COMMENT '商家名',
  `merchant_username` varchar(30) DEFAULT NULL COMMENT '商家登陆用户名',
  `merchant_password` varchar(255) DEFAULT NULL COMMENT '商家登陆密码',
  `merchant_telephone` varchar(15) DEFAULT NULL COMMENT '商家电话',
  `merchant_license` varchar(40) DEFAULT NULL COMMENT '营业执照码',
  `merchant_idcard` varchar(25) DEFAULT NULL COMMENT '店主身份证',
  `merchant_hostname` varchar(10) DEFAULT NULL COMMENT '店主名',
  `merchant_email` varchar(255) DEFAULT NULL COMMENT '商家邮箱',
  `power` int(11) DEFAULT '1' COMMENT '权限',
  PRIMARY KEY (`merchant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。


-- 导出  表 recruit.merchant_wantedjob 结构
CREATE TABLE IF NOT EXISTS `merchant_wantedjob` (
  `merchant_id` int(11) NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `workdescp` varchar(255) DEFAULT NULL,
  `workcleanform` varchar(20) DEFAULT NULL,
  `merchant_wantedjob_id` int(11) NOT NULL AUTO_INCREMENT,
  `workdemand` varchar(500) DEFAULT NULL,
  `workcontent` varchar(500) DEFAULT NULL,
  `posttime` varchar(20) DEFAULT NULL,
  `power` int(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`merchant_wantedjob_id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`) USING BTREE,
  CONSTRAINT `merchant_wantedjob_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant_baseinfo` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。


-- 导出  表 recruit.student_baseinfo 结构
CREATE TABLE IF NOT EXISTS `student_baseinfo` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兼职学生id',
  `stu_name` varchar(20) NOT NULL COMMENT '兼职学生姓名',
  `stu_username` varchar(30) NOT NULL COMMENT '兼职学生用户名',
  `stu_password` varchar(100) NOT NULL COMMENT '兼职学生密码',
  `stu_school` varchar(100) NOT NULL COMMENT '学校',
  `stu_stuidcard` varchar(100) NOT NULL COMMENT '学号',
  `stu_email` varchar(100) NOT NULL COMMENT '兼职学生邮箱',
  `stu_telephone` varchar(12) DEFAULT NULL COMMENT '兼职学生电话',
  `stu_idcard` varchar(30) DEFAULT NULL COMMENT '兼职学生身份证',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。


-- 导出  表 recruit.student_wantedjob 结构
CREATE TABLE IF NOT EXISTS `student_wantedjob` (
  `stu_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL COMMENT '职业id',
  `workplace` varchar(255) DEFAULT NULL COMMENT '所在学校',
  `salary` decimal(10,2) DEFAULT NULL COMMENT '薪资',
  `workcleanform` varchar(20) DEFAULT NULL,
  `worktime` varchar(200) DEFAULT NULL COMMENT '预期工作时间',
  PRIMARY KEY (`stu_id`) USING BTREE,
  CONSTRAINT `student_wantedjob_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student_baseinfo` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- ----------------------------
-- 广告表
-- ---------------------------- 
DROP TABLE IF EXISTS `Advertise`;
CREATE TABLE Advertise(
  id int NOT NULL primary key AUTO_INCREMENT,
  toURL varchar(500), 
  customer varchar(250) NOT NULL, 
  picture varchar(1000) NOT NULL, 
  describes varchar(1000),
  jointime date NOT NULL, 
  timeway int NOT NULL, 
  status int NOT NULL 
);
