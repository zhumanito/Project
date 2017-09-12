/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : cooking

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-12 21:48:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cook_admin
-- ----------------------------
DROP TABLE IF EXISTS `cook_admin`;
CREATE TABLE `cook_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '角色id',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `lastlogintime` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `lastloginip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Records of cook_admin
-- ----------------------------

-- ----------------------------
-- Table structure for cook_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `cook_admin_menu`;
CREATE TABLE `cook_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float unsigned NOT NULL DEFAULT '10000' COMMENT '排序ID',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parent_id`),
  KEY `model` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cook_admin_menu
-- ----------------------------
INSERT INTO `cook_admin_menu` VALUES ('1', '0', '0', '1', '20', 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理');
INSERT INTO `cook_admin_menu` VALUES ('5', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cook_admin_menu` VALUES ('6', '5', '1', '1', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cook_admin_menu` VALUES ('13', '6', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `cook_admin_menu` VALUES ('14', '5', '1', '1', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `cook_admin_menu` VALUES ('19', '5', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cook_admin_menu` VALUES ('20', '19', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cook_admin_menu` VALUES ('21', '19', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cook_admin_menu` VALUES ('22', '19', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cook_admin_menu` VALUES ('23', '19', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cook_admin_menu` VALUES ('24', '19', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cook_admin_menu` VALUES ('25', '19', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cook_admin_menu` VALUES ('26', '19', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cook_admin_menu` VALUES ('27', '19', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cook_admin_menu` VALUES ('28', '5', '1', '1', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `cook_admin_menu` VALUES ('29', '28', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `cook_admin_menu` VALUES ('30', '28', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `cook_admin_menu` VALUES ('31', '28', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `cook_admin_menu` VALUES ('32', '28', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `cook_admin_menu` VALUES ('33', '28', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `cook_admin_menu` VALUES ('34', '28', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `cook_admin_menu` VALUES ('35', '34', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `cook_admin_menu` VALUES ('36', '34', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `cook_admin_menu` VALUES ('37', '34', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `cook_admin_menu` VALUES ('38', '34', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `cook_admin_menu` VALUES ('39', '34', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `cook_admin_menu` VALUES ('40', '34', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `cook_admin_menu` VALUES ('41', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cook_admin_menu` VALUES ('43', '41', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `cook_admin_menu` VALUES ('44', '41', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cook_admin_menu` VALUES ('46', '41', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cook_admin_menu` VALUES ('47', '41', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cook_admin_menu` VALUES ('48', '108', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cook_admin_menu` VALUES ('49', '48', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cook_admin_menu` VALUES ('50', '49', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cook_admin_menu` VALUES ('51', '49', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cook_admin_menu` VALUES ('52', '49', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cook_admin_menu` VALUES ('53', '49', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cook_admin_menu` VALUES ('54', '49', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cook_admin_menu` VALUES ('55', '49', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cook_admin_menu` VALUES ('56', '49', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cook_admin_menu` VALUES ('57', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cook_admin_menu` VALUES ('58', '57', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cook_admin_menu` VALUES ('59', '57', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cook_admin_menu` VALUES ('60', '5', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `cook_admin_menu` VALUES ('61', '60', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `cook_admin_menu` VALUES ('62', '60', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `cook_admin_menu` VALUES ('63', '60', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `cook_admin_menu` VALUES ('64', '60', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `cook_admin_menu` VALUES ('65', '60', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `cook_admin_menu` VALUES ('66', '60', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `cook_admin_menu` VALUES ('67', '60', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `cook_admin_menu` VALUES ('68', '60', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `cook_admin_menu` VALUES ('69', '60', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `cook_admin_menu` VALUES ('70', '5', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cook_admin_menu` VALUES ('71', '70', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cook_admin_menu` VALUES ('72', '5', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cook_admin_menu` VALUES ('73', '72', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cook_admin_menu` VALUES ('74', '5', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cook_admin_menu` VALUES ('75', '74', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cook_admin_menu` VALUES ('76', '5', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cook_admin_menu` VALUES ('77', '5', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `cook_admin_menu` VALUES ('78', '77', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cook_admin_menu` VALUES ('79', '77', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cook_admin_menu` VALUES ('80', '77', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cook_admin_menu` VALUES ('81', '77', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cook_admin_menu` VALUES ('82', '77', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cook_admin_menu` VALUES ('83', '77', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cook_admin_menu` VALUES ('84', '83', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cook_admin_menu` VALUES ('85', '83', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cook_admin_menu` VALUES ('86', '83', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cook_admin_menu` VALUES ('87', '83', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cook_admin_menu` VALUES ('88', '83', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cook_admin_menu` VALUES ('89', '83', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cook_admin_menu` VALUES ('90', '83', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cook_admin_menu` VALUES ('91', '83', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cook_admin_menu` VALUES ('92', '5', '1', '1', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cook_admin_menu` VALUES ('93', '92', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `cook_admin_menu` VALUES ('94', '5', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `cook_admin_menu` VALUES ('95', '94', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `cook_admin_menu` VALUES ('96', '94', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `cook_admin_menu` VALUES ('97', '94', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `cook_admin_menu` VALUES ('98', '94', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `cook_admin_menu` VALUES ('99', '94', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `cook_admin_menu` VALUES ('100', '94', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `cook_admin_menu` VALUES ('101', '94', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `cook_admin_menu` VALUES ('102', '94', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `cook_admin_menu` VALUES ('103', '94', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `cook_admin_menu` VALUES ('104', '94', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `cook_admin_menu` VALUES ('105', '94', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `cook_admin_menu` VALUES ('106', '94', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `cook_admin_menu` VALUES ('107', '94', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `cook_admin_menu` VALUES ('108', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cook_admin_menu` VALUES ('109', '48', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cook_admin_menu` VALUES ('110', '109', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cook_admin_menu` VALUES ('111', '109', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cook_admin_menu` VALUES ('112', '109', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cook_admin_menu` VALUES ('113', '109', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cook_admin_menu` VALUES ('114', '109', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cook_admin_menu` VALUES ('115', '109', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cook_admin_menu` VALUES ('116', '109', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cook_admin_menu` VALUES ('117', '109', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cook_admin_menu` VALUES ('118', '109', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cook_admin_menu` VALUES ('119', '0', '0', '1', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `cook_admin_menu` VALUES ('120', '119', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `cook_admin_menu` VALUES ('121', '120', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `cook_admin_menu` VALUES ('122', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `cook_admin_menu` VALUES ('123', '120', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `cook_admin_menu` VALUES ('124', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `cook_admin_menu` VALUES ('125', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `cook_admin_menu` VALUES ('126', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `cook_admin_menu` VALUES ('127', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `cook_admin_menu` VALUES ('128', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `cook_admin_menu` VALUES ('129', '120', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `cook_admin_menu` VALUES ('130', '119', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `cook_admin_menu` VALUES ('131', '130', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `cook_admin_menu` VALUES ('132', '130', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `cook_admin_menu` VALUES ('133', '130', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `cook_admin_menu` VALUES ('134', '130', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `cook_admin_menu` VALUES ('135', '130', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `cook_admin_menu` VALUES ('136', '130', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `cook_admin_menu` VALUES ('137', '130', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `cook_admin_menu` VALUES ('138', '119', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cook_admin_menu` VALUES ('139', '138', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cook_admin_menu` VALUES ('140', '138', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cook_admin_menu` VALUES ('141', '138', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cook_admin_menu` VALUES ('142', '138', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cook_admin_menu` VALUES ('143', '138', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cook_admin_menu` VALUES ('144', '119', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `cook_admin_menu` VALUES ('145', '144', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `cook_admin_menu` VALUES ('146', '144', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `cook_admin_menu` VALUES ('147', '144', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cook_admin_menu` VALUES ('148', '144', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `cook_admin_menu` VALUES ('149', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `cook_admin_menu` VALUES ('150', '149', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `cook_admin_menu` VALUES ('151', '108', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cook_admin_menu` VALUES ('152', '151', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '用户列表', '', '本站用户');
INSERT INTO `cook_admin_menu` VALUES ('153', '152', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `cook_admin_menu` VALUES ('154', '152', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cook_admin_menu` VALUES ('155', '151', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `cook_admin_menu` VALUES ('157', '0', '1', '1', '10000', 'admin', 'Cookmenu', 'index', '', '菜谱管理', '', '');
INSERT INTO `cook_admin_menu` VALUES ('158', '157', '1', '1', '10000', 'admin', 'Cookmenu', 'show', '', '在线菜谱', '', '在线菜谱是菜谱管理的子菜单');
INSERT INTO `cook_admin_menu` VALUES ('159', '157', '1', '1', '10000', 'admin', 'Cookmenu', 'publish', '', '发布菜谱', '', '发布菜谱是菜单管理中的子菜单');
INSERT INTO `cook_admin_menu` VALUES ('160', '0', '1', '1', '10000', 'admin', 'Cookuser', 'default', '', '用户管理', '', '');
INSERT INTO `cook_admin_menu` VALUES ('161', '160', '1', '1', '10000', 'admin', 'Cookusers', 'showlist', '', '用户列表', '', '用户列表是用户管理的子菜单');
INSERT INTO `cook_admin_menu` VALUES ('162', '160', '1', '1', '10000', 'admin', 'Cookusers', 'detail', '', '用户详情', '', '用户详情是用户管理的子菜单');
INSERT INTO `cook_admin_menu` VALUES ('163', '0', '1', '1', '10000', 'admin', 'Menuoperation', 'index', '', '烹饪管理', '', '');
INSERT INTO `cook_admin_menu` VALUES ('164', '163', '1', '1', '10000', 'admin', 'Menuoperation', 'order', '', '预约中烹饪', '', '预约中烹饪是烹饪管理的子菜单');
INSERT INTO `cook_admin_menu` VALUES ('165', '163', '1', '1', '10000', 'admin', 'Menuoperation', 'practice', '', '实施中烹饪', '', '实施中烹饪是烹饪管理的子菜单');
INSERT INTO `cook_admin_menu` VALUES ('166', '163', '1', '1', '10000', 'admin', 'Menuoperation', 'complete', '', '已完成烹饪', '', '已完成烹饪是烹饪管理的子菜单');

-- ----------------------------
-- Table structure for cook_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `cook_admin_node`;
CREATE TABLE `cook_admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(100) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(100) NOT NULL DEFAULT '' COMMENT '方法',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '节点名称',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `params` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限节点表';

-- ----------------------------
-- Records of cook_admin_node
-- ----------------------------

-- ----------------------------
-- Table structure for cook_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `cook_admin_role`;
CREATE TABLE `cook_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `rolename` varchar(30) NOT NULL COMMENT '角色名称',
  `roledesc` varchar(255) NOT NULL COMMENT '角色描述',
  `nodelist` text NOT NULL COMMENT '权限列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cook_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for cook_asset
-- ----------------------------
DROP TABLE IF EXISTS `cook_asset`;
CREATE TABLE `cook_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of cook_asset
-- ----------------------------
INSERT INTO `cook_asset` VALUES ('1', '1', '125881', '1503392652', '1', '0', 'fe74bb4ec8cf2db359d3ccd3a20934f882adb4595443627bc247b80898013c43', '1.jpg', 'admin/20170822/280889133d7e2d681a93ad017b5b758f.jpg', 'fe74bb4ec8cf2db359d3ccd3a20934f8', '03e95e8c0d2983e8f9423eef21f057dcf6eb392b', 'jpg', null);

-- ----------------------------
-- Table structure for cook_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cook_auth_access`;
CREATE TABLE `cook_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cook_auth_access
-- ----------------------------
INSERT INTO `cook_auth_access` VALUES ('1', '2', 'admin/cookmenu/index', 'admin_url');
INSERT INTO `cook_auth_access` VALUES ('2', '2', 'admin/cookmenu/show', 'admin_url');
INSERT INTO `cook_auth_access` VALUES ('3', '2', 'admin/cookmenu/publish', 'admin_url');

-- ----------------------------
-- Table structure for cook_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cook_auth_rule`;
CREATE TABLE `cook_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of cook_auth_rule
-- ----------------------------
INSERT INTO `cook_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cook_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cook_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cook_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cook_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cook_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cook_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cook_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cook_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cook_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cook_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cook_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cook_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cook_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cook_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cook_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cook_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cook_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cook_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cook_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cook_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cook_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cook_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cook_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', '');
INSERT INTO `cook_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cook_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cook_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `cook_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cook_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cook_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cook_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cook_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cook_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cook_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cook_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cook_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cook_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cook_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cook_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cook_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cook_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cook_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cook_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cook_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cook_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cook_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cook_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cook_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cook_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cook_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cook_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cook_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cook_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cook_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cook_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cook_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cook_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cook_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cook_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cook_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cook_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `cook_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cook_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cook_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cook_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cook_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cook_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cook_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cook_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cook_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cook_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cook_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cook_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cook_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cook_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cook_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cook_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cook_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cook_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cook_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cook_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cook_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cook_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cook_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cook_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cook_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cook_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cook_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cook_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cook_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cook_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cook_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cook_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cook_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cook_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cook_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cook_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cook_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cook_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cook_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cook_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cook_auth_rule` VALUES ('118', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `cook_auth_rule` VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `cook_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `cook_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `cook_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `cook_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `cook_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `cook_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `cook_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `cook_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `cook_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `cook_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `cook_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `cook_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `cook_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `cook_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `cook_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `cook_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `cook_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `cook_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cook_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `cook_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cook_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cook_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `cook_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cook_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `cook_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `cook_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `cook_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cook_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `cook_auth_rule` VALUES ('148', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cook_auth_rule` VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cook_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cook_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cook_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '用户列表', '');
INSERT INTO `cook_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cook_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cook_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cook_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cook_auth_rule` VALUES ('157', '1', 'admin', 'admin_url', 'admin/Cookmenu/index', '', '菜谱管理', '');
INSERT INTO `cook_auth_rule` VALUES ('158', '1', 'admin', 'admin_url', 'admin/Cookmenu/show', '', '在线菜谱', '');
INSERT INTO `cook_auth_rule` VALUES ('159', '1', 'admin', 'admin_url', 'admin/Cookmenu/publish', '', '发布菜谱', '');
INSERT INTO `cook_auth_rule` VALUES ('160', '1', 'admin', 'admin_url', 'admin/Cookuser/default', '', '用户管理', '');
INSERT INTO `cook_auth_rule` VALUES ('161', '1', 'admin', 'admin_url', 'admin/Cookusers/showlist', '', '用户列表', '');
INSERT INTO `cook_auth_rule` VALUES ('162', '1', 'admin', 'admin_url', 'admin/Cookusers/detail', '', '用户详情', '');
INSERT INTO `cook_auth_rule` VALUES ('163', '1', 'admin', 'admin_url', 'admin/Menuoperation/index', '', '烹饪管理', '');
INSERT INTO `cook_auth_rule` VALUES ('164', '1', 'admin', 'admin_url', 'admin/Menuoperation/order', '', '预约中烹饪', '');
INSERT INTO `cook_auth_rule` VALUES ('165', '1', 'admin', 'admin_url', 'admin/Menuoperation/practice', '', '实施中烹饪', '');
INSERT INTO `cook_auth_rule` VALUES ('166', '1', 'admin', 'admin_url', 'admin/Menuoperation/complete', '', '已完成烹饪', '');

-- ----------------------------
-- Table structure for cook_category
-- ----------------------------
DROP TABLE IF EXISTS `cook_category`;
CREATE TABLE `cook_category` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '分类名称',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `pid` smallint(10) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of cook_category
-- ----------------------------

-- ----------------------------
-- Table structure for cook_client_ids
-- ----------------------------
DROP TABLE IF EXISTS `cook_client_ids`;
CREATE TABLE `cook_client_ids` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL DEFAULT '' COMMENT '通訊id',
  `uid` varchar(100) NOT NULL DEFAULT '' COMMENT '設備或者用戶標識',
  `to_id` varchar(100) NOT NULL DEFAULT '' COMMENT '配對id',
  `is_on` tinyint(1) unsigned DEFAULT '1' COMMENT '是否在綫',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COMMENT='socket通訊表';

-- ----------------------------
-- Records of cook_client_ids
-- ----------------------------
INSERT INTO `cook_client_ids` VALUES ('1', '7f0000010b5400000001', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('2', '7f0000010b5700000002', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('3', '7f0000010b5400000001', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('4', '7f0000010b5700000002', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('5', '7f0000010b5600000002', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('6', '7f0000010b5500000002', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('7', '7f0000010b5700000001', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('8', '7f0000010b5700000002', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('9', '7f0000010b5500000003', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('10', '7f0000010b560000000c', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('11', '7f0000010b5400000006', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('12', '7f0000010b550000000d', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('13', '7f0000010b550000000d', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('14', '7f0000010b550000000d', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('15', '7f0000010b5400000007', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('16', '7f0000010b5600000012', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('17', '7f0000010b5500000012', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('18', '7f0000010b5600000015', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('19', '7f0000010b5400000009', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('20', '7f0000010b540000000a', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('21', '7f0000010b5600000016', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('22', '7f0000010b570000000a', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('23', '7f0000010b5600000017', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('24', '7f0000010b5500000014', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('25', '7f0000010b540000000b', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('26', '7f0000010b5500000015', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('27', '7f0000010b5500000016', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('28', '7f0000010b540000000c', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('29', '7f0000010b5600000018', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('30', '7f0000010b540000000d', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('31', '7f0000010b570000000b', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('32', '7f0000010b5600000019', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('33', '7f0000010b5500000017', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('34', '7f0000010b560000001a', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('35', '7f0000010b570000000c', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('36', '7f0000010b540000000f', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('37', '7f0000010b560000001b', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('38', '7f0000010b5500000018', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('39', '7f0000010b5400000010', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('40', '7f0000010b560000001c', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('41', '7f0000010b5500000019', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('42', '7f0000010b550000001a', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('43', '7f0000010b5400000011', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('44', '7f0000010b5700000011', '001', '0134', '0');
INSERT INTO `cook_client_ids` VALUES ('45', '7f0000010b5400000016', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('46', '7f0000010b5700000013', '001', '00', '0');
INSERT INTO `cook_client_ids` VALUES ('47', '7f0000010b5600000027', '001', '00', '0');
INSERT INTO `cook_client_ids` VALUES ('48', '7f0000010b5400000018', '001', '19865', '0');
INSERT INTO `cook_client_ids` VALUES ('49', '7f0000010b5600000029', '001', '00', '0');
INSERT INTO `cook_client_ids` VALUES ('50', '7f0000010b540000001a', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('51', '7f0000010b5700000019', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('52', '7f0000010b5500000027', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('53', '7f0000010b5500000029', '001', '01', '0');
INSERT INTO `cook_client_ids` VALUES ('54', '7f0000010b550000002e', '001', '08', '0');
INSERT INTO `cook_client_ids` VALUES ('55', '7f0000010b5600000034', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('56', '7f0000010b540000001f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('57', '7f0000010b5500000030', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('58', '7f0000010b5700000020', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('59', '7f0000010b5500000031', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('60', '7f0000010b5500000031', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('61', '7f0000010b5600000037', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('62', '7f0000010b5600000037', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('63', '7f0000010b5500000033', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('64', '7f0000010b5500000033', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('65', '7f0000010b5600000039', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('66', '7f0000010b5500000034', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('67', '7f0000010b5500000034', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('68', '7f0000010b5400000022', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('69', '7f0000010b5400000023', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('70', '7f0000010b5400000024', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('71', '7f0000010b560000003b', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('72', '7f0000010b5400000026', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('73', '7f0000010b560000003d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('74', '7f0000010b560000003d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('75', '7f0000010b550000003a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('76', '7f0000010b560000003e', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('77', '7f0000010b5400000028', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('78', '7f0000010b560000003f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('79', '7f0000010b5400000029', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('80', '7f0000010b5700000025', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('81', '7f0000010b5700000025', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('82', '7f0000010b550000003c', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('83', '7f0000010b550000003c', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('84', '7f0000010b5700000027', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('85', '7f0000010b540000002a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('86', '7f0000010b550000003d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('87', '7f0000010b5700000028', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('88', '7f0000010b5700000029', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('89', '7f0000010b5700000029', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('90', '7f0000010b570000002a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('91', '7f0000010b540000002b', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('92', '7f0000010b5600000040', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('93', '7f0000010b5600000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('94', '7f0000010b5600000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('95', '7f0000010b550000003f', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('96', '7f0000010b550000003f', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('97', '7f0000010b5600000043', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('98', '7f0000010b570000002d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('99', '7f0000010b570000002d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('100', '7f0000010b5600000044', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('101', '7f0000010b5600000045', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('102', '7f0000010b5500000040', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('103', '7f0000010b5500000040', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('104', '7f0000010b5500000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('105', '7f0000010b5500000042', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('106', '7f0000010b5500000042', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('107', '7f0000010b5500000043', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('108', '7f0000010b5600000046', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('109', '7f0000010b5600000047', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('110', '7f0000010b5600000048', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('111', '7f0000010b5600000049', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('112', '7f0000010b5400000030', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('113', '7f0000010b5400000030', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('114', '7f0000010b560000004a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('115', '7f0000010b5400000032', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('116', '7f0000010b5400000032', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('117', '7f0000010b5400000033', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('118', '7f0000010b5500000046', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('119', '7f0000010b5500000047', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('120', '7f0000010b5500000047', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('121', '7f0000010b5400000035', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('122', '7f0000010b560000004d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('123', '7f0000010b5400000037', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('124', '7f0000010b5400000036', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('125', '7f0000010b5400000036', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('126', '7f0000010b5400000035', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('127', '7f0000010b5700000032', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('128', '7f0000010b5700000035', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('129', '7f0000010b5700000034', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('130', '7f0000010b560000004f', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('131', '7f0000010b560000004e', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('132', '7f0000010b5700000033', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('133', '7f0000010b5700000032', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('134', '7f0000010b5600000050', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('135', '7f0000010b550000004b', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('136', '7f0000010b5700000036', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('137', '7f0000010b550000004d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('138', '7f0000010b550000004e', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('139', '7f0000010b5700000037', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('140', '7f0000010b5600000051', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('141', '7f0000010b550000004f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('142', '7f0000010b5600000055', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('143', '7f0000010b540000003c', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('144', '7f0000010b5600000056', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('145', '7f0000010b5500000053', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('146', '7f0000010b5500000053', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('147', '7f0000010b540000003d', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('148', '7f0000010b570000003c', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('149', '7f0000010b540000003e', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('150', '7f0000010b540000003e', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('151', '7f0000010b570000003d', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('152', '7f0000010b5500000055', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('153', '7f0000010b5600000059', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('154', '7f0000010b570000003e', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('155', '7f0000010b560000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('156', '7f0000010b540000003f', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('157', '7f0000010b5500000056', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('158', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('159', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('160', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('161', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('162', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('163', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('164', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('165', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('166', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('167', '7f0000010b550000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('168', '7f0000010b560000005f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('169', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('170', '7f0000010b560000005f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('171', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('172', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('173', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('174', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('175', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('176', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('177', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('178', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('179', '7f0000010b5400000041', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('180', '7f0000010b5400000043', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('181', '7f0000010b5400000044', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('182', '7f0000010b5400000043', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('183', '7f0000010b5400000044', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('184', '7f0000010b5400000044', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('185', '7f0000010b5400000044', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('186', '7f0000010b550000005d', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('187', '7f0000010b5700000050', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('188', '7f0000010b550000005d', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('189', '7f0000010b5700000050', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('190', '7f0000010b5700000051', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('191', '7f0000010b5600000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('192', '7f0000010b5600000064', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('193', '7f0000010b5600000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('194', '7f0000010b5600000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('195', '7f0000010b5600000064', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('196', '7f0000010b5600000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('197', '7f0000010b5600000065', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('198', '7f0000010b5600000065', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('199', '7f0000010b5500000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('200', '7f0000010b5500000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('201', '7f0000010b5500000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('202', '7f0000010b5500000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('203', '7f0000010b5500000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('204', '7f0000010b5500000065', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('205', '7f0000010b5500000065', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('206', '7f0000010b560000006a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('207', '7f0000010b560000006a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('208', '7f0000010b560000006a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('209', '7f0000010b560000006a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('210', '7f0000010b560000006a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('211', '7f0000010b5400000045', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('212', '7f0000010b5400000045', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('213', '7f0000010b5400000045', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('214', '7f0000010b5500000066', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('215', '7f0000010b5500000067', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('216', '7f0000010b560000006c', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('217', '7f0000010b5500000068', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('218', '7f0000010b5500000069', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('219', '7f0000010b550000006b', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('220', '7f0000010b570000005a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('221', '7f0000010b560000006d', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('222', '7f0000010b550000006a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('223', '7f0000010b560000006f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('224', '7f0000010b570000005c', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('225', '7f0000010b570000005d', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('226', '7f0000010b570000005e', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('227', '7f0000010b5500000067', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('228', '7f0000010b560000006c', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('229', '7f0000010b5500000068', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('230', '7f0000010b570000005e', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('231', '7f0000010b5500000076', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('232', '7f0000010b550000006e', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('233', '7f0000010b5500000073', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('234', '7f0000010b5500000075', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('235', '7f0000010b540000004b', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('236', '7f0000010b5400000047', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('237', '7f0000010b5400000050', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('238', '7f0000010b540000004d', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('239', '7f0000010b550000006f', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('240', '7f0000010b540000004c', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('241', '7f0000010b5500000072', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('242', '7f0000010b5500000074', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('243', '7f0000010b5500000077', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('244', '7f0000010b550000006e', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('245', '7f0000010b5500000075', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('246', '7f0000010b550000006e', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('247', '7f0000010b5400000051', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('248', '7f0000010b5600000075', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('249', '7f0000010b5600000070', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('250', '7f0000010b5400000051', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('251', '7f0000010b5600000070', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('252', '7f0000010b5600000075', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('253', '7f0000010b5400000051', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('254', '7f0000010b5600000075', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('255', '7f0000010b5700000062', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('256', '7f0000010b5500000078', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('257', '7f0000010b560000007a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('258', '7f0000010b5600000079', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('259', '7f0000010b560000007c', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('260', '7f0000010b560000007b', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('261', '7f0000010b5700000063', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('262', '7f0000010b5700000062', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('263', '7f0000010b560000007a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('264', '7f0000010b560000007a', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('265', '7f0000010b5600000079', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('266', '7f0000010b5600000079', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('267', '7f0000010b5600000079', '001', '65255', '0');
INSERT INTO `cook_client_ids` VALUES ('268', '7f0000010b560000007e', '001', '032', '0');
INSERT INTO `cook_client_ids` VALUES ('269', '7f0000010b560000007e', '001', '032', '0');

-- ----------------------------
-- Table structure for cook_code
-- ----------------------------
DROP TABLE IF EXISTS `cook_code`;
CREATE TABLE `cook_code` (
  `code` int(10) NOT NULL,
  `msg` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='code码表';

-- ----------------------------
-- Records of cook_code
-- ----------------------------
INSERT INTO `cook_code` VALUES ('1000', '提交的参数不全');
INSERT INTO `cook_code` VALUES ('1001', '验证码不能为空');
INSERT INTO `cook_code` VALUES ('1002', '输入的手机格式有错');
INSERT INTO `cook_code` VALUES ('1003', '输入的验证码不匹配');
INSERT INTO `cook_code` VALUES ('0', '成功');
INSERT INTO `cook_code` VALUES ('-1', '数据返回失败');
INSERT INTO `cook_code` VALUES ('1004', 'token值不能为空');
INSERT INTO `cook_code` VALUES ('1005', '不存在该用户帐号');
INSERT INTO `cook_code` VALUES ('1006', '登陆超时请重新登录');
INSERT INTO `cook_code` VALUES ('1007', '该邮箱地址已经被绑定');
INSERT INTO `cook_code` VALUES ('1008', '该手机号码已经被绑定');
INSERT INTO `cook_code` VALUES ('1009', '输入的密码不一致');
INSERT INTO `cook_code` VALUES ('1010', '输入的邮箱地址格式有误');
INSERT INTO `cook_code` VALUES ('1011', '邮箱配置不完整');
INSERT INTO `cook_code` VALUES ('1022', '输入的密码不正确');
INSERT INTO `cook_code` VALUES ('1023', '账号已经被禁用或者被删除');
INSERT INTO `cook_code` VALUES ('1024', '该手机或邮箱已经被绑定');
INSERT INTO `cook_code` VALUES ('1025', '更新用户信息失败');
INSERT INTO `cook_code` VALUES ('1026', '你输入的手机号码或者邮箱格式有误');
INSERT INTO `cook_code` VALUES ('1027', '提交数据失败');
INSERT INTO `cook_code` VALUES ('1028', 'token错误请重新登录');
INSERT INTO `cook_code` VALUES ('1029', '参数传递错误');
INSERT INTO `cook_code` VALUES ('1000', '提交的参数不全');
INSERT INTO `cook_code` VALUES ('1001', '验证码不能为空');
INSERT INTO `cook_code` VALUES ('1002', '输入的手机格式有错');
INSERT INTO `cook_code` VALUES ('1003', '输入的验证码不匹配');
INSERT INTO `cook_code` VALUES ('0', '成功');
INSERT INTO `cook_code` VALUES ('-1', '数据返回失败');
INSERT INTO `cook_code` VALUES ('1004', 'token值不能为空');
INSERT INTO `cook_code` VALUES ('1005', '不存在该用户帐号');
INSERT INTO `cook_code` VALUES ('1006', '登陆超时请重新登录');
INSERT INTO `cook_code` VALUES ('1007', '该邮箱地址已经被绑定');
INSERT INTO `cook_code` VALUES ('1008', '该手机号码已经被绑定');
INSERT INTO `cook_code` VALUES ('1009', '输入的密码不一致');
INSERT INTO `cook_code` VALUES ('1010', '输入的邮箱地址格式有误');
INSERT INTO `cook_code` VALUES ('1011', '邮箱配置不完整');
INSERT INTO `cook_code` VALUES ('1022', '输入的密码不正确');
INSERT INTO `cook_code` VALUES ('1023', '账号已经被禁用或者被删除');
INSERT INTO `cook_code` VALUES ('1024', '该手机或邮箱已经被绑定');
INSERT INTO `cook_code` VALUES ('1025', '更新用户信息失败');
INSERT INTO `cook_code` VALUES ('1026', '你输入的手机号码或者邮箱格式有误');
INSERT INTO `cook_code` VALUES ('1027', '提交数据失败');
INSERT INTO `cook_code` VALUES ('1028', 'token错误请重新登录');
INSERT INTO `cook_code` VALUES ('1029', '参数传递错误');
INSERT INTO `cook_code` VALUES ('1000', '提交的参数不全');
INSERT INTO `cook_code` VALUES ('1001', '验证码不能为空');
INSERT INTO `cook_code` VALUES ('1002', '输入的手机格式有错');
INSERT INTO `cook_code` VALUES ('1003', '输入的验证码不匹配');
INSERT INTO `cook_code` VALUES ('0', '成功');
INSERT INTO `cook_code` VALUES ('-1', '数据返回失败');
INSERT INTO `cook_code` VALUES ('1004', 'token值不能为空');
INSERT INTO `cook_code` VALUES ('1005', '不存在该用户帐号');
INSERT INTO `cook_code` VALUES ('1006', '登陆超时请重新登录');
INSERT INTO `cook_code` VALUES ('1007', '该邮箱地址已经被绑定');
INSERT INTO `cook_code` VALUES ('1008', '该手机号码已经被绑定');
INSERT INTO `cook_code` VALUES ('1009', '输入的密码不一致');
INSERT INTO `cook_code` VALUES ('1010', '输入的邮箱地址格式有误');
INSERT INTO `cook_code` VALUES ('1011', '邮箱配置不完整');
INSERT INTO `cook_code` VALUES ('1022', '输入的密码不正确');
INSERT INTO `cook_code` VALUES ('1023', '账号已经被禁用或者被删除');
INSERT INTO `cook_code` VALUES ('1024', '该手机或邮箱已经被绑定');
INSERT INTO `cook_code` VALUES ('1025', '更新用户信息失败');
INSERT INTO `cook_code` VALUES ('1026', '你输入的手机号码或者邮箱格式有误');
INSERT INTO `cook_code` VALUES ('1027', '提交数据失败');
INSERT INTO `cook_code` VALUES ('1028', 'token错误请重新登录');
INSERT INTO `cook_code` VALUES ('1029', '参数传递错误');
INSERT INTO `cook_code` VALUES ('1000', '提交的参数不全');
INSERT INTO `cook_code` VALUES ('1001', '验证码不能为空');
INSERT INTO `cook_code` VALUES ('1002', '输入的手机格式有错');
INSERT INTO `cook_code` VALUES ('1003', '输入的验证码不匹配');
INSERT INTO `cook_code` VALUES ('0', '成功');
INSERT INTO `cook_code` VALUES ('-1', '数据返回失败');
INSERT INTO `cook_code` VALUES ('1004', 'token值不能为空');
INSERT INTO `cook_code` VALUES ('1005', '不存在该用户帐号');
INSERT INTO `cook_code` VALUES ('1006', '登陆超时请重新登录');
INSERT INTO `cook_code` VALUES ('1007', '该邮箱地址已经被绑定');
INSERT INTO `cook_code` VALUES ('1008', '该手机号码已经被绑定');
INSERT INTO `cook_code` VALUES ('1009', '输入的密码不一致');
INSERT INTO `cook_code` VALUES ('1010', '输入的邮箱地址格式有误');
INSERT INTO `cook_code` VALUES ('1011', '邮箱配置不完整');
INSERT INTO `cook_code` VALUES ('1022', '输入的密码不正确');
INSERT INTO `cook_code` VALUES ('1023', '账号已经被禁用或者被删除');
INSERT INTO `cook_code` VALUES ('1024', '该手机或邮箱已经被绑定');
INSERT INTO `cook_code` VALUES ('1025', '更新用户信息失败');
INSERT INTO `cook_code` VALUES ('1026', '你输入的手机号码或者邮箱格式有误');
INSERT INTO `cook_code` VALUES ('1027', '提交数据失败');
INSERT INTO `cook_code` VALUES ('1028', 'token错误请重新登录');
INSERT INTO `cook_code` VALUES ('1029', '参数传递错误');

-- ----------------------------
-- Table structure for cook_comment
-- ----------------------------
DROP TABLE IF EXISTS `cook_comment`;
CREATE TABLE `cook_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`object_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cook_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cook_config
-- ----------------------------
DROP TABLE IF EXISTS `cook_config`;
CREATE TABLE `cook_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(64) DEFAULT '' COMMENT '配置的key键名',
  `value` text COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `desc` varchar(50) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of cook_config
-- ----------------------------
INSERT INTO `cook_config` VALUES ('89', 'images', '[\"http:\\/\\/photo.yupoo.com\\/ninjapan\\/BI9czMqT\\/medish.jpg\",\"http:\\/\\/photo.yupoo.com\\/ninjapan\\/BIbbvWnH\\/medish.jpg\",\"http:\\/\\/photo.yupoo.com\\/silversu\\/3335278d7aa7\\/medish.jpg\"]', 'initial', '初次启动APP时显示的页面');
INSERT INTO `cook_config` VALUES ('90', 'images', '[\"http:\\/\\/photo.yupoo.com\\/vivi112\\/848168c4a284\\/medish.jpg\"]', 'start_up', '每次启动APP显示的页面');
INSERT INTO `cook_config` VALUES ('92', 'introduce', '网易公司是中国领先的互联网技术公司，在开发互联网应用、服务及其它技术方面，网易始终保持国内业界的领先地位。网易对中国互联网的发展具有强烈的使命感，利用最先进的互联网技术，加强人与人之间信息的交流和共享，实现“网聚人的力量”。\n杭州网易云音乐科技有限公司是网易旗下的一家互联网科技公司。网易云音乐是一款由其开发的音乐产品。', 'about_us', '关于我们：关于平台的相关介绍');
INSERT INTO `cook_config` VALUES ('93', 'contact', '{\"mobile\":13352880671,\"email\":\"1234567@qq.com\"}', 'about_us', '联系我们：展示平台客服电话，相关联系方式');
INSERT INTO `cook_config` VALUES ('94', 'introduction', '[{\"text\":\"\\u6b65\\u9aa4\\u4e00\",\"img\":\"https:\\/\\/unsplash.it\\/200\\/300?image=0\"},{\"text\":\"\\u6b65\\u9aa4\\u4e8c\",\"img\":\"https:\\/\\/unsplash.it\\/200\\/300?image=1\"}]', 'course', '教程 详情');
INSERT INTO `cook_config` VALUES ('95', 'steps', '[{\"text\":\"\\u6b65\\u9aa4\\u4e00\",\"img\":\"http:\\/\\/ww.img.com\\/1.jpg\"},{\"text\":\"\\u6b65\\u9aa4\\u4e8c\",\"img\":\"http:\\/\\/ww.img.com\\/2.jpg\"}]', 'course', '教程 步骤');
INSERT INTO `cook_config` VALUES ('96', 'bucket', 'cooking', 'UPYUN_CONFIG', 'upyun');
INSERT INTO `cook_config` VALUES ('97', 'savekey', '/{year}/{mon}/{day}/{filemd5}{.suffix}', 'UPYUN_CONFIG', 'upyun');
INSERT INTO `cook_config` VALUES ('98', 'expiration', '86400', 'UPYUN_CONFIG', 'upyun');
INSERT INTO `cook_config` VALUES ('99', 'formkey', 'clQeoPmsqD038Q5G8Wy6GRLfxiY=', 'UPYUN_CONFIG', 'upyun');
INSERT INTO `cook_config` VALUES ('100', 'cdnurl', 'http://cooking.b0.upaiyun.com', 'UPYUN_CONFIG', 'upyun');
INSERT INTO `cook_config` VALUES ('101', 'uploadUrl', 'http://v0.api.upyun.com/cooking', 'UPYUN_CONFIG', 'upyun');

-- ----------------------------
-- Table structure for cook_email_code
-- ----------------------------
DROP TABLE IF EXISTS `cook_email_code`;
CREATE TABLE `cook_email_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '验证码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='邮件发送验证码表';

-- ----------------------------
-- Records of cook_email_code
-- ----------------------------
INSERT INTO `cook_email_code` VALUES ('11', '0593');
INSERT INTO `cook_email_code` VALUES ('12', '0702');
INSERT INTO `cook_email_code` VALUES ('13', '0148');
INSERT INTO `cook_email_code` VALUES ('14', '0529');

-- ----------------------------
-- Table structure for cook_hook
-- ----------------------------
DROP TABLE IF EXISTS `cook_hook`;
CREATE TABLE `cook_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='系统钩子表';

-- ----------------------------
-- Records of cook_hook
-- ----------------------------
INSERT INTO `cook_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `cook_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cook_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cook_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cook_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cook_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cook_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cook_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cook_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cook_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cook_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cook_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cook_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cook_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cook_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cook_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cook_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cook_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cook_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cook_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cook_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cook_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `cook_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `cook_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cook_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cook_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cook_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cook_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cook_hook` VALUES ('29', '1', '1', '登录逻辑开始之前', 'user_login_start', 'cmf', '登录逻辑开始之前');

-- ----------------------------
-- Table structure for cook_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cook_hook_plugin`;
CREATE TABLE `cook_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of cook_hook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for cook_link
-- ----------------------------
DROP TABLE IF EXISTS `cook_link`;
CREATE TABLE `cook_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of cook_link
-- ----------------------------
INSERT INTO `cook_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for cook_menu
-- ----------------------------
DROP TABLE IF EXISTS `cook_menu`;
CREATE TABLE `cook_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布者ID',
  `admin_id` smallint(10) unsigned NOT NULL DEFAULT '0' COMMENT '后台发布者ID',
  `from_u` enum('user','admin') NOT NULL DEFAULT 'user' COMMENT '发布类型 用户/管理员',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '菜谱名称',
  `images` varchar(500) NOT NULL DEFAULT '' COMMENT '菜谱图片',
  `ingredients` text NOT NULL COMMENT '菜谱介绍',
  `ingredients_introduction` text COMMENT '菜谱成分介绍',
  `temperature` char(10) NOT NULL DEFAULT '' COMMENT '温度',
  `texture` varchar(255) NOT NULL DEFAULT '' COMMENT '口感介绍',
  `food_weight` text NOT NULL COMMENT '食材介绍',
  `cook_steps` text NOT NULL COMMENT '菜谱步骤',
  `cook_time` char(10) NOT NULL DEFAULT '' COMMENT '建议时长',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(32) NOT NULL DEFAULT 'normal' COMMENT 'H未审核 normal审核通过 canceled取消 rejected拒绝通过 deleted已删除',
  `cook_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '烹饪状态 0预约 1正在进行 2已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='菜谱表';

-- ----------------------------
-- Records of cook_menu
-- ----------------------------
INSERT INTO `cook_menu` VALUES ('2', '1', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502281000', '1502803754', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('3', '2', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 20,\"fff\": 10}', '[\"4234234234\",\"324234234234\"]', '60', '1502281000', '1502337645', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('4', '2', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 20,\"fff\": 10}', '[\"4234234234\",\"324234234234\"]', '60', '1502281000', '1502337661', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('5', '2', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 20,\"fff\": 10}', '[\"4234234234\",\"324234234234\"]', '60', '1502281000', '1502337759', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('6', '1', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 20,\"fff\": 10}', '[\"4234234234\",\"324234234234\"]', '60', '1502281000', '1502424080', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('7', '1', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 20,\"fff\": 10}', '[\"4234234234\",\"324234234234\",\"对，就是这样做\"]', '60', '1502281000', '1502508961', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('8', '1', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{&quot;ddd&quot;:330,&quot;fff&quot;:20}', '200', '43274863476238', '{&quot;ddd&quot;: 20,&quot;fff&quot;: 10}', '[&quot;4234234234&quot;,&quot;324234234234&quot;,&quot;对，就是这样做&quot;]', '60', '1502281000', '1502517792', '0', 'H', '0');
INSERT INTO `cook_menu` VALUES ('9', '1', '0', 'user', 'uuuuuuuuuuuuu', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '2000℃', 'ttttttttttttt', '{\"b\":1,\"c\":3,\"d\":4}', '[\"e\",\"r\"]', '02:00', '0', '1502528460', '1502710144', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('10', '1', '0', 'user', 'bbbbbbb', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '800℃', 'tttttttttttttsgsdgsd', '{\"b\":1,\"c\":3,\"d\":4,\"a\":1,\"q\":7}', '[\"q\",\"w\",\"e\",\"r\",\"t\"]', '01:00', '0', '1502699846', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('11', '1', '0', 'user', 'test', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '1200℃', 'ds', '{\"sdg\":2}', '[\"weyey\"]', '02:00', '0', '1502700891', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('12', '1', '0', 'user', 'ceshi', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '2800℃', 'sdg', '{\"1\":2}', '[\"353253\",\"wet\"]', '22:00', '0', '1502710604', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('13', '6', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 20,\"fff\": 10}', '[\"4234234234\",\"324234234234\"]', '60', '1502281000', '1502777733', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('14', '6', '0', 'user', '猪肝瘦肉汤', 'https://unsplash.it/200/200?image=1', 'iduhaidhasiudhaiuhdiu', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\": 330,\"fff\": 20}', '[\"4234234234\",\"324234234234\"]', '60', '1502281000', '1502777814', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('15', '1', '0', 'user', '问问', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200℃', '我问问', '{\"肉\":12,\"肉\":100}', '[\"生活就是\",\"哈哈哈\"]', '01:00', '0', '1502810147', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('16', '1', '0', 'user', '问问', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200℃', '我问问', '{\"肉\":12,\"肉\":100}', '[\"生活就是\",\"哈哈哈\"]', '01:00', '0', '1502810156', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('17', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502858470', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('18', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502858474', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('19', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502858478', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('20', '8', '0', 'user', 'carlos1', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502858499', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('21', '8', '0', 'user', 'carlos1', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502858503', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('22', '8', '0', 'user', 'qqqq', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502859095', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('23', '8', '0', 'user', 'aaaa', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502859119', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('24', '8', '0', 'user', 'aaaa', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502859130', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('25', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502860257', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('26', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861123', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('27', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861126', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('28', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861147', '0', 'normal', '1');
INSERT INTO `cook_menu` VALUES ('29', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861154', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('30', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '{\"ddd\":330,\"fff\":20}', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861159', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('31', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861162', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('32', '8', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', '', '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"4234234234\",\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502861171', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('33', '1', '0', 'user', '4y4yr', 'https://unsplash.it/200/200?image=1', 'test', null, '200', '43274863476238', '{\"ddd\":330,\"fff\":20,\"sgw\":3}', '[\"324234234234\",\"sdg\",\"4464\"]', '60', '0', '1502869865', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('34', '9', '0', 'user', '5555555555555', 'https://unsplash.it/200/200?image=1', 'test', null, '2000℃', '4327486zg', '{\"ddd\":330,\"fff\":20}', '[\"4234234234\",\"324234234234\",\"sdg\"]', '02:00', '2017', '1502884886', '0', 'normal', '0');
INSERT INTO `cook_menu` VALUES ('35', '9', '0', 'user', 'pppppppppppp', 'https://unsplash.it/200/200?image=1', 'test', null, '200', '43274863476238', '{\"ddd\":330,\"fff\":20}', '[\"4234234234\",\"324234234234\"]', '60', '2017', '1502886423', '0', 'normal', '0');

-- ----------------------------
-- Table structure for cook_menu_operation
-- ----------------------------
DROP TABLE IF EXISTS `cook_menu_operation`;
CREATE TABLE `cook_menu_operation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜譜id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cook_time` varchar(30) NOT NULL DEFAULT '' COMMENT '烹飪時間',
  `start_time` varchar(30) NOT NULL COMMENT '開始時間',
  `temperature` char(10) NOT NULL DEFAULT '' COMMENT '溫度',
  `equipment_id` varchar(100) NOT NULL DEFAULT '' COMMENT '設備id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '狀態 0預約 1進行中 2已完成 3其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COMMENT='預約烹飪表';

-- ----------------------------
-- Records of cook_menu_operation
-- ----------------------------
INSERT INTO `cook_menu_operation` VALUES ('1', '12', '12', '30分钟', '2014-05-06', '30', '350', '1');
INSERT INTO `cook_menu_operation` VALUES ('2', '1', '1', '213213213', '0', '23', '43628746328', '0');
INSERT INTO `cook_menu_operation` VALUES ('3', '1', '1', '213213213', '0', '23', '43628746328', '0');
INSERT INTO `cook_menu_operation` VALUES ('4', '1', '1', '213213213', '0', '23', '43628746328', '0');
INSERT INTO `cook_menu_operation` VALUES ('5', '1', '1', '213213213', '0', '23', '43628746328', '0');
INSERT INTO `cook_menu_operation` VALUES ('6', '9', '1', '2017-8-14-01:00', '0', '800℃', '001', '0');
INSERT INTO `cook_menu_operation` VALUES ('7', '2', '1', '2017-8-15-01:00', '2017-8-15-03:00', '800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('8', '1', '1', '09:00', '2017-8-15-12:00', '200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('9', '1', '1', '02:00', '2017-8-15-01:00', '200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('10', '14', '1', '02:02', '2017-8-15-02:02', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('11', '14', '1', '02:02', '2017-8-15-02:02', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('12', '1', '1', '03:02', '2017-8-15-02:06', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('13', '1', '1', '03:02', '2017-8-15-02:06', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('14', '1', '1', '02:00', '2017-8-15-01:00', '2000℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('15', '1', '1', '02:00', '2017-8-15-01:00', '2000℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('16', '2', '1', '03:00', '2017-8-15-08:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('17', '2', '1', '03:00', '2017-8-15-08:00', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('18', '2', '1', '03:00', '2017-8-15-08:00', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('19', '2', '1', '03:00', '2017-8-15-08:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('20', '2', '1', '03:00', '2017-8-15-08:00', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('21', '2', '1', '03:00', '2017-8-15-08:00', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('22', '2', '1', '02:00', '0', '1200℃', '32', '1');
INSERT INTO `cook_menu_operation` VALUES ('23', '2', '1', '02:00', '0', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('24', '2', '1', '02:00', '0', '1200℃', '32', '1');
INSERT INTO `cook_menu_operation` VALUES ('25', '2', '1', '02:00', '0', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('26', '2', '1', '02:00', '0', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('27', '2', '1', '02:00', '0', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('28', '2', '1', '02:00', '0', '1200℃', '32', '2');
INSERT INTO `cook_menu_operation` VALUES ('29', '2', '1', '02:00', '0', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('30', '2', '1', '02:00', '0', '1200℃', '32', '2');
INSERT INTO `cook_menu_operation` VALUES ('31', '2', '1', '02:00', '0', '1200℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('32', '9', '1', '01:00', '2017-8-15-01:00', '800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('33', '9', '1', '01:00', '2017-8-15-01:00', '800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('34', '17', '1', '13:24', '0', '0℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('35', '9', '1', '01:00', '0', '800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('36', '9', '1', '01:00', '0', '800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('37', '9', '1', '01:00', '0', '800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('38', '9', '1', '01:00', '00:00', '800℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('39', '2', '1', '00:01', '00:00', '2800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('40', '2', '1', '00:01', '00:00', '2800℃', '32', '0');
INSERT INTO `cook_menu_operation` VALUES ('41', '2', '1', '00:03', '2017-8-17-02:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('42', '2', '1', '00:03', '2017-8-17-02:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('43', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('44', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('45', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('46', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('47', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('48', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('49', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('50', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('51', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('52', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('53', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('54', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('55', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('56', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('57', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('58', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('59', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('60', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('61', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('62', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('63', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('64', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('65', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('66', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('67', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('68', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('69', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('70', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('71', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('72', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('73', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('74', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('75', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('76', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('77', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('78', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('79', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('80', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('81', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('82', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('83', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('84', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('85', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('86', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('87', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('88', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('89', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('90', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('91', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('92', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('93', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('94', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('95', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('96', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('97', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('98', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('99', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('100', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('101', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('102', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('103', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('104', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('105', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('106', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('107', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('108', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('109', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('110', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('111', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('112', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('113', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('114', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('115', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('116', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('117', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('118', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('119', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('120', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('121', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('122', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('123', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('124', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('125', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('126', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('127', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('128', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('129', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('130', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('131', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('132', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('133', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('134', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('135', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('136', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('137', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('138', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('139', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('140', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('141', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('142', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('143', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('144', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('145', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('146', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('147', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('148', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('149', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('150', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('151', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('152', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('153', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('154', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('155', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('156', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('157', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('158', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('159', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('160', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('161', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('162', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('163', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('164', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('165', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('166', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('167', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('168', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('169', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('170', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('171', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('172', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('173', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('174', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('175', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('176', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('177', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('178', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('179', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('180', '1', '1', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '0');
INSERT INTO `cook_menu_operation` VALUES ('181', '111111', '4294967295', '02:00', '2017-8-17-03:00', '1200℃', '432423423', '2');
INSERT INTO `cook_menu_operation` VALUES ('182', '1', '1', '02:00', '2017-8-17-17:00', '1200℃', '432423423', '1');

-- ----------------------------
-- Table structure for cook_nav
-- ----------------------------
DROP TABLE IF EXISTS `cook_nav`;
CREATE TABLE `cook_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of cook_nav
-- ----------------------------
INSERT INTO `cook_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `cook_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for cook_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `cook_nav_menu`;
CREATE TABLE `cook_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of cook_nav_menu
-- ----------------------------
INSERT INTO `cook_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for cook_option
-- ----------------------------
DROP TABLE IF EXISTS `cook_option`;
CREATE TABLE `cook_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of cook_option
-- ----------------------------
INSERT INTO `cook_option` VALUES ('7', '1', 'site_info', '{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\"}');

-- ----------------------------
-- Table structure for cook_page
-- ----------------------------
DROP TABLE IF EXISTS `cook_page`;
CREATE TABLE `cook_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) NOT NULL COMMENT '分类ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='单页表';

-- ----------------------------
-- Records of cook_page
-- ----------------------------

-- ----------------------------
-- Table structure for cook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cook_plugin`;
CREATE TABLE `cook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of cook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for cook_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `cook_portal_category`;
CREATE TABLE `cook_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of cook_portal_category
-- ----------------------------

-- ----------------------------
-- Table structure for cook_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `cook_portal_category_post`;
CREATE TABLE `cook_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of cook_portal_category_post
-- ----------------------------

-- ----------------------------
-- Table structure for cook_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `cook_portal_post`;
CREATE TABLE `cook_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of cook_portal_post
-- ----------------------------
INSERT INTO `cook_portal_post` VALUES ('1', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1503539817', '1503539817', '1503539760', '1503540483', 'asdgfa', 'dasfasd', 'dasfads', '', '&lt;p&gt;dsfadsf&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"page\"}');
INSERT INTO `cook_portal_post` VALUES ('2', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1503542407', '1503542407', '1503542340', '0', 'sad', 'sdaa', 'dsa', '', '&lt;p&gt;sdad&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"page\"}');

-- ----------------------------
-- Table structure for cook_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `cook_portal_tag`;
CREATE TABLE `cook_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of cook_portal_tag
-- ----------------------------

-- ----------------------------
-- Table structure for cook_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `cook_portal_tag_post`;
CREATE TABLE `cook_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of cook_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for cook_push_msg
-- ----------------------------
DROP TABLE IF EXISTS `cook_push_msg`;
CREATE TABLE `cook_push_msg` (
  `content` varchar(500) NOT NULL,
  `equipment_id` varchar(100) NOT NULL DEFAULT '' COMMENT '設備id或用戶id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '狀態 0未讀消息 1已讀消息',
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='未在綫記錄存儲表';

-- ----------------------------
-- Records of cook_push_msg
-- ----------------------------
INSERT INTO `cook_push_msg` VALUES ('', '01', '0', '1');
INSERT INTO `cook_push_msg` VALUES ('', '01', '0', '2');

-- ----------------------------
-- Table structure for cook_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `cook_recycle_bin`;
CREATE TABLE `cook_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT=' 回收站';

-- ----------------------------
-- Records of cook_recycle_bin
-- ----------------------------
INSERT INTO `cook_recycle_bin` VALUES ('1', '1', '1503540483', 'portal_post#page', 'asdgfa');

-- ----------------------------
-- Table structure for cook_role
-- ----------------------------
DROP TABLE IF EXISTS `cook_role`;
CREATE TABLE `cook_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cook_role
-- ----------------------------
INSERT INTO `cook_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `cook_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for cook_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cook_role_user`;
CREATE TABLE `cook_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cook_role_user
-- ----------------------------
INSERT INTO `cook_role_user` VALUES ('1', '2', '2');

-- ----------------------------
-- Table structure for cook_route
-- ----------------------------
DROP TABLE IF EXISTS `cook_route`;
CREATE TABLE `cook_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of cook_route
-- ----------------------------

-- ----------------------------
-- Table structure for cook_slide
-- ----------------------------
DROP TABLE IF EXISTS `cook_slide`;
CREATE TABLE `cook_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cook_slide
-- ----------------------------

-- ----------------------------
-- Table structure for cook_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `cook_slide_item`;
CREATE TABLE `cook_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) NOT NULL COMMENT '幻灯片描述',
  `content` text COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_cid` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of cook_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for cook_theme
-- ----------------------------
DROP TABLE IF EXISTS `cook_theme`;
CREATE TABLE `cook_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cook_theme
-- ----------------------------
INSERT INTO `cook_theme` VALUES ('19', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for cook_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `cook_theme_file`;
CREATE TABLE `cook_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cook_theme_file
-- ----------------------------
INSERT INTO `cook_theme_file` VALUES ('105', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"name\":\"hot_articles_category_id\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"name\":\"hot_articles_category_id\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO `cook_theme_file` VALUES ('106', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `cook_theme_file` VALUES ('107', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `cook_theme_file` VALUES ('108', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `cook_theme_file` VALUES ('109', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `cook_theme_file` VALUES ('110', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `cook_theme_file` VALUES ('111', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);
INSERT INTO `cook_theme_file` VALUES ('112', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);

-- ----------------------------
-- Table structure for cook_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cook_third_party_user`;
CREATE TABLE `cook_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cook_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for cook_uid
-- ----------------------------
DROP TABLE IF EXISTS `cook_uid`;
CREATE TABLE `cook_uid` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `equipment_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='硬件连接存储表';

-- ----------------------------
-- Records of cook_uid
-- ----------------------------
INSERT INTO `cook_uid` VALUES ('1', '1', '432423423');
INSERT INTO `cook_uid` VALUES ('2', '1', '32');
INSERT INTO `cook_uid` VALUES ('4', '2', '432423423');

-- ----------------------------
-- Table structure for cook_user
-- ----------------------------
DROP TABLE IF EXISTS `cook_user`;
CREATE TABLE `cook_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cook_user
-- ----------------------------
INSERT INTO `cook_user` VALUES ('1', '1', '0', '0', '1503985825', '0', '0', '1503308799', '1', 'admin', '###ec9428e2144f4b71e73123565af3c75e', 'admin', '763147498@qq.com', '', '', '', '127.0.0.1', '', '');
INSERT INTO `cook_user` VALUES ('2', '1', '0', '0', '1503588671', '0', '0', '0', '1', 'zhujinyu', '###be6012fe4c6c13f06b2ec44a5c8bbfa2', '', '133444455@qq.com', '', '', '', '127.0.0.1', '', '');

-- ----------------------------
-- Table structure for cook_users
-- ----------------------------
DROP TABLE IF EXISTS `cook_users`;
CREATE TABLE `cook_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) NOT NULL DEFAULT '0' COMMENT '连接socketID',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `oauth` varchar(30) NOT NULL COMMENT '第三方来源 google/facebook',
  `openid` varchar(200) NOT NULL COMMENT '第三方唯一标示',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别 0保密 1男 2女',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(250) NOT NULL DEFAULT '' COMMENT '头像地址',
  `token` varchar(50) NOT NULL DEFAULT '',
  `registertime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `lastlogintime` int(10) NOT NULL COMMENT '最后登录时间',
  `status` varchar(32) NOT NULL DEFAULT 'normal' COMMENT '状态 n正常 hidden禁用 deleted删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of cook_users
-- ----------------------------
INSERT INTO `cook_users` VALUES ('1', '0', '13432296614', '', '刚刚回家', '', '', '0', '13432296614', 'test12@123.com', '1bb52ac36f03dbd2c389ea4d06495623', 'https://unsplash.it/200/200?image=1', 'd694fa93b2a2b46a2c1a007a42bbdd22', '0', '1502980732', 'normal');
INSERT INTO `cook_users` VALUES ('2', '0', '2651167692@qq.com', '', '', '', '', '0', '', '2651167692@qq.com', 'c3e7fb62a9e66818812e5480f57f0f87', 'https://unsplash.it/200/200?image=26', '6a3f770e31931614f0daf36d4aaaf71a', '1502337550', '1502416447', 'normal');
INSERT INTO `cook_users` VALUES ('3', '0', '15016732682', '', '', '', '', '0', '15016732682', '', 'c3e7fb62a9e66818812e5480f57f0f87', 'https://unsplash.it/200/200?image=26', 'a0711739cbe56e10373e35014d36f9e1', '1502417189', '1502541604', 'normal');
INSERT INTO `cook_users` VALUES ('4', '0', '961161137@qq.com', '', '', '', '', '0', '', '961161137@qq.com', '1bb52ac36f03dbd2c389ea4d06495623', 'https://unsplash.it/200/200?image=5', 'a4f7d10ad566b099fce435663c999dc7', '1502423099', '1502423592', 'normal');
INSERT INTO `cook_users` VALUES ('5', '0', '18188629893', '', '', '', '', '0', '18188629893', '', 'c3e7fb62a9e66818812e5480f57f0f87', 'https://unsplash.it/200/200?image=6', '7cbf6db4800028500a3dfa22e444790b', '1502443879', '1502767303', 'normal');
INSERT INTO `cook_users` VALUES ('6', '0', '13798236070', '', '大鹏一日随风起', '', '', '0', '13798236070', '13798236070@163.com', 'c3e7fb62a9e66818812e5480f57f0f87', 'https://unsplash.it/200/200?image=1', '', '1502777194', '1502949207', 'normal');
INSERT INTO `cook_users` VALUES ('7', '0', '18675598941', '', '', '', '', '0', '18675598941', '', '06f9b834262cb0bd713445ed382646f6', 'https://unsplash.it/200/200?image=82', '8f630c14edc9bf9fcdc283c75f627811', '1502812570', '1502812893', 'normal');
INSERT INTO `cook_users` VALUES ('8', '0', '15818586162', '', 'carlos2107', '', '', '0', '15818586162', '253440708@qq.com', '9fd501a54281ebdf38057f323e25c187', 'https://unsplash.it/200/200?image=82', '865f3952aa97947127dec15fe8c43c93', '1502851594', '1502955207', 'normal');
INSERT INTO `cook_users` VALUES ('9', '0', '13017292024', '', '', '', '', '0', '13017292024', '', '1bb52ac36f03dbd2c389ea4d06495623', 'https://unsplash.it/200/200?image=69', '83decafe14e8345abff881cbbcda9c3c', '1502851941', '1503020244', 'normal');
INSERT INTO `cook_users` VALUES ('10', '0', '13751028433', '', '得到的', '', '', '0', '13751028433', 'mail@163.com', '06f9b834262cb0bd713445ed382646f6', 'https://unsplash.it/200/200?image=98', 'a80212bb3ff2f3ac7463913e76f61f03', '1502873135', '1502953095', 'normal');
INSERT INTO `cook_users` VALUES ('11', '0', '15914146067', '小猪', '风云', '', '', '1', '15914146067', '654545555@qq.com', '88796279d6ce1790518303ffb156f328', 'https://unsplash.it/200/200?image=13', '26626f1e7af751719eada79fb5c21f52', '1502952683', '1502961032', 'hidden');
INSERT INTO `cook_users` VALUES ('12', '0', '15999593250', '', '', '', '', '1', '15999593250', '', 'c3e7fb62a9e66818812e5480f57f0f87', 'https://unsplash.it/200/200?image=88', '67b08b7c7348018a6ddbeea95b34ff1a', '1502952707', '1502954654', 'normal');

-- ----------------------------
-- Table structure for cook_users_code
-- ----------------------------
DROP TABLE IF EXISTS `cook_users_code`;
CREATE TABLE `cook_users_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL COMMENT '验证码类型 注册/忘记密码/找回密码',
  `code` varchar(30) NOT NULL COMMENT '验证码',
  `from` varchar(32) NOT NULL COMMENT '手机号/邮箱',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码记录表';

-- ----------------------------
-- Records of cook_users_code
-- ----------------------------

-- ----------------------------
-- Table structure for cook_users_log
-- ----------------------------
DROP TABLE IF EXISTS `cook_users_log`;
CREATE TABLE `cook_users_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '操作内容 json格式',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作记录表';

-- ----------------------------
-- Records of cook_users_log
-- ----------------------------

-- ----------------------------
-- Table structure for cook_users_menu_log
-- ----------------------------
DROP TABLE IF EXISTS `cook_users_menu_log`;
CREATE TABLE `cook_users_menu_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜谱ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` varchar(32) NOT NULL COMMENT '类型 ''immediately'',''booking'',''cancel'',''finished'',''deleted''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='烹饪记录表';

-- ----------------------------
-- Records of cook_users_menu_log
-- ----------------------------
INSERT INTO `cook_users_menu_log` VALUES ('2', '0', '0', '0', '');

-- ----------------------------
-- Table structure for cook_users_message
-- ----------------------------
DROP TABLE IF EXISTS `cook_users_message`;
CREATE TABLE `cook_users_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(32) NOT NULL COMMENT '消息类型',
  `content` varchar(500) NOT NULL COMMENT '消息内容',
  `status` varchar(32) NOT NULL DEFAULT 'hidden' COMMENT 'h未读 normal已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户消息表';

-- ----------------------------
-- Records of cook_users_message
-- ----------------------------
INSERT INTO `cook_users_message` VALUES ('1', '1', '系统消息', 'system', '系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息', 'normal');
INSERT INTO `cook_users_message` VALUES ('2', '1', '其他消息', 'user', '其他消息其他消息其他消息其他消息其他消息其他消息其他消息其他消息其他消息', 'normal');

-- ----------------------------
-- Table structure for cook_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cook_user_action`;
CREATE TABLE `cook_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作表';

-- ----------------------------
-- Records of cook_user_action
-- ----------------------------

-- ----------------------------
-- Table structure for cook_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cook_user_action_log`;
CREATE TABLE `cook_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of cook_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cook_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cook_user_favorite`;
CREATE TABLE `cook_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cook_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for cook_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `cook_user_login_attempt`;
CREATE TABLE `cook_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of cook_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for cook_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `cook_user_score_log`;
CREATE TABLE `cook_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of cook_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for cook_user_token
-- ----------------------------
DROP TABLE IF EXISTS `cook_user_token`;
CREATE TABLE `cook_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of cook_user_token
-- ----------------------------
INSERT INTO `cook_user_token` VALUES ('3', '1', '1519537825', '1503985825', 'a795b67e18da5b8e60e12394c5d85796a795b67e18da5b8e60e12394c5d85796', 'web');
INSERT INTO `cook_user_token` VALUES ('4', '2', '1519140671', '1503588671', 'f45b3dfe44aba74236371f4388e686d7dba2d33b35250d3726610b6d92fec7ff', 'web');

-- ----------------------------
-- Table structure for cook_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `cook_verification_code`;
CREATE TABLE `cook_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of cook_verification_code
-- ----------------------------

-- ----------------------------
-- Table structure for cook_version
-- ----------------------------
DROP TABLE IF EXISTS `cook_version`;
CREATE TABLE `cook_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform` varchar(10) NOT NULL DEFAULT '' COMMENT '平台',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态 hidden取消',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='应用升级表';

-- ----------------------------
-- Records of cook_version
-- ----------------------------
INSERT INTO `cook_version` VALUES ('9', 'android', '*', '1.1.0', '18.11M', '首版本', '', '1', '1481875725', 'normal');
INSERT INTO `cook_version` VALUES ('19', 'android', '*', '1.1.1', '18.11M', '升级用户模块', '', '1', '1481875900', 'normal');
INSERT INTO `cook_version` VALUES ('20', 'android', '*', '1.1.2', '18.11M', '升级烹饪模块', '', '1', '1481875901', 'normal');

-- ----------------------------
-- Table structure for cook_warning
-- ----------------------------
DROP TABLE IF EXISTS `cook_warning`;
CREATE TABLE `cook_warning` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `equipment_id` varchar(30) NOT NULL DEFAULT '' COMMENT '设备ID',
  `user_id` int(10) NOT NULL DEFAULT '0',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '错误码',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='设备警报表';

-- ----------------------------
-- Records of cook_warning
-- ----------------------------
INSERT INTO `cook_warning` VALUES ('1', '8324u2h', '1', '23123', '1502283136');
INSERT INTO `cook_warning` VALUES ('2', '8324u2h', '1', '78358', '1502283137');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1675 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '1502343963');
INSERT INTO `test` VALUES ('2', '1502344467');
INSERT INTO `test` VALUES ('3', '1502344911');
INSERT INTO `test` VALUES ('4', '1502344911');
INSERT INTO `test` VALUES ('5', '1502348450');
INSERT INTO `test` VALUES ('6', '1502348450');
INSERT INTO `test` VALUES ('7', '1502348623');
INSERT INTO `test` VALUES ('8', '1502348624');
INSERT INTO `test` VALUES ('9', '1502348624');
INSERT INTO `test` VALUES ('10', '1502348625');
INSERT INTO `test` VALUES ('11', '1502348625');
INSERT INTO `test` VALUES ('12', '1502348625');
INSERT INTO `test` VALUES ('13', '1502348625');
INSERT INTO `test` VALUES ('14', '1502348625');
INSERT INTO `test` VALUES ('15', '1502348625');
INSERT INTO `test` VALUES ('16', '1502348626');
INSERT INTO `test` VALUES ('17', '1502348636');
INSERT INTO `test` VALUES ('18', '1502349425');
INSERT INTO `test` VALUES ('19', '1502349425');
INSERT INTO `test` VALUES ('20', '1502349449');
INSERT INTO `test` VALUES ('21', '1502349449');
INSERT INTO `test` VALUES ('22', '1502350959');
INSERT INTO `test` VALUES ('23', '1502350972');
INSERT INTO `test` VALUES ('24', '1502350972');
INSERT INTO `test` VALUES ('25', '1502351213');
INSERT INTO `test` VALUES ('26', '1502351215');
INSERT INTO `test` VALUES ('27', '1502351235');
INSERT INTO `test` VALUES ('28', '1502351246');
INSERT INTO `test` VALUES ('29', '1502351246');
INSERT INTO `test` VALUES ('30', '1502351307');
INSERT INTO `test` VALUES ('31', '1502351374');
INSERT INTO `test` VALUES ('32', '1502351382');
INSERT INTO `test` VALUES ('33', '1502351382');
INSERT INTO `test` VALUES ('34', '1502351558');
INSERT INTO `test` VALUES ('35', '1502351575');
INSERT INTO `test` VALUES ('36', '1502351575');
INSERT INTO `test` VALUES ('37', '1502351604');
INSERT INTO `test` VALUES ('38', '1502351614');
INSERT INTO `test` VALUES ('39', '1502351614');
INSERT INTO `test` VALUES ('40', '1502351722');
INSERT INTO `test` VALUES ('41', '1502351736');
INSERT INTO `test` VALUES ('42', '1502351740');
INSERT INTO `test` VALUES ('43', '1502351874');
INSERT INTO `test` VALUES ('44', '1502351883');
INSERT INTO `test` VALUES ('45', '1502351885');
INSERT INTO `test` VALUES ('46', '1502351900');
INSERT INTO `test` VALUES ('47', '1502351906');
INSERT INTO `test` VALUES ('48', '1502351917');
INSERT INTO `test` VALUES ('49', '1502351924');
INSERT INTO `test` VALUES ('50', '1502351936');
INSERT INTO `test` VALUES ('51', '1502351951');
INSERT INTO `test` VALUES ('52', '1502351986');
INSERT INTO `test` VALUES ('53', '1502352000');
INSERT INTO `test` VALUES ('54', '1502352091');
INSERT INTO `test` VALUES ('55', '1502352094');
INSERT INTO `test` VALUES ('56', '1502352341');
INSERT INTO `test` VALUES ('57', '1502352345');
INSERT INTO `test` VALUES ('58', '1502352345');
INSERT INTO `test` VALUES ('59', '1502352490');
INSERT INTO `test` VALUES ('60', '1502352503');
INSERT INTO `test` VALUES ('61', '1502352509');
INSERT INTO `test` VALUES ('62', '1502352509');
INSERT INTO `test` VALUES ('63', '1502352596');
INSERT INTO `test` VALUES ('64', '1502352603');
INSERT INTO `test` VALUES ('65', '1502352603');
INSERT INTO `test` VALUES ('66', '1502352615');
INSERT INTO `test` VALUES ('67', '1502352615');
INSERT INTO `test` VALUES ('68', '1502352684');
INSERT INTO `test` VALUES ('69', '1502352685');
INSERT INTO `test` VALUES ('70', '1502352748');
INSERT INTO `test` VALUES ('71', '1502352748');
INSERT INTO `test` VALUES ('72', '1502352765');
INSERT INTO `test` VALUES ('73', '1502352767');
INSERT INTO `test` VALUES ('74', '1502352773');
INSERT INTO `test` VALUES ('75', '1502352773');
INSERT INTO `test` VALUES ('76', '1502352946');
INSERT INTO `test` VALUES ('77', '1502352954');
INSERT INTO `test` VALUES ('78', '1502352962');
INSERT INTO `test` VALUES ('79', '1502352962');
INSERT INTO `test` VALUES ('80', '1502353137');
INSERT INTO `test` VALUES ('81', '1502353142');
INSERT INTO `test` VALUES ('82', '1502353142');
INSERT INTO `test` VALUES ('83', '1502353417');
INSERT INTO `test` VALUES ('84', '1502353428');
INSERT INTO `test` VALUES ('85', '1502353431');
INSERT INTO `test` VALUES ('86', '1502353480');
INSERT INTO `test` VALUES ('87', '1502353484');
INSERT INTO `test` VALUES ('88', '1502353570');
INSERT INTO `test` VALUES ('89', '1502353578');
INSERT INTO `test` VALUES ('90', '1502353581');
INSERT INTO `test` VALUES ('91', '1502353789');
INSERT INTO `test` VALUES ('92', '1502353792');
INSERT INTO `test` VALUES ('93', '1502353792');
INSERT INTO `test` VALUES ('94', '1502353930');
INSERT INTO `test` VALUES ('95', '1502353937');
INSERT INTO `test` VALUES ('96', '1502353939');
INSERT INTO `test` VALUES ('97', '1502354085');
INSERT INTO `test` VALUES ('98', '1502354092');
INSERT INTO `test` VALUES ('99', '1502354093');
INSERT INTO `test` VALUES ('100', '1502354155');
INSERT INTO `test` VALUES ('101', '1502354161');
INSERT INTO `test` VALUES ('102', '1502354161');
INSERT INTO `test` VALUES ('103', '1502354255');
INSERT INTO `test` VALUES ('104', '1502354261');
INSERT INTO `test` VALUES ('105', '1502354261');
INSERT INTO `test` VALUES ('106', '1502354434');
INSERT INTO `test` VALUES ('107', '1502354442');
INSERT INTO `test` VALUES ('108', '1502354442');
INSERT INTO `test` VALUES ('109', '1502354514');
INSERT INTO `test` VALUES ('110', '1502354518');
INSERT INTO `test` VALUES ('111', '1502354518');
INSERT INTO `test` VALUES ('112', '1502354587');
INSERT INTO `test` VALUES ('113', '1502354590');
INSERT INTO `test` VALUES ('114', '1502354590');
INSERT INTO `test` VALUES ('115', '1502356684');
INSERT INTO `test` VALUES ('116', '1502356687');
INSERT INTO `test` VALUES ('117', '1502356687');
INSERT INTO `test` VALUES ('118', '1502356795');
INSERT INTO `test` VALUES ('119', '1502356796');
INSERT INTO `test` VALUES ('120', '1502356815');
INSERT INTO `test` VALUES ('121', '1502356815');
INSERT INTO `test` VALUES ('122', '1502356835');
INSERT INTO `test` VALUES ('123', '1502356836');
INSERT INTO `test` VALUES ('124', '1502356960');
INSERT INTO `test` VALUES ('125', '1502356972');
INSERT INTO `test` VALUES ('126', '1502356972');
INSERT INTO `test` VALUES ('127', '1502357081');
INSERT INTO `test` VALUES ('128', '1502357092');
INSERT INTO `test` VALUES ('129', '1502357093');
INSERT INTO `test` VALUES ('130', '1502357177');
INSERT INTO `test` VALUES ('131', '1502357192');
INSERT INTO `test` VALUES ('132', '1502357194');
INSERT INTO `test` VALUES ('133', '1502357328');
INSERT INTO `test` VALUES ('134', '1502357337');
INSERT INTO `test` VALUES ('135', '1502357339');
INSERT INTO `test` VALUES ('136', '1502357789');
INSERT INTO `test` VALUES ('137', '1502357800');
INSERT INTO `test` VALUES ('138', '1502357802');
INSERT INTO `test` VALUES ('139', '1502357875');
INSERT INTO `test` VALUES ('140', '1502357886');
INSERT INTO `test` VALUES ('141', '1502357887');
INSERT INTO `test` VALUES ('142', '1502358120');
INSERT INTO `test` VALUES ('143', '1502358123');
INSERT INTO `test` VALUES ('144', '1502358123');
INSERT INTO `test` VALUES ('145', '1502358800');
INSERT INTO `test` VALUES ('146', '1502358804');
INSERT INTO `test` VALUES ('147', '1502358804');
INSERT INTO `test` VALUES ('148', '1502359234');
INSERT INTO `test` VALUES ('149', '1502359239');
INSERT INTO `test` VALUES ('150', '1502359239');
INSERT INTO `test` VALUES ('151', '1502359430');
INSERT INTO `test` VALUES ('152', '1502359433');
INSERT INTO `test` VALUES ('153', '1502359433');
INSERT INTO `test` VALUES ('154', '1502359837');
INSERT INTO `test` VALUES ('155', '1502359848');
INSERT INTO `test` VALUES ('156', '1502359848');
INSERT INTO `test` VALUES ('157', '1502359931');
INSERT INTO `test` VALUES ('158', '1502359931');
INSERT INTO `test` VALUES ('159', '1502360058');
INSERT INTO `test` VALUES ('160', '1502360062');
INSERT INTO `test` VALUES ('161', '1502360062');
INSERT INTO `test` VALUES ('162', '1502360151');
INSERT INTO `test` VALUES ('163', '1502360155');
INSERT INTO `test` VALUES ('164', '1502360155');
INSERT INTO `test` VALUES ('165', '1502360304');
INSERT INTO `test` VALUES ('166', '1502360309');
INSERT INTO `test` VALUES ('167', '1502360309');
INSERT INTO `test` VALUES ('168', '1502360484');
INSERT INTO `test` VALUES ('169', '1502360497');
INSERT INTO `test` VALUES ('170', '1502360502');
INSERT INTO `test` VALUES ('171', '1502360502');
INSERT INTO `test` VALUES ('172', '1502360614');
INSERT INTO `test` VALUES ('173', '1502360619');
INSERT INTO `test` VALUES ('174', '1502360619');
INSERT INTO `test` VALUES ('175', '1502360769');
INSERT INTO `test` VALUES ('176', '1502360774');
INSERT INTO `test` VALUES ('177', '1502360774');
INSERT INTO `test` VALUES ('178', '1502365491');
INSERT INTO `test` VALUES ('179', '1502365496');
INSERT INTO `test` VALUES ('180', '1502365496');
INSERT INTO `test` VALUES ('181', '1502365534');
INSERT INTO `test` VALUES ('182', '1502365539');
INSERT INTO `test` VALUES ('183', '1502365539');
INSERT INTO `test` VALUES ('184', '1502366519');
INSERT INTO `test` VALUES ('185', '1502366523');
INSERT INTO `test` VALUES ('186', '1502366523');
INSERT INTO `test` VALUES ('187', '1502366560');
INSERT INTO `test` VALUES ('188', '1502366563');
INSERT INTO `test` VALUES ('189', '1502366564');
INSERT INTO `test` VALUES ('190', '1502366638');
INSERT INTO `test` VALUES ('191', '1502366642');
INSERT INTO `test` VALUES ('192', '1502366642');
INSERT INTO `test` VALUES ('193', '1502366804');
INSERT INTO `test` VALUES ('194', '1502366807');
INSERT INTO `test` VALUES ('195', '1502366808');
INSERT INTO `test` VALUES ('196', '1502366855');
INSERT INTO `test` VALUES ('197', '1502366859');
INSERT INTO `test` VALUES ('198', '1502366859');
INSERT INTO `test` VALUES ('199', '1502367408');
INSERT INTO `test` VALUES ('200', '1502367415');
INSERT INTO `test` VALUES ('201', '1502367415');
INSERT INTO `test` VALUES ('202', '1502367578');
INSERT INTO `test` VALUES ('203', '1502367596');
INSERT INTO `test` VALUES ('204', '1502367598');
INSERT INTO `test` VALUES ('205', '1502367864');
INSERT INTO `test` VALUES ('206', '1502367887');
INSERT INTO `test` VALUES ('207', '1502367894');
INSERT INTO `test` VALUES ('208', '1502367963');
INSERT INTO `test` VALUES ('209', '1502367979');
INSERT INTO `test` VALUES ('210', '1502367981');
INSERT INTO `test` VALUES ('211', '1502369698');
INSERT INTO `test` VALUES ('212', '1502369698');
INSERT INTO `test` VALUES ('213', '1502369719');
INSERT INTO `test` VALUES ('214', '1502369721');
INSERT INTO `test` VALUES ('215', '1502369721');
INSERT INTO `test` VALUES ('216', '1502369822');
INSERT INTO `test` VALUES ('217', '1502369824');
INSERT INTO `test` VALUES ('218', '1502369824');
INSERT INTO `test` VALUES ('219', '1502370341');
INSERT INTO `test` VALUES ('220', '1502370383');
INSERT INTO `test` VALUES ('221', '1502370391');
INSERT INTO `test` VALUES ('222', '1502370391');
INSERT INTO `test` VALUES ('223', '1502370528');
INSERT INTO `test` VALUES ('224', '1502370532');
INSERT INTO `test` VALUES ('225', '1502370532');
INSERT INTO `test` VALUES ('226', '1502371989');
INSERT INTO `test` VALUES ('227', '1502371994');
INSERT INTO `test` VALUES ('228', '1502371994');
INSERT INTO `test` VALUES ('229', '1502372014');
INSERT INTO `test` VALUES ('230', '1502372018');
INSERT INTO `test` VALUES ('231', '1502372018');
INSERT INTO `test` VALUES ('232', '1502372123');
INSERT INTO `test` VALUES ('233', '1502372128');
INSERT INTO `test` VALUES ('234', '1502372128');
INSERT INTO `test` VALUES ('235', '1502422188');
INSERT INTO `test` VALUES ('236', '1502422319');
INSERT INTO `test` VALUES ('237', '1502422354');
INSERT INTO `test` VALUES ('238', '1502422408');
INSERT INTO `test` VALUES ('239', '1502422408');
INSERT INTO `test` VALUES ('240', '1502518586');
INSERT INTO `test` VALUES ('241', '1502518591');
INSERT INTO `test` VALUES ('242', '1502518757');
INSERT INTO `test` VALUES ('243', '1502518967');
INSERT INTO `test` VALUES ('244', '1502519147');
INSERT INTO `test` VALUES ('245', '1502519327');
INSERT INTO `test` VALUES ('246', '1502519507');
INSERT INTO `test` VALUES ('247', '1502519687');
INSERT INTO `test` VALUES ('248', '1502519867');
INSERT INTO `test` VALUES ('249', '1502520006');
INSERT INTO `test` VALUES ('250', '1502520008');
INSERT INTO `test` VALUES ('251', '1502520020');
INSERT INTO `test` VALUES ('252', '1502520021');
INSERT INTO `test` VALUES ('253', '1502520021');
INSERT INTO `test` VALUES ('254', '1502520022');
INSERT INTO `test` VALUES ('255', '1502520022');
INSERT INTO `test` VALUES ('256', '1502520022');
INSERT INTO `test` VALUES ('257', '1502520022');
INSERT INTO `test` VALUES ('258', '1502520023');
INSERT INTO `test` VALUES ('259', '1502520109');
INSERT INTO `test` VALUES ('260', '1502520205');
INSERT INTO `test` VALUES ('261', '1502520289');
INSERT INTO `test` VALUES ('262', '1502520469');
INSERT INTO `test` VALUES ('263', '1502520649');
INSERT INTO `test` VALUES ('264', '1502520829');
INSERT INTO `test` VALUES ('265', '1502521009');
INSERT INTO `test` VALUES ('266', '1502521189');
INSERT INTO `test` VALUES ('267', '1502521369');
INSERT INTO `test` VALUES ('268', '1502521549');
INSERT INTO `test` VALUES ('269', '1502521729');
INSERT INTO `test` VALUES ('270', '1502521909');
INSERT INTO `test` VALUES ('271', '1502522089');
INSERT INTO `test` VALUES ('272', '1502522269');
INSERT INTO `test` VALUES ('273', '1502522449');
INSERT INTO `test` VALUES ('274', '1502522629');
INSERT INTO `test` VALUES ('275', '1502522809');
INSERT INTO `test` VALUES ('276', '1502522989');
INSERT INTO `test` VALUES ('277', '1502523169');
INSERT INTO `test` VALUES ('278', '1502523349');
INSERT INTO `test` VALUES ('279', '1502523529');
INSERT INTO `test` VALUES ('280', '1502523709');
INSERT INTO `test` VALUES ('281', '1502523889');
INSERT INTO `test` VALUES ('282', '1502524135');
INSERT INTO `test` VALUES ('283', '1502524315');
INSERT INTO `test` VALUES ('284', '1502525881');
INSERT INTO `test` VALUES ('285', '1502526046');
INSERT INTO `test` VALUES ('286', '1502526226');
INSERT INTO `test` VALUES ('287', '1502526406');
INSERT INTO `test` VALUES ('288', '1502526594');
INSERT INTO `test` VALUES ('289', '1502526816');
INSERT INTO `test` VALUES ('290', '1502526821');
INSERT INTO `test` VALUES ('291', '1502528062');
INSERT INTO `test` VALUES ('292', '1502528340');
INSERT INTO `test` VALUES ('293', '1502528411');
INSERT INTO `test` VALUES ('294', '1502528465');
INSERT INTO `test` VALUES ('295', '1502528518');
INSERT INTO `test` VALUES ('296', '1502528669');
INSERT INTO `test` VALUES ('297', '1502528713');
INSERT INTO `test` VALUES ('298', '1502529739');
INSERT INTO `test` VALUES ('299', '1502530005');
INSERT INTO `test` VALUES ('300', '1502530327');
INSERT INTO `test` VALUES ('301', '1502530431');
INSERT INTO `test` VALUES ('302', '1502530588');
INSERT INTO `test` VALUES ('303', '1502531082');
INSERT INTO `test` VALUES ('304', '1502531438');
INSERT INTO `test` VALUES ('305', '1502531501');
INSERT INTO `test` VALUES ('306', '1502532504');
INSERT INTO `test` VALUES ('307', '1502532604');
INSERT INTO `test` VALUES ('308', '1502532842');
INSERT INTO `test` VALUES ('309', '1502532844');
INSERT INTO `test` VALUES ('310', '1502532846');
INSERT INTO `test` VALUES ('311', '1502532854');
INSERT INTO `test` VALUES ('312', '1502532854');
INSERT INTO `test` VALUES ('313', '1502532854');
INSERT INTO `test` VALUES ('314', '1502532854');
INSERT INTO `test` VALUES ('315', '1502532854');
INSERT INTO `test` VALUES ('316', '1502532902');
INSERT INTO `test` VALUES ('317', '1502532902');
INSERT INTO `test` VALUES ('318', '1502532902');
INSERT INTO `test` VALUES ('319', '1502532902');
INSERT INTO `test` VALUES ('320', '1502532902');
INSERT INTO `test` VALUES ('321', '1502532903');
INSERT INTO `test` VALUES ('322', '1502532903');
INSERT INTO `test` VALUES ('323', '1502532903');
INSERT INTO `test` VALUES ('324', '1502532903');
INSERT INTO `test` VALUES ('325', '1502532903');
INSERT INTO `test` VALUES ('326', '1502532903');
INSERT INTO `test` VALUES ('327', '1502532903');
INSERT INTO `test` VALUES ('328', '1502532904');
INSERT INTO `test` VALUES ('329', '1502532904');
INSERT INTO `test` VALUES ('330', '1502532904');
INSERT INTO `test` VALUES ('331', '1502532904');
INSERT INTO `test` VALUES ('332', '1502532933');
INSERT INTO `test` VALUES ('333', '1502532941');
INSERT INTO `test` VALUES ('334', '1502532944');
INSERT INTO `test` VALUES ('335', '1502532946');
INSERT INTO `test` VALUES ('336', '1502532949');
INSERT INTO `test` VALUES ('337', '1502532962');
INSERT INTO `test` VALUES ('338', '1502532987');
INSERT INTO `test` VALUES ('339', '1502532990');
INSERT INTO `test` VALUES ('340', '1502532995');
INSERT INTO `test` VALUES ('341', '1502532997');
INSERT INTO `test` VALUES ('342', '1502533002');
INSERT INTO `test` VALUES ('343', '1502533008');
INSERT INTO `test` VALUES ('344', '1502533010');
INSERT INTO `test` VALUES ('345', '1502533011');
INSERT INTO `test` VALUES ('346', '1502533015');
INSERT INTO `test` VALUES ('347', '1502533015');
INSERT INTO `test` VALUES ('348', '1502533015');
INSERT INTO `test` VALUES ('349', '1502533015');
INSERT INTO `test` VALUES ('350', '1502533015');
INSERT INTO `test` VALUES ('351', '1502533015');
INSERT INTO `test` VALUES ('352', '1502533015');
INSERT INTO `test` VALUES ('353', '1502533016');
INSERT INTO `test` VALUES ('354', '1502533016');
INSERT INTO `test` VALUES ('355', '1502533016');
INSERT INTO `test` VALUES ('356', '1502533016');
INSERT INTO `test` VALUES ('357', '1502533016');
INSERT INTO `test` VALUES ('358', '1502533016');
INSERT INTO `test` VALUES ('359', '1502533016');
INSERT INTO `test` VALUES ('360', '1502533017');
INSERT INTO `test` VALUES ('361', '1502533017');
INSERT INTO `test` VALUES ('362', '1502533017');
INSERT INTO `test` VALUES ('363', '1502533017');
INSERT INTO `test` VALUES ('364', '1502533017');
INSERT INTO `test` VALUES ('365', '1502533017');
INSERT INTO `test` VALUES ('366', '1502533017');
INSERT INTO `test` VALUES ('367', '1502533018');
INSERT INTO `test` VALUES ('368', '1502533018');
INSERT INTO `test` VALUES ('369', '1502533018');
INSERT INTO `test` VALUES ('370', '1502533018');
INSERT INTO `test` VALUES ('371', '1502533018');
INSERT INTO `test` VALUES ('372', '1502533018');
INSERT INTO `test` VALUES ('373', '1502533018');
INSERT INTO `test` VALUES ('374', '1502533019');
INSERT INTO `test` VALUES ('375', '1502533019');
INSERT INTO `test` VALUES ('376', '1502533019');
INSERT INTO `test` VALUES ('377', '1502533019');
INSERT INTO `test` VALUES ('378', '1502533019');
INSERT INTO `test` VALUES ('379', '1502533019');
INSERT INTO `test` VALUES ('380', '1502533019');
INSERT INTO `test` VALUES ('381', '1502533020');
INSERT INTO `test` VALUES ('382', '1502533020');
INSERT INTO `test` VALUES ('383', '1502533020');
INSERT INTO `test` VALUES ('384', '1502533020');
INSERT INTO `test` VALUES ('385', '1502533020');
INSERT INTO `test` VALUES ('386', '1502533020');
INSERT INTO `test` VALUES ('387', '1502533021');
INSERT INTO `test` VALUES ('388', '1502533021');
INSERT INTO `test` VALUES ('389', '1502533021');
INSERT INTO `test` VALUES ('390', '1502533021');
INSERT INTO `test` VALUES ('391', '1502533021');
INSERT INTO `test` VALUES ('392', '1502533021');
INSERT INTO `test` VALUES ('393', '1502533021');
INSERT INTO `test` VALUES ('394', '1502533022');
INSERT INTO `test` VALUES ('395', '1502533022');
INSERT INTO `test` VALUES ('396', '1502533022');
INSERT INTO `test` VALUES ('397', '1502533022');
INSERT INTO `test` VALUES ('398', '1502533022');
INSERT INTO `test` VALUES ('399', '1502533022');
INSERT INTO `test` VALUES ('400', '1502533022');
INSERT INTO `test` VALUES ('401', '1502533023');
INSERT INTO `test` VALUES ('402', '1502533023');
INSERT INTO `test` VALUES ('403', '1502533023');
INSERT INTO `test` VALUES ('404', '1502533023');
INSERT INTO `test` VALUES ('405', '1502533023');
INSERT INTO `test` VALUES ('406', '1502533023');
INSERT INTO `test` VALUES ('407', '1502533023');
INSERT INTO `test` VALUES ('408', '1502533024');
INSERT INTO `test` VALUES ('409', '1502533024');
INSERT INTO `test` VALUES ('410', '1502533024');
INSERT INTO `test` VALUES ('411', '1502533024');
INSERT INTO `test` VALUES ('412', '1502533024');
INSERT INTO `test` VALUES ('413', '1502533024');
INSERT INTO `test` VALUES ('414', '1502533025');
INSERT INTO `test` VALUES ('415', '1502533025');
INSERT INTO `test` VALUES ('416', '1502533025');
INSERT INTO `test` VALUES ('417', '1502533025');
INSERT INTO `test` VALUES ('418', '1502533025');
INSERT INTO `test` VALUES ('419', '1502533025');
INSERT INTO `test` VALUES ('420', '1502533025');
INSERT INTO `test` VALUES ('421', '1502533026');
INSERT INTO `test` VALUES ('422', '1502533026');
INSERT INTO `test` VALUES ('423', '1502533026');
INSERT INTO `test` VALUES ('424', '1502533026');
INSERT INTO `test` VALUES ('425', '1502533026');
INSERT INTO `test` VALUES ('426', '1502533026');
INSERT INTO `test` VALUES ('427', '1502533026');
INSERT INTO `test` VALUES ('428', '1502533027');
INSERT INTO `test` VALUES ('429', '1502533027');
INSERT INTO `test` VALUES ('430', '1502533027');
INSERT INTO `test` VALUES ('431', '1502533027');
INSERT INTO `test` VALUES ('432', '1502533027');
INSERT INTO `test` VALUES ('433', '1502533027');
INSERT INTO `test` VALUES ('434', '1502533027');
INSERT INTO `test` VALUES ('435', '1502533028');
INSERT INTO `test` VALUES ('436', '1502533028');
INSERT INTO `test` VALUES ('437', '1502533028');
INSERT INTO `test` VALUES ('438', '1502533028');
INSERT INTO `test` VALUES ('439', '1502533028');
INSERT INTO `test` VALUES ('440', '1502533028');
INSERT INTO `test` VALUES ('441', '1502533028');
INSERT INTO `test` VALUES ('442', '1502533029');
INSERT INTO `test` VALUES ('443', '1502533029');
INSERT INTO `test` VALUES ('444', '1502533029');
INSERT INTO `test` VALUES ('445', '1502533029');
INSERT INTO `test` VALUES ('446', '1502533029');
INSERT INTO `test` VALUES ('447', '1502533029');
INSERT INTO `test` VALUES ('448', '1502533029');
INSERT INTO `test` VALUES ('449', '1502533030');
INSERT INTO `test` VALUES ('450', '1502533030');
INSERT INTO `test` VALUES ('451', '1502533030');
INSERT INTO `test` VALUES ('452', '1502533030');
INSERT INTO `test` VALUES ('453', '1502533030');
INSERT INTO `test` VALUES ('454', '1502533030');
INSERT INTO `test` VALUES ('455', '1502533030');
INSERT INTO `test` VALUES ('456', '1502533031');
INSERT INTO `test` VALUES ('457', '1502533031');
INSERT INTO `test` VALUES ('458', '1502533031');
INSERT INTO `test` VALUES ('459', '1502533031');
INSERT INTO `test` VALUES ('460', '1502533031');
INSERT INTO `test` VALUES ('461', '1502533031');
INSERT INTO `test` VALUES ('462', '1502533032');
INSERT INTO `test` VALUES ('463', '1502533032');
INSERT INTO `test` VALUES ('464', '1502533032');
INSERT INTO `test` VALUES ('465', '1502533032');
INSERT INTO `test` VALUES ('466', '1502533032');
INSERT INTO `test` VALUES ('467', '1502533032');
INSERT INTO `test` VALUES ('468', '1502533032');
INSERT INTO `test` VALUES ('469', '1502533033');
INSERT INTO `test` VALUES ('470', '1502533033');
INSERT INTO `test` VALUES ('471', '1502533033');
INSERT INTO `test` VALUES ('472', '1502533033');
INSERT INTO `test` VALUES ('473', '1502533033');
INSERT INTO `test` VALUES ('474', '1502533033');
INSERT INTO `test` VALUES ('475', '1502533033');
INSERT INTO `test` VALUES ('476', '1502533034');
INSERT INTO `test` VALUES ('477', '1502533034');
INSERT INTO `test` VALUES ('478', '1502533034');
INSERT INTO `test` VALUES ('479', '1502533034');
INSERT INTO `test` VALUES ('480', '1502533034');
INSERT INTO `test` VALUES ('481', '1502533034');
INSERT INTO `test` VALUES ('482', '1502533034');
INSERT INTO `test` VALUES ('483', '1502533035');
INSERT INTO `test` VALUES ('484', '1502533035');
INSERT INTO `test` VALUES ('485', '1502533035');
INSERT INTO `test` VALUES ('486', '1502533035');
INSERT INTO `test` VALUES ('487', '1502533035');
INSERT INTO `test` VALUES ('488', '1502533035');
INSERT INTO `test` VALUES ('489', '1502533036');
INSERT INTO `test` VALUES ('490', '1502533036');
INSERT INTO `test` VALUES ('491', '1502533036');
INSERT INTO `test` VALUES ('492', '1502533036');
INSERT INTO `test` VALUES ('493', '1502533036');
INSERT INTO `test` VALUES ('494', '1502533036');
INSERT INTO `test` VALUES ('495', '1502533037');
INSERT INTO `test` VALUES ('496', '1502533037');
INSERT INTO `test` VALUES ('497', '1502533037');
INSERT INTO `test` VALUES ('498', '1502533037');
INSERT INTO `test` VALUES ('499', '1502533037');
INSERT INTO `test` VALUES ('500', '1502533037');
INSERT INTO `test` VALUES ('501', '1502533037');
INSERT INTO `test` VALUES ('502', '1502533038');
INSERT INTO `test` VALUES ('503', '1502533038');
INSERT INTO `test` VALUES ('504', '1502533038');
INSERT INTO `test` VALUES ('505', '1502533038');
INSERT INTO `test` VALUES ('506', '1502533038');
INSERT INTO `test` VALUES ('507', '1502533038');
INSERT INTO `test` VALUES ('508', '1502533038');
INSERT INTO `test` VALUES ('509', '1502533039');
INSERT INTO `test` VALUES ('510', '1502533039');
INSERT INTO `test` VALUES ('511', '1502533039');
INSERT INTO `test` VALUES ('512', '1502533039');
INSERT INTO `test` VALUES ('513', '1502533039');
INSERT INTO `test` VALUES ('514', '1502533039');
INSERT INTO `test` VALUES ('515', '1502533039');
INSERT INTO `test` VALUES ('516', '1502533040');
INSERT INTO `test` VALUES ('517', '1502533040');
INSERT INTO `test` VALUES ('518', '1502533040');
INSERT INTO `test` VALUES ('519', '1502533040');
INSERT INTO `test` VALUES ('520', '1502533040');
INSERT INTO `test` VALUES ('521', '1502533040');
INSERT INTO `test` VALUES ('522', '1502533041');
INSERT INTO `test` VALUES ('523', '1502533041');
INSERT INTO `test` VALUES ('524', '1502533041');
INSERT INTO `test` VALUES ('525', '1502533041');
INSERT INTO `test` VALUES ('526', '1502533041');
INSERT INTO `test` VALUES ('527', '1502533041');
INSERT INTO `test` VALUES ('528', '1502533041');
INSERT INTO `test` VALUES ('529', '1502533042');
INSERT INTO `test` VALUES ('530', '1502533042');
INSERT INTO `test` VALUES ('531', '1502533042');
INSERT INTO `test` VALUES ('532', '1502533042');
INSERT INTO `test` VALUES ('533', '1502533042');
INSERT INTO `test` VALUES ('534', '1502533042');
INSERT INTO `test` VALUES ('535', '1502533043');
INSERT INTO `test` VALUES ('536', '1502533043');
INSERT INTO `test` VALUES ('537', '1502533043');
INSERT INTO `test` VALUES ('538', '1502533043');
INSERT INTO `test` VALUES ('539', '1502533043');
INSERT INTO `test` VALUES ('540', '1502533043');
INSERT INTO `test` VALUES ('541', '1502533043');
INSERT INTO `test` VALUES ('542', '1502533044');
INSERT INTO `test` VALUES ('543', '1502533044');
INSERT INTO `test` VALUES ('544', '1502533044');
INSERT INTO `test` VALUES ('545', '1502533044');
INSERT INTO `test` VALUES ('546', '1502533044');
INSERT INTO `test` VALUES ('547', '1502533044');
INSERT INTO `test` VALUES ('548', '1502533045');
INSERT INTO `test` VALUES ('549', '1502533045');
INSERT INTO `test` VALUES ('550', '1502533045');
INSERT INTO `test` VALUES ('551', '1502533057');
INSERT INTO `test` VALUES ('552', '1502533058');
INSERT INTO `test` VALUES ('553', '1502533058');
INSERT INTO `test` VALUES ('554', '1502533058');
INSERT INTO `test` VALUES ('555', '1502533058');
INSERT INTO `test` VALUES ('556', '1502533169');
INSERT INTO `test` VALUES ('557', '1502533180');
INSERT INTO `test` VALUES ('558', '1502533190');
INSERT INTO `test` VALUES ('559', '1502533205');
INSERT INTO `test` VALUES ('560', '1502533205');
INSERT INTO `test` VALUES ('561', '1502533205');
INSERT INTO `test` VALUES ('562', '1502533205');
INSERT INTO `test` VALUES ('563', '1502533312');
INSERT INTO `test` VALUES ('564', '1502533342');
INSERT INTO `test` VALUES ('565', '1502533494');
INSERT INTO `test` VALUES ('566', '1502533522');
INSERT INTO `test` VALUES ('567', '1502533794');
INSERT INTO `test` VALUES ('568', '1502533852');
INSERT INTO `test` VALUES ('569', '1502533874');
INSERT INTO `test` VALUES ('570', '1502533910');
INSERT INTO `test` VALUES ('571', '1502533911');
INSERT INTO `test` VALUES ('572', '1502533911');
INSERT INTO `test` VALUES ('573', '1502533912');
INSERT INTO `test` VALUES ('574', '1502533915');
INSERT INTO `test` VALUES ('575', '1502533915');
INSERT INTO `test` VALUES ('576', '1502533996');
INSERT INTO `test` VALUES ('577', '1502533996');
INSERT INTO `test` VALUES ('578', '1502534039');
INSERT INTO `test` VALUES ('579', '1502534042');
INSERT INTO `test` VALUES ('580', '1502534057');
INSERT INTO `test` VALUES ('581', '1502534058');
INSERT INTO `test` VALUES ('582', '1502534123');
INSERT INTO `test` VALUES ('583', '1502534160');
INSERT INTO `test` VALUES ('584', '1502534256');
INSERT INTO `test` VALUES ('585', '1502534261');
INSERT INTO `test` VALUES ('586', '1502534308');
INSERT INTO `test` VALUES ('587', '1502534309');
INSERT INTO `test` VALUES ('588', '1502534367');
INSERT INTO `test` VALUES ('589', '1502534375');
INSERT INTO `test` VALUES ('590', '1502534391');
INSERT INTO `test` VALUES ('591', '1502534391');
INSERT INTO `test` VALUES ('592', '1502534397');
INSERT INTO `test` VALUES ('593', '1502534397');
INSERT INTO `test` VALUES ('594', '1502534420');
INSERT INTO `test` VALUES ('595', '1502534469');
INSERT INTO `test` VALUES ('596', '1502534473');
INSERT INTO `test` VALUES ('597', '1502534473');
INSERT INTO `test` VALUES ('598', '1502534485');
INSERT INTO `test` VALUES ('599', '1502534530');
INSERT INTO `test` VALUES ('600', '1502534530');
INSERT INTO `test` VALUES ('601', '1502534542');
INSERT INTO `test` VALUES ('602', '1502534542');
INSERT INTO `test` VALUES ('603', '1502534593');
INSERT INTO `test` VALUES ('604', '1502534601');
INSERT INTO `test` VALUES ('605', '1502534609');
INSERT INTO `test` VALUES ('606', '1502534609');
INSERT INTO `test` VALUES ('607', '1502534614');
INSERT INTO `test` VALUES ('608', '1502534869');
INSERT INTO `test` VALUES ('609', '1502534869');
INSERT INTO `test` VALUES ('610', '1502534875');
INSERT INTO `test` VALUES ('611', '1502534875');
INSERT INTO `test` VALUES ('612', '1502534880');
INSERT INTO `test` VALUES ('613', '1502534942');
INSERT INTO `test` VALUES ('614', '1502534945');
INSERT INTO `test` VALUES ('615', '1502535031');
INSERT INTO `test` VALUES ('616', '1502535102');
INSERT INTO `test` VALUES ('617', '1502535158');
INSERT INTO `test` VALUES ('618', '1502535165');
INSERT INTO `test` VALUES ('619', '1502535165');
INSERT INTO `test` VALUES ('620', '1502535181');
INSERT INTO `test` VALUES ('621', '1502535184');
INSERT INTO `test` VALUES ('622', '1502538548');
INSERT INTO `test` VALUES ('623', '1502538568');
INSERT INTO `test` VALUES ('624', '1502538629');
INSERT INTO `test` VALUES ('625', '1502538635');
INSERT INTO `test` VALUES ('626', '1502538637');
INSERT INTO `test` VALUES ('627', '1502538638');
INSERT INTO `test` VALUES ('628', '1502538644');
INSERT INTO `test` VALUES ('629', '1502538646');
INSERT INTO `test` VALUES ('630', '1502538721');
INSERT INTO `test` VALUES ('631', '1502538739');
INSERT INTO `test` VALUES ('632', '1502538766');
INSERT INTO `test` VALUES ('633', '1502538778');
INSERT INTO `test` VALUES ('634', '1502538841');
INSERT INTO `test` VALUES ('635', '1502538933');
INSERT INTO `test` VALUES ('636', '1502538952');
INSERT INTO `test` VALUES ('637', '1502538958');
INSERT INTO `test` VALUES ('638', '1502539019');
INSERT INTO `test` VALUES ('639', '1502539049');
INSERT INTO `test` VALUES ('640', '1502539059');
INSERT INTO `test` VALUES ('641', '1502539149');
INSERT INTO `test` VALUES ('642', '1502539156');
INSERT INTO `test` VALUES ('643', '1502539253');
INSERT INTO `test` VALUES ('644', '1502539256');
INSERT INTO `test` VALUES ('645', '1502539264');
INSERT INTO `test` VALUES ('646', '1502539279');
INSERT INTO `test` VALUES ('647', '1502539316');
INSERT INTO `test` VALUES ('648', '1502539318');
INSERT INTO `test` VALUES ('649', '1502539328');
INSERT INTO `test` VALUES ('650', '1502539343');
INSERT INTO `test` VALUES ('651', '1502539343');
INSERT INTO `test` VALUES ('652', '1502539348');
INSERT INTO `test` VALUES ('653', '1502539400');
INSERT INTO `test` VALUES ('654', '1502539409');
INSERT INTO `test` VALUES ('655', '1502539413');
INSERT INTO `test` VALUES ('656', '1502539429');
INSERT INTO `test` VALUES ('657', '1502539434');
INSERT INTO `test` VALUES ('658', '1502539449');
INSERT INTO `test` VALUES ('659', '1502539450');
INSERT INTO `test` VALUES ('660', '1502539460');
INSERT INTO `test` VALUES ('661', '1502539480');
INSERT INTO `test` VALUES ('662', '1502539490');
INSERT INTO `test` VALUES ('663', '1502539504');
INSERT INTO `test` VALUES ('664', '1502539506');
INSERT INTO `test` VALUES ('665', '1502539511');
INSERT INTO `test` VALUES ('666', '1502539514');
INSERT INTO `test` VALUES ('667', '1502539524');
INSERT INTO `test` VALUES ('668', '1502539576');
INSERT INTO `test` VALUES ('669', '1502539579');
INSERT INTO `test` VALUES ('670', '1502539589');
INSERT INTO `test` VALUES ('671', '1502539612');
INSERT INTO `test` VALUES ('672', '1502539622');
INSERT INTO `test` VALUES ('673', '1502539628');
INSERT INTO `test` VALUES ('674', '1502539660');
INSERT INTO `test` VALUES ('675', '1502539663');
INSERT INTO `test` VALUES ('676', '1502539668');
INSERT INTO `test` VALUES ('677', '1502539682');
INSERT INTO `test` VALUES ('678', '1502539709');
INSERT INTO `test` VALUES ('679', '1502539710');
INSERT INTO `test` VALUES ('680', '1502539715');
INSERT INTO `test` VALUES ('681', '1502539718');
INSERT INTO `test` VALUES ('682', '1502539719');
INSERT INTO `test` VALUES ('683', '1502539764');
INSERT INTO `test` VALUES ('684', '1502539781');
INSERT INTO `test` VALUES ('685', '1502539788');
INSERT INTO `test` VALUES ('686', '1502539795');
INSERT INTO `test` VALUES ('687', '1502539797');
INSERT INTO `test` VALUES ('688', '1502539797');
INSERT INTO `test` VALUES ('689', '1502539802');
INSERT INTO `test` VALUES ('690', '1502539803');
INSERT INTO `test` VALUES ('691', '1502539803');
INSERT INTO `test` VALUES ('692', '1502539803');
INSERT INTO `test` VALUES ('693', '1502539803');
INSERT INTO `test` VALUES ('694', '1502539803');
INSERT INTO `test` VALUES ('695', '1502539828');
INSERT INTO `test` VALUES ('696', '1502539844');
INSERT INTO `test` VALUES ('697', '1502539853');
INSERT INTO `test` VALUES ('698', '1502539853');
INSERT INTO `test` VALUES ('699', '1502539867');
INSERT INTO `test` VALUES ('700', '1502539939');
INSERT INTO `test` VALUES ('701', '1502539958');
INSERT INTO `test` VALUES ('702', '1502540028');
INSERT INTO `test` VALUES ('703', '1502540043');
INSERT INTO `test` VALUES ('704', '1502540043');
INSERT INTO `test` VALUES ('705', '1502540044');
INSERT INTO `test` VALUES ('706', '1502540059');
INSERT INTO `test` VALUES ('707', '1502540060');
INSERT INTO `test` VALUES ('708', '1502540060');
INSERT INTO `test` VALUES ('709', '1502540075');
INSERT INTO `test` VALUES ('710', '1502540084');
INSERT INTO `test` VALUES ('711', '1502540092');
INSERT INTO `test` VALUES ('712', '1502540098');
INSERT INTO `test` VALUES ('713', '1502540104');
INSERT INTO `test` VALUES ('714', '1502540105');
INSERT INTO `test` VALUES ('715', '1502540105');
INSERT INTO `test` VALUES ('716', '1502540105');
INSERT INTO `test` VALUES ('717', '1502540105');
INSERT INTO `test` VALUES ('718', '1502540122');
INSERT INTO `test` VALUES ('719', '1502540123');
INSERT INTO `test` VALUES ('720', '1502540123');
INSERT INTO `test` VALUES ('721', '1502540123');
INSERT INTO `test` VALUES ('722', '1502540124');
INSERT INTO `test` VALUES ('723', '1502540134');
INSERT INTO `test` VALUES ('724', '1502540136');
INSERT INTO `test` VALUES ('725', '1502540136');
INSERT INTO `test` VALUES ('726', '1502540137');
INSERT INTO `test` VALUES ('727', '1502540158');
INSERT INTO `test` VALUES ('728', '1502540204');
INSERT INTO `test` VALUES ('729', '1502540206');
INSERT INTO `test` VALUES ('730', '1502540215');
INSERT INTO `test` VALUES ('731', '1502540215');
INSERT INTO `test` VALUES ('732', '1502540215');
INSERT INTO `test` VALUES ('733', '1502540215');
INSERT INTO `test` VALUES ('734', '1502540216');
INSERT INTO `test` VALUES ('735', '1502540216');
INSERT INTO `test` VALUES ('736', '1502540216');
INSERT INTO `test` VALUES ('737', '1502540238');
INSERT INTO `test` VALUES ('738', '1502540241');
INSERT INTO `test` VALUES ('739', '1502540242');
INSERT INTO `test` VALUES ('740', '1502540242');
INSERT INTO `test` VALUES ('741', '1502540242');
INSERT INTO `test` VALUES ('742', '1502540243');
INSERT INTO `test` VALUES ('743', '1502540243');
INSERT INTO `test` VALUES ('744', '1502540246');
INSERT INTO `test` VALUES ('745', '1502540247');
INSERT INTO `test` VALUES ('746', '1502540247');
INSERT INTO `test` VALUES ('747', '1502540247');
INSERT INTO `test` VALUES ('748', '1502540247');
INSERT INTO `test` VALUES ('749', '1502540247');
INSERT INTO `test` VALUES ('750', '1502540248');
INSERT INTO `test` VALUES ('751', '1502540248');
INSERT INTO `test` VALUES ('752', '1502540248');
INSERT INTO `test` VALUES ('753', '1502540270');
INSERT INTO `test` VALUES ('754', '1502540271');
INSERT INTO `test` VALUES ('755', '1502540271');
INSERT INTO `test` VALUES ('756', '1502540271');
INSERT INTO `test` VALUES ('757', '1502540271');
INSERT INTO `test` VALUES ('758', '1502540271');
INSERT INTO `test` VALUES ('759', '1502540271');
INSERT INTO `test` VALUES ('760', '1502540272');
INSERT INTO `test` VALUES ('761', '1502540272');
INSERT INTO `test` VALUES ('762', '1502540272');
INSERT INTO `test` VALUES ('763', '1502540274');
INSERT INTO `test` VALUES ('764', '1502540276');
INSERT INTO `test` VALUES ('765', '1502540280');
INSERT INTO `test` VALUES ('766', '1502540280');
INSERT INTO `test` VALUES ('767', '1502540306');
INSERT INTO `test` VALUES ('768', '1502540307');
INSERT INTO `test` VALUES ('769', '1502540307');
INSERT INTO `test` VALUES ('770', '1502540307');
INSERT INTO `test` VALUES ('771', '1502540313');
INSERT INTO `test` VALUES ('772', '1502540315');
INSERT INTO `test` VALUES ('773', '1502540316');
INSERT INTO `test` VALUES ('774', '1502540316');
INSERT INTO `test` VALUES ('775', '1502540317');
INSERT INTO `test` VALUES ('776', '1502540317');
INSERT INTO `test` VALUES ('777', '1502540317');
INSERT INTO `test` VALUES ('778', '1502540318');
INSERT INTO `test` VALUES ('779', '1502540345');
INSERT INTO `test` VALUES ('780', '1502540354');
INSERT INTO `test` VALUES ('781', '1502540360');
INSERT INTO `test` VALUES ('782', '1502540375');
INSERT INTO `test` VALUES ('783', '1502540398');
INSERT INTO `test` VALUES ('784', '1502540418');
INSERT INTO `test` VALUES ('785', '1502540419');
INSERT INTO `test` VALUES ('786', '1502540425');
INSERT INTO `test` VALUES ('787', '1502540442');
INSERT INTO `test` VALUES ('788', '1502540451');
INSERT INTO `test` VALUES ('789', '1502540474');
INSERT INTO `test` VALUES ('790', '1502540499');
INSERT INTO `test` VALUES ('791', '1502540525');
INSERT INTO `test` VALUES ('792', '1502540555');
INSERT INTO `test` VALUES ('793', '1502540557');
INSERT INTO `test` VALUES ('794', '1502540558');
INSERT INTO `test` VALUES ('795', '1502540565');
INSERT INTO `test` VALUES ('796', '1502540609');
INSERT INTO `test` VALUES ('797', '1502540611');
INSERT INTO `test` VALUES ('798', '1502540800');
INSERT INTO `test` VALUES ('799', '1502540806');
INSERT INTO `test` VALUES ('800', '1502540839');
INSERT INTO `test` VALUES ('801', '1502540845');
INSERT INTO `test` VALUES ('802', '1502540867');
INSERT INTO `test` VALUES ('803', '1502540882');
INSERT INTO `test` VALUES ('804', '1502540898');
INSERT INTO `test` VALUES ('805', '1502540927');
INSERT INTO `test` VALUES ('806', '1502540946');
INSERT INTO `test` VALUES ('807', '1502540958');
INSERT INTO `test` VALUES ('808', '1502540966');
INSERT INTO `test` VALUES ('809', '1502540983');
INSERT INTO `test` VALUES ('810', '1502541012');
INSERT INTO `test` VALUES ('811', '1502541020');
INSERT INTO `test` VALUES ('812', '1502541081');
INSERT INTO `test` VALUES ('813', '1502541089');
INSERT INTO `test` VALUES ('814', '1502541188');
INSERT INTO `test` VALUES ('815', '1502541251');
INSERT INTO `test` VALUES ('816', '1502541604');
INSERT INTO `test` VALUES ('817', '1502541610');
INSERT INTO `test` VALUES ('818', '1502541613');
INSERT INTO `test` VALUES ('819', '1502541635');
INSERT INTO `test` VALUES ('820', '1502541638');
INSERT INTO `test` VALUES ('821', '1502541641');
INSERT INTO `test` VALUES ('822', '1502541644');
INSERT INTO `test` VALUES ('823', '1502541650');
INSERT INTO `test` VALUES ('824', '1502541652');
INSERT INTO `test` VALUES ('825', '1502541654');
INSERT INTO `test` VALUES ('826', '1502676801');
INSERT INTO `test` VALUES ('827', '1502676981');
INSERT INTO `test` VALUES ('828', '1502677161');
INSERT INTO `test` VALUES ('829', '1502677341');
INSERT INTO `test` VALUES ('830', '1502677521');
INSERT INTO `test` VALUES ('831', '1502677701');
INSERT INTO `test` VALUES ('832', '1502677881');
INSERT INTO `test` VALUES ('833', '1502678061');
INSERT INTO `test` VALUES ('834', '1502678241');
INSERT INTO `test` VALUES ('835', '1502678589');
INSERT INTO `test` VALUES ('836', '1502678769');
INSERT INTO `test` VALUES ('837', '1502679099');
INSERT INTO `test` VALUES ('838', '1502679104');
INSERT INTO `test` VALUES ('839', '1502680053');
INSERT INTO `test` VALUES ('840', '1502680330');
INSERT INTO `test` VALUES ('841', '1502680510');
INSERT INTO `test` VALUES ('842', '1502680690');
INSERT INTO `test` VALUES ('843', '1502680870');
INSERT INTO `test` VALUES ('844', '1502681116');
INSERT INTO `test` VALUES ('845', '1502681314');
INSERT INTO `test` VALUES ('846', '1502681494');
INSERT INTO `test` VALUES ('847', '1502681606');
INSERT INTO `test` VALUES ('848', '1502681745');
INSERT INTO `test` VALUES ('849', '1502681925');
INSERT INTO `test` VALUES ('850', '1502682105');
INSERT INTO `test` VALUES ('851', '1502682285');
INSERT INTO `test` VALUES ('852', '1502682465');
INSERT INTO `test` VALUES ('853', '1502682858');
INSERT INTO `test` VALUES ('854', '1502683038');
INSERT INTO `test` VALUES ('855', '1502683218');
INSERT INTO `test` VALUES ('856', '1502770452');
INSERT INTO `test` VALUES ('857', '1502770458');
INSERT INTO `test` VALUES ('858', '1502770459');
INSERT INTO `test` VALUES ('859', '1502770461');
INSERT INTO `test` VALUES ('860', '1502770551');
INSERT INTO `test` VALUES ('861', '1502770557');
INSERT INTO `test` VALUES ('862', '1502770558');
INSERT INTO `test` VALUES ('863', '1502770560');
INSERT INTO `test` VALUES ('864', '1502772493');
INSERT INTO `test` VALUES ('865', '1502775742');
INSERT INTO `test` VALUES ('866', '1502777123');
INSERT INTO `test` VALUES ('867', '1502777275');
INSERT INTO `test` VALUES ('868', '1502777285');
INSERT INTO `test` VALUES ('869', '1502777289');
INSERT INTO `test` VALUES ('870', '1502777295');
INSERT INTO `test` VALUES ('871', '1502777365');
INSERT INTO `test` VALUES ('872', '1502778647');
INSERT INTO `test` VALUES ('873', '1502778647');
INSERT INTO `test` VALUES ('874', '1502778647');
INSERT INTO `test` VALUES ('875', '1502779174');
INSERT INTO `test` VALUES ('876', '1502779531');
INSERT INTO `test` VALUES ('877', '1502779546');
INSERT INTO `test` VALUES ('878', '1502779781');
INSERT INTO `test` VALUES ('879', '1502779801');
INSERT INTO `test` VALUES ('880', '1502780102');
INSERT INTO `test` VALUES ('881', '1502780102');
INSERT INTO `test` VALUES ('882', '1502780102');
INSERT INTO `test` VALUES ('883', '1502780103');
INSERT INTO `test` VALUES ('884', '1502780104');
INSERT INTO `test` VALUES ('885', '1502780104');
INSERT INTO `test` VALUES ('886', '1502780107');
INSERT INTO `test` VALUES ('887', '1502780107');
INSERT INTO `test` VALUES ('888', '1502780158');
INSERT INTO `test` VALUES ('889', '1502780163');
INSERT INTO `test` VALUES ('890', '1502780163');
INSERT INTO `test` VALUES ('891', '1502780971');
INSERT INTO `test` VALUES ('892', '1502780971');
INSERT INTO `test` VALUES ('893', '1502781006');
INSERT INTO `test` VALUES ('894', '1502781011');
INSERT INTO `test` VALUES ('895', '1502781016');
INSERT INTO `test` VALUES ('896', '1502781016');
INSERT INTO `test` VALUES ('897', '1502781016');
INSERT INTO `test` VALUES ('898', '1502781017');
INSERT INTO `test` VALUES ('899', '1502781102');
INSERT INTO `test` VALUES ('900', '1502781102');
INSERT INTO `test` VALUES ('901', '1502781117');
INSERT INTO `test` VALUES ('902', '1502781117');
INSERT INTO `test` VALUES ('903', '1502781241');
INSERT INTO `test` VALUES ('904', '1502781252');
INSERT INTO `test` VALUES ('905', '1502781254');
INSERT INTO `test` VALUES ('906', '1502781255');
INSERT INTO `test` VALUES ('907', '1502781349');
INSERT INTO `test` VALUES ('908', '1502781560');
INSERT INTO `test` VALUES ('909', '1502781561');
INSERT INTO `test` VALUES ('910', '1502781570');
INSERT INTO `test` VALUES ('911', '1502781570');
INSERT INTO `test` VALUES ('912', '1502781687');
INSERT INTO `test` VALUES ('913', '1502781687');
INSERT INTO `test` VALUES ('914', '1502781693');
INSERT INTO `test` VALUES ('915', '1502781693');
INSERT INTO `test` VALUES ('916', '1502781698');
INSERT INTO `test` VALUES ('917', '1502781698');
INSERT INTO `test` VALUES ('918', '1502781733');
INSERT INTO `test` VALUES ('919', '1502781735');
INSERT INTO `test` VALUES ('920', '1502781737');
INSERT INTO `test` VALUES ('921', '1502781737');
INSERT INTO `test` VALUES ('922', '1502781738');
INSERT INTO `test` VALUES ('923', '1502781739');
INSERT INTO `test` VALUES ('924', '1502781740');
INSERT INTO `test` VALUES ('925', '1502781740');
INSERT INTO `test` VALUES ('926', '1502781756');
INSERT INTO `test` VALUES ('927', '1502781764');
INSERT INTO `test` VALUES ('928', '1502781764');
INSERT INTO `test` VALUES ('929', '1502781831');
INSERT INTO `test` VALUES ('930', '1502781832');
INSERT INTO `test` VALUES ('931', '1502781885');
INSERT INTO `test` VALUES ('932', '1502781892');
INSERT INTO `test` VALUES ('933', '1502782004');
INSERT INTO `test` VALUES ('934', '1502782010');
INSERT INTO `test` VALUES ('935', '1502782012');
INSERT INTO `test` VALUES ('936', '1502782079');
INSERT INTO `test` VALUES ('937', '1502782079');
INSERT INTO `test` VALUES ('938', '1502782116');
INSERT INTO `test` VALUES ('939', '1502782116');
INSERT INTO `test` VALUES ('940', '1502782132');
INSERT INTO `test` VALUES ('941', '1502782132');
INSERT INTO `test` VALUES ('942', '1502783095');
INSERT INTO `test` VALUES ('943', '1502783246');
INSERT INTO `test` VALUES ('944', '1502783262');
INSERT INTO `test` VALUES ('945', '1502783266');
INSERT INTO `test` VALUES ('946', '1502783272');
INSERT INTO `test` VALUES ('947', '1502783287');
INSERT INTO `test` VALUES ('948', '1502783769');
INSERT INTO `test` VALUES ('949', '1502783775');
INSERT INTO `test` VALUES ('950', '1502783786');
INSERT INTO `test` VALUES ('951', '1502784099');
INSERT INTO `test` VALUES ('952', '1502784101');
INSERT INTO `test` VALUES ('953', '1502784115');
INSERT INTO `test` VALUES ('954', '1502784118');
INSERT INTO `test` VALUES ('955', '1502784121');
INSERT INTO `test` VALUES ('956', '1502784206');
INSERT INTO `test` VALUES ('957', '1502784208');
INSERT INTO `test` VALUES ('958', '1502784210');
INSERT INTO `test` VALUES ('959', '1502784486');
INSERT INTO `test` VALUES ('960', '1502784497');
INSERT INTO `test` VALUES ('961', '1502784498');
INSERT INTO `test` VALUES ('962', '1502784500');
INSERT INTO `test` VALUES ('963', '1502784636');
INSERT INTO `test` VALUES ('964', '1502784667');
INSERT INTO `test` VALUES ('965', '1502784860');
INSERT INTO `test` VALUES ('966', '1502784867');
INSERT INTO `test` VALUES ('967', '1502785863');
INSERT INTO `test` VALUES ('968', '1502785866');
INSERT INTO `test` VALUES ('969', '1502785871');
INSERT INTO `test` VALUES ('970', '1502785880');
INSERT INTO `test` VALUES ('971', '1502785882');
INSERT INTO `test` VALUES ('972', '1502785884');
INSERT INTO `test` VALUES ('973', '1502785890');
INSERT INTO `test` VALUES ('974', '1502786057');
INSERT INTO `test` VALUES ('975', '1502786888');
INSERT INTO `test` VALUES ('976', '1502786895');
INSERT INTO `test` VALUES ('977', '1502786898');
INSERT INTO `test` VALUES ('978', '1502786900');
INSERT INTO `test` VALUES ('979', '1502786911');
INSERT INTO `test` VALUES ('980', '1502786911');
INSERT INTO `test` VALUES ('981', '1502786918');
INSERT INTO `test` VALUES ('982', '1502786920');
INSERT INTO `test` VALUES ('983', '1502786927');
INSERT INTO `test` VALUES ('984', '1502786928');
INSERT INTO `test` VALUES ('985', '1502786934');
INSERT INTO `test` VALUES ('986', '1502786942');
INSERT INTO `test` VALUES ('987', '1502786943');
INSERT INTO `test` VALUES ('988', '1502787081');
INSERT INTO `test` VALUES ('989', '1502787085');
INSERT INTO `test` VALUES ('990', '1502787089');
INSERT INTO `test` VALUES ('991', '1502787095');
INSERT INTO `test` VALUES ('992', '1502787098');
INSERT INTO `test` VALUES ('993', '1502787153');
INSERT INTO `test` VALUES ('994', '1502787153');
INSERT INTO `test` VALUES ('995', '1502787156');
INSERT INTO `test` VALUES ('996', '1502787157');
INSERT INTO `test` VALUES ('997', '1502787159');
INSERT INTO `test` VALUES ('998', '1502787160');
INSERT INTO `test` VALUES ('999', '1502787160');
INSERT INTO `test` VALUES ('1000', '1502787161');
INSERT INTO `test` VALUES ('1001', '1502787161');
INSERT INTO `test` VALUES ('1002', '1502787161');
INSERT INTO `test` VALUES ('1003', '1502787162');
INSERT INTO `test` VALUES ('1004', '1502787162');
INSERT INTO `test` VALUES ('1005', '1502787162');
INSERT INTO `test` VALUES ('1006', '1502787645');
INSERT INTO `test` VALUES ('1007', '1502787649');
INSERT INTO `test` VALUES ('1008', '1502787652');
INSERT INTO `test` VALUES ('1009', '1502787669');
INSERT INTO `test` VALUES ('1010', '1502787670');
INSERT INTO `test` VALUES ('1011', '1502787671');
INSERT INTO `test` VALUES ('1012', '1502787682');
INSERT INTO `test` VALUES ('1013', '1502787683');
INSERT INTO `test` VALUES ('1014', '1502787685');
INSERT INTO `test` VALUES ('1015', '1502787691');
INSERT INTO `test` VALUES ('1016', '1502787699');
INSERT INTO `test` VALUES ('1017', '1502787706');
INSERT INTO `test` VALUES ('1018', '1502787707');
INSERT INTO `test` VALUES ('1019', '1502787708');
INSERT INTO `test` VALUES ('1020', '1502787708');
INSERT INTO `test` VALUES ('1021', '1502787708');
INSERT INTO `test` VALUES ('1022', '1502788440');
INSERT INTO `test` VALUES ('1023', '1502788442');
INSERT INTO `test` VALUES ('1024', '1502788450');
INSERT INTO `test` VALUES ('1025', '1502788584');
INSERT INTO `test` VALUES ('1026', '1502788587');
INSERT INTO `test` VALUES ('1027', '1502788589');
INSERT INTO `test` VALUES ('1028', '1502788589');
INSERT INTO `test` VALUES ('1029', '1502788590');
INSERT INTO `test` VALUES ('1030', '1502788636');
INSERT INTO `test` VALUES ('1031', '1502788637');
INSERT INTO `test` VALUES ('1032', '1502788639');
INSERT INTO `test` VALUES ('1033', '1502788639');
INSERT INTO `test` VALUES ('1034', '1502788639');
INSERT INTO `test` VALUES ('1035', '1502788639');
INSERT INTO `test` VALUES ('1036', '1502788639');
INSERT INTO `test` VALUES ('1037', '1502788640');
INSERT INTO `test` VALUES ('1038', '1502788640');
INSERT INTO `test` VALUES ('1039', '1502788640');
INSERT INTO `test` VALUES ('1040', '1502788641');
INSERT INTO `test` VALUES ('1041', '1502788641');
INSERT INTO `test` VALUES ('1042', '1502788650');
INSERT INTO `test` VALUES ('1043', '1502788659');
INSERT INTO `test` VALUES ('1044', '1502788664');
INSERT INTO `test` VALUES ('1045', '1502788673');
INSERT INTO `test` VALUES ('1046', '1502788695');
INSERT INTO `test` VALUES ('1047', '1502788701');
INSERT INTO `test` VALUES ('1048', '1502788702');
INSERT INTO `test` VALUES ('1049', '1502788923');
INSERT INTO `test` VALUES ('1050', '1502788929');
INSERT INTO `test` VALUES ('1051', '1502788932');
INSERT INTO `test` VALUES ('1052', '1502788936');
INSERT INTO `test` VALUES ('1053', '1502789029');
INSERT INTO `test` VALUES ('1054', '1502789344');
INSERT INTO `test` VALUES ('1055', '1502789350');
INSERT INTO `test` VALUES ('1056', '1502789358');
INSERT INTO `test` VALUES ('1057', '1502789369');
INSERT INTO `test` VALUES ('1058', '1502789370');
INSERT INTO `test` VALUES ('1059', '1502789372');
INSERT INTO `test` VALUES ('1060', '1502789372');
INSERT INTO `test` VALUES ('1061', '1502789377');
INSERT INTO `test` VALUES ('1062', '1502789380');
INSERT INTO `test` VALUES ('1063', '1502789393');
INSERT INTO `test` VALUES ('1064', '1502789394');
INSERT INTO `test` VALUES ('1065', '1502789394');
INSERT INTO `test` VALUES ('1066', '1502789394');
INSERT INTO `test` VALUES ('1067', '1502789400');
INSERT INTO `test` VALUES ('1068', '1502789423');
INSERT INTO `test` VALUES ('1069', '1502789423');
INSERT INTO `test` VALUES ('1070', '1502789423');
INSERT INTO `test` VALUES ('1071', '1502789423');
INSERT INTO `test` VALUES ('1072', '1502789423');
INSERT INTO `test` VALUES ('1073', '1502789432');
INSERT INTO `test` VALUES ('1074', '1502789432');
INSERT INTO `test` VALUES ('1075', '1502789433');
INSERT INTO `test` VALUES ('1076', '1502789433');
INSERT INTO `test` VALUES ('1077', '1502789435');
INSERT INTO `test` VALUES ('1078', '1502789442');
INSERT INTO `test` VALUES ('1079', '1502789443');
INSERT INTO `test` VALUES ('1080', '1502789462');
INSERT INTO `test` VALUES ('1081', '1502789467');
INSERT INTO `test` VALUES ('1082', '1502789475');
INSERT INTO `test` VALUES ('1083', '1502789477');
INSERT INTO `test` VALUES ('1084', '1502789485');
INSERT INTO `test` VALUES ('1085', '1502789485');
INSERT INTO `test` VALUES ('1086', '1502789498');
INSERT INTO `test` VALUES ('1087', '1502789499');
INSERT INTO `test` VALUES ('1088', '1502789743');
INSERT INTO `test` VALUES ('1089', '1502789748');
INSERT INTO `test` VALUES ('1090', '1502789754');
INSERT INTO `test` VALUES ('1091', '1502789757');
INSERT INTO `test` VALUES ('1092', '1502789761');
INSERT INTO `test` VALUES ('1093', '1502789762');
INSERT INTO `test` VALUES ('1094', '1502789762');
INSERT INTO `test` VALUES ('1095', '1502789763');
INSERT INTO `test` VALUES ('1096', '1502789809');
INSERT INTO `test` VALUES ('1097', '1502789814');
INSERT INTO `test` VALUES ('1098', '1502789862');
INSERT INTO `test` VALUES ('1099', '1502789872');
INSERT INTO `test` VALUES ('1100', '1502790115');
INSERT INTO `test` VALUES ('1101', '1502790134');
INSERT INTO `test` VALUES ('1102', '1502790140');
INSERT INTO `test` VALUES ('1103', '1502790142');
INSERT INTO `test` VALUES ('1104', '1502790144');
INSERT INTO `test` VALUES ('1105', '1502790156');
INSERT INTO `test` VALUES ('1106', '1502790195');
INSERT INTO `test` VALUES ('1107', '1502790202');
INSERT INTO `test` VALUES ('1108', '1502790205');
INSERT INTO `test` VALUES ('1109', '1502790229');
INSERT INTO `test` VALUES ('1110', '1502790234');
INSERT INTO `test` VALUES ('1111', '1502790299');
INSERT INTO `test` VALUES ('1112', '1502790305');
INSERT INTO `test` VALUES ('1113', '1502790308');
INSERT INTO `test` VALUES ('1114', '1502790366');
INSERT INTO `test` VALUES ('1115', '1502790368');
INSERT INTO `test` VALUES ('1116', '1502790369');
INSERT INTO `test` VALUES ('1117', '1502790430');
INSERT INTO `test` VALUES ('1118', '1502790430');
INSERT INTO `test` VALUES ('1119', '1502790430');
INSERT INTO `test` VALUES ('1120', '1502790431');
INSERT INTO `test` VALUES ('1121', '1502790436');
INSERT INTO `test` VALUES ('1122', '1502790436');
INSERT INTO `test` VALUES ('1123', '1502790466');
INSERT INTO `test` VALUES ('1124', '1502790471');
INSERT INTO `test` VALUES ('1125', '1502790473');
INSERT INTO `test` VALUES ('1126', '1502790482');
INSERT INTO `test` VALUES ('1127', '1502790485');
INSERT INTO `test` VALUES ('1128', '1502790487');
INSERT INTO `test` VALUES ('1129', '1502790519');
INSERT INTO `test` VALUES ('1130', '1502790528');
INSERT INTO `test` VALUES ('1131', '1502790530');
INSERT INTO `test` VALUES ('1132', '1502790531');
INSERT INTO `test` VALUES ('1133', '1502790533');
INSERT INTO `test` VALUES ('1134', '1502790552');
INSERT INTO `test` VALUES ('1135', '1502790558');
INSERT INTO `test` VALUES ('1136', '1502790558');
INSERT INTO `test` VALUES ('1137', '1502790558');
INSERT INTO `test` VALUES ('1138', '1502790640');
INSERT INTO `test` VALUES ('1139', '1502790643');
INSERT INTO `test` VALUES ('1140', '1502790646');
INSERT INTO `test` VALUES ('1141', '1502790647');
INSERT INTO `test` VALUES ('1142', '1502790665');
INSERT INTO `test` VALUES ('1143', '1502790669');
INSERT INTO `test` VALUES ('1144', '1502790671');
INSERT INTO `test` VALUES ('1145', '1502790686');
INSERT INTO `test` VALUES ('1146', '1502790688');
INSERT INTO `test` VALUES ('1147', '1502790689');
INSERT INTO `test` VALUES ('1148', '1502790693');
INSERT INTO `test` VALUES ('1149', '1502790762');
INSERT INTO `test` VALUES ('1150', '1502790764');
INSERT INTO `test` VALUES ('1151', '1502790764');
INSERT INTO `test` VALUES ('1152', '1502790764');
INSERT INTO `test` VALUES ('1153', '1502790765');
INSERT INTO `test` VALUES ('1154', '1502790769');
INSERT INTO `test` VALUES ('1155', '1502790771');
INSERT INTO `test` VALUES ('1156', '1502790771');
INSERT INTO `test` VALUES ('1157', '1502790772');
INSERT INTO `test` VALUES ('1158', '1502790772');
INSERT INTO `test` VALUES ('1159', '1502790772');
INSERT INTO `test` VALUES ('1160', '1502790776');
INSERT INTO `test` VALUES ('1161', '1502790776');
INSERT INTO `test` VALUES ('1162', '1502790776');
INSERT INTO `test` VALUES ('1163', '1502790777');
INSERT INTO `test` VALUES ('1164', '1502790777');
INSERT INTO `test` VALUES ('1165', '1502790790');
INSERT INTO `test` VALUES ('1166', '1502790800');
INSERT INTO `test` VALUES ('1167', '1502790801');
INSERT INTO `test` VALUES ('1168', '1502790803');
INSERT INTO `test` VALUES ('1169', '1502790804');
INSERT INTO `test` VALUES ('1170', '1502790805');
INSERT INTO `test` VALUES ('1171', '1502790805');
INSERT INTO `test` VALUES ('1172', '1502790805');
INSERT INTO `test` VALUES ('1173', '1502790806');
INSERT INTO `test` VALUES ('1174', '1502790807');
INSERT INTO `test` VALUES ('1175', '1502791020');
INSERT INTO `test` VALUES ('1176', '1502791023');
INSERT INTO `test` VALUES ('1177', '1502791025');
INSERT INTO `test` VALUES ('1178', '1502791028');
INSERT INTO `test` VALUES ('1179', '1502793609');
INSERT INTO `test` VALUES ('1180', '1502794613');
INSERT INTO `test` VALUES ('1181', '1502794615');
INSERT INTO `test` VALUES ('1182', '1502794650');
INSERT INTO `test` VALUES ('1183', '1502794669');
INSERT INTO `test` VALUES ('1184', '1502794672');
INSERT INTO `test` VALUES ('1185', '1502794672');
INSERT INTO `test` VALUES ('1186', '1502794674');
INSERT INTO `test` VALUES ('1187', '1502794677');
INSERT INTO `test` VALUES ('1188', '1502794678');
INSERT INTO `test` VALUES ('1189', '1502794790');
INSERT INTO `test` VALUES ('1190', '1502794792');
INSERT INTO `test` VALUES ('1191', '1502794794');
INSERT INTO `test` VALUES ('1192', '1502794794');
INSERT INTO `test` VALUES ('1193', '1502794795');
INSERT INTO `test` VALUES ('1194', '1502794797');
INSERT INTO `test` VALUES ('1195', '1502794806');
INSERT INTO `test` VALUES ('1196', '1502794806');
INSERT INTO `test` VALUES ('1197', '1502794814');
INSERT INTO `test` VALUES ('1198', '1502794977');
INSERT INTO `test` VALUES ('1199', '1502794980');
INSERT INTO `test` VALUES ('1200', '1502794984');
INSERT INTO `test` VALUES ('1201', '1502794984');
INSERT INTO `test` VALUES ('1202', '1502794985');
INSERT INTO `test` VALUES ('1203', '1502794986');
INSERT INTO `test` VALUES ('1204', '1502794994');
INSERT INTO `test` VALUES ('1205', '1502795145');
INSERT INTO `test` VALUES ('1206', '1502795150');
INSERT INTO `test` VALUES ('1207', '1502795171');
INSERT INTO `test` VALUES ('1208', '1502795174');
INSERT INTO `test` VALUES ('1209', '1502795177');
INSERT INTO `test` VALUES ('1210', '1502795178');
INSERT INTO `test` VALUES ('1211', '1502795180');
INSERT INTO `test` VALUES ('1212', '1502795299');
INSERT INTO `test` VALUES ('1213', '1502795301');
INSERT INTO `test` VALUES ('1214', '1502795301');
INSERT INTO `test` VALUES ('1215', '1502795302');
INSERT INTO `test` VALUES ('1216', '1502795305');
INSERT INTO `test` VALUES ('1217', '1502795314');
INSERT INTO `test` VALUES ('1218', '1502795322');
INSERT INTO `test` VALUES ('1219', '1502795344');
INSERT INTO `test` VALUES ('1220', '1502795347');
INSERT INTO `test` VALUES ('1221', '1502795492');
INSERT INTO `test` VALUES ('1222', '1502795887');
INSERT INTO `test` VALUES ('1223', '1502797068');
INSERT INTO `test` VALUES ('1224', '1502798065');
INSERT INTO `test` VALUES ('1225', '1502798072');
INSERT INTO `test` VALUES ('1226', '1502798077');
INSERT INTO `test` VALUES ('1227', '1502798079');
INSERT INTO `test` VALUES ('1228', '1502798083');
INSERT INTO `test` VALUES ('1229', '1502798454');
INSERT INTO `test` VALUES ('1230', '1502798467');
INSERT INTO `test` VALUES ('1231', '1502798475');
INSERT INTO `test` VALUES ('1232', '1502798487');
INSERT INTO `test` VALUES ('1233', '1502798497');
INSERT INTO `test` VALUES ('1234', '1502798501');
INSERT INTO `test` VALUES ('1235', '1502798578');
INSERT INTO `test` VALUES ('1236', '1502798978');
INSERT INTO `test` VALUES ('1237', '1502798982');
INSERT INTO `test` VALUES ('1238', '1502798987');
INSERT INTO `test` VALUES ('1239', '1502799197');
INSERT INTO `test` VALUES ('1240', '1502799205');
INSERT INTO `test` VALUES ('1241', '1502799242');
INSERT INTO `test` VALUES ('1242', '1502799242');
INSERT INTO `test` VALUES ('1243', '1502799744');
INSERT INTO `test` VALUES ('1244', '1502799889');
INSERT INTO `test` VALUES ('1245', '1502799889');
INSERT INTO `test` VALUES ('1246', '1502799911');
INSERT INTO `test` VALUES ('1247', '1502799911');
INSERT INTO `test` VALUES ('1248', '1502799981');
INSERT INTO `test` VALUES ('1249', '1502799981');
INSERT INTO `test` VALUES ('1250', '1502800002');
INSERT INTO `test` VALUES ('1251', '1502800002');
INSERT INTO `test` VALUES ('1252', '1502800016');
INSERT INTO `test` VALUES ('1253', '1502800020');
INSERT INTO `test` VALUES ('1254', '1502800020');
INSERT INTO `test` VALUES ('1255', '1502800026');
INSERT INTO `test` VALUES ('1256', '1502800028');
INSERT INTO `test` VALUES ('1257', '1502800028');
INSERT INTO `test` VALUES ('1258', '1502800029');
INSERT INTO `test` VALUES ('1259', '1502800030');
INSERT INTO `test` VALUES ('1260', '1502800035');
INSERT INTO `test` VALUES ('1261', '1502800037');
INSERT INTO `test` VALUES ('1262', '1502800273');
INSERT INTO `test` VALUES ('1263', '1502800273');
INSERT INTO `test` VALUES ('1264', '1502800283');
INSERT INTO `test` VALUES ('1265', '1502800283');
INSERT INTO `test` VALUES ('1266', '1502800361');
INSERT INTO `test` VALUES ('1267', '1502800361');
INSERT INTO `test` VALUES ('1268', '1502800375');
INSERT INTO `test` VALUES ('1269', '1502800375');
INSERT INTO `test` VALUES ('1270', '1502800375');
INSERT INTO `test` VALUES ('1271', '1502800375');
INSERT INTO `test` VALUES ('1272', '1502800381');
INSERT INTO `test` VALUES ('1273', '1502800382');
INSERT INTO `test` VALUES ('1274', '1502800385');
INSERT INTO `test` VALUES ('1275', '1502800385');
INSERT INTO `test` VALUES ('1276', '1502800385');
INSERT INTO `test` VALUES ('1277', '1502800385');
INSERT INTO `test` VALUES ('1278', '1502800409');
INSERT INTO `test` VALUES ('1279', '1502800410');
INSERT INTO `test` VALUES ('1280', '1502800410');
INSERT INTO `test` VALUES ('1281', '1502800412');
INSERT INTO `test` VALUES ('1282', '1502800415');
INSERT INTO `test` VALUES ('1283', '1502800416');
INSERT INTO `test` VALUES ('1284', '1502800416');
INSERT INTO `test` VALUES ('1285', '1502800418');
INSERT INTO `test` VALUES ('1286', '1502800423');
INSERT INTO `test` VALUES ('1287', '1502800487');
INSERT INTO `test` VALUES ('1288', '1502800502');
INSERT INTO `test` VALUES ('1289', '1502800521');
INSERT INTO `test` VALUES ('1290', '1502800527');
INSERT INTO `test` VALUES ('1291', '1502800528');
INSERT INTO `test` VALUES ('1292', '1502800530');
INSERT INTO `test` VALUES ('1293', '1502800531');
INSERT INTO `test` VALUES ('1294', '1502800534');
INSERT INTO `test` VALUES ('1295', '1502800536');
INSERT INTO `test` VALUES ('1296', '1502800536');
INSERT INTO `test` VALUES ('1297', '1502800537');
INSERT INTO `test` VALUES ('1298', '1502800537');
INSERT INTO `test` VALUES ('1299', '1502800538');
INSERT INTO `test` VALUES ('1300', '1502800539');
INSERT INTO `test` VALUES ('1301', '1502800540');
INSERT INTO `test` VALUES ('1302', '1502800541');
INSERT INTO `test` VALUES ('1303', '1502800542');
INSERT INTO `test` VALUES ('1304', '1502805858');
INSERT INTO `test` VALUES ('1305', '1502805946');
INSERT INTO `test` VALUES ('1306', '1502806060');
INSERT INTO `test` VALUES ('1307', '1502806061');
INSERT INTO `test` VALUES ('1308', '1502806066');
INSERT INTO `test` VALUES ('1309', '1502806066');
INSERT INTO `test` VALUES ('1310', '1502806068');
INSERT INTO `test` VALUES ('1311', '1502806081');
INSERT INTO `test` VALUES ('1312', '1502809729');
INSERT INTO `test` VALUES ('1313', '1502809733');
INSERT INTO `test` VALUES ('1314', '1502809733');
INSERT INTO `test` VALUES ('1315', '1502809756');
INSERT INTO `test` VALUES ('1316', '1502809759');
INSERT INTO `test` VALUES ('1317', '1502809760');
INSERT INTO `test` VALUES ('1318', '1502809761');
INSERT INTO `test` VALUES ('1319', '1502809764');
INSERT INTO `test` VALUES ('1320', '1502809779');
INSERT INTO `test` VALUES ('1321', '1502809823');
INSERT INTO `test` VALUES ('1322', '1502809824');
INSERT INTO `test` VALUES ('1323', '1502809827');
INSERT INTO `test` VALUES ('1324', '1502809827');
INSERT INTO `test` VALUES ('1325', '1502809833');
INSERT INTO `test` VALUES ('1326', '1502809986');
INSERT INTO `test` VALUES ('1327', '1502809986');
INSERT INTO `test` VALUES ('1328', '1502809988');
INSERT INTO `test` VALUES ('1329', '1502809988');
INSERT INTO `test` VALUES ('1330', '1502809991');
INSERT INTO `test` VALUES ('1331', '1502810003');
INSERT INTO `test` VALUES ('1332', '1502810007');
INSERT INTO `test` VALUES ('1333', '1502810013');
INSERT INTO `test` VALUES ('1334', '1502810018');
INSERT INTO `test` VALUES ('1335', '1502810021');
INSERT INTO `test` VALUES ('1336', '1502810204');
INSERT INTO `test` VALUES ('1337', '1502810204');
INSERT INTO `test` VALUES ('1338', '1502810204');
INSERT INTO `test` VALUES ('1339', '1502810204');
INSERT INTO `test` VALUES ('1340', '1502810204');
INSERT INTO `test` VALUES ('1341', '1502810204');
INSERT INTO `test` VALUES ('1342', '1502810204');
INSERT INTO `test` VALUES ('1343', '1502810204');
INSERT INTO `test` VALUES ('1344', '1502810569');
INSERT INTO `test` VALUES ('1345', '1502810569');
INSERT INTO `test` VALUES ('1346', '1502810569');
INSERT INTO `test` VALUES ('1347', '1502810569');
INSERT INTO `test` VALUES ('1348', '1502810570');
INSERT INTO `test` VALUES ('1349', '1502810570');
INSERT INTO `test` VALUES ('1350', '1502810570');
INSERT INTO `test` VALUES ('1351', '1502810570');
INSERT INTO `test` VALUES ('1352', '1502810570');
INSERT INTO `test` VALUES ('1353', '1502810570');
INSERT INTO `test` VALUES ('1354', '1502810570');
INSERT INTO `test` VALUES ('1355', '1502810570');
INSERT INTO `test` VALUES ('1356', '1502810589');
INSERT INTO `test` VALUES ('1357', '1502810589');
INSERT INTO `test` VALUES ('1358', '1502810589');
INSERT INTO `test` VALUES ('1359', '1502810589');
INSERT INTO `test` VALUES ('1360', '1502810589');
INSERT INTO `test` VALUES ('1361', '1502810589');
INSERT INTO `test` VALUES ('1362', '1502810589');
INSERT INTO `test` VALUES ('1363', '1502810736');
INSERT INTO `test` VALUES ('1364', '1502810737');
INSERT INTO `test` VALUES ('1365', '1502810830');
INSERT INTO `test` VALUES ('1366', '1502810830');
INSERT INTO `test` VALUES ('1367', '1502810833');
INSERT INTO `test` VALUES ('1368', '1502810887');
INSERT INTO `test` VALUES ('1369', '1502810887');
INSERT INTO `test` VALUES ('1370', '1502810892');
INSERT INTO `test` VALUES ('1371', '1502810892');
INSERT INTO `test` VALUES ('1372', '1502812477');
INSERT INTO `test` VALUES ('1373', '1502812526');
INSERT INTO `test` VALUES ('1374', '1502853837');
INSERT INTO `test` VALUES ('1375', '1502853838');
INSERT INTO `test` VALUES ('1376', '1502853838');
INSERT INTO `test` VALUES ('1377', '1502853838');
INSERT INTO `test` VALUES ('1378', '1502853838');
INSERT INTO `test` VALUES ('1379', '1502853911');
INSERT INTO `test` VALUES ('1380', '1502853912');
INSERT INTO `test` VALUES ('1381', '1502853912');
INSERT INTO `test` VALUES ('1382', '1502853912');
INSERT INTO `test` VALUES ('1383', '1502853913');
INSERT INTO `test` VALUES ('1384', '1502853913');
INSERT INTO `test` VALUES ('1385', '1502853913');
INSERT INTO `test` VALUES ('1386', '1502853913');
INSERT INTO `test` VALUES ('1387', '1502869816');
INSERT INTO `test` VALUES ('1388', '1502869816');
INSERT INTO `test` VALUES ('1389', '1502869996');
INSERT INTO `test` VALUES ('1390', '1502869997');
INSERT INTO `test` VALUES ('1391', '1502881468');
INSERT INTO `test` VALUES ('1392', '1502881554');
INSERT INTO `test` VALUES ('1393', '1502881554');
INSERT INTO `test` VALUES ('1394', '1502881555');
INSERT INTO `test` VALUES ('1395', '1502881555');
INSERT INTO `test` VALUES ('1396', '1502881556');
INSERT INTO `test` VALUES ('1397', '1502881556');
INSERT INTO `test` VALUES ('1398', '1502881557');
INSERT INTO `test` VALUES ('1399', '1502881557');
INSERT INTO `test` VALUES ('1400', '1502881558');
INSERT INTO `test` VALUES ('1401', '1502881560');
INSERT INTO `test` VALUES ('1402', '1502881560');
INSERT INTO `test` VALUES ('1403', '1502881560');
INSERT INTO `test` VALUES ('1404', '1502881561');
INSERT INTO `test` VALUES ('1405', '1502890292');
INSERT INTO `test` VALUES ('1406', '1502890292');
INSERT INTO `test` VALUES ('1407', '1502947336');
INSERT INTO `test` VALUES ('1408', '1502947339');
INSERT INTO `test` VALUES ('1409', '1502947339');
INSERT INTO `test` VALUES ('1410', '1502947457');
INSERT INTO `test` VALUES ('1411', '1502947459');
INSERT INTO `test` VALUES ('1412', '1502947772');
INSERT INTO `test` VALUES ('1413', '1502947816');
INSERT INTO `test` VALUES ('1414', '1502947817');
INSERT INTO `test` VALUES ('1415', '1502953667');
INSERT INTO `test` VALUES ('1416', '1502953668');
INSERT INTO `test` VALUES ('1417', '1502953683');
INSERT INTO `test` VALUES ('1418', '1502953683');
INSERT INTO `test` VALUES ('1419', '1502953683');
INSERT INTO `test` VALUES ('1420', '1502953683');
INSERT INTO `test` VALUES ('1421', '1502953740');
INSERT INTO `test` VALUES ('1422', '1502953740');
INSERT INTO `test` VALUES ('1423', '1502954485');
INSERT INTO `test` VALUES ('1424', '1502954485');
INSERT INTO `test` VALUES ('1425', '1502954545');
INSERT INTO `test` VALUES ('1426', '1502954545');
INSERT INTO `test` VALUES ('1427', '1502954712');
INSERT INTO `test` VALUES ('1428', '1502954712');
INSERT INTO `test` VALUES ('1429', '1502954712');
INSERT INTO `test` VALUES ('1430', '1502954712');
INSERT INTO `test` VALUES ('1431', '1502954712');
INSERT INTO `test` VALUES ('1432', '1502954712');
INSERT INTO `test` VALUES ('1433', '1502954712');
INSERT INTO `test` VALUES ('1434', '1502954712');
INSERT INTO `test` VALUES ('1435', '1502954715');
INSERT INTO `test` VALUES ('1436', '1502954715');
INSERT INTO `test` VALUES ('1437', '1502954716');
INSERT INTO `test` VALUES ('1438', '1502954716');
INSERT INTO `test` VALUES ('1439', '1502954725');
INSERT INTO `test` VALUES ('1440', '1502954725');
INSERT INTO `test` VALUES ('1441', '1502954725');
INSERT INTO `test` VALUES ('1442', '1502954725');
INSERT INTO `test` VALUES ('1443', '1502954725');
INSERT INTO `test` VALUES ('1444', '1502954725');
INSERT INTO `test` VALUES ('1445', '1502954725');
INSERT INTO `test` VALUES ('1446', '1502954725');
INSERT INTO `test` VALUES ('1447', '1502954726');
INSERT INTO `test` VALUES ('1448', '1502954726');
INSERT INTO `test` VALUES ('1449', '1502954726');
INSERT INTO `test` VALUES ('1450', '1502954726');
INSERT INTO `test` VALUES ('1451', '1502954726');
INSERT INTO `test` VALUES ('1452', '1502954726');
INSERT INTO `test` VALUES ('1453', '1502954726');
INSERT INTO `test` VALUES ('1454', '1502954726');
INSERT INTO `test` VALUES ('1455', '1502954726');
INSERT INTO `test` VALUES ('1456', '1502954726');
INSERT INTO `test` VALUES ('1457', '1502954726');
INSERT INTO `test` VALUES ('1458', '1502954726');
INSERT INTO `test` VALUES ('1459', '1502954727');
INSERT INTO `test` VALUES ('1460', '1502954727');
INSERT INTO `test` VALUES ('1461', '1502954729');
INSERT INTO `test` VALUES ('1462', '1502954729');
INSERT INTO `test` VALUES ('1463', '1502954730');
INSERT INTO `test` VALUES ('1464', '1502954730');
INSERT INTO `test` VALUES ('1465', '1502954730');
INSERT INTO `test` VALUES ('1466', '1502954730');
INSERT INTO `test` VALUES ('1467', '1502954730');
INSERT INTO `test` VALUES ('1468', '1502954730');
INSERT INTO `test` VALUES ('1469', '1502954730');
INSERT INTO `test` VALUES ('1470', '1502954730');
INSERT INTO `test` VALUES ('1471', '1502954731');
INSERT INTO `test` VALUES ('1472', '1502954731');
INSERT INTO `test` VALUES ('1473', '1502954731');
INSERT INTO `test` VALUES ('1474', '1502954731');
INSERT INTO `test` VALUES ('1475', '1502954731');
INSERT INTO `test` VALUES ('1476', '1502954731');
INSERT INTO `test` VALUES ('1477', '1502954735');
INSERT INTO `test` VALUES ('1478', '1502954735');
INSERT INTO `test` VALUES ('1479', '1502954735');
INSERT INTO `test` VALUES ('1480', '1502954735');
INSERT INTO `test` VALUES ('1481', '1502954735');
INSERT INTO `test` VALUES ('1482', '1502954735');
INSERT INTO `test` VALUES ('1483', '1502954735');
INSERT INTO `test` VALUES ('1484', '1502954735');
INSERT INTO `test` VALUES ('1485', '1502954735');
INSERT INTO `test` VALUES ('1486', '1502954735');
INSERT INTO `test` VALUES ('1487', '1502954735');
INSERT INTO `test` VALUES ('1488', '1502954735');
INSERT INTO `test` VALUES ('1489', '1502954736');
INSERT INTO `test` VALUES ('1490', '1502954736');
INSERT INTO `test` VALUES ('1491', '1502954736');
INSERT INTO `test` VALUES ('1492', '1502954736');
INSERT INTO `test` VALUES ('1493', '1502954736');
INSERT INTO `test` VALUES ('1494', '1502954736');
INSERT INTO `test` VALUES ('1495', '1502954736');
INSERT INTO `test` VALUES ('1496', '1502954736');
INSERT INTO `test` VALUES ('1497', '1502954736');
INSERT INTO `test` VALUES ('1498', '1502954736');
INSERT INTO `test` VALUES ('1499', '1502954736');
INSERT INTO `test` VALUES ('1500', '1502954736');
INSERT INTO `test` VALUES ('1501', '1502954736');
INSERT INTO `test` VALUES ('1502', '1502954736');
INSERT INTO `test` VALUES ('1503', '1502954736');
INSERT INTO `test` VALUES ('1504', '1502954736');
INSERT INTO `test` VALUES ('1505', '1502954737');
INSERT INTO `test` VALUES ('1506', '1502954737');
INSERT INTO `test` VALUES ('1507', '1502954737');
INSERT INTO `test` VALUES ('1508', '1502954737');
INSERT INTO `test` VALUES ('1509', '1502954737');
INSERT INTO `test` VALUES ('1510', '1502954737');
INSERT INTO `test` VALUES ('1511', '1502954737');
INSERT INTO `test` VALUES ('1512', '1502954737');
INSERT INTO `test` VALUES ('1513', '1502954740');
INSERT INTO `test` VALUES ('1514', '1502954740');
INSERT INTO `test` VALUES ('1515', '1502954750');
INSERT INTO `test` VALUES ('1516', '1502954750');
INSERT INTO `test` VALUES ('1517', '1502954750');
INSERT INTO `test` VALUES ('1518', '1502954750');
INSERT INTO `test` VALUES ('1519', '1502954751');
INSERT INTO `test` VALUES ('1520', '1502954751');
INSERT INTO `test` VALUES ('1521', '1502954751');
INSERT INTO `test` VALUES ('1522', '1502954751');
INSERT INTO `test` VALUES ('1523', '1502954751');
INSERT INTO `test` VALUES ('1524', '1502954751');
INSERT INTO `test` VALUES ('1525', '1502954753');
INSERT INTO `test` VALUES ('1526', '1502954753');
INSERT INTO `test` VALUES ('1527', '1502954754');
INSERT INTO `test` VALUES ('1528', '1502954754');
INSERT INTO `test` VALUES ('1529', '1502954755');
INSERT INTO `test` VALUES ('1530', '1502954755');
INSERT INTO `test` VALUES ('1531', '1502954756');
INSERT INTO `test` VALUES ('1532', '1502954756');
INSERT INTO `test` VALUES ('1533', '1502954772');
INSERT INTO `test` VALUES ('1534', '1502954772');
INSERT INTO `test` VALUES ('1535', '1502954777');
INSERT INTO `test` VALUES ('1536', '1502954777');
INSERT INTO `test` VALUES ('1537', '1502954789');
INSERT INTO `test` VALUES ('1538', '1502954790');
INSERT INTO `test` VALUES ('1539', '1502954969');
INSERT INTO `test` VALUES ('1540', '1502954969');
INSERT INTO `test` VALUES ('1541', '1502954969');
INSERT INTO `test` VALUES ('1542', '1502954969');
INSERT INTO `test` VALUES ('1543', '1502954969');
INSERT INTO `test` VALUES ('1544', '1502954969');
INSERT INTO `test` VALUES ('1545', '1502954969');
INSERT INTO `test` VALUES ('1546', '1502954969');
INSERT INTO `test` VALUES ('1547', '1502954969');
INSERT INTO `test` VALUES ('1548', '1502954969');
INSERT INTO `test` VALUES ('1549', '1502954969');
INSERT INTO `test` VALUES ('1550', '1502954969');
INSERT INTO `test` VALUES ('1551', '1502954969');
INSERT INTO `test` VALUES ('1552', '1502954969');
INSERT INTO `test` VALUES ('1553', '1502954969');
INSERT INTO `test` VALUES ('1554', '1502954969');
INSERT INTO `test` VALUES ('1555', '1502954969');
INSERT INTO `test` VALUES ('1556', '1502954973');
INSERT INTO `test` VALUES ('1557', '1502954974');
INSERT INTO `test` VALUES ('1558', '1502954974');
INSERT INTO `test` VALUES ('1559', '1502954974');
INSERT INTO `test` VALUES ('1560', '1502954974');
INSERT INTO `test` VALUES ('1561', '1502954974');
INSERT INTO `test` VALUES ('1562', '1502954974');
INSERT INTO `test` VALUES ('1563', '1502954974');
INSERT INTO `test` VALUES ('1564', '1502954974');
INSERT INTO `test` VALUES ('1565', '1502954974');
INSERT INTO `test` VALUES ('1566', '1502954974');
INSERT INTO `test` VALUES ('1567', '1502954974');
INSERT INTO `test` VALUES ('1568', '1502954974');
INSERT INTO `test` VALUES ('1569', '1502954974');
INSERT INTO `test` VALUES ('1570', '1502954974');
INSERT INTO `test` VALUES ('1571', '1502954975');
INSERT INTO `test` VALUES ('1572', '1502954975');
INSERT INTO `test` VALUES ('1573', '1502954975');
INSERT INTO `test` VALUES ('1574', '1502954975');
INSERT INTO `test` VALUES ('1575', '1502954975');
INSERT INTO `test` VALUES ('1576', '1502954975');
INSERT INTO `test` VALUES ('1577', '1502954975');
INSERT INTO `test` VALUES ('1578', '1502954975');
INSERT INTO `test` VALUES ('1579', '1502954975');
INSERT INTO `test` VALUES ('1580', '1502954975');
INSERT INTO `test` VALUES ('1581', '1502954975');
INSERT INTO `test` VALUES ('1582', '1502954976');
INSERT INTO `test` VALUES ('1583', '1502954976');
INSERT INTO `test` VALUES ('1584', '1502954976');
INSERT INTO `test` VALUES ('1585', '1502954976');
INSERT INTO `test` VALUES ('1586', '1502954976');
INSERT INTO `test` VALUES ('1587', '1502955091');
INSERT INTO `test` VALUES ('1588', '1502955091');
INSERT INTO `test` VALUES ('1589', '1502955091');
INSERT INTO `test` VALUES ('1590', '1502955091');
INSERT INTO `test` VALUES ('1591', '1502955091');
INSERT INTO `test` VALUES ('1592', '1502955091');
INSERT INTO `test` VALUES ('1593', '1502955091');
INSERT INTO `test` VALUES ('1594', '1502955091');
INSERT INTO `test` VALUES ('1595', '1502955091');
INSERT INTO `test` VALUES ('1596', '1502955091');
INSERT INTO `test` VALUES ('1597', '1502955091');
INSERT INTO `test` VALUES ('1598', '1502955091');
INSERT INTO `test` VALUES ('1599', '1502955091');
INSERT INTO `test` VALUES ('1600', '1502955091');
INSERT INTO `test` VALUES ('1601', '1502955091');
INSERT INTO `test` VALUES ('1602', '1502955091');
INSERT INTO `test` VALUES ('1603', '1502955092');
INSERT INTO `test` VALUES ('1604', '1502955092');
INSERT INTO `test` VALUES ('1605', '1502955092');
INSERT INTO `test` VALUES ('1606', '1502955092');
INSERT INTO `test` VALUES ('1607', '1502955092');
INSERT INTO `test` VALUES ('1608', '1502955092');
INSERT INTO `test` VALUES ('1609', '1502955092');
INSERT INTO `test` VALUES ('1610', '1502955092');
INSERT INTO `test` VALUES ('1611', '1502955092');
INSERT INTO `test` VALUES ('1612', '1502955092');
INSERT INTO `test` VALUES ('1613', '1502955092');
INSERT INTO `test` VALUES ('1614', '1502955092');
INSERT INTO `test` VALUES ('1615', '1502955092');
INSERT INTO `test` VALUES ('1616', '1502955092');
INSERT INTO `test` VALUES ('1617', '1502955092');
INSERT INTO `test` VALUES ('1618', '1502955092');
INSERT INTO `test` VALUES ('1619', '1502955092');
INSERT INTO `test` VALUES ('1620', '1502955092');
INSERT INTO `test` VALUES ('1621', '1502955093');
INSERT INTO `test` VALUES ('1622', '1502955093');
INSERT INTO `test` VALUES ('1623', '1502955093');
INSERT INTO `test` VALUES ('1624', '1502955093');
INSERT INTO `test` VALUES ('1625', '1502955093');
INSERT INTO `test` VALUES ('1626', '1502955093');
INSERT INTO `test` VALUES ('1627', '1502955093');
INSERT INTO `test` VALUES ('1628', '1502955093');
INSERT INTO `test` VALUES ('1629', '1502955093');
INSERT INTO `test` VALUES ('1630', '1502955093');
INSERT INTO `test` VALUES ('1631', '1502955093');
INSERT INTO `test` VALUES ('1632', '1502955093');
INSERT INTO `test` VALUES ('1633', '1502955093');
INSERT INTO `test` VALUES ('1634', '1502955093');
INSERT INTO `test` VALUES ('1635', '1502955093');
INSERT INTO `test` VALUES ('1636', '1502955093');
INSERT INTO `test` VALUES ('1637', '1502955093');
INSERT INTO `test` VALUES ('1638', '1502955093');
INSERT INTO `test` VALUES ('1639', '1502955093');
INSERT INTO `test` VALUES ('1640', '1502955093');
INSERT INTO `test` VALUES ('1641', '1502955093');
INSERT INTO `test` VALUES ('1642', '1502955093');
INSERT INTO `test` VALUES ('1643', '1502955093');
INSERT INTO `test` VALUES ('1644', '1502955093');
INSERT INTO `test` VALUES ('1645', '1502955094');
INSERT INTO `test` VALUES ('1646', '1502955094');
INSERT INTO `test` VALUES ('1647', '1502955094');
INSERT INTO `test` VALUES ('1648', '1502955094');
INSERT INTO `test` VALUES ('1649', '1502955094');
INSERT INTO `test` VALUES ('1650', '1502955094');
INSERT INTO `test` VALUES ('1651', '1502955094');
INSERT INTO `test` VALUES ('1652', '1502955095');
INSERT INTO `test` VALUES ('1653', '1502955095');
INSERT INTO `test` VALUES ('1654', '1502955095');
INSERT INTO `test` VALUES ('1655', '1502955095');
INSERT INTO `test` VALUES ('1656', '1502955095');
INSERT INTO `test` VALUES ('1657', '1502955095');
INSERT INTO `test` VALUES ('1658', '1502955095');
INSERT INTO `test` VALUES ('1659', '1502955095');
INSERT INTO `test` VALUES ('1660', '1502955095');
INSERT INTO `test` VALUES ('1661', '1502955095');
INSERT INTO `test` VALUES ('1662', '1502955096');
INSERT INTO `test` VALUES ('1663', '1502955096');
INSERT INTO `test` VALUES ('1664', '1502955096');
INSERT INTO `test` VALUES ('1665', '1502955213');
INSERT INTO `test` VALUES ('1666', '1502955213');
INSERT INTO `test` VALUES ('1667', '1502955213');
INSERT INTO `test` VALUES ('1668', '1502955214');
INSERT INTO `test` VALUES ('1669', '1502955214');
INSERT INTO `test` VALUES ('1670', '1502955214');
INSERT INTO `test` VALUES ('1671', '1502961257');
INSERT INTO `test` VALUES ('1672', '1502961287');
INSERT INTO `test` VALUES ('1673', '1502961288');
INSERT INTO `test` VALUES ('1674', '1502961289');
