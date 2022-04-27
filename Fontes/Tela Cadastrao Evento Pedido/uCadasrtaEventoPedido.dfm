object _frmCadastraEventoPedido: T_frmCadastraEventoPedido
  Left = 0
  Top = 0
  Caption = 'Corrige Falta Evento Pedido'
  ClientHeight = 368
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object _grPedidoSemEvento: TGroupBox
    Left = 0
    Top = 6
    Width = 641
    Height = 163
    Caption = 'Pedidos Sem Eventos'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 637
      Height = 146
      Cursor = crDrag
      Align = alClient
      DataSource = _dsPedidoSemEventos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 208
    Width = 169
    Height = 25
    Caption = 'Carrega Pedidos'
    DoubleBuffered = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000000000088880FFFFFFFFFF088880F00F00000F088880FFFFFFFFFF0
      88880F00F00000F088880FFFFFFFFFF088880FFFFFFF0FF088880F00FFF080F0
      88880F080F08080008440FF08080808880440000080808888844888880808888
      8844888888088888804488888880000008448888888888888888}
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 384
    Top = 208
    Width = 177
    Height = 25
    Caption = 'Cadastra Events'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object _cdsPedidoSemEventos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 72
  end
  object _dsPedidoSemEventos: TDataSource
    DataSet = _cdsPedidoSemEventos
    Left = 512
    Top = 72
  end
end
