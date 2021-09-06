unit CompanyCardForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFormCompanyCard = class(TForm)
    BitBtnClose: TBitBtn;
    UniSQLCompanyCard: TUniQuery;
    DSCompanyCard: TDataSource;
    UniSQLCompanyCarduser_id: TIntegerField;
    UniSQLCompanyCardfull_name: TStringField;
    UniSQLCompanyCarduser: TStringField;
    UniSQLCompanyCardpassword: TStringField;
    UniSQLCompanyCardrole_id: TStringField;
    UniSQLCompanyCardis_active: TBooleanField;
    UniSQLCompanyCardhiring_date: TDateField;
    UniSQLCompanyCardclosure_date: TDateField;
    UniSQLCompanyCardis_working: TStringField;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    procedure BitBtnCloseClick(Sender: TObject);
  private
  public
  end;

var
  FormCompanyCard: TFormCompanyCard;

implementation

{$R *.dfm}

uses UserUpdateForm, UserNewForm, UserDismissForm;

procedure TFormCompanyCard.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
