unit DeactivatePlanForm;

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
    UniDataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EditChangeReason: TEdit;
    UniSQLUpdateActivePlan: TUniSQL;
    UniSQLActivePlans: TUniQuery;
    UniSQLActivePlansbusiness_id: TStringField;
    UniSQLActivePlansitem_name: TStringField;
    UniSQLActivePlanslang_item_name: TStringField;
    UniSQLActivePlansis_active_locally: TBooleanField;
    UniSQLActivePlanslng_active_locally: TStringField;
    UniSQLActivePlansis_active_server: TBooleanField;
    UniSQLActivePlanslng_active_server: TStringField;
    UniSQLActivePlansreason_deactivated: TStringField;
    UniSQLActivePlansupdated_by: TStringField;
    UniSQLActivePlansupdated_datetime: TDateTimeField;
    UniSQLActivePlanslog_changes: TStringField;
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
