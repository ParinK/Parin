pageextension 50157 "INT_PostSalesCrSubform" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        modify("Cross-Reference No.")
        {
            Visible = false;
        }
        modify("Return Reason Code")
        {
            Visible = false;
        }
        modify("Unit Cost (LCY)")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Deferral Code")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}