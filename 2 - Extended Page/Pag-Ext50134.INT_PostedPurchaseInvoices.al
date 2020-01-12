pageextension 50134 "INT_Posted Purchase Invoices" extends "Posted Purchase Invoices"
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
        addafter("No.")
        {
            field("INT_Posting Date21588"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
