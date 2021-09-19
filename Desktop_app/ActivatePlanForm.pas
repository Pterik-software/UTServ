unit ActivatePlanForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormUpdateWorkdays = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnSave: TBitBtn;
    UniDataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EditChangeReason: TEdit;
    UniSQLUpdateInactivePlan: TUniSQL;
    UniSQLInactivePlans: TUniQuery;
    UniSQLInactivePlansbusiness_id: TStringField;
    UniSQLInactivePlansitem_name: TStringField;
    UniSQLInactivePlanslang_item_name: TStringField;
    UniSQLInactivePlansis_active_locally: TBooleanField;
    UniSQLInactivePlanslng_active_locally: TStringField;
    UniSQLInactivePlansis_active_server: TBooleanField;
    UniSQLInactivePlanslng_active_server: TStringField;
    UniSQLInactivePlansreason_deactivated: TStringField;
    UniSQLInactivePlansupdated_by: TStringField;
    UniSQLInactivePlansupdated_datetime: TDateTimeField;
    UniSQLInactivePlanslog_changes: TStringField;
    DBGridEh1: TDBGridEh;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFormValues;
  end;

var
  FormUpdateWorkdays: TFormUpdateWorkdays;

implementation

{$R *.dfm}
uses System.UITypes, DateUtils, DataModule;

procedure TFormUpdateWorkdays.BitBtnSaveClick(Sender: TObject);
begin
if (UniSQLUpdateInactivePlan['c_is_active_server']=0) then
  begin
  MessageDlg('���� ���� ������� ��� ���������� ��� ������ ��������� ����� �� �������. ��������� � ������� ������', mtError, [mbOk],0);
  exit;
  end;
if length(EditChangeReason.Text)<10 then
  begin
  MessageDlg('������� ������� ���������, �� ����� 10 ��������', mtError, [mbOk],0);
  exit;
  end;
UniSQLUpdateInactivePlan.Prepare;
UniSQLUpdateInactivePlan.ParamByName('p_business_id').Value:= UniSQLInactivePlans['business_id'];
UniSQLUpdateInactivePlan.ParamByName('p_reason').Value:= EditChangeReason.Text;
UniSQLUpdateInactivePlan.ParamByName('p_log').Value:= '�������� ������������� '+DM.CurrentUser+':'+DateTimeToStr(Now()) ;
UniSQLUpdateInactivePlan.ParamByName('p_p_updated_by').Value:= DM.CurrentUser;
UniSQLUpdateInactivePlan.ParamByName('p_updated_datetime').Value:= DateTimeToStr(Now());
UniSQLUpdateInactivePlan.Execute;
MessageDlg('���������', mtInformation, [mbOk],0);
Close;
end;

procedure TFormUpdateWorkdays.SetFormValues;
begin
EditChangereason.Text:='';
if not UniSQLInactivePlans.Active then UniSQLInactivePlans.Active:=true;
end;

procedure TFormUpdateWorkdays.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
