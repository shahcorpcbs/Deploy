-- // add heat seal range
-- Migration SQL that makes the change goes here.
alter table MiscSetup add healSealMinSize smallint not null DEFAULT 8
GO

alter table MiscSetup add healSealMaxSize smallint not null DEFAULT 8
GO

-- //@UNDO
-- SQL to undo the change goes here.


