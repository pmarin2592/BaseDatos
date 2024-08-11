/* Formatted on 8/11/2024 2:02:41 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_Applicants_PKG
AS
    /******************************************************************************
      NAME:       UTIL_Applicants_PKG
      PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
               Applicants_TB

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        7/26/2024      PMARIN       1. Created this package.
      1.1        08/11/2024     PMARIN       2. Se crea Reporte empleados y sus puestos
   ******************************************************************************/

    PROCEDURE INSERT_Applicants_PR (P_IDNumber            IN     NUMBER,
                                    P_FirstName           IN     VARCHAR2,
                                    P_LastName            IN     VARCHAR2,
                                    P_EMAIL               IN     VARCHAR2,
                                    P_Phone               IN     VARCHAR2,
                                    P_YearsOfExperience   IN     NUMBER,
                                    P_ApplicantID            OUT NUMBER,
                                    P_ERROR                  OUT VARCHAR)
    IS
        V_ApplicantID   NUMBER (18);
    BEGIN
        SELECT Applicants_SQ.NEXTVAL INTO V_ApplicantID FROM DUAL;

        INSERT INTO APPLICANTS_TB (APPLICANTID,
                                   IDNUMBER,
                                   FIRSTNAME,
                                   LASTNAME,
                                   EMAIL,
                                   PHONE,
                                   YEARSOFEXPERIENCE,
                                   RESUMEEXPERIENCE)
             VALUES (V_ApplicantID,
                     P_IDNumber,
                     P_FirstName,
                     P_LastName,
                     P_EMAIL,
                     P_Phone,
                     P_YearsOfExperience,
                     NULL);

        P_ApplicantID := V_ApplicantID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE Applicants ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_Applicants_PR (P_ApplicantID         IN     NUMBER,
                                    P_IDNumber            IN     NUMBER,
                                    P_FirstName           IN     VARCHAR2,
                                    P_LastName            IN     VARCHAR2,
                                    P_EMAIL               IN     VARCHAR2,
                                    P_Phone               IN     VARCHAR2,
                                    P_YearsOfExperience   IN     NUMBER,
                                    P_ERROR                  OUT VARCHAR)
    IS
    BEGIN
        UPDATE APPLICANTS_TB
           SET IDNUMBER = P_IDNumber,
               FIRSTNAME = P_FirstName,
               LASTNAME = P_LastName,
               EMAIL = P_EMAIL,
               PHONE = P_Phone,
               YEARSOFEXPERIENCE = P_YearsOfExperience
         WHERE APPLICANTID = P_ApplicantID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_Applicants_PR (P_ApplicantID   IN     NUMBER,
                                    P_ERROR            OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM APPLICANTS_TB
              WHERE APPLICANTID = P_ApplicantID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_Applicants_PR (P_CURSOR   OUT REF_CURSOR,
                                    P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT APPLICANTID,
                   IDNUMBER,
                   FIRSTNAME,
                   LASTNAME,
                   EMAIL,
                   PHONE,
                   YEARSOFEXPERIENCE
              FROM APPLICANTS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;

    PROCEDURE REPORT_Applicants_PR (P_CURSOR   OUT REF_CURSOR,
                                    P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT A.FIRSTNAME || ' ' || A.LASTNAME     NAME,
                   A.IDNUMBER,
                   A.EMAIL,
                   A.YEARSOFEXPERIENCE                  YEARS_OF_EXPERIENCE,
                   FIND_TITLEJOB_FC (A.APPLICANTID)     TITLE_JOB
              FROM APPLICANTS_TB A;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;

    PROCEDURE REPORT_Applicants_SALARY_PR (P_SALARY   IN     NUMBER,
                                           P_CURSOR      OUT REF_CURSOR,
                                           P_ERROR       OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT A.IDNUMBER,
                   A.FIRSTNAME || ' ' || A.LASTNAME                        NAME,
                   GET_SALARY_FC (GET_JOBPOSITIONID_FC (A.APPLICANTID))    SALARY
              FROM APPLICANTS_TB A
             WHERE GET_SALARY_FC (GET_JOBPOSITIONID_FC (A.APPLICANTID)) <=
                   P_SALARY;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_Applicants_PKG;
/
