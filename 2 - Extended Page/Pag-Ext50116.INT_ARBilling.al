pageextension 50116 "INT_AR-Billing" extends "FNAR001_AR-Billing"
{
    layout
    {
        moveafter("Address 3"; "Billing Date")
        moveafter("Address 3"; Contact)
    }

    actions
    {
        addlast(Reporting)
        {
            action("INT_Print Report")
            {
                Caption = 'AR Billing';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                begin
                    Clear(BillHesdTB);
                    BillHesdTB.SetCurrentKey("Billing No.");
                    BillHesdTB.SetRange("Billing No.", Rec."Billing No.");
                    if BillHesdTB.FindFirst() then;
                    Report.RunModal(50007, TRUE, FALSE, BillHesdTB);
                end;
            }
        }
    }


    Var
        BillHesdTB: Record "FNAR001_Billing Header";
}
