CREATE TABLE JOBHUNTINGDB.Skills_TB
(
  SkillID           NUMBER(18)                  NOT NULL,
  Skill             VARCHAR2(50)                NOT NULL,
  DescriptionSkill  VARCHAR2(4000)              NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.Skills_TB IS 'Tabla que almacena las habilidades para el puesto';

COMMENT ON COLUMN JOBHUNTINGDB.Skills_TB.SkillID IS 'Llave primaria para el codigo de habilidades';

COMMENT ON COLUMN JOBHUNTINGDB.Skills_TB.Skill IS 'Campo que almacena el nombre de la habilidad';

COMMENT ON COLUMN JOBHUNTINGDB.Skills_TB.DescriptionSkill IS 'Campo que almacena la descripcion de la habilidad';


ALTER TABLE JOBHUNTINGDB.Skills_TB ADD (
  CONSTRAINT Skills_TB_PK
  PRIMARY KEY
  (SkillID)
  ENABLE VALIDATE);

CREATE PUBLIC SYNONYM SKILLS_TB FOR JOBHUNTINGDB.SKILLS_TB;
