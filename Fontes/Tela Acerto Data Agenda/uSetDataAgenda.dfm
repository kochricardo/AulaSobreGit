inherited _frmAcertaDataAgenda: T_frmAcertaDataAgenda
  Caption = 'Acerta Data Agenda'
  ExplicitWidth = 869
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TGroupBox
    Height = 65
    ExplicitHeight = 65
  end
  inherited GroupBox2: TGroupBox
    Top = 65
    ExplicitTop = 65
    inherited DBGrid1: TDBGrid
      DataSource = dsDadosFornecedor
    end
  end
  inherited GroupBox3: TGroupBox
    Top = 313
    ExplicitTop = 313
    inherited _btnExecuta: TBitBtn
      OnClick = _btnExecutaClick
    end
    inherited _btnParaExcel: TBitBtn
      Caption = 'Atualiza Data'
      OnClick = _btnParaExcelClick
    end
    object _lbeNumeroComprador: TLabeledEdit
      Left = 240
      Top = 72
      Width = 121
      Height = 21
      EditLabel.Width = 71
      EditLabel.Height = 13
      EditLabel.Caption = 'Nr. Comprador'
      NumbersOnly = True
      TabOrder = 3
    end
  end
  inherited _cdsBase: TClientDataSet
    Left = 688
    Top = 16
  end
  object dsDadosFornecedor: TDataSource
    DataSet = _cdsDadosFornecedor
    Left = 760
    Top = 96
  end
  object _cdsDadosFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _dm._LocalConexao
    Left = 688
    Top = 96
  end
end
