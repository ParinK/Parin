pageextension 50149 "INT_FA Post Group List" extends "FA Posting Groups"
{
    layout
    {
        addafter(Code)
        {
            field("INT_Description"; INT_Description)
            {
                ApplicationArea = All;
                Editable = true;
            }
        }
        addafter(INT_Description)
        {
            field("INT_Ending Book Value Tax"; "INT_Ending Book Value Tax")
            {
                ApplicationArea = all;
            }
            field("INT_Ending Book Value Company"; "INT_Ending Book Value Company")
            {
                ApplicationArea = all;
            }
            field("Default Straight-Line% Tax"; "Default Straight-Line% Tax")
            {
                ApplicationArea = all;
            }
            field("Default Straight-Line% Company"; "Default Straight-Line% Company")
            {
                ApplicationArea = all;
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