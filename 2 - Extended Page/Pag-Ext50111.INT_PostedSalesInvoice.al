pageextension 50111 "INT_Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        modify("Order No.")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Salesperson Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("No. Printed")
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
        modify("AVF_Customer Branch No.")
        {
            Importance = Standard;
        }
        modify("Sell-to City")
        {
            Visible = false;
        }
        modify("Sell-to Post Code")
        {
            Visible = false;
        }
        modify("Sell-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Sell-to Contact No.")
        {
            Visible = false;
        }
        modify("Sell-to Contact")
        {
            Visible = false;
        }
        moveafter("Sell-to"; "AVF_VAT Registration No.")
        moveafter("AVF_VAT Registration No."; "AVF_Customer Branch No.")
        modify("Sell-to Address")
        {
            Importance = Standard;
        }
        modify("Sell-to Address 2")
        {
            Importance = Standard;
        }
        modify("Document Date")
        {
            Importance = Standard;
        }
        moveafter("AVF_Customer Branch No."; "External Document No.")
        modify("Shipment Date")
        {
            Visible = false;
        }
        modify(SelectedPayments)
        {
            Visible = false;
        }
        modify("Payment Discount %")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Direct Debit Mandate ID")
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
        modify("Bill-to City")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Shipping Agent Code")
        {
            Visible = false;
        }
        modify("Package Tracking No.")
        {
            Visible = false;
        }
        modify("Ship-to City")
        {
            Visible = false;
        }
        modify("Ship-to County")
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
        modify("Bill-to Post Code")
        {
            Visible = false;
        }
        modify("Bill-to Country/Region Code")
        {
            Visible = false;
        }
        modify("AVF_Bill-to Address 3")
        {
            Importance = Additional;
        }
        modify("EU 3-Party Trade")
        {
            Visible = false;
        }
        modify("Transaction Specification")
        {
            Visible = false;
        }
        modify("Transport Method")
        {
            Visible = false;
        }
        modify("Exit Point")
        {
            Visible = false;
        }
        modify("Area")
        {
            Visible = false;
        }
        modify("Work Description")
        {
            Visible = false;
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
                    Clear(CustLedgEntry);
                    CustLedgEntry.SetCurrentKey("Document No.");
                    CustLedgEntry.SetRange("Document No.", "No.");
                    if CustLedgEntry.FindLast then begin
                        CustLedgEntry.Description := "Posting Description";
                        CustLedgEntry.Modify;
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
                Caption = 'Sales Journal Voucher';
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
                    Report.RunModal(50002, TRUE, FALSE, GLEntry);
                end;
            }
            action("INT_Invoice/Tax Invoice")
            {
                Caption = 'Invoice/Tax Invoice';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin
                    Clear(SalesInvHeadTB);
                    SalesInvHeadTB.SetCurrentKey("No.");
                    SalesInvHeadTB.SetRange("No.", Rec."No.");
                    if SalesInvHeadTB.FindFirst() then;
                    Report.RunModal(50006, TRUE, FALSE, SalesInvHeadTB);
                end;
            }
            action("INT_Invoice")
            {
                Caption = 'Invoice';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin
                    Clear(SalesInvHeadTB);
                    SalesInvHeadTB.SetCurrentKey("No.");
                    SalesInvHeadTB.SetRange("No.", Rec."No.");
                    if SalesInvHeadTB.FindFirst() then;
                    Report.RunModal(50050, TRUE, FALSE, SalesInvHeadTB);
                end;
            }
            action("INT_Sales Debit Note")
            {
                Caption = 'Sales Debit Note';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin
                    Clear(SalesInvHeadTB);
                    SalesInvHeadTB.SetCurrentKey("No.");
                    SalesInvHeadTB.SetRange("No.", Rec."No.");
                    if SalesInvHeadTB.FindFirst() then;
                    Report.RunModal(50060, TRUE, FALSE, SalesInvHeadTB);
                end;
            }
        }
        modify(DMAR_SalesJnlVoucher)
        {
            Visible = false;
        }
        modify(SendCustom)
        {
            Promoted = false;
            Visible = false;
        }
        modify(Email)
        {
            Promoted = false;
            Visible = false;
        }
        modify(Print)
        {
            Promoted = false;
            Visible = false;
        }
        modify(IncomingDocument)
        {
            Visible = false;
        }
        modify(Correct)
        {
            Visible = false;
        }
        modify("DMAR_Sales Tax Invoice Report")
        {
            Promoted = false;
        }
        modify(DMAR_SalesDebitNote)
        {
            Visible = false;
            Promoted = false;
            //PromotedCategory = Category4;
            //PromotedOnly = true;
        }
        modify(ActivityLog)
        {
            Visible = false;
        }
        modify(CreateCreditMemo)
        {
            Promoted = false;
        }
        modify(CancelInvoice)
        {
            Promoted = false;
        }
        modify(CorrectInvoice)
        {
            Promoted = false;
        }
        modify(ChangePaymentService)
        {
            Promoted = false;
            Visible = false;
        }
        modify(Approvals)
        {
            Promoted = false;
            Visible = false;
        }
    }
    var
        GLEntry: Record "G/L Entry";
        SalesInvHeadTB: Record "Sales Invoice Header";
        CustLedgEntry: Record "Cust. Ledger Entry";
}
