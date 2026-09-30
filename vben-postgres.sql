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

 Date: 20/01/2026 16:25:58
*/


-- ----------------------------
-- Table structure for demo_link
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link";
CREATE TABLE "public"."demo_link" (
  "id" int8 NOT NULL,
  "catid" int8,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."demo_link"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."demo_link"."catid" IS '分类ID';
COMMENT ON COLUMN "public"."demo_link"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_link"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_link"."cruid" IS '创建人Id';
COMMENT ON COLUMN "public"."demo_link"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_link"."upuid" IS '修改人Id';
COMMENT ON COLUMN "public"."demo_link"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."demo_link"."notes" IS '备注';
COMMENT ON TABLE "public"."demo_link" IS '关联主表';

-- ----------------------------
-- Records of demo_link
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_actor
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link_actor";
CREATE TABLE "public"."demo_link_actor" (
  "mid" int8,
  "aid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."demo_link_actor"."mid" IS '主表ID';
COMMENT ON COLUMN "public"."demo_link_actor"."aid" IS '成员ID';
COMMENT ON TABLE "public"."demo_link_actor" IS '中间关联表';

-- ----------------------------
-- Records of demo_link_actor
-- ----------------------------

-- ----------------------------
-- Table structure for demo_link_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_link_cate";
CREATE TABLE "public"."demo_link_cate" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "pid" int8,
  "tier" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4
)
;
COMMENT ON COLUMN "public"."demo_link_cate"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."demo_link_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_link_cate"."pid" IS '父ID';
COMMENT ON COLUMN "public"."demo_link_cate"."tier" IS '层级信息';
COMMENT ON COLUMN "public"."demo_link_cate"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_link_cate"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."demo_link_cate"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_link_cate"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."demo_link_cate"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."demo_link_cate"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_link_cate"."ornum" IS '排序号';
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
  "name" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "maiid" int8,
  "ornum" int4,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."demo_link_item"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."demo_link_item"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_link_item"."maiid" IS '主表ID';
COMMENT ON COLUMN "public"."demo_link_item"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."demo_link_item"."notes" IS '备注';
COMMENT ON TABLE "public"."demo_link_item" IS '关联子表';

-- ----------------------------
-- Records of demo_link_item
-- ----------------------------

-- ----------------------------
-- Table structure for demo_single
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_single";
CREATE TABLE "public"."demo_single" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."demo_single"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."demo_single"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_single"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_single"."cruid" IS '创建人Id';
COMMENT ON COLUMN "public"."demo_single"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_single"."upuid" IS '修改人Id';
COMMENT ON COLUMN "public"."demo_single"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."demo_single"."notes" IS '备注';
COMMENT ON TABLE "public"."demo_single" IS '单一主表';

-- ----------------------------
-- Records of demo_single
-- ----------------------------

-- ----------------------------
-- Table structure for demo_single_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_single_cate";
CREATE TABLE "public"."demo_single_cate" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "pid" int8,
  "tier" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4
)
;
COMMENT ON COLUMN "public"."demo_single_cate"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."demo_single_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."demo_single_cate"."pid" IS '父ID';
COMMENT ON COLUMN "public"."demo_single_cate"."tier" IS '层级信息';
COMMENT ON COLUMN "public"."demo_single_cate"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."demo_single_cate"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."demo_single_cate"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."demo_single_cate"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."demo_single_cate"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."demo_single_cate"."notes" IS '备注';
COMMENT ON COLUMN "public"."demo_single_cate"."ornum" IS '排序号';
COMMENT ON TABLE "public"."demo_single_cate" IS '单一树表';

-- ----------------------------
-- Records of demo_single_cate
-- ----------------------------

-- ----------------------------
-- Table structure for mon_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_job";
CREATE TABLE "public"."mon_job" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4,
  "reurl" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "retyp" int4,
  "rehea" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "repar" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "cron" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."mon_job"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."mon_job"."code" IS '任务代码';
COMMENT ON COLUMN "public"."mon_job"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."mon_job"."reurl" IS '请求url';
COMMENT ON COLUMN "public"."mon_job"."retyp" IS '请求类型';
COMMENT ON COLUMN "public"."mon_job"."rehea" IS 'Headers';
COMMENT ON COLUMN "public"."mon_job"."repar" IS '请求参数';
COMMENT ON COLUMN "public"."mon_job"."cron" IS 'Cron表达式';
COMMENT ON COLUMN "public"."mon_job"."name" IS '名称';
COMMENT ON COLUMN "public"."mon_job"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."mon_job"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."mon_job"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."mon_job"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."mon_job"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."mon_job"."notes" IS '备注';
COMMENT ON TABLE "public"."mon_job" IS '定时任务';

-- ----------------------------
-- Records of mon_job
-- ----------------------------
INSERT INTO "public"."mon_job" VALUES ('801365969497755653', 'myjob', 0, 'Vben.Base.Mon.Job.Main.MyJob', 0, NULL, NULL, '["*/30 * * * * *",2]', '30秒钟执行一次的DEMO1', '2026-01-20 16:22:15.788695', NULL, NULL, NULL, 'f', NULL);
INSERT INTO "public"."mon_job" VALUES ('801365969531310085', 'myjob2', 0, 'Vben.Base.Mon.Job.Main.MyJob2', 0, NULL, NULL, '["@minutely",0]', '1分钟执行一次的DEMO2', '2026-01-20 16:22:15.796533', NULL, NULL, NULL, 'f', NULL);

-- ----------------------------
-- Table structure for mon_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_job_log";
CREATE TABLE "public"."mon_job_log" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "msg" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ret" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sttim" timestamp(6),
  "entim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."mon_job_log"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."mon_job_log"."name" IS '名称';
COMMENT ON COLUMN "public"."mon_job_log"."msg" IS '信息';
COMMENT ON COLUMN "public"."mon_job_log"."ret" IS '结果';
COMMENT ON COLUMN "public"."mon_job_log"."sttim" IS '开始时间';
COMMENT ON COLUMN "public"."mon_job_log"."entim" IS '结束时间';

-- ----------------------------
-- Records of mon_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for mon_log_audit
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_log_audit";
CREATE TABLE "public"."mon_log_audit" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "tablename" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "columnname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "newvalue" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "oldvalue" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "createdtime" timestamp(6),
  "userid" int8,
  "username" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "operate" int4
)
;
COMMENT ON COLUMN "public"."mon_log_audit"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."mon_log_audit"."tablename" IS '表名';
COMMENT ON COLUMN "public"."mon_log_audit"."columnname" IS '列名';
COMMENT ON COLUMN "public"."mon_log_audit"."newvalue" IS '新值';
COMMENT ON COLUMN "public"."mon_log_audit"."oldvalue" IS '旧值';
COMMENT ON COLUMN "public"."mon_log_audit"."createdtime" IS '操作时间';
COMMENT ON COLUMN "public"."mon_log_audit"."userid" IS '操作人Id';
COMMENT ON COLUMN "public"."mon_log_audit"."username" IS '操作人名称';
COMMENT ON COLUMN "public"."mon_log_audit"."operate" IS '操作方式：新增、更新、删除';
COMMENT ON TABLE "public"."mon_log_audit" IS '系统操作/审计日志表';

-- ----------------------------
-- Records of mon_log_audit
-- ----------------------------

-- ----------------------------
-- Table structure for mon_log_error
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_log_error";
CREATE TABLE "public"."mon_log_error" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "useid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "usena" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "username" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "clazz" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "method" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "exceptionname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "exceptionmsg" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "exceptionsource" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "error" text COLLATE "pg_catalog"."default",
  "param" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."mon_log_error"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."mon_log_error"."name" IS '操作名称';
COMMENT ON COLUMN "public"."mon_log_error"."useid" IS '用户ID';
COMMENT ON COLUMN "public"."mon_log_error"."usena" IS '用户姓名';
COMMENT ON COLUMN "public"."mon_log_error"."username" IS '用户账号';
COMMENT ON COLUMN "public"."mon_log_error"."clazz" IS '类名';
COMMENT ON COLUMN "public"."mon_log_error"."method" IS '方法名';
COMMENT ON COLUMN "public"."mon_log_error"."exceptionname" IS '异常名称';
COMMENT ON COLUMN "public"."mon_log_error"."exceptionmsg" IS '异常信息';
COMMENT ON COLUMN "public"."mon_log_error"."exceptionsource" IS '异常源';
COMMENT ON COLUMN "public"."mon_log_error"."error" IS '堆栈信息';
COMMENT ON COLUMN "public"."mon_log_error"."param" IS '参数对象';
COMMENT ON COLUMN "public"."mon_log_error"."crtim" IS '异常时间';
COMMENT ON TABLE "public"."mon_log_error" IS '错误日志';

-- ----------------------------
-- Records of mon_log_error
-- ----------------------------

-- ----------------------------
-- Table structure for mon_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_login_log";
CREATE TABLE "public"."mon_login_log" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "loip" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "loloc" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "os" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "clkey" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "detyp" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sutag" bool,
  "browser" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "agdet" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "lotim" timestamp(6),
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."mon_login_log"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."mon_login_log"."username" IS '用户账号';
COMMENT ON COLUMN "public"."mon_login_log"."loip" IS 'IP地址';
COMMENT ON COLUMN "public"."mon_login_log"."loloc" IS '登录地点';
COMMENT ON COLUMN "public"."mon_login_log"."os" IS '操作系统';
COMMENT ON COLUMN "public"."mon_login_log"."clkey" IS '客户端';
COMMENT ON COLUMN "public"."mon_login_log"."detyp" IS '设备类型';
COMMENT ON COLUMN "public"."mon_login_log"."sutag" IS '登录状态';
COMMENT ON COLUMN "public"."mon_login_log"."browser" IS '浏览器';
COMMENT ON COLUMN "public"."mon_login_log"."agdet" IS '客户端详情';
COMMENT ON COLUMN "public"."mon_login_log"."lotim" IS '登录时间';
COMMENT ON COLUMN "public"."mon_login_log"."name" IS '名称';
COMMENT ON TABLE "public"."mon_login_log" IS '登录日志表';

-- ----------------------------
-- Records of mon_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for mon_online_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_online_user";
CREATE TABLE "public"."mon_online_user" (
  "id" int8 NOT NULL,
  "tenid" int8 NOT NULL,
  "conid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "useid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "usena" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "nicna" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "cotim" timestamp(6) NOT NULL,
  "ip" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "browser" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "os" varchar(128) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."mon_online_user"."id" IS '主键Id';
COMMENT ON COLUMN "public"."mon_online_user"."tenid" IS '租户Id';
COMMENT ON COLUMN "public"."mon_online_user"."conid" IS '连接Id';
COMMENT ON COLUMN "public"."mon_online_user"."useid" IS '用户Id';
COMMENT ON COLUMN "public"."mon_online_user"."usena" IS '账号';
COMMENT ON COLUMN "public"."mon_online_user"."nicna" IS '真实姓名';
COMMENT ON COLUMN "public"."mon_online_user"."cotim" IS '连接时间';
COMMENT ON COLUMN "public"."mon_online_user"."ip" IS '连接IP';
COMMENT ON COLUMN "public"."mon_online_user"."browser" IS '浏览器';
COMMENT ON COLUMN "public"."mon_online_user"."os" IS '操作系统';
COMMENT ON TABLE "public"."mon_online_user" IS '在线用户';

-- ----------------------------
-- Records of mon_online_user
-- ----------------------------

-- ----------------------------
-- Table structure for mon_oper_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."mon_oper_log";
CREATE TABLE "public"."mon_oper_log" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "opmod" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "butyp" int4,
  "opuid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "opuna" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "username" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "clazz" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "remet" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "repar" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "optim" timestamp(6),
  "cotim" int8,
  "opip" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ageos" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "agbro" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "agdet" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sutag" bool
)
;
COMMENT ON COLUMN "public"."mon_oper_log"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."mon_oper_log"."opmod" IS '操作名称';
COMMENT ON COLUMN "public"."mon_oper_log"."butyp" IS '业务类型';
COMMENT ON COLUMN "public"."mon_oper_log"."opuid" IS '用户ID';
COMMENT ON COLUMN "public"."mon_oper_log"."opuna" IS '用户姓名';
COMMENT ON COLUMN "public"."mon_oper_log"."username" IS '用户账号';
COMMENT ON COLUMN "public"."mon_oper_log"."clazz" IS '类名';
COMMENT ON COLUMN "public"."mon_oper_log"."remet" IS '方法名';
COMMENT ON COLUMN "public"."mon_oper_log"."repar" IS '参数对象';
COMMENT ON COLUMN "public"."mon_oper_log"."optim" IS '操作时间';
COMMENT ON COLUMN "public"."mon_oper_log"."cotim" IS '耗时（毫秒）';
COMMENT ON COLUMN "public"."mon_oper_log"."opip" IS 'IP地址';
COMMENT ON COLUMN "public"."mon_oper_log"."ageos" IS '操作系统';
COMMENT ON COLUMN "public"."mon_oper_log"."agbro" IS '浏览器';
COMMENT ON COLUMN "public"."mon_oper_log"."agdet" IS '客户端详情';
COMMENT ON COLUMN "public"."mon_oper_log"."sutag" IS '成功标记';
COMMENT ON TABLE "public"."mon_oper_log" IS '操作日志';

-- ----------------------------
-- Records of mon_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_actor
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_actor";
CREATE TABLE "public"."sys_actor" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" int4
)
;
COMMENT ON COLUMN "public"."sys_actor"."id" IS 'ID';
COMMENT ON COLUMN "public"."sys_actor"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_actor"."type" IS '类型';
COMMENT ON TABLE "public"."sys_actor" IS '系统参与者';

-- ----------------------------
-- Records of sys_actor
-- ----------------------------
INSERT INTO "public"."sys_actor" VALUES ('o1000', 'XX科技', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1100', '北京分公司', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1110', '北京分公司销售部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1111', '北京分公司销售部一组', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1112', '北京分公司销售部二组', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1120', '北京分公司人事部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1130', '北京分公司财务部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1140', '北京分公司综合部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1200', '上海分公司', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1210', '上海分公司销售部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1220', '上海分公司人事部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1230', '上海分公司财务部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1300', '广州分公司', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1310', '广州分公司综合部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1320', '广州分公司销售部', 1);
INSERT INTO "public"."sys_actor" VALUES ('o1330', '广州分公司人事部', 1);
INSERT INTO "public"."sys_actor" VALUES ('u1', '管理员', 2);
INSERT INTO "public"."sys_actor" VALUES ('u2', '小狐狸', 2);
INSERT INTO "public"."sys_actor" VALUES ('u3', '张三', 2);
INSERT INTO "public"."sys_actor" VALUES ('u4', '李四', 2);
INSERT INTO "public"."sys_actor" VALUES ('u5', '王五', 2);
INSERT INTO "public"."sys_actor" VALUES ('u6', '赵六', 2);
INSERT INTO "public"."sys_actor" VALUES ('u7', '孙七', 2);
INSERT INTO "public"."sys_actor" VALUES ('u8', '周八', 2);
INSERT INTO "public"."sys_actor" VALUES ('u9', '吴九', 2);
INSERT INTO "public"."sys_actor" VALUES ('p2001', '董事长', 4);
INSERT INTO "public"."sys_actor" VALUES ('p2002', '北京分公司总经理', 4);
INSERT INTO "public"."sys_actor" VALUES ('p2003', '北京分公司销售部长', 4);
INSERT INTO "public"."sys_actor" VALUES ('p2004', '北京分公司销售经理', 4);
INSERT INTO "public"."sys_actor" VALUES ('g3001', '北京分公司管理组', 8);
INSERT INTO "public"."sys_actor" VALUES ('g3002', '北京分公司销售员', 8);

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_api";
CREATE TABLE "public"."sys_api" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "menid" int8,
  "ornum" int4,
  "perm" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "code" int8,
  "pos" int4,
  "type" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_api"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_api"."name" IS '接口名称';
COMMENT ON COLUMN "public"."sys_api"."menid" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_api"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_api"."perm" IS '权限字符';
COMMENT ON COLUMN "public"."sys_api"."code" IS '权限代码';
COMMENT ON COLUMN "public"."sys_api"."pos" IS '权限位';
COMMENT ON COLUMN "public"."sys_api"."type" IS '权限类型';
COMMENT ON COLUMN "public"."sys_api"."avtag" IS '是否可用';
COMMENT ON COLUMN "public"."sys_api"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_api"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_api"."uptim" IS '更新时间';
COMMENT ON TABLE "public"."sys_api" IS '权限接口';

-- ----------------------------
-- Records of sys_api
-- ----------------------------
INSERT INTO "public"."sys_api" VALUES (101001, '组织查询', 1010, 101001, 'sys:org:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580235', '2026-01-20 16:22:15.580235');
INSERT INTO "public"."sys_api" VALUES (101002, '组织编辑', 1010, 101002, 'sys:org:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580428', '2026-01-20 16:22:15.580428');
INSERT INTO "public"."sys_api" VALUES (101003, '组织删除', 1010, 101003, 'sys:org:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580429', '2026-01-20 16:22:15.580429');
INSERT INTO "public"."sys_api" VALUES (102001, '用户查询', 1020, 102001, 'sys:user:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580429', '2026-01-20 16:22:15.580429');
INSERT INTO "public"."sys_api" VALUES (102002, '用户编辑', 1020, 102002, 'sys:user:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580429', '2026-01-20 16:22:15.580429');
INSERT INTO "public"."sys_api" VALUES (102003, '用户删除', 1020, 102003, 'sys:user:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.58043', '2026-01-20 16:22:15.58043');
INSERT INTO "public"."sys_api" VALUES (102004, '用户启用禁用', 1020, 102004, 'sys:user:avtag', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.58043', '2026-01-20 16:22:15.58043');
INSERT INTO "public"."sys_api" VALUES (102005, '用户密码修改', 1020, 102005, 'sys:user:password', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.58043', '2026-01-20 16:22:15.58043');
INSERT INTO "public"."sys_api" VALUES (103001, '岗位查询', 1030, 103001, 'sys:post:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.58043', '2026-01-20 16:22:15.58043');
INSERT INTO "public"."sys_api" VALUES (103002, '岗位编辑', 1030, 103002, 'sys:post:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580431', '2026-01-20 16:22:15.580431');
INSERT INTO "public"."sys_api" VALUES (103003, '岗位删除', 1030, 103003, 'sys:post:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580431', '2026-01-20 16:22:15.580431');
INSERT INTO "public"."sys_api" VALUES (104001, '群组查询', 1040, 104001, 'sys:group:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580431', '2026-01-20 16:22:15.580431');
INSERT INTO "public"."sys_api" VALUES (104002, '群组编辑', 1040, 104002, 'sys:group:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580431', '2026-01-20 16:22:15.580431');
INSERT INTO "public"."sys_api" VALUES (104003, '群组删除', 1040, 104003, 'sys:group:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580431', '2026-01-20 16:22:15.580431');
INSERT INTO "public"."sys_api" VALUES (104004, '群组分类查询', 1040, 104004, 'sys:groupc:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580431', '2026-01-20 16:22:15.580431');
INSERT INTO "public"."sys_api" VALUES (104005, '群组分类编辑', 1040, 104005, 'sys:groupc:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580439', '2026-01-20 16:22:15.580439');
INSERT INTO "public"."sys_api" VALUES (104006, '群组分类删除', 1040, 104006, 'sys:groupc:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580439', '2026-01-20 16:22:15.580439');
INSERT INTO "public"."sys_api" VALUES (105001, '菜单查询', 1050, 105001, 'sys:menu:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.58044', '2026-01-20 16:22:15.58044');
INSERT INTO "public"."sys_api" VALUES (105002, '菜单编辑', 1050, 105002, 'sys:menu:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (105003, '菜单删除', 1050, 105003, 'sys:menu:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (106001, '接口查询', 1060, 106001, 'sys:api:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (106002, '接口编辑', 1060, 106002, 'sys:api:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (106003, '接口删除', 1060, 106003, 'sys:api:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (107001, '角色查询', 1070, 107001, 'sys:role:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (107002, '角色编辑', 1070, 107002, 'sys:role:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580441', '2026-01-20 16:22:15.580441');
INSERT INTO "public"."sys_api" VALUES (107003, '角色删除', 1070, 107003, 'sys:role:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (108001, '参数查询', 1080, 108001, 'sys:config:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (108002, '参数编辑', 1080, 108002, 'sys:config:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (108003, '参数删除', 1080, 108003, 'sys:config:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (109001, '通知查询', 1090, 109001, 'sys:notice:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (109002, '通知编辑', 1090, 109002, 'sys:notice:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (109003, '通知删除', 1090, 109003, 'sys:notice:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (201001, '在线用户查询', 2010, 201001, 'mon:online:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (201002, '在线用户强退', 2010, 201002, 'mon:online:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580442', '2026-01-20 16:22:15.580442');
INSERT INTO "public"."sys_api" VALUES (202001, '登录日志查询', 2020, 202001, 'mon:login:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (202002, '登录日志删除', 2020, 202002, 'mon:login:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (203001, '操作日志查询', 2030, 203001, 'mon:oper:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (203002, '操作日志删除', 2030, 203002, 'mon:oper:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (204001, '服务器信息查询', 2040, 204001, 'mon:server:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (205001, '缓存信息查询', 2050, 205001, 'mon:cache:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (206001, '定时任务查询', 2060, 206001, 'monjob:main:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (206002, '定时任务修改', 2060, 206002, 'monjob:main:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (206003, '定时任务执行', 2060, 206003, 'monjob:main:run', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580444', '2026-01-20 16:22:15.580444');
INSERT INTO "public"."sys_api" VALUES (206101, '定时任务日志查询', 2061, 206101, 'monjob:log:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (206102, '定时任务日志删除', 2061, 206102, 'monjob:log:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (301001, '字典查询', 3010, 301001, 'tooldict:main:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (301002, '字典修改', 3010, 301002, 'tooldict:main:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (301003, '字典删除', 3010, 301003, 'tooldict:main:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (301004, '字典数据查询', 3010, 301004, 'tooldict:data:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (301005, '字典数据编辑', 3010, 301005, 'tooldict:data:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (301006, '字典数据编辑', 3010, 301006, 'tooldict:data:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580445', '2026-01-20 16:22:15.580445');
INSERT INTO "public"."sys_api" VALUES (302001, '编号查询', 3020, 302001, 'tool:num:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580446', '2026-01-20 16:22:15.580446');
INSERT INTO "public"."sys_api" VALUES (302002, '编号编辑', 3020, 302002, 'tool:num:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580446', '2026-01-20 16:22:15.580446');
INSERT INTO "public"."sys_api" VALUES (302003, '编号删除', 3020, 302003, 'tool:num:delete', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.580446', '2026-01-20 16:22:15.580446');
INSERT INTO "public"."sys_api" VALUES (801001, '单一主表-查询', 8010, 801001, 'single:main:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595639', '2026-01-20 16:22:15.595639');
INSERT INTO "public"."sys_api" VALUES (801002, '单一主表-新增', 8010, 801002, 'single:main:add', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595642', '2026-01-20 16:22:15.595642');
INSERT INTO "public"."sys_api" VALUES (801003, '单一主表-修改', 8010, 801003, 'single:main:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595642', '2026-01-20 16:22:15.595642');
INSERT INTO "public"."sys_api" VALUES (801004, '单一主表-删除', 8010, 801004, 'single:main:remove', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595642', '2026-01-20 16:22:15.595642');
INSERT INTO "public"."sys_api" VALUES (802001, '单一树表-查询', 8020, 802001, 'single:cate:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595642', '2026-01-20 16:22:15.595642');
INSERT INTO "public"."sys_api" VALUES (802002, '单一树表-新增', 8020, 802002, 'single:cate:add', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595643', '2026-01-20 16:22:15.595643');
INSERT INTO "public"."sys_api" VALUES (802003, '单一树表-修改', 8020, 802003, 'single:cate:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595643', '2026-01-20 16:22:15.595643');
INSERT INTO "public"."sys_api" VALUES (802004, '单一树表-删除', 8020, 802004, 'single:cate:remove', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595643', '2026-01-20 16:22:15.595643');
INSERT INTO "public"."sys_api" VALUES (803001, '关联主表-查询', 8030, 803001, 'link:main:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595643', '2026-01-20 16:22:15.595643');
INSERT INTO "public"."sys_api" VALUES (803002, '关联主表-新增', 8030, 803002, 'link:main:add', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595643', '2026-01-20 16:22:15.595643');
INSERT INTO "public"."sys_api" VALUES (803003, '关联主表-修改', 8030, 803003, 'link:main:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595644', '2026-01-20 16:22:15.595644');
INSERT INTO "public"."sys_api" VALUES (803004, '关联主表-删除', 8030, 803004, 'link:main:remove', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595644', '2026-01-20 16:22:15.595644');
INSERT INTO "public"."sys_api" VALUES (803011, '关联树表-查询', 8030, 803011, 'link:cate:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595644', '2026-01-20 16:22:15.595644');
INSERT INTO "public"."sys_api" VALUES (803012, '关联树表-新增', 8030, 803012, 'link:cate:add', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595644', '2026-01-20 16:22:15.595644');
INSERT INTO "public"."sys_api" VALUES (803013, '关联树表-修改', 8030, 803013, 'link:cate:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595644', '2026-01-20 16:22:15.595644');
INSERT INTO "public"."sys_api" VALUES (803014, '关联树表-删除', 8030, 803014, 'link:cate:remove', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.595644', '2026-01-20 16:22:15.595644');
INSERT INTO "public"."sys_api" VALUES (603001, '流程查询', 6030, 603001, 'bpmbus:main:query', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.602159', '2026-01-20 16:22:15.602159');
INSERT INTO "public"."sys_api" VALUES (603002, '流程新增', 6030, 603002, 'bpmbus:main:add', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.602162', '2026-01-20 16:22:15.602162');
INSERT INTO "public"."sys_api" VALUES (603003, '流程编辑', 6030, 603003, 'bpmbus:main:edit', 0, 0, NULL, 't', NULL, '2026-01-20 16:22:15.602163', '2026-01-20 16:22:15.602163');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "kenam" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "keval" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "intag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "avtag" bool,
  "ornum" int4
)
;
COMMENT ON COLUMN "public"."sys_config"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_config"."name" IS '参数名称';
COMMENT ON COLUMN "public"."sys_config"."kenam" IS '参数键名';
COMMENT ON COLUMN "public"."sys_config"."keval" IS '参数键值';
COMMENT ON COLUMN "public"."sys_config"."intag" IS '内置标记';
COMMENT ON COLUMN "public"."sys_config"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_config"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_config"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_config"."avtag" IS '是否可用';
COMMENT ON COLUMN "public"."sys_config"."ornum" IS '排序号';
COMMENT ON TABLE "public"."sys_config" IS '系统参数';

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_group";
CREATE TABLE "public"."sys_group" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ornum" int4,
  "label" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "catid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_group"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_group"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_group"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_group"."catid" IS '分类ID';
COMMENT ON COLUMN "public"."sys_group"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_group"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_group"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_group"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_group"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."sys_group"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."sys_group"."notes" IS '备注';
COMMENT ON TABLE "public"."sys_group" IS '系统群组';

-- ----------------------------
-- Records of sys_group
-- ----------------------------
INSERT INTO "public"."sys_group" VALUES ('g3001', 3001, NULL, NULL, '北京分公司管理组', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_group" VALUES ('g3002', 3002, NULL, NULL, '北京分公司销售员', NULL, NULL, NULL, NULL, 't', NULL);

-- ----------------------------
-- Table structure for sys_group_actor
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_group_actor";
CREATE TABLE "public"."sys_group_actor" (
  "gid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "aid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_group_actor"."gid" IS '群组ID';
COMMENT ON COLUMN "public"."sys_group_actor"."aid" IS '成员ID';
COMMENT ON TABLE "public"."sys_group_actor" IS '群组成员关系表';

-- ----------------------------
-- Records of sys_group_actor
-- ----------------------------
INSERT INTO "public"."sys_group_actor" VALUES ('g3001', 'u4');
INSERT INTO "public"."sys_group_actor" VALUES ('g3001', 'u5');
INSERT INTO "public"."sys_group_actor" VALUES ('g3001', 'p2004');
INSERT INTO "public"."sys_group_actor" VALUES ('g3001', 'o1140');
INSERT INTO "public"."sys_group_actor" VALUES ('g3002', 'u8');
INSERT INTO "public"."sys_group_actor" VALUES ('g3002', 'u9');

-- ----------------------------
-- Table structure for sys_group_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_group_cate";
CREATE TABLE "public"."sys_group_cate" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "crmid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upmid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4,
  "pid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tier" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_group_cate"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_group_cate"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_group_cate"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_group_cate"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_group_cate"."crmid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_group_cate"."upmid" IS '修改者Id';
COMMENT ON COLUMN "public"."sys_group_cate"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."sys_group_cate"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_group_cate"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_group_cate"."pid" IS '父ID';
COMMENT ON COLUMN "public"."sys_group_cate"."tier" IS '层级信息';
COMMENT ON TABLE "public"."sys_group_cate" IS '系统群组分类';

-- ----------------------------
-- Records of sys_group_cate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "pid" int8,
  "avtag" bool,
  "ornum" int4,
  "type" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "icon" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "path" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "param" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "comp" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "shtag" bool,
  "catag" bool,
  "outag" bool,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_menu"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_menu"."pid" IS '父ID';
COMMENT ON COLUMN "public"."sys_menu"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."sys_menu"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '类型 C目录，M菜单';
COMMENT ON COLUMN "public"."sys_menu"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '图标';
COMMENT ON COLUMN "public"."sys_menu"."path" IS '路由地址';
COMMENT ON COLUMN "public"."sys_menu"."param" IS '路由参数';
COMMENT ON COLUMN "public"."sys_menu"."comp" IS '组件路径';
COMMENT ON COLUMN "public"."sys_menu"."shtag" IS '是否显示';
COMMENT ON COLUMN "public"."sys_menu"."catag" IS '缓存标记';
COMMENT ON COLUMN "public"."sys_menu"."outag" IS '是否为外链';
COMMENT ON COLUMN "public"."sys_menu"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_menu"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_menu"."upuid" IS '修改者Id';
COMMENT ON TABLE "public"."sys_menu" IS '权限菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1000, '系统管理', 0, 't', 1000, '1', NULL, 'tdesign:system-setting', 'sys', NULL, 'Layout', 't', 'f', 'f', '2026-01-20 16:22:15.55633', '2026-01-20 16:22:15.55633', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1010, '组织管理', 1000, 't', 1010, '2', NULL, 'mingcute:department-line', 'org', NULL, 'sys/org/index', 't', 'f', 'f', '2026-01-20 16:22:15.556648', '2026-01-20 16:22:15.556648', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1020, '用户管理', 1000, 't', 1020, '2', NULL, 'ant-design:user-outlined', 'user', NULL, 'sys/user/index', 't', 'f', 'f', '2026-01-20 16:22:15.556649', '2026-01-20 16:22:15.556649', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1021, '用户编辑', 1000, 't', 1021, '2', NULL, 'mingcute:user-edit-line', 'user/edit', NULL, 'sys/user/tedit', 'f', 't', 'f', '2026-01-20 16:22:15.556649', '2026-01-20 16:22:15.556649', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1030, '岗位管理', 1000, 't', 1030, '2', NULL, 'icon-park-outline:appointment', 'post', NULL, 'sys/post/index', 't', 'f', 'f', '2026-01-20 16:22:15.556649', '2026-01-20 16:22:15.556649', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1040, '群组管理', 1000, 't', 1040, '2', NULL, 'material-symbols:group-outline-rounded', 'group', NULL, 'sys/group/index', 't', 'f', 'f', '2026-01-20 16:22:15.55665', '2026-01-20 16:22:15.55665', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1050, '菜单管理', 1000, 't', 1050, '2', NULL, 'ri:menu-fold-2-fill', 'menu', NULL, 'sys/menu/index', 't', 'f', 'f', '2026-01-20 16:22:15.55665', '2026-01-20 16:22:15.55665', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1060, '接口管理', 1000, 't', 1060, '2', NULL, 'ant-design:api-outlined', 'api', NULL, 'sys/api/index', 't', 'f', 'f', '2026-01-20 16:22:15.556651', '2026-01-20 16:22:15.556651', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1070, '角色管理', 1000, 't', 1070, '2', NULL, 'eos-icons:role-binding-outlined', 'role', NULL, 'sys/role/index', 't', 'f', 'f', '2026-01-20 16:22:15.556652', '2026-01-20 16:22:15.556652', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1071, '角色编辑', 1000, 't', 1071, '2', NULL, 'oui:app-users-roles', 'role/edit', NULL, 'sys/role/edit', 'f', 't', 'f', '2026-01-20 16:22:15.556652', '2026-01-20 16:22:15.556652', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1080, '参数设置', 1000, 't', 1080, '2', NULL, 'ant-design:setting-outlined', 'config', NULL, 'sys/config/index', 't', 'f', 'f', '2026-01-20 16:22:15.556652', '2026-01-20 16:22:15.556652', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1090, '通知公告', 1000, 't', 1090, '2', NULL, 'fe:notice-push', 'notice', NULL, 'sys/notice/index', 't', 'f', 'f', '2026-01-20 16:22:15.556652', '2026-01-20 16:22:15.556652', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2000, '监控中心', 0, 't', 2000, '1', NULL, 'eos-icons:monitoring', 'mon', NULL, 'Layout', 't', 'f', 'f', '2026-01-20 16:22:15.556653', '2026-01-20 16:22:15.556653', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2010, '在线用户', 2000, 't', 2010, '2', NULL, 'oui:online', 'online', NULL, 'mon/online/user/index', 't', 'f', 'f', '2026-01-20 16:22:15.556653', '2026-01-20 16:22:15.556653', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2020, '登录日志', 2000, 't', 2020, '2', NULL, 'uiw:login', 'login', NULL, 'mon/login/log/index', 't', 'f', 'f', '2026-01-20 16:22:15.556653', '2026-01-20 16:22:15.556653', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2030, '操作日志', 2000, 't', 2030, '2', NULL, 'icon-park-outline:reverse-operation-in', 'oper', NULL, 'mon/oper/log/index', 't', 'f', 'f', '2026-01-20 16:22:15.556653', '2026-01-20 16:22:15.556653', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2040, '服务监控', 2000, 't', 2040, '2', NULL, 'mdi:server-outline', 'server', NULL, 'mon/server/net', 't', 'f', 'f', '2026-01-20 16:22:15.556653', '2026-01-20 16:22:15.556653', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2050, '缓存监控', 2000, 't', 2050, '2', NULL, 'octicon:cache-24', 'cache', NULL, 'mon/cache/index', 't', 'f', 'f', '2026-01-20 16:22:15.556654', '2026-01-20 16:22:15.556654', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2060, '定时任务', 2000, 't', 2060, '2', NULL, 'streamline:task-list', 'job', NULL, 'mon/job/main/index', 't', 'f', 'f', '2026-01-20 16:22:15.556662', '2026-01-20 16:22:15.556662', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (2061, '任务日志', 2000, 't', 2061, '2', NULL, 'ix:log', 'job/log', NULL, 'mon/job/log/index', 't', 'f', 'f', '2026-01-20 16:22:15.556662', '2026-01-20 16:22:15.556662', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3000, '辅助工具', 0, 't', 3000, '1', NULL, 'ant-design:tool-outlined', 'tool', NULL, 'Layout', 't', 'f', 'f', '2026-01-20 16:22:15.556662', '2026-01-20 16:22:15.556662', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3010, '字典工具', 3000, 't', 3010, '2', NULL, 'fluent-mdl2:dictionary', 'dict', NULL, 'tool/dict/index', 't', 'f', 'f', '2026-01-20 16:22:15.556662', '2026-01-20 16:22:15.556662', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3020, '编号工具', 3000, 't', 3020, '2', NULL, 'streamline-sharp:steps-number', 'num', NULL, 'tool/num/index', 't', 'f', 'f', '2026-01-20 16:22:15.556662', '2026-01-20 16:22:15.556662', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3030, '文件工具', 3000, 't', 3030, '2', NULL, 'mdi:file-outline', 'oss', NULL, 'tool/oss/main/index', 't', 'f', 'f', '2026-01-20 16:22:15.556663', '2026-01-20 16:22:15.556663', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3040, '在线表单', 3000, 't', 3040, '2', NULL, 'fluent:form-20-regular', 'form', NULL, 'tool/form/index', 't', 'f', 'f', '2026-01-20 16:22:15.556663', '2026-01-20 16:22:15.556663', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3041, '在线表单', 3000, 't', 3041, '2', NULL, 'fluent:form-20-regular', 'form/edit', NULL, 'tool/form/edit', 'f', 't', 'f', '2026-01-20 16:22:15.556663', '2026-01-20 16:22:15.556663', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3050, '代码生成', 3000, 't', 3050, '2', NULL, 'humbleicons:code', 'code', NULL, 'tool/code/index', 't', 'f', 'f', '2026-01-20 16:22:15.556663', '2026-01-20 16:22:15.556663', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (3051, '代码生成', 3000, 't', 3051, '2', NULL, 'humbleicons:code', 'code/edit', NULL, 'tool/code/edit', 'f', 't', 'f', '2026-01-20 16:22:15.556663', '2026-01-20 16:22:15.556663', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6000, '流程管理', 0, 't', 6000, '1', NULL, 'streamline-sharp:text-flow-rows', 'bpm', NULL, 'Layout', 't', 'f', 'f', '2026-01-20 16:22:15.572258', '2026-01-20 16:22:15.572258', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6010, '流程分类', 6000, 't', 6010, '2', NULL, 'tabler:category-plus', 'busc', NULL, 'bpm/bus/cate/index', 't', 'f', 'f', '2026-01-20 16:22:15.572261', '2026-01-20 16:22:15.572261', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6020, '流程模板', 6000, 't', 6020, '2', NULL, 'carbon:prompt-template', 'bust', NULL, 'bpm/bus/tmpl/index', 't', 'f', 'f', '2026-01-20 16:22:15.572263', '2026-01-20 16:22:15.572263', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6021, '流程模板编辑', 6000, 't', 6021, '2', NULL, 'carbon:prompt-template', 'bust/edit', NULL, 'bpm/bus/tmpl/edit', 'f', 't', 'f', '2026-01-20 16:22:15.572264', '2026-01-20 16:22:15.572264', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6030, '流程清单', 6000, 't', 6030, '2', NULL, 'ri:instance-line', 'bus', NULL, 'bpm/bus/main/index', 't', 'f', 'f', '2026-01-20 16:22:15.572264', '2026-01-20 16:22:15.572264', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6031, '流程编辑', 6000, 't', 6031, '2', NULL, 'ri:instance-line', 'bus/edit', NULL, 'bpm/bus/main/edit', 'f', 't', 'f', '2026-01-20 16:22:15.572265', '2026-01-20 16:22:15.572265', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6032, '流程查看', 6000, 't', 6032, '2', NULL, 'ri:instance-line', 'bus/view', NULL, 'bpm/bus/main/view', 'f', 't', 'f', '2026-01-20 16:22:15.572265', '2026-01-20 16:22:15.572265', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6040, '流程待办', 6000, 't', 6040, '2', NULL, 'ri:todo-line', 'todo', NULL, 'bpm/todo/index', 't', 'f', 'f', '2026-01-20 16:22:15.572265', '2026-01-20 16:22:15.572265', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6050, '流程角色', 6000, 't', 6050, '2', NULL, 'mdi:workflow-outline', 'role/tree', NULL, 'bpm/role/tree/index', 't', 'f', 'f', '2026-01-20 16:22:15.572265', '2026-01-20 16:22:15.572265', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (6051, '流程角色节点', 6000, 't', 6051, '2', NULL, 'mdi:workflow-outline', 'role/node', NULL, 'bpm/role/node/index', 'f', 't', 'f', '2026-01-20 16:22:15.572265', '2026-01-20 16:22:15.572265', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (8000, '使用案例', 0, 't', 8000, '1', NULL, 'hugeicons:star', 'demo', NULL, 'Layout', 't', 'f', 'f', '2026-01-20 16:22:15.606656', '2026-01-20 16:22:15.606656', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (8010, '单一主表案例', 8000, 't', 8010, '2', NULL, 'pajamas:work-item-requirement', 'single', NULL, 'demo/single/main/index', 't', 'f', 'f', '2026-01-20 16:22:15.606657', '2026-01-20 16:22:15.606657', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (8020, '单一树表案例', 8000, 't', 8020, '2', NULL, 'pajamas:work-item-requirement', 'singlec', NULL, 'demo/single/cate/index', 't', 'f', 'f', '2026-01-20 16:22:15.606658', '2026-01-20 16:22:15.606658', NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (8030, '关联主分子案例', 8000, 't', 8030, '2', NULL, 'pajamas:work-item-requirement', 'link', NULL, 'demo/link/index', 't', 'f', 'f', '2026-01-20 16:22:15.606658', '2026-01-20 16:22:15.606658', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "cont" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" int4,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "avtag" bool,
  "ornum" int4
)
;
COMMENT ON COLUMN "public"."sys_notice"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_notice"."name" IS '公告标题';
COMMENT ON COLUMN "public"."sys_notice"."cont" IS '公告内容';
COMMENT ON COLUMN "public"."sys_notice"."type" IS '公告类型（1通知 2公告）';
COMMENT ON COLUMN "public"."sys_notice"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_notice"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_notice"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_notice"."avtag" IS '是否可用';
COMMENT ON COLUMN "public"."sys_notice"."ornum" IS '排序号';
COMMENT ON TABLE "public"."sys_notice" IS '系统通知';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_org";
CREATE TABLE "public"."sys_org" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "pid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tier" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "label" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4,
  "type" int4,
  "ex1" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ex2" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ex3" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ex4" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_org"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_org"."pid" IS '父ID';
COMMENT ON COLUMN "public"."sys_org"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_org"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_org"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_org"."type" IS '组织类型';
COMMENT ON COLUMN "public"."sys_org"."ex1" IS '扩展字段1';
COMMENT ON COLUMN "public"."sys_org"."ex2" IS '扩展字段2';
COMMENT ON COLUMN "public"."sys_org"."ex3" IS '扩展字段3';
COMMENT ON COLUMN "public"."sys_org"."ex4" IS '扩展字段4';
COMMENT ON COLUMN "public"."sys_org"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_org"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_org"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_org"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_org"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."sys_org"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."sys_org"."notes" IS '备注';
COMMENT ON TABLE "public"."sys_org" IS '系统组织';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO "public"."sys_org" VALUES ('o1000', NULL, '_o1000_', NULL, 1000, 1, NULL, NULL, NULL, NULL, 'XX科技', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1100', 'o1000', '_o1000_o1100_', NULL, 1100, 2, NULL, NULL, NULL, NULL, '北京分公司', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1110', 'o1100', '_o1000_o1100_o1110_', NULL, 1110, 8, NULL, NULL, NULL, NULL, '北京分公司销售部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1111', 'o1110', '_o1000_o1100_o1110_o1111_', NULL, 1111, 8, NULL, NULL, NULL, NULL, '北京分公司销售部一组', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1112', 'o1110', '_o1000_o1100_o1110_o1112_', NULL, 1112, 8, NULL, NULL, NULL, NULL, '北京分公司销售部二组', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1120', 'o1100', '_o1000_o1100_o1120_', NULL, 1120, 8, NULL, NULL, NULL, NULL, '北京分公司人事部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1130', 'o1100', '_o1000_o1100_o1130_', NULL, 1130, 8, NULL, NULL, NULL, NULL, '北京分公司财务部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1140', 'o1100', '_o1000_o1100_o1140_', NULL, 1140, 8, NULL, NULL, NULL, NULL, '北京分公司综合部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1200', 'o1000', '_o1000_o1200_', NULL, 1200, 2, NULL, NULL, NULL, NULL, '上海分公司', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1210', 'o1200', '_o1000_o1200_o1210_', NULL, 1210, 8, NULL, NULL, NULL, NULL, '上海分公司销售部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1220', 'o1200', '_o1000_o1200_o1220_', NULL, 1220, 8, NULL, NULL, NULL, NULL, '上海分公司人事部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1230', 'o1200', '_o1000_o1200_o1230_', NULL, 1230, 8, NULL, NULL, NULL, NULL, '上海分公司财务部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1300', 'o1000', '_o1000_o1300_', NULL, 1300, 2, NULL, NULL, NULL, NULL, '广州分公司', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1310', 'o1300', '_o1000_o1300_o1310_', NULL, 1310, 8, NULL, NULL, NULL, NULL, '广州分公司综合部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1320', 'o1300', '_o1000_o1300_o1320_', NULL, 1320, 8, NULL, NULL, NULL, NULL, '广州分公司销售部', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_org" VALUES ('o1330', 'o1300', '_o1000_o1300_o1330_', NULL, 1330, 8, NULL, NULL, NULL, NULL, '广州分公司人事部', NULL, NULL, NULL, NULL, 't', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_post";
CREATE TABLE "public"."sys_post" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "orgid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "label" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4,
  "tier" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_post"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_post"."orgid" IS '组织ID';
COMMENT ON COLUMN "public"."sys_post"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_post"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_post"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_post"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_post"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_post"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_post"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_post"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."sys_post"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."sys_post"."notes" IS '备注';
COMMENT ON TABLE "public"."sys_post" IS '系统岗位';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO "public"."sys_post" VALUES ('p2001', 'o1000', NULL, 2001, '_o1000_p2001_', '董事长', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_post" VALUES ('p2002', 'o1100', NULL, 2002, '_o1000_o1100_p2002_', '北京分公司总经理', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_post" VALUES ('p2003', 'o1110', NULL, 2003, '_o1000_o1100_o1110_p2003_', '北京分公司销售部长', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_post" VALUES ('p2004', 'o1111', NULL, 2004, '_o1000_o1100_o1110_o1111_p2004_', '北京分公司销售经理', NULL, NULL, NULL, NULL, 't', NULL);

-- ----------------------------
-- Table structure for sys_post_actor
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_post_actor";
CREATE TABLE "public"."sys_post_actor" (
  "pid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "aid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_post_actor"."pid" IS '岗位ID';
COMMENT ON COLUMN "public"."sys_post_actor"."aid" IS '用户ID';
COMMENT ON TABLE "public"."sys_post_actor" IS '岗位员工关系表';

-- ----------------------------
-- Records of sys_post_actor
-- ----------------------------
INSERT INTO "public"."sys_post_actor" VALUES ('p2001', 'u3');
INSERT INTO "public"."sys_post_actor" VALUES ('p2002', 'u4');
INSERT INTO "public"."sys_post_actor" VALUES ('p2003', 'u5');
INSERT INTO "public"."sys_post_actor" VALUES ('p2004', 'u6');
INSERT INTO "public"."sys_post_actor" VALUES ('p2004', 'u7');

-- ----------------------------
-- Table structure for sys_rece
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_rece";
CREATE TABLE "public"."sys_rece" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "useid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "aid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "uptim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_rece"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_rece"."useid" IS '用户ID';
COMMENT ON COLUMN "public"."sys_rece"."aid" IS '系统参与实体ID';
COMMENT ON COLUMN "public"."sys_rece"."uptim" IS '最近使用时间';
COMMENT ON TABLE "public"."sys_rece" IS '系统参与实体最近访问记录';

-- ----------------------------
-- Records of sys_rece
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "ornum" int4,
  "type" int4,
  "scope" int4,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_role"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_role"."notes" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."avtag" IS '可用标记';
COMMENT ON COLUMN "public"."sys_role"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_role"."type" IS '角色类型';
COMMENT ON COLUMN "public"."sys_role"."scope" IS '数据权限';
COMMENT ON COLUMN "public"."sys_role"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_role"."upuid" IS '修改者Id';
COMMENT ON TABLE "public"."sys_role" IS '权限角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, '管理员', '拥有所有权限', 't', 1, 0, 0, '2026-01-20 16:22:15.611873', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_actor
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_actor";
CREATE TABLE "public"."sys_role_actor" (
  "rid" int8,
  "aid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_role_actor"."rid" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_actor"."aid" IS '成员ID';
COMMENT ON TABLE "public"."sys_role_actor" IS '权限角色与系统成员关联表';

-- ----------------------------
-- Records of sys_role_actor
-- ----------------------------
INSERT INTO "public"."sys_role_actor" VALUES (1, 'u2');
INSERT INTO "public"."sys_role_actor" VALUES (1, 'u3');
INSERT INTO "public"."sys_role_actor" VALUES (1, 'u4');
INSERT INTO "public"."sys_role_actor" VALUES (1, 'u5');

-- ----------------------------
-- Table structure for sys_role_api
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_api";
CREATE TABLE "public"."sys_role_api" (
  "rid" int8,
  "aid" int8
)
;
COMMENT ON COLUMN "public"."sys_role_api"."rid" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_api"."aid" IS '接口ID';
COMMENT ON TABLE "public"."sys_role_api" IS '权限角色与接口关联表';

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
INSERT INTO "public"."sys_role_api" VALUES (1, 801001);
INSERT INTO "public"."sys_role_api" VALUES (1, 801002);
INSERT INTO "public"."sys_role_api" VALUES (1, 801003);
INSERT INTO "public"."sys_role_api" VALUES (1, 801004);
INSERT INTO "public"."sys_role_api" VALUES (1, 802001);
INSERT INTO "public"."sys_role_api" VALUES (1, 802002);
INSERT INTO "public"."sys_role_api" VALUES (1, 802003);
INSERT INTO "public"."sys_role_api" VALUES (1, 802004);
INSERT INTO "public"."sys_role_api" VALUES (1, 803001);
INSERT INTO "public"."sys_role_api" VALUES (1, 803002);
INSERT INTO "public"."sys_role_api" VALUES (1, 803003);
INSERT INTO "public"."sys_role_api" VALUES (1, 803004);
INSERT INTO "public"."sys_role_api" VALUES (1, 803011);
INSERT INTO "public"."sys_role_api" VALUES (1, 803012);
INSERT INTO "public"."sys_role_api" VALUES (1, 803013);
INSERT INTO "public"."sys_role_api" VALUES (1, 803014);
INSERT INTO "public"."sys_role_api" VALUES (1, 603001);
INSERT INTO "public"."sys_role_api" VALUES (1, 603002);
INSERT INTO "public"."sys_role_api" VALUES (1, 603003);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "rid" int8,
  "mid" int8
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."rid" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menu"."mid" IS '菜单ID';
COMMENT ON TABLE "public"."sys_role_menu" IS '权限角色与菜单关联表';

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
INSERT INTO "public"."sys_role_menu" VALUES (1, 8000);
INSERT INTO "public"."sys_role_menu" VALUES (1, 8010);
INSERT INTO "public"."sys_role_menu" VALUES (1, 8020);
INSERT INTO "public"."sys_role_menu" VALUES (1, 8030);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "orgid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tier" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "job" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "username" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "password" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "email" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "monum" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "gender" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4,
  "label" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" int4,
  "catag" bool,
  "lotim" timestamp(6),
  "loip" varchar(20) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avatar" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_user"."orgid" IS '组织ID';
COMMENT ON COLUMN "public"."sys_user"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_user"."job" IS '职务';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."monum" IS '手机号';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别';
COMMENT ON COLUMN "public"."sys_user"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."sys_user"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_user"."type" IS '用户类型';
COMMENT ON COLUMN "public"."sys_user"."catag" IS '缓存标记';
COMMENT ON COLUMN "public"."sys_user"."lotim" IS '最后登录时间';
COMMENT ON COLUMN "public"."sys_user"."loip" IS '最后登录IP';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像';
COMMENT ON COLUMN "public"."sys_user"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_user"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."sys_user"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."sys_user"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."sys_user"."notes" IS '备注';
COMMENT ON TABLE "public"."sys_user" IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('u1', 'o1000', '_o1000_u1_', NULL, 'admin', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', 'admin@qq.com', '13812345678', '1', 1, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '管理员', NULL, NULL, NULL, NULL, 't', '管理员不给修改');
INSERT INTO "public"."sys_user" VALUES ('u2', 'o1000', '_o1000_u2_', NULL, 'vben', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', 'vben@qq.com', '13912345678', '2', 2, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '小狐狸', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u3', 'o1000', '_o1000_u3_', NULL, 'zs', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 3, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '张三', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u4', 'o1100', '_o1000_o1100_u4_', NULL, 'ls', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 4, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '李四', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u5', 'o1110', '_o1000_o1100_o1110_u5_', NULL, 'ww', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 5, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '王五', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u6', 'o1111', '_o1000_o1100_o1110_o1111_u6_', NULL, 'zl', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 6, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '赵六', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u7', 'o1111', '_o1000_o1100_o1110_o1111_u7_', NULL, 'sq', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 7, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '孙七', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u8', 'o1111', '_o1000_o1100_o1110_o1111_u8_', NULL, 'zb', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 8, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '周八', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."sys_user" VALUES ('u9', 'o1111', '_o1000_o1100_o1110_o1111_u9_', NULL, 'wj', '$2a$10$09f8rxsX4tbj1CZla2MSOuiwHwp5QAPUzbp5whnoZEFK4/xplNwZq', NULL, NULL, NULL, 9, NULL, 0, 't', '1900-01-01 00:00:00', NULL, NULL, '吴九', NULL, NULL, NULL, NULL, 't', NULL);

-- ----------------------------
-- Table structure for sys_user_cache
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_cache";
CREATE TABLE "public"."sys_user_cache" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "conds" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "perms" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "menus" text COLLATE "pg_catalog"."default",
  "btns" text COLLATE "pg_catalog"."default",
  "portals" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_user_cache"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."sys_user_cache"."conds" IS '系统参与实体ID集';
COMMENT ON COLUMN "public"."sys_user_cache"."perms" IS '后台所有权限集';
COMMENT ON COLUMN "public"."sys_user_cache"."menus" IS '前台菜单缓存';
COMMENT ON COLUMN "public"."sys_user_cache"."btns" IS '前台按钮缓存';
COMMENT ON COLUMN "public"."sys_user_cache"."portals" IS '前台门户缓存';
COMMENT ON TABLE "public"."sys_user_cache" IS '用户缓存表';

-- ----------------------------
-- Records of sys_user_cache
-- ----------------------------

-- ----------------------------
-- Table structure for tool_code_field
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_code_field";
CREATE TABLE "public"."tool_code_field" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ornum" int4,
  "remark" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tabid" int8,
  "length" int4,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_code_field"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_code_field"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_code_field"."remark" IS '字段注释';
COMMENT ON COLUMN "public"."tool_code_field"."type" IS '字段类型';
COMMENT ON COLUMN "public"."tool_code_field"."tabid" IS '表格ID';
COMMENT ON COLUMN "public"."tool_code_field"."length" IS '字段长度';
COMMENT ON COLUMN "public"."tool_code_field"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_code_field"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_code_field"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_code_field"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."tool_code_field"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."tool_code_field"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."tool_code_field"."notes" IS '备注';
COMMENT ON TABLE "public"."tool_code_field" IS '代码生成-字段信息';

-- ----------------------------
-- Records of tool_code_field
-- ----------------------------

-- ----------------------------
-- Table structure for tool_code_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_code_table";
CREATE TABLE "public"."tool_code_table" (
  "id" int8 NOT NULL,
  "bunam" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "baent" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ornum" int4,
  "remark" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "porid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "pmeid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "edtyp" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "pecol" int4,
  "addbt" bool,
  "delbt" bool,
  "impbt" bool,
  "expbt" bool,
  "rotyp" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "orfie" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ortyp" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_code_table"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_code_table"."bunam" IS '实例类';
COMMENT ON COLUMN "public"."tool_code_table"."baent" IS '继承基类';
COMMENT ON COLUMN "public"."tool_code_table"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_code_table"."remark" IS '表描述';
COMMENT ON COLUMN "public"."tool_code_table"."porid" IS '所属门户ID';
COMMENT ON COLUMN "public"."tool_code_table"."pmeid" IS '上级菜单ID';
COMMENT ON COLUMN "public"."tool_code_table"."edtyp" IS '编辑页类型';
COMMENT ON COLUMN "public"."tool_code_table"."pecol" IS '每行列数';
COMMENT ON COLUMN "public"."tool_code_table"."addbt" IS '新增按钮';
COMMENT ON COLUMN "public"."tool_code_table"."delbt" IS '删除按钮';
COMMENT ON COLUMN "public"."tool_code_table"."impbt" IS '导入按钮';
COMMENT ON COLUMN "public"."tool_code_table"."expbt" IS '导出按钮';
COMMENT ON COLUMN "public"."tool_code_table"."rotyp" IS '路由类型';
COMMENT ON COLUMN "public"."tool_code_table"."orfie" IS '排序字段';
COMMENT ON COLUMN "public"."tool_code_table"."ortyp" IS 'orm类型';
COMMENT ON COLUMN "public"."tool_code_table"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_code_table"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_code_table"."cruid" IS '创建人Id';
COMMENT ON COLUMN "public"."tool_code_table"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_code_table"."upuid" IS '修改人Id';
COMMENT ON COLUMN "public"."tool_code_table"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."tool_code_table"."notes" IS '备注';
COMMENT ON TABLE "public"."tool_code_table" IS '代码生成-表信息';

-- ----------------------------
-- Records of tool_code_table
-- ----------------------------

-- ----------------------------
-- Table structure for tool_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_dict";
CREATE TABLE "public"."tool_dict" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ornum" int4,
  "catid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "code" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_dict"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_dict"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_dict"."catid" IS '类型';
COMMENT ON COLUMN "public"."tool_dict"."code" IS '字典代码';
COMMENT ON COLUMN "public"."tool_dict"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_dict"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_dict"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_dict"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."tool_dict"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."tool_dict"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."tool_dict"."notes" IS '备注';
COMMENT ON TABLE "public"."tool_dict" IS '字典信息';

-- ----------------------------
-- Records of tool_dict
-- ----------------------------
INSERT INTO "public"."tool_dict" VALUES ('DEMO_GRADE', 0, NULL, NULL, 'DEMO资质等级', NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict" VALUES ('DIST_GRADE', 0, NULL, NULL, '渠道商资质等级', NULL, NULL, NULL, NULL, 't', NULL);

-- ----------------------------
-- Table structure for tool_dict_cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_dict_cate";
CREATE TABLE "public"."tool_dict_cate" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "avtag" bool,
  "ornum" int4,
  "notes" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_dict_cate"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_dict_cate"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."tool_dict_cate"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_dict_cate"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_dict_cate"."code" IS '代码';
COMMENT ON COLUMN "public"."tool_dict_cate"."name" IS '名称';
COMMENT ON TABLE "public"."tool_dict_cate" IS '字典分类';

-- ----------------------------
-- Records of tool_dict_cate
-- ----------------------------

-- ----------------------------
-- Table structure for tool_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_dict_data";
CREATE TABLE "public"."tool_dict_data" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ornum" int4,
  "dicid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "dalab" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "daval" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "shsty" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_dict_data"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_dict_data"."ornum" IS '排序号';
COMMENT ON COLUMN "public"."tool_dict_data"."dicid" IS '字典ID';
COMMENT ON COLUMN "public"."tool_dict_data"."dalab" IS '数据标签';
COMMENT ON COLUMN "public"."tool_dict_data"."daval" IS '字典ID';
COMMENT ON COLUMN "public"."tool_dict_data"."shsty" IS '显示样式';
COMMENT ON COLUMN "public"."tool_dict_data"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_dict_data"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_dict_data"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_dict_data"."cruid" IS '创建者Id';
COMMENT ON COLUMN "public"."tool_dict_data"."upuid" IS '修改者Id';
COMMENT ON COLUMN "public"."tool_dict_data"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."tool_dict_data"."notes" IS '备注';
COMMENT ON TABLE "public"."tool_dict_data" IS '字典数据';

-- ----------------------------
-- Records of tool_dict_data
-- ----------------------------
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903109', 1, 'DEMO_GRADE', 'A', 'A级资质', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903110', 2, 'DEMO_GRADE', 'B', 'B级资质', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903111', 3, 'DEMO_GRADE', 'C', 'C级资质', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903112', 4, 'DEMO_GRADE', 'Z', '不合格', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903113', 1, 'DIST_GRADE', 'A', 'A级资质', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903114', 2, 'DIST_GRADE', 'B', 'B级资质', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903115', 3, 'DIST_GRADE', 'C', 'C级资质', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);
INSERT INTO "public"."tool_dict_data" VALUES ('801365969241903116', 4, 'DIST_GRADE', 'Z', '不合格', NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL);

-- ----------------------------
-- Table structure for tool_form
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_form";
CREATE TABLE "public"."tool_form" (
  "id" int8 NOT NULL,
  "frule" text COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "cruid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uptim" timestamp(6),
  "upuid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "avtag" bool,
  "notes" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_form"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_form"."frule" IS '表单规则';
COMMENT ON COLUMN "public"."tool_form"."name" IS '名称';
COMMENT ON COLUMN "public"."tool_form"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_form"."cruid" IS '创建人Id';
COMMENT ON COLUMN "public"."tool_form"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_form"."upuid" IS '修改人Id';
COMMENT ON COLUMN "public"."tool_form"."avtag" IS '可用标记：1可用，0禁用';
COMMENT ON COLUMN "public"."tool_form"."notes" IS '备注';
COMMENT ON TABLE "public"."tool_form" IS '在线表单';

-- ----------------------------
-- Records of tool_form
-- ----------------------------

-- ----------------------------
-- Table structure for tool_num
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_num";
CREATE TABLE "public"."tool_num" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "label" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "numod" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "nupre" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "nflag" bool,
  "nunex" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "nulen" int4 NOT NULL,
  "cudat" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "uptim" timestamp(6),
  "notes" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_num"."id" IS 'Id主键';
COMMENT ON COLUMN "public"."tool_num"."label" IS '编号标签';
COMMENT ON COLUMN "public"."tool_num"."numod" IS '编号生成模式';
COMMENT ON COLUMN "public"."tool_num"."nupre" IS '编号前缀';
COMMENT ON COLUMN "public"."tool_num"."nflag" IS '判断标记';
COMMENT ON COLUMN "public"."tool_num"."nunex" IS '下一个编号';
COMMENT ON COLUMN "public"."tool_num"."nulen" IS '编号长度';
COMMENT ON COLUMN "public"."tool_num"."cudat" IS '当前日期';
COMMENT ON COLUMN "public"."tool_num"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_num"."uptim" IS '更新时间';
COMMENT ON COLUMN "public"."tool_num"."notes" IS '备注';
COMMENT ON COLUMN "public"."tool_num"."name" IS '名称';
COMMENT ON TABLE "public"."tool_num" IS '编号工具';

-- ----------------------------
-- Records of tool_num
-- ----------------------------
INSERT INTO "public"."tool_num" VALUES ('DEMO', NULL, 'yy', 'D', 't', NULL, 4, NULL, '2026-01-20 16:22:15.709552', NULL, NULL, 'DEMO流水号');
INSERT INTO "public"."tool_num" VALUES ('PROJ', NULL, 'yyyymmdd', 'PR', 't', NULL, 3, NULL, '2026-01-20 16:22:15.709919', NULL, NULL, '项目流水号');
INSERT INTO "public"."tool_num" VALUES ('CUST', NULL, 'yyyymmdd', 'CU', 't', NULL, 3, NULL, '2026-01-20 16:22:15.70992', NULL, NULL, '客户流水号');
INSERT INTO "public"."tool_num" VALUES ('DIST', NULL, 'nodate', 'DMS', 't', '1000001', 7, NULL, '2026-01-20 16:22:15.70992', NULL, NULL, '渠道商流水号');
INSERT INTO "public"."tool_num" VALUES ('DIST_USER', NULL, 'nodate', 'd', 't', '100001', 6, NULL, '2026-01-20 16:22:15.70996', NULL, NULL, '渠道商流水号');

-- ----------------------------
-- Table structure for tool_oss
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_oss";
CREATE TABLE "public"."tool_oss" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "filid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "busid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6),
  "crman" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."tool_oss"."id" IS '主键';
COMMENT ON COLUMN "public"."tool_oss"."name" IS '文件名称';
COMMENT ON COLUMN "public"."tool_oss"."type" IS '类型（后缀）';
COMMENT ON COLUMN "public"."tool_oss"."filid" IS '文件ID';
COMMENT ON COLUMN "public"."tool_oss"."busid" IS '业务ID';
COMMENT ON COLUMN "public"."tool_oss"."crtim" IS '创建时间';
COMMENT ON COLUMN "public"."tool_oss"."crman" IS '创建者Id';
COMMENT ON TABLE "public"."tool_oss" IS 'OSS存储引用';

-- ----------------------------
-- Records of tool_oss
-- ----------------------------

-- ----------------------------
-- Table structure for tool_oss_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."tool_oss_file";
CREATE TABLE "public"."tool_oss_file" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "md5" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fsize" int8,
  "path" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "service" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "crtim" timestamp(6)
)
;
COMMENT ON COLUMN "public"."tool_oss_file"."id" IS '主键';
COMMENT ON COLUMN "public"."tool_oss_file"."md5" IS '文件md5';
COMMENT ON COLUMN "public"."tool_oss_file"."fsize" IS '文件大小';
COMMENT ON COLUMN "public"."tool_oss_file"."path" IS '存储地址';
COMMENT ON COLUMN "public"."tool_oss_file"."service" IS '存储服务';
COMMENT ON COLUMN "public"."tool_oss_file"."crtim" IS '创建时间';
COMMENT ON TABLE "public"."tool_oss_file" IS 'OSS存储文件';

-- ----------------------------
-- Records of tool_oss_file
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table demo_link
-- ----------------------------
ALTER TABLE "public"."demo_link" ADD CONSTRAINT "demo_link_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_link_cate
-- ----------------------------
ALTER TABLE "public"."demo_link_cate" ADD CONSTRAINT "demo_link_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_link_item
-- ----------------------------
ALTER TABLE "public"."demo_link_item" ADD CONSTRAINT "demo_link_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_single
-- ----------------------------
ALTER TABLE "public"."demo_single" ADD CONSTRAINT "demo_single_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_single_cate
-- ----------------------------
ALTER TABLE "public"."demo_single_cate" ADD CONSTRAINT "demo_single_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_job
-- ----------------------------
ALTER TABLE "public"."mon_job" ADD CONSTRAINT "mon_job_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_job_log
-- ----------------------------
ALTER TABLE "public"."mon_job_log" ADD CONSTRAINT "mon_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_log_audit
-- ----------------------------
ALTER TABLE "public"."mon_log_audit" ADD CONSTRAINT "mon_log_audit_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_log_error
-- ----------------------------
ALTER TABLE "public"."mon_log_error" ADD CONSTRAINT "mon_log_error_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_login_log
-- ----------------------------
ALTER TABLE "public"."mon_login_log" ADD CONSTRAINT "mon_login_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_online_user
-- ----------------------------
ALTER TABLE "public"."mon_online_user" ADD CONSTRAINT "mon_online_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mon_oper_log
-- ----------------------------
ALTER TABLE "public"."mon_oper_log" ADD CONSTRAINT "mon_oper_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_actor
-- ----------------------------
ALTER TABLE "public"."sys_actor" ADD CONSTRAINT "sys_actor_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_api
-- ----------------------------
ALTER TABLE "public"."sys_api" ADD CONSTRAINT "sys_api_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "sys_config_pkey" PRIMARY KEY ("id");

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
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_cache
-- ----------------------------
ALTER TABLE "public"."sys_user_cache" ADD CONSTRAINT "sys_user_cache_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_code_field
-- ----------------------------
ALTER TABLE "public"."tool_code_field" ADD CONSTRAINT "tool_code_field_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_code_table
-- ----------------------------
ALTER TABLE "public"."tool_code_table" ADD CONSTRAINT "tool_code_table_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_dict
-- ----------------------------
ALTER TABLE "public"."tool_dict" ADD CONSTRAINT "tool_dict_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_dict_cate
-- ----------------------------
ALTER TABLE "public"."tool_dict_cate" ADD CONSTRAINT "tool_dict_cate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_dict_data
-- ----------------------------
ALTER TABLE "public"."tool_dict_data" ADD CONSTRAINT "tool_dict_data_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_form
-- ----------------------------
ALTER TABLE "public"."tool_form" ADD CONSTRAINT "tool_form_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_num
-- ----------------------------
ALTER TABLE "public"."tool_num" ADD CONSTRAINT "tool_num_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_oss
-- ----------------------------
ALTER TABLE "public"."tool_oss" ADD CONSTRAINT "tool_oss_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tool_oss_file
-- ----------------------------
ALTER TABLE "public"."tool_oss_file" ADD CONSTRAINT "tool_oss_file_pkey" PRIMARY KEY ("id");
