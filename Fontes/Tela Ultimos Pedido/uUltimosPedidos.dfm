object _frmUltimosPedidos: T_frmUltimosPedidos
  Left = 0
  Top = 0
  Caption = 'Ultimos Pedidos'
  ClientHeight = 473
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 454
    Width = 798
    Height = 19
    Panels = <
      item
        Text = '<Esc> para fechar Tela'
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 798
    Height = 454
    Align = alClient
    Caption = 'Pedidos'
    TabOrder = 1
    object _dbgUltimosPedido: TDBGrid
      Left = 2
      Top = 15
      Width = 794
      Height = 437
      Align = alClient
      DataSource = _dsUltimosPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgUltimosPedidoDrawColumnCell
    end
  end
  object _cdsUltimosPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 672
    Top = 48
  end
  object _dsUltimosPedido: TDataSource
    DataSet = _cdsUltimosPedido
    Left = 568
    Top = 48
  end
end
