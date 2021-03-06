unit ObjectForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls;

type
  TFormObjects = class(TForm)
    UniObjects: TUniQuery;
    UniDataSource1: TDataSource;
    BitBtnClose: TBitBtn;
    BitBtnNew: TBitBtn;
    BitBtnDismiss: TBitBtn;
    DBGridEh1: TDBGridEh;
    UniObjectsbusiness_id: TStringField;
    UniObjectsitem_name: TStringField;
    UniObjectslang_item_name: TStringField;
    UniObjectsis_active_locally: TBooleanField;
    UniObjectsis_active_server: TBooleanField;
    UniObjectsupdated_by: TStringField;
    UniObjectsupdated_datetime: TDateTimeField;
    UniObjectslog_changes: TStringField;
    UniObjectslng_active_locally: TStringField;
    UniObjectslng_active_server: TStringField;
    UniObjectsreason_change: TStringField;
    RadioGroupObjects: TRadioGroup;
    Label1: TLabel;
    DBGridEh2: TDBGridEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtnNewClick(Sender: TObject);
    procedure RadioGroupObjectsClick(Sender: TObject);
  private
    procedure SetObjectsQuery(const active_locally, active_server:integer);
  public
    procedure SetFormValues;
  end;

var
  FormObjects: TFormObjects;

implementation

{$R *.dfm}

uses System.UITypes, DataModule;

procedure TFormObjects.BitBtnNewClick(Sender: TObject);
begin
//.if FormActivatePlan=nil then Application.CreateForm(TFormActivatePlan, FormActivatePlan);
//if (UniSQLPlans['is_active_server']=0) then
//  begin
//  MessageDlg('???? ????? ??????? ??? ?????????? ??? ????? ???????? ?? ???????. ????????? ? ??????? ??????', mtError, [mbOk],0);
//  exit;
//  end;
//
//FormActivatePlan.SetFormValues(UniSQLPlans['business_id']);
//FormActivatePlan.ShowModal;
//UniSQLPlans.Refresh;
//DBGridEh1.Refresh;
end;

procedure TFormObjects.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
//inherited;
//  if UniSQLPlans['is_active_server']=0 then
//    TDBGridEh(Sender).Canvas.Brush.Color:= clMoneyGreen
//  else
//    if UniSQLPlans['is_active_locally']=0 then
//      TDBGridEh(Sender).Canvas.Brush.Color:= clYellow
//    else TDBGridEh(Sender).Canvas.Brush.Color:= clWhite;
//  // ??????????????? ????????? ??????? ??????? ???????
//  if gdSelected in State then
//  begin
//    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
//    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
//  end;
//  // ?????? GRID ?????????????? ??????
//  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormObjects.RadioGroupObjectsClick(Sender: TObject);
//var active_locally, active_server:integer;
begin
//Label1.Caption:=IntToStr(RadioGroupDays.ItemIndex);
//active_locally := -1; active_server := -1;
//// active_locally = 1 true
//// active_locally = 0 false
//// active_locally = -1 null
//// active_server = 1 true
//// active_server = 0 false
//// active_server = -1 null
//
//case RadioGroupDays.ItemIndex of
//  0: begin active_locally := -1; active_server := -1; end;
//  1: begin active_locally := 1;  active_server := -1; end;
//  2: begin active_locally := 0;  active_server := -1; end;
//  3: begin active_locally := -1; active_server := 1;  end;
//  4: begin active_locally := -1; active_server := 0;  end;
//end;
//SetPlansQuery(active_locally, active_server);
end;

procedure TFormObjects.SetFormValues;
begin
//SetPlansQuery(-1, -1);
//if not UniSQLPlans.Active then UniSQLPlans.Active:=true;
end;

procedure TFormObjects.SetObjectsQuery(const active_locally,
  active_server: integer);
begin
//UniSQLPlans.Active:=false;
//if  active_locally=-1
//  then UniSQLPlans.ParamByName('p_active_locally').Value:=NULL
//  else UniSQLPlans.ParamByName('p_active_locally').Value:=active_locally;
//
//UniSQLPlans.ParamByName('p_active_server').Value:=active_server;
//UniSQLPlans.Active:=true;
end;

end.
