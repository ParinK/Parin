report 50046 "INT_Cheque BBL"
{
    // version AVTHLC1.0

    // Microsoft Dynamic NAV
    // ----------------------------------------
    // Project: AVisionAddon VIP I
    // AVNVKSTD : Natee Visedkajee
    // 
    // No.   Date         Sign       Description
    // --------------------------------------------------
    // 001   25.07.2012   AVNVKSTD   VIP I.
    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/ChequeBBL.rdl';
    Caption = 'Cheque';


    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.");
            RequestFilterFields = "Document No.", "Line No.";
            column(DateSplit1; DateSplit[1])
            {
            }
            column(DateSplit2; DateSplit[2])
            {
            }
            column(DateSplit3; DateSplit[3])
            {
            }
            column(DateSplit4; DateSplit[4])
            {
            }
            column(DateSplit5; DateSplit[5])
            {
            }
            column(DateSplit6; DateSplit[6])
            {
            }
            column(DateSplit7; DateSplit[7])
            {
            }
            column(DateSplit8; DateSplit[8])
            {
            }
            column(Payto; Payto)
            {
            }
            column(AMT; '**' + FORMAT(ChqAmt, 0, '<Precision,2:2><Standard Format,0>') + '**')
            {
            }
            column(WordsTextThai; WordsText)
            {
            }
            column(WordsTextEng; AmountLangB[1] + ' ' + AmountLangB[2])
            {
            }
            column(Type; Type)
            {
            }
            column(Thai; Thai)
            {
            }

            trigger OnAfterGetRecord();
            begin
                if OlddocNo <> "Document No." then begin
                    CLEAR(ChqAmt);
                    //Get Check Name
                    case "Account Type" of
                        "Account Type"::"G/L Account":
                            begin
                                CLEAR(CheckToAddr);
                                CheckToAddr[1] := Description;
                            end;
                        "Account Type"::Customer:
                            begin
                                Cust.GET("Account No.");
                                Cust.Contact := '';
                                FormatAddr.Customer(CheckToAddr, Cust);
                            end;
                        "Account Type"::Vendor:
                            begin
                                Vend.GET("Account No.");
                                Vend.Contact := '';
                                FormatAddr.Vendor(CheckToAddr, Vend);
                            end;
                        "Account Type"::"Bank Account":
                            begin
                                BankAcc.GET("Account No.");
                                BankAcc.Contact := '';
                                FormatAddr.BankAcc(CheckToAddr, BankAcc);
                            end;
                        "Account Type"::"Fixed Asset":
                            FIELDERROR("Account Type");
                    end;

                    //Display "Actual Vendor Account No." in Preview if exist//
                    if "AVF_Actual Vendor No." <> '' then begin
                        CLEAR(ActualVend);
                        ActualVend.SETRANGE("No.", "AVF_Actual Vendor No.");
                        ActualVend.NEXT;
                        ActualVend.Contact := '';
                        FormatAddr.Vendor(CheckToAddr, ActualVend);
                    end;

                    CLEAR(ChequeDate);
                    GenJnlLine.RESET;
                    GenJnlLine.SETFILTER("Journal Template Name", "Journal Template Name");
                    GenJnlLine.SETFILTER("Journal Batch Name", "Journal Batch Name");
                    GenJnlLine.SETFILTER("Document No.", "Document No.");
                    GenJnlLine.SETRANGE("Line No.", "Line No.");
                    GenJnlLine.SETFILTER("AVF_Check Date", '<>%1', 0D);
                    if GenJnlLine.FIND('-') then begin
                        ChequeDate := GenJnlLine."AVF_Check Date";


                        if GenJnlLine."AVF_Pay-to Description" <> '' then begin
                            Payto := GenJnlLine."AVF_Pay-to Description" + ' ' + GenJnlLine."INT_Pay-to Description 2";
                            CheckToAddr[2] := '';
                            CheckToAddr[3] := '';
                            CheckToAddr[4] := '';
                        end else
                            Payto := CheckToAddr[1];
                    end;

                    //AVPKJVIP.001 14/11/2019
                    if type = Type::CASH then
                        if Thai then
                            Payto := 'เงินสด'
                        else
                            Payto := 'CASH';
                    if Type = Type::" " then
                        Payto := '';
                    //C-AVPKJVIP.001 14/11/2019

                    if Payto = '' then
                        if ("Account Type" = "Account Type"::Vendor) and ("Account No." <> '') then
                            if Vend.GET("Account No.") then
                                Payto := Vend.Name + ' ' + Vend."Name 2";

                    if ChequeDate = 0D then
                        ERROR('Check Date in Document %1 cannot be blank.', "Document No.")
                    else begin
                        if Thai then begin
                            DateSplitPart(FORMAT(ChequeDate, 0, '<Day,2>')
                                          + FORMAT(ChequeDate, 0, '<Month,2>')
                                          + FORMAT(DATE2DMY(ChequeDate, 3) + 543));
                        end
                        else begin
                            DateSplitPart(FORMAT(ChequeDate, 0, '<Day,2>')
                                          + FORMAT(ChequeDate, 0, '<Month,2>')
                                          + FORMAT(ChequeDate, 0, '<Year4>'));
                        end;
                    end;
                end;
                OlddocNo := "Document No.";

                CLEAR(GenJnlLine);

                if "AVF_Check No." <> '' then
                    ChqAmt := ChqAmt + Amount;

                ChqAmt := ABS(ChqAmt);
                ChqAmt := ROUND(ChqAmt, 0.01, '=');


                CheckReport.InitTextVariable;
                CheckReport.FormatNoText(AmountLangB, ChqAmt, CurrencyCode);

                ThaiAmountWords(ChqAmt);

                if AmountLangB[2] = '' then begin
                    POS := STRPOS(AmountLangB[1], 'AND 0/100');
                    LEN := STRLEN(AmountLangB[1]);
                    if POS > 0 then AmountLangB[1] := COPYSTR(AmountLangB[1], 1, POS - 1) + 'ONLY';
                end
                else begin
                    POS := STRPOS(AmountLangB[2], 'AND 0/100');
                    LEN := STRLEN(AmountLangB[2]);
                    if POS > 0 then AmountLangB[2] := COPYSTR(AmountLangB[2], 1, POS - 1) + 'ONLY';
                end;
                if AmountLangB[2] = '' then
                    AmountLangB[1] := AmountLangB[1] + '****'
                else
                    AmountLangB[2] := AmountLangB[2] + '****';
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
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
                    field(Type; Type)
                    {
                        ApplicationArea = All;
                    }
                    field(Thai; Thai)
                    {
                        ApplicationArea = All;
                        Caption = 'Amount Text in Thai';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            Thai := true;
        end;
    }

    labels
    {
    }

    var
        Cust: Record Customer;
        BankAcc: Record "Bank Account";
        ActualVend: Record Vendor;
        Vend: Record Vendor;
        VendName: Text[100];
        ChqAmt: Decimal;
        VendLedgEntry: Record "Vendor Ledger Entry";
        VendLedgEntry2: Record "Vendor Ledger Entry";
        WordsText: Text[500];
        WordsLen: Integer;
        CheckReport: Report Check;
        AmountLangB: array[2] of Text[100];
        CurrencyCode: Code[10];
        POS: Integer;
        LEN: Integer;
        CheckToAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        Payto: Text[250];
        RemPVAMT: Decimal;
        Month: Text[50];
        WHTManagement: Codeunit AVF_WHTManagement;
        Thai: Boolean;
        Type: Option " ","A/C PAYEE ONLY",CASH,"Or Beaver","& CO.","Line Cross";
        CompanyInfo: Record "Company Information";
        DateSplit: array[8] of Text[1];
        ChequeDocNo: Code[20];
        ChequeDate: Date;
        GenJnlLine: Record "Gen. Journal Line";
        OlddocNo: Code[20];

        //AVPKJVIP.001 13/11/2019
        JnlTempName: Code[10];
        JnlBatchName: Code[20];
        DocNo: Code[20];
        LineNo: Integer;
    //C-AVPKJVIP.001 13/11/2019

    procedure ThaiAmountWords(AMT: Decimal);
    var
        Exponent: Integer;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
    begin
        WordsText := '**';
        if AMT > 1 then begin
            for Exponent := 4 downto 1 do begin
                Ones := AMT div POWER(1000, Exponent - 1);
                if Exponent = 2 then
                    if WordsText <> '**' then
                        WordsText := WordsText + 'ล้าน';

                if Ones <> 0 then begin
                    Hundreds := Ones div 100;
                    Tens := (Ones mod 100) div 10;
                    Ones := Ones mod 10;
                    if Hundreds > 0 then
                        Word(Hundreds, Exponent, 100);
                    if Tens > 0 then
                        Word(Tens, Exponent, 10);
                    if Ones > 0 then
                        Word(Ones, Exponent, 1);

                    AMT := AMT - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
                end;
            end;

            WordsText := WordsText + 'บาท';

            AMT := AMT * 100;
            if AMT <= 0 then
                WordsText := WordsText + 'ถ้วน'
            else
                Stang(ROUND(AMT, 1));
        end
        else begin
            AMT := AMT * 100;
            if AMT <> 0 then
                Stang(ROUND(AMT, 1))
            else
                WordsText := WordsText + 'ศูนย์บาทถ้วน';
        end;
        WordsText := WordsText + '**';
    end;

    procedure Word(Number: Integer; Expo: Integer; Position: Integer);
    begin
        if Number > 2 then begin
            if Number = 9 then
                WordsText := WordsText + 'เก้า'
            else
                if Number = 8 then
                    WordsText := WordsText + 'แปด'
                else
                    if Number = 7 then
                        WordsText := WordsText + 'เจ็ด'
                    else
                        if Number = 6 then
                            WordsText := WordsText + 'หก'
                        else
                            if Number = 5 then
                                WordsText := WordsText + 'ห้า'
                            else
                                if Number = 4 then
                                    WordsText := WordsText + 'สี่'
                                else
                                    if Number = 3 then
                                        WordsText := WordsText + 'สาม';

            InsertTags(Expo, Position);
        end
        else
            if Number = 2 then begin
                if Position = 10 then
                    if (Expo mod 2) = 1 then
                        WordsText := WordsText + 'ยี่'
                    else
                        WordsText := WordsText + 'สอง'
                else
                    WordsText := WordsText + 'สอง';

                InsertTags(Expo, Position);
            end
            else
                if Number = 1 then begin
                    if Position = 1 then
                        if (Expo mod 2) = 1 then
                            if WordsText = '**' then
                                WordsText := WordsText + 'หนึ่ง'
                            else
                                WordsText := WordsText + 'เอ็ด'
                        else
                            WordsText := WordsText + 'หนึ่ง'
                    else
                        if Position = 10 then
                            if (Expo mod 2) = 1 then
                                WordsText := WordsText
                            else
                                WordsText := WordsText + 'หนึ่ง'
                        else
                            if Position = 100 then
                                WordsText := WordsText + 'หนึ่ง';

                    InsertTags(Expo, Position);
                end
                else
                    if Number = 0 then
                        if (Expo mod 2) = 1 then
                            InsertTags(Expo, Position)
    end;

    procedure InsertTags(Expon: Integer; POS: Integer);
    begin
        if Expon = 4 then
            if POS = 100 then
                WordsText := WordsText + 'แสน'
            else
                if POS = 10 then
                    WordsText := WordsText + 'หมื่น'
                else
                    if POS = 1 then
                        WordsText := WordsText + 'พัน';

        if Expon = 3 then
            if POS = 100 then
                WordsText := WordsText + 'ร้อย'
            else
                if POS = 10 then
                    WordsText := WordsText + 'สิบ';
        //ELSE IF POS = 1 THEN
        //WordsText := WordsText + 'ล้าน';

        if Expon = 2 then
            if POS = 100 then
                WordsText := WordsText + 'แสน'
            else
                if POS = 10 then
                    WordsText := WordsText + 'หมื่น'
                else
                    if POS = 1 then
                        WordsText := WordsText + 'พัน';

        if Expon = 1 then
            if POS = 100 then
                WordsText := WordsText + 'ร้อย'
            else
                if POS = 10 then
                    WordsText := WordsText + 'สิบ';
        //ELSE IF POS = 1 THEN
        //WordsText := WordsText + 'บาท';
    end;

    procedure Stang(StangAmt: Integer);
    var
        One: Integer;
        Ten: Integer;
    begin
        Ten := StangAmt div 10;
        One := StangAmt mod 10;

        if Ten = 9 then
            WordsText := WordsText + 'เก้าสิบ'
        else
            if Ten = 8 then
                WordsText := WordsText + 'แปดสิบ'
            else
                if Ten = 7 then
                    WordsText := WordsText + 'เจ็ดสิบ'
                else
                    if Ten = 6 then
                        WordsText := WordsText + 'หกสิบ'
                    else
                        if Ten = 5 then
                            WordsText := WordsText + 'ห้าสิบ'
                        else
                            if Ten = 4 then
                                WordsText := WordsText + 'สี่สิบ'
                            else
                                if Ten = 3 then
                                    WordsText := WordsText + 'สามสิบ'
                                else
                                    if Ten = 2 then
                                        WordsText := WordsText + 'ยี่สิบ'
                                    else
                                        if Ten = 1 then
                                            WordsText := WordsText + 'สิบ';

        if One = 9 then
            WordsText := WordsText + 'เก้า'
        else
            if One = 8 then
                WordsText := WordsText + 'แปด'
            else
                if One = 7 then
                    WordsText := WordsText + 'เจ็ด'
                else
                    if One = 6 then
                        WordsText := WordsText + 'หก'
                    else
                        if One = 5 then
                            WordsText := WordsText + 'ห้า'
                        else
                            if One = 4 then
                                WordsText := WordsText + 'สี่'
                            else
                                if One = 3 then
                                    WordsText := WordsText + 'สาม'
                                else
                                    if One = 2 then
                                        WordsText := WordsText + 'สอง'
                                    else
                                        if One = 1 then
                                            if Ten = 0 then
                                                WordsText := WordsText + 'หนึ่ง'
                                            else
                                                WordsText := WordsText + 'เอ็ด';

        WordsText := WordsText + 'สตางค์';
    end;

    procedure DateSplitPart(dataDate: Text[8]);
    begin
        CLEAR(DateSplit);
        if STRLEN(dataDate) > 7 then begin
            DateSplit[1] := COPYSTR(dataDate, 1, 1);
            DateSplit[2] := COPYSTR(dataDate, 2, 1);
            DateSplit[3] := COPYSTR(dataDate, 3, 1);
            DateSplit[4] := COPYSTR(dataDate, 4, 1);
            DateSplit[5] := COPYSTR(dataDate, 5, 1);
            DateSplit[6] := COPYSTR(dataDate, 6, 1);
            DateSplit[7] := COPYSTR(dataDate, 7, 1);
            DateSplit[8] := COPYSTR(dataDate, 8, 1);

        end;
    end;
}

