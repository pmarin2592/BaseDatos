/* Formatted on 7/27/2024 6:15:34 PM (QP5 v5.388) */
CREATE OR REPLACE TRIGGER LANGUAGEREQUIREMENTS_TR
    AFTER DELETE OR INSERT OR UPDATE
    ON LANGUAGEREQUIREMENTS_TB
    REFERENCING NEW AS New OLD AS Old
    FOR EACH ROW
DECLARE
    V_NEW_DATA   VARCHAR2 (4000);
    V_OLD_DATA   VARCHAR2 (4000);
    V_DLL        VARCHAR2 (100);
/******************************************************************************
   NAME:       LANGUAGEREQUIREMENTS_TR
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        7/28/2024      PMARIN       1. Created this trigger.

******************************************************************************/

BEGIN
    IF INSERTING
    THEN
        V_DLL := 'INSERT';
        V_NEW_DATA :=
               'LanguageID : '
            || :New.LanguageID
            || ' PositionID: '
            || :New.PositionID
            ||   'LevelID : '
            || :New.LevelID;


        V_OLD_DATA := NULL;
    ELSIF UPDATING
    THEN
        V_DLL := 'UPDATE';
        V_NEW_DATA :=
               'LanguageID : '
            || :New.LanguageID
            || ' PositionID: '
            || :New.PositionID
            ||   'LevelID : '
            || :New.LevelID;
        V_OLD_DATA :=
               'LanguageID : '
            || :OLD.LanguageID
            || ' PositionID: '
            || :OLD.PositionID
            ||   'LevelID : '
            || :OLD.LevelID;
    ELSIF DELETING
    THEN
        V_DLL := 'DELETE';
        V_NEW_DATA := NULL;
        V_OLD_DATA :=
              'LanguageID : '
            || :OLD.LanguageID
            || ' PositionID: '
            || :OLD.PositionID
            ||   'LevelID : '
            || :OLD.LevelID;
    END IF;

    INSERT_LOGTABLES_PR ('LANGUAGEREQUIREMENTS_TB',
                         V_DLL,
                         V_OLD_DATA,
                         V_NEW_DATA,
                         USER);
EXCEPTION
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RAISE;
END LANGUAGEREQUIREMENTS_TR;