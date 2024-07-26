CREATE OR REPLACE PACKAGE JOBHUNTINGDB.UTIL_TITLES_PKG
AS
    /******************************************************************************
       NAME:       UTIL_COMPANIES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                TITLES_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_TITLES_PR (
        P_TITLE          IN     VARCHAR2,
        P_TITLEID               OUT NUMBER,
        P_ERROR                   OUT VARCHAR);

    PROCEDURE UPDATE_TITLES_PR (
        P_TITLEID            IN     NUMBER,
        P_TITLE          IN     VARCHAR2,
        P_ERROR                   OUT VARCHAR);

    PROCEDURE DELETE_TITLES_PR (P_TITLEID   IN     NUMBER,
                                   P_ERROR          OUT VARCHAR );

    PROCEDURE SELECT_TITLES_PR (P_CURSOR   OUT REF_CURSOR,
                                   P_ERROR    OUT VARCHAR );
END UTIL_TITLES_PKG;
/