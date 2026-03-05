-- ** Database generated with pgModeler (PostgreSQL Database Modeler).
-- ** pgModeler version: 1.2.2
-- ** PostgreSQL version: 18.0
-- ** Project Site: pgmodeler.io
-- ** Model Author: ---

-- ** Database creation must be performed outside a multi lined SQL file. 
-- ** These commands were put in this file only as a convenience.

-- object: association_fonctionelle_2 | type: DATABASE --
-- DROP DATABASE IF EXISTS association_fonctionelle_2;
CREATE DATABASE association_fonctionelle_2;
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

-- object: idsite_fk | type: CONSTRAINT --
-- ALTER TABLE public."ANALYSES" DROP CONSTRAINT IF EXISTS idsite_fk CASCADE;
ALTER TABLE public."ANALYSES" ADD CONSTRAINT idsite_fk FOREIGN KEY ("idSite")
REFERENCES public."SITES" ("idSite") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


