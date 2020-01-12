pageextension 50137 "INT_FA Reclass. Journal" extends "FA Reclass. Journal"
{
    layout
    {
        modify("Insert Bal. Account")
        {
            Visible = false;
        }
        modify("Reclassify Acquisition Cost")
        {
            Width = 8;
        }
        modify("Reclassify Depreciation")
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
