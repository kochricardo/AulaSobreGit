object _frmAgendaCompras: T_frmAgendaCompras
  Left = 123
  Top = 0
  Caption = 'Agenda Comprador'
  ClientHeight = 494
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 475
    Width = 614
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 450
      end
      item
        Width = 200
      end>
  end
  object _lbeComprador: TLabeledEdit
    Left = 26
    Top = 28
    Width = 75
    Height = 19
    Ctl3D = False
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Comprador'
    ParentCtl3D = False
    TabOrder = 1
    OnExit = _lbeCompradorExit
    OnKeyDown = _lbeCompradorKeyDown
  end
  object _lbeNrLaboratorio: TLabeledEdit
    Left = 25
    Top = 69
    Width = 76
    Height = 19
    Ctl3D = False
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Nr. Laborat'#243'rio'
    ParentCtl3D = False
    TabOrder = 2
    OnKeyDown = _lbeNrLaboratorioKeyDown
    OnKeyPress = _lbeNrLaboratorioKeyPress
  end
  object _lbeNomeLaboratorio: TLabeledEdit
    Left = 109
    Top = 70
    Width = 317
    Height = 19
    Ctl3D = False
    EditLabel.Width = 85
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Laborat'#243'rio'
    ParentCtl3D = False
    TabOrder = 3
  end
  object _dbgAgenda: TDBGrid
    Left = 0
    Top = 112
    Width = 614
    Height = 363
    Align = alBottom
    DataSource = _dsAgendaLaboratorio
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = _dbgAgendaDrawColumnCell
    OnDblClick = _dbgAgendaDblClick
    OnKeyDown = _dbgAgendaKeyDown
  end
  object _lbeNomeComprador: TLabeledEdit
    Left = 107
    Top = 28
    Width = 317
    Height = 19
    Ctl3D = False
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Comprador'
    ParentCtl3D = False
    TabOrder = 5
  end
  object _cdsAgendaLaboratorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 512
    Top = 40
  end
  object _dsAgendaLaboratorio: TDataSource
    DataSet = _cdsAgendaLaboratorio
    Left = 512
    Top = 8
  end
end
