object FormCompanyCard: TFormCompanyCard
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1086#1084#1087#1072#1085#1080#1080
  ClientHeight = 461
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    684
    461)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 668
    Height = 201
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 601
      Height = 19
      Caption = 
        #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1084#1087#1072#1085#1080#1080' '#1085#1072' '#1091#1082#1088#1072#1080#1085#1089#1082#1086#1084' '#1103#1079#1099#1082#1077' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1084' '#1076 +
        #1086#1082#1091#1084#1077#1085#1090#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 304
      Top = 97
      Width = 159
      Height = 16
      Caption = #1059#1095#1088#1077#1076#1080#1090#1077#1083#1100#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 97
      Width = 112
      Height = 16
      Caption = #1058#1080#1087' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 16
      Top = 55
      Width = 641
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 16
      Top = 119
      Width = 209
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Edit1'
    end
    object Edit3: TEdit
      Left = 304
      Top = 119
      Width = 209
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Edit1'
    end
  end
  object BitBtnClose: TBitBtn
    Left = 516
    Top = 413
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
  end
  object UniSQLCompanyCard: TUniQuery
    UpdatingTable = 'users'
    DataTypeMap = <
      item
        FieldName = 'is_active'
        FieldType = ftBoolean
      end>
    Connection = DM.UniSQLite
    SQL.Strings = (
      'select '
      'user_id, full_name, user, password, '
      'role_id, is_active, hiring_date, closure_date, '
      
        '(select max(orderby) from user_roles ur where ur.role_id  = user' +
        's.role_id) as orderby'
      'from users'
      'order by orderby')
    Active = True
    AutoCalcFields = False
    Left = 64
    Top = 288
    object UniSQLCompanyCarduser_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'user_id'
    end
    object UniSQLCompanyCardfull_name: TStringField
      FieldName = 'full_name'
      Size = 255
    end
    object UniSQLCompanyCarduser: TStringField
      FieldName = 'user'
      Size = 255
    end
    object UniSQLCompanyCardpassword: TStringField
      FieldName = 'password'
      Size = 255
    end
    object UniSQLCompanyCardrole_id: TStringField
      FieldName = 'role_id'
      Size = 255
    end
    object UniSQLCompanyCardis_active: TBooleanField
      FieldName = 'is_active'
    end
    object UniSQLCompanyCardis_working: TStringField
      FieldKind = fkCalculated
      FieldName = 'is_working'
      Size = 10
      Calculated = True
    end
    object UniSQLCompanyCardhiring_date: TDateField
      FieldName = 'hiring_date'
    end
    object UniSQLCompanyCardclosure_date: TDateField
      FieldName = 'closure_date'
    end
  end
  object DSCompanyCard: TDataSource
    DataSet = UniSQLCompanyCard
    Left = 328
    Top = 296
  end
end
