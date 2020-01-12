report 50004 "INT_Receipt Voucher"
{
    // version AVTHLC1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Receipt Voucher.rdl';
    Caption = 'Receipt Voucher';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Group by PV No."; "G/L Entry")
        {
            DataItemTableView = SORTING("Document No.") WHERE("Source Code" = FILTER('CASHRECJNL|UNAPPSALES'));
            RequestFilterFields = "Document No.", "Posting Date", "Journal Batch Name", "Source Type", "Source No.";
            column(Comment; Comment)
            {
            }
            column(DocumentNo_GroupbyPVNo; "Group by PV No."."Document No.")
            {
            }
            column(TotalDebitAmount; TotalDebitAmount)
            {
            }
            column(TotalCreditAmount; TotalCreditAmount)
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = SORTING("Document No.") WHERE("Source Code" = FILTER('CASHRECJNL|UNAPPSALES'), Amount = FILTER(<> 0));
                column(CompanyInfoName; CompanyInfo.Name + CompanyInfo."Name 2")
                {
                }
                column(SourceCodeDescription; SourceCode.Description)
                {
                }
                column(PrintDate; FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>') + '  ' + FORMAT(TIME, 0, '<Hours12>:<Minutes,2>:<Seconds,2> <AM/PM>'))
                {
                }
                column(UserID; USERID)
                {
                }
                column(PayTo; PayTo)
                {
                }
                column(DocumentNo; "Document No.")
                {
                }
                column(JournalBatchName; "Journal Batch Name")
                {
                }
                column(PostingDate; FORMAT("Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(DocDate; FORMAT("Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(ExDocNo; "External Document No.")
                {
                }
                column(CheckLedger_CheckDate; FORMAT(CheckLedger."Check Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(BankName; BankName)
                {
                }
                column(BankBranch; BankBranch)
                {
                }
                column(PCurr; PCurr)
                {
                }
                column(ExchangeRate; ExchangeRate)
                {
                }
                /* column(JournalBatchDescription; "Journal Batch Description")
                {
                } */
                column(Running; Running)
                {
                }
                column(GLAccountNo_GLAccountName; "G/L Account No." + ' - ' + GLAccount.Name)
                {
                }
                column(GLDesc; Description)
                {
                }
                column(DebitAmount; ROUND("Debit Amount", 0.01, '='))
                {
                }
                column(CreditAmount; ROUND("Credit Amount", 0.01, '='))
                {
                }
                column(NETTEXT1_NETTEXT2; NETTEXT[1] + ' ' + NETTEXT[2])
                {
                }
                column(NETPAID; -NETPAID)
                {
                }
                column(xCash; xCash)
                {
                }
                column(xTransfer; xTransfer)
                {
                }
                column(xCredit; xCredit)
                {
                }
                column(xCheque; xCheque)
                {
                }
                column(CheckNo; CheckNo)
                {
                }
                column(ShowDTL; ShowDTL)
                {
                }
                column(AVCheckDate; AVCheckDate)
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
                    DataItemTableView = SORTING("Dimension Set ID", "Dimension Code");
                    column(DimensionText; DimensionText)
                    {
                    }
                    column(ShowDimension; ShowDimension)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //calcfields("Dimension Value Name");//เอาออกเนื่องจากอยากแสดงแต่โค้ด

                        if DimensionText = '' then
                            if "Dimension Value Name" <> '' then
                                DimensionText := "Dimension Code" + ' : ' + "Dimension Value Code" + ' = ' + "Dimension Value Name"
                            else
                                DimensionText := "Dimension Code" + ' : ' + "Dimension Value Code"
                        else
                            if "Dimension Value Name" <> '' then
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
                    CLEAR(ExchText);
                    CLEAR(PCurr);
                    CLEAR(PExch);
                    CLEAR(GLEntry);
                    CLEAR(BankName);
                    CLEAR(InPaymentOf);
                    CLEAR(ExchangeRate);
                    CLEAR(BankCode);
                    GLEntry.SETRANGE("Document No.", "Document No.");
                    GLEntry.NEXT;
                    for a := 1 to GLEntry.COUNT do begin
                        if GLEntry."Source Type" = GLEntry."Source Type"::"Bank Account" then begin
                            BankCode := GLEntry."Source No.";
                        end;

                        if BankCode <> '' then begin
                            // Get BANK NAME
                            CLEAR(BankAccount);
                            BankAccount.SETRANGE("No.", BankCode);
                            BankAccount.NEXT;
                            BankName := BankAccount.Name;
                            InPaymentOf := Description;
                            //BankBranch := BankAccount."Bank Account Name";
                            // Get BANK ACCOUNT
                            CLEAR(BankAcctPostingGroup);
                            BankAcctPostingGroup.SETRANGE(Code, BankAccount."Bank Acc. Posting Group");
                            BankAcctPostingGroup.NEXT;
                            BankAcctNo := BankAcctPostingGroup."G/L Account No.";
                        end;

                        if GLEntry."Source Type" = GLEntry."Source Type"::Customer then begin
                            CLEAR(i);
                            CLEAR(CustLedgEntry1);
                            CustLedgEntry1.SETRANGE("Document No.", GLEntry."Document No.");
                            if CustLedgEntry1.FIND('-') then
                                repeat
                                    if i < 5 then begin
                                        i := i + 1;
                                        if CustLedgEntry1."Currency Code" <> '' then begin
                                            if CustLedgEntry1."Adjusted Currency Factor" <> 0 then begin
                                                PExch[i] := ROUND(1 / CustLedgEntry1."Adjusted Currency Factor", 0.00001, '=');
                                            end;
                                            PCurr := COPYSTR(CustLedgEntry1."Currency Code", 1, 3);
                                            ExchText := 'EXCH. RATE'
                                        end;
                                    end;
                                until (CustLedgEntry1.NEXT = 0);
                        end;

                        if GLEntry."Source Type" = GLEntry."Source Type"::Customer then begin
                            CLEAR(i);
                            CLEAR(CustLedgEntry1);
                            CustLedgEntry1.SETRANGE("Document No.", GLEntry."Document No.");
                            if CustLedgEntry1.FIND('-') then
                                repeat
                                    if i < 5 then begin
                                        i := i + 1;
                                        if CustLedgEntry1."Currency Code" <> '' then begin
                                            if CustLedgEntry1."Adjusted Currency Factor" <> 0 then begin
                                                PExch[i] := ROUND(1 / CustLedgEntry1."Adjusted Currency Factor", 0.00001, '=');
                                            end;
                                            PCurr := COPYSTR(CustLedgEntry1."Currency Code", 1, 3);
                                            ExchText := 'EXCH. RATE'
                                        end;
                                    end;
                                until (CustLedgEntry1.NEXT = 0);
                            for i := 1 to 4 do begin
                                for j := i + 1 to 5 do begin
                                    if PExch[i] = PExch[j] then
                                        PExch[j] := 0;
                                end;
                            end;
                            CLEAR(ExchangeRate);
                            for i := 1 to 5 do begin
                                if PExch[i] <> 0 then begin
                                    if ExchangeRate = '' then
                                        ExchangeRate := FORMAT(Round(PExch[i], 0.01, '='))
                                    else
                                        ExchangeRate := ExchangeRate + ', ' + FORMAT(Round(PExch[i], 0.01, '='));
                                end;
                            end;
                        end;
                        GLEntry.NEXT;
                    end;

                    // Display Pay to in Check Ledger Entry if Exist //
                    CLEAR(GLEntry);
                    CLEAR(PayTo);
                    CLEAR(OldPayto);
                    GLEntry.SETRANGE("Document No.", "Document No.");
                    GLEntry.NEXT;
                    for a := 1 to GLEntry.COUNT do begin
                        CLEAR(CheckLedger);
                        CheckLedger.SETRANGE(CheckLedger."Entry No.", GLEntry."Entry No.");
                        CheckLedger.NEXT;
                        if (OldPayto <> CheckLedger."AVF_Pay-to Description") and (CheckLedger."AVF_Pay-to Description" <> '') and (CheckLedger.COUNT > 0) then begin
                            if PayTo = '' then
                                PayTo := CheckLedger."AVF_Pay-to Description"
                            else
                                PayTo := PayTo + ', ' + CheckLedger."AVF_Pay-to Description";
                            OldPayto := CheckLedger."AVF_Pay-to Description";
                        end;
                        GLEntry.NEXT;
                    end;

                    if PayTo = '' then begin
                        // Pay To
                        CLEAR(PayTo);
                        CLEAR(WHTEntry);
                        CLEAR(OldVend);
                        WHTEntry.SETRANGE("Original Document No.", "Document No.");
                        WHTEntry.NEXT;
                        CLEAR(a);
                        for a := 1 to WHTEntry.COUNT do begin
                            CLEAR(Vendor);
                            if (OldVend = '') or (OldVend <> WHTEntry."Actual Vendor No.") then begin
                                Vendor.SETRANGE("No.", WHTEntry."Actual Vendor No.");
                                Vendor.NEXT;
                                if Vendor.COUNT > 0 then begin
                                    if PayTo = '' then begin
                                        if Vendor.Name <> '' then
                                            PayTo := Vendor.Name
                                        else
                                            PayTo := Vendor."Name 2";
                                    end
                                    else begin
                                        if Vendor.Name <> '' then
                                            PayTo := PayTo + ', ' + Vendor.Name
                                        else
                                            PayTo := PayTo + ', ' + Vendor."Name 2";
                                    end;
                                end;
                                OldVend := WHTEntry."Actual Vendor No.";
                                WHTEntry.NEXT;
                            end;
                        end;
                    end;

                    if PayTo = '' then begin
                        CLEAR(Vendor);
                        CLEAR(OldVend);
                        CLEAR(GLEntry);
                        GLEntry.SETRANGE("Document No.", "Document No.");
                        GLEntry.NEXT;
                        CLEAR(a);
                        for a := 1 to GLEntry.COUNT do begin
                            if GLEntry."Bal. Account Type" = GLEntry."Bal. Account Type"::Vendor then begin
                                if (OldVend = '') or (OldVend <> GLEntry."Bal. Account No.") then begin
                                    CLEAR(Vendor);
                                    Vendor.SETRANGE("No.", GLEntry."Bal. Account No.");
                                    Vendor.NEXT;
                                    if PayTo = '' then
                                        if Vendor.Name = '' then
                                            PayTo := Vendor."Name 2"
                                        else
                                            PayTo := Vendor.Name
                                    else
                                        if Vendor.Name = '' then
                                            PayTo := PayTo + ', ' + Vendor."Name 2"
                                        else
                                            PayTo := PayTo + ', ' + Vendor.Name;
                                end;
                                OldVend := GLEntry."Bal. Account No.";
                            end
                            else
                                if Vendor.GET(GLEntry."G/L Account No.") then begin
                                    CLEAR(Vendor);
                                    if (OldVend = '') or (OldVend <> GLEntry."G/L Account No.") then begin
                                        Vendor.SETRANGE("No.", GLEntry."G/L Account No.");
                                        Vendor.NEXT;
                                        if Vendor.Name = '' then
                                            PayTo := Vendor."Name 2"
                                        else
                                            PayTo := Vendor.Name;
                                        OldVend := GLEntry."G/L Account No.";
                                    end;
                                end;
                            GLEntry.NEXT;
                        end;

                        if PayTo = '' then begin
                            CLEAR(GLEntry);
                            GLEntry.SETRANGE("Document No.", "Document No.");
                            GLEntry.NEXT;
                            PayTo := Description;
                        end;
                    end;


                    // GET Check No.
                    //AVNSDSTD  02/04/2014  Add Code Show Check Date
                    CLEAR(AVCheckDate);
                    //C-AVNSDSTD  02/04/2014  Add Code Show Check Date

                    CLEAR(CheckLedger);
                    CLEAR(CheckNo);
                    CLEAR(OldCheck);
                    CheckLedger.SETRANGE("Document No.", "Document No.");
                    CheckLedger.NEXT;

                    for i := 1 to CheckLedger.COUNT do begin
                        if (OldCheck <> CheckLedger."Check No.") then
                            if CheckNo = '' then begin
                                CheckNo := CheckLedger."Check No.";
                                //AVNSDSTD  02/04/2014  Add Code Show Check Date
                                AVCheckDate := FORMAT(CheckLedger."Check Date");
                                //C-AVNSDSTD  02/04/2014  Add Code Show Check Date
                            end else begin
                                CheckNo := CheckNo + ', ' + CheckLedger."Check No.";
                                //AVNSDSTD  02/04/2014  Add Code Show Check Date
                                AVCheckDate := AVCheckDate + ', ' + FORMAT(CheckLedger."Check Date");
                                //C-AVNSDSTD  02/04/2014  Add Code Show Check Date
                            end;
                        OldCheck := CheckLedger."Check No.";
                        CheckLedger.NEXT;
                    end;

                    CLEAR(SourceCode);
                    SourceCode.SETRANGE(Code, "Source Code");
                    SourceCode.NEXT;


                    if (OldDoc <> "Document No.") then begin
                        CLEAR(Running);
                        CLEAR(TotalCreditAmount);
                        CLEAR(TotalDebitAmount);
                        //CLEAR(NetRec);
                        CLEAR(ExchText);
                        CLEAR(PCurr);
                        CLEAR(PExch);
                        CLEAR(BankAcctNo);
                        CLEAR(ReceivedFrom);
                        CLEAR(GLEntry);
                        CLEAR(Vendor);
                        CLEAR(Customer);
                        GLEntry.SETRANGE("Document No.", "Document No.");
                        GLEntry.NEXT;
                        for a := 1 to GLEntry.COUNT do begin
                            if GLEntry."Source Type" = GLEntry."Source Type"::Vendor then begin
                                Vendor.SETRANGE("No.", GLEntry."Source No.");
                                Vendor.NEXT;
                                if Vendor.Name = '' then
                                    ReceivedFrom := Vendor."No." + ' : ' + Vendor."Name 2"
                                else
                                    ReceivedFrom := Vendor."No." + ' : ' + Vendor.Name;
                            end
                            else
                                if GLEntry."Source Type" = GLEntry."Source Type"::Customer then begin
                                    Customer.SETRANGE("No.", GLEntry."Source No.");
                                    Customer.NEXT;
                                    ReceivedFrom := Customer."No." + ' : ' + Customer.Name
                                end
                                else
                                    if (ReceivedFrom = '') and (GLEntry."Source Type" <> GLEntry."Source Type"::"Bank Account") then
                                        ReceivedFrom := GLEntry.Description;
                            GLEntry.NEXT;
                        end;
                        if ReceivedFrom = '' then ReceivedFrom := Description;

                        CLEAR(GLEntry);
                        GLEntry.SETRANGE("Document No.", "Document No.");
                        if GLEntry.FIND('-') then
                            repeat
                                if (GLEntry."Source Type" = GLEntry."Source Type"::"Bank Account") and (BankAcctNo = '') then begin
                                    CLEAR(BankAccount);
                                    BankAccount.SETRANGE("No.", GLEntry."Source No.");
                                    if BankAccount.FIND('-') then begin
                                        BankPosting := BankAccount."Bank Acc. Posting Group";
                                    end;
                                    CLEAR(BankPostingGroup);
                                    BankPostingGroup.SETRANGE(Code, BankPosting);
                                    if BankPostingGroup.FIND('-') then BankAcctNo := BankPostingGroup."G/L Account No.";
                                end;
                            until (GLEntry.NEXT = 0);
                    end;
                    OldDoc := "Document No.";

                    CLEAR(ExchangeRate);
                    if "Source Type" = "Source Type"::Customer then begin
                        CLEAR(CustLedgEntry1);
                        CustLedgEntry1.SETRANGE("Document No.", "Document No.");
                        if CustLedgEntry1.FIND('-') then
                            repeat
                                if i < 5 then begin
                                    i := i + 1;
                                    if CustLedgEntry1."Currency Code" <> '' then begin
                                        if CustLedgEntry1."Adjusted Currency Factor" <> 0 then begin
                                            PExch[i] := ROUND(1 / CustLedgEntry1."Adjusted Currency Factor", 0.00001, '=');
                                        end;
                                        PCurr := COPYSTR(CustLedgEntry1."Currency Code", 1, 3);
                                        ExchText := 'EXCH. RATE'
                                    end;
                                end;
                            until (CustLedgEntry1.NEXT = 0);
                        for i := 1 to 4 do begin
                            for j := i + 1 to 5 do begin
                                if PExch[i] = PExch[j] then
                                    PExch[j] := 0;
                            end;
                        end;
                        for i := 1 to 5 do begin
                            if PExch[i] <> 0 then begin
                                if ExchangeRate = '' then
                                    ExchangeRate := FORMAT(Round(PExch[i], 0.01, '='))
                                else
                                    ExchangeRate := ExchangeRate + ', ' + FORMAT(Round(PExch[i], 0.01, '='));
                            end;
                        end;
                    end;

                    Running := Running + 1;

                    if ShowDTL then begin
                        TotalCreditAmount += ROUND("Credit Amount", 0.01, '=');
                        TotalDebitAmount += ROUND("Debit Amount", 0.01, '=');
                    end;

                    // Get G/L Account Description //
                    CLEAR(GLAccount);
                    GLAccount.SETRANGE("No.", "G/L Account No.");
                    GLAccount.NEXT;

                    if "G/L Account No." = BankAcctNo then
                        NETPAID := NETPAID + Amount;
                end;

                trigger OnPreDataItem();
                begin
                    CLEAR(NETPAID);
                    LastFieldNo := FIELDNO("Document No.");
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
            dataitem("Find Applied Entry"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(TmpTBCustLedgerApplied_CustomerNo; TmpTBCustLedgerApplied."Customer No.")
                {
                }
                column(TmpTBCustLedgerApplied_DocumentNo; TmpTBCustLedgerApplied."Document No.")
                {
                }
                column(TmpTBCustLedgerApplied_ExternalDocumentNo; TmpTBCustLedgerApplied."External Document No.")
                {
                }
                column(TmpTBCustLedgerApplied_Description; TmpTBCustLedgerApplied.Description)
                {
                }
                column(AVAmountFCY; AVAmountFCY)
                {
                }
                column(ExchRate; ExchRate)
                {
                }
                column(DetailAmountLCY; DetailAmountLCY) // -AVDetailedCustLedger."Amount (LCY)")
                {
                }
                column(AmountLangB1_AmountLangB2; AmountLangB[1] + ' ' + AmountLangB[2])
                {
                }
                column(InvAMT; InvAMT)
                {
                }
                column(InvAMT_WHTAMT; InvAMT - WHTAMT)
                {
                }
                column(ShowFindAppliedEntry; ShowFindAppliedEntry)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CountApplied += 1;
                    if CountApplied <> 1 then
                        TmpTBCustLedgerApplied.NEXT;

                    ShowFindAppliedEntry := true;
                    CLEAR(AVAmountFCY);
                    CLEAR(ExchRate);
                    CLEAR(AVDetailedCustLedger);
                    AVDetailedCustLedger.SETCURRENTKEY("Entry No.");
                    AVDetailedCustLedger.SETRANGE("Cust. Ledger Entry No.", TmpTBCustLedgerApplied."Entry No.");
                    AVDetailedCustLedger.SETRANGE("Document No.", "G/L Entry"."Document No.");
                    if AVDetailedCustLedger.FINDFIRST then begin
                        if TmpTBCustLedgerApplied."Currency Code" <> '' then begin
                            if TmpTBCustLedgerApplied."Adjusted Currency Factor" <> 0 then begin
                                ExchRate := ROUND(1 / TmpTBCustLedgerApplied."Adjusted Currency Factor", 0.00001, '=');
                                AVAmountFCY := ROUND(-AVDetailedCustLedger.Amount);
                            end;
                        end;
                    end;

                    CLEAR(DetailAmountLCY);
                    CLEAR(AVDetailedCustLedger);
                    AVDetailedCustLedger.SETCURRENTKEY("Entry No.");
                    AVDetailedCustLedger.SETRANGE("Cust. Ledger Entry No.", TmpTBCustLedgerApplied."Entry No.");
                    AVDetailedCustLedger.SETRANGE("Document No.", "G/L Entry"."Document No.");
                    //AVDetailedCustLedger.SETFILTER("Source Code",'<>%1','UNAPPSALES');
                    if AVDetailedCustLedger.FINDFIRST then
                        repeat
                            DetailAmountLCY += -AVDetailedCustLedger."Amount (LCY)";
                        until (AVDetailedCustLedger.NEXT = 0);

                    CLEAR(InvWHTEntry);
                    CLEAR(b);
                    InvWHTEntry.SETCURRENTKEY(InvWHTEntry."Document No.");
                    InvWHTEntry.SETRANGE("Document No.", TmpTBCustLedgerApplied."Document No.");
                    InvWHTEntry.NEXT;
                    for b := 1 to InvWHTEntry.COUNT do begin
                        WHTAMT := WHTAMT + InvWHTEntry."Amount (LCY)";
                        InvWHTEntry.NEXT;
                    end;

                    InvAMT := InvAMT + (-AVDetailedCustLedger."Amount (LCY)");

                    CheckReport.InitTextVariable;
                    CheckReport.FormatNoText(AmountLangB, InvAMT - WHTAMT, CurrencyCode)
                end;

                trigger OnPreDataItem();
                begin
                    CLEAR(CountApplied);
                    CLEAR(AllApplied);
                    CLEAR(WHTAMT);
                    CLEAR(InvAMT);

                    if (OldDocApplied <> "Group by PV No."."Document No.") then begin
                        FindApplnEntriesDtldtLedgEntry;
                    end;

                    if TmpTBCustLedgerApplied.FINDFIRST then;

                    SETRANGE(Number, 1, AllApplied);

                    OldDocApplied := "Group by PV No."."Document No.";
                end;
            }

            trigger OnAfterGetRecord();
            begin
                if (OldPV <> '') and (OldPV = "Document No.") then begin
                    CLEAR(xCheque);
                    CLEAR(xCash);
                    CLEAR(xTransfer);
                    CLEAR(xCredit);

                    ShowDTL := false;
                    CurrReport.SKIP;
                end else
                    ShowDTL := true;
                OldPV := "Document No.";

                //If ShowDTL Then ShowInv := FALSE;

                CLEAR(GLENTB);
                GLENTB.SETCURRENTKEY("Entry No.");
                GLENTB.SETRANGE("Document No.", "Document No.");
                GLENTB.SETRANGE("Source Type", "Source Type"::"Bank Account");
                if GLENTB.FIND('-') then begin
                    repeat
                        if GLENTB."FNGN005_Type of Payment" = GLENTB."FNGN005_Type of Payment"::Check then
                            xCheque := 'X'
                        else
                            if GLENTB."FNGN005_Type of Payment" = GLENTB."FNGN005_Type of Payment"::Cash then
                                xCash := 'X'
                            else
                                if GLENTB."FNGN005_Type of Payment" = GLENTB."FNGN005_Type of Payment"::Transfer then
                                    xTransfer := 'X'
                                else
                                    if GLENTB."FNGN005_Type of Payment" = GLENTB."FNGN005_Type of Payment"::"Credit Card" then
                                        xCredit := 'X';
                    until GLENTB.NEXT = 0;
                end;
            end;

            trigger OnPreDataItem();
            begin
                CLEAR("AVPVNo.");
                CLEAR(OldDocApplied);
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
                        Caption = 'ShowDimension';
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
        CheckNo: Text[100];
        i: Integer;
        DimensionText: Text[500];
        ShowDimension: Boolean;
        DimensionValue: Record "Dimension Value";
        OldDoc: Code[20];
        BankAccount: Record "Bank Account";
        BankCode: Code[20];
        GLEntry: Record "G/L Entry";
        InPaymentOf: Text[100];
        BankName: Text[100];
        Customer: Record Customer;
        Vendor: Record Vendor;
        PayTo: Text[200];
        a: Integer;
        WHTEntry: Record "AVF_WHT Entry";
        OldVend: Text[100];
        OldPV: Code[20];
        ShowDTL: Boolean;
        InvWHTEntry: Record "AVF_WHT Entry";
        b: Integer;
        WHTAMT: Decimal;
        InvAMT: Decimal;
        CustLedgEntry1: Record "Cust. Ledger Entry";
        CustLedgEntry2: Record "Cust. Ledger Entry";
        CustLedgerApplied: Record "Cust. Ledger Entry";
        ShowInv: Boolean;
        c1: Integer;
        c2: Integer;
        AmountLangB: array[2] of Text[80];
        CheckReport: Report Check;
        CurrencyCode: Text[30];
        OldPayto: Text[100];
        PVClosedBy: Boolean;
        OldDocNo: Code[20];
        BankAcctPostingGroup: Record "Bank Account Posting Group";
        BankAcctNo: Code[20];
        NETPAID: Decimal;
        NETTEXT: array[2] of Text[80];
        OldCheck: Code[20];
        ExchRate: Decimal;
        ExchText: Text[50];
        Cash: Text[1];
        Chq: Text[1];
        ReceivedFrom: Text[200];
        BankPostingGroup: Record "Bank Account Posting Group";
        OPV: Text[30];
        SDTL: Boolean;
        SalesInvLine: Record "Sales Invoice Line";
        INVAmount: Decimal;
        Currency: Text[30];
        BankPosting: Code[10];
        Comment: Text[1024];
        PCurr: Text[30];
        PExch: array[5] of Decimal;
        DtlCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        "IAmt(LCY)": Decimal;
        "IAmt(FCY)": Decimal;
        Line: Integer;
        InvLine: Integer;
        ExchangeRate: Text[30];
        j: Integer;
        "AVPVNo.": Code[20];
        ApproveBy: Text[100];
        AVGenJnlBatch: Record "Gen. Journal Batch";
        ShowGenJnlBatchRemark: Text[100];
        AllApplied: Integer;
        CheckDate: Date;
        CountApplied: Integer;
        AVCustLedger: Record "Cust. Ledger Entry";
        TmpTBCustLedgerApplied: Record "Cust. Ledger Entry" temporary;
        AVDetailedCustLedger: Record "Detailed Cust. Ledg. Entry";
        AVAmountFCY: Decimal;
        AVGLEntry: Record "G/L Entry";
        OldDocApplied: Code[20];
        BankBranch: Text[60];
        xCredit: Text[2];
        xCheque: Text[2];
        xCash: Text[2];
        xTransfer: Text[2];
        GLENTB: Record "G/L Entry";
        DetailAmountLCY: Decimal;
        TotalFor: Label '"Total for "';
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;
        ShowFindAppliedEntry: Boolean;
        AVCheckDate: Text[250];

    procedure FindApplnEntriesDtldtLedgEntry();
    var
        DtldcustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DtldcustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
    begin
        CLEAR(TmpTBCustLedgerApplied);
        TmpTBCustLedgerApplied.DELETEALL;

        CLEAR(AVGLEntry);
        AVGLEntry.SETCURRENTKEY(AVGLEntry."Source Code", AVGLEntry."Document No.");
        AVGLEntry.SETRANGE(AVGLEntry."Document No.", "Group by PV No."."Document No.");
        if AVGLEntry.FINDFIRST then begin
            repeat
                DtldcustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
                DtldcustLedgEntry1.SETRANGE("Cust. Ledger Entry No.", AVGLEntry."Entry No.");
                DtldcustLedgEntry1.SETRANGE(Unapplied, false);
                if DtldcustLedgEntry1.FIND('-') then begin
                    repeat
                        if DtldcustLedgEntry1."Cust. Ledger Entry No." =
                          DtldcustLedgEntry1."Applied Cust. Ledger Entry No."
                        then begin
                            DtldcustLedgEntry2.INIT;
                            DtldcustLedgEntry2.SETCURRENTKEY("Applied Cust. Ledger Entry No.", "Entry Type");
                            DtldcustLedgEntry2.SETRANGE(
                              "Applied Cust. Ledger Entry No.", DtldcustLedgEntry1."Applied Cust. Ledger Entry No.");
                            DtldcustLedgEntry2.SETRANGE("Entry Type", DtldcustLedgEntry2."Entry Type"::Application);
                            DtldcustLedgEntry2.SETRANGE(Unapplied, false);
                            if DtldcustLedgEntry2.FIND('-') then begin
                                repeat
                                    if DtldcustLedgEntry2."Cust. Ledger Entry No." <>
                                      DtldcustLedgEntry2."Applied Cust. Ledger Entry No."
                                    then begin
                                        AVCustLedger.SETCURRENTKEY("Entry No.");
                                        AVCustLedger.SETRANGE("Entry No.", DtldcustLedgEntry2."Cust. Ledger Entry No.");
                                        if AVCustLedger.FIND('-') then begin
                                            CLEAR(TmpTBCustLedgerApplied);
                                            TmpTBCustLedgerApplied.INIT;
                                            TmpTBCustLedgerApplied.TRANSFERFIELDS(AVCustLedger);
                                            TmpTBCustLedgerApplied.INSERT;
                                            AllApplied += 1;
                                        end
                                    end;
                                until DtldcustLedgEntry2.NEXT = 0;
                            end;
                        end else begin
                            AVCustLedger.SETCURRENTKEY("Entry No.");
                            AVCustLedger.SETRANGE("Entry No.", DtldcustLedgEntry1."Applied Cust. Ledger Entry No.");
                            if AVCustLedger.FIND('-') then begin
                                CLEAR(TmpTBCustLedgerApplied);
                                TmpTBCustLedgerApplied.INIT;
                                TmpTBCustLedgerApplied.TRANSFERFIELDS(AVCustLedger);
                                TmpTBCustLedgerApplied.INSERT;
                                AllApplied += 1;
                            end;
                        end;
                    until DtldcustLedgEntry1.NEXT = 0;
                end;
            until AVGLEntry.NEXT = 0;
        end;
    end;
}

