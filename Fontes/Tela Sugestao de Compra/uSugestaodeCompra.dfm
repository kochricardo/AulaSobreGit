object _frmSugestaodeCompra: T_frmSugestaodeCompra
  Left = 0
  Top = 0
  Caption = 'Sugest'#227'o de Compra'
  ClientHeight = 584
  ClientWidth = 1066
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 15
    Top = 14
    Width = 100
    Height = 13
    Caption = 'Total Unid. Trimestre'
  end
  object Label6: TLabel
    Left = 15
    Top = 52
    Width = 100
    Height = 13
    Caption = 'Vlr.Estq.(P'#231'o.Venda)'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1066
    Height = 345
    Align = alTop
    Caption = 'Produtos'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object _dbgSugestao: TDBGrid
      Left = 1
      Top = 14
      Width = 1064
      Height = 330
      Align = alClient
      Ctl3D = False
      DataSource = _dsSugestaoCompra
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgSugestaoDrawColumnCell
      OnTitleClick = _dbgSugestaoTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APRESENTACAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNITARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNI_PENDENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUG_CPRA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUG_CPRA_PEND'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMB_COMPRA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES0'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIA_MES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LEADTIME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS_SEM_ESTOQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_SELECAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_DIAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_DIAS_DIV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS_ESTOQUE_ZERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EITM_M'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ERGM_M'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_DESCONTO_PADRAO_COMPRA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NROM_M'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VTPENDENCIAFABRICA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VTPENDENCIACUSTO'
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 345
    Width = 1066
    Height = 220
    Align = alClient
    Caption = 'Filtro'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Label1: TLabel
      Left = 250
      Top = 18
      Width = 95
      Height = 13
      Caption = 'Nr. Dias de Estoque'
    end
    object Label2: TLabel
      Left = 250
      Top = 66
      Width = 73
      Height = 13
      Caption = 'Nr. Fornecedor'
    end
    object Label11: TLabel
      Left = 7
      Top = 174
      Width = 71
      Height = 13
      Caption = 'Nr. Comprador'
    end
    object Label12: TLabel
      Left = 101
      Top = 174
      Width = 70
      Height = 13
      Caption = 'Sugest'#227'o Para'
    end
    object _edtNrDiasEstoque: TEdit
      Left = 250
      Top = 37
      Width = 121
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object _edtNrFornecedor: TEdit
      Left = 250
      Top = 85
      Width = 121
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      OnKeyDown = _edtNrFornecedorKeyDown
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 9
      Width = 223
      Height = 149
      Caption = 'Especealidade'
      TabOrder = 2
      object DBGrid2: TDBGrid
        Left = 1
        Top = 14
        Width = 221
        Height = 134
        Align = alClient
        DataSource = _dsEpecealidade
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        OnTitleClick = DBGrid2TitleClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 423
      Top = 6
      Width = 593
      Height = 98
      Caption = 'Vendas'
      TabOrder = 3
      object Label3: TLabel
        Left = 8
        Top = 14
        Width = 100
        Height = 13
        Caption = 'Total Unid. Trimestre'
      end
      object Label4: TLabel
        Left = 8
        Top = 52
        Width = 100
        Height = 13
        Caption = 'Vlr.Estq.(P'#231'o.Venda)'
      end
      object _Mes0: TLabel
        Left = 122
        Top = 12
        Width = 100
        Height = 13
        Caption = 'Total Unid. Trimestre'
      end
      object _VlVendaMes0: TLabel
        Left = 123
        Top = 52
        Width = 100
        Height = 13
        Caption = 'Vlr.Estq.(P'#231'o.Venda)'
      end
      object _Mes1: TLabel
        Left = 234
        Top = 12
        Width = 100
        Height = 13
        Caption = 'Total Unid. Trimestre'
      end
      object _VlVendaMes1: TLabel
        Left = 234
        Top = 52
        Width = 100
        Height = 13
        Caption = 'Vlr.Estq.(P'#231'o.Venda)'
      end
      object _Mes2: TLabel
        Left = 341
        Top = 12
        Width = 100
        Height = 13
        Caption = 'Total Unid. Trimestre'
      end
      object _VlVendaMes2: TLabel
        Left = 341
        Top = 52
        Width = 100
        Height = 13
        Caption = 'Vlr.Estq.(P'#231'o.Venda)'
      end
      object _Mes3: TLabel
        Left = 452
        Top = 12
        Width = 100
        Height = 13
        Caption = 'Total Unid. Trimestre'
      end
      object _VlVendaMes3: TLabel
        Left = 452
        Top = 52
        Width = 100
        Height = 13
        Caption = 'Vlr.Estq.(P'#231'o.Venda)'
      end
      object _edtTotalUnidTrimestre: TEdit
        Left = 8
        Top = 29
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 0
      end
      object _edtVlEstoque: TEdit
        Left = 8
        Top = 67
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 1
      end
      object _edtTotalUnidMes0: TEdit
        Left = 123
        Top = 27
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 2
      end
      object _edtVlVendaMes0: TEdit
        Left = 123
        Top = 67
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 3
      end
      object _edtTotalUnidMes1: TEdit
        Left = 234
        Top = 27
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 4
      end
      object _edtVlVendaMes1: TEdit
        Left = 234
        Top = 67
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 5
      end
      object _edtTotalUnidMes2: TEdit
        Left = 341
        Top = 27
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 6
      end
      object _edtVlVendaMes2: TEdit
        Left = 341
        Top = 67
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 7
      end
      object _edtTotalUnidMes3: TEdit
        Left = 452
        Top = 27
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 8
      end
      object _edtVlVendaMes3: TEdit
        Left = 452
        Top = 67
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 9
      end
    end
    object _btnParaExcel: TBitBtn
      Left = 250
      Top = 120
      Width = 129
      Height = 25
      Caption = 'Gerar Excel   '
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = _btnParaExcelClick
    end
    object GroupBox5: TGroupBox
      Left = 423
      Top = 104
      Width = 593
      Height = 98
      Caption = 'Compras'
      TabOrder = 5
      object Label7: TLabel
        Left = 8
        Top = 14
        Width = 77
        Height = 13
        Caption = 'Total Unid. Sug.'
      end
      object Label8: TLabel
        Left = 8
        Top = 52
        Width = 85
        Height = 13
        Caption = 'Valor Compra Sug'
      end
      object Label9: TLabel
        Left = 122
        Top = 12
        Width = 120
        Height = 13
        Caption = 'Total Unid. Sug.(C/pend)'
      end
      object Label10: TLabel
        Left = 123
        Top = 52
        Width = 119
        Height = 13
        Caption = 'Valor Cpra.Sug.(C/pend)'
      end
      object Label13: TLabel
        Left = 324
        Top = 10
        Width = 106
        Height = 13
        Caption = 'Total Unid. Pendentes'
      end
      object Label15: TLabel
        Left = 452
        Top = 12
        Width = 124
        Height = 13
        Caption = 'Valor Total Pend. (Custo) '
      end
      object Label16: TLabel
        Left = 452
        Top = 52
        Width = 122
        Height = 13
        Caption = 'Valor Total Pend. (Fabr.) '
      end
      object _edtTotalUniSugerida: TEdit
        Left = 8
        Top = 29
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 0
      end
      object _edtValorTotalUniSugerida: TEdit
        Left = 8
        Top = 67
        Width = 100
        Height = 19
        Alignment = taRightJustify
        TabOrder = 1
      end
      object _edtTotalUniSugeridaCPendencia: TEdit
        Left = 123
        Top = 27
        Width = 119
        Height = 19
        Alignment = taRightJustify
        TabOrder = 2
      end
      object _edtValorTotalUniSugeridaCPendencia: TEdit
        Left = 123
        Top = 67
        Width = 119
        Height = 19
        Alignment = taRightJustify
        TabOrder = 3
      end
      object _edtTotalUnPendentes: TEdit
        Left = 324
        Top = 28
        Width = 121
        Height = 19
        Alignment = taRightJustify
        TabOrder = 4
      end
      object _edtValorTotalPendentesCusto: TEdit
        Left = 453
        Top = 28
        Width = 121
        Height = 19
        Alignment = taRightJustify
        TabOrder = 5
      end
      object _edtValorTotalPendentesFabr: TEdit
        Left = 453
        Top = 67
        Width = 121
        Height = 19
        Alignment = taRightJustify
        TabOrder = 6
      end
      object BitBtn1: TBitBtn
        Left = 328
        Top = 70
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 7
        Visible = False
        OnClick = BitBtn1Click
      end
    end
    object _btnImprimir: TBitBtn
      Left = 250
      Top = 174
      Width = 129
      Height = 25
      Caption = 'Imprimir Rel.'
      DoubleBuffered = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
        000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
        0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
        7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
        0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
        0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
        FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = _btnImprimirClick
    end
    object _chkPendencia: TCheckBox
      Left = 250
      Top = 151
      Width = 142
      Height = 17
      Caption = 'N'#227'o Lista Pendencia'
      Checked = True
      Ctl3D = False
      ParentCtl3D = False
      State = cbChecked
      TabOrder = 7
    end
    object _edtNrComprador: TEdit
      Left = 7
      Top = 190
      Width = 88
      Height = 19
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 8
    end
    object _cbxOpcaoCDs: TComboBox
      Left = 101
      Top = 189
      Width = 98
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 9
      Text = 'CD SC e CD RS'
      OnEnter = _cbxOpcaoCDsEnter
      Items.Strings = (
        'CD SC e CD RS'
        'CD Tubar'#227'o'
        'CD Sta Cruz do Sul')
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 565
    Width = 1066
    Height = 19
    Panels = <>
  end
  object _cdsSugestaoCompra: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRLABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRLABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRLABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PnrComprador'
        ParamType = ptInput
      end>
    ProviderName = '_dspSugestaoCompra'
    Left = 632
    Top = 48
    object _cdsSugestaoCompraSomaMes0: TAggregateField
      FieldName = 'SomaMes0'
      Active = True
      Expression = 'sum(MES0)'
    end
    object _cdsSugestaoCompraSomaMes1: TAggregateField
      FieldName = 'SomaMes1'
      Active = True
      Expression = 'sum(MES1)'
    end
    object _cdsSugestaoCompraSomaMes2: TAggregateField
      FieldName = 'SomaMes2'
      Active = True
      Expression = 'sum(MES2)'
    end
    object _cdsSugestaoCompraSomaMes3: TAggregateField
      FieldName = 'SomaMes3'
      Active = True
      Expression = 'sum(MES3)'
    end
    object _cdsSugestaoCompraSomaVlMes0: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaVlMes0'
      Active = True
      Expression = 'Sum(MES0*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaVlMes1: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaVlMes1'
      Active = True
      Expression = 'Sum(MES1*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaVlMes2: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaVlMes2'
      Active = True
      Expression = 'Sum(MES2*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaVlMes3: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SomaVlMes3'
      Active = True
      Expression = 'Sum(MES3*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaVlrEstoque: TAggregateField
      FieldName = 'SomaVlrEstoque'
      Active = True
      Expression = 'sum(ESTQ*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaUnidadePendentes: TAggregateField
      FieldName = 'SomaUnidadePendentes'
      Active = True
      Expression = 'SUM(UNI_PENDENTE)'
    end
    object _cdsSugestaoCompraSomaSugestaoCompraSPendencia: TAggregateField
      FieldName = 'SomaSugestaoCompraSPendencia'
      Active = True
      Expression = 'sum(SUG_CPRA)'
    end
    object _cdsSugestaoCompraSomaSugestaoCompraCPendencia: TAggregateField
      FieldName = 'SomaSugestaoCompraCPendencia'
      Active = True
      Expression = 'SUM(SUG_CPRA_PEND)'
    end
    object _cdsSugestaoCompraSomaValorPendenciaCusto: TAggregateField
      FieldName = 'SomaValorPendenciaCusto'
      Active = True
      Expression = 'SUM(VTPENDENCIACUSTO)'
    end
    object _cdsSugestaoCompraSomaValorPendenciaFabrica: TAggregateField
      FieldName = 'SomaValorPendenciaFabrica'
      Active = True
      Expression = 'SUM(VTPENDENCIAFABRICA)'
    end
    object _cdsSugestaoCompraSomaValorSugCompraSPendencia: TAggregateField
      FieldName = 'SomaValorSugCompraSPendencia'
      Active = True
      Expression = 'sum(SUG_CPRA*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaValorSugCompraCPendencia: TAggregateField
      FieldName = 'SomaValorSugCompraCPendencia'
      Active = True
      Expression = 'sum(SUG_CPRA_PEND*UNITARIO)'
    end
    object _cdsSugestaoCompraSomaUnidadeEstoque: TAggregateField
      FieldName = 'SomaUnidadeEstoque'
      Active = True
      Expression = 'SUM(ESTQ)'
    end
    object _cdsSugestaoCompraSomaVdaTrimestre: TAggregateField
      FieldName = 'SomaVdaTrimestre'
      Active = True
      Expression = 'SUM(QT_VENDA)'
    end
  end
  object _dsSugestaoCompra: TDataSource
    DataSet = _cdsSugestaoCompra
    Left = 704
    Top = 64
  end
  object _sqlSugestaoCompra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRDIAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRLABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRLABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRLABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PnrComprador'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   NM_PRODUTO PRODUTO,'
      '   NM_APRESENTACAO AS APRESENTACAO,'
      '   UNID,'
      '   nvl(UNITARIO,0) as UNITARIO,'
      '   nvl(VDA_TRIME,0) as  QT_VENDA,'
      '   nvl(ESTQ,0) as ESTQ,'
      '   UNI_PENDENTE,'
      '   VTPENDENCIAFABRICA,'
      '   VTPENDENCIACUSTO,'
      '   CASE'
      
        '    WHEN  ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PN' +
        'RDIAS + LEADTIME)  -  (ESTQ),0)<=0 THEN 0'
      
        '    WHEN  ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PN' +
        'RDIAS + LEADTIME)  -  (ESTQ),0)>0 THEN'
      
        '          ROUND(ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) *' +
        ' ( :PNRDIAS + LEADTIME)  -  (ESTQ),0)/EMB_COMPRA,0) * EMB_COMPRA'
      '   ELSE 0'
      '    END SUG_CPRA,'
      '   CASE'
      
        '   WHEN  ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PNR' +
        'DIAS + LEADTIME)  -  (ESTQ+UNI_PENDENTE),0)<=0 THEN 0'
      
        '   WHEN  ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ( :PNR' +
        'DIAS + LEADTIME)  -  (ESTQ+UNI_PENDENTE),0)>0 THEN'
      
        '         ROUND(ROUND((VDA_TRIME/(NR_DIAS - DIAS_SEM_ESTOQUE)) * ' +
        '( :PNRDIAS + LEADTIME)  -  (ESTQ+UNI_PENDENTE),0)/EMB_COMPRA,0) ' +
        '* EMB_COMPRA'
      '   ELSE 0'
      '   END SUG_CPRA_PEND,'
      '   EMB_COMPRA,'
      '   Nvl(MES3,0) AS MES3,'
      '   Nvl(MES2,0) AS MES2,'
      '   Nvl(MES1,0) AS MES1,'
      '   Nvl(MES0,0) AS MES0, '
      '   CURVA,'
      '   GRUPO_CURVA AS GRUPO,'
      '   QT_ESTOQUE_MAXIMO,'
      '   LEADTIME ,'
      '   Nvl(DIAS_SEM_ESTOQUE,0) AS DIAS_SEM_ESTOQUE,'
      '   Nvl(NR_DIAS,0) AS NR_DIAS,'
      '   Nvl(NR_DIAS_DIV,0) AS NR_DIAS_DIV,'
      '   Nvl(MEDIA,0) AS MEDIA,'
      '   nvl((MEDIA* 30),0) AS MEDIA_MES,'
      '   Nvl(DIAS_ESTOQUE_ZERO,0) AS DIAS_ESTOQUE_ZERO,'
      '   DS_NIVEL_EITM as EITM_M,'
      '   DS_NIVEL_ERGM as ERGM_M,'
      '   PC_DESCONTO_PADRAO_COMPRA,'
      '   '#39'N'#39' AS ID_SELECAO,'
      '   NR_PRODUTO AS NROM_M,'
      '   cd_comprador,'
      '   CD_EMPRESA'
      '   '
      'FROM'
      ''
      '((SELECT'
      '   CD_PRODUTO CODIGO,'
      '   NM_PRODUTO,'
      '   NM_APRESENTACAO,'
      '   UNID,'
      '   PRECO_VENDA UNITARIO,'
      '   MES3+MES2+MES1 VDA_TRIME,'
      '   ROUND((MES3+MES2+MES1) /'
      
        '   ROUND((ADD_MONTHS(TRUNC(MAX(SYSDATE),'#39'MONTH'#39'),0)  - ADD_MONTH' +
        'S(TRUNC(SYSDATE,'#39'MONTH'#39'),-3) - NVL(DIAS_ESTOQUE_ZERO,0)),2) *QT_' +
        'ESTOQUE_MAXIMO,0) AS PREV,'
      '   ESTOQUE AS ESTQ,'
      '   EMB_COMPRA,'
      ''
      '   MES3,'
      '   MES2,'
      '   MES1,'
      '   MES0,'
      '   CURVA,'
      '   GRUPO_CURVA AS GRUPO,'
      '   QT_ESTOQUE_MAXIMO,'
      '   LEADTIME ,'
      '   DIAS_ESTOQUE_ZERO AS DIAS_SEM_ESTOQUE,'
      '   NR_PRODUTO,'
      '   UNI_PENDENTE,'
      '   VTPENDENCIAFABRICA,'
      '   VTPENDENCIACUSTO,'
      '   GRUPO_CURVA,'
      '   DIAS_ESTOQUE_ZERO,'
      '   PC_DESCONTO_PADRAO_COMPRA,'
      
        '   ROUND((MES3+MES2+MES1) /  (ADD_MONTHS(TRUNC(MAX(SYSDATE),'#39'MON' +
        'TH'#39'),0)  - ADD_MONTHS(TRUNC(SYSDATE,'#39'MONTH'#39'),-3) - NVL(DIAS_ESTO' +
        'QUE_ZERO,0)),2) MEDIA,'
      
        '   ADD_MONTHS(TRUNC(MAX(SYSDATE),'#39'MONTH'#39'),0) -  ADD_MONTHS(TRUNC' +
        '(SYSDATE,'#39'MONTH'#39'),-3) AS NR_DIAS,'
      '   DS_NIVEL_EITM,'
      '   DS_NIVEL_ERGM,'
      '   NR_DIAS_DIV,'
      '   cd_comprador,'
      '   CD_EMPRESA'
      'FROM'
      '('
      'SELECT'
      '   MERC.CD_MERCADORIA AS NR_PRODUTO,'
      '   MERC.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_PRODUTO,'
      '   MERC.NM_MERCADORIA NM_PRODUTO,'
      '   MERC.DS_APRESENTACAO_MERCADORIA AS NM_APRESENTACAO,'
      '   DS_UNIDADE_MEDIDA UNID,'
      '   VL_PRECO_VENDA PRECO_VENDA,'
      '   NVL(UNI_PENDENTE,0) AS UNI_PENDENTE,'
      '   NVL(VTPENDENCIAFABRICA,0) AS VTPENDENCIAFABRICA,'
      '   NVL(VTPENDENCIACUSTO,0) AS VTPENDENCIACUSTO,'
      '   CM1.ID_CURVA_MERCADORIA AS CURVA,'
      
        '   (QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMAT' +
        'ICA) AS ESTOQUE,'
      '   GF.CD_GRUPO_CURVA_FABRICANTE GRUPO_CURVA,'
      '   QT_DIAS_LEADTIME_FABRICANTE LEADTIME,'
      '   QT_ESTOQUE_MAXIMO,'
      '   QT_EMBALAGEM_COMPRA AS EMB_COMPRA,'
      '   PC_DESCONTO_PADRAO_COMPRA,'
      '   DS_NIVEL_EITM,'
      '   DS_NIVEL_ERGM,'
      '   cd_comprador,'
      '   EM.CD_EMPRESA'
      'FROM'
      'PRDDM.DC_ESTOQUE_MERCADORIA EM'
      
        'JOIN PRDDM.DC_COMPRA_MERCADORIA CM1 ON CM1.CD_MERCADORIA=EM.CD_M' +
        'ERCADORIA AND CM1.CD_EMPRESA=EM.CD_EMPRESA and  CM1.CD_EMPRESA=1'
      
        'JOIN PRDDM.DC_MERCADORIA MERC ON MERC.CD_MERCADORIA=CM1.CD_MERCA' +
        'DORIA AND CM1.CD_GRUPO_FORNECEDOR=:PNRLABORATORIO AND CM1.ID_SIT' +
        'UACAO_MERCADORIA<>'#39'I'#39
      
        'JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FM ON FM.CD_MERCADORIA=MERC.' +
        'CD_MERCADORIA AND FM.CD_MERCADORIA=CM1.CD_MERCADORIA  AND  FM.CD' +
        '_EMPRESA=EM.CD_EMPRESA  '
      
        'JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON   GF.CD_GRUPO_FORNECEDOR=CM' +
        '1.CD_GRUPO_FORNECEDOR'
      
        'JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM ON GFM.CD_GRUPO_CU' +
        'RVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE AND GFM.ID_CURVA_MER' +
        'CADORIA=CM1.ID_CURVA_MERCADORIA'
      'LEFT OUTER JOIN'
      '(SELECT   CM1.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,'
      '         NVL(SUM(QUAY_Y  - CHEY_Y),0) AS UNI_PENDENTE,'
      
        '         NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIA' +
        'FABRICA,'
      
        '         NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCI' +
        'ACUSTO,'
      '         NM_MERCADORIA,'
      '         DS_APRESENTACAO_MERCADORIA'
      ''
      ' FROM'
      '   PRDDM.DCPCC,'
      '   PRDDM.DCPCI,'
      '   PRDDM.DC_COMPRA_MERCADORIA CM1,'
      '   PRDDM.DC_MERCADORIA M1'
      ' WHERE'
      '    NROP_P=NROP_Y'
      '   AND NROM_Y=CM1.CD_MERCADORIA'
      '   AND CM1.CD_MERCADORIA=M1.CD_MERCADORIA'
      '   AND SITP_P IN('#39'N'#39','#39'P'#39')'
      '   AND SITY_Y IN('#39'N'#39','#39'P'#39')'
      '   AND CM1.CD_GRUPO_FORNECEDOR = :PNRLABORATORIO'
      '   AND CM1.CD_EMPRESA=1'
      
        'GROUP BY CM1.CD_MERCADORIA*10+NR_DV_MERCADORIA,NM_MERCADORIA,DS_' +
        'APRESENTACAO_MERCADORIA) PENDENCIA ON PENDENCIA.CD_PRODUTO=MERC.' +
        'CD_MERCADORIA*10+NR_DV_MERCADORIA) PRODUTO'
      'LEFT OUTER JOIN (SELECT'
      '      CD_MERCADORIA AS NR_PRODUTO_2,'
      '      SUM(NVL(DECODE(PERIODO,'#39'MES3'#39',QT_VENDIDA),0)) AS MES3,'
      '      SUM(NVL(DECODE(PERIODO,'#39'MES2'#39',QT_VENDIDA),0)) AS MES2,'
      '      SUM(NVL(DECODE(PERIODO,'#39'MES1'#39',QT_VENDIDA),0)) AS MES1,'
      '      SUM(NVL(DECODE(PERIODO,'#39'MES0'#39',QT_VENDIDA),0)) AS MES0,'
      '      SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,'
      '      SUM(NR_DIAS_DIV) AS NR_DIAS_DIV,'
      '      SUM(QT_VENDIDA) AS QT_VENDA'
      '    FROM'
      ''
      ''
      ''
      '(SELECT'
      '           cm.CD_MERCADORIA ,'
      '           Sum(QT_VENDIDA) QT_VENDIDA,'
      '           case'
      
        '            WHEN CD_OPERADOR_LOGISTICO=1 then Sum(QT_DIAS_ESTOQU' +
        'E_ZERO) '
      '           end QT_DIAS_ESTOQUE_ZERO,  '
      
        '         DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,'#39'MO' +
        'NTH'#39'),-3),'#39'MES3'#39
      
        '                        ,ADD_MONTHS(TRUNC(SYSDATE,'#39'MONTH'#39'),-2),'#39 +
        'MES2'#39
      
        '                        ,ADD_MONTHS(TRUNC(SYSDATE,'#39'MONTH'#39'),-1),'#39 +
        'MES1'#39
      
        '                        ,ADD_MONTHS(TRUNC(SYSDATE,'#39'MONTH'#39'),00),'#39 +
        'MES0'#39') AS PERIODO,'
      
        '           (ADD_MONTHS(TRUNC(MAX(SYSDATE),'#39'MONTH'#39'),-1)  - TRUNC(' +
        'MAX(DT_VENDA_MERCADORIA))) NR_DIAS_DIV'
      ' '
      ''
      ' FROM '
      ''
      'prddm.dc_venda_acumulada_mercadoria VM,'
      'PRDDM.DC_COMPRA_MERCADORIA CM'
      'WHERE'
      '   VM.CD_MERCADORIA=cm.cd_mercadoria'
      '   AND    VM.CD_empresa=cm.cd_empresa'
      '   AND cm.cd_empresa=1'
      '   AND cd_grupo_fornecedor=:PNRLABORATORIO'
      
        '   AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,'#39'MONTH'#39'),-' +
        '3)'
      
        '   GROUP BY cm.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOG' +
        'ISTICO)'
      
        '   GROUP BY CD_MERCADORIA) VENDA ON VENDA.NR_PRODUTO_2 =NR_PRODU' +
        'TO'
      ' WHERE'
      '           cd_comprador=:PnrComprador'
      '   GROUP BY'
      '    NR_PRODUTO,'
      '    CD_PRODUTO,'
      '    NM_PRODUTO,'
      '    NM_APRESENTACAO,'
      '    UNID,'
      '    PRECO_VENDA,'
      '    UNI_PENDENTE,'
      '    VTPENDENCIAFABRICA,'
      '    VTPENDENCIACUSTO,'
      '    CURVA,'
      '    ESTOQUE,'
      '   GRUPO_CURVA,'
      '   QT_ESTOQUE_MAXIMO,'
      '   MES3,'
      '   MES2,'
      '   MES1,'
      '   MES0,'
      '   GRUPO_CURVA,'
      '   LEADTIME ,'
      '   QT_ESTOQUE_MAXIMO,'
      '   NR_PRODUTO,'
      '   UNI_PENDENTE,'
      '   VTPENDENCIAFABRICA,'
      '   VTPENDENCIACUSTO,'
      '   GRUPO_CURVA,'
      '   LEADTIME,'
      '   CURVA,'
      '   DIAS_ESTOQUE_ZERO,'
      '   EMB_COMPRA,'
      '   PC_DESCONTO_PADRAO_COMPRA,'
      '   DS_NIVEL_EITM,'
      '   DS_NIVEL_ERGM,'
      '   NR_DIAS_DIV,'
      '   cd_comprador,'
      '   CD_EMPRESA'
      ''
      ''
      'ORDER BY NM_PRODUTO,NM_APRESENTACAO))')
    SQLConnection = _dm._conexao
    Left = 440
    Top = 56
  end
  object _dspSugestaoCompra: TDataSetProvider
    DataSet = _sqlSugestaoCompra
    Options = [poAllowCommandText]
    Left = 528
    Top = 56
  end
  object _sqlEspecealidade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PnrLaboratorio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PnrLaboratorio'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '(select'
      '         DS_DESCRICAO_ESTRUTURA AS ESPECEALIDADE,'
      '         NR_SEQUENCIAL'
      'from'
      '    PRDDM.DC_CLASSIFICACAO_PRODUTO,'
      '    PRDDM.DCMER'
      'where'
      '      NR_SEQUENCIAL=EITM_M'
      '      AND LABM_M = :PnrLaboratorio'
      '      AND LINM_M<>'#39'I'#39
      '      AND ECNM_M=1'
      'GROUP BY '
      '         DS_DESCRICAO_ESTRUTURA ,'
      '         NR_SEQUENCIAL)'
      'UNION ALL'
      '(select'
      '         DS_DESCRICAO_ESTRUTURA AS ESPECEALIDADE,'
      '         NR_SEQUENCIAL'
      'from'
      '    PRDDM.DC_CLASSIFICACAO_PRODUTO,'
      '    PRDDM.DCMER'
      'where'
      '      NR_SEQUENCIAL=ERGM_M'
      '      AND LABM_M = :PnrLaboratorio'
      '      AND LINM_M<>'#39'I'#39
      '      AND ECNM_M>1'
      'GROUP BY '
      '         DS_DESCRICAO_ESTRUTURA ,'
      '         NR_SEQUENCIAL)'
      ''
      'ORDER BY  ESPECEALIDADE')
    SQLConnection = _dm._conexao
    Left = 144
    Top = 128
  end
  object _cdsEspecealidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PnrLaboratorio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PnrLaboratorio'
        ParamType = ptInput
      end>
    ProviderName = '_dspEspecealidade'
    Left = 328
    Top = 128
  end
  object _dspEspecealidade: TDataSetProvider
    DataSet = _sqlEspecealidade
    Left = 240
    Top = 128
  end
  object _sqlPendencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PNR_LABORATORIO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT  '
      
        '  NROM_Y,NROP_P,DATP_P,SITY_Y,LABP_P, SUM(QUAY_Y - CHEY_Y) AS QT' +
        '_PENDENTE,'
      '  SUM((QUAY_Y - CHEY_Y)* PFBY_Y) AS VL_PENDENCIA_FABRICA,'
      
        '  SUM((QUAY_Y - CHEY_Y)* VCCI_Y) AS VL_PENDENCIA_CUSTO,ITEM.CD_E' +
        'MPRESA'
      ''
      'FROM'
      '    PRDDM.DCPCC CAPA,'
      '    PRDDM.DCPCI  ITEM'
      'WHERE'
      '      NROP_P=NROP_Y'
      '  AND SITY_Y IN('#39'N'#39','#39'P'#39')'
      '  AND SITP_P IN('#39'N'#39','#39'P'#39')'
      '  AND LABP_P = :PNR_LABORATORIO'
      'GROUP BY NROM_Y,SITY_Y,LABP_P,NROP_P,DATP_P,ITEM.CD_EMPRESA'
      'ORDER BY DATP_P,NROM_Y')
    SQLConnection = _dm._conexao
    Left = 144
    Top = 192
  end
  object _cdsPendencia: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PNR_LABORATORIO'
        ParamType = ptInput
      end>
    Left = 328
    Top = 200
  end
  object _dspPendencia: TDataSetProvider
    DataSet = _sqlPendencia
    Options = []
    Left = 232
    Top = 192
  end
  object _dsPedidosPendentes: TDataSource
    DataSet = _cdsPedidosPendentes
    Left = 392
    Top = 256
  end
  object _cdsPedidosPendentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 256
    object _cdsPedidosPendentesNR_PRODUTO: TIntegerField
      FieldName = 'NR_PRODUTO'
    end
    object _cdsPedidosPendentesDS_PEDIDO: TStringField
      FieldName = 'DS_PEDIDO'
      Size = 250
    end
    object _cdsPedidosPendentesCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
    end
  end
  object _dsEpecealidade: TDataSource
    DataSet = _cdsEspecealidade
    Left = 424
    Top = 136
  end
end
