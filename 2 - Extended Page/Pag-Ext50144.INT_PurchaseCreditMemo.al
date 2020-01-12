pageextension 50144 "INT_Purchase Credit Memo" extends "Purchase Credit Memo"
{
    layout
    {
        /*addfirst(General)
        {
            field("INT_No."; "No.")
            {
                ApplicationArea = All;
            }
        }*/
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Vendor Authorization No.")
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
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        moveafter("Buy-from Contact"; "AVF_VAT Registration No.")
        modify("Applies-to ID")
        {
            Visible = false;
        }
        modify("Entry Point")
        {
            Visible = false;
        }
        modify("Transport Method")
        {
            Visible = false;
        }
        modify("Area")
        {
            Visible = false;
        }
        modify("Transaction Type")
        {
            Visible = false;
        }
        modify("Transaction Specification")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify("Payment Discount %")
        {
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Pay-to Contact No.")
        {
            Visible = false;
        }
        modify("Pay-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Pay-to City")
        {
            Visible = false;
        }
        modify("Pay-to Post Code")
        {
            Visible = false;
        }
        modify("Ship-to City")
        {
            Visible = false;
        }
        modify("Ship-to Post Code")
        {
            Visible = false;
        }

        moveafter("AVF_VAT Registration No."; "AVF_Vendor Branch No.")
        moveafter("AVF_Vendor Branch No."; "Document Date")
        addafter("AVF_Vendor Branch No.")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
        moveafter("Posting Description"; "Vendor Cr. Memo No.")
        addafter("Vendor Cr. Memo No.")
        {
            field("INT_Posting No. Series"; "Posting No. Series")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Vendor Cr. Memo No."; "Shortcut Dimension 1 Code")

        addafter("AVF_Vendor Branch No.")
        {
            field("INT_Vendor Posting Group"; "Vendor Posting Group")
            {
                Editable = true;
            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Editable = false;
        }

        addafter("INT_Posting No. Series")
        {
            field("INT_Posting No."; "Posting No.")
            {
                Editable = true;
            }
        }
        addafter("Buy-from Vendor No.")
        {
            field("INT_AV Edit Vendor Name"; "INT_AV Edit Vendor Name")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(GetPostedDocumentLinesToReverse)
        {
            Promoted = false;
        }
        modify(SendApprovalRequest)
        {
            Promoted = false;
        }
        modify(CancelApprovalRequest)
        {
            Promoted = false;
        }
        modify(SeeFlows)
        {
            Promoted = false;
        }
        modify(Approvals)
        {
            Promoted = false;
        }
        modify(PostAndPrint)
        {
            Promoted = false;
        }
        modify("P&osting")
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
        modify("&Credit Memo")
        {
            Visible = false;
        }
    }
}
