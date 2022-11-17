-- // update emp report desc
-- Migration SQL that makes the change goes here.

--Some old version had this incorrectly set, this should correct it going forward but can be removed once
--all the old install are corrected
update CBSServicesIP set location = ':8024/rest/twilio/'
GO


update EmployeeReportQuery set
 QueryDesc = 'Total number of invoices not finished over date range. Includes total number of pieces across all invoices.'
where id = 1

update EmployeeReportQuery set
    QueryDesc = 'Total value of all sales over given date range. Includes total number of pieces, invoices, customers.'
where id in (2, 3, 6)

update EmployeeReportQuery set
    QueryDesc = 'Total value of payments received over date range. Includes value of each payment type received. Omits types not received.'
where id in (4, 5, 7)

update EmployeeReportQuery set
    QueryDesc = 'Total number of pieces due per department over a given date range. Omits Departments with no pieces due.'
where id = 8

GO
-- //@UNDO
-- SQL to undo the change goes here.


