/* Formatted on 7/28/2024 1:13:24 AM (QP5 v5.388) */
CREATE OR REPLACE TRIGGER WORKEXPERIENCE_TR
    AFTER DELETE OR INSERT OR UPDATE
    ON WORKEXPERIENCE_TB
    REFERENCING NEW AS New OLD AS Old
    FOR EACH ROW
DECLARE
    V_NEW_DATA   VARCHAR2 (4000);
    V_OLD_DATA   VARCHAR2 (4000);
    V_DLL        VARCHAR2 (100);
/******************************************************************************
   NAME:       TITLES_TR
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
               'ExperienceID : '
            || :New.ExperienceID
            || ' ApplicantID: '
            || :New.ApplicantID
            || 'StartDate : '
            || :New.StartDate
            || ' EndDate: '
            || :New.EndDate
            || 'CurrentlyEmployed : '
            || :New.CurrentlyEmployed
            || ' PositionTitle: '
            || :New.PositionTitle
            || 'DescriptionWork : '
            || :New.DescriptionWork
            || ' ReasonForLeaving: '
            || :New.ReasonForLeaving
            || 'ReferenceName : '
            || :New.ReferenceName
            || ' ReferencePhone: '
            || :New.ReferencePhone
            || ' ReferenceEmail: '
            || :New.ReferenceEmail;


        V_OLD_DATA := NULL;
    ELSIF UPDATING
    THEN
        V_DLL := 'UPDATE';
        V_NEW_DATA :=
               'ExperienceID : '
            || :New.ExperienceID
            || ' ApplicantID: '
            || :New.ApplicantID
            || 'StartDate : '
            || :New.StartDate
            || ' EndDate: '
            || :New.EndDate
            || 'CurrentlyEmployed : '
            || :New.CurrentlyEmployed
            || ' PositionTitle: '
            || :New.PositionTitle
            || 'DescriptionWork : '
            || :New.DescriptionWork
            || ' ReasonForLeaving: '
            || :New.ReasonForLeaving
            || 'ReferenceName : '
            || :New.ReferenceName
            || ' ReferencePhone: '
            || :New.ReferencePhone
            || ' ReferenceEmail: '
            || :New.ReferenceEmail;



        V_OLD_DATA :=
               'ExperienceID : '
            || :OLD.ExperienceID
            || ' ApplicantID: '
            || :OLD.ApplicantID
            || 'StartDate : '
            || :OLD.StartDate
            || ' EndDate: '
            || :OLD.EndDate
            || 'CurrentlyEmployed : '
            || :OLD.CurrentlyEmployed
            || ' PositionTitle: '
            || :OLD.PositionTitle
            || 'DescriptionWork : '
            || :OLD.DescriptionWork
            || ' ReasonForLeaving: '
            || :OLD.ReasonForLeaving
            || 'ReferenceName : '
            || :OLD.ReferenceName
            || ' ReferencePhone: '
            || :OLD.ReferencePhone
            || ' ReferenceEmail: '
            || :OLD.ReferenceEmail;
    ELSIF DELETING
    THEN
        V_DLL := 'DELETE';
        V_NEW_DATA := NULL;
        V_OLD_DATA :=
               'ExperienceID : '
            || :OLD.ExperienceID
            || ' ApplicantID: '
            || :OLD.ApplicantID
            || 'StartDate : '
            || :OLD.StartDate
            || ' EndDate: '
            || :OLD.EndDate
            || 'CurrentlyEmployed : '
            || :OLD.CurrentlyEmployed
            || ' PositionTitle: '
            || :OLD.PositionTitle
            || 'DescriptionWork : '
            || :OLD.DescriptionWork
            || ' ReasonForLeaving: '
            || :OLD.ReasonForLeaving
            || 'ReferenceName : '
            || :OLD.ReferenceName
            || ' ReferencePhone: '
            || :OLD.ReferencePhone
            || ' ReferenceEmail: '
            || :OLD.ReferenceEmail;
    END IF;

    INSERT_LOGTABLES_PR ('WORKEXPERIENCE_TB',
                         V_DLL,
                         V_OLD_DATA,
                         V_NEW_DATA,
                         USER);
EXCEPTION
    WHEN OTHERS
    THEN
        -- Consider logging the error and then re-raise
        RAISE;
END WORKEXPERIENCE_TR;