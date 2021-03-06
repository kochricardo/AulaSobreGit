object _frmListagemdeverbas: T_frmListagemdeverbas
  Left = 0
  Top = 0
  Caption = 'Listagem De verbas'
  ClientHeight = 512
  ClientWidth = 773
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 493
    Width = 773
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 773
    Height = 361
    Align = alTop
    Caption = 'Listagem de Verba'
    TabOrder = 1
    object _dbgListagemVerba: TDBGrid
      Left = 2
      Top = 15
      Width = 769
      Height = 344
      Align = alClient
      Ctl3D = False
      DataSource = _dsListaSaldoVerba
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgListagemVerbaDrawColumnCell
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 365
    Width = 773
    Height = 128
    Align = alBottom
    Caption = 'Filtro para Verba'
    TabOrder = 2
    object Label5: TLabel
      Left = 11
      Top = 12
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object Label1: TLabel
      Left = 11
      Top = 51
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label2: TLabel
      Left = 11
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Nr. Verba'
    end
    object _edtNrFornecedor: TEdit
      Left = 11
      Top = 26
      Width = 90
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object _edtNrComprador: TEdit
      Left = 11
      Top = 68
      Width = 90
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object _btnExecuta: TBitBtn
      Left = 188
      Top = 15
      Width = 121
      Height = 25
      Caption = 'Executa Pesquisa'
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
      TabOrder = 2
      OnClick = _btnExecutaClick
    end
    object _btnParaExcel: TBitBtn
      Left = 380
      Top = 15
      Width = 129
      Height = 26
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
      TabOrder = 3
      OnClick = _btnParaExcelClick
    end
    object _edtNrVerba: TEdit
      Left = 11
      Top = 107
      Width = 90
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 657
      Top = 97
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
      TabOrder = 5
      OnClick = BitBtn2Click
    end
  end
  object _cdsListaSaldoVerba: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 88
  end
  object _dsListaSaldoVerba: TDataSource
    DataSet = _cdsListaSaldoVerba
    Left = 656
    Top = 152
  end
end
