/* Formatted on 7/25/2024 7:37:35 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_COMPANIES_PKG
AS
    /******************************************************************************
           NAME:       UTIL_COMPANIES_PKG
           PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                    COMPANIES_TB

           REVISIONS:
           Ver        Date        Author           Description
           ---------  ----------  ---------------  ------------------------------------
           1.0        7/25/2024      PMARIN       1. Created this package body.
        ******************************************************************************/

    PROCEDURE INSERT_COMPANIES_PR (P_NAMECOMPANY          IN     VARCHAR2,
                                   P_ADDRESSCOMPANY       IN     VARCHAR2,
                                   P_DESCRIPTIONCOMPANY   IN     VARCHAR2,
                                   P_COMPANYID               OUT NUMBER,
                                   P_ERROR                   OUT VARCHAR)
    IS
        V_RAISE_EXISTS   EXCEPTION;
        V_COMPANY        NUMBER (1);
        V_COMPANYID      NUMBER (18);
    BEGIN
        --Se valida si existe compania
        SELECT NVL (COUNT (*), 0)
          INTO V_COMPANY
          FROM COMPANIES_TB A
         WHERE UPPER (A.NAMECOMPANY) LIKE UPPER (P_NAMECOMPANY);

        IF V_COMPANY != 0
        THEN
            --Si existe aplica una excepcion controlada
            RAISE V_RAISE_EXISTS;
        ELSE
            --Busca el consecutivo de compania
            SELECT COMPANIES_SQ.NEXTVAL INTO V_COMPANYID FROM DUAL;

            --Inserta compania
            INSERT INTO COMPANIES_TB (COMPANYID,
                                      NAMECOMPANY,
                                      ADDRESSCOMPANY,
                                      DESCRIPTIONCOMPANY)
                 VALUES (V_COMPANYID,
                         P_NAMECOMPANY,
                         P_ADDRESSCOMPANY,
                         P_DESCRIPTIONCOMPANY);

            COMMIT;
        END IF;
    EXCEPTION
        WHEN V_RAISE_EXISTS
        THEN
            P_ERROR := 'ERROR, THE COMPANY ALREADY EXISTS';
            ROLLBACK;
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE COMPANY ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_COMPANIES_PR (P_COMPANYID            IN     NUMBER,
                                   P_NAMECOMPANY          IN     VARCHAR2,
                                   P_ADDRESSCOMPANY       IN     VARCHAR2,
                                   P_DESCRIPTIONCOMPANY   IN     VARCHAR2,
                                   P_ACTIVE               IN     NUMBER,
                                   P_ERROR                   OUT VARCHAR)
    IS
    BEGIN
        UPDATE COMPANIES_TB
           SET NAMECOMPANY = P_NAMECOMPANY,
               ADDRESSCOMPANY = P_ADDRESSCOMPANY,
               DESCRIPTIONCOMPANY = P_DESCRIPTIONCOMPANY,
               ACTIVE = P_ACTIVE
         WHERE COMPANYID = P_COMPANYID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_COMPANIES_PR (P_COMPANYID   IN     NUMBER,
                                   P_ERROR          OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM COMPANIES_TB
              WHERE COMPANYID = P_COMPANYID;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_COMPANIES_PR (P_CURSOR   OUT REF_CURSOR,
                                   P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT COMPANYID,
                   NAMECOMPANY,
                   ADDRESSCOMPANY,
                   DESCRIPTIONCOMPANY,
                   ACTIVE
              FROM COMPANIES_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;
END UTIL_COMPANIES_PKG;
/
