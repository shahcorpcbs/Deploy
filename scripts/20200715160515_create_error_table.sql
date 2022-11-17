USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[ExternalAppErrorMessage](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[ExceptionDate] [datetime] NOT NULL,
[ExceptionSource] [smallint] NOT NULL,
[ExceptionType] [smallint] NOT NULL,
[Message] [text] NOT NULL,
[Note] [text] NULL,
[CustomerSequenceNumber] [bigint] NULL,
[TwilioCallId] [bigint] NULL,
[TookanCallId] [bigint] NULL,
[ScamperCallId] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO