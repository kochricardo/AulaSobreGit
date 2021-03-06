object _frmVisualizaPedidoCompra: T_frmVisualizaPedidoCompra
  Left = 227
  Top = 132
  Caption = 'Visualiza Pedido de Compra'
  ClientHeight = 520
  ClientWidth = 732
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHEY_Y'
          Title.Caption = 'QTD_REC'
          Width = 64
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DADY_Y'
          Title.Caption = 'DESC ADIC'
          Width = 64
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
          Width = 64
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 501
    Width = 732
    Height = 19
    Panels = <>
  end
  object DSPItemPedidoCompra: TDataSetProvider
    DataSet = SQLItemPedidoCompra
    Left = 160
    Top = 72
  end
  object CDSItemPedidoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItemPedidoCompra'
    Left = 200
    Top = 72
    object CDSItemPedidoCompraNROM_M: TFMTBCDField
      FieldName = 'NROM_M'
      Precision = 6
      Size = 0
    end
    object CDSItemPedidoCompraNOMM_M: TWideStringField
      FieldName = 'NOMM_M'
      FixedChar = True
      Size = 15
    end
    object CDSItemPedidoCompraAPRM_M: TWideStringField
      FieldName = 'APRM_M'
      FixedChar = True
      Size = 15
    end
    object CDSItemPedidoCompraQUAY_Y: TFMTBCDField
      FieldName = 'QUAY_Y'
      Precision = 7
      Size = 0
    end
    object CDSItemPedidoCompraSITY_Y: TWideStringField
      FieldName = 'SITY_Y'
      FixedChar = True
      Size = 1
    end
    object CDSItemPedidoCompraCHEY_Y: TFMTBCDField
      FieldName = 'CHEY_Y'
      Precision = 7
      Size = 0
    end
    object CDSItemPedidoCompraABTY_Y: TFMTBCDField
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
    object CDSItemPedidoCompraDADY_Y: TFMTBCDField
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
    MaxBlobSize = -1
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
    SQLConnection = _dm._conexao
    Left = 120
    Top = 72
    object SQLItemPedidoCompraNROM_M: TFMTBCDField
      DisplayLabel = 'CODIGO'
      FieldName = 'NROM_M'
      Precision = 6
      Size = 0
    end
    object SQLItemPedidoCompraNOMM_M: TWideStringField
      DisplayLabel = 'NOME'
      FieldName = 'NOMM_M'
      FixedChar = True
      Size = 15
    end
    object SQLItemPedidoCompraAPRM_M: TWideStringField
      DisplayLabel = 'APRESENTA'#199#195'O'
      FieldName = 'APRM_M'
      FixedChar = True
      Size = 15
    end
    object SQLItemPedidoCompraQUAY_Y: TFMTBCDField
      FieldName = 'QUAY_Y'
      Precision = 7
      Size = 0
    end
    object SQLItemPedidoCompraSITY_Y: TWideStringField
      DisplayLabel = 'SIT'
      FieldName = 'SITY_Y'
      FixedChar = True
      Size = 1
    end
    object SQLItemPedidoCompraCHEY_Y: TFMTBCDField
      DisplayLabel = 'QTD_REC'
      FieldName = 'CHEY_Y'
      Precision = 7
      Size = 0
    end
    object SQLItemPedidoCompraABTY_Y: TFMTBCDField
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
    object SQLItemPedidoCompraDADY_Y: TFMTBCDField
      DisplayLabel = 'DESC_ADC'
      FieldName = 'DADY_Y'
      Precision = 5
      Size = 2
    end
  end
end
