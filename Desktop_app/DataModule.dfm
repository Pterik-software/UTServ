object DM: TDM
  OldCreateOrder = False
  Height = 281
  Width = 538
  object UniMySQL: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'utilbills'
    Username = 'test'
    Server = 'localhost'
    LoginPrompt = False
    Left = 32
    Top = 32
    EncryptedPassword = '8BFF9AFF8CFF8BFFCEFFCDFFCCFF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 152
    Top = 32
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 407
    Top = 40
  end
  object UniTransactionMySQL: TUniTransaction
    DefaultConnection = UniMySQL
    Left = 287
    Top = 40
  end
  object UniXBill: TUniConnection
    ProviderName = 'MySQL'
    Database = 'xbill'
    DefaultTransaction = UniTransactionSQLite
    Debug = True
    Username = 'test'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 118
    EncryptedPassword = '8BFF9AFF8CFF8BFFCEFFCDFFCCFF'
  end
  object UniTransactionSQLite: TUniTransaction
    DefaultConnection = UniXBill
    Left = 287
    Top = 118
  end
  object MySQLUniProvider2: TMySQLUniProvider
    Left = 168
    Top = 120
  end
end
