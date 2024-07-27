/* Formatted on 7/27/2024 11:34:34 AM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_APPLICANTSKILLS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_ApplicantSkills_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                ApplicantSkills_tb

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      NBRENES       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_APPLICANTSKILLS_PR (
        P_APPLICANTID            IN     NUMBER,
        P_SKILL                  IN     VARCHAR,
        P_DESCRIPTIONAPPLICANT   IN     VARCHAR,
        P_SKILLID                   OUT NUMBER,
        P_ERROR                     OUT VARCHAR);

    PROCEDURE UPDATE_APPLICANTSKILLS_PR (
        P_APPLICANTID            IN     NUMBER,
        P_SKILL                  IN     VARCHAR,
        P_DESCRIPTIONAPPLICANT   IN     VARCHAR,
        P_SKILLID                IN     NUMBER,
        P_ERROR                     OUT VARCHAR);

    PROCEDURE DELETE_APPLICANTSKILLS_PR (P_SKILLID   IN     NUMBER,
                                         P_ERROR        OUT VARCHAR);

    PROCEDURE SELECT_APPLICANTSKILLS_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR);
END UTIL_APPLICANTSKILLS_PKG;
/
