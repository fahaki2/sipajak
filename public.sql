/*
 Navicat Premium Data Transfer

 Source Server         : PostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 90506
 Source Host           : localhost:5432
 Source Catalog        : oauthdb
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90506
 File Encoding         : 65001

 Date: 05/04/2022 14:44:08
*/


-- ----------------------------
-- Sequence structure for admin_role_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_role_seq";
CREATE SEQUENCE "public"."admin_role_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for content_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."content_seq";
CREATE SEQUENCE "public"."content_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for monitoring_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."monitoring_seq";
CREATE SEQUENCE "public"."monitoring_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permission_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permission_seq";
CREATE SEQUENCE "public"."permission_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_seq";
CREATE SEQUENCE "public"."role_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_seq";
CREATE SEQUENCE "public"."user_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS "public"."content";
CREATE TABLE "public"."content" (
  "id_konten" int4 DEFAULT nextval('content_seq'::regclass),
  "content_type" int4,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "link" varchar(255) COLLATE "pg_catalog"."default",
  "path" varchar(255) COLLATE "pg_catalog"."default",
  "page" varchar(2048) COLLATE "pg_catalog"."default",
  "ordering" int4,
  "fgdelete" int4,
  "id_permission" int4
)
;
COMMENT ON COLUMN "public"."content"."content_type" IS '1 = Layanan,
2 = Paket,
3 = Patner,
4 = Banner,
5 = FAQ,
6 = Running Text,
7 = Informasi,
8 = Tentang Kami,
9 = Fitur, 10 = Setting Period';

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO "public"."content" VALUES (2, 9, 'Multi User', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (4, 9, 'Multi NPWP', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (1, 9, 'Fitur Utama', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiattes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (3, 9, 'Keamanan 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (5, 9, 'Keamanan 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (6, 8, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (7, 8, 'Alamat', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (8, 8, 'Kontak', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (9, 7, NULL, NULL, NULL, NULL, NULL, '<h2>Ini Adalah Judul yang Simple</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><ul><li>List Content 1</li><li>List Content 2</li><li>List Content 3</li></ul>', NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (32, 4, 'One Stop Solution 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '/content/banner_32.png', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (33, 4, 'One Stop Solution 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/content/banner_33.png', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."content" VALUES (34, 5, 'Apakah bla bla bla bla?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (35, 6, NULL, 'Ini adalah pengumuman yang sangat penting', NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (31, 3, 'Adidas', NULL, '/content/patner_31.png', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (28, 1, 'Faktur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '/content/layanan_28.png', 'http://efaktur.sipajak.com', 'faktur', '<h2>Faktur</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 3, 0, 7);
INSERT INTO "public"."content" VALUES (30, 2, 'Silver', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '/content/paket_30.png', NULL, 'paket_silver', '<h2>Paket Silver</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (39, 3, 'Nike', NULL, '/content/patner_39.png', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."content" VALUES (27, 1, 'Billing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '/content/layanan_27.png', 'http://ebilling.sipajak.com', 'billing', '<h2>Billing</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 2, 0, 6);
INSERT INTO "public"."content" VALUES (29, 2, 'Gold', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '/content/paket_29.png', NULL, 'paket_gold', '<h2>Paket Gold</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 2, NULL, NULL);
INSERT INTO "public"."content" VALUES (40, 10, 'Period Time Last Login', '0-0-100_0:0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."content" VALUES (42, 11, 'Ini Blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', NULL, NULL, 'ini_blog', '<h2><strong>BLOG 1</strong></h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>', 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (43, 12, 'Ini Newsletter', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...', NULL, NULL, 'ini_newsletter', '<figure class="media"><oembed url="https://youtu.be/ZtWt6FGLllI"></oembed></figure><h2>News 1</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>', 1, NULL, NULL);
INSERT INTO "public"."content" VALUES (26, 1, 'Filing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '/content/layanan_26.png', 'http://efiling.sipajak.com', 'filing', '<h2>Filing</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 1, 0, 5);

-- ----------------------------
-- Table structure for master_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."master_user";
CREATE TABLE "public"."master_user" (
  "id" int4 NOT NULL DEFAULT nextval('user_seq'::regclass),
  "username" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "nama" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(1024) COLLATE "pg_catalog"."default",
  "status" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "notelp" varchar(30) COLLATE "pg_catalog"."default",
  "created" timestamp(0) NOT NULL,
  "modified" timestamp(0),
  "linkaproval" varchar(1000) COLLATE "pg_catalog"."default",
  "enabled" bool NOT NULL,
  "id_parent_group" int4,
  "id_parent_admin" int4,
  "npwp" varchar(15) COLLATE "pg_catalog"."default",
  "efin" varchar(10) COLLATE "pg_catalog"."default",
  "alamat" varchar(500) COLLATE "pg_catalog"."default",
  "kode_pos" varchar(10) COLLATE "pg_catalog"."default",
  "handphone" varchar(30) COLLATE "pg_catalog"."default",
  "fax" varchar(30) COLLATE "pg_catalog"."default",
  "klu" varchar(10) COLLATE "pg_catalog"."default",
  "id_paket" int4,
  "last_login" timestamp(0),
  "jabatan" varchar(100) COLLATE "pg_catalog"."default",
  "nib_badan" varchar(255) COLLATE "pg_catalog"."default",
  "kontak_badan" varchar(255) COLLATE "pg_catalog"."default",
  "web_badan" varchar(1024) COLLATE "pg_catalog"."default",
  "jenis_user" varchar(1) COLLATE "pg_catalog"."default",
  "approved_by" varchar(255) COLLATE "pg_catalog"."default",
  "last_change_password_date" timestamp(0)
)
;

-- ----------------------------
-- Records of master_user
-- ----------------------------
INSERT INTO "public"."master_user" VALUES (24, 'sIno', '123qweasdzxc', NULL, NULL, '2', NULL, '2021-03-08 01:05:52', '2022-03-31 11:36:46', NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (2, '222222222222222', 'apass', 'andre000', 'andre12345@gmail.com', '1', '089765432123', '2021-01-01 07:43:43', '2021-03-14 22:33:55', 'o5Zm10vyEjCI++wjEjF4Lw==', 'f', NULL, NULL, '222222222222222', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (23, 'sINo', 'sino', NULL, NULL, '2', NULL, '2021-03-08 00:57:57', '2022-03-31 11:40:47', NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (19, 'sino', 'sino', NULL, NULL, '2', NULL, '2021-03-06 00:54:37', NULL, NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, '2021-03-06 00:57:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (7, '123456789012345', '123123', '12312312', 'abcdefgh@gmail.co', '2', '089765432123', '2021-01-10 11:42:06', '2021-03-14 22:35:37', 'j3PvRqumHtCyNlxm1J7lWA==', 'f', NULL, NULL, '123456789012345', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (27, '123123123213132', '123123', 'jordan', 'fajarhakiki22@gmail.com', '0', '0888888888', '2022-03-28 09:12:21', NULL, NULL, 'f', NULL, NULL, '123123123213132', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (26, '123123123123123', 'Rukad123', 'Rukad', 'rukad@gmail.com', '0', '0898765424424', '2022-03-10 06:14:59', NULL, NULL, 'f', NULL, NULL, '123123123123123', NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (10, '444444444444444', '123123', 'aaaaa', 'fajar2@gmasdad', '0', '089765432123', '2021-01-12 01:42:19', '2022-04-02 21:43:04', 's8kpewY/N47FQEGkRFKxJ4I2vtCnn/SmMH/GdYfq/Mg=', 'f', 8, NULL, '444444444444444', NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (32, 'adul', '123qweasdZXC', NULL, NULL, '2', NULL, '2022-03-31 12:14:23', '2022-03-31 12:18:28', NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (1, '000000000000000', 'fpass', 'fajar', 'fajar@gmail.com', '2', '089654135585', '2021-01-01 07:43:43', '2021-03-14 17:37:43', 'iHmuKrNi4IpsviLLoSFHzw==', 't', NULL, NULL, '000000000000000', '1234567890', 'Jakarta', '1777777', '08808080', '123132', '12312', 29, '2021-03-14 14:48:37', 'Pribadi', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (17, '768005035453000', '123123', 'DWI PUTRA GUNAWAN S', 'dwiputra05111990@gmail.com', '2', '089654135585', '2021-03-04 09:46:00', '2021-03-14 17:37:29', 'XWIDeN2NxtZ6l53n24oRrf0/ndJnHmwg4w2mHOEQDWU=', 't', NULL, NULL, '768005035453000', '1234567890', 'Jakarta', '1777777', '08808080', NULL, '778789', 29, '2022-03-10 14:51:44', 'Pribadi', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (15, '318249240002000', 'qweASD123', 'Account Test', 'accounttest@gmail.com', '2', '089765432123', '2021-01-26 18:09:42', '2021-02-02 12:59:57', 'FObpY4y/OJTN6+6ruMiOHztHxnEuwgL/w0L0Ir0GVE4=', 't', NULL, NULL, '318249240002000', NULL, NULL, NULL, NULL, NULL, NULL, 29, '2022-03-10 14:53:06', 'pribadi', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (21, 'cUki', 'cuki', NULL, NULL, '2', NULL, '2021-03-07 20:12:45', NULL, NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (18, 'bogem', 'bogem', NULL, NULL, '2', NULL, '2021-03-06 00:25:22', '2022-03-30 00:38:36', NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, '2022-04-04 09:40:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (34, '123451234512345', '123qweasdZXC', 'Agus Sukma', 'agussuka@gmail.com', '1', '0898765431234', '2022-04-02 21:23:17', '2022-04-05 13:15:26', 'mOqUqFKDbNiCe/ngu9mrgX7skWPjuEY3kSxo9ByxOV0=', 'f', NULL, NULL, '123451234512345', NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, '1', 'TbAdminUser(username=admin, password=admin, nama=Admin, jabatan=Administrator, status=1, createdDate=null, updatedDate=null, lastLogin=2022-04-05T13:14:18.340, createdBy=admin, tbAdminRoles=[TbAdminRole(idRole=1, nameRole=ROLE_ADMIN)])', '2022-04-02 21:23:17');
INSERT INTO "public"."master_user" VALUES (22, 'siNo', 'sino', NULL, NULL, '2', NULL, '2021-03-08 00:52:42', NULL, NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (20, 'cuki', 'Cuki123', NULL, NULL, '2', NULL, '2021-03-07 20:11:10', '2022-03-31 12:56:46', NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-31 12:56:46');
INSERT INTO "public"."master_user" VALUES (33, 'juragan', 'Juragan123', NULL, NULL, '2', NULL, '2022-03-31 12:56:00', '2022-03-31 13:00:28', NULL, 't', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-31 12:56:00');
INSERT INTO "public"."master_user" VALUES (29, '082828282828212', '123123', 'roma', 'romadhon123@gmail.com', '0', '0827272123', '2022-03-28 19:27:55', '2022-04-05 13:16:38', NULL, 'f', NULL, NULL, '082828282828212', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL);
INSERT INTO "public"."master_user" VALUES (31, '912832189382190', '123123', 'PT Usaha Bersama', 'askdaksdj@daksjdkj.com', '1', '090293482', '2022-03-28 21:27:03', '2022-04-05 13:17:10', 'Zgvfy2vHDNKfEVf61XYn5n0fVShhWadic+41+xqC3lY=', 'f', NULL, NULL, '912832189382190', NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, '93824983294', '19238492849', 'askjdsakd@dajskd', '2', 'TbAdminUser(username=admin, password=admin, nama=Admin, jabatan=Administrator, status=1, createdDate=null, updatedDate=null, lastLogin=2022-04-05T13:14:18.340, createdBy=admin, tbAdminRoles=[TbAdminRole(idRole=1, nameRole=ROLE_ADMIN)])', NULL);
INSERT INTO "public"."master_user" VALUES (13, '233333333333333', '123123', 'Fajar Hakiki 2', 'fajar2@gmail.com', '2', '089765432123', '2021-01-12 23:07:05', '2021-02-14 08:46:57', 'aJ6jwQDH4NjJtr3lVJIOaRsQ9+ybZMue5szS9oMmGjQ=', 't', NULL, NULL, '233333333333333', NULL, NULL, NULL, NULL, NULL, NULL, 30, '2021-03-07 20:25:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (12, '666666666666666', 'AkuGanteng123', 'abababa123', '123@gmail.dma', '2', '089765432123', '2021-01-12 02:24:56', '2022-04-05 13:17:38', 'xq+CITrMf0hI/LIxAwQjNtAqt9+97mW3GIU2UflKqGM=', 't', NULL, NULL, '666666666666666', NULL, 'Semarang', '0000', '0000', '0000', '123123', 29, NULL, 'Direktur', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (11, '888888888888888', '123123', 'nnn', 'asd@gmail.co', '0', '089765432123', '2021-01-12 02:22:39', '2022-03-31 13:48:01', 'Cmxkuhd3CRcec7eZVsclkEHNHp9YM8hlONcNEBhMcFU=', 'f', NULL, NULL, '888888888888888', NULL, NULL, NULL, NULL, NULL, NULL, 29, '2021-02-02 20:06:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."master_user" VALUES (8, '777777777777777', '123456', 'Fajar Hakiki', 'abcde@gmail.com', '2', '123213213', '2021-01-10 21:15:19', '2021-03-08 15:19:05', 'mWO9agAGGvkrC2y7ddxF5Q==', 't', NULL, NULL, '777777777777777', '1234567890', 'Jakarta', '0000', '+622222444', '929292', '12312', 29, '2022-04-02 21:19:12', 'Direktur', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for monitoring
-- ----------------------------
DROP TABLE IF EXISTS "public"."monitoring";
CREATE TABLE "public"."monitoring" (
  "id_monitoring" int8 NOT NULL DEFAULT nextval('monitoring_seq'::regclass),
  "id_layanan" int8,
  "jumlah_transaksi" int8,
  "perekam" varchar(255) COLLATE "pg_catalog"."default",
  "npwp_client" varchar(255) COLLATE "pg_catalog"."default",
  "periode_bulan" varchar(2) COLLATE "pg_catalog"."default",
  "periode_tahun" varchar(4) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of monitoring
-- ----------------------------
INSERT INTO "public"."monitoring" VALUES (1, 5, 20, NULL, '768005035453000', '02', '2022');
INSERT INTO "public"."monitoring" VALUES (3, 5, 30, NULL, '444444444444444', '02', '2022');
INSERT INTO "public"."monitoring" VALUES (5, 7, 5, NULL, '444444444444444', '03', '2022');
INSERT INTO "public"."monitoring" VALUES (6, 6, 2, NULL, '444444444444444', '01', '2022');
INSERT INTO "public"."monitoring" VALUES (2, 5, 1500, NULL, '000000000000000', '02', '2022');
INSERT INTO "public"."monitoring" VALUES (4, 5, 40, NULL, '444444444444444', '02', '2022');
INSERT INTO "public"."monitoring" VALUES (7, 5, 20, NULL, '777777777777777', '01', '2022');

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_access_token";
CREATE TABLE "public"."oauth_access_token" (
  "token_id" varchar(256) COLLATE "pg_catalog"."default",
  "token" bytea,
  "authentication_id" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "user_name" varchar(256) COLLATE "pg_catalog"."default",
  "client_id" varchar(256) COLLATE "pg_catalog"."default",
  "authentication" bytea,
  "refresh_token" varchar(256) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_approvals";
CREATE TABLE "public"."oauth_approvals" (
  "userid" varchar(256) COLLATE "pg_catalog"."default",
  "clientid" varchar(256) COLLATE "pg_catalog"."default",
  "scope" varchar(256) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "expiresat" timestamp(0),
  "lastmodifiedat" timestamp(0)
)
;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_details";
CREATE TABLE "public"."oauth_client_details" (
  "client_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "client_secret" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "web_server_redirect_uri" varchar(2048) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scope" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "access_token_validity" int4,
  "refresh_token_validity" int4,
  "resource_ids" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "authorized_grant_types" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "authorities" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "additional_information" varchar(4096) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "autoapprove" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO "public"."oauth_client_details" VALUES ('templateDev', 'templateDev', 'http://localhost:50000/auth/cek', 'READ,WRITE', 10800, 10000, 'sipajak', 'authorization_code,password,refresh_token,implicit', NULL, '{}', 'true');
INSERT INTO "public"."oauth_client_details" VALUES ('portalDev', 'portalDev', 'http://localhost:8080/auth/cek', 'READ,WRITE', 10800, 10000, 'sipajak', 'authorization_code,password,refresh_token,implicit', NULL, '{}', 'true');

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_token";
CREATE TABLE "public"."oauth_client_token" (
  "token_id" varchar(256) COLLATE "pg_catalog"."default",
  "token" bytea,
  "authentication_id" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "user_name" varchar(256) COLLATE "pg_catalog"."default",
  "client_id" varchar(256) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_code";
CREATE TABLE "public"."oauth_code" (
  "code" varchar(256) COLLATE "pg_catalog"."default",
  "authentication" bytea
)
;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_refresh_token";
CREATE TABLE "public"."oauth_refresh_token" (
  "token_id" varchar(256) COLLATE "pg_catalog"."default",
  "token" bytea,
  "authentication" bytea
)
;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------

-- ----------------------------
-- Table structure for paket_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."paket_permission";
CREATE TABLE "public"."paket_permission" (
  "id_paket" int4,
  "id_permission" int4,
  "min_transaction" int4,
  "max_transaction" int4,
  "harga_transaction" int8,
  "harga" int8,
  "diskon" float4
)
;

-- ----------------------------
-- Records of paket_permission
-- ----------------------------
INSERT INTO "public"."paket_permission" VALUES (29, 5, 200, 1000, 300000, 300000, 40);
INSERT INTO "public"."paket_permission" VALUES (29, 6, 100, 1000, 200000, 300000, 30);
INSERT INTO "public"."paket_permission" VALUES (29, 7, 200, 1000, 100000, 200000, 41);
INSERT INTO "public"."paket_permission" VALUES (30, 5, 100, 1000, 300000, 300000, 40);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission";
CREATE TABLE "public"."permission" (
  "id" int4 NOT NULL DEFAULT nextval('permission_seq'::regclass),
  "name" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO "public"."permission" VALUES (1, 'create_perekam');
INSERT INTO "public"."permission" VALUES (2, 'read_perekam');
INSERT INTO "public"."permission" VALUES (3, 'update_perekam');
INSERT INTO "public"."permission" VALUES (4, 'delete_perekam');
INSERT INTO "public"."permission" VALUES (5, 'app_filing');
INSERT INTO "public"."permission" VALUES (6, 'app_billing');
INSERT INTO "public"."permission" VALUES (7, 'app_faktur');

-- ----------------------------
-- Table structure for permission_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission_user";
CREATE TABLE "public"."permission_user" (
  "permission_id" int4,
  "user_id" int4
)
;

-- ----------------------------
-- Records of permission_user
-- ----------------------------
INSERT INTO "public"."permission_user" VALUES (1, 26);
INSERT INTO "public"."permission_user" VALUES (2, 26);
INSERT INTO "public"."permission_user" VALUES (3, 26);
INSERT INTO "public"."permission_user" VALUES (4, 26);
INSERT INTO "public"."permission_user" VALUES (5, 26);
INSERT INTO "public"."permission_user" VALUES (6, 26);
INSERT INTO "public"."permission_user" VALUES (7, 26);
INSERT INTO "public"."permission_user" VALUES (1, 12);
INSERT INTO "public"."permission_user" VALUES (2, 12);
INSERT INTO "public"."permission_user" VALUES (3, 12);
INSERT INTO "public"."permission_user" VALUES (4, 12);
INSERT INTO "public"."permission_user" VALUES (5, 12);
INSERT INTO "public"."permission_user" VALUES (6, 12);
INSERT INTO "public"."permission_user" VALUES (7, 12);
INSERT INTO "public"."permission_user" VALUES (5, 32);
INSERT INTO "public"."permission_user" VALUES (6, 32);
INSERT INTO "public"."permission_user" VALUES (7, 32);
INSERT INTO "public"."permission_user" VALUES (1, 10);
INSERT INTO "public"."permission_user" VALUES (2, 10);
INSERT INTO "public"."permission_user" VALUES (3, 10);
INSERT INTO "public"."permission_user" VALUES (4, 10);
INSERT INTO "public"."permission_user" VALUES (5, 10);
INSERT INTO "public"."permission_user" VALUES (6, 10);
INSERT INTO "public"."permission_user" VALUES (7, 10);
INSERT INTO "public"."permission_user" VALUES (1, 1);
INSERT INTO "public"."permission_user" VALUES (2, 1);
INSERT INTO "public"."permission_user" VALUES (3, 1);
INSERT INTO "public"."permission_user" VALUES (4, 1);
INSERT INTO "public"."permission_user" VALUES (5, 1);
INSERT INTO "public"."permission_user" VALUES (6, 1);
INSERT INTO "public"."permission_user" VALUES (7, 1);
INSERT INTO "public"."permission_user" VALUES (1, 17);
INSERT INTO "public"."permission_user" VALUES (2, 17);
INSERT INTO "public"."permission_user" VALUES (3, 17);
INSERT INTO "public"."permission_user" VALUES (4, 17);
INSERT INTO "public"."permission_user" VALUES (5, 17);
INSERT INTO "public"."permission_user" VALUES (6, 17);
INSERT INTO "public"."permission_user" VALUES (7, 17);
INSERT INTO "public"."permission_user" VALUES (1, 15);
INSERT INTO "public"."permission_user" VALUES (2, 15);
INSERT INTO "public"."permission_user" VALUES (3, 15);
INSERT INTO "public"."permission_user" VALUES (4, 15);
INSERT INTO "public"."permission_user" VALUES (5, 15);
INSERT INTO "public"."permission_user" VALUES (6, 15);
INSERT INTO "public"."permission_user" VALUES (7, 15);
INSERT INTO "public"."permission_user" VALUES (5, 33);
INSERT INTO "public"."permission_user" VALUES (6, 33);
INSERT INTO "public"."permission_user" VALUES (7, 33);
INSERT INTO "public"."permission_user" VALUES (1, 8);
INSERT INTO "public"."permission_user" VALUES (2, 8);
INSERT INTO "public"."permission_user" VALUES (3, 8);
INSERT INTO "public"."permission_user" VALUES (4, 8);
INSERT INTO "public"."permission_user" VALUES (5, 8);
INSERT INTO "public"."permission_user" VALUES (6, 8);
INSERT INTO "public"."permission_user" VALUES (7, 8);
INSERT INTO "public"."permission_user" VALUES (1, 11);
INSERT INTO "public"."permission_user" VALUES (2, 11);
INSERT INTO "public"."permission_user" VALUES (3, 11);
INSERT INTO "public"."permission_user" VALUES (4, 11);
INSERT INTO "public"."permission_user" VALUES (5, 11);
INSERT INTO "public"."permission_user" VALUES (6, 11);
INSERT INTO "public"."permission_user" VALUES (7, 11);
INSERT INTO "public"."permission_user" VALUES (5, 24);
INSERT INTO "public"."permission_user" VALUES (1, 2);
INSERT INTO "public"."permission_user" VALUES (2, 2);
INSERT INTO "public"."permission_user" VALUES (3, 2);
INSERT INTO "public"."permission_user" VALUES (4, 2);
INSERT INTO "public"."permission_user" VALUES (5, 2);
INSERT INTO "public"."permission_user" VALUES (5, 23);
INSERT INTO "public"."permission_user" VALUES (5, 19);
INSERT INTO "public"."permission_user" VALUES (1, 7);
INSERT INTO "public"."permission_user" VALUES (2, 7);
INSERT INTO "public"."permission_user" VALUES (3, 7);
INSERT INTO "public"."permission_user" VALUES (4, 7);
INSERT INTO "public"."permission_user" VALUES (5, 7);
INSERT INTO "public"."permission_user" VALUES (1, 27);
INSERT INTO "public"."permission_user" VALUES (2, 27);
INSERT INTO "public"."permission_user" VALUES (3, 27);
INSERT INTO "public"."permission_user" VALUES (4, 27);
INSERT INTO "public"."permission_user" VALUES (5, 27);
INSERT INTO "public"."permission_user" VALUES (5, 21);
INSERT INTO "public"."permission_user" VALUES (5, 18);
INSERT INTO "public"."permission_user" VALUES (5, 22);
INSERT INTO "public"."permission_user" VALUES (5, 20);
INSERT INTO "public"."permission_user" VALUES (1, 29);
INSERT INTO "public"."permission_user" VALUES (2, 29);
INSERT INTO "public"."permission_user" VALUES (3, 29);
INSERT INTO "public"."permission_user" VALUES (4, 29);
INSERT INTO "public"."permission_user" VALUES (5, 29);
INSERT INTO "public"."permission_user" VALUES (1, 13);
INSERT INTO "public"."permission_user" VALUES (2, 13);
INSERT INTO "public"."permission_user" VALUES (3, 13);
INSERT INTO "public"."permission_user" VALUES (4, 13);
INSERT INTO "public"."permission_user" VALUES (5, 13);
INSERT INTO "public"."permission_user" VALUES (1, 34);
INSERT INTO "public"."permission_user" VALUES (2, 34);
INSERT INTO "public"."permission_user" VALUES (3, 34);
INSERT INTO "public"."permission_user" VALUES (4, 34);
INSERT INTO "public"."permission_user" VALUES (5, 34);
INSERT INTO "public"."permission_user" VALUES (6, 34);
INSERT INTO "public"."permission_user" VALUES (7, 34);
INSERT INTO "public"."permission_user" VALUES (1, 31);
INSERT INTO "public"."permission_user" VALUES (2, 31);
INSERT INTO "public"."permission_user" VALUES (3, 31);
INSERT INTO "public"."permission_user" VALUES (4, 31);
INSERT INTO "public"."permission_user" VALUES (5, 31);
INSERT INTO "public"."permission_user" VALUES (6, 31);
INSERT INTO "public"."permission_user" VALUES (7, 31);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "public"."role";
CREATE TABLE "public"."role" (
  "id" int4 NOT NULL DEFAULT nextval('role_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO "public"."role" VALUES (1, 'ROLE_client');
INSERT INTO "public"."role" VALUES (2, 'ROLE_perekam');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_user";
CREATE TABLE "public"."role_user" (
  "role_id" int4,
  "user_id" int4
)
;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO "public"."role_user" VALUES (1, 1);
INSERT INTO "public"."role_user" VALUES (2, 2);
INSERT INTO "public"."role_user" VALUES (1, 7);
INSERT INTO "public"."role_user" VALUES (1, 8);
INSERT INTO "public"."role_user" VALUES (1, 10);
INSERT INTO "public"."role_user" VALUES (1, 11);
INSERT INTO "public"."role_user" VALUES (1, 12);
INSERT INTO "public"."role_user" VALUES (1, 13);
INSERT INTO "public"."role_user" VALUES (1, 15);
INSERT INTO "public"."role_user" VALUES (2, 18);
INSERT INTO "public"."role_user" VALUES (2, 19);
INSERT INTO "public"."role_user" VALUES (2, 20);
INSERT INTO "public"."role_user" VALUES (2, 21);
INSERT INTO "public"."role_user" VALUES (2, 22);
INSERT INTO "public"."role_user" VALUES (2, 23);
INSERT INTO "public"."role_user" VALUES (2, 24);
INSERT INTO "public"."role_user" VALUES (1, 26);
INSERT INTO "public"."role_user" VALUES (1, 27);
INSERT INTO "public"."role_user" VALUES (1, 29);
INSERT INTO "public"."role_user" VALUES (1, 31);
INSERT INTO "public"."role_user" VALUES (2, 32);
INSERT INTO "public"."role_user" VALUES (2, 33);
INSERT INTO "public"."role_user" VALUES (1, 34);

-- ----------------------------
-- Table structure for tb_admin_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_admin_role";
CREATE TABLE "public"."tb_admin_role" (
  "id_role" int8 NOT NULL DEFAULT nextval('admin_role_seq'::regclass),
  "name_role" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tb_admin_role
-- ----------------------------
INSERT INTO "public"."tb_admin_role" VALUES (3, 'ROLE_OPERASIONAL');
INSERT INTO "public"."tb_admin_role" VALUES (4, 'ROLE_MARKETING');
INSERT INTO "public"."tb_admin_role" VALUES (6, 'ROLE_TEKNIS');
INSERT INTO "public"."tb_admin_role" VALUES (5, 'ROLE_KEUANGAN');
INSERT INTO "public"."tb_admin_role" VALUES (2, 'ROLE_PENGAWAS');
INSERT INTO "public"."tb_admin_role" VALUES (1, 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_admin_user";
CREATE TABLE "public"."tb_admin_user" (
  "username" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "nama" varchar(255) COLLATE "pg_catalog"."default",
  "jabatan" varchar(100) COLLATE "pg_catalog"."default",
  "created_date" timestamp(0),
  "status" varchar(1) COLLATE "pg_catalog"."default",
  "last_login" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_date" timestamp(0)
)
;

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
INSERT INTO "public"."tb_admin_user" VALUES ('jordanku', 'qweasdZXC123', 'jordanku', 'Kepala Cabang', '2022-03-31 13:21:40', '1', '2022-04-05 13:27:38', 'admin', '2022-04-05 13:19:57');
INSERT INTO "public"."tb_admin_user" VALUES ('admin', 'admin', 'Admin', 'Administrator', NULL, '1', '2022-04-05 13:28:43', 'admin', NULL);
INSERT INTO "public"."tb_admin_user" VALUES ('Sevia Shela', '123qweasdZXC', 'sevia_marketing', 'Staff', '2022-04-05 13:29:28', '1', NULL, 'admin', NULL);

-- ----------------------------
-- Table structure for tb_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_admin_user_role";
CREATE TABLE "public"."tb_admin_user_role" (
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_role" int8 NOT NULL
)
;

-- ----------------------------
-- Records of tb_admin_user_role
-- ----------------------------
INSERT INTO "public"."tb_admin_user_role" VALUES ('admin', 1);
INSERT INTO "public"."tb_admin_user_role" VALUES ('jordanku', 3);
INSERT INTO "public"."tb_admin_user_role" VALUES ('jordanku', 4);
INSERT INTO "public"."tb_admin_user_role" VALUES ('Sevia Shela', 4);

-- ----------------------------
-- View structure for count_dashboard
-- ----------------------------
DROP VIEW IF EXISTS "public"."count_dashboard";
CREATE VIEW "public"."count_dashboard" AS  SELECT row_number() OVER () AS id_count,
    con.title AS layanan,
    mon.periode_bulan AS bulan,
    mon.periode_tahun AS tahun,
    sum(mon.jumlah_transaksi) AS jumlah
   FROM (monitoring mon
     LEFT JOIN content con ON ((mon.id_layanan = con.id_permission)))
  GROUP BY con.title, mon.periode_bulan, mon.periode_tahun
  ORDER BY con.title, mon.periode_tahun DESC, mon.periode_bulan DESC;

-- ----------------------------
-- View structure for monitoring_admin
-- ----------------------------
DROP VIEW IF EXISTS "public"."monitoring_admin";
CREATE VIEW "public"."monitoring_admin" AS  SELECT mon.id_monitoring AS id,
        CASE
            WHEN (tbm1.username IS NULL) THEN concat(tbm2.npwp, ' - ', tbm2.nama)
            ELSE concat(tbm1.npwp, ' - ', tbm1.nama)
        END AS nama_npwp_group,
        CASE
            WHEN (tbm1.username IS NULL) THEN tbm2.nama
            ELSE tbm1.nama
        END AS nama_group,
        CASE
            WHEN (tbm1.username IS NULL) THEN tbm2.npwp
            ELSE tbm1.npwp
        END AS npwp_group,
    tbm2.nama AS nama_client,
    tbm2.npwp AS npwp_client,
    mon.periode_bulan AS bulan,
    mon.periode_tahun AS tahun,
    concat(mon.periode_bulan, ' - ', mon.periode_tahun) AS periode,
    con1.title AS layanan,
    con2.title AS paket,
    mon.jumlah_transaksi,
    pp.harga AS biaya_paket,
        CASE
            WHEN ((mon.jumlah_transaksi - pp.max_transaction) <= 0) THEN (0)::bigint
            ELSE ((mon.jumlah_transaksi - pp.max_transaction) * pp.harga_transaction)
        END AS biaya_kelebihan_transaksi,
    (pp.harga +
        CASE
            WHEN ((mon.jumlah_transaksi - pp.max_transaction) <= 0) THEN (0)::bigint
            ELSE ((mon.jumlah_transaksi - pp.max_transaction) * pp.harga_transaction)
        END) AS total_biaya
   FROM (((((master_user tbm1
     RIGHT JOIN ( SELECT master_user.username,
            master_user.nama,
            master_user.id_parent_group,
            master_user.id_parent_admin,
            master_user.npwp,
            master_user.id_paket
           FROM master_user
          WHERE (master_user.id_parent_admin IS NULL)) tbm2 ON ((tbm1.id = tbm2.id_parent_group)))
     RIGHT JOIN monitoring mon ON (((tbm2.npwp)::text = (mon.npwp_client)::text)))
     LEFT JOIN content con1 ON ((mon.id_layanan = con1.id_permission)))
     LEFT JOIN content con2 ON ((tbm2.id_paket = con2.id_konten)))
     LEFT JOIN paket_permission pp ON (((pp.id_paket = tbm2.id_paket) AND (pp.id_permission = mon.id_layanan))))
  ORDER BY
        CASE
            WHEN (tbm1.username IS NULL) THEN tbm2.username
            ELSE tbm1.username
        END, tbm2.id_parent_group DESC, mon.periode_tahun DESC, mon.periode_bulan DESC, (concat(mon.periode_bulan, ' - ', mon.periode_tahun)) DESC;

-- ----------------------------
-- View structure for monitoring_client_anak
-- ----------------------------
DROP VIEW IF EXISTS "public"."monitoring_client_anak";
CREATE VIEW "public"."monitoring_client_anak" AS  SELECT mon.id_monitoring AS id,
    tbm2.nama AS nama_client,
    tbm2.npwp AS npwp_client,
    mon.perekam,
    mon.periode_bulan AS bulan,
    mon.periode_tahun AS tahun,
    concat(mon.periode_bulan, ' - ', mon.periode_tahun) AS periode,
    con1.title AS layanan,
    con2.title AS paket,
    mon.jumlah_transaksi
   FROM (((( SELECT master_user.username,
            master_user.nama,
            master_user.id_parent_group,
            master_user.id_parent_admin,
            master_user.npwp,
            master_user.id_paket
           FROM master_user
          WHERE (master_user.id_parent_admin IS NULL)) tbm2
     RIGHT JOIN monitoring mon ON (((tbm2.npwp)::text = (mon.npwp_client)::text)))
     LEFT JOIN content con1 ON ((mon.id_layanan = con1.id_permission)))
     LEFT JOIN content con2 ON ((tbm2.id_paket = con2.id_konten)))
  ORDER BY tbm2.username, tbm2.id_parent_group DESC, mon.periode_tahun DESC, mon.periode_bulan DESC, (concat(mon.periode_bulan, ' - ', mon.periode_tahun)) DESC;

-- ----------------------------
-- View structure for monitoring_client_induk
-- ----------------------------
DROP VIEW IF EXISTS "public"."monitoring_client_induk";
CREATE VIEW "public"."monitoring_client_induk" AS  SELECT mon.id_monitoring AS id,
        CASE
            WHEN (tbm1.username IS NULL) THEN concat(tbm2.npwp, ' - ', tbm2.nama)
            ELSE concat(tbm1.npwp, ' - ', tbm1.nama)
        END AS nama_npwp_group,
        CASE
            WHEN (tbm1.username IS NULL) THEN tbm2.nama
            ELSE tbm1.nama
        END AS nama_group,
        CASE
            WHEN (tbm1.username IS NULL) THEN tbm2.npwp
            ELSE tbm1.npwp
        END AS npwp_group,
    tbm2.nama AS nama_client,
    tbm2.npwp AS npwp_client,
    mon.periode_bulan AS bulan,
    mon.periode_tahun AS tahun,
    concat(mon.periode_bulan, ' - ', mon.periode_tahun) AS periode,
    con1.title AS layanan,
    con2.title AS paket,
    mon.jumlah_transaksi
   FROM ((((master_user tbm1
     RIGHT JOIN ( SELECT master_user.username,
            master_user.nama,
            master_user.id_parent_group,
            master_user.id_parent_admin,
            master_user.npwp,
            master_user.id_paket
           FROM master_user
          WHERE (master_user.id_parent_admin IS NULL)) tbm2 ON ((tbm1.id = tbm2.id_parent_group)))
     RIGHT JOIN monitoring mon ON (((tbm2.npwp)::text = (mon.npwp_client)::text)))
     LEFT JOIN content con1 ON ((mon.id_layanan = con1.id_permission)))
     LEFT JOIN content con2 ON ((tbm2.id_paket = con2.id_konten)))
  ORDER BY
        CASE
            WHEN (tbm1.username IS NULL) THEN tbm2.username
            ELSE tbm1.username
        END, tbm2.id_parent_group DESC, mon.periode_tahun DESC, mon.periode_bulan DESC, (concat(mon.periode_bulan, ' - ', mon.periode_tahun)) DESC;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."admin_role_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."content_seq"', 44, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."monitoring_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."permission_seq"', 11, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."role_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."user_seq"', 35, true);

-- ----------------------------
-- Uniques structure for table master_user
-- ----------------------------
ALTER TABLE "public"."master_user" ADD CONSTRAINT "master_user_username_key" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table master_user
-- ----------------------------
ALTER TABLE "public"."master_user" ADD CONSTRAINT "master_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table monitoring
-- ----------------------------
ALTER TABLE "public"."monitoring" ADD CONSTRAINT "monitoring_pkey" PRIMARY KEY ("id_monitoring");

-- ----------------------------
-- Primary Key structure for table oauth_access_token
-- ----------------------------
ALTER TABLE "public"."oauth_access_token" ADD CONSTRAINT "oauth_access_token_pkey" PRIMARY KEY ("authentication_id");

-- ----------------------------
-- Primary Key structure for table oauth_client_details
-- ----------------------------
ALTER TABLE "public"."oauth_client_details" ADD CONSTRAINT "oauth_client_details_pkey" PRIMARY KEY ("client_id");

-- ----------------------------
-- Primary Key structure for table oauth_client_token
-- ----------------------------
ALTER TABLE "public"."oauth_client_token" ADD CONSTRAINT "oauth_client_token_pkey" PRIMARY KEY ("authentication_id");

-- ----------------------------
-- Uniques structure for table permission
-- ----------------------------
ALTER TABLE "public"."permission" ADD CONSTRAINT "permission_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table permission
-- ----------------------------
ALTER TABLE "public"."permission" ADD CONSTRAINT "permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table permission_user
-- ----------------------------
CREATE INDEX "permission_id" ON "public"."permission_user" USING btree (
  "permission_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "user_id" ON "public"."permission_user" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table role_user
-- ----------------------------
CREATE INDEX "role_id" ON "public"."role_user" USING btree (
  "role_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_admin_role
-- ----------------------------
ALTER TABLE "public"."tb_admin_role" ADD CONSTRAINT "tb_admin_role_pkey" PRIMARY KEY ("id_role");

-- ----------------------------
-- Primary Key structure for table tb_admin_user
-- ----------------------------
ALTER TABLE "public"."tb_admin_user" ADD CONSTRAINT "tb_admin_user_pkey" PRIMARY KEY ("username");

-- ----------------------------
-- Primary Key structure for table tb_admin_user_role
-- ----------------------------
ALTER TABLE "public"."tb_admin_user_role" ADD CONSTRAINT "tb_admin_user_role_pkey" PRIMARY KEY ("username", "id_role");

-- ----------------------------
-- Foreign Keys structure for table permission_user
-- ----------------------------
ALTER TABLE "public"."permission_user" ADD CONSTRAINT "permission_user_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."permission_user" ADD CONSTRAINT "permission_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."master_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table role_user
-- ----------------------------
ALTER TABLE "public"."role_user" ADD CONSTRAINT "role_user_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."role_user" ADD CONSTRAINT "role_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."master_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
