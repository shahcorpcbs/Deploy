-- // services table
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[CBSServicesIP]
(
    [Id]           [smallint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [Description] [varchar](1024) NOT NULL,
    [Location] [varchar](1024) NOT NULL,
)
GO

SET IDENTITY_INSERT [CBSServicesIP] ON
INSERT INTO [dbo].[CBSServicesIP] (Id, Description, Location)
VALUES (1, 'CBS Messenger Service', ':8024/rest/twilio/');

SET IDENTITY_INSERT [CBSServicesIP] OFF
GO


-- //@UNDO
-- SQL to undo the change goes here.

