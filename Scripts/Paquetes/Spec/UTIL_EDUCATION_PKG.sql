/* Formatted on 7/26/2024 3:25:33 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_EDUCATION_PKG
AS
    /******************************************************************************
       NAME:       UTIL_Benefits_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                Education_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/27/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_EDUCATION_PR (P_APPLICANTID           IN     NUMBER,
                                  P_STARTYEAR   IN     NUMBER,
                                  P_ENDYEAR IN NUMBER,
                                  P_TITLEID IN NUMBER,
                                  P_DESCRIPTIONEDUCATION IN VARCHAR2,
                                  P_EDUCATIONID               OUT NUMBER,
                                  P_ERROR                   OUT VARCHAR);

    PROCEDURE UPDATE_EDUCATION_PR (P_APPLICANTID           IN     NUMBER,
                                  P_STARTYEAR   IN     NUMBER,
                                  P_ENDYEAR IN NUMBER,
                                  P_TITLEID IN NUMBER,
                                  P_DESCRIPTIONEDUCATION IN VARCHAR2,
                                  P_EDUCATIONID               IN NUMBER,
                                  P_ERROR                   OUT VARCHAR);

    PROCEDURE DELETE_EDUCATION_PR (P_EDUCATIONID    IN     NUMBER,                                
                                  P_ERROR           OUT VARCHAR);

    PROCEDURE SELECT_EDUCATION_PR (P_CURSOR   OUT REF_CURSOR,
                                  P_ERROR    OUT VARCHAR);
END UTIL_EDUCATION_PKG;
/