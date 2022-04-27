object _frmConfirmaPedido: T_frmConfirmaPedido
  Left = 453
  Top = 86
  Caption = 'Fechando Pedido'
  ClientHeight = 522
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _lbNrVerbaSC: TLabel
    Left = 156
    Top = 227
    Width = 59
    Height = 13
    Caption = 'Nr.Verba SC'
  end
  object _lbNrVerbaRS: TLabel
    Left = 499
    Top = 227
    Width = 43
    Height = 13
    Caption = 'Nr.Verba'
  end
  object Label12: TLabel
    Left = 228
    Top = 458
    Width = 78
    Height = 13
    Caption = 'Pr'#243'xima Agenda'
  end
  object Label1: TLabel
    Left = 325
    Top = 458
    Width = 90
    Height = 13
    Caption = 'Operador Logistico'
    Visible = False
  end
  object Label2: TLabel
    Left = 543
    Top = 423
    Width = 57
    Height = 13
    Caption = 'Pedido Para'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 503
    Width = 685
    Height = 19
    Panels = <>
  end
  object GroupBox10: TGroupBox
    Left = 21
    Top = 10
    Width = 164
    Height = 148
    Caption = 'Totais do Pedido CD SC'
    TabOrder = 1
    object GroupBox11: TGroupBox
      Left = 4
      Top = 14
      Width = 156
      Height = 57
      Caption = 'Unidades'
      TabOrder = 0
      object _lbeSugeridoSC: TLabeledEdit
        Left = 61
        Top = 10
        Width = 90
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
      end
      object _lbeCompradoSC: TLabeledEdit
        Left = 61
        Top = 31
        Width = 90
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
      end
    end
    object GroupBox12: TGroupBox
      Left = 4
      Top = 71
      Width = 156
      Height = 74
      Caption = 'Valor'
      TabOrder = 1
      object _lbeValorSugeridoSC: TLabeledEdit
        Left = 61
        Top = 10
        Width = 90
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
      end
      object _lbeValorCompradoSC: TLabeledEdit
        Left = 61
        Top = 30
        Width = 90
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
      end
      object _lbeValorCompradoCustoSC: TLabeledEdit
        Left = 61
        Top = 50
        Width = 90
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
      end
    end
  end
  object _chkObservacaoPedidoSC: TCheckBox
    Left = 19
    Top = 348
    Width = 164
    Height = 17
    Caption = 'Observa'#231#227'o  Pedido'
    TabOrder = 2
    OnClick = _chkObservacaoPedidoSCClick
  end
  object _edtObservacaoPedidoSC: TEdit
    Left = 19
    Top = 371
    Width = 240
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    Enabled = False
    MaxLength = 40
    ParentCtl3D = False
    TabOrder = 3
  end
  object _chkObservacaoPedidoRS: TCheckBox
    Left = 357
    Top = 347
    Width = 164
    Height = 17
    Caption = 'Observa'#231#227'o  Pedido'
    TabOrder = 4
    OnClick = _chkObservacaoPedidoRSClick
  end
  object _edtObservacaoPedidoRS: TEdit
    Left = 357
    Top = 370
    Width = 240
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    Enabled = False
    MaxLength = 40
    ParentCtl3D = False
    TabOrder = 5
  end
  object _chkImprimirSC: TCheckBox
    Left = 19
    Top = 391
    Width = 164
    Height = 17
    Caption = 'Imprimir Pedido SC'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
  end
  object _chkImprimirRS: TCheckBox
    Left = 357
    Top = 392
    Width = 164
    Height = 17
    Caption = 'Imprimir Pedido RS'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 7
  end
  object _chkGeraExcelRS: TCheckBox
    Left = 357
    Top = 415
    Width = 164
    Height = 17
    Caption = 'Gera Excel Pedido RS'
    Checked = True
    Ctl3D = False
    ParentCtl3D = False
    State = cbChecked
    TabOrder = 8
  end
  object _chkGeraExcelSC: TCheckBox
    Left = 19
    Top = 408
    Width = 164
    Height = 17
    Caption = 'Gera Excel Pedido SC'
    Checked = True
    Ctl3D = False
    ParentCtl3D = False
    State = cbChecked
    TabOrder = 9
  end
  object GroupBox13: TGroupBox
    Left = 359
    Top = 11
    Width = 164
    Height = 148
    Caption = 'Totais do Pedido CD RS'
    TabOrder = 10
    object GroupBox14: TGroupBox
      Left = 3
      Top = 12
      Width = 156
      Height = 57
      Caption = 'Unidades'
      TabOrder = 0
      object _lbeSugeridoRS: TLabeledEdit
        Left = 61
        Top = 10
        Width = 90
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
      end
      object _lbeCompradoRS: TLabeledEdit
        Left = 61
        Top = 31
        Width = 90
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
      end
    end
    object GroupBox15: TGroupBox
      Left = 3
      Top = 70
      Width = 156
      Height = 74
      Caption = 'Valor'
      TabOrder = 1
      object _lbeValorSugeridoRS: TLabeledEdit
        Left = 61
        Top = 10
        Width = 90
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
      end
      object _lbeValorCompradoRS: TLabeledEdit
        Left = 61
        Top = 30
        Width = 90
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
      end
      object _lbeValorCompradoCustoRS: TLabeledEdit
        Left = 61
        Top = 50
        Width = 90
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
      end
    end
  end
  object _grbParcelaPrazo: TGroupBox
    Left = 25
    Top = 164
    Width = 125
    Height = 170
    Caption = 'Prazo Pedido'
    TabOrder = 11
    object _dbgPrazoSC: TDBGrid
      Left = 2
      Top = 15
      Width = 121
      Height = 153
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
    end
  end
  object _btnDividePedidoSC: TBitBtn
    Left = 156
    Top = 317
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
    TabOrder = 12
    OnClick = _btnDividePedidoSCClick
  end
  object GroupBox23: TGroupBox
    Left = 362
    Top = 161
    Width = 125
    Height = 170
    Caption = 'Prazo Pedido'
    TabOrder = 13
    object _dbgPrazoRS: TDBGrid
      Left = 2
      Top = 15
      Width = 121
      Height = 153
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
    end
  end
  object BitBtn1: TBitBtn
    Left = 493
    Top = 304
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
    TabOrder = 14
    OnClick = BitBtn1Click
  end
  object _chkBonificaPedidoSC: TCheckBox
    Left = 154
    Top = 202
    Width = 164
    Height = 17
    Caption = 'Bonificar Pedido SC'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 15
    OnClick = _chkBonificaPedidoSCClick
  end
  object _chkBonificaPedidoRS: TCheckBox
    Left = 493
    Top = 204
    Width = 110
    Height = 17
    Caption = 'Bonificar Pedido RS'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 16
    OnClick = _chkBonificaPedidoRSClick
  end
  object _btnConfirma: TBitBtn
    Left = 543
    Top = 468
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
    TabOrder = 17
    OnClick = _btnConfirmaClick
  end
  object BitBtn2: TBitBtn
    Left = 21
    Top = 477
    Width = 131
    Height = 25
    Caption = 'Cancelar Pedido'
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 18
    OnClick = BitBtn2Click
  end
  object _edtNrVerbaSC: TEdit
    Left = 156
    Top = 246
    Width = 100
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    NumbersOnly = True
    ParentCtl3D = False
    TabOrder = 19
    OnKeyDown = _edtNrVerbaSCKeyDown
  end
  object _edtNrVerbaRS: TEdit
    Left = 499
    Top = 242
    Width = 100
    Height = 19
    Alignment = taRightJustify
    Ctl3D = False
    NumbersOnly = True
    ParentCtl3D = False
    TabOrder = 20
    OnKeyDown = _edtNrVerbaRSKeyDown
  end
  object _dtpProximaAgenda: TDateTimePicker
    Left = 226
    Top = 477
    Width = 80
    Height = 21
    Date = 40578.465110127320000000
    Time = 40578.465110127320000000
    TabOrder = 21
  end
  object _chkRelatorioPrecoCusto: TCheckBox
    Left = 19
    Top = 427
    Width = 145
    Height = 17
    Caption = 'Relatorio C/Preco Custo'
    TabOrder = 22
  end
  object _chkMostraDesconto: TCheckBox
    Left = 19
    Top = 454
    Width = 164
    Height = 17
    Caption = 'Mostra Coluna % Desc.'
    Checked = True
    State = cbChecked
    TabOrder = 23
  end
  object _cbOPeradorLogistico: TComboBox
    Left = 325
    Top = 477
    Width = 198
    Height = 21
    TabOrder = 24
    Text = '_cbOperadorLogistico'
    Visible = False
  end
  object _dtpPedido: TDateTimePicker
    Left = 543
    Top = 441
    Width = 80
    Height = 21
    Date = 40578.465110127320000000
    Time = 40578.465110127320000000
    TabOrder = 25
  end
  object _cdsCondicaoPagamentoCDSC: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 200
    object _cdsCondicaoPagamentoCDSCnrParcela: TIntegerField
      DisplayLabel = 'Nr.Parcelas'
      FieldName = 'nrParcela'
    end
    object _cdsCondicaoPagamentoCDSCnrDiasPrazo: TIntegerField
      DisplayLabel = 'Dias Prazo'
      FieldName = 'nrDiasPrazo'
    end
    object _cdsCondicaoPagamentoCDSCnrCondicao: TIntegerField
      FieldName = 'nrCondicao'
      Visible = False
    end
  end
  object _dsParcelaPrazoCDSC: TDataSource
    DataSet = _cdsCondicaoPagamentoCDSC
    Left = 88
    Top = 238
  end
  object _cdsCondicaoPagamentoCDRS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 232
    object _cdsCondicaoPagamentoCDRSnrParcela: TIntegerField
      FieldName = 'nrParcela'
    end
  end
  object _dsParcelaPrazoCDRS: TDataSource
    DataSet = _cdsCondicaoPagamentoCDRS
    Left = 408
    Top = 202
  end
end
