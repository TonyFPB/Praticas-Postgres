CREATE DATABASE agenciadeviagens;

CREATE TABLE agency(
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE
);

CREATE TABLE airports(
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE
);

INSERT INTO teste ("teste1","teste2") values (1,2);

CREATE TABLE flights (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"agencyId" integer NOT NULL,
	"departureId" integer NOT NULL,
	"destinationId" integer NOT NULL,
	"leavingDate" DATE NOT NULL,
	"arriveDate" DATE NOT NULL
);

ALTER TABLE flights ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("agencyId") REFERENCES "agency"("id");
ALTER TABLE flights ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("departureId") REFERENCES "airports"("id");
ALTER TABLE flights ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("destinationId") REFERENCES "airports"("id");

