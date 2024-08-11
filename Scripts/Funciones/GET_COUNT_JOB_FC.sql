/* Formatted on 8/11/2024 1:13:37 PM (QP5 v5.388) */
CREATE OR REPLACE FUNCTION JOBHUNTINGDB.GET_COUNT_JOB_FC (
    P_POSITIONID   IN NUMBER)
    RETURN NUMBER
IS
    tmpVar   NUMBER;
/******************************************************************************
   NAME:       GET_COUNT_JOB_FC
   PURPOSE:    FUNCION QUE OBTIENE EL TOTAL DE POSTULACIONES DE UN TRABAJO

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/11/2024   NBRENES       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_COUNT_JOB_FC
      Sysdate:         8/11/2024
      Date and Time:   8/11/2024, 1:42:19 AM, and 8/11/2024 1:42:19 AM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    tmpVar := 0;

    SELECT COUNT (*)
      INTO tmpVar
      FROM HIRINGPROCESS_TB
     WHERE JOBPOSITIONID = P_POSITIONID;

    RETURN tmpVar;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        RETURN 0;
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RETURN 0;
END GET_COUNT_JOB_FC;
/
