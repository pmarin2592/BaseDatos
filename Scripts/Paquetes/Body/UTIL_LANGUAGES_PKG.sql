/* Formatted on 7/25/2024 10:31:40 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_LANGUAGES_PKG
AS
    /******************************************************************************
       NAME:       UTIL_LANGUAGES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                LANGUAGES_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/25/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    PROCEDURE INSERT_LANGUAGES_PR (P_LANGUAGEL    IN     VARCHAR2,
                                   P_LANGUAGEID      OUT NUMBER,
                                   P_ERROR           OUT VARCHAR)
    IS
        V_LANGUAGEL   NUMBER (18);
    BEGIN
        SELECT LANGUAGES_SQ.NEXTVAL INTO V_LANGUAGEL FROM DUAL;

        INSERT INTO LANGUAGES_TB (LANGUAGEID, LANGUAGEL)
             VALUES (V_LANGUAGEL, P_LANGUAGEL);

        P_LANGUAGEID := V_LANGUAGEL;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE LANGUAGES ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_LANGUAGES_PR (P_LANGUAGEID   IN     NUMBER,
                                   P_LANGUAGEL    IN     VARCHAR2,
                                   P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        UPDATE LANGUAGES_TB
           SET LANGUAGEL = P_LANGUAGEL
         WHERE LANGUAGEID = P_LANGUAGEID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_LANGUAGES_PR (P_LANGUAGEID   IN     NUMBER,
                                   P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM LANGUAGES_TB
              WHERE LANGUAGEID = P_LANGUAGEID;
              COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

   PROCEDURE SELECT_LANGUAGES_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR SELECT LANGUAGEID, LANGUAGEL FROM LANGUAGES_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;
END UTIL_LANGUAGES_PKG;
/
