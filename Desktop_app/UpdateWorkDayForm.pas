unit UpdateWorkDayForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFormUpdate1Calendar = class(TForm)
    BitBtnClose: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtnEdit: TBitBtn;
    XBillUpdateWorkday: TUniQuery;
    UniDataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EditChangeReason: TEdit;
    XBillUpdateWorkdaycalendar_id: TLargeintField;
    XBillUpdateWorkdayc_date: TDateTimeField;
    XBillUpdateWorkdayc_day_of_month: TSmallintField;
    XBillUpdateWorkdayc_month: TSmallintField;
    XBillUpdateWorkdayc_year: TSmallintField;
    XBillUpdateWorkdayc_quater: TSmallintField;
    XBillUpdateWorkdayc_day_of_week: TSmallintField;
    XBillUpdateWorkdaylang_day_of_week: TStringField;
    XBillUpdateWorkdayc_week_of_year: TSmallintField;
    XBillUpdateWorkdayc_day_of_year: TSmallintField;
    XBillUpdateWorkdaylang_is_work_day_locally: TStringField;
    XBillUpdateWorkdaylang_is_work_day_server: TStringField;
    XBillUpdateWorkdayc_is_work_day_locally: TSmallintField;
    XBillUpdateWorkdayc_is_work_day_server: TSmallintField;
    XBillUpdateWorkdayc_reason_dayoff_locally: TStringField;
    XBillUpdateWorkdayc_reason_dayoff_server: TStringField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdate1Calendar: TFormUpdate1Calendar;

implementation

{$R *.dfm}

procedure TFormUpdate1Calendar.FormCreate(Sender: TObject);
begin
if not XBillUpdateWorkday.Active then XBillUpdateWorkday.Active:=true;
end;

procedure TFormUpdate1Calendar.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
