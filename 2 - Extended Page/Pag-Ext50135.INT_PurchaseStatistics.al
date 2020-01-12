pageextension 50135 "INT_Purchase Statistics" extends "Purchase Statistics"
{
    layout
    {
        modify("TotalPurchLine.""Units per Parcel""")
        {
            Visible = false;
        }
        modify("TotalPurchLine.""Net Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine.""Gross Weight""")
        {
            Visible = false;
        }
        modify("TotalPurchLine.""Unit Volume""")
        {
            Visible = false;
        }
        modify(Amount)
        {
            Visible = false;
        }
        movefirst(General; TotalAmount1)
    }
    actions
    {
    }
}
