-- // add use global surcharges
-- Migration SQL that makes the change goes here.
alter table PriceListItem add useGlobalSurcharge bit not null default 0
GO
alter table ItemDescriptorPrice add useGlobalSurcharge bit not null default 0
GO

-- //@UNDO
-- SQL to undo the change goes here.


