pageextension 50156 "INT_Post Sales Credit Memo" extends "Posted Sales Credit Memo"
{
    layout
    {
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
        modify("Salesperson Code")
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
        modify("No. Printed")
        {
            Visible = false;
        }
        modify("Work Description")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        modify("EU 3-Party Trade")
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
        movebefore("AVF_VAT Registration No."; "Shortcut Dimension 2 Code")

    }

    actions
    {
        modify(SendCustom)
        {
            Visible = false;
        }
        modify("Send by &Email")
        {
            Visible = false;
        }
        modify(Print)
        {
            Visible = false;
        }
        addfirst(Reporting)
        {
            action("INT_Sales Credit Note")
            {
                Caption = 'Sales Credit Note';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin
                    Clear(SalesCrHeadTB);
                    SalesCrHeadTB.SetCurrentKey("No.");
                    SalesCrHeadTB.SetRange("No.", Rec."No.");
                    if SalesCrHeadTB.FindFirst() then;
                    Report.RunModal(50049, TRUE, FALSE, SalesCrHeadTB);
                end;
            }
            action("INT_Sales Journal Voucher")
            {
                Caption = 'Sales Journal Voucher';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin
                    Clear(GLEntryTB);
                    GLEntryTB.SetCurrentKey("Entry No.");
                    GLEntryTB.SetRange(GLEntryTB."Document No.", Rec."No.");
                    if GLEntryTB.FindFirst() then;
                    Report.RunModal(50002, TRUE, FALSE, GLEntryTB);
                end;
            }
        }
    }

    var
        SalesCrHeadTB: Record "Sales Cr.Memo Header";
        GLEntryTB: Record "G/L Entry";
}