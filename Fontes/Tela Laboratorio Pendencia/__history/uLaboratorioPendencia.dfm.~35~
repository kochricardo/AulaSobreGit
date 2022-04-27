inherited _frmLaboratorioPendencia: T_frmLaboratorioPendencia
  Top = 43
  Caption = 'Pendencia Laborat'#243'rio'
  ClientWidth = 1224
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 1240
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Width = 1224
    ExplicitWidth = 1224
  end
  inherited GroupBox1: TGroupBox
    Left = -1
    Top = -4
    Width = 658
    Height = 370
    Align = alCustom
    Caption = 'Laborat'#243'rio com Pendencia'
    ExplicitLeft = -1
    ExplicitTop = -4
    ExplicitWidth = 658
    ExplicitHeight = 370
    object _dbgPendenciaLaboratorio: TDBGrid
      Left = 2
      Top = 15
      Width = 654
      Height = 353
      Align = alClient
      DataSource = _dsLabPendencia
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPendenciaLaboratorioDrawColumnCell
      OnDblClick = _dbgPendenciaLaboratorioDblClick
      OnKeyDown = _dbgPendenciaLaboratorioKeyDown
      OnTitleClick = _dbgPendenciaLaboratorioTitleClick
    end
  end
  inherited GroupBox2: TGroupBox
    Left = 659
    Top = -1
    Width = 540
    Height = 186
    Align = alCustom
    Caption = 'Pedido(s) Pendente(s)  <F10>or<DEL> Elimina Pendencia Pedido'
    ExplicitLeft = 659
    ExplicitTop = -1
    ExplicitWidth = 540
    ExplicitHeight = 186
    inherited DBGrid1: TDBGrid
      Width = 536
      Height = 169
      DataSource = _dsPedidoPendente
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
    end
    object _dbgPedidoPendente: TDBGrid
      Left = 2
      Top = 15
      Width = 536
      Height = 169
      Align = alClient
      DataSource = _dsPedidoPendente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPedidoPendenteDrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnEnter = _dbgPedidoPendenteEnter
      OnKeyDown = _dbgPedidoPendenteKeyDown
      OnTitleClick = _dbgPedidoPendenteTitleClick
    end
  end
  inherited GroupBox3: TGroupBox
    Left = 112
    Top = 372
    Width = 425
    Height = 82
    Align = alCustom
    Caption = 'Comprador'
    ExplicitLeft = 112
    ExplicitTop = 372
    ExplicitWidth = 425
    ExplicitHeight = 82
    inherited _btnExecuta: TBitBtn
      Left = 152
      Top = 41
      OnClick = _btnExecutaClick
      ExplicitLeft = 152
      ExplicitTop = 41
    end
    inherited _bitFechar: TBitBtn
      Top = 41
      ExplicitTop = 41
    end
    inherited _btnParaExcel: TBitBtn
      Left = 293
      Top = 41
      Visible = False
      ExplicitLeft = 293
      ExplicitTop = 41
    end
    object Edit1: TEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 3
      Text = '1'
    end
  end
  object GroupBox4: TGroupBox [4]
    Left = 659
    Top = 185
    Width = 534
    Height = 181
    Caption = 'Itens Pendentes <F5><DEL> Elimina Item Pendencia'
    TabOrder = 4
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 530
      Height = 164
      Align = alClient
      DataSource = _dsItemPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPedidoDrawColumnCell
      OnDblClick = _dbgItemPedidoDblClick
      OnKeyDown = _dbgItemPedidoKeyDown
    end
  end
  object BitBtn1: TBitBtn [5]
    Left = 929
    Top = 398
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
    OnClick = _bitFecharClick
  end
  object _cdsLabPendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 168
    Top = 80
  end
  object _dsLabPendencia: TDataSource
    DataSet = _cdsLabPendencia
    OnDataChange = _dsLabPendenciaDataChange
    Left = 264
    Top = 80
  end
  object _cdsPedidoPendente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 664
    Top = 104
  end
  object _dsPedidoPendente: TDataSource
    DataSet = _cdsPedidoPendente
    OnDataChange = _dsPedidoPendenteDataChange
    Left = 800
    Top = 88
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    Left = 808
    Top = 248
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 672
    Top = 248
  end
end
