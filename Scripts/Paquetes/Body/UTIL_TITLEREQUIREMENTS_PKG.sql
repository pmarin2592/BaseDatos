/* Formatted on 7/26/2024 2:38:14 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE BODY UTIL_TITLEREQUIREMENTS_PKG
AS
    /******************************************************************************
           NAME:       UTIL_TITLEREQUIREMENTS_PKG
           PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                    TITLEREQUIREMENTS_TB

           REVISIONS:
           Ver        Date        Author           Description
           ---------  ----------  ---------------  ------------------------------------
           1.0        7/25/2024      PMARIN       1. Created this package body.
        ******************************************************************************/

    PROCEDURE INSERT_TITLEREQUIREMENTS_PR (P_TITLEID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_DESIRABLE    IN     NUMBER,
                                           P_ERROR           OUT VARCHAR)
    IS
      
    BEGIN
        
        INSERT INTO TITLEREQUIREMENTS_TB (TITLEID, POSITIONID, DESIRABLE)
             VALUES (P_TITLEID, P_POSITIONID, P_DESIRABLE);
        
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX
        THEN
            P_ERROR := 'ERROR, THE TITLEREQUIREMENTS ALREADY EXISTS';
            ROLLBACK;
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE UPDATE_TITLEREQUIREMENTS_PR (P_TITLEID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_DESIRABLE    IN     NUMBER,
                                           P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        UPDATE TITLEREQUIREMENTS_TB
           SET DESIRABLE = P_DESIRABLE
         WHERE TITLEID = P_TITLEID AND POSITIONID = P_POSITIONID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_TITLEREQUIREMENTS_PR (P_TITLEID      IN     NUMBER,
                                           P_POSITIONID   IN     NUMBER,
                                           P_ERROR           OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM TITLEREQUIREMENTS_TB
              WHERE TITLEID = P_TITLEID AND POSITIONID = P_POSITIONID;
              COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_TITLEREQUIREMENTS_PR (P_CURSOR   OUT REF_CURSOR,
                                           P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT TITLEID, POSITIONID, DESIRABLE FROM TITLEREQUIREMENTS_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
    END;
END UTIL_TITLEREQUIREMENTS_PKG;
/
