object _frmComprasNova: T_frmComprasNova
  Left = 0
  Top = 0
  Caption = 'Compras'
  ClientHeight = 537
  ClientWidth = 1162
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 864
    Top = 504
    Width = 105
    Height = 25
    Caption = 'Gera Grafico'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = -4
    Width = 687
    Height = 345
    Caption = 'GroupBox1'
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 216
      Width = 64
      Height = 13
      Caption = 'M'#233'dia Mensal'
    end
    object Label2: TLabel
      Left = 3
      Top = 239
      Width = 52
      Height = 13
      Caption = 'Venda Mes'
    end
    object Label3: TLabel
      Left = 3
      Top = 261
      Width = 49
      Height = 13
      Caption = 'Pendencia'
    end
    object _lbEstoque: TLabel
      Left = 3
      Top = 284
      Width = 39
      Height = 13
      Caption = 'Estoque'
    end
    object Label4: TLabel
      Left = 3
      Top = 307
      Width = 65
      Height = 13
      Caption = 'Cob. Estoque'
    end
    object Label5: TLabel
      Left = 3
      Top = 329
      Width = 89
      Height = 13
      Caption = 'Cob. Estq + Pend.'
    end
    object Chart1: TChart
      Left = 2
      Top = 15
      Width = 683
      Height = 188
      Legend.Alignment = laBottom
      Title.Text.Strings = (
        'TChart')
      OnClickSeries = Chart1ClickSeries
      DepthAxis.Visible = True
      LeftAxis.TickInnerLength = 4
      TopAxis.Title.Angle = 270
      Zoom.Allow = False
      Align = alTop
      TabOrder = 0
      ColorPaletteIndex = 11
      object Series1: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Callout.Distance = 5
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clTeal
        Title = 'Geral'
        ValueFormat = '0'
        Emboss.Color = 8947848
        MultiBar = mbNone
        Shadow.Color = 8947848
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series3: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Style = smsValue
        Marks.Visible = True
        Title = 'OL'
        Emboss.Color = 8684676
        MultiBar = mbNone
        Shadow.Color = 8750469
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series2: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Style = smsValue
        Marks.Visible = True
        Title = 'GAM'
        Emboss.Color = 8618883
        MultiBar = mbNone
        Shadow.Color = 8618883
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
    object _edtMediaEmpresa: TEdit
      Left = 272
      Top = 321
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object _edtMediaCd: TEdit
      Left = 92
      Top = 206
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object _edtMediaDia: TEdit
      Left = 399
      Top = 321
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 92
      Top = 231
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object _edtPendenciaMes: TEdit
      Left = 92
      Top = 253
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object _edtEstoque: TEdit
      Left = 92
      Top = 276
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object Edit4: TEdit
      Left = 92
      Top = 298
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object Edit5: TEdit
      Left = 92
      Top = 321
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 416
    Top = 347
    Width = 577
    Height = 157
    Caption = 'GroupBox2'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 573
      Height = 140
      Align = alClient
      DataSource = _dsVendaFornecedor
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object _edt: TEdit
    Left = 144
    Top = 508
    Width = 113
    Height = 21
    TabOrder = 3
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 348
    Width = 410
    Height = 157
    Caption = 'GroupBox2'
    TabOrder = 4
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 406
      Height = 140
      Align = alClient
      DataSource = _dsPrtoduto
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object BitBtn2: TBitBtn
    Left = 536
    Top = 510
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object _dtpData: TDateTimePicker
    Left = 296
    Top = 508
    Width = 129
    Height = 21
    Date = 42949.492490567130000000
    Time = 42949.492490567130000000
    TabOrder = 6
  end
  object _cdsVendaFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 40
  end
  object _dsVendaFornecedor: TDataSource
    DataSet = _cdsVendaFornecedor
    Left = 136
    Top = 40
  end
  object _cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = _cdsProdutoAfterScroll
    AfterRefresh = _cdsProdutoAfterRefresh
    AfterRowRequest = _cdsProdutoAfterRowRequest
    Left = 88
    Top = 400
  end
  object _dsPrtoduto: TDataSource
    DataSet = _cdsProduto
    OnDataChange = _dsPrtodutoDataChange
    Left = 232
    Top = 384
  end
end
