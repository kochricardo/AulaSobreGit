object _frmDadosProduto: T_frmDadosProduto
  Left = 0
  Top = 0
  Caption = 'Consulta Produto'
  ClientHeight = 597
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 532
    Width = 71
    Height = 13
    Caption = 'Reserva Probl.'
  end
  object Label2: TLabel
    Left = 125
    Top = 532
    Width = 75
    Height = 13
    Caption = 'Reserva Pedido'
  end
  object Label3: TLabel
    Left = 341
    Top = 532
    Width = 80
    Height = 13
    Caption = 'Reserva Vencido'
  end
  object Label4: TLabel
    Left = 24
    Top = 532
    Width = 68
    Height = 13
    Caption = 'Estoque Fisico'
  end
  object Label5: TLabel
    Left = 24
    Top = 488
    Width = 98
    Height = 13
    Caption = 'Valor Est. Financeiro'
  end
  object Label6: TLabel
    Left = 240
    Top = 489
    Width = 56
    Height = 13
    Caption = 'Taxa de IPI'
  end
  object Label7: TLabel
    Left = 240
    Top = 408
    Width = 94
    Height = 13
    Caption = 'Embalagem Compra'
  end
  object Label8: TLabel
    Left = 24
    Top = 411
    Width = 87
    Height = 13
    Caption = 'Embalagem Venda'
  end
  object Label9: TLabel
    Left = 240
    Top = 370
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Compra'
  end
  object Label10: TLabel
    Left = 24
    Top = 370
    Width = 122
    Height = 13
    Caption = 'Desconto Padr'#227'o Compra'
  end
  object Label11: TLabel
    Left = 240
    Top = 328
    Width = 103
    Height = 13
    Caption = 'Pre'#231'o de venda Atual'
  end
  object Label12: TLabel
    Left = 24
    Top = 328
    Width = 117
    Height = 13
    Caption = 'Pre'#231'o de venda Anterior'
  end
  object Label18: TLabel
    Left = 24
    Top = 3
    Width = 83
    Height = 13
    Caption = 'Consulta Produto'
  end
  object Label13: TLabel
    Left = 24
    Top = 448
    Width = 29
    Height = 13
    Caption = 'Curva'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 578
    Width = 912
    Height = 19
    Panels = <>
  end
  object _lbeCodigoProduto: TLabeledEdit
    Left = 23
    Top = 59
    Width = 77
    Height = 19
    Ctl3D = False
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Codigo Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnKeyDown = _lbeCodigoProdutoKeyDown
  end
  object _lbeProdutoApresentacao: TLabeledEdit
    Left = 104
    Top = 59
    Width = 317
    Height = 19
    Ctl3D = False
    EditLabel.Width = 109
    EditLabel.Height = 13
    EditLabel.Caption = 'Produto/Apresentacao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object _lbeCipado: TLabeledEdit
    Left = 24
    Top = 145
    Width = 82
    Height = 19
    Ctl3D = False
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cipado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object _lbeCdInternoLaboratorio: TLabeledEdit
    Left = 24
    Top = 188
    Width = 185
    Height = 19
    Ctl3D = False
    EditLabel.Width = 106
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo no Laboratorio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object _lbeCompradorMes: TLabeledEdit
    Left = 24
    Top = 225
    Width = 185
    Height = 19
    Ctl3D = False
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'Compras no M'#234's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
    TextHint = 'Entrada no Mes'
    Visible = False
  end
  object _lbeMudancaPreco: TLabeledEdit
    Left = 24
    Top = 265
    Width = 185
    Height = 19
    Ctl3D = False
    EditLabel.Width = 120
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Mundan'#231'a de Pre'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object _lbeUltEntrada: TLabeledEdit
    Left = 24
    Top = 305
    Width = 185
    Height = 19
    Ctl3D = False
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Ultima Entrada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object _lbeUltimaSaida: TLabeledEdit
    Left = 240
    Top = 305
    Width = 181
    Height = 19
    Ctl3D = False
    EditLabel.Width = 84
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Ultima Saida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object _lbeFinalidade: TLabeledEdit
    Left = 240
    Top = 188
    Width = 181
    Height = 19
    Ctl3D = False
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Finalidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
  end
  object _lbeLaboratorio: TLabeledEdit
    Left = 24
    Top = 97
    Width = 397
    Height = 19
    Ctl3D = False
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Laborat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 10
  end
  object _lbeLinha: TLabeledEdit
    Left = 240
    Top = 225
    Width = 181
    Height = 19
    Ctl3D = False
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Linha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 11
  end
  object _lbeLocalizacao: TLabeledEdit
    Left = 240
    Top = 265
    Width = 181
    Height = 19
    Ctl3D = False
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Localiza'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 12
  end
  object _lbeRepasseIcms: TLabeledEdit
    Left = 127
    Top = 145
    Width = 82
    Height = 19
    Ctl3D = False
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Repassa ICMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 13
  end
  object _lbeRetemIcms: TLabeledEdit
    Left = 240
    Top = 145
    Width = 82
    Height = 19
    Ctl3D = False
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Retem ICMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 14
  end
  object _lbeSuperfulo: TLabeledEdit
    Left = 339
    Top = 145
    Width = 82
    Height = 19
    Ctl3D = False
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Superfulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 15
  end
  object _lbeUnidadeMedida: TLabeledEdit
    Left = 240
    Top = 465
    Width = 181
    Height = 19
    Ctl3D = False
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 16
  end
  object _edtEstoqueProblematico: TEdit
    Left = 240
    Top = 549
    Width = 81
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 17
  end
  object _edtReservaPedido: TEdit
    Left = 125
    Top = 549
    Width = 81
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 18
  end
  object _edtReservaVencido: TEdit
    Left = 341
    Top = 549
    Width = 81
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 19
  end
  object _edtEstoqueFisico: TEdit
    Left = 24
    Top = 549
    Width = 81
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 20
  end
  object _edtValorEstoqueFinanceiro: TEdit
    Left = 24
    Top = 504
    Width = 182
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 21
  end
  object _edtTaxaIPI: TEdit
    Left = 240
    Top = 504
    Width = 181
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 22
  end
  object _edtEmbalagemCompra: TEdit
    Left = 240
    Top = 425
    Width = 181
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 23
  end
  object _edtEmbalagemVenda: TEdit
    Left = 24
    Top = 425
    Width = 185
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 24
  end
  object _edtPrecoCompra: TEdit
    Left = 240
    Top = 386
    Width = 181
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 25
  end
  object _edtdescontoPadrao: TEdit
    Left = 24
    Top = 386
    Width = 185
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 26
  end
  object _edtPrecoAtual: TEdit
    Left = 240
    Top = 343
    Width = 181
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 27
  end
  object _edtPrecoVendaAnterior: TEdit
    Left = 24
    Top = 343
    Width = 185
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 28
  end
  object _cbxOpcaoCDs: TComboBox
    Left = 24
    Top = 18
    Width = 140
    Height = 21
    Ctl3D = False
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 29
    Text = 'CD Tubar'#227'o'
    OnKeyDown = _lbeCodigoProdutoKeyDown
    Items.Strings = (
      'CD Tubar'#227'o'
      'CD Sta Cruz do Sul')
  end
  object _edtCurva: TEdit
    Left = 24
    Top = 465
    Width = 182
    Height = 19
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 30
  end
  object _chtVendas: TChart
    Left = 432
    Top = 387
    Width = 466
    Height = 190
    Legend.Visible = False
    Title.Text.Strings = (
      'Posi'#231#227'o Venda CD SC'
      '')
    TabOrder = 31
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Emboss.Color = 8487297
      Marks.Shadow.Color = 8487297
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clTeal
      ShowInLegend = False
      Title = 'SerieVendaSC'
      ValueFormat = '#,##0'
      MultiBar = mbNone
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object _chtEntradas: TChart
    Left = 432
    Top = 195
    Width = 466
    Height = 190
    Legend.Visible = False
    Title.Text.Strings = (
      'Posi'#231#227'o Venda CD SC'
      '')
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Maximum = 0.500000000000000000
    DepthAxis.Minimum = -0.500000000000000100
    DepthTopAxis.Automatic = False
    DepthTopAxis.AutomaticMaximum = False
    DepthTopAxis.AutomaticMinimum = False
    DepthTopAxis.Maximum = 0.500000000000000000
    DepthTopAxis.Minimum = -0.500000000000000100
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 785.000000000000000000
    LeftAxis.Minimum = 0.000000000000390799
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    TabOrder = 32
    ColorPaletteIndex = 13
    object BarSeries1: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Emboss.Color = 8487297
      Marks.Shadow.Color = 8487297
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clTeal
      ShowInLegend = False
      Title = 'SerieEntradas'
      ValueFormat = '#,##0'
      MultiBar = mbNone
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object _chtPedidos: TChart
    Left = 432
    Top = 3
    Width = 466
    Height = 190
    Legend.Visible = False
    Title.Text.Strings = (
      'Posi'#231#227'o Venda CD SC'
      '')
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Maximum = 0.500000000000000000
    DepthAxis.Minimum = -0.500000000000000100
    DepthTopAxis.Automatic = False
    DepthTopAxis.AutomaticMaximum = False
    DepthTopAxis.AutomaticMinimum = False
    DepthTopAxis.Maximum = 0.500000000000000000
    DepthTopAxis.Minimum = -0.500000000000000100
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 785.000000000000000000
    LeftAxis.Minimum = 0.000000000000390799
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    TabOrder = 33
    ColorPaletteIndex = 13
    object BarSeries2: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Emboss.Color = 8487297
      Marks.Shadow.Color = 8487297
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clTeal
      ShowInLegend = False
      Title = 'SeriePedidos'
      ValueFormat = '#,##0'
      MultiBar = mbNone
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object BitBtn1: TBitBtn
    Left = 351
    Top = 8
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 34
    Visible = False
    OnClick = BitBtn1Click
  end
  object _lbeSituacao: TLabeledEdit
    Left = 170
    Top = 19
    Width = 181
    Height = 19
    Ctl3D = False
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'Situa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 35
  end
  object _cdsVendasProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 400
  end
  object _dsVendasProduto: TDataSource
    DataSet = _cdsVendasProduto
    Left = 512
    Top = 400
  end
  object _cdsEntradas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 208
  end
  object _cdsUltimospedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 452
    Top = 16
  end
end
