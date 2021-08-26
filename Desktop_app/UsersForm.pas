unit UsersForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormUsers = class(TForm)
    BitBtnClose: TBitBtn;
    UniDataSource1: TUniDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    UniQuery1: TUniQuery;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsers: TFormUsers;

implementation

{$R *.dfm}

uses UserUpdateForm;

procedure TFormUsers.BitBtn2Click(Sender: TObject);
begin
FormNewUser.ShowModal;
end;

procedure TFormUsers.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
