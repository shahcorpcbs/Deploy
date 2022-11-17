-- // update query variables
-- Migration SQL that makes the change goes here.
ALTER TABLE QueryAlertVariable ALTER COLUMN VariableDesc VARCHAR (25)
GO

update QueryAlertVariable set VariableDesc = 'Order x Days and Older' where VariableDesc = 'Days To Go Back'
GO


-- //@UNDO
-- SQL to undo the change goes here.


