-- // add transactionId to timeoutTable
-- Migration SQL that makes the change goes here.
alter table CardTimeout add TransactionId varchar(40) null;
GO


-- //@UNDO
-- SQL to undo the change goes here.


