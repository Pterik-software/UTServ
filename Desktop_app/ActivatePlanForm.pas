unit ActivatePlanForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormActivatePlan = class(TForm)
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
    UniSQLInactivePlansupdated_by: TStringField;
    UniSQLInactivePlansupdated_datetime: TDateTimeField;
    UniSQLInactivePlanslog_changes: TStringField;
    DBGridEh1: TDBGridEh;
    UniSQLInactivePlansreason_change: TStringField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    procedure SetFormValues(const business_id:string);
  end;

var
  FormActivatePlan: TFormActivatePlan;

implementation

{$R *.dfm}
uses System.UITypes, DateUtils, DataModule;

procedure TFormActivatePlan.BitBtnSaveClick(Sender: TObject);
begin
if (UniSQLInactivePlans['is_active_server']=0) then
  begin
  MessageDlg('???? ????? ??????? ??? ?????????? ??? ????? ???????? ?? ???????. ????????? ? ??????? ??????', mtError, [mbOk],0);
  exit;
  end;
if length(EditChangeReason.Text)<10 then
  begin
  MessageDlg('??????? ??????? ?????????, ?? ????? 10 ????????', mtError, [mbOk],0);
  exit;
  end;
UniSQLUpdateInactivePlan.Prepare;
UniSQLUpdateInactivePlan.ParamByName('p_business_id').Value:= UniSQLInactivePlans['business_id'];
UniSQLUpdateInactivePlan.ParamByName('p_reason').Value:= EditChangeReason.Text;
UniSQLUpdateInactivePlan.ParamByName('p_log').Value:= '???????? ????????????? '+DM.CurrentUser+':'+DateTimeToStr(Now()) ;
UniSQLUpdateInactivePlan.ParamByName('p_updated_by').Value:= DM.CurrentUser;
UniSQLUpdateInactivePlan.ParamByName('p_updated_datetime').Value:= Now();
UniSQLUpdateInactivePlan.Execute;
MessageDlg('?????????', mtInformation, [mbOk],0);
Close;
end;

procedure TFormActivatePlan.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
inherited;
  if UniSQLInactivePlans['is_active_server']=0 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clMoneyGreen
  else
    if UniSQLInactivePlans['is_active_locally']=0 then
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

procedure TFormActivatePlan.SetFormValues(const Business_id:string);
begin
EditChangereason.Text:='';
if not UniSQLInactivePlans.Active then UniSQLInactivePlans.Active:=true;
UniSQLInactivePlans.First;
while not UniSQLInactivePlans.EOF do
  begin
  if UniSQLInactivePlans['business_id']=Business_id then exit;
  UniSQLInactivePlans.next;
  end;
end;

procedure TFormActivatePlan.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
