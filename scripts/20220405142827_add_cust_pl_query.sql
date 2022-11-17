-- // add cust pl query
-- Migration SQL that makes the change goes here.
insert into UserQuery (Name, Query) values ('Customer PriceList', 'select firstname, lastname, pl.name PriceList from Customer c, Pricelist pl where c.defaultPriceListID = pl.priceListID and
c.defaultpricelistid = @Price_List:pricelist order by pl.name, lastName')
GO

-- //@UNDO
-- SQL to undo the change goes here.
delete UserQuery where name = 'Customer PriceList'
GO

