/* Formatted on 7/26/2024 12:27:36 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_SKILLS_PKG
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

    PROCEDURE INSERT_SKILLS_PR (P_SKILL              IN     VARCHAR2,
                                P_DESCRIPTIONSKILL   IN     VARCHAR2,
                                P_SKILLID               OUT NUMBER,
                                P_ERROR                 OUT VARCHAR)
    IS
        V_SKILLID   NUMBER (18);
    BEGIN
        SELECT SKILLS_SQ.NEXTVAL INTO V_SKILLID FROM DUAL;

        INSERT INTO SKILLS_TB (SKILLID, SKILL, DESCRIPTIONSKILL)
             VALUES (V_SKILLID, P_SKILL, P_DESCRIPTIONSKILL);


        P_SKILLID := V_SKILLID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE EXPERIENCETYPES ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_SKILLS_PR (P_SKILLID            IN     NUMBER,
                                P_SKILL              IN     VARCHAR2,
                                P_DESCRIPTIONSKILL   IN     VARCHAR2,
                                P_ERROR                 OUT VARCHAR)
    IS
    BEGIN
        UPDATE SKILLS_TB
           SET SKILL = P_SKILL, DESCRIPTIONSKILL = P_DESCRIPTIONSKILL
         WHERE SKILLID = P_SKILLID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_SKILLS_PR (P_SKILLID IN NUMBER, P_ERROR OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM SKILLS_TB
              WHERE SKILLID = P_SKILLID;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_SKILLS_PR (P_CURSOR OUT REF_CURSOR, P_ERROR OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT SKILLID, SKILL, DESCRIPTIONSKILL FROM SKILLS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_SKILLS_PKG;
/
