-- // message query variables
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[QueryAlertVariable]
(
    [Id] [bigint] NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [QueryId] [bigint] NULL,
    [VariableDesc] [varchar](20) NOT NULL,
    [VariableField] [varchar](20) NOT NULL,
    [VariableValue] [varchar](20) NOT NULL
)
GO

insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue) values (-3, 'Days To Go Back', 'days', 14);
insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue) values (-4, 'Days To Go Back', 'days', 30);

insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue) (select id, 'Number of Times', 'times', 50
    from QueryAlert where Name = 'Pickup after x times');
GO

-- //@UNDO
-- SQL to undo the change goes here.


