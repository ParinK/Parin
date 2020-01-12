pageextension 50110 "INT_Posted Sales Invoices" extends "Posted Sales Invoices"
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
        addafter("Currency Code")
        {
            field("INT_External Document No.72273"; "External Document No.")
            {
                ApplicationArea = All;
            }
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
        modify("Currency Code")
        {
            Visible = false;
        }
        addfirst(Control1)
        {
            field("INT_Posting Date37178"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
        modify(Closed)
        {
            Width = 8;
        }
    }
    actions
    {
    }
}
