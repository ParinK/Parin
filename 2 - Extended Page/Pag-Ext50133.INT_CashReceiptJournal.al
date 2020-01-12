pageextension 50133 "INT_Cash Receipt Journal" extends "Cash Receipt Journal"
{
    layout
    {
        modify("G/L_Temp")
        {
            Visible = false;
        }

        addafter(Description)
        {
            field("INT_Debit Amount New"; "Debit Amount")
            {
                Caption = 'Debit Amount';
                Visible = true;
                Editable = true;
            }
            field("INT_Credit Amount New"; "Credit Amount")
            {
                Caption = 'Credit Amount';
                Visible = true;
                Editable = true;
            }
        }
        moveafter("Credit Amount"; Amount)
        modify("Amount (LCY)")
        {
            Visible = false;
        }
        modify("Bal. Account Type")
        {
            Visible = false;
        }
        modify("Bal. Account No.")
        {
            Visible = false;
        }
        modify(Correction)
        {
            Visible = false;
        }
        /*modify(ref)
        {
            Visible = false;
        }*/
    }

    actions
    {
        modify(Reconcile)
        {
            Visible = false;
            Promoted = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify(Post)
        {
            //AVWNFINT.001 17/12/2019
            //Add code for run report after post
            trigger OnBeforeAction()
            begin
                CLEAR(AVDoc);
                AVDoc := "Document No.";
                //Message('1 : ' + Format(AVDoc));
            end;

            trigger OnAfterAction()
            begin
                //Message('2 : ' + Format(AVDoc));
                JournalBatchNameForReport := GETRANGEMAX("Journal Batch Name");
                CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                CurrPage.UPDATE(FALSE);

                IF CurrentJnlBatchName <> AVDoc THEN BEGIN
                    CLEAR(recGLEntry);
                    recGLEntry.SETRANGE("Journal Batch Name", JournalBatchNameForReport);
                    recGLEntry.SetRange("Document No.", AVDoc);
                    if recGLEntry.FindFirst() then
                        REPORT.RUN(REPORT::"INT_Receipt Voucher", TRUE, FALSE, recGLEntry)
                END;
            end;
            //C-AVWNFINT.001 29/11/2019
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
        CurrentJnlBatchName: code[20];
        AVDoc: Code[20];
        recGLEntry: Record "G/L Entry";
        JournalBatchNameForReport: Code[20];
}