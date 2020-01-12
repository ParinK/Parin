xmlport 50000 "INT_ImportPayroll"
{
    Direction = Import;
    DefaultFieldsValidation = false;
    Format = VariableText;
    //UseRequestPage = false;
    UseRequestPage = true;
    FieldDelimiter = '';
    FieldSeparator = '|';

    schema
    {
        textelement(Root)
        {
            tableelement(GenJnlLine; "Gen. Journal Line")
            {
                //SourceTableView = SORTING(Description, "Shortcut Dimension 1 Code");
                SourceTableView = sorting("Journal Template Name", "Journal Batch Name", "Line No.");
                textelement(Field01)
                {
                }
                textelement(Field02)
                {
                }
                textelement(Field03)
                {
                }
                textelement(Field04)
                {
                }
                textelement(GlobalDimension1)
                {
                }
                textelement(ShortcutDim4)
                {
                }
                textelement(Field07)
                {
                }
                textelement(Field08)
                {
                }
                textelement(Field09)
                {
                }


                trigger OnBeforeInsertRecord()
                begin


                    Clear(AVGenJnlLine);
                    AVGenJnlLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
                    AVGenJnlLine.SetRange("Journal Template Name", 'JV-PAYROLL');
                    AVGenJnlLine.SetRange("Journal Batch Name", 'JV-JP');
                    if AVGenJnlLine.FindLast then begin
                        LineNo := AVGenJnlLine."Line No.";
                    end;

                    //ถ้าเป็น account เดียวกันให้ skip แล้ว sum amount
                    /*
                    sumAmount := FieldAmount;
                    if (OldDescription = GenJnlLine.Description) AND (OldCostCenter = GenJnlLine."Shortcut Dimension 1 Code") then begin
                        sumAmount += sumAmount;
                    end else begin
                        Clear(sumAmount);
                    end;
                    OldDescription := GenJnlLine.Description;
                    OldCostCenter := GenJnlLine."Shortcut Dimension 1 Code";

                    LineNo += 10000;
                    GenJnlLine."Line No." := LineNo;

                    GenJnlLine."Journal Template Name" := 'JV-PAYROLL';
                    GenJnlLine."Journal Batch Name" := 'JV-JP';
                    */

                    //if (OldDescription <> GenJnlLine.Description) AND (OldCostCenter <> GenJnlLine."Shortcut Dimension 1 Code") then begin
                    //if (OldDescription <> GenJnlLine.Description) OR (OldCostCenter <> GenJnlLine."Shortcut Dimension 1 Code") then begin

                    LineNo += 10000;
                    GenJnlLine."Line No." := LineNo;

                    GenJnlLine."Journal Template Name" := 'JV-PAYROLL';
                    GenJnlLine."Journal Batch Name" := 'JV-JP';

                    //GenJnlLine."Document No." := NoSeriesMgt.GetNextNo('JV-JP', GenJnlLine."Posting Date", false);
                    //GenJnlLine."Document No." := AVGenJnlLine."Document No.";
                    GenJnlLine."Document No." := AVDocumentNo;

                    if EVALUATE(FieldYear, Field03) then;
                    if EVALUATE(FieldMonth, Field04) then;
                    if EVALUATE(FieldAmount, Field08) then;
                    RefDate := DMY2Date(1, FieldMonth, FieldYear);
                    GenJnlLine."Posting Date" := CALCDATE('<CM>', RefDate);
                    GenJnlLine.Validate("Shortcut Dimension 1 Code", GlobalDimension1);
                    GenJnlLine.Validate(Amount, FieldAmount);
                    DimPayroll := ShortcutDim4;

                    //if GenJnlLine."Shortcut Dimension 1 Code" = '' then
                    //    Error('Dimension must not be blank : %1', ShortcutDim4);


                    //ถ้าเป็น account เดียวกันให้ skip แล้ว sum amount                   
                    Clear(AVGenJnlLineCheck);
                    AVGenJnlLineCheck.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
                    AVGenJnlLineCheck.SetRange("Journal Template Name", 'JV-PAYROLL');
                    AVGenJnlLineCheck.SetRange("Journal Batch Name", 'JV-JP');
                    AVGenJnlLineCheck.SetRange(Description, DimPayroll);
                    AVGenJnlLineCheck.SetRange(AVGenJnlLineCheck."Shortcut Dimension 1 Code", GlobalDimension1);
                    if AVGenJnlLineCheck.FindFirst() then begin

                        //sumAmount += FieldAmount;
                        //AVGenJnlLineCheck.Validate(Amount, sumAmount);

                        if CopyStr(DimPayroll, 1, 3) <> 'SUM' then begin
                            AVGenJnlLineCheck.Amount += FieldAmount;
                            AVGenJnlLineCheck."Debit Amount" += FieldAmount;
                        end else begin
                            AVGenJnlLineCheck.Amount += FieldAmount * -1;
                            AVGenJnlLineCheck."Credit Amount" += FieldAmount * -1;

                        end;

                        AVGenJnlLineCheck.Modify;
                        currXMLport.Skip();
                    end;
                    //C-ถ้าเป็น account เดียวกันให้ skip แล้ว sum amount




                    if CopyStr(DimPayroll, 1, 3) <> 'SUM' then
                        GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                    if CopyStr(DimPayroll, 1, 2) = 'ZE' then    //ZE* ไม่ต้องออก
                        currXMLport.Skip();
                    //if CopyStr(DimPayroll, 1, 2) = 'PF' then    //PF* ไม่ต้องออก
                    //    currXMLport.Skip();
                    //Map Account
                    case DimPayroll of
                        //NET, TAX : ไม่มีการบันทึกบัญชี
                        'NET':
                            currXMLport.Skip();
                        //'SUM_SOC':
                        //    currXMLport.Skip();
                        'TAX':
                            currXMLport.Skip();
                        'PF':
                            currXMLport.Skip();
                        //NET, TAX : ไม่มีการบันทึกบัญชี

                        //'PF':
                        //    begin
                        //        GenJnlLine."Account No." := '4102006';
                        //        GenJnlLine.Description := 'PF';
                        //    end;
                        'PFC':
                            begin
                                GenJnlLine."Account No." := '4102006';
                                GenJnlLine.Description := 'PFC';
                            end;
                        'SAL':
                            begin
                                GenJnlLine."Account No." := '4101001';
                                GenJnlLine.Description := 'SAL';
                            end;
                        'SOC':
                            begin
                                GenJnlLine."Account No." := '4102007';
                                GenJnlLine.Description := 'SOC';
                            end;
                        'ZA35':
                            begin
                                GenJnlLine."Account No." := '4101008';
                                GenJnlLine.Description := 'ZA35';
                            end;
                        'ZABF':
                            begin
                                GenJnlLine."Account No." := '4101008';
                                GenJnlLine.Description := 'ZABF';
                            end;
                        'ZABN':
                            begin
                                GenJnlLine."Account No." := '4101008';
                                GenJnlLine.Description := 'ZABN';
                            end;
                        'ZA73':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZA73';
                            end;
                        'ZE04':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE04';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZEAF':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZEAF';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZEX2':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZEX2';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE31':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE31';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE80':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE80';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE81':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE81';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE82':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE82';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE93':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE93';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE92':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE92';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE18':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE18';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZE24':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'ZE24';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                            end;
                        'ZS01':
                            begin
                                GenJnlLine."Account No." := '4101009';
                                GenJnlLine.Description := 'ZS01';
                            end;
                        'ZS02':
                            begin
                                GenJnlLine."Account No." := '4102009';
                                GenJnlLine.Description := 'ZS02';
                            end;
                        'ZS03':
                            begin
                                GenJnlLine."Account No." := '4104002';
                                GenJnlLine.Description := 'ZS03';
                            end;
                        'ZS04':
                            begin
                                GenJnlLine."Account No." := '4306003';
                                GenJnlLine.Description := 'ZS04';
                            end;
                        'ZS06':
                            begin
                                GenJnlLine."Account No." := '4102009';
                                GenJnlLine.Description := 'ZS06';
                            end;
                        'ZW00':
                            begin
                                GenJnlLine."Account No." := '4101003';
                                GenJnlLine.Description := 'ZW00';
                            end;
                        'SUM_NET_BBL':
                            begin
                                GenJnlLine."Account No." := '0113003';
                                GenJnlLine.Description := 'SUM_NET_BBL';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_NET_KBANK':
                            begin
                                GenJnlLine."Account No." := '0112020';
                                GenJnlLine.Description := 'SUM_NET_KBANK';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE04':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE04';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE31':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE31';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE80':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE80';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE82':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE82';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE93':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE93';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZEAF':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZEAF';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZEX2':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZEX2';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_PF':
                            begin
                                GenJnlLine."Account No." := '1160034';
                                GenJnlLine.Description := 'SUM_PF';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_PFC':
                            begin
                                GenJnlLine."Account No." := '1160034';
                                GenJnlLine.Description := 'SUM_PFC';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE92':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE92';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE18':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE18';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_ZE24':
                            begin
                                GenJnlLine."Account No." := '0152002';
                                GenJnlLine.Description := 'SUM_ZE24';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_TAX':
                            begin
                                GenJnlLine."Account No." := '1160204';
                                GenJnlLine.Description := 'SUM_TAX';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                        'SUM_SOC':
                            begin
                                GenJnlLine."Account No." := '1160038';
                                GenJnlLine.Description := 'SUM_SOC';
                                GenJnlLine.Validate(Amount, FieldAmount * -1);
                                GenJnlLine.ValidateShortcutDimCode(4, DimPayroll);
                            end;
                    end;

                    //if GenJnlLine.Description = '' then
                    //    Error('Dimension must not be blank : %1', ShortcutDim4);


                end;

            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Additional; Additional)
                    {
                        Caption = 'Import เพิ่มเติม';
                        ApplicationArea = Basic, Suite;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        /*
        Clear(AVGenJnlLine);
        AVGenJnlLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
        AVGenJnlLine.SetRange("Journal Template Name", 'JV-PAYROLL');
        AVGenJnlLine.SetRange("Journal Batch Name", 'JV-JP');
        if AVGenJnlLine.FindFirst then begin
            //AVGenJnlLine."Document No." := NoSeriesMgt.GetNextNo('JV-JP', GenJnlLine."Posting Date", false);
            //Error('The record in table Gen. Journal Line already exists. Identification fields and values: Journal Template Name=%1,Journal Batch Name=%2', AVGenJnlLine."Journal Template Name", AVGenJnlLine."Journal Batch Name");
        end else begin
            AVGenJnlLine."Document No." := NoSeriesMgt.GetNextNo('JV-JP', GenJnlLine."Posting Date", false);
        end;
        */
        if Additional then
            AVDocumentNo := AVDocumentNo
        else
            AVDocumentNo := NoSeriesMgt.GetNextNo('JV-JP', GenJnlLine."Posting Date", false);
    end;

    trigger OnPostXmlPort()
    begin
        MESSAGE('Import Payroll Complete.');
    end;


    var
        AVGenJnlLine: Record "Gen. Journal Line";
        AVGenJnlLineCheck: Record "Gen. Journal Line";
        LineNo: Integer;
        FieldYear: Integer;
        FieldMonth: Integer;
        FieldAmount: Decimal;
        RefDate: Date;
        DimPayroll: code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        OldDescription: code[30];
        OldCostCenter: Code[20];
        sumAmount: Decimal;
        AVDocumentNo: Code[30];
        Additional: Boolean;



}

