CREATE TABLE JOBHUNTINGDB.ProcessStatus_TB
(
  StatusID       NUMBER(18)                     NOT NULL,
  StatusProcess  VARCHAR2(50)                   NOT NULL
);

COMMENT ON TABLE JOBHUNTINGDB.ProcessStatus_TB IS 'Tabla que almacena los estados del proceso';

COMMENT ON COLUMN JOBHUNTINGDB.ProcessStatus_TB.StatusID IS 'Campo que almacena el codigo del status';

COMMENT ON COLUMN JOBHUNTINGDB.ProcessStatus_TB.StatusProcess IS 'Camp que almacena el tipo de status';


ALTER TABLE JOBHUNTINGDB.ProcessStatus_TB ADD (
  CONSTRAINT ProcessStatus_TB_PK
  PRIMARY KEY
  (StatusID)
  ENABLE VALIDATE);


CREATE PUBLIC SYNONYM PROCESSSTATUS_TB FOR JOBHUNTINGDB.PROCESSSTATUS_TB;