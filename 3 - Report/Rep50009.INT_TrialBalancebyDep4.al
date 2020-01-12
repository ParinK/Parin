report 50009 "INT_TrialBalancebyDep4"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Trial Balance by Department 4.rdl';
    Caption = 'Trial Balance by Cost Center/Trading partners';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.") WHERE("Account Type" = CONST(Posting));
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";

            column(STRSUBSTNO_Text000_PeriodText_; STRSUBSTNO(Text000, PeriodText))
            {
            }
            column(PrintDate; FORMAT(TODAY, 0, 1) + ' ' + FORMAT(TIME, 0, '<Hours12>:<Minutes,2>:<Second,2> <AM/PM>'))
            {
            }
            /*
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            */
            column(COMPANYNAME; companyinfo.Name)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(G_L_Account__TABLECAPTION__________GLFilter; TABLECAPTION + ': ' + GLFilter)
            {
            }
            column(GLFilter; GLFilter)
            {
            }
            column(G_L_Account_No_; "No.")
            {
            }
            column(Trial_BalanceCaption; Trial_BalanceCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Net_ChangeCaption; Net_ChangeCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(G_L_Account___No__Caption; FIELDCAPTION("No."))
            {
            }
            column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaption; PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl)
            {
            }
            column(G_L_Account___Net_Change_Caption; G_L_Account___Net_Change_CaptionLbl)
            {
            }
            column(G_L_Account___Net_Change__Control22Caption; G_L_Account___Net_Change__Control22CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date_Caption; G_L_Account___Balance_at_Date_CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date__Control24Caption; G_L_Account___Balance_at_Date__Control24CaptionLbl)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(StartBalanceDr; StartBalanceDr)
            {
            }
            column(StartBalanceCr; StartBalanceCr)
            {
            }
            column(BalDr; BalDr)
            {
            }
            column(BalCr; BalCr)
            {
            }
            column(ShowZero; ShowZero)
            {
            }
            column(GrantTotal1; SumNetDr)
            {
            }
            column(GrantTotal2; SumNetCr)
            {
            }
            column(GrantTotal3; SumBalDr)
            {
            }
            column(GrantTotal4; SumBalCr)
            {
            }
            column(PrintToExcel; PrintToExcel)
            {
            }
            column(CostOption; FORMAT(CostOption))
            {
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number);
                DataItemLinkReference = "G/L Account";
                column(DimValue_Site_Code; FilterDepCode)
                {
                }
                column(FilterGlobal2Code; FilterGlobal2Code)
                {
                }
                column(G_L_Account___No__; "G/L Account"."No.")
                {
                }
                column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__Name; PADSTR('', "G/L Account".Indentation * 2) + "G/L Account".Name)
                {
                }
                column(G_L_Account___Net_Change_; "G/L Account"."Net Change")
                {
                }
                column(G_L_Account___Net_Change__Control22; -"G/L Account"."Net Change")
                {
                }
                column(G_L_Account___Balance_at_Date_; "G/L Account"."Balance at Date")
                {
                }
                column(G_L_Account___Balance_at_Date__Control24; -"G/L Account"."Balance at Date")
                {
                }
                column(G_L_Account___Account_Type_; FORMAT("G/L Account"."Account Type", 0, 2))
                {
                }
                column(No__of_Blank_Lines; "G/L Account"."No. of Blank Lines")
                {
                }
                dataitem(BlankLineRepeater; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    DataItemLinkReference = Integer;
                    column(BlankLineNo; BlankLineNo)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        IF BlankLineNo = 0 THEN
                            CurrReport.BREAK;
                        BlankLineNo -= 1;
                    end;
                }

                trigger OnPreDataItem()
                begin
                    CLEAR(GLNo);
                    //EVALUATE(GLNo,"G/L Account"."No.");

                    CLEAR(CountAccount);
                    CLEAR(CountDep);

                    //IF (COPYSTR("G/L Account"."No.",1,1) = '1') OR (COPYSTR("G/L Account"."No.",1,1) = '2') OR (COPYSTR("G/L Account"."No.",1,1) = '3') OR
                    IF (COPYSTR("G/L Account"."No.", 1, 1) = '4') OR (COPYSTR("G/L Account"."No.", 1, 1) = '5') OR
                    (COPYSTR("G/L Account"."No.", 1, 1) = '6') OR (COPYSTR("G/L Account"."No.", 1, 1) = '7') THEN BEGIN
                        //(COPYSTR("G/L Account"."No.",1,1) = '8') THEN BEGIN
                        TmpDimValue_Dep.SETCURRENTKEY(TmpDimValue_Dep."Dimension Code");
                        TmpDimValue_Dep.SETRANGE(TmpDimValue_Dep."Dimension Code", 'COST CENTER');
                        IF "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter") <> '' THEN
                            TmpDimValue_Dep.SETFILTER(TmpDimValue_Dep.Code, TxtFilter);
                        IF TmpDimValue_Dep.FINDFIRST THEN
                            CountDep := TmpDimValue_Dep.COUNT;
                    END;

                    //IF "G/L Account".GETFILTER("G/L Account"."DIM SITE Filter") = '' THEN
                    CountDep += 1;
                    SETRANGE(Number, 1, CountDep);
                end;

                trigger OnAfterGetRecord()
                begin
                    CountAccount += 1;

                    CLEAR(FilterDepCode);
                    CLEAR(FilterGlobal2Code);
                    //IF "G/L Account".GETFILTER("G/L Account"."DIM SITE Filter") = '' THEN BEGIN
                    IF CountAccount = 1 THEN
                        FilterDepCode := ''
                    ELSE
                        IF CountAccount = 2 THEN BEGIN
                            FilterDepCode := TmpDimValue_Dep.Name;
                            //FilterGlobal2Code := TmpDimValue_Dep."INT_External Document No.";
                            FilterGlobal2Code := DimGloal2.Code;
                        END
                        ELSE
                            IF CountAccount > 2 THEN BEGIN
                                TmpDimValue_Dep.NEXT;
                                FilterDepCode := TmpDimValue_Dep.Name;
                                //FilterGlobal2Code := TmpDimValue_Dep."INT_External Document No.";
                                FilterGlobal2Code := DimGloal2.Code;
                            END;


                    //AVWISTD.003 04.07.2010
                    //Add Code for Find Begining Balance on trigger G/L Account - OnAfterGetRecord()
                    StartBalanceDr := 0;
                    StartBalanceCr := 0;
                    IF PeriodText <> '' THEN
                        IF "G/L Account".GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                            CLEAR(GLAccount);
                            GLAccount.SETCURRENTKEY(GLAccount."No.");
                            GLAccount.COPY("G/L Account");
                            GLAccount.SETRANGE("No.", "G/L Account"."No.");
                            GLAccount.SETRANGE("Date Filter", 0D, CLOSINGDATE("G/L Account".GETRANGEMIN("G/L Account"."Date Filter") - 1));
                            //IF (COPYSTR("G/L Account"."No.",1,1) = '1') OR (COPYSTR("G/L Account"."No.",1,1) = '2') OR (COPYSTR("G/L Account"."No.",1,1) = '3') OR
                            //P//IF (COPYSTR("G/L Account"."No.",1,1) = '4') OR (COPYSTR("G/L Account"."No.",1,1) = '5') OR
                            //P//   (COPYSTR("G/L Account"."No.",1,1) = '6') OR (COPYSTR("G/L Account"."No.",1,1) = '7') THEN
                            //(COPYSTR("G/L Account"."No.",1,1) = '8') THEN
                            GLAccount.SETRANGE("Global Dimension 1 Filter", FilterDepCode);
                            GLAccount.SETRANGE("Global Dimension 2 Filter", FilterGlobal2Code);
                            //P//ELSE
                            //P//    GLAccount.SETRANGE("Global Dimension 1 Filter");
                            IF GLAccount.FIND('-') THEN
                                REPEAT
                                    GLAccount.CALCFIELDS("Net Change");
                                    IF GLAccount."Net Change" > 0 THEN BEGIN
                                        StartBalanceDr := StartBalanceDr + GLAccount."Net Change";
                                        IF GLAccount."Account Type" = GLAccount."Account Type"::Posting THEN
                                            BalDr := BalDr + GLAccount."Net Change";
                                    END ELSE BEGIN
                                        StartBalanceCr := StartBalanceCr - GLAccount."Net Change";
                                        IF GLAccount."Account Type" = GLAccount."Account Type"::Posting THEN
                                            BalCr := BalCr - GLAccount."Net Change";
                                    END;
                                UNTIL (GLAccount.NEXT = 0);
                        END;
                    //C-AVWISTD.003 04.07.2010
                    //IF (COPYSTR("G/L Account"."No.",1,1) = '1') OR (COPYSTR("G/L Account"."No.",1,1) = '2') OR (COPYSTR("G/L Account"."No.",1,1) = '3') OR
                    //IF (COPYSTR("G/L Account"."No.",1,1) = '4') OR (COPYSTR("G/L Account"."No.",1,1) = '5') OR
                    //   (COPYSTR("G/L Account"."No.",1,1) = '6') OR (COPYSTR("G/L Account"."No.",1,1) = '7') THEN
                    //(COPYSTR("G/L Account"."No.",1,1) = '8') THEN
                    "G/L Account".SETRANGE("G/L Account"."Global Dimension 1 Filter", FilterDepCode);
                    "G/L Account".SETRANGE("G/L Account"."Global Dimension 2 Filter", FilterGlobal2Code);
                    //ELSE
                    //   "G/L Account".SETRANGE("G/L Account"."Global Dimension 1 Filter");

                    "G/L Account".CALCFIELDS("Net Change", "Balance at Date");

                    BlankLineNo := "G/L Account"."No. of Blank Lines" + 1;

                    //AVWISTD.001 04.07.2010
                    //Add Code for Sum Begining Balance on trigger Integer, Body (1) - OnPreSection()
                    IF "G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting THEN BEGIN
                        IF "G/L Account"."Net Change" > 0 THEN
                            SumNetDr := SumNetDr + "G/L Account"."Net Change"
                        ELSE
                            SumNetCr := SumNetCr - "G/L Account"."Net Change";

                        IF "G/L Account"."Balance at Date" > 0 THEN
                            SumBalDr := SumBalDr + "G/L Account"."Balance at Date"
                        ELSE
                            SumBalCr := SumBalCr - "G/L Account"."Balance at Date";
                    END
                    ELSE BEGIN
                        SumNetCr := SumNetCr;
                        SumNetDr := SumNetDr;
                        SumBalCr := SumBalCr;
                        SumBalDr := SumBalDr;
                    END;
                    //C-AVWISTD.001 04.07.2010
                    IF PrintToExcel AND (((StartBalanceDr <> 0) OR (StartBalanceCr <> 0)) OR ("G/L Account"."Net Change" <> 0) OR ("G/L Account"."Balance at Date" <> 0)) THEN//AVKPM 270219
                        MakeExcelDataBody;
                end;

            }

            trigger OnPreDataItem()
            begin
                PageGroupNo := 0;
                ChangeGroupNo := FALSE;
                //AVPDB.001 12.06.2014
                //Add Code for Get Value Company Infomation - OnPreDataItem()
                companyinfo.GET;
                //E-AVPDB.001 12.06.2014


                //AVWISTD.002 04.07.2010
                //Add Code for Clear Value on trigger G/L Account - OnPreDataItem()
                BalDr := 0;
                BalCr := 0;
                //C-AVWISTD.002 04.07.2010

                //Insert Table Tmp Dimension
                CLEAR(TmpDimValue_Dep);
                TmpDimValue_Dep.DELETEALL;
                CLEAR(Running);
                CLEAR(DimGloal1);
                DimGloal1.SETCURRENTKEY(DimGloal1."Dimension Code");
                DimGloal1.SETRANGE(DimGloal1."Dimension Code", 'COST CENTER');
                IF DimGloal1.FIND('-') THEN BEGIN
                    Running += 1;
                    TmpDimValue_Dep.INIT;
                    TmpDimValue_Dep."Dimension Code" := 'COST CENTER';
                    TmpDimValue_Dep.Code := FORMAT(Running);
                    TmpDimValue_Dep.Name := '';
                    TmpDimValue_Dep."INT_External Document No." := '';
                    TmpDimValue_Dep.INSERT;
                    REPEAT
                        Running += 1;
                        TmpDimValue_Dep.INIT;
                        TmpDimValue_Dep."Dimension Code" := 'COST CENTER';
                        TmpDimValue_Dep.Code := FORMAT(Running);
                        TmpDimValue_Dep.Name := DimGloal1.Code;
                        TmpDimValue_Dep."INT_External Document No." := '';
                        TmpDimValue_Dep.INSERT;

                        CLEAR(DimGloal2);
                        DimGloal2.SETCURRENTKEY(DimGloal2."Dimension Code");
                        DimGloal2.SETRANGE(DimGloal2."Dimension Code", 'TRADING PARTNERS');
                        //DimGloal2.SETFILTER(DimGloal2.Code, 'AUC*');
                        IF DimGloal2.FIND('-') THEN BEGIN
                            REPEAT
                                Running += 1;
                                TmpDimValue_Dep.INIT;
                                TmpDimValue_Dep."Dimension Code" := 'COST CENTER';
                                TmpDimValue_Dep.Code := FORMAT(Running);
                                TmpDimValue_Dep.Name := DimGloal1.Code;
                                TmpDimValue_Dep."INT_External Document No." := DimGloal2.Code;
                                TmpDimValue_Dep.INSERT;

                            UNTIL DimGloal2.NEXT = 0;
                        END;

                    UNTIL DimGloal1.NEXT = 0;
                END;
            end;

            trigger OnAfterGetRecord()
            begin
                //Message('G/L Account : %1', "G/L Account"."No.");
                IF ChangeGroupNo THEN BEGIN
                    PageGroupNo += 1;
                    ChangeGroupNo := FALSE;
                END;

                ChangeGroupNo := "New Page";
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
        GLFilter := "G/L Account".GETFILTERS;
        PeriodText := "G/L Account".GETFILTER("Date Filter");
        TxtFilter := "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter");

        IF PrintToExcel THEN
            MakeExcelInfo;
    end;

    trigger OnPostReport()
    begin
        IF PrintToExcel THEN BEGIN
            MakeExcelDataFooter;
            CreateExcelbook;
        END;
    end;

    var
        Text000: TextConst ENU = 'Period: %1';
        Text001: TextConst ENU = 'Trial Balance';
        Text002: TextConst ENU = 'Data';
        Text003: TextConst ENU = 'Debit';
        Text004: TextConst ENU = 'Credit';
        Text005: TextConst ENU = 'Company Name';
        Text006: TextConst ENU = 'Report No.';
        Text007: TextConst ENU = 'Report Name';
        Text008: TextConst ENU = 'User ID';
        Text009: TextConst ENU = 'Date';
        Text010: TextConst ENU = 'G/L Filter';
        Text011: TextConst ENU = 'Period Filter';
        Trial_BalanceCaptionLbl: TextConst ENU = 'Trial Balance by Department';
        CurrReport_PAGENOCaptionLbl: TextConst ENU = 'Page';
        Net_ChangeCaptionLbl: TextConst ENU = 'Net Change';
        BalanceCaptionLbl: TextConst ENU = 'Balance';
        PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl: TextConst ENU = 'Name';
        G_L_Account___Net_Change_CaptionLbl: TextConst ENU = 'Debit';
        G_L_Account___Net_Change__Control22CaptionLbl: TextConst ENU = 'Credit';
        G_L_Account___Balance_at_Date_CaptionLbl: TextConst ENU = 'Debit';
        G_L_Account___Balance_at_Date__Control24CaptionLbl: TextConst ENU = 'Credit';
        ExcelBuf: Record "Excel Buffer";
        GLFilter: text;
        PeriodText: text[30];
        PrintToExcel: Boolean;
        PageGroupNo: Integer;
        ChangeGroupNo: Boolean;
        BlankLineNo: Integer;
        StartBalanceDr: Decimal;
        StartBalanceCr: Decimal;
        GLAccount: Record "G/L Account";
        SumNetCr: Decimal;
        SumNetDr: Decimal;
        SumBalCr: Decimal;
        SumBalDr: Decimal;
        companyinfo: Record "Company Information";
        BalDr: Decimal;
        BalCr: Decimal;
        ShowZero: Boolean;
        TmpDimValue_Dep: Record "Dimension Value" temporary;
        CountDep: Integer;
        CountAccount: Integer;
        FilterDepCode: Code[20];
        GLNo: Integer;
        TxtFilter: text[250];
        CostOption: Option ,DL,OH,"I-OH";
        DimGloal1: Record "Dimension Value";
        DimGloal2: Record "Dimension Value";
        FilterGlobal2Code: Code[20];
        Running: Integer;

    procedure MakeExcelInfo()
    begin
        ExcelBuf.SetUseInfoSheet;
        ExcelBuf.AddInfoColumn(FORMAT(Text005), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(COMPANYNAME, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text007), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FORMAT(Text001), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text006), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(REPORT::"Trial Balance", FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text008), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(USERID, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text009), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(TODAY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text010), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn("G/L Account".GETFILTER("No."), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text011), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn("G/L Account".GETFILTER("Date Filter"), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.AddColumn("G/L Account".FIELDCAPTION("No."), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("G/L Account".FIELDCAPTION(Name), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
        FORMAT('Beginning - ' + Text003), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
        FORMAT('Beginning - ' + Text004), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
        FORMAT("G/L Account".FIELDCAPTION("Net Change") + ' - ' + Text003), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
        FORMAT("G/L Account".FIELDCAPTION("Net Change") + ' - ' + Text004), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
        FORMAT("G/L Account".FIELDCAPTION("Balance at Date") + ' - ' + Text003), FALSE, '', TRUE, FALSE, TRUE, '',
        ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
        FORMAT("G/L Account".FIELDCAPTION("Balance at Date") + ' - ' + Text004), FALSE, '', TRUE, FALSE, TRUE, '',
        ExcelBuf."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody()
    var
        BlankFiller: text[250];
    begin
        BlankFiller := PADSTR(' ', MAXSTRLEN(BlankFiller), ' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(
        "G/L Account"."No.", FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
        ExcelBuf."Cell Type"::Text);
        IF "G/L Account".Indentation = 0 THEN
            ExcelBuf.AddColumn(
                "G/L Account".Name, FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                ExcelBuf."Cell Type"::Text)
        ELSE
            ExcelBuf.AddColumn(
                COPYSTR(BlankFiller, 1, 2 * "G/L Account".Indentation) + "G/L Account".Name,
                FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);


        ExcelBuf.AddColumn(FilterDepCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text); //AVWNFBFOODS.001 270219

        //AVWNFBFOODS.001 180219
        CASE TRUE OF
            (StartBalanceDr = 0) AND (StartBalanceCr = 0):
                BEGIN
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                END;
            StartBalanceDr <> 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        StartBalanceDr, FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting,
                        FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                END;
            StartBalanceCr <> 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        StartBalanceCr, FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting,
                        FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
                END;
        END;
        //C-AVWNFBFOODS.001 180219

        CASE TRUE OF
            "G/L Account"."Net Change" = 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                END;
            "G/L Account"."Net Change" > 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        "G/L Account"."Net Change", FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting,
                        FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                END;
            "G/L Account"."Net Change" < 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        -"G/L Account"."Net Change", FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting,
                        FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
                END;
        END;

        CASE TRUE OF
            "G/L Account"."Balance at Date" = 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                END;
            "G/L Account"."Balance at Date" > 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        "G/L Account"."Balance at Date", FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting,
                        FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                END;
            "G/L Account"."Balance at Date" < 0:
                BEGIN
                    ExcelBuf.AddColumn(
                        '', FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting, FALSE, FALSE, '',
                        ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(
                        -"G/L Account"."Balance at Date", FALSE, '', "G/L Account"."Account Type" <> "G/L Account"."Account Type"::Posting,
                        FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
                END;
        END;
    end;

    procedure CreateExcelbook()
    begin
        //ExcelBuf.CreateBookAndOpenExcel('', Text002, Text001, COMPANYNAME, USERID);
        //ERROR('');
    end;

    local procedure MakeExcelDataFooter()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Total', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(BalDr, FALSE, '', TRUE, FALSE, TRUE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(BalCr, FALSE, '', TRUE, FALSE, TRUE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SumNetDr, FALSE, '', TRUE, FALSE, TRUE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SumNetCr, FALSE, '', TRUE, FALSE, TRUE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SumBalDr, FALSE, '', TRUE, FALSE, TRUE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SumBalCr, FALSE, '', TRUE, FALSE, TRUE, '#,##0.00', ExcelBuf."Cell Type"::Number);

    end;


}