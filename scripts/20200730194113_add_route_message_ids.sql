-- // add route message ids
-- Migration SQL that makes the change goes here.
alter table Route add StopNoticeSmsMessageId int not null default 4;
GO
alter table Route add DeliveryNoticeSmsMessageId int not null default 5;
GO

update Route set Route.StopNoticeSmsMessageId = 4, Route.DeliveryNoticeSmsMessageId = 5 where routeNumber != 0
GO

update Route set Route.StopNoticeSmsMessageId = 0, Route.DeliveryNoticeSmsMessageId = 0, SendAlerts = 0 where routeNumber = 0
GO

-- //@UNDO
-- SQL to undo the change goes here.

