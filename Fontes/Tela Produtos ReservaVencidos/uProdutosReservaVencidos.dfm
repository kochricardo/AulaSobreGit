object _frmRelatorioProdutoReservaVencidos: T_frmRelatorioProdutoReservaVencidos
  Left = 0
  Top = 0
  Caption = 'Relatorio Produto Reserva Vencidos'
  ClientHeight = 489
  ClientWidth = 1214
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 1214
    Height = 19
    Panels = <>
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 1214
    Height = 145
    Align = alTop
    Caption = 'Filtro'
    TabOrder = 1
    DesignSize = (
      1214
      145)
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
      Top = 38
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
      Top = 78
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
    object _btnParaExcel: TBitBtn
      Left = 977
      Top = 91
      Width = 153
      Height = 39
      Anchors = [akTop, akRight]
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
      TabOrder = 5
      OnClick = _btnParaExcelClick
    end
    object _btnAbreTabela: TBitBtn
      Left = 977
      Top = 27
      Width = 153
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Pesquisa'
      DoubleBuffered = True
      Glyph.Data = {
        DE020000424DDE02000000000000B60000002800000016000000170000000100
        08000000000028020000C30E0000C30E0000200000000000000000FF0000FFFF
        FF0080808000C0C0C00000000000FF000000FFFF00000000FF0000FFFF0045CA
        BF004B737F00D0B4B400CC625700FF31310000CEFF000079FF000029FF005E5E
        FF00BDBDFF00502B2D0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010101010101
        0101010101010101010101010101010100000103030303030303030303030303
        0303030404040301000001030303030303030303030303030303040701070401
        0000010303030303030303030303030303040701010704010000010303030303
        0303030303030303040701010707040100000103030303030303030303030304
        0701010707040301000001030303030303030303030304070101070704030301
        0000010303030303030303030304070101070704030303010000010303030303
        0303030304070101070704030303030100000103030303030303030404040307
        0704030303030301000001030303030304040404040404070403030303030301
        0000010303030404060106010104040403030303030303010000010303040106
        0106010101010403030303030303030100000103030406010601060106010403
        0303030303030301000001030406010601010106010601040303030303030301
        0000010304010601060106010601010403030303030303010000010304060106
        0106010601060104030303030303030100000103040106010601060106010104
        0303030303030301000001030304010601010106010604030303030303030301
        0000010303040601060106010601040303030303030303010000010303030404
        0101010604040303030303030303030100000103030303030404040403030303
        0303030303030301000001010101010101010101010101010101010101010101
        0000}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = _btnAbreTabelaClick
    end
    object _rgReserva: TRadioGroup
      Left = 657
      Top = 21
      Width = 152
      Height = 104
      Caption = 'Reserva'
      Enabled = False
      ItemIndex = 1
      Items.Strings = (
        'Reserva Pedido'
        'Reserva Vencido'
        'Reserva Avaria'
        'Reserva de Bloqueio')
      TabOrder = 7
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 145
    Width = 1214
    Height = 320
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Produtos '
    TabOrder = 2
    object _dbgProduto: TDBGrid
      Left = 2
      Top = 15
      Width = 1210
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
    Left = 864
    Top = 24
  end
  object _cdsProdutoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 920
    Top = 24
  end
end
