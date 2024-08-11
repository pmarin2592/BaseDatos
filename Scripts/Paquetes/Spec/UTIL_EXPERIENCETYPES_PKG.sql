/* Formatted on 8/11/2024 1:17:49 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE JOBHUNTINGDB.UTIL_EXPERIENCETYPES_PKG
AS
    /******************************************************************************
       NAME:       UTIL_COMPANIES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                EXPERIENCETYPES_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/25/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_EXPERIENCETYPES_PR (P_ExperienceType   IN     VARCHAR2,
                                         P_TypeID              OUT NUMBER,
                                         P_ERROR               OUT VARCHAR);

    PROCEDURE UPDATE_EXPERIENCETYPES_PR (P_TypeID           IN     NUMBER,
                                         P_ExperienceType   IN     VARCHAR2,
                                         P_ERROR               OUT VARCHAR);

    PROCEDURE DELETE_EXPERIENCETYPES_PR (P_TypeID   IN     NUMBER,
                                         P_ERROR       OUT VARCHAR);

    PROCEDURE SELECT_EXPERIENCETYPES_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR);

    PROCEDURE REPORT_EXPERIENCETYPES_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR);
END UTIL_EXPERIENCETYPES_PKG;
/
