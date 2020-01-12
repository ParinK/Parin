pageextension 50020 "INT_No Series" extends "No. Series"
{
    layout
    {
        addafter("Date Order")
        {
            field("INT_Vend Posting Group"; "INT_Vend Posting Group")
            {
                ApplicationArea = All;
            }
            field("INT_Cust Posting Group"; "INT_Cust Posting Group")
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