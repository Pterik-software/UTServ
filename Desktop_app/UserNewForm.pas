unit UserNewForm;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNewUser: TFormNewUser;

implementation

{$R *.dfm}

end.
