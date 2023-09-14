/*
PostgreSQL Backup
Database: EventRegisteration/public
Backup Time: 2023-09-11 14:09:11
*/

DROP SEQUENCE IF EXISTS "public"."events_registeration_id_seq";
DROP SEQUENCE IF EXISTS "public"."otp_id_seq";
DROP SEQUENCE IF EXISTS "public"."registered_user_id_seq";
DROP SEQUENCE IF EXISTS "public"."temp_id_seq";
DROP TABLE IF EXISTS "public"."events_registeration";
DROP TABLE IF EXISTS "public"."otp";
DROP TABLE IF EXISTS "public"."registered_user";
DROP TABLE IF EXISTS "public"."temp";
CREATE SEQUENCE "events_registeration_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE SEQUENCE "otp_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE SEQUENCE "registered_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE SEQUENCE "temp_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE TABLE "events_registeration" (
  "id" int4 NOT NULL DEFAULT nextval('events_registeration_id_seq'::regclass),
  "create_date" timestamp(6),
  "user_id" int4
)
;
ALTER TABLE "events_registeration" OWNER TO "postgres";
CREATE TABLE "otp" (
  "id" int4 NOT NULL DEFAULT nextval('otp_id_seq'::regclass),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "time_stamp" timestamp(6),
  "valid_until" timestamp(6)
)
;
ALTER TABLE "otp" OWNER TO "postgres";
CREATE TABLE "registered_user" (
  "id" int4 NOT NULL DEFAULT nextval('registered_user_id_seq'::regclass),
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "grade" int4,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "school" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "registered_user" OWNER TO "postgres";
CREATE TABLE "temp" (
  "id" int4 NOT NULL DEFAULT nextval('temp_id_seq'::regclass),
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "grade" int4,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "school" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "temp" OWNER TO "postgres";
BEGIN;
LOCK TABLE "public"."events_registeration" IN SHARE MODE;
DELETE FROM "public"."events_registeration";
INSERT INTO "public"."events_registeration" ("id","create_date","user_id") VALUES (1, '2023-09-11 13:45:12.277139', 2)
;
COMMIT;
BEGIN;
LOCK TABLE "public"."otp" IN SHARE MODE;
DELETE FROM "public"."otp";
INSERT INTO "public"."otp" ("id","code","email","time_stamp","valid_until") VALUES (1, '8206', '"testuser@gmail.com"', '2023-09-11 13:01:18.184807', '2023-09-11 13:16:18.184807'),(2, '0230', '"hi@gmail.com"', '2023-09-11 13:08:56.313228', '2023-09-11 13:23:56.313228'),(3, '0237', 'test@gmail.com', '2023-09-11 13:41:38.489322', '2023-09-11 13:56:38.489322')
;
COMMIT;
BEGIN;
LOCK TABLE "public"."registered_user" IN SHARE MODE;
DELETE FROM "public"."registered_user";
INSERT INTO "public"."registered_user" ("id","city","email","grade","name","school","state") VALUES (1, 'pune', 'testuser@gmail.com', 3, 'Test User', 'New english school', 'MH'),(2, 'Pune', 'test@gmail.com', 1, 'test', 'Govt school', 'MH')
;
COMMIT;
BEGIN;
LOCK TABLE "public"."temp" IN SHARE MODE;
DELETE FROM "public"."temp";
INSERT INTO "public"."temp" ("id","city","email","grade","name","school","state") VALUES (1, NULL, '"testuser@gmail.com"', 0, NULL, NULL, NULL),(2, NULL, '"hi@gmail.com"', 0, NULL, NULL, NULL)
;
COMMIT;
ALTER TABLE "events_registeration" ADD CONSTRAINT "events_registeration_pkey" PRIMARY KEY ("id");
ALTER TABLE "otp" ADD CONSTRAINT "otp_pkey" PRIMARY KEY ("id");
ALTER TABLE "registered_user" ADD CONSTRAINT "registered_user_pkey" PRIMARY KEY ("id");
ALTER TABLE "temp" ADD CONSTRAINT "temp_pkey" PRIMARY KEY ("id");
ALTER SEQUENCE "events_registeration_id_seq"
OWNED BY "events_registeration"."id";
SELECT setval('"events_registeration_id_seq"', 1, true);
ALTER SEQUENCE "events_registeration_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "otp_id_seq"
OWNED BY "otp"."id";
SELECT setval('"otp_id_seq"', 3, true);
ALTER SEQUENCE "otp_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "registered_user_id_seq"
OWNED BY "registered_user"."id";
SELECT setval('"registered_user_id_seq"', 2, true);
ALTER SEQUENCE "registered_user_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "temp_id_seq"
OWNED BY "temp"."id";
SELECT setval('"temp_id_seq"', 3, true);
ALTER SEQUENCE "temp_id_seq" OWNER TO "postgres";
