object _frmRelatoriodeExcesso: T_frmRelatoriodeExcesso
  Left = 0
  Top = 0
  Caption = 'Relatorio de Excesso'
  ClientHeight = 549
  ClientWidth = 1070
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1070
    Height = 369
    Align = alTop
    Caption = 'Rela'#231#227'o de Itens Com Excesso'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object _dbgExcesso: TDBGrid
      Left = 1
      Top = 14
      Width = 1068
      Height = 354
      Align = alClient
      Ctl3D = False
      DataSource = _dsExcesso
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgExcessoDrawColumnCell
      OnTitleClick = _dbgExcessoTitleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 369
    Width = 1070
    Height = 180
    Align = alClient
    Caption = 'Filtros'
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 126
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label4: TLabel
      Left = 3
      Top = 49
      Width = 61
      Height = 13
      Caption = 'Cod.Produto'
    end
    object Label5: TLabel
      Left = 3
      Top = 85
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object Label6: TLabel
      Left = 3
      Top = 14
      Width = 119
      Height = 13
      Caption = 'Excesso acima de (Dias):'
    end
    object Label2: TLabel
      Left = 392
      Top = 14
      Width = 118
      Height = 13
      Caption = 'Valor Excesso Financeiro'
    end
    object Label3: TLabel
      Left = 531
      Top = 14
      Width = 127
      Height = 13
      Caption = 'Valor Excesso Pco.Compra'
    end
    object Label7: TLabel
      Left = 678
      Top = 14
      Width = 108
      Height = 13
      Caption = 'Valor Excesso Pco.Vda'
    end
    object Label18: TLabel
      Left = 134
      Top = 14
      Width = 71
      Height = 13
      Caption = 'Estoque do CD'
    end
    object Label8: TLabel
      Left = 268
      Top = 14
      Width = 102
      Height = 13
      Caption = 'Nr. Unid. em Excesso'
    end
    object _edtNrdiasExcesso: TEdit
      Left = 3
      Top = 28
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = _edtNrdiasExcessoKeyDown
    end
    object _edtCodProduto: TEdit
      Left = 3
      Top = 63
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 1
      OnKeyDown = _edtNrdiasExcessoKeyDown
    end
    object _edtNrFornecedor: TEdit
      Left = 3
      Top = 101
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
      OnKeyDown = _edtNrdiasExcessoKeyDown
    end
    object _edtNrComprador: TEdit
      Left = 3
      Top = 142
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 3
      OnKeyDown = _edtNrdiasExcessoKeyDown
    end
    object _btnExecuta: TBitBtn
      Left = 368
      Top = 128
      Width = 145
      Height = 33
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
      TabOrder = 4
      OnClick = _btnExecutaClick
    end
    object _bitFechar: TBitBtn
      Left = 864
      Top = 128
      Width = 169
      Height = 33
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
      OnClick = _bitFecharClick
    end
    object _btnParaExcel: TBitBtn
      Left = 627
      Top = 128
      Width = 145
      Height = 33
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
    object _edtValordoExcessoCusto: TEdit
      Left = 392
      Top = 30
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 7
    end
    object _edtValorExcessoPcoCompra: TEdit
      Left = 531
      Top = 30
      Width = 127
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 8
    end
    object _edtValorExcessoPcoVda: TEdit
      Left = 678
      Top = 30
      Width = 127
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 9
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 132
      Top = 28
      Width = 127
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 10
      Text = 'CD Tubar'#227'o'
      Items.Strings = (
        'CD Tubar'#227'o'
        'CS Sta Cruz do Sul')
    end
    object _edtNrUnidadesExcesso: TEdit
      Left = 265
      Top = 30
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 11
    end
  end
  object _cdsExcesso: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 360
    Top = 80
    object _cdsExcessoVT_EXCESSO_FINANCEIRO: TAggregateField
      FieldName = 'VT_EXCESSO_FINANCEIRO'
      Active = True
      Expression = 'sum(VL_EXCESSO_FINANCEIRO)'
    end
    object _cdsExcessoVT_EXCESSO_VENDA: TAggregateField
      FieldName = 'VT_EXCESSO_VENDA'
      Active = True
      Expression = 'SUM(VL_EXCESSO_VENDA)'
    end
    object _cdsExcessoVT_EXCESSO_COMPRA: TAggregateField
      FieldName = 'VT_EXCESSO_COMPRA'
      Active = True
      Expression = 'SUM(VL_EXCESSO_COMPRA)'
    end
    object _cdsExcessoNR_UNID_ACIMA_PARAMETRO: TAggregateField
      FieldName = 'NR_UNID_ACIMA_PARAMETRO'
      Active = True
      DisplayFormat = '###,###,###0'
      Expression = 'SUM(NR_UNID_EXCESSO)'
    end
  end
  object _dsExcesso: TDataSource
    DataSet = _cdsExcesso
    Left = 432
    Top = 72
  end
end
