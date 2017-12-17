/*
Navicat MySQL Data Transfer

Source Server         : project
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sale

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-17 00:01:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES ('1', '车险');
INSERT INTO `cate` VALUES ('2', '意外');
INSERT INTO `cate` VALUES ('3', '旅行');
INSERT INTO `cate` VALUES ('4', '健康');
INSERT INTO `cate` VALUES ('5', '财产');
INSERT INTO `cate` VALUES ('6', '人寿');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '国华保险有限公司', '国华人寿保险股份有限公司成立于2007年11月，总部位于上海，是由中国保险监督管理委员会批准设立的全国性、股份制专业寿险公司。国华人寿坚持科学发展观，科学把握寿险经营规律，寻求差异化发展路径，坚持财富管理与风险保障并举，在保险行业率先探索互联网保险发展，目前，公司已开设北京、山东、浙江、河南、广东、上海、河北、江苏、天津、湖北、辽宁、重庆、四川、山西、湖南、青岛、安徽、深圳等18家省级分公司，在上海、广州成立了全国性的电话销售中心和客户联络中心。 国华人寿秉承信任、责任、精益、价值四个核心价值观，以让每个家庭拥有保障和幸福为使命，致力于成为最能为客户、员工、股东、社会创造价值的保险公司。');
INSERT INTO `company` VALUES ('2', '泰康保险有限公司', '');
INSERT INTO `company` VALUES ('3', '大都会集团', '');
INSERT INTO `company` VALUES ('4', '中国人保寿险', '');
INSERT INTO `company` VALUES ('5', '北京大特保险', '');
INSERT INTO `company` VALUES ('6', '平安保险', '');
INSERT INTO `company` VALUES ('7', '太平洋保险', '');
INSERT INTO `company` VALUES ('8', '中国人寿', '');
INSERT INTO `company` VALUES ('9', '中华联合', '');
INSERT INTO `company` VALUES ('10', '大地车辆保险', '');
INSERT INTO `company` VALUES ('11', '天安车辆保险', '');
INSERT INTO `company` VALUES ('12', '永安车辆保险', '');
INSERT INTO `company` VALUES ('13', '阳光车辆保险', '');
INSERT INTO `company` VALUES ('14', '安邦车辆保险', '');
INSERT INTO `company` VALUES ('15', '人保车险', '');
INSERT INTO `company` VALUES ('16', '德华安顾', '');
INSERT INTO `company` VALUES ('17', '美亚财产保险', '');
INSERT INTO `company` VALUES ('18', '新华人寿保险股份', '');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_2` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `limit` varchar(255) NOT NULL,
  `goods_pic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '泰康全年综合意外医疗险', '2', '1', '1', '综合保障', '意外医疗/住院津贴全覆盖', '10.00', '30', '');
INSERT INTO `goods` VALUES ('2', '国华综合意外险升级版', '1', '1', '1', '综合保障', '意外、医疗、猝死、暴乱全能保', '30.00', '10', '');
INSERT INTO `goods` VALUES ('3', '国华千万身价航空意外险', '1', '1', '0', '畅游天下', '保额最高可达一千万', '7.50', '500', '');
INSERT INTO `goods` VALUES ('4', '大都会自驾车意外险', '3', '1', '0', '畅游天下', '高性价比高 全球可保', '0.50', '10', '');
INSERT INTO `goods` VALUES ('5', '大都会千万航空意外险', '3', '1', '0', '畅游天下', '千万飞行保障', '1.00', '100', '');
INSERT INTO `goods` VALUES ('6', '500万全年航空意外保障', '2', '1', '0', '畅游天下', '高端商务人士差旅必备', '100.00', '500', '');
INSERT INTO `goods` VALUES ('7', '20万全年航空意外保障', '4', '1', '0', '畅游天下', '全年航空意外保障', '15.00', '20', '');
INSERT INTO `goods` VALUES ('8', '球类综合运动无忧保', '5', '1', '2', '运动无忧', '高危风险运动意外全保障', '2.00', '10', '');
INSERT INTO `goods` VALUES ('9', '户外运动保障计划', '3', '1', '2', '运动无忧', '高性价比，户外运动者的专属保障', '2.40', '10', '');
INSERT INTO `goods` VALUES ('10', '水上运动意外险', '3', '1', '2', '运动无忧', '高性价比，保障全面，水上运动爱好者的专属保障', '4.20', '30', '');
INSERT INTO `goods` VALUES ('11', '户外综合运动无忧保', '5', '1', '2', '运动无忧', '年付低至0.8元/天，高风险运动全保障', '5.00', '20', '');
INSERT INTO `goods` VALUES ('12', '成长综合意外保障', '4', '1', '1', '综合保障', '孩子是未来的希望！保障从她们开始！', '70.00', '30', '');
INSERT INTO `goods` VALUES ('13', '平安保险', '6', '0', '0', '安全出行', '在线报案 闪赔直赔', '', '', '');
INSERT INTO `goods` VALUES ('14', '太平洋保险', '7', '0', '0', '安全出行', '非事故道路救援', '', '', '');
INSERT INTO `goods` VALUES ('15', '中国人寿车险', '8', '0', '0', '安全出行', '简单事故 极速理赔', '', '', '');
INSERT INTO `goods` VALUES ('16', '中华联合车险', '9', '0', '0', '安全出行', '增值服务更贴心', '', '', '');
INSERT INTO `goods` VALUES ('17', '大地车辆保险', '10', '0', '0', '安全出行', '\r\n异地出险 就地理赔', '', '', '');
INSERT INTO `goods` VALUES ('18', '天安车辆保险', '11', '0', '0', '安全出行', '365天x24小时服务', '', '', '');
INSERT INTO `goods` VALUES ('19', '永安车辆保险', '12', '0', '0', '安全出行', '理赔材料上门收取', '', '', '');
INSERT INTO `goods` VALUES ('20', '阳光车辆保险', '13', '0', '0', '安全出行', '\r\n单方事故 无需现场', '', '', '');
INSERT INTO `goods` VALUES ('21', '境内自驾游保障 ', '16', '2', '0', '畅游天下', '低保费，全面保障 ', '11.00', '10', '');
INSERT INTO `goods` VALUES ('22', '宝岛游踪台湾旅行险', '17', '2', '0', '畅游天下', '特别协助、各种资讯服务、国际医疗支援', '55.00', '20', '');
INSERT INTO `goods` VALUES ('23', '德华境内短线旅游险', '16', '2', '0', '畅游天下', '低保费，全面保障', '12.00', '10', '');
INSERT INTO `goods` VALUES ('24', '德华境内长线旅行险', '16', '2', '0', '畅游天下', '低保费，全面保障，24小时医疗咨询', '16.00', '10', '');
INSERT INTO `goods` VALUES ('25', '\r\n人保寿险旅游保险', '4', '2', '1', '畅游天下', '专门针对旅游意外伤害医疗保障', '80.00', '20', '');
INSERT INTO `goods` VALUES ('26', '德华全球畅游旅行险', '16', '2', '1', '畅游天下', '低保费，全面保障', '96.00', '10', '');
INSERT INTO `goods` VALUES ('27', '保终身重疾险（可分期）', '1', '3', '0', '住院有保障', '极致省钱 身故返还保费 轻症豁免保费', '33.57', '10', '');
INSERT INTO `goods` VALUES ('28', '保30年重疾险（可分期）', '1', '3', '0', '住院有保障', '身故全额返保费 50种轻症保障', '4.05', '10', '');
INSERT INTO `goods` VALUES ('29', '百病百万重大疾病保障', '1', '3', '0', '住院有保障', '百万守护、百病无忧', '45.80', '10', '');
INSERT INTO `goods` VALUES ('30', '新华重大疾病保障', '18', '3', '0', '住院有保障', '专业重疾保障 价格实惠免体检', '80.00', '10', '');
INSERT INTO `goods` VALUES ('31', '\r\n少儿重疾综合保障', '2', '3', '0', '住院有保障', '重疾轻症少儿白血病多重保障，最高70万保额，确诊即赔治病无忧', '55.00', '25', '');
INSERT INTO `goods` VALUES ('32', '平安e生保三百万医疗', '6', '3', '1', '保障健康', '提供全国顶尖医院就医服务 专家门诊/住院安排替您搞定', '174.00', '100', '');
INSERT INTO `goods` VALUES ('33', '\r\n国华至尊500万医疗险', '1', '3', '1', '保障健康', '五百万保额 不限社保 重疾0免赔', '131.00', '500', '');
INSERT INTO `goods` VALUES ('34', '日常小病医疗保险', '2', '3', '1', '保障健康', '万元保额百元免赔', '99.00', '10', '');
INSERT INTO `goods` VALUES ('35', '“月月领”终身年金', '1', '5', '0', '养老储蓄', '交钱一阵子，领钱一辈子', '400.00', '100', '//img30.360buyimg.com/baoxian/jfs/t9442/264/2431986242/68611/7563b293/59ce03bcNeaf6007a.jpg');
INSERT INTO `goods` VALUES ('36', '“年年领”终身养老金', '1', '5', '0', '养老储蓄', '稳定现金流，领取至终身', '1000.00', '120', '');
INSERT INTO `goods` VALUES ('37', '泰康定期寿险', '2', '5', '1', '定期寿险', '一年期定期寿险，留爱不留债，用爱守护您的家人！', '72.00', '100', '');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(255) NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `cate_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `limit` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'AE1513438047', '“月月领”终身年金', '财产', '国华保险有限公司', '100', '1');
INSERT INTO `order` VALUES ('8', 'AE1513438657', '“月月领”终身年金', '财产', '国华保险有限公司', '100', '1');
INSERT INTO `order` VALUES ('9', 'AE1513438857', '“月月领”终身年金', '财产', '国华保险有限公司', '100', '1');
INSERT INTO `order` VALUES ('10', 'AE1513439672', '泰康全年综合意外医疗险', '车险', '泰康保险有限公司', '30', '1');
INSERT INTO `order` VALUES ('11', 'AE1513439875', '境内自驾游保障 ', '意外', '德华安顾', '10', '1');
INSERT INTO `order` VALUES ('12', 'AE1513439983', '保终身重疾险（可分期）', '旅行', '国华保险有限公司', '10', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `wealth` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456', 'abczzz', '96345.43');
