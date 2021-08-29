program UtServ;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  AboutForm in 'AboutForm.pas' {FormAbout},
  PayersForm in 'PayersForm.pas' {FormPayers},
  UsersForm in 'UsersForm.pas' {FormUsers},
  PlansForm in 'PlansForm.pas' {FormPlans},
  UserUpdateForm in 'UserUpdateForm.pas' {FormUpdateUser},
  UserDismissForm in 'UserDismissForm.pas' {FormDismissUser},
  UserNewForm in 'UserNewForm.pas' {FormNewUser},
  DataModule in 'DataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormPayers, FormPayers);
  Application.CreateForm(TFormUsers, FormUsers);
  Application.CreateForm(TFormDismissUser, FormDismissUser);
  Application.CreateForm(TFormUpdateUser, FormUpdateUser);
  Application.CreateForm(TFormDismissUser, FormDismissUser);
  Application.CreateForm(TFormPlans, FormPlans);
  Application.CreateForm(TFormNewUser, FormNewUser);
  Application.Run;
end.
