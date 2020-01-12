page 50090 "INT_Dimension Set Entries EDIT"
{
    Caption = 'Dimension Set Entries EDIT';
    Editable = true;
    PageType = List;
    SourceTable = "Dimension Set Entry";
    Permissions = TableData "Dimension Set Entry" = rimd;
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Dimension Set ID"; "Dimension Set ID")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension set id.';
                    Visible = true;
                    Caption = 'Dimension Set ID';
                }
                field("Dimension Code"; "Dimension Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension.';
                }
                field("Dimension Name"; "Dimension Name")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the descriptive name of the Dimension Code field.';
                    Visible = false;
                }
                field(DimensionValueCode; "Dimension Value Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension value.';
                }
                field("Dimension Value Name"; "Dimension Value Name")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the descriptive name of the Dimension Value Code field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if FormCaption <> '' then
            CurrPage.Caption := FormCaption;
    end;

    var
        FormCaption: Text[250];

    procedure SetFormCaption(NewFormCaption: Text[250])
    begin
        FormCaption := CopyStr(NewFormCaption + ' - ' + CurrPage.Caption, 1, MaxStrLen(FormCaption));
    end;
}
