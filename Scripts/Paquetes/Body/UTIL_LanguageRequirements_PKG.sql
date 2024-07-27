/* Formatted on 7/26/2024 2:57:50 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_LanguageRequirements_PKG
AS
    /******************************************************************************
           NAME:       UTIL_LanguageRequirements_PKG
           PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                    LanguageRequirements_TB

           REVISIONS:
           Ver        Date        Author           Description
           ---------  ----------  ---------------  ------------------------------------
           1.0        7/25/2024      PMARIN       1. Created this package body.
        ******************************************************************************/

    PROCEDURE INSERT_LANGUAGEREQUIREMENTS_PR (P_LANGUAGEID   IN     NUMBER,
                                              P_POSITIONID   IN     NUMBER,
                                              P_LEVELID      IN     NUMBER,
                                              P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        INSERT INTO LANGUAGEREQUIREMENTS_TB (LANGUAGEID, POSITIONID, LEVELID)
             VALUES (P_LANGUAGEID, P_POSITIONID, P_LEVELID);

        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE TITLEREQUIREMENTS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_LANGUAGEREQUIREMENTS_PR (P_LANGUAGEID   IN     NUMBER,
                                              P_POSITIONID   IN     NUMBER,
                                              P_LEVELID      IN     NUMBER,
                                              P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        UPDATE LANGUAGEREQUIREMENTS_TB
           SET LEVELID = P_LEVELID
         WHERE LANGUAGEID = P_LANGUAGEID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_LANGUAGEREQUIREMENTS_PR (P_LANGUAGEID   IN     NUMBER,
                                              P_POSITIONID   IN     NUMBER,
                                              P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM LANGUAGEREQUIREMENTS_TB
              WHERE LANGUAGEID = P_LANGUAGEID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_LANGUAGEREQUIREMENTS_PR (P_CURSOR   OUT REF_CURSOR,
                                              P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT LANGUAGEID, POSITIONID, LEVELID
              FROM LANGUAGEREQUIREMENTS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_LanguageRequirements_PKG;
/
