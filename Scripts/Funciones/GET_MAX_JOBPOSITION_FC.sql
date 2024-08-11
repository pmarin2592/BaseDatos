/* Formatted on 8/11/2024 2:20:39 AM (QP5 v5.388) */
CREATE OR REPLACE FUNCTION JOBHUNTINGDB.GET_MAX_JOBPOSITION_FC
    RETURN VARCHAR2
IS
    tmpVar   VARCHAR2 (500);
/******************************************************************************
   NAME:       GET_MAX_JOBPOSITION_FC
   PURPOSE:    FUNCION QUE OBTIENE EL PUESTO MAS SOLICITADO

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/11/2024   NBRENES       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_MAX_JOBPOSITION_FC
      Sysdate:         8/11/2024
      Date and Time:   8/11/2024, 1:42:19 AM, and 8/11/2024 1:42:19 AM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    tmpVar := 'N\R';

    SELECT j.POSITIONTITLE
      INTO tmpVar
      FROM JOBPOSITIONS_TB j
     WHERE j.POSITIONID =
           (SELECT JOBPOSITIONID
             FROM (  SELECT h.JOBPOSITIONID,
                            COUNT (*)                                       AS JOBPOSITION_COUNT,
                            ROW_NUMBER () OVER (ORDER BY COUNT (*) DESC)    AS rn
                       FROM HIRINGPROCESS_TB h
                   GROUP BY h.JOBPOSITIONID)
            WHERE rn = 1);

    RETURN tmpVar;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        RETURN 'N\R';
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RETURN 'N\R';
END GET_MAX_JOBPOSITION_FC;
CREATE PUBLIC SYNONYM GET_MAX_JOBPOSITION_FC FOR JOBHUNTINGDB.GET_MAX_JOBPOSITION_FC;

