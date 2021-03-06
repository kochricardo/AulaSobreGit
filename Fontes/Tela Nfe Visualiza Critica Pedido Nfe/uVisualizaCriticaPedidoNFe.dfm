object _frmVisualizaCriticaNFe: T_frmVisualizaCriticaNFe
  Left = 288
  Top = 162
  BorderIcons = [biSystemMenu]
  Caption = 'VISUALIZA'#199#195'O DA CRITICA'
  ClientHeight = 569
  ClientWidth = 1018
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
  object GroupBox2: TGroupBox
    Left = 367
    Top = 359
    Width = 637
    Height = 186
    Caption = '  FINALIZAR CR'#205'TICA  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 9
    object Label3: TLabel
      Left = 364
      Top = 22
      Width = 99
      Height = 13
      Caption = 'SITUA'#199#195'O CRITICA'
      Enabled = False
    end
    object Label5: TLabel
      Left = 10
      Top = 22
      Width = 167
      Height = 13
      Caption = 'OBSERVA'#199#195'O COMPRADOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 184
      Top = 21
      Width = 30
      Height = 13
      Caption = '( 200 )'
      Visible = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 372
    Top = 235
    Width = 632
    Height = 81
    Caption = '  SOLUCIONAR DIVERGENCIA  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label1: TLabel
      Left = 10
      Top = 23
      Width = 130
      Height = 13
      Caption = 'N'#186' PEDIDO COMPRA :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 52
      Width = 57
      Height = 13
      Caption = 'MOTIVO :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CheckBoxReprocessarCriticaToda: TCheckBox
      Left = 470
      Top = 48
      Width = 151
      Height = 17
      Caption = 'REPROCESSAR CRITICA'
      Enabled = False
      TabOrder = 0
      OnClick = CheckBoxReprocessarCriticaTodaClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 367
    Top = 6
    Width = 637
    Height = 170
    Caption = '  DETALHES  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 11
    object Label4: TLabel
      Left = 10
      Top = 16
      Width = 76
      Height = 13
      Caption = 'DESCRI'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 9
      Top = 124
      Width = 57
      Height = 13
      Caption = 'MOTIVO  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbmmDsCritica: TDBMemo
      Left = 10
      Top = 32
      Width = 614
      Height = 86
      Ctl3D = False
      DataField = 'DS_OBSERVACAO_SISTEMA'
      DataSource = DSItemCritica
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbMemoMotivocritica: TDBMemo
      Left = 10
      Top = 137
      Width = 607
      Height = 24
      Ctl3D = False
      DataField = 'DS_COMPRA_SOLUCAO_DIVERGENCIA'
      DataSource = DSItemCritica
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 5
    Width = 352
    Height = 457
    Caption = '  LISTA DE DIVERG'#202'NCIAS  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 8
    object DBGridListaCritica: TDBGrid
      Left = 1
      Top = 14
      Width = 350
      Height = 442
      Hint = 
        '                                    TECLAS DE FUN'#199#195'O'#13#10'* SHIFT + ' +
        'SETA P/ BAIXO  -> SELECIONAR LISTA DE DIVERGENCIAS'#13#10'* F1  -> VIS' +
        'UALIZAR NOTA FISCAL'#13#10'* F2  -> VISUALIZA PEDIDO DE COMPRA'#13#10'* F5  ' +
        '-> SOLUCIONAR DIVERGENCIAS SELECIONADAS'
      Align = alClient
      Ctl3D = False
      DataSource = DSItemCritica
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridListaCriticaKeyDown
      OnKeyPress = DBGridListaCriticaKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_ITEM_ORDEM'
          Title.Caption = 'SEQ'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_COMPRA_DIVERGENCIA'
          Title.Caption = ' TITULO DA  CRITICA'
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_SITUACAO'
          Title.Caption = 'SIT'
          Width = 25
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 550
    Width = 1018
    Height = 19
    Panels = <>
  end
  object edPedidoCompra: TEdit
    Left = 518
    Top = 253
    Width = 79
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 7
    OnKeyPress = edPedidoCompraKeyPress
  end
  object cbSolucaoCritica: TComboBox
    Left = 442
    Top = 281
    Width = 390
    Height = 22
    Style = csOwnerDrawFixed
    Ctl3D = False
    DropDownCount = 20
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnKeyPress = cbSolucaoCriticaKeyPress
  end
  object mmObsComprador: TMemo
    Left = 377
    Top = 397
    Width = 337
    Height = 136
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    MaxLength = 200
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = mmObsCompradorChange
    OnEnter = mmObsCompradorEnter
    OnExit = mmObsCompradorExit
    OnKeyPress = mmObsCompradorKeyPress
  end
  object rgEnviaMSG: TRadioGroup
    Left = 730
    Top = 432
    Width = 265
    Height = 74
    BiDiMode = bdRightToLeftReadingOnly
    Caption = '  ENVIAR MENSAGEM PARA '
    Ctl3D = False
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'N'#195'O ENVIAR MENSAGEM'
      'ENTRADA DE MERCADORIA'
      'SETOR FINANCEIRO')
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 2
  end
  object btFechar: TButton
    Left = 863
    Top = 512
    Width = 102
    Height = 25
    Caption = 'FECHA&R'
    TabOrder = 5
    OnClick = btFecharClick
  end
  object btSalvar: TButton
    Left = 750
    Top = 512
    Width = 102
    Height = 25
    Caption = '&SALVAR'
    Enabled = False
    TabOrder = 4
    OnClick = btSalvarClick
  end
  object cbSituacaoCritica: TComboBox
    Left = 730
    Top = 400
    Width = 265
    Height = 24
    DropDownCount = 20
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'INFORME A SITUA'#199#195'O'
    OnKeyPress = cbSituacaoCriticaKeyPress
  end
  object GroupBox5: TGroupBox
    Left = 369
    Top = 182
    Width = 470
    Height = 47
    Caption = '  BUSCA PEDIDO DE COMPRA  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 12
    object lbCodProduto: TLabel
      Left = 15
      Top = 21
      Width = 114
      Height = 13
      Caption = 'CODIGO PRODUTO'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edCodProduto: TEdit
      Left = 142
      Top = 17
      Width = 63
      Height = 19
      TabOrder = 0
    end
    object btBuscaPedido: TButton
      Left = 221
      Top = 15
      Width = 102
      Height = 25
      Caption = 'CONSULTA'
      TabOrder = 1
      OnClick = btBuscaPedidoClick
    end
  end
  object DBGridBuscaPedido: TDBGrid
    Left = 32
    Top = 296
    Width = 253
    Height = 150
    Hint = 
      '               TECLAS DE FUN'#199#195'O'#13#10'ENTER -> VISUALIZAR PEDIDO'#13#10'ESC' +
      '      -> FECHAR LISTA DE PEDIDOS'
    DataSource = DSBuscaPedido
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnKeyPress = DBGridBuscaPedidoKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'NROP_P'
        Title.Caption = 'PEDIDO'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITP_P'
        Title.Caption = 'SIT'
        Width = 28
        Visible = True
      end>
  end
  object GroupBox6: TGroupBox
    Left = 798
    Top = 182
    Width = 157
    Height = 47
    Caption = '  HISTORICO DA NFe  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 14
    object Button1: TButton
      Left = 32
      Top = 15
      Width = 102
      Height = 25
      Caption = 'CONSULTA NFe'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object GroupBox7: TGroupBox
    Left = 10
    Top = 468
    Width = 347
    Height = 77
    Caption = '  ALTERAR DADOS DA CRITICA  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 15
    object lbNovoPedido: TLabel
      Left = 26
      Top = 26
      Width = 122
      Height = 13
      Caption = 'N'#186' PEDIDO COMPRA'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNovoPedidoCompra: TEdit
      Left = 154
      Top = 19
      Width = 56
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = edNovoPedidoCompraKeyPress
    end
    object btAlterarDadosCritica: TButton
      Left = 229
      Top = 33
      Width = 102
      Height = 24
      Caption = 'ALTERAR'
      Enabled = False
      TabOrder = 1
      OnClick = btAlterarDadosCriticaClick
    end
    object CheckBoxAlterarComprador: TCheckBox
      Left = 3
      Top = 48
      Width = 14
      Height = 17
      Hint = 'Habilitar a op'#231#227'o de troca de comprador'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = CheckBoxAlterarCompradorClick
    end
    object cmbListaDeComprador: TComboBox
      Left = 26
      Top = 46
      Width = 182
      Height = 21
      Enabled = False
      TabOrder = 3
      OnCloseUp = cmbListaDeCompradorCloseUp
    end
  end
  object CheckBoxAlteraPedido: TCheckBox
    Left = 13
    Top = 493
    Width = 14
    Height = 17
    Hint = 'Habilitar a op'#231#227'o de troca de pedido de compra'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = CheckBoxAlteraPedidoClick
  end
  object rgStatusRetornoFornec: TRadioGroup
    Left = 367
    Top = 320
    Width = 637
    Height = 33
    Caption = '  RETORNO DO FORNECEDOR  '
    Columns = 4
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'SEM TRATAMENTO'
      'AGUARDANDO'
      'RETORNO RECEBIDO'
      'RETORNO NAO RECEBIDO')
    TabOrder = 17
  end
  object SQLItemCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ORDEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT A.SQ_ORDEM,A.NR_ITEM_ORDEM,C.DS_COMPRA_DIVERGENCIA,'
      '    A.DS_OBSERVACAO_SISTEMA,B.DS_OBSERVACAO_SOLUCIONADOR,'
      '    A.CD_COMPRA_DIVERGENCIA,D.DS_COMPRA_SOLUCAO_DIVERGENCIA,'
      '    A.DS_REFERENCIA_ITEM_NF,'
      '    A.CD_COMPRA_SOLUCAO_DIVERGENCIA,'
      'CASE'
      '   WHEN A.CD_COMPRA_SOLUCAO_DIVERGENCIA < 100 THEN'
      '      '#39'S'#39
      '    ELSE'
      '      '#39'N'#39
      'END ID_SITUACAO'
      ''
      'FROM PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA A,'
      '           PRDDM.DC_COMPRA_CRITICA_ENTRADA B,'
      '           PRDDM.DC_COMPRA_DIVERGENCIA C,'
      '           PRDDM.DC_COMPRA_SOLUCAO_DIVERGENCIA D'
      'WHERE A.SQ_ORDEM = B.SQ_ORDEM'
      'AND A.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA'
      
        'AND A.CD_COMPRA_SOLUCAO_DIVERGENCIA = D.CD_COMPRA_SOLUCAO_DIVERG' +
        'ENCIA'
      'AND A.CD_COMPRA_DIVERGENCIA = D.CD_COMPRA_DIVERGENCIA'
      '--AND A.CD_COMPRA_DIVERGENCIA <> 8'
      'AND A.SQ_ORDEM = :ORDEM'
      'ORDER BY A.NR_ITEM_ORDEM')
    SQLConnection = _dm._conexao
    Left = 39
    Top = 50
    object SQLItemCriticaSQ_ORDEM: TFMTBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemCriticaNR_ITEM_ORDEM: TFMTBCDField
      FieldName = 'NR_ITEM_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemCriticaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQLItemCriticaDS_OBSERVACAO_SISTEMA: TWideStringField
      FieldName = 'DS_OBSERVACAO_SISTEMA'
      Required = True
      Size = 500
    end
    object SQLItemCriticaDS_OBSERVACAO_SOLUCIONADOR: TWideStringField
      FieldName = 'DS_OBSERVACAO_SOLUCIONADOR'
      Required = True
      Size = 200
    end
    object SQLItemCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQLItemCriticaDS_REFERENCIA_ITEM_NF: TWideStringField
      FieldName = 'DS_REFERENCIA_ITEM_NF'
      Required = True
    end
    object SQLItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLItemCriticaID_SITUACAO: TWideStringField
      FieldName = 'ID_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object DSPItemCritica: TDataSetProvider
    DataSet = SQLItemCritica
    Left = 120
    Top = 48
  end
  object CDSItemCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItemCritica'
    Left = 200
    Top = 48
    object CDSItemCriticaSQ_ORDEM: TFMTBCDField
      FieldName = 'SQ_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemCriticaNR_ITEM_ORDEM: TFMTBCDField
      FieldName = 'NR_ITEM_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemCriticaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDSItemCriticaDS_OBSERVACAO_SISTEMA: TWideStringField
      FieldName = 'DS_OBSERVACAO_SISTEMA'
      Required = True
      Size = 500
    end
    object CDSItemCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemCriticaDS_OBSERVACAO_SOLUCIONADOR: TWideStringField
      FieldName = 'DS_OBSERVACAO_SOLUCIONADOR'
      Required = True
      Size = 200
    end
    object CDSItemCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDSItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSItemCriticaID_SITUACAO: TWideStringField
      FieldName = 'ID_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object CDSItemCriticaDS_REFERENCIA_ITEM_NF: TWideStringField
      FieldName = 'DS_REFERENCIA_ITEM_NF'
      Required = True
    end
  end
  object DSItemCritica: TDataSource
    DataSet = CDSItemCritica
    Left = 288
    Top = 48
  end
  object SQLSolucaoCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CD_DIVERGENCIA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM PRDDM.DC_COMPRA_DIVERGENCIA A,'
      '           PRDDM.DC_COMPRA_SOLUCAO_DIVERGENCIA B'
      'WHERE A.CD_COMPRA_DIVERGENCIA = B.CD_COMPRA_DIVERGENCIA'
      'AND  A.CD_COMPRA_DIVERGENCIA = :CD_DIVERGENCIA'
      'AND  B.CD_COMPRA_SOLUCAO_DIVERGENCIA < 100'
      'ORDER BY CD_COMPRA_SOLUCAO_DIVERGENCIA')
    SQLConnection = _dm._conexao
    Left = 43
    Top = 100
    object SQLSolucaoCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLSolucaoCriticaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object SQLSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLSolucaoCriticaDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Required = True
    end
    object SQLSolucaoCriticaNM_USUARIO: TWideStringField
      FieldName = 'NM_USUARIO'
      Required = True
      Size = 10
    end
    object SQLSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Size = 100
    end
  end
  object DSPSolucaoCritica: TDataSetProvider
    DataSet = SQLSolucaoCritica
    Left = 88
    Top = 104
  end
  object CDSSolucaoCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSolucaoCritica'
    Left = 120
    Top = 104
    object CDSSolucaoCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSSolucaoCriticaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
    object CDSSolucaoCriticaDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Required = True
    end
    object CDSSolucaoCriticaNM_USUARIO: TWideStringField
      FieldName = 'NM_USUARIO'
      Required = True
      Size = 10
    end
    object CDSSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Size = 100
    end
  end
  object DSSolucao: TDataSource
    DataSet = CDSSolucaoCritica
    Left = 152
    Top = 104
  end
  object SQLSituacaoCritica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * '
      'FROM PRDDM.DC_COMPRA_SITUACAO_DIVERGENCIA'
      'WHERE CD_COMPRA_SITUACAO_DIVERGENCIA > 1'
      'ORDER BY CD_COMPRA_SITUACAO_DIVERGENCIA')
    SQLConnection = _dm._conexao
    Left = 44
    Top = 154
    object SQLSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object SQLSituacaoCriticaDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Required = True
    end
    object SQLSituacaoCriticaNM_USUARIO: TWideStringField
      FieldName = 'NM_USUARIO'
      Required = True
      Size = 10
    end
  end
  object DSPSituacaoCritica: TDataSetProvider
    DataSet = SQLSituacaoCritica
    Left = 85
    Top = 154
  end
  object CDSSituacaoCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSituacaoCritica'
    Left = 117
    Top = 154
    object CDSSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_SITUACAO_DIVERGENCIA'
      Required = True
      Size = 40
    end
    object CDSSituacaoCriticaDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Required = True
    end
    object CDSSituacaoCriticaNM_USUARIO: TWideStringField
      FieldName = 'NM_USUARIO'
      Required = True
      Size = 10
    end
  end
  object DSSituacaoCritica: TDataSource
    DataSet = CDSSituacaoCritica
    Left = 149
    Top = 154
  end
  object SQLGenenicaSIPROD: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = _dm._conexao
    Left = 224
    Top = 96
  end
  object SQLStatusItemDivergencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SQ_ORDEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT CD_COMPRA_SOLUCAO_DIVERGENCIA,NR_ITEM_ORDEM,DS_COMPRA_DIV' +
        'ERGENCIA'
      'FROM PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA A,'
      '           PRDDM.DC_COMPRA_DIVERGENCIA B'
      'WHERE SQ_ORDEM = :SQ_ORDEM'
      'AND CD_COMPRA_SOLUCAO_DIVERGENCIA = 100'
      'AND A.CD_COMPRA_DIVERGENCIA = B.CD_COMPRA_DIVERGENCIA'
      'ORDER BY NR_ITEM_ORDEM')
    SQLConnection = _dm._conexao
    Left = 50
    Top = 196
    object SQLStatusItemDivergenciaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLStatusItemDivergenciaNR_ITEM_ORDEM: TFMTBCDField
      FieldName = 'NR_ITEM_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLStatusItemDivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
  end
  object DSPStatusItemDivergencia: TDataSetProvider
    DataSet = SQLStatusItemDivergencia
    Left = 96
    Top = 196
  end
  object CDSStatusItemDivergencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPStatusItemDivergencia'
    Left = 136
    Top = 196
    object CDSStatusItemDivergenciaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField
      FieldName = 'CD_COMPRA_SOLUCAO_DIVERGENCIA'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSStatusItemDivergenciaNR_ITEM_ORDEM: TFMTBCDField
      FieldName = 'NR_ITEM_ORDEM'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSStatusItemDivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField
      FieldName = 'DS_COMPRA_DIVERGENCIA'
      Required = True
      Size = 100
    end
  end
  object SQLBuscaPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT NROP_P, SITP_P,TRUNC(DATP_P) DATA'
      'FROM PRDDM.DCPCC,PRDDM.DCPCI'
      'WHERE NROP_P = NROP_Y'
      'AND NROM_Y = :CD_PRODUTO'
      'AND SITP_P IN ( '#39'N'#39','#39'P'#39')'
      'AND SITY_Y IN ('#39'N'#39','#39'P'#39')'
      'ORDER BY NROP_P')
    SQLConnection = _dm._conexao
    Left = 50
    Top = 244
    object SQLBuscaPedidoNROP_P: TFMTBCDField
      FieldName = 'NROP_P'
      Required = True
      Precision = 6
      Size = 0
    end
    object SQLBuscaPedidoSITP_P: TWideStringField
      FieldName = 'SITP_P'
      FixedChar = True
      Size = 1
    end
    object SQLBuscaPedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
  object DSPBuscaPedido: TDataSetProvider
    DataSet = SQLBuscaPedido
    Left = 104
    Top = 244
  end
  object CDSBuscaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPBuscaPedido'
    Left = 160
    Top = 244
    object CDSBuscaPedidoNROP_P: TFMTBCDField
      FieldName = 'NROP_P'
      Required = True
      Precision = 6
      Size = 0
    end
    object CDSBuscaPedidoSITP_P: TWideStringField
      FieldName = 'SITP_P'
      FixedChar = True
      Size = 1
    end
    object CDSBuscaPedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
  object DSBuscaPedido: TDataSource
    DataSet = CDSBuscaPedido
    Left = 216
    Top = 244
  end
end
