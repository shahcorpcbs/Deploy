-- // void table
-- Migration SQL that makes the change goes here.
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CardVoid]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
    BEGIN

        CREATE TABLE [dbo].[CardVoid] (
                                          [CardVoidID] [bigint] IDENTITY(1, 1) NOT NULL,
                                          [CardPaymentId] [int] NOT NULL,
                                          [TerminalID] [int],
                                          [Clerk] [int],
                                          [CustomerSequenceNumber] [int],
                                          [DateRequested] [smalldatetime] NOT NULL DEFAULT(getdate()),
                                          [Success] [int],
                                          [Amount] [smallmoney],
                                          [RawAnswer] [varchar](2000)
        ) ON [PRIMARY]


    END
GO


IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE NAME = 'Reversed' and ID=OBJECT_ID(N'[dbo].[CardPayment]'))
    BEGIN
        ALTER TABLE dbo.CardPayment
            ADD Reversed bit default 0 not null;
    END
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CardTimeout]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
    BEGIN

        CREATE TABLE [dbo].[CardTimeout] (
                                             [CardTimeoutID] [bigint] IDENTITY(1, 1) NOT NULL,
                                             [OrderId] [varchar](100) NOT NULL,
                                             [DateRequested] [datetime] NOT NULL DEFAULT(getdate()),
                                             [DateChecked] [datetime],
                                             [Handled] [bit] default 0 not null,
                                             [Reversed] [bit] default 0 not null,
                                             [SearchAnswer] [varchar](2000),
                                             [VoidAnswer] [varchar](2000)
        ) ON [PRIMARY]


    END
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE NAME = 'Reversed' and ID=OBJECT_ID(N'[dbo].[Payment]'))
    BEGIN
        ALTER TABLE dbo.Payment
            ADD Reversed bit default 0 not null;
    END
GO


-- //@UNDO
-- SQL to undo the change goes here.


