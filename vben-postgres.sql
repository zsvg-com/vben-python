/*
 Navicat Premium Dump SQL

 Source Server         : 10.0.0.73
 Source Server Type    : PostgreSQL
 Source Server Version : 150015 (150015)
 Source Host           : 10.0.0.73:5432
 Source Catalog        : vben-python
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150015 (150015)
 File Encoding         : 65001

 Date: 15/01/2026 20:27:40
*/


-- ----------------------------
-- Table structure for demo_link_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link_cate";
CREATE TABLE "public"."demo_link_cate" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "pid" int8,
  "tier" varchar(512) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."demo_link_cate"."id" IS '主键ID';
COMMENT ON COLUMN "public"."demo_link_cate"."avtag" IS '可用标记 1启用，0禁用';
COMMENT ON COLUMN "public"."demo_link_cate"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_link_cate"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."demo_link_cate"."label" IS '标签';
COMMENT ON COLUMN "public"."demo_link_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_link_cate"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_link_cate"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."demo_link_cate"."pid" IS '父分类ID';
COMMENT ON COLUMN "public"."demo_link_cate"."tier" IS '层级信息';
COMMENT ON COLUMN "public"."demo_link_cate"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_link_cate"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."demo_link_cate" IS '关联分类表';

-- ----------------------------
-- Records of demo_link_cate
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link_item";
CREATE TABLE "public"."demo_link_item" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "maiid" int8,
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4
)
;
COMMENT ON COLUMN "public"."demo_link_item"."id" IS '主键ID';
COMMENT ON COLUMN "public"."demo_link_item"."maiid" IS '主表ID';
COMMENT ON COLUMN "public"."demo_link_item"."name" IS '子项目名称';
COMMENT ON COLUMN "public"."demo_link_item"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_link_item"."ornum" IS '排序号';
COMMENT ON TABLE "public"."demo_link_item" IS '关联子表';

-- ----------------------------
-- Records of demo_link_item
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link_main";
CREATE TABLE "public"."demo_link_main" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "name" varchar(126) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default",
  "catid" int8
)
;
COMMENT ON COLUMN "public"."demo_link_main"."id" IS '主键ID';
COMMENT ON COLUMN "public"."demo_link_main"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."demo_link_main"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_link_main"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."demo_link_main"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_link_main"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_link_main"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_link_main"."upuid" IS '更新人ID';
COMMENT ON COLUMN "public"."demo_link_main"."catid" IS '所属分类ID';
COMMENT ON TABLE "public"."demo_link_main" IS '关联主表';

-- ----------------------------
-- Records of demo_link_main
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_main_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link_main_org";
CREATE TABLE "public"."demo_link_main_org" (
  "mid" int8 NOT NULL,
  "oid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of demo_link_main_org
-- ----------------------------

-- ----------------------------
-- Table structure for demo_single_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_single_cate";
CREATE TABLE "public"."demo_single_cate" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "pid" int8,
  "tier" varchar(512) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."demo_single_cate"."id" IS '主键ID';
COMMENT ON COLUMN "public"."demo_single_cate"."avtag" IS '可用标记 1启用，0禁用';
COMMENT ON COLUMN "public"."demo_single_cate"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_single_cate"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."demo_single_cate"."label" IS '标签';
COMMENT ON COLUMN "public"."demo_single_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_single_cate"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_single_cate"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."demo_single_cate"."pid" IS '父分类ID';
COMMENT ON COLUMN "public"."demo_single_cate"."tier" IS '层级信息';
COMMENT ON COLUMN "public"."demo_single_cate"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_single_cate"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."demo_single_cate" IS '单一树表';

-- ----------------------------
-- Records of demo_single_cate
-- ----------------------------

-- ----------------------------
-- Table structure for demo_single_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_single_main";
CREATE TABLE "public"."demo_single_main" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "name" varchar(126) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."demo_single_main"."id" IS '主键ID';
COMMENT ON COLUMN "public"."demo_single_main"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."demo_single_main"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_single_main"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."demo_single_main"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_single_main"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_single_main"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_single_main"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."demo_single_main" IS '单一主表';

-- ----------------------------
-- Records of demo_single_main
-- ----------------------------

-- ----------------------------
-- Table structure for mon_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_job_log";
CREATE TABLE "public"."mon_job_log" (
  "id" int8 NOT NULL,
  "entim" varchar(32) COLLATE "pg_catalog"."default",
  "msg" varchar(5000) COLLATE "pg_catalog"."default",
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "ret" varchar(32) COLLATE "pg_catalog"."default",
  "sttim" varchar(32) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of mon_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for mon_job_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_job_main";
CREATE TABLE "public"."mon_job_main" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "code" varchar(128) COLLATE "pg_catalog"."default",
  "cron" varchar(32) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "name" varchar(128) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "retyp" int4,
  "reurl" varchar(32) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of mon_job_main
-- ----------------------------

-- ----------------------------
-- Table structure for mon_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_login_log";
CREATE TABLE "public"."mon_login_log" (
  "id" int8 NOT NULL,
  "browser" varchar(64) COLLATE "pg_catalog"."default",
  "clkey" varchar(32) COLLATE "pg_catalog"."default",
  "detyp" varchar(8) COLLATE "pg_catalog"."default",
  "himsg" varchar(255) COLLATE "pg_catalog"."default",
  "loip" varchar(16) COLLATE "pg_catalog"."default",
  "loloc" varchar(64) COLLATE "pg_catalog"."default",
  "lotim" timestamp(6),
  "os" varchar(64) COLLATE "pg_catalog"."default",
  "sutag" bool,
  "tenid" varchar(16) COLLATE "pg_catalog"."default",
  "username" varchar(16) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."mon_login_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."mon_login_log"."browser" IS '浏览器';
COMMENT ON COLUMN "public"."mon_login_log"."clkey" IS '客户端';
COMMENT ON COLUMN "public"."mon_login_log"."detyp" IS '设备类型';
COMMENT ON COLUMN "public"."mon_login_log"."himsg" IS '操作系统';
COMMENT ON COLUMN "public"."mon_login_log"."loip" IS '登录IP地址';
COMMENT ON COLUMN "public"."mon_login_log"."loloc" IS '登录地点';
COMMENT ON COLUMN "public"."mon_login_log"."lotim" IS '登录时间';
COMMENT ON COLUMN "public"."mon_login_log"."os" IS '操作系统';
COMMENT ON COLUMN "public"."mon_login_log"."sutag" IS '登录状态';
COMMENT ON COLUMN "public"."mon_login_log"."tenid" IS '租户编号';
COMMENT ON COLUMN "public"."mon_login_log"."username" IS '用户账号';
COMMENT ON TABLE "public"."mon_login_log" IS '登录日志';

-- ----------------------------
-- Records of mon_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for mon_oper_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_oper_log";
CREATE TABLE "public"."mon_oper_log" (
  "id" int8 NOT NULL,
  "bapar" varchar(4000) COLLATE "pg_catalog"."default",
  "butyp" int4,
  "cotim" int8,
  "ermsg" varchar(4000) COLLATE "pg_catalog"."default",
  "opdna" varchar(64) COLLATE "pg_catalog"."default",
  "opip" varchar(32) COLLATE "pg_catalog"."default",
  "oploc" varchar(64) COLLATE "pg_catalog"."default",
  "opmod" varchar(32) COLLATE "pg_catalog"."default",
  "optim" timestamp(6),
  "optyp" int4,
  "opuna" varchar(16) COLLATE "pg_catalog"."default",
  "remet" varchar(64) COLLATE "pg_catalog"."default",
  "repar" varchar(4000) COLLATE "pg_catalog"."default",
  "reurl" varchar(64) COLLATE "pg_catalog"."default",
  "reway" varchar(8) COLLATE "pg_catalog"."default",
  "sutag" bool,
  "tenid" varchar(16) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."mon_oper_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."mon_oper_log"."bapar" IS '返回参数';
COMMENT ON COLUMN "public"."mon_oper_log"."butyp" IS '业务类型';
COMMENT ON COLUMN "public"."mon_oper_log"."cotim" IS '消耗时间';
COMMENT ON COLUMN "public"."mon_oper_log"."ermsg" IS '错误消息';
COMMENT ON COLUMN "public"."mon_oper_log"."opdna" IS '操作人员';
COMMENT ON COLUMN "public"."mon_oper_log"."opip" IS '操作IP地址';
COMMENT ON COLUMN "public"."mon_oper_log"."oploc" IS '操作地点';
COMMENT ON COLUMN "public"."mon_oper_log"."opmod" IS '操作模块';
COMMENT ON COLUMN "public"."mon_oper_log"."optim" IS '操作时间';
COMMENT ON COLUMN "public"."mon_oper_log"."optyp" IS '操作类别';
COMMENT ON COLUMN "public"."mon_oper_log"."opuna" IS '操作人员';
COMMENT ON COLUMN "public"."mon_oper_log"."remet" IS '请求方法';
COMMENT ON COLUMN "public"."mon_oper_log"."repar" IS '请求参数';
COMMENT ON COLUMN "public"."mon_oper_log"."reurl" IS '请求url';
COMMENT ON COLUMN "public"."mon_oper_log"."reway" IS '请求方式';
COMMENT ON COLUMN "public"."mon_oper_log"."sutag" IS '操作状态';
COMMENT ON COLUMN "public"."mon_oper_log"."tenid" IS '租户编号';
COMMENT ON TABLE "public"."mon_oper_log" IS '操作日志';

-- ----------------------------
-- Records of mon_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_api";
CREATE TABLE "public"."sys_api" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "code" int8,
  "crtim" timestamp(6),
  "menid" int8,
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "perm" varchar(64) COLLATE "pg_catalog"."default",
  "pos" int4,
  "type" varchar(8) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_api"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_api"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_api"."code" IS '权限代码';
COMMENT ON COLUMN "public"."sys_api"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_api"."menid" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_api"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_api"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_api"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_api"."perm" IS '权限字符';
COMMENT ON COLUMN "public"."sys_api"."pos" IS '权限位';
COMMENT ON COLUMN "public"."sys_api"."type" IS '权限类型';
COMMENT ON COLUMN "public"."sys_api"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."sys_api" IS '权限接口';

-- ----------------------------
-- Records of sys_api
-- ----------------------------
INSERT INTO "public"."sys_api" VALUES (101001, 't', NULL, '2026-01-15 20:24:59.211', 1010, '部门查询', NULL, 101001, 'sys:dept:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (101002, 't', NULL, '2026-01-15 20:24:59.211', 1010, '部门编辑', NULL, 101002, 'sys:dept:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (101003, 't', NULL, '2026-01-15 20:24:59.211', 1010, '部门删除', NULL, 101003, 'sys:dept:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (102001, 't', NULL, '2026-01-15 20:24:59.211', 1020, '用户查询', NULL, 102001, 'sys:user:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (102002, 't', NULL, '2026-01-15 20:24:59.211', 1020, '用户编辑', NULL, 102002, 'sys:user:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (102003, 't', NULL, '2026-01-15 20:24:59.211', 1020, '用户删除', NULL, 102003, 'sys:user:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (102004, 't', NULL, '2026-01-15 20:24:59.211', 1020, '用户启用禁用', NULL, 102004, 'sys:user:avtag', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (102005, 't', NULL, '2026-01-15 20:24:59.211', 1020, '用户密码修改', NULL, 102005, 'sys:user:password', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (103001, 't', NULL, '2026-01-15 20:24:59.211', 1030, '岗位查询', NULL, 103001, 'sys:post:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (103002, 't', NULL, '2026-01-15 20:24:59.211', 1030, '岗位编辑', NULL, 103002, 'sys:post:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (103003, 't', NULL, '2026-01-15 20:24:59.211', 1030, '岗位删除', NULL, 103003, 'sys:post:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (104001, 't', NULL, '2026-01-15 20:24:59.211', 1040, '群组查询', NULL, 104001, 'sys:group:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (104002, 't', NULL, '2026-01-15 20:24:59.211', 1040, '群组编辑', NULL, 104002, 'sys:group:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (104003, 't', NULL, '2026-01-15 20:24:59.211', 1040, '群组删除', NULL, 104003, 'sys:group:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (104004, 't', NULL, '2026-01-15 20:24:59.211', 1040, '群组分类查询', NULL, 104004, 'sys:groupc:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (104005, 't', NULL, '2026-01-15 20:24:59.211', 1040, '群组分类编辑', NULL, 104005, 'sys:groupc:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (104006, 't', NULL, '2026-01-15 20:24:59.211', 1040, '群组分类删除', NULL, 104006, 'sys:groupc:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (105001, 't', NULL, '2026-01-15 20:24:59.211', 1050, '菜单查询', NULL, 105001, 'sys:menu:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (105002, 't', NULL, '2026-01-15 20:24:59.211', 1050, '菜单编辑', NULL, 105002, 'sys:menu:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (105003, 't', NULL, '2026-01-15 20:24:59.211', 1050, '菜单删除', NULL, 105003, 'sys:menu:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (106001, 't', NULL, '2026-01-15 20:24:59.211', 1060, '接口查询', NULL, 106001, 'sys:api:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (106002, 't', NULL, '2026-01-15 20:24:59.211', 1060, '接口编辑', NULL, 106002, 'sys:api:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (106003, 't', NULL, '2026-01-15 20:24:59.211', 1060, '接口删除', NULL, 106003, 'sys:api:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (107001, 't', NULL, '2026-01-15 20:24:59.211', 1070, '角色查询', NULL, 107001, 'sys:role:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (107002, 't', NULL, '2026-01-15 20:24:59.211', 1070, '角色编辑', NULL, 107002, 'sys:role:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (107003, 't', NULL, '2026-01-15 20:24:59.211', 1070, '角色删除', NULL, 107003, 'sys:role:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (108001, 't', NULL, '2026-01-15 20:24:59.211', 1080, '参数查询', NULL, 108001, 'sys:config:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (108002, 't', NULL, '2026-01-15 20:24:59.211', 1080, '参数编辑', NULL, 108002, 'sys:config:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (108003, 't', NULL, '2026-01-15 20:24:59.211', 1080, '参数删除', NULL, 108003, 'sys:config:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (109001, 't', NULL, '2026-01-15 20:24:59.211', 1090, '通知查询', NULL, 109001, 'sys:notice:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (109002, 't', NULL, '2026-01-15 20:24:59.211', 1090, '通知编辑', NULL, 109002, 'sys:notice:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (109003, 't', NULL, '2026-01-15 20:24:59.211', 1090, '通知删除', NULL, 109003, 'sys:notice:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (201001, 't', NULL, '2026-01-15 20:24:59.211', 2010, '在线用户查询', NULL, 201001, 'mon:online:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (201002, 't', NULL, '2026-01-15 20:24:59.211', 2010, '在线用户强退', NULL, 201002, 'mon:online:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (202001, 't', NULL, '2026-01-15 20:24:59.211', 2020, '登录日志查询', NULL, 202001, 'mon:login:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (202002, 't', NULL, '2026-01-15 20:24:59.211', 2020, '登录日志删除', NULL, 202002, 'mon:login:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (203001, 't', NULL, '2026-01-15 20:24:59.211', 2030, '操作日志查询', NULL, 203001, 'mon:oper:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (203002, 't', NULL, '2026-01-15 20:24:59.211', 2030, '操作日志删除', NULL, 203002, 'mon:oper:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (204001, 't', NULL, '2026-01-15 20:24:59.211', 2040, '服务器信息查询', NULL, 204001, 'mon:server:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (205001, 't', NULL, '2026-01-15 20:24:59.211', 2050, '缓存信息查询', NULL, 205001, 'mon:cache:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (206001, 't', NULL, '2026-01-15 20:24:59.211', 2060, '定时任务查询', NULL, 206001, 'monjob:main:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (206002, 't', NULL, '2026-01-15 20:24:59.211', 2060, '定时任务修改', NULL, 206002, 'monjob:main:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (206003, 't', NULL, '2026-01-15 20:24:59.211', 2060, '定时任务执行', NULL, 206003, 'monjob:main:run', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (206101, 't', NULL, '2026-01-15 20:24:59.211', 2061, '定时任务日志查询', NULL, 206101, 'monjob:log:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (206102, 't', NULL, '2026-01-15 20:24:59.211', 2061, '定时任务日志删除', NULL, 206102, 'monjob:log:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (301001, 't', NULL, '2026-01-15 20:24:59.211', 3010, '字典查询', NULL, 301001, 'tooldict:main:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (301002, 't', NULL, '2026-01-15 20:24:59.211', 3010, '字典修改', NULL, 301002, 'tooldict:main:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (301003, 't', NULL, '2026-01-15 20:24:59.211', 3010, '字典删除', NULL, 301003, 'tooldict:main:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (301004, 't', NULL, '2026-01-15 20:24:59.211', 3010, '字典数据查询', NULL, 301004, 'tooldict:data:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (301005, 't', NULL, '2026-01-15 20:24:59.211', 3010, '字典数据编辑', NULL, 301005, 'tooldict:data:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (301006, 't', NULL, '2026-01-15 20:24:59.211', 3010, '字典数据删除', NULL, 301006, 'tooldict:data:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (302001, 't', NULL, '2026-01-15 20:24:59.211', 3020, '编号查询', NULL, 302001, 'tool:num:query', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (302002, 't', NULL, '2026-01-15 20:24:59.211', 3020, '编号编辑', NULL, 302002, 'tool:num:edit', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (302003, 't', NULL, '2026-01-15 20:24:59.211', 3020, '编号删除', NULL, 302003, 'tool:num:delete', NULL, NULL, '2026-01-15 20:24:59.211');
INSERT INTO "public"."sys_api" VALUES (603001, 't', NULL, '2026-01-15 20:25:15.84', 6030, '流程查询', NULL, 603001, 'bpmbus:main:query', NULL, NULL, '2026-01-15 20:25:15.84');
INSERT INTO "public"."sys_api" VALUES (603002, 't', NULL, '2026-01-15 20:25:15.84', 6030, '流程新增', NULL, 603002, 'bpmbus:main:add', NULL, NULL, '2026-01-15 20:25:15.84');
INSERT INTO "public"."sys_api" VALUES (603003, 't', NULL, '2026-01-15 20:25:15.84', 6030, '流程编辑', NULL, 603003, 'bpmbus:main:edit', NULL, NULL, '2026-01-15 20:25:15.84');
INSERT INTO "public"."sys_api" VALUES (801001, 't', NULL, '2026-01-15 20:26:00.583', 8010, '单一主表-查询', NULL, 801001, 'single:main:query', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (801002, 't', NULL, '2026-01-15 20:26:00.583', 8010, '单一主表-新增', NULL, 801002, 'single:main:add', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (801003, 't', NULL, '2026-01-15 20:26:00.583', 8010, '单一主表-修改', NULL, 801003, 'single:main:edit', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (801004, 't', NULL, '2026-01-15 20:26:00.583', 8010, '单一主表-删除', NULL, 801004, 'single:main:remove', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (802001, 't', NULL, '2026-01-15 20:26:00.583', 8020, '单一树表-查询', NULL, 802001, 'single:cate:query', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (802002, 't', NULL, '2026-01-15 20:26:00.583', 8020, '单一树表-新增', NULL, 802002, 'single:cate:add', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (802003, 't', NULL, '2026-01-15 20:26:00.583', 8020, '单一树表-修改', NULL, 802003, 'single:cate:edit', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (802004, 't', NULL, '2026-01-15 20:26:00.583', 8020, '单一树表-删除', NULL, 802004, 'single:cate:remove', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803001, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联主表-查询', NULL, 803001, 'link:main:query', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803002, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联主表-新增', NULL, 803002, 'link:main:add', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803003, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联主表-修改', NULL, 803003, 'link:main:edit', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803004, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联主表-删除', NULL, 803004, 'link:main:remove', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803011, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联树表-查询', NULL, 803011, 'link:cate:query', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803012, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联树表-新增', NULL, 803012, 'link:cate:add', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803013, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联树表-修改', NULL, 803013, 'link:cate:edit', NULL, NULL, '2026-01-15 20:26:00.583');
INSERT INTO "public"."sys_api" VALUES (803014, 't', NULL, '2026-01-15 20:26:00.583', 8030, '关联树表-删除', NULL, 803014, 'link:cate:remove', NULL, NULL, '2026-01-15 20:26:00.583');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "intag" bool,
  "kenam" varchar(32) COLLATE "pg_catalog"."default",
  "keval" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_config"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_config"."kenam" IS '参数键名';
COMMENT ON COLUMN "public"."sys_config"."keval" IS '参数键值';
COMMENT ON COLUMN "public"."sys_config"."name" IS '参数名称';
COMMENT ON COLUMN "public"."sys_config"."notes" IS '备注';
COMMENT ON TABLE "public"."sys_config" IS '系统参数';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO "public"."sys_config" VALUES (1, 't', '2026-01-15 20:25:46.833', 't', 'sys.user.initPassword', '123456', '用户管理-账号初始密码', NULL, NULL, '2026-01-15 20:25:46.833');
INSERT INTO "public"."sys_config" VALUES (2, 't', '2026-01-15 20:25:46.833', 't', 'sys.account.registerUser', 'false', '账号自助-是否开启用户注册功能', NULL, NULL, '2026-01-15 20:25:46.833');

-- ----------------------------
-- Table structure for sys_corp
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_corp";
CREATE TABLE "public"."sys_corp" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "avtag" bool,
  "catid" varchar(36) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "cruid" varchar(32) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "type" int4,
  "uptim" timestamp(6),
  "upuid" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_corp"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_corp"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_corp"."catid" IS '分类ID';
COMMENT ON COLUMN "public"."sys_corp"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_corp"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_corp"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_corp"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_corp"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_corp"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_corp"."type" IS '公司类型';
COMMENT ON COLUMN "public"."sys_corp"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_corp"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."sys_corp" IS '公司';

-- ----------------------------
-- Records of sys_corp
-- ----------------------------

-- ----------------------------
-- Table structure for sys_corp_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_corp_cate";
CREATE TABLE "public"."sys_corp_cate" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "pid" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_corp_cate"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_corp_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_corp_cate"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_corp_cate"."pid" IS '父ID';
COMMENT ON TABLE "public"."sys_corp_cate" IS '公司分类';

-- ----------------------------
-- Records of sys_corp_cate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(32) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "pid" varchar(36) COLLATE "pg_catalog"."default",
  "tier" varchar(512) COLLATE "pg_catalog"."default",
  "type" int4,
  "uptim" timestamp(6),
  "upuid" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_dept"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dept"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_dept"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_dept"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_dept"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_dept"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_dept"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_dept"."pid" IS '父ID';
COMMENT ON COLUMN "public"."sys_dept"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_dept"."type" IS '部门类型';
COMMENT ON COLUMN "public"."sys_dept"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dept"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."sys_dept" IS '组织架构-部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES ('d1000', 't', '2026-01-15 20:24:19.059', NULL, NULL, 'XX科技', NULL, 1000, NULL, '_d1000_', 1, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1100', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司', NULL, 1100, 'd1000', '_d1000_d1100_', 2, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1110', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司销售部', NULL, 1110, 'd1100', '_d1000_d1100_d1110_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1111', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司销售部一组', NULL, 1111, 'd1110', '_d1000_d1100_d1110_d1111_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1112', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司销售部二组', NULL, 1112, 'd1110', '_d1000_d1100_d1110_d1112_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1120', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司人事部', NULL, 1120, 'd1100', '_d1000_d1100_d1120_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1130', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司财务部', NULL, 1130, 'd1100', '_d1000_d1100_d1130_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1140', 't', '2026-01-15 20:24:19.059', NULL, NULL, '北京分公司综合部', NULL, 1140, 'd1100', '_d1000_d1100_d1410_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1200', 't', '2026-01-15 20:24:19.059', NULL, NULL, '上海分公司', NULL, 1200, 'd1000', '_d1000_d1200_', 2, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1210', 't', '2026-01-15 20:24:19.059', NULL, NULL, '上海分公司销售部', NULL, 1210, 'd1200', '_d1000_d1200_d1210_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1220', 't', '2026-01-15 20:24:19.059', NULL, NULL, '上海分公司人事部', NULL, 1220, 'd1200', '_d1000_d1200_d1220_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1230', 't', '2026-01-15 20:24:19.059', NULL, NULL, '上海分公司财务部', NULL, 1230, 'd1200', '_d1000_d1200_d1230_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1300', 't', '2026-01-15 20:24:19.059', NULL, NULL, '广州分公司', NULL, 1300, 'd1000', '_d1000_d1300_', 2, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1310', 't', '2026-01-15 20:24:19.059', NULL, NULL, '广州分公司综合部', NULL, 1310, 'd1300', '_d1000_d1300_d1310_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1320', 't', '2026-01-15 20:24:19.059', NULL, NULL, '广州分公司销售部', NULL, 1320, 'd1300', '_d1000_d1300_d1320_', 8, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES ('d1330', 't', '2026-01-15 20:24:19.059', NULL, NULL, '广州分公司人事部', NULL, 1330, 'd1300', '_d1000_d1300_d1330_', 8, NULL, NULL);

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_group";
CREATE TABLE "public"."sys_group" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "avtag" bool,
  "catid" varchar(36) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "cruid" varchar(32) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "uptim" timestamp(6),
  "upuid" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_group"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_group"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_group"."catid" IS '分类ID';
COMMENT ON COLUMN "public"."sys_group"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_group"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_group"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_group"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_group"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_group"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_group"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_group"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."sys_group" IS '组织架构-群组';

-- ----------------------------
-- Records of sys_group
-- ----------------------------
INSERT INTO "public"."sys_group" VALUES ('g3001', 't', NULL, '2026-01-15 20:24:46.17', NULL, NULL, '北京分公司管理组', NULL, 3001, NULL, NULL);
INSERT INTO "public"."sys_group" VALUES ('g3002', 't', NULL, '2026-01-15 20:24:47.007', NULL, NULL, '北京分公司销售员', NULL, 3002, NULL, NULL);

-- ----------------------------
-- Table structure for sys_group_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_group_cate";
CREATE TABLE "public"."sys_group_cate" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "pid" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_group_cate"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_group_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_group_cate"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_group_cate"."pid" IS '父ID';
COMMENT ON TABLE "public"."sys_group_cate" IS '组织架构-群组分类';

-- ----------------------------
-- Records of sys_group_cate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_group_org";
CREATE TABLE "public"."sys_group_org" (
  "gid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "oid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of sys_group_org
-- ----------------------------
INSERT INTO "public"."sys_group_org" VALUES ('g3001', 'u4');
INSERT INTO "public"."sys_group_org" VALUES ('g3001', 'u5');
INSERT INTO "public"."sys_group_org" VALUES ('g3001', 'p2004');
INSERT INTO "public"."sys_group_org" VALUES ('g3001', 'd1140');
INSERT INTO "public"."sys_group_org" VALUES ('g3002', 'u8');
INSERT INTO "public"."sys_group_org" VALUES ('g3002', 'u9');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "catag" bool,
  "comp" varchar(64) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "icon" varchar(64) COLLATE "pg_catalog"."default",
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "outag" bool,
  "param" varchar(64) COLLATE "pg_catalog"."default",
  "path" varchar(64) COLLATE "pg_catalog"."default",
  "pid" int8,
  "shtag" bool,
  "type" varchar(8) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_menu"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_menu"."avtag" IS '可用标记 1启用，0禁用';
COMMENT ON COLUMN "public"."sys_menu"."catag" IS '缓存标记';
COMMENT ON COLUMN "public"."sys_menu"."comp" IS '组件路径';
COMMENT ON COLUMN "public"."sys_menu"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '图标';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_menu"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_menu"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_menu"."outag" IS '外链标记';
COMMENT ON COLUMN "public"."sys_menu"."param" IS '路由参数';
COMMENT ON COLUMN "public"."sys_menu"."path" IS '路由路径';
COMMENT ON COLUMN "public"."sys_menu"."pid" IS '父ID';
COMMENT ON COLUMN "public"."sys_menu"."shtag" IS '显示标记';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '类型';
COMMENT ON COLUMN "public"."sys_menu"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."sys_menu" IS '系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1000, 't', 'f', 'Layout', '2026-01-15 20:24:48.33', NULL, 'tdesign:system-setting', '系统管理', NULL, 1000, 'f', NULL, 'sys', 0, 't', '1', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1010, 't', 'f', 'sys/dept/index', '2026-01-15 20:24:48.33', NULL, 'mingcute:department-line', '部门管理', NULL, 1010, 'f', NULL, 'dept', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1020, 't', 'f', 'sys/user/index', '2026-01-15 20:24:48.33', NULL, 'ant-design:user-outlined', '用户管理', NULL, 1020, 'f', NULL, 'user', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1021, 't', 'f', 'sys/user/tedit', '2026-01-15 20:24:48.33', NULL, 'mingcute:user-edit-line', '用户编辑', NULL, 1021, 'f', NULL, 'user/edit', 1000, 'f', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1030, 't', 'f', 'sys/post/index', '2026-01-15 20:24:48.33', NULL, 'icon-park-outline:appointment', '岗位管理', NULL, 1030, 'f', NULL, 'post', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1040, 't', 'f', 'sys/group/index', '2026-01-15 20:24:48.33', NULL, 'material-symbols:group-outline-rounded', '群组管理', NULL, 1040, 'f', NULL, 'group', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1050, 't', 'f', 'sys/menu/index', '2026-01-15 20:24:48.33', NULL, 'ri:menu-fold-2-fill', '菜单管理', NULL, 1050, 'f', NULL, 'menu', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1060, 't', 'f', 'sys/api/index', '2026-01-15 20:24:48.33', NULL, 'ant-design:api-outlined', '接口管理', NULL, 1060, 'f', NULL, 'api', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1070, 't', 'f', 'sys/role/index', '2026-01-15 20:24:48.33', NULL, 'eos-icons:role-binding-outlined', '角色管理', NULL, 1070, 't', NULL, 'role', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1071, 't', 'f', 'sys/role/edit', '2026-01-15 20:24:48.33', NULL, 'oui:app-users-roles', '角色编辑', NULL, 1071, 'f', NULL, 'role/edit', 1000, 'f', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1080, 't', 'f', 'sys/config/index', '2026-01-15 20:24:48.33', NULL, 'ant-design:setting-outlined', '参数设置', NULL, 1080, 't', NULL, 'config', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (1090, 't', 'f', 'sys/notice/index', '2026-01-15 20:24:48.33', NULL, 'fe:notice-push', '通知公告', NULL, 1090, 'f', NULL, 'notice', 1000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2000, 't', 'f', 'Layout', '2026-01-15 20:24:48.33', NULL, 'eos-icons:monitoring', '监控中心', NULL, 2000, 'f', NULL, 'mon', 0, 't', '1', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2010, 't', 'f', 'mon/online/user/index', '2026-01-15 20:24:48.33', NULL, 'oui:online', '在线用户', NULL, 2010, 'f', NULL, 'online/user', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2020, 't', 'f', 'mon/login/log/index', '2026-01-15 20:24:48.33', NULL, 'uiw:login', '登录日志', NULL, 2020, 'f', NULL, 'login/log', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2030, 't', 'f', 'mon/oper/log/index', '2026-01-15 20:24:48.33', NULL, 'icon-park-outline:reverse-operation-in', '操作日志', NULL, 2030, 'f', NULL, 'oper/log', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2040, 't', 'f', 'mon/server/index', '2026-01-15 20:24:48.33', NULL, 'mdi:server-outline', '服务监控', NULL, 2040, 'f', NULL, 'server', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2050, 't', 'f', 'mon/cache/index', '2026-01-15 20:24:48.33', NULL, 'octicon:cache-24', '缓存监控', NULL, 2050, 'f', NULL, 'cache', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2060, 't', 'f', 'mon/job/main/index', '2026-01-15 20:24:48.33', NULL, 'streamline:task-list', '定时任务', NULL, 2060, 'f', NULL, 'job/main', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (2061, 't', 'f', 'mon/job/log/index', '2026-01-15 20:24:48.33', NULL, 'ix:log', '任务日志', NULL, 2061, 'f', NULL, 'job/log', 2000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3000, 't', 'f', 'Layout', '2026-01-15 20:24:48.33', NULL, 'ant-design:tool-outlined', '辅助工具', NULL, 3000, 'f', NULL, 'tool', 0, 't', '1', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3010, 't', 'f', 'tool/dict/index', '2026-01-15 20:24:48.33', NULL, 'fluent-mdl2:dictionary', '字典工具', NULL, 3010, 'f', NULL, 'dict', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3020, 't', 'f', 'tool/num/index', '2026-01-15 20:24:48.33', NULL, 'streamline-sharp:steps-number', '编号工具', NULL, 3020, 'f', NULL, 'num', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3030, 't', 'f', 'tool/oss/main/index', '2026-01-15 20:24:48.33', NULL, 'mdi:file-outline', '文件工具', NULL, 3030, 'f', NULL, 'oss', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3040, 't', 'f', 'tool/form/index', '2026-01-15 20:24:48.33', NULL, 'fluent:form-20-regular', '在线表单', NULL, 3040, 'f', NULL, 'form', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3041, 't', 'f', 'tool/form/edit', '2026-01-15 20:24:48.33', NULL, 'fluent:form-20-regular', '在线表单', NULL, 3041, 'f', NULL, 'form/edit', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3050, 't', 'f', 'tool/code/index', '2026-01-15 20:24:48.33', NULL, 'humbleicons:code', '代码生成', NULL, 3050, 'f', NULL, 'code', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (3051, 't', 'f', 'tool/code/edit', '2026-01-15 20:24:48.33', NULL, 'humbleicons:code', '代码生成', NULL, 3051, 'f', NULL, 'code/edit', 3000, 't', '2', '2026-01-15 20:24:48.33', NULL);
INSERT INTO "public"."sys_menu" VALUES (6000, 't', 'f', 'Layout', '2026-01-15 20:24:56.091', NULL, 'streamline-sharp:text-flow-rows', '流程管理', NULL, 6000, 'f', NULL, 'bpm', 0, 't', '1', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6010, 't', 'f', 'bpm/bus/cate/index', '2026-01-15 20:24:56.091', NULL, 'tabler:category-plus', '流程分类', NULL, 6010, 'f', NULL, 'bus/cate', 6000, 't', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6020, 't', 'f', 'bpm/bus/tmpl/index', '2026-01-15 20:24:56.091', NULL, 'carbon:prompt-template', '流程模板', NULL, 6020, 'f', NULL, 'bus/tmpl', 6000, 't', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6021, 't', 'f', 'bpm/bus/tmpl/edit', '2026-01-15 20:24:56.091', NULL, 'carbon:prompt-template', '流程模板编辑', NULL, 6021, 'f', NULL, 'bus/tmpl/edit', 6000, 'f', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6030, 't', 't', 'bpm/bus/main/index', '2026-01-15 20:24:56.091', NULL, 'ri:instance-line', '流程清单', NULL, 6030, 'f', NULL, 'bus/main', 6000, 't', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6031, 't', 'f', 'bpm/bus/main/edit', '2026-01-15 20:24:56.091', NULL, 'ri:instance-line', '流程编辑', NULL, 6031, 'f', NULL, 'bus/main/edit', 6000, 'f', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6032, 't', 'f', 'bpm/bus/main/view', '2026-01-15 20:24:56.091', NULL, 'ri:instance-line', '流程查看', NULL, 6032, 'f', NULL, 'bus/main/view', 6000, 'f', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6040, 't', 'f', 'bpm/todo/index', '2026-01-15 20:24:56.091', NULL, 'ri:todo-line', '流程待办', NULL, 6040, 'f', NULL, 'todo', 6000, 't', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6050, 't', 'f', 'bpm/org/tree/index', '2026-01-15 20:24:56.091', NULL, 'mdi:workflow-outline', '流程组织', NULL, 6050, 'f', NULL, 'org/tree', 6000, 't', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (6051, 't', 'f', 'bpm/org/node/index', '2026-01-15 20:24:56.091', NULL, 'mdi:workflow-outline', '流程组织节点', NULL, 6051, 'f', NULL, 'org/node', 6000, 't', '2', '2026-01-15 20:24:56.091', NULL);
INSERT INTO "public"."sys_menu" VALUES (8000, 't', 'f', 'Layout', '2026-01-15 20:25:59.341', NULL, 'hugeicons:star', '使用案例', NULL, 8000, 'f', NULL, 'demo', 0, 't', '1', '2026-01-15 20:25:59.341', NULL);
INSERT INTO "public"."sys_menu" VALUES (8010, 't', 'f', 'demo/single/main/index', '2026-01-15 20:25:59.341', NULL, 'pajamas:work-item-requirement', '单一主表案例', NULL, 8010, 'f', NULL, 'single/main', 8000, 't', '2', '2026-01-15 20:25:59.341', NULL);
INSERT INTO "public"."sys_menu" VALUES (8020, 't', 'f', 'demo/single/cate/index', '2026-01-15 20:25:59.341', NULL, 'pajamas:work-item-requirement', '单一树表案例', NULL, 8020, 'f', NULL, 'single/cate', 8000, 't', '2', '2026-01-15 20:25:59.341', NULL);
INSERT INTO "public"."sys_menu" VALUES (8030, 't', 'f', 'demo/link/index', '2026-01-15 20:25:59.341', NULL, 'pajamas:work-item-requirement', '关联主分子案例', NULL, 8030, 'f', NULL, 'link', 8000, 't', '2', '2026-01-15 20:25:59.341', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "cont" varchar(2000) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "type" int4,
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_notice"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_notice"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_notice"."cont" IS '公告内容';
COMMENT ON COLUMN "public"."sys_notice"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_notice"."name" IS '公告标题';
COMMENT ON COLUMN "public"."sys_notice"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_notice"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_notice"."type" IS '公告类型（1通知 2公告）';
COMMENT ON COLUMN "public"."sys_notice"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."sys_notice" IS '通知公告';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO "public"."sys_notice" VALUES (1, 't', '系统将于今天晚上20点到22点进行停机维护，请提前做好工作安排', '2026-01-15 20:25:47.193', '系统停机公告', NULL, 1, 1, '2026-01-15 20:25:47.193');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_org";
CREATE TABLE "public"."sys_org" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "type" int4
)
;
COMMENT ON COLUMN "public"."sys_org"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_org"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_org"."type" IS '类型';
COMMENT ON TABLE "public"."sys_org" IS '组织架构投影';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO "public"."sys_org" VALUES ('d1000', 'XX科技', 1);
INSERT INTO "public"."sys_org" VALUES ('d1100', '北京分公司', 1);
INSERT INTO "public"."sys_org" VALUES ('d1110', '北京分公司销售部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1111', '北京分公司销售部一组', 1);
INSERT INTO "public"."sys_org" VALUES ('d1112', '北京分公司销售部二组', 1);
INSERT INTO "public"."sys_org" VALUES ('d1120', '北京分公司人事部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1130', '北京分公司财务部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1140', '北京分公司综合部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1200', '上海分公司', 1);
INSERT INTO "public"."sys_org" VALUES ('d1210', '上海分公司销售部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1220', '上海分公司人事部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1230', '上海分公司财务部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1300', '广州分公司', 1);
INSERT INTO "public"."sys_org" VALUES ('d1310', '广州分公司综合部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1320', '广州分公司销售部', 1);
INSERT INTO "public"."sys_org" VALUES ('d1330', '广州分公司人事部', 1);
INSERT INTO "public"."sys_org" VALUES ('u1', '管理员', 2);
INSERT INTO "public"."sys_org" VALUES ('u2', '小狐狸', 2);
INSERT INTO "public"."sys_org" VALUES ('u3', '张三', 2);
INSERT INTO "public"."sys_org" VALUES ('u4', '李四', 2);
INSERT INTO "public"."sys_org" VALUES ('u5', '王五', 2);
INSERT INTO "public"."sys_org" VALUES ('u6', '赵六', 2);
INSERT INTO "public"."sys_org" VALUES ('u7', '孙七', 2);
INSERT INTO "public"."sys_org" VALUES ('u8', '周八', 2);
INSERT INTO "public"."sys_org" VALUES ('u9', '吴九', 2);
INSERT INTO "public"."sys_org" VALUES ('p2001', '董事长', 4);
INSERT INTO "public"."sys_org" VALUES ('p2002', '北京分公司总经理', 4);
INSERT INTO "public"."sys_org" VALUES ('p2003', '北京分公司销售部长', 4);
INSERT INTO "public"."sys_org" VALUES ('p2004', '北京分公司销售经理', 4);
INSERT INTO "public"."sys_org" VALUES ('g3001', '北京分公司管理组', 8);
INSERT INTO "public"."sys_org" VALUES ('g3002', '北京分公司销售员', 8);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oss";
CREATE TABLE "public"."sys_oss" (
  "oss_id" int8 NOT NULL,
  "create_by" int8,
  "create_dept" int8,
  "create_time" timestamp(6),
  "ext1" varchar(255) COLLATE "pg_catalog"."default",
  "file_name" varchar(255) COLLATE "pg_catalog"."default",
  "file_suffix" varchar(255) COLLATE "pg_catalog"."default",
  "original_name" varchar(255) COLLATE "pg_catalog"."default",
  "search_value" varchar(255) COLLATE "pg_catalog"."default",
  "service" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" varchar(255) COLLATE "pg_catalog"."default",
  "update_by" int8,
  "update_time" timestamp(6),
  "url" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oss_config";
CREATE TABLE "public"."sys_oss_config" (
  "oss_config_id" int8 NOT NULL,
  "access_key" varchar(255) COLLATE "pg_catalog"."default",
  "access_policy" varchar(255) COLLATE "pg_catalog"."default",
  "bucket_name" varchar(255) COLLATE "pg_catalog"."default",
  "config_key" varchar(255) COLLATE "pg_catalog"."default",
  "create_by" int8,
  "create_dept" int8,
  "create_time" timestamp(6),
  "domain" varchar(255) COLLATE "pg_catalog"."default",
  "endpoint" varchar(255) COLLATE "pg_catalog"."default",
  "ext1" varchar(255) COLLATE "pg_catalog"."default",
  "is_https" varchar(255) COLLATE "pg_catalog"."default",
  "prefix" varchar(255) COLLATE "pg_catalog"."default",
  "region" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "search_value" varchar(255) COLLATE "pg_catalog"."default",
  "secret_key" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "update_by" int8,
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_post";
CREATE TABLE "public"."sys_post" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "depid" varchar(36) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "tier" varchar(512) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_post"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_post"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_post"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_post"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_post"."depid" IS '部门ID';
COMMENT ON COLUMN "public"."sys_post"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_post"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_post"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_post"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_post"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_post"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_post"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."sys_post" IS '组织架构-岗位';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO "public"."sys_post" VALUES ('p2001', 't', '2026-01-15 20:24:42.851', NULL, 'd1000', NULL, '董事长', NULL, 2001, '_d1000_p2001_', NULL, NULL);
INSERT INTO "public"."sys_post" VALUES ('p2002', 't', '2026-01-15 20:24:43.062', NULL, 'd1100', NULL, '北京分公司总经理', NULL, 2002, '_d1000_d1100_p2002_', NULL, NULL);
INSERT INTO "public"."sys_post" VALUES ('p2003', 't', '2026-01-15 20:24:43.87', NULL, 'd1110', NULL, '北京分公司销售部长', NULL, 2003, '_d1000_d1100_d1110_p2003_', NULL, NULL);
INSERT INTO "public"."sys_post" VALUES ('p2004', 't', '2026-01-15 20:24:44.882', NULL, 'd1111', NULL, '北京分公司销售经理', NULL, 2004, '_d1000_d1100_d1110_d1111_p2004_', NULL, NULL);

-- ----------------------------
-- Table structure for sys_post_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_post_org";
CREATE TABLE "public"."sys_post_org" (
  "pid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "oid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of sys_post_org
-- ----------------------------
INSERT INTO "public"."sys_post_org" VALUES ('p2001', 'u3');
INSERT INTO "public"."sys_post_org" VALUES ('p2002', 'u4');
INSERT INTO "public"."sys_post_org" VALUES ('p2003', 'u5');
INSERT INTO "public"."sys_post_org" VALUES ('p2004', 'u6');
INSERT INTO "public"."sys_post_org" VALUES ('p2004', 'u7');

-- ----------------------------
-- Table structure for sys_rece
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_rece";
CREATE TABLE "public"."sys_rece" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "oid" varchar(36) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "useid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_rece"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_rece"."oid" IS '最近使用的组织架构ID';
COMMENT ON COLUMN "public"."sys_rece"."uptim" IS '最近使用的组织架构ID';
COMMENT ON COLUMN "public"."sys_rece"."useid" IS '用户ID';
COMMENT ON TABLE "public"."sys_rece" IS '组织架构-最近访问记录';

-- ----------------------------
-- Records of sys_rece
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "scope" int4,
  "type" int4,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_role"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_role"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_role"."name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_role"."scope" IS '数据权限';
COMMENT ON COLUMN "public"."sys_role"."type" IS '角色类型';
COMMENT ON COLUMN "public"."sys_role"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."upuid" IS '更新人ID';
COMMENT ON TABLE "public"."sys_role" IS '权限角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, 't', '2026-01-15 20:25:17.027', NULL, '管理员', '拥有所有权限', 1, NULL, NULL, '2026-01-15 20:25:17.027', NULL);
INSERT INTO "public"."sys_role" VALUES (2, 't', '2026-01-15 20:25:18.186', NULL, '普通用户', '只包含流程使用权限', 2, NULL, NULL, '2026-01-15 20:25:18.186', NULL);

-- ----------------------------
-- Table structure for sys_role_api
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_api";
CREATE TABLE "public"."sys_role_api" (
  "rid" int8 NOT NULL,
  "aid" int8 NOT NULL
)
;

-- ----------------------------
-- Records of sys_role_api
-- ----------------------------
INSERT INTO "public"."sys_role_api" VALUES (1, 101001);
INSERT INTO "public"."sys_role_api" VALUES (1, 101002);
INSERT INTO "public"."sys_role_api" VALUES (1, 101003);
INSERT INTO "public"."sys_role_api" VALUES (1, 102001);
INSERT INTO "public"."sys_role_api" VALUES (1, 102002);
INSERT INTO "public"."sys_role_api" VALUES (1, 102003);
INSERT INTO "public"."sys_role_api" VALUES (1, 102004);
INSERT INTO "public"."sys_role_api" VALUES (1, 102005);
INSERT INTO "public"."sys_role_api" VALUES (1, 103001);
INSERT INTO "public"."sys_role_api" VALUES (1, 103002);
INSERT INTO "public"."sys_role_api" VALUES (1, 103003);
INSERT INTO "public"."sys_role_api" VALUES (1, 104001);
INSERT INTO "public"."sys_role_api" VALUES (1, 104002);
INSERT INTO "public"."sys_role_api" VALUES (1, 104003);
INSERT INTO "public"."sys_role_api" VALUES (1, 104004);
INSERT INTO "public"."sys_role_api" VALUES (1, 104005);
INSERT INTO "public"."sys_role_api" VALUES (1, 104006);
INSERT INTO "public"."sys_role_api" VALUES (1, 105001);
INSERT INTO "public"."sys_role_api" VALUES (1, 105002);
INSERT INTO "public"."sys_role_api" VALUES (1, 105003);
INSERT INTO "public"."sys_role_api" VALUES (1, 106001);
INSERT INTO "public"."sys_role_api" VALUES (1, 106002);
INSERT INTO "public"."sys_role_api" VALUES (1, 106003);
INSERT INTO "public"."sys_role_api" VALUES (1, 107001);
INSERT INTO "public"."sys_role_api" VALUES (1, 107002);
INSERT INTO "public"."sys_role_api" VALUES (1, 107003);
INSERT INTO "public"."sys_role_api" VALUES (1, 108001);
INSERT INTO "public"."sys_role_api" VALUES (1, 108002);
INSERT INTO "public"."sys_role_api" VALUES (1, 108003);
INSERT INTO "public"."sys_role_api" VALUES (1, 109001);
INSERT INTO "public"."sys_role_api" VALUES (1, 109002);
INSERT INTO "public"."sys_role_api" VALUES (1, 109003);
INSERT INTO "public"."sys_role_api" VALUES (1, 201001);
INSERT INTO "public"."sys_role_api" VALUES (1, 201002);
INSERT INTO "public"."sys_role_api" VALUES (1, 202001);
INSERT INTO "public"."sys_role_api" VALUES (1, 202002);
INSERT INTO "public"."sys_role_api" VALUES (1, 203001);
INSERT INTO "public"."sys_role_api" VALUES (1, 203002);
INSERT INTO "public"."sys_role_api" VALUES (1, 204001);
INSERT INTO "public"."sys_role_api" VALUES (1, 205001);
INSERT INTO "public"."sys_role_api" VALUES (1, 206001);
INSERT INTO "public"."sys_role_api" VALUES (1, 206002);
INSERT INTO "public"."sys_role_api" VALUES (1, 206003);
INSERT INTO "public"."sys_role_api" VALUES (1, 206101);
INSERT INTO "public"."sys_role_api" VALUES (1, 206102);
INSERT INTO "public"."sys_role_api" VALUES (1, 301001);
INSERT INTO "public"."sys_role_api" VALUES (1, 301002);
INSERT INTO "public"."sys_role_api" VALUES (1, 301003);
INSERT INTO "public"."sys_role_api" VALUES (1, 301004);
INSERT INTO "public"."sys_role_api" VALUES (1, 301005);
INSERT INTO "public"."sys_role_api" VALUES (1, 301006);
INSERT INTO "public"."sys_role_api" VALUES (1, 302001);
INSERT INTO "public"."sys_role_api" VALUES (1, 302002);
INSERT INTO "public"."sys_role_api" VALUES (1, 302003);
INSERT INTO "public"."sys_role_api" VALUES (1, 603001);
INSERT INTO "public"."sys_role_api" VALUES (1, 603002);
INSERT INTO "public"."sys_role_api" VALUES (1, 603003);
INSERT INTO "public"."sys_role_api" VALUES (2, 603001);
INSERT INTO "public"."sys_role_api" VALUES (2, 603002);
INSERT INTO "public"."sys_role_api" VALUES (2, 603003);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "rid" int8 NOT NULL,
  "mid" int8 NOT NULL
)
;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "public"."sys_role_menu" VALUES (1, 1000);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1010);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1020);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1021);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1030);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1040);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1050);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1060);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1070);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1071);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1080);
INSERT INTO "public"."sys_role_menu" VALUES (1, 1090);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2000);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2010);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2020);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2030);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2040);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2050);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2060);
INSERT INTO "public"."sys_role_menu" VALUES (1, 2061);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3000);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3010);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3020);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3030);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3040);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3041);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3050);
INSERT INTO "public"."sys_role_menu" VALUES (1, 3051);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6000);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6010);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6020);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6021);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6030);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6031);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6032);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6040);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6050);
INSERT INTO "public"."sys_role_menu" VALUES (1, 6051);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6000);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6010);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6020);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6021);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6030);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6031);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6032);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6040);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6050);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6051);

-- ----------------------------
-- Table structure for sys_role_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_org";
CREATE TABLE "public"."sys_role_org" (
  "rid" int8 NOT NULL,
  "oid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of sys_role_org
-- ----------------------------
INSERT INTO "public"."sys_role_org" VALUES (1, 'u2');
INSERT INTO "public"."sys_role_org" VALUES (1, 'u3');
INSERT INTO "public"."sys_role_org" VALUES (1, 'u4');
INSERT INTO "public"."sys_role_org" VALUES (1, 'u5');
INSERT INTO "public"."sys_role_org" VALUES (2, 'u6');
INSERT INTO "public"."sys_role_org" VALUES (2, 'u7');
INSERT INTO "public"."sys_role_org" VALUES (2, 'u8');
INSERT INTO "public"."sys_role_org" VALUES (2, 'u9');

-- ----------------------------
-- Table structure for sys_social
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_social";
CREATE TABLE "public"."sys_social" (
  "id" int8 NOT NULL,
  "access_code" varchar(255) COLLATE "pg_catalog"."default",
  "access_token" varchar(255) COLLATE "pg_catalog"."default",
  "auth_id" varchar(255) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "create_by" varchar(255) COLLATE "pg_catalog"."default",
  "create_dept" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "expire_in" int4 NOT NULL,
  "id_token" varchar(255) COLLATE "pg_catalog"."default",
  "mac_algorithm" varchar(255) COLLATE "pg_catalog"."default",
  "mac_key" varchar(255) COLLATE "pg_catalog"."default",
  "nick_name" varchar(255) COLLATE "pg_catalog"."default",
  "oauth_token" varchar(255) COLLATE "pg_catalog"."default",
  "oauth_token_secret" varchar(255) COLLATE "pg_catalog"."default",
  "open_id" varchar(255) COLLATE "pg_catalog"."default",
  "refresh_token" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "source" varchar(255) COLLATE "pg_catalog"."default",
  "token_type" varchar(255) COLLATE "pg_catalog"."default",
  "union_id" varchar(255) COLLATE "pg_catalog"."default",
  "update_by" varchar(255) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "user_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_social"."id" IS '主键ID';
COMMENT ON TABLE "public"."sys_social" IS '三方登录';

-- ----------------------------
-- Records of sys_social
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "arcod" varchar(64) COLLATE "pg_catalog"."default",
  "arnam" varchar(64) COLLATE "pg_catalog"."default",
  "avatar" varchar(128) COLLATE "pg_catalog"."default",
  "avtag" bool,
  "catag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(32) COLLATE "pg_catalog"."default",
  "depid" varchar(36) COLLATE "pg_catalog"."default",
  "email" varchar(32) COLLATE "pg_catalog"."default",
  "gender" varchar(8) COLLATE "pg_catalog"."default",
  "job" varchar(64) COLLATE "pg_catalog"."default",
  "jotyp" bool,
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "loip" varchar(20) COLLATE "pg_catalog"."default",
  "lotim" timestamp(6),
  "monum" varchar(16) COLLATE "pg_catalog"."default",
  "name" varchar(16) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "oftim" timestamp(6),
  "ornum" int4,
  "password" varchar(64) COLLATE "pg_catalog"."default",
  "tier" varchar(512) COLLATE "pg_catalog"."default",
  "type" int4,
  "uptim" timestamp(6),
  "upuid" varchar(32) COLLATE "pg_catalog"."default",
  "username" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_user"."arcod" IS '地区编号';
COMMENT ON COLUMN "public"."sys_user"."arnam" IS '地区名称';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像url';
COMMENT ON COLUMN "public"."sys_user"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_user"."catag" IS '缓存标记';
COMMENT ON COLUMN "public"."sys_user"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_user"."depid" IS '部门ID';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别';
COMMENT ON COLUMN "public"."sys_user"."job" IS '职务';
COMMENT ON COLUMN "public"."sys_user"."jotyp" IS '直接可加还是需要同意后再加';
COMMENT ON COLUMN "public"."sys_user"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_user"."loip" IS '登录IP';
COMMENT ON COLUMN "public"."sys_user"."lotim" IS '登录时间';
COMMENT ON COLUMN "public"."sys_user"."monum" IS '手机号';
COMMENT ON COLUMN "public"."sys_user"."name" IS '姓名（昵称）';
COMMENT ON COLUMN "public"."sys_user"."notes" IS 'notes';
COMMENT ON COLUMN "public"."sys_user"."oftim" IS '最后离开时间';
COMMENT ON COLUMN "public"."sys_user"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_user"."type" IS '用户类别';
COMMENT ON COLUMN "public"."sys_user"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user"."upuid" IS '更新人ID';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名（账号）';
COMMENT ON TABLE "public"."sys_user" IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('u1', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1000', 'vben@qq.com', '1', NULL, NULL, NULL, NULL, NULL, '13812345678', '管理员', '管理员不给修改', NULL, 1, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_u1_', NULL, NULL, NULL, 'admin');
INSERT INTO "public"."sys_user" VALUES ('u2', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1000', NULL, '2', NULL, NULL, NULL, NULL, NULL, '13912345678', '小狐狸', NULL, NULL, 2, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_u2_', NULL, NULL, NULL, 'vben');
INSERT INTO "public"."sys_user" VALUES ('u3', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', NULL, NULL, 3, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_u3_', NULL, NULL, NULL, 'zs');
INSERT INTO "public"."sys_user" VALUES ('u4', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', NULL, NULL, 4, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_d1100_u4_', NULL, NULL, NULL, 'ls');
INSERT INTO "public"."sys_user" VALUES ('u5', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '王五', NULL, NULL, 5, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_d1100_d1110_u5_', NULL, NULL, NULL, 'ww');
INSERT INTO "public"."sys_user" VALUES ('u6', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '赵六', NULL, NULL, 6, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_d1100_d1110_d1111_u6_', NULL, NULL, NULL, 'zl');
INSERT INTO "public"."sys_user" VALUES ('u7', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '孙七', NULL, NULL, 7, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_d1100_d1110_d1111_u7_', NULL, NULL, NULL, 'sq');
INSERT INTO "public"."sys_user" VALUES ('u8', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '周八', NULL, NULL, 8, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_d1100_d1110_d1111_u8_', NULL, NULL, NULL, 'zb');
INSERT INTO "public"."sys_user" VALUES ('u9', NULL, NULL, NULL, 't', 't', '2026-01-15 20:24:36.651', NULL, 'd1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吴九', NULL, NULL, 9, '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', '_d1000_d1100_d1110_d1111_u9_', NULL, NULL, NULL, 'wj');

-- ----------------------------
-- Table structure for tool_code_field
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_code_field";
CREATE TABLE "public"."tool_code_field" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "length" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "notes" varchar(128) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "remark" varchar(32) COLLATE "pg_catalog"."default",
  "type" varchar(32) COLLATE "pg_catalog"."default",
  "tabid" int8
)
;
COMMENT ON COLUMN "public"."tool_code_field"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_code_field"."length" IS '字段长度';
COMMENT ON COLUMN "public"."tool_code_field"."name" IS '字段名称';
COMMENT ON COLUMN "public"."tool_code_field"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_code_field"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_code_field"."remark" IS '字段描述';
COMMENT ON COLUMN "public"."tool_code_field"."type" IS '字段类型';
COMMENT ON TABLE "public"."tool_code_field" IS '代码生成-字段';

-- ----------------------------
-- Records of tool_code_field
-- ----------------------------

-- ----------------------------
-- Table structure for tool_code_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_code_table";
CREATE TABLE "public"."tool_code_table" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "name" varchar(126) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default",
  "addbt" bool,
  "baent" varchar(64) COLLATE "pg_catalog"."default",
  "bunam" varchar(64) COLLATE "pg_catalog"."default",
  "delbt" bool,
  "edtyp" varchar(32) COLLATE "pg_catalog"."default",
  "expbt" bool,
  "impbt" bool,
  "orfie" varchar(32) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "ortyp" varchar(32) COLLATE "pg_catalog"."default",
  "panam" varchar(32) COLLATE "pg_catalog"."default",
  "pecol" int4,
  "pmeid" varchar(32) COLLATE "pg_catalog"."default",
  "porid" varchar(32) COLLATE "pg_catalog"."default",
  "remark" varchar(64) COLLATE "pg_catalog"."default",
  "rotyp" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."tool_code_table"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_code_table"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."tool_code_table"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_code_table"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."tool_code_table"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_code_table"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_code_table"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_code_table"."upuid" IS '更新人ID';
COMMENT ON COLUMN "public"."tool_code_table"."addbt" IS '新增按钮';
COMMENT ON COLUMN "public"."tool_code_table"."baent" IS '继承基类';
COMMENT ON COLUMN "public"."tool_code_table"."bunam" IS '实体类';
COMMENT ON COLUMN "public"."tool_code_table"."delbt" IS '删除按钮';
COMMENT ON COLUMN "public"."tool_code_table"."edtyp" IS '编辑页类型';
COMMENT ON COLUMN "public"."tool_code_table"."expbt" IS '导出按钮';
COMMENT ON COLUMN "public"."tool_code_table"."impbt" IS '导入按钮';
COMMENT ON COLUMN "public"."tool_code_table"."orfie" IS '排序字段';
COMMENT ON COLUMN "public"."tool_code_table"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_code_table"."ortyp" IS 'orm类型';
COMMENT ON COLUMN "public"."tool_code_table"."panam" IS '基础包名';
COMMENT ON COLUMN "public"."tool_code_table"."pecol" IS '每行列数';
COMMENT ON COLUMN "public"."tool_code_table"."pmeid" IS '上级菜单ID';
COMMENT ON COLUMN "public"."tool_code_table"."porid" IS '所属门户ID';
COMMENT ON COLUMN "public"."tool_code_table"."remark" IS '表描述';
COMMENT ON COLUMN "public"."tool_code_table"."rotyp" IS '路由类型';
COMMENT ON TABLE "public"."tool_code_table" IS '代码生成-表格';

-- ----------------------------
-- Records of tool_code_table
-- ----------------------------

-- ----------------------------
-- Table structure for tool_dict_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_dict_cate";
CREATE TABLE "public"."tool_dict_cate" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "ornum" int4
)
;
COMMENT ON COLUMN "public"."tool_dict_cate"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_dict_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_dict_cate"."ornum" IS '排序号';
COMMENT ON TABLE "public"."tool_dict_cate" IS '字典分类';

-- ----------------------------
-- Records of tool_dict_cate
-- ----------------------------

-- ----------------------------
-- Table structure for tool_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_dict_data";
CREATE TABLE "public"."tool_dict_data" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "dalab" varchar(64) COLLATE "pg_catalog"."default",
  "daval" varchar(32) COLLATE "pg_catalog"."default",
  "detag" bool,
  "dicid" int8,
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "shsty" varchar(32) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."tool_dict_data"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_dict_data"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."tool_dict_data"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_dict_data"."dalab" IS '数据标签';
COMMENT ON COLUMN "public"."tool_dict_data"."daval" IS '数据键值';
COMMENT ON COLUMN "public"."tool_dict_data"."detag" IS '默认标记';
COMMENT ON COLUMN "public"."tool_dict_data"."dicid" IS '字典ID';
COMMENT ON COLUMN "public"."tool_dict_data"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_dict_data"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_dict_data"."shsty" IS '显示样式';
COMMENT ON COLUMN "public"."tool_dict_data"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."tool_dict_data" IS '字典数据';

-- ----------------------------
-- Records of tool_dict_data
-- ----------------------------
INSERT INTO "public"."tool_dict_data" VALUES (101, 't', '2026-01-15 20:25:47.427', '新增', '1', NULL, 1, NULL, 1, 'primary', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (102, 't', '2026-01-15 20:25:47.427', '修改', '2', NULL, 1, NULL, 2, 'primary', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (103, 't', '2026-01-15 20:25:47.427', '删除', '3', NULL, 1, NULL, 3, 'danger', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (104, 't', '2026-01-15 20:25:47.427', '授权', '4', NULL, 1, NULL, 4, 'primary', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (105, 't', '2026-01-15 20:25:47.427', '导出', '5', NULL, 1, NULL, 5, 'warning', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (106, 't', '2026-01-15 20:25:47.427', '导入', '6', NULL, 1, NULL, 6, 'warning', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (107, 't', '2026-01-15 20:25:47.427', '强退', '7', NULL, 1, NULL, 7, 'danger', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (108, 't', '2026-01-15 20:25:47.427', '生成代码', '8', NULL, 1, NULL, 8, 'warning', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (109, 't', '2026-01-15 20:25:47.427', '清空数据', '9', NULL, 1, NULL, 9, 'danger', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (199, 't', '2026-01-15 20:25:47.427', '其他操作', '0', NULL, 1, NULL, 99, 'warning', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (201, 't', '2026-01-15 20:25:47.427', '密码认证', 'password', NULL, 2, NULL, 1, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (202, 't', '2026-01-15 20:25:47.427', '短信认证', 'sms', NULL, 2, NULL, 2, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (203, 't', '2026-01-15 20:25:47.427', '邮箱认证', 'email', NULL, 2, NULL, 3, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (204, 't', '2026-01-15 20:25:47.427', '小程序认证', 'xcx', NULL, 2, NULL, 4, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (205, 't', '2026-01-15 20:25:47.427', '三方登录认证', 'social', NULL, 2, NULL, 5, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (301, 't', '2026-01-15 20:25:47.427', 'PC', 'PC', NULL, 3, NULL, 1, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (302, 't', '2026-01-15 20:25:47.427', '安卓', 'android', NULL, 3, NULL, 2, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (303, 't', '2026-01-15 20:25:47.427', '苹果', 'IOS', NULL, 3, NULL, 3, 'default', '2026-01-15 20:25:47.427');
INSERT INTO "public"."tool_dict_data" VALUES (304, 't', '2026-01-15 20:25:47.427', '小程序', 'XCX', NULL, 3, NULL, 4, 'default', '2026-01-15 20:25:47.427');

-- ----------------------------
-- Table structure for tool_dict_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_dict_main";
CREATE TABLE "public"."tool_dict_main" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "catid" int8,
  "code" varchar(64) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."tool_dict_main"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_dict_main"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."tool_dict_main"."catid" IS '分类ID';
COMMENT ON COLUMN "public"."tool_dict_main"."code" IS '字典代码';
COMMENT ON COLUMN "public"."tool_dict_main"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_dict_main"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_dict_main"."notes" IS '名称';
COMMENT ON COLUMN "public"."tool_dict_main"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_dict_main"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."tool_dict_main" IS '字典信息';

-- ----------------------------
-- Records of tool_dict_main
-- ----------------------------
INSERT INTO "public"."tool_dict_main" VALUES (1, NULL, NULL, 'sys_oper_type', '2026-01-15 20:25:47.427', '操作类型', NULL, 1, NULL);
INSERT INTO "public"."tool_dict_main" VALUES (2, NULL, NULL, 'sys_grant_type', '2026-01-15 20:25:47.427', '授权类型', NULL, 2, NULL);
INSERT INTO "public"."tool_dict_main" VALUES (3, NULL, NULL, 'sys_device_type', '2026-01-15 20:25:47.427', '设备类型', NULL, 3, NULL);

-- ----------------------------
-- Table structure for tool_form
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_form";
CREATE TABLE "public"."tool_form" (
  "id" int8 NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default",
  "name" varchar(126) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default",
  "frule" oid
)
;
COMMENT ON COLUMN "public"."tool_form"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_form"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."tool_form"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_form"."cruid" IS '创建人ID';
COMMENT ON COLUMN "public"."tool_form"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_form"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_form"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_form"."upuid" IS '更新人ID';
COMMENT ON COLUMN "public"."tool_form"."frule" IS '表单规则';
COMMENT ON TABLE "public"."tool_form" IS '在线表单';

-- ----------------------------
-- Records of tool_form
-- ----------------------------

-- ----------------------------
-- Table structure for tool_num
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_num";
CREATE TABLE "public"."tool_num" (
  "id" varchar(8) COLLATE "pg_catalog"."default" NOT NULL,
  "avtag" bool,
  "crtim" timestamp(6),
  "cudat" varchar(8) COLLATE "pg_catalog"."default",
  "label" varchar(100) COLLATE "pg_catalog"."default",
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "nflag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "nulen" int4,
  "numod" varchar(32) COLLATE "pg_catalog"."default",
  "nunex" varchar(8) COLLATE "pg_catalog"."default",
  "nupre" varchar(32) COLLATE "pg_catalog"."default",
  "ornum" int4,
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."tool_num"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_num"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."tool_num"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_num"."cudat" IS '当前日期';
COMMENT ON COLUMN "public"."tool_num"."label" IS '标签';
COMMENT ON COLUMN "public"."tool_num"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_num"."nflag" IS '是否被修改过或新添加的';
COMMENT ON COLUMN "public"."tool_num"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_num"."nulen" IS '编号长度';
COMMENT ON COLUMN "public"."tool_num"."numod" IS '生成模式';
COMMENT ON COLUMN "public"."tool_num"."nunex" IS '下一个编号';
COMMENT ON COLUMN "public"."tool_num"."nupre" IS '编号前缀';
COMMENT ON COLUMN "public"."tool_num"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_num"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."tool_num" IS '编号信息';

-- ----------------------------
-- Records of tool_num
-- ----------------------------
INSERT INTO "public"."tool_num" VALUES ('BUS', 't', '2026-01-15 20:25:51.774', NULL, NULL, '流程编号', 't', NULL, 4, 'YYYYMMDD', NULL, 'BUS', 1, '2026-01-15 20:25:51.774');

-- ----------------------------
-- Table structure for tool_oss_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_oss_file";
CREATE TABLE "public"."tool_oss_file" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "crtim" timestamp(6),
  "fsize" int8,
  "md5" varchar(32) COLLATE "pg_catalog"."default",
  "path" varchar(255) COLLATE "pg_catalog"."default",
  "service" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."tool_oss_file"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_oss_file"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_oss_file"."fsize" IS '文件大小';
COMMENT ON COLUMN "public"."tool_oss_file"."md5" IS '文件md5';
COMMENT ON COLUMN "public"."tool_oss_file"."path" IS '存储地址';
COMMENT ON COLUMN "public"."tool_oss_file"."service" IS '服务商';
COMMENT ON TABLE "public"."tool_oss_file" IS 'OSS存储文件';

-- ----------------------------
-- Records of tool_oss_file
-- ----------------------------

-- ----------------------------
-- Table structure for tool_oss_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_oss_main";
CREATE TABLE "public"."tool_oss_main" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "busid" varchar(32) COLLATE "pg_catalog"."default",
  "crtim" timestamp(6),
  "filid" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(32) COLLATE "pg_catalog"."default",
  "cruid" varchar(36) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."tool_oss_main"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tool_oss_main"."busid" IS '业务ID';
COMMENT ON COLUMN "public"."tool_oss_main"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_oss_main"."filid" IS '文件ID';
COMMENT ON COLUMN "public"."tool_oss_main"."name" IS '文件名称';
COMMENT ON COLUMN "public"."tool_oss_main"."type" IS '类型（后缀）';
COMMENT ON COLUMN "public"."tool_oss_main"."cruid" IS '创建人';
COMMENT ON TABLE "public"."tool_oss_main" IS 'OSS存储引用';

-- ----------------------------
-- Records of tool_oss_main
-- ----------------------------

-- ----------------------------
-- Indexes structure for table demo_link_cate
-- ----------------------------
CREATE INDEX "idx4uodprn78bsjiblaj6c7r7i2x" ON "public"."demo_link_cate" USING btree (
  "upuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idxayrvyxx7u0bcy0vk3llsvvic9" ON "public"."demo_link_cate" USING btree (
  "cruid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table demo_link_cate
-- ----------------------------
ALTER TABLE "public"."demo_link_cate" ADD CONSTRAINT "demo_link_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_link_item
-- ----------------------------
ALTER TABLE "public"."demo_link_item" ADD CONSTRAINT "demo_link_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table demo_link_main
-- ----------------------------
CREATE INDEX "idxmrbpe3to6clkknio0be0y1c7i" ON "public"."demo_link_main" USING btree (
  "cruid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idxxygc4hrd1ok9nayo79pt587f" ON "public"."demo_link_main" USING btree (
  "upuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table demo_link_main
-- ----------------------------
ALTER TABLE "public"."demo_link_main" ADD CONSTRAINT "demo_link_main_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_single_cate
-- ----------------------------
ALTER TABLE "public"."demo_single_cate" ADD CONSTRAINT "demo_single_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_single_main
-- ----------------------------
ALTER TABLE "public"."demo_single_main" ADD CONSTRAINT "demo_single_main_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_job_log
-- ----------------------------
ALTER TABLE "public"."mon_job_log" ADD CONSTRAINT "mon_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_job_main
-- ----------------------------
ALTER TABLE "public"."mon_job_main" ADD CONSTRAINT "mon_job_main_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_login_log
-- ----------------------------
ALTER TABLE "public"."mon_login_log" ADD CONSTRAINT "mon_login_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_oper_log
-- ----------------------------
ALTER TABLE "public"."mon_oper_log" ADD CONSTRAINT "mon_oper_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_api
-- ----------------------------
ALTER TABLE "public"."sys_api" ADD CONSTRAINT "sys_api_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "sys_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_corp
-- ----------------------------
ALTER TABLE "public"."sys_corp" ADD CONSTRAINT "sys_corp_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_corp_cate
-- ----------------------------
ALTER TABLE "public"."sys_corp_cate" ADD CONSTRAINT "sys_corp_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_group
-- ----------------------------
ALTER TABLE "public"."sys_group" ADD CONSTRAINT "sys_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_group_cate
-- ----------------------------
ALTER TABLE "public"."sys_group_cate" ADD CONSTRAINT "sys_group_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_org
-- ----------------------------
ALTER TABLE "public"."sys_org" ADD CONSTRAINT "sys_org_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_oss
-- ----------------------------
ALTER TABLE "public"."sys_oss" ADD CONSTRAINT "sys_oss_pkey" PRIMARY KEY ("oss_id");

-- ----------------------------
-- Primary Key structure for table sys_oss_config
-- ----------------------------
ALTER TABLE "public"."sys_oss_config" ADD CONSTRAINT "sys_oss_config_pkey" PRIMARY KEY ("oss_config_id");

-- ----------------------------
-- Primary Key structure for table sys_post
-- ----------------------------
ALTER TABLE "public"."sys_post" ADD CONSTRAINT "sys_post_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_rece
-- ----------------------------
ALTER TABLE "public"."sys_rece" ADD CONSTRAINT "sys_rece_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_social
-- ----------------------------
ALTER TABLE "public"."sys_social" ADD CONSTRAINT "sys_social_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_code_field
-- ----------------------------
ALTER TABLE "public"."tool_code_field" ADD CONSTRAINT "tool_code_field_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_code_table
-- ----------------------------
ALTER TABLE "public"."tool_code_table" ADD CONSTRAINT "tool_code_table_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_dict_cate
-- ----------------------------
ALTER TABLE "public"."tool_dict_cate" ADD CONSTRAINT "tool_dict_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_dict_data
-- ----------------------------
ALTER TABLE "public"."tool_dict_data" ADD CONSTRAINT "tool_dict_data_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_dict_main
-- ----------------------------
ALTER TABLE "public"."tool_dict_main" ADD CONSTRAINT "tool_dict_main_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_form
-- ----------------------------
ALTER TABLE "public"."tool_form" ADD CONSTRAINT "tool_form_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_num
-- ----------------------------
ALTER TABLE "public"."tool_num" ADD CONSTRAINT "tool_num_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tool_oss_file
-- ----------------------------
CREATE INDEX "idx3s53j69dg34b9sfa5khxwv851" ON "public"."tool_oss_file" USING btree (
  "md5" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tool_oss_file
-- ----------------------------
ALTER TABLE "public"."tool_oss_file" ADD CONSTRAINT "tool_oss_file_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_oss_main
-- ----------------------------
ALTER TABLE "public"."tool_oss_main" ADD CONSTRAINT "tool_oss_main_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table demo_link_item
-- ----------------------------
ALTER TABLE "public"."demo_link_item" ADD CONSTRAINT "fkmqvk73qkguqkxv3tfs7tsshhw" FOREIGN KEY ("maiid") REFERENCES "public"."demo_link_main" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table demo_link_main_org
-- ----------------------------
ALTER TABLE "public"."demo_link_main_org" ADD CONSTRAINT "fk5hfw169y82u7b9p7git01vn9o" FOREIGN KEY ("oid") REFERENCES "public"."sys_org" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."demo_link_main_org" ADD CONSTRAINT "fkcr7p2paxcale09e7jb8e24jht" FOREIGN KEY ("mid") REFERENCES "public"."demo_link_main" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_group_org
-- ----------------------------
ALTER TABLE "public"."sys_group_org" ADD CONSTRAINT "fk1bwurw1qpclf0a4metrfnn80g" FOREIGN KEY ("gid") REFERENCES "public"."sys_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_group_org" ADD CONSTRAINT "fkpb0mubk4w091htcrf62f1limm" FOREIGN KEY ("oid") REFERENCES "public"."sys_org" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_post_org
-- ----------------------------
ALTER TABLE "public"."sys_post_org" ADD CONSTRAINT "fk4xex2fhc89oce56occjp8nfkb" FOREIGN KEY ("oid") REFERENCES "public"."sys_org" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_post_org" ADD CONSTRAINT "fkpqbhtdl75qh9e7nxleiliemf8" FOREIGN KEY ("pid") REFERENCES "public"."sys_post" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_role_api
-- ----------------------------
ALTER TABLE "public"."sys_role_api" ADD CONSTRAINT "fkfbfuye05ikel5hpyimdf9h0mk" FOREIGN KEY ("rid") REFERENCES "public"."sys_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_role_api" ADD CONSTRAINT "fkjn3td9tgpjp62deyom8b6i5hv" FOREIGN KEY ("aid") REFERENCES "public"."sys_api" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "fk5grhomnyrb2nkm20ee7a2iv92" FOREIGN KEY ("mid") REFERENCES "public"."sys_menu" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "fk5pc0747orubmrx2oe86newexy" FOREIGN KEY ("rid") REFERENCES "public"."sys_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_role_org
-- ----------------------------
ALTER TABLE "public"."sys_role_org" ADD CONSTRAINT "fkgtmaw7jg7tw3uxal10bsk154" FOREIGN KEY ("rid") REFERENCES "public"."sys_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_role_org" ADD CONSTRAINT "fkmq1c5jp162oou5u0uvcc4dkm4" FOREIGN KEY ("oid") REFERENCES "public"."sys_org" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tool_code_field
-- ----------------------------
ALTER TABLE "public"."tool_code_field" ADD CONSTRAINT "fk9smrfy4b11ekpadloyrj26kly" FOREIGN KEY ("tabid") REFERENCES "public"."tool_code_table" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tool_oss_main
-- ----------------------------
ALTER TABLE "public"."tool_oss_main" ADD CONSTRAINT "fkdvq01dqhe2a7othacg8yyvsya" FOREIGN KEY ("cruid") REFERENCES "public"."sys_org" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
