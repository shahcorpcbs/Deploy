USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[QueryAlert](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] VARCHAR(100)  NOT NULL,
[Query] VARCHAR(2056)  NOT NULL,
[SmsMessageId] [bigint] NOT NULL,
[TriggerType] [smallint] NOT NULL default 1,
[Frequency] [smallint] NOT NULL
);
GO