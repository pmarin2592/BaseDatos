/* Formatted on 8/11/2024 1:50:15 AM (QP5 v5.388) */
CREATE OR REPLACE FUNCTION GET_SALARY_FC (P_POSITIONID IN NUMBER)
    RETURN NUMBER
IS
    tmpVar   NUMBER;
/******************************************************************************
   NAME:       GET_SALARY_FC
   PURPOSE:    FUNCION QUE OBTIENE EL SALARIO DEL PUESTO

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/11/2024   NBRENES       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_SALARY_FC
      Sysdate:         8/11/2024
      Date and Time:   8/11/2024, 1:42:19 AM, and 8/11/2024 1:42:19 AM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    tmpVar := 0;

    SELECT SALARY
      INTO tmpVar
      FROM JOBPOSITIONS_TB
     WHERE POSITIONID = P_POSITIONID;

    RETURN tmpVar;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        RETURN 0;
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RETURN 0;
END GET_SALARY_FC;

CREATE PUBLIC SYNONYM GET_SALARY_FC FOR JOBHUNTINGDB.GET_SALARY_FC;