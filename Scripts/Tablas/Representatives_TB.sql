CREATE TABLE JOBHUNTINGDB.Representatives_TB
(
  RepresentativeID    NUMBER(18)                NOT NULL,
  NameRepresentative  VARCHAR2(100)             NOT NULL,
  CompanyID           NUMBER(18)                NOT NULL,
  Email               VARCHAR2(100)             NOT NULL,
  Active              NUMBER(1)                 DEFAULT 1                     NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.Representatives_TB IS 'Tabla que almacena los representantes de las companias';

COMMENT ON COLUMN JOBHUNTINGDB.Representatives_TB.RepresentativeID IS 'Llave primaria de los representantes';

COMMENT ON COLUMN JOBHUNTINGDB.Representatives_TB.NameRepresentative IS 'Nombre del Representante';

COMMENT ON COLUMN JOBHUNTINGDB.Representatives_TB.CompanyID IS 'Codigo de la compania';

COMMENT ON COLUMN JOBHUNTINGDB.Representatives_TB.Email IS 'Campo que almacena el correo';

COMMENT ON COLUMN JOBHUNTINGDB.Representatives_TB.Active IS 'Campo que indica si esta activo el usuario';


ALTER TABLE JOBHUNTINGDB.Representatives_TB ADD (
  CONSTRAINT Representatives_TB_PK
  PRIMARY KEY
  (RepresentativeID)
  ENABLE VALIDATE
,  CONSTRAINT Active_ck
  CHECK (Active in(0,1))
  ENABLE VALIDATE
,  CONSTRAINT Email_unique
  UNIQUE (Email)
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.Representatives_TB ADD (
  CONSTRAINT Companie_FK 
  FOREIGN KEY (CompanyID) 
  REFERENCES JOBHUNTINGDB.COMPANIES_TB (CompanyID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM REPRESENTATIVES_TB FOR JOBHUNTINGDB.REPRESENTATIVES_TB;
