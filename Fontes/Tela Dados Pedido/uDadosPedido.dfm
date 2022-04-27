object _frmDadosPedido: T_frmDadosPedido
  Left = 0
  Top = 0
  Caption = 'Dados Pedido/entrada'
  ClientHeight = 265
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  PrintScale = poNone
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 246
    Width = 714
    Height = 19
    Panels = <
      item
        Text = 'Pressione <Enter> ou <Esc> para fechar janela'
        Width = 50
      end>
    ExplicitWidth = 681
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 714
    Height = 201
    Align = alTop
    Caption = 'GroupBox1'
    TabOrder = 1
    ExplicitWidth = 681
    object _dbgDadosPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 710
      Height = 184
      Align = alClient
      DataSource = _dsDadosPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object _cdsDadosPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 90
  end
  object _dsDadosPedido: TDataSource
    DataSet = _cdsDadosPedido
    Left = 352
    Top = 66
  end
end
