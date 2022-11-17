USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[TwilioSendSmsApiCall](
	[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Invoker] [varchar](1024) NULL,
	[RequestDate] [datetime] NULL,
	[CustomerId] [bigint] NULL,
	[PhoneNumber] [varchar](16) NULL,
	[Message] [text] NULL,
	[Successful] [bit] NULL,
	[TwilioErrorCode] [int] NULL,
	[ErrorMessage] [varchar] (1046)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO