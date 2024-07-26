/* Formatted on 7/25/2024 9:21:37 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_REPRESENTATIVES_PKG
AS
    /******************************************************************************
           NAME:       UTIL_COMPANIES_PKG
           PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                    REPRESENTATIVES_TB

           REVISIONS:
           Ver        Date        Author           Description
           ---------  ----------  ---------------  ------------------------------------
           1.0        7/25/2024      PMARIN       1. Created this package body.
        ******************************************************************************/

    PROCEDURE INSERT_REPRESENTATIVES_PR (
        P_NAMEREPRESENTATIVE   IN     VARCHAR2,
        P_COMPANYID            IN     NUMBER,
        P_EMAIL                IN     VARCHAR2,
        P_REPRESENTATIVEID        OUT NUMBER,
        P_ERROR                   OUT VARCHAR)
    IS
        V_REPRESENTATIVEID   NUMBER (18);
    BEGIN
        --Busca el consecutivo de compania
        SELECT REPRESENTATIVES_SQ.NEXTVAL INTO V_REPRESENTATIVEID FROM DUAL;

        INSERT INTO REPRESENTATIVES_TB (REPRESENTATIVEID,
                                        NAMEREPRESENTATIVE,
                                        COMPANYID,
                                        EMAIL)
             VALUES (V_REPRESENTATIVEID,
                     P_NAMEREPRESENTATIVE,
                     P_COMPANYID,
                     P_EMAIL);
P_REPRESENTATIVEID := V_REPRESENTATIVEID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE REPRESENTATIVES ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_REPRESENTATIVES_PR (
        P_REPRESENTATIVEID     IN     NUMBER,
        P_NAMEREPRESENTATIVE   IN     VARCHAR2,
        P_COMPANYID            IN     NUMBER,
        P_EMAIL                IN     VARCHAR2,
        P_ACTIVE               IN     NUMBER,
        P_ERROR                   OUT VARCHAR)
    IS
    BEGIN
        UPDATE REPRESENTATIVES_TB
           SET NAMEREPRESENTATIVE = P_NAMEREPRESENTATIVE,
               COMPANYID = P_COMPANYID,
               EMAIL = P_EMAIL,
               ACTIVE = P_ACTIVE
         WHERE REPRESENTATIVEID = P_REPRESENTATIVEID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_REPRESENTATIVES_PR (P_REPRESENTATIVEID   IN     NUMBER,
                                         P_ERROR                 OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM REPRESENTATIVES_TB
              WHERE REPRESENTATIVEID = P_REPRESENTATIVEID;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_REPRESENTATIVES_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT REPRESENTATIVEID,
                   NAMEREPRESENTATIVE,
                   COMPANYID,
                   EMAIL,
                   ACTIVE
              FROM REPRESENTATIVES_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            
    END;
END UTIL_REPRESENTATIVES_PKG;
/
