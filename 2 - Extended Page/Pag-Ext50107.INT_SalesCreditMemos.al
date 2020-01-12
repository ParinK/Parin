pageextension 50107 "INT_Sales Credit Memos" extends "Sales Credit Memos"
{
    layout
    {
        moveafter("Sell-to Customer Name"; "Sell-to Contact")
        modify("Posting Date")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Due Date")
        {
            Visible = false;
        }
        addafter("External Document No.")
        {
            field("INT_Posting Description46403"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
        addafter("No.")
        {
            field("INT_Document Date18109"; "Document Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
