program UtServ;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  AboutForm in 'AboutForm.pas' {FormAbout},
  PayersForm in 'PayersForm.pas' {FormPayers},
  UsersForm in 'UsersForm.pas' {FormUsers},
  PlansForm in 'PlansForm.pas' {FormPlans};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormPayers, FormPayers);
  Application.CreateForm(TFormUsers, FormUsers);
  Application.CreateForm(TFormPlans, FormPlans);
  Application.Run;
end.
