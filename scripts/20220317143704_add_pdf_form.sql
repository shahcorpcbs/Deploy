-- // add pdf form
-- Migration SQL that makes the change goes here.
insert into form (formName, storeId, formLayout, type)

values ('Invoice PDF', 1,
        '<p style="text-align: center; "><b><span style="font-size: 24px;">Invoice Details</span></b><br></p><br><div>@@@CLN, @@@CFN</div><div>@@@CPHONE<br><br>@@@TNUM&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>Items: @@@ITEMCOUNT<br></div><div>_________________________________</div><div>@@@GDWU</div><div>_________________________________<br><br><br></div>
<table style="width: 50%">
<tbody>
<tr><td>Subtotal:</td><td style="text-align:right; min-width:50%">@@@TOTMTS</td></tr>
<tr><td>Tax:</td><td style="text-align:right; min-width:50%">@@@TAXTOT</td></tr>
<tr><td>State Fee:</td><td style="text-align:right; min-width:50%">@@@SC1</td></tr>
<tr><td>Total:</td><td style="text-align:right; min-width:50%">@@@TOTAL</td></tr>
<tr><td><br></td><td><br></td></tr>
<tr><td>Paid:</td><td style="text-align:right; min-width:50%">@@@TOTPAY</td></tr>
</tbody></table><div><br>[Laundry]Starch: @@@SPREF [/Laundry]</div><div>Finish: @@@FPREF</div><div>Employee: @@@EFN</div><div>Creation: @@@CREDATE</div><div>Ready On: @@@TICRDDOW@@@TICRDDATE</div><div>@@@TNOTES</div><div><br></div><div>Thank You For Your Business!</div>'
        ,'text/html'
        )
GO


-- //@UNDO
-- SQL to undo the change goes here.
delete form where formName = 'Invoice PDF'
GO

