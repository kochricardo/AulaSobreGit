object _frmPedidoEmAnalise: T_frmPedidoEmAnalise
  Left = 0
  Top = 0
  Caption = 'Pedido Gerado Pela Api'
  ClientHeight = 581
  ClientWidth = 1512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 562
    Width = 1512
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end>
    ExplicitLeft = 720
    ExplicitTop = 536
    ExplicitWidth = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1512
    Height = 497
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Pedidos em Analise'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1508
      Height = 480
      Align = alClient
      DataSource = _dsPedidoemAnalise
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 497
    Width = 1512
    Height = 154
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    ExplicitTop = 408
    ExplicitWidth = 1022
  end
  object _cdsPedidoemAnalise: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 160
  end
  object _dsPedidoemAnalise: TDataSource
    Left = 608
    Top = 160
  end
end
