inherited _frmRelacaoPedidos: T_frmRelacaoPedidos
  Left = 41
  Caption = 'Rela'#231#227'o de  Pedidos'
  ClientHeight = 582
  ClientWidth = 1201
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1217
  ExplicitHeight = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 563
    Width = 1201
    Panels = <
      item
        Text = '<F10> Cancela Pedido   <F5> Cancela Item'
        Width = 200
      end>
    ExplicitTop = 563
    ExplicitWidth = 1201
  end
  inherited GroupBox1: TGroupBox
    Width = 1201
    Height = 137
    Caption = 'Filtro Capa Pedido'
    ExplicitWidth = 1201
    ExplicitHeight = 137
    object Label1: TLabel
      Left = 27
      Top = 27
      Width = 43
      Height = 13
      Caption = 'Dt. Inicio'
    end
    object Label2: TLabel
      Left = 27
      Top = 53
      Width = 40
      Height = 13
      Caption = 'Dt. Final'
    end
    object Label3: TLabel
      Left = 174
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label4: TLabel
      Left = 173
      Top = 47
      Width = 55
      Height = 13
      Caption = 'Laboratorio'
    end
    object Label15: TLabel
      Left = 506
      Top = 7
      Width = 67
      Height = 13
      Caption = 'Lista de Pre'#231'o'
    end
    object Label16: TLabel
      Left = 240
      Top = 7
      Width = 50
      Height = 13
      Caption = 'Nr. Pedido'
    end
    object Label18: TLabel
      Left = 506
      Top = 48
      Width = 69
      Height = 13
      Caption = 'Pedidos do CD'
    end
    object Label17: TLabel
      Left = 240
      Top = 48
      Width = 61
      Height = 13
      Caption = 'Cod.Produto'
    end
    object _dtpDtInicio: TDateTimePicker
      Left = 82
      Top = 19
      Width = 81
      Height = 21
      Date = 41628.447833101860000000
      Time = 41628.447833101860000000
      TabOrder = 0
    end
    object _dtpDtFinal: TDateTimePicker
      Left = 82
      Top = 45
      Width = 81
      Height = 21
      Date = 41628.447833101860000000
      Time = 41628.447833101860000000
      TabOrder = 1
    end
    object _edtNumeroComprador: TEdit
      Left = 173
      Top = 22
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object _btnPesquisa: TBitBtn
      Left = 632
      Top = 61
      Width = 155
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&Mostra Pedidos'
      DoubleBuffered = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
        555555777777777FF5555500000000805555557777777777FF555550BBBBB008
        05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
        005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
        055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
        055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
        05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
        05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
        005555555775FFFF77F555555570000000555555555777777755}
      NumGlyphs = 2
      ParentBiDiMode = False
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = _btnPesquisa1Click
    end
    object _edtNumeroFornecedor: TEdit
      Left = 173
      Top = 61
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 4
    end
    object _rgStatus: TRadioGroup
      Left = 315
      Top = 3
      Width = 185
      Height = 128
      Caption = 'Situa'#231#227'o Pedido'
      Ctl3D = False
      ItemIndex = 2
      Items.Strings = (
        'Todos'
        'Faturados'
        'Novos'
        'Novos/Faturados/Pendentes'
        'Ped O.C.D em Transito'
        'Ped. Para An'#225'lise(API)'
        'Ped. Gerado API')
      ParentCtl3D = False
      TabOrder = 5
    end
    object _cbxListaPreco: TComboBox
      Left = 506
      Top = 22
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 6
      Text = 'Atual'
      Items.Strings = (
        'Atual'
        'Anterior')
    end
    object _rgFiltroItem: TRadioGroup
      Left = 632
      Top = 3
      Width = 185
      Height = 52
      Caption = 'Filtro Item'
      ItemIndex = 1
      Items.Strings = (
        'Todos'
        'Exclui Itens Cancelados')
      TabOrder = 7
      OnClick = _rgFiltroItemClick
    end
    object _grbAlerta: TGroupBox
      Left = 833
      Top = 3
      Width = 288
      Height = 53
      Caption = 'Aten'#231#227'o'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
      object Label13: TLabel
        Left = 13
        Top = 19
        Width = 242
        Height = 16
        Caption = 'Pedido Bonificado ou Com Itens Bonif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object _edtNrPedido: TEdit
      Left = 240
      Top = 21
      Width = 69
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 9
    end
    object _chkPedidoOCD: TCheckBox
      Left = 387
      Top = 22
      Width = 102
      Height = 17
      Caption = 'Pedidos O.C.D'
      TabOrder = 10
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 506
      Top = 67
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 11
      Text = 'CD SC e CD RS'
      Items.Strings = (
        'CD SC e CD RS'
        'CD Tubar'#227'o'
        'CS Sta Cruz do Sul')
    end
    object _edtCodigoProduto: TEdit
      Left = 240
      Top = 61
      Width = 69
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 12
    end
    object BitBtn1: TBitBtn
      Left = 878
      Top = 62
      Width = 152
      Height = 25
      Caption = 'Alterar pre'#231'o Pedido'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 13
      OnClick = BitBtn1Click
    end
  end
  inherited GroupBox2: TGroupBox
    Top = 137
    Width = 1201
    Height = 191
    Caption = 'Pedido(s)'
    ExplicitTop = 137
    ExplicitWidth = 1201
    ExplicitHeight = 191
    inherited DBGrid1: TDBGrid
      Width = 1197
      Height = 174
      Ctl3D = False
      DataSource = _dspedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnTitleClick = DBGrid1TitleClick
    end
  end
  inherited GroupBox3: TGroupBox
    Top = 489
    Width = 1201
    Height = 98
    Caption = 'Somat'#243'rios Pedidos'
    ExplicitTop = 489
    ExplicitWidth = 1201
    ExplicitHeight = 98
    object Label5: TLabel [0]
      Left = 9
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Nr. de Itens'
    end
    object Label6: TLabel [1]
      Left = 9
      Top = 55
      Width = 77
      Height = 13
      Caption = 'Nr. de Unidades'
    end
    object Label7: TLabel [2]
      Left = 109
      Top = 15
      Width = 113
      Height = 13
      Caption = 'Total P'#231'o Compra(CMV)'
    end
    object Label8: TLabel [3]
      Left = 109
      Top = 55
      Width = 102
      Height = 13
      Caption = 'Total P'#231'o Fornecedor'
    end
    object Label9: TLabel [4]
      Left = 352
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Nr. de Itens Fat.'
    end
    object Label10: TLabel [5]
      Left = 352
      Top = 55
      Width = 81
      Height = 13
      Caption = 'Nr. de Unid. Fat.'
    end
    object Label11: TLabel [6]
      Left = 459
      Top = 15
      Width = 104
      Height = 13
      Caption = 'Total  Fat. P'#231'o Comp.'
    end
    object Label12: TLabel [7]
      Left = 458
      Top = 55
      Width = 107
      Height = 13
      Caption = 'Total Fat. P'#231'o Fornec.'
    end
    object Label14: TLabel [8]
      Left = 227
      Top = 15
      Width = 80
      Height = 13
      Caption = 'Total P'#231'o Liquido'
    end
    inherited _btnExecuta: TBitBtn
      Left = 715
      Top = 18
      Width = 30
      Enabled = False
      Visible = False
      ExplicitLeft = 715
      ExplicitTop = 18
      ExplicitWidth = 30
    end
    inherited _bitFechar: TBitBtn
      Left = 1055
      Top = 70
      Width = 106
      ExplicitLeft = 1055
      ExplicitTop = 70
      ExplicitWidth = 106
    end
    inherited _btnParaExcel: TBitBtn
      Left = 856
      Top = 4
      Caption = 'Gera Excel Capa Ped. '
      Enabled = False
      OnClick = _btnParaExcelClick
      ExplicitLeft = 856
      ExplicitTop = 4
    end
    object _edtTotalItens: TEdit
      Left = 8
      Top = 30
      Width = 84
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object _edtNumerosUnidades: TEdit
      Left = 9
      Top = 70
      Width = 83
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object _edtTotalPedidoCompra: TEdit
      Left = 109
      Top = 30
      Width = 113
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object _edtTotalPedidoForncedor: TEdit
      Left = 109
      Top = 72
      Width = 113
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object _edtNumeroItensFaturado: TEdit
      Left = 352
      Top = 30
      Width = 93
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object _edtQuantidadeFaturada: TEdit
      Left = 352
      Top = 70
      Width = 94
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object _edtTotaFaturadoCompra: TEdit
      Left = 458
      Top = 30
      Width = 104
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object _edtTotalFaturaroFornec: TEdit
      Left = 458
      Top = 70
      Width = 104
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object _btnExcelPedido: TBitBtn
      Left = 856
      Top = 31
      Width = 129
      Height = 25
      Caption = 'Gera Excel Pedido'
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      ParentDoubleBuffered = False
      TabOrder = 11
      OnClick = _btnExcelPedidoClick
    end
    object DBGrid3: TDBGrid
      Left = 567
      Top = 10
      Width = 283
      Height = 82
      DataSource = _dsCondicaoPagamentos
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_PARCELAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_DIAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_PARCELAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_PARCELAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PAGAMENTOS'
          Visible = True
        end>
    end
    object _btnImprimir: TBitBtn
      Left = 991
      Top = 6
      Width = 112
      Height = 25
      Caption = 'Imprimir Rel.'
      DoubleBuffered = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
        000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
        0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
        7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
        0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
        0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
        FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      ParentDoubleBuffered = False
      TabOrder = 13
      OnClick = _btnImprimirClick
    end
    object _chkRelatorioPrecoCusto: TCheckBox
      Left = 885
      Top = 57
      Width = 145
      Height = 17
      Caption = 'Relatorio C/Preco Custo'
      TabOrder = 14
    end
    object _chkMostraDesconto: TCheckBox
      Left = 885
      Top = 74
      Width = 164
      Height = 17
      Caption = ' Mostra Coluna % Desc.'
      Checked = True
      State = cbChecked
      TabOrder = 15
    end
    object _chkSomenteItemAtivos: TCheckBox
      Left = 1021
      Top = 51
      Width = 145
      Height = 17
      Caption = 'Lista Somente Itens Ativos'
      TabOrder = 16
      OnClick = _chkSomenteItemAtivosClick
    end
    object _edtTotalPedidoLiquido: TEdit
      Left = 228
      Top = 30
      Width = 113
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 17
    end
  end
  object GroupBox4: TGroupBox [4]
    Left = 0
    Top = 328
    Width = 1201
    Height = 161
    Align = alTop
    Caption = 'Item Pedido(s)'
    TabOrder = 4
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1197
      Height = 144
      Align = alClient
      Ctl3D = False
      DataSource = _dsItemPedido
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPedidoDrawColumnCell
      OnKeyDown = _dbgItemPedidoKeyDown
      OnTitleClick = _dbgItemPedidoTitleClick
    end
  end
  inherited _cdsBase: TClientDataSet
    Left = 632
    Top = 88
  end
  inherited dsBase: TDataSource
    DataSet = _cdsBase
    Left = 832
    Top = 8
  end
  object _cdsPedido: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'NR_TOTAL_ITENS'
        Expression = 'SUM(NR_ITENS)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 600
    Top = 160
    object _cdsPedidoNR_TOTAL_ITENS: TAggregateField
      FieldName = 'NR_TOTAL_ITENS'
      Visible = True
      Active = True
      Expression = 'SUM(NR_ITENS)'
    end
    object _cdsPedidoNR_TOTAL_UNIDADES: TAggregateField
      FieldName = 'NR_TOTAL_UNIDADES'
      Active = True
      Expression = 'SUM(NR_UNIDADES)'
    end
    object _cdsPedidoVL_PEDIDO_FORNECEDOR: TAggregateField
      FieldName = 'VL_PEDIDO_FORNECEDOR'
      Active = True
      Expression = 'SUM(VL_PEDIDO_FABR)'
    end
    object _cdsPedidoVL_PEDIDO_CUSTO: TAggregateField
      FieldName = 'VL_PEDIDO_CUSTO'
      Active = True
      Expression = 'SUM(VL_PEDIDO_CUSTO)'
    end
    object _cdsPedidoNR_UNIDADES_FAT: TAggregateField
      FieldName = 'NR_UNIDADES_FAT'
      Active = True
      Expression = 'SUM(NR_FATURADO)'
    end
    object _cdsPedidoQT_UNIDADES_FAT: TAggregateField
      FieldName = 'QT_UNIDADES_FAT'
      Active = True
      Expression = 'SUM(QT_FATURADO)'
    end
    object _cdsPedidoVL_FATURADO_CUSTO: TAggregateField
      FieldName = 'VL_FATURADO_CUSTO'
      Active = True
      Expression = 'SUM(VL_PEDIDO_FAT)'
    end
    object _cdsPedidoVL_FATURADO_FORNEC: TAggregateField
      FieldName = 'VL_FATURADO_FORNEC'
      Active = True
      Expression = 'SUM(VL_PED_FAT_FABR)'
    end
    object _cdsPedidoVL_PED_LIQUIDO: TAggregateField
      FieldName = 'VL_PED_LIQUIDO'
      Active = True
      Expression = 'SUM(VL_PED_LIQ)'
    end
    object _cdsPedidoVL_FATURADO_LIQUIDO: TAggregateField
      FieldName = 'VL_FATURADO_LIQUIDO'
      Active = True
      Expression = 'SUM(VL_PED_FAT_LIQ)'
    end
  end
  object _dspedido: TDataSource
    DataSet = _cdsPedido
    OnDataChange = _dspedidoDataChange
    Left = 608
    Top = 216
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 728
    Top = 160
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    OnStateChange = _dsItemPedidoStateChange
    Left = 736
    Top = 200
  end
  object _cdsCondicaoPagamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 565
    Top = 368
    object _cdsCondicaoPagamentosNR_PARCELAS: TAutoIncField
      DisplayLabel = 'Parcela'
      DisplayWidth = 5
      FieldName = 'NR_PARCELAS'
    end
    object _cdsCondicaoPagamentosNR_DIAS: TIntegerField
      DisplayLabel = 'Nr. Dias'
      FieldName = 'NR_DIAS'
      DisplayFormat = '##0'
    end
    object _cdsCondicaoPagamentosPC_PARCELAS: TFloatField
      DisplayLabel = '% Parc.'
      DisplayWidth = 5
      FieldName = 'PC_PARCELAS'
      Visible = False
      DisplayFormat = '##0.00'
    end
    object _cdsCondicaoPagamentosVL_PARCELAS: TFloatField
      DisplayLabel = 'Vl. Pagamentos'
      FieldName = 'VL_PARCELAS'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsCondicaoPagamentosDT_PAGAMENTOS: TDateField
      DisplayLabel = 'Dt. Venc.'
      FieldName = 'DT_PAGAMENTOS'
      Visible = False
    end
  end
  object _dsCondicaoPagamentos: TDataSource
    DataSet = _cdsCondicaoPagamentos
    Left = 664
    Top = 368
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 168
  end
  object _cdsItemListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 880
    Top = 144
  end
end
