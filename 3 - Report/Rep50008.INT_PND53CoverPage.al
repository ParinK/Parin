report 50008 "INT_PND 53 - Cover Page"
{
    // version AVFTH1.0

    // Microsoft Dynamic NAV
    // ----------------------------------------
    // Project: Localization TH
    // AVNVKSTD : Natee Visedkajee
    // 
    // No.   Date         Sign       Description
    // --------------------------------------------------
    // 001   04.07.2012   AVNVKSTD   Localization.
    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/PND 53 - Cover Page.rdl';
    Caption = 'PND 53 - Cover Page';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("WHT Entry"; "AVF_WHT Entry")
        {
            DataItemTableView = SORTING("WHT Report", "WHT Report Line No") WHERE("Document Type" = FILTER(Payment), "Amount (LCY)" = FILTER(<> 0), "Void Check" = FILTER(false), "Cancel Line" = CONST(false), "WHT Report" = CONST("Por Ngor Dor 53"));
            PrintOnlyifDetail = false;
            column(VAT01; COPYSTR(Companyinfo."VAT Registration No.", 1, 1))
            {
            }
            column(VAT02; COPYSTR(Companyinfo."VAT Registration No.", 2, 1))
            {
            }
            column(VAT03; COPYSTR(Companyinfo."VAT Registration No.", 3, 1))
            {
            }
            column(VAT04; COPYSTR(Companyinfo."VAT Registration No.", 4, 1))
            {
            }
            column(VAT05; COPYSTR(Companyinfo."VAT Registration No.", 5, 1))
            {
            }
            column(VAT06; COPYSTR(Companyinfo."VAT Registration No.", 6, 1))
            {
            }
            column(VAT07; COPYSTR(Companyinfo."VAT Registration No.", 7, 1))
            {
            }
            column(VAT08; COPYSTR(Companyinfo."VAT Registration No.", 8, 1))
            {
            }
            column(VAT09; COPYSTR(Companyinfo."VAT Registration No.", 9, 1))
            {
            }
            column(VAT10; COPYSTR(Companyinfo."VAT Registration No.", 10, 1))
            {
            }
            column(VAT11; COPYSTR(Companyinfo."VAT Registration No.", 11, 1))
            {
            }
            column(VAT12; COPYSTR(Companyinfo."VAT Registration No.", 12, 1))
            {
            }
            column(VAT13; COPYSTR(Companyinfo."VAT Registration No.", 13, 1))
            {
            }
            column(CompanyinfoName; Companyinfo.Name)
            {
            }
            column(LogoPND53; Companyinfo."AVF_Logo PND 53")
            {
            }
            column(CompanyinfoPNDadd1; Companyinfo."AVF_PND Add 1")
            {
            }
            column(CompanyinfoPNDadd2; Companyinfo."AVF_PND Add 2")
            {
            }
            column(CompanyinfoPNDadd3; Companyinfo."AVF_PND Add 3")
            {
            }
            column(CompanyinfoPNDadd4; Companyinfo."AVF_PND Add 4")
            {
            }
            column(CompanyinfoPNDadd5; Companyinfo."AVF_PND Add 5")
            {
            }
            column(CompanyinfoPNDadd6; Companyinfo."AVF_PND Add 6")
            {
            }
            column(CompanyinfoPNDadd7; Companyinfo."AVF_PND Add 7")
            {
            }
            column(CompanyinfoPNDadd8; Companyinfo."AVF_PND Add 8")
            {
            }
            column(CompanyinfoPNDadd9; Companyinfo."AVF_PND Add 9")
            {
            }
            column(CompanyinfoPNDadd10; Companyinfo."AVF_PND Add 10")
            {
            }
            column(CompanyinfoPNDadd11; Companyinfo."AVF_PND Add 11")
            {
            }
            column(CompanyinfoPosCode1; COPYSTR(Companyinfo."Post Code", 1, 1))
            {
            }
            column(CompanyinfoPosCode2; COPYSTR(Companyinfo."Post Code", 2, 1))
            {
            }
            column(CompanyinfoPosCode3; COPYSTR(Companyinfo."Post Code", 3, 1))
            {
            }
            column(CompanyinfoPosCode4; COPYSTR(Companyinfo."Post Code", 4, 1))
            {
            }
            column(CompanyinfoPosCode5; COPYSTR(Companyinfo."Post Code", 5, 1))
            {
            }
            column(CompanyinfoPhoneNo; Companyinfo."Phone No.")
            {
            }
            column(TxtSubmit1; TxtSubmit[1])
            {
            }
            column(TxtSubmit2; TxtSubmit[2])
            {
            }
            column(SentTime; FORMAT(SentTime))
            {
            }
            column(Yearthai; FORMAT(Year + 543))
            {
            }
            column(CheckMonth1; CheckMonth[1])
            {
            }
            column(CheckMonth2; CheckMonth[2])
            {
            }
            column(CheckMonth3; CheckMonth[3])
            {
            }
            column(CheckMonth4; CheckMonth[4])
            {
            }
            column(CheckMonth5; CheckMonth[5])
            {
            }
            column(CheckMonth6; CheckMonth[6])
            {
            }
            column(CheckMonth7; CheckMonth[7])
            {
            }
            column(CheckMonth8; CheckMonth[8])
            {
            }
            column(CheckMonth9; CheckMonth[9])
            {
            }
            column(CheckMonth10; CheckMonth[10])
            {
            }
            column(CheckMonth11; CheckMonth[11])
            {
            }
            column(CheckMonth12; CheckMonth[12])
            {
            }
            column(TxtRegulation1; TxtRegulation[1])
            {
            }
            column(TxtRegulation2; TxtRegulation[2])
            {
            }
            column(TxtRegulation3; TxtRegulation[3])
            {
            }
            column(NoOfRecord; FORMAT(NoOfRecord))
            {
            }
            column(TotalPage; FORMAT(TotalPage))
            {
            }
            /* column(Base; Base)
            {
            } */
            column(Amount; Amount)
            {
            }
            column(Net; Net)
            {
            }
            column(NetVat; NetVat)
            {
            }
            column(IncAmt; IncAmt)
            {
            }
            column(Total; Total)
            {
            }
            column(NoOfDoc; NoOfDoc)
            {
            }
            column(PostingDate_WHTEntry; "WHT Entry"."Posting Date")
            {
            }
            column(AppoveName; AppoveName)
            {
            }
            column(AppovePosition; AppovePosition)
            {
            }
            column(DateRequestSplit1; DateRequestSplit[1])
            {
            }
            column(DateRequestSplit2; DateRequestSplit[2])
            {
            }
            column(DateRequestSplit3; DateRequestSplit[3])
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(WHTProdPostingGroup);
                WHTProdPostingGroup.SetRange(Code, "WHT Entry"."WHT Prod. Posting Group");
                WHTProdPostingGroup.NEXT;


                if OldWHTCertificateNo <> "WHT Certificate No." then begin
                    CLEAR(OldWHT);
                    CLEAR(EarnType1);
                    CLEAR(EarnType2);
                    CLEAR(PostingDate1);
                    CLEAR(PostingDate2);
                    CLEAR(BaseAMT1);
                    CLEAR(BaseAMT2);
                    CLEAR(WHTAMT1);
                    CLEAR(WHTAMT2);
                    CLEAR(WHT1);
                    CLEAR(WHT2);

                    CLEAR(CheckLedgEntry);
                    CheckLedgEntry.SetRange("Document No.", "Original Document No.");
                    CheckLedgEntry.SetRange("Posting Date", "Posting Date");
                    if CheckLedgEntry.FIND('-') then
                        PayDate := CheckLedgEntry."Check Date"
                    else
                        PayDate := 0D;

                    Running := Running + 1;
                end;
                OldWHTCertificateNo := "WHT Certificate No.";


                if ("WHT Entry"."Amount (LCY)" <> 0) then begin
                    BaseAMT := BaseAMT + Base;
                    WHTAMT := WHTAMT + Amount;
                end;

                if OldWHT = '' then begin
                    EarnType1 := WHTProdPostingGroup.Description;
                    if PayDate <> 0D then
                        PostingDate1 := PayDate
                    else
                        PostingDate1 := "Posting Date";
                    if ("Amount (LCY)" <> 0) then begin
                        BaseAMT1 := Base;
                        WHTAMT1 := Amount;
                    end;
                    WHT1 := "WHT %";
                    OldWHT := WHTProdPostingGroup.Description;
                end
                else
                    if OldWHT = WHTProdPostingGroup.Description then begin
                        EarnType1 := WHTProdPostingGroup.Description;
                        if PayDate <> 0D then
                            PostingDate1 := PayDate
                        else
                            PostingDate1 := "Posting Date";
                        if ("Amount (LCY)" <> 0) then begin
                            BaseAMT1 := BaseAMT1 + Base;
                            WHTAMT1 := WHTAMT1 + Amount;
                        end;
                    end
                    else begin
                        EarnType2 := WHTProdPostingGroup.Description;
                        if PayDate <> 0D then
                            PostingDate2 := PayDate
                        else
                            PostingDate2 := "Posting Date";
                        if ("Amount (LCY)" <> 0) then begin
                            BaseAMT2 := BaseAMT2 + Base;
                            WHTAMT2 := WHTAMT2 + Amount;
                        end;
                        WHT2 := "WHT %";

                        if (BaseAMT1 = 0) and (WHTAMT1 = 0) then
                            Running := Running - 1;

                    end;

                if KeepInt = 0 then
                    NoOfRecord := Running;
                if KeepAmt[1] = 0 then
                    Net := BaseAMT;
                if KeepAmt[2] = 0 then
                    NetVat := WHTAMT;

                //end;
                Total := NetVat + IncAmt;
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(DateRequestSplit);
                if DateRequest <> 0D then begin
                    DateRequestSplit[1] := FORMAT(DateRequest, 0, '<Day,2>');
                    DateRequestSplit[2] := thaiwords.MonthWords('T', DATE2DMY(DateRequest, 2));
                    DateRequestSplit[3] := FORMAT(DATE2DMY(DateRequest, 3) + 543);
                end;

                Companyinfo.GET;
                Companyinfo.CALCFIELDS("AVF_Logo PND 53");
                CLEAR(CheckMonth);
                CheckMonth[Period] := 'a';
                CLEAR(TxtSubmit);
                if Submit = Submit::Normal then
                    TxtSubmit[1] := 'a'
                else
                    TxtSubmit[2] := 'a';
                //SentTime:=2;

                SETFILTER("No. of Additional WHT", FORMAT(SentTime));

                CLEAR(TxtRegulation);
                if regulation = regulation::"3 Terasa" then
                    TxtRegulation[1] := 'a'
                else
                    if regulation = regulation::"65 Jataewa" then
                        TxtRegulation[2] := 'a'
                    else
                        if regulation = regulation::"69 Tavi" then
                            TxtRegulation[3] := 'a';

                CLEAR(Running);
                GetEndOfMonth(Year, Period);
                SetRange("Posting Date", FromDate, ToDate);
                //SetRange("Cheque Date",FromDate,ToDate);
                if WHT = 53 then begin
                    SetRange("WHT Report", "WHT Report"::"Por Ngor Dor 53");
                    PND := Text001;
                end
                else
                    if WHT = 3 then begin
                        SetRange("WHT Report", "WHT Report"::"Por Ngor Dor 3");
                        PND := Text000;
                    end
                    else
                        if WHT = 54 then begin
                            SetRange("WHT Report", "WHT Report"::"Por Ngor Dor 54");
                            PND := Text003;
                        end;
                KeepAmt[1] := Net;
                KeepAmt[2] := NetVat;
                KeepAmt[3] := IncAmt;
                KeepInt := NoOfRecord;
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
                    grid(Control14)
                    {
                        GridLayout = Rows;
                        group(Control15)
                        {
                            ShowCaption = false;
                            //The GridLayout property is only supported on controls of type Grid
                            //GridLayout = Columns;
                            field(Year; Year)
                            {
                                ApplicationArea = All;
                                Caption = 'Year';
                            }
                            field(Period; Period)
                            {
                                ApplicationArea = All;
                                Caption = 'Period';

                                trigger OnValidate();
                                begin
                                    ValidateMonth;
                                end;
                            }
                            field(MonthEng; MonthEng)
                            {
                                Caption = 'Month';
                                ApplicationArea = All;
                                Editable = false;
                            }
                        }
                    }
                    field(regulation; regulation)
                    {
                        ApplicationArea = All;
                        Caption = 'Type of Revenue';
                    }
                    field(Submit; Submit)
                    {
                        ApplicationArea = All;
                        Caption = 'Type of Submit';

                        trigger OnValidate();
                        begin
                            SetControl();
                        end;
                    }
                    field(SentTime; SentTime)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of the Additional Submit';
                        Editable = ShoworNotShow;

                        trigger OnValidate();
                        begin
                            SetControl();
                        end;
                    }
                    field(NoOfRecord; NoOfRecord)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of WHT';
                        Editable = ShoworNotShow;

                        trigger OnValidate();
                        begin
                            SetControl();
                        end;
                    }
                    field(NoOfDoc; NoOfDoc)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of PND Report';
                    }
                    field(Month; Month)
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field(AppoveName; AppoveName)
                    {
                        ApplicationArea = All;
                        Caption = 'Name of Authorized Person';
                    }
                    field(AppovePosition; AppovePosition)
                    {
                        ApplicationArea = All;
                        Caption = 'Position of Authorized Person';
                    }
                    field(DateRequest; DateRequest)
                    {
                        ApplicationArea = All;
                        Caption = 'Date Submit';
                    }
                    group("Summary of the WHT Submitted")
                    {
                        Caption = 'Summary of the WHT Submitted';
                        field(Net; Net)
                        {
                            ApplicationArea = All;
                            Caption = '1. Total WHT Base Amount';
                        }
                        field(NetVat; NetVat)
                        {
                            ApplicationArea = All;
                            Caption = '2. Total WHT Amount';
                        }
                        field(IncAmt; IncAmt)
                        {
                            ApplicationArea = All;
                            Caption = '3. Total Additional  Amount';
                        }
                    }
                    grid(Control17)
                    {
                        GridLayout = Rows;
                        group(Control19)
                        {
                            //The GridLayout property is only supported on controls of type Grid
                            //GridLayout = Columns;
                            Visible = false;
                            field("'TotalPage'"; 'TotalPage')
                            {
                                ApplicationArea = All;
                                Style = Unfavorable;
                                StyleExpr = TRUE;
                            }
                            field(TotalPage; TotalPage)
                            {
                                ApplicationArea = All;
                            }
                            field("'**Default = 1 '"; '**Default = 1 ')
                            {
                                ApplicationArea = All;
                                Style = Unfavorable;
                                StyleExpr = TRUE;
                            }
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnClosePage();
        begin
            GetEndOfMonth(Year, Period);
        end;

        trigger OnInit();
        begin
            WHT := 53;
            //WHTType := 'PND3';
            Period := DATE2DMY(TODAY, 2);
            Year := DATE2DMY(TODAY, 3);
            ValidateMonth;
            TotalPage := 1;
            NoOfDoc := 1;
            //WHT3 := TRUE;
            //WHT53 := TRUE;
            ShoworNotShow := false;
        end;

        trigger OnOpenPage();
        begin
            SetControl;
        end;
    }

    labels
    {
    }

    var
        Text000: Label 'ภ.ง.ด. 3';
        Text001: Label 'ภ.ง.ด. 53';
        Text002: Label '"Period should be in 1-12. Please enter valid period. "';
        Text003: Label 'ภ.ง.ด. 54';
        Text004: Label 'ภ.ง.ด. 2';
        Net: Decimal;
        NetVat: Decimal;
        IncAmt: Decimal;
        Total: Decimal;
        Companyinfo: Record "Company Information";
        Year: Integer;
        Period: Integer;
        Month: Text[30];
        MonthEng: Text[30];
        PND: Text[30];
        WHT3: Boolean;
        WHT53: Boolean;
        FromDate: Date;
        ToDate: Date;
        WHT: Integer;
        CheckMonth: array[12] of Text[10];
        Submit: Option Normal,Additional;
        regulation: Option "3 Terasa","65 Jataewa","69 Tavi";
        TxtSubmit: array[2] of Text[10];
        SentTime: Integer;
        NoOfDoc: Integer;
        NoOfRecord: Integer;
        TxtRegulation: array[3] of Text[10];
        Running: Integer;
        BaseAMT: Decimal;
        WHTAMT: Decimal;
        WHTProdPostingGroup: Record "AVF_WHT Product Posting Group";
        WHTBusPostingGroup: Record "AVF_WHT Business Posting Group";
        OldWHT: Text[50];
        EarnType1: Text[50];
        EarnType2: Text[50];
        PostingDate1: Date;
        PostingDate2: Date;
        BaseAMT1: Decimal;
        BaseAMT2: Decimal;
        WHTAMT1: Decimal;
        WHTAMT2: Decimal;
        VendType: Integer;
        WHT1: Integer;
        WHT2: Integer;
        CheckLedgEntry: Record "Check Ledger Entry";
        PayDate: Date;
        TotalPage: Integer;
        PrintOnlyAdditional: Boolean;
        [InDataSet]
        ShoworNotShow: Boolean;
        OldWHTCertificateNo: Code[20];
        AppoveName: Text[100];
        AppovePosition: Text[100];
        DateRequest: Date;
        DateRequestSplit: array[3] of Text[30];
        thaiwords: Codeunit AVF_Thai;
        KeepAmt: array[3] of Decimal;
        KeepInt: Integer;

    procedure ValidateMonth();
    begin
        if Period = 1 then begin
            Month := 'มกราคม';
            MonthEng := 'January';
        end else
            if Period = 2 then begin
                Month := 'กุมภาพันธ์';
                MonthEng := 'February';
            end else
                if Period = 3 then begin
                    Month := 'มีนาคม';
                    MonthEng := 'March';
                end else
                    if Period = 4 then begin
                        Month := 'เมษายน';
                        MonthEng := 'April';
                    end else
                        if Period = 5 then begin
                            Month := 'พฤษภาคม';
                            MonthEng := 'May';
                        end else
                            if Period = 6 then begin
                                Month := 'มิถุนายน';
                                MonthEng := 'June';
                            end else
                                if Period = 7 then begin
                                    Month := 'กรกฎาคม';
                                    MonthEng := 'July';
                                end else
                                    if Period = 8 then begin
                                        Month := 'สิงหาคม';
                                        MonthEng := 'August';
                                    end else
                                        if Period = 9 then begin
                                            Month := 'กันยายน';
                                            MonthEng := 'September';
                                        end else
                                            if Period = 10 then begin
                                                Month := 'ตุลาคม';
                                                MonthEng := 'October';
                                            end else
                                                if Period = 11 then begin
                                                    Month := 'พฤศจิกายน';
                                                    MonthEng := 'November';
                                                end else
                                                    if Period = 12 then begin
                                                        Month := 'ธันวาคม';
                                                        MonthEng := 'December';
                                                    end else begin
                                                        Month := '';
                                                        MonthEng := '';
                                                        MESSAGE('%1', Text002);
                                                    end;
    end;

    procedure GetEndOfMonth(Year: Integer; Month: Integer);
    begin
        FromDate := DMY2DATE(1, Month, Year);

        if (Month = 1) or (Month = 3) or (Month = 5) or (Month = 7) or (Month = 8) or (Month = 10) or (Month = 12) then
            ToDate := DMY2DATE(31, Month, Year)
        else
            if (Month = 4) or (Month = 6) or (Month = 9) or (Month = 11) then
                ToDate := DMY2DATE(30, Month, Year)
            else
                if (Month = 2) then
                    if Year mod 4 = 0 then
                        ToDate := DMY2DATE(29, Month, Year)
                    else
                        ToDate := DMY2DATE(28, Month, Year);
    end;

    procedure SetControl();
    begin
        if Submit = Submit::Normal then begin
            ShoworNotShow := false;
            CLEAR(SentTime);
            CLEAR(NoOfRecord);
        end else
            ShoworNotShow := true;

        RequestOptionsPage.UPDATE;
    end;
}

