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
  private
    FormChanged:boolean;
    UserID:integer;
  public
    function GetUserID: integer;
    procedure SetUserID(value: integer);
    procedure SetFormValues;
  end;

var
  FormUpdateUser: TFormUpdateUser;

implementation

{$R *.dfm}

uses DMForm;

procedure TFormUpdateUser.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormUpdateUser.BitBtnPasswordClick(Sender: TObject);
begin
EditPassword.Enabled:=true;
EditPassword.ReadOnly:=false;
EditPassword.PasswordChar:=#0;
ShowMessage('������� ����� ������ � ������� "���������"');
end;

procedure TFormUpdateUser.BitBtnSaveClick(Sender: TObject);
begin
if FormChanged=true then
  begin
  UniUpdateSQLUser.Prepare;
  UniUpdateSQLUser.ParamByName('p_user_id').Value:= UserID;
  UniUpdateSQLUser.ParambyName('p_full_name').Value:= EditFullName.Text;
  UniUpdateSQLUser.ParamByName('p_user').Value:= EditLogin.Text;
  UniUpdateSQLUser.ParamByName('p_password').Value:= EditPassword.Text;
  UniUpdateSQLUser.ParamByName('p_role_id').Value:= ComboboxRoles.Text;
  UniUpdateSQLUser.ParamByName('p_hiring_date').Value:= DTHired.Date;
  UniUpdateSQLUser.ParamByName('p_closure_date').Value:= DTDismissed.Date;
  UniUpdateSQLUser.Execute;
  end
  else begin ShowMessage('������ �� ����������, ���������� ��������'); end;
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

procedure TFormUpdateUser.EditPasswordChange(Sender: TObject);
begin
FormChanged:=true;
end;

function TFormUpdateUser.GetUserID: integer;
begin
Result := UserID;
end;

procedure TFormUpdateUser.SetFormValues;
begin
NullStrictConvert := false;
QueryCurrUser.Close;
QueryCurrUser.ParamByName('p_user_id').Value := UserID;
QueryCurrUser.Open;
EditUserID.Text:=QueryCurrUser['user_id'];
EditFullName.Text:=QueryCurrUser['full_name'];
EditLogin.Text:=QueryCurrUser['user'];
EditPassword.Text:=QueryCurrUser['password'];
if VarIsNull(QueryCurrUser['hiring_date'])
  then begin DTHired.Visible:=false; LabelHired.Visible:=false; end
  else begin DTHired.Visible:=true; LabelHired.Visible:=true; DTHired.DateTime:=QueryCurrUser['hiring_date'];  end;

if VarIsNull(QueryCurrUser['closure_date'])
  then begin DTDismissed.Visible:=false; LabelDismissed.Visible:=false; end
  else begin DTDismissed.Visible:=true; LabelDismissed.Visible:=true; DTDismissed.DateTime:=QueryCurrUser['closure_date']; end;

UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['role_id']);
    UniQueryRoles.Next;
  end;
ComboBoxRoles.text:=QueryCurrUser['role_id'];
EditPassword.Enabled:=false;
EditPassword.ReadOnly:=true;
EditPassword.PasswordChar:='*';

if QueryCurrUser['is_active'] then CheckBoxWorking.Checked:=true else CheckBoxWorking.Checked:=false;
FormChanged:=false;
end;

procedure TFormUpdateUser.SetUserID(value: integer);
begin
UserID := Value;
end;

end.
