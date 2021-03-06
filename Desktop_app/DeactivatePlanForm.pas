unit DeactivatePlanForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormDeactivatePlan = class(TForm)
    BitBtnClose: TBitBtn;
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
    UniSQLActivePlansupdated_by: TStringField;
    UniSQLActivePlansupdated_datetime: TDateTimeField;
    UniSQLActivePlanslog_changes: TStringField;
    UniSQLActivePlansreason_change: TStringField;
    DBGridEh1: TDBGridEh;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    procedure SetFormValues(const Business_id:string);
  end;

var
  FormDeactivatePlan: TFormDeactivatePlan;

implementation

{$R *.dfm}
uses System.UITypes, DateUtils, DataModule;

procedure TFormDeactivatePlan.BitBtnSaveClick(Sender: TObject);
begin
if length(EditChangeReason.Text)<10 then
  begin
  MessageDlg('??????? ??????? ?????????, ?? ????? 10 ????????', mtError, [mbOk],0);
  exit;
  end;
UniSQLUpdateActivePlan.Prepare;
UniSQLUpdateActivePlan.ParamByName('p_business_id').Value:= UniSQLActivePlans['business_id'];
UniSQLUpdateActivePlan.ParamByName('p_reason').Value:= EditChangeReason.Text;
UniSQLUpdateActivePlan.ParamByName('p_log').Value:= '???????? ????????????? '+DM.CurrentUser+':'+DateTimeToStr(Now()) ;
UniSQLUpdateActivePlan.ParamByName('p_updated_by').Value:= DM.CurrentUser;
UniSQLUpdateActivePlan.ParamByName('p_updated_datetime').Value:= Now();
UniSQLUpdateActivePlan.Execute;
MessageDlg('?????????', mtInformation, [mbOk],0);
Close;
end;

procedure TFormDeactivatePlan.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
inherited;
  if UniSQLActivePlans['is_active_server']=0 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clMoneyGreen
  else
    if UniSQLActivePlans['is_active_locally']=0 then
      TDBGridEh(Sender).Canvas.Brush.Color:= clYellow
     else TDBGridEh(Sender).Canvas.Brush.Color:= clWhite;
  // ??????????????? ????????? ??????? ??????? ???????
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // ?????? GRID ?????????????? ??????
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormDeactivatePlan.SetFormValues(const Business_id:string);
begin
EditChangereason.Text:='';
if not UniSQLActivePlans.Active then UniSQLActivePlans.Active:=true;
UniSQLActivePlans.First;
while not UniSQLActivePlans.EOF do
  begin
  if UniSQLActivePlans['business_id']=Business_id then exit;
  UniSQLActivePlans.next;
  end;

end;

procedure TFormDeactivatePlan.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
