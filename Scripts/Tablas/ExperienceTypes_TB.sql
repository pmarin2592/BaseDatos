CREATE TABLE JOBHUNTINGDB.ExperienceTypes_TB
(
  TypeID          NUMBER(18)                    NOT NULL,
  ExperienceType  VARCHAR2(50)                  NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.ExperienceTypes_TB IS 'Tabla que almacena los tipos de experiencia';

COMMENT ON COLUMN JOBHUNTINGDB.ExperienceTypes_TB.TypeID IS 'Llave primaria ';

COMMENT ON COLUMN JOBHUNTINGDB.ExperienceTypes_TB.ExperienceType IS 'Campo que almacena el tipo de experiencia';


ALTER TABLE JOBHUNTINGDB.ExperienceTypes_TB ADD (
  CONSTRAINT ExperienceTypes_TB_PK
  PRIMARY KEY
  (TypeID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM EXPERIENCETYPES_TB FOR JOBHUNTINGDB.EXPERIENCETYPES_TB;
