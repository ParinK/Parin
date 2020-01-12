pageextension 50147 "INT_WHT Lists (Close)" extends "AVF_WHT Lists (Close)"
{
    layout
    {
        modify("WHT Business Posting Group")
        {
            Visible = false;
        }
        modify("Applied to Document Type")
        {
            Visible = false;
        }
        modify("Applied to Document No.")
        {
            Visible = false;
        }
        modify("Applied to Document Line No.")
        {
            Visible = false;
        }
        modify("Post to G/L Document Type")
        {
            Visible = false;
        }
        modify("WHT Report")
        {
            Visible = false;
        }
        moveafter("Total WHT Amount"; "Auto Create WHT")
        moveafter("Total WHT Amount"; Status)
        modify("Post to G/L Document No.")
        {
            Visible = false;
        }
        modify("Auto Ref. Payment No.")
        {
            Visible = false;
        }
        moveafter(Status; "Create By")
    }
    actions
    {
    }
}
