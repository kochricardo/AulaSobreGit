object _FrmCriticaPedidoOperacao: T_FrmCriticaPedidoOperacao
  Left = 0
  Top = 0
  Caption = 'Critica Pedido Operacao'
  ClientHeight = 583
  ClientWidth = 1398
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stBar: TStatusBar
    Left = 0
    Top = 564
    Width = 1398
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1398
    Height = 121
    Align = alTop
    Caption = 'Parametros'
    TabOrder = 1
    object Label1: TLabel
      Left = 50
      Top = 24
      Width = 75
      Height = 13
      Caption = 'Opera'#231#227'o Rede'
    end
    object _btnConsultaCritica: TBitBtn
      Left = 280
      Top = 36
      Width = 161
      Height = 25
      Caption = 'Consultar Criticas Ped. Redes'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = _btnConsultaCriticaClick
    end
    object Memo1: TMemo
      Left = 0
      Top = 76
      Width = 1065
      Height = 54
      TabOrder = 1
      Visible = False
    end
    object _cbxOperacaoRede: TComboBox
      Left = 48
      Top = 38
      Width = 209
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 313
    Width = 1398
    Height = 144
    Align = alTop
    Caption = 'Itens rejeitado'
    TabOrder = 2
    object _dbgItensCriticas: TDBGrid
      Left = 2
      Top = 15
      Width = 1394
      Height = 127
      Align = alClient
      DataSource = _dsItensPedido
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItensCriticasDrawColumnCell
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 121
    Width = 1398
    Height = 192
    Align = alTop
    Caption = 'Pedidos Com rejei'#231#227'o'
    TabOrder = 3
    object _dbgCapaPedidoRejeicao: TDBGrid
      Left = 2
      Top = 15
      Width = 1394
      Height = 175
      Align = alClient
      DataSource = _dsPedidoClienteRede
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgCapaPedidoRejeicaoDrawColumnCell
    end
  end
  object _btnReprocessa: TBitBtn
    Left = 840
    Top = 495
    Width = 209
    Height = 25
    Caption = 'Reprocessa Pedido Rede'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = _btnReprocessaClick
  end
  object _chkFiltroVinculado: TCheckBox
    Left = 576
    Top = 499
    Width = 177
    Height = 17
    Caption = 'Somente Itens n'#227'o vinculado'
    TabOrder = 5
    OnClick = _chkFiltroVinculadoClick
  end
  object _btnVinculaMercadoria: TBitBtn
    Left = 248
    Top = 495
    Width = 225
    Height = 25
    Caption = 'Vincular Meradoria Opera'#231#227'o'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object _btnParaExcel: TBitBtn
    Left = 1229
    Top = 495
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
    TabOrder = 7
    OnClick = _btnParaExcelClick
  end
  object _cdsPedidoClienteRede: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 65528
    object _cdsPedidoClienteRedeNR_PEDIDO: TLongWordField
      DisplayLabel = 'Nr.Ped.Rede'
      FieldName = 'NR_PEDIDO'
    end
    object _cdsPedidoClienteRedeNR_CNPJ_CLIENTE: TStringField
      DisplayLabel = 'Cnpj Cliente'
      FieldName = 'NR_CNPJ_CLIENTE'
    end
    object _cdsPedidoClienteRedeNR_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'NR_CLIENTE'
    end
    object _cdsPedidoClienteRedeNM_RAZAO_CLIENTE: TStringField
      DisplayLabel = 'Raz'#227'o social Cliente'
      FieldName = 'NM_RAZAO_CLIENTE'
      Size = 60
    end
    object _cdsPedidoClienteRedeNR_CNPJ_FORNECEDOR: TStringField
      DisplayLabel = 'CNPJ Fornecedor'
      FieldName = 'NR_CNPJ_FORNECEDOR'
    end
    object _cdsPedidoClienteRedeNM_FORNECEDOR: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NM_FORNECEDOR'
      Size = 50
    end
    object _cdsPedidoClienteRedeDS_MOTIVO_REJEICAO: TWideStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 30
      FieldName = 'DS_MOTIVO_REJEICAO'
      Size = 30
    end
    object _cdsPedidoClienteRedeID_PEDIDO_REJEITADO: TStringField
      DisplayLabel = 'Id. Rejeitado'
      FieldName = 'ID_PEDIDO_REJEITADO'
      Size = 1
    end
    object _cdsPedidoClienteRedeNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Size = 50
    end
    object _cdsPedidoClienteRedeNR_EMPRESA: TIntegerField
      FieldName = 'NR_EMPRESA'
    end
    object _cdsPedidoClienteRedeCD_OPERACAO_REDE: TIntegerField
      FieldName = 'CD_OPERACAO_REDE'
    end
    object _cdsPedidoClienteRedeDS_DESCRICAO_PRODUTO_MAX: TStringField
      FieldName = 'DS_DESCRICAO_PRODUTO_MAX'
      Size = 80
    end
  end
  object _dsCriticaPedido: TDataSource
    DataSet = _cdsPedidoClienteRede
    Left = 800
    Top = 32
  end
  object _cdsCriticaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 792
  end
  object _cdsItensPedido: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NR_PEDIDO'
    MasterFields = 'NR_PEDIDO'
    MasterSource = _dsPedidoClienteRede
    PacketRecords = 0
    Params = <>
    Left = 328
    Top = 312
    object _cdsItensPedidoNR_SEQUENCIAL: TIntegerField
      DisplayLabel = 'Nr. Sequencial'
      FieldName = 'NR_SEQUENCIAL'
    end
    object _cdsItensPedidoCD_EAN: TStringField
      DisplayLabel = 'Cod. Ean'
      FieldName = 'CD_EAN'
      Size = 14
    end
    object _cdsItensPedidoCD_PRODUTO: TIntegerField
      DisplayLabel = 'Cod. Prod.'
      FieldName = 'CD_PRODUTO'
    end
    object _cdsItensPedidoNM_PRODUTO: TStringField
      DisplayLabel = 'Nome/Apresenta'#231#227'o'
      DisplayWidth = 60
      FieldName = 'NM_PRODUTO'
      Size = 60
    end
    object _cdsItensPedidoDS_MOTIVO_REJEICAO: TStringField
      DisplayLabel = 'Motivo Rejei'#231#227'o'
      FieldName = 'DS_MOTIVO_REJEICAO'
      Size = 30
    end
    object _cdsItensPedidoNR_PEDIDO: TLongWordField
      DisplayLabel = 'Nr.Ped.Rede'
      FieldName = 'NR_PEDIDO'
    end
    object _cdsItensPedidoCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Visible = False
    end
    object _cdsItensPedidoNR_OPERACAO_REDE: TIntegerField
      FieldName = 'NR_OPERACAO_REDE'
      Visible = False
    end
    object _cdsItensPedidoNM_APRESENTACAO_MAX: TStringField
      DisplayLabel = 'Apresenta'#231#227'o Max'
      FieldName = 'NM_APRESENTACAO_MAX'
      Size = 80
    end
  end
  object _dsPedidoClienteRede: TDataSource
    DataSet = _cdsPedidoClienteRede
    Left = 656
    Top = 40
  end
  object _dsItensPedido: TDataSource
    DataSet = _cdsItensPedido
    Left = 520
    Top = 320
  end
end
