object _frmTransferenciaArquivo: T_frmTransferenciaArquivo
  Left = 0
  Top = 0
  Caption = 'transferencia de Arquivo'
  ClientHeight = 273
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
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
    Height = 122
    Align = alTop
    Caption = 'Status'
    TabOrder = 1
    object Memo1: TMemo
      Left = 4
      Top = 39
      Width = 375
      Height = 73
      Color = clWindowFrame
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object ProgressBar1: TProgressBar
      Left = 4
      Top = 16
      Width = 375
      Height = 17
      BarColor = clHotLight
      BackgroundColor = clMoneyGreen
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 54
    Width = 383
    Height = 73
    Align = alTop
    Caption = 'Enviar  Arquivo'
    TabOrder = 2
    object Button1: TButton
      Left = 16
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 110
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Parar'
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 205
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Continuar'
      Enabled = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 300
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 254
    Width = 383
    Height = 19
    Panels = <>
  end
  object _idFtp: TIdFTP
    OnStatus = _idFtpStatus
    OnWork = _idFtpWork
    OnWorkBegin = _idFtpWorkBegin
    OnWorkEnd = _idFtpWorkEnd
    IPVersion = Id_IPv4
    Passive = True
    TransferType = ftBinary
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 320
    Top = 160
  end
end
