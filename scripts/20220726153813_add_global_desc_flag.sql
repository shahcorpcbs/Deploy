-- // add global desc flag
-- Migration SQL that makes the change goes here.
ALTER TABLE ItemDescriptorPrice WITH NOCHECK ADD
    [isGlobal] [BIT] NOT NULL
        DEFAULT 0 WITH VALUES
GO

insert into ItemDescriptorPrice (priceListItemId, descriptorName, descriptorType, price, disabled, useGlobalTax, useGlobalDays, discountable, VIPDiscountable, VIPQualified, couponable, outsideService, prepaypercent, displaySequence, daysToProcess, imageFileName, notes, printNotes, useCounter, prepayDiscount, isGlobal)
    (select a.priceListItemId, b.descriptorName, b.descriptorType, b.price, b.disabled, b.useGlobalTax, b.useGlobalDays, b.discountable, b.VIPDiscountable, b.VIPQualified, b.couponable, b.outsideService, b.prepaypercent, b.displaySequence, b.daysToProcess, b.imageFileName, b.notes, b.printNotes, b.useCounter, b.prepayDiscount, 1
     from PriceListItem a, ItemDescriptorPrice b where b.priceListItemId = 0 and a.useGlobalDescr = 1 and a.itemName = 'Pants' and b.descriptorName not in (select descriptorName from ItemDescriptorPrice c where c.priceListItemId = a.priceListItemId and c.descriptorType = b.descriptorType))
GO


-- //@UNDO
-- SQL to undo the change goes here.


