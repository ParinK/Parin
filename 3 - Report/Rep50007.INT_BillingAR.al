report 50007 "INT_Billing-AR"
{
    // version AVOMOVIP

    DefaultLayout = RDLC;
    RDLCLayout = 'Rdlc/Billing-AR.rdl';
    Caption = 'Billing-AR';

    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Billing Header"; "FNAR001_Billing Header")
        {
            DataItemTableView = SORTING("Billing No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Billing No.";
            column(TextCompany_name; TextCompany_name)
            {
            }
            column(TextCompany_add; TextCompany_add)
            {
            }
            column(TextCompany_phone; TextCompany_phone)
            {
            }
            column(TextCompany_add1; TextCompany_add1)
            {
            }
            column(TextCompany_VAT; 'เลขประจำตัวผู้เสียภาษี : ' + TCompany."VAT Registration No.")
            {
            }
            column(ShowBilling; ShowBilling)
            {
            }
            column(Cust_No; Cust."No.")
            {
            }
            column(Cust_Name; Cust.Name)
            {
            }
            column(Cust_Add; Cust.Address + ' ' + Cust."Address 2" + ' ' + Cust."AVF_Address 3")
            {
            }
            column(Cust_Phone; Cust."Phone No.")
            {
            }
            column(Cust_VatRegst; Cust."VAT Registration No.")
            {
            }
            column(Cust_BranchNo; TCompany.INT_Branch)
            {
            }
            column(PIC_COMINFO; TCompany.Picture)
            {
            }
            column(Cust_Fax; Cust."Fax No.")
            {
            }
            column(Cust_Email; Cust."E-Mail")
            {
            }
            column(Bill_No; "Billing Header"."Billing No.")
            {
            }
            column(Bill_Date; FORMAT("Billing Header"."Billing Date", 0, 1))
            {
            }
            column(Bill_ConBill; '')
            {
            }
            column(Bill_ConPay; '')
            {
            }
            column(Bill_Remark; "Billing Header".Remark)
            {
            }
            column(RunningText; 'รวมทั้งสิ้น ' + FORMAT(recBillingCount.COUNT) + ' ฉบับ')
            {
            }
            column(SumAmount; SumAmount)
            {
            }
            column(TxtSumAmt; TxtSumAmt)
            {
            }
            dataitem("Billing Line"; "FNAR001_Billing Line")
            {
                DataItemLink = "Billing No." = FIELD("Billing No.");
                DataItemTableView = SORTING("Billing No.", "Line No.");
                column(Running; Running)
                {
                }
                column(Bill_Line_ExDoc; "Billing Line"."Document No.")
                {
                }
                column(Bill_Line_PostDate; FORMAT("Billing Line"."Posting Date", 0, 1))
                {
                }
                column(Bill_Line_DueDate; FORMAT("Billing Line"."Due Date", 0, 1))
                {
                }
                column(Bill_Line_Amt; TAmount)
                {
                }
                column(Bill_Line_Description; Description)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    Running += 1;
                    if (Manual = true) and ("Amount Manual" <> 0) then
                        TAmount := "Billing Line"."Amount Manual"
                    else
                        if ("Document No." <> '') and (Amount <> 0) then
                            TAmount := "Billing Line".Amount
                        else
                            TAmount := 0;
                    //AVNSB 270613
                    Total := Total + TAmount;
                    SumAmount := Total;
                    TxtSumAmt := Thai.ThaiAmountWords(ROUND(SumAmount, 0.01, '='));

                    if (CountLine mod maxline = 0) then begin
                        SumAmount := Total;
                        TxtSumAmt := Thai.ThaiAmountWords(ROUND(SumAmount, 0.01, '='));
                    end;
                    //END_AVNSB 270613
                end;

                trigger OnPreDataItem();
                begin
                    //AVNSB 270613
                    CountLine := COUNT;
                    //END_AVNSB 270613
                    //AVNSB 270613
                    CLEAR(Total);
                    CLEAR(SumAmount);
                    CLEAR(TAmount);
                    //END_AVNSB 270613
                end;
            }
            dataitem("Empty Line"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(addline; addline)
                {
                }

                trigger OnPreDataItem();
                begin
                    if (CountLine = Running) and (Running <> maxline) then begin
                        if (CountLine mod maxline = 0) then
                            SETRANGE(Number, 1, 0)
                        else begin
                            addline := maxline - (CountLine mod maxline);
                            SETRANGE(Number, 1, addline);
                        end;
                    end else
                        SETRANGE(Number, 1, 0);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(Running);
                CLEAR(ShowBilling);
                if "Billing Header"."Billing Type" = "Billing Header"."Billing Type"::AR then
                    ShowBilling := 'ใบวางบิล'
                else
                    ShowBilling := 'ใบรับวางบิล';

                CLEAR(Cust);
                Cust.SETCURRENTKEY(Cust."No.");
                Cust.SETRANGE(Cust."No.", "Billing Header"."Customer No.");
                if Cust.FINDFIRST then;

                recBillingCount.SETRANGE(recBillingCount."Billing No.", "Billing Header"."Billing No.");
                if recBillingCount.FIND('-') then;
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(Running);
                TCompany.GET;
                TCompany.CALCFIELDS(Picture);

                TextCompany_name := TCompany.Name + ' ' + TCompany."Name 2";
                TextCompany_add := TCompany.Address;
                TextCompany_add1 := TCompany."Address 2" + ' ' + TCompany.City + ' ' + TCompany."Post Code";
                TextCompany_phone := 'โทร: ' + TCompany."Phone No." + ' โทรสาร: ' + TCompany."Fax No.";
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        maxline := 7;
    end;

    var
        TextCompany_name: Text[1024];
        TextCompany_add: Text[1024];
        TextCompany_add1: Text[1024];
        TextCompany_phone: Text[1024];
        TCompany: Record "Company Information";
        Running: Integer;
        ShowBilling: Text[50];
        Cust: Record Customer;
        CountLine: Integer;
        maxline: Integer;
        addline: Integer;
        recBillingCount: Record "FNAR001_Billing Line";
        TAmount: Decimal;
        SumAmount: Decimal;
        Thai: Codeunit AVF_Thai;
        TxtSumAmt: Text[200];
        Total: Decimal;
}

