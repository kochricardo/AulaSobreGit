object _frmRelatorioEstoquePorCD: T_frmRelatorioEstoquePorCD
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Estoque Por CD'
  ClientHeight = 532
  ClientWidth = 1279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 513
    Width = 1279
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1279
    Height = 113
    Align = alTop
    Caption = 'Filtro'
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 18
      Height = 13
      Caption = 'CD.'
    end
    object BitBtn1: TBitBtn
      Left = 560
      Top = 82
      Width = 145
      Height = 25
      Caption = 'Relatorio Estoque'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object _chkMotraItens: TCheckBox
      Left = 296
      Top = 88
      Width = 161
      Height = 17
      Caption = 'Mostra Detalhe Produtos'
      TabOrder = 1
    end
    object _cobComprador: TComboBox
      Left = 24
      Top = 29
      Width = 169
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'Comprador'
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 24
      Top = 71
      Width = 169
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object _chkDetalhefornecedor: TCheckBox
      Left = 296
      Top = 69
      Width = 161
      Height = 17
      Caption = 'Mostra Detalhe Fornecedores'
      TabOrder = 4
    end
    object _btnExceEstoque: TBitBtn
      Left = 848
      Top = 82
      Width = 201
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
      TabOrder = 5
      OnClick = _btnExceEstoqueClick
    end
    object _chkDetalheCD: TCheckBox
      Left = 296
      Top = 32
      Width = 161
      Height = 17
      Caption = 'Mostra Detalhe CD'
      TabOrder = 6
    end
    object _chkDetalheComprador: TCheckBox
      Left = 296
      Top = 50
      Width = 161
      Height = 17
      Caption = 'Mostra Detalhe Comprador'
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 113
    Width = 1279
    Height = 394
    Align = alTop
    Caption = 'Detalhe'
    TabOrder = 2
    object _dbgDetalhe: TDBGrid
      Left = 2
      Top = 15
      Width = 1275
      Height = 377
      Align = alClient
      DataSource = _dsDetalheEstoque
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = _dbgDetalheTitleClick
    end
  end
  object _cdsDetalheEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 168
    Top = 120
  end
  object _dsDetalheEstoque: TDataSource
    DataSet = _cdsDetalheEstoque
    Left = 248
    Top = 136
  end
end
