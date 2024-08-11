/* Formatted on 8/11/2024 2:44:05 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE JOBHUNTINGDB.UTIL_JOBPOSITIONS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_COMPANIES_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                JOBPOSITIONS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/25/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_JOBPOSITIONS_PR (P_POSITIONTITLE       IN     VARCHAR2,
                                      P_COMPANYID           IN     NUMBER,
                                      P_DESCRIPTIONJOB      IN     VARCHAR2,
                                      P_SALARY              IN     NUMBER,
                                      P_SALARYVISIBLE       IN     NUMBER,
                                      P_STARTDATE           IN     DATE,
                                      P_ENDDATE             IN     DATE,
                                      P_YEARSOFEXPERIENCE   IN     NUMBER,
                                      P_EXPERIENCETYPEID    IN     NUMBER,
                                      P_POSITIONID             OUT NUMBER,
                                      P_ERROR                  OUT VARCHAR);

    PROCEDURE UPDATE_JOBPOSITIONS_PR (P_POSITIONID          IN     NUMBER,
                                      P_POSITIONTITLE       IN     VARCHAR2,
                                      P_COMPANYID           IN     NUMBER,
                                      P_DESCRIPTIONJOB      IN     VARCHAR2,
                                      P_SALARY              IN     NUMBER,
                                      P_SALARYVISIBLE       IN     NUMBER,
                                      P_STARTDATE           IN     DATE,
                                      P_ENDDATE             IN     DATE,
                                      P_YEARSOFEXPERIENCE   IN     NUMBER,
                                      P_EXPERIENCETYPEID    IN     NUMBER,
                                      P_ACTIVE              IN     NUMBER,
                                      P_ERROR                  OUT VARCHAR);

    PROCEDURE DELETE_JOBPOSITIONS_PR (P_POSITIONID   IN     NUMBER,
                                      P_ERROR           OUT VARCHAR);

    PROCEDURE SELECT_JOBPOSITIONS_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR);

    PROCEDURE REPORT_JOBPOSITIONS_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR);

    PROCEDURE UPDATE_MASSIVE_JOBPOSITIONS_PR (P_DATE DATE,
                                              P_ERROR    OUT VARCHAR);
END UTIL_JOBPOSITIONS_PKG;
/
