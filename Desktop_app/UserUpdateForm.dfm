object FormUpdateUser: TFormUpdateUser
  Left = 0
  Top = 0
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077
  ClientHeight = 413
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    430
    413)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelLogin: TLabel
    Left = 34
    Top = 110
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
  object Label1: TLabel
    Left = 32
    Top = 10
    Width = 37
    Height = 16
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 60
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
  object LabelDismissed: TLabel
    Left = 36
    Top = 308
    Width = 42
    Height = 16
    Caption = #1059#1074#1086#1083#1077#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelChangePWD: TLabel
    Left = 240
    Top = 205
    Width = 169
    Height = 44
    AutoSize = False
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1080' '#1085#1072#1078#1084#1080#1090#1077' "'#1057#1086#1093#1088#1072#1085#1080#1090#1100'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object BitBtnSave: TBitBtn
    Left = 8
    Top = 365
    Width = 113
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Kind = bkRetry
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtnSaveClick
  end
  object BitBtnCancel: TBitBtn
    Left = 315
    Top = 365
    Width = 102
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object EditUserID: TEdit
    Left = 91
    Top = 10
    Width = 39
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'EditUserID'
  end
  object EditFullName: TEdit
    Left = 91
    Top = 60
    Width = 282
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EditFullName'
    OnChange = EditFullNameChange
  end
  object EditLogin: TEdit
    Left = 90
    Top = 110
    Width = 143
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EditLogin'
    OnChange = EditLoginChange
    OnExit = EditLoginExit
  end
  object EditPassword: TEdit
    Left = 91
    Top = 210
    Width = 121
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 5
    Text = 'EditPassword'
    OnChange = EditPasswordChange
  end
  object CheckBoxWorking: TCheckBox
    Left = 252
    Top = 267
    Width = 97
    Height = 17
    Caption = #1056#1072#1073#1086#1090#1072#1077#1090
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 6
    OnClick = CheckBoxWorkingClick
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
    TabOrder = 7
    OnChange = DTHiredChange
  end
  object DTDismissed: TDateTimePicker
    Left = 93
    Top = 310
    Width = 129
    Height = 24
    Date = 44436.705664988420000000
    Time = 44436.705664988420000000
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnChange = DTDismissedChange
  end
  object BitBtnPassword: TBitBtn
    Left = 154
    Top = 365
    Width = 127
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    Kind = bkHelp
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 9
    OnClick = BitBtnPasswordClick
  end
  object ComboBoxRoles: TComboBox
    Left = 91
    Top = 157
    Width = 198
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnKeyPress = ComboBoxRolesKeyPress
    OnMouseEnter = ComboBoxRolesMouseEnter
    Items.Strings = (
      #1055#1077#1088#1089#1086#1085#1072#1083
      #1055#1077#1088#1089#1086#1085#1072#1083'2')
  end
  object CheckBoxNoAccess: TCheckBox
    Left = 258
    Top = 102
    Width = 164
    Height = 34
    Caption = #1041#1077#1079' '#1076#1086#1089#1090#1091#1087#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    WordWrap = True
    OnClick = CheckBoxNoAccessClick
  end
  object QueryCurrUser: TUniQuery
    UpdatingTable = 'users'
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'select'
      '    user_id,'
      '    full_name,'
      '    login,'
      '    password,'
      '    role_id,'
      '    is_active,'
      
        '    (select lang_role_name from user_roles r where r.role_id = u' +
        'sers.role_id) as lang_role_name,'
      '    hiring_date,'
      '    closure_date, '
      '    access_to_app'
      'from'
      '    users'
      'where user_id = :p_user_id')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_user_id'
        ParamType = ptInput
        Value = 0
      end>
    object QueryCurrUseruser_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'user_id'
    end
    object QueryCurrUserfull_name: TStringField
      FieldName = 'full_name'
      Required = True
      Size = 255
    end
    object QueryCurrUserlogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 255
    end
    object QueryCurrUserpassword: TStringField
      FieldName = 'password'
      Required = True
      Size = 255
    end
    object QueryCurrUserrole_id: TStringField
      FieldName = 'role_id'
      Required = True
      Size = 255
    end
    object QueryCurrUseris_active: TSmallintField
      FieldName = 'is_active'
      Required = True
    end
    object QueryCurrUserhiring_date: TDateField
      FieldName = 'hiring_date'
    end
    object QueryCurrUserclosure_date: TDateField
      FieldName = 'closure_date'
    end
    object QueryCurrUserlang_role_name: TStringField
      FieldName = 'lang_role_name'
      ReadOnly = True
      Size = 255
    end
    object QueryCurrUseraccess_to_app: TBooleanField
      FieldName = 'access_to_app'
    end
  end
  object UniQueryRoles: TUniQuery
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'select role_id, lang_role_name  from user_roles'
      'order by orderby')
    Left = 312
    Top = 16
    object UniQueryRolesrole_id: TStringField
      FieldName = 'role_id'
      Size = 50
    end
    object UniQueryRoleslang_role_name: TStringField
      FieldName = 'lang_role_name'
      Size = 255
    end
  end
  object UniUpdateSQLUser: TUniSQL
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'UPDATE users'
      'SET'
      '  full_name = :p_full_name, login = :p_login, '
      '  password = :p_password, '
      
        '  role_id = (select role_id from user_roles r where r.lang_role_' +
        'name = :p_lang_role_name), '
      '  hiring_date = :p_hiring_date, '
      
        '  closure_date = case when :p_closure_date is null then null els' +
        'e :p_closure_date end,'
      '  access_to_app=:p_access_to_app'
      'WHERE user_id = :p_user_id')
    Left = 248
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'p_full_name'
        ParamType = ptInput
        Value = '  '
      end
      item
        DataType = ftString
        Name = 'p_login'
        ParamType = ptInput
        Value = '  '
      end
      item
        DataType = ftString
        Name = 'p_password'
        ParamType = ptInput
        Value = '  '
      end
      item
        DataType = ftString
        Name = 'p_lang_role_name'
        ParamType = ptInput
        Value = 'Staff'
      end
      item
        DataType = ftDate
        Name = 'p_hiring_date'
        ParamType = ptInput
        Value = 44197d
      end
      item
        DataType = ftDate
        Name = 'p_closure_date'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftBoolean
        Name = 'p_access_to_app'
        ParamType = ptInput
        Value = True
      end
      item
        DataType = ftInteger
        Name = 'p_user_id'
        ParamType = ptInput
        Value = 0
      end>
  end
  object UniLoginsCntr: TUniQuery
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'select count(*) as cntr,  '
      'sum(is_active) as cntr_active'
      'from users'
      'where upper(login) = upper(:p_login)'
      'and user_id <> :p_user_id'
      'and access_to_app=1')
    Left = 336
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'p_login'
        ParamType = ptInput
        Value = 'AAA'
      end
      item
        DataType = ftInteger
        Name = 'p_user_id'
        ParamType = ptInput
        Value = 0
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
