pageextension 50150 "INT_Depre Book Card" extends "Depreciation Book Card"
{
    layout
    {
        addafter("Disposal Calculation Method")
        {
            field("INT_No. of Days in Fiscal Year"; "No. of Days in Fiscal Year")
            {
                Editable = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }


}