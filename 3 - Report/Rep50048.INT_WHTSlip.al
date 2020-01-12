report 50048 "INT_WHT Slip"
{
    // version AVFTH1.0

    // Microsoft Dynamic NAV
    // ----------------------------------------
    // Project: Localization TH
    // AVNVKSTD : Natee Visedkajee
    // 
    // No.   Date         Sign       Description
    // --------------------------------------------------
    // 001   09.07.2012   AVNVKSTD   Localization.
    // 
    // //AVSSMCST.002  11.10.2013  Add code for Group By posting Group
    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/WHT Slip.rdl';
    Caption = 'WHT Slip';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = WHERE(Number = FILTER(1 .. 4));

            column(LoopRound; Number)
            {
            }

            dataitem("WHT Entry"; "AVF_WHT Entry")
            {
                DataItemTableView = sorting("Posting Date", "WHT Certificate No.") where("Document Type" = FILTER(Payment), "WHT Certificate No." = FILTER(<> ''), "Cancel Line" = CONST(false));
                RequestFilterFields = "Bill-to/Pay-to No.", "Original Document No.", "WHT Certificate No.";
                //ReqFilterHeading = 'WHT Slip';
                RequestFilterHeading = 'WHT Slip';
                column(AVBookNo; AVBookNo)
                {
                }
                column(AVWHTNo; AVWHTNo)
                {
                }
                column(Document_No; "Document No.")
                {
                }
                column(CompanyN; CompanyN)
                {
                }
                column(CompVat_1; CompVat[1])
                {
                }
                column(CompVat_2; CompVat[2])
                {
                }
                column(CompVat_3; CompVat[3])
                {
                }
                column(CompVat_4; CompVat[4])
                {
                }
                column(CompVat_5; CompVat[5])
                {
                }
                column(CompVat_6; CompVat[6])
                {
                }
                column(CompVat_7; CompVat[7])
                {
                }
                column(CompVat_8; CompVat[8])
                {
                }
                column(CompVat_9; CompVat[9])
                {
                }
                column(CompVat_10; CompVat[10])
                {
                }
                column(CompVat_11; CompVat[11])
                {
                }
                column(CompVat_12; CompVat[12])
                {
                }
                column(CompVat_13; CompVat[13])
                {
                }
                column(CompanyInfoAddress; CompanyInfo.Address + ' ' + CompanyInfo."Address 2")
                {
                }
                column(VendorName; VendorName)
                {
                }
                column(VendVat13_1; VendVat13[1])
                {
                }
                column(VendVat13_2; VendVat13[2])
                {
                }
                column(VendVat13_3; VendVat13[3])
                {
                }
                column(VendVat13_4; VendVat13[4])
                {
                }
                column(VendVat13_5; VendVat13[5])
                {
                }
                column(VendVat13_6; VendVat13[6])
                {
                }
                column(VendVat13_7; VendVat13[7])
                {
                }
                column(VendVat13_8; VendVat13[8])
                {
                }
                column(VendVat13_9; VendVat13[9])
                {
                }
                column(VendVat13_10; VendVat13[10])
                {
                }
                column(VendVat13_11; VendVat13[11])
                {
                }
                column(VendVat13_12; VendVat13[12])
                {
                }
                column(VendVat13_13; VendVat13[13])
                {
                }
                column(VendVat_1; VendVat[1])
                {
                }
                column(VendVat_2; VendVat[2])
                {
                }
                column(VendVat_3; VendVat[3])
                {
                }
                column(VendVat_4; VendVat[4])
                {
                }
                column(VendVat_5; VendVat[5])
                {
                }
                column(VendVat_6; VendVat[6])
                {
                }
                column(VendVat_7; VendVat[7])
                {
                }
                column(VendVat_8; VendVat[8])
                {
                }
                column(VendVat_9; VendVat[9])
                {
                }
                column(VendVat_10; VendVat[10])
                {
                }
                column(VendVat_11; VendVat[11])
                {
                }
                column(VendVat_12; VendVat[12])
                {
                }
                column(VendVat_13; VendVat[13])
                {
                }
                column(VendorAddress; VendorAddress)
                {
                }
                column(LineNo; LineNo)
                {
                }
                column(Show1PND2; PND2)
                {
                }
                column(Show2Corporate; Corporate)
                {
                }
                column(Show3Individual; Individual)
                {
                }
                column(WHT1Date; WHT1Date)
                {
                }
                column(WHT1Base; WHT1Base)
                {
                }
                column(WHT1AMT; WHT1AMT)
                {
                }
                column(WHT2Date; WHT2Date)
                {
                }
                column(WHT2Base; WHT2Base)
                {
                }
                column(WHT2AMT; WHT2AMT)
                {
                }
                column(WHT3Date; WHT3Date)
                {
                }
                column(WHT3Base; WHT3Base)
                {
                }
                column(WHT3AMT; WHT3AMT)
                {
                }
                column(WHT4Date; WHT4Date)
                {
                }
                column(WHT4Base; WHT4Base)
                {
                }
                column(WHT4AMT; WHT4AMT)
                {
                }
                column(WHT41Date; WHT41Date)
                {
                }
                column(WHT41Base; WHT41Base)
                {
                }
                column(WHT41AMT; WHT41AMT)
                {
                }
                column(WHT42Date; WHT42Date)
                {
                }
                column(WHT42Base; WHT42Base)
                {
                }
                column(WHT42AMT; WHT42AMT)
                {
                }
                column(WHT43Date; WHT43Date)
                {
                }
                column(WHT43Base; WHT43Base)
                {
                }
                column(WHT43AMT; WHT43AMT)
                {
                }
                column(WHT44Date; WHT44Date)
                {
                }
                column(WHT44Base; WHT44Base)
                {
                }
                column(WHT44AMT; WHT44AMT)
                {
                }
                column(WHT5Date; WHT5Date)
                {
                }
                column(WHT5Base; WHT5Base)
                {
                }
                column(WHT5AMT; WHT5AMT)
                {
                }
                column(WHT52Date; WHT52Date)
                {
                }
                column(WHT52Base; WHT52Base)
                {
                }
                column(WHT52AMT; WHT52AMT)
                {
                }
                column(WHT61Date; WHT61Date)
                {
                }
                column(WHT61Base; WHT61Base)
                {
                }
                column(WHT61AMT; WHT61AMT)
                {
                }
                column(WHT62Date; WHT62Date)
                {
                }
                column(WHT62Base; WHT62Base)
                {
                }
                column(WHT62AMT; WHT62AMT)
                {
                }
                column(WHT63Date; WHT63Date)
                {
                }
                column(WHT63Base; WHT63Base)
                {
                }
                column(WHT63AMT; WHT63AMT)
                {
                }
                column(WHTBase; WHTBase)
                {
                }
                column(WHTAmount; WHTAmount)
                {
                }
                column(WordsText; WordsText)
                {
                }
                column(txtOp1; txtOp1)
                {
                }
                column(txtOp2; txtOp2)
                {
                }
                column(txtOp3; txtOp3)
                {
                }
                column(PayDate; PayDate)
                {
                }
                column(WHTCertificateNo_WHTEntry; "WHT Entry"."WHT Certificate No.")
                {
                }
                column(WHT61Desc; WHT61Desc)
                {
                }
                column(WHT62Desc; WHT62Desc)
                {
                }
                column(WHT63Desc; WHT63Desc)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(VendorName);

                    CLEAR(WHTHeader);
                    WHTHeader.SetCurrentKey(WHTHeader."WHT No.");
                    WHTHeader.SetRange(WHTHeader."WHT No.", "WHT Entry"."Document No.");
                    if WHTHeader.FindFirst then begin
                        VendorName := WHTHeader."Vendor Name" + ' ' + WHTHeader."Vendor Name 2";

                        VendorAddress := WHTHeader."Vendor Address" + ' ' + WHTHeader."Vendor Address 2" + ' ' + WHTHeader."Vendor Address 3";

                        VATNo := WHTHeader."Vendor VAT Registration No.";
                    end;

                    CLEAR(VendVat);
                    CLEAR(VendVat13);
                    if (VATNo <> '') and (WHTHeader."WHT Business Posting Group" = 'CORPORATE') then//(STRLEN(VATNo) = 10) then
                    begin
                        for a := 1 to STRLEN(VATNo) do begin
                            if VendVat[a] = '' then
                                VendVat[a] := COPYSTR(VATNo, a, 1)
                        end;
                    end
                    else
                        if (VATNo <> '') then//(WHTHeader."WHT Business Posting Group"='INDIVIDUAL') then//
                begin
                            for a := 1 to STRLEN(VATNo) do begin
                                if VendVat13[a] = '' then
                                    VendVat13[a] := COPYSTR(VATNo, a, 1)
                            end;
                        end;


                    if "WHT Report" = "WHT Report"::"Por Ngor Dor 3" then begin
                        Individual := 'X';
                        Corporate := '';
                        PND2 := '';
                    end
                    else
                        if "WHT Report" = "WHT Report"::"Por Ngor Dor 53" then begin
                            Individual := '';
                            Corporate := 'X';
                            PND2 := '';
                        end
                        else
                            if "WHT Report" = "WHT Report"::"Por Ngor Dor 2" then begin
                                Individual := '';
                                Corporate := '';
                                PND2 := 'X';
                            end;

                    JnlDocNo := "Original Document No.";
                    //AVNPSTD.001
                    CLEAR(UpdateWHTEntry);
                    UpdateWHTEntry.SetRange("Entry No.", "Entry No.");
                    if UpdateWHTEntry.FINDSET(true, false) then begin
                        if TypeOption1 then begin
                            UpdateWHTEntry."WHT Deduct Type" := 1;
                        end else
                            if TypeOption2 then begin
                                UpdateWHTEntry."WHT Deduct Type" := 2;
                            end else
                                if TypeOption3 then begin
                                    UpdateWHTEntry."WHT Deduct Type" := 3;
                                end;
                        UpdateWHTEntry.MODifY;
                    end;
                    //C-AVNPSTD.001

                    if OldWHTNo <> "WHT Certificate No." then begin
                        //if AVBookNo = '' then
                        //   AVBookNo := COPYSTR("WHT Certificate No.",1,5);
                        if AVWHTNo = '' then
                            AVWHTNo := "WHT Certificate No.";

                        CLEAR(TotalAmountLCY);
                        CLEAR(TotalBaseLCY);
                        LineNo := "WHT Report Line No";
                        repeat
                            if (COPYSTR(LineNo, 1, 1) = '0') then
                                LineNo := COPYSTR(LineNo, 2, STRLEN(LineNo));
                        until (COPYSTR(LineNo, 1, 1) <> '0');

                        WHT1Date := 0D;
                        CLEAR(WHT1AMT);
                        CLEAR(WHT1Base);
                        WHT2Date := 0D;
                        CLEAR(WHT2AMT);
                        CLEAR(WHT2Base);
                        WHT3Date := 0D;
                        CLEAR(WHT3AMT);
                        CLEAR(WHT3Base);
                        CLEAR(WHT4Desc);
                        WHT4Date := 0D;
                        CLEAR(WHT4AMT);
                        CLEAR(WHT4Base);
                        CLEAR(WHT42Desc);
                        WHT42Date := 0D;
                        CLEAR(WHT42AMT);
                        CLEAR(WHT42Base);
                        CLEAR(WHT43Desc);
                        WHT43Date := 0D;
                        CLEAR(WHT43AMT);
                        CLEAR(WHT43Base);
                        CLEAR(WHT44Desc);
                        WHT44Date := 0D;
                        CLEAR(WHT44AMT);
                        CLEAR(WHT44Base);
                        CLEAR(WHT5Desc);
                        WHT5Date := 0D;
                        CLEAR(WHT5AMT);
                        CLEAR(WHT5Base);
                        CLEAR(WHT52Desc);
                        WHT52Date := 0D;
                        CLEAR(WHT52AMT);
                        CLEAR(WHT52Base);
                        CLEAR(WHT61Desc);
                        WHT61Date := 0D;
                        CLEAR(WHT61AMT);
                        CLEAR(WHT61Base);
                        CLEAR(WHT62Desc);
                        WHT62Date := 0D;
                        CLEAR(WHT62AMT);
                        CLEAR(WHT62Base);
                        CLEAR(WHT63Desc);
                        WHT63Date := 0D;
                        CLEAR(WHT63AMT);
                        CLEAR(WHT63Base);
                        CLEAR(OldWHT62);
                        CLEAR(OldWHT5);
                        CLEAR(OldWHT61);
                        CLEAR(OldWHTPostingGroup);

                        CLEAR(CheckLedgEntry);
                        CheckLedgEntry.SetRange("Document No.", "Original Document No.");
                        CheckLedgEntry.SetRange("Posting Date", "Posting Date");
                        if CheckLedgEntry.FIND('-') then
                            //AVNPSTD.001
                            PayDate := CheckLedgEntry."Check Date"
                        //C-AVNPSTD.001
                        else
                            //AVNPSTD.001
                            PayDate := "Cheque Date";
                        //C-AVNPSTD.001
                        CLEAR(WHTEntry3);
                        CLEAR(Running);
                        WHTEntry3.SetCurrentKey("WHT Prod. Posting Group");
                        WHTEntry3.SetRange("Original Document No.", "Original Document No.");
                        WHTEntry3.SetRange("WHT Certificate No.", "WHT Certificate No.");
                        WHTEntry3.SetRange("Cancel Line", false);
                        WHTEntry3.NEXT;
                        iRec := WHTEntry3.COUNT;

                        for i := 1 to iRec do begin
                            CLEAR(WHTRevenueType);
                            WHTRevenueType.SetRange(Code, WHTEntry3."WHT Revenue Type");
                            if WHTRevenueType.FIND('-') then begin
                                if WHTRevenueType.Sequence = 1 then begin
                                    if PayDate = 0D then
                                        WHT1Date := WHTEntry3."Posting Date"
                                    else
                                        WHT1Date := PayDate;
                                    WHT1AMT := WHT1AMT + WHTEntry3."Amount (LCY)";
                                    WHT1Base := WHT1Base + WHTEntry3."Base (LCY)";
                                end
                                else
                                    if WHTRevenueType.Sequence = 2 then begin
                                        if PayDate = 0D then
                                            WHT2Date := WHTEntry3."Posting Date"
                                        else
                                            WHT2Date := PayDate;
                                        WHT2AMT := WHT2AMT + WHTEntry3."Amount (LCY)";
                                        WHT2Base := WHT2Base + WHTEntry3."Base (LCY)";
                                    end
                                    else
                                        if WHTRevenueType.Sequence = 3 then begin
                                            if PayDate = 0D then
                                                WHT3Date := WHTEntry3."Posting Date"
                                            else
                                                WHT3Date := PayDate;
                                            WHT3AMT := WHT3AMT + WHTEntry3."Amount (LCY)";
                                            WHT3Base := WHT3Base + WHTEntry3."Base (LCY)";
                                        end
                                        //AVNPSTD.001

                                        else
                                            if (WHTRevenueType.Sequence = 4) or (WHTRevenueType.Sequence = 41) or (WHTRevenueType.Sequence = 42) or
                                            (WHTRevenueType.Sequence = 43) or (WHTRevenueType.Sequence = 44) then
                                    //AVNPSTD.001

                                    begin

                                                if WHTRevenueType.Sequence = 4 then begin
                                                    WHT4Desc := 'X';
                                                    if PayDate = 0D then
                                                        WHT4Date := WHTEntry3."Posting Date"
                                                    else
                                                        WHT4Date := PayDate;
                                                    WHT4AMT := WHT4AMT + WHTEntry3."Amount (LCY)";
                                                    WHT4Base := WHT4Base + WHTEntry3."Base (LCY)";
                                                end
                                                else begin
                                                    PND4Type := COPYSTR(FORMAT(WHTRevenueType.Sequence), 2, 1);
                                                end;

                                                if PND4Type = '1' then begin
                                                    WHT41Desc := 'X';
                                                    if PayDate = 0D then
                                                        WHT41Date := WHTEntry3."Posting Date"
                                                    else
                                                        WHT41Date := PayDate;
                                                    WHT41AMT := WHT41AMT + WHTEntry3."Amount (LCY)";
                                                    WHT41Base := WHT41Base + WHTEntry3."Base (LCY)";
                                                end
                                                else
                                                    if PND4Type = '2' then begin
                                                        WHT42Desc := 'X';
                                                        if PayDate = 0D then
                                                            WHT42Date := WHTEntry3."Posting Date"
                                                        else
                                                            WHT42Date := PayDate;
                                                        WHT42AMT := WHT42AMT + WHTEntry3."Amount (LCY)";
                                                        WHT42Base := WHT42Base + WHTEntry3."Base (LCY)";
                                                    end
                                                    else
                                                        if PND4Type = '3' then begin
                                                            WHT43Desc := 'X';
                                                            if PayDate = 0D then
                                                                WHT43Date := WHTEntry3."Posting Date"
                                                            else
                                                                WHT43Date := PayDate;
                                                            WHT43AMT := WHT43AMT + WHTEntry3."Amount (LCY)";
                                                            WHT43Base := WHT43Base + WHTEntry3."Base (LCY)";
                                                        end
                                                        else
                                                            if PND4Type = '4' then begin
                                                                WHT44Desc := 'X';
                                                                if PayDate = 0D then
                                                                    WHT44Date := WHTEntry3."Posting Date"
                                                                else
                                                                    WHT44Date := PayDate;
                                                                WHT44AMT := WHT44AMT + WHTEntry3."Amount (LCY)";
                                                                WHT44Base := WHT44Base + WHTEntry3."Base (LCY)";
                                                            end
                                            end
                                            else
                                                if WHTRevenueType.Sequence = 5 then begin
                                                    if WHT5AMT = 0 then begin
                                                        CLEAR(WHTProdPostingGroup);
                                                        WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                        WHTProdPostingGroup.NEXT;

                                                        WHT5Desc := WHTProdPostingGroup.Description;
                                                        if PayDate = 0D then
                                                            WHT5Date := WHTEntry3."Posting Date"
                                                        else
                                                            WHT5Date := PayDate;
                                                        WHT5AMT := WHTEntry3."Amount (LCY)";
                                                        WHT5Base := WHTEntry3."Base (LCY)";
                                                        OldWHT5 := WHTEntry3."WHT %";
                                                    end
                                                    else
                                                        if OldWHT5 = WHTEntry3."WHT %" then begin
                                                            CLEAR(WHTProdPostingGroup);
                                                            WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                            WHTProdPostingGroup.NEXT;

                                                            WHT5Desc := WHTProdPostingGroup.Description;
                                                            if PayDate = 0D then
                                                                WHT5Date := WHTEntry3."Posting Date"
                                                            else
                                                                WHT5Date := PayDate;
                                                            WHT5AMT := WHT5AMT + WHTEntry3."Amount (LCY)";
                                                            WHT5Base := WHT5Base + WHTEntry3."Base (LCY)";
                                                        end
                                                        else begin
                                                            CLEAR(WHTProdPostingGroup);
                                                            WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                            WHTProdPostingGroup.NEXT;

                                                            WHT52Desc := WHTProdPostingGroup.Description;
                                                            if PayDate = 0D then
                                                                WHT52Date := WHTEntry3."Posting Date"
                                                            else
                                                                WHT52Date := PayDate;
                                                            WHT52AMT := WHT52AMT + WHTEntry3."Amount (LCY)";
                                                            WHT52Base := WHT52Base + WHTEntry3."Base (LCY)";
                                                        end
                                                end
                                                else
                                                    if WHTRevenueType.Sequence = 99 then begin
                                                        if WHT61AMT = 0 then begin
                                                            CLEAR(WHTProdPostingGroup);
                                                            WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                            WHTProdPostingGroup.NEXT;
                                                            //AVNPSTD.001
                                                            WHT61Desc := WHTProdPostingGroup.Description;
                                                            //WHT61Desc := WHTProdPostingGroup."Description 2";
                                                            //C-AVNPSTD.001
                                                            if PayDate = 0D then
                                                                WHT61Date := WHTEntry3."Posting Date"
                                                            else
                                                                WHT61Date := PayDate;
                                                            WHT61AMT := WHTEntry3."Amount (LCY)";
                                                            WHT61Base := WHTEntry3."Base (LCY)";
                                                            OldWHT61 := WHTEntry3."WHT %";
                                                            OldWHTPostingGroup[1] := WHTEntry3."WHT Prod. Posting Group";
                                                        end
                                                        else
                                                            if WHT62AMT = 0 then begin
                                                                //if OldWHT61 = WHTEntry3."WHT %" then
                                                                if OldWHTPostingGroup[1] = WHTEntry3."WHT Prod. Posting Group" then begin
                                                                    CLEAR(WHTProdPostingGroup);
                                                                    WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                                    WHTProdPostingGroup.NEXT;
                                                                    //AVNPSTD.001
                                                                    WHT61Desc := WHTProdPostingGroup.Description;
                                                                    //WHT61Desc := WHTProdPostingGroup."Description 2";
                                                                    //C-AVNPSTD.001
                                                                    if PayDate = 0D then
                                                                        WHT61Date := WHTEntry3."Posting Date"
                                                                    else
                                                                        WHT61Date := PayDate;
                                                                    WHT61AMT := WHT61AMT + WHTEntry3."Amount (LCY)";
                                                                    WHT61Base := WHT61Base + WHTEntry3."Base (LCY)";
                                                                end
                                                                else begin
                                                                    CLEAR(WHTProdPostingGroup);
                                                                    WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                                    WHTProdPostingGroup.NEXT;

                                                                    WHT62Desc := WHTProdPostingGroup.Description;
                                                                    if PayDate = 0D then
                                                                        WHT62Date := WHTEntry3."Posting Date"
                                                                    else
                                                                        WHT62Date := PayDate;
                                                                    WHT62AMT := WHT62AMT + WHTEntry3."Amount (LCY)";
                                                                    WHT62Base := WHT62Base + WHTEntry3."Base (LCY)";
                                                                    OldWHTPostingGroup[2] := WHTEntry3."WHT Prod. Posting Group"
                                                                end;
                                                            end
                                                            else
                                                                if WHT63AMT = 0 then begin
                                                                    //AVSSMCST.002//For Group 62//Not have code before but have valuable
                                                                    //if OldWHT62 = WHTEntry3."WHT %" then
                                                                    if OldWHTPostingGroup[2] = WHTEntry3."WHT Prod. Posting Group" then begin
                                                                        CLEAR(WHTProdPostingGroup);
                                                                        WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                                        WHTProdPostingGroup.NEXT;
                                                                        WHT62Desc := WHTProdPostingGroup.Description;
                                                                        if PayDate = 0D then
                                                                            WHT62Date := WHTEntry3."Posting Date"
                                                                        else
                                                                            WHT62Date := PayDate;
                                                                        WHT62AMT := WHT62AMT + WHTEntry3."Amount (LCY)";
                                                                        WHT62Base := WHT62Base + WHTEntry3."Base (LCY)";
                                                                    end
                                                                    else begin
                                                                        //AVSSMCST-end//For Group 62//Not have code before but have valuable
                                                                        CLEAR(WHTProdPostingGroup);
                                                                        WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                                        WHTProdPostingGroup.NEXT;
                                                                        WHT63Desc := WHTProdPostingGroup.Description;
                                                                        if PayDate = 0D then
                                                                            WHT63Date := WHTEntry3."Posting Date"
                                                                        else
                                                                            WHT63Date := PayDate;
                                                                        WHT63AMT := WHT63AMT + WHTEntry3."Amount (LCY)";
                                                                        WHT63Base := WHT63Base + WHTEntry3."Base (LCY)";
                                                                    end;//AVSSMCST-ONE LINE//For Group 62//Not have code before but have valuable
                                                                end
                                                                else begin
                                                                    //AVSSMCST-end//For Group 62//Not have code before but have valuable
                                                                    CLEAR(WHTProdPostingGroup);
                                                                    WHTProdPostingGroup.SetRange(Code, WHTEntry3."WHT Prod. Posting Group");
                                                                    WHTProdPostingGroup.NEXT;
                                                                    WHT63Desc := WHTProdPostingGroup.Description;
                                                                    if PayDate = 0D then
                                                                        WHT63Date := WHTEntry3."Posting Date"
                                                                    else
                                                                        WHT63Date := PayDate;
                                                                    WHT63AMT := WHT63AMT + WHTEntry3."Amount (LCY)";
                                                                    WHT63Base := WHT63Base + WHTEntry3."Base (LCY)";
                                                                end;//AVSSMCST-ONE LINE//For Group 62//Not have code before but have valuable

                                                    end;
                            end;
                            WHTEntry3.NEXT;
                        end;

                    end;
                    OldWHTNo := "WHT Certificate No.";


                    WHTAmount := 0;
                    WHTAmount := WHT1AMT + WHT2AMT + WHT3AMT + WHT4AMT + WHT41AMT + WHT42AMT + WHT43AMT +
                                WHT44AMT + WHT5AMT + WHT52AMT + WHT61AMT + WHT62AMT + WHT63AMT;

                    WHTAmountLCY := ROUND(WHTAmount, 0.01, '=');
                    ThaiAmountWords(WHTAmountLCY);

                    WHTBase := WHT1Base + WHT2Base + WHT3Base + WHT4Base + WHT41Base +
                            WHT42Base + WHT43Base + WHT44Base + WHT5Base +
                            WHT52Base + WHT61Base + WHT62Base + WHT63Base;
                end;

                trigger OnPreDataItem();
                begin
                    CLEAR(CompVat);
                    PurchSetup.GET;
                    CLEAR(CompanyInfo);
                    CompanyInfo.GET;

                    CompanyN := CompanyInfo.Name;

                    if (CompanyInfo."VAT Registration No." <> '') and (STRLEN(CompanyInfo."VAT Registration No.") = 10) then begin
                        for a := 1 to STRLEN(CompanyInfo."VAT Registration No.") do begin
                            if CompVat[a] = '' then
                                CompVat[a] := COPYSTR(CompanyInfo."VAT Registration No.", a, 1)
                        end;
                    end
                    else begin
                        for a := 1 to STRLEN(CompanyInfo."VAT Registration No.") do begin
                            if CompVat[a] = '' then
                                CompVat[a] := COPYSTR(CompanyInfo."VAT Registration No.", a, 1)
                        end;
                        //CompVat := CompanyInfo."VAT Registration No.";
                    end;
                    TotalAmountLCY := 0;
                    TotalBaseLCY := 0;

                    CLEAR(AVBookNo);
                    CLEAR(AVWHTNo);


                    CLEAR(txtOp1);
                    CLEAR(txtOp2);
                    CLEAR(txtOp3);
                    if TypeOption1 then begin
                        txtOp1 := 'X';
                    end else
                        if TypeOption2 then begin
                            txtOp2 := 'X';
                        end else
                            if TypeOption3 then begin
                                txtOp3 := 'X';
                            end;
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
                group("Option")
                {
                    Caption = 'Option';
                    ShowCaption = true;
                    group("Please specify the tax deduction conditions.")
                    {
                        Caption = 'Please specify the tax deduction conditions.';
                        ShowCaption = true;
                        field(TypeOption1; TypeOption1)
                        {
                            ApplicationArea = All;
                            Caption = '" (1)  หัก ณ ที่จ่าย (Withholding Tax)"';
                            ShowCaption = true;

                            trigger OnValidate();
                            begin
                                if TypeOption1 then begin
                                    TypeOption2 := false;
                                    TypeOption3 := false;
                                end;
                            end;
                        }
                        field(TypeOption2; TypeOption2)
                        {
                            ApplicationArea = All;
                            Caption = '" (2)  ออกให้ตลอดไป (Company absorb every WHT)"';
                            ShowCaption = true;

                            trigger OnValidate();
                            begin
                                if TypeOption2 then begin
                                    TypeOption1 := false;
                                    TypeOption3 := false;
                                end;
                            end;
                        }
                        field(TypeOption3; TypeOption3)
                        {
                            ApplicationArea = All;
                            Caption = '" (3)  ออกให้ครั้งเดียว (Company absorb One time WHT)"';
                            ShowCaption = true;
                            trigger OnValidate();
                            begin
                                if TypeOption3 then begin
                                    TypeOption1 := false;
                                    TypeOption2 := false;
                                end;
                            end;
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            TypeOption1 := true;
        end;
    }

    labels
    {
    }

    var
        CompanyInfo: Record "Company Information";

        PurchSetup: Record "Purchases & Payables Setup";
        WHTEntry2: Record "AVF_WHT Entry";
        WHTEntry3: Record "AVF_WHT Entry";
        WHTBPostingGroup: Record "AVF_WHT Business Posting Group";
        WHTRevenueType: Record "AVF_WHT Revenue Types";
        WHTProdPostingGroup: Record "AVF_WHT Product Posting Group";
        CompVat: array[20] of Text[100];
        VendVat: array[20] of Text[100];
        VendVat13: array[20] of Text[100];
        TotalAmountLCY: Decimal;
        TotalBaseLCY: Decimal;
        WHTAmountLCY: Decimal;
        WordsText: Text[500];
        WHTAmount: Decimal;
        WHTBase: Decimal;
        Individual: Text[1];
        Corporate: Text[1];

        CompanyN: Text[100];
        VendorName: Text[100];
        iRec: Integer;
        Running: Integer;
        WHT4Desc: Text[1];
        WHT41Desc: Text[1];
        WHT42Desc: Text[1];
        WHT43Desc: Text[1];
        WHT44Desc: Text[1];
        WHT5Desc: Text[50];
        WHT52Desc: Text[50];
        WHT61Desc: Text[50];
        WHT62Desc: Text[50];
        WHT63Desc: Text[50];
        WHT1Date: Date;
        WHT2Date: Date;
        WHT3Date: Date;
        WHT4Date: Date;
        WHT41Date: Date;
        WHT42Date: Date;
        WHT43Date: Date;
        WHT44Date: Date;
        WHT5Date: Date;
        WHT52Date: Date;
        WHT61Date: Date;
        WHT62Date: Date;
        WHT63Date: Date;
        WHT1AMT: Decimal;
        WHT2AMT: Decimal;
        WHT3AMT: Decimal;
        WHT4AMT: Decimal;
        WHT41AMT: Decimal;
        WHT42AMT: Decimal;
        WHT43AMT: Decimal;
        WHT44AMT: Decimal;
        WHT5AMT: Decimal;
        WHT52AMT: Decimal;
        WHT61AMT: Decimal;
        WHT62AMT: Decimal;
        WHT63AMT: Decimal;
        WHT1Base: Decimal;
        WHT2Base: Decimal;
        WHT3Base: Decimal;
        WHT4Base: Decimal;
        WHT41Base: Decimal;
        WHT42Base: Decimal;
        WHT43Base: Decimal;
        WHT44Base: Decimal;
        WHT5Base: Decimal;
        WHT52Base: Decimal;
        WHT61Base: Decimal;
        WHT62Base: Decimal;
        WHT63Base: Decimal;
        i: Integer;
        OldWHT5: Decimal;
        OldWHT61: Decimal;
        OldWHT62: Decimal;
        OldWHT63: Decimal;
        a: Integer;

        JnlDocNo: Code[20];
        PND2: Text[1];
        LineNo: Text[30];
        PND4Type: Text[1];
        PageString: Text[1024];
        RecWHTEntry: Record "AVF_WHT Entry";
        PayDate: Date;
        CheckLedgEntry: Record "Check Ledger Entry";
        VendorAddress: Text[1024];
        VATNo: Text[30];
        AVPostCode: Record "Post Code";
        TypeOption1: Boolean;
        TypeOption2: Boolean;
        TypeOption3: Boolean;
        txtOp1: Text[2];
        txtOp2: Text[2];
        txtOp3: Text[2];
        UpdateWHTEntry: Record "AVF_WHT Entry";
        AVBookNo: Code[20];
        AVWHTNo: Code[20];
        WHTHeader: Record "AVF_WHT Header";
        TestDate: Date;
        OldWHTNo: Code[20];
        OldWHTPostingGroup: array[3] of Code[10];

        maxrec: Decimal;

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
                Stang(AMT);
        end
        else begin
            AMT := AMT * 100;
            Stang(AMT);
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
        //    ELSE if POS = 1 then
        //      WordsText := WordsText + 'ล้าน';

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
        //ELSE if POS = 1 then
        //WordsText := WordsText + 'บาท';
    end;

    procedure Stang(StangAmt: Integer);
    var
        Ten: Integer;
        One: Integer;
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
}

