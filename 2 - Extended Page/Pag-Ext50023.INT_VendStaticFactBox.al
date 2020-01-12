pageextension 50023 "INT_Vend Static FactBox" extends "Vendor Statistics FactBox"
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
            field(AccruedSameVendor; PurchInfoPaneMgmt.CalcVendAnalysisViewAcc("No."))
            {
                Caption = 'Accrued Same Vendor';
                trigger OnDrillDown()
                begin
                    PurchInfoPaneMgmt.LookupVendAnalysisViewAcc("No.");
                end;
            }
            field(Accrued1TimeVendor; PurchInfoPaneMgmt.CalcVendAnalysisViewAcc("No."))
            {
                Caption = 'Accrued 1 Time Vendor';
                trigger OnDrillDown()
                begin
                    PurchInfoPaneMgmt.LookupVend1TimeAnalysisViewAcc("No.");
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