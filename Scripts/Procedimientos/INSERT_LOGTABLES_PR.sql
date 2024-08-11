CREATE OR REPLACE PROCEDURE JOBHUNTINGDB.INSERT_LOGTABLES_PR (P_TABLELOG    IN VARCHAR2,
                                                 P_DLL         IN VARCHAR2,
                                                 P_BEFORELOG   IN VARCHAR2,
                                                 P_AFTERLOG    IN VARCHAR2,
                                                 P_USERLOG     IN VARCHAR2)
IS
    /******************************************************************************
       NAME:       INSERT_LOGTABLES_PR
       PURPOSE:    Procedimiento que llena tabla de bitacora

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/27/2024   PMARIN       1. Created this procedure.

       NOTES:

       Automatically available Auto Replace Keywords:
          Object Name:     INSERT_LOGTABLES_PR
          Sysdate:         7/27/2024
          Date and Time:   7/27/2024, 5:17:38 PM, and 7/27/2024 5:17:38 PM
          Username:        PMARIN
          Table Name:       LOGTABLES_tb

    ******************************************************************************/
    V_IDLOG   NUMBER;
BEGIN
    SELECT LOGTABLES_SQ.NEXTVAL INTO V_IDLOG FROM DUAL;

    INSERT INTO LOGTABLES_TB (IDLOG,
                                           TABLELOG,
                                           DLL,
                                           BEFORELOG,
                                           AFTERLOG,
                                           USERLOG,
                                           FECLOG)
         VALUES (V_IDLOG,
                 P_TABLELOG,
                 P_DLL,
                 P_BEFORELOG,
                 P_AFTERLOG,
                 P_USERLOG,
                 SYSDATE);

   
EXCEPTION
    WHEN OTHERS
    THEN
        
        RAISE;
END INSERT_LOGTABLES_PR;
/