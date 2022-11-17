USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[AlertMessagesSent](
    [Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CustomerSequenceNumber] [bigint] NOT NULL,
	[MessageTypeId] [bigint] NOT NULL,
	[TookanApiCallId] [bigint] NULL,
	[RackAssignmentId] [bigint] NULL
);
GO