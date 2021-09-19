unit UsersForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormUsers = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDismiss: TBitBtn;
    UniSQLUsers: TUniQuery;
    UniDataSource1: TDataSource;
    UniSQLUsersfull_name: TStringField;
    UniSQLUserspassword: TStringField;
    UniSQLUsersis_active: TBooleanField;
    UniSQLUsershiring_date: TDateField;
    UniSQLUsersclosure_date: TDateField;
    UniSQLUsersis_working: TStringField;
    UniSQLUsersuser_id: TLargeintField;
    UniSQLUserslang_is_active: TStringField;
    UniSQLUserslogin: TStringField;
    UniSQLUserslang_role_name: TStringField;
    UniSQLUsersorderby: TIntegerField;
    DBGridEh1: TDBGridEh;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNewClick(Sender: TObject);
    procedure BitBtnDismissClick(Sender: TObject);
    procedure UniDataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    procedure ChangeDismissCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsers: TFormUsers;

implementation

{$R *.dfm}

uses UserUpdateForm, UserNewForm, UserDismissForm;

procedure TFormUsers.BitBtnDismissClick(Sender: TObject);
begin
if FormDismissUser=nil then Application.CreateForm(TFormDismissUser, FormDismissUser);
if (UniSQLUsers['is_active'])
  then FormDismissUser.SetFormValues(UniSQLUsers['user_id'], true);
if (not UniSQLUsers['is_active'])
  then FormDismissUser.SetFormValues(UniSQLUsers['user_id'], false);
FormDismissUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.BitBtnEditClick(Sender: TObject);
begin
if not UniSQLUsers['is_active'] then
  begin
    ShowMessage('Сотрудник уволен, отмените увольнение и сделайте исправление');
    exit;
  end;

if FormUpdateUser = nil then Application.CreateForm(TFormUpdateUser, FormUpdateUser);
FormUpdateUser.SetFormValues(UniSQLUsers['user_id']);
FormUpdateUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.BitBtnNewClick(Sender: TObject);
begin
if FormNewUser=nil then Application.CreateForm(TFormNewUser, FormNewUser);
FormNewUser.SetFormValues;
FormNewUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.ChangeDismissCaption;
begin
if UniSQLUsers['is_active']
  then BitBtnDismiss.Caption:='Увольнение'
  else BitBtnDismiss.Caption:='Отмена увольнения';
end;

procedure TFormUsers.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 inherited;
  if UniSQLUsers['is_active']=0 then
    TDBGridEh(Sender).Canvas.Brush.Color:= clYellow
  else
    TDBGridEh(Sender).Canvas.Brush.Color:= clWhite;
  // Восстанавливаем выделение текущей позиции курсора
  if gdSelected in State then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGridEh(Sender).Canvas.Font.Color:= clHighLightText;
  end;
  // Просим GRID перерисоваться самому
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
end;

procedure TFormUsers.FormCreate(Sender: TObject);
begin
if not UniSQLUsers.Active then UniSQLUsers.Active:=true;
end;

procedure TFormUsers.UniDataSource1DataChange(Sender: TObject; Field: TField);
begin
ChangeDismissCaption;
end;

procedure TFormUsers.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
