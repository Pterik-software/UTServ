program UtServ;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  AboutForm in 'AboutForm.pas' {FormAbout},
  PayersForm in 'PayersForm.pas' {FormPayers},
  UsersForm in 'UsersForm.pas' {FormUsers},
  PlansForm in 'PlansForm.pas' {FormPlans},
  UserUpdateForm in 'UserUpdateForm.pas' {FormUpdateUser},
  DMForm in 'DMForm.pas' {FormDM},
  UserDismissForm in 'UserDismissForm.pas' {FormDismissUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDM, FormDM);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormPayers, FormPayers);
  Application.CreateForm(TFormUsers, FormUsers);
  Application.CreateForm(TFormDismissUser, FormDismissUser);
  Application.CreateForm(TFormUpdateUser, FormUpdateUser);
  Application.CreateForm(TFormPlans, FormPlans);
  Application.CreateForm(TFormDismissUser, FormDismissUser);
  Application.Run;
end.
