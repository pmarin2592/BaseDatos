CREATE TABLE JOBHUNTINGDB.ApplicantLanguages_TB
(
  LanguageID        NUMBER(18)                  NOT NULL,
  ApplicantID       NUMBER(18)                  NOT NULL,
  ProficiencyLevel  NUMBER(9,2)                 DEFAULT 0                     NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.ApplicantLanguages_TB IS 'Tabla que alamcena el porcentaje de los idomas del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantLanguages_TB.LanguageID IS 'Campo que almacena la llave primaria y foranea del idioma';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantLanguages_TB.ApplicantID IS 'Campo que almacena la llave primaria y foranea del postulante';

COMMENT ON COLUMN JOBHUNTINGDB.ApplicantLanguages_TB.ProficiencyLevel IS 'Campo que almacena el porcentaje del idioma';


ALTER TABLE JOBHUNTINGDB.ApplicantLanguages_TB ADD (
  CONSTRAINT ApplicantLanguages_TB_PK
  PRIMARY KEY
  (LanguageID)
  ENABLE VALIDATE
,  CONSTRAINT ProficiencyLevel_CK
  CHECK (ProficiencyLevel >= 0)
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.ApplicantLanguages_TB ADD (
  CONSTRAINT LanguageIDApplicantLanguages_FK 
  FOREIGN KEY (LanguageID) 
  REFERENCES JOBHUNTINGDB.LANGUAGES_TB (LanguageID)
  ENABLE VALIDATE
,  CONSTRAINT ApplicantIDApplicantLanguages_FK 
  FOREIGN KEY (ApplicantID) 
  REFERENCES JOBHUNTINGDB.APPLICANTS_TB (ApplicantID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM APPLICANTLANGUAGES_TB FOR JOBHUNTINGDB.APPLICANTLANGUAGES_TB;
