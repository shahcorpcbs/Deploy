-- // add setup fields
-- Migration SQL that makes the change goes here.
update Route set Route.StopNoticeSmsMessageId = 0, Route.DeliveryNoticeSmsMessageId = 0, SendAlerts = 0 where routeNumber = 0
GO

alter table MiscSetup add checkMsgsMinute int not null default 1
GO

alter table MiscSetup add sslEmail bit not null default 0
GO


-- //@UNDO
-- SQL to undo the change goes here.


