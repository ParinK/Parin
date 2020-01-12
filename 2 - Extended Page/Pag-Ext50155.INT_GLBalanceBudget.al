pageextension 50155 "INT_GLBalanceBudget" extends "G/L Balance/Budget"
{
    layout
    {
        addbefore(BudgetPct)
        {
            field("INT_Net Change"; "Net Change")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("INT_Budgeted Amount"; "Budgeted Amount")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}