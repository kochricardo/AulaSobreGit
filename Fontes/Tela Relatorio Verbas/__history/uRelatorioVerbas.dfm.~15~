object _frmRelatorioVerba: T_frmRelatorioVerba
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Verbas'
  ClientHeight = 511
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 332
    Top = 431
    Width = 73
    Height = 13
    Caption = 'Nr. Fornecedor'
  end
  object Label2: TLabel
    Left = 760
    Top = 383
    Width = 26
    Height = 13
    Caption = 'Saldo'
  end
  object Label3: TLabel
    Left = 650
    Top = 383
    Width = 28
    Height = 13
    Caption = 'Gasto'
  end
  object Label4: TLabel
    Left = 529
    Top = 383
    Width = 44
    Height = 13
    Caption = 'Recebido'
  end
  object Label5: TLabel
    Left = 421
    Top = 383
    Width = 50
    Height = 13
    Caption = 'Negociado'
  end
  object Label6: TLabel
    Left = 332
    Top = 384
    Width = 71
    Height = 13
    Caption = 'Nr. Comprador'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 492
    Width = 930
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 930
    Height = 377
    Align = alTop
    Caption = 'Verbas'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object _dbgRelatorioVerba: TDBGrid
      Left = 1
      Top = 14
      Width = 928
      Height = 362
      Align = alClient
      Ctl3D = False
      DataSource = _dsRelatorio
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgRelatorioVerbaDrawColumnCell
      OnKeyDown = _dbgRelatorioVerbaKeyDown
      OnTitleClick = _dbgRelatorioVerbaTitleClick
    end
  end
  object _btnNrVerba: TBitBtn
    Left = 436
    Top = 447
    Width = 137
    Height = 25
    Caption = 'Mostra Verba'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = _btnNrVerbaClick
  end
  object _edtNumeroVerba: TEdit
    Left = 332
    Top = 450
    Width = 82
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    NumbersOnly = True
    ParentCtl3D = False
    TabOrder = 3
    Text = '0'
  end
  object _edtSaldoVerba: TEdit
    Left = 761
    Top = 398
    Width = 102
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
  end
  object _edtTotalGasto: TEdit
    Left = 650
    Top = 398
    Width = 102
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
  end
  object _edtTotalRecebido: TEdit
    Left = 529
    Top = 398
    Width = 102
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
  end
  object _edtTotalNegociado: TEdit
    Left = 421
    Top = 398
    Width = 102
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 7
  end
  object _chkAgrupaFornecedor: TCheckBox
    Left = 20
    Top = 383
    Width = 181
    Height = 17
    Caption = 'Agrupar por Fornecedor'
    TabOrder = 8
    OnClick = _chkAgrupaFornecedorClick
  end
  object _edtNrComprador: TEdit
    Left = 332
    Top = 399
    Width = 82
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    NumbersOnly = True
    ParentCtl3D = False
    TabOrder = 9
    Text = '0'
  end
  object _btnParaExcel: TBitBtn
    Left = 734
    Top = 447
    Width = 129
    Height = 25
    Caption = 'Gera Excel Capa Ped. '
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
    TabOrder = 10
    OnClick = _btnParaExcelClick
  end
  object _dsRelatorio: TDataSource
    DataSet = _cdsRelatorioVerbas
    Left = 304
    Top = 80
  end
  object _cdsRelatorioVerbas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 200
    Top = 80
    object _cdsRelatorioVerbasVT_SALDO: TAggregateField
      FieldName = 'VT_SALDO'
      Active = True
      Expression = 'sum(SALDO)'
    end
    object _cdsRelatorioVerbasVT_GASTO: TAggregateField
      FieldName = 'VT_GASTO'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_GASTO)'
    end
    object _cdsRelatorioVerbasVT_RECEBIDO: TAggregateField
      FieldName = 'VT_RECEBIDO'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_RECEBIDO_TRANSFERIDO)'
    end
    object _cdsRelatorioVerbasVT_NEGOCIADO: TAggregateField
      FieldName = 'VT_NEGOCIADO'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_NEGOCIADO)'
    end
  end
end
