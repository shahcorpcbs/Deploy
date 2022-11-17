-- // add useLotsForAssembly
-- Migration SQL that makes the change goes here.
IF NOT EXISTS (
        SELECT * FROM SYSCOLUMNS WHERE NAME = 'UseLotsForAssembly' AND
                ID=OBJECT_ID(N'[DBO].[MISCSETUP]'))
    BEGIN
        ALTER TABLE MISCSETUP WITH NOCHECK ADD
            [UseLotsForAssembly] [BIT] NOT NULL
                DEFAULT 0 WITH VALUES
    END
GO


-- //@UNDO
-- SQL to undo the change goes here.


