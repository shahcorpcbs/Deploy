-- // split ticket fix
-- Migration SQL that makes the change goes here.
update Department set maxItemsInReceipt = null where maxItemsInReceipt = 0
GO


-- //@UNDO
-- SQL to undo the change goes here.


