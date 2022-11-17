-- // ensure printer tables
-- Migration SQL that makes the change goes here.
USE [shahcorp];
IF NOT EXISTS(
        SELECT * FROM SYSCOLUMNS WHERE NAME = 'isDemandPrinter' and
                ID=OBJECT_ID(N'[DBO].[printer]'))
    BEGIN
        alter table printer add isDemandPrinter bit not null default 0
    END
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PrinterModifier]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
    BEGIN
        CREATE TABLE [dbo].[PrinterModifier](
                                                [PrinterModifierID] [int] IDENTITY(1,1) NOT NULL,
                                                [PrinterID] [int] NOT NULL,
                                                [TriggerSource] [varchar](12) NOT NULL,
                                                [TriggerCriteria] [varchar](3) NOT NULL DEFAULT ('eq'),
                                                [TriggerValue] [varchar](100) NOT NULL,
                                                [TargetField] [varchar](12) NOT NULL,
                                                [TargetValue] [varchar](100) NOT NULL
        ) ON [PRIMARY]
    END

GO



-- //@UNDO
-- SQL to undo the change goes here.


