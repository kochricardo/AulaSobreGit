object _frmAterandoItemPedido: T_frmAterandoItemPedido
  Left = 0
  Top = 0
  Caption = 'Alterando Item Pedido'
  ClientHeight = 259
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 63
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 100
    Top = 63
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label3: TLabel
    Left = 14
    Top = 121
    Width = 53
    Height = 13
    Caption = 'Pre'#231'o Unit.'
  end
  object Label4: TLabel
    Left = 100
    Top = 121
    Width = 83
    Height = 13
    Caption = '% Desc.Adicional'
  end
  object Label5: TLabel
    Left = 198
    Top = 121
    Width = 46
    Height = 13
    Caption = 'Nr. Verba'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 240
    Width = 473
    Height = 19
    Panels = <>
  end
  object _edtCodigoProduto: TEdit
    Left = 13
    Top = 80
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object _edtPreçoUnitario: TEdit
    Left = 13
    Top = 136
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object _edtpcDescontoAdicional: TEdit
    Left = 100
    Top = 136
    Width = 83
    Height = 21
    TabOrder = 3
  end
  object _edtNrVerba: TEdit
    Left = 198
    Top = 136
    Width = 65
    Height = 21
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 100
    Top = 80
    Width = 346
    Height = 21
    TabOrder = 5
  end
end
