pageextension 50138 "INT_G/L Entries Preview" extends "G/L Entries Preview"
{
    layout
    {
        addafter(Description)
        {
            field("INT_Debit Amount"; "Debit Amount")
            {
                ApplicationArea = All;
                Width = 13;
            }
            field("INT_Credit Amount"; "Credit Amount")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Debit Amount"; Amount)

        addafter("G/L Account No.")
        {
            field("INT_G/L Account Name New 2"; "G/L Account Name")
            {
                Caption = 'G/L Account Name';
                ApplicationArea = All;
                Visible = true;
                Editable = true;
            }
        }
    }
    actions
    {
    }
}
