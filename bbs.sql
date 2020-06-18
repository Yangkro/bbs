/*
Navicat MySQL Data Transfer

Source Server         : bbs
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2020-06-18 17:23:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for forum_info
-- ----------------------------
DROP TABLE IF EXISTS `forum_info`;
CREATE TABLE `forum_info` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_info
-- ----------------------------
INSERT INTO `forum_info` VALUES ('56', '敲代码', '今天敲了一整天的代码', '2020-06-15 18:49:08', '123456');
INSERT INTO `forum_info` VALUES ('57', '天气', '今天下了一整天的雨', '2020-06-15 20:21:11', '123456');
INSERT INTO `forum_info` VALUES ('58', '学习JSP', '学习JSP真的很有趣呢', '2020-06-17 08:24:19', '20170001');
INSERT INTO `forum_info` VALUES ('61', '上课', '现在正在上信息安全课', '2020-06-17 16:59:41', '20178712');
INSERT INTO `forum_info` VALUES ('62', '写作业', '最近需要上交的作业有点多', '2020-06-18 14:07:35', '345678');
INSERT INTO `forum_info` VALUES ('63', '外围处理机（PPU）', '外围处理机是通道方式的进一步发展', '2020-06-18 14:42:50', '345678');

-- ----------------------------
-- Table structure for reply_info
-- ----------------------------
DROP TABLE IF EXISTS `reply_info`;
CREATE TABLE `reply_info` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) NOT NULL,
  `reply_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply_info
-- ----------------------------
INSERT INTO `reply_info` VALUES ('53', '我今天也敲了一天的代码', '2020-06-17 08:23:48', '20170001', '56');
INSERT INTO `reply_info` VALUES ('54', '我也觉得JSP很有意思', '2020-06-17 16:55:52', '20178712', '58');
INSERT INTO `reply_info` VALUES ('55', 'JSP确实很有意思', '2020-06-17 17:01:59', '20170001', '58');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(15) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_sex` varchar(2) NOT NULL,
  `user_face` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_from` varchar(200) NOT NULL,
  `isAdmin` int(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('123456', 'hello', '5d41402abc4b2a76b9719d911017c592', '男', '/bbs_Web_exploded/images/userface/user01.jpg', '13081853718', '528549492@qq.com', '武汉', null);
INSERT INTO `user_info` VALUES ('234567', 'world', '7d793037a0760186574b0282f2f435e7', '女', 'images/userface/user19.jpg', '18088888888', '528578492@qq.com', '北京', null);
INSERT INTO `user_info` VALUES ('345678', 'Yang', '2422f0f0806e2d3daff5fcd971be38f1', '男', 'images/userface/user11.jpg', '18066666666', '565549492@qq.com', '上海', null);
INSERT INTO `user_info` VALUES ('20170001', 'admin', '21232f297a57a5a743894a0e4a801fc3', '女', 'images/userface/user19.jpg', '18666666666', '565345492@qq.com', '广州', null);
INSERT INTO `user_info` VALUES ('20170002', 'JSP', '2d7fca4f5778e4b40b606914719bb294', '男', 'L1.jpg', '18066666678', '536578492@qq.com', '火星', null);
INSERT INTO `user_info` VALUES ('20170003', 'java', '93f725a07423fe1c889f448b33d21f46', '男', 'logo.jpg', '18088888888', '565549492@qq.com', '月球', null);
INSERT INTO `user_info` VALUES ('20170004', 'HTML', '4c4ad5fca2e7a3f74dbb1ced00381aa4', '男', '/bbs_Web_exploded/images/userface/user01.jpg', '18088886666', '698549492@qq.com', '深圳', null);
INSERT INTO `user_info` VALUES ('20178712', 'Yangkro', 'a166c9e478539c9e605438de6a66c066', '男', 'images/userface/user02.jpg', '13081853719', '907661446@qq.com', '河南', '1');
