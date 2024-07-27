/* Formatted on 7/27/2024 11:12:40 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_EDUCATION_PKG
AS
    /******************************************************************************
       NAME:       UTIL_EDUCATION_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                Education_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/27/2024      PMARIN       1. Created this package.
    ******************************************************************************/

    PROCEDURE INSERT_EDUCATION_PR (P_APPLICANTID            IN     NUMBER,
                                   P_STARTYEAR              IN     NUMBER,
                                   P_ENDYEAR                IN     NUMBER,
                                   P_TITLEID                IN     NUMBER,
                                   P_DESCRIPTIONEDUCATION   IN     VARCHAR2,
                                   P_EDUCATIONID               OUT NUMBER,
                                   P_ERROR                     OUT VARCHAR)
    IS
        V_EDUCATIONID   NUMBER (18);
    BEGIN
        SELECT Education_SQ.NEXTVAL INTO V_EDUCATIONID FROM DUAL;

        INSERT INTO EDUCATION_TB (EDUCATIONID,
                                  APPLICANTID,
                                  STARTYEAR,
                                  ENDYEAR,
                                  TITLEID,
                                  DESCRIPTIONEDUCATION)
             VALUES (V_EDUCATIONID,
                     P_APPLICANTID,
                     P_STARTYEAR,
                     P_ENDYEAR,
                     P_TITLEID,
                     P_DESCRIPTIONEDUCATION);


        P_EDUCATIONID := V_EDUCATIONID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE EDUCATION ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_EDUCATION_PR (P_APPLICANTID            IN     NUMBER,
                                   P_STARTYEAR              IN     NUMBER,
                                   P_ENDYEAR                IN     NUMBER,
                                   P_TITLEID                IN     NUMBER,
                                   P_DESCRIPTIONEDUCATION   IN     VARCHAR2,
                                   P_EDUCATIONID            IN     NUMBER,
                                   P_ERROR                     OUT VARCHAR)
    IS
    BEGIN
        UPDATE EDUCATION_TB
           SET APPLICANTID = P_APPLICANTID,
               STARTYEAR = P_STARTYEAR,
               ENDYEAR = P_ENDYEAR,
               TITLEID = P_TITLEID,
               DESCRIPTIONEDUCATION = P_DESCRIPTIONEDUCATION
         WHERE EDUCATIONID = P_EDUCATIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_EDUCATION_PR (P_EDUCATIONID   IN     NUMBER,
                                   P_ERROR            OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM EDUCATION_TB
              WHERE EDUCATIONID = P_EDUCATIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_EDUCATION_PR (P_CURSOR   OUT REF_CURSOR,
                                   P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT EDUCATIONID,
                   APPLICANTID,
                   STARTYEAR,
                   ENDYEAR,
                   TITLEID,
                   DESCRIPTIONEDUCATION
              FROM EDUCATION_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_EDUCATION_PKG;
/
