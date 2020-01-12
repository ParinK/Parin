pageextension 50109 "INT_Sales Cr. Memo Subform" extends "Sales Cr. Memo Subform"
{
    layout
    {
        moveafter("No."; Description)
        moveafter(Description; Quantity)
        modify("Location Code")
        {
            Visible = false;
        }
        moveafter(Quantity; "Unit Price")
        modify("Line Discount %")
        {
            Visible = false;
        }
        moveafter("Unit Price"; "Line Amount")
        modify("Tax Group Code")
        {
            Visible = false;
        }
        moveafter(Quantity; "Unit of Measure Code")
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        addafter("AVF_Gen. Prod. Posting Group")
        {
            field("INT_VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        /*addafter("Line Amount")
        {
            field("INT_Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
        }*/
        modify("G/L_Temp")
        {
            Visible = false;
        }
        modify("AVF_VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("AVF_WHT Business Posting Group")
        {
            Visible = false;
        }

    }
    actions
    {
    }
}
