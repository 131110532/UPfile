/*
Navicat MySQL Data Transfer

Source Server         : happy
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-05-27 23:18:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customerinfo
-- ----------------------------
DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `IDcard` varchar(18) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` char(1) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  PRIMARY KEY  (`IDcard`),
  KEY `userName` (`userName`),
  CONSTRAINT `userName` FOREIGN KEY (`userName`) REFERENCES `login` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customerinfo
-- ----------------------------
INSERT INTO `customerinfo` VALUES ('000000000000000000', '车位主人A', 'M', '13333333333', 'a4184339');
INSERT INTO `customerinfo` VALUES ('331003199409220015', '张志斌', 'M', '18463111163', '131110532');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `userName` varchar(10) NOT NULL,
  `passWord` varchar(10) NOT NULL,
  `role` int(1) NOT NULL,
  PRIMARY KEY  (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('131110532', '1', '0');
INSERT INTO `login` VALUES ('a', 'a', '0');
INSERT INTO `login` VALUES ('a4184339', 'a4184339', '0');
INSERT INTO `login` VALUES ('manage', 'manage', '1');

-- ----------------------------
-- Table structure for parkspace
-- ----------------------------
DROP TABLE IF EXISTS `parkspace`;
CREATE TABLE `parkspace` (
  `parkSpaceID` varchar(10) NOT NULL,
  `location` varchar(10) NOT NULL,
  `ifIdle` char(1) NOT NULL,
  `presentCustomer` varchar(18) NOT NULL,
  PRIMARY KEY  (`parkSpaceID`),
  KEY `presentCustmer` (`presentCustomer`),
  CONSTRAINT `presentCustmer` FOREIGN KEY (`presentCustomer`) REFERENCES `customerinfo` (`IDcard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parkspace
-- ----------------------------
INSERT INTO `parkspace` VALUES ('5C023', '市中心地下停车场', '1', '000000000000000000');
INSERT INTO `parkspace` VALUES ('N014', '城北风雪道场5号', '2', '331003199409220015');
INSERT INTO `parkspace` VALUES ('P085', '十里铺大道左侧3号', '0', '000000000000000000');
INSERT INTO `parkspace` VALUES ('S001', '城南花园小区1号', '0', '000000000000000000');
INSERT INTO `parkspace` VALUES ('S002', '城南花园小区2号', '1', '000000000000000000');
INSERT INTO `parkspace` VALUES ('S003', '城南光明大街1号', '1', '000000000000000000');
INSERT INTO `parkspace` VALUES ('S005', '城南光明大街2号', '1', '331003199409220015');
INSERT INTO `parkspace` VALUES ('S006', '城南山后村停车场', '1', '000000000000000000');
INSERT INTO `parkspace` VALUES ('S007', '城南山后村停车场', '0', '000000000000000000');
