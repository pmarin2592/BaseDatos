/* Formatted on 7/26/2024 4:00:53 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_WORKEXPERIENCE_PKG
AS
    /******************************************************************************
       NAME:       UTIL_WORKEXPERIENCE_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                WORKEXPERIENCE_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/27/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_WORKEXPERIENCE_PR (P_APPLICANTID            IN     NUMBER,
                                    P_STARTDATE           IN     DATE,
                                    P_ENDDATE            IN     DATE,
                                    P_CURRENTLYEMPLOYED               IN     NUMBER,
                                    P_POSITIONTITLE               IN     VARCHAR2,
                                    P_DESCRIPTIONWORK   IN     VARCHAR2,
                                    P_REASONFORLEAVING IN VARCHAR2,
                                    P_REFERENCENAME IN VARCHAR2,
                                    P_REFERENCEPHONE IN VARCHAR2,
                                    P_REFERENCEEMAIL IN VARCHAR2,
                                    P_EXPERIENCEID            OUT NUMBER,
                                    P_ERROR                  OUT VARCHAR);

    PROCEDURE UPDATE_WORKEXPERIENCE_PR (P_APPLICANTID            IN     NUMBER,
                                    P_STARTDATE           IN     DATE,
                                    P_ENDDATE            IN     DATE,
                                    P_CURRENTLYEMPLOYED               IN     NUMBER,
                                    P_POSITIONTITLE               IN     VARCHAR2,
                                    P_DESCRIPTIONWORK   IN     VARCHAR2,
                                    P_REASONFORLEAVING IN VARCHAR2,
                                    P_REFERENCENAME IN VARCHAR2,
                                    P_REFERENCEPHONE IN VARCHAR2,
                                    P_REFERENCEEMAIL IN VARCHAR2,
                                    P_EXPERIENCEID            IN NUMBER,
                                    P_ERROR                  OUT VARCHAR);

    PROCEDURE DELETE_WORKEXPERIENCE_PR (P_EXPERIENCEID   IN     NUMBER,
                                    P_ERROR            OUT VARCHAR);

    PROCEDURE SELECT_WORKEXPERIENCE_PR (P_CURSOR   OUT REF_CURSOR,
                                    P_ERROR    OUT VARCHAR);
END UTIL_WORKEXPERIENCE_PKG;
/