object _dm: T_dm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 452
  Width = 614
  object _conexao: TSQLConnection
    ConnectionName = 'RAC'
    DriverName = 'ORACLE'
    GetDriverFunc = 'getSQLDriverORACLE'
    KeepConnection = False
    LibraryName = 'dbxora.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=ORACLE'
      'database=RAC'
      'user_name=prddm'
      'Password=sidm'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'rowsetsize=20'
      'os authentication=False'
      'multiple transaction=False'
      'trim char=False'
      'decimal separator=.'
      'Port=211')
    VendorLib = 'oci.dll'
    AfterConnect = _conexaoAfterConnect
    Left = 56
    Top = 40
  end
  object _LocalConexao: TLocalConnection
    Left = 328
    Top = 136
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
  object _spNumeroPedido: TSQLStoredProc
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'TIPC_IN'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 34
        Name = 'CNTC_OU'
        ParamType = ptOutput
        Size = 34
      end
      item
        DataType = ftFMTBcd
        Precision = 34
        Name = 'ERRO_OU'
        ParamType = ptOutput
        Size = 34
      end>
    SQLConnection = _conexao
    StoredProcName = 'PR_CNT'
    Left = 432
  end
  object _spMargemGAM: TSQLStoredProc
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ENTRADA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'SAIDA_OU'
        ParamType = ptOutput
        Size = 2000
      end
      item
        DataType = ftFMTBcd
        Precision = 34
        Name = 'ERRO_OU'
        ParamType = ptOutput
        Size = 34
      end>
    SQLConnection = _conexao
    StoredProcName = 'PR_MARGEM_GAM_ICMS'
    Left = 424
    Top = 48
  end
  object _spInformacaoProduto: TSQLStoredProc
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ENTRADA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'SAIDA_OU'
        ParamType = ptOutput
        Size = 2000
      end
      item
        DataType = ftFMTBcd
        Precision = 34
        Name = 'ERRO_OU'
        ParamType = ptOutput
        Size = 34
      end>
    SQLConnection = _conexao
    StoredProcName = 'PR_INFORMACAO_PRODUTO'
    Left = 424
    Top = 104
  end
  object _cdsUsuario: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from prddm.dc_usuario'
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _LocalConexao
    Left = 288
    Top = 280
    object _cdsUsuarioCD_USUARIO: TFMTBCDField
      DisplayLabel = 'Cod. Usuario'
      FieldName = 'CD_USUARIO'
      Required = True
      Precision = 6
      Size = 0
    end
    object _cdsUsuarioNM_USUARIO: TWideStringField
      DisplayLabel = 'Nome Usuario'
      FieldName = 'NM_USUARIO'
      Size = 40
    end
    object _cdsUsuarioNR_CCUSTO: TFMTBCDField
      DisplayLabel = 'Nr. Centro Custo'
      FieldName = 'NR_CCUSTO'
      Precision = 6
      Size = 0
    end
    object _cdsUsuarioNM_LOGIN: TWideStringField
      DisplayLabel = 'Login'
      FieldName = 'NM_LOGIN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object _cdsUsuarioID_COMISSAO: TWideStringField
      DisplayLabel = 'Paga Comiss'#227'o'
      FieldName = 'ID_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object _cdsUsuarioDS_PASSWD: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'DS_PASSWD'
      Required = True
      Visible = False
      Size = 30
    end
    object _cdsUsuarioNR_GRUPO: TFMTBCDField
      DisplayLabel = 'Nr. Grupo'
      FieldName = 'NR_GRUPO'
      Precision = 6
      Size = 0
    end
    object _cdsUsuarioID_PRIVILEGIO: TFMTBCDField
      DisplayLabel = 'Privil'#233'gio'
      FieldName = 'ID_PRIVILEGIO'
      Required = True
      Precision = 1
      Size = 0
    end
    object _cdsUsuarioHR_INICIAL: TFMTBCDField
      DisplayLabel = 'Hr. Inicial'
      FieldName = 'HR_INICIAL'
      Required = True
      Precision = 4
      Size = 0
    end
    object _cdsUsuarioHR_FINAL: TFMTBCDField
      DisplayLabel = 'Hr. Final'
      FieldName = 'HR_FINAL'
      Required = True
      Precision = 4
      Size = 0
    end
    object _cdsUsuarioPC_MARGEM: TFMTBCDField
      DisplayLabel = '% Margem'
      DisplayWidth = 5
      FieldName = 'PC_MARGEM'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 13
      Size = 2
    end
    object _cdsUsuarioNR_MATRICULA: TFMTBCDField
      DisplayLabel = 'Nr. Matricula'
      FieldName = 'NR_MATRICULA'
      Required = True
      Precision = 10
      Size = 0
    end
  end
  object _dsUsuario: TDataSource
    DataSet = _cdsUsuario
    Left = 364
    Top = 280
  end
  object _cdsGenerico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    Left = 256
    Top = 120
  end
  object _conexaoSihst: TSQLConnection
    ConnectionName = 'SIHST'
    DriverName = 'ORACLE'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbxora.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=ORACLE'
      'Database=sihst'
      'User_Name=prddm'
      'Password=sidm'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'rowsetsize=20'
      'os authentication=False'
      'multiple transaction=False'
      'trim char=False'
      'decimal separator=.')
    VendorLib = 'oci.dll'
    AfterConnect = _conexaoSihstAfterConnect
    Left = 128
    Top = 48
  end
  object _sqlGenericaSihst: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = _conexaoSihst
    Left = 48
    Top = 216
  end
  object _dspGenericasihst: TDataSetProvider
    DataSet = _sqlGenericaSihst
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 160
    Top = 216
  end
  object _cdsGenericoSihst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenericasihst'
    Left = 264
    Top = 216
  end
  object _cdsPrazo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 264
    object _cdsPrazonrParcela: TIntegerField
      Alignment = taCenter
      DisplayLabel = ' Parcela'
      DisplayWidth = 5
      FieldName = 'nrParcela'
    end
    object _cdsPrazonrDiasPrazo: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 5
      FieldName = 'nrDiasPrazo'
    end
    object _cdsPrazonrCondicao: TIntegerField
      FieldName = 'nrCondicao'
      Visible = False
    end
  end
  object _spClienteAtivo: TSQLStoredProc
    SchemaName = 'PRDDM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ENTRADA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'SAIDA_OU'
        ParamType = ptOutput
        Size = 2000
      end
      item
        DataType = ftFMTBcd
        Precision = 34
        Name = 'ERRO_OU'
        ParamType = ptOutput
        Size = 34
      end>
    SQLConnection = _conexao
    StoredProcName = 'PR_INFORMACAO_CLIENTE'
    Left = 424
    Top = 185
  end
  object _stpBloqueioCliente: TSQLStoredProc
    SchemaName = 'PRDDM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ENTRADA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'SAIDA_OU'
        ParamType = ptOutput
        Size = 2000
      end
      item
        DataType = ftFMTBcd
        Precision = 34
        Name = 'ERRO_OU'
        ParamType = ptOutput
        Size = 34
      end>
    SQLConnection = _conexao
    StoredProcName = 'PR_BLOQUEIO_CLIENTE'
    Left = 424
    Top = 236
  end
end
