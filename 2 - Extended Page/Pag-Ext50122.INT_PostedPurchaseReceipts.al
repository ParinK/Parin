pageextension 50122 "INT_Posted Purchase Receipts" extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("INT_Order No."; "Order No.")
            {
                ApplicationArea = All;
            }
            field("INT_Vendor Order No."; "Vendor Order No.")
            {
                ApplicationArea = All;
            }
            field("INT_Requested Receipt Date"; "Requested Receipt Date")
            {
                ApplicationArea = All;
            }
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
            }
            field("INT_FNGN002_Assigned User ID"; "FNGN002_Assigned User ID")
            {
                ApplicationArea = All;
            }
        }
        modify("Location Code")
        {
            Visible = false;
        }
        addafter("No.")
        {
            field("INT_Posting Date33009"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
