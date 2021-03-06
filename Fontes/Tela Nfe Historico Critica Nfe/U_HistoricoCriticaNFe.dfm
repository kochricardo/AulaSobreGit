object _frHistoricoCriticaNFe: T_frHistoricoCriticaNFe
  Left = 192
  Top = 107
  Width = 763
  Height = 537
  Caption = 'Historico de Criticas NFe'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 491
    Width = 755
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 5
    Width = 742
    Height = 478
    TabOrder = 1
    object DBGridCapaCritica: TDBGrid
      Left = 8
      Top = 14
      Width = 722
      Height = 170
      Hint = 
        '            TECLAS DE FUN'#199#195'O'#13#10'ENTER  -> VISUALIZA CRITICA'#13#10'ESC  ' +
        '     -> SAIR DA CONSULTA'
      DataSource = DSCapaCritica
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGridCapaCriticaKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SQ_ORDEM'
          Title.Caption = 'N'#186' CRIT.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
          Title.Caption = 'SITUA'#199#195'O'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_CRITICA'
          Title.Caption = 'DATA CRITICA'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_LIBERACAO'
          Title.Caption = 'DATA LIBERA'#199#195'O'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_OBSERVACAO_COMPRADOR'
          Title.Caption = 'OBS COMPRADOR'
          Width = 280
          Visible = True
        end>
    end
    object DBGridItemCritica: TDBGrid
      Left = 8
      Top = 195
      Width = 722
      Height = 273
      DataSource = DSItemCritica
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGridItemCriticaKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SQ_ORDEM'
          Title.Caption = 'N'#186' CRIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ITEM_ORDEM'
          Title.Caption = 'ITEM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_COMPRA_DIVERGENCIA'
          Title.Caption = 'TIPO DIVERGENCIA'
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_OBSERVACAO_SISTEMA'
          Title.Caption = 'DESCRI'#199#195'O CRITICA'
          Width = 700
          Visible = True
        end>
    end
  end
  object SQLCapaCritica: TSQLQuery
    NoMetadata = True
    SQLConnection = DM_DB.Conexao_SIPROD
    Params = <
      item
        DataType = ftString
        Name = 'ChaveNFe'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select sq_ordem,ds_compra_situacao_divergencia,dt_critica,dt_lib' +
        'eracao,ds_observacao_comprador'
      
        'from prddm.dc_compra_critica_entrada,prddm.dc_compra_situacao_di' +
        'vergencia'
      'where id_situacao_critica = cd_compra_situacao_divergencia'
      'and ds_nfe_chave = :ChaveNFe'
      'order by sq_ordem')
    Left = 208
    Top = 72
    object SQLCapaCriticaSQ_ORDEM: TBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLCapaCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object SQLCapaCriticaDT_CRITICA: TSQLTimeStampField
      FieldName = 'DT_CRITICA'
      Required = True
    end
    object SQLCapaCriticaDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
      Required = True
    end
    object SQLCapaCriticaDS_OBSERVACAO_COMPRADOR: TStringField
      FieldName = 'DS_OBSERVACAO_COMPRADOR'
      Size = 200
    end
  end
  object SQLItemCritica: TSQLQuery
    NoMetadata = True
    SQLConnection = DM_DB.Conexao_SIPROD
    Params = <
      item
        DataType = ftString
        Name = 'nrOrdem'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select b.sq_ordem,b.nr_item_ordem,ds_compra_divergencia,ds_obser' +
        'vacao_sistema'
      
        'from prddm.dc_compra_critica_entrada a,prddm.dc_compra_item_crit' +
        'ica_entrada b,'
      'prddm.dc_compra_divergencia c'
      'where a.sq_ordem = b.sq_ordem'
      'and b.cd_compra_divergencia = c.cd_compra_divergencia'
      'and b.sq_ordem = :nrOrdem'
      'order by 1,2')
    Left = 200
    Top = 256
    object SQLItemCriticaSQ_ORDEM: TBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemCriticaNR_ITEM_ORDEM: TBCDField
      FieldName = 'NR_ITEM_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemCriticaDS_COMPRA_DIVERGENCIA: TStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQLItemCriticaDS_OBSERVACAO_SISTEMA: TStringField
      FieldName = 'DS_OBSERVACAO_SISTEMA'
      Required = True
      Size = 500
    end
  end
  object DSPCapaCritica: TDataSetProvider
    DataSet = SQLCapaCritica
    Constraints = True
    Left = 248
    Top = 72
  end
  object CDSCapaCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCapaCritica'
    Left = 288
    Top = 72
    object CDSCapaCriticaSQ_ORDEM: TBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSCapaCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object CDSCapaCriticaDT_CRITICA: TSQLTimeStampField
      FieldName = 'DT_CRITICA'
      Required = True
    end
    object CDSCapaCriticaDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
      Required = True
    end
    object CDSCapaCriticaDS_OBSERVACAO_COMPRADOR: TStringField
      FieldName = 'DS_OBSERVACAO_COMPRADOR'
      Size = 200
    end
  end
  object DSCapaCritica: TDataSource
    DataSet = CDSCapaCritica
    Left = 328
    Top = 72
  end
  object DSPItemCritica: TDataSetProvider
    DataSet = SQLItemCritica
    Constraints = True
    Left = 232
    Top = 256
  end
  object CDSItemCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItemCritica'
    Left = 272
    Top = 256
    object CDSItemCriticaSQ_ORDEM: TBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemCriticaNR_ITEM_ORDEM: TBCDField
      FieldName = 'NR_ITEM_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemCriticaDS_COMPRA_DIVERGENCIA: TStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDSItemCriticaDS_OBSERVACAO_SISTEMA: TStringField
      FieldName = 'DS_OBSERVACAO_SISTEMA'
      Required = True
      Size = 500
    end
  end
  object DSItemCritica: TDataSource
    DataSet = CDSItemCritica
    Left = 312
    Top = 256
  end
end
