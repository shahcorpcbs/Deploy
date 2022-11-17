-- // move alert to event type
-- Migration SQL that makes the change goes here.
update QueryAlert set TriggerType = 3 where id in (-12, -2)
GO

INSERT INTO EmployeeFunction (Location, Action, Name, Description) VALUES
('/setup/qaMessageSetup.asp', '', 'Messaging Set Up::Edit Query Setup and Text', '')
GO

-- //@UNDO
-- SQL to undo the change goes here.


