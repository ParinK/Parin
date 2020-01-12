report 50049 "INT_Sales Credit Note"
{
    // version AVTHLC1.0

    // AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Sales Credit Note.rdl';
    Caption = 'Sales Credit Note';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyifDetail = true;
            RequestFilterFields = "No.";
            column(OptionHeaderTHA; OptionHeaderTHA)
            {
            }
            column(OptionHeaderEN; OptionHeaderEN)
            {
            }
            column(MaxPage; MaxPage)
            {
            }
            column(CompanyInfo_AddressEng; CompanyInfo.FNGN001_AddressEng)
            {
            }
            column(CompanyInfo_AddressEng2; CompanyInfo."FNGN001_AddressEng 2")
            {
            }
            column(CompanyInfo_HomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyInfo_NameEng; CompanyInfo.FNGN001_NameEng + ' ' + CompanyInfo."FNGN001_NameEng 2")
            {
            }
            column(No_SalesCrMemoHeader; "Sales Cr.Memo Header"."No.")
            {
            }
            column(InvAmount; InvAmt)
            {
            }
            column(CountPage; CountPage)
            {
            }
            column(AllPages; AllPages)
            {
            }
            column(PostingDate1; RefInvDate)
            {
            }
            column(RefInvAmt; RefInvAmt)
            {
            }
            column(CurrencyTxt; CurrencyTxt)
            {
            }
            column(CurrencyRate; CurrencyRate)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(OutputNo; OutputNo)
                {
                }
                column(Number_Loop; format(Number))
                {
                }
                column(HeaderText; HeaderText)
                {
                }
                column(CompanyName; CompanyInfo.Name)
                {
                }
                column(CompanyPicture; CompanyInfo.Picture)
                {
                }
                column(CompanyAddress; CompanyInfo.Address)
                {
                }
                column(CompanyAddress2; CompanyInfo."Address 2")
                {
                }
                column(CompanyPhone; 'Tel: ' + CompanyInfo."Phone No." + ' Fax: ' + CompanyInfo."Fax No.")
                {
                }
                column(CompanyVAT; 'Tax No.: ' + CompanyInfo."VAT Registration No.")
                {
                }
                column(CompanyEmail; 'E: ' + CompanyInfo."E-Mail")
                {
                }
                column(CompanyHomePage; 'W: ' + CompanyInfo."Home Page")
                {
                }
                column(PostingDate_SalesCrMemoHeader; FORMAT("Sales Cr.Memo Header"."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(YourReference_SalesCrMemoHeader; "Sales Cr.Memo Header"."Your Reference")
                {
                }
                column(RefSalesperson; Salesperson.Name)
                {
                }
                column(SelltoCustomerNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Customer No.")
                {
                }
                column(BilltoCustomerNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Customer No.")
                {
                }
                column(BilltoName_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Name")
                {
                }
                column(BilltoName2_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Name 2")
                {
                }
                column(BilltoAddress_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Address")
                {
                }
                column(BilltoAddress2_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Address 2")
                {
                }
                column(BilltoAddress3_SalesCrMemoHeader; "Sales Cr.Memo Header"."AVF_Bill-to Address 3")
                {
                }
                column(CustomerBranchNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."AVF_Customer Branch No.")
                {
                }
                column(PhoneNo_Customer; Customer."Phone No.")
                {
                }
                column(FaxNo_Customer; Customer."Fax No.")
                {
                }
                column(Email_Customer; Customer."E-Mail")
                {
                }
                column(PostingDescription_SalesCrMemoHeader; "Sales Cr.Memo Header"."Posting Description")
                {
                }
                column(VATBusPostingGroup_SalesCrMemoHeader; "Sales Cr.Memo Header"."VAT Registration No.")
                {
                }
                column(Descrip_VatBusPos; VatBusPos."AVF_Branch No.")
                {
                }
                column(VATPersent; VATPersent)
                {
                }
                dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Cr.Memo Header";
                    DataItemTableView = SORTING("Document No.", "Line No.");
                    column(RunningNo; RunningNo)
                    {
                    }
                    column(Type_SalesCrMemoLine; "Sales Cr.Memo Line".Type)
                    {
                    }
                    column(No_SalesCrMemoLine; "Sales Cr.Memo Line"."No.")
                    {
                    }
                    column(Description_SalesCrMemoLine; "Sales Cr.Memo Line".Description)
                    {
                    }
                    column(Description2_SalesCrMemoLine; "Sales Cr.Memo Line"."Description 2")
                    {
                    }
                    column(UnitofMeasure_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit of Measure")
                    {
                    }
                    column(Quantity_SalesCrMemoLine; "Sales Cr.Memo Line".Quantity)
                    {
                    }
                    column(QtyText; QtyText)
                    {
                    }
                    column(UnitPrice_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit Price")
                    {
                    }
                    column(LineAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Amount")
                    {
                    }
                    column(InvDiscountAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Inv. Discount Amount")
                    {
                    }
                    column(LineDiscountAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Discount Amount")
                    {
                    }
                    column(Amount_SalesCrMemoLine; "Sales Cr.Memo Line".Amount)
                    {
                    }
                    column(AmountIncludingVAT_SalesCrMemoLine; "Sales Cr.Memo Line"."Amount Including VAT")
                    {
                    }
                    column(LineAmount; LineAmount)
                    {
                    }
                    column(SubTotal; SubTotal)
                    {
                    }
                    column(LineVAT; LineVAT)
                    {
                    }
                    column(Line; Line)
                    {
                    }
                    column(allline; AllLine)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin

                        Line += 1;
                        if "No." <> '' then
                            RunningNo += 1;
                        if "Description 2" <> '' then
                            Line += 1;


                        //if (((RunningNo-1) MOD MaxLine)=0) AND (RunningNo<>1) then
                        //  CountPage+=1;
                        if (((Line - 1) mod MaxLine) = 0) and (Line <> 1) then
                            CountPage += 1;


                        LineVAT := (Amount * "VAT %") / 100;
                        //LineAmount :=  Amount;
                        SubTotal += Amount;

                        if "Sales Cr.Memo Line"."VAT %" <> 0 then
                            VATPersent := FORMAT("Sales Cr.Memo Line"."VAT %", 0, '<Precision,0:0><Sign><Integer Thousand><Decimals>') + '%';
                        if "VAT Prod. Posting Group" = 'NOVAT' then
                            VATPersent := '';

                        //AVKSAVIP.001 30/10/2019
                        Clear(QtyText);
                        if Quantity mod 1 = 0 then
                            QtyText := Format(Quantity)
                        else
                            QtyText := Format(Quantity, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                        //C-AVKSAVIP.001 30/10/2019

                    end;

                    trigger OnPreDataItem();
                    begin
                        RunningNo := 0;
                        //AllLine := COUNT;

                        CLEAR(CountSaleCrLine);
                        CountSaleCrLine.SetRange("Document No.", "Sales Cr.Memo Header"."No.");
                        if CountSaleCrLine.FIND('-') then begin
                            repeat
                                AllLine += 1;
                                if CountSaleCrLine."Description 2" <> '' then
                                    AllLine += 1;
                            until CountSaleCrLine.NEXT = 0;
                        end;

                        //CLEAR(VATPersent);

                        AllPages := ROUND(COUNT / MaxLine, 1, '>');
                    end;
                }
                dataitem("Empty Line"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(AddLine; AddLine)
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        if Line = AllLine then begin
                            if (Line mod MaxLine) = 0 then
                                SetRange(Number, 1, 0)
                            else begin
                                AddLine := MaxLine - (Line mod MaxLine);
                                SetRange(Number, 1, AddLine);
                            end;
                        end
                        else
                            SetRange(Number, 1, 0);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    if Number > 1 then begin
                        //CopyText := STRSUBSTNO(Text003,CopyText[]);
                        OutputNo += 1;
                    end;
                    //CurrReport.PAGENO := 1;
                    CLEAR(AllLine);
                    CLEAR(RunningNo);
                    CLEAR(Line);
                    CountPage := 1;
                    HeaderText := GetHeaderText(CopyLoop.Number);
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
                    if CopyText[1] = '' then
                        CopyText[1] := 'ต้นฉบับ/Original';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(Vatpersent);
                //AVKSAVIP 28/10/2019
                IF OptionHeaderTHA = OptionHeaderTHA::"ใบลดหนี้" then
                    OptionHeaderEN := OptionHeaderEN::"Credit Note"
                else
                    OptionHeaderEN := OptionHeaderEN::"Credit Note/Tax";

                Clear(CountLine);
                clear(SalesCrLineCount);
                SalesCrLineCount.SetRange("Document No.", "No.");
                IF SalesCrLineCount.FindSet then
                    repeat
                        CountLine += 1;
                        if SalesCrLineCount."Description 2" <> '' then
                            CountLine += 1;
                    until SalesCrLineCount.Next = 0;
                clear(MaxPage);
                MaxPage := Round(CountLine / MaxLine, 1, '>');

                IF "Sales Cr.Memo Header"."Currency Code" <> '' then begin
                    CurrencyTxt := CopyStr("Sales Cr.Memo Header"."Currency Code", 1, 3);
                    CurrencyRate := Round(1 / "Sales Cr.Memo Header"."Currency Factor", 0.01, '=');
                end;
                //C-AVKSAVIP 28/10/2019

                CLEAR(AllLine);
                CLEAR(RunningNo);
                CLEAR(Line);

                CountPage := 1;

                CLEAR(Customer);
                CLEAR(Salesperson);

                if "Bill-to Customer No." <> '' then
                    Customer.GET("Bill-to Customer No.")
                else
                    Customer.GET("Sell-to Customer No.");

                if "Salesperson Code" <> '' then
                    Salesperson.GET("Salesperson Code");


                CLEAR(AppliedInv);
                if "Your Reference" <> '' then begin
                    AppliedInv := "Your Reference";
                    //AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                    if "Sales Cr.Memo Header"."FNGN002_Ref. Invoice Date" <> 0D then
                        RefInvDate := FORMAT("Sales Cr.Memo Header"."FNGN002_Ref. Invoice Date", 0, '<Day,2>/<Month,2>/<Year4>')
                    else begin
                        //C-AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                        repeat
                            CLEAR(POS);
                            POS := STRPOS(AppliedInv, ',');
                            if POS > 0 then begin
                                if AppliedInv1 = '' then begin
                                    AppliedInv1 := AppliedInv1 + COPYSTR(AppliedInv, 1, POS - 1);

                                    CLEAR(refSalesInvHead);
                                    refSalesInvHead.SetRange(refSalesInvHead."No.", COPYSTR(AppliedInv, 1, POS - 1));
                                    if refSalesInvHead.FindFirst then begin
                                        refSalesInvHead.CALCFIELDS("Amount Including VAT");
                                        RefInvDate := FORMAT(refSalesInvHead."Document Date", 0, 1);
                                    end;
                                end
                                else begin
                                    AppliedInv1 := AppliedInv1 + '|' + COPYSTR(AppliedInv, 1, POS - 1);

                                    CLEAR(refSalesInvHead);
                                    refSalesInvHead.SetRange(refSalesInvHead."No.", COPYSTR(AppliedInv, 1, POS - 1));
                                    if refSalesInvHead.FindFirst then begin
                                        refSalesInvHead.CALCFIELDS("Amount Including VAT");
                                        RefInvDate += ', ' + FORMAT(refSalesInvHead."Document Date", 0, 1);
                                    end;
                                end;
                                AppliedInv := DELSTR(AppliedInv, 1, POS);
                            end
                            else begin
                                if (AppliedInv <> '') and (AppliedInv1 <> '') then begin
                                    AppliedInv1 := AppliedInv1 + '|' + AppliedInv;

                                    CLEAR(refSalesInvHead);
                                    refSalesInvHead.SetRange(refSalesInvHead."No.", AppliedInv);
                                    if refSalesInvHead.FindFirst then begin
                                        refSalesInvHead.CALCFIELDS("Amount Including VAT");
                                        RefInvDate += ', ' + FORMAT(refSalesInvHead."Document Date", 0, '<Day,2>/<Month,2>/<Year4>');
                                    end;
                                end
                                else begin
                                    CLEAR(refSalesInvHead);
                                    refSalesInvHead.SetRange(refSalesInvHead."No.", AppliedInv);
                                    if refSalesInvHead.FindFirst then begin
                                        refSalesInvHead.CALCFIELDS("Amount Including VAT");
                                        RefInvDate := FORMAT(refSalesInvHead."Document Date", 0, '<Day,2>/<Month,2>/<Year4>');
                                    end;
                                end;
                            end;
                        until (POS = 0);
                        //AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                    end;
                    //C-AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                    AppliedInv1 := AppliedInv;
                end;

                /*
                if "Applies-to Doc. No." <> '' then
                begin
                  if AppliedInv1 <> '' then
                    AppliedInv1 := AppliedInv1 + '|' + "Applies-to Doc. No."
                  ELSE
                    AppliedInv1 := "Applies-to Doc. No.";
                end;
                */

                CLEAR(InvAmt);
                CLEAR(SalesInvHead);
                //AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                if (AppliedInv1 <> '') and ("Sales Cr.Memo Header"."FNGN002_Ref.Inv.Amt.Incd.VAT" = 0) then
                //if AppliedInv1 <> '' then
                //C-AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                begin
                    SalesInvHead.SETFILTER("No.", AppliedInv1);
                    if SalesInvHead.FIND('-') then begin
                        repeat
                            SalesInvHead.CALCFIELDS(SalesInvHead.Amount);
                            SalesInvHead.CALCFIELDS(SalesInvHead."Amount Including VAT");
                            InvAmt := InvAmt + SalesInvHead.Amount;
                            InvIncAmt += SalesInvHead."Amount Including VAT";
                        until SalesInvHead.NEXT = 0;
                    end;
                end
                //AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.
                else begin
                    InvAmt := "Sales Cr.Memo Header"."FNGN002_Ref.Inv.Amt.Incd.VAT" / 1.07;
                    InvIncAmt := "Sales Cr.Memo Header"."FNGN002_Ref.Inv.Amt.Incd.VAT";
                end;
                //E-AVWCACIP.001 15.06.2014 Add code for Ref. Invoice Date & Ref. Invoice Amt.

                if InvIncAmt <> 0 then
                    RefInvAmt := FORMAT(InvIncAmt, 0, '<Precision,2:2><Integer Thousand><Decimals>')
                else
                    RefInvAmt := '';

                //AVNOJ VIP3 050913
                CLEAR(VatBusPos);
                VatBusPos.SetCurrentKey(Code);
                VatBusPos.SetRange(VatBusPos.Code, "Sales Cr.Memo Header"."VAT Bus. Posting Group");
                if VatBusPos.FIND('-') then;
                //end AVNOJ VIP3 050913

            end;

            trigger OnPreDataItem();
            begin
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");//AVKSAVIP 24/10/2019 commemt code
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                MaxLine := 18;
            end;
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
                    field(NoOfCopy; NoOfCopies)
                    {
                        ApplicationArea = all;
                        Caption = 'No. of Copies';
                        MaxValue = 1;
                        MinValue = 0;

                        trigger OnValidate();
                        begin
                            EnableControl();
                        end;
                    }
                    field(OriginalText; CopyText[1])
                    {
                        ApplicationArea = all;
                        CaptionML = ENU = 'Original Text',
                                    THA = 'Original Text';
                    }
                    field(CopyText1; CopyText[2])
                    {
                        ApplicationArea = all;
                        CaptionML = ENU = 'Copy Text 1',
                                    THA = 'Copy Text 1';
                        Editable = EnaCopyText1;
                    }
                    field(CopyText2; CopyText[3])
                    {
                        ApplicationArea = all;
                        CaptionML = ENU = 'Copy Text 2',
                                    THA = 'Copy Text 2';
                        Editable = EnaCopyText2;
                    }
                    field(CopyText3; CopyText[4])
                    {
                        ApplicationArea = all;
                        CaptionML = ENU = 'Copy Text 3',
                                    THA = 'Copy Text 3';
                        Editable = EnaCopyText3;
                    }
                    field(CopyText4; CopyText[5])
                    {
                        ApplicationArea = all;
                        CaptionML = ENU = 'Copy Text 4',
                                    THA = 'Copy Text 4';
                        Editable = EnaCopyText4;
                    }
                    field(OptionHeaderTHA; OptionHeaderTHA)
                    {
                        ApplicationArea = all;
                        Caption = 'Option Header';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            EnaCopyText1 := false;
            EnaCopyText2 := false;
            EnaCopyText3 := false;
            EnaCopyText4 := false;
            EnableControl();
        end;

        trigger OnOpenPage();
        begin
            if CopyText[1] = '' then CopyText[1] := 'ต้นฉบับ / Original';
            if CopyText[2] = '' then CopyText[2] := 'สำเนา / Copy';
            //if CopyText[3] = '' then CopyText[3] := 'สำเนาบัญชี / Account Copy';
            NoOfCopies := 1;
            EnableControl();
        end;
    }

    labels
    {
    }

    var
        Language: Record Language;
        CompanyInfo: Record "Company Information";
        Customer: Record Customer;
        AVSalePerson: Record "Salesperson/Purchaser";
        AVSaleCommentL: Record "Sales Comment Line";
        AVInvCNL: Record "Sales Cr.Memo Line";
        Salesperson: Record "Salesperson/Purchaser";
        SalesCrMemoHeade: Record "Sales Cr.Memo Header";
        OutputNo: Integer;
        NoOfLoops: Integer;
        NoOfCopies: Integer;
        CopyText: array[5] of Text;
        HeaderText: Text[50];
        TextComment: array[4] of Text[50];
        AppliedInv: Text;
        AppliedInv1: Text;
        POS: Integer;
        OldSaleInvoice: Code[20];
        AVNo: Code[20];
        DiscountTxt: Text;
        InvAmount: Decimal;
        Qty: Decimal;
        UnitPrice: Decimal;
        LineAmount: Decimal;
        LineVAT: Decimal;
        PostingDate1: Date;
        [InDataSet]
        EnaCopyText1: Boolean;
        [InDataSet]
        EnaCopyText2: Boolean;
        [InDataSet]
        EnaCopyText3: Boolean;
        [InDataSet]
        EnaCopyText4: Boolean;
        Line: Integer;
        MaxLine: Integer;
        AddLine: Integer;
        InvAmt: Decimal;
        AllPages: Integer;
        AllLine: Integer;
        RunningNo: Integer;
        SubTotal: Decimal;
        CountPage: Integer;
        CountSaleCrLine: Record "Sales Cr.Memo Line";
        VatBusPos: Record "VAT Business Posting Group";
        //VATPersent: Integer;
        VATPersent: Text[10];
        SalesCrLine: Record "Sales Cr.Memo Line";
        RefInvDate: Text[100];
        RefInvAmt: Text[100];
        InvIncAmt: Decimal;
        refSalesInvHead: Record "Sales Invoice Header";
        SalesInvHead: Record "Sales Invoice Header";
        SalesCrLineCount: Record "Sales Cr.Memo Line";
        OptionHeaderTHA: Option "ใบลดหนี้","ใบลดหนี้/ใบกำกับภาษี";
        OptionHeaderEN: Option "Credit Note","Credit Note/Tax";
        CountLine: Integer;
        MaxPage: integer;
        CurrencyTxt: Text;
        CurrencyRate: Decimal;
        QtyText: Text;

    procedure EnableControl();
    begin
        if NoOfCopies < 1 then begin
            EnaCopyText1 := false;
            EnaCopyText2 := false;
            EnaCopyText3 := false;
            EnaCopyText4 := false;
        end;

        if NoOfCopies >= 4 then begin
            EnaCopyText1 := true;
            EnaCopyText2 := true;
            EnaCopyText3 := true;
            EnaCopyText4 := true;
        end
        else
            if NoOfCopies >= 3 then begin
                EnaCopyText1 := true;
                EnaCopyText2 := true;
                EnaCopyText3 := true;
                EnaCopyText4 := false;
            end
            else
                if NoOfCopies >= 2 then begin
                    EnaCopyText1 := true;
                    EnaCopyText2 := true;
                    EnaCopyText3 := false;
                    EnaCopyText4 := false;
                end
                else
                    if NoOfCopies >= 1 then begin
                        EnaCopyText1 := true;
                        EnaCopyText2 := false;
                        EnaCopyText3 := false;
                        EnaCopyText4 := false;
                    end;

        RequestOptionsPage.UPDATE;
    end;

    procedure GetHeaderText(pInt: Integer): Text[50];
    begin
        exit(CopyText[pInt])
    end;
}

