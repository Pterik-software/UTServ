unit UserNewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TFormNewUser = class(TForm)
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label5: TLabel;
    EditFullName: TEdit;
    Label2: TLabel;
    EditLogin: TEdit;
    Label4: TLabel;
    ComboBoxRoles: TComboBox;
    Label3: TLabel;
    EditPassword: TEdit;
    LabelHired: TLabel;
    DTHired: TDateTimePicker;
    UniQueryRoles: TUniQuery;
    UniQueryRolesrole_id: TStringField;
    UniInsertSQLUser: TUniSQL;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FormCanBeClosed:boolean;
  public
    { Public declarations }
    procedure SetFormValues;
  end;

var
  FormNewUser: TFormNewUser;

implementation

{$R *.dfm}

uses system.UItypes;

procedure TFormNewUser.BitBtnCancelClick(Sender: TObject);
begin
FormCanBeClosed:=true;
Close;
end;

procedure TFormNewUser.BitBtnSaveClick(Sender: TObject);
var CanSave:boolean;
begin
CanSave:=true;
FormCanBeClosed:=true;

if EditFullName.Text='' then
  begin
  MessageDlg('������� ������� ��� �������� (���). ���� �� ����� ���� ������.',mtError, [mbOk],0);
  CanSave:=false;
  FormCanBeClosed:=false;
  exit;
  end;
if EditLogin.Text='' then
  begin
  MessageDlg('������� ����� ������������. ��� ���� �� ����� ���� ������.',mtError, [mbOk],0);
  CanSave:=false;
  FormCanBeClosed:=false;
  exit;
  end;

if EditPassword.Text='' then
  begin
  MessageDlg('������� ������ ������������. ��� ���� �� ����� ���� ������.',mtError, [mbOk],0);
  CanSave:=false;
  FormCanBeClosed:=false;
  exit;
  end;

if CanSave then
  begin
  UniInsertSQLUser.Prepare;
  UniInsertSQLUser.ParambyName('p_full_name').Value:= EditFullName.Text;
  UniInsertSQLUser.ParamByName('p_user').Value:= EditLogin.Text;
  UniInsertSQLUser.ParamByName('p_role_id').Value:= ComboboxRoles.Text;
  UniInsertSQLUser.ParamByName('p_password').Value:= EditPassword.Text;
  UniInsertSQLUser.ParamByName('p_hiring_date').Value:= DTHired.Date;
  UniInsertSQLUser.Execute;
  end;
end;

procedure TFormNewUser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:= FormCanBeClosed;
end;

procedure TFormNewUser.SetFormValues;
var ComboBoxRolesIndex:integer;
begin
ComboBoxRolesIndex:=0;
EditFullName.Text:='';
EditLogin.Text:='';
EditPassword.Text:='';
UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['role_id']);
    if UniQueryRoles['role_id'] = '��������' then ComboBoxRolesIndex:=ComboBoxRoles.Items.Count-1;
    UniQueryRoles.Next;
  end;
ComboBoxRoles.ItemIndex:=ComboBoxRolesIndex;
DTHired.DateTime:=Now();
end;

end.
