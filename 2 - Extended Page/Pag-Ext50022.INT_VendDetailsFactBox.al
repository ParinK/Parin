pageextension 50022 "INT_Vend Details FactBox" extends "Vendor Details FactBox"
{
    layout
    {
        addlast(content)
        {
            field(Deposit; PurchInfoPaneMgmt.CalcVendAnalysisView("No."))
            {
                Caption = 'Deposit';
                trigger OnDrillDown()
                begin
                    PurchInfoPaneMgmt.LookupVendAnalysisView("No.");
                end;
            }

            field(Accrued; PurchInfoPaneMgmt.CalcVendAnalysisViewAcc("No."))
            {
                Caption = 'Accrued';
                trigger OnDrillDown()
                begin
                    PurchInfoPaneMgmt.LookupVendAnalysisViewAcc("No.");
                end;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        PurchInfoPaneMgmt: Codeunit "INT_Purch Info-Pane Manage 2";
}