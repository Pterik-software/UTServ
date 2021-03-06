unit SettingsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFormSettings = class(TForm)
    BitBtnClose: TBitBtn;
    UniQuerySettings: TUniQuery;
    RadioGroupThemes: TRadioGroup;
    UniQuerySettingskey: TStringField;
    UniQuerySettingsvalue: TStringField;
    RadioGroupRounds: TRadioGroup;
    BitBtnSave: TBitBtn;
    UniQuerySettingsrowid: TIntegerField;
    UniQuerySettingsrequired: TSmallintField;
    UniQuerySettingscreated_date: TDateTimeField;
    UniQuerySettingscreated_by: TIntegerField;
    UniQuerySettingsupdated_date: TDateTimeField;
    UniQuerySettingsupdated_by: TIntegerField;
    UniUpdateSettings: TUniQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    SmallintField1: TSmallintField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    DateTimeField2: TDateTimeField;
    IntegerField3: TIntegerField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure CBFullAccessClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
     FormCanBeClosed:boolean;
  public
    procedure SetFormValues;
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.dfm}

uses UserUpdateForm, UserNewForm, UserDismissForm, DataModule;

procedure TFormSettings.BitBtnCloseClick(Sender: TObject);
begin
FormCanBeClosed:=true;
Close;
end;

procedure TFormSettings.BitBtnSaveClick(Sender: TObject);
var value:string;
begin
//?????? - ?? ????? ????? ???? ??????? ??????????? ????
FormCanBeClosed:=false;

try

case RadioGroupThemes.ItemIndex of
  0:Value:='dark';
  1:Value:='light';
  2:Value:='metallic';
  else Value:='dark';
end;

UniUpdateSettings.Close;
UniUpdateSettings.ParamByName('p_key').Value:='theme';
UniUpdateSettings.ParamByName('p_value').Value:=Value;
UniUpdateSettings.ParamByName('p_current_user').Value:=DM.CurrentUser;
UniUpdateSettings.Execute;

case RadioGroupRounds.ItemIndex of
  0:Value:='0.01';
  1:Value:='0.10';
  2:Value:='1.00';
  else Value:='0.01';
end;
UniUpdateSettings.Close;
UniUpdateSettings.ParamByName('p_key').Value:='round_money';
UniUpdateSettings.ParamByName('p_value').Value:=Value;
UniUpdateSettings.ParamByName('p_current_user').Value:=DM.CurrentUser;
UniUpdateSettings.Execute;
FormCanBeClosed:=true;

except on Exception do
FormCanBeClosed:=false;
end;

end;

procedure TFormSettings.CBFullAccessClick(Sender: TObject);
begin
ShowMessage('Value changed');
end;

procedure TFormSettings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:= FormCanBeClosed;
end;

procedure TFormSettings.SetFormValues;
var Value:string;
begin
NullStrictConvert := false;
UniQuerySettings.Close;
UniQuerySettings.ParamByName('p_key').Value:='theme';
UniQuerySettings.Execute;
Value:=UniQuerySettings['Value'];
if VarIsNull(UniQuerySettings['Value']) then RadioGroupThemes.ItemIndex:=0;

if lowercase(Value)='dark' then RadioGroupThemes.ItemIndex:=0;
if lowercase(Value)='light' then RadioGroupThemes.ItemIndex:=1;
if lowercase(Value)='metallic' then RadioGroupThemes.ItemIndex:=2;

UniQuerySettings.Close;
UniQuerySettings.ParamByName('p_key').Value:='round_money';
UniQuerySettings.Execute;
Value:=UniQuerySettings['Value'];
if VarIsNull(UniQuerySettings['Value']) then RadioGroupRounds.ItemIndex:=0;

if (lowercase(Value)='0.01') or (lowercase(Value)='0,01') then RadioGroupRounds.ItemIndex:=0;
if (lowercase(Value)='0.10') or (lowercase(Value)='0.1') or (lowercase(Value)='0,10') or (lowercase(Value)='0,1')
   then RadioGroupRounds.ItemIndex:=1;
if (lowercase(Value)='1.00') or (lowercase(Value)='1,00') then RadioGroupRounds.ItemIndex:=2;

end;

end.
