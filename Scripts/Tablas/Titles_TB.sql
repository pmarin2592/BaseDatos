CREATE TABLE JOBHUNTINGDB.Titles_TB
(
  TitleID  NUMBER(18)                           NOT NULL,
  Title    VARCHAR2(100)                        NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.Titles_TB IS 'Tabla que almacena los titulos en general';

COMMENT ON COLUMN JOBHUNTINGDB.Titles_TB.TitleID IS 'Llave primaria para el codigo del titulo';

COMMENT ON COLUMN JOBHUNTINGDB.Titles_TB.Title IS 'Campo que almacena el nombre del titulo';


ALTER TABLE JOBHUNTINGDB.Titles_TB ADD (
  CONSTRAINT Titles_TB_PK
  PRIMARY KEY
  (TitleID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM TITLES_TB FOR JOBHUNTINGDB.TITLES_TB;