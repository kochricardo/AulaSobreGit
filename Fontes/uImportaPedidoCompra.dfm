object _frmImportaPedidoFornecedor: T_frmImportaPedidoFornecedor
  Left = 0
  Top = 0
  Caption = 'Importa Pedido de Compra Fornecedor'
  ClientHeight = 629
  ClientWidth = 1368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1368
    Height = 177
    Align = alTop
    Caption = 'Importa Arquivo'
    TabOrder = 0
    DesignSize = (
      1368
      177)
    object Label1: TLabel
      Left = 9
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Caminho Arquivo'
    end
    object Label2: TLabel
      Left = 37
      Top = 17
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object _gaPlanilha: TGauge
      Left = 37
      Top = 130
      Width = 169
      Height = 7
      ForeColor = clBlue
      Progress = 0
    end
    object Label4: TLabel
      Left = 34
      Top = 111
      Width = 46
      Height = 13
      Caption = 'Nr. Verba'
    end
    object Label11: TLabel
      Left = 360
      Top = 102
      Width = 93
      Height = 13
      Caption = 'Cpra. Cxa Fechada'
    end
    object _edtArquivo: TEdit
      Left = 96
      Top = 41
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object _btnImportaLista: TBitBtn
      Left = 415
      Top = 41
      Width = 41
      Height = 21
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000088888008888888888800000088880FF000000000080000008880
        F0080FFFFFFF08000000880F0FF00F00000F0800000080F0F0080FFFFFFF0800
        0000880F0FF00F00000F0800000080F0F0080FFFFFFF08000000880F0FB00F00
        F0000800000080F0FBFB0FFFF0F088000000880FBFBF0FFFF0088800000080FB
        FBFB00000088880000008800BFBFBFBF088888000000888800FBFBF088888800
        000088888800B808888888000000888888880088888888000000888888888888
        888888000000888888888888888888000000}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = _btnImportaListaClick
    end
    object _edtNrFornecedor: TEdit
      Left = 95
      Top = 14
      Width = 64
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNmForncedor: TEdit
      Left = 165
      Top = 14
      Width = 244
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object _btnImportaDados: TBitBtn
      Left = 464
      Top = 146
      Width = 153
      Height = 25
      Caption = 'Gerar Pedido'
      DoubleBuffered = True
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888888888888888800000000088088880FFFFFFF088008880F00F
        00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
        C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
        888888888888888888888888888888888888}
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = _btnImportaDadosClick
    end
    object GroupBox3: TGroupBox
      Left = 462
      Top = 3
      Width = 355
      Height = 137
      Caption = 'Pedido Para:'
      TabOrder = 5
      object _dbgEmpresa: TDBGrid
        Left = 2
        Top = 15
        Width = 351
        Height = 120
        Align = alClient
        DataSource = _dsEmpresa
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = _dbgEmpresaDrawColumnCell
        OnDblClick = _dbgEmpresaDblClick
        OnTitleClick = _dbgEmpresaTitleClick
      end
    end
    object BitBtn1: TBitBtn
      Left = 96
      Top = 72
      Width = 110
      Height = 25
      Caption = 'Importa Planilha'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object _edtNrVerba: TEdit
      Left = 95
      Top = 103
      Width = 64
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 7
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _grbTotaisPedido: TGroupBox
      Left = 828
      Top = 9
      Width = 532
      Height = 156
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Totais Pedido(s)'
      TabOrder = 8
      object _dbgPedido: TDBGrid
        Left = 2
        Top = 15
        Width = 528
        Height = 139
        Align = alClient
        DataSource = _dsTotalizaPedido
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = _dbgPedidoDrawColumnCell
      end
    end
    object _cbxCaixaFechada: TComboBox
      Left = 361
      Top = 117
      Width = 97
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      Text = 'Sim'
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object _chkCrossDocking: TCheckBox
      Left = 226
      Top = 121
      Width = 129
      Height = 17
      Caption = 'Pedido  CrossDocking'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 177
    Width = 1368
    Height = 360
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Produtos'
    TabOrder = 1
    object _dbgPrePedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1364
      Height = 343
      Align = alClient
      DataSource = _dsPrePedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPrePedidoDrawColumnCell
      OnTitleClick = _dbgPrePedidoTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_EMPRESA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CROSSDOCKING'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_PRODUTO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PRODUTO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_APRESENTACAO_PRODUTO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_EMBALAGEM_COMPRA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_PRECO_FORNECEDOR'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_PRECO_PEDIDO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_DESCONTO_PADRAO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_DESCONTO_ADICIONAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_PEDIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_DIAS_ESTOQUE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MEDIA_VENDA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_ESTOQUE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_PENDENTE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_VERBA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_VERBA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_OPERADOR_LOGISTICO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_MERCADORIA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_DIAS_CROSSDOCKING'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_EMPRESA_OCD'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_LEADTIME'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CURVA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_CREDITOICMS'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_IPI_LISTA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_DESCONTO_TOTAL'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_SEM_CROSSDOCKING'
          ReadOnly = True
          Title.Caption = 'ID Cross'
          Visible = True
        end>
    end
  end
  object _stbMensagem: TStatusBar
    Left = 0
    Top = 610
    Width = 1368
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 350
      end
      item
        Width = 50
      end>
    OnDrawPanel = _stbMensagemDrawPanel
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 519
    Width = 1368
    Height = 91
    Align = alBottom
    Caption = 'Totais Pedido'
    TabOrder = 3
    object _btnConfirma: TBitBtn
      Left = 808
      Top = 22
      Width = 185
      Height = 35
      Caption = 'Confirma Pedido'
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        42030000424D42030000000000003600000028000000110000000F0000000100
        1800000000000C030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000FFFFFFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF7F00007F00007F0000FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F0000
        7F0000FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF00000000000000
        00000000000000007F00007F00007F0000FFFFFF7F00007F0000FFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFF7F00007F00007F
        0000FFFFFF000000BFBFBF7F00007F0000FFFFFFBFBFBFBFBFBFBFBFBF00BFBF
        BF000000FFFFFF7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF000000BFBFBFBF
        BFBF7F0000FFFFFFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF7F0000FFFFFFBF
        BFBFBFBFBF00BFBFBF000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF
        FF000000BFBFBFBFBFBFBFBFBFBFBFBF7F0000FFFFFFBFBFBF00BFBFBF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F0000FFFFFF00BFBFBF000000FFFFFF7F7F7F7F7F7FBFBFBF
        BFBFBFBFBFBFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00
        0000BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F
        7F7F7F7F7FBFBFBF000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
        BF000000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBF00}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = _btnConfirmaClick
    end
    object _btnFechaCancela: TBitBtn
      Left = 95
      Top = 24
      Width = 204
      Height = 39
      Caption = '&Fechar/Cancelar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = _btnFechaCancelaClick
    end
  end
  object _cdsPrePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 112
    object _cdsPrePedidoCD_EMPRESA: TIntegerField
      DisplayLabel = 'CD'
      DisplayWidth = 2
      FieldName = 'CD_EMPRESA'
    end
    object _cdsPrePedidoID_CROSSDOCKING: TStringField
      DisplayLabel = 'OCD'
      FieldName = 'ID_CROSSDOCKING'
      Size = 1
    end
    object _cdsPrePedidoCD_PRODUTO: TIntegerField
      DisplayLabel = 'Cod.Produto'
      FieldName = 'CD_PRODUTO'
    end
    object _cdsPrePedidoNM_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NM_PRODUTO'
      Size = 35
    end
    object _cdsPrePedidoDS_APRESENTACAO_PRODUTO: TStringField
      DisplayLabel = 'Apresenta'#231#227'o'
      FieldName = 'DS_APRESENTACAO_PRODUTO'
      Size = 35
    end
    object _cdsPrePedidoQT_EMBALAGEM_COMPRA: TIntegerField
      DisplayLabel = 'QTD.Emb. Cpra.'
      FieldName = 'QT_EMBALAGEM_COMPRA'
    end
    object _cdsPrePedidoVL_PRECO_FORNECEDOR: TFloatField
      DisplayLabel = 'Pre'#231'o. Compra'
      FieldName = 'VL_PRECO_FORNECEDOR'
      DisplayFormat = '###,##0.00'
    end
    object _cdsPrePedidoVL_PRECO_PEDIDO: TFloatField
      DisplayLabel = 'Pre'#231'o Pedido'
      FieldName = 'VL_PRECO_PEDIDO'
      DisplayFormat = '###,##0.00'
    end
    object _cdsPrePedidoPC_DESCONTO_PADRAO: TFloatField
      DisplayLabel = '% Desc.Padr'#227'o'
      FieldName = 'PC_DESCONTO_PADRAO'
      DisplayFormat = '##0.00'
    end
    object _cdsPrePedidoPC_DESCONTO_ADICIONAL: TFloatField
      DisplayLabel = '% Desc. Adicional'
      FieldName = 'PC_DESCONTO_ADICIONAL'
      DisplayFormat = '##0.00'
    end
    object _cdsPrePedidoQT_PEDIDO: TIntegerField
      DisplayLabel = 'Qtd.Pedido'
      FieldName = 'QT_PEDIDO'
    end
    object _cdsPrePedidoNR_DIAS_ESTOQUE: TFloatField
      DisplayLabel = 'Dias Estoque'
      FieldName = 'NR_DIAS_ESTOQUE'
    end
    object _cdsPrePedidoVL_MEDIA_VENDA: TFloatField
      DisplayLabel = 'Media Dia'
      FieldName = 'VL_MEDIA_VENDA'
      DisplayFormat = '###,##0.00'
    end
    object _cdsPrePedidoQT_ESTOQUE: TIntegerField
      DisplayLabel = 'Qtd. Estoque'
      FieldName = 'QT_ESTOQUE'
      DisplayFormat = '###,##0'
    end
    object _cdsPrePedidoQT_PENDENTE: TIntegerField
      DisplayLabel = 'Qtd.Pendente'
      FieldName = 'QT_PENDENTE'
      DisplayFormat = '###,##0'
    end
    object _cdsPrePedidoNR_VERBA: TIntegerField
      DisplayLabel = 'Nr. Verba'
      FieldName = 'NR_VERBA'
    end
    object _cdsPrePedidoPC_VERBA: TFloatField
      DisplayLabel = '% P/ Verba'
      FieldName = 'PC_VERBA'
      DisplayFormat = '##0.00'
    end
    object _cdsPrePedidoCD_OPERADOR_LOGISTICO: TIntegerField
      DisplayLabel = 'Nr. Operador Logistico'
      FieldName = 'CD_OPERADOR_LOGISTICO'
    end
    object _cdsPrePedidoNR_MERCADORIA: TIntegerField
      DisplayLabel = 'Nr.Produto'
      DisplayWidth = 6
      FieldName = 'NR_MERCADORIA'
    end
    object _cdsPrePedidoNR_DIAS_CROSSDOCKING: TIntegerField
      FieldName = 'NR_DIAS_CROSSDOCKING'
    end
    object _cdsPrePedidoNR_EMPRESA_OCD: TIntegerField
      FieldName = 'NR_EMPRESA_OCD'
    end
    object _cdsPrePedidoNR_LEADTIME: TIntegerField
      FieldName = 'NR_LEADTIME'
    end
    object _cdsPrePedidoID_CURVA: TStringField
      FieldName = 'ID_CURVA'
      Size = 1
    end
    object _cdsPrePedidoPC_CREDITOICMS: TFloatField
      FieldName = 'PC_CREDITOICMS'
    end
    object _cdsPrePedidoPC_IPI_LISTA: TFloatField
      FieldName = 'PC_IPI_LISTA'
    end
    object _cdsPrePedidoPC_DESCONTO_TOTAL: TFloatField
      DisplayLabel = '% Desconto Tatal'
      FieldName = 'PC_DESCONTO_TOTAL'
    end
    object _cdsPrePedidoCD_EMPRESA_CROSSDOCKING: TIntegerField
      FieldName = 'CD_EMPRESA_CROSSDOCKING'
    end
    object _cdsPrePedidoNR_CROSSDOKING: TIntegerField
      FieldName = 'NR_CROSSDOKING'
    end
    object _cdsPrePedidoID_SEM_CROSSDOCKING: TStringField
      FieldName = 'ID_SEM_CROSSDOCKING'
      Size = 1
    end
  end
  object _opdLocalizaArquivo: TOpenDialog
    Filter = 
      'Arquivo Excel|*.XLS;*.XLSX|Arquivo Textol|*.txt|Arquivos Excel 2' +
      '013|*.XLSX|Arquivos LibreOffice|*.ods'
    Left = 504
  end
  object _dsEmpresa: TDataSource
    DataSet = _cdsEmpresa
    Left = 512
    Top = 96
  end
  object _cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 512
    Top = 40
  end
  object _dsPrePedido: TDataSource
    DataSet = _cdsPrePedido
    Left = 120
    Top = 144
  end
  object _cdsTabelaLeadTime: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 361
    Top = 40
  end
  object _dsTabelaLeadTime: TDataSource
    DataSet = _cdsTabelaLeadTime
    Left = 296
    Top = 72
  end
  object _cdsPeEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 56
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 587
    Top = 32
  end
  object _cdsItemListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 40
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 667
    Top = 40
  end
  object _cdsItensCurva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 753
    Top = 40
  end
  object _cdsDataUltimaCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 243
    Top = 200
  end
  object _cdsTotalizaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 1081
    Top = 32
  end
  object _dsTotalizaPedido: TDataSource
    DataSet = _cdsTotalizaPedido
    Left = 1089
    Top = 96
  end
  object _cdsVendaFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 200
  end
end
