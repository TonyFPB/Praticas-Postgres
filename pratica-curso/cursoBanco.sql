CREATE DATABASE CURSO;

CREATE TABLE "alunos" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"cpf" varchar(11) NOT NULL UNIQUE 
);



CREATE TABLE "turmas" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE	 
);



CREATE TABLE "classes" (
	"id" serial NOT NULL PRIMARY KEY,
	"alunoId" integer NOT NULL,
	"turmaId" integer NOT NULL,
	"entrada" DATE NOT NULL DEFAULT 'NOW()',
	"saida" DATE
);



CREATE TABLE "modulos" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);



CREATE TABLE "projetos" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"moduloId" integer NOT NULL
);


CREATE TYPE "notaType" AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE "entrega_dos_alunos" (
	"id" serial NOT NULL PRIMARY KEY,
	"projetoId" integer NOT NULL,
	"classeId" integer NOT NULL,
	"nota" "notaType",
	"dataDeEntrega" DATE
);





ALTER TABLE "classes" ADD CONSTRAINT "classes_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");
ALTER TABLE "classes" ADD CONSTRAINT "classes_fk1" FOREIGN KEY ("turmaId") REFERENCES "turmas"("id");


ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("moduloId") REFERENCES "modulos"("id");

ALTER TABLE "entrega_dos_alunos" ADD CONSTRAINT "entrega_dos_alunos_fk0" FOREIGN KEY ("projetoId") REFERENCES "projetos"("id");
ALTER TABLE "entrega_dos_alunos" ADD CONSTRAINT "entrega_dos_alunos_fk1" FOREIGN KEY ("classeId") REFERENCES "classes"("id");

