-- // add message types
-- Migration SQL that makes the change goes here.

alter table QueryAlert add groupType smallint not null default 0;
GO

update QueryAlert set groupType = 1 where id in (-2, -3, -4, -8, -9)
GO

update QueryAlert set groupType = 2 where id in (-6, -7)
GO

update QueryAlert set groupType = 3 where id in (-5, -1)
GO

update QueryAlert set name = 'Order Delivered' where id = -1
GO

update QueryAlert set Name = 'Order Ready' where id = -2
GO

update QueryAlert set Name = 'Order Drop Off Claim Receipt' where id = -8
GO

update QueryAlert set Name = 'Skip/Delivery Reminder' where id = -5
GO

-- //@UNDO
-- SQL to undo the change goes here.


