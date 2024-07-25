CREATE TABLE JOBHUNTINGDB.HiringProcess_TB
(
  ProcessID        NUMBER(18)                   NOT NULL,
  ApplicantID      NUMBER(18)                   NOT NULL,
  StatusID         NUMBER(18)                   NOT NULL,
  ApplicationDate  DATE                         DEFAULT sysdate               NOT NULL,
  CompletionDate   DATE,
  Hired            NUMBER(1)                    DEFAULT 0                     NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.HiringProcess_TB IS 'Tabla que contiene el procesoo de postulacion a algun puesto';

COMMENT ON COLUMN JOBHUNTINGDB.HiringProcess_TB.ProcessID IS 'Campo que almacena la llave primaria';

COMMENT ON COLUMN JOBHUNTINGDB.HiringProcess_TB.ApplicantID IS 'Campo que tiene el codigo del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.HiringProcess_TB.StatusID IS 'Campo que almacena el codigo del status';

COMMENT ON COLUMN JOBHUNTINGDB.HiringProcess_TB.ApplicationDate IS 'Campo que inidca cuando aplico al puesto el postulante';

COMMENT ON COLUMN JOBHUNTINGDB.HiringProcess_TB.CompletionDate IS 'Campo que indica cuando finalizo el proceso';

COMMENT ON COLUMN JOBHUNTINGDB.HiringProcess_TB.Hired IS 'Campo que indica que si fue contratado en el puesto';


ALTER TABLE JOBHUNTINGDB.HiringProcess_TB ADD (
  CONSTRAINT HiringProcess_TB_PK
  PRIMARY KEY
  (ProcessID)
  ENABLE VALIDATE
,  CONSTRAINT Hired_CK
  CHECK (Hired in(0,1))
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.HiringProcess_TB ADD (
  CONSTRAINT ApplicantIDHiringProcess_FK 
  FOREIGN KEY (ApplicantID) 
  REFERENCES JOBHUNTINGDB.APPLICANTS_TB (ApplicantID)
  ENABLE VALIDATE
,  CONSTRAINT StatusIDHiringProcess_FK 
  FOREIGN KEY (StatusID) 
  REFERENCES JOBHUNTINGDB.PROCESSSTATUS_TB (StatusID)
  ENABLE VALIDATE);


CREATE PUBLIC SYNONYM HIRINGPROCESS_TB FOR JOBHUNTINGDB.HIRINGPROCESS_TB;