pageextension 50090 "INT_RCExtension" extends "FNGN017_Avision Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(sections)
        {
            group("INT_Interface Bank BBL")
            {
                Caption = 'Interface Bank BBL';

                action("INT_Bank BBL Generate")
                {
                    Caption = 'Bank BBL Generate';
                    RunObject = Page "INT_Bank BBL Generate";
                    ApplicationArea = Basic, Suite;
                }

                action("INT_Interface Bank BBL List")
                {
                    Caption = 'Interface Bank BBL List';
                    RunObject = Page "INT_Bank BBL List";
                    ApplicationArea = Basic, Suite;
                }

                action("INT_Interface Bank BBL Posted List")
                {
                    Caption = 'Interface Bank BBL Posted List';
                    RunObject = Page "INT_Bank BBL Posted List";
                    ApplicationArea = Basic, Suite;
                }

            }

            group("INT_Interface Bank DBK")
            {
                Caption = 'Interface Bank DBK';

                action("INT_Bank DBK Generate")
                {
                    Caption = 'Bank DBK Generate';
                    RunObject = Page "INT_Bank DBK Generate";
                    ApplicationArea = Basic, Suite;
                }

                action("INT_Interface Bank DBK List")
                {
                    Caption = 'Interface Bank DBK List';
                    RunObject = Page "INT_Bank DBK List";
                    ApplicationArea = Basic, Suite;
                }

                action("INT_Interface Bank DBK Posted List")
                {
                    Caption = 'Interface Bank DBK Posted List';
                    RunObject = Page "INT_Bank DBK Posted List";
                    ApplicationArea = Basic, Suite;
                }
            }
            group("INT_Import File")
            {
                Caption = 'Import File';
                action("INT_import Payroll")
                {
                    Caption = 'Import Payroll';
                    RunObject = xmlport INT_ImportPayroll;
                    ApplicationArea = Basic, Suite;
                }
                action("INT_import Scholarship")
                {
                    Caption = 'import Scholarship';
                    RunObject = page "Config. Packages";
                    ApplicationArea = Basic, Suite;
                }
            }


        }
        moveafter("Payment Journals"; "WHT Orders - Close")
        movebefore("Vendor Invoice No."; "WHT Orders")
        addafter("Vendor Invoice No.")
        {
            action("INT_Posted Purchase Receipts")
            {
                RunObject = Page "Posted Purchase Receipts";
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Purchase Receipts';
            }
        }


        modify("G/L Accounts Master")
        {
            //Visible = false;
            Visible = true;
        }
        modify("Items Master")
        {
            Visible = false;
        }
        modify("Salespersons/Purchasers")
        {
            Visible = false;
        }
        modify("Purchase Quotes")
        {
            Visible = false;
        }
        modify("Purchase Return Orders")
        {
            Visible = false;
        }
        modify("Blanket Purchase Orders")
        {
            Visible = false;
        }
        modify("Posted Return Shipments")
        {
            Visible = false;
        }
        modify(sale)
        {
            Visible = false;
        }
        modify(Inventory)
        {
            Visible = false;
        }
        modify("Purchase Analysis Report")
        {
            Visible = false;
        }
        modify("Sales Analysis Report")
        {
            Visible = false;
        }
        modify("Inventory Analysis Report")
        {
            Visible = false;
        }




        /*
        addafter("Posted Purchase Receipts")
        {
            action("INT_Report account payble")
            {
                Caption = 'Test';
                RunObject = Page "AVF_Object Report List";
                ApplicationArea = All;
                RunPageView = where("Group Report Filter" = const('AP'));
            }

        }
        */








        addfirst(Master)
        {
            action("INT_G/L Accounts Master")
            {
                //ToolTip = 'Setup AppName';
                RunObject = Page "Chart of Accounts";
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
            }

        }
        addlast(Master)
        {
            action("INT_Payment Term")
            {
                RunObject = Page "Payment Terms";
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Terms';
            }
        }
        addafter("Fixed Assets Journals")
        {
            action("INT_FA Posting Groups")
            {
                RunObject = Page "FA Posting Groups";
                ApplicationArea = Basic, Suite;
                Caption = 'FA Posting Groups';
            }
        }
        addafter("Analysis View")
        {
            action("INT_Accounting Periods")
            {
                RunObject = Page "Accounting Periods";
                ApplicationArea = Basic, Suite;
                Caption = 'Accounting Periods';
            }
        }
        addafter("Fixed Asset")
        {
            group("INT_Budget")
            {
                Caption = 'Budget';
                action("INT_G/L Budget")
                {
                    RunObject = Page "G/L Budget Entries";
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Budget';
                }
                action("INT_Account Schedule")
                {
                    RunObject = Page "Account Schedule";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedule';
                }
                action("INT_Analysis by Dimensions")
                {
                    RunObject = Page "Analysis by Dimensions";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Analysis by Dimensions';
                }
                action("INT_Report Budget")
                {
                    RunObject = Report Budget;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Report Budget';
                }
            }
        }
        addlast("G/L Account")
        {
            action("INT_G/L Registers")
            {
                RunObject = Page "G/L Registers";
                ApplicationArea = Basic, Suite;
                Caption = 'G/L Registers';
            }
        }

        addafter("INT_G/L Registers")
        {
            action("INT_Report G/L")
            {
                Caption = 'Report G/L';
                RunObject = Page "AVF_Object Report List";
                ApplicationArea = Basic, Suite;
                RunPageView = where("Group Report Filter" = const('GL'));
            }
        }

        addfirst(Setup)
        {
            action("INT_General Ledger Setup")
            {
                RunObject = Page "General Ledger Setup";
                ApplicationArea = Basic, Suite;
                Caption = 'General Ledger Setup';
            }
        }
        addfirst("Account Payable")
        {
            action("INT_Vendors")
            {
                RunObject = Page "Vendor List";
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
            }
        }
        addfirst("Account Receivable")
        {
            action("INT_Customers")
            {
                RunObject = Page "Customer List";
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
            }
        }


        modify(Workflows)
        {
            Visible = false;
        }
        modify("Approval Entries")
        {
            Visible = false;
        }
        modify(Job)
        {
            Visible = false;
        }

        modify("Posted Receipt/Tax Invoices")
        {
            Visible = false;
        }

        modify("INT_G/L Budget")
        {
            Caption = 'G/L Budget Entries';
        }
        addbefore("INT_G/L Budget")
        {
            action("INT_G/L Budget Exten")
            {
                Caption = 'G/L Budget';
                RunObject = page "G/L Budget Names";
            }
        }

    }
}