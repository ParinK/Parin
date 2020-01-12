pageextension 50130 "INT_Purch. Order-FIN List" extends "FNGN011_Purch. Order-FIN List"
{
    layout
    {
        modify("Vendor Authorization No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        addafter("Buy-from Vendor Name")
        {
            field("INT_Posting Description"; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
        addafter("INT_Posting Description")
        {
            field("INT_FNGN011_Purchase Status"; "FNGN011_Purchase Status")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        modify("Prepa&yment Invoices")
        {
            Visible = false;
        }
        modify("Prepayment Credi&t Memos")
        {
            Visible = false;
        }
        modify("Whse. Receipt Lines")
        {
            Visible = false;
        }
        modify("Speci&al Order")
        {
            Visible = false;
        }
        modify("Dr&op Shipment")
        {
            Visible = false;
        }
    }
}
