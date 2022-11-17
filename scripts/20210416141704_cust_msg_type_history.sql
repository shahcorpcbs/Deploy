-- // cust msg type history
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[CustAlertHistory]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [queryId] [bigint] NOT NULL,
    [EmployeeId] int not null default 0,
    [SentTime] [datetime] NOT NULL,
    [SmsCnt] [int] NOT NULL,
    [EmailCnt] [int] NOT NULL
)
GO


-- //@UNDO
-- SQL to undo the change goes here.
drop table CustAlertHistory
GO

