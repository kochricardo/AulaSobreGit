object _frmTelaPrazoPedido: T_frmTelaPrazoPedido
  Left = 411
  Top = 0
  Caption = 'Tela Prazo Pedido'
  ClientHeight = 493
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 233
    Top = 253
    Width = 88
    Height = 13
    Caption = 'Data Faturamento'
  end
  object Label2: TLabel
    Left = 233
    Top = 299
    Width = 82
    Height = 13
    Caption = 'Previs'#227'o Entrega'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 442
    Height = 225
    Align = alTop
    Caption = 'Prazo Pedido'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 438
      Height = 208
      Align = alClient
      DataSource = _dsCondicaoPagamento
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 474
    Width = 442
    Height = 19
    Panels = <>
  end
  object _grbParcelaPrazo: TGroupBox
    Left = 9
    Top = 237
    Width = 173
    Height = 189
    Caption = 'Prazo Pedido'
    TabOrder = 2
    object _dbgPrazoSC: TDBGrid
      Left = 2
      Top = 15
      Width = 169
      Height = 172
      Align = alClient
      Ctl3D = False
      DataSource = _dsPrazoPedido
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = _dbgPrazoSCDblClick
      OnKeyDown = _dbgPrazoSCKeyDown
    end
  end
  object _btnConfirma: TBitBtn
    Left = 233
    Top = 357
    Width = 168
    Height = 29
    Caption = '&Confirma Pedido'
    DoubleBuffered = True
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = _btnConfirmaClick
  end
  object _dtpDtFaturemento: TDateTimePicker
    Left = 233
    Top = 272
    Width = 96
    Height = 21
    Date = 43522.614057268520000000
    Time = 43522.614057268520000000
    TabOrder = 4
    OnChange = _dtpDtFaturementoChange
  end
  object _dtpPrevisaoEntrega: TDateTimePicker
    Left = 233
    Top = 314
    Width = 96
    Height = 21
    Date = 43522.614057268520000000
    Time = 43522.614057268520000000
    TabOrder = 5
  end
  object _bitFechar: TBitBtn
    Left = 233
    Top = 441
    Width = 168
    Height = 29
    Caption = '&Fechar'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = _bitFecharClick
  end
  object _dsCondicaoPagamento: TDataSource
    DataSet = _cdsCondicaoPagamento
    Left = 120
    Top = 80
  end
  object _cdsCondicaoPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 88
    object _cdsCondicaoPagamentoNR_PARCELAS: TAutoIncField
      DisplayLabel = 'Parcela'
      DisplayWidth = 5
      FieldName = 'NR_PARCELAS'
    end
    object _cdsCondicaoPagamentoNR_DIAS: TIntegerField
      DisplayLabel = 'Nr. Dias'
      FieldName = 'NR_DIAS'
      DisplayFormat = '##0'
    end
    object _cdsCondicaoPagamentoPC_PARCELAS: TFloatField
      DisplayLabel = '% Parc.'
      DisplayWidth = 5
      FieldName = 'PC_PARCELAS'
      DisplayFormat = '##0.00'
    end
    object _cdsCondicaoPagamentoVL_PARCELAS: TFloatField
      DisplayLabel = 'Vl. Pagamentos'
      FieldName = 'VL_PARCELAS'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsCondicaoPagamentoDT_PAGAMENTOS: TDateField
      DisplayLabel = 'Dt. Venc.'
      FieldName = 'DT_PAGAMENTOS'
    end
  end
  object _cdsPrazoPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 352
    object _cdsCondicaoPagamentoNR_PARCELA: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parcela'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Prazo  Dias'
      DisplayWidth = 5
      FieldName = 'NR_DIAS'
    end
  end
  object _dsPrazoPedido: TDataSource
    DataSet = _cdsPrazoPedido
    Left = 96
    Top = 368
  end
  object _cdsTabelaLeadTime: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 249
    Top = 200
  end
  object _dsTabelaLeadTime: TDataSource
    DataSet = _cdsTabelaLeadTime
    Left = 312
    Top = 200
  end
end
