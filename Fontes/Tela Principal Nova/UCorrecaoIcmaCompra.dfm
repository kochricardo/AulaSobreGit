object _frmCorrecaoIcmCompra: T_frmCorrecaoIcmCompra
  Left = 0
  Top = 0
  Caption = 'Corre'#231#227'o Icm Compra'
  ClientHeight = 425
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 406
    Width = 874
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 874
    Height = 313
    Align = alTop
    Caption = 'GroupBox1'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 870
      Height = 296
      Align = alClient
      DataSource = _dsItemSemIcmCompra
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 336
    Width = 161
    Height = 25
    Caption = 'Abre Item Com Problemas'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 408
    Top = 336
    Width = 169
    Height = 25
    Caption = 'Corrige Item'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object _cdsItemSemIcmCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 72
  end
  object _dsItemSemIcmCompra: TDataSource
    DataSet = _cdsItemSemIcmCompra
    Left = 384
    Top = 72
  end
end
