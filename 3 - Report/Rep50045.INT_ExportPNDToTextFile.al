report 50045 "INT_Export PND To Text File"
{
    // version AVFTH1.0
    Caption = 'Export PND To Text File 2';
    ProcessingOnly = true;
    UseRequestPage = true;
    UsageCategory = Documents;
    ApplicationArea = All;
    dataset
    {
        dataitem("WHT Entry"; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = CONST(1));

            trigger OnAfterGetRecord();
            begin
                xmlExportPND.SetParam(PND, Year, Period, Noof);
                xmlExportPND.Run();
                //Xmlport.Run(40014701, false, false);
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Export to text file completed');
            end;
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
                    ShowCaption = true;
                    field("PND Type"; PND)
                    {
                        ApplicationArea = All;
                        Caption = 'PND Type';


                    }
                    field(Year; Year)
                    {
                        ApplicationArea = All;
                        Caption = 'Year';

                        trigger OnValidate();
                        begin
                            ValidateMonth;
                        end;
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
                    field(Month; Month)
                    {
                        ApplicationArea = All;
                        Caption = 'Month';
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

        actions
        {
        }

        trigger OnOpenPage();
        begin
            PND := 1;
            Period := DATE2DMY(TODAY, 2);
            Year := DATE2DMY(TODAY, 3);
            ValidateMonth;
            if StartDate = 0D then StartDate := DMY2DATE(1, DATE2DMY(TODAY, 2), DATE2DMY(TODAY, 3));
            if EndDate = 0D then EndDate := CALCDATE('1M', StartDate) - 1;
        end;
    }

    labels
    {
    }

    var
        xmlExportPND: XmlPort "INT_Export PND To Text File";
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
        DetailT: Text[1024];
        WHTNo: Code[20];
        AVX1: Integer;
        AVX2: Integer;
        AVX3: Integer;
        Noof: Integer;
        AddressCut: array[12] of Text[30];
        WordtoCut: array[120] of Text[30];
        k: Integer;
        KeepPosition: array[120] of Integer;
        GetAddress: array[15] of Text[100];
        AddressLen: Integer;
        VendNameLastName: Text[50];
        LastPosition: Integer;
        Check2ndWHT: Boolean;
        Text002: Label '"Period should be in 1-12. Please enter valid period. "';
        MyOutStream: OutStream;
        OldWHTPostGroup: Code[10];
        OldDoc: Code[20];
        sumBase: Decimal;
        sumAmount: Decimal;
        WHTEntrySum: Record "AVF_WHT Entry";
        Name: Text[200];
        ReturnValue: Boolean;
        TempFile: File;
        ToFile: Variant;
        NewStream: InStream;
        CountWHT: Integer;
        WHTColumn: Integer;
    //xmlExportPND: XmlPort : "AVF_Export PND To Text File";

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
        CLEAR(AddressCut);
        CLEAR(WordtoCut);
        CLEAR(AddressLen);
        AddressLen := STRLEN(Original_AddressAll);
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
            GetAddress[10] := COPYSTR(Original_AddressAll, (KeepPosition[17] + 3), AddressLen);
        //******** จังหวัด ********

        /*
        IF WHTHeader."Vendor Post Code" <> '' THEN
          GetAddress[11] := WHTHeader."Vendor Post Code";
        */

    end;
}

