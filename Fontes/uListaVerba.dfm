object _frmListaVerbaFornecedor: T_frmListaVerbaFornecedor
  Left = 0
  Top = 0
  Caption = 'Lista de Verb Fornecedor'
  ClientHeight = 296
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 568
    Height = 225
    Align = alTop
    Caption = 'Verbas Disponiveis'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 564
      Height = 208
      Align = alClient
      DataSource = _dsVerbaDisponiveis
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object _cdsVerbaDisponiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 64
  end
  object _dsVerbaDisponiveis: TDataSource
    DataSet = _cdsVerbaDisponiveis
    Left = 304
    Top = 64
  end
end
