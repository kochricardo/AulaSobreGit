object _frmGraficoPedidoVendas: T_frmGraficoPedidoVendas
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Grafico Pedido Vendas'
  ClientHeight = 489
  ClientWidth = 1276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMinimized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 320
  ExplicitHeight = 240
  DesignSize = (
    1276
    489)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 299
    Top = 101
    Width = 78
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'M'#233'dia Diaria SC.'
  end
  object Label2: TLabel
    Left = 967
    Top = 101
    Width = 78
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'M'#233'dia Diaria RS.'
  end
  object Label3: TLabel
    Left = 699
    Top = 101
    Width = 77
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Venda Ult 3 Mes'
  end
  object Label4: TLabel
    Left = 25
    Top = 101
    Width = 77
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Venda Ult 3 Mes'
  end
  object Label5: TLabel
    Left = 795
    Top = 101
    Width = 71
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Nr. Dias Venda'
  end
  object Label6: TLabel
    Left = 123
    Top = 101
    Width = 71
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Nr. Dias Venda'
  end
  object Label7: TLabel
    Left = 208
    Top = 101
    Width = 77
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Dias Sem Estoq.'
  end
  object Label8: TLabel
    Left = 879
    Top = 101
    Width = 77
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Dias Sem Estoq.'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 1276
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object _gbGraficoEstoqueRS: TGroupBox
    AlignWithMargins = True
    Left = 638
    Top = 144
    Width = 635
    Height = 316
    Anchors = [akLeft, akBottom]
    Caption = 'Cd RS'
    TabOrder = 1
    object _chtGraficoRS: TChart
      Left = 2
      Top = 15
      Width = 631
      Height = 299
      Legend.Alignment = laBottom
      Legend.TextStyle = ltsPlain
      MarginBottom = 0
      MarginLeft = 0
      MarginRight = 0
      MarginTop = 0
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TChart')
      Title.VertMargin = 0
      OnClickSeries = _chtGraficoRSClickSeries
      AxisBehind = False
      BottomAxis.LabelsAngle = 90
      DepthTopAxis.Title.Font.Height = -13
      DepthTopAxis.Title.Font.Style = [fsBold]
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 865.025000000000100000
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 0
      LeftAxis.TickLength = 0
      TopAxis.Visible = False
      View3D = False
      Zoom.Allow = False
      Zoom.AnimatedSteps = 0
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitWidth = 656
      PrintMargins = (
        15
        32
        15
        32)
      ColorPaletteIndex = 13
      object Series1: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Emboss.Color = 8487297
        Marks.Shadow.Color = 8553090
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Estoque Maximo'
        ClickableLine = False
        LinePen.Color = clRed
        LinePen.Width = 3
        Pointer.Brush.Gradient.EndColor = clRed
        Pointer.Gradient.EndColor = clRed
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series2: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Font.Height = -1
        Marks.Visible = False
        SeriesColor = 8404992
        Title = 'Estoque Seguran'#231'a'
        ClickableLine = False
        Dark3D = False
        LinePen.Color = 8404992
        LinePen.Width = 3
        OutLine.Style = psDot
        Pointer.Brush.Gradient.EndColor = 1330417
        Pointer.Gradient.EndColor = 1330417
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clBlue
        Title = 'Posi'#231#227'o Estoque'
        Dark3D = False
        LinePen.Color = clBlue
        LinePen.Width = 3
        Pointer.Brush.Gradient.EndColor = 3513587
        Pointer.Gradient.EndColor = 3513587
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series6: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = -1
        Title = 'Entradas'
        BarWidthPercent = 100
        Emboss.Color = 8684676
        MultiBar = mbNone
        Shadow.Color = clAqua
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series4: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = True
        SeriesColor = clLime
        Title = 'Pedido Novo'
        Emboss.Color = 8487297
        MultiBar = mbNone
        Shadow.Color = 8487297
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series7: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = True
        SeriesColor = clRed
        Title = 'Pedido Cancelado'
        Emboss.Color = 8553090
        MultiBar = mbNone
        Shadow.Color = 8553090
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series8: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = True
        SeriesColor = 33023
        Title = 'Pedido Pendente'
        Emboss.Color = 8487297
        MultiBar = mbNone
        Shadow.Color = 8487297
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series9: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = True
        SeriesColor = clAqua
        Title = 'Pedido Faturado'
        BarWidthPercent = 100
        Emboss.Color = 8487297
        MultiBar = mbNone
        Shadow.Color = 8487297
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series20: TPointSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'Pedido no Fornec.'
        ClickableLine = False
        Pointer.Brush.Color = clRed
        Pointer.Brush.Gradient.EndColor = 10708548
        Pointer.Gradient.EndColor = 10708548
        Pointer.InflateMargins = True
        Pointer.Style = psDownTriangle
        Pointer.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series22: TPointSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'Entradas do Fornec.'
        ClickableLine = False
        Pointer.Brush.Color = 4227072
        Pointer.Brush.Gradient.EndColor = 3513587
        Pointer.Gradient.EndColor = 3513587
        Pointer.InflateMargins = True
        Pointer.Style = psTriangle
        Pointer.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object _gbGraficoEstoqueSc: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 140
    Width = 633
    Height = 316
    Anchors = [akLeft, akBottom]
    Caption = 'Cd SC'
    TabOrder = 2
    object _chtGraficoSC: TChart
      Left = 2
      Top = 15
      Width = 629
      Height = 299
      Cursor = crHandPoint
      Legend.Alignment = laBottom
      Legend.TextStyle = ltsPlain
      MarginBottom = 0
      MarginLeft = 0
      MarginRight = 0
      MarginTop = 0
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TChart')
      Title.VertMargin = 0
      OnClickSeries = _chtGraficoSCClickSeries
      AxisBehind = False
      BottomAxis.LabelsAngle = 90
      DepthTopAxis.Title.Font.Height = -13
      DepthTopAxis.Title.Font.Style = [fsBold]
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 865.025000000000100000
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 0
      LeftAxis.TickLength = 0
      TopAxis.Visible = False
      View3D = False
      Zoom.Allow = False
      Zoom.AnimatedSteps = 0
      Align = alClient
      TabOrder = 0
      OnMouseMove = _chtGraficoSCMouseMove
      ExplicitWidth = 656
      PrintMargins = (
        15
        32
        15
        32)
      ColorPaletteIndex = 3
      object Series5: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Estoque M'#225'ximo'
        ClickableLine = False
        LinePen.Color = clRed
        LinePen.Width = 3
        Pointer.Brush.Gradient.EndColor = clRed
        Pointer.Gradient.EndColor = clRed
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series10: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = 8404992
        Title = 'Estoque Seguran'#231'a'
        LinePen.Color = 8404992
        LinePen.Width = 3
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series11: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clBlue
        Title = 'Posi'#231#227'o Estoque'
        LinePen.Color = clBlue
        LinePen.Width = 3
        Pointer.Brush.Gradient.EndColor = clBlue
        Pointer.Gradient.EndColor = clBlue
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series16: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clBlack
        Title = 'Entrada'
        BarWidthPercent = 100
        Emboss.Color = 8618883
        MultiBar = mbNone
        Shadow.Color = 8618883
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series12: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Style = smsLabelValue
        Marks.Visible = False
        SeriesColor = clLime
        Title = 'Pedido Novo'
        Emboss.Color = 8684676
        MultiBar = mbNone
        Shadow.Color = 8684676
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series13: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Pedido Cancelado'
        Emboss.Color = 8618883
        MultiBar = mbNone
        Shadow.Color = 8618883
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series14: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = 33023
        Title = 'Pedido Pendente'
        Emboss.Color = 8684676
        MultiBar = mbNone
        Shadow.Color = 8684676
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series15: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clAqua
        Title = 'Pedido Faturado'
        Emboss.Color = 8816262
        MultiBar = mbNone
        Shadow.Color = 8816262
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series19: TPointSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Style = smsXValue
        Marks.Visible = False
        Title = 'Pedido no Fornec.'
        ClickableLine = False
        Pointer.Brush.Color = clRed
        Pointer.Brush.Gradient.EndColor = 16777164
        Pointer.Brush.Gradient.MidColor = clWhite
        Pointer.Brush.Gradient.StartColor = clRed
        Pointer.Emboss.Color = clRed
        Pointer.Gradient.EndColor = 16777164
        Pointer.Gradient.MidColor = clWhite
        Pointer.Gradient.StartColor = clRed
        Pointer.InflateMargins = True
        Pointer.Shadow.Color = clRed
        Pointer.Style = psDownTriangle
        Pointer.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series21: TPointSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        Title = 'Entradas do Fornec.'
        ClickableLine = False
        Pointer.Brush.Color = 4227072
        Pointer.Brush.Gradient.EndColor = 13434879
        Pointer.Emboss.Color = 16384
        Pointer.Gradient.EndColor = 13434879
        Pointer.InflateMargins = True
        Pointer.Shadow.Color = 4227072
        Pointer.Style = psTriangle
        Pointer.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object _gbGraficoVenda: TGroupBox
    Left = 5
    Top = -2
    Width = 631
    Height = 97
    Caption = 'Grafico Venda SC'
    TabOrder = 3
    object _chtGraficoVendaSC: TChart
      Left = 2
      Top = 15
      Width = 627
      Height = 80
      Legend.Visible = False
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Venda SC')
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 656
      ColorPaletteIndex = 13
      object Series17: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clGreen
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
  end
  object _gbGraficoVendaRS: TGroupBox
    Left = 671
    Top = 1
    Width = 600
    Height = 86
    Caption = 'Grafico Venda RS'
    TabOrder = 4
    object _chtGraficoVendaRS: TChart
      Left = 2
      Top = 15
      Width = 596
      Height = 69
      Legend.Visible = False
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Venda SC')
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 656
      ColorPaletteIndex = 13
      object Series18: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Style = smsValue
        Marks.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
  end
  object _btnImprimir: TBitBtn
    Left = 505
    Top = 109
    Width = 129
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Imprimir Graficos'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337333733373
      3373337F3F7F3F7F3F7F33737373737373733F7F7F7F7F7F7F7F770000000000
      000077777777777777773303333333333333337FF333333F33333709333333C3
      333337773F3FF373F333330393993C3C33333F7F7F77F7F7FFFF77079797977C
      77777777777777777777330339339333C333337FF73373F37F33370C333C3933
      933337773F3737F37FF33303C3C33939C9333F7F7F7FF7F777FF7707C7C77797
      7C97777777777777777733033C3333333C33337F37F33333373F37033C333333
      33C3377F37333333337333033333333333333F7FFFFFFFFFFFFF770777777777
      7777777777777777777733333333333333333333333333333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = _btnImprimirClick
  end
  object _edtMediaSC: TEdit
    Left = 296
    Top = 120
    Width = 89
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object _edtMediaRs: TEdit
    Left = 967
    Top = 117
    Width = 89
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object _chkDefinirImpressora: TCheckBox
    Left = 1080
    Top = 121
    Width = 84
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Definir Impr.'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object _edtSomaVendaRS: TEdit
    Left = 699
    Top = 117
    Width = 89
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 9
  end
  object _edtSomaVendaSC: TEdit
    Left = 24
    Top = 120
    Width = 89
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 10
  end
  object _edtNrDiasVendaRS: TEdit
    Left = 795
    Top = 117
    Width = 71
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 11
  end
  object _edtNrDiasVendaSC: TEdit
    Left = 120
    Top = 120
    Width = 74
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 12
  end
  object _edtDiasSemEstoqueSC: TEdit
    Left = 205
    Top = 120
    Width = 77
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 13
  end
  object _edtDiasSemEstoqueRS: TEdit
    Left = 879
    Top = 116
    Width = 75
    Height = 21
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    TabOrder = 14
  end
  object _cdsPosicaoEstoqueSC: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 48
  end
  object _cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
  end
  object _cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 192
  end
  object _cdsUltimasCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 48
  end
  object _cdsEntradas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 136
  end
  object _cdsPosicaoEstoqueRS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 984
    Top = 32
  end
  object _cdsVendaAnual: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 272
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 
      'C:\Gam\ProducaoSoftware\Sistemas\Desktop\GraficoProdutoPedido\Re' +
      'latorioGraficoProduto.rav'
    Left = 432
    Top = 40
  end
  object RvCustomConnection1: TRvCustomConnection
    LocalFilter = False
    RuntimeVisibility = rtDeveloper
    OnGetCols = RvCustomConnection1GetCols
    OnGetRow = RvCustomConnection1GetRow
    Left = 72
    Top = 192
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 504
    Top = 40
  end
  object RvCustomConnection2: TRvCustomConnection
    RuntimeVisibility = rtDeveloper
    OnGetCols = RvCustomConnection2GetCols
    OnGetRow = RvCustomConnection2GetRow
    Left = 1216
    Top = 168
  end
  object _cdsDadosProdutoSC: TClientDataSet
    Aggregates = <>
    ObjectView = False
    Params = <>
    Left = 160
    Top = 56
    object _cdsDadosProdutoSCNR_COMPRADOR: TIntegerField
      FieldName = 'NR_COMPRADOR'
    end
    object _cdsDadosProdutoSCNM_COMPRADOR: TStringField
      FieldName = 'NM_COMPRADOR'
      Size = 35
    end
    object _cdsDadosProdutoSCVL_MEDIA: TFloatField
      FieldName = 'VL_MEDIA'
      DisplayFormat = '###,##0.00'
    end
    object _cdsDadosProdutoSCNR_GRUPO: TIntegerField
      FieldName = 'NR_GRUPO'
    end
    object _cdsDadosProdutoSCNR_ESTOQUE_MAXIMO: TIntegerField
      FieldName = 'NR_ESTOQUE_MAXIMO'
    end
    object _cdsDadosProdutoSCNR_LEADTIME: TIntegerField
      DisplayWidth = 5
      FieldName = 'NR_LEADTIME'
      DisplayFormat = '###,##0'
    end
  end
  object _cdsDadosProdutoRS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1128
    Top = 240
    object _cdsDadosProdutoRSNR_COMPRADOR: TIntegerField
      FieldName = 'NR_COMPRADOR'
    end
    object _cdsDadosProdutoRSNM_COMPRADOR: TStringField
      FieldName = 'NM_COMPRADOR'
      Size = 30
    end
    object _cdsDadosProdutoRSVL_MEDIA: TFloatField
      FieldName = 'VL_MEDIA'
      DisplayFormat = '###,##0.00'
    end
    object _cdsDadosProdutoRSNR_GRUPO: TIntegerField
      FieldName = 'NR_GRUPO'
    end
    object _cdsDadosProdutoRSNR_ESTOQUE_MAXIMO: TIntegerField
      FieldName = 'NR_ESTOQUE_MAXIMO'
    end
    object _cdsDadosProdutoRSNR_LEADTIME: TIntegerField
      DisplayWidth = 5
      FieldName = 'NR_LEADTIME'
      DisplayFormat = '###,##0'
    end
  end
  object rdsDadosProdutosSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = _cdsDadosProdutoSC
    Left = 336
    Top = 200
  end
  object rdsDadosProdutosRS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = _cdsDadosProdutoRS
    Left = 992
    Top = 232
  end
  object _cdsPedidoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 144
  end
  object _cdsPosicaoEstoqueGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 144
  end
  object _cdsEntradasFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 328
  end
  object _cdsTabelaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 393
  end
  object _cdsTabelaEntradas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 744
    Top = 376
  end
  object _cdsDadosPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 528
    Top = 256
    object _cdsDadosPedidoNR_PEDIDO: TIntegerField
      FieldName = 'NR_PEDIDO'
    end
    object _cdsDadosPedidoDT_PEDIDO: TDateField
      FieldName = 'DT_PEDIDO'
    end
    object _cdsDadosPedidoDT_EMISSAO_NFE: TDateField
      FieldName = 'DT_EMISSAO_NFE'
    end
    object _cdsDadosPedidoDT_ENTRADA_NFE: TDateField
      FieldName = 'DT_ENTRADA_NFE'
    end
    object _cdsDadosPedidoQT_PEDIDO: TIntegerField
      FieldName = 'QT_PEDIDO'
    end
    object _cdsDadosPedidoQT_ENTRADA: TIntegerField
      FieldName = 'QT_ENTRADA'
    end
    object _cdsDadosPedidoQT_SUGERIDA: TIntegerField
      FieldName = 'QT_SUGERIDA'
    end
    object _cdsDadosPedidoNR_LEADTIME: TIntegerField
      FieldName = 'NR_LEADTIME'
    end
    object _cdsDadosPedidoDT_VALIDADE: TDateField
      FieldName = 'DT_VALIDADE'
    end
    object _cdsDadosPedidoNR_LEADTIME_FORN: TIntegerField
      FieldName = 'NR_LEADTIME_FORN'
    end
    object _cdsDadosPedidoNR_TOTAL_QTD_PEDIDO: TAggregateField
      FieldName = 'NR_TOTAL_QTD_PEDIDO'
      Expression = 'SUM(QT_PEDIDO)'
    end
    object _cdsDadosPedidoNR_TOTAL_QTD_FATURADA: TAggregateField
      FieldName = 'NR_TOTAL_QTD_FATURADA'
      Expression = 'SUM(QT_ENTRADA)'
    end
  end
end
