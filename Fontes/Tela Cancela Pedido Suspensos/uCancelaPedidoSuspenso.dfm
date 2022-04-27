object _frmCancelaPedidoSuspensos: T_frmCancelaPedidoSuspensos
  Left = 0
  Top = 0
  Caption = 'Verifica Pedido n'#227'o Finalizados'
  ClientHeight = 436
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 417
    Width = 576
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 576
    Height = 153
    Align = alTop
    Caption = 'Dados da Capa'
    TabOrder = 1
    object _dbgCapapedido: TDBGrid
      Left = 2
      Top = 15
      Width = 572
      Height = 136
      Align = alClient
      DataSource = _dsPedidoSuspenso
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = _dbgCapapedidoDblClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 153
    Width = 576
    Height = 198
    Align = alTop
    Caption = 'Itens do Pedido'
    TabOrder = 2
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 572
      Height = 181
      Align = alClient
      DataSource = _dsItemPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 370
    Width = 75
    Height = 25
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object _cdsPedidoSuspenso: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 40
  end
  object _dsPedidoSuspenso: TDataSource
    DataSet = _cdsPedidoSuspenso
    OnDataChange = _dsPedidoSuspensoDataChange
    Left = 360
    Top = 40
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 224
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    Left = 296
    Top = 224
  end
end
