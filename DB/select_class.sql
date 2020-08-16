/*
 Navicat Premium Data Transfer

 Source Server         : 134.175.49.155（虚拟机）
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 134.175.49.155:3306
 Source Schema         : select_class

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/05/2020 17:13:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `premission` int(255) NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 0, '123456', '15698654878', '男', '管理员1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add course', 7, 'add_course');
INSERT INTO `auth_permission` VALUES (26, 'Can change course', 7, 'change_course');
INSERT INTO `auth_permission` VALUES (27, 'Can delete course', 7, 'delete_course');
INSERT INTO `auth_permission` VALUES (28, 'Can view course', 7, 'view_course');
INSERT INTO `auth_permission` VALUES (29, 'Can add performance', 8, 'add_performance');
INSERT INTO `auth_permission` VALUES (30, 'Can change performance', 8, 'change_performance');
INSERT INTO `auth_permission` VALUES (31, 'Can delete performance', 8, 'delete_performance');
INSERT INTO `auth_permission` VALUES (32, 'Can view performance', 8, 'view_performance');
INSERT INTO `auth_permission` VALUES (33, 'Can add student information', 9, 'add_studentinformation');
INSERT INTO `auth_permission` VALUES (34, 'Can change student information', 9, 'change_studentinformation');
INSERT INTO `auth_permission` VALUES (35, 'Can delete student information', 9, 'delete_studentinformation');
INSERT INTO `auth_permission` VALUES (36, 'Can view student information', 9, 'view_studentinformation');
INSERT INTO `auth_permission` VALUES (37, 'Can add teacher information', 10, 'add_teacherinformation');
INSERT INTO `auth_permission` VALUES (38, 'Can change teacher information', 10, 'change_teacherinformation');
INSERT INTO `auth_permission` VALUES (39, 'Can delete teacher information', 10, 'delete_teacherinformation');
INSERT INTO `auth_permission` VALUES (40, 'Can view teacher information', 10, 'view_teacherinformation');
INSERT INTO `auth_permission` VALUES (41, 'Can add admin', 11, 'add_admin');
INSERT INTO `auth_permission` VALUES (42, 'Can change admin', 11, 'change_admin');
INSERT INTO `auth_permission` VALUES (43, 'Can delete admin', 11, 'delete_admin');
INSERT INTO `auth_permission` VALUES (44, 'Can view admin', 11, 'view_admin');
INSERT INTO `auth_permission` VALUES (45, 'Can add auth group', 12, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (46, 'Can change auth group', 12, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (47, 'Can delete auth group', 12, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (48, 'Can view auth group', 12, 'view_authgroup');
INSERT INTO `auth_permission` VALUES (49, 'Can add auth group permissions', 13, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (50, 'Can change auth group permissions', 13, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (51, 'Can delete auth group permissions', 13, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (52, 'Can view auth group permissions', 13, 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (53, 'Can add auth permission', 14, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (54, 'Can change auth permission', 14, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (55, 'Can delete auth permission', 14, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (56, 'Can view auth permission', 14, 'view_authpermission');
INSERT INTO `auth_permission` VALUES (57, 'Can add auth user', 15, 'add_authuser');
INSERT INTO `auth_permission` VALUES (58, 'Can change auth user', 15, 'change_authuser');
INSERT INTO `auth_permission` VALUES (59, 'Can delete auth user', 15, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (60, 'Can view auth user', 15, 'view_authuser');
INSERT INTO `auth_permission` VALUES (61, 'Can add auth user groups', 16, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (62, 'Can change auth user groups', 16, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (63, 'Can delete auth user groups', 16, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (64, 'Can view auth user groups', 16, 'view_authusergroups');
INSERT INTO `auth_permission` VALUES (65, 'Can add auth user user permissions', 17, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (66, 'Can change auth user user permissions', 17, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (67, 'Can delete auth user user permissions', 17, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (68, 'Can view auth user user permissions', 17, 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (69, 'Can add django admin log', 18, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (70, 'Can change django admin log', 18, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (71, 'Can delete django admin log', 18, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (72, 'Can view django admin log', 18, 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES (73, 'Can add django content type', 19, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (74, 'Can change django content type', 19, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (75, 'Can delete django content type', 19, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (76, 'Can view django content type', 19, 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES (77, 'Can add django migrations', 20, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (78, 'Can change django migrations', 20, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (79, 'Can delete django migrations', 20, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (80, 'Can view django migrations', 20, 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES (81, 'Can add django session', 21, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (82, 'Can change django session', 21, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (83, 'Can delete django session', 21, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (84, 'Can view django session', 21, 'view_djangosession');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_number` int(11) NULL DEFAULT NULL COMMENT '课程编号',
  `course_name` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '课程名称',
  `type` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型ABCDEFG',
  `class_day` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上课时间',
  `class_hours` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '每天时间点',
  `credit` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学分',
  `number_optional` int(11) NULL DEFAULT NULL COMMENT '人数限制',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '教师id',
  `publish_status` int(11) NULL DEFAULT NULL COMMENT '批改状态',
  `class_site` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上课地点',
  `start_school` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开课学年',
  `class_times` int(255) NULL DEFAULT NULL COMMENT '学时',
  `term` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `over_time` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 110, '会计', 'A', 'Wednesday', '10:00-12:00', '6', 200, 18, 1, '科技楼A410', '2020', 10, '2020年秋季', NULL);
INSERT INTO `course` VALUES (10, 999, '数据结构与AI', 'G', '周二', '8:00-09:30', '999', 200, 19, 1, '上课的地点', NULL, 520, '2020年秋季', '结束时间');
INSERT INTO `course` VALUES (11, 202, 'JAVA程序设计', 'A', '周一', '8:00-09:30', '6', 200, 16, 1, '科技楼A3', NULL, 20, '2020年春季', '301');
INSERT INTO `course` VALUES (12, 203, '网站开发python语言实现', 'B', '周一', '8:00-09:30', '6', 200, 19, 1, '北京楼', NULL, 30, '2020年春季', '2021年春季');
INSERT INTO `course` VALUES (13, 301, '玩转大数据', 'A', '周一', '8:00-09:30', '10', 200, 17, 1, '百度楼', NULL, 30, '2020年秋季', '2021年春季');
INSERT INTO `course` VALUES (15, 305, 'JAVA基础教程', 'C', '周一', '8:00-09:30', '6', 200, 9, 1, '百粤楼', NULL, 30, '2020年春季', '');
INSERT INTO `course` VALUES (18, 8834, '数据分析基础', 'A', '周一', '8:00-09:30', '5', 200, 33, 1, '科技楼', NULL, 20, '2020年春季', '2020年秋季');
INSERT INTO `course` VALUES (19, 8865, 'PYTHON进阶', 'C', '周四', '14:30-16:00', '6', 200, 33, 1, '科技楼', NULL, 20, '2020年春季', '2021年春');
INSERT INTO `course` VALUES (22, 501, 'HADOOP基础', 'A', '周一', '8:00-09:30', '6', 200, 41, 1, '科技楼1楼', NULL, 25, '2020年春季', '2020秋');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'manage', 'admin');
INSERT INTO `django_content_type` VALUES (12, 'manage', 'authgroup');
INSERT INTO `django_content_type` VALUES (13, 'manage', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (14, 'manage', 'authpermission');
INSERT INTO `django_content_type` VALUES (15, 'manage', 'authuser');
INSERT INTO `django_content_type` VALUES (16, 'manage', 'authusergroups');
INSERT INTO `django_content_type` VALUES (17, 'manage', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (7, 'manage', 'course');
INSERT INTO `django_content_type` VALUES (18, 'manage', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (19, 'manage', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (20, 'manage', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (21, 'manage', 'djangosession');
INSERT INTO `django_content_type` VALUES (8, 'manage', 'performance');
INSERT INTO `django_content_type` VALUES (9, 'manage', 'studentinformation');
INSERT INTO `django_content_type` VALUES (10, 'manage', 'teacherinformation');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-04-07 07:30:46.629000');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-04-07 07:30:46.856000');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-04-07 07:30:47.917000');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-04-07 07:30:48.086000');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-07 07:30:48.100000');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-04-07 07:30:48.326000');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-04-07 07:30:48.432000');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-04-07 07:30:48.553000');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-04-07 07:30:48.570000');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-04-07 07:30:48.641000');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-04-07 07:30:48.645000');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-04-07 07:30:48.655000');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-04-07 07:30:48.746000');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-04-07 07:30:48.836000');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-04-07 07:30:48.936000');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-04-07 07:30:48.951000');
INSERT INTO `django_migrations` VALUES (17, 'manage', '0001_initial', '2020-04-07 07:30:48.962000');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2020-04-07 07:30:49.003000');
INSERT INTO `django_migrations` VALUES (19, 'manage', '0002_admin_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_', '2020-04-08 06:45:41.269000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0zp6xx0hudkgpl8grrx1gtvw8d7fqowv', 'YmE3ZjkyYjA5ODY4ZDc2MGU3YzlkY2U4ZDhjYWFiYTdiODhiMzVlZDqABJUdAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWJzLg==', '2020-05-07 05:59:00.569103');
INSERT INTO `django_session` VALUES ('1ced6yahyjfefbwfl3zxgilem650570u', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 06:33:28.851000');
INSERT INTO `django_session` VALUES ('1dxad6wdyh8js9sr7lv18hefw5o3m1tp', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 05:51:58.529000');
INSERT INTO `django_session` VALUES ('1fau8ngginbntshz5tgrh2athm94nnsz', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 05:52:16.208000');
INSERT INTO `django_session` VALUES ('1hc9ocar6ozaa64qsq317qpcyq2gwumn', 'ZDgxZmIzMzk3ZDYwYjQ1NmM4MWQ5MTQxZDMzOGJkZGRiZWQzZjAyYjqABJWiAgAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjBJTdHVkZW50SW5mb3JtYXRpb26UhpSFlFKUfZQojAZfc3RhdGWUaAKMCk1vZGVsU3RhdGWUk5QpgZR9lCiMBmFkZGluZ5SJjAJkYpSMB2RlZmF1bHSUdWKMAmlklEsBjAZudW1iZXKUS2SMBG5hbWWUjAfmtYvor5UylIwMcHJvZmVzc2lvbmFslIwH5LiT5LiaM5SMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMCee7j+euoemZopSMBWdyYWRllIwETm9uZZSMCHByb3ZpbmNllIwG5a6B5aSPlIwPcHJvdmluY2VfZGV0YWlslIwJ6ZO25bed5biClIwFaG9iYnmUjA1bImphdmEiLCJBSSJdlIwPcG9saXRpY3Nfc3RhdHVzlIwG576k5LyXlIwFcGhvbmWUjAsxMzY2NjY2NjY4OJSMC2ZhbWlseV9jYXJklIwLMTY2ODg4ODg4NTWUjA9fZGphbmdvX3ZlcnNpb26UjAUyLjIuNZR1YowFYWRtaW6UaARoBYwFQWRtaW6UhpSFlFKUfZQojAZfc3RhdGWUaA0pgZR9lChoEIloEYwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUyLjIuNZR1YnUu', '2020-05-14 13:04:06.522834');
INSERT INTO `django_session` VALUES ('1w9eeuo8mdwpxy2cdgb0n1g0etrw8ere', 'OTU0MDJlYmRhYTIwY2FmNWJjYjE5NThmMWQyNDY4ZjRkZjYwM2ZiNzqABJXCAgAAAAAAAH2UKIwFYWRtaW6UjBVkamFuZ28uZGIubW9kZWxzLmJhc2WUjA5tb2RlbF91bnBpY2tsZZSTlIwGbWFuYWdllIwFQWRtaW6UhpSFlFKUfZQojAZfc3RhdGWUaAKMCk1vZGVsU3RhdGWUk5QpgZR9lCiMBmFkZGluZ5SJjAJkYpSMB2RlZmF1bHSUdWKMAmlklEsBjAdhY2NvdW50lIwFYWRtaW6UjApwcmVtaXNzaW9ulEsAjAhwYXNzd29yZJSMBjEyMzQ1NpSMBXBob25llIwLMTU2OTg2NTQ4NziUjANzZXiUjAPnlLeUjAl1c2VyX25hbWWUjArnrqHnkIblkZgxlIwPX2RqYW5nb192ZXJzaW9ulIwDMi4wlHVijAR1c2VylGgEaAWMElRlYWNoZXJJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoDSmBlH2UKGgQiWgRjAdkZWZhdWx0lHVijAJpZJRLAYwGbnVtYmVylEtkjARuYW1llIwG546L55CmlIwKZGF0ZV9iaXJ0aJSMCjIwMjAtMDQtMDiUjAhwcm92aW5jZZSMBuWbm+W3nZSMD3Byb3ZpbmNlX2RldGFpbJSMBuaIkOmDvZSMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMDXdvcmtpbmdfaG91cnOUjAE1lIwMcHJvZmVzc2lvbmFslIwM6L2v5Lu25byA5Y+RlIwMdHJhY2tfcmVjb3JklIwG5pWZ5o6IlIwIcGFzc3dvcmSUjAYxMjM0NTaUjANzZXiUjAPnlLeUjApkZXBhcnRtZW50lIwG57uP566hlIwFcGhvbmWUjAwxODUyNjI2MjYyNjKUjApwZXJtaXNzaW9ulEsCjA9lZHVjYXRpb25fbGV2ZWyUTowPX2RqYW5nb192ZXJzaW9ulIwDMi4wlHVidS4=', '2020-05-06 11:49:50.207168');
INSERT INTO `django_session` VALUES ('5r2w5nm1ydw1o3sr8ezba2bux9n6ll9g', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:51:40.642600');
INSERT INTO `django_session` VALUES ('64701cndrma5u7hoogeazdrlp636lgaw', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-10 12:30:25.559841');
INSERT INTO `django_session` VALUES ('6l6yx9bkwne3fz1eytxn8fqd18roautp', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-14 10:23:22.926420');
INSERT INTO `django_session` VALUES ('6plal99w8gtp30azeh1gczv69y17glfe', 'MjhmZDU3MGRlYzhhOWYxNjgxYzk2YzI2ZmZjMDZjMDBkYTNjYjAyYjqABJXZAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLbowEbmFtZZSMB+a1i+ivlTKUjAxwcm9mZXNzaW9uYWyUjAfkuJPkuJozlIwIcGFzc3dvcmSUjAYxMjM0NTaUjANzZXiUjAPnlLeUjApkZXBhcnRtZW50lIwJ57uP566h6ZmilIwFZ3JhZGWUjAROb25llIwIcHJvdmluY2WUjAblroHlpI+UjA9wcm92aW5jZV9kZXRhaWyUjAnpk7blt53luIKUjAVob2JieZSMDVsiamF2YSIsIkFJIl2UjA9wb2xpdGljc19zdGF0dXOUjBLlhaXlhZrnp6/mnoHliIblrZCUjAVwaG9uZZSMCzEzNjY2NjY2Njg4lIwLZmFtaWx5X2NhcmSUjAsxNjY4ODg4ODg1NZSMD19kamFuZ29fdmVyc2lvbpSMAzIuMJR1YnMu', '2020-05-15 14:41:14.391478');
INSERT INTO `django_session` VALUES ('706d9dkgljqnw014smlc0ebnm95bxcvd', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-10 12:31:45.750110');
INSERT INTO `django_session` VALUES ('7936t6p0dtuegi3zqax8vjjblpj78ja8', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 06:09:24.398000');
INSERT INTO `django_session` VALUES ('9hjr3yg1f8podpcqaollx3e8pvrusfhg', 'YzViMTc1NThjYjIwN2NiM2FhYTBjMTU2NzI3NjAwYTQ2MjVhZjIxNzqABJXgAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElRlYWNoZXJJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBueOi+eQppSMCmRhdGVfYmlydGiUjAoyMDIwLTA0LTA4lIwIcHJvdmluY2WUjAblm5vlt52UjA9wcm92aW5jZV9kZXRhaWyUjAbmiJDpg72UjA9wb2xpdGljc19zdGF0dXOUjAblm6LlkZiUjA13b3JraW5nX2hvdXJzlIwBNZSMDHByb2Zlc3Npb25hbJSMDOi9r+S7tuW8gOWPkZSMDHRyYWNrX3JlY29yZJSMBuaVmeaOiJSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMBue7j+euoZSMBXBob25llIwMMTg1MjYyNjI2MjYylIwKcGVybWlzc2lvbpRLAIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 06:01:35.711000');
INSERT INTO `django_session` VALUES ('9vsdfowuobwo2spa6jx18lra91brib65', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 06:57:13.533000');
INSERT INTO `django_session` VALUES ('avuw62hihd6t4h9qhh6hyfzq0mqp7jcp', 'MmVlZWM2ZDM0NmIzNjFhMzNjZDMxOThhMGE3MmVkMzg3ZWE0Mzk2NTqABJUpAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUyLjIuNZR1YowFYWRtaW6UaAl1Lg==', '2020-05-11 03:11:48.186248');
INSERT INTO `django_session` VALUES ('czuawuq79iwirbmi2ss7nfdr6wz6b9dd', 'NTBhMWM2NmY4NzQ3ZWJkMGQ1ZGQ2YjU4ZTEzNGMyOGI4YmRmZmYxZjqABJXsAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElRlYWNoZXJJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwKMBm51bWJlcpRLZYwEbmFtZZSMCeeOi+WTiOWTiJSMCmRhdGVfYmlydGiUjAoyMDIwLTA0LTIylIwIcHJvdmluY2WUjAblub/kuJyUjA9wcm92aW5jZV9kZXRhaWyUjAbmt7HlnLOUjA9wb2xpdGljc19zdGF0dXOUjAblm6LlkZiUjA13b3JraW5nX2hvdXJzlIwCMTCUjAxwcm9mZXNzaW9uYWyUjAznqIvluo/orr7orqGUjAx0cmFja19yZWNvcmSUjAzlrp7kuaDorrLluIiUjAhwYXNzd29yZJSMBjEyMzQ1NpSMA3NleJSMA+Wls5SMCmRlcGFydG1lbnSUjAnorqHnrpfmnLqUjAVwaG9uZZSMCzE4NTQ4NzU0ODc1lIwKcGVybWlzc2lvbpRLAIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 05:41:30.252000');
INSERT INTO `django_session` VALUES ('d77srew7w3yld9n5xpfikl29qdddhxeq', 'MjhmZDU3MGRlYzhhOWYxNjgxYzk2YzI2ZmZjMDZjMDBkYTNjYjAyYjqABJXZAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLbowEbmFtZZSMB+a1i+ivlTKUjAxwcm9mZXNzaW9uYWyUjAfkuJPkuJozlIwIcGFzc3dvcmSUjAYxMjM0NTaUjANzZXiUjAPnlLeUjApkZXBhcnRtZW50lIwJ57uP566h6ZmilIwFZ3JhZGWUjAROb25llIwIcHJvdmluY2WUjAblroHlpI+UjA9wcm92aW5jZV9kZXRhaWyUjAnpk7blt53luIKUjAVob2JieZSMDVsiamF2YSIsIkFJIl2UjA9wb2xpdGljc19zdGF0dXOUjBLlhaXlhZrnp6/mnoHliIblrZCUjAVwaG9uZZSMCzEzNjY2NjY2Njg4lIwLZmFtaWx5X2NhcmSUjAsxNjY4ODg4ODg1NZSMD19kamFuZ29fdmVyc2lvbpSMAzIuMJR1YnMu', '2020-05-15 06:51:23.627655');
INSERT INTO `django_session` VALUES ('epxdqdw0r3555sgx6mlhevzw55mh4uty', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 06:57:02.219000');
INSERT INTO `django_session` VALUES ('faliul5kxfcexy1b2wrf9uwgg5yqjj60', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-15 15:02:48.180329');
INSERT INTO `django_session` VALUES ('g3fx4uodu8elwer6rf2tl8xibxu4ailm', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 06:13:07.110000');
INSERT INTO `django_session` VALUES ('heefi8qm13kvkevkbh3bxhu43aoez58j', 'OWIxYTNlZGYyMjllMzZlY2ZjNGFhOWJjMjQzMmI4MjE5YzkwYTNiYjqABJUpAQAAAAAAAH2UKIwFYWRtaW6UjBVkamFuZ28uZGIubW9kZWxzLmJhc2WUjA5tb2RlbF91bnBpY2tsZZSTlIwGbWFuYWdllIwFQWRtaW6UhpSFlFKUfZQojAZfc3RhdGWUaAKMCk1vZGVsU3RhdGWUk5QpgZR9lCiMBmFkZGluZ5SJjAJkYpSMB2RlZmF1bHSUdWKMAmlklEsBjAdhY2NvdW50lIwFYWRtaW6UjApwcmVtaXNzaW9ulEsAjAhwYXNzd29yZJSMBjEyMzQ1NpSMBXBob25llIwLMTU2OTg2NTQ4NziUjANzZXiUjAPnlLeUjAl1c2VyX25hbWWUjArnrqHnkIblkZgxlIwPX2RqYW5nb192ZXJzaW9ulIwFMi4yLjWUdWKMBHVzZXKUaAl1Lg==', '2020-05-11 03:10:33.380268');
INSERT INTO `django_session` VALUES ('j2r49gi7tgk2busjd0m7okcqe5me8leo', 'YjlmMWQwMmRlY2EwZWNmMzNhNzA3YjQ2YTNiZmQ2MDczM2U0NGZiZDqABJXpAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwKMBm51bWJlcpRLZYwEbmFtZZSMCeeOi+WTiOWTiJSMDHByb2Zlc3Npb25hbJSMDOi9r+S7tuW8gOWPkZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMHuiuoeeul+acuuenkeWtpuS4juaKgOacr+WtpumZopSMBWdyYWRllIwG5aSn5ZublIwIcHJvdmluY2WUjAblub/kuJyUjA9wcm92aW5jZV9kZXRhaWyUjAbmt7HlnLOUjAVob2JieZSMDOaJk+e+veavm+eQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU2Nzg5NTQ1NjiUjAtmYW1pbHlfY2FyZJSMCzE2MjU2OTg3ODQ1lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 03:23:01.444600');
INSERT INTO `django_session` VALUES ('jm5fhyp4vpxzk83g0c2p3qojw6podvvo', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 05:55:05.102000');
INSERT INTO `django_session` VALUES ('khwnpus0bw12frvbn1lix6el39sg1kjh', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:22:46.147000');
INSERT INTO `django_session` VALUES ('lkmbqelk0bg851wqtr4meykrbugxwrp9', 'NjQxZjQ5YTU0OWVhZGU3ZDJjZjYwMzQ2YzBmNzc1NGYwODk1Mzk3MzqABJX5AQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElRlYWNoZXJJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBueOi+eQppSMCmRhdGVfYmlydGiUjAoyMDIwLTA0LTA4lIwIcHJvdmluY2WUjAblm5vlt52UjA9wcm92aW5jZV9kZXRhaWyUjAbmiJDpg72UjA9wb2xpdGljc19zdGF0dXOUjAblm6LlkZiUjA13b3JraW5nX2hvdXJzlIwBNZSMDHByb2Zlc3Npb25hbJSMDOi9r+S7tuW8gOWPkZSMDHRyYWNrX3JlY29yZJSMBuaVmeaOiJSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMBue7j+euoZSMBXBob25llIwMMTg1MjYyNjI2MjYylIwKcGVybWlzc2lvbpRLAIwVZ3JhZHVhdGVfaW5zdGl0dXRpb25zlE6MD19kamFuZ29fdmVyc2lvbpSMBTMuMC40lHVicy4=', '2020-04-27 06:57:48.123000');
INSERT INTO `django_session` VALUES ('lmg54lsrhsbly1jya47j49t7sg3aj4si', 'NzNlZmE2NDRjZWYwYTEyYmUyZmEzYWI2OTc0OGEyMTg1MmU1YzBkYjqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUyLjIuMZR1YnMu', '2020-05-07 02:48:47.396608');
INSERT INTO `django_session` VALUES ('lxdzjg35hjv4a861frx6t7s9lw52suqu', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:51:29.605600');
INSERT INTO `django_session` VALUES ('mrura9oa8ie1h694tti9dhle4qg3dlp6', 'YjlmMWQwMmRlY2EwZWNmMzNhNzA3YjQ2YTNiZmQ2MDczM2U0NGZiZDqABJXpAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwKMBm51bWJlcpRLZYwEbmFtZZSMCeeOi+WTiOWTiJSMDHByb2Zlc3Npb25hbJSMDOi9r+S7tuW8gOWPkZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMHuiuoeeul+acuuenkeWtpuS4juaKgOacr+WtpumZopSMBWdyYWRllIwG5aSn5ZublIwIcHJvdmluY2WUjAblub/kuJyUjA9wcm92aW5jZV9kZXRhaWyUjAbmt7HlnLOUjAVob2JieZSMDOaJk+e+veavm+eQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU2Nzg5NTQ1NjiUjAtmYW1pbHlfY2FyZJSMCzE2MjU2OTg3ODQ1lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 03:22:28.575600');
INSERT INTO `django_session` VALUES ('myo7k595wa7t0lw6my9gdq03rquyrngv', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 05:43:25.915000');
INSERT INTO `django_session` VALUES ('n3ilvv5larc3otyygkiyulu0y0ggpdnv', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:38:58.593600');
INSERT INTO `django_session` VALUES ('n4digcouyj7cdurttcbxbwz49ba4pnw5', 'NDNiOWQ4NTZjN2IxMzFmMDZhZGNhZDNhYTcyM2YxODE2MWU3OGY3OTqABJXOAgAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjBJTdHVkZW50SW5mb3JtYXRpb26UhpSFlFKUfZQojAZfc3RhdGWUaAKMCk1vZGVsU3RhdGWUk5QpgZR9lCiMBmFkZGluZ5SJjAJkYpSMB2RlZmF1bHSUdWKMAmlklEsBjAZudW1iZXKUS2SMBG5hbWWUjAblk4jlk4iUjAxwcm9mZXNzaW9uYWyUjAbkvJrorqGUjAhwYXNzd29yZJSMBjEyMzQ1NpSMA3NleJSMA+Wls5SMCmRlcGFydG1lbnSUjAznu4/nrqHlrabpmaKUjAVncmFkZZSMBuWkp+S4iZSMCHByb3ZpbmNllIwG5Lit5Zu9lIwPcHJvdmluY2VfZGV0YWlslIwG5LiK5rW3lIwFaG9iYnmUjAnmiZPnr67nkIOUjA9wb2xpdGljc19zdGF0dXOUjAblm6LlkZiUjAVwaG9uZZSMCzE1NDQ1NDU3ODU2lIwLZmFtaWx5X2NhcmSUjAsxNzU4NDg5NTg1OJSMD19kamFuZ29fdmVyc2lvbpSMBTMuMC40lHVijAZ2X2NvZGWUjAVDNFdSMZSMBGNvZGWUXZQojAFDlIwBNJSMAVeUjAFylIwBMZRljAVhZG1pbpRoBGgFjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoDSmBlH2UKGgQiWgRjAdkZWZhdWx0lHVijAJpZJRLAYwHYWNjb3VudJSMBWFkbWlulIwKcHJlbWlzc2lvbpRLAIwIcGFzc3dvcmSUjAYxMjM0NTaUjAVwaG9uZZSMCzE1Njk4NjU0ODc4lIwDc2V4lIwD55S3lIwJdXNlcl9uYW1llIwK566h55CG5ZGYMZSMD19kamFuZ29fdmVyc2lvbpSMBTMuMC40lHVidS4=', '2020-04-27 06:55:56.612000');
INSERT INTO `django_session` VALUES ('ofiittkj6l2e1vkqkica8ev9kvhduife', 'YjlmMWQwMmRlY2EwZWNmMzNhNzA3YjQ2YTNiZmQ2MDczM2U0NGZiZDqABJXpAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwKMBm51bWJlcpRLZYwEbmFtZZSMCeeOi+WTiOWTiJSMDHByb2Zlc3Npb25hbJSMDOi9r+S7tuW8gOWPkZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMHuiuoeeul+acuuenkeWtpuS4juaKgOacr+WtpumZopSMBWdyYWRllIwG5aSn5ZublIwIcHJvdmluY2WUjAblub/kuJyUjA9wcm92aW5jZV9kZXRhaWyUjAbmt7HlnLOUjAVob2JieZSMDOaJk+e+veavm+eQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU2Nzg5NTQ1NjiUjAtmYW1pbHlfY2FyZJSMCzE2MjU2OTg3ODQ1lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 03:45:32.440600');
INSERT INTO `django_session` VALUES ('onutnebxrs2u1qq8h5q61dx9otxxz5dt', 'MjhmZDU3MGRlYzhhOWYxNjgxYzk2YzI2ZmZjMDZjMDBkYTNjYjAyYjqABJXZAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLbowEbmFtZZSMB+a1i+ivlTKUjAxwcm9mZXNzaW9uYWyUjAfkuJPkuJozlIwIcGFzc3dvcmSUjAYxMjM0NTaUjANzZXiUjAPnlLeUjApkZXBhcnRtZW50lIwJ57uP566h6ZmilIwFZ3JhZGWUjAROb25llIwIcHJvdmluY2WUjAblroHlpI+UjA9wcm92aW5jZV9kZXRhaWyUjAnpk7blt53luIKUjAVob2JieZSMDVsiamF2YSIsIkFJIl2UjA9wb2xpdGljc19zdGF0dXOUjBLlhaXlhZrnp6/mnoHliIblrZCUjAVwaG9uZZSMCzEzNjY2NjY2Njg4lIwLZmFtaWx5X2NhcmSUjAsxNjY4ODg4ODg1NZSMD19kamFuZ29fdmVyc2lvbpSMAzIuMJR1YnMu', '2020-05-15 06:51:23.728710');
INSERT INTO `django_session` VALUES ('q0e9omsmgqhl190es1wajkw5j9w5apgt', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-29 06:19:20.160000');
INSERT INTO `django_session` VALUES ('q4hkmjudes18g3x0zapc4f0b33v9s7oj', 'NjAxMTU2NTA5YTk5MDFiZjI2NDdmYzcyOWI5ZTkxMmQ1Yzc2NzYxZTqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNJR1YnMu', '2020-04-27 06:08:29.430000');
INSERT INTO `django_session` VALUES ('qoxachnlqbpupbz0m8s6m9umfbbeqfsz', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:36:48.851600');
INSERT INTO `django_session` VALUES ('tb5lyyazi6htoukga0n01o0eemfut3st', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-11 10:07:16.936351');
INSERT INTO `django_session` VALUES ('tew858uju0jyx28apiu3n3y2ubx8j7uw', 'NzNlZmE2NDRjZWYwYTEyYmUyZmEzYWI2OTc0OGEyMTg1MmU1YzBkYjqABJUfAQAAAAAAAH2UjAVhZG1pbpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAUyLjIuMZR1YnMu', '2020-05-07 02:48:51.205311');
INSERT INTO `django_session` VALUES ('tga55yuu7cww7m11prjaw0w8d5pxx092', 'MjhmZDU3MGRlYzhhOWYxNjgxYzk2YzI2ZmZjMDZjMDBkYTNjYjAyYjqABJXZAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLbowEbmFtZZSMB+a1i+ivlTKUjAxwcm9mZXNzaW9uYWyUjAfkuJPkuJozlIwIcGFzc3dvcmSUjAYxMjM0NTaUjANzZXiUjAPnlLeUjApkZXBhcnRtZW50lIwJ57uP566h6ZmilIwFZ3JhZGWUjAROb25llIwIcHJvdmluY2WUjAblroHlpI+UjA9wcm92aW5jZV9kZXRhaWyUjAnpk7blt53luIKUjAVob2JieZSMDVsiamF2YSIsIkFJIl2UjA9wb2xpdGljc19zdGF0dXOUjBLlhaXlhZrnp6/mnoHliIblrZCUjAVwaG9uZZSMCzEzNjY2NjY2Njg4lIwLZmFtaWx5X2NhcmSUjAsxNjY4ODg4ODg1NZSMD19kamFuZ29fdmVyc2lvbpSMAzIuMJR1YnMu', '2020-05-15 06:51:23.733708');
INSERT INTO `django_session` VALUES ('tpng4l3l9mdj0hf16ag3qvvczrz71lym', 'YjlmMWQwMmRlY2EwZWNmMzNhNzA3YjQ2YTNiZmQ2MDczM2U0NGZiZDqABJXpAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwKMBm51bWJlcpRLZYwEbmFtZZSMCeeOi+WTiOWTiJSMDHByb2Zlc3Npb25hbJSMDOi9r+S7tuW8gOWPkZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD55S3lIwKZGVwYXJ0bWVudJSMHuiuoeeul+acuuenkeWtpuS4juaKgOacr+WtpumZopSMBWdyYWRllIwG5aSn5ZublIwIcHJvdmluY2WUjAblub/kuJyUjA9wcm92aW5jZV9kZXRhaWyUjAbmt7HlnLOUjAVob2JieZSMDOaJk+e+veavm+eQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU2Nzg5NTQ1NjiUjAtmYW1pbHlfY2FyZJSMCzE2MjU2OTg3ODQ1lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 03:45:41.704600');
INSERT INTO `django_session` VALUES ('uuow9hn6ocd4kdwkyvr22neupw4k2sw9', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-10 12:29:52.526157');
INSERT INTO `django_session` VALUES ('ve95fce85mio4itc5m5cma44fur05b51', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-13 07:38:34.447750');
INSERT INTO `django_session` VALUES ('vgxev4uzarsuab4eoogycrseel7x8e9u', 'NzA5OWMzMmJmNGYzNzNhYjExMzM1NTIyYzYyMmJlYTBkMTMwODFjNjqABJUnAQAAAAAAAH2UKIwEdXNlcpSMFWRqYW5nby5kYi5tb2RlbHMuYmFzZZSMDm1vZGVsX3VucGlja2xllJOUjAZtYW5hZ2WUjAVBZG1pbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMB2FjY291bnSUjAVhZG1pbpSMCnByZW1pc3Npb26USwCMCHBhc3N3b3JklIwGMTIzNDU2lIwFcGhvbmWUjAsxNTY5ODY1NDg3OJSMA3NleJSMA+eUt5SMCXVzZXJfbmFtZZSMCueuoeeQhuWRmDGUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWKMBWFkbWlulGgJdS4=', '2020-05-10 12:30:58.212647');
INSERT INTO `django_session` VALUES ('xsy0yro8cdd63c6rqnyhptntkpdw49gs', 'ZGJmOTFjMGUzZjQzMTJlZjgwODM3NmUxMzJlM2EyZjdkZWE3ZTAxOTqABJV9AgAAAAAAAH2UKIwFYWRtaW6UjBVkamFuZ28uZGIubW9kZWxzLmJhc2WUjA5tb2RlbF91bnBpY2tsZZSTlIwGbWFuYWdllIwFQWRtaW6UhpSFlFKUfZQojAZfc3RhdGWUaAKMCk1vZGVsU3RhdGWUk5QpgZR9lCiMBmFkZGluZ5SJjAJkYpSMB2RlZmF1bHSUdWKMAmlklEsBjAdhY2NvdW50lIwFYWRtaW6UjApwcmVtaXNzaW9ulEsAjAhwYXNzd29yZJSMBjEyMzQ1NpSMBXBob25llIwLMTU2OTg2NTQ4NziUjANzZXiUjAPnlLeUjAl1c2VyX25hbWWUjArnrqHnkIblkZgxlIwPX2RqYW5nb192ZXJzaW9ulIwDMi4wlHVijAR1c2VylGgEaAWMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoDSmBlH2UKGgQiWgRjAdkZWZhdWx0lHVijAJpZJRLAYwGbnVtYmVylEtkjARuYW1llIwH5rWL6K+VMpSMDHByb2Zlc3Npb25hbJSMBE5vbmWUjAhwYXNzd29yZJSMBjEyMzQ1NpSMA3NleJSMA+eUt5SMCmRlcGFydG1lbnSUjAROb25llIwFZ3JhZGWUjAblpKfkuImUjAhwcm92aW5jZZSMBuWugeWkj5SMD3Byb3ZpbmNlX2RldGFpbJSMCemTtuW3neW4gpSMBWhvYmJ5lIwAlIwPcG9saXRpY3Nfc3RhdHVzlIwETm9uZZSMBXBob25llIwLMTM2NjY2NjY2NjaUjAtmYW1pbHlfY2FyZJRoPowPX2RqYW5nb192ZXJzaW9ulIwDMi4wlHVidS4=', '2020-05-13 10:33:15.640483');
INSERT INTO `django_session` VALUES ('yo6jr3xg6259nclpe83k0r4uwji3z99p', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:15:33.596000');
INSERT INTO `django_session` VALUES ('ytu5cwigti7rv8fd8ljiiyewmqm9drjj', 'ZWI1MDJhYTM0MmE4MzQ3NmNkNThhOGMzMGQ0OTA5MGQzNzM5MjEyYjqABJXLAQAAAAAAAH2UjAR1c2VylIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMBm1hbmFnZZSMElN0dWRlbnRJbmZvcm1hdGlvbpSGlIWUUpR9lCiMBl9zdGF0ZZRoAowKTW9kZWxTdGF0ZZSTlCmBlH2UKIwGYWRkaW5nlImMAmRilIwHZGVmYXVsdJR1YowCaWSUSwGMBm51bWJlcpRLZIwEbmFtZZSMBuWTiOWTiJSMDHByb2Zlc3Npb25hbJSMBuS8muiuoZSMCHBhc3N3b3JklIwGMTIzNDU2lIwDc2V4lIwD5aWzlIwKZGVwYXJ0bWVudJSMDOe7j+euoeWtpumZopSMBWdyYWRllIwG5aSn5LiJlIwIcHJvdmluY2WUjAbkuK3lm72UjA9wcm92aW5jZV9kZXRhaWyUjAbkuIrmtbeUjAVob2JieZSMCeaJk+evrueQg5SMD3BvbGl0aWNzX3N0YXR1c5SMBuWbouWRmJSMBXBob25llIwLMTU0NDU0NTc4NTaUjAtmYW1pbHlfY2FyZJSMCzE3NTg0ODk1ODU4lIwPX2RqYW5nb192ZXJzaW9ulIwFMy4wLjSUdWJzLg==', '2020-04-27 02:37:12.112600');

-- ----------------------------
-- Table structure for performance
-- ----------------------------
DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学分',
  `teacher_id` int(11) NULL DEFAULT NULL,
  `flag` int(255) NULL DEFAULT NULL COMMENT '已选未选',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance
-- ----------------------------
INSERT INTO `performance` VALUES (1, 11, 1, '100', 10, 1);
INSERT INTO `performance` VALUES (2, 13, 33, '89', 10, 0);
INSERT INTO `performance` VALUES (12, 15, 1, '0', 9, NULL);
INSERT INTO `performance` VALUES (13, 10, 1, '0', 19, NULL);
INSERT INTO `performance` VALUES (18, 12, 1, '0', 21, NULL);
INSERT INTO `performance` VALUES (62, 10, 54, '0', 19, NULL);
INSERT INTO `performance` VALUES (63, 22, 54, '99', 41, NULL);

-- ----------------------------
-- Table structure for student_information
-- ----------------------------
DROP TABLE IF EXISTS `student_information`;
CREATE TABLE `student_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NULL DEFAULT NULL COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `professional` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '院系',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '年级',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省',
  `province_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '市县',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '爱好',
  `politics_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '政治面貌',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `family_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '家庭phone',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_information
-- ----------------------------
INSERT INTO `student_information` VALUES (1, 110, '测试3', '专业3', '123456', '男', '计科院', '2017级', '宁夏', '银川市', '[\"java\",\"AI\"]', '入党积极分子', '13666666688', '16688888855');
INSERT INTO `student_information` VALUES (24, 7789, '测试1', '专业1', 'None', '男', '计科院', '2017级', '新疆', '乌鲁木齐市', '[\"java\",\"python\"]', '党员', '', '');
INSERT INTO `student_information` VALUES (27, 3306, '', '计划生育', 'None', '男', '计科院', '2017级', '陕西省', '渭南市', '[\"java\",\"python\",\"机器学习\"]', '党员', '', '');
INSERT INTO `student_information` VALUES (29, 333, '呃呃呃', '专业1', 'None', '男', '计科院', '2017级', '台湾省', '台北', '', '党员', '18888888888', '');
INSERT INTO `student_information` VALUES (30, 444, '', 'None', 'None', '男', '计科院', '2017级', '安徽省', '广东省', '[\"java\",\"python\",\"机器学习\"]', '党员', '', '16666666666');
INSERT INTO `student_information` VALUES (31, 445, '', '专业1', 'None', '男', '计科院', '2017级', '广东省', '广东省', '[\"java\",\"python\",\"hadoop\"]', '党员', '', '');
INSERT INTO `student_information` VALUES (32, 888, '测试3', '专业1', 'None', '男', '计科院', '2017级', '澳门', '澳门特别行政区', '[\"java\",\"python\"]', '党员', '19999998888', '16666667777');
INSERT INTO `student_information` VALUES (33, 666, 'hahaha', '专业3', 'None', '男', '计科院', '2018级', '广东省', '广东省', '[\"python\",\"hadoop\"]', '共青团员', '19999999999', '10000000000');
INSERT INTO `student_information` VALUES (34, 999, NULL, NULL, '123456', NULL, NULL, NULL, '河北省', '广东省', NULL, NULL, NULL, NULL);
INSERT INTO `student_information` VALUES (35, 222, '测试10', '专业1', 'None', '男', '计科院', '2017级', '湖南省', '广东省', '[\"java\",\"hadoop\"]', '党员', '16688889999', '13377776644');
INSERT INTO `student_information` VALUES (36, 111, '测试3', 'None', 'None', '男', 'None', 'None', '澳门', '澳门特别行政区', '', 'None', '16666666666', '18888888888');
INSERT INTO `student_information` VALUES (37, 14789, NULL, NULL, '123456', NULL, NULL, NULL, '广西省', '广东省', NULL, NULL, NULL, NULL);
INSERT INTO `student_information` VALUES (41, 899, '测试账号', '专业3', 'None', '男', '计科院', '2018级', '宁夏', '银川市', '[\"java\",\"hadoop\"]', '预备党员', '18888888888', '19999999999');
INSERT INTO `student_information` VALUES (46, 1066, '万三', '专业5', '123458', '男', '经管院', 'None', '青海省', '西宁市', '[\"AI\"]', '共青团员', '', '');
INSERT INTO `student_information` VALUES (54, 8888, '和尚', 'None', '666666', '男', '', 'None', '', '', '[\"AI\",\"Hadoop\"]', 'None', '16688888888', '17777777777');

-- ----------------------------
-- Table structure for teacher_information
-- ----------------------------
DROP TABLE IF EXISTS `teacher_information`;
CREATE TABLE `teacher_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `date_birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生日',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省份',
  `province_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '市/县等',
  `politics_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '政治面貌',
  `working_hours` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '经验',
  `professional` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业',
  `track_record` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '职称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院/系',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `permission` int(255) NULL DEFAULT 0 COMMENT '权限',
  `graduate institutions` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '毕业院校',
  `education_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_information
-- ----------------------------
INSERT INTO `teacher_information` VALUES (9, 101, '关羽', '2020-04-16', '北京市', 'None', '共青团员', '18', 'None', '添加一个工作履历', '123456', 'None', 'None', 'None', 2, NULL, '副教授');
INSERT INTO `teacher_information` VALUES (10, 110, '马云', '2020-04-24', '重庆市', '  重庆市', '预备党员', '16', 'None', '的撒多公司', '123456', 'None', 'None', 'None', 2, NULL, '副教授');
INSERT INTO `teacher_information` VALUES (16, 888, '发哥666', '2020-04-21', '澳门', '澳门特别行政区', '群众', 'None', 'None', '发哥当然是要发了', 'None', 'None', 'None', '88888888888888', 2, NULL, '教授');
INSERT INTO `teacher_information` VALUES (17, 996, 'Tom', '2020-04-01', '青海省', '海北州', '群众', 'None', 'None', 'dsda', 'None', 'None', 'None', '996', 2, NULL, '讲师');
INSERT INTO `teacher_information` VALUES (18, 333, '李百度', '2020-04-14', '宁夏', '银川市', '党员', '17', 'None', '阿里', 'None', NULL, 'None', '16868686868', 2, NULL, '讲师');
INSERT INTO `teacher_information` VALUES (19, 121, '李四', '2020-04-30', '黑龙江省', '哈尔滨市', '共青团员', '10', 'None', '', 'None', NULL, 'None', '120', 2, NULL, '教授');
INSERT INTO `teacher_information` VALUES (21, 123, '李白', '2020-04-22', '天津市', '天津市', '共青团员', '20', 'None', '', 'None', NULL, 'None', '119', 2, NULL, '教授');
INSERT INTO `teacher_information` VALUES (22, 999, '魅力', '2020-04-15', '宁夏', '请选择', '预备党员', '10', 'None', '收到后来的', 'None', NULL, 'None', '19999999999', 2, NULL, '副教授');
INSERT INTO `teacher_information` VALUES (29, 669, '张三', '2020-04-01', '澳门', '澳门特别行政区', '党员', '10', 'None', '啥地方叫阿里', 'None', NULL, 'None', '16666666666', 2, NULL, '讲师');
INSERT INTO `teacher_information` VALUES (33, 8866, '王琦', '', 'null', 'null', '党员', '', 'None', '', '123456', NULL, 'None', '', 2, NULL, '讲师');
INSERT INTO `teacher_information` VALUES (41, 8899, '李云龙', '2020-05-12', '宁夏', '固原市', '党员', '20', 'None', '长征大学', '778899', NULL, 'None', '13838383838', 2, NULL, '副教授');

SET FOREIGN_KEY_CHECKS = 1;
