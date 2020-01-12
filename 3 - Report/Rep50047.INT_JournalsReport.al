report 50047 "INT_Journals Report"
{
    // version AVTHLC1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Journals Report.rdl';
    Caption = 'Journals Report';
    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            //DataItemTableView = SORTING("Source Code","Document No.") WHERE(Amount=FILTER(<>0));
            DataItemTableView = where(Amount = filter(<> 0));
            RequestFilterFields = "Source Code", "Document No.", "Posting Date";
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(SourceCode_Description; SourceCode.Description)
            {
            }
            column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
            {
            }
            column(PostingDate_GLEntry; Format("G/L Entry"."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(SourceCode_GLEntry; "G/L Entry"."Source Code")
            {
            }
            column(ExternalDocumentNo_GLEntry; "G/L Entry"."External Document No.")
            {
            }
            column(Description_GLEntry; "G/L Entry".Description)
            {
            }
            column(BatchNo_GLEntry; "G/L Entry"."Journal Batch Name")
            {
            }
            column(Name_Vendor; Vendor."No." + ' - ' + Vendor.Name + Vendor."Name 2")
            {
            }
            column(JournalBatchDescription_GLEntry; "G/L Entry"."FNGN006_Jnl Batch Description")
            {
            }
            column(Running; Running)
            {
            }
            column(GLAccountNo_GLEntry; "G/L Account No." + ' - ' + GLAccount.Name)
            {
            }
            column(DebitAmount_GLEntry; "G/L Entry"."Debit Amount")
            {
            }
            column(CreditAmount_GLEntry; "G/L Entry"."Credit Amount")
            {
            }
            column(TotalCredit; TotalCredit)
            {
            }
            column(TotalDebit; TotalDebit)
            {
            }
            column(ShowDimension; ShowDimension)
            {
            }
            column(ShowPURCHASES; ShowPURCHASES)
            {
            }
            column(DatePrinted; FORMAT(TODAY, 0, 1) + ' ' + FORMAT(TIME, 0, '<Hours12>:<Minutes,2>:<Seconds,2> <AM/PM>'))
            {
            }
            //AVPKJINT.001 04/11/2019
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            //C-AVPKJINT.001 04/11/2019
            dataitem("Dimension Set Entry"; "Dimension Set Entry")
            {
                DataItemLink = "Dimension Set ID" = FIELD("Dimension Set ID");
                //DataItemTableView = SORTING("Dimension Set ID", "Dimension Code");   //AVPKJINT.001 26/11/2019 Comment Code
                DataItemTableView = SORTING("Dimension Set ID", "Dimension Code") where("Dimension Code" = FILTER(<> 'COST CENTER' & <> 'TRADING PARTNERS'));      //AVPKJINT.001 26/11/2019 Add Code
                column(DimensionSetID_DimensionSetEntry; "Dimension Set Entry"."Dimension Set ID")
                {
                }
                column(DimensionText; DimensionText)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //calcfields("Dimension Value Name");//เอาออกเนื่องจากอยากแสดงแต่โค้ด

                    if DimensionText = '' then
                        if DimensionValue.Name <> '' then
                            DimensionText := "Dimension Code" + ' : ' + "Dimension Value Code" + ' = ' + "Dimension Value Name"
                        else
                            DimensionText := "Dimension Code" + ' : ' + "Dimension Value Code"
                    else
                        if DimensionValue.Name <> '' then
                            DimensionText := DimensionText + ', ' + "Dimension Code" + ' : ' + "Dimension Value Code" + ' = ' + "Dimension Value Name"
                        else
                            DimensionText := DimensionText + ', ' + "Dimension Code" + ' : ' + "Dimension Value Code";
                end;

                trigger OnPreDataItem();
                begin
                    CLEAR(DimensionText);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(SourceCode);
                SourceCode.SETRANGE(Code, "Source Code");
                SourceCode.NEXT;


                if OldDoc <> "Document No." then begin
                    CLEAR(TotalCredit);
                    CLEAR(TotalDebit);
                    CLEAR(Running);

                    CLEAR(CheckLedger);
                    CLEAR(CheckNo);
                    CheckLedger.SETRANGE("Document No.", "Document No.");
                    CheckLedger.NEXT;

                    for i := 1 to CheckLedger.COUNT do begin
                        if CheckNo = '' then
                            CheckNo := CheckLedger."Check No."
                        else
                            CheckNo := CheckNo + ', ' + CheckLedger."Check No.";
                        CheckLedger.NEXT;
                    end;

                    CLEAR(Vendor);
                    Vendor.SETRANGE("No.", "Source No.");
                    Vendor.NEXT;
                end;
                OldDoc := "Document No.";

                if OldSource <> "Source Code" then begin
                    CLEAR(TotalCredit);
                    CLEAR(TotalDebit);
                    CLEAR(Running);
                end;
                OldSource := "Source Code";


                Running := Running + 1;

                TotalCredit += "Debit Amount";
                TotalDebit += "Credit Amount";

                ShowPURCHASES := true;

                if "Source Code" = 'PURCHASES' then
                    ShowPURCHASES := false;

                // Get G/L Account Description //
                CLEAR(GLAccount);
                GLAccount.SETRANGE("No.", "G/L Account No.");
                GLAccount.NEXT;
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;

                // GET Date Filter For Showing in Page Header //
                DateFilter := "G/L Entry".GETFILTER("Posting Date");
                if DateFilter = '' then
                    DateHeader := ''
                else begin
                    CLEAR(POS);
                    POS := STRPOS(DateFilter, '..');
                    if POS = 0 then begin
                        DateHeader := 'From ' + DateFilter + ' To ' + DateFilter;
                    end
                    else begin
                        DateHeader := 'From ' + COPYSTR(DateFilter, 1, POS - 1) + ' TO ' + COPYSTR(DateFilter, POS + 2, STRLEN(DateFilter));
                    end;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Option")
                {
                    Caption = 'Option';
                    field("Show Dimension"; ShowDimension)
                    {
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            ShowDimension := true;
        end;
    }

    labels
    {
    }

    var
        DimensionText: Text[500];
        ShowDimension: Boolean;
        DimensionValue: Record "Dimension Value";
        FooterPrinted: Boolean;
        CompanyInfo: Record "Company Information";
        SourceCode: Record "Source Code";
        OldSource: Code[10];
        DateFilter: Text[50];
        DateHeader: Text[50];
        POS: Integer;
        Running: Integer;
        GLAccount: Record "G/L Account";
        CheckLedger: Record "Check Ledger Entry";
        CheckNo: Text[100];
        i: Integer;
        OldDoc: Code[30];
        Vendor: Record Vendor;
        Comment: Text[1024];
        ShowRemark: Text[250];
        AVGLEntry: Record "G/L Entry";
        TotalCredit: Decimal;
        TotalDebit: Decimal;
        ShowPURCHASES: Boolean;
}

