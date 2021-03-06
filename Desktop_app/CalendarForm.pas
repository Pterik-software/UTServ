unit CalendarForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormCalendar = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnUpdateWorkday: TBitBtn;
    UniSQLCalendar: TUniQuery;
    UniSQLCalendarcalendar_id: TLargeintField;
    UniSQLCalendarc_date: TDateTimeField;
    UniSQLCalendarc_day_of_week: TSmallintField;
    MonthCalendar: TMonthCalendar;
    DataSource1: TDataSource;
    UniSQLCalendarlang_day_of_week: TStringField;
    RadioGroupDays: TRadioGroup;
    BitBtnUpdateHolyday: TBitBtn;
    Label1: TLabel;
    UniSQLCalendarc_day_of_month: TSmallintField;
    UniSQLCalendarlang_is_work_day_locally: TStringField;
    UniSQLCalendarlang_is_work_day_server: TStringField;
    UniSQLCalendarc_month: TSmallintField;
    UniSQLCalendarc_year: TSmallintField;
    UniSQLCalendarc_quater: TSmallintField;
    UniSQLCalendarc_week_of_year: TSmallintField;
    UniSQLCalendarc_day_of_year: TSmallintField;
    UniSQLCalendarc_reason_dayoff_locally: TStringField;
    UniSQLCalendarc_reason_dayoff_server: TStringField;
    UniSQLCalendarc_is_work_day_locally: TSmallintField;
    UniSQLCalendarc_is_work_day_server: TSmallintField;
    UniSQLCalendarc_log_changes: TStringField;
    DBGridEh1: TDBGridEh;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure RadioGroupDaysClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MonthCalendarClick(Sender: TObject);
    procedure BitBtnUpdateWorkdayClick(Sender: TObject);
    procedure BitBtnUpdateHolydayClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
  procedure SetFormValues;
  procedure SetCalendarQuery(const CDate:TDate);
  end;

var
  FormCalendar: TFormCalendar;

implementation

{$R *.dfm}

uses DateUtils, UpdateWorkDayForm, UpdateHolyDayForm;

procedure TFormCalendar.BitBtnUpdateWorkdayClick(Sender: TObject);
begin
if FormUpdateWorkdays=nil then Application.CreateForm(TFormUpdateWorkdays, FormUpdateWorkdays);
FormUpdateWorkdays.SetFormValues(MonthCalendar.Date);
FormUpdateWorkdays.ShowModal;
SetCalendarQuery(MonthCalendar.Date);
DBGridEh1.Refresh;
end;

procedure TFormCalendar.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 inherited;
  if UniSQLCalendar['c_is_work_day_locally']=1 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clWhite
  else
    TDBGridEh(Sender).Canvas.Brush.Color:= clYellow;
  // ??????????????? ????????? ??????? ??????? ???????
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // ?????? GRID ?????????????? ??????
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
UniSQLCalendar.Active:=false;
end;

procedure TFormCalendar.MonthCalendarClick(Sender: TObject);
begin
SetCalendarQuery(MonthCalendar.Date);
end;

procedure TFormCalendar.RadioGroupDaysClick(Sender: TObject);
begin
SetCalendarQuery(MonthCalendar.Date);
end;

procedure TFormCalendar.SetCalendarQuery(const CDate:TDate);
begin
UniSQLCalendar.Active:=false;
case RadioGroupDays.ItemIndex of
0: UniSQLCalendar.ParamByName('p_is_work_day').Value:=NULL;
1: UniSQLCalendar.ParamByName('p_is_work_day').Value:=1;
2:UniSQLCalendar.ParamByName('p_is_work_day').Value:=0;
end;
UniSQLCalendar.ParamByName('p_date').Value:=CDate-DayOf(CDate)+1;
UniSQLCalendar.Active:=true;
end;

procedure TFormCalendar.SetFormValues;
begin
MonthCalendar.Date:=Now();
SetCalendarQuery(Now());
end;

procedure TFormCalendar.BitBtnUpdateHolydayClick(Sender: TObject);
begin
if FormUpdateHolydays=nil then Application.CreateForm(TFormUpdateHolydays, FormUpdateHolydays);
FormUpdateHolydays.SetFormValues(MonthCalendar.Date);
FormUpdateHolydays.ShowModal;
SetCalendarQuery(MonthCalendar.Date);
DBGridEH1.Refresh;
end;

procedure TFormCalendar.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
