object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1082#1072#1083#1077#1085#1076#1072#1088#1100
  ClientHeight = 502
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 456
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object MemoInserts: TMemo
    Left = 8
    Top = 24
    Width = 577
    Height = 241
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object MC: TMonthCalendar
    Left = 208
    Top = 271
    Width = 191
    Height = 160
    Date = 44444.401401423610000000
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 518
    Top = 456
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtnDelCalendar: TBitBtn
    Left = 224
    Top = 456
    Width = 161
    Height = 25
    Caption = 'Clear Calendar'
    TabOrder = 4
    OnClick = BitBtnDelCalendarClick
  end
  object MaskEditYear: TMaskEdit
    Left = 32
    Top = 312
    Width = 58
    Height = 27
    EditMask = '!9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 5
    Text = '2020'
  end
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'xbill'
    Username = 'test'
    Server = 'localhost'
    Connected = True
    Left = 104
    Top = 136
    EncryptedPassword = '8BFF9AFF8CFF8BFFCEFFCDFFCCFF'
  end
  object UniQueryDates: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'INSERT INTO `calendar`(c_date,'
      '                     c_day_of_month,'
      '                     c_day_of_year,'
      '                     c_is_work_day,'
      '                     c_month,'
      '                     c_year,'
      '                     c_quater,'
      '                     c_day_of_week, '
      '                     c_week_of_year,'
      '                     c_reason_day_off)'
      '     VALUES (:p_date,'
      '             :p_day_of_month,'
      '             :p_day_of_year,'
      '             :p_work_day,'
      '             :p_month,'
      '             :p_year,'
      '             :p_quater,'
      '             :p_day_of_week, '
      '             :p_week_of_year,'
      '             :p_reason_day_off)')
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_date'
        Value = 44197d
      end
      item
        DataType = ftInteger
        Name = 'p_day_of_month'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'p_day_of_year'
        Value = 0
      end
      item
        DataType = ftBoolean
        Name = 'p_work_day'
        Value = True
      end
      item
        DataType = ftInteger
        Name = 'p_month'
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'p_year'
        Value = 2021
      end
      item
        DataType = ftInteger
        Name = 'p_quater'
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'p_day_of_week'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'p_week_of_year'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_reason_day_off'
        Value = nil
      end>
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 184
    Top = 136
  end
  object UniQueryDelete: TUniQuery
    SQLDelete.Strings = (
      'delete from calendar')
    Connection = UniConnection1
    SQL.Strings = (
      'delete from calendar')
    Left = 360
    Top = 136
  end
  object UniQueryCheckYears: TUniQuery
    SQLDelete.Strings = (
      'delete from calendar'
      'where c_year =:p_year')
    SQLRecCount.Strings = (
      'select count (*) from calendar'
      'where c_year = :p_year')
    Connection = UniConnection1
    SQL.Strings = (
      'select count(*) as cntr from calendar'
      'where c_year = :p_year')
    Left = 472
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_year'
        Value = 0
      end>
    object UniQueryCheckYearscntr: TLargeintField
      FieldName = 'cntr'
      ReadOnly = True
      Required = True
    end
  end
end
