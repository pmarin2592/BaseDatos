CREATE TABLE JOBHUNTINGDB.TitleRequirements_TB
(
  TitleID     NUMBER(18)                        NOT NULL,
  PositionID  NUMBER(18)                        NOT NULL,
  Desirable   NUMBER(1)                         DEFAULT 0                     NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.TitleRequirements_TB IS 'Tabla que almacena los titulos que requieren las postulaciones';

COMMENT ON COLUMN JOBHUNTINGDB.TitleRequirements_TB.TitleID IS 'Llave primaria y foranea para el codigo de los titulos';

COMMENT ON COLUMN JOBHUNTINGDB.TitleRequirements_TB.PositionID IS 'Llave primaria y foranea para el codigo de la potulacion';

COMMENT ON COLUMN JOBHUNTINGDB.TitleRequirements_TB.Desirable IS 'Campo que indica si el titulo es indespensable';


ALTER TABLE JOBHUNTINGDB.TitleRequirements_TB ADD (
  CONSTRAINT TitleRequirements_TB_PK
  PRIMARY KEY
  (TitleID)
  ENABLE VALIDATE
,  CONSTRAINT Desirable_CK
  CHECK (Desirable in(0,1))
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.TitleRequirements_TB ADD (
  CONSTRAINT TitleIDTitleRequirements_FK 
  FOREIGN KEY (TitleID) 
  REFERENCES JOBHUNTINGDB.TITLES_TB (TitleID)
  ENABLE VALIDATE
,  CONSTRAINT PositionIDTitleRequirements_FK 
  FOREIGN KEY (PositionID) 
  REFERENCES JOBHUNTINGDB.JOBPOSITIONS_TB (PositionID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM TITLEREQUIREMENTS_TB FOR JOBHUNTINGDB.TITLEREQUIREMENTS_TB;