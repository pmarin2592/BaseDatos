/* Formatted on 7/27/2024 1:32:08 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_HIRINGPROCESS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_HiringProcess_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                HiringProcess_tb

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      NBRENES       1. Created this package.
    ******************************************************************************/

    PROCEDURE INSERT_HIRINGPROCESS_PR (P_APPLICANTID       IN     NUMBER,
                                       P_STATUSID          IN     NUMBER,
                                       P_APPLICATIONDATE   IN     DATE,
                                       P_COMPLETIONDATE    IN     DATE,
                                       P_HIRED             IN     NUMBER,
                                       P_PROCESSID            OUT NUMBER,
                                       P_ERROR                OUT VARCHAR)
    IS
        V_PROCESSID   NUMBER (18);
    BEGIN
        SELECT HIRINGPROCESS_SQ.NEXTVAL INTO V_PROCESSID FROM DUAL;

        INSERT INTO HIRINGPROCESS_TB (PROCESSID,
                                      APPLICANTID,
                                      STATUSID,
                                      APPLICATIONDATE,
                                      COMPLETIONDATE,
                                      HIRED)
             VALUES (V_PROCESSID,
                     P_APPLICANTID,
                     P_STATUSID,
                     P_APPLICATIONDATE,
                     P_COMPLETIONDATE,
                     P_HIRED);

        P_PROCESSID := V_PROCESSID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE HIRINGPROCESS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_HIRINGPROCESS_PR (P_APPLICANTID       IN     NUMBER,
                                       P_STATUSID          IN     NUMBER,
                                       P_APPLICATIONDATE   IN     DATE,
                                       P_COMPLETIONDATE    IN     DATE,
                                       P_HIRED             IN     NUMBER,
                                       P_PROCESSID         IN     NUMBER,
                                       P_ERROR                OUT VARCHAR)
    IS
    BEGIN
        UPDATE HIRINGPROCESS_TB
           SET APPLICANTID = P_APPLICANTID,
               STATUSID = P_STATUSID,
               APPLICATIONDATE = P_APPLICATIONDATE,
               COMPLETIONDATE = P_COMPLETIONDATE,
               HIRED = P_HIRED
         WHERE PROCESSID = P_PROCESSID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_HIRINGPROCESS_PR (P_PROCESSID   IN     NUMBER,
                                       P_ERROR          OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM HIRINGPROCESS_TB
              WHERE PROCESSID = P_PROCESSID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

   PROCEDURE SELECT_HIRINGPROCESS_PR (P_CURSOR   OUT REF_CURSOR,
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
END UTIL_HIRINGPROCESS_PKG;
/
