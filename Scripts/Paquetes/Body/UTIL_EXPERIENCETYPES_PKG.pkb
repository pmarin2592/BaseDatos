CREATE OR REPLACE PACKAGE BODY JOBHUNTINGDB.UTIL_EXPERIENCETYPES_PKG
AS
    /******************************************************************************
           NAME:       UTIL_EXPERIENCETYPES_PKG
           PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                    EXPERIENCETYPES_TB

           REVISIONS:
           Ver        Date        Author           Description
           ---------  ----------  ---------------  ------------------------------------
           1.0        7/25/2024      PMARIN       1. Created this package body.
        ******************************************************************************/

    PROCEDURE INSERT_EXPERIENCETYPES_PR (P_EXPERIENCETYPE   IN     VARCHAR2,
                                         P_TYPEID              OUT NUMBER,
                                         P_ERROR               OUT VARCHAR)
    IS
        V_TYPEID   NUMBER (18);
    BEGIN
        SELECT EXPERIENCETYPES_SQ.NEXTVAL INTO V_TYPEID FROM DUAL;

        INSERT INTO EXPERIENCETYPES_TB (TYPEID, EXPERIENCETYPE)
             VALUES (V_TYPEID, P_EXPERIENCETYPE);

        P_TYPEID := V_TYPEID;
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

    PROCEDURE UPDATE_EXPERIENCETYPES_PR (P_TYPEID           IN     NUMBER,
                                         P_EXPERIENCETYPE   IN     VARCHAR2,
                                         P_ERROR               OUT VARCHAR)
    IS
    BEGIN
        UPDATE EXPERIENCETYPES_TB
           SET EXPERIENCETYPE = P_EXPERIENCETYPE
         WHERE TYPEID = P_TYPEID;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE DELETE_EXPERIENCETYPES_PR (P_TYPEID   IN     NUMBER,
                                         P_ERROR       OUT VARCHAR)
    IS
    BEGIN
        DELETE FROM EXPERIENCETYPES_TB
              WHERE TYPEID = P_TYPEID;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            ROLLBACK;
    END;

    PROCEDURE SELECT_EXPERIENCETYPES_PR (P_CURSOR   OUT REF_CURSOR,
                                         P_ERROR    OUT VARCHAR)
    IS
    BEGIN
        OPEN P_CURSOR FOR
            SELECT TYPEID, EXPERIENCETYPE
              FROM JOBHUNTINGDB.EXPERIENCETYPES_TB;
    EXCEPTION
        WHEN OTHERS
        THEN
            P_ERROR := 'ERROR, ' || SQLERRM;
            
    END;
END UTIL_EXPERIENCETYPES_PKG;
/