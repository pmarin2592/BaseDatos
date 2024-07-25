CREATE TABLE JOBHUNTINGDB.LanguageLevels_TB
(
  LevelID        NUMBER(18)                     NOT NULL,
  LevelLanguage  VARCHAR2(3)                    NOT NULL,
  RankLevel      VARCHAR2(100)                  NOT NULL
);

COMMENT ON COLUMN JOBHUNTINGDB.LanguageLevels_TB.LevelID IS 'Llave primaria para el nivel';

COMMENT ON COLUMN JOBHUNTINGDB.LanguageLevels_TB.LevelLanguage IS 'Campo que indica el nivel del idioma';

COMMENT ON COLUMN JOBHUNTINGDB.LanguageLevels_TB.RankLevel IS 'Campo que indica el rango del nivel del idioma';


ALTER TABLE JOBHUNTINGDB.LanguageLevels_TB ADD (
  CONSTRAINT LanguageLevels_TB_PK
  PRIMARY KEY
  (LevelID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM LANGUAGELEVELS_TB FOR JOBHUNTINGDB.LANGUAGELEVELS_TB;
