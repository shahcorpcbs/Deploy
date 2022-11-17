-- // add global descriptors
-- Migration SQL that makes the change goes here.
alter table ItemDescriptorPrice drop constraint FK_ItemUpchargePrice_PriceListItem
GO

alter table PriceListItem add useGlobalDescr bit not null default 0
GO

-- //@UNDO
-- SQL to undo the change goes here.


