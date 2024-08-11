/* Formatted on 8/11/2024 1:19:31 AM (QP5 v5.388) */
DECLARE
    -- Declaración de una variable de tipo cursor
    CURSOR_VAR              SYS_REFCURSOR;
    -- Declaración de una variable para manejar posibles errores
    ERROR_VAR               VARCHAR2 (4000);
    -- Variables para almacenar los datos devueltos por el cursor
    V_POSITIONTITLE                  VARCHAR (100);
    V_COUNT_APPLICANT              NUMBER;  
    
BEGIN
    -- Llamada al procedimiento que abre el cursor
    UTIL_JOBPOSITIONS_PKG.REPORT_JOBPOSITIONS_PR (P_CURSOR   => CURSOR_VAR,
                                              P_ERROR    => ERROR_VAR);

    -- Verificar si hubo un error
    IF ERROR_VAR IS NOT NULL
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error: ' || ERROR_VAR);
    END IF;

    -- Recuperar los datos del cursor
    LOOP
        FETCH CURSOR_VAR
            INTO V_POSITIONTITLE,
                 V_COUNT_APPLICANT
                 ;

        EXIT WHEN CURSOR_VAR%NOTFOUND;

        -- Procesar los datos obtenidos
 
        DBMS_OUTPUT.PUT_LINE ('POSITION TITLE: ' || V_POSITIONTITLE);
        DBMS_OUTPUT.PUT_LINE ('COUNT_APPLICANT: ' || V_COUNT_APPLICANT);
        
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
