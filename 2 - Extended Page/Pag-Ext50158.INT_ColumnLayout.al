pageextension 50158 "INT_Column Layout" extends "Column Layout"
{
    layout
    {
        addafter("Comparison Date Formula")
        {
            field("INT_Comparison Period Formula"; "Comparison Period Formula")
            {
                ApplicationArea = All;
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