object _frmNfeCriticaPedidoNfe: T_frmNfeCriticaPedidoNfe
  Left = 192
  Top = 115
  BorderIcons = [biSystemMenu]
  Caption = '  Analise de  Diverg'#234'ncia - Pedido de Compra x XML NFe'
  ClientHeight = 600
  ClientWidth = 992
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 581
    Width = 992
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object RGroupStatusCritica: TRadioGroup
    Left = 8
    Top = 3
    Width = 555
    Height = 41
    Caption = '  VISUALIZAR CRITICA  ( STATUS )  '
    Columns = 5
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      '&NOVA'
      '&ANALISE'
      '&LIBERADA'
      '&BLOQUEADA'
      '&INATIVA')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnClick = RGroupStatusCriticaClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 50
    Width = 992
    Height = 531
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '  RELA'#199#195'O DE CR'#205'TICAS  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object DbGridRelacaoCritica: TDBGrid
      Left = 1
      Top = 14
      Width = 990
      Height = 516
      Align = alClient
      Ctl3D = False
      DataSource = DSRelacaoCritica
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DbGridRelacaoCriticaKeyPress
      OnTitleClick = DbGridRelacaoCriticaTitleClick
    end
  end
  object SQLRelacaoCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CRITICA.SQ_ORDEM,'
      'Nvl(FABRIC.CD_FABRICANTE,0) CD_FABRICANTE,'
      'Nvl(PES.NOMP_P,'#39'NAO IDENTIFICADO'#39') NOMP_P,'
      'CRITICA.NR_NFE,'
      'CRITICA.NR_PEDIDO_GAM,'
      'CASE '
      ' when CRITICA.cd_empresa=4 THEN '#39'RS'#39
      ' when CRITICA.cd_empresa=1 THEN '#39'SC'#39
      ' when CRITICA.cd_empresa=5 THEN '#39'ES'#39
      'END ID_CD,'
      'CRITICA.DT_CRITICA,'
      'CRITICA.DS_NFE_CHAVE,'
      'CRITICA.DT_LIBERACAO,'
      'DS_CRITICA.DS_COMPRA_SITUACAO_DIVERGENCIA,'
      'CRITICA.DS_OBSERVACAO_SOLUCIONADOR DS_OBSERVACAO_COMPRADOR,'
      'COMPRADOR.NM_COMPRADOR_REDUZIDO,'
      'NVL(CRITICA.ID_RETORNO_FORNECEDOR,'#39'Z'#39') ID_RETORNO_FORNECEDOR,'
      'CASE '
      '  WHEN CRITICA.ID_RETORNO_FORNECEDOR = '#39'Z'#39' THEN '#39'SEM TRATAMENTO'#39
      
        '  WHEN CRITICA.ID_RETORNO_FORNECEDOR = '#39'A'#39' THEN '#39'AGUARDANDO RETO' +
        'RNO'#39
      
        '  WHEN CRITICA.ID_RETORNO_FORNECEDOR = '#39'N'#39' THEN '#39'RETORNO NAO REC' +
        'EBIDO'#39
      
        '  WHEN CRITICA.ID_RETORNO_FORNECEDOR = '#39'S'#39' THEN '#39'RETORO RECEBIDO' +
        #39
      'END DS_RETORNO_FORNEC'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA CRITICA'
      
        'JOIN PRDDM.DC_COMPRA_SITUACAO_DIVERGENCIA DS_CRITICA ON CRITICA.' +
        'CD_COMPRA_SITUACAO_CRITICA = DS_CRITICA.CD_COMPRA_SITUACAO_DIVER' +
        'GENCIA'
      
        'LEFT OUTER JOIN PRDDM.DC_FABRICANTE FABRIC ON CRITICA.CD_FORNECE' +
        'DOR = FABRIC.CD_FABRICANTE '
      
        'LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO ON CRITICA.CD_GR' +
        'UPO_FABRICANTE = GRUPO.CD_GRUPO_FORNECEDOR '
      'LEFT OUTER JOIN PRDDM.DCPES PES ON FABRIC.NR_CNPJ = PES.CGCP_P '
      
        'JOIN PRDDM.DC_COMPRADOR_GAM COMPRADOR ON CRITICA.CD_COMPRADOR = ' +
        'COMPRADOR.NR_COMPRADOR '
      'WHERE CRITICA.CD_COMPRADOR = :NR_COMPRADOR'
      'AND CRITICA.CD_COMPRA_SITUACAO_CRITICA = :STATUS'
      'ORDER BY SQ_ORDEM')
    SQLConnection = _dm._conexao
    Left = 518
    Top = 8
    object SQLRelacaoCriticaSQ_ORDEM: TFMTBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLRelacaoCriticaCD_FABRICANTE: TFMTBCDField
      FieldName = 'CD_FABRICANTE'
      Precision = 32
    end
    object SQLRelacaoCriticaNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Size = 40
    end
    object SQLRelacaoCriticaNR_PEDIDO_GAM: TFMTBCDField
      FieldName = 'NR_PEDIDO_GAM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLRelacaoCriticaID_CD: TWideStringField
      FieldName = 'ID_CD'
      FixedChar = True
      Size = 2
    end
    object SQLRelacaoCriticaDT_CRITICA: TSQLTimeStampField
      FieldName = 'DT_CRITICA'
      Required = True
    end
    object SQLRelacaoCriticaDS_NFE_CHAVE: TWideStringField
      FieldName = 'DS_NFE_CHAVE'
      Required = True
      Size = 200
    end
    object SQLRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
      Required = True
    end
    object SQLRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object SQLRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TWideStringField
      FieldName = 'DS_OBSERVACAO_COMPRADOR'
      Size = 200
    end
    object SQLRelacaoCriticaNM_COMPRADOR_REDUZIDO: TWideStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
    object SQLRelacaoCriticaID_RETORNO_FORNECEDOR: TWideStringField
      FieldName = 'ID_RETORNO_FORNECEDOR'
      Size = 1
    end
    object SQLRelacaoCriticaDS_RETORNO_FORNEC: TWideStringField
      FieldName = 'DS_RETORNO_FORNEC'
    end
    object SQLRelacaoCriticaNR_NFE: TFMTBCDField
      FieldName = 'NR_NFE'
      Required = True
      Precision = 9
      Size = 0
    end
  end
  object DSPRelacaoCritica: TDataSetProvider
    DataSet = SQLRelacaoCritica
    Left = 622
    Top = 8
  end
  object CDSRelacaoCritica: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
    ProviderName = 'DSPRelacaoCritica'
    Left = 718
    Top = 8
    object CDSRelacaoCriticaSQ_ORDEM: TFMTBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSRelacaoCriticaCD_FABRICANTE: TFMTBCDField
      FieldName = 'CD_FABRICANTE'
      Precision = 32
    end
    object CDSRelacaoCriticaNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Size = 40
    end
    object CDSRelacaoCriticaNR_PEDIDO_GAM: TFMTBCDField
      FieldName = 'NR_PEDIDO_GAM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSRelacaoCriticaNR_NFE: TFMTBCDField
      FieldName = 'NR_NFE'
      Required = True
      Precision = 9
      Size = 0
    end
    object CDSRelacaoCriticaID_CD: TWideStringField
      DisplayLabel = 'CD'
      FieldName = 'ID_CD'
      FixedChar = True
      Size = 2
    end
    object CDSRelacaoCriticaDT_CRITICA: TSQLTimeStampField
      FieldName = 'DT_CRITICA'
      Required = True
    end
    object CDSRelacaoCriticaDS_NFE_CHAVE: TWideStringField
      FieldName = 'DS_NFE_CHAVE'
      Required = True
      Size = 200
    end
    object CDSRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
      Required = True
    end
    object CDSRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object CDSRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TWideStringField
      FieldName = 'DS_OBSERVACAO_COMPRADOR'
      Size = 200
    end
    object CDSRelacaoCriticaNM_COMPRADOR_REDUZIDO: TWideStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
    object CDSRelacaoCriticaID_RETORNO_FORNECEDOR: TWideStringField
      FieldName = 'ID_RETORNO_FORNECEDOR'
      Size = 1
    end
    object CDSRelacaoCriticaDS_RETORNO_FORNEC: TWideStringField
      FieldName = 'DS_RETORNO_FORNEC'
    end
  end
  object DSRelacaoCritica: TDataSource
    DataSet = CDSRelacaoCritica
    Left = 814
    Top = 8
  end
  object SQLMudaStatusCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = _dm._conexao
    Left = 918
    Top = 8
  end
end
