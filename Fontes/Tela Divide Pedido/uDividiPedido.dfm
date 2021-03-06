object _frmDivisaoDePedido: T_frmDivisaoDePedido
  Left = 82
  Top = 0
  Caption = 'Divisao De Pedido'
  ClientHeight = 662
  ClientWidth = 1067
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 643
    Width = 1067
    Height = 19
    Panels = <>
  end
  object _grbInformacaoPedido: TGroupBox
    Left = 0
    Top = 0
    Width = 1067
    Height = 153
    Align = alTop
    Caption = 'Paramentros para Divis'#227'o'
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 17
      Width = 79
      Height = 13
      Caption = 'Dividir .Ped. em:'
    end
    object Label2: TLabel
      Left = 3
      Top = 73
      Width = 100
      Height = 13
      Caption = 'Nr. do  Pedido(Orig.)'
    end
    object Label3: TLabel
      Left = 316
      Top = 11
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label4: TLabel
      Left = 316
      Top = 45
      Width = 83
      Height = 13
      Caption = 'CNPJ Fornecedor'
    end
    object Label5: TLabel
      Left = 316
      Top = 77
      Width = 47
      Height = 13
      Caption = 'Dt.Pedido'
    end
    object Label6: TLabel
      Left = 400
      Top = 77
      Width = 53
      Height = 13
      Caption = 'Dt.Entrega'
    end
    object Label7: TLabel
      Left = 887
      Top = 23
      Width = 160
      Height = 13
      Caption = 'Qtdade Maior que Pedido Original'
    end
    object Label8: TLabel
      Left = 887
      Top = 63
      Width = 164
      Height = 13
      Caption = 'Qtdade Menor que Pedido Original'
    end
    object Label10: TLabel
      Left = 524
      Top = 45
      Width = 64
      Height = 13
      Caption = 'Pedido para :'
    end
    object Label11: TLabel
      Left = 525
      Top = 118
      Width = 43
      Height = 13
      Caption = 'Nr.Verba'
    end
    object _edtqtPedido: TEdit
      Left = 3
      Top = 34
      Width = 78
      Height = 19
      Hint = 'Digite o Nr. Pedidos de  que deseja Gerar'
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = _edtqtPedidoExit
      OnKeyDown = _edtqtPedidoKeyDown
    end
    object DBGrid1: TDBGrid
      Left = 109
      Top = 13
      Width = 202
      Height = 137
      Ctl3D = False
      DataSource = _dsPercentualPedido
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_PEDIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_PEDIDO'
          Visible = True
        end>
    end
    object _edtNrPedido: TEdit
      Left = 3
      Top = 92
      Width = 94
      Height = 19
      Hint = 'Digite o Numero do Pedido que deseja dividir'
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyDown = _edtNrPedidoKeyDown
    end
    object _edtFornecedor: TEdit
      Left = 316
      Top = 25
      Width = 345
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object _edtNrCNPJ: TEdit
      Left = 316
      Top = 58
      Width = 203
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object _dtPedido: TEdit
      Left = 316
      Top = 92
      Width = 78
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object _dtPrevista: TEdit
      Left = 396
      Top = 92
      Width = 78
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object _btnSetQuantidade: TBitBtn
      Left = 878
      Top = 122
      Width = 137
      Height = 25
      Caption = 'Gera/Confirma Pedido'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = _btnSetQuantidadeClick
    end
    object Panel1: TPanel
      Left = 851
      Top = 13
      Width = 29
      Height = 36
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object Panel2: TPanel
      Left = 851
      Top = 55
      Width = 29
      Height = 36
      Color = clRed
      ParentBackground = False
      TabOrder = 9
    end
    object _edtCdDestino: TEdit
      Left = 524
      Top = 58
      Width = 134
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object _chkObservacaoPedidoSC: TCheckBox
      Left = 525
      Top = 77
      Width = 164
      Height = 17
      Caption = 'Observa'#231#227'o  Pedido'
      TabOrder = 11
    end
    object _edtObservacaoPedidoSC: TEdit
      Left = 524
      Top = 92
      Width = 240
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 40
      ParentCtl3D = False
      TabOrder = 12
    end
    object _chkImprimirSC: TCheckBox
      Left = 681
      Top = 10
      Width = 164
      Height = 17
      Caption = 'Imprimir Pedido'
      Checked = True
      Ctl3D = False
      ParentCtl3D = False
      State = cbChecked
      TabOrder = 13
    end
    object _chkGeraExcelSC: TCheckBox
      Left = 681
      Top = 37
      Width = 164
      Height = 17
      Caption = 'Gera Excel Pedido'
      Checked = True
      Ctl3D = False
      ParentCtl3D = False
      State = cbChecked
      TabOrder = 14
    end
    object _chkBonificaPedidoSC: TCheckBox
      Left = 681
      Top = 60
      Width = 164
      Height = 17
      Caption = 'Bonificar Pedido'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
      OnClick = _chkBonificaPedidoSCClick
    end
    object _edtNrVerba: TEdit
      Left = 524
      Top = 131
      Width = 134
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 16
      OnExit = _edtNrVerbaExit
    end
    object BitBtn1: TBitBtn
      Left = 904
      Top = 91
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 17
      Visible = False
      OnClick = BitBtn1Click
    end
    object _chkRelatorioPrecoCusto: TCheckBox
      Left = 708
      Top = 115
      Width = 145
      Height = 17
      Caption = 'Relatorio C/Preco Custo'
      TabOrder = 18
    end
    object _chkMostraDesconto: TCheckBox
      Left = 708
      Top = 132
      Width = 164
      Height = 17
      Caption = 'Mostra Coluna % Desc.'
      Checked = True
      State = cbChecked
      TabOrder = 19
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 153
    Width = 1067
    Height = 314
    Align = alTop
    Caption = 'Peidido'
    TabOrder = 2
    object _dbgPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 1063
      Height = 297
      Align = alClient
      Ctl3D = False
      DataSource = _dsPedidoNovo
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgPedidoDrawColumnCell
      OnMouseMove = _dbgPedidoMouseMove
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 467
    Width = 1067
    Height = 176
    Align = alClient
    Caption = 'Dados do Pedido(s)'
    TabOrder = 3
    object Label9: TLabel
      Left = 7
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Dt.Pedido'
    end
    object _grbPrazoPed_01: TGroupBox
      Left = 7
      Top = 42
      Width = 132
      Height = 125
      Caption = 'Prazo Pedido 1'
      TabOrder = 0
      object _dbgPrazoRS: TDBGrid
        Left = 2
        Top = 15
        Width = 128
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento1
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
    object _grbPrazoPed_02: TGroupBox
      Left = 142
      Top = 42
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 2'
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento2
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
    object _grbPrazoPed_03: TGroupBox
      Left = 273
      Top = 42
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 3'
      TabOrder = 2
      object DBGrid3: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento3
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
    object _grbPrazoPed_04: TGroupBox
      Left = 405
      Top = 42
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 4'
      TabOrder = 3
      object DBGrid4: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento4
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
    object _grbPrazoPed_05: TGroupBox
      Left = 538
      Top = 42
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 5'
      TabOrder = 4
      object DBGrid5: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento5
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
    object _grbPrazoPed_06: TGroupBox
      Left = 675
      Top = 42
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 6'
      TabOrder = 5
      object DBGrid6: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento6
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
    object _grbPrazoPed_07: TGroupBox
      Left = 807
      Top = 42
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 7'
      TabOrder = 6
      object DBGrid7: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento8
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
    object _grbPrazoPed_08: TGroupBox
      Left = 937
      Top = 40
      Width = 125
      Height = 125
      Caption = 'Prazo Pedido 8'
      TabOrder = 7
      object DBGrid8: TDBGrid
        Left = 2
        Top = 15
        Width = 121
        Height = 108
        Align = alClient
        Ctl3D = False
        DataSource = _dsCondicaoPagamento8
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
    object _dtpPedido_01: TDateTimePicker
      Left = 57
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 8
      OnExit = _dtpPedido_01Exit
    end
    object _dtpPedido_02: TDateTimePicker
      Left = 144
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 9
      OnExit = _dtpPedido_02Exit
    end
    object _dtpPedido_03: TDateTimePicker
      Left = 273
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 10
      OnExit = _dtpPedido_03Exit
    end
    object _dtpPedido_04: TDateTimePicker
      Left = 405
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 11
      OnExit = _dtpPedido_04Exit
    end
    object _dtpPedido_05: TDateTimePicker
      Left = 538
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 12
      OnExit = _dtpPedido_05Exit
    end
    object _dtpPedido_06: TDateTimePicker
      Left = 675
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 13
      OnExit = _dtpPedido_06Exit
    end
    object _dtpPedido_07: TDateTimePicker
      Left = 808
      Top = 21
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 14
      OnExit = _dtpPedido_07Exit
    end
    object _dtpPedido_08: TDateTimePicker
      Left = 938
      Top = 15
      Width = 81
      Height = 21
      Date = 41710.668630983800000000
      Time = 41710.668630983800000000
      TabOrder = 15
      OnExit = _dtpPedido_08Exit
    end
  end
  object _cdsPercentualPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 8
    object _cdsPercentualPedidoNR_PEDIDO: TIntegerField
      DisplayLabel = 'Nr. de Pedido(s)'
      FieldName = 'NR_PEDIDO'
    end
    object _cdsPercentualPedidoPC_PEDIDO: TFloatField
      DisplayLabel = '% P/Pedido'
      FieldName = 'PC_PEDIDO'
      OnValidate = _cdsPercentualPedidoPC_PEDIDOValidate
    end
    object _cdsPercentualPedidoID_SELECIONADO: TStringField
      FieldName = 'ID_SELECIONADO'
      Size = 1
    end
  end
  object _dsPercentualPedido: TDataSource
    DataSet = _cdsPercentualPedido
    Left = 200
    Top = 64
  end
  object _dsPedidoNovo: TDataSource
    DataSet = _cdsPedidoNovo
    Left = 312
    Top = 224
  end
  object _cdsPedidoNovo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 400
    Top = 232
  end
  object _cdsCondicaoPagamento1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 400
    object _cdsCondicaoPagamento1NR_PARCELA: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object _cdsCondicaoPagamento1NR_DIAS: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento1: TDataSource
    DataSet = _cdsCondicaoPagamento1
    Left = 80
    Top = 400
  end
  object _cdsCondicaoPagamento2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 396
    object AutoIncField1: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento2: TDataSource
    DataSet = _cdsCondicaoPagamento2
    Left = 216
    Top = 388
  end
  object _cdsCondicaoPagamento3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 400
    object AutoIncField2: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento3: TDataSource
    DataSet = _cdsCondicaoPagamento3
    Left = 352
    Top = 392
  end
  object _cdsCondicaoPagamento4: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 408
    object AutoIncField3: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento4: TDataSource
    DataSet = _cdsCondicaoPagamento4
    Left = 496
    Top = 416
  end
  object _cdsCondicaoPagamento5: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 577
    Top = 417
    object AutoIncField4: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento5: TDataSource
    DataSet = _cdsCondicaoPagamento5
    Left = 617
    Top = 417
  end
  object _cdsCondicaoPagamento6: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 701
    Top = 409
    object AutoIncField5: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento6: TDataSource
    DataSet = _cdsCondicaoPagamento6
    Left = 741
    Top = 417
  end
  object _cdsCondicaoPagamento7: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 834
    Top = 417
    object AutoIncField6: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento7: TDataSource
    DataSet = _cdsCondicaoPagamento7
    Left = 890
    Top = 425
  end
  object _cdsCondicaoPagamento8: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 943
    Top = 425
    object AutoIncField7: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Nr. Parc.'
      DisplayWidth = 3
      FieldName = 'NR_PARCELA'
      ReadOnly = True
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'Prazo'
      DisplayWidth = 3
      FieldName = 'NR_DIAS'
    end
  end
  object _dsCondicaoPagamento8: TDataSource
    DataSet = _cdsCondicaoPagamento8
    Left = 999
    Top = 433
  end
end
