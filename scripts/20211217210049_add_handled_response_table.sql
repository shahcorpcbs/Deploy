-- // add handled response table
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[SmsIgnoreMsg]
(
    [Id]           [smallint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [Message] [varchar](100) NOT NULL,
    [StartsWith] bit not null default 0,
    [Includes] bit not null default 0
)
GO

INSERT INTO [dbo].[SmsIgnoreMsg] (Message)
VALUES ('thanks');
INSERT INTO [dbo].[SmsIgnoreMsg] (Message)
VALUES ('thank you');
INSERT INTO [dbo].[SmsIgnoreMsg] (Message)
VALUES ('thank u');
INSERT INTO [dbo].[SmsIgnoreMsg] (Message)
VALUES ('ok');
INSERT INTO [dbo].[SmsIgnoreMsg] (Message)
VALUES ('ok thanks');
INSERT INTO [dbo].[SmsIgnoreMsg] (Message)
VALUES ('I''m Driving - Sent from MY CAR');
INSERT INTO [dbo].[SmsIgnoreMsg] (Message, Includes)
VALUES ('no text is worth a life', 1);

GO

-- //@UNDO
-- SQL to undo the change goes here.

drop table SmsIgnoreMsg
GO
