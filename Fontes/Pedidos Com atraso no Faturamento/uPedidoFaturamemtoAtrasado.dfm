object _frmPedidosFaturamentoAtrasados: T_frmPedidosFaturamentoAtrasados
  Left = 0
  Top = 0
  Caption = 'Pedidos com Faturamento na Industria Atrasado '
  ClientHeight = 417
  ClientWidth = 928
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 398
    Width = 928
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 928
    Height = 297
    Align = alTop
    Caption = 'Pedidos'
    TabOrder = 1
    object _dbgPedidosAtrasado: TDBGrid
      Left = 2
      Top = 15
      Width = 924
      Height = 280
      Align = alClient
      DataSource = _dsPedidosFaturamentoAtrasado
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPedidosAtrasadoDrawColumnCell
      OnTitleClick = _dbgPedidosAtrasadoTitleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 297
    Width = 928
    Height = 105
    Align = alTop
    Caption = 'Totais'
    TabOrder = 2
    object Label1: TLabel
      Left = 118
      Top = 56
      Width = 104
      Height = 13
      Caption = 'Qtd. Unidades Pedido'
    end
    object Label2: TLabel
      Left = 245
      Top = 4
      Width = 97
      Height = 13
      Caption = 'Valor Total de Custo'
    end
    object Label3: TLabel
      Left = 247
      Top = 55
      Width = 112
      Height = 13
      Caption = 'Valor Total  Fornecedor'
    end
    object Label4: TLabel
      Left = 1
      Top = 38
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label5: TLabel
      Left = 118
      Top = 5
      Width = 58
      Height = 13
      Caption = 'Nr. de Itens'
    end
    object _edtQtdUnidades: TEdit
      Left = 118
      Top = 74
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
    object _edtValorCusto: TEdit
      Left = 245
      Top = 23
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
    end
    object _edtValorFornecedor: TEdit
      Left = 245
      Top = 74
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
    end
    object _btnFechar: TBitBtn
      Left = 812
      Top = 56
      Width = 113
      Height = 25
      Caption = 'Fechar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = _btnFecharClick
    end
    object _btnParaExcel: TBitBtn
      Left = 661
      Top = 56
      Width = 145
      Height = 26
      Caption = 'Gerar Excel   '
      DoubleBuffered = True
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
      TabOrder = 4
      OnClick = _btnParaExcelClick
    end
    object _edtNumeroComprador: TEdit
      Left = 1
      Top = 56
      Width = 108
      Height = 21
      Alignment = taRightJustify
      TabOrder = 5
      OnKeyDown = _edtNumeroCompradorKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 510
      Top = 56
      Width = 145
      Height = 26
      Caption = 'Gerar Relat'#243'rio'
      DoubleBuffered = True
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
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object _edtNumeroItens: TEdit
      Left = 118
      Top = 23
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 7
    end
    object _chkListaPedidoRedes: TCheckBox
      Left = 520
      Top = 24
      Width = 177
      Height = 17
      Caption = 'Somente Pedido Op.Redes'
      TabOrder = 8
    end
  end
  object _dsPedidosFaturamentoAtrasado: TDataSource
    Left = 600
    Top = 104
  end
  object _cdsPedidosFaturamentoAtrasado: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 376
    Top = 120
    object _cdsPedidosFaturamentoAtrasadoQT_PEDIDO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'QT_PEDIDO'
      Active = True
      Expression = 'SUM(QT_PEDIDO)'
    end
    object _cdsPedidosFaturamentoAtrasadoVT_PEDIDO_CUSTO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_PEDIDO_CUSTO'
      Active = True
      Expression = 'SUM(VT_CUSTO)'
    end
    object _cdsPedidosFaturamentoAtrasadoVT_PEDIDO_FORNECEDOR: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_PEDIDO_FORNECEDOR'
      Active = True
      Expression = 'SUM( VT_FORNECEDOR)'
    end
    object _cdsPedidosFaturamentoAtrasadoTOTAL_DE_ITENS: TAggregateField
      FieldName = 'TOTAL_DE_ITENS'
      Active = True
      Expression = 'sum(NR_ITEM)'
    end
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 368
    Top = 64
  end
end
