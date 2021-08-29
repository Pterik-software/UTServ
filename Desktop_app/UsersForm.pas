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
    UniSQLUsersuser_id: TIntegerField;
    UniSQLUsersfull_name: TStringField;
    UniSQLUsersuser: TStringField;
    UniSQLUserspassword: TStringField;
    UniSQLUsersrole_id: TStringField;
    UniSQLUsersis_active: TBooleanField;
    UniSQLUsershiring_date: TDateField;
    UniSQLUsersclosure_date: TDateField;
    UniSQLUsersis_working: TStringField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure UniSQLUsersCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNewClick(Sender: TObject);
    procedure BitBtnDismissClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsers: TFormUsers;

implementation

{$R *.dfm}

uses DMForm, UserUpdateForm, UserNewForm, UserDismissForm;

procedure TFormUsers.BitBtnDismissClick(Sender: TObject);
begin
FormDismissUser.SetUserID(UniSQLUsers['user_id']);
if (UniSQLUsers['is_active']=True)
  then FormDismissUser.SetDismiss(true);
if (UniSQLUsers['is_active']=false)
  then FormDismissUser.SetDismiss(false);
FormDismissUser.SetFormValues;
FormDismissUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.BitBtnEditClick(Sender: TObject);
begin
FormUpdateUser.SetUserID(UniSQLUsers['user_id']);
FormUpdateUser.SetFormValues;
FormUpdateUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.BitBtnNewClick(Sender: TObject);
begin
FormNewUser.SetFormValues;
FormNewUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUsers.FormCreate(Sender: TObject);
begin
if not UniSQLUsers.Active then UniSQLUsers.Active:=true;
end;

procedure TFormUsers.UniSQLUsersCalcFields(DataSet: TDataSet);
begin
if UniSQLUsers['is_active']=True
  then UniSQLUsers['is_working']:='��'
  else UniSQLUsers['is_working']:='���';
end;

procedure TFormUsers.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
