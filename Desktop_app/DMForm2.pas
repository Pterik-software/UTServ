unit DMForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DASQLMonitor, UniSQLMonitor,
  UniProvider, MySQLUniProvider, Data.DB, DBAccess, Uni, SQLiteUniProvider;

type
  TFormDM = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDM: TFormDM;

implementation

{$R *.dfm}

procedure TFormDM.FormCreate(Sender: TObject);
begin
UniMySQL.Connected:=true;
UniSQLite.Connected:=true;
end;

procedure TFormDM.FormDestroy(Sender: TObject);
begin
if UniMySQL.Connected then UniMySQL.Connected:=false;
if UniSQLite.Connected then UniSQLite.Connected:=false;
end;

end.
