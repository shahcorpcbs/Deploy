-- // forward alerts tables
-- Migration SQL that makes the change goes here.
USE [shahcorp];
alter table Employee add Phone varchar(10);
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[EmployeeMessageSetup]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [EmployeeId] [bigint] NOT NULL,
    [MessageId] [bigint] NULL,
    [QueryId] [bigint] NULL,
    [Sms] [smallint] NOT NULL default 0,
    [Email] [smallint] NOT NULL default 0

)
GO

--alter table MiscSetup drop column ForwardSmsPhoneNumber;
--GO
--alter table MiscSetup drop column ForwardUnknownSmsMessages;
--GO

-- //@UNDO
-- SQL to undo the change goes here.
