/* Formatted on 7/26/2024 11:59:06 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY JOBHUNTINGDB.UTIL_TITLES_PKG
AS
    /******************************************************************************
      NAME:       UTIL_COMPANIES_PKG
      PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
               TITLES_TB

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        7/26/2024      PMARIN       1. Created this package.
   ******************************************************************************/

    PROCEDURE INSERT_TITLES_PR (P_TITLE     IN     VARCHAR2,
                                P_TITLEID      OUT NUMBER,
                                P_ERROR        OUT VARCHAR)
    IS
        V_TITLEID   NUMBER (18);
    BEGIN
        SELECT TITLES_SQ.NEXTVAL INTO V_TITLEID FROM DUAL;

        INSERT INTO TITLES_TB (TITLEID, TITLE)
             VALUES (V_TITLEID, P_TITLE);

        P_TITLEID := V_TITLEID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE TITLES ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_TITLES_PR (P_TITLEID   IN     NUMBER,
                                P_TITLE     IN     VARCHAR2,
                                P_ERROR        OUT VARCHAR)
    IS
    BEGIN
        UPDATE TITLES_TB
           SET TITLE = P_TITLE
         WHERE TITLEID = P_TITLEID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_TITLES_PR (P_TITLEID IN NUMBER, P_ERROR OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM TITLES_TB
              WHERE TITLEID = P_TITLEID;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_TITLES_PR (P_CURSOR OUT REF_CURSOR, P_ERROR OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR SELECT TITLEID, TITLE FROM TITLES_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_TITLES_PKG;
/
