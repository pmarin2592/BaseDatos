/* Formatted on 7/27/2024 11:34:34 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_PROCESSSTATUS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_PROCESSSTATUS_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                PROCESSSTATUS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/27/2024      NBRENES       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_PROCESSSTATUS_PR (     
        P_StatusProcess                  IN     VARCHAR,      
        P_StatusID                   OUT NUMBER,
        P_ERROR                     OUT VARCHAR);

    PROCEDURE UPDATE_PROCESSSTATUS_PR (
        P_StatusProcess                  IN     VARCHAR,      
        P_StatusID                   IN NUMBER,
        P_ERROR                     OUT VARCHAR);

    PROCEDURE DELETE_PROCESSSTATUS_PR (P_StatusID   IN     NUMBER,
                                         P_ERROR        OUT VARCHAR);

    PROCEDURE SELECT_PROCESSSTATUS_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR);
END UTIL_PROCESSSTATUS_PKG;
/