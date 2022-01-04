-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.26 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 template 的数据库结构
DROP DATABASE IF EXISTS `hostel`;
CREATE DATABASE IF NOT EXISTS `hostel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hostel`;

-- 导出  表 template.t_department 结构
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE IF NOT EXISTS `t_department` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_department 的数据：~15 rows (大约)
DELETE FROM `t_department`;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `parent_id`, `sort_order`, `status`, `title`, `is_parent`) VALUES
	(40652270295060480, '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', 0, 3.00, 0, '人事部', b'1'),
	(40652338142121984, NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', 40652270295060480, 1.00, 0, '游客', b'0'),
	(40681289119961088, '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', 40652270295060480, 2.00, 0, 'VIP', b'0'),
	(1464487288363945985, 'admin', '2021-11-27 14:52:33', 0, 'admin', '2021-11-27 14:53:29', 0, 1.00, 0, '人力资源部', b'1'),
	(1464487332064399361, 'admin', '2021-11-27 14:52:43', 0, 'admin', '2021-11-27 14:53:53', 0, 2.00, 0, '行政综合部', b'1'),
	(1464487379074158593, 'admin', '2021-11-27 14:52:55', 0, 'admin', '2021-11-27 14:54:19', 0, 3.00, 0, '设计研发部', b'1'),
	(1464487406328745985, 'admin', '2021-11-27 14:53:01', 0, 'admin', '2021-11-27 14:53:01', 0, 4.00, 0, '财务部', b'0'),
	(1464487432169852929, 'admin', '2021-11-27 14:53:07', 0, 'admin', '2021-11-27 14:53:07', 0, 5.00, 0, '综合发展部', b'0'),
	(1464487524662644737, 'admin', '2021-11-27 14:53:29', 0, 'admin', '2021-11-27 14:53:41', 1464487288363945985, 1.00, 0, 'HRBP部', b'0'),
	(1464487559647334401, 'admin', '2021-11-27 14:53:38', 0, 'admin', '2021-11-27 14:53:38', 1464487288363945985, 2.00, 0, '招聘部', b'0'),
	(1464487623933431809, 'admin', '2021-11-27 14:53:53', 0, 'admin', '2021-11-27 14:53:53', 1464487332064399361, 1.00, 0, '安保部', b'0'),
	(1464487656678363137, 'admin', '2021-11-27 14:54:01', 0, 'admin', '2021-11-27 14:54:01', 1464487332064399361, 2.00, 0, '保洁部', b'0'),
	(1464487691780493313, 'admin', '2021-11-27 14:54:09', 0, 'admin', '2021-11-27 14:54:09', 1464487332064399361, 3.00, 0, '设备维修部', b'0'),
	(1464487733895499777, 'admin', '2021-11-27 14:54:19', 0, 'admin', '2021-11-27 14:54:19', 1464487379074158593, 1.00, 0, '视频剪辑部', b'0'),
	(1464487807572643841, 'admin', '2021-11-27 14:54:37', 0, 'admin', '2021-11-27 14:54:37', 1464487379074158593, 2.00, 0, '产品应用部', b'0');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;

-- 导出  表 template.t_department_header 结构
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE IF NOT EXISTS `t_department_header` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_department_header 的数据：~0 rows (大约)
DELETE FROM `t_department_header`;
/*!40000 ALTER TABLE `t_department_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_department_header` ENABLE KEYS */;

-- 导出  表 template.t_dict 结构
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE IF NOT EXISTS `t_dict` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_dict 的数据：~5 rows (大约)
DELETE FROM `t_dict`;
/*!40000 ALTER TABLE `t_dict` DISABLE KEYS */;
INSERT INTO `t_dict` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `title`, `type`, `sort_order`) VALUES
	(75135930788220928, 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', 0.00),
	(75383353938808832, 'admin', '2018-11-15 14:38:53', 0, 'admin', '2018-11-27 01:39:15', '', '消息类型', 'message_type', 1.00),
	(75388696739713024, 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', 2.00),
	(81843858882695168, 'admin', '2018-12-03 10:30:38', 0, 'admin', '2018-12-03 10:30:49', '', '优先级', 'priority', 5.00);
/*!40000 ALTER TABLE `t_dict` ENABLE KEYS */;

-- 导出  表 template.t_dict_data 结构
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE IF NOT EXISTS `t_dict_data` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` bigint unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_dict_data 的数据：~23 rows (大约)
DELETE FROM `t_dict_data`;
/*!40000 ALTER TABLE `t_dict_data` DISABLE KEYS */;
INSERT INTO `t_dict_data` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `dict_id`, `sort_order`, `status`, `title`, `value`) VALUES
	(75158227712479232, 'admin', '2018-11-14 23:44:19', 0, 'admin', '2019-04-01 23:53:13', '', 75135930788220928, 0.00, 0, '男', '男'),
	(75159254272577536, 'admin', '2018-11-14 23:48:24', 0, 'admin', '2019-04-01 23:53:17', '', 75135930788220928, 1.00, 0, '女', '女'),
	(75159898425397248, 'admin', '2018-11-14 23:50:57', 0, 'admin', '2019-04-01 23:53:22', '', 75135930788220928, 2.00, -1, '保密', '保密'),
	(75385648017575936, 'admin', '2018-11-15 14:48:00', 0, 'admin', '2019-04-02 00:10:36', '', 75383353938808832, 0.00, 0, '系统公告', '系统公告'),
	(75385706913992704, 'admin', '2018-11-15 14:48:14', 0, 'admin', '2019-04-02 00:10:32', '', 75383353938808832, 1.00, 0, '提醒', '提醒'),
	(75385774274514944, 'admin', '2018-11-15 14:48:30', 0, 'admin', '2019-04-02 00:10:28', '', 75383353938808832, 2.00, 0, '私信', '私信'),
	(75390787835138048, 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', 75388696739713024, 0.00, 0, '查看操作(view)', 'view'),
	(75390886501945344, 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', 75388696739713024, 1.00, 0, '添加操作(add)', 'add'),
	(75390993939042304, 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', 75388696739713024, 2.00, 0, '编辑操作(edit)', 'edit'),
	(75391067532300288, 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', 75388696739713024, 3.00, 0, '删除操作(delete)', 'delete'),
	(75391126902673408, 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', 75388696739713024, 4.00, 0, '清空操作(clear)', 'clear'),
	(75391192883269632, 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', 75388696739713024, 5.00, 0, '启用操作(enable)', 'enable'),
	(75391251024711680, 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', 75388696739713024, 6.00, 0, '禁用操作(disable)', 'disable'),
	(75391297124306944, 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', 75388696739713024, 7.00, 0, '搜索操作(search)', 'search'),
	(75391343379091456, 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', 75388696739713024, 8.00, 0, '上传文件(upload)', 'upload'),
	(75391407526776832, 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', 75388696739713024, 9.00, 0, '导出操作(output)', 'output'),
	(75391475042488320, 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', 75388696739713024, 10.00, 0, '导入操作(input)', 'input'),
	(75391522182270976, 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', 75388696739713024, 11.00, 0, '分配权限(editPerm)', 'editPerm'),
	(75391576364290048, 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', 75388696739713024, 12.00, 0, '设为默认(setDefault)', 'setDefault'),
	(75391798033256448, 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', 75388696739713024, 13.00, 0, '其他操作(other)', 'other'),
	(81843987719131136, 'admin', '2018-12-03 10:31:08', 0, 'admin', '2018-12-03 10:31:08', '', 81843858882695168, 0.00, 0, '普通', '0'),
	(81844044015079424, 'admin', '2018-12-03 10:31:22', 0, 'admin', '2018-12-03 10:31:22', '', 81843858882695168, 1.00, 0, '重要', '1'),
	(81844100705292288, 'admin', '2018-12-03 10:31:35', 0, 'admin', '2018-12-03 10:31:35', '', 81843858882695168, 2.00, 0, '紧急', '2');
/*!40000 ALTER TABLE `t_dict_data` ENABLE KEYS */;

-- 导出  表 template.t_file 结构
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE IF NOT EXISTS `t_file` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `f_key` varchar(255) DEFAULT NULL,
  `location` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_file 的数据：~0 rows (大约)
DELETE FROM `t_file`;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
INSERT INTO `t_file` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `name`, `size`, `type`, `url`, `f_key`, `location`) VALUES
	(1464483838750232576, 'admin', '2021-11-27 14:38:51', 0, 'admin', '2021-11-27 14:38:51', '微信截图_20211127143841.png', 21552, 'image/png', 'C:\\oa-file/20211127/1b74e525e0544a788045f69426d6b093.png', '1b74e525e0544a788045f69426d6b093.png', 0);
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;

-- 导出  表 template.t_log 结构
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE IF NOT EXISTS `t_log` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int unsigned DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_log 的数据：~41 rows (大约)
DELETE FROM `t_log`;
/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;
INSERT INTO `t_log` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `cost_time`, `ip`, `ip_info`, `name`, `request_param`, `request_type`, `request_url`, `username`, `log_type`) VALUES
	(1337311281962684416, NULL, '2020-12-11 16:20:31', 0, NULL, '2020-12-11 16:20:31', 453, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"wqsv","saveLogin":"true","captchaId":"ec504bd47f2644b2952c697fc39cbb35","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337311546707152896, NULL, '2020-12-11 16:21:34', 0, NULL, '2020-12-11 16:21:34', 421, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"gs34","saveLogin":"true","captchaId":"5ea68daeacd34c61ae2c38b90792e4dd","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337550219369385984, NULL, '2020-12-12 08:09:58', 0, NULL, '2020-12-12 08:09:58', 376, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"h9my","saveLogin":"true","captchaId":"bae6c0767a56494a9c0e28c0cf00331b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337697718230978560, NULL, '2020-12-12 17:56:04', 0, NULL, '2020-12-12 17:56:04', 393, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"39Ga","saveLogin":"true","captchaId":"ecbf9e66c5d54c9eb2cafcd8af008dda","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337706410254929920, NULL, '2020-12-12 18:30:37', 0, NULL, '2020-12-12 18:30:37', 304, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"vrrg","saveLogin":"true","captchaId":"d56a7fb6fc59486aaadf51ef6b0dfd06","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337748746032779264, NULL, '2020-12-12 21:18:50', 0, NULL, '2020-12-12 21:18:50', 101, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"pctt","saveLogin":"true","captchaId":"727df872b6ef4e76872127c6714a6a85","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337759827593662464, NULL, '2020-12-12 22:02:52', 0, NULL, '2020-12-12 22:02:52', 90, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"mhfb","saveLogin":"true","captchaId":"224cd89ef641460b8c93782079ac2791","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337762190274465792, NULL, '2020-12-12 22:12:15', 0, NULL, '2020-12-12 22:12:15', 85, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"35kp","saveLogin":"true","captchaId":"463a5adb0613404698aa743fdfe17562","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337919204048900096, NULL, '2020-12-13 08:36:11', 0, NULL, '2020-12-13 08:36:11', 557, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"tm46","saveLogin":"true","captchaId":"d60af9eda81f41299a3409e498e4a0d8","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337922224795029504, NULL, '2020-12-13 08:48:11', 0, NULL, '2020-12-13 08:48:11', 273, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"xl6z","saveLogin":"true","captchaId":"796b06527a314567a5b5c29e8a990b1b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337927477359677440, NULL, '2020-12-13 09:09:03', 0, NULL, '2020-12-13 09:09:03', 79, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"psu5","saveLogin":"true","captchaId":"157632a0dbd240ddbf91a4c709afe135","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1340928955515015168, NULL, '2020-12-21 15:55:51', 0, NULL, '2020-12-21 15:55:51', 225, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"vfvm","saveLogin":"true","captchaId":"30819a32fef64e02b7c125d553f46fb6","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1350603974109171712, NULL, '2021-01-17 08:40:55', 0, NULL, '2021-01-17 08:40:55', 236, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"wxdm","saveLogin":"true","captchaId":"b11c720c740b4451a0a2699bba67caf5","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1350609327995621376, NULL, '2021-01-17 09:02:12', 0, NULL, '2021-01-17 09:02:12', 86, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"5oxc","saveLogin":"true","captchaId":"187e612f6b484475ad78a32660e89e1e","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355731771634880512, NULL, '2021-01-31 12:16:57', 0, NULL, '2021-01-31 12:16:57', 71, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"TIO6","saveLogin":"true","captchaId":"1143b9c8114449bc8e6d1c591aaed6e9","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355731946143092736, NULL, '2021-01-31 12:17:39', 0, NULL, '2021-01-31 12:17:39', 107, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ghf5","saveLogin":"true","captchaId":"8376fb3295bc466cb7cc526108b0da8c","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355732778704048128, NULL, '2021-01-31 12:20:58', 0, NULL, '2021-01-31 12:20:58', 465, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ep9m","saveLogin":"true","captchaId":"64271e9c4b83490789639141e537a35b","username":"company"}', 'POST', '/xboot/login', 'company', 1),
	(1355732845221515264, NULL, '2021-01-31 12:21:13', 0, NULL, '2021-01-31 12:21:13', 74, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"gxsc","saveLogin":"true","captchaId":"4317339ba1414b1b8d7bd3fda768f6f8","username":"doctor"}', 'POST', '/xboot/login', 'doctor', 1),
	(1355732928340037632, NULL, '2021-01-31 12:21:33', 0, NULL, '2021-01-31 12:21:33', 60, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"due8","saveLogin":"true","captchaId":"648c07f55a2b463eb814768b25211c53","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355751708294254592, NULL, '2021-01-31 13:36:11', 0, NULL, '2021-01-31 13:36:11', 75, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"uwxd","saveLogin":"true","captchaId":"ffe6067e7b3740f3aeb837111b79486b","username":"company"}', 'POST', '/xboot/login', 'company', 1),
	(1355751794889854976, NULL, '2021-01-31 13:36:31', 0, NULL, '2021-01-31 13:36:31', 70, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"dekd","saveLogin":"true","captchaId":"e2e4c16b08bb49508e8ae345a5387141","username":"doctor"}', 'POST', '/xboot/login', 'doctor', 1),
	(1355751908521938944, NULL, '2021-01-31 13:36:58', 0, NULL, '2021-01-31 13:36:58', 91, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"jpss","saveLogin":"true","captchaId":"00b0a0f70492445fa1ba3c7d5892aa8d","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463375568652341248, NULL, '2021-11-24 13:14:59', 0, NULL, '2021-11-24 13:14:59', 204, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"OLUR","saveLogin":"true","captchaId":"c9bc133822c6438e8c9499cb461a27d2","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463375637669613568, NULL, '2021-11-24 13:15:15', 0, NULL, '2021-11-24 13:15:15', 79, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"SKUE","saveLogin":"true","captchaId":"77e6552ca17840dbacd9c8727f0573de","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463384643616247808, NULL, '2021-11-24 13:51:02', 0, NULL, '2021-11-24 13:51:02', 69, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"IY7Q","saveLogin":"true","captchaId":"a2287d7f99f64fc98ad6316a2dbc8bf2","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463390317393874944, NULL, '2021-11-24 14:13:35', 0, NULL, '2021-11-24 14:13:35', 81, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"9RNO","saveLogin":"true","captchaId":"e2ee9fed43db435095eed265a832df38","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463396744564969472, NULL, '2021-11-24 14:39:07', 0, NULL, '2021-11-24 14:39:07', 92, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"avvh","saveLogin":"true","captchaId":"265ab32faada425f9e30adcacd27b263","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463396965332160512, NULL, '2021-11-24 14:40:00', 0, NULL, '2021-11-24 14:40:00', 84, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"GER9","saveLogin":"true","captchaId":"8e5ed6a725c24ce586f85a828525bcbc","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463397001549975552, NULL, '2021-11-24 14:40:09', 0, NULL, '2021-11-24 14:40:09', 83, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"YZHZ","saveLogin":"true","captchaId":"43b642dd04a84ff0b598c7e45dd8cbae","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463745354230009856, NULL, '2021-11-25 13:44:22', 0, NULL, '2021-11-25 13:44:22', 199, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"7ptg","saveLogin":"true","captchaId":"b1e2e425f57145579c5bea5d5ed76ad2","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463751360750161920, NULL, '2021-11-25 14:08:15', 0, NULL, '2021-11-25 14:08:15', 247, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"JQN5","saveLogin":"true","captchaId":"6a2975c9452e4243931b0d7b380325c6","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463770014329999360, NULL, '2021-11-25 15:22:22', 0, NULL, '2021-11-25 15:22:22', 319, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"RZDZ","saveLogin":"true","captchaId":"f9b38f92cd224fe093bfde7948d9da04","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1463778047030333440, NULL, '2021-11-25 15:54:17', 0, NULL, '2021-11-25 15:54:17', 143, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"R9FZ","saveLogin":"true","captchaId":"ea065e931bb34e3583f1ec6238799060","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1464410444235149312, NULL, '2021-11-27 09:47:12', 0, NULL, '2021-11-27 09:47:12', 288, '127.0.0.1', '未知', '登录系统', '{"password":"密码已被隐藏","code":"BPQZ","saveLogin":"true","captchaId":"bce096c9b0d0430181d142f55f027ae7","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1464472984524820480, NULL, '2021-11-27 13:55:43', 0, NULL, '2021-11-27 13:55:43', 88, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"GYLZ","saveLogin":"true","captchaId":"f97540bd28d44909a104e0e766968212","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464475941274259456, NULL, '2021-11-27 14:07:28', 0, NULL, '2021-11-27 14:07:28', 72, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"1tft","saveLogin":"true","captchaId":"51c210f224304398a94d427b25b52a6b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464476031363715072, NULL, '2021-11-27 14:07:49', 0, NULL, '2021-11-27 14:07:49', 66, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"r8ss","saveLogin":"true","captchaId":"d07f6a8d78c34019acf01c21bb020000","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464476281532977152, NULL, '2021-11-27 14:08:49', 0, NULL, '2021-11-27 14:08:49', 76, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"x6up","saveLogin":"true","captchaId":"ead79090003c4789bcfc9bb0137a21b0","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464476769737379840, NULL, '2021-11-27 14:10:45', 0, NULL, '2021-11-27 14:10:45', 68, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"tquc","saveLogin":"true","captchaId":"27413d33831c45b8aa1cbb4dc875e574","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464486461029093376, NULL, '2021-11-27 14:49:16', 0, NULL, '2021-11-27 14:49:16', 84, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"MPOP","saveLogin":"true","captchaId":"0fa393c45e8f48bf88e67952654ef708","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464492802787381248, NULL, '2021-11-27 15:14:28', 0, NULL, '2021-11-27 15:14:28', 258, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"T1XL","saveLogin":"true","captchaId":"51738d0a52884c67ac5b0de6f2767aa3","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464510533729390592, NULL, '2021-11-27 16:24:55', 0, NULL, '2021-11-27 16:24:55', 71, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"JZ7X","saveLogin":"true","captchaId":"985dba7cc36a4ee394ff35c53c77512e","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1464514105674174464, NULL, '2021-11-27 16:39:07', 0, NULL, '2021-11-27 16:39:07', 274, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"WZOV","saveLogin":"true","captchaId":"92cfa4717f0f4b3e90160d6483238e99","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1464769522186719232, NULL, '2021-11-28 09:34:03', 0, NULL, '2021-11-28 09:34:03', 268, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"XIXB","saveLogin":"true","captchaId":"63e50104173c4241993d3debcb11df96","username":"17859654125 "}', 'POST', '/zwz/login', '17859654125', 1),
	(1464771485892743168, NULL, '2021-11-28 09:41:51', 0, NULL, '2021-11-28 09:41:51', 73, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"KCPG","saveLogin":"true","captchaId":"4fa4d590d4c140c09c1fe1a55c16bc0b","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1464772488578863104, NULL, '2021-11-28 09:45:50', 0, NULL, '2021-11-28 09:45:50', 72, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"DQ2S","saveLogin":"true","captchaId":"ee40ccc99ab449c09b53b745da8ae907","username":"17859654121"}', 'POST', '/zwz/login', '17859654121', 1),
	(1464825510038212608, NULL, '2021-11-28 13:16:32', 0, NULL, '2021-11-28 13:16:32', 277, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"qqub","saveLogin":"true","captchaId":"eb0b6ee8d5ea4bf7b77e374e71273eba","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1464825582037635072, NULL, '2021-11-28 13:16:49', 0, NULL, '2021-11-28 13:16:49', 81, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"6spi","saveLogin":"true","captchaId":"b51cc57ccb7945168a872e1506fe2024","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1474612471053553664, NULL, '2021-12-25 13:26:25', 0, NULL, '2021-12-25 13:26:25', 291, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"UNCK","saveLogin":"true","captchaId":"4c05f9a290444e2ebcf27ca0f65fb8ea","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1474612508877787136, NULL, '2021-12-25 13:26:34', 0, NULL, '2021-12-25 13:26:34', 86, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"BZMV","saveLogin":"true","captchaId":"414afdb2af8745d6b5020d54ac8aad1c","username":"admin"}', 'POST', '/zwz/login', 'admin', 1);
/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;

-- 导出  表 template.t_permission 结构
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE IF NOT EXISTS `t_permission` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int unsigned DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `show_always` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_permission 的数据：~50 rows (大约)
DELETE FROM `t_permission`;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `name`, `parent_id`, `type`, `sort_order`, `component`, `path`, `title`, `icon`, `level`, `button_type`, `status`, `url`, `show_always`) VALUES
	(5129710648430592, '', '2018-06-04 19:02:29', 0, 'admin', '2021-11-27 14:46:19', '', 'sys', 125909152017944576, 0, 4.00, 'Main', '/sys', '权限管理', 'ios-settings', 1, '', 0, '', b'1'),
	(5129710648430593, '', '2018-06-04 19:02:32', 0, 'admin', '2021-11-27 14:43:19', '', 'user-admin', 1464484663442673664, 0, 1.10, 'sys/user-manage/userManage', 'user-admin', '用户管理', 'md-person', 2, '', 0, '', b'1'),
	(5129710648430594, '', '2018-06-04 19:02:35', 0, '', '2018-10-13 13:51:36', '', 'role-manage', 5129710648430592, 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '', b'1'),
	(5129710648430595, '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', 5129710648430592, 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '', b'1'),
	(15701400130424832, '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', 5129710648430593, 1, 1.11, '', '/xboot/user/admin/add*', '添加用户', '', 3, 'add', 0, '', b'1'),
	(15701915807518720, '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', 5129710648430593, 1, 1.13, '', '/xboot/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL, b'1'),
	(15708892205944832, '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', 5129710648430593, 1, 1.14, '', '/xboot/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL, b'1'),
	(16678126574637056, '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', 5129710648430593, 1, 1.12, '', '/xboot/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '', b'1'),
	(16678447719911424, '', '2018-06-06 14:46:32', 0, 'admin', '2020-04-28 14:27:03', '', '', 5129710648430593, 1, 1.15, '', '/xboot/user/delByIds**', '删除用户', '', 3, 'delete', 0, '', b'1'),
	(16687383932047360, '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', 5129710648430594, 1, 1.21, '', '/xboot/role/save*', '添加角色', '', 3, 'add', 0, '', b'1'),
	(16689632049631232, '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', 5129710648430594, 1, 1.22, '', '/xboot/role/edit*', '编辑角色', '', 3, 'edit', 0, '', b'1'),
	(16689745006432256, '', '2018-06-06 15:31:26', 0, 'admin', '2020-04-28 14:29:02', '', '', 5129710648430594, 1, 1.23, '', '/xboot/role/delByIds**', '删除角色', '', 3, 'delete', 0, '', b'1'),
	(16689883993083904, NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, 5129710648430594, 1, 1.24, NULL, '/xboot/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL, b'1'),
	(16690313745666048, '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', 5129710648430594, 1, 1.25, '', '/xboot/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '', b'1'),
	(16694861252005888, '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', 5129710648430595, 1, 1.31, '', '/xboot/permission/add*', '添加菜单', '', 3, 'add', 0, '', b'1'),
	(16695107491205120, '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', 5129710648430595, 1, 1.32, '', '/xboot/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '', b'1'),
	(16695243126607872, '', '2018-06-06 15:53:17', 0, 'admin', '2020-04-28 14:29:17', '', '', 5129710648430595, 1, 1.33, '', '/xboot/permission/delByIds**', '删除菜单', '', 3, 'delete', 0, '', b'1'),
	(25014528525733888, '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', 5129710648430593, 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '', b'1'),
	(39915540965232640, '', '2018-08-09 17:42:28', 0, 'admin', '2021-11-27 14:46:28', '', 'monitor', 125909152017944576, 0, 10.00, 'Main', '/monitor', '日志管理', 'ios-analytics', 1, '', 0, '', b'1'),
	(40238597734928384, '', '2018-08-10 15:06:10', 0, 'admin', '2021-11-27 14:44:36', '', 'department-admin', 1464485105081913345, 0, 1.20, 'sys/department-manage/departmentManage', 'department-admin', '部门管理', 'md-git-branch', 2, '', 0, '', b'1'),
	(41363147411427328, '', '2018-08-13 17:34:43', 0, 'admin', '2020-03-25 20:31:16', '', 'log-manage', 39915540965232640, 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '日志管理', 'md-list-box', 2, '', 0, '', b'1'),
	(41363537456533504, '', '2018-08-13 17:36:16', 0, 'admin', '2020-04-28 14:31:54', '', '', 41363147411427328, 1, 2.11, '', '/xboot/log/delByIds**', '删除日志', '', 3, 'delete', 0, '', b'1'),
	(41364927394353152, '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', 41363147411427328, 1, 2.12, '', '/xboot/log/delAll*', '清空日志', '', 3, 'undefined', 0, '', b'1'),
	(45235621697949696, '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', 40238597734928384, 1, 1.21, '', '/xboot/department/add*', '添加部门', '', 3, 'add', 0, '', b'1'),
	(45235787867885568, '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', 40238597734928384, 1, 1.22, '', '/xboot/department/edit*', '编辑部门', '', 3, 'edit', 0, '', b'1'),
	(45235939278065664, '', '2018-08-24 10:03:49', 0, 'admin', '2020-04-28 14:27:35', '', '', 40238597734928384, 1, 1.23, '', '/xboot/department/delByIds*', '删除部门', '', 3, 'delete', 0, '', b'1'),
	(56309618086776832, '', '2018-09-23 23:26:40', 0, 'admin', '2021-11-27 14:47:48', '', 'file-admin', 1464485485316542465, 0, 1.00, 'sys/oss-manage/ossManage', 'file-admin', '文件对象存储', 'ios-folder', 2, '', 0, '', b'1'),
	(56898976661639168, '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', 5129710648430593, 1, 1.17, '', '/xboot/user/importData*', '导入用户', '', 3, 'input', 0, '', b'1'),
	(57212882168844288, '', '2018-09-26 11:15:55', 0, '', '2018-10-08 11:10:05', '', '', 56309618086776832, 1, 1.41, '', '无', '上传文件', '', 3, 'upload', 0, '', b'1'),
	(61560041605435392, NULL, '2018-10-08 11:09:58', 0, NULL, '2018-10-08 11:09:58', NULL, '', 56309618086776832, 1, 1.42, '', '/xboot/file/rename*', '重命名文件', '', 3, 'edit', 0, NULL, b'1'),
	(61560275261722624, NULL, '2018-10-08 11:10:54', 0, NULL, '2018-10-08 11:10:54', NULL, '', 56309618086776832, 1, 1.43, '', '/xboot/file/copy*', '复制文件', '', 3, 'edit', 0, NULL, b'1'),
	(61560480518377472, '', '2018-10-08 11:11:43', 0, 'admin', '2020-04-28 14:28:22', '', '', 56309618086776832, 1, 1.44, '', '/xboot/file/delete*', '删除文件', '', 3, 'delete', 0, '', b'1'),
	(75002207560273920, 'admin', '2018-11-14 13:24:21', 0, 'admin', '2021-11-27 14:47:55', '', 'dict-admin', 1464485485316542465, 0, 2.00, 'sys/dict-manage/dictManage', 'dict-admin', '数据字典管理', 'md-bookmarks', 2, '', 0, '', b'1'),
	(76215889006956544, 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', 75002207560273920, 1, 1.81, '', '/xboot/dict/add*', '添加字典', '', 3, 'add', 0, '', b'1'),
	(76216071333351424, 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', 75002207560273920, 1, 1.82, '', '/xboot/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL, b'1'),
	(76216264070008832, 'admin', '2018-11-17 21:48:34', 0, 'admin', '2020-04-28 14:29:30', '', '', 75002207560273920, 1, 1.83, '', '/xboot/dict/delByIds**', '删除字典', '', 3, 'delete', 0, '', b'1'),
	(76216459709124608, 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', 75002207560273920, 1, 1.84, '', '/xboot/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL, b'1'),
	(76216594207870976, 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', 75002207560273920, 1, 1.85, '', '/xboot/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL, b'1'),
	(76216702639017984, 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', 75002207560273920, 1, 1.86, '', '/xboot/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL, b'1'),
	(121426317022334976, 'admin', '2019-03-22 15:57:11', 0, 'admin', '2021-11-27 14:46:36', '', 'redis', 39915540965232640, 0, 2.21, 'sys/redis/redis', 'redis', 'Redis日志', 'md-barcode', 2, '', 0, '', b'1'),
	(125909152017944576, 'admin', '2019-04-04 00:50:22', 0, 'admin', '2021-11-27 14:40:00', '', 'xboot', 0, -1, 1.00, '', '', '数据中心', 'md-home', 0, '', 0, '', b'1'),
	(156365156580855808, 'admin', '2019-06-27 01:51:39', 0, 'admin', '2019-06-27 01:51:39', NULL, '', 5129710648430593, 1, 1.18, '', '/xboot/user/resetPass', '重置密码', '', 3, 'other', 0, NULL, b'1'),
	(1255336077691064320, 'admin', '2020-04-29 11:20:18', 0, 'admin', '2020-04-29 11:20:47', '', '', 121426317022334976, 1, 0.00, '', '/xboot/redis/getAllByPage**', '获取Redis', '', 3, 'view', 0, '', b'1'),
	(1255336361339260928, 'admin', '2020-04-29 11:21:26', 0, 'admin', '2020-04-29 11:21:26', NULL, '', 121426317022334976, 1, 0.00, '', '/xboot/redis/save', '添加Redis', '', 3, 'add', 0, NULL, b'1'),
	(1255336455472025601, 'admin', '2020-04-29 11:21:48', 0, 'admin', '2020-04-29 11:21:48', NULL, '', 121426317022334976, 1, 0.00, '', '/xboot/redis/delByKeys**', '删除Redis', '', 3, 'delete', 0, NULL, b'1'),
	(1255336553971060737, 'admin', '2020-04-29 11:22:12', 0, 'admin', '2020-04-29 11:22:12', NULL, '', 121426317022334976, 1, 0.00, '', '/xboot/redis/delAll', '清空Redis', '', 3, 'clear', 0, NULL, b'1'),
	(1464484663442673664, 'admin', '2021-11-27 14:42:07', 0, 'admin', '2021-11-27 14:42:37', '', 'userTwoMenu', 125909152017944576, 0, 1.00, 'Main', '/userTwoMenu', '用户管理', 'md-analytics', 1, '', 0, '', b'1'),
	(1464485105081913345, 'admin', '2021-11-27 14:43:53', 0, 'admin', '2021-11-27 14:43:53', NULL, 'depTwoMenu', 125909152017944576, 0, 2.00, 'Main', '/depTwoMenu', '部门管理', 'ios-apps', 1, '', 0, NULL, b'1'),
	(1464485485316542465, 'admin', '2021-11-27 14:45:23', 0, 'admin', '2021-11-27 14:47:05', '', 'fileAdmin', 125909152017944576, 0, 3.00, 'Main', '/fileAdmin', '资源管理', 'md-basketball', 1, '', 0, '', b'1'),
	(1464486736955576321, 'admin', '2021-11-27 14:50:22', 0, 'admin', '2021-11-27 14:50:22', NULL, 'file-setting', 1464485485316542465, 0, 3.00, 'sys/setting-manage/settingManage', 'file-setting', '文件存储配置', 'ios-settings-outline', 2, '', 0, NULL, b'1'),
	(1464514283202285568, 'admin', '2021-11-27 16:39:49', 0, 'admin', '2021-11-27 16:39:49', NULL, 'vue-code', 1464485485316542465, 0, 4.00, 'sys/oneJavaVue/tableGenerator', 'vue-code', 'Vue', 'md-analytics', 2, '', 0, NULL, b'1');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;

-- 导出  表 template.t_role 结构
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_role 的数据：~3 rows (大约)
DELETE FROM `t_role`;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `del_flag`, `default_role`, `description`, `data_type`) VALUES
	(496138616573952, '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0),
	(496138616573953, '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', 0, b'1', '普通注册用户 路过看看', 0);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

-- 导出  表 template.t_role_permission 结构
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE IF NOT EXISTS `t_role_permission` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` bigint unsigned DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_role_permission 的数据：~51 rows (大约)
DELETE FROM `t_role_permission`;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `permission_id`, `role_id`) VALUES
	(1464514325862551552, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 125909152017944576, 496138616573952),
	(1464514325862551553, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1464484663442673664, 496138616573952),
	(1464514325862551554, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 5129710648430593, 496138616573952),
	(1464514325862551555, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 15701400130424832, 496138616573952),
	(1464514325862551556, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16678126574637056, 496138616573952),
	(1464514325862551557, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 15701915807518720, 496138616573952),
	(1464514325862551558, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 15708892205944832, 496138616573952),
	(1464514325862551559, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16678447719911424, 496138616573952),
	(1464514325862551560, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 25014528525733888, 496138616573952),
	(1464514325862551561, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 56898976661639168, 496138616573952),
	(1464514325862551562, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 156365156580855808, 496138616573952),
	(1464514325862551563, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1464485105081913345, 496138616573952),
	(1464514325862551564, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 40238597734928384, 496138616573952),
	(1464514325862551565, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 45235621697949696, 496138616573952),
	(1464514325862551566, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 45235787867885568, 496138616573952),
	(1464514325862551567, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 45235939278065664, 496138616573952),
	(1464514325862551568, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1464485485316542465, 496138616573952),
	(1464514325862551569, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 56309618086776832, 496138616573952),
	(1464514325862551570, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 57212882168844288, 496138616573952),
	(1464514325862551571, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 61560041605435392, 496138616573952),
	(1464514325862551572, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 61560275261722624, 496138616573952),
	(1464514325862551573, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 61560480518377472, 496138616573952),
	(1464514325862551574, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 75002207560273920, 496138616573952),
	(1464514325862551575, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 76215889006956544, 496138616573952),
	(1464514325862551576, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 76216071333351424, 496138616573952),
	(1464514325862551577, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 76216264070008832, 496138616573952),
	(1464514325862551578, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 76216459709124608, 496138616573952),
	(1464514325862551579, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 76216594207870976, 496138616573952),
	(1464514325862551580, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 76216702639017984, 496138616573952),
	(1464514325862551581, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1464486736955576321, 496138616573952),
	(1464514325862551582, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1464514283202285568, 496138616573952),
	(1464514325862551583, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 5129710648430592, 496138616573952),
	(1464514325862551584, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 5129710648430594, 496138616573952),
	(1464514325862551585, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16687383932047360, 496138616573952),
	(1464514325862551586, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16689632049631232, 496138616573952),
	(1464514325862551587, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16689745006432256, 496138616573952),
	(1464514325862551588, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16689883993083904, 496138616573952),
	(1464514325862551589, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16690313745666048, 496138616573952),
	(1464514325862551590, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 5129710648430595, 496138616573952),
	(1464514325862551591, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16694861252005888, 496138616573952),
	(1464514325862551592, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16695107491205120, 496138616573952),
	(1464514325862551593, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 16695243126607872, 496138616573952),
	(1464514325862551594, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 39915540965232640, 496138616573952),
	(1464514325862551595, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 41363147411427328, 496138616573952),
	(1464514325862551596, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 41363537456533504, 496138616573952),
	(1464514325862551597, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 41364927394353152, 496138616573952),
	(1464514325862551598, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 121426317022334976, 496138616573952),
	(1464514325862551599, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1255336077691064320, 496138616573952),
	(1464514325862551600, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1255336361339260928, 496138616573952),
	(1464514325862551601, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1255336455472025601, 496138616573952),
	(1464514325862551602, 'admin', '2021-11-27 16:39:59', 0, 'admin', '2021-11-27 16:39:59', 1255336553971060737, 496138616573952);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;

-- 导出  表 template.t_setting 结构
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE IF NOT EXISTS `t_setting` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_setting 的数据：~2 rows (大约)
DELETE FROM `t_setting`;
/*!40000 ALTER TABLE `t_setting` DISABLE KEYS */;
INSERT INTO `t_setting` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `value`) VALUES
	('LOCAL_OSS', 'admin', '2021-11-27 14:23:13', 0, 'admin', '2021-11-27 14:51:42', '{"serviceName":"LOCAL_OSS","accessKey":"","secretKey":"**********","endpoint":"127.0.0.1:9999/xboot/file/view","bucket":"","http":"http://","bucketRegion":"","filePath":"C:\\\\oa-file"}'),
	('OSS_USED', 'admin', '2021-11-27 14:23:13', 0, 'admin', '2021-11-27 14:23:13', 'LOCAL_OSS');
/*!40000 ALTER TABLE `t_setting` ENABLE KEYS */;

-- 导出  表 template.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  `department_title` varchar(255) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_user 的数据：~3 rows (大约)
DELETE FROM `t_user`;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `address`, `avatar`, `description`, `email`, `mobile`, `nickname`, `password`, `sex`, `status`, `type`, `username`, `del_flag`, `department_id`, `street`, `pass_strength`, `department_title`, `birth`) VALUES
	(682265633886208, '', '2020-12-13 07:07:07', 'admin', '2021-11-27 14:55:06', '["330000","330600","330602"]', 'https://i.loli.net/2019/04/28/5cc5a71a6e3b6.png', '绍兴文理学院元培学院', '916077357@qq.com', '17857054385', '管理员', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, 1464487379074158593, '东浦街道', '弱', '设计研发部', '2000-01-08 00:00:00.000000'),
	(1464764315201572865, NULL, '2021-11-28 09:13:22', NULL, '2021-11-28 09:13:22', NULL, 'https://i.loli.net/2019/04/28/5cc5a71a6e3b6.png', NULL, '17859654125@qq.com', '17859654125', '测试', '$2a$10$E59nactOiILAzQvfcs0JFOYuZp06d4bLhugEadyQuygpmiLc0W.ha', NULL, 0, 0, '17859654125', 0, NULL, NULL, NULL, NULL, NULL),
	(1464772465946398721, NULL, '2021-11-28 09:45:45', NULL, '2021-11-28 09:45:45', NULL, 'https://i.loli.net/2019/04/28/5cc5a71a6e3b6.png', NULL, '17859654121@qq.com', '17859654121', '测试2', '$2a$10$vJyLo1RhFORH/SAu3sc9aeb37I5JRy5UugaN7fIt/e2vvsz6JWJCm', NULL, 0, 0, '17859654121', 0, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 template.t_user_role 结构
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE IF NOT EXISTS `t_user_role` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  template.t_user_role 的数据：~3 rows (大约)
DELETE FROM `t_user_role`;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `role_id`, `user_id`) VALUES
	(1464487931975700480, 'admin', '2021-11-27 14:55:07', 0, 'admin', '2021-11-27 14:55:07', 496138616573952, 682265633886208),
	(1464764315797164033, NULL, '2021-11-28 09:13:22', 0, NULL, '2021-11-28 09:13:22', 496138616573953, 1464764315201572865),
	(1464772466273554433, NULL, '2021-11-28 09:45:45', 0, NULL, '2021-11-28 09:45:45', 496138616573953, 1464772465946398721);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
