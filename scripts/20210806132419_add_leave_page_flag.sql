-- // add leave page flag
-- Migration SQL that makes the change goes here.
USE SHAHCORP
if not exists(select * from INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_NAME = 'MiscSetup'
                AND COLUMN_NAME = 'leaveCustPage')
    BEGIN
        alter table MiscSetup add leaveCustPage int not null default 0
    END

GO

-- //@UNDO
-- SQL to undo the change goes here.


