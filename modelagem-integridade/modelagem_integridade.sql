CREATE TABLE "states" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "cities" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"stateId" integer NOT NULL
);

CREATE TABLE "customerAddresses" (
	"id" serial PRIMARY KEY,
	"customerId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" integer NOT NULL UNIQUE,
	"cityId" integer NOT NULL
);

CREATE TABLE "customerPhones" (
	"id" serial PRIMARY KEY,
	"customerId" integer NOT NULL,
	"number" integer NOT NULL UNIQUE,
	"type" TEXT NOT NULL
);

CREATE TABLE "customers" (
	"id" serial PRIMARY KEY,
	"fullName" TEXT NOT NULL UNIQUE,
	"cpf" integer NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT(4) NOT NULL
);

CREATE TABLE "bankAccount" (
	"id" serial PRIMARY KEY,
	"customerId" integer NOT NULL,
	"acocountNumber" integer NOT NULL UNIQUE,
	"agency" integer NOT NULL,
	"openDate" DATE NOT NULL DEFAULT 'NOW()',
	"closeDate" DATE
);

CREATE TABLE "transactions" (
	"id" serial PRIMARY KEY,
	"bankAccountId" integer NOT NULL,
	"amount" integer NOT NULL,
	"type" TEXT NOT NULL,
	"time" timestamp with time zone NOT NULL DEFAULT 'NOW()',
	"description" TEXT NOT NULL,
	"cancelled" BOOLEAN NOT NULL DEFAULT 'false'
);

CREATE TABLE "creditCards" (
	"id" serial PRIMARY KEY,
	"bankAccountId" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"number" integer NOT NULL UNIQUE,
	"securityCode" integer NOT NULL UNIQUE,
	"expirationMonth" integer NOT NULL,
	"expirationYear" integer NOT NULL,
	"password" integer NOT NULL,
	"limit" integer NOT NULL
);

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");









