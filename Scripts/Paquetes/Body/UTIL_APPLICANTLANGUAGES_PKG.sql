/* Formatted on 7/27/2024 12:51:35 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_APPLICANTLANGUAGES_PKG
AS
    /******************************************************************************
          NAME:       UTIL_APPLICANTLANGUAGES_PKG
          PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                   APPLICANTLANGUAGES_TB

          REVISIONS:
          Ver        Date        Author           Description
          ---------  ----------  ---------------  ------------------------------------
          1.0        7/27/2024      NBRENES       1. Created this package.
       ******************************************************************************/

    PROCEDURE INSERT_APPLICANTLANGUAGES_PR (
        P_LANGUAGEID         IN     NUMBER,
        P_APPLICANTID        IN     VARCHAR,
        P_PROFICIENCYLEVEL   IN     NUMBER,
        P_ERROR                 OUT VARCHAR)
    IS
    BEGIN
        INSERT INTO APPLICANTLANGUAGES_TB (LANGUAGEID,
                                           APPLICANTID,
                                           PROFICIENCYLEVEL)
             VALUES (P_LANGUAGEID, P_APPLICANTID, P_PROFICIENCYLEVEL);


        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE APPLICANTLANGUAGES ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_APPLICANTLANGUAGES_PR (
        P_LANGUAGEID         IN     NUMBER,
        P_APPLICANTID        IN     VARCHAR,
        P_PROFICIENCYLEVEL   IN     NUMBER,
        P_ERROR                 OUT VARCHAR)
    IS
    BEGIN
        UPDATE APPLICANTLANGUAGES_TB
           SET PROFICIENCYLEVEL = P_PROFICIENCYLEVEL
         WHERE LANGUAGEID = P_LANGUAGEID AND APPLICANTID = P_APPLICANTID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_APPLICANTLANGUAGES_PR (P_LANGUAGEID    IN     NUMBER,
                                            P_APPLICANTID   IN     VARCHAR,
                                            P_ERROR            OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM APPLICANTLANGUAGES_TB
              WHERE LANGUAGEID = P_LANGUAGEID AND APPLICANTID = P_APPLICANTID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_APPLICANTLANGUAGES_PR (P_CURSOR   OUT REF_CURSOR,
                                            P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT LANGUAGEID, APPLICANTID, PROFICIENCYLEVEL
              FROM APPLICANTLANGUAGES_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_APPLICANTLANGUAGES_PKG;
/
