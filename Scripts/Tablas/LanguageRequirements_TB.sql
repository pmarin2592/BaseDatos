CREATE TABLE JOBHUNTINGDB.LanguageRequirements_TB
(
  LanguageID  NUMBER(18)                        NOT NULL,
  PositionID  NUMBER(18)                        NOT NULL,
  LevelID     NUMBER(18)                        NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.LanguageRequirements_TB IS 'Tabala que alamacena los idiomas requeridos para el puesto';

COMMENT ON COLUMN JOBHUNTINGDB.LanguageRequirements_TB.LanguageID IS 'Campo que almacena la llave primaria y foranea de Idioma';

COMMENT ON COLUMN JOBHUNTINGDB.LanguageRequirements_TB.PositionID IS 'Campo que almacena la llave primaria y foranea de puesto';

COMMENT ON COLUMN JOBHUNTINGDB.LanguageRequirements_TB.LevelID IS 'Campo que almacena la foranea de niveles';


ALTER TABLE JOBHUNTINGDB.LanguageRequirements_TB ADD (
  CONSTRAINT LanguageRequirements_PK
  PRIMARY KEY
  (LanguageID)
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.LanguageRequirements_TB ADD (
  CONSTRAINT LanguageIDLanguageRequirements_FK 
  FOREIGN KEY (LanguageID) 
  REFERENCES JOBHUNTINGDB.LANGUAGES_TB (LanguageID)
  ENABLE VALIDATE
,  CONSTRAINT PositionIDLanguageRequirements_FK 
  FOREIGN KEY (LanguageID) 
  REFERENCES JOBHUNTINGDB.JOBPOSITIONS_TB (POSITIONID)
  ENABLE VALIDATE
,  CONSTRAINT LevelIDLanguageRequirements_FK 
  FOREIGN KEY (LevelID) 
  REFERENCES JOBHUNTINGDB.LANGUAGELEVELS_TB (LevelID)
  ENABLE VALIDATE);
  
  CREATE PUBLIC SYNONYM LanguageRequirements_TB FOR JOBHUNTINGDB.LanguageRequirements_TB;