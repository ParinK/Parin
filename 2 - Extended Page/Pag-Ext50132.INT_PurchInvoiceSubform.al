pageextension 50132 "INT_Purch. Invoice Subform" extends "Purch. Invoice Subform"
{
    layout
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                FADepreBookTB: Record "FA Depreciation Book";
            begin
                if Rec.Type = rec.Type::"Fixed Asset" then begin
                    Clear(FADepreBookTB);
                    FADepreBookTB.SetCurrentKey("FA No.");
                    FADepreBookTB.SetRange("FA No.", "No.");
                    if FADepreBookTB.FindFirst() then begin
                        Rec."Depreciation Book Code" := FADepreBookTB."Depreciation Book Code";

                        if FADepreBookTB."Disposal Date" <> 0D then
                            Error('Cannot select FA No. because already Disposted.');

                    end;

                    "Depr. until FA Posting Date" := true;
                    "AVF_WHT Product Posting Group" := 'NOWHT';
                end;
            end;
        }
        modify(PurchDetailLine)
        {
            FreezeColumn = "No.";
        }
        moveafter(ShortcutDimCode3; "AVF_Receipt No.")
        modify("G/L_Temp")
        {
            Visible = false;
        }
        modify("AVF_WHT Business Posting Group")
        {
            Visible = false;
        }
        moveafter("No."; Description)
        moveafter(Description; "AVF_Gen. Bus. Posting Group")
        modify("AVF_Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("AVF_VAT Bus. Posting Group")
        {
            Visible = false;
        }
        moveafter(Description; "AVF_Gen. Prod. Posting Group")
        moveafter("AVF_Gen. Prod. Posting Group"; "AVF_VAT Prod. Posting Group")
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        /*modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }*/
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        addafter("Direct Unit Cost")
        {
            field("INT_Line Discount Amount"; "Line Discount Amount")
            {
                ApplicationArea = All;
                Width = 12;
            }
        }
        addbefore("Direct Unit Cost")
        {
            field("INT_AVF_WHT Absorb Base"; "AVF_WHT Absorb Base")
            {
                ApplicationArea = All;
                Width = 13;
            }
        }
        modify(AmountBeforeDiscount)
        {
            Visible = false;
        }
        movefirst(Control33; "Total Amount Excl. VAT")
        modify("AVF_Receipt Line No.")
        {
            Visible = false;
        }
        addafter(ShortcutDimCode8)
        {
            field("INT_Depreciation Book Code"; "Depreciation Book Code")
            {
                ApplicationArea = All;
            }

        }

    }
    actions
    {
    }
}
