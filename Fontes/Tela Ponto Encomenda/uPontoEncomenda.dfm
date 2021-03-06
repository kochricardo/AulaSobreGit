object _frmPontoEncomenda: T_frmPontoEncomenda
  Left = 0
  Top = 0
  Caption = 'Ponto Encomenda'
  ClientHeight = 538
  ClientWidth = 1193
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
  OnKeyPress = FormKeyPress
  DesignSize = (
    1193
    538)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 519
    Width = 1193
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1193
    Height = 81
    Align = alTop
    Caption = 'Filtro Comprador'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object _lbeCOmprador: TLabel
      Left = 16
      Top = 15
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label1: TLabel
      Left = 16
      Top = 41
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object _edtComprador: TEdit
      Left = 75
      Top = 13
      Width = 64
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
    end
    object _btnExecutaPonto: TBitBtn
      Left = 840
      Top = 35
      Width = 137
      Height = 25
      Caption = 'Executa Ponto'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = _btnExecutaPontoClick
    end
    object _edtNrFornecedor: TEdit
      Left = 75
      Top = 38
      Width = 64
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      OnKeyDown = _edtNrFornecedorKeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 81
    Width = 545
    Height = 262
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Fornecedor(es) com Ponto de Encomenda'
    TabOrder = 2
    object _dbgFornecedor: TDBGrid
      Left = 2
      Top = 15
      Width = 541
      Height = 245
      Align = alClient
      DataSource = _dsFornecedores
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgFornecedorDrawColumnCell
      OnTitleClick = _dbgFornecedorTitleClick
    end
  end
  object _btnFechar: TBitBtn
    Left = 1024
    Top = 480
    Width = 124
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = '&Fechar'
    DoubleBuffered = True
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000C30E0000C30E00000000000000000000FFFFFFF2F2F2
      F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
      F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFFFFFFF0000FFFF
      FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
      E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6FFFFFF
      0000D3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
      DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
      ECD3D3D30000E6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
      EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
      E2E2DBDBDBF3F3F300004B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
      4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
      4C4C0D3232324848484E4E4E0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
      007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
      8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
      FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
      7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBF0000BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
      7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
      0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
      6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
      BFBFBFBF0000AEAEAE57574531310A272700272700272700424200FFFF00F9F9
      009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
      6363BFBFBFBFBFBF00008989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
      FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
      474700636363BFBFBFBFBFBF0000898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
      FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
      007F7F00474700636363BFBFBFBFBFBF0000A7A7A76F6F4879790C7A7A0A7A7A
      0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
      8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFB1B1B1A9A9A9A9
      A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
      FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
      7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
      7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
      0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
      BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
      447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
      7676BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF4141415656565656565656565656565656565656565656562E2E2E888807
      65650C888888BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
      89898989898989B1B1B1BFBFBFBFBFBF0000}
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = _btnFecharClick
  end
  object GroupBox3: TGroupBox
    Left = 546
    Top = 81
    Width = 639
    Height = 260
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Itens que faltaram antes do Proximo Pedido'
    TabOrder = 4
    object _dbgItemPonto: TDBGrid
      Left = 2
      Top = 15
      Width = 635
      Height = 243
      Align = alClient
      DataSource = _dsItensPontoEncomenda
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = _dbgItemPontoCellClick
      OnDrawColumnCell = _dbgItemPontoDrawColumnCell
      OnDblClick = _dbgItemPontoDblClick
      OnMouseMove = _dbgItemPontoMouseMove
    end
  end
  object _edtTotalPedidos: TEdit
    Left = 296
    Top = 492
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 5
  end
  object _edtNrItens: TEdit
    Left = 120
    Top = 492
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 6
  end
  object _btnGerarPedido: TBitBtn
    Left = 664
    Top = 488
    Width = 113
    Height = 25
    Caption = 'Gerar Pedido'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = _btnGerarPedidoClick
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 349
    Width = 1177
    Height = 102
    Caption = 'GroupBox4'
    TabOrder = 8
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1173
      Height = 85
      Align = alClient
      DataSource = _dsPontoEncomendaItem
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
    end
  end
  object _cdsPontoEncomendaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 840
    Top = 224
  end
  object _dsPontoEncomendaItem: TDataSource
    DataSet = _cdsPontoEncomendaItem
    Left = 944
    Top = 288
  end
  object _cdsPontoEncomendaCapa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 120
  end
  object _dsPontoEncomendaCapa: TDataSource
    DataSet = _cdsPontoEncomendaCapa
    Left = 904
    Top = 128
  end
  object _cdsFornecedores: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 256
    Top = 128
    Data = {
      BE0000009619E0BD010000001800000007000000000003000000BE000549445F
      434401004900000001000557494454480200020002000D4E525F464F524E4543
      45444F5204000100000000000D4E4D5F464F524E454345444F52010049000000
      0100055749445448020002003C00084E525F4954454E5304000100000000000D
      4E525F5155414E54494441444504000100000000000F564C5F544F54414C5F50
      454449444F08000400000000000A43445F454D50524553410400010000000000
      0000}
    object _cdsFornecedoresID_CD: TStringField
      FieldName = 'ID_CD'
      Size = 2
    end
    object _cdsFornecedoresNR_FORNECEDOR: TIntegerField
      DisplayLabel = 'Nr. Fornec.'
      DisplayWidth = 8
      FieldName = 'NR_FORNECEDOR'
    end
    object _cdsFornecedoresNM_FORNECEDOR: TStringField
      DisplayLabel = 'Nome Fornecedor'
      DisplayWidth = 35
      FieldName = 'NM_FORNECEDOR'
      Size = 60
    end
    object _cdsFornecedoresNR_ITENS: TIntegerField
      DisplayLabel = 'Nr. Itens'
      DisplayWidth = 8
      FieldName = 'NR_ITENS'
      DisplayFormat = '###,###,##0'
    end
    object _cdsFornecedoresNR_QUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'NR_QUANTIDADE'
      DisplayFormat = '###,###,##0'
    end
    object _cdsFornecedoresVL_TOTAL_PEDIDO: TFloatField
      DisplayLabel = 'Vlr. Total Pedido'
      FieldName = 'VL_TOTAL_PEDIDO'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsFornecedoresCD_EMPRESA: TIntegerField
      DisplayLabel = 'CD'
      DisplayWidth = 2
      FieldName = 'CD_EMPRESA'
    end
    object _cdsFornecedoresNR_TOTAL_ITENS: TAggregateField
      FieldName = 'NR_TOTAL_ITENS'
      Active = True
      Expression = 'SUM(NR_ITENS)'
    end
    object _cdsFornecedoresVL_TOTAL_PEDIDO2: TAggregateField
      FieldName = 'VL_TOTAL_PEDIDO'
      Active = True
      Expression = 'SUM(VL_TOTAL_PEDIDO)'
    end
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 168
  end
  object _dsFornecedores: TDataSource
    DataSet = _cdsFornecedores
    Left = 472
    Top = 104
  end
  object _dsItensPontoEncomenda: TDataSource
    DataSet = _cdsItensPontoEncomenda
    Left = 464
    Top = 264
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 40
  end
  object _cdsItensPontoEncomenda: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'NR_FORNECEDOR;CD_EMPRESA'
    MasterFields = 'NR_FORNECEDOR;CD_EMPRESA'
    MasterSource = _dsFornecedores
    PacketRecords = 0
    Params = <>
    Left = 208
    Top = 184
    Data = {
      230100009619E0BD01000000180000000C00000000000300000023010A43445F
      50524F4455544F04000100000000000A4E4D5F50524F4455544F010049000000
      0100055749445448020002001E000F44535F4150524553454E544143414F0100
      490000000100055749445448020002001E000951545F50454449444F04000100
      0000000007564C5F4954454D08000400000000000756545F4954454D08000400
      000000000A4E525F50524F4455544F04000100000000000D4E525F464F524E45
      4345444F5204000100000000000A43445F454D50524553410400010000000000
      0F4E525F444941535F4553544F51554504000100000000000C564C5F4D454449
      415F44494108000400000000000F4E525F5154445F5355474552494441040001
      00000000000000}
    object _cdsItensPontoEncomendaCD_PRODUTO: TIntegerField
      DisplayLabel = 'Cod.Prod.'
      DisplayWidth = 8
      FieldName = 'CD_PRODUTO'
    end
    object _cdsItensPontoEncomendaNM_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NM_PRODUTO'
      Size = 30
    end
    object _cdsItensPontoEncomendaDS_APRESENTACAO: TStringField
      DisplayLabel = 'Apresenta'#231#227'o'
      FieldName = 'DS_APRESENTACAO'
      Size = 30
    end
    object _cdsItensPontoEncomendaQT_PEDIDO: TIntegerField
      DisplayLabel = 'Qtd.Pedido'
      FieldName = 'QT_PEDIDO'
    end
    object _cdsItensPontoEncomendaVL_ITEM: TFloatField
      DisplayLabel = 'Vlr. Item'
      FieldName = 'VL_ITEM'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsItensPontoEncomendaVT_ITEM: TFloatField
      DisplayLabel = 'Total Item'
      FieldName = 'VT_ITEM'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsItensPontoEncomendaNR_PRODUTO: TIntegerField
      FieldName = 'NR_PRODUTO'
      Visible = False
    end
    object _cdsItensPontoEncomendaNR_FORNECEDOR: TIntegerField
      FieldName = 'NR_FORNECEDOR'
      Visible = False
    end
    object _cdsItensPontoEncomendaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Visible = False
    end
    object _cdsItensPontoEncomendaNR_DIAS_ESTOQUE: TIntegerField
      FieldName = 'NR_DIAS_ESTOQUE'
      Visible = False
    end
    object _cdsItensPontoEncomendaVL_MEDIA_DIA: TFloatField
      FieldName = 'VL_MEDIA_DIA'
      Visible = False
    end
    object _cdsItensPontoEncomendaNR_QTD_SUGERIDA: TIntegerField
      FieldName = 'NR_QTD_SUGERIDA'
      Visible = False
    end
  end
end
