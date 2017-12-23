/*
Navicat MySQL Data Transfer

Source Server         : FFF
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : claims

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-23 15:00:57
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
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('18', '小红', 'ES1513915001', '2017-12-22 16:42:52', '广州芳村', '6', '1,2,3', '陈宏子,陈迪,王聪 ', '2000', '车险', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '4', '车身受损');
INSERT INTO `case` VALUES ('19', '小红', 'ES1513915029', '2017-12-23 14:54:27', '广州白云', '6', '2', '陈迪', '5000', '健康', '重大疾病,轻症疾病', '4', '阑尾炎手术');

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
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '陈宏子', '13801138000');
INSERT INTO `employee` VALUES ('2', '陈迪', '13801138001');
INSERT INTO `employee` VALUES ('3', '王聪 ', '13801138002');
INSERT INTO `employee` VALUES ('4', '李凯生', '13801138003');
INSERT INTO `employee` VALUES ('5', '尚继鹏', '13801138004');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `follow_name` varchar(255) DEFAULT NULL,
  `follow_phone` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('2', 'ES1513915001', '小红', '13800138003', '李凯生', '13801138003', '2017:12:23 14:48:39');
INSERT INTO `follow` VALUES ('3', 'ES1513915029', '小红', '13800138003', '尚继鹏', '13801138004', '2017:12:23 14:59:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('4', 'abczzz', 'ES1513832000', '1', '1,2,3,4,5', '2', '5000', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '车险', '13800138001');
INSERT INTO `order` VALUES ('6', 'abczzz', 'ES1513837024', '5', '14', '2', '100000', '养老储蓄', '人寿', '13800138001');
INSERT INTO `order` VALUES ('7', '小明', 'ES1513837065', '1', '1,2,3,4,5', '3', '5000', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '车险', '13800138002');
INSERT INTO `order` VALUES ('9', '小明', 'ES1513908715', '3', '9,10', '3', '8000', '重大疾病,轻症疾病', '健康', '13800138002');
INSERT INTO `order` VALUES ('10', '小明', 'ES1513908734', '2', '6,7,8', '3', '15000', '意外身故,意外残疾,意外伤害', '意外', '13800138002');
INSERT INTO `order` VALUES ('11', '小红', 'ES1513915001', '1', '1,2,3,4,5', '4', '5000', '交强险,第三方责任险,盗抢险,车身刮痕,玻璃单独破碎', '车险', '13800138003');
INSERT INTO `order` VALUES ('13', '小红', 'ES1513915029', '3', '9,10', '4', '15000', '重大疾病,轻症疾病', '健康', '13800138003');
INSERT INTO `order` VALUES ('14', '小红', 'ES1513915046', '5', '14,15', '4', '8000', '养老储蓄,定期人寿', '人寿', '13800138003');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of speed
-- ----------------------------
INSERT INTO `speed` VALUES ('17', '2017-12-22 16:42:52', '用户小红于2017-12-22 16:42:52报案<br/>报案地址广州芳村', '18');
INSERT INTO `speed` VALUES ('18', '2017:12:22 16:43:12', '已经指派陈宏子,陈迪,王聪 定损员前往定损', '18');
INSERT INTO `speed` VALUES ('19', '2017:12:22 16:43:32', '定损金额: 2000<br/>描述: 车身受损<br/>', '18');
INSERT INTO `speed` VALUES ('20', '2017:12:22 16:43:47', '用户小红已经预付了金额', '18');
INSERT INTO `speed` VALUES ('21', '2017:12:22 16:43:59', '已立案,等待核赔', '18');
INSERT INTO `speed` VALUES ('22', '2017:12:22 16:44:49', '案件已经过审核,赔偿已经打进绑定银行卡', '18');
INSERT INTO `speed` VALUES ('23', '2017:12:22 16:49:22', '已结案', '18');
INSERT INTO `speed` VALUES ('24', '2017:12:23 14:48:39', '已经指派李凯生进行后期跟进联系电话13801138003', '18');
INSERT INTO `speed` VALUES ('25', '2017-12-23 14:54:27', '用户小红于2017-12-23 14:54:27报案<br/>报案地址广州白云', '19');
INSERT INTO `speed` VALUES ('26', '2017:12:23 14:54:49', '已经指派陈迪定损员前往定损', '19');
INSERT INTO `speed` VALUES ('27', '2017:12:23 14:58:51', '定损金额: 5000<br/>描述: 阑尾炎手术<br/>', '19');
INSERT INTO `speed` VALUES ('28', '2017:12:23 14:59:06', '用户小红已经预付了金额', '19');
INSERT INTO `speed` VALUES ('29', '2017:12:23 14:59:11', '已立案,等待核赔', '19');
INSERT INTO `speed` VALUES ('30', '2017:12:23 14:59:16', '案件已经过审核,赔偿已经打进绑定银行卡', '19');
INSERT INTO `speed` VALUES ('31', '2017:12:23 14:59:24', '已结案', '19');
INSERT INTO `speed` VALUES ('32', '2017:12:23 14:59:33', '已经指派尚继鹏进行后期跟进,联系电话13801138004.', '19');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '0', '13800138000');
INSERT INTO `user` VALUES ('2', 'abczzz', '123456', '1', '13800138001');
INSERT INTO `user` VALUES ('3', '小明', '123456', '1', '13800138002');
INSERT INTO `user` VALUES ('4', '小红', '123456', '1', '13800138003');
