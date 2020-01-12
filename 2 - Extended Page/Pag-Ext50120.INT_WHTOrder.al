pageextension 50120 "INT_WHT Order" extends "AVF_WHT Order"
{
    layout
    {
        moveafter("Vendor VAT Registration No."; "Posting Date")
        moveafter("No. of Additional WHT"; "Create By")
        moveafter("No. of Additional WHT"; "Post By")
        moveafter("Create By"; CLOSE_1)
    }
    actions
    {
    }
}
