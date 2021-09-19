program UtServ;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  //AboutForm in 'AboutForm.pas' {FormAbout},
  //PayersForm in 'PayersForm.pas' {FormPayers},
  //PlansForm in 'PlansForm.pas' {FormPlans},
    //CompanyCardForm in 'CompanyCardForm.pas' {FormCompanyCard},
  //CalendarForm in 'CalendarForm.pas' {FormCalendar},
  //UpdateWorkDayForm in 'UpdateWorkDayForm.pas' {FormUpdate1Calendar},
  //UsersForm in 'UsersForm.pas' {FormUsers},
  //UserNewForm in 'UserNewForm.pas' {FormNewUser},
  //UserDismissForm in 'UserDismissForm.pas' {FormDismissUser},
  //UserUpdateForm in 'UserUpdateForm.pas' {FormUpdateUser},
  //SettingsForm in 'SettingsForm.pas' {FormSettings},
  DataModule in 'DataModule.pas' {DM: TDataModule};


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormMain, FormMain);
//  Application.CreateForm(TFormAbout, FormAbout);
//  Application.CreateForm(TFormPayers, FormPayers);
//  Application.CreateForm(TFormSettings, FormSettings);
//  Application.CreateForm(TFormCalendar, FormCalendar);
//  Application.CreateForm(TFormPlans, FormPlans);
//  Application.CreateForm(TFormCompanyCard, FormCompanyCard);
  Application.Run;
end.
