CREATE TABLE JOBHUNTINGDB.WorkExperience_TB
(
  ExperienceID       NUMBER(18)                 NOT NULL,
  ApplicantID        NUMBER(18)                 NOT NULL,
  StartDate          DATE                       NOT NULL,
  EndDate            DATE,
  CurrentlyEmployed  NUMBER(1)                  DEFAULT 1                     NOT NULL,
  PositionTitle      VARCHAR2(200)              NOT NULL,
  DescriptionWork    VARCHAR2(4000)             NOT NULL,
  ReasonForLeaving   VARCHAR2(4000),
  ReferenceName      VARCHAR2(100),
  ReferencePhone     VARCHAR2(20),
  ReferenceEmail     VARCHAR2(100)
);

COMMENT ON TABLE JOBHUNTINGDB.WorkExperience_TB IS 'Tabla que almacena los datos de experiencia del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.ExperienceID IS 'Campo que almacena la experiencia ID ';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.ApplicantID IS 'Campo que almacena el codigo del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.StartDate IS 'Campo que alamcena la fecha que empezo el trabajo';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.EndDate IS 'Campo que alamcena la fecha que finalizo el trabajo';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.CurrentlyEmployed IS 'Campo que indica si aun esta trabajando en el puesto';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.PositionTitle IS 'Campo que indica el nombre del puesto que tenia en el trabajo';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.DescriptionWork IS 'Campo que indica la descripcion del puesto';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.ReasonForLeaving IS 'Campo que iniica el motivo por el cual ya no esta en dicho puesto';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.ReferenceName IS 'Campo que indica el nombre de la persona de referencia';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.ReferencePhone IS 'Campo que indica el telefono de la persona de referencia';

COMMENT ON COLUMN JOBHUNTINGDB.WorkExperience_TB.ReferenceEmail IS 'Campo que indica el correo de la persona de referencia';


ALTER TABLE JOBHUNTINGDB.WorkExperience_TB ADD (
  CONSTRAINT WorkExperience_TB_PK
  PRIMARY KEY
  (ExperienceID)
  ENABLE VALIDATE
,  CONSTRAINT CurrentlyEmployed_CK
  CHECK (CurrentlyEmployed in(0,1))
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.WorkExperience_TB ADD (
  CONSTRAINT ApplicantIDWorkExperience_FK 
  FOREIGN KEY (ApplicantID) 
  REFERENCES JOBHUNTINGDB.APPLICANTS_TB (ApplicantID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM WORKEXPERIENCE_TB FOR JOBHUNTINGDB.WORKEXPERIENCE_TB;
