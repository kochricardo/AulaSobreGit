object _frmCriticaPedidoNfe: T_frmCriticaPedidoNfe
  Left = 192
  Top = 115
  Caption = '  Analise de  Diverg'#234'ncia - Pedido de Compra x XML NFe'
  ClientHeight = 600
  ClientWidth = 839
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
    Width = 839
    Height = 19
    Panels = <>
  end
  object RGroupStatusCritica: TRadioGroup
    Left = 6
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
    Left = 6
    Top = 49
    Width = 826
    Height = 531
    Caption = '  RELA'#199#195'O DE CR'#205'TICAS  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object DbGridRelacaoCritica: TDBGrid
      Left = 10
      Top = 18
      Width = 807
      Height = 501
      Ctl3D = False
      DataSource = DSRelacaoCritica
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
    Params = <
      item
        DataType = ftBCD
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
      'CRITICA.NR_NOTA_FISCAL,'
      'CRITICA.NR_PEDIDO_GAM,'
      'CRITICA.DT_CRITICA,'
      'CRITICA.DS_NFE_CHAVE,'
      'CRITICA.DT_LIBERACAO,'
      'DS_CRITICA.DS_COMPRA_SITUACAO_DIVERGENCIA,'
      'CRITICA.DS_OBSERVACAO_COMPRADOR,'
      'COMPRADOR.NM_COMPRADOR_REDUZIDO'
      'FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA CRITICA'
      
        'JOIN PRDDM.DC_COMPRA_SITUACAO_DIVERGENCIA DS_CRITICA ON CRITICA.' +
        'ID_SITUACAO_CRITICA = DS_CRITICA.CD_COMPRA_SITUACAO_DIVERGENCIA'
      
        'LEFT OUTER JOIN PRDDM.DC_FABRICANTE FABRIC ON CRITICA.CD_FORNECE' +
        'DOR = FABRIC.CD_FABRICANTE '
      
        'LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO ON CRITICA.CD_LA' +
        'BORATORIO = GRUPO.CD_GRUPO_FORNECEDOR '
      'LEFT OUTER JOIN PRDDM.DCPES PES ON FABRIC.NR_CNPJ = PES.CGCP_P '
      
        'JOIN PRDDM.DC_COMPRADOR_GAM COMPRADOR ON CRITICA.CD_COMPRADOR = ' +
        'COMPRADOR.NR_COMPRADOR '
      'WHERE CRITICA.CD_COMPRADOR = :NR_COMPRADOR'
      'AND CRITICA.ID_SITUACAO_CRITICA = :STATUS'
      'ORDER BY SQ_ORDEM')
    Left = 606
    Top = 8
    object SQLRelacaoCriticaSQ_ORDEM: TBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLRelacaoCriticaCD_FABRICANTE: TFMTBCDField
      FieldName = 'CD_FABRICANTE'
      Precision = 32
    end
    object SQLRelacaoCriticaNOMP_P: TStringField
      FieldName = 'NOMP_P'
      Size = 40
    end
    object SQLRelacaoCriticaNR_NOTA_FISCAL: TBCDField
      FieldName = 'NR_NOTA_FISCAL'
      Required = True
      Precision = 9
      Size = 0
    end
    object SQLRelacaoCriticaNR_PEDIDO_GAM: TBCDField
      FieldName = 'NR_PEDIDO_GAM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLRelacaoCriticaDT_CRITICA: TSQLTimeStampField
      FieldName = 'DT_CRITICA'
      Required = True
    end
    object SQLRelacaoCriticaDS_NFE_CHAVE: TStringField
      FieldName = 'DS_NFE_CHAVE'
      Required = True
      Size = 200
    end
    object SQLRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
      Required = True
    end
    object SQLRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object SQLRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TStringField
      FieldName = 'DS_OBSERVACAO_COMPRADOR'
      Size = 200
    end
    object SQLRelacaoCriticaNM_COMPRADOR_REDUZIDO: TStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
  end
  object DSPRelacaoCritica: TDataSetProvider
    DataSet = SQLRelacaoCritica
    Left = 638
    Top = 8
  end
  object CDSRelacaoCritica: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftBCD
        Name = 'NR_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
    ProviderName = 'DSPRelacaoCritica'
    Left = 670
    Top = 8
    object CDSRelacaoCriticaSQ_ORDEM: TBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSRelacaoCriticaCD_FABRICANTE: TFMTBCDField
      FieldName = 'CD_FABRICANTE'
      Precision = 32
    end
    object CDSRelacaoCriticaNOMP_P: TStringField
      FieldName = 'NOMP_P'
      Size = 40
    end
    object CDSRelacaoCriticaNR_NOTA_FISCAL: TBCDField
      FieldName = 'NR_NOTA_FISCAL'
      Required = True
      Precision = 9
      Size = 0
    end
    object CDSRelacaoCriticaNR_PEDIDO_GAM: TBCDField
      FieldName = 'NR_PEDIDO_GAM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSRelacaoCriticaDT_CRITICA: TSQLTimeStampField
      FieldName = 'DT_CRITICA'
      Required = True
    end
    object CDSRelacaoCriticaDS_NFE_CHAVE: TStringField
      FieldName = 'DS_NFE_CHAVE'
      Required = True
      Visible = False
      Size = 200
    end
    object CDSRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
      Required = True
    end
    object CDSRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object CDSRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TStringField
      FieldName = 'DS_OBSERVACAO_COMPRADOR'
      Size = 200
    end
    object CDSRelacaoCriticaNM_COMPRADOR_REDUZIDO: TStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
  end
  object DSRelacaoCritica: TDataSource
    DataSet = CDSRelacaoCritica
    Left = 702
    Top = 8
  end
  object SQLMudaStatusCritica: TSQLQuery
    Params = <>
    Left = 758
    Top = 8
  end
end
