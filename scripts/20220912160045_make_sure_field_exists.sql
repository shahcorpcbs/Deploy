-- // make sure field exists
-- Migration SQL that makes the change goes here.
IF NOT EXISTS (
        SELECT * FROM SYSCOLUMNS WHERE NAME = 'WantsTextAlerts' AND
                ID=OBJECT_ID(N'[DBO].[Customer]'))
    BEGIN
        ALTER TABLE Customer WITH NOCHECK ADD
            [WantsTextAlerts] [BIT] NOT NULL
                DEFAULT 1 WITH VALUES
    END
GO


-- //@UNDO
-- SQL to undo the change goes here.


