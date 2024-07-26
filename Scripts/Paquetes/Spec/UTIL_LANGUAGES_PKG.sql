/* Formatted on 7/25/2024 10:12:32 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_LANGUAGES_PKG
AS
    /******************************************************************************
       NAME:       UTIL_COMPANIES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                LANGUAGES_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/25/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_LANGUAGES_PR (P_LanguageL       IN     VARCHAR2,                                  
                                      P_LanguageID             OUT NUMBER,
                                      P_ERROR                OUT VARCHAR);

    PROCEDURE UPDATE_LANGUAGES_PR (P_LanguageID          IN     NUMBER,
                                      P_LanguageL       IN     VARCHAR2,                                  
                                      P_ERROR                OUT VARCHAR);

    PROCEDURE DELETE_LANGUAGES_PR (P_LanguageID   IN     NUMBER,
                                      P_ERROR         OUT VARCHAR);

    PROCEDURE SELECT_LANGUAGES_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR);
END UTIL_LANGUAGES_PKG;
/
