object _frmEstoqueZero: T_frmEstoqueZero
  Left = 0
  Top = 0
  Caption = 'Produtos Com Estoque '#225' Zero'
  ClientHeight = 450
  ClientWidth = 1036
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
    Top = 431
    Width = 1036
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 250
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1036
    Height = 105
    Align = alTop
    Caption = 'Estoque a Zero Comprador'
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label18: TLabel
      Left = 106
      Top = 32
      Width = 71
      Height = 13
      Caption = 'Estoque do CD'
    end
    object Label3: TLabel
      Left = 734
      Top = 29
      Width = 134
      Height = 13
      Caption = 'Produtos Com Estoque Zero'
    end
    object _edtNrComprador: TEdit
      Left = 24
      Top = 48
      Width = 74
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 104
      Top = 48
      Width = 129
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 1
      Text = 'CD Tubar'#227'o'
      Items.Strings = (
        'CD Tubar'#227'o'
        'CD Sta Cruz do Sul')
    end
    object _btnExecuta: TBitBtn
      Left = 255
      Top = 46
      Width = 170
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
      Left = 486
      Top = 46
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
      TabOrder = 3
      OnClick = _btnParaExcelClick
    end
    object _cbxOperacaoRede: TComboBox
      Left = 734
      Top = 48
      Width = 209
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 1036
    Height = 326
    Align = alClient
    Caption = 'Itens Em Falta'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1032
      Height = 309
      Align = alClient
      Ctl3D = False
      DataSource = _dsEstoqueZero
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
    end
  end
  object _dsEstoqueZero: TDataSource
    DataSet = _cdsEstoqueZero
    Left = 472
    Top = 32
  end
  object _cdsEstoqueZero: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 544
    Top = 32
  end
end
