pageextension 50201 "INT_PurchaseInvoice" extends "Purchase Invoice"
{

    layout
    {
        modify("Buy-from Vendor Name")
        {
            Editable = false;
        }
        addafter("Buy-from Vendor Name")
        {
            /*field("INT_Buy-from Vendor Name"; "Buy-from Vendor Name")
            {
                ApplicationArea = All;
            }*/
            field("INT_Buy-from Vendor Name 2"; "Buy-from Vendor Name 2")
            {
                Caption = 'Vendor Name 2';
                //Editable = false;
                ApplicationArea = All;
            }
        }
        addafter("INT_Buy-from Vendor Name 2")
        {
            field("INT_AV Edit Vendor Name"; "INT_AV Edit Vendor Name")
            {

            }
        }
        addafter("Order Address Code")
        {
            field("INT_Posting No. Series"; "Posting No. Series")
            {
                ApplicationArea = All;
            }
        }
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
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
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("On Hold")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        /*modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }*/
        moveafter("Buy-from Contact"; "AVF_VAT Registration No.")
        moveafter("AVF_VAT Registration No."; "AVF_Vendor Branch No.")
        modify("Due Date")
        {
            trigger OnAfterValidate()
            begin
                if "Due Date" < WorkDate then
                    Error('Due Date must more than Current Date!');
            end;
        }
        addafter("Due Date")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
        moveafter(Status; "Assigned User ID")
        modify("Assigned User ID")
        {
            Editable = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        //moveafter("Vendor Invoice No."; "Shortcut Dimension 1 Code")
        modify("Transaction Specification")
        {
            Visible = false;
        }
        modify("Transaction Type")
        {
            Visible = false;
        }
        modify("Transport Method")
        {
            Visible = false;
        }
        modify("Entry Point")
        {
            Visible = false;
        }
        modify("Area")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        addafter("AVF_Vendor Branch No.")
        {
            field("INT_Vendor Posting Group"; "Vendor Posting Group")
            {
                Editable = true;
            }
        }
        addbefore("Invoice Details")
        {
            group("INT_Interface Bank")
            {
                Caption = 'Interface Bank';
                field("INT_Interface One Time"; "INT_Interface One Time")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("INT_Bank Product Code"; "INT_Bank Product Code")
                {
                    Editable = true;
                }
                field("INT_Cheque Delivery Method"; "INT_Cheque Delivery Method")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("INT_Receiving Bank Code"; "INT_Receiving Bank Code")
                {
                    Editable = true;
                }
                field("INT_Receiving Branch Code"; "INT_Receiving Branch Code")
                {
                    Editable = true;
                }
                field("INT_Payee Charge Code"; "INT_Payee Charge Code")
                {
                    Editable = true;
                }
                field("INT_Beneficiary Account No."; "INT_Beneficiary Account No.")
                {
                    Editable = true;
                }
                field("INT_Type of Tax"; "INT_Type of Tax")
                {
                    Editable = true;
                }
                field("INT_Bank Key"; "INT_Bank Key")
                {
                    Editable = true;
                }
                field("INT_Name of Bank"; "INT_Name of Bank")
                {
                    Editable = true;
                }
                field("INT_Acct holder"; "INT_Acct holder")
                {
                    Editable = true;
                }
                field("INT_ID No."; "INT_ID No.")
                {
                    Editable = true;
                }
            }
        }
        moveafter("Vendor Invoice No."; "Shortcut Dimension 2 Code")
        addafter("Shortcut Dimension 2 Code")
        {
            field("INT_Posting No."; "Posting No.")
            {
                ApplicationArea = All;
            }
        }


    }

    actions
    {
        modify(PostAndPrint)
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
            Visible = false;
        }
        modify(Approvals)
        {
            Promoted = false;
        }
        modify(IncomingDocCard)
        {
            Promoted = false;
        }
        modify(SelectIncomingDoc)
        {
            Promoted = false;
        }
        modify(IncomingDocAttachFile)
        {
            Promoted = false;
        }
        modify(RemoveIncomingDoc)
        {
            Promoted = false;
        }
        modify("F&unctions")
        {
            Visible = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify("P&osting")
        {
            Visible = false;
        }
        modify("&Invoice")
        {
            Visible = false;
        }
        modify("Re&lease")
        {
            trigger OnAfterAction()
            begin
                TestField("INT_Cheque Delivery Method");
            end;
        }
        modify(Post)
        {
            trigger OnAfterAction()
            begin
                TestField("INT_Cheque Delivery Method");
            end;
        }

    }




    var
        myInt: Integer;
}