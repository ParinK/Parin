pageextension 50104 "INT_Sales Inv List" extends "Sales Invoice List"
{
    layout
    {
        modify("Posting Date")
        {
            Visible = false;
        }
        modify("Due Date")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        moveafter("Sell-to Customer Name"; "Sell-to Contact")
        addafter("No.")
        {
            field("INT_Document Date69498"; "Document Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("External Document No.")
        {
            field("INT_Posting Description69417"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
