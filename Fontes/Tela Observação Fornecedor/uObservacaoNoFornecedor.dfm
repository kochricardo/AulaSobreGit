object _frmObservacaoLaboratorio: T_frmObservacaoLaboratorio
  Left = 0
  Top = 0
  Caption = 'Lembrete para Fornecedor'
  ClientHeight = 386
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 497
    Height = 265
    Align = alTop
    Caption = 'Observa'#231#227'o'
    TabOrder = 0
    object _mmObservacao: TMemo
      Left = 2
      Top = 15
      Width = 493
      Height = 248
      Align = alClient
      TabOrder = 0
      OnKeyPress = _mmObservacaoKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 265
    Width = 497
    Height = 120
    Align = alTop
    Caption = 'Observa'#231#227'o Valida'
    TabOrder = 1
    object Label1: TLabel
      Left = 80
      Top = 52
      Width = 94
      Height = 13
      Caption = 'Observ. Valida At'#233':'
    end
    object Label2: TLabel
      Left = 81
      Top = 14
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object _dtpObservacao: TDateTimePicker
      Left = 80
      Top = 66
      Width = 121
      Height = 21
      Date = 42968.748572210650000000
      Time = 42968.748572210650000000
      TabOrder = 0
    end
    object _btnGravaObservacao: TBitBtn
      Left = 248
      Top = 55
      Width = 153
      Height = 25
      Caption = 'Grava Observa'#231#227'o'
      DoubleBuffered = True
      Glyph.Data = {
        42030000424D42030000000000003600000028000000110000000F0000000100
        1800000000000C030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000FFFFFFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF7F00007F00007F0000FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F0000
        7F0000FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF00000000000000
        00000000000000007F00007F00007F0000FFFFFF7F00007F0000FFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFF7F00007F00007F
        0000FFFFFF000000BFBFBF7F00007F0000FFFFFFBFBFBFBFBFBFBFBFBF00BFBF
        BF000000FFFFFF7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF000000BFBFBFBF
        BFBF7F0000FFFFFFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF7F0000FFFFFFBF
        BFBFBFBFBF00BFBFBF000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF
        FF000000BFBFBFBFBFBFBFBFBFBFBFBF7F0000FFFFFFBFBFBF00BFBFBF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F0000FFFFFF00BFBFBF000000FFFFFF7F7F7F7F7F7FBFBFBF
        BFBFBFBFBFBFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00
        0000BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F
        7F7F7F7F7FBFBFBF000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
        BF000000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBF00}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = _btnGravaObservacaoClick
    end
    object _edtNrFornecedor: TEdit
      Left = 80
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNomeFornecedor: TEdit
      Left = 207
      Top = 28
      Width = 258
      Height = 21
      TabOrder = 3
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 99
      Width = 493
      Height = 19
      Panels = <
        item
          Text = '<Esc> fecha Janela'
          Width = 250
        end
        item
          Width = 50
        end>
      SimpleText = '<Esc> fecha Janela'
      ExplicitLeft = 280
      ExplicitTop = 112
      ExplicitWidth = 0
    end
  end
end
