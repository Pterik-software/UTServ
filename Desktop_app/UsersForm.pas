unit UsersForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormUsers = class(TForm)
    BitBtnClose: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDismiss: TBitBtn;
    UniSQLUsers: TUniQuery;
    UniDataSource1: TDataSource;
    UniSQLUsersfull_name: TStringField;
    UniSQLUsersuser: TStringField;
    UniSQLUserspassword: TStringField;
    UniSQLUsersrole_id: TStringField;
    UniSQLUsersis_active: TBooleanField;
    UniSQLUsershiring_date: TDateField;
    UniSQLUsersclosure_date: TDateField;
    UniSQLUsersis_working: TStringField;
    UniSQLUsersuser_id: TLargeintField;
    UniSQLUserslang_is_active: TStringField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure UniSQLUsersCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNewClick(Sender: TObject);
    procedure BitBtnDismissClick(Sender: TObject);
    procedure UniDataSource1DataChange(Sender: TObject; Field: TField);
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
FormDismissUser.SetUserID(UniSQLUsers['user_id']);
if (UniSQLUsers['is_active'])
  then FormDismissUser.SetDismiss(true);
if (not UniSQLUsers['is_active'])
  then FormDismissUser.SetDismiss(false);

if FormDismissUser=nil then Application.CreateForm(TFormDismissUser, FormDismissUser);
FormDismissUser.SetFormValues;
FormDismissUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.BitBtnEditClick(Sender: TObject);
begin
if not UniSQLUsers['is_active'] then
  begin
    ShowMessage('��������� ������, �������� ���������� � �������� �����������');
    exit;
  end;

if FormUpdateUser = nil then Application.CreateForm(TFormUpdateUser, FormUpdateUser);
FormUpdateUser.SetUserID(UniSQLUsers['user_id']);
FormUpdateUser.SetFormValues;
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
  then BitBtnDismiss.Caption:='����������'
  else BitBtnDismiss.Caption:='������ ����������';
end;

procedure TFormUsers.FormCreate(Sender: TObject);
begin
if not UniSQLUsers.Active then UniSQLUsers.Active:=true;
end;

procedure TFormUsers.UniDataSource1DataChange(Sender: TObject; Field: TField);
begin
ChangeDismissCaption;
end;

procedure TFormUsers.UniSQLUsersCalcFields(DataSet: TDataSet);
begin
if UniSQLUsers['is_active']
  then UniSQLUsers['is_working']:='��'
  else UniSQLUsers['is_working']:='���';
end;

procedure TFormUsers.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
