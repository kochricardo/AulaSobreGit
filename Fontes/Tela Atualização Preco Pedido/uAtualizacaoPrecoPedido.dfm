object _frmAtualizaprecoPedido: T_frmAtualizaprecoPedido
  Left = 0
  Top = 0
  Caption = 'Atualiza Pre'#231'o Itens do  Pedido'
  ClientHeight = 523
  ClientWidth = 1292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label27: TLabel
    Left = 382
    Top = 2
    Width = 46
    Height = 13
    Caption = 'Nr. Verba'
  end
  object Label1: TLabel
    Left = 384
    Top = 83
    Width = 86
    Height = 13
    Caption = '% Desc. Adicional'
  end
  object Label2: TLabel
    Left = 540
    Top = 22
    Width = 50
    Height = 13
    Caption = 'Nr. Pedido'
  end
  object Label8: TLabel
    Left = 384
    Top = 42
    Width = 52
    Height = 13
    Caption = '% P/Verba'
  end
  object _stbAtualizaPreco: TStatusBar
    Left = 0
    Top = 504
    Width = 1292
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object GroupBox40: TGroupBox
    Left = 0
    Top = 0
    Width = 321
    Height = 123
    Caption = 'Lista Pre'#231'o Ativa'
    TabOrder = 1
    object _dbgListaPreco: TDBGrid
      Left = 2
      Top = 15
      Width = 317
      Height = 106
      Align = alClient
      DataSource = _dsListaPreco
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgListaPrecoDrawColumnCell
      OnDblClick = _dbgListaPrecoDblClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 208
    Width = 1292
    Height = 296
    Align = alBottom
    Caption = 'Item Pedido(s)'
    TabOrder = 2
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1288
      Height = 279
      Align = alClient
      Ctl3D = False
      DataSource = _dsItemPedido
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPedidoDrawColumnCell
    end
  end
  object _edtNrVerbaDesconto: TEdit
    Left = 382
    Top = 18
    Width = 95
    Height = 21
    TabOrder = 3
    OnExit = _edtNrVerbaDescontoExit
  end
  object _edtDescAdicional: TEdit
    Left = 382
    Top = 98
    Width = 95
    Height = 21
    TabOrder = 4
  end
  object _btnAltera: TBitBtn
    Left = 641
    Top = 147
    Width = 189
    Height = 25
    Caption = 'Alterar pre'#231'o Pedido'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = _btnAlteraClick
  end
  object _edtNrPedido: TEdit
    Left = 540
    Top = 37
    Width = 95
    Height = 21
    TabOrder = 6
  end
  object _edtNomeFornecedor: TEdit
    Left = 641
    Top = 37
    Width = 312
    Height = 21
    TabOrder = 7
  end
  object _rgDescontoAdicional: TRadioGroup
    Left = 374
    Top = 125
    Width = 171
    Height = 77
    Caption = 'Desconto Adcional'
    ItemIndex = 0
    Items.Strings = (
      'Usar do Pedido'
      'Usar o % Informado'
      'Somar ao Desconto do Pedido')
    TabOrder = 8
  end
  object _edtPcVerba: TEdit
    Left = 384
    Top = 57
    Width = 93
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    NumbersOnly = True
    ParentCtl3D = False
    TabOrder = 9
  end
  object _dsListaPreco: TDataSource
    DataSet = _cdsListaPrecoAtiva
    Left = 74
    Top = 44
  end
  object _cdsListaPrecoAtiva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 138
    Top = 40
  end
  object _cdsItemListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 40
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 83
    Top = 109
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 616
    Top = 240
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    Left = 488
    Top = 256
  end
end
