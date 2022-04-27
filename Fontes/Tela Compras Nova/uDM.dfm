object _dm: T_dm
  OldCreateOrder = False
  Height = 326
  Width = 420
  object _conexao: TSQLConnection
    ConnectionName = 'RAC'
    DriverName = 'Oracle'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbxora.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=Oracle'
      'Database=RAC'
      'User_Name=prddm'
      'Password=sidm'
      'rowsetsize=20'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'os authentication=False'
      'multiple transaction=False'
      'trim char=False'
      'decimal separator=.')
    VendorLib = 'oci.dll'
    AfterConnect = _conexaoAfterConnect
    Left = 168
    Top = 40
  end
  object _LocalConexao: TLocalConnection
    Left = 312
    Top = 56
  end
  object _cdsGenerico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    Left = 256
    Top = 120
  end
  object _dspGenerica: TDataSetProvider
    DataSet = _sqlGenerica
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 120
  end
  object _sqlGenerica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = _conexao
    Left = 72
    Top = 120
  end
end
