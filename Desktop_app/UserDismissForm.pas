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
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    UserID:integer;
    DismissUser:boolean;
  public
    function GetUserID: integer;
    procedure SetUserID(value: integer);
    procedure SetFormValues;
    procedure SetDismiss(Dismiss: boolean);
  end;

var
  FormDismissUser: TFormDismissUser;

implementation

{$R *.dfm}

procedure TFormDismissUser.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormDismissUser.BitBtnSaveClick(Sender: TObject);
begin
UniSQLDismiss.Prepare;
UniSQLDismiss.ParamByName('p_user_id').Value:= UserID;
UniSQLDismiss.ParamByName('p_is_active').Value:= not DismissUser;
UniSQLDismiss.ParamByName('p_closure_date').Value:= DTDismissed.Date;
UniSQLDismiss.Execute;
end;

function TFormDismissUser.GetUserID: integer;
begin
Result := UserID;
end;

procedure TFormDismissUser.SetDismiss(Dismiss: boolean);
begin
DismissUser:= Dismiss;
end;

procedure TFormDismissUser.SetFormValues;
begin
if DismissUser then
  begin
    LabelWarning.Caption:='���������� ����������';
    LabelWarning.Font.Size:=14;
    LabelWarning.Font.Color:=clWindowText;
  end
  else
  begin
    LabelWarning.Caption:='����������� ���������� ����������';
    LabelWarning.Font.Size:=14;
    LabelWarning.Font.Color:=clRed;
  end;

EditFullName.Text:='';
EditLogin.Text:='';
UniQueryRoles.Close;
UniQueryRoles.Open;
while not UniQueryRoles.EOF do
  begin
    ComboBoxRoles.Items.Add(UniQueryRoles['role_id']);
    UniQueryRoles.Next;
  end;
ComboBoxRoles.text:='��������';
DTDismissed.DateTime:=Now();

NullStrictConvert := false;
QueryCurrUser.Close;
QueryCurrUser.ParamByName('p_user_id').Value := UserID;
QueryCurrUser.Open;
EditUserID.Text:=QueryCurrUser['user_id'];
EditFullName.Text:=QueryCurrUser['full_name'];
EditLogin.Text:=QueryCurrUser['user'];
DTHired.DateTime:=QueryCurrUser['hiring_date'];
if DismissUser
  then DTDismissed.Visible:=true
  else DTDismissed.Visible:=false;

//if DismissUser
//  then DTDismissed.DateTime:=Now()
//  else DTDismissed.DateTime:=QueryCurrUser['closure_date'];

end;

procedure TFormDismissUser.SetUserID(value: integer);
begin
UserID := Value;
end;

end.
