report 50062 "INT_Validate Product Code"
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                /*
                if Vendor."No." = 'VIOA*' then begin
                    Vendor."INT_Bank DBK Product Code" := "INT_Bank DBK Product Code"::"Cheque Direct";
                    Vendor.Modify;
                end;
                if Vendor."No." = 'VIOS*' then begin
                    Vendor."INT_Bank DBK Product Code" := "INT_Bank DBK Product Code"::"Cheque Direct";
                    Vendor.Modify;
                end;
                if Vendor."No." = 'VLO*' then begin
                    Vendor."INT_Bank DBK Product Code" := "INT_Bank DBK Product Code"::"Cheque Direct";
                    Vendor.Modify;
                end;
                */

                Vendor."INT_Bank DBK Product Code" := "INT_Bank DBK Product Code"::"Cheque Direct";
                Vendor.Modify;



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