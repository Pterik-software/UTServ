unit UserUpdateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Mask, Vcl.DBCtrls;

type
  TFormNewUser = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtn1: TBitBtn;
    UniTable1: TUniTable;
    UniDataSource1: TUniDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    StaticText1: TStaticText;
    Label1: TLabel;
    DBEdit5: TDBEdit;
    UniStoredProc1: TUniStoredProc;
    UniSQL1: TUniSQL;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserID:integer;
    function GetUserID: integer;
    procedure SetUserID(value: integer);
  end;

var
  FormNewUser: TFormNewUser;

implementation

{$R *.dfm}

procedure TFormNewUser.BitBtn1Click(Sender: TObject);
begin
Close;
end;

function TFormNewUser.GetUserID: integer;
begin
Result := UserID;
end;

procedure TFormNewUser.SetUserID(value: integer);
begin
UserID := Value;
end;

end.