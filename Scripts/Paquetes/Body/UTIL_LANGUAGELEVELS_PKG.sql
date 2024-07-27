/* Formatted on 7/26/2024 11:17:10 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY JOBHUNTINGDB.UTIL_LANGUAGELEVELS_PKG
AS
    /******************************************************************************
         NAME:       UTIL_LANGUAGELEVELS_PKG
         PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                  LANGUAGELEVELS_TB

         REVISIONS:
         Ver        Date        Author           Description
         ---------  ----------  ---------------  ------------------------------------
         1.0        7/26/2024      PMARIN       1. Created this package.
      ******************************************************************************/

    PROCEDURE INSERT_LANGUAGELEVELS_PR (P_LEVELLANGUAGE   IN     VARCHAR2,
                                        P_RANKLEVEL       IN     VARCHAR2,
                                        P_LEVELID            OUT NUMBER,
                                        P_ERROR              OUT VARCHAR)
    IS
        V_LEVELID   NUMBER (18);
    BEGIN
        SELECT LANGUAGELEVELS_SQ.NEXTVAL INTO V_LEVELID FROM DUAL;

        INSERT INTO LANGUAGELEVELS_TB (LEVELID, LEVELLANGUAGE, RANKLEVEL)
             VALUES (V_LEVELID, P_LEVELLANGUAGE, P_RANKLEVEL);

        P_LEVELID := V_LEVELID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE LANGUAGELEVELS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_LANGUAGELEVELS_PR (P_LevelID         IN     NUMBER,
                                        P_LevelLanguage   IN     VARCHAR2,
                                        P_RankLevel       IN     VARCHAR2,
                                        P_ERROR              OUT VARCHAR)
    IS
    BEGIN
        UPDATE LANGUAGELEVELS_TB
           SET LEVELLANGUAGE = P_LevelLanguage, RANKLEVEL = P_RankLevel
         WHERE LEVELID = P_LevelID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_LANGUAGELEVELS_PR (P_LevelID   IN     NUMBER,
                                        P_ERROR        OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM LANGUAGELEVELS_TB
              WHERE LEVELID = P_LevelID;
              COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_LANGUAGELEVELS_PR (P_CURSOR   OUT REF_CURSOR,
                                        P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT LEVELID, LEVELLANGUAGE, RANKLEVEL
              FROM LANGUAGELEVELS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_LANGUAGELEVELS_PKG;
/
