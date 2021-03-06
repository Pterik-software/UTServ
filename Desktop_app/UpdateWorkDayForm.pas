unit UpdateWorkDayForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFormUpdateWorkdays = class(TForm)
    BitBtnClose: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtnSave: TBitBtn;
    UniQueryWorkdays: TUniQuery;
    UniDataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EditChangeReason: TEdit;
    UniQueryWorkdayscalendar_id: TLargeintField;
    UniQueryWorkdaysc_date: TDateTimeField;
    UniQueryWorkdaysc_day_of_month: TSmallintField;
    UniQueryWorkdaysc_month: TSmallintField;
    UniQueryWorkdaysc_year: TSmallintField;
    UniQueryWorkdaysc_quater: TSmallintField;
    UniQueryWorkdaysc_day_of_week: TSmallintField;
    UniQueryWorkdayslang_day_of_week: TStringField;
    UniQueryWorkdaysc_week_of_year: TSmallintField;
    UniQueryWorkdaysc_day_of_year: TSmallintField;
    UniQueryWorkdayslang_is_work_day_locally: TStringField;
    UniQueryWorkdayslang_is_work_day_server: TStringField;
    UniQueryWorkdaysc_is_work_day_locally: TSmallintField;
    UniQueryWorkdaysc_is_work_day_server: TSmallintField;
    UniQueryWorkdaysc_reason_dayoff_locally: TStringField;
    UniQueryWorkdaysc_reason_dayoff_server: TStringField;
    UniSQLUpdateWorkday: TUniSQL;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFormValues(CurDate:TDate);
    procedure SetCaledarQuery(CDate:TDate);
  end;

var
  FormUpdateWorkdays: TFormUpdateWorkdays;

implementation

{$R *.dfm}
uses System.UITypes, DateUtils, DataModule;

procedure TFormUpdateWorkdays.BitBtnSaveClick(Sender: TObject);
begin
if (UniQueryWorkdays['c_is_work_day_locally']=0) then
  begin
  MessageDlg('???? ???? ??? ??????? ??? ???????? ? ????????? ????', mtError, [mbOk],0);
  exit;
  end;
if length(EditChangeReason.Text)<10 then
  begin
  MessageDlg('??????? ??????? ?????????, ?? ????? 10 ????????', mtError, [mbOk],0);
  exit;
  end;
UniSQLUpdateWorkday.Prepare;
UniSQLUpdateWorkday.ParamByName('p_calendar_id').Value:= UniQueryWorkdays['calendar_id'];
UniSQLUpdateWorkday.ParamByName('p_reason').Value:= EditChangeReason.Text;
UniSQLUpdateWorkday.ParamByName('p_log').Value:= '???????? ????????????? '+DM.CurrentUser+':'+DateTimeToStr(Now()) ;
UniSQLUpdateWorkday.Execute;
MessageDlg('?????????', mtInformation, [mbOk],0);
Close;
end;

procedure TFormUpdateWorkdays.FormCreate(Sender: TObject);
begin
if not UniQueryWorkdays.Active then UniQueryWorkdays.Active:=true;
end;

procedure TFormUpdateWorkdays.SetCaledarQuery(CDate: TDate);
begin
UniQueryWorkdays.Active:=false;
//UniQueryWorkdays.ParamByName('p_is_work_day').Value:=1;
UniQueryWorkdays.ParamByName('p_date_from').Value:=CDate-DayOf(CDate)+1;
UniQueryWorkdays.ParamByName('p_date_to').Value:=CDate-DayOf(CDate)+32;
UniQueryWorkdays.Active:=true;
end;

procedure TFormUpdateWorkdays.SetFormValues(CurDate:TDate);
begin
EditChangereason.Text:='';
SetCaledarQuery(CurDate);
end;

procedure TFormUpdateWorkdays.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
