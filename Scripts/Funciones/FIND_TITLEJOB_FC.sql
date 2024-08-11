/* Formatted on 8/11/2024 12:58:30 AM (QP5 v5.388) */
CREATE OR REPLACE FUNCTION FIND_TITLEJOB_FC(P_APPLICANTID IN NUMBER)
    RETURN VARCHAR2
IS
    tmpVar   VARCHAR2(200);
/******************************************************************************
   NAME:       FIND_TITLEJOB_FC
   PURPOSE:    FUNCION PARA OBTENER EL PUESTO DEL POSTULANTE

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/11/2024   NBRENES       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     FIND_TITLEJOB_FC
      Sysdate:         8/11/2024
      Date and Time:   8/11/2024, 12:56:35 AM, and 8/11/2024 12:56:35 AM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    SELECT POSITIONTITLE INTO tmpVar
      FROM WORKEXPERIENCE_TB
     WHERE APPLICANTID = P_APPLICANTID AND CURRENTLYEMPLOYED = 1;

    RETURN tmpVar;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        NULL;
    WHEN OTHERS
    THEN
        NULL;
END FIND_TITLEJOB_FC;
/
CREATE PUBLIC SYNONYM FIND_TITLEJOB_FC FOR JOBHUNTINGDB.FIND_TITLEJOB_FC;