object _frmProdutoEmEspera: T_frmProdutoEmEspera
  Left = 0
  Top = 0
  Caption = 'Produtos Com pedido em Espera'
  ClientHeight = 568
  ClientWidth = 953
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    953
    568)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 549
    Width = 953
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 85
    Width = 953
    Height = 243
    Align = alTop
    Caption = 'Produtos Em Espera'
    TabOrder = 1
    object _dbgProduto: TDBGrid
      Left = 2
      Top = 15
      Width = 949
      Height = 226
      Align = alClient
      Ctl3D = False
      DataSource = _dsProdutoEmeEspera
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColEnter = _dbgProdutoColEnter
      OnDrawColumnCell = _dbgProdutoDrawColumnCell
      OnDblClick = _dbgProdutoDblClick
      OnKeyDown = _dbgProdutoKeyDown
      OnTitleClick = _dbgProdutoTitleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 328
    Width = 953
    Height = 153
    Align = alTop
    Caption = 'Clientes'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 949
      Height = 136
      Align = alClient
      Ctl3D = False
      DataSource = _dsClientePedidoEspera
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object _btnCancela: TBitBtn
    Left = 791
    Top = 510
    Width = 154
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Fecha'
    DoubleBuffered = True
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000C30E0000C30E00000000000000000000FFFFFFF2F2F2
      F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
      F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFFFFFFF0000FFFF
      FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
      E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6FFFFFF
      0000D3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
      DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
      ECD3D3D30000E6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
      EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
      E2E2DBDBDBF3F3F300004B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
      4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
      4C4C0D3232324848484E4E4E0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
      007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
      8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
      FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
      7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBF0000BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
      7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
      0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
      6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
      BFBFBFBF0000AEAEAE57574531310A272700272700272700424200FFFF00F9F9
      009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
      6363BFBFBFBFBFBF00008989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
      FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
      474700636363BFBFBFBFBFBF0000898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
      FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
      007F7F00474700636363BFBFBFBFBFBF0000A7A7A76F6F4879790C7A7A0A7A7A
      0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
      8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFB1B1B1A9A9A9A9
      A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
      FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
      7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
      7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
      0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
      7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
      BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
      447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
      7676BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF4141415656565656565656565656565656565656565656562E2E2E888807
      65650C888888BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
      89898989898989B1B1B1BFBFBFBFBFBF0000}
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = _btnCancelaClick
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 953
    Height = 85
    Align = alTop
    Caption = 'Filtro'
    TabOrder = 4
    object Label3: TLabel
      Left = 32
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object Label4: TLabel
      Left = 29
      Top = 45
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label5: TLabel
      Left = 133
      Top = 12
      Width = 85
      Height = 13
      Caption = 'Nome Fornecedor'
    end
    object Label6: TLabel
      Left = 133
      Top = 45
      Width = 83
      Height = 13
      Caption = 'Nome Comprador'
    end
    object _edtNrFornecedor: TEdit
      Left = 29
      Top = 24
      Width = 97
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNrComprador: TEdit
      Left = 29
      Top = 59
      Width = 97
      Height = 19
      Alignment = taRightJustify
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyDown = _edtNrCompradorKeyDown
    end
    object _edtNomeFornecedor: TEdit
      Left = 132
      Top = 25
      Width = 357
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object _edtNomeComprador: TEdit
      Left = 132
      Top = 60
      Width = 357
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 768
      Top = 11
      Width = 153
      Height = 45
      Caption = 'Pesquisa'
      DoubleBuffered = True
      Glyph.Data = {
        DE020000424DDE02000000000000B60000002800000016000000170000000100
        08000000000028020000C30E0000C30E0000200000000000000000FF0000FFFF
        FF0080808000C0C0C00000000000FF000000FFFF00000000FF0000FFFF0045CA
        BF004B737F00D0B4B400CC625700FF31310000CEFF000079FF000029FF005E5E
        FF00BDBDFF00502B2D0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010101010101
        0101010101010101010101010101010100000103030303030303030303030303
        0303030404040301000001030303030303030303030303030303040701070401
        0000010303030303030303030303030303040701010704010000010303030303
        0303030303030303040701010707040100000103030303030303030303030304
        0701010707040301000001030303030303030303030304070101070704030301
        0000010303030303030303030304070101070704030303010000010303030303
        0303030304070101070704030303030100000103030303030303030404040307
        0704030303030301000001030303030304040404040404070403030303030301
        0000010303030404060106010104040403030303030303010000010303040106
        0106010101010403030303030303030100000103030406010601060106010403
        0303030303030301000001030406010601010106010601040303030303030301
        0000010304010601060106010601010403030303030303010000010304060106
        0106010601060104030303030303030100000103040106010601060106010104
        0303030303030301000001030304010601010106010604030303030303030301
        0000010303040601060106010601040303030303030303010000010303030404
        0101010604040303030303030303030100000103030303030404040403030303
        0303030303030301000001010101010101010101010101010101010101010101
        0000}
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
  end
  object _cdsProdutoEmEspera: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 32
  end
  object _cdsClientePedidoEspera: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 336
  end
  object _dsProdutoEmeEspera: TDataSource
    Left = 648
    Top = 32
  end
  object _dsClientePedidoEspera: TDataSource
    Left = 664
    Top = 320
  end
end
