report 50041 "INT_Purchase-Rcpt"
{
    // version AVTHLC1.0,AVWCASTD.02

    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Purchase - Receipt.rdl';
    CaptionML = ENU = 'Purchase - Receipt';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
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
            column(CompanyPhone; 'Tel: ' + Companyinfo."Phone No." + ' Fax: ' + Companyinfo."Fax No.")
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
            column(No_PurchaseHeader; "No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Buy-from Address 2")
            {
            }
            column(BuyfromAddress3_PurchaseHeader; "AVF_Buy-from Address 3")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Buy-from Contact")
            {
            }
            column(ShiptoName_PurchaseHeader; "Ship-to Name" + ' ' + "Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Ship-to Address 2")
            {
            }
            column(ShiptoAddress3_PurchaseHeader; "AVF_Ship-to Address 3")
            {
            }
            column(DocumentDate_PurchaseHeader; FORMAT("Document Date", 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(ReqRecptDate_PurchaseHeader; FORMAT("Requested Receipt Date", 0, '<Closing><Day,2>/<Month,2>/<Year>'))
            {
            }
            column(VendorOrderNo_PurchaseHeader; "Vendor Order No.")
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; FORMAT("Expected Receipt Date", 0, '<Closing><Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(VendorBranchNo_PurchaseHeader; "AVF_Vendor Branch No.")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "VAT Registration No.")
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
            column(DepartmentName; DimensionValue.Name)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                PrintOnlyifDetail = true;
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
                dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemLinkReference = "Purch. Rcpt. Header";
                    DataItemTableView = SORTING("Document No.", "Line No.");
                    column(RunningNum; RunShow)
                    {
                    }
                    column(RunShow; RunningNum)
                    {
                    }
                    column(No_PurchaseLine; "No.")
                    {
                    }
                    column(Description_PurchaseLine; Description)
                    {
                    }
                    column(Description2_PurchaseLine; "Description 2")
                    {
                    }
                    column(UnitofMeasure_PurchaseLine; "Unit of Measure")
                    {
                    }
                    column(Quantity_PurchaseLine; FORMAT(Quantity, 0, '<Precision,0:2><Sign><Integer Thousand><Decimals>'))
                    {
                    }
                    column(DirectUnitCost_PurchaseLine; "Direct Unit Cost")
                    {
                    }
                    column(LineDiscountAmount_PurchaseLine; '')
                    {
                    }
                    column(Amount_PurchaseLine; amt)
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

                        amt := "Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Direct Unit Cost";
                        /*
                        TotalAMT+="Line Amount";
                        TotalDIS+="Line Discount Amount";
                        TotalVAT+="Amount Including VAT"-Amount;
                        TotalInvDis+="Inv. Discount Amount";
                        
                        SumGranTotel[1]+="Line Amount";
                        SumGranTotel[2]+="Inv. Discount Amount";
                        SumGranTotel[3]+="Line Amount"-"Inv. Discount Amount";
                        SumGranTotel[4]+=0;
                        SumGranTotel[5]+="Amount Including VAT";
                        SumGranTotel[6]+=Amount;
                        */

                    end;

                    trigger OnPreDataItem();
                    begin
                        //TL:=COUNT;
                        CLEAR(TL);
                        CLEAR(CountPurchLine);
                        //CountPurchLine.SetRange("Document Type","Document Type");
                        CountPurchLine.SetRange("Document No.", "Purch. Rcpt. Header"."No.");
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
                                SetRange(Number, 1, 0)
                            else begin
                                AddLine := Maxline - (TL mod Maxline);
                                SetRange(Number, 1, AddLine);
                            end;
                        end else
                            SetRange(Number, 1, 0);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(RunningNum);
                    CLEAR(TotalAMT);
                    CLEAR(TotalDIS);
                    CLEAR(TotalVAT);
                    CLEAR(TotalInvDis);

                    if Number = 1 then
                        TxtHeader := 'ต้นฉบับ'
                    else
                        TxtHeader := 'สำเนา'
                end;

                trigger OnPreDataItem();
                begin
                    SetRange(Number, 1, NoOfCopies);
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
                AVPurchaseComment.SetCurrentKey(AVPurchaseComment."Document Type", AVPurchaseComment."No.");
                AVPurchaseComment.SetRange(AVPurchaseComment."No.", "No.");
                AVPurchaseComment.SetRange(AVPurchaseComment."Document Line No.", 0);
                if AVPurchaseComment.FIND('-') then
                    repeat
                        i += 1;
                        if i <= 4 then
                            Comments[i] := AVPurchaseComment.Comment;
                    until (AVPurchaseComment.NEXT = 0);

                //AVPKJVIP.001 28.10.2019
                Clear(DimensionValue);
                DimensionValue.SetCurrentKey("Dimension Code", "Code");
                DimensionValue.SetRange(DimensionValue."Dimension Code", 'COST CENTER');
                DimensionValue.SetRange(DimensionValue.Code, "Purch. Rcpt. Header"."Shortcut Dimension 1 Code");
                if DimensionValue.FindFirst() then;
                //C-AVPKJVIP.001 28.10.2019
            end;

            trigger OnPreDataItem();
            begin
                Companyinfo.GET();
                Companyinfo.CALCFIELDS(Companyinfo.Picture);
                Maxline := 17;
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
        runn: Integer;
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
        CountPurchLine: Record "Purch. Rcpt. Line";
        RunShow: Integer;
        SumGranTotel: array[6] of Decimal;
        amt: Decimal;
        DimensionValue: Record "Dimension Value";   //AVPKJVIP.001 28.10.2019
}

