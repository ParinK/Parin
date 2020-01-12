report 50059 "INT_Validate FA Class Code"
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                //Validate("FA Class Code", "FA Posting Group");
                "FA Class Code" := "FA Posting Group";
                Modify;

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

    trigger OnPreReport()
    begin
        Message('Validate Complete.');
    end;

    var
        myInt: Integer;
}