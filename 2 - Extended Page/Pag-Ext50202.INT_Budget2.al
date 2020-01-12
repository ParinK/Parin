pageextension 50202 "INT_Budget 2" extends Budget
{
    layout
    {

    }

    actions
    {
        modify("Import from Excel")
        {
            Visible = false;
        }
        modify("Export to Excel")
        {
            Visible = false;
        }
        addafter("Export to Excel")
        {
            action("INT_Import from Excel")
            {
                ApplicationArea = Suite;
                Caption = 'Import from Excel';
                Ellipsis = true;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Import a budget that you exported to Excel earlier.';

                trigger OnAction()
                var
                    ImportBudgetfromExcel: Report "INT_Import Budget from Excel 2";
                begin

                    ImportBudgetfromExcel.SetParameters(BudgetName, 0);
                    ImportBudgetfromExcel.RunModal;
                    UpdateMatrixSubform;

                end;
            }
        }

        addbefore("INT_Import from Excel")
        {
            action("INT_Export Budget to Excel 2")
            {
                ApplicationArea = Suite;
                Caption = 'Export to Excel';
                Ellipsis = true;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Export all or part of the budget to Excel for further analysis. If you make changes in Excel, you can import the budget afterwards.';

                trigger OnAction()
                var
                    GLBudgetEntry: Record "G/L Budget Entry";
                begin
                    GLBudgetEntry.SetFilter("Budget Name", BudgetName);
                    GLBudgetEntry.SetFilter("Business Unit Code", BusUnitFilter);
                    GLBudgetEntry.SetFilter("G/L Account No.", GLAccFilter);
                    GLBudgetEntry.SetFilter("Global Dimension 1 Code", GlobalDim1Filter);
                    GLBudgetEntry.SetFilter("Global Dimension 2 Code", GlobalDim2Filter);
                    GLBudgetEntry.SetFilter("Budget Dimension 1 Code", BudgetDim1Filter);
                    GLBudgetEntry.SetFilter("Budget Dimension 2 Code", BudgetDim2Filter);
                    GLBudgetEntry.SetFilter("Budget Dimension 3 Code", BudgetDim3Filter);
                    GLBudgetEntry.SetFilter("Budget Dimension 4 Code", BudgetDim4Filter);
                    REPORT.Run(REPORT::"INT_Export Budget to Excel 2", true, false, GLBudgetEntry);
                end;
            }
        }

    }

    var
        BusUnitFilter: Text;
        MATRIX_MatrixRecords: array[32] of Record "Dimension Code Buffer";
        MATRIX_CaptionSet: array[32] of Text[80];
        MATRIX_CaptionRange: Text;
        MATRIX_CurrentNoOfColumns: Integer;
        LineDimCode: Text[30];
        ColumnDimCode: Text[30];
        LineDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4";
        ColumnDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4";
        GlobalDim1Filter: Text;
        GlobalDim2Filter: Text;
        BudgetDim1Filter: Text;
        BudgetDim2Filter: Text;
        BudgetDim3Filter: Text;
        BudgetDim4Filter: Text;
        GLBudgetName: Record "G/L Budget Name";
        DateFilter: Text[30];
        GLAccFilter: Text;
        IncomeBalanceGLAccFilter: Option " ","Income Statement","Balance Sheet";
        GLAccCategoryFilter: Option " ",Assets,Liabilities,Equity,Income,"Cost of Goods Sold",Expense;
        RoundingFactor: Option "None","1","1000","1000000";
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        BudgetName: Code[10];

    local procedure UpdateMatrixSubform()
    begin
        CurrPage.MatrixForm.PAGE.Load(
          MATRIX_CaptionSet, MATRIX_MatrixRecords, MATRIX_CurrentNoOfColumns, LineDimCode,
          LineDimOption, ColumnDimOption, GlobalDim1Filter, GlobalDim2Filter, BudgetDim1Filter,
          BudgetDim2Filter, BudgetDim3Filter, BudgetDim4Filter, GLBudgetName, DateFilter,
          GLAccFilter, IncomeBalanceGLAccFilter, GLAccCategoryFilter, RoundingFactor, PeriodType);

        CurrPage.Update;
    end;
}

