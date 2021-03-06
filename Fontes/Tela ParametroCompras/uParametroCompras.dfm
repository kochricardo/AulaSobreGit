object _frmCadastroParametro: T_frmCadastroParametro
  Left = 0
  Top = 0
  Caption = 'Cadastro de Parametro Fornecedor'
  ClientHeight = 581
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 965
    Height = 562
    ActivePage = _tbsParametro
    Align = alClient
    TabOrder = 0
    object _tbsParametro: TTabSheet
      Caption = 'Parametro'
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 87
        Height = 13
        Caption = 'Grupo Fornecedor'
      end
      object _edtDivisaoFornecedor: TLabel
        Left = 197
        Top = 9
        Width = 92
        Height = 13
        Caption = 'Divisao Fornecedor'
      end
      object Label2: TLabel
        Left = 10
        Top = 52
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object Label3: TLabel
        Left = 510
        Top = 52
        Width = 83
        Height = 13
        Caption = 'Envio Automatico'
      end
      object Label4: TLabel
        Left = 221
        Top = 52
        Width = 69
        Height = 13
        Caption = 'Oper.Logistico'
      end
      object _edtGrupoFornecedor: TEdit
        Left = 8
        Top = 26
        Width = 87
        Height = 21
        TabOrder = 0
        OnExit = _edtGrupoFornecedorExit
        OnKeyDown = _edtGrupoFornecedorKeyDown
      end
      object _edtNomeDivisao: TEdit
        Left = 197
        Top = 25
        Width = 429
        Height = 21
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 196
        Width = 622
        Height = 271
        Caption = 'Parametro de Compras'
        TabOrder = 6
        object _dbgParametro: TDBGrid
          Left = 2
          Top = 15
          Width = 618
          Height = 254
          Align = alClient
          DataSource = _dsParametroCompra
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgParametroDrawColumnCell
          OnDblClick = _dbgParametroDblClick
        end
      end
      object _cbxOpcaoCDs: TComboBox
        Left = 10
        Top = 69
        Width = 205
        Height = 21
        TabOrder = 1
      end
      object _cbxEnvioAutomatico: TComboBox
        Left = 510
        Top = 69
        Width = 113
        Height = 21
        TabOrder = 3
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
      object _btnGravar: TBitBtn
        Left = 321
        Top = 471
        Width = 83
        Height = 45
        Caption = 'Gravar'
        DoubleBuffered = True
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
          000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
          00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
          8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
          8888880BB088888888888800008888888888}
        ParentDoubleBuffered = False
        TabOrder = 7
        OnClick = _btnGravarClick
      end
      object _cbOPeradorLogistico: TComboBox
        Left = 223
        Top = 71
        Width = 281
        Height = 21
        TabOrder = 2
        OnExit = _cbOPeradorLogisticoExit
      end
      object _btnNovo: TBitBtn
        Left = 55
        Top = 472
        Width = 83
        Height = 45
        Caption = 'Novo'
        DoubleBuffered = True
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333B3333333B333333
          B33333333B333333B33333333BB33888BB8888BB3333333333B00000000000B3
          333333333330FFFFFFFFF083333333333330FFFFFFFFF083333333333330FFFF
          FFFFF083333333333330FFFFFFFFF083333333333330FFFFFFFFF08333333333
          3BB0FFFFFFFFF0833333333BB330FFFFFFFFF0BB333333333330FFFFFF777033
          BB3333333330FFFFF0000033333333333330FFFFF0FF0333333333333330FFFF
          F0F0B333333333333330FFFFF003BB333333333333B0000000333BB333333333
          3BB33333BB3333BB33333333B3333333B3333333B33333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        ParentDoubleBuffered = False
        TabOrder = 8
        OnClick = _btnNovoClick
      end
      object _btnAltera: TBitBtn
        Left = 183
        Top = 472
        Width = 83
        Height = 45
        Caption = 'Alterar'
        DoubleBuffered = True
        Glyph.Data = {
          42050000424D4205000000000000360000002800000016000000130000000100
          1800000000000C050000C30E0000C30E00000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB7B7B7BCAFAE9A7E
          7B9F756F288686978E8EC0B9B9BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB4B4B4BFACAB9E8785DC
          756EF5A39FA3BFBA4DB5B5914844BC837FC0B6B6BFBFBFBFBFBFBFBFBFBFBFBF
          0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB3B3B3BBA6A4AE8D8BD48582
          B3B3AEF8AAA89EDCE167E8EBBEBCBFB76865974B47B9827FC0B5B5BFBFBFBFBF
          BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFB4B4B4B5A09EBA908D8D9B97DDA9
          A7A8D4D86BE7EAE0DEE36FE6EA8BE0E477E4E8AEACAB974B4786433FB9817EC0
          B6B5BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFB4B4B4AC9695939F9BBFB0AFAA
          D2D4CDE3E790E3E7DEE3E7E3DDE1A9A8AB4FA8B97F8EBC75CECF7F7F7B773B39
          AA544FAB918FB9B9B9BFBFBF0000BFBFBFBFBFBFBFBFBFB6B6B68BB8B77FD9DA
          7BE3E7B9E8EBE9E0E4BCA7AAA1B0B1B19C9F9E9E9E5F5F7F4B4DA2C2E3E7B3A2
          A08E4643AA544F937977949494BBBBBB0000BFBFBFBFBFBFBFBFBFBFBFBFB7C9
          CBD7E3E7D0E1E5C4F1F4F3D5DB4B8B8C27CFCF33D4D4A5A5B4404995AEBCD9E8
          E1E5E7CBCEC8787690778DA0A2ABABABABBDBDBD0000BFBFBFBFBFBFBFBFBFBF
          BFBFC4BFC0E6DFE0FFF7F8F8DDE2B19F576C811E9CF4EB033E9922748A3C3495
          B5DDE286E5E9E7E3E7D3A09DB69BA1B9BCBFBFBFBFBFBFBF0000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFDFC6CAFFEAEDB3AF668381597F7F12218D8200707F1269
          6B77212D9BAFAFC2FCFCE7E3E7E0DFE1CD9A96C2ABAABFBFBFBFBFBF0000BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBDBCBC99999980807576761E1616006503030C
          767F323F9BDBDCDBE5BBB8D7E8EB82E3E793E1E5E08F8DC5A5A2BFBDBDBFBFBF
          0000BFBFBFBFBFBFBFBFBFBFBFBFB2B2B29090907F7F737171231A1A00000000
          121212989293DDEFF2FDD0D6A5DFE461E3E585DDE089F9FAECDCE1D9817CC1B0
          AFBFBFBF0000BFBFBFBFBFBFBFBFBFAFAFAF6D6262694F4D7469311F1F000000
          001A1A1A948789FFD5DBFFDCE1E6FFFF6FF6FB3FBCCA95B5C3BADBE5C9F0F3D8
          9F9CD0B6B7C0BFBF0000BFBFBFBFBFBFAEAEAE616161715440D983675C302E00
          0000202020959595F7D6DAF7FFFFB2FBFBB6E5EA36C4E452A5D54FA8D73BBEE1
          91E4EAE1CDD1B2D7DBD0C3C60000BFBFBFB1B1B15E5E5E4F4F3C6767296B4E28
          3B2221242424979797F2F2F2FFE8EBDDFFFF6CF8F8A1D5DD44B5DD49AFDA45B4
          DC47B1DB95D3DDD5C8CB81E0E3D8C6CA0000B6B6B65555555252416868272222
          00000000272727818181CECECEF9F9F9E7E7EAD1FFFFD1FFFF63FFFF7CEEF788
          B1CB85ACC680EAF5A8E8E8D7C9CCDDC3C6C1BFBF0000B5B5B55757496B6B231F
          1F00000000272727828282B6B6B6BFBFBFD2D2D2EAFBFBE0FFFF69F8FAB2E4E8
          B7FFFF72D9D97AD3D393E7E770E1E1A1C9C9BFBFBFBFBFBF0000B9B9B16F6F1D
          1A1A00000000252525848484B7B7B7BFBFBFBFBFBFBFBFBFF9F9F9F8FBFCC3D4
          DAF3C9CFC8E0E0BAE4E45FDFDF6FD9D99BCACABAE6E6C0C6C6BFBFBF0000BDBD
          BC949481000000222222868686B9B9B9BFBFBFBFBFBFBFBFBFBFBFBFC9C9C9FA
          D0D5CBC0C2C8C0C1D4C5C7E4CACDC7C8CBC5C6C8BFBFBFC1C8C8BFC0C0BFBFBF
          0000BFBFBFBCBCBCADADADB1B1B1BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFC4BFC0BFBFBFBFBFBFC0BFBFC2BFBFC2BFBFC1BFBFBFBFBFBFBFBFBFBF
          BFBFBFBF0000}
        ParentDoubleBuffered = False
        TabOrder = 9
        OnClick = _btnAlteraClick
      end
      object _btnCancelar: TBitBtn
        Left = 440
        Top = 472
        Width = 83
        Height = 45
        Caption = 'Cancelar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 10
        OnClick = _btnCancelarClick
      end
      object _grbemails: TGroupBox
        Left = 321
        Top = 100
        Width = 304
        Height = 90
        Caption = 'e-mails'
        TabOrder = 11
        object _ltbEmail: TListBox
          Left = 2
          Top = 15
          Width = 300
          Height = 73
          Align = alClient
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 0
          OnDblClick = _ltbEmailDblClick
          OnKeyDown = _ltbEmailKeyDown
        end
      end
      object _btnAdicionaEmails: TBitBtn
        Left = 281
        Top = 113
        Width = 34
        Height = 23
        Caption = '>'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 12
        OnClick = _btnAdicionaEmailsClick
      end
      object _edtemails: TEdit
        Left = 13
        Top = 114
        Width = 262
        Height = 21
        CharCase = ecLowerCase
        TabOrder = 4
        OnKeyDown = _edtemailsKeyDown
      end
      object _btnLimpaEmails: TBitBtn
        Left = 279
        Top = 167
        Width = 34
        Height = 23
        Caption = '<<'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 13
        OnClick = _btnLimpaEmailsClick
      end
      object GroupBox2: TGroupBox
        Left = 668
        Top = 26
        Width = 229
        Height = 431
        Caption = 'Dias de  Pedido'
        TabOrder = 14
        object _dbgAgenda: TDBGrid
          Left = 2
          Top = 175
          Width = 225
          Height = 253
          Align = alTop
          DataSource = _dsAgenda
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = _dbgAgendaDrawColumnCell
          OnDblClick = _dbgAgendaDblClick
          OnKeyDown = _dbgAgendaKeyDown
        end
        object _mcAgenda: TMonthCalendar
          Left = 2
          Top = 15
          Width = 225
          Height = 160
          Align = alTop
          Date = 44545.704026851850000000
          TabOrder = 1
          OnDblClick = _mcAgendaDblClick
        end
      end
      object BitBtn1: TBitBtn
        Left = 103
        Top = 23
        Width = 88
        Height = 25
        Caption = 'Pesq.Fornec.'
        DoubleBuffered = True
        Glyph.Data = {
          06030000424D06030000000000003600000028000000100000000F0000000100
          180000000000D0020000C30E0000C30E00000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000FF0000BFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00
          0000000000FF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          0000000000000000000000007F7F7F000000FF0000BFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF00000000
          FFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF
          BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000000000000000000000BFBFBFFFFFFF7F7F7FFFFFFF7F7F7F7F7F7F00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000BFBFBF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000BFBFBFFFFFFF7F7F7F7F7F7FFFFFFF7F7F7F00
          0000FFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBF000000
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000BFBFBFBFBFBF0000000000000000000000007F7F7FFF
          FFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000BFBFBFBFBFBF000000FFFFFF7F7F7F7F7F7F7F7F7F7F
          7F7FFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000BFBFBFBFBFBF00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBF}
        ParentDoubleBuffered = False
        TabOrder = 15
        OnClick = BitBtn1Click
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 562
    Width = 965
    Height = 19
    Panels = <>
  end
  object _cdsAgenda: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 768
    Top = 48
    Data = {
      670000009619E0BD01000000180000000300000000000300000067000B636453
      657175656E63696104000100000000000B446174615F4167656E646104000600
      000000001069645F70656469646F5F67657261646F0100490000000100055749
      4454480200020001000000}
    object _cdsAgendacdSequencia: TIntegerField
      FieldName = 'cdSequencia'
      Visible = False
    end
    object _cdsAgendaData_Agenda: TDateField
      DisplayLabel = 'Dias de Agenda'
      DisplayWidth = 22
      FieldName = 'Data_Agenda'
    end
    object _cdsAgendaid_pedido_gerado: TStringField
      DisplayLabel = 'Gerado'
      FieldName = 'id_pedido_gerado'
      Size = 1
    end
  end
  object _dsAgenda: TDataSource
    DataSet = _cdsAgenda
    Left = 824
    Top = 48
  end
  object _cdsParametroCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 216
  end
  object _dsParametroCompra: TDataSource
    Left = 80
    Top = 272
  end
  object _cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 32
  end
end
