object DM: TDM
  OldCreateOrder = False
  Height = 281
  Width = 538
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 407
    Top = 40
  end
  object UniXBilly: TUniConnection
    ProviderName = 'MySQL'
    Database = 'xbill'
    Debug = True
    Username = 'test'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 38
    EncryptedPassword = '8BFF9AFF8CFF8BFFCEFFCDFFCCFF'
  end
  object ProviderLocal: TMySQLUniProvider
    Left = 168
    Top = 40
  end
  object TransactionLocal: TUniTransaction
    DefaultConnection = UniXBilly
    Left = 295
    Top = 40
  end
end
