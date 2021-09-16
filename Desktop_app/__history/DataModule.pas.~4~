unit DataModule;

interface

uses
  System.SysUtils, System.Classes, SQLiteUniProvider, DBAccess, Uni,
  DASQLMonitor, UniSQLMonitor, UniProvider, MySQLUniProvider, Data.DB;

type
  TDM = class(TDataModule)
    UniMySQL: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    UniSQLMonitor1: TUniSQLMonitor;
    UniTransactionMySQL: TUniTransaction;
    UniSQLite: TUniConnection;
    SQLiteUniProvider1: TSQLiteUniProvider;
    UniTransactionSQLite: TUniTransaction;
  private
    { Private declarations }
  public
     CurrentUser:string;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
