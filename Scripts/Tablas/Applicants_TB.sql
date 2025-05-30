DROP TABLE JOBHUNTINGDB.APPLICANTS_TB CASCADE CONSTRAINTS;

CREATE TABLE JOBHUNTINGDB.APPLICANTS_TB
(
  APPLICANTID        NUMBER(18)                 NOT NULL,
  IDNUMBER           CHAR(18 BYTE)              NOT NULL,
  FIRSTNAME          VARCHAR2(100 BYTE)         NOT NULL,
  LASTNAME           VARCHAR2(100 BYTE)         NOT NULL,
  EMAIL              VARCHAR2(100 BYTE)         NOT NULL,
  PHONE              VARCHAR2(20 BYTE)          NOT NULL,
  YEARSOFEXPERIENCE  NUMBER(6)                  NOT NULL,
  RESUMEEXPERIENCE   BLOB
)
LOB (RESUMEEXPERIENCE) STORE AS BASICFILE (
  TABLESPACE  SYSTEM
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE;

COMMENT ON TABLE JOBHUNTINGDB.APPLICANTS_TB IS 'Tabla que almacena los datos de los postulantes';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.APPLICANTID IS 'Campo que almacena el codigo del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.IDNUMBER IS 'Campo que almacena la cedula del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.FIRSTNAME IS 'Campo que almacena el nombre del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.LASTNAME IS 'Campo que almacena los apellidos del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.EMAIL IS 'Campo que almacena el correo del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.PHONE IS 'Campo que almacena el telefono del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.APPLICANTS_TB.YEARSOFEXPERIENCE IS 'Campo que almacena los anos de experiencia';


CREATE UNIQUE INDEX JOBHUNTINGDB.APPLICANTS_TB_PK ON JOBHUNTINGDB.APPLICANTS_TB
(APPLICANTID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );
CREATE UNIQUE INDEX JOBHUNTINGDB.EMAILAPPLICANTS_UNIQUE ON JOBHUNTINGDB.APPLICANTS_TB
(EMAIL)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );
CREATE UNIQUE INDEX JOBHUNTINGDB.IDNUMBER_UNIQUE ON JOBHUNTINGDB.APPLICANTS_TB
(IDNUMBER)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE JOBHUNTINGDB.APPLICANTS_TB ADD (
  CONSTRAINT YEARSOFEXPERIENCEAPPLICANTS_CK
  CHECK (YearsOfExperience >= 0)
  ENABLE VALIDATE
,  CONSTRAINT APPLICANTS_TB_PK
  PRIMARY KEY
  (APPLICANTID)
  USING INDEX JOBHUNTINGDB.APPLICANTS_TB_PK
  ENABLE VALIDATE
,  CONSTRAINT EMAILAPPLICANTS_UNIQUE
  UNIQUE (EMAIL)
  USING INDEX JOBHUNTINGDB.EMAILAPPLICANTS_UNIQUE
  ENABLE VALIDATE
,  CONSTRAINT IDNUMBER_UNIQUE
  UNIQUE (IDNUMBER)
  USING INDEX JOBHUNTINGDB.IDNUMBER_UNIQUE
  ENABLE VALIDATE);


CREATE OR REPLACE PUBLIC SYNONYM APPLICANTS_TB FOR JOBHUNTINGDB.APPLICANTS_TB;
