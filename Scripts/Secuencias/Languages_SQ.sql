CREATE SEQUENCE JOBHUNTINGDB.Languages_SQ
  START WITH 1
  NOMAXVALUE
  MINVALUE 0
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;

CREATE PUBLIC SYNONYM LANGUAGES_SQ FOR JOBHUNTINGDB.LANGUAGES_SQ;