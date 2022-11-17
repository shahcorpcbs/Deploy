-- // add new flags
-- Migration SQL that makes the change goes here.
alter table MiscSetup add createCCBatchForDelivery bit not null default 0
GO
alter table MiscSetup add deliveryChoiceInv int not null default 0
GO
update MiscSetup set deliveryChoiceInv = onlyRacked
GO

alter table MiscSetup add useAdvDetailScreen bit not null default 0
GO

alter table MiscSetup add autoCreateDeliveryOnly bit not null default 0
GO

update CBSServicesIP set location = ':8002/rest/clearent/' where id = 3
GO

-- //@UNDO
-- SQL to undo the change goes here.


