object _frmImportaPrecoFornecedor: T_frmImportaPrecoFornecedor
  Left = 0
  Top = 0
  Caption = 'Importa Pre'#231'o Fornecedor'
  ClientHeight = 496
  ClientWidth = 1276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1276
    496)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 464
    Top = 16
    Width = 20
    Height = 13
    Caption = 'De :'
  end
  object _stbMensagem: TStatusBar
    Left = 0
    Top = 477
    Width = 1276
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    OnDrawPanel = _stbMensagemDrawPanel
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1276
    Height = 105
    Align = alTop
    Caption = 'Importa Arquivo'
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Caminho Arquivo'
    end
    object Label2: TLabel
      Left = 37
      Top = 17
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object _gaPlanilha: TGauge
      Left = 1064
      Top = 14
      Width = 233
      Height = 13
      Progress = 0
    end
    object _edtArquivo: TEdit
      Left = 96
      Top = 41
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object _btnImportaLista: TBitBtn
      Left = 410
      Top = 41
      Width = 41
      Height = 21
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000088888008888888888800000088880FF000000000080000008880
        F0080FFFFFFF08000000880F0FF00F00000F0800000080F0F0080FFFFFFF0800
        0000880F0FF00F00000F0800000080F0F0080FFFFFFF08000000880F0FB00F00
        F0000800000080F0FBFB0FFFF0F088000000880FBFBF0FFFF0088800000080FB
        FBFB00000088880000008800BFBFBFBF088888000000888800FBFBF088888800
        000088888800B808888888000000888888880088888888000000888888888888
        888888000000888888888888888888000000}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = _btnImportaListaClick
    end
    object _edtNrFornecedor: TEdit
      Left = 95
      Top = 14
      Width = 64
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNmForncedor: TEdit
      Left = 165
      Top = 14
      Width = 244
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object _btnImportaPlanilha: TBitBtn
      Left = 592
      Top = 44
      Width = 137
      Height = 25
      Caption = 'Pre'#231'os Diferentes'
      DoubleBuffered = True
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000007777777777777777770000007777777777770007770000007444
        4400000006007700000074FFFF08880600080700000074F008000060EE070700
        000074FFFFF8060EE0047700000074F0088060EE00F47700000074FFFF060EE0
        00747700000074F00800EE0EE0047700000074FFFF0EE0F0EE047700000074F0
        080000F000047700000074FFFFFFFFFFFFF47700000074444444444444447700
        000074F444F444F444F477000000744444444444444477000000777777777777
        777777000000777777777777777777000000}
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = _btnImportaPlanilhaClick
    end
    object GroupBox4: TGroupBox
      Left = 743
      Top = 4
      Width = 554
      Height = 98
      Caption = 'Lista Ativa'
      TabOrder = 5
      object DBGrid2: TDBGrid
        Left = 2
        Top = 15
        Width = 550
        Height = 81
        Align = alClient
        DataSource = _dsListaPreco
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
      end
    end
    object _chkListaDiferenca: TCheckBox
      Left = 608
      Top = 16
      Width = 121
      Height = 17
      Caption = 'Lista Apenas Difer.'
      TabOrder = 6
      OnClick = _chkListaDiferencaClick
    end
    object _btnImportaDados: TBitBtn
      Left = 95
      Top = 68
      Width = 153
      Height = 25
      Caption = 'Grava Lista na Base'
      DoubleBuffered = True
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888888888888888800000000088088880FFFFFFF088008880F00F
        00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
        C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
        888888888888888888888888888888888888}
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = _btnImportaDadosClick
    end
    object _chkListaFornecedor: TCheckBox
      Left = 568
      Top = 75
      Width = 161
      Height = 17
      Caption = 'Lista Excel com Pre'#231'o Base'
      Enabled = False
      TabOrder = 8
      OnClick = _chkListaFornecedorClick
    end
    object gr: TGroupBox
      Left = 455
      Top = -1
      Width = 107
      Height = 105
      Caption = 'Validade Lista Pre'#231'o'
      TabOrder = 9
      object Label3: TLabel
        Left = 7
        Top = 58
        Width = 21
        Height = 13
        Caption = 'Ate:'
      end
      object _dtpDataInicial: TDateTimePicker
        Left = 7
        Top = 31
        Width = 94
        Height = 21
        Date = 44473.602055636580000000
        Time = 44473.602055636580000000
        TabOrder = 0
      end
      object _dtpDataFinal: TDateTimePicker
        Left = 7
        Top = 73
        Width = 94
        Height = 21
        Date = 44473.602055636580000000
        Time = 44473.602055636580000000
        TabOrder = 1
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 110
    Width = 737
    Height = 364
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Produtos'
    TabOrder = 2
    object _dbgListaPreço: TDBGrid
      Left = 2
      Top = 15
      Width = 733
      Height = 347
      Align = alClient
      DataSource = _dsTabelaPrecoFornecedor
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgListaPreçoDrawColumnCell
      OnDblClick = _dbgListaPreçoDblClick
      OnTitleClick = _dbgListaPreçoTitleClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 743
    Top = 107
    Width = 568
    Height = 364
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Lista Base X Lista Pre'#231'os  '
    TabOrder = 3
    object _dbgBaseXLista: TDBGrid
      Left = 2
      Top = 15
      Width = 564
      Height = 347
      Align = alClient
      DataSource = _dsLIstaBaseXListaPreco
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgBaseXListaDrawColumnCell
      OnTitleClick = _dbgBaseXListaTitleClick
    end
  end
  object _opdLocalizaArquivo: TOpenDialog
    Filter = 
      'Arquivo Excel|*.XLS;*.XLSX|Arquivo Textol|*.txt|Arquivos Excel 2' +
      '013|*.XLSX|Arquivos LibreOffice|*.ods'
    Left = 8
    Top = 16
  end
  object _cdsTabelaProdutoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 168
  end
  object _cdsTabelaPrecoFornecedor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 176
    Data = {
      050100009619E0BD01000000180000000A0000000000030000000501134E525F
      4C495354415F464F524E454345444F5204000100000000000D4E525F4D455243
      41444F52494104000100000000000C51545F454D42414C4147454D0400010000
      00000010564C5F43414958415F46454348414441080004000000000019564C5F
      43414958415F464543484144415F444553434F4E544F08000400000000000B56
      4C5F554E49544152494F080004000000000014564C5F554E49544152494F5F44
      4553434F4E544F08000400000000000B50435F444553434F4E544F0800040000
      0000000A43445F454D50524553410400010000000000084E525F564552424104
      000100000000000000}
    object _cdsTabelaPrecoFornecedorNR_LISTA_FORNECEDOR: TIntegerField
      DisplayLabel = 'Nr. Lista'
      FieldName = 'NR_LISTA_FORNECEDOR'
    end
    object _cdsTabelaPrecoFornecedorNR_MERCADORIA: TIntegerField
      DisplayLabel = 'Nr. Produto'
      FieldName = 'NR_MERCADORIA'
    end
    object _cdsTabelaPrecoFornecedorQT_EMBALAGEM: TIntegerField
      DisplayLabel = 'Qtd. Embal.'
      DisplayWidth = 6
      FieldName = 'QT_EMBALAGEM'
    end
    object _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA: TFloatField
      DisplayLabel = 'Vlr. Cx. fechada'
      FieldName = 'VL_CAIXA_FECHADA'
      DisplayFormat = '##,##0.00'
    end
    object _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA_DESCONTO: TFloatField
      DisplayLabel = 'Vlr. Cx. c/Desconto'
      FieldName = 'VL_CAIXA_FECHADA_DESCONTO'
      DisplayFormat = '##,##0.00'
    end
    object _cdsTabelaPrecoFornecedorVL_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit.'
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '##,##0.00'
    end
    object _cdsTabelaPrecoFornecedorVL_UNITARIO_DESCONTO: TFloatField
      DisplayLabel = 'Vlr. Unit.c/Desc.'
      FieldName = 'VL_UNITARIO_DESCONTO'
      DisplayFormat = '##,##0.00'
    end
    object _cdsTabelaPrecoFornecedorPC_DESCONTO: TFloatField
      DisplayLabel = '% Desc.Adicional'
      DisplayWidth = 6
      FieldName = 'PC_DESCONTO'
      DisplayFormat = '##0.00'
    end
    object _cdsTabelaPrecoFornecedorCD_EMPRESA: TIntegerField
      DisplayLabel = 'CD.'
      DisplayWidth = 2
      FieldName = 'CD_EMPRESA'
    end
    object _cdsTabelaPrecoFornecedorNR_VERBA: TIntegerField
      DisplayLabel = 'nr. Verba'
      FieldName = 'NR_VERBA'
    end
  end
  object _dsTabelaProdutoFornecedor: TDataSource
    DataSet = _cdsTabelaProdutoFornecedor
    Left = 72
    Top = 216
  end
  object _dsTabelaPrecoFornecedor: TDataSource
    DataSet = _cdsTabelaPrecoFornecedor
    Left = 608
    Top = 240
  end
  object _cdsListaPrecoAtiva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 904
    Top = 32
  end
  object _dsListaPreco: TDataSource
    DataSet = _cdsListaPrecoAtiva
    Left = 1024
    Top = 32
  end
  object _cdsLIstaBaseXListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 888
    Top = 200
  end
  object _dsLIstaBaseXListaPreco: TDataSource
    DataSet = _cdsLIstaBaseXListaPreco
    Left = 984
    Top = 216
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 459
    Top = 285
  end
end
