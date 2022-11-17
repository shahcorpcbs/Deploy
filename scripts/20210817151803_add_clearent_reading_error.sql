-- // add clearent reading error
-- Migration SQL that makes the change goes here.
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CardReadError]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
    BEGIN

        CREATE TABLE [dbo].[CardReadError] (
                                             [ID] [bigint] IDENTITY(1, 1) NOT NULL,
                                             [CardPaymentId] [bigint] NOT NULL,
                                             [OrderId] [varchar](100) NOT NULL,
                                             [Tickets] [varchar](100) NOT NULL,
                                             [DateRequested] [datetime] NOT NULL DEFAULT(getdate()),
                                             [DateChecked] [datetime],
                                             [ErrorMsg] [varchar](254) NOT NULL,
                                             [Handled] [bit] default 0 not null,
                                             [SearchAnswer] [varchar](2000)
        ) ON [PRIMARY]


    END
GO


-- //@UNDO
-- SQL to undo the change goes here.
drop table CardReadError
GO

