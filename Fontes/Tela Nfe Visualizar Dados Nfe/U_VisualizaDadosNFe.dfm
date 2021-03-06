object _frmNfeVisualizaDanfe: T_frmNfeVisualizaDanfe
  Left = 192
  Top = 114
  Caption = 'Dados da Nota Fiscal'
  ClientHeight = 608
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 5
    Width = 446
    Height = 105
    Caption = ' DADOS PRINCIPAIS DA NFe '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label2: TLabel
      Left = 7
      Top = 14
      Width = 75
      Height = 13
      Caption = 'FORNECEDOR'
    end
    object Label18: TLabel
      Left = 278
      Top = 15
      Width = 32
      Height = 13
      Caption = 'SERIE'
    end
    object Label3: TLabel
      Left = 366
      Top = 15
      Width = 66
      Height = 13
      Caption = 'DT EMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 55
      Width = 35
      Height = 13
      Caption = 'N'#186' NFe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 94
      Top = 55
      Width = 52
      Height = 13
      Caption = 'QTD ITEM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 182
      Top = 55
      Width = 78
      Height = 13
      Caption = 'VLR PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 269
      Top = 55
      Width = 68
      Height = 13
      Caption = 'VALOR DESC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 356
      Top = 55
      Width = 58
      Height = 13
      Caption = 'TOTAL NFe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdRazaoSocial: TEdit
      Left = 6
      Top = 28
      Width = 270
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdSerie: TEdit
      Left = 278
      Top = 28
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdDtEmissao: TEdit
      Left = 365
      Top = 28
      Width = 74
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdNroNF: TEdit
      Left = 6
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdtQtdItem: TEdit
      Left = 93
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdValorItem: TEdit
      Left = 181
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object EdValorDesc: TEdit
      Left = 268
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object EdTotalNF: TEdit
      Left = 355
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 115
    Width = 818
    Height = 323
    Caption = '  ITENS DA NFe  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object DBGridItemNota: TDBGrid
      Left = 7
      Top = 17
      Width = 802
      Height = 295
      Hint = 
        'CLIQUE COM BOT'#195'O DIREITO DO MOUSE PARA'#13#10' GERAR PLANILHA COM OS D' +
        'ADOS DA DANFE !'
      DataSource = DS_DADOS_ITEM
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGridItemNotaKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Caption = 'CODIGO'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Caption = 'NOME PRODUTO'
          Width = 259
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE_ITEM'
          Title.Caption = 'UN'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_PRODUTO'
          Title.Caption = 'QTD'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_PRODUTO'
          Title.Caption = 'VLR UNIT'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_DESC'
          Title.Caption = 'DESC.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL_PRODUTO'
          Title.Caption = 'VLR TOTAL'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS_BC'
          Title.Caption = 'BC ICMS'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS_VLR'
          Title.Caption = 'VLR ICMS'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS_PERC'
          Title.Caption = '% ICMS'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALERTA_ITEM'
          Width = 1
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS_CST'
          Title.Caption = 'CST'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CFOP'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCM'
          Width = 55
          Visible = True
        end>
    end
    object Mem_rec_XML: TMemo
      Left = 199
      Top = 66
      Width = 118
      Height = 33
      Lines.Strings = (
        'Mem_rec_XML')
      TabOrder = 1
      Visible = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 441
    Width = 267
    Height = 141
    Caption = '  DADOS DE COBRAN'#199'A  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 15
      Width = 69
      Height = 13
      Caption = 'NOTA FISCAL'
    end
    object DBGrid2: TDBGrid
      Left = 7
      Top = 29
      Width = 253
      Height = 101
      DataSource = DS_DADOS_DUPLICATA
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_DUPLICATA'
          Title.Caption = 'PARCELA'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_DUPLICATA'
          Title.Caption = 'VALOR'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCIMENTO'
          Title.Caption = 'VENCIMENTO'
          Width = 84
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 589
    Width = 834
    Height = 19
    Panels = <>
  end
  object GroupBox7: TGroupBox
    Left = 281
    Top = 441
    Width = 287
    Height = 141
    Caption = '  DADOS DO TRANSPORTE '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object Label7: TLabel
      Left = 6
      Top = 16
      Width = 98
      Height = 13
      Caption = 'TRANSPORTADOR'
    end
    object Label8: TLabel
      Left = 7
      Top = 54
      Width = 45
      Height = 13
      Caption = 'VOLUME'
    end
    object Label9: TLabel
      Left = 8
      Top = 95
      Width = 76
      Height = 13
      Caption = 'PESO LIQUIDO'
    end
    object Label22: TLabel
      Left = 95
      Top = 54
      Width = 45
      Height = 13
      Caption = 'ESPECIE'
    end
    object Label23: TLabel
      Left = 96
      Top = 96
      Width = 70
      Height = 13
      Caption = 'PESO BRUTO'
    end
    object EdTransportador: TEdit
      Left = 6
      Top = 29
      Width = 271
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdQtdVolume: TEdit
      Left = 6
      Top = 69
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdPesoBruto: TEdit
      Left = 95
      Top = 109
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdEspecie: TEdit
      Left = 95
      Top = 69
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdPesoLiquido: TEdit
      Left = 6
      Top = 109
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 573
    Top = 441
    Width = 253
    Height = 141
    Caption = '  DADOS ADICIONAIS  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object mmDadosAdc: TMemo
      Left = 8
      Top = 16
      Width = 236
      Height = 115
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 459
    Top = 5
    Width = 366
    Height = 105
    Caption = ' IMPOSTOS '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label10: TLabel
      Left = 8
      Top = 15
      Width = 43
      Height = 13
      Caption = 'BC ICMS'
    end
    object Label11: TLabel
      Left = 96
      Top = 15
      Width = 65
      Height = 13
      Caption = 'VALOR ICMS'
    end
    object Label15: TLabel
      Left = 183
      Top = 15
      Width = 52
      Height = 13
      Caption = 'VALOR IPI'
    end
    object Label12: TLabel
      Left = 7
      Top = 55
      Width = 31
      Height = 13
      Caption = 'BC ST'
    end
    object Label13: TLabel
      Left = 95
      Top = 55
      Width = 53
      Height = 13
      Caption = 'VALOR ST'
    end
    object Label16: TLabel
      Left = 183
      Top = 55
      Width = 56
      Height = 13
      Caption = 'VALOR PIS'
    end
    object Label17: TLabel
      Left = 272
      Top = 55
      Width = 78
      Height = 13
      Caption = 'VALOR COFINS'
    end
    object EdBaseICMS: TEdit
      Left = 6
      Top = 28
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdVlrICMS: TEdit
      Left = 95
      Top = 28
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdVlrIPI: TEdit
      Left = 183
      Top = 28
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdBaseST: TEdit
      Left = 7
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdVlrST: TEdit
      Left = 95
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdVlrPIS: TEdit
      Left = 183
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object EdVlrCOFINS: TEdit
      Left = 271
      Top = 68
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object CDS_DADOS_NFE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 48
    object CDS_DADOS_NFENRO_NFE: TStringField
      FieldName = 'NRO_NFE'
    end
    object CDS_DADOS_NFEDT_EMISSAO_NFE: TStringField
      FieldName = 'DT_EMISSAO_NFE'
    end
    object CDS_DADOS_NFESERIE_NFE: TStringField
      FieldName = 'SERIE_NFE'
    end
    object CDS_DADOS_NFENM_FABRICANTE: TStringField
      DisplayWidth = 50
      FieldName = 'NM_FABRICANTE'
      Size = 50
    end
    object CDS_DADOS_NFENRO_PEDIDO_COMPRA: TStringField
      FieldName = 'NRO_PEDIDO_COMPRA'
    end
    object CDS_DADOS_NFECNPJ_EMISSOR: TStringField
      FieldName = 'CNPJ_EMISSOR'
    end
    object CDS_DADOS_NFEBC_ICMS: TFloatField
      FieldName = 'BC_ICMS'
    end
    object CDS_DADOS_NFEVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_NFE: TFloatField
      FieldName = 'VLR_NFE'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_DESC: TFloatField
      FieldName = 'VLR_DESC'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_PRODUTO: TFloatField
      FieldName = 'VLR_PRODUTO'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEBC_ST: TFloatField
      FieldName = 'BC_ST'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_NFEVLR_ST: TFloatField
      FieldName = 'VLR_ST'
      DisplayFormat = '###,##0.00'
    end
  end
  object CDS_DADOS_ITEM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 184
    object CDS_DADOS_ITEMCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
    end
    object CDS_DADOS_ITEMNOME_PRODUTO: TStringField
      DisplayWidth = 50
      FieldName = 'NOME_PRODUTO'
      Size = 50
    end
    object CDS_DADOS_ITEMNCM: TStringField
      FieldName = 'NCM'
    end
    object CDS_DADOS_ITEMICMS_CST: TStringField
      FieldName = 'ICMS_CST'
    end
    object CDS_DADOS_ITEMCFOP: TStringField
      FieldName = 'CFOP'
    end
    object CDS_DADOS_ITEMUNIDADE_ITEM: TStringField
      FieldName = 'UNIDADE_ITEM'
    end
    object CDS_DADOS_ITEMQTD_PRODUTO: TIntegerField
      FieldName = 'QTD_PRODUTO'
    end
    object CDS_DADOS_ITEMVLR_UNIT_PRODUTO: TFloatField
      DisplayLabel = 'VLR_UNIT_PRODUTO'
      FieldName = 'VLR_PRODUTO'
      DisplayFormat = ' ###,####0.0000'
    end
    object CDS_DADOS_ITEMVLR_TOTAL_PRODUTO: TFloatField
      FieldName = 'VLR_TOTAL_PRODUTO'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_ITEMICMS_BC: TFloatField
      FieldName = 'ICMS_BC'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_ITEMICMS_VLR: TFloatField
      FieldName = 'ICMS_VLR'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_ITEMICMS_PERC: TFloatField
      FieldName = 'ICMS_PERC'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_ITEMEAN_PRODUTO: TStringField
      FieldName = 'EAN_PRODUTO'
    end
    object CDS_DADOS_ITEMVLR_DESC: TStringField
      FieldName = 'VLR_DESC'
    end
    object CDS_DADOS_ITEMIPI_BC: TStringField
      FieldName = 'IPI_BC'
    end
    object CDS_DADOS_ITEMIPI_PERC: TStringField
      FieldName = 'IPI_PERC'
    end
    object CDS_DADOS_ITEMIPI_VLR: TStringField
      FieldName = 'IPI_VLR'
    end
    object CDS_DADOS_ITEMPIS_BC: TStringField
      FieldName = 'PIS_BC'
    end
    object CDS_DADOS_ITEMPIS_PERC: TStringField
      FieldName = 'PIS_PERC'
    end
    object CDS_DADOS_ITEMPIS_VLR: TStringField
      FieldName = 'PIS_VLR'
    end
    object CDS_DADOS_ITEMCOFINS_BC: TStringField
      FieldName = 'COFINS_BC'
    end
    object CDS_DADOS_ITEMCOFINS_PERC: TStringField
      FieldName = 'COFINS_PERC'
    end
    object CDS_DADOS_ITEMCOFINS_VLR: TStringField
      FieldName = 'COFINS_VLR'
    end
    object CDS_DADOS_ITEMLOTE_NRO_LOTE: TStringField
      FieldName = 'LOTE_NRO_LOTE'
    end
    object CDS_DADOS_ITEMLOTE_FABRICACAO_LOTE: TStringField
      FieldName = 'LOTE_FABRICACAO_LOTE'
    end
    object CDS_DADOS_ITEMLOTE_VALIDADE_LOTE: TStringField
      FieldName = 'LOTE_VALIDADE_LOTE'
    end
    object CDS_DADOS_ITEMLOTE_PRECO_CONS: TStringField
      FieldName = 'LOTE_PRECO_CONS'
    end
    object CDS_DADOS_ITEMLOTE_QTD_LOTE: TStringField
      FieldName = 'LOTE_QTD_LOTE'
    end
    object CDS_DADOS_ITEMICMS_PC_REDUCAO_BASE_CALCULO: TFloatField
      FieldName = 'ICMS_PC_REDUCAO_BASE_CALCULO'
    end
    object CDS_DADOS_ITEMICMS_BCST: TFloatField
      FieldName = 'ICMS_BCST'
    end
    object CDS_DADOS_ITEMICMS_VLR_BCST: TFloatField
      FieldName = 'ICMS_VLR_BCST'
    end
    object CDS_DADOS_ITEMALERTA_ITEM: TStringField
      FieldName = 'ALERTA_ITEM'
    end
  end
  object DS_DADOS_ITEM: TDataSource
    DataSet = CDS_DADOS_ITEM
    Left = 88
    Top = 184
  end
  object CDS_DADOS_LOTE_ITEM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 224
    object CDS_DADOS_LOTE_ITEMNRO_LOTE: TStringField
      FieldName = 'NRO_LOTE'
    end
    object CDS_DADOS_LOTE_ITEMQTD_LOTE: TStringField
      FieldName = 'QTD_LOTE'
    end
    object CDS_DADOS_LOTE_ITEMDT_FABRICACAO: TStringField
      FieldName = 'DT_FABRICACAO'
    end
    object CDS_DADOS_LOTE_ITEMDT_VALIDADE: TStringField
      FieldName = 'DT_VALIDADE'
    end
    object CDS_DADOS_LOTE_ITEMVLR_PRECO_CONSUMIDOR: TStringField
      FieldName = 'VLR_PRECO_CONSUMIDOR'
    end
  end
  object CDS_DADOS_TRANSPORTE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 512
    object CDS_DADOS_TRANSPORTENOME_TRASPORTADOR: TStringField
      DisplayWidth = 50
      FieldName = 'NOME_TRASPORTADOR'
      Size = 50
    end
    object CDS_DADOS_TRANSPORTEQTD_VOLUME: TIntegerField
      FieldName = 'QTD_VOLUME'
    end
    object CDS_DADOS_TRANSPORTEPESO_LIQUIDO: TStringField
      FieldName = 'PESO_LIQUIDO'
    end
    object CDS_DADOS_TRANSPORTEPESO_BRUTO: TStringField
      FieldName = 'PESO_BRUTO'
    end
    object CDS_DADOS_TRANSPORTEESPECIE_VOLUME: TStringField
      FieldName = 'ESPECIE_VOLUME'
    end
  end
  object CDS_DADOS_ADC: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 504
    object CDS_DADOS_ADCDS_DADOS_ADC: TMemoField
      FieldName = 'DS_DADOS_ADC'
      BlobType = ftMemo
    end
    object CDS_DADOS_ADCDS_DADOS_FISCO: TMemoField
      FieldName = 'DS_DADOS_FISCO'
      BlobType = ftMemo
    end
  end
  object CDS_DADOS_DUPLICATA: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 520
    object CDS_DADOS_DUPLICATANR_DUPLICATA: TStringField
      FieldName = 'NR_DUPLICATA'
    end
    object CDS_DADOS_DUPLICATAVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
      DisplayFormat = '###,##0.00'
    end
    object CDS_DADOS_DUPLICATADT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
  end
  object DS_DADOS_DUPLICATA: TDataSource
    DataSet = CDS_DADOS_DUPLICATA
    Left = 168
    Top = 520
  end
  object XMLDoc: TXMLDocument
    Left = 352
    Top = 176
    DOMVendorDesc = 'MSXML'
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 240
    object GERARPLANILHAEXCEL1: TMenuItem
      Caption = 'GERAR PLANILHA EXCEL'
      OnClick = GERARPLANILHAEXCEL1Click
    end
  end
  object qryconsulta_GED: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CHAVE_NFE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT CD_FORNECEDOR, NOMP_P, DT_EMISSAO, A.DT_ATUALIZACAO, NM_C' +
        'OMPRADOR_REDUZIDO,DS_NFE_CHAVE,NR_NFE, CGCP_P, REPP_F, A.NR_PEDI' +
        'DO_COMPRA, UTL_COMPRESS.LZ_UNCOMPRESS(A.DS_NFE_XML) DS_NFE_XML'
      
        'FROM PRDDM.DC_NFE_COMPRA_GED A, PRDDM.DCPES,PRDDM.DCFOR,PRDDM.DC' +
        'LAB,PRDDM.DC_COMPRADOR_GAM '
      'WHERE CGCP_P = A.NR_CNPJ_EMITENTE'
      'AND CD_FORNECEDOR = NROF_F'
      'AND LABF_F = NROL_L'
      'AND COML_L = NR_COMPRADOR'
      'AND DS_NFE_CHAVE = :CHAVE_NFE'
      'ORDER BY DT_ATUALIZACAO,NOMP_P')
    SQLConnection = _dm._conexao
    Left = 176
    Top = 208
  end
end
