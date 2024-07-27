/* Formatted on 7/26/2024 4:00:53 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_Applicants_PKG
AS
    /******************************************************************************
       NAME:       UTIL_Applicants_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                Applicants_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_Applicants_PR (P_IDNumber            IN     NUMBER,
                                    P_FirstName           IN     VARCHAR2,
                                    P_LastName            IN     VARCHAR2,
                                    P_EMAIL               IN     VARCHAR2,
                                    P_Phone               IN     VARCHAR2,
                                    P_YearsOfExperience   IN     NUMBER,
                                    P_ApplicantID            OUT NUMBER,
                                    P_ERROR                  OUT VARCHAR);

    PROCEDURE UPDATE_Applicants_PR (P_ApplicantID         IN     NUMBER,
                                    P_IDNumber            IN     NUMBER,
                                    P_FirstName           IN     VARCHAR2,
                                    P_LastName            IN     VARCHAR2,
                                    P_EMAIL               IN     VARCHAR2,
                                    P_Phone               IN     VARCHAR2,
                                    P_YearsOfExperience   IN     NUMBER,
                                    P_ERROR                  OUT VARCHAR);

    PROCEDURE DELETE_Applicants_PR (P_ApplicantID   IN     NUMBER,
                                    P_ERROR            OUT VARCHAR);

    PROCEDURE SELECT_Applicants_PR (P_CURSOR   OUT REF_CURSOR,
                                    P_ERROR    OUT VARCHAR);
END UTIL_Applicants_PKG;
/
