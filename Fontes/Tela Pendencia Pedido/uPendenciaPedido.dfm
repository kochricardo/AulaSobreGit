object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pendencia do Item'
  ClientHeight = 236
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 382
    Height = 236
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 24
  end
  object _dsPendencia: TDataSource
    DataSet = _cdsPendencia
    Left = 312
    Top = 24
  end
end
