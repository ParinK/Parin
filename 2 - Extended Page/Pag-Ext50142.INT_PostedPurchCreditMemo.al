pageextension 50142 "INT_Posted Purch Credit Memo" extends "Posted Purchase Credit Memo"
{
    layout
    {

        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify(Corrective)
        {
            Visible = false;
        }
        modify(Cancelled)
        {
            Visible = false;
        }
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Pre-Assigned No.")
        {
            Visible = false;
        }
        moveafter("Buy-from Contact"; "Document Date")
        addafter("Posting Date")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Buy-from Contact"; "AVF_VAT Registration No.")
        moveafter("AVF_VAT Registration No."; "AVF_Vendor Branch No.")
        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        moveafter("Vendor Cr. Memo No."; "Shortcut Dimension 1 Code")
        moveafter("No. Printed"; "FNGN002_Assigned User ID")
    }



    actions
    {
        modify(Approvals)
        {
            Promoted = false;
        }
        modify(IncomingDocument)
        {
            Visible = false;
        }
        modify("&Cr. Memo")
        {
            Visible = false;
        }
        modify("&Print")
        {
            Visible = false;
            Promoted = false;
        }
        addbefore("&Navigate")
        {
            action("INT_Purchase Journal Voucher")
            {
                Caption = 'Purchase Journal Voucher';
                Visible = true;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    Clear(GLEntry);
                    GLEntry.SetCurrentKey("Document No.");
                    GLEntry.SetRange("Document No.", Rec."No.");
                    if GLEntry.FindFirst() then;
                    Report.RunModal(50001, TRUE, FALSE, GLEntry);
                end;
            }
        }
    }
    var
        GLEntry: Record "G/L Entry";
}
