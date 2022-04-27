object _frmCadastroParametro: T_frmCadastroParametro
  Left = 0
  Top = 0
  Caption = 'Cadastro de Parametro Fornecedor'
  ClientHeight = 438
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 965
    Height = 419
    ActivePage = _tbsParametro
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 168
    ExplicitTop = 40
    ExplicitWidth = 289
    ExplicitHeight = 193
    object _tbsParametro: TTabSheet
      Caption = 'Parametro'
      ExplicitLeft = -20
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label1: TLabel
        Left = 24
        Top = 13
        Width = 87
        Height = 13
        Caption = 'Grupo Fornecedor'
      end
      object _edtDivisaoFornecedor: TLabel
        Left = 117
        Top = 13
        Width = 92
        Height = 13
        Caption = 'Divisao Fornecedor'
      end
      object _edtGrupoFornecedor: TEdit
        Left = 24
        Top = 29
        Width = 87
        Height = 21
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 117
        Top = 29
        Width = 300
        Height = 21
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 664
        Top = 96
        Width = 113
        Height = 120
        DataSource = _dsAgenda
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object _dtpData: TDateTimePicker
        Left = 472
        Top = 120
        Width = 105
        Height = 21
        Date = 44545.495232824080000000
        Time = 44545.495232824080000000
        TabOrder = 3
        OnClick = _dtpDataClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 419
    Width = 965
    Height = 19
    Panels = <>
    ExplicitLeft = 424
    ExplicitTop = 0
    ExplicitWidth = 0
  end
  object _cdsAgenda: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 56
    Data = {
      420000009619E0BD01000000180000000200000000000300000042000B636453
      657175656E63696104000100000000000B446174615F4167656E646104000600
      000000000000}
    object _cdsAgendacdSequencia: TIntegerField
      FieldName = 'cdSequencia'
      Visible = False
    end
    object _cdsAgendaData_Agenda: TDateField
      FieldName = 'Data_Agenda'
    end
  end
  object _dsAgenda: TDataSource
    DataSet = _cdsAgenda
    Left = 744
    Top = 48
  end
end
