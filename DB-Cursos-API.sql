CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "gender" varchar,
  "country" char(3),
  "category_id" serial,
  "rol_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level_id" int,
  "teacher" varchar,
  "duration" int,
  "category_id" uuid
);

CREATE TABLE "level" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_videos" (
  "id" serial PRIMARY KEY,
  "url" varchar NOT NULL,
  "name" varchar,
  "description" text,
  "duration" int,
  "curse_id" uuid
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("curse_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "level" ("id");

--CRUD

insert  into categories (
id,
name
) values (
'75ebe7d8-62f1-4c38-af60-24b36457ffaa',
'Modelado 3D'
),(
'd92415ba-b1e6-4138-bbb0-ee51148a3ee9',
'Animacion 3D'
);

insert  into level (
name
) values (
'Principiante'
), (
'Intermedio'
),(
'Avanzado'
);


insert  into courses (
id,
title,
description,
level_id,
teacher,
duration,
category_id
) values (
'323dadeb-0501-4e6d-bc10-1fa6bdd2afdd',
'Modelado 3D en Blender',
'en este curso introductorio, aprenderas las bases, manejo de interface, y sculpido organico',
1,
'Roberto Matta',
40,
'75ebe7d8-62f1-4c38-af60-24b36457ffaa'
),(
'd47756e8-8a9e-45f4-8bb6-74965c4a2726',
'Animacion 3D en Maya',
'en este curso aprenderas las bases de la animacion, manejo de esqueletos y el time',
1,
'David Manzur',
120,
'd92415ba-b1e6-4138-bbb0-ee51148a3ee9'
);

insert into course_videos (
url,
name,
description,
duration,
curse_id
)values(
'https://www.cursos.com/clases/v2/12425/player/50720/',
'bases del modelado en Blender',
'en esta clase aprenderas el manejo del guismo y a extruir tu primer objeto',
20,
'323dadeb-0501-4e6d-bc10-1fa6bdd2afdd'
),(
'https://www.cursos.com/clases/v2/12000/player/50721/',
'aprendiendo la interface',
'en esta clase conoceras el entorno de trabajo y sus principales herramientas',
20,
'd47756e8-8a9e-45f4-8bb6-74965c4a2726'
);

insert into roles (
id,
name
) values(
'c5ea1619-6634-489d-ae57-5d953436b3cf',
'student'
),(
'be429d0d-abfc-40d6-90ea-b1c3c6fd2b54',
'teacher'
)

insert into users (
id,
first_name,
last_name,
email,
"password",
age,
gender,
country,
rol_id
) values(
'ff97c7b2-9f05-4035-8ed6-9b571627babb',
'Camilo',
'Sanchez',
'camsan@studen.com',
'1234',
20,
'Male',
'ARG',
'c5ea1619-6634-489d-ae57-5d953436b3cf'
),(
'6cb38e3c-72b2-46da-aaf6-ec54ee73fc23',
'Tomas',
'Pardo',
'tompa@studen.com',
'4321',
21,
'Male',
'COL',
'c5ea1619-6634-489d-ae57-5d953436b3cf'
);

--join

select *  from courses as cou inner join categories as cat on cou.category_id = cat.id; 