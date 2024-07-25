CREATE TABLE JOBHUNTINGDB.Languages_TB
(
  LanguageID  NUMBER(18)                        NOT NULL,
  LanguageL   VARCHAR2(50)                      NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.Languages_TB IS 'Tabla que almacena los idiomas';

COMMENT ON COLUMN JOBHUNTINGDB.Languages_TB.LanguageID IS 'Llave primaria para el idioma';

COMMENT ON COLUMN JOBHUNTINGDB.Languages_TB.LanguageL IS 'Campo que almacena el idioma';


ALTER TABLE JOBHUNTINGDB.Languages_TB ADD (
  CONSTRAINT Languages_TB_PK
  PRIMARY KEY
  (LanguageID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM LANGUAGES_TB FOR JOBHUNTINGDB.LANGUAGES_TB;
