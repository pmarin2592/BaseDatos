CREATE TABLE JOBHUNTINGDB.JobPositions_TB
(
  PositionID         NUMBER(18)                 NOT NULL,
  CompanyID          NUMBER(18)                 NOT NULL,
  PositionTitle      VARCHAR2(100)              NOT NULL,
  DescriptionJob     VARCHAR2(4000)             NOT NULL,
  Salary             NUMBER(18,2)               DEFAULT 0                     NOT NULL,
  SalaryVisible      NUMBER(1)                  DEFAULT 0                     NOT NULL,
  StartDate          DATE                       NOT NULL,
  EndDate            DATE                       NOT NULL,
  YearsOfExperience  NUMBER(10)                 DEFAULT 0                     NOT NULL,
  ExperienceTypeID   NUMBER(18)                 NOT NULL,
  Active             NUMBER(1)                  DEFAULT 1                     NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.JobPositions_TB IS 'Tabla que almacena las postulaciones';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.PositionID IS 'Llave primaria para el codigo del puesto';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.CompanyID IS 'Codigo de la compania';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.PositionTitle IS 'Campo que almacena el titulo del puesto';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.DescriptionJob IS 'Campo que almacena la descripcion del puesto';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.Salary IS 'Campo que almacena el salario';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.SalaryVisible IS 'Campo que indica si el salario es visible';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.StartDate IS 'Campo que almacena la fecha que comienza la postulacion';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.EndDate IS 'Campo que almacena la fecha que finaliza la postulacion';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.YearsOfExperience IS 'Campo que almacena la cantidad de anos de experiencia';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.ExperienceTypeID IS 'Campo que relaciona con el tipo de experiencia';

COMMENT ON COLUMN JOBHUNTINGDB.JobPositions_TB.Active IS 'Campo que indica si la postulacion esta activa';


ALTER TABLE JOBHUNTINGDB.JobPositions_TB ADD (
  CONSTRAINT JobPositions_TB_PK
  PRIMARY KEY
  (PositionID)
  ENABLE VALIDATE
,  CONSTRAINT Salary_CK
  CHECK (Salary >= 0)
  ENABLE VALIDATE
,  CONSTRAINT SalaryVisible_CK
  CHECK (SalaryVisible in(0,1))
  ENABLE VALIDATE
,  CONSTRAINT YearsOfExperience_CK
  CHECK (YearsOfExperience >= 0)
  ENABLE VALIDATE
,  CONSTRAINT ActiveJobPositions_CK
  CHECK (Active in(0,1))
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.JobPositions_TB ADD (
  CONSTRAINT CompaniesJobPositions_FK 
  FOREIGN KEY (CompanyID) 
  REFERENCES JOBHUNTINGDB.COMPANIES_TB (CompanyID)
  ENABLE VALIDATE
,  CONSTRAINT ExperienceTypeID_FK 
  FOREIGN KEY (ExperienceTypeID) 
  REFERENCES JOBHUNTINGDB.EXPERIENCETYPES_TB (TYPEID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM JOBPOSITIONS_TB FOR JOBHUNTINGDB.JOBPOSITIONS_TB;
