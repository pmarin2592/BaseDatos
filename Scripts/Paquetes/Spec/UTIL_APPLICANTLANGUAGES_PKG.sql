/* Formatted on 7/27/2024 12:47:05 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_APPLICANTLANGUAGES_PKG
AS
    /******************************************************************************
          NAME:       UTIL_APPLICANTLANGUAGES_PKG
          PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                   APPLICANTLANGUAGES_TB

          REVISIONS:
          Ver        Date        Author           Description
          ---------  ----------  ---------------  ------------------------------------
          1.0        7/27/2024      NBRENES       1. Created this package.
       ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_APPLICANTLANGUAGES_PR (
        P_LANGUAGEID         IN     NUMBER,
        P_APPLICANTID        IN     VARCHAR,
        P_PROFICIENCYLEVEL   IN     NUMBER,
        P_ERROR                 OUT VARCHAR);

    PROCEDURE UPDATE_APPLICANTLANGUAGES_PR (
        P_LANGUAGEID         IN     NUMBER,
        P_APPLICANTID        IN     VARCHAR,
        P_PROFICIENCYLEVEL   IN     NUMBER,
        P_ERROR                 OUT VARCHAR);

    PROCEDURE DELETE_APPLICANTLANGUAGES_PR (P_LANGUAGEID    IN     NUMBER,
                                            P_APPLICANTID   IN     VARCHAR,
                                            P_ERROR            OUT VARCHAR);

    PROCEDURE SELECT_APPLICANTLANGUAGES_PR (P_CURSOR   OUT REF_CURSOR,
                                            P_ERROR    OUT VARCHAR);
END UTIL_APPLICANTLANGUAGES_PKG;
/
