/* Formatted on 8/11/2024 1:19:31 AM (QP5 v5.388) */
DECLARE
    -- Declaración de una variable de tipo cursor
    CURSOR_VAR              SYS_REFCURSOR;
    -- Declaración de una variable para manejar posibles errores
    ERROR_VAR               VARCHAR2 (4000);
    -- Variables para almacenar los datos devueltos por el cursor
    V_NAME                  VARCHAR (100);
    V_IDNUMBER              NUMBER;
    V_EMAIL                 VARCHAR2 (100);
    V_YEARS_OF_EXPERIENCE   NUMBER;
    V_TITLE_JOB             VARCHAR2 (200);
BEGIN
    -- Llamada al procedimiento que abre el cursor
    UTIL_Applicants_PKG.REPORT_Applicants_PR (P_CURSOR   => CURSOR_VAR,
                                              P_ERROR    => ERROR_VAR);

    -- Verificar si hubo un error
    IF ERROR_VAR IS NOT NULL
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error: ' || ERROR_VAR);
    END IF;

    -- Recuperar los datos del cursor
    LOOP
        FETCH CURSOR_VAR
            INTO V_NAME,
                 V_IDNUMBER,
                 V_EMAIL,
                 V_YEARS_OF_EXPERIENCE,
                 V_TITLE_JOB;

        EXIT WHEN CURSOR_VAR%NOTFOUND;

        -- Procesar los datos obtenidos
 
        DBMS_OUTPUT.PUT_LINE ('NAME: ' || V_NAME);
        DBMS_OUTPUT.PUT_LINE ('IDNUMBER: ' || V_IDNUMBER);
        DBMS_OUTPUT.PUT_LINE ('EMAIL: ' || V_EMAIL);
        DBMS_OUTPUT.PUT_LINE (
            'YEARS_OF_EXPERIENCE: ' || V_YEARS_OF_EXPERIENCE);
        DBMS_OUTPUT.PUT_LINE ('TITLE_JOB: ' || V_TITLE_JOB);
        DBMS_OUTPUT.PUT_LINE (CHR(10));
    END LOOP;

    -- Cerrar el cursor
    CLOSE CURSOR_VAR;
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Se produjo un error: ' || SQLERRM);

        IF CURSOR_VAR%ISOPEN
        THEN
            CLOSE CURSOR_VAR;
        END IF;
END;
/
