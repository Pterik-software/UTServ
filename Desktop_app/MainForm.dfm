object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1088#1072#1089#1095#1105#1090#1072' '#1082#1086#1084#1084#1091#1085#1072#1083#1100#1085#1099#1093' '#1091#1089#1083#1091#1075
  ClientHeight = 461
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 688
    Top = 421
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1093#1086#1076
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N26: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        OnClick = N26Click
      end
      object mnuAbout: TMenuItem
        Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082#1080' '#1080' '#1072#1076#1088#1077#1089#1072
        OnClick = mnuAboutClick
      end
      object N7: TMenuItem
        Caption = #1055#1083#1072#1085#1099' '#1086#1087#1083#1072#1090#1099
        OnClick = N7Click
      end
      object N25: TMenuItem
        Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      end
      object C1: TMenuItem
        Caption = #1057#1095#1077#1090#1072
      end
    end
    object N8: TMenuItem
      Caption = #1060#1080#1085#1072#1085#1089#1099
      object N9: TMenuItem
        Caption = #1050#1074#1080#1090#1072#1085#1094#1080#1080
      end
      object N10: TMenuItem
        Caption = #1054#1087#1083#1072#1090#1099
      end
      object N11: TMenuItem
        Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      end
      object N12: TMenuItem
        Caption = #1040#1088#1093#1080#1074' '#1086#1087#1083#1072#1090
      end
      object N13: TMenuItem
        Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      end
      object N22: TMenuItem
        Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1074#1099#1087#1080#1089#1082#1080
      end
    end
    object N14: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N15: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1087#1077#1088#1080#1086#1076
      end
      object N16: TMenuItem
        Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
      end
      object N17: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1082#1074#1080#1090#1072#1085#1094#1080#1081
      end
      object N23: TMenuItem
        Caption = #1056#1072#1089#1095#1105#1090' '#1087#1077#1085#1080
      end
      object N18: TMenuItem
        Caption = #1057#1087#1080#1089#1082#1080' '#1076#1086#1083#1078#1085#1080#1082#1086#1074
      end
      object N19: TMenuItem
        Caption = #1055#1086#1076#1072#1105#1084' '#1074' '#1089#1091#1076'!'
      end
    end
    object N20: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object Help1: TMenuItem
        Caption = 'Help '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      end
      object N5: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N5Click
      end
      object N24: TMenuItem
        Caption = #1057#1082#1072#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
      end
    end
  end
  object UniConnection: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'utilbills'
    Username = 'test'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 128
    Top = 104
    EncryptedPassword = '8BFF9AFF8CFF8BFFCEFFCDFFCCFF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 232
    Top = 112
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 144
    Top = 224
  end
end
