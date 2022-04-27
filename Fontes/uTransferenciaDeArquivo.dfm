object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 236
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 383
    Height = 54
    Align = alTop
    Caption = 'Op'#231#245'es'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 37
      Height = 13
      Caption = 'Arquivo'
    end
    object Edit1: TEdit
      Left = 62
      Top = 20
      Width = 313
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 127
    Width = 383
    Height = 90
    Align = alTop
    Caption = 'Status'
    TabOrder = 1
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 379
      Height = 73
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 54
    Width = 383
    Height = 73
    Align = alTop
    Caption = 'UpLoad Arquivo'
    TabOrder = 2
    object Button5: TButton
      Left = 16
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 0
    end
    object Button6: TButton
      Left = 110
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Parar'
      TabOrder = 1
    end
    object Button7: TButton
      Left = 205
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Continuar'
      TabOrder = 2
    end
    object Button8: TButton
      Left = 300
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
    end
  end
end
