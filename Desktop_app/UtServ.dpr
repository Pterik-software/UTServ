program UtServ;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  AboutForm in 'AboutForm.pas' {FormAbout},
  PayersForm in 'PayersForm.pas' {FormPayers},
  PlansForm in 'PlansForm.pas' {FormPlans},
  UserDismissForm in 'UserDismissForm.pas' {FormDismissUser},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  SettingsForm in 'SettingsForm.pas' {FormSettings},
  UserUpdateForm in 'UserUpdateForm.pas' {FormUpdateUser},
  CompanyCardForm in 'CompanyCardForm.pas' {FormCompanyCard},
  CalendarForm in 'CalendarForm.pas' {FormUsers};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormPayers, FormPayers);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormDismissUser, FormDismissUser);
  Application.CreateForm(TFormPlans, FormPlans);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormCompanyCard, FormCompanyCard);
  Application.CreateForm(TFormUpdateUser, FormUpdateUser);
  Application.CreateForm(TFormUsers1, FormUsers1);
  Application.CreateForm(TFormUsers, FormUsers);
  Application.Run;
end.
