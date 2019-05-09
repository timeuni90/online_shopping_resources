/*
Navicat MySQL Data Transfer

Source Server         : mycon
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : online_shopping

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-05-09 22:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_address_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_address_detail`;
CREATE TABLE `tb_address_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `area_id` varchar(20) DEFAULT NULL,
  `detail_address` varchar(100) DEFAULT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `id` varchar(11) NOT NULL,
  `area_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `select_property_row` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_class_unique` (`user_id`,`select_property_row`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city` (
  `id` varchar(11) NOT NULL,
  `city_id` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `province_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='���������������Ϣ��';

-- ----------------------------
-- Table structure for tb_collect_commodity
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect_commodity`;
CREATE TABLE `tb_collect_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_commodity_unique` (`user_id`,`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_collect_seller
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect_seller`;
CREATE TABLE `tb_collect_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_seller_unique` (`user_id`,`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_commodity_unique` (`order_id`,`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_comment_append
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment_append`;
CREATE TABLE `tb_comment_append` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `comment` text,
  `reply` text,
  `comment_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment_image`;
CREATE TABLE `tb_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_append_id` int(11) DEFAULT NULL,
  `comment_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_append_image_unique` (`comment_append_id`,`comment_image`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_commodity
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity`;
CREATE TABLE `tb_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `subtitle` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `detail` text,
  `is_delete` tinyint(1) DEFAULT '0',
  `cover_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_commodity_extend_property
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity_extend_property`;
CREATE TABLE `tb_commodity_extend_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `property_name` varchar(50) DEFAULT NULL,
  `property_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commodity_property_name_unique` (`commodity_id`,`property_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_commodity_media_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity_media_resource`;
CREATE TABLE `tb_commodity_media_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `media_type` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_commodity_select_property
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity_select_property`;
CREATE TABLE `tb_commodity_select_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `select_property_row` varchar(20) DEFAULT NULL,
  `media_type` int(11) DEFAULT NULL,
  `property_name` varchar(50) DEFAULT NULL,
  `property_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_index` (`select_property_row`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_commodity_variable
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity_variable`;
CREATE TABLE `tb_commodity_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `select_property_row` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` float(20,2) DEFAULT NULL,
  `promotion_price` float(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_unique` (`select_property_row`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_commodity_variety
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity_variety`;
CREATE TABLE `tb_commodity_variety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `variety_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commodity_variety_unique` (`commodity_id`,`variety_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_history`;
CREATE TABLE `tb_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `browse_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_commodity_unique` (`user_id`,`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `store_name` varchar(20) DEFAULT NULL,
  `generate_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `receive_address` char(200) DEFAULT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  `user_is_delete` tinyint(1) DEFAULT '0',
  `seller_is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number_unique` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order_commodity_select_property
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_commodity_select_property`;
CREATE TABLE `tb_order_commodity_select_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_detail_id` int(11) DEFAULT NULL,
  `property_name` varchar(50) DEFAULT NULL,
  `property_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_detail`;
CREATE TABLE `tb_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `commotity_name` varchar(200) DEFAULT NULL,
  `commodity_cover` varchar(100) DEFAULT NULL,
  `price` float(20,2) DEFAULT NULL,
  `promotion_price` float(20,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_province
-- ----------------------------
DROP TABLE IF EXISTS `tb_province`;
CREATE TABLE `tb_province` (
  `id` varchar(11) NOT NULL,
  `province_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='ʡ����Ϣ��';

-- ----------------------------
-- Table structure for tb_seller
-- ----------------------------
DROP TABLE IF EXISTS `tb_seller`;
CREATE TABLE `tb_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `store_name` varchar(20) DEFAULT NULL,
  `store_cover` varchar(100) DEFAULT NULL,
  `store_status` int(11) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `activity` text,
  `detail_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_variety
-- ----------------------------
DROP TABLE IF EXISTS `tb_variety`;
CREATE TABLE `tb_variety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
