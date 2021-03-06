unit DataModule;

interface

uses
  System.SysUtils, System.Classes, SQLiteUniProvider, DBAccess, Uni,
  DASQLMonitor, UniSQLMonitor, UniProvider, MySQLUniProvider, Data.DB;

type
  TDM = class(TDataModule)
    UniSQLMonitor1: TUniSQLMonitor;
    UniXBilly: TUniConnection;
    ProviderLocal: TMySQLUniProvider;
    TransactionLocal: TUniTransaction;
  private
    { Private declarations }
  public
     CurrentUser:string;
  end;

     // DM.UNIXBILL

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
