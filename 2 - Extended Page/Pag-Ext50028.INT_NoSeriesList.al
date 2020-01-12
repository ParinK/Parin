pageextension 50028 "INT_No Series List" extends "No. Series List"
{
    layout
    {
        addafter("Date Order")
        {
            field("INT_Vend Posting Group"; "INT_Vend Posting Group")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("INT_Cust Posting Group"; "INT_Cust Posting Group")
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