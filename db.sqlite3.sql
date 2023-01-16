BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "website_contact" (
	"id"	integer NOT NULL,
	"name"	varchar(255) NOT NULL,
	"subject"	varchar(255) NOT NULL,
	"message"	text NOT NULL,
	"created_date"	datetime NOT NULL,
	"updated_date"	datetime NOT NULL,
	"email"	varchar(254) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "blog_post" (
	"id"	integer NOT NULL,
	"title"	varchar(255) NOT NULL,
	"content"	text NOT NULL,
	"content_view"	integer NOT NULL,
	"status"	bool NOT NULL,
	"published_date"	datetime,
	"updated_date"	datetime NOT NULL,
	"created_date"	datetime NOT NULL,
	"author_id"	integer,
	"image"	varchar(100) NOT NULL,
	FOREIGN KEY("author_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2023-01-14 12:38:40.066147');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2023-01-14 12:38:40.082141');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2023-01-14 12:38:40.106132');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2023-01-14 12:38:40.114130');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-01-14 12:38:40.122199');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2023-01-14 12:38:40.138202');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2023-01-14 12:38:40.146119');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2023-01-14 12:38:40.154112');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2023-01-14 12:38:40.162109');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2023-01-14 12:38:40.178103');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2023-01-14 12:38:40.178103');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-01-14 12:38:40.186099');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2023-01-14 12:38:40.194096');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-01-14 12:38:40.210096');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2023-01-14 12:38:40.218200');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2023-01-14 12:38:40.226081');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-01-14 12:38:40.242082');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2023-01-14 12:38:40.250273');
INSERT INTO "django_migrations" VALUES (19,'blog','0001_initial','2023-01-14 14:48:21.203842');
INSERT INTO "django_migrations" VALUES (20,'blog','0002_post_content_view','2023-01-15 04:18:17.393340');
INSERT INTO "django_migrations" VALUES (21,'blog','0003_post_status','2023-01-15 04:18:17.401338');
INSERT INTO "django_migrations" VALUES (22,'blog','0004_auto_20230115_0747','2023-01-15 04:18:17.425327');
INSERT INTO "django_migrations" VALUES (23,'website','0001_initial','2023-01-15 04:38:37.039441');
INSERT INTO "django_migrations" VALUES (24,'blog','0005_rename_creatted_date_post_created_date','2023-01-15 08:59:02.461153');
INSERT INTO "django_migrations" VALUES (25,'website','0002_contact_email','2023-01-15 12:12:16.101974');
INSERT INTO "django_migrations" VALUES (26,'blog','0006_auto_20230116_1446','2023-01-16 11:16:56.918729');
INSERT INTO "django_migrations" VALUES (27,'website','0003_alter_contact_options','2023-01-16 11:16:56.925233');
INSERT INTO "django_migrations" VALUES (28,'blog','0007_post_image','2023-01-16 12:43:39.609519');
INSERT INTO "django_admin_log" VALUES (1,'2023-01-14 13:18:12.376784','1','admin','[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (2,'2023-01-15 07:55:32.429051','1','Post object (1)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2023-01-15 07:56:08.901715','2','Post object (2)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2023-01-15 08:55:12.279870','3','title_test-3','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2023-01-15 12:15:35.529677','1','Contact object (1)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2023-01-15 12:19:28.166368','2','maryam','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2023-01-16 11:24:02.575592','2','Artin','[{"added": {}}]',4,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2023-01-16 11:24:56.910744','2','Artin','[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (9,'2023-01-16 11:25:23.193641','3','title_test-3','[{"changed": {"fields": ["Author"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (10,'2023-01-16 11:25:31.760750','1','title_1-1','[{"changed": {"fields": ["Author"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (11,'2023-01-16 13:11:26.984624','4','oipoipip-4','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (12,'2023-01-16 13:15:33.188472','4','oipoipip-4','[{"changed": {"fields": ["Image"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (13,'2023-01-16 19:09:48.337864','5','badan-5','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (14,'2023-01-16 19:11:19.304286','5','badan-5','[{"changed": {"fields": ["Published date"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (15,'2023-01-16 20:24:46.986755','2','title_2-2','[{"changed": {"fields": ["Author", "Status", "Published date"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (16,'2023-01-16 20:25:36.606837','2','title_2-2','[{"changed": {"fields": ["Image"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (17,'2023-01-16 20:25:53.520455','5','badan-5','[{"changed": {"fields": ["Published date"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (18,'2023-01-16 20:26:18.008470','3','title_test-3','[{"changed": {"fields": ["Published date"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (19,'2023-01-16 20:26:38.691625','4','oipoipip-4','[{"changed": {"fields": ["Image"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (20,'2023-01-16 20:28:15.903930','2','title_2-2','[{"changed": {"fields": ["Image", "Published date"]}}]',7,1,2);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'blog','post');
INSERT INTO "django_content_type" VALUES (8,'website','contact');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_post','Can add post');
INSERT INTO "auth_permission" VALUES (26,7,'change_post','Can change post');
INSERT INTO "auth_permission" VALUES (27,7,'delete_post','Can delete post');
INSERT INTO "auth_permission" VALUES (28,7,'view_post','Can view post');
INSERT INTO "auth_permission" VALUES (29,8,'add_contact','Can add contact');
INSERT INTO "auth_permission" VALUES (30,8,'change_contact','Can change contact');
INSERT INTO "auth_permission" VALUES (31,8,'delete_contact','Can delete contact');
INSERT INTO "auth_permission" VALUES (32,8,'view_contact','Can view contact');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$8XCe4a4Rw6QLSJvftLbvGH$upY4e9TgCJ2MRyNxurnuQK8OfqClnCUyFhTBZrOb2ps=','2023-01-14 13:02:53',1,'admin','taherpour','saharimat@gmail.com',1,1,'2023-01-14 12:59:37','sahar');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$260000$miZODDw3C6vwooRSo751fQ$8Q+OxAqN6OtHlLOzMZP733R1utdZB3jUsvOuif17eU4=',NULL,0,'Artin','Khodabandeh','Art@yahoo.com',0,1,'2023-01-16 11:24:02','Artin');
INSERT INTO "django_session" VALUES ('2rmm26m17dj5lfxmdhqk6pcrgh5b1yme','.eJxVjMsOgjAQRf-la9NQB1rGpXu-gXQeFdS0CYWV8d-VhIVu7znnvswYt3Uat6rLOIu5GGdOvxtFfmjegdxjvhXLJa_LTHZX7EGrHYro83q4fwdTrNO3ZkoJO4_aOvEEEJMwQgdOeg7EnaoDZeSEAUh69Q2qNMyEbZ98OJv3BxSLORI:1pGgBR:-Byeolh9QeU5CCzeB38DqJ4dhyOpLuAi4FqA3uqjFo0','2023-01-28 13:02:53.262209');
INSERT INTO "website_contact" VALUES (1,'sa','Company new programmer','interested in programming and  web designing','2023-01-15 12:15:35.523598','2023-01-15 12:15:35.523598','sada@gmail.com');
INSERT INTO "website_contact" VALUES (2,'maryam','mam','saate kare company shoma??','2023-01-15 12:19:28.150688','2023-01-15 12:19:28.150688','esfahani@yahoo.com');
INSERT INTO "blog_post" VALUES (1,'title_1','content_1',6,1,'2023-01-15 07:55:29','2023-01-16 20:38:11.359809','2023-01-15 07:55:32.429051',1,'blog/default.jpg');
INSERT INTO "blog_post" VALUES (2,'title_2','content_2',0,1,'2023-01-16 07:56:02','2023-01-16 20:28:15.903930','2023-01-15 07:56:08.901715',2,'blog/cat-widget3.jpg');
INSERT INTO "blog_post" VALUES (3,'title_test','contm,nmlmjlfd,gffmdmg',7,1,'2023-01-24 08:54:59','2023-01-16 20:26:18.008470','2023-01-13 08:55:12.254894',2,'blog/default.jpg');
INSERT INTO "blog_post" VALUES (4,'oipoipip','m,nnn,mnnm,n',2,1,'2023-01-16 13:11:22','2023-01-16 20:37:50.195141','2023-01-16 13:11:26.969626',1,'blog/pp4.jpg');
INSERT INTO "blog_post" VALUES (5,'badan','inooo badan neshon bede',0,1,'2023-01-20 19:09:37','2023-01-16 20:25:53.520455','2023-01-16 19:09:48.300245',1,'blog/b1.jpg');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "blog_post_author_id_dd7a8485" ON "blog_post" (
	"author_id"
);
COMMIT;
