object FormNewUser: TFormNewUser
  Left = 0
  Top = 0
  Caption = 'FormNewUser'
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
  object BitBtnClose: TBitBtn
    Left = 48
    Top = 413
    Width = 156
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Kind = bkRetry
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 496
    Top = 413
    Width = 156
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Kind = bkCancel
    Layout = blGlyphRight
    NumGlyphs = 2
    TabOrder = 1
  end
  object UniTable1: TUniTable
    TableName = 'users'
    Connection = FormMain.UniConnection
    UniDirectional = True
    Active = True
    Left = 112
    Top = 184
  end
end
