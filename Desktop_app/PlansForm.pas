unit PlansForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormPlans = class(TForm)
    DBGrid1: TDBGrid;
    UniSQLPlans: TUniQuery;
    UniSQLPlansuser_id: TIntegerField;
    UniSQLPlansfull_name: TStringField;
    UniSQLPlansuser: TStringField;
    UniSQLPlanspassword: TStringField;
    UniSQLPlansrole_id: TStringField;
    UniSQLPlansis_active: TBooleanField;
    UniSQLPlansis_working: TStringField;
    UniSQLPlanshiring_date: TDateField;
    UniSQLPlansclosure_date: TDateField;
    UniDataSource1: TDataSource;
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDismiss: TBitBtn;
    BitBtnClose: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPlans: TFormPlans;

implementation

{$R *.dfm}

end.
