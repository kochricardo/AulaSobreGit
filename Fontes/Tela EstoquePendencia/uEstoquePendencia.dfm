object _frmEstoquePendencia: T_frmEstoquePendencia
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Estoque e Pendencia Faturamento'
  ClientHeight = 522
  ClientWidth = 1259
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 503
    Width = 1259
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1259
    Height = 385
    Align = alTop
    Caption = 'Estoque Pendencia Comprador / Laboratorio'
    TabOrder = 1
    object _dbgEstoque: TDBGrid
      Left = 2
      Top = 15
      Width = 1255
      Height = 368
      Align = alClient
      DataSource = _dsEstoquePendencia
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgEstoqueDrawColumnCell
      OnTitleClick = _dbgEstoqueTitleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 385
    Width = 1259
    Height = 118
    Align = alClient
    TabOrder = 2
    object Label18: TLabel
      Left = 223
      Top = 9
      Width = 71
      Height = 13
      Caption = 'Estoque do CD'
    end
    object Label4: TLabel
      Left = 223
      Top = 44
      Width = 75
      Height = 13
      Caption = 'Opera'#231#227'o Rede'
    end
    object Label1: TLabel
      Left = 223
      Top = 79
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object _btnExecuta: TBitBtn
      Left = 479
      Top = 6
      Width = 155
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
      TabOrder = 0
      OnClick = _btnExecutaClick
    end
    object _bitFechar: TBitBtn
      Left = 990
      Top = 85
      Width = 155
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
      TabOrder = 1
      OnClick = _bitFecharClick
    end
    object _btnParaExcel: TBitBtn
      Left = 990
      Top = 6
      Width = 155
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
      TabOrder = 2
      OnClick = _btnParaExcelClick
    end
    object _chkAgruparLaboratorio: TCheckBox
      Left = 72
      Top = 24
      Width = 145
      Height = 17
      Caption = 'Separar por Fornecedor'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 223
      Top = 22
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 4
      Text = 'CD SC e CD RS'
      Items.Strings = (
        'CD SC e CD RS'
        'CD Tubar'#227'o'
        'CS Sta Cruz do Sul')
    end
    object _btnExcelResumido: TBitBtn
      Left = 990
      Top = 37
      Width = 155
      Height = 27
      Caption = 'Gerar Excel   Resumido'
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
      OnClick = _btnExcelResumidoClick
    end
    object _cbxOperacaoRede: TComboBox
      Left = 223
      Top = 58
      Width = 209
      Height = 21
      TabOrder = 6
    end
    object _chkSeparaCD: TCheckBox
      Left = 72
      Top = 52
      Width = 145
      Height = 17
      Caption = 'Separar por CD'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object _cobComprador: TComboBox
      Left = 223
      Top = 94
      Width = 169
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
      Text = 'Comprador'
    end
  end
  object _cdsEstoquePendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 440
    Top = 56
  end
  object _dsEstoquePendencia: TDataSource
    DataSet = _cdsEstoquePendencia
    Left = 584
    Top = 56
  end
end
