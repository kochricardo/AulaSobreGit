object _frmLogin: T_frmLogin
  Left = 307
  Top = 282
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Acesso Restrito'
  ClientHeight = 139
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 55
    Width = 26
    Height = 13
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 14
    Top = 84
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Sistema de Pedido'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object edtLogin: TEdit
    Left = 51
    Top = 54
    Width = 166
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    MaxLength = 50
    ParentCtl3D = False
    TabOrder = 0
    OnExit = edtLoginExit
    OnKeyPress = mudarComEnter
  end
  object edtSenha: TEdit
    Left = 51
    Top = 79
    Width = 166
    Height = 19
    Ctl3D = False
    MaxLength = 20
    ParentCtl3D = False
    PasswordChar = '*'
    TabOrder = 1
    OnExit = edtSenhaExit
    OnKeyPress = mudarComEnter
  end
  object bbtnOK: TBitBtn
    Left = 265
    Top = 37
    Width = 98
    Height = 25
    Caption = 'OK'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = bbtnOKClick
  end
  object bbtnCancela: TBitBtn
    Left = 264
    Top = 96
    Width = 98
    Height = 25
    Caption = 'Cancela'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = bbtnCancelaClick
  end
  object bbtnAlteraSenha: TBitBtn
    Left = 265
    Top = 68
    Width = 98
    Height = 25
    Caption = 'Alterar Senha'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = bbtnAlteraSenhaClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 120
    Width = 363
    Height = 19
    Panels = <>
  end
  object _cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Name = 'PidUsuario'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'PidUsuario1'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'PdsSenha1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PcdUsuario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PcdUsuariogeral'
        ParamType = ptInput
      end>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 40
  end
end
