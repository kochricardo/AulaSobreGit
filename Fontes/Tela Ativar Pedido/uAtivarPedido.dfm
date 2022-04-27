object _frmAtivaPedido: T_frmAtivaPedido
  Left = 0
  Top = 0
  Caption = 'AtivarPedido'
  ClientHeight = 404
  ClientWidth = 780
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 58
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Nr.Pedido'
  end
  object Label2: TLabel
    Left = 240
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object Label3: TLabel
    Left = 241
    Top = 57
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Total Pedido'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 385
    Width = 780
    Height = 19
    Panels = <>
  end
  object _edtNumeroPedido: TEdit
    Left = 56
    Top = 25
    Width = 121
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 1
    OnKeyDown = _edtNumeroPedidoKeyDown
  end
  object _btnAtivaPedido: TBitBtn
    Left = 56
    Top = 70
    Width = 121
    Height = 25
    Caption = 'Ativar Pedido'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = _btnAtivaPedidoClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 112
    Width = 780
    Height = 273
    Align = alBottom
    Caption = 'Log Pedido'
    TabOrder = 3
    object _dbgPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 776
      Height = 256
      Align = alClient
      DataSource = _dsLogPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object _edtSituacao: TEdit
    Left = 240
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object _edtTotalPedido: TEdit
    Left = 240
    Top = 72
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 5
  end
  object _cdsTabelaLeadTime: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 160
  end
  object _cdsLogPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 368
    Top = 160
  end
  object _dsLogPedido: TDataSource
    DataSet = _cdsLogPedido
    Left = 472
    Top = 168
  end
end
