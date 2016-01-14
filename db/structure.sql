CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
CREATE TABLE "subscriptions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "leader_id" integer, "follower_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_subscriptions_on_leader_id" ON "subscriptions" ("leader_id");
CREATE INDEX "index_subscriptions_on_follower_id" ON "subscriptions" ("follower_id");
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "body" text, "url" varchar, "type" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_posts_on_user_id" ON "posts" ("user_id");
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "post_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_comments_on_post_id" ON "comments" ("post_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
INSERT INTO schema_migrations (version) VALUES ('20160114085128');

INSERT INTO schema_migrations (version) VALUES ('20160114085505');

INSERT INTO schema_migrations (version) VALUES ('20160114091232');

INSERT INTO schema_migrations (version) VALUES ('20160114092221');

INSERT INTO schema_migrations (version) VALUES ('20160114101710');

