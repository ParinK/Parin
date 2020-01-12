pageextension 50143 "INT_Purchase Credit Memos" extends "Purchase Credit Memos"
{
    layout
    {
        modify("Vendor Authorization No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        moveafter(Amount; "Assigned User ID")
        modify("Due Date")
        {
            Visible = false;
        }
        addafter(Amount)
        {
            field("INT_Posting Date98181"; "Posting Date")
            {
                ApplicationArea = All;
            }
            field("INT_Status87043"; Status)
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
        modify(Approvals)
        {
            Promoted = false;
        }
        modify(PostAndPrint)
        {
            Promoted = false;
        }
        modify(PostBatch)
        {
            Promoted = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify("P&osting")
        {
            Visible = false;
        }
        modify("&Credit Memo")
        {
            Visible = false;
        }
    }
}
