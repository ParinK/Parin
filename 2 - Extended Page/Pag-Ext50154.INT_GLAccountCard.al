pageextension 50154 "INT_GLAccountCard" extends "G/L Account Card"
{
    layout
    {
        modify(SubCategoryDescription)
        {
            Visible = false;
        }
        modify(Posting)
        {
            Visible = false;
        }
        modify(Consolidation)
        {
            Visible = false;
        }
        modify(Reporting)
        {
            Visible = false;
        }
        modify("Cost Accounting")
        {
            Visible = false;
        }
        modify("No. of Blank Lines")
        {
            Visible = false;
        }
        modify("New Page")
        {
            Visible = false;
        }
        modify("Reconciliation Account")
        {
            Visible = false;
        }
        modify("Automatic Ext. Texts")
        {
            Visible = false;
        }
        modify("FNGN008_Allow Invoice Disc.")
        {
            Visible = false;
        }
        modify("Omit Default Descr. in Jnl.")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }


}