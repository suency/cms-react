/*
 Navicat Premium Data Transfer

 Source Server         : 会惠康remote
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 47.99.35.129:3306
 Source Schema         : social

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 27/08/2020 14:14:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_custom_forms
-- ----------------------------
DROP TABLE IF EXISTS `admin_custom_forms`;
CREATE TABLE `admin_custom_forms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `json` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_custom_forms
-- ----------------------------
INSERT INTO `admin_custom_forms` VALUES (1, '用户账号', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":false,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1577700483000_36659\"},\"name\":\"账号\",\"key\":\"1577700483000_36659\",\"model\":\"username\",\"rules\":[{\"type\":\"string\",\"message\":\"账号格式不正确\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":false,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1580215564000_69048\"},\"name\":\"密码\",\"key\":\"1580215564000_69048\",\"model\":\"password\",\"rules\":[{\"type\":\"string\",\"message\":\"密码格式不正确\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":false,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1580215569000_45365\"},\"name\":\"描述\",\"key\":\"1580215569000_45365\",\"model\":\"des\",\"rules\":[{\"type\":\"string\",\"message\":\"描述格式不正确\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"top\",\"size\":\"medium\"}}', '2019-12-30 18:09:09');
INSERT INTO `admin_custom_forms` VALUES (2, '变淡1', '{\"list\":[{\"type\":\"checkbox\",\"icon\":\"icon-check-box\",\"options\":{\"inline\":false,\"defaultValue\":[],\"showLabel\":false,\"options\":[{\"value\":\"Option 1\"},{\"value\":\"Option 2\"},{\"value\":\"Option 3\"}],\"required\":false,\"width\":\"\",\"remote\":false,\"remoteOptions\":[],\"props\":{\"value\":\"value\",\"label\":\"label\"},\"remoteFunc\":\"func_1577700601000_95764\",\"disabled\":false},\"name\":\"多选框组\",\"key\":\"1577700601000_95764\",\"model\":\"checkbox_1577700601000_95764\",\"rules\":[]},{\"type\":\"grid\",\"icon\":\"icon-grid-\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"radio\",\"icon\":\"icon-radio-active\",\"options\":{\"inline\":false,\"defaultValue\":\"\",\"showLabel\":false,\"options\":[{\"value\":\"Option 1\",\"label\":\"Option 1\"},{\"value\":\"Option 2\",\"label\":\"Option 2\"},{\"value\":\"Option 3\",\"label\":\"Option 3\"}],\"required\":false,\"width\":\"\",\"remote\":false,\"remoteOptions\":[],\"props\":{\"value\":\"value\",\"label\":\"label\"},\"remoteFunc\":\"func_1577700598000_45565\",\"disabled\":false},\"name\":\"单选框组\",\"key\":\"1577700598000_45565\",\"model\":\"radio_1577700598000_45565\",\"rules\":[]}]},{\"span\":12,\"list\":[{\"type\":\"rate\",\"icon\":\"icon-pingfen1\",\"options\":{\"defaultValue\":0,\"max\":5,\"disabled\":false,\"allowHalf\":false,\"required\":false,\"remoteFunc\":\"func_1577700605000_60312\"},\"name\":\"评分\",\"key\":\"1577700605000_60312\",\"model\":\"rate_1577700605000_60312\",\"rules\":[]}]}],\"options\":{\"gutter\":0,\"justify\":\"start\",\"align\":\"top\",\"remoteFunc\":\"func_1577700596000_94629\"},\"name\":\"栅格布局\",\"key\":\"1577700596000_94629\",\"model\":\"grid_1577700596000_94629\",\"rules\":[]},{\"type\":\"switch\",\"icon\":\"icon-switch\",\"options\":{\"defaultValue\":false,\"required\":false,\"disabled\":false,\"remoteFunc\":\"func_1577700611000_23341\"},\"name\":\"开关\",\"key\":\"1577700611000_23341\",\"model\":\"switch_1577700611000_23341\",\"rules\":[]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2019-12-30 18:10:48');
INSERT INTO `admin_custom_forms` VALUES (3, 'sss', '{\"list\":[{\"type\":\"date\",\"icon\":\"icon-date\",\"options\":{\"defaultValue\":\"\",\"readonly\":false,\"disabled\":false,\"editable\":true,\"clearable\":true,\"placeholder\":\"\",\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"type\":\"date\",\"format\":\"yyyy-MM-dd\",\"timestamp\":false,\"required\":false,\"width\":\"\",\"remoteFunc\":\"func_1577710393000_69107\"},\"name\":\"日期选择器\",\"key\":\"1577710393000_69107\",\"model\":\"date_1577710393000_69107\",\"rules\":[]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2019-12-30 20:53:15');
INSERT INTO `admin_custom_forms` VALUES (5, 'test', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":false,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1577715206000_98114\"},\"name\":\"单行文本\",\"key\":\"1577715206000_98114\",\"model\":\"myname\",\"rules\":[{\"type\":\"string\",\"message\":\"单行文本格式不正确\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2019-12-30 22:13:29');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alwaysShow` int(11) NULL DEFAULT 0,
  `noCache` int(11) NULL DEFAULT 0,
  `breadcrumb` int(11) NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hidden` int(11) NULL DEFAULT 0,
  `activeMenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank` int(11) NULL DEFAULT 0,
  `display` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 0, 1, 'Permission', '/permission/page', 'permission', 'Layout', 0, '/permission', 'lock', 'admin,editor', 0, NULL, 12, 1);
INSERT INTO `admin_menu` VALUES (2, 0, 0, 1, 'PagePermission', '', 'pagePermission', 'permission/page', 1, 'page', NULL, 'admin', 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (3, 0, 0, 1, 'DirectivePermission', '', 'directivePermission', 'permission/directive', 1, 'directive', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (4, 0, 0, 1, 'RolePermission', '', 'rolePermission', 'permission/role', 1, 'role', NULL, 'admin', 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (5, 0, 0, 1, 'IconsP', NULL, '图标', 'Layout', 0, '/icon', '', NULL, 0, NULL, 90, 1);
INSERT INTO `admin_menu` VALUES (6, 0, 0, 1, 'Icons', NULL, '图标', 'icons/index', 5, 'index', 'icon', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (7, 0, 0, 1, 'ComponentDemo', 'noRedirect', 'components', 'Layout', 0, '/components', 'component', NULL, 0, NULL, 1, 1);
INSERT INTO `admin_menu` VALUES (8, 0, 0, 1, 'TinymceDemo', NULL, 'tinymce', 'components-demo/tinymce', 7, 'tinymce', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (9, 0, 0, 1, 'MarkdownDemo', NULL, 'markdown', 'components-demo/markdown', 7, 'markdown', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (10, 0, 0, 1, 'JsonEditorDemo', NULL, 'jsonEditor', 'components-demo/json-editor', 7, 'json-editor', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (11, 0, 0, 1, 'SplitpaneDemo', NULL, 'splitPane', 'components-demo/split-pane', 7, 'split-pane', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (12, 0, 0, 1, 'AvatarUploadDemo', NULL, 'avatarUpload', 'components-demo/avatar-upload', 7, 'avatar-upload', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (13, 0, 0, 1, 'DropzoneDemo', NULL, 'dropzone', 'components-demo/dropzone', 7, 'dropzone', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (14, 0, 0, 1, 'StickyDemo', NULL, 'sticky', 'components-demo/sticky', 7, 'sticky', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (15, 0, 0, 1, 'CountToDemo', NULL, 'countTo', 'components-demo/count-to', 7, 'count-to', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (16, 0, 0, 1, 'ComponentMixinDemo', NULL, 'componentMixin', 'components-demo/mixin', 7, 'mixin', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (17, 0, 0, 1, 'BackToTopDemo', NULL, 'backToTop', 'components-demo/back-to-top', 7, 'back-to-top', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (18, 0, 0, 1, 'DragDialogDemo', NULL, 'dragDialog', 'components-demo/drag-dialog', 7, 'drag-dialog', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (19, 0, 0, 1, 'DragSelectDemo', NULL, 'dragSelect', 'components-demo/drag-select', 7, 'drag-select', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (20, 0, 0, 1, 'DndListDemo', NULL, 'dndList', 'components-demo/dnd-list', 7, 'dnd-list', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (21, 0, 0, 1, 'DragKanbanDemo', NULL, 'dragKanban', 'components-demo/drag-kanban', 7, 'drag-kanban', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (22, 0, 0, 1, 'Charts', 'noRedirect', 'charts', 'Layout', 0, '/charts', 'chart', NULL, 0, NULL, 5, 1);
INSERT INTO `admin_menu` VALUES (23, 0, 1, 1, 'KeyboardChart', NULL, 'keyboardChart', 'charts/keyboard', 22, 'keyboard', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (24, 0, 1, 1, 'LineChart', NULL, 'lineChart', 'charts/line', 22, 'line', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (25, 0, 1, 1, 'MixChart', NULL, 'mixChart', 'charts/mix-chart', 22, 'mix-chart', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (26, 0, 0, 1, 'Nested', '/nested/menu1/menu1-1', 'nested', 'Layout', 0, '/nested', 'nested', NULL, 0, NULL, 6, 0);
INSERT INTO `admin_menu` VALUES (27, 0, 0, 1, 'Menu1', '/nested/menu1/menu1-1', 'menu1', 'nested/menu1/index', 26, 'menu1', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (28, 0, 0, 1, 'Menu1-1', NULL, 'menu1-1', 'nested/menu1/menu1-1', 27, 'menu1-1', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (29, 0, 0, 1, 'Menu1-2', '/nested/menu1/menu1-2/menu1-2-1', 'menu1-2', 'nested/menu1/menu1-2', 27, 'menu1-2', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (30, 0, 0, 1, 'Menu1-2-1', NULL, 'menu1-2-1', 'nested/menu1/menu1-2/menu1-2-1', 29, 'menu1-2-1', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (31, 0, 0, 1, 'Menu1-2-2', NULL, 'menu1-2-2', 'nested/menu1/menu1-2/menu1-2-2', 29, 'menu1-2-2', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (32, 0, 0, 1, 'Menu1-3', NULL, 'menu1-3', 'nested/menu1/menu1-3', 27, 'menu1-3', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (33, 0, 0, 1, 'Menu2', NULL, 'menu2', 'nested/menu2/index', 26, 'menu2', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (34, 0, 0, 1, 'Table', '/table/complex-table', 'Table', 'Layout', 0, '/table', 'table', NULL, 0, NULL, 8, 1);
INSERT INTO `admin_menu` VALUES (35, 0, 0, 1, 'DynamicTable', NULL, 'dynamicTable', 'table/dynamic-table/index', 34, 'dynamic-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (36, 0, 0, 1, 'DragTable', NULL, 'dragTable', 'table/drag-table', 34, 'drag-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (37, 0, 0, 1, 'InlineEditTable', NULL, 'inlineEditTable', 'table/inline-edit-table', 34, 'inline-edit-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (38, 0, 0, 1, 'ComplexTable', NULL, 'complexTable', 'table/complex-table', 34, 'complex-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (39, 0, 0, 1, 'Example', '/example/list', 'example', 'Layout', 0, '/example', NULL, NULL, 0, NULL, 2, 1);
INSERT INTO `admin_menu` VALUES (40, 0, 0, 1, 'CreateArticle', NULL, 'createArticle', 'example/create', 39, 'create', 'edit', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (41, 0, 1, 1, 'EditArticle', NULL, 'editArticle', 'example/edit', 39, 'edit/:id(\\d+)', NULL, NULL, 1, '/example/list', 0, 1);
INSERT INTO `admin_menu` VALUES (42, 0, 0, 1, 'ArticleList', NULL, 'articleList', 'example/list', 39, 'list', 'list', NULL, 0, '', 0, 1);
INSERT INTO `admin_menu` VALUES (43, 0, 0, 1, 'TabP', NULL, 'tab', 'Layout', 0, '/tab', NULL, NULL, 0, NULL, 14, 1);
INSERT INTO `admin_menu` VALUES (44, 0, 0, 1, 'Tab', NULL, 'tab', 'tab/index', 43, 'index', 'tab', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (45, 0, 0, 1, 'ErrorPages', NULL, 'errorPages', 'Layout', 0, '/error', '404', NULL, 0, NULL, 7, 0);
INSERT INTO `admin_menu` VALUES (46, 0, 1, 1, 'Page401P', NULL, 'page401', 'error-page/401', 45, '401', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (47, 0, 1, 1, 'Page404', NULL, 'page404', 'error-page/404', 45, '404', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (48, 0, 0, 1, 'ErrorLogP', NULL, 'errorLog', 'Layout', 0, '/error-log', NULL, NULL, 0, NULL, 9, 0);
INSERT INTO `admin_menu` VALUES (49, 0, 0, 1, 'ErrorLog', NULL, 'errorLog', 'error-log/index', 48, 'log', 'bug', NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (50, 1, 0, 1, 'Excel2', '/excel/export-excel', 'Excel2', 'Layout', 0, '/excel', 'excel', NULL, 0, NULL, 20, 1);
INSERT INTO `admin_menu` VALUES (51, 0, 0, 1, 'ExportExcel', NULL, 'exportExcel', 'excel/export-excel', 50, 'export-excel', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (52, 0, 0, 1, 'SelectExcel', NULL, 'selectExcel', 'excel/select-excel', 50, 'export-selected-excel', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (53, 0, 0, 1, 'MergeHeader', NULL, 'mergeHeader', 'excel/merge-header', 50, 'export-merge-header', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (54, 0, 0, 1, 'UploadExcel', NULL, 'uploadExcel', 'excel/upload-excel', 50, 'upload-excel', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (55, 1, 0, 1, 'Zip', '/zip/download', 'zip', 'Layout', 0, '/zip', 'zip', NULL, 0, NULL, 16, 1);
INSERT INTO `admin_menu` VALUES (56, 0, 0, 1, 'ExportZip', NULL, 'exportZip', 'zip/index', 55, 'download', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (57, 0, 0, 1, 'PDFP', '/pdf/index', 'pdf', 'Layout', 0, '/pdf', NULL, NULL, 0, NULL, 17, 0);
INSERT INTO `admin_menu` VALUES (58, 0, 0, 1, 'PDF', NULL, 'pdf', 'pdf/index', 57, 'index', 'pdf', NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (59, 0, 0, 1, 'ThemeP', NULL, 'theme', 'Layout', 0, '/theme', NULL, NULL, 0, NULL, 22, 1);
INSERT INTO `admin_menu` VALUES (60, 0, 0, 1, 'Theme', NULL, 'theme', 'theme/index', 59, 'index', 'theme', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (61, 0, 0, 1, 'ClipboardDemoP', NULL, 'clipboardDemo', 'Layout', 0, '/clipboard', NULL, NULL, 0, NULL, 64, 1);
INSERT INTO `admin_menu` VALUES (62, 0, 0, 1, 'ClipboardDemo', NULL, 'clipboardDemo', 'clipboard/index', 61, 'index', 'clipboard', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (63, 0, 0, 1, 'I18nP', NULL, 'i18n', 'Layout', 0, '/i18n', NULL, NULL, 0, NULL, 33, 0);
INSERT INTO `admin_menu` VALUES (64, 0, 0, 1, 'I18n', NULL, 'i18n', 'i18n-demo/index', 63, 'index', 'international', NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu` VALUES (65, 0, 0, 1, NULL, NULL, 'externalLink', 'Layout', 0, 'external-link', NULL, NULL, 0, NULL, 32, 1);
INSERT INTO `admin_menu` VALUES (66, 0, 0, 1, '', NULL, 'externalLink', NULL, 65, 'https://github.com/PanJiaChen/vue-element-admin', 'link', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (68, 1, 0, 1, '系统管理', '', '系统管理', 'Layout', 0, '/sys-mgt', 'sysadmin', 'admin', 0, NULL, 99, 1);
INSERT INTO `admin_menu` VALUES (69, 0, 0, 1, '菜单管理', NULL, '菜单管理', 'admin-pages/menu-mgt/index', 68, 'menu', 'menu', NULL, 0, NULL, 1, 1);
INSERT INTO `admin_menu` VALUES (70, 0, 0, 1, '角色管理', NULL, '角色管理', 'admin-pages/role-mgt/role', 68, 'roles', 'role', NULL, 0, NULL, 2, 1);
INSERT INTO `admin_menu` VALUES (71, 0, 0, 1, '参数配置', NULL, '参数配置', 'admin-pages/param/param', 68, 'param', 'param', NULL, 0, NULL, 3, 1);
INSERT INTO `admin_menu` VALUES (72, 0, 0, 1, '系统用户', NULL, '系统用户', 'admin-pages/sysuser/sysuser', 68, 'sysuser', 'sysuser', NULL, 0, NULL, 4, 1);
INSERT INTO `admin_menu` VALUES (73, 1, 0, 1, '投票管理', NULL, '投票管理', 'Layout', 0, '/vote', 'chart', NULL, 0, NULL, 120, 1);
INSERT INTO `admin_menu` VALUES (74, 0, 0, 1, '内容管理', NULL, '内容管理', 'admin-pages/tip/tip', 73, 'content', 'component', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (75, 0, 0, 1, '自定义表单', NULL, '自定义表单', 'admin-pages/custom-form/custom-form', 68, 'custom-form', 'form', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (76, 0, 0, 1, '表单列表', NULL, '表单列表', 'admin-pages/form-list/form-list', 68, 'form-list', 'list', NULL, 0, NULL, 12, 1);
INSERT INTO `admin_menu` VALUES (77, 1, 0, 1, '用户管理', NULL, '用户管理', 'Layout', 0, '/hhkuser', 'user', NULL, 0, NULL, 111, 1);
INSERT INTO `admin_menu` VALUES (78, 0, 0, 1, '用户列表', NULL, '用户列表', 'admin-pages/userlist/userlist', 77, 'userlist', 'eye', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (79, 0, 0, 1, '动态列表', NULL, '动态列表', 'admin-pages/caselist/caselist', 88, 'caselist', 'international', NULL, 0, NULL, 102, 1);
INSERT INTO `admin_menu` VALUES (80, 0, 0, 1, '查看动态详情', NULL, '查看动态详情', 'admin-pages/caselist/casedetail', 88, 'casedetail/:id(\\d+)', '', NULL, 1, 'admin-pages/caselist/caselist', 0, 1);
INSERT INTO `admin_menu` VALUES (81, 0, 0, 1, '医生列表', NULL, '医生列表', 'admin-pages/userlist/doctorlist', 77, 'doctorlist', 'peoples', NULL, 0, NULL, 102, 1);
INSERT INTO `admin_menu` VALUES (82, 1, 0, 1, '资金管理', NULL, '资金管理', 'Layout', 0, '/money', 'money', NULL, 0, NULL, 101, 1);
INSERT INTO `admin_menu` VALUES (83, 0, 0, 1, '消费记录', NULL, '消费记录', 'admin-pages/money/consume', 82, 'consume', 'skill', NULL, 0, NULL, 100, 1);
INSERT INTO `admin_menu` VALUES (84, 0, 0, 1, '提现管理', NULL, '提现管理', 'admin-pages/money/withdraw', 82, 'withdraw', 'param', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (85, 1, 0, 1, '活动管理', NULL, '活动管理', 'Layout', 0, '/activity', 'star', NULL, 0, NULL, 99, 1);
INSERT INTO `admin_menu` VALUES (86, 0, 0, 1, '轮播管理', NULL, '轮播管理', 'admin-pages/activity/banner', 85, 'banner', 'education', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (87, 0, 0, 1, '收入记录', NULL, '收入记录', 'admin-pages/money/income', 82, 'income', 'excel', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (88, 1, 0, 1, '动态管理', NULL, '动态管理', 'Layout', 0, '/dong', 'guide', NULL, 0, NULL, 101, 1);
INSERT INTO `admin_menu` VALUES (89, 1, 0, 1, '小组管理', NULL, '小组管理', 'Layout', 0, '/group', 'peoples', NULL, 0, NULL, 103, 1);
INSERT INTO `admin_menu` VALUES (90, 0, 0, 1, '小组列表', NULL, '小组列表', 'admin-pages/group/grouplist', 89, 'grouplist', 'list', NULL, 0, NULL, 103, 1);
INSERT INTO `admin_menu` VALUES (91, 0, 0, 1, '查看小组详情', NULL, '查看小组详情', 'admin-pages/group/groupdetail', 89, 'groupdetail/:id(\\d+)', 'documentation', NULL, 1, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (92, 0, 0, 1, '数据库管理', NULL, '数据库管理', 'admin-pages/db/dblist', 68, 'db', 'table', NULL, 0, NULL, 13, 1);
INSERT INTO `admin_menu` VALUES (93, 0, 0, 1, '代码', NULL, '代码', 'admin-pages/db/code', 68, 'code', 'password', NULL, 1, NULL, 0, 1);
INSERT INTO `admin_menu` VALUES (94, 0, 0, 1, '小组推荐', NULL, '小组推荐', 'admin-pages/group/groupremd', 89, 'groupremd', 'example', NULL, 0, NULL, 101, 1);
INSERT INTO `admin_menu` VALUES (95, 0, 0, 1, '投诉列表', NULL, '投诉列表', 'admin-pages/complaint/complaintlist', 88, 'complaint', 'people', NULL, 0, NULL, 100, 1);

-- ----------------------------
-- Table structure for admin_menu_bak
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu_bak`;
CREATE TABLE `admin_menu_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alwaysShow` int(11) NULL DEFAULT 0,
  `noCache` int(11) NULL DEFAULT 0,
  `breadcrumb` int(11) NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hidden` int(11) NULL DEFAULT 0,
  `activeMenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank` int(11) NULL DEFAULT 0,
  `display` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_menu_bak
-- ----------------------------
INSERT INTO `admin_menu_bak` VALUES (1, 0, 0, 1, 'Permission', '/permission/page', 'permission', 'Layout', 0, '/permission', 'lock', 'admin,editor', 0, NULL, 12, 1);
INSERT INTO `admin_menu_bak` VALUES (2, 0, 0, 1, 'PagePermission', '', 'pagePermission', 'permission/page', 1, 'page', NULL, 'admin', 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (3, 0, 0, 1, 'DirectivePermission', '', 'directivePermission', 'permission/directive', 1, 'directive', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (4, 0, 0, 1, 'RolePermission', '', 'rolePermission', 'permission/role', 1, 'role', NULL, 'admin', 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (5, 0, 0, 1, 'IconsP', NULL, '图标', 'Layout', 0, '/icon', '', NULL, 0, NULL, 90, 1);
INSERT INTO `admin_menu_bak` VALUES (6, 0, 0, 1, 'Icons', NULL, '图标', 'icons/index', 5, 'index', 'icon', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (7, 0, 0, 1, 'ComponentDemo', 'noRedirect', 'components', 'Layout', 0, '/components', 'component', NULL, 0, NULL, 1, 1);
INSERT INTO `admin_menu_bak` VALUES (8, 0, 0, 1, 'TinymceDemo', NULL, 'tinymce', 'components-demo/tinymce', 7, 'tinymce', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (9, 0, 0, 1, 'MarkdownDemo', NULL, 'markdown', 'components-demo/markdown', 7, 'markdown', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (10, 0, 0, 1, 'JsonEditorDemo', NULL, 'jsonEditor', 'components-demo/json-editor', 7, 'json-editor', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (11, 0, 0, 1, 'SplitpaneDemo', NULL, 'splitPane', 'components-demo/split-pane', 7, 'split-pane', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (12, 0, 0, 1, 'AvatarUploadDemo', NULL, 'avatarUpload', 'components-demo/avatar-upload', 7, 'avatar-upload', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (13, 0, 0, 1, 'DropzoneDemo', NULL, 'dropzone', 'components-demo/dropzone', 7, 'dropzone', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (14, 0, 0, 1, 'StickyDemo', NULL, 'sticky', 'components-demo/sticky', 7, 'sticky', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (15, 0, 0, 1, 'CountToDemo', NULL, 'countTo', 'components-demo/count-to', 7, 'count-to', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (16, 0, 0, 1, 'ComponentMixinDemo', NULL, 'componentMixin', 'components-demo/mixin', 7, 'mixin', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (17, 0, 0, 1, 'BackToTopDemo', NULL, 'backToTop', 'components-demo/back-to-top', 7, 'back-to-top', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (18, 0, 0, 1, 'DragDialogDemo', NULL, 'dragDialog', 'components-demo/drag-dialog', 7, 'drag-dialog', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (19, 0, 0, 1, 'DragSelectDemo', NULL, 'dragSelect', 'components-demo/drag-select', 7, 'drag-select', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (20, 0, 0, 1, 'DndListDemo', NULL, 'dndList', 'components-demo/dnd-list', 7, 'dnd-list', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (21, 0, 0, 1, 'DragKanbanDemo', NULL, 'dragKanban', 'components-demo/drag-kanban', 7, 'drag-kanban', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (22, 0, 0, 1, 'Charts', 'noRedirect', 'charts', 'Layout', 0, '/charts', 'chart', NULL, 0, NULL, 5, 1);
INSERT INTO `admin_menu_bak` VALUES (23, 0, 1, 1, 'KeyboardChart', NULL, 'keyboardChart', 'charts/keyboard', 22, 'keyboard', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (24, 0, 1, 1, 'LineChart', NULL, 'lineChart', 'charts/line', 22, 'line', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (25, 0, 1, 1, 'MixChart', NULL, 'mixChart', 'charts/mix-chart', 22, 'mix-chart', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (26, 0, 0, 1, 'Nested', '/nested/menu1/menu1-1', 'nested', 'Layout', 0, '/nested', 'nested', NULL, 0, NULL, 6, 0);
INSERT INTO `admin_menu_bak` VALUES (27, 0, 0, 1, 'Menu1', '/nested/menu1/menu1-1', 'menu1', 'nested/menu1/index', 26, 'menu1', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (28, 0, 0, 1, 'Menu1-1', NULL, 'menu1-1', 'nested/menu1/menu1-1', 27, 'menu1-1', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (29, 0, 0, 1, 'Menu1-2', '/nested/menu1/menu1-2/menu1-2-1', 'menu1-2', 'nested/menu1/menu1-2', 27, 'menu1-2', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (30, 0, 0, 1, 'Menu1-2-1', NULL, 'menu1-2-1', 'nested/menu1/menu1-2/menu1-2-1', 29, 'menu1-2-1', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (31, 0, 0, 1, 'Menu1-2-2', NULL, 'menu1-2-2', 'nested/menu1/menu1-2/menu1-2-2', 29, 'menu1-2-2', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (32, 0, 0, 1, 'Menu1-3', NULL, 'menu1-3', 'nested/menu1/menu1-3', 27, 'menu1-3', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (33, 0, 0, 1, 'Menu2', NULL, 'menu2', 'nested/menu2/index', 26, 'menu2', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (34, 0, 0, 1, 'Table', '/table/complex-table', 'Table', 'Layout', 0, '/table', 'table', NULL, 0, NULL, 8, 1);
INSERT INTO `admin_menu_bak` VALUES (35, 0, 0, 1, 'DynamicTable', NULL, 'dynamicTable', 'table/dynamic-table/index', 34, 'dynamic-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (36, 0, 0, 1, 'DragTable', NULL, 'dragTable', 'table/drag-table', 34, 'drag-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (37, 0, 0, 1, 'InlineEditTable', NULL, 'inlineEditTable', 'table/inline-edit-table', 34, 'inline-edit-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (38, 0, 0, 1, 'ComplexTable', NULL, 'complexTable', 'table/complex-table', 34, 'complex-table', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (39, 0, 0, 1, 'Example', '/example/list', 'example', 'Layout', 0, '/example', NULL, NULL, 0, NULL, 2, 1);
INSERT INTO `admin_menu_bak` VALUES (40, 0, 0, 1, 'CreateArticle', NULL, 'createArticle', 'example/create', 39, 'create', 'edit', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (41, 0, 1, 1, 'EditArticle', NULL, 'editArticle', 'example/edit', 39, 'edit/:id(\\d+)', NULL, NULL, 1, '/example/list', 0, 1);
INSERT INTO `admin_menu_bak` VALUES (42, 0, 0, 1, 'ArticleList', NULL, 'articleList', 'example/list', 39, 'list', 'list', NULL, 0, '', 0, 1);
INSERT INTO `admin_menu_bak` VALUES (43, 0, 0, 1, 'TabP', NULL, 'tab', 'Layout', 0, '/tab', NULL, NULL, 0, NULL, 14, 1);
INSERT INTO `admin_menu_bak` VALUES (44, 0, 0, 1, 'Tab', NULL, 'tab', 'tab/index', 43, 'index', 'tab', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (45, 0, 0, 1, 'ErrorPages', NULL, 'errorPages', 'Layout', 0, '/error', '404', NULL, 0, NULL, 7, 0);
INSERT INTO `admin_menu_bak` VALUES (46, 0, 1, 1, 'Page401P', NULL, 'page401', 'error-page/401', 45, '401', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (47, 0, 1, 1, 'Page404', NULL, 'page404', 'error-page/404', 45, '404', NULL, NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (48, 0, 0, 1, 'ErrorLogP', NULL, 'errorLog', 'Layout', 0, '/error-log', NULL, NULL, 0, NULL, 9, 0);
INSERT INTO `admin_menu_bak` VALUES (49, 0, 0, 1, 'ErrorLog', NULL, 'errorLog', 'error-log/index', 48, 'log', 'bug', NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (50, 0, 0, 1, 'Excel', '/excel/export-excel', 'excel', 'Layout', 0, '/excel', 'excel', NULL, 0, NULL, 20, 1);
INSERT INTO `admin_menu_bak` VALUES (51, 0, 0, 1, 'ExportExcel', NULL, 'exportExcel', 'excel/export-excel', 50, 'export-excel', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (52, 0, 0, 1, 'SelectExcel', NULL, 'selectExcel', 'excel/select-excel', 50, 'export-selected-excel', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (53, 0, 0, 1, 'MergeHeader', NULL, 'mergeHeader', 'excel/merge-header', 50, 'export-merge-header', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (54, 0, 0, 1, 'UploadExcel', NULL, 'uploadExcel', 'excel/upload-excel', 50, 'upload-excel', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (55, 1, 0, 1, 'Zip', '/zip/download', 'zip', 'Layout', 0, '/zip', 'zip', NULL, 0, NULL, 16, 1);
INSERT INTO `admin_menu_bak` VALUES (56, 0, 0, 1, 'ExportZip', NULL, 'exportZip', 'zip/index', 55, 'download', NULL, NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (57, 0, 0, 1, 'PDFP', '/pdf/index', 'pdf', 'Layout', 0, '/pdf', NULL, NULL, 0, NULL, 17, 0);
INSERT INTO `admin_menu_bak` VALUES (58, 0, 0, 1, 'PDF', NULL, 'pdf', 'pdf/index', 57, 'index', 'pdf', NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (59, 0, 0, 1, 'ThemeP', NULL, 'theme', 'Layout', 0, '/theme', NULL, NULL, 0, NULL, 22, 1);
INSERT INTO `admin_menu_bak` VALUES (60, 0, 0, 1, 'Theme', NULL, 'theme', 'theme/index', 59, 'index', 'theme', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (61, 0, 0, 1, 'ClipboardDemoP', NULL, 'clipboardDemo', 'Layout', 0, '/clipboard', NULL, NULL, 0, NULL, 64, 1);
INSERT INTO `admin_menu_bak` VALUES (62, 0, 0, 1, 'ClipboardDemo', NULL, 'clipboardDemo', 'clipboard/index', 61, 'index', 'clipboard', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (63, 0, 0, 1, 'I18nP', NULL, 'i18n', 'Layout', 0, '/i18n', NULL, NULL, 0, NULL, 33, 0);
INSERT INTO `admin_menu_bak` VALUES (64, 0, 0, 1, 'I18n', NULL, 'i18n', 'i18n-demo/index', 63, 'index', 'international', NULL, 0, NULL, 0, 0);
INSERT INTO `admin_menu_bak` VALUES (65, 0, 0, 1, NULL, NULL, 'externalLink', 'Layout', 0, 'external-link', NULL, NULL, 0, NULL, 32, 1);
INSERT INTO `admin_menu_bak` VALUES (66, 0, 0, 1, '', NULL, 'externalLink', NULL, 65, 'https://github.com/PanJiaChen/vue-element-admin', 'link', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (68, 1, 0, 1, '系统管理', '', '系统管理', 'Layout', 0, '/sys-mgt', 'sysadmin', 'admin', 0, NULL, 99, 1);
INSERT INTO `admin_menu_bak` VALUES (69, 0, 0, 1, '菜单管理', NULL, '菜单管理', 'admin-pages/menu-mgt/index', 68, 'menu', 'menu', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (70, 0, 0, 1, '角色管理', NULL, '角色管理', 'admin-pages/role-mgt/role', 68, 'roles', 'role', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (71, 0, 0, 1, '参数配置', NULL, '参数配置', 'admin-pages/param/param', 68, 'param', 'param', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (72, 0, 0, 1, '系统用户', NULL, '系统用户', 'admin-pages/sysuser/sysuser', 68, 'sysuser', 'sysuser', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (73, 1, 0, 1, '投票管理', NULL, '投票管理', 'Layout', 0, '/vote', 'chart', NULL, 0, NULL, 120, 1);
INSERT INTO `admin_menu_bak` VALUES (74, 0, 0, 1, '内容管理', NULL, '内容管理', 'admin-pages/tip/tip', 73, 'content', 'component', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (77, 1, 0, 1, 'aaa', NULL, 'aaa', 'aaa', 0, 'aaa', 'bug', NULL, 0, NULL, 0, 1);
INSERT INTO `admin_menu_bak` VALUES (78, 0, 0, 1, 'bbb', NULL, 'bbb', 'bbb', 77, 'bbb', 'drag', NULL, 0, NULL, 0, 1);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `routes` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `super_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'admin', 'admin', '2019-12-23 20:53:39', 'Super Administrator. Have access to view all pages.', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,68,69', '1');
INSERT INTO `admin_roles` VALUES (2, 'editor', 'editor', '2020-08-21 17:21:07', '嗡嗡嗡2', '77,78,81,82,83,84,87,85,86,88,79,80,89,90,91', '0');
INSERT INTO `admin_roles` VALUES (4, 'vote', 'vote', '2019-12-24 20:54:37', '投票管理', '73,74', '0');

-- ----------------------------
-- Table structure for admin_tip
-- ----------------------------
DROP TABLE IF EXISTS `admin_tip`;
CREATE TABLE `admin_tip`  (
  `id` int(11) NOT NULL,
  `left_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `right_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `left_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `right_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_tip
-- ----------------------------
INSERT INTO `admin_tip` VALUES (1, '韦小宝229', 'VS', '张无忌', '#B3B8AE', '#E84E49', 'http://pic.1oh1.cn/d0096201912262106498324.jpg', '0');

-- ----------------------------
-- Table structure for admin_tip_data
-- ----------------------------
DROP TABLE IF EXISTS `admin_tip_data`;
CREATE TABLE `admin_tip_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `background` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `voter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote_left` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote_right` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_tip_data
-- ----------------------------
INSERT INTO `admin_tip_data` VALUES (1, NULL, 'a', '1', '0', '2019-12-25 11:58:55');
INSERT INTO `admin_tip_data` VALUES (2, NULL, 'b', '1', '0', '2019-12-25 11:59:03');
INSERT INTO `admin_tip_data` VALUES (3, NULL, 'c', '0', '1', '2019-12-25 11:59:07');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `expire_time` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', 'admin1236', 'super admin', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc29jaWFsLmRvY3Rvcm1lZXRpbmcuY29tIiwiYXVkIjoiaHR0cHM6XC9cL3NvY2lhbC5kb2N0b3JtZWV0aW5nLmNvbSIsImlhdCI6MTU5ODQ5MTExMSwibmJmIjoxNTk4NDkxMTExLCJleHAiOjE1OTkyMTExMTEsImRhdGEiOnsidXNlcmlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW5kdGltZSI6MTU5OTIxMTExMX19.x-zcEszUPLy-8TkmiiFGmbIifixIHnIkj2qdBbn5eFE', NULL, NULL, 'suency', 'admin', '2019-12-06 20:17:57');
INSERT INTO `admin_users` VALUES (2, 'feifei8', 'a', 'admin22', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cuMW9oMS5jbiIsImF1ZCI6Imh0dHA6XC9cL3d3dy4xb2gxLmNuIiwiaWF0IjoxNTc3MTc2ODM5LCJuYmYiOjE1NzcxNzY4MzksImV4cCI6MTYxMzE3NjgzOSwiZGF0YSI6eyJ1c2VyaWQiOjIsInVzZXJuYW1lIjoiZmVpZmVpIn19.fzUP6BJrp-tHFYY1q9ln7N7lXlZ4RJicOtbCdZlWXnA', NULL, NULL, 'xiaofei2', 'editor', '2019-12-06 20:22:34');
INSERT INTO `admin_users` VALUES (3, 'vote', 'vote666', 'my vote', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cuMW9oMS5jbiIsImF1ZCI6Imh0dHA6XC9cL3d3dy4xb2gxLmNuIiwiaWF0IjoxNTc3MjM2ODQ4LCJuYmYiOjE1NzcyMzY4NDgsImV4cCI6MTYxMzIzNjg0OCwiZGF0YSI6eyJ1c2VyaWQiOjMsInVzZXJuYW1lIjoidm90ZSJ9fQ.F13DmPnBiFjSs8BlWYtzUacx9YRKrDaKdg9q7ZY0XoY', NULL, NULL, 'vote', 'vote', '2019-12-24 20:55:17');
INSERT INTO `admin_users` VALUES (4, 'feipig1', '1', '飞猪履行', 'http://pic.1oh1.cn/d0096201912262305065738.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cuMW9oMS5jbiIsImF1ZCI6Imh0dHA6XC9cL3d3dy4xb2gxLmNuIiwiaWF0IjoxNTc3MzcyOTc1LCJuYmYiOjE1NzczNzI5NzUsImV4cCI6MTYxMzM3Mjk3NSwiZGF0YSI6eyJ1c2VyaWQiOjQsInVzZXJuYW1lIjoiZmVpcGlnIn19.yeuNA6LRsAjABIkeIt3aSw4SyAaL6wNxQQ22t-W_RaE', NULL, NULL, '飞猪', 'editor', '2019-12-26 23:05:14');
INSERT INTO `admin_users` VALUES (5, 'hhk', 'hhk888', '会惠康后台管理', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc29jaWFsLmRvY3Rvcm1lZXRpbmcuY29tIiwiYXVkIjoiaHR0cHM6XC9cL3NvY2lhbC5kb2N0b3JtZWV0aW5nLmNvbSIsImlhdCI6MTU5ODAwMTY5NSwibmJmIjoxNTk4MDAxNjk1LCJleHAiOjE1OTg3MjE2OTUsImRhdGEiOnsidXNlcmlkIjo1LCJ1c2VybmFtZSI6ImhoayIsImVuZHRpbWUiOjE1OTg3MjE2OTV9fQ.CPi2vKiiKH1dahR9vwY063mGXbnmSFi-2df9yzUGSDI', NULL, NULL, '会惠康', 'editor', '2020-08-12 16:11:25');

-- ----------------------------
-- Table structure for doctor_user_info
-- ----------------------------
DROP TABLE IF EXISTS `doctor_user_info`;
CREATE TABLE `doctor_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业身份4种 （医生，药师，医技人员，护士）',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `certificattion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书',
  `update_date` datetime NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `state` int(2) NULL DEFAULT NULL COMMENT '验证状态 0提交未验证 1验证',
  `brief_introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor_user_info
-- ----------------------------
INSERT INTO `doctor_user_info` VALUES (1, 2, '17767183556', NULL, NULL, '孙悟空2', '妇科22', '妇科专家', 'https://picture.doctormeeting.com/mini-local/banner1.jpeg', NULL, NULL, 1, '这是我的简介！！！！');
INSERT INTO `doctor_user_info` VALUES (2, 3, '', NULL, NULL, '33333', '内科', '岛主', 'https://picture.doctormeeting.com/mini-local/banner2.jpeg', NULL, NULL, 1, NULL);
INSERT INTO `doctor_user_info` VALUES (3, 4, '', NULL, NULL, '44444', '333', '峨眉派掌门人', 'https://picture.doctormeeting.com/mini-local/banner3.jpeg', NULL, NULL, 1, NULL);
INSERT INTO `doctor_user_info` VALUES (4, 5, '19967346432', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', '医生', '韩启东', 'XXXX', '333', 'https://picture.doctormeeting.com/mini-local/banner1.jpeg', '2020-07-18 15:45:58', '2020-07-18 15:45:58', 1, '这是我的简介');
INSERT INTO `doctor_user_info` VALUES (5, 6, '18734902241', 'oZRwa42k96jhCK5IBVby3eSu1XoM', '医生', '555', '222', '333', 'https://picture.doctormeeting.com/mini-local/banner2.jpeg', '2020-07-18 16:28:57', '2020-07-18 16:28:57', 1, NULL);
INSERT INTO `doctor_user_info` VALUES (6, 11, '13575906295', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '医生', '赵无极', '妇产科', '医师', 'https://picture.doctormeeting.com/mini-local/banner3.jpeg', '2020-08-04 10:57:51', '2020-08-04 10:57:51', 1, NULL);
INSERT INTO `doctor_user_info` VALUES (8, 29, '13296739418', 'oZRwa44dDPm1xxWC4II0qZp5LuaQ', '医生', '默默', '我想问一下', '一物一图', 'wxfile://tmp_172b9a9298a420499ad80e848e13e421bb7f83847f82a23a.jpg', '2020-08-25 15:08:30', '2020-08-25 15:08:30', 0, NULL);
INSERT INTO `doctor_user_info` VALUES (10, 32, '15381197260', 'oZRwa44SnaNyKqvOYkbU7p1KHruo', '医生', '555', '222', '333', 'wxfile://tmp_9b9f5a93b9a37ba1513976813a1d3c78053323609f68be34.jpg', '2020-08-26 15:07:50', '2020-08-26 15:07:50', 0, NULL);

-- ----------------------------
-- Table structure for experience_collection
-- ----------------------------
DROP TABLE IF EXISTS `experience_collection`;
CREATE TABLE `experience_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `eid` int(11) NULL DEFAULT NULL COMMENT '记录id',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of experience_collection
-- ----------------------------
INSERT INTO `experience_collection` VALUES (5, 2, 29, NULL);
INSERT INTO `experience_collection` VALUES (6, 2, 30, NULL);
INSERT INTO `experience_collection` VALUES (8, 5, 29, NULL);
INSERT INTO `experience_collection` VALUES (9, 6, 34, NULL);
INSERT INTO `experience_collection` VALUES (10, 2, 34, NULL);
INSERT INTO `experience_collection` VALUES (11, 5, 33, NULL);
INSERT INTO `experience_collection` VALUES (12, 5, 35, NULL);
INSERT INTO `experience_collection` VALUES (13, 5, 29, NULL);
INSERT INTO `experience_collection` VALUES (14, 5, 36, NULL);
INSERT INTO `experience_collection` VALUES (15, 2, 36, NULL);
INSERT INTO `experience_collection` VALUES (18, 2, 37, NULL);
INSERT INTO `experience_collection` VALUES (19, 5, 40, NULL);
INSERT INTO `experience_collection` VALUES (21, 5, 77, NULL);
INSERT INTO `experience_collection` VALUES (22, 5, 81, NULL);
INSERT INTO `experience_collection` VALUES (23, 11, 81, NULL);

-- ----------------------------
-- Table structure for experience_comment
-- ----------------------------
DROP TABLE IF EXISTS `experience_comment`;
CREATE TABLE `experience_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '经验id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `content_type` int(2) NULL DEFAULT NULL COMMENT '评论类型 0评论经验 1经验评论回复',
  `content_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论回复内容',
  `content_info_type` int(11) NULL DEFAULT 0 COMMENT '评论回复内容的类型 0文字 1图片 2语音',
  `content_info_size` int(11) NULL DEFAULT NULL COMMENT '评论回复内容的音频的大小',
  `content_info_length` int(11) NULL DEFAULT NULL COMMENT '评论回复内容的音频的长度',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0正常 1删除',
  `notice` int(2) NULL DEFAULT 0 COMMENT '是否已读 0未读 1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经验用户评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of experience_comment
-- ----------------------------
INSERT INTO `experience_comment` VALUES (3, 18, 5, 0, '111', 0, 0, 0, NULL, '2020-07-22 16:35:49', 0, 0);
INSERT INTO `experience_comment` VALUES (4, 18, 5, 1, '555', 0, 0, 0, NULL, '2020-07-22 16:35:57', 0, 0);
INSERT INTO `experience_comment` VALUES (5, 18, 2, 0, '666666', 0, 0, 0, NULL, '2020-07-22 16:36:10', 0, 0);
INSERT INTO `experience_comment` VALUES (6, 33, 2, 0, '测试评论', 0, 0, 0, NULL, '2020-07-22 16:36:05', 0, 0);
INSERT INTO `experience_comment` VALUES (22, 33, 2, 0, '测试2评论', 0, 0, 0, NULL, '2020-07-22 16:36:14', 0, 0);
INSERT INTO `experience_comment` VALUES (23, 33, 2, 0, '评论三三三', 0, 0, 0, NULL, '2020-07-22 16:43:07', 0, 0);
INSERT INTO `experience_comment` VALUES (24, 33, 5, 0, 'Hello', 0, 0, 0, NULL, '2020-07-23 13:43:29', 0, 0);
INSERT INTO `experience_comment` VALUES (25, 33, 5, 0, '你好', 0, 0, 0, NULL, '2020-07-23 13:43:39', 0, 0);
INSERT INTO `experience_comment` VALUES (26, 33, 2, 1, '萨达所大多奥术大师多去武汉哈师大奥术大师多奥术大师多阿萨达啊大大阿萨达', 0, 0, 0, NULL, '2020-07-23 14:49:40', 0, 0);
INSERT INTO `experience_comment` VALUES (27, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595489279207.mp3', 2, 134, 3458, NULL, '2020-07-23 15:27:54', 0, 0);
INSERT INTO `experience_comment` VALUES (28, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595489938792.mp3', 2, 162, 6273, NULL, '2020-07-23 15:39:00', 0, 0);
INSERT INTO `experience_comment` VALUES (29, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595490180704.mp3', 2, 144, 4415, NULL, '2020-07-23 15:42:57', 0, 0);
INSERT INTO `experience_comment` VALUES (30, 33, 5, 0, 'https://picture.doctormeeting.com/myPicture/1595490539249.mp3', 2, 133, 3360, NULL, '2020-07-23 15:48:56', 0, 0);
INSERT INTO `experience_comment` VALUES (31, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595491701276.mp3', 2, 100, 92, NULL, '2020-07-23 16:08:18', 0, 0);
INSERT INTO `experience_comment` VALUES (32, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595491786334.mp3', 2, 100, 67, NULL, '2020-07-23 16:09:39', 0, 0);
INSERT INTO `experience_comment` VALUES (33, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595491869844.mp3', 2, 100, 84, NULL, '2020-07-23 16:11:02', 0, 0);
INSERT INTO `experience_comment` VALUES (34, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595491987723.mp3', 2, 154, 5473, NULL, '2020-07-23 16:13:06', 0, 0);
INSERT INTO `experience_comment` VALUES (35, 33, 5, 0, 'https://picture.doctormeeting.com/myPicture/1595492046673.mp3', 2, 126, 2640, NULL, '2020-07-23 16:14:03', 0, 0);
INSERT INTO `experience_comment` VALUES (36, 33, 5, 0, 'https://picture.doctormeeting.com/myPicture/1595492050415.mp3', 2, 132, 3240, NULL, '2020-07-23 16:14:08', 0, 0);
INSERT INTO `experience_comment` VALUES (37, 33, 2, 0, 'https://picture.doctormeeting.com/myPicture/1595492358027.mp3', 2, 130, 3070, NULL, '2020-07-23 16:19:17', 0, 0);
INSERT INTO `experience_comment` VALUES (38, 19, 2, 0, '呵呵你好', 0, 0, 0, NULL, '2020-07-23 16:35:21', 0, 0);
INSERT INTO `experience_comment` VALUES (39, 33, 2, 1, '测试回复1', 0, 0, 0, NULL, '2020-07-27 11:15:08', 0, 0);
INSERT INTO `experience_comment` VALUES (40, 35, 5, 0, 'hello', 0, 0, 0, NULL, '2020-07-27 14:10:19', 0, 0);
INSERT INTO `experience_comment` VALUES (41, 35, 5, 1, 'hi', 0, 0, 0, NULL, '2020-07-27 14:10:35', 0, 0);
INSERT INTO `experience_comment` VALUES (42, 35, 5, 1, 'hello ', 0, 0, 0, NULL, '2020-07-27 14:10:56', 0, 0);
INSERT INTO `experience_comment` VALUES (43, 35, 5, 0, 'heool', 0, 0, 0, NULL, '2020-07-27 14:14:47', 0, 0);
INSERT INTO `experience_comment` VALUES (44, 35, 2, 0, 'hello', 0, 0, 0, NULL, '2020-07-27 14:21:46', 0, 0);
INSERT INTO `experience_comment` VALUES (45, 35, 2, 1, '啊飒飒大大酒店好爱打架打死断丝哦哦好啊丢爱哦大家啊UI藕断好欧塞对哦啊U盾奥斯丁 ', 0, 0, 0, NULL, '2020-07-27 16:06:40', 0, 0);
INSERT INTO `experience_comment` VALUES (46, 35, 2, 1, '傻到家哦下赛季大', 0, 0, 0, NULL, '2020-07-27 16:07:03', 0, 0);
INSERT INTO `experience_comment` VALUES (47, 29, 5, 0, 'heoooo', 0, 0, 0, NULL, '2020-08-05 13:00:08', 0, 0);
INSERT INTO `experience_comment` VALUES (48, 29, 5, 1, 'heooooooooooooo', 0, 0, 0, NULL, '2020-08-05 13:00:57', 0, 0);
INSERT INTO `experience_comment` VALUES (49, 36, 2, 0, 'asdadadadada', 0, 0, 0, NULL, '2020-08-07 09:49:05', 0, 0);
INSERT INTO `experience_comment` VALUES (50, 36, 2, 0, '是你身上暖暖的', 0, 0, 0, NULL, '2020-08-07 09:50:03', 0, 0);
INSERT INTO `experience_comment` VALUES (51, 36, 5, 0, '无语咯为咯为咯在真咯为咯为咯为咯一', 0, 0, 0, NULL, '2020-08-07 09:50:44', 0, 0);
INSERT INTO `experience_comment` VALUES (52, 36, 5, 0, 'Pppppppppppppp', 0, 0, 0, NULL, '2020-08-07 09:51:23', 0, 0);
INSERT INTO `experience_comment` VALUES (53, 36, 5, 0, 'Ppppppp', 0, 0, 0, NULL, '2020-08-07 09:51:47', 0, 0);
INSERT INTO `experience_comment` VALUES (54, 77, 5, 0, '评论测试', 0, 0, 0, NULL, '2020-08-26 13:09:57', 0, 0);
INSERT INTO `experience_comment` VALUES (55, 72, 5, 0, '`1111', 0, 0, 0, NULL, '2020-08-26 13:21:02', 0, 0);
INSERT INTO `experience_comment` VALUES (56, 78, 11, 0, '11111', 0, 0, 0, NULL, '2020-08-26 13:23:28', 1, 0);
INSERT INTO `experience_comment` VALUES (57, 78, 11, 1, '999999', 0, 0, 0, NULL, '2020-08-26 13:23:46', 1, 0);
INSERT INTO `experience_comment` VALUES (58, 85, 5, 0, '啊阿斯顶级哦阿斯顶级哦啊手机的阿斯顶级哦啊手机的', 0, 0, 0, NULL, '2020-08-26 17:25:43', 1, 0);
INSERT INTO `experience_comment` VALUES (59, 85, 5, 0, '54486484', 0, 0, 0, NULL, '2020-08-26 17:26:23', 1, 0);

-- ----------------------------
-- Table structure for experience_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `experience_comment_reply`;
CREATE TABLE `experience_comment_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NULL DEFAULT NULL COMMENT '评论id',
  `first_cid` int(11) NULL DEFAULT NULL COMMENT '根节点的评论id',
  `reply_id` int(11) NULL DEFAULT NULL COMMENT '回复目标的评论id',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0正常 1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经验用户评论经验回复表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of experience_comment_reply
-- ----------------------------
INSERT INTO `experience_comment_reply` VALUES (4, 4, 3, 3, NULL, NULL, 1);
INSERT INTO `experience_comment_reply` VALUES (5, 26, 23, 23, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (6, 39, 24, 24, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (7, 41, 40, 40, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (8, 42, 40, 40, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (9, 45, 43, 43, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (10, 46, 45, 45, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (11, 48, 47, 47, NULL, NULL, 0);
INSERT INTO `experience_comment_reply` VALUES (12, 57, 56, 56, NULL, NULL, 1);

-- ----------------------------
-- Table structure for experience_invitation_users
-- ----------------------------
DROP TABLE IF EXISTS `experience_invitation_users`;
CREATE TABLE `experience_invitation_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `eid` int(11) NULL DEFAULT NULL COMMENT '经验记录id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '邀请用户id',
  `create_date` datetime NULL DEFAULT NULL,
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0邀请 1接受邀请 2邀请过时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经验用户关注列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of experience_invitation_users
-- ----------------------------
INSERT INTO `experience_invitation_users` VALUES (5, 9, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (6, 10, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (7, 11, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (8, 12, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (9, 17, 1, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (10, 18, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (11, 18, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (12, 19, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (13, 19, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (14, 20, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (15, 20, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (16, 24, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (17, 25, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (18, 26, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (19, 27, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (20, 28, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (21, 29, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (22, 30, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (23, 30, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (24, 31, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (25, 32, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (26, 32, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (27, 32, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (28, 33, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (29, 33, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (30, 33, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (31, 34, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (32, 37, 2, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (33, 37, 3, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (34, 37, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (44, 48, 2, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (45, 48, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (46, 48, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (47, 48, 6, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (48, 48, 11, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (49, 49, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (50, 49, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (69, 72, 5, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (70, 73, 5, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (71, 74, 5, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (74, 77, 2, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (75, 77, 3, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (76, 77, 6, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (77, 78, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (78, 78, 5, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (79, 78, 6, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (80, 79, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (81, 79, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (82, 79, 11, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (83, 80, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (84, 80, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (85, 80, 11, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (86, 81, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (87, 81, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (88, 81, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (89, 81, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (90, 81, 11, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (91, 82, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (92, 82, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (93, 82, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (94, 82, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (95, 82, 11, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (96, 83, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (97, 83, 5, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (98, 83, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (99, 84, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (100, 84, 5, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (101, 84, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (102, 85, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (103, 85, 3, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (104, 85, 4, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (105, 86, 2, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (106, 86, 5, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (107, 86, 6, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (108, 87, 2, NULL, 1);
INSERT INTO `experience_invitation_users` VALUES (109, 87, 5, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (110, 87, 6, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (111, 89, 2, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (112, 89, 5, NULL, 0);
INSERT INTO `experience_invitation_users` VALUES (113, 89, 6, NULL, 0);

-- ----------------------------
-- Table structure for experience_sharing
-- ----------------------------
DROP TABLE IF EXISTS `experience_sharing`;
CREATE TABLE `experience_sharing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `discussion_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论标题',
  `briefly` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简要病史',
  `briefly_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简要病史图片',
  `physique_inspect` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体格检查',
  `physique_inspect_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体格检查图片',
  `inspect_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅助检查',
  `inspect_data_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅助检查资料图片',
  `diagnostic_results` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '临床诊断结果',
  `diagnostic_results_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '临床诊断结果图片',
  `treatment_process` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊疗经过',
  `treatment_process_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊疗经过图片',
  `other` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他',
  `other_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他图片',
  `open` int(2) NULL DEFAULT NULL COMMENT '是否公开  0是，1否',
  `real_name_publishing` int(2) NULL DEFAULT NULL COMMENT '是否实名发布  0是，1否',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discussion_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论内容',
  `discussion_content_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论内容图片',
  `type` int(2) NULL DEFAULT NULL COMMENT '0经验  1复杂病历',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0正常 1删除',
  `forward` int(2) NULL DEFAULT 0 COMMENT '是否原创  0原创，1转发',
  `forward_uid` int(11) NULL DEFAULT NULL COMMENT '转发人用户id',
  `original_eid` int(11) NULL DEFAULT NULL COMMENT '原著id',
  `forward_idea` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转发心得',
  `group_tag` int(2) NULL DEFAULT 0 COMMENT '是否是分组话题 0否 1是',
  `gid` int(11) NULL DEFAULT NULL COMMENT '小组id',
  `weight` int(11) NULL DEFAULT 0 COMMENT '动态权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经验分享记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of experience_sharing
-- ----------------------------
INSERT INTO `experience_sharing` VALUES (18, 2, '测试一下数据', '从医院出来的时候，特意看了看时间，已经凌晨十二点多了。小镇渐渐陷入沉睡，路上行人稀疏，河边的灯光也已熄灭，远处的楼房明暗交错，传来点点灯火，微微照亮了河面，看得我的眼睛有些迷惘。此刻，这个世界安静得似乎只剩我一人。在椅子上连续坐了5个多小时，中途迷迷糊糊睡着了，醒来感觉腿脚发麻。现在，迫切想回去洗掉一身疲倦，睡上一觉，但心中却还想沿着河边的栈道，慢慢走一走，活动一下全身，也让自己平静下来。趁着昏暗的灯光，慢步在河边的柳树下，踏着柔和的木板，微凉的夜色浸满全身，一种莫名的情绪不觉中涌上心头。或许是经历过太多坎坷，也或许是感受过太多悲伤，总喜欢那些伤感的文字，习惯用淡淡的忧伤记录下生活的点滴，字里行间流露出丝丝不安和忧虑，仿佛身边的欢乐与我无关，从未曾想用快乐的心情去记录那些流年往事。', 'https://picture.doctormeeting.com/myPicture/1594360508478.jpg;https://picture.doctormeeting.com/myPicture/1594360507298.jpg;https://picture.doctormeeting.com/myPicture/1594360511937.jpg;https://picture.doctormeeting.com/myPicture/1594360513642.jpg;https://picture.doctormeeting.com/myPicture/1594360513407.jpg;https://picture.doctormeeting.com/myPicture/1594360510018.jpg;https://picture.doctormeeting.com/myPicture/1594360519186.jpg;https://picture.doctormeeting.com/myPicture/1594360519895.jpg;https://picture.doctormeeting.com/myPicture/1594360515935.jpg', '小时候生活在农村，那时的条件很苦，人们还经常为温饱发愁，村里的小学是几间破旧的木房，小伙伴们辍学是常有的事情。那时放学后最喜欢做的一件事情是到学校后山上摘映山红，每天生活在这方宁静的小世界，也还算无忧无虑。后来，到镇上读书，到县里读书，再到省外读书，感觉就像在山的这面架起了一架楼梯，多登上一阶，就多看到一点外面的世界，心中充满欣喜的同时，也不断面对许多现实的冲撞，内心的无奈、无助、迷茫、彷徨常常让人身心交瘁，就这样许多梦破灭了，青春的舞姿摔碎满地……有一段时间，父亲常对我说的一句话是，我的头上有“三座大山”，每一座都需要花费很大的力气去翻越。经年岁月，那“三座大山”都已不复存在。其实，人生何止“三座大山”，每一个阶段都有不同的“三座大山”横在面前，直至人生旅途的终点。现在回想起来，我不是还在不断地翻越眼前不同的“三座大山”吗？在筋疲力尽的时候，在快要放弃的时候，也许心中能想出一万个理由，却没有一个让自己理直气壮。人生就像在奔跑，总会有一些阵痛，当你触不及防之时突然袭来。工作或生活中那些误解、失望、压抑、苦恼、忧虑、无奈纠缠在一起，这般轻易地让人疯狂。心里不断抱怨命运开过的一次次玩笑和上天对自己的不公。相信命运吗？或许有那么一刻，真的相信了所谓的命运之神。当心情慢慢平静下来，重新理顺、重新开始一段新的旅程之时，指缝间时光早已经匆匆流走，突然发现剩下的不过是满头大汗之后的唏嘘叹息。', 'https://picture.doctormeeting.com/myPicture/1594359122713.jpg;https://picture.doctormeeting.com/myPicture/1594359120277.jpg', '借一缕阳光，飞回久违的故乡。院子里种下的那棵柿子树，早已长到让我仰望的高度。在树下做了一个很长的梦，千世轮回，万般辗转。这一世，我睁开眼睛，第一眼就看到了你的身影，在潮水般的人流中浮现。我们是否在哪见过？你说，那是一万年前的一次相遇。时光飞转，沧海桑田，终于在这最美好的年华，遇见了最美的你。不管相距远近，不管心情或喜或悲，为你写下的一段段文字，连同变化的心绪，都已经变成了刻在岁月里的诗。我愿守候在你的身边，一梦万年，不愿醒来。', 'https://picture.doctormeeting.com/myPicture/1594359189296.jpg;https://picture.doctormeeting.com/myPicture/1594359183705.jpg;https://picture.doctormeeting.com/myPicture/1594359190361.jpg', '掌中的蝴蝶已经飞走，脚下的路途还在延伸。继续向前奔跑，也许在你感到痛苦、无望的时候，生命的缝隙中会传出一束光，带给你一丝意外的欣喜，伴你到达彼岸。', 'https://picture.doctormeeting.com/myPicture/1594359312154.jpg;https://picture.doctormeeting.com/myPicture/1594359314345.jpg;https://picture.doctormeeting.com/myPicture/1594359319878.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体在缓缓的左右移动，似乎在寻觅什么。刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向。', 'https://picture.doctormeeting.com/myPicture/1594359291953.jpg;https://picture.doctormeeting.com/myPicture/1594359295636.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体', 'https://picture.doctormeeting.com/myPicture/1594359324691.jpg', 1, 0, '2020-07-14 08:26:41', '刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向', 'https://picture.doctormeeting.com/myPicture/1594358872602.jpg;https://picture.doctormeeting.com/myPicture/1594358875125.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (19, 2, '测试一下数据', '从医院出来的时候，特意看了看时间，已经凌晨十二点多了。小镇渐渐陷入沉睡，路上行人稀疏，河边的灯光也已熄灭，远处的楼房明暗交错，传来点点灯火，微微照亮了河面，看得我的眼睛有些迷惘。此刻，这个世界安静得似乎只剩我一人。在椅子上连续坐了5个多小时，中途迷迷糊糊睡着了，醒来感觉腿脚发麻。现在，迫切想回去洗掉一身疲倦，睡上一觉，但心中却还想沿着河边的栈道，慢慢走一走，活动一下全身，也让自己平静下来。趁着昏暗的灯光，慢步在河边的柳树下，踏着柔和的木板，微凉的夜色浸满全身，一种莫名的情绪不觉中涌上心头。或许是经历过太多坎坷，也或许是感受过太多悲伤，总喜欢那些伤感的文字，习惯用淡淡的忧伤记录下生活的点滴，字里行间流露出丝丝不安和忧虑，仿佛身边的欢乐与我无关，从未曾想用快乐的心情去记录那些流年往事。', 'https://picture.doctormeeting.com/myPicture/1594364324362.jpg;https://picture.doctormeeting.com/myPicture/1594364320717.jpg;https://picture.doctormeeting.com/myPicture/1594364324752.jpg;https://picture.doctormeeting.com/myPicture/1594364325497.jpg;https://picture.doctormeeting.com/myPicture/1594365077417.jpg;https://picture.doctormeeting.com/myPicture/1594365084318.jpg;https://picture.doctormeeting.com/myPicture/1594365081467.jpg;https://picture.doctormeeting.com/myPicture/1594365084154.jpg;https://picture.doctormeeting.com/myPicture/1594365101643.jpg', '小时候生活在农村，那时的条件很苦，人们还经常为温饱发愁，村里的小学是几间破旧的木房，小伙伴们辍学是常有的事情。那时放学后最喜欢做的一件事情是到学校后山上摘映山红，每天生活在这方宁静的小世界，也还算无忧无虑。后来，到镇上读书，到县里读书，再到省外读书，感觉就像在山的这面架起了一架楼梯，多登上一阶，就多看到一点外面的世界，心中充满欣喜的同时，也不断面对许多现实的冲撞，内心的无奈、无助、迷茫、彷徨常常让人身心交瘁，就这样许多梦破灭了，青春的舞姿摔碎满地……有一段时间，父亲常对我说的一句话是，我的头上有“三座大山”，每一座都需要花费很大的力气去翻越。经年岁月，那“三座大山”都已不复存在。其实，人生何止“三座大山”，每一个阶段都有不同的“三座大山”横在面前，直至人生旅途的终点。现在回想起来，我不是还在不断地翻越眼前不同的“三座大山”吗？在筋疲力尽的时候，在快要放弃的时候，也许心中能想出一万个理由，却没有一个让自己理直气壮。人生就像在奔跑，总会有一些阵痛，当你触不及防之时突然袭来。工作或生活中那些误解、失望、压抑、苦恼、忧虑、无奈纠缠在一起，这般轻易地让人疯狂。心里不断抱怨命运开过的一次次玩笑和上天对自己的不公。相信命运吗？或许有那么一刻，真的相信了所谓的命运之神。当心情慢慢平静下来，重新理顺、重新开始一段新的旅程之时，指缝间时光早已经匆匆流走，突然发现剩下的不过是满头大汗之后的唏嘘叹息。', 'https://picture.doctormeeting.com/myPicture/1594359120277.jpg;https://picture.doctormeeting.com/myPicture/1594365291920.jpg;https://picture.doctormeeting.com/myPicture/1594365297195.jpg;https://picture.doctormeeting.com/myPicture/1594365292577.jpg', '借一缕阳光，飞回久违的故乡。院子里种下的那棵柿子树，早已长到让我仰望的高度。在树下做了一个很长的梦，千世轮回，万般辗转。这一世，我睁开眼睛，第一眼就看到了你的身影，在潮水般的人流中浮现。我们是否在哪见过？你说，那是一万年前的一次相遇。时光飞转，沧海桑田，终于在这最美好的年华，遇见了最美的你。不管相距远近，不管心情或喜或悲，为你写下的一段段文字，连同变化的心绪，都已经变成了刻在岁月里的诗。我愿守候在你的身边，一梦万年，不愿醒来。', 'https://picture.doctormeeting.com/myPicture/1594359189296.jpg;https://picture.doctormeeting.com/myPicture/1594359183705.jpg;https://picture.doctormeeting.com/myPicture/1594359190361.jpg', '掌中的蝴蝶已经飞走，脚下的路途还在延伸。继续向前奔跑，也许在你感到痛苦、无望的时候，生命的缝隙中会传出一束光，带给你一丝意外的欣喜，伴你到达彼岸。', 'https://picture.doctormeeting.com/myPicture/1594359312154.jpg;https://picture.doctormeeting.com/myPicture/1594359314345.jpg;https://picture.doctormeeting.com/myPicture/1594359319878.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体在缓缓的左右移动，似乎在寻觅什么。刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向。', 'https://picture.doctormeeting.com/myPicture/1594359291953.jpg;https://picture.doctormeeting.com/myPicture/1594359295636.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体', 'https://picture.doctormeeting.com/myPicture/1594359324691.jpg', 1, 0, '2020-07-15 09:26:41', '刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向', 'https://picture.doctormeeting.com/myPicture/1594358872602.jpg;https://picture.doctormeeting.com/myPicture/1594358875125.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (20, 2, '测试一下数据2', '从医院出来的时候，特意看了看时间，已经凌晨十二点多了。小镇渐渐陷入沉睡，路上行人稀疏，河边的灯光也已熄灭，远处的楼房明暗交错，传来点点灯火，微微照亮了河面，看得我的眼睛有些迷惘。此刻，这个世界安静得似乎只剩我一人。在椅子上连续坐了5个多小时，中途迷迷糊糊睡着了，醒来感觉腿脚发麻。现在，迫切想回去洗掉一身疲倦，睡上一觉，但心中却还想沿着河边的栈道，慢慢走一走，活动一下全身，也让自己平静下来。趁着昏暗的灯光，慢步在河边的柳树下，踏着柔和的木板，微凉的夜色浸满全身，一种莫名的情绪不觉中涌上心头。或许是经历过太多坎坷，也或许是感受过太多悲伤，总喜欢那些伤感的文字，习惯用淡淡的忧伤记录下生活的点滴，字里行间流露出丝丝不安和忧虑，仿佛身边的欢乐与我无关，从未曾想用快乐的心情去记录那些流年往事。', 'https://picture.doctormeeting.com/myPicture/1594364324362.jpg;https://picture.doctormeeting.com/myPicture/1594364320717.jpg;https://picture.doctormeeting.com/myPicture/1594364324752.jpg;https://picture.doctormeeting.com/myPicture/1594364325497.jpg;https://picture.doctormeeting.com/myPicture/1594365077417.jpg;https://picture.doctormeeting.com/myPicture/1594365084318.jpg;https://picture.doctormeeting.com/myPicture/1594365081467.jpg;https://picture.doctormeeting.com/myPicture/1594365084154.jpg;https://picture.doctormeeting.com/myPicture/1594365101643.jpg', '小时候生活在农村，那时的条件很苦，人们还经常为温饱发愁，村里的小学是几间破旧的木房，小伙伴们辍学是常有的事情。那时放学后最喜欢做的一件事情是到学校后山上摘映山红，每天生活在这方宁静的小世界，也还算无忧无虑。后来，到镇上读书，到县里读书，再到省外读书，感觉就像在山的这面架起了一架楼梯，多登上一阶，就多看到一点外面的世界，心中充满欣喜的同时，也不断面对许多现实的冲撞，内心的无奈、无助、迷茫、彷徨常常让人身心交瘁，就这样许多梦破灭了，青春的舞姿摔碎满地……有一段时间，父亲常对我说的一句话是，我的头上有“三座大山”，每一座都需要花费很大的力气去翻越。经年岁月，那“三座大山”都已不复存在。其实，人生何止“三座大山”，每一个阶段都有不同的“三座大山”横在面前，直至人生旅途的终点。现在回想起来，我不是还在不断地翻越眼前不同的“三座大山”吗？在筋疲力尽的时候，在快要放弃的时候，也许心中能想出一万个理由，却没有一个让自己理直气壮。人生就像在奔跑，总会有一些阵痛，当你触不及防之时突然袭来。工作或生活中那些误解、失望、压抑、苦恼、忧虑、无奈纠缠在一起，这般轻易地让人疯狂。心里不断抱怨命运开过的一次次玩笑和上天对自己的不公。相信命运吗？或许有那么一刻，真的相信了所谓的命运之神。当心情慢慢平静下来，重新理顺、重新开始一段新的旅程之时，指缝间时光早已经匆匆流走，突然发现剩下的不过是满头大汗之后的唏嘘叹息。', 'https://picture.doctormeeting.com/myPicture/1594359120277.jpg;https://picture.doctormeeting.com/myPicture/1594365291920.jpg;https://picture.doctormeeting.com/myPicture/1594365297195.jpg;https://picture.doctormeeting.com/myPicture/1594365292577.jpg', '借一缕阳光，飞回久违的故乡。院子里种下的那棵柿子树，早已长到让我仰望的高度。在树下做了一个很长的梦，千世轮回，万般辗转。这一世，我睁开眼睛，第一眼就看到了你的身影，在潮水般的人流中浮现。我们是否在哪见过？你说，那是一万年前的一次相遇。时光飞转，沧海桑田，终于在这最美好的年华，遇见了最美的你。不管相距远近，不管心情或喜或悲，为你写下的一段段文字，连同变化的心绪，都已经变成了刻在岁月里的诗。我愿守候在你的身边，一梦万年，不愿醒来。', 'https://picture.doctormeeting.com/myPicture/1594359189296.jpg;https://picture.doctormeeting.com/myPicture/1594359183705.jpg;https://picture.doctormeeting.com/myPicture/1594359190361.jpg', '掌中的蝴蝶已经飞走，脚下的路途还在延伸。继续向前奔跑，也许在你感到痛苦、无望的时候，生命的缝隙中会传出一束光，带给你一丝意外的欣喜，伴你到达彼岸。', 'https://picture.doctormeeting.com/myPicture/1594359312154.jpg;https://picture.doctormeeting.com/myPicture/1594359314345.jpg;https://picture.doctormeeting.com/myPicture/1594359319878.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体在缓缓的左右移动，似乎在寻觅什么。刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向。', 'https://picture.doctormeeting.com/myPicture/1594359291953.jpg;https://picture.doctormeeting.com/myPicture/1594359295636.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体', 'https://picture.doctormeeting.com/myPicture/1594359324691.jpg', 1, 0, '2020-07-15 08:26:41', '刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向', 'https://picture.doctormeeting.com/myPicture/1594358872602.jpg;https://picture.doctormeeting.com/myPicture/1594358875125.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (21, 2, '2221', '2221', '2221', '2221', '2221', '2221', '2223', '222', '222', '222', '222', '222', '222', 0, 0, '2020-07-22 14:19:04', '222', '222', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (22, 2, '2224', '442', '442', '2224', '2223', '3', '2223', '222', '222', '222', '222', '222', '222', 0, 0, '2020-07-22 14:19:18', '222', '222', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (24, 2, '视频测试', '简要病史内容', 'https://picture.doctormeeting.com/myPicture/1594791607842.mp4', 'adada', 'https://picture.doctormeeting.com/myPicture/1594790495206.mp4', 'qqweqweqweqwe', 'https://picture.doctormeeting.com/myPicture/1594790510109.jpg;https://picture.doctormeeting.com/myPicture/1594790507511.jpg;https://picture.doctormeeting.com/myPicture/1594790505176.jpg', 'qw', '', 'w', '', '', '', 1, 0, '2020-07-17 08:26:41', '这是讨论的内容', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (25, 2, '视频测试2', '简要病史内容2', 'https://picture.doctormeeting.com/myPicture/1594791607842.mp4', 'adada2', 'https://picture.doctormeeting.com/myPicture/1594804405600.mp4', 'qqweqweqweqwe', 'https://picture.doctormeeting.com/myPicture/1594790507511.jpg;https://picture.doctormeeting.com/myPicture/1594790505176.jpg;https://picture.doctormeeting.com/myPicture/1594804423619.jpg', 'qw', '', 'w', '', '', '', 1, 0, '2020-07-18 09:26:41', '这是讨论的内容', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (26, 2, '视频测试3', '简要病史内容3', 'https://picture.doctormeeting.com/myPicture/1594867387033.jpg;https://picture.doctormeeting.com/myPicture/1594867391908.jpg', 'adada2', 'https://picture.doctormeeting.com/myPicture/1594804405600.mp4', 'qqweqweqweqwe', 'https://picture.doctormeeting.com/myPicture/1594790507511.jpg;https://picture.doctormeeting.com/myPicture/1594804423619.jpg', 'qw', 'https://picture.doctormeeting.com/myPicture/1594867438109.jpg;https://picture.doctormeeting.com/myPicture/1594867429203.jpg', 'w33333', 'https://picture.doctormeeting.com/myPicture/1594867426966.mp4', '', '', 1, 0, '2020-07-18 09:45:41', '这是讨论的内容', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (27, 2, '视频测试4', '简要病史内容3', 'https://picture.doctormeeting.com/myPicture/1594867387033.jpg', 'adada2', 'https://picture.doctormeeting.com/myPicture/1594804405600.mp4', 'qqweqweqweqwe', '', 'qw', '', 'w33333', 'https://picture.doctormeeting.com/myPicture/1594867426966.mp4', '', '', 1, 0, '2020-07-18 09:33:41', '这是讨论的内容1', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (28, 2, '视频测试5', '简要病史内容3', '', 'adada2', 'https://picture.doctormeeting.com/myPicture/1594804405600.mp4', 'qqweqweqweqwe', '', 'qw', '', 'w33333', '', '', '', 1, 0, '2020-07-18 09:26:41', '这是讨论的内容1', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (29, 2, '视频测试6', '简要病史内容3', '', 'adada2', 'https://picture.doctormeeting.com/myPicture/1594868319754.jpg', 'qqweqweqweqwe', '', 'qw', '', 'w33333', '', '', '', 1, 0, '2020-07-18 09:26:41', '这是讨论的内容1', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (30, 2, '测试一下数据', '从医院出来的时候，特意看了看时间，已经凌晨十二点多了。小镇渐渐陷入沉睡，路上行人稀疏，河边的灯光也已熄灭，远处的楼房明暗交错，传来点点灯火，微微照亮了河面，看得我的眼睛有些迷惘。此刻，这个世界安静得似乎只剩我一人。在椅子上连续坐了5个多小时，中途迷迷糊糊睡着了，醒来感觉腿脚发麻。现在，迫切想回去洗掉一身疲倦，睡上一觉，但心中却还想沿着河边的栈道，慢慢走一走，活动一下全身，也让自己平静下来。趁着昏暗的灯光，慢步在河边的柳树下，踏着柔和的木板，微凉的夜色浸满全身，一种莫名的情绪不觉中涌上心头。或许是经历过太多坎坷，也或许是感受过太多悲伤，总喜欢那些伤感的文字，习惯用淡淡的忧伤记录下生活的点滴，字里行间流露出丝丝不安和忧虑，仿佛身边的欢乐与我无关，从未曾想用快乐的心情去记录那些流年往事。', 'https://picture.doctormeeting.com/myPicture/1594360508478.jpg;https://picture.doctormeeting.com/myPicture/1594360507298.jpg;https://picture.doctormeeting.com/myPicture/1594360511937.jpg;https://picture.doctormeeting.com/myPicture/1594360513642.jpg;https://picture.doctormeeting.com/myPicture/1594360513407.jpg;https://picture.doctormeeting.com/myPicture/1594360510018.jpg;https://picture.doctormeeting.com/myPicture/1594360519186.jpg;https://picture.doctormeeting.com/myPicture/1594360519895.jpg;https://picture.doctormeeting.com/myPicture/1594360515935.jpg', '小时候生活在农村，那时的条件很苦，人们还经常为温饱发愁，村里的小学是几间破旧的木房，小伙伴们辍学是常有的事情。那时放学后最喜欢做的一件事情是到学校后山上摘映山红，每天生活在这方宁静的小世界，也还算无忧无虑。后来，到镇上读书，到县里读书，再到省外读书，感觉就像在山的这面架起了一架楼梯，多登上一阶，就多看到一点外面的世界，心中充满欣喜的同时，也不断面对许多现实的冲撞，内心的无奈、无助、迷茫、彷徨常常让人身心交瘁，就这样许多梦破灭了，青春的舞姿摔碎满地……有一段时间，父亲常对我说的一句话是，我的头上有“三座大山”，每一座都需要花费很大的力气去翻越。经年岁月，那“三座大山”都已不复存在。其实，人生何止“三座大山”，每一个阶段都有不同的“三座大山”横在面前，直至人生旅途的终点。现在回想起来，我不是还在不断地翻越眼前不同的“三座大山”吗？在筋疲力尽的时候，在快要放弃的时候，也许心中能想出一万个理由，却没有一个让自己理直气壮。人生就像在奔跑，总会有一些阵痛，当你触不及防之时突然袭来。工作或生活中那些误解、失望、压抑、苦恼、忧虑、无奈纠缠在一起，这般轻易地让人疯狂。心里不断抱怨命运开过的一次次玩笑和上天对自己的不公。相信命运吗？或许有那么一刻，真的相信了所谓的命运之神。当心情慢慢平静下来，重新理顺、重新开始一段新的旅程之时，指缝间时光早已经匆匆流走，突然发现剩下的不过是满头大汗之后的唏嘘叹息。', 'https://picture.doctormeeting.com/myPicture/1594359122713.jpg;https://picture.doctormeeting.com/myPicture/1594359120277.jpg', '借一缕阳光，飞回久违的故乡。院子里种下的那棵柿子树，早已长到让我仰望的高度。在树下做了一个很长的梦，千世轮回，万般辗转。这一世，我睁开眼睛，第一眼就看到了你的身影，在潮水般的人流中浮现。我们是否在哪见过？你说，那是一万年前的一次相遇。时光飞转，沧海桑田，终于在这最美好的年华，遇见了最美的你。不管相距远近，不管心情或喜或悲，为你写下的一段段文字，连同变化的心绪，都已经变成了刻在岁月里的诗。我愿守候在你的身边，一梦万年，不愿醒来。', 'https://picture.doctormeeting.com/myPicture/1594359189296.jpg;https://picture.doctormeeting.com/myPicture/1594359183705.jpg;https://picture.doctormeeting.com/myPicture/1594359190361.jpg', '掌中的蝴蝶已经飞走，脚下的路途还在延伸。继续向前奔跑，也许在你感到痛苦、无望的时候，生命的缝隙中会传出一束光，带给你一丝意外的欣喜，伴你到达彼岸。', 'https://picture.doctormeeting.com/myPicture/1594359312154.jpg;https://picture.doctormeeting.com/myPicture/1594359314345.jpg;https://picture.doctormeeting.com/myPicture/1594359319878.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体在缓缓的左右移动，似乎在寻觅什么。刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向。', 'https://picture.doctormeeting.com/myPicture/1594359291953.jpg;https://picture.doctormeeting.com/myPicture/1594359295636.jpg', '清晨起来，看到窗户外面爬着一只蝴蝶，在晨风中轻轻拍动着翅膀，惊奇之下走过去拉开纱窗，它竟然没有被吓走。伸手轻轻撵它，它却移动到食指上，于是干脆伸开手掌，让它到掌中间来。张开的双翅偶尔扇动，身体', 'https://picture.doctormeeting.com/myPicture/1594359324691.jpg', 1, 0, '2020-07-18 09:26:41', '刚洗过脸，手还是湿的，也许它喜欢这股潮湿的气味吧，所以才不肯离去。从未遇到过这样的情形，仿佛只有电影里才有的情节。轻轻地拿出手机，拍下这美好的一刻，然后把手伸出窗外，翻转手掌，又把它放回空中，只见它扇动几下翅膀就飞出了很远，越过树梢，消失在了朝阳升起的方向', 'https://picture.doctormeeting.com/myPicture/1594358872602.jpg;https://picture.doctormeeting.com/myPicture/1594358875125.jpg', 0, 1, 1, 2, 18, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (31, 2, '视频测试7', '简要病史内容3', 'https://picture.doctormeeting.com/myPicture/1594971908015.jpg;https://picture.doctormeeting.com/myPicture/1594971942686.jpg', '检查222222222', 'https://picture.doctormeeting.com/myPicture/1594971926853.mp4', 'qqweqweqweqwe', '', 'qw', '', 'w33333', '', '', '', 1, 0, '2020-07-18 09:26:41', '这是讨论的内容1', '', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (32, 5, '测试测试测试', '您追图谱上YY', 'https://picture.doctormeeting.com/myPicture/1595057874425.jpg;https://picture.doctormeeting.com/myPicture/1595057884557.jpg;https://picture.doctormeeting.com/myPicture/1595057897753.jpg;https://picture.doctormeeting.com/myPicture/1595057899242.jpg', '集体退嘻嘻嘻', 'https://picture.doctormeeting.com/myPicture/1595057916864.jpg', '', 'https://picture.doctormeeting.com/myPicture/1595057932710.mp4', '呃呃呃得得得得得得得得得得得得', '', '哦以为在真学在真学在真学网', '', '', 'https://picture.doctormeeting.com/myPicture/1595057967915.mp4', 0, 0, '2020-07-18 09:26:41', 'H游戏嘻嘻也行哦', 'https://picture.doctormeeting.com/myPicture/1595057978508.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (33, 5, '测试测试测试', '您追图谱上YY', 'https://picture.doctormeeting.com/myPicture/1595058097135.jpg', '集体退嘻嘻嘻', 'https://picture.doctormeeting.com/myPicture/1595057916864.jpg', '', 'https://picture.doctormeeting.com/myPicture/1595057932710.mp4', '呃呃呃得得得得得得得得得得得得', '', '哦以为在真学在真学在真学网', '', '', 'https://picture.doctormeeting.com/myPicture/1595057967915.mp4', 1, 0, '2020-07-20 09:26:41', 'H游戏嘻嘻也行哦', 'https://picture.doctormeeting.com/myPicture/1595057978508.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (34, 6, '病理', '可口可乐了了', '', '啊啊啊啊啊啊啊啊', '', '', '', '', '', '', '', '', '', 1, 0, '2020-07-20 09:26:41', '可口可乐了', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (35, 5, '动态测试', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-07-27 14:10:01', '这是讨论内容，测试', 'https://picture.doctormeeting.com/myPicture/1595830206947.png', 1, 1, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (36, 5, 'Hello', '2020 LPL 夏季赛为什么 Jackeylove 突然表现断崖式下滑？\n知乎 · 354 个回答\n哪有什么断崖下滑，只不过是原型毕露罢了。杰克辣舞的优点：敢打输出，胆子大，心态稳，没了。\n\n缺点：明明是年轻AD，反应和乌兹，飞行员，bang这种顶级老AD比却是云泥之别，和欧成有的一拼，经常有闪交不出来暴毙。走位差，一样的结果，暴毙，走位差加上反应慢等于死上加死。jkl s8最后拿了冠军，很多鸡杂就默认了他一直很厉害，但是我s8，s9可是没错过啥重要比赛，jkl暴毙的次数是远远多于别的顶级AD的，甚至于大赛也没少暴毙过，下路被线杀次数名列前茅，s9我一度认为他和蓝公主是一个水平线的，当然现在一看，恩，确实还是一个水平线的。只不过人长的帅粉丝多，加上宁王和蓝公主确实拉跨的太离谱，所以锅全甩出去了。要我说下路是双人路，ig下路被干爆，全甩锅给蓝公主靠谱吗？\n\n之前还看到惊人论调，乌兹的AD打法，不对，杰克辣舞的AD打法，对。这才是AD！我当时就笑了。英雄联盟历史上三大排的上号的AD，bang毫无疑问的历史第一人，成绩和个人能力完全能撑住，顶配加强版jkl，很多云玩家和科杂因为一个s7抹杀bang所有功绩，结果他们的faker在bang走以后再也没拿过世界冠军，一出赛区就原型毕露，至于喷bang离了skt拉胯的，bang什么队友，faker什么队友？找齐了非lpl赛区韩援以外最强的几个南朝鲜人报团，最后还是被g2干的稀碎。飞行员，乌兹第二档，荣誉大体上来讲比较接近，飞行员联赛厉害，世界赛拉胯严重（老edg了，飞行员才是真edg人），乌兹世界赛厉害，联赛拉胯（其实还好，就是冠军数量少了点）这两人操作实力来讲是不输bang了，因为英雄联盟是五个人的游戏，所以都没有s赛冠军。此外，这两人职业生涯都打过时间不短的四保一，并且取得了一定的成绩。这两共同特点，心态不行，飞行员心态其实比乌兹还差的离谱，乌兹这个人熟悉的都知道他s赛其实大多数情况下是比联赛打的好的，但是队伍只有他能c的时候，他就急，一急就没了，但是他不急不行呀，毕竟小虎真是从来不急，上路想急也急不起来，每次就看到乌兹和打野急得像热锅上的蚂蚁，为了赢绞尽脑汁，然后上中喝喝茶送送头慢性死亡，最后想做事的adc和打野背锅。飞行员就更搞笑了，队友其实还挺稳的时候，他就先变形了，如果说乌兹是带不动销户和上单才急，飞行员其实世界赛', '', '2020 LPL 夏季赛为什么 Jackeylove 突然表现断崖式下滑？\n知乎 · 354 个回答\n哪有什么断崖下滑，只不过是原型毕露罢了。杰克辣舞的优点：敢打输出，胆子大，心态稳，没了。\n\n缺点：明明是年轻AD，反应和乌兹，飞行员，bang这种顶级老AD比却是云泥之别，和欧成有的一拼，经常有闪交不出来暴毙。走位差，一样的结果，暴毙，走位差加上反应慢等于死上加死。jkl s8最后拿了冠军，很多鸡杂就默认了他一直很厉害，但是我s8，s9可是没错过啥重要比赛，jkl暴毙的次数是远远多于别的顶级AD的，甚至于大赛也没少暴毙过，下路被线杀次数名列前茅，s9我一度认为他和蓝公主是一个水平线的，当然现在一看，恩，确实还是一个水平线的。只不过人长的帅粉丝多，加上宁王和蓝公主确实拉跨的太离谱，所以锅全甩出去了。要我说下路是双人路，ig下路被干爆，全甩锅给蓝公主靠谱吗？\n\n之前还看到惊人论调，乌兹的AD打法，不对，杰克辣舞的AD打法，对。这才是AD！我当时就笑了。英雄联盟历史上三大排的上号的AD，bang毫无疑问的历史第一人，成绩和个人能力完全能撑住，顶配加强版jkl，很多云玩家和科杂因为一个s7抹杀bang所有功绩，结果他们的faker在bang走以后再也没拿过世界冠军，一出赛区就原型毕露，至于喷bang离了skt拉胯的，bang什么队友，faker什么队友？找齐了非lpl赛区韩援以外最强的几个南朝鲜人报团，最后还是被g2干的稀碎。飞行员，乌兹第二档，荣誉大体上来讲比较接近，飞行员联赛厉害，世界赛拉胯严重（老edg了，飞行员才是真edg人），乌兹世界赛厉害，联赛拉胯（其实还好，就是冠军数量少了点）这两人操作实力来讲是不输bang了，因为英雄联盟是五个人的游戏，所以都没有s赛冠军。此外，这两人职业生涯都打过时间不短的四保一，并且取得了一定的成绩。这两共同特点，心态不行，飞行员心态其实比乌兹还差的离谱，乌兹这个人熟悉的都知道他s赛其实大多数情况下是比联赛打的好的，但是队伍只有他能c的时候，他就急，一急就没了，但是他不急不行呀，毕竟小虎真是从来不急，上路想急也急不起来，每次就看到乌兹和打野急得像热锅上的蚂蚁，为了赢绞尽脑汁，然后上中喝喝茶送送头慢性死亡，最后想做事的adc和打野背锅。飞行员就更搞笑了，队友其实还挺稳的时候，他就先变形了，如果说乌兹是带不动销户和上单才急，飞行员其实世界赛', '', '2020 LPL 夏季赛为什么 Jackeylove 突然表现断崖式下滑？\n知乎 · 354 个回答\n哪有什么断崖下滑，只不过是原型毕露罢了。杰克辣舞的优点：敢打输出，胆子大，心态稳，没了。\n\n缺点：明明是年轻AD，反应和乌兹，飞行员，bang这种顶级老AD比却是云泥之别，和欧成有的一拼，经常有闪交不出来暴毙。走位差，一样的结果，暴毙，走位差加上反应慢等于死上加死。jkl s8最后拿了冠军，很多鸡杂就默认了他一直很厉害，但是我s8，s9可是没错过啥重要比赛，jkl暴毙的次数是远远多于别的顶级AD的，甚至于大赛也没少暴毙过，下路被线杀次数名列前茅，s9我一度认为他和蓝公主是一个水平线的，当然现在一看，恩，确实还是一个水平线的。只不过人长的帅粉丝多，加上宁王和蓝公主确实拉跨的太离谱，所以锅全甩出去了。要我说下路是双人路，ig下路被干爆，全甩锅给蓝公主靠谱吗？\n\n之前还看到惊人论调，乌兹的AD打法，不对，杰克辣舞的AD打法，对。这才是AD！我当时就笑了。英雄联盟历史上三大排的上号的AD，bang毫无疑问的历史第一人，成绩和个人能力完全能撑住，顶配加强版jkl，很多云玩家和科杂因为一个s7抹杀bang所有功绩，结果他们的faker在bang走以后再也没拿过世界冠军，一出赛区就原型毕露，至于喷bang离了skt拉胯的，bang什么队友，faker什么队友？找齐了非lpl赛区韩援以外最强的几个南朝鲜人报团，最后还是被g2干的稀碎。飞行员，乌兹第二档，荣誉大体上来讲比较接近，飞行员联赛厉害，世界赛拉胯严重（老edg了，飞行员才是真edg人），乌兹世界赛厉害，联赛拉胯（其实还好，就是冠军数量少了点）这两人操作实力来讲是不输bang了，因为英雄联盟是五个人的游戏，所以都没有s赛冠军。此外，这两人职业生涯都打过时间不短的四保一，并且取得了一定的成绩。这两共同特点，心态不行，飞行员心态其实比乌兹还差的离谱，乌兹这个人熟悉的都知道他s赛其实大多数情况下是比联赛打的好的，但是队伍只有他能c的时候，他就急，一急就没了，但是他不急不行呀，毕竟小虎真是从来不急，上路想急也急不起来，每次就看到乌兹和打野急得像热锅上的蚂蚁，为了赢绞尽脑汁，然后上中喝喝茶送送头慢性死亡，最后想做事的adc和打野背锅。飞行员就更搞笑了，队友其实还挺稳的时候，他就先变形了，如果说乌兹是带不动销户和上单才急，飞行员其实世界赛', '', '', '', '', '', '', '', 1, 0, '2020-08-06 14:02:27', '2020 LPL 夏季赛为什么 Jackeylove 突然表现断崖式下滑？\n知乎 · 354 个回答\n哪有什么断崖下滑，只不过是原型毕露罢了。杰克辣舞的优点：敢打输出，胆子大，心态稳，没了。\n\n缺点：明明是年轻AD，反应和乌兹，飞行员，bang这种顶级老AD比却是云泥之别，和欧成有的一拼，经常有闪交不出来暴毙。走位差，一样的结果，暴毙，走位差加上反应慢等于死上加死。jkl s8最后拿了冠军，很多鸡杂就默认了他一直很厉害，但是我s8，s9可是没错过啥重要比赛，jkl暴毙的次数是远远多于别的顶级AD的，甚至于大赛也没少暴毙过，下路被线杀次数名列前茅，s9我一度认为他和蓝公主是一个水平线的，当然现在一看，恩，确实还是一个水平线的。只不过人长的帅粉丝多，加上宁王和蓝公主确实拉跨的太离谱，所以锅全甩出去了。要我说下路是双人路，ig下路被干爆，全甩锅给蓝公主靠谱吗？\n\n之前还看到惊人论调，乌兹的AD打法，不对，杰克辣舞的AD打法，对。这才是AD！我当时就笑了。英雄联盟历史上三大排的上号的AD，bang毫无疑问的历史第一人，成绩和个人能力完全能撑住，顶配加强版jkl，很多云玩家和科杂因为一个s7抹杀bang所有功绩，结果他们的faker在bang走以后再也没拿过世界冠军，一出赛区就原型毕露，至于喷bang离了skt拉胯的，bang什么队友，faker什么队友？找齐了非lpl赛区韩援以外最强的几个南朝鲜人报团，最后还是被g2干的稀碎。飞行员，乌兹第二档，荣誉大体上来讲比较接近，飞行员联赛厉害，世界赛拉胯严重（老edg了，飞行员才是真edg人），乌兹世界赛厉害，联赛拉胯（其实还好，就是冠军数量少了点）这两人操作实力来讲是不输bang了，因为英雄联盟是五个人的游戏，所以都没有s赛冠军。此外，这两人职业生涯都打过时间不短的四保一，并且取得了一定的成绩。这两共同特点，心态不行，飞行员心态其实比乌兹还差的离谱，乌兹这个人熟悉的都知道他s赛其实大多数情况下是比联赛打的好的，但是队伍只有他能c的时候，他就急，一急就没了，但是他不急不行呀，毕竟小虎真是从来不急，上路想急也急不起来，每次就看到乌兹和打野急得像热锅上的蚂蚁，为了赢绞尽脑汁，然后上中喝喝茶送送头慢性死亡，最后想做事的adc和打野背锅。飞行员就更搞笑了，队友其实还挺稳的时候，他就先变形了，如果说乌兹是带不动销户和上单才急，飞行员其实世界赛', 'https://picture.doctormeeting.com/myPicture/1596693718012.jpg;https://picture.doctormeeting.com/myPicture/1596693726265.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (37, 5, '测试测试测试', '您追图谱上YY', 'https://picture.doctormeeting.com/myPicture/1595058097135.jpg', '集体退嘻嘻嘻', 'https://picture.doctormeeting.com/myPicture/1595057916864.jpg', '', 'https://picture.doctormeeting.com/myPicture/1595057932710.mp4', '呃呃呃得得得得得得得得得得得得', '', '哦以为在真学在真学在真学网', '', '', 'https://picture.doctormeeting.com/myPicture/1595057967915.mp4', 1, 0, '2020-08-07 09:58:51', 'H游戏嘻嘻也行哦', 'https://picture.doctormeeting.com/myPicture/1595057978508.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (38, 5, '复杂病例', '发票抬头：***有限公司', 'https://picture.doctormeeting.com/myPicture/1596765599343.jpg;https://picture.doctormeeting.com/myPicture/1596765608004.jpg', 'try嘻嘻洗澡洗', 'https://picture.doctormeeting.com/myPicture/1596765631100.mp4', '', '', '', '', '', '', '', '', 1, 0, '2020-08-07 10:00:40', '嘻嘻嘻嘻嘻嘻嘻嘻哦', 'https://picture.doctormeeting.com/myPicture/1596765637700.jpg', 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (39, 11, '22222', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '2020-08-10 16:35:04', 'jkk', 'https://picture.doctormeeting.com/myPicture/1597048435731.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (40, 11, '22222', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '2020-08-10 16:35:26', 'doldldll', 'https://picture.doctormeeting.com/myPicture/1597048435731.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (41, 11, '22222', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-11 15:21:04', 'doldldll', 'https://picture.doctormeeting.com/myPicture/1597048435731.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (42, 5, '撒撒旦撒撒旦撒达到', '阿斯顿', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-12 13:17:39', '打撒手打死打伤的', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (48, 5, '呜呜呜呜', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-15 10:52:36', '呜呜呜呜', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (49, 5, '鬼夜哭韩国i', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '2020-08-17 11:48:20', '就会更加客观', '', 0, 1, 0, NULL, NULL, NULL, 1, 14, 0);
INSERT INTO `experience_sharing` VALUES (50, 5, '444', '444', '444', '444', '444', '444', '444', '444', '444', '444', '444', '444', '444', 0, 0, '2020-08-18 11:00:08', '444', '444', 1, 0, 0, NULL, NULL, NULL, 1, 14, 0);
INSERT INTO `experience_sharing` VALUES (51, 2, '小组讨论标题1', '爱上大大大大所阿达大阿达啊啊', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-19 10:09:13', '啊大大阿达啊啊大', 'https://picture.doctormeeting.com/myPicture/1597802951633.jpeg', 0, 0, 0, NULL, NULL, NULL, 1, 16, 0);
INSERT INTO `experience_sharing` VALUES (52, 2, '小组测试2的标题', '他叫张朝南，乡村教师，朴实敦厚，典型的山里汉子。他有太多的事迹可以让那一方人永远记住他，为了二十几个学生能顺利上学读书，他变卖了所有的家当，住在学校里，苦苦地支撑着几个村唯一的小学。作为一个极贫困偏远山区的民办教师，他的工资不仅少得可怜，而且被长年拖欠着，他甚至连家都没成。每年涨山洪的季节，他都要亲自去接送各村的学生，在危险地段，他更是背着学生趟过河水。他的事迹上过报纸，可除了得到一点虚名外，对于他，对于他的学校，没有带来丝毫的改变。', 'https://picture.doctormeeting.com/myPicture/1597803092008.mp4', '直到暴发那场最大的泥石流。那一次，张朝南在生死边缘走了无数次，救下了二十一名学生，却终有一个孩子被泥石流吞噬了生命。他自责自怨，无法面对那如花的生命在面前殒落。他觉得对不起教师这个称号，他连一个孩子稚嫩的生命都保护不了。那次灾难之后，他便放弃了教师的职业，成了无数普通山里人的一员。', 'https://picture.doctormeeting.com/myPicture/1597803109284.jpg;https://picture.doctormeeting.com/myPicture/1597803108925.jpg;https://picture.doctormeeting.com/myPicture/1597803108460.jpeg', '此人叫凌厉。人如其名，他在那个圈子里绝对是人人谈之色变的人物。他是一个保镖，花高价雇他的人极其放心。他的身手，十个经过专业训练的大汉也不是对手，他冷酷无情，毫不心慈手软。在一场地下商业纷争中，他和雇主面对几十个人，在谈崩了的情况下，他能将雇主安然带回，身后是放倒了一地的打手。这一事件，已成了保镖界的传奇与神话。', 'https://picture.doctormeeting.com/myPicture/1597803116020.jpeg;https://picture.doctormeeting.com/myPicture/1597803119322.jpeg', '然而，更令人难以相信的是，封平一夜之间出卖了集团中自己所有的股份，甚至，那些天文数字的财产他全都捐了出去。这种做法，在国内是尽够惊世骇俗的了。有人说，他孤身一人，挣那么多钱也没人分享，自然捐了。可不管怎样，封平做到了，而且一下子消失在人们的视线之中，连那些为挖新闻无孔不入的记者也寻不到他的踪迹，就像他从未曾出现过辉煌过。', 'https://picture.doctormeeting.com/myPicture/1597803141286.jpeg;https://picture.doctormeeting.com/myPicture/1597803137946.jpeg', '这是一个地位尊崇的企业家，叫封平，年近半百开始创业，在短短几年内将一个小门面发展成大集团公司，让许多业内人士和记者惊为天人。是的，在当今竞争如此激烈残酷的现实之中，他能在几年之中迅速崛起，非是天才不能如此。年过六旬的封平事业如日中天，不过他却很低调，丝毫没有大富豪的派头和霸气。令人感到惊奇的是，他竟然是单身，不知是丧失了亲人还是终身未娶。只是听人说在他的办公桌上，摆着一张小女孩的照片，这也让人们凭添了许多猜想。', 'https://picture.doctormeeting.com/myPicture/1597803130774.mp4', '张朝南，凌厉，封平，三个人，三种人生，仿佛来自三个不同的时空，他们却震撼了太多的人。我是在一个青年教育中心听到关于这三个人的事，当时，一个老者正在给台下数百名问题青年讲课，讲的就是这三个人。那些问题青年，都是游走于法律边缘的人，太多的人因为这一堂课而悬崖勒马。因为，每个人曾经的梦都是纤尘不染的吧。', 'https://picture.doctormeeting.com/myPicture/1597803154474.jpeg;https://picture.doctormeeting.com/myPicture/1597803152830.jpeg', 1, 0, '2020-08-19 10:12:46', '张朝南不当教师以后，却依然惦着山里的孩子，为他们的教育问题困扰。最后，他决定去城里打工，想多挣些钱以改变山里的教育现状。可是进城不久，他便发现了挣钱的艰难，而朴实的他也因钱的诱惑而慢慢偏离生命的正轨，开始为了快速挣钱而拼命。于是，保镖凌厉出现了。变成凌厉之后，他的钱挣得越来越多，每一次想收手时，都想着再干一次，终于身陷囹圄。十年刑满后，他出狱了，由于给太多的大老板当过贴身保镖，经历的商场事件也无人能及，他开始了自己的商场生涯，几年之后，企业家封平横空出世。他这次及时身退，这些年嫌的钱被他捐出建了多少所希望小学，只有他自己知道。如今的他，正在一个遥远的山区，在一个崭新的希望小学里，做着迟缓的敲钟人。在他住处的桌子上，仍然摆着那个小女孩的照片，那女孩，就是在那场泥石流中逝去的学生。', 'https://picture.doctormeeting.com/myPicture/1597803164498.jpeg', 0, 0, 0, NULL, NULL, NULL, 1, 16, 0);
INSERT INTO `experience_sharing` VALUES (68, 2, '222', '442', '442', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', 0, 0, '2020-08-19 14:21:58', '222', '222', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (72, 2, 'test123', '111', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-19 14:33:51', '1231312312', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (73, 2, 'test1235555', '11155', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-19 16:56:44', '1231312312555', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (74, 2, 'test1235555999', '11155989', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-19 17:00:30', '123131231255588', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (77, 5, '5645615', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-26 10:04:11', '56565', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (78, 11, '8888888', 'rgbvchhb', '', 'ggghhhh', '', 'yyyuuuu', '', 'bbbbbbb', '', 'gggggggh', '', 'vbvvbbbb', '', 1, 0, '2020-08-26 12:57:30', 'ghbbbbbbbbb', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (79, 5, '小组动态测试', '哦去嘻嘻嘻一下', 'https://picture.doctormeeting.com/myPicture/1598417847250.jpg', '', 'https://picture.doctormeeting.com/myPicture/1598417855213.mp4', '', '', '', '', '', '', '', '', 1, 0, '2020-08-26 12:57:45', '嘻嘻嘻嘻嘻', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (80, 5, '小组动态测试', '哦去嘻嘻嘻一下', 'https://picture.doctormeeting.com/myPicture/1598417847250.jpg', '', 'https://picture.doctormeeting.com/myPicture/1598417855213.mp4', '', '', '', '', '', '', '', '', 1, 0, '2020-08-26 12:58:22', '嘻嘻嘻嘻嘻', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (81, 5, '小组动态', '哦我弄', 'https://picture.doctormeeting.com/myPicture/1598418032085.jpg', '', 'https://picture.doctormeeting.com/myPicture/1598418049781.mp4', '', '', '', '', '', '', '', '', 1, 0, '2020-08-26 13:01:01', '哦破哦破哦送', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (82, 5, '小组动态', '哦我弄', 'https://picture.doctormeeting.com/myPicture/1598418032085.jpg', '', 'https://picture.doctormeeting.com/myPicture/1598418049781.mp4', '', '', '', '', '', '', '', '', 1, 0, '2020-08-26 13:01:57', '哦破哦破哦送', '', 0, 1, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (83, 11, '222', '882', '442', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', 0, 0, '2020-08-26 13:31:42', '222', '222', 0, 1, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (84, 11, '222', '882', '442', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', 0, 0, '2020-08-26 14:02:32', '222', '222', 0, 1, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (85, 11, '8888888', 'rgbvchhb', 'https://picture.doctormeeting.com/myPicture/1598431406895.jpg', 'ggghhhh', 'https://picture.doctormeeting.com/myPicture/1598431426230.jpg', 'yyyuuuu', 'https://picture.doctormeeting.com/myPicture/1598431430479.jpg', 'bbbbbbb', 'https://picture.doctormeeting.com/myPicture/1598431447218.jpg', 'gggggggh', 'https://picture.doctormeeting.com/myPicture/1598431444420.jpg', 'vbvvbbbb', 'https://picture.doctormeeting.com/myPicture/1598431458848.jpg', 1, 0, '2020-08-26 16:44:40', 'ghbbbbbbbbb', 'https://picture.doctormeeting.com/myPicture/1598431466799.jpg', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (86, 11, '222', '662', '662', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', 0, 0, '2020-08-27 09:40:51', '222', '222', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (87, 11, '222', '772', '772', '222', '222', '222', '222', '772', '222', '222', '222', '222', '222', 0, 0, '2020-08-27 10:09:14', '222', '222', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (88, 5, '啊阿斯顿阿斯大声阿斯大叔大婶阿斯大叔大婶', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-27 11:31:33', '是沙雕啥大事撒打死打伤撒打死打伤的', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (89, 11, '222', '772', '772', '222', '222', '222', '222', '772', '222', '222', '222', '222', '222', 0, 0, '2020-08-27 11:35:52', '222', '222', 0, 0, 0, NULL, NULL, NULL, 1, 22, 0);
INSERT INTO `experience_sharing` VALUES (90, 5, '啊阿斯顿阿斯大声阿斯大叔大婶阿斯大叔大婶', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-27 11:40:55', '是沙雕啥大事撒打死打伤撒打死打伤的', '', 0, 0, 0, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `experience_sharing` VALUES (91, 5, '啊阿斯顿阿斯大声阿斯大叔大婶阿斯大叔大婶', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2020-08-27 11:54:31', '是沙雕啥大事撒打死打伤撒打死打伤的', '', 0, 0, 0, NULL, NULL, NULL, 1, 33, 0);

-- ----------------------------
-- Table structure for give_like_record
-- ----------------------------
DROP TABLE IF EXISTS `give_like_record`;
CREATE TABLE `give_like_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `eid` int(11) NULL DEFAULT NULL COMMENT '经验，复杂病历id',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0点赞消息未读，1消息已读',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of give_like_record
-- ----------------------------
INSERT INTO `give_like_record` VALUES (8, 2, 18, 0, '2020-07-30 10:22:48', NULL);
INSERT INTO `give_like_record` VALUES (9, 2, 20, 0, '2020-07-30 10:22:55', NULL);
INSERT INTO `give_like_record` VALUES (10, 2, 29, 0, '2020-07-30 10:22:59', NULL);
INSERT INTO `give_like_record` VALUES (11, 2, 29, 0, '2020-07-30 10:23:01', NULL);
INSERT INTO `give_like_record` VALUES (13, 2, 29, 0, '2020-07-30 10:23:05', NULL);
INSERT INTO `give_like_record` VALUES (14, 2, 29, 0, '2020-07-30 10:23:08', NULL);
INSERT INTO `give_like_record` VALUES (15, 2, 30, 0, '2020-07-30 10:23:11', NULL);
INSERT INTO `give_like_record` VALUES (20, 5, 29, 0, '2020-07-30 10:23:15', NULL);
INSERT INTO `give_like_record` VALUES (21, 5, 33, 0, '2020-07-30 10:23:18', NULL);
INSERT INTO `give_like_record` VALUES (22, 5, 30, 0, '2020-07-30 10:23:21', NULL);
INSERT INTO `give_like_record` VALUES (23, 5, 32, 0, '2020-07-30 10:23:25', NULL);
INSERT INTO `give_like_record` VALUES (24, 6, 34, 0, '2020-07-30 10:23:30', NULL);
INSERT INTO `give_like_record` VALUES (25, 2, 33, 0, '2020-07-30 10:23:33', NULL);
INSERT INTO `give_like_record` VALUES (26, 5, 33, 0, '2020-07-30 10:23:36', NULL);
INSERT INTO `give_like_record` VALUES (27, 5, 33, 0, '2020-07-30 10:23:39', NULL);
INSERT INTO `give_like_record` VALUES (28, 2, 33, 0, '2020-07-30 10:23:42', NULL);
INSERT INTO `give_like_record` VALUES (29, 5, 35, 0, '2020-07-30 10:23:44', NULL);
INSERT INTO `give_like_record` VALUES (30, 2, 35, 0, '2020-07-30 10:23:48', NULL);
INSERT INTO `give_like_record` VALUES (31, 5, 32, 0, '2020-08-04 14:22:00', NULL);
INSERT INTO `give_like_record` VALUES (32, 5, 29, 0, '2020-08-05 13:00:00', NULL);
INSERT INTO `give_like_record` VALUES (33, 5, 36, 0, '2020-08-06 14:03:00', NULL);
INSERT INTO `give_like_record` VALUES (34, 2, 37, 0, '2020-08-07 11:44:00', NULL);
INSERT INTO `give_like_record` VALUES (35, 2, 37, 0, '2020-08-07 11:50:07', NULL);
INSERT INTO `give_like_record` VALUES (36, 5, 37, 0, '2020-08-07 11:50:07', NULL);
INSERT INTO `give_like_record` VALUES (37, 5, 41, 0, '2020-08-11 15:25:59', NULL);
INSERT INTO `give_like_record` VALUES (39, 5, 77, 0, '2020-08-26 13:09:58', NULL);
INSERT INTO `give_like_record` VALUES (40, 5, 81, 0, '2020-08-26 13:15:58', NULL);
INSERT INTO `give_like_record` VALUES (41, 11, 81, 0, '2020-08-26 16:45:58', NULL);
INSERT INTO `give_like_record` VALUES (42, 5, 87, 0, '2020-08-27 11:27:00', NULL);

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `group_brief_introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组简介',
  `group_banner` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组banner图',
  `open` int(2) NULL DEFAULT NULL COMMENT '是否公开 0公开 1不公开',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '创建用户id',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0正常 1删除',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `weight` int(11) NULL DEFAULT 0 COMMENT '小组权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小组信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES (7, '企1233', '222', 'https://picture.doctormeeting.com/banner/pexels-photo-675920.jpeg', 0, 5, 0, NULL, '2020-08-18 13:09:21', 10);
INSERT INTO `group_info` VALUES (8, '小组123', '222', 'https://picture.doctormeeting.com/banner/pexels-photo-675920.jpeg', 0, 2, 0, NULL, '2020-08-18 13:09:24', 11);
INSERT INTO `group_info` VALUES (9, '小组888', '222', 'https://picture.doctormeeting.com/banner/medications-money-cure-tablets-47327.jpeg', 0, 2, 0, NULL, '2020-08-18 13:09:28', 12);
INSERT INTO `group_info` VALUES (10, '2110000', '0000000', 'http://tmp/wx0a9609b276448a24.o6zAJsxOLK6YrMHxJBZbXxinLWxE.0fnYrm62Omga04787fe99ab2acc3f0ddc98c1df66d71.jpeg', 0, 5, 0, NULL, '2020-08-18 13:09:33', 13);
INSERT INTO `group_info` VALUES (11, '2110000', '0000000', 'http://tmp/wx0a9609b276448a24.o6zAJsxOLK6YrMHxJBZbXxinLWxE.0fnYrm62Omga04787fe99ab2acc3f0ddc98c1df66d71.jpeg', 0, 5, 0, NULL, '2020-08-18 13:09:38', 14);
INSERT INTO `group_info` VALUES (12, '00000', '00000', 'http://tmp/wx0a9609b276448a24.o6zAJsxOLK6YrMHxJBZbXxinLWxE.DlaamHe5HzLZ04787fe99ab2acc3f0ddc98c1df66d71.jpeg', 0, 5, 0, NULL, '2020-08-18 13:09:42', 15);
INSERT INTO `group_info` VALUES (13, '小组678999', '222', 'https://picture.doctormeeting.com/mini-local/banner3.jpeg', 0, 2, 0, NULL, '2020-08-18 13:46:32', 16);
INSERT INTO `group_info` VALUES (14, '兴趣小组1', '555', 'https://picture.doctormeeting.com/banner/a21.jpg', 0, 2, 0, NULL, '2020-08-18 14:36:04', 56);
INSERT INTO `group_info` VALUES (16, '测试小组1', '小组简介', 'http://tmp/wx0a9609b276448a24.o6zAJs1Z6ouapCaAc5PWCvlLyKmY.CtKJVB3Ml01W518be77d927d65ae1c7c4f18f7301d1c.jpg', 0, 2, 0, NULL, '2020-08-18 17:13:48', 20);
INSERT INTO `group_info` VALUES (17, '呜呜呜呜呜呜呜呜呜呜呜呜呜', '呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜', '', 0, 5, 0, '2020-08-21 14:49:43', '2020-08-18 17:16:52', 44);
INSERT INTO `group_info` VALUES (18, '882', '888', 'https://picture.doctormeeting.com/mini-local/banner3.jpeg', 0, 11, 0, NULL, '2020-08-19 12:19:04', 22);
INSERT INTO `group_info` VALUES (19, 'test123123', '12313124234234234', 'https://picture.doctormeeting.com/myPicture/1597900470744.jpg', 0, 2, 0, NULL, '2020-08-20 13:14:24', 0);
INSERT INTO `group_info` VALUES (20, 'iuahsdajd222', '123123123123123123', 'https://picture.doctormeeting.com/myPicture/1597900527676.jpg', 0, 2, 0, NULL, '2020-08-20 13:15:29', 0);
INSERT INTO `group_info` VALUES (21, 'susuuwuuwwuwww', 'asdad13e1ed1we', 'https://picture.doctormeeting.com/myPicture/1597900629433.jpg', 0, 2, 0, NULL, '2020-08-20 13:17:10', 0);
INSERT INTO `group_info` VALUES (22, 'sa8812j312893', 'asdad123123', 'https://picture.doctormeeting.com/myPicture/1597900717576.jpg', 0, 2, 0, NULL, '2020-08-20 13:18:38', 0);
INSERT INTO `group_info` VALUES (23, '892398s2342', '123123123123', 'https://picture.doctormeeting.com/myPicture/1597900738231.jpeg', 0, 2, 0, NULL, '2020-08-20 13:18:56', 0);
INSERT INTO `group_info` VALUES (33, '无足鸟的小组', '飞飞飞', 'https://picture.doctormeeting.com/myPicture/1598431665790.jpg', 0, 11, 0, NULL, '2020-08-26 16:47:42', 0);

-- ----------------------------
-- Table structure for group_topic
-- ----------------------------
DROP TABLE IF EXISTS `group_topic`;
CREATE TABLE `group_topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NULL DEFAULT NULL COMMENT '小组id',
  `tid` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小组话题关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of group_topic
-- ----------------------------
INSERT INTO `group_topic` VALUES (13, 7, 2, '2020-08-18 13:14:56');
INSERT INTO `group_topic` VALUES (14, 8, 2, '2020-08-18 13:15:00');
INSERT INTO `group_topic` VALUES (15, 9, 2, '2020-08-18 13:15:03');
INSERT INTO `group_topic` VALUES (16, 10, 1, '2020-08-18 13:15:07');
INSERT INTO `group_topic` VALUES (17, 10, 2, '2020-08-18 13:15:09');
INSERT INTO `group_topic` VALUES (18, 10, 3, '2020-08-18 13:15:12');
INSERT INTO `group_topic` VALUES (19, 11, 1, '2020-08-18 13:15:14');
INSERT INTO `group_topic` VALUES (20, 11, 2, '2020-08-18 13:15:17');
INSERT INTO `group_topic` VALUES (21, 11, 3, '2020-08-18 13:15:20');
INSERT INTO `group_topic` VALUES (22, 12, 1, '2020-08-18 13:15:24');
INSERT INTO `group_topic` VALUES (23, 12, 2, '2020-08-18 13:15:28');
INSERT INTO `group_topic` VALUES (24, 12, 3, '2020-08-18 13:15:31');
INSERT INTO `group_topic` VALUES (25, 13, 2, '2020-08-18 13:46:55');
INSERT INTO `group_topic` VALUES (26, 14, 2, '2020-08-18 14:36:04');
INSERT INTO `group_topic` VALUES (28, 16, 1, '2020-08-18 17:13:48');
INSERT INTO `group_topic` VALUES (29, 16, 2, '2020-08-18 17:13:48');
INSERT INTO `group_topic` VALUES (32, 18, 2, '2020-08-19 12:19:04');
INSERT INTO `group_topic` VALUES (33, 19, 3, '2020-08-20 13:14:24');
INSERT INTO `group_topic` VALUES (34, 20, 4, '2020-08-20 13:15:29');
INSERT INTO `group_topic` VALUES (35, 21, 13, '2020-08-20 13:17:10');
INSERT INTO `group_topic` VALUES (36, 22, 45, '2020-08-20 13:18:38');
INSERT INTO `group_topic` VALUES (37, 23, 23, '2020-08-20 13:18:56');
INSERT INTO `group_topic` VALUES (47, 17, 1, '2020-08-21 14:49:43');
INSERT INTO `group_topic` VALUES (48, 17, 3, '2020-08-21 14:49:43');
INSERT INTO `group_topic` VALUES (49, 17, 4, '2020-08-21 14:49:43');
INSERT INTO `group_topic` VALUES (50, 33, 2, '2020-08-26 16:47:42');
INSERT INTO `group_topic` VALUES (51, 33, 3, '2020-08-26 16:47:42');
INSERT INTO `group_topic` VALUES (52, 33, 4, '2020-08-26 16:47:42');

-- ----------------------------
-- Table structure for group_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `group_user_relation`;
CREATE TABLE `group_user_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NULL DEFAULT NULL COMMENT '小组id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role` int(2) NULL DEFAULT 1 COMMENT '用户角色 0小组创始人 1小组成员',
  `operation_uid` int(11) NULL DEFAULT NULL COMMENT '邀请人id',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0正常 1删除',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小组成员关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of group_user_relation
-- ----------------------------
INSERT INTO `group_user_relation` VALUES (6, 7, 5, 1, NULL, 0, NULL, '2020-08-18 13:14:37');
INSERT INTO `group_user_relation` VALUES (7, 8, 2, 1, NULL, 0, NULL, '2020-08-18 13:14:40');
INSERT INTO `group_user_relation` VALUES (8, 9, 2, 1, NULL, 0, NULL, '2020-08-18 13:14:43');
INSERT INTO `group_user_relation` VALUES (9, 10, 5, 1, NULL, 0, NULL, '2020-08-18 13:14:46');
INSERT INTO `group_user_relation` VALUES (10, 11, 5, 1, NULL, 0, NULL, '2020-08-18 13:14:48');
INSERT INTO `group_user_relation` VALUES (11, 12, 5, 1, NULL, 0, NULL, NULL);
INSERT INTO `group_user_relation` VALUES (12, 13, 2, 1, NULL, 0, NULL, '2020-08-18 13:46:55');
INSERT INTO `group_user_relation` VALUES (13, 14, 2, 0, NULL, 0, NULL, '2020-08-18 14:36:04');
INSERT INTO `group_user_relation` VALUES (15, 16, 2, 1, NULL, 0, NULL, '2020-08-18 17:13:48');
INSERT INTO `group_user_relation` VALUES (16, 17, 5, 1, NULL, 0, NULL, '2020-08-18 17:16:52');
INSERT INTO `group_user_relation` VALUES (17, 14, 5, 1, NULL, 0, NULL, '2020-08-19 11:48:38');
INSERT INTO `group_user_relation` VALUES (20, 7, 5, 1, 2, 0, NULL, '2020-08-19 12:03:39');
INSERT INTO `group_user_relation` VALUES (22, 18, 11, 0, NULL, 0, NULL, '2020-08-19 12:19:04');
INSERT INTO `group_user_relation` VALUES (23, 18, 5, 1, 11, 0, NULL, '2020-08-19 12:27:59');
INSERT INTO `group_user_relation` VALUES (25, 16, 5, 1, NULL, 0, NULL, '2020-08-20 11:22:27');
INSERT INTO `group_user_relation` VALUES (26, 13, 5, 1, NULL, 0, NULL, '2020-08-20 11:35:01');
INSERT INTO `group_user_relation` VALUES (27, 9, 5, 1, NULL, 0, NULL, '2020-08-20 11:41:14');
INSERT INTO `group_user_relation` VALUES (28, 8, 5, 1, NULL, 0, NULL, '2020-08-20 11:41:55');
INSERT INTO `group_user_relation` VALUES (29, 19, 2, 0, NULL, 0, NULL, '2020-08-20 13:14:24');
INSERT INTO `group_user_relation` VALUES (30, 20, 2, 0, NULL, 0, NULL, '2020-08-20 13:15:29');
INSERT INTO `group_user_relation` VALUES (31, 21, 2, 0, NULL, 0, NULL, '2020-08-20 13:17:10');
INSERT INTO `group_user_relation` VALUES (32, 22, 2, 0, NULL, 0, NULL, '2020-08-20 13:18:38');
INSERT INTO `group_user_relation` VALUES (33, 23, 2, 0, NULL, 0, NULL, '2020-08-20 13:18:56');
INSERT INTO `group_user_relation` VALUES (34, 14, 11, 1, NULL, 0, NULL, '2020-08-19 11:48:38');
INSERT INTO `group_user_relation` VALUES (44, 23, 11, 1, 2, 0, NULL, '2020-08-21 15:27:08');
INSERT INTO `group_user_relation` VALUES (45, 22, 5, 1, 2, 0, NULL, '2020-08-21 15:28:11');
INSERT INTO `group_user_relation` VALUES (46, 20, 5, 1, 2, 0, NULL, '2020-08-21 15:30:02');
INSERT INTO `group_user_relation` VALUES (48, 19, 11, 1, 2, 0, NULL, '2020-08-21 15:30:13');
INSERT INTO `group_user_relation` VALUES (50, 20, 3, 1, 5, 0, NULL, '2020-08-26 13:11:51');
INSERT INTO `group_user_relation` VALUES (51, 33, 11, 0, NULL, 0, NULL, '2020-08-26 16:47:42');
INSERT INTO `group_user_relation` VALUES (52, 33, 5, 1, 11, 0, NULL, '2020-08-27 11:47:07');

-- ----------------------------
-- Table structure for home_page_banner
-- ----------------------------
DROP TABLE IF EXISTS `home_page_banner`;
CREATE TABLE `home_page_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `jump_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `ranking` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '排名',
  `display` int(255) NULL DEFAULT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页banner表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of home_page_banner
-- ----------------------------
INSERT INTO `home_page_banner` VALUES (1, 'https://picture.doctormeeting.com/mini-local/banner1.jpeg', '111', 'https://mp.weixin.qq.com/s/3NnkMLsjVYOlcHz0CsGtbA', '2020-08-11 17:07:48', 97, 1);
INSERT INTO `home_page_banner` VALUES (2, 'https://picture.doctormeeting.com/banner/a13.jpg', '2223', 'https://mp.weixin.qq.com/s/y8C6RzucwjXTP19NZ5sVIg', '2020-08-05 17:07:53', 100, 1);
INSERT INTO `home_page_banner` VALUES (3, 'https://picture.doctormeeting.com/banner/pexels-photo-675920.jpeg', '333', 'https://mp.weixin.qq.com/s/3fWmTJYKgm3oxFbuRhSGJA', '2020-08-14 17:07:58', 99, 1);
INSERT INTO `home_page_banner` VALUES (4, 'https://picture.doctormeeting.com/banner/pexels-photo-373967.jpeg', '4448', 'https://mp.weixin.qq.com/s/3fWmTJYKgm3oxFbuRhSGJA', '2020-08-14 17:07:58', 98, 1);
INSERT INTO `home_page_banner` VALUES (5, 'https://picture.doctormeeting.com/banner/a8.jpg', '555', 'https://mp.weixin.qq.com/s/3fWmTJYKgm3oxFbuRhSGJA', '2020-08-14 17:07:58', 96, 1);
INSERT INTO `home_page_banner` VALUES (6, 'https://picture.doctormeeting.com/mini-local/banner3.jpeg', '666', 'https://mp.weixin.qq.com/s/3fWmTJYKgm3oxFbuRhSGJA', '2020-08-14 17:07:58', 95, 0);
INSERT INTO `home_page_banner` VALUES (7, 'https://picture.doctormeeting.com/banner/medications-money-cure-tablets-47327.jpeg', '777', 'https://mp.weixin.qq.com/s/3fWmTJYKgm3oxFbuRhSGJA', '2020-08-14 17:07:58', 94, 1);
INSERT INTO `home_page_banner` VALUES (8, 'https://picture.doctormeeting.com/mini-local/banner3.jpeg', '888', 'https://mp.weixin.qq.com/s/3fWmTJYKgm3oxFbuRhSGJA', '2020-08-14 17:07:58', 93, 0);

-- ----------------------------
-- Table structure for integral_recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `integral_recharge_order`;
CREATE TABLE `integral_recharge_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户openId',
  `pay_oid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `pay_state` int(2) NULL DEFAULT 0 COMMENT '0:未支付  1:已支付',
  `premium` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付金额(单位：分)',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分充值记录订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of integral_recharge_order
-- ----------------------------
INSERT INTO `integral_recharge_order` VALUES (1, 2, 'HHK1596419740950', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (2, 2, 'HHK1596421637035', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (3, 2, 'HHK1596429804233', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (4, 2, 'HHK1596430068724', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (5, 2, 'HHK1596430094735', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (6, 2, 'HHK1596430219384', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (7, 2, 'HHK1596432674949', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (8, 2, 'HHK1596432917387', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (9, 2, 'HHK1596439426395', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (10, 2, 'HHK1596439529496', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (11, 2, 'HHK1596439836350', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (12, 2, 'HHK1596440442567', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (13, 2, 'HHK1596442800465', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (14, 2, 'HHK1596442847840', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', NULL, NULL);
INSERT INTO `integral_recharge_order` VALUES (15, 2, 'HHK1596505229910', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, 0, '1', '2020-08-04 09:40:30', '2020-08-04 09:40:30');
INSERT INTO `integral_recharge_order` VALUES (16, 5, 'HHK1596506951152', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', NULL, 0, '1', '2020-08-04 10:09:11', '2020-08-04 10:09:11');
INSERT INTO `integral_recharge_order` VALUES (17, 5, 'HHK1596511694684', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', NULL, 0, '1', '2020-08-04 11:28:15', '2020-08-04 11:28:15');
INSERT INTO `integral_recharge_order` VALUES (18, 5, 'HHK1596511773309', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', NULL, 0, '1', '2020-08-04 11:29:33', '2020-08-04 11:29:33');
INSERT INTO `integral_recharge_order` VALUES (19, 11, 'HHK1596680186918', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', NULL, 0, '1', '2020-08-06 10:16:27', '2020-08-06 10:16:27');
INSERT INTO `integral_recharge_order` VALUES (20, 11, 'HHK1596682938184', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', NULL, 0, '1', '2020-08-06 11:02:18', '2020-08-06 11:02:18');
INSERT INTO `integral_recharge_order` VALUES (21, 11, 'HHK1596683636004', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000718202008063523263350', 1, '1', '2020-08-06 13:48:09', '2020-08-06 11:13:56');
INSERT INTO `integral_recharge_order` VALUES (22, 11, 'HHK1596684847637', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000705202008067760185502', 1, '1', '2020-08-06 13:38:23', '2020-08-06 11:34:08');
INSERT INTO `integral_recharge_order` VALUES (23, 11, 'HHK1596685228325', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000704202008061175511920', 1, '1', '2020-08-06 13:44:41', '2020-08-06 11:40:28');
INSERT INTO `integral_recharge_order` VALUES (24, 11, 'HHK1596686033629', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000707202008063448880150', 1, '1', '2020-08-06 13:58:06', '2020-08-06 11:53:54');
INSERT INTO `integral_recharge_order` VALUES (25, 11, 'HHK1596691817833', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000711202008064833326949', 1, '1', '2020-08-06 13:30:23', '2020-08-06 13:30:18');
INSERT INTO `integral_recharge_order` VALUES (26, 5, 'HHK1596692513903', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', NULL, 0, '1', '2020-08-06 13:41:54', '2020-08-06 13:41:54');
INSERT INTO `integral_recharge_order` VALUES (27, 5, 'HHK1596693112692', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', NULL, 0, '1', '2020-08-06 13:51:52', '2020-08-06 13:51:52');
INSERT INTO `integral_recharge_order` VALUES (28, 5, 'HHK1596765721473', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', '4200000705202008070690451561', 1, '1', '2020-08-07 10:02:06', '2020-08-07 10:02:01');
INSERT INTO `integral_recharge_order` VALUES (29, 11, 'HHK1597122623230', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000718202008114156292632', 1, '1', '2020-08-11 13:10:30', '2020-08-11 13:10:23');
INSERT INTO `integral_recharge_order` VALUES (30, 11, 'HHK1597212456301', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000723202008128641512641', 1, '1', '2020-08-12 14:07:41', '2020-08-12 14:07:36');
INSERT INTO `integral_recharge_order` VALUES (31, 11, 'HHK1597367986511', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000711202008140827572578', 1, '1', '2020-08-14 09:19:52', '2020-08-14 09:19:46');
INSERT INTO `integral_recharge_order` VALUES (32, 11, 'HHK1597634134207', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000713202008172743241180', 1, '1', '2020-08-17 11:15:55', '2020-08-17 11:15:34');
INSERT INTO `integral_recharge_order` VALUES (33, 11, 'HHK1597992094816', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', '4200000721202008214732646910', 1, '1', '2020-08-21 14:41:52', '2020-08-21 14:41:35');
INSERT INTO `integral_recharge_order` VALUES (34, 2, 'HHK1598235523075', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', '4200000716202008246155204560', 1, '1', '2020-08-24 10:18:48', '2020-08-24 10:18:43');
INSERT INTO `integral_recharge_order` VALUES (35, 5, 'HHK1598235529536', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', '4200000716202008241682042094', 1, '1', '2020-08-24 10:18:55', '2020-08-24 10:18:49');
INSERT INTO `integral_recharge_order` VALUES (36, 5, 'HHK1598342586145', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', '4200000715202008251202918419', 1, '1', '2020-08-25 16:03:11', '2020-08-25 16:03:06');
INSERT INTO `integral_recharge_order` VALUES (37, 2, 'HHK1598414647047', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', '4200000708202008267642796808', 1, '1', '2020-08-26 12:04:09', '2020-08-26 12:04:07');
INSERT INTO `integral_recharge_order` VALUES (38, 11, 'HHK1598448277213', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', NULL, 0, '1', '2020-08-26 21:24:38', '2020-08-26 21:24:38');
INSERT INTO `integral_recharge_order` VALUES (39, 2, 'HHK1598501184224', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', '4200000709202008272817480590', 1, '1', '2020-08-27 12:06:30', '2020-08-27 12:06:24');

-- ----------------------------
-- Table structure for learning_experience
-- ----------------------------
DROP TABLE IF EXISTS `learning_experience`;
CREATE TABLE `learning_experience`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `academic_degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学位',
  `learning_start_time` datetime NULL DEFAULT NULL COMMENT '学习开始时间',
  `learning_end_time` datetime NULL DEFAULT NULL COMMENT '学习结束时间',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学习经历' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of learning_experience
-- ----------------------------
INSERT INTO `learning_experience` VALUES (1, 2, '屌丝大学22222', '徒步工厂', '屌丝', '1970-07-20 19:23:58', '1974-07-20 19:23:58', NULL);
INSERT INTO `learning_experience` VALUES (2, 2, '222', '222', '333', '1970-01-01 08:00:02', '1970-01-01 08:00:02', NULL);
INSERT INTO `learning_experience` VALUES (4, 2, 'cbb', 'www', 'qqq', '2019-07-20 19:23:58', '2020-07-20 18:23:58', NULL);
INSERT INTO `learning_experience` VALUES (5, 2, '会惠康大学2', '技术专业', '本科', '2005-07-20 19:23:58', '2007-07-20 19:23:58', NULL);
INSERT INTO `learning_experience` VALUES (6, 2, 'c222', 'b', 'aaa1', '1970-07-20 19:23:58', '1970-07-20 19:23:58', NULL);
INSERT INTO `learning_experience` VALUES (8, 5, 'A大学', '啊专业', '学士', '2000-07-21 03:23:58', '2001-07-21 03:23:58', NULL);
INSERT INTO `learning_experience` VALUES (9, 5, 'B大学', 'C专业', '硕士', '2000-07-21 03:23:58', '2001-07-21 03:23:58', NULL);

-- ----------------------------
-- Table structure for minipro_user
-- ----------------------------
DROP TABLE IF EXISTS `minipro_user`;
CREATE TABLE `minipro_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of minipro_user
-- ----------------------------
INSERT INTO `minipro_user` VALUES (2, 'oUP_u0FAr7_A7C_yr3miLQsH0Oz4', 'hehe', '2020-08-27 13:53:03', '13696569569', NULL, NULL, NULL, NULL);
INSERT INTO `minipro_user` VALUES (3, '89iasnd89jekopdi9qk', 'hehe2', '2020-08-27 13:53:03', '4654656', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sms_template`;
CREATE TABLE `sms_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(10) NOT NULL COMMENT '模板ID',
  `template_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信模板内容',
  `bus_type` int(11) NOT NULL COMMENT '业务类型:\r\n1 验证码\r\n2 会诊订单\r\n3 专家医生\r\n4 求诊医生\r\n5 登录注册',
  `bus_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型名称',
  `invalid_time` int(5) NULL DEFAULT 10 COMMENT '过期时间 单位分钟',
  `sms_sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签名',
  `status` int(11) NULL DEFAULT 0 COMMENT '短信模板状态，0，使用。1,删除',
  `create_datetime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_template
-- ----------------------------
INSERT INTO `sms_template` VALUES (1, 578263, '{1}为您的验证码，请于{2}分钟内填写。如非本人操作，请忽略本短信。', 1, '验证码', 10, '向凯科技', 0, '2020-06-18 13:49:56');
INSERT INTO `sms_template` VALUES (2, 423556, '您的会诊信息上传成功,{1}支付费用', 2, '会诊订单', 100, '向凯科技', 0, '2020-06-18 13:49:56');
INSERT INTO `sms_template` VALUES (3, 414643, '有新的会诊预约：{1}医生向您发起会诊预约', 3, '专家医生', 100, '向凯科技', 0, '2020-06-18 13:49:56');
INSERT INTO `sms_template` VALUES (4, 414642, '	\r\n会诊下单成功，已向{1}专家发起会诊预约', 4, '求诊医生', 100, '向凯科技', 0, '2020-06-18 13:49:56');
INSERT INTO `sms_template` VALUES (5, 400620, '{1}为您的登录注册验证码，请于{2}分钟内填写。如非本人操作，请忽略本短信。', 5, '登录注册', 10, '向凯科技', 0, '2020-06-18 13:49:56');
INSERT INTO `sms_template` VALUES (6, 642892, '尊敬的客户您好，你的初始密码为{1}，请妥善保管', 6, '	\r\n用户注册发送密码', 10, '向凯科技', 0, '2020-06-18 13:49:56');

-- ----------------------------
-- Table structure for subject_of_talk
-- ----------------------------
DROP TABLE IF EXISTS `subject_of_talk`;
CREATE TABLE `subject_of_talk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关注话题',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for topic_experience_relation
-- ----------------------------
DROP TABLE IF EXISTS `topic_experience_relation`;
CREATE TABLE `topic_experience_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '经验id',
  `tid` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经验话题关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of topic_experience_relation
-- ----------------------------
INSERT INTO `topic_experience_relation` VALUES (13, 9, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (14, 9, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (15, 9, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (16, 10, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (17, 10, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (18, 10, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (19, 11, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (20, 11, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (21, 11, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (22, 12, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (23, 12, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (24, 12, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (25, 13, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (26, 13, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (27, 13, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (28, 14, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (29, 14, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (30, 14, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (31, 15, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (32, 15, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (33, 16, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (34, 16, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (35, 16, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (36, 17, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (37, 17, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (38, 17, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (39, 18, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (40, 18, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (41, 19, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (42, 19, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (43, 20, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (44, 20, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (45, 21, 9, NULL);
INSERT INTO `topic_experience_relation` VALUES (46, 22, 12, NULL);
INSERT INTO `topic_experience_relation` VALUES (47, 22, 15, NULL);
INSERT INTO `topic_experience_relation` VALUES (48, 22, 19, NULL);
INSERT INTO `topic_experience_relation` VALUES (49, 23, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (50, 24, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (51, 25, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (52, 26, 5, NULL);
INSERT INTO `topic_experience_relation` VALUES (53, 27, 5, NULL);
INSERT INTO `topic_experience_relation` VALUES (54, 28, 5, NULL);
INSERT INTO `topic_experience_relation` VALUES (55, 29, 5, NULL);
INSERT INTO `topic_experience_relation` VALUES (56, 30, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (57, 30, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (58, 31, 5, NULL);
INSERT INTO `topic_experience_relation` VALUES (59, 32, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (60, 33, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (61, 34, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (62, 35, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (63, 35, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (64, 35, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (65, 36, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (66, 36, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (67, 36, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (68, 37, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (69, 38, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (70, 38, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (71, 39, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (72, 39, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (73, 39, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (74, 40, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (75, 40, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (76, 40, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (77, 41, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (78, 41, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (79, 41, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (80, 42, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (81, 42, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (82, 42, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (83, 48, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (84, 49, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (85, 50, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (86, 51, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (87, 52, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (88, 52, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (89, 68, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (90, 72, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (91, 73, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (92, 74, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (93, 77, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (94, 78, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (95, 78, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (96, 78, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (97, 79, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (98, 79, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (99, 80, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (100, 80, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (101, 81, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (102, 81, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (103, 82, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (104, 82, 2, NULL);
INSERT INTO `topic_experience_relation` VALUES (105, 83, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (106, 84, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (107, 85, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (108, 85, 3, NULL);
INSERT INTO `topic_experience_relation` VALUES (109, 85, 4, NULL);
INSERT INTO `topic_experience_relation` VALUES (110, 86, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (111, 87, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (112, 88, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (113, 89, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (114, 90, 1, NULL);
INSERT INTO `topic_experience_relation` VALUES (115, 91, 1, NULL);

-- ----------------------------
-- Table structure for topic_info
-- ----------------------------
DROP TABLE IF EXISTS `topic_info`;
CREATE TABLE `topic_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题名称',
  `numbers` int(10) NULL DEFAULT NULL COMMENT '关注数量',
  `create_date` datetime NULL DEFAULT NULL,
  `topic_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of topic_info
-- ----------------------------
INSERT INTO `topic_info` VALUES (1, '病理科', 13, '2020-06-24 16:50:45', 'https://picture.doctormeeting.com/cat/bingli.jpeg');
INSERT INTO `topic_info` VALUES (2, '妇产科', 14, '2020-06-24 16:50:45', 'https://picture.doctormeeting.com/cat/fuchan.jpeg');
INSERT INTO `topic_info` VALUES (3, '传染病学', 13, '2020-06-24 16:50:45', 'https://picture.doctormeeting.com/cat/chuanran.jpeg');
INSERT INTO `topic_info` VALUES (4, '儿科', 3, '2020-06-24 16:50:45', 'https://picture.doctormeeting.com/cat/erke.jpg');
INSERT INTO `topic_info` VALUES (5, '耳鼻喉科', 3, '2020-06-24 15:57:24', 'https://picture.doctormeeting.com/cat/erbiyanhou.jpeg');
INSERT INTO `topic_info` VALUES (6, '放射科', 2, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/fangshe.jpeg');
INSERT INTO `topic_info` VALUES (7, '风湿病科', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/fengshi.jpeg');
INSERT INTO `topic_info` VALUES (8, '呼吸科', 2, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/huxi.jpeg');
INSERT INTO `topic_info` VALUES (9, '急诊科', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/jizhen.jpeg');
INSERT INTO `topic_info` VALUES (10, '整形外科', 2, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/zhengxing.jpeg');
INSERT INTO `topic_info` VALUES (11, '精神病学', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/jingshen.jpeg');
INSERT INTO `topic_info` VALUES (12, '泌尿科', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/miniao.jpeg');
INSERT INTO `topic_info` VALUES (13, '泌尿生殖系统', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/miniaoshengzhi.jpeg');
INSERT INTO `topic_info` VALUES (14, '内分泌科', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/neifenbi.jpeg');
INSERT INTO `topic_info` VALUES (15, '皮肤科', 1, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/pifu.jpeg');
INSERT INTO `topic_info` VALUES (16, '神经科', 0, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/shenjing.jpeg');
INSERT INTO `topic_info` VALUES (17, '神经外科', 0, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/shenjingwaike.jpeg');
INSERT INTO `topic_info` VALUES (18, '肾脏科', 0, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/shengzang.jpeg');
INSERT INTO `topic_info` VALUES (19, '疼痛医学', 0, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/tentongyixue.jpeg');
INSERT INTO `topic_info` VALUES (20, '外科', 0, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/waike.jpeg');
INSERT INTO `topic_info` VALUES (21, '胃肠科', 0, '2020-06-23 23:16:37', 'https://picture.doctormeeting.com/cat/changwei.jpeg');
INSERT INTO `topic_info` VALUES (22, '心脏科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/xinzang.jpeg');
INSERT INTO `topic_info` VALUES (23, '血液科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/xueye.jpeg');
INSERT INTO `topic_info` VALUES (24, '眼科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/yanke.jpeg');
INSERT INTO `topic_info` VALUES (25, '遗传学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/yichuan.jpg');
INSERT INTO `topic_info` VALUES (26, '整形外科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/zhengxing.jpeg');
INSERT INTO `topic_info` VALUES (27, '肿瘤科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/zhongliu.jpg');
INSERT INTO `topic_info` VALUES (28, '免疫学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/mianyi.jpeg');
INSERT INTO `topic_info` VALUES (29, '麻醉学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/mazui.jpeg');
INSERT INTO `topic_info` VALUES (30, '重症监护', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/zhongzhengjianhu.jpeg');
INSERT INTO `topic_info` VALUES (31, '老年医学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/laonianyixue.jpeg');
INSERT INTO `topic_info` VALUES (32, '住院医生', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/zhuyuanyishi.jpeg');
INSERT INTO `topic_info` VALUES (33, '内科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/neike.jpeg');
INSERT INTO `topic_info` VALUES (34, '药学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/yaoxue.jpeg');
INSERT INTO `topic_info` VALUES (35, '职业病', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/zhiyebing.jpeg');
INSERT INTO `topic_info` VALUES (36, '骨科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/guke.jpeg');
INSERT INTO `topic_info` VALUES (37, '罕见病', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/hanjian.jpeg');
INSERT INTO `topic_info` VALUES (38, '运动医学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/yundong.jpeg');
INSERT INTO `topic_info` VALUES (39, '女性健康', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/nvxing.jpeg');
INSERT INTO `topic_info` VALUES (40, '法医学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/fayi.jpeg');
INSERT INTO `topic_info` VALUES (41, '活动与会议', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/huodong.jpeg');
INSERT INTO `topic_info` VALUES (42, '一般性议题', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/yibanxingyiti.jpeg');
INSERT INTO `topic_info` VALUES (43, '医学伦理学', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/lunli.jpeg');
INSERT INTO `topic_info` VALUES (44, '新技术', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/xinjishu.jpeg');
INSERT INTO `topic_info` VALUES (45, '靶向药', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/baxiang.jpeg');
INSERT INTO `topic_info` VALUES (46, '介入科', 0, '2020-06-23 23:16:38', 'https://picture.doctormeeting.com/cat/jieru.jpeg');

-- ----------------------------
-- Table structure for user_complaint
-- ----------------------------
DROP TABLE IF EXISTS `user_complaint`;
CREATE TABLE `user_complaint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '被投诉话题id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '投诉用户id',
  `content_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉原因',
  `photo_evidence_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片证据',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户投诉记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_complaint
-- ----------------------------
INSERT INTO `user_complaint` VALUES (1, 21, 5, '嗡嗡嗡', '222', NULL);
INSERT INTO `user_complaint` VALUES (2, 21, 5, '嗡嗡嗡', '', NULL);
INSERT INTO `user_complaint` VALUES (3, 21, 5, '嗡嗡嗡', '', NULL);
INSERT INTO `user_complaint` VALUES (4, 21, 6, '嗡嗡嗡', '', NULL);
INSERT INTO `user_complaint` VALUES (5, 37, 2, 'sadasdasd', '', NULL);
INSERT INTO `user_complaint` VALUES (6, 40, 5, 'ww', '', NULL);
INSERT INTO `user_complaint` VALUES (7, 40, 5, 'ww', '', NULL);
INSERT INTO `user_complaint` VALUES (8, 40, 5, 'ww', 'https://picture.doctormeeting.com/myPicture/1597124456120.jpeg', NULL);
INSERT INTO `user_complaint` VALUES (9, 39, 5, '', '', NULL);
INSERT INTO `user_complaint` VALUES (10, 39, 5, '???', '', NULL);
INSERT INTO `user_complaint` VALUES (11, 22, 5, 'ww', 'https://picture.doctormeeting.com/myPicture/1597125128325.jpeg', NULL);
INSERT INTO `user_complaint` VALUES (12, 26, 5, 'ee', '', NULL);
INSERT INTO `user_complaint` VALUES (13, 26, 5, '', 'https://picture.doctormeeting.com/myPicture/1597125854209.jpeg', NULL);
INSERT INTO `user_complaint` VALUES (14, 78, 5, '咳咳咳咳咳咳咳', '', NULL);

-- ----------------------------
-- Table structure for user_follow
-- ----------------------------
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `follow_uid` int(11) NULL DEFAULT NULL COMMENT '关注用户id',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_follow
-- ----------------------------
INSERT INTO `user_follow` VALUES (35, 5, 11, NULL);
INSERT INTO `user_follow` VALUES (36, 5, 3, NULL);
INSERT INTO `user_follow` VALUES (38, 5, 2, NULL);
INSERT INTO `user_follow` VALUES (41, 2, 6, NULL);
INSERT INTO `user_follow` VALUES (43, 32, 11, NULL);
INSERT INTO `user_follow` VALUES (50, 2, 11, NULL);
INSERT INTO `user_follow` VALUES (51, 11, 5, NULL);
INSERT INTO `user_follow` VALUES (52, 11, 2, NULL);

-- ----------------------------
-- Table structure for user_integral
-- ----------------------------
DROP TABLE IF EXISTS `user_integral`;
CREATE TABLE `user_integral`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分数量（一分钱一个积分）',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `frozen_amount` int(11) NULL DEFAULT 0 COMMENT '积分冻结数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_integral
-- ----------------------------
INSERT INTO `user_integral` VALUES (1, 11, '240', '2020-08-27 10:11:02', NULL, 80);
INSERT INTO `user_integral` VALUES (2, 5, '497.00', '2020-08-27 09:42:13', NULL, 0);
INSERT INTO `user_integral` VALUES (3, 2, '9908.00', '2020-08-27 12:06:30', NULL, 0);
INSERT INTO `user_integral` VALUES (4, 6, '120.00', '2020-08-27 09:43:12', NULL, 0);
INSERT INTO `user_integral` VALUES (5, 3, '0.00', NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_integral_add_log
-- ----------------------------
DROP TABLE IF EXISTS `user_integral_add_log`;
CREATE TABLE `user_integral_add_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `add_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费积分',
  `source_uid` int(11) NULL DEFAULT NULL COMMENT '来源用户id',
  `add_type` int(11) NULL DEFAULT NULL COMMENT '增加类型 0送花 1邀请 2充值 3悬赏',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_integral_add_log
-- ----------------------------
INSERT INTO `user_integral_add_log` VALUES (1, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (2, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (3, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (4, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (5, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (6, 5, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (7, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (8, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (9, 11, '1', NULL, 0, '2020-08-17 11:25:09');
INSERT INTO `user_integral_add_log` VALUES (10, 6, '20.00', NULL, 1, '2020-08-17 11:25:37');
INSERT INTO `user_integral_add_log` VALUES (11, 5, '15.00', NULL, 1, '2020-08-17 11:25:58');
INSERT INTO `user_integral_add_log` VALUES (12, 5, '15.00', NULL, 1, '2020-08-17 11:26:01');
INSERT INTO `user_integral_add_log` VALUES (13, 6, '20.00', NULL, 1, '2020-08-17 11:26:05');
INSERT INTO `user_integral_add_log` VALUES (14, 5, '15.00', NULL, 1, '2020-08-17 11:26:07');
INSERT INTO `user_integral_add_log` VALUES (15, 6, '20.00', NULL, 1, '2020-08-17 11:26:11');
INSERT INTO `user_integral_add_log` VALUES (16, 5, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (17, 5, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (18, 5, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (19, 5, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (20, 5, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (21, 11, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (22, 11, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (23, 11, '-20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (24, 11, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (25, 5, '15.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (26, 6, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (27, 2, '0.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (28, 3, '0.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (29, 3, '0.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (30, 2, '0.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (31, 6, '20.00', NULL, 1, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (32, 11, '1', NULL, 0, '2020-08-17 11:24:59');
INSERT INTO `user_integral_add_log` VALUES (33, 6, '20.00', NULL, 1, '2020-08-17 11:48:20');
INSERT INTO `user_integral_add_log` VALUES (34, 5, '20.00', NULL, 1, '2020-08-19 16:49:32');
INSERT INTO `user_integral_add_log` VALUES (35, 5, '20.00', NULL, 1, '2020-08-19 16:57:19');
INSERT INTO `user_integral_add_log` VALUES (36, 5, '20.00', NULL, 1, '2020-08-19 17:01:34');
INSERT INTO `user_integral_add_log` VALUES (37, 11, '1', NULL, 0, '2020-08-21 14:41:52');
INSERT INTO `user_integral_add_log` VALUES (38, 2, '1', NULL, 0, '2020-08-24 10:18:48');
INSERT INTO `user_integral_add_log` VALUES (39, 5, '1', NULL, 0, '2020-08-24 10:18:55');
INSERT INTO `user_integral_add_log` VALUES (40, 5, '1', NULL, 0, '2020-08-25 16:03:11');
INSERT INTO `user_integral_add_log` VALUES (41, 6, '20.00', NULL, 1, '2020-08-26 10:12:14');
INSERT INTO `user_integral_add_log` VALUES (42, 2, '1', NULL, 0, '2020-08-26 12:04:09');
INSERT INTO `user_integral_add_log` VALUES (43, 2, '0.00', NULL, 1, '2020-08-26 12:40:15');
INSERT INTO `user_integral_add_log` VALUES (44, 3, '0.00', NULL, 1, '2020-08-26 12:41:56');
INSERT INTO `user_integral_add_log` VALUES (45, 5, '20.00', NULL, 1, '2020-08-26 13:00:01');
INSERT INTO `user_integral_add_log` VALUES (46, 6, '20.00', NULL, 1, '2020-08-26 13:05:54');
INSERT INTO `user_integral_add_log` VALUES (47, 5, '20.00', NULL, 1, '2020-08-26 13:33:40');
INSERT INTO `user_integral_add_log` VALUES (48, 5, '20.00', 33, 1, '2020-08-27 09:42:13');
INSERT INTO `user_integral_add_log` VALUES (49, 6, '20.00', 34, 1, '2020-08-27 09:43:12');
INSERT INTO `user_integral_add_log` VALUES (50, 2, '0.00', 35, 1, '2020-08-27 10:08:16');
INSERT INTO `user_integral_add_log` VALUES (51, 2, '0.00', 36, 1, '2020-08-27 10:11:02');
INSERT INTO `user_integral_add_log` VALUES (52, 2, '1', NULL, 2, '2020-08-27 12:06:30');

-- ----------------------------
-- Table structure for user_integral_consume_log
-- ----------------------------
DROP TABLE IF EXISTS `user_integral_consume_log`;
CREATE TABLE `user_integral_consume_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `consume_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费积分',
  `consume_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '消费类型  0送花 1邀请 2提现 3悬赏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分消费记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_integral_consume_log
-- ----------------------------
INSERT INTO `user_integral_consume_log` VALUES (1, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (2, 2, '15.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (3, 2, '15.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (4, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (5, 2, '15.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (6, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (7, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (8, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (9, 2, '20.00', NULL, '2020-08-17 11:24:51', 1);
INSERT INTO `user_integral_consume_log` VALUES (10, 2, '20.00', NULL, '2020-08-17 11:24:51', 1);
INSERT INTO `user_integral_consume_log` VALUES (11, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (12, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (13, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (15, 2, '20.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (16, 2, '15.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (18, 5, '0.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (19, 5, '0.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (20, 5, '0.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (21, 5, '0.00', NULL, '2020-08-17 11:24:51', 0);
INSERT INTO `user_integral_consume_log` VALUES (23, 5, '20.00', NULL, '2020-08-17 11:48:20', 1);
INSERT INTO `user_integral_consume_log` VALUES (24, 2, '20.00', NULL, '2020-08-19 16:49:32', 1);
INSERT INTO `user_integral_consume_log` VALUES (25, 2, '20.00', NULL, '2020-08-19 16:57:19', 1);
INSERT INTO `user_integral_consume_log` VALUES (26, 2, '20.00', NULL, '2020-08-19 17:01:33', 1);
INSERT INTO `user_integral_consume_log` VALUES (27, 5, '20.00', NULL, '2020-08-26 10:12:14', 1);
INSERT INTO `user_integral_consume_log` VALUES (28, 5, '0.00', NULL, '2020-08-26 12:40:15', 1);
INSERT INTO `user_integral_consume_log` VALUES (29, 5, '0.00', NULL, '2020-08-26 12:41:56', 1);
INSERT INTO `user_integral_consume_log` VALUES (30, 11, '20.00', NULL, '2020-08-26 13:00:01', 1);
INSERT INTO `user_integral_consume_log` VALUES (31, 11, '20.00', NULL, '2020-08-26 13:05:54', 1);
INSERT INTO `user_integral_consume_log` VALUES (32, 11, '20.00', NULL, '2020-08-26 13:33:40', 1);
INSERT INTO `user_integral_consume_log` VALUES (33, 11, '20.00', NULL, '2020-08-27 09:42:13', 1);
INSERT INTO `user_integral_consume_log` VALUES (34, 11, '20.00', NULL, '2020-08-27 09:43:12', 1);
INSERT INTO `user_integral_consume_log` VALUES (35, 11, '0.00', NULL, '2020-08-27 10:08:16', 1);
INSERT INTO `user_integral_consume_log` VALUES (36, 11, '0.00', NULL, '2020-08-27 10:11:02', 1);

-- ----------------------------
-- Table structure for user_integral_frozen
-- ----------------------------
DROP TABLE IF EXISTS `user_integral_frozen`;
CREATE TABLE `user_integral_frozen`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_uid` int(11) NULL DEFAULT NULL COMMENT '来源用户id',
  `to_uid` int(11) NULL DEFAULT NULL COMMENT '转移用户id',
  `amount` int(10) NULL DEFAULT NULL COMMENT '积分数量',
  `euid` int(11) NULL DEFAULT NULL COMMENT '用户邀请记录id',
  `state` int(2) NULL DEFAULT 0 COMMENT '状态 0邀请 1接受邀请 2邀请过时',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '冻结积分表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_integral_frozen
-- ----------------------------
INSERT INTO `user_integral_frozen` VALUES (35, 11, 2, 0, 105, 1, NULL);
INSERT INTO `user_integral_frozen` VALUES (36, 11, 5, 20, 106, 1, NULL);
INSERT INTO `user_integral_frozen` VALUES (37, 11, 6, 20, 107, 1, NULL);
INSERT INTO `user_integral_frozen` VALUES (38, 11, 2, 0, 108, 1, NULL);
INSERT INTO `user_integral_frozen` VALUES (39, 11, 5, 20, 109, 0, NULL);
INSERT INTO `user_integral_frozen` VALUES (40, 11, 6, 20, 110, 0, NULL);
INSERT INTO `user_integral_frozen` VALUES (41, 11, 2, 0, 111, 0, NULL);
INSERT INTO `user_integral_frozen` VALUES (42, 11, 5, 20, 112, 0, NULL);
INSERT INTO `user_integral_frozen` VALUES (43, 11, 6, 20, 113, 0, NULL);

-- ----------------------------
-- Table structure for user_invitation_price
-- ----------------------------
DROP TABLE IF EXISTS `user_invitation_price`;
CREATE TABLE `user_invitation_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `price` int(11) NULL DEFAULT 0 COMMENT '邀请价格',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户邀请价格' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_invitation_price
-- ----------------------------
INSERT INTO `user_invitation_price` VALUES (1, 5, 20, NULL, NULL);
INSERT INTO `user_invitation_price` VALUES (2, 6, 20, NULL, NULL);
INSERT INTO `user_invitation_price` VALUES (3, 11, 10, NULL, NULL);

-- ----------------------------
-- Table structure for user_topic_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_topic_relation`;
CREATE TABLE `user_topic_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `tid` int(10) NULL DEFAULT NULL COMMENT '话题id',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_topic_relation
-- ----------------------------
INSERT INTO `user_topic_relation` VALUES (11, 2, 1, '2020-06-28 17:37:22');
INSERT INTO `user_topic_relation` VALUES (16, 2, 2, '2020-07-09 11:55:08');
INSERT INTO `user_topic_relation` VALUES (17, 2, 4, '2020-07-09 11:55:10');
INSERT INTO `user_topic_relation` VALUES (18, 2, 5, '2020-07-09 11:59:21');
INSERT INTO `user_topic_relation` VALUES (19, 2, 3, '2020-07-09 11:59:42');
INSERT INTO `user_topic_relation` VALUES (21, 2, 8, '2020-07-13 11:51:05');
INSERT INTO `user_topic_relation` VALUES (22, 2, 6, '2020-07-13 12:04:34');
INSERT INTO `user_topic_relation` VALUES (23, 2, 10, '2020-07-13 15:29:21');
INSERT INTO `user_topic_relation` VALUES (24, 5, 1, '2020-07-18 16:01:45');
INSERT INTO `user_topic_relation` VALUES (25, 5, 2, '2020-07-18 16:01:46');
INSERT INTO `user_topic_relation` VALUES (26, 5, 3, '2020-07-18 16:01:47');
INSERT INTO `user_topic_relation` VALUES (27, 5, 4, '2020-07-18 16:01:47');
INSERT INTO `user_topic_relation` VALUES (28, 5, 5, '2020-07-18 16:01:48');
INSERT INTO `user_topic_relation` VALUES (29, 5, 6, '2020-07-18 16:01:49');
INSERT INTO `user_topic_relation` VALUES (30, 5, 8, '2020-07-18 16:01:51');
INSERT INTO `user_topic_relation` VALUES (31, 5, 10, '2020-07-18 16:03:07');
INSERT INTO `user_topic_relation` VALUES (32, 5, 7, '2020-07-18 16:03:11');
INSERT INTO `user_topic_relation` VALUES (33, 5, 9, '2020-07-18 16:03:11');
INSERT INTO `user_topic_relation` VALUES (34, 5, 11, '2020-07-18 16:03:13');
INSERT INTO `user_topic_relation` VALUES (35, 5, 12, '2020-07-18 16:03:14');
INSERT INTO `user_topic_relation` VALUES (36, 5, 13, '2020-07-18 16:03:14');
INSERT INTO `user_topic_relation` VALUES (37, 5, 14, '2020-07-18 16:03:15');
INSERT INTO `user_topic_relation` VALUES (38, 5, 15, '2020-07-18 16:03:16');
INSERT INTO `user_topic_relation` VALUES (39, 14, 1, '2020-08-04 13:44:46');
INSERT INTO `user_topic_relation` VALUES (40, 14, 2, '2020-08-04 13:44:46');
INSERT INTO `user_topic_relation` VALUES (41, 14, 3, '2020-08-04 13:44:46');
INSERT INTO `user_topic_relation` VALUES (42, 15, 1, '2020-08-04 13:48:52');
INSERT INTO `user_topic_relation` VALUES (43, 15, 2, '2020-08-04 13:48:52');
INSERT INTO `user_topic_relation` VALUES (44, 15, 3, '2020-08-04 13:48:52');
INSERT INTO `user_topic_relation` VALUES (45, 17, 1, '2020-08-04 13:55:48');
INSERT INTO `user_topic_relation` VALUES (46, 17, 2, '2020-08-04 13:55:48');
INSERT INTO `user_topic_relation` VALUES (47, 17, 3, '2020-08-04 13:55:48');
INSERT INTO `user_topic_relation` VALUES (48, 18, 1, '2020-08-04 13:57:31');
INSERT INTO `user_topic_relation` VALUES (49, 18, 2, '2020-08-04 13:57:31');
INSERT INTO `user_topic_relation` VALUES (50, 18, 3, '2020-08-04 13:57:31');
INSERT INTO `user_topic_relation` VALUES (51, 22, 1, '2020-08-05 09:21:19');
INSERT INTO `user_topic_relation` VALUES (52, 22, 2, '2020-08-05 09:21:19');
INSERT INTO `user_topic_relation` VALUES (53, 22, 3, '2020-08-05 09:21:19');
INSERT INTO `user_topic_relation` VALUES (54, 26, 1, '2020-08-05 10:07:23');
INSERT INTO `user_topic_relation` VALUES (55, 26, 2, '2020-08-05 10:07:23');
INSERT INTO `user_topic_relation` VALUES (56, 26, 3, '2020-08-05 10:07:23');
INSERT INTO `user_topic_relation` VALUES (57, 28, 1, '2020-08-05 10:43:19');
INSERT INTO `user_topic_relation` VALUES (58, 28, 2, '2020-08-05 10:43:19');
INSERT INTO `user_topic_relation` VALUES (59, 28, 3, '2020-08-05 10:43:19');
INSERT INTO `user_topic_relation` VALUES (60, 29, 1, '2020-08-25 15:03:47');
INSERT INTO `user_topic_relation` VALUES (61, 29, 2, '2020-08-25 15:03:47');
INSERT INTO `user_topic_relation` VALUES (62, 29, 3, '2020-08-25 15:03:47');
INSERT INTO `user_topic_relation` VALUES (63, 30, 2, '2020-08-25 15:29:42');
INSERT INTO `user_topic_relation` VALUES (64, 30, 4, '2020-08-25 15:29:42');
INSERT INTO `user_topic_relation` VALUES (65, 30, 5, '2020-08-25 15:29:42');
INSERT INTO `user_topic_relation` VALUES (66, 31, 1, '2020-08-25 16:09:34');
INSERT INTO `user_topic_relation` VALUES (67, 31, 2, '2020-08-25 16:09:34');
INSERT INTO `user_topic_relation` VALUES (68, 31, 3, '2020-08-25 16:09:34');
INSERT INTO `user_topic_relation` VALUES (69, 32, 1, '2020-08-26 14:37:47');
INSERT INTO `user_topic_relation` VALUES (70, 32, 2, '2020-08-26 14:37:47');
INSERT INTO `user_topic_relation` VALUES (71, 32, 3, '2020-08-26 14:37:47');
INSERT INTO `user_topic_relation` VALUES (72, 33, 1, '2020-08-26 14:50:04');
INSERT INTO `user_topic_relation` VALUES (73, 33, 2, '2020-08-26 14:50:04');
INSERT INTO `user_topic_relation` VALUES (74, 33, 3, '2020-08-26 14:50:04');

-- ----------------------------
-- Table structure for user_update_record
-- ----------------------------
DROP TABLE IF EXISTS `user_update_record`;
CREATE TABLE `user_update_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `type` int(2) NULL DEFAULT NULL COMMENT '修改内容0姓名，1科室，2昵称，3简介',
  `state` int(2) NULL DEFAULT NULL COMMENT '审批状态 0审批中 1审批通过',
  `update_info` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改后的内容',
  `update_credential` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_update_record
-- ----------------------------
INSERT INTO `user_update_record` VALUES (1, 2, 3, 1, '4444444', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (2, 2, 3, 1, '4444444', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (3, 2, 3, 1, 'test', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (4, 2, 3, 1, '4444444', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (5, 2, 4, 1, 'https://picture.doctormeeting.com/myPicture/1595557663087.jpg', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (6, 2, 2, 1, '金毛狮王', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (7, 2, 0, 1, '孙悟空', 'https://picture.doctormeeting.com/myPicture/1595559722138.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (8, 2, 0, 1, '孙悟空2', 'https://picture.doctormeeting.com/myPicture/1595568647263.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (9, 2, 1, 1, '妇科2', 'https://picture.doctormeeting.com/myPicture/1595569796822.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (10, 2, 1, 1, '这是一个简介测试！', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (11, 2, 1, 1, '妇科', 'https://picture.doctormeeting.com/myPicture/1595570276726.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (12, 2, 1, 1, '呵呵', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (13, 2, 1, 1, '妇科', 'https://picture.doctormeeting.com/myPicture/1595570369131.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (14, 2, 3, 1, '这是一个简介！！！', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (15, 2, 3, 1, 'adadadadada', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (16, 2, 3, 1, '55555555', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (17, 2, 3, 1, '65+5+5+95+59+59+', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (18, 2, 3, 1, ';lkgsdhiugu89243jtksdpkgwae89utg9uwk,gselp]', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (19, 5, 3, 1, '这是我的简介', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (20, 5, 3, 1, '这是我的简介', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (21, 5, 3, 1, '这是我的简介', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (22, 5, 3, 1, '这是我的简介', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (23, 5, 3, 1, '这是我的简介', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (24, 5, 2, 1, 'Patrick阿斯顿', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (25, 5, 2, 1, 'Patrick', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (26, 5, 0, 1, '韩启东', 'https://picture.doctormeeting.com/myPicture/1595817046594.png', NULL, NULL);
INSERT INTO `user_update_record` VALUES (27, 5, 1, 1, 'XXXX', 'https://picture.doctormeeting.com/myPicture/1595817084356.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (28, 2, 1, 1, '妇科22', 'https://picture.doctormeeting.com/myPicture/1595830582427.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (29, 2, 2, 1, '金毛狮王2', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (30, 2, 3, 1, '这是我的简介！！！！', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (31, 5, 2, 1, 'Patrick', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (32, 11, 2, 1, '新', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (33, 11, 2, 1, '无目由', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (34, 11, 1, 1, '儿', 'https://picture.doctormeeting.com/myPicture/1596597320432.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (35, 11, 2, 1, '22', '', NULL, NULL);
INSERT INTO `user_update_record` VALUES (36, 11, 0, 1, '赵无极5', 'https://picture.doctormeeting.com/myPicture/1598425413518.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (37, 11, 0, 1, '赵无极', 'https://picture.doctormeeting.com/myPicture/1598425455752.jpg', NULL, NULL);
INSERT INTO `user_update_record` VALUES (38, 11, 1, 1, '妇产科', 'https://picture.doctormeeting.com/myPicture/1598425492370.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for work_experience
-- ----------------------------
DROP TABLE IF EXISTS `work_experience`;
CREATE TABLE `work_experience`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `hospital` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `work_start_time` datetime NULL DEFAULT NULL COMMENT '工作开始时间',
  `work_end_time` datetime NULL DEFAULT NULL COMMENT '工作结束时间',
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作经历' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work_experience
-- ----------------------------
INSERT INTO `work_experience` VALUES (2, 2, '会惠康医院123', '牙科2', '急急急', '2002-07-21 03:23:58', '2004-07-21 03:23:58', NULL);
INSERT INTO `work_experience` VALUES (3, 5, 'A医院', 'A科', '主任医师', '2000-07-21 03:23:58', '2001-07-21 03:23:58', NULL);
INSERT INTO `work_experience` VALUES (4, 5, 'B医院', 'C科', '副主任医师', '2000-07-21 03:23:58', '2001-07-21 03:23:58', NULL);

-- ----------------------------
-- Table structure for wx_user_info
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_info`;
CREATE TABLE `wx_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `head_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `anonymous` tinyint(1) NULL DEFAULT NULL COMMENT '匿名的\n\n',
  `create_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  `type` int(2) NULL DEFAULT NULL COMMENT '类型 0未注册, 1普通用户  2医生',
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wx_user_info
-- ----------------------------
INSERT INTO `wx_user_info` VALUES (2, '17767183556', 'oZRwa42QbwV5AkVLL-HPjESG9V4A', NULL, '孙悟空22', 'https://picture.doctormeeting.com/myPicture/1595557663087.jpg', '金毛狮王22', 0, '2020-06-28 16:00:55', NULL, 2, '$2a$10$nSUa0Q/3AAuK.zmZJq1Lpee5e.rZ31nPV7oEsJ1Beo7JeeLhkKXbK');
INSERT INTO `wx_user_info` VALUES (3, NULL, NULL, NULL, '杨晓', 'https://picture.doctormeeting.com/myPicture/1595557663087.jpg', '杨晓', 0, NULL, NULL, 2, NULL);
INSERT INTO `wx_user_info` VALUES (4, '13695959595', NULL, NULL, '白眉鹰王1', 'https://picture.doctormeeting.com/myPicture/1595557663087.jpg', '白眉鹰王你', 1, NULL, NULL, 2, NULL);
INSERT INTO `wx_user_info` VALUES (5, '19967346432', 'oZRwa42Y47MIEd-V2CQbrvJAgpC4', NULL, '韩启东', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqY1rz417LMs7I4GoFUaBkon0ZTDayjvCmIvCt0xZxib4um6DEibXwiaLfDu0Od3ibNKaCgNJicPpxEksw/132', 'Patrick', 1, '2020-07-18 15:45:43', '2020-07-18 15:45:58', 2, NULL);
INSERT INTO `wx_user_info` VALUES (6, '18734902241', 'oZRwa42k96jhCK5IBVby3eSu1XoM', NULL, '555', 'https://wx.qlogo.cn/mmopen/vi_32/Uk4XYbuyyl8RKXDRUPoz2rYuBVpefySbhEGpKcH9l3Z95IxTqCdJE6ibSTv3Ph7nFLWiaqpaYgLCwZ15Zvk3UReQ/132', '可爱的大白兔', 1, '2020-07-18 16:28:48', '2020-07-18 16:28:57', 2, NULL);
INSERT INTO `wx_user_info` VALUES (11, '13575906295', 'oZRwa4_qFp5j1GiUI4A7JLaPDCOk', NULL, '赵无极', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLJDPH4o5MZibqBZribmk907TWFHK4icia0wLib1xFNuSLggv4ic6QpwPN4R9DHyooxx879fJXTQ9R2SGaA/132', '225', 1, '2020-08-04 10:57:03', '2020-08-04 10:57:51', 2, NULL);
INSERT INTO `wx_user_info` VALUES (28, '18899999964', 'oZRwa4zvu3g9OloPvd_kGk1N0RVI', NULL, '真实姓名11124', 'https://wx.qlogo.cn/mmopen/vi_32/jzMQVDDkt6urrGZyTzz2bOSiavL3z6CX9ib6CicNQkTaVvIE3MchOG5OuIstvKuIj29aEyd6SBejy7eDgWIzibFyAg/132', '我的昵称4', 1, '2020-08-05 10:43:13', '2020-08-25 14:32:27', 1, NULL);
INSERT INTO `wx_user_info` VALUES (29, '13296739418', 'oZRwa44dDPm1xxWC4II0qZp5LuaQ', NULL, '默默', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLPhcP48hbRdAb24bqVqsDAI3TOYyQlHxRDv8icQvN2cfzoMZUzQ3dpYz7ES3ZMvnabib9Wp3Z2vAaQ/132', 'ζ方鍀始蔠う', 1, '2020-08-25 15:03:37', '2020-08-25 15:08:30', 2, NULL);
INSERT INTO `wx_user_info` VALUES (30, '18077101015', 'oZRwa4wDIp1Lz5IrfQI-kC8u1LwU', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/miaJkQmc7LXWgVXCSj3dpnK7oG6rSuR41Ov0rvkrjtSReQskic5hbT4fMS5hSsEf8zhqazNVGlr2tflJLQAJZiaLg/132', '🌼 Alyson🌸', 1, '2020-08-25 15:29:18', NULL, 1, NULL);
INSERT INTO `wx_user_info` VALUES (32, '15381197260', 'oZRwa44SnaNyKqvOYkbU7p1KHruo', NULL, '555', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Yuicea8W6y9kQPBzgpd5pfkSYyp3WVESbeHXJEJ7Qw4X9KbjPVf0EiaGOctHF6N6gPgws3V8eLEqPwBlhnTiczNpA/132', '😍😎小公鸡翅膀，😙😁😂', 1, '2020-08-26 14:37:34', '2020-08-26 15:07:50', 2, NULL);
INSERT INTO `wx_user_info` VALUES (33, '18069256961', 'oZRwa43ZenSDHeRLWMG1pWwD3558', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/IWOnxcOM4TNISpQZQBrbflgEXd9gx3JwcQNKziajKHibfAGyYe1JYnA5a3b2feNicMo6yN6g4fMkeiaETEVZDuchfA/132', '🙈！妖怪哪里跑4😋🎶', 1, '2020-08-26 14:49:54', NULL, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
