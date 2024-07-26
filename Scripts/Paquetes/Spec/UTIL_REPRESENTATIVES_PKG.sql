/* Formatted on 7/25/2024 6:58:04 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_REPRESENTATIVES_PKG
AS
    /******************************************************************************
       NAME:       UTIL_COMPANIES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                REPRESENTATIVES_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/25/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_REPRESENTATIVES_PR (
        P_NAMEREPRESENTATIVE          IN     VARCHAR2,
        P_COMPANYID       IN     NUMBER,
        P_EMAIL   IN     VARCHAR2,
        P_REPRESENTATIVEID               OUT NUMBER,
        P_ERROR                   OUT VARCHAR);

    PROCEDURE UPDATE_REPRESENTATIVES_PR (
        P_REPRESENTATIVEID            IN     NUMBER,
        P_NAMEREPRESENTATIVE          IN     VARCHAR2,
        P_COMPANYID       IN     NUMBER,
        P_EMAIL   IN     VARCHAR2,
        P_ACTIVE                 IN     NUMBER,
        P_ERROR                   OUT VARCHAR);

    PROCEDURE DELETE_REPRESENTATIVES_PR (P_REPRESENTATIVEID   IN     NUMBER,
                                   P_ERROR          OUT VARCHAR );

    PROCEDURE SELECT_REPRESENTATIVES_PR (P_CURSOR   OUT REF_CURSOR,
                                   P_ERROR    OUT VARCHAR );
END UTIL_REPRESENTATIVES_PKG;
/
