object _frmPendenciaComprador: T_frmPendenciaComprador
  Left = 0
  Top = 0
  Caption = 'Pendencia Comprador'
  ClientHeight = 548
  ClientWidth = 1092
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1092
    Height = 349
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Itens Pendendes'
    TabOrder = 0
    object _dbgItemPendentes: TDBGrid
      Left = 2
      Top = 15
      Width = 1088
      Height = 332
      Align = alClient
      DataSource = _dsItensPendentes
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPendentesDrawColumnCell
      OnDblClick = _dbgItemPendentesDblClick
      OnKeyDown = _dbgItemPendentesKeyDown
      OnMouseMove = _dbgItemPendentesMouseMove
      OnTitleClick = _dbgItemPendentesTitleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 349
    Width = 1092
    Height = 182
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Filtro Comprador'
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object Label3: TLabel
      Left = 17
      Top = 95
      Width = 50
      Height = 13
      Caption = 'Nr. Pedido'
    end
    object Label4: TLabel
      Left = 258
      Top = 97
      Width = 75
      Height = 13
      Caption = 'Opera'#231#227'o Rede'
    end
    object Label5: TLabel
      Left = 17
      Top = 134
      Width = 61
      Height = 13
      Caption = 'Cod.Produto'
    end
    object _edtNrComprador: TEdit
      Left = 16
      Top = 30
      Width = 75
      Height = 21
      Hint = 'Para gerar relatorio Complento Zere(0) o numero comprador'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object _btnExecuta: TBitBtn
      Left = 258
      Top = 66
      Width = 148
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
      TabOrder = 1
      OnClick = _btnExecutaClick
    end
    object _btnParaExcel: TBitBtn
      Left = 471
      Top = 64
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
      TabOrder = 2
      OnClick = _btnParaExcelClick
    end
    object _bitFechar: TBitBtn
      Left = 916
      Top = 56
      Width = 120
      Height = 26
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
      TabOrder = 3
      OnClick = _bitFecharClick
    end
    object _edtNrFornecedor: TEdit
      Left = 16
      Top = 68
      Width = 75
      Height = 21
      NumbersOnly = True
      TabOrder = 4
    end
    object _chkItensNaoFaturados: TCheckBox
      Left = 256
      Top = 18
      Width = 137
      Height = 23
      Caption = 'Pedido n'#227'o Faturados'
      TabOrder = 5
    end
    object _edtNrPedido: TEdit
      Left = 17
      Top = 110
      Width = 75
      Height = 21
      NumbersOnly = True
      TabOrder = 6
    end
    object _cbxOperacaoRede: TComboBox
      Left = 256
      Top = 111
      Width = 209
      Height = 21
      TabOrder = 7
    end
    object _edtNrProduto: TEdit
      Left = 17
      Top = 148
      Width = 75
      Height = 21
      NumbersOnly = True
      TabOrder = 8
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 529
    Width = 1092
    Height = 19
    Panels = <
      item
        Text = 
          '<F5> Elimina Item Pendencia  - <F10> ELimina todas as Pendencia ' +
          'Listada'
        Width = 450
      end
      item
        Width = 50
      end>
  end
  object _cdsItensPendentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 24
  end
  object _dsItensPendentes: TDataSource
    DataSet = _cdsItensPendentes
    Left = 304
    Top = 24
  end
end
