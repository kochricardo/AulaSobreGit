object _frmDigitacaoItemPedido: T_frmDigitacaoItemPedido
  Left = 0
  Top = 0
  Caption = 'Dados Item Pedido'
  ClientHeight = 292
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _lbeSomaDesconto: TLabel
    Left = 321
    Top = 85
    Width = 91
    Height = 13
    Alignment = taRightJustify
    Caption = '_lbeSomaDesconto'
  end
  object _lbePrecoListaGrid: TLabeledEdit
    Left = 342
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
    TabOrder = 4
  end
  object _lbeDescontoPadraoGrid: TLabeledEdit
    Left = 342
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
    TabOrder = 5
  end
  object _lbeDescontoAdicionalGrid: TLabeledEdit
    Left = 342
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
    TabOrder = 2
  end
  object _lbePrecoNotaGrid: TLabeledEdit
    Left = 342
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
    TabOrder = 6
  end
  object _lbeValorCreditoIcmsGrid: TLabeledEdit
    Left = 342
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
    TabOrder = 7
  end
  object _lbePrecoCustoGrid: TLabeledEdit
    AlignWithMargins = True
    Left = 342
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
    TabOrder = 8
  end
  object _lbeValorVerbaGrid: TLabeledEdit
    AlignWithMargins = True
    Left = 342
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
    TabOrder = 9
  end
  object _lbeNumeroVerbaGrid: TLabeledEdit
    AlignWithMargins = True
    Left = 342
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
    TabOrder = 3
  end
  object _lbePcVerbaGrid: TLabeledEdit
    AlignWithMargins = True
    Left = 342
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
    TabOrder = 10
  end
  object _lbeSugestaoIdealGrid: TLabeledEdit
    Left = 126
    Top = 150
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
    TabOrder = 11
  end
  object _lbeSugestaoPossivelGrid: TLabeledEdit
    Left = 126
    Top = 173
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
    TabOrder = 12
  end
  object _lbeDiasEstoque: TLabeledEdit
    Left = 126
    Top = 223
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
    TabOrder = 1
    OnKeyDown = _lbeDiasEstoqueKeyDown
  end
  object _lbeQuantidadePedido: TLabeledEdit
    Left = 126
    Top = 198
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
    TabOrder = 0
    OnKeyDown = _lbeQuantidadePedidoKeyDown
  end
end
