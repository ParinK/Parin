report 50054 "INT_ValidateDim5"
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Line No.");
            RequestFilterFields = "Journal Template Name", "Journal Batch Name";

            trigger OnAfterGetRecord()
            var
                DefaultShortcutDimCode5: Code[20];
            begin
                if "Journal Template Name" = 'ASSETS' then begin
                    if "Document No." = 'BF-FA-ACQ' then begin
                        DefaultShortcutDimCode5 := '010';
                        ValidateShortcutDimCode(5, DefaultShortcutDimCode5);
                        Modify;
                    end;
                    if "Document No." = 'BF-FA-DEP' then begin
                        DefaultShortcutDimCode5 := '060';
                        ValidateShortcutDimCode(5, DefaultShortcutDimCode5);
                        Modify;
                    end;
                end;
                //"Gen. Journal Line".Validate("Document No.");

            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}