object FormNewUser: TFormNewUser
  Left = 0
  Top = 0
  Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1086' '#1085#1086#1074#1086#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077
  ClientHeight = 367
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    484
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
  object LabelLogin: TLabel
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
  object LabelPassword: TLabel
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
    Left = 296
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
    Width = 143
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = EditLoginExit
  end
  object ComboBoxRoles: TComboBox
    Left = 91
    Top = 157
    Width = 282
    Height = 24
    Style = csDropDownList
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
  object STComment2: TStaticText
    Left = 67
    Top = 131
    Width = 229
    Height = 20
    Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object STComment1: TStaticText
    Left = 67
    Top = 105
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
  object CheckBoxNoAccess: TCheckBox
    Left = 288
    Top = 70
    Width = 164
    Height = 34
    Caption = #1041#1077#1079' '#1076#1086#1089#1090#1091#1087#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    WordWrap = True
    OnClick = CheckBoxNoAccessClick
  end
  object UniQueryRoles: TUniQuery
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'select * from user_roles')
    Active = True
    Left = 240
    Top = 256
    object UniQueryRolesrole_id: TStringField
      FieldName = 'role_id'
      Size = 50
    end
    object UniQueryRolesorderby: TIntegerField
      FieldName = 'orderby'
      Required = True
    end
    object UniQueryRolesrole_name: TStringField
      FieldName = 'role_name'
      Size = 255
    end
    object UniQueryRoleslang_role_name: TStringField
      FieldName = 'lang_role_name'
      Size = 255
    end
  end
  object UniInsertSQLUser: TUniSQL
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'insert into users '
      '(full_name, login, password, '
      'role_id, '
      'hiring_date, closure_date, is_active, access_to_app)'
      'values'
      '(:p_full_name, :p_login, :p_password, '
      
        '(select role_id from user_roles r where r.lang_role_name = :p_la' +
        'ng_role_name),'
      ':p_hiring_date, null, 1, :p_access_to_app)')
    Left = 432
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'p_full_name'
        ParamType = ptInput
        Value = 'Sergey Belov'
      end
      item
        DataType = ftString
        Name = 'p_login'
        ParamType = ptInput
        Value = 'aaa'
      end
      item
        DataType = ftString
        Name = 'p_password'
        ParamType = ptInput
        Value = '111'
      end
      item
        DataType = ftString
        Name = 'p_lang_role_name'
        ParamType = ptInput
        Value = #1044#1080#1088#1077#1082#1090#1086#1088
      end
      item
        DataType = ftDate
        Name = 'p_hiring_date'
        ParamType = ptInput
        Value = 44197d
      end
      item
        DataType = ftBoolean
        Name = 'p_access_to_app'
        ParamType = ptInput
        Value = nil
      end>
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQueryRoles
    Left = 400
    Top = 264
  end
  object UniLoginsCntr: TUniQuery
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'select count(*) as cntr,  '
      'sum(is_active) as cntr_active'
      'from users'
      'where upper(login) = upper(:p_login)'
      'and access_to_app=1')
    Left = 312
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'p_login'
        ParamType = ptInput
        Value = 'AAA'
      end>
    object UniLoginsCntrcntr: TLargeintField
      FieldName = 'cntr'
      ReadOnly = True
      Required = True
    end
    object UniLoginsCntrcntr_active: TFloatField
      FieldName = 'cntr_active'
      ReadOnly = True
    end
  end
end
