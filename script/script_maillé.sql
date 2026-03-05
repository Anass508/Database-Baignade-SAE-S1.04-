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

-- object: public."ÉLÈVES" | type: TABLE --
-- DROP TABLE IF EXISTS public."ÉLÈVES" CASCADE;
CREATE TABLE public."ÉLÈVES" (
	"id_élèves" integer NOT NULL,
	nom varchar(50) NOT NULL,
	"prénom" varchar(50) NOT NULL,
	"idCours_COURS" integer,
	CONSTRAINT "SITES_pk" PRIMARY KEY ("id_élèves")
);
-- ddl-end --
ALTER TABLE public."ÉLÈVES" OWNER TO postgres;
-- ddl-end --

-- object: public."COURS" | type: TABLE --
-- DROP TABLE IF EXISTS public."COURS" CASCADE;
CREATE TABLE public."COURS" (
	"idCours" integer NOT NULL,
	nom_cours varchar(50) NOT NULL,
	salle date NOT NULL,
	CONSTRAINT "COURS_pk" PRIMARY KEY ("idCours")
);
-- ddl-end --
ALTER TABLE public."COURS" OWNER TO postgres;
-- ddl-end --

-- object: "COURS_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ÉLÈVES" DROP CONSTRAINT IF EXISTS "COURS_fk" CASCADE;
ALTER TABLE public."ÉLÈVES" ADD CONSTRAINT "COURS_fk" FOREIGN KEY ("idCours_COURS")
REFERENCES public."COURS" ("idCours") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "ÉLÈVES_uq" | type: CONSTRAINT --
-- ALTER TABLE public."ÉLÈVES" DROP CONSTRAINT IF EXISTS "ÉLÈVES_uq" CASCADE;
ALTER TABLE public."ÉLÈVES" ADD CONSTRAINT "ÉLÈVES_uq" UNIQUE ("idCours_COURS");
-- ddl-end --

-- object: public."many_ÉLÈVES_has_many_COURS" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_ÉLÈVES_has_many_COURS" CASCADE;
CREATE TABLE public."many_ÉLÈVES_has_many_COURS" (
	"id_élèves_ÉLÈVES" integer NOT NULL,
	"idCours_COURS" integer NOT NULL,
	CONSTRAINT "many_ÉLÈVES_has_many_COURS_pk" PRIMARY KEY ("id_élèves_ÉLÈVES","idCours_COURS")
);
-- ddl-end --

-- object: "ÉLÈVES_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_ÉLÈVES_has_many_COURS" DROP CONSTRAINT IF EXISTS "ÉLÈVES_fk" CASCADE;
ALTER TABLE public."many_ÉLÈVES_has_many_COURS" ADD CONSTRAINT "ÉLÈVES_fk" FOREIGN KEY ("id_élèves_ÉLÈVES")
REFERENCES public."ÉLÈVES" ("id_élèves") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "COURS_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_ÉLÈVES_has_many_COURS" DROP CONSTRAINT IF EXISTS "COURS_fk" CASCADE;
ALTER TABLE public."many_ÉLÈVES_has_many_COURS" ADD CONSTRAINT "COURS_fk" FOREIGN KEY ("idCours_COURS")
REFERENCES public."COURS" ("idCours") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


