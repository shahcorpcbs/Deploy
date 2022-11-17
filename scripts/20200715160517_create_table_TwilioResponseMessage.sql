USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[TwilioResponseMessage](
    [Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [sid] [varchar](64) NOT NULL,
    [body] [varchar](64) NOT NULL,
    [dateSent] [datetime] NOT NULL,
    [errorCode] [int] NULL,
    [errorMessage] [varchar] (1046),
    [fromNumber] [varchar](16) NOT NULL,
    [createdDate] [datetime] NOT NULL
)
GO