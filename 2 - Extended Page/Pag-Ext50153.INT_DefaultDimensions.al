pageextension 50153 "INT_Default Dimensions" extends "Default Dimensions"
{
    layout
    {
        addbefore("Dimension Code")
        {
            field("INT_No."; "No.")
            {
                ApplicationArea = All;
                Editable = true;
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