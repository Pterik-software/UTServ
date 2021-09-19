unit UpdateHolydayForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFormUpdateHolydays = class(TForm)
    BitBtnClose: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtnSave: TBitBtn;
    UniQueryHolydays: TUniQuery;
    UniDataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EditChangeReason: TEdit;
    UniQueryHolydayscalendar_id: TLargeintField;
    UniQueryHolydaysc_date: TDateTimeField;
    UniQueryHolydaysc_day_of_month: TSmallintField;
    UniQueryHolydaysc_month: TSmallintField;
    UniQueryHolydaysc_year: TSmallintField;
    UniQueryHolydaysc_quater: TSmallintField;
    UniQueryHolydaysc_day_of_week: TSmallintField;
    UniQueryHolydayslang_day_of_week: TStringField;
    UniQueryHolydaysc_week_of_year: TSmallintField;
    UniQueryHolydaysc_day_of_year: TSmallintField;
    UniQueryHolydayslang_is_work_day_locally: TStringField;
    UniQueryHolydayslang_is_work_day_server: TStringField;
    UniQueryHolydaysc_is_work_day_locally: TSmallintField;
    UniQueryHolydaysc_is_work_day_server: TSmallintField;
    UniQueryHolydaysc_reason_dayoff_locally: TStringField;
    UniQueryHolydaysc_reason_dayoff_server: TStringField;
    UniSQLUpdateHolyday: TUniSQL;
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
  FormUpdateHolydays: TFormUpdateHolydays;

implementation

{$R *.dfm}
uses System.UITypes, DateUtils, DataModule;

procedure TFormUpdateHolydays.BitBtnSaveClick(Sender: TObject);
begin
if (UniQueryHolydays['c_is_work_day_locally']=1) then
  begin
  MessageDlg('Этот день уже отмечен как рабочий в локальной базе', mtError, [mbOk],0);
  exit;
  end;
if length(EditChangeReason.Text)<10 then
  begin
  MessageDlg('Введите причину изменения, не менее 10 символов', mtError, [mbOk],0);
  exit;
  end;
UniSQLUpdateHolyday.Prepare;
UniSQLUpdateHolyday.ParamByName('p_calendar_id').Value:= UniQueryHolydays['calendar_id'];
UniSQLUpdateHolyday.ParamByName('p_reason').Value:= EditChangeReason.Text;
UniSQLUpdateHolyday.ParamByName('p_log').Value:= 'Изменено пользователем '+DM.CurrentUser+':'+DateTimeToStr(Now()) ;
UniSQLUpdateHolyday.Execute;
MessageDlg('Сохранено', mtInformation, [mbOk],0);
Close;
end;

procedure TFormUpdateHolydays.FormCreate(Sender: TObject);
begin
if not UniQueryHolydays.Active then UniQueryHolydays.Active:=true;
end;

procedure TFormUpdateHolydays.SetCaledarQuery(CDate: TDate);
begin
UniQueryHolydays.Active:=false;
UniQueryHolydays.ParamByName('p_date_from').Value:=CDate-DayOf(CDate)+1;
UniQueryHolydays.ParamByName('p_date_to').Value:=CDate-DayOf(CDate)+32;
UniQueryHolydays.Active:=true;
end;

procedure TFormUpdateHolydays.SetFormValues(CurDate:TDate);
begin
EditChangereason.Text:='';
SetCaledarQuery(CurDate);
end;

procedure TFormUpdateHolydays.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
