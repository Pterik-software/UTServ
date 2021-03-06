object FormCalendar: TFormCalendar
  Left = 0
  Top = 0
  Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    784
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 264
    Top = 374
    Width = 125
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1091#1078#1085#1099#1081' '#1084#1077#1089#1103#1094
  end
  object BitBtnClose: TBitBtn
    Left = 572
    Top = 513
    Width = 204
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
  object BitBtnUpdateWorkday: TBitBtn
    Left = 572
    Top = 393
    Width = 204
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1088#1072#1073#1086#1095#1080#1081' '#1076#1077#1085#1100' '#1085#1072' '#1074#1099#1093#1086#1076#1085#1086#1081
    Layout = blGlyphRight
    TabOrder = 1
    OnClick = BitBtnUpdateWorkdayClick
  end
  object MonthCalendar: TMonthCalendar
    Left = 238
    Top = 393
    Width = 191
    Height = 160
    Anchors = [akLeft, akBottom]
    Date = 44455.812448414360000000
    TabOrder = 2
    OnClick = MonthCalendarClick
  end
  object RadioGroupDays: TRadioGroup
    Left = 21
    Top = 379
    Width = 124
    Height = 160
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
    ItemIndex = 0
    Items.Strings = (
      #1042#1089#1077' '#1076#1085#1080' '
      #1056#1072#1073#1086#1095#1080#1077' '#1076#1085#1080
      #1042#1099#1093#1086#1076#1085#1099#1077' '#1076#1085#1080)
    TabOrder = 3
    OnClick = RadioGroupDaysClick
  end
  object BitBtnUpdateHolyday: TBitBtn
    Left = 572
    Top = 457
    Width = 204
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1074#1099#1093#1086#1076#1085#1086#1081' '#1076#1077#1085#1100' '#1085#1072' '#1088#1072#1073#1086#1095#1080#1081
    Layout = blGlyphRight
    TabOrder = 4
    OnClick = BitBtnUpdateHolydayClick
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 768
    Height = 360
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    DynProps = <>
    TabOrder = 5
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'c_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'lang_is_work_day_locally'
        Footers = <>
        Title.Caption = #1056#1072#1073#1086#1095#1080#1081' '#1076#1077#1085#1100
        Width = 82
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'lang_day_of_week'
        Footers = <>
        Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'c_reason_dayoff_locally'
        Footers = <>
        Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1076#1083#1103' '#1074#1099#1093#1086#1076#1085#1086#1075#1086' '#1076#1085#1103
        Width = 280
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'c_log_changes'
        Footers = <>
        Title.Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
        Width = 280
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'lang_is_work_day_server'
        Footers = <>
        Title.Caption = #1056#1072#1073#1086#1095#1080#1081' '#1076#1077#1085#1100' '#1087#1086' '#1096#1072#1073#1083#1086#1085#1091' '#1089#1072#1081#1090#1072
        Width = 300
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'c_reason_dayoff_server'
        Footers = <>
        Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1093#1086#1076#1085#1086#1075#1086' '#1076#1085#1103' '#1085#1072' '#1096#1072#1073#1083#1086#1085#1077' '#1089#1072#1081#1090#1072
        Width = 400
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object UniSQLCalendar: TUniQuery
    DataTypeMap = <
      item
        FieldName = 'is_active'
        FieldType = ftBoolean
      end>
    Connection = DM.UniXBilly
    Transaction = DM.TransactionLocal
    SQL.Strings = (
      'select '
      'calendar_id,'
      'c_date,'
      'c_day_of_month,'
      'c.c_is_work_day_locally,'
      
        '(select lang_name from set_yes_or_no t where t.id = c.c_is_work_' +
        'day_locally) lang_is_work_day_locally, '
      'c.c_is_work_day_server,'
      
        '(select lang_name from set_yes_or_no t where t.id = c.c_is_work_' +
        'day_server) lang_is_work_day_server, '
      'c_month,'
      'c_year,'
      'c_quater,'
      'c_day_of_week,'
      '(select lang_day_name from set_days_of_week w'
      'where c.c_day_of_week = w.day_id) lang_day_of_week, '
      'c_reason_dayoff_locally,'
      'c_reason_dayoff_server,'
      'c_log_changes,'
      'c_week_of_year,'
      'c_day_of_year'
      'from calendar c'
      
        'where (c_is_work_day_locally = :p_is_work_day or :p_is_work_day ' +
        'is NULL)'
      'and c_date>=:p_date'
      'order by c_date ')
    Active = True
    AutoCalcFields = False
    Left = 176
    Top = 408
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'p_is_work_day'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'p_date'
        Value = 43831d
      end>
    object UniSQLCalendarcalendar_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'calendar_id'
    end
    object UniSQLCalendarlang_is_work_day_locally: TStringField
      FieldName = 'lang_is_work_day_locally'
      ReadOnly = True
      Size = 50
    end
    object UniSQLCalendarc_date: TDateTimeField
      FieldName = 'c_date'
      Required = True
    end
    object UniSQLCalendarlang_day_of_week: TStringField
      FieldName = 'lang_day_of_week'
      ReadOnly = True
      Size = 255
    end
    object UniSQLCalendarc_day_of_week: TSmallintField
      FieldName = 'c_day_of_week'
      Required = True
    end
    object UniSQLCalendarc_day_of_month: TSmallintField
      FieldName = 'c_day_of_month'
      Required = True
    end
    object UniSQLCalendarlang_is_work_day_server: TStringField
      FieldName = 'lang_is_work_day_server'
      ReadOnly = True
      Size = 50
    end
    object UniSQLCalendarc_month: TSmallintField
      FieldName = 'c_month'
      Required = True
    end
    object UniSQLCalendarc_year: TSmallintField
      FieldName = 'c_year'
      Required = True
    end
    object UniSQLCalendarc_quater: TSmallintField
      FieldName = 'c_quater'
      Required = True
    end
    object UniSQLCalendarc_week_of_year: TSmallintField
      FieldName = 'c_week_of_year'
    end
    object UniSQLCalendarc_day_of_year: TSmallintField
      FieldName = 'c_day_of_year'
    end
    object UniSQLCalendarc_reason_dayoff_locally: TStringField
      FieldName = 'c_reason_dayoff_locally'
      Size = 100
    end
    object UniSQLCalendarc_reason_dayoff_server: TStringField
      FieldName = 'c_reason_dayoff_server'
      Size = 100
    end
    object UniSQLCalendarc_is_work_day_locally: TSmallintField
      FieldName = 'c_is_work_day_locally'
      Required = True
    end
    object UniSQLCalendarc_is_work_day_server: TSmallintField
      FieldName = 'c_is_work_day_server'
      Required = True
    end
    object UniSQLCalendarc_log_changes: TStringField
      FieldName = 'c_log_changes'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = UniSQLCalendar
    Left = 184
    Top = 480
  end
end
