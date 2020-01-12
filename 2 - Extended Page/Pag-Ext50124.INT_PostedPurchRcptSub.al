pageextension 50124 "INT_Posted Purch Rcpt. Sub" extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        moveafter("Unit of Measure Code"; "Location Code")
        modify("Planned Receipt Date")
        {
            Visible = false;
        }
        addafter("Expected Receipt Date")
        {
            field("INT_Requested Receipt Date63046"; "Requested Receipt Date")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Quantity Invoiced"; "Order Date")
    }
    actions
    {
        //group("INT_F&unctions")
        //{
        addafter("&Undo Receipt")
        {
            action("&Undo Receipt (G/L)")
            {
                ApplicationArea = Suite;
                Caption = '&Undo Receipt (G/L)';
                Image = Undo;
                ToolTip = 'Cancel the quantity posting on the selected posted receipt line. A corrective line is inserted under the selected receipt line. If the quantity was received in a warehouse receipt, then a corrective line is inserted in the posted warehouse receipt. The Quantity Received and Qty. Rcd. Not Invoiced fields on the related purchase order are set to zero.';

                trigger OnAction()
                begin
                    UndoReceiptLine;
                end;
            }
        }
        //}
    }
    local procedure UndoReceiptLine()
    var
        PurchRcptLine: Record "Purch. Rcpt. Line";
    begin
        PurchRcptLine.Copy(Rec);
        CurrPage.SetSelectionFilter(PurchRcptLine);
        CODEUNIT.Run(CODEUNIT::"INT_Undo Purch Rect Line G/L", PurchRcptLine);
    end;
}
