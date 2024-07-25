CREATE TABLE JOBHUNTINGDB.SkillRequirements_TB
(
  SkillID     NUMBER(18)                        NOT NULL,
  PositionID  NUMBER(18)                        NOT NULL,
  Desirable   NUMBER(1)                         DEFAULT 0                     NOT NULL
);

COMMENT ON COLUMN JOBHUNTINGDB.SkillRequirements_TB.SkillID IS 'Campo que almacena la llave primaria y foreana de las habilidades';

COMMENT ON COLUMN JOBHUNTINGDB.SkillRequirements_TB.PositionID IS 'Campo que almacena la llave primaria y foreana de los puestos';

COMMENT ON COLUMN JOBHUNTINGDB.SkillRequirements_TB.Desirable IS 'Campo que indica si la habilidad es deseable o no';


ALTER TABLE JOBHUNTINGDB.SkillRequirements_TB ADD (
  CONSTRAINT SkillRequirements_TB_PK
  PRIMARY KEY
  (SkillID)
  ENABLE VALIDATE
,  CONSTRAINT SkillRequirementsDesirable_CK
  CHECK (Desirable in (0,1))
  ENABLE VALIDATE);


ALTER TABLE JOBHUNTINGDB.SkillRequirements_TB ADD (
  CONSTRAINT SkillRequirementsSkills_FK 
  FOREIGN KEY (SkillID) 
  REFERENCES JOBHUNTINGDB.SKILLS_TB (SkillID)
  ENABLE VALIDATE
,  CONSTRAINT TitleRequirementsJobPositions_FK 
  FOREIGN KEY (SkillID) 
  REFERENCES JOBHUNTINGDB.JOBPOSITIONS_TB (POSITIONID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM SKILLREQUIREMENTS_TB FOR JOBHUNTINGDB.SKILLREQUIREMENTS_TB;