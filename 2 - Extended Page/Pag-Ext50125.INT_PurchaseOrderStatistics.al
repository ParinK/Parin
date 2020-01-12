pageextension 50125 "INT_Purchase Order Statistics" extends "Purchase Order Statistics"
{
    layout
    {
        modify("Vend.""Balance (LCY)""")
        {
            Visible = false;
        }
        modify(PrepmtTotalAmount)
        {
            Visible = false;
        }
        modify(PrepmtVATAmount)
        {
            Visible = false;
        }
        modify(PrepmtTotalAmount2)
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Prepmt. Amt. Inv.""")
        {
            Visible = false;
        }
        modify(PrepmtInvPct)
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Prepmt Amt Deducted""")
        {
            Visible = false;
        }
        modify(PrepmtDeductedPct)
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Prepmt Amt to Deduct""")
        {
            Visible = false;
        }
        modify("TempVATAmountLine4.COUNT")
        {
            Visible = false;
        }
        modify(Vendor)
        {
            CaptionML = ENU = '';
        }
        modify(Prepayment)
        {
            CaptionML = ENU = '';
        }
        modify("TotalPurchLine[3].""Units per Parcel""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[3].""Net Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[3].""Gross Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[3].""Unit Volume""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[2].""Units per Parcel""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[2].""Net Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[2].""Gross Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[2].""Unit Volume""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Units per Parcel""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Net Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Gross Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine[1].""Unit Volume""")
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
