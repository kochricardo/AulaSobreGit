object _frmFinalizaPedidoExcel: T_frmFinalizaPedidoExcel
  Left = 0
  Top = 0
  Caption = 'Pedido Importado  Finalizando'
  ClientHeight = 566
  ClientWidth = 1239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label19: TLabel
    Left = 960
    Top = 266
    Width = 90
    Height = 13
    Caption = 'Operador Logistico'
    Visible = False
  end
  object Label18: TLabel
    Left = 1079
    Top = 328
    Width = 57
    Height = 13
    Caption = 'Pedido Para'
  end
  object GroupBox8: TGroupBox
    Left = 0
    Top = 0
    Width = 745
    Height = 473
    Caption = 'Pedido CD SC'
    TabOrder = 0
    object _dbgPedidoPronto: TDBGrid
      Left = 2
      Top = 15
      Width = 741
      Height = 456
      Align = alClient
      DataSource = _dsPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPedidoProntoDrawColumnCell
    end
  end
  object GroupBox3: TGroupBox
    Left = 770
    Top = 2
    Width = 302
    Height = 118
    Caption = 'Filtros Pedido'
    TabOrder = 1
    object _dbgFiltroPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 298
      Height = 101
      Align = alClient
      DataSource = _dsEmpresaPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgFiltroPedidoDrawColumnCell
      OnDblClick = _dbgFiltroPedidoDblClick
    end
  end
  object _grbParcelaPrazo: TGroupBox
    Left = 777
    Top = 120
    Width = 177
    Height = 189
    Caption = 'Prazo Pedido'
    TabOrder = 2
    object _dbgPrazoSC: TDBGrid
      Left = 2
      Top = 15
      Width = 173
      Height = 172
      Align = alClient
      Ctl3D = False
      DataSource = _dsCondicaoPagamento
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = _dbgPrazoSCDblClick
    end
  end
  object _chkObservacaoPedido: TCheckBox
    Left = 960
    Top = 196
    Width = 164
    Height = 17
    Caption = 'Observa'#231#227'o  Pedido'
    TabOrder = 3
    OnClick = _chkObservacaoPedidoClick
  end
  object _edtObservacaoPedido: TEdit
    Left = 960
    Top = 216
    Width = 240
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    Enabled = False
    MaxLength = 40
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
  end
  object _edtNrVerba: TEdit
    Left = 960
    Top = 168
    Width = 100
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    NumbersOnly = True
    ParentCtl3D = False
    TabOrder = 5
  end
  object _chkBonificaPedido: TCheckBox
    Left = 960
    Top = 148
    Width = 164
    Height = 17
    Caption = 'Bonificar Pedido SC'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
  end
  object _cbOPeradorLogistico: TComboBox
    Left = 960
    Top = 282
    Width = 145
    Height = 21
    TabOrder = 7
  end
  object _btnConfirma: TBitBtn
    Left = 1079
    Top = 373
    Width = 113
    Height = 29
    Caption = '&Confirma Pedido'
    DoubleBuffered = True
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = _btnConfirmaClick
  end
  object _dtpPedido: TDateTimePicker
    Left = 1079
    Top = 346
    Width = 80
    Height = 21
    Date = 40578.465110127320000000
    Time = 40578.465110127320000000
    TabOrder = 9
  end
  object _chkImprimir: TCheckBox
    Left = 780
    Top = 313
    Width = 164
    Height = 17
    Caption = 'Imprimir Pedido '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 10
  end
  object _chkGeraExcel: TCheckBox
    Left = 780
    Top = 330
    Width = 164
    Height = 17
    Caption = 'Gera Excel Pedido '
    Checked = True
    Ctl3D = False
    ParentCtl3D = False
    State = cbChecked
    TabOrder = 11
  end
  object _chkRelatorioPrecoCusto: TCheckBox
    Left = 780
    Top = 349
    Width = 145
    Height = 17
    Caption = 'Relatorio C/Preco Custo'
    TabOrder = 12
  end
  object _chkMostraDesconto: TCheckBox
    Left = 780
    Top = 376
    Width = 164
    Height = 17
    Caption = 'Mostra Coluna % Desc.'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object _stbCompras: TStatusBar
    Left = 0
    Top = 547
    Width = 1239
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 450
      end
      item
        Width = 150
      end>
  end
  object _btnFechaCancela: TBitBtn
    Left = 104
    Top = 480
    Width = 113
    Height = 25
    Caption = '&Fechar/Cancelar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 15
    OnClick = _btnFechaCancelaClick
  end
  object _dsEmpresaPedido: TDataSource
    DataSet = _cdsEmpresaPedido
    Left = 912
    Top = 40
  end
  object _cdsEmpresaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 976
    Top = 40
  end
  object _cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 144
    Top = 64
  end
  object _dsPedido: TDataSource
    DataSet = _cdsPedido
    Left = 144
    Top = 120
  end
  object _cdsCondicaoPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 840
    Top = 208
    object _cdsCondicaoPagamentoNR_PARCELA: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parcela'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object _cdsCondicaoPagamentoNR_DIAS: TIntegerField
      DisplayLabel = 'Prazo  Dias'
      DisplayWidth = 5
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento: TDataSource
    DataSet = _cdsCondicaoPagamento
    Left = 840
    Top = 168
  end
  object _cdsPeEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 168
  end
  object _cdsTabelaLeadTime: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 377
    Top = 88
  end
end
