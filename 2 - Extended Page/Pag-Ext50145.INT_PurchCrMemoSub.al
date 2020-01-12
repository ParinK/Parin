pageextension 50145 "INT_Purch. Cr. Memo Sub" extends "Purch. Cr. Memo Subform"
{
    layout
    {
        modify("G/L_Temp")
        {
            Visible = false;
        }
        modify("AVF_Gen. Bus. Posting Group")
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
        addafter("AVF_Gen. Prod. Posting Group")
        {
            field("INT_VAT Prod. Posting Group65485"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
                Width = 11;
            }
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        addafter("AVF_WHT Product Posting Group")
        {
            field("INT_AVF_WHT Absorb Base"; "AVF_WHT Absorb Base")
            {
                ApplicationArea = All;
            }
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        addafter("Direct Unit Cost")
        {
            field("INT_Line Discount Amount51168"; "Line Discount Amount")
            {
                ApplicationArea = All;
                Width = 12;
            }
        }
        modify("Line Discount Amount")
        {
            Visible = false;
        }
        modify(AmountBeforeDiscount)
        {
            Visible = false;
        }
        movefirst(Control41; "Total Amount Excl. VAT")
    }
    actions
    {
    }
}
