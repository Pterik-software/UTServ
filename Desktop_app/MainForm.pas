unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Data.FMTBcd, Data.DBXMySql, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLiteVDataSet;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuAbout: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    BitBtn1: TBitBtn;
    N5: TMenuItem;
    Help1: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    C1: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses AboutForm, PayersForm, UsersForm, PlansForm;

procedure TFormMain.BitBtn1Click(Sender: TObject);
begin
FormMain.Close;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
//  SQLConnection.ConnectionName:='MySQLConnection';
//  SQLConnection.LoginPrompt:=False;
//  SQLConnection.Params.Values['ServerCharSet']:='cp1251';
//  SQLConnection.DriverName:='MySQL';
//  SQLConnection.Params.Values['HostName']:='localhost';
//  SQLConnection.Params.Values['Database']:='TestDB';
//  ...
//  with DBDataModule.SQLConnection do
//  begin
//    Params.Values['User_Name']:=EditLogin.Text;
//    Params.Values['Password']:=EditPassword.Text;
//    Connected:=True;
//  end;
end;

procedure TFormMain.mnuAboutClick(Sender: TObject);
begin
FormPayers.ShowModal;
end;

procedure TFormMain.N26Click(Sender: TObject);
begin
FormUsers.ShowModal;
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
FormMain.Close;
end;

procedure TFormMain.N5Click(Sender: TObject);
begin
FormAbout.ShowModal;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
FormPlans.ShowModal;
end;

end.
