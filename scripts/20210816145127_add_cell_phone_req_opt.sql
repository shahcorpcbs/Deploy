-- // add cell phone req opt
-- Migration SQL that makes the change goes here.
insert into RequiredCustomerFields(storeID, fieldName, required) (select distinct storeId, 'cellPhone', 0 from RequiredCustomerFields)
GO


-- //@UNDO
-- SQL to undo the change goes here.
delete RequiredCustomerFields where fieldName = 'cellPhone'
GO

