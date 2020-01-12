pageextension 50123 "INT_Posted Purchase Receipt" extends "Posted Purchase Receipt"
{
    layout
    {
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        moveafter("Buy-from Contact"; "AVF_VAT Registration No.")
        moveafter("AVF_VAT Registration No."; "AVF_Vendor Branch No.")
        moveafter("Responsibility Center"; "No. Printed")
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Promised Receipt Date")
        {
            Visible = false;
        }
        moveafter("Buy-from"; "Document Date")
        modify("Vendor Shipment No.")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("Pay-to City")
        {
            Visible = false;
        }
        modify("Pay-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Pay-to Contact")
        {
            Visible = false;
        }
        modify("Pay-to Post Code")
        {
            Visible = false;
        }
        modify("Ship-to City")
        {
            Visible = false;
        }
        modify("Ship-to Post Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Inbound Whse. Handling Time")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        moveafter("Ship-to Contact"; "Expected Receipt Date")
    }
    actions
    {
    }
}
