/* Formatted on 7/26/2024 2:48:51 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_SKILLREQUIREMENTS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_SKILLREQUIREMENTS_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                SKILLREQUIREMENTS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    PROCEDURE INSERT_SKILLREQUIREMENTS_PR (P_SKILLID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_DESIRABLE    IN     NUMBER,
                                           P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        INSERT INTO SKILLREQUIREMENTS_TB (SKILLID, POSITIONID, DESIRABLE)
             VALUES (P_SKILLID, P_POSITIONID, P_DESIRABLE);

        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE SKILLREQUIREMENTS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_SKILLREQUIREMENTS_PR (P_SKILLID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_DESIRABLE    IN     NUMBER,
                                           P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        UPDATE SKILLREQUIREMENTS_TB
           SET DESIRABLE = P_DESIRABLE
         WHERE SKILLID = P_SKILLID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_SKILLREQUIREMENTS_PR (P_SKILLID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM SKILLREQUIREMENTS_TB
              WHERE SKILLID = P_SKILLID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_SKILLREQUIREMENTS_PR (P_CURSOR   OUT REF_CURSOR,
                                           P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT SKILLID, POSITIONID, DESIRABLE FROM SKILLREQUIREMENTS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_SKILLREQUIREMENTS_PKG;
/
