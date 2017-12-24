/*
Navicat MySQL Data Transfer

Source Server         : localdocker
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : DB_FLOWER

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-10 01:26:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(30) DEFAULT NULL COMMENT '管理员用户名',
  `password` varchar(30) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'wuxiao', '123456');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `categoryName` varchar(30) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312 COMMENT='商品分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('3', '商品分类一');
INSERT INTO `category` VALUES ('4', '商品分类二');
INSERT INTO `category` VALUES ('5', '商品分类三');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goodsName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `description` varchar(200) DEFAULT NULL COMMENT '商品描述说明',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `categoryId` int(11) DEFAULT NULL COMMENT '商品分类（商品分类表外键ID）',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312 COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('6', '盘子', '盘子盘子', '5.00', '4', 'upload/8e91288a932b536196f9bd48c260bfa2.gif');
INSERT INTO `goods` VALUES ('7', '鞋子', '鞋子鞋子', '67.00', '3', 'upload/013dcf51f545db1dce3dafb3db60fd536e.jpg');
INSERT INTO `goods` VALUES ('8', '书本', '书本书本书本', '99.00', '5', 'upload/d009b3de9c82d158e21314f3820a19d8b.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordersId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `username` varchar(30) DEFAULT NULL COMMENT '用户名（用户表username）',
  `num` int(11) DEFAULT NULL COMMENT '商品数量',
  `sum` decimal(10,2) DEFAULT NULL COMMENT '商品总金额',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  PRIMARY KEY (`ordersId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('6', 'wuxiao', '2', '166.00', '2017-09-10 01:12:26');

-- ----------------------------
-- Table structure for ordersDetails
-- ----------------------------
DROP TABLE IF EXISTS `ordersDetails`;
CREATE TABLE `ordersDetails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ordersId` int(10) DEFAULT NULL COMMENT '订单ID（外键，订单表）',
  `goodsName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `num` int(11) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312 COMMENT='订单详情表';

-- ----------------------------
-- Records of ordersDetails
-- ----------------------------
INSERT INTO `ordersDetails` VALUES ('6', '6', '书本', '99.00', '1');
INSERT INTO `ordersDetails` VALUES ('7', '6', '鞋子', '67.00', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(30) DEFAULT NULL COMMENT '用户名，（用户名唯一约束）',
  `realName` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(30) DEFAULT NULL COMMENT '密码',
  `pwdQuestion` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `pwdQuestionAnswer` varchar(50) DEFAULT NULL COMMENT '密保答案',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `phoneNO` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='用户资料表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('6', 'wuxiao', '吴啸', '123456', '你出生的街道是', '四川路', '地址地址地址地址', '13780846442', 'shaoya@163.com');
