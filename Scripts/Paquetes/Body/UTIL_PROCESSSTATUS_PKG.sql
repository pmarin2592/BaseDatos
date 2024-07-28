/* Formatted on 7/27/2024 1:06:31 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_PROCESSSTATUS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_PROCESSSTATUS_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                PROCESSSTATUS_TB

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/27/2024      NBRENES       1. Created this package.
    ******************************************************************************/

    PROCEDURE INSERT_PROCESSSTATUS_PR (P_STATUSPROCESS   IN     VARCHAR,
                                       P_STATUSID           OUT NUMBER,
                                       P_ERROR              OUT VARCHAR)
    IS
        V_STATUSID   NUMBER (18);
    BEGIN
        SELECT PROCESSSTATUS_SQ.NEXTVAL INTO V_STATUSID FROM DUAL;

        INSERT INTO PROCESSSTATUS_TB (STATUSID, STATUSPROCESS)
             VALUES (V_STATUSID, P_STATUSPROCESS);

        P_STATUSID := V_STATUSID;
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE PROCESSSTATUS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_PROCESSSTATUS_PR (P_STATUSPROCESS   IN     VARCHAR,
                                       P_STATUSID        IN     NUMBER,
                                       P_ERROR              OUT VARCHAR)
    IS
    BEGIN
        UPDATE PROCESSSTATUS_TB
           SET STATUSPROCESS = P_STATUSPROCESS
         WHERE STATUSID = P_STATUSID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_PROCESSSTATUS_PR (P_StatusID   IN     NUMBER,
                                       P_ERROR         OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM PROCESSSTATUS_TB
              WHERE STATUSID = P_STATUSID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_PROCESSSTATUS_PR (P_CURSOR   OUT REF_CURSOR,
                                       P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT STATUSID, STATUSPROCESS FROM PROCESSSTATUS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_PROCESSSTATUS_PKG;
/
