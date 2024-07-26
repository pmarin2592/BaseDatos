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

    PROCEDURE INSERT_JOBPOSITIONS_PR (P_PositionTitle       IN     VARCHAR2,
                                      P_COMPANYID         IN     NUMBER,
                                      P_DescriptionJob      IN     VARCHAR2,
                                      P_Salary              IN     NUMBER,
                                      P_SalaryVisible       IN     NUMBER,
                                      P_StartDate           IN     DATE,
                                      P_EndDate             IN     DATE,
                                      P_YearsOfExperience   IN     NUMBER,
                                      P_ExperienceTypeID    IN     NUMBER,
                                      P_PositionID             OUT NUMBER,
                                      P_ERROR                OUT VARCHAR);

    PROCEDURE UPDATE_JOBPOSITIONS_PR (P_PositionID          IN     NUMBER,
                                      P_PositionTitle       IN     VARCHAR2,
                                      P_COMPANYID         IN     NUMBER,
                                      P_DescriptionJob      IN     VARCHAR2,
                                      P_Salary              IN     NUMBER,
                                      P_SalaryVisible       IN     NUMBER,
                                      P_StartDate           IN     DATE,
                                      P_EndDate             IN     DATE,
                                      P_YearsOfExperience   IN     NUMBER,
                                      P_ExperienceTypeID    IN     NUMBER,
                                      P_ACTIVE            IN     NUMBER,
                                      P_ERROR                OUT VARCHAR);

    PROCEDURE DELETE_JOBPOSITIONS_PR (P_PositionID   IN     NUMBER,
                                      P_ERROR         OUT VARCHAR);

    PROCEDURE SELECT_JOBPOSITIONS_PR (P_CURSOR   OUT REF_CURSOR,
                                      P_ERROR    OUT VARCHAR);
END UTIL_JOBPOSITIONS_PKG;
/