unit CalendarUpdateWorkDayForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  MemDS, DBAccess, Uni, Vcl.Grids, Vcl.DBGrids;

type
  TFormUpdate1Calendar = class(TForm)
    BitBtnClose: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtnNew: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDismiss: TBitBtn;
    XBillUpdateWorkday: TUniQuery;
    UniDataSource1: TDataSource;
    XBillUpdateWorkdayfull_name: TStringField;
    XBillUpdateWorkdayuser: TStringField;
    XBillUpdateWorkdaypassword: TStringField;
    XBillUpdateWorkdayrole_id: TStringField;
    XBillUpdateWorkdayis_active: TBooleanField;
    XBillUpdateWorkdayhiring_date: TDateField;
    XBillUpdateWorkdayclosure_date: TDateField;
    XBillUpdateWorkdayis_working: TStringField;
    XBillUpdateWorkdayuser_id: TLargeintField;
    XBillUpdateWorkdaylang_is_active: TStringField;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure XBillUpdateWorkdayCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNewClick(Sender: TObject);
    procedure BitBtnDismissClick(Sender: TObject);
    procedure UniDataSource1DataChange(Sender: TObject; Field: TField);
  private
    procedure ChangeDismissCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdate1Calendar: TFormUpdate1Calendar;

implementation

{$R *.dfm}

uses UserUpdateForm, UserNewForm, UserDismissForm;

procedure TFormUpdate1Calendar.BitBtnDismissClick(Sender: TObject);
begin
FormDismissUser.SetUserID(UniSQLUsers['user_id']);
if (UniSQLUsers['is_active'])
  then FormDismissUser.SetDismiss(true);
if (not UniSQLUsers['is_active'])
  then FormDismissUser.SetDismiss(false);
FormDismissUser.SetFormValues;
FormDismissUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUpdate1Calendar.BitBtnEditClick(Sender: TObject);
begin
if not UniSQLUsers['is_active'] then
  begin
    ShowMessage('????????? ??????, ???????? ?????????? ? ???????? ???????????');
    exit;
  end;

FormUpdateUser.SetUserID(UniSQLUsers['user_id']);
FormUpdateUser.SetFormValues;
FormUpdateUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUpdate1Calendar.BitBtnNewClick(Sender: TObject);
begin
FormNewUser.SetFormValues;
FormNewUser.ShowModal;
UniSQLUsers.Refresh;
end;

procedure TFormUpdate1Calendar.ChangeDismissCaption;
begin
if UniSQLUsers['is_active']
  then BitBtnDismiss.Caption:='??????????'
  else BitBtnDismiss.Caption:='?????? ??????????';
end;

procedure TFormUpdate1Calendar.FormCreate(Sender: TObject);
begin
if not UniSQLUsers.Active then UniSQLUsers.Active:=true;
end;

procedure TFormUpdate1Calendar.UniDataSource1DataChange(Sender: TObject; Field: TField);
begin
ChangeDismissCaption;
end;

procedure TFormUpdate1Calendar.XBillUpdateWorkdayCalcFields(DataSet: TDataSet);
begin
if UniSQLUsers['is_active']
  then UniSQLUsers['is_working']:='??'
  else UniSQLUsers['is_working']:='???';
end;

procedure TFormUpdate1Calendar.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

end.
