pageextension 50141 "INT_Vendor Card" extends "Vendor Card"
{
    layout
    {
        modify("Document Sending Profile")
        {
            Visible = false;
        }
        modify("IC Partner Code")
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
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify(City)
        {
            Visible = false;
        }
        modify("Post Code")
        {
            Visible = false;
        }
        modify("Primary Contact No.")
        {
            Visible = false;
        }
        modify("Our Account No.")
        {
            Visible = false;
        }
        modify("Language Code")
        {
            Visible = false;
        }
        modify(GLN)
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
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify("Prepayment %")
        {
            Visible = false;
        }
        modify("Application Method")
        {
            Visible = false;
        }
        modify(Priority)
        {
            Visible = false;
        }
        modify("Block Payment Tolerance")
        {
            Visible = false;
        }
        modify("Preferred Bank Account Code")
        {
            Visible = false;
        }
        modify("Cash Flow Payment Terms Code")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Customized Calendar")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        addafter("Privacy Blocked")
        {
            field("INT_AVF_Vendor Branch No.77091"; "AVF_Vendor Branch No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("FNGN002_Created by")
        {
            field("INT_Remark"; INT_Remark)
            {
                ApplicationArea = all;
                Editable = true;
                Caption = 'Remark';
            }
        }
        addafter(Blocked)
        {
            field("INT_Block Comment"; "INT_Block Comment")
            {
                ApplicationArea = all;
                Editable = true;
                Caption = 'Block Comment';
            }
        }

        modify("AVF_Vendor Branch No.")
        {
            Visible = false;
        }

        modify("VAT Registration No.")
        {
            Visible = false;
        }

        addafter("INT_Block Comment")
        {
            field("INT_VAT Registration No."; "VAT Registration No.")
            {
                Caption = 'VAT Registration No.';
                ApplicationArea = all;
            }
        }

        //moveafter("AVF_Vendor Branch No."; "AVF_VAT Registration No.")
        moveafter("FNGN002_Created Date"; "Last Date Modified")
        modify(Receiving)
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        addafter("Phone No.")
        {
            field("INT_E-Mail Tmp"; "INT_E-Mail Tmp")
            {
                Caption = 'E-mail';
            }
        }
        modify("E-Mail")
        {
            Visible = false;
        }

    }
    actions
    {
        modify(SendApprovalRequest)
        {
            Promoted = false;
        }
        modify(SeeFlows)
        {
            Promoted = false;
        }
        modify(CancelApprovalRequest)
        {
            Promoted = false;
        }
        modify(Quotes)
        {
            Promoted = false;
        }
        modify("Return Orders")
        {
            Promoted = false;
        }
        modify(ApprovalEntries)
        {
            Promoted = false;
        }
        modify("Cross References")
        {
            Promoted = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify(NewBlanketPurchaseOrder)
        {
            Visible = false;
        }
        modify(NewPurchaseQuote)
        {
            Visible = false;
        }
        modify(NewPurchaseReturnOrder)
        {
            Visible = false;
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "VAT Bus. Posting Group" := 'HEADOFFICE';
        if NoSeriesTB.Get("No. Series") then
            "Vendor Posting Group" := NoSeriesTB."INT_Vend Posting Group";
    end;

    var
        NoSeriesTB: Record "No. Series";
}
