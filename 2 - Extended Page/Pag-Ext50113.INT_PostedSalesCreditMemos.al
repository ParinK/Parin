pageextension 50113 "INT_Posted Sales Credit Memos" extends "Posted Sales Credit Memos"
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
        addafter("Currency Code")
        {
            field("INT_External Document No."; "External Document No.")
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
            field("INT_Posting Date52345"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(SendCustom)
        {
            Promoted = false;
            Visible = false;
        }
        modify("&Print")
        {
            Promoted = false;
            Visible = false;
        }
        modify("Send by &Email")
        {
            Visible = false;
        }
        modify(ActivityLog)
        {
            Visible = false;
        }
        modify(IncomingDoc)
        {
            Promoted = false;
        }
    }
}
