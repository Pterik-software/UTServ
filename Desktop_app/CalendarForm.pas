unit CalendarForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormCalendar = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    UniSQLCalendar: TUniQuery;
    UniSQLCalendaruser_id: TIntegerField;
    UniSQLCalendarfull_name: TStringField;
    UniSQLCalendaruser: TStringField;
    UniSQLCalendarpassword: TStringField;
    UniSQLCalendarrole_id: TStringField;
    UniSQLCalendaris_active: TBooleanField;
    UniSQLCalendarhiring_date: TDateField;
    UniSQLCalendarclosure_date: TDateField;
    UniSQLCalendaris_working: TStringField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniDataSource1DataChange(Sender: TObject; Field: TField);
  private
    procedure ChangeDismissCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCalendar: TFormCalendar;

implementation

{$R *.dfm}

uses UserUpdateForm, UserNewForm, UserDismissForm;

procedure TFormCalendar.FormCreate(Sender: TObject);
begin
if not UniSQLCalendar.Active then UniSQLCalendar.Active:=true;
end;

procedure TFormCalendar.UniDataSource1DataChange(Sender: TObject; Field: TField);
begin
ChangeDismissCaption;
end;

procedure TFormCalendar.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
