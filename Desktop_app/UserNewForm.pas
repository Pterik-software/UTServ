unit UserNewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, DBCtrlsEh,
  DBGridEh, DBLookupEh;

type
  TFormNewUser = class(TForm)
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label5: TLabel;
    EditFullName: TEdit;
    LabelLogin: TLabel;
    EditLogin: TEdit;
    Label4: TLabel;
    ComboBoxRoles: TComboBox;
    LabelPassword: TLabel;
    EditPassword: TEdit;
    LabelHired: TLabel;
    DTHired: TDateTimePicker;
    UniQueryRoles: TUniQuery;
    UniQueryRolesrole_id: TStringField;
    UniInsertSQLUser: TUniSQL;
    STComment2: TStaticText;
    STComment1: TStaticText;
    UniQueryRolesorderby: TIntegerField;
    UniQueryRolesrole_name: TStringField;
    UniQueryRoleslang_role_name: TStringField;
    UniDataSource1: TUniDataSource;
    UniLoginsCntr: TUniQuery;
    UniLoginsCntrcntr: TLargeintField;
    UniLoginsCntrcntr_active: TFloatField;
    CheckBoxNoAccess: TCheckBox;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditLoginExit(Sender: TObject);
    procedure CheckBoxNoAccessClick(Sender: TObject);
  private
    FormCanBeClosed:boolean;
  public
     NoAccess : boolean;
    procedure SetFormValues;
  end;

var
  FormNewUser: TFormNewUser;

implementation

{$R *.dfm}

uses System.UItypes;

procedure TFormNewUser.BitBtnCancelClick(Sender: TObject);
begin
FormCanBeClosed:=true;
Close;
end;

procedure TFormNewUser.BitBtnSaveClick(Sender: TObject);
begin
NoAccess:=CheckBoxNoAccess.Checked;
EditFullName.Text:=Uppercase(Trim(EditFullName.Text));
FormCanBeClosed:=true;
try
if EditFullName.Text='' then
  begin
  MessageDlg('??????? ??????? ??? ???????? (???). ???? ?? ????? ???? ??????.',mtError, [mbOk],0);
  FormCanBeClosed:=false;
  exit;
  end;
if (EditLogin.Text='') and not NoAccess then
  begin
  MessageDlg('??????? ????? ????????????. ??? ???? ?? ????? ???? ??????.',mtError, [mbOk],0);
  FormCanBeClosed:=false;
  exit;
  end;

if (EditPassword.Text='') and not NoAccess then
  begin
  MessageDlg('??????? ?????? ????????????. ??? ???? ?? ????? ???? ??????.',mtError, [mbOk],0);
  FormCanBeClosed:=false;
  exit;
  end;
UniLoginsCntr.Close;
UniLoginsCntr.ParamByName('p_login').Value:= EditLogin.Text;
UniLoginsCntr.Execute;
if (UniLoginsCntr['cntr']>=1) and not NoAccess then
  begin
    if UniLoginsCntr['cntr_active']>0
      then MessageDlg('??? ?????????? ?????????? ???????????? ? ????? ?? ???????. ??????????? ??????? email ? ???????? ??????',mtError, [mbOk],0)
      else MessageDlg('?????????? ?????????? ???????????? ? ????? ?? ???????, ???????? ?????? ?????.',mtError, [mbOk],0);
    FormCanBeClosed:=false;
    exit;
  end;

UniInsertSQLUser.Prepare;
UniInsertSQLUser.ParambyName('p_full_name').Value:= EditFullName.Text;
UniInsertSQLUser.ParamByName('p_login').Value:= EditLogin.Text;
UniInsertSQLUser.ParamByName('p_lang_role_name').Value:= ComboboxRoles.Text;
UniInsertSQLUser.ParamByName('p_password').Value:= EditPassword.Text;
UniInsertSQLUser.ParamByName('p_hiring_date').Value:= DTHired.Date;
UniInsertSQLUser.ParamByName('p_access_to_app').Value:= not NoAccess;
UniInsertSQLUser.Execute;

except on Exception do
FormCanBeClosed:=false;
end;

end;

procedure TFormNewUser.CheckBoxNoAccessClick(Sender: TObject);
begin
NoAccess:=CheckBoxNoAccess.Checked;
EditPassword.Enabled:=not NoAccess;
EditLogin.Enabled:=not NoAccess;
if NoAccess then EditLogin.Text:='';
if NoAccess then EditPassword.Text:='';
STComment1.Visible:=not NoAccess;
STComment2.Visible:=not NoAccess;
end;

procedure TFormNewUser.EditLoginExit(Sender: TObject);
begin
EditLogin.Text:=Uppercase(Trim(EditLogin.Text));
end;

procedure TFormNewUser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:= FormCanBeClosed;
end;

procedure TFormNewUser.SetFormValues;
var ComboBoxRolesIndex:integer;
begin
NoAccess:=false;
CheckBoxNoAccess.Checked:=false;
ComboBoxRolesIndex:=0;
EditFullName.Text:='';
EditLogin.Text:='';
EditPassword.Text:='';
UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['lang_role_name']);
    if UniQueryRoles['role_name'] = 'Staff' then ComboBoxRolesIndex:=ComboBoxRoles.Items.Count-1;
    UniQueryRoles.Next;
  end;
ComboBoxRoles.ItemIndex:=ComboBoxRolesIndex;
DTHired.DateTime:=Now();
end;

end.
