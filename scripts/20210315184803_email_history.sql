-- // email history
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[EmailHistory]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [CustomerId] [bigint] NULL,
    [EmployeeId] int not null default 0,
    [EmailAddress] [varchar](64) NOT NULL,
    [Text] [varchar](1024) NOT NULL,
    [SentTime] [datetime] NOT NULL
)
GO


-- //@UNDO
-- SQL to undo the change goes here.


