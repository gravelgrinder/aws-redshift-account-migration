CREATE TABLE IF NOT EXISTS "djl"."public"."users"(
    "id" INTEGER NULL IDENTITY (1, 1),
    "user_name" VARCHAR(30) NOT NULL,
    "first_name" VARCHAR(60) NULL,
    "last_name" VARCHAR(60) NULL,
    UNIQUE ("user_name"),
    PRIMARY KEY("id")
) ENCODE AUTO;

INSERT INTO "djl"."public"."users" (user_name, first_name, last_name) VALUES ('lwdvin', 'Devin', 'Lewis');
INSERT INTO "djl"."public"."users" (user_name, first_name, last_name) VALUES ('dojohn', 'John', 'Doe');

COMMIT;