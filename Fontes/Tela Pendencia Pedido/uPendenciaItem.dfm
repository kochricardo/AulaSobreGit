object _frmPendenciaItem: T_frmPendenciaItem
  Left = 0
  Top = 0
  Caption = 'Pendencia do Item'
  ClientHeight = 354
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 53
    Top = 268
    Width = 122
    Height = 13
    Caption = 'Pendencia no Fornecedor'
  end
  object Label2: TLabel
    Left = 53
    Top = 295
    Width = 141
    Height = 13
    Caption = 'Qtdade Faturada Fornecedor'
  end
  object Label3: TLabel
    Left = 333
    Top = 268
    Width = 81
    Height = 13
    Caption = 'Qtd. Em Transito'
  end
  object Label4: TLabel
    Left = 333
    Top = 241
    Width = 107
    Height = 13
    Caption = 'Qtde em Crossdocking'
  end
  object Label5: TLabel
    Left = 53
    Top = 241
    Width = 57
    Height = 13
    Caption = 'Qtd. Pedido'
  end
  object _dbgPendencia: TDBGrid
    Left = 0
    Top = 0
    Width = 1071
    Height = 217
    DataSource = _dsPendencia
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = _dbgPendenciaDrawColumnCell
    OnDblClick = _dbgPendenciaDblClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 335
    Width = 1071
    Height = 19
    Panels = <
      item
        Text = '<F5> Elimina Pend'#234'ncia do Item'
        Width = 50
      end>
  end
  object _edtQtdPedencia: TEdit
    Left = 200
    Top = 260
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 2
  end
  object _edtQtdeProcessada: TEdit
    Left = 200
    Top = 287
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 3
  end
  object _edtQtdTransito: TEdit
    Left = 461
    Top = 260
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 4
  end
  object _edtQtdCrossdocking: TEdit
    Left = 461
    Top = 233
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 5
  end
  object _edtQtdPedido: TEdit
    Left = 200
    Top = 233
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 692
    Top = 223
    Width = 320
    Height = 85
    DataSource = _dsTemp
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 32
  end
  object _dsPendencia: TDataSource
    DataSet = _cdsPendencia
    Left = 408
    Top = 32
  end
  object _dsTemp: TDataSource
    Left = 320
    Top = 32
  end
end
