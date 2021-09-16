unit CalendarForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormCalendar = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnEdit: TBitBtn;
    UniSQLCalendar: TUniQuery;
    UniSQLCalendarcalendar_id: TLargeintField;
    UniSQLCalendarc_date: TDateTimeField;
    UniSQLCalendarc_day_of_week: TSmallintField;
    MonthCalendar: TMonthCalendar;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    UniSQLCalendarlang_day_of_week: TStringField;
    RadioGroupDays: TRadioGroup;
    BitBtn1: TBitBtn;
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
    procedure BitBtnCloseClick(Sender: TObject);
    procedure RadioGroupDaysClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MonthCalendarClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
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

uses DateUtils, UpdateWorkDayForm;

procedure TFormCalendar.BitBtnEditClick(Sender: TObject);
begin
if FormUpdate1Calendar=nil then Application.CreateForm(TFormUpdate1Calendar, FormUpdate1Calendar);
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

procedure TFormCalendar.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
