/* Formatted on 7/27/2024 1:49:14 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_WORKEXPERIENCE_PKG
AS
    /******************************************************************************
      NAME:       UTIL_WORKEXPERIENCE_PKG
      PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
               WORKEXPERIENCE_TB

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        7/27/2024      PMARIN       1. Created this package.
   ******************************************************************************/

    PROCEDURE INSERT_WORKEXPERIENCE_PR (
        P_APPLICANTID         IN     NUMBER,
        P_STARTDATE           IN     DATE,
        P_ENDDATE             IN     DATE,
        P_CURRENTLYEMPLOYED   IN     NUMBER,
        P_POSITIONTITLE       IN     VARCHAR2,
        P_DESCRIPTIONWORK     IN     VARCHAR2,
        P_REASONFORLEAVING    IN     VARCHAR2,
        P_REFERENCENAME       IN     VARCHAR2,
        P_REFERENCEPHONE      IN     VARCHAR2,
        P_REFERENCEEMAIL      IN     VARCHAR2,
        P_EXPERIENCEID           OUT NUMBER,
        P_ERROR                  OUT VARCHAR)
    IS
        V_EXPERIENCEID   NUMBER (18);
    BEGIN
        SELECT WORKEXPERIENCE_SQ.NEXTVAL INTO V_EXPERIENCEID FROM DUAL;

        INSERT INTO WORKEXPERIENCE_TB (EXPERIENCEID,
                                       APPLICANTID,
                                       STARTDATE,
                                       ENDDATE,
                                       CURRENTLYEMPLOYED,
                                       POSITIONTITLE,
                                       DESCRIPTIONWORK,
                                       REASONFORLEAVING,
                                       REFERENCENAME,
                                       REFERENCEPHONE,
                                       REFERENCEEMAIL)
             VALUES (V_EXPERIENCEID,
                     P_APPLICANTID,
                     P_STARTDATE,
                     P_ENDDATE,
                     P_CURRENTLYEMPLOYED,
                     P_POSITIONTITLE,
                     P_DESCRIPTIONWORK,
                     P_REASONFORLEAVING,
                     P_REFERENCENAME,
                     P_REFERENCEPHONE,
                     P_REFERENCEEMAIL);

        P_EXPERIENCEID := V_EXPERIENCEID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE WORKEXPERIENCE ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_WORKEXPERIENCE_PR (
        P_APPLICANTID         IN     NUMBER,
        P_STARTDATE           IN     DATE,
        P_ENDDATE             IN     DATE,
        P_CURRENTLYEMPLOYED   IN     NUMBER,
        P_POSITIONTITLE       IN     VARCHAR2,
        P_DESCRIPTIONWORK     IN     VARCHAR2,
        P_REASONFORLEAVING    IN     VARCHAR2,
        P_REFERENCENAME       IN     VARCHAR2,
        P_REFERENCEPHONE      IN     VARCHAR2,
        P_REFERENCEEMAIL      IN     VARCHAR2,
        P_EXPERIENCEID        IN     NUMBER,
        P_ERROR                  OUT VARCHAR)
    IS
    BEGIN
        UPDATE WORKEXPERIENCE_TB
           SET APPLICANTID = P_APPLICANTID,
               STARTDATE = P_STARTDATE,
               ENDDATE = P_ENDDATE,
               CURRENTLYEMPLOYED = P_CURRENTLYEMPLOYED,
               POSITIONTITLE = P_POSITIONTITLE,
               DESCRIPTIONWORK = P_DESCRIPTIONWORK,
               REASONFORLEAVING = P_REASONFORLEAVING,
               REFERENCENAME = P_REFERENCENAME,
               REFERENCEPHONE = P_REFERENCEPHONE,
               REFERENCEEMAIL = P_REFERENCEEMAIL
         WHERE EXPERIENCEID = P_EXPERIENCEID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_WORKEXPERIENCE_PR (P_EXPERIENCEID   IN     NUMBER,
                                        P_ERROR             OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM WORKEXPERIENCE_TB
              WHERE EXPERIENCEID = P_EXPERIENCEID;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_WORKEXPERIENCE_PR (P_CURSOR   OUT REF_CURSOR,
                                        P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT EXPERIENCEID,
                   APPLICANTID,
                   STARTDATE,
                   ENDDATE,
                   CURRENTLYEMPLOYED,
                   POSITIONTITLE,
                   DESCRIPTIONWORK,
                   REASONFORLEAVING,
                   REFERENCENAME,
                   REFERENCEPHONE,
                   REFERENCEEMAIL
              FROM WORKEXPERIENCE_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_WORKEXPERIENCE_PKG;
/
