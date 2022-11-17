-- // add message history
-- Migration SQL that makes the change goes here.
USE [shahcorp];

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[SMSMessageHistory]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [TwilioResponseMessageId] [bigint] NOT NULL,
    [EmployeeId] [bigint] not null,
    [DateChanged] [datetime] NOT NULL,
    [Status] [smallint] not null
)
GO

-- //@UNDO
-- SQL to undo the change goes here.

