/*
Navicat MySQL Data Transfer

Source Server         : mycon
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : online_shopping

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-04-28 15:32:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_address_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_address_detail`;
CREATE TABLE `tb_address_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `detail_address` varchar(100) DEFAULT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address_detail
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_city
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_collect_commodity
-- ----------------------------

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
-- Records of tb_collect_seller
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comment_append
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment_append`;
CREATE TABLE `tb_comment_append` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `comment` text,
  `reply` text,
  `comment_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment_append
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment_image
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_commodity
-- ----------------------------
INSERT INTO `tb_commodity` VALUES ('1', '1', '<p>Apple/苹果 iPhone XR (A2108) 128GB 黑色 移动联通电信4G手机 双卡双待</p>', null, null, null, '0', 'O1CN0122AEDTONiTEEAnd_!!1917047079.jpg');
INSERT INTO `tb_commodity` VALUES ('2', '1', 'Apple/苹果 iPad mini', null, null, null, '0', 'O1CN01eVJCwN22AEFwTvLUB_!!1917047079.png');
INSERT INTO `tb_commodity` VALUES ('3', '1', 'Apple/苹果 iPad mini 智能保护盖', null, null, null, '0', 'O1CN01bYoJLW21EWMAbX0Ly_!!3472016953.jpg');
INSERT INTO `tb_commodity` VALUES ('4', '2', 'Huawei/华为 Mate 20 Pro 曲面屏后置徕卡三镜头980芯片智能手机', null, null, null, '0', 'TB1f38lihnaK1RjSZFB.bcW7VXa_054933.jpg');
INSERT INTO `tb_commodity` VALUES ('5', '3', 'Xiaomi/小米 小米9 骁龙855全面屏索尼4800万三摄指纹拍照游戏手机官方旗舰NFC王源mix3s', null, null, null, '0', 'O1CN01RCSkjt2KQrifZwXUU_!!0-item_pic.jpg');
INSERT INTO `tb_commodity` VALUES ('6', '4', 'Meizu/魅族 16th全网通屏下指纹人脸识别高通骁龙845官方旗舰店正品手机', null, null, null, '0', 'TB2PeaxrH3nBKNjSZFMXXaUSFXa_!!1764629552-0-item_pic.jpg');
INSERT INTO `tb_commodity` VALUES ('7', '5', 'OPPO Find X兰博基尼版8+512GB全网通oppofindx4G拍照手机正品oppo findx', null, null, null, '0', 'TB1qiXTBRmWBuNkSndVU4csApXa_115433.jpg');
INSERT INTO `tb_commodity` VALUES ('8', '6', 'vivo NEX双屏版全网通智能4G官方正品双屏手机vivonex双屏版 nex双面屏 nex2 apex', null, null, null, '0', 'TB121n3NNTpK1RjSZFMgjLG_VXa_051350.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_commodity_extend_property
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_commodity_media_resource
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_commodity_select_property
-- ----------------------------
INSERT INTO `tb_commodity_select_property` VALUES ('1', '1', '1', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('2', '1', '1', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('3', '1', '2', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('4', '1', '2', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('5', '2', '3', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('6', '2', '3', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('7', '2', '4', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('8', '2', '4', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('9', '3', '5', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('10', '3', '5', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('11', '3', '6', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('12', '3', '6', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('13', '4', '7', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('14', '5', '8', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('15', '6', '9', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('16', '7', '10', '2', '机身颜色', 'TB2Emm3tS8YBeNkSnb4XXaevFXa_!!901409638.jpg_40x40q90.jpg+波尔多红');
INSERT INTO `tb_commodity_select_property` VALUES ('17', '8', '11', null, null, null);
INSERT INTO `tb_commodity_select_property` VALUES ('18', '7', '10', '0', '存储容量', '8+128GB');
INSERT INTO `tb_commodity_select_property` VALUES ('19', '7', '12', '2', '机身颜色', 'TB1u4kWpaQoBKNjSZJnDjSw9VXa_113056.jpg_40x40q90.jpg+碳纤黑');
INSERT INTO `tb_commodity_select_property` VALUES ('20', '7', '12', '2', '存储容量', '8+128GB');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_commodity_variable
-- ----------------------------
INSERT INTO `tb_commodity_variable` VALUES ('1', '1', null, '3599.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('2', '2', null, '4499.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('3', '3', null, '2921.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('4', '4', null, '4090.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('9', '5', null, '320.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('10', '6', null, '430.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('11', '7', null, '5499.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('12', '8', null, '3299.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('13', '9', null, '2298.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('14', '10', '293', '4999.11', null);
INSERT INTO `tb_commodity_variable` VALUES ('15', '11', null, '4998.00', null);
INSERT INTO `tb_commodity_variable` VALUES ('16', '12', '433', '9999.00', null);

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
-- Records of tb_commodity_variety
-- ----------------------------

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
-- Records of tb_history
-- ----------------------------

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
  `is_delete` tinyint(1) DEFAULT '0',
  `receive_address` char(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number_unique` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', null, null, null, null, null, '2019-04-19 15:13:24', null, '0', null);
INSERT INTO `tb_order` VALUES ('2', null, null, null, null, null, '2019-04-19 17:32:50', null, '0', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_commodity_select_property
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_detail
-- ----------------------------
INSERT INTO `tb_order_detail` VALUES ('1', '1', '1', null, null, null, null, '3');
INSERT INTO `tb_order_detail` VALUES ('3', '1', '1', null, null, null, null, '2');
INSERT INTO `tb_order_detail` VALUES ('4', '2', '1', null, null, null, null, '5');

-- ----------------------------
-- Table structure for tb_province
-- ----------------------------
DROP TABLE IF EXISTS `tb_province`;
CREATE TABLE `tb_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_province
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_seller
-- ----------------------------
INSERT INTO `tb_seller` VALUES ('1', null, null, null, 'Apple Store 官方旗舰店', null, null, null, null, null);
INSERT INTO `tb_seller` VALUES ('2', null, null, null, '华为官方旗舰店', null, null, null, null, null);
INSERT INTO `tb_seller` VALUES ('3', null, null, null, '小米官方旗舰店', null, null, null, null, null);
INSERT INTO `tb_seller` VALUES ('4', null, null, null, '魅族官方旗舰店', null, null, null, null, null);
INSERT INTO `tb_seller` VALUES ('5', null, null, null, 'OPPO官方旗舰店', 'oppo.png', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('6', null, null, null, 'VIVO官方旗舰店', null, null, null, null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------

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

-- ----------------------------
-- Records of tb_variety
-- ----------------------------
INSERT INTO `tb_variety` VALUES ('1', '26', '男士外套');
INSERT INTO `tb_variety` VALUES ('2', '1', '夹克');
INSERT INTO `tb_variety` VALUES ('3', '1', '棉衣');
INSERT INTO `tb_variety` VALUES ('4', '1', '风衣');
INSERT INTO `tb_variety` VALUES ('5', '1', '运动服');
INSERT INTO `tb_variety` VALUES ('6', '1', '棒球服');
INSERT INTO `tb_variety` VALUES ('7', '1', '工装外套');
INSERT INTO `tb_variety` VALUES ('8', '1', '羽绒服');
INSERT INTO `tb_variety` VALUES ('9', '1', '西服套装');
INSERT INTO `tb_variety` VALUES ('10', '1', '皮衣');
INSERT INTO `tb_variety` VALUES ('11', '1', '马甲');
INSERT INTO `tb_variety` VALUES ('12', '1', '针织开衫');
INSERT INTO `tb_variety` VALUES ('13', '1', '单西');
INSERT INTO `tb_variety` VALUES ('14', '1', '毛呢大衣');
INSERT INTO `tb_variety` VALUES ('15', '26', '男士内搭');
INSERT INTO `tb_variety` VALUES ('16', '15', '短袖T恤');
INSERT INTO `tb_variety` VALUES ('17', '15', '短袖T恤');
INSERT INTO `tb_variety` VALUES ('18', '15', 'POLO衫');
INSERT INTO `tb_variety` VALUES ('19', '15', '短袖衬衫');
INSERT INTO `tb_variety` VALUES ('20', '15', '背心');
INSERT INTO `tb_variety` VALUES ('21', '15', '短袖T恤');
INSERT INTO `tb_variety` VALUES ('22', '15', '卫衣');
INSERT INTO `tb_variety` VALUES ('23', '15', '毛衣');
INSERT INTO `tb_variety` VALUES ('24', '15', '长袖T恤');
INSERT INTO `tb_variety` VALUES ('25', '15', '长袖衬衫');
INSERT INTO `tb_variety` VALUES ('26', null, '男装');
INSERT INTO `tb_variety` VALUES ('27', '26', '男士裤装');
INSERT INTO `tb_variety` VALUES ('28', '27', '小脚裤');
INSERT INTO `tb_variety` VALUES ('29', '27', '9分裤');
INSERT INTO `tb_variety` VALUES ('30', '27', '短裤');
INSERT INTO `tb_variety` VALUES ('31', '27', '休闲裤');
INSERT INTO `tb_variety` VALUES ('32', '27', '牛仔裤');
INSERT INTO `tb_variety` VALUES ('33', '27', '针织裤');
INSERT INTO `tb_variety` VALUES ('34', '27', '西装');
INSERT INTO `tb_variety` VALUES ('35', '27', '运动裤');
INSERT INTO `tb_variety` VALUES ('36', '27', '工装裤');
INSERT INTO `tb_variety` VALUES ('37', null, '运动户外');
INSERT INTO `tb_variety` VALUES ('38', '37', '运动服');
INSERT INTO `tb_variety` VALUES ('39', '38', '运动内衣');
INSERT INTO `tb_variety` VALUES ('40', '38', '运动裤');
INSERT INTO `tb_variety` VALUES ('41', '38', '运动polo');
INSERT INTO `tb_variety` VALUES ('42', '38', '运动卫衣');
INSERT INTO `tb_variety` VALUES ('43', '38', '运动套装');
INSERT INTO `tb_variety` VALUES ('44', '38', '运动短裤');
INSERT INTO `tb_variety` VALUES ('45', '38', '健身服');
INSERT INTO `tb_variety` VALUES ('46', '38', '短袖t恤');
INSERT INTO `tb_variety` VALUES ('47', '37', '运动鞋');
INSERT INTO `tb_variety` VALUES ('48', '47', '跑步鞋');
INSERT INTO `tb_variety` VALUES ('49', '47', '板鞋');
INSERT INTO `tb_variety` VALUES ('50', '47', '潮鞋');
INSERT INTO `tb_variety` VALUES ('51', '47', '休闲鞋');
INSERT INTO `tb_variety` VALUES ('52', '47', '篮球鞋');
INSERT INTO `tb_variety` VALUES ('53', '47', '足球鞋');
