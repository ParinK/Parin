xmlport 50001 "INT_Export PND To Text File"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = '|';
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF8;
    UseRequestPage = false;
    Caption = 'Export PND To Text File 2';

    schema
    {
        textelement(Root)
        {
            tableelement("WHT Entry"; "AVF_WHT Entry")
            {
                XmlName = 'WHTEntry';
                SourceTableView = SORTING("WHT Certificate No.", "WHT Prod. Posting Group");
                UseTemporary = true;
                textelement(DetailT)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(WHTReTypeTB);
                    WHTReTypeTB.SETCURRENTKEY(Code);
                    WHTReTypeTB.SETRANGE(Code, "WHT Entry"."WHT Revenue Type");
                    if WHTReTypeTB.FINDFIRST then
                        WHTSequence := WHTReTypeTB.Sequence;

                    if ("WHT Entry".Base <> 0) then begin
                        CLEAR(Address1);
                        CLEAR(Address2);
                        CLEAR(Address3);
                        CLEAR(Address4);
                        CLEAR(AddressAll);
                        CLEAR(VendName);
                        CLEAR(WHTHeader);
                        WHTHeader.SETCURRENTKEY(WHTHeader."WHT No.");
                        WHTHeader.SETRANGE(WHTHeader."WHT No.", "WHT Entry"."Document No.");
                        if WHTHeader.FINDFIRST then begin
                            VendName := COPYSTR(WHTHeader."Vendor Name" + ' ' + WHTHeader."Vendor Name 2", 1, 100);
                            VATNo := WHTHeader."Vendor VAT Registration No.";
                            AddressAll := WHTHeader."Vendor Address";
                            if WHTHeader."Vendor Address 2" <> '' then
                                AddressAll := AddressAll + ' ' + WHTHeader."Vendor Address 2";
                            if WHTHeader."Vendor Address 3" <> '' then
                                AddressAll := AddressAll + ' ' + WHTHeader."Vendor Address 3";

                            Address1 := COPYSTR(AddressAll, 1, 20);
                            AddressAll := DELSTR(AddressAll, 1, 20);
                            Address2 := COPYSTR(AddressAll, 1, 30);
                            AddressAll := DELSTR(AddressAll, 1, 30);
                            Address3 := COPYSTR(AddressAll, 1, 30);
                            AddressAll := DELSTR(AddressAll, 1, 30);
                            Address4 := COPYSTR(AddressAll, 1, 30);
                        end;

                        if VendName = '' then begin
                            CLEAR(Vendor);
                            if GetWHTEntry."Actual Vendor No." <> '' then
                                Vendor.SETRANGE("No.", "WHT Entry"."Actual Vendor No.")
                            else
                                Vendor.SETRANGE("No.", "WHT Entry"."Bill-to/Pay-to No.");
                            if Vendor.FIND('-') then begin
                            end;
                            if PND <> 53 then begin
                                CLEAR(VendName_LastName);
                                if STRPOS(Vendor.Name, ' ') <> 0 then begin
                                    VendName := COPYSTR(Vendor.Name, 1, STRPOS(Vendor.Name, ' '));
                                    VendName_LastName := DELCHR(Vendor.Name, '>', VendName);
                                end;
                            end else
                                VendName := Vendor.Name;

                            VATNo := Vendor."VAT Registration No.";
                            AddressAll := Vendor.Address + ' ' + Vendor."Address 2" + ' ' + Vendor."AVF_Address 3";
                            Address1 := COPYSTR(AddressAll, 1, 20);
                            AddressAll := DELSTR(AddressAll, 1, 20);
                            Address2 := COPYSTR(AddressAll, 1, 30);
                            AddressAll := DELSTR(AddressAll, 1, 30);
                            Address3 := COPYSTR(AddressAll, 1, 30);
                            AddressAll := DELSTR(AddressAll, 1, 30);
                            Address4 := COPYSTR(AddressAll, 1, 30);
                        end;

                        CLEAR(VendVat);
                        CLEAR(VendVat13);
                        if (VATNo <> '') and (STRLEN(VATNo) = 10) then begin
                            for a := 1 to STRLEN(VATNo) do begin
                                if VendVat = '' then
                                    VendVat := COPYSTR(VATNo, a, 1)
                                else
                                    VendVat += COPYSTR(VATNo, a, 1);
                            end;
                        end else
                            if (VATNo <> '') and (STRLEN(VATNo) = 13) then begin
                                for a := 1 to STRLEN(VATNo) do begin
                                    if VendVat13 = '' then
                                        VendVat13 := COPYSTR(VATNo, a, 1)
                                    else
                                        VendVat13 += COPYSTR(VATNo, a, 1);
                                end;
                            end;

                        CLEAR("WHTProd.PostingGroupTB");
                        "WHTProd.PostingGroupTB".SETRANGE(Code, "WHT Entry"."WHT Prod. Posting Group");
                        if "WHTProd.PostingGroupTB".FIND('-') then begin
                        end;
                        CLEAR(WHT);
                        if STRPOS(FORMAT("WHT Entry"."WHT %"), '.') = 0 then
                            WHT := FORMAT("WHT Entry"."WHT %") //+ '.0000'
                        else
                            if STRLEN(FORMAT("WHT Entry"."WHT %")) - STRPOS(FORMAT("WHT Entry"."WHT %"), '.') > 0 then begin
                                for I := 1 to (4 - (STRLEN(FORMAT("WHT Entry"."WHT %")) - STRPOS(FORMAT("WHT Entry"."WHT %"), '.'))) do
                                    WHT := WHT + '0';
                            end;

                        //AVSSMCST
                        CLEAR(WHTEntrySum);
                        CLEAR(sumBase);
                        CLEAR(sumAmount);
                        WHTEntrySum.SETCURRENTKEY("WHT Certificate No.", "WHT Prod. Posting Group");
                        WHTEntrySum.SETRANGE("Document No.", "WHT Entry"."Document No.");
                        WHTEntrySum.SETRANGE("WHT Prod. Posting Group", "WHT Entry"."WHT Prod. Posting Group");
                        WHTEntrySum.SETFILTER(Base, '<>%1', 0);
                        //WHTEntrySum.SETFILTER("Post to G/L Document No.", '<>%1', '');
                        WHTEntrySum.SETRANGE("Cancel Line", false);
                        if WHTEntrySum.FIND('-') then begin
                            repeat
                                sumBase += WHTEntrySum.Base;
                                sumAmount += WHTEntrySum.Amount;
                            until WHTEntrySum.NEXT = 0;
                        end;
                        //C-AVSSMCST

                        TenBlank := '||';
                        txtBase := FORMAT(sumBase, 0, '<Sign><Integer><Decimals,3>');//AVSSMCST//Base,0,'<Sign><Integer><Decimals,3>');
                        txtLen := STRLEN(txtBase);
                        txtAmt := FORMAT(ROUND(sumAmount), 0, '<Sign><Integer><Decimals,3>');//AVSSMCST//Amount),0,'<Sign><Integer><Decimals,3>');
                        CLEAR(Detail);
                        case PND of
                            0:
                                begin //PND01
                                    Detail := '|' + FORMAT(WHTSequence) + '|' + RunningNo + '|' + VendVat13 + '|' + VendVat +
                                        '||' + VendName + '||' +
                                        Address1 + '|' + Address2 + '|' + Address3 + '|' + Address4 + '|' +
                                        FORMAT("WHT Entry"."Posting Date", 0, '<Day,2>') + FORMAT("WHT Entry"."Posting Date", 0, '<Month,2>') +
                                        FORMAT(DATE2DMY("WHT Entry"."Posting Date", 3) + 543) + '|' +
                                        FORMAT("WHTProd.PostingGroupTB".Description) + '|' +
                                        FORMAT(WHT) + '|' + txtBase + '|' + txtAmt + '|' + FORMAT("WHT Entry"."WHT Deduct Type") + '|';
                                    //MyOutStream.WRITETEXT(Detail);


                                end;

                            1:
                                begin //PND02
                                    Detail := '|' + FORMAT(WHTSequence) + '|' + RunningNo + '|' + VendVat13 + '|' + VendVat +
                                        '||' + VendName + '||' +
                                        Address1 + '|' + Address2 + '|' + Address3 + '|' + Address4 + '|' +
                                        FORMAT("WHT Entry"."Posting Date", 0, '<Day,2>') + FORMAT("WHT Entry"."Posting Date", 0, '<Month,2>') +
                                        FORMAT(DATE2DMY("WHT Entry"."Posting Date", 3) + 543) + '|' +
                                        FORMAT("WHTProd.PostingGroupTB".Description) + '|' +
                                        FORMAT(WHT) + '|' + txtBase + '|' + txtAmt + '|' + FORMAT("WHT Entry"."WHT Deduct Type") + '|';
                                    //MyOutStream.WRITETEXT(Detail);
                                end;

                            2:
                                begin //PND03
                                    Detail := '|' + RunningNo + '|' + VendVat13 + '|' + VendVat +
                                        '||' + VendName + '|' + VendName_LastName + '|' +
                                        Address1 + '|' + Address2 + '|' + Address3 + '|' + Address4 + '|' +
                                        FORMAT("WHT Entry"."Posting Date", 0, '<Day,2>') + FORMAT("WHT Entry"."Posting Date", 0, '<Month,2>') +
                                        FORMAT(DATE2DMY("WHT Entry"."Posting Date", 3) + 543) + '|' +
                                        FORMAT("WHTProd.PostingGroupTB".Description) + '|' +
                                        FORMAT(WHT) + '|' + txtBase + '|' + txtAmt + '|' + FORMAT("WHT Entry"."WHT Deduct Type") + '|';
                                    Detail1 := FORMAT("WHT Entry"."Posting Date", 0, '<Day,2>') + FORMAT("WHT Entry"."Posting Date", 0, '<Month,2>') +
                                                FORMAT(DATE2DMY("WHT Entry"."Posting Date", 3) + 543) + '|' +
                                                FORMAT("WHTProd.PostingGroupTB".Description) + '|' +
                                                FORMAT(WHT) + '|' + txtBase + '|' + txtAmt + '|' + FORMAT("WHT Entry"."WHT Deduct Type") + '|';
                                end;

                            3:
                                begin //PND53
                                    CLEAR(WHTDeductType);
                                    if "WHT Entry"."WHT Deduct Type" = 3 then
                                        WHTDeductType := 2
                                    else
                                        //WHTDeductType := GetWHTEntry."WHT Deduct Type";
                                        WHTDeductType := "WHT Entry"."WHT Deduct Type";

                                    if WHTHeader."Vendor Branch No." = 'สำนักงานใหญ่' then
                                        VendorBranchNo := '00000';

                                    Detail := '|' + RunningNo + '|' + VendVat13 + '|' + VendorBranchNo +
                                        '||' + VendName + '|' +
                                        Address1 + '|' + Address2 + '|' + Address3 + '|' + Address4 + '|' +
                                        FORMAT("WHT Entry"."Posting Date", 0, '<Day,2>') + FORMAT("WHT Entry"."Posting Date", 0, '<Month,2>') +
                                        FORMAT(DATE2DMY("WHT Entry"."Posting Date", 3) + 543) + '|' +
                                        FORMAT("WHTProd.PostingGroupTB".Description) + '|' +
                                        FORMAT(WHT) + '|' + txtBase + '|' + txtAmt + '|' + FORMAT(WHTDeductType) + '|';
                                    Detail1 := FORMAT("WHT Entry"."Posting Date", 0, '<Day,2>') + FORMAT("WHT Entry"."Posting Date", 0, '<Month,2>') +
                                                FORMAT(DATE2DMY("WHT Entry"."Posting Date", 3) + 543) + '|' +
                                                FORMAT("WHTProd.PostingGroupTB".Description) + '|' +
                                                FORMAT(WHT) + '|' + txtBase + '|' + txtAmt + '|' + FORMAT(WHTDeductType) + '|';

                                end;
                        end;

                        if AVX1 = 0 then begin
                            RunningNo := '00002';
                            AVX1 := 1;
                            DetailT := Detail;
                            //WHTNo := "WHT Certificate No.";
                        end else begin
                            if WHTNo = "WHT Entry"."WHT Certificate No." then begin
                                if AVX2 = 0 then begin
                                    AVX2 := 1;
                                    //Check2ndWHT := TRUE;
                                    DetailT := DetailT + Detail1;
                                end else begin
                                    if AVX3 = 0 then begin
                                        AVX3 := 1;
                                        Check2ndWHT := true;
                                        DetailT := DetailT + Detail1;
                                    end
                                end;
                            end;
                        end;

                        //IF WHTNo <> "WHT Certificate No." THEN BEGIN
                        if (WHTNo <> "WHT Entry"."WHT Certificate No.") and (WHTNo <> '') then begin
                            //IF ((PND = 2) OR (PND=3)) AND (NOT Check2ndWHT) THEN

                            ///IF (NOT Check2ndWHT) THEN
                            //  DetailT += '||||||';


                            if 3 - CountWHT <> 0 then begin
                                for I := 3 - CountWHT downto 1 do begin
                                    //IF (NOT Check2ndWHT) THEN

                                    if "WHT Entry"."Void Payment Entry No." = 1 then  //AVPKJINT.001 08/01/2020
                                        Detail += '||||||';
                                end;
                            end;


                            RunningNo := INCSTR(RunningNo);


                            //      MyOutStream.WRITETEXT(DetailT);
                            //      MyOutStream.WRITETEXT();
                            AVX2 := 0;
                            AVX3 := 0;
                            Check2ndWHT := false;
                            //DetailTx := DetailT;
                            DetailT := Detail;
                            CountWHT := 0;
                        end;

                        CountWHT += 1;

                        //comment 08/01/2020
                        if WHTNo = '' then begin
                            if 3 - CountWHT <> 0 then begin
                                for I := 3 - CountWHT downto 1 do begin
                                    //IF (NOT Check2ndWHT) THEN
                                    if "WHT Entry"."Void Payment Entry No." = 1 then  //AVPKJINT.001 08/01/2020
                                        DetailT += '||||||';
                                end;
                            end;
                        end;
                        WHTNo := "WHT Entry"."WHT Certificate No.";
                    end;

                    if "WHT Entry"."Void Payment Entry No." = 1 then  //AVPKJINT.001 08/01/2020
                        DetailT += '||||||||||||';

                    if "WHT Entry"."Void Payment Entry No." = 0 then begin
                        currXMLport.Skip();
                    end;

                end;

                trigger OnPreXmlItem()
                begin
                    CLEAR(OldDoc1);
                    Clear(OldWHTPostGroup1);
                    //Clear(OldReportLineNo);
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
                group(show)
                {
                    Caption = 'ออกรายงานเฉพาะรายการที่เดิน G/L แจ้งเท่านั้น';
                    field("PND Type"; PND)
                    {
                        ApplicationArea = All;
                    }
                    field(Year; Year)
                    {
                        ApplicationArea = All;
                    }
                    field(Period; Period)
                    {
                        ApplicationArea = All;
                    }
                    field(Month; Month)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(Noof; Noof)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of Submit.';
                    }
                    group("** ที่อยู่ที่นำไป Upload ขึ้น WEB จะเป็นที่อยู่ต่อๆ กัน เนื่องจากระบบ NAVISION ไม่ได้แยกช่องที่อยู่ให้")
                    {
                        Caption = '** ที่อยู่ที่นำไป Upload ขึ้น WEB จะเป็นที่อยู่ต่อๆ กัน เนื่องจากระบบ NAVISION ไม่ได้แยกช่องที่อยู่ให้';
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                    }
                }
            }
        }
    }

    trigger OnPreXmlPort();
    begin
        ValidateMonth;
        CLEAR(CompanyInfo);
        CompanyInfo.GET;
        //CompanyInfo.TESTFIELD("Path File PND");
        if PND = 0 then begin
            FileName := CompanyInfo."AVF_Path File PND" +
                'PD1_' + FORMAT(Year) + '_' + FORMAT(Period) + '.txt';
        end else
            if PND = 1 then begin
                FileName := CompanyInfo."AVF_Path File PND" +
                    'PD2_' + FORMAT(Year) + '_' + FORMAT(Period) + '.txt';
            end else
                if PND = 2 then begin
                    FileName := CompanyInfo."AVF_Path File PND" +
                        'P03_' + FORMAT(Year) + '_' + FORMAT(Period) + '.txt';
                end else
                    if PND = 3 then begin
                        FileName := CompanyInfo."AVF_Path File PND" +
                            'P53_' + FORMAT(Year) + '_' + FORMAT(Period) + '.txt';
                    end;
        currXMLport.FILENAME := FileName;
        RunningNo := '00001';
        CLEAR(rEntryNo);
        CLEAR(GetWHTEntry);
        GetWHTEntry.SETCURRENTKEY("WHT Certificate No.", "WHT Prod. Posting Group");
        //GetWHTEntry.SETFILTER("Post to G/L Document No.", '<>%1', '');
        GetWHTEntry.SETRANGE("Cancel Line", false);
        case PND of
            0:
                GetWHTEntry.SETRANGE("WHT Report", GetWHTEntry."WHT Report"::"Por Ngor Dor 2");
            1:
                GetWHTEntry.SETRANGE("WHT Report", GetWHTEntry."WHT Report"::"Por Ngor Dor 1");
            2:
                GetWHTEntry.SETRANGE("WHT Report", GetWHTEntry."WHT Report"::"Por Ngor Dor 3");
            3:
                GetWHTEntry.SETRANGE("WHT Report", GetWHTEntry."WHT Report"::"Por Ngor Dor 53");
        end;

        Clear(CountWHTProd);
        GetWHTEntry.SETRANGE("No. of Additional WHT", Noof);
        GetWHTEntry.SETRANGE("Posting Date", StartDate, EndDate);
        if GetWHTEntry.FindSet() then begin
            repeat
                if (OldDoc <> GetWHTEntry."Document No.") and (OldDoc <> '') then begin
                    "WHT Entry"."Void Payment Entry No." := 1;
                    "WHT Entry".Modify;
                end;

                if (OldDoc <> GetWHTEntry."Document No.") or (OldWHTPostGroup <> GetWHTEntry."WHT Prod. Posting Group") then begin


                    OldDoc := GetWHTEntry."Document No.";
                    OldWHTPostGroup := GetWHTEntry."WHT Prod. Posting Group";

                    "WHT Entry".COPY(GetWHTEntry);
                    "WHT Entry".Insert();
                end;
            until GetWHTEntry.Next() = 0;

            "WHT Entry"."Void Payment Entry No." := 1;
            "WHT Entry".Modify;

        end;
    end;

    var
        VendorBranchNo: Code[5];
        FileName: Text[100];
        TxTFile: File;
        Detail: Text[1024];
        CompanyInfo: Record "Company Information";
        Vendor: Record Vendor;
        PND: Option PND1,PND2,PND3,PND53;
        StartDate: Date;
        EndDate: Date;
        "WHTProd.PostingGroupTB": Record "AVF_WHT Product Posting Group";
        WHT: Text[10];
        BASEAMT: Text[30];
        AMOUNTAMT: Text[30];
        I: Integer;
        WHTEntry: Record "AVF_WHT Entry";
        VoidAmt: Decimal;
        WHTDeductType: Integer;
        Period: Integer;
        Year: Integer;
        Month: Text[30];
        RunningNo: Text[5];
        txtBase: Text[50];
        txtAmt: Text[50];
        txtLen: Integer;
        TenBlank: Text[10];
        VendVat: Text[100];
        VendVat13: Text[100];
        VATNo: Text[30];
        a: Integer;
        VendName: Text[1024];
        PurchInvH: Record "Purch. Inv. Header";
        WHTHeader: Record "AVF_WHT Header";
        Address1: Text[50];
        Address2: Text[50];
        Address3: Text[50];
        Address4: Text[50];
        AddressAll: Text[400];
        WHTReTypeTB: Record "AVF_WHT Revenue Types";
        WHTSequence: Integer;
        Detail1: Text[1024];
        Detail2: Text[1024];
        Detail3: Text[1024];
        Detail4: Text[1024];
        WHTNo: Code[20];
        AVX1: Integer;
        AVX2: Integer;
        AVX3: Integer;
        Noof: Integer;
        Address_Cut: array[12] of Text[30];
        WordtoCut: array[120] of Text[30];
        k: Integer;
        KeepPosition: array[120] of Integer;
        GetAddress: array[15] of Text[100];
        Address_Len: Integer;
        VendName_LastName: Text[50];
        LastPosition: Integer;
        Check2ndWHT: Boolean;
        MyOutStream: OutStream;
        OldWHTPostGroup: Code[10];
        OldDoc: Code[20];
        OldWHTPostGroup1: Code[10];
        OldDoc1: Code[20];
        OldDoc2: Code[20];
        OldRunning: Code[10];


        RunningTest: Integer;

        sumBase: Decimal;
        sumAmount: Decimal;
        WHTEntrySum: Record "AVF_WHT Entry";
        Name: Text[200];
        ReturnValue: Boolean;
        TempFile: File;
        ToFile: Variant;
        NewStream: InStream;
        CountWHT: Integer;
        CountWHTProd: Integer;
        WHTColumn: Integer;
        Text002: Label '"Period should be in 1-12. Please enter valid period. "';
        GetWHTEntry: Record "AVF_WHT Entry";
        rEntryNo: Integer;
        TxtPipe: Label '|';
        tmpWHTEntry: Record "AVF_WHT Entry" temporary;
        Space: Text;

    procedure SetParam(sPND: Integer; sYear: Integer; sPeriod: Integer; sNoof: Integer)
    begin
        PND := sPND;
        Year := sYear;
        Period := sPeriod;
        Noof := sNoof;
    end;

    procedure ValidateMonth();
    begin
        if Period = 1 then
            Month := 'มกราคม'
        else
            if Period = 2 then
                Month := 'กุมภาพันธ์'
            else
                if Period = 3 then
                    Month := 'มีนาคม'
                else
                    if Period = 4 then
                        Month := 'เมษายน'
                    else
                        if Period = 5 then
                            Month := 'พฤษภาคม'
                        else
                            if Period = 6 then
                                Month := 'มิถุนายน'
                            else
                                if Period = 7 then
                                    Month := 'กรกฎาคม'
                                else
                                    if Period = 8 then
                                        Month := 'สิงหาคม'
                                    else
                                        if Period = 9 then
                                            Month := 'กันยายน'
                                        else
                                            if Period = 10 then
                                                Month := 'ตุลาคม'
                                            else
                                                if Period = 11 then
                                                    Month := 'พฤศจิกายน'
                                                else
                                                    if Period = 12 then
                                                        Month := 'ธันวาคม'
                                                    else begin
                                                        Month := '';
                                                        MESSAGE('%1', Text002);
                                                    end;

        if Month <> '' then begin
            StartDate := DMY2DATE(1, Period, Year);
            EndDate := CALCDATE('1M', StartDate) - 1;
        end;
    end;

    procedure MAPAddress(Original_AddressAll: Text[400]);
    begin
        CLEAR(Address_Cut);
        CLEAR(WordtoCut);
        CLEAR(Address_Len);
        Address_Len := STRLEN(Original_AddressAll);
        //******** อาคาร/หมู่บ้าน ********
        WordtoCut[1] := 'อาคาร';
        WordtoCut[2] := 'หมู่บ้าน';
        //******** อาคาร/หมู่บ้าน ********

        //******** ห้องเลขที่********
        WordtoCut[3] := 'ห้องเลขที่';
        //******** ห้องเลขที่********

        //******** ชั้นที่********
        WordtoCut[4] := 'ชั้นที่';
        //******** ชั้นที่********

        //******** เลขที่********
        WordtoCut[5] := 'เลขที่';
        //******** เลขที่********

        //******** หมู่ที่********
        WordtoCut[6] := 'หมู่';
        //******** หมู่ที่********

        //******** ตรอก/ซอย********
        WordtoCut[7] := 'ตรอก';
        WordtoCut[8] := 'ซอย';
        //******** ตรอก/ซอย********

        //******** ถนน********
        WordtoCut[9] := 'ถนน';
        //******** ถนน********

        //******** ตำบล/แขวง ********
        WordtoCut[10] := 'ตำบล';
        WordtoCut[11] := 'แขวง';
        WordtoCut[12] := 'ต.';
        //******** ตำบล/แขวง ********

        //******** อำเภอ/เขต ********
        WordtoCut[13] := 'อำเภอ';
        WordtoCut[14] := 'เขต';
        WordtoCut[15] := 'อ.';
        //******** อำเภอ/เขต ********

        //******** จังหวัด ********
        WordtoCut[16] := 'จังหวัด';
        WordtoCut[17] := 'จ.';
        //******** จังหวัด ********

        CLEAR(LastPosition);
        CLEAR(KeepPosition);
        for k := 1 to 17 do begin
            KeepPosition[k] := STRPOS(Original_AddressAll, WordtoCut[k]);
            if KeepPosition[k] <> 0 then
                LastPosition := KeepPosition[k]
            else
                KeepPosition[k] := LastPosition;
        end;

        CLEAR(GetAddress);
        //******** 1. อาคาร/หมู่บ้าน ********
        //WordtoCut[1] := 'อาคาร';
        if (KeepPosition[1] <> 0) then
            GetAddress[1] := COPYSTR(Original_AddressAll, (KeepPosition[1] + 5), KeepPosition[3]);

        //WordtoCut[2] := 'หมู่บ้าน';
        if (KeepPosition[2] <> 0) and (KeepPosition[2] <> KeepPosition[1]) and (GetAddress[1] = '') then
            GetAddress[1] := COPYSTR(Original_AddressAll, (KeepPosition[2] + 8), KeepPosition[3]);
        //******** อาคาร/หมู่บ้าน ********

        //******** 2. ห้องเลขที่********
        //WordtoCut[3] := 'ห้องเลขที่';
        if (KeepPosition[3] <> 0) and (KeepPosition[3] <> KeepPosition[3]) then
            GetAddress[2] := COPYSTR(Original_AddressAll, (KeepPosition[3] + 10), KeepPosition[4]);
        //******** ห้องเลขที่********

        //******** 3. ชั้นที่********
        //WordtoCut[4] := 'ชั้นที่';
        if (KeepPosition[4] <> 0) and (KeepPosition[4] <> KeepPosition[3]) then
            GetAddress[3] := COPYSTR(Original_AddressAll, (KeepPosition[4] + 7), KeepPosition[5]);
        //******** ชั้นที่********

        //******** 4. เลขที่********
        //WordtoCut[5] := 'เลขที่';
        if (KeepPosition[5] <> 0) and (KeepPosition[5] <> KeepPosition[4]) then
            GetAddress[4] := COPYSTR(Original_AddressAll, (KeepPosition[5] + 6), KeepPosition[6])
        else begin
            if STRPOS(Original_AddressAll, ' ') <> 0 then
                GetAddress[4] := COPYSTR(Original_AddressAll, 1, STRPOS(Original_AddressAll, ' '));
        end;
        //******** เลขที่********

        //******** 5. หมู่ที่********
        //WordtoCut[6] := 'หมู่ที่';
        if (KeepPosition[6] <> 0) and (KeepPosition[6] <> KeepPosition[5]) then
            GetAddress[5] := COPYSTR(Original_AddressAll, (KeepPosition[6] + 7), KeepPosition[7]);
        //******** หมู่ที่********

        //******** 6. ตรอก/ซอย********
        //WordtoCut[7] := 'ตรอก';
        if (KeepPosition[7] <> 0) and (KeepPosition[7] <> KeepPosition[3]) then
            GetAddress[6] := COPYSTR(Original_AddressAll, (KeepPosition[7] + 4), KeepPosition[9]);

        //WordtoCut[8] := 'ซอย';
        if (KeepPosition[8] <> 0) and (KeepPosition[8] <> KeepPosition[7]) and (GetAddress[6] = '') then
            GetAddress[6] := COPYSTR(Original_AddressAll, (KeepPosition[8] + 3), KeepPosition[9]);
        //******** ตรอก/ซอย********

        //******** 7. ถนน********
        //WordtoCut[9] := 'ถนน';
        if (KeepPosition[9] <> 0) and (KeepPosition[9] <> KeepPosition[8]) then
            GetAddress[7] := COPYSTR(Original_AddressAll, (KeepPosition[9] + 3), KeepPosition[10]);
        //******** ถนน********

        //******** 8. ตำบล/แขวง ********
        //WordtoCut[10] := 'ตำบล';
        if (KeepPosition[10] <> 0) and (KeepPosition[10] <> KeepPosition[9]) then
            GetAddress[8] := COPYSTR(Original_AddressAll, (KeepPosition[10] + 4), KeepPosition[13]);

        //WordtoCut[11] := 'แขวง';
        if (KeepPosition[11] <> 0) and (KeepPosition[11] <> KeepPosition[10]) and (GetAddress[8] = '') then
            GetAddress[8] := COPYSTR(Original_AddressAll, (KeepPosition[11] + 4), KeepPosition[13]);

        //WordtoCut[12] := 'ต.';
        if (KeepPosition[12] <> 0) and (KeepPosition[12] <> KeepPosition[11]) and (GetAddress[8] = '') then
            GetAddress[8] := COPYSTR(Original_AddressAll, (KeepPosition[12] + 2), KeepPosition[13]);
        //******** ตำบล/แขวง ********

        //******** 9. อำเภอ/เขต ********
        //WordtoCut[13] := 'อำเภอ';
        if (KeepPosition[13] <> 0) and (KeepPosition[13] <> KeepPosition[12]) then
            GetAddress[9] := COPYSTR(Original_AddressAll, (KeepPosition[13] + 5), KeepPosition[16]);

        //WordtoCut[14] := 'เขต';
        if (KeepPosition[14] <> 0) and (KeepPosition[14] <> KeepPosition[13]) and (GetAddress[9] = '') then
            GetAddress[9] := COPYSTR(Original_AddressAll, (KeepPosition[14] + 3), KeepPosition[16]);

        //WordtoCut[15] := 'อ.';
        if (KeepPosition[15] <> 0) and (KeepPosition[15] <> KeepPosition[14]) and (GetAddress[9] = '') then
            GetAddress[9] := COPYSTR(Original_AddressAll, (KeepPosition[15] + 2), KeepPosition[16]);
        //******** อำเภอ/เขต ********

        //******** 10. จังหวัด ********
        //WordtoCut[16] := 'จังหวัด';
        /*
        IF (KeepPosition[16] <> 0) THEN
          GetAddress[10] := COPYSTR(Original_AddressAll,(KeepPosition[16] + 5),Address_Len)
        ELSE IF WHTHeader."Vendor City" <> '' THEN
          GetAddress[10] := WHTHeader."Vendor City";
        */

        //WordtoCut[17] := 'จ.';
        if (KeepPosition[17] <> 0) and (GetAddress[10] = '') then
            GetAddress[10] := COPYSTR(Original_AddressAll, (KeepPosition[17] + 3), Address_Len);
        //******** จังหวัด ********

        /*
        IF WHTHeader."Vendor Post Code" <> '' THEN
          GetAddress[11] := WHTHeader."Vendor Post Code";
        */

    end;
}

