-- // update cc receipt notification name
-- Migration SQL that makes the change goes here.
update QueryAlert set Name = 'Credit Card Receipt' where id = -8
GO


-- //@UNDO
-- SQL to undo the change goes here.


