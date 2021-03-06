UNIT uTelaCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DB,
  DBClient, Grids, DBGrids, dateUtils, ComCtrls, Gauges, StrUtils, SqlExpr,
  Mask, uAgendaLaboratorio, uProduto,
  uRotinasGenericas, uAuxiliarCompras, uRelatorioVerbas, Spin, uDividiPedido,
  uSistemaCompras, uConfirmaPedido, uPendenciaItem, uPrecoDescontoItem,
  uUltimosPedidos, Keyboard;


type
  TAuxDBGrid = class(TDBGrid);

  T_frmCompras = class(TForm)
    _dsVendalaboratorio: TDataSource;
    _stbCompras: TStatusBar;
    _dsProduto: TDataSource;
    _cdsProduto: TClientDataSet;
    _cdsPrecoLista: TClientDataSet;
    _cdsParamentoCompra: TClientDataSet;
    _cdsLaboratorio: TClientDataSet;
    _cdsEstoqueDiario: TClientDataSet;
    _cdsVendalaboratorio: TClientDataSet;
    _cdsUltimasCompra: TClientDataSet;
    _cdsitemPedido: TClientDataSet;
    _cdsIndiceFaltaAnterior: TClientDataSet;
    _cdsIndiceFaltaAtual: TClientDataSet;
    _cdsVendaAnualLaboratorio: TClientDataSet;
    _pgcCompras: TPageControl;
    _tbsParametros: TTabSheet;
    _lbeNrLaboratorio: TLabeledEdit;
    _lbeNrPedido: TLabeledEdit;
    _tbsSugestao: TTabSheet;
    _tbsCompras1: TTabSheet;
    Series1: TBarSeries;
    _tbsConfirma: TTabSheet;
    BitBtn2: TBitBtn;
    _tbsCompras: TTabSheet;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    _dtpDataAgendada: TDateTimePicker;
    _dtpDataPedido: TDateTimePicker;
    _dtpProximaAgenda: TDateTimePicker;
    _dtpDataUltimoPedidoMes: TDateTimePicker;
    _lbeNumeroProduto: TLabeledEdit;
    _cdsCapaPedido: TClientDataSet;
    _cdsCondicaoPagamentoCDSC: TClientDataSet;
    _cdsCondicaoPagamentoCDSCNR_DIAS: TIntegerField;
    _cdsCondicaoPagamentoCDSCNR_PARCELA: TAutoIncField;
    _dsParcelaPrazoCDSC: TDataSource;
    _grbParcelaPrazo: TGroupBox;
    _dbgPrazoSC: TDBGrid;
    _cdsEspecealidade: TClientDataSet;
    _dsEspecealidade: TDataSource;
    _dsItemPedido: TDataSource;
    _grbGraficoVendasSC: TGroupBox;
    _chtVendasSC: TChart;
    _lbeCurvaSC: TLabel;
    _grbGraficoVendasRS: TGroupBox;
    _chtvendasRS: TChart;
    Series8: TBarSeries;
    _lbeCurvaRS: TLabel;
    _grbPosicaoEstoqueSC: TGroupBox;
    _lbeMediaMensalSC: TLabeledEdit;
    _lbeVendaMensalSC: TLabeledEdit;
    _lbePendenciaSC: TLabeledEdit;
    _lbeEstoqueSC: TLabeledEdit;
    _lbeCoberturaEstoqueSC: TLabeledEdit;
    _LbeCoberturaEstoquePendenciaSC: TLabeledEdit;
    GroupBox7: TGroupBox;
    _lbeMediaMensalRS: TLabeledEdit;
    _lbeVendaMensalRS: TLabeledEdit;
    _lbePendenciaRS: TLabeledEdit;
    _lbeEstoqueRS: TLabeledEdit;
    _lbeCoberturaEstoqueRS: TLabeledEdit;
    _LbeCoberturaEstoquePendenciaRS: TLabeledEdit;
    _grbEmpresa: TGroupBox;
    _lbeMediaMensalEmpresa: TLabeledEdit;
    _lbeVendaMensalEmpresa: TLabeledEdit;
    _lbePendenciaEmpresa2: TLabeledEdit;
    _lbeEstoqueEmpresa2: TLabeledEdit;
    _lbeCoberturaEstoqueEmpresa2: TLabeledEdit;
    _LbeCoberturaEstoquePendenciaEmpresa2: TLabeledEdit;
    _cdsIndicePreco: TClientDataSet;
    _cbxListaPreco: TComboBox;
    Label15: TLabel;
    BitBtn1: TBitBtn;
    _gbHistoricoPedido: TGroupBox;
    Chart2: TChart;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series5: TBarSeries;
    Series3: TLineSeries;
    _gbDadosCompras: TGroupBox;
    _lbeMedia: TLabeledEdit;
    _gbxSugestaoGeral: TGroupBox;
    Label14: TLabel;
    _lbeSugestaoIdealEmpresa: TLabeledEdit;
    _lbeSugestaoPossivelEmpresa: TLabeledEdit;
    _lbeDiasEstoqueEmpresa: TLabeledEdit;
    _gbxSugestaoRS: TGroupBox;
    _lbeSugestaoIdealRS: TLabeledEdit;
    _lbeSugestaoPossivelRS: TLabeledEdit;
    _lbeDiasEstoqueRS: TLabeledEdit;
    _gbxSugestaoSC: TGroupBox;
    _lbeSugestaoIdealSC: TLabeledEdit;
    _lbeSugestaoPossivelSC: TLabeledEdit;
    _lbeDiasEstoqueSC: TLabeledEdit;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    _edtCaixaRS: TEdit;
    _edtCamadaRS: TEdit;
    _edtPaleteRS: TEdit;
    Label19: TLabel;
    _edtCaixaSC: TEdit;
    _edtCamadaSC: TEdit;
    _edtPaleteSC: TEdit;
    Label20: TLabel;
    _edtCaixaEmpresa: TEdit;
    _edtCamadaEmpresa: TEdit;
    _edtPaleteEmpresa: TEdit;
    _cdsTemporario: TClientDataSet;
    _cdsPendencia: TClientDataSet;
    _cdsPendenciaSCI: TClientDataSet;
    _lbeQuantidadePedidoSC: TLabeledEdit;
    _lbeQuantidadePedidoRS: TLabeledEdit;
    _grbGraficoGrade: TGroupBox;
    GroupBox6: TGroupBox;
    _lbePrecoListaGrid: TLabeledEdit;
    _lbePercentualRepasseGrid: TLabeledEdit;
    _lbeDescontoPadraoGrid: TLabeledEdit;
    _lbeDescontoAdicionalGrid: TLabeledEdit;
    _lbePrecoNotaGrid: TLabeledEdit;
    _lbeValorCreditoIcmsGrid: TLabeledEdit;
    _lbePrecoCustoGrid: TLabeledEdit;
    _lbeValorVerbaGrid: TLabeledEdit;
    _lbeNumeroVerbaGrid: TLabeledEdit;
    _lbePcVerbaGrid: TLabeledEdit;
    GroupBox8: TGroupBox;
    _lbeMediaGrid: TLabeledEdit;
    _lbeMediaMensalGrid: TLabeledEdit;
    _lbeVendaMensalGrid: TLabeledEdit;
    _lbePendenciaGrid: TLabeledEdit;
    _lbeEstoqueGrid: TLabeledEdit;
    _lbeCoberturaGrid: TLabeledEdit;
    _lbeCoberturaEstoquePend_Grid: TLabeledEdit;
    Label21: TLabel;
    _lbeSugestaoIdealGrid: TLabeledEdit;
    _lbeSugestaoPossivelGrid: TLabeledEdit;
    _lbeDiasEstoque: TLabeledEdit;
    _edtQuantidadeCaixa: TEdit;
    _edtQuantidadeCaixaCamadaGrid: TEdit;
    _edtQuantidadeCaixaPaleteGrid: TEdit;
    _lbeQuantidadePedidoGrid: TLabeledEdit;
    _cdsVendasSC: TClientDataSet;
    _cdsVendasRS: TClientDataSet;
    _grbPedidoCDSC: TGroupBox;
    _dbgPedidoSC: TDBGrid;
    GroupBox5: TGroupBox;
    _dbgPedidoRS: TDBGrid;
    _cdsitemPedidoCDSC: TClientDataSet;
    _dsItemPedidoCDSC: TDataSource;
    _cdsitemPedidoCDRS: TClientDataSet;
    _dsItemPedidoCDRS: TDataSource;
    _lbeUltimaEntradaGrid: TLabeledEdit;
    _lbeUltimaSaidaGrid: TLabeledEdit;
    _chkPcParaVerbaGrid: TCheckBox;
    _grbGraficoGradeEmpresa: TGroupBox;
    _SerieGraficoGradeEmpresa: TChart;
    _lbeCurvaEmpresa: TLabel;
    BitBtn5: TBitBtn;
    Series10: TBarSeries;
    GroupBox9: TGroupBox;
    _lbeMediaEmpresa: TLabeledEdit;
    _lbeVendaMesEmpresa: TLabeledEdit;
    _lbePendenciaEmpresa: TLabeledEdit;
    _lbeEstoqueEmpresa: TLabeledEdit;
    _lbeCoberturaEstoqueEmpresa: TLabeledEdit;
    _LbeCoberturaEstoquePendenciaEmpresa: TLabeledEdit;
    _cdsTabelaPreco: TClientDataSet;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    _lbeSugeridoSC: TLabeledEdit;
    _lbeCompradoSC: TLabeledEdit;
    GroupBox12: TGroupBox;
    _lbeValorSugeridoSC: TLabeledEdit;
    _lbeValorCompradoSC: TLabeledEdit;
    _lbeValorCompradoCustoSC: TLabeledEdit;
    _chkFixaDescontoAdicional: TCheckBox;
    _chkSemDescontoAdicional: TCheckBox;
    _chkDigitaPrecoNota: TCheckBox;
    _chkMostraUltimoDesconto: TCheckBox;
    _cbListaPrecoLocal: TComboBox;
    Label16: TLabel;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    _lbeSugeridoRS: TLabeledEdit;
    _lbeCompradoRS: TLabeledEdit;
    GroupBox15: TGroupBox;
    _lbeValorSugeridoRS: TLabeledEdit;
    _lbeValorCompradoRS: TLabeledEdit;
    _lbeValorCompradoCustoRS: TLabeledEdit;
    Gauge5: TGauge;
    Gauge6: TGauge;
    _cdsEstoqueEmpresa: TClientDataSet;
    _dsEstoqueEmpresa: TDataSource;
    _dsEstoquePendencia: TDataSource;
    _cdsEstoquePendencia: TClientDataSet;
    _btnConfirmaPedido: TBitBtn;
    _cdsVendaMes: TClientDataSet;
    _dsVendaMes: TDataSource;
    GroupBox19: TGroupBox;
    _dbgExcessoEstoque: TDBGrid;
    _lbeGrupoPedido: TLabeledEdit;
    _lbeLeadTime: TLabeledEdit;
    Label2: TLabel;
    _lbeDiaPedido: TLabel;
    _cbxTipoFrete: TComboBox;
    Label3: TLabel;
    _cbxCaixaFechada: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    SpinEdit1: TSpinEdit;
    GroupBox20: TGroupBox;
    _tchVendaAnualGeral: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    GroupBox21: TGroupBox;
    _tchVendaAnualCDSC: TChart;
    GroupBox22: TGroupBox;
    _cdsVendaAnualLaboratorioRS: TClientDataSet;
    _cdsVendaAnualLaboratorioSC: TClientDataSet;
    Series11: TBarSeries;
    Series12: TBarSeries;
    _tchVendaAnualCDRS: TChart;
    Series13: TBarSeries;
    Series14: TBarSeries;
    _tchVendasMensal: TChart;
    _lbCurvaSCgrade: TLabel;
    Series9: TBarSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    Series18: TBarSeries;
    Bitbtn4: TBitBtn;
    GroupBox23: TGroupBox;
    _dbgPrazoRS: TDBGrid;
    _dsParcelaPrazoCDRS: TDataSource;
    _cdsCondicaoPagamentoCDRS: TClientDataSet;
    _cdsCondicaoPagamentoCDRSNR_DIAS: TIntegerField;
    _cdsCondicaoPagamentoCDRSNR_PARCELAS: TAutoIncField;
    _cdsSugestaoCompra: TClientDataSet;
    _cdsExcessoEstoque: TClientDataSet;
    _dsSugestaoCompra: TDataSource;
    _dsExcessoEstoque: TDataSource;
    _cdsExcessoEstoqueVL_EXCESSO_VENDA: TFloatField;
    _cdsExcessoEstoqueVL_EXCESSSO_MTS_CUBICO: TFloatField;
    _cdsExcessoEstoqueNR_UNIDADES_EXCESSO: TIntegerField;
    _cdsExcessoEstoqueID_LOCAL: TStringField;
    _cdsExcessoEstoqueCD_EMPRESA: TIntegerField;
    GroupBox24: TGroupBox;
    DBGrid1: TDBGrid;
    _cdsItensCurva: TClientDataSet;
    _dsItensCurva: TDataSource;
    _cdsExcessoEstoqueVL_EXCESSO_CUSTO: TFloatField;
    Series19: TBarSeries;
    _cdsEstoqueMultEmpresa: TClientDataSet;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    _lbeUnidSugEmpresa: TLabeledEdit;
    _lbeUnidCompradoEmpresa: TLabeledEdit;
    GroupBox27: TGroupBox;
    _lbeValorSugEmpresa: TLabeledEdit;
    _lbeValorCompradoEmpresa: TLabeledEdit;
    _lbeValorCompradoCustoEmpresa: TLabeledEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    _chkOcultaCurvaE: TCheckBox;
    _chkOrdenaCurva: TCheckBox;
    _chkCodigoGam: TCheckBox;
    _chkCodigoFornecedor: TCheckBox;
    _lbePesquisa: TLabeledEdit;
    _btnImprimir: TBitBtn;
    _btnImprimirRS: TBitBtn;
    _cdsSugestaoCompraID_LOCAL: TStringField;
    _cdsSugestaoCompraCD_EMPRESA: TIntegerField;
    _cdsSugestaoCompraNR_UNIDADES_SUGERIDA: TIntegerField;
    _cdsSugestaoCompraVL_SUGERIDO_CUSTO: TFloatField;
    _cdsSugestaoCompraVL_SUGERIDO_VENDA: TFloatField;
    _cdsSugestaoCompraVL_SUGERIDO_MTS_CUB: TFloatField;
    _cdsPendenciaItem: TClientDataSet;
    BitBtn6: TBitBtn;
    _chkOcultaCD: TCheckBox;
    _chkRelatorioPrecoCustoRS: TCheckBox;
    _chkMostraDescontoRS: TCheckBox;
    _chkRelatorioPrecoCustoSC: TCheckBox;
    _chkMostraDescontoSC: TCheckBox;
    _lbeSomaDesconto: TLabel;
    _grbCDOposto: TGroupBox;
    _lbeMediaCdOposto: TLabeledEdit;
    _lbeVendaMesCDOposto: TLabeledEdit;
    _lbePendenciaCDOposto: TLabeledEdit;
    _lbeEstoqueCDOposto: TLabeledEdit;
    _lbeCoberturaEstoqueCDOposto: TLabeledEdit;
    _LbeCoberturaEstoquePendenciaCDOposto: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    _edtCD: TEdit;
    GroupBox2: TGroupBox;
    _gaIndiceFaltaAtual: TGauge;
    _gaIndiceFaltaAnterior: TGauge;
    _chkAbreIndiceFalta: TCheckBox;
    _chkMostaIndiceFalta: TCheckBox;
    _cdsProdutoOL: TClientDataSet;
    _chkUltimosPrecosCompra: TCheckBox;
    _cdsUltimosPrecos: TClientDataSet;
    GroupBox28: TGroupBox;
    DBGrid2: TDBGrid;
    Timer1: TTimer;
    _cdsDiasVenda: TClientDataSet;
    _cdsDiasAZero: TClientDataSet;
    _cdsEmbalagemMercadoria: TClientDataSet;
    _cdsTabelaProduto: TClientDataSet;
    _cdsDadosFornecedor: TClientDataSet;
    _cdsDataUltimaCompra: TClientDataSet;
    GroupBox29: TGroupBox;
    _dbgDiasEstoque: TDBGrid;
    _cdsDiasEstoque: TClientDataSet;
    _dsDiasEstoque: TDataSource;
    _chkDiasEstoqueComPendencia: TCheckBox;
    _cdsDiasEstoque_teste: TClientDataSet;
    _cdsDiasEstoque_testenmCD: TStringField;
    _cdsDiasEstoque_testeVL_ESTOQUE_FORNECEDOR: TFloatField;
    _cdsDiasEstoque_testeVL_ESTOQUE_COMPRADOR: TFloatField;
    _cdsDiasEstoque_testeVL_ESTOQUE_FORN_PEND: TFloatField;
    _cdsDiasEstoque_testeVL_ESTOQUE_COMPR_PENDENCIA: TFloatField;
    _dsDiasEstoque_teste: TDataSource;
    _cdsDiasEstoque_testeCD_EMPRESA: TIntegerField;
    _lbevtCMV: TLabeledEdit;
    _pnRestricao: TPanel;
    _mmAlertaRecall: TMemo;
    Label31: TLabel;
    Label32: TLabel;
    _edtNrdiasCompraSC: TEdit;
    _edtNrdiasCompraRS: TEdit;
    _btnRecalculaSugestao: TBitBtn;
    _chkUltimoDesconto: TCheckBox;
    _btnMediaMaior: TBitBtn;
    _btnMediaMenor: TBitBtn;
    _chkAjustaCamadaPalete: TCheckBox;
    _chkUltimoDescontoInicio: TCheckBox;
    _edtNrVerbaInicio: TEdit;
    _lbNrVerbaInicio: TLabel;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    _dbgSugestao: TDBGrid;
    GroupBox18: TGroupBox;
    _dbgVendaMes: TDBGrid;
    GroupBox17: TGroupBox;
    _dbgEstoquePendencia: TDBGrid;
    GroupBox16: TGroupBox;
    _dbgEstoqueEmpresa: TDBGrid;
    GroupBox40: TGroupBox;
    _cdsListaPrecoAtiva: TClientDataSet;
    _dsListaPreco: TDataSource;
    GroupBox41: TGroupBox;
    _dbgPrePedido: TDBGrid;
    _cdsPrePedido: TClientDataSet;
    _dsPrePedido: TDataSource;
    _cdsTabelaLeadTime: TClientDataSet;
    Label23: TLabel;
    _cbxFiltroItemPedido: TComboBox;
    _cdsIndicedeFalta: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _chtVendasSCClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure _lbeDiasEstoqueEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeQtadePedido2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure _lbeNrLaboratorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure _lbeDescontoAdicionalKeyPress(Sender: TObject; var Key: Char);
    procedure _lbePrecoNotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbePrecoNotaKeyPress(Sender: TObject; var Key: Char);
    procedure _tbsCompras1Enter(Sender: TObject);
    procedure _chkFiltroAtivoClick(Sender: TObject);
    procedure _dbgEspecealidadeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgEspecealidadeCellClick(Column: TColumn);
    procedure _lbeNumeroVerbaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbePcVerbaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _cedQtdadePedidoEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    // function TotalizaPedido(nrPedido, nrMercadoria: Integer;
    // idSituacao: String): Boolean;
    procedure _cbxListaPrecoChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _cedQtdadePedidoSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _cbxListaPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _cbxOpcaoCDsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure _cbxOpcaoCDsChange(Sender: TObject);
    procedure _pgcComprasChange(Sender: TObject);
    procedure _cbxOpcaoCDsEnter(Sender: TObject);
    procedure _lbeDiasEstoqueSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeQuantidadePedidoSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgGradeProdutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _cdsIndiceFaltaAtualAfterRefresh(DataSet: TDataSet);
    procedure _dsGradeProdutoDataChange(Sender: TObject; Field: TField);
    procedure _dbgGradeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeQuantidadePedidoGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeDiasEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeDescontoAdicionalGridKeyPress(Sender: TObject; var Key: Char);
    procedure _lbeDescontoAdicionalGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPedidoSCDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPedidoRSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnConfirmaPedidoClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Bitbtn4Click(Sender: TObject);
    procedure _dbgEstoqueEmpresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgEstoquePendenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgVendaMesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgExcessoEstoqueDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _chkOrdenaCurvaClick(Sender: TObject);
    procedure _chkOcultaCurvaEClick(Sender: TObject);
    procedure _tchVendasMensalClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure _lbeNrPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeNrPedidoExit(Sender: TObject);
    procedure _lbePesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeDescontoAdicionalGridEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure _btnImprimirClick(Sender: TObject);
    procedure _btnImprimirRSClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure _lbePendenciaGridDblClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure _lbCurvaSCgradeClick(Sender: TObject);
    procedure _chkOcultaCDClick(Sender: TObject);
    procedure _lbePesquisaChange(Sender: TObject);
    procedure _edtQuantidadeCaixaCamadaGridDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure _chkAbreIndiceFaltaClick(Sender: TObject);
    procedure _chkMostaIndiceFaltaClick(Sender: TObject);
    procedure _lbeNumeroVerbaGridExit(Sender: TObject);
    procedure _lbeEstoqueGridChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure _lbeQuantidadePedidoGridEnter(Sender: TObject);
    procedure _lbeQuantidadePedidoGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure _dbgDiasEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _chkDiasEstoqueComPendenciaClick(Sender: TObject);
    procedure _pnRestricaoClick(Sender: TObject);
    procedure _mmAlertaRecallClick(Sender: TObject);
    procedure _btnRecalculaSugestaoClick(Sender: TObject);
    procedure _chkUltimoDescontoInicioClick(Sender: TObject);
    procedure _chkUltimoDescontoClick(Sender: TObject);
    procedure _dbgListaPrecoDblClick(Sender: TObject);
    procedure _dbgPrePedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dsPrePedidoDataChange(Sender: TObject; Field: TField);
    procedure _cdsPrePedidoAfterScroll(DataSet: TDataSet);
    procedure _cdsPrePedidoBeforeScroll(DataSet: TDataSet);
    procedure _cdsPrePedidoAfterRefresh(DataSet: TDataSet);
    procedure _dbgPrePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPrePedidoColEnter(Sender: TObject);
    procedure _dbgPrePedidoEnter(Sender: TObject);
    procedure _dbgPrePedidoExit(Sender: TObject);
    procedure _dbgPrePedidoMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure _dbgPrePedidoTitleClick(Column: TColumn);
    procedure _cbxFiltroItemPedidoChange(Sender: TObject);
    procedure _dbgPrePedidoDblClick(Sender: TObject);
    procedure _dbgPrePedidoCellClick(Column: TColumn);
    procedure _dbgListaPrecoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    idMostraGraficoVendaCdOposto: Boolean;
    idBloqueiaTeclaEnter, IdRecalculo: Boolean;
    nmInidiceNomeProduto: String;
    pcGeracaoVerba: Double;
    nrGeracaoVerba: Integer;
    nrCompradorPedido: Integer;
    nrPedidoTelaCompra, NrPedidoSC, NrPedidoRS: Integer;
    DadosFornecedor: TDadosFornecedor;
    nrLaboratorioLocal: Integer;
    DadosPendencia: TDadosPendenciaPedido;
    NrDiasCompraSC, NrDiasCompraRS: Integer;

    // procedure MontaGraficodeVendas(nrProduto: Integer);
    procedure AbreProdutosLaboratorio(PnrLaboratorio, PnrComprador,
      PcdEmpresa: Integer);
    // procedure AbreListaPrecoLaboratorio(nrLaboratorio: Integer);
    procedure AbreLaboratorio(nrLaboratorio: Integer);
    procedure AbreParamentoCompraLaboratorio(nrGrupo: Integer);
    procedure MontaGraficoPedidos(nrEmpresa, nrProduto, qtMaximaEstoque,
      qtMinimaEstoque, qtEstoqueDia: Integer);
    procedure AbreEstoqueDiario(PnrLaboratorio, PnrProduto, PnrCD: Integer);
    function AbreVendaLaboratorio(nrLaboratorio, nrEmpresa: Integer)
      : TClientDataSet;
    procedure MostraDaDosCalculo;
    function CoberturaEstoqueDia(qtEstoque, qtPendencia: Integer;
      vlMediaDia: Double): Double;
    function AbrePendenciaLaboratorio(nrLaboratorio, nrEmpresa: Integer)
      : TClientDataSet;
    procedure setParamentroCompra(PnrDiasEstoque: Integer; idCurva: Char);
    function AbreUltimasCompraLaboratorio(nrLaboratorio, nrOperadorLogistico,
      cdEmpresa: Integer): TClientDataSet;
    function MontaGraficoUltimasCompras(nrProduto: Integer;
      dtCompra: tdate): Boolean;
    function FiltraUltimasCompras(nrProduto, PcdEmpresa: Integer;
      dtCompra: tdate): Boolean;
    { function GravaItemPedido(NROP_Y, NROM_Y, QUAY_Y, CHEY_Y, NRVV_Y, PRZY_Y,
      QT_BONIFICADA, NR_OPERADOR_LOGISTICO, qtDiasEstoque, qtSugerida: Integer;
      PUNY_Y, PFBY_Y, VCCI_Y, ABTY_Y, DADY_Y, DFIY_Y, PC_VERBA,
      VL_MARGEM_PADRAO, VL_MARGEM_NEGOCIADA, VL_VERBA, PC_BONIFICACAO,
      PC_DESCONTO_OL, vlMediaMensal: double; ID_DESCONTO_ACUMULATIVO, ID_MARGEM,
      SITY_Y: String): Boolean;
    } function AbreItemPedidoV(nrPedido, nrMercadoria: Integer;
      idSituacao: String): Boolean;
    procedure AbreIndiceFaltaAnterior(PnrLaboratorio, PnrProduto: Integer);
    procedure AbreIndiceFaltaAtual(PnrLaboratorio, PnrProduto: Integer);
    function SetIndiceAnterior(PnrProduto, PnrCD: Integer): Integer;
    function SetIndiceAtual(PnrProduto, PnrCD: Integer): Integer;
    procedure GetIndiceFaltaAnterior(PnrProduto, PnrCD: Integer);
    procedure GetIndiceFaltaAtual(PnrProduto, PnrCD: Integer);
    procedure PintaPainelGrafico(curva: String);
    function CalculoSugestaoIdeal(PvlPE,
                                  PnrDiasAjuste,
                                  PLeadTimeCalculo,
                                  PvlMediaDiaria: Double;
                                  PnrQuantidadeEstoque,
                                  PnrQuantidadaPendente : Integer): TDadosQtdadeSugestao;
    function AbreVendaLaboratorioAnual(nrLaboratorio, nrEmpresa: Integer)
      : TClientDataSet;

    function CompraItemInicial(PnrProduto, PnrEmpresa, PqtPedido,
      PqtPedidoSugerida: Integer; PpcDescontoADicional: Double): Boolean;

    procedure MontaGraficodeVendasAnual(nrProduto: Integer);
    function CalculaMediaProduto(PnrProduto, PnrEmpresa: Integer): Double;
    function AbreParamentroLaboratorio(nrLaboratorio: Integer): Boolean;
    function CalculodeExcesso(nrCoberturaEstoque, nrParamentroCompra,
      vlMedia: Double): Double;
    procedure MostraPreco;
    // function AbreCapaPedido(nrPedido, nrLaboratorio: Integer;
    // idSituacao: String): Boolean;
    function PrazoPagamento(tabela: TClientDataSet): string;
    procedure GravaItem(nrPedido, nrProduto, nrQuantidadePedido,
      cdEmpresa: Integer);
    // procedure abreEspecealidade(nrLaboratorio: Integer);
    Function AbreEspecealidade(nrLaboratorio: Integer): TClientDataSet;
    function FiltroEspecealidade(nrEspecealidade: Integer): Boolean;
    procedure SetNomeCampoItemPedido;
    function CalculoMediaNovo(nrProduto, nrfrequencia: Integer): Double;
    procedure PintaCampoCoberturaEstoqueSC(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoqueRS(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoquePendenciaSC(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure SetPrecoSC;
    procedure MostraHistoricodePedidoRS(nrLaboratorio, nrProduto: Integer;
      idHistorico: Boolean);
    procedure SetCamposSugestaoIdeal(vlSugest?oIdealSC,
      vlSugest?oIdealRS: Double);
    procedure SetCamposSugestaoPossivel(vlSugest?oPossivelSC,
      vlSugestaoPossivelRS: Double);
    procedure SetCamposDiasEstoque(nrDiasEstoqueSC, nrDiasEstoqueRS: Double);
    procedure SetCamposQuantidaPedido(nrQtdpedidoSC, nrQtdpedidoRS: Double);
    procedure MostraHistoricodePedidoSC(nrLaboratorio, nrProduto: Integer;
      idHistorico: Boolean);
    procedure MontaGraficodeVendasRS(nrProduto: Integer);
    procedure MontaGraficodeVendasSC(nrProduto: Integer);
    // procedure MontaGraficodeVendas(nrProduto: Integer);
    procedure MontaGraficoVenda;
    procedure SetDadosPedidoEntrada;
    procedure SetDadosPedidoSaida;
    procedure SetCamposCaixaCamadaEmpresa;
    procedure SetCamposCaixaCamadaPaleteSC;
    procedure SetCamposCaixaCamadaPaleteRS;
    procedure SetCorEstoqueSC;
    procedure SetCorEstoqueRS;
    procedure setFocusQuantidadeCompras;
    function GravaItemPedidoNovo(nrPedido, nrQuantidaPedida,
      cdEmpresa: Integer): Integer;
    procedure AbreTelaPreco;
    function AbreListaPrecoLaboratorio(nrLaboratorio, nrEmpresa: Integer)
      : TClientDataSet;
    procedure SetVendasLaboratorio;
    function CriaGradeProduto: Boolean;
    procedure MontaGraficoVendaGrid;
    procedure MontaGraficodeVendasSCGrade(nrProduto, cdEmpresa: Integer);
    procedure MostraDaDosCalculoGrid;
    function AbreVendaLaboratorioMultiEmpresa(nrLaboratorio, nrEmpresa,
      nrOperadorLogistico: Integer): TClientDataSet;
    procedure MontaGraficodeVendasAnualMultiEmpresa(nrProduto,
      nrEmpresa: Integer);
    procedure FiltraVendaLaboratorio(nrProduto, nrEmpresa, nrOperadorLogistico
      : Integer);
    procedure PintaCampoCoberturaEstoqueGrid(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoquePendenciaGrid(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    function AbrePendenciaProduto(nrProduto, nrEmpresa: Integer)
      : TClientDataSet;
    procedure SetCamposCaixaCamadaPaleteGrid;
    procedure SetCamposSugestaoIdealGrid(vlSugest?oIdealGrid,
      vlSugest?oPossivelGrid: Double);
    function SetCompraGrade(nrProduto, nrEmpresa, nrQuantidadePedido
      : Integer): Boolean;
    procedure MontaPedidoGrade;
    procedure MostraDaDosCalculoGridLeve;
    procedure setPosicaoGrid(nrProduto, nrEmpresa: Integer;
      idProximoReg: Boolean);
    procedure MostraGraficoVendaGrid;
    function MaiorVendaProdutoNova(PnrProduto, PnrCD: Integer): Double;
    function MaiorVendaProduto(PnrProduto, PnrEmpresa: Integer): Double;
    procedure SetVendasLaboratorioCD(nrProduto, nrEmpresa, nrRegistro: Integer;
      idCurva: String);
    procedure CarregaTabelaProdutoCD(idEmpresa: Integer);
    function GravaItemAtual(nrPedido, nrProduto, nrQuantidadePedido,
      nrEmpresa: Integer): Boolean;
    function AbreItemPedidoMultiEmpresa(PnrPedido, PnrMercadoria,
      PcdEmpresa: Integer; PidSituacao: String): Boolean;
    function SetPedido(cdEmpresa: Integer): Boolean;
    function AbreItemPedidoMultiEmpresaCDRS(nrPedido, nrMercadoria,
      cdEmpresa: Integer; idSituacao: String): Boolean;
    function AbreItemPedidoMultiEmpresaCDSC(nrPedido, nrMercadoria,
      cdEmpresa: Integer; idSituacao: String): Boolean;
    procedure SetNomeCampoItemPedidoSC;
    procedure SetNomeCampoItemPedidoRS;
    // function SetPrecoItem(nrProduto, nrDigito: Integer): Boolean;
    Function SetPrecoItem(PnrProduto, PnrDigitoProduto, PcdEmpresa, PnrPedido,
      PnrQuantidadeComprada, PnrVerba: Integer;
      PvlNota, PpcDescontoPadrao, PpcAdicional: Double): TCalculoPreco;
    procedure SetPrecoLocal;
    procedure MostraGraficoVendaGridEmpresa;
    procedure setDadosEstoqueEmpresa(vlMediaMensal: Double;
      nrVendaAtual, nrPendenciaEmpresa, nrEstoqueEmpresa, nrCoberturaEstoque,
      nrCobEstoquePendencia: Integer);
    procedure AbrePendenciaGeral(nrLaboratorio: Integer);
    function setPendenciaCD(nrProduto, cdEmpresa: Integer)
      : TDadosPendenciaPedido;
    procedure FiltraProdutoEmpresa(nrProduto, cdEmpresa: Integer);
    function GetPrecoItem(nrProduto, cdEmpresa: Integer;
      vlPrecoFornecedor, pcDescontoAbatimento: Double; IdPrecoAntual: Char;
      idPedidoBloqueado, PnrLIstaPrecoAtiva: Integer): TListaPreco;
    procedure SetValoresPedidos;
    procedure DadosEstoqueEmpresa(nrFornecedor: Integer);
    procedure SetNomeCamposDadosEstoque;
    procedure DadosEstoquePendente(nrFornecedor: Integer);
    procedure SetNomeCamposDadosPendenciaEstoque;
    function AtualizaStatusPedido(idStatus: Char): Boolean;
    procedure DadosVendaMes(nrFornecedor: Integer);
    procedure SetNomeCamposDadosVendaMes;
    procedure MontaGraficodeVendasAnualCDRS(nrProduto: Integer);
    procedure MontaGraficodeVendasAnualCDSC(nrProduto: Integer);
    procedure SetCorQuantidadePedido(qtPedido, qtSugerida: Integer);
    procedure PreparaGraficoHistorico(nrEmpresa, nrForncedor,
      nrProduto: Integer);
    procedure MontaGraficoPedidosNovo(nrEmpresa, nrProduto, qtMaximaEstoque,
      qtMinimaEstoque, qtEstoqueDia: Integer);
    procedure SetCamposForncedor(nrGrupoFornecedor,
      nrLeadTimeFornecedor: Double);
    procedure SetTabelasItensCurva(nrFornecedor: Integer);
    procedure SetGridParamentro;
    procedure MostraGraficoVendaGridCDOposto(nrEmpresa: Integer);
    function AbreEstoqueMultiEmpresa(nrFornecedor, nrEmpresa: Integer)
      : TClientDataSet;
    function GetEstoqueMultEmpresa(nrProduto, nrEmpresa: Integer): Integer;
    procedure PintaCampoCoberturaEstoqueCDOposto(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoquePendenciaCDOposto
      (nrDiasCoberturaEstoque, vlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoqueEmpresa(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoquePendenciaEmpresa(nrDiasCoberturaEstoque,
      vlParamentoCompra: Double);
    procedure setCoresGraficoCurva(idCurva: String);
    procedure OrdenaCamposII(tabela: TClientDataSet; Coluna, Coluna2: TField);
    procedure Orderna;
    procedure SetDadosPreco(vlPreco, pcDescontoRepasse, pcDescontoPadrao,
      pcDescontoADicional: Double);
    function LocalizaProduto(cdGAM, PcdEmpresa: Integer;
      cdfornecedor, nmProduto: String): Boolean;
    function AbreVendaLaboratorioMultiEmpresaII(nrLaboratorio, nrEmpresa,
      nrOperadorLogistico: Integer): TClientDataSet;
    procedure FocoAdicional;
    procedure FocoNumeroVerba;
    procedure InsereItenPeloNrVerba;
    procedure SetCoresCaixaCamadaPalete(qtPedido, qtEmbalagem, qtCamada,
      qtPalete: Integer);
    procedure SetCoresDefaultCaixaCamadaPalete;
    function CarregaSugestaoCompra(nrEmpresa: Integer; stLoacal: String;
      vlSugeridoCusto, vlSugeridoVda, vlMtsCubico: Double): Boolean;
    function CriaTabela(tabela: TClientDataSet): Boolean;
    function CarregaTabelaTemporaria(tabela: TClientDataSet; nrEmpresa: Integer;
      stLoacal: String; nrUnidadedes: Double;
      vlCusto, vlVenda, vlMtsCubico: Double): Boolean;
    function CarregaSugestaoCompraTemp(nrEmpresa: Integer; stLoacal: String;
      vlSugeridoCusto, vlSugeridoVda, vlMtsCubico: Double): Boolean;
    function CompraItem(PnrProduto, PnrEmpresa, PqtPedido: Integer;
      PpcDescontoADicional: Double): Boolean;
    function FiltraPendenciaItem(nrProduto, cdEmpresa: Integer): TClientDataSet;
    procedure CarregaPedidoCompra;
    function setItemPendenciaCD(nrProduto, cdEmpresa: Integer): Integer;
    function LocalizaDescontoOPerador(PnrProduto, PnrCD: Integer): Double;
    procedure SetFocuCursor(PidPosicao: Boolean);
    procedure SetGraficoPreco;
    procedure PrazoSC(PnrDiasPrazo: Integer);
    procedure setGridPrazo;
    procedure PrazoRS(PnrDiasPrazo: Integer);
    procedure AberturaPedido;
    procedure ExecutaAberturaPedido;
    function getNumerodeDias(PnrMes: Integer): Integer;
    procedure PosionaProduto(PnrProduto, PnrEmpresa: Integer);
    procedure AbreDiasZero(PnrLaboratorio, PnrProduto: Integer);
    function DadosProdutos(PnrProduto, PnrEmpresa, PcdOperadorLogistico
      : Integer): TMercadoria;
    function setEspecialidade(PnrEspecialiade: Integer): String;
    function setQuantidadeEmbalagem(PnrProduto: Integer): Integer;
    function SetDadosFornecedor(PnrFornecedor: Integer): TDadosFornecedor;
    function GetUltimaCompra(PnrProduto, PnrCD, PnrOPerador: Integer): tdate;
    function AtualizaDiasEstoque(DiasEstoque: TDadosDiasEstoque): Boolean;
    procedure SetCorPendencia(PqtPedido, PqtPendente, PqtAtendida,
      PqtProcessada: Integer);

    procedure MostraGraficoVendaGridNovo(Grafico: TChart;
      PnrProduto, PnrEmpresa: Integer);
    procedure MostraGraficoVendaGridNovoRS(Grafico: TChart;
      PnrProduto, PnrEmpresa: Integer);
    function AlterItemPedidoElaborado(PcdProduto, PnrEmpresa, PqtPedido,
      PnrVerba, PcdOperadorLogistico: Integer;
      PpcDescontoADicional, PpcVerba: Double): TCalculoPreco;
    procedure RecalculaSugestaodeCompraCD(idEmpresa: Integer);
    procedure SetVendasLaboratorioRecalculo(PnrProduto, PnrEmpresa,
      PnrDiasCompra, PnrRegistro: Integer; PidCurva: String);
    function CriaCapaPedido(PnrEmpresa: Integer): Boolean;
    procedure MostraTotaisPedido(PnrPedido, PnrEmpresa: Integer);
    procedure SetCamposCaixaCamadaPaleteGridPedElaborado;
    procedure FiltraSomaPedido(PnrEmpresa: Integer);
    procedure FiltroItemPedido(PnrEmpresa: Integer);
    function LocalizaItemPedidoElaborador(PnrPedido, PnrProduto,
      PnrEmpresa: Integer): Boolean;
    procedure setParamentroItemCurvaCompra(PnrEmpresa, PnrDiasEstoque: Integer;
      idCurva: Char);
    procedure SetCamposPedidoElaborador(PMediaMensal: Double;
      PVendaMensal: Double; PPendencia, Pestoque, PnrDiasEstoque: Integer;
      PidCurva: String);
    procedure CapaPedido(PnrPedido: Integer);
    procedure SetGridListaPreco;
    function ListaPrecoAtivas(PnrFornecedor, PnrProduto: Integer): Boolean;
    procedure SetNavegacaoProduto(PidRegistro: Integer);
    procedure MostraGraficoVendaEmpresa(PnrProduto, PnrCD: Integer);
    procedure MostraGraficoVendaCDOposto(PnrProduto, PnrEmpresa: Integer);
    procedure MostraGraficoVenda(PnrProduto, PcdEmpresa: Integer);
    procedure setDadosEstoqueEmpresacd(PvlMediaMensalCD: Double;
      PnrVendaAtual, PqtdPendencia, PQtdEstoque, PnrCoberturaEstoque,
      PnrCobEstoquePendencia: Integer);
    function LocalizaItemPedidoLocal(PnrPedido, PnrMercadoria,
      PnrEmpresa: Integer): TDadosItemPedido;
    function AbreItemPrePedidoMultiEmpresa(PnrPedidoSC, PnrPedidoRS,
      PnrMercadoria, PcdEmpresa: Integer; PidSituacao: String): Boolean;
    function SetLeadTime(PnrEmpresa: Integer; PidTermoLabil: String): Double;
    procedure SetNomeCampoItemPrePedido;
    Function PosicionaGrid(PnrProduto, PnrEmpresa: Integer): TDadosItemPedido;
    function GravaItemPedido(PnrPedido, PnrMercadoria,
      PnrEmpresa: Integer): Boolean;
    function SetIndiceFalta(PnrMes, PnrProduto, PnrEmpresa: Integer): Integer;

    { Private declarations }
  public
    qtPedidoLeve, seqProduto, idMostraGrafico: Integer;
    nrUnidadesExcessoCDSC, vlExcessoCustoCDSC, vlExcessoListaCDSC,
      vlExcessoVendaCDSC, vlExcessoMtsCubicoCDSC, nrUnidadesExcessoCDRS,
      vlExcessoCustoCDRS, vlExcessoListaCDRS, vlExcessoVendaCDRS,
      vlExcessoMtsCubicoCDRS, vlMediaFutura: Double;
    nrListaPreco, nrPedidoAntigo, nrVerbaDigitada: Integer;
    IdPosicaoCursor: Boolean;
    NrAuditoriaSC, NrAuditoriaRS, cdPrazoPagamentoAudititoria: Integer;
    nmModuloPedido: String;
    idAuditoria: Boolean;
    DadosItemPedidoLog: TDadosItemPedido;
    nrDiasCoberturaEstoqueAuditoria: Integer;
    cdEmpresaPedido, idPedidoBloqueado, nrVerbaInicio: Integer;
  end;

var
  _frmCompras: T_frmCompras;

  vtEstoqueCompradorSC, vtEstoqueFornecedorSC, vtPendenciaCompradorSC,
    vtPendenciaFornecedorSC, vtCMVMedioCompradorSC, vtCMVMedioForncecedorSC,

    vtEstoqueCompradorRS, vtEstoqueFornecedorRS, vtPendenciaCompradorRS,
    vtPendenciaFornecedorRS, vtCMVMedioCompradorRS,
    vtCMVMedioForncecedorRS: Double;

  qtEstoqueMaximo, qtEstoqueMinimo, qtDiasFrequenciaCompras,
    nrMesesSelecionados, nrDiasSelecionados, nrDiasEstoqueZeroSelecionados,
    qtPendenteItem, nrQuantidadeEstoque, nrQuantidadeEstoqueMultEmpresa,
    nrParamentoEstoque, nrSusgestaoPossivel, nrQuantidadeComprada,cdProduto, nrProduto,
    nrVerba, nrPedidoPontoEncomenda, nrFornecedorPontoEncomenda: Integer;
  vlEixoX, vlMediaDia, vlMediaMesSC, vlMediaMesRS, nrUnidadesMesesSelecionados,
    pcVerba: Double;
  dtUltimaCompra, dtAgenda, dtProximaAgenda: tdateTime;

  qtVendaMes: array [1 .. 13] of Double;
  vlUltimosPrecos: array [1 .. 13] of Double;
  nrDiasEsqueZero: array [1 .. 13] of Integer;
  vlVendaAnual: array [1 .. 13] of Double;
  nrUnidadeAnual: array [1 .. 13] of Double;
  idMesSelecionado: array [1 .. 13] of string[1];
  idCorBarra: array [1 .. 13] of TColor;
  nmLaboratorio: string[60];
  idAgendado: Char = 'S';
  idprecoAtual: Char = 'S';
  idSituacao, idUnidadeFederacao, dsDiasPedido: String[20];
  idPedidoIniciado: Boolean;
  nrUnidadesEstoque, nrUnidadesPendente, nrUnidadesVendaMes, nrUnidadesSugestao,
    nrGrupoLaboratorio, nrDiasEstoque, nrDiasEstoqueAtual, nrUnidadesPossivel,
    nrContaItem, nrPrazoPedido, nrDiasCoberturaEstoque,
    cdoperadorLogisticoPedido, idPedido: Integer;
  vlTotalEstoque, vlUnidadesPendente, vlUnidadesExcesso, vlUnidadesSugestao,
    vlMtsCubicoEstoque, vlMtsCubicoPendente, vlMtsCubicoExcesso,
    vlMtsCubicoVendaMes, vlMtsCubicoSugestao, vlUnidadesVendaMes,
    nrDiasFrequencia, nrDiasAntecipacao, nrUnidadesExcesso,
    vlPrecoLiquidoSemDescAdicional, pcDescontoADicional, pcDescontoRepasse,
    pcDescontoPadrao, pcAliquotaIcms, pcIPI, vlPrecoLista, pcReajustePreco,
    vlPrecoVenda, vlPrecoCusto, _vlIpiAliquotaMercadoria, vlBaseIpi,
    _vlCreditoIcmsCompraComDescAdicional,
    _vtDescontoComDescAdicional, _vlMargem, _vlCorrigidoMargem, _pcMargemVenda,
    _vtPedidoFabrica, _vtPedidoUnitario, _pcDescontoOl, vlFrequenciaCompra,
    nrLeadTime, nrLeadTimeTermolabil: Double;
  idForcaRepasse, idIpiLiquidoComRepasse, idIpiLiquidoSemRepasse,
    idIpiBrutoComRepasse, idIpiBrutoSemRepasse, idIcmDestacado, idTipoLista,
    idReduzIcms, idSuperfluo, idPisConfins, idProdutoAtivo: String[1];
  nrTotalUnidadesPedido, nrListaPrecoSC, nrListaPrecoRS: Integer;
  vtPedidoFabrica, vtPedidoUnitario: Double;
  pcIndicePrecoSC, pcIndicePrecoRS: Double;
  idDigitaPrecoNotaCompra: Boolean;
  precoLista: TListaPreco;
  CalculoPreco: TCalculoPreco;
  _nrEmpresa, nrSequenciaReferencia, nrQuantidadePedido, idSequencia,
    nrUnidadesSugeridaRS, nrUnidadesSugeridaSC, nrUnidadesSugeridaEmpresa,
    nrUnidadesCompradaEmpresa, nrUnidadesCompradaSC,
    nrUnidadesCompradaRS: Integer;
  nrReferencia, vlSugeridoSC, vlCompradoSC, vlCompradoCustoSC, vlSugeridoRS,
    vlCompradoRS, vlCompradoCustoRS, vlSugeridoEmpresa, vlSugeridoCustoSC,
    vtSugeridoVendaSC, vtSugeridoVendaRS, vlSugeridoCustoRS, vlCompradoEmpresa,
    vlSugeridaMtsCubicoRS, vlSugeridaMtsCubicoSC: Double;
  TotaisPedidoSC, TotaisPedidoRS, TotaisPedidoEmpresa: TTotaLizaPedido;
  idMovimentoProximo, idAtualizaAgenda, idAgendaAntecipada: Boolean;
  nrCompradorPedidoLocal, nrFornecedorLocal: Integer;
  idPedidoBonificado: Boolean;
  idInativo, IdInativacaoFutura: String[1];
  DadosPedidoAbertuta: TDadosValoresPedido;

implementation

uses uDm, uJustificativa, uDadosItemPedido;

{$R *.dfm}

procedure T_frmCompras.FormActivate(Sender: TObject);
begin
  if nrPedidoPontoEncomenda > 0 then
    _lbeNrPedido.Text := inttostr(nrPedidoPontoEncomenda);

end;

procedure T_frmCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { if (NrPedidoSC > 0) or (NrPedidoRS > 0) then
    begin
    Mensagem('Existem um Pedido em aberto');
    exit;
    end
    else
    begin
    dec(nrJanelasPedido);
    Action := caFree
    end; }
  Action := caFree
end;

procedure T_frmCompras.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (NrPedidoSC > 0) or (NrPedidoRS > 0) then
  begin
    Mensagem('Existem um Pedido em aberto', 16);
    CanClose := false;
  end
  else
  begin
    dec(nrJanelasPedido);
    CanClose := true;
  end;

end;

procedure T_frmCompras.FormCreate(Sender: TObject);

begin
  idBloqueiaTeclaEnter := false;
  nmInidiceNomeProduto := '';
  pcDescontoADicional := 0;
  nrListaPreco := 0;
  NrAuditoriaSC := 0;
  NrAuditoriaRS := 0;
  TotaisPedidoEmpresa.nrUnidadesPedido := 0;
  TotaisPedidoEmpresa.vlPedidoBruto := 0;
  TotaisPedidoEmpresa.vlPedidoLiquido := 0;
  TotaisPedidoEmpresa.vlPedidoLista := 0;
 // _cdsitemPedidoCDSC.close;
//  _cdsitemPedidoCDRS.close;
  idPedidoBloqueado := 0;
  if DadosPedidoAbertuta <> nil then
    DadosPedidoAbertuta := nil;


end;

procedure T_frmCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nmCampo: String;
  nrProd: Integer;
begin

  if ActiveControl <> NIL then
    nmCampo := ActiveControl.Name;
  if not idBloqueiaTeclaEnter then
  begin
    case Key of
      vk_f1:
        begin
          if not _tbsCompras.Enabled then
          begin
            _tbsCompras.Enabled := true;
            idBloqueiaTeclaEnter := false;
          end;

          if _lbeQuantidadePedidoGrid.CanFocus then
          begin
            SetFocuCursor(IdPosicaoCursor);
            exit;
          end;
        end;
      { VK_RETURN : begin
        if not (ActiveControl is TDBGrid) then
        Perform(WM_NEXTDLGCTL, 0, 0)
        else if (ActiveControl is TDBGrid) then
        begin
        with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
        selectedindex := selectedindex +1
        else
        selectedindex := 0;
        end;
        end; }
      VK_Down:
        begin
          if (ActiveControl is TDBGrid) then
          begin
            // SetNavegacaoProduto(2);
            // PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
            // _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
            // SetNavegacaoProduto(1);

            // LocalizaProduto(nrProduto, //cdGAM,
            // cdEmpresaPedido,//PcdEmpresa: Integer;
            // '',//cdfornecedor,
            // '');//nmProduto: String)}

            exit;
          end;

          if (_pgcCompras.ActivePage = _tbsCompras) then
          begin
            if ((nmCampo = '_dbgPrazoSC') or (nmCampo = '_dbgPrazoRS')) then
            begin
              Key := 0;
              exit;
            end;

            if (_cdsVendalaboratorio.Active) and
              ((nmCampo = '_lbeQuantidadePedidoGrid') or
              (nmCampo = '_lbePesquisa')) and
              (_pgcCompras.ActivePage = _tbsCompras) then
            begin
              Key := 0;
              if not _cdsProduto.eof then
              begin
                IdPosicaoCursor := true;
                // idMovimentoProximo := true;
                SetNavegacaoProduto(2);
//                PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA')
  //                .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

                /// _cdsGradeProduto.Next;
                ///
              end
              else
              begin
                _tchVendasMensal.Title.Text[0] :=
                  ' Final da Grade Produtos....';
                Application.ProcessMessages;
                sleep(10);
              end;
              // nrProd:=_cdsGradeProdutoNR_MERCADORIA.AsInteger;
              // setPosicaoGrid(_cdsGradeProdutoNR_MERCADORIA.AsInteger);
            end
            else
              Perform(WM_NEXTDLGCTL, 0, 0);
          end;

          if (_pgcCompras.ActivePage <> _tbsCompras) then
          begin
            if ((nmCampo = '_dbgPrazoSC') or (nmCampo = '_dbgPrazoRS')) then
            begin
              // key:=0;
              exit;
            end;
            if (_cdsVendalaboratorio.Active) and
              ((nmCampo = '_lbeQuantidadePedidoSC') or
              (nmCampo = '_lbeQuantidadePedidoRS')) and
              (_pgcCompras.ActivePage = _tbsCompras1) then
            begin
              _cdsProduto.Next;
              MontaGraficoVenda;
            end
            else
              Perform(WM_NEXTDLGCTL, 0, 0);
          end;

        end;
      VK_Up:
        begin
          if (ActiveControl is TDBGrid) then
          begin
            // SetNavegacaoProduto(1);
            // PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
            // _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

            // LocalizaProduto(_cdsPrePedido.fieldByName('CD_MERCADORIA').ASINTEGER, //cdGAM,
            // _cdsPrePedido.fieldByName('CD_EMPRESA').ASINTEGER,//PcdEmpresa: Integer;
            // '',//cdfornecedor,
            /// '');//nmProduto: String)}
            ///
            ///
            exit;
          end;

          if (_pgcCompras.ActivePage = _tbsCompras) then
          begin
            Key := 0;

            if (_cdsVendalaboratorio.Active) and
              ((nmCampo = '_lbeQuantidadePedidoGrid') or
              (nmCampo = '_lbePesquisa')) and
              (_pgcCompras.ActivePage = _tbsCompras) then
            begin
              IdPosicaoCursor := true;
              if not _cdsProduto.bof then
              begin
                idMovimentoProximo := false;
                SetNavegacaoProduto(1);
                PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA')
                  .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

                // _cdsGradeProduto.Prior
              end
              else
              begin
                _tchVendasMensal.Title.Text[0] :=
                  ' Inicio da Grade Produtos....';
                Application.ProcessMessages;
                sleep(10);
              end;
              // setPosicaoGrid(_cdsGradeProdutoNR_MERCADORIA.AsInteger);
            end
            else
              Perform(WM_NEXTDLGCTL, 0, 0);
          end;

          if (_pgcCompras.ActivePage <> _tbsCompras) then
          begin
            if (_cdsVendalaboratorio.Active) and
              ((nmCampo = '_lbeQuantidadePedidoSC') or
              (nmCampo = '_lbeQuantidadePedidoRS')) and
              (_pgcCompras.ActivePage = _tbsCompras1) then
            begin
              _cdsProduto.Prior;
              MontaGraficoVenda;
            end
            else
              Perform(WM_NEXTDLGCTL, -1, 0)
          end;

        end;

      VK_ESCAPE:
        begin
          if not idPedidoIniciado then
            close
          else
            Mensagem('Pedido em Aberto...' + #13 +
              'cancele ou confirme o Pedido!!!', MB_ICONEXCLAMATION);

        end;

      // vk 80:
      // AbreTelaPreco;
    end;
  end;
end;

procedure T_frmCompras.FormShow(Sender: TObject);
var
  stTemp: String;
  nomeAbreviado: string[3];
  I, mes: Integer;
  DadosPedido: TDadosValoresPedido;
begin
  idPedidoBonificado := false;
  nrPedidoTelaCompra := 0;
  NrPedidoSC := 0;
  NrPedidoRS := 0;
  nrVerba := 0;
  _lbeSomaDesconto.Caption:='';

  if nrPedidoPontoEncomenda > 0 then
  begin
    DadosPedido := GetValoresPedido(nrPedidoPontoEncomenda,false);
    nrPedidoTelaCompra := nrPedidoPontoEncomenda;
    nrFornecedorLocal := DadosPedido.nrFornecedor;
    nrFornecedor := DadosPedido.nrFornecedor;
    nrCompradorAgenda := DadosPedido.nrCompradorPedido

  end;
  nrLaboratorioLocal := nrFornecedor;
  nrCompradorPedido := nrCompradorAgenda;
  idDigitaPrecoNotaCompra := false;
  inc(nrJanelasPedido);
  for I := 1 to 13 do
    idMesSelecionado[I] := 'N';
  mes := MonthOf(IncMonth(dtPedido, -3));
  nomeAbreviado := ShortMonthNames[mes];

  idMesSelecionado[MonthOf(IncMonth(dtPedido, -3))] := 'S';
  idMesSelecionado[MonthOf(IncMonth(dtPedido, -2))] := 'S';
  idMesSelecionado[MonthOf(IncMonth(dtPedido, -1))] := 'S';
  // idMesSelecionado[13]:='S';

  stTemp := 'Fora da Agenda' + ' - ' + idSituacao;
  nmModuloPedido := 'Ped.' + idSituacao;
  if idAgendado = 'S' then
  begin
    stTemp := 'Agendado';
    nmModuloPedido := stTemp;
  end;
  _frmCompras.Caption := LeftStr(nmLaboratorio + '                           ',
    30) + stTemp + '  Operadador Logist. :' + FormatFloat('0000',
    cdoperadorLogisticoPedido);

  _pgcCompras.ActivePage := _tbsParametros;
  _tbsSugestao.TabVisible := false;
  _tbsCompras.TabVisible := false;
  _tbsConfirma.TabVisible := false;

  _tbsCompras1.TabVisible := false;

  _lbeNrLaboratorio.Text := FormatFloat('00000', nrLaboratorioLocal);

  if _lbeNrPedido.CanFocus then
    _lbeNrPedido.SetFocus;
  idPedidoIniciado := false;

  if nrPedidoTelaCompra > 0 then
    _lbeNrPedido.Text := inttostr(nrPedidoTelaCompra);

  // _cdsVendaAnualLaboratorio := AbreVendaLaboratorioAnual(nrLaboratorio,idTipoPedidoPreco);
  // _cdsVendaAnualLaboratorioRS := AbreVendaLaboratorioAnual(nrLaboratorio, 2);
  // _cdsVendaAnualLaboratorioSC := AbreVendaLaboratorioAnual(nrLaboratorio, 1);


end;

function T_frmCompras.CalculoSugestaoIdeal(PvlPE,
                                           PnrDiasAjuste,
                                           PLeadTimeCalculo,
                                           PvlMediaDiaria: Double;
                                           PnrQuantidadeEstoque,
                                           PnrQuantidadaPendente: Integer): TDadosQtdadeSugestao;
var
  vlTemp, nrDiasUltimacompra: Double;
  dtUltimaCompra: tdate;
  qtSeguranca: Double;
  nrUnidadeMinima, nrUnidadesEstoqueMaximo, nrUnidadesRejeitada: Double;
  NrDiasAteProximaChegada, NrConsumAteProximaChegada, nrEstoqueFuturo,
    nrEstoqueTolerancia: Double;
begin
  result.nrQtdSugerida := 0;
  result.nrQtdSugeridaRejeitada := 0;

  qtSeguranca := qtEstoqueMinimo * PvlMediaDiaria;
  nrUnidadeMinima := PLeadTimeCalculo * PvlMediaDiaria;

  nrUnidadesEstoqueMaximo := nrUnidadeMinima +
    (PvlMediaDiaria * (nrDiasFrequencia + PnrDiasAjuste));

  dtUltimaCompra := GetUltimaCompra(nrProduto, _nrEmpresa,
    cdoperadorLogisticoPedido);
  nrDiasUltimacompra := dtSistema - dtUltimaCompra;

  NrDiasAteProximaChegada := nrDiasFrequencia + PLeadTimeCalculo;
  NrConsumAteProximaChegada := NrDiasAteProximaChegada * PvlMediaDiaria;

  nrEstoqueFuturo := (PnrQuantidadeEstoque + PnrQuantidadaPendente) -
    NrConsumAteProximaChegada;

  nrEstoqueTolerancia := nrUnidadeMinima - (nrUnidadeMinima * 0.1);

  vlTemp := ((PvlPE + PnrDiasAjuste + PLeadTimeCalculo) * PvlMediaDiaria) -
    (PnrQuantidadeEstoque + PnrQuantidadaPendente);
  // vlTemp := nrUnidadesEstoqueMaximo  -  (PnrQuantidadeEstoque + PnrQuantidadaPendente);
  nrUnidadesRejeitada := 0;
  if vlTemp < 0 then
    vlTemp := 0;

  if vlTemp > 0 then
  begin
    nrUnidadesRejeitada := vlTemp;
    if nrEstoqueFuturo > nrEstoqueTolerancia then
      vlTemp := 0;
  end;

  { if ((nrQuantidadeEstoque + nrQuantidadaPendente)) > (qtseguranca + (LeadTimeCalculo*vlmediadiaria)) then
    if nrDiasUltimacompra< vlFrequenciaCompra then
    vlTemp := 0; }

  result.nrQtdSugerida := vlTemp;
  result.nrQtdSugeridaRejeitada := nrUnidadesRejeitada;
end;

procedure T_frmCompras.MontaGraficodeVendasSC(nrProduto: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I, vlTemporario, vlPeLocal, corBarra: TColor;
begin
  nrQuantidadeComprada := 0;
  cdEmpresaPedido := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);

  Series1.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];

  _cdsVendalaboratorio.IndexFieldNames := 'CD_MERCADORIA;DT_VENDA_MERCADORIA';
  FiltraVendaLaboratorio(nrProduto, 1, cdoperadorLogisticoPedido);
  nrDiasEstoqueZeroSelecionados := 0;
  nrUnidadesMesesSelecionados := 0;
  nrDiasSelecionados := 0;
  vlMediaDia := CalculaMediaProduto(nrProduto, cdEmpresaPedido);

  setParamentroCompra(NrDiasCompraSC,
    _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1]);
  vlTemporario := StrToIntDef(FormatFloat('###0', vlFrequenciaCompra * 3), 0);

  // vlMediaDia := CalculoMediaNovo(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger, vlTemporario);

  nrMesesSelecionados := 0;

  MostraHistoricodePedidoRS(nrLaboratorioLocal, nrProduto, false);
  contaMes := Mesreferencia;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];

    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series1.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;

  Series1.Add(qtVendaMes[13], stMes, corBarra);

  _lbeCurvaSC.Caption := 'Curva = ' + MostraCurvaItem(nrProduto, 1);
  _lbeCurvaRS.Caption := 'Curva = ' + MostraCurvaItem(nrProduto, 4);

  _chtVendasSC.Title.Text[0] := FormatFloat('######0',
    _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
    _cdsProduto.FieldByName('NM_COMPLETO').AsString;

  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  PintaPainelGrafico(_cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
  precoLista := GetListaprecoNova(0, pcIndicePrecoSC, 1, nrProduto, 1,
    idprecoAtual, dtPedido);
  vlPrecoLista := precoLista.vlPrecoLista;

  // if _cdsPrecoLista.Locate('NROM_S', nrProduto, []) then
  // vlPrecoLista := _cdsPrecoLista.FieldByName('VLUS_S').AsFloat;

  pcDescontoRepasse := _cdsProduto.FieldByName('PC_REPASSE').AsFloat;
  pcDescontoRepasse := 0; // 05/12/2016
  if cdoperadorLogisticoPedido = 1 then
    pcDescontoPadrao := _cdsProduto.FieldByName
      ('PC_DESCONTO_PADRAO_COMPRA').AsFloat
  else
    pcDescontoPadrao := LocalizaDescontoOPerador(cdoperadorLogisticoPedido,
      _nrEmpresa);

  qtPendenteItem := 0;

  _lbeMedia.Text := FormatFloat('###,###,##0', 0);
  setParamentroCompra(NrDiasCompraSC,
    _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1]);

  MostraDaDosCalculo;

  // MontaGraficoPedidos(nrProduto, _qtEstoqueMaximo, _qtEstoqueMinimo, 0);
  _chtVendasSC.Refresh;
  _chtvendasRS.Refresh;
  Chart2.Refresh;
end;

procedure T_frmCompras.MontaGraficodeVendasSCGrade(nrProduto,
  cdEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I, nrVendaMesAtual: Integer;
  corBarra: TColor;
  idCurva: String[1];
begin
  /// setPosicaoGrid(_cdsGradeProdutoNR_MERCADORIA.AsInteger);
  _tchVendasMensal.LeftAxis.SetMinMax(0, 5000);
  // if nrReferencia<100 then
  // _SerieGraficoGrade.LeftAxis.SetMinMax(0,nrReferencia*1.30);
  // else
  // _SerieGraficoGrade.LeftAxis.SetMinMax(0,nrReferencia);
  // if Mercadoria=nil then
  { Mercadoria:=GetMercadoriaNova( _cdsGradeProdutoNR_MERCADORIA.AsInteger,
    _cdsGradeProdutoNR_DIGITO_MERCADORIA.AsInteger,
    0,
    cdEmpresa); }
  _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProduto.FieldByName
    ('ID_LOCAL_CD').AsString;
  _lbeDiasEstoque.Clear;
  Application.ProcessMessages;
  nrQuantidadeComprada := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series9.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  _cdsVendalaboratorio.IndexFieldNames := 'CD_MERCADORIA;DT_VENDA_MERCADORIA';
  FiltraVendaLaboratorio(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, cdoperadorLogisticoPedido);
  nrDiasEstoqueZeroSelecionados := 0;
  nrUnidadesMesesSelecionados := 0;
  nrDiasSelecionados := 0;
  vlMediaDia := CalculaMediaProduto(nrProduto, cdEmpresa);
  if not _cdsProduto.isEmpty then
    setParamentroCompra(NrDiasCompraSC,
      _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1]);
  nrMesesSelecionados := 0;
  // MostraHistoricodePedidoRS(nrLaboratorio, nrProduto, false);

  // Montando Grafico Empresa
  { if idSequencia <> _cdsProduto.FieldByName('NR_SEQUENCIA').AsInteger then
    begin
    MostraGraficoVendaGridEmpresa;
    // qtPendenteItem := setPendenciaCD(nrProduto, 0);
    // nrVendaMesAtual := StrToIntDef(FormatFloat('######0', qtVendaMes[13]), 0);
    // nrQuantidadeEstoqueMultEmpresa:=GetEstoqueMultEmpresa(nrProduto,0);

    // setDadosEstoqueEmpresa(vlMediaMesSC, nrVendaMesAtual,qtPendenteItem, nrQuantidadeEstoqueMultEmpresa, 0, 0);
    idSequencia := _cdsProduto.FieldByName('NR_SEQUENCIA').AsInteger;

    end; }
  // Montando Grafico Venda cd Oposto
  if idMostraGraficoVendaCdOposto then
    MostraGraficoVendaGridCDOposto(cdEmpresa);

  // Montando Grafico Venda
  MostraGraficoVendaGrid;

  DadosPendencia := setPendenciaCD(nrProduto, cdEmpresa);

  qtPendenteItem := DadosPendencia.QtPendente;
  idCurva := MostraCurvaItem(nrProduto, cdEmpresa);

  idprecoAtual := 'S';
  if _cbListaPrecoLocal.ItemIndex = 1 then
    idprecoAtual := 'N';

  PintaPainelGrafico(idCurva);
  // precoLista := GetListaprecoNova(0,pcIndicePrecoSC, 1, nrProduto,cdEmpresa ,idprecoAtual, dtPedido);
  precoLista := GetPrecoItem(nrProduto, cdEmpresa,
    _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, 1, idprecoAtual,
    idPedidoBloqueado, nrListaPreco);

  vlPrecoLista := precoLista.vlPrecoLista;
  if precoLista.PcDescontoLista > 0 then
  begin
    pcDescontoADicional := precoLista.PcDescontoLista;
    nrVerbaDigitada := precoLista.nrVerba;
    nrVerba := precoLista.nrVerba;
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0', nrVerba);
  end;

  pcDescontoRepasse := _cdsProduto.FieldByName('PC_REPASSE').AsFloat;
  _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

  // pcDescontoPadrao := _cdsProduto.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;
  if cdoperadorLogisticoPedido = 1 then
  begin
    // pcDescontoPadrao :=Mercadoria.pcDescontoPadrao;
    pcDescontoPadrao := _cdsProduto.FieldByName
      ('PC_DESCONTO_PADRAO_COMPRA').AsFloat;
  end
  else
    pcDescontoPadrao := LocalizaDescontoOPerador(nrProduto, _nrEmpresa);

  // setParamentroCompra(Mercadoria.idCurva);
  IdInativacaoFutura := _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA')
    .AsString;
  _lbCurvaSCgrade.Caption := 'Curva = ' + idCurva;
  setCoresGraficoCurva(idCurva);
  // _lbeCurvaRS.Caption      := 'Curva = ' + MostraCurvaItem(nrProduto,2);
  // if not _chkFixaDescontoAdicional.Checked then
  // pcDescontoADicional := StrToFloatDef(_lbeDescontoAdicional.Text, 0);
  pcDescontoADicional := 0;
  if _chkMostraUltimoDesconto.Checked then
    pcDescontoADicional := getUltimoDesconto(nrLaboratorioLocal, nrProduto,
      cdEmpresa, cdoperadorLogisticoPedido);

  SetDadosPreco(vlPrecoLista, pcDescontoRepasse, pcDescontoPadrao,
    pcDescontoADicional);
  // _lbePrecoListaGrid.Text := FormatFloat('###,###,##0.00', );
  // _lbePercentualRepasseGrid.Text := FormatFloat('##0.00', );
  // _lbeDescontoPadraoGrid.Text := FormatFloat('##0.00', );

  _lbeMedia.Text := FormatFloat('###,###,##0', 0);

  if true then

    _chtVendasSC.Refresh;
  _chtvendasRS.Refresh;

  // MostraDaDosCalculo;
  if _lbeSugestaoPossivelGrid.CanFocus then
    _lbeSugestaoPossivelGrid.SetFocus;
  if not _cdsProduto.isEmpty then
    MostraDaDosCalculoGrid;
  // MontaGraficoPedidos(nrProduto, _qtEstoqueMaximo, _qtEstoqueMinimo, 0);
end;

procedure T_frmCompras.MontaGraficodeVendasRS(nrProduto: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes, I: Integer;
  corBarra: TColor;
begin
  nrQuantidadeComprada := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  cdEmpresaPedido := _cdsProduto.FieldByName('CD_empresa').AsInteger;
  Series8.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  _cdsVendalaboratorio.IndexFieldNames := 'CD_MERCADORIA;DT_VENDA_MERCADORIA';
  FiltraVendaLaboratorio(nrProduto, 4, cdoperadorLogisticoPedido);
  nrDiasEstoqueZeroSelecionados := 0;
  nrUnidadesMesesSelecionados := 0;
  nrDiasSelecionados := 0;
  vlMediaDia := CalculaMediaProduto(nrProduto, cdEmpresaPedido);
  setParamentroCompra(NrDiasCompraRS,
    _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1]);
  nrMesesSelecionados := 0;
  MostraHistoricodePedidoRS(nrLaboratorioLocal, nrProduto, false);
  contaMes := Mesreferencia;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series8.Add(qtVendaMes[contaMes], stMes, corBarra);

    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;

  Series8.Add(qtVendaMes[13], stMes, corBarra);

  _lbeCurvaRS.Caption := 'Curva = ' + MostraCurvaItem(nrProduto, 4);

  _chtvendasRS.Title.Text[0] := FormatFloat('######0',
    _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger) + ' - ' +
    _cdsProduto.FieldByName('NM_COMPLETO').AsString;

  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  PintaPainelGrafico(_cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
  precoLista := GetListaprecoNova(0, pcIndicePrecoSC, 1, nrProduto, 1,
    idprecoAtual, dtPedido);
  vlPrecoLista := precoLista.vlPrecoLista;

  // if _cdsPrecoLista.Locate('NROM_S', nrProduto, []) then
  // vlPrecoLista := _cdsPrecoLista.FieldByName('VLUS_S').AsFloat;

  pcDescontoRepasse := _cdsProduto.FieldByName('PC_REPASSE').AsFloat;

  pcDescontoPadrao := _cdsProduto.FieldByName
    ('PC_DESCONTO_PADRAO_COMPRA').AsFloat;

  qtPendenteItem := 0;

  _lbeMedia.Text := FormatFloat('###,###,##0', 0);
  setParamentroCompra(NrDiasCompraRS,
    _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1]);

  MostraDaDosCalculo;
  // MontaGraficoPedidos(nrProduto, _qtEstoqueMaximo, _qtEstoqueMinimo, 0);
  _chtVendasSC.Refresh;
  _chtvendasRS.Refresh;
  Chart2.Refresh;
  // _cedQtdadePedidoEmpresa.SelectAll
end;

procedure T_frmCompras.MontaGraficodeVendasAnual(nrProduto: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I: Integer;
  corBarra: TColor;
begin
  nrQuantidadeComprada := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series1.Clear;
  Series8.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  _cdsVendaAnualLaboratorio.IndexFieldNames := 'DT_VENDA_MERCADORIA';
  for I := 1 to 13 do
  begin
    vlVendaAnual[I] := 0;
    nrUnidadeAnual[I] := 0;
  end;
  _cdsVendaAnualLaboratorio.First;
  nrReferencia := 0;
  while not _cdsVendaAnualLaboratorio.eof do
  begin
    begin
      {
        if nrReferencia < _cdsVendaAnualLaboratorio.FieldByName
        ('VT_FATURAMENTO_LIQUIDO').AsFloat then
        nrReferencia := _cdsVendaAnualLaboratorio.FieldByName
        ('VT_FATURAMENTO_LIQUIDO').AsFloat;

        vlVendaAnual[_cdsVendaAnualLaboratorio.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorio.FieldByName('VT_FATURAMENTO_LIQUIDO').AsFloat;
        nrUnidadeAnual[_cdsVendaAnualLaboratorio.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorio.FieldByName('NR_UNIDADES').AsInteger;
      }
      if nrReferencia < _cdsVendaAnualLaboratorio.FieldByName('VT_CMV')
        .AsFloat then
        nrReferencia := _cdsVendaAnualLaboratorio.FieldByName('VT_CMV').AsFloat;

      vlVendaAnual[_cdsVendaAnualLaboratorio.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorio.FieldByName('VT_CMV').AsFloat;
      nrUnidadeAnual[_cdsVendaAnualLaboratorio.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorio.FieldByName('NR_UNIDADES').AsInteger;

      _cdsVendaAnualLaboratorio.Next;
    end;
  end;
  contaMes := Mesreferencia;
  for I := 1 to 13 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    stMes := UpperCase(ShortMonthNames[contaMes]);
    if I = 13 then
    begin
      stMes := 'ATUAL';
      Series6.Add(vlVendaAnual[13], stMes, clSkyBlue);
      Series7.Add(nrUnidadeAnual[13], stMes, clYellow);
    end
    else
    begin
      Series6.Add(vlVendaAnual[contaMes], stMes, clSkyBlue);
      Series7.Add(nrUnidadeAnual[contaMes], stMes, clYellow);
    end;
    inc(contaMes);
  end;
  _tchVendaAnualGeral.Refresh;
end;

procedure T_frmCompras.MontaGraficodeVendasAnualCDRS(nrProduto: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I: Integer;
  corBarra: TColor;
begin
  nrQuantidadeComprada := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series13.Clear;
  Series14.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  _tchVendaAnualCDRS.LeftAxis.SetMinMax(0, nrReferencia);
  _cdsVendaAnualLaboratorio.IndexFieldNames := 'DT_VENDA_MERCADORIA';
  for I := 1 to 13 do
  begin
    vlVendaAnual[I] := 0;
    nrUnidadeAnual[I] := 0;
  end;
  _cdsVendaAnualLaboratorioRS.open;
  _cdsVendaAnualLaboratorioRS.First;
  while not _cdsVendaAnualLaboratorioRS.eof do
  begin
    begin
      {
        vlVendaAnual[_cdsVendaAnualLaboratorioRS.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorioRS.FieldByName
        ('VT_FATURAMENTO_LIQUIDO').AsFloat;
      }

      vlVendaAnual[_cdsVendaAnualLaboratorioRS.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorioRS.FieldByName('VT_CMV').AsFloat;

      nrUnidadeAnual[_cdsVendaAnualLaboratorioRS.FieldByName('MES').AsInteger]
        := _cdsVendaAnualLaboratorioRS.FieldByName('NR_UNIDADES').AsInteger;
      _cdsVendaAnualLaboratorioRS.Next;
    end;
  end;
  contaMes := Mesreferencia;
  for I := 1 to 13 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    stMes := UpperCase(ShortMonthNames[contaMes]);
    if I = 13 then
    begin
      stMes := 'ATUAL';
      Series13.Add(vlVendaAnual[13], stMes, clMoneyGreen);
      Series14.Add(nrUnidadeAnual[13], stMes, clInfoBk);
    end
    else
    begin
      Series13.Add(vlVendaAnual[contaMes], stMes, clMoneyGreen);
      Series14.Add(nrUnidadeAnual[contaMes], stMes, clInfoBk);
    end;
    inc(contaMes);
  end;
  _tchVendaAnualCDRS.Refresh;
end;

procedure T_frmCompras.MontaGraficodeVendasAnualCDSC(nrProduto: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I: Integer;
  corBarra: TColor;
begin
  nrQuantidadeComprada := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series11.Clear;
  Series12.Clear;
  _tchVendaAnualCDSC.LeftAxis.SetMinMax(0, nrReferencia);
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  _cdsVendaAnualLaboratorioSC.IndexFieldNames := 'DT_VENDA_MERCADORIA';
  for I := 1 to 13 do
  begin
    vlVendaAnual[I] := 0;
    nrUnidadeAnual[I] := 0;
  end;
  _cdsVendaAnualLaboratorioSC.open;
  _cdsVendaAnualLaboratorioSC.First;
  while not _cdsVendaAnualLaboratorioSC.eof do
  begin
    begin
      {
        vlVendaAnual[_cdsVendaAnualLaboratorioSC.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorioSC.FieldByName
        ('VT_FATURAMENTO_LIQUIDO').AsFloat;
      }

      vlVendaAnual[_cdsVendaAnualLaboratorioSC.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorioSC.FieldByName('VT_CMV').AsFloat;

      nrUnidadeAnual[_cdsVendaAnualLaboratorioSC.FieldByName('MES').AsInteger]
        := _cdsVendaAnualLaboratorioSC.FieldByName('NR_UNIDADES').AsInteger;
      _cdsVendaAnualLaboratorioSC.Next;
    end;
  end;
  contaMes := Mesreferencia;
  for I := 1 to 13 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    stMes := UpperCase(ShortMonthNames[contaMes]);
    if I = 13 then
    begin
      stMes := 'ATUAL';
      Series11.Add(vlVendaAnual[13], stMes, clGreen);
      Series12.Add(nrUnidadeAnual[13], stMes, clYellow);
    end
    else
    begin
      Series11.Add(vlVendaAnual[contaMes], stMes, clGreen);
      Series12.Add(nrUnidadeAnual[contaMes], stMes, clYellow);
    end;
    inc(contaMes);
  end;
  _tchVendaAnualCDSC.Refresh;
end;

procedure T_frmCompras.MontaGraficodeVendasAnualMultiEmpresa(nrProduto,
  nrEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes, nrReferencia: Integer;
  I: Integer;
  corBarra: TColor;
begin
  nrQuantidadeComprada := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series1.Clear;
  Series8.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  _cdsVendaAnualLaboratorio.IndexFieldNames := 'DT_VENDA_MERCADORIA';
  for I := 1 to 13 do
  begin
    vlVendaAnual[I] := 0;
    nrUnidadeAnual[I] := 0;
  end;
  nrReferencia := 0;
  FiltraVendaLaboratorio(nrProduto, 1, cdoperadorLogisticoPedido);
  _cdsVendaAnualLaboratorio.First;
  while not _cdsVendaAnualLaboratorio.eof do
  begin
    begin
      vlVendaAnual[_cdsVendaAnualLaboratorio.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorio.FieldByName('VT_VENDA').AsFloat;
      nrUnidadeAnual[_cdsVendaAnualLaboratorio.FieldByName('MES').AsInteger] :=
        _cdsVendaAnualLaboratorio.FieldByName('NR_UNIDADES').AsInteger;
      _cdsVendaAnualLaboratorio.Next;
    end;
  end;
  contaMes := Mesreferencia;
  for I := 1 to 13 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    stMes := UpperCase(ShortMonthNames[contaMes]);
    if I = 13 then
    begin
      stMes := 'ATUAL';
      Series6.Add(vlVendaAnual[13], stMes, clSkyBlue);
      Series7.Add(nrUnidadeAnual[13], stMes, clYellow);
    end
    else
    begin
      Series6.Add(vlVendaAnual[contaMes], stMes, clSkyBlue);
      Series7.Add(nrUnidadeAnual[contaMes], stMes, clYellow);
    end;
    inc(contaMes);
  end;
  _tchVendaAnualGeral.Refresh;
end;

procedure T_frmCompras.MontaGraficoPedidos(nrEmpresa, nrProduto,
  qtMaximaEstoque, qtMinimaEstoque, qtEstoqueDia: Integer);
VAR
  qtMaxima: Double;
  qtSeguranca: Double;
  dttemp: String;
  nrIdias: Integer;
  nrUltimoEstoque: Integer;
  nrDiasEntrega, n: Integer;
  dtUltimoDiaEstoque: tdate;

begin
  { with _cdsEstoqueDiario do
    begin
    Filtered := false;
    filter := 'NROM_E=' + inttostr(nrProduto);
    Filtered := true;
    First;
    end; }
  _stbCompras.Panels[1].Text := 'Abrindo Historico de Estoque do Laborat?rio';
  _stbCompras.Refresh;
  AbreEstoqueDiario(nrLaboratorioLocal, nrProduto, nrEmpresa);

  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  qtMaxima := qtMaximaEstoque * vlMediaDia;
  qtSeguranca := qtMinimaEstoque * vlMediaDia;
  vlEixoX := 0;
  while not _cdsEstoqueDiario.eof do
  begin
    if vlEixoX < _cdsEstoqueDiario.FieldByName('FISM_E').AsInteger then
      vlEixoX := _cdsEstoqueDiario.FieldByName('FISM_E').AsInteger;
    if vlEixoX < qtMaxima then
      vlEixoX := qtMaxima;

    Series2.Add(qtMaxima, '', clRed);
    Series3.Add(_cdsEstoqueDiario.FieldByName('FISM_E').AsInteger,
      FormatDateTime('dd/mm', _cdsEstoqueDiario.FieldByName('DAEE_E')
      .AsDateTime), clBlue);
    Series4.Add(qtSeguranca, '', clYellow);
    MontaGraficoUltimasCompras(nrProduto,
      _cdsEstoqueDiario.FieldByName('DAEE_E').AsDateTime);
    Chart2.LeftAxis.SetMinMax(0, vlEixoX * 1.35);
    _cdsEstoqueDiario.Next;
  end;
  nrIdias := DaysBetween(dtUltimaCompra, dtPedido);
  nrDiasEntrega := StrToIntDef(FormatFloat('0000', nrLeadTime * 2), 0);
  nrUltimoEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  FiltraUltimasCompras(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
    nrEmpresa, 0);
  if dtUltimaCompra + nrLeadTime < dtPedido then
  begin
    if _cdsUltimasCompra <> nil then
    begin
      _cdsUltimasCompra.last;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'N' then
        nrUltimoEstoque := nrUltimoEstoque + _cdsUltimasCompra.FieldByName
          ('QT_COMPRA_ACUMULADA').AsInteger;
    end;
  end;
  for n := 0 to nrDiasEntrega do
  begin
    if (dtPedido + n) = (dtPedido + nrLeadTime) then
      nrUltimoEstoque := nrUltimoEstoque + nrSusgestaoPossivel +
        nrQuantidadeComprada;
    nrUltimoEstoque := nrUltimoEstoque -
      StrToIntDef(FormatFloat('000000000', vlMediaDia), 0);
    Series2.Add(qtMaxima, '', clRed);
    Series3.Add(nrUltimoEstoque, FormatDateTime('dd/mm', dtPedido + n), clLime);
    Series4.Add(qtSeguranca, '', clYellow);
  end;
end;

procedure T_frmCompras.MontaGraficoPedidosNovo(nrEmpresa, nrProduto,
  qtMaximaEstoque, qtMinimaEstoque, qtEstoqueDia: Integer);
VAR
  qtMaxima: Double;
  qtSeguranca: Double;
  dttemp: String;
  nrIdias: Integer;
  nrUltimoEstoque: Integer;
  nrDiasEntrega, n: Integer;
  dtUltimoDiaEstoque: tdate;

begin
  _stbCompras.Panels[1].Text := 'Abrindo Historico de Estoque do Laborat?rio';
  _stbCompras.Refresh;
  AbreEstoqueDiario(nrLaboratorioLocal, nrProduto,
    _cdsProduto.FieldByName('CD_empresa').AsInteger);
  _tchVendasMensal.View3D := false;

  Series9.Clear;
  Series15.Clear;
  Series16.Clear;
  Series17.Clear;
  Series18.Clear;
  _tchVendasMensal.View3D := false;
  qtMaxima := qtMaximaEstoque * vlMediaDia;
  qtSeguranca := qtMinimaEstoque * vlMediaDia;
  vlEixoX := 0;
  _cdsEstoqueDiario.First;
  while not _cdsEstoqueDiario.eof do
  begin
    if vlEixoX < _cdsEstoqueDiario.FieldByName('FISM_E').AsInteger then
      vlEixoX := _cdsEstoqueDiario.FieldByName('FISM_E').AsInteger;
    if vlEixoX < qtMaxima then
      vlEixoX := qtMaxima;

    Series15.Add(qtMaxima, '', clRed);
    Series17.Add(_cdsEstoqueDiario.FieldByName('FISM_E').AsInteger,
      FormatDateTime('dd/mm', _cdsEstoqueDiario.FieldByName('DAEE_E')
      .AsDateTime), clBlue);
    Series16.Add(qtSeguranca, '', clYellow);
    MontaGraficoUltimasCompras(nrProduto,
      _cdsEstoqueDiario.FieldByName('DAEE_E').AsDateTime);
    _tchVendasMensal.LeftAxis.SetMinMax(0, vlEixoX * 1.35);
    _cdsEstoqueDiario.Next;
  end;
  nrIdias := DaysBetween(dtUltimaCompra, dtPedido);
  nrDiasEntrega := StrToIntDef(FormatFloat('0000', nrLeadTime * 2), 0);
  nrUltimoEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  FiltraUltimasCompras(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, 0);
  if dtUltimaCompra + nrLeadTime < dtPedido then
  begin
    if _cdsUltimasCompra <> nil then
    begin
      _cdsUltimasCompra.last;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'N' then
        nrUltimoEstoque := nrUltimoEstoque + _cdsUltimasCompra.FieldByName
          ('QT_COMPRA_ACUMULADA').AsInteger;
    end;
  end;
  for n := 0 to nrDiasEntrega do
  begin
    if (dtPedido + n) = (dtPedido + nrLeadTime) then
      nrUltimoEstoque := nrUltimoEstoque + nrSusgestaoPossivel +
        nrQuantidadeComprada;
    nrUltimoEstoque := nrUltimoEstoque -
      StrToIntDef(FormatFloat('000000000', vlMediaDia), 0);
    Series15.Add(qtMaxima, '', clRed);
    Series17.Add(nrUltimoEstoque, FormatDateTime('dd/mm',
      dtPedido + n), clLime);
    Series16.Add(qtSeguranca, '', clYellow);
  end;
end;

function T_frmCompras.FiltraUltimasCompras(nrProduto, PcdEmpresa: Integer;
  dtCompra: tdate): Boolean;
var
  dttemp: String;
begin
  _cdsUltimasCompra.filtered := false;
  if _cdsUltimasCompra <> nil then
  begin
    if dtCompra > 0 then
    begin
      with _cdsUltimasCompra do
      begin
        filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +
          inttostr(PcdEmpresa) + ' AND DT_COMPRA=' +
          QuotedStr(FormatDateTime('dd/mm/YYYY', dtCompra));
        filtered := true;
        First;
      end;
      result := false;
    end
    else
    begin
      with _cdsUltimasCompra do
      begin
        filter := 'CD_MERCADORIA=' + inttostr(nrProduto);
        filtered := true;
        First;
      end;
    end;
    _cdsUltimasCompra.IndexFieldNames := 'DT_COMPRA;CD_MERCADORIA';
  end;
end;

function T_frmCompras.MontaGraficoUltimasCompras(nrProduto: Integer;
  dtCompra: tdate): Boolean;
var
  dttemp: String;
  corColuna: TColor;
begin
  FiltraUltimasCompras(nrProduto, _cdsProduto.FieldByName('CD_EMPRESA')
    .AsInteger, dtCompra);
  result := false;
  if _cdsUltimasCompra <> nil then
  begin
    // Series5.clear;
    if _cdsUltimasCompra.isEmpty then
    begin
      Series18.Marks.Visible := false;
      Series18.Add(0, '', clTeeColor);
    end;
    dttemp := FormatDateTime('dd/mm', dtCompra);
    while not _cdsUltimasCompra.eof do
    begin
      Series18.Marks.Visible := false;
      corColuna := clTeeColor;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'F' then
        corColuna := clTeal;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'C' then
        corColuna := clRed;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'I' then
        corColuna := clRed;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'P' then
        corColuna := clYellow;
      if _cdsUltimasCompra.FieldByName('ID_SITUACAO_COMPRA').AsString = 'N' then
        corColuna := clLime;

      Series18.Add(_cdsUltimasCompra.FieldByName('QT_COMPRA_ACUMULADA')
        .AsInteger, '', corColuna);
      dtUltimaCompra := _cdsUltimasCompra.FieldByName('DT_COMPRA').AsDateTime;
      _cdsUltimasCompra.Next;
    end;
  end;

end;

procedure T_frmCompras._lbeQtadePedido2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    vk_return:
      begin
        // _nrQuantidadeComprada := StrToIntDef(StringReplace(_lbeQtadePedido.Text,
        // '.', '', [rfReplaceAll]), 0);
        nrQuantidadeComprada := 0;
        // StrToIntDef(FormatFloat('##############0',          _cedQtdadePedidoEmpresa.Value), 0);
        // MontaGraficoPedidos(_cdsProduto.FieldByName('NROM_M').AsInteger,qtEstoqueMaximo, _qtEstoqueMinimo, 0);
        if nrQuantidadeComprada = 0 then
          GravaItem(nrPedidoTelaCompra, _cdsProduto.FieldByName('CD_MERCADORIA')
            .AsInteger, 0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
        nrDiasEstoque := 0;
        if nrQuantidadeComprada > 0 then
        begin
          if vlMediaDia > 0 then
          begin
            nrDiasEstoque := StrToIntDef(FormatFloat('0000000000',
                                         (nrQuantidadeEstoque + qtPendenteItem { + nrQuantidadeComprada } )
                                       / vlMediaDia), 0);
          end
          else
            nrDiasEstoque := nrQuantidadeEstoque +
              qtPendenteItem { + nrQuantidadeComprada };

        end;

        _lbeDiasEstoqueEmpresa.Text := FormatFloat('###########0',   nrDiasEstoque);
        nrDiasEstoque := nrDiasEstoque;
        if nrDiasEstoque > 0 then
          if _lbeDiasEstoqueEmpresa.CanFocus then
            _lbeDiasEstoqueEmpresa.SetFocus;

      end;
  end;

end;

procedure T_frmCompras._lbeQuantidadePedidoGridEnter(Sender: TObject);
begin
  KeyPreview := true;

end;

procedure T_frmCompras._lbeQuantidadePedidoGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        try
          IdPosicaoCursor := false;
          _tbsCompras.Enabled := false;

           vlMediaDia := CalculaMediaProduto(nrProduto,
                                            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

          nrGeracaoVerba := _cdsProduto.FieldByName('NR_VERBA_GERACAO').AsInteger;
          pcGeracaoVerba := _cdsProduto.FieldByName('PC_VERBA_GERACAO').AsFloat;

          nrQuantidadePedido := StrToIntDef(_lbeQuantidadePedidoGrid.Text, 0);
          nrQuantidadeComprada := nrQuantidadePedido;


          idMovimentoProximo := false;
          if nrQuantidadeComprada = 0 then
          begin
            SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
            _tbsCompras.Enabled := true;
            IdPosicaoCursor := true;

            // idMovimentoProximo := true;

            if NOT _cdsProduto.eof then
              _cdsProduto.Next;

            // sleep(200);
            nrDiasEstoque := 0;
            IF _lbeQuantidadePedidoGrid.CanFocus then
              _lbeQuantidadePedidoGrid.SetFocus;
            exit;
          end;
          SetCoresCaixaCamadaPalete(nrQuantidadePedido,
                                   _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger,         // Mercadoria.qtEmbalagemCompra,
                                  _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger,         // Mercadoria.qtdCaixaCamada,
                                  _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger); { Mercadoria.qtdCaixaPalete }
          nrDiasEstoqueAtual := 0;
          if nrQuantidadeComprada > 0 then
          begin
            // _frmCompras.KeyPreview:=false;
            _tbsCompras.Enabled := true;

            if vlMediaDia > 0 then
            begin
              nrDiasEstoque := StrToIntDef(FormatFloat('0000000000',
                              (nrQuantidadeEstoque + qtPendenteItem + nrQuantidadeComprada) /
                              vlMediaDia), 0);

              nrDiasEstoqueAtual := StrToIntDef(FormatFloat('0000000000',
                                               (nrQuantidadeEstoque + qtPendenteItem) / vlMediaDia), 0);

            end
            else
            begin
              nrDiasEstoque := nrQuantidadeEstoque + qtPendenteItem;
              nrDiasEstoqueAtual := nrQuantidadeEstoque + qtPendenteItem;
            end;

          end;

          // _lbeDiasEstoque.Text := FormatFloat('###########0', nrDiasEstoque);
          SetCamposDiasEstoque(nrDiasEstoque, 0);
          nrDiasEstoque := nrDiasEstoque;
          if nrQuantidadeComprada > 0 then
            if _lbeDiasEstoque.CanFocus then
              _lbeDiasEstoque.SetFocus;
          _tbsCompras.Enabled := true;
        except
          on E: Exception do
          begin
            trataerro(E.Message, 'Pressionando a tecla <Enter> muito Rapido');

          end;

        end;

      end;
  end;
end;

procedure T_frmCompras._lbeQuantidadePedidoGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    if not _tbsCompras.Enabled then
      Key := #0;
end;

procedure T_frmCompras._lbeQuantidadePedidoSCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        nrQuantidadepedidoSC := StrToIntDef(_lbeQuantidadePedidoSC.Text, 0);
        nrQuantidadepedidoRS := StrToIntDef(_lbeQuantidadePedidoRS.Text, 0);
        SetCamposQuantidaPedido(nrQuantidadepedidoSC, nrQuantidadepedidoRS);
        // _nrQuantidadeComprada := StrToIntDef(StringReplace(_lbeQtadePedido.Text,
        // '.', '', [rfReplaceAll]), 0);
        nrQuantidadeComprada := StrToIntDef(_lbeQuantidadePedidoSC.Text, 0);
        if nrQuantidadeComprada = 0 then
          GravaItem(nrPedidoTelaCompra, _cdsProduto.FieldByName('CD_MERCADORIA')
            .AsInteger, nrQuantidadeComprada,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

        nrDiasEstoque := 0;
        if nrQuantidadeComprada > 0 then
        begin
          if vlMediaDia > 0 then
          begin
            nrDiasEstoque :=
              StrToIntDef(FormatFloat('0000000000',
              (nrQuantidadeEstoque + qtPendenteItem + nrQuantidadeComprada) /
              vlMediaDia), 0);
          end
          else
            nrDiasEstoque := nrQuantidadeEstoque + qtPendenteItem +
              nrQuantidadeComprada;

        end;

        // _lbeDiasEstoque.Text := FormatFloat('###########0', nrDiasEstoque);
        SetCamposDiasEstoque(nrDiasEstoque, 0);
        nrDiasEstoque := nrDiasEstoque;
        if nrDiasEstoque > 0 then
          if _lbeDiasEstoqueSC.CanFocus then
            _lbeDiasEstoqueSC.SetFocus;

      end;

    VK_LEFT:
      begin
        Key := 0;
      end;

    VK_RIGHT:
      begin
        Key := 0;
      end;
  end;
end;

procedure T_frmCompras._mmAlertaRecallClick(Sender: TObject);
begin
  _pnRestricao.Visible := false;
  Timer1.Enabled := false;
  Series9.Active := true;

end;

procedure T_frmCompras._pgcComprasChange(Sender: TObject);
begin
  idMostraGraficoVendaCdOposto := false;
  if _pgcCompras.ActivePage = _tbsSugestao then
    idBloqueiaTeclaEnter := false;


  if _pgcCompras.ActivePage = _tbsCompras then
  begin
    idBloqueiaTeclaEnter := false;
    if _chkMostaIndiceFalta.Enabled then
    begin
      _cdsIndiceFaltaAtual.filtered := false;
      _cdsIndiceFaltaAnterior.filtered := false;
      if (_cdsIndiceFaltaAtual.Active) then
      begin
        if (_cdsIndiceFaltaAnterior.RecordCount > 1) or
          (_cdsIndiceFaltaAtual.RecordCount > 1) then
          _chkMostaIndiceFalta.Enabled := false;
      end;
    end;
    SetFocuCursor(IdPosicaoCursor);
    idMostraGraficoVendaCdOposto := true;
    { setPosicaoGrid(_cdsGradeProduto.FieldByName('NR_MERCADORIA').AsInteger,
      _cdsGradeProduto.FieldByName('CD_EMPRESA').AsInteger,
      idMovimentoProximo); }
    _dtpProximaAgenda.Enabled := true;
    dtProximaAgenda := _dtpProximaAgenda.Date;
  end;

  if _pgcCompras.ActivePage = _tbsCompras1 then
  begin
    _gbxSugestaoSC.Enabled := false;
    _gbxSugestaoRS.Enabled := false;
    _gbxSugestaoGeral.Enabled := false;
    if idPedido = 0 then
    begin
      _gbxSugestaoSC.Enabled := true;
      _gbxSugestaoRS.Enabled := true;
      _gbxSugestaoGeral.Enabled := true;
      if _lbeQuantidadePedidoSC.CanFocus then
        _lbeQuantidadePedidoSC.SetFocus;
    end;
    if idPedido = 1 then
    begin
      _gbxSugestaoSC.Enabled := true;
      _gbxSugestaoRS.Enabled := false;
      _gbxSugestaoGeral.Enabled := true;
      if _lbeQuantidadePedidoSC.CanFocus then
        _lbeQuantidadePedidoSC.SetFocus;
    end;
    if idPedido = 4 then
    begin
      _gbxSugestaoRS.Enabled := true;
      _gbxSugestaoSC.Enabled := false;
      _gbxSugestaoGeral.Enabled := true;
      { if _cedQtdadePedidoRS.CanFocus then
        _lbeQuantidadePedidoRS.SetFocus; }
    end;

  end;

end;

procedure T_frmCompras._pnRestricaoClick(Sender: TObject);
begin
  _pnRestricao.Visible := false;
  Timer1.Enabled := false;
  Series9.Active := true;

end;

procedure T_frmCompras._tbsCompras1Enter(Sender: TObject);
begin

  setFocusQuantidadeCompras;
  { if idPedido = 3 then
    _cedQtdadePedidoEmpresa.SetFocus;
    if idPedido = 2 then
    if _cedQtdadePedidoRS.CanFocus then
    _cedQtdadePedidoRS.SetFocus;
    if idPedido = 1 then
    if _cedQtdadePedidoSC.CanFocus then
    _cedQtdadePedidoSC.SetFocus; }

end;

procedure T_frmCompras._tchVendasMensalClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  stMes: String;
  nrMes: Integer;
begin
  if Series9.Active then
  begin
    nrMes := ValueIndex;
    stMes := Series9.XLabel[ValueIndex];
    nrMes := getIndiceMes(stMes);
    if stMes <> '' then
      sleep(0);
    if idMesSelecionado[nrMes] = 'S' then
      idMesSelecionado[nrMes] := 'N'
    else
      idMesSelecionado[nrMes] := 'S';

    SetNavegacaoProduto(0);
    /// / MostraGraficoVendaGrid;
    // MostraDaDosCalculoGrid

  end;

end;

procedure T_frmCompras.AbreProdutosLaboratorio(PnrLaboratorio, PnrComprador,
  PcdEmpresa: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    // stQry.Add('-- MERCADORIA
    stQry.Add('MERCADORIA.CD_MERCADORIA,NR_DV_MERCADORIA,');
    stQry.Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    stQry.Add('trim(NM_MERCADORIA)||''  ''||trim(DS_APRESENTACAO_MERCADORIA) AS NM_COMPLETO,');
    stQry.Add('DS_SIGLA_MERCADORIA,DS_SIGLA_RESUMIDA,');
    stQry.Add('NR_LISTA_ABAFARMA,');
    stQry.Add('ID_REFRIGERADO,ID_VENDA_EXCLUSIVA_HOSPITALAR,');
    stQry.Add('ID_ORGAO_PUBLICO, ID_ORIGEM_MERCADORIA,');
    stQry.Add('CD_INTERNO_LABORATORIO,DS_UNIDADE_MEDIDA,');
    stQry.Add('QT_PESO_MERCADORIA, QT_EMBALAGEM_COMPRA,');
    stQry.Add('QT_EMBALAGEM_VENDA, mercadoria.ID_SITUACAO_MERCADORIA,');
    stQry.Add('CD_EAN_COMPRA,  CD_EAN_VENDA,');
    stQry.Add('QT_LARGURA_MERCADORIA, QT_ALTURA_MERCADORIA,');
    stQry.Add('QT_PROFUNDIDADE_MERCADORIA, QT_LARGURA_CAIXA,');
    stQry.Add('QT_ALTURA_CAIXA, QT_PROFUNDIDADE_CAIXA,');
    stQry.Add('((QT_LARGURA_MERCADORIA * QT_ALTURA_MERCADORIA');
    stQry.Add('*QT_PROFUNDIDADE_MERCADORIA)/1000000) AS MTS_CUBICO,');
    stQry.Add('ID_INATIVACAO_FUTURA, COMPRA.DT_INATIVACAO, DS_OBSERVACAO_INATIVACAO,');
    stQry.Add('ID_VENDA_MERCADO, ID_REVISTA,');
    stQry.Add('CD_FAMILIA_MARKETING, NR_FAMILIA_MERCADORIA,');
    stQry.Add('NR_NCM, DS_MINISTERIO_SAUDE,');
    stQry.Add('CASE');
    stQry.Add('WHEN COMPRA.CD_EMPRESA=1 THEN ''SC''');
    stQry.Add('WHEN COMPRA.CD_EMPRESA=4 THEN ''RS''');
    stQry.Add('ELSE ''ID''');
    stQry.Add('END ID_LOCAL_CD,');

    stQry.Add(
      'DS_NIVEL_ECNM, DS_NIVEL_EMAM, DS_NIVEL_ERGM, DS_NIVEL_EPRM, DS_NIVEL_ERTM,');
    stQry.Add('DS_NIVEL_ECTM, DS_NIVEL_EITM, DS_NIVEL_ESIM,');
    stQry.Add('VL_PESO_CAIXA,NR_EXTENSAO_IPI, ID_CALCULA_PRECO,');
    stQry.Add('QT_MULTIPLO_ALIMENTAR, QT_MULTIPLO_FARMA,');
    stQry.Add('ID_PACK_PROMOCIONAL, ID_VINCULADO_PACK,');
    stQry.Add('VL_TEMPERATURA_MINIMA, VL_TEMPERATURA_MAXIMA,');
    stQry.Add('DS_MERCADORIA, DT_ATUALIZACAO_SID, DT_ATUALIZACAO_MERCADORIA,');
    stQry.Add('COMPRA.CD_GRUPO_FORNECEDOR,COMPRA.CD_EMPRESA,');
    stQry.Add('ID_REPASSE_ICMS, ID_SUPERFLUO, ID_RETEM_ICMS, ID_CIPADO,');
    stQry.Add('ID_TIPO_LISTA_FISCAL,ID_REDUCAO_BASE, ID_TRIBUTACAO_NFE,');
    stQry.Add('CD_TRIBUTACAO_ICMS, CD_CST, CD_CST_PIS_VENDA,CD_CST_COFINS_VENDA,');
    stQry.Add('CD_CST_ENTRADA, CD_CST_SAIDA, PC_CREDITO_ICMS, PC_MARGEM_VENDA,');
    stQry.Add('PC_MARGEM_VENDA_ALIMENTAR, PC_IPI_MERCADORIA, DT_CADASTRO_MERCADORIA,');
    stQry.Add('DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA, ID_COFINS, ID_PIS,');
    stQry.Add('VL_PRECO_COMPRA,VL_PRECO_VENDA,');
    stQry.Add('ID_VENDA_AUTORIZADA, ID_PROMOCAO_COTACAO_QTD,DT_ATUALIZACAO_FISCAL,');
    stQry.Add('PC_DESCONTO_PADRAO_COMPRA,COMPRA.ID_SITUACAO_MERCADORIA AS ID_SITUACAO_COMPRA,CD_CST_PIS_COMPRA,');
    stQry.Add('CD_CST_COFINS_COMPRA,0.00 as PC_REPASSE_COMPRA,COMPRA.ID_CURVA_MERCADORIA,');
    stQry.Add('DT_PRIMEIRA_COMPRA,CD_LOCALIZACAO, QT_CXA_CAMADA_LOGISTICO,');
    stQry.Add('QT_CXA_PALETE_LOGISTICO,QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
    stQry.Add('QT_RESERVA_PROBLEMATICA,QT_VENCIDO ,QT_BLOQUEADO,');
    stQry.Add('QT_CAIXA_PALETE ,QT_CAIXA_CAMADA,');
    stQry.Add(' NR_VERBA_GERACAO,PC_VERBA_GERACAO,');

    stQry.Add('CASE');
    stQry.Add('WHEN  QT_FISICO - QT_RESERVADO -');
    stQry.Add('QT_RESERVA_PROBLEMATICA - QT_VENCIDO <0 THEN 0');
    stQry.Add('ELSE QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA');
    stQry.Add('end ESTOQUE_FISICO,0.00 AS PC_REPASSE,');
    stQry.Add('DT_ATUALIZACAO_ESTOQUE, ESTOQUE.ID_SITUACAO_MERCADORIA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_MERCADORIA  MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,');
    stQry.Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
    stQry.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');

    stQry.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
    stQry.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
    stQry.Add('WHERE');
    stQry.Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');

    stQry.Add('AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
    stQry.Add('AND FINANCEIRO.CD_EMPRESA=ESTOQUE.CD_EMPRESA');

    stQry.Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA =''A''');
    stQry.Add('AND compra.ID_SITUACAO_MERCADORIA =''A''');
    if PcdEmpresa > 0 then
      stQry.Add('AND COMPRA.CD_EMPRESA=:PcdEmpresa');

    stQry.Add('AND COMPRA.CD_COMPRADOR=:PnrComprador');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFabricante');
    stQry.Add('ORDER BY NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,CD_EMPRESA');
    stQry.SaveToFile('c:\temp\qryTabelaProdutoCompras.sql');
    with _cdsProduto do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
      Params.ParamByName('PnrFabricante').AsInteger := PnrLaboratorio;
      if PcdEmpresa > 0 then
        Params.ParamByName('PcdEmpresa').AsInteger := PcdEmpresa;
      open;
    end;
    Application.ProcessMessages;
  finally
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbreVendaLaboratorioAnual(nrLaboratorio,
  nrEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;

    stQry.Add('SELECT');
    stQry.Add('DT_VENDA_MERCADORIA,');
    stQry.Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
    stQry.Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
    stQry.Add('CASE  WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
    stQry.Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <>EXTRACT(YEAR FROM SYSDATE)');
    stQry.Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
    stQry.Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
    stQry.Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <>EXTRACT(YEAR FROM SYSDATE)');
    stQry.Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
    stQry.Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
    stQry.Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) =EXTRACT(YEAR FROM SYSDATE)');
    stQry.Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
    stQry.Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
    stQry.Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) =EXTRACT(YEAR FROM SYSDATE) THEN  13');
    stQry.Add('END MES,');
    stQry.Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
    stQry.Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
    stQry.Add('SUM(VT_CMV) AS VT_CMV');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
    stQry.Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA,');
    stQry.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    stQry.Add('WHERE');
    stQry.Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    stQry.Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    stQry.Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
    stQry.Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    if nrEmpresa > 0 then
      stQry.Add('AND VENDA.CD_EMPRESA=:PnrEmpresa');
    stQry.Add(
      'AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    stQry.Add('GROUP BY DT_VENDA_MERCADORIA');
    stQry.SaveToFile('c:\temp\sqlvendaFornecedor.sql');
    with _cdsVendaAnualLaboratorio do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      if nrEmpresa > 0 then
        Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
      open;
    end;
    if not _cdsVendaAnualLaboratorio.isEmpty then
    begin
      if nrEmpresa = 0 then
        MontaGraficodeVendasAnual(nrLaboratorio);
      if nrEmpresa = 1 then
        MontaGraficodeVendasAnualCDSC(nrLaboratorio);
      if nrEmpresa = 4 then
        MontaGraficodeVendasAnualCDRS(nrLaboratorio);
    end;
    result := _cdsVendaAnualLaboratorio
  finally
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbreListaPrecoLaboratorio(nrLaboratorio,
  nrEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT VLUS_S,NROM_S');
    stQry.Add('FROM');
    stQry.Add('(SELECT');
    stQry.Add('VLUS_S,SEQS_S,NROM_S');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCLIS A,');
    stQry.Add('PRDDM.DC_MERCADORIA A,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA CA');
    stQry.Add('WHERE');
    stQry.Add('A.NROM_S=A.CD_MERCADORIA');
    stQry.Add('AND a.NROM_S=CA.CD_MERCADORIA');
    stQry.Add('AND A.DIVS_S=(SELECT');
    stQry.Add('MAX(B.DIVS_S)');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCLIS B,');
    stQry.Add('PRDDM.DC_MERCADORIA B,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA CB');
    stQry.Add('WHERE');
    stQry.Add('B.NROM_S=B.CD_MERCADORIA');
    stQry.Add('AND B.NROM_S=A.CD_MERCADORIA');
    stQry.Add('AND B.NROM_S=CA.CD_MERCADORIA');
    stQry.Add('AND B.NROM_S=B.CD_MERCADORIA');
    stQry.Add('AND A.NROM_S=B.NROM_S');
    stQry.Add('AND B.CD_MERCADORIA=A.CD_MERCADORIA');
    stQry.Add('AND CB.CD_MERCADORIA=A.CD_MERCADORIA');
    stQry.Add('AND CA.CD_MERCADORIA=A.CD_MERCADORIA');
    stQry.Add('AND CA.CD_MERCADORIA=B.CD_MERCADORIA');
    stQry.Add('AND  B.NROM_S=cb.CD_MERCADORIA');
    stQry.Add('AND B.DIVS_S<=trunc(SYSDATE) AND rownum=1)');
    stQry.Add('AND CA.CD_FABRICANTE=:PnrLaboratorio');
    stQry.Add('AND CA.CD_EMPRESA=:PidEmpresa');
    stQry.Add('ORDER BY SEQS_S DESC)');

    result := nil;
    with _cdsPrecoLista do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      Params.ParamByName('PidEmpresa').AsInteger := nrEmpresa;
      open;
    end;
    result := _cdsPrecoLista;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.AbreLaboratorio(nrLaboratorio: Integer);
var
  stQry: TStringList;
  nrReg, nrDias: Integer;
  nrProduto, nrQtdadeEstoque, nrQtdadePendente: Integer;
  vlPrecoLista, vlDiasCoberturaEstoque, vlSusgestaoIdealEmpresa,
    vlSusgestaoIdealSC, vlSusgestaoIdealRS: Double;
  nrCorberturaEstoqueDia, nrDiferencaDias, qtExcesso: Double;
  nrMenorDiaPedido, nrDiaSemana, vlSusgestaoPossivel,
    nrQtadeEmbalagemCompra: Integer;
  stDiaPedido, dttemp: String;
  DadosFrequencia :TDadosFrequencia;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('FABRICANTE.CD_FABRICANTE, NR_DV_FABRICANTE, CD_FABRICANTE_PAI,');
    stQry.Add('CD_GRUPO_CURVA_FABRICANTE, NR_CNPJ, QT_DIAS_PRAZO_PADRAO,');
    stQry.Add('ID_REPASSE_ICMS, PC_REPASSE_ICMS, PC_ABATIMENTO_PADRAO,');
    stQry.Add('ID_RETEM_ICMS, ID_PEDIDO_GAM, ID_REDUZ_ICMS, ');
    stQry.Add('ID_RETENCAO_ALIQUOTA,ID_ICMS_DESTACADO, ID_PROCESSA_NFE,');
    stQry.Add('ID_COBRA_IPI, ID_REGIME_ESPECIAL_REDUCAO,');
    stQry.Add('ID_NFE_EMITE, DT_NFE_INICIO,');
    stQry.Add('QT_DIAS_LEADTIME_FABRICANTE, QT_DIAS_LEADTIME_TERMOLABIL,');
    stQry.Add('DT_AGENDAMENTO,DT_PROXIMO_PEDIDO, DS_NUMERO_DIA_SEMANA,');
    stQry.Add('NM_RESPONSAVEL_TI, DS_TELEFONE_TI,DS_EMAIL_TI, DS_OBSERVACAO,');
    stQry.Add('PC_MARGEM_VENDA, PC_MARGEM_VENDA_MEDICAMENTO,');
    stQry.Add('PC_MARGEM_VENDA_PERFUMARIA, PC_MARGEM_VENDA_PADRAO,');
    stQry.Add('NR_VERSAO_LAYOUT, NM_ARQUIVO, DT_FORNEC_CLIENTE,');
    stQry.Add('CD_FORNEC_CLIENTE, DT_ATUALIZACAO_SID, CD_FABRICANTE_SID,');
    stQry.Add('NR_DV_FABRICANTE_SID,FABRICANTE.NM_USUARIO,');
    stQry.Add('ID_ALMOXARIFADO, ID_SITUACAO_FABRICANTE,UFEP_P');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_FABRICANTE FABRICANTE,');
    stQry.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
    stQry.Add('PRDDM.DCPES');
    stQry.Add('WHERE');
    stQry.Add('NR_CNPJ=CGCP_P');
    stQry.Add('AND GRUPO_FORNECEDOR.CD_FABRICANTE=FABRICANTE.CD_FABRICANTE');
    stQry.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');

    with _cdsLaboratorio do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrFornecedor').AsInteger := nrLaboratorio;
      open;
    end;
    if not _cdsLaboratorio.isEmpty then
    begin
      nrPrazoPedido := _cdsLaboratorio.FieldByName('QT_DIAS_PRAZO_PADRAO').AsInteger;
      dtAgenda := StrToDateDef(FormatDateTime('dd/mm/yyyy',_cdsLaboratorio.FieldByName('DT_AGENDAMENTO').AsDateTime), dtSistema);
      _dtpDataAgendada.Date := dtAgenda;
      idUnidadeFederacao := _cdsLaboratorio.FieldByName('UFEP_P').AsString;
      _dtpDataPedido.Date := dtPedido;
      nrGrupoLaboratorio  := _cdsLaboratorio.FieldByName('CD_GRUPO_CURVA_FABRICANTE').AsInteger;
      dsDiasPedido        := _cdsLaboratorio.FieldByName('DS_NUMERO_DIA_SEMANA').AsString;
      idIcmDestacado      := _cdsLaboratorio.FieldByName('ID_ICMS_DESTACADO').AsString;
      idReduzIcms         := _cdsLaboratorio.FieldByName('ID_REDUZ_ICMS').AsString;
      nrLeadTime          := _cdsLaboratorio.FieldByName('QT_DIAS_LEADTIME_FABRICANTE') .AsInteger;
      SetCamposForncedor(nrGrupoLaboratorio, nrLeadTime);

      _lbeDiaPedido.Caption := DiasdeCompra(dsDiasPedido);
      DadosFrequencia:=GetFrequenciaEstoqueMaximo(nrGrupoLaboratorio);
      nrDiasFrequencia := DadosFrequencia.nrFrequenciaCompra;
      {case nrGrupoLaboratorio OF
        1 :nrDiasFrequencia := 28;
        2 :nrDiasFrequencia := 14;
        4 :nrDiasFrequencia := 7;
        8 :nrDiasFrequencia := 3.5;
        10:nrDiasFrequencia := 7;
        11:nrDiasFrequencia := 7;
      end;}

      if nrDiasFrequencia = 0 then
      begin
        Mensagem('Este labarat?rio n?o possue Grupo V?lido' + #13 +
          'Grupo = frequencia de Compra ' + #13 + ' 1 = 28 dias' + #13 +
          ' 2 = 14 dias' + #13 + ' 4 = 07  dias' + #13 + ' 8 = 3,5 dias' + #13 +
          'Para este pedido Sistema Usar? Grupo 1', MB_ICONEXCLAMATION);
        nrGrupoLaboratorio := 1;
        nrDiasFrequencia := 28;
      end;
      nrDiaSemana := DayOfWeek(dtPedido);
      nrMenorDiaPedido := StrToIntDef(copy(MostraDiaPedido(dsDiasPedido),
        1, 2), 0);
      if nrMenorDiaPedido = 0 then
      begin
        Mensagem('Este labarat?rio n?o possue Dia Agendado' + #13 +
          'Para este pedido Sistema Usar? Dia de Hoje como dia Agendado', 48);
        nrMenorDiaPedido := DayOfWeek(dtPedido);
      end;
      if idAgendaAntecipada then
        dtAgenda := dtPedido;
      _dtpProximaAgenda.Date := dtAgenda + nrDiasFrequencia;
      if dtAgenda < dtPedido then
      begin
        nrDiferencaDias := dtPedido - dtAgenda;
        _dtpProximaAgenda.Date := dtAgenda + nrDiasFrequencia + nrDiferencaDias;
      end;
      _dtpProximaAgenda.Date := AJustaDataPedido(_dtpProximaAgenda.Date,
        nrMenorDiaPedido, DayOfWeek(_dtpProximaAgenda.Date));
      dttemp := FormatDateTime(inttostr(DaysInMonth(dtPedido)) + '/mm/yyyy',
        dtPedido);
      if nrPedidoTelaCompra > 0 then
        _dtpProximaAgenda.Date := _cdsLaboratorio.FieldByName('DT_AGENDAMENTO')
          .AsDateTime;

      _dtpDataUltimoPedidoMes.Date :=
        (AJustaDataPedido(dtAgenda + nrDiasFrequencia, nrMenorDiaPedido,
        nrDiaSemana));

      if MonthOf(dtPedido) < MonthOf(dtAgenda + nrDiasFrequencia) then
        _dtpDataUltimoPedidoMes.Date :=
          (AJustaDataPedido(dtPedido, nrMenorDiaPedido, nrDiaSemana));

      // _dtpDataAgendada.Enabled := false;
      // nrParamentoEstoque := _cdsLaboratorio.FieldByName('').AsInteger;

      nrLeadTime := _cdsLaboratorio.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')
        .AsInteger;
      _stbCompras.Panels[1].Text :=
        'Abrindo Parametros de Compra do Laborat?rio';
      _stbCompras.Refresh;
      AbreParamentoCompraLaboratorio (_cdsLaboratorio.FieldByName('CD_GRUPO_CURVA_FABRICANTE').AsInteger);
      _stbCompras.Panels[1].Text :='Abrindo Cadastro de produto do Laborat?rio';
      _stbCompras.Refresh;
      AbreParamentroLaboratorio(nrLaboratorio);
      if _cdsProduto.isEmpty then
        AbreProdutosLaboratorio(nrLaboratorio, nrCompradorPedido, idPedido);
      _stbCompras.Panels[1].Text := 'Abrindo Vendas do Laborat?rio';
      _stbCompras.Refresh;
      _cdsVendalaboratorio := AbreVendaLaboratorioMultiEmpresaAtual
        (nrLaboratorio, 0, cdoperadorLogisticoPedido);
      _cdsVendalaboratorio.RecordCount;
      _cdsVendasSC := AbreVendaLaboratorioMultiEmpresaAtual(nrLaboratorio, 1,
        cdoperadorLogisticoPedido);
      _cdsVendasRS := AbreVendaLaboratorioMultiEmpresaAtual(nrLaboratorio, 4,
        cdoperadorLogisticoPedido);
      _cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, nrLaboratorio, 0, 0,
        'S', dtSistema);
      // _cdsVendalaboratorio := AbreVendaLaboratorioMultiEmpresa(nrLaboratorio, 1, cdoperadorLogisticoPedido);

      _stbCompras.Panels[1].Text := 'Abrindo Lista de Pre?o do Laborat?rio';
      _stbCompras.Refresh;
      // AbreListaPrecoLaboratorio(nrLaboratorio,1);
      _cdsEspecealidade.open;
      _cdsEspecealidade := AbreEspecealidade(nrLaboratorio);
      (* **************** *)
      // Carregando Estoque Fornecedor
      _cdsEstoqueMultEmpresa.open;
      _cdsEstoqueMultEmpresa := AbreEstoqueMultiEmpresa(nrLaboratorio, 0);
      (* **************** *)
      // _cdsEspecealidade.RecordCount;
      // _stbCompras.Panels[1].Text :=
      // 'Abrindo Historico de Estoque do Laborat?rio';
      // _stbCompras.Refresh;
      // AbreEstoqueDiario(_nrLaroratorio);
      _stbCompras.Panels[1].Text := 'Abrindo Pendencia do Laborat?rio';
      _stbCompras.Refresh;
      AbrePendenciaGeral(nrLaboratorio);

      // AbrePendenciaCdSC(nrLaboratorio);
      // AbrePendenciaCdRS(nrLaboratorio);
      _cdsPendencia := AbrePendenciaLaboratorioNova(nrLaboratorio);

      _stbCompras.Panels[1].Text := 'Abrindo Ultimas Compras do Laborat?rio';
      _stbCompras.Refresh;
      _cdsUltimasCompra := AbreUltimasCompraLaboratorio(nrLaboratorio,
        cdoperadorLogisticoPedido, cdoperadorLogisticoPedido);
      _stbCompras.Panels[1].Text :=
        'Abrindo Indice de Falta Anterior do Laborat?rio';
      _stbCompras.Refresh;
      if _chkAbreIndiceFalta.Checked then
      begin
        _stbCompras.Panels[1].Text :=
          'Abrindo Indice de Falta Anterior do Laborat?rio';
        _stbCompras.Refresh;
        AbreIndiceFaltaAnterior(nrLaboratorio, nrProduto);
        _stbCompras.Panels[1].Text :=
          'Abrindo Indice de Falta Atual do Laborat?rio';
        _stbCompras.Refresh;
        AbreIndiceFaltaAtual(nrLaboratorio, nrProduto);
      end;
      // if _cdsProduto.Active then
      // _cdsProduto.IndexFieldNames := 'ID_CURVA_MERCADORIA;NM_COMPLETO';
      _cdsProduto.First;
      // MontaGraficodeVendas(_cdsProduto.FieldByName('NROM_M').AsInteger);

      _stbCompras.Panels[1].Text := 'Montando Previs?o de compra...';
      _stbCompras.Refresh;
      if idPedido > 0 then
        FiltraProdutoEmpresa(0, 1);
      if DadosPedidoAbertuta=nil then
         CarregaTabelaProdutoCD(idPedido);
      if DadosPedidoAbertuta<>nil then
      begin
        MostraTotaisPedido(NrPedidoSC, 1);
        MostraTotaisPedido(NrPedidoRS, 4);
        _cdsProduto.First;
       if AbreItemPrePedidoMultiEmpresa(NrPedidoSC, NrPedidoRS, 0, 0, 'N') then
          SetNomeCampoItemPrePedido;


      end;

      MontaGraficoVenda;
      // SetVendasLaboratorio;

      _stbCompras.Panels[1].Text := 'Dados Importados...';
      _stbCompras.Panels[2].Text := '';
      _stbCompras.Refresh;
      _lbeNrLaboratorio.Enabled := false;
      if _lbeNrPedido.CanFocus then
        _lbeNrPedido.SetFocus;
      _cdsProduto.First;
      SetNavegacaoProduto(0);



    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.AbreEstoqueDiario(PnrLaboratorio, PnrProduto,
  PnrCD: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT extract(DAY FROM DAEE_E)AS DIA,FISM_E,DAEE_E,nrom_e');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
    stQry.Add('PRDDM.DCEST ES');
    stQry.Add('WHERE');
    stQry.Add('CM.CD_MERCADORIA=NROM_E');
    stQry.Add('AND CM.CD_empresa=es.cd_empresa');
    stQry.Add('AND CM.CD_empresa=:PnrCD');
    stQry.Add('AND CM.CD_GRUPO_FORNECEDOR= :PnrLaboratorio');
    stQry.Add('AND CM.CD_MERCADORIA = :PnrProduto');
    stQry.Add(
      'AND DAEE_E  between add_MONTHS(trunc(sysdate,''day''),-3) and sysdate');
    // stQry.Add('ORDER BY DAEE_E');
    with _cdsEstoqueDiario do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
      Params.ParamByName('PnrCD').AsInteger := PnrCD;
      open;
    end;
    if _cdsEstoqueDiario.Active then
      _cdsEstoqueDiario.IndexFieldNames := 'DAEE_E';
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.AbreIndiceFaltaAnterior(PnrLaboratorio,
  PnrProduto: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('NROM_E,Round(COUNT(*)/EXTRACT (DAY FROM');
    stQry.Add('Add_Months(LAST_Day(SYSDATE),-1)),4)*100 AS NR_OCORRENCIA,');
    stQry.Add('ESTOQUE.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('PRDDM.DCEST ESTOQUE');
    stQry.Add('WHERE');
    stQry.Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=NROM_E');
    stQry.Add('AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
    stQry.Add('AND QT_ESTOQUE_DISPONIVEL_VENDA=0');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR = :PnrLaboratorio');
    if PnrProduto > 0 then
      stQry.Add('AND NROM_E=:PnrMercadoria');
    stQry.Add('AND DAEE_E between Add_Months(LAST_Day(SYSDATE),-2)');
    stQry.Add('and Add_Months(LAST_Day(SYSDATE),-1)');
    stQry.Add('GROUP BY NROM_E,ESTOQUE.CD_EMPRESA');
    with _cdsIndiceFaltaAnterior do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      if PnrProduto > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := PnrProduto;
      open;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.AbreIndiceFaltaAtual(PnrLaboratorio,
  PnrProduto: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('NROM_E,Round(COUNT(*)/EXTRACT ');
    stQry.Add('(DAY FROM  Add_Months((SYSDATE)-1,0)),4)*100 AS NR_OCORRENCIA,');
    stQry.Add('ESTOQUE.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('PRDDM.DCEST ESTOQUE');
    stQry.Add('WHERE');
    stQry.Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=NROM_E');
    stQry.Add('AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    stQry.Add('AND QT_ESTOQUE_DISPONIVEL_VENDA=0');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR = :PnrLaboratorio');
    if PnrProduto > 0 then
      stQry.Add('AND NROM_E=:PnrMercadoria');
    stQry.Add('AND DAEE_E between Add_Months(LAST_Day(SYSDATE),-1)');
    stQry.Add('and Add_Months(LAST_Day(SYSDATE),0)');
    stQry.Add('GROUP BY NROM_E,ESTOQUE.CD_EMPRESA');

    with _cdsIndiceFaltaAtual do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      if PnrProduto > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := PnrProduto;
      open;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.AbreDiasZero(PnrLaboratorio, PnrProduto: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add(
      'CM.CD_EMPRESA,NROM_E,COUNT(*) DIAS_ZERO,EXTRACT(MONTH  FROM DAEE_E) MES');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCEST E,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
    stQry.Add('WHERE');
    stQry.Add('NROM_E=CD_MERCADORIA');
    stQry.Add('AND E.CD_EMPRESA=CM.CD_EMPRESA');
    stQry.Add('AND QT_ESTOQUE_DISPONIVEL_VENDA=0');
    stQry.Add('AND CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    if PnrProduto > 0 then
      stQry.Add('AND NROM_E=:PnrMercadoria');
    stQry.Add('AND DAEE_E>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
    stQry.Add('GROUP BY EXTRACT(MONTH FROM DAEE_E),NROM_E,CM.CD_EMPRESA');;
    with _cdsDiasAZero do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      if PnrProduto > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := PnrProduto;
      open;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.AbreParamentoCompraLaboratorio(nrGrupo: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT  ');
    stQry.Add('CD_GRUPO_CURVA_FABRICANTE, ID_CURVA_MERCADORIA,');
    stQry.Add('QT_DIAS_FREQUENCIA_COMPRA, QT_ESTOQUE_MAXIMO,QT_ESTOQUE_MINIMO');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA ');
    stQry.Add('WHERE');
    stQry.Add('CD_GRUPO_CURVA_FABRICANTE= :PnrGrupo');

    with _cdsParamentoCompra do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrGrupo').AsInteger := nrGrupo;
      open;
    end;
    if not _cdsParamentoCompra.isEmpty then
      _cdsParamentoCompra.RecordCount;

  finally
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbrePendenciaLaboratorio(nrLaboratorio,
  nrEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(self);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

    stQry.Add('SELECT');
    stQry.Add('SUM(QUAY_Y - CHEY_Y) as QT_PENDENTE  ,NROM_Y,');
    stQry.Add('sum((QUAY_Y - CHEY_Y) * PFBY_Y) VL_PEDENCIA,CAPA.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND SITP_P IN(''P'',''N'')');
    stQry.Add('AND SITY_Y IN(''P'',''N'')');
    if nrEmpresa > 0 then
      stQry.Add('AND CAPA.CD_EMPRESA=:PnrEmpresa');
    stQry.Add('AND LABP_P=:PnrLaboratorio');
    stQry.Add('GROUP BY NROM_Y,CAPA.CD_EMPRESA');

    { stQry.Add('SELECT');
      stQry.Add(' SUM(ITEM_NFE.QT_MERCADORIA) as QT_PENDENTE  ,NROM_Y,');
      stQry.Add(' sum(ITEM_NFE.VL_PRODUTO - ITEM_NFE.VL_DESCONTO - ITEM_NFE.VL_ICMS - ITEM_NFE.VL_ICMS_ST - ITEM_NFE.VL_ICMS_ST_RETIDO - ITEM_NFE.VL_PIS - ITEM_NFE.VL_COFINS + ITEM_NFE.VL_OUTROS) VL_PEDENCIA,');
      stQry.Add(' CAPA.CD_EMPRESA');
      stQry.Add('FROM');
      stQry.Add(' PRDDM.DCPCC CAPA,');
      stQry.Add(' PRDDM.DCPCI ITEM,');
      stQry.Add(' PRDDM.DC_NFE_ENTRADA NFE,');
      stQry.Add(' PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
      stQry.Add(' PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE');
      stQry.Add('WHERE');
      stQry.Add(' NROP_P=NROP_Y');
      stQry.Add(' AND SITP_P IN(''P'',''N'')');
      stQry.Add(' AND SITY_Y IN(''P'',''N'')');
      stQry.Add(' AND PEDIDO_ITEM_NFE.CD_PEDIDO = NROP_P');
      stQry.Add(' AND ITEM_NFE.CD_MERCADORIA = NROM_Y');
      stQry.Add(' AND ITEM_NFE.CD_EMPRESA = CAPA.CD_EMPRESA');
      stQry.Add(' AND ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
      stQry.Add(' AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
      stQry.Add(' AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
      stQry.Add(' AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
      stQry.Add(' AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
      stQry.Add(' AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
      stQry.Add(' AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
      stQry.Add(' AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
      stQry.Add(' AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
      stQry.Add(' AND To_Char(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039'' ');

      if nrEmpresa > 0 then
      stQry.Add(' AND CAPA.CD_EMPRESA=:PnrEmpresa');
      stQry.Add(' AND LABP_P=:PnrLaboratorio');
      stQry.Add('GROUP BY NROM_Y,CAPA.CD_EMPRESA'); }

    stQry.SaveToFile('AbrePendenciaLaboratorio.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      if nrEmpresa > 0 then
        Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      open;
    end;
    result := NIL;
    if NOT _cdsTemp.isEmpty then
    begin
      _cdsTemp.RecordCount;
      result := _cdsTemp;
    end;
  finally
    // FreeAndNil(_cdsTemp);
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbrePendenciaProduto(nrProduto, nrEmpresa: Integer)
  : TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(self);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('SUM(QUAY_Y-CHEY_Y) as QT_PENDENTE  ,NROM_Y,');
    stQry.Add('sum((QUAY_Y - CHEY_Y) * PFBY_Y) VL_PEDENCIA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    stQry.Add('WHERE');
    stQry.Add('SITP_P IN(''P'',''N'')');
    stQry.Add('AND SITY_Y IN(''P'',''N'')');
    stQry.Add('AND NROP_P=NROP_Y');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND NROM_Y=MERCADORIA.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_EMPRESA=:PnrEmpresa');
    stQry.Add('AND COMPRA.CD_FABRICANTE=:PnrLaboratorio');
    stQry.Add('GROUP BY NROM_Y');

    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorioLocal;
      open;
    end;
    result := NIL;
    if NOT _cdsTemp.isEmpty then
    begin
      _cdsTemp.RecordCount;
      result := _cdsTemp;
    end;
  finally
    // FreeAndNil(_cdsTemp);
    FreeAndNil(stQry);
  end;
end;

(* ************** *)
function T_frmCompras.AbreEstoqueMultiEmpresa(nrFornecedor, nrEmpresa: Integer)
  : TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
begin
  try
    _cdsTemp := TClientDataSet.Create(self);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('CD_MERCADORIA,ESTOQUE,CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('(SELECT ESTOQUE.CD_MERCADORIA ,');
    stQry.Add(
      'Sum(QT_FISICO -( QT_RESERVADO + QT_RESERVA_PROBLEMATICA+ QT_VENCIDO)) AS ESTOQUE ,ESTOQUE.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA ,');
    stQry.Add(' PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
    stQry.Add('WHERE');
    stQry.Add('COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    stQry.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    stQry.Add('GROUP BY ESTOQUE.CD_MERCADORIA,ESTOQUE.CD_EMPRESA');
    stQry.Add('UNION ALL');
    stQry.Add('SELECT ESTOQUE.CD_MERCADORIA ,');
    stQry.Add(
      'Sum(QT_FISICO -( QT_RESERVADO + QT_RESERVA_PROBLEMATICA+ QT_VENCIDO)),0');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA ,');
    stQry.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
    stQry.Add('WHERE');
    stQry.Add('COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    stQry.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    stQry.Add('GROUP BY ESTOQUE.CD_MERCADORIA)');
    stQry.SaveToFile('c:\temp\qryEstoqueEmpresa.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrFornecedor').AsInteger := nrLaboratorioLocal;
      open;
    end;
    result := NIL;
    if NOT _cdsTemp.isEmpty then
    begin
      _cdsTemp.RecordCount;
      result := _cdsTemp;
    end;
  finally
    // FreeAndNil(_cdsTemp);
    FreeAndNil(stQry);
  end;
end;

(* ************** *)

function T_frmCompras.AbreUltimasCompraLaboratorio(nrLaboratorio,
  nrOperadorLogistico, cdEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(self);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

    stQry.Add('SELECT');
    stQry.Add('SUMARIZADA.CD_MERCADORIA , SUMARIZADA.DT_COMPRA,');
    stQry.Add('SUM(QT_COMPRA_ACUMULADA) AS QT_COMPRA_ACUMULADA,');
    stQry.Add('SUMARIZADA.DT_ATUALIZACAO, SUMARIZADA.NM_USUARIO,');
    stQry.Add('ID_SITUACAO_COMPRA,COMPRA.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_COMPRA_SUMARIZADA SUMARIZADA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    stQry.Add('WHERE');
    stQry.Add('SUMARIZADA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND SUMARIZADA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    // stQry.Add('AND COMPRA.CD_EMPRESA=:PcdEmpresa');
    stQry.Add(
      'AND SUMARIZADA.DT_COMPRA BETWEEN add_MONTHS(trunc(sysdate,''day''),-3) and SYSDATE');
    stQry.Add('AND SUMARIZADA.CD_OPERADOR_LOGISTICO =:PcdOPeradorLogistico');
    stQry.Add('GROUP BY SUMARIZADA.CD_MERCADORIA , SUMARIZADA.DT_COMPRA,');
    stQry.Add('SUMARIZADA.DT_ATUALIZACAO, SUMARIZADA.NM_USUARIO,');
    stQry.Add('SUMARIZADA.ID_SITUACAO_COMPRA,COMPRA.CD_EMPRESA');

    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PcdOPeradorLogistico').AsInteger :=
        nrOperadorLogistico;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      // Params.ParamByName('PcdEmpresa').AsInteger := cdEmpresa;
      open;
    end;
    // result := NIL;
    // if NOT _cdsTemp.IsEmpty then
    result := _cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbreItemPedidoV(nrPedido, nrMercadoria: Integer;
  idSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add(
      'NROP_Y , NROM_M*10+DIGM_M AS CD_PRODUTO,NOMM_M,APRM_M,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add('PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,ECNM_M,NROM_Y,');
    stQry.Add('QT_SUGERIDA , VL_MEDIA_VENDA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DCMER PRODUTO');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROM_Y=NROM_M');
    stQry.Add('AND NROP_Y = :PnrPedido');
    if nrMercadoria > 0 then
      stQry.Add('AND NROM_Y = :PnrMercadoria');
    stQry.Add('order by dfiY_y');

    with _cdsitemPedido do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrPedido').AsInteger := nrPedido;
      if nrMercadoria > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := nrMercadoria;
      open;
      First;
    end;
    result := false;
    TotalizaPedido(nrPedido, 0, '');
    if not _cdsitemPedido.isEmpty then
    begin
      result := true;
    end;
  finally
    FreeAndNil(stQry);
  end;

end;

function T_frmCompras.AbreItemPedidoMultiEmpresaCDSC(nrPedido, nrMercadoria,
  cdEmpresa: Integer; idSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add(
      'NROP_Y , CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add(
      'PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,CD_MERCADORIA,');
    stQry.Add('QT_SUGERIDA , VL_MEDIA_VENDA,NROM_Y');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND QUAY_Y>0');
    stQry.Add('AND NROP_Y = :PnrPedido');
    if nrMercadoria > 0 then
      stQry.Add('AND NROM_Y = :PnrMercadoria');
    stQry.Add('order by DFIY_Y');

    with _cdsitemPedidoCDSC do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrPedido').AsInteger := nrPedido;
      if nrMercadoria > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := nrMercadoria;
      open;
      First;
    end;
    result := false;
    TotalizaPedido(nrPedido, 0, '');
    if not _cdsitemPedidoCDSC.isEmpty then
    begin
      result := true;
      SetNomeCampoItemPedidoSC;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbreItemPedidoMultiEmpresa(PnrPedido, PnrMercadoria,
  PcdEmpresa: Integer; PidSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add(
      'NROP_Y , CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add(
      'PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,CD_MERCADORIA,');
    stQry.Add('QT_SUGERIDA , VL_MEDIA_VENDA,NROM_Y');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND NROP_Y = :PnrPedido');
    if PnrMercadoria > 0 then
      stQry.Add('AND NROM_Y = :PnrMercadoria');
    stQry.Add('order by DFIY_Y');

    with _cdsitemPedido do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrPedido').AsInteger := PnrPedido;
      if PnrMercadoria > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := PnrMercadoria;
      open;
      First;
    end;
    result := false;
    TotalizaPedido(PnrPedido, 0, '');
    if not _cdsitemPedido.isEmpty then
    begin
      result := true;
      SetNomeCampoItemPedido;
    end;
  finally
    FreeAndNil(stQry);
  end;

end;

function T_frmCompras.AbreItemPedidoMultiEmpresaCDRS(nrPedido, nrMercadoria,
  cdEmpresa: Integer; idSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('NROP_Y , CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add(
      'PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,CD_MERCADORIA,');
    stQry.Add('QT_SUGERIDA , VL_MEDIA_VENDA,NROM_Y');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND QUAY_Y>0');
    stQry.Add('AND NROP_Y = :PnrPedido');
    if nrMercadoria > 0 then
      stQry.Add('AND NROM_Y = :PnrMercadoria');
    // stQry.Add('order by dfiY_y');
    stQry.Add('order by DFIY_Y');

   with _cdsitemPedidoCDRS do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrPedido').AsInteger := nrPedido;
      if nrMercadoria > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := nrMercadoria;
      open;
      First;
    end;
    result := false;
    TotalizaPedido(nrPedido, 0, '');
    if not _cdsitemPedidoCDRS.isEmpty then
    begin
      result := true;
      SetNomeCampoItemPedidoRS;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

function T_frmCompras.AbreItemPrePedidoMultiEmpresa(PnrPedidoSC, PnrPedidoRS,
  PnrMercadoria, PcdEmpresa: Integer; PidSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('NROP_Y , ');
    stQry.Add('CASE');
    stQry.Add('wHEN  ITEM.cd_empresa=1 THEN ''SC''');
    stQry.Add('WHEN  ITEM.cd_empresa=4 THEN ''RS''');
    stQry.Add('END CD,');
    stQry.Add('CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y ,QT_SUGERIDA , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('PUNY_Y*QUAY_Y as VT_ITEM,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add('PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,CD_MERCADORIA,');
    stQry.Add('VL_MEDIA_VENDA,NROM_Y,ITEM.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND NROP_Y In(:PnrPedidoSC,:PnrPedidoRS)');
    if PnrMercadoria > 0 then
      stQry.Add('AND NROM_Y = :PnrMercadoria');
    // stQry.Add('order by dfiY_y');
  //  stQry.Add(
    //  'ORDER BY nm_mercadoria,ds_apresentacao_mercadoria,cd_produto ,ITEM.CD_EMPRESA');

    stQry.SaveToFile('C:\temp\qryPrePedido.sql');
    with _cdsPrePedido do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrPedidoSC').AsBCD := PnrPedidoSC;
      Params.ParamByName('PnrPedidoRS').AsBCD := PnrPedidoRS;
      if PnrMercadoria > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := PnrMercadoria;
      open;
      First;
    end;
    result := false;
    // TotalizaPedido(PnrPedidoSC, 0, '');
    if not _cdsPrePedido.isEmpty then
    begin
      _cdsPrePedido.IndexFieldNames:='nm_mercadoria;ds_apresentacao_mercadoria;cd_produto;CD_EMPRESA';
//      _cdsPrePedido.FieldByName('nm_mercadoria').
      result := true;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

Function T_frmCompras.AbreEspecealidade(nrLaboratorio: Integer): TClientDataSet;
var
  stQry: TStringList;
  stTemp: string;
  _cdsTemp: TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(self);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    stQry.Add('(SELECT DS_DESCRICAO_ESTRUTURA AS ESPECEALIDADE,');
    stQry.Add('NR_SEQUENCIAL');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_CLASSIFICACAO_PRODUTO,');
    stQry.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
    stQry.Add('WHERE');
    stQry.Add('NR_SEQUENCIAL=DS_NIVEL_EITM');
    stQry.Add('AND  MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add(
      'AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    stQry.Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
    stQry.Add('AND DS_NIVEL_ECNM=1');
    stQry.Add('GROUP BY');
    stQry.Add('DS_DESCRICAO_ESTRUTURA,');
    stQry.Add('NR_SEQUENCIAL)');
    stQry.Add('UNION ALL');
    stQry.Add('(SELECT');
    stQry.Add('DS_DESCRICAO_ESTRUTURA AS ESPECEALIDADE,');
    stQry.Add('NR_SEQUENCIAL  FROM');
    stQry.Add('PRDDM.DC_CLASSIFICACAO_PRODUTO,');
    stQry.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
    stQry.Add('WHERE');
    stQry.Add('NR_SEQUENCIAL=DS_NIVEL_ERGM');
    stQry.Add(
      'AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    stQry.Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
    stQry.Add('AND DS_NIVEL_ECNM>1');
    stQry.Add('GROUP BY');
    stQry.Add('DS_DESCRICAO_ESTRUTURA,');
    stQry.Add('NR_SEQUENCIAL)');
    stQry.Add('ORDER BY  ESPECEALIDADE');
    stTemp := stQry.Text;
    stQry.SaveToFile('qryEspecealidade.qry');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      open;
    end;
    result := nil;
    if not _cdsTemp.isEmpty then
      result := _cdsTemp;
  finally
    FreeAndNil(stQry);
    // FreeAndNil(_cdsTemp);
  end;

end;

Function T_frmCompras.AbreVendaLaboratorio(nrLaboratorio, nrEmpresa: Integer)
  : TClientDataSet;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT NROM_W,DATW_W,  QUAW_W,  VFTW_W,  PESW_W,');
      Add('VIRW_W,QT_DIAS_VENDA ,QT_DIAS_ESTOQUE_ZERO, extract(MONTH FROM DATW_W) MES');
      Add('FROM');
      Add('PRDDM.DCWEN ,');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('WHERE');
      Add('NROM_W=MERCADORIA.CD_MERCADORIA');
      Add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND DATW_W > Add_Months(trunc(SYSDATE),-13)');
      Add('AND DATW_W <trunc(SYSDATE)');
      Add('AND QUAW_W >=0');
      Add('AND COMPRA.CD_FABRICANTE =:PnrLaboratorio');
      Add('UNION ALL');
      Add('(SELECT');
      Add('NROM_W,Trunc(DATW_W) AS DATW_W,');
      Add('Sum(QUAW_W),Sum(VFTW_W) AS VFTW_W,');
      Add('Sum(PESW_W) AS pesw_w,Sum(VIRW_W) AS virw_w,');
      Add('Sum(QT_DIAS_VENDA) AS qt_dias_venda,');
      Add('Sum(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,13  AS MES');
      Add('FROM');
      Add('PRDDM.DCWEM ,');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('WHERE');
      Add('NROM_W=MERCADORIA.CD_MERCADORIA');
      Add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND DATW_W <= SYSDATE');
      Add('AND QUAW_W >=0');
      Add('AND COMPRA.CD_FABRICANTE =:PnrLaboratorio');
      Add('GROUP BY NROM_W, DATW_W )');
    end;

    with _cdsTemporario do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      open;
    end;
    if not _cdsTemporario.isEmpty then
      _cdsTemporario.IndexFieldNames := 'NROM_W';

    result := _cdsTemporario;

  finally
    FreeAndNil(stQry);
  end;
end;

Function T_frmCompras.AbreVendaLaboratorioMultiEmpresa(nrLaboratorio, nrEmpresa,
  nrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
begin
  try
    try
      stQry := TStringList.Create;
      with stQry do
      begin
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('CD_MERCADORIA,');
        Add('SUM(NR_UNIDADES) AS NR_UNIDADES,');
        Add('MAX(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(VT_VENDA) AS VT_VENDA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');
        Add('MES,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO ,');
        Add('CD_EMPRESA');
        Add('FROM');
        Add('((');
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('COMPRA.CD_MERCADORIA,');
        Add('VENDA.CD_EMPRESA,');
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('CASE');
        Add('WHEN NVL(ID_REPOSICAO_ESTOQUE,''N'')<>''S'' THEN CD_OPERADOR_LOGISTICO');
        Add('WHEN NVL(ID_REPOSICAO_ESTOQUE,''N'')=''S'' THEN CD_OPERADOR_LOGISTICO');
        Add('END  CD_OPERADOR_LOGISTICO,');
        Add('NVL(ID_REPOSICAO_ESTOQUE,''N'') AS ID_REPOSICAO_ESTOQUE,');
        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <> EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <> EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) = EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) = EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  13');
        Add('END MES,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
        Add('SUM(VT_CMV) AS VT_CMV');
        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add('AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrLaboratorio');
        Add('WHERE');
        Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
        Add('GROUP BY DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,');
        Add('COMPRA.CD_MERCADORIA,ID_REPOSICAO_ESTOQUE,');
        Add('VENDA.CD_EMPRESA)');
        Add('UNION ALL');
        Add('(SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('COMPRA.CD_MERCADORIA,');
        Add('0 AS CD_EMPRESA,');
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('CASE');
        Add('WHEN NVL(ID_REPOSICAO_ESTOQUE,''N'')<>''S'' THEN CD_OPERADOR_LOGISTICO');
        Add('WHEN NVL(ID_REPOSICAO_ESTOQUE,''N'')=''S'' THEN CD_OPERADOR_LOGISTICO');
        Add('END  CD_OPERADOR_LOGISTICO,');
        Add('NVL(ID_REPOSICAO_ESTOQUE,''N'') AS ID_REPOSICAO_ESTOQUE,');
        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <> EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <> EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) = EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) = EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  13');
        Add('END MES,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
        Add('SUM(VT_CMV) AS VT_CMV');
        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add(' AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrLaboratorio');
        Add('WHERE');
        Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
        Add('GROUP BY DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,');
        Add('COMPRA.CD_MERCADORIA,ID_REPOSICAO_ESTOQUE,');
        Add('VENDA.CD_EMPRESA))');
        Add('GROUP BY  DT_VENDA_MERCADORIA ,CD_MERCADORIA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');

        Add('MES,CD_EMPRESA');
        Add('ORDER BY  DT_VENDA_MERCADORIA DESC');
      end;

      with _cdsTemporario do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
        open;
      end;
      if not _cdsTemporario.isEmpty then
        _cdsTemporario.IndexFieldNames := 'CD_MERCADORIA';

      result := _cdsTemporario;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logaistico %d',
          [nrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

Function T_frmCompras.AbreVendaLaboratorioMultiEmpresaII(nrLaboratorio,
  nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
begin
  try
    try
      stQry := TStringList.Create;
      with stQry do
      begin
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,CD_MERCADORIA,CD_EMPRESA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');
        Add('NR_UNIDADES,QT_DIAS_ESTOQUE_ZERO,VT_VENDA,MES,');
        Add('VT_FATURAMENTO_LIQUIDO,VT_FATURAMENTO_BRUTO');
        Add('FROM');
        Add('((SELECT');
        Add('DT_VENDA_MERCADORIA,COMPRA.CD_MERCADORIA,VENDA.CD_EMPRESA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('CASE  WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <>EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <>EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) =EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) =EXTRACT(YEAR FROM SYSDATE) THEN  13');
        Add('END MES,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
        Add('SUM(VT_CMV) AS VT_CMV');
        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
        // Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
        Add('WHERE');
        Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('and VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        // Add('AND COMPRA.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
        Add('GROUP BY DT_VENDA_MERCADORIA,compra.CD_MERCADORIA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');

        Add('VENDA.CD_EMPRESA)');
        Add('UNION ALL');
        // Fazendo o Somatorio das duas Empresa
        Add('(SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('CD_MERCADORIA,');
        Add('0 AS CD_EMPRESA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');

        Add('Sum(NR_UNIDADES) AS NR_UNIDADES,');
        Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('Sum(VT_VENDA) AS VT_VENDA,');
        Add('MES,');
        Add('Sum(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO');
        Add('FROM');
        Add('(SELECT');
        Add('DT_VENDA_MERCADORIA,COMPRA.CD_MERCADORIA,SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('CASE  WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <>EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <>EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) =EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) =EXTRACT(YEAR FROM SYSDATE) THEN  13');
        Add('END MES,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
        Add('SUM(VT_CMV) AS VT_CMV');
        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
        // Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
        Add('WHERE');
        Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        // Add('AND COMPRA.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
        Add('GROUP BY DT_VENDA_MERCADORIA,compra.CD_MERCADORIA,');
        if nrOperadorLogistico > 1 then
          Add('CD_OPERADOR_LOGISTICO,');
        Add('VENDA.CD_EMPRESA)');
        Add('GROUP BY');
        Add('DT_VENDA_MERCADORIA,');
        Add('CD_MERCADORIA');
        if nrOperadorLogistico > 1 then
          Add(',CD_OPERADOR_LOGISTICO');
        Add(',MES))');
        Add('ORDER BY  DT_VENDA_MERCADORIA,CD_EMPRESA');
      end;

      with _cdsTemporario do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
        open;
      end;
      if not _cdsTemporario.isEmpty then
        _cdsTemporario.IndexFieldNames := 'CD_MERCADORIA';

      result := _cdsTemporario;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logaistico %d',
          [nrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras._btnRecalculaSugestaoClick(Sender: TObject);
begin
  nrUnidadesSugeridaRS := 0;
  nrUnidadesSugeridaSC := 0;
  nrUnidadesCompradaSC := 0;
  nrUnidadesCompradaRS := 0;
  nrUnidadesCompradaEmpresa := 0;
  nrUnidadesSugeridaEmpresa := 0;
  vlSugeridaMtsCubicoRS := 0;
  vlSugeridaMtsCubicoSC := 0;
  vlSugeridoCustoSC := 0;
  vlSugeridoCustoRS := 0;
  vtSugeridoVendaSC := 0;
  vlSugeridoRS := 0;
  vlSugeridoSC := 0;

  vtSugeridoVendaRS := 0;

  NrDiasCompraSC := StrToIntDef(_edtNrdiasCompraSC.Text, 0);
  NrDiasCompraRS := StrToIntDef(_edtNrdiasCompraRS.Text, 0);

  nrVerbaInicio := StrToIntDef(_edtNrVerbaInicio.Text, 0);
  if (_chkUltimoDesconto.Checked) and (nrVerbaInicio = 0) then
  begin
    if Confirma('Sem Nr. de Verba para direcional o Desconto Adicional!!!+'#13 +
      'Deseja Direcionar para verba?', MB_DEFBUTTON1) = IDYES then
    begin
      _edtNrVerbaInicio.SetFocus;
      exit;
    end;

  end;

  // if (NrDiasCompraSC>0) or (NrDiasCompraRS>0) then
  RecalculaSugestaodeCompraCD(idPedido);

  AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0, 4, '');
  AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0, 1, '');
  SetNomeCampoItemPedido;
  TotaisPedidoEmpresa := TotalizaPedidoEmpresa(NrPedidoSC, NrPedidoRS, 0, 'S');
  MostraTotaisPedido(NrPedidoRS, 4);
  MostraTotaisPedido(NrPedidoSC, 1);
  if AbreItemPrePedidoMultiEmpresa(NrPedidoSC, NrPedidoRS, 0, 0, 'N') then
    SetNomeCampoItemPrePedido;
  SetValoresPedidos;

end;

procedure T_frmCompras.BitBtn1Click(Sender: TObject);
begin
  MostraHistoricodePedidoRS(nrLaboratorioLocal, nrProduto, true);
  if _gbDadosCompras.Visible then
    // if _cedQtdadePedidoEmpresa.CanFocus then      _cedQtdadePedidoEmpresa.SetFocus;
end;

procedure T_frmCompras.BitBtn2Click(Sender: TObject);
begin
   EliminaItemQuantidadeZerada(NrPedidoSC);
   EliminaItemQuantidadeZerada(NrPedidoRS);
  if AtualizaStatusPedido('I') then
  begin
    ZeraItemAuditoria(NrAuditoriaSC);
    ZeraItemAuditoria(NrAuditoriaRS);
  end;
end;

procedure T_frmCompras.BitBtn3Click(Sender: TObject);
begin
  MostraHistoricodePedidoSC(nrLaboratorioLocal, nrProduto, true);
  // if _gbDadosCompras.Visible then
  // if _cedQtdadePedidoEmpresa.CanFocus then        _cedQtdadePedidoEmpresa.SetFocus;
end;

procedure T_frmCompras.Bitbtn4Click(Sender: TObject);
begin
  if idMostraGrafico = 0 then
  begin
    inc(idMostraGrafico);
    PreparaGraficoHistorico(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
      nrLaboratorioLocal, nrProduto);
    SetFocuCursor(IdPosicaoCursor);
  end
  else
  begin
    MontaGraficoVenda;

  end;

end;

procedure T_frmCompras._btnConfirmaPedidoClick(Sender: TObject);
begin
  nrPedidoFimSC := NrPedidoSC;
  nrAuditoriaSCFim := NrAuditoriaSC;
  nrAuditoriaRSFim := NrAuditoriaRS;
  nrPedidoFimRS := NrPedidoRS;
  nrDiasPrazo := nrPrazoPedido;
  nrDiasAjusteFim := nrDiasFrequencia;
  vlSugeridoSCFim := vlSugeridoSC;
  vlSugeridoRSFim := vlSugeridoRSFim;
  nrUNidadesSugeridaSCFim := nrUnidadesSugeridaSC;
  NrUnidadesSugeridaRSFim := nrUnidadesSugeridaRS;
  nrOperadorLogisticoFim := cdoperadorLogisticoPedido;
  nrCompradorPedidoFIM := nrCompradorPedido;
  nrLaboratorioFIM := nrLaboratorioLocal;
  dtProximaAgendaFim := dtProximaAgenda + nrDiasFrequencia;
  dtAgendafim := dtProximaAgenda;
  idAtualizaAgendaFim := idAtualizaAgenda;
  PedidoBonificado := idPedidoBonificado;
  PnrLeadTime := nrLeadTime;
  _frmConfirmaPedido := T_frmConfirmaPedido.Create(self);
  _frmConfirmaPedido.ShowModal;
  if idPedidoFechado then
  begin
    NrPedidoSC := 0;
    NrPedidoRS := 0;
    close;
  end;
end;

procedure T_frmCompras.BitBtn6Click(Sender: TObject);
begin
  if _dtpProximaAgenda.Date < dtSistema then
  begin
    Mensagem('Data Informada Menor que data Atual', 64);
    exit;
  end;

  SetDataAgenda(nrLaboratorioLocal, _dtpProximaAgenda.Date,
    _dtpProximaAgenda.Date + nrDiasFrequencia);

  // Alterando Capa Auditoria Pedido SC
  if NrAuditoriaSC > 0 then
    AlteraAuditoria(NrAuditoriaSC, // nrcdAuditoria,
      nrFornecedorLocal, // PnrFornecedor:Integer;
      _dtpProximaAgenda.Date, // PdtAgendaAtual:TDate;
      nrUnidadesCompradaSC, // PqtComprada:Integer;
      vlCompradoSC, // PvlComprado:Double;
      'Agenda Alterada Pelo Usuario', // PDS_JUSTIFICATIVA:String;
      cdPrazoPagamentoAudititoria // _PRAZO_ATUAL:Integer
      );
  // Alterando Capa Auditoria Pedido SC
  if NrAuditoriaRS > 0 then

    AlteraAuditoria(NrAuditoriaRS, // nrcdAuditoria,
      nrFornecedorLocal, // PnrFornecedor:Integer;
      _dtpProximaAgenda.Date, // PdtAgendaAtual:TDate;
      nrUnidadesCompradaRS, // PqtComprada:Integer;
      vlCompradoRS, // PvlComprado:Double;
      'Agenda Alterada Pelo Usuario', // PDS_JUSTIFICATIVA:String;
      cdPrazoPagamentoAudititoria // _PRAZO_ATUAL:Integer
      );

  close;
end;

procedure T_frmCompras.BitBtn7Click(Sender: TObject);
begin
  // PreparaGraficoHistorico(nrEmpresa, nrLaboratorio, nrProduto);
  nrPedidoDividir := nrPedidoTelaCompra;
  Application.CreateForm(T_frmDivisaoDePedido, _frmDivisaoDePedido);
  FormPos(_frmDivisaoDePedido, 1, 1);
  _frmDivisaoDePedido.ShowModal;
  // close;

end;

procedure T_frmCompras._btnImprimirRSClick(Sender: TObject);
var
  idPrecoCusto, idMostraDesconto: Char;
begin
  idPrecoCusto := 'N';
  if _chkRelatorioPrecoCustoSC.Checked then
    idPrecoCusto := 'S';

  idMostraDesconto := 'N';
  if _chkMostraDescontoSC.Checked then
    idMostraDesconto := 'S';
  Imprimir(NrPedidoRS, idPrecoCusto, idMostraDesconto);
end;

procedure T_frmCompras._chtVendasSCClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  stValor: String[3];
begin
  stValor := Series1.XLabel[ValueIndex];
  if stValor = 'JAN' then
  begin
    if idMesSelecionado[01] = 'S' then
      idMesSelecionado[01] := 'N'
    else
      idMesSelecionado[01] := 'S';
  end;
  if stValor = 'FEV' then
  begin
    if idMesSelecionado[02] = 'S' then
      idMesSelecionado[02] := 'N'
    else
      idMesSelecionado[02] := 'S';
  end;
  if stValor = 'MAR' then
  begin
    if idMesSelecionado[03] = 'S' then
      idMesSelecionado[03] := 'N'
    else
      idMesSelecionado[03] := 'S';
  end;
  if stValor = 'ABR' then
  begin
    if idMesSelecionado[04] = 'S' then
      idMesSelecionado[04] := 'N'
    else
      idMesSelecionado[04] := 'S';
  end;
  if stValor = 'MAI' then
  begin
    if idMesSelecionado[05] = 'S' then
      idMesSelecionado[05] := 'N'
    else
      idMesSelecionado[05] := 'S';
  end;
  if stValor = 'JUN' then
  begin
    if idMesSelecionado[06] = 'S' then
      idMesSelecionado[06] := 'N'
    else
      idMesSelecionado[06] := 'S';
  end;
  if stValor = 'JUL' then
  begin
    if idMesSelecionado[07] = 'S' then
      idMesSelecionado[07] := 'N'
    else
      idMesSelecionado[07] := 'S';
  end;
  if stValor = 'AGO' then
  begin
    if idMesSelecionado[08] = 'S' then
      idMesSelecionado[08] := 'N'
    else
      idMesSelecionado[08] := 'S';
  end;
  if stValor = 'SET' then
  begin
    if idMesSelecionado[09] = 'S' then
      idMesSelecionado[09] := 'N'
    else
      idMesSelecionado[09] := 'S';
  end;
  if stValor = 'OUT' then
  begin
    if idMesSelecionado[10] = 'S' then
      idMesSelecionado[10] := 'N'
    else
      idMesSelecionado[10] := 'S';
  end;
  if stValor = 'NOV' then
  begin
    if idMesSelecionado[11] = 'S' then
      idMesSelecionado[11] := 'N'
    else
      idMesSelecionado[11] := 'S';
  end;
  if stValor = 'DEZ' then
  begin
    if idMesSelecionado[12] = 'S' then
      idMesSelecionado[12] := 'N'
    else
      idMesSelecionado[12] := 'S';
  end;
  if stValor = 'ATU' then
  begin
    if idMesSelecionado[13] = 'S' then
      idMesSelecionado[13] := 'N'
    else
      idMesSelecionado[13] := 'S';
  end;
  // MontaGraficodeVendas(_cdsProduto.FieldByName('NROM_M').AsInteger);
  MontaGraficoVenda;

end;

procedure T_frmCompras.MostraDaDosCalculo;
var
  Buffer: Pchar;
  vlDiasCoberturaEstoque, vlDiasCoberturaEstoquePendencia,
    vlSusgestaoIdeal: Double;
  vlSusgestaoPossivel, nrQtdadeEstoque, nrQtadeEmbalagemCompra,
    nrQtadeCamadaEmbalagem, size: Integer;
  nrDiasDiv: Double;
  DadosSugestao: TDadosQtdadeSugestao;
begin
  _lbeMedia.Text := FormatFloat('###,###,##0', 0);
  vlMediaMesSC := 0;
  vlMediaMesRS := 0;
  // vlMediaDia := 0;
  _lbeDiasEstoqueEmpresa.Clear;
  { if nrUnidadesMesesSelecionados > 0 then
    begin
    nrDiasDiv:=nrDiasSelecionados - nrDiasEstoqueZeroSelecionados;
    if nrDiasDiv>0 then
    vlMediaDia := nrUnidadesMesesSelecionados /nrDiasDiv;
    if nrDiasDiv<=0 then
    vlMediaDia := nrUnidadesMesesSelecionados /30;

    if nrMesesSelecionados > 0 then
    vlMediaMesSC := (vlMediaDia * nrDiasSelecionados) / nrMesesSelecionados;
    end; }
  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
  _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

  // Mercadoria := GetMercadoriaNova(nrProduto, nrDigitoPreco, 0, _nrEmpresa, cdoperadorLogisticoPedido);
  Mercadoria := DadosProdutos(nrProduto, _nrEmpresa, cdoperadorLogisticoPedido);
  // MercadoriaEstoque := GetEstoque(nrProduto, 1);

  pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
  nrGeracaoVerba := Mercadoria.nrGeracaoVerba;
  nrQtdadeEstoque := 0;
  nrQtdadeEstoque := Mercadoria.qtEstoque;
  // nrProduto            := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrQuantidadeEstoque := nrQtdadeEstoque;
  _lbeMedia.Text := FormatFloat('###,###,##0', nrUnidadesMesesSelecionados) +
    '/' + '(' + FormatFloat('##0', nrDiasSelecionados) + '-' +
    FormatFloat('##0', nrDiasEstoqueZeroSelecionados) + ')=' +
    FormatFloat('###,##0.00', vlMediaDia);

  _lbeMediaMensalSC.Text := FormatFloat('###,###,##0', vlMediaMesSC);

  _lbePendenciaSC.Text := FormatFloat('###,###,##0', qtPendenteItem);

  _lbeVendaMensalSC.Text := FormatFloat('###,###,##0', qtVendaMes[13]);

  _lbeEstoqueSC.Text := FormatFloat('###,###,##0', nrQtdadeEstoque);

  vlDiasCoberturaEstoque := CoberturaEstoqueDia(nrQtdadeEstoque, 0, vlMediaDia);

  nrQtadeEmbalagemCompra := Mercadoria.qtEmbalagemCompra;
  // nrQtadeEmbalagemCompra := GetQuantidadeEmbalagem(nrProduto);

  // nrQtadeEmbalagemPalete := _cdsProduto.FieldByName('QT_CXA_PALETE').AsInteger;
  nrQtadeCamadaEmbalagem := Mercadoria.qtdCaixaCamada;

  vlDiasCoberturaEstoquePendencia := CoberturaEstoqueDia(nrQtdadeEstoque,
    qtPendenteItem, vlMediaDia);
  _lbeCoberturaEstoqueSC.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoque);

  _LbeCoberturaEstoquePendenciaSC.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoquePendencia);
  PintaCampoCoberturaEstoqueSC(StrToIntDef(FormatFloat('0000000',
    vlDiasCoberturaEstoque), 0), qtEstoqueMaximo);

  PintaCampoCoberturaEstoquePendenciaSC
    (StrToIntDef(FormatFloat('0000000', vlDiasCoberturaEstoquePendencia), 0),
    qtEstoqueMaximo);
  DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque, nrDiasAntecipacao,
                                       nrLeadTime,
                                       vlMediaDia,
                                       nrQtdadeEstoque,
                                       qtPendenteItem);
  vlSusgestaoIdeal := DadosSugestao.nrQtdSugerida;

  SetCamposSugestaoIdeal(vlSusgestaoIdeal, 0);
  (*
  *)
  GetIndiceFaltaAnterior(nrProduto, _nrEmpresa);
  GetIndiceFaltaAtual(nrProduto, _nrEmpresa);

  vlPrecoVenda := Mercadoria.vlPrecoCadastro;
  // _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat;
  vlSusgestaoPossivel := 0;
  if nrQtadeEmbalagemCompra > 0 then
    vlSusgestaoPossivel := strtoint(FormatFloat('########0', vlSusgestaoIdeal /
                                                              nrQtadeEmbalagemCompra));

  nrUnidadesPossivel := strtoint(FormatFloat('########0', vlSusgestaoPossivel));

  vlSusgestaoPossivel := vlSusgestaoPossivel * nrQtadeEmbalagemCompra;
  nrSusgestaoPossivel := vlSusgestaoPossivel;
  // _lbeQtadePedido.Text := FormatFloat('###,###,##0', vlSusgestaoPossivel);
  SetCamposQuantidaPedido(vlSusgestaoPossivel, 0);
  // _cedQtdadePedidoEmpresa.Value := vlSusgestaoPossivel;
  SetCamposSugestaoPossivel(vlSusgestaoPossivel, 0);

  // _lbeQtadePedido.SelStart := _lbeQtadePedido.SelLength;
  // if vlSusgestaoPossivel > 0 then
  // if _cedQtdadePedidoEmpresa.CanFocus then
  // _cedQtdadePedidoEmpresa.SetFocus;
  // pcDescontoADicional := StrToFloatDef(_lbeDescontoAdicional.Text, 0);
  idTipoLista := Mercadoria.idTipoListaFiscal;;
  idSuperfluo := Mercadoria.idSuperfulo;
  pcAliquotaIcms := Mercadoria.pcCreditoICMS;
  pcAliquotaIcms := _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat;

  CalculoPreco := CalculaPrecoLiquido(vlPrecoLista, vlPrecoVenda,
    pcDescontoRepasse, pcDescontoPadrao, pcDescontoADicional, pcAliquotaIcms,
    Mercadoria.pcIpiProduto, 0, 0, nrQuantidadeComprada, 0, 'N',
    idForcaRepasse[1], idIpiLiquidoComRepasse[1], idIpiLiquidoSemRepasse[1],
    idIpiBrutoComRepasse[1], idIpiBrutoSemRepasse[1], idTipoLista[1],
    idUnidadeFederacao, idSuperfluo, idIcmDestacado, idReduzIcms, idPisConfins);
  MostraPreco;
  _tbsCompras1.Refresh;

  SetCamposCaixaCamadaPaleteSC;
  SetCamposCaixaCamadaPaleteRS;
  SetCamposCaixaCamadaEmpresa;
  SetCorEstoqueSC;
  SetCorEstoqueRS;
  // Mostrando Dados doa Item COmprados
  if _cdsitemPedido.Active then
  begin
    if _cdsitemPedido.Locate('NROM_Y', nrProduto, []) then
    begin
      // _lbeQtadePedido.Text:=FormatFloat('########0',_cdsitemPedido.FieldByName('QUAY_Y').AsInteger);
      // _cedQtdadePedidoEmpresa.Value := _cdsitemPedido.FieldByName('QUAY_Y').AsInteger;
      setFocusQuantidadeCompras;

    end;
  end;
  setFocusQuantidadeCompras;
end;

procedure T_frmCompras.MostraDaDosCalculoGrid;
var
  Buffer: Pchar;
  vlDiasCoberturaEstoque, vlDiasCoberturaEstoquePendencia, vlSusgestaoIdeal,
    nrDiasUltimacompra: Double;
  vlSusgestaoPossivel, nrQtdadeEstoque, nrQtadeEmbalagemCompra,
    nrQtadeCamadaEmbalagem, nrEmpresa, size, qtPedida: Integer;
  DadosItemPedido: TDadosItemPedido;
  dtUltimaCompra: tdate;
  vlMediaAntiga: Double;
  vlPeLocal, QtdCamada, nrQuantidadeRejeitada: Integer;
  QtdPalete: Integer;
  DadosSugestao: TDadosQtdadeSugestao;
  idTermoLabil: String[1];
   MesLocal:Integer;
  stMes,stAno :String;

begin
  _lbeMedia.Text := FormatFloat('###,###,##0', 0);
  // vlMediaMesSC := 0;
  vlMediaMesRS := 0;
  // vlMediaDia := 0;
  _lbeDiasEstoqueEmpresa.Clear;
  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
  nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  QtdCamada := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  QtdPalete := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
  idTermoLabil := _cdsProduto.FieldByName('ID_REFRIGERADO').AsString;


  FreeAndNil(DadosItemPedido);

  if nrEmpresa = 1 then
    vlPeLocal := NrDiasCompraSC;
  if nrEmpresa = 4 then
    vlPeLocal := NrDiasCompraRS;

  setParamentroCompra(vlPeLocal, _cdsProduto.FieldByName('ID_CURVA_MERCADORIA')
    .AsString[1]);

  { Mercadoria:=GetMercadoriaNova(_cdsGradeProdutoNR_MERCADORIA.AsInteger,
    _cdsGradeProdutoNR_DIGITO_MERCADORIA.AsInteger,
    0,
    _cdsGradeProdutoCD_EMPRESA.AsInteger); }
  if _chkMostaIndiceFalta.Checked then
  begin
    _stbCompras.Panels[1].Text :=
      'Abrindo Indice de Falta Anterior do Laborat?rio';
    _stbCompras.Refresh;
    AbreIndiceFaltaAnterior(nrLaboratorioLocal, nrProduto);
    _stbCompras.Panels[1].Text :=
      'Abrindo Indice de Falta Atual do Laborat?rio';
    _stbCompras.Refresh;
    AbreIndiceFaltaAtual(nrLaboratorioLocal, nrProduto);
  end;

  // dtUltimaCompra := DataUltimaCompra(nrProduto, cdoperadorLogisticoPedido,nrEmpresa);
  dtUltimaCompra := GetUltimaCompra(nrProduto, _nrEmpresa,
    cdoperadorLogisticoPedido);

  nrDiasUltimacompra := dtSistema - dtUltimaCompra;
  nrQtdadeEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  nrQtdadeEstoque := 0;
  Mercadoria := DadosProdutos(nrProduto, _nrEmpresa, cdoperadorLogisticoPedido);

  nrQtdadeEstoque := Mercadoria.qtEstoque;
  vlMediaAntiga := 0;
  if nrDiasSelecionados - nrDiasEstoqueZeroSelecionados > 0 then
    vlMediaAntiga := nrUnidadesMesesSelecionados /
      (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados);

  // FiltraProdutoEmpresa(nrProduto, nrEmpresa);
  // nrProduto            := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrQuantidadeEstoque := nrQtdadeEstoque;
  _lbeMediaGrid.Text := FormatFloat('###,###,##0', nrUnidadesMesesSelecionados)
    + '/' + '(' + FormatFloat('##0', nrDiasSelecionados) + '-' +
    FormatFloat('##0', nrDiasEstoqueZeroSelecionados) + ')=' +
    FormatFloat('###,##0.00', vlMediaAntiga);

  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);

  SetCorPendencia(DadosPendencia.qtPedido, DadosPendencia.QtPendente,
    DadosPendencia.qtAtendida, DadosPendencia.qtProcessada);
  qtPendenteItem := DadosPendencia.QtPendente;

  SetCamposCaixaCamadaPaleteGrid;

  _lbeUltimaEntradaGrid.Text := FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_ULTIMA_ENTRADA').AsDateTime);
  // Mercadoria.dtUltimaEntrada);
  _lbeUltimaSaidaGrid.Text := FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_ULTIMA_SAIDA').AsDateTime);
  // Mercadoria.dtUltimaSaida);

  _lbeMediaMensalGrid.Text := FormatFloat('###,###,##0', vlMediaMesSC);
  _lbeMediaMensalSC.Text := FormatFloat('###,###,##0', vlMediaMesSC);
  _lbePendenciaGrid.Text := FormatFloat('###,###,##0', qtPendenteItem);
  _lbePendenciaSC.Text := FormatFloat('###,###,##0', qtPendenteItem);

  _lbeVendaMensalGrid.Text := FormatFloat('###,###,##0', qtVendaMes[13]);
  _lbeVendaMensalSC.Text := FormatFloat('###,###,##0', qtVendaMes[13]);

  _lbeEstoqueGrid.Text := FormatFloat('###,###,##0', nrQtdadeEstoque);
  _lbeEstoqueSC.Text := FormatFloat('###,###,##0', nrQtdadeEstoque);

  vlDiasCoberturaEstoque := CoberturaEstoqueDia(nrQtdadeEstoque, 0, vlMediaDia);

  nrQtadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
    .AsInteger;
  nrQtadeCamadaEmbalagem := _cdsProduto.FieldByName('QT_CAIXA_CAMADA')
    .AsInteger;

  vlDiasCoberturaEstoquePendencia := CoberturaEstoqueDia(nrQtdadeEstoque,
    qtPendenteItem, vlMediaDia);

  // Mercadoria.dtUltimaEntrada););
  _lbeCoberturaEstoqueSC.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoque);
  nrDiasCoberturaEstoqueAuditoria :=
    StrToIntDef(FormatFloat('0000', vlDiasCoberturaEstoque), 0);
  _lbeCoberturaGrid.Text := FormatFloat('###,###,##0', vlDiasCoberturaEstoque);
  _lbeCoberturaEstoquePend_Grid.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoquePendencia);

  _LbeCoberturaEstoquePendenciaSC.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoquePendencia);
  PintaCampoCoberturaEstoqueSC(StrToIntDef(FormatFloat('0000000',
    vlDiasCoberturaEstoque), 0), qtEstoqueMaximo);

  PintaCampoCoberturaEstoqueGrid(StrToIntDef(FormatFloat('0000000',
    vlDiasCoberturaEstoque), 0), qtEstoqueMaximo);
  PintaCampoCoberturaEstoquePendenciaGrid
    (StrToIntDef(FormatFloat('0000000', vlDiasCoberturaEstoquePendencia), 0),
    qtEstoqueMaximo);

  PintaCampoCoberturaEstoquePendenciaSC
    (StrToIntDef(FormatFloat('0000000', vlDiasCoberturaEstoquePendencia), 0),
    qtEstoqueMaximo);

  nrLeadTime := SetLeadTime(nrEmpresa, idTermoLabil);
  DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque, nrDiasAntecipacao,
    nrLeadTime, vlMediaDia, nrQtdadeEstoque, qtPendenteItem);

  vlSusgestaoIdeal := DadosSugestao.nrQtdSugeridaRejeitada;

  _nrEmpresa := nrEmpresa;
  SetCamposSugestaoIdeal(vlSusgestaoIdeal, 0);
  (*
  *)
  GetIndiceFaltaAnterior(nrProduto, _nrEmpresa);
  GetIndiceFaltaAtual(nrProduto, _nrEmpresa);

  // vlPrecoVenda := Mercadoria.vlPrecoCadastro;
  vlSusgestaoPossivel := 0;
  if nrQtadeEmbalagemCompra > 0 then
    vlSusgestaoPossivel :=
      strtoint(FormatFloat('########0', vlSusgestaoIdeal /
      nrQtadeEmbalagemCompra));

  vlSusgestaoPossivel := vlSusgestaoPossivel * nrQtadeEmbalagemCompra;
  nrSusgestaoPossivel := vlSusgestaoPossivel;
  // _lbeQtadePedido.Text := FormatFloat('###,###,##0', vlSusgestaoPossivel);
  SetCamposQuantidaPedido(vlSusgestaoPossivel, 0);
  SetCamposSugestaoIdealGrid(vlSusgestaoIdeal, vlSusgestaoPossivel);

  if nrSusgestaoPossivel > 0 then

   { DadosSugestao := SetQuantidadePaleteCamada(nrSusgestaoPossivel,
      // PqtPedido,
      nrQtadeEmbalagemCompra, // PqtEmbalagem,
      QtdCamada, // PqtCamada,
      QtdPalete, // PqtPalete,
      nrParamentoEstoque + nrLeadTime, // PDiasEstoque: Integer;
      nrQtdadeEstoque + qtPendenteItem, vlMediaDia, // PvlMediaDia:Double
      0,0,_cdsProduto.FieldByName('ID_CURVA_MERCADORIA') .AsString[1]);}

  if (DadosSugestao.nrQtdSugerida = 0) and
    (DadosSugestao.nrQtdSugeridaRejeitada > 0) then
  begin
    nrQuantidadeRejeitada :=
      StrToIntDef(FormatFloat('0000000', vlSusgestaoPossivel), 0);
    vlSusgestaoPossivel := 0;
  end;

  // _cedQtdadePedidoEmpresa.Value := vlSusgestaoPossivel;
  SetCamposSugestaoPossivel(vlSusgestaoPossivel, 0);

  // _lbeQtadePedido.SelStart := _lbeQtadePedido.SelLength;
  // if vlSusgestaoPossivel > 0 then
  // if _cedQtdadePedidoEmpresa.CanFocus then
  // _cedQtdadePedidoEmpresa.SetFocus;

  /// pcDescontoAdicional := StrToFloatDef(_lbeDescontoAdicional.Text, 0);
  ///
  ///
  SetCoresCaixaCamadaPalete(vlSusgestaoPossivel,
    _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger,
    // Mercadoria.qtEmbalagemCompra,
    _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger,
    // Mercadoria.qtdCaixaCamada,
    _cdsProduto.FieldByName('QT_CAIXA_PALETE')
    .AsInteger { Mercadoria.qtdCaixaPalete }
    );

  MostraPreco;
  _tbsCompras1.Refresh;

  SetCamposCaixaCamadaPaleteSC;
  SetCamposCaixaCamadaPaleteRS;
  SetCamposCaixaCamadaEmpresa;
  SetCorEstoqueSC;
  SetCorEstoqueRS;
  // Mostrando Dados doa Item COmprados
  // if _cdsProduto.FieldByName('CD_EMPRESA').AsInteger = 1 then
  // DadosItemPedido := localizaItemPedido(NrPedidoSC, nrProduto, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  // if _cdsProduto.FieldByName('CD_EMPRESA').AsInteger = 4 then
  // DadosItemPedido := localizaItemPedido(NrPedidoRS, nrProduto,_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

  DadosItemPedido := PosicionaGrid(nrProduto, nrEmpresa);
  qtPedida := DadosItemPedido.nrQuantidadePedido;
  pcDescontoADicional := 0;
  if qtPedida > 0 then
    pcDescontoADicional := DadosItemPedido.pcDescontoADicional;

  PrecoItemSC := PrecoItem;

  vlPrecoLista := precoLista.vlPrecoLista;
  if precoLista.PcDescontoLista > 0 then
  begin
    pcDescontoADicional := precoLista.PcDescontoLista;
    nrVerbaDigitada := precoLista.nrVerba;
    nrVerba := precoLista.nrVerba;
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0', nrVerba);
  end;

  SetPrecoLocal;

  SetCorQuantidadePedido(0, 0);
  if qtPedida > 0 then

    SetCoresCaixaCamadaPalete(qtPedida,
      _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger,
      // Mercadoria.qtEmbalagemCompra,
      _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger,
      // Mercadoria.qtdCaixaCamada,
      _cdsProduto.FieldByName('QT_CAIXA_PALETE')
      .AsInteger { Mercadoria.qtdCaixaPalete }
      );

  _lbeQuantidadePedidoGrid.Text := FormatFloat('########0',  vlSusgestaoPossivel);
  if DadosItemPedido.nrVerba > 0 then
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0',    DadosItemPedido.nrVerba)
  else
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0', nrVerbaDigitada);

  _lbePcVerbaGrid.Text := FormatFloat('########0.00', DadosItemPedido.pcVerba);
  if qtPedida > 0 then
  begin
    if _chkSemDescontoAdicional.Checked then
      DadosItemPedido.pcDescontoADicional := 0;

    SetPrecoItem(nrprodutoPreco, nrDigitoPreco, nrEmpresa, 0,
      nrQuantidadeComprada, DadosItemPedido.nrVerba, 0,
      DadosItemPedido.pcDescontoPadrao, DadosItemPedido.pcDescontoADicional);

    // pcDescontoADicional := DadosItemPedido.pcDescontoADicional;
    SetPrecoLocal;
    SetCorQuantidadePedido(qtPedida, StrToIntDef(FormatFloat('########0',
      vlSusgestaoPossivel), 0));

    _lbeQuantidadePedidoGrid.Text := FormatFloat('########0', qtPedida);

    if vlMediaDia > 0 then
    begin
      nrDiasEstoque := StrToIntDef(FormatFloat('0000000000',
        (nrQuantidadeEstoque + qtPendenteItem + qtPedida) / vlMediaDia), 0);
      _lbeDiasEstoque.Text := FormatFloat('########0', nrDiasEstoque);
    end;

    setFocusQuantidadeCompras;

  end;
  // _lbeSugestaoPossivelGrid.SetFocus;
  setFocusQuantidadeCompras;
  // SetCompraGrade(nrProduto,nrEmpresa,vlSusgestaoPossivel);
  _lbeEstoqueGrid.Color := clWhite;
  _lbeEstoqueGrid.Font.Color := clBlack;
  _lbeEstoqueGrid.ShowHint := false;
  IF (Mercadoria.nrUnidadesVencidas > 0) OR (Mercadoria.nrUnidadeReservaPedido>0)
    or (Mercadoria.nrReservaProblematica > 0) then
  begin
    _lbeEstoqueGrid.ShowHint := true;
    _lbeEstoqueGrid.Color := clRed;
    _lbeEstoqueGrid.Font.Color := clWhite;
    _lbeEstoqueGrid.Hint := ('Estoque     = ' + FormatFloat('###,###,##0',
      Mercadoria.qtEstoque) + #13 + 'Res.Pedido  = ' +
      FormatFloat('###,###,##0', Mercadoria.nrUnidadeReservaPedido) + #13 +
      'Res.Vencido = ' + FormatFloat('###,###,##0',
      Mercadoria.nrUnidadesVencidas) + #13 + 'Res.Problem.= ' +
      FormatFloat('###,###,##0', Mercadoria.nrReservaProblematica));
  end;


end;

procedure T_frmCompras.MostraDaDosCalculoGridLeve;
var
  Buffer: Pchar;
  vlDiasCoberturaEstoque, vlDiasCoberturaEstoquePendencia,
    vlSusgestaoIdeal: Double;
  vlSusgestaoPossivel, nrQtdadeEstoque, nrQtadeEmbalagemCompra,
    nrQtadeCamadaEmbalagem, nrEmpresa, size: Integer;
  DadosSugestao: TDadosQtdadeSugestao;
begin

  vlMediaMesSC := 0;
  vlMediaMesRS := 0;
  vlMediaDia := 0;
  _lbeDiasEstoqueEmpresa.Clear;
  if nrUnidadesMesesSelecionados > 0 then
  begin
    vlMediaDia := nrUnidadesMesesSelecionados /
      (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados);
    if nrMesesSelecionados > 0 then
      vlMediaMesSC := (vlMediaDia * nrDiasSelecionados) / nrMesesSelecionados;
  end;
  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  // MercadoriaEstoque := GetEstoque(nrProduto, nrEmpresa);
  nrQtdadeEstoque := 0;
  Mercadoria := DadosProdutos(nrProduto, _nrEmpresa, cdoperadorLogisticoPedido);

  nrQtdadeEstoque := Mercadoria.qtEstoque;
  nrProduto := Mercadoria.nrProduto;
  nrQuantidadeEstoque := nrQtdadeEstoque;

  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);
  qtPendenteItem := DadosPendencia.QtPendente;

  SetCamposCaixaCamadaPaleteGrid;

  vlDiasCoberturaEstoque := CoberturaEstoqueDia(nrQtdadeEstoque, 0, vlMediaDia);

  nrQtadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
    .AsInteger;
  // nrQtadeEmbalagemCompra := GetQuantidadeEmbalagem(nrProduto);

  // nrQtadeEmbalagemPalete := _cdsProduto.FieldByName('QT_CXA_PALETE').AsInteger;
  nrQtadeCamadaEmbalagem := _cdsProduto.FieldByName('QT_CXA_CAMADA_LOGISTICO')
    .AsInteger;

  vlDiasCoberturaEstoquePendencia := CoberturaEstoqueDia(nrQtdadeEstoque,
    qtPendenteItem, vlMediaDia);

  DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque, nrDiasAntecipacao,
    nrLeadTime, vlMediaDia, nrQtdadeEstoque, qtPendenteItem);

  (*
  *)
  vlSusgestaoIdeal := DadosSugestao.nrQtdSugerida;
  vlPrecoVenda := _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat;
  vlSusgestaoPossivel := 0;
  if nrQtadeEmbalagemCompra > 0 then
    vlSusgestaoPossivel := strtoint(FormatFloat('########0', vlSusgestaoIdeal /
                           nrQtadeEmbalagemCompra));
  nrUnidadesPossivel := strtoint(FormatFloat('########0', vlSusgestaoPossivel));

  vlSusgestaoPossivel := vlSusgestaoPossivel * nrQtadeEmbalagemCompra;
  nrSusgestaoPossivel := vlSusgestaoPossivel;
  // _lbeQtadePedido.Text := FormatFloat('###,###,##0', vlSusgestaoPossivel);
  SetCamposQuantidaPedido(vlSusgestaoPossivel, 0);
  SetCamposSugestaoIdealGrid(vlSusgestaoIdeal, vlSusgestaoPossivel);

  // _cedQtdadePedidoEmpresa.Value := vlSusgestaoPossivel;
  qtPedidoLeve := StrToIntDef(FormatFloat('########0', vlSusgestaoPossivel), 0);
  // _lbeQtadePedido.SelStart := _lbeQtadePedido.SelLength;
  // if vlSusgestaoPossivel > 0 then
  // if _cedQtdadePedidoEmpresa.CanFocus then
  // _cedQtdadePedidoEmpresa.SetFocus;

  idTipoLista := _cdsProduto.FieldByName('ID_TIPO_LISTA_FISCAL').AsString;
  idSuperfluo := _cdsProduto.FieldByName('ID_SUPERFLUO').AsString;
  pcAliquotaIcms := _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat;
  // _lbeQuantidadePedidoGrid.Text :=FormatFloat('########0',vlSusgestaoPossivel);

end;

function T_frmCompras.CoberturaEstoqueDia(qtEstoque, qtPendencia: Integer;
  vlMediaDia: Double): Double;
begin
  try
    result := 0;
    if vlMediaDia > 0 then
      result := (qtEstoque + qtPendencia) / vlMediaDia
    else
      result := (qtEstoque + qtPendencia) / 1;
  except
    result := 0;
  end;
end;

procedure T_frmCompras._dbgEspecealidadeCellClick(Column: TColumn);
begin
  if _cdsEspecealidade.Active then
  begin
    FiltroEspecealidade(_cdsEspecealidade.FieldByName('NR_SEQUENCIAL')
      .AsInteger);
    // _chkFiltroAtivo.Checked:=true;
  end;
end;

procedure T_frmCompras._dbgEspecealidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(_cdsEspecealidade.RecNo) then
  begin
    // _dbgEspecealidade.Canvas.Font.Color:= clBlack;
    // _dbgEspecealidade.Canvas.Brush.Color:= clSkyBlue;
  end
  else
  begin
    // _dbgEspecealidade.Canvas.Font.Color:= clBlack;
    // _dbgEspecealidade.Canvas.Brush.Color:= clWhite;
  end;

  { if ((TAuxDBGrid(_dbgEspecealidade).DataLink.ActiveRecord + 1 =
    TAuxDBGrid(_dbgEspecealidade).Row) or (gdSelected in State)) then
    begin
    _dbgEspecealidade.Canvas.Brush.Color := clGreen;
    _dbgEspecealidade.Canvas.Font.Style := _dbgEspecealidade.Canvas.Font.Style + [fsBold];
    _dbgEspecealidade.Canvas.Font.Color := clWHITE;
    end;
    _dbgEspecealidade.Canvas.fillRect(rect);
    _dbgEspecealidade.defaultDrawColumncell(rect,Datacol,column,state); }

end;

function T_frmCompras.CalculodeExcesso(nrCoberturaEstoque, nrParamentroCompra,
  vlMedia: Double): Double;
begin
  try
    result := 0;
    if vlMedia > 0 then
      result := (nrCoberturaEstoque - nrParamentroCompra) * vlMedia;
    if result < 0 then
      result := 0;

  except
    result := 0;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoqueEmpresa(nrDiasCoberturaEstoque,
  vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueEmpresa.Font.Color := clWhite;
    _lbeCoberturaEstoqueEmpresa.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _lbeCoberturaEstoqueEmpresa.Font.Color := clWhite;
    _lbeCoberturaEstoqueEmpresa.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueEmpresa.Font.Color := clWhite;
    _lbeCoberturaEstoqueEmpresa.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoquePendenciaEmpresa
  (nrDiasCoberturaEstoque, vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _LbeCoberturaEstoquePendenciaEmpresa.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaEmpresa.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _LbeCoberturaEstoquePendenciaEmpresa.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaEmpresa.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _LbeCoberturaEstoquePendenciaEmpresa.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaEmpresa.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoqueGrid(nrDiasCoberturaEstoque,
  vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _lbeCoberturaGrid.Font.Color := clWhite;
    _lbeCoberturaGrid.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _lbeCoberturaGrid.Font.Color := clWhite;
    _lbeCoberturaGrid.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _lbeCoberturaGrid.Font.Color := clWhite;
    _lbeCoberturaGrid.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoquePendenciaGrid
  (nrDiasCoberturaEstoque, vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _lbeCoberturaEstoquePend_Grid.Font.Color := clWhite;
    _lbeCoberturaEstoquePend_Grid.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _lbeCoberturaEstoquePend_Grid.Font.Color := clWhite;
    _lbeCoberturaEstoquePend_Grid.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _lbeCoberturaEstoquePend_Grid.Font.Color := clWhite;
    _lbeCoberturaEstoquePend_Grid.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoqueSC(nrDiasCoberturaEstoque,
  vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueSC.Font.Color := clWhite;
    _lbeCoberturaEstoqueSC.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _lbeCoberturaEstoqueSC.Font.Color := clWhite;
    _lbeCoberturaEstoqueSC.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueSC.Font.Color := clWhite;
    _lbeCoberturaEstoqueSC.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoqueCDOposto
  (nrDiasCoberturaEstoque, vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueCDOposto.Font.Color := clWhite;
    _lbeCoberturaEstoqueCDOposto.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _lbeCoberturaEstoqueCDOposto.Font.Color := clWhite;
    _lbeCoberturaEstoqueCDOposto.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueCDOposto.Font.Color := clWhite;
    _lbeCoberturaEstoqueCDOposto.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoqueRS(nrDiasCoberturaEstoque,
  vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueRS.Font.Color := clWhite;
    _lbeCoberturaEstoqueRS.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _lbeCoberturaEstoqueRS.Font.Color := clWhite;
    _lbeCoberturaEstoqueRS.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _lbeCoberturaEstoqueRS.Font.Color := clWhite;
    _lbeCoberturaEstoqueRS.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoquePendenciaSC
  (nrDiasCoberturaEstoque, vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _LbeCoberturaEstoquePendenciaSC.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaSC.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _LbeCoberturaEstoquePendenciaSC.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaSC.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _LbeCoberturaEstoquePendenciaSC.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaSC.Color := clBlue;
  end;
end;

procedure T_frmCompras.PintaCampoCoberturaEstoquePendenciaCDOposto
  (nrDiasCoberturaEstoque, vlParamentoCompra: Double);
begin
  if nrDiasCoberturaEstoque > vlParamentoCompra then
  begin
    _LbeCoberturaEstoquePendenciaCDOposto.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaCDOposto.Color := clRed;
  end;
  if (nrDiasCoberturaEstoque >= (vlParamentoCompra - qtDiasFrequenciaCompras))
    and (nrDiasCoberturaEstoque <= (vlParamentoCompra +
    qtDiasFrequenciaCompras)) then
  begin
    _LbeCoberturaEstoquePendenciaCDOposto.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaCDOposto.Color := clGreen;
  end;
  if nrDiasCoberturaEstoque < vlParamentoCompra then
  begin
    _LbeCoberturaEstoquePendenciaCDOposto.Font.Color := clWhite;
    _LbeCoberturaEstoquePendenciaCDOposto.Color := clBlue;
  end;
end;

function T_frmCompras.SetIndiceAnterior(PnrProduto, PnrCD: Integer): Integer;
begin
  result := 0;
  if _cdsIndiceFaltaAnterior.Active then
  begin
    if _cdsIndiceFaltaAnterior.Locate('NROM_E;CD_EMPRESA',
      VarArrayOf([PnrProduto, PnrCD]), []) then
      result := _cdsIndiceFaltaAnterior.FieldByName('NR_OCORRENCIA').AsInteger;
  end;
end;

function T_frmCompras.SetIndiceAtual(PnrProduto, PnrCD: Integer): Integer;
begin
  result := 0;
  if _cdsIndiceFaltaAtual.Active then
  begin
    if _cdsIndiceFaltaAtual.Locate('NROM_E;CD_EMPRESA',
      VarArrayOf([PnrProduto, PnrCD]), []) then
      result := _cdsIndiceFaltaAtual.FieldByName('NR_OCORRENCIA').AsInteger;
  end;
end;

procedure T_frmCompras.GetIndiceFaltaAnterior(PnrProduto, PnrCD: Integer);
var
  vlIndice,
  mes: Integer;
begin

  mes := MonthOf(IncMonth(dtPedido,-1));
  vlIndice :=   SetIndiceFalta(mes,PnrProduto, PnrCD);
  _gaIndiceFaltaAnterior.MaxValue := 100;
  if (vlIndice) <= 15 then
  begin
    _gaIndiceFaltaAnterior.Progress := vlIndice;
    _gaIndiceFaltaAnterior.ForeColor := clGreen;
  end;
  if ((vlIndice) > 15) and ((vlIndice) <= 50) then
  begin
    _gaIndiceFaltaAnterior.Progress := vlIndice;
    _gaIndiceFaltaAnterior.ForeColor := clYellow;
  end;
  if (vlIndice) > 50 then
  begin
    _gaIndiceFaltaAnterior.Progress := vlIndice;
    _gaIndiceFaltaAnterior.ForeColor := clRed;
  end;

end;

procedure T_frmCompras.GetIndiceFaltaAtual(PnrProduto, PnrCD: Integer);
var
  vlIndice,
  mes: Integer;
begin

  mes := MonthOf(IncMonth(dtPedido,0));
  vlIndice :=   SetIndiceFalta(mes,PnrProduto, PnrCD);
  _gaIndiceFaltaAtual.MaxValue := 100;
  if (vlIndice) <= 15 then
  begin
    _gaIndiceFaltaAtual.Progress := vlIndice;
    _gaIndiceFaltaAtual.ForeColor := clGreen;
  end;
  if ((vlIndice) > 15) and ((vlIndice) <= 50) then
  begin
    _gaIndiceFaltaAtual.Progress := vlIndice;
    _gaIndiceFaltaAtual.ForeColor := clYellow;
  end;
  if (vlIndice) > 50 then
  begin
    _gaIndiceFaltaAtual.Progress := vlIndice;
    _gaIndiceFaltaAtual.ForeColor := clRed;
  end;
  _gaIndiceFaltaAtual.Refresh;

end;

procedure T_frmCompras.setParamentroCompra(PnrDiasEstoque: Integer;
  idCurva: Char);
var
  vlTempo: Integer;
begin
  try
    if trim(idCurva) = '' then
      idCurva := 'A';
    with _cdsParamentoCompra do
    begin
      filter := 'ID_CURVA_MERCADORIA=' + QuotedStr(idCurva);
      filtered := true;
    end;
    qtEstoqueMaximo := 0;
    qtEstoqueMinimo := 0;
    qtDiasFrequenciaCompras := 0;
    nrParamentoEstoque := 28;
    if not _cdsParamentoCompra.isEmpty then
    begin
      qtEstoqueMaximo    := _cdsParamentoCompra.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger;
      qtEstoqueMinimo    := _cdsParamentoCompra.FieldByName('QT_ESTOQUE_MINIMO').AsInteger;
      vlFrequenciaCompra := _cdsParamentoCompra.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsFloat;
      _lbeCoberturaGrid.Text := _cdsParamentoCompra.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsString;
      vlTempo := StrToIntDef(FormatFloat('###0', vlFrequenciaCompra * 3), 0);
      nrParamentoEstoque := qtEstoqueMaximo;

    end;
    if PnrDiasEstoque > 0 then
      nrParamentoEstoque := PnrDiasEstoque;

  except
    on E: Exception do
    begin
      trataerro(E.Message, 'Erro ao Acessar Para paramentro de Compra...');
    end;

  end;
end;

procedure T_frmCompras.setParamentroItemCurvaCompra(PnrEmpresa,
  PnrDiasEstoque: Integer; idCurva: Char);
var
  vlTempo: Integer;
begin
  try
    if trim(idCurva) = '' then
      idCurva := 'A';
    // with _cdsItensCurva do
    // begin
    // filter := 'CD_EMPRESA;ID_CURVA_MERCADORIA=' + QuotedStr(idCurva);
    // filtered := true;
    // end;

    qtEstoqueMaximo := 0;
    qtEstoqueMinimo := 0;
    qtDiasFrequenciaCompras := 0;
    nrParamentoEstoque := 28;
    if _cdsItensCurva.Locate('CD_EMPRESA;ID_CURVA_MERCADORIA',
      VarArrayOf([PnrEmpresa, idCurva]), []) then
    // if not _cdsParamentoCompra.isEmpty then
    begin
      qtEstoqueMaximo := _cdsItensCurva.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger;
      qtEstoqueMinimo := _cdsItensCurva.FieldByName('QT_ESTOQUE_MINIMO').AsInteger;
      vlFrequenciaCompra := _cdsItensCurva.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsFloat;
      _lbeCoberturaGrid.Text := _cdsItensCurva.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsString;
      vlTempo := StrToIntDef(FormatFloat('###0', vlFrequenciaCompra * 3), 0);
      nrParamentoEstoque := qtEstoqueMaximo;

    end;
    if PnrDiasEstoque > 0 then
      nrParamentoEstoque := PnrDiasEstoque;

  except
    on E: Exception do
    begin
      trataerro(E.Message, 'Erro ao Acessar Para paramentro de Compra...');
    end;

  end;
end;

procedure T_frmCompras._btnImprimirClick(Sender: TObject);
var
  idPrecoCusto, idMostraDesconto: Char;
begin
  idPrecoCusto := 'N';
  if _chkRelatorioPrecoCustoRS.Checked then
    idPrecoCusto := 'S';

  idMostraDesconto := 'N';
  if _chkMostraDescontoRS.Checked then
    idMostraDesconto := 'S';
  Imprimir(NrPedidoSC, idPrecoCusto, idMostraDesconto);
end;

procedure T_frmCompras._cbxListaPrecoChange(Sender: TObject);
begin
  idprecoAtual := 'S';
  if _cbxListaPreco.ItemIndex = 1 then
    idprecoAtual := 'N';
end;

procedure T_frmCompras._cbxListaPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    vk_return:
      begin
        if not(ActiveControl is TDBGrid) then
          Perform(WM_NEXTDLGCTL, 0, 0)
        else if (ActiveControl is TDBGrid) then
        begin
          with TDBGrid(ActiveControl) do
            if selectedindex < (fieldcount - 1) then
              selectedindex := selectedindex + 1
            else
              selectedindex := 0;
        end;
      end;
  end;

end;

procedure T_frmCompras._cbxOpcaoCDsChange(Sender: TObject);
begin
  if _cbxOpcaoCDs.ItemIndex = 0 then
    idPedido := 0;
  if _cbxOpcaoCDs.ItemIndex = 1 then
    idPedido := 1;
  if _cbxOpcaoCDs.ItemIndex = 2 then
    idPedido := 4;
end;

procedure T_frmCompras._cbxOpcaoCDsEnter(Sender: TObject);
begin
  if _cbxOpcaoCDs.ItemIndex = 0 then
    idPedido := 0;
  if _cbxOpcaoCDs.ItemIndex = 1 then
    idPedido := 1;
  if _cbxOpcaoCDs.ItemIndex = 2 then
    idPedido := 4;

end;

procedure T_frmCompras._cbxOpcaoCDsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    vk_return:
      begin
        if not(ActiveControl is TDBGrid) then
          Perform(WM_NEXTDLGCTL, 0, 0)
        else if (ActiveControl is TDBGrid) then
        begin
          with TDBGrid(ActiveControl) do
            if selectedindex < (fieldcount - 1) then
              selectedindex := selectedindex + 1
            else
              selectedindex := 0;
        end;
      end;
  end;
end;

procedure T_frmCompras._cdsIndiceFaltaAtualAfterRefresh(DataSet: TDataSet);
var
  nrProd: Integer;
begin
  // nrProd := _cdsProduto.FieldByName('NR_MERCADORIA').AsInteger;
  // setPosicaoGrid(_cdsProduto.FieldByName('NR_MERCADORIA').AsInteger,
  // _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, idMovimentoProximo);

  // setPosicaoGrid(_cdsProdutoNR_MERCADORIANN.AsInteger);

end;

procedure T_frmCompras._cdsPrePedidoAfterRefresh(DataSet: TDataSet);
begin
  nrProduto := _cdsPrePedido.FieldByName('cd_mercadoria').AsInteger;
  cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;

end;

procedure T_frmCompras._cdsPrePedidoAfterScroll(DataSet: TDataSet);
begin
  cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
  nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
  cdProduto := _cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger;
  if idMovimentoProximo then
  begin
    idMovimentoProximo := false;
    LocalizaProduto(cdProduto, // cdGAM,
      cdEmpresaPedido, // PcdEmpresa: Integer;
      '', // cdfornecedor,
      ''); // nmProduto: String)}
  end;

end;

procedure T_frmCompras._cdsPrePedidoBeforeScroll(DataSet: TDataSet);
begin
  cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
  nrProduto := _cdsPrePedido.FieldByName('cd_mercadoria').AsInteger;

end;

procedure T_frmCompras._cedQtdadePedidoEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case Key of

    vk_return:
      begin
        // _nrQuantidadeComprada := StrToIntDef(StringReplace(_lbeQtadePedido.Text,
        // '.', '', [rfReplaceAll]), 0);
        // nrQuantidadeComprada :=StrToIntDef(FormatFloat('##############0',_cedQtdadePedidoEmpresa.Value), 0);
        if nrQuantidadeComprada = 0 then
          GravaItem(nrPedidoTelaCompra, _cdsProduto.FieldByName('CD_MERCADORIA')
            .AsInteger, nrQuantidadeComprada,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
        nrDiasEstoque := 0;
        if nrQuantidadeComprada > 0 then
        begin
          if vlMediaDia > 0 then
          begin
            nrDiasEstoque :=
              StrToIntDef(FormatFloat('0000000000',
              (nrQuantidadeEstoque + qtPendenteItem + nrQuantidadeComprada) /
              vlMediaDia), 0);
          end
          else
            nrDiasEstoque := nrQuantidadeEstoque + qtPendenteItem +
              nrQuantidadeComprada;

        end;

        // _lbeDiasEstoque.Text := FormatFloat('###########0', nrDiasEstoque);
        SetCamposDiasEstoque(nrDiasEstoque, 0);
        nrDiasEstoque := nrDiasEstoque;
        if nrDiasEstoque > 0 then
          if _lbeDiasEstoqueEmpresa.CanFocus then
            _lbeDiasEstoqueEmpresa.SetFocus;

      end;

    VK_LEFT:
      Key := 0;
    VK_RIGHT:
      Key := 0;

  end;

end;

procedure T_frmCompras._cedQtdadePedidoSCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        nrQuantidadepedidoSC := StrToIntDef(_lbeQuantidadePedidoSC.Text, 0);
        nrQuantidadepedidoRS := StrToIntDef(_lbeQuantidadePedidoRS.Text, 0);
        SetCamposQuantidaPedido(nrQuantidadepedidoSC, nrQuantidadepedidoRS);
        // _nrQuantidadeComprada := StrToIntDef(StringReplace(_lbeQtadePedido.Text,
        // '.', '', [rfReplaceAll]), 0);
        // nrQuantidadeComprada :=StrToIntDef(FormatFloat('##############0', _cedQtdadePedidoEmpresa.Value), 0);
        if nrQuantidadeComprada = 0 then
          GravaItem(nrPedidoTelaCompra, _cdsProduto.FieldByName('CD_MERCADORIA')
            .AsInteger, nrQuantidadeComprada,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

        nrDiasEstoque := 0;
        if nrQuantidadeComprada > 0 then
        begin
          if vlMediaDia > 0 then
          begin
            nrDiasEstoque :=
              StrToIntDef(FormatFloat('0000000000',
              (nrQuantidadeEstoque + qtPendenteItem + nrQuantidadeComprada) /
              vlMediaDia), 0);
          end
          else
            nrDiasEstoque := nrQuantidadeEstoque + qtPendenteItem +
              nrQuantidadeComprada;

        end;

        // _lbeDiasEstoque.Text := FormatFloat('###########0', nrDiasEstoque);
        SetCamposDiasEstoque(nrDiasEstoque, 0);
        nrDiasEstoque := nrDiasEstoque;
        if nrDiasEstoque > 0 then
          if _lbeDiasEstoqueSC.CanFocus then
            _lbeDiasEstoqueSC.SetFocus;

      end;

    VK_LEFT:
      Key := 0;
    VK_RIGHT:
      Key := 0;

  end;

end;

procedure T_frmCompras._chkAbreIndiceFaltaClick(Sender: TObject);
begin
  if _chkAbreIndiceFalta.Checked then
    _cbxListaPreco.SetFocus
  else
    _cbxListaPreco.SetFocus;

end;

procedure T_frmCompras._chkDiasEstoqueComPendenciaClick(Sender: TObject);
begin

  _cdsDiasEstoque.FieldByName('NR_DIAS_COMPRADOR').Visible := false;
  _cdsDiasEstoque.FieldByName('NR_DIAS_FORNECEDOR').Visible := false;
  _cdsDiasEstoque.FieldByName('NR_DIAS_COMPRADOR_PEN').Visible := false;
  _cdsDiasEstoque.FieldByName('NR_DIAS_FORNECEDOR_PEN').Visible := false;
  if _chkDiasEstoqueComPendencia.Checked then
  begin
    _cdsDiasEstoque.FieldByName('NR_DIAS_FORNECEDOR_PEN').Visible := true;
    _cdsDiasEstoque.FieldByName('NR_DIAS_COMPRADOR_PEN').Visible := true;
  end
  else
  begin
    _cdsDiasEstoque.FieldByName('NR_DIAS_FORNECEDOR').Visible := true;
    _cdsDiasEstoque.FieldByName('NR_DIAS_COMPRADOR').Visible := true;

  end;

  { _cdsDiasEstoque_testeCD_EMPRESA.Visible:=false;
    _cdsDiasEstoque_testeVL_ESTOQUE_FORNECEDOR.Visible:=false;
    _cdsDiasEstoque_testeVL_ESTOQUE_COMPRADOR.Visible:=false;
    _cdsDiasEstoque_testeVL_ESTOQUE_FORN_PEND.Visible:=false;
    _cdsDiasEstoque_testeVL_ESTOQUE_COMPR_PENDENCIA.Visible:=false;

    if _chkDiasEstoqueComPendencia.Checked then
    begin
    _cdsDiasEstoque_testeVL_ESTOQUE_FORN_PEND.Visible:=true;
    _cdsDiasEstoque_testeVL_ESTOQUE_COMPR_PENDENCIA.Visible:=true;
    end
    else
    begin
    _cdsDiasEstoque_testeVL_ESTOQUE_FORNECEDOR.Visible:=true;
    _cdsDiasEstoque_testeVL_ESTOQUE_COMPRADOR.Visible:=true;
    end; }

end;

procedure T_frmCompras._chkFiltroAtivoClick(Sender: TObject);
begin
  // if not _chkFiltroAtivo.Checked then
  // _cdsProduto.Filtered:=false;
end;

procedure T_frmCompras._chkMostaIndiceFaltaClick(Sender: TObject);
var
  idPosicao: TBookmark;
begin
  if _chkMostaIndiceFalta.Checked then
  begin
    idPosicao := _cdsProduto.Bookmark;
    _cdsProduto.Next;
    _cdsProduto.Bookmark := idPosicao;

  end;
  SetFocuCursor(IdPosicaoCursor);
end;

procedure T_frmCompras._lbCurvaSCgradeClick(Sender: TObject);
begin
  {if _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString <> 'E' then
  begin
    if ConfirmaIcone('Aviso Marca Produto para Inativacao Futura',
      'Marcar Produto para Inativar ?', MB_YESNO, MB_ICONQUESTION, 0)
      = IDYES then
    begin

      if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'N' then
      begin
        if SetInativacaoFuturaProduto(_cdsProduto.FieldByName('CD_MERCADORIA')
          .AsInteger, 'S') then
        begin
          LocalizaProduto(_cdsProduto.FieldByName('CD_PRODUTO').AsInteger,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '', '');
          _cdsProduto.Edit;
          if _cdsProduto.State = dsEdit then
            _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString := 'S';
          Mensagem('Marca??o Efetuada', MB_ICONINFORMATION);
          if SetCurvaProduto(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, 'E', 'N') then
            Mensagem('Curva Atualizada', MB_ICONINFORMATION)
          else
            Mensagem('Erro na Atualizacao da Curva', MB_ICONERROR);

        end
        else
          Mensagem('Erro na marca??o', MB_ICONERROR);
      end;
      exit;
    end;

    if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'S' then
    begin
      if ConfirmaIcone('Aviso Desmarca Inativacao Futura do Produto',
        'Desmarcar Inativar Futura do Produto ?', MB_YESNO, MB_ICONQUESTION, 0)
        = IDYES then
      begin

        if SetInativacaoFuturaProduto(_cdsProduto.FieldByName('CD_MERCADORIA')
          .AsInteger, 'N') then
        begin
          LocalizaProduto(_cdsProduto.FieldByName('CD_PRODUTO').AsInteger,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '', '');
          _cdsProduto.Edit;
          if _cdsProduto.State = dsEdit then
            _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString := 'N';
          Mensagem('Desmarca??o Efetuada', MB_ICONINFORMATION);
          exit;
        end

        else
          Mensagem('Erro na marca??o', MB_ICONERROR);
      end;
    end;
  end;

  if _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString = 'E' then
  begin
    if ConfirmaIcone('Aviso Atualizacao de Curva',
      'Deseja Mudar este Item Para Curva D ?', MB_YESNO, MB_ICONQUESTION, 0)
      = IDYES then
    begin
      PnrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
      PcdEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
      _frmJusticaCurva := T_frmJusticaCurva.Create(self);
      try
        _frmJusticaCurva.ShowModal;
      finally
        _frmJusticaCurva.Release;
        _frmJusticaCurva := nil;
      end;
      if idAtualizou then
      begin
        _cdsProduto.Edit;
        if _cdsProduto.State = dsEdit then
          _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString := 'D';
      end;

    end
    else
    begin
      if ConfirmaIcone('Aviso Marca Produto para Inativacao Futura',
        'Marcar Produto para Inativar ?', MB_YESNO, MB_ICONQUESTION, 0)
        = IDYES then
      begin
        if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'N' then
        begin
          if SetInativacaoFuturaProduto(_cdsProduto.FieldByName('CD_MERCADORIA')
            .AsInteger, 'S') then
          begin
            LocalizaProduto(_cdsProduto.FieldByName('CD_PRODUTO').AsInteger,
              _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '', '');
            _cdsProduto.Edit;
            if _cdsProduto.State = dsEdit then
              _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString := 'S';
            Mensagem('Marca??o Efetuada', MB_ICONINFORMATION);
            exit;
          end
          else
            Mensagem('Erro na marca??o', MB_ICONERROR);
        end;

        if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'S' then
        begin
          if ConfirmaIcone('Aviso Desmarca Inativacao Futura do Produto',
            'Desmarcar Inativar Futura do Produto ?', MB_YESNO, MB_ICONQUESTION,
            0) = IDYES then
          begin

            if SetInativacaoFuturaProduto
              (_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger, 'N') then
            begin
              _cdsProduto.open;
              LocalizaProduto(_cdsProduto.FieldByName('CD_PRODUTO').AsInteger,
                              _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '', '');
              _cdsProduto.Edit;
              if _cdsProduto.State = dsEdit then
                _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString := 'N';
              Mensagem('Desmarca??o Efetuada', MB_ICONINFORMATION);
            end

            else
              Mensagem('Erro na marca??o', MB_ICONERROR);
          end;
        end;

        exit;
      end;
    end;
  end;}

end;

procedure T_frmCompras._lbeDescontoAdicionalGridEnter(Sender: TObject);
begin
  idDigitaPrecoNota := false;
  if _chkDigitaPrecoNota.Checked then
    idDigitaPrecoNota := true;

end;

procedure T_frmCompras._lbeDescontoAdicionalGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin

        pcDescontoADicional := StrToFloatDef(_lbeDescontoAdicionalGrid.Text, 0);
        nrprodutoPreco := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
        nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
        _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
        // Mercadoria          := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0,_nrEmpresa, cdoperadorLogisticoPedido);

        Mercadoria := DadosProdutos(nrprodutoPreco, _nrEmpresa,
          cdoperadorLogisticoPedido);

        if Mercadoria = nil then
        begin
          Mensagem('Problema na tabela de Mercadoria Virtual  do sistema!!!',
            MB_ICONWARNING);
          exit;
        end;

        pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
        nrGeracaoVerba := Mercadoria.nrGeracaoVerba;

        nrQuantidadePedido := StrToIntDef(_lbeQuantidadePedidoGrid.Text, 0);
        _lbeSomaDesconto.Caption := FormatFloat('##0.00',
          pcDescontoPadrao + pcDescontoADicional);

        // Mercadoria := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0,0);
        if idDigitaPrecoNota then
        begin

          if (pcDescontoADicional > 0) and (idDigitaPrecoNota) then
          begin
            SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
              nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoADicional);
            PrecoItemSC := PrecoItem;
            SetPrecoLocal;
          end
          ELSE
          BEGIN
            _lbeDescontoAdicionalGrid.Text := '0,000';
            _lbePrecoNotaGrid.SetFocus;
            _lbePrecoNotaGrid.SelectAll;
            exit;
          END;
        end;

        if (pcDescontoADicional + Mercadoria.pcDescontoPadrao) > 100 then
        begin
          Mensagem('Percentual de Desconto Adicional + Desc. Padr?o' + #13 +
                    ' ultrapassa ? 100%', 16);
          _lbeDescontoAdicionalGrid.SetFocus;
          _lbeDescontoAdicionalGrid.SelectAll;
          exit;
        end;
        if (pcDescontoADicional = 0) and (not idDigitaPrecoNota) then
        begin
          // nrPedidoSCDesconto := GeraPedido(0, 0,1, nrQuantidadepedidoSC,nrVerbaSC ,0, 0,0);
          MostraDaDosCalculoGrid;
          SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoADicional);
          PrecoItemSC := PrecoItem;

          if nrQuantidadeComprada > 0 then
            SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
          // idMovimentoProximo := true;

          SetNavegacaoProduto(2);
          PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

        end;
        if (pcDescontoADicional > 0) and (not idDigitaPrecoNota) and
          (cdoperadorLogisticoPedido > 1) then
        begin
          // nrPedidoSCDesconto := GeraPedido(0, 0,1, nrQuantidadepedidoSC,nrVerbaSC ,0, 0,0);

          pcDescontoADicional :=
            StrToFloatDef(_lbeDescontoAdicionalGrid.Text, 0);

          nrVerba := 0;
          pcVerba := 0;
          _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
          SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
            nrQuantidadeComprada, nrVerba, 0, 0, pcDescontoADicional);
          PrecoItemSC := PrecoItem;
          if nrQuantidadeComprada > 0 then
            SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

          MostraDaDosCalculoGrid;
          SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoADicional);
          PrecoItemSC := PrecoItem;

          if nrQuantidadeComprada > 0 then
            SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
          // idMovimentoProximo := true;
          SetNavegacaoProduto(2);

          PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

        end;

        if (pcDescontoADicional > 0) and (not idDigitaPrecoNota) then
        begin
          pcDescontoADicional :=
            StrToFloatDef(_lbeDescontoAdicionalGrid.Text, 0);

          SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoADicional);
          PrecoItemSC := PrecoItem;
          SetPrecoLocal;
          FocoNumeroVerba;
        end;
      end;
  end;

end;

procedure T_frmCompras._lbeDescontoAdicionalGridKeyPress(Sender: TObject;
  var Key: Char);
var
  cdPrazoPagamento: Integer;

begin
  if not(Key in ['0' .. '9', ',', #8, #13, #27]) then
    Key := #0;
  if Key = #13 then
  begin
    { MostraDaDosCalculoGrid;
      pcDescontoAdicional:=StrToFloatDef(_lbeDescontoAdicionalGrid.Text,0);
      if pcDescontoAdicional > 0 then
      if _lbeNumeroVerba.CanFocus then
      _lbeNumeroVerba.SetFocus;
      if (pcDescontoAdicional = 0) and (nrQuantidadeComprada > 0) then
      begin
      MostraDaDosCalculoGrid;
      SetPedido(_cdsProdutoCD_EMPRESA.AsInteger);
      _cdsProduto.Next;
      end; }
  end;

end;

procedure T_frmCompras._lbeDescontoAdicionalKeyPress(Sender: TObject;
  var Key: Char);
var
  cdPrazoPagamento: Integer;
begin
  if not(Key in ['0' .. '9', ',', #8, #13, #27]) then
    Key := #0;
  if Key = #13 then
    MostraDaDosCalculo;
  if pcDescontoADicional > 0 then
    if (pcDescontoADicional = 0) and (nrQuantidadeComprada > 0) and
      (nrPedidoTelaCompra = 0) then
    begin
      cdPrazoPagamento := AbrePrazoParcelamento(inttostr(nrPrazoPedido), 1);
      cdPrazoPagamentoAudititoria := cdPrazoPagamento;
      nrPedidoTelaCompra := GeraNumeroPedido('C');
      idPedidoIniciado := true;
      GravaCapaPedido(nrPedidoTelaCompra, // NROP_P,//  NUMBER(6)
        nrLaboratorioLocal, // LABP_P :Integer;// NUMBER(6)
        dtPedido, // DATP_P :Tdate;// DATE
        pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
        0, // DESP_P:Double;// NUMBER(5,2)
        'S', // SITP_P :String;//CHAR(1)
        nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
        dtPedido + nrLeadTime, // PREP_P          //DATE
        ' ', // CHAR(40)
        '0', // SNRP_P           //  CHAR(10)
        0, // FLAP_P ,         //NUMBER(1)
        cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
        nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
        strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
        dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
        'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
        cdoperadorLogisticoPedido,
        // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
        NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
        dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
        dtSistema, // DT_DIGITACAO :Tdate;//  DATE
        0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
        0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
        strtodate('01/01/2039'), nrCompradorPedido,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, 0, pcGeracaoVerba,
        nrGeracaoVerba,0);
      // DT_TRANSMITIDO :tdate):Boolean;

      PrazoSC(nrPrazoPedido);

      PrazoRS(nrPrazoPedido);

      AbreItemPedidoMultiEmpresa(nrPedidoTelaCompra, 0,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
      AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
      AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
      SetNomeCampoItemPedido;
    end;
  if pcDescontoADicional = 0 then
    GravaItem(nrPedidoTelaCompra, _cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, nrQuantidadeComprada, _cdsProduto.FieldByName('CD_EMPRESA')
      .AsInteger);

end;

procedure T_frmCompras._lbeNrLaboratorioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I, mes: Integer;
  DadosDiaEstoque: TDadosDiasEstoque;

begin
  case Key of
    vk_return:
      begin
        if not idBloqueiaTeclaEnter then
        begin
          idBloqueiaTeclaEnter := true;
          _cdsDiasVenda := DiasVendaPeriodo;
          if _cdsDiasVenda <> nil then
            _cdsDiasVenda.open;

          _lbeNrLaboratorio.Enabled := false;
          idMostraGrafico := 0;
          idMovimentoProximo := false;
          nrUnidadesSugeridaRS := 0;
          nrUnidadesSugeridaSC := 0;
          nrUnidadesCompradaSC := 0;
          nrUnidadesCompradaRS := 0;
          nrUnidadesCompradaEmpresa := 0;
          nrUnidadesSugeridaEmpresa := 0;
          vlSugeridaMtsCubicoRS := 0;
          vlSugeridaMtsCubicoSC := 0;
          vlSugeridoCustoSC := 0;
          vlSugeridoCustoRS := 0;
          vtSugeridoVendaSC := 0;

          vtSugeridoVendaRS := 0;

          vlSugeridoSC := 0;

          vlCompradoSC := 0;
          vlCompradoCustoSC := 0;
          vlCompradoCustoRS := 0;
          vlSugeridoRS := 0;
          vlCompradoRS := 0;
          vlCompradoEmpresa := 0;
          vlSugeridoEmpresa := 0;
          idSequencia := 0;
          nrSequenciaReferencia := 0;
          _cdsTabelaProduto := GetTabelaMercadoria(nrLaboratorioLocal, 0);
          _stbCompras.Panels[1].Text := 'Abrindo Dias de Estoque Fornecedor...';
          _stbCompras.Repaint;

          _cdsDiasEstoque_teste.close;
          _cdsDiasEstoque_teste.open;
          SetTabelasItensCurva(nrLaboratorioLocal);

          try
            _cdsDiasEstoque := DiasEstoqueFinanceiroESTII(nrCompradorPedido,
                                                          0,
                                                          nrLaboratorioLocal);
            if _cdsDiasEstoque <> nil then
            begin
              _chkDiasEstoqueComPendencia.Checked := true;
              _dsDiasEstoque.DataSet := _cdsDiasEstoque;
              _cdsDiasEstoque.IndexFieldNames := 'CD_EMPRESA';
              _cdsDiasEstoque.open;
              _cdsDiasEstoque.filter := 'CD_EMPRESA=1';
              _cdsDiasEstoque.filtered:= true;
              vtEstoqueCompradorSC    := _cdsDiasEstoque.FieldByName('VT_ESTOUE_COMPRADOR').AsFloat;
              vtEstoqueFornecedorSC   := _cdsDiasEstoque.FieldByName('VT_ESTOQUE_FORNECEDOR').AsFloat;
              vtPendenciaCompradorSC  := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_CPR').AsFloat;
              vtPendenciaFornecedorSC := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_FOR').AsFloat;
              vtCMVMedioCompradorSC   := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_COMPRADOR').AsFloat;
              vtCMVMedioForncecedorSC := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_FORNECEDOR').AsFloat;

              _cdsDiasEstoque.filter   := 'CD_EMPRESA=4';
              _cdsDiasEstoque.filtered := true;
              vtEstoqueCompradorRS     := _cdsDiasEstoque.FieldByName('VT_ESTOUE_COMPRADOR').AsFloat;
              vtEstoqueFornecedorRS    := _cdsDiasEstoque.FieldByName('VT_ESTOQUE_FORNECEDOR').AsFloat;
              vtPendenciaCompradorRS   := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_CPR').AsFloat;
              vtPendenciaFornecedorRS  := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_FOR').AsFloat;
              vtCMVMedioCompradorRS    := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_COMPRADOR').AsFloat;
              vtCMVMedioForncecedorRS  := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_FORNECEDOR').AsFloat;
              _cdsDiasEstoque.filtered := false;

            end;
          except
            on E: Exception do
            begin
              trataerro(E.Message,
                'Erro ao Calcular Nr dias Estoque Fornecedor/compardor!!!');
            end;

          end;
          _stbCompras.Panels[1].Text := 'Abrindo Tabela de Produtos...';
          _stbCompras.Repaint;
          if _cdsTabelaProduto <> nil then
          begin
            _cdsTabelaProduto.open;
            _cdsTabelaProduto.RecordCount;
          end;

          _cdsEmbalagemMercadoria := GetTabelaQuantidadeEmbalagem
            (nrLaboratorioLocal);
          _cdsTabelaLeadTime := TabelaLeadTimeTermolabil(nrLaboratorioLocal);
          if _cdsTabelaLeadTime <> nil then
            _cdsTabelaLeadTime.open;
          if _cdsEmbalagemMercadoria <> nil then
          begin
            _cdsEmbalagemMercadoria.open;
            _cdsEmbalagemMercadoria.RecordCount;
          end;

          _cdsDadosFornecedor := GetTabelaLaboratorio(nrLaboratorioLocal);

          if _cdsDadosFornecedor <> nil then
          begin
            _cdsDadosFornecedor.open;
            _cdsDadosFornecedor.RecordCount;
            SetDadosFornecedor(nrLaboratorioLocal);
          end;

          _cdsDataUltimaCompra := DataUltimaCompraII(nrLaboratorioLocal);

          if _cdsDataUltimaCompra <> nil then
          begin
            _cdsDataUltimaCompra.open;
            _cdsDataUltimaCompra.RecordCount;
          end;

          _cdsPendenciaItem := GetPendenciaFornecedor(nrLaboratorioLocal, 0);

          // AbreDiasZero(nrLaboratorioLocal,0);


           _cdsIndicedeFalta:=AbreIndiceFalta(nrLaboratorioLocal);


          _cdsProdutoOL := GetProdutosOl(cdoperadorLogisticoPedido, idPedido);
          if _cdsProdutoOL <> nil then
            _cdsProdutoOL.open;
          if (_cdsProdutoOL = nil) and (cdoperadorLogisticoPedido > 1) then
          begin
            Mensagem('OPerador Logistico Sem Produtos vinculados....', 16);
            close;
            exit;
          end;
          AbreProdutosLaboratorio(nrLaboratorioLocal, nrCompradorPedido,
            idPedido);
          if _cdsProduto.isEmpty then
          begin
            Mensagem('Laboratorio Sem Produtos....', 16);
            close;
            exit;
          end;

          if StrToIntDef(_lbeNrPedido.Text, 0) > 0 then
            CarregaPedidoCompra;

          // CriaGradeProduto;
          _stbCompras.Panels[1].Text := 'Abrindo Laborat?rio';
          if _cdsProduto.Active then
            _lbeNumeroProduto.Text := FormatFloat('###,###,##0',
              _cdsProduto.RecordCount);

          _cdsVendaAnualLaboratorio := AbreVendaLaboratorioAnual
            (nrLaboratorioLocal, idTipoPedidoPreco);
          _stbCompras.Panels[1].Text := 'Abrindo Vendas CD Sta. Cruz do Sul...';
          _stbCompras.Repaint;
          _cdsVendaAnualLaboratorioRS := AbreVendaLaboratorioAnual
            (nrLaboratorioLocal, 4);
          _stbCompras.Panels[1].Text := 'Abrindo Vendas CD Tubar?o...';
          _stbCompras.Repaint;
          _cdsVendaAnualLaboratorioSC := AbreVendaLaboratorioAnual
            (nrLaboratorioLocal, 1);

          _stbCompras.Panels[1].Text := 'Abrindo indice pre?o...';
          _stbCompras.Repaint;
          pcIndicePrecoSC := AbreIndicePreco(nrLaboratorioLocal);
          _stbCompras.Panels[1].Text := 'Dados Estoque fornecedor...';
          _stbCompras.Repaint;
          DadosEstoqueEmpresa(nrLaboratorioLocal);
          _stbCompras.Panels[1].Text := 'Dados Pendencia fornecedor...';
          _stbCompras.Repaint;
          DadosEstoquePendente(nrLaboratorioLocal);
          _stbCompras.Panels[1].Text := 'Dados venda Mensal fornecedor...';
          _stbCompras.Repaint;
          DadosVendaMes(nrLaboratorioLocal);
          AbreLaboratorio(nrLaboratorioLocal);
          SetTabelasItensCurva(nrLaboratorioLocal);

          if nrPedidoTelaCompra = 0 then
            PrazoSC(nrPrazoPedido);
          if (nrPedidoTelaCompra > 0) AND (DadosPedidoAbertuta <> NIL) then
            getPrazoPedido(nrPedidoTelaCompra,
              DadosPedidoAbertuta.nrCondicaoPagamento);


          // AbreVendaLaboratorioAnual(nrLaboratorio);
          // AbreVendaLaboratorio(nrLaboratorio);

          // MontaGraficodeVendas(_cdsProduto.FieldByName('NROM_M').AsInteger);
          // MontaGraficoVenda;
          // _tbsCompras1.Enabled := true;
          // _tbsConfirma.Enabled := true;
          // _tbsSugestao.Enabled := true;
          _tbsConfirma.Enabled := true;
          _tbsSugestao.TabVisible := true;
          _tbsConfirma.TabVisible := true;
          _tbsCompras.TabVisible := true;

          // MontaPedidoGrade;
          // FiltraProdutoEmpresa(0, idPedido);
          if _cdsProduto.Active then
          begin
            _cdsProduto.filtered := false;
            // _cdsProduto.IndexFieldNames := 'NM_COMPLETO;CD_EMPRESA;CD_MERCADORIA';
          end;
          _cdsProduto.First;

          SetValoresPedidos;
          _tbsSugestao.Visible := true;
          _pgcCompras.ActivePage := _tbsSugestao;
          ListaPrecoAtivas(nrFornecedor, 0);

          _pgcCompras.TabIndex := 1;
          _tbsSugestao.SetFocus;
          _lbeNrPedido.Enabled := false;
          if _cbxListaPreco.ItemIndex = 0 then
            _cbListaPrecoLocal.ItemIndex := 0;
          if _cbxListaPreco.ItemIndex = 1 then
            _cbListaPrecoLocal.ItemIndex := 1;

          if nrPedidoTelaCompra > 0 then
          begin
            AbreItemPedidoMultiEmpresa(nrPedidoTelaCompra, 0, 1, 'N');
            AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
            AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
            SetNomeCampoItemPedido;
            TotaisPedidoEmpresa := TotalizaPedidoEmpresa(NrPedidoSC,
              NrPedidoRS, 0, 'S');
          end;
          if DadosPedidoAbertuta <> nil then
          begin
            if DadosPedidoAbertuta.nrPedido > 0 then
              ExecutaAberturaPedido;
            _lbeNrPedido.Enabled := false;
          end;

        end;
      end;
  end;

end;

procedure T_frmCompras._lbeNrPedidoExit(Sender: TObject);
var
  NrTemporario: Integer;
begin
  NrDiasCompraSC := 0;
  NrDiasCompraRS := 0;
  nrPedidoTelaCompra := StrToIntDef(_lbeNrPedido.Text, 0);
  if _cbxListaPreco.CanFocus then
    _cbxListaPreco.SetFocus;
  if StrToIntDef(_lbeNrPedido.Text, 0) > 0 then
    AberturaPedido;
  if DadosPedidoAbertuta <> nil then
  Begin
    if DadosPedidoAbertuta.cdEmpresa = 1 then
    begin
      _cbxOpcaoCDs.ItemIndex := 1;
      PrazoSC(DadosPedidoAbertuta.nrDiasPrazo);

    end;
    if DadosPedidoAbertuta.cdEmpresa = 4 then
    begin
      _cbxOpcaoCDs.ItemIndex := 2;
      PrazoRS(DadosPedidoAbertuta.nrDiasPrazo);
    end;
    nrOperadorLogistico      := DadosPedidoAbertuta.nrOperadorLogistico;
    nrLaboratorioLocal       := DadosPedidoAbertuta.nrFornecedor;
    cdoperadorLogisticoPedido := nrOperadorLogistico;
    nrOperadorLogisticoFim  := nrOperadorLogistico;
    nmModuloPedido := 'Alt.Ped.:' + FormatFloat('000000', nrPedidoTelaCompra);

  End;

end;

procedure T_frmCompras._lbeNrPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        Perform(WM_NEXTDLGCTL, 0, 0)
      end;

  end;
end;

procedure T_frmCompras._lbeNumeroVerbaGridExit(Sender: TObject);
begin
  nrVerba := StrToIntDef(_lbeNumeroVerbaGrid.Text, 0);
  if nrVerba > 0 then
    nrVerbaDigitada := nrVerba;
  if (nrGeracaoVerba > 0) and (nrVerba > 0) then
  begin
    nrVerbaDigitada := nrGeracaoVerba;
    nrVerba := nrGeracaoVerba;
  end;

end;

procedure T_frmCompras._lbeNumeroVerbaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        nrVerba := StrToIntDef(_lbeNumeroVerbaGrid.Text, 0);
        if (nrVerba > 0) and (nrGeracaoVerba <> nrVerba) and
          (nrGeracaoVerba > 0) then
        begin
          Mensagem('Nr. Verba definida para este Pedido ? ' +
            FormatFloat('####0', nrGeracaoVerba), 16);
          nrVerba := nrGeracaoVerba;
          _lbeNumeroVerbaGrid.Text := inttostr(nrGeracaoVerba);
        end;
        if nrVerba > 0 then
          nrVerbaDigitada := nrVerba;
        if trim(_lbeNumeroVerbaGrid.Text) = '' then
        begin
          Application.CreateForm(T_frmRelatorioVerba, _frmRelatorioVerba);
          nrCompradorVerba := nrCompradorPedido;
          nrVerba := 0;
          nrLaboratorioVerba := Mercadoria.nrLaboratorio;
          _frmRelatorioVerba.ShowModal;
          _lbeNumeroVerbaGrid.Text := inttostr(nrVerbaGrid);
          nrVerba := StrToIntDef(_lbeNumeroVerbaGrid.Text, 0);
          if (nrVerba > 0) and (nrGeracaoVerba <> nrVerba) and
            (nrGeracaoVerba > 0) then
          begin
            Mensagem('Nr. Verba definida para este Pedido ? ' +
              FormatFloat('####0', nrGeracaoVerba), 16);
            nrVerba := nrGeracaoVerba;
          end;
          _frmRelatorioVerba.Free;

        end;

        if GetNumeroVerba(nrVerba, Mercadoria.nrLaboratorio) = 0 then
        begin
          Mensagem('Verba N?o Cadastrada', 16);
          _lbeNumeroVerbaGrid.Clear;
          _lbeNumeroVerbaGrid.SetFocus;
          exit;
        end;
        if (cdoperadorLogisticoPedido > 1) and (nrVerba > 0) then
        begin
          Mensagem('Pedido de Opera??o Logistica n?o Pode ter recurso' + #13 +
            'destinado para Verba!!!', 64);

          nrVerba := 0;
        end;

        if _chkPcParaVerbaGrid.Checked then
          _lbePcVerbaGrid.SetFocus
        else
        begin
          // MostraDaDosCalculoGrid;
          _lbePcVerbaGrid.Text := '100,00';
          InsereItenPeloNrVerba;
        end;
      end;
  end;

  case Key of
    vk_return:
      begin
      end;
  end;
end;

procedure T_frmCompras._lbePcVerbaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      InsereItenPeloNrVerba
  end;
end;

procedure T_frmCompras._lbePendenciaGridDblClick(Sender: TObject);
var
  idPosicaoGrade: TBookmark;
begin
  if StrToIntDef(StringReplace(_lbePendenciaGrid.Text, '.', '', [rfReplaceAll]), 0) > 0 then
  begin
    idPosicaoGrade := _cdsProduto.Bookmark;
    Application.CreateForm(T_frmPendenciaItem, _frmPendenciaItem);
    _frmPendenciaItem._cdsTemp := TClientDataSet.Create(nil);
    _cdsPendencia.RecordCount;
    _frmPendenciaItem._cdsTemp := _cdsPendencia;
    _frmPendenciaItem._cdsPendencia :=FiltraPendenciaItem(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
    _frmPendenciaItem._dsPendencia.DataSet := _frmPendenciaItem._cdsPendencia;
    _frmPendenciaItem._cdsPendencia.open;
    _frmPendenciaItem.setGridPendenciaItem;
    _frmPendenciaItem.Top := 190;
    _frmPendenciaItem.left := 200;
    _frmPendenciaItem.Width := 700;
    _frmPendenciaItem.ShowModal;
    _cdsPendencia.close;
    _cdsPendencia := _frmPendenciaItem._cdsTemp;
    _cdsPendencia.open;
    _cdsPendencia.RecordCount;
    _cdsProduto.Next;
    _cdsProduto.Bookmark := idPosicaoGrade;
    // if not _cdsProduto.eof then
    // _cdsProduto.Prior;
    MostraGraficoVendaGridEmpresa;
  end
  else
    SetFocuCursor(IdPosicaoCursor);

end;

procedure T_frmCompras._lbePesquisaChange(Sender: TObject);
var
  cderro, erro: Integer;
begin
  if Length(_lbePesquisa.Text) > 2 then
  begin
    val(_lbePesquisa.Text, cderro, erro);
    if erro > 0 then
    begin
      LocalizaProduto(0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '',
        _lbePesquisa.Text);
    end;
  end;
end;

procedure T_frmCompras._lbePesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cdGAM: Integer;
begin
  case Key of
    VK_Up:
      IdPosicaoCursor := true;
    VK_Down:
      IdPosicaoCursor := true;
    vk_return:
      Begin
        IdPosicaoCursor := true;
        if _chkCodigoGam.Checked then
        begin
          cdGAM := StrToIntDef(_lbePesquisa.Text, 0);
          if cdGAM = 0 then
          begin
            Mensagem('Codigo Gam Invalido', 16);
            exit;
          end;
          LocalizaProduto(cdGAM, _cdsProduto.FieldByName('CD_EMPRESA')
            .AsInteger, '', '');
          exit
        end;
        if _chkCodigoFornecedor.Checked then
        begin
          if trim(_lbePesquisa.Text) = '' then
          begin
            Mensagem('Codigo Fornecedor Invalido', 16);
            exit;
          end;
          LocalizaProduto(0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
            _lbePesquisa.Text, '');
          exit;
        end;
        LocalizaProduto(0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '',
          _lbePesquisa.Text);

      End;
  end;
end;

procedure T_frmCompras._lbePrecoNotaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  pcDescontoAdicionalLocal: Double;
  vlNota: Double;
begin
  case Key of
    vk_return:
      begin
        vlNota := StrToFloatDef(_lbePrecoNotaGrid.Text, 0);
        pcDescontoAdicionalLocal := CalculaDescontoAdicional(vlPrecoLista,
          vlNota, pcDescontoRepasse, pcDescontoPadrao);
        pcDescontoADicional := pcDescontoAdicionalLocal;
        // Mercadoria := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, cdoperadorLogisticoPedido);
        Mercadoria := DadosProdutos(nrprodutoPreco,
          _cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
          cdoperadorLogisticoPedido);

        pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
        nrGeracaoVerba := Mercadoria.nrGeracaoVerba;
        SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
          nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoAdicionalLocal);
        PrecoItemSC := PrecoItem;
        _lbeSomaDesconto.Caption := FormatFloat('##0.00',
          pcDescontoPadrao + pcDescontoADicional);

        { CalculoPreco := CalculaPrecoLiquido(vlPrecoLista, vlPrecoVenda,
          pcDescontoRepasse, pcDescontoPadrao, pcDescontoAdicional,Mercadoria.pcIpiProduto,
          pcAliquotaIcms, nrQuantidadeComprada,0 ,'N', idForcaRepasse[1],
          idIpiLiquidoComRepasse[1], idIpiLiquidoSemRepasse[1],
          idIpiBrutoComRepasse[1], idIpiBrutoSemRepasse[1], idTipoLista[1],
          idUnidadeFederacao, idSuperfluo, idIcmDestacado, idReduzIcms,
          idPisConfins); }
        SetPrecoLocal;
        if nrQuantidadeComprada = 0 then
        begin
          _lbeDescontoAdicionalGrid.SetFocus;
          _lbeDescontoAdicionalGrid.SelectAll;
          exit;
        end;
        if (nrQuantidadeComprada > 0) and (pcDescontoADicional > 0) and
          (cdoperadorLogisticoPedido = 1) then
        begin
          _lbeNumeroVerbaGrid.SetFocus;
          _lbeNumeroVerbaGrid.SelectAll;
        end;
        if (nrQuantidadeComprada > 0) and (pcDescontoADicional > 0) and
          (cdoperadorLogisticoPedido > 1) then
        begin
          _lbeNumeroVerbaGrid.SetFocus;
          _lbeNumeroVerbaGrid.SelectAll;
        end;
        if (nrQuantidadeComprada > 0) and (pcDescontoADicional = 0) then
        begin
          if nrQuantidadeComprada > 0 then
          begin
            SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
            // idMovimentoProximo := true;
            _cdsProduto.Next;
          end;
        end;

      end;
  end;
end;

procedure T_frmCompras._lbePrecoNotaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in [',', '0' .. '9', #8, #13]) then
    Key := #0;

end;

procedure T_frmCompras._lbeDiasEstoqueEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  nrSugestoaIdeal, vlSusgestaoPossivel, vlSusgestaoIdeal: Double;
  qtEmbalagemLocal: Integer;
  DadosSugestao: TDadosQtdadeSugestao;
begin
  case Key of
    vk_return:
      begin
        if nrDiasEstoque = StrToIntDef(_lbeDiasEstoqueEmpresa.Text, 0) then
        begin
          { _frmPrecoDesconto := T_frmPrecoDesconto.Create(Self);
            SetPrecoSC;
            SetDadosPedidoEntrada;
            idDigitaPrecoNota:=idDigitaPrecoNotaCompra;
            _frmPrecoDesconto.ShowModal;

            SetDadosPedidoSaida;
            _frmPrecoDesconto.Free;
            _frmPrecoDesconto := NIL; }
          // abreTelaPreco;
          // _cdsProduto.Next;
        end;
        if nrDiasEstoque <> StrToIntDef(_lbeDiasEstoqueEmpresa.Text, 0) then
        begin
          DadosSugestao := CalculoSugestaoIdeal
            (StrToIntDef(_lbeDiasEstoqueEmpresa.Text, 0), 0, 0, vlMediaDia,
            nrQuantidadeEstoque,
            // _cdsProduto.FieldByName('ESTOQUE').AsInteger,
            qtPendenteItem);

          vlSusgestaoPossivel := 0;
          nrSugestoaIdeal := DadosSugestao.nrQtdSugerida;
          // qtEmbalagemLocal:=GetQuantidadeEmbalagem(nrProduto);

          if _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger > 0 then
            vlSusgestaoPossivel :=
              strtoint(FormatFloat('########0',
              nrSugestoaIdeal / _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
              .AsInteger));
          vlSusgestaoPossivel := vlSusgestaoPossivel * qtEmbalagemLocal;
          // _lbeQtadePedido.Text:=FormatFloat('########0',vlSusgestaoPossivel);
          // _cedQtdadePedidoEmpresa.Value := vlSusgestaoPossivel;
          // _cedQtdadePedido.SetFocus;
        end;

      end;
  end;
end;

procedure T_frmCompras._lbeDiasEstoqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nrSugestoaIdeal, vlSusgestaoPossivel, vlSusgestaoIdeal: Double;
  nrDiasDigitado, qtEmbalagemLocal, nrTemp: Integer;
  DadosSugestao: TDadosQtdadeSugestao;

begin
  case Key of
    VK_Up:
      begin
        _lbeQuantidadePedidoGrid.SetFocus;
        _lbeQuantidadePedidoGrid.SelectAll;
        exit;

      end;
    vk_return:
      begin
        nrTemp := StrToIntDef(StringReplace(_lbeDiasEstoque.Text, '.', '',
          [rfReplaceAll]), 0);
        if nrDiasEstoque = nrTemp then
        begin
          nrprodutoPreco := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
          nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA')
            .AsInteger;
          _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
          if cdoperadorLogisticoPedido = 1 then
            pcDescontoPadrao := _cdsProduto.FieldByName
              ('PC_DESCONTO_PADRAO_COMPRA').AsFloat
          else
            pcDescontoPadrao := LocalizaDescontoOPerador(nrprodutoPreco,
              _nrEmpresa);

          if _chkSemDescontoAdicional.Checked then
          begin
            pcDescontoADicional := 0;
          end;

          SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, pcDescontoPadrao,
            pcDescontoADicional);
          PrecoItemSC := PrecoItem;
          { / precoLista := GetListaprecoNova(0,pcIndicePrecoSC, 1, nrProduto,
            _cdsProdutoCD_EMPRESA.AsInteger,
            idprecoAtual, dtPedido); }
          precoLista := GetPrecoItem(nrProduto, _nrEmpresa,
            _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, 1, idprecoAtual,
            idPedidoBloqueado, nrListaPreco);

          vlPrecoLista := precoLista.vlPrecoLista;
          if vlPrecoLista = 0 then
          begin
            Mensagem('Pre?o N?o Encontrado Para Este produto No CD ' +
              _edtCD.Text, 64);
            _lbeQuantidadePedidoGrid.SetFocus;
            exit;
          end;

          if _chkSemDescontoAdicional.Checked then
          begin
            CompraItem(nrProduto, _nrEmpresa, 0, 0);
            SetFocuCursor(IdPosicaoCursor);
            exit;
          end;

          SetPrecoLocal;
          FocoAdicional;
        end;
        if nrDiasEstoque <> nrTemp then
        begin
          DadosSugestao := CalculoSugestaoIdeal
            (StrToIntDef(_lbeDiasEstoque.Text, 0), 0, 0, vlMediaDia,
            nrQuantidadeEstoque,
            // _cdsProduto.FieldByName('ESTOQUE').AsInteger,
            qtPendenteItem);
          nrSugestoaIdeal := DadosSugestao.nrQtdSugerida;
          vlSusgestaoPossivel := 0;
          // qtEmbalagemLocal:=GetQuantidadeEmbalagem(nrProduto);

          if _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger > 0 then
            vlSusgestaoPossivel :=
              strtoint(FormatFloat('########0',
              nrSugestoaIdeal / _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
              .AsInteger));
          vlSusgestaoPossivel := vlSusgestaoPossivel * _cdsProduto.FieldByName
            ('QT_EMBALAGEM_COMPRA').AsInteger;
          // _lbeQtadePedido.Text:=FormatFloat('########0',vlSusgestaoPossivel);
          _lbeQuantidadePedidoGrid.Text :=
            FormatFloat('########0', vlSusgestaoPossivel);
          SetFocuCursor(IdPosicaoCursor);
        end;

      end;
  end;

end;

procedure T_frmCompras._lbeDiasEstoqueSCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nrSugestoaIdeal, vlSusgestaoPossivel, vlSusgestaoIdeal: Double;
  nrDiasDigitado: Integer;
  DadosSugestao: TDadosQtdadeSugestao;

begin
  case Key of
    vk_return:
      begin
        nrDiasDigitado := StrToIntDef(StringReplace(_lbeDiasEstoqueSC.Text, '.',
          '', [rfReplaceAll]), 0);
        if nrDiasEstoque = nrDiasDigitado then
        begin
          // _lbeDescontoAdicional.SetFocus;
          _frmPrecoDesconto := T_frmPrecoDesconto.Create(self);

          SetPrecoSC;
          SetDadosPedidoEntrada;
          _frmPrecoDesconto.ShowModal;
          SetDadosPedidoSaida;
          _frmPrecoDesconto.Free;
          _frmPrecoDesconto := NIL;
        end;
        if nrDiasEstoque <> nrDiasDigitado then
        begin
          DadosSugestao := CalculoSugestaoIdeal(nrDiasDigitado, 0, 0,
            vlMediaDia, nrQuantidadeEstoque,
            // _cdsProduto.FieldByName('ESTOQUE').AsInteger,
            qtPendenteItem);
          nrSugestoaIdeal := DadosSugestao.nrQtdSugerida;

          vlSusgestaoPossivel := 0;
          if _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger > 0 then
            vlSusgestaoPossivel :=
              strtoint(FormatFloat('########0',
              nrSugestoaIdeal / _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
              .AsInteger));
          vlSusgestaoPossivel := vlSusgestaoPossivel * _cdsProduto.FieldByName
            ('QT_EMBALAGEM_COMPRA').AsInteger;
          // _lbeQtadePedido.Text:=FormatFloat('########0',vlSusgestaoPossivel);
          // _cedQtdadePedidoEmpresa.Value := vlSusgestaoPossivel;
          // _cedQtdadePedido.SetFocus;
        end;

      end;
  end;
end;

procedure T_frmCompras._lbeEstoqueGridChange(Sender: TObject);
begin

end;

(* ************************************************* *)

procedure T_frmCompras.PintaPainelGrafico(curva: String);
begin
  if curva = 'A' then
  begin
    _chtVendasSC.Color := clInfoBk;
    _chtvendasRS.Color := clInfoBk;
    _chtVendasSC.Title.Font.Color := clBlack;
    _chtvendasRS.Title.Font.Color := clBlack;
    Series1.Marks.Arrow.Color := clBlack;
    Series8.Marks.Arrow.Color := clBlack;
    _chtVendasSC.LeftAxis.LabelsFont.Color := clBlack;
    _chtvendasRS.LeftAxis.LabelsFont.Color := clBlack;
    _chtVendasSC.BottomAxis.LabelsFont.Color := clBlack;
    _chtvendasRS.BottomAxis.LabelsFont.Color := clBlack;
    _chtVendasSC.BottomAxis.LabelsFont.Color := clBlack;
    _chtvendasRS.BottomAxis.LabelsFont.Color := clBlack;
    _lbeCurvaSC.Font.Color := clBlack;
    _lbeCurvaRS.Font.Color := clBlack;
    // _lbeCurva.Canvas:=clBlack;

  end;
  if curva = 'B' then
  begin
    _chtVendasSC.Color := clTeal;
    _chtvendasRS.Color := clTeal;
    _chtVendasSC.Title.Font.Color := clWhite;
    Series1.Marks.Arrow.Color := clWhite;
    Series8.Marks.Arrow.Color := clWhite;
    _chtVendasSC.LeftAxis.LabelsFont.Color := clWhite;
    _chtvendasRS.LeftAxis.LabelsFont.Color := clWhite;
    _chtVendasSC.BottomAxis.LabelsFont.Color := clWhite;
    _chtvendasRS.BottomAxis.LabelsFont.Color := clWhite;
    _lbeCurvaSC.Font.Color := clWhite;
    _lbeCurvaRS.Font.Color := clWhite;
    // _lbeCurva.Canvas.Color:=clWhite;
  end;
  if curva = 'C' then
  begin
    _chtVendasSC.Color := clMaroon;
    _chtvendasRS.Color := clMaroon;
    _chtVendasSC.Title.Font.Color := clWhite;
    _chtvendasRS.Title.Font.Color := clWhite;
    Series1.Marks.Arrow.Color := clWhite;
    Series8.Marks.Arrow.Color := clWhite;
    _chtVendasSC.LeftAxis.LabelsFont.Color := clWhite;
    _chtvendasRS.LeftAxis.LabelsFont.Color := clWhite;
    _chtVendasSC.BottomAxis.LabelsFont.Color := clWhite;
    _chtvendasRS.BottomAxis.LabelsFont.Color := clWhite;
    _lbeCurvaSC.Font.Color := clWhite;
    // _lbeCurva.Canvas.Color:=clWhite;
  end;
  if (curva = 'D') or (curva = 'E') then
  begin
    _chtVendasSC.Color := clRed;
    _chtvendasRS.Color := clRed;
    _chtvendasRS.Title.Font.Color := clBlack;
    Series1.Marks.Arrow.Color := clBlack;
    Series8.Marks.Arrow.Color := clBlack;
    _chtVendasSC.LeftAxis.LabelsFont.Color := clBlack;
    _chtvendasRS.LeftAxis.LabelsFont.Color := clBlack;
    _chtVendasSC.BottomAxis.LabelsFont.Color := clBlack;
    _chtvendasRS.BottomAxis.LabelsFont.Color := clBlack;
    _lbeCurvaSC.Font.Color := clWhite;
    _lbeCurvaRS.Font.Color := clWhite;
    // _lbeCurva.Canvas.Color:=clWhite;
  end;
end;

function T_frmCompras.CalculaMediaProduto(PnrProduto,
  PnrEmpresa: Integer): Double;
var
  I, contaMes: Integer;
  dtreferencia: tdate;
  nrMesReferencia, nrDiaSemEstoqueFuturo, nrDiaEstoqueFuturo: Integer;
  vlMediaNova, vlMediaMesAtual: Double;
  nrDiasMesAtual, MesRef_1, MesRef_2, MesRef_3: Integer;

begin
  nrDiaSemEstoqueFuturo := 0;
  dtreferencia := IncMonth(dtPedido, -12);
  contaMes := MonthOf(dtreferencia);

  MesRef_1 := MonthOf(IncMonth(dtPedido, 1));
  MesRef_2 := MonthOf(IncMonth(dtPedido, 2));
  MesRef_3 := MonthOf(IncMonth(dtPedido, 3));

  nrUnidadesMesesSelecionados := 0;
  nrDiasEstoqueZeroSelecionados := 0;
  nrDiasSelecionados := 0;
  nrMesesSelecionados := 0;
  result := 0;
  // if _cdsProdutoCD_MERCADORIA.AsInteger>0 then
  // AbreDiasZero(nrLaboratorioLocal,_cdsProdutoCD_MERCADORIA.AsInteger);

  _cdsVendalaboratorio.IndexFieldNames := 'CD_MERCADORIA;DT_VENDA_MERCADORIA';
  FiltraVendaLaboratorio(PnrProduto, PnrEmpresa, cdoperadorLogisticoPedido);

  vlMediaNova := 0;
  for I := 1 to 13 do
  begin
    qtVendaMes[I] := 0;
    vlUltimosPrecos[I] := 0;
    nrDiasEsqueZero[I] := 0;
  end;
  while not _cdsVendalaboratorio.eof do
  begin
    begin
      nrMesReferencia := _cdsVendalaboratorio.FieldByName('MES').AsInteger;
      qtVendaMes[nrMesReferencia] := _cdsVendalaboratorio.FieldByName('NR_UNIDADES').AsInteger;
      nrDiasEsqueZero[nrMesReferencia] := _cdsVendalaboratorio.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
      if idMesSelecionado[_cdsVendalaboratorio.FieldByName('MES').AsInteger]= 'S' then
      begin
        nrDiasEstoqueZeroSelecionados := nrDiasEstoqueZeroSelecionados +  _cdsVendalaboratorio.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
        vlMediaNova := vlMediaNova + _cdsVendalaboratorio.FieldByName
          ('VL_MEDIA').AsFloat;

        // nrDiasSelecionados := nrDiasSelecionados + getNumerodeDias(nrMesReferencia);
        if _cdsVendalaboratorio.FieldByName('MES').AsInteger = 13 then
          nrDiasSelecionados := nrDiasSelecionados + DayOf(dtSistema) - 1
        else
          nrDiasSelecionados := nrDiasSelecionados +
            DaysInMonth(_cdsVendalaboratorio.FieldByName('DT_VENDA_MERCADORIA')
            .AsDateTime);
      end;
      _cdsVendalaboratorio.Next;
    end;
  end;
  for I := 1 to 13 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    if idMesSelecionado[I] = 'S' then
    begin
      nrUnidadesMesesSelecionados := nrUnidadesMesesSelecionados +
        qtVendaMes[I];
      inc(nrMesesSelecionados);
    end;
    inc(contaMes);
  end;
  vlMediaMesSC := 0;
  vlMediaDia := 0;
  vlMediaFutura := 0;
  nrDiaEstoqueFuturo := DaysInMonth(IncMonth(dtPedido, 1)) +
    DaysInMonth(IncMonth(dtPedido, 2)) + DaysInMonth(IncMonth(dtPedido, 3));
  nrDiaSemEstoqueFuturo := nrDiasEsqueZero[MesRef_1] + nrDiasEsqueZero[MesRef_2]
    + nrDiasEsqueZero[MesRef_3];

  if (nrDiaEstoqueFuturo - nrDiaSemEstoqueFuturo) > 0 then
    vlMediaFutura := (qtVendaMes[MesRef_1] + qtVendaMes[MesRef_2] +
      qtVendaMes[MesRef_3]) / (nrDiaEstoqueFuturo - nrDiaSemEstoqueFuturo);

  if nrMesesSelecionados > 0 then
    vlMediaNova := vlMediaNova / nrMesesSelecionados;

  if nrUnidadesMesesSelecionados > 0 then
  begin
    if (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados) > 0 then
      vlMediaDia := nrUnidadesMesesSelecionados /
        (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados)
    else
      vlMediaDia := nrUnidadesMesesSelecionados / (nrDiasSelecionados);

    // vlMediaDia :=vlMediaNova;

    if nrMesesSelecionados > 0 then
      // Retirado Para novo Calculo  vlMediaMesSC := (vlMediaDia * (nrDiasSelecionados-nrDiasEstoqueZeroSelecionados)) / nrMesesSelecionados;
      vlMediaMesSC := (vlMediaDia * nrDiasSelecionados) / nrMesesSelecionados;
    if idMesSelecionado[13] = 'S' then
    begin
      vlMediaMesAtual := qtVendaMes[13];
      if (DayOf(dtSistema) - 1) > 0 then
        vlMediaMesAtual := (qtVendaMes[13] / (DayOf(dtSistema) - 1)) *
          DaysInMonth(dtSistema);
      vlMediaMesSC := vlMediaMesAtual;
      if (nrMesesSelecionados > 1) then
        vlMediaMesSC := ((vlMediaDia * nrDiasSelecionados) + vlMediaMesAtual) /
          nrMesesSelecionados;

    end;
  end;
  result := Arredondar(vlMediaDia,3);
  _btnMediaMaior.Visible := false;
  _btnMediaMenor.Visible := false;
  if vlMediaFutura > vlMediaDia then
  begin
    _btnMediaMaior.Visible := true;
    _btnMediaMenor.Visible := false;
  end;
  if vlMediaFutura < vlMediaDia then
  begin
    _btnMediaMaior.Visible := false;
    _btnMediaMenor.Visible := true;
  end;
  // Result:=vlMediaNova;
end;

Function T_frmCompras.AbreParamentroLaboratorio(nrLaboratorio: Integer)
  : Boolean;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add
      ('Select * from PRDDM.DC_PARAM_LAB_ENTRADA where NR_LABORATORIO =:PnrLaboratorio');
    tempQuery.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
    tempQuery.open;
    idForcaRepasse := 'N';
    idIcmDestacado := 'S';
    IF not tempQuery.isEmpty THEN
    BEGIN
      idForcaRepasse := tempQuery.FieldByName('ID_REPASSE_PERFUMARIA').AsString;
      idIpiLiquidoComRepasse := tempQuery.FieldByName
        ('ID_IPI_VLR_LIQUIDO_COM_REPASSE').AsString;
      idIpiLiquidoSemRepasse := tempQuery.FieldByName
        ('ID_IPI_VLR_LIQUIDO').AsString;
      idIpiBrutoComRepasse := tempQuery.FieldByName
        ('ID_IPI_VLR_BRUTO_APOS_REPASSE').AsString;
      idIpiBrutoSemRepasse := tempQuery.FieldByName('ID_IPI_VLR_BRUTO')
        .AsString;
    END;
  finally
    FreeAndNil(tempQuery);
  end;
end;

procedure T_frmCompras.MostraPreco;
begin

end;

function T_frmCompras.PrazoPagamento(tabela: TClientDataSet): string;
var
  stPrazo: String[36];
begin
  tabela.First;
  stPrazo := '';
  while Not tabela.eof do
  begin
    stPrazo := stPrazo + FormatFloat('000', tabela.FieldByName('NR_DIAS')
      .AsInteger);
    tabela.Next;
  end;
  result := stPrazo;
end;

procedure T_frmCompras.GravaItem;
VAR
  vlVerba: Double;
  vlSugeridoLocal, vlCompradoLocal, pcCreditoICMS, pcIPILista: Double;
  nrAuditoriaLocal: Integer;
begin

  // Mercadoria := GetMercadoriaNova(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger, _cdsProduto.FieldByName('NR_DIGITO_MERCADORIA').AsInteger, 0,  _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, cdoperadorLogisticoPedido);
  Mercadoria := DadosProdutos(_cdsProduto.FieldByName('CD_MERCADORIA')
    .AsInteger, _nrEmpresa, cdoperadorLogisticoPedido);

  pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
  nrGeracaoVerba := Mercadoria.nrGeracaoVerba;

  vlVerba := 0;
  if nrVerba = 0 then
  begin
    pcVerba := 0;
    vlVerba := 0;
  end;
  if (cdoperadorLogisticoPedido > 1) and (nrVerba > 0) then
  begin
    Mensagem('Pedido de Opera??o Logistica n?o Pode ter recurso' + #13 +
      'destinado para Verba !!!', 64);

    nrVerba := 0;
  end;
  if nrVerba > 0 then
  begin
    vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba,
      PrecoItem.vlPrecoCusto, Mercadoria.pcIpiProduto, 0,
      Mercadoria.pcCreditoICMS, Mercadoria.nrProduto, Mercadoria.nrTipoProduto,
      nrQuantidadeComprada, Mercadoria.nrLaboratorio, Mercadoria.idPis);
  end;

  vlSugeridoLocal := vlSugeridoRS;
  vlCompradoLocal := nrQuantidadeComprada * PrecoItem.vlPrecoLista;
  nrAuditoriaLocal := NrAuditoriaRS;
  if Mercadoria.nrEmpresaProduto = 1 then
  begin
    vlSugeridoLocal := vlSugeridoSC;
    nrAuditoriaLocal := NrAuditoriaSC;
  end;
  if Mercadoria.idSituacaoMercadoriaCompra <> 'A' then
  begin
    Mensagem('Mercadoria com cadastro Pendente...' + #13 +
      'O cadastro devera ser finalizado para poder fazer pedido',
      MB_ICONWARNING);
    if _lbeQuantidadePedidoGrid.CanFocus then
      _lbeQuantidadePedidoGrid.SetFocus;
    exit;
  end;

  DadosItemPedidoLog := localizaItemPedido(nrPedido, Mercadoria.nrProduto,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

  GravaLogPedidoCompra(nrPedido, // PnrPedido,
    Mercadoria.nrProduto, // PnrMercadoria,
    DadosItemPedidoLog.nrQuantidadePedido, // PqtAnterior,
    nrQuantidadeComprada, // PqtAtual:Integer;
    DadosItemPedidoLog.pcDescontoADicional, // PpcDescontoAnterior,
    pcDescontoADicional, // PpcDescontoAtual:Double;
    DadosItemPedidoLog.nrVerba, // PnrVerbaAnterior,
    nrVerba, // :Integer;
    DadosItemPedidoLog.pcVerba, // PpcVerbaAnterior,
    pcVerba, // PpcVerbaAtual:Double;
    nmLogin, // PnmUsuario:String;
    DadosItemPedidoLog.idStatusItem, // PidStatusAnterior,
    'N', // PidStatusAtual:String;
    DadosItemPedidoLog.qtSugerida, // PqtSugeridaAnterior,
    nrUnidadesPossivel); // PqtSugeridaAtual:Integer):Boolean;

  if nrQuantidadeComprada = 0 then
  begin

    if Confirma('Deseja Eliminar Item?', MB_DEFBUTTON2) = IDYES then
    begin
      EliminaItemPedido(nrPedido, nrProduto, '');
     {ManutencaoItemAuditoria(nrAuditoriaLocal, Mercadoria.nrProduto,
        nrUnidadesPossivel, 0, vlSugeridoLocal, 0, qtPendenteItem,
        nrQuantidadeEstoque, vlMediaDia * 30, nrDiasCoberturaEstoqueAuditoria,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, nrPedido);}

    end;
  end;

  if nrQuantidadeComprada > 0 then
  begin
    if not DadosItemPedidoLog.idItemGravado then
    begin
      inc(nrContaItem);
      if nrDiasEstoqueAtual > 999 then
        nrDiasEstoqueAtual := 999;

      pcCreditoICMS := Mercadoria.pcCreditoICMS;
      pcIPILista := precoLista.pcIPILista;
      if (precoLista.PcIcmsCompra > 0) and
        (dtSistema >= strtodate('01/12/2016')) then
        pcCreditoICMS := precoLista.PcIcmsCompra;

      GravaItemPedidoAtual(nrPedido, // NUMBER(6)
        Mercadoria.nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
        PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        PrecoItem.pcMundancaPreco, _cdsProduto.FieldByName('CD_EMPRESA')
        .AsInteger, pcCreditoICMS, pcIPILista);
      // PC_MUDANCA_PRECO:Double):Boolean;//NUMBER(7,4)

      GravaLogItemPedido(nrPedido, // NUMBER(6)
        Mercadoria.nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
        PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        PrecoItem.pcMundancaPreco, _cdsProduto.FieldByName('CD_EMPRESA')
        .AsInteger, pcCreditoICMS);

      vlSugeridoLocal := nrUnidadesPossivel * precoLista.vlPrecoLista;
      ManutencaoItemAuditoria(nrAuditoriaLocal,
                              Mercadoria.nrProduto,
                              nrUnidadesPossivel,
                              nrQuantidadeComprada,
                              vlSugeridoLocal,
                              vlCompradoLocal,
                              qtPendenteItem,
                              nrQuantidadeEstoque,
                              vlMediaDia * 30,
                              nrDiasCoberturaEstoqueAuditoria,
                              _cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
                              nrPedido);

    end;
    /// _cdsProduto.Next;  27/07/2017
    // MontaGraficodeVendas(_cdsProduto.FieldByName('NROM_M').AsInteger);
    // MontaGraficoVenda;
  end;
  if DadosItemPedidoLog.idItemGravado then
  begin
    // pcDescontoAdicional := StrToFloatDef(_lbeDescontoAdicional.Text, 0);
    DadosItemPedidoLog := localizaItemPedido(nrPedido, Mercadoria.nrProduto,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

    GravaLogPedidoCompra(nrPedido, // PnrPedido,
      Mercadoria.nrProduto, // PnrMercadoria,
      DadosItemPedidoLog.nrQuantidadePedido, // PqtAnterior,
      nrQuantidadeComprada, // PqtAtual:Integer;
      DadosItemPedidoLog.pcDescontoADicional, // PpcDescontoAnterior,
      pcDescontoADicional, // PpcDescontoAtual:Double;
      DadosItemPedidoLog.nrVerba, // PnrVerbaAnterior,
      nrVerba, // :Integer;
      DadosItemPedidoLog.pcVerba, // PpcVerbaAnterior,
      pcVerba, // PpcVerbaAtual:Double;
      nmLogin, // PnmUsuario:String;
      DadosItemPedidoLog.idStatusItem, // PidStatusAnterior,
      'N', // PidStatusAtual:String;
      DadosItemPedidoLog.qtSugerida, // PqtSugeridaAnterior,
      nrUnidadesPossivel); // PqtSugeridaAtual:Integer):Boolean;
   if nrQuantidadeComprada>0 then
      AtualizaItemPedido(nrPedido,
                         nrProduto,
                         nrQuantidadeComprada,
                         0,
                        nrPrazoPedido,
                        nrVerba,
                        0,
                        1,
                        nrDiasEstoque,
                        nrUnidadesPossivel, 'N',
                        'N', 'N',
                        pcDescontoPadrao,
                        pcDescontoADicional,
                        0,
                        pcVerba,
                        0,
                        0,
                        PrecoItem.vlPrecoLiquido,
                        PrecoItem.vlPrecoLista,
                        PrecoItem.vlPrecoCusto,
                        0,
                        0,
                        vlVerba,
                        vlMediaMesSC,
                        ' Tela Pedido',
                       _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
    ManutencaoItemAuditoria(nrAuditoriaLocal, Mercadoria.nrProduto,
      nrUnidadesPossivel, nrQuantidadeComprada, vlSugeridoLocal,
      vlCompradoLocal, qtPendenteItem, nrQuantidadeEstoque, vlMediaDia * 30,
      nrDiasCoberturaEstoqueAuditoria, _cdsProduto.FieldByName('CD_EMPRESA')
      .AsInteger, nrPedido);
    pcCreditoICMS := Mercadoria.pcCreditoICMS;
    if (precoLista.PcIcmsCompra > 0) and
      (dtSistema >= strtodate('01/12/2016')) then
      pcCreditoICMS := precoLista.PcIcmsCompra;

    GravaLogItemPedido(nrPedido, // NUMBER(6)
      Mercadoria.nrProduto, // NROM_Y ,//NUMBER(6)
      nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
      0, // CHEY_Y :Integer;//NUMBER(7)
      pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
      'S', // SITY_Y :String;//CHAR(1)
      nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
      PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
      PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
      pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
      nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
      PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
      nrVerba, // NRVV_Y :Integer;//NUMBER(6)
      0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
      0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
      'N', // ID_MARGEM,//CHAR(1)
      'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
      pcVerba, // PC_VERBA,//  NUMBER(5,2)
      vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
      0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
      0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
      0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
      cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
      nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
      nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
      vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
      PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
      PrecoItem.pcMundancaPreco, _cdsProduto.FieldByName('CD_EMPRESA')
      .AsInteger, pcCreditoICMS);

  end;

  nrDiasEstoqueAtual := 0;
  vlMediaMesSC := 0;
  nrUnidadesPossivel := 0;
  pcDescontoADicional := 0;

end;

Function T_frmCompras.FiltroEspecealidade(nrEspecealidade: Integer): Boolean;
begin
  with _cdsProduto do
  begin
    filter := 'EITM_M=' + inttostr(nrEspecealidade) + ' OR ERGM_M=' +
      inttostr(nrEspecealidade);
    filtered := true;
    First;
    // Refresh;
  END;
END;

Function T_frmCompras.LocalizaDescontoOPerador(PnrProduto,
  PnrCD: Integer): Double;
begin
  result := 0;
  if _cdsProdutoOL.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrProduto, PnrCD]), []) then
    result := _cdsProdutoOL.FieldByName('PC_DESC_COMPRA').AsFloat;
END;

procedure T_frmCompras.SetNomeCampoItemPedido;
begin
  if _cdsitemPedido.Active then
  begin
    TIntegerField(_cdsitemPedido.FieldByName('NROP_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('NROP_Y')).DisplayLabel :=
      'Nr.Pedido';
    TIntegerField(_cdsitemPedido.FieldByName('NROP_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedido.FieldByName('NROM_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('NROM_Y')).DisplayLabel :=
      'Nr.Produto';
    TIntegerField(_cdsitemPedido.FieldByName('NROM_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedido.FieldByName('QUAY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('QUAY_Y')).DisplayLabel :=
      'Qtd. Pedido';
    TIntegerField(_cdsitemPedido.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedido.FieldByName('CHEY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('CHEY_Y')).DisplayLabel :=
      'Qtd.Faturada';
    TIntegerField(_cdsitemPedido.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedido.FieldByName('ABTY_Y')).DisplayFormat :=
      '#######0';
    TFloatField(_cdsitemPedido.FieldByName('ABTY_Y')).DisplayLabel :=
      'Desc.Padr?o';
    TFloatField(_cdsitemPedido.FieldByName('ABTY_Y')).DisplayWidth := 06;

    TStringField(_cdsitemPedido.FieldByName('SITY_Y')).DisplayLabel := 'Status';
    TStringField(_cdsitemPedido.FieldByName('SITY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedido.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(_cdsitemPedido.FieldByName('PRZY_Y')).DisplayLabel := 'Prazo';
    TIntegerField(_cdsitemPedido.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedido.FieldByName('PUNY_Y')).DisplayLabel :=
      'Pre?o Unit.';
    TFloatField(_cdsitemPedido.FieldByName('PUNY_Y')).DisplayFormat :=
      '###,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(_cdsitemPedido.FieldByName('PFBY_Y')).DisplayLabel :=
      'Pre?o Fornecedor';
    TFloatField(_cdsitemPedido.FieldByName('PFBY_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(_cdsitemPedido.FieldByName('DADY_Y')).DisplayLabel :=
      'Desc. Adic.';
    TFloatField(_cdsitemPedido.FieldByName('DADY_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('DADY_Y')).DisplayWidth := 12;

    TFloatField(_cdsitemPedido.FieldByName('VCCI_Y')).DisplayLabel :=
      'Pre?o Custo';
    TFloatField(_cdsitemPedido.FieldByName('VCCI_Y')).DisplayWidth := 12;
    TFloatField(_cdsitemPedido.FieldByName('VCCI_Y')).DisplayFormat :=
      '##,###,##0.00';

    TIntegerField(_cdsitemPedido.FieldByName('NRVV_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('NRVV_Y')).DisplayLabel :=
      'Nr.Verba';
    TIntegerField(_cdsitemPedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel :=
      'Vlr. Marg. Padr?o';
    TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_PADRAO'))
      .DisplayWidth := 12;

    TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayFormat
      := '##,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayLabel
      := 'Vlr. Marg. Negociada';
    TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayWidth := 12;

    TStringField(_cdsitemPedido.FieldByName('ID_MARGEM')).DisplayLabel :=
      'Id Margem';
    TStringField(_cdsitemPedido.FieldByName('ID_MARGEM')).DisplayWidth := 06;

    TStringField(_cdsitemPedido.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayLabel := 'Id Desc. Acumul.';
    TStringField(_cdsitemPedido.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayWidth := 06;

    TFloatField(_cdsitemPedido.FieldByName('PC_VERBA')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedido.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(_cdsitemPedido.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(_cdsitemPedido.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(_cdsitemPedido.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(_cdsitemPedido.FieldByName('QT_BONIFICADA')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('QT_BONIFICADA')).DisplayLabel :=
      'Qtdade Bonif.';
    TIntegerField(_cdsitemPedido.FieldByName('QT_BONIFICADA'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedido.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedido.FieldByName('PC_BONIFICACAO')).DisplayLabel :=
      '% Bonifica??o';
    TFloatField(_cdsitemPedido.FieldByName('PC_BONIFICACAO'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedido.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedido.FieldByName('PC_DESCONTO_OL')).DisplayLabel :=
      '% Desc. OL';
    TFloatField(_cdsitemPedido.FieldByName('PC_DESCONTO_OL'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedido.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayFormat := '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayLabel := 'Cd Operador Log.';
    TIntegerField(_cdsitemPedido.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedido.FieldByName('CD_PRODUTO')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('CD_PRODUTO')).DisplayLabel :=
      'Cod. Prod.';
    TIntegerField(_cdsitemPedido.FieldByName('CD_PRODUTO')).DisplayWidth := 07;

    TStringField(_cdsitemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel
      := 'Nome';
    TStringField(_cdsitemPedido.FieldByName('NM_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsitemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayLabel := 'Apersenta??o';
    TStringField(_cdsitemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsitemPedido.FieldByName('DS_NIVEL_ECNM')).DisplayLabel :=
      'Tipo Produto';
    TStringField(_cdsitemPedido.FieldByName('DS_NIVEL_ECNM'))
      .DisplayWidth := 01;

    TIntegerField(_cdsitemPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat
      := '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel :=
      'Nr. Dias Estoque';
    TIntegerField(_cdsitemPedido.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedido.FieldByName('QT_SUGERIDA')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedido.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(_cdsitemPedido.FieldByName('QT_SUGERIDA')).DisplayWidth := 10;

    TFloatField(_cdsitemPedido.FieldByName('VL_MEDIA_VENDA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedido.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;

procedure T_frmCompras.SetNomeCampoItemPedidoSC;
begin
  if _cdsitemPedidoCDSC.Active then
  begin
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NROP_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NROP_Y')).DisplayLabel :=
      'Nr.Pedido';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NROP_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NROM_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NROM_Y')).DisplayLabel :=
      'Nr.Produto';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NROM_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QUAY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QUAY_Y')).DisplayLabel :=
      'Qtd. Pedido';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('CHEY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('CHEY_Y')).DisplayLabel :=
      'Qtd.Faturada';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('ABTY_Y')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('ABTY_Y')).DisplayLabel :=
      'Desc.Padr?o';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('ABTY_Y')).DisplayWidth := 06;

    TStringField(_cdsitemPedidoCDSC.FieldByName('SITY_Y')).DisplayLabel
      := 'Status';
    TStringField(_cdsitemPedidoCDSC.FieldByName('SITY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('PRZY_Y')).DisplayLabel
      := 'Prazo';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('PUNY_Y')).DisplayLabel :=
      'Pre?o Unit.';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PUNY_Y')).DisplayFormat :=
      '###,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PUNY_Y')).DisplayWidth := 12;
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PFBY_Y')).DisplayLabel :=
      'Pre?o Fornecedor';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PFBY_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('DADY_Y')).DisplayLabel :=
      'Desc. Adic.';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('DADY_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('DADY_Y')).DisplayWidth := 12;
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VCCI_Y')).DisplayLabel :=
      'Pre?o Custo';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VCCI_Y')).DisplayWidth := 12;
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VCCI_Y')).DisplayFormat :=
      '##,###,##0.00';

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NRVV_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NRVV_Y')).DisplayLabel :=
      'Nr.Verba';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MARGEM_PADRAO'))
      .DisplayFormat := '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel
      := 'Vlr. Marg. Padr?o';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MARGEM_PADRAO'))
      .DisplayWidth := 12;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayFormat := '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayLabel := 'Vlr. Marg. Negociada';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayWidth := 12;

    TStringField(_cdsitemPedidoCDSC.FieldByName('ID_MARGEM')).DisplayLabel :=
      'Id Margem';
    TStringField(_cdsitemPedidoCDSC.FieldByName('ID_MARGEM'))
      .DisplayWidth := 06;

    TStringField(_cdsitemPedidoCDSC.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayLabel := 'Id Desc. Acumul.';
    TStringField(_cdsitemPedidoCDSC.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_VERBA')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QT_BONIFICADA')).DisplayFormat
      := '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QT_BONIFICADA')).DisplayLabel
      := 'Qtdade Bonif.';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QT_BONIFICADA'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_BONIFICACAO')).DisplayLabel
      := '% Bonifica??o';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_BONIFICACAO'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_DESCONTO_OL')).DisplayLabel
      := '% Desc. OL';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('PC_DESCONTO_OL'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayFormat := '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayLabel := 'Cd Operador Log.';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('CD_PRODUTO')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('CD_PRODUTO')).DisplayLabel :=
      'Cod. Prod.';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('CD_PRODUTO'))
      .DisplayWidth := 07;

    TStringField(_cdsitemPedidoCDSC.FieldByName('NM_MERCADORIA')).DisplayLabel
      := 'Nome';
    TStringField(_cdsitemPedidoCDSC.FieldByName('NM_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsitemPedidoCDSC.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayLabel := 'Apersenta??o';
    TStringField(_cdsitemPedidoCDSC.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsitemPedidoCDSC.FieldByName('DS_NIVEL_ECNM')).DisplayLabel
      := 'Tipo Produto';
    TStringField(_cdsitemPedidoCDSC.FieldByName('DS_NIVEL_ECNM'))
      .DisplayWidth := 01;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayFormat := '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayLabel := 'Nr. Dias Estoque';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QT_SUGERIDA')).DisplayFormat
      := '#######0';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(_cdsitemPedidoCDSC.FieldByName('QT_SUGERIDA'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MEDIA_VENDA')).DisplayFormat
      := '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDSC.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;

procedure T_frmCompras.SetNomeCampoItemPedidoRS;
begin
  if _cdsitemPedidoCDRS.Active then
  begin
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NROP_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NROP_Y')).DisplayLabel :=
      'Nr.Pedido';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NROP_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NROM_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NROM_Y')).DisplayLabel :=
      'Nr.Produto';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NROM_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QUAY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QUAY_Y')).DisplayLabel :=
      'Qtd. Pedido';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('CHEY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('CHEY_Y')).DisplayLabel :=
      'Qtd.Faturada';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('ABTY_Y')).DisplayLabel :=
      'Desc.Padr?o';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('ABTY_Y')).DisplayWidth := 07;
    TFloatField(_cdsitemPedidoCDRS.FieldByName('ABTY_Y')).DisplayFormat
      := '##0.00';

    TStringField(_cdsitemPedidoCDRS.FieldByName('SITY_Y')).DisplayLabel
      := 'Status';
    TStringField(_cdsitemPedidoCDRS.FieldByName('SITY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('PRZY_Y')).DisplayLabel
      := 'Prazo';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('PUNY_Y')).DisplayLabel :=
      'Pre?o Unit.';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PUNY_Y')).DisplayFormat :=
      '###,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('PFBY_Y')).DisplayLabel :=
      'Pre?o Fornecedor';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PFBY_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('DADY_Y')).DisplayLabel :=
      'Desc. Adic.';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('DADY_Y')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('DADY_Y')).DisplayWidth := 07;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('VCCI_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VCCI_Y')).DisplayLabel :=
      'Pre?o Custo';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VCCI_Y')).DisplayWidth := 12;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NRVV_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NRVV_Y')).DisplayLabel :=
      'Nr.Verba';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MARGEM_PADRAO'))
      .DisplayFormat := '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel
      := 'Vlr. Marg. Padr?o';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MARGEM_PADRAO'))
      .DisplayWidth := 12;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayFormat := '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayLabel := 'Vlr. Marg. Negociada';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayWidth := 12;

    TStringField(_cdsitemPedidoCDRS.FieldByName('ID_MARGEM')).DisplayLabel :=
      'Id Margem';
    TStringField(_cdsitemPedidoCDRS.FieldByName('ID_MARGEM'))
      .DisplayWidth := 06;

    TStringField(_cdsitemPedidoCDRS.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayLabel := 'Id Desc. Acumul.';
    TStringField(_cdsitemPedidoCDRS.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayWidth := 06;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_VERBA')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QT_BONIFICADA')).DisplayFormat
      := '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QT_BONIFICADA')).DisplayLabel
      := 'Qtdade Bonif.';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QT_BONIFICADA'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_BONIFICACAO')).DisplayLabel
      := '% Bonifica??o';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_BONIFICACAO'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_DESCONTO_OL')).DisplayLabel
      := '% Desc. OL';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('PC_DESCONTO_OL'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayFormat := '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayLabel := 'Cd Operador Log.';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('CD_PRODUTO')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('CD_PRODUTO')).DisplayLabel :=
      'Cod. Prod.';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('CD_PRODUTO'))
      .DisplayWidth := 07;

    TStringField(_cdsitemPedidoCDRS.FieldByName('NM_MERCADORIA')).DisplayLabel
      := 'Nome';
    TStringField(_cdsitemPedidoCDRS.FieldByName('NM_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsitemPedidoCDRS.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayLabel := 'Apersenta??o';
    TStringField(_cdsitemPedidoCDRS.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsitemPedidoCDRS.FieldByName('DS_NIVEL_ECNM')).DisplayLabel
      := 'Tipo Produto';
    TStringField(_cdsitemPedidoCDRS.FieldByName('DS_NIVEL_ECNM'))
      .DisplayWidth := 01;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayFormat := '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayLabel := 'Nr. Dias Estoque';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QT_SUGERIDA')).DisplayFormat
      := '#######0';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(_cdsitemPedidoCDRS.FieldByName('QT_SUGERIDA'))
      .DisplayWidth := 10;

    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MEDIA_VENDA')).DisplayFormat
      := '##,###,##0.00';
    TFloatField(_cdsitemPedidoCDRS.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;

procedure T_frmCompras.SetNomeCampoItemPrePedido;
begin
  if _cdsPrePedido.Active then
  begin
    TIntegerField(_cdsPrePedido.FieldByName('NROP_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('NROP_Y')).DisplayLabel :=
      'Nr.Pedido';
    TIntegerField(_cdsPrePedido.FieldByName('NROP_Y')).DisplayWidth := 06;

    TIntegerField(_cdsPrePedido.FieldByName('NROM_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('NROM_Y')).DisplayLabel :=
      'Nr.Produto';
    TIntegerField(_cdsPrePedido.FieldByName('NROM_Y')).DisplayWidth := 06;

    TIntegerField(_cdsPrePedido.FieldByName('QUAY_Y')).DisplayFormat := '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('QUAY_Y')).DisplayLabel :='Qtd. Pedido';
    TIntegerField(_cdsPrePedido.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsPrePedido.FieldByName('CHEY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('CHEY_Y')).DisplayLabel :=
      'Qtd.Faturada';
    TIntegerField(_cdsPrePedido.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(_cdsPrePedido.FieldByName('ABTY_Y')).DisplayLabel :='Desc.Padr?o';
    TFloatField(_cdsPrePedido.FieldByName('ABTY_Y')).DisplayWidth := 07;
    TFloatField(_cdsPrePedido.FieldByName('ABTY_Y')).DisplayFormat := '##0.00';

    TStringField(_cdsPrePedido.FieldByName('SITY_Y')).DisplayLabel := 'Status';
    TStringField(_cdsPrePedido.FieldByName('SITY_Y')).DisplayWidth := 06;

    TIntegerField(_cdsPrePedido.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(_cdsPrePedido.FieldByName('PRZY_Y')).DisplayLabel := 'Prazo';
    TIntegerField(_cdsPrePedido.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(_cdsPrePedido.FieldByName('PUNY_Y')).DisplayLabel :='Pre?o Unit.';
    TFloatField(_cdsPrePedido.FieldByName('PUNY_Y')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(_cdsPrePedido.FieldByName('VT_ITEM')).DisplayLabel :='Total Item';
    TFloatField(_cdsPrePedido.FieldByName('VT_ITEM')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('VT_ITEM')).DisplayWidth := 12;


    TFloatField(_cdsPrePedido.FieldByName('PFBY_Y')).DisplayLabel :=
      'Pre?o Fornecedor';
    TFloatField(_cdsPrePedido.FieldByName('PFBY_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(_cdsPrePedido.FieldByName('DADY_Y')).DisplayLabel :=
      'Desc. Adic.';
    TFloatField(_cdsPrePedido.FieldByName('DADY_Y')).DisplayFormat := '##0.00';
    TFloatField(_cdsPrePedido.FieldByName('DADY_Y')).DisplayWidth := 07;

    TFloatField(_cdsPrePedido.FieldByName('VCCI_Y')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('VCCI_Y')).DisplayLabel :=
      'Pre?o Custo';
    TFloatField(_cdsPrePedido.FieldByName('VCCI_Y')).DisplayWidth := 12;

    TIntegerField(_cdsPrePedido.FieldByName('NRVV_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('NRVV_Y')).DisplayLabel :=
      'Nr.Verba';
    TIntegerField(_cdsPrePedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(_cdsPrePedido.FieldByName('VL_MARGEM_PADRAO')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel :=
      'Vlr. Marg. Padr?o';
    TFloatField(_cdsPrePedido.FieldByName('VL_MARGEM_PADRAO'))
      .DisplayWidth := 12;

    TFloatField(_cdsPrePedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayFormat
      := '##,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayLabel
      := 'Vlr. Marg. Negociada';
    TFloatField(_cdsPrePedido.FieldByName('VL_MARGEM_NEGOCIADA'))
      .DisplayWidth := 12;

    TStringField(_cdsPrePedido.FieldByName('ID_MARGEM')).DisplayLabel :=
      'Id Margem';
    TStringField(_cdsPrePedido.FieldByName('ID_MARGEM')).DisplayWidth := 06;

    TStringField(_cdsPrePedido.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayLabel := 'Id Desc. Acumul.';
    TStringField(_cdsPrePedido.FieldByName('ID_DESCONTO_ACUMULATIVO'))
      .DisplayWidth := 06;

    TFloatField(_cdsPrePedido.FieldByName('PC_VERBA')).DisplayFormat :=
      '##0.00';
    TFloatField(_cdsPrePedido.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(_cdsPrePedido.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(_cdsPrePedido.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(_cdsPrePedido.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(_cdsPrePedido.FieldByName('QT_BONIFICADA')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('QT_BONIFICADA')).DisplayLabel :=
      'Qtdade Bonif.';
    TIntegerField(_cdsPrePedido.FieldByName('QT_BONIFICADA'))
      .DisplayWidth := 10;

    TFloatField(_cdsPrePedido.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsPrePedido.FieldByName('PC_BONIFICACAO')).DisplayLabel :=
      '% Bonifica??o';
    TFloatField(_cdsPrePedido.FieldByName('PC_BONIFICACAO')).DisplayWidth := 10;

    TFloatField(_cdsPrePedido.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(_cdsPrePedido.FieldByName('PC_DESCONTO_OL')).DisplayLabel :=
      '% Desc. OL';
    TFloatField(_cdsPrePedido.FieldByName('PC_DESCONTO_OL')).DisplayWidth := 10;

    TIntegerField(_cdsPrePedido.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayFormat := '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayLabel := 'Cd Operador Log.';
    TIntegerField(_cdsPrePedido.FieldByName('NR_OPERADOR_LOGISTICO'))
      .DisplayWidth := 10;

    TIntegerField(_cdsPrePedido.FieldByName('CD_PRODUTO')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('CD_PRODUTO')).DisplayLabel :=
      'Cod. Prod.';
    TIntegerField(_cdsPrePedido.FieldByName('CD_PRODUTO')).DisplayWidth := 07;

    TStringField(_cdsPrePedido.FieldByName('NM_MERCADORIA')).DisplayLabel
      := 'Nome';
    TStringField(_cdsPrePedido.FieldByName('NM_MERCADORIA')).DisplayWidth := 17;

    TStringField(_cdsPrePedido.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayLabel := 'Apersenta??o';
    TStringField(_cdsPrePedido.FieldByName('DS_APRESENTACAO_MERCADORIA'))
      .DisplayWidth := 17;

    TStringField(_cdsPrePedido.FieldByName('DS_NIVEL_ECNM')).DisplayLabel :=
      'Tipo Produto';
    TStringField(_cdsPrePedido.FieldByName('DS_NIVEL_ECNM')).DisplayWidth := 01;

    TIntegerField(_cdsPrePedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel :=
      'Nr. Dias Estoque';
    TIntegerField(_cdsPrePedido.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(_cdsPrePedido.FieldByName('QT_SUGERIDA')).DisplayFormat :=
      '#######0';
    TIntegerField(_cdsPrePedido.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(_cdsPrePedido.FieldByName('QT_SUGERIDA')).DisplayWidth := 10;

    TFloatField(_cdsPrePedido.FieldByName('VL_MEDIA_VENDA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(_cdsPrePedido.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;

function T_frmCompras.CalculoMediaNovo(nrProduto, nrfrequencia
  : Integer): Double;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT Round(Avg(qt_venda_diaria),3) as VL_MEDIA');
    tempQuery.SQL.Add('FROM (SELECT DAEE_E,qt_venda_diaria,');
    tempQuery.SQL.Add('QT_ESTOQUE_DISPONIVEL_VENDA');
    tempQuery.SQL.Add('FROM PRDDM.DCEST');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('DAEE_E>=SYSDATE - 200');
    tempQuery.SQL.Add('AND NROM_E= :PnrProduto');
    tempQuery.SQL.Add('ORDER BY DAEE_E DESC)');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ROWNUM<=:PnrFrenquencia');
    tempQuery.SQL.Add('AND  QT_ESTOQUE_DISPONIVEL_VENDA>0');
    tempQuery.SQL.Add('AND To_Char(DAEE_E,''D'')<>7');
    tempQuery.SQL.Add('AND To_Char(DAEE_E,''D'')<>1');
    tempQuery.SQL.Add('AND DAEE_E NOT IN (SELECT DATD_D');
    tempQuery.SQL.Add('FROM PRDDM.DCDIA ');
    tempQuery.SQL.Add('WHERE TIPD_D=''F''');
    tempQuery.SQL.Add
      ('AND DATD_D>=(SELECT add_MONTHS(trunc(sysdate,''year''),0)');
    tempQuery.SQL.Add('ano FROM dual))');
    with tempQuery do
    begin
      close;

      Params.ParamByName('PnrProduto').AsInteger := nrProduto;

      Params.ParamByName('PnrFrenquencia').AsInteger := nrfrequencia;
      open;
    end;
    result := 0;
    if not tempQuery.isEmpty then
      result := tempQuery.FieldByName('VL_MEDIA').AsFloat;
  finally
    FreeAndNil(tempQuery);
  end;
end;

procedure T_frmCompras.SetPrecoSC;
begin

  // if _frmPrecoDesconto.exActive then
  // begin
  _frmPrecoDesconto._lbePrecoFornecedorSC.Text :=
    FormatFloat('###,##0.00', precoLista.vlPrecoLista);
  _frmPrecoDesconto._lbeDescontorepasseSC.Text :=
    FormatFloat('###,##0.00', pcDescontoRepasse);
  _frmPrecoDesconto._lbeDescontoPadraoSC.Text :=
    FormatFloat('###,##0.00', pcDescontoPadrao);

  _frmPrecoDesconto._lbeDescontoAdicionalSC.Text :=
    FormatFloat('###,##0.00', pcDescontoADicional);
  _frmPrecoDesconto._lbePrecoNotaSC.Text := FormatFloat('###,##0.00',
    CalculoPreco.vlPrecoLiquido);

  _frmPrecoDesconto._lbeValorCreditoIcmsSC.Text :=
    FormatFloat('###,##0.00', CalculoPreco.vlCreditoIcmsCompra);
  _frmPrecoDesconto._lbePrecoCustoSC.Text :=
    FormatFloat('###,##0.00', vlPrecoCusto);
  _frmPrecoDesconto._lbeValorVerbaSC.Text :=
    FormatFloat('###,##0.00', 0);



  // end;

end;

procedure T_frmCompras.MostraHistoricodePedidoRS(nrLaboratorio,
  nrProduto: Integer; idHistorico: Boolean);
begin

  if (_gbHistoricoPedido.Visible) then
  begin
    _gbDadosCompras.Visible := true;
    _gbHistoricoPedido.Visible := false;
    _gbHistoricoPedido.SendToBack;

    exit;
  end;
  if (_gbDadosCompras.Visible) and (idHistorico) then
  begin
    _gbDadosCompras.Visible := false;
    _gbHistoricoPedido.Visible := true;
    Chart2.Title.Text[0] := 'Historico Estoque RS';
    MontaGraficoPedidos(idPedido, _cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, qtEstoqueMaximo, qtEstoqueMinimo, 0);
    _gbHistoricoPedido.BringToFront;

  end;
end;

procedure T_frmCompras.MostraHistoricodePedidoSC(nrLaboratorio,
  nrProduto: Integer; idHistorico: Boolean);
begin

  if (_gbHistoricoPedido.Visible) then
  begin
    _gbDadosCompras.Visible := true;
    _gbHistoricoPedido.Visible := false;
    _gbHistoricoPedido.SendToBack;

    exit;
  end;
  if (_gbDadosCompras.Visible) and (idHistorico) then
  begin
    _gbDadosCompras.Visible := false;
    _gbHistoricoPedido.Visible := true;
    Chart2.Title.Text[0] := 'Historico Estoque SC';
    MontaGraficoPedidos(idPedido, _cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, qtEstoqueMaximo, qtEstoqueMinimo, 0);
    _gbHistoricoPedido.BringToFront;

  end;
end;

procedure T_frmCompras.SetCamposSugestaoIdeal(vlSugest?oIdealSC,
  vlSugest?oIdealRS: Double);
begin

  _lbeSugestaoIdealSC.Text := FormatFloat('###,###,##0', vlSugest?oIdealSC);
  _lbeSugestaoIdealRS.Text := FormatFloat('###,###,##0', vlSugest?oIdealRS);
  _lbeSugestaoIdealEmpresa.Text := FormatFloat('###,###,##0',
    vlSugest?oIdealSC + vlSugest?oIdealRS);
end;

procedure T_frmCompras.SetCamposSugestaoIdealGrid(vlSugest?oIdealGrid,
  vlSugest?oPossivelGrid: Double);
begin
  _lbeSugestaoIdealGrid.Text := FormatFloat('###,###,##0', vlSugest?oIdealGrid);
  _lbeSugestaoPossivelGrid.Text := FormatFloat('###,###,##0',
    vlSugest?oPossivelGrid);
  nrUnidadesPossivel := strtoint(FormatFloat('########0',
    vlSugest?oPossivelGrid));

end;

procedure T_frmCompras.SetCamposCaixaCamadaPaleteSC;
begin

  _edtCaixaSC.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
  _edtCamadaSC.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger);
  _edtPaleteSC.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger);

end;

procedure T_frmCompras.SetCamposCaixaCamadaPaleteGrid;
begin
  _edtQuantidadeCaixa.Text := FormatFloat('###,###,##0',_cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
  _edtQuantidadeCaixaCamadaGrid.Text := FormatFloat('###,###,##0', _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger *
    _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
  _edtQuantidadeCaixaPaleteGrid.Text := FormatFloat('###,###,##0', _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger *
    _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
  SetCoresDefaultCaixaCamadaPalete;
end;

procedure T_frmCompras.SetCamposCaixaCamadaEmpresa;
begin
  _edtCaixaEmpresa.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
  _edtCamadaEmpresa.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger);
  _edtPaleteEmpresa.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger);

end;

procedure T_frmCompras.SetCamposCaixaCamadaPaleteRS;
begin
  _edtCaixaRS.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
  _edtCamadaRS.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_CXA_CAMADA_LOGISTICO').AsInteger);
  _edtPaleteRS.Text := FormatFloat('###,###,##0',
    _cdsProduto.FieldByName('QT_CXA_PALETE_LOGISTICO').AsInteger);
end;

procedure T_frmCompras.SetCamposSugestaoPossivel(vlSugest?oPossivelSC,
  vlSugestaoPossivelRS: Double);
begin
  _lbeSugestaoPossivelSC.Text := FormatFloat('###,###,##0',
    vlSugest?oPossivelSC);
  _lbeSugestaoPossivelRS.Text := FormatFloat('###,###,##0',
    vlSugestaoPossivelRS);
  _lbeSugestaoPossivelEmpresa.Text := FormatFloat('###,###,##0',
    vlSugest?oPossivelSC + vlSugestaoPossivelRS);
end;

procedure T_frmCompras.SetCamposDiasEstoque(nrDiasEstoqueSC,
  nrDiasEstoqueRS: Double);
begin
  _lbeDiasEstoqueSC.Text := FormatFloat('###,###,##0', nrDiasEstoqueSC);
  _lbeDiasEstoqueRS.Text := FormatFloat('###,###,##0', nrDiasEstoqueRS);
  _lbeDiasEstoque.Text := FormatFloat('###,###,##0', nrDiasEstoqueSC);
  _lbeDiasEstoqueEmpresa.Text := FormatFloat('###,###,##0',
    nrDiasEstoqueSC + nrDiasEstoqueRS);
end;

procedure T_frmCompras.SetCamposQuantidaPedido(nrQtdpedidoSC,
  nrQtdpedidoRS: Double);
begin
  _lbeQuantidadePedidoSC.Text := FormatFloat('###,###,##0', nrQtdpedidoSC);
  _lbeQuantidadePedidoRS.Text := FormatFloat('###,###,##0', nrQtdpedidoRS);
  // _cedQtdadePedidoEmpresa.Text := FormatFloat('###,###,##0', nrQtdpedidoSC + nrQtdpedidoRS);
end;

procedure T_frmCompras.MontaGraficoVenda;
begin
  idMostraGrafico := 0;
  if (idPedido = 1) then
    MontaGraficodeVendasSCGrade(_cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  // MontaGraficodeVendasSC(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger);

  if (idPedido = 4) then
    // MontaGraficodeVendasRS(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger);
    MontaGraficodeVendasSCGrade(_cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  if idPedido = 0 then
  begin
    // MontaGraficodeVendasSC(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger);
    // MontaGraficodeVendasRS(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger);
    MontaGraficodeVendasSCGrade(_cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

  end;

  setFocusQuantidadeCompras;

end;

procedure T_frmCompras.MontaGraficoVendaGrid;
var
  dtInicio, dtfinal: tdate;
begin
  if (idPedido = 1) then
    // MontaGraficodeVendasSC(_cdsProdutoCD_MERCADORIA.AsInteger);
    MontaGraficodeVendasSCGrade(_cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

  if (idPedido = 4) then
    // MontaGraficodeVendasRS(_cdsProdutoCD_MERCADORIA.AsInteger);
    MontaGraficodeVendasSCGrade(_cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  if idPedido = 0 then
  begin
    // MontaGraficodeVendasSC(_cdsProdutoCD_MERCADORIA.AsInteger);
    // MontaGraficodeVendasRS(_cdsProdutoCD_MERCADORIA.AsInteger);
    MontaGraficodeVendasSCGrade(_cdsProduto.FieldByName('CD_MERCADORIA')
      .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

  end;
  if _chkUltimosPrecosCompra.Checked then
  begin
    dtInicio := strtodate(FormatDateTime('01/mm/yyyy',
      IncMonth(dtPedido, -12)));
    dtfinal := strtodate(FormatDateTime('dd/mm/yyyy', dtPedido));
    _cdsUltimosPrecos := GetUltimosPrecos
      (_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, dtInicio, dtfinal);
    if _cdsUltimosPrecos <> nil then
    begin
      SetGraficoPreco;
    end;
  end;


  // setFocusQuantidadeCompras;

end;

procedure T_frmCompras.SetDadosPedidoEntrada;
begin

  idPrecoAtualDesconto := idprecoAtual;

  _frmPrecoDesconto._cbxListaPreco.ItemIndex := 0;
  if idprecoAtual = 'N' then
    _frmPrecoDesconto._cbxListaPreco.ItemIndex := 1;

  idTipoPedidoPreco := idPedido;

  nrprodutoPreco := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
  dsUnidadeFederacao := idUnidadeFederacao;
  nrPedidoSCDesconto := NrPedidoSC;
  nrPedidoRSDesconto := NrPedidoRS;
  nrQuantidadepedidoSC :=
    StrToIntDef(FormatFloat('#####0', nrQuantidadepedidoSC), 0);

end;

procedure T_frmCompras.SetDadosPedidoSaida;
begin

  NrPedidoSC := nrPedidoSCDesconto;
  NrPedidoRS := nrPedidoRSDesconto;
  idprecoAtual := 'N';
  idDigitaPrecoNotaCompra := idDigitaPrecoNota;
  if _frmPrecoDesconto._cbxListaPreco.ItemIndex = 0 then
    idprecoAtual := 'S';
  NrPedidoSC := nrPedidoSCDesconto;
  NrPedidoRS := nrPedidoRSDesconto;

end;

procedure T_frmCompras.SetCorEstoqueSC;
begin
  _lbeEstoqueSC.Color := clMenu;
  _lbeEstoqueSC.Font.Color := clBlack;
  _lbeEstoqueSC.ShowHint := false;
  IF (_cdsProduto.FieldByName('QT_VENCIDO').AsInteger + _cdsProduto.FieldByName
    ('QT_RESERVA_PROBLEMATICA').AsInteger) > 0 then
  begin
    _lbeEstoqueSC.ShowHint := true;
    _lbeEstoqueSC.Color := clRed;
    _lbeEstoqueSC.Font.Color := clWhite;
    _lbeEstoqueSC.Hint :=
      ('Estoque     = ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger), 5) + #13 +
      'Res.Pedido  = ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('QT_RESERVADO').AsInteger), 5) + #13 +
      'Res.Vencido = ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('QT_VENCIDO').AsInteger), 5) + #13 +
      'Res.Problem.= ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger), 5));

  end;
end;

procedure T_frmCompras.SetCorEstoqueRS;
begin
  _lbeEstoqueRS.Color := clMenu;
  _lbeEstoqueRS.Font.Color := clBlack;
  _lbeEstoqueRS.ShowHint := false;
  IF (_cdsProduto.FieldByName('QT_VENCIDO').AsInteger + _cdsProduto.FieldByName
    ('QT_RESERVA_PROBLEMATICA').AsInteger) > 0 then
  begin
    _lbeEstoqueSC.ShowHint := true;
    _lbeEstoqueSC.Color := clRed;
    _lbeEstoqueSC.Font.Color := clWhite;
    _lbeEstoqueSC.Hint :=
      ('Estoque     = ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger), 5) + #13 +
      'Res.Pedido  = ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('QT_RESERVADO').AsInteger), 5) + #13 +
      'Res.Vencido = ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('QT_VENCIDO').AsInteger), 5) + #13 +
      'Res.Problem.= ' + AnsiLeftStr(FormatFloat('###,###,##0',
      _cdsProduto.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger), 5));

  end;

end;

procedure T_frmCompras.setFocusQuantidadeCompras;
var
  nrPosicaoInicio: Integer;
begin
  if _pgcCompras.ActivePage = _tbsCompras1 then
  begin
    if (idPedido = 1) or (idPedido = 0) then
    begin
      if _lbeQuantidadePedidoSC.CanFocus then
        _lbeQuantidadePedidoSC.SetFocus;
      _lbeQuantidadePedidoSC.SelectAll;
    end;
    if (idPedido = 4) then
    begin
      if _lbeQuantidadePedidoRS.CanFocus then
        _lbeQuantidadePedidoRS.SetFocus;
      _lbeQuantidadePedidoRS.SelectAll;
    end;
  end;

  if _pgcCompras.ActivePage = _tbsCompras then
    SetFocuCursor(IdPosicaoCursor);

end;

function T_frmCompras.GravaItemPedidoNovo(nrPedido, nrQuantidaPedida,
  cdEmpresa: Integer): Integer;
var
  cdPrazoPagamento: Integer;
begin
  if nrPedido = 0 then
    nrPedido := GeraNumeroPedido('C');
  result := nrPedido;
  if (pcDescontoADicional = 0) and (nrQuantidadeComprada > 0) then
  begin
    cdPrazoPagamento := AbrePrazoParcelamento(inttostr(nrPrazoPedido), 1);
    cdPrazoPagamentoAudititoria := cdPrazoPagamento;
    idPedidoIniciado := true;
    GravaCapaPedido(nrPedido, // NROP_P,//  NUMBER(6)
      nrLaboratorioLocal, // LABP_P :Integer;// NUMBER(6)
      dtPedido, // DATP_P :Tdate;// DATE
      pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
      0, // DESP_P:Double;// NUMBER(5,2)
      'S', // SITP_P :String;//CHAR(1)
      nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
      dtPedido + nrLeadTime, // PREP_P          //DATE
      ' ', // CHAR(40)
      '0', // SNRP_P           //  CHAR(10)
      0, // FLAP_P ,         //NUMBER(1)
      cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
      nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
      strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
      dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
      'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
      cdoperadorLogisticoPedido,
      // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
      NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
      dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
      dtSistema, // DT_DIGITACAO :Tdate;//  DATE
      0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
      0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
      strtodate('01/01/2039'), nrCompradorPedido, cdEmpresa, 0, pcGeracaoVerba,
      nrGeracaoVerba,0);
    // DT_TRANSMITIDO :tdate):Boolean;

    PrazoSC(nrPrazoPedido);
    PrazoRS(nrPrazoPedido);

    AbreItemPedidoMultiEmpresa(nrPedido, 0, cdEmpresa, '');
    AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
    AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
    SetNomeCampoItemPedido;
  end;
  if pcDescontoADicional = 0 then
    GravaItem(nrPedido, _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
      nrQuantidadeComprada, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

end;

procedure T_frmCompras.AbreTelaPreco;
begin
  _frmPrecoDesconto := T_frmPrecoDesconto.Create(self);
  SetPrecoSC;
  SetDadosPedidoEntrada;
  idDigitaPrecoNota := idDigitaPrecoNotaCompra;
  _frmPrecoDesconto.ShowModal;

  SetDadosPedidoSaida;
  _frmPrecoDesconto.Free;
  _frmPrecoDesconto := NIL;
end;

procedure T_frmCompras.SetVendasLaboratorioCD(nrProduto, nrEmpresa,
  nrRegistro: Integer; idCurva: String);
var
  nrQtdadeEmbalagemCompra, nrQtdadeEstoque, nrUnidadeVendaMes: Integer;
  vlSugestaoIdeal, VlsugestaoLocal, vlCompradorLocal,
    pcDescontoAdicionalPre: Double;
  nrSusgestaoPossivel, nrDiasCoberturaEstoquePendencia,
    nrCoberturaEstoqueLocal: Integer;
  idCD: String[02];
  nrExcessoTemp, vlVerba, pcDescontoVerbaIncioLocal: Double;
  ValorEstoqueMercadoria: TValorEstoqueMercadoria;
  nrPedidoLocal, nrCodCotacao, vlPeLocal, nrDiasAposCompra, QtdCamada,
    QtdPalete, nrQuantidadeRejeitada, NrVerbaIncialLocal: Integer;
  DadosSugestao: TDadosQtdadeSugestao;
  pcCreditoICMS, pcIPILista: Double;
  idTermoLabil: String[1];

begin
  _nrEmpresa    := nrEmpresa;
  nrProduto     := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;

  QtdCamada    := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  QtdPalete    := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
  idTermoLabil := _cdsProduto.FieldByName('ID_REFRIGERADO').AsString;

  if Mercadoria <> nil then
    Mercadoria := nil;

  Mercadoria := DadosProdutos(nrProduto, _nrEmpresa, cdoperadorLogisticoPedido);
  nrQtdadeEstoque     := Mercadoria.qtEstoque;
  nrQuantidadeEstoque := Mercadoria.qtEstoque;
  vlPrecoLista := 0;
  nrDiasAposCompra := 0;
  // precoLista     := GetListaprecoNova(_cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, pcIndicePrecoSC, 1, nrProduto,1, idprecoAtual, dtPedido);
  precoLista := GetPrecoItem(nrProduto, nrEmpresa,
    _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, 1, 'N',
    idPedidoBloqueado, nrListaPreco);

  if (NrPedidoSC = 0) and (nrEmpresa = 1) then
    CriaCapaPedido(nrEmpresa);
  if (NrPedidoRS = 0) and (nrEmpresa = 4) then
    CriaCapaPedido(nrEmpresa);

  if nrEmpresa = 1 then
    nrPedidoLocal := NrPedidoSC;
  if nrEmpresa = 4 then
    nrPedidoLocal := NrPedidoRS;

  pcCreditoICMS := Mercadoria.pcCreditoICMS;
  pcIPILista := precoLista.pcIPILista;
  if (precoLista.PcIcmsCompra > 0) and
    (dtSistema >= strtodate('01/12/2016')) then
    pcCreditoICMS := precoLista.PcIcmsCompra;

  if nrEmpresa = 1 then
    vlPeLocal := NrDiasCompraSC;
  if nrEmpresa = 4 then
    vlPeLocal := NrDiasCompraRS;
  pcDescontoAdicionalPre := 0;

  if precoLista.PcDescontoLista > 0 then
  begin
    pcDescontoADicional := precoLista.PcDescontoLista;
    nrVerbaDigitada := precoLista.nrVerba;
    nrVerba := precoLista.nrVerba;
    nrVerbaInicio := precoLista.nrVerba;
    pcDescontoAdicionalPre := pcDescontoADicional;
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0', nrVerba);
  end;

  if _chkUltimoDesconto.Checked then
    pcDescontoAdicionalPre := getUltimoDesconto(_cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger, nrProduto,
                                         nrEmpresa, cdoperadorLogisticoPedido);

  PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista,
                                   Mercadoria.vlPrecoVenda,
                                   Mercadoria.pcRepasseCompra,
                                   Mercadoria.pcDescontoPadrao,
                                   pcDescontoAdicionalPre,
                                   Mercadoria.pcCreditoICMS,
                                   Mercadoria.pcIpiProduto,
                                   precoLista.pcIPILista,
                                   precoLista.pcReajustePreco,
                                   1,
                                   precoLista.nrListaPreco,
                                   'N',
                                   Mercadoria.idForcaRepasse,
                                   Mercadoria.idIpiLiquidoComRepasse,
                                   Mercadoria.idIpiLiquidoSemRepasse,
                                   Mercadoria.idIpiBrutoComRepasse,
                                   Mercadoria.idIpiBrutoSemRepasse,
                                   Mercadoria.idTipoListaFiscal,
                                   DadosFornecedor.idUnidadeFederacao,
                                   Mercadoria.idSuperfulo,
                                   Mercadoria.idIcmDestacado,
                                   Mercadoria.idReduzIcms,
                                   Mercadoria.idPisCofins);

  if nrVerba > 0 then
  begin
    vlVerba := CalculaPcVerba(pcVerba,
                              PrecoItem.vlVerba,
                              PrecoItem.vlPrecoCusto,
                              Mercadoria.pcIpiProduto,
                              0,
                              Mercadoria.pcCreditoICMS,
                              Mercadoria.nrProduto,
                              Mercadoria.nrTipoProduto,
                              nrQuantidadeComprada,
                              Mercadoria.nrLaboratorio,
                              Mercadoria.idPis);
  end;

  vlPrecoLista := precoLista.vlPrecoLista;
  nrQtdadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;

  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);
  qtPendenteItem := DadosPendencia.QtPendente;

  // setParamentroCompra(vlPeLocal,idCurva[1]);
  setParamentroItemCurvaCompra(nrEmpresa, // PnrEmpresa,
                               vlPeLocal, // PnrDiasEstoque:Integer;
                               idCurva[1]); // idCurva: Char)

  vlMediaDia := CalculaMediaProduto(nrProduto, nrEmpresa);

  ValorEstoqueMercadoria := GetValorFinanceiroEstoque(nrProduto, nrEmpresa);

  // MercadoriaEstoqueLocal:=GetEstoque(nrProduto,nrEmpresa);
  // nrQtdadeEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  { if MercadoriaEstoqueLocal<>nil then
    nrQtdadeEstoque      :=MercadoriaEstoqueLocal.nrQuantidadeEstoque; }

  // MercadoriaEstoque := GetEstoque(nrProduto, nrEmpresa);
  // Mercadoria:=GetMercadoriaNova(nrProduto,nrDigitoPreco,0,nrEmpresa,nrOPeradorLogistico);

  pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
  nrGeracaoVerba := Mercadoria.nrGeracaoVerba;

  idInativo := Mercadoria.idSituacaoMercadoriaEstoque;
  nrQtdadeEstoque := Mercadoria.qtEstoque;

  nrLeadTime := SetLeadTime(nrEmpresa, idTermoLabil);

  DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque,
                                        nrDiasAntecipacao,
                                        nrLeadTime,
                                        vlMediaDia,
                                        nrQtdadeEstoque,
                                        qtPendenteItem);

  vlSugestaoIdeal := DadosSugestao.nrQtdSugeridaRejeitada;
  nrSusgestaoPossivel := 0;

  if nrQtdadeEmbalagemCompra > 0 then
    nrSusgestaoPossivel :=strtoint(FormatFloat('########0',
                                               vlSugestaoIdeal /nrQtdadeEmbalagemCompra));
  nrSusgestaoPossivel := nrSusgestaoPossivel * nrQtdadeEmbalagemCompra;
  nrUnidadeVendaMes := strtoint(FormatFloat('########0', qtVendaMes[13]));

{  if nrSusgestaoPossivel > 0 then
    nrSusgestaoPossivel := SetQuantidadePaleteCamada(nrSusgestaoPossivel,// PqtPedido,
                                                     nrQtdadeEmbalagemCompra, // PqtEmbalagem,
                                                     QtdCamada, // PqtCamada,
                                                     QtdPalete, // PqtPalete,
                                                     nrParamentoEstoque + nrLeadTime, // PDiasEstoque: Integer;
                                                     nrQtdadeEstoque + qtPendenteItem,
                                                     vlMediaDia, // PvlMediaDia:Double
                                                     0,0,Mercadoria.idCurva);}
  nrQuantidadeRejeitada := nrSusgestaoPossivel;
  if (DadosSugestao.nrQtdSugerida = 0) and
    (DadosSugestao.nrQtdSugeridaRejeitada > 0) then
  begin
    nrSusgestaoPossivel := 0;
    nrQuantidadeRejeitada := StrToIntDef(FormatFloat('0000000', nrQuantidadeRejeitada), 0);
  end;
  idCD := 'SC';

  if vlMediaDia > 0 then
     nrDiasAposCompra := StrToIntDef(FormatFloat('########0',
                                    (nrSusgestaoPossivel + nrQtdadeEstoque + qtPendenteItem) /vlMediaDia), 0);

  if (nrEmpresa = 1) and (Mercadoria.idSituacaoMercadoriaCompra ='A') then
  begin
    if NrAuditoriaSC = 0 then
      NrAuditoriaSC := Incrementa('PRDDM.DC_ITEM_AUDITORIA_COMPRA',    'CD_AUDITORIA');

    nrPedidoLocal := NrPedidoSC;
    nrCodCotacao := NrAuditoriaSC;
    nrUnidadesSugeridaSC    := nrUnidadesSugeridaSC + nrSusgestaoPossivel;
    vlSugeridoSC            := vlSugeridoSC + (nrSusgestaoPossivel * precoLista.vlPrecoLista);
    VlsugestaoLocal         := (nrSusgestaoPossivel * precoLista.vlPrecoLista);
    vlCompradoSC            := nrQuantidadeComprada * precoLista.vlPrecoLista;
    nrExcessoTemp           := (CoberturaEstoqueDia(nrQtdadeEstoque, 0, vlMediaDia));
    nrCoberturaEstoqueLocal := strtoint(FormatFloat('00000', nrExcessoTemp));
    nrExcessoTemp           := (nrExcessoTemp - qtEstoqueMaximo) * vlMediaDia;
    if nrExcessoTemp < 1 then
      nrExcessoTemp := 0;
    nrUnidadesExcessoCDSC := nrUnidadesExcessoCDSC + (nrExcessoTemp);

    vlExcessoCustoCDSC     := vlExcessoCustoCDSC + (ValorEstoqueMercadoria.vtCustoFinanceiroUnitarioMercadoria *nrExcessoTemp);
    vlExcessoListaCDSC     := vlExcessoListaCDSC + (precoLista.vlPrecoLista * nrExcessoTemp);
    vlExcessoVendaCDSC     := vlExcessoVendaCDSC + (ValorEstoqueMercadoria.vlPrecoVendaMercadoria * nrExcessoTemp);;
    vlExcessoMtsCubicoCDSC := vlExcessoMtsCubicoCDSC +(_cdsProduto.FieldByName('MTS_CUBICO').AsFloat * nrExcessoTemp);

    vlSugeridaMtsCubicoSC := vlSugeridaMtsCubicoSC + (nrSusgestaoPossivel * _cdsProduto.FieldByName('MTS_CUBICO').AsFloat);
    vlSugeridoCustoSC := vlSugeridoCustoSC +(nrSusgestaoPossivel * _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat);
    vtSugeridoVendaSC := vtSugeridoVendaSC + (nrSusgestaoPossivel * _cdsProduto.FieldByName('VL_PRECO_VENDA').AsFloat);

    // nrUnidadesExcessoCDSC:=0;
  end;
  if (nrEmpresa = 4) and (Mercadoria.idSituacaoMercadoriaCompra = 'A') then
  begin
    idCD := 'RS';
    if NrAuditoriaRS = 0 then
      NrAuditoriaRS := Incrementa('PRDDM.DC_ITEM_AUDITORIA_COMPRA',
        'CD_AUDITORIA');

    nrCodCotacao := NrAuditoriaRS;

    nrExcessoTemp           := (CoberturaEstoqueDia(nrQtdadeEstoque, 0, vlMediaDia));
    nrCoberturaEstoqueLocal := strtoint(FormatFloat('00000', nrExcessoTemp));
    nrExcessoTemp           := (nrExcessoTemp - qtEstoqueMaximo) * vlMediaDia;
    if nrExcessoTemp < 0 then
      nrExcessoTemp := 0;

    nrUnidadesExcessoCDRS   := nrUnidadesExcessoCDRS + nrExcessoTemp;
    // vlExcessoCustoCDRS   := vlExcessoCustoCDRS + (precoLista.vlPrecoLista * nrExcessoTemp);
    if ValorEstoqueMercadoria <> nil then
    begin
      vlExcessoCustoCDRS := vlExcessoCustoCDRS +(ValorEstoqueMercadoria.vtCustoFinanceiroUnitarioMercadoria *nrExcessoTemp);
      vlExcessoListaCDRS := vlExcessoListaCDRS +(precoLista.vlPrecoLista * nrExcessoTemp);
      vlExcessoVendaCDRS := vlExcessoVendaCDRS +(ValorEstoqueMercadoria.vlPrecoVendaMercadoria * nrExcessoTemp);;
      vlExcessoMtsCubicoCDRS := vlExcessoMtsCubicoCDRS +(_cdsProduto.FieldByName('MTS_CUBICO').AsFloat * nrExcessoTemp);
      nrUnidadesSugeridaRS   := nrUnidadesSugeridaRS + nrSusgestaoPossivel;
      vlSugeridoRS           := vlSugeridoRS +(nrSusgestaoPossivel * precoLista.vlPrecoLista);
      VlsugestaoLocal        := (nrSusgestaoPossivel * precoLista.vlPrecoLista);
      vlCompradoRS           := nrQuantidadeComprada * precoLista.vlPrecoLista;

      nrUnidadesSugeridaEmpresa := nrUnidadesSugeridaEmpresa + nrSusgestaoPossivel;
      vlSugeridoEmpresa         := vlSugeridoEmpresa + vlSugeridoRS;
      vlSugeridaMtsCubicoRS     := vlSugeridaMtsCubicoRS + (nrSusgestaoPossivel * _cdsProduto.FieldByName('MTS_CUBICO').AsFloat);
      vlSugeridoCustoRS         := vlSugeridoCustoRS + (nrSusgestaoPossivel * _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat);
      vtSugeridoVendaRS         := vtSugeridoVendaRS + (nrSusgestaoPossivel * _cdsProduto.FieldByName('VL_PRECO_VENDA').AsFloat);

    end;
  end;
  VlsugestaoLocal := (nrSusgestaoPossivel * precoLista.vlPrecoLista);

  pcDescontoVerbaIncioLocal := 0;
  NrVerbaIncialLocal := 0;
  if (pcDescontoAdicionalPre > 0) and (nrVerbaInicio > 0) then
  begin
    pcDescontoVerbaIncioLocal := 100;
    NrVerbaIncialLocal := nrVerbaInicio;
    nrVerba := nrVerbaInicio;
    pcDescontoADicional := pcDescontoAdicionalPre;
    pcVerba := 100;
  end;


  nrDiasEstoqueAtual :=0;
      if vlMediaDia>0 then
         nrDiasEstoqueAtual := StrToIntDef(FormatFloat('0000000000',
                                                      (nrQuantidadeEstoque + qtPendenteItem+nrSusgestaoPossivel) / vlMediaDia), 0);

  if Mercadoria.idSituacaoMercadoriaCompra = 'A' then
  begin

   if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString='S' then
      nrSusgestaoPossivel:=0;

    CompraItemInicial(nrProduto, // PnrProduto,
      nrEmpresa, // ,
      nrSusgestaoPossivel, // PqtPedido: Integer;
      nrQuantidadeRejeitada,
      pcDescontoAdicionalPre);
    // PpcDescontoADicional: double)

    if nrEmpresa = 1 then
    begin
      nrPedidoLocal := NrPedidoSC;

    end;
    if nrEmpresa = 4 then
    begin
      nrPedidoLocal := NrPedidoRS;

    end;

    ManutencaoItemAuditoria(nrCodCotacao,
                            nrProduto,
                            nrSusgestaoPossivel,
                            0,
                            VlsugestaoLocal,
                            0,
                            qtPendenteItem,
                            nrQtdadeEstoque,
                            vlMediaDia,
                            nrCoberturaEstoqueLocal,
                            nrEmpresa,
                            nrPedidoLocal);



    // if nrEmpresa=1 then
    // begin
    if (Mercadoria.idSituacaoMercadoriaEstoque = 'A') and
      (nrQuantidadeComprada = 0)  then
    begin
        DadosItemPedidoLog := localizaItemPedido(nrPedidoLocal,
                                             Mercadoria.nrProduto,
                                             nrEmpresa);

    if nrDiasEstoqueAtual>999 then
       nrDiasEstoqueAtual:=999;
    if not DadosItemPedidoLog.idItemGravado then

      GravaItemPedidoAtual(nrPedidoLocal, // NUMBER(6)
        Mercadoria.nrProduto, // NROM_Y ,//NUMBER(6)
        nrSusgestaoPossivel, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
        PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrQuantidadeRejeitada, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        PrecoItem.pcMundancaPreco, nrEmpresa, pcCreditoICMS, pcIPILista);
    end;

    nrUnidadesSugeridaEmpresa := nrUnidadesSugeridaRS + nrUnidadesSugeridaSC;
    vlSugeridoEmpresa := vlSugeridoRS + vlSugeridoSC;

  end;
end;

procedure T_frmCompras.SpeedButton1Click(Sender: TObject);
begin
  nrProdutoUltimosPedido := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrEmpresaUltimoPedido := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  _frmUltimosPedidos := T_frmUltimosPedidos.Create(self);

  FormPos(_frmUltimosPedidos, 2, 1);

end;

procedure T_frmCompras.Timer1Timer(Sender: TObject);
begin
  Series9.Active := not Series9.Active;
end;

procedure T_frmCompras.SetVendasLaboratorio;
var
  nrReg: Integer;
  nrProduto, nrQtdadeEstoque, nrQtdadePendente, nrEmpresa: Integer;
  vlPrecoLista, vlDiasCoberturaEstoque, vlSusgestaoIdealEmpresa,
    vlSusgestaoIdealSC, vlSusgestaoIdealRS: Double;
  nrCorberturaEstoqueDia, nrDiferencaDias, qtExcesso: Double;
  nrMenorDiaPedido, nrDiaSemana, vlSusgestaoPossivel, nrQtadeEmbalagemCompra,
    nrSugestaoPossivel, nrDiasCoberturaEstoque, nrDiasCoberturaEstoquePendencia,
    nrQuantidadeEstoque, nrUnidadeVendaMes, nrSugestaoIdeal: Integer;

  DadosSugestao: TDadosQtdadeSugestao;

begin
  _cdsProduto.First;
  vlTotalEstoque := 0;
  nrUnidadesPendente := 0;
  nrUnidadesEstoque := 0;
  nrUnidadesExcesso := 0;
  nrUnidadesSugestao := 0;
  vlUnidadesPendente := 0;
  vlUnidadesExcesso := 0;
  vlUnidadesSugestao := 0;
  vlMtsCubicoEstoque := 0;
  vlUnidadesVendaMes := 0;
  vlMtsCubicoVendaMes := 0;
  nrUnidadesVendaMes := 0;
  vlUnidadesSugestao := 0;
  _cdsVendalaboratorio.filtered := false;
  nrReg := 0;

  while not _cdsProduto.eof do
  begin
    inc(nrReg);
    nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
    nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
    vlPrecoLista := 0;
    precoLista := GetListaprecoNova(_cdsProduto.FieldByName('VL_PRECO_COMPRA')
      .AsFloat, pcIndicePrecoSC, 1, nrProduto, 1, idprecoAtual, dtPedido);
    vlPrecoLista := precoLista.vlPrecoLista;

    nrQtdadeEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
    vlTotalEstoque := vlTotalEstoque + (nrQtdadeEstoque * vlPrecoLista);
    nrUnidadesEstoque := nrUnidadesEstoque + nrQtdadeEstoque;
    vlMtsCubicoEstoque := vlMtsCubicoEstoque + nrQtdadeEstoque *
      _cdsProduto.FieldByName('MTS_CUBICO').AsFloat;
    nrQtdadePendente := 0;
    _cdsVendalaboratorio.filtered := false;
    if _cdsVendalaboratorio.Locate('CD_MERCADORIA',
      VarArrayOf([nrProduto, 13]), []) then
    begin
      vlUnidadesVendaMes := vlUnidadesVendaMes +
        _cdsVendalaboratorio.FieldByName('NR_UNIDADES').AsInteger *
        vlPrecoLista;
      nrUnidadesVendaMes := nrUnidadesVendaMes +
        _cdsVendalaboratorio.FieldByName('NR_UNIDADES').AsInteger;
      vlMtsCubicoVendaMes := vlMtsCubicoVendaMes +
        _cdsVendalaboratorio.FieldByName('NR_UNIDADES').AsInteger *
        _cdsProduto.FieldByName('MTS_CUBICO').AsFloat;
    end;
    vlMediaDia := CalculaMediaProduto(nrProduto, nrEmpresa);
    vlMediaMesSC := (vlMediaDia * nrDiasSelecionados) / nrMesesSelecionados;

    setParamentroCompra(0, _cdsProduto.FieldByName('ID_CURVA_MERCADORIA')
      .AsString[1]);
    nrQtadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
      .AsInteger;

    // nrQtadeEmbalagemCompra := GetQuantidadeEmbalagem(nrProduto);
    vlDiasCoberturaEstoque := CoberturaEstoqueDia(nrQtdadeEstoque, 0,
      vlMediaDia);

    nrDiasCoberturaEstoque :=
      strtoint(StringReplace(FormatFloat('0000000000', vlDiasCoberturaEstoque),
      ',', '', [rfReplaceAll]));
    nrDiasCoberturaEstoqueAuditoria := nrDiasCoberturaEstoque;
    DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque, nrDiasAntecipacao,
      nrLeadTime, vlMediaDia, nrQtdadeEstoque, nrQtdadePendente);

    vlSusgestaoIdealSC := DadosSugestao.nrQtdSugerida;
    nrSugestaoIdeal := strtoint(FormatFloat('#########0',
      vlSusgestaoIdealEmpresa));
    nrDiasCoberturaEstoque :=
      strtoint(FormatFloat('#########0', vlDiasCoberturaEstoque));
    vlSusgestaoPossivel := 0;
    if nrQtadeEmbalagemCompra > 0 then
      vlSusgestaoPossivel :=
        strtoint(FormatFloat('########0', vlSusgestaoIdealSC /
        nrQtadeEmbalagemCompra));
    nrUnidadeVendaMes := strtoint(FormatFloat('########0', qtVendaMes[13]));
    nrDiasCoberturaEstoquePendencia :=
      strtoint(FormatFloat('########0', CoberturaEstoqueDia(nrQtdadeEstoque,
      qtPendenteItem, vlMediaDia)));

    nrQuantidadeEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;

    DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque, nrDiasAntecipacao,
      nrLeadTime, vlMediaDia, nrQtdadeEstoque, nrQtdadePendente);
    vlSusgestaoIdealRS := DadosSugestao.nrQtdSugerida;
    vlSusgestaoIdealEmpresa := vlSusgestaoIdealSC + vlSusgestaoIdealRS;
    vlSusgestaoPossivel := 0;
    if nrQtadeEmbalagemCompra > 0 then
      vlSusgestaoPossivel :=
        strtoint(FormatFloat('########0', vlSusgestaoIdealSC /
        nrQtadeEmbalagemCompra));
    vlSusgestaoPossivel := vlSusgestaoPossivel * nrQtadeEmbalagemCompra;
    qtExcesso := CalculodeExcesso(StrToIntDef(FormatFloat('0000000000',
      vlDiasCoberturaEstoque), 0), qtEstoqueMaximo, vlMediaDia);
    nrUnidadesExcesso := nrUnidadesExcesso + qtExcesso;
    vlUnidadesExcesso := vlUnidadesExcesso + qtExcesso * vlPrecoLista;
    vlMtsCubicoExcesso := vlMtsCubicoExcesso +
      (qtExcesso * _cdsProduto.FieldByName('MTS_CUBICO').AsFloat);
    vlUnidadesSugestao := vlUnidadesSugestao + vlSusgestaoPossivel *
      vlPrecoLista;
    nrUnidadesSugestao := nrUnidadesSugestao + vlSusgestaoPossivel;
    vlMtsCubicoSugestao := vlMtsCubicoSugestao +
      (vlSusgestaoPossivel * _cdsProduto.FieldByName('MTS_CUBICO').AsFloat);

    _stbCompras.Panels[1].Text := FormatFloat('000000',
      _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLET').AsString;
    _stbCompras.Panels[2].Text := 'Faltam --> ' + FormatFloat('000000',
      _cdsProduto.RecordCount - nrReg);
    _stbCompras.Refresh;

    Application.ProcessMessages;
    _cdsProduto.Next;
  end;
  _cdsProduto.First;
  _cdsProduto.First;

end;

function T_frmCompras.CriaGradeProduto: Boolean;
begin
  try
    if _cdsProduto.Active then
      _cdsProduto.close;
    _cdsProduto.CreateDataSet;
  except
    on E: Exception do
    begin
      trataerro(E.Message, 'Erro ao testa conex?o com a base...');
    end;
  end;
end;

procedure T_frmCompras._dbgGradeProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { if odd(_cdsProdutoNR_SEQUENCIA.AsInteger) then
    begin
    _dbgGradeProduto.Canvas.Font.Color := clBlack;
    _dbgGradeProduto.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
    _dbgGradeProduto.Canvas.Font.Color := clBlack;
    _dbgGradeProduto.Canvas.Brush.Color := clWhite;
    end;
    if ((TAuxDBGrid(_dbgGradeProduto).DataLink.ActiveRecord +
    1 = TAuxDBGrid(_dbgGradeProduto).Row) or (gdSelected in State)) then
    begin
    _dbgGradeProduto.Canvas.Brush.Color := clGreen;
    _dbgGradeProduto.Canvas.Font.Color := clWhite;
    end;

    { if (_cdsPedido.fieldByName('PC_MARGEM_ITEM').AsFloat < _cdsPedido.fieldByName
    ('PC_MARGEM_VENDA').AsFloat) and
    (_cdsPedido.fieldByName('PC_MARGEM_ITEM').AsFloat > 0) then
    begin
    _dbgPedido.Canvas.Font.Color := clBlack;
    _dbgPedido.Canvas.Brush.Color := clYellow;
    end;
    if (_cdsPedido.fieldByName('PC_MARGEM_ITEM').AsFloat < 0) then
    begin
    _dbgPedido.Canvas.Font.Color := clWhite;
    _dbgPedido.Canvas.Brush.Color := clRed;
    end; }
  { _dbgGradeProduto.Canvas.fillRect(Rect);
    _dbgGradeProduto.DefaultDrawDataCell(Rect, _dbgGradeProduto.columns[DataCol]
    .Field, State); }
end;

procedure T_frmCompras._dbgGradeProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nrProd: Integer;
begin
end;

procedure T_frmCompras._dbgListaPrecoDblClick(Sender: TObject);
begin
  if nrListaPreco > 0 then
  begin
    if Confirma('Deseja Realmente trocar nr. da Lista Pre?o?', MB_DEFBUTTON2)
      = IDYES then
      nrListaPreco := _cdsListaPrecoAtiva.FieldByName('NR_LISTA').AsInteger;
  end
  else
    nrListaPreco := _cdsListaPrecoAtiva.FieldByName('NR_LISTA').AsInteger;
end;

procedure T_frmCompras._dbgListaPrecoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // mude a cor das celulas em que valor = 0
  with _dbgDiasEstoque do
  begin
    if odd(_cdsDiasEstoque.RecNo) then
    begin
      _dbgDiasEstoque.Canvas.Font.Color := clBlack;
      _dbgDiasEstoque.Canvas.Brush.Color := clMoneyGreen;
    end
    else
    begin
      _dbgDiasEstoque.Canvas.Font.Color := clBlack;
      _dbgDiasEstoque.Canvas.Brush.Color := clWhite;
    end;

    defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmCompras._dbgPedidoRSDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 { if odd(_cdsitemPedidoCDRS.RecNo) then
  begin
    _dbgPedidoRS.Canvas.Font.Color := clBlack;
    _dbgPedidoRS.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgPedidoRS.Canvas.Font.Color := clBlack;
    _dbgPedidoRS.Canvas.Brush.Color := clWhite;
  end;
  if ((TAuxDBGrid(_dbgPedidoRS).DataLink.ActiveRecord +
    1 = TAuxDBGrid(_dbgPedidoRS).Row) or (gdSelected in State)) then
  begin
    _dbgPedidoRS.Canvas.Brush.Color := clGreen;
    _dbgPedidoRS.Canvas.Font.Color := clWhite;
  end;

  _dbgPedidoRS.Canvas.fillRect(Rect);
  _dbgPedidoRS.DefaultDrawDataCell(Rect, _dbgPedidoRS.columns[DataCol]
    .Field, State);  }

end;

procedure T_frmCompras._dbgPedidoSCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsitemPedidoCDSC.RecNo) then
  begin
    _dbgPedidoSC.Canvas.Font.Color := clBlack;
    _dbgPedidoSC.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgPedidoSC.Canvas.Font.Color := clBlack;
    _dbgPedidoSC.Canvas.Brush.Color := clWhite;
  end;
  if ((TAuxDBGrid(_dbgPedidoSC).DataLink.ActiveRecord +
    1 = TAuxDBGrid(_dbgPedidoSC).Row) or (gdSelected in State)) then
  begin
    _dbgPedidoSC.Canvas.Brush.Color := clGreen;
    _dbgPedidoSC.Canvas.Font.Color := clWhite;
  end;

  _dbgPedidoSC.Canvas.fillRect(Rect);
  _dbgPedidoSC.DefaultDrawDataCell(Rect, _dbgPedidoSC.columns[DataCol]
    .Field, State);

end;

procedure T_frmCompras._dbgVendaMesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsVendaMes.RecNo) then
  begin
    _dbgVendaMes.Canvas.Font.Color := clBlack;
    _dbgVendaMes.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgVendaMes.Canvas.Font.Color := clBlack;
    _dbgVendaMes.Canvas.Brush.Color := clWhite;
  end;
  _dbgVendaMes.Canvas.fillRect(Rect);
  _dbgVendaMes.defaultDrawColumncell(Rect, DataCol, Column, State);
end;

procedure T_frmCompras._dsGradeProdutoDataChange(Sender: TObject;
  Field: TField);
begin
  if _cdsProduto.State <> dsEdit then
  begin

    if (_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger > 0) and
      (_pgcCompras.ActivePage = _tbsCompras) then
      { setPosicaoGrid(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
        idMovimentoProximo);
      } nrprodutoPreco := _cdsProduto.FieldByName('CD_MERCADORIA')
        .AsInteger;
    nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
    _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

  end;
end;

procedure T_frmCompras._dsPrePedidoDataChange(Sender: TObject; Field: TField);
begin

  // SetNavegacaoProduto(0);
end;

procedure T_frmCompras._edtQuantidadeCaixaCamadaGridDblClick(Sender: TObject);
begin
  if _lbeMediaGrid.Visible then
    _lbeMediaGrid.Visible := false
  else
    _lbeMediaGrid.Visible := true;

end;

function T_frmCompras.SetCompraGrade(nrProduto, nrEmpresa, nrQuantidadePedido
  : Integer): Boolean;
begin
  if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([nrProduto, nrEmpresa]), []) then
  begin
    _cdsProduto.open;
    _cdsProduto.Edit;
    _cdsProduto.FieldByName('NR_QUANTIDADE_PEDIDO').AsInteger :=
      nrQuantidadePedido
  end;
end;

procedure T_frmCompras.MontaPedidoGrade;
var
  nrProdutoLocal, nrEmpresaLocal, qtPedidoLocal: Integer;
begin
  _cdsProduto.First;
  while not _cdsProduto.eof do
  begin
    nrProdutoLocal := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresaLocal := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
    MontaGraficodeVendasSCGrade(nrProdutoLocal, nrEmpresaLocal);
    MostraDaDosCalculoGridLeve;
    qtPedidoLocal := qtPedidoLeve;
    if qtPedidoLocal > 0 then
      SetCompraGrade(nrProdutoLocal, nrEmpresaLocal, qtPedidoLocal);
    _cdsProduto.Next;
  end;
  _cdsProduto.First;
  seqProduto := 0;
  nrReferencia := 300;
  nrProdutoLocal := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrEmpresaLocal := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  MontaGraficodeVendasSCGrade(nrProdutoLocal, nrEmpresaLocal);
  MostraDaDosCalculoGridLeve;
end;

procedure T_frmCompras.FiltraVendaLaboratorio(nrProduto, nrEmpresa,
  nrOperadorLogistico: Integer);
var
  stFiltroOperador: String;
begin
  stFiltroOperador := '';
  if nrOperadorLogistico > 1 then
    stFiltroOperador := format(' AND CD_OPERADOR_LOGISTICO=%d',
      [nrOperadorLogistico]);

  with _cdsVendalaboratorio do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' and CD_EMPRESA=' +
      inttostr(nrEmpresa) + stFiltroOperador;
    filtered := true;
  end;
end;

procedure T_frmCompras.setPosicaoGrid(nrProduto, nrEmpresa: Integer;
  idProximoReg: Boolean);
var
  Marcador: TBookmark;

begin
  _cdsProduto.filtered := false;
  if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([nrProduto, nrEmpresa]), []) then
  begin
    // Marcador := _cdsProduto.Bookmark;
    { _cdsProduto.IndexFieldNames := ('CD_MERCADORIA');
      _cdsProduto.SetKey;
      _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger := nrProduto;
      _cdsProduto.GotoKey; }
    // _cdsProduto.Bookmark := Marcador;

    Orderna;
    MontaGraficoVendaGrid;
    MostraDaDosCalculoGrid;
    _lbeSomaDesconto.Caption := FormatFloat('##0.00',
      pcDescontoPadrao + pcDescontoADicional);

    SetPrecoItem(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
      _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger, nrEmpresa, 0, 0, 0,
      0, pcDescontoPadrao, pcDescontoADicional);

    PrecoItemSC := PrecoItem;
    SetPrecoLocal;

  end
  else if idProximoReg then
    _cdsProduto.Next
  else
    _cdsProduto.Prior;
end;

procedure T_frmCompras.PosionaProduto(PnrProduto, PnrEmpresa: Integer);
begin
  _cdsProduto.filtered := false;
  if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrProduto, PnrEmpresa]), []) then
  begin
    pcDescontoRepasse := _cdsProduto.FieldByName('PC_REPASSE_COMPRA').AsFloat;
    // _cdsProduto.Bookmark := Marcador;
  end
end;

procedure T_frmCompras.MostraGraficoVendaGrid;
var
  dtreferencia: tdate;
  stMes: string[12];
  stAlertaRestricao: String;
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  _tchVendasMensal.View3D := true;

  Series9.Clear;
  Series9.Active := true;
  Series15.Active := false;
  Series16.Active := false;
  Series17.Active := false;
  Series18.Active := false;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrReferencia := MaiorVendaProduto(_cdsProduto.FieldByName('cd_MERCADORIA')
    .AsInteger, _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  FiltraVendaLaboratorio(_cdsProduto.FieldByName('cd_MERCADORIA').AsInteger,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, cdoperadorLogisticoPedido);
  CalculaMediaProduto(_cdsProduto.FieldByName('cd_MERCADORIA').AsInteger,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
        corBarra := clTeal;
      if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
        corBarra := $000080FF; // $0073EAFB;//clMoneyGreen;
      inc(nrMesesSelecionados);
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series9.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
  begin
    corBarra := clSkyBlue;
    inc(nrMesesSelecionados);

  end;
  Series9.Add(qtVendaMes[13], stMes, corBarra);
  _tchVendasMensal.Refresh;
  _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  // _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProdutoID_LOCAL_CD.AsString;
  _edtCD.Text := _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;
  if _cdsProduto.FieldByName('ID_SITUACAO_COMPRA').AsString = 'I' then
  begin
    _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProduto.FieldByName
      ('ID_LOCAL_CD').AsString;

  end;

  if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
  begin
    _edtCD.Color := clGreen;
    _edtCD.Font.Color := clBlack;
  end;
  if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
  begin
    _edtCD.Color := $000080FF;
    _edtCD.Font.Color := clBlack;
  end;
  Timer1.Enabled := false;
  _cdsProduto.FieldByName('iD_SITUACAO_MERCADORIA').AsString;
  _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
    _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
    _cdsProduto.FieldByName('NM_COMPLETO').AsString;

  _tchVendasMensal.Refresh;
  _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProduto.FieldByName
    ('ID_LOCAL_CD').AsString;
  if _cdsProduto.FieldByName('ID_SITUACAO_MERCADORIA').AsString = 'I' then
  begin
    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' +
      ' Produto Inativado no CD ';
    _tchVendasMensal.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
  if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'S' then
  begin
    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' +
      ' Produto Marcado para Ser Inativado ';
    _tchVendasMensal.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
  _pnRestricao.Visible := false;
  if RestricaoDeCompra(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger) then
  begin
    _pnRestricao.Visible := true;
    _pnRestricao.Height := 75;
    _mmAlertaRecall.Clear;

    _pnRestricao.Font.Color := clWhite;
    stAlertaRestricao := 'Produto com Restri??o de Compra.' + #13 +
      ' O mesmo poder? ser comprado.' + #13 +
      'Por?m fale com Farmac?utico antes';

    _mmAlertaRecall.Lines.Add('Produto com Restri??o de Compra.');
    _mmAlertaRecall.Lines.Add('O mesmo poder? ser comprado.');
    _mmAlertaRecall.Lines.Add('Por?m fale com Farmac?utico antes.');
    // _pnRestricao.Caption:=stAlertaRestricao;
    // _mmAlertaRecall.Lines.Add(stAlertaRestricao);

    _tchVendasMensal.Title.Color := clRed;
    // _tchVendasMensal.Title.Font:=[fsBold];

    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + #13 + ' - ';;
    _tchVendasMensal.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
end;

procedure T_frmCompras.MostraGraficoVendaGridNovo(Grafico: TChart;
  PnrProduto, PnrEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  stAlertaRestricao: String;
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);

  // BarSeries2.Clear;
  // BarSeries2.Active := true;
  // LineSeries1.Active := false;
  // LineSeries2.Active := false;
  // LineSeries3.Active := false;
  // Series18.Active := false;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrReferencia := MaiorVendaProduto(PnrProduto, PnrEmpresa);
  FiltraVendaLaboratorio(PnrProduto, PnrEmpresa, cdoperadorLogisticoPedido);
  CalculaMediaProduto(PnrProduto, PnrEmpresa);
  SetCamposCaixaCamadaPaleteGridPedElaborado;

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
        corBarra := clTeal;
      if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
        corBarra := $000080FF; // $0073EAFB;//clMoneyGreen;
      inc(nrMesesSelecionados);
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
  begin
    corBarra := clSkyBlue;
    inc(nrMesesSelecionados);

  end;
  // _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProdutoID_LOCAL_CD.AsString;
  _edtCD.Text := _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;

  { if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
    begin
    _edtCD.Color := clGreen;
    _edtCD.Font.Color := clBlack;
    end;
    if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
    begin
    _edtCD.Color := $000080FF;
    _edtCD.Font.Color := clBlack;
    end;
    Timer1.Enabled:=false;
    _cdsProduto.FieldByName('iD_SITUACAO_MERCADORIA').AsString;
    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
    _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
    _cdsProduto.FieldByName('NM_COMPLETO').AsString; }

  { _pnRestricao.Visible:=false;
    if RestricaoDeCompra(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger) then
    begin
    _pnRestricao.Visible:=true;
    _pnRestricao.Height:=75;
    _mmAlertaRecall.Clear;

    _pnRestricao.Font.Color:=clWhite;
    stAlertaRestricao:='Produto com Restri??o de Compra.'+#13+
    ' O mesmo poder? ser comprado.'+#13+
    'Por?m fale com Farmac?utico antes';

    _mmAlertaRecall.Lines.Add('Produto com Restri??o de Compra.');
    _mmAlertaRecall.Lines.Add('O mesmo poder? ser comprado.');
    _mmAlertaRecall.Lines.Add('Por?m fale com Farmac?utico antes.');
    //_pnRestricao.Caption:=stAlertaRestricao;
    //     _mmAlertaRecall.Lines.Add(stAlertaRestricao);

    _tchVendasMensal.Title.Color:=clRed;
    //    _tchVendasMensal.Title.Font:=[fsBold];

    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
    _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
    _cdsProduto.FieldByName('NM_COMPLETO').AsString + #13+' - ';;
    _tchVendasMensal.Refresh; }
  Timer1.Interval := 500;
  Timer1.Enabled := true;
end;

procedure T_frmCompras.MostraGraficoVendaGridNovoRS(Grafico: TChart;
  PnrProduto, PnrEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  stAlertaRestricao: String;
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;

begin

end;

procedure T_frmCompras.MostraGraficoVendaGridEmpresa;
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;
  nrProdutoEmpresa: Integer;
  vlMediaMensalEmpresa, vlCoberturaEstoque, vlCoberturaEstoquePedencia: Double;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series10.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrReferencia := MaiorVendaProdutoNova(_cdsProduto.FieldByName('CD_MERCADORIA')
    .AsInteger, 0);
  _SerieGraficoGradeEmpresa.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  nrProdutoEmpresa := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  FiltraVendaLaboratorio(nrProdutoEmpresa, 0, cdoperadorLogisticoPedido);
  vlMediaMensalEmpresa := CalculaMediaProduto(nrProdutoEmpresa, 0);

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series10.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;
  nrQuantidadeEstoqueMultEmpresa := GetEstoqueMultEmpresa(nrProdutoEmpresa, 0);

  DadosPendencia := setPendenciaCD(nrProdutoEmpresa, 0);
  qtPendenteItem := DadosPendencia.QtPendente;

  vlCoberturaEstoque := CoberturaEstoqueDia(nrQuantidadeEstoqueMultEmpresa, 0,
    vlMediaMensalEmpresa);
  vlCoberturaEstoquePedencia := CoberturaEstoqueDia
    (nrQuantidadeEstoqueMultEmpresa, qtPendenteItem, vlMediaMensalEmpresa);
  PintaCampoCoberturaEstoqueEmpresa(vlCoberturaEstoque, qtEstoqueMaximo);
  PintaCampoCoberturaEstoquePendenciaEmpresa(vlCoberturaEstoquePedencia,
    qtEstoqueMaximo);

  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;
  Series10.Add(qtVendaMes[13], stMes, corBarra);
  _SerieGraficoGradeEmpresa.Refresh;
  // _SerieGraficoGradeEmpresa.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  // _grbGraficoGradeEmpresa.Caption:='GAM CD '+_cdsProdutoID_LOCAL_CD.AsString;
  setDadosEstoqueEmpresa(vlMediaMesSC,
    StrToIntDef(FormatFloat('00000000', qtVendaMes[13]), 0), qtPendenteItem,
    nrQuantidadeEstoqueMultEmpresa, StrToIntDef(FormatFloat('00000000',
    vlCoberturaEstoque), 0), StrToIntDef(FormatFloat('00000000',
    vlCoberturaEstoquePedencia), 0));
  nrReferencia := MaiorVendaProduto(_cdsProduto.FieldByName('CD_MERCADORIA')
    .AsInteger, nrProdutoEmpresa);
  _SerieGraficoGradeEmpresa.Title.Text[0] :=
    FormatFloat('######0', _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) +
    ' - ' + _cdsProduto.FieldByName('NM_COMPLETO').AsString;
  _SerieGraficoGradeEmpresa.Refresh;
  // _SerieGraficoGradeEmpresa.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  _grbGraficoGradeEmpresa.Caption := 'Venda Empresa';

end;

procedure T_frmCompras.MostraGraficoVendaGridCDOposto(nrEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;
  nrEmpresaCdOposto, nrMercadoriaOposto, nrEstoqueCDOposto,
    nrPendenciaCdOposto: Integer;
  stLocalCd: String;
  vlMediaDiaCdOposto, vlCoberturaEstoqueCDOposto,
    vlCoberturaEstoquePendencia: Double;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series19.Clear;
  Series19.Visible := true;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrMercadoriaOposto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrReferencia := MaiorVendaProduto(nrMercadoriaOposto, nrEmpresa);

  // _SerieGraficoGradeEmpresa.LeftAxis.SetMinMax(0,nrReferencia*1.30);
  nrEmpresaCdOposto := 1;
  if nrEmpresa = 1 then
    nrEmpresaCdOposto := 4;
  FiltraVendaLaboratorio(nrMercadoriaOposto, nrEmpresaCdOposto,
    cdoperadorLogisticoPedido);
  vlMediaDiaCdOposto := CalculaMediaProduto(nrMercadoriaOposto,
    nrEmpresaCdOposto);
  nrEstoqueCDOposto := GetEstoqueMultEmpresa(nrMercadoriaOposto,
    nrEmpresaCdOposto);

  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresaCdOposto);
  nrPendenciaCdOposto := DadosPendencia.QtPendente;

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    if nrEmpresaCdOposto = 1 then
    begin
      corBarra := clTeal;
      stLocalCd := 'Posicao Estoque / CD Tubar?o';
    end
    else
    begin
      corBarra := $000080FF; // $0073EAFB;//clMoneyGreen;
      stLocalCd := 'Posicao Est./CD Sta.Cruz do Sul'
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series19.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  // corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;

  Series19.Add(qtVendaMes[13], stMes, corBarra);
  Series19.Repaint;
  if _chkOcultaCD.Checked then
    _grbCDOposto.Visible := false
  else
    _grbCDOposto.Visible := true;
  if not _chkOcultaCD.Checked then
  begin
    _lbeMediaCdOposto.Text := FormatFloat('###,###0', vlMediaMesSC);
    _lbePendenciaCDOposto.Text := FormatFloat('###,###0', nrPendenciaCdOposto);
    vlCoberturaEstoqueCDOposto := CoberturaEstoqueDia(nrEstoqueCDOposto, 0,
      vlMediaDiaCdOposto);
    vlCoberturaEstoquePendencia := CoberturaEstoqueDia(nrEstoqueCDOposto,
      nrPendenciaCdOposto, vlMediaDiaCdOposto);
    _lbeCoberturaEstoqueCDOposto.Text := FormatFloat('###,###0',
      vlCoberturaEstoqueCDOposto);
    _LbeCoberturaEstoquePendenciaCDOposto.Text :=
      FormatFloat('###,###0', vlCoberturaEstoquePendencia);
    PintaCampoCoberturaEstoqueCDOposto(vlCoberturaEstoqueCDOposto,
      qtEstoqueMaximo);
    PintaCampoCoberturaEstoquePendenciaCDOposto(vlCoberturaEstoquePendencia,
      qtEstoqueMaximo);

    _lbeEstoqueCDOposto.Text := FormatFloat('###,###,##0', nrEstoqueCDOposto);
    _grbCDOposto.Color := corBarra;
    _grbCDOposto.Caption := stLocalCd;
  end;
  _SerieGraficoGradeEmpresa.Refresh;
  _lbeVendaMesCDOposto.Text := FormatFloat('###,###,##0', qtVendaMes[13]);
  _SerieGraficoGradeEmpresa.Refresh;
end;

function T_frmCompras.MaiorVendaProdutoNova(PnrProduto, PnrCD: Integer): Double;
var
  I: Integer;
  nrMaiorVenda: Double;

begin
  nrMaiorVenda := 0;
  FiltraVendaLaboratorio(PnrProduto, PnrCD, cdoperadorLogisticoPedido);
  CalculaMediaProduto(PnrProduto, PnrCD);
  for I := 1 to 13 do
  begin
    if nrMaiorVenda < qtVendaMes[I] then
      nrMaiorVenda := qtVendaMes[I];
  end;
  result := nrMaiorVenda;
end;

function T_frmCompras.MaiorVendaProduto(PnrProduto,
  PnrEmpresa: Integer): Double;
var
  I: Integer;
  nrMaiorVenda: Double;

begin
  nrMaiorVenda := 0;
  FiltraVendaLaboratorio(PnrProduto, PnrEmpresa, cdoperadorLogisticoPedido);
  CalculaMediaProduto(PnrProduto, PnrEmpresa);
  for I := 1 to 13 do
  begin
    if nrMaiorVenda < qtVendaMes[I] then
      nrMaiorVenda := qtVendaMes[I];
  end;
  { FiltraVendaLaboratorio(PnrProduto, 4, cdoperadorLogisticoPedido);
    CalculaMediaProduto(PnrProduto,PnrEmpresa);
    for I := 1 to 13 do
    begin
    if nrMaiorVenda < qtVendaMes[I] then
    nrMaiorVenda := qtVendaMes[I];
    end; }
  result := nrMaiorVenda;
end;

procedure T_frmCompras.CarregaTabelaProdutoCD(idEmpresa: Integer);
var
  nrRegistro, nrProdutoLocal, nrEmpresaLocal, qtPedidoLocal: Integer;
begin
  nrRegistro := 0;
  nrUnidadesSugeridaSC := 0;
  nrUnidadesSugeridaRS := 0;
  nrUnidadesExcessoCDSC := 0;
  vlExcessoCustoCDSC := 0;
  vlExcessoListaCDSC := 0;
  vlExcessoVendaCDSC := 0;
  vlExcessoMtsCubicoCDSC := 0;
  nrUnidadesExcessoCDRS := 0;
  vlExcessoCustoCDRS := 0;
  vlExcessoListaCDRS := 0;
  vlExcessoVendaCDRS := 0;
  vlExcessoMtsCubicoCDRS := 0;
  _cdsProduto.First;
  while not _cdsProduto.eof do
  begin
    inc(nrRegistro);
    nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;

    if idEmpresa = 1 then
    begin
      FiltraVendaLaboratorio(nrProduto, 1, cdoperadorLogisticoPedido);
      SetVendasLaboratorioCD(nrProduto, 1, nrRegistro,
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
    end;
    if idEmpresa = 4 then
    begin
      // PosionaProduto(nrProduto,idEmpresa);
      FiltraVendaLaboratorio(nrProduto, 4, cdoperadorLogisticoPedido);
      SetVendasLaboratorioCD(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
        4, nrRegistro, _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
    end;
    if idEmpresa = 0 then
    begin
      FiltraVendaLaboratorio(nrProduto, _cdsProduto.FieldByName('CD_EMPRESA')
        .AsInteger, cdoperadorLogisticoPedido);
      SetVendasLaboratorioCD(nrProduto, _cdsProduto.FieldByName('CD_EMPRESA')
        .AsInteger, nrRegistro, _cdsProduto.FieldByName('ID_CURVA_MERCADORIA')
        .AsString);
      { FiltraVendaLaboratorio(nrProduto, 4, cdoperadorLogisticoPedido);
        SetVendasLaboratorioCD(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
        4, nrRegistro, _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString); }
    end;

    _stbCompras.Panels[1].Text := 'Montando Previs?o de compra...' +
      FormatFloat('0000000', _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) +
      ' - ' + _cdsProduto.FieldByName('NM_COMPLETO').AsString;
    _stbCompras.Panels[2].Text := 'Registro...' + FormatFloat('0000000',
      nrRegistro) + ' de ' + FormatFloat('0000000', _cdsProduto.RecordCount);

    Application.ProcessMessages;
    _cdsProduto.Next;
  end;
  CriaTabela(_cdsSugestaoCompra);
  CarregaTabelaTemporaria(_cdsSugestaoCompra, 1, 'CD TUBAR?O',nrUnidadesSugeridaSC, vlSugeridoCustoSC, vtSugeridoVendaSC,
    vlSugeridaMtsCubicoSC);
  CarregaTabelaTemporaria(_cdsSugestaoCompra, 4, 'CD STA. CRUZ DO SUL',
    nrUnidadesSugeridaRS, vlSugeridoCustoRS, vtSugeridoVendaRS,
    vlSugeridaMtsCubicoRS);
  CarregaTabelaTemporaria(_cdsSugestaoCompra, 0, 'GERAL',
    nrUnidadesSugeridaRS + nrUnidadesSugeridaSC,
    vlSugeridoCustoRS + vlSugeridoCustoSC, vtSugeridoVendaRS +
    vtSugeridoVendaSC, vlSugeridaMtsCubicoRS + vlSugeridaMtsCubicoSC);
  CriaTabela(_cdsExcessoEstoque);
  CarregaTabelaTemporaria(_cdsExcessoEstoque, 1, 'CD TUBAR?O',
    nrUnidadesExcessoCDSC, vlExcessoCustoCDSC, vlExcessoVendaCDSC,
    vlExcessoMtsCubicoCDSC);
  CarregaTabelaTemporaria(_cdsExcessoEstoque, 4, 'CD STA. CRUZ DO SUL',
    nrUnidadesExcessoCDRS, vlExcessoCustoCDRS, vlExcessoVendaCDRS,
    vlExcessoMtsCubicoCDRS);
  CarregaTabelaTemporaria(_cdsExcessoEstoque, 0, 'GERAL',
    nrUnidadesExcessoCDSC + nrUnidadesExcessoCDRS,
    vlExcessoCustoCDSC + vlExcessoCustoCDRS, vlExcessoVendaCDSC +
    vlExcessoVendaCDRS, vlExcessoMtsCubicoCDSC + vlExcessoMtsCubicoCDRS);

  if NrAuditoriaSC > 0 then
  begin
    repeat
      // Gravandoauditoria Dados Pedido SC

      idAuditoria := AuditoriaCompraCapa(NrAuditoriaSC,
        // PCD_AUDITORIA    :Integer;
        dtSistema, // PDT_AUDITORIA    :Tdate;
        nrLaboratorioLocal, // PNR_LABORATORIO  :Integer;
        'SC- ' + copy(trim(nmModuloPedido), 1, 20), // PDS_MODULO       :String;
        _dtpDataAgendada.Date, // PDT_AGENDA_ANT   :Tdate;
        _dtpProximaAgenda.Date, // PDT_AGENDA_ATUAL :Tdate;
        inttostr(nrGrupoLaboratorio), // PDS_GRUPO_ANT    :String;
        inttostr(nrGrupoLaboratorio), // PDS_GRUPO_ATUAL  :String;
        nrLeadTime, // PNR_LEADTIME_ANT :Integer;
        nrLeadTime, // PNR_LEADTIME_ATUAL:Integer;
        dsDiasPedido, // PDS_DIACOMPRA_ANT:String;
        dsDiasPedido, // PDS_DIACOMPRA_ATUAL:String;
        nrParamentoEstoque, // PNR_PARAM_ESTOQUE_ANT:Integer;
        nrParamentoEstoque, // PNR_PARAM_ESTOQUE_ATUAL:Integer;
        nrUnidadesSugeridaSC, // PQT_SUGERIDA_ANT:Integer;
        nrUnidadesSugeridaSC, // PQT_SUGERIDA_ATUAL:Integer;
        0, // PQT_COMPRADA:Integer;
        vlSugeridoSC, // PVT_SUGERIDO_ANT,
        vlSugeridoSC, // PVT_SUGERIDO_ATUAL,
        0, // PVT_COMPRADO:Double;
        idAgendado, // PID_AGENDADO:String;
        NomeMaquina, // PNM_USUARIO:String;
        0, // PPC_DESC_FIN_ANT,
        0, // PPC_DESC_FIN_ATUAL,
        pcDescontoPadrao, // PPC_DESC_COM_ANT,
        pcDescontoPadrao, // PPC_DESC_COM_ATUAL:Double;
        ' ', // PDS_JUSTIFICATIVA:String;
        nrCondicaoPagamento, // PNR_PRAZO_ANT:Integer;
        nrCondicaoPagamento, { //PNR_PRAZO_ATUAL:Integer }
        1, NrPedidoSC);

    until idAuditoria;
  end;

  if NrAuditoriaRS > 0 then
  begin
    repeat
      // Gravandoauditoria Dados Pedido RS

      idAuditoria := AuditoriaCompraCapa(NrAuditoriaRS,
        // PCD_AUDITORIA    :Integer;
        dtSistema, // PDT_AUDITORIA    :Tdate;
        nrLaboratorioLocal, // PNR_LABORATORIO  :Integer;
        'RS- ' + copy(trim(nmModuloPedido), 1, 20), // PDS_MODULO       :String;
        _dtpDataAgendada.Date, // PDT_AGENDA_ANT   :Tdate;
        _dtpProximaAgenda.Date, // PDT_AGENDA_ATUAL :Tdate;
        inttostr(nrGrupoLaboratorio), // PDS_GRUPO_ANT    :String;
        inttostr(nrGrupoLaboratorio), // PDS_GRUPO_ATUAL  :String;
        nrLeadTime, // PNR_LEADTIME_ANT :Integer;
        nrLeadTime, // PNR_LEADTIME_ATUAL:Integer;
        dsDiasPedido, // PDS_DIACOMPRA_ANT:String;
        dsDiasPedido, // PDS_DIACOMPRA_ATUAL:String;
        nrParamentoEstoque, // PNR_PARAM_ESTOQUE_ANT:Integer;
        nrParamentoEstoque, // PNR_PARAM_ESTOQUE_ATUAL:Integer;
        nrUnidadesSugeridaRS, // PQT_SUGERIDA_ANT:Integer;
        nrUnidadesSugeridaRS, // PQT_SUGERIDA_ATUAL:Integer;
        0, // PQT_COMPRADA:Integer;
        vlSugeridoRS, // PVT_SUGERIDO_ANT,
        vlSugeridoRS, // PVT_SUGERIDO_ATUAL,
        0, // PVT_COMPRADO:Double;
        idAgendado, // PID_AGENDADO:String;
        NomeMaquina, // PNM_USUARIO:String;
        0, // PPC_DESC_FIN_ANT,
        0, // PPC_DESC_FIN_ATUAL,
        pcDescontoPadrao, // PPC_DESC_COM_ANT,
        pcDescontoPadrao, // PPC_DESC_COM_ATUAL:Double;
        ' ', // PDS_JUSTIFICATIVA:String;
        nrCondicaoPagamento, // PNR_PRAZO_ANT:Integer;
        nrCondicaoPagamento, { //PNR_PRAZO_ATUAL:Integer }
        4, NrPedidoRS);
    until idAuditoria;
  end;

  if _cdsProduto <> nil then
  begin
    _cdsProduto.open;
    _cdsProduto.First;
    _cdsProduto.First;
    _cdsProduto.RecordCount;
    // setPosicaoGrid(_cdsProdutoCD_MERCADORIA.AsInteger);
    { setPosicaoGrid(_cdsProduto.fieldbyName('CD_MERCADORIA').AsInteger,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, idMovimentoProximo);
    }
    nrProdutoLocal := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresaLocal := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
    // MontaGraficodeVendasSCGrade(nrProdutoLocal,nrEmpresaLocal);
    // MostraDaDosCalculoGridLeve;
    MontaGraficoVendaGrid;
  end;
  MostraTotaisPedido(NrPedidoSC, 1);
  MostraTotaisPedido(NrPedidoRS, 4);
  _cdsProduto.First;
  if AbreItemPrePedidoMultiEmpresa(NrPedidoSC, NrPedidoRS, 0, 0, 'N') then
    SetNomeCampoItemPrePedido;

end;

procedure T_frmCompras._chkOcultaCDClick(Sender: TObject);
var
  idPosicaoGrade: TBookmark;
begin
  if _chkOcultaCD.Checked then
    _grbCDOposto.Visible := false
  else
  begin
    _grbCDOposto.Visible := true;
    idPosicaoGrade := _cdsProduto.Bookmark;
    _cdsProduto.Next;
    _cdsProduto.Bookmark := idPosicaoGrade;
    MostraGraficoVendaGridEmpresa;
  end;

end;

procedure T_frmCompras._chkOcultaCurvaEClick(Sender: TObject);
begin
  _cdsProduto.filtered := false;
  if _chkOcultaCurvaE.Checked then
  begin
    With _cdsProduto do
    begin
      filter := 'ID_CURVA_MERCADORIA<>''E''';
      filtered := true;
    end;
  end;
end;

procedure T_frmCompras._chkOrdenaCurvaClick(Sender: TObject);
Var
  Marcador: TBookmark;
begin
  // OrdenaCamposII(_cdsProduto,_cdsProduto.FieldByName('NM_COMPLETO'),_cdsProduto.FieldByName('ID_CURVA_MERCADORIA'));}
  // _cdsProduto.REFRESH;
  Marcador := _cdsProduto.Bookmark;
  Orderna;
  if _cdsProduto.RecordCount > 0 then
    _cdsProduto.Bookmark := Marcador;
  SetFocuCursor(IdPosicaoCursor);
  exit;

end;

procedure T_frmCompras._chkUltimoDescontoClick(Sender: TObject);
begin
  _edtNrVerbaInicio.Visible := false;
  _lbNrVerbaInicio.Visible := false;
  _edtNrVerbaInicio.Clear;
  if _chkUltimoDesconto.Checked then
  begin
    _edtNrVerbaInicio.Visible := true;
    _lbNrVerbaInicio.Visible := true;
    _edtNrVerbaInicio.Text := inttostr(GetNumeroVerba(0, nrFornecedor));
    _edtNrVerbaInicio.SetFocus;
  end;

end;

procedure T_frmCompras._chkUltimoDescontoInicioClick(Sender: TObject);
begin
  _chkUltimoDesconto.Checked := false;
  if _chkUltimoDescontoInicio.Checked then
    _chkUltimoDesconto.Checked := true;
end;

procedure T_frmCompras.OrdenaCamposII(tabela: TClientDataSet;
  Coluna, Coluna2: TField);
begin
  GeraOrdenacaoMul(_cdsProduto, Coluna, Coluna2)
end;

Function T_frmCompras.GravaItemAtual(nrPedido, nrProduto, nrQuantidadePedido,
  nrEmpresa: Integer): Boolean;
VAR
  vlVerba: Double;
  pcImcsCompra: Double;
begin
  if NOT AbreItemPedidoMultiEmpresa(nrPedido, nrProduto, nrEmpresa, 'N') then
  begin
    if nrQuantidadeComprada > 0 then
    begin
      inc(nrContaItem);

      vlVerba := CalculaPcVerba(pcVerba, 0, CalculoPreco.vlPrecoCusto,
        _cdsProduto.FieldByName('IPIM_M').AsFloat, 0,
        _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat,
        _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
        _cdsProduto.FieldByName('ECNM_M').AsInteger, nrQuantidadeComprada,
        _cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger,
        _cdsProduto.FieldByName('ID_PIS_COFINS').AsString[1]);

      GravaLogItemPedido(nrPedido, // NUMBER(6)
        nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        CalculoPreco.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        vlPrecoVenda, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        0, // DFIY_Y ,   //NUMBER(5,2)
        vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        0, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoque, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        nrListaPrecoSC, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        pcIndicePrecoSC, nrEmpresa, pcImcsCompra);
      GravaItemPedidoAtual(nrPedido, // NUMBER(6)
        nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        CalculoPreco.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        vlPrecoVenda, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        0, // DFIY_Y ,   //NUMBER(5,2)
        vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        0, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoque, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        nrListaPrecoSC, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        pcIndicePrecoSC, nrEmpresa, pcImcsCompra, CalculoPreco.pcIPILista);


      // PC_MUDANCA_PRECO:Double):Boolean;//NUMBER(7,4)

    end;
    _cdsProduto.Next;
    _cdsProduto.Next;
    // MontaGraficodeVendas(_cdsProduto.FieldByName('NROM_M').AsInteger);
    MontaGraficoVenda;
  end
  else
  begin
    if nrQuantidadeComprada > 0 then
    begin
      AtualizaItemPedido(nrPedido, nrProduto, nrQuantidadeComprada, 0,
        nrPrazoPedido, 0, 0, 1, nrDiasEstoque, nrUnidadesPossivel, 'N', 'N',
        'N', pcDescontoPadrao, pcDescontoADicional, 0, 0, 0, 0,
        CalculoPreco.vlPrecoLiquido, vlPrecoVenda, vlPrecoCusto, 0, 0, 0,
        vlMediaMesSC, ' Tela Pedido', nrEmpresa);
      GravaLogItemPedido(nrPedido, // NUMBER(6)
        nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        CalculoPreco.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        vlPrecoVenda, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        0, // DFIY_Y ,   //NUMBER(5,2)
        vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        0, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoque, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        nrListaPrecoSC, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        pcIndicePrecoSC, nrEmpresa, pcImcsCompra);
      GravaItemPedidoAtual(nrPedido, // NUMBER(6)
        nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        CalculoPreco.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        vlPrecoVenda, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        0, // DFIY_Y ,   //NUMBER(5,2)
        vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        0, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoque, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        nrListaPrecoSC, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        pcIndicePrecoSC, nrEmpresa, pcImcsCompra, CalculoPreco.pcIPILista);

    end
    else
    begin
      if Confirma('Deseja Eliminar Item?', MB_DEFBUTTON2) = IDYES then
        EliminaItemPedido(nrPedido, nrProduto, '');
    end;
  end;
  AbreItemPedidoMultiEmpresa(nrPedido, 0, nrEmpresa, 'N');
  AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  SetNomeCampoItemPedido;

end;

function T_frmCompras.SetPedido(cdEmpresa: Integer): Boolean;
var
  cdPrazoPagamento: Integer;
  idCriaCapaPedido: Boolean;
  idPosicao: TBookmark;

begin
  cdPrazoPagamento := AbrePrazoParcelamento(inttostr(nrPrazoPedido), 1);
  cdPrazoPagamentoAudititoria := cdPrazoPagamento;

  idPosicao := _cdsPrePedido.Bookmark;

  idCriaCapaPedido := false;
  if ((NrPedidoSC = 0) and (cdEmpresa = 1)) or
    ((NrPedidoRS = 0) and (cdEmpresa = 4)) then
  begin
    nrPedidoTelaCompra := GeraNumeroPedido('C');
    idCriaCapaPedido := true;
    if (cdEmpresa = 1) then
      NrPedidoSC := nrPedidoTelaCompra;
    if (cdEmpresa = 4) then
      NrPedidoRS := nrPedidoTelaCompra;

  end;
  if (cdEmpresa = 1) then
    nrPedidoTelaCompra := NrPedidoSC;

  if (cdEmpresa = 4) then
    nrPedidoTelaCompra := NrPedidoRS;

  idPedidoIniciado := true;
  if idCriaCapaPedido then
    GravaCapaPedido(nrPedidoTelaCompra, // NROP_P,//  NUMBER(6)
                    nrLaboratorioLocal, // LABP_P :Integer;// NUMBER(6)
                    dtPedido, // DATP_P :Tdate;// DATE
                    pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                    0, // DESP_P:Double;// NUMBER(5,2)
                    'S', // SITP_P :String;//CHAR(1)
                    nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
                    dtPedido + nrLeadTime, // PREP_P          //DATE
                    ' ', // CHAR(40)
                    '0', // SNRP_P           //  CHAR(10)
                     0, // FLAP_P ,         //NUMBER(1)
                    cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                    nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                    strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                    dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                    'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                    cdoperadorLogisticoPedido,
                     // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                     NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                     dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                     dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                     0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                     0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                     strtodate('01/01/2039'), nrCompradorPedido,
                     _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, 0, pcGeracaoVerba,
                     nrGeracaoVerba,0);
  // DT_TRANSMITIDO :tdate):Boolean;

  PrazoSC(nrPrazoPedido);
  PrazoRS(nrPrazoPedido);
  if Mercadoria <> nil then
  begin
    if Mercadoria.idSituacaoMercadoriaCompra = 'I' then
    begin
      Mensagem('Item Inativo para Compra neste CD', 64);
      exit;
    end;
    if Mercadoria.idSituacaoMercadoriaEstoque = 'I' then
    begin
      Mensagem('Item Inativo no Estoque neste CD', 64);
      exit;
    end;
  end;

  GravaItem(nrPedidoTelaCompra,
            _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
            nrQuantidadeComprada,
            _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);

   AbreItemPedidoMultiEmpresa(nrPedidoTelaCompra,
                              0,
                              _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  SetNomeCampoItemPedido;
  if _cdsProduto.FieldByName('CD_EMPRESA').AsInteger = 1 then
  begin
    TotaisPedidoSC := TotalizaPedido(NrPedidoSC, 0, 'S');
    vlCompradoSC := TotaisPedidoSC.vlPedidoBruto;
    nrUnidadesCompradaSC := TotaisPedidoSC.nrUnidadesPedido;
  end;
  if _cdsProduto.FieldByName('CD_EMPRESA').AsInteger = 4 then
  begin
    TotaisPedidoRS := TotalizaPedido(NrPedidoRS, 0, 'S');
    vlCompradoRS := TotaisPedidoRS.vlPedidoBruto;
    nrUnidadesCompradaRS := TotaisPedidoRS.nrUnidadesPedido;
  end;

  if AbreItemPrePedidoMultiEmpresa(NrPedidoSC, NrPedidoRS, 0, 0, 'N') then
    SetNomeCampoItemPrePedido;

  _cdsPrePedido.Bookmark := idPosicao;
  SetValoresPedidos;


  // if not _chkFixaDescontoAdicional.Checked then
  /// _lbeDescontoAdicionalGrid.Clear;

  // if pcDescontoAdicional = 0 then
end;

Function T_frmCompras.SetPrecoItem(PnrProduto, PnrDigitoProduto, PcdEmpresa,
  PnrPedido, PnrQuantidadeComprada, PnrVerba: Integer;
  PvlNota, PpcDescontoPadrao, PpcAdicional: Double): TCalculoPreco;
var
  pcDescontoAdicionalLocal: Double;

begin
  /// Mercadoria := GetMercadoriaNova(nrProduto, nrDigitoProduto, 0,0);
  { PrecoLista := GetListaprecoNova(Mercadoria.vlPrecoCadastro,
    // Preco Fornecedor
    1, // % desconto Adcional
    0, // Nr Lista Precos --> N?o utiliza
    Mercadoria.nrProduto,cdEmpresa, // Nr. Produto
    idPrecoAtualDesconto,
    dtPedido); }

  precoLista := GetPrecoItem(PnrProduto, PcdEmpresa,
    _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, 1, 'N',
    idPedidoBloqueado, nrListaPreco);

  if precoLista.PcDescontoLista > 0 then
  begin
    pcDescontoADicional := precoLista.PcDescontoLista;
    nrVerbaDigitada := precoLista.nrVerba;
    nrVerba := precoLista.nrVerba;
    PpcAdicional:=precoLista.PcDescontoLista;
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0', nrVerba);
  end;

  if PvlNota > 0 then
  begin
    pcDescontoAdicionalLocal := CalculaDescontoAdicional
      (precoLista.vlPrecoLista, PvlNota,
      _cdsProduto.FieldByName('PC_REPASSE_COMPRA').AsFloat, PpcDescontoPadrao);

    pcDescontoADicional := pcDescontoAdicionalLocal;

  end;
  idTipoLista := _cdsProduto.FieldByName('DS_NIVEL_ECNM').AsString;
  idSuperfluo := _cdsProduto.FieldByName('ID_SUPERFLUO').AsString;
  idPisConfins := _cdsProduto.FieldByName('ID_COFINS').AsString;
  if cdoperadorLogisticoPedido = 1 then
    PpcDescontoPadrao := _cdsProduto.FieldByName
      ('PC_DESCONTO_PADRAO_COMPRA').AsFloat
  else
    PpcDescontoPadrao := LocalizaDescontoOPerador(nrProduto, _nrEmpresa);
  pcAliquotaIcms := _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat;
  pcIPI := _cdsProduto.FieldByName('PC_IPI_MERCADORIA').AsFloat;

  PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista, vlPrecoVenda,
    pcDescontoRepasse, PpcDescontoPadrao, PpcAdicional, pcAliquotaIcms, pcIPI,
    precoLista.pcIPILista, precoLista.pcReajustePreco, nrQuantidadeComprada,
    precoLista.nrListaPreco, 'N', idForcaRepasse[1], idIpiLiquidoComRepasse[1],
    idIpiLiquidoSemRepasse[1], idIpiBrutoComRepasse[1], idIpiBrutoSemRepasse[1],
    idTipoLista[1], idUnidadeFederacao, idSuperfluo, idIcmDestacado,
    idReduzIcms, idPisConfins);

  _lbeDescontoAdicionalGrid.SelectAll;

end;

procedure T_frmCompras.SetPrecoLocal;
begin

  _lbePrecoListaGrid.Text := FormatFloat('###,##0.00', precoLista.vlPrecoLista);
  // _lbePercentualRepasseGrid.Text := FormatFloat('###,##0.00', pcDescontoRepasse); 05/12/2016
  // RETIRADO A PEDIDO Raquel e Arthur
  _lbePercentualRepasseGrid.Visible := false;
  _lbeDescontoPadraoGrid.Text := FormatFloat('###,##0.00', pcDescontoPadrao);
  _lbeDescontoAdicionalGrid.Text := FormatFloat('###,##0.000', pcDescontoADicional);

  _lbePrecoNotaGrid.Text := FormatFloat('###,##0.00',
    PrecoItemSC.vlPrecoLiquido);
  _lbeValorCreditoIcmsGrid.Text := FormatFloat('###,##0.00',
    PrecoItemSC.vlCreditoIcmsCompra);
  _lbePrecoCustoGrid.Text := FormatFloat('###,##0.00',
    PrecoItemSC.vlPrecoCusto);
  _lbeValorVerbaGrid.Text := FormatFloat('###,##0.00', PrecoItemSC.vlVerba);
end;

procedure T_frmCompras.setDadosEstoqueEmpresa(vlMediaMensal: Double;
  nrVendaAtual: Integer; nrPendenciaEmpresa: Integer; nrEstoqueEmpresa: Integer;
  nrCoberturaEstoque: Integer; nrCobEstoquePendencia: Integer);
begin

  _lbeMediaEmpresa.Text := FormatFloat('###,###,##0', vlMediaMensal);

  _lbeVendaMesEmpresa.Text := FormatFloat('###,###,##0', nrVendaAtual);
  _lbePendenciaEmpresa.Text := FormatFloat('###,###,##0', nrPendenciaEmpresa);
  _lbeEstoqueEmpresa.Text := FormatFloat('###,###,##0', nrEstoqueEmpresa);
  _lbeEstoqueEmpresa.Text := FormatFloat('###,###,##0', nrEstoqueEmpresa);

  _lbeCoberturaEstoqueEmpresa.Text := FormatFloat('###,###,##0',
    nrCoberturaEstoque);
  _LbeCoberturaEstoquePendenciaEmpresa.Text :=
    FormatFloat('###,###,##0', nrCobEstoquePendencia);

end;

procedure T_frmCompras.AbrePendenciaGeral(nrLaboratorio: Integer);
begin
  if _cdsPendencia <> nil then
  begin
    _cdsPendencia.close;
    _cdsPendencia := AbrePendenciaLaboratorio(nrLaboratorio, 0);
    if _cdsPendencia <> nil then
    begin
      _cdsPendencia.open;
      _cdsPendencia.RecordCount;
    end;
  end;
end;

function T_frmCompras.setPendenciaCD(nrProduto, cdEmpresa: Integer)
  : TDadosPendenciaPedido;
begin
  result.qtPedido     := 0;
  result.qtAtendida   := 0;
  result.QtPendente   := 0;
  result.qtProcessada := 0;
  result.vlPedido     := 0;
  result.vlPendente   := 0;
  if _cdsPendencia <> nil then
  begin
    if _cdsPendencia.Locate('NROM_Y;CD_EMPRESA',
      VarArrayOf([nrProduto, cdEmpresa]), []) then
    begin
      result.qtPedido := _cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;;
      result.qtAtendida := _cdsPendencia.FieldByName('QT_ATENDIDA').AsInteger;
      result.QtPendente := _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
      result.vlPedido := _cdsPendencia.FieldByName('VL_PENDENTE').AsFloat;
      result.qtProcessada := _cdsPendencia.FieldByName('QT_PROCESSADA').AsInteger;
    end;

    { if cdEmpresa = 1 then
      begin
      if _cdsPendencia.Locate('NROM_Y;CD_EMPRESA',
      VarArrayOf([nrProduto, cdEmpresa]), []) then
      begin
      result.QtPedido   := _cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;;
      result.qtAtendida := _cdsPendencia.FieldByName('QT_ATENDIDA').AsInteger;
      result.QtPendente := _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
      result.vlPedido   := _cdsPendencia.FieldByName('VL_PENDENTE').Asfloat;
      result.qtProcessada := _cdsPendencia.FieldByName('QT_PROCESSADA').AsInteger;
      end;
      end;
      if cdEmpresa = 4 then
      begin
      if _cdsPendencia.Locate('NROM_Y;CD_EMPRESA',
      VarArrayOf([nrProduto, cdEmpresa]), []) then
      begin
      result.QtPedido   := _cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;;
      result.qtAtendida := _cdsPendencia.FieldByName('QT_ATENDIDA').AsInteger;
      result.QtPendente := _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
      result.vlPedido   := _cdsPendencia.FieldByName('VL_PENDENTE').Asfloat;
      result.qtProcessada := _cdsPendencia.FieldByName('QT_PROCESSADA').AsInteger;
      end;
      end;
      if cdEmpresa = 0 then
      begin
      if _cdsPendencia.Locate('NROM_Y;CD_EMPRESA',
      VarArrayOf([nrProduto, cdEmpresa]), []) then
      begin
      result.QtPedido   := _cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;;
      result.qtAtendida := _cdsPendencia.FieldByName('QT_ATENDIDA').AsInteger;
      result.QtPendente := _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
      result.vlPedido   := _cdsPendencia.FieldByName('VL_PENDENTE').Asfloat;
      result.qtProcessada := _cdsPendencia.FieldByName('QT_PROCESSADA').AsInteger;
      end;
      end; }
  end;
end;

function T_frmCompras.setItemPendenciaCD(nrProduto, cdEmpresa: Integer)
  : Integer;
begin
  result := 0;
  if _cdsPendenciaItem <> nil then
  begin
    if cdEmpresa = 1 then
    begin
      if _cdsPendenciaItem.Locate('NROM_Y;CD_EMPRESA',
        VarArrayOf([nrProduto, cdEmpresa]), []) then
        result := _cdsPendenciaItem.FieldByName('QT_PENDENTE').AsInteger;
    end;
    if cdEmpresa = 4 then
    begin
      if _cdsPendenciaItem.Locate('NROM_Y;CD_EMPRESA',
        VarArrayOf([nrProduto, cdEmpresa]), []) then
        result := _cdsPendenciaItem.FieldByName('QT_PENDENTE').AsInteger;
    end;
    if cdEmpresa = 0 then
    begin
      if _cdsPendenciaItem.Locate('NROM_Y', nrProduto, []) then
        result := _cdsPendenciaItem.FieldByName('QT_PENDENTE').AsInteger;
    end;
  end;
end;

procedure T_frmCompras.FiltraProdutoEmpresa(nrProduto, cdEmpresa: Integer);
begin
  with _cdsProduto do
  begin
    { if nrProduto > 0 then
      filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +
      inttostr(cdEmpresa)
      ELSE
      filter := 'CD_EMPRESA=' + inttostr(cdEmpresa);
      filtered := true; }
  end;
end;

function T_frmCompras.GetPrecoItem(nrProduto, cdEmpresa: Integer;
  vlPrecoFornecedor, pcDescontoAbatimento: Double; IdPrecoAntual: Char;
  idPedidoBloqueado, PnrLIstaPrecoAtiva: Integer): TListaPreco;
Var
  DadosListaPreco: TListaPrecoAtiva;
begin
  with _cdsTabelaPreco do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +
      inttostr(cdEmpresa);
    filtered := true;
    // Params.ParamByName()
  end;
  result.vlPrecoLista := vlPrecoFornecedor;
  result.nrListaPreco := 0;
  result.nrVerba := 0;
  result.PcDescontoLista := 0;

  if not _cdsTabelaPreco.isEmpty then
  begin
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat > 0 then
    begin
      result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat * pcDescontoAbatimento;
      result.pcReajustePreco := 0;
      result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      result.vlPrecoBase := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat;
      result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA').AsFloat;
      result.pcIPILista := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
    end;
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat = 0 then
    begin
      result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat * pcDescontoAbatimento;
      result.pcReajustePreco := 0;
      result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      result.vlPrecoBase := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat;
      result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA_ANTERIOR').AsFloat;
      result.pcIPILista := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
    end;

    if idPedidoBloqueado = 1 then
    begin

    end;

    if idprecoAtual = 'N' then
    begin
      result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_LISTA_ANTERIOR').AsFloat * pcDescontoAbatimento;
      result.pcReajustePreco := _cdsTabelaPreco.FieldByName('PC_MUDANCA_PRECO').AsFloat;
      result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
    end;
    if result.pcReajustePreco < 0 then
      result.pcReajustePreco := 0;

    if PnrLIstaPrecoAtiva > 0 then
    begin
      DadosListaPreco := GetPrecoListaAtiva(PnrLIstaPrecoAtiva, cdEmpresa,nrProduto);
      if (DadosListaPreco.vlPrecoLista > 0) then
      begin
        result.nrListaPreco := PnrLIstaPrecoAtiva;
        result.vlPrecoBase := DadosListaPreco.vlPrecoLista;
        result.PcDescontoLista := DadosListaPreco.pcDescontoADicional;
        result.vlPrecoLista := DadosListaPreco.vlPrecoLista;
        result.nrVerba := DadosListaPreco.nrVerba;
      end;
      if (DadosListaPreco.vlPrecoLista = 0) and
        (DadosListaPreco.pcDescontoADicional > 0) then
      begin
        result.PcDescontoLista := DadosListaPreco.pcDescontoADicional;
        result.nrVerba := DadosListaPreco.nrVerba;
      end;

    end;

  end;
end;

procedure T_frmCompras.SetValoresPedidos;
begin
  _lbeSugeridoSC.Text := FormatFloat('###,###,##0', nrUnidadesSugeridaSC);

  _lbeValorSugeridoSC.Text := FormatFloat('###,###,##0.00', vlSugeridoSC);
  _lbeSugeridoRS.Text := FormatFloat('###,###,##0', nrUnidadesSugeridaRS);
  _lbeValorSugeridoRS.Text := FormatFloat('###,###,##0.00', vlSugeridoRS);
  _lbeValorCompradoSC.Text := FormatFloat('###,###,##0.00', vlCompradoSC);
  _lbeCompradoSC.Text := FormatFloat('###,###,##0', nrUnidadesCompradaSC);
  _lbeValorCompradoRS.Text := FormatFloat('###,###,##0.00', vlCompradoRS);
  _lbeCompradoRS.Text := FormatFloat('###,###,##0', nrUnidadesCompradaRS);
  _lbeUnidSugEmpresa.Text := FormatFloat('###,###,##0',
    nrUnidadesSugeridaEmpresa);
  _lbeValorSugEmpresa.Text := FormatFloat('###,###,##0.00', vlSugeridoEmpresa);
  _lbeUnidCompradoEmpresa.Text := FormatFloat('###,###,##0',
    TotaisPedidoEmpresa.nrUnidadesPedido);
  _lbeValorCompradoEmpresa.Text := FormatFloat('###,###,##0.00',
    TotaisPedidoEmpresa.vlPedidoBruto);
  _btnImprimir.Enabled := false;
  _btnImprimirRS.Enabled := false;
  if TotaisPedidoEmpresa.vlPedidoBruto > 0 then
    _btnConfirmaPedido.Enabled := true;

  if vlCompradoRS > 0 then
    _btnImprimirRS.Enabled := true;
  if vlCompradoSC > 0 then
    _btnImprimir.Enabled := true;

  _lbeValorCompradoCustoEmpresa.Text := FormatFloat('###,###,##0.00',
    TotaisPedidoEmpresa.vlPedidoLiquido);
  _lbeValorCompradoCustoRS.Text := FormatFloat('###,###,##0.00',
    vlCompradoCustoRS);
  _lbeValorCompradoCustoSC.Text := FormatFloat('###,###,##0.00',
    vlCompradoCustoSC);
  _lbeValorCompradoCustoEmpresa.Text := FormatFloat('###,###,##0.00',
    TotaisPedidoEmpresa.vlPedidoLiquido);
  _lbevtCMV.Text := FormatFloat('###,###,##0.00',
    TotaisPedidoEmpresa.vlPedidoCMV);

end;

procedure T_frmCompras.DadosEstoqueEmpresa(nrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT');
      Add('CASE');
      Add('WHEN CD_EMPRESA=0 THEN ''GERAL''');
      Add('WHEN CD_EMPRESA=1 THEN ''CD TUBAR?O''');
      Add('WHEN CD_EMPRESA=4 THEN ''CD STA. CRUZ DO SUL''');
      Add('END LOCAL,');
      Add('UNID_ESTOQUE,');
      Add('VL_ESTOQUE_FINANCEIRO,');
      Add('VL_ESTOQUE_FORNECEDOR,');
      Add('VL_ESTOQUE_VENDA,');
      Add('MTS_CUBICO');
      Add('FROM');
      Add('((SELECT   ESTOQUE.CD_EMPRESA,SUM(ESTOQUE.QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) AS UNID_ESTOQUE,');
      Add('SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) AS VL_ESTOQUE_FINANCEIRO,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* Lista.VL_UNITARIO_COMPRA) AS VL_ESTOQUE_FORNECEDOR,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* FINANCEIRO.VL_PRECO_VENDA) AS VL_ESTOQUE_VENDA,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) * ((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*');
      Add('QT_PROFUNDIDADE_MERCADORIA)/1000000)) MTS_CUBICO');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('LEFT OUTER JOIN');

      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND EM.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('WHERE');
      Add('MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND  ESTOQUE.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND ESTOQUE.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('GROUP BY ESTOQUE.CD_EMPRESA)');
      Add('UNION ALL');
      Add('(SELECT SUM(0),SUM(ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA ) AS UNID_ESTOQUE,');
      Add('SUM((1) * VT_CUSTO_FINANCEIRO_MERCADORIA) AS VL_ESTOQUE_FINANCEIRO,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* Lista.VL_UNITARIO_COMPRA) AS VL_ESTOQUE_FORNECEDOR,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* FINANCEIRO.VL_PRECO_VENDA) AS VL_ESTOQUE_VENDA,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* ((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000))');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND EM.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('WHERE');
      Add('MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND ESTOQUE.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND ESTOQUE.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor))');
      stQry.SaveToFile('C:\TEMP\sqlDadosEstoque.sql');
      with _cdsEstoqueEmpresa do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
        open;
      end;
      SetNomeCamposDadosEstoque;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.SetNomeCamposDadosEstoque;
begin
  TStringField(_cdsEstoqueEmpresa.FieldByName('LOCAL')).DisplayLabel := 'Local';
  TStringField(_cdsEstoqueEmpresa.FieldByName('LOCAL')).DisplayWidth := 20;

  TIntegerField(_cdsEstoqueEmpresa.FieldByName('UNID_ESTOQUE')).DisplayLabel :=
    'Unid.Estoque';
  TIntegerField(_cdsEstoqueEmpresa.FieldByName('UNID_ESTOQUE')).DisplayFormat :=
    '###,###,##0';
  TIntegerField(_cdsEstoqueEmpresa.FieldByName('UNID_ESTOQUE'))
    .DisplayWidth := 12;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FORNECEDOR'))
    .DisplayLabel := 'Vlr.Pre?o Lista';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FORNECEDOR'))
    .DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FORNECEDOR'))
    .DisplayWidth := 13;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FINANCEIRO'))
    .DisplayLabel := 'Vlr.Pre?o Custo';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FINANCEIRO'))
    .DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FINANCEIRO'))
    .DisplayWidth := 13;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('MTS_CUBICO')).DisplayLabel :=
    'Mts.Cubico';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('MTS_CUBICO')).DisplayFormat :=
    '###,##0.0000';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('MTS_CUBICO')).DisplayWidth := 06;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_VENDA')).DisplayLabel
    := 'Vlr.Pre?o Venda';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_VENDA')).DisplayFormat
    := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_VENDA'))
    .DisplayWidth := 13;
end;

procedure T_frmCompras.DadosEstoquePendente(nrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin

      Add('SELECT');
      Add('CASE');
      Add('WHEN CD_EMPRESA=0 THEN ''GERAL''');
      Add('WHEN CD_EMPRESA=1 THEN ''CD TUBAR?O''');
      Add('WHEN CD_EMPRESA=4 THEN ''CD STA. CRUZ DO SUL''');
      Add('END LOCAL,');
      Add('NR_UNIDADES_PENDENTES,');
      Add('VL_PENDENCIA_CUSTO,');
      Add('VL_PENDENCIA_FORNECEDOR,');
      Add('VL_PENDENCIA_VENDA,');
      Add('MTS_CUBICO_PEDENTE');
      Add('FROM');
      Add('((SELECT  CAPA.CD_EMPRESA,');
      Add('SUM(QUAY_Y - CHEY_Y) AS NR_UNIDADES_PENDENTES,');
      Add('SUM((QUAY_Y - CHEY_Y)* VCCI_Y) AS VL_PENDENCIA_CUSTO,');
      Add('SUM((QUAY_Y - CHEY_Y) * VL_PRECO_VENDA) AS VL_PENDENCIA_VENDA,');
      Add('SUM((QUAY_Y - CHEY_Y) * PFBY_Y) AS VL_PENDENCIA_FORNECEDOR,');
      Add('SUM((QUAY_Y - CHEY_Y)* ((QT_LARGURA_MERCADORIA*');
      Add('QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO_PEDENTE');
      Add('FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO');
      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND NROM_Y=MERCADORIA.CD_MERCADORIA');
      Add('AND NROM_Y=FINANCEIRO.CD_MERCADORIA');
      Add('AND CAPA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND SITP_P IN(''P'',''N'')');
      Add('AND SITY_Y IN(''P'',''N'')');
      Add('AND LABP_P=:PnrFornecedor');
      Add('GROUP BY CAPA.CD_EMPRESA)');
      Add('UNION ALL');
      Add('(SELECT  0,');
      Add('SUM(QUAY_Y - CHEY_Y) AS NR_UNIDADES_PENDENTES,');
      Add('SUM((QUAY_Y - CHEY_Y) *VCCI_Y) AS VL_PENDENCIA_CUSTO,');
      // ADD('SUM(QUAY_Y *PUNY_Y) AS VL_PENDENCIA_FINANCEIRO,');
      Add('SUM((QUAY_Y - CHEY_Y) * VL_PRECO_VENDA) AS VL_PENDENCIA_VENDA,');
      Add('SUM((QUAY_Y - CHEY_Y) *  PFBY_Y) AS VL_PENDENCIA_FORNECEDOR,');
      Add('SUM((QUAY_Y - CHEY_Y)* ((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA');
      Add('*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO_PEDENTE');
      Add('FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO');
      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND NROM_Y=MERCADORIA.CD_MERCADORIA');
      Add('AND NROM_Y=FINANCEIRO.CD_MERCADORIA');
      Add('AND CAPA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND SITP_P IN(''P'',''N'')');
      Add('AND SITY_Y IN(''P'',''N'')');
      Add('AND LABP_P=:PnrFornecedor))');
      stQry.SaveToFile('c:\temp\sqlPendencia.sql');
      with _cdsEstoquePendencia do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
        open;
      end;
      SetNomeCamposDadosPendenciaEstoque;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.SetNomeCamposDadosPendenciaEstoque;
begin
  TStringField(_cdsEstoquePendencia.FieldByName('LOCAL')).DisplayLabel
    := 'Local';
  TStringField(_cdsEstoquePendencia.FieldByName('LOCAL')).DisplayWidth := 20;

  TIntegerField(_cdsEstoquePendencia.FieldByName('NR_UNIDADES_PENDENTES'))
    .DisplayLabel := 'Unid.Pendente';
  TIntegerField(_cdsEstoquePendencia.FieldByName('NR_UNIDADES_PENDENTES'))
    .DisplayFormat := '###,###,##0';
  TIntegerField(_cdsEstoquePendencia.FieldByName('NR_UNIDADES_PENDENTES'))
    .DisplayWidth := 12;

  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FORNECEDOR'))
    .DisplayLabel := 'Vlr.Pre?o Lista';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FORNECEDOR'))
    .DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FORNECEDOR'))
    .DisplayWidth := 13;

  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_CUSTO'))
    .DisplayLabel := 'Vlr.Pre?o Custo';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_CUSTO'))
    .DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_CUSTO'))
    .DisplayWidth := 13;

  TFloatField(_cdsEstoquePendencia.FieldByName('MTS_CUBICO_PEDENTE'))
    .DisplayLabel := 'Mts.Cubico';
  TFloatField(_cdsEstoquePendencia.FieldByName('MTS_CUBICO_PEDENTE'))
    .DisplayFormat := '###,##0.0000';
  TFloatField(_cdsEstoquePendencia.FieldByName('MTS_CUBICO_PEDENTE'))
    .DisplayWidth := 06;

  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_VENDA'))
    .DisplayLabel := 'Vlr.Pre?o Venda';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_VENDA'))
    .DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_VENDA'))
    .DisplayWidth := 13;
end;

function T_frmCompras.AtualizaStatusPedido(idStatus: Char): Boolean;
var
  stPrazo: String;
  cdPagamento: Integer;
begin
  if (NrPedidoSC = 0) and (NrPedidoRS = 0) then
  begin
    nrContaItem := 0;
    close;

  end;
  if not IDConexaoBase(nrBase) then
  begin
    if not TestaConexaoBase(_dm._conexao, nrBase) then
    begin
      Mensagem('N?o conectado com Servidor', 16);
      close;
      exit;
    end;
  end;
  result := false;
  try
    if NrPedidoSC > 0 then
    begin

      if VerificaItensFaturados(NrPedidoSC) and (idStatus = 'I') then
      begin
        Mensagem('Pedido N?o pode ser cancelado' + #13 +
          'J? possui item faturado...', MB_ICONINFORMATION);
        result := false;
      end
      else
      begin
        stPrazo := PrazoPagamento(_cdsCondicaoPagamentoCDSC);
        cdPagamento := AbrePrazoParcelamento(stPrazo,
          _cdsCondicaoPagamentoCDSC.RecordCount);
        cdPrazoPagamentoAudititoria := cdPagamento;

        AtualizaCapaPedido(NrPedidoSC, cdPagamento, 1, nrLeadTime, idStatus,
          ' ', idAtualizaAgenda, dtPedido, dtAgenda, dtProximaAgenda,0);
        AtualizaStatusItemPedido(NrPedidoSC, 0, cdoperadorLogisticoPedido,
          idStatus);
        AlteraAuditoria(NrAuditoriaSC, nrLaboratorioLocal,
          // PnrFornecedor:Integer;
          dtAgenda, // PdtAgendaAtual:TDate;
          nrUnidadesCompradaSC, // PqtComprada:Integer;
          vlCompradoSC, // PvlComprado:Double;
          'Pedido Cancelado no Inicio Pelo Usuario',
          // PDS_JUSTIFICATIVA:String;
          cdPagamento);
        result := true;
        NrPedidoSC := 0;

      end;
    end;
    if NrPedidoRS > 0 then
    begin

      if VerificaItensFaturados(NrPedidoRS) and (idStatus = 'I') then
      begin
        Mensagem('Pedido N?o pode ser cancelado' + #13 +
          'J? possui item faturado...', MB_ICONINFORMATION);
        result := false;
      end
      else
      begin
        stPrazo := PrazoPagamento(_cdsCondicaoPagamentoCDRS);
        cdPagamento := AbrePrazoParcelamento(stPrazo,
          _cdsCondicaoPagamentoCDRS.RecordCount);
        cdPrazoPagamentoAudititoria := cdPagamento;

        AtualizaCapaPedido(NrPedidoRS, cdPagamento, 1, nrLeadTime, idStatus,
          ' ', idAtualizaAgenda, dtPedido, dtAgenda, dtProximaAgenda,0);
        AtualizaStatusItemPedido(NrPedidoRS, 0, cdoperadorLogisticoPedido,
          idStatus);
        AlteraAuditoria(NrAuditoriaRS, nrLaboratorioLocal,
          // PnrFornecedor:Integer;
          dtAgenda, // PdtAgendaAtual:TDate;
          nrUnidadesCompradaRS, // PqtComprada:Integer;
          vlCompradoRS, // PvlComprado:Double;
          'Pedido Cancelado no Inicio Pelo Usuario',
          // PDS_JUSTIFICATIVA:String;
          cdPagamento);
        result := true;
        NrPedidoRS := 0;
      end;
    end;
  except
    on E: Exception do
    begin
      trataerro(E.Message,
        format('Erro na Consulta Venda Fornecedor para Oper.Logaistico %d',
        [nrOperadorLogistico]));
      result := false;
    end;
  end;
  if result then
  begin
    nrContaItem := 0;
    close;
  end;
end;

procedure T_frmCompras.DadosVendaMes(nrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT');
      Add('CASE');
      Add('WHEN VAM.CD_EMPRESA=1 THEN ''CD TUBAR?O''');
      Add('WHEN VAM.CD_EMPRESA=4 THEN ''CD STA. CRUZ DO SUL''');
      Add('END LOCAL,');
      Add('SUM(QT_VENDIDA) AS NR_UNIDADES,SUM(QT_VENDIDA*VL_CMV) CMV,');
      Add('SUM(VL_PRECO_COMPRA*QT_VENDIDA) AS VT_FATURAMENTO_LISTA,');
      Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
      Add('SUM(QT_VENDIDA*FINANCEIRO.VL_PRECO_VENDA) AS VT_FATURAMENTO_VENDA,');
      Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
      Add('SUM(QT_VENDIDA*((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO');      Add('');
      Add('');
      Add('FROM');
      Add('  PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VAM');
      Add('  JOIN  PRDDM.DC_MERCADORIA MERCADORIA ON VAM.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('  JOIN  PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON VAM.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA AND VAM.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('  JOIN  PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON VAM.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
      Add('                                                     AND VAM.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA');
      Add('WHERE ');
      Add('CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND DT_VENDA_MERCADORIA=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY VAM.CD_EMPRESA');
      Add('UNION ALL');
      Add('(SELECT ''GERAL'',SUM(QT_VENDIDA) AS NR_UNIDADES,SUM(QT_VENDIDA*VL_CMV) CMV,');
      Add('SUM(VL_PRECO_COMPRA*QT_VENDIDA) AS VT_FATURAMENTO_LISTA,');
      Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
      Add('SUM(QT_VENDIDA*FINANCEIRO.VL_PRECO_VENDA) AS VT_FATURAMENTO_VENDA,');
      Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
      Add('SUM(QT_VENDIDA*((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO');
      Add('FROM');
      Add(' PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VAM ');
      Add('  JOIN  PRDDM.DC_MERCADORIA MERCADORIA ON VAM.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('  JOIN  PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON VAM.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA AND VAM.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('  JOIN  PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON VAM.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
      Add('                                                     AND VAM.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA');
      Add('WHERE');
      Add('CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND DT_VENDA_MERCADORIA=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0))');


      stQry.SaveToFile('C:\TEMP\QrySomaVendaLaboratorio30052017.sql');
      with _cdsVendaMes do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
        open;
      end;
      SetNomeCamposDadosVendaMes;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras._dbgPrePedidoCellClick(Column: TColumn);
begin
  cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
  nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
  cdProduto := _cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger;
    idMovimentoProximo := false;
    LocalizaProduto(CDProduto, // cdGAM,
      cdEmpresaPedido, // PcdEmpresa: Integer;
      '', // cdfornecedor,
      ''); // nmProduto: String)}

end;

procedure T_frmCompras._dbgPrePedidoColEnter(Sender: TObject);
begin
  // Self//
end;

procedure T_frmCompras._dbgPrePedidoDblClick(Sender: TObject);
begin
  cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
  nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
  cdProduto := _cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger;
    idMovimentoProximo := false;
    LocalizaProduto(CDProduto, // cdGAM,
      cdEmpresaPedido, // PcdEmpresa: Integer;
      '', // cdfornecedor,
      ''); // nmProduto: String)}

end;

procedure T_frmCompras._dbgPrePedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _dbgPrePedido do
  begin
    if _dsPrePedido.DataSet.FieldByName('CD_EMPRESA').AsInteger = 1 then
    begin
      Canvas.Font.Color := clBlack;
      Canvas.Brush.Color := clSkyBlue;
    end;
    if _dsPrePedido.DataSet.FieldByName('CD_EMPRESA').AsInteger = 4 then
    begin
      Canvas.Font.Color := clBlack;
      Canvas.Brush.Color := clWhite;
    end;
    { if (_cdsPrePedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger>)
      and (_cdsPedidoElaboradorSCQT_PEDIDO.AsInteger>0) then
      begin
      Canvas.brush.Color:= clYellow;
      Canvas.Font.Color:= clblack;
      end; }

    { if (_cdsPedidoElaboradorSCPC_DESCONTO_ADICIONAL.AsFloat>0) and
      (_cdsPedidoElaboradorSCNR_VERBA.AsInteger=0) then
      begin
      Canvas.brush.Color:= clRed;
      Canvas.Font.Color:= clWhite;
      end; }
    if (Column.Field.FieldName) = 'QUAY_Y' then
    begin
      if (_cdsPrePedido.FieldByName('QUAY_Y').AsInteger = 0) then
      begin
        Canvas.Brush.Color := clYellow;
        Canvas.Font.Color := clBlack;
      end;
    end;

    if ((TAuxDBGrid(_dbgPrePedido).DataLink.ActiveRecord + 1 =
    TAuxDBGrid(_dbgPrePedido).Row) or (gdSelected in State)) then
    begin
     Canvas.Brush.Color := clGreen;
    Canvas.Font.Style := _dbgPrePedido.Canvas.Font.Style + [fsBold];
    Canvas.Font.Color := clWHITE;
    end;


    if (gdFocused in State) then
    begin
      Canvas.Brush.Color := clBlue;
      Canvas.Font.Color := clWhite;
    end;
    defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmCompras._dbgPrePedidoEnter(Sender: TObject);
begin
  idMovimentoProximo := true;
end;

procedure T_frmCompras._dbgPrePedidoExit(Sender: TObject);
begin
  idMovimentoProximo := false;
end;

procedure T_frmCompras._dbgPrePedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 nmColuna :String;
begin
  case Key of

    vk_return:
      begin
         nmColuna:=UpperCase(_dbgPrePedido.SelectedField.FieldName);
         if nmColuna='QUAY_Y' then
         begin
             _cdsPrePedido.EDIT;
             _cdsPrePedido.POST;
             _cdsPrePedido.oPEN;
            _lbeQuantidadePedidoGrid.text:=_dbgPrePedido.selectedField.VALUE;
            _lbeQuantidadePedidoGrid.SETFOCUS;
             keybd_event(13, 0, 0, 0);
         end;


      end;

    VK_Down:
      begin
        nrProduto := _cdsPrePedido.FieldByName('cd_mercadoria').AsInteger;
        cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
        idMovimentoProximo := true;

      end;
    VK_Up:
      begin
        nrProduto := _cdsPrePedido.FieldByName('cd_mercadoria').AsInteger;
        cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
        idMovimentoProximo := true;

      end;
  end;
end;

procedure T_frmCompras._dbgPrePedidoMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  cdEmpresaPedido := _cdsPrePedido.FieldByName('cd_empresa').AsInteger;
  nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
  cdProduto := _cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger;
  if idMovimentoProximo then
  begin
    idMovimentoProximo := false;
    LocalizaProduto(CDProduto, // cdGAM,
      cdEmpresaPedido, // PcdEmpresa: Integer;
      '', // cdfornecedor,
      ''); // nmProduto: String)}
  end;

end;

procedure T_frmCompras._dbgPrePedidoTitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsPrePedido,Column);
end;

procedure T_frmCompras._dbgDiasEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // mude a cor das celulas em que valor = 0
  with _dbgDiasEstoque do
  begin
    if odd(_cdsDiasEstoque.RecNo) then
    begin
      _dbgDiasEstoque.Canvas.Font.Color := clBlack;
      _dbgDiasEstoque.Canvas.Brush.Color := clMoneyGreen;
    end
    else
    begin
      _dbgDiasEstoque.Canvas.Font.Color := clBlack;
      _dbgDiasEstoque.Canvas.Brush.Color := clWhite;
    end;

    defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

  // mude a cor das celulas em que valor = 0
  { with _dbgDiasEstoque do
    begin
    if odd(_cdsDiasEstoque_teste.RecNo) then
    begin
    _dbgDiasEstoque.Canvas.Font.Color := clBlack;
    _dbgDiasEstoque.Canvas.Brush.Color := clMoneyGreen;
    end
    else
    begin
    _dbgDiasEstoque.Canvas.Font.Color := clBlack;
    _dbgDiasEstoque.Canvas.Brush.Color := clWhite;
    end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end; }

end;

procedure T_frmCompras._dbgExcessoEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsExcessoEstoque.RecNo) then
  begin
    _dbgExcessoEstoque.Canvas.Font.Color := clBlack;
    _dbgExcessoEstoque.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgExcessoEstoque.Canvas.Font.Color := clBlack;
    _dbgExcessoEstoque.Canvas.Brush.Color := clWhite;
  end;
  _dbgExcessoEstoque.Canvas.fillRect(Rect);
  _dbgExcessoEstoque.defaultDrawColumncell(Rect, DataCol, Column, State);
end;

procedure T_frmCompras._dbgEstoquePendenciaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsEstoquePendencia.RecNo) then
  begin
    _dbgEstoquePendencia.Canvas.Font.Color := clBlack;
    _dbgEstoquePendencia.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgEstoquePendencia.Canvas.Font.Color := clBlack;
    _dbgEstoquePendencia.Canvas.Brush.Color := clWhite;
  end;
  _dbgEstoquePendencia.Canvas.fillRect(Rect);
  _dbgEstoquePendencia.defaultDrawColumncell(Rect, DataCol, Column, State);

end;

procedure T_frmCompras._dbgEstoqueEmpresaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsEstoqueEmpresa.RecNo) then
  begin
    _dbgEstoqueEmpresa.Canvas.Font.Color := clBlack;
    _dbgEstoqueEmpresa.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgEstoqueEmpresa.Canvas.Font.Color := clBlack;
    _dbgEstoqueEmpresa.Canvas.Brush.Color := clWhite;
  end;
  _dbgEstoqueEmpresa.Canvas.fillRect(Rect);
  _dbgEstoqueEmpresa.defaultDrawColumncell(Rect, DataCol, Column, State);
end;

procedure T_frmCompras.SetNomeCamposDadosVendaMes;
begin
  TStringField(_cdsVendaMes.FieldByName('LOCAL')).DisplayLabel := 'Local';
  TStringField(_cdsVendaMes.FieldByName('LOCAL')).DisplayWidth := 20;

  TIntegerField(_cdsVendaMes.FieldByName('NR_UNIDADES')).DisplayLabel :=
    'Unid.Faturadas';
  TIntegerField(_cdsVendaMes.FieldByName('NR_UNIDADES')).DisplayFormat :=
    '###,###,##0';
  TIntegerField(_cdsVendaMes.FieldByName('NR_UNIDADES')).DisplayWidth := 12;

  TFloatField(_cdsVendaMes.FieldByName('CMV')).DisplayLabel := 'Vlr. Total CMV';
  TFloatField(_cdsVendaMes.FieldByName('CMV')).DisplayFormat :=
    '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('CMV')).DisplayWidth := 13;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LISTA')).DisplayLabel :=
    'Fat.Pre?o Lista';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LISTA')).DisplayFormat :=
    '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LISTA'))
    .DisplayWidth := 13;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayLabel
    := 'Fat.Liquido';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayFormat
    := '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LIQUIDO'))
    .DisplayWidth := 13;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayLabel :=
    'Fat.Bruto';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayFormat :=
    '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_BRUTO'))
    .DisplayWidth := 13;

  TFloatField(_cdsVendaMes.FieldByName('MTS_CUBICO')).DisplayLabel :=
    'Mts.Cubico';
  TFloatField(_cdsVendaMes.FieldByName('MTS_CUBICO')).DisplayFormat :=
    '###,##0.0000';
  TFloatField(_cdsVendaMes.FieldByName('MTS_CUBICO')).DisplayWidth := 06;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_VENDA')).DisplayLabel :=
    'Vlr.Pre?o Venda';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_VENDA')).DisplayFormat :=
    '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_VENDA'))
    .DisplayWidth := 13;
end;

procedure T_frmCompras.SetCorQuantidadePedido(qtPedido, qtSugerida: Integer);
begin
  _lbeQuantidadePedidoGrid.Color := clWhite;
  _lbeQuantidadePedidoGrid.Font.Color := clBlack;
  if qtPedido > qtSugerida then
  begin
    _lbeQuantidadePedidoGrid.Color := clRed;
    _lbeQuantidadePedidoGrid.Font.Color := clWhite;
  end;
  if qtPedido < qtSugerida then
  begin
    _lbeQuantidadePedidoGrid.Color := clYellow;
    _lbeQuantidadePedidoGrid.Font.Color := clBlack;
  end;
  if (qtPedido = qtSugerida) and (qtPedido > 0) then
  begin
    _lbeQuantidadePedidoGrid.Color := clTeal;
    _lbeQuantidadePedidoGrid.Font.Color := clWhite;
  end;

end;

procedure T_frmCompras.PreparaGraficoHistorico(nrEmpresa, nrForncedor,
  nrProduto: Integer);
begin

  _tchVendasMensal.Title.Text[0] := 'Historico Estoque ';

  Series9.Active := false;
  Series15.Active := true;
  Series16.Active := true;
  Series17.Active := true;
  Series18.Active := true;
  MontaGraficoPedidosNovo(idPedido, nrProduto, qtEstoqueMaximo,
    qtEstoqueMinimo, 0);

end;

procedure T_frmCompras.SetCamposForncedor(nrGrupoFornecedor,
  nrLeadTimeFornecedor: Double);
begin
  _lbeGrupoPedido.Text := FormatFloat('000', nrGrupoFornecedor);
  _lbeLeadTime.Text := FormatFloat('000.00', nrLeadTimeFornecedor);
end;


procedure T_frmCompras.SetTabelasItensCurva(nrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    try
      stQry := TStringList.Create;
      with stQry do
      begin
        Add('SELECT CM.CD_EMPRESA,');
        Add('GFM.ID_CURVA_MERCADORIA,COUNT(CM.CD_MERCADORIA) NR_ITEM,');
        Add('GFM.QT_DIAS_FREQUENCIA_COMPRA,GFM.QT_ESTOQUE_MAXIMO, GFM.QT_ESTOQUE_MINIMO');
        Add('FROM');
        Add('PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM,');
        Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
        Add('PRDDM.DC_COMPRA_MERCADORIA CM ,');
        Add('PRDDM.DC_MERCADORIA M');
        Add('WHERE');
        Add('GFM.ID_CURVA_MERCADORIA       = CM.ID_CURVA_MERCADORIA');
        Add('AND GFM.CD_GRUPO_CURVA_FABRICANTE = GF.CD_GRUPO_CURVA_FABRICANTE');
        Add('AND CM.CD_GRUPO_FORNECEDOR        = GF.CD_GRUPO_FORNECEDOR');
        Add('AND CM.ID_CURVA_MERCADORIA        = GFM.ID_CURVA_MERCADORIA');
        Add('AND CM.CD_MERCADORIA              = M.CD_MERCADORIA');
        Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrForncedor');
        Add('GROUP BY  CM.CD_EMPRESA,GFM.ID_CURVA_MERCADORIA,');
        Add('GFM.QT_DIAS_FREQUENCIA_COMPRA, GFM.QT_ESTOQUE_MAXIMO,');
        Add('GFM.QT_ESTOQUE_MINIMO');
        Add('ORDER BY CD_EMPRESA,GFM.ID_CURVA_MERCADORIA');
      end;

      with _cdsItensCurva do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrForncedor').AsInteger := nrFornecedor;
        open;
        SetGridParamentro;
      end;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Abrir Nr. de Itens Curva...');
      end;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.SetGridParamentro;
begin
  TIntegerField(_cdsItensCurva.FieldByName('NR_ITEM')).DisplayLabel :=
    'Nr.Item';
  TIntegerField(_cdsItensCurva.FieldByName('NR_ITEM')).DisplayWidth := 6;

  TIntegerField(_cdsItensCurva.FieldByName('CD_EMPRESA')).DisplayLabel := 'CD';
  TIntegerField(_cdsItensCurva.FieldByName('CD_EMPRESA')).DisplayWidth := 3;

  TStringField(_cdsItensCurva.FieldByName('ID_CURVA_MERCADORIA')).DisplayLabel
    := 'Curva';
  TStringField(_cdsItensCurva.FieldByName('ID_CURVA_MERCADORIA'))
    .DisplayWidth := 5;

  TIntegerField(_cdsItensCurva.FieldByName('QT_DIAS_FREQUENCIA_COMPRA'))
    .DisplayLabel := 'Frequencia';
  TIntegerField(_cdsItensCurva.FieldByName('QT_DIAS_FREQUENCIA_COMPRA'))
    .DisplayWidth := 10;

  TIntegerField(_cdsItensCurva.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayLabel :=
    'Estq.Max.';
  TIntegerField(_cdsItensCurva.FieldByName('QT_ESTOQUE_MAXIMO'))
    .DisplayWidth := 10;

  TIntegerField(_cdsItensCurva.FieldByName('QT_ESTOQUE_MINIMO')).DisplayLabel :=
    'Estq.Min.';
  TIntegerField(_cdsItensCurva.FieldByName('QT_ESTOQUE_MINIMO'))
    .DisplayWidth := 10;
end;

function T_frmCompras.GetEstoqueMultEmpresa(nrProduto,
  nrEmpresa: Integer): Integer;
begin
  result := 0;
  if _cdsEstoqueMultEmpresa.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([nrProduto, nrEmpresa]), []) then
    result := _cdsEstoqueMultEmpresa.FieldByName('ESTOQUE').AsInteger;
end;

procedure T_frmCompras.setCoresGraficoCurva(idCurva: String);
begin
  _lbCurvaSCgrade.Font.Color := clBlack;
  _lbCurvaSCgrade.Color := clBtnFace;
  _lbCurvaSCgrade.Color := clBlack;
  _tchVendasMensal.Color := clBtnFace;
  _tchVendasMensal.Title.Font.Color := clBlack;
  _tchVendasMensal.LeftAxis.LabelsFont.Color := clWhite;
  _tchVendasMensal.BottomAxis.LabelsFont.Color := clBlack;
  if idCurva = 'A' then
  begin
    _lbCurvaSCgrade.Font.Color := clBlack;
    _lbCurvaSCgrade.Color := clInfoBk;
    _tchVendasMensal.Color := clInfoBk;
    _tchVendasMensal.Title.Font.Color := clBlack;
    _tchVendasMensal.LeftAxis.LabelsFont.Color := clBlack;
    _tchVendasMensal.BottomAxis.LabelsFont.Color := clBlack;
  end;
  if idCurva = 'B' then
  begin
    _lbCurvaSCgrade.Font.Color := clBlack;
    _lbCurvaSCgrade.Color := clSkyBlue;
    _tchVendasMensal.Color := clSkyBlue;
    _tchVendasMensal.Title.Font.Color := clBlack;
    _tchVendasMensal.LeftAxis.LabelsFont.Color := clBlack;
    _tchVendasMensal.BottomAxis.LabelsFont.Color := clBlack;
  end;
  if idCurva = 'C' then
  begin
    _lbCurvaSCgrade.Font.Color := clWhite;
    _lbCurvaSCgrade.Color := clMaroon;
    _tchVendasMensal.Color := clMaroon;
    _tchVendasMensal.Title.Font.Color := clWhite;
    _tchVendasMensal.LeftAxis.LabelsFont.Color := clWhite;
    _tchVendasMensal.BottomAxis.LabelsFont.Color := clWhite;
  end;
  if idCurva > 'C' then
  begin
    _lbCurvaSCgrade.Font.Color := clWhite;
    _lbCurvaSCgrade.Color := clRed;
    _tchVendasMensal.Color := clRed;
    _tchVendasMensal.Title.Font.Color := clWhite;
    _tchVendasMensal.LeftAxis.LabelsFont.Color := clWhite;
    _tchVendasMensal.BottomAxis.LabelsFont.Color := clWhite;
  end;

end;

procedure T_frmCompras.Orderna;
Var
  Marcador: TBookmark;
begin

  { if _chkOrdenaCurva.Checked then
    _cdsProduto.IndexFieldNames := 'ID_CURVA;NM_MERCADORIA;CD_MERCADORIA;CD_EMPRESA'
    else
    _cdsProduto.IndexFieldNames := 'NM_MERCADORIA;CD_MERCADORIA;CD_EMPRESA'; }

end;

procedure T_frmCompras.SetDadosPreco(vlPreco, pcDescontoRepasse,
  pcDescontoPadrao, pcDescontoADicional: Double);
begin
  _lbePrecoListaGrid.Text := FormatFloat('###,###,##0.00', vlPreco);
  // _lbePercentualRepasseGrid.Text := FormatFloat('##0.00', pcDescontoRepasse);
  // RETIRADO A PEDIDO Raquel e Arthur 05/12/2016
  _lbePercentualRepasseGrid.Visible := false;

  _lbeDescontoPadraoGrid.Text := FormatFloat('##0.00', pcDescontoPadrao);
  _lbeDescontoAdicionalGrid.Text := FormatFloat('##0.000', pcDescontoADicional);

end;

function T_frmCompras.LocalizaProduto(cdGAM, PcdEmpresa: Integer;
  cdfornecedor, nmProduto: String): Boolean;
VAR
  nmTemp: sTRING;
begin
  if cdGAM > 0 then
  begin
    IF _cdsProduto.Locate('CD_PRODUTO;CD_EMPRESA',
      VarArrayOf([cdGAM, PcdEmpresa]), []) THEN
      SetNavegacaoProduto(0)

    ELSE
      Mensagem('Produto N?o encontrado !!!', 16);
  end;
  if cdfornecedor <> '' then
  begin
    IF _cdsProduto.Locate('CD_INTERNO_LABORATORIO', cdfornecedor, []) THEN

    ELSE
      Mensagem('Produto N?o encontrado !!!', 16);
  end;

  if nmProduto <> '' then
  begin
    { if nmInidiceNomeProduto='' then
      begin
      with _cdsProduto.IndexDefs.AddIndexDef do
      begin
      Name:='OrdenarNomeProduto';
      Fields:='NM_MERCADORIA';
      nmInidiceNomeProduto:='OrdenarNomeProduto';
      Options:= [ixDescending, ixCaseInsensitive];
      end;
      end; }
    if _cdsProduto.Locate('NM_MERCADORIA', nmProduto, [loPartialKey]) then
      nmTemp := _cdsProduto.FieldByName('NM_MERCADORIA').AsString;

  end;

  // SetCamposSugestaoIdeal();

end;

procedure T_frmCompras.FocoAdicional;
begin
  idDigitaPrecoNota := false;
  if _chkDigitaPrecoNota.Checked then
  begin
    idDigitaPrecoNota := true;
    _lbeDescontoAdicionalGrid.Text := '0,000';
    if _lbePrecoNotaGrid.CanFocus then
      _lbePrecoNotaGrid.SetFocus;
    _lbePrecoNotaGrid.SelectAll;
    exit;
  end
  else
  begin
    if _lbeDescontoAdicionalGrid.CanFocus then
      _lbeDescontoAdicionalGrid.SetFocus;
  end;
end;

procedure T_frmCompras.FocoNumeroVerba;
begin
  if nrQuantidadeComprada = 0 then
  begin
    _lbeDescontoAdicionalGrid.SetFocus;
    _lbeDescontoAdicionalGrid.SelectAll;
    if (cdoperadorLogisticoPedido > 1) then
    begin
      SetFocuCursor(IdPosicaoCursor);

      exit;
    end
  end;
  if (nrQuantidadeComprada > 0) and (cdoperadorLogisticoPedido = 1) then
  begin
    _lbeNumeroVerbaGrid.SetFocus;
    _lbeNumeroVerbaGrid.SelectAll;
  end;

  { if (nrQuantidadeComprada > 0) and (cdoperadorLogisticoPedido=1) then
    begin
    SetFocuCursor(IdPosicaoCursor);
    end; }
end;

procedure T_frmCompras.InsereItenPeloNrVerba;
begin
  nrVerba := StrToIntDef(_lbeNumeroVerbaGrid.Text, 0);
  pcDescontoADicional := StrToFloatDef(_lbeDescontoAdicionalGrid.Text, 0);
  pcVerba := StrToFloatDef(_lbePcVerbaGrid.Text, 0);
  _nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  SetPrecoItem(nrprodutoPreco, nrDigitoPreco, _nrEmpresa, 0,
    nrQuantidadeComprada, nrVerba, 0, 0, pcDescontoADicional);
  PrecoItemSC := PrecoItem;
  if nrQuantidadeComprada > 0 then
    SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  // idMovimentoProximo := true;
  SetNavegacaoProduto(2);
  PosicionaGrid(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
                _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  IF _lbeQuantidadePedidoGrid.CanFocus then
        _lbeQuantidadePedidoGrid.SetFocus;
            exit;


end;

Procedure T_frmCompras.SetCoresCaixaCamadaPalete(qtPedido, qtEmbalagem,
  qtCamada, qtPalete: Integer);
var
  qtMultiplo: Integer;
begin
  qtMultiplo := qtPedido mod qtEmbalagem;
  if qtPedido > 0 then
  begin
    if qtMultiplo > 0 then
    begin
      _edtQuantidadeCaixa.Color := clRed;
      _edtQuantidadeCaixa.Font.Color := clWhite;
    end;
    if qtMultiplo = 0 then
    begin
      _edtQuantidadeCaixa.Color := clGreen;
      _edtQuantidadeCaixa.Font.Color := clWhite;
    end;
    qtMultiplo := 0;
    if qtCamada > 0 then
    begin
      qtMultiplo := qtPedido mod (qtCamada * qtEmbalagem);
      if qtMultiplo > 0 then
      begin
        _edtQuantidadeCaixaCamadaGrid.Color := clRed;
        _edtQuantidadeCaixaCamadaGrid.Font.Color := clWhite;
      end;
      if qtMultiplo = 0 then
      begin
        _edtQuantidadeCaixaCamadaGrid.Color := clGreen;
        _edtQuantidadeCaixaCamadaGrid.Font.Color := clWhite;
      end;
    end;
    qtMultiplo := 0;
    if qtPalete > 0 then
    begin
      qtMultiplo := qtPedido mod (qtPalete * qtEmbalagem);
      if qtMultiplo > 0 then
      begin
        _edtQuantidadeCaixaPaleteGrid.Color := clRed;
        _edtQuantidadeCaixaPaleteGrid.Font.Color := clWhite;
      end;
      if qtMultiplo = 0 then
      begin
        _edtQuantidadeCaixaPaleteGrid.Color := clGreen;
        _edtQuantidadeCaixaPaleteGrid.Font.Color := clWhite;
      end;
    end;
  end;
end;

Procedure T_frmCompras.SetCoresDefaultCaixaCamadaPalete;
begin

  _edtQuantidadeCaixa.Color := clWhite;
  _edtQuantidadeCaixa.Font.Color := clBlack;

  _edtQuantidadeCaixaCamadaGrid.Color := clWhite;
  _edtQuantidadeCaixaCamadaGrid.Font.Color := clBlack;

  _edtQuantidadeCaixaPaleteGrid.Color := clWhite;
  _edtQuantidadeCaixaPaleteGrid.Font.Color := clBlack;
end;

function T_frmCompras.CarregaSugestaoCompra(nrEmpresa: Integer;
  stLoacal: String; vlSugeridoCusto, vlSugeridoVda,
  vlMtsCubico: Double): Boolean;
begin
  _cdsExcessoEstoque.close;
  _cdsExcessoEstoque.CreateDataSet;
  _cdsExcessoEstoque.open;
  _cdsExcessoEstoque.Append;
  _cdsExcessoEstoqueCD_EMPRESA.AsInteger := 1;
  _cdsExcessoEstoqueID_LOCAL.AsString := 'CD TUBAR?O';
  _cdsExcessoEstoqueVL_EXCESSO_CUSTO.AsFloat := vlExcessoCustoCDSC;
  _cdsExcessoEstoqueVL_EXCESSO_VENDA.AsFloat := vlExcessoVendaCDSC;
  _cdsExcessoEstoqueNR_UNIDADES_EXCESSO.AsFloat := nrUnidadesExcessoCDSC;
  _cdsExcessoEstoqueVL_EXCESSSO_MTS_CUBICO.AsFloat := vlExcessoMtsCubicoCDSC;
  _cdsExcessoEstoque.post;
  _cdsExcessoEstoque.open;

end;

function T_frmCompras.CarregaSugestaoCompraTemp(nrEmpresa: Integer;
  stLoacal: String; vlSugeridoCusto, vlSugeridoVda,
  vlMtsCubico: Double): Boolean;
begin
  _cdsExcessoEstoque.Append;
  _cdsExcessoEstoqueCD_EMPRESA.AsInteger := 1;
  _cdsExcessoEstoqueID_LOCAL.AsString := 'CD TUBAR?O';
  _cdsExcessoEstoqueVL_EXCESSO_CUSTO.AsFloat := vlExcessoCustoCDSC;
  _cdsExcessoEstoqueVL_EXCESSO_VENDA.AsFloat := vlExcessoVendaCDSC;
  _cdsExcessoEstoqueNR_UNIDADES_EXCESSO.AsFloat := nrUnidadesExcessoCDSC;
  _cdsExcessoEstoqueVL_EXCESSSO_MTS_CUBICO.AsFloat := vlExcessoMtsCubicoCDSC;
  _cdsExcessoEstoque.post;
  _cdsExcessoEstoque.open;

end;

function T_frmCompras.CriaTabela(tabela: TClientDataSet): Boolean;
begin
  tabela.close;
  tabela.CreateDataSet;
  tabela.open;
end;

function T_frmCompras.CarregaTabelaTemporaria(tabela: TClientDataSet;
  nrEmpresa: Integer; stLoacal: String; nrUnidadedes: Double;
  vlCusto, vlVenda, vlMtsCubico: Double): Boolean;
begin
  tabela.open;
  tabela.Append;
  tabela.Fields[0].AsString := stLoacal;
  tabela.Fields[1].AsInteger := nrEmpresa;
  tabela.Fields[2].AsInteger :=
    StrToIntDef(FormatFloat('########0', nrUnidadedes), 0);
  tabela.Fields[3].AsFloat := vlCusto;
  tabela.Fields[4].AsFloat := vlVenda;
  tabela.Fields[5].AsFloat := vlMtsCubico;
  tabela.post;
end;


procedure T_frmCompras._cbxFiltroItemPedidoChange(Sender: TObject);
begin
 FiltroItemPedido(1);
end;

function T_frmCompras.CompraItem(PnrProduto, PnrEmpresa, PqtPedido: Integer;
  PpcDescontoADicional: Double): Boolean;
begin
  nrprodutoPreco := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
  PnrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  // Mercadoria := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0, nrEmpresa,cdoperadorLogisticoPedido);
  Mercadoria := DadosProdutos(nrprodutoPreco, PnrEmpresa,
    cdoperadorLogisticoPedido);

  if PpcDescontoADicional > 0 then
    pcDescontoADicional := PpcDescontoADicional;

  pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
  nrGeracaoVerba := Mercadoria.nrGeracaoVerba;
  if PqtPedido > 0 then
  begin
    nrQuantidadePedido := PqtPedido;
    nrQuantidadeComprada := PqtPedido;
  end
  else
    nrQuantidadePedido := StrToIntDef(_lbeQuantidadePedidoGrid.Text, 0);

  MostraDaDosCalculoGrid;
  SetPrecoItem(nrprodutoPreco, nrDigitoPreco, PnrEmpresa, 0,
    nrQuantidadeComprada, nrVerbaSC, 0, 0, PpcDescontoADicional);
  PrecoItemSC := PrecoItem;

  if nrQuantidadeComprada > 0 then
    SetPedido(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
  // idMovimentoProximo := true;
  if PqtPedido = 0 then
    _cdsProduto.Next;

end;

function T_frmCompras.CompraItemInicial(PnrProduto, PnrEmpresa, PqtPedido,
  PqtPedidoSugerida: Integer; PpcDescontoADicional: Double): Boolean;
Var
  vlSusgestaoIdeal, pcCreditoICMS, pcIPILista, vlSugeridoLocal, vlVerba: Double;
  vlSusgestaoPossivel, nrQtdadeEstoque, nrQtadeEmbalagemCompra,
    nrQtadeCamadaEmbalagem, nrPedidoLocal, nrAuditoriaLocal, nrEmpresa: Integer;

begin
  // PnrEmpresa      := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  // Mercadoria := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0, nrEmpresa,cdoperadorLogisticoPedido);
  Mercadoria := DadosProdutos(PnrProduto, PnrEmpresa,cdoperadorLogisticoPedido);

  nrQtdadeEstoque := Mercadoria.qtEstoque;

  pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
  nrGeracaoVerba := Mercadoria.nrGeracaoVerba;
  nrQuantidadeComprada:=0;
  if PqtPedido > 0 then
  begin
    nrQuantidadePedido   := PqtPedido;
    nrQuantidadeComprada := PqtPedido;

    if PnrEmpresa = 1 then
    begin
      nrPedidoLocal := NrPedidoSC;
      nrAuditoriaLocal := NrAuditoriaSC;

    end;
    if PnrEmpresa = 4 then
    begin
      nrPedidoLocal := NrPedidoRS;
      nrAuditoriaLocal := NrAuditoriaRS;

    end;
    DadosItemPedidoLog := localizaItemPedido(nrPedidoLocal,
                                             Mercadoria.nrProduto,
                                             PnrEmpresa);
    // if  then

    // EliminaItemPedido(NrPedidoLocal, Mercadoria.nrProduto, '');
    ManutencaoItemAuditoria(nrAuditoriaLocal, Mercadoria.nrProduto,
      nrUnidadesPossivel, 0, vlSugeridoLocal, 0, qtPendenteItem,
      nrQuantidadeEstoque, vlMediaDia * 30, nrDiasCoberturaEstoqueAuditoria,
      PnrEmpresa, nrPedidoLocal);

  end;

  // MostraDaDosCalculoGrid;

  DadosPendencia := setPendenciaCD(nrProduto, PnrEmpresa);

  qtPendenteItem := DadosPendencia.QtPendente;

  if PpcDescontoADicional > 0 then
    nrVerbaSC := nrVerbaInicio;

  SetPrecoItem(Mercadoria.nrProduto, Mercadoria.dgProduto, PnrEmpresa, 0,
    nrQuantidadeComprada, nrVerbaSC, 0, 0, PpcDescontoADicional);

  PrecoItemSC := PrecoItem;

  { NrVerbaIncialLocal:=0;
    if (pcDescontoAdicionalPre>0) and (nrVerbaInicio>0) then
    begin
    pcDescontoVerbaIncioLocal:=100;
    NrVerbaIncialLocal:=nrVerbaInicio;
    nrVerba:=nrVerbaInicio;
    end; }

  if nrVerba > 0 then
  begin
    vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba,
      PrecoItem.vlPrecoCusto, Mercadoria.pcIpiProduto, 0,
      Mercadoria.pcCreditoICMS, Mercadoria.nrProduto, Mercadoria.nrTipoProduto,
      nrQuantidadeComprada, Mercadoria.nrLaboratorio, Mercadoria.idPis);
  end;

  if nrQuantidadeComprada > 0 then
  begin
    if (NrPedidoSC = 0) and (PnrEmpresa = 1) then
      CriaCapaPedido(PnrEmpresa);
    if (NrPedidoRS = 0) and (PnrEmpresa = 4) then
      CriaCapaPedido(PnrEmpresa);

    if PnrEmpresa = 1 then
      nrPedidoLocal := NrPedidoSC;
    if PnrEmpresa = 4 then
      nrPedidoLocal := NrPedidoRS;

    pcCreditoICMS := Mercadoria.pcCreditoICMS;
    pcIPILista := precoLista.pcIPILista;
    if (precoLista.PcIcmsCompra > 0) and
      (dtSistema >= strtodate('01/12/2016')) then
      pcCreditoICMS := precoLista.PcIcmsCompra;

    DadosItemPedidoLog := localizaItemPedido(nrPedidoLocal,
      Mercadoria.nrProduto, PnrEmpresa);
    if (nrQuantidadeComprada > 0) and (not DadosItemPedidoLog.idItemGravado) then
      GravaLogPedidoCompra(nrPedidoLocal, // PnrPedido,
                           Mercadoria.nrProduto, // PnrMercadoria,
                           DadosItemPedidoLog.nrQuantidadePedido, // PqtAnterior,
                           nrQuantidadeComprada, // PqtAtual:Integer;
                           DadosItemPedidoLog.pcDescontoADicional, // PpcDescontoAnterior,
                           pcDescontoADicional, // PpcDescontoAtual:Double;
                           DadosItemPedidoLog.nrVerba, // PnrVerbaAnterior,
                           nrVerba, // :Integer;
                           DadosItemPedidoLog.pcVerba, // PpcVerbaAnterior,
                           pcVerba, // PpcVerbaAtual:Double;
                           nmLogin, // PnmUsuario:String;
                           DadosItemPedidoLog.idStatusItem, // PidStatusAnterior,
                           'N', // PidStatusAtual:String;
                           DadosItemPedidoLog.qtSugerida, // PqtSugeridaAnterior,
                           nrUnidadesPossivel); // PqtSugeridaAtual:Integer):Boolean;}

    if (DadosItemPedidoLog.nrQuantidadePedido = 0) and
       (not DadosItemPedidoLog.idItemGravado) then
    begin
      IF nrDiasEstoqueAtual>999 THEN
         nrDiasEstoqueAtual:=999;
      GravaItemPedidoAtual(nrPedidoLocal, // NUMBER(6)
        Mercadoria.nrProduto, // NROM_Y ,//NUMBER(6)
        nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
        PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
        nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
        PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
        PqtPedidoSugerida, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        PrecoItem.pcMundancaPreco, PnrEmpresa, pcCreditoICMS, pcIPILista);
    end;

    if DadosItemPedidoLog.nrQuantidadePedido > 0 then
    begin
      AtualizaItemPedido(nrPedidoLocal, Mercadoria.nrProduto,
        nrQuantidadeComprada, 0, nrPrazoPedido, nrVerba, 0, 1,
        nrDiasEstoqueAtual, nrUnidadesPossivel, 'N', 'N', 'N', pcDescontoPadrao,
        PpcDescontoADicional, 0, pcVerba, 0, 0, PrecoItem.vlPrecoLiquido,
        PrecoItem.vlPrecoLista, PrecoItem.vlPrecoCusto, 0, 0, vlVerba,
        vlMediaMesSC, ' Recalculado Sugest?o', PnrEmpresa);

    end;


    // PC_MUDANCA_PRECO:Double):Boolean;//NUMBER(7,4)

    { GravaLogItemPedido(NrPedidoLocal, // NUMBER(6)
      Mercadoria.nrProduto, // NROM_Y ,//NUMBER(6)
      nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
      0, // CHEY_Y :Integer;//NUMBER(7)
      pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
      'S', // SITY_Y :String;//CHAR(1)
      nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
      PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
      PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
      PpcDescontoADicional, // DADY_Y ,//NUMBER(5,2)
      nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
      PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
      nrVerba, // NRVV_Y :Integer;//NUMBER(6)
      0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
      0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
      'N', // ID_MARGEM,//CHAR(1)
      'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
      pcverba, // PC_VERBA,//  NUMBER(5,2)
      0, // VL_VERBA:Double;//NUMBER(13,2)
      0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
      0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
      0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
      cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
      nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
      PqtPedidoSugerida, // QT_SUGERIDA :Integer;//NUMBER(7)
      vlMediaMesSC, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
      PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
      PrecoItem.pcMundancaPreco,
      PnrEmpresa,
      pcCreditoICMS ); }
  end;

end;

Function T_frmCompras.FiltraPendenciaItem(nrProduto, cdEmpresa: Integer)
  : TClientDataSet;
begin
  with _cdsPendenciaItem do
  begin
    filtered := false;
    filter := 'NROM_Y=' + inttostr(nrProduto) + ' and CD_EMPRESA=' +
      inttostr(cdEmpresa);
    filtered := true;
  end;
  result := NIL;
  if NOT _cdsPendenciaItem.isEmpty then
    result := _cdsPendenciaItem;
end;

procedure T_frmCompras.CarregaPedidoCompra;
Var
  DadosPedido: TDadosValoresPedido;

begin
  DadosPedido := GetValoresPedido(StrToIntDef(_lbeNrPedido.Text, 0),false);
  if DadosPedido.nrPedido > 0 then
  begin
    if DadosPedido.idStatusPedido = 'C' then
    begin
      Mensagem('Pedido  Cancelado', 48);
      exit;
    end;
    if DadosPedido.idStatusPedido = 'F' then
    begin
      Mensagem('Pedido  J? Faturado', 48);
      exit;
    end;
    if DadosPedido.idStatusPedido = 'I' then
    begin
      Mensagem('Pedido  Consta Como Inativo', 48);
      exit;
    end;
    if DadosPedido.idStatusPedido = 'N' then
    begin
      nrPedidoTelaCompra := DadosPedido.nrPedido;
      cdoperadorLogisticoPedido := DadosPedido.nrOperadorLogistico;
      TotaisPedidoEmpresa := TotalizaPedidoEmpresa(NrPedidoSC, NrPedidoRS, 0,
        DadosPedido.idStatusPedido);
      idPedido := DadosPedido.cdEmpresa;
      _lbeNrLaboratorio.Text := FormatFloat('0000', DadosPedido.nrFornecedor);
      if idPedido = 1 then
      begin
        NrPedidoSC := nrPedidoTelaCompra;
        _cbxOpcaoCDs.ItemIndex := 1;
        _cbxOpcaoCDs.Enabled := false;
        nrUnidadesCompradaSC := DadosPedido.nrTotalUnidadesPedido;
        vlCompradoSC := DadosPedido.vtPrecoFornecedorPedido;
        TotaisPedidoSC := TotalizaPedido(NrPedidoSC, 0,
          DadosPedido.idStatusPedido);
        vlCompradoSC := TotaisPedidoSC.vlPedidoBruto;
        vlCompradoCustoSC := TotaisPedidoSC.vlPedidoLiquido;
        nrUnidadesCompradaSC := TotaisPedidoSC.nrUnidadesPedido;
        SetNomeCampoItemPedidoSC;
        nrDiasPrazo := nrPrazoPedido;
        AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
          DadosPedido.cdEmpresa, '');
        nrDiasAjusteFim := nrDiasFrequencia;
      end;
      if idPedido = 4 then
      begin
        NrPedidoRS := nrPedidoTelaCompra;
        TotaisPedidoRS := TotalizaPedido(NrPedidoRS, 0,
          DadosPedido.idStatusPedido);
        vlCompradoRS := TotaisPedidoRS.vlPedidoBruto;
        vlCompradoCustoRS := TotaisPedidoRS.vlPedidoLiquido;
        nrUnidadesCompradaRS := TotaisPedidoRS.nrUnidadesPedido;
        //SetNomeCampoItemPedidoRS;
        AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
          DadosPedido.cdEmpresa, '');
        _cbxOpcaoCDs.ItemIndex := 1;
        _cbxOpcaoCDs.Enabled := false;
      end;
      // SetPedido(idPedido);
      TotaisPedidoEmpresa := TotalizaPedidoEmpresa(NrPedidoSC, NrPedidoRS, 0,
        DadosPedido.idStatusPedido);
      SetValoresPedidos;
    end;

  end;
end;

procedure T_frmCompras.SetFocuCursor(PidPosicao: Boolean);
begin
  if ((_chkCodigoGam.Checked) or (_chkCodigoFornecedor.Checked)) and
    (IdPosicaoCursor = false) then
  begin
    if _lbePesquisa.CanFocus then
      _lbePesquisa.SetFocus;
    exit;
  end
  else
  begin
    if _lbeQuantidadePedidoGrid.CanFocus then
    begin
      _lbeQuantidadePedidoGrid.SetFocus;
      _lbeQuantidadePedidoGrid.SelectAll;
    end;
    // exit;
  end;
end;

procedure T_frmCompras.SetGraficoPreco;
var
  nrMesRef, I, contaMes: Integer;
  corBarra: TColor;
  stMes: String;
  Mesreferencia: Integer;
  dtreferencia: tdate;

begin

  if _cdsUltimosPrecos <> nil then
  begin
    _cdsUltimosPrecos.open;
    _cdsUltimosPrecos.IndexFieldNames := 'DT_FATURAMENTO';
    _cdsUltimosPrecos.First;
    Series9.Clear;
    dtreferencia := IncMonth(dtPedido, -12);
    Mesreferencia := MonthOf(dtreferencia);
    contaMes := Mesreferencia;
    while Not _cdsUltimosPrecos.eof do
    begin
      nrMesRef := _cdsUltimosPrecos.FieldByName('MES').AsInteger;
      vlUltimosPrecos[nrMesRef] := _cdsUltimosPrecos.FieldByName
        ('VL_PRECO').AsFloat;
      _cdsUltimosPrecos.Next;
    end;
    for I := 1 to 12 do
    begin
      if contaMes > 12 then
        contaMes := 1;
      corBarra := clWhite;
      if idMesSelecionado[contaMes] = 'S' then
      begin
        if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
          corBarra := clTeal;
        if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
          corBarra := $000080FF; // $0073EAFB;//clMoneyGreen;
        inc(nrMesesSelecionados);
      end;
      if nrReferencia < vlUltimosPrecos[contaMes] then
        nrReferencia := vlUltimosPrecos[contaMes];
      stMes := UpperCase(ShortMonthNames[contaMes]);
      Series9.Add(vlUltimosPrecos[contaMes], stMes, corBarra);
      inc(contaMes);
    end;
    stMes := 'ATUAL';
    corBarra := clWhite;
    if idMesSelecionado[13] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    Series9.Add(vlUltimosPrecos[13], stMes, corBarra);
    _tchVendasMensal.Refresh;
    _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
    // _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProdutoID_LOCAL_CD.AsString;
    /// _edtCD.Text := _cdsProdutoID_LOCAL_CD.AsString;
    /// if _cdsProdutoID_LOCAL_CD.AsString = 'SC' then
    // begin
    // _edtCD.Color:=clGreen;
    // _edtCD.font.Color:=clblack;
    // end;
  end;

end;

procedure T_frmCompras.PrazoSC(PnrDiasPrazo: Integer);
begin
  _cdsCondicaoPagamentoCDSC.close;
  _cdsCondicaoPagamentoCDSC.CreateDataSet;
  _cdsCondicaoPagamentoCDSC.open;
  _cdsCondicaoPagamentoCDSC.Append;
  _cdsCondicaoPagamentoCDSCNR_DIAS.AsInteger := PnrDiasPrazo;
  _cdsCondicaoPagamentoCDSC.post;
  _cdsCondicaoPagamentoCDSC.open;
  setGridPrazo;
end;

procedure T_frmCompras.PrazoRS(PnrDiasPrazo: Integer);
begin
  _cdsCondicaoPagamentoCDRS.close;
  _cdsCondicaoPagamentoCDRS.CreateDataSet;
  _cdsCondicaoPagamentoCDRS.open;
  _cdsCondicaoPagamentoCDRS.Append;
  _cdsCondicaoPagamentoCDRSNR_DIAS.AsInteger := PnrDiasPrazo;
  _cdsCondicaoPagamentoCDRS.post;
  _cdsCondicaoPagamentoCDRS.open;

end;

procedure T_frmCompras.setGridPrazo;
begin
  TIntegerField(_cdsCondicaoPagamentoCDSC.FieldByName('NR_PARCELA'))
    .DisplayLabel := 'Nr.Parcelas';
  TIntegerField(_cdsCondicaoPagamentoCDSC.FieldByName('NR_PARCELA'))
    .DisplayWidth := 05;

  TIntegerField(_cdsCondicaoPagamentoCDSC.FieldByName('NR_DIAS')).DisplayLabel
    := 'Prazo';
  TIntegerField(_cdsCondicaoPagamentoCDSC.FieldByName('NR_DIAS'))
    .DisplayWidth := 05;
end;

procedure T_frmCompras.AberturaPedido;

begin
  DadosPedidoAbertuta := GetValoresPedido(StrToIntDef(_lbeNrPedido.Text, 0),false);
  if DadosPedidoAbertuta <> nil then
  begin
    idPedidoBloqueado := DadosPedidoAbertuta.idBloqueiodeDigitacao;
    if DadosPedidoAbertuta.nrFornecedor <> nrLaboratorioLocal then
    begin
      Mensagem('Este pedido N?o Corresponde ao Fornecedor do Pedido', 16);
      _lbeNrPedido.SetFocus;
      exit;
    end;
    if DadosPedidoAbertuta.idStatusPedido = 'I' then
    begin
      Mensagem('Este pedido Est? Inativo', 16);
      _lbeNrPedido.SetFocus;
      exit;

    end;
    if DadosPedidoAbertuta.idStatusPedido = 'C' then
    begin
      Mensagem('Este pedido foi Cancelado... ', 16);
      _lbeNrPedido.SetFocus;
      exit;

    end;
    if DadosPedidoAbertuta.idBloqueiodeDigitacao = 1 then
    begin
      Mensagem('Este pedido Est? Bloqueado Para Altera??o... ' + #13 +
        'Motivo mudan?a de Regra de Pre?o', 16);
      _lbeNrPedido.SetFocus;
      exit;

    end;
  end;

end;

procedure T_frmCompras.ExecutaAberturaPedido;
begin
  idPedidoBonificado := false;
  if DadosPedidoAbertuta.idPedidoBonificado then
    idPedidoBonificado := true;
  cdoperadorLogisticoPedido := DadosPedidoAbertuta.nrOperadorLogistico;
  if (DadosPedidoAbertuta.nrPedido = 0) and
    (StrToIntDef(_lbeNrPedido.Text, 0) > 0) then
  begin
    Mensagem('Pedido N?o Encontrado...', 16);
    _lbeNrPedido.SetFocus;
    exit;
  end

  else IF _lbeNrLaboratorio.CanFocus THEN
    _lbeNrLaboratorio.SetFocus;
  NrPedidoSC := 0;
  NrPedidoRS := 0;
  nrPedidoTelaCompra := 0;
  if DadosPedidoAbertuta.cdEmpresa = 1 then
  begin
    NrPedidoSC := DadosPedidoAbertuta.nrPedido;
  end;
  if DadosPedidoAbertuta.cdEmpresa = 4 then
    NrPedidoRS := DadosPedidoAbertuta.nrPedido;
  nrPrazoPedido := DadosPedidoAbertuta.nrDiasPrazo;

  idPedido := DadosPedidoAbertuta.cdEmpresa;
  idprecoAtual := 'S';
  if _cbxListaPreco.ItemIndex = 1 then
    idprecoAtual := 'N';
  _cdsProduto.First;

  _lbeNrPedido.Enabled := false;
  AbreItemPedidoMultiEmpresa(nrPedidoTelaCompra, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
end;

function T_frmCompras.getNumerodeDias(PnrMes: Integer): Integer;
begin
  result := 0;
  if _cdsDiasVenda.Locate('MES', PnrMes, []) then
    result := _cdsDiasVenda.FieldByName('DIAD_D').AsInteger;

end;

function T_frmCompras.DadosProdutos(PnrProduto, PnrEmpresa, PcdOperadorLogistico
  : Integer): TMercadoria;

begin
  with _cdsTabelaProduto do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(PnrProduto) + ' AND CD_EMPRESA=' +
      inttostr(PnrEmpresa);
    filtered := true;
  end;

  if not _cdsTabelaProduto.isEmpty then
  begin
    Mercadoria := TMercadoria.Create;

    Mercadoria.cdProduto := _cdsTabelaProduto.FieldByName('CD_PRODUTO')
      .AsInteger;
    Mercadoria.nrProduto := _cdsTabelaProduto.FieldByName('CD_MERCADORIA')
      .AsInteger;
    Mercadoria.dgProduto := _cdsTabelaProduto.FieldByName('NR_DV_MERCADORIA')
      .AsInteger;
    Mercadoria.qtEstoque := _cdsTabelaProduto.FieldByName('ESTOQUE').AsInteger;
    Mercadoria.qtEstoqueFISICO := _cdsTabelaProduto.FieldByName('QT_FISICO')
      .AsInteger;
    Mercadoria.nrLaboratorio := _cdsTabelaProduto.FieldByName
      ('CD_GRUPO_FORNECEDOR').AsInteger;

    Mercadoria.nrUnidadesVencidas := _cdsTabelaProduto.FieldByName('QT_VENCIDO')
      .AsInteger;
    Mercadoria.nrReservaProblematica := _cdsTabelaProduto.FieldByName
      ('QT_RESERVA_PROBLEMATICA').AsInteger;
    Mercadoria.nrUnidadeReservaPedido := _cdsTabelaProduto.FieldByName
      ('QT_RESERVADO').AsInteger;
    Mercadoria.nrUnidadeBloqueada := _cdsTabelaProduto.FieldByName
      ('QT_BLOQUEADO').AsInteger;
    Mercadoria.qtEmbalagemCompra := _cdsTabelaProduto.FieldByName
      ('QT_EMBALAGEM_COMPRA').AsInteger;
    Mercadoria.qtEmbalagemVenda := _cdsTabelaProduto.FieldByName
      ('QT_EMBALAGEM_VENDA').AsInteger;
    Mercadoria.qtdCaixaPalete := _cdsTabelaProduto.FieldByName
      ('QT_CAIXA_PALETE').AsInteger;
    Mercadoria.qtdCaixaCamada := _cdsTabelaProduto.FieldByName
      ('QT_CAIXA_CAMADA').AsInteger;
    Mercadoria.qtMetroCubico := _cdsTabelaProduto.FieldByName
      ('MTS_CUBICO').AsFloat;
    Mercadoria.nrTipoProduto := _cdsTabelaProduto.FieldByName('DS_NIVEL_ECNM')
      .AsInteger;
    Mercadoria.pcRepasseCompra := _cdsTabelaProduto.FieldByName
      ('PC_REPASSE_COMPRA').AsFloat;
    Mercadoria.pcCreditoICMS := _cdsTabelaProduto.FieldByName
      ('PC_CREDITO_ICMS').AsFloat;
    Mercadoria.pcIpiProduto := _cdsTabelaProduto.FieldByName
      ('PC_IPI_MERCADORIA').AsFloat;
    Mercadoria.vlPrecoCadastro := _cdsTabelaProduto.FieldByName
      ('VL_PRECO_COMPRA').AsFloat;
    Mercadoria.vlPrecoCompra := _cdsTabelaProduto.FieldByName
      ('VL_PRECO_COMPRA').AsFloat;
    Mercadoria.vlPrecoVenda := _cdsTabelaProduto.FieldByName
      ('VL_PRECO_VENDA').AsFloat;
    Mercadoria.vlPrecoVendaAnterior := _cdsTabelaProduto.FieldByName
      ('VL_PRECO_VENDA_ANTERIOR').AsFloat;
    Mercadoria.vlPrecoCompraAnterior := _cdsTabelaProduto.FieldByName
      ('VL_PRECO_COMPRA_ANTERIOR').AsFloat;
    Mercadoria.nmProduto := _cdsTabelaProduto.FieldByName
      ('NM_MERCADORIA').AsString;
    Mercadoria.dsApresentacao := _cdsTabelaProduto.FieldByName
      ('DS_APRESENTACAO_MERCADORIA').AsString;
    Mercadoria.nmProdutoCompleto := _cdsTabelaProduto.FieldByName
      ('NM_COMPLETO').AsString;
    if _cdsTabelaProduto.FieldByName('DS_NIVEL_ECNM').AsInteger = 1 then
      Mercadoria.dsFinalidade :=
        setEspecialidade(_cdsTabelaProduto.FieldByName('DS_NIVEL_EITM')
        .AsInteger)
    else
      Mercadoria.dsFinalidade :=
        setEspecialidade(_cdsTabelaProduto.FieldByName('DS_NIVEL_ERGM')
        .AsInteger);
    Mercadoria.idCurva := _cdsTabelaProduto.FieldByName('ID_CURVA_MERCADORIA')
      .AsString[1];
    Mercadoria.dtUltimaSaida := _cdsTabelaProduto.FieldByName('DT_ULTIMA_SAIDA')
      .AsDateTime;
    Mercadoria.dtUltimaEntrada := _cdsTabelaProduto.FieldByName
      ('DT_ULTIMA_ENTRADA').AsDateTime;
    Mercadoria.idTipoListaFiscal := _cdsTabelaProduto.FieldByName
      ('ID_TIPO_LISTA_FISCAL').AsString[1];
    Mercadoria.idSuperfulo := _cdsTabelaProduto.FieldByName('ID_SUPERFLUO')
      .AsString[1];
    Mercadoria.idPisCofins := _cdsTabelaProduto.FieldByName('ID_COFINS')
      .AsString[1];
    Mercadoria.idPis := _cdsTabelaProduto.FieldByName('ID_PIS').AsString[1];
    Mercadoria.idCofins := _cdsTabelaProduto.FieldByName('ID_COFINS')
      .AsString[1];
    Mercadoria.idCipado := _cdsTabelaProduto.FieldByName('ID_CIPADO')
      .AsString[1];
    Mercadoria.idRetemICMS := _cdsTabelaProduto.FieldByName('ID_RETEM_ICMS')
      .AsString[1];
    Mercadoria.idRepasseIcms := _cdsTabelaProduto.FieldByName('ID_REPASSE_ICMS')
      .AsString[1];

    Mercadoria.cdInternoFornecedor := _cdsTabelaProduto.FieldByName
      ('CD_INTERNO_LABORATORIO').AsString;
    Mercadoria.qtEmbalagemCompra := setQuantidadeEmbalagem
      (Mercadoria.nrProduto);

    if Mercadoria.qtEmbalagemCompra < 1 then
      Mercadoria.qtEmbalagemCompra := _cdsTabelaProduto.FieldByName
        ('QT_EMBALAGEM_COMPRA').AsInteger;
    Mercadoria.qtEmbalagemVenda := _cdsTabelaProduto.FieldByName
      ('QT_EMBALAGEM_VENDA').AsInteger;
    // DadosFornecedor                    := GetDadosLaboratorio(Mercadoria.nrLaboratorio);
    Mercadoria.idForcaRepasse := DadosFornecedor.idForcaRepasse;
    Mercadoria.idIpiLiquidoComRepasse := DadosFornecedor.idIpiLiquidoComRepasse;
    Mercadoria.idIpiLiquidoSemRepasse := DadosFornecedor.idIpiLiquidoSemRepasse;
    Mercadoria.idIpiBrutoComRepasse := DadosFornecedor.idIpiBrutoComRepasse;
    Mercadoria.idIpiBrutoSemRepasse := DadosFornecedor.idIpiBrutoSemRepasse;
    Mercadoria.idIcmDestacado := DadosFornecedor.idIcmDestacado;
    Mercadoria.idReduzIcms := DadosFornecedor.idReduzIcms;
    Mercadoria.dsRazaoSocialFornecedor := DadosFornecedor.dsRazaoSocial;
    Mercadoria.dsUndidadeFederacaoFornecedor :=
      DadosFornecedor.dsUnidadeFederacao;
    Mercadoria.dsFantasiaFornecedor := DadosFornecedor.dsNomeFantasia;
    Mercadoria.pcGeracaoVerba := DadosFornecedor.pcGeracaoVerba;
    Mercadoria.nrGeracaoVerba := DadosFornecedor.nrGeracaoVerba;

    Mercadoria.dsLocalizacao := _cdsTabelaProduto.FieldByName
      ('CD_LOCALIZACAO').AsString;
    Mercadoria.dtAtualizacaoPreco := _cdsTabelaProduto.FieldByName
      ('DT_ATUALIZACAO_PRECO_VENDA').AsDateTime;
    Mercadoria.nrEmpresaProduto := _nrEmpresa;
    Mercadoria.idSituacaoMercadoriaCompra := _cdsTabelaProduto.FieldByName
      ('ID_SITUACAO_COMPRA').AsString[1];
    Mercadoria.idSituacaoMercadoriaEstoque := _cdsTabelaProduto.FieldByName
      ('ID_SITUACAO_ESTOQUE').AsString[1];
    Mercadoria.vlFinanceiroEstoque := _cdsTabelaProduto.FieldByName
      ('VT_CUSTO_FINANCEIRO_MERCADORIA').AsFloat;
    Mercadoria.dsUnidadeMedia := _cdsTabelaProduto.FieldByName
      ('DS_UNIDADE_MEDIDA').AsString;
    Mercadoria.nrComprador := _cdsTabelaProduto.FieldByName('CD_COMPRADOR')
      .AsInteger;

    Mercadoria.pcDescontoPadrao := _cdsTabelaProduto.FieldByName
      ('PC_DESCONTO_PADRAO_COMPRA').AsFloat;
    if PcdOperadorLogistico > 1 then
      Mercadoria.pcDescontoPadrao := GetPcProdutosOl(PcdOperadorLogistico,
        Mercadoria.nrProduto, PnrEmpresa);

    result := Mercadoria;
  end
  else
    result := nil;
end;

function T_frmCompras.setEspecialidade(PnrEspecialiade: Integer): String;
begin
  if _cdsEspecealidade <> nil then
  begin
    With _cdsEspecealidade do
    begin
      filtered := false;
      filter := 'NR_SEQUENCIAL=' + inttostr(PnrEspecialiade);
      filtered := true;
    end;
    result := ' N?o Cadastada';
    if not _cdsEspecealidade.isEmpty then
      result := _cdsEspecealidade.FieldByName('ESPECEALIDADE').AsString
  end;
end;

function T_frmCompras.setQuantidadeEmbalagem(PnrProduto: Integer): Integer;
begin
  if _cdsEmbalagemMercadoria <> nil then
  begin
    With _cdsEmbalagemMercadoria do
    begin
      filtered := false;
      filter := 'CD_MERCADORIA=' + inttostr(PnrProduto);
      filtered := true;
    end;
    result := 00;
    if not _cdsEmbalagemMercadoria.isEmpty then
      result := _cdsEmbalagemMercadoria.FieldByName('QT_EMBALAGEM').AsInteger;
  end;
end;

function T_frmCompras.SetDadosFornecedor(PnrFornecedor: Integer)
  : TDadosFornecedor;

begin
  if DadosFornecedor <> nil then
    DadosFornecedor := nil;
  DadosFornecedor := TDadosFornecedor.Create;
  DadosFornecedor.idForcaRepasse := 'N';
  DadosFornecedor.idIpiLiquidoComRepasse := 'N';
  DadosFornecedor.idIpiLiquidoSemRepasse := 'N';
  DadosFornecedor.idIpiBrutoComRepasse := 'N';
  DadosFornecedor.idIpiBrutoSemRepasse := 'N';
  DadosFornecedor.nrPrazoPedido := 0;
  DadosFornecedor.dtAgenda := 0;
  DadosFornecedor.dsUnidadeFederacao := '';
  DadosFornecedor.nrGrupoFornecedor := 01;
  DadosFornecedor.dsDiasPedido := 'NNNNN';
  DadosFornecedor.idIcmDestacado := 'N';
  DadosFornecedor.idReduzIcms := 'N';
  DadosFornecedor.idForcaRepasse := 'N';
  DadosFornecedor.dsRazaoSocial := '';
  DadosFornecedor.dsNomeFantasia := '';
  DadosFornecedor.pcGeracaoVerba := 0;
  DadosFornecedor.nrGeracaoVerba := 0;
  DadosFornecedor.dsGrupoFornecedor := '';

  if not _cdsDadosFornecedor.isEmpty then
  begin
    DadosFornecedor.nrPrazoPedido := _cdsDadosFornecedor.FieldByName
      ('QT_DIAS_PRAZO_PADRAO').AsInteger;
    DadosFornecedor.dtAgenda := _cdsDadosFornecedor.FieldByName
      ('DT_AGENDAMENTO').AsDateTime;
    DadosFornecedor.dsUnidadeFederacao := _cdsDadosFornecedor.FieldByName
      ('UFEP_P').AsString;
    DadosFornecedor.nrGrupoFornecedor := _cdsDadosFornecedor.FieldByName
      ('CD_GRUPO_CURVA_FABRICANTE').AsInteger;
    DadosFornecedor.dsDiasPedido := _cdsDadosFornecedor.FieldByName
      ('DS_NUMERO_DIA_SEMANA').AsString;
    DadosFornecedor.idIcmDestacado := _cdsDadosFornecedor.FieldByName
      ('ID_ICMS_DESTACADO').AsString[1];
    DadosFornecedor.idReduzIcms := _cdsDadosFornecedor.FieldByName
      ('ID_REDUZ_ICMS').AsString[1];
    DadosFornecedor.idForcaRepasse := _cdsDadosFornecedor.FieldByName
      ('ID_REPASSE_ICMS').AsString[1];
    DadosFornecedor.nrFornecedor := _cdsDadosFornecedor.FieldByName
      ('CD_GRUPO_FORNECEDOR').AsInteger;
    DadosFornecedor.dsRazaoSocial := _cdsDadosFornecedor.FieldByName
      ('NOMP_P').AsString;
    DadosFornecedor.dsNomeFantasia := _cdsDadosFornecedor.FieldByName
      ('SIGP_P').AsString;
    DadosFornecedor.stCNPJ := FormatFloat('00000000000000',
      _cdsDadosFornecedor.FieldByName('NR_CNPJ').AsFloat);
    DadosFornecedor.nrPrazoPedido := _cdsDadosFornecedor.FieldByName
      ('QT_DIAS_PRAZO_PADRAO').AsInteger;
    DadosFornecedor.nrDiasLeadTime := _cdsDadosFornecedor.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger;
    DadosFornecedor.pcGeracaoVerba := _cdsDadosFornecedor.FieldByName('PC_VERBA_GERACAO').AsFloat;
    DadosFornecedor.nrGeracaoVerba := _cdsDadosFornecedor.FieldByName('NR_VERBA_GERACAO').AsInteger;
    DadosFornecedor.dsGrupoFornecedor := _cdsDadosFornecedor.FieldByName('DS_GRUPO_FORNECEDOR').AsString;
  end;

  result := DadosFornecedor;
end;

function T_frmCompras.GetUltimaCompra(PnrProduto, PnrCD,
  PnrOPerador: Integer): tdate;
begin
  if _cdsDataUltimaCompra <> nil then
  begin
    with _cdsDataUltimaCompra do
    begin
      filtered := false;
      filter := 'CD_MERCADORIA=' + inttostr(PnrProduto) + ' AND CD_EMPRESA=' +
        inttostr(PnrCD) + ' AND CD_OPERADOR_LOGISTICO =' +
        inttostr(PnrOPerador);
      filtered := true;
    end;
    result := strtodate('01/01/1899');
    if not _cdsDataUltimaCompra.isEmpty then
      result := _cdsDataUltimaCompra.FieldByName('DT_ULTIMA_COMPRA').AsDateTime;
  end;
end;

FUNCTION T_frmCompras.AtualizaDiasEstoque(DiasEstoque
  : TDadosDiasEstoque): Boolean;
begin
  _cdsDiasEstoque_teste.open;

  if _cdsDiasEstoque_teste.Locate('CD_EMPRESA', DiasEstoque.cdEmpresa, [])
    = false then
  begin
    _cdsDiasEstoque_teste.open;
    _cdsDiasEstoque_teste.Append;
    _cdsDiasEstoque_testenmCD.AsString := DiasEstoque.nmLocal;
    _cdsDiasEstoque_testeCD_EMPRESA.AsInteger := DiasEstoque.cdEmpresa;
    if (DiasEstoque.vlDiasEstoqueFornecedor > 0) then
      _cdsDiasEstoque_testeVL_ESTOQUE_FORNECEDOR.AsFloat :=
        DiasEstoque.vlDiasEstoqueFornecedor;
    if DiasEstoque.vlDiasEstoquecomprador > 0 then
      _cdsDiasEstoque_testeVL_ESTOQUE_COMPRADOR.AsFloat :=
        DiasEstoque.vlDiasEstoquecomprador;

    if DiasEstoque.vlDiasEstoqueFornecedorPen > 0 then
      _cdsDiasEstoque_testeVL_ESTOQUE_FORN_PEND.AsFloat :=
        DiasEstoque.vlDiasEstoqueFornecedorPen;
    if DiasEstoque.vlDiasEstoquecompradorPen > 0 then
      _cdsDiasEstoque_testeVL_ESTOQUE_COMPR_PENDENCIA.AsFloat :=
        DiasEstoque.vlDiasEstoquecompradorPen;
  end
  else
  begin

    _cdsDiasEstoque_teste.open;
    _cdsDiasEstoque_teste.Edit;
    _cdsDiasEstoque_testenmCD.AsString := DiasEstoque.nmLocal;
    _cdsDiasEstoque_testeCD_EMPRESA.AsInteger := DiasEstoque.cdEmpresa;
    if (DiasEstoque.vlDiasEstoqueFornecedor > 0) then
      _cdsDiasEstoque_testeVL_ESTOQUE_FORNECEDOR.AsFloat :=
        DiasEstoque.vlDiasEstoqueFornecedor;
    if DiasEstoque.vlDiasEstoquecomprador > 0 then
      _cdsDiasEstoque_testeVL_ESTOQUE_COMPRADOR.AsFloat :=
        DiasEstoque.vlDiasEstoquecomprador;

    if DiasEstoque.vlDiasEstoqueFornecedorPen > 0 then
      _cdsDiasEstoque_testeVL_ESTOQUE_FORN_PEND.AsFloat :=
        DiasEstoque.vlDiasEstoqueFornecedorPen;
    if DiasEstoque.vlDiasEstoquecompradorPen > 0 then
      _cdsDiasEstoque_testeVL_ESTOQUE_COMPR_PENDENCIA.AsFloat :=
        DiasEstoque.vlDiasEstoquecompradorPen;
  end;

end;

procedure T_frmCompras.SetCorPendencia(PqtPedido, PqtPendente, PqtAtendida,
  PqtProcessada: Integer);
begin
  _lbePendenciaGrid.Color := clWhite;
  _lbePendenciaGrid.Font.Color := clBlack;
  if (PqtPedido > (PqtPedido - PqtAtendida - PqtProcessada)) and
    (PqtPendente > 0) then
  begin
    _lbePendenciaGrid.Color := clYellow;
    _lbePendenciaGrid.Font.Color := clBlack;
  end;
  if (PqtPedido = (PqtAtendida + PqtProcessada)) and (PqtPendente > 0) then
  begin
    _lbePendenciaGrid.Color := clGreen;
    _lbePendenciaGrid.Font.Color := clWhite;
  end;
  if (PqtPedido > 0) AND (PqtAtendida = 0) and (PqtPendente = 0) then
  begin
    _lbePendenciaGrid.Color := clRed;
    _lbePendenciaGrid.Font.Color := clWhite;
  end;

  _lbePendenciaGrid.ShowHint := true;
  _lbePendenciaGrid.Hint := ('Qtd.Pedido        = ' + FormatFloat('###,###,##0',
    PqtPedido) + #13 + 'Qtd. Entrada      = ' + FormatFloat('###,###,##0',
    PqtProcessada) + #13 + 'Qtd. Em Transito  = ' + FormatFloat('###,###,##0',
    PqtAtendida) + #13 + 'Qtd. Pendente     = ' + FormatFloat('###,###,##0',
    PqtPedido - PqtAtendida - PqtProcessada));

end;

Function T_frmCompras.AlterItemPedidoElaborado(PcdProduto, PnrEmpresa,
  PqtPedido, PnrVerba, PcdOperadorLogistico: Integer;
  PpcDescontoADicional, PpcVerba: Double): TCalculoPreco;
var
  DadosProduto: TMercadoria;
  precoLista: TListaPreco;
  PrecoItem: TCalculoPreco;
  DadosCodigo: TCodigoValido;
  pcDescontoPadrao, vlCustoItem: Double;
  idprecoAtual: String;
begin
  idprecoAtual := 'S';
  DadosCodigo := TransformaStringCodigo(inttostr(PcdProduto));
  DadosProduto := GetMercadoriaNova(DadosCodigo.nrCodigo, DadosCodigo.nrDigito,
    0, PnrEmpresa, 1,'');

  precoLista := GetPrecoItem(DadosCodigo.nrCodigo, PnrEmpresa,
    DadosProduto.vlPrecoCadastro, 1, idprecoAtual[1], 0, nrListaPreco);
  pcDescontoPadrao := DadosProduto.pcDescontoPadrao;
  PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista,
    DadosProduto.vlPrecoCadastro, DadosProduto.pcRepasseCompra,
    DadosProduto.pcDescontoPadrao, PpcDescontoADicional,
    DadosProduto.pcCreditoICMS, DadosProduto.pcIpiProduto,
    precoLista.pcIPILista, precoLista.pcReajustePreco, PqtPedido,
    precoLista.nrListaPreco, 'N', DadosProduto.idForcaRepasse,
    DadosProduto.idIpiLiquidoComRepasse, DadosProduto.idIpiLiquidoSemRepasse,
    DadosProduto.idIpiBrutoComRepasse, DadosProduto.idIpiBrutoSemRepasse,
    inttostr(DadosProduto.nrTipoProduto),
    DadosProduto.dsUndidadeFederacaoFornecedor, DadosProduto.idSuperfulo,
    DadosProduto.idIcmDestacado, DadosProduto.idReduzIcms,
    DadosProduto.idPisCofins);
  if PnrVerba > 0 then
  begin
    PrecoItem.vlVerba := CalculaPcVerba(PpcVerba, PrecoItem.vlVerba,
      PrecoItem.vlPrecoCusto, DadosProduto.pcIpiProduto, 0,
      DadosProduto.pcCreditoICMS, DadosProduto.nrProduto,
      DadosProduto.nrTipoProduto, PqtPedido, DadosProduto.nrLaboratorio,
      DadosProduto.idPis);
  end;
  vlCustoItem := PrecoItem.vlPrecoCusto;

  result := PrecoItem;

end;

procedure T_frmCompras.RecalculaSugestaodeCompraCD(idEmpresa: Integer);
var
  nrRegistro, nrProdutoLocal, nrEmpresaLocal, qtPedidoLocal,
    NrDiasPedido: Integer;

begin
  _cdsProduto.First;
  NrDiasPedido := 0;
  nrRegistro := 0;
  nrUnidadesSugeridaSC := 0;
  nrUnidadesSugeridaRS := 0;
  nrUnidadesExcessoCDSC := 0;
  vlExcessoCustoCDSC := 0;
  vlExcessoListaCDSC := 0;
  vlExcessoVendaCDSC := 0;
  vlExcessoMtsCubicoCDSC := 0;
  nrUnidadesExcessoCDRS := 0;
  vlExcessoCustoCDRS := 0;
  vlExcessoListaCDRS := 0;
  vlExcessoVendaCDRS := 0;
  vlExcessoMtsCubicoCDRS := 0;
  nrUnidadesSugeridaRS := 0;
  nrUnidadesSugeridaSC := 0;
  vlSugeridoRS := 0;
  vlSugeridoSC := 0;

  _cdsProduto.filtered := false;
  _cdsProduto.First;
  while not _cdsProduto.eof do
  begin
    inc(nrRegistro);
    nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
    if _cdsProduto.FieldByName('CD_EMPRESA').AsInteger = 1 then
      NrDiasPedido := NrDiasCompraSC;
    if _cdsProduto.FieldByName('CD_EMPRESA').AsInteger = 4 then
      NrDiasPedido := NrDiasCompraRS;

    if NrDiasPedido = 0 then
    begin
      setParamentroItemCurvaCompra(_cdsProduto.FieldByName('CD_EMPRESA').AsInteger, // PnrEmpresa,
        NrDiasPedido, // PnrDiasEstoque:Integer;
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1]);
      // idCurva: Char)

      NrDiasPedido := nrParamentoEstoque;
    end;

    if idEmpresa = 1 then
    begin
      FiltraVendaLaboratorio(nrProduto, 1, cdoperadorLogisticoPedido);

      SetVendasLaboratorioCD(nrProduto, 1, nrRegistro, // nrRegistro: Integer;
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
      // idCurva: String);

      SetVendasLaboratorioRecalculo(nrProduto, 1, NrDiasPedido, nrRegistro,
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);

    end;
    if idEmpresa = 4 then
    begin
      // PosionaProduto(nrProduto,idEmpresa);
      FiltraVendaLaboratorio(nrProduto, 4, cdoperadorLogisticoPedido);
      SetVendasLaboratorioCD(nrProduto, 4, nrRegistro, // nrRegistro: Integer;
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
      // idCurva: String);

      SetVendasLaboratorioRecalculo(nrProduto, 1, NrDiasPedido, nrRegistro,
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
    end;
    if idEmpresa = 0 then
    begin
      FiltraVendaLaboratorio(nrProduto, _cdsProduto.FieldByName('CD_EMPRESA')
        .AsInteger, cdoperadorLogisticoPedido);
      SetVendasLaboratorioCD(nrProduto, _cdsProduto.FieldByName('CD_EMPRESA')
        .AsInteger, nrRegistro, // nrRegistro: Integer;
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString);
      // idCurva: String);
      { SetVendasLaboratorioRecalculo(nrProduto,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
        NrDiasPedido,
        nrRegistro,
        _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString); }

    end;
    _stbCompras.Panels[1].Text := 'Recalculando Previs?o de compra...' +
      FormatFloat('0000000', _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) +
      ' - ' + _cdsProduto.FieldByName('NM_COMPLETO').AsString;
    _stbCompras.Panels[2].Text := 'Registro...' + FormatFloat('0000000',
      nrRegistro) + ' de ' + FormatFloat('0000000', _cdsProduto.RecordCount);

    Application.ProcessMessages;
    _cdsProduto.Next;
  end;
  SetValoresPedidos;
  _cdsProduto.First;


end;

procedure T_frmCompras.SetVendasLaboratorioRecalculo(PnrProduto, PnrEmpresa,
  PnrDiasCompra, PnrRegistro: Integer; PidCurva: String);
var
  nrQtdadeEmbalagemCompra, QtdCamada, QtdPalete, nrQtdadeEstoque,
    nrUnidadeVendaMes: Integer;
  vlSugestaoIdeal, VlsugestaoLocal, vlCompradorLocal: Double;
  nrSusgestaoPossivel, nrDiasCoberturaEstoquePendencia,
    nrCoberturaEstoqueLocal: Integer;
  idCD: String[02];
  nrExcessoTemp, pcDescontoAdicionalPre: Double;
  ValorEstoqueMercadoria: TValorEstoqueMercadoria;
  nrPedidoLocal: Integer;
  DadosSugestao: TDadosQtdadeSugestao;

begin
  _nrEmpresa := PnrEmpresa;
  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
  QtdCamada := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  QtdPalete := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;

  if Mercadoria <> nil then
    Mercadoria := nil;

  Mercadoria := DadosProdutos(nrProduto, _nrEmpresa, cdoperadorLogisticoPedido);
  pcDescontoAdicionalPre := 0;
  if _chkUltimoDesconto.Checked then
    pcDescontoAdicionalPre := getUltimoDesconto
      (_cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger, nrProduto,
      _nrEmpresa, cdoperadorLogisticoPedido);

  vlPrecoLista := 0;
  // precoLista     := GetListaprecoNova(_cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, pcIndicePrecoSC, 1, nrProduto,1, idprecoAtual, dtPedido);
  precoLista := GetPrecoItem(nrProduto, PnrEmpresa,
    _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat, 1, 'N',
    idPedidoBloqueado, nrListaPreco);

  PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista,
    Mercadoria.vlPrecoVenda, Mercadoria.pcRepasseCompra,
    Mercadoria.pcDescontoPadrao, pcDescontoAdicionalPre,
    Mercadoria.pcCreditoICMS, Mercadoria.pcIpiProduto, precoLista.pcIPILista,
    precoLista.pcReajustePreco, 1,

    precoLista.nrListaPreco, 'N', Mercadoria.idForcaRepasse,
    Mercadoria.idIpiLiquidoComRepasse, Mercadoria.idIpiLiquidoSemRepasse,
    Mercadoria.idIpiBrutoComRepasse, Mercadoria.idIpiBrutoSemRepasse,
    Mercadoria.idTipoListaFiscal, DadosFornecedor.idUnidadeFederacao,
    Mercadoria.idSuperfulo, Mercadoria.idIcmDestacado, Mercadoria.idReduzIcms,
    Mercadoria.idPisCofins);

  vlPrecoLista := precoLista.vlPrecoLista;
  nrQtdadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
    .AsInteger;

  DadosPendencia := setPendenciaCD(nrProduto, PnrEmpresa);
  qtPendenteItem := DadosPendencia.QtPendente;

  // setParamentroCompra(PidCurva[1]);

  vlMediaDia := CalculaMediaProduto(nrProduto, PnrEmpresa);

  ValorEstoqueMercadoria := GetValorFinanceiroEstoque(nrProduto, PnrEmpresa);

  // MercadoriaEstoqueLocal:=GetEstoque(nrProduto,nrEmpresa);
  nrQtdadeEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  pcGeracaoVerba := Mercadoria.pcGeracaoVerba;
  nrGeracaoVerba := Mercadoria.nrGeracaoVerba;

  idInativo := Mercadoria.idSituacaoMercadoriaEstoque;
  nrQtdadeEstoque := Mercadoria.qtEstoque;

  DadosSugestao := CalculoSugestaoIdeal(PnrDiasCompra, nrDiasAntecipacao,
    nrLeadTime, vlMediaDia, nrQtdadeEstoque, qtPendenteItem);

  vlSugestaoIdeal := DadosSugestao.nrQtdSugerida;
  nrSusgestaoPossivel := 0;
  if nrQtdadeEmbalagemCompra > 0 then
    nrSusgestaoPossivel :=
      strtoint(FormatFloat('########0', vlSugestaoIdeal /
      nrQtdadeEmbalagemCompra));
  nrSusgestaoPossivel := nrSusgestaoPossivel * nrQtdadeEmbalagemCompra;
  nrUnidadeVendaMes := strtoint(FormatFloat('########0', qtVendaMes[13]));

  idCD := 'SC';

  {nrSusgestaoPossivel := SetQuantidadePaleteCamada(nrSusgestaoPossivel,
    // PqtPedido,
    nrQtdadeEmbalagemCompra, // PqtEmbalagem,
    QtdCamada, // PqtCamada,
    QtdPalete, // PqtPalete,
    PnrDiasCompra, // PDiasEstoque: Integer;
    nrQtdadeEstoque + qtPendenteItem, vlMediaDia // PvlMediaDia:Double
    , 0,0,Mercadoria.idCurva);}

  if PnrEmpresa = 1 then
  begin

  end;
  if PnrEmpresa = 4 then
  begin
    idCD := 'RS';
    // if NrAuditoriaRS=0 then
    // NrAuditoriaRS:=Incrementa('PRDDM.DC_ITEM_AUDITORIA_COMPRA','CD_AUDITORIA');

    nrExcessoTemp := (CoberturaEstoqueDia(nrQtdadeEstoque + nrSusgestaoPossivel
      + qtPendenteItem, 0, vlMediaDia));
    nrCoberturaEstoqueLocal := strtoint(FormatFloat('00000', nrExcessoTemp));
    nrExcessoTemp := (nrExcessoTemp - qtEstoqueMaximo) * vlMediaDia;
    if nrExcessoTemp < 0 then
      nrExcessoTemp := 0;

    nrUnidadesExcessoCDRS := nrUnidadesExcessoCDRS + nrExcessoTemp;
    // vlExcessoCustoCDRS   := vlExcessoCustoCDRS + (precoLista.vlPrecoLista * nrExcessoTemp);
    if ValorEstoqueMercadoria <> nil then
    begin

    end;
  end;
  VlsugestaoLocal := (nrSusgestaoPossivel * precoLista.vlPrecoLista);

  if PnrEmpresa = 1 then
    nrPedidoLocal := NrPedidoSC;
  if PnrEmpresa = 4 then
    nrPedidoLocal := NrPedidoRS;

  nrUnidadesSugeridaEmpresa := nrUnidadesSugeridaRS + nrUnidadesSugeridaSC;
  vlSugeridoEmpresa := vlSugeridoRS + vlSugeridoSC;

end;

function T_frmCompras.CriaCapaPedido(PnrEmpresa: Integer): Boolean;
var
  cdPrazoPagamento: Integer;
  idCriaCapaPedido: Boolean;
begin
  cdPrazoPagamento := AbrePrazoParcelamento(inttostr(nrPrazoPedido), 1);
  cdPrazoPagamentoAudititoria := cdPrazoPagamento;

  idCriaCapaPedido := false;
  if ((NrPedidoSC = 0) and (PnrEmpresa = 1)) or
    ((NrPedidoRS = 0) and (PnrEmpresa = 4)) then
  begin
    nrPedidoTelaCompra := GeraNumeroPedido('C');
    idCriaCapaPedido := true;
    if (PnrEmpresa = 1) then
      NrPedidoSC := nrPedidoTelaCompra;
    if (PnrEmpresa = 4) then
      NrPedidoRS := nrPedidoTelaCompra;

  end;
  if (PnrEmpresa = 1) then
    nrPedidoTelaCompra := NrPedidoSC;

  if (PnrEmpresa = 4) then
    nrPedidoTelaCompra := NrPedidoRS;

  idPedidoIniciado := true;
  if idCriaCapaPedido then
    GravaCapaPedido(nrPedidoTelaCompra, // NROP_P,//  NUMBER(6)
      nrLaboratorioLocal, // LABP_P :Integer;// NUMBER(6)
      dtPedido, // DATP_P :Tdate;// DATE
      pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
      0, // DESP_P:Double;// NUMBER(5,2)
      'S', // SITP_P :String;//CHAR(1)
      nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
      dtPedido + nrLeadTime, // PREP_P          //DATE
      ' ', // CHAR(40)
      '0', // SNRP_P           //  CHAR(10)
      0, // FLAP_P ,         //NUMBER(1)
      cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
      nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
      strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
      dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
      'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
      cdoperadorLogisticoPedido,
      // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
      NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
      dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
      dtSistema, // DT_DIGITACAO :Tdate;//  DATE
      0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
      0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
      strtodate('01/01/2039'), nrCompradorPedido, PnrEmpresa, 0, pcGeracaoVerba,
      nrGeracaoVerba,0);
  // DT_TRANSMITIDO :tdate):Boolean;

  PrazoSC(nrPrazoPedido);
  PrazoRS(nrPrazoPedido);

end;

procedure T_frmCompras.MostraTotaisPedido(PnrPedido, PnrEmpresa: Integer);
begin

  AbreItemPedidoMultiEmpresa(PnrPedido, 0, 1, 'N');
  AbreItemPedidoMultiEmpresaCDRS(NrPedidoRS, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  AbreItemPedidoMultiEmpresaCDSC(NrPedidoSC, 0,
    _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, '');
  SetNomeCampoItemPedido;
  TotaisPedidoEmpresa := TotalizaPedidoEmpresa(NrPedidoSC, NrPedidoRS, 0, 'S');
  _dtpProximaAgenda.Enabled := true;
  if PnrEmpresa = 1 then
  begin
    TotaisPedidoSC := TotalizaPedido(NrPedidoSC, 0, 'S');
    if (TotaisPedidoSC.vlPedidoBruto > 0) then
      _dtpProximaAgenda.Enabled := false;
    vlCompradoSC := TotaisPedidoSC.vlPedidoBruto;
    vlCompradoCustoSC := TotaisPedidoSC.vlPedidoLiquido;
    nrUnidadesCompradaSC := TotaisPedidoSC.nrUnidadesPedido;
    SetNomeCampoItemPedidoSC;
  end;
  if PnrEmpresa = 4 then
  begin
    TotaisPedidoRS := TotalizaPedido(NrPedidoRS, 0, 'S');
    if TotaisPedidoRS.vlPedidoBruto > 0 then
      _dtpProximaAgenda.Enabled := false;
    vlCompradoRS := TotaisPedidoRS.vlPedidoBruto;
    vlCompradoCustoRS := TotaisPedidoRS.vlPedidoLiquido;
    nrUnidadesCompradaRS := TotaisPedidoRS.nrUnidadesPedido;
    //SetNomeCampoItemPedidoRS;
  end;
  if (TotaisPedidoSC.vlPedidoBruto > 0) or
    (TotaisPedidoRS.vlPedidoBruto > 0) then
    _dtpDataAgendada.Enabled := false;
  nrDiasEstoqueAtual := 0;
  vlMediaMesSC := 0;
  nrUnidadesPossivel := 0;

end;

procedure T_frmCompras.SetCamposCaixaCamadaPaleteGridPedElaborado;
begin
  // SetCoresDefaultCaixaCamadaPalete;
end;

procedure T_frmCompras.FiltraSomaPedido(PnrEmpresa: Integer);
begin
end;

procedure T_frmCompras.FiltroItemPedido(PnrEmpresa: Integer);
begin
  PnrEmpresa := 0;
  if _cbxFiltroItemPedido.ItemIndex = 1 then
    PnrEmpresa := 1;
  if _cbxFiltroItemPedido.ItemIndex = 2 then
    PnrEmpresa := 4;

  with _cdsPrepedido do
  begin
    filtered:=false;
    if PnrEmpresa>0 then
    begin
     filter:='CD_EMPRESA='+inttostr(PnrEmpresa);
     filtered:=true;
    end;

  end;

end;

function T_frmCompras.LocalizaItemPedidoElaborador(PnrPedido, PnrProduto,
  PnrEmpresa: Integer): Boolean;
begin

end;

procedure T_frmCompras.SetCamposPedidoElaborador(PMediaMensal: Double;
  PVendaMensal: Double; PPendencia: Integer; Pestoque, PnrDiasEstoque: Integer;
  PidCurva: String);
var
  vlMediaCalculada: Double;
  vlCoberturaEstoque, vlCoberturaEstoquePedencia, vlSusgestaoIdeal,
    vlSusgestaoPossivel: Double;
  nrQtadeEmbalagemCompra: Integer;
  DadosSugestao: TDadosQtdadeSugestao;

begin





  vlMediaCalculada := 0;
  if (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados) > 0 then
    vlMediaCalculada := nrUnidadesMesesSelecionados /
      (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados);


  vlCoberturaEstoque := 0;
  vlCoberturaEstoquePedencia := 0;

  if vlMediaCalculada > 0 then
  begin
    vlCoberturaEstoque := Pestoque / vlMediaCalculada;
    vlCoberturaEstoquePedencia := (Pestoque + PPendencia) / vlMediaCalculada;
  end;
  // Mercadoria.dtUltimaEntrada);
  // Mercadoria.dtUltimaSaida);

  nrQtadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA')
    .AsInteger;

  DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque, nrDiasAntecipacao,
    nrLeadTime, vlMediaDia, Pestoque, qtPendenteItem);

  vlSusgestaoIdeal := DadosSugestao.nrQtdSugerida;
  vlSusgestaoPossivel := 0;
  if nrQtadeEmbalagemCompra > 0 then
    vlSusgestaoPossivel :=
      strtoint(FormatFloat('########0', vlSusgestaoIdeal /
      nrQtadeEmbalagemCompra)) * nrQtadeEmbalagemCompra;

end;

procedure T_frmCompras.CapaPedido(PnrPedido: Integer);
var
  cdPrazoPagamento: Integer;
  idCriaCapaPedido: Boolean;
begin
  cdPrazoPagamento := AbrePrazoParcelamento(inttostr(nrPrazoPedido), 1);
  cdPrazoPagamentoAudititoria := cdPrazoPagamento;
  if PnrPedido > 0 then
    GravaCapaPedido(nrPedidoTelaCompra, // NROP_P,//  NUMBER(6)
      nrLaboratorioLocal, // LABP_P :Integer;// NUMBER(6)
      dtPedido, // DATP_P :Tdate;// DATE
      pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
      0, // DESP_P:Double;// NUMBER(5,2)
      'S', // SITP_P :String;//CHAR(1)
      nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
      dtPedido + nrLeadTime, // PREP_P          //DATE
      ' ', // CHAR(40)
      '0', // SNRP_P           //  CHAR(10)
      0, // FLAP_P ,         //NUMBER(1)
      cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
      nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
      strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
      dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
      'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
      cdoperadorLogisticoPedido,
      // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
      NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
      dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
      dtSistema, // DT_DIGITACAO :Tdate;//  DATE
      0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
      0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
      strtodate('01/01/2039'), nrCompradorPedido,
      _cdsProduto.FieldByName('CD_EMPRESA').AsInteger, 0, pcGeracaoVerba,
      nrGeracaoVerba,0);

end;

procedure T_frmCompras.SetGridListaPreco;
begin
  // CD_PRECO_FORNECEDOR_EXCECAO');
  // ADD(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) ');

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_LISTA')).DisplayLabel :=
    'Nr. Lista';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_LISTA')).DisplayWidth := 6;

  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayLabel :=
    'Dt.Inicio';
  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayWidth := 10;
  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayFormat :=
    'dd/mm/yyyy';

  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayLabel :=
    'Dt.FinalL';
  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayWidth := 10;
  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayFormat :=
    'dd/mm/yyyy';

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_ITENS')).DisplayLabel :=
    'Nr. Itens';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_ITENS')).DisplayWidth := 6;

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_VERBA')).DisplayLabel :=
    'Nr.Verba';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_VERBA')).DisplayWidth := 6;
end;

function T_frmCompras.ListaPrecoAtivas(PnrFornecedor,
  PnrProduto: Integer): Boolean;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);

    with stQry do
    begin
      Add('SELECT CD_PRECO_FORNECEDOR_EXCECAO');
      Add(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) NR_ITENS,NR_VERBA');
      Add('FROM');
      Add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPF,');
      Add('PRDDM.DC_COMPRA_MERCADORIA  CM');
      Add('WHERE');
      Add('LPF.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND LPF.CD_EMPRESA=CM.CD_EMPRESA');
      if PnrFornecedor > 0 then
        Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrProduto > 0 then
        Add('AND CM.CD_MERCADORIA=:PnrProduto');
      Add('AND ID_SITUACAO=''A''');
      Add('GROUP BY CD_PRECO_FORNECEDOR_EXCECAO,DT_INICIO_VALIDADE ,DT_FIM_VALIDADE,NR_VERBA');

    end;
    result := false;
    with _cdsListaPrecoAtiva do
    begin
      close;
      CommandText := stQry.Text;
      if PnrFornecedor > 0 then
        Params.ParamByName('PnrFornecedor').AsBCD := PnrFornecedor;
      if PnrProduto > 0 then
        Params.ParamByName('PnrProduto').AsBCD := PnrProduto;
      open;
    end;
    if not _cdsListaPrecoAtiva.isEmpty then
    begin
      result := true;
      SetGridListaPreco;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmCompras.SetNavegacaoProduto(PidRegistro: Integer);
// 0-> parado 1 -> Registro Anterior o 2 -> Proximo Registro
var
  vlMediaMensalEmpresa,
  vlCoberturaEstoque,
  vlCoberturaEstoquePedencia,
  vlMediaAntiga,

    vlSusgestaoIdeal,
    vlSugestaoPossivel: Double;
  DadosSugestao: TDadosQtdadeSugestao;
  QtdCamada, QtdPalete, nrQtadeEmbalagemCompra, nrQuantidadeRejeitada, qtPedida,
  nrQtdadeEstoque,nrIdias: Integer;
  DadosItemPedido: TDadosItemPedido;
  idTermoLabil: String[1];

begin
  if PidRegistro = 2 then
    _cdsProduto.Next;
  if PidRegistro = 1 then
    _cdsProduto.Prior;

  nrProduto       := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrDigitoPreco := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
  cdEmpresaPedido := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

   PosicionaGrid(nrProduto,cdEmpresaPedido);


  QtdCamada := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  QtdPalete := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
  nrQtadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
  idTermoLabil := _cdsProduto.FieldByName('ID_REFRIGERADO').AsString;

  nrQtdadeEstoque     := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  nrQuantidadeEstoque:= _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;

 DadosPendencia := setPendenciaCD(nrProduto, cdEmpresaPedido);

  qtPendenteItem := DadosPendencia.QtPendente;


  DadosItemPedido := PosicionaGrid(nrProduto, cdEmpresaPedido);
  qtPedida := DadosItemPedido.nrQuantidadePedido;


    _lbeUltimaEntradaGrid.Color:=clBtnFace;
   _lbeUltimaSaidaGrid.Color   :=clBtnFace;


   nrIdias := DaysBetween(_cdsProduto.FieldByName('DT_ULTIMA_ENTRADA').AsDateTime, dtSistema);
   if nrIdias>=90 then
      _lbeUltimaEntradaGrid.Color:=clYellow;


   nrIdias := DaysBetween(_cdsProduto.FieldByName('DT_ULTIMA_SAIDA').AsDateTime, dtSistema);
   if nrIdias>=30 then
      _lbeUltimaSaidaGrid.Color:=clYellow;
  _lbeUltimaEntradaGrid.Text := FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_ULTIMA_ENTRADA').AsDateTime);
  // Mercadoria.dtUltimaEntrada);
  _lbeUltimaSaidaGrid.Text := FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_ULTIMA_SAIDA').AsDateTime);
  // Mercadoria.dtUltimaSaida);


     pcDescontoADicional := 0;


     SetPrecoItem(nrproduto,
                  nrDigitoPreco,
                  cdEmpresaPedido,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0);
          PrecoItemSC := PrecoItem;



  SetPrecoLocal;

  // if cdEmpresaPedido = 1 then
  // DadosItemPedido := localizaItemPedido(NrPedidoSC, nrProduto,cdEmpresaPedido);
  // if cdEmpresaPedido = 4 then
  // DadosItemPedido := localizaItemPedido(NrPedidoRS, nrProduto,cdEmpresaPedido);


  qtPedida := DadosItemPedido.nrQuantidadePedido;

  nrQtdadeEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;

  SetCamposCaixaCamadaPaleteGrid;

  MostraGraficoVendaEmpresa(nrProduto, // PnrProduto,
    // PnrCd:Integer
    0);

  MostraGraficoVenda(nrProduto, cdEmpresaPedido);

  MostraGraficoVendaCDOposto(nrProduto, cdEmpresaPedido);


  // nrQuantidadeEstoqueMultEmpresa := GetEstoqueMultEmpresa(nrProduto, 0);

//  DadosPendencia := setPendenciaCD(nrProduto, 0);
//  qtPendenteItem := DadosPendencia.QtPendente;







  DadosItemPedido := PosicionaGrid(nrProduto, cdEmpresaPedido);
  _cdsVendalaboratorio.IndexFieldNames := 'CD_MERCADORIA;DT_VENDA_MERCADORIA';
  FiltraVendaLaboratorio(nrProduto, cdEmpresaPedido, cdoperadorLogisticoPedido);
  nrDiasEstoqueZeroSelecionados := 0;
  nrUnidadesMesesSelecionados := 0;
  nrDiasSelecionados := 0;
  vlMediaDia := CalculaMediaProduto(nrProduto, cdEmpresaPedido);

  nrLeadTime := SetLeadTime(cdEmpresaPedido, idTermoLabil);


  DadosPendencia := setPendenciaCD(nrProduto, cdEmpresaPedido);
  qtPendenteItem := DadosPendencia.QtPendente;

   SetCorPendencia(DadosPendencia.qtPedido,
                   DadosPendencia.QtPendente,
                   DadosPendencia.qtAtendida,
                   DadosPendencia.qtProcessada);




  DadosSugestao := CalculoSugestaoIdeal(nrParamentoEstoque,
                                        nrDiasAntecipacao,
                                         nrLeadTime,
                                         vlMediaDia,
                                         nrQtdadeEstoque,
                                         qtPendenteItem);

  vlSusgestaoIdeal := DadosSugestao.nrQtdSugeridaRejeitada;

  SetCamposSugestaoIdeal(vlSusgestaoIdeal, 0);

  GetIndiceFaltaAnterior(nrProduto,cdEmpresaPedido);
  GetIndiceFaltaAtual(nrProduto,cdEmpresaPedido);


  vlSugestaoPossivel := 0;
  if nrQtadeEmbalagemCompra > 0 then
    vlSugestaoPossivel :=
      strtoint(FormatFloat('########0', vlSusgestaoIdeal /
      nrQtadeEmbalagemCompra));

  vlSugestaoPossivel := vlSugestaoPossivel * nrQtadeEmbalagemCompra;
  // _lbeQtadePedido.Text := FormatFloat('###,###,##0', vlSusgestaoPossivel);
  SetCamposQuantidaPedido(vlSugestaoPossivel, 0);
  SetCamposSugestaoIdealGrid(vlSusgestaoIdeal, vlSugestaoPossivel);

  if vlSugestaoPossivel > 0 then

   { vlSugestaoPossivel := SetQuantidadePaleteCamada
      (strtoint(FormatFloat('########0', vlSugestaoPossivel)), // PqtPedido,
      nrQtadeEmbalagemCompra, // PqtEmbalagem,
      QtdCamada, // PqtCamada,
      QtdPalete, // PqtPalete,
      nrParamentoEstoque + nrLeadTime, // PDiasEstoque: Integer;
      nrQtdadeEstoque + qtPendenteItem, vlMediaDia, // PvlMediaDia:Double
      0,0,Mercadoria.idCurva);}

  if (DadosSugestao.nrQtdSugerida = 0) and
    (DadosSugestao.nrQtdSugeridaRejeitada > 0) then
  begin
    nrQuantidadeRejeitada :=
      StrToIntDef(FormatFloat('0000000', vlSugestaoPossivel), 0);
    vlSugestaoPossivel := 0;
  end;

  // _cedQtdadePedidoEmpresa.Value := vlSusgestaoPossivel;
  SetCamposSugestaoPossivel(vlSugestaoPossivel, 0);

  SetCorQuantidadePedido(0, 0);
  if qtPedida > 0 then

    SetCoresCaixaCamadaPalete(qtPedida,
      _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger,
      // Mercadoria.qtEmbalagemCompra,
      _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger,
      // Mercadoria.qtdCaixaCamada,
      _cdsProduto.FieldByName('QT_CAIXA_PALETE')
      .AsInteger { Mercadoria.qtdCaixaPalete }
      );
   if DadosItemPedido.nrquantidadePedido>0 then
     _lbeQuantidadePedidoGrid.Text := FormatFloat('########0', DadosItemPedido.nrquantidadePedido)
    else
    _lbeQuantidadePedidoGrid.Text := FormatFloat('########0', vlSugestaoPossivel);

  if DadosItemPedido.nrVerba > 0 then
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0',
      DadosItemPedido.nrVerba)
  else
    _lbeNumeroVerbaGrid.Text := FormatFloat('########0', nrVerbaDigitada);

  _lbePcVerbaGrid.Text := FormatFloat('########0.00', DadosItemPedido.pcVerba);


  if qtPedida > 0 then
  begin
    if _chkSemDescontoAdicional.Checked then
      DadosItemPedido.pcDescontoADicional := 0;

    SetPrecoItem(nrproduto,
                 nrDigitoPreco,
                 cdEmpresaPedido,
                 0,
                 nrQuantidadeComprada,
                 DadosItemPedido.nrVerba,
                 0,
                 DadosItemPedido.pcDescontoPadrao,
                 DadosItemPedido.pcDescontoADicional);

    // pcDescontoADicional := DadosItemPedido.pcDescontoADicional;
    SetCorQuantidadePedido(qtPedida, StrToIntDef(FormatFloat('########0',
      vlSugestaoPossivel), 0));

    _lbeQuantidadePedidoGrid.Text := FormatFloat('########0', qtPedida);

    if vlMediaDia > 0 then
    begin
      nrDiasEstoque := StrToIntDef(FormatFloat('0000000000',
        (nrQuantidadeEstoque + qtPendenteItem + qtPedida) / vlMediaDia), 0);
      _lbeDiasEstoque.Text := FormatFloat('########0', nrDiasEstoque);
    end;
  end;

  setDadosEstoqueEmpresacd(vlMediaMesSC, // PvlMediaMensalCD: double;
    StrToIntDef(FormatFloat('00000000', qtVendaMes[13]), 0),
    // PnrVendaAtual: Integer;
    qtPendenteItem, // PqtdPendencia: Integer;
    nrQtdadeEstoque, // PQtdEstoque: Integer;
    0, // PnrCoberturaEstoque: Integer;
    0); // PnrCobEstoquePendencia: Integer);

  vlMediaMensalEmpresa := CalculaMediaProduto(nrProduto, 0);

  vlCoberturaEstoque := CoberturaEstoqueDia(nrQuantidadeEstoqueMultEmpresa,
                                            0,
                                            vlMediaMensalEmpresa);
  vlCoberturaEstoquePedencia := CoberturaEstoqueDia(nrQuantidadeEstoqueMultEmpresa,
                                                    qtPendenteItem,
                                                    vlMediaMensalEmpresa);

  PintaCampoCoberturaEstoqueEmpresa(vlCoberturaEstoque, qtEstoqueMaximo);
  PintaCampoCoberturaEstoquePendenciaEmpresa(vlCoberturaEstoquePedencia,
                                             qtEstoqueMaximo);

  vlMediaMensalEmpresa := CalculaMediaProduto(nrProduto, 0);

  setDadosEstoqueEmpresa(vlMediaMesSC,
  StrToIntDef(FormatFloat('00000000', qtVendaMes[13]), 0),
              qtPendenteItem,
              nrQuantidadeEstoqueMultEmpresa,
              StrToIntDef(FormatFloat('00000000',vlCoberturaEstoque), 0),
              StrToIntDef(FormatFloat('00000000',vlCoberturaEstoquePedencia), 0));



end;

procedure T_frmCompras.MostraGraficoVendaEmpresa(PnrProduto, PnrCD: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series10.Clear;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrReferencia := MaiorVendaProdutoNova(PnrProduto, 0);
  _SerieGraficoGradeEmpresa.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  // nrProdutoEmpresa := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  FiltraVendaLaboratorio(PnrProduto, 0, cdoperadorLogisticoPedido);

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series10.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;

  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;
  Series10.Add(qtVendaMes[13], stMes, corBarra);
  _SerieGraficoGradeEmpresa.Refresh;
  nrReferencia := MaiorVendaProduto(PnrProduto, PnrCD);
  _SerieGraficoGradeEmpresa.Title.Text[0] :=
    FormatFloat('######0', _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) +
    ' - ' + _cdsProduto.FieldByName('NM_COMPLETO').AsString;
  _SerieGraficoGradeEmpresa.Refresh;
  _grbGraficoGradeEmpresa.Caption := 'Venda Empresa';
end;

procedure T_frmCompras.MostraGraficoVendaCDOposto(PnrProduto,
  PnrEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;
  nrEmpresaCdOposto, nrEstoqueCDOposto, nrPendenciaCdOposto: Integer;
  stLocalCd: String;
  vlMediaDiaCdOposto, vlCoberturaEstoqueCDOposto,
    vlCoberturaEstoquePendencia: Double;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  Series19.Clear;
  Series19.Visible := true;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrReferencia := MaiorVendaProduto(PnrProduto, PnrEmpresa);

  // _SerieGraficoGradeEmpresa.LeftAxis.SetMinMax(0,nrReferencia*1.30);
  nrEmpresaCdOposto := 1;
  if PnrEmpresa = 1 then
    nrEmpresaCdOposto := 4;
  FiltraVendaLaboratorio(PnrProduto, nrEmpresaCdOposto,
    cdoperadorLogisticoPedido);
  vlMediaDiaCdOposto := CalculaMediaProduto(PnrProduto, nrEmpresaCdOposto);
  nrEstoqueCDOposto := GetEstoqueMultEmpresa(PnrProduto, nrEmpresaCdOposto);

  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresaCdOposto);
  nrPendenciaCdOposto := DadosPendencia.QtPendente;

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      corBarra := clSkyBlue;
      inc(nrMesesSelecionados);
    end;
    if nrEmpresaCdOposto = 1 then
    begin
      corBarra := clTeal;
      stLocalCd := 'Posicao Estoque / CD Tubar?o';
    end
    else
    begin
      corBarra := $000080FF; // $0073EAFB;//clMoneyGreen;
      stLocalCd := 'Posicao Est./CD Sta.Cruz do Sul'
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series19.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  // corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;

  Series19.Add(qtVendaMes[13], stMes, corBarra);
  Series19.Repaint;
  if _chkOcultaCD.Checked then
    _grbCDOposto.Visible := false
  else
    _grbCDOposto.Visible := true;
  if not _chkOcultaCD.Checked then
  begin
    _lbeMediaCdOposto.Text := FormatFloat('###,###0', vlMediaMesSC);
    _lbePendenciaCDOposto.Text := FormatFloat('###,###0', nrPendenciaCdOposto);
    vlCoberturaEstoqueCDOposto := CoberturaEstoqueDia(nrEstoqueCDOposto, 0,
      vlMediaDiaCdOposto);
    vlCoberturaEstoquePendencia := CoberturaEstoqueDia(nrEstoqueCDOposto,
      nrPendenciaCdOposto, vlMediaDiaCdOposto);
    _lbeCoberturaEstoqueCDOposto.Text := FormatFloat('###,###0',
      vlCoberturaEstoqueCDOposto);
    _LbeCoberturaEstoquePendenciaCDOposto.Text :=
      FormatFloat('###,###0', vlCoberturaEstoquePendencia);
    PintaCampoCoberturaEstoqueCDOposto(vlCoberturaEstoqueCDOposto,
      qtEstoqueMaximo);
    PintaCampoCoberturaEstoquePendenciaCDOposto(vlCoberturaEstoquePendencia,
      qtEstoqueMaximo);

    _lbeEstoqueCDOposto.Text := FormatFloat('###,###,##0', nrEstoqueCDOposto);
    _grbCDOposto.Color := corBarra;
    _grbCDOposto.Caption := stLocalCd;
  end;
  _SerieGraficoGradeEmpresa.Refresh;
  _lbeVendaMesCDOposto.Text := FormatFloat('###,###,##0', qtVendaMes[13]);
  _SerieGraficoGradeEmpresa.Refresh;
end;

procedure T_frmCompras.MostraGraficoVenda(PnrProduto, PcdEmpresa: Integer);
var
  dtreferencia: tdate;
  stMes: string[12];
  stAlertaRestricao: String;
  Mesreferencia, contaMes: Integer;
  I, vlTemporario: Integer;
  corBarra: TColor;

begin
  dtreferencia := IncMonth(dtPedido, -12);
  Mesreferencia := MonthOf(dtreferencia);
  _tchVendasMensal.View3D := true;

  Series9.Clear;
  Series9.Active := true;
  Series15.Active := false;
  Series16.Active := false;
  Series17.Active := false;
  Series18.Active := false;
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  contaMes := Mesreferencia;
  nrReferencia := MaiorVendaProduto(PnrProduto, PcdEmpresa);
  _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  FiltraVendaLaboratorio(PnrProduto, PcdEmpresa, cdoperadorLogisticoPedido);
  CalculaMediaProduto(PnrProduto, PcdEmpresa);

  nrMesesSelecionados := 0;
  for I := 1 to 12 do
  begin
    if contaMes > 12 then
      contaMes := 1;
    corBarra := clWhite;
    if idMesSelecionado[contaMes] = 'S' then
    begin
      if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
        corBarra := clTeal;
      if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
        corBarra := $000080FF; // $0073EAFB;//clMoneyGreen;
      inc(nrMesesSelecionados);
    end;
    if nrReferencia < qtVendaMes[contaMes] then
      nrReferencia := qtVendaMes[contaMes];
    stMes := UpperCase(ShortMonthNames[contaMes]);
    Series9.Add(qtVendaMes[contaMes], stMes, corBarra);
    inc(contaMes);
  end;
  stMes := 'ATUAL';
  corBarra := clWhite;
  if idMesSelecionado[13] = 'S' then
  begin
    corBarra := clSkyBlue;
    inc(nrMesesSelecionados);

  end;
  Series9.Add(qtVendaMes[13], stMes, corBarra);
  _tchVendasMensal.Refresh;
  _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  // _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProdutoID_LOCAL_CD.AsString;
  _edtCD.Text := _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;
  if _cdsProduto.FieldByName('ID_SITUACAO_MERCADORIA').AsString = 'I' then
  begin
    _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;

  end;

  if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'SC' then
  begin
    _edtCD.Color := clGreen;
    _edtCD.Font.Color := clBlack;
  end;
  if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'RS' then
  begin
    _edtCD.Color := $000080FF;
    _edtCD.Font.Color := clBlack;
  end;
  Timer1.Enabled := false;
  _cdsProduto.FieldByName('ID_SITUACAO_MERCADORIA').AsString;
  _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
    _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
    _cdsProduto.FieldByName('NM_COMPLETO').AsString;

  _tchVendasMensal.Refresh;
  _tchVendasMensal.LeftAxis.SetMinMax(0, nrReferencia * 1.30);
  _grbGraficoGrade.Caption := 'GAM CD ' + _cdsProduto.FieldByName
    ('ID_LOCAL_CD').AsString;
  if _cdsProduto.FieldByName('ID_SITUACAO_MERCADORIA').AsString = 'I' then
  begin
    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' +
      ' Produto Inativado no CD ';
    _tchVendasMensal.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
  if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'S' then
  begin
    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' +
      ' Produto Marcado para Ser Inativado ';
    _tchVendasMensal.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
  _pnRestricao.Visible := false;
  if RestricaoDeCompra(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger) then
  begin
    _pnRestricao.Visible := true;
    _pnRestricao.Height := 75;
    _mmAlertaRecall.Clear;

    _pnRestricao.Font.Color := clWhite;
    stAlertaRestricao := 'Produto com Restri??o de Compra.' + #13 +
      ' O mesmo poder? ser comprado.' + #13 +
      'Por?m fale com Farmac?utico antes';

    _mmAlertaRecall.Lines.Add('Produto com Restri??o de Compra.');
    _mmAlertaRecall.Lines.Add('O mesmo poder? ser comprado.');
    _mmAlertaRecall.Lines.Add('Por?m fale com Farmac?utico antes.');
    // _pnRestricao.Caption:=stAlertaRestricao;
    // _mmAlertaRecall.Lines.Add(stAlertaRestricao);

    _tchVendasMensal.Title.Color := clRed;
    // _tchVendasMensal.Title.Font:=[fsBold];

    _tchVendasMensal.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + #13 + ' - ';;
    _tchVendasMensal.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
end;

procedure T_frmCompras.setDadosEstoqueEmpresacd(PvlMediaMensalCD: Double;
  PnrVendaAtual: Integer; PqtdPendencia: Integer; PQtdEstoque: Integer;
  PnrCoberturaEstoque: Integer; PnrCobEstoquePendencia: Integer);
var
  vlDiasCoberturaEstoque,
  vlMediaAntiga,
  vlDiasCoberturaEstoquePendencia: Double;
  nrQtadeEmbalagemCompra, nrQtadeCamadaEmbalagem: Integer;

begin

  _lbeMediaMensalGrid.Text := FormatFloat('###,###,##0', PvlMediaMensalCD);
  _lbeMediaMensalSC.Text := FormatFloat('###,###,##0', PvlMediaMensalCD);
  _lbePendenciaGrid.Text := FormatFloat('###,###,##0', PqtdPendencia);
  _lbePendenciaSC.Text := FormatFloat('###,###,##0', PqtdPendencia);

  _lbeVendaMensalGrid.Text := FormatFloat('###,###,##0', PnrVendaAtual);
  _lbeVendaMensalSC.Text := FormatFloat('###,###,##0', PnrVendaAtual);

  _lbeEstoqueGrid.Text := FormatFloat('###,###,##0', PQtdEstoque);
  _lbeEstoqueSC.Text := FormatFloat('###,###,##0', PQtdEstoque);

  vlDiasCoberturaEstoque := CoberturaEstoqueDia(PQtdEstoque, 0, vlMediaDia);

  nrQtadeEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
  nrQtadeCamadaEmbalagem := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;

  vlDiasCoberturaEstoquePendencia := CoberturaEstoqueDia(PQtdEstoque, qtPendenteItem, vlMediaDia);

  _lbeCoberturaEstoqueSC.Text        := FormatFloat('###,###,##0',vlDiasCoberturaEstoque);
  nrDiasCoberturaEstoqueAuditoria    :=StrToIntDef(FormatFloat('0000', vlDiasCoberturaEstoque), 0);
  _lbeCoberturaGrid.Text             := FormatFloat('###,###,##0', vlDiasCoberturaEstoque);
  _lbeCoberturaEstoquePend_Grid.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoquePendencia);

  _LbeCoberturaEstoquePendenciaSC.Text := FormatFloat('###,###,##0',
    vlDiasCoberturaEstoquePendencia);
  PintaCampoCoberturaEstoqueSC(StrToIntDef(FormatFloat('0000000',
    vlDiasCoberturaEstoque), 0), qtEstoqueMaximo);

  PintaCampoCoberturaEstoqueGrid(StrToIntDef(FormatFloat('0000000',
    vlDiasCoberturaEstoque), 0), qtEstoqueMaximo);
  PintaCampoCoberturaEstoquePendenciaGrid
    (StrToIntDef(FormatFloat('0000000', vlDiasCoberturaEstoquePendencia), 0),
    qtEstoqueMaximo);

  PintaCampoCoberturaEstoquePendenciaSC
    (StrToIntDef(FormatFloat('0000000', vlDiasCoberturaEstoquePendencia), 0),
    qtEstoqueMaximo);

      vlMediaAntiga := 0;
  if nrDiasSelecionados - nrDiasEstoqueZeroSelecionados > 0 then
    vlMediaAntiga := nrUnidadesMesesSelecionados /
      (nrDiasSelecionados - nrDiasEstoqueZeroSelecionados);


    _lbeMediaGrid.Text := FormatFloat('###,###,##0', nrUnidadesMesesSelecionados)
    + '/' + '(' + FormatFloat('##0', nrDiasSelecionados) + '-' +
    FormatFloat('##0', nrDiasEstoqueZeroSelecionados) + ')=' +
    FormatFloat('###,##0.00', vlMediaAntiga);


end;

function T_frmCompras.LocalizaItemPedidoLocal(PnrPedido, PnrMercadoria,
  PnrEmpresa: Integer): TDadosItemPedido;
var
  QryTemp: TSQLQuery;
begin
  try

    result.pcVerba := 0;
    result.pcDescontoPadrao := 0;
    result.pcDescontoADicional := 0;
    result.nrMercadoria := PnrMercadoria;
    result.nrQuantidadePedido := 0;
    result.nrVerba := 0;
    result.nr_pedido := 0;
    result.idStatusItem := '';
    result.qtSugerida := 0;

    if not QryTemp.isEmpty then
    begin
      result.pcVerba := QryTemp.FieldByName('PC_VERBA').AsFloat;
      result.pcDescontoPadrao := QryTemp.FieldByName('ABTY_Y').AsFloat;
      result.pcDescontoADicional := QryTemp.FieldByName('DADY_Y').AsFloat;
      result.nrMercadoria := QryTemp.FieldByName('NROM_Y').AsInteger;
      result.nrQuantidadePedido := QryTemp.FieldByName('QUAY_Y').AsInteger;
      result.nrVerba := QryTemp.FieldByName('NRVV_Y').AsInteger;
      result.nr_pedido := PnrPedido;
      result.idStatusItem := QryTemp.FieldByName('SITY_Y').AsString;
      result.qtSugerida := QryTemp.FieldByName('QT_SUGERIDA').AsInteger;

    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function T_frmCompras.SetLeadTime(PnrEmpresa: Integer;
  PidTermoLabil: String): Double;
begin
  with _cdsTabelaLeadTime do
  begin
    filtered := false;
    filter := 'CD_EMPRESA=' + inttostr(PnrEmpresa) + ' AND ID_TERMOLABIL=' +
      QuotedStr(PidTermoLabil);
    filtered := true;
  end;
  result := 0;
  if not _cdsTabelaLeadTime.isEmpty then
    result := _cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME')
      .AsInteger;
end;

function T_frmCompras.GravaItemPedido(PnrPedido, PnrMercadoria,
  PnrEmpresa: Integer): Boolean;
begin

end;

function T_frmCompras.PosicionaGrid(PnrProduto, PnrEmpresa: Integer)
  : TDadosItemPedido;
begin

  result.pcVerba := 0;
  result.pcDescontoPadrao := 0;
  result.pcDescontoADicional := 0;
  result.nrMercadoria := PnrProduto;
  result.nrQuantidadePedido := 0;
  result.nrVerba := 0;
  result.nr_pedido := 0;
  result.idStatusItem := '';
  result.qtSugerida := 0;
  result.idItemGravado := false;

  if _cdsPrePedido.Active then
  begin

    if _cdsPrePedido.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([PnrProduto, PnrEmpresa]), []) then
    begin
      result.pcVerba := _cdsPrePedido.FieldByName('PC_VERBA').AsFloat;
      result.pcDescontoPadrao := _cdsPrePedido.FieldByName('ABTY_Y').AsFloat;
      result.pcDescontoADicional := _cdsPrePedido.FieldByName('DADY_Y').AsFloat;
      result.nrMercadoria := _cdsPrePedido.FieldByName('NROM_Y').AsInteger;
      result.nrQuantidadePedido := _cdsPrePedido.FieldByName('QUAY_Y')
        .AsInteger;
      result.nrVerba := _cdsPrePedido.FieldByName('NRVV_Y').AsInteger;
      result.nr_pedido := _cdsPrePedido.FieldByName('NROP_Y').AsInteger;
      result.idStatusItem := _cdsPrePedido.FieldByName('SITY_Y').AsString;
      result.qtSugerida := _cdsPrePedido.FieldByName('QT_SUGERIDA').AsInteger;
      result.idItemGravado := true;
      _lbeDiasEstoque.Clear;
      if result.nrQuantidadePedido > 0 then
      begin
        _lbeQuantidadePedidoGrid.Text := FormatFloat('########0',result.nrQuantidadePedido);
        _lbeDescontoAdicionalGrid.Text := FormatFloat('########0.00', result.pcDescontoADicional);
        _lbeNumeroVerbaGrid.Text := FormatFloat('########0', result.nrVerba);
        _lbePcVerbaGrid.Text := FormatFloat('########0.00', result.pcVerba);

        if vlMediaDia > 0 then
       begin
        nrDiasEstoque := StrToIntDef(FormatFloat('0000000000',
        (nrQuantidadeEstoque + qtPendenteItem + result.nrQuantidadePedido) / vlMediaDia), 0);
      _lbeDiasEstoque.Text := FormatFloat('########0', nrDiasEstoque);
      end;
      SetCoresCaixaCamadaPalete(result.nrQuantidadePedido,
                              _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger,
            // Mercadoria.qtEmbalagemCompra,
             _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger,
            // Mercadoria.qtdCaixaCamada,
            _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger { Mercadoria.qtdCaixaPalete }
            );



      end;
    end;

  end;

end;


function T_frmCompras.SetIndiceFalta(PnrMes,PnrProduto,PnrEmpresa:Integer):Integer;
var
 nrMesAtual,
 nrMesAnterior:Integer;

begin
  _cdsIndicedeFalta.Open;

  with _cdsIndicedeFalta do
  begin
      Filtered:=false;
      Filter:='MES='+IntToStr(PnrMes)+' and CD_MERCADORIA='+IntToStr(PnrProduto)+' and CD_EMPRESA='+IntToStr(PnrEmpresa);
      Filtered:=TRUE;
  end;
  Result:=0;
  if not _cdsIndicedeFalta.IsEmpty then
         result:=_cdsIndicedeFalta.FieldByName('INDICE_FALTA').AsInteger;



end;


end.
