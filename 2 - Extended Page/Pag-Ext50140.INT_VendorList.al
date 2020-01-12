pageextension 50140 "INT_Vendor List" extends "Vendor List"
{
    Editable = true;
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("AVF_WHT Business Posting Group")
        {
            Visible = false;
        }
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }
        modify(Contact)
        {
            Visible = false;
        }
        modify("AVF_Vendor Branch No.")
        {
            Visible = false;
        }
        modify("AVF_Address 3")
        {
            Visible = false;
        }
        addafter("AVF_VAT Registration No.")
        {
            field("INT_E-Mail Tmp"; "INT_E-Mail Tmp")
            {
                ApplicationArea = All;
            }
        }
        addafter("INT_E-Mail Tmp")
        {
            field("INT_Bank BBL Banaf. Acc. No."; "INT_Bank BBL Banaf. Acc. No.")
            {
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        modify(ApprovalEntries)
        {
            Promoted = false;
        }
        modify("Cross Re&ferences")
        {
            Promoted = false;
        }
        modify(Quotes)
        {
            Promoted = false;
        }
        modify("Return Orders")
        {
            Promoted = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify(Display)
        {
            Visible = false;
        }
        modify(Documents)
        {
            Visible = false;
        }
    }
}
