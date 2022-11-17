-- // update services table
-- Migration SQL that makes the change goes here.
alter table MiscSetup add cbsServicePort smallint not null default 8410;
GO

alter table MiscSetup add tookanAgentId smallint default 0;
GO

alter table MiscSetup add useSSLEmail bit not null default 0;
GO

alter table CBSServicesIP add active bit not null default 0;
GO


update CBSServicesIP set Location = '/rest/twilio/' where id = 1;
delete CBSServicesIP where id = 2;
update CBSServicesIP set Location = '/rest/clearent/' where id = 3;
GO


SET IDENTITY_INSERT [CBSServicesIP] ON
INSERT INTO [dbo].[CBSServicesIP] (Id, Description, Location, Active)
VALUES (2, 'CBS Printing Service', '/rest/cbs2_printer/print/', 1);

INSERT INTO [dbo].[CBSServicesIP] (Id, Description, Location, Active)
VALUES (4, 'CBS Delivery Service', '', 0);

INSERT INTO [dbo].[CBSServicesIP] (Id, Description, Location, Active)
VALUES (5, 'CBS Device Service', '', 0);

SET IDENTITY_INSERT [CBSServicesIP] OFF
GO

-- //@UNDO
-- SQL to undo the change goes here.
update CBSServicesIP set Location = ':8024/rest/twilio/' where id = 1;
update CBSServicesIP set Location = ':8303/rest/cbs2_printer/print/' where id = 2;
update CBSServicesIP set Location = ':8002/rest/clearent/' where id = 3;

GO

