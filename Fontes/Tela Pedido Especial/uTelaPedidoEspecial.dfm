object _frmPedidoEspecial: T_frmPedidoEspecial
  Left = 0
  Top = 0
  Caption = 'Pedido Especial'
  ClientHeight = 532
  ClientWidth = 1012
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 513
    Width = 1012
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1012
    Height = 130
    Align = alTop
    Caption = 'Filtro Comprador'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object _lbeCOmprador: TLabel
      Left = 17
      Top = 15
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label1: TLabel
      Left = 17
      Top = 41
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label18: TLabel
      Left = 220
      Top = 19
      Width = 96
      Height = 13
      Caption = 'Repor Estoque para'
    end
    object Label8: TLabel
      Left = 17
      Top = 69
      Width = 55
      Height = 13
      Caption = 'Pedido Por:'
    end
    object Label9: TLabel
      Left = 17
      Top = 102
      Width = 73
      Height = 13
      Caption = 'Pedido Especial'
    end
    object Label10: TLabel
      Left = 239
      Top = 75
      Width = 58
      Height = 13
      Caption = 'Qtade/Valor'
    end
    object _edtComprador: TEdit
      Left = 92
      Top = 13
      Width = 64
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
    end
    object _btnExecutaPonto: TBitBtn
      Left = 832
      Top = 35
      Width = 145
      Height = 25
      Caption = 'Mostra Produto Laboratorio'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = _btnExecutaPontoClick
    end
    object _edtNrFornecedor: TEdit
      Left = 92
      Top = 38
      Width = 64
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNomeFornecedor: TEdit
      Left = 162
      Top = 38
      Width = 258
      Height = 19
      NumbersOnly = True
      TabOrder = 3
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 322
      Top = 12
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 1
      ParentCtl3D = False
      TabOrder = 4
      Text = 'CD Tubar'#227'o'
      Items.Strings = (
        'CD SC e CD RS'
        'CD Tubar'#227'o'
        'CS Sta Cruz do Sul')
    end
    object _cbxValorQuantidade: TComboBox
      Left = 92
      Top = 67
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 5
      Text = 'Valor'
      Items.Strings = (
        'Valor'
        'Quantidade')
    end
    object ComboBox1: TComboBox
      Left = 92
      Top = 94
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 6
      Text = 'Geral'
      Items.Strings = (
        'Geral'
        'Produto')
    end
    object _edtParametro: TEdit
      Left = 303
      Top = 67
      Width = 117
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 7
    end
    object _grbEspecealidade: TGroupBox
      Left = 499
      Top = 3
      Width = 223
      Height = 124
      Caption = 'Especealidade'
      TabOrder = 8
      Visible = False
      object DBGrid2: TDBGrid
        Left = 1
        Top = 14
        Width = 221
        Height = 109
        Align = alClient
        DataSource = _dsEpecealidade
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
      end
    end
    object _chkFiltro: TCheckBox
      Left = 776
      Top = 75
      Width = 145
      Height = 17
      Caption = 'Mostra Todos Itens'
      TabOrder = 9
      OnClick = _chkFiltroClick
    end
    object _chkAjustaCamadaPalete: TCheckBox
      Left = 776
      Top = 107
      Width = 169
      Height = 17
      Caption = 'Ajusta para Camada e Palete'
      TabOrder = 10
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 130
    Width = 1012
    Height = 280
    Align = alTop
    Caption = 'Fornecedor(es) com Ponto de Encomenda'
    TabOrder = 2
    object _dbgProdutos: TDBGrid
      Left = 2
      Top = 15
      Width = 1008
      Height = 263
      Align = alClient
      DataSource = _dsTabelaProduto
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgProdutosDrawColumnCell
      OnTitleClick = _dbgProdutosTitleClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 416
    Width = 1012
    Height = 97
    Align = alBottom
    Caption = 'Filtro Comprador'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object Label2: TLabel
      Left = 147
      Top = 15
      Width = 94
      Height = 13
      Caption = 'Qtdade Pedndencia'
    end
    object Label3: TLabel
      Left = 147
      Top = 53
      Width = 76
      Height = 13
      Caption = 'Valor Pendencia'
    end
    object Label4: TLabel
      Left = 19
      Top = 15
      Width = 78
      Height = 13
      Caption = 'Qtdade Estoque'
    end
    object Label5: TLabel
      Left = 19
      Top = 53
      Width = 99
      Height = 13
      Caption = 'Valor Estoque (Lista)'
    end
    object Label6: TLabel
      Left = 263
      Top = 55
      Width = 96
      Height = 13
      Caption = 'Valor Venda (media)'
    end
    object Label7: TLabel
      Left = 263
      Top = 15
      Width = 105
      Height = 13
      Caption = 'Qtdade Venda(M'#233'dia)'
    end
    object Label11: TLabel
      Left = 436
      Top = 16
      Width = 97
      Height = 13
      Caption = 'Paramentro Especial'
    end
    object Label12: TLabel
      Left = 436
      Top = 53
      Width = 49
      Height = 13
      Caption = 'Cobertura'
    end
    object Label13: TLabel
      Left = 580
      Top = 53
      Width = 59
      Height = 13
      Caption = 'Valor Pedido'
    end
    object Label14: TLabel
      Left = 580
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Qtdade Pedido'
    end
    object _edtQtdadePendente: TEdit
      Left = 147
      Top = 31
      Width = 101
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
    end
    object _btnGeraPedido: TBitBtn
      Left = 832
      Top = 14
      Width = 137
      Height = 25
      Caption = 'Gera Pedido'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = _btnGeraPedidoClick
    end
    object _edtValorPendente: TEdit
      Left = 147
      Top = 68
      Width = 101
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtQtdadeEstoque: TEdit
      Left = 19
      Top = 32
      Width = 110
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 3
    end
    object _edtValorEstoque: TEdit
      Left = 19
      Top = 68
      Width = 110
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 4
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtValorVendaMedia: TEdit
      Left = 263
      Top = 68
      Width = 105
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 5
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtQtdadeVendaMedia: TEdit
      Left = 263
      Top = 32
      Width = 105
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 6
    end
    object _edtParametroEspecial: TEdit
      Left = 436
      Top = 32
      Width = 97
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 7
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtCoberturaEstoque: TEdit
      Left = 436
      Top = 68
      Width = 97
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 8
      OnKeyDown = _edtCoberturaEstoqueKeyDown
    end
    object _edtValorPedido: TEdit
      Left = 580
      Top = 68
      Width = 97
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 9
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtQtadePedido: TEdit
      Left = 580
      Top = 32
      Width = 97
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 10
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _btnParaExcel: TBitBtn
      Left = 840
      Top = 45
      Width = 129
      Height = 25
      Caption = 'Gera Excel Capa Ped. '
      DoubleBuffered = True
      Enabled = False
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
      TabOrder = 11
      OnClick = _btnParaExcelClick
    end
  end
  object _dsTabelaProduto: TDataSource
    DataSet = _cdsTabelaProduto
    Left = 440
    Top = 112
  end
  object _cdsTabelaProduto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 344
    Top = 112
    object _cdsTabelaProdutoVT_ESTOQUE_DISPONIVEL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_ESTOQUE_DISPONIVEL'
      Active = True
      Expression = 'SUM(ESTOQUE_DISPONIVEL*VL_UNITARIO_COMPRA)'
    end
    object _cdsTabelaProdutoVT_PENDENCIA: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_PENDENCIA'
      Active = True
      Expression = 'SUM(QT_PENDENTE*VL_UNITARIO_COMPRA)'
    end
    object _cdsTabelaProdutoQTDE_ESTOQUE_DISPONIVEL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'QTDE_ESTOQUE_DISPONIVEL'
      Active = True
      Expression = 'SUM(ESTOQUE_DISPONIVEL)'
    end
    object _cdsTabelaProdutoQTDE_PENDENCIA: TAggregateField
      Alignment = taRightJustify
      FieldName = 'QTDE_PENDENCIA'
      Active = True
      Expression = 'SUM(QT_PENDENTE)'
    end
    object _cdsTabelaProdutoVT_VENDA_MEDIA: TAggregateField
      Alignment = taRightJustify
      FieldName = 'VT_VENDA_MEDIA'
      Active = True
      Expression = 'SUM((MEDIA_DIA*30)*VL_UNITARIO_COMPRA)'
    end
    object _cdsTabelaProdutoQTDE_VENDA_MEDIA: TAggregateField
      FieldName = 'QTDE_VENDA_MEDIA'
      Active = True
      Expression = 'SUM(MEDIA_DIA*30)'
    end
    object _cdsTabelaProdutoQT_PEDIDO: TAggregateField
      FieldName = 'QT_PEDIDO'
      Active = True
      Expression = 'SUM(QT_PEDIDO)'
    end
    object _cdsTabelaProdutoVT_PEDIDO: TAggregateField
      FieldName = 'VT_PEDIDO'
      Active = True
      Expression = 'SUM(QT_PEDIDO*VL_UNITARIO_COMPRA)'
    end
  end
  object _cdsEspecealidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PnrLaboratorio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PnrLaboratorio'
        ParamType = ptInput
      end>
    ProviderName = '_dspEspecealidade'
    Left = 696
    Top = 32
  end
  object _dsEpecealidade: TDataSource
    DataSet = _cdsEspecealidade
    Left = 592
    Top = 49
  end
end
