/* Formatted on 7/26/2024 12:36:00 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_SKILLREQUIREMENTS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_SKILLREQUIREMENTS_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                SKILLREQUIREMENTS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_SKILLREQUIREMENTS_PR (P_SKILLID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_DESIRABLE    IN     NUMBER,
                                           P_ERROR           OUT VARCHAR);

    PROCEDURE UPDATE_SKILLREQUIREMENTS_PR (P_SKILLID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_DESIRABLE    IN     NUMBER,
                                           P_ERROR           OUT VARCHAR);

    PROCEDURE DELETE_SKILLREQUIREMENTS_PR (P_SKILLID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_ERROR           OUT VARCHAR);

    PROCEDURE SELECT_SKILLREQUIREMENTS_PR (P_CURSOR   OUT REF_CURSOR,
                                           P_ERROR    OUT VARCHAR);
END UTIL_SKILLREQUIREMENTS_PKG;
/