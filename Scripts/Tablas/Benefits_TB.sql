CREATE TABLE JOBHUNTINGDB.Benefits_TB
(
  BenefitID           NUMBER(18)                NOT NULL,
  PositionID          NUMBER(18)                NOT NULL,
  BenefitDescription  VARCHAR2(200)             NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.Benefits_TB IS 'Tabla que almacena los beneficios de los puestos';

COMMENT ON COLUMN JOBHUNTINGDB.Benefits_TB.BenefitID IS 'Campo que almacena la llave primaria';

COMMENT ON COLUMN JOBHUNTINGDB.Benefits_TB.PositionID IS 'Campo que almacena la llave foranea de puestos';

COMMENT ON COLUMN JOBHUNTINGDB.Benefits_TB.BenefitDescription IS 'Campo que almacena la descripcion del beneficio';


ALTER TABLE JOBHUNTINGDB.Benefits_TB ADD (
  CONSTRAINT Benefits_PK
  PRIMARY KEY
  (BenefitID)
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.Benefits_TB ADD (
  CONSTRAINT PositionIDBenefits_FK 
  FOREIGN KEY (BenefitID) 
  REFERENCES JOBHUNTINGDB.JOBPOSITIONS_TB (POSITIONID)
  ENABLE VALIDATE);


CREATE PUBLIC SYNONYM Benefits_TB FOR JOBHUNTINGDB.Benefits_TB;