report 50056 "INT_Data For MRD"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/DataForMRD.rdl';
    Caption = 'Data for MRD';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number) WHERE(Number = filter(1 .. 12));

            column(CountInteger; CountInteger)
            {
            }

            dataitem("Dimension Value"; "Dimension Value")
            {
                DataItemTableView = SORTING(code);
                column(DimValueCode; Code)
                {
                }


                dataitem("G/L Account"; "G/L Account")
                {
                    DataItemTableView = SORTING("No.") WHERE("Account Type" = CONST(Posting));
                    DataItemLinkReference = "Dimension Value";
                    //DataItemLink = "Global Dimension 1 Code" = FIELD(Code);
                    RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
                    column(GLAccNo_; "No.")
                    {
                    }
                    column(GLAccName; Name)
                    {
                    }
                    column(NetChangeShow; NetChangeShow)
                    {
                    }
                    column(BudgetAmount; BudgetAmount)
                    {
                    }
                    column(Variance; Variance)
                    {
                    }
                    column(PercentVariance; PercentVariance)
                    {
                    }

                    trigger OnPreDataItem()
                    begin

                    end;

                    trigger OnAfterGetRecord()
                    begin
                        SETFILTER("Date Filter", FORMAT(DMY2DATE(1, Integer.Number, DATE2DMY(WorkDate, 3))) + '..' + FORMAT(CALCDATE('<CM>', DMY2DATE(1, Integer.Number, DATE2DMY(WorkDate, 3)))));
                        //SETFILTER("Date Filter", FORMAT(DMY2DATE(1, Integer.Number, DATE2DMY(20191101D, 3))) + '..' + FORMAT(CALCDATE('<CM>', DMY2DATE(1, Integer.Number, DATE2DMY(20191130D, 3)))));
                        CalcFields("G/L Account"."Net Change", "G/L Account"."Budgeted Amount");
                        NetChangeShow := "G/L Account"."Net Change";
                        BudgetAmount := "G/L Account"."Budgeted Amount";
                        Variance := BudgetAmount - NetChangeShow;
                        if BudgetAmount <> 0 then
                            PercentVariance := (Variance * 100) / BudgetAmount
                        else
                            PercentVariance := 0;
                    end;

                }

                trigger OnPreDataItem()
                begin
                    SetRange("Dimension Value"."Dimension Code", 'COST CENTER');
                end;
            }


            trigger OnAfterGetRecord()
            begin
                CountInteger += 1;


            end;

        }
    }

    requestpage
    {
        SaveValues = true;
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
        CountInteger: Integer;
        DimensionValue: Record "Dimension Value";
        NetChangeShow: Decimal;
        NetChangeFilterDate: Decimal;
        BudgetAmount: Decimal;
        Variance: Decimal;
        PercentVariance: Decimal;
        AmountJAN: Decimal;
        AmountFEB: Decimal;
        AmountMAR: Decimal;
        AmountAPR: Decimal;
        AmountMAY: Decimal;
        AmountJUN: Decimal;
        AmountJUL: Decimal;
        AmountAUG: Decimal;
        AmountSEP: Decimal;
        AmountOCT: Decimal;
        AmountNOV: Decimal;
        AmountDEC: Decimal;
        AmountTotal: Decimal;

}