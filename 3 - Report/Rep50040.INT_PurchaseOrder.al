report 50040 "INT_Purchase - Order"
{
    // version AVTHLC1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Purchase - Order.rdl';
    CaptionML = ENU = 'Purchase - Order';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "Document Type", "No.", "Posting Date";
            column(SumGranTotel1; SumGranTotel[1])
            {
            }
            column(SumGranTotel2; SumGranTotel[2])
            {
            }
            column(SumGranTotel3; SumGranTotel[3])
            {
            }
            column(SumGranTotel4; SumGranTotel[4])
            {
            }
            column(SumGranTotel5; SumGranTotel[5])
            {
            }
            column(SumGranTotel6; SumGranTotel[6])
            {
            }
            column(TextAmount; Thai.ThaiAmountWords(SumGranTotel[5]))
            {
            }
            column(UserId; USERID)
            {
            }
            column(PrintDoc; FORMAT(TODAY, 0, 1) + ' ' + FORMAT(TIME, 0, '<Hours12>:<Minute,2>:<Seconds,2> <AM/PM>'))
            {
            }
            column(CompanyName; Companyinfo.Name)
            {
            }
            column(CompanyAdress1; Companyinfo.Address)
            {
            }
            column(CompanyAdress2; Companyinfo."Address 2")
            {
            }
            column(CompanyPhone; 'Tel: ' + Companyinfo."INT_Phone Purchase" + '  ')
            {
            }
            column(CompanyVAT; 'Tax No.: ' + Companyinfo."VAT Registration No.")
            {
            }
            column(CompanyBranch; Companyinfo.INT_Branch)
            {
            }
            column(CompanyHomePage; Companyinfo."Home Page")
            {
            }
            column(CompanyNameEng; Companyinfo.FNGN001_NameEng)
            {
            }
            column(CompanyAddress1Eng; Companyinfo.FNGN001_AddressEng)
            {
            }
            column(CompanyAddress2Eng; Companyinfo."FNGN001_AddressEng 2")
            {
            }
            column(PIC_COMINFO; Companyinfo.Picture)
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(QuoteNo_PurchaseHeader; "Purchase Header"."Quote No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Purchase Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(BuyfromAddress3_PurchaseHeader; "Purchase Header"."AVF_Buy-from Address 3")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact")
            {
            }
            column(ShiptoName_PurchaseHeader; "Purchase Header"."Ship-to Name" + ' ' + "Purchase Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Purchase Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Purchase Header"."Ship-to Address 2")
            {
            }
            column(ShiptoAddress3_PurchaseHeader; "Purchase Header"."AVF_Ship-to Address 3")
            {
            }
            column(DocumentDate_PurchaseHeader; FORMAT("Purchase Header"."Document Date", 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(Day; Day)
            {

            }
            column(Month; Month)
            {

            }
            column(Year; Year)
            {

            }
            column(ReqRecptDate_PurchaseHeader; FORMAT("Requested Receipt Date", 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(VendorOrderNo_PurchaseHeader; "Purchase Header"."Vendor Order No.")
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; FORMAT("Purchase Header"."Expected Receipt Date", 0, 1))
            {
            }
            column(VendorBranchNo_PurchaseHeader; "Purchase Header"."AVF_Vendor Branch No.")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "Purchase Header"."VAT Registration No.")
            {
            }
            column(ApproveName_PurchaseHeader; "Purchase Header"."INT_Approve Name")
            {
            }
            column(ShipMethod_Description; ShipMethod.Description)
            {
            }
            column(PayTerms_Description; PayTerms.Description)
            {
            }
            column(VenTB_PhoneNo; VenTB."Phone No.")
            {
            }
            column(VenTB_FaxNo; VenTB."Fax No.")
            {
            }
            column(VenTB_EMail; VenTB."E-Mail")
            {
            }
            column(Comments1; Comments[1])
            {
            }
            column(Comments2; Comments[2])
            {
            }
            column(Comments3; Comments[3])
            {
            }
            column(Comments4; Comments[4])
            {
            }

            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                PrintOnlyIfDetail = true;
                column(Number_CopyLoop; CopyLoop.Number)
                {
                }
                column(TotalAMT; TotalAMT)
                {
                }
                column(TotalDIS; TotalDIS)
                {
                }
                column(TotalVAT; TotalVAT)
                {
                }
                column(TxtHeader; TxtHeader)
                {
                }
                column(TotalInvDis; TotalInvDis)
                {
                }
                //AVPKJVIP.001 28.10.2019
                column(DepartmentName; DeptCode)
                {
                }
                //C-AVPKJVIP.001 28.10.2019

                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemLinkReference = "Purchase Header";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                    PrintOnlyIfDetail = false;
                    column(RunningNum; RunShow)
                    {
                    }
                    column(No_PurchaseLine; "Purchase Line"."No.")
                    {
                    }
                    column(Description_PurchaseLine; "Purchase Line".Description)
                    {
                    }
                    column(Description2_PurchaseLine; "Purchase Line"."Description 2")
                    {
                    }
                    column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
                    {
                    }
                    column(Quantity_PurchaseLine; FORMAT("Purchase Line".Quantity, 0, '<Precision,0:2><Sign><Integer Thousand><Decimals>'))
                    {
                    }
                    column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                    {
                    }
                    column(LineDiscountAmount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                    {
                    }
                    column(Amount_PurchaseLine; "Purchase Line"."Line Amount")
                    {
                    }
                    column(TL; TL)
                    {
                    }
                    column(Maxline; Maxline)
                    {
                    }
                    column(AddLine; AddLine)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        RunningNum += 1;
                        if "Description 2" <> '' then RunningNum += 1;

                        if "No." <> '' then RunShow += 1;

                        if DeptCode = '' then begin
                            Clear(DimensionValue);
                            DimensionValue.SetCurrentKey("Dimension Code", "Code");
                            DimensionValue.SetRange(DimensionValue."Dimension Code", 'COST CENTER');
                            DimensionValue.SetRange(DimensionValue.Code, "Purchase Line"."Shortcut Dimension 1 Code");
                            if DimensionValue.FindFirst() then
                                DeptCode := DimensionValue.Name;
                        end;

                        TotalAMT += "Purchase Line"."Line Amount";
                        TotalDIS += "Purchase Line"."Line Discount Amount";
                        TotalVAT += "Purchase Line"."Amount Including VAT" - "Purchase Line".Amount;
                        TotalInvDis += "Purchase Line"."Inv. Discount Amount";

                        SumGranTotel[1] += "Purchase Line"."Line Amount";
                        SumGranTotel[2] += "Purchase Line"."Inv. Discount Amount";
                        SumGranTotel[3] += "Purchase Line"."Line Amount" - "Purchase Line"."Inv. Discount Amount";
                        SumGranTotel[4] += 0;
                        SumGranTotel[5] += "Purchase Line"."Amount Including VAT";
                        SumGranTotel[6] += "Purchase Line".Amount;
                    end;

                    trigger OnPreDataItem();
                    begin
                        //TL:=COUNT;

                        CLEAR(TL);
                        CLEAR(CountPurchLine);
                        CountPurchLine.SETRANGE("Document Type", "Purchase Header"."Document Type");
                        CountPurchLine.SETRANGE("Document No.", "Purchase Header"."No.");
                        if CountPurchLine.FIND('-') then begin
                            repeat

                                TL += 1;
                                if CountPurchLine."Description 2" <> '' then
                                    TL += 1;
                            until CountPurchLine.NEXT = 0;
                        end;
                        CLEAR(RunShow);
                        CLEAR(SumGranTotel);
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
                        if (TL = RunningNum) and (RunningNum <> Maxline) then begin
                            if (TL mod Maxline = 0) then
                                SETRANGE(Number, 1, 0)
                            else begin
                                AddLine := Maxline - (TL mod Maxline);
                                SETRANGE(Number, 1, AddLine);
                            end;
                        end else
                            SETRANGE(Number, 1, 0);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(RunningNum);
                    CLEAR(TotalAMT);
                    CLEAR(TotalDIS);
                    CLEAR(TotalVAT);
                    CLEAR(TotalInvDis);
                    Clear(DeptCode);

                    if Number = 1 then
                        TxtHeader := 'ต้นฉบับ'
                    else
                        TxtHeader := 'สำเนา'
                end;

                trigger OnPreDataItem();
                begin
                    SETRANGE(Number, 1, NoOfCopies);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                if not VenTB.GET("Buy-from Vendor No.") then
                    CLEAR(VenTB);

                CLEAR(ShipMethod);
                if "Shipment Method Code" <> '' then
                    ShipMethod.GET("Shipment Method Code");

                CLEAR(PayTerms);
                if "Payment Terms Code" <> '' then
                    PayTerms.GET("Payment Terms Code");


                CLEAR(i);
                CLEAR(Comments);
                CLEAR(AVPurchaseComment);
                AVPurchaseComment.SETCURRENTKEY(AVPurchaseComment."Document Type", AVPurchaseComment."No.");
                AVPurchaseComment.SETRANGE(AVPurchaseComment."No.", "No.");
                AVPurchaseComment.SETRANGE(AVPurchaseComment."Document Type", "Document Type");
                AVPurchaseComment.SETRANGE(AVPurchaseComment."Document Line No.", 0);
                if AVPurchaseComment.FIND('-') then
                    repeat
                        i += 1;
                        if i <= 4 then
                            Comments[i] := AVPurchaseComment.Comment;
                    until (AVPurchaseComment.NEXT = 0);

                //AVPKJVIP.001 28.10.2019
                /*Clear(DimensionValue);
                DimensionValue.SetCurrentKey("Dimension Code", "Code");
                DimensionValue.SetRange(DimensionValue."Dimension Code", 'COST CENTER');
                DimensionValue.SetRange(DimensionValue.Code, "Purchase Header"."Shortcut Dimension 1 Code");
                if DimensionValue.FindFirst() then;*/
                //C-AVPKJVIP.001 28.10.2019

                if "Purchase Header"."Document Date" <> 0D then begin
                    if Date2DMY("Purchase Header"."Document Date", 1) < 10 then
                        Day := '0' + format(Date2DMY("Purchase Header"."Document Date", 1))
                    else
                        Day := format(Date2DMY("Purchase Header"."Document Date", 1));
                    if Date2DMY("Purchase Header"."Document Date", 2) < 10 then
                        Month := '0' + format(Date2DMY("Purchase Header"."Document Date", 2))
                    else
                        Month := format(Date2DMY("Purchase Header"."Document Date", 2));
                    Year := format(Date2DMY("Purchase Header"."Document Date", 3));
                end;
            end;

            trigger OnPreDataItem();
            begin
                Companyinfo.GET();
                Companyinfo.CALCFIELDS(Companyinfo.Picture);
                Maxline := 14;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    Visible = false;
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
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
        end;
    }

    labels
    {
    }

    var
        Companyinfo: Record "Company Information";
        SalesPerson: Record "Salesperson/Purchaser";
        RunningNum: Integer;
        TL: Integer;
        Maxline: Integer;
        AddLine: Integer;
        VenTB: Record Vendor;
        ShipMethod: Record "Shipment Method";
        PayTerms: Record "Payment Terms";
        Comments: array[5] of Text[100];
        AVPurchaseComment: Record "Purch. Comment Line";
        i: Integer;
        Thai: Codeunit AVF_Thai;
        NoOfCopies: Integer;
        TotalAMT: Decimal;
        TotalDIS: Decimal;
        TotalVAT: Decimal;
        TxtHeader: Text[30];
        TotalInvDis: Decimal;
        CountPurchLine: Record "Purchase Line";
        RunShow: Integer;
        SumGranTotel: array[6] of Decimal;
        DimensionValue: Record "Dimension Value";   //AVPKJVIP.001 28.10.2019
        Day: Text[5];
        Month: Text[5];
        Year: Text[5];
        DeptCode: code[50];

}

