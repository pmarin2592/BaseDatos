/* Formatted on 8/11/2024 2:56:37 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_JOBPOSITIONS_PKG
AS
    /******************************************************************************
           NAME:       UTIL_JOBPOSITIONS_PKG
           PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                    JOBPOSITIONS_TB

           REVISIONS:
           Ver        Date        Author           Description
           ---------  ----------  ---------------  ------------------------------------
           1.0        7/25/2024      PMARIN       1. Created this package body.
        ******************************************************************************/

    PROCEDURE INSERT_JOBPOSITIONS_PR (P_POSITIONTITLE       IN     VARCHAR2,
                                      P_COMPANYID           IN     NUMBER,
                                      P_DESCRIPTIONJOB      IN     VARCHAR2,
                                      P_SALARY              IN     NUMBER,
                                      P_SALARYVISIBLE       IN     NUMBER,
                                      P_STARTDATE           IN     DATE,
                                      P_ENDDATE             IN     DATE,
                                      P_YEARSOFEXPERIENCE   IN     NUMBER,
                                      P_EXPERIENCETYPEID    IN     NUMBER,
                                      P_POSITIONID             OUT NUMBER,
                                      P_ERROR                  OUT VARCHAR)
    IS
        V_POSITIONID   NUMBER (18);
    BEGIN
        --Busca el consecutivo de compania
        SELECT JOBPOSITIONS_SQ.NEXTVAL INTO V_POSITIONID FROM DUAL;

        INSERT INTO JOBPOSITIONS_TB (POSITIONID,
                                     COMPANYID,
                                     POSITIONTITLE,
                                     DESCRIPTIONJOB,
                                     SALARY,
                                     SALARYVISIBLE,
                                     STARTDATE,
                                     ENDDATE,
                                     YEARSOFEXPERIENCE,
                                     EXPERIENCETYPEID)
             VALUES (V_POSITIONID,
                     P_COMPANYID,
                     P_POSITIONTITLE,
                     P_DESCRIPTIONJOB,
                     P_SALARY,
                     P_SALARYVISIBLE,
                     P_STARTDATE,
                     P_ENDDATE,
                     P_YEARSOFEXPERIENCE,
                     P_EXPERIENCETYPEID);

        P_POSITIONID := V_POSITIONID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE JOBPOSITIONS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_JOBPOSITIONS_PR (P_POSITIONID          IN     NUMBER,
                                      P_POSITIONTITLE       IN     VARCHAR2,
                                      P_COMPANYID           IN     NUMBER,
                                      P_DESCRIPTIONJOB      IN     VARCHAR2,
                                      P_SALARY              IN     NUMBER,
                                      P_SALARYVISIBLE       IN     NUMBER,
                                      P_STARTDATE           IN     DATE,
                                      P_ENDDATE             IN     DATE,
                                      P_YEARSOFEXPERIENCE   IN     NUMBER,
                                      P_EXPERIENCETYPEID    IN     NUMBER,
                                      P_ACTIVE              IN     NUMBER,
                                      P_ERROR                  OUT VARCHAR)
    IS
    BEGIN
        UPDATE JOBPOSITIONS_TB
           SET COMPANYID = P_COMPANYID,
               POSITIONTITLE = P_POSITIONTITLE,
               DESCRIPTIONJOB = P_DESCRIPTIONJOB,
               SALARY = P_SALARY,
               SALARYVISIBLE = P_SALARYVISIBLE,
               STARTDATE = P_STARTDATE,
               ENDDATE = P_ENDDATE,
               YEARSOFEXPERIENCE = P_YEARSOFEXPERIENCE,
               EXPERIENCETYPEID = P_EXPERIENCETYPEID,
               ACTIVE = P_ACTIVE
         WHERE POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_JOBPOSITIONS_PR (P_POSITIONID   IN     NUMBER,
                                      P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM JOBPOSITIONS_TB
              WHERE POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_JOBPOSITIONS_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT PROCESSID,
                   APPLICANTID,
                   STATUSID,
                   APPLICATIONDATE,
                   COMPLETIONDATE,
                   HIRED
              FROM HIRINGPROCESS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;

    PROCEDURE REPORT_JOBPOSITIONS_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
              SELECT J.POSITIONTITLE, COUNT (H.JOBPOSITIONID) COUNT_APPLICANTS
                FROM HIRINGPROCESS_TB H, JOBPOSITIONS_TB J
               WHERE H.JOBPOSITIONID = J.POSITIONID
            GROUP BY J.POSITIONTITLE;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;

    PROCEDURE UPDATE_MASSIVE_JOBPOSITIONS_PR (P_DATE        DATE,
                                              P_ERROR   OUT VARCHAR)
    IS
        CURSOR c_job_positions (V_DATE DATE)
        IS
            SELECT POSITIONID
              FROM JOBPOSITIONS_TB
             WHERE ENDDATE <= V_DATE;

        V_RAISE   EXCEPTION;
    BEGIN
        IF P_DATE IS NULL
        THEN
            RAISE V_RAISE;
        END IF;


        FOR X IN c_job_positions (P_DATE)
        LOOP
            UPDATE JOBPOSITIONS_TB J
               SET J.ACTIVE = 0
             WHERE J.POSITIONID = X.POSITIONID;

            COMMIT;
        END LOOP;
    EXCEPTION
        WHEN V_RAISE
        THEN
            P_ERROR := 'FECHA VIENE VACIA';
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;
END UTIL_JOBPOSITIONS_PKG;
/
