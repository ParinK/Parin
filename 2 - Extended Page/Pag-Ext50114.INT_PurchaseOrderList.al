pageextension 50114 "INT_Purchase Order List" extends "Purchase Order List"
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
        modify("Amount Including VAT")
        {
            Visible = false;
        }
        moveafter(Amount; "Assigned User ID")
        moveafter(Amount; Status)
        addafter("Buy-from Vendor Name")
        {
            field("INT_Posting Description88052"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
        moveafter("No."; "Document Date")
    }
    actions
    {
        modify(Release)
        {
            Promoted = false;
        }
        modify(Reopen)
        {
            Promoted = false;
        }
        modify(Post)
        {
            Promoted = false;
        }
        modify(PostAndPrint)
        {
            Promoted = false;
        }
        modify(Preview)
        {
            Promoted = false;
        }
        modify(PostBatch)
        {
            Promoted = false;
        }
        modify("P&osting")
        {
            Visible = false;
        }
        modify(Action12)
        {
            Visible = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify("F&unctions")
        {
            Visible = false;
        }
        modify(Action10)
        {
            Visible = false;
        }
        modify(Action9)
        {
            Visible = false;
        }
        modify(Documents)
        {
            Visible = false;
        }
        modify(Warehouse)
        {
            Visible = false;
        }
        modify("O&rder")
        {
            Visible = false;
        }
        modify(Send)
        {
            Promoted = false;
        }
        modify(Print)
        {
            Promoted = false;
        }
        modify(Receipts)
        {
            Promoted = false;
        }
        modify(PostedPurchaseInvoices)
        {
            Promoted = false;
        }
        modify(Approvals)
        {
            Promoted = false;
        }
        modify(Dimensions)
        {
            Promoted = false;
        }
    }
}
