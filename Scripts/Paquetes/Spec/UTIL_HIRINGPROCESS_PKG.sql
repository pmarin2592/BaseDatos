/* Formatted on 7/27/2024 1:20:16 PM (QP5 v5.388) */
CREATE OR REPLACE PACKAGE UTIL_HIRINGPROCESS_PKG
AS
    /******************************************************************************
       NAME:       UTIL_HiringProcess_PKG
       PURPOSE: Paquete que contiene los metodos insert,update, delete,select de la tabla
                HiringProcess_tb

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        7/26/2024      NBRENES       1. Created this package.
    ******************************************************************************/
    TYPE REF_CURSOR IS REF CURSOR;

    PROCEDURE INSERT_HIRINGPROCESS_PR (P_APPLICANTID       IN     NUMBER,
                                       P_STATUSID          IN     NUMBER,
                                       P_APPLICATIONDATE   IN     DATE,
                                       P_COMPLETIONDATE    IN     DATE,
                                       P_HIRED             IN     NUMBER,
                                       P_PROCESSID            OUT NUMBER,
                                       P_ERROR                OUT VARCHAR);

    PROCEDURE UPDATE_HIRINGPROCESS_PR (P_APPLICANTID       IN     NUMBER,
                                       P_STATUSID          IN     NUMBER,
                                       P_APPLICATIONDATE   IN     DATE,
                                       P_COMPLETIONDATE    IN     DATE,
                                       P_HIRED             IN     NUMBER,
                                       P_PROCESSID         IN     NUMBER,
                                       P_ERROR                OUT VARCHAR);

    PROCEDURE DELETE_HIRINGPROCESS_PR (P_PROCESSID   IN     NUMBER,
                                       P_ERROR          OUT VARCHAR);

    PROCEDURE SELECT_HIRINGPROCESS_PR (P_CURSOR   OUT REF_CURSOR,
                                       P_ERROR    OUT VARCHAR);
END UTIL_HIRINGPROCESS_PKG;
/
