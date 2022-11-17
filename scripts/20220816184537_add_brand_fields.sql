-- // add brand line item type
-- Migration SQL that makes the change goes here.
IF NOT EXISTS (SELECT * FROM TicketLineTypeDomain WHERE ticketLineType = 'BR')
    BEGIN
        insert into TicketLineTypeDomain (ticketLineType, ticketLineTypeName, lineMult) values ('BR', 'Brand', 1)
    END
GO

alter table MiscSetup add forceBrands bit not null DEFAULT 0
GO

alter table MiscSetup add addBrandsOnDI bit not null DEFAULT 0
GO

alter table MiscSetup add useOverlayDesc bit not null DEFAULT 1
GO

-- //@UNDO
-- SQL to undo the change goes here.


