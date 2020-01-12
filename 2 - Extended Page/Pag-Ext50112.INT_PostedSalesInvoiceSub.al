pageextension 50112 "INT_Posted Sales Invoice Sub" extends "Posted Sales Invoice Subform"
{
    layout
    {
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Line Discount %")
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
    }
}
