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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetFormValues;
  end;

var
  FormNewUser: TFormNewUser;

implementation

{$R *.dfm}

procedure TFormNewUser.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormNewUser.BitBtnSaveClick(Sender: TObject);
var CanSave:boolean;
i:integer;
begin
CanSave:=true;
if EditFullName.Text='' then
  begin
  MessageDlg('������� ������� ��� �������� (���). ���� �� ����� ���� ������.',mtError, [mbOk],0);
  CanSave:=false;
  end;
if EditLogin.Text='' then
  begin
  MessageDlg('������� ����� ������������. ��� ���� �� ����� ���� ������.',mtError, [mbOk],0);
  CanSave:=false;
  end;

if EditPassword.Text='' then
  begin
  MessageDlg('������� ������ ������������. ��� ���� �� ����� ���� ������.',mtError, [mbOk],0);
  CanSave:=false;
  end;

UniQueryRoles.Close;
UniQueryRoles.Open;
CanSave:=false;
while not UniQueryRoles.EOF do
  begin
    for i:=1 to ComboBoxRoles.Items.Count-1 do
      begin
      if (UniQueryRoles['role_id']=ComboBoxRoles.Items[i])
      then
        begin
        CanSave:=true;
        break;
        end;
      if CanSave then break;
      end;
    UniQueryRoles.Next;
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

procedure TFormNewUser.SetFormValues;
begin
EditFullName.Text:='';
EditLogin.Text:='';
EditPassword.Text:='';
UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['role_id']);
    UniQueryRoles.Next;
  end;
ComboBoxRoles.text:='��������';
DTHired.DateTime:=Now();
end;

end.
