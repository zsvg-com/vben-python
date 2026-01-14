/*
 Navicat Premium Dump SQL

 Source Server         : lo_mysql8
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : vben-python2

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 14/01/2026 14:34:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apscheduler_jobs
-- ----------------------------
DROP TABLE IF EXISTS `apscheduler_jobs`;
CREATE TABLE `apscheduler_jobs`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `next_run_time` double NULL DEFAULT NULL,
  `job_state` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_apscheduler_jobs_next_run_time`(`next_run_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apscheduler_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_cate
-- ----------------------------
DROP TABLE IF EXISTS `demo_link_cate`;
CREATE TABLE `demo_link_cate`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pid` bigint NULL DEFAULT NULL COMMENT '父ID',
  `tier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级信息',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关联分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_link_cate
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_item
-- ----------------------------
DROP TABLE IF EXISTS `demo_link_item`;
CREATE TABLE `demo_link_item`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `maiid` bigint NULL DEFAULT NULL COMMENT '主表ID',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关联子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_link_item
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_main
-- ----------------------------
DROP TABLE IF EXISTS `demo_link_main`;
CREATE TABLE `demo_link_main`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `catid` bigint NULL DEFAULT NULL COMMENT '分类ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关联主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_link_main
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_main_org
-- ----------------------------
DROP TABLE IF EXISTS `demo_link_main_org`;
CREATE TABLE `demo_link_main_org`  (
  `mid` bigint NULL DEFAULT NULL COMMENT '主表ID',
  `oid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织架构ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '中间关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_link_main_org
-- ----------------------------

-- ----------------------------
-- Table structure for demo_single_cate
-- ----------------------------
DROP TABLE IF EXISTS `demo_single_cate`;
CREATE TABLE `demo_single_cate`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pid` bigint NULL DEFAULT NULL COMMENT '父ID',
  `tier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级信息',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单一树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_single_cate
-- ----------------------------

-- ----------------------------
-- Table structure for demo_single_main
-- ----------------------------
DROP TABLE IF EXISTS `demo_single_main`;
CREATE TABLE `demo_single_main`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单一主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_single_main
-- ----------------------------

-- ----------------------------
-- Table structure for mon_job_log
-- ----------------------------
DROP TABLE IF EXISTS `mon_job_log`;
CREATE TABLE `mon_job_log`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息',
  `ret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果',
  `sttim` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `entim` datetime NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for mon_job_main
-- ----------------------------
DROP TABLE IF EXISTS `mon_job_main`;
CREATE TABLE `mon_job_main`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务代码',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `reurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求url',
  `retyp` int NULL DEFAULT NULL COMMENT '请求类型',
  `rehea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Headers',
  `repar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Cron表达式',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_job_main
-- ----------------------------
INSERT INTO `mon_job_main` VALUES ('799163435639115781', 'myjob', 0, 'Vben.Base.Mon.Job.Main.MyJob', 0, NULL, NULL, '[\"*/30 * * * * *\",2]', '30秒钟执行一次的DEMO1', '2026-01-14 14:30:11', NULL, NULL, NULL, 0, NULL);
INSERT INTO `mon_job_main` VALUES ('799163435672670213', 'myjob2', 0, 'Vben.Base.Mon.Job.Main.MyJob2', 0, NULL, NULL, '[\"@minutely\",0]', '1分钟执行一次的DEMO2', '2026-01-14 14:30:11', NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for mon_log_audit
-- ----------------------------
DROP TABLE IF EXISTS `mon_log_audit`;
CREATE TABLE `mon_log_audit`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `TableName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `ColumnName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名',
  `NewValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新值',
  `OldValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '旧值',
  `CreatedTime` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `UserId` bigint NULL DEFAULT NULL COMMENT '操作人Id',
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `Operate` int NULL DEFAULT NULL COMMENT '操作方式：新增、更新、删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作/审计日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_log_audit
-- ----------------------------

-- ----------------------------
-- Table structure for mon_log_error
-- ----------------------------
DROP TABLE IF EXISTS `mon_log_error`;
CREATE TABLE `mon_log_error`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `useid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `usena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `clazz` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `ExceptionName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常名称',
  `ExceptionMsg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `ExceptionSource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常源',
  `error` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '堆栈信息',
  `param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数对象',
  `crtim` datetime NULL DEFAULT NULL COMMENT '异常时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '错误日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_log_error
-- ----------------------------

-- ----------------------------
-- Table structure for mon_login_log
-- ----------------------------
DROP TABLE IF EXISTS `mon_login_log`;
CREATE TABLE `mon_login_log`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `loip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP地址',
  `loloc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `clkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端',
  `detyp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `sutag` tinyint(1) NULL DEFAULT NULL COMMENT '登录状态',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `agdet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端详情',
  `lotim` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for mon_online_user
-- ----------------------------
DROP TABLE IF EXISTS `mon_online_user`;
CREATE TABLE `mon_online_user`  (
  `id` bigint NOT NULL COMMENT '主键Id',
  `tenid` bigint NOT NULL COMMENT '租户Id',
  `conid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '连接Id',
  `useid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户Id',
  `usena` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `nicna` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实姓名',
  `cotim` datetime NOT NULL COMMENT '连接时间',
  `ip` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '连接IP',
  `browser` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '浏览器',
  `os` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_online_user
-- ----------------------------

-- ----------------------------
-- Table structure for mon_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `mon_oper_log`;
CREATE TABLE `mon_oper_log`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `opmod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `butyp` int NULL DEFAULT NULL COMMENT '业务类型',
  `opuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `opuna` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `clazz` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名',
  `remet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `repar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数对象',
  `optim` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cotim` bigint NULL DEFAULT NULL COMMENT '耗时（毫秒）',
  `opip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP地址',
  `ageos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `agbro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `agdet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端详情',
  `sutag` tinyint(1) NULL DEFAULT NULL COMMENT '成功标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `menid` bigint NULL DEFAULT NULL COMMENT '菜单ID',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `perm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限字符',
  `code` bigint NULL DEFAULT NULL COMMENT '权限代码',
  `pos` int NULL DEFAULT NULL COMMENT '权限位',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限类型',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_api
-- ----------------------------
INSERT INTO `sys_api` VALUES (101001, '部门查询', 1010, 101001, 'sys:dept:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (101002, '部门编辑', 1010, 101002, 'sys:dept:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (101003, '部门删除', 1010, 101003, 'sys:dept:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (102001, '用户查询', 1020, 102001, 'sys:user:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (102002, '用户编辑', 1020, 102002, 'sys:user:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (102003, '用户删除', 1020, 102003, 'sys:user:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (102004, '用户启用禁用', 1020, 102004, 'sys:user:avtag', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (102005, '用户密码修改', 1020, 102005, 'sys:user:password', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (103001, '岗位查询', 1030, 103001, 'sys:post:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (103002, '岗位编辑', 1030, 103002, 'sys:post:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (103003, '岗位删除', 1030, 103003, 'sys:post:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (104001, '群组查询', 1040, 104001, 'sys:group:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (104002, '群组编辑', 1040, 104002, 'sys:group:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (104003, '群组删除', 1040, 104003, 'sys:group:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (104004, '群组分类查询', 1040, 104004, 'sys:groupc:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (104005, '群组分类编辑', 1040, 104005, 'sys:groupc:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (104006, '群组分类删除', 1040, 104006, 'sys:groupc:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (105001, '菜单查询', 1050, 105001, 'sys:menu:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (105002, '菜单编辑', 1050, 105002, 'sys:menu:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (105003, '菜单删除', 1050, 105003, 'sys:menu:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (106001, '接口查询', 1060, 106001, 'sys:api:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (106002, '接口编辑', 1060, 106002, 'sys:api:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (106003, '接口删除', 1060, 106003, 'sys:api:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (107001, '角色查询', 1070, 107001, 'sys:role:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (107002, '角色编辑', 1070, 107002, 'sys:role:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (107003, '角色删除', 1070, 107003, 'sys:role:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (108001, '参数查询', 1080, 108001, 'sys:config:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (108002, '参数编辑', 1080, 108002, 'sys:config:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (108003, '参数删除', 1080, 108003, 'sys:config:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (109001, '通知查询', 1090, 109001, 'sys:notice:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (109002, '通知编辑', 1090, 109002, 'sys:notice:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (109003, '通知删除', 1090, 109003, 'sys:notice:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (201001, '在线用户查询', 2010, 201001, 'mon:online:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (201002, '在线用户强退', 2010, 201002, 'mon:online:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (202001, '登录日志查询', 2020, 202001, 'mon:login:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (202002, '登录日志删除', 2020, 202002, 'mon:login:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (203001, '操作日志查询', 2030, 203001, 'mon:oper:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (203002, '操作日志删除', 2030, 203002, 'mon:oper:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (204001, '服务器信息查询', 2040, 204001, 'mon:server:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (205001, '缓存信息查询', 2050, 205001, 'mon:cache:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (206001, '定时任务查询', 2060, 206001, 'monjob:main:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (206002, '定时任务修改', 2060, 206002, 'monjob:main:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (206003, '定时任务执行', 2060, 206003, 'monjob:main:run', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (206101, '定时任务日志查询', 2061, 206101, 'monjob:log:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (206102, '定时任务日志删除', 2061, 206102, 'monjob:log:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (301001, '字典查询', 3010, 301001, 'tooldict:main:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (301002, '字典修改', 3010, 301002, 'tooldict:main:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (301003, '字典删除', 3010, 301003, 'tooldict:main:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (301004, '字典数据查询', 3010, 301004, 'tooldict:data:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (301005, '字典数据编辑', 3010, 301005, 'tooldict:data:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (301006, '字典数据编辑', 3010, 301006, 'tooldict:data:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (302001, '编号查询', 3020, 302001, 'tool:num:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (302002, '编号编辑', 3020, 302002, 'tool:num:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (302003, '编号删除', 3020, 302003, 'tool:num:delete', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (603001, '流程查询', 6030, 603001, 'bpmbus:main:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (603002, '流程新增', 6030, 603002, 'bpmbus:main:add', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (603003, '流程编辑', 6030, 603003, 'bpmbus:main:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (801001, '单一主表-查询', 8010, 801001, 'single:main:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (801002, '单一主表-新增', 8010, 801002, 'single:main:add', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (801003, '单一主表-修改', 8010, 801003, 'single:main:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (801004, '单一主表-删除', 8010, 801004, 'single:main:remove', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (802001, '单一树表-查询', 8020, 802001, 'single:cate:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (802002, '单一树表-新增', 8020, 802002, 'single:cate:add', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (802003, '单一树表-修改', 8020, 802003, 'single:cate:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (802004, '单一树表-删除', 8020, 802004, 'single:cate:remove', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803001, '关联主表-查询', 8030, 803001, 'link:main:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803002, '关联主表-新增', 8030, 803002, 'link:main:add', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803003, '关联主表-修改', 8030, 803003, 'link:main:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803004, '关联主表-删除', 8030, 803004, 'link:main:remove', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803011, '关联树表-查询', 8030, 803011, 'link:cate:query', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803012, '关联树表-新增', 8030, 803012, 'link:cate:add', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803013, '关联树表-修改', 8030, 803013, 'link:cate:edit', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');
INSERT INTO `sys_api` VALUES (803014, '关联树表-删除', 8030, 803014, 'link:cate:remove', 0, 0, NULL, 1, NULL, '2026-01-14 14:30:11', '2026-01-14 14:30:11');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `kenam` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `keval` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键值',
  `intag` tinyint(1) NULL DEFAULT NULL COMMENT '内置标记',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (2011325525515177984, '11', '11', '11', 0, '11', '2026-01-14 14:30:39', '2026-01-14 14:30:39', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config2
-- ----------------------------
DROP TABLE IF EXISTS `sys_config2`;
CREATE TABLE `sys_config2`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config2
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `tier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `type` int NULL DEFAULT NULL COMMENT '部门类型',
  `ex1` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段1',
  `ex2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段2',
  `ex3` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段3',
  `ex4` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段4',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构-部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('d1000', NULL, '_d1000_', NULL, 1000, 1, NULL, NULL, NULL, NULL, 'XX科技', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1100', 'd1000', '_d1000_d1100_', NULL, 1100, 2, NULL, NULL, NULL, NULL, '北京分公司', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1110', 'd1100', '_d1000_d1100_d1110_', NULL, 1110, 8, NULL, NULL, NULL, NULL, '北京分公司销售部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1111', 'd1110', '_d1000_d1100_d1110_d1111_', NULL, 1111, 8, NULL, NULL, NULL, NULL, '北京分公司销售部一组', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1112', 'd1110', '_d1000_d1100_d1110_d1112_', NULL, 1112, 8, NULL, NULL, NULL, NULL, '北京分公司销售部二组', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1120', 'd1100', '_d1000_d1100_d1120_', NULL, 1120, 8, NULL, NULL, NULL, NULL, '北京分公司人事部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1130', 'd1100', '_d1000_d1100_d1130_', NULL, 1130, 8, NULL, NULL, NULL, NULL, '北京分公司财务部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1140', 'd1100', '_d1000_d1100_d1140_', NULL, 1140, 8, NULL, NULL, NULL, NULL, '北京分公司综合部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1200', 'd1000', '_d1000_d1200_', NULL, 1200, 2, NULL, NULL, NULL, NULL, '上海分公司', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1210', 'd1200', '_d1000_d1200_d1210_', NULL, 1210, 8, NULL, NULL, NULL, NULL, '上海分公司销售部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1220', 'd1200', '_d1000_d1200_d1220_', NULL, 1220, 8, NULL, NULL, NULL, NULL, '上海分公司人事部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1230', 'd1200', '_d1000_d1200_d1230_', NULL, 1230, 8, NULL, NULL, NULL, NULL, '上海分公司财务部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1300', 'd1000', '_d1000_d1300_', NULL, 1300, 2, NULL, NULL, NULL, NULL, '广州分公司', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1310', 'd1300', '_d1000_d1300_d1310_', NULL, 1310, 8, NULL, NULL, NULL, NULL, '广州分公司综合部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1320', 'd1300', '_d1000_d1300_d1320_', NULL, 1320, 8, NULL, NULL, NULL, NULL, '广州分公司销售部', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_dept` VALUES ('d1330', 'd1300', '_d1000_d1300_d1330_', NULL, 1330, 8, NULL, NULL, NULL, NULL, '广州分公司人事部', NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `catid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构-群组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_group
-- ----------------------------
INSERT INTO `sys_group` VALUES ('g3001', 3001, NULL, NULL, '北京分公司管理组', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_group` VALUES ('g3002', 3002, NULL, NULL, '北京分公司销售员', NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_group_cate
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_cate`;
CREATE TABLE `sys_group_cate`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `crmid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upmid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `tier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构群组分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_group_cate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_org`;
CREATE TABLE `sys_group_org`  (
  `gid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群组ID',
  `oid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构群组成员关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_group_org
-- ----------------------------
INSERT INTO `sys_group_org` VALUES ('g3001', 'u4');
INSERT INTO `sys_group_org` VALUES ('g3001', 'u5');
INSERT INTO `sys_group_org` VALUES ('g3001', 'p2004');
INSERT INTO `sys_group_org` VALUES ('g3001', 'd1140');
INSERT INTO `sys_group_org` VALUES ('g3002', 'u8');
INSERT INTO `sys_group_org` VALUES ('g3002', 'u9');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '\'\'' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '任务组名',
  `job_executor` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '任务执行器',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '位置参数',
  `job_kwargs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '关键字参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `job_executor` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务执行器',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '位置参数',
  `job_kwargs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '关键字参数',
  `job_trigger` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '任务触发器',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'\'' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pid` bigint NULL DEFAULT NULL COMMENT '父ID',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型 C目录，M菜单',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `param` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `comp` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `shtag` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示',
  `catag` tinyint(1) NULL DEFAULT NULL COMMENT '缓存标记',
  `outag` tinyint(1) NULL DEFAULT NULL COMMENT '是否为外链',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1000, '系统管理', 0, 1, 1000, '1', NULL, 'tdesign:system-setting', 'sys', NULL, 'Layout', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1010, '部门管理', 1000, 1, 1010, '2', NULL, 'mingcute:department-line', 'dept', NULL, 'sys/dept/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1020, '用户管理', 1000, 1, 1020, '2', NULL, 'ant-design:user-outlined', 'user', NULL, 'sys/user/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1021, '用户编辑', 1000, 1, 1021, '2', NULL, 'mingcute:user-edit-line', 'user/edit', NULL, 'sys/user/tedit', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1030, '岗位管理', 1000, 1, 1030, '2', NULL, 'icon-park-outline:appointment', 'post', NULL, 'sys/post/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1040, '群组管理', 1000, 1, 1040, '2', NULL, 'material-symbols:group-outline-rounded', 'group', NULL, 'sys/group/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1050, '菜单管理', 1000, 1, 1050, '2', NULL, 'ri:menu-fold-2-fill', 'menu', NULL, 'sys/menu/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1060, '接口管理', 1000, 1, 1060, '2', NULL, 'ant-design:api-outlined', 'api', NULL, 'sys/api/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1070, '角色管理', 1000, 1, 1070, '2', NULL, 'eos-icons:role-binding-outlined', 'role', NULL, 'sys/role/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1071, '角色编辑', 1000, 1, 1071, '2', NULL, 'oui:app-users-roles', 'role/edit', NULL, 'sys/role/edit', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1080, '参数设置', 1000, 1, 1080, '2', NULL, 'ant-design:setting-outlined', 'config', NULL, 'sys/config/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1090, '通知公告', 1000, 1, 1090, '2', NULL, 'fe:notice-push', 'notice', NULL, 'sys/notice/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2000, '监控中心', 0, 1, 2000, '1', NULL, 'eos-icons:monitoring', 'mon', NULL, 'Layout', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2010, '在线用户', 2000, 1, 2010, '2', NULL, 'oui:online', 'online/user', NULL, 'mon/online/user/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2020, '登录日志', 2000, 1, 2020, '2', NULL, 'uiw:login', 'login/log', NULL, 'mon/login/log/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2030, '操作日志', 2000, 1, 2030, '2', NULL, 'icon-park-outline:reverse-operation-in', 'oper/log', NULL, 'mon/oper/log/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2040, '服务监控', 2000, 1, 2040, '2', NULL, 'mdi:server-outline', 'server', NULL, 'mon/server/net', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2050, '缓存监控', 2000, 1, 2050, '2', NULL, 'octicon:cache-24', 'cache', NULL, 'mon/cache/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2060, '定时任务', 2000, 1, 2060, '2', NULL, 'streamline:task-list', 'job/main', NULL, 'mon/job/main/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2061, '任务日志', 2000, 1, 2061, '2', NULL, 'ix:log', 'job/log', NULL, 'mon/job/log/index', 0, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3000, '辅助工具', 0, 1, 3000, '1', NULL, 'ant-design:tool-outlined', 'tool', NULL, 'Layout', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3010, '字典工具', 3000, 1, 3010, '2', NULL, 'fluent-mdl2:dictionary', 'dict', NULL, 'tool/dict/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3020, '编号工具', 3000, 1, 3020, '2', NULL, 'streamline-sharp:steps-number', 'num', NULL, 'tool/num/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3030, '文件工具', 3000, 1, 3030, '2', NULL, 'mdi:file-outline', 'oss', NULL, 'tool/oss/main/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3040, '在线表单', 3000, 1, 3040, '2', NULL, 'fluent:form-20-regular', 'form', NULL, 'tool/form/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3041, '在线表单', 3000, 1, 3041, '2', NULL, 'fluent:form-20-regular', 'form/edit', NULL, 'tool/form/edit', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3050, '代码生成', 3000, 1, 3050, '2', NULL, 'humbleicons:code', 'code', NULL, 'tool/code/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3051, '代码生成', 3000, 1, 3051, '2', NULL, 'humbleicons:code', 'code/edit', NULL, 'tool/code/edit', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6000, '流程管理', 0, 1, 6000, '1', NULL, 'streamline-sharp:text-flow-rows', 'bpm', NULL, 'Layout', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6010, '流程分类', 6000, 1, 6010, '2', NULL, 'tabler:category-plus', 'bus/cate', NULL, 'bpm/bus/cate/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6020, '流程模板', 6000, 1, 6020, '2', NULL, 'carbon:prompt-template', 'bus/tmpl', NULL, 'bpm/bus/tmpl/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6021, '流程模板编辑', 6000, 1, 6021, '2', NULL, 'carbon:prompt-template', 'bus/tmpl/edit', NULL, 'bpm/bus/tmpl/edit', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6030, '流程清单', 6000, 1, 6030, '2', NULL, 'ri:instance-line', 'bus/main', NULL, 'bpm/bus/main/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6031, '流程编辑', 6000, 1, 6031, '2', NULL, 'ri:instance-line', 'bus/main/edit', NULL, 'bpm/bus/main/edit', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6032, '流程查看', 6000, 1, 6032, '2', NULL, 'ri:instance-line', 'bus/main/view', NULL, 'bpm/bus/main/view', 0, 1, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6040, '流程待办', 6000, 1, 6040, '2', NULL, 'ri:todo-line', 'todo', NULL, 'bpm/todo/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6050, '流程组织', 6000, 1, 6050, '2', NULL, 'mdi:workflow-outline', 'org/tree', NULL, 'bpm/org/tree/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6051, '流程组织节点', 6000, 1, 6051, '2', NULL, 'mdi:workflow-outline', 'org/node', NULL, 'bpm/org/node/index', 0, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (8000, '使用案例', 0, 1, 8000, '1', NULL, 'hugeicons:star', 'demo', NULL, 'Layout', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (8010, '单一主表案例', 8000, 1, 8010, '2', NULL, 'pajamas:work-item-requirement', 'single/main', NULL, 'demo/single/main/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (8020, '单一树表案例', 8000, 1, 8020, '2', NULL, 'pajamas:work-item-requirement', 'single/cate', NULL, 'demo/single/cate/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES (8030, '关联主分子案例', 8000, 1, 8030, '2', NULL, 'pajamas:work-item-requirement', 'link', NULL, 'demo/link/index', 1, 0, 0, '2026-01-14 14:30:11', '2026-01-14 14:30:11', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `cont` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `type` int NULL DEFAULT NULL COMMENT '公告类型（1通知 2公告）',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` int NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构综合元素' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('d1000', 'XX科技', 1);
INSERT INTO `sys_org` VALUES ('d1100', '北京分公司', 1);
INSERT INTO `sys_org` VALUES ('d1110', '北京分公司销售部', 1);
INSERT INTO `sys_org` VALUES ('d1111', '北京分公司销售部一组', 1);
INSERT INTO `sys_org` VALUES ('d1112', '北京分公司销售部二组', 1);
INSERT INTO `sys_org` VALUES ('d1120', '北京分公司人事部', 1);
INSERT INTO `sys_org` VALUES ('d1130', '北京分公司财务部', 1);
INSERT INTO `sys_org` VALUES ('d1140', '北京分公司综合部', 1);
INSERT INTO `sys_org` VALUES ('d1200', '上海分公司', 1);
INSERT INTO `sys_org` VALUES ('d1210', '上海分公司销售部', 1);
INSERT INTO `sys_org` VALUES ('d1220', '上海分公司人事部', 1);
INSERT INTO `sys_org` VALUES ('d1230', '上海分公司财务部', 1);
INSERT INTO `sys_org` VALUES ('d1300', '广州分公司', 1);
INSERT INTO `sys_org` VALUES ('d1310', '广州分公司综合部', 1);
INSERT INTO `sys_org` VALUES ('d1320', '广州分公司销售部', 1);
INSERT INTO `sys_org` VALUES ('d1330', '广州分公司人事部', 1);
INSERT INTO `sys_org` VALUES ('g3001', '北京分公司管理组', 8);
INSERT INTO `sys_org` VALUES ('g3002', '北京分公司销售员', 8);
INSERT INTO `sys_org` VALUES ('p2001', '董事长', 4);
INSERT INTO `sys_org` VALUES ('p2002', '北京分公司总经理', 4);
INSERT INTO `sys_org` VALUES ('p2003', '北京分公司销售部长', 4);
INSERT INTO `sys_org` VALUES ('p2004', '北京分公司销售经理', 4);
INSERT INTO `sys_org` VALUES ('u1', '管理员', 2);
INSERT INTO `sys_org` VALUES ('u2', '小狐狸', 2);
INSERT INTO `sys_org` VALUES ('u3', '张三', 2);
INSERT INTO `sys_org` VALUES ('u4', '李四', 2);
INSERT INTO `sys_org` VALUES ('u5', '王五', 2);
INSERT INTO `sys_org` VALUES ('u6', '赵六', 2);
INSERT INTO `sys_org` VALUES ('u7', '孙七', 2);
INSERT INTO `sys_org` VALUES ('u8', '周八', 2);
INSERT INTO `sys_org` VALUES ('u9', '吴九', 2);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `depid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `tier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构-岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('p2001', 'd1000', NULL, 2001, '_d1000_p2001_', '董事长', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_post` VALUES ('p2002', 'd1100', NULL, 2002, '_d1000_d1100_p2002_', '北京分公司总经理', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_post` VALUES ('p2003', 'd1110', NULL, 2003, '_d1000_d1100_d1110_p2003_', '北京分公司销售部长', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_post` VALUES ('p2004', 'd1111', NULL, 2004, '_d1000_d1100_d1110_d1111_p2004_', '北京分公司销售经理', NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_post_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_post_org`;
CREATE TABLE `sys_post_org`  (
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位ID',
  `oid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位员工关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post_org
-- ----------------------------
INSERT INTO `sys_post_org` VALUES ('p2001', 'u3');
INSERT INTO `sys_post_org` VALUES ('p2002', 'u4');
INSERT INTO `sys_post_org` VALUES ('p2003', 'u5');
INSERT INTO `sys_post_org` VALUES ('p2004', 'u6');
INSERT INTO `sys_post_org` VALUES ('p2004', 'u7');

-- ----------------------------
-- Table structure for sys_rece
-- ----------------------------
DROP TABLE IF EXISTS `sys_rece`;
CREATE TABLE `sys_rece`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `useid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `oid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织架构ID',
  `uptim` datetime NULL DEFAULT NULL COMMENT '最近使用时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构-最近访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rece
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `type` int NULL DEFAULT NULL COMMENT '角色类型',
  `scope` int NULL DEFAULT NULL COMMENT '数据权限',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '拥有所有权限', 1, 1, 0, 0, '2026-01-14 14:30:11', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_api`;
CREATE TABLE `sys_role_api`  (
  `rid` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `aid` bigint NULL DEFAULT NULL COMMENT '接口ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限角色与接口关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_api
-- ----------------------------
INSERT INTO `sys_role_api` VALUES (1, 101001);
INSERT INTO `sys_role_api` VALUES (1, 101002);
INSERT INTO `sys_role_api` VALUES (1, 101003);
INSERT INTO `sys_role_api` VALUES (1, 102001);
INSERT INTO `sys_role_api` VALUES (1, 102002);
INSERT INTO `sys_role_api` VALUES (1, 102003);
INSERT INTO `sys_role_api` VALUES (1, 102004);
INSERT INTO `sys_role_api` VALUES (1, 102005);
INSERT INTO `sys_role_api` VALUES (1, 103001);
INSERT INTO `sys_role_api` VALUES (1, 103002);
INSERT INTO `sys_role_api` VALUES (1, 103003);
INSERT INTO `sys_role_api` VALUES (1, 104001);
INSERT INTO `sys_role_api` VALUES (1, 104002);
INSERT INTO `sys_role_api` VALUES (1, 104003);
INSERT INTO `sys_role_api` VALUES (1, 104004);
INSERT INTO `sys_role_api` VALUES (1, 104005);
INSERT INTO `sys_role_api` VALUES (1, 104006);
INSERT INTO `sys_role_api` VALUES (1, 105001);
INSERT INTO `sys_role_api` VALUES (1, 105002);
INSERT INTO `sys_role_api` VALUES (1, 105003);
INSERT INTO `sys_role_api` VALUES (1, 106001);
INSERT INTO `sys_role_api` VALUES (1, 106002);
INSERT INTO `sys_role_api` VALUES (1, 106003);
INSERT INTO `sys_role_api` VALUES (1, 107001);
INSERT INTO `sys_role_api` VALUES (1, 107002);
INSERT INTO `sys_role_api` VALUES (1, 107003);
INSERT INTO `sys_role_api` VALUES (1, 108001);
INSERT INTO `sys_role_api` VALUES (1, 108002);
INSERT INTO `sys_role_api` VALUES (1, 108003);
INSERT INTO `sys_role_api` VALUES (1, 109001);
INSERT INTO `sys_role_api` VALUES (1, 109002);
INSERT INTO `sys_role_api` VALUES (1, 109003);
INSERT INTO `sys_role_api` VALUES (1, 201001);
INSERT INTO `sys_role_api` VALUES (1, 201002);
INSERT INTO `sys_role_api` VALUES (1, 202001);
INSERT INTO `sys_role_api` VALUES (1, 202002);
INSERT INTO `sys_role_api` VALUES (1, 203001);
INSERT INTO `sys_role_api` VALUES (1, 203002);
INSERT INTO `sys_role_api` VALUES (1, 204001);
INSERT INTO `sys_role_api` VALUES (1, 205001);
INSERT INTO `sys_role_api` VALUES (1, 206001);
INSERT INTO `sys_role_api` VALUES (1, 206002);
INSERT INTO `sys_role_api` VALUES (1, 206003);
INSERT INTO `sys_role_api` VALUES (1, 206101);
INSERT INTO `sys_role_api` VALUES (1, 206102);
INSERT INTO `sys_role_api` VALUES (1, 301001);
INSERT INTO `sys_role_api` VALUES (1, 301002);
INSERT INTO `sys_role_api` VALUES (1, 301003);
INSERT INTO `sys_role_api` VALUES (1, 301004);
INSERT INTO `sys_role_api` VALUES (1, 301005);
INSERT INTO `sys_role_api` VALUES (1, 301006);
INSERT INTO `sys_role_api` VALUES (1, 302001);
INSERT INTO `sys_role_api` VALUES (1, 302002);
INSERT INTO `sys_role_api` VALUES (1, 302003);
INSERT INTO `sys_role_api` VALUES (1, 603001);
INSERT INTO `sys_role_api` VALUES (1, 603002);
INSERT INTO `sys_role_api` VALUES (1, 603003);
INSERT INTO `sys_role_api` VALUES (1, 801001);
INSERT INTO `sys_role_api` VALUES (1, 801002);
INSERT INTO `sys_role_api` VALUES (1, 801003);
INSERT INTO `sys_role_api` VALUES (1, 801004);
INSERT INTO `sys_role_api` VALUES (1, 802001);
INSERT INTO `sys_role_api` VALUES (1, 802002);
INSERT INTO `sys_role_api` VALUES (1, 802003);
INSERT INTO `sys_role_api` VALUES (1, 802004);
INSERT INTO `sys_role_api` VALUES (1, 803001);
INSERT INTO `sys_role_api` VALUES (1, 803002);
INSERT INTO `sys_role_api` VALUES (1, 803003);
INSERT INTO `sys_role_api` VALUES (1, 803004);
INSERT INTO `sys_role_api` VALUES (1, 803011);
INSERT INTO `sys_role_api` VALUES (1, 803012);
INSERT INTO `sys_role_api` VALUES (1, 803013);
INSERT INTO `sys_role_api` VALUES (1, 803014);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `mid` bigint NULL DEFAULT NULL COMMENT '菜单ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限角色与菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1050);
INSERT INTO `sys_role_menu` VALUES (1, 1060);
INSERT INTO `sys_role_menu` VALUES (1, 1070);
INSERT INTO `sys_role_menu` VALUES (1, 1071);
INSERT INTO `sys_role_menu` VALUES (1, 1080);
INSERT INTO `sys_role_menu` VALUES (1, 1090);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2010);
INSERT INTO `sys_role_menu` VALUES (1, 2020);
INSERT INTO `sys_role_menu` VALUES (1, 2030);
INSERT INTO `sys_role_menu` VALUES (1, 2040);
INSERT INTO `sys_role_menu` VALUES (1, 2050);
INSERT INTO `sys_role_menu` VALUES (1, 2060);
INSERT INTO `sys_role_menu` VALUES (1, 2061);
INSERT INTO `sys_role_menu` VALUES (1, 3000);
INSERT INTO `sys_role_menu` VALUES (1, 3010);
INSERT INTO `sys_role_menu` VALUES (1, 3020);
INSERT INTO `sys_role_menu` VALUES (1, 3030);
INSERT INTO `sys_role_menu` VALUES (1, 3040);
INSERT INTO `sys_role_menu` VALUES (1, 3041);
INSERT INTO `sys_role_menu` VALUES (1, 3050);
INSERT INTO `sys_role_menu` VALUES (1, 3051);
INSERT INTO `sys_role_menu` VALUES (1, 6000);
INSERT INTO `sys_role_menu` VALUES (1, 6010);
INSERT INTO `sys_role_menu` VALUES (1, 6020);
INSERT INTO `sys_role_menu` VALUES (1, 6021);
INSERT INTO `sys_role_menu` VALUES (1, 6030);
INSERT INTO `sys_role_menu` VALUES (1, 6031);
INSERT INTO `sys_role_menu` VALUES (1, 6032);
INSERT INTO `sys_role_menu` VALUES (1, 6040);
INSERT INTO `sys_role_menu` VALUES (1, 6050);
INSERT INTO `sys_role_menu` VALUES (1, 6051);
INSERT INTO `sys_role_menu` VALUES (1, 8000);
INSERT INTO `sys_role_menu` VALUES (1, 8010);
INSERT INTO `sys_role_menu` VALUES (1, 8020);
INSERT INTO `sys_role_menu` VALUES (1, 8030);

-- ----------------------------
-- Table structure for sys_role_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_org`;
CREATE TABLE `sys_role_org`  (
  `rid` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `oid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织架构ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限角色与组织架构关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_org
-- ----------------------------
INSERT INTO `sys_role_org` VALUES (1, 'u2');
INSERT INTO `sys_role_org` VALUES (1, 'u3');
INSERT INTO `sys_role_org` VALUES (1, 'u4');
INSERT INTO `sys_role_org` VALUES (1, 'u5');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `depid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `tier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级',
  `job` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职务',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `monum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `type` int NULL DEFAULT NULL COMMENT '用户类型',
  `catag` tinyint(1) NULL DEFAULT NULL COMMENT '缓存标记',
  `lotim` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `loip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构-用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('u1', 'd1000', '_d1000_u1_', NULL, 'admin', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', 'admin@qq.com', '13812345678', '1', 1, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '管理员', NULL, NULL, NULL, NULL, 1, '管理员不给修改');
INSERT INTO `sys_user` VALUES ('u2', 'd1000', '_d1000_u2_', NULL, 'vben', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', 'vben@qq.com', '13912345678', '2', 2, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '小狐狸', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u3', 'd1000', '_d1000_u3_', NULL, 'zs', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 3, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '张三', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u4', 'd1100', '_d1000_d1100_u4_', NULL, 'ls', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 4, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '李四', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u5', 'd1110', '_d1000_d1100_d1110_u5_', NULL, 'ww', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 5, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '王五', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u6', 'd1111', '_d1000_d1100_d1110_d1111_u6_', NULL, 'zl', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 6, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '赵六', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u7', 'd1111', '_d1000_d1100_d1110_d1111_u7_', NULL, 'sq', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 7, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '孙七', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u8', 'd1111', '_d1000_d1100_d1110_d1111_u8_', NULL, 'zb', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 8, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '周八', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('u9', 'd1111', '_d1000_d1100_d1110_d1111_u9_', NULL, 'wj', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 9, NULL, 0, 0, '1900-01-01 00:00:00', NULL, NULL, '吴九', NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_user_cache
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_cache`;
CREATE TABLE `sys_user_cache`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `conds` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织架构集',
  `perms` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后台所有权限集',
  `menus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '前台菜单缓存',
  `btns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '前台按钮缓存',
  `portals` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前台门户缓存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户缓存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_cache
-- ----------------------------

-- ----------------------------
-- Table structure for tool_code_field
-- ----------------------------
DROP TABLE IF EXISTS `tool_code_field`;
CREATE TABLE `tool_code_field`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段注释',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `tabid` bigint NULL DEFAULT NULL COMMENT '表格ID',
  `length` int NULL DEFAULT NULL COMMENT '字段长度',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成-字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_code_field
-- ----------------------------

-- ----------------------------
-- Table structure for tool_code_table
-- ----------------------------
DROP TABLE IF EXISTS `tool_code_table`;
CREATE TABLE `tool_code_table`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `bunam` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实例类',
  `baent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '继承基类',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表描述',
  `porid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属门户ID',
  `pmeid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级菜单ID',
  `edtyp` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑页类型',
  `pecol` int NULL DEFAULT NULL COMMENT '每行列数',
  `addbt` tinyint(1) NULL DEFAULT NULL COMMENT '新增按钮',
  `delbt` tinyint(1) NULL DEFAULT NULL COMMENT '删除按钮',
  `impbt` tinyint(1) NULL DEFAULT NULL COMMENT '导入按钮',
  `expbt` tinyint(1) NULL DEFAULT NULL COMMENT '导出按钮',
  `rotyp` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由类型',
  `orfie` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序字段',
  `ortyp` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'orm类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成-表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_code_table
-- ----------------------------

-- ----------------------------
-- Table structure for tool_dict_cate
-- ----------------------------
DROP TABLE IF EXISTS `tool_dict_cate`;
CREATE TABLE `tool_dict_cate`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `notes` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_dict_cate
-- ----------------------------

-- ----------------------------
-- Table structure for tool_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `tool_dict_data`;
CREATE TABLE `tool_dict_data`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `dicid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典ID',
  `dalab` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据标签',
  `daval` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典ID',
  `shsty` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示样式',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_dict_data
-- ----------------------------
INSERT INTO `tool_dict_data` VALUES ('799163435198713861', 1, 'DEMO_GRADE', 'A', 'A级资质', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908165', 2, 'DEMO_GRADE', 'B', 'B级资质', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908166', 3, 'DEMO_GRADE', 'C', 'C级资质', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908167', 4, 'DEMO_GRADE', 'Z', '不合格', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908168', 1, 'DIST_GRADE', 'A', 'A级资质', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908169', 2, 'DIST_GRADE', 'B', 'B级资质', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908170', 3, 'DIST_GRADE', 'C', 'C级资质', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_data` VALUES ('799163435202908171', 4, 'DIST_GRADE', 'Z', '不合格', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for tool_dict_main
-- ----------------------------
DROP TABLE IF EXISTS `tool_dict_main`;
CREATE TABLE `tool_dict_main`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `ornum` int NULL DEFAULT NULL COMMENT '排序号',
  `catid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典代码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_dict_main
-- ----------------------------
INSERT INTO `tool_dict_main` VALUES ('DEMO_GRADE', 0, NULL, NULL, 'DEMO资质等级', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `tool_dict_main` VALUES ('DIST_GRADE', 0, NULL, NULL, '渠道商资质等级', NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for tool_form
-- ----------------------------
DROP TABLE IF EXISTS `tool_form`;
CREATE TABLE `tool_form`  (
  `id` bigint NOT NULL COMMENT 'Id主键',
  `frule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单规则',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `cruid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `avtag` tinyint(1) NULL DEFAULT NULL COMMENT '可用标记：1可用，0禁用',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_form
-- ----------------------------

-- ----------------------------
-- Table structure for tool_num
-- ----------------------------
DROP TABLE IF EXISTS `tool_num`;
CREATE TABLE `tool_num`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id主键',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号标签',
  `numod` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号生成模式',
  `nupre` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号前缀',
  `nflag` tinyint(1) NULL DEFAULT NULL COMMENT '判断标记',
  `nunex` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下一个编号',
  `nulen` int NOT NULL COMMENT '编号长度',
  `cudat` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前日期',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `uptim` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `notes` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '编号工具' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_num
-- ----------------------------
INSERT INTO `tool_num` VALUES ('CUST', NULL, 'yyyymmdd', 'CU', 1, NULL, 3, NULL, '2026-01-14 14:30:11', NULL, NULL, '客户流水号');
INSERT INTO `tool_num` VALUES ('DEMO', NULL, 'yy', 'D', 1, NULL, 4, NULL, '2026-01-14 14:30:11', NULL, NULL, 'DEMO流水号');
INSERT INTO `tool_num` VALUES ('DIST', NULL, 'nodate', 'DMS', 1, '1000001', 7, NULL, '2026-01-14 14:30:11', NULL, NULL, '渠道商流水号');
INSERT INTO `tool_num` VALUES ('DIST_USER', NULL, 'nodate', 'd', 1, '100001', 6, NULL, '2026-01-14 14:30:11', NULL, NULL, '渠道商流水号');
INSERT INTO `tool_num` VALUES ('PROJ', NULL, 'yyyymmdd', 'PR', 1, NULL, 3, NULL, '2026-01-14 14:30:11', NULL, NULL, '项目流水号');

-- ----------------------------
-- Table structure for tool_oss_file
-- ----------------------------
DROP TABLE IF EXISTS `tool_oss_file`;
CREATE TABLE `tool_oss_file`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件md5',
  `fsize` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储地址',
  `service` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储服务',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS存储文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_oss_file
-- ----------------------------

-- ----------------------------
-- Table structure for tool_oss_main
-- ----------------------------
DROP TABLE IF EXISTS `tool_oss_main`;
CREATE TABLE `tool_oss_main`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（后缀）',
  `filid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `crtim` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `crman` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS存储引用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_oss_main
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
