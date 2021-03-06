object _frmAplicarVerbaPedido: T_frmAplicarVerbaPedido
  Left = 0
  Top = 0
  Caption = 'Aplicar Verba em Pedido'
  ClientHeight = 608
  ClientWidth = 854
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 589
    Width = 854
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 854
    Height = 90
    Align = alTop
    Caption = 'Filtro Capa Pedido'
    TabOrder = 1
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
      Left = 189
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label4: TLabel
      Left = 189
      Top = 46
      Width = 55
      Height = 13
      Caption = 'Laboratorio'
    end
    object Label5: TLabel
      Left = 453
      Top = 7
      Width = 47
      Height = 13
      Caption = 'Nr.Pedido'
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
      Top = 21
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object _edtNumeroFornecedor: TEdit
      Left = 189
      Top = 62
      Width = 57
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 3
    end
    object _rgStatus: TRadioGroup
      Left = 262
      Top = 8
      Width = 185
      Height = 79
      Caption = 'Situa'#231#227'o Pedido'
      Ctl3D = False
      Enabled = False
      ItemIndex = 2
      Items.Strings = (
        'Todos'
        'Faturados'
        'Novos'
        'Novos/Faturados/Pendentes')
      ParentCtl3D = False
      TabOrder = 5
    end
    object _btnMostraPedidos: TBitBtn
      Left = 453
      Top = 59
      Width = 155
      Height = 25
      Caption = 'Mostra Pedidos'
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = _btnMostraPedidosClick
    end
    object _edtNrPedido: TEdit
      Left = 453
      Top = 21
      Width = 72
      Height = 19
      Ctl3D = False
      MaxLength = 6
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 90
    Width = 854
    Height = 191
    Align = alTop
    Caption = 'Pedido(s)'
    TabOrder = 2
    object _dbgcapaPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 850
      Height = 174
      Align = alClient
      Ctl3D = False
      DataSource = _dspedido
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = _dbgcapaPedidoDblClick
      OnKeyDown = _dbgcapaPedidoKeyDown
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 281
    Width = 854
    Height = 161
    Align = alTop
    Caption = 'Item Pedido(s)'
    TabOrder = 3
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 850
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
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 442
    Width = 854
    Height = 144
    Align = alTop
    Caption = 'Dados Para Verba no Pedido'
    TabOrder = 4
    object Label6: TLabel
      Left = 120
      Top = 61
      Width = 43
      Height = 13
      Caption = 'Nr.Verba'
    end
    object Label7: TLabel
      Left = 225
      Top = 61
      Width = 80
      Height = 13
      Caption = 'Valor Para Verba'
    end
    object Label8: TLabel
      Left = 120
      Top = 104
      Width = 52
      Height = 13
      Caption = '% P/Verba'
    end
    object Label9: TLabel
      Left = 372
      Top = 70
      Width = 117
      Height = 13
      Caption = 'Valor de Verba calculado'
    end
    object _rgTipoDesconto: TRadioGroup
      Left = 120
      Top = 17
      Width = 185
      Height = 42
      Caption = 'Tipo de Desconto'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Valor'
        '% &P/ Verba')
      TabOrder = 0
      OnClick = _rgTipoDescontoClick
    end
    object _btnTesteValor: TBitBtn
      Left = 372
      Top = 17
      Width = 165
      Height = 25
      Caption = 'Aplicar Valores no Pedido'
      DoubleBuffered = True
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333FFFFFFFFF333333333300000000033333333333888888
        888F33333333330BFBFBFB03333FFFFFFF8F3FFFFF8F33000000000F88888F03
        33888888888F8888838F307F7F7F7F0BFBFBFB0338F33333338F333FFF8F30F7
        F7F7F70F77888F0338F33333338FFF88838F307F7F7F74444BFBFB0338F33333
        38888F3FFF8F30F7F7F7F7C447888F0338F3333333888F88838F307F7F7F744C
        4BFBFB0338F3333338888F333F8F30F7F7F7444F4FFF880338F33333888F8333
        8883307F7F74440BFBFB803338F33338888FFFFF883330F7F744470000000333
        38F33388838888888333307F7F747F7F0333333338F3333833338F33333330F7
        F7F7F7F70333333338F3333333338F333333307F7F7F7F7F0333333338F33FFF
        FFF38F33333330F7444444F703333333383F888888FF833333333300ECCCC400
        33333333338838888888333333333333ECCCC433333333333333388888333333
        333333333EEEE333333333333333333333333333333333333333333333333333
        33333333333333333333}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = _btnTesteValorClick
    end
    object _edtValorVerba: TEdit
      Left = 372
      Top = 85
      Width = 133
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object _edtValorParaverba: TEdit
      Left = 225
      Top = 80
      Width = 84
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnKeyDown = _edtValorParaverbaKeyDown
    end
    object _edtPcVerba: TEdit
      Left = 120
      Top = 122
      Width = 71
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 4
    end
    object _edtNumeroVerba: TEdit
      Left = 120
      Top = 78
      Width = 71
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnKeyDown = Edit1KeyDown
    end
    object _btnImprimir: TBitBtn
      Left = 669
      Top = 105
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
      TabOrder = 6
      OnClick = _btnImprimirClick
    end
    object _chkRelatorioPrecoCusto: TCheckBox
      Left = 668
      Top = 59
      Width = 145
      Height = 17
      Caption = 'Relatorio C/Preco Custo'
      TabOrder = 7
    end
    object _chkMostraDesconto: TCheckBox
      Left = 668
      Top = 82
      Width = 164
      Height = 17
      Caption = 'Mostra Coluna % Desc.'
      TabOrder = 8
    end
    object _chkMantemDesconto: TCheckBox
      Left = 372
      Top = 48
      Width = 165
      Height = 17
      Caption = 'Manter Desc. Adicional do Pedido'
      TabOrder = 9
    end
  end
  object _dspedido: TDataSource
    DataSet = _cdsPedido
    OnDataChange = _dspedidoDataChange
    Left = 696
    Top = 56
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
    Left = 696
    Top = 16
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
      Expression = 'SUM(VL_PEDIDO)'
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
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    Left = 760
    Top = 64
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 768
    Top = 16
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 731
    Top = 325
  end
  object _cdsItemListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 336
  end
end
