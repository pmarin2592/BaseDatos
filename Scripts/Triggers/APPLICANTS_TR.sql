/* Formatted on 7/27/2024 6:15:34 PM (QP5 v5.388) */
CREATE OR REPLACE TRIGGER APPLICANTS_TR
    AFTER DELETE OR INSERT OR UPDATE
    ON APPLICANTS_TB
    REFERENCING NEW AS New OLD AS Old
    FOR EACH ROW
DECLARE
    V_NEW_DATA   VARCHAR2 (4000);
    V_OLD_DATA   VARCHAR2 (4000);
    V_DLL        VARCHAR2 (100);
/******************************************************************************
   NAME:       APPLICANTSKILLS_TR
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        7/27/2024      PMARIN       1. Created this trigger.

******************************************************************************/

BEGIN
    IF INSERTING
    THEN
        V_DLL := 'INSERT';
        V_NEW_DATA :=
               'APPLICANTID: '
            || :New.APPLICANTID
            || ' IDNUMBER: '
            || :New.IDNUMBER
            || ' FIRSTNAME: '
            || :New.FIRSTNAME
            || ' LASTNAME: '
            || :NEW.LASTNAME
            || ' EMAIL: '
            || :NEW.EMAIL
            || ' PHONE: '
            || :NEW.PHONE
            || 'YEARSOFEXPERIENCE: '
            || :NEW.YEARSOFEXPERIENCE;

        V_OLD_DATA := NULL;
    ELSIF UPDATING
    THEN
        V_DLL := 'UPDATE';
        V_NEW_DATA :=
                'APPLICANTID: '
            || :New.APPLICANTID
            || ' IDNUMBER: '
            || :New.IDNUMBER
            || ' FIRSTNAME: '
            || :New.FIRSTNAME
            || ' LASTNAME: '
            || :NEW.LASTNAME
            || ' EMAIL: '
            || :NEW.EMAIL
            || ' PHONE: '
            || :NEW.PHONE
            || 'YEARSOFEXPERIENCE: '
            || :NEW.YEARSOFEXPERIENCE;
        V_OLD_DATA :=
               'APPLICANTID: '
            || :OLD.APPLICANTID
            || ' IDNUMBER: '
            || :OLD.IDNUMBER
            || ' FIRSTNAME: '
            || :OLD.FIRSTNAME
            || ' LASTNAME: '
            || :OLD.LASTNAME
            || ' EMAIL: '
            || :OLD.EMAIL
            || ' PHONE: '
            || :OLD.PHONE
            || 'YEARSOFEXPERIENCE: '
            || :OLD.YEARSOFEXPERIENCE;
    ELSIF DELETING
    THEN
        V_DLL := 'DELETE';
        V_NEW_DATA := NULL;
        V_OLD_DATA :=
               'APPLICANTID: '
            || :OLD.APPLICANTID
            || ' IDNUMBER: '
            || :OLD.IDNUMBER
            || ' FIRSTNAME: '
            || :OLD.FIRSTNAME
            || ' LASTNAME: '
            || :OLD.LASTNAME
            || ' EMAIL: '
            || :OLD.EMAIL
            || ' PHONE: '
            || :OLD.PHONE
            || 'YEARSOFEXPERIENCE: '
            || :OLD.YEARSOFEXPERIENCE;
    END IF;

    INSERT_LOGTABLES_PR ('APPLICANTS_TB',
                         V_DLL,
                         V_OLD_DATA,
                         V_NEW_DATA,
                         USER);
EXCEPTION
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RAISE;
END APPLICANTS_TR;