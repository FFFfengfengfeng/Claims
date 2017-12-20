/*
Navicat MySQL Data Transfer

Source Server         : FFF
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : claims

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-20 18:35:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `order_num` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `place` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('3', '王明', 'AE002017001', '2017-12-06 12:15:42', '广州花都', '6', '3', '王聪 ', '2000');
INSERT INTO `case` VALUES ('4', '张翠红', 'AE002017002', '2017-12-13 12:46:45', '广州天河', '4', '1', '陈宏子', '3000');
INSERT INTO `case` VALUES ('5', '王大雷', 'AE002017003', '2017-12-06 12:47:17', '广州海珠', '1', '3', '王聪 ', '');
INSERT INTO `case` VALUES ('6', '黄芳', 'AE002017004', '2017-12-07 13:40:22', '广州白云', '0', '', '', '');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '陈宏子');
INSERT INTO `employee` VALUES ('2', '陈迪');
INSERT INTO `employee` VALUES ('3', '王聪 ');
INSERT INTO `employee` VALUES ('4', '李凯生');
INSERT INTO `employee` VALUES ('5', '尚继鹏');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '0');
INSERT INTO `user` VALUES ('2', 'abczzz', '123456', '1');
INSERT INTO `user` VALUES ('3', '小明', '123456', '1');
INSERT INTO `user` VALUES ('4', '小红', '123456', '1');
