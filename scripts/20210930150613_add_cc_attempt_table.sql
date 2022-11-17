-- // add cc attempt table
-- Migration SQL that makes the change goes here.
CREATE TABLE [dbo].[CardAttempt] (
    [Id] [bigint] IDENTITY(1, 1) NOT NULL,
    [EmployeeName] [varchar](30),
    [CustomerSequenceNumber] [int],
    [DateRequested] [smalldatetime] NOT NULL DEFAULT(getdate()),
    [Amount] [smallmoney],
    [OrderId] [varchar](200),
    [Finished] bit not null default 0,
    [apiKey] varchar(50),
    [TransactionId] varchar(40)
    ) ON [PRIMARY]

GO


-- //@UNDO
-- SQL to undo the change goes here.
drop table [dbo].[CardAttempt]
GO

