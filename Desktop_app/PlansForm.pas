unit PlansForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormPlans = class(TForm)
    UniSQLPlans: TUniQuery;
    UniDataSource1: TDataSource;
    BitBtnClose: TBitBtn;
    BitBtnNew: TBitBtn;
    BitBtnDismiss: TBitBtn;
    DBGridEh1: TDBGridEh;
    UniSQLPlansbusiness_id: TStringField;
    UniSQLPlansitem_name: TStringField;
    UniSQLPlanslang_item_name: TStringField;
    UniSQLPlansis_active_locally: TBooleanField;
    UniSQLPlansis_active_server: TBooleanField;
    UniSQLPlansreason_deactivated: TStringField;
    UniSQLPlansupdated_by: TStringField;
    UniSQLPlansupdated_datetime: TDateTimeField;
    UniSQLPlanslog_changes: TStringField;
    UniSQLPlanslng_active_locally: TStringField;
    UniSQLPlanslng_active_server: TStringField;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtnNewClick(Sender: TObject);
    procedure BitBtnDismissClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFormValues;
  end;

var
  FormPlans: TFormPlans;

implementation

{$R *.dfm}

procedure TFormPlans.BitBtnDismissClick(Sender: TObject);
begin
if FormDeactivatePlan=nil then Application.CreateForm(TFormDeactivatePlan, FormDeactivatePlan);
FormDeactivatePlan.SetFormValues(UniSQLPlans['business_id']);
FormDeactivatePlan.ShowModal;
DBGridEh1.Refresh;

end;

procedure TFormPlans.BitBtnNewClick(Sender: TObject);
begin
if FormActivatePlan=nil then Application.CreateForm(TFormActivatePlan, FormActivatePlan);
FormActivatePlan.SetFormValues(UniSQLPlans['business_id']);
FormActivatePlan.ShowModal;
DBGridEh1.Refresh;
end;

procedure TFormPlans.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
inherited;
  if UniSQLPlans['is_active_locally']=0 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clYellow
  else
    if UniSQLPlans['is_active_server']=0 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clFuchsia
      else TDBGridEh(Sender).Canvas.Brush.Color:= clWhite;
  // ��������������� ��������� ������� ������� �������
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // ������ GRID �������������� ������
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormPlans.SetFormValues;
begin
if not UniSQLPlans.Active then UniSQLPlans.Active:=true;
end;

end.
