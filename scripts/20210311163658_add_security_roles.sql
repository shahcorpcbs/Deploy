-- // add security roles
-- Migration SQL that makes the change goes here.

INSERT INTO EmployeeFunction (Location, Action, Name, Description) VALUES
    ('/MainApp/editCustomerNotifications.asp', '', 'Edit Customer::Notifications', ''),
    ('/setup/EmployeeAlerts.asp', '', 'Employee Management::Edit Employee Notifications', ''),
    ('/setup/EmployeeReports.asp', '', 'Employee Management::Edit Employee Reports', ''),
    ('/setup/smsEmpReportQuerySetup.asp', '', 'Messaging Set Up::Edit Employee Queries', ''),
    ('/setup/smsMenu.asp', '', 'Messaging Set Up::Messaging Menu', ''),
    ('/setup/messageSetup.asp', '', 'Messaging Set Up::Edit Message Text', ''),
    ('/setup/smsQuerySetup.asp', '', 'Messaging Set Up::Edit Message Schedule', ''),
    ('/MainApp/smsHistory.asp', '', 'Tools Menu::View SMS History', ''),
    ('/MainApp/emailHistory.asp', '', 'Tools Menu::View Email History', ''),
    ('/MainApp/CustomerNotificationSetup.asp', '', 'Messaging Set Up::Customer Notification Setup', '')



GO
-- //@UNDO
-- SQL to undo the change goes here.

