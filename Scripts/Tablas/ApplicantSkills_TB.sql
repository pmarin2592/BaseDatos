CREATE TABLE JOBHUNTINGDB.ApplicantSkills_TB
(
  SkillID               NUMBER(18)              NOT NULL,
  ApplicantID           NUMBER(18)              NOT NULL,
  Skill                 VARCHAR2(100)           NOT NULL,
  DescriptionApplicant  VARCHAR2(4000)          NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.ApplicantSkills_TB IS 'Tabla que almacena las habilidades del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantSkills_TB.SkillID IS 'Campo que almacena el codigo de las habilidades del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantSkills_TB.ApplicantID IS 'Campo que almacena el codigo del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantSkills_TB.Skill IS 'Campo que almacena la habilidad del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantSkills_TB.DescriptionApplicant IS 'Campo que almacena la descripcion de la habilidad del postulante ';


ALTER TABLE JOBHUNTINGDB.ApplicantSkills_TB ADD (
  CONSTRAINT ApplicantSkills_TB_PK
  PRIMARY KEY
  (SkillID)
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.ApplicantSkills_TB ADD (
  CONSTRAINT ApplicantIDSkills_FK 
  FOREIGN KEY (ApplicantID) 
  REFERENCES JOBHUNTINGDB.APPLICANTS_TB (ApplicantID)
  ENABLE VALIDATE);


CREATE PUBLIC SYNONYM APPLICANTSKILLS_TB FOR JOBHUNTINGDB.APPLICANTSKILLS_TB;
