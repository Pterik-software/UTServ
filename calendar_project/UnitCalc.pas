unit UnitCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Data.DB, MemDS, DBAccess, Uni, UniProvider, MySQLUniProvider, Vcl.Mask;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    MemoInserts: TMemo;
    MC: TMonthCalendar;
    BitBtn2: TBitBtn;
    UniConnection1: TUniConnection;
    UniQueryDates: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    UniQueryDelete: TUniQuery;
    BitBtnDelCalendar: TBitBtn;
    MaskEditYear: TMaskEdit;
    UniQueryCheckYears: TUniQuery;
    UniQueryCheckYearscntr: TLargeintField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtnDelCalendarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  LoopedDate, CurDay: TDate;
  wYear, wMonth, wDay: word;
  i, DivShift: integer;
  sDayMonth, sHoliday:string;
  NextMondayIsHoliday:boolean;
begin
  MemoInserts.Clear;
  UniQueryCheckYears.Close;
  UniQueryCheckYears.ParamByName('p_year').Value:=MaskEditYear.Text;
  UniQueryCheckYears.ExecSQL;
  if UniQueryCheckYears['cntr']>=365 then
    begin
      ShowMessage('Такой год уже заполнен, вставка невозможна');
      exit;
    end;
  NextMondayIsHoliday:=false;
  sHoliday:='';
  sDayMonth:='';
  LoopedDate := StrToDate('01.01.'+MaskEditYear.Text);
  DivShift:=DayOfTheWeek(LoopedDate);
  MC.Date:=LoopedDate;
  DecodeDate(LoopedDate, wYear, wMonth, wDay);
  for i := 0 to DaysInAYear(wYear)-1 do
  begin
    CurDay := LoopedDate + i;
    MemoInserts.Lines.Add(DateToStr(CurDay));
    DecodeDate(CurDay, wYear, wMonth, wDay);
    UniQueryDates.Close;
    UniQueryDates.ParamByName('p_date').Value := CurDay;
    UniQueryDates.ParamByName('p_day_of_month').Value := wDay;
    UniQueryDates.ParamByName('p_day_of_year').Value := i+1;
    UniQueryDates.ParamByName('p_week_of_year').Value := 1+(i+DivShift-1) div 7;
    UniQueryDates.ParamByName('p_reason_day_off').Value:='';
    if (DayOfTheWeek(CurDay) = DaySaturday ) or (DayOfTheWeek(CurDay) = DaySunday ) then
      UniQueryDates.ParamByName('p_work_day').Value := false
    else
      UniQueryDates.ParamByName('p_work_day').Value := true;
    sDayMonth:=IntToStr(wDay)+'.'+IntToStr(wMonth);
    MemoInserts.Lines.Add(sDayMonth);
    if (sDayMonth='1.1') or (sDayMonth='7.1') or (sDayMonth='8.3')or (sDayMonth='1.5')
    or (sDayMonth='9.5') or (sDayMonth='28.06') or (sDayMonth='24.08') or (sDayMonth='14.10') or (sDayMonth='25.12')
    then
      begin
      sHoliday:=SDayMonth+'.'+IntToStr(wYear);
      if (DayOfTheWeek(CurDay) = DaySaturday ) then sHoliday:=SHoliday+' суббота';
      if (DayOfTheWeek(CurDay) = DaySunday )   then sHoliday:=SHoliday+' воскресенье';
      UniQueryDates.ParamByName('p_work_day').Value := false;
      UniQueryDates.ParamByName('p_reason_day_off').Value := 'Официальный праздничный день '+sHoliday;
      if (DayOfTheWeek(CurDay) = DaySaturday ) or (DayOfTheWeek(CurDay) = DaySunday ) then NextMondayIsHoliday:=true;
      end;
    if (DayOfTheWeek(CurDay) = DayMonday) and NextMondayIsHoliday then
      begin
        NextMondayIsHoliday:=false;
        UniQueryDates.ParamByName('p_work_day').Value := false;
        UniQueryDates.ParamByName('p_reason_day_off').Value := 'Понедельник за праздничным днём '+sHoliday;
      end;
    UniQueryDates.ParamByName('p_month').Value := wMonth;
    UniQueryDates.ParamByName('p_year').Value := wYear;
    case wMonth of
      1, 2, 3:
        UniQueryDates.ParamByName('p_quater').Value := 1;
      4, 5, 6:
        UniQueryDates.ParamByName('p_quater').Value := 2;
      7, 8, 9:
        UniQueryDates.ParamByName('p_quater').Value := 3;
      10, 11, 12:
        UniQueryDates.ParamByName('p_quater').Value := 4;
    end;
    UniQueryDates.ParamByName('p_day_of_week').Value := DayOfTheWeek(CurDay);
    UniQueryDates.ExecSQL;
  end;
end;

procedure TForm1.BitBtnDelCalendarClick(Sender: TObject);
begin
UniQueryDelete.ExecSQL;
end;

end.
