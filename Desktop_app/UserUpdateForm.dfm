object FormNewUser: TFormNewUser
  Left = 0
  Top = 0
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077
  ClientHeight = 329
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    598
    329)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 32
    Top = 120
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
  object Label3: TLabel
    Left = 32
    Top = 168
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
    Top = 216
    Width = 106
    Height = 16
    Caption = #1056#1086#1083#1100' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 32
    Top = 24
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
  object BitBtnClose: TBitBtn
    Left = 48
    Top = 281
    Width = 156
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Kind = bkRetry
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 0
    ExplicitTop = 413
  end
  object BitBtn1: TBitBtn
    Left = 410
    Top = 281
    Width = 156
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Kind = bkCancel
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
    ExplicitLeft = 496
    ExplicitTop = 413
  end
  object DBEdit1: TDBEdit
    Left = 251
    Top = 76
    Width = 289
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    DataField = 'full_name'
    DataSource = UniDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 251
    Top = 120
    Width = 289
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    DataField = 'user'
    DataSource = UniDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 251
    Top = 165
    Width = 289
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    DataField = 'password'
    DataSource = UniDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 251
    Top = 213
    Width = 289
    Height = 24
    DataField = 'role_id'
    DataSource = UniDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object StaticText1: TStaticText
    Left = 32
    Top = 76
    Width = 161
    Height = 24
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 251
    Top = 21
    Width = 289
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdLeftToRight
    DataField = 'user_id'
    DataSource = UniDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object UniTable1: TUniTable
    TableName = 'users'
    Connection = FormMain.UniConnection
    FilterSQL = 'where user_id = :p_user_id'
    UniDirectional = True
    Left = 48
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_user_id'
        Value = nil
      end>
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniTable1
    Left = 168
    Top = 240
  end
  object UniStoredProc1: TUniStoredProc
    Connection = FormMain.UniConnection
    Left = 552
    Top = 112
  end
  object UniSQL1: TUniSQL
    Connection = FormMain.UniConnection
    SQL.Strings = (
      'select * from users'
      'where user_id = :p_user_id')
    Left = 352
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_user_id'
        Value = nil
      end>
  end
end
