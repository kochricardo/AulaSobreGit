object _frmItensNaoAtendidos: T_frmItensNaoAtendidos
  Left = 0
  Top = 0
  Caption = 'Itens N'#227'o atendidos Pelo Fornecedor'
  ClientHeight = 485
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 957
    Height = 90
    Align = alTop
    Caption = 'Filtro Capa Pedido'
    TabOrder = 0
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
      Left = 203
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label4: TLabel
      Left = 188
      Top = 46
      Width = 55
      Height = 13
      Caption = 'Laboratorio'
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
      Left = 189
      Top = 24
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object _btnPesquisa: TBitBtn
      Left = 453
      Top = 59
      Width = 155
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&Mostra Itens'
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
      OnClick = _btnPesquisaClick
    end
    object _edtNumeroFornecedor: TEdit
      Left = 188
      Top = 65
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 4
    end
    object _rgStatus: TRadioGroup
      Left = 262
      Top = 8
      Width = 185
      Height = 79
      Caption = 'Situa'#231#227'o do Itens'
      Ctl3D = False
      ItemIndex = 0
      Items.Strings = (
        'Itens N'#227'o Atendidos'
        'Itens Cancelados')
      ParentCtl3D = False
      TabOrder = 5
    end
    object _grbAlerta: TGroupBox
      Left = 639
      Top = 34
      Width = 288
      Height = 53
      Caption = 'Aten'#231#227'o'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
      object _lbeAlerta: TLabel
        Left = 21
        Top = 24
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
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 90
    Width = 957
    Height = 287
    Align = alTop
    Caption = 'Pedido(s)'
    TabOrder = 1
    object _dbgItemPendentes: TDBGrid
      Left = 2
      Top = 15
      Width = 953
      Height = 270
      Align = alClient
      Ctl3D = False
      DataSource = _dsItemPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPendentesDrawColumnCell
      OnTitleClick = _dbgItemPendentesTitleClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 466
    Width = 957
    Height = 19
    Panels = <
      item
        Width = 350
      end>
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 377
    Width = 957
    Height = 85
    Align = alTop
    Caption = 'Totalizador'
    TabOrder = 3
    object Label7: TLabel
      Left = 214
      Top = 11
      Width = 138
      Height = 13
      Caption = 'Total Ped. P'#231'o Compra(CMV)'
    end
    object Label5: TLabel
      Left = 27
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Nr. de Itens'
    end
    object Label6: TLabel
      Left = 375
      Top = 12
      Width = 127
      Height = 13
      Caption = 'Total Ped. P'#231'o Fornecedor'
    end
    object Label8: TLabel
      Left = 122
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Total Unidades'
    end
    object _btnExceItensNaoAtendido: TBitBtn
      Left = 808
      Top = 50
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
      TabOrder = 0
      OnClick = _btnExceItensNaoAtendidoClick
    end
    object _edtTotalItendCompra: TEdit
      Left = 214
      Top = 28
      Width = 140
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object _edtNumerosItens: TEdit
      Left = 27
      Top = 28
      Width = 90
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object _edtVtPrecoFornecedor: TEdit
      Left = 373
      Top = 28
      Width = 140
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object _edtTotalUnidades: TEdit
      Left = 122
      Top = 28
      Width = 90
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 552
    Top = 152
    object _cdsItemPedidoNR_TOTAL_DE_ITENS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'NR_TOTAL_DE_ITENS'
      Active = True
      Expression = 'COUNT(*)'
    end
    object _cdsItemPedidoVT_ITENS_PRECO_FORNECEDOR: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_ITENS_PRECO_FORNECEDOR'
      Active = True
      Expression = 'SUM(PFBY_Y*QT_PEDIDO)'
    end
    object _cdsItemPedidoVT_ITENS_PEDIDO_CUSTO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_ITENS_PEDIDO_CUSTO'
      Active = True
      Expression = 'SUM(VCCI_Y*QT_PEDIDO)'
    end
    object _cdsItemPedidoNR_TOTAL_UNIDADES: TAggregateField
      Alignment = taRightJustify
      FieldName = 'NR_TOTAL_UNIDADES'
      Active = True
      Expression = 'SUM(QT_PEDIDO)'
    end
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    OnDataChange = _dsItemPedidoDataChange
    Left = 632
    Top = 152
  end
end
