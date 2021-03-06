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
    NSettings: TMenuItem;
    NExit: TMenuItem;
    N4: TMenuItem;
    NPayers: TMenuItem;
    NPlans: TMenuItem;
    N8: TMenuItem;
    NReceipts: TMenuItem;
    NPayments: TMenuItem;
    NArrears: TMenuItem;
    NPaymentsArchive: TMenuItem;
    NTurnovers: TMenuItem;
    N14: TMenuItem;
    NNextPeriod: TMenuItem;
    NReminders: TMenuItem;
    NPrintReceipts: TMenuItem;
    NDebtors: TMenuItem;
    NSubmitTheCourt: TMenuItem;
    N20: TMenuItem;
    NBankStatements: TMenuItem;
    NFineCalc: TMenuItem;
    BitBtnClose: TBitBtn;
    NAbout: TMenuItem;
    Help1: TMenuItem;
    NUpdate: TMenuItem;
    NAgreements: TMenuItem;
    NUsers: TMenuItem;
    NAccounts: TMenuItem;
    NCard: TMenuItem;
    NCalendar: TMenuItem;
    NObjects: TMenuItem;
    procedure NExitClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure NAboutClick(Sender: TObject);
    procedure NPayersClick(Sender: TObject);
    procedure NUsersClick(Sender: TObject);
    procedure NPlansClick(Sender: TObject);
    procedure NSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NCalendarClick(Sender: TObject);
    procedure NObjectsClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;
     // DM.UNIXBILLY
     // DM.TransactionLocal
var
  FormMain: TFormMain;


implementation

{$R *.dfm}

uses AboutForm, PayersForm, UsersForm, PlansForm, SettingsForm, DataModule,
  CalendarForm, ObjectForm;

procedure TFormMain.BitBtnCloseClick(Sender: TObject);
begin
FormMain.Close;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
DM.CurrentUser:='Admin';
end;

procedure TFormMain.NPayersClick(Sender: TObject);
begin
if FormPayers=nil then Application.CreateForm(TFormPayers, FormPayers);
FormPayers.ShowModal;
end;

procedure TFormMain.NObjectsClick(Sender: TObject);
begin
if FormObjects=nil then Application.CreateForm(TFormObjects, FormObjects);
FormObjects.SetFormValues;
FormObjects.ShowModal;
end;

procedure TFormMain.NUsersClick(Sender: TObject);
begin
if FormUsers=nil then Application.CreateForm(TFormUsers, FormUsers);
FormUsers.SetFormValues;
FormUsers.ShowModal;
end;

procedure TFormMain.NSettingsClick(Sender: TObject);
begin
if FormSettings=nil then Application.CreateForm(TFormSettings, FormSettings);
FormSettings.SetFormValues;
FormSettings.ShowModal;
end;

procedure TFormMain.NExitClick(Sender: TObject);
begin
FormMain.Close;
end;

procedure TFormMain.NAboutClick(Sender: TObject);
begin
if FormAbout=nil then Application.CreateForm(TFormAbout, FormAbout);
FormAbout.ShowModal;
end;

procedure TFormMain.NCalendarClick(Sender: TObject);
begin
if FormCalendar=nil then Application.CreateForm(TFormCalendar, FormCalendar);
FormCalendar.SetFormValues;
FormCalendar.ShowModal;
end;

procedure TFormMain.NPlansClick(Sender: TObject);
begin
if FormPlans=nil then Application.CreateForm(TFormPlans, FormPlans);
FormPlans.SetFormValues;
FormPlans.ShowModal;
end;

end.
