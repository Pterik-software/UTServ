unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuAbout: TMenuItem;
    N6: TMenuItem;
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
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    BitBtn1: TBitBtn;
    N5: TMenuItem;
    Help1: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses AboutForm, PayersForm;

procedure TFormMain.BitBtn1Click(Sender: TObject);
begin
FormMain.Close;
end;

procedure TFormMain.mnuAboutClick(Sender: TObject);
begin
FormPayers.ShowModal;
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
FormMain.Close;
end;

procedure TFormMain.N5Click(Sender: TObject);
begin
FormAbout.ShowModal;
end;

end.
