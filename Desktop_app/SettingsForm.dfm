object FormSettings: TFormSettings
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1076#1083#1103' '#1042#1072#1096#1077#1081' '#1082#1086#1084#1087#1072#1085#1080#1080
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    784
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnClose: TBitBtn
    Left = 616
    Top = 513
    Width = 160
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    Layout = blGlyphRight
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtnCloseClick
    ExplicitLeft = 516
    ExplicitTop = 413
  end
  object RadioGroupThemes: TRadioGroup
    Left = 8
    Top = 8
    Width = 201
    Height = 105
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    ItemIndex = 0
    Items.Strings = (
      #1058#1105#1084#1085#1072#1103
      #1057#1074#1077#1090#1083#1072#1103
      #1052#1077#1090#1072#1083#1083#1080#1082)
    TabOrder = 1
  end
  object RadioGroupRounds: TRadioGroup
    Left = 8
    Top = 144
    Width = 201
    Height = 105
    Caption = #1054#1082#1088#1091#1075#1083#1077#1085#1080#1077' '#1087#1088#1080' '#1088#1072#1089#1095#1105#1090#1072#1093
    ItemIndex = 0
    Items.Strings = (
      #1044#1086' 1 '#1082#1086#1087#1077#1081#1082#1080
      #1044#1086' 10 '#1082#1086#1087#1077#1077#1082
      #1044#1086' 1 '#1075#1088#1080#1074#1085#1099)
    TabOrder = 2
  end
  object BitBtnSave: TBitBtn
    Left = 8
    Top = 513
    Width = 156
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    Layout = blGlyphRight
    ModalResult = 8
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnSaveClick
    ExplicitTop = 413
  end
  object UniQuerySettings: TUniQuery
    UpdatingTable = 'settings'
    SQL.Strings = (
      
        'select rowid, key, value, required, created_date, created_by, up' +
        'dated_date, updated_by  '
      'from settings '
      'where key = :p_key')
    UniDirectional = True
    Left = 64
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_key'
        Value = nil
      end>
    object UniQuerySettingskey: TStringField
      FieldName = 'key'
      Size = 255
    end
    object UniQuerySettingsvalue: TStringField
      FieldName = 'value'
      Size = 255
    end
    object UniQuerySettingsrowid: TIntegerField
      FieldName = 'rowid'
      ReadOnly = True
    end
    object UniQuerySettingsrequired: TSmallintField
      FieldName = 'required'
    end
    object UniQuerySettingscreated_date: TDateTimeField
      FieldName = 'created_date'
    end
    object UniQuerySettingscreated_by: TIntegerField
      FieldName = 'created_by'
    end
    object UniQuerySettingsupdated_date: TDateTimeField
      FieldName = 'updated_date'
    end
    object UniQuerySettingsupdated_by: TIntegerField
      FieldName = 'updated_by'
    end
  end
  object UniUpdateSettings: TUniQuery
    UpdatingTable = 'settings'
    SQL.Strings = (
      'UPDATE settings'
      'set value = :p_value, '
      'updated_by = :p_current_user, '
      'updated_date = CURRENT_TIMESTAMP'
      'WHERE key = :p_key')
    UniDirectional = True
    Left = 200
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_value'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_current_user'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_key'
        Value = nil
      end>
    object StringField1: TStringField
      FieldName = 'key'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'value'
      Size = 255
    end
    object IntegerField1: TIntegerField
      FieldName = 'rowid'
      ReadOnly = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'required'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'created_date'
    end
    object IntegerField2: TIntegerField
      FieldName = 'created_by'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'updated_date'
    end
    object IntegerField3: TIntegerField
      FieldName = 'updated_by'
    end
  end
end
