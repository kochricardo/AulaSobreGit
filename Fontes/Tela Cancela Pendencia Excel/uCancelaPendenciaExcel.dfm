object _frmCancelaPendenciaExcel: T_frmCancelaPendenciaExcel
  Left = 0
  Top = 0
  Caption = 'Cancela Pendencia por Excel'
  ClientHeight = 610
  ClientWidth = 1378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1378
    Height = 105
    Align = alTop
    Caption = 'Importa Arquivo'
    TabOrder = 0
    ExplicitWidth = 1163
    object Label1: TLabel
      Left = 9
      Top = 22
      Width = 81
      Height = 13
      Caption = 'Caminho Arquivo'
    end
    object _gaPlanilha: TGauge
      Left = 1001
      Top = 70
      Width = 233
      Height = 13
      ForeColor = clBlue
      Progress = 0
    end
    object _edtArquivo: TEdit
      Left = 96
      Top = 19
      Width = 313
      Height = 21
      TabOrder = 0
    end
    object _btnImportaLista: TBitBtn
      Left = 415
      Top = 19
      Width = 41
      Height = 21
      DoubleBuffered = True
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000088888008888888888800000088880FF000000000080000008880
        F0080FFFFFFF08000000880F0FF00F00000F0800000080F0F0080FFFFFFF0800
        0000880F0FF00F00000F0800000080F0F0080FFFFFFF08000000880F0FB00F00
        F0000800000080F0FBFB0FFFF0F088000000880FBFBF0FFFF0088800000080FB
        FBFB00000088880000008800BFBFBFBF088888000000888800FBFBF088888800
        000088888800B808888888000000888888880088888888000000888888888888
        888888000000888888888888888888000000}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = _btnImportaListaClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 1378
    Height = 408
    Align = alTop
    Caption = 'Importa Arquivo'
    TabOrder = 1
    ExplicitWidth = 1163
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1374
      Height = 391
      Align = alClient
      DataSource = _dsTabela
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPedidoDrawColumnCell
    end
  end
  object _btnCancelaPendencia: TBitBtn
    Left = 952
    Top = 544
    Width = 137
    Height = 25
    Caption = 'Cancelar Pendencia'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = _btnCancelaPendenciaClick
  end
  object _stbMensagem: TStatusBar
    Left = 0
    Top = 591
    Width = 1378
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    OnDrawPanel = _stbMensagemDrawPanel
    ExplicitTop = 590
  end
  object _opdLocalizaArquivo: TOpenDialog
    Filter = 
      'Arquivo Excel|*.XLS;*.XLSX|Arquivo Textol|*.txt|Arquivos Excel 2' +
      '013|*.XLSX|Arquivos LibreOffice|*.ods'
    Left = 496
    Top = 16
  end
  object _cdsTabela: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 320
    Top = 144
    object _cdsTabelaNM_CD: TStringField
      DisplayLabel = 'CD'
      FieldName = 'NM_CD'
      Size = 30
    end
    object _cdsTabelaNR_PEDIDO: TIntegerField
      DisplayLabel = 'Nr.Pedido'
      FieldName = 'NR_PEDIDO'
    end
    object _cdsTabelaNR_FORNECEDOR: TIntegerField
      DisplayLabel = 'Nr.Fornecedor'
      FieldName = 'NR_FORNECEDOR'
    end
    object _cdsTabelaNM_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NM_FORNECEDOR'
      Size = 35
    end
    object _cdsTabelaCD_PRODUTO: TIntegerField
      DisplayLabel = 'Cod.Produto'
      FieldName = 'CD_PRODUTO'
    end
    object _cdsTabelaNM_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NM_PRODUTO'
      Size = 60
    end
    object _cdsTabelaQT_PEDIDO: TIntegerField
      DisplayLabel = 'Qtd.Pedido'
      FieldName = 'QT_PEDIDO'
    end
    object _cdsTabelaQT_FATURADA: TIntegerField
      DisplayLabel = 'Qtd. Faturada'
      FieldName = 'QT_FATURADA'
    end
    object _cdsTabelaID_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'ID_STATUS'
      Size = 1
    end
    object _cdsTabelaNR_PRODUTO: TIntegerField
      DisplayLabel = 'Nr.Produto'
      FieldName = 'NR_PRODUTO'
    end
    object _cdsTabelaCD_EMPRESA: TIntegerField
      DisplayLabel = 'CD'
      FieldName = 'CD_EMPRESA'
    end
  end
  object _dsTabela: TDataSource
    DataSet = _cdsTabela
    Left = 392
    Top = 144
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 444
    Top = 220
  end
end
