unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  UniProvider, MySQLUniProvider, Data.DB,  DBAccess, Uni, DASQLMonitor,
  UniSQLMonitor;

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
    BitBtnClose: TBitBtn;
    N5: TMenuItem;
    Help1: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    C1: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
//DM.UniSQLite

implementation

{$R *.dfm}

uses AboutForm, PayersForm, UsersForm, PlansForm;

procedure TFormMain.BitBtnCloseClick(Sender: TObject);
begin
FormMain.Close;
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
