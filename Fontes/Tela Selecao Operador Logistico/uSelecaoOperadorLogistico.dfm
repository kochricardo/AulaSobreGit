object _frmSelecaoOPeradorLogistico: T_frmSelecaoOPeradorLogistico
  Left = 288
  Top = 130
  BorderIcons = [biMinimize]
  Caption = 'Selecionar OPerador'
  ClientHeight = 347
  ClientWidth = 619
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 328
    Width = 619
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 619
    Height = 328
    Align = alClient
    Caption = 'Oparadores Logisticos'
    TabOrder = 1
    object _dbgOperadorLogistico: TDBGrid
      Left = 2
      Top = 15
      Width = 615
      Height = 311
      Align = alClient
      Ctl3D = False
      DataSource = _dsOperadorLogistico
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgOperadorLogisticoDrawColumnCell
      OnDblClick = _dbgOperadorLogisticoDblClick
      OnKeyDown = _dbgOperadorLogisticoKeyDown
    end
  end
  object _dsOperadorLogistico: TDataSource
    DataSet = _cdsOperadorLogistico
    Left = 344
    Top = 64
  end
  object _cdsOperadorLogistico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 240
    Top = 64
  end
end
