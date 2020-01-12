pageextension 50146 "INT_Posted Purch Credit Memos" extends "Posted Purchase Credit Memos"
{
    layout
    {
        modify("Remaining Amount")
        {
            Visible = false;
        }
        modify(Paid)
        {
            Visible = false;
        }
        modify(Cancelled)
        {
            Visible = false;
        }
        modify(Corrective)
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("No. Printed")
        {
            Visible = false;
        }
        addafter("Buy-from Vendor Name")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
        addafter("Currency Code")
        {
            field("INT_Posting Date96525"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
