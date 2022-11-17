-- // add api key
-- Migration SQL that makes the change goes here.
alter table CardTimeout add apiKey varchar(50) null;
GO

alter table CardReadError add apiKey varchar(50) null;
GO
-- //@UNDO
-- SQL to undo the change goes here.


