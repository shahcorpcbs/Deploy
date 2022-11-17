USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[SmsMessage](
    [Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Message] [text] Null,
    [Description] [varchar](1024) NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
INSERT INTO [dbo].[SmsMessage] (Message, Description) VALUES ('This is the default message.', 'Default generic message.');
GO