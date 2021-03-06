object _frRelatorioCriticaEntradaNovo: T_frRelatorioCriticaEntradaNovo
  Left = 195
  Top = 104
  Caption = ' Relat'#243'rio Cr'#237'tica [ Pedido Compra x XML NFe ]'
  ClientHeight = 560
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 693
    Height = 540
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'COMPRADOR'
      OnShow = TabSheet1Show
      object ChartTotalDivergencia: TChart
        Left = 6
        Top = 7
        Width = 673
        Height = 265
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Border.Visible = True
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsPlain
        Legend.Visible = False
        Title.Text.Strings = (
          'TOTAL DE CRITICAS')
        BevelInner = bvRaised
        TabOrder = 0
        ColorPaletteIndex = 13
        object Series2: TBarSeries
          BarBrush.Gradient.EndColor = 6519581
          BarBrush.Gradient.Visible = True
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          BarStyle = bsRectGradient
          Gradient.EndColor = 6519581
          Gradient.Visible = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
      end
      object ChartDivergencia: TChart
        Left = 6
        Top = 280
        Width = 335
        Height = 230
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Border.Visible = True
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsPlain
        Legend.Visible = False
        Title.Text.Strings = (
          'TOTAL DE DIVERGENCIAS')
        Chart3DPercent = 5
        BevelInner = bvRaised
        TabOrder = 1
        ColorPaletteIndex = 13
        object Series1: THorizBarSeries
          BarBrush.Gradient.Direction = gdLeftRight
          BarBrush.Gradient.EndColor = 6519581
          BarBrush.Gradient.Visible = True
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Callout.Length = 10
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          BarStyle = bsRectGradient
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = 6519581
          Gradient.Visible = True
          XValues.Name = 'Bar'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
      object ChartPercDivergencia: TChart
        Left = 344
        Top = 280
        Width = 335
        Height = 230
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Border.Visible = True
        Legend.TextStyle = ltsPlain
        Legend.Visible = False
        Title.Text.Strings = (
          'PERCENTUAL DE DIVERGENCIAS')
        DepthAxis.Automatic = False
        DepthAxis.AutomaticMaximum = False
        DepthAxis.AutomaticMinimum = False
        DepthAxis.Maximum = 0.199999999999999800
        DepthAxis.Minimum = -0.800000000000000300
        DepthTopAxis.Automatic = False
        DepthTopAxis.AutomaticMaximum = False
        DepthTopAxis.AutomaticMinimum = False
        DepthTopAxis.Maximum = 0.199999999999999800
        DepthTopAxis.Minimum = -0.800000000000000300
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 3.499999999999998000
        LeftAxis.Minimum = -1.499999999999999000
        RightAxis.Automatic = False
        RightAxis.AutomaticMaximum = False
        RightAxis.AutomaticMinimum = False
        TabOrder = 2
        ColorPaletteIndex = 13
        object HorizBarSeries1: THorizBarSeries
          BarBrush.Gradient.Direction = gdLeftRight
          BarBrush.Gradient.EndColor = 11048782
          BarBrush.Gradient.Visible = True
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Style = smsPercent
          Marks.Visible = True
          SeriesColor = clRed
          BarStyle = bsRectGradient
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = 11048782
          Gradient.Visible = True
          XValues.Name = 'Bar'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'FORNECEDOR'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object ChartFornecPeriodo: TChart
        Left = 5
        Top = 280
        Width = 677
        Height = 231
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Border.Visible = True
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsPlain
        Title.Text.Strings = (
          '')
        BevelInner = bvRaised
        TabOrder = 0
        ColorPaletteIndex = 13
        object BarSeries1: TBarSeries
          BarBrush.Gradient.EndColor = 6519581
          BarBrush.Gradient.Visible = True
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          BarStyle = bsRectGradient
          Gradient.EndColor = 6519581
          Gradient.Visible = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
      end
      object ChartFornecQtdTipo: TChart
        Left = 363
        Top = 3
        Width = 316
        Height = 272
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Border.Visible = True
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsPlain
        Legend.Visible = False
        Title.Text.Strings = (
          '')
        BevelInner = bvRaised
        TabOrder = 1
        ColorPaletteIndex = 13
        object BarSeries2: THorizBarSeries
          BarBrush.Gradient.Direction = gdLeftRight
          BarBrush.Gradient.EndColor = 6519581
          BarBrush.Gradient.Visible = True
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          BarStyle = bsRectGradient
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = 6519581
          Gradient.Visible = True
          XValues.Name = 'Bar'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
      object DBGridFornecedor: TDBGrid
        Left = 6
        Top = 3
        Width = 351
        Height = 271
        DataSource = DS_Divergencia_Fonecedor
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGridFornecedorCellClick
        OnKeyPress = DBGridFornecedorKeyPress
        OnTitleClick = DBGridFornecedorTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_FORNECEDOR'
            Title.Caption = 'FORNEC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMP_P'
            Title.Caption = 'LABORAT'#211'RIO'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Width = 43
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'DIVERGENCIA'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 685
        Height = 512
        Align = alClient
        TabOrder = 0
        object RadioButton1: TRadioButton
          Left = 14
          Top = 14
          Width = 156
          Height = 17
          Caption = 'DIVERGENCIA DE PRECO'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 14
          Top = 32
          Width = 155
          Height = 17
          Caption = 'DIVERGENCIA DE PRAZO'
          TabOrder = 1
          OnClick = RadioButton2Click
        end
        object RadioButton3: TRadioButton
          Left = 174
          Top = 14
          Width = 193
          Height = 17
          Caption = 'DIVERGENCIA DE QUANTIDADE'
          TabOrder = 2
          OnClick = RadioButton3Click
        end
        object RadioButton5: TRadioButton
          Left = 174
          Top = 32
          Width = 201
          Height = 17
          Caption = 'MERCADORIA NAO LOCALIZADA'
          TabOrder = 3
          OnClick = RadioButton5Click
        end
        object RadioButton6: TRadioButton
          Left = 366
          Top = 14
          Width = 170
          Height = 17
          Caption = 'MERCADORIA SEM PEDIDO'
          TabOrder = 4
          OnClick = RadioButton6Click
        end
        object RadioButton4: TRadioButton
          Left = 366
          Top = 32
          Width = 233
          Height = 17
          Caption = 'PEDIDO DE COMPRA NAO INFORMADO'
          TabOrder = 5
          OnClick = RadioButton4Click
        end
        object DBGridDivergencia: TDBGrid
          Left = 14
          Top = 54
          Width = 467
          Height = 219
          DataSource = DS_Divergencia_FonecedorDiv
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridDivergenciaCellClick
          OnKeyPress = DBGridDivergenciaKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_LABORATORIO'
              Title.Caption = 'LAB'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMP_P'
              Title.Caption = 'LABORAT'#211'RIO'
              Width = 338
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 52
              Visible = True
            end>
        end
        object ChartDivergenciaFornec: TChart
          Left = 12
          Top = 279
          Width = 661
          Height = 230
          BackWall.Brush.Color = clWhite
          Border.Visible = True
          Legend.Alignment = laBottom
          Legend.TextStyle = ltsPlain
          Legend.Visible = False
          Title.Text.Strings = (
            '')
          Chart3DPercent = 10
          View3DOptions.Elevation = 315
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          BevelInner = bvRaised
          TabOrder = 7
          ColorPaletteIndex = 13
          object Series3: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clRed
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 540
    Width = 693
    Height = 20
    Panels = <>
  end
  object SQL_Divergencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT B.CD_COMPRA_DIVERGENCIA, C.DS_COMPRA_DIVERGENCIA,COUNT(*)' +
        ' TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA C'
      'WHERE B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      '  AND A.SQ_ORDEM = B.SQ_ORDEM'
      ' AND SYSDATE - A.DT_CRITICA <= 365'
      'AND CD_COMPRADOR = :NR_COMPRADOR'
      'GROUP BY B.CD_COMPRA_DIVERGENCIA, C.DS_COMPRA_DIVERGENCIA'
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 468
    Top = 8
    object SQL_DivergenciaCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQL_DivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQL_DivergenciaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DSP_Divergencia: TDataSetProvider
    DataSet = SQL_Divergencia
    Left = 505
    Top = 8
  end
  object CDS_Divergencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Divergencia'
    Left = 541
    Top = 8
    object CDS_DivergenciaCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDS_DivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDS_DivergenciaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object SQL_TotalCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT ID_SITUACAO_CRITICA,DS_COMPRA_SITUACAO_DIVERGENCIA,COUNT(' +
        '*) TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA,'
      '     PRDDM.DC_COMPRA_SITUACAO_DIVERGENCIA'
      'WHERE CD_COMPRA_SITUACAO_DIVERGENCIA = ID_SITUACAO_CRITICA'
      ' AND SYSDATE - DT_CRITICA <= 365'
      'AND CD_COMPRADOR = :NR_COMPRADOR'
      'GROUP BY ID_SITUACAO_CRITICA,DS_COMPRA_SITUACAO_DIVERGENCIA'
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 574
    Top = 29
    object SQL_TotalCriticaID_SITUACAO_CRITICA: TWideStringField
      FieldName = 'ID_SITUACAO_CRITICA'
      Size = 1
    end
    object SQL_TotalCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object SQL_TotalCriticaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object CDS_TotalCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_TotalCritica'
    Left = 647
    Top = 28
    object CDS_TotalCriticaID_SITUACAO_CRITICA: TWideStringField
      FieldName = 'ID_SITUACAO_CRITICA'
      Size = 1
    end
    object CDS_TotalCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object CDS_TotalCriticaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DSP_TotalCritica: TDataSetProvider
    DataSet = SQL_TotalCritica
    Left = 611
    Top = 29
  end
  object SQL_GeralComprador: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT C.DS_COMPRA_DIVERGENCIA,COUNT(*) TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA C,'
      '     PRDDM.DC_COMPRA_SOLUCAO_DIVERGENCIA D'
      'WHERE B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      '  AND B.CD_COMPRA_DIVERGENCIA = D.CD_COMPRA_DIVERGENCIA '
      '  AND A.SQ_ORDEM = B.SQ_ORDEM'
      '-- AND B.CD_COMPRA_SOLUCAO_DIVERGENCIA <> 100'
      ' AND SYSDATE - A.DT_CRITICA <= 365'
      
        '  AND B.CD_COMPRA_SOLUCAO_DIVERGENCIA = D.CD_COMPRA_SOLUCAO_DIVE' +
        'RGENCIA'
      '  AND CD_COMPRADOR = :NR_COMPRADOR'
      'GROUP BY B.CD_COMPRA_DIVERGENCIA, C.DS_COMPRA_DIVERGENCIA'
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 575
    Top = 60
    object SQL_GeralCompradorDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQL_GeralCompradorTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DSP_GeralComprador: TDataSetProvider
    DataSet = SQL_GeralComprador
    Left = 609
    Top = 56
  end
  object CDS_GeralComprador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_GeralComprador'
    Left = 645
    Top = 56
    object CDS_GeralCompradorDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDS_GeralCompradorTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object SQL_Divergencia_Fonecedor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CD_FORNECEDOR,NOMP_P,COUNT(*) TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA C,'
      '     PRDDM.DCFOR,'
      '     PRDDM.DCPES'
      'WHERE A.SQ_ORDEM = B.SQ_ORDEM'
      '  AND B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      ' AND SYSDATE - A.DT_CRITICA <= 365'
      '  AND CD_FORNECEDOR = NROF_F'
      '  AND CGCP_P = CGCP_F'
      'AND CD_COMPRADOR = :NR_COMPRADOR'
      'GROUP BY CD_FORNECEDOR,NOMP_P'
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 500
    Top = 82
    object SQL_Divergencia_FonecedorCD_FORNECEDOR: TFMTBCDField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQL_Divergencia_FonecedorNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object SQL_Divergencia_FonecedorTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DSP_Divergencia_Fonecedor: TDataSetProvider
    DataSet = SQL_Divergencia_Fonecedor
    Left = 570
    Top = 90
  end
  object CDS_Divergencia_Fonecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Divergencia_Fonecedor'
    Left = 605
    Top = 90
    object CDS_Divergencia_FonecedorCD_FORNECEDOR: TFMTBCDField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDS_Divergencia_FonecedorNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object CDS_Divergencia_FonecedorTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DS_Divergencia_Fonecedor: TDataSource
    DataSet = CDS_Divergencia_Fonecedor
    Left = 640
    Top = 90
  end
  object SQL_Divergencia_Detalhe: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CD_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT B.CD_COMPRA_DIVERGENCIA,B.DS_COMPRA_DIVERGENCIA,NM_COMPRA' +
        'DOR_REDUZIDO,COUNT(*) TOTAL'
      'FROM PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA B, '
      '     PRDDM.DC_COMPRA_SOLUCAO_DIVERGENCIA C,'
      '     PRDDM.DC_COMPRA_CRITICA_ENTRADA D,'
      '     PRDDM.DC_COMPRADOR_GAM'
      'WHERE A.CD_COMPRA_DIVERGENCIA = B.CD_COMPRA_DIVERGENCIA'
      '  AND A.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      '  AND A.SQ_ORDEM = D.SQ_ORDEM'
      '-- AND A.CD_COMPRA_SOLUCAO_DIVERGENCIA <> 100 '
      
        '  AND A.CD_COMPRA_SOLUCAO_DIVERGENCIA = C.CD_COMPRA_SOLUCAO_DIVE' +
        'RGENCIA '
      ' AND SYSDATE - D.DT_CRITICA <= 365'
      '  AND CD_COMPRADOR = NR_COMPRADOR'
      '  AND D.CD_FORNECEDOR = :CD_FORNECEDOR'
      '  AND CD_COMPRADOR = :NR_COMPRADOR'
      
        'GROUP BY B.CD_COMPRA_DIVERGENCIA,B.DS_COMPRA_DIVERGENCIA,NM_COMP' +
        'RADOR_REDUZIDO'
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 577
    Top = 122
    object SQL_Divergencia_DetalheDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQL_Divergencia_DetalheTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
    object SQL_Divergencia_DetalheCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQL_Divergencia_DetalheNM_COMPRADOR_REDUZIDO: TWideStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
  end
  object DSP_Divergencia_Detalhe: TDataSetProvider
    DataSet = SQL_Divergencia_Detalhe
    Left = 608
    Top = 122
  end
  object CDS_Divergencia_Detalhe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Divergencia_Detalhe'
    Left = 639
    Top = 122
    object CDS_Divergencia_DetalheDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDS_Divergencia_DetalheTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
    object CDS_Divergencia_DetalheCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDS_Divergencia_DetalheNM_COMPRADOR_REDUZIDO: TWideStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
  end
  object SQL_ControleDataCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT TRUNC(MIN(DT_CRITICA))  DATA_MIN,'
      '               TRUNC(MAX(DT_CRITICA))  DATA_MAX'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA'
      'WHERE SYSDATE - DT_CRITICA <= 365')
    SQLConnection = _dm._conexao
    Left = 573
    Top = 155
    object SQL_ControleDataCriticaDATA_MIN: TSQLTimeStampField
      FieldName = 'DATA_MIN'
    end
    object SQL_ControleDataCriticaDATA_MAX: TSQLTimeStampField
      FieldName = 'DATA_MAX'
    end
  end
  object DSP_ControleDataCritica: TDataSetProvider
    DataSet = SQL_ControleDataCritica
    Left = 610
    Top = 155
  end
  object CDS_ControleDataCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ControleDataCritica'
    Left = 649
    Top = 155
    object CDS_ControleDataCriticaDATA_MIN: TSQLTimeStampField
      FieldName = 'DATA_MIN'
    end
    object CDS_ControleDataCriticaDATA_MAX: TSQLTimeStampField
      FieldName = 'DATA_MAX'
    end
  end
  object SQL_DivergenciaGeralPeriodoFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DT_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FORNEC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(*) TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA C'
      'WHERE B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      '  AND A.SQ_ORDEM = B.SQ_ORDEM'
      ' AND SYSDATE - A.DT_CRITICA <= 365'
      '  AND DT_CRITICA >= :DT_INICIAL'
      '  AND DT_CRITICA <= :DT_FINAL'
      '  AND CD_FORNECEDOR =  :FORNEC'
      '  AND CD_COMPRADOR = :COMPRADOR '
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 576
    Top = 188
    object SQL_DivergenciaGeralPeriodoFornecTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DSP_DivergenciaGeralPeriodoFornec: TDataSetProvider
    DataSet = SQL_DivergenciaGeralPeriodoFornec
    Left = 609
    Top = 188
  end
  object CDS_DivergenciaGeralPeriodoFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_DivergenciaGeralPeriodoFornec'
    Left = 648
    Top = 188
    object CDS_DivergenciaGeralPeriodoFornecTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object SQL_DivergenciaGeralPeriodoFornecDiv: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'TIPO_DIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FORNEC'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT B.CD_COMPRA_DIVERGENCIA, C.DS_COMPRA_DIVERGENCIA,COUNT(*)' +
        ' TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA C'
      'WHERE B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      '  AND A.SQ_ORDEM = B.SQ_ORDEM'
      '--  AND ID_SITUACAO_CRITICA <> 5'
      '  AND B.CD_COMPRA_DIVERGENCIA = :TIPO_DIVERG'
      '  AND DT_CRITICA >= :DT_INICIAL'
      '  AND DT_CRITICA <= :DT_FINAL'
      '  AND CD_FORNECEDOR =  :FORNEC'
      'GROUP BY B.CD_COMPRA_DIVERGENCIA, C.DS_COMPRA_DIVERGENCIA'
      'ORDER BY TOTAL DESC')
    SQLConnection = _dm._conexao
    Left = 576
    Top = 220
    object SQL_DivergenciaGeralPeriodoFornecDivCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQL_DivergenciaGeralPeriodoFornecDivDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQL_DivergenciaGeralPeriodoFornecDivTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object DSP_DivergenciaGeralPeriodoFornecDiv: TDataSetProvider
    DataSet = SQL_DivergenciaGeralPeriodoFornecDiv
    Left = 609
    Top = 220
  end
  object CDS_DivergenciaGeralPeriodoFornecDiv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_DivergenciaGeralPeriodoFornecDiv'
    Left = 640
    Top = 220
    object CDS_DivergenciaGeralPeriodoFornecDivCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDS_DivergenciaGeralPeriodoFornecDivDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDS_DivergenciaGeralPeriodoFornecDivTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object SQL_Divergencia_FonecedorDiv: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CD_DIVERGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT B.CD_COMPRA_DIVERGENCIA,DS_COMPRA_DIVERGENCIA,CD_FORNECED' +
        'OR,CD_LABORATORIO,NOMP_P,COUNT(*) TOTAL'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,'
      '     PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,'
      '     PRDDM.DC_COMPRA_DIVERGENCIA C,'
      '     PRDDM.DCFOR,'
      '     PRDDM.DCPES'
      'WHERE A.SQ_ORDEM = B.SQ_ORDEM'
      '  AND B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      ' AND SYSDATE - A.DT_CRITICA <= 365'
      '  AND CD_FORNECEDOR = NROF_F'
      '  AND CGCP_P = CGCP_F'
      '  AND B.CD_COMPRA_DIVERGENCIA = :CD_DIVERGENCIA '
      '  AND CD_COMPRADOR = :NR_COMPRADOR'
      
        'GROUP BY B.CD_COMPRA_DIVERGENCIA,DS_COMPRA_DIVERGENCIA,CD_FORNEC' +
        'EDOR, CD_LABORATORIO,NOMP_P'
      'ORDER BY TOTAL DESC ')
    SQLConnection = _dm._conexao
    Left = 530
    Top = 256
    object SQL_Divergencia_FonecedorDivNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object SQL_Divergencia_FonecedorDivTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
    object SQL_Divergencia_FonecedorDivCD_FORNECEDOR: TFMTBCDField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQL_Divergencia_FonecedorDivCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQL_Divergencia_FonecedorDivDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQL_Divergencia_FonecedorDivCD_LABORATORIO: TFMTBCDField
      FieldName = 'CD_LABORATORIO'
      Required = True
      Precision = 6
      Size = 0
    end
  end
  object DSP_Divergencia_FonecedorDiv: TDataSetProvider
    DataSet = SQL_Divergencia_FonecedorDiv
    Left = 568
    Top = 256
  end
  object CDS_Divergencia_FonecedorDiv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Divergencia_FonecedorDiv'
    Left = 605
    Top = 256
    object CDS_Divergencia_FonecedorDivNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object CDS_Divergencia_FonecedorDivTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 32
    end
    object CDS_Divergencia_FonecedorDivCD_FORNECEDOR: TFMTBCDField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDS_Divergencia_FonecedorDivCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDS_Divergencia_FonecedorDivDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDS_Divergencia_FonecedorDivCD_LABORATORIO: TFMTBCDField
      FieldName = 'CD_LABORATORIO'
      Required = True
      Precision = 6
      Size = 0
    end
  end
  object DS_Divergencia_FonecedorDiv: TDataSource
    DataSet = CDS_Divergencia_FonecedorDiv
    Left = 640
    Top = 256
  end
end
