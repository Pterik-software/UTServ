unit UserUpdateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormUpdateUser = class(TForm)
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    EditUserID: TEdit;
    EditFullName: TEdit;
    EditLogin: TEdit;
    EditPassword: TEdit;
    Label5: TLabel;
    QueryCurrUser: TUniQuery;
    CheckBoxWorking: TCheckBox;
    DTHired: TDateTimePicker;
    DTDismissed: TDateTimePicker;
    LabelHired: TLabel;
    LabelDismissed: TLabel;
    BitBtnPassword: TBitBtn;
    UniQueryRoles: TUniQuery;
    ComboBoxRoles: TComboBox;
    UniQueryRolesrole_id: TStringField;
    UniUpdateSQLUser: TUniSQL;
    QueryCurrUseruser_id: TLargeintField;
    QueryCurrUserfull_name: TStringField;
    QueryCurrUserlogin: TStringField;
    QueryCurrUserpassword: TStringField;
    QueryCurrUserrole_id: TStringField;
    QueryCurrUseris_active: TSmallintField;
    QueryCurrUserhiring_date: TDateField;
    QueryCurrUserclosure_date: TDateField;
    UniQueryRoleslang_role_name: TStringField;
    QueryCurrUserlang_role_name: TStringField;
    UniLoginsCntr: TUniQuery;
    UniLoginsCntrcntr: TLargeintField;
    UniLoginsCntrcntr_active: TFloatField;
    LabelChangePWD: TLabel;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnPasswordClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure EditFullNameChange(Sender: TObject);
    procedure EditLoginChange(Sender: TObject);
    procedure EditPasswordChange(Sender: TObject);
    procedure DTHiredChange(Sender: TObject);
    procedure DTDismissedChange(Sender: TObject);
    procedure CheckBoxWorkingClick(Sender: TObject);
    procedure ComboBoxRolesKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxRolesMouseEnter(Sender: TObject);
    procedure EditLoginExit(Sender: TObject);
  private
    FormChanged:boolean;
    FormCanBeClosed:boolean;
    UserID:integer;
  public
    procedure SetFormValues(LUserID:integer);
  end;

var
  FormUpdateUser: TFormUpdateUser;

implementation

{$R *.dfm}

uses DataModule, System.UITypes;

procedure TFormUpdateUser.BitBtnCancelClick(Sender: TObject);
begin
FormCanBeClosed:=true;
Close;
end;

procedure TFormUpdateUser.BitBtnPasswordClick(Sender: TObject);
begin
EditPassword.Enabled:=true;
EditPassword.ReadOnly:=false;
EditPassword.PasswordChar:=#0;
LabelChangePWD.Visible:=true;
//ShowMessage('Введите новый пароль и нажмите "Сохранить"');
end;

procedure TFormUpdateUser.BitBtnSaveClick(Sender: TObject);
var CanSave:boolean;
begin
EditLogin.Text:=Uppercase(Trim(EditLogin.Text));
try
CanSave:=true;
UniLoginsCntr.Close;
UniLoginsCntr.ParamByName('p_login').Value:= EditLogin.Text;
UniLoginsCntr.ParamByName('p_user_id').Value:= UserID;
UniLoginsCntr.Execute;
if UniLoginsCntr['cntr']>=1 then
  begin
    if UniLoginsCntr['cntr_active']>0
      then MessageDlg('Уже существует работающий пользователь с таким же логином. Рекомендуем указать email в качестве логина',mtError, [mbOk],0)
      else MessageDlg('Существует неактивный пользователь с таким же логином, выберите другой логин.',mtError, [mbOk],0);
    CanSave:=false;
  end;
if not FormChanged then
  begin
    CanSave:=false;
    ShowMessage('Данные не изменялись, сохранение отменено');
  end;

if CanSave then
  begin
  UniUpdateSQLUser.Prepare;
  UniUpdateSQLUser.ParamByName('p_user_id').Value:= UserID;
  UniUpdateSQLUser.ParambyName('p_full_name').Value:= EditFullName.Text;
  UniUpdateSQLUser.ParamByName('p_login').Value:= EditLogin.Text;
  UniUpdateSQLUser.ParamByName('p_password').Value:= EditPassword.Text;
  UniUpdateSQLUser.ParamByName('p_lang_role_name').Value:= ComboboxRoles.Text;
  UniUpdateSQLUser.ParamByName('p_hiring_date').Value:= DTHired.Date;
  if QueryCurrUser['is_active']
    then UniUpdateSQLUser.ParamByName('p_closure_date').Value:= NULL
    else UniUpdateSQLUser.ParamByName('p_closure_date').Value:= DTDismissed.Date;
  UniUpdateSQLUser.Execute;
  end;

except on E:Exception do
  begin
  FormCanBeClosed:=false;
  ShowMessage('Error:'+E.Message);
  end;
end;
end;

procedure TFormUpdateUser.CheckBoxWorkingClick(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.ComboBoxRolesKeyPress(Sender: TObject; var Key: Char);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.ComboBoxRolesMouseEnter(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.DTDismissedChange(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.DTHiredChange(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.EditFullNameChange(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.EditLoginChange(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.EditLoginExit(Sender: TObject);
begin
EditLogin.Text:=Uppercase(Trim(EditLogin.Text));
end;

procedure TFormUpdateUser.EditPasswordChange(Sender: TObject);
begin
FormChanged:=true;
end;

procedure TFormUpdateUser.SetFormValues(LUserID:integer);
var ComboRolesIndex:integer;
begin
UserID:=LUserID;
FormCanBeClosed:=true;
ComboRolesIndex:=0;
NullStrictConvert := false;
QueryCurrUser.Close;
QueryCurrUser.ParamByName('p_user_id').Value := LUserID;
QueryCurrUser.Open;
EditUserID.Text:=QueryCurrUser['user_id'];
EditFullName.Text:=QueryCurrUser['full_name'];
EditLogin.Text:=QueryCurrUser['login'];
EditPassword.Text:=QueryCurrUser['password'];
LabelChangePWD.Visible:=false;
if VarIsNull(QueryCurrUser['hiring_date'])
  then begin DTHired.Visible:=false; LabelHired.Visible:=false; end
  else begin DTHired.Visible:=true; LabelHired.Visible:=true; DTHired.DateTime:=QueryCurrUser['hiring_date'];  end;

if VarIsNull(QueryCurrUser['closure_date'])
  then begin DTDismissed.Visible:=false; LabelDismissed.Visible:=false; end
  else begin DTDismissed.Visible:=true; LabelDismissed.Visible:=true; DTDismissed.DateTime:=QueryCurrUser['closure_date']; end;

ComboboxRoles.Clear;
UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['lang_role_name']);
    if UniQueryRoles['lang_role_name'] = QueryCurrUser['lang_role_name']  then ComboRolesIndex:=ComboBoxRoles.Items.Count-1;
    UniQueryRoles.Next;
  end;
ComboBoxRoles.Text:=QueryCurrUser['lang_role_name'];
ComboBoxRoles.ItemIndex:=ComboRolesIndex;
EditPassword.Enabled:=false;
EditPassword.ReadOnly:=true;
EditPassword.PasswordChar:='*';
if QueryCurrUser['is_active'] then CheckBoxWorking.Checked:=true else CheckBoxWorking.Checked:=false;
FormChanged:=false;
end;

end.
