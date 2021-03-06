unit UserDismissForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TFormDismissUser = class(TForm)
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label5: TLabel;
    EditFullName: TEdit;
    Label2: TLabel;
    EditLogin: TEdit;
    Label4: TLabel;
    ComboBoxRoles: TComboBox;
    LabelHired: TLabel;
    DTHired: TDateTimePicker;
    UniQueryRoles: TUniQuery;
    UniQueryRolesrole_id: TStringField;
    Label1: TLabel;
    DTDismissed: TDateTimePicker;
    QueryCurrUser: TUniQuery;
    Label3: TLabel;
    EditUserID: TEdit;
    UniSQLDismiss: TUniSQL;
    LabelWarning: TLabel;
    LabelDismissComment: TLabel;
    UniQueryRolesorderby: TIntegerField;
    UniQueryRolesrole_name: TStringField;
    UniQueryRoleslang_role_name: TStringField;
    UniLoginsCntr: TUniQuery;
    UniLoginsCntrcntr: TLargeintField;
    UniLoginsCntrcntr_active: TFloatField;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditLoginExit(Sender: TObject);
  private
    UserID:integer;
    DismissUser:boolean;
    FormCanBeClosed:boolean;
  public
    procedure SetFormValues(LUserID:integer; LDismissUser:boolean);
  end;

var
  FormDismissUser: TFormDismissUser;

implementation

{$R *.dfm}

uses DataModule, System.UITypes;

procedure TFormDismissUser.BitBtnCancelClick(Sender: TObject);
begin
FormCanBeClosed:=true;
Close;
end;

procedure TFormDismissUser.BitBtnSaveClick(Sender: TObject);
var CanSave:boolean;
begin
FormCanBeClosed:=True;
CanSave:=true;
EditLogin.Text:=Uppercase(Trim(EditLogin.Text));
UniLoginsCntr.Close;
UniLoginsCntr.ParamByName('p_login').Value:= EditLogin.Text;
UniLoginsCntr.ParamByName('p_user_id').Value:= UserID;
UniLoginsCntr.Execute;
if UniLoginsCntr['cntr']>=1 then
  begin
    if UniLoginsCntr['cntr_active']>0
      then MessageDlg('??? ?????????? ?????????? ???????????? ? ????? ?? ???????. ??????????? ??????? email ? ???????? ??????',mtError, [mbOk],0)
      else MessageDlg('?????????? ?????????? ???????????? ? ????? ?? ???????, ???????? ?????? ?????.',mtError, [mbOk],0);
    exit;
  end;
if (DTHired.Date >= DTDismissed.Date) and DismissUser then
  begin
  ShowMessage('???? ?????????? ??????, ??? ???? ?????. ????????? ??????.');
  LabelDismissComment.Caption:='???? ?????????? ??????, ??? ???? ?????. ????????? ??????.';
  LabelDismissComment.Visible:=true;
  LabelDismissComment.Font.Color:=clRed;
  FormCanBeClosed:=false;
  CanSave:=false;
  end;
if CanSave then
  begin
  UniSQLDismiss.Prepare;
  UniSQLDismiss.ParamByName('p_user_id').Value:= UserID;
  UniSQLDismiss.ParamByName('p_is_active').Value:= not DismissUser;
  UniSQLDismiss.ParamByName('p_closure_date').Value:= DTDismissed.Date;
  UniSQLDismiss.Execute;
  end;
end;

procedure TFormDismissUser.EditLoginExit(Sender: TObject);
begin
EditLogin.Text:=Uppercase(Trim(EditLogin.Text));
end;

procedure TFormDismissUser.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
CanClose:=FormCanBeClosed;
end;

procedure TFormDismissUser.SetFormValues(LUserID:integer; LDismissUser:boolean);
begin
FormCanBeClosed:=true;
DismissUser:=LDismissUser;
UserID:=LUserID;
if DismissUser then
  begin
    LabelWarning.Caption:='?????????? ??????????';
    LabelWarning.Font.Size:=14;
    LabelWarning.Font.Color:=clWindowText;
  end
  else
  begin
    LabelWarning.Caption:='??????????? ?????????? ??????????';
    LabelWarning.Font.Size:=14;
    LabelWarning.Font.Color:=clRed;
  end;

EditFullName.Text:='';
EditLogin.Text:='';
UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['lang_role_name']);
    UniQueryRoles.Next;
  end;
ComboBoxRoles.text:='????????';
DTDismissed.DateTime:=Now();

NullStrictConvert := false;
QueryCurrUser.Close;
QueryCurrUser.ParamByName('p_user_id').Value := UserID;
QueryCurrUser.Open;
EditUserID.Text:=QueryCurrUser['user_id'];
EditFullName.Text:=QueryCurrUser['full_name'];
EditLogin.Text:=QueryCurrUser['login'];
DTHired.DateTime:=QueryCurrUser['hiring_date'];
if DismissUser
  then DTDismissed.Visible:=true
  else DTDismissed.Visible:=false;

LabelDismissComment.Visible:=false;
end;

end.
