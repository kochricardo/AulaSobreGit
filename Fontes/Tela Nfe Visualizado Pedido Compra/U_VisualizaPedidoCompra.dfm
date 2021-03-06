object _frVisualizaPedidoCompra: T_frVisualizaPedidoCompra
  Left = 227
  Top = 132
  Width = 740
  Height = 554
  Caption = 'Visualiza Pedido de Compra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 6
    Top = 5
    Width = 719
    Height = 492
    Caption = '  ITENS PEDIDO  DE COMPRA  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 10
      Top = 17
      Width = 699
      Height = 462
      DataSource = DSItemPedidoCompra
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'NROM_M'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMM_M'
          Title.Caption = 'NOME'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APRM_M'
          Title.Caption = 'APRESENTA'#199#195'O'
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAY_Y'
          Title.Caption = 'QTD_PED'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHEY_Y'
          Title.Caption = 'QTD_REC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PFBY_Y'
          Title.Caption = 'PRE'#199'O FAB'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABTY_Y'
          Title.Caption = 'DESC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DADY_Y'
          Title.Caption = 'DESC ADIC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PUNY_Y'
          Title.Caption = 'PRE'#199'O LIQ'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SITY_Y'
          Title.Caption = 'SIT'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 508
    Width = 732
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object DSPItemPedidoCompra: TDataSetProvider
    DataSet = SQLItemPedidoCompra
    Constraints = True
    Left = 160
    Top = 72
  end
  object CDSItemPedidoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItemPedidoCompra'
    Left = 200
    Top = 72
    object CDSItemPedidoCompraNROM_M: TBCDField
      FieldName = 'NROM_M'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemPedidoCompraNOMM_M: TStringField
      FieldName = 'NOMM_M'
      Required = True
      FixedChar = True
      Size = 15
    end
    object CDSItemPedidoCompraAPRM_M: TStringField
      FieldName = 'APRM_M'
      Required = True
      FixedChar = True
      Size = 15
    end
    object CDSItemPedidoCompraQUAY_Y: TBCDField
      FieldName = 'QUAY_Y'
      Precision = 7
      Size = 0
    end
    object CDSItemPedidoCompraSITY_Y: TStringField
      FieldName = 'SITY_Y'
      FixedChar = True
      Size = 1
    end
    object CDSItemPedidoCompraCHEY_Y: TBCDField
      FieldName = 'CHEY_Y'
      Precision = 7
      Size = 0
    end
    object CDSItemPedidoCompraABTY_Y: TBCDField
      FieldName = 'ABTY_Y'
      Precision = 5
      Size = 2
    end
    object CDSItemPedidoCompraPUNY_Y: TFMTBCDField
      FieldName = 'PUNY_Y'
      Precision = 17
      Size = 6
    end
    object CDSItemPedidoCompraPFBY_Y: TFMTBCDField
      FieldName = 'PFBY_Y'
      Precision = 17
      Size = 6
    end
    object CDSItemPedidoCompraDADY_Y: TBCDField
      FieldName = 'DADY_Y'
      Precision = 5
      Size = 2
    end
  end
  object DSItemPedidoCompra: TDataSource
    DataSet = CDSItemPedidoCompra
    Left = 240
    Top = 72
  end
  object SQLItemPedidoCompra: TSQLQuery
    NoMetadata = True
    SQLConnection = DM_DB.Conexao_SIPROD
    Params = <
      item
        DataType = ftString
        Name = 'NR_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT NROM_M,NOMM_M,APRM_M,QUAY_Y,CHEY_Y,ABTY_Y,SITY_Y,PUNY_Y,P' +
        'FBY_Y,DADY_Y'
      'FROM PRDDM.DCMER,PRDDM.DCPCI'
      'WHERE NROM_M = NROM_Y'
      'AND NROP_Y = :NR_PEDIDO'
      'ORDER BY NOMM_M')
    Left = 120
    Top = 72
    object SQLItemPedidoCompraNROM_M: TBCDField
      DisplayLabel = 'CODIGO'
      FieldName = 'NROM_M'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemPedidoCompraNOMM_M: TStringField
      DisplayLabel = 'NOME'
      FieldName = 'NOMM_M'
      Required = True
      FixedChar = True
      Size = 15
    end
    object SQLItemPedidoCompraAPRM_M: TStringField
      DisplayLabel = 'APRESENTA'#199#195'O'
      FieldName = 'APRM_M'
      Required = True
      FixedChar = True
      Size = 15
    end
    object SQLItemPedidoCompraQUAY_Y: TBCDField
      DisplayLabel = 'QTD_PED'
      FieldName = 'QUAY_Y'
      Precision = 7
      Size = 0
    end
    object SQLItemPedidoCompraSITY_Y: TStringField
      DisplayLabel = 'SIT'
      FieldName = 'SITY_Y'
      FixedChar = True
      Size = 1
    end
    object SQLItemPedidoCompraCHEY_Y: TBCDField
      DisplayLabel = 'QTD_REC'
      FieldName = 'CHEY_Y'
      Precision = 7
      Size = 0
    end
    object SQLItemPedidoCompraABTY_Y: TBCDField
      DisplayLabel = 'DESC'
      FieldName = 'ABTY_Y'
      Precision = 5
      Size = 2
    end
    object SQLItemPedidoCompraPUNY_Y: TFMTBCDField
      DisplayLabel = 'PRE'#199'O LIQ'
      FieldName = 'PUNY_Y'
      Precision = 17
      Size = 6
    end
    object SQLItemPedidoCompraPFBY_Y: TFMTBCDField
      DisplayLabel = 'PRE'#199'O FAB'
      FieldName = 'PFBY_Y'
      Precision = 17
      Size = 6
    end
    object SQLItemPedidoCompraDADY_Y: TBCDField
      DisplayLabel = 'DESC_ADC'
      FieldName = 'DADY_Y'
      Precision = 5
      Size = 2
    end
  end
end
