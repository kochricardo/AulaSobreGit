object _frmRelatorioClassificacaoProduto: T_frmRelatorioClassificacaoProduto
  Left = 0
  Top = 0
  Caption = 'Classifica'#231#227'o de Produtos'
  ClientHeight = 615
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 664
    Top = 400
    Width = 73
    Height = 13
    Caption = 'Nr. Fornecedor'
  end
  object Label2: TLabel
    Left = 667
    Top = 441
    Width = 71
    Height = 13
    Caption = 'Nr. Comprador'
  end
  object Label18: TLabel
    Left = 841
    Top = 420
    Width = 71
    Height = 13
    Caption = 'Estoque do CD'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 596
    Width = 1002
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1002
    Height = 377
    Align = alTop
    Caption = 'Rela'#231#227'o de Produtod'
    TabOrder = 1
    object _dbgProduto: TDBGrid
      Left = 2
      Top = 15
      Width = 998
      Height = 360
      Align = alClient
      DataSource = _dsProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgProdutoDrawColumnCell
      OnTitleClick = _dbgProdutoTitleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 383
    Width = 215
    Height = 153
    Caption = 'Tipo Produto'
    TabOrder = 2
    object _clbTipo: TCheckListBox
      Left = 2
      Top = 15
      Width = 211
      Height = 136
      Cursor = crHandPoint
      OnClickCheck = _clbTipoClickCheck
      Align = alClient
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      Style = lbOwnerDrawFixed
      TabOrder = 0
      OnDrawItem = _clbTipoDrawItem
    end
    object _dbgTipoProduto: TDBGrid
      Left = 2
      Top = 15
      Width = 211
      Height = 136
      Align = alClient
      DataSource = _dsTipoProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgTipoProdutoDrawColumnCell
      OnDblClick = _dbgTipoProdutoDblClick
      OnKeyDown = _dbgTipoProdutoKeyDown
    end
  end
  object GroupBox3: TGroupBox
    Left = 217
    Top = 383
    Width = 215
    Height = 189
    Caption = 'Sub.Tipo'
    TabOrder = 3
    object _clbSubTipo: TCheckListBox
      Left = 2
      Top = 15
      Width = 211
      Height = 172
      Cursor = crHandPoint
      OnClickCheck = _clbSubTipoClickCheck
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Sorted = True
      Style = lbOwnerDrawFixed
      TabOrder = 0
      OnDrawItem = _clbSubTipoDrawItem
    end
    object _dbgSubTipo: TDBGrid
      Left = 2
      Top = 15
      Width = 211
      Height = 172
      Align = alClient
      DataSource = _dsSubTipoProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgSubTipoDrawColumnCell
      OnDblClick = _dbgSubTipoDblClick
      OnKeyDown = _dbgSubTipoKeyDown
    end
  end
  object GroupBox4: TGroupBox
    Left = 434
    Top = 383
    Width = 215
    Height = 210
    Caption = 'Categoria'
    TabOrder = 4
    object _clbCategoria: TCheckListBox
      Left = 2
      Top = 15
      Width = 211
      Height = 193
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Style = lbOwnerDrawFixed
      TabOrder = 0
      OnDrawItem = _clbCategoriaDrawItem
    end
    object _dbgCategoria: TDBGrid
      Left = 2
      Top = 15
      Width = 211
      Height = 193
      Align = alClient
      DataSource = _dsCategoria
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgCategoriaDrawColumnCell
      OnDblClick = _dbgCategoriaDblClick
      OnKeyDown = _dbgCategoriaKeyDown
    end
  end
  object _btnExecuta: TBitBtn
    Left = 664
    Top = 496
    Width = 121
    Height = 25
    Caption = 'Executa'
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
    TabOrder = 5
    OnClick = _btnExecutaClick
  end
  object _btnParaExcel: TBitBtn
    Left = 822
    Top = 496
    Width = 129
    Height = 25
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
    TabOrder = 6
    OnClick = _btnParaExcelClick
  end
  object _edtNrFornecedor: TEdit
    Left = 664
    Top = 416
    Width = 80
    Height = 21
    NumbersOnly = True
    TabOrder = 7
  end
  object _edtNrComprador: TEdit
    Left = 667
    Top = 456
    Width = 80
    Height = 21
    NumbersOnly = True
    TabOrder = 8
  end
  object BitBtn2: TBitBtn
    Left = 838
    Top = 565
    Width = 113
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
    TabOrder = 9
    OnClick = BitBtn2Click
  end
  object _cbxOpcaoCDs: TComboBox
    Left = 838
    Top = 438
    Width = 98
    Height = 21
    Ctl3D = False
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 10
    Text = 'CD Tubar'#227'o'
    Items.Strings = (
      'CD Tubar'#227'o'
      'CD Sta Cruz do Sul')
  end
  object _cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 56
  end
  object _cdsTipoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 240
  end
  object _dsTipoProduto: TDataSource
    DataSet = _cdsTipoProduto
    Left = 64
    Top = 288
  end
  object _cdsSubTipoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 248
  end
  object _dsSubTipoProduto: TDataSource
    DataSet = _cdsSubTipoProduto
    Left = 272
    Top = 304
  end
  object _cdsCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 264
  end
  object _dsCategoria: TDataSource
    DataSet = _cdsCategoria
    Left = 464
    Top = 312
  end
  object _dsProdutos: TDataSource
    DataSet = _cdsProdutos
    Left = 640
    Top = 120
  end
end
