object _frmAlteraSenha: T_frmAlteraSenha
  Left = 371
  Top = 250
  ActiveControl = edtSenhaAtual
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Altera'#231#227'o de senha'
  ClientHeight = 75
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblSenhaAtual: TLabel
    Left = 16
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Senha atual'
  end
  object lblNovaSenha: TLabel
    Left = 16
    Top = 48
    Width = 58
    Height = 13
    Caption = 'Nova senha'
  end
  object bbtnConfirma: TBitBtn
    Left = 274
    Top = 9
    Width = 82
    Height = 25
    Caption = 'Confirma'
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
    OnClick = bbtnConfirmaClick
  end
  object bbtnCancela: TBitBtn
    Left = 272
    Top = 40
    Width = 82
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
    TabOrder = 3
    OnClick = bbtnCancelaClick
  end
  object edtSenhaAtual: TEdit
    Left = 79
    Top = 10
    Width = 166
    Height = 19
    TabStop = False
    CharCase = ecUpperCase
    Ctl3D = False
    MaxLength = 10
    ParentCtl3D = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtNovaSenha: TEdit
    Left = 80
    Top = 48
    Width = 166
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    MaxLength = 10
    ParentCtl3D = False
    TabOrder = 1
  end
end
