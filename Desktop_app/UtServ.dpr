program UtServ;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  DeactivatePlanForm in 'DeactivatePlanForm.pas' {FormDeactivatePlan},
  ActivatePlanForm in 'ActivatePlanForm.pas' {FormActivatePlan};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDeactivatePlan, FormDeactivatePlan);
  Application.CreateForm(TFormActivatePlan, FormActivatePlan);
  //  Application.CreateForm(TFormAbout, FormAbout);
//  Application.CreateForm(TFormPayers, FormPayers);
//  Application.CreateForm(TFormSettings, FormSettings);
//  Application.CreateForm(TFormCalendar, FormCalendar);
//  Application.CreateForm(TFormPlans, FormPlans);
//  Application.CreateForm(TFormCompanyCard, FormCompanyCard);
  Application.Run;
end.
