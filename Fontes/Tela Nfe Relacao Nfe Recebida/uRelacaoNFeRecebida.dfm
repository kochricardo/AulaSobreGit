object _frmNfeRelacaoNFeRecebida: T_frmNfeRelacaoNFeRecebida
  Left = 220
  Top = 119
  Caption = 'Rela'#231#227'o de Notas Fiscais Recebidas ( 30 dias )'
  ClientHeight = 561
  ClientWidth = 852
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
    Left = 0
    Top = 0
    Width = 852
    Height = 542
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object DBGridConsultaGED: TDBGrid
      Left = 1
      Top = 14
      Width = 850
      Height = 527
      Hint = 'TECLE  [  F1 ]  PARA VISUALIZAR OS DADOS DA DANFE !'
      Align = alClient
      DataSource = DSConsultaGED
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridConsultaGEDDrawColumnCell
      OnKeyDown = DBGridConsultaGEDKeyDown
      OnKeyPress = DBGridConsultaGEDKeyPress
      OnTitleClick = DBGridConsultaGEDTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_SITUACAO'
          Title.Caption = 'STATUS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_FORNECEDOR'
          Title.Caption = 'COD LAB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMP_P'
          Title.Caption = 'FORNECEDOR'
          Width = 296
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_EMISSAO'
          Title.Caption = 'DT EMISS'#195'O'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_ATUALIZACAO'
          Title.Caption = 'DT ATUALIZACAO'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_NFE'
          Title.Caption = 'N'#186' NFE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PEDIDO_COMPRA'
          Title.Caption = 'PEDIDO'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CD'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 542
    Width = 852
    Height = 19
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
  end
  object SQLConsultaGED: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NRO_COMPRADOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT A.ID_SITUACAO,CD_FORNECEDOR, NOMP_P, DT_EMISSAO, '
      '       A.DT_ATUALIZACAO, NM_COMPRADOR_REDUZIDO,'
      '       DS_NFE_CHAVE,NR_NFE,NR_PEDIDO_COMPRA, '
      '       CASE'
      '         WHEN PEDIDO.CD_EMPRESA=4 THEN '#39'RS'#39
      '         WHEN PEDIDO.CD_EMPRESA=1 THEN '#39'SC'#39
      '         WHEN PEDIDO.CD_EMPRESA=5 THEN '#39'ES'#39
      '       END ID_CD'
      'FROM '
      '     PRDDM.DCPES,'
      '     PRDDM.DC_COMPRADOR_GAM,'
      '     PRDDM.DCEMP,'
      '     PRDDM.DC_NFE_COMPRA_GED A'
      
        '     LEFT OUTER JOIN PRDDM.DCPCC PEDIDO ON PEDIDO.NROP_P=A.NR_PE' +
        'DIDO_COMPRA'
      '     WHERE CGCP_P = A.NR_CNPJ_EMITENTE'
      'AND A.CD_COMPRADOR = NR_COMPRADOR'
      'AND NR_COMPRADOR =:NRO_COMPRADOR'
      'AND TRUNC(A.DT_ATUALIZACAO)  >= (DATE_E - 30)'
      'ORDER BY DT_ATUALIZACAO,NOMP_P'
      '')
    SQLConnection = _dm._conexao
    Left = 448
    Top = 88
  end
  object DSPConsultaGED: TDataSetProvider
    DataSet = SQLConsultaGED
    Left = 488
    Top = 88
  end
  object CDSConsultaGED: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NRO_COMPRADOR'
        ParamType = ptInput
      end>
    ProviderName = 'DSPConsultaGED'
    Left = 528
    Top = 88
    object CDSConsultaGEDID_SITUACAO: TWideStringField
      FieldName = 'ID_SITUACAO'
      Required = True
      Size = 1
    end
    object CDSConsultaGEDCD_FORNECEDOR: TFMTBCDField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSConsultaGEDNOMP_P: TWideStringField
      FieldName = 'NOMP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object CDSConsultaGEDDT_EMISSAO: TSQLTimeStampField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object CDSConsultaGEDDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Required = True
    end
    object CDSConsultaGEDNM_COMPRADOR_REDUZIDO: TWideStringField
      FieldName = 'NM_COMPRADOR_REDUZIDO'
      Required = True
      Size = 10
    end
    object CDSConsultaGEDDS_NFE_CHAVE: TWideStringField
      FieldName = 'DS_NFE_CHAVE'
      Required = True
      Size = 200
    end
    object CDSConsultaGEDNR_NFE: TFMTBCDField
      FieldName = 'NR_NFE'
      Required = True
      Precision = 9
      Size = 0
    end
    object CDSConsultaGEDNR_PEDIDO_COMPRA: TFMTBCDField
      FieldName = 'NR_PEDIDO_COMPRA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSConsultaGEDID_CD: TWideStringField
      DisplayLabel = 'CD'
      FieldName = 'ID_CD'
      FixedChar = True
      Size = 2
    end
  end
  object DSConsultaGED: TDataSource
    DataSet = CDSConsultaGED
    Left = 568
    Top = 88
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 48
    Top = 80
  end
end
