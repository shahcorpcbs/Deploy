-- // add interval variable
-- Migration SQL that makes the change goes here.
insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue)
    values (-3, 'Send every x days', 'interval', 3);
insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue)
    values (-4, 'Send every x days', 'interval', 3);
GO


-- //@UNDO
-- SQL to undo the change goes here.
delete QueryAlertVariable where VariableField = 'interval'
GO
