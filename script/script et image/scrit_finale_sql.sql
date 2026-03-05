CREATE TABLE REGIONS (
     code_regions VARCHAR(10) PRIMARY KEY,
     nom_regions VARCHAR(50) NOT NULL 
);
CREATE TABLE DEPARTEMENTS (
     code_departement VARCHAR(10) PRIMARY KEY,
     region VARCHAR(10) NOT NULL REFERENCES REGIONS(code_regions),
     nom_departement VARCHAR(50) NOT NULL
);


CREATE TABLE COMMUNES (
     code_commune VARCHAR(10) PRIMARY KEY,
     departement VARCHAR(10) NOT NULL REFERENCES DEPARTEMENTS(code_departement),
     nom_commune VARCHAR(50) NOT NULL
);


CREATE TABLE SITES (
    idSite VARCHAR(100) PRIMARY KEY,
    nom_site VARCHAR(200) NOT NULL,
    code_commune VARCHAR(10) NOT NULL REFERENCES COMMUNES(code_commune),
    date_Declaration Date,
    typeEau VARCHAR(100),
    longitude DECIMAL(9,6),
    latitude DECIMAL(9,6)
);
 CREATE TABLE EVENEMENTS (
      idEvenement INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      idSite VARCHAR(100) NOT NULL REFERENCES SITES(idSite),
      evenement VARCHAR(500),
      debut DATE,
      fin DATE,
      mesure VARCHAR(500)
);
CREATE TABLE ANALYSES (
     idAnalyse INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
     idSite VARCHAR(100) NOT NULL REFERENCES SITES(idSite),
     datePrelevement DATE NOT NULL,
     enterocoques INTEGER,
     escherichia INTEGER
);
