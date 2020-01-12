report 50042 "INT_Receipt"
{
    // version AVTHLC1.0

    DefaultLayout = RDLC;
    Caption = 'Receipt';
    RDLCLayout = 'Rdlc/Receipt.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Receipt/Tax Invoice Header"; "AVF_Receipt/Tax Invoice Header")
        {
            DataItemTableView = SORTING("Receipt No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Receipt No.";
            column(Remark_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header".Remark)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Phone; 'Tel: ' + CompanyInfo."Phone No." + ' Fax: ' + CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo_Address2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_VatRegistrationNo; 'Tax No.: ' + CompanyInfo."VAT Registration No." + ' ' + VatBusPostingGroup."AVF_Branch No.")
            {
            }
            column(CompanyInfo_NameEng; CompanyInfo.FNGN001_NameEng)
            {
            }
            column(CompanyInfo_NameEng2; CompanyInfo."FNGN001_NameEng 2")
            {
            }
            column(CompanyInfo_AddressEng; CompanyInfo.FNGN001_AddressEng)
            {
            }
            column(CompanyInfo_AddressEng2; CompanyInfo."FNGN001_AddressEng 2")
            {
            }
            column(BilltoCustomerNo_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Bill-to Customer No.")
            {
            }
            column(BilltoCustomerName_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Bill-to Customer Name")
            {
            }
            column(BilltoCustomerName2_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Bill-to Customer Name 2")
            {
            }
            column(BilltoAddress_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Bill-to Address")
            {
            }
            column(BilltoAddress2_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Bill-to Address 2" + ' ' + "Receipt/Tax Invoice Header"."Bill-to Address 3")
            {
            }
            column(CustomerTB_PhoneNo; "Customer TB"."Phone No.")
            {
            }
            column(CustomerTB_FaxNo; "Customer TB"."Fax No.")
            {
            }
            column(CustomerTB_EMail; "Customer TB"."E-Mail")
            {
            }
            column(CustomerTB_VatRegisNo; "Customer TB"."VAT Registration No.")
            {
            }
            column(CustomerTB_BranchNo; "Customer TB"."AVF_Customer Branch No.")
            {
            }
            column(ReceiptNo_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Receipt No.")
            {
            }
            column(ReceiptDate_ReceiptTaxInvoiceHeader; FORMAT("Receipt/Tax Invoice Header"."Receipt Date", 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(AuthorizePerson; AuthorizePerson)
            {
            }
            column(TCash; TCash)
            {
            }
            column(TCheque; TCheque)
            {
            }
            column(TTransfer; TTransfer)
            {
            }
            column(CheckBank_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Check Bank")
            {
            }
            column(CheckBranch_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Check Branch")
            {
            }
            column(CheckNo_ReceiptTaxInvoiceHeader; "Receipt/Tax Invoice Header"."Check No.")
            {
            }
            column(CheckDate_ReceiptTaxInvoiceHeader; FORMAT("Receipt/Tax Invoice Header"."Check Date", 0, 1))
            {
            }
            column(AMT; AMT)
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            column(TotalAmt; TotalAmt)
            {
            }
            column(AmtWord; AmtWord[1])
            {
            }
            column(Allpage; Allpage)
            {
            }
            column(RunPage; RunPage)
            {
            }
            column(VatRegisNo_ReceiptH; "Receipt/Tax Invoice Header"."VAT Registration No.")
            {
            }
            column(CustomerBranchNo_ReceiptH; "Receipt/Tax Invoice Header"."Customer Branch No.")
            {
            }
            column(MaxPage; MaxPage)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Number_CopyLoop; CopyLoop.Number)
                {
                }
                dataitem("Receipt/Tax Invoice Line"; "AVF_Receipt/Tax Invoice Line")
                {
                    DataItemLinkReference = "Receipt/Tax Invoice Header";
                    DataItemLink = "Receipt No." = FIELD("Receipt No.");
                    DataItemTableView = SORTING("Receipt No.", "Line No.");
                    column(Running; Running)
                    {
                    }
                    column(DocumentNo_ReceiptTaxInvoiceLine; 'ได้รับเงินตามใบแจ้งหนี้เลขที่  ' + FORMAT("Document No."))
                    {
                    }
                    column(InvDate; FORMAT(InvDate, 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
                    {
                    }
                    column(DueDate; FORMAT(DUEDATE, 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
                    {
                    }
                    column(REMAINAMT; REMAINAMT)
                    {
                    }
                    column(CustLedgerEntryTB_RemainingAmtLCY; "Cust. Ledger Entry TB"."Remaining Amt. (LCY)" - Amount)
                    {
                    }
                    column(AmountExcluedVAT_ReceiptTaxInvoiceLine; "Receipt/Tax Invoice Line"."Amount Exclued. VAT")
                    {
                    }
                    column(Amount_ReceiptTaxInvoiceLine; "Receipt/Tax Invoice Line".Amount)
                    {
                    }
                    column(Amount; Amount)
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLinkReference = "Receipt/Tax Invoice Line";
                        DataItemLink = "Document No." = FIELD("Document No.");
                        //column(DescInv; "Sales Invoice Line".Description + ' ' + "Sales Invoice Line"."Description 2")
                        column(DescInv; DescInv)
                        {
                        }
                        column(AmtInv; AmtInv)
                        {
                        }

                        column(ShowLineInv; ShowLineInv)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            Clear(SaleInvHeadTB);
                            SaleInvHeadTB.SetCurrentKey("No.");
                            SaleInvHeadTB.SetRange("No.", "Sales Invoice Line"."Document No.");
                            if SaleInvHeadTB.FindFirst() then
                                SaleInvHeadTB.CalcFields(Amount);

                            Clear(DescInv);
                            Clear(AmtInv);
                            Clear(VATAmt);
                            Clear(ShowLineInv);
                            if SaleInvHeadTB.Amount <> 0 then begin
                                //AmtInv := ("Sales Invoice Line".Amount * "Receipt/Tax Invoice Line"."Amount Exclued. VAT") / SaleInvHeadTB.Amount;
                                AmtInv := "Sales Invoice Line"."Amount Including VAT";
                                VATAmt += (AmtInv * "Sales Invoice Line"."VAT %") / 100;
                                TotalAmt += AmtInv + ((AmtInv * "Sales Invoice Line"."VAT %") / 100);
                            end else
                                AmtInv := 0;

                            DescInv := "Sales Invoice Line".Description + ' ' + "Sales Invoice Line"."Description 2";
                            ShowLineInv := true;
                            //CountLine += 1;
                            AMT += AmtInv;
                            CLEAR(AmtWord);
                            AmtWord[1] := Thai.ThaiAmountWords(ROUND(AMT, 0.01, '='));
                        end;
                    }
                    dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                    {
                        DataItemLinkReference = "Receipt/Tax Invoice Line";
                        DataItemLink = "Document No." = FIELD("Document No.");
                        //column(DescCr; "Sales Cr.Memo Line".Description + ' ' + "Sales Cr.Memo Line"."Description 2")
                        column(DescCr; DescCr)
                        {
                        }
                        column(AmtCr; AmtCr)
                        {
                        }
                        column(ShowLineCr; ShowLineCr)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            Clear(saleCrHeadTB);
                            saleCrHeadTB.SetCurrentKey("No.");
                            saleCrHeadTB.SetRange("No.", "Sales Cr.Memo Line"."Document No.");
                            if saleCrHeadTB.FindFirst() then;
                            saleCrHeadTB.CalcFields(Amount);

                            Clear(DescCr);
                            Clear(AmtCr);
                            Clear(VATAmt);
                            Clear(ShowLineCr);
                            if saleCrHeadTB.Amount <> 0 then begin
                                //AmtCr := ("Sales Cr.Memo Line".Amount * "Receipt/Tax Invoice Line"."Amount Exclued. VAT") / saleCrHeadTB.Amount;
                                AmtCr := "Sales Cr.Memo Line"."Amount Including VAT";
                                VATAmt += (AmtCr * "Sales Invoice Line"."VAT %") / 100;
                                TotalAmt += AmtCr + ((AmtCr * "Sales Invoice Line"."VAT %") / 100);
                            end else
                                AmtCr := 0;

                            DescCr := "Sales Cr.Memo Line".Description + ' ' + "Sales Cr.Memo Line"."Description 2";
                            ShowLineCr := true;
                            //CountLine += 1;
                            AMT += AmtCr;
                            CLEAR(AmtWord);
                            AmtWord[1] := Thai.ThaiAmountWords(ROUND(AMT, 0.01, '='));
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        if NoOfLoops > 0 then begin
                            CLEAR(Line);
                            CLEAR(AVReceiptL);
                            AVReceiptL.SETCURRENTKEY(AVReceiptL."Receipt No.");
                            AVReceiptL.SETRANGE(AVReceiptL."Receipt No.", "Receipt No.");
                            if AVReceiptL.FINDFIRST then begin
                                Line := AVReceiptL.COUNT;
                            end;
                        end else begin
                            if OldReceiptOrder <> "Receipt No." then begin
                                CLEAR(Line);
                                CLEAR(AVReceiptL);
                                AVReceiptL.SETCURRENTKEY(AVReceiptL."Receipt No.");
                                AVReceiptL.SETRANGE(AVReceiptL."Receipt No.", "Receipt No.");
                                if AVReceiptL.FINDFIRST then begin
                                    Line := AVReceiptL.COUNT;
                                end;
                            end;
                        end;

                        OldReceiptOrder := "Receipt No.";

                        //---------------------------------------------------------------------------------------//

                        Running := Running + 1;

                        //AVPPF.001 16/09/2013
                        if (Running mod MaxLine) = 1 then
                            RunPage += 1;
                        //C-AVPPF.001 16/09/2013

                        //Running += 1;

                        CLEAR(AmtWord);
                        //AMT := "Receipt/Tax Invoice Line".Amount;
                        AmtWord[1] := Thai.ThaiAmountWords(ROUND(AMT, 0.01, '='));
                        //ConvertNumberToString.InitTextVariable;
                        //ConvertNumberToString.FormatNoText(AmtWord,(AMT),'');
                        //AmtWord[1] := '(' + AmtWord[1] + ')';

                        CountLine := COUNT;
                        CLEAR(ReceiptInvLine);
                        ReceiptInvLine.SETCURRENTKEY(ReceiptInvLine."Receipt No.");
                        ReceiptInvLine.SETRANGE(ReceiptInvLine."Receipt No.", "Receipt No.");
                        if ReceiptInvLine.FindSet() then begin
                            repeat
                                Clear(SaleInvLineTB);
                                SaleInvLineTB.SetCurrentKey("Document No.");
                                SaleInvLineTB.SetRange("Document No.", ReceiptInvLine."Document No.");
                                if SaleInvLineTB.FINDFIRST then begin
                                    CountLine += SaleInvLineTB.COUNT;
                                end;

                                Clear(SaleCrLineTB);
                                SaleCrLineTB.SetCurrentKey("Document No.");
                                SaleCrLineTB.SetRange("Document No.", ReceiptInvLine."Document No.");
                                if SaleCrLineTB.FINDFIRST then begin
                                    CountLine += SaleCrLineTB.COUNT;
                                end;
                            until ReceiptInvLine.Next() = 0;
                        end;


                        if Type = Type::Invoice then begin
                            CLEAR(InvHead);
                            InvHead.SETFILTER(InvHead."No.", "Document No.");
                            InvHead.NEXT;
                            InvDate := InvHead."Posting Date";
                            DocNo := InvHead."No.";
                            DUEDATE := InvHead."Due Date";
                        end
                        else
                            if Type = Type::"Credit Memo" then begin
                                CLEAR(CrHead);
                                CrHead.SETFILTER(CrHead."No.", "Document No.");
                                CrHead.NEXT;
                                InvDate := CrHead."Posting Date";
                                DocNo := CrHead."No.";
                                DUEDATE := CrHead."Due Date";
                            end;

                        /*
                        CLEAR("Cust. Ledger Entry TB");
                        CASE Type OF
                        Type::Invoice :
                            "Cust. Ledger Entry TB".SETRANGE("Document Type","Cust. Ledger Entry TB"."Document Type"::Invoice);
                        Type::"Credit Memo" :
                            "Cust. Ledger Entry TB".SETRANGE("Document Type","Cust. Ledger Entry TB"."Document Type"::"Credit Memo");
                        END;
                        
                        "Cust. Ledger Entry TB".SETRANGE("Document No.","Document No.");
                        IF "Cust. Ledger Entry TB".FIND('-') THEN
                        BEGIN
                            "Cust. Ledger Entry TB".CALCFIELDS("Original Amt. (LCY)","Remaining Amt. (LCY)");
                            CLEAR(REMAINAMT);
                            REMAINAMT := "Cust. Ledger Entry TB"."Remaining Amt. (LCY)";
                        END;
                        
                        
                        CLEAR(REAMT);
                        REAMT := ("Cust. Ledger Entry TB"."Remaining Amt. (LCY)" - Amount);
                        */

                        //AMT := AMT + "Receipt/Tax Invoice Line"."Amount Exclued. VAT";
                        //AMT := AMT + "Receipt/Tax Invoice Line".Amount;

                        CLEAR(CHECKDAY);
                        CLEAR(CHECKMONTH);
                        CLEAR(CHECKYEAR);
                        if "Receipt/Tax Invoice Header"."Check Date" <> 0D then begin
                            CHECKDAY := FORMAT(DATE2DMY("Receipt/Tax Invoice Header"."Check Date", 1));
                            if STRLEN(CHECKDAY) = 1 then
                                CHECKDAY := '0' + CHECKDAY;

                            CHECKMONTH := FORMAT(DATE2DMY("Receipt/Tax Invoice Header"."Check Date", 2));
                            if STRLEN(CHECKMONTH) = 1 then
                                CHECKMONTH := '0' + CHECKMONTH;

                            CHECKYEAR := FORMAT(DATE2DMY("Receipt/Tax Invoice Header"."Check Date", 3));
                        end;

                        CLEAR(TCash);
                        CLEAR(TCheque);
                        if "Receipt/Tax Invoice Header".Cash then
                            TCash := 'X';
                        if "Receipt/Tax Invoice Header".Check then
                            TCheque := 'X';
                        if "Receipt/Tax Invoice Header".Transfer then
                            TTransfer := 'X';

                    end;

                    trigger OnPreDataItem();
                    begin
                        //AVPPF.001 16/09/2013
                        Allpage := ROUND(COUNT / MaxLine, 1, '>');
                        //C-AVPPF.001 16/09/2013
                    end;
                }
                dataitem("Empty Line"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(Number_EmptyLine; "Empty Line".Number)
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        //if (Line = Running) and (Running mod MaxLine <> 0) then begin
                        if (CountLine mod MaxLine = 0) then
                            SETRANGE(Number, 1, 0)
                        else begin
                            AddLine := MaxLine - (CountLine mod MaxLine);
                            SETRANGE(Number, 1, AddLine);
                        end;
                        //end else
                        //SETRANGE(Number, 1, 0);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(Running);
                    CLEAR(Line);
                    Clear(AMT);
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    SETRANGE(Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR("Customer TB");
                if "Customer TB".GET("Bill-to Customer No.") then;

                if "Receipt/Tax Invoice Header".Cash then
                    RECEIPT[1] := 'x';

                if "Receipt/Tax Invoice Header".Transfer then
                    RECEIPT[2] := 'x';

                if "Receipt/Tax Invoice Header".Check then
                    RECEIPT[3] := 'x';

                CLEAR(VatBusPostingGroup);
                VatBusPostingGroup.SETRANGE(Code, "VAT Bus. Posting Group");
                if VatBusPostingGroup.FINDFIRST then;

                CLEAR(Running);
                CLEAR(AMT);
                CLEAR(RunPage);

                CLEAR(AVReceiptLineTB);
                AVReceiptLineTB.SETCURRENTKEY(AVReceiptLineTB."Receipt No.");
                AVReceiptLineTB.SETRANGE(AVReceiptLineTB."Receipt No.", "Receipt No.");
                if AVReceiptLineTB.FINDFIRST then begin
                    CountLineRec := AVReceiptLineTB.COUNT;
                end;
                Clear(MaxPage);
                MaxPage := Round(CountLineRec / MaxLine, 1, '>');
            end;

            trigger OnPreDataItem();
            begin
                if CompanyInfo.GET then;
                CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                MaxLine := 21;

                if AuthorizePerson = '' then
                    AuthorizePerson := '(                                          )'
                else
                    AuthorizePerson := '(' + AuthorizePerson + ')'
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
                    field(AuthorizePerson; AuthorizePerson)
                    {
                        Caption = 'Authorize Person';
                        ApplicationArea = All;
                    }
                }
                group("สำเนาเอกสาร")
                {

                    field("No. Of Copies"; NoOfCopies)
                    {
                        ApplicationArea = All;
                        Caption = 'No. Of Copies';

                        trigger OnValidate();
                        begin
                            Enabled();
                        end;
                    }
                    field("CopyText[1]"; CopyText[1])
                    {
                        ApplicationArea = All;
                        Caption = 'Original Text';
                    }
                    field("CopyText[2]"; CopyText[2])
                    {
                        ApplicationArea = All;
                        Caption = 'Copy Text 1';
                        Editable = CopyTextEditable2;
                    }
                    field("CopyText[3]"; CopyText[3])
                    {
                        ApplicationArea = All;
                        Caption = 'Copy Text 2';
                        Editable = CopyTextEditable3;
                    }
                    field("CopyText[4]"; CopyText[4])
                    {
                        ApplicationArea = All;
                        Caption = 'Copy Text 3';
                        Editable = CopyTextEditable4;
                    }
                    field("CopyText[5]"; CopyText[5])
                    {
                        ApplicationArea = All;
                        Caption = 'Copy Text 4';
                        Editable = CopyTextEditable5;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            NoOfCopies := 1;
            Enabled;
            if CopyText[1] = '' then CopyText[1] := 'ต้นฉบับ / Original';
            if CopyText[2] = '' then CopyText[2] := 'สำเนา / Copy';
            //if CopyText[3] = '' then CopyText[3] := 'สำเนาบัญชี / Account Copy';
            //if CopyText[4] = '' then CopyText[4] := 'สำเนาคลัง / Stock Copy';
        end;
    }

    labels
    {
    }

    var
        AuthorizePerson: Text[100];
        CompanyInfo: Record "Company Information";
        "Customer TB": Record Customer;
        RECEIPT: array[3] of Text[1];
        Running: Integer;
        AddLine: Integer;
        AMT: Decimal;
        VATAmt: Decimal;
        TotalAmt: Decimal;
        OldReceiptOrder: Code[20];
        Line: Integer;
        AVReceiptL: Record "AVF_Receipt/Tax Invoice Line";
        MaxLine: Integer;
        InvHead: Record "Sales Invoice Header";
        InvDate: Date;
        DocNo: Code[20];
        DUEDATE: Date;
        CrHead: Record "Sales Cr.Memo Header";
        "Cust. Ledger Entry TB": Record "Cust. Ledger Entry";
        REMAINAMT: Decimal;
        REAMT: Decimal;
        CHECKDAY: Text[2];
        CHECKMONTH: Text[2];
        CHECKYEAR: Text[4];
        AmtWord: array[2] of Text[1024];
        ConvertNumberToString: Report Check;
        TCash: Text[1];
        TCheque: Text[1];
        TTransfer: Text[1];
        Thai: Codeunit AVF_Thai;
        Allpage: Integer;
        RunPage: Integer;
        VatBusPostingGroup: Record "VAT Business Posting Group";
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        MaxPage: Decimal;
        AVReceiptLineTB: Record "AVF_Receipt/Tax Invoice Line";
        CountLineRec: Integer;
        CopyText: array[5] of Text[200];
        CopyTextEditable2: Boolean;
        CopyTextEditable3: Boolean;
        CopyTextEditable4: Boolean;
        CopyTextEditable5: Boolean;

        SaleInvHeadTB: Record "Sales Invoice Header";
        saleCrHeadTB: Record "Sales Cr.Memo Header";
        DescInv: Text[150];
        DescCr: Text[150];
        AmtInv: Decimal;
        AmtCr: Decimal;
        ShowLineInv: Boolean;
        ShowLineCr: Boolean;
        CountLine: Integer;
        ReceiptInvLine: Record "AVF_Receipt/Tax Invoice Line";
        SaleInvLineTB: Record "Sales Invoice Line";
        SaleCrLineTB: Record "Sales Cr.Memo Line";

    procedure Enabled();
    begin
        if NoOfCopies < 1 then begin
            CopyTextEditable2 := (false);
            CopyTextEditable3 := (false);
            CopyTextEditable4 := (false);
            CopyTextEditable5 := (false);
        end;

        if NoOfCopies >= 4 then begin
            CopyTextEditable2 := (true);
            CopyTextEditable3 := (true);
            CopyTextEditable4 := (true);
            CopyTextEditable5 := (true);
        end
        else
            if NoOfCopies >= 3 then begin
                CopyTextEditable2 := (true);
                CopyTextEditable3 := (true);
                CopyTextEditable4 := (true);
                CopyTextEditable5 := (false);
            end
            else
                if NoOfCopies >= 2 then begin
                    CopyTextEditable2 := (true);
                    CopyTextEditable3 := (true);
                    CopyTextEditable4 := (false);
                    CopyTextEditable5 := (false);
                end
                else
                    if NoOfCopies >= 1 then begin
                        CopyTextEditable2 := (true);
                        CopyTextEditable3 := (false);
                        CopyTextEditable4 := (false);
                        CopyTextEditable5 := (false);
                    end;
    end;
}

