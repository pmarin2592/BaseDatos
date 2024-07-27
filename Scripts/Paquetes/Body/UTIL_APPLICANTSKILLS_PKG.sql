/* Formatted on 7/27/2024 11:41:27 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_APPLICANTSKILLS_PKG
AS
    /******************************************************************************
          NAME:       UTIL_ApplicantSkills_PKG
          PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                   ApplicantSkills_tb

          REVISIONS:
          Ver        Date        Author           Description
          ---------  ----------  ---------------  ------------------------------------
          1.0        7/26/2024      NBRENES       1. Created this package.
       ******************************************************************************/

    PROCEDURE INSERT_APPLICANTSKILLS_PR (
        P_APPLICANTID            IN     NUMBER,
        P_SKILL                  IN     VARCHAR,
        P_DESCRIPTIONAPPLICANT   IN     VARCHAR,
        P_SKILLID                   OUT NUMBER,
        P_ERROR                     OUT VARCHAR)
    IS
        V_SKILLID   NUMBER (18);
    BEGIN
        SELECT ApplicantSkills_SQ.NEXTVAL INTO V_SKILLID FROM DUAL;

        INSERT INTO APPLICANTSKILLS_TB (SKILLID,
                                        APPLICANTID,
                                        SKILL,
                                        DESCRIPTIONAPPLICANT)
             VALUES (V_SKILLID,
                     P_APPLICANTID,
                     P_SKILL,
                     P_DESCRIPTIONAPPLICANT);

        P_SKILLID := V_SKILLID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE BENEFITS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_APPLICANTSKILLS_PR (
        P_APPLICANTID            IN     NUMBER,
        P_SKILL                  IN     VARCHAR,
        P_DESCRIPTIONAPPLICANT   IN     VARCHAR,
        P_SKILLID                IN     NUMBER,
        P_ERROR                     OUT VARCHAR)
    IS
    BEGIN
        UPDATE APPLICANTSKILLS_TB
           SET APPLICANTID = P_APPLICANTID,
               SKILL = P_SKILL,
               DESCRIPTIONAPPLICANT = P_DESCRIPTIONAPPLICANT
         WHERE SKILLID = P_SKILLID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_APPLICANTSKILLS_PR (P_SKILLID   IN     NUMBER,
                                         P_ERROR        OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM APPLICANTSKILLS_TB
              WHERE SKILLID = P_SKILLID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_APPLICANTSKILLS_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT SKILLID,
                   APPLICANTID,
                   SKILL,
                   DESCRIPTIONAPPLICANT
              FROM APPLICANTSKILLS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_APPLICANTSKILLS_PKG;
/
