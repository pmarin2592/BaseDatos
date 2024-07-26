/* Formatted on 7/26/2024 2:53:32 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_LANGUAGEREQUIREMENTS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_LanguageRequirements_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                EXPERIENCETYPES_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_LANGUAGEREQUIREMENTS_PR (P_LANGUAGEID   IN     NUMBER,
                                              P_POSITIONID   IN     NUMBER,
                                              P_LEVELID        IN     NUMBER,
                                              P_ERROR           OUT VARCHAR);

    PROCEDURE UPDATE_LANGUAGEREQUIREMENTS_PR (P_LANGUAGEID   IN     NUMBER,
                                              P_POSITIONID   IN     NUMBER,
                                              P_LEVELID        IN     NUMBER,
                                              P_ERROR           OUT VARCHAR);

    PROCEDURE DELETE_LANGUAGEREQUIREMENTS_PR (P_LANGUAGEID   IN     NUMBER,
                                              P_POSITIONID   IN     NUMBER,
                                              P_ERROR           OUT VARCHAR);

    PROCEDURE SELECT_LANGUAGEREQUIREMENTS_PR (P_CURSOR   OUT REF_CURSOR,
                                              P_ERROR    OUT VARCHAR);
END UTIL_LANGUAGEREQUIREMENTS_PKG;
/
