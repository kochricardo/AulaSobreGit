object _frRelatorioCriticaQuantidade: T_frRelatorioCriticaQuantidade
  Left = 337
  Top = 293
  BorderIcons = [biSystemMenu]
  Caption = 
    'Relat'#243'rio - Planilha Cr'#237'tica de Pedido - Diverg'#234'ncia de Quantida' +
    'de'
  ClientHeight = 116
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 89
    Top = 38
    Width = 334
    Height = 29
    Caption = 'Gerando planilha. Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 97
    Width = 512
    Height = 19
    Panels = <>
  end
  object Timer1: TTimer
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 24
    Top = 40
  end
  object _cdsCriticaDivergenciaQuantidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 24
  end
end
