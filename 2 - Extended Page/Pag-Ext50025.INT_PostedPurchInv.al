pageextension 50025 "INT_Posted Purch Inv" extends "Posted Purchase Invoice"
{
    layout
    {
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
        modify("No. Printed")
        {
            Visible = false;
        }
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
        modify(Cancelled)
        {
            Visible = false;
        }
        modify(Corrective)
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
        modify("Ship-to City")
        {
            Visible = false;
        }
        modify("Ship-to Post Code")
        {
            Visible = false;
        }
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        addbefore("Invoice Details")
        {
            group("INT_Interface Bank")
            {
                Caption = 'Interface Bank';
                field("INT_Interface One Time"; "INT_Interface One Time")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("INT_Bank Product Code"; "INT_Bank Product Code")
                {
                    Editable = false;
                }
                field("INT_Cheque Delivery Method"; "INT_Cheque Delivery Method")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("INT_Receiving Bank Code"; "INT_Receiving Bank Code")
                {
                    Editable = false;
                }
                field("INT_Receiving Branch Code"; "INT_Receiving Branch Code")
                {
                    Editable = false;
                }
                field("INT_Payee Charge Code"; "INT_Payee Charge Code")
                {
                    Editable = false;
                }
                field("INT_Beneficiary Account No."; "INT_Beneficiary Account No.")
                {
                    Editable = false;
                }
                field("INT_Type of Tax"; "INT_Type of Tax")
                {
                    Editable = false;
                }
                field("INT_Bank Key"; "INT_Bank Key")
                {
                    Editable = false;
                }
                field("INT_Name of Bank"; "INT_Name of Bank")
                {
                    Editable = false;
                }
                field("INT_Acct holder"; "INT_Acct holder")
                {
                    Editable = false;
                }
                field("INT_ID No."; "INT_ID No.")
                {
                    Editable = false;
                }
            }
        }
        addafter("Pre-Assigned No.")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = true;
                Style = Unfavorable;

                trigger OnValidate()
                begin
                    Clear(VendLedgEntry);
                    VendLedgEntry.SetCurrentKey("Document No.");
                    VendLedgEntry.SetRange("Document No.", "No.");
                    if VendLedgEntry.FindLast then begin
                        VendLedgEntry.Description := "Posting Description";
                        VendLedgEntry.Modify;
                    end;

                    Clear(GLEntry);
                    GLEntry.SetCurrentKey("Document No.");
                    GLEntry.SetRange("Document Type", GLEntry."Document Type"::Invoice);
                    GLEntry.SetRange("Document No.", "No.");
                    if GLEntry.FindLast then begin
                        GLEntry.Description := "Posting Description";
                        GLEntry.Modify;
                    end;
                end;

            }
        }
    }

    actions
    {
        addfirst(Reporting)
        {
            action("INT_Print Report")
            {
                Caption = 'Print';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin

                    Clear(GLEntry);
                    GLEntry.SetCurrentKey("Entry No.");
                    GLEntry.SetRange("Document No.", Rec."No.");
                    if GLEntry.FindFirst() then;
                    Report.RunModal(50001, TRUE, FALSE, GLEntry);
                end;

            }
        }
        modify("Update Document")
        {
            Visible = false;
            Promoted = false;
        }
        modify(CreateCreditMemo)
        {
            Visible = false;
            Promoted = false;
        }
        modify(CorrectInvoice)
        {
            Visible = false;
            Promoted = false;
        }
        modify(CancelInvoice)
        {
            Visible = false;
            Promoted = false;
        }

        modify(Print)
        {
            Visible = false;
            Promoted = false;
        }
    }


    var

        GLEntry: Record "G/L Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
}