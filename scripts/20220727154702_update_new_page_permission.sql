-- // update price editor permission
-- Migration SQL that makes the change goes here.
update EmployeeFunction set Location ='/setup/PricingEditorNew.asp' where Name = 'Setup::Pricing Editor'
update EmployeeFunction set Location ='/setup/ShahNewFormEditor.asp' where Name = 'Setup::Form Editor'
GO

-- //@UNDO
-- SQL to undo the change goes here.
update EmployeeFunction set Location ='/setup/PricingEditor.asp' where Name = 'Setup::Pricing Editor'
update EmployeeFunction set Location ='/setup/ShahFormEditor.asp' where Name = 'Setup::Form Editor'
GO

