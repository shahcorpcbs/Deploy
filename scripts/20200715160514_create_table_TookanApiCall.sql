USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[TookanApiCall](
	[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Endpoint] [varchar](64) NULL,
	[RequestDate] [datetime] NULL,
	[RequestJson] [text] NULL,
	[ResponseJson] [text] NULL,
	[StatusCode] [int] NULL,
	[HttpMethod] [varchar](4) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
