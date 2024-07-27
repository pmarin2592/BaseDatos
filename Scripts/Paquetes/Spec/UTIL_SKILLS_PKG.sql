/* Formatted on 7/26/2024 12:15:53 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_SKILLS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_SKILLS_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                SKILLS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      PMARIN       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_SKILLS_PR (P_SKILL              IN     VARCHAR2,
                                P_DESCRIPTIONSKILL   IN     VARCHAR2,
                                P_SKILLID               OUT NUMBER,
                                P_ERROR                 OUT VARCHAR);

    PROCEDURE UPDATE_SKILLS_PR (P_SKILLID            IN     NUMBER,
                                P_SKILL              IN     VARCHAR2,
                                P_DESCRIPTIONSKILL   IN     VARCHAR2,
                                P_ERROR                 OUT VARCHAR);

    PROCEDURE DELETE_SKILLS_PR (P_SKILLID IN NUMBER, P_ERROR OUT VARCHAR);

    PROCEDURE SELECT_SKILLS_PR (P_CURSOR OUT REF_CURSOR, P_ERROR OUT VARCHAR);
END UTIL_SKILLS_PKG;
/
