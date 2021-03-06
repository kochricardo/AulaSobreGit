object _frmEnvioPedido: T_frmEnvioPedido
  Left = 0
  Top = 0
  Caption = 'Gerar/Enviar Arquivo de pedidos para Van'#39's'
  ClientHeight = 557
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 90
    Height = 13
    Caption = 'Mensagem Periodo'
  end
  object Label8: TLabel
    Left = 8
    Top = 56
    Width = 113
    Height = 13
    Caption = 'Tipo  Condi'#231#245'es Pedido '
  end
  object Label1: TLabel
    Left = 8
    Top = 104
    Width = 101
    Height = 13
    Caption = 'Condi'#231#227'o Pagamento'
  end
  object Label2: TLabel
    Left = 8
    Top = 152
    Width = 78
    Height = 13
    Caption = 'Refer'#234'ncia Data'
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 144
    Height = 13
    Caption = 'Refer'#234'ncia De Tempo da Data'
  end
  object Label6: TLabel
    Left = 8
    Top = 248
    Width = 74
    Height = 13
    Caption = 'Tipo de Per'#237'odo'
  end
  object Label9: TLabel
    Left = 8
    Top = 288
    Width = 112
    Height = 13
    Caption = 'Tipo do Uso Mercadoria'
  end
  object Label10: TLabel
    Left = 8
    Top = 328
    Width = 55
    Height = 13
    Caption = 'Tipo Pedido'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 538
    Width = 978
    Height = 19
    Panels = <>
  end
  object _cbxMensagemPedido: TComboBox
    Left = 8
    Top = 24
    Width = 316
    Height = 21
    Ctl3D = False
    ItemIndex = 2
    ParentCtl3D = False
    TabOrder = 1
    Text = '9     -  Original (Transmiss'#227'o Inicial)'
    Items.Strings = (
      '1     -  Cancelamento'
      '4     -  Altera'#231#227'o'
      '9     -  Original (Transmiss'#227'o Inicial)'
      '16   -  Proposta'
      '17   -  Cancelamento Altera'#231#227'o ser'#225' reenviada'
      '31   -  C'#243'pia(Pedido C'#243'pia de Pedido j'#224' ENVIADO)'
      '42   -  Confirma'#231#227'o(Pedido enviado por Outros meios)'
      '46   -  Provis'#243'ria')
  end
  object _cbTipoCondicaoPedido: TComboBox
    Left = 8
    Top = 75
    Width = 316
    Height = 21
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Text = '001 - Pedido Normal'
    Items.Strings = (
      '000 - Pedido Condi'#231#245'es Especial'
      '001 - Pedido Normal'
      '002 - Pedido Mercadorias Bonificadas'
      '003 - Pedido de Consigna'#231#227'o'
      '004 - Pedido Vendor'
      '005 - Pedido Compror'
      '006 - Pedido de Demonstra'#231#227'o'
      '007 - Pedido de programas de pacientes(Receita Vida)'
      '009 - Pedido de Opera'#231#227'o Logistica'
      'hos - Pedido Hospitalar')
  end
  object _cbxCondicaoPagamento: TComboBox
    Left = 8
    Top = 120
    Width = 316
    Height = 21
    ItemIndex = 3
    TabOrder = 3
    Text = '21   - Pagamento Parcelado'
    Items.Strings = (
      '1     - B'#225'sico'
      
        '3     - Data Fixa (Pag. realizado na data ou periodo estipulado ' +
        'no Pedido)'
      '20   - Multa'
      '21   - Pagamento Parcelado'
      '22   - Desconto por antecipa'#231#227'o Pagamento'
      'B01 - Pag. com Dias de  Concetra'#231#227'o'
      'JRM - Juros de Mora')
  end
  object _cbxDataReferencia: TComboBox
    Left = 8
    Top = 168
    Width = 316
    Height = 21
    ItemIndex = 0
    TabOrder = 4
    Text = '1   - Data do Pedido'
    Items.Strings = (
      '1   - Data do Pedido'
      '3   - Data do Contato'
      '5   - Data Fatura '
      '9   - Data de Recebimento da Fatura'
      '21 - Data de Recebimento das Mercadorias'
      '66 - Data Especificada (no Campo Vencimento)'
      '81 - Data do Embarque (conforme Doc. de Transporte)')
  end
  object _cbxReferenciaTempo: TComboBox
    Left = 8
    Top = 216
    Width = 316
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = '1   - Na Data de Refer'#234'ncia'
    Items.Strings = (
      '1   - Na Data de Refer'#234'ncia'
      '3   - Ap'#243's data de Refer'#234'ncia'
      
        '4   - Final do periodo de dez dias contendo a data refer'#234'ncia (f' +
        'ora a dezena)'
      
        '5   - Final do periodo de duas semanas  contendo a data refer'#234'nc' +
        'ia(fora duas semana)'
      '6   - Final do M'#234's contendo a data de Refer'#234'ncia(fora o mes) '
      
        '10 - Final da semana contendo adata de refer'#234'ncia (fora a semana' +
        ')'
      
        '10E- Final da Quinzena contendo a data de refer'#234'ncia (fora quinz' +
        'ena)')
  end
  object _cbxTipoPeriodo: TComboBox
    Left = 8
    Top = 264
    Width = 316
    Height = 21
    ItemIndex = 2
    TabOrder = 6
    Text = 'CD  - Dias do Calend'#225'rio (incluido fins-de-semanae feriado)'
    Items.Strings = (
      '3M  - Trimestre'
      '6M  - Semestre'
      'CD  - Dias do Calend'#225'rio (incluido fins-de-semanae feriado)'
      'D    - Dia'
      'H    - Hora'
      'M    - M'#234's'
      'W   - Semana'
      'WD- Dias '#217'teis (excluindo fins-de-semana e feriados)'
      'Y    - Ano')
  end
  object _grbCondicaoPagamen: TGroupBox
    Left = 8
    Top = 368
    Width = 313
    Height = 125
    Caption = 'Condi'#231#227'o Pagamento'
    TabOrder = 7
    object _dbgCondicaoPagamento: TDBGrid
      Left = 2
      Top = 15
      Width = 309
      Height = 108
      Align = alClient
      DataSource = _dsCondicaoPagamentos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object _grbFiltroPedido: TGroupBox
    Left = 325
    Top = 19
    Width = 653
    Height = 131
    Caption = 'Filtros Pedidos'
    TabOrder = 8
    object _lbeDataInicial: TLabel
      Left = 10
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Dt.Inicial'
    end
    object Label4: TLabel
      Left = 10
      Top = 87
      Width = 40
      Height = 13
      Caption = 'Dt. Final'
    end
    object Comprador: TLabel
      Left = 11
      Top = 13
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label3: TLabel
      Left = 430
      Top = 26
      Width = 91
      Height = 13
      Caption = 'Pedidos Op. Redes'
    end
    object _dtpDataInicial: TDateTimePicker
      Left = 10
      Top = 62
      Width = 86
      Height = 21
      Date = 41596.758921250000000000
      Time = 41596.758921250000000000
      TabOrder = 0
    end
    object _dtpDataFinal: TDateTimePicker
      Left = 10
      Top = 100
      Width = 86
      Height = 21
      Date = 41596.758921250000000000
      Time = 41596.758921250000000000
      TabOrder = 1
    end
    object _edtComprador: TEdit
      Left = 10
      Top = 27
      Width = 86
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object _rgLaboratorio: TRadioGroup
      Left = 102
      Top = 23
      Width = 185
      Height = 105
      Caption = 'Laborat'#243'rios'
      ItemIndex = 1
      Items.Strings = (
        'Individual'
        'Todos')
      TabOrder = 3
      OnClick = _rgLaboratorioClick
    end
    object _edtNumeroLaboratorio: TEdit
      Left = 181
      Top = 79
      Width = 106
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      OnClick = _edtNumeroLaboratorioClick
    end
    object _rgSituacaoPedido: TRadioGroup
      Left = 293
      Top = 20
      Width = 131
      Height = 74
      Caption = 'Sistua'#231#227'o do Pedido'
      Ctl3D = False
      ItemIndex = 0
      Items.Strings = (
        '&Novos'
        'Fa&Turado'
        'To&Dos')
      ParentCtl3D = False
      TabOrder = 5
    end
    object _btnPesquisa: TBitBtn
      Left = 293
      Top = 100
      Width = 132
      Height = 25
      Caption = 'Pesquisa'
      DoubleBuffered = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
        D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
        0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
        000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
        8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
        0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = _btnPesquisaClick
    end
    object _cbxOperacaoRede: TComboBox
      Left = 430
      Top = 45
      Width = 209
      Height = 21
      TabOrder = 7
    end
  end
  object GroupBox1: TGroupBox
    Left = 321
    Top = 160
    Width = 655
    Height = 198
    Caption = 'Pedidos'
    TabOrder = 9
    object _dbgPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 651
      Height = 181
      Align = alClient
      Ctl3D = False
      DataSource = _dsPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPedidoDrawColumnCell
      OnDblClick = _dbgPedidoDblClick
      OnTitleClick = _dbgPedidoTitleClick
    end
  end
  object _btnGeraArquivo: TBitBtn
    Left = 325
    Top = 503
    Width = 137
    Height = 33
    Caption = 'Gerar Arquivo'
    DoubleBuffered = True
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 10
    OnClick = _btnGeraArquivoClick
  end
  object GroupBox2: TGroupBox
    Left = 323
    Top = 359
    Width = 655
    Height = 138
    Caption = 'Pedidos'
    TabOrder = 11
    object _dbgItemPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 651
      Height = 121
      Align = alClient
      Ctl3D = False
      DataSource = _dsItemPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgItemPedidoDrawColumnCell
      OnTitleClick = _dbgPedidoTitleClick
    end
  end
  object _cbxTipoUsoMercadoria: TComboBox
    Left = 8
    Top = 305
    Width = 312
    Height = 21
    Ctl3D = False
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 12
    Text = '001 - Mercadoria para Revenda'
    Items.Strings = (
      '001 - Mercadoria para Revenda'
      '002 - Merc. Para consumo pr'#243'prio'
      '003 - Opera'#231#227'o Beneficiamento - Triangula'#231#227'o'
      '004 - Demonstra'#231#227'o'
      '005 - Importa'#231#227'o'
      '006 - Exporta'#231#227'o'
      '007 - Mercadoria gratuitas,ou'
      '008 - Doa'#231#227'o')
  end
  object _cbxTipoPedido: TComboBox
    Left = 8
    Top = 341
    Width = 312
    Height = 21
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 13
    Text = '220 - Pedido Normal'
    Items.Strings = (
      '220 - Pedido Normal'
      '224 - Pedido Urgente'
      '22E - Pedido Colocado Pelo Fornecedor'
      '316 - Pedido Normal Novartis')
  end
  object _cdsPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 348
    Top = 196
  end
  object _dsPedidos: TDataSource
    DataSet = _cdsPedidos
    OnDataChange = _dsPedidosDataChange
    Left = 428
    Top = 196
  end
  object _cdsCondicaoPagamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 384
    object _cdsCondicaoPagamentosNR_PARCELAS: TAutoIncField
      DisplayLabel = 'Parcela'
      DisplayWidth = 5
      FieldName = 'NR_PARCELAS'
    end
    object _cdsCondicaoPagamentosNR_DIAS: TIntegerField
      DisplayLabel = 'Nr. Dias'
      FieldName = 'NR_DIAS'
      DisplayFormat = '##0'
    end
    object _cdsCondicaoPagamentosPC_PARCELAS: TFloatField
      DisplayLabel = '% Parc.'
      DisplayWidth = 5
      FieldName = 'PC_PARCELAS'
      DisplayFormat = '##0.00'
    end
    object _cdsCondicaoPagamentosVL_PARCELAS: TFloatField
      DisplayLabel = 'Vl. Pagamentos'
      FieldName = 'VL_PARCELAS'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsCondicaoPagamentosDT_PAGAMENTOS: TDateField
      DisplayLabel = 'Dt. Venc.'
      FieldName = 'DT_PAGAMENTOS'
    end
  end
  object _dsCondicaoPagamentos: TDataSource
    DataSet = _cdsCondicaoPagamentos
    Left = 88
    Top = 392
  end
  object _cdsItemPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 436
    Top = 404
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsItemPedido
    Left = 508
    Top = 412
  end
  object _IdFTP: TIdFTP
    IPVersion = Id_IPv4
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 536
    Top = 8
  end
end
