object FormNewUser: TFormNewUser
  Left = 0
  Top = 0
  Caption = 'FormNewUser'
  ClientHeight = 367
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    458
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 32
    Top = 20
    Width = 27
    Height = 16
    Caption = #1060#1048#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 34
    Top = 70
    Width = 35
    Height = 16
    Caption = #1051#1086#1075#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 160
    Width = 32
    Height = 16
    Caption = #1056#1086#1083#1100' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 34
    Top = 208
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelHired: TLabel
    Left = 34
    Top = 258
    Width = 42
    Height = 16
    Caption = #1055#1088#1080#1085#1103#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnSave: TBitBtn
    Left = 48
    Top = 319
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtnSaveClick
  end
  object BitBtnCancel: TBitBtn
    Left = 270
    Top = 319
    Width = 156
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object EditFullName: TEdit
    Left = 91
    Top = 20
    Width = 282
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EditLogin: TEdit
    Left = 90
    Top = 70
    Width = 283
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ComboBoxRoles: TComboBox
    Left = 91
    Top = 157
    Width = 282
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object EditPassword: TEdit
    Left = 91
    Top = 210
    Width = 282
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DTHired: TDateTimePicker
    Left = 93
    Top = 260
    Width = 129
    Height = 24
    Date = 44436.705664988420000000
    Time = 44436.705664988420000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object StaticText1: TStaticText
    Left = 91
    Top = 108
    Width = 206
    Height = 20
    Caption = #1048#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1085#1077' '#1073#1086#1083#1077#1077' 8 '#1089#1080#1084#1074#1086#1083#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object StaticText2: TStaticText
    Left = 93
    Top = 131
    Width = 211
    Height = 20
    Caption = #1052#1086#1078#1085#1086' '#1091#1082#1072#1079#1072#1090#1100' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1091#1102' '#1087#1086#1095#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object UniQueryRoles: TUniQuery
    Connection = FormDM.UniSQLite
    SQL.Strings = (
      'select * from user_roles')
    Left = 248
    Top = 216
    object UniQueryRolesrole_id: TStringField
      FieldName = 'role_id'
      Size = 50
    end
  end
  object UniInsertSQLUser: TUniSQL
    Connection = FormDM.UniSQLite
    SQL.Strings = (
      'insert into users '
      
        '(full_name, user, password, role_id, hiring_date, closure_date, ' +
        'is_active  )'
      'values'
      
        '(:p_full_name, :p_user, :p_password, :p_role_id, :p_hiring_date,' +
        ' null, 1)'
      '')
    Left = 344
    Top = 216
    ParamData = <
      item
        DataType = ftWideString
        Name = 'p_full_name'
        Value = #39#39
      end
      item
        DataType = ftWideString
        Name = 'p_user'
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'p_password'
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'p_role_id'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'p_hiring_date'
        Value = nil
      end>
  end
end
