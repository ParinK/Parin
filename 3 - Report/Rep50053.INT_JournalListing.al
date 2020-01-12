report 50053 "INT_Journal Listing"
{
    // version AVTHLC1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Journal Listing.rdl';
    Caption = 'Journal Listing';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            //DataItemTableView = SORTING("Document No.","Source Code") WHERE(Amount=FILTER(<>0));
            DataItemTableView = where(Amount = filter(<> 0));
            RequestFilterFields = "Source Code", "Posting Date", "Document No.";
            column(GLEntryFilter; GLEntryFilter)
            {
            }
            column(PrintDate; FORMAT(TODAY, 0, 1) + ' ' + FORMAT(TIME, 0, '<Hours12>:<Minute,2>:<Seconds,2> <AM/PM>'))
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name + ' ' + CompanyInfo."Name 2")
            {
            }
            column(SourceCode_Description; 'Journal Source : ' + SourceCode.Description)
            {
            }
            column(DateHeader; DateHeader)
            {
            }
            column(DocumentDate_GLEntry; Format("G/L Entry"."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
            {
            }
            column(DocumentType_GLEntry; "G/L Entry"."Document Type")
            {
            }
            column(CheckNo_GLEntry; CheckNo)
            {
            }
            column(JournalBatchDescription_GLEntry; JournalDes)
            {
            }
            column(JournalBatchName_GLEntry; "G/L Entry"."Journal Batch Name")
            {
            }
            column(Running; Running)
            {
            }
            column(GLAccountNo_GLAccountName; "G/L Account No." + ' - ' + GLAccount.Name)
            {
            }
            column(DebitAmount_GLEntry; "G/L Entry"."Debit Amount")
            {
            }
            column(CreditAmount_GLEntry; "G/L Entry"."Credit Amount")
            {
            }
            column(ShowDimension; ShowDimension)
            {
            }
            column(TotalCredit; TotalCredit)
            {
            }
            column(TotalDebit; TotalDebit)
            {
            }
            column(SourceCode; "G/L Entry"."Source Code")
            {
            }
            column(SourceType; "G/L Entry"."Source Type")
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
                //DataItemTableView = SORTING("Dimension Set ID", "Dimension Code");    //AVPKJINT.001 25/12/2019 Comment Code
                DataItemTableView = SORTING("Dimension Set ID", "Dimension Code") where("Dimension Code" = FILTER(<> 'COST CENTER' & <> 'TRADING PARTNERS'));      //AVPKJINT.001 25/12/2019 Add Code
                column(DimensionSetID_DimensionSetEntry; "Dimension Set Entry"."Dimension Set ID")
                {
                }
                column(DimensionText; DimensionText)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(DimensionValue);
                    DimensionValue.SETRANGE("Dimension Code", "Dimension Code");
                    DimensionValue.SETRANGE(Code, "Dimension Value Code");
                    DimensionValue.NEXT;
                    if DimensionText = '' then begin
                        if DimensionValue.Name <> '' then begin
                            if STRLEN("Dimension Code" + ' : ' + "Dimension Value Code" + ' ' + DimensionValue.Name) < 1024 then
                                DimensionText := "Dimension Code" + ' : ' + "Dimension Value Code" + ' ' + DimensionValue.Name;
                        end else begin
                            if STRLEN("Dimension Code" + ' : ' + "Dimension Value Code") < 1024 then
                                DimensionText := "Dimension Code" + ' : ' + "Dimension Value Code";
                        end;
                    end else
                        if DimensionValue.Name <> '' then begin
                            if STRLEN(DimensionText + ', ' + "Dimension Code" + ' : ' + "Dimension Value Code" + ' ' + DimensionValue.Name) < 1024 then
                                DimensionText := DimensionText + ', ' + "Dimension Code" + ' : ' + "Dimension Value Code" + ' ' + DimensionValue.Name
                        end else begin
                            if STRLEN(DimensionText + ', ' + "Dimension Code" + ' : ' + "Dimension Value Code") < 1024 then
                                DimensionText := DimensionText + ', ' + "Dimension Code" + ' : ' + "Dimension Value Code";
                        end;
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


                Running := Running + 1;

                // Get G/L Account Description //
                CLEAR(GLAccount);
                GLAccount.SETRANGE("No.", "G/L Account No.");
                GLAccount.NEXT;

                if OldDoc <> "Document No." then begin
                    Running := 1;

                    CLEAR(CheckLedger);
                    CLEAR(CheckNo);
                    CheckLedger.SETRANGE("Document No.", "Document No.");
                    CheckLedger.NEXT;

                    for i := 1 to CheckLedger.COUNT do begin
                        if CheckNo = '' then
                            CheckNo := CheckLedger."Check No."
                        else
                            if STRLEN(CheckNo + ', ' + CheckLedger."Check No.") < 1024 then
                                CheckNo := CheckNo + ', ' + CheckLedger."Check No.";
                        CheckLedger.NEXT;
                    end;

                    CLEAR(TotalCredit);
                    CLEAR(TotalDebit);
                end;
                OldDoc := "Document No.";

                CLEAR(VendTB);
                CLEAR(CusTB);
                CLEAR(JournalDes);
                if ("G/L Entry"."Source Code" = 'PURCHASES') and ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Vendor) then begin
                    VendTB.SETRANGE("No.", "G/L Entry"."Source No.");
                    if VendTB.FIND('-') then
                        JournalDes := VendTB.Name + ' ' + VendTB."Name 2";

                end
                else
                    if ("G/L Entry"."Source Code" = 'SALES') and ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Customer) then begin
                        CusTB.SETRANGE("No.", "G/L Entry"."Source No.");
                        if CusTB.FIND('-') then
                            JournalDes := CusTB.Name + ' ' + CusTB."Name 2";
                    end else
                        JournalDes := "G/L Entry"."FNGN006_Jnl Batch Description";


                TotalCredit += "Debit Amount";
                TotalDebit += "Credit Amount";
            end;

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Document No.");
                CompanyInfo.GET;


                GLEntryFilter := "G/L Entry".GETFILTERS;
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
                        DateHeader := 'From ' + COPYSTR(DateFilter, 1, POS - 1) + ' To ' + COPYSTR(DateFilter, POS + 2, STRLEN(DateFilter));
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
                    field(ShowDimension; ShowDimension)
                    {
                        Caption = 'Show Dimension';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LastFieldNo: Integer;
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
        CheckNo: Text[1024];
        i: Integer;
        DimensionText: Text[1024];
        ShowDimension: Boolean;
        DimensionValue: Record "Dimension Value";
        TotalFor: Label '"Total for "';
        OldDoc: Text[30];
        TotalDebit: Decimal;
        TotalCredit: Decimal;
        VendTB: Record Vendor;
        CusTB: Record Customer;
        JournalDes: Text;
        GLEntryFilter: Text;
}

