object _frmPrecoDesconto: T_frmPrecoDesconto
  Left = 370
  Top = 216
  BorderStyle = bsSingle
  Caption = 'Pre'#231'o Desconto Item'
  ClientHeight = 346
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 184
    Width = 67
    Height = 13
    Caption = 'Lista de Pre'#231'o'
  end
  object GroupBox1: TGroupBox
    Left = 134
    Top = 7
    Width = 213
    Height = 330
    Caption = 'Informa'#231#227'o de Compra do Item SC'
    Color = clMoneyGreen
    Ctl3D = False
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 0
    object _lbePrecoFornecedorSC: TLabeledEdit
      Left = 101
      Top = 16
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
    object _lbeDescontorepasseSC: TLabeledEdit
      Left = 101
      Top = 41
      Width = 70
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
    object _lbeDescontoPadraoSC: TLabeledEdit
      Left = 101
      Top = 66
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
    object _lbeDescontoAdicionalSC: TLabeledEdit
      Left = 101
      Top = 91
      Width = 70
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      EditLabel.Width = 88
      EditLabel.Height = 13
      EditLabel.Caption = 'Dsc Adicional (-%)'
      LabelPosition = lpLeft
      LabelSpacing = 11
      ParentCtl3D = False
      TabOrder = 3
      OnKeyDown = _lbeDescontoAdicionalSCKeyDown
    end
    object _lbePrecoNotaSC: TLabeledEdit
      Left = 101
      Top = 131
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
      OnKeyDown = _lbePrecoNotaSCKeyDown
    end
    object _lbeValorCreditoIcmsSC: TLabeledEdit
      Left = 101
      Top = 153
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
    object _lbePrecoCustoSC: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 175
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
    object _lbeValorVerbaSC: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 197
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
    object _lbeNumeroVerbaSC: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 220
      Width = 70
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero p/ Verba'
      LabelPosition = lpLeft
      LabelSpacing = 13
      ParentCtl3D = False
      TabOrder = 8
      OnKeyDown = _lbeNumeroVerbaSCKeyDown
    end
    object _lbePcVerbaSC: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 242
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
    end
    object _chkPcParaVerbaSC: TCheckBox
      Left = 17
      Top = 264
      Width = 81
      Height = 17
      Caption = '% p/ Verba'
      TabOrder = 10
    end
  end
  object _rgbPreco: TGroupBox
    Left = 353
    Top = 9
    Width = 213
    Height = 329
    Caption = 'Informa'#231#227'o de Compra do Item RS'
    Color = clInactiveCaption
    Ctl3D = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object _lbePrecoFornecedorRS: TLabeledEdit
      Left = 101
      Top = 16
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
    object _lbeDescontorepasseRS: TLabeledEdit
      Left = 101
      Top = 41
      Width = 70
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
    object _lbeDescontoPadraoRS: TLabeledEdit
      Left = 101
      Top = 66
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
    object _lbeDescontoAdicionalRS: TLabeledEdit
      Left = 101
      Top = 91
      Width = 70
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      EditLabel.Width = 88
      EditLabel.Height = 13
      EditLabel.Caption = 'Dsc Adicional (-%)'
      LabelPosition = lpLeft
      LabelSpacing = 11
      ParentCtl3D = False
      TabOrder = 3
    end
    object _lbePrecoNotaRS: TLabeledEdit
      Left = 101
      Top = 130
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
    end
    object _lbeValorCreditoIcmsRS: TLabeledEdit
      Left = 101
      Top = 152
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
    object _lbePrecoCustoRS: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 174
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
    object _lbeValorVerbaRS: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 196
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
    object _lbeNumeroVerbaRS: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 219
      Width = 70
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero p/ Verba'
      LabelPosition = lpLeft
      LabelSpacing = 13
      ParentCtl3D = False
      TabOrder = 8
    end
    object _lbePcVerbaRS: TLabeledEdit
      AlignWithMargins = True
      Left = 101
      Top = 241
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
    end
    object _chkPcParaVerbaRS: TCheckBox
      Left = 17
      Top = 263
      Width = 81
      Height = 17
      Caption = '% p/ Verba'
      TabOrder = 10
    end
  end
  object _chkFixaDescontoAdicional: TCheckBox
    Left = 8
    Top = 85
    Width = 120
    Height = 17
    Caption = 'Fixa Desc. Adicional'
    TabOrder = 2
  end
  object _chkSemDescontoAdicional: TCheckBox
    Left = 8
    Top = 105
    Width = 120
    Height = 17
    Caption = 'Sem Desc. Adicional'
    TabOrder = 3
  end
  object _chkDigitaPrecoNota: TCheckBox
    Left = 8
    Top = 125
    Width = 120
    Height = 17
    Caption = 'Digitar Pre'#231'o Nota'
    TabOrder = 4
    OnClick = _chkDigitaPrecoNotaClick
  end
  object _chkMostraUltimoDesconto: TCheckBox
    Left = 8
    Top = 146
    Width = 120
    Height = 17
    Caption = 'Mostra Ult. Desc.'
    TabOrder = 5
  end
  object _cbxListaPreco: TComboBox
    Left = 8
    Top = 203
    Width = 82
    Height = 21
    ItemIndex = 0
    TabOrder = 6
    Text = 'Atual'
    Items.Strings = (
      'Atual'
      'Anterior')
  end
end
