pageextension 50139 "INT_General Journal" extends "General Journal"
{
    layout
    {
        addafter("Credit Amount")
        {
            field("INT_Amount"; Amount)
            {
                Caption = 'Amount';
                ApplicationArea = All;
            }
            field("INT_Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("INT_Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field(INT_ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = All;
                CaptionClass = '1,2,3';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                //ToolTip = 'Specifies the dimension value code linked to the journal line.';
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                end;
            }
            field(INT_ShortcutDimCode4; ShortcutDimCode[4])
            {
                ApplicationArea = All;
                CaptionClass = '1,2,4';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                //ToolTip = 'Specifies the dimension value code linked to the journal line.';
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                end;
            }
            field(INT_ShortcutDimCode5; ShortcutDimCode[5])
            {
                ApplicationArea = All;
                CaptionClass = '1,2,5';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                //ToolTip = 'Specifies the dimension value code linked to the journal line.';
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                end;
            }
            field(INT_ShortcutDimCode6; ShortcutDimCode[6])
            {
                ApplicationArea = All;
                CaptionClass = '1,2,6';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                //ToolTip = 'Specifies the dimension value code linked to the journal line.';
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                end;
            }
            field(INT_ShortcutDimCode7; ShortcutDimCode[7])
            {
                ApplicationArea = All;
                CaptionClass = '1,2,7';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                //ToolTip = 'Specifies the dimension value code linked to the journal line.';
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                end;
            }
            field(INT_ShortcutDimCode8; ShortcutDimCode[8])
            {
                ApplicationArea = All;
                CaptionClass = '1,2,8';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                //ToolTip = 'Specifies the dimension value code linked to the journal line.';
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                end;
            }
            field("INT_Gen. Posting Type"; "Gen. Posting Type")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("INT_Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("INT_Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("INT_VAT Bus. Posting Group"; "VAT Bus. Posting Group")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("INT_VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
        modify("Currency Code")
        {
            Visible = false;
        }
        modify("G/L_Temp")
        {
            Visible = false;
        }
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
        addbefore("Debit Amount")
        {
            field("INT_External Document No."; "External Document No.")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }

        addbefore("Account No.")
        {
            field("INT_Document No."; "Document No.")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
        addafter("Document No.")
        {
            field("INT_Posting Date"; "Posting Date")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }

        /*modify("Bal. Account Type")
        {
            ApplicationArea = All;
            Visible = true;
            Editable = true;
        }
        modify("Bal. Account No.")
        {
            ApplicationArea = All;
            Visible = true;
            Editable = true;
        }*/
    }
    actions
    {
        modify(Reconcile)
        {
            Visible = false;
            Promoted = false;
        }
        modify("Apply Entries")
        {
            Visible = false;
            Promoted = false;
        }
        modify(Approvals)
        {
            Visible = false;
            Promoted = false;
        }
        modify("Insert Conv. LCY Rndg. Lines")
        {
            Visible = false;
            Promoted = false;
        }
        modify(GetStandardJournals)
        {
            Visible = false;
            Promoted = false;
        }
        modify(SaveAsStandardJournal)
        {
            Visible = false;
            Promoted = false;
        }
        modify("Test Report")
        {
            Visible = false;
            Promoted = false;
        }
        modify(PostAndPrint)
        {
            Visible = false;
            Promoted = false;
        }
        modify(DeferralSchedule)
        {
            Visible = false;
            Promoted = false;
        }
        modify(IncomingDocument)
        {
            Visible = false;
            //Promoted = false;
        }
        modify("B&ank")
        {
            Visible = false;
            //Promoted = false;
        }
        modify("Request Approval")
        {
            Visible = false;
            //Promoted = false;
        }
        modify(SendApprovalRequest)
        {
            Visible = false;
            //Promoted = false;
        }
        modify(CancelApprovalRequest)
        {
            Visible = false;
            //Promoted = false;
        }
        modify(SeeFlows)
        {
            Visible = false;
            Promoted = false;
        }
        modify("Opening Balance")
        {
            Visible = false;
            //Promoted = false;
        }
        modify("Prepare journal")
        {
            Visible = false;
            //Promoted = false;
        }
        modify("G/L Accounts Opening balance ")
        {
            Visible = false;
            Promoted = false;
        }
        modify("Customers Opening balance")
        {
            Visible = false;
            Promoted = false;
        }
        modify("Vendors Opening balance")
        {
            Visible = false;
            Promoted = false;
        }
    }
    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}
