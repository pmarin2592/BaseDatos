CREATE OR REPLACE PACKAGE JOBHUNTINGDB.UTIL_LANGUAGELEVELS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_COMPANIES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                LANGUAGELEVELS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_LANGUAGELEVELS_PR (
        P_LevelLanguage          IN     VARCHAR2,
        P_RankLevel          IN     VARCHAR2,
        P_LevelID               OUT NUMBER,
        P_ERROR                   OUT VARCHAR);

    PROCEDURE UPDATE_LANGUAGELEVELS_PR (
        P_LevelID            IN     NUMBER,
        P_LevelLanguage          IN     VARCHAR2,
        P_RankLevel          IN     VARCHAR2,
        P_ERROR                   OUT VARCHAR);

    PROCEDURE DELETE_LANGUAGELEVELS_PR (P_LevelID   IN     NUMBER,
                                   P_ERROR          OUT VARCHAR );

    PROCEDURE SELECT_LANGUAGELEVELS_PR (P_CURSOR   OUT REF_CURSOR,
                                   P_ERROR    OUT VARCHAR );
END UTIL_LANGUAGELEVELS_PKG;
/