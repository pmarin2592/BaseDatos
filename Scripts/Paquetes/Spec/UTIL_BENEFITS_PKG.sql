/* Formatted on 7/26/2024 3:25:33 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_BENEFITS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_Benefits_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                BENEFITS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_BENEFITS_PR (P_POSITIONID           IN     NUMBER,
                                  P_BENEFITDESCRIPTION   IN     VARCHAR,
                                  P_BENEFITID               OUT NUMBER,
                                  P_ERROR                   OUT VARCHAR);

    PROCEDURE UPDATE_BENEFITS_PR (P_BENEFITID            IN     NUMBER,
                                  P_POSITIONID           IN     NUMBER,
                                  P_BENEFITDESCRIPTION   IN     VARCHAR,
                                  P_ERROR                   OUT VARCHAR);

    PROCEDURE DELETE_BENEFITS_PR (P_BENEFITID    IN     NUMBER,
                                  P_POSITIONID   IN     NUMBER,
                                  P_ERROR           OUT VARCHAR);

    PROCEDURE SELECT_BENEFITS_PR (P_CURSOR   OUT REF_CURSOR,
                                  P_ERROR    OUT VARCHAR);
END UTIL_BENEFITS_PKG;
/
