/* Formatted on 8/11/2024 1:43:58 AM (QP5 v5.388) */
CREATE OR REPLACE FUNCTION GET_JOBPOSITIONID_FC (P_APPLICANTID IN NUMBER)
    RETURN NUMBER
IS
    tmpVar   NUMBER;
/******************************************************************************
   NAME:       GET_JOBPOSITIONID_FC
   PURPOSE:    FUNCION QUE OBTIENE EL ULTIMO PUESTO GANADO

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/11/2024   NBRENES       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_JOBPOSITIONID_FC
      Sysdate:         8/11/2024
      Date and Time:   8/11/2024, 1:42:19 AM, and 8/11/2024 1:42:19 AM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    tmpVar := 0;

    SELECT JOBPOSITIONID INTO tmpVar
      FROM HIRINGPROCESS_TB h
     WHERE     h.APPLICANTID = P_APPLICANTID
           AND h.HIRED = 1
           AND H.STATUSID = 10
           AND (   (    h.APPLICATIONDATE =
                        (SELECT MAX (APPLICATIONDATE)
                           FROM HIRINGPROCESS_TB
                          WHERE APPLICANTID = P_APPLICANTID AND HIRED = 1)
                    AND h.COMPLETIONDATE IS NULL)
                OR (h.COMPLETIONDATE =
                    (SELECT MAX (COMPLETIONDATE)
                       FROM HIRINGPROCESS_TB
                      WHERE APPLICANTID = P_APPLICANTID AND HIRED = 1)));

    RETURN tmpVar;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        NULL;
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RAISE;
END GET_JOBPOSITIONID_FC;
/
CREATE PUBLIC SYNONYM GET_JOBPOSITIONID_FC FOR JOBHUNTINGDB.GET_JOBPOSITIONID_FC;
