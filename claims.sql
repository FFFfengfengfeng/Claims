/*
Navicat MySQL Data Transfer

Source Server         : FFF
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : claims

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-22 11:00:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `order_num` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `order_cate` varchar(255) DEFAULT NULL,
  `order_item` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('14', '小明', 'ES1513837065', '2017-12-22 09:44:17', '广州芳村', '1', '1,2,3', '陈宏子,陈迪,王聪 ', null, '车险', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '3');

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES ('1', '车险');
INSERT INTO `cate` VALUES ('2', '意外');
INSERT INTO `cate` VALUES ('3', '健康');
INSERT INTO `cate` VALUES ('4', '财产');
INSERT INTO `cate` VALUES ('5', '人寿');

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
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '交强险', '1');
INSERT INTO `item` VALUES ('2', '第三方责任险', '1');
INSERT INTO `item` VALUES ('3', '盗抢险', '1');
INSERT INTO `item` VALUES ('4', '车身刮痕', '1');
INSERT INTO `item` VALUES ('5', '玻璃单独破碎', '1');
INSERT INTO `item` VALUES ('6', '意外身故', '2');
INSERT INTO `item` VALUES ('7', '意外残疾', '2');
INSERT INTO `item` VALUES ('8', '意外伤害', '2');
INSERT INTO `item` VALUES ('9', '重大疾病', '3');
INSERT INTO `item` VALUES ('10', '轻症疾病', '3');
INSERT INTO `item` VALUES ('11', '财产损失', '4');
INSERT INTO `item` VALUES ('12', '货物运输', '4');
INSERT INTO `item` VALUES ('13', '农业自然灾害', '4');
INSERT INTO `item` VALUES ('14', '养老储蓄', '5');
INSERT INTO `item` VALUES ('15', '定期人寿', '5');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `order_num` varchar(255) DEFAULT NULL,
  `order_cate` varchar(255) DEFAULT NULL,
  `order_item` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `order_item_name` varchar(255) DEFAULT NULL,
  `order_cate_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('4', 'abczzz', 'ES1513832000', '1', '1,2,3,4,5', '2', '5000', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '车险', '13800138000');
INSERT INTO `order` VALUES ('6', 'abczzz', 'ES1513837024', '5', '14', '2', '100000', '养老储蓄', '人寿', '13800138000');
INSERT INTO `order` VALUES ('7', '小明', 'ES1513837065', '1', '1,2,3,4,5', '3', '5000', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '车险', '13800138001');
INSERT INTO `order` VALUES ('9', '小明', 'ES1513908715', '3', '9,10', '3', '8000', '重大疾病,轻症疾病', '健康', '13800138001');
INSERT INTO `order` VALUES ('10', '小明', 'ES1513908734', '2', '6,7,8', '3', '15000', '意外身故,意外残疾,意外伤害', '意外', '13800138001');

-- ----------------------------
-- Table structure for speed
-- ----------------------------
DROP TABLE IF EXISTS `speed`;
CREATE TABLE `speed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of speed
-- ----------------------------
INSERT INTO `speed` VALUES ('2', '2017-12-22 09:44:17', '用户小明于2017-12-22 09:44:17报案<br/>报案地址广州芳村', '14');
INSERT INTO `speed` VALUES ('3', '2017:12:22 10:30', '已经指派陈宏子,陈迪,王聪 定损员前往定损', '14');

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
