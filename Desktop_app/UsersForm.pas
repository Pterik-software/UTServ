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
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDismiss: TBitBtn;
    UniQuery1: TUniQuery;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
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

procedure TFormUsers.BitBtnEditClick(Sender: TObject);
begin
FormNewUser.SetUserID(UniQuery1['user_id']);
FormNewUser.ShowModal;
end;

procedure TFormUsers.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
