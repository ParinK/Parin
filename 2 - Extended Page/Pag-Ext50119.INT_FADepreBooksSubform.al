pageextension 50119 "INT_FA Depre Books Subform" extends "FA Depreciation Books Subform"
{
    layout
    {
        modify("Declining-Balance %")
        {
            Visible = false;
        }
        modify("No. of Depreciation Years")
        {
            Visible = false;
        }
        addafter("""Disposal Date"" > 0D")
        {
            field("INT_Disposal Date"; "Disposal Date")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Depreciation Ending Date"; BookValue)
        modify("Depreciation Ending Date")
        {
            Visible = false;
        }
        addafter("Depreciation Starting Date")
        {
            field("INT_Depreciation"; Depreciation)
            {
                ApplicationArea = All;
                Width = 12;
            }
            field("INT_Acquisition Date"; "Acquisition Date")
            {
                ApplicationArea = All;
                Width = 14;
            }
            field("INT_Acquisition Cost"; "Acquisition Cost")
            {
                ApplicationArea = All;
                Width = 14;
            }
        }
        modify("""Disposal Date"" > 0D")
        {
            Width = 9;
        }
        addafter("Depreciation Method")
        {
            field("Straight-Line %21871"; "Straight-Line %")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
