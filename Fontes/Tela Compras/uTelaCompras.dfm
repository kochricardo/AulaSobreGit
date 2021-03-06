object _frmCompras: T_frmCompras
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 590
  ClientWidth = 1228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  PrintScale = poNone
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _stbCompras: TStatusBar
    Left = 0
    Top = 571
    Width = 1228
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 450
      end
      item
        Width = 150
      end>
  end
  object _pgcCompras: TPageControl
    Left = 0
    Top = 0
    Width = 1228
    Height = 571
    ActivePage = _tbsSugestao
    Align = alClient
    DockSite = True
    TabOrder = 1
    OnChange = _pgcComprasChange
    object _tbsParametros: TTabSheet
      Caption = 'Parame&tros'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label15: TLabel
        Left = 3
        Top = 37
        Width = 67
        Height = 13
        Caption = 'Lista de Pre'#231'o'
      end
      object Label18: TLabel
        Left = 3
        Top = 84
        Width = 96
        Height = 13
        Caption = 'Repor Estoque para'
      end
      object _lbeNrLaboratorio: TLabeledEdit
        Left = 3
        Top = 162
        Width = 82
        Height = 19
        Ctl3D = False
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'Nr. Laboratorio'
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        OnKeyDown = _lbeNrLaboratorioKeyDown
      end
      object _lbeNrPedido: TLabeledEdit
        Left = 3
        Top = 15
        Width = 82
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
      object _lbeNumeroProduto: TLabeledEdit
        Left = 10
        Top = 457
        Width = 82
        Height = 21
        Alignment = taRightJustify
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Nr. de Produtos'
        ReadOnly = True
        TabOrder = 4
      end
      object _cbxListaPreco: TComboBox
        Left = 3
        Top = 54
        Width = 98
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Text = 'Atual'
        OnChange = _cbxListaPrecoChange
        OnKeyDown = _cbxListaPrecoKeyDown
        Items.Strings = (
          'Atual'
          'Anterior'
          'Nova')
      end
      object _cbxOpcaoCDs: TComboBox
        Left = 3
        Top = 103
        Width = 98
        Height = 21
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 2
        Text = 'CD SC e CD RS'
        OnChange = _cbxOpcaoCDsChange
        OnEnter = _cbxOpcaoCDsEnter
        OnKeyDown = _cbxOpcaoCDsKeyDown
        Items.Strings = (
          'CD SC e CD RS'
          'CD Tubar'#227'o'
          'CS Sta Cruz do Sul')
      end
      object GroupBox20: TGroupBox
        Left = 116
        Top = 3
        Width = 918
        Height = 285
        Caption = 'Venda Fornecedor  Total (Vlr. CMV)'
        TabOrder = 5
        object _tchVendaAnualGeral: TChart
          Left = 2
          Top = 15
          Width = 914
          Height = 268
          Legend.Visible = False
          Title.Text.Strings = (
            '')
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 0.300000000000234400
          DepthTopAxis.Minimum = -1.699999999999751000
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMinimum = False
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object Series6: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            ValueFormat = '#,##0.00'
            Emboss.Color = 8487297
            MultiBar = mbNone
            Shadow.Color = 8487297
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
            Emboss.Color = 8816262
            MultiBar = mbNone
            Shadow.Color = 8816262
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object GroupBox21: TGroupBox
        Left = 123
        Top = 288
        Width = 456
        Height = 265
        Caption = 'Venda Fornecedor  CD SC (Vlr. CMV)'
        TabOrder = 6
        object _tchVendaAnualCDSC: TChart
          Left = 2
          Top = 15
          Width = 452
          Height = 248
          Legend.Visible = False
          Title.Text.Strings = (
            '')
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 2.700000000000001000
          DepthAxis.Minimum = 0.700000000000000100
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 2.700000000000001000
          DepthTopAxis.Minimum = 0.700000000000000100
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Maximum = 1064.575000000002000000
          LeftAxis.Minimum = -32.924999999999300000
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object Series11: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Emboss.Color = 8487297
            Marks.Shadow.Color = 8487297
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
          object Series12: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            Emboss.Color = 8618883
            MultiBar = mbNone
            Shadow.Color = 8618883
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object GroupBox22: TGroupBox
        Left = 582
        Top = 288
        Width = 454
        Height = 265
        Caption = 'Venda Fornecedor CD RS (Vlr. CMV)'
        TabOrder = 7
        object _tchVendaAnualCDRS: TChart
          Left = 2
          Top = 15
          Width = 450
          Height = 248
          Legend.Visible = False
          Title.Text.Strings = (
            '')
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 2.760000000000001000
          DepthAxis.Minimum = 0.760000000000000500
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 2.760000000000001000
          DepthTopAxis.Minimum = 0.760000000000000500
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Maximum = 557.500000000000000000
          LeftAxis.Minimum = -0.000000000000049738
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object Series13: TBarSeries
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
          object Series14: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            Emboss.Color = 8487297
            MultiBar = mbNone
            Shadow.Color = 8487297
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object _chkAbreIndiceFalta: TCheckBox
        Left = 4
        Top = 184
        Width = 91
        Height = 17
        Caption = 'Indice de Falta'
        TabOrder = 8
        OnClick = _chkAbreIndiceFaltaClick
      end
      object _chkUltimoDescontoInicio: TCheckBox
        Left = 3
        Top = 127
        Width = 115
        Height = 17
        Caption = 'Ultimo % Desc.Adic'
        TabOrder = 9
        OnClick = _chkUltimoDescontoInicioClick
      end
    end
    object _tbsSugestao: TTabSheet
      Caption = '&Sugest'#227'o'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 115
        Top = 16
        Width = 78
        Height = 13
        Caption = 'Dia(s) de Pedido'
      end
      object _lbeDiaPedido: TLabel
        Left = 115
        Top = 35
        Width = 62
        Height = 13
        Caption = 'descri'#231#227'o dia'
      end
      object Label3: TLabel
        Left = 3
        Top = 88
        Width = 49
        Height = 13
        Caption = 'Tipo Frete'
      end
      object Label4: TLabel
        Left = 3
        Top = 139
        Width = 108
        Height = 13
        Caption = 'Somente Cxa Fechada'
      end
      object Label5: TLabel
        Left = 3
        Top = 185
        Width = 96
        Height = 13
        Caption = 'Compra de Multiplos'
      end
      object Label31: TLabel
        Left = 345
        Top = 232
        Width = 78
        Height = 13
        Caption = 'Dias Estoque SC'
      end
      object Label32: TLabel
        Left = 344
        Top = 282
        Width = 78
        Height = 13
        Caption = 'Dias Estoque RS'
      end
      object _lbNrVerbaInicio: TLabel
        Left = 479
        Top = 271
        Width = 46
        Height = 13
        Caption = 'Nr. Verba'
        Visible = False
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 402
        Width = 334
        Height = 148
        Caption = 'Dados da Agenda'
        TabOrder = 0
        object Label10: TLabel
          Left = 4
          Top = 30
          Width = 63
          Height = 13
          Caption = 'Data Agenda'
        end
        object Label11: TLabel
          Left = 4
          Top = 61
          Width = 73
          Height = 13
          Caption = 'Data do Pedido'
        end
        object Label12: TLabel
          Left = 4
          Top = 90
          Width = 78
          Height = 13
          Caption = 'Pr'#243'xima Agenda'
        end
        object Label13: TLabel
          Left = 2
          Top = 119
          Width = 74
          Height = 13
          Caption = 'Ult. Pedido M'#234's'
        end
        object _dtpDataAgendada: TDateTimePicker
          Left = 115
          Top = 22
          Width = 80
          Height = 21
          Date = 40578.465110127320000000
          Time = 40578.465110127320000000
          TabOrder = 0
        end
        object _dtpDataPedido: TDateTimePicker
          Left = 115
          Top = 53
          Width = 80
          Height = 21
          Date = 40578.465110127320000000
          Time = 40578.465110127320000000
          TabOrder = 1
        end
        object _dtpProximaAgenda: TDateTimePicker
          Left = 115
          Top = 82
          Width = 80
          Height = 21
          Date = 40578.465110127320000000
          Time = 40578.465110127320000000
          TabOrder = 2
        end
        object _dtpDataUltimoPedidoMes: TDateTimePicker
          Left = 115
          Top = 109
          Width = 80
          Height = 21
          Date = 40578.465110127320000000
          Time = 40578.465110127320000000
          TabOrder = 3
        end
        object BitBtn6: TBitBtn
          Left = 201
          Top = 80
          Width = 133
          Height = 25
          Caption = ' Gravar Data Agenda'
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
          OnClick = BitBtn6Click
        end
      end
      object GroupBox19: TGroupBox
        Left = 652
        Top = 437
        Width = 548
        Height = 107
        Caption = 'Dados Excesso Estoque'
        TabOrder = 1
        object _dbgExcessoEstoque: TDBGrid
          Left = 2
          Top = 15
          Width = 544
          Height = 90
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
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LOCAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_UNIDADES_EXCESSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_EXCESSO_CUSTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_EXCESSO_VENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_EXCESSSO_MTS_CUBICO'
              Visible = True
            end>
        end
      end
      object _lbeGrupoPedido: TLabeledEdit
        Left = 3
        Top = 14
        Width = 71
        Height = 19
        Ctl3D = False
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Grupo'
        ParentCtl3D = False
        TabOrder = 2
      end
      object _lbeLeadTime: TLabeledEdit
        Left = 3
        Top = 57
        Width = 71
        Height = 19
        Ctl3D = False
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = 'Lead Time'
        ParentCtl3D = False
        TabOrder = 3
      end
      object _cbxTipoFrete: TComboBox
        Left = 3
        Top = 103
        Width = 71
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
        TabOrder = 4
        Text = 'CIF'
        Items.Strings = (
          'CIF'
          'FOB')
      end
      object _cbxCaixaFechada: TComboBox
        Left = 3
        Top = 158
        Width = 108
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
        Text = 'N'#227'o'
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
      object SpinEdit1: TSpinEdit
        Left = 4
        Top = 201
        Width = 108
        Height = 19
        Ctl3D = False
        MaxValue = 1000
        MinValue = 1
        ParentCtl3D = False
        TabOrder = 6
        Value = 1
      end
      object GroupBox24: TGroupBox
        Left = 4
        Top = 223
        Width = 334
        Height = 174
        Caption = 'Numero de Itens por Curva'
        TabOrder = 7
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 330
          Height = 157
          Align = alClient
          DataSource = _dsItensCurva
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object GroupBox28: TGroupBox
        Left = 224
        Top = 3
        Width = 114
        Height = 98
        Caption = 'Prazo Fornecedor'
        TabOrder = 8
        object DBGrid2: TDBGrid
          Left = 2
          Top = 15
          Width = 110
          Height = 81
          Align = alClient
          Ctl3D = False
          DataSource = _dsParcelaPrazoCDSC
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_PARCELA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_DIAS'
              Visible = True
            end>
        end
      end
      object GroupBox29: TGroupBox
        Left = 120
        Top = 110
        Width = 313
        Height = 112
        Caption = 'Dias Estoque '
        TabOrder = 9
        object _dbgDiasEstoque: TDBGrid
          Left = 2
          Top = 15
          Width = 309
          Height = 95
          Align = alClient
          DataSource = _dsDiasEstoque
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
        Left = 241
        Top = 103
        Width = 168
        Height = 17
        Caption = 'Dias Estoque Com Pendencia'
        TabOrder = 10
        OnClick = _chkDiasEstoqueComPendenciaClick
      end
      object _edtNrdiasCompraSC: TEdit
        Left = 344
        Top = 248
        Width = 88
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 11
      end
      object _edtNrdiasCompraRS: TEdit
        Left = 344
        Top = 301
        Width = 88
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 12
      end
      object _btnRecalculaSugestao: TBitBtn
        Left = 480
        Top = 313
        Width = 108
        Height = 25
        Caption = 'Recal. Sug. Compra'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 13
        OnClick = _btnRecalculaSugestaoClick
      end
      object _chkUltimoDesconto: TCheckBox
        Left = 480
        Top = 250
        Width = 115
        Height = 17
        Caption = 'Ultimo % Desc.Adic'
        TabOrder = 14
        OnClick = _chkUltimoDescontoClick
      end
      object _chkAjustaCamadaPalete: TCheckBox
        Left = 480
        Top = 227
        Width = 105
        Height = 17
        Hint = 'Ajustar Quantidades Para camadas ou paletes'
        Caption = 'Camada e Palete'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
      object _edtNrVerbaInicio: TEdit
        Left = 479
        Top = 286
        Width = 88
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 16
        Visible = False
      end
      object CheckBox2: TCheckBox
        Left = 1082
        Top = 320
        Width = 97
        Height = 17
        Caption = 'CheckBox2'
        TabOrder = 17
      end
      object GroupBox3: TGroupBox
        Left = 650
        Top = 333
        Width = 548
        Height = 107
        Caption = 'Dados Sugest'#227'o de Compra'
        TabOrder = 18
        object _dbgSugestao: TDBGrid
          Left = 2
          Top = 15
          Width = 544
          Height = 90
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
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LOCAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_UNIDADES_SUGERIDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_SUGERIDO_CUSTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_SUGERIDO_VENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_SUGERIDO_MTS_CUB'
              Visible = True
            end>
        end
      end
      object GroupBox18: TGroupBox
        Left = 650
        Top = 225
        Width = 548
        Height = 109
        Caption = 'Dados das Venda no Mes'
        TabOrder = 19
        object _dbgVendaMes: TDBGrid
          Left = 2
          Top = 15
          Width = 544
          Height = 92
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
      object GroupBox17: TGroupBox
        Left = 650
        Top = 110
        Width = 548
        Height = 111
        Caption = 'Dados dos Estoque Pendente'
        TabOrder = 20
        object _dbgEstoquePendencia: TDBGrid
          Left = 3
          Top = 14
          Width = 544
          Height = 94
          Align = alCustom
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
      object GroupBox16: TGroupBox
        Left = 652
        Top = -2
        Width = 548
        Height = 111
        Caption = 'Dados dos Estoque'
        TabOrder = 21
        object _dbgEstoqueEmpresa: TDBGrid
          Left = 2
          Top = 15
          Width = 544
          Height = 94
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
      object GroupBox40: TGroupBox
        Left = 342
        Top = 344
        Width = 304
        Height = 105
        Caption = 'Lista Pre'#231'o Ativa'
        TabOrder = 22
      end
    end
    object _tbsCompras: TTabSheet
      Caption = '&Compras'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label16: TLabel
        Left = 689
        Top = 274
        Width = 67
        Height = 13
        Caption = 'Lista de Pre'#231'o'
      end
      object Gauge5: TGauge
        Left = 197
        Top = 75
        Width = 30
        Height = 51
        Hint = 'Indice de falta Atual'
        Kind = gkVerticalBar
        ParentShowHint = False
        Progress = 0
        ShowHint = True
      end
      object Gauge6: TGauge
        Left = 6
        Top = 75
        Width = 30
        Height = 62
        Hint = 'Indice de falta Atual'
        Kind = gkVerticalBar
        ParentShowHint = False
        Progress = 0
        ShowHint = True
      end
      object Label23: TLabel
        Left = 687
        Top = 353
        Width = 66
        Height = 13
        Caption = 'Filtro Item CD'
      end
      object _grbGraficoGrade: TGroupBox
        Left = 4
        Top = 3
        Width = 683
        Height = 178
        Caption = 'GAM CD  SC'
        TabOrder = 0
        object _tchVendasMensal: TChart
          Left = 2
          Top = 15
          Width = 679
          Height = 161
          Cursor = crHandPoint
          Legend.Visible = False
          Title.Text.Strings = (
            '')
          OnClickSeries = _tchVendasMensalClickSeries
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 4.460000000000020000
          DepthAxis.Minimum = 0.460000000000027900
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 4.460000000000020000
          DepthTopAxis.Minimum = 0.460000000000027900
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Maximum = 707.822999999999200000
          LeftAxis.Minimum = 136.998000000000400000
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object _lbCurvaSCgrade: TLabel
            Left = 9
            Top = 5
            Width = 54
            Height = 13
            Caption = 'Curva Prod'
            OnClick = _lbCurvaSCgradeClick
          end
          object Bitbtn4: TBitBtn
            Left = 599
            Top = 0
            Width = 75
            Height = 25
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
          object _chkUltimosPrecosCompra: TCheckBox
            Left = 509
            Top = 0
            Width = 89
            Height = 17
            Caption = 'Ultimos Precos'
            TabOrder = 1
          end
          object _pnRestricao: TPanel
            Left = 145
            Top = 56
            Width = 465
            Height = 65
            Color = clRed
            ParentBackground = False
            TabOrder = 2
            OnClick = _pnRestricaoClick
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
          object Series9: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            Emboss.Color = 8750469
            Shadow.Color = 8750469
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series15: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            LinePen.Width = 2
            Pointer.Brush.Gradient.EndColor = 3513587
            Pointer.Gradient.EndColor = 3513587
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series16: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series17: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            ShowInLegend = False
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series18: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = True
            Emboss.Color = 8618883
            Shadow.Color = 8618883
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 693
        Top = 1
        Width = 170
        Height = 264
        Caption = 'Dados de Compra do Item'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object _lbeSomaDesconto: TLabel
          Left = 72
          Top = 85
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = '_lbeSomaDesconto'
        end
        object _lbePrecoListaGrid: TLabeledEdit
          Left = 97
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
        object _lbePercentualRepasseGrid: TLabeledEdit
          Left = 35
          Top = 27
          Width = 12
          Height = 19
          Alignment = taRightJustify
          Color = clSkyBlue
          Ctl3D = False
          EditLabel.AlignWithMargins = True
          EditLabel.Width = 70
          EditLabel.Height = 13
          EditLabel.Caption = ' Repasse (-%)'
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
        object _lbeDescontoPadraoGrid: TLabeledEdit
          Left = 95
          Top = 38
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
          TabOrder = 2
        end
        object _lbeDescontoAdicionalGrid: TLabeledEdit
          Left = 96
          Top = 60
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
          TabOrder = 3
          OnEnter = _lbeDescontoAdicionalGridEnter
          OnKeyDown = _lbeDescontoAdicionalGridKeyDown
          OnKeyPress = _lbeDescontoAdicionalGridKeyPress
        end
        object _lbePrecoNotaGrid: TLabeledEdit
          Left = 95
          Top = 103
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
          TabOrder = 4
          OnKeyDown = _lbePrecoNotaKeyDown
          OnKeyPress = _lbePrecoNotaKeyPress
        end
        object _lbeValorCreditoIcmsGrid: TLabeledEdit
          Left = 94
          Top = 127
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 63
          EditLabel.Height = 13
          EditLabel.Caption = 'Cr'#233'dito ICMS'
          LabelPosition = lpLeft
          LabelSpacing = 13
          ParentCtl3D = False
          TabOrder = 5
        end
        object _lbePrecoCustoGrid: TLabeledEdit
          AlignWithMargins = True
          Left = 94
          Top = 150
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
          TabOrder = 6
        end
        object _lbeValorVerbaGrid: TLabeledEdit
          AlignWithMargins = True
          Left = 94
          Top = 173
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
          TabOrder = 7
        end
        object _lbeNumeroVerbaGrid: TLabeledEdit
          AlignWithMargins = True
          Left = 94
          Top = 196
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
          TabOrder = 8
          OnExit = _lbeNumeroVerbaGridExit
          OnKeyDown = _lbeNumeroVerbaKeyDown
        end
        object _lbePcVerbaGrid: TLabeledEdit
          AlignWithMargins = True
          Left = 94
          Top = 219
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
          TabOrder = 9
          OnKeyDown = _lbePcVerbaKeyDown
        end
        object _chkPcParaVerbaGrid: TCheckBox
          Left = 14
          Top = 244
          Width = 81
          Height = 17
          Caption = '% p/ Verba'
          TabOrder = 10
        end
      end
      object GroupBox8: TGroupBox
        Left = -2
        Top = 179
        Width = 680
        Height = 196
        Caption = 'C'#225'lculo'
        Color = clBtnFace
        Ctl3D = False
        ParentBackground = False
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 2
        object Label21: TLabel
          Left = 247
          Top = 11
          Width = 66
          Height = 13
          Caption = 'Cxa/Cam/Pal.'
        end
        object SpeedButton1: TSpeedButton
          Left = 545
          Top = 62
          Width = 66
          Height = 25
          Caption = '&Ult.Pedidos'
          OnClick = SpeedButton1Click
        end
        object _lbeMediaGrid: TLabeledEdit
          Left = 84
          Top = 150
          Width = 132
          Height = 19
          Ctl3D = False
          EditLabel.Width = 80
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdRightToLeft
          EditLabel.Caption = 'Calculo da M'#233'dia'
          EditLabel.ParentBiDiMode = False
          LabelPosition = lpLeft
          LabelSpacing = 5
          ParentCtl3D = False
          TabOrder = 0
        end
        object _lbeMediaMensalGrid: TLabeledEdit
          Left = 146
          Top = 10
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'dia Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 27
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object _lbeVendaMensalGrid: TLabeledEdit
          AlignWithMargins = True
          Left = 146
          Top = 32
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Venda M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 39
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object _lbePendenciaGrid: TLabeledEdit
          Left = 146
          Top = 55
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Pend'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 42
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnDblClick = _lbePendenciaGridDblClick
        end
        object _lbeEstoqueGrid: TLabeledEdit
          Left = 146
          Top = 79
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Estoque Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 12
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnChange = _lbeEstoqueGridChange
        end
        object _lbeCoberturaGrid: TLabeledEdit
          Left = 146
          Top = 103
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Cobertura Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object _lbeCoberturaEstoquePend_Grid: TLabeledEdit
          Left = 146
          Top = 128
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Cob. Estoq +Pend.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object _lbeSugestaoIdealGrid: TLabeledEdit
          Left = 360
          Top = 55
          Width = 89
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = 'Sugest'#227'o Ideal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 34
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object _lbeSugestaoPossivelGrid: TLabeledEdit
          Left = 360
          Top = 78
          Width = 89
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 86
          EditLabel.Height = 13
          EditLabel.Caption = 'Sugest'#227'o Possivel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 19
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object _lbeDiasEstoque: TLabeledEdit
          Left = 361
          Top = 128
          Width = 89
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 62
          EditLabel.Height = 13
          EditLabel.Caption = 'Dias Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 42
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
          OnKeyDown = _lbeDiasEstoqueKeyDown
        end
        object _edtQuantidadeCaixa: TEdit
          Left = 314
          Top = 9
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
        object _edtQuantidadeCaixaCamadaGrid: TEdit
          Left = 359
          Top = 9
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
          OnDblClick = _edtQuantidadeCaixaCamadaGridDblClick
        end
        object _edtQuantidadeCaixaPaleteGrid: TEdit
          Left = 405
          Top = 9
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
          TabOrder = 12
        end
        object _lbeQuantidadePedidoGrid: TLabeledEdit
          Left = 360
          Top = 103
          Width = 89
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 104
          EditLabel.Height = 13
          EditLabel.Caption = 'Qtdade p/ Compra F1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 1
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 13
          OnEnter = _lbeQuantidadePedidoGridEnter
          OnKeyDown = _lbeQuantidadePedidoGridKeyDown
          OnKeyPress = _lbeQuantidadePedidoGridKeyPress
        end
        object _lbeUltimaEntradaGrid: TLabeledEdit
          Left = 546
          Top = 17
          Width = 66
          Height = 19
          EditLabel.Width = 76
          EditLabel.Height = 13
          EditLabel.Caption = 'Dt. Ult. Entrada'
          LabelPosition = lpLeft
          TabOrder = 14
        end
        object _lbeUltimaSaidaGrid: TLabeledEdit
          Left = 546
          Top = 41
          Width = 66
          Height = 19
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'Dt. Ult. Saida'
          LabelPosition = lpLeft
          LabelSpacing = 15
          TabOrder = 15
        end
        object _chkOcultaCurvaE: TCheckBox
          Left = 242
          Top = 151
          Width = 113
          Height = 17
          Caption = 'Ocultar Curva "E"'
          TabOrder = 16
          OnClick = _chkOcultaCurvaEClick
        end
        object _chkOrdenaCurva: TCheckBox
          Left = 361
          Top = 151
          Width = 113
          Height = 17
          Caption = 'Ordenar Por Curva'
          TabOrder = 17
          OnClick = _chkOrdenaCurvaClick
        end
        object _chkCodigoGam: TCheckBox
          Left = 480
          Top = 81
          Width = 71
          Height = 17
          Caption = 'C'#243'd. GAM'
          TabOrder = 18
        end
        object _chkCodigoFornecedor: TCheckBox
          Left = 480
          Top = 104
          Width = 108
          Height = 17
          Caption = 'C'#243'd. Forncecedor'
          TabOrder = 19
        end
        object _lbePesquisa: TLabeledEdit
          Left = 480
          Top = 137
          Width = 109
          Height = 19
          CharCase = ecUpperCase
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = '&Pesquisa'
          TabOrder = 20
          OnChange = _lbePesquisaChange
          OnKeyDown = _lbePesquisaKeyDown
        end
        object _edtCD: TEdit
          Left = 455
          Top = 103
          Width = 24
          Height = 19
          Alignment = taCenter
          BevelKind = bkSoft
          ReadOnly = True
          TabOrder = 21
        end
        object GroupBox2: TGroupBox
          Left = 598
          Top = 85
          Width = 80
          Height = 87
          Caption = 'Indice de Falta'
          TabOrder = 22
          object _gaIndiceFaltaAtual: TGauge
            Left = 45
            Top = 31
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
            Top = 30
            Width = 30
            Height = 53
            Kind = gkVerticalBar
            ParentShowHint = False
            Progress = 0
            ShowHint = True
          end
          object _chkMostaIndiceFalta: TCheckBox
            Left = 6
            Top = 12
            Width = 97
            Height = 17
            Caption = 'Indice Falta'
            TabOrder = 0
            OnClick = _chkMostaIndiceFaltaClick
          end
        end
        object _btnMediaMaior: TBitBtn
          Left = 618
          Top = 18
          Width = 39
          Height = 39
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
            3333333333777F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
            3333333777737777F333333099999990333333373F3333373333333309999903
            333333337F33337F33333333099999033333333373F333733333333330999033
            3333333337F337F3333333333099903333333333373F37333333333333090333
            33333333337F7F33333333333309033333333333337373333333333333303333
            333333333337F333333333333330333333333333333733333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 23
          Visible = False
        end
        object _btnMediaMenor: TBitBtn
          Left = 619
          Top = 19
          Width = 39
          Height = 37
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 24
          Visible = False
        end
      end
      object _grbGraficoGradeEmpresa: TGroupBox
        Left = 1
        Top = -6
        Width = 682
        Height = 176
        Caption = 'GAM CD  SC'
        TabOrder = 3
        Visible = False
        object _SerieGraficoGradeEmpresa: TChart
          Left = 2
          Top = 15
          Width = 678
          Height = 159
          Cursor = crHandPoint
          Legend.Visible = False
          Title.Text.Strings = (
            '   ')
          OnClickSeries = _chtVendasSCClickSeries
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 1.369999999999997000
          DepthAxis.Minimum = 0.370000000000001600
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 1.369999999999997000
          DepthTopAxis.Minimum = 0.370000000000001600
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Maximum = 226.600000000000000000
          LeftAxis.Minimum = -30.900000000000080000
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Align = alClient
          TabOrder = 0
          PrintMargins = (
            15
            39
            15
            39)
          ColorPaletteIndex = 13
          object _lbeCurvaEmpresa: TLabel
            Left = 12
            Top = 7
            Width = 32
            Height = 13
            Caption = 'Curva '
          end
          object BitBtn5: TBitBtn
            Left = 762
            Top = -4
            Width = 75
            Height = 25
            Caption = 'Hist. Ped.'
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
            OnClick = BitBtn3Click
          end
          object Series10: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            ShowInLegend = False
            Emboss.Color = 8750469
            MultiBar = mbNone
            Shadow.Color = 8750469
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series19: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            Emboss.Color = 8684676
            MultiBar = mbNone
            Shadow.Color = 8684676
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object GroupBox9: TGroupBox
        Left = 866
        Top = 8
        Width = 174
        Height = 184
        Caption = 'Posicao Estoque / Empresa'
        Color = 16776176
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        Visible = False
        object _lbeMediaEmpresa: TLabeledEdit
          Left = 108
          Top = 19
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'dia Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 38
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object _lbeVendaMesEmpresa: TLabeledEdit
          AlignWithMargins = True
          Left = 108
          Top = 45
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Venda M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 50
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object _lbePendenciaEmpresa: TLabeledEdit
          Left = 108
          Top = 72
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Pend'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 53
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object _lbeEstoqueEmpresa: TLabeledEdit
          Left = 108
          Top = 97
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Estoque Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 23
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object _lbeCoberturaEstoqueEmpresa: TLabeledEdit
          Left = 108
          Top = 123
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Cobertura Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object _LbeCoberturaEstoquePendenciaEmpresa: TLabeledEdit
          Left = 108
          Top = 148
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Cob. Estoq +Pend.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
      end
      object GroupBox10: TGroupBox
        Left = 865
        Top = 215
        Width = 160
        Height = 148
        Caption = 'Totais do Pedido CD SC'
        TabOrder = 5
        object GroupBox11: TGroupBox
          Left = 3
          Top = 14
          Width = 154
          Height = 57
          Caption = 'Unidades'
          TabOrder = 0
          object _lbeSugeridoSC: TLabeledEdit
            Left = 63
            Top = 7
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugerido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeCompradoSC: TLabeledEdit
            Left = 63
            Top = 28
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 49
            EditLabel.Height = 13
            EditLabel.Caption = 'Comprado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
        end
        object GroupBox12: TGroupBox
          Left = 4
          Top = 71
          Width = 154
          Height = 74
          Caption = 'Valor'
          TabOrder = 1
          object _lbeValorSugeridoSC: TLabeledEdit
            Left = 62
            Top = 9
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugerido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeValorCompradoSC: TLabeledEdit
            Left = 62
            Top = 30
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 49
            EditLabel.Height = 13
            EditLabel.Caption = 'Comprado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeValorCompradoCustoSC: TLabeledEdit
            Left = 62
            Top = 50
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 44
            EditLabel.Height = 13
            EditLabel.Caption = 'Total Liq.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
        end
      end
      object _chkFixaDescontoAdicional: TCheckBox
        Left = 691
        Top = 294
        Width = 120
        Height = 17
        Caption = 'Fixa Desc. Adicional'
        TabOrder = 6
      end
      object _chkSemDescontoAdicional: TCheckBox
        Left = 691
        Top = 311
        Width = 120
        Height = 17
        Caption = 'Sem Desc. Adicional'
        TabOrder = 7
      end
      object _chkDigitaPrecoNota: TCheckBox
        Left = 691
        Top = 328
        Width = 120
        Height = 17
        Caption = 'Digitar Pre'#231'o &Nota'
        TabOrder = 8
      end
      object _chkMostraUltimoDesconto: TCheckBox
        Left = 694
        Top = 367
        Width = 120
        Height = 17
        Caption = 'Mostra Ult. Desc.'
        TabOrder = 9
      end
      object _cbListaPrecoLocal: TComboBox
        Left = 762
        Top = 271
        Width = 82
        Height = 21
        ItemIndex = 0
        TabOrder = 10
        Text = 'Atual'
        Items.Strings = (
          'Atual'
          'Anterior')
      end
      object GroupBox13: TGroupBox
        Left = 1031
        Top = 215
        Width = 160
        Height = 148
        Caption = 'Totais do Pedido CD RS'
        TabOrder = 11
        object GroupBox14: TGroupBox
          Left = 3
          Top = 11
          Width = 154
          Height = 57
          Caption = 'Unidades'
          TabOrder = 0
          object _lbeSugeridoRS: TLabeledEdit
            Left = 63
            Top = 7
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugerido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeCompradoRS: TLabeledEdit
            Left = 63
            Top = 28
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 49
            EditLabel.Height = 13
            EditLabel.Caption = 'Comprado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
        end
        object GroupBox15: TGroupBox
          Left = 3
          Top = 70
          Width = 154
          Height = 74
          Caption = 'Valor'
          TabOrder = 1
          object _lbeValorSugeridoRS: TLabeledEdit
            Left = 61
            Top = 10
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugerido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeValorCompradoRS: TLabeledEdit
            Left = 61
            Top = 30
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 49
            EditLabel.Height = 13
            EditLabel.Caption = 'Comprado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeValorCompradoCustoRS: TLabeledEdit
            Left = 61
            Top = 50
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 44
            EditLabel.Height = 13
            EditLabel.Caption = 'Total Liq.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
        end
      end
      object GroupBox25: TGroupBox
        Left = 869
        Top = 3
        Width = 160
        Height = 177
        Caption = 'Totais do(s) Pedido(s)'
        TabOrder = 12
        object GroupBox26: TGroupBox
          Left = 3
          Top = 12
          Width = 154
          Height = 57
          Caption = 'Unidades'
          TabOrder = 0
          object _lbeUnidSugEmpresa: TLabeledEdit
            Left = 61
            Top = 10
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugerido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeUnidCompradoEmpresa: TLabeledEdit
            Left = 61
            Top = 31
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 49
            EditLabel.Height = 13
            EditLabel.Caption = 'Comprado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
        end
        object GroupBox27: TGroupBox
          Left = 4
          Top = 71
          Width = 154
          Height = 98
          Caption = 'Valor'
          TabOrder = 1
          object _lbeValorSugEmpresa: TLabeledEdit
            Left = 61
            Top = 10
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugerido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeValorCompradoEmpresa: TLabeledEdit
            Left = 61
            Top = 30
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 49
            EditLabel.Height = 13
            EditLabel.Caption = 'Comprado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbeValorCompradoCustoEmpresa: TLabeledEdit
            Left = 61
            Top = 50
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 44
            EditLabel.Height = 13
            EditLabel.Caption = 'Total Liq.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _lbevtCMV: TLabeledEdit
            Left = 61
            Top = 72
            Width = 88
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 38
            EditLabel.Height = 13
            EditLabel.Caption = 'Vt. CMV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 9
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
        end
      end
      object _chkOcultaCD: TCheckBox
        Left = 872
        Top = 381
        Width = 120
        Height = 17
        Caption = 'Oculta Dados Cd.'
        Checked = True
        State = cbChecked
        TabOrder = 13
        OnClick = _chkOcultaCDClick
      end
      object _grbCDOposto: TGroupBox
        Left = 896
        Top = 198
        Width = 42
        Height = 17
        Caption = 'Posicao Estoque / Empresa'
        Color = clGradientInactiveCaption
        ParentBackground = False
        ParentColor = False
        TabOrder = 14
        object _lbeMediaCdOposto: TLabeledEdit
          Left = 108
          Top = 19
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'dia Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 38
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object _lbeVendaMesCDOposto: TLabeledEdit
          AlignWithMargins = True
          Left = 108
          Top = 45
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Venda M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 50
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object _lbePendenciaCDOposto: TLabeledEdit
          Left = 108
          Top = 71
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Pend'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 53
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object _lbeEstoqueCDOposto: TLabeledEdit
          Left = 108
          Top = 97
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Estoque Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 23
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object _lbeCoberturaEstoqueCDOposto: TLabeledEdit
          Left = 108
          Top = 123
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Cobertura Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object _LbeCoberturaEstoquePendenciaCDOposto: TLabeledEdit
          Left = 108
          Top = 148
          Width = 58
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Cob. Estoq +Pend.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
      end
      object GroupBox41: TGroupBox
        Left = 0
        Top = 366
        Width = 1185
        Height = 170
        Caption = 'Pedido CD SC'
        TabOrder = 15
        object _dbgPrePedido: TDBGrid
          Left = 2
          Top = 15
          Width = 1181
          Height = 153
          Align = alClient
          DataSource = _dsPrePedido
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = _dbgPrePedidoCellClick
          OnColEnter = _dbgPrePedidoColEnter
          OnDrawColumnCell = _dbgPrePedidoDrawColumnCell
          OnDblClick = _dbgPrePedidoDblClick
          OnEnter = _dbgPrePedidoEnter
          OnExit = _dbgPrePedidoExit
          OnKeyDown = _dbgPrePedidoKeyDown
          OnMouseActivate = _dbgPrePedidoMouseActivate
          OnTitleClick = _dbgPrePedidoTitleClick
        end
      end
      object _cbxFiltroItemPedido: TComboBox
        Left = 759
        Top = 345
        Width = 98
        Height = 21
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 16
        Text = 'CD SC e CD RS'
        OnChange = _cbxFiltroItemPedidoChange
        Items.Strings = (
          'CD SC e CD RS'
          'CD Tubar'#227'o'
          'CS Sta Cruz do Sul')
      end
    end
    object _tbsConfirma: TTabSheet
      Caption = '&Confirma/Fecha Pedido'
      Enabled = False
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object BitBtn2: TBitBtn
        Left = 197
        Top = 512
        Width = 113
        Height = 29
        Caption = '&Fechar/Cancelar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn2Click
      end
      object _grbParcelaPrazo: TGroupBox
        Left = 876
        Top = 23
        Width = 125
        Height = 55
        Caption = 'Prazo Pedido'
        TabOrder = 1
        Visible = False
        object _dbgPrazoSC: TDBGrid
          Left = 2
          Top = 15
          Width = 121
          Height = 38
          Align = alClient
          Ctl3D = False
          DataSource = _dsParcelaPrazoCDSC
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_PARCELA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_DIAS'
              Visible = True
            end>
        end
      end
      object _grbPedidoCDSC: TGroupBox
        Left = 3
        Top = 8
        Width = 867
        Height = 266
        Caption = 'Pedido SC'
        TabOrder = 2
        object _dbgPedidoSC: TDBGrid
          Left = 2
          Top = 15
          Width = 863
          Height = 249
          Align = alClient
          DataSource = _dsItemPedidoCDSC
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgPedidoSCDrawColumnCell
        end
      end
      object GroupBox5: TGroupBox
        Left = 3
        Top = 273
        Width = 868
        Height = 241
        Caption = 'Pedido RS'
        TabOrder = 3
        object _dbgPedidoRS: TDBGrid
          Left = 2
          Top = 15
          Width = 864
          Height = 224
          Align = alClient
          DataSource = _dsItemPedidoCDRS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgPedidoRSDrawColumnCell
        end
      end
      object _btnConfirmaPedido: TBitBtn
        Left = 755
        Top = 514
        Width = 113
        Height = 29
        Caption = '&Confirma Pedido'
        DoubleBuffered = True
        Enabled = False
        Kind = bkAll
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = _btnConfirmaPedidoClick
      end
      object GroupBox23: TGroupBox
        Left = 878
        Top = 288
        Width = 125
        Height = 56
        Caption = 'Prazo Pedido'
        TabOrder = 5
        Visible = False
        object _dbgPrazoRS: TDBGrid
          Left = 2
          Top = 15
          Width = 121
          Height = 39
          Align = alClient
          Ctl3D = False
          DataSource = _dsParcelaPrazoCDRS
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_PARCELAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_DIAS'
              Visible = True
            end>
        end
      end
      object BitBtn7: TBitBtn
        Left = 880
        Top = 88
        Width = 123
        Height = 25
        Caption = 'Dividir Pedido'
        DoubleBuffered = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888888888888888888800008888
          88888888777777780000888888888880000000780000888888888840FBFBF078
          0000888888888480000000880000888888884888888888880000887777748888
          77777778000080000007777000000078000080FFFF044440FBFBF07800008000
          0008788000000088000088888884878888888888000088888888487877777778
          0000888888888480000000780000888888888840FBFBF0780000888888888880
          0000008800008888888888888888888800008888888888888888888800008888
          88888888888888880000}
        ParentDoubleBuffered = False
        TabOrder = 6
        Visible = False
        OnClick = BitBtn7Click
      end
      object BitBtn8: TBitBtn
        Left = 880
        Top = 350
        Width = 123
        Height = 25
        Caption = 'Dividir Pedido'
        DoubleBuffered = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888888888888888888800008888
          88888888777777780000888888888880000000780000888888888840FBFBF078
          0000888888888480000000880000888888884888888888880000887777748888
          77777778000080000007777000000078000080FFFF044440FBFBF07800008000
          0008788000000088000088888884878888888888000088888888487877777778
          0000888888888480000000780000888888888840FBFBF0780000888888888880
          0000008800008888888888888888888800008888888888888888888800008888
          88888888888888880000}
        ParentDoubleBuffered = False
        TabOrder = 7
        Visible = False
      end
      object _btnImprimir: TBitBtn
        Left = 876
        Top = 182
        Width = 123
        Height = 25
        Caption = 'Imprimir Rel.'
        DoubleBuffered = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
          000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
          0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
          7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
          0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
          0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
          FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
          DDDDDDDDDDDDDDDD0000}
        ParentDoubleBuffered = False
        TabOrder = 8
        OnClick = _btnImprimirClick
      end
      object _btnImprimirRS: TBitBtn
        Left = 878
        Top = 443
        Width = 123
        Height = 25
        Caption = 'Imprimir Rel.'
        DoubleBuffered = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
          000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
          0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
          7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
          0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
          0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
          FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
          DDDDDDDDDDDDDDDD0000}
        ParentDoubleBuffered = False
        TabOrder = 9
        OnClick = _btnImprimirRSClick
      end
      object _chkRelatorioPrecoCustoRS: TCheckBox
        Left = 879
        Top = 125
        Width = 145
        Height = 17
        Caption = 'Relatorio C/Preco Custo'
        TabOrder = 10
      end
      object _chkMostraDescontoRS: TCheckBox
        Left = 880
        Top = 150
        Width = 164
        Height = 17
        Caption = 'Mostra Coluna % Desc.'
        TabOrder = 11
      end
      object _chkRelatorioPrecoCustoSC: TCheckBox
        Left = 893
        Top = 386
        Width = 145
        Height = 17
        Caption = 'Relatorio C/Preco Custo'
        TabOrder = 12
      end
      object _chkMostraDescontoSC: TCheckBox
        Left = 893
        Top = 416
        Width = 164
        Height = 17
        Caption = 'Mostra Coluna % Desc.'
        TabOrder = 13
      end
    end
    object _tbsCompras1: TTabSheet
      Caption = '&ComprasReserva'
      Enabled = False
      ImageIndex = 2
      OnEnter = _tbsCompras1Enter
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object _gbHistoricoPedido: TGroupBox
        Left = -4
        Top = 418
        Width = 865
        Height = 178
        Caption = 'Historico de Pedidos'
        TabOrder = 5
        Visible = False
        object Chart2: TChart
          Left = 2
          Top = 15
          Width = 861
          Height = 161
          Legend.Visible = False
          Title.Text.Strings = (
            'Hist'#243'rico de Estoque')
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 0.620000000000009300
          DepthAxis.Minimum = -0.379999999999985400
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 0.620000000000009300
          DepthTopAxis.Minimum = -0.379999999999985400
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Maximum = 553.727999999994800000
          LeftAxis.Minimum = 59.327999999993630000
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          View3D = False
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object Series2: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            Title = 'EstoqueMaximo'
            LinePen.Color = 10708548
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series4: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            SeriesColor = 1330417
            Title = 'EstoqueMinimo'
            LinePen.Color = 1330417
            LinePen.Width = 3
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series5: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            ShowInLegend = False
            Title = 'UltimasCompras'
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
            SeriesColor = 3513587
            Title = 'EstoqueDiario'
            LinePen.Color = 3513587
            LinePen.Width = 3
            Pointer.Brush.Gradient.EndColor = 3513587
            Pointer.Gradient.EndColor = 3513587
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object _gbDadosCompras: TGroupBox
        Left = 48
        Top = 339
        Width = 861
        Height = 180
        Caption = 'C'#225'lculo'
        Color = clBtnFace
        Ctl3D = False
        ParentBackground = False
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 6
        object _lbeMedia: TLabeledEdit
          Left = 751
          Top = 139
          Width = 110
          Height = 19
          Ctl3D = False
          EditLabel.Width = 80
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdRightToLeft
          EditLabel.Caption = 'Calculo da M'#233'dia'
          EditLabel.ParentBiDiMode = False
          LabelPosition = lpLeft
          LabelSpacing = 0
          ParentCtl3D = False
          TabOrder = 0
        end
        object _gbxSugestaoGeral: TGroupBox
          Left = 453
          Top = 16
          Width = 211
          Height = 144
          Caption = 'Sugest'#227'o Geral'
          TabOrder = 1
          object Label14: TLabel
            Left = 17
            Top = 98
            Width = 89
            Height = 13
            Caption = 'Qtdade p/ Compra'
          end
          object Label20: TLabel
            Left = 17
            Top = 20
            Width = 66
            Height = 13
            Caption = 'Cxa/Cam/Pal.'
          end
          object _lbeSugestaoIdealEmpresa: TLabeledEdit
            Left = 116
            Top = 43
            Width = 89
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 72
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugest'#227'o Ideal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 27
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object _lbeSugestaoPossivelEmpresa: TLabeledEdit
            Left = 116
            Top = 68
            Width = 89
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 86
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugest'#227'o Possivel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 13
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object _lbeDiasEstoqueEmpresa: TLabeledEdit
            Left = 116
            Top = 121
            Width = 89
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 62
            EditLabel.Height = 13
            EditLabel.Caption = 'Dias Estoque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 37
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _edtCaixaEmpresa: TEdit
            Left = 98
            Top = 14
            Width = 33
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
            TabOrder = 3
          end
          object _edtCamadaEmpresa: TEdit
            Left = 135
            Top = 14
            Width = 33
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
            TabOrder = 5
          end
          object _edtPaleteEmpresa: TEdit
            Left = 173
            Top = 14
            Width = 33
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
            TabOrder = 4
          end
        end
        object _gbxSugestaoRS: TGroupBox
          Left = 225
          Top = 16
          Width = 211
          Height = 144
          Caption = 'Sugest'#227'o para RS'
          TabOrder = 2
          object Label1: TLabel
            Left = 3
            Top = 20
            Width = 66
            Height = 13
            Caption = 'Cxa/Cam/Pal.'
          end
          object _lbeSugestaoIdealRS: TLabeledEdit
            Left = 116
            Top = 42
            Width = 89
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 72
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugest'#227'o Ideal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 30
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object _lbeSugestaoPossivelRS: TLabeledEdit
            Left = 116
            Top = 67
            Width = 89
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 86
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugest'#227'o Possivel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 15
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object _lbeDiasEstoqueRS: TLabeledEdit
            Left = 116
            Top = 119
            Width = 89
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 62
            EditLabel.Height = 13
            EditLabel.Caption = 'Dias Estoque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 37
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyDown = _lbeDiasEstoqueEmpresaKeyDown
          end
          object _edtCaixaRS: TEdit
            Left = 97
            Top = 14
            Width = 33
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
            TabOrder = 3
          end
          object _edtCamadaRS: TEdit
            Left = 134
            Top = 14
            Width = 33
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
            TabOrder = 4
          end
          object _edtPaleteRS: TEdit
            Left = 172
            Top = 14
            Width = 33
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
            TabOrder = 5
          end
          object _lbeQuantidadePedidoRS: TLabeledEdit
            Left = 115
            Top = 93
            Width = 90
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 89
            EditLabel.Height = 13
            EditLabel.Caption = 'Qtdade p/ Compra'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 12
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
            OnKeyDown = _lbeQuantidadePedidoSCKeyDown
          end
        end
        object _gbxSugestaoSC: TGroupBox
          Left = 9
          Top = 16
          Width = 211
          Height = 144
          Caption = 'Sugest'#227'o para SC'
          TabOrder = 3
          object Label19: TLabel
            Left = 17
            Top = 20
            Width = 66
            Height = 13
            Caption = 'Cxa/Cam/Pal.'
          end
          object _lbeSugestaoIdealSC: TLabeledEdit
            Left = 116
            Top = 42
            Width = 90
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 72
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugest'#227'o Ideal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 30
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object _lbeSugestaoPossivelSC: TLabeledEdit
            Left = 116
            Top = 67
            Width = 90
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 86
            EditLabel.Height = 13
            EditLabel.Caption = 'Sugest'#227'o Possivel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 15
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object _lbeDiasEstoqueSC: TLabeledEdit
            Left = 116
            Top = 121
            Width = 90
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 62
            EditLabel.Height = 13
            EditLabel.Caption = 'Dias Estoque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 35
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
            OnKeyDown = _lbeDiasEstoqueSCKeyDown
          end
          object _edtCaixaSC: TEdit
            Left = 96
            Top = 14
            Width = 33
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
            TabOrder = 4
          end
          object _edtCamadaSC: TEdit
            Left = 134
            Top = 14
            Width = 33
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
            TabOrder = 5
          end
          object _edtPaleteSC: TEdit
            Left = 173
            Top = 14
            Width = 33
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
            TabOrder = 6
          end
          object _lbeQuantidadePedidoSC: TLabeledEdit
            Left = 116
            Top = 96
            Width = 90
            Height = 19
            Alignment = taRightJustify
            Ctl3D = False
            EditLabel.Width = 89
            EditLabel.Height = 13
            EditLabel.Caption = 'Qtdade p/ Compra'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 12
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyDown = _lbeQuantidadePedidoSCKeyDown
          end
        end
      end
      object _grbGraficoVendasSC: TGroupBox
        Left = 1
        Top = 7
        Width = 865
        Height = 208
        Caption = 'GAM CD  SC'
        TabOrder = 0
        object _chtVendasSC: TChart
          Left = 2
          Top = 15
          Width = 861
          Height = 191
          Cursor = crHandPoint
          Legend.Visible = False
          Title.Text.Strings = (
            '   ')
          OnClickSeries = _chtVendasSCClickSeries
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 1.490000000000001000
          DepthAxis.Minimum = 0.490000000000000600
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 1.490000000000001000
          DepthTopAxis.Minimum = 0.490000000000000600
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Align = alClient
          TabOrder = 0
          PrintMargins = (
            15
            39
            15
            39)
          ColorPaletteIndex = 13
          object _lbeCurvaSC: TLabel
            Left = 12
            Top = 7
            Width = 45
            Height = 13
            Caption = 'Curva SC'
          end
          object BitBtn3: TBitBtn
            Left = 786
            Top = 2
            Width = 75
            Height = 25
            Caption = 'Hist. Ped.'
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
            OnClick = BitBtn3Click
          end
          object Series1: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = False
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = False
            Marks.Callout.Length = 19
            Marks.Emboss.Color = 8487297
            Marks.Shadow.Color = 8684676
            Marks.Style = smsValue
            Marks.Visible = True
            ShowInLegend = False
            Title = 'VendasSC'
            Emboss.Color = 8487297
            Shadow.Color = 8487297
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object _grbGraficoVendasRS: TGroupBox
        Left = 3
        Top = 219
        Width = 865
        Height = 208
        Caption = 'GAM CD  RS'
        TabOrder = 1
        object _chtvendasRS: TChart
          Left = 2
          Top = 15
          Width = 861
          Height = 191
          Legend.Visible = False
          Title.Text.Strings = (
            '')
          DepthAxis.Automatic = False
          DepthAxis.AutomaticMaximum = False
          DepthAxis.AutomaticMinimum = False
          DepthAxis.Maximum = 0.620000000000000100
          DepthAxis.Minimum = -0.380000000000000000
          DepthTopAxis.Automatic = False
          DepthTopAxis.AutomaticMaximum = False
          DepthTopAxis.AutomaticMinimum = False
          DepthTopAxis.Maximum = 0.620000000000000100
          DepthTopAxis.Minimum = -0.380000000000000000
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Shadow.Smooth = False
          Align = alClient
          TabOrder = 0
          ColorPaletteIndex = 13
          object _lbeCurvaRS: TLabel
            Left = 12
            Top = 7
            Width = 45
            Height = 13
            Caption = 'Curva RS'
          end
          object BitBtn1: TBitBtn
            Left = 778
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Hist. Ped.'
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
            OnClick = BitBtn1Click
          end
          object Series8: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Style = smsValue
            Marks.Visible = True
            ShowInLegend = False
            Title = 'VendasRS'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object _grbPosicaoEstoqueSC: TGroupBox
        Left = 872
        Top = 0
        Width = 185
        Height = 202
        Caption = 'Posicao Estoque / Venda SC'
        Color = clMoneyGreen
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        object _lbeMediaMensalSC: TLabeledEdit
          Left = 108
          Top = 20
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'dia Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 38
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object _lbeVendaMensalSC: TLabeledEdit
          AlignWithMargins = True
          Left = 108
          Top = 45
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Venda M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 50
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object _lbePendenciaSC: TLabeledEdit
          Left = 108
          Top = 71
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Pend'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 53
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object _lbeEstoqueSC: TLabeledEdit
          Left = 108
          Top = 97
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Estoque Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 23
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object _lbeCoberturaEstoqueSC: TLabeledEdit
          Left = 108
          Top = 123
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Cobertura Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object _LbeCoberturaEstoquePendenciaSC: TLabeledEdit
          Left = 108
          Top = 148
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Cob. Estoq +Pend.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
      end
      object GroupBox7: TGroupBox
        Left = 874
        Top = 216
        Width = 185
        Height = 202
        Caption = 'Posicao Estoque / Venda RS'
        Color = clInactiveCaptionText
        ParentBackground = False
        ParentColor = False
        TabOrder = 3
        object _lbeMediaMensalRS: TLabeledEdit
          Left = 108
          Top = 19
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'dia Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 38
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object _lbeVendaMensalRS: TLabeledEdit
          AlignWithMargins = True
          Left = 108
          Top = 45
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Venda M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 50
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object _lbePendenciaRS: TLabeledEdit
          Left = 108
          Top = 73
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Pend'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 53
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object _lbeEstoqueRS: TLabeledEdit
          Left = 108
          Top = 98
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Estoque Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 23
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object _lbeCoberturaEstoqueRS: TLabeledEdit
          Left = 108
          Top = 123
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Cobertura Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object _LbeCoberturaEstoquePendenciaRS: TLabeledEdit
          Left = 108
          Top = 148
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Cob. Estoq +Pend.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
      end
      object _grbEmpresa: TGroupBox
        Left = 867
        Top = 399
        Width = 185
        Height = 202
        Caption = 'Posicao Estoque / Empresa'
        Color = 16776176
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        object _lbeMediaMensalEmpresa: TLabeledEdit
          Left = 108
          Top = 19
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'dia Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 38
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object _lbeVendaMensalEmpresa: TLabeledEdit
          AlignWithMargins = True
          Left = 108
          Top = 45
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Venda M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 50
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object _lbePendenciaEmpresa2: TLabeledEdit
          Left = 108
          Top = 71
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Pend'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 53
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object _lbeEstoqueEmpresa2: TLabeledEdit
          Left = 108
          Top = 97
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Estoque Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 23
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object _lbeCoberturaEstoqueEmpresa2: TLabeledEdit
          Left = 108
          Top = 123
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Cobertura Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object _LbeCoberturaEstoquePendenciaEmpresa2: TLabeledEdit
          Left = 108
          Top = 148
          Width = 70
          Height = 19
          Alignment = taRightJustify
          Ctl3D = False
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Cob. Estoq +Pend.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
  object _dsVendalaboratorio: TDataSource
    DataSet = _cdsVendalaboratorio
    Left = 48
    Top = 408
  end
  object _dsProduto: TDataSource
    DataSet = _cdsProduto
    Left = 144
    Top = 392
  end
  object _cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 216
    Top = 19
  end
  object _cdsPrecoLista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 504
    Top = 64
  end
  object _cdsParamentoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 528
  end
  object _cdsLaboratorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 160
    Top = 72
  end
  object _cdsEstoqueDiario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 833
    Top = 197
  end
  object _cdsVendalaboratorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 144
    Top = 177
  end
  object _cdsUltimasCompra: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 246
    Top = 133
  end
  object _cdsitemPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 912
    Top = 184
  end
  object _cdsIndiceFaltaAnterior: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 600
    Top = 189
  end
  object _cdsIndiceFaltaAtual: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    AfterRefresh = _cdsIndiceFaltaAtualAfterRefresh
    Left = 360
    Top = 675
  end
  object _cdsVendaAnualLaboratorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 832
    Top = 80
  end
  object _cdsCapaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 1032
    Top = 173
  end
  object _cdsCondicaoPagamentoCDSC: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 72
    object _cdsCondicaoPagamentoCDSCNR_PARCELA: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parcela'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object _cdsCondicaoPagamentoCDSCNR_DIAS: TIntegerField
      DisplayLabel = 'Prazo '
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsParcelaPrazoCDSC: TDataSource
    DataSet = _cdsCondicaoPagamentoCDSC
    Left = 672
    Top = 141
  end
  object _cdsEspecealidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 32
    Top = 256
  end
  object _dsEspecealidade: TDataSource
    DataSet = _cdsEspecealidade
    Left = 72
    Top = 483
  end
  object _dsItemPedido: TDataSource
    DataSet = _cdsitemPedido
    Left = 440
    Top = 227
  end
  object _cdsIndicePreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 324
    Top = 72
  end
  object _cdsTemporario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 618
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 80
    Top = 131
  end
  object _cdsPendenciaSCI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 336
    Top = 65535
  end
  object _cdsVendasSC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 329
    Top = 133
  end
  object _cdsVendasRS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 776
    Top = 53
  end
  object _cdsitemPedidoCDSC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 272
    Top = 411
  end
  object _dsItemPedidoCDSC: TDataSource
    DataSet = _cdsitemPedidoCDSC
    Left = 264
    Top = 475
  end
  object _cdsitemPedidoCDRS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 400
    Top = 405
  end
  object _dsItemPedidoCDRS: TDataSource
    DataSet = _cdsitemPedidoCDRS
    Left = 480
    Top = 675
  end
  object _cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 160
    Top = 125
  end
  object _cdsEstoqueEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 480
    Top = 181
  end
  object _dsEstoqueEmpresa: TDataSource
    DataSet = _cdsEstoqueMultEmpresa
    Left = 704
    Top = 53
  end
  object _dsEstoquePendencia: TDataSource
    DataSet = _cdsEstoquePendencia
    Left = 352
    Top = 624
  end
  object _cdsEstoquePendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 264
    Top = 181
  end
  object _cdsVendaMes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 728
    Top = 293
  end
  object _dsVendaMes: TDataSource
    DataSet = _cdsVendaMes
    Left = 824
    Top = 293
  end
  object _cdsVendaAnualLaboratorioRS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 88
    Top = 72
  end
  object _cdsVendaAnualLaboratorioSC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 568
    Top = 176
  end
  object _dsParcelaPrazoCDRS: TDataSource
    DataSet = _cdsCondicaoPagamentoCDRS
    Left = 408
    Top = 466
  end
  object _cdsCondicaoPagamentoCDRS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 264
    object _cdsCondicaoPagamentoCDRSNR_PARCELAS: TAutoIncField
      DisplayLabel = 'Nr. Parcela'
      DisplayWidth = 3
      FieldName = 'NR_PARCELAS'
    end
    object _cdsCondicaoPagamentoCDRSNR_DIAS: TIntegerField
      DisplayLabel = 'Prazo '
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _cdsSugestaoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 400
    object _cdsSugestaoCompraID_LOCAL: TStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_LOCAL'
    end
    object _cdsSugestaoCompraCD_EMPRESA: TIntegerField
      DisplayLabel = 'CD'
      DisplayWidth = 2
      FieldName = 'CD_EMPRESA'
    end
    object _cdsSugestaoCompraNR_UNIDADES_SUGERIDA: TIntegerField
      DisplayLabel = 'Nr.Unid.Sugerida'
      FieldName = 'NR_UNIDADES_SUGERIDA'
      DisplayFormat = '###,##0'
    end
    object _cdsSugestaoCompraVL_SUGERIDO_CUSTO: TFloatField
      DisplayLabel = 'Vlr.Sugerido Custo'
      FieldName = 'VL_SUGERIDO_CUSTO'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsSugestaoCompraVL_SUGERIDO_VENDA: TFloatField
      DisplayLabel = 'Vlr. Sug. Venda'
      FieldName = 'VL_SUGERIDO_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsSugestaoCompraVL_SUGERIDO_MTS_CUB: TFloatField
      DisplayLabel = 'Mts. Cubico Sugerido'
      FieldName = 'VL_SUGERIDO_MTS_CUB'
      DisplayFormat = '###,##0.00'
    end
  end
  object _cdsExcessoEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 792
    Top = 504
    object _cdsExcessoEstoqueID_LOCAL: TStringField
      DisplayLabel = 'LOCAL'
      DisplayWidth = 20
      FieldName = 'ID_LOCAL'
      Visible = False
      Size = 30
    end
    object _cdsExcessoEstoqueCD_EMPRESA: TIntegerField
      DisplayLabel = 'CD'
      DisplayWidth = 2
      FieldName = 'CD_EMPRESA'
    end
    object _cdsExcessoEstoqueNR_UNIDADES_EXCESSO: TIntegerField
      DisplayLabel = 'Nr.Unid.Excesso'
      FieldName = 'NR_UNIDADES_EXCESSO'
      DisplayFormat = '###,###,##0'
    end
    object _cdsExcessoEstoqueVL_EXCESSO_CUSTO: TFloatField
      DisplayLabel = 'Vlr.Excesso Custo'
      FieldName = 'VL_EXCESSO_CUSTO'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsExcessoEstoqueVL_EXCESSO_VENDA: TFloatField
      DisplayLabel = 'Vlr.Excesso Venda'
      FieldName = 'VL_EXCESSO_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object _cdsExcessoEstoqueVL_EXCESSSO_MTS_CUBICO: TFloatField
      DisplayLabel = 'Mts. Cubico Excesso'
      FieldName = 'VL_EXCESSSO_MTS_CUBICO'
      DisplayFormat = '###,##0.00'
    end
  end
  object _dsSugestaoCompra: TDataSource
    DataSet = _cdsSugestaoCompra
    Left = 816
    Top = 400
  end
  object _dsExcessoEstoque: TDataSource
    DataSet = _cdsExcessoEstoque
    Left = 864
    Top = 504
  end
  object _cdsItensCurva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 152
    Top = 285
  end
  object _dsItensCurva: TDataSource
    DataSet = _cdsItensCurva
    Left = 320
    Top = 208
  end
  object _cdsEstoqueMultEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 232
    Top = 221
  end
  object _cdsPendenciaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 133
  end
  object _cdsProdutoOL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 424
  end
  object _cdsUltimosPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 72
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 24
  end
  object _cdsDiasVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 832
    Top = 133
  end
  object _cdsDiasAZero: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 1080
  end
  object _cdsEmbalagemMercadoria: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1000
    Top = 72
  end
  object _cdsTabelaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 48
  end
  object _cdsDadosFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 816
  end
  object _cdsDataUltimaCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1093
    Top = 80
  end
  object _cdsDiasEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 301
  end
  object _dsDiasEstoque: TDataSource
    DataSet = _cdsDiasEstoque
    Left = 24
    Top = 341
  end
  object _cdsDiasEstoque_teste: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 72
    Data = {
      C10000009619E0BD010000001800000006000000000003000000C100046E6D43
      4401004900000001000557494454480200020014000A43445F454D5052455341
      040001000000000015564C5F4553544F5155455F464F524E454345444F520800
      04000000000014564C5F4553544F5155455F434F4D505241444F520800040000
      00000014564C5F4553544F5155455F464F524E5F50454E440800040000000000
      1A564C5F4553544F5155455F434F4D50525F50454E44454E4349410800040000
      0000000000}
    object _cdsDiasEstoque_testenmCD: TStringField
      DisplayLabel = 'Local Fatur.'
      FieldName = 'nmCD'
    end
    object _cdsDiasEstoque_testeCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Visible = False
    end
    object _cdsDiasEstoque_testeVL_ESTOQUE_FORNECEDOR: TFloatField
      DisplayLabel = 'Fornecedor'
      FieldName = 'VL_ESTOQUE_FORNECEDOR'
    end
    object _cdsDiasEstoque_testeVL_ESTOQUE_COMPRADOR: TFloatField
      DisplayLabel = 'Comprador'
      FieldName = 'VL_ESTOQUE_COMPRADOR'
    end
    object _cdsDiasEstoque_testeVL_ESTOQUE_FORN_PEND: TFloatField
      DisplayLabel = 'Fornec.+Pend.'
      FieldName = 'VL_ESTOQUE_FORN_PEND'
    end
    object _cdsDiasEstoque_testeVL_ESTOQUE_COMPR_PENDENCIA: TFloatField
      DisplayLabel = 'Comprador'
      FieldName = 'VL_ESTOQUE_COMPR_PENDENCIA'
    end
  end
  object _dsDiasEstoque_teste: TDataSource
    DataSet = _cdsDiasEstoque_teste
    Left = 424
    Top = 133
  end
  object _cdsListaPrecoAtiva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 600
    Top = 456
  end
  object _dsListaPreco: TDataSource
    DataSet = _cdsListaPrecoAtiva
    Left = 600
    Top = 408
  end
  object _cdsPrePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    BeforeScroll = _cdsPrePedidoBeforeScroll
    AfterScroll = _cdsPrePedidoAfterScroll
    AfterRefresh = _cdsPrePedidoAfterRefresh
    Left = 512
    Top = 416
  end
  object _dsPrePedido: TDataSource
    DataSet = _cdsPrePedido
    OnDataChange = _dsPrePedidoDataChange
    Left = 512
    Top = 464
  end
  object _cdsTabelaLeadTime: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 360
  end
  object _cdsIndicedeFalta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 432
  end
end
