-- ** Database generated with pgModeler (PostgreSQL Database Modeler).
-- ** pgModeler version: 1.2.2
-- ** PostgreSQL version: 18.0
-- ** Project Site: pgmodeler.io
-- ** Model Author: ---

-- ** Database creation must be performed outside a multi lined SQL file. 
-- ** These commands were put in this file only as a convenience.

-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


SET search_path TO pg_catalog,public;
-- ddl-end --

-- object: public."SITES" | type: TABLE --
-- DROP TABLE IF EXISTS public."SITES" CASCADE;
CREATE TABLE public."SITES" (
	"idSite" varchar(100) NOT NULL,
	nom_site varchar(200) NOT NULL,
	code_commune varchar(10) NOT NULL,
	"date_Declaration" date,
	"typeEau" varchar(100),
	longitude decimal(9,6),
	latitude decimal(9,6),
	CONSTRAINT "SITES_pk" PRIMARY KEY ("idSite")
);
-- ddl-end --
ALTER TABLE public."SITES" OWNER TO postgres;
-- ddl-end --

-- object: public."ANALYSES" | type: TABLE --
-- DROP TABLE IF EXISTS public."ANALYSES" CASCADE;
CREATE TABLE public."ANALYSES" (
	"idAnalyse" integer NOT NULL,
	"idSite" varchar(50) NOT NULL,
	"datePrelevement" date NOT NULL,
	enterocoques integer,
	escherichia integer,
	CONSTRAINT "ANALYSES_pk" PRIMARY KEY ("idAnalyse")
);
-- ddl-end --
ALTER TABLE public."ANALYSES" OWNER TO postgres;
-- ddl-end --

-- object: public."REGIONS" | type: TABLE --
-- DROP TABLE IF EXISTS public."REGIONS" CASCADE;
CREATE TABLE public."REGIONS" (
	code_regions varchar(10) NOT NULL,
	nom_regions varchar(50) NOT NULL,
	CONSTRAINT "REGIONS_pk" PRIMARY KEY (code_regions)
);
-- ddl-end --
ALTER TABLE public."REGIONS" OWNER TO postgres;
-- ddl-end --

-- object: public."DEPARTEMENTS" | type: TABLE --
-- DROP TABLE IF EXISTS public."DEPARTEMENTS" CASCADE;
CREATE TABLE public."DEPARTEMENTS" (
	code_departement varchar(10) NOT NULL,
	region varchar(10) NOT NULL,
	nom_departement varchar(50) NOT NULL,
	CONSTRAINT "DEPARTEMENTS_pk" PRIMARY KEY (code_departement)
);
-- ddl-end --
ALTER TABLE public."DEPARTEMENTS" OWNER TO postgres;
-- ddl-end --

-- object: public."COMMUNES" | type: TABLE --
-- DROP TABLE IF EXISTS public."COMMUNES" CASCADE;
CREATE TABLE public."COMMUNES" (
	code_commune varchar(10) NOT NULL,
	departement varchar(10) NOT NULL,
	nom_commune varchar(50) NOT NULL,
	CONSTRAINT "COMMUNES_pk" PRIMARY KEY (code_commune)
);
-- ddl-end --
ALTER TABLE public."COMMUNES" OWNER TO postgres;
-- ddl-end --

-- object: public."EVENEMENTS" | type: TABLE --
-- DROP TABLE IF EXISTS public."EVENEMENTS" CASCADE;
CREATE TABLE public."EVENEMENTS" (
	"idEvenement" integer NOT NULL,
	"idSite" varchar(50) NOT NULL,
	evenement varchar(500),
	debut date,
	fin date,
	mesure varchar(500),
	CONSTRAINT "EVENEMENTS_pk" PRIMARY KEY ("idEvenement")
);
-- ddl-end --
ALTER TABLE public."EVENEMENTS" OWNER TO postgres;
-- ddl-end --

-- object: code_fk | type: CONSTRAINT --
-- ALTER TABLE public."SITES" DROP CONSTRAINT IF EXISTS code_fk CASCADE;
ALTER TABLE public."SITES" ADD CONSTRAINT code_fk FOREIGN KEY (code_commune)
REFERENCES public."COMMUNES" (code_commune) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "idSite_analyses_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ANALYSES" DROP CONSTRAINT IF EXISTS "idSite_analyses_fk" CASCADE;
ALTER TABLE public."ANALYSES" ADD CONSTRAINT "idSite_analyses_fk" FOREIGN KEY ("idSite")
REFERENCES public."SITES" ("idSite") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: code_fk | type: CONSTRAINT --
-- ALTER TABLE public."DEPARTEMENTS" DROP CONSTRAINT IF EXISTS code_fk CASCADE;
ALTER TABLE public."DEPARTEMENTS" ADD CONSTRAINT code_fk FOREIGN KEY (region)
REFERENCES public."REGIONS" (code_regions) MATCH SIMPLE
ON DELETE SET DEFAULT ON UPDATE NO ACTION;
-- ddl-end --

-- object: code_fk | type: CONSTRAINT --
-- ALTER TABLE public."COMMUNES" DROP CONSTRAINT IF EXISTS code_fk CASCADE;
ALTER TABLE public."COMMUNES" ADD CONSTRAINT code_fk FOREIGN KEY (departement)
REFERENCES public."DEPARTEMENTS" (code_departement) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "idSite_fk" | type: CONSTRAINT --
-- ALTER TABLE public."EVENEMENTS" DROP CONSTRAINT IF EXISTS "idSite_fk" CASCADE;
ALTER TABLE public."EVENEMENTS" ADD CONSTRAINT "idSite_fk" FOREIGN KEY ("idSite")
REFERENCES public."SITES" ("idSite") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


