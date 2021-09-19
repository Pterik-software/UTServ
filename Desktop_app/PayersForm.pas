unit PayersForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, MemDS,
  DBAccess, Uni, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TFormPayers = class(TForm)
    BitBtnClose: TBitBtn;
    DBGridEh1: TDBGridEh;
    UniPayers: TUniQuery;
    UniPayersuser_id: TLargeintField;
    UniPayersis_active: TBooleanField;
    UniPayersfull_name: TStringField;
    UniPayerspassword: TStringField;
    UniPayerslang_is_active: TStringField;
    UniPayersis_working: TStringField;
    UniPayershiring_date: TDateField;
    UniPayersclosure_date: TDateField;
    UniPayerslogin: TStringField;
    UniPayerslang_role_name: TStringField;
    UniPayersorderby: TIntegerField;
    BitBtn1: TBitBtn;
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDismiss: TBitBtn;
    UniDataSource1: TDataSource;
    procedure BitBtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPayers: TFormPayers;

implementation

{$R *.dfm}

procedure TFormPayers.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
