object _frmRelatorioProdutoFornecedor: T_frmRelatorioProdutoFornecedor
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Produto Fornecedor'
  ClientHeight = 492
  ClientWidth = 1039
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 473
    Width = 1039
    Height = 19
    Panels = <>
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 1039
    Height = 137
    Align = alTop
    Caption = 'Filtro'
    TabOrder = 1
    DesignSize = (
      1039
      137)
    object Label3: TLabel
      Left = 154
      Top = 26
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object Label5: TLabel
      Left = 255
      Top = 27
      Width = 85
      Height = 13
      Caption = 'Nome Fornecedor'
    end
    object Label18: TLabel
      Left = 14
      Top = 21
      Width = 71
      Height = 13
      Caption = 'Estoque do CD'
    end
    object Label4: TLabel
      Left = 151
      Top = 63
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label6: TLabel
      Left = 255
      Top = 63
      Width = 83
      Height = 13
      Caption = 'Nome Comprador'
    end
    object _edtNrFornecedor: TEdit
      Left = 151
      Top = 40
      Width = 97
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNomeFornecedor: TEdit
      Left = 254
      Top = 40
      Width = 357
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 14
      Top = 38
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 2
      Text = 'CD SC e CD RS'
      Items.Strings = (
        'CD SC e CD RS'
        'CD Tubar'#227'o'
        'CS Sta Cruz do Sul')
    end
    object _edtNrComprador: TEdit
      Left = 151
      Top = 77
      Width = 97
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnKeyDown = _edtNrCompradorKeyDown
    end
    object _edtNomeComprador: TEdit
      Left = 254
      Top = 78
      Width = 357
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object _btnPesquisar: TBitBtn
      Left = 856
      Top = 14
      Width = 153
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      DoubleBuffered = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = _btnPesquisarClick
    end
    object _btnParaExcel: TBitBtn
      Left = 856
      Top = 56
      Width = 153
      Height = 38
      Anchors = [akTop, akRight]
      Caption = 'Gerar Excel   '
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
      TabOrder = 6
      OnClick = _btnLayoutPedidoClick
    end
    object BitBtn1: TBitBtn
      Left = 856
      Top = 96
      Width = 153
      Height = 39
      Caption = 'Excel LayOut Ped.'
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
      TabOrder = 7
      OnClick = BitBtn1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 137
    Width = 1039
    Height = 320
    Align = alTop
    Caption = 'Produtos '
    TabOrder = 2
    object _dbgProduto: TDBGrid
      Left = 2
      Top = 15
      Width = 1035
      Height = 303
      Align = alClient
      Ctl3D = False
      DataSource = _dsProdutoFornecedor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = _dbgProdutoTitleClick
    end
  end
  object _dsProdutoFornecedor: TDataSource
    Left = 656
    Top = 24
  end
  object _cdsProdutoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 632
    Top = 64
  end
end
