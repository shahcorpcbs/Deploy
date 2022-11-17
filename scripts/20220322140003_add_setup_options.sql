-- // add setup options
-- Migration SQL that makes the change goes here.
--alter table MiscSetup add promptAfterCCUpdate bit not null DEFAULT 0
IF NOT EXISTS (
        SELECT * FROM SYSCOLUMNS WHERE NAME = 'Allowance' AND
                ID=OBJECT_ID(N'[DBO.Customer]'))
    BEGIN
        ALTER TABLE CUSTOMER WITH NOCHECK ADD
            [Allowance] [MONEY] NOT NULL
                DEFAULT 0 WITH VALUES
    END
GO


alter table MiscSetup add updateAllQuickItems bit not null DEFAULT 1
GO

alter table MiscSetup add useAllowance bit not null DEFAULT 0
GO

-- //@UNDO
-- SQL to undo the change goes here.


