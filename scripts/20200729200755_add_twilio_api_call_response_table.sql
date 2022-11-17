-- // add twilio api call response table
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[TwilioApiCallResponse]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [TwilioCallId] [bigint]      NOT NULL,
    [CustomerSequenceNumber] [bigint] NOT NULL,
    [sid]          [varchar](64) NOT NULL,
    [status]   [varchar](16) NOT NULL,
    [errorCode]    [int],
    [errorMessage] [varchar](1046),
    [createdDate]  [datetime] NOT NULL,
    [updatedDate]  [datetime] NOT NULL
)
GO
-- //@UNDO
-- SQL to undo the change goes here.
