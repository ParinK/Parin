pageextension 50121 "INT_Recurring General Journal" extends "Recurring General Journal"
{
    layout
    {
        modify("Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Amount (LCY)")
        {
            Visible = false;
        }
        modify("Allocated Amt. (LCY)")
        {
            Visible = false;
        }
        modify("Expiration Date")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("INT_Debit Amount"; "Debit Amount")
            {
                ApplicationArea = All;
            }
            field("INT_Credit Amount"; "Credit Amount")
            {
                ApplicationArea = All;
            }
        }
        modify("Document Type")
        {
            Visible = false;
        }
        movebefore("Recurring Method"; "Recurring Frequency")
    }
    actions
    {
        modify("Post and &Print")
        {
            Promoted = false;
            Visible = false;
        }
        modify("Test Report")
        {
            Visible = false;
        }
        modify("Insert Conv. LCY Rndg. Lines")
        {
            Visible = false;
        }
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                CLEAR(AVDoc);
                AVDoc := "Document No.";
            end;

            trigger OnAfterAction()
            begin
                //AVWNFCNX.001 110919
                CLEAR(GLEntry);
                GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                GLEntry.SETRANGE("Journal Batch Name", AVDoc);
                IF GLEntry.FINDLAST THEN;
                //C-AVWNFCNX.001 110919

                //CLEAR(recGLEntry); //AVWNFCNX.001 110919
                //recGLEntry.SETRANGE("Journal Batch Name",CurrentJnlBatchName); //AVWNFCNX.001 110919
                CLEAR(recGLEntry);
                recGLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                recGLEntry.SETRANGE("Document No.", GLEntry."Document No.");
                IF recGLEntry.FINDFIRST THEN
                    REPORT.RUN(REPORT::"INT_Journals Report", TRUE, FALSE, recGLEntry);
                //C-AVWNFCNX.001 280519 Code มาจาก PPC

                //AVPKJINT.001 29/11/2019
                //Add code for run report payment journal after post payment journal
                /*JournalBatchNameForReport := GETRANGEMAX("Journal Batch Name");
                CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                CurrPage.UPDATE(FALSE);

                IF CurrentJnlBatchName <> AVDoc THEN BEGIN 
                    CLEAR(recGLEntry);
                    recGLEntry.SETRANGE("Journal Batch Name", JournalBatchNameForReport);
                    recGLEntry.SetRange("Document No.", AVDoc);
                    if recGLEntry.FindFirst() then
                        REPORT.RUN(REPORT::"INT_Journals Report", TRUE, FALSE, recGLEntry)
                END;*/
                //C-AVPKJINT.001 29/11/2019
            end;
        }
    }
    var
        GenJnlLine: Record "Gen. Journal Line";
        CurrentJnlBatchName: code[20];
        AVDoc: Code[20];
        recGLEntry: Record "G/L Entry";
        JournalBatchNameForReport: Code[20];
        GLEntry: Record "G/L Entry";
}
