object _frmTelaCompras: T_frmTelaCompras
  Left = 0
  Top = 0
  Caption = 'tela Compras Nova II'
  ClientHeight = 582
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _pgcCompras: TPageControl
    Left = 0
    Top = 0
    Width = 1370
    Height = 563
    ActivePage = _tbsCompras
    Align = alClient
    TabOrder = 0
    OnChange = _pgcComprasChange
    object _tbsParametros: TTabSheet
      Caption = 'Parametros para Pedido'
      object Label26: TLabel
        Left = 115
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Dia(s) de Pedido.:'
      end
      object _lbeDiaPedido: TLabel
        Left = 219
        Top = 16
        Width = 62
        Height = 13
        Caption = 'descri'#231#227'o dia'
      end
      object Label27: TLabel
        Left = 438
        Top = 317
        Width = 46
        Height = 13
        Caption = 'Nr. Verba'
      end
      object GroupBox24: TGroupBox
        Left = 315
        Top = 167
        Width = 310
        Height = 18
        Caption = 'Numero de Itens por Curva'
        TabOrder = 1
        Visible = False
        object _gridItemCurva: TDBGrid
          Left = 2
          Top = 15
          Width = 306
          Height = 1
          Align = alClient
          DataSource = _dsItensCurva
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _gridItemCurvaDrawColumnCell
        end
      end
      object _lbeNrPedido: TLabeledEdit
        Left = 3
        Top = 13
        Width = 71
        Height = 19
        Ctl3D = False
        EditLabel.Width = 50
        EditLabel.Height = 13
        EditLabel.Caption = 'Nr. Pedido'
        ParentCtl3D = False
        TabOrder = 0
        OnExit = _lbeNrPedidoExit
        OnKeyDown = _lbeNrPedidoKeyDown
      end
      object _dtpData: TDateTimePicker
        Left = 519
        Top = 5
        Width = 145
        Height = 21
        Date = 42991.760888854160000000
        Time = 42991.760888854160000000
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 32
        Width = 302
        Height = 138
        Caption = 'Pedido Para:'
        TabOrder = 3
        object _dbgEmpresa: TDBGrid
          Left = 2
          Top = 15
          Width = 298
          Height = 121
          Align = alClient
          DataSource = _dsEmpresa
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgEmpresaDrawColumnCell
          OnDblClick = _dbgEmpresaDblClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 424
        Width = 305
        Height = 102
        Caption = 'LeadTime Fornecedor'
        TabOrder = 4
        object _dbgLeadTime: TDBGrid
          Left = 2
          Top = 15
          Width = 301
          Height = 85
          Align = alClient
          DataSource = _dsTabelaLeadTime
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbfDiasEstoqueDrawColumnCell
        end
      end
      object _grbFornecedor: TGroupBox
        Left = 6
        Top = 174
        Width = 302
        Height = 138
        Caption = 'Dados Fornecedor'
        TabOrder = 5
        object Label14: TLabel
          Left = 205
          Top = 53
          Width = 93
          Height = 13
          Caption = 'Frequencia Compra'
        end
        object Label10: TLabel
          Left = 9
          Top = 15
          Width = 73
          Height = 13
          Caption = 'Nr. Fornecedor'
        end
        object Label15: TLabel
          Left = 112
          Top = 15
          Width = 85
          Height = 13
          Caption = 'Nome Fornecedor'
        end
        object Label17: TLabel
          Left = 9
          Top = 55
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object Label12: TLabel
          Left = 203
          Top = 96
          Width = 86
          Height = 13
          Caption = 'Cpra. de Multiplos'
          Visible = False
        end
        object Label13: TLabel
          Left = 112
          Top = 96
          Width = 49
          Height = 13
          Caption = 'Tipo Frete'
        end
        object Label11: TLabel
          Left = 9
          Top = 96
          Width = 93
          Height = 13
          Caption = 'Cpra. Cxa Fechada'
        end
        object _lbeGrupoPedido: TLabeledEdit
          Left = 112
          Top = 67
          Width = 85
          Height = 19
          Ctl3D = False
          EditLabel.Width = 29
          EditLabel.Height = 13
          EditLabel.Caption = 'Grupo'
          ParentCtl3D = False
          TabOrder = 0
        end
        object _edtFrequenciaCompra: TEdit
          Left = 203
          Top = 67
          Width = 97
          Height = 21
          TabOrder = 2
        end
        object _edtFornecedor: TEdit
          Left = 9
          Top = 29
          Width = 97
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyDown = _edtFornecedorKeyDown
        end
        object _edtNomeFornecedor: TEdit
          Left = 112
          Top = 29
          Width = 185
          Height = 21
          TabOrder = 3
        end
        object _edtCnpj: TEdit
          Left = 9
          Top = 69
          Width = 97
          Height = 21
          TabOrder = 4
        end
        object _cbxTipoFrete: TComboBox
          Left = 112
          Top = 112
          Width = 85
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          Text = 'FOB'
          Items.Strings = (
            'CIF'
            'FOB')
        end
        object SpinEdit1: TSpinEdit
          Left = 204
          Top = 112
          Width = 94
          Height = 22
          Ctl3D = False
          MaxValue = 1000
          MinValue = 1
          ParentCtl3D = False
          TabOrder = 6
          Value = 1
          Visible = False
        end
        object _cbxCaixaFechada: TComboBox
          Left = 9
          Top = 111
          Width = 97
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
          Text = 'Sim'
          Items.Strings = (
            'Sim'
            'N'#227'o')
        end
      end
      object GroupBox40: TGroupBox
        Left = 4
        Top = 310
        Width = 302
        Height = 114
        Caption = 'Lista Pre'#231'o Ativa  (F10 - para Cancelar a Lista)'
        TabOrder = 6
        object _dbgListaPreco: TDBGrid
          Left = 2
          Top = 15
          Width = 298
          Height = 97
          Align = alClient
          DataSource = _dsListaPreco
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgListaPrecoDrawColumnCell
          OnDblClick = _dbgListaPrecoDblClick
          OnKeyDown = _dbgListaPrecoKeyDown
        end
      end
      object GroupBox5: TGroupBox
        Left = 312
        Top = 32
        Width = 335
        Height = 134
        Caption = 'Alterar Dias Estoque'
        TabOrder = 7
        object _chkUltimoDesconto: TCheckBox
          Left = 172
          Top = 15
          Width = 115
          Height = 17
          Caption = 'Ultimo % Desc.Adic'
          TabOrder = 0
          OnClick = _chkUltimoDescontoClick
        end
        object _dbgPeDiasEstoque: TDBGrid
          Left = 2
          Top = 15
          Width = 331
          Height = 117
          Align = alClient
          DataSource = _dsPeEstoqueCd
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgPeDiasEstoqueDrawColumnCell
        end
      end
      object _btnGeraPedido: TButton
        Left = 501
        Top = 357
        Width = 136
        Height = 25
        Caption = 'Gerar Pedido Reposicao'
        Enabled = False
        TabOrder = 8
        OnClick = _btnGeraPedidoClick
      end
      object GroupBox9: TGroupBox
        Left = 664
        Top = 0
        Width = 595
        Height = 263
        Caption = 'Venda Em Unidades'
        TabOrder = 9
        object Chart2: TChart
          Left = 2
          Top = 15
          Width = 591
          Height = 246
          Legend.Alignment = laBottom
          Legend.TextStyle = ltsPlain
          Legend.Visible = False
          Title.Text.Strings = (
            'Vendas em Unidades')
          LeftAxis.TickLength = 2
          View3DOptions.Elevation = 360
          View3DOptions.HorizOffset = -14
          View3DOptions.Perspective = 60
          View3DOptions.Rotation = 360
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object Label20: TLabel
            Left = 424
            Top = -2
            Width = 101
            Height = 13
            Caption = 'Vendas CD Individual'
          end
          object _cbxEmpresa: TComboBox
            Left = 424
            Top = 11
            Width = 125
            Height = 21
            TabOrder = 0
            OnChange = _cbxEmpresaChange
          end
          object Series4: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.Length = 26
            Marks.Style = smsValue
            Marks.Visible = True
            Emboss.Color = 8553090
            MultiBar = mbNone
            Shadow.Color = 8553090
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series5: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.Length = 7
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clTeal
            Emboss.Color = 8750469
            MultiBar = mbNone
            Shadow.Color = 8750469
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object GroupBox10: TGroupBox
        Left = 666
        Top = 262
        Width = 595
        Height = 263
        Caption = 'Venda Em Valor (R$) CMV'
        TabOrder = 10
        object Chart3: TChart
          Left = 2
          Top = 15
          Width = 591
          Height = 246
          Legend.Visible = False
          Title.Text.Strings = (
            'Venda em Valores (CMV R$)')
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object BitBtn5: TBitBtn
            Left = 416
            Top = 3
            Width = 145
            Height = 25
            Caption = 'Mostra Vendas Sumarizada'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = BitBtn5Click
          end
          object Series6: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            MultiBar = mbNone
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series7: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            Emboss.Color = 8553090
            MultiBar = mbNone
            Shadow.Color = 8553090
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object GroupBox11: TGroupBox
        Left = 312
        Top = 210
        Width = 332
        Height = 112
        Caption = 'Cobertura de Estoque '
        TabOrder = 11
        object _dbgDiasEstoque: TDBGrid
          Left = 2
          Top = 15
          Width = 328
          Height = 95
          Align = alClient
          DataSource = _dsDiasEstoque
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgDiasEstoqueDrawColumnCell
        end
      end
      object _chkDiasEstoqueComPendencia: TCheckBox
        Left = 312
        Top = 189
        Width = 198
        Height = 17
        Caption = 'Cobertura Estoque Com Pendencia'
        TabOrder = 12
        OnClick = _chkDiasEstoqueComPendenciaClick
      end
      object _btnDadosFornecedor: TBitBtn
        Left = 310
        Top = 398
        Width = 129
        Height = 25
        Caption = 'Dados Fornecedor'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 13
        OnClick = _btnDadosFornecedorClick
      end
      object _chkUsarUltimoDesconto: TCheckBox
        Left = 312
        Top = 328
        Width = 120
        Height = 17
        Caption = 'Mostra Ult. Desc.'
        TabOrder = 14
        OnClick = _chkUsarUltimoDescontoClick
      end
      object _edtNrVerbaDesconto: TEdit
        Left = 438
        Top = 330
        Width = 95
        Height = 21
        TabOrder = 15
        OnExit = _edtNrVerbaDescontoExit
        OnKeyDown = _edtNrVerbaDescontoKeyDown
      end
      object _edtsomaSeguranca: TEdit
        Left = 516
        Top = 189
        Width = 121
        Height = 21
        TabOrder = 16
        Visible = False
      end
      object _btnGeraPedidoExcecao: TButton
        Left = 501
        Top = 393
        Width = 136
        Height = 25
        Caption = 'Gerar Pedido Exce'#231#227'o'
        Enabled = False
        TabOrder = 17
        OnClick = _btnGeraPedidoExcecaoClick
      end
      object _grbDadosAgenda: TGroupBox
        Left = 312
        Top = 424
        Width = 334
        Height = 106
        Caption = 'Dados da Agenda'
        TabOrder = 18
        object Label22: TLabel
          Left = 4
          Top = 30
          Width = 63
          Height = 13
          Caption = 'Data Agenda'
        end
        object Label23: TLabel
          Left = 4
          Top = 61
          Width = 73
          Height = 13
          Caption = 'Data do Pedido'
        end
        object Label24: TLabel
          Left = 4
          Top = 90
          Width = 78
          Height = 13
          Caption = 'Pr'#243'xima Agenda'
        end
        object Label25: TLabel
          Left = 2
          Top = 117
          Width = 74
          Height = 13
          Caption = 'Ult. Pedido M'#234's'
          Enabled = False
          Visible = False
        end
        object _dtpDataAgendada: TDateTimePicker
          Left = 115
          Top = 22
          Width = 80
          Height = 21
          Date = 40578.000000000000000000
          Time = 40578.000000000000000000
          Enabled = False
          TabOrder = 0
        end
        object _dtpDataPedido: TDateTimePicker
          Left = 115
          Top = 53
          Width = 80
          Height = 21
          Date = 40578.000000000000000000
          Time = 40578.000000000000000000
          Enabled = False
          TabOrder = 1
        end
        object _dtpProximaAgenda: TDateTimePicker
          Left = 115
          Top = 82
          Width = 80
          Height = 21
          Date = 40578.000000000000000000
          Time = 40578.000000000000000000
          Enabled = False
          TabOrder = 2
        end
        object _dtpDataUltimoPedidoMes: TDateTimePicker
          Left = 115
          Top = 109
          Width = 80
          Height = 21
          Date = 40578.000000000000000000
          Time = 40578.000000000000000000
          Enabled = False
          TabOrder = 3
          Visible = False
        end
        object _btnAgenDA: TBitBtn
          Left = 201
          Top = 80
          Width = 133
          Height = 25
          Caption = ' Pular Agenda'
          DoubleBuffered = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
            87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
            FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
            0E070F757770000000E070FFF707777777007700007777777777}
          ParentDoubleBuffered = False
          TabOrder = 4
          OnClick = _btnAgendaClick
        end
        object _chkTodosProduto: TCheckBox
          Left = 216
          Top = 24
          Width = 115
          Height = 17
          Caption = 'Pedido P/Todos Laboratorio'
          TabOrder = 5
          Visible = False
        end
      end
      object _chkAjustaCamadaPalete: TCheckBox
        Left = 312
        Top = 346
        Width = 105
        Height = 17
        Hint = 'Ajustar Quantidades Para camadas ou paletes'
        Caption = 'Camada e Palete'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 19
      end
      object _chkCrossDocking: TCheckBox
        Left = 312
        Top = 363
        Width = 129
        Height = 17
        Caption = 'Pedido  CrossDocking'
        Checked = True
        State = cbChecked
        TabOrder = 20
      end
      object _edtNrVerbaInicio: TEdit
        Left = 556
        Top = 330
        Width = 88
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 21
        OnExit = _edtNrVerbaInicioExit
      end
      object _chkPedidoAlimentar: TCheckBox
        Left = 312
        Top = 381
        Width = 115
        Height = 17
        Caption = 'Pedido  Alimentar'
        TabOrder = 22
      end
    end
    object _tbsSugestao: TTabSheet
      Caption = '&Informa'#231#245'es Vendas e Estoque'
      ImageIndex = 1
      object GroupBox19: TGroupBox
        Left = 98
        Top = 350
        Width = 557
        Height = 148
        Caption = 'Dados Excesso Estoque'
        TabOrder = 0
        object _dbgExcessoEstoque: TDBGrid
          Left = 2
          Top = 15
          Width = 553
          Height = 131
          Align = alClient
          Ctl3D = False
          DataSource = _dsExcessoEstoque
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgExcessoEstoqueDrawColumnCell
        end
      end
      object GroupBox16: TGroupBox
        Left = 96
        Top = 0
        Width = 563
        Height = 148
        Caption = 'Dados dos Estoque'
        TabOrder = 1
        object _dbgEstoqueEmpresa: TDBGrid
          Left = 2
          Top = 15
          Width = 559
          Height = 131
          Align = alClient
          Ctl3D = False
          DataSource = _dsEstoqueEmpresa
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgEstoqueEmpresaDrawColumnCell
        end
      end
      object GroupBox17: TGroupBox
        Left = 96
        Top = 177
        Width = 561
        Height = 150
        Caption = 'Dados dos Estoque Pendente'
        TabOrder = 2
        object _dbgEstoquePendencia: TDBGrid
          Left = 2
          Top = 15
          Width = 557
          Height = 133
          Align = alClient
          Ctl3D = False
          DataSource = _dsEstoquePendencia
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgEstoquePendenciaDrawColumnCell
        end
      end
      object GroupBox18: TGroupBox
        Left = 746
        Top = 3
        Width = 625
        Height = 148
        Caption = 'Dados das Venda no Mes'
        TabOrder = 3
        object _dbgVendaMes: TDBGrid
          Left = 2
          Top = 15
          Width = 621
          Height = 131
          Align = alClient
          Ctl3D = False
          DataSource = _dsVendaMes
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgVendaMesDrawColumnCell
        end
      end
      object GroupBox7: TGroupBox
        Left = 750
        Top = 177
        Width = 611
        Height = 148
        Caption = 'Dados Sugest'#227'o de Compra'
        TabOrder = 4
        object _dbgSugestao: TDBGrid
          Left = 2
          Top = 15
          Width = 607
          Height = 131
          Align = alClient
          Ctl3D = False
          DataSource = _dsSugestaoCompra
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgSugestaoDrawColumnCell
        end
      end
      object _btnEstoque: TBitBtn
        Left = 3
        Top = 72
        Width = 87
        Height = 25
        Caption = 'Dados Estoque'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = _btnEstoqueClick
      end
      object BitBtn2: TBitBtn
        Left = 5
        Top = 213
        Width = 87
        Height = 25
        Caption = ' Pendencia'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = BitBtn2Click
      end
      object BitBtn1: TBitBtn
        Left = 5
        Top = 397
        Width = 87
        Height = 25
        Caption = 'Excesso'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 7
        OnClick = BitBtn1Click
      end
      object BitBtn3: TBitBtn
        Left = 665
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Vda do Mes'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 8
        OnClick = BitBtn3Click
      end
      object _btnSugestao: TBitBtn
        Left = 663
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Sugestao'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 9
        OnClick = _btnSugestaoClick
      end
    end
    object _tbsCompras: TTabSheet
      Caption = '&Compras'
      ImageIndex = 2
      DesignSize = (
        1362
        535)
      object Label16: TLabel
        Left = 1188
        Top = 198
        Width = 67
        Height = 13
        Caption = 'Lista de Pre'#231'o'
        Visible = False
      end
      object GroupBox6: TGroupBox
        Left = 694
        Top = -3
        Width = 274
        Height = 240
        Caption = 'Dados de Compra do Item'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object _lbeSomaDesconto: TLabel
          Left = 110
          Top = 99
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'SomaDesconto'
        end
        object _lbePrecoLista: TLabeledEdit
          Left = 109
          Top = 13
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Color = clSkyBlue
          Ctl3D = False
          EditLabel.Width = 57
          EditLabel.Height = 13
          EditLabel.Caption = 'P'#231'o Fornec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object _lbeDescontoPadrao: TLabeledEdit
          Left = 109
          Top = 54
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Color = clSkyBlue
          Ctl3D = False
          EditLabel.Width = 80
          EditLabel.Height = 13
          EditLabel.Caption = 'Dsc Padr'#227'o (-%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 12
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object _lbeDescontoAdicional: TLabeledEdit
          Left = 109
          Top = 74
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 70
          EditLabel.Height = 13
          EditLabel.Caption = 'Dsc Adic. (-%)'
          LabelPosition = lpLeft
          LabelSpacing = 11
          ParentCtl3D = False
          TabOrder = 2
          OnExit = _lbeDescontoAdicionalExit
          OnKeyDown = _lbeDescontoAdicionalKeyDown
        end
        object _lbePrecoNota: TLabeledEdit
          Left = 111
          Top = 117
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'P'#231'o na Nota'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 3
          OnKeyDown = _lbePrecoNotaKeyDown
        end
        object _lbeValorCreditoIcms: TLabeledEdit
          Left = 111
          Top = 137
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 95
          EditLabel.Height = 13
          EditLabel.Caption = 'Cr'#233'd. ICMS/% Icms'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 4
        end
        object _lbePrecoCusto: TLabeledEdit
          AlignWithMargins = True
          Left = 111
          Top = 157
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'Pre'#231'o Custo'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 5
        end
        object _lbeValorVerba: TLabeledEdit
          AlignWithMargins = True
          Left = 111
          Top = 177
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 68
          EditLabel.Height = 13
          EditLabel.Caption = 'Valor p/ Verba'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 6
        end
        object _lbeNumeroVerba: TLabeledEdit
          AlignWithMargins = True
          Left = 111
          Top = 197
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 61
          EditLabel.Height = 13
          EditLabel.Caption = 'Nro p/ Verba'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 7
          OnKeyDown = _lbeNumeroVerbaKeyDown
        end
        object _lbePcVerba: TLabeledEdit
          AlignWithMargins = True
          Left = 111
          Top = 218
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = '% para Verba'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 8
          OnKeyDown = _lbePcVerbaKeyDown
        end
        object _lbePrecoVenda: TLabeledEdit
          Left = 109
          Top = 34
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Color = clSkyBlue
          Ctl3D = False
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'P'#231'o Fabrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object _lbepcCreditoICMS: TLabeledEdit
          Left = 188
          Top = 137
          Width = 77
          Height = 19
          Hint = '% cr'#233'dito de ICMS da nota fiscal'
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.AlignWithMargins = True
          EditLabel.Width = 4
          EditLabel.Height = 13
          EditLabel.Caption = '.'
          LabelSpacing = 0
          ParentCtl3D = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 10
        end
        object _lbeUltimoPrecoEntrada: TLabeledEdit
          Left = 187
          Top = 117
          Width = 77
          Height = 19
          Hint = 'valor da '#250'ltima entrada'
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 4
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdRightToLeftReadingOnly
          EditLabel.Caption = '.'
          EditLabel.ParentBiDiMode = False
          HideSelection = False
          LabelSpacing = 0
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnKeyDown = _lbePrecoNotaKeyDown
        end
        object _lbeUltimoCustoEntrada: TLabeledEdit
          AlignWithMargins = True
          Left = 188
          Top = 157
          Width = 77
          Height = 19
          Hint = 'valor do Ultimo  custo da nota fiscal'
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 4
          EditLabel.Height = 13
          EditLabel.Caption = '.'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
        end
        object _lbeValorVerbaUltimaEntrada: TLabeledEdit
          AlignWithMargins = True
          Left = 188
          Top = 178
          Width = 77
          Height = 19
          Hint = 'valor da verba gerada na '#250'ltima entrada'
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 4
          EditLabel.Height = 13
          EditLabel.Caption = '.'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
      end
      object _cbListaPrecoLocal: TComboBox
        Left = 1188
        Top = 217
        Width = 82
        Height = 21
        ItemIndex = 0
        TabOrder = 1
        Text = 'Atual'
        Visible = False
        Items.Strings = (
          'Atual'
          'Anterior')
      end
      object _grdPedido: TGroupBox
        Left = 0
        Top = 352
        Width = 1362
        Height = 183
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Itens do Pedido'
        TabOrder = 2
        object _dbgPrePedido: TDBGrid
          Left = 2
          Top = 15
          Width = 1358
          Height = 166
          Align = alClient
          DataSource = _dsPrePedido
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = _dbgPrePedidoCellClick
          OnDrawColumnCell = _dbgPrePedidoDrawColumnCell
          OnDblClick = _dbgPrePedidoDblClick
          OnEnter = _dbgPrePedidoEnter
          OnKeyDown = _dbgPrePedidoKeyDown
          OnKeyPress = _dbgPrePedidoKeyPress
          OnMouseWheelDown = _dbgPrePedidoMouseWheelDown
          OnMouseWheelUp = _dbgPrePedidoMouseWheelUp
          OnTitleClick = _dbgPrePedidoTitleClick
        end
      end
      object _grbTotaisPedido: TGroupBox
        Left = 691
        Top = 237
        Width = 657
        Height = 125
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Totais Pedido(s)'
        TabOrder = 3
        object _dbgPedido: TDBGrid
          Left = 2
          Top = 15
          Width = 653
          Height = 108
          Align = alClient
          DataSource = _dsTotalizaPedido
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgPedidoDrawColumnCell
        end
      end
      object _grGraficoCompra: TGroupBox
        Left = 1
        Top = -1
        Width = 686
        Height = 352
        Caption = 'Gr'#225'fico Venda Mensal'
        TabOrder = 4
        object Label1: TLabel
          Left = 3
          Top = 216
          Width = 79
          Height = 13
          Caption = 'M'#233'dia Venda Dia'
        end
        object Label2: TLabel
          Left = 3
          Top = 239
          Width = 73
          Height = 13
          Caption = 'Est. Seguran'#231'a'
        end
        object Label3: TLabel
          Left = 3
          Top = 261
          Width = 49
          Height = 13
          Caption = 'Pendencia'
        end
        object _lbEstoque: TLabel
          Left = 3
          Top = 284
          Width = 39
          Height = 13
          Caption = 'Estoque'
        end
        object Label4: TLabel
          Left = 3
          Top = 307
          Width = 65
          Height = 13
          Caption = 'Cob. Estoque'
        end
        object Label5: TLabel
          Left = 3
          Top = 329
          Width = 89
          Height = 13
          Caption = 'Cob. Estq + Pend.'
        end
        object Label6: TLabel
          Left = 190
          Top = 273
          Width = 72
          Height = 13
          Caption = 'Sugest'#227'o Ideal'
        end
        object Label7: TLabel
          Left = 168
          Top = 231
          Width = 86
          Height = 13
          Caption = 'Sugest'#227'o Possivel'
          Visible = False
        end
        object Label21: TLabel
          Left = 186
          Top = 248
          Width = 66
          Height = 13
          Caption = 'Cxa/Cam/Pal.'
        end
        object Label8: TLabel
          Left = 188
          Top = 301
          Width = 101
          Height = 13
          Caption = 'Qtdade P/Compra F1'
        end
        object Label9: TLabel
          Left = 176
          Top = 328
          Width = 98
          Height = 13
          Hint = 'Nr. dias de estoque at'#233' proximo pedido de Reposi'#231#227'o'
          Caption = 'Dias Estq. com Ped. '
          ParentShowHint = False
          ShowHint = True
        end
        object SpeedButton1: TSpeedButton
          Left = 168
          Top = 184
          Width = 103
          Height = 25
          Caption = '&Ult.Pedidos'
          OnClick = SpeedButton1Click
        end
        object Label28: TLabel
          Left = 3
          Top = 193
          Width = 75
          Height = 13
          Caption = 'Proje'#231#227'o Venda'
        end
        object Chart1: TChart
          Left = 2
          Top = 15
          Width = 682
          Height = 163
          Cursor = crHandPoint
          Legend.Alignment = laBottom
          Legend.Visible = False
          Title.Text.Strings = (
            'TChart')
          OnClickSeries = Chart1ClickSeries
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 3.520000000000002000
          DepthAxis.Minimum = -2.480000000000001000
          DepthAxis.Visible = True
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 3.520000000000002000
          DepthTopAxis.Minimum = -2.480000000000001000
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Maximum = 1096.470703124999000000
          LeftAxis.Minimum = -540.052734374999500000
          LeftAxis.TickInnerLength = 4
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          TopAxis.Title.Angle = 270
          Zoom.Allow = False
          Align = alTop
          TabOrder = 0
          ColorPaletteIndex = 11
          object _lbeCurva: TLabel
            Left = 32
            Top = 8
            Width = 54
            Height = 13
            Caption = 'Curva Item'
            OnDblClick = _lbeCurvaDblClick
          end
          object Bitbtn4: TBitBtn
            Left = 580
            Top = 8
            Width = 75
            Height = 22
            Caption = '&Hist. Ped.'
            DoubleBuffered = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337333733373
              3373337F3F7F3F7F3F7F33737373737373733F7F7F7F7F7F7F7F770000000000
              000077777777777777773303333333333333337FF333333F33333709333333C3
              333337773F3FF373F333330393993C3C33333F7F7F77F7F7FFFF77079797977C
              77777777777777777777330339339333C333337FF73373F37F33370C333C3933
              933337773F3737F37FF33303C3C33939C9333F7F7F7FF7F777FF7707C7C77797
              7C97777777777777777733033C3333333C33337F37F33333373F37033C333333
              33C3377F37333333337333033333333333333F7FFFFFFFFFFFFF770777777777
              7777777777777777777733333333333333333333333333333333}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = Bitbtn4Click
          end
          object _pnRestricao: TPanel
            Left = 121
            Top = 57
            Width = 465
            Height = 65
            Color = clRed
            ParentBackground = False
            TabOrder = 1
            object _mmAlertaRecall: TMemo
              Left = 1
              Top = 1
              Width = 463
              Height = 63
              Align = alClient
              Alignment = taCenter
              Color = clRed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              Lines.Strings = (
                '_mmAlertaRecall')
              ParentFont = False
              TabOrder = 0
              OnClick = _mmAlertaRecallClick
            end
          end
          object Series2: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            Title = 'CD'
            Emboss.Color = 8684676
            MultiBar = mbNone
            Shadow.Color = 8684676
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series3: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            SeriesColor = clYellow
            LinePen.Width = 3
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series8: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            SeriesColor = clRed
            LinePen.Width = 3
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series9: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            SeriesColor = clBlue
            LinePen.Width = 3
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series10: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            MultiBar = mbNone
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series11: TPointSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsPercent
            Marks.Visible = False
            ShowInLegend = False
            ClickableLine = False
            Pointer.Brush.Gradient.EndColor = 157214
            Pointer.Draw3D = False
            Pointer.Gradient.EndColor = 157214
            Pointer.HorizSize = 8
            Pointer.InflateMargins = True
            Pointer.Style = psDownTriangle
            Pointer.VertSize = 6
            Pointer.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object _edtMediaDiaCd: TEdit
          Left = 92
          Top = 208
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object _edtEstoqueSeguranca: TEdit
          Left = 92
          Top = 231
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object _edtPendenciaMes: TEdit
          Left = 92
          Top = 253
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnDblClick = _edtPendenciaMesDblClick
        end
        object _edtEstoque: TEdit
          Left = 92
          Top = 276
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object _edtDiasEstoqueCD: TEdit
          Left = 92
          Top = 298
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object _edtDiasEstoquePendenciaCD: TEdit
          Left = 92
          Top = 321
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object _edtSusgetaoIdeal: TEdit
          Left = 293
          Top = 265
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object _edtSusgetaolPossivel: TEdit
          Left = 557
          Top = 184
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Visible = False
        end
        object _edtQuantidadeCaixaCamada: TEdit
          Left = 303
          Top = 242
          Width = 44
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object _edtQuantidadeCaixaPalete: TEdit
          Left = 349
          Top = 242
          Width = 44
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
        end
        object _edtQuantidadeCaixa: TEdit
          Left = 258
          Top = 242
          Width = 44
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
        end
        object _edtQtdadePedido: TEdit
          Left = 292
          Top = 293
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          OnKeyDown = _edtQtdadePedidoKeyDown
        end
        object _edtDiasEstoque: TEdit
          Left = 293
          Top = 320
          Width = 100
          Height = 21
          Hint = 'Nr. dias de estoque at'#233' proximo pedido de Reposi'#231#227'o'
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnKeyDown = _edtDiasEstoqueKeyDown
        end
        object _lbeUltimaEntrada: TLabeledEdit
          Left = 489
          Top = 218
          Width = 66
          Height = 21
          EditLabel.Width = 76
          EditLabel.Height = 13
          EditLabel.Caption = 'Dt. Ult. Entrada'
          LabelPosition = lpLeft
          TabOrder = 14
        end
        object _lbeUltimaSaida: TLabeledEdit
          Left = 489
          Top = 242
          Width = 66
          Height = 21
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'Dt. Ult. Saida'
          LabelPosition = lpLeft
          LabelSpacing = 15
          TabOrder = 15
        end
        object GroupBox2: TGroupBox
          Left = 595
          Top = 270
          Width = 80
          Height = 77
          Caption = 'Indice de Falta'
          TabOrder = 16
          object _gaIndiceFaltaAtual: TGauge
            Left = 45
            Top = 17
            Width = 30
            Height = 52
            Hint = 'Indice de falta Atual'
            Kind = gkVerticalBar
            ParentShowHint = False
            Progress = 0
            ShowHint = True
          end
          object _gaIndiceFaltaAnterior: TGauge
            Left = 9
            Top = 17
            Width = 30
            Height = 53
            Hint = 'Indice de falta anterior'
            Kind = gkVerticalBar
            ParentShowHint = False
            Progress = 0
            ShowHint = True
          end
        end
        object _edtCD: TEdit
          Left = 398
          Top = 296
          Width = 24
          Height = 21
          Alignment = taCenter
          BevelKind = bkSoft
          ReadOnly = True
          TabOrder = 17
        end
        object _chkFixaDescontoAdicional: TCheckBox
          Left = 567
          Top = 206
          Width = 120
          Height = 17
          Caption = 'Fixa Desc. Adicional'
          TabOrder = 18
        end
        object _chkSemDescontoAdicional: TCheckBox
          Left = 567
          Top = 221
          Width = 120
          Height = 17
          Caption = 'Sem Desc. Adicional'
          TabOrder = 19
        end
        object _chkDigitaPrecoNota: TCheckBox
          Left = 567
          Top = 236
          Width = 120
          Height = 17
          Caption = 'Digitar Pre'#231'o &Nota'
          TabOrder = 20
        end
        object _chkMostraUltimoDescontoI: TCheckBox
          Left = 567
          Top = 251
          Width = 120
          Height = 17
          Caption = 'Mostra Ult. Desc.'
          TabOrder = 21
          Visible = False
        end
        object _lbePesquisa: TLabeledEdit
          Left = 463
          Top = 325
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = '&Pesquisa'
          TabOrder = 22
          OnChange = _lbePesquisaChange
          OnKeyDown = _lbePesquisaKeyDown
        end
        object _chkCodigoFornecedor: TCheckBox
          Left = 463
          Top = 296
          Width = 108
          Height = 17
          Caption = 'C'#243'd. Forncecedor'
          TabOrder = 23
        end
        object _chkCodigoGam: TCheckBox
          Left = 463
          Top = 281
          Width = 71
          Height = 17
          Caption = 'C'#243'd. GAM'
          TabOrder = 24
          OnClick = _chkCodigoGamClick
        end
        object _edtProjecaoVenda: TEdit
          Left = 92
          Top = 184
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
        end
        object _edtObservacaoInativacao: TEdit
          Left = 168
          Top = 210
          Width = 225
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          Visible = False
        end
        object _btInativacaoFuturaII: TBitBtn
          Left = 293
          Top = 184
          Width = 100
          Height = 25
          Caption = 'Inativa'#231#227'o Futura'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 27
          OnClick = _btInativacaoFuturaIIClick
        end
      end
      object GroupBox13: TGroupBox
        Left = 971
        Top = -2
        Width = 356
        Height = 140
        Caption = 'Venda Canal/Operador'
        TabOrder = 5
        object _dbgVendaCanal: TDBGrid
          Left = 2
          Top = 15
          Width = 352
          Height = 123
          Align = alClient
          DataSource = _dsVendaCanalOPerador
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgVendaCanalDrawColumnCell
        end
      end
      object _btnBloqueio: TBitBtn
        Left = 415
        Top = 183
        Width = 105
        Height = 25
        Caption = 'Bloquear Compra'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = _btnBloqueioClick
      end
      object _chkItensSemSugestao: TCheckBox
        Left = 973
        Top = 144
        Width = 185
        Height = 17
        Caption = 'Somente Itens sem Sugest'#227'o'
        TabOrder = 7
        OnClick = _chkItensSemSugestaoClick
      end
      object _chkItensComSugestao: TCheckBox
        Left = 973
        Top = 182
        Width = 185
        Height = 17
        Caption = 'Somente Itens Com Sugest'#227'o'
        TabOrder = 8
        OnClick = _chkItensComSugestaoClick
      end
      object _chkItensSemSugestaoSemEstoque: TCheckBox
        Left = 973
        Top = 163
        Width = 326
        Height = 17
        Caption = 'Somente Itens sem Sugest'#227'o C/Estoque Zerado sem Pendencia'
        TabOrder = 9
        OnClick = _chkItensSemSugestaoSemEstoqueClick
      end
      object _chkItensCurvaA_B: TCheckBox
        Left = 973
        Top = 202
        Width = 185
        Height = 17
        Caption = 'Somente Itens  Curva A B'
        TabOrder = 10
        OnClick = _chkItensCurvaA_BClick
      end
      object _chkPcParaVerbaGrid: TCheckBox
        Left = 788
        Top = 235
        Width = 81
        Height = 17
        Caption = '% p/ Verba'
        TabOrder = 11
      end
    end
    object _tbsConfirma: TTabSheet
      Caption = '&Confirma/Fecha Pedido'
      ImageIndex = 3
      object Label18: TLabel
        Left = 1079
        Top = 312
        Width = 57
        Height = 13
        Caption = 'Pedido Para'
      end
      object Label19: TLabel
        Left = 960
        Top = 266
        Width = 90
        Height = 13
        Caption = 'Operador Logistico'
        Visible = False
      end
      object _btnFechaCancela: TBitBtn
        Left = 104
        Top = 480
        Width = 113
        Height = 25
        Caption = '&Fechar/Cancelar'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = _btnFechaCancelaClick
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 0
        Width = 745
        Height = 441
        Caption = 'Pedido CD SC'
        TabOrder = 1
        object _dbgPedidoPronto: TDBGrid
          Left = 2
          Top = 15
          Width = 741
          Height = 424
          Align = alClient
          DataSource = _dsPedido
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgPedidoProntoDrawColumnCell
          OnTitleClick = _dbgPedidoProntoTitleClick
        end
      end
      object _grbParcelaPrazo: TGroupBox
        Left = 777
        Top = 120
        Width = 177
        Height = 189
        Caption = 'Prazo Pedido'
        TabOrder = 2
        object _dbgPrazoSC: TDBGrid
          Left = 2
          Top = 15
          Width = 173
          Height = 172
          Align = alClient
          Ctl3D = False
          DataSource = _dsCondicaoPagamento
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = _dbgPrazoSCDblClick
          OnKeyDown = _dbgPrazoSCKeyDown
        end
      end
      object _chkObservacaoPedido: TCheckBox
        Left = 960
        Top = 196
        Width = 164
        Height = 17
        Caption = 'Observa'#231#227'o  Pedido'
        TabOrder = 3
        OnClick = _chkObservacaoPedidoClick
      end
      object _edtObservacaoPedido: TEdit
        Left = 960
        Top = 216
        Width = 240
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object _chkImprimir: TCheckBox
        Left = 780
        Top = 313
        Width = 164
        Height = 17
        Caption = 'Imprimir Pedido '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object _chkGeraExcel: TCheckBox
        Left = 780
        Top = 330
        Width = 164
        Height = 17
        Caption = 'Gera Excel Pedido '
        Checked = True
        Ctl3D = False
        ParentCtl3D = False
        State = cbChecked
        TabOrder = 6
      end
      object _chkRelatorioPrecoCusto: TCheckBox
        Left = 780
        Top = 353
        Width = 145
        Height = 17
        Caption = 'Relatorio C/Preco Custo'
        TabOrder = 7
      end
      object _chkMostraDesconto: TCheckBox
        Left = 780
        Top = 376
        Width = 164
        Height = 17
        Caption = 'Mostra Coluna % Desc.'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object _btnConfirma: TBitBtn
        Left = 1079
        Top = 357
        Width = 113
        Height = 29
        Caption = '&Confirma Pedido'
        DoubleBuffered = True
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 9
        OnClick = _btnConfirmaClick
      end
      object _edtNrVerba: TEdit
        Left = 960
        Top = 168
        Width = 100
        Height = 19
        Alignment = taRightJustify
        Ctl3D = False
        NumbersOnly = True
        ParentCtl3D = False
        TabOrder = 10
      end
      object _chkBonificaPedido: TCheckBox
        Left = 960
        Top = 145
        Width = 164
        Height = 17
        Caption = 'Bonificar Pedido '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 11
        OnClick = _chkBonificaPedidoClick
      end
      object _dtpPedido: TDateTimePicker
        Left = 1079
        Top = 330
        Width = 80
        Height = 21
        Date = 40578.465110127320000000
        Time = 40578.465110127320000000
        TabOrder = 12
      end
      object _cbOPeradorLogistico: TComboBox
        Left = 960
        Top = 282
        Width = 145
        Height = 21
        TabOrder = 13
      end
      object GroupBox3: TGroupBox
        Left = 770
        Top = 2
        Width = 302
        Height = 118
        Caption = 'Filtros Pedido'
        TabOrder = 14
        object _dbgFiltroPedido: TDBGrid
          Left = 2
          Top = 15
          Width = 298
          Height = 101
          Align = alClient
          DataSource = _dsEmpresaPedido
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgFiltroPedidoDrawColumnCell
          OnDblClick = _dbgFiltroPedidoDblClick
          OnTitleClick = _dbgFiltroPedidoTitleClick
        end
      end
    end
  end
  object _stbCompras: TStatusBar
    Left = 0
    Top = 563
    Width = 1370
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 450
      end
      item
        Width = 150
      end>
  end
  object _dsVendaFornecedor: TDataSource
    Left = 945
    Top = 56
  end
  object _dsProduto: TDataSource
    DataSet = _cdsProduto
    OnDataChange = _dsProdutoDataChange
    Left = 899
    Top = 296
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 859
    Top = 51
  end
  object _cdsTabelaLeadTime: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 377
    Top = 88
  end
  object _cdsDataUltimaCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 939
    Top = 216
  end
  object _cdsItensCurva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 473
    Top = 248
  end
  object _cdsIndicedeFalta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 939
    Top = 224
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 843
    Top = 317
  end
  object _cdsEspecealidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 843
    Top = 384
  end
  object _cdsEmbalagemMercadoria: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 985
    Top = 40
  end
  object _dsPrePedido: TDataSource
    DataSet = _cdsPrePedido
    Left = 819
    Top = 448
  end
  object _cdsPrePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    AfterScroll = _cdsPrePedidoAfterScroll
    BeforeApplyUpdates = _cdsPrePedidoBeforeApplyUpdates
    Left = 859
    Top = 488
  end
  object _dsItensCurva: TDataSource
    DataSet = _cdsItensCurva
    Left = 496
    Top = 232
  end
  object _cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 216
    Top = 112
  end
  object _dsEmpresa: TDataSource
    DataSet = _cdsEmpresa
    Left = 152
    Top = 80
  end
  object _dsTabelaLeadTime: TDataSource
    DataSet = _cdsTabelaLeadTime
    Left = 352
    Top = 56
  end
  object _cdsListaPrecoAtiva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 226
    Top = 344
  end
  object _dsListaPreco: TDataSource
    DataSet = _cdsListaPrecoAtiva
    Left = 170
    Top = 356
  end
  object _cdsItemListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 136
  end
  object _cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 859
    Top = 288
  end
  object _cdsTotalizaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 977
    Top = 496
  end
  object _dsTotalizaPedido: TDataSource
    DataSet = _cdsTotalizaPedido
    Left = 977
    Top = 464
  end
  object _cdsVendaFornecedorII: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 883
    Top = 32
  end
  object _cdsPeEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 288
  end
  object _dsPeEstoqueCd: TDataSource
    DataSet = _cdsPeEstoque
    Left = 64
    Top = 408
  end
  object _cdsCondicaoPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1133
    Top = 64
    object _cdsCondicaoPagamentoNR_PARCELA: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parcela'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object _cdsCondicaoPagamentoNR_DIAS: TIntegerField
      DisplayLabel = 'Prazo  Dias'
      DisplayWidth = 5
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento: TDataSource
    DataSet = _cdsCondicaoPagamento
    Left = 1133
    Top = 24
  end
  object _cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 704
    Top = 496
  end
  object _dsPedido: TDataSource
    DataSet = _cdsPedido
    Left = 704
    Top = 480
  end
  object _cdsEmpresaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 472
    Top = 168
  end
  object _dsEmpresaPedido: TDataSource
    DataSet = _cdsEmpresaPedido
    Left = 512
    Top = 168
  end
  object _cdsEstoqueEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 80
    Top = 37
  end
  object _dsEstoqueEmpresa: TDataSource
    DataSet = _cdsEstoqueEmpresa
    Left = 24
    Top = 85
  end
  object _cdsEstoquePendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 160
    Top = 245
  end
  object _dsEstoquePendencia: TDataSource
    DataSet = _cdsEstoquePendencia
    Left = 224
    Top = 240
  end
  object _cdsVendaMes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 632
    Top = 45
  end
  object _dsVendaMes: TDataSource
    DataSet = _cdsVendaMes
    Left = 648
    Top = 197
  end
  object _cdsSugestaoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 728
    Top = 408
  end
  object _dsSugestaoCompra: TDataSource
    DataSet = _cdsSugestaoCompra
    Left = 664
    Top = 384
  end
  object _cdsExcessoEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 48
    Top = 368
  end
  object _dsExcessoEstoque: TDataSource
    DataSet = _cdsExcessoEstoque
    Left = 112
    Top = 360
  end
  object _cdsVendaSumarizada: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1237
    Top = 40
  end
  object _cdsDiasEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 389
  end
  object _dsDiasEstoque: TDataSource
    DataSet = _cdsDiasEstoque
    Left = 464
    Top = 405
  end
  object _cdsEstoqueDiario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 280
  end
  object _cdsUltimasCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 328
  end
  object _cdsPedidoNoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 456
  end
  object _cdsPendenciaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1093
    Top = 152
  end
  object Timer1: TTimer
    Left = 280
    Top = 424
  end
  object _cdsVendaCanalOPerador: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1197
    Top = 136
  end
  object _dsVendaCanalOPerador: TDataSource
    DataSet = _cdsVendaCanalOPerador
    Left = 1197
    Top = 104
  end
  object _cdsParamentoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 512
    Top = 24
  end
  object _cdsProdutoOL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 416
    Top = 24
  end
  object _cdsVendaFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 104
  end
  object _cdsForcaPedidolocal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 64
    Top = 456
  end
  object _cdsInativaBloqueio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 504
  end
  object _cdsPrecoItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 456
  end
  object _cdsUltimoPrecoEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 1304
    Top = 264
  end
end
