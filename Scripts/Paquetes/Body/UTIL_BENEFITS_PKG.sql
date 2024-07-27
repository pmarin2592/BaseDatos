/* Formatted on 7/26/2024 3:31:22 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_BENEFITS_PKG
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

    PROCEDURE INSERT_BENEFITS_PR (P_POSITIONID           IN     NUMBER,
                                  P_BENEFITDESCRIPTION   IN     VARCHAR,
                                  P_BENEFITID               OUT NUMBER,
                                  P_ERROR                   OUT VARCHAR)
    IS
        V_BENEFITID   NUMBER (18);
    BEGIN
        SELECT BENEFITS_SQ.NEXTVAL INTO V_BENEFITID FROM DUAL;

        INSERT INTO BENEFITS_TB (BENEFITID, POSITIONID, BENEFITDESCRIPTION)
             VALUES (V_BENEFITID, P_POSITIONID, P_BENEFITDESCRIPTION);

        P_BENEFITID := V_BENEFITID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE BENEFITS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_BENEFITS_PR (P_BENEFITID            IN     NUMBER,
                                  P_POSITIONID           IN     NUMBER,
                                  P_BENEFITDESCRIPTION   IN     VARCHAR,
                                  P_ERROR                   OUT VARCHAR)
    IS
    BEGIN
        UPDATE BENEFITS_TB
           SET BENEFITDESCRIPTION = P_BENEFITDESCRIPTION
         WHERE BENEFITID = P_BENEFITID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_BENEFITS_PR (P_BENEFITID    IN     NUMBER,
                                  P_POSITIONID   IN     NUMBER,
                                  P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM BENEFITS_TB
              WHERE BENEFITID = P_BENEFITID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_BENEFITS_PR (P_CURSOR   OUT REF_CURSOR,
                                  P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT BENEFITID, POSITIONID, BENEFITDESCRIPTION FROM BENEFITS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_BENEFITS_PKG;
/
