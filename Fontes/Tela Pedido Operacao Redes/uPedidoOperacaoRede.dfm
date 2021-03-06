object _frmPedidosRedes: T_frmPedidosRedes
  Left = 0
  Top = 0
  Caption = 'Pedidos Redes'
  ClientHeight = 580
  ClientWidth = 1212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _stbMessagem: TStatusBar
    Left = 0
    Top = 561
    Width = 1212
    Height = 19
    Panels = <>
  end
  object _grbFiltroRede: TGroupBox
    Left = 0
    Top = 0
    Width = 1212
    Height = 89
    Align = alTop
    Caption = 'Filtro Redes'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 26
      Width = 43
      Height = 13
      Caption = 'Dt. Inicio'
    end
    object Label4: TLabel
      Left = 8
      Top = 52
      Width = 40
      Height = 13
      Caption = 'Dt. Final'
    end
    object Label5: TLabel
      Left = 540
      Top = 43
      Width = 55
      Height = 13
      Caption = 'Laboratorio'
    end
    object Label6: TLabel
      Left = 540
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label1: TLabel
      Left = 166
      Top = 12
      Width = 91
      Height = 13
      Caption = 'Pedidos Op. Redes'
    end
    object _dtpDtInicio: TDateTimePicker
      Left = 63
      Top = 18
      Width = 81
      Height = 21
      Date = 41628.447833101860000000
      Time = 41628.447833101860000000
      TabOrder = 0
    end
    object _dtpDtFinal: TDateTimePicker
      Left = 63
      Top = 44
      Width = 81
      Height = 21
      Date = 41628.447833101860000000
      Time = 41628.447833101860000000
      TabOrder = 1
    end
    object _edtNumeroComprador: TEdit
      Left = 541
      Top = 23
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object _edtNumeroFornecedor: TEdit
      Left = 540
      Top = 57
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 3
    end
    object _rgStatus: TRadioGroup
      Left = 614
      Top = 0
      Width = 185
      Height = 79
      Caption = 'Situa'#231#227'o Pedido'
      Ctl3D = False
      ItemIndex = 2
      Items.Strings = (
        'Todos'
        'Faturados'
        'Novos'
        'Novos/Faturados/Pendentes')
      ParentCtl3D = False
      TabOrder = 4
    end
    object _btnPesquisa: TBitBtn
      Left = 322
      Top = 58
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
      TabOrder = 5
      OnClick = _btnPesquisaClick
    end
    object _cbxOperacaoRede: TComboBox
      Left = 166
      Top = 26
      Width = 209
      Height = 21
      TabOrder = 6
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 280
    Width = 1212
    Height = 161
    Align = alTop
    Caption = 'Item Pedido(s)'
    TabOrder = 2
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1208
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
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 89
    Width = 1212
    Height = 191
    Align = alTop
    Caption = 'Pedido(s)'
    TabOrder = 3
    object _dbgCapaPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1208
      Height = 174
      Align = alClient
      Ctl3D = False
      DataSource = _dspedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = _dbgCapaPedidoCellClick
      OnDrawColumnCell = _dbgCapaPedidoDrawColumnCell
      OnDblClick = _dbgCapaPedidoDblClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 441
    Width = 1212
    Height = 131
    Align = alTop
    Caption = 'Somat'#243'rios Pedidos'
    TabOrder = 4
    object Label7: TLabel
      Left = 9
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Nr. de Itens'
    end
    object Label8: TLabel
      Left = 9
      Top = 55
      Width = 77
      Height = 13
      Caption = 'Nr. de Unidades'
    end
    object Label9: TLabel
      Left = 109
      Top = 15
      Width = 113
      Height = 13
      Caption = 'Total P'#231'o Compra(CMV)'
    end
    object Label10: TLabel
      Left = 109
      Top = 55
      Width = 102
      Height = 13
      Caption = 'Total P'#231'o Fornecedor'
    end
    object Label11: TLabel
      Left = 352
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Nr. de Itens Fat.'
    end
    object Label12: TLabel
      Left = 352
      Top = 55
      Width = 81
      Height = 13
      Caption = 'Nr. de Unid. Fat.'
    end
    object Label13: TLabel
      Left = 459
      Top = 15
      Width = 104
      Height = 13
      Caption = 'Total  Fat. P'#231'o Comp.'
    end
    object Label14: TLabel
      Left = 458
      Top = 55
      Width = 107
      Height = 13
      Caption = 'Total Fat. P'#231'o Fornec.'
    end
    object Label15: TLabel
      Left = 227
      Top = 15
      Width = 80
      Height = 13
      Caption = 'Total P'#231'o Liquido'
    end
    object _btnExecuta: TBitBtn
      Left = 915
      Top = 18
      Width = 15
      Height = 25
      Caption = 'Executa'
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      Visible = False
    end
    object _bitFechar: TBitBtn
      Left = 1087
      Top = 70
      Width = 106
      Height = 25
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
      TabOrder = 1
      OnClick = _bitFecharClick
    end
    object _btnParaExcel: TBitBtn
      Left = 936
      Top = 3
      Width = 129
      Height = 25
      Caption = 'Gera Excel Capa Ped. '
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
      TabOrder = 2
      OnClick = _btnParaExcelClick
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
      Left = 936
      Top = 28
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
      Width = 314
      Height = 104
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
      Left = 1071
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
    end
    object _chkRelatorioPrecoCusto: TCheckBox
      Left = 917
      Top = 59
      Width = 145
      Height = 17
      Caption = 'Relatorio C/Preco Custo'
      TabOrder = 14
    end
    object _chkMostraDesconto: TCheckBox
      Left = 917
      Top = 76
      Width = 164
      Height = 17
      Caption = ' Mostra Coluna % Desc.'
      Checked = True
      State = cbChecked
      TabOrder = 15
    end
    object _chkSomenteItemAtivos: TCheckBox
      Left = 1053
      Top = 53
      Width = 145
      Height = 17
      Caption = 'Lista Somente Itens Ativos'
      TabOrder = 16
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
  object _dspedido: TDataSource
    DataSet = _cdsPedido
    OnDataChange = _dspedidoDataChange
    Left = 608
    Top = 216
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
    Left = 736
    Top = 200
  end
  object _cdsCondicaoPagamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 589
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
    Left = 648
    Top = 368
  end
end
