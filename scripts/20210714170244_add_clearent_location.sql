-- // add clearent location
-- Migration SQL that makes the change goes here.
SET IDENTITY_INSERT [CBSServicesIP] ON
INSERT INTO [dbo].[CBSServicesIP] (Id, Description, Location)
VALUES (3, 'Clearent Service', ':8002/rest/clearent/');

SET IDENTITY_INSERT [CBSServicesIP] OFF
GO

-- //@UNDO
-- SQL to undo the change goes here.
delete CBSServicesIP where id = 3
GO

