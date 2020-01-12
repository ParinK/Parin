pageextension 50152 "INT_App Vend Entries" extends "Apply Vendor Entries"
{
    layout
    {
        modify("ApplyingVendLedgEntry.""Posting Date""")
        {
            Visible = false;
        }
        modify("ApplyingVendLedgEntry.""Currency Code""")
        {
            Visible = false;
        }
        modify("ApplyingVendLedgEntry.Amount")
        {
            Visible = false;
        }
        modify("ApplyingVendLedgEntry.""Remaining Amount""")
        {
            Visible = false;
        }
        moveafter("Posting Date"; "Due Date")
        moveafter("Amount to Apply"; "Document Type")
        moveafter("Document Type"; "Currency Code")
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Pmt. Disc. Tolerance Date")
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