CREATE TABLE JOBHUNTINGDB.Companies_TB
(
  CompanyID           NUMBER(10)                NOT NULL,
  NameCompany         VARCHAR2(100)             NOT NULL,
  AddressCompany      VARCHAR2(4000)            NOT NULL,
  DescriptionCompany  VARCHAR2(4000)            NOT NULL,
  Active              NUMBER(1)                 DEFAULT 1                     NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.Companies_TB IS 'Tabla que almacena los datos de las compa�ias';

COMMENT ON COLUMN JOBHUNTINGDB.Companies_TB.CompanyID IS 'Campo para el codigo de la compa�ia';

COMMENT ON COLUMN JOBHUNTINGDB.Companies_TB.NameCompany IS 'Campo para el nombre de la compa�ia';

COMMENT ON COLUMN JOBHUNTINGDB.Companies_TB.AddressCompany IS 'Campo para la direccion de la compa�ia';

COMMENT ON COLUMN JOBHUNTINGDB.Companies_TB.DescriptionCompany IS 'Campo para la descriccion de la compa�ia';

COMMENT ON COLUMN JOBHUNTINGDB.Companies_TB.Active IS 'Campo para validar si esta activo la compa�ia';


ALTER TABLE JOBHUNTINGDB.Companies_TB ADD (
  CONSTRAINT Companies_PK
  PRIMARY KEY
  (CompanyID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM Companies_TB FOR JOBHUNTINGDB.Companies_TB;
