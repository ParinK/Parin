pageextension 50129 "INT_Bank Account Card" extends "Bank Account Card"
{
    layout
    {
        /*addafter("Bank Clearing Code")
        {
            field("INT_Bank Acc. Posting Group20329"; "Bank Acc. Posting Group")
            {
                ApplicationArea = All;
            }
        }*/
        moveafter("Bank Account No."; "Bank Acc. Posting Group")
        modify(Communication)
        {
            Visible = false;
        }
        modify(Transfer)
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Bank Clearing Standard")
        {
            Visible = false;
        }
        modify("Bank Clearing Code")
        {
            Visible = false;
        }
        modify("Credit Transfer Msg. Nos.")
        {
            Visible = false;
        }
        modify("Direct Debit Msg. Nos.")
        {
            Visible = false;
        }
        modify("Our Contact Code")
        {
            Visible = false;
        }
        modify("SEPA Direct Debit Exp. Format")
        {
            Visible = false;
        }
        modify("Match Tolerance Type")
        {
            Visible = false;
        }
        modify("Match Tolerance Value")
        {
            Visible = false;
        }
        modify("Payment Match Tolerance")
        {
            Visible = false;
        }
        modify(Posting)
        {
            Visible = false;
        }

    }
    actions
    {
    }
}
