-- // add route holiday table
-- Migration SQL that makes the change goes here.
USE [shahcorp];

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[RouteHoliday]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [storeID] [int] NOT NULL,
    [firstDay] [datetime] NOT NULL,
    [duration] [smallint] NOT NULL
)
GO


-- //@UNDO
-- SQL to undo the change goes here.
drop table RouteHoliday
GO

