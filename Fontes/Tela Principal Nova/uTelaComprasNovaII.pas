UNIT uTelaComprasNovaII;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ComCtrls, Grids, DBGrids, StdCtrls, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, Buttons, DateUtils, uAuxiliarCompras, uProduto,
  Gauges, uRotinasGenericas, Spin, sqlExpr, imouse, StrUtils, MATH,shellApi,
  ComObj, uPendenciaItem;




type
  TDadosUltimasCompra = record
    qtComprada: Integer;
    idStatusPedido: String;
    dtCompra: Tdate;
    Cor: TColor;

  end;


type
 TMesSelecao = record
   nrAno :Integer;
   nrMes :Integer;
 end;

type
  TDadosPedidoCompra = record
    idStatusPedido: String;
    dtCompra: Tdate;
    Cor: TColor;

  end;
type
  TDadosUltimoPrecoEntrada = record
    vlFaturadoUltimaEntrada: Double;
    vlCustoUltimaEntrada,
    pcCreditoUltimaEntrada ,
    vlVerbaUltimaEntrada :Double;

  end;

type
  TAuxDBGrid = class(TDBGrid);

  T_frmTelaCompras = class(TForm)
    _pgcCompras: TPageControl;
    _tbsParametros: TTabSheet;
    _tbsSugestao: TTabSheet;
    _tbsCompras: TTabSheet;
    Label16: TLabel;
    GroupBox6: TGroupBox;
    _lbeSomaDesconto: TLabel;
    _lbePrecoLista: TLabeledEdit;
    _lbeDescontoPadrao: TLabeledEdit;
    _lbeDescontoAdicional: TLabeledEdit;
    _lbePrecoNota: TLabeledEdit;
    _lbeValorCreditoIcms: TLabeledEdit;
    _lbePrecoCusto: TLabeledEdit;
    _lbeValorVerba: TLabeledEdit;
    _lbeNumeroVerba: TLabeledEdit;
    _lbePcVerba: TLabeledEdit;
    _cbListaPrecoLocal: TComboBox;
    _dsVendaFornecedor: TDataSource;
    _dsProduto: TDataSource;
    _cdsPendencia: TClientDataSet;
    _cdsTabelaLeadTime: TClientDataSet;
    _cdsDataUltimaCompra: TClientDataSet;
    _cdsItensCurva: TClientDataSet;
    _cdsIndicedeFalta: TClientDataSet;
    _cdsTabelaPreco: TClientDataSet;
    _cdsEspecealidade: TClientDataSet;
    _cdsEmbalagemMercadoria: TClientDataSet;
    GroupBox24: TGroupBox;
    _gridItemCurva: TDBGrid;
    _lbeNrPedido: TLabeledEdit;
    _dtpData: TDateTimePicker;
    _dsPrePedido: TDataSource;
    _cdsPrePedido: TClientDataSet;
    _dsItensCurva: TDataSource;
    GroupBox1: TGroupBox;
    _dbgEmpresa: TDBGrid;
    _cdsEmpresa: TClientDataSet;
    _dsEmpresa: TDataSource;
    GroupBox4: TGroupBox;
    _dsTabelaLeadTime: TDataSource;
    _grbFornecedor: TGroupBox;
    _lbeGrupoPedido: TLabeledEdit;
    _edtFrequenciaCompra: TEdit;
    Label14: TLabel;
    _edtFornecedor: TEdit;
    Label10: TLabel;
    _edtNomeFornecedor: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    _edtCnpj: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    _cbxTipoFrete: TComboBox;
    _dbgLeadTime: TDBGrid;
    GroupBox40: TGroupBox;
    _dbgListaPreco: TDBGrid;
    _cdsListaPrecoAtiva: TClientDataSet;
    _dsListaPreco: TDataSource;
    GroupBox5: TGroupBox;
    _chkUltimoDesconto: TCheckBox;
    _cdsItemListaPreco: TClientDataSet;
    _btnGeraPedido: TButton;
    _grdPedido: TGroupBox;
    _dbgPrePedido: TDBGrid;
    _tbsConfirma: TTabSheet;
    _grbTotaisPedido: TGroupBox;
    _dbgPedido: TDBGrid;
    _cdsProduto: TClientDataSet;
    _cdsTotalizaPedido: TClientDataSet;
    _dsTotalizaPedido: TDataSource;
    _btnFechaCancela: TBitBtn;
    GroupBox8: TGroupBox;
    _dbgPedidoPronto: TDBGrid;
    _grbParcelaPrazo: TGroupBox;
    _dbgPrazoSC: TDBGrid;
    _cdsVendaFornecedorII: TClientDataSet;
    _chkObservacaoPedido: TCheckBox;
    _edtObservacaoPedido: TEdit;
    _chkImprimir: TCheckBox;
    _chkGeraExcel: TCheckBox;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    _btnConfirma: TBitBtn;
    _edtNrVerba: TEdit;
    _chkBonificaPedido: TCheckBox;
    _dtpPedido: TDateTimePicker;
    Label18: TLabel;
    _dbgPeDiasEstoque: TDBGrid;
    _cdsPeEstoque: TClientDataSet;
    _dsPeEstoqueCd: TDataSource;
    Label19: TLabel;
    _cbOPeradorLogistico: TComboBox;
    _cdsCondicaoPagamento: TClientDataSet;
    _cdsCondicaoPagamentoNR_PARCELA: TAutoIncField;
    _cdsCondicaoPagamentoNR_DIAS: TIntegerField;
    _dsCondicaoPagamento: TDataSource;
    _stbCompras: TStatusBar;
    _cdsPedido: TClientDataSet;
    _grGraficoCompra: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    _lbEstoque: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Chart1: TChart;
    _lbeCurva: TLabel;
    Series2: TBarSeries;
    _edtMediaDiaCd: TEdit;
    _edtEstoqueSeguranca: TEdit;
    _edtPendenciaMes: TEdit;
    _edtEstoque: TEdit;
    _edtDiasEstoqueCD: TEdit;
    _edtDiasEstoquePendenciaCD: TEdit;
    _edtSusgetaoIdeal: TEdit;
    _edtSusgetaolPossivel: TEdit;
    _edtQuantidadeCaixaCamada: TEdit;
    _edtQuantidadeCaixaPalete: TEdit;
    _edtQuantidadeCaixa: TEdit;
    _edtQtdadePedido: TEdit;
    _edtDiasEstoque: TEdit;
    _lbeUltimaEntrada: TLabeledEdit;
    _lbeUltimaSaida: TLabeledEdit;
    GroupBox2: TGroupBox;
    _gaIndiceFaltaAtual: TGauge;
    _gaIndiceFaltaAnterior: TGauge;
    _edtCD: TEdit;
    _chkFixaDescontoAdicional: TCheckBox;
    _chkSemDescontoAdicional: TCheckBox;
    _chkDigitaPrecoNota: TCheckBox;
    _chkMostraUltimoDescontoI: TCheckBox;
    _dsPedido: TDataSource;
    _lbePesquisa: TLabeledEdit;
    _chkCodigoFornecedor: TCheckBox;
    _chkCodigoGam: TCheckBox;
    GroupBox3: TGroupBox;
    _dbgFiltroPedido: TDBGrid;
    _cdsEmpresaPedido: TClientDataSet;
    _dsEmpresaPedido: TDataSource;
    GroupBox19: TGroupBox;
    _dbgExcessoEstoque: TDBGrid;
    GroupBox16: TGroupBox;
    _dbgEstoqueEmpresa: TDBGrid;
    GroupBox17: TGroupBox;
    _dbgEstoquePendencia: TDBGrid;
    GroupBox18: TGroupBox;
    _dbgVendaMes: TDBGrid;
    _cdsEstoqueEmpresa: TClientDataSet;
    _dsEstoqueEmpresa: TDataSource;
    _cdsEstoquePendencia: TClientDataSet;
    _dsEstoquePendencia: TDataSource;
    _cdsVendaMes: TClientDataSet;
    _dsVendaMes: TDataSource;
    GroupBox7: TGroupBox;
    _dbgSugestao: TDBGrid;
    _cdsSugestaoCompra: TClientDataSet;
    _dsSugestaoCompra: TDataSource;
    _cdsExcessoEstoque: TClientDataSet;
    _dsExcessoEstoque: TDataSource;
    SpeedButton1: TSpeedButton;
    GroupBox9: TGroupBox;
    Chart2: TChart;
    GroupBox10: TGroupBox;
    Chart3: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    _cdsVendaSumarizada: TClientDataSet;
    Series4: TBarSeries;
    Series5: TBarSeries;
    _cbxEmpresa: TComboBox;
    Label20: TLabel;
    GroupBox11: TGroupBox;
    _cdsDiasEstoque: TClientDataSet;
    _dsDiasEstoque: TDataSource;
    _chkDiasEstoqueComPendencia: TCheckBox;
    _dbgDiasEstoque: TDBGrid;
    Series3: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Bitbtn4: TBitBtn;
    _cdsEstoqueDiario: TClientDataSet;
    _cdsUltimasCompras: TClientDataSet;
    Series10: TBarSeries;
    _cdsPedidoNoFornecedor: TClientDataSet;
    Series11: TPointSeries;
    Label26: TLabel;
    _lbeDiaPedido: TLabel;
    _btnDadosFornecedor: TBitBtn;
    _cdsPendenciaItem: TClientDataSet;
    _pnRestricao: TPanel;
    _mmAlertaRecall: TMemo;
    Timer1: TTimer;
    GroupBox13: TGroupBox;
    _dbgVendaCanal: TDBGrid;
    _cdsVendaCanalOPerador: TClientDataSet;
    _dsVendaCanalOPerador: TDataSource;
    _chkUsarUltimoDesconto: TCheckBox;
    _edtNrVerbaDesconto: TEdit;
    Label27: TLabel;
    _btnBloqueio: TBitBtn;
    _edtProjecaoVenda: TEdit;
    Label28: TLabel;
    _cdsParamentoCompra: TClientDataSet;
    _cdsProdutoOL: TClientDataSet;
    SpinEdit1: TSpinEdit;
    _edtsomaSeguranca: TEdit;
    _btnGeraPedidoExcecao: TButton;
    _edtObservacaoInativacao: TEdit;
    _grbDadosAgenda: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    _dtpDataAgendada: TDateTimePicker;
    _dtpDataPedido: TDateTimePicker;
    _dtpProximaAgenda: TDateTimePicker;
    _dtpDataUltimoPedidoMes: TDateTimePicker;
    _btnAgenDA: TBitBtn;
    _btInativacaoFuturaII: TBitBtn;
    _chkAjustaCamadaPalete: TCheckBox;
    _chkCrossDocking: TCheckBox;
    _cdsVendaFornecedor: TClientDataSet;
    _cdsForcaPedidolocal: TClientDataSet;
    _cdsInativaBloqueio: TClientDataSet;
    _edtNrVerbaInicio: TEdit;
    _cbxCaixaFechada: TComboBox;
    Label11: TLabel;
    _chkItensSemSugestao: TCheckBox;
    _chkItensComSugestao: TCheckBox;
    _chkTodosProduto: TCheckBox;
    _chkItensSemSugestaoSemEstoque: TCheckBox;
    _btnEstoque: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    _btnSugestao: TBitBtn;
    BitBtn5: TBitBtn;
    _chkItensCurvaA_B: TCheckBox;
    _chkPcParaVerbaGrid: TCheckBox;
    _lbePrecoVenda: TLabeledEdit;
    _lbepcCreditoICMS: TLabeledEdit;
    _cdsPrecoItem: TClientDataSet;
    _chkPedidoAlimentar: TCheckBox;
    _lbeUltimoPrecoEntrada: TLabeledEdit;
    _cdsUltimoPrecoEntrada: TClientDataSet;
    _lbeUltimoCustoEntrada: TLabeledEdit;
    _lbeValorVerbaUltimaEntrada: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dsProdutoDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _lbeDescontoAdicionalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtQtdadePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtDiasEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure _cbxEmpresaExit(Sender: TObject);
    procedure _edtFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeNrPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeNrPedidoExit(Sender: TObject);
    procedure _dbgEmpresaDblClick(Sender: TObject);
    procedure _lbeNumeroVerbaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _pgcComprasChange(Sender: TObject);
    procedure _dbfDiasEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _gridItemCurvaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgListaPrecoDblClick(Sender: TObject);
    procedure _btnGeraPedidoClick(Sender: TObject);
    procedure _chkUltimoDescontoClick(Sender: TObject);
    procedure _edtNrVerbaInicioExit(Sender: TObject);
    procedure _btnFechaCancelaClick(Sender: TObject);
    procedure _dbgPedidoProntoTitleClick(Column: TColumn);
    procedure _dbgPrePedidoTitleClick(Column: TColumn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure _dbgPrePedidoEnter(Sender: TObject);
    procedure _dbgPrePedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPrePedidoKeyPress(Sender: TObject; var Key: Char);
    procedure _dbgPrePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _chkCodigoGamClick(Sender: TObject);
    procedure _lbePesquisaChange(Sender: TObject);
    procedure _lbePcVerbaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbePesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPedidoProntoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgFiltroPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgFiltroPedidoDblClick(Sender: TObject);
    procedure _btnConfirmaClick(Sender: TObject);
    procedure _chkObservacaoPedidoClick(Sender: TObject);
    procedure _dbgPeDiasEstoqueDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgEstoqueEmpresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgEstoquePendenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgVendaMesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgSugestaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgExcessoEstoqueDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure _cbxEmpresaChange(Sender: TObject);
    procedure _chkDiasEstoqueComPendenciaClick(Sender: TObject);
    procedure _dbgDiasEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgListaPrecoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Bitbtn4Click(Sender: TObject);
    procedure _btnDadosFornecedorClick(Sender: TObject);
    procedure _edtPendenciaMesDblClick(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure _mmAlertaRecallClick(Sender: TObject);
    procedure _lbeCurvaDblClick(Sender: TObject);
    procedure _lbePrecoNotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _cdsPrePedidoAfterScroll(DataSet: TDataSet);
    procedure _cdsPrePedidoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure _dbgPrePedidoMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure _dbgPrePedidoMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure _dbgVendaCanalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _chkUsarUltimoDescontoClick(Sender: TObject);
    procedure _dbgPrePedidoCellClick(Column: TColumn);
    procedure _dbgPrazoSCDblClick(Sender: TObject);
    procedure _dbgPrazoSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgFiltroPedidoTitleClick(Column: TColumn);
    procedure _btnBloqueioClick(Sender: TObject);
    procedure _btnGeraPedidoExcecaoClick(Sender: TObject);
    procedure _dbgEmpresaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btInativacaoFuturaIIClick(Sender: TObject);
    procedure _btnAgenDAClick(Sender: TObject);
    procedure _lbeDescontoAdicionalExit(Sender: TObject);
    procedure _dbgPrePedidoDblClick(Sender: TObject);
    procedure _edtNrVerbaDescontoExit(Sender: TObject);
    procedure _edtNrVerbaDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _chkItensSemSugestaoClick(Sender: TObject);
    procedure _chkItensComSugestaoClick(Sender: TObject);
    procedure _chkItensSemSugestaoSemEstoqueClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _btnEstoqueClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure _btnSugestaoClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure _chkItensCurvaA_BClick(Sender: TObject);
    procedure _chkBonificaPedidoClick(Sender: TObject);
    procedure _dbgListaPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
      vlVendaCd, NrDiasEstoque,
      nrQtdadeSusgetaoPossivel,
      nrQtdadeSusgetaoInicio,

    nrQuantidadeRejeitada,
    nrDiasEstoqueComPedido, nrFornecedorPedido, NrFornecedor,
    nrCompradorPedido, NrDiasEstoqueComprador,
    NrDiasEstoquePendencia,
    nrListaPrecoExcecao,
    nrQtadade,
    nrProduto,
    cdoperadorLogisticoPedido,
    nrEmpresa: Integer;

    nmModuloPedido,
    stEmpresaSelecionada, stPedidos,
    stFiltroPedidoEmpresa,
    stSelecao: String;

    idCalculaMedia:Boolean;
    nrDiasUteis,
    nrEmpresaOCD,nrSomaLeadTimeOCD,

    nrDiasFaturamento,
    idforcaCross:Integer;


        { Public declarations }
    ParcelamentoPedido :TCondicaoPagamento;

    idAlerteOCD,idAlertaInativacao,idBonificado :Boolean;
    dtSelecionadaFormatada:String[10];
    qtMaxima, qtSeguranca: Double;
  //  qtSegurancaAcumulada: Double;
    nrMaiorValorUnidade: Integer;
    nrMaiorValorReais, vlEixoX: Double;
    mesSelecao:              Array [1 .. 18] of TMesSelecao;
    DadosVendaNova:          array [1 .. 18] of TDadosVendaProduto;
    DadosVendaNovaII:        array [1 .. 12,2019 .. 2025] of TDadosVendaProduto;
    VendaAnual:              Array [0 .. 10, 1 .. 13] of Integer;
    MediaAnual:              Array [0 .. 10, 1 .. 13] of Double;
    DesvioPadraoAnual:       Array [0 .. 10, 1 .. 13] of Double;
    VendasSumarizadaUnidade: Array [0 .. 10, 1 .. 13] of Integer;
    VendasSumarizadaValor:   Array [0 .. 10, 1 .. 13] of Double;
    nrDiasEstoqueAZero:      Array [0 .. 10, 1 .. 13] of Integer;
    nrDiasMes:               Array [0 .. 10, 1 .. 13] of Integer;
    QtdPrevisaoCompra:       Array [0 .. 10, 1 .. 13] of Integer;
    idMesSelecionado:        Array [1 .. 13] of string[1];
    nrPedidoAlteracao, nrDiasAteProximaChegadaInicio: Integer;
    idForcaPedidoLocal,idPedidoCrossDocking:Boolean;
    NrDiasEstoquePedido:Integer;

    idCurva:String;
    idTermoLabil : String;
    nmProduto: String[100];


    // nrEmpresaSelecionada :Integer;

    idCrossDocking :String[1];
    idPrecoCusto, idMostraDesconto: Char;

    dtPedido: Tdate;

    stCalculo: String[50];

      nrQtdEstoque, nrQtdCaixa, nrQtdVencido, nrQtdAvariada, nrQtdReservada,
      nrQtdCxCamada, nrQtdCxPalete, nrQtdUndCamada, nrQtdUndPalete,
      qtdPedido,
      //qtdPedidoTranferencia,
      nrVerba, nrGeracaoVerba, NrEmbalagemCompra, NrPedido, NrAuditoria,
      nrVerbaInicio: Integer;
      vlMediaMesCD, vlMediaDiaCD, vlPrecoLista, pcDescontoPadrao,
      pcDescontoAdicional, nrLeadTime, pcGeracaoVerba, pcVerba, vlVerba,
      pcDescontoRepasse,pcCreditoICMS: Double;

      vtEstoqueCompradorSC, vtEstoqueFornecedorSC, vtPendenciaCompradorSC,
      vtPendenciaFornecedorSC, vtCMVMedioCompradorSC, vtCMVMedioForncecedorSC,

      vtEstoqueCompradorRS, vtEstoqueFornecedorRS, vtPendenciaCompradorRS,
      vtPendenciaFornecedorRS, vtCMVMedioCompradorRS,
      vtCMVMedioForncecedorRS: Double;



    Mercadoria: TMercadoria;
    precoLista: TListaPreco;
    PrecoItem: TCalculoPreco;
    idAuditoria, idPosicionaProduto: Boolean;
    idprecoAtual: Char;
    idBloqueiaPedido: Integer; // 0 N?o Bleoqueado 1 Bloqueado ;

    DadosSugestao: TDadosQtdadeSugestao;
    DadosMedia: TDadosMedia;
    DadosPendencia: TDadosPendenciaPedido;
    DadosEstoqueCompra: TDadosEstoqueCurva;
    DadosItemPedidoLog: TDadosItemPedido;
    DadosFrequenciaCompra: TDadosFrequencia;
    DadosFornecedor: TDadosFornecedor;
    dadosEmpresa: TDadosEmpresa;

    DadosProdutoCross:TMercadoria;
    DadosPedidoAbertuta: TDadosValoresPedido;

    PedidoEmpresa: Array of Integer;
    AuditoriaEmpresa: Array of Integer;

    ValorSugestaoPedido: Array of Double;
    UnidadesSugestaoPedido: Array of Integer;

    DadosLeadTime: TDadosLeadTime;

   dtInativacaoFutura,
   dtBloqueiodeCompra:Tdate;
   idAtualizaAgendaPedido,
   IdVendaAutorizada: Boolean;
   TipoPedido:String[10];
   idAtualizaDesconto:Boolean;
   DadosPrecoUltimaentrada:TDadosUltimoPrecoEntrada;




    procedure InicializaMesSelecionados;
    function AbreProdutosLaboratorio(nrLaboratorio, nrComprador: Integer;
                                     PnrEmpresa: String): TClientDataSet;
    procedure ZeraVendaAnual;
    procedure FiltraVenda(PnrProduto, PnrEmpresa, PnrCanal: Integer);
    procedure MontaGrafico(PGrafico: TBarSeries;
      PnrProduto, PnrEmpresa: Integer);
    procedure MostraMedia;
    function getIndiceMes(PnmMes: String): Integer;
    procedure MostraDadosProduto(PnrQtdEstoque,
                                 PnrQtdPendente: Integer;
                                 PnrEstoqueMaximo: Double;
                                 PnrQtPedido: Integer;
                                 PEstoqueSeguranca,
                                 PvlVendaCD,
                                 PvlMediaMesEmpresa,
                                 PvlMediaMesCD,
                                 PvlMediaDiaCD: Double;
      PQtdCaixa, PQtdCamada, PQtdPalete: Integer);
    function CalculaMedia(PnrEmpresa: Integer): TDadosMedia;
    function setPendenciaCD(nrProduto, cdEmpresa: Integer):TDadosPendenciaPedido;
    procedure SetCorPendencia(PqtPedido,
                               PqtPendente,
                               PqtAtendida,
                               PqtProcessada,
                               PqtTransito,
                               PqtEstoqueCrossDocking,
                               Ppendencia: Integer);
    function SetLeadTime(PnrEmpresa: Integer; PidTermoLabil: String)
      : TDadosLeadTime;
    function GetUltimaCompra(PnrProduto, PnrCD, PnrOPerador: Integer): Tdate;
    function CalculoSugestaoIdealNova(PnrEmpresa: Integer;
                                      PvlPE,
                                      PnrDiasAjuste,
                                      PLeadTimeCalculo,
                                      PvlMediaDiaria: Double;
                                      PnrQuantidadeEstoque,
                                      PnrQuantidadaPendente,
                                      PQtdEstoqueMinimo,
                                      PQtdEstoqueMaximo,
                                      PcdOPeradorLogistico: Integer;
                                      PnrFrequenciaCompra: Double;
                                      PidCurva: String;
                                      PqtdPrevisaoCompra:Integer;
                                      PvlDesvioPadrao:Double): TDadosQtdadeSugestao;
    procedure SetTabelasItensCurva(PnrFornecedor: Integer; PnrEmpresa: String);
    procedure SetGridParamentro;
    function setParamentroItemCurvaCompra(PnrEmpresa, PnrDiasEstoque: Integer;
      PidCurva: Char): TDadosEstoqueCurva;
    procedure MostraDadosCompraProduto(PnrSugestaoIdeal: Double;
      PnrSugestaoPossivel, PnrQtdPedido, PnrDiasEstoque, PnrVerba: Integer);
//    function SugestaoPossivel(PnrQtdadeEmbalagem: Integer;
  //                            PnrQtdadeIdeal: Double): Integer;
    procedure PintaCampoCoberturaEstoquePendencia(PnrDiasCoberturaEstoque,
      PvlParamentoCompra: Double);
    procedure PintaCampoCoberturaEstoque(PnrDiasCoberturaEstoque,
      PvlParamentoCompra: Double);
    procedure SetCoresDataSaida(PnrDiasUltimaEntrada, PnrDiasUltimaSaida
      : Integer);
    procedure SetCoresCaixaCamadaPalete(PqtPedido, PqtEmbalagem, PqtCamada,
      PqtPalete: Integer);
    function SetIndiceFalta(PnrMes, PnrProduto, PnrEmpresa: Integer): Integer;
    procedure GetIndiceFaltaAnterior(PnrProduto, PnrCD: Integer);
    procedure GetIndiceFaltaAtual(PnrProduto, PnrCD: Integer);
    function DadosProdutos(PnrProduto, PnrEmpresa, PcdOPeradorLogistico
      : Integer): TMercadoria;
    function GetPrecoItem(PnrProduto, PcdEmpresa: Integer;
      PvlPrecoFornecedor, PpcDescontoAbatimento: Double; PIdPrecoAtual: Char;
      PidPedidoBloqueado, PnrLIstaPrecoAtiva: Integer): TListaPreco;
    function setEspecialidade(PnrEspecialiade: Integer): String;
    function AbreEspecealidade(PnrLaboratorio: Integer): TClientDataSet;
    function setQuantidadeEmbalagem(PnrProduto: Integer): Integer;
    procedure SetLocalCd(PnrEmpresa: Integer);
    procedure CarregaEmpresa;
    procedure AbreDadosFornecedor(PnrFornecedor: Integer; PnrEmpresa: String);
//    function AbreItemPrePedidoMultiEmpresa(PstPedido: String;
  //    PnrMercadoria, PcdEmpresa: Integer; PidSituacao: String): Boolean;
    function LocalizaItemPedido(PnrPedido, PnrMercadoria, PnrEmpresa: Integer)
      : TDadosItemPedido;
    procedure setGridEmpresa(PTabela: TClientDataSet);
    FUNCTION SetEmpresaSelecionadas(PTabela: TClientDataSet): TDadosEmpresa;
    procedure GeraPedido(PnrFornecedor: Integer;PidExecao:Boolean);
    procedure InicializaDadosFornecedor(PnrFornecedor: Integer);
    procedure SetGridLeadTime;
    procedure AjustaSelecaoEmpresa(PnrCdPedido: Integer);
    procedure AbrePedidoAlteracao(PnrPedido: Integer);
//    procedure _dbgLeadTimeDrawColumnCell(Sender: TObject; const Rect: TRect;
  //    DataCol: Integer; Column: TColumn; State: TGridDrawState);
//    procedure _btnInativacaoClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function ListaPrecoAtivas(PnrFornecedor, PnrProduto: Integer): Boolean;
    procedure SetGridListaPreco;
    function SetListaPrecoAtiva(PnrLista, PnrProduto, PnrEmpresa: Integer): TListaPrecoAtiva;
    function ListaDiasEstoqueCD(PstEmpresa: String): TClientDataSet;
    procedure SetGridPEDiasEstoque;
    function setDiasEstoque(PnrEmpresa: Integer): Integer;
    procedure SetNomeCampoItemPrePedido(TabelaPedido: TClientDataSet);
    function TotalizaPedidoMultiEmpresa(PstPedido: String; PcdEmpresa: Integer;
      PidSituacao: String): Boolean;
    procedure SetGridTotalizaPedido;
    function GravaItemPedido(PnrPedido, PnrProduto, PnrEmpresa,
      PQtdadePedido: Integer; PpcDescontoAdiocional: Double;PidInicio:Boolean): Boolean;
    procedure ZeraNumeroPedido;
    procedure PrazoPedido(PnrDiasPrazo: Integer);
    procedure setGridPrazo;
    procedure setNumeroOperador(PnrFornecedor,PcdOperador: Integer);
    procedure PosicionaItemPedido(PnrProduto, PnrEmpresa: Integer);
    function AbreItemPedidoMultiEmpresa(PstPedido: String;
      PnrMercadoria, PcdEmpresa: Integer; PidSituacao: String): Boolean;
    procedure CarregaEmpresaPedido;
    procedure filtroPedido(PstEmpresa: String);
    function PrazoPagamento(tabela: TClientDataSet): string;
    function SetEmpresaPedido(PTabela: TClientDataSet;
      PidDesligaFiltro: Boolean): TDadosEmpresa;
    procedure SetEmpresaPedidoInico(PTabela: TClientDataSet);
    procedure SetEmpresaPedidoFinal(PTabela: TClientDataSet);
    procedure PreencheDadosFornecedor;
    procedure DadosEstoqueEmpresa(PnrFornecedor: Integer);
    procedure SetNomeCamposDadosEstoque;
    procedure DadosEstoquePendente(PnrFornecedor: Integer);
    procedure SetNomeCamposDadosPendenciaEstoque;
    procedure DadosVendaMes(PnrFornecedor: Integer);
    procedure SetNomeCamposDadosVendaMes;
    procedure DadosSugestaoCompra(PnrFornecedor: Integer);
    procedure SetNomeCamposSugestao;
    procedure DadosExcessoEstoque(PnrFornecedor: Integer);
    procedure SetNomeCamposExcesso;
    function VendaSumarizadaLaboratorioMultiEmpresaAtual(PnrLaboratorio,
      PnrOperadorLogistico: Integer): TClientDataSet;
    procedure MontaGraficoGeral(PGrafico: TBarSeries;
      PnrProduto, PnrEmpresa: Integer);
    procedure CarregaVendaSumarizada(PnrProduto, PnrEmpresa: Integer);
    procedure MontaGraficoLinha(PGrafico: TLineSeries;
      PnrProduto, PnrEmpresa: Integer);
    procedure PreencheComboGrafico;
    procedure MontaGraficoGeralValor(PGrafico: TBarSeries;
      PnrProduto, PnrEmpresa: Integer);
    procedure MostraDiasEstoque;
    procedure montaGraficoEstoqueDiario;
    procedure SetgraficoVenda;
    procedure SetgraficoPosicaoEstoque;
    function FiltraUltimasCompras(PnrProduto, PcdEmpresa: Integer;
      PdtCompra: Tdate): TDadosUltimasCompra;
    function FiltraUltimasPedido(PnrProduto, PcdEmpresa: Integer;
      PdtCompra: Tdate): TDadosUltimasCompra;
    function FiltraUltimoPedido(PnrProduto, PcdEmpresa: Integer;
      PdtCompra: Tdate): TDadosPedidoCompra;
    procedure SetDadosAgenda;
    procedure InicializaFornecedor;
    function FiltraPendenciaItem(PnrProduto, PcdEmpresa: Integer)
      : TClientDataSet;
    procedure SetValorSugestaoPedido;
    procedure AvancaItem;
    procedure setCoresGraficoCurva(idCurva: String);
    procedure FiltraVendaPorCanal(PnrProduto, PcdEmpresa: Integer;
      PdtPeriodo: String);
    procedure SetGridVendaCanal;
    procedure setGridPedidoEmpresa(PTabela: TClientDataSet);
    function SetStatusPedidoGerado(PidStatus: String): Boolean;
    procedure EliminaCondicaoPagamento;
    function LiberaCompraItem(PdtInativacaoFutura,
                              PdtBloqueioCompra: Tdate;
                              PidMostraMensagem,
                              PidLiberaCompra,
                              PIdVendaAutorizada:Boolean): Boolean;
    function FiltroPedidoNaoFechados: String;
    procedure IncioPedido;
    procedure EncerraPedido(PidConfirma: Boolean);
    function LocalizaDescontoOPerador(PnrProduto, PnrCD: Integer): double;
    procedure ExecutaPreco(PnrEmpresa:Integer);
    procedure CarregaParcelamentoPedido(PnrCondicaoPagamento: Integer);
    procedure GerarExcelPedidoLocal(PnrPedido: Integer; PidPrecoCusto,
      PidPercentualDesconto: Char);
    function CarregaCSTProduto(PnrFornecedor: Integer): Boolean;
    function SetPedidoLocalCrossdocking(PnrProduto,
      PnrEmpresa: Integer): Boolean;
    procedure setDataInativacaoFuturaBloqueioProduto;
    function ValidaVerba(PnrVerba: Integer): Integer;
    procedure SetNomeCampoItemPrePedidoII(TabelaPedido: TClientDataSet);
//    procedure GeraPedidoNovo(PnrFornecedor: inTeger);
    procedure Timer1Timer(Sender: TObject);
    Function FGeraPedidoNovo(PnrFornecedor,
                             PnrEmpresa,
                             PnrPedido,
                             PcdOperadorLogistico,
                             PnrDias,
                             PidExcecao,
                             PnrListaExcecao:inTeger):Integer;
    function FSetEmpresaSelecionadasII(PTabela: TClientDataSet): TClientDataSet;
    function AbreItemPrePedidoMultiEmpresaNova(PnrFornecedor,PforcaCross:integer;PstPedido,
      PstEmpresa: String): Boolean;
    procedure SetItemPedido;
    procedure FiltraPrepedido;
    procedure SetDadosProduto(PnrEmpresa:Integer);
    procedure FiltraItensSugestao;
    function SugetaoParaPeloDiasCompra: Integer;
    procedure FiltraVendaMesAtual(PnrProduto, PnrEmpresa, PnrCanal,
      PnrMes: Integer);
    procedure PedidoExcecao;
    procedure PedidoNovo(IdTipoPedido: Boolean);
    procedure PedidoNormal;
    procedure AbreDiasEstoque;
    procedure SetPosicaoGrafico(PnrProduto, PnrEmpresa: Integer);
    procedure FiltraVendaII(PnrProduto, PnrEmpresa, PnrCanal: Integer);
//    procedure MostraGraficoVendas(PnrProduto, PnrEmpresa: Integer);
    function MostraVendaVendasNovo(PnrProduto, PnrEmpresa, PAno, Pmes,
      PnrCanal: Integer): TDadosVendaProduto;
    procedure MontaGraficoNovo(PnrProduto, PnrEmpresa, PnrCanal: Integer);
    function DadosProduto: TMercadoria;
    function GetDadosProduto: Boolean;
    procedure PSetPrecoPoduto;
    procedure PSetCoresGRafico;
    procedure PmovimentoTabelaPedido;
    function MostraVendaVendasNovoII(PnrProduto, PnrEmpresa, PAno, Pmes,PnrCanal: Integer):TDadosVendaProduto;
    function FRecalculaCusto(PnrPedido:Integer): Boolean;
    function GetPrecoItemAlteraPedido(nrProduto, cdEmpresa: Integer;
      vlPrecoFornecedor, pcDescontoAbatimento: double;
      IdPrecoAtual: Char): TListaPreco;
    function SetVendaAutorizadaCrossDocking(PnrProduto, PnrEmpresa,
      PcdOPeradorLogistico: Integer): boolean;
    function validaInclusaodItemPedido(PidPedidoCrossdocking: Boolean;
      PidItemCrossdocking: String): Boolean;
    function CarregaUltimoPre?oEntrada(PnrFornecedor: Integer): Boolean;
    function SetPrecoUltimaEntrada(PnrProduto,
      PnrEmpresa: Integer): TDadosUltimoPrecoEntrada;
    function FGeraPedidoNovoII(PnrFornecedor, PnrEmpresa, PnrPedido,
      PcdOperadorLogistico, PnrDias, PidExcecao,
      PnrListaExcecao: Integer): Integer;
    function AbreVendaLaboratorioMultiEmpresaAtual(PnrLaboratorio, PnrEmpresa,
      PnrOperadorLogistico: Integer): TClientDataSet;
    procedure setPedidoCompra;
   { Private declarations }
  public


  end;

var
  _frmTelaCompras: T_frmTelaCompras;
  nrAlturaTela: LongInt;
  nrCompradorPedidoLocal,
  cdOperadorLogisticoLocal, nrFornecedorLocal,NrPedidoApi: Integer;
  nmLaboratorioLocal: String;
  idSituacaoAgenda: String[60];
  idPedidoAgendado: String[1];
  idSituacao:String;

   NrDiasInformado:Integer;


  idAgendaAntecipada,
  idPedidoAPI : Boolean;

implementation

uses uDm, uRelatorioVerbas, uUltimosPedidos, uSqlConsultaSistemas,
  uJustificativa, uObservacaoNoFornecedor,
  uObservacaoInativacaoBloqueio, uSistemaCompras;

{$R *.dfm}

procedure T_frmTelaCompras.FormActivate(Sender: TObject);
begin
  if idPedidoAPI then
  begin
    setPedidoCompra;
    idPedidoAPI:=false;

  end;
end;

procedure T_frmTelaCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree
end;

procedure T_frmTelaCompras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  I: Integer;
begin
  for I := 0 to High(PedidoEmpresa) do
    if PedidoEmpresa[I] > 0 then
      CanClose := false;
  if not CanClose then
  begin
    Mensagem('Existe pedido em Aberto' + #13 +
      'Cancela para fechar a tela de pedido', MB_ICONWARNING);

  end
  else
    dec(nrJanelasPedido);

end;

procedure T_frmTelaCompras.FormCreate(Sender: TObject);
var
  nrTamanhoArray: Integer;
begin
  idBonificado:=false;
  nrDiasUteis:=DiasUtilDoMes;
  nrDiasFaturamento:=DiasFaturamento;
  if not idPedidoAPI then
     nrPedidoAlteracao:=0;
  dtPedido := dtSistema;
  nrTamanhoArray := High(PedidoEmpresa);
  CarregaEmpresa;
  PreencheComboGrafico;

  dadosEmpresa := SetEmpresaSelecionadas(_cdsEmpresa);
  stEmpresaSelecionada := dadosEmpresa.stEmpresa;
  SetLength(PedidoEmpresa, 10);
  SetLength(AuditoriaEmpresa, 10);
  SetLength(ValorSugestaoPedido, 10);
  SetLength(UnidadesSugestaoPedido, 10);

end;

procedure T_frmTelaCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nmCampo: String;
  I: Integer;
begin

  if ActiveControl <> NIL then
    nmCampo := ActiveControl.Name;

  if (ActiveControl is TGroupBox) then
  begin
    Mensagem('Teste', MB_ICONQUESTION);
  end;

  case Key of
    VK_ESCAPE:
      begin
        for I := 0 to High(PedidoEmpresa) do
        begin
          if PedidoEmpresa[I] > 0 then
            exit;
        end;
        close;

      end;
    VK_RETURN:
      begin
        if (_pgcCompras.ActivePage = _tbsParametros) then
        begin
          Perform(WM_NEXTDLGCTL, 0, 0);
          key:=0;

        end;

      end;
    VK_F1:
      if _edtQtdadePedido.CanFocus then
        _edtQtdadePedido.SetFocus;
    VK_UP:
      if not(ActiveControl is TDBGrid) then
      begin
        if nmCampo = '_edtQtdadePedido' then
        begin
          if not _cdsPrePedido.bof then
          begin
            key:=0;
            idPosicionaProduto := false;
            _cdsPrePedido.Prior;
            PmovimentoTabelaPedido;
            if not _cdsPrePedido.bof then
              PosicionaItemPedido(nrProduto, nrEmpresa);

            //_edtDiasEstoque.SetFocus;
            _edtQtdadePedido.SetFocus;
            _edtQtdadePedido.SelectAll;
            exit;
          end;

        end
        else
        begin
          Perform(WM_NEXTDLGCTL, 0, 0);
           nrProduto:=_cdsPrePedido.FieldByName('nrom_y').AsInteger;
           nrEmpresa:=_cdsPrePedido.FieldByName('CD_EMPRESA').AsInteger;

//          SetPosicaoGrafico(_cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger,
  //                          _cdsPrePedido.FieldByName('CD_empresa').AsInteger);

        end;
      end
      else
      begin
        idPosicionaProduto := true;
      end;

    VK_DOWN:
      if not(ActiveControl is TDBGrid) then
      begin
        if nmCampo = '_edtQtdadePedido' then
        begin
          if not _cdsPrePedido.eof then
          begin
            key:=0;
            idPosicionaProduto := false;

            _cdsPrePedido.Next;

              nrProduto:=_cdsPrePedido.FieldByName('nrom_y').AsInteger;
              nrEmpresa:=_cdsPrePedido.FieldByName('CD_EMPRESA').AsInteger;

              PmovimentoTabelaPedido;

              if not _cdsPrePedido.bof then
                 PosicionaItemPedido(nrProduto, nrEmpresa);


             _edtDiasEstoque.SetFocus;
             _edtQtdadePedido.SetFocus;
             _edtQtdadePedido.SelectAll;
          end;

        end
        else
        BEGIN
          Perform(WM_NEXTDLGCTL, 0, 0);
         SetPosicaoGrafico(_cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger,
                            _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger);


        END;

      end
      else
      begin
        idPosicionaProduto := true;
      end;

  end;
  if (ssCtrl in Shift) and (Key = 79) then
  begin
    NrFornecedorObservacao := NrFornecedor;
    Application.CreateForm(T_frmObservacaoLaboratorio,
      _frmObservacaoLaboratorio);
    ShowWindow(_frmObservacaoLaboratorio.Handle, SW_SHOWNORMAL);
  end;

end;

procedure T_frmTelaCompras.FormShow(Sender: TObject);
var
  nrTopGridPedido: LongInt;
  stTemp: String;

begin
   idAtualizaAgendaPedido:=true;
  _lbeUltimoPrecoEntrada.EditLabel.Caption:='';
  _lbepcCreditoICMS.EditLabel.Caption:='';
  _lbeUltimoCustoEntrada.EditLabel.Caption:='';
  _lbeValorVerbaUltimaEntrada.EditLabel.Caption:='';


  NrFornecedor := 0;
  //qtSegurancaAcumulada:=0;
  Timer1.Enabled := false;
  _dtpPedido.Date := dtSistema;


  idAtualizaDesconto:=true; {** Atualiza o % Desconto na dcpci (pc_desconto_negociado)
                              somente atualiza no pedido novo em pedidos  ja digitado
                            altera o campo **}

  _cdsCondicaoPagamento.close;
  _cdsCondicaoPagamento.CreateDataSet;

    _chkPedidoAlimentar.Enabled:=false;;
   if PedidoAlimentar(nrFornecedorLocal) then
      _chkPedidoAlimentar.Enabled:=true;



  _pgcCompras.ActivePage := _tbsParametros;
  _tbsSugestao.TabVisible := false;
  _tbsCompras.TabVisible := false;
  _tbsConfirma.TabVisible:=false;
  nrFornecedorPedido := 0;
  nrTopGridPedido := _grdPedido.Top;
  // _grbTotaisPedido.top:=nrTopGridPedido-;
  _grbTotaisPedido.Height := (nrTopGridPedido + 15) - _grbTotaisPedido.Top;
  _lbeNrPedido.SetFocus;



  _edtFornecedor.Text := IntToStr(nrFornecedorLocal);
  cdoperadorLogisticoPedido := cdOperadorLogisticoLocal;

  NrFornecedor := StrToIntDef(_edtFornecedor.Text, 0);

  DadosFornecedor := GetDadosLaboratorio(NrFornecedor);
  _lbeDiaPedido.Caption := DiasdeCompra(DadosFornecedor.dsDiasPedido);

  SetDadosAgenda;
  if DadosFornecedor <> nil then
    PreencheDadosFornecedor;

  stTemp := 'Fora da Agenda' + ' - ' + idSituacaoAgenda;
  nmModuloPedido := 'Ped.' + idSituacaoAgenda;
  if idPedidoAgendado = 'S' then
  begin
    stTemp := 'Ped. Agendado';
    nmModuloPedido := stTemp;
  end;

  _frmTelaCompras.Caption :=
    LeftStr(nmLaboratorioLocal + '                           ', 30) + stTemp +
    '  Operadador Logist. :' + FormatFloat('0000', cdoperadorLogisticoPedido);

  Series3.Visible := false;
  Series8.Visible := false;
  Series9.Visible := false;

  Series10.Visible := false;
  Series11.Visible := false;


  // _cbxEmpresa.SetFocus;

end;



procedure T_frmTelaCompras.InicializaMesSelecionados;
var
  I: Integer;
  mes, Dia, Ano: Word;
begin
  for I := 1 to 13 do
    idMesSelecionado[I] := 'N';
  mes := MonthOf(IncMonth(dtPedido, 0));
  mes := MonthOf(IncMonth(dtPedido, 1));
  mes := MonthOf(IncMonth(dtPedido, 2));
  mes := MonthOf(IncMonth(dtPedido, 3));
  mes := MonthOf(IncMonth(dtPedido, 4));
  // idMesSelecionado[MonthOf(IncMonth(dtPedido, -3))] := 'S';
  // idMesSelecionado[MonthOf(IncMonth(dtPedido, -2))] := 'S';
  // idMesSelecionado[MonthOf(IncMonth(dtPedido, -1))] := 'S';
  DecodeDate(Date, Ano, mes, Dia);
  if Dia <> 1 then
    idMesSelecionado[13] := 'S';
  if Dia = 1 then
    idMesSelecionado[mes - 1] := 'S';
end;


Function T_frmTelaCompras.AbreProdutosLaboratorio(nrLaboratorio,
  nrComprador: Integer; PnrEmpresa: String): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
begin
  _cdsTemp := TClientDataSet.Create(nil);
  _cdsTemp.RemoteServer := _dm._LocalConexao;
  _cdsTemp.ProviderName := '_dspGenerica';

  try
    TRY
      stQry := TStringList.Create;
      stQry.Add('SELECT');
      // stQry.Add('-- MERCADORIA

      stQry.Add('COMPRA.CD_EMPRESA,MERCADORIA.CD_MERCADORIA,NR_DV_MERCADORIA,');
      stQry.Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
      stQry.Add('ID_UNIDADE_FEDERACAO AS ID_LOCAL_CD,');
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
      stQry.Add('COMPRA.DT_INATIVACAO,COMPRA.DT_INATIVACAO_FUTURA,');
      stQry.Add('COMPRA.DT_BLOQUEIO_COMPRA,');
      stQry.Add('DS_OBSERVACAO_INATIVACAO,ID_VENDA_MERCADO, ID_REVISTA,');
      stQry.Add('CD_FAMILIA_MARKETING, NR_FAMILIA_MERCADORIA,');
      stQry.Add('NR_NCM, DS_MINISTERIO_SAUDE,');
      stQry.Add('DS_NIVEL_ECNM, DS_NIVEL_EMAM, DS_NIVEL_ERGM, DS_NIVEL_EPRM, DS_NIVEL_ERTM,');
      stQry.Add('DS_NIVEL_ECTM, DS_NIVEL_EITM, DS_NIVEL_ESIM,');
      stQry.Add('VL_PESO_CAIXA,NR_EXTENSAO_IPI, MERCADORIA.ID_CALCULA_PRECO,');
      stQry.Add('QT_MULTIPLO_ALIMENTAR, QT_MULTIPLO_FARMA,');
      stQry.Add('ID_PACK_PROMOCIONAL, ID_VINCULADO_PACK,');
      stQry.Add('VL_TEMPERATURA_MINIMA, VL_TEMPERATURA_MAXIMA,');
      stQry.Add('DS_MERCADORIA, DT_ATUALIZACAO_SID, DT_ATUALIZACAO_MERCADORIA,');
      stQry.Add('compra.CD_GRUPO_FORNECEDOR,');
      stQry.Add('ID_REPASSE_ICMS, ID_SUPERFLUO, ID_RETEM_ICMS, ID_CIPADO,');
      stQry.Add('ID_TIPO_LISTA_FISCAL,ID_REDUCAO_BASE, ID_TRIBUTACAO_NFE,');
      stQry.Add('CD_TRIBUTACAO_ICMS, CD_CST, CD_CST_PIS_VENDA,CD_CST_COFINS_VENDA,');
      stQry.Add('CD_CST_ENTRADA, CD_CST_SAIDA, PC_CREDITO_ICMS, PC_MARGEM_VENDA,');
      stQry.Add('PC_MARGEM_VENDA_ALIMENTAR, PC_IPI_MERCADORIA, DT_CADASTRO_MERCADORIA,');
      stQry.Add('DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA, ID_COFINS, ID_PIS,');
      stQry.Add('VL_PRECO_COMPRA,VL_PRECO_VENDA,VL_PRECO_VENDA_ANTERIOR,');
      stQry.Add('VL_PRECO_COMPRA_ANTERIOR,');
      stQry.Add('case');
      stQry.Add('when ID_VENDA_AUTORIZADA=''N'' and COMPRA.CD_EMPRESA=5 then ''S''');
      stQry.Add('else ''N''');
      stQry.Add('END ID_COMPRA_BLOQUEADA,');
      stQry.Add('ID_VENDA_AUTORIZADA, ID_PROMOCAO_COTACAO_QTD,DT_ATUALIZACAO_FISCAL,');
      stQry.Add('PC_DESCONTO_PADRAO_COMPRA,COMPRA.ID_SITUACAO_MERCADORIA,CD_CST_PIS_COMPRA,');
      stQry.Add('CD_CST_COFINS_COMPRA,COMPRA.PC_REPASSE_COMPRA,COMPRA.ID_CURVA_MERCADORIA,');
      stQry.Add('DT_PRIMEIRA_COMPRA,CD_LOCALIZACAO, QT_CXA_CAMADA_LOGISTICO,');
      stQry.Add('QT_CXA_PALETE_LOGISTICO,QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
      stQry.Add('QT_RESERVA_PROBLEMATICA,QT_VENCIDO ,QT_BLOQUEADO,');
      stQry.Add('QT_CAIXA_PALETE ,QT_CAIXA_CAMADA,');
      stQry.Add('CASE');
      stQry.Add('WHEN  QT_FISICO - QT_RESERVADO - ');
      stQry.Add('QT_RESERVA_PROBLEMATICA - QT_VENCIDO - QT_BLOQUEADO <0 THEN 0');
      stQry.Add('ELSE QT_FISICO - QT_RESERVADO - QT_RESERVA_PROBLEMATICA');
      stQry.Add('end ESTOQUE_FISICO,');
      stQry.Add('NR_VERBA_GERACAO,PC_VERBA_GERACAO,CD_EMPRESA_CROSSDOCKING,');
      stQry.Add('DT_ATUALIZACAO_ESTOQUE, ESTOQUE.ID_SITUACAO_MERCADORIA,');
      stQry.Add('DT_ATUALIZACAO_PRECO_VENDA,CD_COMPRADOR,VT_CUSTO_FINANCEIRO_MERCADORIA,');
      stQry.Add('Nvl(ID_EXCLUSIVO_OPERACAO_REDE,''N'') AS ID_EXCLUSIVO_OPERACAO_REDE,VL_CUSTO_GERENCIAL');
      stQry.Add('FROM');
      stQry.Add('PRDDM.DC_MERCADORIA  MERCADORIA,');
      stQry.Add('ACESSO.DC_EMPRESA  EMP,');
      stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
      stQry.Add('PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,');
      stQry.Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
      stQry.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      stQry.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
      stQry.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
      stQry.Add('LEFT OUTER JOIN PRDDM.DC_OPERACAO_REDE_MERCADORIA');
      stQry.Add('                                   OPM ON OPM.ID_EXCLUSIVO_OPERACAO_REDE=''S''');
      stQry.Add('                                    AND OPM.ID_SITUACAO=''A'' AND cd_operacao_rede=6');
      stQry.Add('                                    AND OPM.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA and OPM.CD_empresa=ESTOQUE.CD_empresa');

      stQry.Add('WHERE');
      stQry.Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      stQry.Add('AND MERCADORIA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
      stQry.Add('AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
      stQry.Add('AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      stQry.Add('AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
      stQry.Add('AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
      stQry.Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
      stQry.Add('AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      stQry.Add('AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
      stQry.Add('AND COMPRA.CD_EMPRESA=EMP.CD_EMPRESA');
      stQry.Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
      stQry.Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      stQry.Add('AND FINANCEIRO.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      stQry.Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
      stQry.Add('AND EMP.ID_EMPRESA_FISICA =''S''');
      stQry.Add('AND COMPRA.ID_SITUACAO_MERCADORIA =''A''');
      stQry.Add('AND ESTOQUE.ID_SITUACAO_MERCADORIA =''A''');
      stQry.Add('AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
      stQry.Add('(SELECT cd_mercadoria,CD_EMPRESA FROM prddm.dc_operacao_rede_mercadoria opr');
      stQry.Add('                      WHERE id_exclusivo_operacao_rede=''S''');
     stQry.Add('                       AND id_situacao=''A'' AND cd_operacao_rede=6)');

      stQry.Add( 'AND COMPRA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNeCEDOR');
    //  if PnrEmpresa <> '' then
      //  stQry.Add('AND COMPRA.CD_EMPRESA in (' + PnrEmpresa + ')');

      // stQry.Add('AND COMPRA.CD_COMPRADOR=:PnrComprador');
      stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFabricante');

      stQry.Add('AND ID_EXCLUSIVO_OPERACAO_REDE IS null');
      // stQry.Add('ORDER BY COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA');
      stQry.SaveToFile('C:\temp\QryProdutoGrafico.sql');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        // Params.ParamByName('PnrComprador').AsInteger  := nrComprador;
        Params.ParamByName('PnrFabricante').AsBcd := nrLaboratorio;

        open;
      end;
      Result := nil;
      if not _cdsTemp.IsEmpty then
      begin
        // _cdsTemp.IndexFieldNames := 'NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA;CD_EMPRESA';
        Result := _cdsTemp;

      end;
    EXCEPT
      Mensagem('eRRO', MB_ICONERROR)

    END;

    // Application.ProcessMessages;
  finally
    FreeAndNil(stQry);
  end;
end;


procedure T_frmTelaCompras.ZeraVendaAnual;
var
  I: Integer;
  j: Integer;
begin
  for j := 0 to 10 do
    for I := 1 to 13 do
    begin
      VendaAnual[j, I] := 0;
      MediaAnual[j, I] := 0;
      DesvioPadraoAnual[j, I] := 0;
      nrDiasEstoqueAZero[j, I] := 0;
      nrDiasMes[j, I] := 0;
      VendasSumarizadaUnidade[j, I] := 0;
      VendasSumarizadaValor[j, I] := 0;
      QtdPrevisaoCompra[j, I] := 0;
    end;
end;

procedure T_frmTelaCompras._btnAgenDAClick(Sender: TObject);
begin
  if _dtpProximaAgenda.Date<dtSistema then
  begin
    Mensagem('Data Informada Menor que data Atual',64);
    exit;
  end;

  SetDataAgenda(nrFornecedorPedido, _dtpProximaAgenda.Date,_dtpProximaAgenda.Date + DadosFrequenciaCompra.nrFrequenciaCompra);

end;

procedure T_frmTelaCompras._btnBloqueioClick(Sender: TObject);
begin


            idTipoMotivo:='BL';
           nrProdutoObservacao:=nrProduto;
           Application.CreateForm(T_frmMotivoInativacaoBloqueio, _frmMotivoInativacaoBloqueio);
           _frmMotivoInativacaoBloqueio.ShowModal;
           _cdsInativaBloqueio:= _frmMotivoInativacaoBloqueio._cdsProdutosInativaBloqueia ;
           if _cdsInativaBloqueio<>nil then
           begin
             if _cdsInativaBloqueio.Active then
             begin
               /// _cdsInativaBloqueio.Open;
                _cdsInativaBloqueio.recordcount;
               if not _cdsInativaBloqueio.IsEmpty then
                  setDataInativacaoFuturaBloqueioProduto;


             end;


           end;



  { if FormatDateTime('dd/mm/yyyy',dtBloqueiodeCompra)='01/01/2039' then
   begin
     if ConfirmaIcone('Aviso Bloqueio Produto para Compra Futura',
                      'Bloquear Produto para comprar ?', MB_YESNO, MB_ICONQUESTION, 0)= IDYES then

     begin


        if SetBLoqueioProduto(nrProduto,nrEmpresa, dtSistema) then
        begin
            idTipoMotivo:='BL';
            nrProdutoObservacao:=nrProduto;
           Application.CreateForm(T_frmMotivoInativacaoBloqueio, _frmMotivoInativacaoBloqueio);
           _frmMotivoInativacaoBloqueio.ShowModal;
          _cdsProduto.Edit;
          if _cdsProduto.State = dsEdit then
            _cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime :=dtSistema;
             Mensagem('Bloqueio Efetuado', MB_ICONINFORMATION);
//          if SetCurvaProduto(nrProduto,nrEmpresa, 'E', 'N') then
  //          Mensagem('Curva Atualizada', MB_ICONINFORMATION)
    //      else
      //      Mensagem('Erro na Atualizacao da Curva', MB_ICONERROR);

        end
        else
          Mensagem('Erro na marca??o', MB_ICONERROR);
      end;
      exit;
    end;
   if FormatDateTime('dd/mm/yyyy',dtBloqueiodeCompra)<>'01/01/2039' then
   begin
     if ConfirmaIcone('Produto J? esta Bloqueado para Compra Futura',
                      'Deseja Desbloquear Produto para compra ?', MB_YESNO, MB_ICONQUESTION, 0)= IDYES then

     begin
        if SetBLoqueioProduto(nrProduto,nrEmpresa, strtodate('01/01/2039')) then
        begin
          _cdsProduto.Edit;
          if _cdsProduto.State = dsEdit then
            _cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime :=strtodate('01/01/2039');
             Mensagem('LIberada compra', MB_ICONINFORMATION);
        end
        else
          Mensagem('Erro na marca??o', MB_ICONERROR);
      end;
      exit;
    end;}
end;

procedure T_frmTelaCompras._btnConfirmaClick(Sender: TObject);
var
  idStatus,
  idStatusCapa,
  stObservacao, stPrazo: string;
  cdPagamento, nrEmpresaFinal,i,NrPedTemp: Integer;
  DadosValoresPedido: TDadosValoresPedido;
  DadosPedido : TDadosValoresPedido;


begin

  nrVerba := StrToIntDef(_edtNrVerba.Text, 0);


   if cdoperadorLogisticoPedido=1 then
      cdoperadorLogisticoPedido:=StrToIntDef(copy(_cbOPeradorLogistico.Items.Strings[_cbOPeradorLogistico.ItemIndex] ,1,4),1);

   if cdoperadorLogisticoPedido<1 then
      cdoperadorLogisticoPedido:=1;

  if (_chkBonificaPedido.Checked) and (nrVerba=0) and (cdoperadorLogisticoPedido<=1) then
  begin

     Mensagem('Pedido Bonificado necessita de verba...',MB_ICONWARNING);
     _edtNrVerba.SetFocus;
     exit;
  end;

   if nrVerba>0 then
   begin
        nrVerbaInicio:= GetVerbaFornecedor(nrVerba, nrFornecedorPedido);
        if nrVerbaInicio=0 then
        begin
          mensagem('verba N?o disponivel para esse fornecedor !!!',MB_ICONWARNING);
          _edtNrVerba.SelectAll;
          _edtNrVerba.SetFocus;
          exit;
        end
        else
        nrVerba:=nrVerbaInicio;

   end;



   SetEmpresaPedidoInico(_cdsEmpresaPedido);
  _cdsEmpresaPedido.First;
  dtPedido:=strtodate(FormatDateTime('dd/mm/yyyy',_dtpPedido.Date));


  for I := 0 to High(PedidoEmpresa) do
   begin
      if PedidoEmpresa[I] > 0 then
      begin
         NrPedTemp:=PedidoEmpresa[I];

         if TestaItemInativo(NrPedTemp,0,0) then
           exit;

      end;
   end;

  repeat
    if cdoperadorLogisticoPedido=1 then
      cdoperadorLogisticoPedido:=StrToIntDef(copy(_cbOPeradorLogistico.Items.Strings[_cbOPeradorLogistico.ItemIndex] ,1,4),1);

    while not _cdsEmpresaPedido.eof do
    begin
      idStatus := 'N';
      idPrecoCusto := 'N';
      if _chkRelatorioPrecoCusto.Checked then
        idPrecoCusto := 'S';
      idMostraDesconto := 'N';
      if _chkMostraDesconto.Checked then
        idMostraDesconto := 'S';
      stObservacao := ' ';
      if _chkObservacaoPedido.Checked then
        stObservacao := _edtObservacaoPedido.Text;


      if _chkBonificaPedido.Checked then
      begin
         stObservacao :=  'Pedido Bonificado   '+stObservacao;
          setBonificaPedido(NrPedido, 0, nrVerba);
      end;




      NrPedido    := PedidoEmpresa[_cdsEmpresaPedido.FieldByName('CD_EMPRESA').AsInteger];
      nrEmpresa   := _cdsEmpresaPedido.FieldByName('CD_EMPRESA').AsInteger;
      stPrazo     := PrazoPagamento(_cdsCondicaoPagamento);
      cdPagamento := AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento.recordCount);
      DadosValoresPedido := GetValoresPedido(NrPedido, false);
      NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);


     // Status P quando esta alterando Pedido Especidico
     idStatusCapa:=idStatus;
      if DadosValoresPedido.idStatusPedido='P'  then
         idStatusCapa:='P';



      if NrPedido > 0 then
      begin
        // Emiminando Itens Pedido n?o comprado.
        EliminaItemQuantidadeZerada(NrPedido);
        if AtualizaCapaPedido(NrPedido,
                              cdPagamento,
                              cdoperadorLogisticoPedido,
                              nrLeadTime,
                              idStatusCapa,
                              stObservacao,
                              idAtualizaAgendaPedido,
                              dtPedido,
                              dtPedido+DadosFrequenciaCompra.nrFrequenciaCompra,
                              dtPedido + DadosFrequenciaCompra.nrFrequenciaCompra,
                              NrDiasEstoqueComprador,
                              nrVerbaInicio,_chkBonificaPedido.Checked,0 ) then
          begin
           DaDosPedido:=GetValoresPedido(nrPedido,false);

           if DaDosPedido.nrItensPedido=0 then
           begin
              SetStatusPedidoGerado('S');
              PedidoEmpresa[nrEmpresa] := 0;

               AtualizaCapaPedido(nrPedido,
                                  cdPagamento,
                                  cdoperadorLogisticoPedido,
                                  nrLeadTime,
                                  'I',
                                  'Ped.nao Sem itens',
                                  false,
                                  dtPedido,
                                  dtPedido,
                                  dtPedido + DadosFornecedor.nrGrupoFornecedor,
                                  NrDiasEstoqueComprador,
                                  nrVerbaInicio,
                                  _chkBonificaPedido.Checked,0);
             //  AtualizaStatusItemPedido(nrPedido, 0,cdoperadorLogisticoPedido, 'I');



           end;


          if DadosPedido.nrItensPedido>0 then
          begin
           if AtualizaStatusItemPedido(NrPedido, 0, cdoperadorLogisticoPedido, idStatus) then
           begin
            SetStatusPedidoGerado('S');
            PedidoEmpresa[nrEmpresa] := 0;
            // Imprimindo Pedido
            if (_chkImprimir.Checked) then
            begin
              Imprimir(NrPedido, idPrecoCusto, idMostraDesconto);
              if DadosValoresPedido.nrPedidoVinculado > 0 then
                Imprimir(DadosValoresPedido.nrPedidoVinculado, idPrecoCusto,
                  idMostraDesconto);
            end;
          end;
            // Gerando Excel Pedido
          if (_chkGeraExcel.Checked) then
          begin
              if DadosValoresPedido.nrTotalUnidadesPedido > 0 then
              begin
                GerarExcelPedidoLocal(NrPedido, idPrecoCusto, idMostraDesconto);
                if DadosValoresPedido.nrPedidoVinculado > 0 then
                  GerarExcelPedidoLocal(DadosValoresPedido.nrPedidoVinculado,
                    idPrecoCusto, idMostraDesconto);
              end;
            end;
              // Bonificando Pedido
             { if _chkBonificaPedido.Checked then
              begin
                nrVerba := StrToIntDef(_edtNrVerba.Text, 0);
                setBonificaPedido(NrPedido, 0, nrVerba);
              end;}
          end;
         end
         else
          SetStatusPedidoGerado('S');

      end;
      _cdsEmpresaPedido.Next;
    end;

    SetEmpresaPedidoInico(_cdsEmpresaPedido);
    until _cdsEmpresaPedido.IsEmpty;
    SetEmpresaPedidoFinal(_cdsEmpresaPedido);
    if  _cdsEmpresaPedido.IsEmpty then
         EncerraPedido(false);
   CorrigeSituacaoCrossdocking;
   CorrigeoPERADORlOGISTICO;

end;

procedure T_frmTelaCompras._btnDadosFornecedorClick(Sender: TObject);
begin
_btnDadosFornecedor.Enabled:=false;
 idCalculaMedia:=true;
 IncioPedido;
_btnDadosFornecedor.Enabled:=true;
end;

procedure T_frmTelaCompras._btnEstoqueClick(Sender: TObject);
begin
    _stbCompras.Panels[1].Text := 'Dados Estoque...';
    _stbCompras.Refresh;

    DadosEstoqueEmpresa(nrFornecedor);

end;

procedure T_frmTelaCompras._cbxEmpresaChange(Sender: TObject);
var
  cdSelecionado: Integer;
begin
  cdSelecionado := StrToIntDef(copy(_cbxEmpresa.Text, 1, 2), 1);
  // CarregaVendaSumarizada(0,cdSelecionado);
  CarregaVendaSumarizada(0, cdSelecionado);
  MontaGraficoGeral(Series5, 0, cdSelecionado);
  MontaGraficoGeralValor(Series7, 0, cdSelecionado);

end;

procedure T_frmTelaCompras._cbxEmpresaExit(Sender: TObject);
begin
  // nrEmpresaSelecionada:=StrToIntDef(copy(_cbxEmpresa.Text,1,2),0);
end;

procedure T_frmTelaCompras._cdsPrePedidoAfterScroll(DataSet: TDataSet);
begin
  if (_dsPrePedido.State in [dsbrowse]) and (_tbsCompras.Visible) and
    (ActiveControl is TDBGrid) then
  begin
     PmovimentoTabelaPedido;
  end;

end;

procedure T_frmTelaCompras._cdsPrePedidoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  idPosicionaProduto := false;
end;

procedure T_frmTelaCompras._chkBonificaPedidoClick(Sender: TObject);
begin
  if _chkBonificaPedido.Checked then
  begin
     _edtNrVerba.Text:=IntToStr(nrVerbaInicio);
     _edtNrVerba.SetFocus;
     _chkBonificaPedido.Checked:=true;
     _edtObservacaoPedido.Text:='Pedido Bonificado';
  end;

end;

procedure T_frmTelaCompras._chkCodigoGamClick(Sender: TObject);
begin
  if _chkCodigoGam.Checked then
    _lbePesquisa.SetFocus;
end;

procedure T_frmTelaCompras._chkDiasEstoqueComPendenciaClick(Sender: TObject);
begin

  _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_COMPRADOR').Visible := false;
  _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_FORNECEDOR').Visible := false;
  _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_COMPRADOR_PEND').Visible := false;
  _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_FORNECEDOR_PEND').Visible := false;
  if _chkDiasEstoqueComPendencia.Checked then
  begin
    _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_FORNECEDOR_PEND').Visible := true;
    _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_COMPRADOR_PEND').Visible := true;
  end
  else
  begin
    _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_COMPRADOR').Visible := true;
    _cdsDiasEstoque.FieldByName('DIAS_ESTOQUE_FORNECEDOR').Visible := true;

  end;

end;

procedure T_frmTelaCompras._chkItensComSugestaoClick(Sender: TObject);
begin
 if _chkItensComSugestao.Checked then
 begin
     _chkItensSemSugestao.Checked:=false;
     _chkItensSemSugestaoSemEstoque.Checked:=false;
     _chkItensCurvaA_B.Checked:=false;
  end;
   FiltraItensSugestao;

end;

procedure T_frmTelaCompras._chkItensCurvaA_BClick(Sender: TObject);
begin
  if _chkItensCurvaA_B.Checked then
  begin
     _chkItensComSugestao.Checked:=False;
     _chkItensSemSugestaoSemEstoque.Checked:=false;
     _chkItensSemSugestao.Checked:=false;

   end;
     FiltraItensSugestao;

end;

procedure T_frmTelaCompras._chkItensSemSugestaoClick(Sender: TObject);
begin
  if _chkItensSemSugestao.Checked then
  begin
     _chkItensComSugestao.Checked:=False;
     _chkItensSemSugestaoSemEstoque.Checked:=false;
     _chkItensCurvaA_B.Checked:=false;

   end;
     FiltraItensSugestao;
end;

procedure T_frmTelaCompras._chkItensSemSugestaoSemEstoqueClick(Sender: TObject);
begin
  if _chkItensSemSugestaoSemEstoque.Checked then
  begin
     _chkItensComSugestao.Checked:=False;
     _chkItensSemSugestao.Checked:=False;
      _chkItensCurvaA_B.Checked:=false;

  end;
     FiltraItensSugestao;

end;

procedure T_frmTelaCompras._chkObservacaoPedidoClick(Sender: TObject);
begin
  if _chkObservacaoPedido.Checked then
  begin
    _edtObservacaoPedido.Visible := true;
    _edtObservacaoPedido.Enabled := true;
    _edtObservacaoPedido.SetFocus
  end
  else
    _edtObservacaoPedido.Enabled := false;

end;

procedure T_frmTelaCompras._chkUltimoDescontoClick(Sender: TObject);
begin
  if _chkUltimoDesconto.Checked then
  begin
    //_lbNrVerbaInicio.Visible := true;
    _edtNrVerbaInicio.Visible := true;
    _edtNrVerbaInicio.SetFocus;

  end;

end;

procedure T_frmTelaCompras._chkUsarUltimoDescontoClick(Sender: TObject);
begin
  if (_chkUsarUltimoDesconto.Checked) and (cdoperadorLogisticoPedido<=1) then
  begin
    _chkMostraUltimoDescontoI.Checked := true;

    _edtNrVerbaDesconto.Text := FormatFloat('00000', GetNumeroVerba(0, nrFornecedorLocal));
    _edtNrVerbaInicio.Text := _edtNrVerbaDesconto.Text;

  end
  else
  begin
    //_chkMostraUltimoDesconto.Checked := false;
    _edtNrVerbaInicio.Clear;
    _edtNrVerbaDesconto.Clear;
  end;

end;

procedure T_frmTelaCompras._dbgEmpresaDblClick(Sender: TObject);
begin
  if _cdsEmpresa.Active then
  begin
    _cdsEmpresa.open;
    _cdsEmpresa.Edit;
    if _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString = 'S' then
      _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString := 'N'
    else
      _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString := 'S';

    dadosEmpresa := SetEmpresaSelecionadas(_cdsEmpresa);
    stEmpresaSelecionada := dadosEmpresa.stEmpresa;
  end;

end;

procedure T_frmTelaCompras._dbgEmpresaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString <> 'S' then
  begin
    if odd(_cdsEmpresa.RecNo) then
    begin
      _dbgEmpresa.Canvas.Font.Color := clBlack;
      _dbgEmpresa.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgEmpresa.Canvas.Font.Color := clBlack;
      _dbgEmpresa.Canvas.Brush.Color := clWhite;
    end;
  end;
  if _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString = 'S' then
  begin
    _dbgEmpresa.Canvas.Font.Color := clWhite;
    _dbgEmpresa.Canvas.Brush.Color := clGreen;
  end;
  _dbgEmpresa.Canvas.fillRect(Rect);
  _dbgEmpresa.defaultDrawColumncell(Rect, DataCol, Column, State);

end;

procedure T_frmTelaCompras._dbgEstoqueEmpresaDrawColumnCell(Sender: TObject;
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

procedure T_frmTelaCompras._dbgEstoquePendenciaDrawColumnCell(Sender: TObject;
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

procedure T_frmTelaCompras._dbgExcessoEstoqueDrawColumnCell(Sender: TObject;
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

procedure T_frmTelaCompras._dbgFiltroPedidoDblClick(Sender: TObject);
var
  dadosFiltroEmpresa: TDadosEmpresa;
begin
  if _cdsEmpresaPedido.Active then
    if _cdsEmpresaPedido.recordCount = 0 then
    begin
      SetEmpresaPedidoFinal(_cdsEmpresaPedido);
      exit;
    end;

  if _cdsEmpresaPedido.Active then
  begin
    if _cdsEmpresaPedido.recordCount > 0 then
    begin
      _cdsEmpresaPedido.Edit;
      if _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString = 'S' then
        _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString := 'N'
      else
        _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString := 'S';

      SetEmpresaPedidoInico(_cdsEmpresaPedido);

      dadosFiltroEmpresa := SetEmpresaPedido(_cdsEmpresaPedido, true);
      stFiltroPedidoEmpresa := dadosFiltroEmpresa.stUF;
      filtroPedido(stFiltroPedidoEmpresa);
      SetEmpresaPedidoFinal(_cdsEmpresaPedido);
    end;
  end;

end;

procedure T_frmTelaCompras._dbgFiltroPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if _cdsEmpresaPedido. active then
  begin
    if odd(_cdsEmpresaPedido.RecNo) then
    begin
      _dbgFiltroPedido.Canvas.Font.Color := clBlack;
      _dbgFiltroPedido.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgFiltroPedido.Canvas.Font.Color := clBlack;
      _dbgFiltroPedido.Canvas.Brush.Color := clWhite;
    end;
  if _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').AsString = 'S' then
  begin
    _dbgFiltroPedido.Canvas.Font.Color := clWhite;
    _dbgFiltroPedido.Canvas.Brush.Color := clGreen;
  end;
  _dbgFiltroPedido.Canvas.fillRect(Rect);
  _dbgFiltroPedido.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._dbgFiltroPedidoTitleClick(Column: TColumn);
begin
//SetEmpresaPedidoFinal(_cdsEmpresaPedido);
_cdsEmpresaPedido.FILTERED:=FALSE;
end;

procedure T_frmTelaCompras._dbgDiasEstoqueDrawColumnCell(Sender: TObject;
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


procedure T_frmTelaCompras._dsProdutoDataChange(Sender: TObject; Field: TField);
begin
 if idCalculaMedia then
    MostraMedia;

end;

procedure T_frmTelaCompras._edtDiasEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  nrDiasDigitado: Integer;
  qtPedidoCalculado: Double;
begin
  case Key of
    VK_RETURN:
      begin
        nrDiasDigitado := StrToIntDef(StringReplace(_edtDiasEstoque.Text, '.', '', [rfReplaceAll]), 0);

        if (trim(_edtDiasEstoque.Text)='') and (vlMediaDiaCD>0) then
        begin
          _edtQtdadePedido.SelectAll;
           _edtQtdadePedido.SetFocus;
           exit;

        end;
        if (nrDiasDigitado <> nrDiasEstoqueComPedido) then
        begin
//          nrDiasEstoqueComPedido:=nrDiasDigitado;
          qtPedidoCalculado := (nrDiasDigitado * vlMediaDiaCD) -
                               ((nrQtdEstoque + DadosPendencia.qtPendente));
          qtPedidoCalculado := SugestaoPossivel(NrEmbalagemCompra,
            qtPedidoCalculado);
          // nrDiasEstoqueComPedido :=  StrToIntDef(FormatFloat('########0', nrDiasDigitado), 0);
          if (qtPedidoCalculado > 0) then
          begin
            _edtQtdadePedido.Text := FormatFloat('########0',qtPedidoCalculado);
            SetCoresCaixaCamadaPalete(strtoint(FormatFloat('########0',qtPedidoCalculado)),
                                      NrEmbalagemCompra,
                                      nrQtdUndCamada,
                                      nrQtdUndPalete);

            _edtQtdadePedido.SelectAll;
            _edtQtdadePedido.SetFocus;
            exit;
          end;
        end;
        if not _chkSemDescontoAdicional.Checked then
        begin
          _lbeDescontoAdicional.SetFocus;
          exit;
        end;
        if (nrDiasDigitado = nrDiasEstoqueComPedido) then
        begin

          GravaItemPedido(NrPedido, nrProduto,nrEmpresaOCD , qtdPedido, pcDescontoAdicional,false);
          AvancaItem;
          _edtQtdadePedido.SetFocus;

        end;

      end;
  end;
end;

procedure T_frmTelaCompras._edtFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  case Key of

    VK_RETURN:
      begin
        NrFornecedor := StrToIntDef(_edtFornecedor.Text, 0);
        nrFornecedorPedido := NrFornecedor;
        if NrFornecedor > 0 then
        begin
          InicializaDadosFornecedor(NrFornecedor);
          nrMaiorValorUnidade := 0;
          nrMaiorValorReais := 0;
          CarregaVendaSumarizada(0, 0);
          CarregaVendaSumarizada(0, 1);
          CarregaVendaSumarizada(0, 4);
          MostraDiasEstoque;
          // _cdsProduto.First;
          MontaGraficoGeral(Series4, 0, 0);
          MontaGraficoGeralValor(Series6, 0, 0);
          MontaGraficoGeral(Series5, 0, 1);
          MontaGraficoGeralValor(Series7, 0, 1);
          _tbsSugestao.TabVisible := true;
          _stbCompras.Panels[1].Text := 'Dados Importados...';

        end;

      end;
  end;

end;

procedure T_frmTelaCompras._edtNrVerbaDescontoExit(Sender: TObject);
begin

   nrVerbaInicio := StrToIntDef(_edtNrVerbaDesconto.Text, 0);


   if nrVerbaInicio>0 then
      nrVerbaInicio:=ValidaVerba(nrVerbaInicio);

  nrGeracaoVerba:=nrVerbaInicio;
  if (nrVerbaInicio = 0) and (_chkUltimoDesconto.Checked) then
  begin
    Mensagem('Digite um nr. de Verba para direcionar o desconto adicional',
      MB_ICONWARNING);
  end;

  _edtNrVerbaInicio.text:=_edtNrVerbaDesconto.Text;
  _edtNrVerba.text:=_edtNrVerbaDesconto.Text;

end;

procedure T_frmTelaCompras._edtNrVerbaDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  nrVerba :Integer;
begin


 case key of
     VK_RETURN: begin
                  nrVerba := StrToIntDef(_edtNrVerbaInicio.Text, 0);

                  nrVerbaInicio:=ValidaVerba(nrVerba);
                end;
 end;





end;

procedure T_frmTelaCompras._edtNrVerbaInicioExit(Sender: TObject);
begin
  nrVerbaInicio := StrToIntDef(_edtNrVerbaInicio.Text, 0);

  nrVerbaInicio := StrToIntDef(_edtNrVerbaInicio.Text, 0);


   if nrVerbaInicio>0 then
      nrVerbaInicio:=ValidaVerba(nrVerbaInicio);

  if (nrVerbaInicio = 0) and (_chkUltimoDesconto.Checked) then
  begin
    Mensagem('Digite um nr. de Verba para direcionar o desconto adicional',
      MB_ICONWARNING);
  end;
end;

procedure T_frmTelaCompras._edtPendenciaMesDblClick(Sender: TObject);
begin
  if StrToIntDef(StringReplace(_edtPendenciaMes.Text, '.', '', [rfReplaceAll]),0) > 0 then
  begin
    // idPosicaoGrade := _cdsProduto.Bookmark;

   // if  _cdsPendenciaItem<>nil then
   // begin
    Application.CreateForm(T_frmPendenciaItem, _frmPendenciaItem);
    _frmPendenciaItem._cdsTemp := TClientDataSet.Create(nil);
    _cdsPendencia.recordCount;
    _frmPendenciaItem._cdsTemp := _cdsPendencia;
    _frmPendenciaItem.DadosPendenciaItem:=DadosPendencia;

    _frmPendenciaItem._cdsPendencia := FiltraPendenciaItem(nrProduto,
      nrEmpresa);

      if _frmPendenciaItem._cdsPendencia<>nil then
      begin

      _frmPendenciaItem._dsPendencia.DataSet := _frmPendenciaItem._cdsPendencia;
      _frmPendenciaItem._cdsPendencia.open;
      _frmPendenciaItem.setGridPendenciaItem;
      end;
    _frmPendenciaItem.Top := 190;
    _frmPendenciaItem.left := 200;
    _frmPendenciaItem.Width := 700;
    _frmPendenciaItem.ShowModal;
    _cdsPendencia.close;
    _cdsPendencia := _frmPendenciaItem._cdsTemp;
    _cdsPendencia.open;
    _cdsPendencia.recordCount;
    _cdsPrePedido.Next;
    _cdsPrePedido.prior;
     MostraMedia;
    _edtQtdadePedido.SetFocus
   // end;

  end;

end;

procedure T_frmTelaCompras._edtQtdadePedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  idTemp:boolean;
  begin
  case Key of
    VK_RETURN:
      begin

        _cdsPrePedido.FieldByName('nroP_Y').ReadOnly:=false;
         nrProduto:=_cdsPrePedido.FieldByName('nrom_y').AsInteger;
         nrEmpresa:=_cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
         nrPedido :=_cdsPrePedido.FieldByName('nroP_Y').AsInteger;
         if nrpedido=0 then
         begin
             NrPedido := PedidoEmpresa[nrEmpresa];

              _cdsPrePedido.edit;
              _cdsPrePedido.FieldByName('nroP_Y').ReadOnly:=false;
             _cdsPrePedido.FieldByName('nroP_Y').AsInteger:= NrPedido;

         end;
         qtdPedido := StrToIntDef(StringReplace(_edtQtdadePedido.Text, '.', '',[rfReplaceAll]), 0);

         GetDadosProduto;




        idTemp:=idCalculaMedia;
        if (qtdPedido>0) then
        BEGIN
            if  not  (validaInclusaodItemPedido(idPedidoCrossDocking,idCrossDocking)) then
            begin
             _edtQtdadePedido.SetFocus;
              exit;
            end;
       


           idCalculaMedia:=false;
           if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([nrProduto, nrEmpresa]), []) then
             sleep(0);


           if  (LiberaCompraItem(_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime,_cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime,true,false,IdVendaAutorizada)=false) then
            begin
             _edtQtdadePedido.SetFocus;
              exit;
             end;
        END;
          _cdsPrePedido.Edit;
          _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := qtdPedido;

        idCalculaMedia:=idTemp;


         SetCoresCaixaCamadaPalete(QtdPedido, NrEmbalagemCompra, nrQtdUndCamada,nrQtdUndPalete);


        if (qtdPedido = 0) and (DadosItemPedidoLog.nrQuantidadePedido > 0) then
        begin
          if Confirma('Deseja Eliminar Item do Pedido ?', MB_DEFBUTTON2)= IDYES then
          begin
            GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido, pcDescontoAdicional,false);
            AvancaItem;

          end;

        end;

        if qtdPedido > 0 then
        begin
          // MostraMedia;
           nrDiasEstoqueComPedido :=CalculaNrDiasEstoque( qtdPedido,
                                                nrQtdEstoque,
                                                DadosPendencia.qtPendente,
                                                 0,
                                                 DadosVendaNova[18].vlMediaMesPrevisao );

          MostraDadosCompraProduto(DadosSugestao.nrQtdSugerida,
                                   nrQtdadeSusgetaoPossivel,
                                   qtdPedido,
                                   nrDiasEstoqueComPedido,
                                   nrVerba);

          _edtDiasEstoque.SetFocus;
          _edtDiasEstoque.SelectAll;

        end;
      end;
  end;
end;

procedure T_frmTelaCompras._gridItemCurvaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsItensCurva <> nil then
  begin
    if _cdsItensCurva.Active then
    begin
      if odd(_cdsItensCurva.RecNo) then
      begin
        _gridItemCurva.Canvas.Font.Color := clBlack;
        _gridItemCurva.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _gridItemCurva.Canvas.Font.Color := clBlack;
        _gridItemCurva.Canvas.Brush.Color := clWhite;
      end;
    end;

    _gridItemCurva.Canvas.fillRect(Rect);
    _gridItemCurva.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._lbeCurvaDblClick(Sender: TObject);
begin
{  if _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString <> 'E' then
  begin
    if ConfirmaIcone('Aviso Marca Produto para Inativacao Futura',
                     'Marcar Produto para Inativar ?', MB_YESNO, MB_ICONQUESTION, 0)= IDYES then
    begin
      if _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'N' then
      begin
        if SetInativacaoFuturaProduto(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger, 'S') then
        begin
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
          _cdsProduto.FieldByName('ID_CURVA').AsString := 'D';
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
          if SetInativacaoFuturaProduto(_cdsProduto.FieldByName('NR_MERCADORIA')        .AsInteger, 'S') then
          begin
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
            /// /
            if SetInativacaoFuturaProduto
              (_cdsProduto.FieldByName('NR_MERCADORIA').AsInteger, 'N') then
            begin
              _cdsProduto.open;
              _cdsProduto.Edit;
              if _cdsProduto.State = dsEdit then
                _cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString := 'N';
              Mensagem('Desmarca??o Efetuada', MB_ICONINFORMATION);
            end
            else
              Mensagem('Erro na marca??o', MB_ICONERROR);
            /// //
          end;
        end;

        exit;
      end;
    end;
  end;}

end;

procedure T_frmTelaCompras._lbeDescontoAdicionalExit(Sender: TObject);
begin
  _lbeSomaDesconto.Caption := FormatFloat('##0.00',pcDescontoPadrao + pcDescontoAdicional);

end;

procedure T_frmTelaCompras._lbeDescontoAdicionalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        pcDescontoAdicional := StrToFloatDef(_lbeDescontoAdicional.Text, 0);
        PrecoItem := CalculaPrecoLiquido(vlPrecoLista,
                                         Mercadoria.vlPrecoVenda,
                                         Mercadoria.pcRepasseCompra,
                                         Mercadoria.pcDescontoPadrao,
                                         pcDescontoAdicional,
                                         Mercadoria.pcCreditoICMS,
                                         Mercadoria.pcIpiProduto,
                                         precoLista.PcIPILista,
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

        _lbeDescontoAdicional.Text := FormatFloat('##0.00', pcDescontoAdicional);
       _lbePrecoCusto.Text := FormatFloat('###,##0.00', PrecoItem.vlPrecoCusto);
       _lbePrecoNota.Text := FormatFloat('###,##0.00', PrecoItem.vlPrecolIquido);
       _lbeValorVerba.Text := FormatFloat('###,##0.00', PrecoItem.vlVerba);

       _lbeUltimoPrecoEntrada.Text:=FormatFloat('###,##0.00',DadosPrecoUltimaentrada.vlFaturadoUltimaEntrada);



        if pcDescontoAdicional > 0 then
        begin
          if (_edtNrVerbaDesconto.Text)<>'' then
             _lbeNumeroVerba.Text:=_edtNrVerbaDesconto.Text;

          _lbeNumeroVerba.SetFocus;
        end;

        if _chkDigitaPrecoNota.Checked then
        begin
          _lbePrecoNota.SetFocus;
          exit;
        end;

        if pcDescontoAdicional = 0 then
        begin
          _cdsPrePedido.Edit;
          _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := qtdPedido;
//          _cdsPrePedido.FieldByName('ABTY_Y').AsFloat :=pcDescontoPadrao;
          _cdsPrePedido.FieldByName('DADY_Y').AsFloat := pcDescontoAdicional;
          _cdsPrePedido.FieldByName('PUNY_Y').AsFloat := PrecoItem.vlPrecolIquido;
          _cdsPrePedido.FieldByName('VT_ITEM').AsFloat := qtdPedido * PrecoItem.vlPrecolIquido;
          _cdsPrePedido.FieldByName('VCCI_Y').AsFLOAT := PrecoItem.vlPrecoCusto;
           TFloatField(_cdsPrePedido.FieldByName('DADY_Y')).DisplayFormat:='##0.00';


          GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido, pcDescontoAdicional,false);
          AvancaItem;
          _edtQtdadePedido.SetFocus;

        end;

      end;
  end;
end;

procedure T_frmTelaCompras._lbeNrPedidoExit(Sender: TObject);

begin
  setPedidoCompra;
end;


procedure T_frmTelaCompras.setPedidoCompra;
var
 StCD:String[1];
begin

  if idPedidoAPI then
  begin
    _lbeNrPedido.Text:=IntToStr(NrPedidoApi);
    _edtFornecedor.Text:=intTostr(nrFornecedorLocal);
     NrFornecedor:=nrFornecedorLocal;
     IncioPedido;
     idPedidoAPI:=false;
  end;
  nrPedidoAlteracao := StrToIntDef(_lbeNrPedido.Text, 0);

  AbrePedidoAlteracao(nrPedidoAlteracao);



  idAtualizaAgendaPedido:=true;

  idPedidoCrossDocking:=false;
  _cdsItemListaPreco:=nil;

  if DadosPedidoAbertuta <> nil then
  begin
    nrListaPrecoExcecao:=DadosPedidoAbertuta.nrListaPrecoExcecao;

    if nrListaPrecoExcecao>0 then
      _cdsItemListaPreco := AbrePrecoListaAtiva(nrListaPrecoExcecao);
      if _cdsItemListaPreco <> nil then
          _cdsItemListaPreco.open;



    if DadosPedidoAbertuta.idPedidoCrossDocking='S' then
       idPedidoCrossDocking:=true
    else
    begin
       _chkCrossDocking.Checked:=false;
    end;
   if DadosPedidoAbertuta.NrFornecedor <> NrFornecedor then
    begin
        Mensagem('Este pedido N?o Corresponde ao Fornecedor do Pedido', 16);
        _lbeNrPedido.SetFocus;
        exit;
    end;


   if not DadosPedidoAbertuta.idPedidoOperacaoRede then
   begin

      _edtFornecedor.Enabled:=false;
      if DadosPedidoAbertuta.nrFornecedor=0 then
      begin
          _lbeNrPedido.SetFocus;
          exit;
      end;

    CarregaParcelamentoPedido(DadosPedidoAbertuta.nrCondicaoPagamento);

    dtPedido:=DadosPedidoAbertuta.dtPedido;
    _dtpPedido.Date:=dtPedido;
    AjustaSelecaoEmpresa(DadosPedidoAbertuta.cdEmpresaDestino);
    dadosEmpresa := SetEmpresaSelecionadas(_cdsEmpresa);
    _dbgEmpresa.Repaint;
    // _cdsEmpresa.Refresh;
    _dbgEmpresa.Enabled := false;

     if nrPedidoAlteracao>0 then
     begin
        idAtualizaDesconto:=false;
       idAtualizaAgendaPedido:=false;

     end;

     StCD:= inttostr(DadosPedidoAbertuta.cdEmpresaDestino);
     cdoperadorLogisticoPedido:=DadosPedidoAbertuta.nrOperadorLogistico;
     cdOperadorLogisticoLocal:=cdoperadorLogisticoPedido;
     nrVerba :=DadosPedidoAbertuta.nrVerba;
     _edtNrVerbaDesconto.Text:= IntToStr(nrVerba);
     _edtNrVerbaInicio.Text:= IntToStr(nrVerba);
     _edtNrVerba.text:=_edtNrVerbaDesconto.Text;

     if nrVerba=0 then
     begin
      _edtNrVerbaDesconto.Text:= IntToStr(DadosPedidoAbertuta.nrGeracaoVerba);
      _edtNrVerbaInicio.Text:= IntToStr(DadosPedidoAbertuta.nrGeracaoVerba);
      _edtNrVerba.text:=_edtNrVerbaDesconto.Text;



     end;



     nmModuloPedido:='Alt.Ped.:'+FormatFloat('000000',nrPedidoAlteracao);
     _btnDadosFornecedor.Click;
     _btnGeraPedido.Enabled:=false;
     _btnGeraPedidoExcecao.Enabled:=false;
     stPedidos := inttostr(nrPedidoAlteracao);
     nrPedido:=nrPedidoAlteracao;
    PedidoEmpresa[DadosPedidoAbertuta.cdEmpresaDestino] := NrPedido;


     _tbsCompras.TabVisible := true;
     _pgcCompras.ActivePage:=_tbsCompras;

     idforcaCross:=0;
     if _chkCrossDocking.Checked then
        idforcaCross:=1;

      AbreItemPrePedidoMultiEmpresaNova(NrFornecedor,idforcaCross,stPedidos,StCD);

  {        AbreItemPrePedidoMultiEmpresa(stPedidos, // :String;
        0, // PnrMercadoria,
        nrEmpresa, // PcdEmpresa: Integer;
        ''); // PidSituacao: String): Boolean;}
    _pgcCompras.ActivePage:=_tbsCompras;

    _cdsPrePedido.First;
     nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
     nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;

     SetgraficoVenda;
    _tbsConfirma.TabVisible:=true;
    TotalizaPedidoMultiEmpresa(stPedidos, 0, '');

      if DadosPedidoAbertuta.idPedidoBonificado then
      begin
         _chkBonificaPedido.Checked:=true;
         idBonificado:=true;
       ///  FRecalculaCusto(DadosPedidoAbertuta.nrPedido);
      end;


    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA', VarArrayOf([nrProduto, nrEmpresa]), []) then
      SLEEP(0);
      _edtQtdadePedido.SetFocus;
  end;



  end;

end;

procedure T_frmTelaCompras._lbeNrPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure T_frmTelaCompras._lbeNumeroVerbaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      Begin
        nrVerba := 0;
        if cdoperadorLogisticoPedido<=1 then
        begin

            if trim(_lbeNumeroVerba.Text) <> '' then
              nrVerba := StrToIntDef(_lbeNumeroVerba.Text, 0);
            if nrVerba>0 then
            begin

              nrVerba :=GetNumeroVerba(nrVerba, nrFornecedorPedido);
              if nrVerba=0 then
              begin
                  mensagem('Verba N?o Localizada!!!',MB_ICONWARNING);
                 _lbeNumeroVerba.SelectAll;
                 _lbeNumeroVerba.SetFocus;
                 exit;
              end;
            end;
        end;



        if trim(_lbeNumeroVerba.Text) = '0' then
        begin
          GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido,
            pcDescontoAdicional,false);

          _cdsPrePedido.Edit;
          _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := qtdPedido;
//          _cdsPrePedido.FieldByName('ABTY_Y').AsFloat :=pcDescontoPadrao;
          _cdsPrePedido.FieldByName('DADY_Y').AsFloat := pcDescontoAdicional;
          _cdsPrePedido.FieldByName('PUNY_Y').AsFloat := PrecoItem.vlPrecolIquido;
          _cdsPrePedido.FieldByName('VT_ITEM').AsFloat := qtdPedido *      PrecoItem.vlPrecolIquido;
          _cdsPrePedido.FieldByName('VCCI_Y').AsFLOAT := PrecoItem.vlPrecoCusto;

           pcDescontoAdicional := 0;
           if not _chkFixaDescontoAdicional.Checked then
                 _lbeDescontoAdicional.Text := '0,00';

          AvancaItem;

          _edtQtdadePedido.SetFocus;
          exit;

        end;

        if trim(_lbeNumeroVerba.Text) = '' then
        begin
          Application.CreateForm(T_frmRelatorioVerba, _frmRelatorioVerba);
          nrCompradorVerba := nrCompradorPedido;
          nrVerba := 0;
          nrLaboratorioVerba := Mercadoria.nrLaboratorio;
          _frmRelatorioVerba.ShowModal;
          _lbeNumeroVerba.Text := IntToStr(nrVerbaGrid);
          nrVerba := StrToIntDef(_lbeNumeroVerba.Text, 0);
          if (nrVerba > 0) and (nrGeracaoVerba <> nrVerba) and
            (nrGeracaoVerba > 0) then
          begin
            Mensagem('Nr. Verba definida para este Pedido ? ' +
              FormatFloat('####0', nrGeracaoVerba), 16);
            nrVerba := nrGeracaoVerba;
          end;
          _frmRelatorioVerba.Free;

        end;
        if (nrVerba > 0) and (nrGeracaoVerba <> nrVerba) and
          (nrGeracaoVerba > 0) then
        begin
          Mensagem('Nr. Verba definida para este Pedido ? ' +
            FormatFloat('####0', nrGeracaoVerba), 16);
          nrVerba := nrGeracaoVerba;
          _lbeNumeroVerba.Text := IntToStr(nrGeracaoVerba);
        end;
        if (nrVerba > 0) then
        begin
          if _chkPcParaVerbaGrid.Checked then
            _lbePcVerba.SetFocus
          else
          begin
            // MostraDaDosCalculoGrid;
            _lbePcVerba.Text := '100,00';
            pcVerba := 100;
            GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido,pcDescontoAdicional,false);
             _cdsPrePedido.edit;
            _cdsPrePedido.FieldByName('PC_VERBA').AsFLOAT:=PCVERBA;
            _cdsPrePedido.FieldByName('NRVV_Y').AsInteger:=nrVerba;
            _cdsPrePedido.FieldByName('vl_verba').AsFloat:=vlVerba*qtdPedido;

            //_cdsPrePedido.Next;

            nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
            nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
            pcDescontoAdicional := 0;
            //_lbeDescontoAdicional.Text := '0,00';
             AvancaItem;
            _edtQtdadePedido.SetFocus;

            // InsereItenPeloNrVerba;
          end;
        end;
      End;
  End;

end;

procedure T_frmTelaCompras._lbePcVerbaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if nrVerba > 0 then
          pcVerba := StrToFloatDef(_lbePcVerba.Text, 0);

        GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido,pcDescontoAdicional,false);
        _cdsPrePedido.Next;
        nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
        nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
        pcDescontoAdicional := 0;
       // _lbeDescontoAdicional.Text := '0,00';
        if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
          VarArrayOf([nrProduto, nrEmpresa]), []) then
          SLEEP(0);

        _edtQtdadePedido.SetFocus;

      end;
  end;
end;

procedure T_frmTelaCompras._lbePesquisaChange(Sender: TObject);
var

  vlErro, cd: Integer;
begin
  val(_lbePesquisa.Text, cd, vlErro);
  if (vlErro > 0) and (not _chkCodigoFornecedor.Checked) then
    _cdsPrePedido.Locate('NM_MERCADORIA', _lbePesquisa.Text, [loPartialKey]);
  if (_chkCodigoFornecedor.Checked) then
  begin
    _cdsPrePedido.Locate('CD_INTERNO_LABORATORIO', _lbePesquisa.Text,
      [loPartialKey]);


     nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
     nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
            if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
              VarArrayOf([nrProduto, nrEmpresa]), []) then
              SLEEP(0);
            MostraMedia;
  end;


end;

procedure T_frmTelaCompras._lbePesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vlErro, cd: Integer;
begin
  case Key of
    VK_RETURN:
      begin
        _stbCompras.Panels[1].Text := '';
        val(_lbePesquisa.Text, cd, vlErro);
        if (vlErro > 0) and (not _chkCodigoFornecedor.Checked) then
        begin
          if not _cdsPrePedido.Locate('NM_MERCADORIA', _lbePesquisa.Text,
            [loPartialKey]) then

            _stbCompras.Panels[1].Text := 'Sem registro com essa descri??o...'
          else
          begin
            nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
            nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
            PmovimentoTabelaPedido;

            _edtQtdadePedido.SetFocus;
          end;
        end;

        if (_chkCodigoFornecedor.Checked) then
        begin
          if not _cdsPrePedido.Locate('CD_INTERNO_LABORATORIO',
            _lbePesquisa.Text, [loPartialKey]) then
            _stbCompras.Panels[1].Text :=
              'Sem registro com esse Codigo Fornecedor...'
          else
            _edtQtdadePedido.SetFocus;
        end;
        if (_chkCodigoGam.Checked) then
        begin
          if not _cdsPrePedido.Locate('CD_PRODUTO', _lbePesquisa.Text, []) then
            _stbCompras.Panels[1].Text := 'Sem registro com esse Codigo GAM...'
          else
          begin
              nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
              nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
             // SetgraficoVenda;
            PmovimentoTabelaPedido;

            _edtQtdadePedido.SetFocus;
          end;
        end;

      end;
  end;
end;

procedure T_frmTelaCompras._lbePrecoNotaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vlNota: Double;
begin
  case Key of
    VK_RETURN:
      begin
        vlNota := StrToFloatDef(_lbePrecoNota.Text, 0);
        pcDescontoAdicional := CalculaDescontoAdicional(vlPrecoLista, vlNota,
        pcDescontoRepasse, pcDescontoPadrao);


        PrecoItem := CalculaPrecoLiquido(vlPrecoLista,
                                         Mercadoria.vlPrecoVenda,
                                         Mercadoria.pcRepasseCompra,
                                         Mercadoria.pcDescontoPadrao,
                                         pcDescontoAdicional,
                                         Mercadoria.pcCreditoICMS,
                                         Mercadoria.pcIpiProduto,
                                         precoLista.PcIPILista,
          precoLista.pcReajustePreco, 1,

          precoLista.nrListaPreco, 'N', Mercadoria.idForcaRepasse,
          Mercadoria.idIpiLiquidoComRepasse, Mercadoria.idIpiLiquidoSemRepasse,
          Mercadoria.idIpiBrutoComRepasse, Mercadoria.idIpiBrutoSemRepasse,
          Mercadoria.idTipoListaFiscal, DadosFornecedor.idUnidadeFederacao,
          Mercadoria.idSuperfulo, Mercadoria.idIcmDestacado,
          Mercadoria.idReduzIcms, Mercadoria.idPisCofins);


        if pcDescontoAdicional = 0 then
        begin
          GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido, pcDescontoAdicional,false);
          AvancaItem;
          _edtQtdadePedido.SetFocus;

        end;
        if pcDescontoAdicional > 0 then
        begin
            _lbeDescontoAdicional.Text :=       FormatFloat('##0.00', pcDescontoAdicional);
        if pcDescontoAdicional > 0 then
          _lbeNumeroVerba.SetFocus;
        end;




      end;

  end;
end;

procedure T_frmTelaCompras._mmAlertaRecallClick(Sender: TObject);
begin
  _pnRestricao.Visible := false;
  Timer1.Enabled := false;
  // Series1.Active := true;

end;

procedure T_frmTelaCompras._pgcComprasChange(Sender: TObject);
begin
  if _pgcCompras.ActivePage = _tbsCompras then
  begin
    if _edtQtdadePedido.CanFocus then
      _edtQtdadePedido.SetFocus;

    if not _cdsPrePedido.eof then
    begin
      if not _cdsPrePedido.eof then
        PosicionaItemPedido(nrProduto, nrEmpresa);

    end;

  end;
  if _pgcCompras.ActivePage = _tbsConfirma then
  begin


    //  SetEmpresaPedidoFinal(_cdsEmpresaPedido);
//      FiltroPedidoNaoFechados
   //   if _cdsEmpresaPedido.IsEmpty then
     CarregaEmpresaPedido;
     AbreItemPedidoMultiEmpresa(stPedidos, 0, 0, '');
     setNumeroOperador(NrFornecedor,cdoperadorLogisticoPedido);
     filtroPedido('');

    end;


end;


Function T_frmTelaCompras.AbreVendaLaboratorioMultiEmpresaAtual(PnrLaboratorio,PnrEmpresa, PnrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

      with stQry do
      begin
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('VENDA.CD_MERCADORIA,');
        Add('VENDA.CD_EMPRESA,');
        add('CASE');
        add('when QT_PREVISAO<> -9999  then nvl(round(SUM(QT_PREVISAO)/30,4),0)');
        add('else nvl(QT_MEDIA_VENDA_DIARIA,0)');
        add('end QT_MEDIA_VENDA_DIARIA,');

        Add('CD_CANAL,CD_OPERADOR_LOGISTICO,');
        Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) ANO,');
        Add('EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) as MES,');
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(nvl(QT_MEDIA_VENDA_DIARIA,0)) VL_MEDIA,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('max(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(NVL(VT_CMV,0)) AS VT_CUSTO_MEDIO,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO');
        // if PnrOperadorLogistico>1 then
        Add(',venda.CD_OPERADOR_LOGISTICO,');

        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) THEN   EXTRACT(DAY FROM Last_Day(DT_VENDA_MERCADORIA))');
        Add('ELSE EXTRACT(DAY FROM Trunc(SYSDATE)-1)');
        Add('END nr_dias,');
        Add('SUM(QT_DESVIOPADRAO_VENDA_DIARIA) AS QT_DESVIOPADRAO_VENDA_DIARIA,');
        Add('SUM(nvl(QT_PREVISAO_DEMANDA,0)) AS QT_PREVISAO_DEMANDA,');
        Add('SUM(QT_DIAS_VENDA) as QT_DIAS_VENDA');

        Add(' FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
        add(',(SELECT');
        add('COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
        add('CASE');
        add(' when  QT_PREVISAO>0 then QT_PREVISAO');
        add(' when  QT_PREVISAO<=0 then 0');
        add(' when QT_PREVISAO is null then -9999');
        add('END QT_PREVISAO,');
        add('Nvl(DT_PREVISAO ,TRUNC(sysdate,''MONTH'')) AS DT_PREVISAO');
        add('FROM');
        add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        add('GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
        Add('WHERE');
        Add('    PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
        Add('AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
        Add('AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
        Add('AND DT_PREVISAO(+)=TRUNC(sysdate,''MONTH'')) PREVISAO_NOVA,');




        Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
        Add('PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');

        Add('AND OL_FORNECEDOR.CD_OPERADOR(+)= VENDA.CD_OPERADOR_LOGISTICO');
        Add('AND OL_FORNECEDOR.CD_FORNECEDOR(+)=:PnrFornecedor');
         Add('AND COMPRA.CD_MERCADORIA=PREVISAO_NOVA.CD_MERCADORIA(+)');
        Add('AND COMPRA.CD_EMPRESA=PREVISAO_NOVA.CD_EMPRESA(+)');


        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');


        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('and ((VENDA.CD_CANAL=0) or (VENDA.CD_OPERADOR_LOGISTICO>1))');
        Add('AND (COMPRA.CD_MERCADORIA,compra.cd_empresa) NOT IN');
        Add('(SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
        Add('                      WHERE id_exclusivo_operacao_rede=''S''');
        Add('                       AND id_situacao=''A'' AND cd_operacao_rede=6 )');


        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-17)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');

        Add('GROUP BY VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,DT_VENDA_MERCADORIA,QT_PREVISAO');
        Add(',QT_MEDIA_VENDA_DIARIA,CD_CANAL,CD_OPERADOR_LOGISTICO,COMPRA.CD_GRUPO_FORNECEDOR');

        Add(',venda.CD_OPERADOR_LOGISTICO');
      end;

      stQry.SaveToFile('c:\temp\Compras_qryVendaFornecedor.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').Asbcd := PnrLaboratorio;
        open;
      end;
      Result := nil;
      if not _cdsTemp.IsEmpty then
        Result := _cdsTemp;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;



Function T_frmTelaCompras.VendaSumarizadaLaboratorioMultiEmpresaAtual(PnrLaboratorio, PnrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    try

      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

      with stQry do
      begin
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        // Add('VENDA.CD_MERCADORIA,');
        Add('VENDA.CD_EMPRESA,');
        Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) ANO,');
        Add('CASE');
        Add(' WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
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
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_MEDIA_VENDA_DIARIA) VL_MEDIA,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('max(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(NVL(VT_CMV,0)) AS VT_CMV,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO,');
        if PnrOperadorLogistico > 1 then
          Add(',venda.CD_OPERADOR_LOGISTICO,');

        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) THEN   EXTRACT(DAY FROM Last_Day(DT_VENDA_MERCADORIA))');
        Add('ELSE EXTRACT(DAY FROM Trunc(SYSDATE)-1)');
        Add('END nr_dias  ');

        Add(' FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add(' AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
        Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-17)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Add('GROUP BY VENDA.CD_EMPRESA,DT_VENDA_MERCADORIA');
        if PnrOperadorLogistico > 1 then
          Add(',venda.CD_OPERADOR_LOGISTICO');

        Add('UNION ALL');
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        // Add('VENDA.CD_MERCADORIA,');
        Add('0 AS CD_EMPRESA,');
        Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) ANO,');
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
        Add('    SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_MEDIA_VENDA_DIARIA) VL_MEDIA,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('max(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(NVL(VT_CMV,0)) AS VT_CUSTO_MEDIO,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO,');
        if PnrOperadorLogistico > 1 then
          Add(',venda.CD_OPERADOR_LOGISTICO,');

        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) THEN   EXTRACT(DAY FROM Last_Day(DT_VENDA_MERCADORIA))');
        Add('ELSE EXTRACT(DAY FROM Trunc(SYSDATE)-1)');
        Add('END nr_dias  ');

        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add('AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
        Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
        Add('AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
        Add('AND (COMPRA.CD_MERCADORIA,COMPRA.CD_empresa) NOT IN');
        Add('(SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
        Add('                      WHERE id_exclusivo_operacao_rede=''S''');
        Add('                       AND id_situacao=''A'')');



        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-17)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Add('GROUP BY DT_VENDA_MERCADORIA');
        if PnrOperadorLogistico > 1 then
          Add(',venda.CD_OPERADOR_LOGISTICO');

        Add(' --,VENDA.CD_OPERADOR_LOGISTICO');
        // Add('ORDER BY ,ANO,MES,PRESA');
      end;

      stQry.SaveToFile('c:\temp\qryVendaSumarizadaFornecedorNovo.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        Params.ParamByName('PnrFornecedor').AsBcd := PnrLaboratorio;
        open;
      end;
      Result := nil;
      if not _cdsTemp.IsEmpty then
        Result := _cdsTemp;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

{procedure T_frmTelaCompras._btnInativacaoClick(Sender: TObject);
begin
   if FormatDateTime('dd/mm/yyyy',dtInativacaoFutura)='01/01/2039' then
   begin
     if ConfirmaIcone('Aviso Marca Produto para Inativacao Futura',
                    'Marcar Produto para Inativar ?', MB_YESNO, MB_ICONQUESTION, 0)= IDYES then

     begin
        if SetInativacaoFuturaProduto(nrProduto,nrEmpresa, dtSistema) then
        begin
            idTipoMotivo:='IF';
            nrProdutoObservacao:=nrProduto;
           Application.CreateForm(T_frmMotivoInativacaoBloqueio, _frmMotivoInativacaoBloqueio);
           _frmMotivoInativacaoBloqueio.ShowModal;
          _cdsProduto.Edit;
          if _cdsProduto.State = dsEdit then
            _cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime :=dtSistema;
             Mensagem('Marca??o Efetuada', MB_ICONINFORMATION);

        end
        else
          Mensagem('Erro na marca??o', MB_ICONERROR);
      end;
      exit;
    end;
   if FormatDateTime('dd/mm/yyyy',dtInativacaoFutura)<>'01/01/2039' then
   begin
     if ConfirmaIcone('Produto J? esta Marcado para Inativacao Futura',
                      'Deseja Desmarcar Produto para Inativar ?', MB_YESNO, MB_ICONQUESTION, 0)= IDYES then

     begin
        if SetInativacaoFuturaProduto(nrProduto,nrEmpresa, strtodate('01/01/2039')) then
        begin
          _cdsProduto.Edit;
          if _cdsProduto.State = dsEdit then
            _cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime :=strtodate('01/01/2039');
             Mensagem('Marca??o Efetuada', MB_ICONINFORMATION);
        end
        else
          Mensagem('Erro na marca??o', MB_ICONERROR);
      end;
      exit;
    end;


end;}

procedure T_frmTelaCompras._btnFechaCancelaClick(Sender: TObject);
begin



  if Confirma('Deseja Realmente Cancelar Pedidos', MB_DEFBUTTON2) = IDYES then
     EncerraPedido(true);
end;

procedure T_frmTelaCompras._btInativacaoFuturaIIClick(Sender: TObject);
begin

           idTipoMotivo:='IF';
           nrProdutoObservacao:=nrProduto;
           NrPedidoObservacao :=nrpedido;
           Application.CreateForm(T_frmMotivoInativacaoBloqueio, _frmMotivoInativacaoBloqueio);
           _frmMotivoInativacaoBloqueio.ShowModal;
           _cdsInativaBloqueio:= _frmMotivoInativacaoBloqueio._cdsProdutosInativaBloqueia ;
           if _cdsInativaBloqueio<>nil then
           begin
             if _cdsInativaBloqueio.Active then
             begin
               /// _cdsInativaBloqueio.Open;
                _cdsInativaBloqueio.recordcount;
               if not _cdsInativaBloqueio.IsEmpty then
                  setDataInativacaoFuturaBloqueioProduto;


             end;


           end;


end;

procedure T_frmTelaCompras.BitBtn1Click(Sender: TObject);
begin
    _stbCompras.Panels[1].Text := 'Dados Excesso de Estoque...';
    _stbCompras.Refresh;
    DadosExcessoEstoque(nrFornecedor);

end;

procedure T_frmTelaCompras.BitBtn2Click(Sender: TObject);
begin
    _stbCompras.Panels[1].Text := 'Dados Pendencia...';
    _stbCompras.Refresh;
    DadosEstoquePendente(nrFornecedor);

end;

procedure T_frmTelaCompras.BitBtn3Click(Sender: TObject);
begin
    _stbCompras.Panels[1].Text := 'Dados Venda Mes...';
    _stbCompras.Refresh;
     DadosVendaMes(nrFornecedor);

end;

procedure T_frmTelaCompras.Bitbtn4Click(Sender: TObject);
begin
  if Series2.Visible then
  begin
    _cdsEstoqueDiario := PosicaoEstoqueDiario(nrProduto, nrEmpresa);

    if _cdsEstoqueDiario <> nil then
    begin
      Chart1.View3D := false;
      // Series1.Visible := false;
      Series2.Visible := false;
      Series3.Visible := true;
      Series8.Visible := true;
      Series9.Visible := true;
      Series10.Visible := true;
      Series11.Visible := true;
      Series3.Title := 'Est.Seguran?a';
      Series8.Title := 'Est.M?ximo';
      montaGraficoEstoqueDiario;
    end;

  end
  else
  begin
    Chart1.View3D := true;
    MostraMedia;
    // Series1.Visible := true;
    Series2.Visible := true;
    Series3.Visible := false;
    Series8.Visible := false;
    Series9.Visible := false;
    Series10.Visible := false;
    Series11.Visible := false;
  end;

end;

procedure T_frmTelaCompras.BitBtn5Click(Sender: TObject);
begin
    _stbCompras.Panels[1].Text := 'Dados Venda Sumarizada Fornecedor...';
    _stbCompras.Refresh;
    _cdsVendaSumarizada := VendaSumarizadaLaboratorioMultiEmpresaAtual(nrFornecedor, 0);
    if (_cdsVendaSumarizada <> nil) then
    begin
      _cdsVendaSumarizada.open;
      if not _cdsVendaSumarizada.IsEmpty then
        _cdsVendaSumarizada.IndexFieldNames := 'ANO;MES;CD_EMPRESA';
    end;
      AbreDadosFornecedor(NrFornecedor, stEmpresaSelecionada);

    CarregaVendaSumarizada(0, 0);
    CarregaVendaSumarizada(0, 1);
    CarregaVendaSumarizada(0, 4);
    MostraDiasEstoque;
    // _cdsProduto.First;
    MontaGraficoGeral(Series4, 0, 0);
    MontaGraficoGeralValor(Series6, 0, 0);
    MontaGraficoGeral(Series5, 0, 1);
    MontaGraficoGeralValor(Series7, 0, 1);


    _stbCompras.Panels[1].Text := 'Dados  Fornecedor...';
    _stbCompras.Refresh;

end;

procedure T_frmTelaCompras._btnSugestaoClick(Sender: TObject);
begin
    _stbCompras.Panels[1].Text := 'Dados Sugest?o de Compra...';
   _stbCompras.Refresh;
   DadosSugestaoCompra(nrFornecedor);

end;

procedure T_frmTelaCompras._btnGeraPedidoExcecaoClick(Sender: TObject);
begin
      if confirma('Esse pedido n?o gera pedido automatico, apenas sugere'+#13+
              ' e n?o altera as data de agenda do pr?ximo pedido.'+#13+
              'Gerar pedido Exce??o?',MB_DEFBUTTON2)=idYes then
        begin
         idAtualizaAgendaPedido:=false;
         TipoPedido:='EXCECAO';
         PedidoNovo(true);

        end;



end;

procedure T_frmTelaCompras._btnGeraPedidoClick(Sender: TObject);
begin
    idAtualizaAgendaPedido:=TRUE;
    TipoPedido:='REPOSICAO';


  PedidoNovo(false);
end;

procedure T_frmTelaCompras.MontaGrafico(PGrafico: TBarSeries;
  PnrProduto, PnrEmpresa: Integer);
var
  _qtVenda: Integer;
  I, nrMaiorValor: Integer;
  Ano, mes: Word;
  data: Tdate;
  stMes: String;
  corBarra: TColor;

begin
  _dtpData.Date := Date;
  PGrafico.Clear;
  Application.ProcessMessages;
  mes := MonthOf(_dtpData.Date);
  data := _dtpData.Date - mes + 1;
  Ano := YearOf(IncMonth(Date, -mes));
  nrMaiorValor := 0;

  for I := mes to 12 do
  begin
    stMes := UpperCase(ShortMonthNames[I]);
    nrQtadade := VendaAnual[PnrEmpresa, I];

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;
    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    PGrafico.Add(nrQtadade, stMes, corBarra);
    if nrQtadade > nrMaiorValor then
      nrMaiorValor := nrQtadade;

  end;
  for I := 1 to mes - 1 do
  begin

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;

    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    nrQtadade := VendaAnual[PnrEmpresa, I];
    stMes := UpperCase(ShortMonthNames[I]);
    PGrafico.Add(nrQtadade, stMes, corBarra);
    if nrQtadade > nrMaiorValor then
      nrMaiorValor := nrQtadade;
  end;
  corBarra := clWhite;
  if PnrEmpresa = 1 then
    corBarra := clTeal;
  if PnrEmpresa = 4 then
    corBarra := $000080FF;

  // MUDAR COR CONFORME MES SELECIONADO
  if idMesSelecionado[13] = 'S' then
    corBarra := clSkyBlue;
  nrQtadade := VendaAnual[PnrEmpresa, 13];
  stMes := 'ATUAL';
  PGrafico.Add(nrQtadade, stMes, corBarra);
  if nrQtadade > nrMaiorValor then
    nrMaiorValor := nrQtadade;
  Chart1.LeftAxis.SetMinMax(0, nrMaiorValor * 1.35);

  { _cdsVendaFornecedor.First;
    while _cdsVendaFornecedor.Eof do
    begin

    PGrafico.Add()
    _cdsVendaFornecedor.Next;
    end; }

end;


procedure T_frmTelaCompras.MostraMedia;
var
  dtFormatada: String[10];
  mesPesquisa: Integer;
  mes, Dia, Ano: Word;
  stAlertaRestricao: String;
  DadosSugestaoCamadaPalete: TDadosSugestaoCamadaPalete;
  dtBloqueio:tdate;

begin
  DecodeDate(Date, Ano, mes, Dia);

  dtFormatada := FormatDateTime('01/mm/yyyy', Date);
  Timer1.Enabled := false;
  ZeraVendaAnual;
  NrDiasEstoque := 0;
  idPosicionaProduto := false;
//  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
//  nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

  // Oculta Painel Alerta Recall
   _pnRestricao.Visible := false;


  //MontaGraficoNovo(nrProduto,nrEmpresa,0);

{  Mercadoria := DadosProdutos(nrProduto, nrEmpresa, cdoperadorLogisticoPedido);

  nrQtdEstoque := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  idTermoLabil := _cdsProduto.FieldByName('ID_REFRIGERADO').AsString;
  idCurva      := _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1];
  NrEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;

  idCrossDocking    :=_cdsProduto.FieldByName('ID_CROSSDOCKING').AsString;

  nrQtdCaixa     := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
  nrQtdCxCamada  := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  nrQtdCxPalete  := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
  nrQtdUndCamada := nrQtdCxCamada * NrEmbalagemCompra;
  nrQtdUndPalete := nrQtdCxPalete * NrEmbalagemCompra;
  nrGeracaoVerba := _cdsProduto.FieldByName('NR_VERBA_GERACAO').AsInteger;
  pcGeracaoVerba := _cdsProduto.FieldByName('PC_VERBA_GERACAO').AsFloat;
  pcCreditoICMS  := _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat;

  nrQtdVencido   := _cdsProduto.FieldByName('QT_VENCIDO').AsInteger;
  nrQtdAvariada  := _cdsProduto.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger;
  nrQtdReservada := _cdsProduto.FieldByName('QT_RESERVADO').AsInteger;
  pcDescontoRepasse := 0;

  nmProduto := _cdsProduto.FieldByName('NM_MERCADORIA').AsString + '  ' +
               _cdsProduto.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString;

  dtInativacaoFutura:= _cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime;
  dtBloqueiodeCompra:= _cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime;
  IdVendaAutorizada := true;
  if _cdsProduto.FieldByName('ID_VENDA_AUTORIZADA').AsString='N' then
     IdVendaAutorizada :=false;





_lbeCurva.Caption := 'Curva = ' + idCurva;

  vlPrecoLista     := _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat;
  pcDescontoPadrao := _cdsProduto.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;

  if cdoperadorLogisticoPedido>1 then
     pcDescontoPadrao := _cdsProduto.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;//  LocalizaDescontoOPerador(nrProduto,nrEmpresa); conforma SS 31945


//   Mercadoria        := DadosProdutos(nrProduto,nrEmpresa,cdoperadorLogisticoPedido);

  NrPedido     := PedidoEmpresa[nrEmpresa];
  NrAuditoria  := AuditoriaEmpresa[nrEmpresa];

  idprecoAtual := 'S';
  idBloqueiaPedido := 0;
  // if _cbListaPrecoLocal.ItemIndex = 1 then
  // idprecoAtual := 'N';

  nrEmpresaOCD     :=nrEmpresa;
  nrSomaLeadTimeOCD:=0;








  precoLista := GetPrecoItem(nrProduto,
                             nrEmpresaOCD,
                             vlPrecoLista,
                             1,
                             idprecoAtual,
                             idBloqueiaPedido,
                             nrListaPrecoExcecao); { ,nrListaPreco };
{  vlPrecoLista := precoLista.vlPrecoBase;


  if _cdsPrePedido.active then
     pcDescontoAdicional := _cdsPrePedido.FieldByName('DADY_Y').AsFloat;
  if (_chkUltimoDesconto.Checked) then
  begin
    pcDescontoAdicional := getUltimoDesconto(_cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger, nrProduto,
                                             nrEmpresa, cdoperadorLogisticoPedido);
  end;

  PrecoItem := CalculaPrecoLiquido( vlPrecoLista,
                                   Mercadoria.vlPrecoVenda,
                                   Mercadoria.pcRepasseCompra,
                                   Mercadoria.pcDescontoPadrao,
                                   pcDescontoAdicional,
                                   precoLista.PcIcmsCompra,
                                   Mercadoria.pcIpiProduto,
                                   precoLista.PcIPILista,
                                   precoLista.pcReajustePreco,
                                   1,

                                   precoLista.nrListaPreco,
                                   'N', Mercadoria.idForcaRepasse,
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

  Chart1.Title.Text[0] := _cdsProduto.FieldByName('CD_PRODUTO').AsString + ' - '
    + nmProduto;

  FiltraVenda(nrProduto, nrEmpresa, 0);
  Series2.Clear;
  mesPesquisa:=13;
  if dia=1 then
     mesPesquisa:=mes-1;
  vlVendaCd := VendaAnual[nrEmpresa, mesPesquisa];
  Series2.Title := 'CD - ' + _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;
//    MontaGrafico(Series2, nrProduto, nrEmpresa);
  DadosMedia := CalculaMedia(nrEmpresa);

  stCalculo := DadosMedia.stCalculoNovo;

  // stCalculo:=DadosMedia.stCalculo;

  vlMediaMesCD := DadosMedia.vlMediaMesNova;
  vlMediaDiaCD := DadosMedia.vlMediaDiaNova;

  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);

  DadosLeadTime := SetLeadTime(nrEmpresa,idTermoLabil);
  nrLeadTime    := DadosLeadTime.vlLeadTime+nrSomaLeadTimeOCD;

  SetCorPendencia(DadosPendencia.QtPedido,
                  DadosPendencia.qtPendente,
                  DadosPendencia.qtAtendida,
                  DadosPendencia.qtProcessada,
                  DadosPendencia.qtTransito);

  DadosEstoqueCompra := setParamentroItemCurvaCompra(nrEmpresa,
                                                     NrDiasEstoque, // PnrDiasEstoque: Integer;
                                                     idCurva[1]); // : Char):TDadosEstoqueCurva;

  NrDiasEstoquePedido     := DadosEstoqueCompra.nrEstoqueMaximo;
  NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);
  if NrDiasEstoqueComprador > 0 then
    NrDiasEstoquePedido := NrDiasEstoqueComprador;


  if nrLeadTime<=0 then
     nrLeadTime:=DadosFornecedor.nrDiasLeadTime;



  DadosSugestao := CalculoSugestaoIdealNova(nrEmpresa, // PnrEmpresa:Integer;
                                            DadosEstoqueCompra.nrFrequenciaCompra, // PvlPE,
                                            0, // PnrDiasAjuste,
                                            nrLeadTime, // DadosFornecedor.nrDiasLeadTime,//     PLeadTimeCalculo,
                                            DadosMedia.vlMediaDiaNova, // PvlMediaDiaria: Double;
                                            nrQtdEstoque, // PnrQuantidadeEstoque,
                                            DadosPendencia.qtPendente, // PnrQuantidadaPendente,
                                            DadosEstoqueCompra.nrEstoqueMInimo, // PQtdEstoqueMinimo,
                                            NrDiasEstoquePedido, // PQtdEstoqueMaximo,
                                            cdoperadorLogisticoPedido, // PcdOPeradorLogistico:Integer;
                                            DadosEstoqueCompra.nrFrequenciaCompra,
                                            idCurva,
                                            DadosMedia.qtdPrevisaoCompra);
                                          // FrequenciaCompra: Double): TDadosQtdadeSugestao;



  nrQtdadeSusgetaoPossivel := SugestaoPossivel(NrEmbalagemCompra,DadosSugestao.nrQtdSugerida);

  if (DadosSugestao.nrQtdSugerida>0) and (nrQtdadeSusgetaoPossivel=0) and (nrQtdEstoque+DadosPendencia.qtPendente=0) then
     nrQtdadeSusgetaoPossivel :=NrEmbalagemCompra;
  //

  //nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));
  if (nrQtdadeSusgetaoPossivel=0) and (DadosSugestao.nrQtdSugerida>0) and (_cbxCaixaFechada.ItemIndex = 1)  then
      nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));

  if (_cbxCaixaFechada.ItemIndex = 0) and
    (DadosSugestao.nrDiasEstoqueFuturo < 0) and (nrQtdadeSusgetaoPossivel = 0)
    and (formatdateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime) = '01/01/2039') then
    nrQtdadeSusgetaoPossivel := NrEmbalagemCompra
  else
  begin
    if (DadosSugestao.nrQtdSugerida > 0) and (nrQtdadeSusgetaoPossivel = 0) and
      (DadosSugestao.nrDiasEstoqueFuturo < 0) and
      (formatdateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime) = '01/01/2039') then
    begin
    //Mudar Para Caixa fechada quando
    // quando a Unidade sugerida for menor que um periodo de compra
     // if ((DadosSugestao.nrQtdSugerida / NrEmbalagemCompra) * 100) >= 25 then
     if ((NrEmbalagemCompra-DadosSugestao.nrQtdSugerida)/DadosMedia.vlMediaDia)<=DadosFrequenciaCompra.nrFrequenciaCompra then
         nrQtdadeSusgetaoPossivel := NrEmbalagemCompra
      else
        nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));
    end;
  end;

 // if  ((formatdateTime('dd/mm/yyyy',dtBloqueiodeCompra))<>'01/01/2039')
   //   and  ((formatdateTime('dd/mm/yyyy',dtBloqueio)) > (formatdateTime('dd/mm/yyyy',dtSistema))) then
     // nrQtdadeSusgetaoPossivel :=0;


  if (nrQtdadeSusgetaoPossivel > 0) and (nrQtdCxCamada > 0) and
    (nrQtdCxPalete > 0) and (_chkAjustaCamadaPalete.Checked) and
    (DadosMedia.vlMediaDiaNova > 0) then
  begin
    DadosSugestaoCamadaPalete := SetQuantidadePaleteCamada(nrQtdadeSusgetaoPossivel, // PqtPedido,
                                                            NrEmbalagemCompra, // PqtEmbalagem,
                                                            nrQtdCxCamada, // PqtCamada,
                                                            nrQtdCxPalete, // PqtPalete,
                                                            DadosSugestao.NrDiasEstoque, // PDiasEstoque: Integer;
                                                            nrQtdEstoque +DadosPendencia.qtPendente,
                                                            DadosMedia.vlMediaDiaNova,                          // PvlMediaDia:Double
                                                            0,DadosEstoqueCompra.nrFrequenciaCompra,idCurva,
                                                            DadosPendencia.qtPendente,
                                                           StrToInt(formatfloat('00000',DadosSugestao.qtEstoqueSeguranca) ));
  nrQtdadeSusgetaoPossivel:=DadosSugestaoCamadaPalete.qtPedido;
  end
  else
    nrQtdadeSusgetaoPossivel:=nrQtdadeSusgetaoPossivel;

  if (DadosSugestao.nrQtdSugerida = 0) and
     (DadosSugestao.nrQtdSugeridaRejeitada > 0) then
  begin
    nrQtdadeSusgetaoPossivel := 0;
    nrQuantidadeRejeitada    :=StrToIntDef(FormatFloat('0000000',DadosSugestao.nrQtdSugeridaRejeitada), 0);
  end;

//---------------------------------
  if (_cbxCaixaFechada.ItemIndex = 0) then
  begin
  if (DadosSugestao.nrQtdSugerida>1) and (nrQtdadeSusgetaoPossivel=0)
    and (nrQtdEstoque+DadosPendencia.qtPendente>0) and (DadosMedia.vlMediaDiaNova>0) then
     if (((nrQtdEstoque+DadosPendencia.qtPendente)-
        ((nrLeadTime+DadosEstoqueCompra.nrFrequenciaCompra)*DadosMedia.vlMediaDiaNova))<DadosSugestao.qtEstoqueSeguranca) then
         nrQtdadeSusgetaoPossivel :=NrEmbalagemCompra;
  end;

//---------------------------------



  DadosItemPedidoLog := LocalizaItemPedido(NrPedido, nrProduto, nrEmpresa);

//  if (_cdsProduto.FieldByName('ID_INATIVACAO_FUTURA').AsString = 'S') or (PrecoItem.vlPrecoLiquido=0) then

  nrQtdadeSusgetaoInicio:=nrQtdadeSusgetaoPossivel;


 if nrQtdadeSusgetaoPossivel>0 then
    if not  LiberaCompraItem(dtInativacaoFutura,dtBloqueiodeCompra,false,false,IdVendaAutorizada)  then
    begin
     nrQtdadeSusgetaoPossivel:=0;
     DadosItemPedidoLog.nrQuantidadePedido:=0;
     DadosItemPedidoLog.pcVerba:=0;
     DadosItemPedidoLog.pcDescontoAdicional:=0;
    end;


  qtdPedido := nrQtdadeSusgetaoPossivel;

  if DadosItemPedidoLog.nrQuantidadePedido > 0 then
  begin
    qtdPedido := DadosItemPedidoLog.nrQuantidadePedido;
    pcDescontoAdicional := DadosItemPedidoLog.pcDescontoAdicional;
    nrVerba := DadosItemPedidoLog.nrVerba;
  end;






  MostraDadosCompraProduto(DadosSugestao.nrQtdSugerida,
                          nrQtdadeSusgetaoPossivel,
                          DadosItemPedidoLog.nrQuantidadePedido,
                         nrDiasEstoqueComPedido, nrVerba);

  FiltraVenda(nrProduto, 0, 0);
  // Series1.Clear;
  // if _pgcCompras.ActivePage = _tbsCompras then
  // MontaGrafico(Series1, nrProduto, 0);
  // DadosMedia:=CalculaMedia(0);

  MostraDadosProduto(nrQtdEstoque, // PnrQtdEstoque,
                     DadosPendencia.qtPendente, // PnrQtdPendente,
                     DadosEstoqueCompra.nrEstoqueMaximo, // PnrCoberturaEstoque,
                     qtdPedido, // Qtd. Pedido
                     DadosSugestao.qtEstoqueSeguranca,
                     vlVendaCd,
                     DadosMedia.vlMediaMes,
                     vlMediaMesCD, vlMediaDiaCD, nrQtdCaixa,
                     nrQtdUndCamada, nrQtdUndPalete);

  _pnRestricao.Visible := false;

   idAlertaInativacao:=false;

  FiltraVendaPorCanal(nrProduto, nrEmpresa, dtSelecionadaFormatada);

  Chart1.Color := clBtnFace;
  Chart1.Title.Font.Color := clBlack;

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
    Chart1.Title.Color := clRed;

    Chart1.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + #13 + ' - ';;
    Chart1.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
   idAlertaInativacao:=true;
  end;

  if FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').Asdatetime) <> '01/01/2039' then
  begin
    Chart1.Title.Color := clRed;
    Chart1.Title.Font.Color := clBlack;

    Chart1.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' + ' Produto Marcado para Ser Inativado ';
    Chart1.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
   idAlertaInativacao:=true;
  end;
  if (FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').Asdatetime) <> '01/01/2039')
    and (FormatDateTime('dd/mm/yyyy',dtBloqueiodeCompra) <FormatDateTime('dd/mm/yyyy',dtSistema)) then
  begin
    Chart1.Title.Color := clRed;
    Chart1.Title.Font.Color := clBlack;

    Chart1.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' + ' Produto Bloqueado Para compra ';
    Chart1.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
    idAlertaInativacao:=true;
  end;
  setCoresGraficoCurva(idCurva);    }

end;

PROCEDURE T_frmTelaCompras.FiltraVenda(PnrProduto, PnrEmpresa,
  PnrCanal: Integer);
var
  nrMes, nrQtdade, nrDias, nrDiasEstoqueZero: Integer;
  vlMediaMes, vlDesvioPadrao: Double;
begin
  if _cdsVendaFornecedor <> nil then
  begin
    with _cdsVendaFornecedor do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto)
                + ' and CD_EMPRESA=' +IntToStr(PnrEmpresa)
                + ' and CD_CANAL=' + IntToStr(PnrCanal);
      Filtered := true;
    end;
    _cdsVendaFornecedor.First;
    while not _cdsVendaFornecedor.eof do
    begin
      nrMes := _cdsVendaFornecedor.FieldByName('MES').AsInteger;
      nrQtdade := _cdsVendaFornecedor.FieldByName('NR_UNIDADES').AsInteger;
      nrDiasEstoqueZero := _cdsVendaFornecedor.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
      nrDias := _cdsVendaFornecedor.FieldByName('NR_DIAS').AsInteger;
      vlMediaMes := _cdsVendaFornecedor.FieldByName ('qt_media_venda_diaria').AsFloat;
      vlDesvioPadrao := _cdsVendaFornecedor.FieldByName('QT_DESVIOPADRAO_VENDA_DIARIA').AsFloat;

      VendaAnual[PnrEmpresa, nrMes] := nrQtdade;
      MediaAnual[PnrEmpresa, nrMes] := vlMediaMes;
      nrDiasMes[PnrEmpresa, nrMes] := nrDias;
      DesvioPadraoAnual[PnrEmpresa, nrMes] := vlDesvioPadrao;
      nrDiasEstoqueAZero[PnrEmpresa, nrMes] := nrDiasEstoqueZero;
      QtdPrevisaoCompra[PnrEmpresa, nrMes] := _cdsVendaFornecedor.FieldByName('QT_PREVISAO_DEMANDA').AsInteger;
      _cdsVendaFornecedor.Next;
    end;

  end;
end;


PROCEDURE T_frmTelaCompras.CarregaVendaSumarizada(PnrProduto,
  PnrEmpresa: Integer);
var
  nrMes, nrQtdade, nrDias, nrDiasEstoqueZero: Integer;
  vlCMV: Double;
begin
  if _cdsVendaSumarizada <> nil then
  begin
    with _cdsVendaSumarizada do
    begin
      Filtered := false;
      filter := 'CD_EMPRESA=' + IntToStr(PnrEmpresa);
      Filtered := true;
    end;
    _cdsVendaSumarizada.First;
    while not _cdsVendaSumarizada.eof do
    begin
       nrMes := _cdsVendaSumarizada.FieldByName('MES').AsInteger;
       nrQtdade := _cdsVendaSumarizada.FieldByName('NR_UNIDADES').AsInteger;
       nrDiasEstoqueZero := _cdsVendaSumarizada.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
       nrDias := _cdsVendaSumarizada.FieldByName('NR_DIAS').AsInteger;
       vlCMV := _cdsVendaSumarizada.FieldByName('VT_cmv').AsFloat;
       VendasSumarizadaUnidade[PnrEmpresa, nrMes] := nrQtdade;
       VendasSumarizadaValor[PnrEmpresa, nrMes] := vlCMV;
      _cdsVendaSumarizada.Next;
    end;
  end;
end;

procedure T_frmTelaCompras.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  stValor,st: String[3];
  vlDec: Integer;
  stdate: String;
  AnoSelecao,
  nrMesSelecao:Integer;
begin
  if Series2.Visible then
  begin
    stValor := Series2.XLabel[ValueIndex+1];
    //vlDec := (ValueIndex) - 12;

    st:=formatfloat('00',ValueIndex+1);

    vlDec:=Pos(st,stSelecao);

    if vlDec>0 then
       Delete(stSelecao,vlDec,2)
    else
       stSelecao:=stSelecao+st;



    AnoSelecao:=MesSelecao[ValueIndex+1].nrano;
    nrMesSelecao:=MesSelecao[ValueIndex+1].nrMes;

    stdate:='01/'+FormatFloat('00',nrMesSelecao)+'/'+FormatFloat('0000',AnoSelecao);

    //IncMonth(dtPedido, vlDec);
    dtSelecionadaFormatada := stdate;
    FiltraVendaPorCanal(nrProduto, nrEmpresa, dtSelecionadaFormatada);

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
     // MontaGrafico(Series2, nrProduto, nrEmpresa);

    // MontaGraficodeVendas(_cdsProduto.FieldByName('NROM_M').AsInteger);
    // MostraMedia;

  end;

end;

procedure T_frmTelaCompras.MostraDadosProduto(PnrQtdEstoque,
                                              PnrQtdPendente: Integer;
                                              PnrEstoqueMaximo: Double;
                                              PnrQtPedido: Integer;
                                              PEstoqueSeguranca,
                                              PvlVendaCD,
                                              PvlMediaMesEmpresa,
                                              PvlMediaMesCD,
                                              PvlMediaDiaCD: Double;
                                              PQtdCaixa, PQtdCamada, PQtdPalete: Integer);

Var

  nrUltimaEntrada, nrUltimaSaida: Integer;
  nrDiasVendaMes,qtdSugerida:Integer;
  MesLocal:Integer;
  stMes,stAno :String;

begin
  nrDiasVendaMes:= nrDiasMes[nrEmpresa, 13];
  nrDiasVendaMes:= DadosVendaNova[18].nrDias;


  // DadosItemPedidoLog := LocalizaItemPedido(NrPedido, nrProduto, nrEmpresa);
  if (_chkUsarUltimoDesconto.Checked) or (_chkMostraUltimoDescontoI.Checked) then
  begin
    pcDescontoAdicional := getUltimoDesconto(_cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger, nrProduto,
                                             nrEmpresa, cdoperadorLogisticoPedido);
  end;





  if nrDiasVendaMes=0 then
     nrDiasVendaMes:=1;
  _edtMediaDiaCd.Text    := FormatFloat('###,###0.00', PvlMediaDiaCD);

  _edtProjecaoVenda.text:=FormatFloat('###,###0',0);
   if nrDiasFaturamento>0 then
    _edtProjecaoVenda.text := FormatFloat('###,###0',(PvlVendaCD/nrDiasFaturamento)*nrDiasUteis);
  _edtEstoque.Text := FormatFloat('###,###0', PnrQtdEstoque);
  _edtEstoqueSeguranca.Text := FormatFloat('###,###0', PEstoqueSeguranca);
  // _edtMediaEmpresa.Text := FormatFloat('###,###0',PvlMediaMesEmpresa);
  //_edtMediaCd.Text := FormatFloat('###,###0', PvlMediaMesCD);
  //_edtCalculoMediaDia.Text := FormatFloat('###,###0.00', PvlMediaDiaCD);
  _edtPendenciaMes.Text := FormatFloat('###,###0', PnrQtdPendente);

  _edtQuantidadeCaixa.Text := FormatFloat('###,###0', PQtdCaixa);
  _edtQuantidadeCaixaCamada.Text := FormatFloat('###,###0', PQtdCamada);
  _edtQuantidadeCaixaPalete.Text := FormatFloat('###,###0', PQtdPalete);

  _edtCD.Text := _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;
  SetLocalCd(nrEmpresa);

  _edtEstoque.Color := clWhite;
  _edtEstoque.Font.Color := clBlack;
  _edtEstoque.ShowHint := false;
  IF (nrQtdVencido > 0) OR (nrQtdAvariada > 0) or
    ((nrQtdReservada > 0) and (nrQtdEstoque = 0)) then
  begin
    _edtEstoque.ShowHint := true;
    _edtEstoque.Color := clRed;
    _edtEstoque.Font.Color := clWhite;
    _edtEstoque.Hint := ('Estoque     = ' + FormatFloat('###,###,##0',
      nrQtdEstoque) + #13 + 'Res.Pedido  = ' + FormatFloat('###,###,##0',
      nrQtdReservada) + #13 + 'Res.Vencido = ' + FormatFloat('###,###,##0',
      nrQtdVencido) + #13 + 'Res.Problem.= ' + FormatFloat('###,###,##0',
      nrQtdAvariada));
  end;

  MesLocal := MonthOf(IncMonth(dtPedido, -1));
  stAno     := inttostr(YearOf(IncMonth(dtPedido, -1)));
  stMes    := ShortMonthNames[MesLocal];

  _gaIndiceFaltaAnterior.ShowHint:=true;
  _gaIndiceFaltaAnterior.Hint:='Indice de falta mes '+stMes+'/'+stAno;

  MesLocal := MonthOf(IncMonth(dtPedido, 0));
  stAno     := inttostr(YearOf(IncMonth(dtPedido,0)));
  stMes    := ShortMonthNames[MesLocal];

  _gaIndiceFaltaAtual.ShowHint:=true;
  _gaIndiceFaltaAtual.Hint:='Indice de falta mes '+stMes+'/'+stAno;



  // Dias Estoque
  NrDiasEstoque := 0;
  NrDiasEstoquePendencia := 0;
  if PvlMediaDiaCD > 0 then
  begin
    NrDiasEstoque := strtoint(FormatFloat('######0',PnrQtdEstoque / PvlMediaDiaCD));
    NrDiasEstoquePendencia := strtoint(FormatFloat('######0', (PnrQtdEstoque + PnrQtdPendente) /     PvlMediaDiaCD));
    // if PnrQtPedido > 0 then

  end;

  _edtDiasEstoqueCD.Text := FormatFloat('###,###0', NrDiasEstoque);
  _edtDiasEstoquePendenciaCD.Text := FormatFloat('###,###0',NrDiasEstoquePendencia);
  if nrDiasEstoqueComPedido=0 then
     nrDiasEstoqueComPedido:=strtoint(FormatFloat('######0',NrDiasEstoquePendencia));

 
  nrDiasEstoqueComPedido :=CalculaNrDiasEstoque( DadosItemPedidoLog.nrQuantidadePedido,
                                                nrQtdEstoque,
                                                DadosPendencia.qtPendente,
                                                 0,
                                                 DadosVendaNova[18].vlMediaMesPrevisao );



  _edtDiasEstoque.Text := FormatFloat('###,###0', nrDiasEstoqueComPedido);
  PintaCampoCoberturaEstoque(NrDiasEstoque, PnrEstoqueMaximo);
  PintaCampoCoberturaEstoquePendencia(NrDiasEstoquePendencia, PnrEstoqueMaximo);

  //_edtCalculoMediaDia.Text := stCalculo;

  nrUltimaEntrada := DaysBetween(_cdsProduto.FieldByName('DT_ULTIMA_ENTRADA')
    .AsDateTime, dtSistema);
  _lbeUltimaEntrada.Text := FormatDateTime('dd/mm/yyyy',
    _cdsProduto.FieldByName('DT_ULTIMA_ENTRADA').AsDateTime);
  // Mercadoria.dtUltimaEntrada);
  _lbeUltimaSaida.Text := FormatDateTime('dd/mm/yyyy',  _cdsProduto.FieldByName('DT_ULTIMA_SAIDA').AsDateTime); // Mercadoria.dtUltimaSaida);
  nrUltimaSaida := DaysBetween(_cdsProduto.FieldByName('DT_ULTIMA_SAIDA').AsDateTime, dtSistema);
  SetCoresDataSaida(nrUltimaEntrada, nrUltimaSaida);

  SetCoresCaixaCamadaPalete(PnrQtPedido, NrEmbalagemCompra, nrQtdUndCamada,
    nrQtdUndPalete);

  GetIndiceFaltaAnterior(nrProduto, nrEmpresa);
  GetIndiceFaltaAtual(nrProduto, nrEmpresa);


  // Mostra Dado Pre?o lista , Desconto Padrao
  _lbePrecoVenda.Text := FormatFloat('###,###,##0.00', precoLista.vlBaseVenda);


  if (_dsPrePedido.DataSet.FieldByName('quay_y').Asfloat>0) and (_dsPrePedido.DataSet.FieldByName('DADY_Y').Asfloat>0)  then
      pcDescontoAdicional:=_dsPrePedido.DataSet.FieldByName('DADY_Y').Asfloat;

  _lbePrecoLista.Text := FormatFloat('###,###,##0.00', precoLista.vlPrecobase);
  _lbeDescontoPadrao.Text := FormatFloat('###,###,##0.00', pcDescontoPadrao);
  _lbeDescontoAdicional.Text := FormatFloat('##0.00', pcDescontoAdicional);








  _lbeSomaDesconto.Caption := FormatFloat('##0.00', pcDescontoPadrao + pcDescontoAdicional);

  _lbePrecoNota.Text := FormatFloat('###,##0.00', PrecoItem.vlPrecolIquido);
  _lbeValorCreditoIcms.Text := FormatFloat('###,##0.00',PrecoItem.vlCreditoIcmsCompra);
  _lbePrecoCusto.Text := FormatFloat('###,##0.00', PrecoItem.vlPrecoCusto);
  _lbeValorVerba.Text := FormatFloat('###,##0.00', PrecoItem.vlVerba);

  _lbeUltimoPrecoEntrada.Text      :=FormatFloat('###,##0.00',DadosPrecoUltimaentrada.vlFaturadoUltimaEntrada );
  _lbeUltimoCustoEntrada.Text      :=FormatFloat('###,##0.00',DadosPrecoUltimaentrada.vlCustoUltimaEntrada);
  _lbeValorVerbaUltimaEntrada.Text :=FormatFloat('###,##0.00',DadosPrecoUltimaentrada.vlVerbaUltimaEntrada);



   if DadosPrecoUltimaentrada.pcCreditoUltimaEntrada>0 then
      _lbepcCreditoICMS.Text  := FormatFloat('###,###,##0.00',DadosPrecoUltimaentrada.pcCreditoUltimaEntrada)
   else
      _lbepcCreditoICMS.Text  := FormatFloat('###,###,##0.00', pcCreditoICMS);

  _lbeValorVerbaUltimaEntrada.Text:=FormatFloat('###,##0.00',DadosPrecoUltimaentrada.vlVerbaUltimaEntrada);




   MostraDadosCompraProduto(DadosSugestao.nrQtdSugerida,
                           nrQtdadeSusgetaoPossivel,
                           DadosItemPedidoLog.nrQuantidadePedido,
                           nrDiasEstoqueComPedido, nrVerba);


end;


procedure T_frmTelaCompras.SetCoresDataSaida(PnrDiasUltimaEntrada,
  PnrDiasUltimaSaida: Integer);
begin
  _lbeUltimaEntrada.Color := clWindow;
  _lbeUltimaSaida.Color := clWindow;

  if PnrDiasUltimaEntrada >= 90 then
    _lbeUltimaEntrada.Color := clYellow;

  if PnrDiasUltimaSaida >= 30 then
    _lbeUltimaSaida.Color := clYellow;

end;


procedure T_frmTelaCompras.MostraDadosCompraProduto(PnrSugestaoIdeal: Double;
  PnrSugestaoPossivel, PnrQtdPedido, PnrDiasEstoque, PnrVerba: Integer);
begin

  _edtSusgetaoIdeal.Text := FormatFloat('###,###0', PnrSugestaoIdeal);
  _edtSusgetaolPossivel.Text := FormatFloat('###,###0', PnrSugestaoPossivel);
  _edtDiasEstoque.Text := FormatFloat('###,###0', nrDiasEstoqueComPedido);
  _lbeValorVerba.Text := FormatFloat('###,##0.00', PrecoItem.vlVerba);


  if (not _chkFixaDescontoAdicional.Checked) or (pcDescontoAdicional>0) then
    _lbeDescontoAdicional.Text := FormatFloat('##0.00', pcDescontoAdicional);
  _lbeNumeroVerba.Text := FormatFloat('###0', PnrVerba);

  _edtQtdadePedido.Clear;
  if (vlMediaDiaCD > 0) then
      PnrDiasEstoque := strtoint(FormatFloat('######0',
      (nrQtdEstoque + DadosPendencia.qtPendente + qtdPedido) / vlMediaDiaCD));

  if PnrQtdPedido > 0 then
    _edtQtdadePedido.Text := FormatFloat('######0', PnrQtdPedido);


  _edtQtdadePedido.Color := clWhite;
  _edtQtdadePedido.Font.Color := clBlack;
  if (PnrQtdPedido > 0) or (PnrSugestaoPossivel > 0) then
  begin
    if PnrSugestaoPossivel = PnrQtdPedido then
    begin
      _edtQtdadePedido.Color := clGreen;
      _edtQtdadePedido.Font.Color := clWhite;
    end;
    if (PnrSugestaoPossivel > PnrQtdPedido) and (PnrQtdPedido = 0) then
    begin
      _edtQtdadePedido.Color := clRed;
      _edtQtdadePedido.Font.Color := clWhite;
    end;
    if (PnrSugestaoPossivel > PnrQtdPedido) and (PnrQtdPedido > 0) then
    begin
      _edtQtdadePedido.Color := clYellow;
      _edtQtdadePedido.Font.Color := clBlack;
    end;
  end;

end;

{function T_frmTelaCompras.SugestaoPossivel(PnrQtdadeEmbalagem: Integer;
  PnrQtdadeIdeal: Double): Integer;
begin
  Result := strtoint(FormatFloat('########0', PnrQtdadeIdeal));
  if PnrQtdadeEmbalagem > 0 then
    Result := strtoint(FormatFloat('########0',(PnrQtdadeIdeal / PnrQtdadeEmbalagem)));
  Result := Result * PnrQtdadeEmbalagem;

end;}

Function T_frmTelaCompras.getIndiceMes(PnmMes: String): Integer;
var
  I: Integer;
begin
  for I := 1 to 13 do
  begin
    if MesAno[I] = PnmMes then
    begin
      Result := I;
      break;
    end;
  end;
end;

function T_frmTelaCompras.CalculaMedia(PnrEmpresa: Integer): TDadosMedia;
var
  I: Integer;
  nrAcumulaVenda: Integer;
  nrAcumulaNrDias,
  nrAcumulaNrDiasVenda,
  nrAcumulaNrDiasEstoqueZero,
  nrAcumulaNrMes,
  nrQtdPrevisaoCompra: Integer;
  vlMediaDiaNova, vlMediaDiaNovaAcumulada, vlDesvioPadraoAcumulado: Double;
    mesPesquisa: Integer;
  mes, Dia, Ano: Word;



begin
  nrAcumulaVenda := 0;
  nrAcumulaNrDias := 0;
  nrAcumulaNrMes := 0;
  nrAcumulaNrDiasEstoqueZero := 0;
  nrAcumulaNrDiasVenda := 0;
  vlMediaDiaNova := 0;
  vlMediaDiaNovaAcumulada := 0;
  vlDesvioPadraoAcumulado := 0;
  nrQtdPrevisaoCompra     := 0;
  DecodeDate(Date, Ano, mes, Dia);

  nrAcumulaNrMes := 1;
  mesPesquisa:=13;

  if dia=1 then
     mesPesquisa:=mes-1;

  vlVendaCd := VendaAnual[nrEmpresa, mesPesquisa];


  nrAcumulaNrDiasVenda    := nrAcumulaNrDiasVenda + nrDiasMes[PnrEmpresa, mesPesquisa];
  vlMediaDiaNovaAcumulada := vlMediaDiaNovaAcumulada + MediaAnual[PnrEmpresa, mesPesquisa];
  vlDesvioPadraoAcumulado := vlDesvioPadraoAcumulado + DesvioPadraoAnual[PnrEmpresa, mesPesquisa];
  nrQtdPrevisaoCompra     := qtdprevisaoCompra[PnrEmpresa, mesPesquisa];

  if (nrAcumulaNrMes > 0) and ((nrAcumulaNrDiasVenda - nrAcumulaNrDiasEstoqueZero) > 0) then
  begin

    Result.vlMediaMes :=((nrAcumulaVenda / (nrAcumulaNrDiasVenda - nrAcumulaNrDiasEstoqueZero)) * nrAcumulaNrDiasVenda) / nrAcumulaNrMes;

    if (nrAcumulaNrDiasVenda - nrAcumulaNrDias) > 0 then
    begin
      Result.vlMediaDia := nrAcumulaVenda / (nrAcumulaNrDiasVenda - nrAcumulaNrDiasEstoqueZero);
    end;

    vlMediaDiaNova := vlMediaDiaNovaAcumulada / nrAcumulaNrMes;
    Result.vlDesvioPadrao := vlDesvioPadraoAcumulado / nrAcumulaNrMes;

  end;
  Result.qtdPrevisaoCompra:=nrQtdPrevisaoCompra;
  Result.vlMediaDiaNova := vlMediaDiaNova;
  Result.vlMediaMesNova := vlMediaDiaNova * nrAcumulaNrDiasVenda;
  Result.stCalculoNovo := FormatFloat('###,##0.00', vlMediaDiaNovaAcumulada) +
    '/' + FormatFloat('###,##0', nrAcumulaNrMes) + ' = ' +
    FormatFloat('###,##0.00', vlMediaDiaNova);

  Result.stCalculo := FormatFloat('###,##0', nrAcumulaVenda) + '/' + '(' +
    FormatFloat('###,##0', nrAcumulaNrDiasVenda) + ' - ' +
    FormatFloat('###,##0', nrAcumulaNrDiasEstoqueZero) + ')=' +
    FormatFloat('###,##0.000', Result.vlMediaDia);
end;

function T_frmTelaCompras.setPendenciaCD(nrProduto, cdEmpresa: Integer)
  : TDadosPendenciaPedido;
begin
  Result.QtPedido := 0;
  Result.qtAtendida := 0;
  Result.qtPendente := 0;
  Result.qtProcessada := 0;
  Result.vlPedido := 0;
  Result.vlPendente := 0;
  if _cdsPendencia <> nil then
  begin
     if _cdsPendencia.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([nrProduto, cdEmpresa]), []) then
    begin
      Result.QtPedido := _cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;;
      Result.qtAtendida := _cdsPendencia.FieldByName('QT_ATENDIDA').AsInteger;
      Result.qtPendente := _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
      Result.qtTransito := _cdsPendencia.FieldByName('QT_TRANSITO').AsInteger;
      Result.qtPendencia :=_cdsPendencia.FieldByName('PENDENCIA').AsInteger;
      Result.qtEstoqueCrossdocking:=_cdsPendencia.FieldByName('QT_TRANSFERENCIA').AsInteger;
     // Result.vlPedido := _cdsPendencia.FieldByName('VL_PENDENTE').AsFloat;
      Result.qtProcessada := _cdsPendencia.FieldByName('QT_PROCESSADA').AsInteger;
    end;
  end;
end;

procedure T_frmTelaCompras.SetCorPendencia(PqtPedido, PqtPendente, PqtAtendida,
  PqtProcessada,PqtTransito,PqtEstoqueCrossDocking,Ppendencia: Integer);
begin
  _edtPendenciaMes.Color := clWhite;
  _edtPendenciaMes.Font.Color := clBlack;
  if (PqtPedido > (PqtPedido - PqtAtendida - PqtProcessada)) and
    (PqtPendente > 0) or (PqtEstoqueCrossDocking>0) or (PqtTransito>0) then
  begin
    _edtPendenciaMes.Color := clYellow;
    _edtPendenciaMes.Font.Color := clBlack;
  end;
  if (PqtPedido = (PqtAtendida + PqtProcessada+ PqtTransito)) and (PqtPendente+ PqtTransito> 0) then
  begin
    _edtPendenciaMes.Color := clGreen;
    _edtPendenciaMes.Font.Color := clWhite;
  end;
  if (PqtPedido > 0) AND (PqtAtendida = 0) and (PqtPendente = 0) and (PqtEstoqueCrossDocking=0) then
  begin
    _edtPendenciaMes.Color := clRed;
    _edtPendenciaMes.Font.Color := clWhite;
  end;

  _edtPendenciaMes.ShowHint := true;
  _edtPendenciaMes.Hint := ('Qtd.Pedido        = ' + FormatFloat('###,###,##0',PqtPedido) + #13 +
                            'Qtd. Entrada      = ' + FormatFloat('###,###,##0',PqtProcessada) + #13 +
                            'Qtd. Em Transito  = ' + FormatFloat('###,###,##0',PqtTransito) + #13 +
                            'Qtd. Em Estoque CrossDocking = ' + FormatFloat('###,###,##0',PqtEstoqueCrossDocking) + #13 +
                            'Qtd. Pendente no Fornecedor  = ' + FormatFloat('###,###,##0',Ppendencia));

end;

function T_frmTelaCompras.SetLeadTime(PnrEmpresa: Integer;
  PidTermoLabil: String): TDadosLeadTime;
begin
  if _cdsTabelaLeadTime <> nil then
  begin
    with _cdsTabelaLeadTime do
    begin
      Filtered := false;
      filter := 'CD_EMPRESA=' + IntToStr(PnrEmpresa) + ' AND ID_TERMOLABIL=' + QuotedStr(PidTermoLabil);
      Filtered := true;
    end;
    Result.vlLeadTime := 0;
    Result.vlDesvioPadrao := 0;
    if not _cdsTabelaLeadTime.IsEmpty then
    begin
      Result.vlLeadTime := _cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME').AsFloat;
      Result.vlDesvioPadrao := _cdsTabelaLeadTime.FieldByName('QT_DIAS_DESVIOPADRAO_LEADTIME').AsFloat;
    end;
  end;
end;


function T_frmTelaCompras.GetUltimaCompra(PnrProduto, PnrCD,
  PnrOPerador: Integer): Tdate;
begin
  if _cdsDataUltimaCompra <> nil then
  begin
    with _cdsDataUltimaCompra do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' AND CD_EMPRESA=' +
        IntToStr(PnrCD) + ' AND CD_OPERADOR_LOGISTICO =' +
        IntToStr(PnrOPerador);
      Filtered := true;
    end;
    Result := strtodate('01/01/1899');
    if not _cdsDataUltimaCompra.IsEmpty then
      Result := _cdsDataUltimaCompra.FieldByName('DT_ULTIMA_COMPRA').AsDateTime;
  end;
end;


function T_frmTelaCompras.CalculoSugestaoIdealNova(PnrEmpresa: Integer;
                                                   PvlPE,
                                                   PnrDiasAjuste,
                                                   PLeadTimeCalculo,
                                                   PvlMediaDiaria: Double;
                                                   PnrQuantidadeEstoque,
                                                   PnrQuantidadaPendente,
                                                   PQtdEstoqueMinimo,
                                                   PQtdEstoqueMaximo,
                                                   PcdOPeradorLogistico: Integer;
                                                   PnrFrequenciaCompra: Double;
                                                   PidCurva: String;
                                                   PqtdPrevisaoCompra:Integer;
                                                   PvlDesvioPadrao:Double): TDadosQtdadeSugestao;
var
  vlTemp, nrDiasUltimacompra: Double;
  dtUltimaCompra: Tdate;
  qtEstoqueMaximo: Double;
  vlIndiceNSPadrao,
  vlPadrao,
  vlIndicePadrao: Double;
  nrUnidadeMinima,
  //nrUnidadesEstoqueMaximo,
  nrUnidadesRejeitada: Double;
  ConsumEstoqueFuturo,
  ProjecaoEstoqueFuturo,
  ProjecaoEstoqueFuturoProximoPedido,
  loteCompraPeriodoReposicao,
  qtSugerida,
  nrDiasEstoqueFuturo,
  EstoqueFuturo,
  ParamentroFrenquencia: Double;
  idTesteMediaEDesvio: Boolean;
  vlDesvioEMedia, DiasEstoqueNovo,
  vl1,vl2,vl3,vl4: Double;

begin

  Result.nrQtdSugerida := 0;
  Result.nrQtdSugeridaRejeitada := 0;
  qtEstoqueMaximo:=0;
  qtSeguranca    :=0;




  if PidCurva = 'A' then
    vlIndiceNSPadrao := vlIndiceNivelServico_A;
  if PidCurva = 'B' then
    vlIndiceNSPadrao := vlIndiceNivelServico_B;
  if PidCurva = 'C' then
    vlIndiceNSPadrao := vlIndiceNivelServico_C;
  if PidCurva = 'D' then
    vlIndiceNSPadrao := vlIndiceNivelServico_D;
  if PidCurva = 'E' then
    vlIndiceNSPadrao := vlIndiceNivelServico_E;

 vlIndicePadrao :=1;
 if PnrFrequenciaCompra>0 then
    vlIndicePadrao := 28 / PnrFrequenciaCompra;


  if vlIndicePadrao > 0 then
    vlDesvioEMedia := PvlDesvioPadrao / vlIndicePadrao
  else
    SLEEP(0);

 if vlDesvioEMedia <= PvlMediaDiaria then
  begin
    qtSeguranca := vlIndiceNSPadrao *
                  Sqrt((power(PvlDesvioPadrao / vlIndicePadrao,2)* PLeadTimeCalculo)
                  + power(DadosLeadTime.vlDesvioPadrao, 2) * power(PvlMediaDiaria, 2));

    vl1:= (power(PvlMediaDiaria/ vlIndicePadrao, 2)*PLeadTimeCalculo );
    vl2:= power(DadosLeadTime.vlDesvioPadrao, 2);
    vl3:= power(PvlMediaDiaria, 2);
    vl4:= vl1 + (vl2 * vl3);


  end;


  if vlDesvioEMedia > PvlMediaDiaria then
  begin

    vl1:= (power(PvlMediaDiaria, 2) * PLeadTimeCalculo);
    vl2:= power(DadosLeadTime.vlDesvioPadrao, 2);
    vl3:= power(PvlMediaDiaria, 2);
    vl4:= vl1 + (vl2 * vl3);



    qtSeguranca := vlIndiceNSPadrao *
                   Sqrt((power(PvlMediaDiaria, 2) * PLeadTimeCalculo) +
                   power(DadosLeadTime.vlDesvioPadrao, 2) * power(PvlMediaDiaria, 2));
  end;

  // Somatorio qtSeguranca  (N?O usado)
  //qtSegurancaAcumulada := qtSegurancaAcumulada + qtSeguranca;

  loteCompraPeriodoReposicao := PnrFrequenciaCompra * PvlMediaDiaria;

  qtEstoqueMaximo := qtSeguranca + (PnrFrequenciaCompra  * PvlMediaDiaria);
  // qtMaxima eh usado para Posi??o Grafico
   qtMaxima := qtEstoqueMaximo;

  DiasEstoqueNovo := 0;
  if PvlMediaDiaria > 0 then
    DiasEstoqueNovo := qtEstoqueMaximo / PvlMediaDiaria;



  dtUltimaCompra     := GetUltimaCompra(nrProduto, PnrEmpresa, PcdOPeradorLogistico);
  nrDiasUltimacompra := dtSistema - dtUltimaCompra;


  ConsumEstoqueFuturo   := (PnrFrequenciaCompra + PLeadTimeCalculo) * PvlMediaDiaria;


  ProjecaoEstoqueFuturo := (PnrQuantidadeEstoque + PnrQuantidadaPendente) - ConsumEstoqueFuturo;


  EstoqueFuturo:=qtSeguranca;


  if ProjecaoEstoqueFuturo>=qtSeguranca then
     qtSugerida:=0
  else
    qtSugerida  := (qtSeguranca+ConsumEstoqueFuturo)-(PnrQuantidadeEstoque + PnrQuantidadaPendente);

   {if PqtdPrevisaoCompra>0 then
   begin
      qtSugerida  := PqtdPrevisaoCompra -(PnrQuantidadeEstoque + PnrQuantidadaPendente);
      qtSugerida  := qtSugerida/ vlIndicePadrao
   end};


    NrDiasInformado:=StrToIntDef(formatfloat('##0',(PnrFrequenciaCompra + PLeadTimeCalculo)),0);


  // Nr. de dias Sugerido Pelo Comprador Ignora calculo e de reposicao
  if NrDiasEstoqueComprador > 0 then
  begin
    NrDiasInformado:=StrToIntDef(formatfloat('##0',(NrDiasEstoqueComprador + PnrDiasAjuste + PLeadTimeCalculo)),0);
//  ProjecaoEstoqueFuturo := 0;
    qtSugerida := ((NrDiasEstoqueComprador + PnrDiasAjuste + PLeadTimeCalculo) *
                   PvlMediaDiaria) - (PnrQuantidadeEstoque + PnrQuantidadaPendente);
  end;




  if qtSugerida<0 then
     qtSugerida:=0;
  nrUnidadesRejeitada := 0;

  nrDiasEstoqueFuturo :=0;


 //Calcula dias estoque na Tela de Compras
 //
 ProjecaoEstoqueFuturo:=(PnrQuantidadeEstoque + PnrQuantidadaPendente)-loteCompraPeriodoReposicao;

 nrDiasEstoqueFuturo :=0;
 if PvlMediaDiaria>0  then
    nrDiasEstoqueFuturo := ((qtSugerida+PnrQuantidadeEstoque + PnrQuantidadaPendente) )/PvlMediaDiaria;



  Result.nrQtdSugerida          := qtSugerida;
  Result.NrDiasEstoque          := DiasEstoqueNovo;
  Result.nrQtdSugeridaRejeitada := nrUnidadesRejeitada;
  Result.nrDiasEstoqueFuturo    := nrDiasEstoqueFuturo;
  result.qtEstoqueSeguranca     := qtSeguranca;
  Result.NrDiasInformado        :=NrDiasInformado;


end;

procedure T_frmTelaCompras.SetTabelasItensCurva(PnrFornecedor: Integer;
  PnrEmpresa: String);
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
        Add('AND CM.ID_SITUACAO_MERCADORIA    = ''A''');
        Add('AND  M.ID_SITUACAO_MERCADORIA    = ''A''');
        Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrForncedor');
        if PnrEmpresa <> '' then
          Add('AND CM.CD_EMPRESA in(' + PnrEmpresa + ')');
        Add('GROUP BY  CM.CD_EMPRESA,GFM.ID_CURVA_MERCADORIA,');
        Add('GFM.QT_DIAS_FREQUENCIA_COMPRA, GFM.QT_ESTOQUE_MAXIMO,');
        Add('GFM.QT_ESTOQUE_MINIMO');
        Add('ORDER BY CD_EMPRESA,GFM.ID_CURVA_MERCADORIA');
      end;
      stQry.SaveToFile('C:\temp\qryItensCruva.sql');
      with _cdsItensCurva do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrForncedor').AsBcd := PnrFornecedor;
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


procedure T_frmTelaCompras.SpeedButton1Click(Sender: TObject);
begin
  nrProdutoUltimosPedido := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrEmpresaUltimoPedido  := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
  _frmUltimosPedidos := T_frmUltimosPedidos.Create(self);

  FormPos(_frmUltimosPedidos, 2, 1);

end;



procedure T_frmTelaCompras.SetGridParamentro;
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

function T_frmTelaCompras.setParamentroItemCurvaCompra(PnrEmpresa,
                                                       PnrDiasEstoque: Integer;
                                                       PidCurva: Char): TDadosEstoqueCurva;
var
  vlTempo: Integer;
begin
  try
    if trim(PidCurva) = '' then
      PidCurva := 'A';
    Result.nrFrequenciaCompra := PnrDiasEstoque;
    Result.nrEstoqueMInimo := 0;
    Result.nrEstoqueMaximo := 0;
    if _cdsItensCurva.Locate('CD_EMPRESA;ID_CURVA_MERCADORIA',VarArrayOf([PnrEmpresa, PidCurva]), []) then
    // if not _cdsParamentoCompra.isEmpty then
    begin
      Result.nrFrequenciaCompra := _cdsItensCurva.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsFloat;
      Result.nrEstoqueMaximo    := _cdsItensCurva.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger;
      Result.nrEstoqueMInimo := _cdsItensCurva.FieldByName('QT_ESTOQUE_MINIMO').AsInteger;
      vlTempo := StrToIntDef(FormatFloat('###0',Result.nrFrequenciaCompra * 3), 0);

    end;
    if PnrDiasEstoque > 0 then
      Result.nrEstoqueMaximo := PnrDiasEstoque;

  except
    on E: Exception do
    begin
      trataerro(E.Message, 'Erro ao Acessar Para paramentro de Compra...');
    end;

  end;
end;


procedure T_frmTelaCompras.PintaCampoCoberturaEstoquePendencia
  (PnrDiasCoberturaEstoque, PvlParamentoCompra: Double);
begin
  if PnrDiasCoberturaEstoque > PvlParamentoCompra then
  begin
    _edtDiasEstoquePendenciaCD.Font.Color := clWhite;
    _edtDiasEstoquePendenciaCD.Color := clRed;
  end;
  if (PnrDiasCoberturaEstoque = PvlParamentoCompra) then
  begin
    _edtDiasEstoquePendenciaCD.Font.Color := clWhite;
    _edtDiasEstoquePendenciaCD.Color := clGreen;
  end;
  if PnrDiasCoberturaEstoque < PvlParamentoCompra then
  begin
    _edtDiasEstoquePendenciaCD.Font.Color := clWhite;
    _edtDiasEstoquePendenciaCD.Color := clBlue;
  end;
end;


procedure T_frmTelaCompras.PintaCampoCoberturaEstoque(PnrDiasCoberturaEstoque,
  PvlParamentoCompra: Double);
begin
  if PnrDiasCoberturaEstoque > PvlParamentoCompra then
  begin
    _edtDiasEstoqueCD.Font.Color := clWhite;
    _edtDiasEstoqueCD.Color := clRed;
  end;
  if (PnrDiasCoberturaEstoque = PvlParamentoCompra) then
  begin
    _edtDiasEstoqueCD.Font.Color := clWhite;
    _edtDiasEstoqueCD.Color := clGreen;
  end;
  if PnrDiasCoberturaEstoque < PvlParamentoCompra then
  begin
    _edtDiasEstoqueCD.Font.Color := clWhite;
    _edtDiasEstoqueCD.Color := clBlue;
  end;
end;

Procedure T_frmTelaCompras.SetCoresCaixaCamadaPalete(PqtPedido, PqtEmbalagem,
  PqtCamada, PqtPalete: Integer);
var
  qtMultiplo: Integer;
begin
  _edtQuantidadeCaixa.Color := clWindow;
  _edtQuantidadeCaixaCamada.Color := clWindow;
  _edtQuantidadeCaixaPalete.Color := clWindow;
  _edtQuantidadeCaixa.Font.Color := clBlack;
  _edtQuantidadeCaixaCamada.Font.Color := clBlack;
  _edtQuantidadeCaixaPalete.Font.Color := clBlack;

  qtMultiplo := PqtPedido mod PqtEmbalagem;
  if PqtPedido > 0 then
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
    if PqtCamada > 0 then
    begin
      qtMultiplo := PqtPedido mod (PqtCamada);
      if qtMultiplo > 0 then
      begin
        _edtQuantidadeCaixaCamada.Color := clRed;
        _edtQuantidadeCaixaCamada.Font.Color := clWhite;
      end;
      if qtMultiplo = 0 then
      begin
        _edtQuantidadeCaixaCamada.Color := clGreen;
        _edtQuantidadeCaixaCamada.Font.Color := clWhite;
      end;
      _edtQuantidadeCaixaCamada.refresh;
    end;
    qtMultiplo := 0;
    if PqtPalete > 0 then
    begin
      qtMultiplo := PqtPedido mod (PqtPalete);
      if qtMultiplo > 0 then
      begin
        _edtQuantidadeCaixaPalete.Color := clRed;
        _edtQuantidadeCaixaPalete.Font.Color := clWhite;
      end;
      if qtMultiplo = 0 then
      begin
        _edtQuantidadeCaixaPalete.Color := clGreen;
        _edtQuantidadeCaixaPalete.Font.Color := clWhite;
      end;
    end;
  end;
end;

function T_frmTelaCompras.SetIndiceFalta(PnrMes, PnrProduto,
  PnrEmpresa: Integer): Integer;
var
  nrMesAtual, nrMesAnterior: Integer;

begin
  if _cdsIndicedeFalta <> nil then
  begin
    _cdsIndicedeFalta.open;

    with _cdsIndicedeFalta do
    begin
      Filtered := false;
      filter := 'MES=' + IntToStr(PnrMes) + ' and CD_MERCADORIA=' +
        IntToStr(PnrProduto) + ' and CD_EMPRESA=' + IntToStr(PnrEmpresa);
      Filtered := true;
    end;
    Result := 0;
    if not _cdsIndicedeFalta.IsEmpty then
      Result := _cdsIndicedeFalta.FieldByName('INDICE_FALTA').AsInteger;
  end;

end;

procedure T_frmTelaCompras.GetIndiceFaltaAnterior(PnrProduto, PnrCD: Integer);
var
  vlIndice, mes: Integer;
begin

  mes := MonthOf(IncMonth(dtPedido, -1));

  vlIndice := SetIndiceFalta(mes, PnrProduto, PnrCD);
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

procedure T_frmTelaCompras.GetIndiceFaltaAtual(PnrProduto, PnrCD: Integer);
var
  vlIndice: Integer;
  mes: Integer;
begin

  mes := MonthOf(IncMonth(dtPedido, 0));

  vlIndice := SetIndiceFalta(mes, PnrProduto, PnrCD);
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

function T_frmTelaCompras.DadosProduto: TMercadoria;
begin

end;

function T_frmTelaCompras.DadosProdutos(PnrProduto, PnrEmpresa,
  PcdOPeradorLogistico: Integer): TMercadoria;

begin
   with _cdsProduto do
   begin
   Filtered:=false;
   filter:='CD_MERCADORIA='+IntToStr(PnrProduto)+' AND CD_EMPRESA='+IntToStr(PnrEmpresa);
   Filtered:=true;
   end;

  if not _cdsProduto.IsEmpty then
  begin
//    Mercadoria :=nil;
    Mercadoria := TMercadoria.Create;

    Mercadoria.cdProduto        := _cdsProduto.FieldByName('CD_PRODUTO').AsInteger;
    Mercadoria.nrProduto        := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
    Mercadoria.dgProduto        := _cdsProduto.FieldByName('NR_DV_MERCADORIA').AsInteger;
    Mercadoria.qtEstoque        := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
    Mercadoria.qtEstoqueFISICO  := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
    Mercadoria.nrLaboratorio    := _cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger;

    Mercadoria.nrUnidadesVencidas     := _cdsProduto.FieldByName('QT_VENCIDO').AsInteger;
    Mercadoria.nrReservaProblematica  := _cdsProduto.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger;
    Mercadoria.nrUnidadeReservaPedido := _cdsProduto.FieldByName('QT_RESERVADO').AsInteger;
    Mercadoria.nrUnidadeBloqueada     := _cdsProduto.FieldByName('QT_BLOQUEADO').AsInteger;
    Mercadoria.qtEmbalagemCompra      := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
    Mercadoria.qtEmbalagemVenda       := _cdsProduto.FieldByName('QT_EMBALAGEM_VENDA').AsInteger;
    Mercadoria.qtdCaixaPalete         := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
    Mercadoria.qtdCaixaCamada         := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
    Mercadoria.qtMetroCubico          := _cdsProduto.FieldByName('MTS_CUBICO').AsFloat;
    Mercadoria.nrTipoProduto          := _cdsProduto.FieldByName('DS_NIVEL_ECNM').AsInteger;
    Mercadoria.pcRepasseCompra        := _cdsProduto.FieldByName('PC_REPASSE_COMPRA').AsFloat;
    Mercadoria.pcCreditoICMS          := _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat;
    Mercadoria.pcIpiProduto           := _cdsProduto.FieldByName('PC_IPI_MERCADORIA').AsFloat;
    Mercadoria.vlPrecoCadastro        := _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat;
    Mercadoria.vlPrecoCompra          := _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat;
    Mercadoria.vlPrecoVenda           := _cdsProduto.FieldByName('VL_PRECO_VENDA').AsFloat;
    Mercadoria.vlPrecoVendaAnterior   := _cdsProduto.FieldByName('VL_PRECO_VENDA_ANTERIOR').AsFloat;
    Mercadoria.vlPrecoCompraAnterior  := _cdsProduto.FieldByName('VL_PRECO_COMPRA_ANTERIOR').AsFloat;
    Mercadoria.vlCustoGerencial       := _cdsProduto.FieldByName('VL_CUSTO_GERENCIAL').AsFloat;


    Mercadoria.nmProduto              := _cdsProduto.FieldByName('NM_MERCADORIA').AsString;
    Mercadoria.dsApresentacao         := _cdsProduto.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString;
    Mercadoria.nmProdutoCompleto      := _cdsProduto.FieldByName('NM_COMPLETO').AsString;

    if _cdsProduto.FieldByName('DS_NIVEL_ECNM').AsInteger = 1 then
      Mercadoria.dsFinalidade := setEspecialidade(_cdsProduto.FieldByName('DS_NIVEL_EITM').AsInteger)
    else
      Mercadoria.dsFinalidade    := setEspecialidade(_cdsProduto.FieldByName('DS_NIVEL_ERGM').AsInteger);
    Mercadoria.idCurva           := _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1];
    Mercadoria.dtUltimaSaida     := _cdsProduto.FieldByName('DT_ULTIMA_SAIDA').AsDateTime;
    Mercadoria.dtUltimaEntrada   := _cdsProduto.FieldByName('DT_ULTIMA_ENTRADA').AsDateTime;
    Mercadoria.idTipoListaFiscal := _cdsProduto.FieldByName('ID_TIPO_LISTA_FISCAL').AsString[1];
    Mercadoria.idSuperfulo       := _cdsProduto.FieldByName('ID_SUPERFLUO').AsString[1];
    Mercadoria.idPisCofins       := _cdsProduto.FieldByName('ID_COFINS').AsString[1];
    Mercadoria.idPis             := _cdsProduto.FieldByName('ID_PIS').AsString[1];
    Mercadoria.idCofins          := _cdsProduto.FieldByName('ID_COFINS').AsString[1];
    Mercadoria.idCipado          := _cdsProduto.FieldByName('ID_CIPADO').AsString[1];
    Mercadoria.idRetemICMS       := _cdsProduto.FieldByName('ID_RETEM_ICMS').AsString[1];
    Mercadoria.idRepasseIcms     := _cdsProduto.FieldByName('ID_REPASSE_ICMS').AsString[1];


    Mercadoria.cdInternoFornecedor := _cdsProduto.FieldByName('CD_INTERNO_LABORATORIO').AsString;
    Mercadoria.qtEmbalagemCompra := setQuantidadeEmbalagem(Mercadoria.nrProduto);

    if Mercadoria.qtEmbalagemCompra < 1 then
      Mercadoria.qtEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
    Mercadoria.qtEmbalagemVenda := _cdsProduto.FieldByName('QT_EMBALAGEM_VENDA').AsInteger;
    DadosFornecedor           := GetDadosLaboratorio(Mercadoria.nrLaboratorio);
    Mercadoria.idForcaRepasse := DadosFornecedor.idForcaRepasse;
    Mercadoria.idIpiLiquidoComRepasse := DadosFornecedor.idIpiLiquidoComRepasse;
    Mercadoria.idIpiLiquidoSemRepasse := DadosFornecedor.idIpiLiquidoSemRepasse;
    Mercadoria.idIpiBrutoComRepasse := DadosFornecedor.idIpiBrutoComRepasse;
    Mercadoria.idIpiBrutoSemRepasse := DadosFornecedor.idIpiBrutoSemRepasse;
    Mercadoria.idIcmDestacado := DadosFornecedor.idIcmDestacado;
    Mercadoria.idReduzIcms := DadosFornecedor.idReduzIcms;
    Mercadoria.dsRazaoSocialFornecedor := DadosFornecedor.dsRazaoSocial;
    Mercadoria.dsUndidadeFederacaoFornecedor := DadosFornecedor.dsUnidadeFederacao;
    Mercadoria.dsFantasiaFornecedor := DadosFornecedor.dsNomeFantasia;
    Mercadoria.pcGeracaoVerba := DadosFornecedor.pcGeracaoVerba;
    Mercadoria.nrGeracaoVerba := DadosFornecedor.nrGeracaoVerba;

    Mercadoria.dsLocalizacao := _cdsProduto.FieldByName('CD_LOCALIZACAO').AsString;
    Mercadoria.dtAtualizacaoPreco := _cdsProduto.FieldByName('DT_ATUALIZACAO_PRECO_VENDA').AsDateTime;
    Mercadoria.nrEmpresaProduto := nrEmpresa;
    Mercadoria.vlFinanceiroEstoque := _cdsProduto.FieldByName('VT_CUSTO_FINANCEIRO_MERCADORIA').AsFloat;
    Mercadoria.dsUnidadeMedia := _cdsProduto.FieldByName('DS_UNIDADE_MEDIDA').AsString;
    Mercadoria.nrComprador := _cdsProduto.FieldByName('CD_COMPRADOR').AsInteger;

    Mercadoria.pcDescontoPadrao := _cdsProduto.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;

    dtInativacaoFutura:= _cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime;
    dtBloqueiodeCompra:= _cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime;
    IdVendaAutorizada := true;
   if _cdsProduto.FieldByName('ID_VENDA_AUTORIZADA').AsString='N' then
     IdVendaAutorizada :=false;

   IdVendaAutorizada:=SetVendaAutorizadaCrossDocking(nrProduto,nrEmpresa,cdoperadorLogisticoPedido);



   pcDescontoPadrao := Mercadoria.pcDescontoPadrao;


    Result := Mercadoria;
  end
  else
    Result := nil;
end;


function T_frmTelaCompras.SetVendaAutorizadaCrossDocking(PnrProduto, PnrEmpresa,
                                                         PcdOPeradorLogistico: Integer): boolean;

begin
   with _cdsProduto do
   begin
   Filtered:=false;
   filter:='CD_MERCADORIA='+IntToStr(PnrProduto)+' AND CD_EMPRESA='+IntToStr(PnrEmpresa);
   Filtered:=true;
   end;
   Result := true;
   if _cdsProduto.FieldByName('ID_VENDA_AUTORIZADA').AsString='N' then
     Result :=false;

end;



function T_frmTelaCompras.SetPrecoUltimaEntrada(PnrProduto, PnrEmpresa: Integer): TDadosUltimoPrecoEntrada;
begin
   with _cdsUltimoPrecoEntrada do
   begin
   Filtered:=false;
   filter:='CD_MERCADORIA='+IntToStr(PnrProduto)+' AND CD_EMPRESA='+IntToStr(PnrEmpresa);
   Filtered:=true;
   end;
        Result.vlFaturadoUltimaEntrada := 0;
        Result.pcCreditoUltimaEntrada  := 0;
        Result.vlCustoUltimaEntrada    := 0;
        Result.vlVerbaUltimaEntrada    := 0;
   if NOT _cdsUltimoPrecoEntrada.IsEmpty then
   begin
        Result.vlFaturadoUltimaEntrada := _cdsUltimoPrecoEntrada.FieldByName('VL_FATURAMENTO_TOTAL_COMPRA').AsFloat;
        Result.pcCreditoUltimaEntrada  := _cdsUltimoPrecoEntrada.FieldByName('PC_ALIQUOTA_ICMS').AsFloat;
        Result.vlCustoUltimaEntrada    := _cdsUltimoPrecoEntrada.FieldByName('VL_CUSTO_COMPRA').AsFloat;
        Result.vlVerbaUltimaEntrada    := _cdsUltimoPrecoEntrada.FieldByName('VT_VERBA').AsFloat;;
   end;


end;




procedure T_frmTelaCompras._dbgListaPrecoDblClick(Sender: TObject);
begin

  if nrListaPrecoExcecao = 0 then
  begin
    _cdsListaPrecoAtiva.Edit;
    nrListaPrecoExcecao := _cdsListaPrecoAtiva.FieldByName('NR_LISTA') .AsInteger;
    if _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString = 'N' then
      _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'S'
    else
    begin
      _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'N';
      nrListaPrecoExcecao := 0;
    end;
  end
  else
  begin
    if nrListaPrecoExcecao > 0 then
    begin
      _cdsListaPrecoAtiva.Edit;
      if _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString = 'N' then
        _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'S'
      else
      begin
        _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'N';
        nrListaPrecoExcecao := 0;
      end;

    end;
  end;
  _cdsListaPrecoAtiva.post;
  _cdsListaPrecoAtiva.open;
  _cdsItemListaPreco := nil;
  if nrListaPrecoExcecao > 0 then
    _cdsItemListaPreco := AbrePrecoListaAtiva(nrListaPrecoExcecao);
  if _cdsItemListaPreco <> nil then
    _cdsItemListaPreco.open;

end;

procedure T_frmTelaCompras._dbgListaPrecoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // mude a cor das celulas em que valor = 0
  with _dbgListaPreco do
  begin
    if odd(_cdsListaPrecoAtiva.RecNo) then
    begin
      _dbgListaPreco.Canvas.Font.Color := clBlack;
      _dbgListaPreco.Canvas.Brush.Color := clMoneyGreen;
    end
    else
    begin
      _dbgListaPreco.Canvas.Font.Color := clBlack;
      _dbgListaPreco.Canvas.Brush.Color := clWhite;
    end;
    if _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString = 'S' then
    begin
      _dbgListaPreco.Canvas.Font.Color := clWhite;
      _dbgListaPreco.Canvas.Brush.Color := clGreen;
    end;

    defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._dbgListaPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

     VK_F10 :  begin
                 if Confirma('Deseja Cancelar a Lista de Pre?o Fornecedor ?'+#13+
                             ' Aten??o a Lista de Pre?o '+ _cdsListaPrecoAtiva.FieldByName('NR_LISTA') .AsString+ ' Sera Cancelada!!!'  ,MB_DEFBUTTON2)=IDYES then
                 begin
                   if  CancelaListaPrecoExcecao(_cdsListaPrecoAtiva.FieldByName('NR_LISTA') .AsInteger) then
                       _cdsListaPrecoAtiva.delete;
                 end;

              end;
   end;
end;

procedure T_frmTelaCompras._dbfDiasEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsTabelaLeadTime <> nil then
  begin
    if _cdsTabelaLeadTime.Active then
    begin
      if odd(_cdsTabelaLeadTime.RecNo) then
      begin
        _dbgLeadTime.Canvas.Font.Color := clBlack;
        _dbgLeadTime.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgLeadTime.Canvas.Font.Color := clBlack;
        _dbgLeadTime.Canvas.Brush.Color := clWhite;
      end;
    end;

    _dbgLeadTime.Canvas.fillRect(Rect);
    _dbgLeadTime.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._dbgPrazoSCDblClick(Sender: TObject);
var
 idPosicao:TBookmark;
begin
       idPosicao:=_cdsCondicaoPagamento.Bookmark;
       _cdsCondicaoPagamento.edit;
      _cdsCondicaoPagamento.Post;
     _cdsCondicaoPagamento.open;

   if _cdsCondicaoPagamento.RecordCount>1 then
   begin
     _cdsCondicaoPagamento.Bookmark:=idPosicao;
     EliminaCondicaoPagamento;
   end;

end;

procedure T_frmTelaCompras._dbgPrazoSCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 idPosicao:TbookMark;
begin

 case key of
      VK_RETURN: begin
                 _cdsCondicaoPagamento.edit;
                 idPosicao:=_cdsCondicaoPagamento.Bookmark;
                 _cdsCondicaoPagamento.Post;
                  _cdsCondicaoPagamento.open;
                  _cdsCondicaoPagamento.Bookmark:=idPosicao;

                 if _cdsCondicaoPagamentoNR_DIAS.AsInteger=0 then
                 EliminaCondicaoPagamento;
      end;
 end;
end;

procedure T_frmTelaCompras._dbgPrePedidoCellClick(Column: TColumn);
begin
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;



    // SetgraficoVenda;
    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([nrProduto, nrEmpresa]), []) then
    SLEEP(0);
    MostraMedia
end;

procedure T_frmTelaCompras._dbgPrePedidoDblClick(Sender: TObject);
var
  stNomeColuna :String;
  nrEmpresaNova :Integer;
begin
    stNomeColuna:= _dbgPrePedido.SelectedField.FieldName;

    if _cdsPrePedido.FieldByName('CD_CROSSDOCKING').AsInteger>0 then
    begin

    if (nrPedidoAlteracao>0) and idPedidoCrossDocking=true then
    begin
       Mensagem('Pedido ? CrossDocking n?o pode mudar o caminho..',MB_ICONWARNING);
       EXIT;
    end;



    if (stNomeColuna='OCD') and (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  then
    begin
      if confirma('Deseja Mudar Opera??o CrossDocking ?',MB_DEFBUTTON2)=idYes then
      begin
        nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
        nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
        qtdPedido  := _cdsPrePedido.FieldByName('QUAY_Y').AsInteger;



        _cdsPrePedido.OPen;
        _cdsPrePedido.edit;




       idForcaPedidoLocal:=FALSE;
       if  _cdsPrePedido.FieldByName('OCD').Asstring='S' then
       begin
          _cdsPrePedido.FieldByName('OCD').Asstring:='N';
         // Usado para for?a que pedido n?o sera crossDockin
         // idForcaPedidoLocal = false pedido crossdocking
         // idForcaPedidoLocal = true n?o sera crossdocking pedido crossdocking
         idForcaPedidoLocal:=true;
         nrEmpresaOCD:=nrEmpresa;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='N' ) then
         begin
            idForcaPedidoLocal:=true;
            nrEmpresaOCD:=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
          end;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='S' ) then
         begin
            idForcaPedidoLocal:=FALSE;
            nrEmpresaOCD:=_cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').Asinteger;
          end;




         MOSTRAMEDIA;
         DadosItemPedidoLog := LocalizaItemPedido(NrPedido, nrProduto, nrEmpresa);
         ExecutaPreco(nrEmpresaOCD);


       end
       else
       begin
          _cdsPrePedido.FieldByName('OCD').Asstring:='S';
         // Usado para for?a que pedido n?o sera crossDockin
         // idForcaPedidoLocal = false pedido crossdocking
         // idForcaPedidoLocal = true n?o sera crossdocking pedido crossdocking
          idForcaPedidoLocal:=false;

          nrEmpresaOCD:=nrEmpresa;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0) and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='N' ) then
         begin
            idForcaPedidoLocal:=true;
            nrEmpresaOCD:=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
          end;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='S' ) then
         begin
            idForcaPedidoLocal:=FALSE;
            nrEmpresaOCD:=_cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').Asinteger;
          end;


          MOSTRAMEDIA;
         DadosItemPedidoLog := LocalizaItemPedido(NrPedido, nrProduto, nrEmpresa);

         ExecutaPreco(nrEmpresaOCD);

       end;

        GetDadosProduto;



     // SetgraficoVenda;
       if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([nrProduto, _dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger]), []) then
       begin
          SLEEP(0);
          // MostraMedia;
         Mercadoria := DadosProdutos(nrProduto, nrEmpresaOCD, cdoperadorLogisticoPedido);
         precoLista := GetPrecoItem(nrProduto,
                                    nrEmpresaOCD,
                                    vlPrecoLista,
                                    1,
                                    idprecoAtual,
                                    idBloqueiaPedido,
                                    nrListaPrecoExcecao); { ,nrListaPreco };
            vlPrecoLista := precoLista.vlPrecoBase;


          PrecoItem := CalculaPrecoLiquido(vlPrecoLista,
                                           Mercadoria.vlPrecoVenda,
                                           Mercadoria.pcRepasseCompra,
                                           Mercadoria.pcDescontoPadrao,
                                           pcDescontoAdicional,
                                           Mercadoria.pcCreditoICMS,
                                           Mercadoria.pcIpiProduto,
                                           precoLista.PcIPILista,
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


            _lbeDescontoAdicional.Text :=formatfloat('##0.00',_dsPrePedido.DataSet.FieldByName('DADY_Y').Asfloat);

//            pcCreditoICMS := Mercadoria.pcCreditoICMS;
  //          PcIPILista := precoLista.PcIPILista;
    //        if (precoLista.PcIcmsCompra > 0) and
      //        (dtSistema >= strtodate('01/12/2016')) then
        //      pcCreditoICMS := precoLista.PcIcmsCompra;


              pcCreditoICMS := Mercadoria.pcCreditoICMS;
            if nrVerba > 0 then
            begin
              vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba,
                PrecoItem.vlPrecoCusto, Mercadoria.pcIpiProduto, 0,
                Mercadoria.pcCreditoICMS, Mercadoria.nrProduto, Mercadoria.nrTipoProduto,
                DadosItemPedidoLog.nrQuantidadePedido, Mercadoria.nrLaboratorio, Mercadoria.idPis);
            end;

              if   AtualizaItemPedido(nrPedido,
                                   nrProduto,
                                   DadosItemPedidoLog.nrQuantidadePedido, 0,
                                   DadosFornecedor.nrPrazoPedido,
                                   nrVerba,
                                   nrEmpresaNova,
                                   1,
                                   nrDiasEstoqueComPedido,
                                   nrQtdadeSusgetaoPossivel,
                                   'S',
                                   'N',
                                   'N',
                                   DadosItemPedidoLog.pcDescontoPadrao,
                                   DadosItemPedidoLog.pcDescontoAdicional,
                                   0,
                                   pcVerba,
                                   0,
                                   0,
                                   PrecoItem.vlPrecolIquido,
                                   PrecoItem.vlPrecoLista,
                                   PrecoItem.vlPrecoCusto,
                                   0,
                                   0,
                                   vlVerba,
                                   DadosMedia.vlMediaDia,
                                   ' Tela Pedido',
                                    nrEmpresaOCD,
                                    pcCreditoICMS,
                                    precoLista.nrListaPreco,
                                    idAtualizaDesconto,
                                    idBonificado,
                                    precoLista.PcIcmsCompra,
                                    DadosSugestao.NrDiasInformado,
                                    precoLista.vlPrecoBase) then
                        if _cdsPrePedido.Active then
                        begin
                          _cdsPrePedido.Edit;
                          _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := qtdPedido;
                          _cdsPrePedido.FieldByName('VT_ITEM').AsFloat := qtdPedido *PrecoItem.vlPrecolIquido;
                          _cdsPrePedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger := nrDiasEstoqueComPedido;
                          _cdsPrePedido.FieldByName('PUNY_Y').AsFloat := PrecoItem.vlPrecolIquido;
                          _cdsPrePedido.FieldByName('PFBY_Y').AsFloat := PrecoItem.vlPrecoLista;
//                          _cdsPrePedido.FieldByName('ABTY_Y').AsFloat :=pcDescontoPadrao;
                          _cdsPrePedido.FieldByName('DADY_Y').AsFloat := pcDescontoAdicional;
                          TotalizaPedidoMultiEmpresa(stPedidos, 0, '');
                        end;


                                 exit;
                   end;
       end;



       end;
       end;

end;

procedure T_frmTelaCompras._dbgPrePedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsPrePedido.Active then
  begin
    with _dbgPrePedido do
    begin

      if odd(_cdsPrePedido.RecNo) then
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Color := clWhite;
      end;



      if (Column.Field.FieldName) = 'QUAY_Y' then
      begin
        if (_cdsPrePedido.FieldByName('QUAY_Y').AsInteger = 0) then
        begin
          Canvas.Brush.Color := clYellow;
          Canvas.Font.Color := clBlack;
        end;
        if (_cdsPrePedido.FieldByName('QUAY_Y').AsInteger >
          _cdsPrePedido.FieldByName('QT_SUGERIDA').AsInteger) then
        begin
          Canvas.Brush.Color := clRed;
          Canvas.Font.Color := clWhite;
        end;
        if (_cdsPrePedido.FieldByName('QUAY_Y').AsInteger = 0) and
          (_cdsPrePedido.FieldByName('QT_SUGERIDA').AsInteger > 0) then
        begin
          Canvas.Brush.Color := clRed;
          Canvas.Font.Color := clWhite;
        end;

      end;

      if ((TAuxDBGrid(_dbgPrePedido).DataLink.ActiveRecord +
        1 = TAuxDBGrid(_dbgPrePedido).Row) or (gdSelected in State)) then
      begin
        Canvas.Brush.Color := clGreen;
        Canvas.Font.Style := _dbgPrePedido.Canvas.Font.Style + [fsBold];
        Canvas.Font.Color := clWhite;
      end;

      if (gdFocused in State) then
      begin
        Canvas.Brush.Color := clBlue;
        Canvas.Font.Color := clWhite;
      end;


     if (Column.Field.FieldName) = 'OCD' then
     begin
       if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
          (_cdsPrePedido.FieldByName('OCD').AsString='N' ) then
       begin
        Canvas.Brush.Color := clBlack;
        Canvas.Font.Color := clWhite;
       end
      else
      begin
        Canvas.Brush.Color := clGreen;
        Canvas.Font.Color := clWhite;
      end;


     end;


      Canvas.fillRect(Rect);
      defaultDrawColumncell(Rect, DataCol, Column, State);
    end;

  end;

end;

procedure T_frmTelaCompras._dbgPrePedidoEnter(Sender: TObject);
begin
  { idPosicionaProduto := true;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA').AsInteger;
    // SetgraficoVenda;
    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([nrProduto, nrEmpresa]), []) then
    SLEEP(0);
    MostraMedia; }
//   _cdsPrePedido.IndexDefs.Clear;
 // _cdsPrePedido.DeleteIndex(_cdsPrePedido.IndexName);


end;

procedure T_frmTelaCompras._dbgPrePedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 nrEmpresaOCD:Integer;
 idForcaPedidoLocaltEMP:BOOLEAN;
 DadosProdutoCross:TMercadoria;


begin
  case Key of
    VK_RETURN:
      begin


        _cdsPrePedido.Edit;
        _cdsPrePedido.post;
        if (_cdsPrePedido.FieldByName('OCD').Asstring<>'N') and   ((_cdsPrePedido.FieldByName('OCD').Asstring)<>'S')  then
        begin
            Mensagem('Caracter Invalido',MB_ICONWARNING);
            _cdsPrePedido.CancelUpdates;
            exit;
        END;

        _cdsPrePedido.Edit;
        _cdsPrePedido.FieldByName('OCD').readonly:=false;
        _cdsPrePedido.FieldByName('OCD').Asstring:=UpperCase(_cdsPrePedido.FieldByName('OCD').Asstring);
        _cdsPrePedido.post;



          GetDadosProduto;
        idForcaPedidoLocaltEMP:=idForcaPedidoLocal;
         nrEmpresaOCD:=nrEmpresa;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0) and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='N' ) then
         begin
            idForcaPedidoLocal:=true;
            nrEmpresaOCD:=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
            idCrossDocking:='N';
          end;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='S' ) then
         begin
            idForcaPedidoLocal:=FALSE;
            nrEmpresaOCD:=_cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').Asinteger;


          end;






       { idForcaPedidoLocal:=false;
        if (_cdsPrePedido.FieldByName('ID_CROSSDOCKING').Asstring='S') and
            (_cdsPrePedido.FieldByName('OCD').Asstring='N' ) then
        begin
            idForcaPedidoLocal:=true;
            nrEmpresaOCD:=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA').AsInteger;


          // qt_bonificado esta sendo usado como empresa Destino do Item
         if _cdsPrePedido.FieldByName('QT_BONIFICADA').AsInteger>0 then
             nrEmpresaOCD:=_cdsPrePedido.FieldByName('QT_BONIFICADA').AsInteger;}




        DadosProdutoCross:=DadosProdutos(nrProduto,nrEmpresaOCD,cdoperadorLogisticoPedido);

        DadosPrecoUltimaentrada:=SetPrecoUltimaEntrada(nrProduto,nrEmpresaOCD );




        vlPrecoLista:=DadosProdutoCross.vlPrecoCompra;

         precoLista := GetPrecoItem(nrProduto,
                                    nrEmpresaOCD,
                                    vlPrecoLista,
                                     1,
                                     idprecoAtual,
                                     idBloqueiaPedido,
                                     nrListaPrecoExcecao); { ,nrListaPreco };
            vlPrecoLista := precoLista.vlPrecoBase;


          PrecoItem := CalculaPrecoLiquido(vlPrecoLista,
                                           DadosProdutoCross.vlPrecoVenda,
                                           DadosProdutoCross.pcRepasseCompra,
                                           DadosProdutoCross.pcDescontoPadrao,
                                           pcDescontoAdicional,
                                           DadosProdutoCross.pcCreditoICMS,
                                           DadosProdutoCross.pcIpiProduto,
                                           precoLista.PcIPILista,
                                           precoLista.pcReajustePreco,
                                           1,
                                           precoLista.nrListaPreco,
                                           'N',
                                            DadosProdutoCross.idForcaRepasse,
                                            DadosProdutoCross.idIpiLiquidoComRepasse,
                                            DadosProdutoCross.idIpiLiquidoSemRepasse,
                                            DadosProdutoCross.idIpiBrutoComRepasse,
                                            DadosProdutoCross.idIpiBrutoSemRepasse,
                                            DadosProdutoCross.idTipoListaFiscal,
                                            DadosProdutoCross.dsUndidadeFederacaoFornecedor,
                                            DadosProdutoCross.idSuperfulo,
                                            DadosProdutoCross.idIcmDestacado,
                                            DadosProdutoCross.idReduzIcms,
                                            DadosProdutoCross.idPisCofins);






        qtdPedido := _dsPrePedido.DataSet.FieldByName('QUAY_Y').AsInteger;
        nrEmpresa :=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA').AsInteger;
        SetCoresCaixaCamadaPalete(QtdPedido, NrEmbalagemCompra, nrQtdUndCamada, nrQtdUndPalete);

        NrPedido := _cdsPrePedido.FieldByName('NROP_Y').AsInteger;
          if nrpedido=0 then
          begin
              NrPedido := PedidoEmpresa[nrEmpresa];
             // NrPedido := GeraNumeroPedido('C');
             // PedidoEmpresa[nrEmpresa] := NrPedido;

          end;



        pcDescontoAdicional := _cdsPrePedido.FieldByName('DADY_Y').AsFloat;

         IdVendaAutorizada:=SetVendaAutorizadaCrossDocking(nrProduto,_dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger,cdoperadorLogisticoPedido);
         if not  LiberaCompraItem(dtInativacaoFutura,dtBloqueiodeCompra,true,true,IdVendaAutorizada) then
         begin
            _cdsPrePedido.Edit;
            _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := 0;
            _cdsPrePedido.FieldByName('NROP_Y').ReadOnly:=False;
            _cdsPrePedido.FieldByName('NROP_Y').AsInteger :=NrPedido ;
            _cdsPrePedido.FieldByName('NROP_Y').ReadOnly:=TRUE;

            _edtQtdadePedido.Text := '0';
            exit;

         end;


        if (qtdPedido = 0) and (DadosItemPedidoLog.nrQuantidadePedido > 0) then
        begin
          if Confirma('Deseja Eliminar Item do Pedido ?', MB_DEFBUTTON2)
            = IDYES then
          begin
            _cdsPrePedido.Edit;
            _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := 0;
            _edtQtdadePedido.Text := '0';
            GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido,
              pcDescontoAdicional,false);
            _cdsPrePedido.post;

            // AvancaItem;

          end;
        end;

        if qtdPedido > 0 then
        begin
          if _cdsPrePedido.FieldByName('pfby_y').Asfloat>0 then
          begin

          _lbeDescontoAdicional.Text :=formatfloat('##0.00',_dsPrePedido.DataSet.FieldByName('DADY_Y').Asfloat);
          if not  GravaItemPedido(NrPedido, nrProduto, nrEmpresa, qtdPedido,    pcDescontoAdicional,false) then
          begin
              _cdsPrePedido.Edit;
              _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := 0;
              _cdsPrePedido.FieldByName('NROP_Y').ReadOnly:=False;
              _cdsPrePedido.FieldByName('NROP_Y').AsInteger :=NrPedido ;
             exit;
          end;
              _cdsPrePedido.Edit;
            _cdsPrePedido.FieldByName('NROP_Y').ReadOnly:=False;
            _cdsPrePedido.FieldByName('NROP_Y').AsInteger :=NrPedido ;

          _edtQtdadePedido.Text := FormatFloat('######0', qtdPedido);
          end
          else
          begin
            qtdPedido:=0;
            _cdsPrePedido.edit;
            _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := 0;
            _edtQtdadePedido.Text := FormatFloat('######0', qtdPedido);
            mensagem('Produto sem Pre?o',MB_ICONWARNING);
            exit;
          end;

          _edtDiasEstoque.Text := FormatFloat('######0', nrDiasEstoqueComPedido);
          _edtDiasEstoque.SetFocus;

        end;

      end;
  end;
  IdForcaPedidoLocal:=idForcaPedidoLocaltEMP;
end;

procedure T_frmTelaCompras._dbgPrePedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0' .. '9'] = true) then // tenho que colocar n?mero por n?mero?
  begin
    if _dsPrePedido.State in [dsEdit] = false then
      _cdsPrePedido.Edit;

  end;
end;

procedure T_frmTelaCompras._dbgPrePedidoMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  // inicio da tabela pedido
  if _cdsPrePedido.bof then
    idPosicionaProduto := false
  else
    idPosicionaProduto := true;
end;

procedure T_frmTelaCompras._dbgPrePedidoMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  // Final da tabela pedido
  if _cdsPrePedido.eof then
    idPosicionaProduto := false
  else
    idPosicionaProduto := true;
end;

procedure T_frmTelaCompras._dbgPrePedidoTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsPrePedido, Column);
 // _cdsPrePedido.DeleteIndex(_cdsPrePedido.IndexName);
  nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
  nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;



    // SetgraficoVenda;
   if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
   VarArrayOf([nrProduto, nrEmpresa]), []) then
   SLEEP(0);
    MostraMedia


end;

procedure T_frmTelaCompras._dbgSugestaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsSugestaoCompra.RecNo) then
  begin
    _dbgSugestao.Canvas.Font.Color := clBlack;
    _dbgSugestao.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgSugestao.Canvas.Font.Color := clBlack;
    _dbgSugestao.Canvas.Brush.Color := clWhite;
  end;
  _dbgSugestao.Canvas.fillRect(Rect);
  _dbgSugestao.defaultDrawColumncell(Rect, DataCol, Column, State);

end;

procedure T_frmTelaCompras._dbgVendaMesDrawColumnCell(Sender: TObject;
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

procedure T_frmTelaCompras._dbgVendaCanalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // mude a cor das celulas em que valor = 0
  if _cdsVendaCanalOPerador <> nil then
  begin
    with _dbgVendaCanal do
    begin
      if odd(_cdsVendaCanalOPerador.RecNo) then
      begin
        _dbgVendaCanal.Canvas.Font.Color := clBlack;
        _dbgVendaCanal.Canvas.Brush.Color := clMoneyGreen;
      end
      else
      begin
        _dbgVendaCanal.Canvas.Font.Color := clBlack;
        _dbgVendaCanal.Canvas.Brush.Color := clWhite;
      end;
      defaultDrawColumncell(Rect, DataCol, Column, State);
    end;
  end;

end;

procedure T_frmTelaCompras.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // case key of
  // VK_DOWN,VK_UP :MostraMedia;
  // end;
end;


procedure T_frmTelaCompras._dbgPeDiasEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsPeEstoque <> nil then
  begin
    if _cdsPeEstoque.Active then
    begin
      if odd(_cdsPeEstoque.RecNo) then
      begin
        _dbgPeDiasEstoque.Canvas.Font.Color := clBlack;
        _dbgPeDiasEstoque.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgPeDiasEstoque.Canvas.Font.Color := clBlack;
        _dbgPeDiasEstoque.Canvas.Brush.Color := clWhite;
      end;
    end;
    _dbgPeDiasEstoque.Canvas.fillRect(Rect);
    _dbgPeDiasEstoque.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._dbgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsTotalizaPedido <> nil then
  begin
    if _cdsTotalizaPedido.Active then
    begin
      if odd(_cdsTotalizaPedido.RecNo) then
      begin
        _dbgPedido.Canvas.Font.Color := clBlack;
        _dbgPedido.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgPedido.Canvas.Font.Color := clBlack;
        _dbgPedido.Canvas.Brush.Color := clWhite;
      end;
    end;
    _dbgPedido.Canvas.fillRect(Rect);
    _dbgPedido.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._dbgPedidoProntoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsPedido <> nil then
  begin
    if _cdsPedido.Active then
    begin
      if odd(_cdsPedido.RecNo) then
      begin
        _dbgPedidoPronto.Canvas.Font.Color := clBlack;
        _dbgPedidoPronto.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgPedidoPronto.Canvas.Font.Color := clBlack;
        _dbgPedidoPronto.Canvas.Brush.Color := clWhite;
      end;
    end;

    _dbgPedidoPronto.Canvas.fillRect(Rect);
    _dbgPedidoPronto.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmTelaCompras._dbgPedidoProntoTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsPrePedido, Column);
end;

function T_frmTelaCompras.GetPrecoItem(PnrProduto,
                                       PcdEmpresa: Integer;
                                       PvlPrecoFornecedor,
                                       PpcDescontoAbatimento: Double;
                                       PIdPrecoAtual: Char;
                                       PidPedidoBloqueado,
                                       PnrLIstaPrecoAtiva: Integer): TListaPreco;
Var
  DadosListaPreco: TListaPrecoAtiva;
begin
  with _cdsTabelaPreco do
  begin
    Filtered := false;
    filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' AND CD_EMPRESA=' + IntToStr(PcdEmpresa);
    Filtered := true;
    // Params.ParamByName()
  end;
  Result.vlPrecoLista := PvlPrecoFornecedor;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;
  Result.PcDescontoLista := 0;
  Result.PcIcmsCompra := 0;
  Result.pcIcmsVenda     := 0;
  Result.vlBaseVenda     := 0;

  if not _cdsTabelaPreco.IsEmpty then
  begin
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat > 0 then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco    := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase     := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra    := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista      := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
      Result.pcIcmsVenda     := _cdsTabelaPreco.FieldByName('PC_ICMS_VENDA').AsFloat;
      Result.vlBaseVenda     := _cdsTabelaPreco.FieldByName('VL_BASE_VENDA').AsFloat;


    if Result.PcIcmsCompra>0 then
       Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));


    end;
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat = 0 then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA_ANTERIOR').AsFloat;
      Result.PcIPILista := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
      Result.pcIcmsVenda     := _cdsTabelaPreco.FieldByName('PC_ICMS_VENDA').AsFloat;
      Result.vlBaseVenda     := _cdsTabelaPreco.FieldByName('VL_BASE_VENDA').AsFloat;
      if Result.PcIcmsCompra>0 then
         Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));
    end;

    if PidPedidoBloqueado = 1 then
    begin

    end;

    if PIdPrecoAtual = 'N' then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_LISTA_ANTERIOR').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := _cdsTabelaPreco.FieldByName('PC_MUDANCA_PRECO').AsFloat;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
    end;
    if Result.pcReajustePreco < 0 then
      Result.pcReajustePreco := 0;

    if PnrLIstaPrecoAtiva > 0 then
    begin
      DadosListaPreco := SetListaPrecoAtiva(PnrLIstaPrecoAtiva, PnrProduto,
        PcdEmpresa);
      if (DadosListaPreco.vlPrecoLista > 0) then
      begin
        Result.nrListaPreco    := PnrLIstaPrecoAtiva;
        Result.vlPrecoBase     := DadosListaPreco.vlPrecoLista;
        Result.PcDescontoLista := DadosListaPreco.pcDescontoAdicional;
        Result.vlPrecoLista    := DadosListaPreco.vlPrecoComdesconto;
        Result.nrVerba         := DadosListaPreco.nrVerba;
      end;
      if (DadosListaPreco.vlPrecoLista = 0) and
        (DadosListaPreco.pcDescontoAdicional > 0) then
      begin
        Result.PcDescontoLista := DadosListaPreco.pcDescontoAdicional;
        Result.nrVerba := DadosListaPreco.nrVerba;
      end;

    end;

  end;
end;

function T_frmTelaCompras.setEspecialidade(PnrEspecialiade: Integer): String;
begin
  if _cdsEspecealidade <> nil then
  begin
    With _cdsEspecealidade do
    begin
      Filtered := false;
      filter := 'NR_SEQUENCIAL=' + IntToStr(PnrEspecialiade);
      Filtered := true;
    end;
    Result := ' N?o Cadastrada';
    if not _cdsEspecealidade.IsEmpty then
      Result := _cdsEspecealidade.FieldByName('ESPECEALIDADE').AsString
  end;
end;


Function T_frmTelaCompras.AbreEspecealidade(PnrLaboratorio: Integer)
  : TClientDataSet;
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
      Params.ParamByName('PnrLaboratorio').AsBcd := PnrLaboratorio;
      open;
    end;
    Result := nil;
    if not _cdsTemp.IsEmpty then
      Result := _cdsTemp;
  finally
    FreeAndNil(stQry);
    // FreeAndNil(_cdsTemp);
  end;

end;

function T_frmTelaCompras.setQuantidadeEmbalagem(PnrProduto: Integer): Integer;
begin
  if _cdsEmbalagemMercadoria <> nil then
  begin
    With _cdsEmbalagemMercadoria do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto);
      Filtered := true;
    end;
    Result := 00;
    if not _cdsEmbalagemMercadoria.IsEmpty then
      Result := _cdsEmbalagemMercadoria.FieldByName('QT_EMBALAGEM').AsInteger;
  end;
end;

procedure T_frmTelaCompras.SetLocalCd(PnrEmpresa: Integer);
begin

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
 if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'ES' then
  begin
    _edtCD.Color := clFuchsia;
    _edtCD.Font.Color := clBlack;
  end;
 if _cdsProduto.FieldByName('ID_LOCAL_CD').AsString = 'PR' then
  begin
    _edtCD.Color := clGradientActiveCaption;
    _edtCD.Font.Color := clBlack;
  end;

end;


procedure T_frmTelaCompras.CarregaEmpresa;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

      with stQry do
      begin
        Add('SELECT  CD_EMPRESA,ID_UNIDADE_FEDERACAO,NM_EMPRESA,''N'' AS ID_SELECIONADO');
        Add('FROM ACESSO.DC_EMPRESA WHERE ID_EMPRESA_FISICA=''S'' and ID_SITUACAO_EMPRESA=''A''');
        Add('order by CD_EMPRESA')
      end;

      stQry.SaveToFile('c:\temp\qryEmpresa.sql');

      with _cdsEmpresa do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        open;
        First
      end;
      // _cbxEmpresa.Items.Add(FormatFloat('00',0)+' - '+'GERAL');

      if not _cdsEmpresa.IsEmpty then
      begin
        setGridEmpresa(_cdsEmpresa);
      end;

      // _cbxEmpresa.ItemIndex:=0;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.CarregaEmpresaPedido;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
  stPedidoAtivos:String;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';
      stPedidoAtivos:=FiltroPedidoNaoFechados;
      with stQry do
      begin

      Add('SELECT NROP_Y , CAPA.CD_EMPRESA_DESTINO as CD_EMPRESA,ID_UNIDADE_FEDERACAO,');
      Add('NM_EMPRESA,Count(*) nr_item,''N'' as ID_PEDIDO_GERADO,''S'' as ID_SELECIONADO');
     Add('FROM');
     Add('PRDDM.DCPCC CAPA,');
     Add('PRDDM.DCPCI ITEM,');
     Add('ACESSO.DC_EMPRESA CD');
     Add('WHERE');
     Add('NROP_P=NROP_Y');
     Add('AND CD.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
     Add('AND QUAY_Y>0');
     Add('AND ID_EMPRESA_FISICA=''S''');
     Add('AND NROP_Y In('+stPedidoAtivos+')');
     Add('GROUP BY NROP_Y ,CAPA.CD_EMPRESA_DESTINO,NM_EMPRESA,');
     Add('ID_UNIDADE_FEDERACAO');;
      end;
      stQry.SaveToFile('c:\temp\qryEmpresaPedido.sql');
      with _cdsEmpresaPedido do
      begin
        close;
        CommandText := stQry.Text;
        open;
        First
      end;
      setGridPedidoEmpresa(_cdsEmpresaPedido);
      SetEmpresaPedidoFinal(_cdsEmpresaPedido);

    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;

end;


procedure T_frmTelaCompras.setGridEmpresa(PTabela: TClientDataSet);
begin
  TIntegerField(_cdsEmpresa.FieldByName('CD_EMPRESA')).DisplayLabel := 'Nr.CD.';
  TIntegerField(_cdsEmpresa.FieldByName('CD_EMPRESA')).DisplayWidth := 3;

  TStringField(_cdsEmpresa.FieldByName('ID_UNIDADE_FEDERACAO'))
    .DisplayLabel := 'UF';
  TStringField(_cdsEmpresa.FieldByName('ID_UNIDADE_FEDERACAO'))
    .DisplayWidth := 02;

  TStringField(_cdsEmpresa.FieldByName('NM_EMPRESA')).DisplayLabel := 'Nome CD';
  TStringField(_cdsEmpresa.FieldByName('NM_EMPRESA')).DisplayWidth := 30;

  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).DisplayLabel
    := 'Sel.';
  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).DisplayWidth := 03;
  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).Visible := false;

end;



procedure T_frmTelaCompras.setGridPedidoEmpresa(PTabela: TClientDataSet);
begin

  TIntegerField(_cdsEmpresaPedido.FieldByName('NROP_Y')).DisplayLabel := 'Nr.Pedido';
  TIntegerField(_cdsEmpresaPedido.FieldByName('NROP_Y')).DisplayWidth := 10;

  TIntegerField(_cdsEmpresaPedido.FieldByName('CD_EMPRESA')).DisplayLabel := 'Nr.CD.';
  TIntegerField(_cdsEmpresaPedido.FieldByName('CD_EMPRESA')).DisplayWidth := 3;

  TStringField(_cdsEmpresaPedido.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayLabel := 'UF';
  TStringField(_cdsEmpresaPedido.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayWidth := 02;

  TStringField(_cdsEmpresaPedido.FieldByName('NM_EMPRESA')).DisplayLabel := 'Nome CD';
  TStringField(_cdsEmpresaPedido.FieldByName('NM_EMPRESA')).DisplayWidth := 30;

  TIntegerField(_cdsEmpresaPedido.FieldByName('nr_item')).DisplayLabel := 'Nr.Itens';
  TIntegerField(_cdsEmpresaPedido.FieldByName('nr_item')).DisplayWidth := 09;

//--  ,''S'' as
  _cdsEmpresaPedido.FieldByName('ID_PEDIDO_GERADO').Visible :=false;
  _cdsEmpresaPedido.FieldByName('ID_SELECIONADO').Visible :=false;

end;



procedure T_frmTelaCompras.AbreDadosFornecedor(PnrFornecedor: Integer;
  PnrEmpresa: String);
var
  I,  nrReg, cdPrazoPagamento: Integer;
  pcCreditoICMS, PcIPILista,

    vlGrafico1, vlGrafico2, vlGrafico3: Double;
  stMes, stPedido: String;
begin
  InicializaMesSelecionados;
  // Series1.Clear;
  Series2.Clear;
  // Series3.Clear;
  NrFornecedor := StrToIntDef(_edtFornecedor.Text, 0);
  // _stbCompras.Panels[0].Text := 'Aguarde...';
  // _stbCompras.Panels[1].Text := 'Abrindo Tabela proutos fornecedor...';
  // _stbCompras.Refresh;

  _cdsProduto := AbreProdutosLaboratorio(PnrFornecedor, 0, PnrEmpresa);
  if _cdsProduto = nil then
  begin
    Mensagem('Forncedor sem Produtos ativos!!!', MB_ICONWARNING);
    _edtFornecedor.SetFocus;
    exit;
  end;
  if _cdsProduto <> nil then
  begin
    _cdsProduto.open;

//     _cdsProduto.filter:='id_venda_autorizada=''S''';
  //   _cdsProduto.filtered:=true;
    nrCompradorPedido := _cdsProduto.FieldByName('CD_COMPRADOR').AsInteger;

  end;


  _stbCompras.Panels[1].Text := 'Abrindo Pendencia Fornecedor...';
  _stbCompras.refresh;
  _cdsPendencia     := AbrePendenciaLaboratorioNova(PnrFornecedor);
  _stbCompras.Panels[1].Text := 'Abrindo Pendencia Pedidos Faturados...';
  _stbCompras.refresh;
  _cdsPendenciaItem := GetPendenciaFornecedor(PnrFornecedor, 0);

  if _cdsPendenciaItem <> nil then
    _cdsPendenciaItem.open;

  if _cdsPendencia <> nil then
    _cdsPendencia.open;

  _stbCompras.Panels[1].Text := 'Abrindo Tabela LeadTime Fornecedor...';
  _stbCompras.Refresh;
  _cdsTabelaLeadTime := TabelaLeadTimeTermolabil(PnrFornecedor);
  if _cdsTabelaLeadTime <> nil then
  begin
    _dsTabelaLeadTime.DataSet := _cdsTabelaLeadTime;
    _cdsTabelaLeadTime.open;
    SetGridLeadTime;
  end;

  _stbCompras.Panels[1].Text := 'Abrindo Lista Pre?o Fornecedor...';

  ListaPrecoAtivas(PnrFornecedor, 0);

  _cdsDataUltimaCompra := DataUltimaCompraII(PnrFornecedor);

  _cdsEmbalagemMercadoria := GetTabelaQuantidadeEmbalagem(PnrFornecedor);

  _stbCompras.Panels[1].Text := 'Abrindo Tabela Indice de Falta Fornecedor...';

  _cdsIndicedeFalta := AbreIndiceFalta(PnrFornecedor);

  _stbCompras.Panels[1].Text := 'Abrindo Tabela Especealidade Fornecedor...';
  _stbCompras.Refresh;
  _cdsEspecealidade := AbreEspecealidade(PnrFornecedor);

  if _cdsDataUltimaCompra <> nil then
    _cdsDataUltimaCompra.open;

  _stbCompras.Panels[1].Text := 'Abrindo Tabela Lista Pre?o Fornecedor...';
  _stbCompras.Refresh;

  _cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, PnrFornecedor, 0, 0, 'S',dtSistema);

  DadosFornecedor := GetDadosLaboratorio(PnrFornecedor);
  _stbCompras.Panels[1].Text := 'Abrindo Tabela Vendas Fornecedor...';
  _stbCompras.Refresh;

  _cdsVendaFornecedor := AbreVendaLaboratorioMultiEmpresaAtual(PnrFornecedor, 0, 1);
 if (_cdsVendaFornecedor<>nil) then
    if _cdsVendaFornecedor.IsEmpty then
        Mensagem('N?o conseguiu abrir Tabela venda forncedor',MB_ICONWARNING);
  _stbCompras.Panels[1].Text := 'Abrindo Curvas...';
  _stbCompras.Refresh;

 stEmpresaSelecionada := dadosEmpresa.stEmpresa;

  SetTabelasItensCurva(PnrFornecedor, stEmpresaSelecionada);

  if _cdsVendaFornecedor <> nil then
  begin
    _dsVendaFornecedor.DataSet := _cdsVendaFornecedor;
    _cdsVendaFornecedor.open;
    _cdsVendaFornecedor.IndexFieldNames:='CD_EMPRESA;ANO;MES';

  end;
  if _cdsProduto <> nil then
  begin
    _cdsProduto.open;
    _dsProduto.DataSet := _cdsProduto;


    _cdsProduto.RecordCount;

    _cdsProduto.First;
  end;
  if _cdsTabelaLeadTime <> nil then
    _cdsTabelaLeadTime.Filtered := false;
  /// _pgcCompras.ActivePage:=_tbsSugestao;
  // _tbsCompras.Visible:=false;
  _stbCompras.Panels[0].Text := '';
  _stbCompras.Panels[1].Text := 'Leitura Dados Fornecedor completa.';

end;



function T_frmTelaCompras.LocalizaItemPedido(PnrPedido, PnrMercadoria,
  PnrEmpresa: Integer): TDadosItemPedido;
begin
  try

        Result.pcVerba             := _cdsPrePedido.FieldByName('PC_VERBA').AsFloat;
        Result.pcDescontoPadrao    := _cdsPrePedido.FieldByName('ABTY_Y').AsFloat;
        Result.pcDescontoAdicional := _cdsPrePedido.FieldByName('DADY_Y').AsFloat;
        Result.nrMercadoria        := _cdsPrePedido.FieldByName('NROM_Y').AsInteger;
        Result.nrQuantidadePedido  := _cdsPrePedido.FieldByName('QUAY_Y').AsInteger;
        Result.nrVerba             := _cdsPrePedido.FieldByName('NRVV_Y').AsInteger;
        Result.nr_pedido           := _cdsPrePedido.FieldByName('NROP_Y').AsInteger;
        Result.idStatusItem        := _cdsPrePedido.FieldByName('SITY_Y').AsString;
        Result.qtSugerida          := _cdsPrePedido.FieldByName('QT_SUGERIDA').AsInteger;
        Result.nrEmpresa           := _cdsPrePedido.FieldByName('QT_BONIFICADA').AsInteger;
        Result.idItemGravado := true;

  finally
  end;
end;









function T_frmTelaCompras.AbreItemPrePedidoMultiEmpresaNova(PnrFornecedor,PforcaCross:integer;PstPedido,PstEmpresa: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
        stQry.Add('SELECT');
        stQry.Add('NROP_Y ,');
        stQry.Add('CD,');
        stQry.Add(' CASE');
        stQry.Add(' when  idForcaCross=1 AND (CD_CROSSDOCKING>0) AND ( CD_EMPRESA_ORIGEM <> CD_EMPRESA_DESTINO)   THEN ''S''');
        stQry.Add(' WHEN QUAY_Y=0 AND  (CD_CROSSDOCKING>0) AND ( CD_EMPRESA_ORIGEM <> CD_EMPRESA_DESTINO) and idForcaCross=1 THEN ''S''');
        stQry.Add(' ELSE ''N''');
        stQry.Add('END OCD,');
        stQry.Add(' CD_PRODUTO,');
        stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
        stQry.Add(',QT_ESTOQUE');
        stQry.Add(',QT_PENDENCIA');
        stQry.Add(',NR_DIAS_ESTOQUE');
        stQry.Add(',QUAY_Y , QT_SUGERIDA');
        stQry.Add(',CHEY_Y ,ABTY_Y, PFBY_Y');
        stQry.Add(',PUNY_Y , DADY_Y');
        stQry.Add(',VT_ITEM,');
        stQry.Add('VCCI_Y  , SITY_Y ,  PRZY_Y,');
        stQry.Add('DFIY_Y ,  VL_MARGEM_PADRAO,');
        stQry.Add('VL_MARGEM_NEGOCIADA , ID_MARGEM');
        stQry.Add(',ID_DESCONTO_ACUMULATIVO,');
        stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA');
        stQry.Add(',QT_BONIFICADA');
        stQry.Add(',PC_BONIFICACAO');
        stQry.Add(',PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO');
        stQry.Add(', DS_NIVEL_ECNM ,CD_MERCADORIA,');
        stQry.Add('VL_MEDIA_VENDA,NROM_Y,');
        stQry.Add('CD_EMPRESA,CD_INTERNO_LABORATORIO');
        stQry.Add(',ID_CURVA_MERCADORIA');
        stQry.Add(',CD_EMPRESA_CROSSDOCKING');
        stQry.Add(',CD_EMPRESA_ORIGEM');
        stQry.Add(',CD_CROSSDOCKING');
        stQry.Add(' FROM');
        stQry.Add('(SELECT');
        stQry.Add('NVL(NROP_P,0) AS NROP_Y , ');
        stQry.Add('ID_UNIDADE_FEDERACAO AS CD,');
        stQry.Add('PRODUTO.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
        stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
        stQry.Add(',(ESTOQUE.QT_FISICO - ESTOQUE.QT_RESERVADO- ESTOQUE.QT_RESERVA_PROBLEMATICA - ESTOQUE.QT_VENCIDO) AS QT_ESTOQUE');
        stQry.Add(',Nvl(QT_PENDENCIA,0)+Nvl(QT_TRANSFERENCIA,0) +Nvl(QT_TRANSITO,0) AS QT_PENDENCIA');
        stQry.Add(',Nvl(NR_DIAS_ESTOQUE,0) AS NR_DIAS_ESTOQUE');
        stQry.Add(',NVL(QUAY_Y,0) AS QUAY_Y ,NVL(QT_SUGERIDA,0) AS QT_SUGERIDA');
        stQry.Add(',NVL(CHEY_Y,0) AS CHEY_Y ,NVL(ABTY_Y,PC_DESCONTO_PADRAO_COMPRA) AS ABTY_Y,NVL(PFBY_Y,VL_PRECO_COMPRA) AS PFBY_Y');
        stQry.Add(',NVL(PUNY_Y,0) AS PUNY_Y ,NVL(DADY_Y,0) AS DADY_Y');
        stQry.Add(',NVL(PUNY_Y*QUAY_Y,0) as VT_ITEM,');
        stQry.Add('NVL(VCCI_Y,0) AS VCCI_Y  , NVL(SITY_Y,''S'') as SITY_Y , NVL(PRZY_Y,0) AS PRZY_Y,');
        stQry.Add('NVL(DFIY_Y,0) AS DFIY_Y , NVL(VL_MARGEM_PADRAO,0) AS VL_MARGEM_PADRAO,');
        stQry.Add('NVL(VL_MARGEM_NEGOCIADA,0) AS VL_MARGEM_NEGOCIADA ,NVL(ID_MARGEM,''N'') as ID_MARGEM');
        stQry.Add(',nvl(ID_DESCONTO_ACUMULATIVO,0) as ID_DESCONTO_ACUMULATIVO,');
        stQry.Add('nvl(NRVV_Y,0) as NRVV_Y, nvl(PC_VERBA,0) as PC_VERBA ,nvl(VL_VERBA,0) as VL_VERBA ,');
        stQry.Add('QT_BONIFICADA');
        stQry.Add(',nvl(PC_BONIFICACAO,0) as PC_BONIFICACAO,');
        stQry.Add('nvl(PC_DESCONTO_OL,0) as PC_DESCONTO_OL , nvl(NR_OPERADOR_LOGISTICO,CAPA.cd_OPERADOR_LOGISTICO) as NR_OPERADOR_LOGISTICO');
        stQry.Add(',nvl(DS_NIVEL_ECNM,0) as DS_NIVEL_ECNM ,nvl(PRODUTO.CD_MERCADORIA,0) as CD_MERCADORIA,');
        stQry.Add('nvl(ITEM.VL_MEDIA_VENDA,0) as VL_MEDIA_VENDA,nvl(ITEM.NROM_Y,PRODUTO.CD_MERCADORIA) as NROM_Y,');
        stQry.Add('nvl(ITEM.CD_EMPRESA,COMPRA.CD_EMPRESA) as CD_EMPRESA,nvl(CD_INTERNO_LABORATORIO,'' '') as CD_INTERNO_LABORATORIO');
        stQry.Add(',ID_CURVA_MERCADORIA');
        stQry.Add(',:PidForcaCross  as idForcaCross');
        stQry.Add(',CASE');
        stQry.Add(' WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA = CD_EMPRESA_CROSSDOCKING)');
        stQry.Add(' WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN COMPRA.CD_EMPRESA');
        stQry.Add(' ELSE ITEM.CD_EMPRESA');
        stQry.Add('END CD_EMPRESA_CROSSDOCKING');
        stQry.Add(',nvl(CAPA.CD_EMPRESA_DESTINO,COMPRA.CD_EMPRESA) AS CD_EMPRESA_ORIGEM');
        stQry.Add(',COMPRA.CD_EMPRESA_CROSSDOCKING AS CD_CROSSDOCKING');
//        stQry.Add(',ITEM.CD_EMPRESA CD_EMPRESA_DESTINO');
        stQry.Add(',CASE');
        stQry.Add(' when ITEM.CD_EMPRESA<>NULL then ITEM.CD_EMPRESA');
        stQry.Add('WHEN (ITEM.QUAY_Y>0) THEN (SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA = ITEM.CD_EMPRESA)');
        stQry.Add('ELSE (SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA = COMPRA.CD_EMPRESA_CROSSDOCKING)');
        stQry.Add('END CD_EMPRESA_DESTINO');


        stQry.Add('FROM');
        stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
        stQry.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        stQry.Add('PRDDM.DC_FIscal_MERCADORIA FISCAL,');
        stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        stQry.Add('ACESSO.DC_EMPRESA CD,');
        stQry.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
        stQry.Add('LEFT OUTER JOIN PRDDM.DCPCC CAPA ON  CAPA.cd_empresa_destino=ESTOQUE.CD_EMPRESA AND  NROP_P IN('+PstPedido+')');
        stQry.Add('LEFT OUTER JOIN PRDDM.DCPCI ITEM ON  CAPA.NROP_P=NROP_Y AND nrom_y=ESTOQUE.CD_mercadoria');
    //    stQry.Add('LEFT OUTER JOIN PRDDM.DC_ESTOQUE_TRANSFERENCIA TRANS ON TRANS.CD_MERCADORIA=estoque.cd_mercadoria AND TRANS.CD_EMPRESA_DESTINO=capa.CD_EMPRESA_DESTINO');
        stQry.Add('LEFT OUTER JOIN (SELECT');
        stQry.Add('                      NROM_Y, COUNT(*) NR_ITENS, SUM(  QUAY_Y-CHEY_Y) AS QT_PENDENCIA , CD_EMPRESA_DESTINO');
        stQry.Add('                 FROM');
        stQry.Add('                         PRDDM.DCPCI ITEM,');
        stQry.Add('                         PRDDM.DCPCC CAPA,');
        stQry.Add('                          ACESSO.DC_EMPRESA EMP');
        stQry.Add('                 WHERE');
        stQry.Add('                    NROP_P=NROP_Y');
        stQry.Add('                    AND EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
        stQry.Add('                    AND EMP.ID_EMPRESA_FISICA=''S''');
        stQry.Add('                    AND LABP_P=:PnrFornecedor');
        stQry.Add('                    AND SITp_p IN(''N'',''P'')');
        stQry.Add('                    AND SITY_Y IN(''N'',''P'')');
        stQry.Add('   AND ((CAPA.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
//        stQry.Add('                    AND ITEM.cd_operacao_rede IN(0,1)');
        stQry.Add('                    GROUP BY');
        stQry.Add('                    NROM_Y,  CD_EMPRESA_DESTINO) PENDENCIA ON PENDENCIA.NROM_Y=ESTOQUE.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA_DESTINO=ESTOQUE.CD_EMPRESA');
        stQry.Add('left OUTER JOIN PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR  ON OL_FORNECEDOR.CD_OPERADOR= capa.cd_OPERADOR_LOGISTICO  AND OL_FORNECEDOR.CD_FORNECEDOR=Capa.labp_p AND OL_FORNECEDOR.cd_empresa=capa.cd_empresa');
        stQry.Add('');
        stQry.Add('LEFT OUTER JOIN');
        stQry.Add('     (SELECT');
        stQry.Add('CD_MERCADORIA');
        stQry.Add(',CD_EMPRESA_DESTINO');
        stQry.Add(',SUM(NVL(QT_TRANSFERENCIA,0))  AS QT_TRANSFERENCIA');
        stQry.Add(',SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
        stQry.Add('FROM');
        stQry.Add('  PRDDM.DC_ESTOQUE_TRANSFERENCIA');
        stQry.Add('GROUP BY  CD_MERCADORIA,');
        stQry.Add('CD_EMPRESA_DESTINO )  TRANS ON TRANS.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA AND TRANS.CD_EMPRESA_DESTINO=CAPA.CD_EMPRESA_DESTINO');

        stQry.Add('WHERE');
        stQry.Add('PRODUTO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        stQry.Add('AND PRODUTO.ID_SITUACAO_MERCADORIA=''A''');
        stQry.Add('AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
        stQry.Add('AND FINANCEIRO.ID_SITUACAO_MERCADORIA=''A''');
        stQry.Add('AND FISCAL.ID_SITUACAO_MERCADORIA=''A''');
          if _chkPedidoAlimentar.Checked then
             stQry.Add('and PRODUTO.ID_VENDA_MERCADO=''S''');
        stQry.Add('AND ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        stQry.Add('AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
        stQry.Add('AND ESTOQUE.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        stQry.Add('AND ESTOQUE.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
        stQry.Add('AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = compra.cd_empresa),compra.cd_empresa)=FINANCEIRO.CD_EMPRESA');
        stQry.Add('AND ESTOQUE.CD_EMPRESA=FISCAL.CD_EMPRESA');
        stQry.add('AND (COMPRA.CD_MERCADORIA,COMPRA.CD_empresa) NOT IN');
        stQry.add(' (SELECT cd_mercadoria,cd_empresa FROM PRDDM.DC_OPERACAO_REDE_MERCADORIA opr');
        stQry.add('               WHERE iD_EXCLUSIVO_OPERACAO_REDE=''S''');
        stQry.add('                AND ID_SITUACAO=''A'' AND CD_OPERACAO_REDE=6)');



        stQry.Add('AND CD.CD_EMPRESA=COMPRA.CD_EMPRESA');
        stQry.Add('AND ID_EMPRESA_FISICA=''S''');
        stQry.Add('AND ID_VENDA_AUTORIZADA=''S''');
        stQry.Add('AND CD_GRUPO_FORNECEdOR=:PnrFornecedor');
        stQry.Add('AND COMPRA.CD_EMPRESA IN('+PstEmpresa+'))');

        stQry.SaveToFile('C:\temp\qryPrePedidoNova.sql');
        with _cdsPrePedido do
        begin
          close;
          CommandText := stQry.Text;
          Params.ParamByName('PnrFornecedor').AsBCD := PnrFornecedor;
          Params.ParamByName('PidForcaCross').AsBCD  :=PforcaCross;
          // if PnrMercadoria > 0 then
          // Params.ParamByName('PnrMercadoria').AsInteger := PnrMercadoria;
          open;
          First;
        end;
        Result := false;
        // TotalizaPedido(PnrPedidoSC, 0, '');
        if not _cdsPrePedido.IsEmpty then
        begin
          _cdsPrePedido.IndexFieldNames :='nm_mercadoria;ds_apresentacao_mercadoria;cd_produto;CD_EMPRESA';
          SetNomeCampoItemPrePedidoII(_cdsPrePedido);
          Result := true;
        end;
  finally
    FreeAndNil(stQry);
  end;
end;



function T_frmTelaCompras.AbreItemPedidoMultiEmpresa(PstPedido: String;
  PnrMercadoria, PcdEmpresa: Integer; PidSituacao: String): Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('NROP_Y , ');
    stQry.Add('ID_UNIDADE_FEDERACAO AS CD,');
    stQry.Add('CASE');
    stQry.Add('WHEN  CD.CD_EMPRESA=ITEM.CD_EMPRESA THEN ''N''');
    stQry.Add('WHEN  CD.CD_EMPRESA<>ITEM.CD_EMPRESA THEN ''S''');
    stQry.Add('END OCD,');
    stQry.Add('Produto.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
    stQry.Add('QUAY_Y ,QT_SUGERIDA , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
    stQry.Add('PUNY_Y*QUAY_Y as VT_ITEM,');
    stQry.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
    stQry.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
    stQry.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
    stQry.Add('PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,Produto.CD_MERCADORIA,');
    stQry.Add('VL_MEDIA_VENDA,NROM_Y,ITEM.CD_EMPRESA,CAPA.ID_CROSSDOCKING');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('ACESSO.DC_EMPRESA CD');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND CD.CD_EMPRESA=capa.CD_EMPRESA');
    stQry.Add('AND NROM_Y=PRODUTO.CD_MERCADORIA');
    stQry.Add('AND PRODUTO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND capa.CD_EMPRESA_destino=COMPRA.CD_EMPRESA');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND QUAY_Y>0');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND NROP_Y In(' + PstPedido + ')');
    stQry.Add('ORDER BY nm_mercadoria,ds_apresentacao_mercadoria,cd_produto ,ITEM.CD_EMPRESA');
    stQry.SaveToFile('C:\temp\qryItemPedido.sql');

    with _cdsPedido do
    begin
      close;
      CommandText := stQry.Text;
      // Params.ParamByName('PstPedido').AsString := PstPedido;
      // if PnrMercadoria > 0 then
      // Params.ParamByName('PnrMercadoria').AsInteger := PnrMercadoria;
      open;
      First;
    end;
    Result := false;
    // TotalizaPedido(PnrPedidoSC, 0, '');
    _cdsPrePedido.filtered:=false;
    if not _cdsPrePedido.IsEmpty then
    begin
      _cdsPedido.IndexFieldNames :=
        'nm_mercadoria;ds_apresentacao_mercadoria;cd_produto;CD_EMPRESA';
      SetNomeCampoItemPrePedido(_cdsPedido);
      Result := true;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

FUNCTION T_frmTelaCompras.SetEmpresaSelecionadas(PTabela: TClientDataSet)
  : TDadosEmpresa;
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  stcdSelecionado := '';
  cdMaximo := 1;
  Result.stEmpresa := '';
  Result.stUF := '';
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_SELECIONADO=''S''';
      Filtered := true;
      First;
    end;
    while not PTabela.eof do
    begin
      if cdMaximo < PTabela.FieldByName('CD_EMPRESA').AsInteger then
        cdMaximo := PTabela.FieldByName('CD_EMPRESA').AsInteger;

      if stcdSelecionado = '' then
      begin
        Result.stEmpresa := FormatFloat('00', PTabela.FieldByName('CD_EMPRESA')
          .AsInteger);
        Result.stUF := QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO')
          .AsString);
        stcdSelecionado := Result.stUF;
      end
      else
      begin
        Result.stEmpresa := Result.stEmpresa + ',' +
          FormatFloat('00', PTabela.FieldByName('CD_EMPRESA').AsInteger);
        Result.stUF := Result.stUF + ',' +
          QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO').AsString);
      end;

      PTabela.Next;
    end;
    //SetLength(PedidoEmpresa, cdMaximo + 1);
    PTabela.Filtered := false;
  end;

end;


FUNCTION T_frmTelaCompras.FSetEmpresaSelecionadasII(PTabela: TClientDataSet):TClientDataSet;
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_SELECIONADO=''S''';
      Filtered := true;
      First;
    end;
    while  PTabela.eof do
    begin
      PTabela.Filtered := false;
    end;
    result:=PTabela;
    //SetLength(PedidoEmpresa, cdMaximo + 1);
//    PTabela.Filtered := false;
  end;

end;


FUNCTION T_frmTelaCompras.SetEmpresaPedido(PTabela: TClientDataSet;
  PidDesligaFiltro: Boolean): TDadosEmpresa;
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  stcdSelecionado := '';
  cdMaximo := 1;
  Result.stEmpresa := '';
  Result.stUF := '';
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_PEDIDO_GERADO=''N'' AND ID_SELECIONADO=''S''';
      Filtered := true;
      First;
    end;
    while not PTabela.eof do
    begin
      if cdMaximo < PTabela.FieldByName('CD_EMPRESA').AsInteger then
        cdMaximo := PTabela.FieldByName('CD_EMPRESA').AsInteger;

      if stcdSelecionado = '' then
      begin
        Result.stEmpresa := FormatFloat('00', PTabela.FieldByName('CD_EMPRESA')
          .AsInteger);
        Result.stUF := QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO')
          .AsString);
        stcdSelecionado := Result.stUF;
      end
      else
      begin
        Result.stEmpresa := Result.stEmpresa + ',' +
          FormatFloat('00', PTabela.FieldByName('CD_EMPRESA').AsInteger);
        Result.stUF := Result.stUF + ',' +
          QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO').AsString);
      end;

      PTabela.Next;
    end;
    // SetLength(PedidoEmpresa,cdMaximo+1);
    if PidDesligaFiltro then
      PTabela.Filtered := false;
  end;
end;

procedure T_frmTelaCompras.SetEmpresaPedidoInico(PTabela: TClientDataSet);
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_PEDIDO_GERADO=''N'' AND ID_SELECIONADO=''S'' ';
      Filtered := true;
      First;
    end;
  end;

end;

procedure T_frmTelaCompras.SetEmpresaPedidoFinal(PTabela: TClientDataSet);
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_PEDIDO_GERADO=''N''';
      Filtered := true;
      First;
    end;
  end;

end;

procedure T_frmTelaCompras.GeraPedido(PnrFornecedor:Integer;PidExecao:Boolean);
var
  I,  nrReg, cdPrazoPagamento: Integer;
  pcCreditoICMS, PcIPILista,
  PC_REPASSE,VL_BASE_VENDA,
  VlCustoGerencial,
  vlGrafico1,
  vlGrafico2, vlGrafico3, vlPedidoEmpresa: Double;
  unPedidoEmpresa: Integer;
  stMes: String;

begin
  InicializaMesSelecionados;
  // Series1.Clear;
  Series2.Clear;
  // Series3.Clear;
  Series2.Title := 'CD';
  _gridItemCurva.Enabled := false;
  _dbgPeDiasEstoque.Enabled := false;
  _dbgLeadTime.Enabled := false;
  if _cdsProduto <> nil then
  begin

    _cdsProduto.open;
    _dsProduto.DataSet := _cdsProduto;
    _cdsProduto.filter:='ID_COMPRA_BLOQUEADA=''N''';
    _cdsProduto.filtered:=true;

    _cdsProduto.First;
  end;
  nrReg := 0;
  stPedidos := '';
  while not _cdsProduto.eof do
  begin
    inc(nrReg);

    NrPedido := PedidoEmpresa[nrEmpresa];
    NrAuditoria := AuditoriaEmpresa[nrEmpresa];
    // Gravando Capa Pedido;
    if NrPedido = 0 then
    begin
      NrPedido := GeraNumeroPedido('C');
      if NrAuditoria = 0 then
        NrAuditoria := Incrementa('PRDDM.DC_AUDITORIA_COMPRA', 'CD_AUDITORIA');
      AuditoriaEmpresa[nrEmpresa] := NrAuditoria;
      if stPedidos = '' then
        stPedidos := IntToStr(NrPedido)
      else
        stPedidos := stPedidos + ',' + IntToStr(NrPedido);

      PedidoEmpresa[nrEmpresa] := NrPedido;
      vlPedidoEmpresa := ValorSugestaoPedido[nrEmpresa];
      unPedidoEmpresa := UnidadesSugestaoPedido[nrEmpresa];
      cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);

      repeat

        try
          idAuditoria := AuditoriaCompraCapa(NrAuditoria,
            // PCD_AUDITORIA    :Integer;
            dtSistema, // PDT_AUDITORIA    :Tdate;
            nrFornecedorPedido, // PNR_LABORATORIO  :Integer;
            copy(trim(nmModuloPedido), 1, 20), // PDS_MODULO       :String;
            _dtpDataAgendada.Date, // PDT_AGENDA_ANT   :Tdate;
            _dtpProximaAgenda.Date, // PDT_AGENDA_ATUAL :Tdate;
            _lbeGrupoPedido.Text, // PDS_GRUPO_ANT    :String;
            _lbeGrupoPedido.Text, // PDS_GRUPO_ATUAL  :String;
            nrLeadTime, // PNR_LEADTIME_ANT :Integer;
            nrLeadTime, // PNR_LEADTIME_ATUAL:Integer;
            DadosFornecedor.dsDiasPedido, // PDS_DIACOMPRA_ANT:String;
            DadosFornecedor.dsDiasPedido, // PDS_DIACOMPRA_ATUAL:String;
            DadosEstoqueCompra.nrEstoqueMaximo,
            // PNR_PARAM_ESTOQUE_ANT:Integer;
            DadosEstoqueCompra.nrEstoqueMaximo,
            // PNR_PARAM_ESTOQUE_ATUAL:Integer;
            unPedidoEmpresa, // PQT_SUGERIDA_ANT:Integer;
            unPedidoEmpresa, // PQT_SUGERIDA_ATUAL:Integer;
            0, // PQT_COMPRADA:Integer;
            vlPedidoEmpresa, // PVT_SUGERIDO_ANT,
            vlPedidoEmpresa, // PVT_SUGERIDO_ATUAL,
            0, // PVT_COMPRADO:Double;
            idPedidoAgendado, // PID_AGENDADO:String;
            NomeMaquina, // PNM_USUARIO:String;
            0, // PPC_DESC_FIN_ANT,
            0, // PPC_DESC_FIN_ATUAL,
            pcDescontoPadrao, // PPC_DESC_COM_ANT,
            pcDescontoPadrao, // PPC_DESC_COM_ATUAL:Double;
            ' ', // PDS_JUSTIFICATIVA:String;
            cdPrazoPagamento, // PNR_PRAZO_ANT:Integer;
            cdPrazoPagamento, { //PNR_PRAZO_ATUAL:Integer }
            1, NrPedido);
        except
          begin
            idAuditoria := false;
            NrAuditoria := Incrementa('PRDDM.DC_AUDITORIA_COMPRA',
              'CD_AUDITORIA');
            AuditoriaEmpresa[nrEmpresa] := NrAuditoria;

          end;

        end;
      until idAuditoria = true;

      cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);
      {AbreItemPrePedidoMultiEmpresa(stPedidos, // :String;
                       0, // PnrMercadoria,
        nrEmpresa, // PcdEmpresa: Integer;
        ''); // PidSituacao: String): Boolean;}
      NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);

      if StrToIntDef(_edtNrVerbaDesconto.Text,0)>0 then
      begin
         nrGeracaoVerba:=  StrToIntDef(_edtNrVerbaDesconto.Text,0);
         pcGeracaoVerba:=  DadosFornecedor.pcGeracaoVerba;

      end;


      if not GravaCapaPedido(NrPedido, // NROP_P,//  NUMBER(6)
        PnrFornecedor, // LABP_P :Integer;// NUMBER(6)
        dtPedido, // DATP_P :Tdate;// DATE
        pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
        0, // DESP_P:Double;// NUMBER(5,2)
        'S', // SITP_P :String;//CHAR(1)
        DadosFornecedor.nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
        dtPedido + nrLeadTime, // PREP_P          //DATE
        ' ', // CHAR(40)
        TipoPedido, // SNRP_P           //  CHAR(10)
        0, // FLAP_P ,         //NUMBER(1)
        cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
        nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
        strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
        dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
        'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
        cdoperadorLogisticoPedido,
        // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
        NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
        DadosFornecedor.dtAgenda,
        // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
        dtSistema, // DT_DIGITACAO :Tdate;//  DATE
        0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
        0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
        strtodate('01/01/2039'), nrCompradorPedido,
        _cdsProduto.FieldByName('CD_EMPRESA').AsInteger,
        0,
        pcGeracaoVerba,
        nrGeracaoVerba,
        NrDiasEstoqueComprador,
        nrEmpresa,
        'N',0,nrListaPrecoExcecao ) then
      begin
        Mensagem('Erro ao criar Capa Pedido', MB_ICONERROR);
        close;
      end;
    end;

    DadosItemPedidoLog := LocalizaItemPedido(NrPedido, nrProduto, nrEmpresa);

    // if DadosItemPedidoLog. then

    VlCustoGerencial:=Mercadoria.vlCustoGerencial;
    pcCreditoICMS := Mercadoria.pcCreditoICMS;
    PC_REPASSE    :=Mercadoria.pcRepasseCompra;
    PcIPILista := precoLista.PcIPILista;



  //  if (precoLista.PcIcmsCompra > 0) and
  //    (dtSistema >= strtodate('01/12/2016')) then
  //    pcCreditoICMS := precoLista.PcIcmsCompra;  // SS 33688  alterado 01/09/2020
    if (pcDescontoAdicional > 0) and (nrVerba = 0) and
      (_chkUsarUltimoDesconto.Checked)  then
      nrVerba := StrToIntDef(_edtNrVerbaDesconto.Text, 0);
    if (pcDescontoAdicional > 0) and (nrVerba > 0) then
       pcVerba:=100;
//    if (pcDescontoAdicional > 0) and (nrVerba = 0) and
  ///    (_chkUsarUltimoDesconto.Checked)  then
      nrVerba := StrToIntDef(_edtNrVerbaDesconto.Text, 0);
    if (nrVerba > 0) then
       pcVerba:=100;



   if nrVerba > 0 then
   begin
    vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba,
      PrecoItem.vlPrecoCusto, Mercadoria.pcIpiProduto, 0,
      Mercadoria.pcCreditoICMS, Mercadoria.nrProduto, Mercadoria.nrTipoProduto,
      nrQtdadeSusgetaoPossivel, Mercadoria.nrLaboratorio, Mercadoria.idPis);
  end;

//  and (cdoperadorLogisticoPedido = 1)
    if PidExecao then
       nrQtdadeSusgetaoPossivel:=0;
    if DadosItemPedidoLog.nrQuantidadePedido = 0 then
      GravaItemPedidoAtual(NrPedido, // NUMBER(6)
        nrProduto, // NROM_Y ,//NUMBER(6)
        nrQtdadeSusgetaoPossivel, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        DadosFornecedor.nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        PrecoItem.vlPrecolIquido, // PUNY_Y ,//NUMBER(17,6)
        PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoAdicional, // DADY_Y ,//NUMBER(5,2)
        nrReg, // DFIY_Y ,   //NUMBER(5,2)
        PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        nrEmpresaOCD, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6) Ultilizando campo Para marcar o Cd Destino
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoqueComPedido, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrQtdadeSusgetaoInicio, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaDiaCD, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        PrecoItem.pcMundancaPreco,
        nrEmpresa,
        precoLista.PcIcmsCompra,
        PcIPILista,
         pc_Repasse,
         precoLista.vlBaseVenda,
         precoLista.pcIcmsVenda,
         precoLista.PcIcmsCompra,
         NrDiasInformado,
         VlCustoGerencial);

    ManutencaoItemAuditoria(NrPedido, nrProduto, nrQtdadeSusgetaoPossivel,
      nrQtdadeSusgetaoPossivel, nrQtdadeSusgetaoPossivel *
      PrecoItem.vlPrecolIquido, nrQtdadeSusgetaoPossivel *
      PrecoItem.vlPrecolIquido, DadosPendencia.qtPendente, nrQtdEstoque,
      DadosMedia.vlMediaDiaNova * 30, NrDiasEstoque, nrEmpresa, NrPedido,false);

    _stbCompras.Panels[0].Text := 'Montando Previs?o de Compra...';

    _stbCompras.Panels[1].Text := FormatFloat('000000',
      _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString;

    _stbCompras.Panels[2].Text := FormatFloat('000000', _cdsProduto.recordCount)
      + '--> ' + FormatFloat('000000', _cdsProduto.recordCount - nrReg);
    _stbCompras.Refresh;

    Application.ProcessMessages;
    _cdsProduto.Next;
  end;

  _stbCompras.Panels[1].Text := 'Leitura de Dados Completa...';
  _stbCompras.Panels[0].Text := ' ';
  _stbCompras.Panels[2].Text := '';
  _cdsProduto.First;

  { for I := 0 to High(PedidoEmpresa) do
    begin
    if PedidoEmpresa[i]>0 then
    begin
    AtualizaCapaPedido(PedidoEmpresa[i], cdPrazoPagamento, cdoperadorLogisticoPedido,nrLeadTime ,'I', 'tests',FALSE,dtPedido ,dtPedido,dtPedido+DadosFornecedor.nrGrupoFornecedor);
    AtualizaStatusItemPedido(PedidoEmpresa[i], 0, cdoperadorLogisticoPedido,'I');
    end;
    end; }

  {AbreItemPrePedidoMultiEmpresa(stPedidos, // :String;
    0, // PnrMercadoria,
    nrEmpresa, // PcdEmpresa: Integer;
    ''); // PidSituacao: String): Boolean;}

  AbreItemPedidoMultiEmpresa(stPedidos, 0, 0, '');
  TotalizaPedidoMultiEmpresa(stPedidos, 0, '');
 _tbsCompras.TabVisible := true;
  if _cdsPrePedido.Active then
  begin
    _cdsPrePedido.First;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;

    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([nrProduto, nrEmpresa]), []) then
      SLEEP(0);

  end;


end;

Function T_frmTelaCompras.FGeraPedidoNovo(PnrFornecedor,PnrEmpresa,PnrPedido,PcdOperadorLogistico,PnrDias,PidExcecao,PnrListaExcecao:Integer):Integer;
var
  stQry: TStringList;
  qryTemp:TSQLQuery;
begin
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;


     idforcaCross:=0;
     if _chkCrossDocking.Checked then
        idforcaCross:=1;


   stQry:=TStringList.Create;
  try
   try
    with stQry do
    begin
       add('INSERT INTO PRDDM.DCPCI');
       add('        (NROP_Y,');
       add('         NROM_Y,');
       add('         QUAY_Y,');
       add('         CHEY_Y,');
       add('         ABTY_Y,');
       add('         SITY_Y,');
       add('         PRZY_Y,');
       add('         PUNY_Y,');
       add('         PFBY_Y,');
       add('         DADY_Y,');
       add('         DFIY_Y,');
       add('         VCCI_Y,');
       add('         NRVV_Y,');
       add('         VL_MARGEM_PADRAO,');
       add('         VL_MARGEM_NEGOCIADA,');
       add('         ID_MARGEM,');
       add('         ID_DESCONTO_ACUMULATIVO,');
       add('         PC_VERBA,');
       add('         VL_VERBA,');
       add('         QT_BONIFICADA,');
       add('         PC_BONIFICACAO,');
       add('         PC_DESCONTO_OL,');
       add('         NR_OPERADOR_LOGISTICO,');
       add('         NR_DIAS_ESTOQUE,');
       add('         QT_SUGERIDA,');
       add('         VL_MEDIA_VENDA,');
       add('         CD_LISTA_COMPRA,');
       add('         PC_MUDANCA_PRECO,');
       add('         DT_EMPRESA,');
       add('         CD_EMPRESA,');
       add('         ID_NFE_TRANSITO,');
       add('         PC_ICMS_COMPRA,');//PC_ICMS_COMPRA,');
       add('         QT_MERCADORIA_TRANSITO,');
       add('         PC_IPI,');
       add('         CD_OPERACAO_REDE,');
       add('         VL_CUSTO_GERENCIAL,');
       add('         PC_REPASSE,');
       add('         VL_BASE_VENDA,');
       add('         PC_DESCONTO_NEGOCIADO,');
       add('         VL_PRECO_CORRIGIDO,');
       add('         PC_ICMS_NFE,');
       add('         PC_ICMS_VENDA,');
       add('         PC_CREDITO_ICMS,');
       add('         nr_dias_informado)');
       add('                      ');
       add('(  SELECT             ');
       add('   :PnrPedido      ');
       add('  ,CD_MERCADORIA      ');
       add('  ,case');
       Add('    when IdPedidoExcecao=1 then nvl(QT_PEDIDO,0)');
       Add('    else 0');
       Add('  end QT_PEDIDO');
       add('  ,0 QT_ATENDIDA      ');
       add('  ,PC_DESCONTO_PADRAO_COMPRA');
       add('  ,''S'' STATUS');
       add('  ,QT_DIAS_PRAZO_PADRAO');
       add('  ,VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)) PUNY_Y');
       add('  ,VL_UNITARIO_COMPRA PFBY_Y');
       add('  ,PC_DESC_ADICIONAL AS    DADY_Y');
       add('  ,ROW_NUMBER() OVER(ORDER BY CD_MERCADORIA ASC) AS DFIY_Y');
       add('  , ROUND((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)) - VL_REDUCAO)-(VL_PIS+VL_CONFINS) ,4)    VCCI_Y');
       add(', CASE');
       add(' WHEN(NR_VERBA>0) AND (PC_DESC_ADICIONAL>0) THEN NR_VERBA');
       add(' ELSE 0');
       add('END NRVV_Y');
       add('  ,0.00  AS VL_MARGEM_PADRAO');
       add('  ,0.00  AS VL_MARGEM_NEGOCIADA');
       add('  ,''N'' AS ID_MARGEM');
       add(' , ''N''    ID_DESCONTO_ACUMULATIVO');
       add(',CASE');
       add('WHEN(NR_VERBA>0) AND (PC_DESC_ADICIONAL>0) THEN 100');
       add('ELSE  0.00');
       add('END PC_VERBA');
       add(',Case');
       Add(' when (NR_VERBA>0) AND (PC_DESC_ADICIONAL>0) AND (IdPedidoExcecao=1) THEN ROUND(((VL_UNITARIO_COMPRA  + VL_IPI   -  VL_CREDITO_ICMS_SDESC  - VL_PISCONFINS_SDESC) - ');
       Add('     ((Round(VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESC_ADICIONAL)/100)),5)) + VL_IPI_C_DESC   -  VL_CREDITO_ICMS_CDESC  - VL_PISCONFINS_CDESC))*QT_PEDIDO,2) ');
       Add(' else 0');
       add('END VL_VERBA');
       add('  ,0  AS QT_BONIFICADA');
       add(' ,0.00   AS PC_BONIFICACAO');
       add(' ,0.00   AS PC_DESCONTO_OL');
       add(' ,NR_OPERADOR_LOGISTICO');
       Add(',Case ');
       add('  when nvl(MEDIA_PREVISAO,0)>0 then  Round((QT_ESTOQUE+QT_PENDENTE+QT_PEDIDO)/MEDIA_PREVISAO,0)');
       Add('  else 0');
       add(' end  NR_DIAS_ESTOQUE');
       add(' ,          nvl(QT_PEDIDO,0) as QT_PEDIDO');
       add(' ,nvl(MEDIA_PREVISAO,0) AS VL_MEDIA_VENDA');
       add(' ,CD_LISTA_GAM AS CD_LISTA_COMPRA');
       add(' ,0.00   AS PC_MUDANCA_PRECO');
       add(' ,0      AS DT_EMPRESA');
       add(' ,CD_EMPRESA_CROSSDONKING as CD_EMPRESA');
       aDD(',''N'' AS ID_NFE_TRANSITO');
       add(' ,PC_ICMS_COMPRA_LISTA');
       add(' ,0      AS QT_MERCADORIA_TRANSITO');
       add(' ,0.00   AS PC_IPI');
       aDD(' ,0      AS  CD_OPERACAO_REDE');
       Add(', VL_CUSTO_GERENCIAL');
       add(',PC_REPASSE_COMPRA');
       add(' ,VL_BASE_VENDA  AS VL_BASE_VENDA');
       add(' ,NVL(PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL,0)   AS PC_DESCONTO_NEGOCIADO');
       add(' ,0.00   as VL_PRECO_CORRIGIDO');
       add(' ,0.00   AS PC_ICMS_NFE');
       add(' ,PC_ICMS_VENDA   ');
       Add(',PC_CREDITO_ICMS');
       Add(',NR_DIAS_INFORMADO');
       add('FROM');
       add('(   ');
       add('SELECT');
       add(' MEDIA_PREVISAO');
       add(',CD_EMPRESA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_PENDENTE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(',QT_INTEIRA_CAMADA');
       add(' ,CONSUMO_ESTOQUE');
       add(' ,PROJECAO_ESTOQUE');
       add(' ,DT_BLOQUEIO_COMPRA');
       add(' ,DT_INATIVACAO_FUTURA');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',PC_DESCONTO_PADRAO_COMPRA');
       add(',VL_UNITARIO_COMPRA');
       add(',QTD_CAIXA_CAMADA');
       add(',QTD_CAIXA_PALETE');
       add(',FREQUENCIA_COMPRA');
       add(',QT_INTEIRA_CAMADA');
       add(',CD_MERCADORIA');
       add(',DIAS_ESTOQUE_PENDENCIA');
       add(',QT_PEDIDO QT_SUGERIDA');
       add(',CASE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE) * QTD_CAIXA_PALETE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) THEN (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN ROUND((ROUND(QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA,5)/QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0) AND (QT_INTEIRA_CAMADA=0) THEN QT_INTEIRA_CAMADA  * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA=0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO>0) AND (MEDIA_PREVISAO>0) AND ((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME) *MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)>0 THEN ');
       add('  Round((((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME)*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');
       add('  ELSE  QT_PEDIDO');
       add('END QT_PEDIDO');
       add(',nvl(QT_DESVIOPADRAO_VENDA_DIARIA,0) as  QT_DESVIOPADRAO_VENDA_DIARIA');
       add(',CASE');
       add('    when (cd_empresa_crossdocking>0) AND (CD_EMPRESA_CROSSDOCKING<>CD_EMPRESA) AND (idForcaCross=1)  THEN CD_EMPRESA_CROSSDOCKING');
       add('    ELSE CD_EMPRESA');
       add('    END CD_EMPRESA_CROSSDONKING');
    //   add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_CREDITO_ICMS');
       Add(',(VL_UNITARIO_COMPRA -(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) *(PC_CREDITO_ICMS*0.01) VL_REDUCAO');
       Add(',IdPedidoExcecao');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');

       Add(',CASE');
       Add(' WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.076');
       Add('ELSE 0');
       Add('END VL_PIS');
       Add(',CASE');
       Add('WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.0165');
       Add('ELSE 0');
       Add('END VL_CONFINS');

       Add(',Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA)/100))) * (PC_CREDITO_ICMS/100),5)  AS VL_CREDITO_ICMS_SDESC');
       Add(',Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_CREDITO_ICMS/100),5)  AS VL_CREDITO_ICMS_CDESC');
       Add(',CASE');
       Add('WHEN  ID_COFINS=''T'' THEN Round(VL_UNITARIO_COMPRA * 0.0925,5)');
       add('else 0');
       add('END  VL_PISCONFINS_SDESC');
       Add(',CASE');
       Add('WHEN  ID_COFINS=''T'' THEN Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * 0.0925,5)');
       add('else 0');
       add('END  VL_PISCONFINS_CDESC');
       Add(',Round(VL_UNITARIO_COMPRA *(PC_IPI_MERCADORIA/100),5) VL_IPI');
       Add(',Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_IPI_MERCADORIA/100),5) AS   VL_IPI_C_DESC');
       Add(',PC_ICMS_COMPRA_LISTA');
       Add(',Case');
       Add(' when NR_DIAS_INFORMADO>0 then NR_DIAS_INFORMADO');
       Add('Else  NR_DIAS_PADRAO');
       Add('End  NR_DIAS_PEDIDO');
       Add(',NR_DIAS_INFORMADO');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');




       add('FROM');
       add('(');
       add('SELECT');
       add('QT_PEDIDO');
       add(', CASE');
       add('   WHEN (QTD_CAIXA_PALETE>0) THEN  TRUNC((QT_PEDIDO/QTD_CAIXA_PALETE),0)');
       add(' END QT_PARTE_INTEIRA_PALETE');
       add(' ,CASE');
       add('    WHEN  (nvl(MEDIA_PREVISAO,0)>0) AND (QTD_CAIXA_PALETE>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/(QTD_CAIXA_PALETE) - TRUNC(QT_PEDIDO/(QTD_CAIXA_PALETE)),6))*(QTD_CAIXA_PALETE))/MEDIA_PREVISAO,4)');
       add(' END QT_PARTE_FRACAO_PALETE');
       add(' ,CASE');
       add('    WHEN  (nvl(MEDIA_PREVISAO,0)>0) AND (QTD_CAIXA_CAMADA>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA - TRUNC(QT_PEDIDO/QTD_CAIXA_CAMADA),6))*(QTD_CAIXA_CAMADA))/MEDIA_PREVISAO,4)');
       add('END QT_FRACAO_CAMADA');
       add(' ,CASE');
       add('    WHEN (QTD_CAIXA_CAMADA>0) THEN TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA,0)');
       add(' END QT_INTEIRA_CAMADA');
       add(' ,nvl(MEDIA_PREVISAO,0) as MEDIA_PREVISAO');
       add(',CD_EMPRESA');
       add(',CD_MERCADORIA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',PC_DESCONTO_PADRAO_COMPRA');
       add(',CASE');
       add('WHEN VL_COMPRA_EXCECAO>0 THEN VL_COMPRA_EXCECAO');
       add('ELSE VL_UNITARIO_COMPRA');
       add('END VL_UNITARIO_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(' ,PROJECAO_ESTOQUE');
       add(' ,DT_BLOQUEIO_COMPRA');
       add(' ,DT_INATIVACAO_FUTURA');
       add(',QT_SEGURANCA');
       add(',QTD_CAIXA_CAMADA');
       add(',QTD_CAIXA_PALETE');
       add(',FREQUENCIA_COMPRA');
       add(',DIAS_ESTOQUE_PENDENCIA');
       add(',QT_SEGURANCA');
       add(' ,CONSUMO_ESTOQUE');
       add(',QT_DESVIOPADRAO_VENDA_DIARIA');
//       add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CASE');
       add('WHEN CD_LISTA_EXCECAO >0 THEN CD_LISTA_EXCECAO');
       add('ELSE CD_LISTA_GAM');
       add('END CD_LISTA_GAM');
       add(',VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_CREDITO_ICMS');
       add(',QT_PENDENTE');
       Add(',to_number(:PnrDiasInformado) as  NR_DIAS_INFORMADO');
       Add(',:PIdPedidoExcecao as   IdPedidoExcecao');
       Add(',:PidForcaCross as idForcaCross');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');
       Add(',ID_COFINS');
       Add(',PC_IPI_MERCADORIA');
       Add(',CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add(',NR_DIAS_PADRAO');
       Add(',QT_DIAS_MEDIO_LEADTIME');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');


       add('FROM');
       add('(SELECT');
       add(' MEDIA_PREVISAO');
       add(',CD_EMPRESA');
       add(',CD_MERCADORIA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',PC_DESCONTO_PADRAO_COMPRA');
       add(',VL_UNITARIO_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(' ,CONSUMO_ESTOQUE');
       add(' ,PROJECAO_ESTOQUE');
       add(' ,DT_BLOQUEIO_COMPRA');
       add(' ,DT_INATIVACAO_FUTURA');
       add(',QT_SEGURANCA');
       add(',QT_PENDENTE');
       add(',QTD_CAIXA_CAMADA');
       add(',QTD_CAIXA_PALETE');
       add(',FREQUENCIA_COMPRA');
       add(' ,CASE');
       add('   WHEN MEDIA_PREVISAO>0 THEN  ROUND((QT_ESTOQUE + QT_PENDENTE) /MEDIA_PREVISAO,3)');
       add('   ELSE (QT_ESTOQUE + QT_PENDENTE)/.5');
       add('    END  DIAS_ESTOQUE_PENDENCIA');
       add(',CASE');
       add('     WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       add('     WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       add('          (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       add('            AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       add('    WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       add('      ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');

//       add('  WHEN (:PnrDiasInformado>0) AND (MEDIA_PREVISAO>0) AND (:PnrDiasInformado*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)>0 THEN    Round(((:PnrDiasInformado*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');

       add('   ELSE 0');
       add(' END   QT_PEDIDO');
       add(',CASE');
       add('     WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       add('     WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       add('          (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       add('            AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       add('    WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       add('      ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)),0)');
       add('   ELSE 0');
       add(' END   QT_PEDIDO_IDEAL');
       add(',QT_DESVIOPADRAO_VENDA_DIARIA');
//       add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_CREDITO_ICMS');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');
       Add(',ID_COFINS');
       Add(',PC_IPI_MERCADORIA');
       Add(',CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add(',NR_DIAS_PADRAO');
       Add(',QT_DIAS_MEDIO_LEADTIME');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');


       add('FROM');
       add('(SELECT');
       add('CD_EMPRESA');
       add(',CD_MERCADORIA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(',QT_PENDENTE');
       add(' --,MEDIA_PREVISAO');
       add(' ,QT_DIAS_PRAZO_PADRAO');
       add(',QT_DESVIOPADRAO_VENDA_DIARIA');
       add(' ,PC_DESCONTO_PADRAO_COMPRA');
       add(' ,VL_UNITARIO_COMPRA');
       add(' ,MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS CONSUMO_ESTOQUE');
       add(' , (QT_ESTOQUE +QT_PENDENTE) - MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS PROJECAO_ESTOQUE');
       add(' , DT_BLOQUEIO_COMPRA');
       add(' , DT_INATIVACAO_FUTURA');
       add(' , CASE');
       add('   WHEN NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/ VL_INDICE_COMPRA<MEDIA_PREVISAO  THEN');
       add('       ROUND(VLINDICENSPADRAO*SQRT((POWER((NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/VL_INDICE_COMPRA),2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),0)');
       add('  ELSE');
       add('       ROUND(VLINDICENSPADRAO*SQRT((POWER(MEDIA_PREVISAO,2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),3)');
       add('  END  QT_SEGURANCA');
       add('  ,MEDIA_PREVISAO');
       add('  ,QTD_CAIXA_CAMADA');
       add('  ,QTD_CAIXA_PALETE');
       add('  ,FREQUENCIA_COMPRA');
//       add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_CREDITO_ICMS');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');
       Add(',ID_COFINS');
       Add(',PC_IPI_MERCADORIA');
       Add(',CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add(',round(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME,0) as NR_DIAS_PADRAO');
       Add(',QT_DIAS_MEDIO_LEADTIME');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');



       add('FROM');
       add('(SELECT');
       add('ESTOQUE.CD_EMPRESA,');
       add('MERCADORIA.CD_MERCADORIA,');
       add('NM_MERCADORIA ,');
       add('DS_APRESENTACAO_MERCADORIA');
       add(',QT_FISICO-(QT_RESERVADO+QT_RESERVA_PROBLEMATICA+QT_VENCIDO) QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',DT_BLOQUEIO_COMPRA');
       add(',DT_INATIVACAO_FUTURA');
       add(',FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',CASE');
       add('WHEn cd_operador>1 THEN PC_DESCONTO_PADRAO_COMPRA');        //trocado Dia  03/06/2020 confrome SS 31945    //PC_DESCONTO
       add('ELSE PC_DESCONTO_PADRAO_COMPRA');
       add('END PC_DESCONTO_PADRAO_COMPRA');

       add(',NVL(QT_PENDENTE,0)+Nvl(QT_TRANSFERENCIA,0) +Nvl(QT_TRANSITO,0) AS QT_PENDENTE ,');
       add(' CASE');
       add('  WHEN  (COMPRA.cd_empresa_crossdocking>0) AND (VENDA.CD_EMPRESA=1) THEN QT_DIAS_MEDIO_LEADTIME+5');
       add(' ELSE QT_DIAS_MEDIO_LEADTIME');
       add(' END QT_DIAS_MEDIO_LEADTIME ');
       add(' ,QT_DIAS_DESVIOPADRAO_LEADTIME');
       add(',CASE');
       add('   WHEN COMPRA.ID_CURVA_MERCADORIA=''A'' THEN 2.06');
       add('   WHEN COMPRA.ID_CURVA_MERCADORIA=''B'' THEN 1.76');
       add('   ELSE 1.56');
       add(' END VLINDICENSPADRAO,');
       add(' (28/FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE ) AS VL_INDICE_COMPRA');
       add(' ,QT_DESVIOPADRAO_VENDA_DIARIA');
       add(' ,VL_UNITARIO_COMPRA_L,');
       add('  CASE');
       add('    WHEN QT_PREVISAO<> -9999  THEN ROUND(QT_PREVISAO/30,5)');
       add('    ELSE QT_MEDIA_VENDA_DIARIA');
       add(' END MEDIA_PREVISAO');
       add(' ,QT_CAIXA_PALETE');
       add(' ,QT_CAIXA_CAMADA');
       add(' ,QT_CAIXA_CAMADA * QT_EMBALAGEM_COMPRA AS QTD_CAIXA_CAMADA');
       add(', QT_CAIXA_PALETE* QT_EMBALAGEM_COMPRA AS QTD_CAIXA_PALETE');
       add(',GFM.QT_DIAS_FREQUENCIA_COMPRA FREQUENCIA_COMPRA');
       add(',CASE');
       add('  WHEN VL_UNITARIO_COMPRA_L=0 THEN  VL_PRECO_COMPRA');
       add('  ELSE    VL_UNITARIO_COMPRA_L');
       add('  END  VL_UNITARIO_COMPRA');
//       add(',ID_CROSSDOCKING');
       add(',Nvl(:PNR_OPERADOR_LOGISTICO,1) AS NR_OPERADOR_LOGISTICO');
       add(',NVL(CD_LISTA_GAM,0) as CD_LISTA_GAM,  nvl(VL_BASE_VENDA,0) as VL_BASE_VENDA,nvl(PC_ICMS_VENDA,0) as PC_ICMS_VENDA');

       Add(',CASE');
       Add(' WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   nvl(PC_CREDITO_ICMS,0)');
       Add(' WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN  ');
       Add('  (SELECT nvl(PC_CREDITO_ICMS,0) FROM PRDDM.DC_FISCAL_MERCADORIA FISCAL WHERE FISCAL.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('                                AND  CD_EMPRESA=(SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=CD_EMPRESA_CROSSDOCKING))');
       Add('END  PC_CREDITO_ICMS');

//       Add(',Nvl(pc_credito_icms,0) as PC_ICMS_COMPRA');
       Add(',Nvl(PC_ICMS_COMPRA,0) as PC_ICMS_COMPRA_LISTA');

       Add(',round(NVL(PC_DESCONTO_COMPRA,0),2) AS PC_DESC_ADICIONAL');
       Add(',NVL(VL_COMPRA_MERCADORIA,0) AS VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',NVL(PC_REPASSE,0) AS PC_REPASSE');
       Add(',ID_COFINS');
       Add(',Nvl(PC_IPI_MERCADORIA,000.0) AS PC_IPI_MERCADORIA');
       Add(',CASE');
       Add('   WHEN CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING)');
       Add('   WHEN CD_EMPRESA_CROSSDOCKING=0 THEN  COMPRA.cd_Empresa');
       Add('END CD_EMPRESA_CROSSDOCKING');


       Add(' ,CASE');
       Add('    WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   VL_CUSTO_GERENCIAL');
       Add('   WHEN CD_EMPRESA_CROSSDOCKING>0 THEN  (SELECT VL_CUSTO_GERENCIAL FROM PRDDM.DC_FINANCEIRO_MERCADORIA FINAC  WHERE');
       Add('                               FINAC.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  FINAC.CD_EMPRESA=(SELECT CD_EMPRESA_FISICA');
       Add('                                           FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=COMPRA.CD_EMPRESA_CROSSDOCKING))');
       Add('    END  VL_CUSTO_GERENCIAL');
       Add('   ,CASE');
       Add('    WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   PC_REPASSE_COMPRA');
       Add('    WHEN CD_EMPRESA_CROSSDOCKING>0 THEN  (SELECT PC_REPASSE_COMPRA FROM PRDDM.DC_COMPRA_MERCADORIA COMPRA1  WHERE');
       Add('                                         COMPRA1.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  COMPRA1.CD_EMPRESA=(SELECT CD_EMPRESA_FISICA');
       Add('                                         FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=COMPRA.CD_EMPRESA_CROSSDOCKING))');
       Add(' END  PC_REPASSE_COMPRA');




       add('FROM');
       add('  PRDDM.DC_MERCADORIA MERCADORIA,');
       add('  PRDDM.DC_ESTOQUE_MERCADORIA  ESTOQUE,');
       add('  PRDDM.DC_COMPRA_MERCADORIA  COMPRA,');
       add('  PRDDM.DC_FINANCEIRO_MERCADORIA  FINANCEIRO,');
       add('  PRDDM.DC_FISCAL_MERCADORIA  FISCAL,');
       add('  PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
       add('  PRDDM.DC_GRUPO_FORNECEDOR FORNECEDOR,');
       add('  PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM,');

       add('  --PRDDM.DCPCI ITEM_PEDIDO,');
       add('  (SELECT CM.CD_EMPRESA, CM.CD_MERCADORIA,');
       Add('         LP.VL_UNITARIO_COMPRA AS VL_UNITARIO_COMPRA_L,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA, CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA ');
       Add(',CASE');
       Add('    WHEN PC_ICMS_COMPRA>0 THEN   Round((100-(100-PC_ICMS_VENDA)/(100-PC_ICMS_COMPRA)*100),2)');
       Add('    ELSE  0');
       Add(' END  PC_REPASSE');

       add('       FROM');
       add('       PRDDM.DC_COMPRA_MERCADORIA CM,');
       add('       PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
       add('       WHERE');
       add('          CM.CD_MERCADORIA=LP.CD_MERCADORIA');
       add('          AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),CM.cd_empresa) = LP.CD_EMPRESA');
       add('          AND CM.ID_SITUACAO_MERCADORIA=''A''');
       add('          AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
       add('          AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
       add('                                  FROM');
       add('                                    PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF,');
       add('                                    PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       add('                                  WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
       add('                                  AND COMPRA.CD_MERCADORIA=LPF.CD_MERCADORIA');
       add('                                  AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),compra.cd_empresa)=LPF.CD_EMPRESA');
       add('                                  AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
       add('                                  AND LPF.DT_MUDANCA_PRECO <= SYSDATE)) LISTA_PRECO,');
       add('  (SELECT NROM_Y,CD_EMPRESA_DESTINO,LABP_P,SUM(QUAY_Y-CHEY_Y) QT_PENDENTE');
       add('   FROM');
       add('     PRDDM.DCPCC C,');
       add('     PRDDM.DCPCI I,');
       add('     ACESSO.DC_EMPRESA emp');
       add('  WHERE');
       add('   NROP_P=NROP_Y');
       add('   AND SITY_Y IN(''N'',''P'')');
       add('   AND SITP_P IN(''N'',''P'')');
       Add('   AND EMP.CD_EMPRESA=C.CD_EMPRESA_DESTINO');
       Add('   AND EMP.ID_EMPRESA_FISICA=''S''');
       Add('   AND ((c.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'') ) OR  c.CD_OPERACAO_REDE=0)');
//       add('  AND C.CD_EMPRESA_destino=I.CD_EMPRESA');
       add('  AND LABP_P=:PnrFornecedor');
       add('  GROUP BY NROM_Y,CD_EMPRESA_DESTINO,LABP_P) PENDENCIA,');

       add(' ( SELECT  cd_mercadoria');
       add('   ,cd_empresa_destino');
       add('   ,Sum(qt_transferencia) AS qt_transferencia');
       add('  , Sum(qt_transito) AS   qt_transito');
       add(' FROM PRDDM.DC_ESTOQUE_TRANSFERENCIA');
       add(' GROUP BY cd_mercadoria');
       add('  ,cd_empresa_destino) TRANS,');

       add('  PRDDM.DC_LEADTIME_FORNECEDOR  LTIME,');
       add('  PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR');

       add(',(SELECT');
       add('CD_PRECO_FORNECEDOR_EXCECAO AS CD_LISTA_EXCECAO,');
       add('    CM.CD_EMPRESA,  LPE.CD_MERCADORIA,');
       add('    VL_COMPRA_MERCADORIA,');
       add('    VL_COMPRA_MERCADORIA_DESCONTO,');
       add('    PC_DESCONTO_COMPRA,');
       add('    NR_VERBA');
       add('FROM');
       add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPE,');
       add('prddM.DC_COMPRA_MERCADORIA cm');
       add('WHERE');
       add('LPE.CD_MERCADORIA=CM.CD_MERCADORIA');
       add('AND LPE.CD_EMPRESA=(SELECT cd_empresa_fisica  FROM acesso.dc_empresa WHERE  (CD_EMPRESA_CROSSDOCKING >0 AND cd_empresa = CD_EMPRESA_CROSSDOCKING) OR ( CD_EMPRESA_CROSSDOCKING =0 AND cd_empresa=cm.cd_empresa))');
       add('AND CM.CD_EMPRESA=:PnrEmpresa');
       add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       add('AND CD_PRECO_FORNECEDOR_EXCECAO=:PnrLista) LISTA_EXCECAO');



       add(',(SELECT');
       add('COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
       add('CASE');
       add(' when  QT_PREVISAO>0 then QT_PREVISAO');
       add(' when  QT_PREVISAO<=0 then 0');
       add(' when QT_PREVISAO is null then -9999');
       add('END QT_PREVISAO,');
       add('Nvl(DT_PREVISAO ,TRUNC(sysdate,''MONTH'')) AS DT_PREVISAO');
       add('FROM');
       add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
       add('GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
       Add('WHERE');
       Add(' PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
       Add('AND DT_PREVISAO(+)=TRUNC(sysdate,''MONTH'')) PREVISAO_NOVA');

       add('WHERE');
       add(' MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
       add(' AND COMPRA.CD_GRUPO_FORNECEDOR=LTIME.CD_GRUPO_FORNECEDOR(+)');
       add('   AND CD_LEADTIME=4');
       add('   AND COMPRA.CD_EMPRESA=LTIME.CD_EMPRESA(+)');
       add('   AND ID_TERMOLABIL=''N''');
       add('   AND OL_FORNECEDOR.CD_OPERADOR(+)=:PNR_OPERADOR_LOGISTICO');
       Add('AND OL_FORNECEDOR.CD_empresa(+)= COMPRA.cd_empresa');
       add('   AND OL_FORNECEDOR.CD_FORNECEDOR(+)=COMPRA.CD_GRUPO_FORNECEDOR');
       add('');
       add(' AND COMPRA.CD_GRUPO_FORNECEDOR= FORNECEDOR.CD_GRUPO_FORNECEDOR');
       add(' AND GFM.ID_CURVA_MERCADORIA       = COMPRA.ID_CURVA_MERCADORIA');
       add(' AND GFM.CD_GRUPO_CURVA_FABRICANTE = FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       add(' AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND FINANCEIRO.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND FISCAL.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND FISCAL.ID_VENDA_AUTORIZADA=''S''');
       add(' AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       add(' AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
       add(' AND FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       add(' AND FINANCEIRO.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
       add(' AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
       add(' AND FINANCEIRO.CD_EMPRESA=FISCAL.CD_EMPRESA');
       add(' AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');


       add('AND COMPRA.CD_MERCADORIA=LISTA_EXCECAO.CD_MERCADORIA(+)');
       add('AND COMPRA.CD_EMPRESA=LISTA_EXCECAO.CD_EMPRESA(+)');
        if _chkPedidoAlimentar.Checked then
            add('and MERCADORIA.ID_VENDA_MERCADO=''S''');
       add(' AND COMPRA.CD_EMPRESA=:PnrEmpresa');
 //      add(' --LIGA?AO LISTA PRECO');
       add(' AND COMPRA.CD_MERCADORIA=LISTA_PRECO.CD_MERCADORIA(+)');
       add(' AND COMPRA.CD_EMPRESA=LISTA_PRECO.CD_EMPRESA(+)');
    //   add(' --LIGA??O VENDA');
       add('  AND  COMPRA.CD_MERCADORIA=VENDA.CD_MERCADORIA(+)');
       add('  AND CD_CANAL=0');
       add('  AND  COMPRA.CD_EMPRESA=VENDA.CD_EMPRESA');
       add('  AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
       add(' (SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
       add('               WHERE id_exclusivo_operacao_rede=''S''');
       add('                AND id_situacao=''A'' AND cd_operacao_rede=6)');
       add('  AND   VENDA.DT_VENDA_MERCADORIA>=(SELECT Max(DT_VENDA_MERCADORIA)   FROM prddm.dw_venda_acumulada_mercadoria WHERE cd_canal=0)');

       add('AND COMPRA.CD_MERCADORIA=PREVISAO_NOVA.cd_mercadoria(+)');
       add('AND COMPRA.CD_EMPRESA=PREVISAO_NOVA.CD_EMPRESA(+)');

       add('  AND COMPRA.CD_GRUPO_FORNECEDOR=PENDENCIA.LABP_P(+)');
       add('  AND COMPRA.CD_MERCADORIA=NROM_Y(+)');
       add('  AND COMPRA.CD_EMPRESA=PENDENCIA.CD_EMPRESA_DESTINO(+)');
       add('  AND COMPRA.CD_MERCADORIA=TRANS.CD_MERCADORIA(+)');
       add('  AND COMPRA.CD_EMPRESA=TRANS.CD_EMPRESA_DESTINO(+) ))))))');
    end;
    stQry.SaveToFile('C:\temp\Compras_qryInsereitemPedido.sql');
    with qryTemp do
    begin
      SQL.Add(stQry.Text);
      ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
      ParamByName('PnrEmpresa').AsBCD:=PnrEmpresa;
      ParamByName('PnrPedido').AsBCD:=PnrPedido;
      ParamByName('PnrDiasInformado').AsString:=inttostr(PnrDias);
      ParamByName('PIdPedidoExcecao').AsString:=inttostr(PidExcecao);
      ParamByName('PNR_OPERADOR_LOGISTICO').AsBCD:= PcdOperadorLogistico;
      ParamByName('PidForcaCross').AsBCD:=idforcaCross;
      ParamByName('PnrLista').asbcd:=PnrListaExcecao;

      Result:=ExecSQL(FALSE);


    end;



  except
      on E: Exception do
           begin
             ShowMessage(E.Message);
           end;

  end;
finally
    freeandnil(stQry);
end;

end;





Function T_frmTelaCompras.FGeraPedidoNovoII(PnrFornecedor,PnrEmpresa,PnrPedido,PcdOperadorLogistico,PnrDias,PidExcecao,PnrListaExcecao:Integer):Integer;
var
  stQry: TStringList;
  qryTemp:TSQLQuery;
begin
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;


     idforcaCross:=0;
     if _chkCrossDocking.Checked then
        idforcaCross:=1;


   stQry:=TStringList.Create;
  try
   try
    with stQry do
    begin
       add('INSERT INTO PRDDM.DCPCI');
       add('        (NROP_Y,');
       add('         NROM_Y,');
       add('         QUAY_Y,');
       add('         CHEY_Y,');
       add('         ABTY_Y,');
       add('         SITY_Y,');
       add('         PRZY_Y,');
       add('         PUNY_Y,');
       add('         PFBY_Y,');
       add('         DADY_Y,');
       add('         DFIY_Y,');
       add('         VCCI_Y,');
       add('         NRVV_Y,');
       add('         VL_MARGEM_PADRAO,');
       add('         VL_MARGEM_NEGOCIADA,');
       add('         ID_MARGEM,');
       add('         ID_DESCONTO_ACUMULATIVO,');
       add('         PC_VERBA,');
       add('         VL_VERBA,');
       add('         QT_BONIFICADA,');
       add('         PC_BONIFICACAO,');
       add('         PC_DESCONTO_OL,');
       add('         NR_OPERADOR_LOGISTICO,');
       add('         NR_DIAS_ESTOQUE,');
       add('         QT_SUGERIDA,');
       add('         VL_MEDIA_VENDA,');
       add('         CD_LISTA_COMPRA,');
       add('         PC_MUDANCA_PRECO,');
       add('         DT_EMPRESA,');
       add('         CD_EMPRESA,');
       add('         ID_NFE_TRANSITO,');
       add('         PC_ICMS_COMPRA,'); //PC_ICMS_COMPRA //L?o
       add('         QT_MERCADORIA_TRANSITO,');
       add('         PC_IPI,');
       add('         CD_OPERACAO_REDE,');
       add('         VL_CUSTO_GERENCIAL,');
       add('         PC_REPASSE,');
       add('         VL_BASE_VENDA,');
       add('         PC_DESCONTO_NEGOCIADO,');
       add('         VL_PRECO_CORRIGIDO,');
       add('         PC_ICMS_NFE,');
       add('         PC_ICMS_VENDA,');
       add('         PC_ICMS_COMPRA,'); // PC_CREDITO_ICMS
       add('         nr_dias_informado)');
       add('                      ');
       add('(  SELECT             ');
       add('   :PnrPedido      ');
       add('  ,CD_MERCADORIA      ');
       add('  ,case');
       Add('    when IdPedidoExcecao=1 then nvl(QT_PEDIDO,0)');
       Add('    else 0');
       Add('  end QT_PEDIDO');
       add('  ,0 QT_ATENDIDA      ');
       add('  ,PC_DESCONTO_PADRAO_COMPRA');
       add('  ,''S'' STATUS');
       add('  ,QT_DIAS_PRAZO_PADRAO');
       add('  ,VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)) PUNY_Y');
       add('  ,VL_UNITARIO_COMPRA PFBY_Y');
       add('  ,PC_DESC_ADICIONAL AS    DADY_Y');
       add('  ,ROW_NUMBER() OVER(ORDER BY CD_MERCADORIA ASC) AS DFIY_Y');
       add('  , ROUND((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)) - VL_REDUCAO)-(VL_PIS+VL_CONFINS) ,4)    VCCI_Y');
       add(', CASE');
       add(' WHEN(NR_VERBA>0) AND (PC_DESC_ADICIONAL>0) THEN NR_VERBA');
       add(' ELSE 0');
       add('END NRVV_Y');
       add('  ,0.00  AS VL_MARGEM_PADRAO');
       add('  ,0.00  AS VL_MARGEM_NEGOCIADA');
       add('  ,''N'' AS ID_MARGEM');
       add(' , ''N''    ID_DESCONTO_ACUMULATIVO');
       add(',CASE');
       add('WHEN(NR_VERBA>0) AND (PC_DESC_ADICIONAL>0) THEN 100');
       add('ELSE  0.00');
       add('END PC_VERBA');
       add(',Case');
       Add(' when (NR_VERBA>0) AND (PC_DESC_ADICIONAL>0) AND (IdPedidoExcecao=1) THEN ROUND(((VL_UNITARIO_COMPRA  + VL_IPI   -  VL_CREDITO_ICMS_SDESC  - VL_PISCONFINS_SDESC) - ');
       Add('     ((Round(VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESC_ADICIONAL)/100)),5)) + VL_IPI_C_DESC   -  VL_CREDITO_ICMS_CDESC  - VL_PISCONFINS_CDESC))*QT_PEDIDO,2) ');
       Add(' else 0');
       add('END VL_VERBA');
       add('  ,0  AS QT_BONIFICADA');
       add(' ,0.00   AS PC_BONIFICACAO');
       add(' ,0.00   AS PC_DESCONTO_OL');
       add(' ,NR_OPERADOR_LOGISTICO');
       Add(',Case ');
       add('  when MEDIA_PREVISAO>0 then  Round((QT_ESTOQUE+QT_PENDENTE+QT_PEDIDO)/MEDIA_PREVISAO,0)');
       Add('  else 0');
       add(' end  NR_DIAS_ESTOQUE');
       add(' ,          nvl(QT_PEDIDO,0) as QT_PEDIDO');
       add(' ,MEDIA_PREVISAO AS VL_MEDIA_VENDA');
       add(' ,CD_LISTA_GAM AS CD_LISTA_COMPRA');
       add(' ,0.00   AS PC_MUDANCA_PRECO');
       add(' ,0      AS DT_EMPRESA');
       add(' ,CD_EMPRESA_CROSSDONKING as CD_EMPRESA');
       aDD(',''N'' AS ID_NFE_TRANSITO');
       add(' ,PC_ICMS_COMPRA  AS PC_ICMS_COMPRA');
       add(' ,0      AS QT_MERCADORIA_TRANSITO');
       add(' ,0.00   AS PC_IPI');
       aDD(' ,0      AS  CD_OPERACAO_REDE');
       Add(', VL_CUSTO_GERENCIAL AS VL_CUSTO_GERENCIAL');
       add(',PC_REPASSE_COMPRA');
       add(' ,VL_BASE_VENDA  AS VL_BASE_VENDA');
       add(' ,NVL(PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL,0)   AS PC_DESCONTO_NEGOCIADO');
       add(' ,0.00   as VL_PRECO_CORRIGIDO');
       add(' ,0.00   AS PC_ICMS_NFE');
       add(' ,PC_ICMS_VENDA   AS PC_ICMS_VENDA');
       Add(',PC_ICMS_COMPRA_LISTA');
       Add(',NR_DIAS_INFORMADO');
       add('FROM');
       add('(   ');
       add('SELECT');
       add(' MEDIA_PREVISAO');
       add(',CD_EMPRESA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_PENDENTE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(',QT_INTEIRA_CAMADA');
       add(' ,CONSUMO_ESTOQUE');
       add(' ,PROJECAO_ESTOQUE');
       add(' ,DT_BLOQUEIO_COMPRA');
       add(' ,DT_INATIVACAO_FUTURA');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',PC_DESCONTO_PADRAO_COMPRA');
       add(',VL_UNITARIO_COMPRA');
       add(',QTD_CAIXA_CAMADA');
       add(',QTD_CAIXA_PALETE');
       add(',FREQUENCIA_COMPRA');
       add(',QT_INTEIRA_CAMADA');
       add(',CD_MERCADORIA');
       add(',DIAS_ESTOQUE_PENDENCIA');
       add(',QT_PEDIDO QT_SUGERIDA');
       add(',CASE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE) * QTD_CAIXA_PALETE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) THEN (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       add('  WHEN (NR_DIAS_INFORMADO=0) and ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN ROUND((ROUND(QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA,5)/QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0) AND (QT_INTEIRA_CAMADA=0) THEN QT_INTEIRA_CAMADA  * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA=0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       add('  WHEN (NR_DIAS_INFORMADO>0) AND (MEDIA_PREVISAO>0) AND ((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME) *MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)>0 THEN ');
       add('  Round((((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME)*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');
       add('  ELSE  QT_PEDIDO');
       add('END QT_PEDIDO');
       add(',nvl(QT_DESVIOPADRAO_VENDA_DIARIA,0) as  QT_DESVIOPADRAO_VENDA_DIARIA');
       add(',CASE');
       add('    when (cd_empresa_crossdocking>0) AND (CD_EMPRESA_CROSSDOCKING<>CD_EMPRESA) AND (idForcaCross=1)  THEN CD_EMPRESA_CROSSDOCKING');
       add('    ELSE CD_EMPRESA');
       add('    END CD_EMPRESA_CROSSDONKING');
    //   add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_ICMS_COMPRA');
       Add(',(VL_UNITARIO_COMPRA -(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) *(PC_ICMS_COMPRA*0.01) VL_REDUCAO');
       Add(',IdPedidoExcecao');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');

       Add(',CASE');
       Add(' WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.076');
       Add('ELSE 0');
       Add('END VL_PIS');
       Add(',CASE');
       Add('WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.0165');
       Add('ELSE 0');
       Add('END VL_CONFINS');

       Add(',Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA)/100))) * (PC_ICMS_COMPRA/100),5)  AS VL_CREDITO_ICMS_SDESC');
       Add(',Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_ICMS_COMPRA/100),5)  AS VL_CREDITO_ICMS_CDESC');
       Add(',CASE');
       Add('WHEN  ID_COFINS=''T'' THEN Round(VL_UNITARIO_COMPRA * 0.0925,5)');
       add('else 0');
       add('END  VL_PISCONFINS_SDESC');
       Add(',CASE');
       Add('WHEN  ID_COFINS=''T'' THEN Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * 0.0925,5)');
       add('else 0');
       add('END  VL_PISCONFINS_CDESC');
       Add(',Round(VL_UNITARIO_COMPRA *(PC_IPI_MERCADORIA/100),5) VL_IPI');
       Add(',Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_IPI_MERCADORIA/100),5) AS   VL_IPI_C_DESC');
       Add(',PC_ICMS_COMPRA_LISTA');
       Add(',Case');
       Add(' when NR_DIAS_INFORMADO>0 then NR_DIAS_INFORMADO');
       Add('Else  NR_DIAS_PADRAO');
       Add('End  NR_DIAS_PEDIDO');
       Add(',NR_DIAS_INFORMADO');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');



       add('FROM');
       add('(');
       add('SELECT');
       add('QT_PEDIDO');
       add(', CASE');
       add('   WHEN (QTD_CAIXA_PALETE>0) THEN  TRUNC((QT_PEDIDO/QTD_CAIXA_PALETE),0)');
       add(' END QT_PARTE_INTEIRA_PALETE');
       add(' ,CASE');
       add('    WHEN  (MEDIA_PREVISAO>0) AND (QTD_CAIXA_PALETE>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/(QTD_CAIXA_PALETE) - TRUNC(QT_PEDIDO/(QTD_CAIXA_PALETE)),6))*(QTD_CAIXA_PALETE))/MEDIA_PREVISAO,4)');
       add(' END QT_PARTE_FRACAO_PALETE');
       add(' ,CASE');
       add('    WHEN  (MEDIA_PREVISAO>0) AND (QTD_CAIXA_CAMADA>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA - TRUNC(QT_PEDIDO/QTD_CAIXA_CAMADA),6))*(QTD_CAIXA_CAMADA))/MEDIA_PREVISAO,4)');
       add('END QT_FRACAO_CAMADA');
       add(' ,CASE');
       add('    WHEN (QTD_CAIXA_CAMADA>0) THEN TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA,0)');
       add(' END QT_INTEIRA_CAMADA');
       add(' ,MEDIA_PREVISAO');
       add(',CD_EMPRESA');
       add(',CD_MERCADORIA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',PC_DESCONTO_PADRAO_COMPRA');
       add(',CASE');
       add('WHEN VL_COMPRA_EXCECAO>0 THEN VL_COMPRA_EXCECAO');
       add('ELSE VL_UNITARIO_COMPRA');
       add('END VL_UNITARIO_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(' ,PROJECAO_ESTOQUE');
       add(' ,DT_BLOQUEIO_COMPRA');
       add(' ,DT_INATIVACAO_FUTURA');
       add(',QT_SEGURANCA');
       add(',QTD_CAIXA_CAMADA');
       add(',QTD_CAIXA_PALETE');
       add(',FREQUENCIA_COMPRA');
       add(',DIAS_ESTOQUE_PENDENCIA');
       add(',QT_SEGURANCA');
       add(' ,CONSUMO_ESTOQUE');
       add(',QT_DESVIOPADRAO_VENDA_DIARIA');
//       add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CASE');
       add('WHEN CD_LISTA_EXCECAO >0 THEN CD_LISTA_EXCECAO');
       add('ELSE CD_LISTA_GAM');
       add('END CD_LISTA_GAM');
       add(',VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_ICMS_COMPRA');
       add(',QT_PENDENTE');
       Add(',to_number(:PnrDiasInformado) as  NR_DIAS_INFORMADO');
       Add(',:PIdPedidoExcecao as   IdPedidoExcecao');
       Add(',:PidForcaCross as idForcaCross');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');
       Add(',ID_COFINS');
       Add(',PC_IPI_MERCADORIA');
       Add(',CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add(',NR_DIAS_PADRAO');
       Add(',QT_DIAS_MEDIO_LEADTIME');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');



       add('FROM');
       add('(SELECT');
       add(' MEDIA_PREVISAO');
       add(',CD_EMPRESA');
       add(',CD_MERCADORIA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',PC_DESCONTO_PADRAO_COMPRA');
       add(',VL_UNITARIO_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(' ,CONSUMO_ESTOQUE');
       add(' ,PROJECAO_ESTOQUE');
       add(' ,DT_BLOQUEIO_COMPRA');
       add(' ,DT_INATIVACAO_FUTURA');
       add(',QT_SEGURANCA');
       add(',QT_PENDENTE');
       add(',QTD_CAIXA_CAMADA');
       add(',QTD_CAIXA_PALETE');
       add(',FREQUENCIA_COMPRA');
       add(' ,CASE');
       add('   WHEN MEDIA_PREVISAO>0 THEN  ROUND((QT_ESTOQUE + QT_PENDENTE) /MEDIA_PREVISAO,3)');
       add('   ELSE (QT_ESTOQUE + QT_PENDENTE)/.5');
       add('    END  DIAS_ESTOQUE_PENDENCIA');
       add(',CASE');
       add('     WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       add('     WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       add('          (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       add('            AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       add('    WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       add('      ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');

//       add('  WHEN (:PnrDiasInformado>0) AND (MEDIA_PREVISAO>0) AND (:PnrDiasInformado*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)>0 THEN    Round(((:PnrDiasInformado*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');

       add('   ELSE 0');
       add(' END   QT_PEDIDO');
       add(',CASE');
       add('     WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       add('     WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       add('          (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       add('            AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       add('    WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       add('      ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)),0)');
       add('   ELSE 0');
       add(' END   QT_PEDIDO_IDEAL');
       add(',QT_DESVIOPADRAO_VENDA_DIARIA');
//       add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_ICMS_COMPRA');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');
       Add(',ID_COFINS');
       Add(',PC_IPI_MERCADORIA');
       Add(',CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add(',NR_DIAS_PADRAO');
       Add(',QT_DIAS_MEDIO_LEADTIME');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');


       add('FROM');
       add('(SELECT');
       add('CD_EMPRESA');
       add(',CD_MERCADORIA');
       add(',NM_MERCADORIA');
       add(',DS_APRESENTACAO_MERCADORIA');
       add(', QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',CD_GRUPO_CURVA_FABRICANTE');
       add(',QT_PENDENTE');
       add(' --,MEDIA_PREVISAO');
       add(' ,QT_DIAS_PRAZO_PADRAO');
       add(',QT_DESVIOPADRAO_VENDA_DIARIA');
       add(' ,PC_DESCONTO_PADRAO_COMPRA');
       add(' ,VL_UNITARIO_COMPRA');
       add(' ,MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS CONSUMO_ESTOQUE');
       add(' , (QT_ESTOQUE +QT_PENDENTE) - MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS PROJECAO_ESTOQUE');
       add(' , DT_BLOQUEIO_COMPRA');
       add(' , DT_INATIVACAO_FUTURA');
       add(' , CASE');
       add('   WHEN NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/ VL_INDICE_COMPRA<MEDIA_PREVISAO  THEN');
       add('       ROUND(VLINDICENSPADRAO*SQRT((POWER((NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/VL_INDICE_COMPRA),2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),0)');
       add('  ELSE');
       add('       ROUND(VLINDICENSPADRAO*SQRT((POWER(MEDIA_PREVISAO,2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),3)');
       add('  END  QT_SEGURANCA');
       add('  ,MEDIA_PREVISAO');
       add('  ,QTD_CAIXA_CAMADA');
       add('  ,QTD_CAIXA_PALETE');
       add('  ,FREQUENCIA_COMPRA');
//       add(',ID_CROSSDOCKING');
       add(',NR_OPERADOR_LOGISTICO');
       add(',CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add(',PC_ICMS_COMPRA');
       Add(',PC_DESC_ADICIONAL');
       Add(',VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',PC_REPASSE');
       Add(',ID_COFINS');
       Add(',PC_IPI_MERCADORIA');
       Add(',CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add(',round(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME,0) as NR_DIAS_PADRAO');
       Add(',QT_DIAS_MEDIO_LEADTIME');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');



       add('FROM');
       add('(SELECT');
       add('ESTOQUE.CD_EMPRESA,');
       add('MERCADORIA.CD_MERCADORIA,');
       add('NM_MERCADORIA ,');
       add('DS_APRESENTACAO_MERCADORIA');
       add(',QT_FISICO-(QT_RESERVADO+QT_RESERVA_PROBLEMATICA+QT_VENCIDO) QT_ESTOQUE');
       add(',QT_EMBALAGEM_COMPRA');
       add(',DT_BLOQUEIO_COMPRA');
       add(',DT_INATIVACAO_FUTURA');
       add(',FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       add(',QT_DIAS_PRAZO_PADRAO');
       add(',CASE');
       add('WHEn cd_operador>1 THEN PC_DESCONTO_PADRAO_COMPRA');        //trocado Dia  03/06/2020 confrome SS 31945    //PC_DESCONTO
       add('ELSE PC_DESCONTO_PADRAO_COMPRA');
       add('END PC_DESCONTO_PADRAO_COMPRA');

       add(',NVL(QT_PENDENTE,0)+Nvl(QT_TRANSFERENCIA,0) +Nvl(QT_TRANSITO,0) AS QT_PENDENTE ,');
       add(' CASE');
       add('  WHEN  (COMPRA.cd_empresa_crossdocking>0) AND (VENDA.CD_EMPRESA=1) THEN QT_DIAS_MEDIO_LEADTIME+5');
       add(' ELSE QT_DIAS_MEDIO_LEADTIME');
       add(' END QT_DIAS_MEDIO_LEADTIME ');
       add(' ,QT_DIAS_DESVIOPADRAO_LEADTIME');
       add(',CASE');
       add('   WHEN COMPRA.ID_CURVA_MERCADORIA=''A'' THEN 2.06');
       add('   WHEN COMPRA.ID_CURVA_MERCADORIA=''B'' THEN 1.76');
       add('   ELSE 1.56');
       add(' END VLINDICENSPADRAO,');
       add(' (28/FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE ) AS VL_INDICE_COMPRA');
       add(' ,QT_DESVIOPADRAO_VENDA_DIARIA');
       add(' ,VL_UNITARIO_COMPRA_L,');
       add('  CASE');
       add('    WHEN COMPRA.CD_GRUPO_FORNECEDOR IN');

        Add('(005,008,009,014,016,017,024,025,026,029,033,');
        add('035,036,038,039,040,044,047,051,053,056,057,');
        Add('058,059,061,062,065,066,069,070,071,073,074,');
        add('082,083,084,087,089,090,095,097,098,100,104,');
        Add('105,106,107,108,111,113,116,117,118,121,123,');
        add('127,129,133,135,137,140,146,147,150,165,167,');
        Add('176,177,182,186,187,190,194,204,205,211,216,');
        add('217,227,235,240,242,243,247,250,259,261,263,');
        Add('268,275,282,284,286,287,290,292,293,294,297,');
        add('298,301,306,307,314,318,322,324,330,334,343,');
        Add('354,367,373,375,376,382,384,414,420,422,426,');
        add('430,443,444,461,471,497,545,547,557,564,565,');
        Add('566,570,600,603,605,616,627,628,638,639,641,');
        add('642,643,644,649,656,657,658,660,661,662,663,');
        Add('664,668,670,671,674,675,676,679,682,683,685,');
        add('688,693,694,699,703,704,706,707,709,710,711,');
        Add('714,719,744,745,757,758,759,761,765,766,767,');
        add('771,772,773,774,775,776,777,779,781,784,785,');
        Add('787,788,789,793,796,797,800,801,802,804,806,');
        add('807,809,810,812,813,814,815,816,818,819,822,');
        Add('828,829,831,832,834,836,837,838,839,841,843,');
        add('844,845,846,847,848,851,855,857,860,862,863,');
        Add('864,865,867,870)');


       add('THEN ROUND(QT_PREVISAO_DEMANDA/30,5)');
       add('                                   ELSE QT_MEDIA_VENDA_DIARIA');
       add('                                   END MEDIA_PREVISAO');
       add(' ,QT_CAIXA_PALETE');
       add(' ,QT_CAIXA_CAMADA');
       add(' ,QT_CAIXA_CAMADA * QT_EMBALAGEM_COMPRA AS QTD_CAIXA_CAMADA');
       add(', QT_CAIXA_PALETE* QT_EMBALAGEM_COMPRA AS QTD_CAIXA_PALETE');
       add(',GFM.QT_DIAS_FREQUENCIA_COMPRA FREQUENCIA_COMPRA');
       add(',CASE');
       add('  WHEN VL_UNITARIO_COMPRA_L=0 THEN  VL_PRECO_COMPRA');
       add('  ELSE    VL_UNITARIO_COMPRA_L');
       add('  END  VL_UNITARIO_COMPRA');
//       add(',ID_CROSSDOCKING');
       add(',Nvl(:PNR_OPERADOR_LOGISTICO,1) AS NR_OPERADOR_LOGISTICO');
       add(',NVL(CD_LISTA_GAM,0) as CD_LISTA_GAM,  nvl(VL_BASE_VENDA,0) as VL_BASE_VENDA,nvl(PC_ICMS_VENDA,0) as PC_ICMS_VENDA');
       Add(',Nvl(pc_credito_icms,0) as PC_ICMS_COMPRA');
       Add(',Nvl(PC_ICMS_COMPRA,0) as PC_ICMS_COMPRA_LISTA');

       Add(',round(NVL(PC_DESCONTO_COMPRA,0),2) AS PC_DESC_ADICIONAL');
       Add(',NVL(VL_COMPRA_MERCADORIA,0) AS VL_COMPRA_EXCECAO');
       Add(',CD_LISTA_EXCECAO');
       Add(',NR_VERBA');
       Add(',NVL(PC_REPASSE,0) AS PC_REPASSE');
       Add(',ID_COFINS');
       Add(',Nvl(PC_IPI_MERCADORIA,000.0) AS PC_IPI_MERCADORIA');
       Add(',CASE');
       Add('   WHEN CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING)');
       Add('   WHEN CD_EMPRESA_CROSSDOCKING=0 THEN  COMPRA.cd_Empresa');
       Add('END CD_EMPRESA_CROSSDOCKING');
       Add(',VL_CUSTO_GERENCIAL');
       Add(',PC_REPASSE_COMPRA');
       add('FROM');
       add('  PRDDM.DC_MERCADORIA MERCADORIA,');
       add('  PRDDM.DC_ESTOQUE_MERCADORIA  ESTOQUE,');
       add('  PRDDM.DC_COMPRA_MERCADORIA  COMPRA,');
       add('  PRDDM.DC_FINANCEIRO_MERCADORIA  FINANCEIRO,');
       add('  PRDDM.DC_FISCAL_MERCADORIA  FISCAL,');
       add('  PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
       add('  PRDDM.DC_GRUPO_FORNECEDOR FORNECEDOR,');
       add('  PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM,');
       add('  --PRDDM.DCPCI ITEM_PEDIDO,');
       add('  (SELECT CM.CD_EMPRESA, CM.CD_MERCADORIA,');
       Add('         LP.VL_UNITARIO_COMPRA AS VL_UNITARIO_COMPRA_L,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA, CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA ');
       Add(',CASE');
       Add('    WHEN PC_ICMS_COMPRA>0 THEN   Round((100-(100-PC_ICMS_VENDA)/(100-PC_ICMS_COMPRA)*100),2)');
       Add('    ELSE  0');
       Add(' END  PC_REPASSE');

       add('       FROM');
       add('       PRDDM.DC_COMPRA_MERCADORIA CM,');
       add('       PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
       add('       WHERE');
       add('          CM.CD_MERCADORIA=LP.CD_MERCADORIA');
       add('          AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),CM.cd_empresa) = LP.CD_EMPRESA');
       add('          AND CM.ID_SITUACAO_MERCADORIA=''A''');
       add('          AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
       add('          AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
       add('                                  FROM');
       add('                                    PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF,');
       add('                                    PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       add('                                  WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
       add('                                  AND COMPRA.CD_MERCADORIA=LPF.CD_MERCADORIA');
       add('                                  AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),compra.cd_empresa)=LPF.CD_EMPRESA');
       add('                                  AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
       add('                                  AND LPF.DT_MUDANCA_PRECO <= SYSDATE)) LISTA_PRECO,');
       add('  (SELECT NROM_Y,CD_EMPRESA_DESTINO,LABP_P,SUM(QUAY_Y-CHEY_Y) QT_PENDENTE');
       add('   FROM');
       add('     PRDDM.DCPCC C,');
       add('     PRDDM.DCPCI I,');
       add('     ACESSO.DC_EMPRESA emp');
       add('  WHERE');
       add('   NROP_P=NROP_Y');
       add('   AND SITY_Y IN(''N'',''P'')');
       add('   AND SITP_P IN(''N'',''P'')');
       Add('   AND EMP.CD_EMPRESA=C.CD_EMPRESA_DESTINO');
       Add('   AND EMP.ID_EMPRESA_FISICA=''S''');
       Add('   AND ((c.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'') ) OR  c.CD_OPERACAO_REDE=0)');
//       add('  AND C.CD_EMPRESA_destino=I.CD_EMPRESA');
       add('  AND LABP_P=:PnrFornecedor');
       add('  GROUP BY NROM_Y,CD_EMPRESA_DESTINO,LABP_P) PENDENCIA,');

       add(' ( SELECT  cd_mercadoria');
       add('   ,cd_empresa_destino');
       add('   ,Sum(qt_transferencia) AS qt_transferencia');
       add('  , Sum(qt_transito) AS   qt_transito');
       add(' FROM PRDDM.DC_ESTOQUE_TRANSFERENCIA');
       add(' GROUP BY cd_mercadoria');
       add('  ,cd_empresa_destino) TRANS,');

       add('  PRDDM.DC_LEADTIME_FORNECEDOR  LTIME,');
       add('  PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR');

       add(',(SELECT');
       add('CD_PRECO_FORNECEDOR_EXCECAO AS CD_LISTA_EXCECAO,');
       add('    LPE.CD_EMPRESA,  LPE.CD_MERCADORIA,');
       add('    VL_COMPRA_MERCADORIA,');
       add('    VL_COMPRA_MERCADORIA_DESCONTO,');
       add('    PC_DESCONTO_COMPRA,');
       add('    NR_VERBA');
       add('FROM');
       add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPE,');
       add('prddM.DC_COMPRA_MERCADORIA cm');
       add('WHERE');
       add('LPE.CD_MERCADORIA=CM.CD_MERCADORIA');
       add('AND LPE.CD_EMPRESA=CM.CD_EMPRESA');
       add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       add('AND  LPE.CD_EMPRESA=:PnrEmpresa');
       add('AND CD_PRECO_FORNECEDOR_EXCECAO=:PnrLista) LISTA_EXCECAO');



       add('WHERE');
       add(' MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
       add(' AND COMPRA.CD_GRUPO_FORNECEDOR=LTIME.CD_GRUPO_FORNECEDOR(+)');
       add('   AND CD_LEADTIME=4');
       add('   AND COMPRA.CD_EMPRESA=LTIME.CD_EMPRESA(+)');
       add('   AND ID_TERMOLABIL=''N''');
       add('   AND OL_FORNECEDOR.CD_OPERADOR(+)=:PNR_OPERADOR_LOGISTICO');
       Add('AND OL_FORNECEDOR.CD_empresa(+)= COMPRA.cd_empresa');
       add('   AND OL_FORNECEDOR.CD_FORNECEDOR(+)=COMPRA.CD_GRUPO_FORNECEDOR');
       add('');
       add(' AND COMPRA.CD_GRUPO_FORNECEDOR= FORNECEDOR.CD_GRUPO_FORNECEDOR');
       add(' AND GFM.ID_CURVA_MERCADORIA       = COMPRA.ID_CURVA_MERCADORIA');
       add(' AND GFM.CD_GRUPO_CURVA_FABRICANTE = FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       add(' AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND FINANCEIRO.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND FISCAL.ID_SITUACAO_MERCADORIA=''A''');
       add(' AND FISCAL.ID_VENDA_AUTORIZADA=''S''');
       add(' AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       add(' AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
       add(' AND FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       add(' AND FINANCEIRO.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
       add(' AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
       add(' AND FINANCEIRO.CD_EMPRESA=FISCAL.CD_EMPRESA');
       add(' AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');

       add('AND COMPRA.CD_MERCADORIA=LISTA_EXCECAO.CD_MERCADORIA(+)');
       add('AND COMPRA.CD_EMPRESA=LISTA_EXCECAO.CD_EMPRESA(+)');
        if _chkPedidoAlimentar.Checked then
            add('and MERCADORIA.ID_VENDA_MERCADO=''S''');
       add(' AND COMPRA.CD_EMPRESA=:PnrEmpresa');
 //      add(' --LIGA?AO LISTA PRECO');
       add(' AND COMPRA.CD_MERCADORIA=LISTA_PRECO.CD_MERCADORIA(+)');
       add(' AND COMPRA.CD_EMPRESA=LISTA_PRECO.CD_EMPRESA(+)');
    //   add(' --LIGA??O VENDA');
       add('  AND  COMPRA.CD_MERCADORIA=VENDA.CD_MERCADORIA(+)');
       add('  AND CD_CANAL=0');
       add('  AND  COMPRA.CD_EMPRESA=VENDA.CD_EMPRESA');
       add('  AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
       add(' (SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
       add('               WHERE id_exclusivo_operacao_rede=''S''');
       add('                AND id_situacao=''A'' AND cd_operacao_rede=6)');
       add('  AND   VENDA.DT_VENDA_MERCADORIA>=(SELECT Max(DT_VENDA_MERCADORIA)   FROM prddm.dw_venda_acumulada_mercadoria WHERE cd_canal=0)');
//       add('  AND   VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),0)');
  //     add('  --LIGACAO PEDIDO');
       add('');
       add('  AND COMPRA.CD_GRUPO_FORNECEDOR=PENDENCIA.LABP_P(+)');
       add('  AND COMPRA.CD_MERCADORIA=NROM_Y(+)');
       add('  AND COMPRA.CD_EMPRESA=PENDENCIA.CD_EMPRESA_DESTINO(+)');
       add('  AND COMPRA.CD_MERCADORIA=TRANS.CD_MERCADORIA(+)');
       add('  AND COMPRA.CD_EMPRESA=TRANS.CD_EMPRESA_DESTINO(+) ))))))');
    end;
    stQry.SaveToFile('C:\temp\Compras_qryInsereitemPedido.sql');
    with qryTemp do
    begin
      SQL.Add(stQry.Text);
      ParamByName('PnrFornecedor').AsBCD         :=PnrFornecedor;
      ParamByName('PnrEmpresa').AsBCD            :=PnrEmpresa;
      ParamByName('PnrPedido').AsBCD             :=PnrPedido;
      ParamByName('PnrDiasInformado').AsString   :=inttostr(PnrDias);
      ParamByName('PIdPedidoExcecao').AsString   :=inttostr(PidExcecao);
      ParamByName('PNR_OPERADOR_LOGISTICO').AsBCD:= PcdOperadorLogistico;
      ParamByName('PidForcaCross').AsBCD         :=idforcaCross;
      ParamByName('PnrLista').asbcd              :=PnrListaExcecao;

      Result:=ExecSQL(FALSE);


    end;



  except
      on E: Exception do
           begin
             ShowMessage(E.Message);
           end;

  end;
finally
    freeandnil(stQry);
end;

end;

procedure T_frmTelaCompras.InicializaDadosFornecedor(PnrFornecedor: Integer);
begin
  if NrFornecedor > 0 then
  begin

    _dbgEmpresa.Enabled := false;
    DadosFornecedor := GetDadosLaboratorio(NrFornecedor);

   if _cdsCondicaoPagamento <> nil then
    begin
     if _cdsCondicaoPagamento.isempty then
     begin
      PrazoPedido(DadosFornecedor.nrPrazoPedido);
      if _cdsCondicaoPagamento <> nil then
      begin
       _cdsCondicaoPagamento.open;
       _dsCondicaoPagamento.DataSet := _cdsCondicaoPagamento;
       _cdsCondicaoPagamento.recordCount;
      end;
     end;
    end;

    if DadosFornecedor = nil then
    begin
      Mensagem('Fornecedor n?o encontrado !!!', MB_ICONWARNING);
      _edtFornecedor.SetFocus;
      exit;
    end;


    _stbCompras.Panels[1].Text := 'Abrindo Tabela Ultimo Pre?o Ultima Entrada...';
    _stbCompras.Refresh;
     CarregaUltimoPre?oEntrada(NrFornecedor);



    SetTabelasItensCurva(NrFornecedor, stEmpresaSelecionada);
    DadosFrequenciaCompra := GetFrequenciaEstoqueMaximo(DadosFornecedor.nrGrupoFornecedor);

    _stbCompras.Panels[1].Text := 'Abrindo Venda por Canal...';
    _stbCompras.Refresh;

    _cdsVendaCanalOPerador := VendaCanalOperador(NrFornecedor);

    if _cdsVendaCanalOPerador <> nil then
    begin
      _cdsVendaCanalOPerador.open;
      _dsVendaCanalOPerador.DataSet := _cdsVendaCanalOPerador;
      SetGridVendaCanal;
    end;

    _stbCompras.Panels[1].Text := 'Produto OperacaoLogistica...';
    _stbCompras.Refresh;

    _cdsProdutoOL := GetProdutosOl(cdoperadorLogisticoPedido, nrEmpresa);
     if _cdsProdutoOL <> nil then
            _cdsProdutoOL.open;
      if (_cdsProdutoOL=nil) and (cdoperadorLogisticoPedido>1) then
       begin
            Mensagem('OPerador Logistico Sem Produtos vinculados....', 16);
            close;
            exit;
          end;


    _stbCompras.Panels[1].Text := 'Abrindo Pedidos no Fornecedor...';
    _stbCompras.Refresh;

   // _cdsPedidoNoFornecedor := PedidoCompraLaboratorio(DadosFornecedor.NrFornecedor, cdoperadorLogisticoPedido, 0);
    _cdsPedidoNoFornecedor := PedidoCompraLaboratorio90(DadosFornecedor.NrFornecedor, cdoperadorLogisticoPedido, 0);

    if _cdsPedidoNoFornecedor <> nil then
      _cdsPedidoNoFornecedor.open;

    _stbCompras.Panels[1].Text := 'Abrindo Ultimas Compras...';
    _stbCompras.Refresh;

    _cdsUltimasCompras := AbreUltimasCompraLaboratorioSomarizada
      (DadosFornecedor.NrFornecedor, cdoperadorLogisticoPedido, 0);

    if _cdsUltimasCompras <> nil then
    begin
      _cdsUltimasCompras.open;
    end;

//    _stbCompras.Panels[1].Text := 'Dados Estoque...';
//    _stbCompras.Refresh;

//    DadosEstoqueEmpresa(PnrFornecedor);

//    _stbCompras.Panels[1].Text := 'Dados Pendencia...';
//    _stbCompras.Refresh;
//    DadosEstoquePendente(PnrFornecedor);

//    _stbCompras.Panels[1].Text := 'Dados Venda Mes...';
//    _stbCompras.Refresh;
//    DadosVendaMes(PnrFornecedor);

//    _stbCompras.Panels[1].Text := 'Dados Sugest?o de Compra...';
 //   _stbCompras.Refresh;
 //   DadosSugestaoCompra(PnrFornecedor);

//    _stbCompras.Panels[1].Text := 'Dados Excesso de Estoque...';
//    _stbCompras.Refresh;
//    DadosExcessoEstoque(PnrFornecedor);

{    _stbCompras.Panels[1].Text := 'Dados Venda Sumarizada Fornecedor...';
    _stbCompras.Refresh;
    _cdsVendaSumarizada := VendaSumarizadaLaboratorioMultiEmpresaAtual(PnrFornecedor, 0);
    if (_cdsVendaSumarizada <> nil) then
    begin
      _cdsVendaSumarizada.open;
      if not _cdsVendaSumarizada.IsEmpty then
        _cdsVendaSumarizada.IndexFieldNames := 'ANO;MES;CD_EMPRESA';
    end;}
      AbreDadosFornecedor(NrFornecedor, stEmpresaSelecionada);
    _stbCompras.Panels[1].Text := 'Dados  Fornecedor...';
    _stbCompras.Refresh;
    SetDadosAgenda;



    // GeraPedido(nrFornecedor);
  end
  else
    Mensagem('Fornecedor n?o encontrado !!!', MB_ICONWARNING);

end;

procedure T_frmTelaCompras.SetGridLeadTime;
begin
  // ,ID_TERMOLABIL,QT_DIAS_MEDIO_LEADTIME
  TIntegerField(_cdsTabelaLeadTime.FieldByName('CD_EMPRESA')).DisplayLabel := 'CD';
  TIntegerField(_cdsTabelaLeadTime.FieldByName('CD_EMPRESA')).DisplayWidth := 03;

  TStringField(_cdsTabelaLeadTime.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayLabel := 'UF';
  TStringField(_cdsTabelaLeadTime.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayWidth := 02;

  TIntegerField(_cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME')).DisplayLabel := 'LT. M?dio';
  TIntegerField(_cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME')).DisplayWidth := 06;
  TIntegerField(_cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME')).DisplayFormat := '###0.00';


  TFloatField(_cdsTabelaLeadTime.FieldByName('QT_DIAS_DESVIOPADRAO_LEADTIME')).DisplayLabel := 'Desvio LT.';
  TFloatField(_cdsTabelaLeadTime.FieldByName('QT_DIAS_DESVIOPADRAO_LEADTIME')).DisplayWidth := 12;
  TFloatField(_cdsTabelaLeadTime.FieldByName('QT_DIAS_DESVIOPADRAO_LEADTIME')).DisplayFormat := '###0.00';


  TStringField(_cdsTabelaLeadTime.FieldByName('ID_TERMOLABIL')).DisplayLabel :='Geladeira';
  TStringField(_cdsTabelaLeadTime.FieldByName('ID_TERMOLABIL')).DisplayWidth := 05;
end;

procedure T_frmTelaCompras.AjustaSelecaoEmpresa(PnrCdPedido: Integer);
begin
  _cdsEmpresa.open;
  _cdsEmpresa.Filtered := false;
  _cdsEmpresa.First;
  while not _cdsEmpresa.eof do
  begin
    _cdsEmpresa.Edit;
    _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString := 'N';
    if _cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger = PnrCdPedido then
      _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString := 'S';

    _cdsEmpresa.Next;
  end;

end;

PROCEDURE T_frmTelaCompras.AbrePedidoAlteracao(PnrPedido: Integer);
begin
  nrPedidoAlteracao := PnrPedido;
  if nrPedidoAlteracao > 0 then
  begin

    DadosPedidoAbertuta := GetValoresPedido(nrPedidoAlteracao, false);
    if DadosPedidoAbertuta <> nil then
    begin
      nrFornecedorPedido := DadosPedidoAbertuta.NrFornecedor;
      // idPedidoBloqueado := DadosPedidoAbertuta.idBloqueiodeDigitacao;

       if DadosPedidoAbertuta.NrFornecedor=0  then
      begin
        Mensagem('Pedido N?o encontrado', 16);
        nrPedidoAlteracao:=0;
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
      if DadosPedidoAbertuta.idPedidoOperacaoRede then
      begin
        Mensagem('Este pedido De Opera??o de Rede Grandes Redes... '+#13+
                 'N?o pode ser alterado.', 16);
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

end;

function T_frmTelaCompras.ListaPrecoAtivas(PnrFornecedor, PnrProduto: Integer): Boolean;
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
      Add(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) NR_ITENS,NR_VERBA,''N'' AS ID_SELECIONADO');
      Add('FROM');
      Add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPF,');
      Add('PRDDM.DC_COMPRA_MERCADORIA  CM');
      Add('WHERE');
      Add('LPF.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND LPF.CD_EMPRESA=CM.CD_EMPRESA');
      add('AND DT_INICIO_VALIDADE<=trunc(sysdate)');
      add('AND DT_FIM_VALIDADE>=trunc(sysdate)');
      Add('AND CM.ID_SITUACAO_MERCADORIA<>''I''');
      if PnrFornecedor > 0 then
        Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrProduto > 0 then
        Add('AND CM.CD_MERCADORIA=:PnrProduto');
      Add('AND ID_SITUACAO=''A''');
      Add('GROUP BY CD_PRECO_FORNECEDOR_EXCECAO,DT_INICIO_VALIDADE ,DT_FIM_VALIDADE,NR_VERBA');
      add('ORDER BY inicio desc');

    end;

    Result := false;
    stQry.SaveToFile('C:\temp\qryListaPrecoAtiva.sql');
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
    SetGridListaPreco;
    if not _cdsListaPrecoAtiva.IsEmpty then
    begin
      Result := true;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetGridListaPreco;
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

  TStringField(_cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO'))
    .DisplayLabel := 'Id.';
  TStringField(_cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO'))
    .DisplayWidth := 02;
end;

function T_frmTelaCompras.SetListaPrecoAtiva(PnrLista, PnrProduto,
  PnrEmpresa: Integer): TListaPrecoAtiva;
begin

  Result.vlPrecoLista := 0;
  Result.vlPrecoComdesconto := 0;
  Result.PcIcmsCompra := 0;
  Result.pcDescontoAdicional := 0;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;


  if _cdsItemListaPreco<>nil then
  begin
  if _cdsItemListaPreco.Locate('CD_PRECO_FORNECEDOR_EXCECAO;CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrLista, PnrProduto, PnrEmpresa]), []) then
  begin

    Result.vlPrecoLista := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA').AsFloat;
    Result.vlPrecoComdesconto := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO').AsFloat;
    Result.pcDescontoAdicional := _cdsItemListaPreco.FieldByName('PC_DESCONTO_COMPRA').AsFloat;
    Result.nrListaPreco := PnrLista;
    Result.nrVerba := _cdsItemListaPreco.FieldByName('NR_VERBA').AsInteger;

  end;
  end;

end;

function T_frmTelaCompras.ListaDiasEstoqueCD(PstEmpresa: String)
  : TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
begin
  _cdsTemp := TClientDataSet.Create(nil);
  _cdsTemp.RemoteServer := _dm._LocalConexao;
  _cdsTemp.ProviderName := '_dspGenerica';
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT CD_EMPRESA,ID_UNIDADE_FEDERACAO,');
      Add('0 NR_DIAS_ESTOQUE FROM ACESSO.DC_EMPRESA');
      Add('WHERE id_empresa_fisica=''S''');
      add('AND ID_SITUACAO_EMPRESA=''A''');
      if trim(PstEmpresa) <> '' then
        Add('AND cd_empresa in(' + PstEmpresa + ')');

    end;

    Result := nil;
    stQry.SaveToFile('C:\temp\qryPEDiasEstoque.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      open;
    end;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.IndexFieldNames := 'CD_EMPRESA;ID_UNIDADE_FEDERACAO';
      Result := _cdsTemp;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetGridPEDiasEstoque;
begin
  // CD_EMPRESA,,');
  // Add('0 NR_DIAS_ESTOQUE' +

  TIntegerField(_cdsPeEstoque.FieldByName('CD_EMPRESA')).DisplayLabel := 'CD';
  TIntegerField(_cdsPeEstoque.FieldByName('CD_EMPRESA')).DisplayWidth := 2;

  TStringField(_cdsPeEstoque.FieldByName('ID_UNIDADE_FEDERACAO'))
    .DisplayLabel := 'UF';
  TStringField(_cdsPeEstoque.FieldByName('ID_UNIDADE_FEDERACAO'))
    .DisplayWidth := 2;

  TIntegerField(_cdsPeEstoque.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel :=
    'Dias Estoque';
  TIntegerField(_cdsPeEstoque.FieldByName('NR_DIAS_ESTOQUE'))
    .DisplayWidth := 06;

end;

function T_frmTelaCompras.setDiasEstoque(PnrEmpresa: Integer): Integer;
begin
  Result := 0;
  if _cdsPeEstoque.Locate('CD_EMPRESA', PnrEmpresa, []) then
    Result := _cdsPeEstoque.FieldByName('NR_DIAS_ESTOQUE').AsInteger;
end;

procedure T_frmTelaCompras.SetNomeCampoItemPrePedido(TabelaPedido
  : TClientDataSet);
begin
  if TabelaPedido.Active then
  begin
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayFormat := '#######0';
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayLabel := 'Nr.Pedido';
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayWidth := 06;
    TabelaPedido.FieldByName('NROP_Y').ReadOnly:=true;




    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayLabel :='Nr.Produto';
    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayWidth := 06;
    TabelaPedido.FieldByName('NROM_Y').ReadOnly:=true;



  //  TIntegerField(TabelaPedido.FieldByName('QT_ESTOQUE')).DisplayFormat :='#######0';
 //   TIntegerField(TabelaPedido.FieldByName('QT_ESTOQUE')).DisplayLabel :='Estoque';
 //   TIntegerField(TabelaPedido.FieldByName('QT_ESTOQUE')).DisplayWidth := 06;

//    TIntegerField(TabelaPedido.FieldByName('QT_PENDENCIA')).DisplayFormat :='#######0';
//    TIntegerField(TabelaPedido.FieldByName('QT_PENDENCIA')).DisplayLabel :='Pendencia';
//    TIntegerField(TabelaPedido.FieldByName('QT_PENDENCIA')).DisplayWidth := 06;

    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayLabel :='Qtd. Pedido';
    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayLabel :=
      'Qtd.Faturada';
    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayLabel :=  'Desc.Padr?o';
    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayWidth := 07;
    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayFormat := '##0.00';
    TabelaPedido.FieldByName('ABTY_Y').readOnly:=true;

    TStringField(TabelaPedido.FieldByName('SITY_Y')).DisplayLabel := 'Status';
    TStringField(TabelaPedido.FieldByName('SITY_Y')).DisplayWidth := 06;


    TStringField(TabelaPedido.FieldByName('OCD')).DisplayLabel := 'O.C.D';
    TStringField(TabelaPedido.FieldByName('OCD')).DisplayWidth := 05;
    //TabelaPedido.FieldByName('OCD').readOnly:=true;


    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayLabel := 'Prazo';
    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayLabel := 'Pre?o Unit.';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayLabel :='Total Item';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayLabel :='Pre?o Fornecedor';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayLabel :='Desc. Adic.';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayWidth := 07;

    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayLabel :='Pre?o Custo';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayLabel :='Nr.Verba';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel :='Vlr. Marg. Padr?o';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayFormat:= '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayLabel:='Vlr. Marg. Negociada';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayWidth := 12;

    TStringField(TabelaPedido.FieldByName('ID_MARGEM')).DisplayLabel :='Id Margem';
    TStringField(TabelaPedido.FieldByName('ID_MARGEM')).DisplayWidth := 06;

    TStringField(TabelaPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayLabel := 'Id Desc. Acumul.';
    TStringField(TabelaPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayLabel :=
      'Qtdade Bonif.';
    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayWidth := 10;

    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayLabel :=
      '% Bonifica??o';
    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayWidth := 10;

    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayLabel :=
      '% Desc. OL';
    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayFormat := '#######0';
    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayLabel := 'Cd Operador Log.';
    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayLabel :='Cod. Prod.';
    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayWidth := 07;
    TabelaPedido.FieldByName('CD_PRODUTO').ReadOnly:=true;


    TStringField(TabelaPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:= 'Nome';
    TStringField(TabelaPedido.FieldByName('NM_MERCADORIA')).DisplayWidth := 17;
    TabelaPedido.FieldByName('NM_MERCADORIA').ReadOnly:=true;


    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel := 'Apersenta??o';
    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth := 17;
    TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').ReadOnly:=true;

    TStringField(TabelaPedido.FieldByName('DS_NIVEL_ECNM')).DisplayLabel :=
      'Tipo Produto';
    TStringField(TabelaPedido.FieldByName('DS_NIVEL_ECNM')).DisplayWidth := 01;

    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel :=
      'Dias Estq.com Ped.';
    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayWidth := 10;
    TabelaPedido.FieldByName('QT_SUGERIDA').ReadOnly := true;

    TFloatField(TabelaPedido.FieldByName('VL_MEDIA_VENDA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;


procedure T_frmTelaCompras.SetNomeCampoItemPrePedidoII(TabelaPedido
  : TClientDataSet);
begin
  if TabelaPedido.Active then
  begin
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayFormat := '#######0';
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayLabel := 'Nr.Pedido';
    TIntegerField(TabelaPedido.FieldByName('NROP_Y')).DisplayWidth := 06;
    TabelaPedido.FieldByName('NROP_Y').ReadOnly:=true;




    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayLabel :='Nr.Produto';
    TIntegerField(TabelaPedido.FieldByName('NROM_Y')).DisplayWidth := 06;
    TabelaPedido.FieldByName('NROM_Y').ReadOnly:=true;



    TIntegerField(TabelaPedido.FieldByName('QT_ESTOQUE')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_ESTOQUE')).DisplayLabel :='Estoque';
    TIntegerField(TabelaPedido.FieldByName('QT_ESTOQUE')).DisplayWidth := 06;

    TIntegerField(TabelaPedido.FieldByName('QT_PENDENCIA')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_PENDENCIA')).DisplayLabel :='Pendencia';
    TIntegerField(TabelaPedido.FieldByName('QT_PENDENCIA')).DisplayWidth := 06;

    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayLabel :='Qtd. Pedido';
    TIntegerField(TabelaPedido.FieldByName('QUAY_Y')).DisplayWidth := 06;

    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayLabel :='Qtd.Faturada';
    TIntegerField(TabelaPedido.FieldByName('CHEY_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayLabel :='Desc.Padr?o';
    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayWidth := 07;
    TFloatField(TabelaPedido.FieldByName('ABTY_Y')).DisplayFormat := '##0.00';
    TabelaPedido.FieldByName('ABTY_Y').readOnly:=true;

    TStringField(TabelaPedido.FieldByName('SITY_Y')).DisplayLabel := 'Status';
    TStringField(TabelaPedido.FieldByName('SITY_Y')).DisplayWidth := 06;


    TStringField(TabelaPedido.FieldByName('OCD')).DisplayLabel := 'O.C.D';
    TStringField(TabelaPedido.FieldByName('OCD')).DisplayWidth := 05;
    if  (nrPedidoAlteracao>0) and (idPedidoCrossDocking=true) then
        TabelaPedido.FieldByName('OCD').readOnly:=true;


    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayFormat :=
      '######0';
    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayLabel := 'Prazo';
    TIntegerField(TabelaPedido.FieldByName('PRZY_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayLabel := 'Pre?o Unit.';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PUNY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayLabel :='Total Item';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayFormat :='###,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VT_ITEM')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayLabel :='Pre?o Fornecedor';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayLabel :='Desc. Adic.';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('DADY_Y')).DisplayWidth := 07;

    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayLabel :='Pre?o Custo';
    TFloatField(TabelaPedido.FieldByName('VCCI_Y')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayLabel :='Nr.Verba';
    TIntegerField(TabelaPedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel :='Vlr. Marg. Padr?o';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayFormat :='##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayWidth := 12;

    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayFormat:= '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayLabel:='Vlr. Marg. Negociada';
    TFloatField(TabelaPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayWidth := 12;

    TStringField(TabelaPedido.FieldByName('ID_MARGEM')).DisplayLabel :='Id Margem';
    TStringField(TabelaPedido.FieldByName('ID_MARGEM')).DisplayWidth := 06;

    TStringField(TabelaPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayLabel := 'Id Desc. Acumul.';
    TStringField(TabelaPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayWidth := 06;

    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayFormat := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayLabel :=
      '% P/ Verba';
    TFloatField(TabelaPedido.FieldByName('PC_VERBA')).DisplayWidth := 6;

    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayLabel :=
      'Vlr. da Verba';
    TFloatField(TabelaPedido.FieldByName('VL_VERBA')).DisplayWidth := 12;

    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayLabel :=
      'Qtdade Bonif.';
    TIntegerField(TabelaPedido.FieldByName('QT_BONIFICADA')).DisplayWidth := 10;

    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayFormat
      := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayLabel :=
      '% Bonifica??o';
    TFloatField(TabelaPedido.FieldByName('PC_BONIFICACAO')).DisplayWidth := 10;

    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayFormat
      := '##0.00';
    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayLabel :=
      '% Desc. OL';
    TFloatField(TabelaPedido.FieldByName('PC_DESCONTO_OL')).DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayFormat := '#######0';
    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayLabel := 'Cd Operador Log.';
    TIntegerField(TabelaPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayFormat :='#######0';
    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayLabel :='Cod. Prod.';
    TIntegerField(TabelaPedido.FieldByName('CD_PRODUTO')).DisplayWidth := 07;
    TabelaPedido.FieldByName('CD_PRODUTO').ReadOnly:=true;


    TStringField(TabelaPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:= 'Nome';
    TStringField(TabelaPedido.FieldByName('NM_MERCADORIA')).DisplayWidth := 17;
    TabelaPedido.FieldByName('NM_MERCADORIA').ReadOnly:=true;


    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel := 'Apersenta??o';
    TStringField(TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth := 17;
    TabelaPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').ReadOnly:=true;

    TStringField(TabelaPedido.FieldByName('DS_NIVEL_ECNM')).DisplayLabel :=
      'Tipo Produto';
    TStringField(TabelaPedido.FieldByName('DS_NIVEL_ECNM')).DisplayWidth := 01;

    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel :=
      'Dias Estq.com Ped.';
    TIntegerField(TabelaPedido.FieldByName('NR_DIAS_ESTOQUE'))
      .DisplayWidth := 10;

    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayFormat :=
      '#######0';
    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayLabel :=
      'Qtdade Sug.';
    TIntegerField(TabelaPedido.FieldByName('QT_SUGERIDA')).DisplayWidth := 10;
    TabelaPedido.FieldByName('QT_SUGERIDA').ReadOnly := true;

    TFloatField(TabelaPedido.FieldByName('VL_MEDIA_VENDA')).DisplayFormat :=
      '##,###,##0.00';
    TFloatField(TabelaPedido.FieldByName('VL_MEDIA_VENDA')).DisplayLabel
      := 'M?dia';
  end;
end;

procedure T_frmTelaCompras.Timer1Timer(Sender: TObject);
begin
 if idAlertaInativacao then
        Series2.Active := not Series2.Active;
 if idAlerteOCD then
 begin

     if not _edtObservacaoInativacao.Visible then
     begin
       _edtObservacaoInativacao.Visible:=true;
      _edtObservacaoInativacao.color:=clYellow;
       end
     else
     begin
       _edtObservacaoInativacao.Visible:=false;
       _edtObservacaoInativacao.Color:=clYellow;
     end;
   
     application.ProcessMessages;
 end;

     //_edtObservacaoPedido.visible:= not _edtObservacaoPedido.visible;

  //end;

end;

function T_frmTelaCompras.TotalizaPedidoMultiEmpresa(PstPedido: String;
  PcdEmpresa: Integer; PidSituacao: String): Boolean;
var
  stQry: TStringList;
  cdEmpresa: Integer;
  vlEmpresa: Double;
  unEmpresa: Integer;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('CD,');
    stQry.Add('ID_OCD,');
    stQry.Add('NR_UNIDADES_SUGERIDA,');
    stQry.Add('VT_SUGERIDO_BRUTO,');
    stQry.Add('VT_SUGERIDO_LIQUIDO,');
    stQry.Add('NR_UNIDADES_COMPRADA,');
    stQry.Add('VT_COMPRADO_BRUTO,');
    stQry.Add('VT_COMPRADO_LIQUIDO,');
    stQry.Add('CD_EMPRESA');
    stQry.Add(',cd_empresa_destino');
    stQry.Add('FROM');
    stQry.Add('(SELECT');
    stQry.Add('ID_UNIDADE_FEDERACAO AS CD,');
    stQry.Add('CASE');
    stQry.Add('WHEN (ITEM.CD_EMPRESA<>CAPA.CD_EMPRESA_DESTINO) THEN ''OCD''');
    stQry.Add('ELSE ''NORM''');
    stQry.Add('END ID_OCD,');
    stQry.Add('Sum(QUAY_Y) AS NR_UNIDADES_COMPRADA,');
    stQry.Add('Sum(QT_SUGERIDA) AS NR_UNIDADES_SUGERIDA,');
    stQry.Add('Sum(QT_SUGERIDA*PFBY_Y) AS VT_SUGERIDO_BRUTO,');
    stQry.Add('Sum(QUAY_Y*PFBY_Y) AS VT_COMPRADO_BRUTO,');
    stQry.Add('Sum(QT_SUGERIDA*puny_y) AS VT_SUGERIDO_LIQUIDO,');
    stQry.Add('Sum(QUAY_Y*PUNY_Y) AS VT_COMPRADO_LIQUIDO,');
    stQry.Add('ITEM.CD_EMPRESA');
    stQry.Add(',cd_empresa_destino');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
    stQry.Add('ACESSO.DC_EMPRESA CD');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND CD.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND NROP_Y In(' + PstPedido + ')');
    stQry.Add('GROUP BY NROP_Y,ID_UNIDADE_FEDERACAO,ITEM.CD_EMPRESA,capa.cd_empresa_destino');
    stQry.Add('UNION ALL');
    stQry.Add('SELECT');
    stQry.Add('''Geral'' AS CD,');
    stQry.Add('''Geral'' AS ID_OCD,');
    stQry.Add('Sum(QUAY_Y) AS NR_UNIDADES_COMPRADA,');
    stQry.Add('Sum(QT_SUGERIDA) AS NR_UNIDADES_SUGERIDA,');
    stQry.Add('Sum(QT_SUGERIDA*PFBY_Y) AS VT_SUGERIDO_BRUTO,');
    stQry.Add('Sum(QUAY_Y*PFBY_Y) AS VT_COMPRADO_BRUTO,');
    stQry.Add('Sum(QT_SUGERIDA*puny_y) AS VT_SUGERIDO_LIQUIDO,');
    stQry.Add('Sum(QUAY_Y*PUNY_Y) AS VT_COMPRADO_LIQUIDO,');
    stQry.Add('500 CD_EMPRESA');
    stQry.Add(',500 cd_empresa_destino');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
    stQry.Add('ACESSO.DC_EMPRESA CD');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND CD.CD_EMPRESA=capa.cd_empresa_destino');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND NROP_Y In(' + PstPedido + '))');
    stQry.Add('ORDER BY cd_empresa_destino,CD_EMPRESA');

    stQry.SaveToFile('C:\temp\qryTotalizaPedido.sql');
    with _cdsTotalizaPedido do
    begin
      close;
      CommandText := stQry.Text;
      open;
      First;
    end;
    Result := false;
    // TotalizaPedido(PnrPedidoSC, 0, '');
    SetGridTotalizaPedido;
    if not _cdsPrePedido.IsEmpty then
    begin
    //  SetGridTotalizaPedido;
      Result := true;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetGridTotalizaPedido;
begin

  TStringField(_cdsTotalizaPedido.FieldByName('CD')).DisplayLabel := 'CD';
  TStringField(_cdsTotalizaPedido.FieldByName('CD')).DisplayWidth := 05;

  TStringField(_cdsTotalizaPedido.FieldByName('ID_OCD')).DisplayLabel := 'OCD';
  TStringField(_cdsTotalizaPedido.FieldByName('ID_OCD')).DisplayWidth := 05;

  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_COMPRADA'))
    .DisplayLabel := 'Unid.Comp.';
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_COMPRADA'))
    .DisplayWidth := 07;
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_COMPRADA'))
    .DisplayFormat := '###,###,##0';

  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_SUGERIDA'))
    .DisplayLabel := 'Unid.Sug.';
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_SUGERIDA'))
    .DisplayWidth := 07;
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_SUGERIDA'))
    .DisplayFormat := '###,###,##0';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_BRUTO')).DisplayLabel
    := 'Total Sug.';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_BRUTO'))
    .DisplayWidth := 12;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_BRUTO')).DisplayFormat
    := '###,###,##0.00';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_BRUTO')).DisplayLabel
    := 'Total Compr.';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_BRUTO'))
    .DisplayWidth := 12;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_BRUTO')).DisplayFormat
    := '###,###,##0.00';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_LIQUIDO'))
    .DisplayLabel := 'Total Sug.C/Desc';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_LIQUIDO'))
    .DisplayWidth := 12;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_LIQUIDO'))
    .DisplayFormat := '###,###,##0.00';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_LIQUIDO'))
    .DisplayLabel := 'Total Comp.C/Desc.';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_LIQUIDO'))
    .DisplayWidth := 11;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_LIQUIDO'))
    .DisplayFormat := '###,###,##0.00';

  TIntegerField(_cdsTotalizaPedido.FieldByName('CD_EMPRESA')).DisplayLabel:= 'Nr.cd';
  TIntegerField(_cdsTotalizaPedido.FieldByName('CD_EMPRESA')).DisplayWidth := 02;

  TIntegerField(_cdsTotalizaPedido.FieldByName('CD_EMPRESA_DESTINO')).DisplayLabel:= 'CD. DEST';
  TIntegerField(_cdsTotalizaPedido.FieldByName('CD_EMPRESA_DESTINO')).DisplayWidth := 06;

end;

function T_frmTelaCompras.GravaItemPedido(PnrPedido, PnrProduto, PnrEmpresa,
  PQtdadePedido: Integer; PpcDescontoAdiocional: Double;PidInicio:Boolean): Boolean;
var
  pcCreditoICMS,
  pcRepasseCompra,
  PcIPILista,vLCustoGerencial: Double;
  nrReg,cdPrazoPagamento,qtBonificado :Integer;



begin
              result:=true;
            if  not  validaInclusaodItemPedido(idPedidoCrossDocking,idCrossDocking) then
            begin
             _edtQtdadePedido.SetFocus;
              result:=false;
                exit;

            end;


 // DadosItemPedidoLog :=    LocalizaItemPedido(PnrPedido, nrProduto, DadosItemPedidoLog.nrEmpresa);

//  if DadosItemPedidoLog.nrQuantidadePedido=0 then
   DadosItemPedidoLog:= DadosItemPedidoAtual(PnrPedido, nrProduto,PnrEmpresa,nrEmpresaOCD);


 //nrEmpresaOCD:=PnrEmpresa;
 if  (_cdsPrePedido.FieldByName('OCD').Asstring='S') and
//     (_chkCrossDocking.Checked) and (not idForcaPedidoLocal) and (nrPedidoAlteracao=0) then
     (_chkCrossDocking.Checked) and (not idForcaPedidoLocal) and (nrPedidoAlteracao=0) then
 begin
     nrEmpresaOCD:=nrEmpresaOCD;
     nrSomaLeadTimeOCD:=5;
 end
 else
 begin
     DadosItemPedidoLog.nrEmpresa:=nrEmpresaOCD;
     nrEmpresaOCD:=nrEmpresaOCD;
//     nrSomaLeadTimeOCD:=nrdia5;
 end;


  pcCreditoICMS   := Mercadoria.pcCreditoICMS;
  PcIPILista      := precoLista.PcIPILista;
  vLCustoGerencial:=Mercadoria.vlCustoGerencial;
  pcRepasseCompra :=Mercadoria.pcRepasseCompra;
//  if (precoLista.PcIcmsCompra > 0) and
  //  (dtSistema >= strtodate('01/12/2016')) then
    //pcCreditoICMS := precoLista.PcIcmsCompra; // SS 33688  alterado 01/09/2020

  vlVerba :=0;
  if (nrVerba > 0) and(PpcDescontoAdiocional>0) then
  begin
    vlVerba := CalculaPcVerba(pcVerba,
                              PrecoItem.vlVerba,
                              PrecoItem.vlPrecoCusto,
                              Mercadoria.pcIpiProduto,
                              0,
                              Mercadoria.pcCreditoICMS,
                              Mercadoria.nrProduto,
                              Mercadoria.nrTipoProduto,
      PQtdadePedido, Mercadoria.nrLaboratorio, Mercadoria.idPis);
  end;

                  if PnrPedido=0 then
                  begin
                     NrPedido := PedidoEmpresa[nrEmpresa];
                     if NrPedido>0 then
                        PnrPedido:=NrPedido;
                     if nrpedido=0 then
                     begin
                       NrPedido := GeraNumeroPedido('C');
                       PedidoEmpresa[nrEmpresa] := NrPedido;
                        cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);


                                  if not GravaCapaPedido(NrPedido, // NROP_P,//  NUMBER(6)
                                  nrFornecedor, // LABP_P :Integer;// NUMBER(6)
                                  dtPedido, // DATP_P :Tdate;// DATE
                                  pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                                  0, // DESP_P:Double;// NUMBER(5,2)
                                  'S', // SITP_P :String;//CHAR(1)
                                  DadosFornecedor.nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
                                  dtPedido + nrLeadTime, // PREP_P          //DATE
                                  ' ', // CHAR(40)
                                  TipoPedido, // SNRP_P           //  CHAR(10)
                                  0, // FLAP_P ,         //NUMBER(1)
                                  cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                                  nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                                  strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                                  dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                                  'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                                  cdoperadorLogisticoPedido,
                                  // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                                  NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                                  DadosFornecedor.dtAgenda,
                                  // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                                  dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                                  0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                                  0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                                  strtodate('01/01/2039'), nrCompradorPedido,
                                  PnrEmpresa, 0, pcGeracaoVerba,
                                  nrGeracaoVerba,
                                  NrDiasEstoqueComprador,
                                  PnrEmpresa,
                                  'N',0,nrListaPrecoExcecao) then









                    end;
                     PNrPedido:=NrPedido;
                     stPedidos:=FiltroPedidoNaoFechados;


                  end;


  if (DadosItemPedidoLog.nr_pedido=0) or (not DadosItemPedidoLog.idItemGravado)  then
  begin
      if idBonificado then
         qtBonificado:=PQtdadePedido;
      nrReg:=ProximoItemPedido(PnrPedido);
      if DadosItemPedidoLog.nrQuantidadePedido = 0 then
      GravaItemPedidoAtual(PnrPedido, // NUMBER(6)
        nrProduto, // NROM_Y ,//NUMBER(6)
        PQtdadePedido, // QUAY_Y ,//NUMBER(7)
        0, // CHEY_Y :Integer;//NUMBER(7)
        pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
        'S', // SITY_Y :String;//CHAR(1)
        DadosFornecedor.nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
        PrecoItem.vlPrecolIquido, // PUNY_Y ,//NUMBER(17,6)
        PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
        pcDescontoAdicional, // DADY_Y ,//NUMBER(5,2)
        nrReg, // DFIY_Y ,   //NUMBER(5,2)
        PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
        nrVerba, // NRVV_Y :Integer;//NUMBER(6)
        0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
        0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
        'N', // ID_MARGEM,//CHAR(1)
        'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
        pcVerba, // PC_VERBA,//  NUMBER(5,2)
        vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
        0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6) Ultilizando campo Para marcar o Cd Destino
        0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
        0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
        cdoperadorLogisticoPedido, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
        nrDiasEstoqueComPedido, // NR_DIAS_ESTOQUE,//NUMBER(3)
        nrQtdadeSusgetaoInicio, // QT_SUGERIDA :Integer;//NUMBER(7)
        vlMediaDiaCD, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
        PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
        PrecoItem.pcMundancaPreco,
        nrEmpresaOCD,
        Mercadoria.pcCreditoICMS,
        PcIPILista,
        pcRepasseCompra,
        precoLista.vlBaseVenda,
        precoLista.pcIcmsVenda,
        precoLista.PcIcmsCompra,
        NrDiasEstoqueComprador,
        vlCustoGerencial);




  end;


  if (PrecoItem.vlPrecolIquido=0) then
  begin
    mensagem('Item sem Pre?o ...',MB_ICONWARNING);
    AtualizaItemPedido(PnrPedido,
                         PnrProduto,
                         0,
                         0,
                         DadosFornecedor.nrPrazoPedido,
                         nrVerba,
                         0,
                         cdoperadorLogisticoPedido,
                         nrDiasEstoqueComPedido,
                         nrQtdadeSusgetaoPossivel,
                         'N',
                         'N',
                         'N',
                         pcDescontoPadrao,
                         pcDescontoAdicional,
                         0,
                         pcVerba,
                         0,
                         0,
                         PrecoItem.vlPrecolIquido,
                         PrecoItem.vlPrecoLista,
                         PrecoItem.vlPrecoCusto,
                         0,
                         0,
                         vlVerba,
                         vlMediaDiaCD,
                         ' Tela Pedido',
                         nrEmpresaOCD,
                         Mercadoria.pcCreditoICMS,
                         precoLista.nrListaPreco,
                         idAtualizaDesconto,
                         idbonificado,
                         precoLista.PcIcmsCompra,
                        NrDiasEstoqueComprador,
                        precoLista.vlBaseVenda);
    exit;

  end;


  AtualizaItemPedido(PnrPedido,
                     PnrProduto,
                     PQtdadePedido,
                     0,
                     DadosFornecedor.nrPrazoPedido,
                     nrVerba,
                     qtBonificado,
                     cdoperadorLogisticoPedido,
                     nrDiasEstoqueComPedido,
                     nrQtdadeSusgetaoPossivel,
                      'S',
                      'N',
                      'N',
                      pcDescontoPadrao,
                      pcDescontoAdicional,
                      0,
                      pcVerba,
                      0,
                      0,
                      PrecoItem.vlPrecolIquido,
                      PrecoItem.vlPrecoLista,
                      PrecoItem.vlPrecoCusto,
                      0,
                      0,
                      vlVerba,
                      vlMediaDiaCD,
                      ' Tela Pedido',
                      nrEmpresaOCD,
                      Mercadoria.pcCreditoICMS,
                      precoLista.nrListaPreco,
                      idAtualizaDesconto,
                      idbonificado,
                      precoLista.PcIcmsCompra,
                      NrDiasEstoqueComprador,
                      precoLista.vlBaseVenda);


   if PQtdadePedido=0 then
      EliminaItemPedido(PnrPedido,PnrProduto,'I');

  if not PidInicio then
  begin

  NrAuditoria := AuditoriaEmpresa[PnrEmpresa];
  ManutencaoItemAuditoria(PnrPedido,
                          PnrProduto, nrQtdadeSusgetaoPossivel,
                          PQtdadePedido,
                          nrQtdadeSusgetaoPossivel * PrecoItem.vlPrecolIquido,
                          PQtdadePedido * PrecoItem.vlPrecolIquido,
                          DadosPendencia.qtPendente,
                          nrQtdEstoque,
                          vlMediaDiaCD * 30,
                          NrDiasEstoque,
                          nrEmpresa,
                          pNrPedido,false);
  end;

  if _cdsPrePedido.Active then
  begin
    _cdsPrePedido.Edit;
    if  _cdsPrePedido.FieldByName('nroP_Y').AsInteger=0 then
    begin
        _cdsPrePedido.FieldByName('nroP_Y').ReadOnly:=false;
        _cdsPrePedido.FieldByName('nroP_Y').AsInteger:=nrpedido;
        _cdsPrePedido.FieldByName('nroP_Y').ReadOnly:=true;
    end;


    _cdsPrePedido.FieldByName('QUAY_Y').AsInteger := PQtdadePedido;
    _cdsPrePedido.FieldByName('VT_ITEM').AsFloat := PQtdadePedido *
      PrecoItem.vlPrecolIquido;
    _cdsPrePedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger := nrDiasEstoqueComPedido;
    _cdsPrePedido.FieldByName('PUNY_Y').AsFloat := PrecoItem.vlPrecolIquido;

    _cdsPrePedido.FieldByName('DADY_Y').AsFloat := pcDescontoAdicional;
     _cdsPrePedido.FieldByName('nroP_Y').ReadOnly:=true;
  end;


  TotalizaPedidoMultiEmpresa(stPedidos, 0, '');

end;

procedure T_frmTelaCompras.ZeraNumeroPedido;
var
  I: Integer;
begin
  for I := 0 to High(PedidoEmpresa) do
  begin
    PedidoEmpresa[I] := 0;
    AuditoriaEmpresa[I] := 0;
    ValorSugestaoPedido[I] := 0;
    UnidadesSugestaoPedido[I] := 0;

  end;

end;

procedure T_frmTelaCompras.PrazoPedido(PnrDiasPrazo: Integer);
begin
  _cdsCondicaoPagamento.open;
  _cdsCondicaoPagamento.Append;
  _cdsCondicaoPagamento.FieldByName('NR_DIAS').AsInteger := PnrDiasPrazo;
  _cdsCondicaoPagamento.post;
  _cdsCondicaoPagamento.open;

end;

procedure T_frmTelaCompras.setGridPrazo;
begin
  { TIntegerField(_cdsCondicaoPagamento.FieldByName('NR_PARCELA')).DisplayLabel := 'Nr.Parcelas';
    TIntegerField(_cdsCondicaoPagamento.FieldByName('NR_PARCELA')).DisplayWidth := 05;

    TIntegerField(_cdsCondicaoPagamento.FieldByName('NR_DIAS')).DisplayLabel:= 'Prazo';
    TIntegerField(_cdsCondicaoPagamento.FieldByName('NR_DIAS')).DisplayWidth := 05; }
end;

procedure T_frmTelaCompras.setNumeroOperador(PnrFornecedor,PcdOperador: Integer);
var
  QryTemp: TSQLQuery;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      sql.Add('SELECT CD_FORNECEDOR,OL.CD_OPERADOR_LOGISTICO as CD_OPERADOR_LOGISTICO,');
      sql.Add('DS_OPERADOR_LOGISTICO,ID_VENDA_EXCLUSIVA,ID_REGISTRA_VENDA_OL,');
      sql.Add('ID_REPOSICAO_ESTOQUE');
      sql.Add('FROM');
      sql.Add('PRDDM.DC_OL_FORNECEDOR OL_FOR,');
      sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      sql.Add('WHERE');
      sql.Add('OL_FOR.CD_OPERADOR=OL.CD_OPERADOR_LOGISTICO');
      sql.Add('AND ID_SITUACAO=''A''');
      sql.Add('AND CD_FORNECEDOR=:PnrFornecedor');
      if PcdOperador>1 then
         sql.Add('AND OL.CD_OPERADOR_LOGISTICO=:PcdOperador');


      if PcdOperador=1 then
      begin
      sql.Add('UNION ALL');
      sql.Add('SELECT 1,OL.CD_OPERADOR_LOGISTICO,DS_OPERADOR_LOGISTICO,');
      sql.Add('''N'',''N'',''S''');
      sql.Add('FROM');
      sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      sql.Add('WHERE');
      sql.Add('OL.CD_OPERADOR_LOGISTICO=1');
      end;
      sql.Add('ORDER BY CD_FORNECEDOR');
      ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      if PcdOperador>1 then
       ParamByName('PcdOperador').AsInteger := PcdOperador;



      open;
      First;
    end;
    _cbOPeradorLogistico.Items.Clear;
    if not QryTemp.IsEmpty then
    begin
      _cbOPeradorLogistico.Visible := true;
      Label19.Visible := true;
    end;

    while not QryTemp.eof do
    begin
      //close;
      _cbOPeradorLogistico.Items.Add(FormatFloat('0000',
        QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger) + ' - ' +
        QryTemp.FieldByName('DS_OPERADOR_LOGISTICO').AsString);
      QryTemp.Next;
    end;
    if _cbOPeradorLogistico.Visible then
      _cbOPeradorLogistico.ItemIndex := 0;
  finally
    FreeAndNil(QryTemp);
  end;
end;

procedure T_frmTelaCompras.PosicionaItemPedido(PnrProduto, PnrEmpresa: Integer);
begin
  if _pgcCompras.ActivePage = _tbsCompras then
  begin
    PnrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    PnrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;

    { if _cdsPrePedido.Active then
      _cdsPrePedido.Locate('NROM_Y;CD_EMPRESA',VarArrayOf([PnrProduto, PnrEmpresa]), [])
      end; }
    if _cdsProduto.Active then
      if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
        VarArrayOf([PnrProduto, PnrEmpresa]), []) then
        SLEEP(0);
  end;

end;

procedure T_frmTelaCompras.filtroPedido(PstEmpresa: String);
begin
  _cdsPedido.Filtered := false;
  if trim(PstEmpresa) <> '' then
  begin
    with _cdsPedido do
    begin
      filter := 'CD in(' + PstEmpresa + ')';
      Filtered := true;
    end;
  end;

end;

function T_frmTelaCompras.PrazoPagamento(tabela: TClientDataSet): string;
var
  stPrazo: String[36];
begin
  tabela.First;
  stPrazo := '';
  while Not tabela.eof do
  begin
    stPrazo := stPrazo + FormatFloat('000', tabela.FieldByName('NR_DIAS').AsInteger);
    tabela.Next;
  end;
  Result := stPrazo;
end;

procedure T_frmTelaCompras.PreencheDadosFornecedor;
begin
  _lbeGrupoPedido.Text := IntToStr(DadosFornecedor.nrGrupoFornecedor);
  DadosFrequenciaCompra := GetFrequenciaEstoqueMaximo
    (DadosFornecedor.nrGrupoFornecedor);
  _edtFrequenciaCompra.Text := FormatFloat('##0.00', DadosFrequenciaCompra.nrFrequenciaCompra) + ' Dias';

  _lbeGrupoPedido.Text := IntToStr(DadosFornecedor.nrGrupoFornecedor);
  _edtFrequenciaCompra.Text := FormatFloat('##0.00',
    DadosFrequenciaCompra.nrFrequenciaCompra) + ' Dias';
  _edtNomeFornecedor.Text := DadosFornecedor.dsRazaoSocial;
  _edtCnpj.Text := DadosFornecedor.stCNPJ;

end;

procedure T_frmTelaCompras.DadosEstoqueEmpresa(PnrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT');
      Add('ID_UNIDADE_FEDERACAO AS  LOCAL,');
      Add('UNID_ESTOQUE,');
      Add('VL_ESTOQUE_FINANCEIRO,');
      Add('VL_ESTOQUE_FORNECEDOR,');
      Add('VL_ESTOQUE_VENDA,');
      Add('VL_ESTOQUE_FABRICA,');
      Add('MTS_CUBICO,CD_EMPRESA');
      Add('FROM');
      Add('((SELECT   ESTOQUE.CD_EMPRESA,ID_UNIDADE_FEDERACAO,SUM(ESTOQUE.QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) AS UNID_ESTOQUE,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )*vl_custo_financeiro_mercadoria) AS VL_ESTOQUE_FINANCEIRO,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* Lista.VL_UNITARIO_COMPRA) AS VL_ESTOQUE_FORNECEDOR,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* FINANCEIRO.VL_PRECO_VENDA) AS VL_ESTOQUE_VENDA,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* VL_BASE_VENDA) AS VL_ESTOQUE_FABRICA,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) * ((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*');
      Add('QT_PROFUNDIDADE_MERCADORIA)/1000000)) MTS_CUBICO');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
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
      Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND ESTOQUE.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND EMP.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND ID_EMPRESA_FISICA=''S''');
      Add('AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
      Add('(SELECT CD_MERCADORIA,CD_EMPRESA FROM PRDDM.DC_OPERACAO_REDE_MERCADORIA OPR');
      Add('               WHERE ID_EXCLUSIVO_OPERACAO_REDE=''S''');
      Add('                 AND ID_SITUACAO=''A'' )');



      Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('GROUP BY ESTOQUE.CD_EMPRESA,ID_UNIDADE_FEDERACAO)');
      Add('UNION ALL');
      Add('(SELECT 500 CD_EMPRESA, ''GERAL'' AS ID_UNIDADE_FEDERACAO,SUM(ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA ) AS UNID_ESTOQUE,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )*vl_custo_financeiro_mercadoria) AS VL_ESTOQUE_FINANCEIRO,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* Lista.VL_UNITARIO_COMPRA) AS VL_ESTOQUE_FORNECEDOR,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* FINANCEIRO.VL_PRECO_VENDA) AS VL_ESTOQUE_VENDA,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* VL_BASE_VENDA) AS VL_ESTOQUE_FABRICA,');
      Add('SUM((ESTOQUE.QT_FISICO- QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA )* ((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000))');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
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
      Add('AND EMP.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');
      Add('AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
      Add('(SELECT CD_MERCADORIA,CD_EMPRESA FROM PRDDM.DC_OPERACAO_REDE_MERCADORIA OPR');
      Add('               WHERE ID_EXCLUSIVO_OPERACAO_REDE=''S''');
      Add('                 AND ID_SITUACAO=''A'' )');
      Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND ESTOQUE.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor))');
      Add('ORDER BY  cd_empresa');

      stQry.SaveToFile('C:\TEMP\sqlDadosEstoque.sql');
      with _cdsEstoqueEmpresa do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsBcd := PnrFornecedor;
        open;
      end;
      SetNomeCamposDadosEstoque;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetNomeCamposDadosEstoque;
begin
  TStringField(_cdsEstoqueEmpresa.FieldByName('LOCAL')).DisplayLabel := 'Local';
  TStringField(_cdsEstoqueEmpresa.FieldByName('LOCAL')).DisplayWidth := 05;

  TIntegerField(_cdsEstoqueEmpresa.FieldByName('UNID_ESTOQUE')).DisplayLabel :=
    'Unid.Estoque';
  TIntegerField(_cdsEstoqueEmpresa.FieldByName('UNID_ESTOQUE')).DisplayFormat :=
    '###,###,##0';
  TIntegerField(_cdsEstoqueEmpresa.FieldByName('UNID_ESTOQUE'))
    .DisplayWidth := 12;

  TIntegerField(_cdsEstoqueEmpresa.FieldByName('CD_EMPRESA'))
    .DisplayLabel := 'CD';
  TIntegerField(_cdsEstoqueEmpresa.FieldByName('CD_EMPRESA'))
    .DisplayFormat := '##0';
  TIntegerField(_cdsEstoqueEmpresa.FieldByName('CD_EMPRESA'))
    .DisplayWidth := 05;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FORNECEDOR'))
    .DisplayLabel := 'Vlr.Pre?o Lista';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FORNECEDOR'))
    .DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FORNECEDOR'))
    .DisplayWidth := 10;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FINANCEIRO')).DisplayLabel := 'Vlr.Pre?o Custo';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FINANCEIRO')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FINANCEIRO')).DisplayWidth := 10;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FABRICA')).DisplayLabel := 'Vlr.P?o Fabrica';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FABRICA')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_FABRICA')).DisplayWidth := 10;


  TFloatField(_cdsEstoqueEmpresa.FieldByName('MTS_CUBICO')).DisplayLabel := 'Mts.Cubico';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('MTS_CUBICO')).DisplayFormat :=    '###,##0.0000';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('MTS_CUBICO')).DisplayWidth := 06;

  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_VENDA')).DisplayLabel  := 'Vlr.P?o Venda';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_VENDA')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoqueEmpresa.FieldByName('VL_ESTOQUE_VENDA')).DisplayWidth := 10;
end;

procedure T_frmTelaCompras.DadosEstoquePendente(PnrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin

      Add('SELECT');
      Add('ID_UNIDADE_FEDERACAO AS  LOCAL,');
      Add('NR_UNIDADES_PENDENTES,');
      Add('VL_PENDENCIA_CUSTO,');
      Add('VL_PENDENCIA_FORNECEDOR,');
      Add('VL_PENDENCIA_VENDA,');
      Add('VL_PENDENCIA_FABRICA,');
      Add('MTS_CUBICO_PEDENTE,CD_EMPRESA_DESTINO');
      Add('FROM');
      Add('((SELECT  CAPA.CD_EMPRESA_DESTINO,ID_UNIDADE_FEDERACAO,');
      Add('SUM(QUAY_Y - CHEY_Y) AS NR_UNIDADES_PENDENTES,');
      Add('SUM((QUAY_Y - CHEY_Y)* VCCI_Y) AS VL_PENDENCIA_CUSTO,');
      Add('SUM((QUAY_Y - CHEY_Y) * VL_PRECO_VENDA) AS VL_PENDENCIA_VENDA,');
      Add('SUM((QUAY_Y - CHEY_Y) * PFBY_Y) AS VL_PENDENCIA_FORNECEDOR,');
      Add('SUM((QUAY_Y - CHEY_Y) *  LISTA.VL_BASE_VENDA) AS VL_PENDENCIA_FABRICA,');
      Add('SUM((QUAY_Y - CHEY_Y)* ((QT_LARGURA_MERCADORIA*');
      Add('QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO_PEDENTE');
      Add('FROM');
      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
//      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
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

      Add('LISTA ON LISTA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');

      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND NROM_Y=MERCADORIA.CD_MERCADORIA');
      //Add('AND item.cd_operacao_rede in(0,1)');
      Add('AND NROM_Y=FINANCEIRO.CD_MERCADORIA');
      Add('AND CAPA.CD_EMPRESA_DESTINO=FINANCEIRO.CD_EMPRESA');
      Add('AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');
      Add('AND SITP_P IN(''P'',''N'',''T'')');
      Add('AND SITY_Y IN(''P'',''N'',''T'')');
      Add('AND EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');
      Add('AND (FINANCEIRO.CD_MERCADORIA,FINANCEIRO.CD_EMPRESA) NOT IN');
      Add('(SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
      Add('                      WHERE id_exclusivo_operacao_rede=''S''');
      Add('                       AND id_situacao=''A'' )');
      Add('AND LABP_P=:PnrFornecedor');
      Add('GROUP BY CAPA.CD_EMPRESA_DESTINO,ID_UNIDADE_FEDERACAO)');
      Add('UNION ALL');
      Add('(SELECT  500 CD_EMPRESA,''GERAL'' AS ID_UNIDADE_FEDERACAO,');
      Add('SUM(QUAY_Y - CHEY_Y) AS NR_UNIDADES_PENDENTES,');
      Add('SUM((QUAY_Y - CHEY_Y) *VCCI_Y) AS VL_PENDENCIA_CUSTO,');
      // ADD('SUM(QUAY_Y *PUNY_Y) AS VL_PENDENCIA_FINANCEIRO,');
      Add('SUM((QUAY_Y - CHEY_Y) * VL_PRECO_VENDA) AS VL_PENDENCIA_VENDA,');
      Add('SUM((QUAY_Y - CHEY_Y) *  PFBY_Y) AS VL_PENDENCIA_FORNECEDOR,');
      Add('SUM((QUAY_Y - CHEY_Y) *  LISTA.VL_BASE_VENDA) AS VL_PENDENCIA_FABRICA,');
      Add('SUM((QUAY_Y - CHEY_Y)* ((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA');
      Add('*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO_PEDENTE');
      Add('FROM');
      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
//      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
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
      Add('LISTA ON LISTA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND NROM_Y=MERCADORIA.CD_MERCADORIA');
      Add('AND NROM_Y=FINANCEIRO.CD_MERCADORIA');
     // ADD('and CAPA.CD_OPERACAO_REDE=ITEM.CD_OPERACAO_REDE');
    //  ADD('and CAPA.CD_OPERACAO_REDE in(0,1)');
      Add('AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');
      Add('AND (FINANCEIRO.CD_MERCADORIA,FINANCEIRO.CD_empresa) NOT IN');
      Add('(SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
      Add('                      WHERE id_exclusivo_operacao_rede=''S''');
      Add('                       AND id_situacao=''A'' )');
      Add('AND CAPA.CD_EMPRESA_DESTINO=FINANCEIRO.CD_EMPRESA');
      Add('AND SITP_P IN(''P'',''N'',''T'')');
      Add('AND SITY_Y IN(''P'',''N'',''T'')');
      Add('AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');
      Add('AND LABP_P=:PnrFornecedor))');
      Add('ORDER BY CD_EMPRESA_DESTINO');
      stQry.SaveToFile('c:\temp\sqlPendenciaNovo.sql');
      with _cdsEstoquePendencia do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsBcd := PnrFornecedor;
        open;
      end;
      SetNomeCamposDadosPendenciaEstoque;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetNomeCamposDadosPendenciaEstoque;
begin
  TStringField(_cdsEstoquePendencia.FieldByName('LOCAL')).DisplayLabel
    := 'Local';
  TStringField(_cdsEstoquePendencia.FieldByName('LOCAL')).DisplayWidth := 05;

  TIntegerField(_cdsEstoquePendencia.FieldByName('NR_UNIDADES_PENDENTES')).DisplayLabel := 'Unid.Pendente';
  TIntegerField(_cdsEstoquePendencia.FieldByName('NR_UNIDADES_PENDENTES')).DisplayFormat := '###,###,##0';
  TIntegerField(_cdsEstoquePendencia.FieldByName('NR_UNIDADES_PENDENTES')).DisplayWidth := 10;

  TIntegerField(_cdsEstoquePendencia.FieldByName('CD_EMPRESA_DESTINO')).DisplayLabel := 'cd';
  TIntegerField(_cdsEstoquePendencia.FieldByName('CD_EMPRESA_DESTINO')).DisplayFormat := '##0';
  TIntegerField(_cdsEstoquePendencia.FieldByName('CD_EMPRESA_DESTINO')).DisplayWidth := 05;

  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FORNECEDOR')).DisplayLabel := 'Vlr.Pre?o Lista';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FORNECEDOR')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FORNECEDOR')).DisplayWidth := 10;

  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_CUSTO')).DisplayLabel := 'Vlr.Pre?o Custo';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_CUSTO')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_CUSTO')).DisplayWidth := 10;



  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FABRICA')).DisplayLabel := 'Vlr.P?o Fabrica';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FABRICA')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_FABRICA')).DisplayWidth := 10;


  TFloatField(_cdsEstoquePendencia.FieldByName('MTS_CUBICO_PEDENTE')).DisplayLabel := 'Mts.Cubico';
  TFloatField(_cdsEstoquePendencia.FieldByName('MTS_CUBICO_PEDENTE')).DisplayFormat := '###,##0.0000';
  TFloatField(_cdsEstoquePendencia.FieldByName('MTS_CUBICO_PEDENTE')).DisplayWidth := 06;

  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_VENDA')).DisplayLabel := 'Vlr.Pre?o Venda';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_VENDA')).DisplayFormat := '###,###,##0.00';
  TFloatField(_cdsEstoquePendencia.FieldByName('VL_PENDENCIA_VENDA')).DisplayWidth := 10;
end;

procedure T_frmTelaCompras.DadosVendaMes(PnrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT');
      Add('ID_UNIDADE_FEDERACAO LOCAL,');
      Add('SUM(QT_VENDIDA) AS NR_UNIDADES,SUM(VT_CMV) CMV,');
      Add('SUM(VL_PRECO_COMPRA*QT_VENDIDA) AS VT_FATURAMENTO_LISTA,');
      Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
      Add('SUM(QT_VENDIDA*FINANCEIRO.VL_PRECO_VENDA) AS VT_FATURAMENTO_VENDA,');
      Add('SUM(QT_VENDIDA*VL_BASE_VENDA) AS VT_FATURAMENTO_FABRICA,');

      Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
      Add('SUM(QT_VENDIDA*((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO');
      Add(',vam.cd_empresa');
      Add('');
      Add('FROM');
      Add('  PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VAM');
      Add('  JOIN  PRDDM.DC_MERCADORIA MERCADORIA ON VAM.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('  JOIN  PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON VAM.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA AND VAM.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('  JOIN  PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON VAM.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
      Add('                                                     AND VAM.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA');
      Add('  JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA AND id_empresa_fisica=''S''');

      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');



      Add('WHERE ');
      Add('CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('and cd_canal=0');
      Add('AND DT_VENDA_MERCADORIA=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY VAM.CD_EMPRESA,ID_UNIDADE_FEDERACAO');
      Add('UNION ALL');
      Add('(SELECT ''GERAL'',SUM(QT_VENDIDA) AS NR_UNIDADES,SUM(VT_CMV) CMV,');
      Add('SUM(VL_PRECO_COMPRA*QT_VENDIDA) AS VT_FATURAMENTO_LISTA,');
      Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
      Add('SUM(QT_VENDIDA*FINANCEIRO.VL_PRECO_VENDA) AS VT_FATURAMENTO_VENDA,');
      Add('SUM(QT_VENDIDA*VL_BASE_VENDA) AS VT_FATURAMENTO_FABRICA,');
      Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
      Add('SUM(QT_VENDIDA*((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) AS MTS_CUBICO');
      Add(',500 AS cd_empresa');
      Add('FROM');
      Add(' PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VAM ');
      Add('  JOIN  PRDDM.DC_MERCADORIA MERCADORIA ON VAM.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('  JOIN  PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON VAM.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA AND VAM.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('  JOIN  PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON VAM.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
      Add('                                                     AND VAM.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA');
      Add('  JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA AND id_empresa_fisica=''S''');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('WHERE');
      Add('CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('and cd_canal=0');
      Add('AND DT_VENDA_MERCADORIA=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0))');
      Add('order by cd_empresa');

      stQry.SaveToFile('C:\TEMP\QrySomaVendaLaboratorioNovo.sql');
      with _cdsVendaMes do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsBcd := PnrFornecedor;
        open;
      end;
      SetNomeCamposDadosVendaMes;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetNomeCamposDadosVendaMes;
begin
  TStringField(_cdsVendaMes.FieldByName('LOCAL')).DisplayLabel := 'Local';
  TStringField(_cdsVendaMes.FieldByName('LOCAL')).DisplayWidth := 05;

  TIntegerField(_cdsVendaMes.FieldByName('NR_UNIDADES')).DisplayLabel := 'Unid.Faturadas';
  TIntegerField(_cdsVendaMes.FieldByName('NR_UNIDADES')).DisplayFormat :='###,###,##0';
  TIntegerField(_cdsVendaMes.FieldByName('NR_UNIDADES')).DisplayWidth := 10;

  TIntegerField(_cdsVendaMes.FieldByName('CD_EMPRESA')).DisplayLabel := 'CD';
  TIntegerField(_cdsVendaMes.FieldByName('CD_EMPRESA')).DisplayFormat := '##0';
  TIntegerField(_cdsVendaMes.FieldByName('CD_EMPRESA')).DisplayWidth := 05;

  TFloatField(_cdsVendaMes.FieldByName('CMV')).DisplayLabel := 'Vlr. Total CMV';
  TFloatField(_cdsVendaMes.FieldByName('CMV')).DisplayFormat :='###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('CMV')).DisplayWidth := 10;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LISTA')).DisplayLabel :='Fat.Pre?o Lista';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LISTA')).DisplayFormat :='###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LISTA')).DisplayWidth := 10;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayLabel:= 'Fat.Liquido';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayFormat:= '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayWidth := 10;



  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_FABRICA')).DisplayLabel:= 'Fat.P?o.Fabrica';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_FABRICA')).DisplayFormat:= '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_FABRICA')).DisplayWidth := 10;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayLabel :='Fat.Bruto';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayFormat :='###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayWidth := 10;

  TFloatField(_cdsVendaMes.FieldByName('MTS_CUBICO')).DisplayLabel :='Mts.Cubico';
  TFloatField(_cdsVendaMes.FieldByName('MTS_CUBICO')).DisplayFormat :='###,##0.0000';
  TFloatField(_cdsVendaMes.FieldByName('MTS_CUBICO')).DisplayWidth := 06;

  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_VENDA')).DisplayLabel :=
    'Vlr.Pre?o Venda';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_VENDA')).DisplayFormat :=
    '###,###,##0.00';
  TFloatField(_cdsVendaMes.FieldByName('VT_FATURAMENTO_VENDA'))
    .DisplayWidth := 13;
end;

procedure T_frmTelaCompras.DadosSugestaoCompra(PnrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin



       Add('           SELECT');
       Add('        (SELECT NM_EMPRESA FROM acesso.dc_empresa e WHERE ID_EMPRESA_FISICA=''S'' AND e.CD_EMPRESA=CD_EMPRESA_1) AS cd,');
       Add('        Sum(QT_PEDIDO) QT_SUGERIDA ,');
       Add('        Sum(QT_PEDIDO*PFBY_Y  ) AS VT_COMPRA,');
       Add('        Sum(QT_PEDIDO*PUNY_Y  ) AS VL_C_DESCONTO,');
       Add('        Sum(QT_PEDIDO*VL_PRECO_VENDA) AS VT_VENDA,');
       Add('        Sum(QT_PEDIDO*PFBY_Y  ) AS VT_FABRICA,');
       Add('        CD_EMPRESA_CROSSDONKING');
       Add('       FROM');
       Add('              (  SELECT');
       Add('         CD_MERCADORIA');
       Add('         ,case');
       Add('           when IdPedidoExcecao=1 then nvl(QT_PEDIDO,0)');
       Add('           else 0');
       Add('         end QT_PEDIDO');
       Add('         ,VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)) PUNY_Y');
       Add('         ,VL_UNITARIO_COMPRA PFBY_Y');
       Add('        ,          nvl(QT_PEDIDO,0) as QT_PEDIDO1');
       Add('        ,MEDIA_PREVISAO AS VL_MEDIA_VENDA');
       Add('        ,CD_EMPRESA_CROSSDONKING');
       Add('        ,CD_EMPRESA AS CD_EMPRESA_1');
       Add('        ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (');
       Add('       SELECT');
       Add('        MEDIA_PREVISAO');
       Add('       ,CD_EMPRESA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_PENDENTE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('       ,QT_INTEIRA_CAMADA');
       Add('        ,CONSUMO_ESTOQUE');
       Add('        ,PROJECAO_ESTOQUE');
       Add('        ,DT_BLOQUEIO_COMPRA');
       Add('        ,DT_INATIVACAO_FUTURA');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,VL_UNITARIO_COMPRA');
       Add('       ,QTD_CAIXA_CAMADA');
       Add('       ,QTD_CAIXA_PALETE');
       Add('       ,FREQUENCIA_COMPRA');
       Add('       ,QT_INTEIRA_CAMADA');
       Add('       ,CD_MERCADORIA');
       Add('       ,DIAS_ESTOQUE_PENDENCIA');
       Add('       ,QT_PEDIDO QT_SUGERIDA');
       Add('       ,CASE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE) * QTD_CAIXA_PALETE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) THEN (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0)');
       Add('          THEN ROUND((ROUND(QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA,5)/QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0) AND (QT_INTEIRA_CAMADA=0) THEN QT_INTEIRA_CAMADA  * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA=0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO>0) AND (MEDIA_PREVISAO>0) AND ((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME) *MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)>0 THEN');
       Add('         Round((((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME)*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');
       Add('         ELSE  QT_PEDIDO');
       Add('       END QT_PEDIDO    ');
       Add('       ,nvl(QT_DESVIOPADRAO_VENDA_DIARIA,0) as  QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('       ,CASE');
       Add('           when (cd_empresa_crossdocking>0) AND (CD_EMPRESA_CROSSDOCKING<>CD_EMPRESA) AND (idForcaCross=1)  THEN CD_EMPRESA_CROSSDOCKING');
       Add('           ELSE CD_EMPRESA');
       Add('           END CD_EMPRESA_CROSSDONKING');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,(VL_UNITARIO_COMPRA -(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) *(PC_ICMS_COMPRA*0.01) VL_REDUCAO');
       Add('       ,IdPedidoExcecao');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,CASE');
       Add('        WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.076');
       Add('       ELSE 0');
       Add('       END VL_PIS');
       Add('       ,CASE');
       Add('       WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.0165');
       Add('       ELSE 0');
       Add('       END VL_CONFINS');
       Add('       ,Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA)/100))) * (PC_ICMS_COMPRA/100),5)  AS VL_CREDITO_ICMS_SDESC');
       Add('       ,Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_ICMS_COMPRA/100),5)  AS VL_CREDITO_ICMS_CDESC');
       Add('       ,CASE');
       Add('       WHEN  ID_COFINS=''T'' THEN Round(VL_UNITARIO_COMPRA * 0.0925,5)');
       Add('       else 0');
       Add('       END  VL_PISCONFINS_SDESC');
       Add('       ,CASE');
       Add('       WHEN  ID_COFINS=''T'' THEN Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * 0.0925,5)');
       Add('       else 0');
       Add('       END  VL_PISCONFINS_CDESC');
       Add('       ,Round(VL_UNITARIO_COMPRA *(PC_IPI_MERCADORIA/100),5) VL_IPI');
       Add('       ,Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_IPI_MERCADORIA/100),5) AS   VL_IPI_C_DESC');
       Add('       ,PC_ICMS_COMPRA_LISTA');
       Add('       ,Case');
       Add('        when NR_DIAS_INFORMADO>0 then NR_DIAS_INFORMADO');
       Add('       Else  NR_DIAS_PADRAO');
       Add('       End  NR_DIAS_PEDIDO');
       Add('       ,NR_DIAS_INFORMADO');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
      Add('        ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (');
       Add('       SELECT');
       Add('       QT_PEDIDO');
       Add('       , CASE');
       Add('          WHEN (QTD_CAIXA_PALETE>0) THEN  TRUNC((QT_PEDIDO/QTD_CAIXA_PALETE),0)');
       Add('        END QT_PARTE_INTEIRA_PALETE');
       Add('        ,CASE');
       Add('           WHEN  (MEDIA_PREVISAO>0) AND (QTD_CAIXA_PALETE>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/(QTD_CAIXA_PALETE) - TRUNC(QT_PEDIDO/(QTD_CAIXA_PALETE)),6))*(QTD_CAIXA_PALETE))/MEDIA_PREVISAO,4)');
       Add('        END QT_PARTE_FRACAO_PALETE');
       Add('        ,CASE');
       Add('           WHEN  (MEDIA_PREVISAO>0) AND (QTD_CAIXA_CAMADA>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA - TRUNC(QT_PEDIDO/QTD_CAIXA_CAMADA),6))*(QTD_CAIXA_CAMADA))/MEDIA_PREVISAO,4)');
       Add('       END QT_FRACAO_CAMADA');
       Add('        ,CASE');
       Add('           WHEN (QTD_CAIXA_CAMADA>0) THEN TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA,0)');
       Add('        END QT_INTEIRA_CAMADA');
       Add('        ,MEDIA_PREVISAO');
       Add('       ,CD_EMPRESA');
       Add('       ,CD_MERCADORIA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,CASE');
       Add('       WHEN VL_COMPRA_EXCECAO>0 THEN VL_COMPRA_EXCECAO');
       Add('       ELSE VL_UNITARIO_COMPRA');
       Add('       END VL_UNITARIO_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('        ,PROJECAO_ESTOQUE');
       Add('        ,DT_BLOQUEIO_COMPRA');
       Add('        ,DT_INATIVACAO_FUTURA');
       Add('       ,QT_SEGURANCA');
       Add('       ,QTD_CAIXA_CAMADA');
       Add('       ,QTD_CAIXA_PALETE');
       Add('       ,FREQUENCIA_COMPRA');
       Add('       ,DIAS_ESTOQUE_PENDENCIA');
       Add('       ,QT_SEGURANCA');
       Add('        ,CONSUMO_ESTOQUE');
       Add('       ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CASE');
       Add('       WHEN CD_LISTA_EXCECAO >0 THEN CD_LISTA_EXCECAO');
       Add('       ELSE CD_LISTA_GAM');
       Add('       END CD_LISTA_GAM');
       Add('       ,VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,QT_PENDENTE');
       Add('       ,to_number(''0'') as  NR_DIAS_INFORMADO');
       Add('       ,1 as   IdPedidoExcecao');
       Add('       ,1 as idForcaCross');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,PC_IPI_MERCADORIA');
       Add('       ,CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add('       ,NR_DIAS_PADRAO');
       Add('       ,QT_DIAS_MEDIO_LEADTIME');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
       Add('       ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (SELECT');
       Add('        MEDIA_PREVISAO');
       Add('       ,CD_EMPRESA');
       Add('       ,CD_MERCADORIA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,VL_UNITARIO_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('        ,CONSUMO_ESTOQUE');
       Add('        ,PROJECAO_ESTOQUE');
       Add('        ,DT_BLOQUEIO_COMPRA');
       Add('        ,DT_INATIVACAO_FUTURA');
       Add('       ,QT_SEGURANCA');
       Add('       ,QT_PENDENTE');
       Add('       ,QTD_CAIXA_CAMADA');
       Add('       ,QTD_CAIXA_PALETE');
       Add('       ,FREQUENCIA_COMPRA');
       Add('        ,CASE');
       Add('          WHEN MEDIA_PREVISAO>0 THEN  ROUND((QT_ESTOQUE + QT_PENDENTE) /MEDIA_PREVISAO,3)');
       Add('          ELSE (QT_ESTOQUE + QT_PENDENTE)/.5');
       Add('           END  DIAS_ESTOQUE_PENDENCIA');
       Add('       ,CASE');
       Add('            WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       Add('            WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       Add('                 (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       Add('                   AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       Add('           WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       Add('             ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');
       Add('          ELSE 0');
       Add('        END   QT_PEDIDO');
       Add('       ,CASE');
       Add('            WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       Add('            WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       Add('                 (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       Add('                   AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       Add('           WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       Add('             ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)),0)');
       Add('          ELSE 0');
       Add('        END   QT_PEDIDO_IDEAL');
       Add('       ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,PC_IPI_MERCADORIA');
       Add('       ,CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add('       ,NR_DIAS_PADRAO');
       Add('       ,QT_DIAS_MEDIO_LEADTIME');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
       Add('       ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (SELECT');
       Add('       CD_EMPRESA');
       Add('       ,CD_MERCADORIA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('       ,QT_PENDENTE');
       Add('        ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('        ,PC_DESCONTO_PADRAO_COMPRA');
       Add('        ,VL_UNITARIO_COMPRA');
       Add('        ,MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS CONSUMO_ESTOQUE');
       Add('        , (QT_ESTOQUE +QT_PENDENTE) - MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS PROJECAO_ESTOQUE');
       Add('        , DT_BLOQUEIO_COMPRA');
       Add('        , DT_INATIVACAO_FUTURA');
       Add('        , CASE');
       Add('          WHEN NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/ VL_INDICE_COMPRA<MEDIA_PREVISAO  THEN');
       Add('              ROUND(VLINDICENSPADRAO*SQRT((POWER((NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/VL_INDICE_COMPRA),2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),0)');
       Add('         ELSE');
       Add('              ROUND(VLINDICENSPADRAO*SQRT((POWER(MEDIA_PREVISAO,2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),3)');
       Add('         END  QT_SEGURANCA');
       Add('         ,MEDIA_PREVISAO');
       Add('         ,QTD_CAIXA_CAMADA');
       Add('         ,QTD_CAIXA_PALETE');
       Add('         ,FREQUENCIA_COMPRA');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,PC_IPI_MERCADORIA');
       Add('       ,CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add('       ,round(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME,0) as NR_DIAS_PADRAO');
       Add('       ,QT_DIAS_MEDIO_LEADTIME');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
       Add('       ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (SELECT');
       Add('       ESTOQUE.CD_EMPRESA,');
       Add('       MERCADORIA.CD_MERCADORIA,');
       Add('       NM_MERCADORIA ,');
       Add('       DS_APRESENTACAO_MERCADORIA');
       Add('       ,QT_FISICO-(QT_RESERVADO+QT_RESERVA_PROBLEMATICA+QT_VENCIDO) QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,DT_BLOQUEIO_COMPRA');
       Add('       ,DT_INATIVACAO_FUTURA');
       Add('       ,FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,CASE');
       Add('       WHEn cd_operador>1 THEN PC_DESCONTO_PADRAO_COMPRA');
       Add('       ELSE PC_DESCONTO_PADRAO_COMPRA');
       Add('       END PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,NVL(QT_PENDENTE,0)+Nvl(QT_TRANSFERENCIA,0) +Nvl(QT_TRANSITO,0) AS QT_PENDENTE ,');
       Add('        CASE');
       Add('         WHEN  (COMPRA.cd_empresa_crossdocking>0) AND (VENDA.CD_EMPRESA=1) THEN QT_DIAS_MEDIO_LEADTIME+5');
       Add('        ELSE QT_DIAS_MEDIO_LEADTIME');
       Add('        END QT_DIAS_MEDIO_LEADTIME');
       Add('        ,QT_DIAS_DESVIOPADRAO_LEADTIME');
       Add('       ,CASE');
       Add('          WHEN COMPRA.ID_CURVA_MERCADORIA=''A'' THEN 2.06');
       Add('          WHEN COMPRA.ID_CURVA_MERCADORIA=''B'' THEN 1.76');
       Add('          ELSE 1.56');
       Add('        END VLINDICENSPADRAO,');
       Add('        (28/FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE ) AS VL_INDICE_COMPRA');
       Add('        ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('        ,VL_UNITARIO_COMPRA_L,');
       Add('         CASE');
       Add('           WHEN QT_PREVISAO<> -9999  THEN ROUND(QT_PREVISAO/30,5)');
       Add('           ELSE QT_MEDIA_VENDA_DIARIA');
       Add('        END MEDIA_PREVISAO');
       Add('        ,QT_CAIXA_PALETE');
       Add('        ,QT_CAIXA_CAMADA');
       Add('        ,QT_CAIXA_CAMADA * QT_EMBALAGEM_COMPRA AS QTD_CAIXA_CAMADA');
       Add('       , QT_CAIXA_PALETE* QT_EMBALAGEM_COMPRA AS QTD_CAIXA_PALETE');
       Add('       ,GFM.QT_DIAS_FREQUENCIA_COMPRA FREQUENCIA_COMPRA');
       Add('       ,CASE');
       Add('         WHEN VL_UNITARIO_COMPRA_L=0 THEN  VL_PRECO_COMPRA');
       Add('         ELSE    VL_UNITARIO_COMPRA_L');
       Add('         END  VL_UNITARIO_COMPRA');
       Add('       ,Nvl(1,1) AS NR_OPERADOR_LOGISTICO');
       Add('       ,NVL(CD_LISTA_GAM,0) as CD_LISTA_GAM,  nvl(VL_BASE_VENDA,0) as VL_BASE_VENDA,nvl(PC_ICMS_VENDA,0) as PC_ICMS_VENDA');
       Add('       ,CASE');
       Add('        WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   nvl(PC_CREDITO_ICMS,0)');
       Add('        WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN');
       Add('         (SELECT nvl(PC_CREDITO_ICMS,0) FROM PRDDM.DC_FISCAL_MERCADORIA FISCAL WHERE FISCAL.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
       Add('                                       AND  CD_EMPRESA=(SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=CD_EMPRESA_CROSSDOCKING))');
       Add('       END   PC_ICMS_COMPRA');
       Add('       ,Nvl(PC_ICMS_COMPRA,0) as PC_ICMS_COMPRA_LISTA');
       Add('       ,round(NVL(PC_DESCONTO_COMPRA,0),2) AS PC_DESC_ADICIONAL');
       Add('       ,NVL(VL_COMPRA_MERCADORIA,0) AS VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,NVL(PC_REPASSE,0) AS PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,Nvl(PC_IPI_MERCADORIA,000.0) AS PC_IPI_MERCADORIA');
       Add('       ,CASE');
       Add('          WHEN CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING)');
       Add('          WHEN CD_EMPRESA_CROSSDOCKING=0 THEN  COMPRA.cd_Empresa');
       Add('       END CD_EMPRESA_CROSSDOCKING');
       Add('        ,CASE');
       Add('           WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   VL_CUSTO_GERENCIAL');
       Add('          WHEN CD_EMPRESA_CROSSDOCKING>0 THEN  (SELECT VL_CUSTO_GERENCIAL FROM PRDDM.DC_FINANCEIRO_MERCADORIA FINAC  WHERE');
       Add('                                      FINAC.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  FINAC.CD_EMPRESA=(SELECT CD_EMPRESA_FISICA');
       Add('                                                  FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=COMPRA.CD_EMPRESA_CROSSDOCKING))');
       Add('           END  VL_CUSTO_GERENCIAL');
       Add('          ,CASE');
       Add('           WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   PC_REPASSE_COMPRA');
       Add('           WHEN CD_EMPRESA_CROSSDOCKING>0 THEN  (SELECT PC_REPASSE_COMPRA FROM PRDDM.DC_COMPRA_MERCADORIA COMPRA1  WHERE');
       Add('                                                COMPRA1.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  COMPRA1.CD_EMPRESA=(SELECT CD_EMPRESA_FISICA');
       Add('                                                FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=COMPRA.CD_EMPRESA_CROSSDOCKING))');
       Add('        END  PC_REPASSE_COMPRA');
       Add('        ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('         PRDDM.DC_MERCADORIA MERCADORIA,');
       Add('         PRDDM.DC_ESTOQUE_MERCADORIA  ESTOQUE,');
       Add('         PRDDM.DC_COMPRA_MERCADORIA  COMPRA,');
       Add('         PRDDM.DC_FINANCEIRO_MERCADORIA  FINANCEIRO,');
       Add('         PRDDM.DC_FISCAL_MERCADORIA  FISCAL,');
       Add('         PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
       Add('         PRDDM.DC_GRUPO_FORNECEDOR FORNECEDOR,');
       Add('         PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM,');
       Add('         (SELECT CM.CD_EMPRESA, CM.CD_MERCADORIA,');
       Add('                LP.VL_UNITARIO_COMPRA AS VL_UNITARIO_COMPRA_L,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA, CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,CASE');
       Add('           WHEN PC_ICMS_COMPRA>0 THEN   Round((100-(100-PC_ICMS_VENDA)/(100-PC_ICMS_COMPRA)*100),2)');
       Add('           ELSE  0');
       Add('        END  PC_REPASSE');
       Add('              FROM');
       Add('              PRDDM.DC_COMPRA_MERCADORIA CM,');
       Add('              PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
       Add('              WHERE');
       Add('                 CM.CD_MERCADORIA=LP.CD_MERCADORIA');
       Add('                 AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),CM.cd_empresa) = LP.CD_EMPRESA');
       Add('                 AND CM.ID_SITUACAO_MERCADORIA=''A''');
       Add('                 AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
       Add('                 AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
       Add('                                         FROM');
       Add('                                           PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF,');
       Add('                                           PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       Add('                                         WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
       Add('                                         AND COMPRA.CD_MERCADORIA=LPF.CD_MERCADORIA');
       Add('                                         AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),compra.cd_empresa)=LPF.CD_EMPRESA');
       Add('                                         AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
       Add('                                         AND LPF.DT_MUDANCA_PRECO <= SYSDATE)) LISTA_PRECO,');
       Add('         (SELECT NROM_Y,CD_EMPRESA_DESTINO,LABP_P,SUM(QUAY_Y-CHEY_Y) QT_PENDENTE');
       Add('          FROM');
       Add('            PRDDM.DCPCC C,');
       Add('            PRDDM.DCPCI I,');
       Add('            ACESSO.DC_EMPRESA emp');
       Add('         WHERE');
       Add('          NROP_P=NROP_Y');
       Add('          AND SITY_Y IN(''N'',''P'')');
       Add('          AND SITP_P IN(''N'',''P'')');
       Add('          AND EMP.CD_EMPRESA=C.CD_EMPRESA_DESTINO');
       Add('          AND EMP.ID_EMPRESA_FISICA=''S''');
       Add('          AND ((c.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'') ) OR  c.CD_OPERACAO_REDE=0)');
       Add('         AND LABP_P=137');
       Add('         GROUP BY NROM_Y,CD_EMPRESA_DESTINO,LABP_P) PENDENCIA,');
       Add('        ( SELECT  cd_mercadoria');
       Add('          ,cd_empresa_destino');
       Add('          ,Sum(qt_transferencia) AS qt_transferencia');
       Add('         , Sum(qt_transito) AS   qt_transito');
       Add('        FROM PRDDM.DC_ESTOQUE_TRANSFERENCIA');
       Add('        GROUP BY cd_mercadoria');
       Add('         ,cd_empresa_destino) TRANS,');
       Add('         PRDDM.DC_LEADTIME_FORNECEDOR  LTIME,');
       Add('         PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR');
       Add('       ,(SELECT');
       Add('       CD_PRECO_FORNECEDOR_EXCECAO AS CD_LISTA_EXCECAO,');
       Add('           LPE.CD_EMPRESA,  LPE.CD_MERCADORIA,');
       Add('           VL_COMPRA_MERCADORIA,');
       Add('           VL_COMPRA_MERCADORIA_DESCONTO,');
       Add('           PC_DESCONTO_COMPRA,');
       Add('           NR_VERBA');
       Add('       FROM');
       Add('       PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPE,');
       Add('       prddM.DC_COMPRA_MERCADORIA cm');
       Add('       WHERE');
       Add('       LPE.CD_MERCADORIA=CM.CD_MERCADORIA');
       Add('       AND LPE.CD_EMPRESA=CM.CD_EMPRESA');
       Add('       AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('       AND CD_PRECO_FORNECEDOR_EXCECAO=0) LISTA_EXCECAO');
       Add('       ,(SELECT');
       Add('       COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
       Add('       CASE');
       Add('        when  QT_PREVISAO>0 then QT_PREVISAO');
       Add('        when  QT_PREVISAO<=0 then 0');
       Add('        when QT_PREVISAO is null then -9999');
       Add('       END QT_PREVISAO,');
       Add('       Nvl(DT_PREVISAO ,TRUNC(sysdate,''MONTH'')) AS DT_PREVISAO');
       Add('       FROM');
       Add('       PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
       Add('       GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
       Add('       WHERE');
       Add('        PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('       AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('       AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
       Add('       AND DT_PREVISAO(+)=TRUNC(sysdate,''MONTH'')) PREVISAO_NOVA');
       Add('       WHERE');
       Add('        MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
       Add('        AND COMPRA.CD_GRUPO_FORNECEDOR=LTIME.CD_GRUPO_FORNECEDOR(+)');
       Add('          AND CD_LEADTIME=4');
       Add('          AND COMPRA.CD_EMPRESA=LTIME.CD_EMPRESA(+)');
       Add('          AND ID_TERMOLABIL=''N''');
       Add('          AND OL_FORNECEDOR.CD_OPERADOR(+)=1');
       Add('       AND OL_FORNECEDOR.CD_empresa(+)= COMPRA.cd_empresa');
       Add('          AND OL_FORNECEDOR.CD_FORNECEDOR(+)=COMPRA.CD_GRUPO_FORNECEDOR');
       Add('');
       Add('        AND COMPRA.CD_GRUPO_FORNECEDOR= FORNECEDOR.CD_GRUPO_FORNECEDOR');
       Add('        AND GFM.ID_CURVA_MERCADORIA       = COMPRA.ID_CURVA_MERCADORIA');
       Add('        AND GFM.CD_GRUPO_CURVA_FABRICANTE = FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       Add('        AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
       Add('        AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
       Add('        AND FINANCEIRO.ID_SITUACAO_MERCADORIA=''A''');
       Add('        AND FISCAL.ID_SITUACAO_MERCADORIA=''A''');
       Add('        AND FISCAL.ID_VENDA_AUTORIZADA=''S''');
       Add('        AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('        AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
       Add('        AND FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('        AND FINANCEIRO.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
       Add('        AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
       Add('        AND FINANCEIRO.CD_EMPRESA=FISCAL.CD_EMPRESA');
       Add('        AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('       AND COMPRA.CD_MERCADORIA=LISTA_EXCECAO.CD_MERCADORIA(+)');
       Add('       AND COMPRA.CD_EMPRESA=LISTA_EXCECAO.CD_EMPRESA(+)');
       Add('        AND COMPRA.CD_MERCADORIA=LISTA_PRECO.CD_MERCADORIA(+)');
       Add('        AND COMPRA.CD_EMPRESA=LISTA_PRECO.CD_EMPRESA(+)');
       Add('         AND  COMPRA.CD_MERCADORIA=VENDA.CD_MERCADORIA(+)');
       Add('         AND CD_CANAL=0');
       Add('         AND  COMPRA.CD_EMPRESA=VENDA.CD_EMPRESA');
       Add('         AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
       Add('        (SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
       Add('                      WHERE id_exclusivo_operacao_rede=''S''');
       Add('                       AND id_situacao=''A'' AND cd_operacao_rede=6)');
       Add('         AND   VENDA.DT_VENDA_MERCADORIA>=(SELECT Max(DT_VENDA_MERCADORIA)   FROM prddm.dw_venda_acumulada_mercadoria WHERE cd_canal=0)');
       Add('       AND COMPRA.CD_MERCADORIA=PREVISAO_NOVA.cd_mercadoria(+)');
       Add('       AND COMPRA.CD_EMPRESA=PREVISAO_NOVA.CD_EMPRESA(+)');
       Add('         AND COMPRA.CD_GRUPO_FORNECEDOR=PENDENCIA.LABP_P(+)');
       Add('         AND COMPRA.CD_MERCADORIA=NROM_Y(+)');
       Add('         AND COMPRA.CD_EMPRESA=PENDENCIA.CD_EMPRESA_DESTINO(+)');
       Add('         AND COMPRA.CD_MERCADORIA=TRANS.CD_MERCADORIA(+)');
       Add('         AND COMPRA.CD_EMPRESA=TRANS.CD_EMPRESA_DESTINO(+) ))))))');
       Add('       GROUP BY CD_EMPRESA_1,CD_EMPRESA_CROSSDONKING');
       Add('');
       Add('       UNION ALL');
       Add('');
       Add('       SELECT');
       Add('');
       Add('');
       Add('        ''Geral '' cd,   Sum(QT_PEDIDO) QT_SUGERIDA ,');
       Add('         Sum(QT_PEDIDO*PFBY_Y  ) AS VT_COMPRA,');
       Add('         Sum(QT_PEDIDO*PUNY_Y  ) AS  VL_C_DESCONTO');
       Add('        ,Sum(QT_PEDIDO*VL_PRECO_VENDA  ) AS  VT_VENDA,');
       Add('         Sum(QT_PEDIDO*PFBY_Y  ) AS   VT_FABRICA, 500 CD_EMPRESA_CROSSDONKING');
       Add('');
       Add('');
       Add('       FROM');
       Add('');
       Add('       (  SELECT');
       Add('         CD_MERCADORIA');
       Add('         ,case');
       Add('           when IdPedidoExcecao=1 then nvl(QT_PEDIDO,0)');
       Add('           else 0');
       Add('         end QT_PEDIDO');
       Add('');
       Add('         ,VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)) PUNY_Y');
       Add('         ,VL_UNITARIO_COMPRA PFBY_Y');
       Add('        ,          nvl(QT_PEDIDO,0) as QT_PEDIDO1');
       Add('        ,MEDIA_PREVISAO AS VL_MEDIA_VENDA');
       Add('        ,CD_EMPRESA_CROSSDONKING');
       Add('       ,CD_EMPRESA AS CD_EMPRESA_1');
       Add('        ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (');
       Add('       SELECT');
       Add('        MEDIA_PREVISAO');
       Add('       ,CD_EMPRESA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_PENDENTE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('       ,QT_INTEIRA_CAMADA');
       Add('        ,CONSUMO_ESTOQUE');
       Add('        ,PROJECAO_ESTOQUE');
       Add('        ,DT_BLOQUEIO_COMPRA');
       Add('        ,DT_INATIVACAO_FUTURA');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,VL_UNITARIO_COMPRA');
       Add('       ,QTD_CAIXA_CAMADA');
       Add('       ,QTD_CAIXA_PALETE');
       Add('       ,FREQUENCIA_COMPRA');
       Add('       ,QT_INTEIRA_CAMADA');
       Add('       ,CD_MERCADORIA');
       Add('       ,DIAS_ESTOQUE_PENDENCIA');
       Add('       ,QT_PEDIDO QT_SUGERIDA');
       Add('       ,CASE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE) * QTD_CAIXA_PALETE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0)  THEN  (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_PARTE_FRACAO_PALETE)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) THEN (QT_PARTE_INTEIRA_PALETE+1) * QTD_CAIXA_PALETE');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0)');
       Add('                                                                               THEN ROUND((ROUND(QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA,5)/QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN QT_INTEIRA_CAMADA * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)> FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE>0) AND (QT_INTEIRA_CAMADA=0) THEN QT_INTEIRA_CAMADA  * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA>0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO=0) and (QT_PEDIDO>0) AND ((DIAS_ESTOQUE_PENDENCIA+QT_FRACAO_CAMADA)< FREQUENCIA_COMPRA) AND (QT_PARTE_INTEIRA_PALETE=0) AND (QT_INTEIRA_CAMADA=0) THEN (QT_INTEIRA_CAMADA+1) * QTD_CAIXA_CAMADA');
       Add('         WHEN (NR_DIAS_INFORMADO>0) AND (MEDIA_PREVISAO>0) AND ((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME) *MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)>0 THEN');
       Add('         Round((((NR_DIAS_INFORMADO+QT_DIAS_MEDIO_LEADTIME)*MEDIA_PREVISAO) -(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');
       Add('         ELSE  QT_PEDIDO');
       Add('       END QT_PEDIDO');
       Add('       ,nvl(QT_DESVIOPADRAO_VENDA_DIARIA,0) as  QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('       ,CASE');
       Add('           when (cd_empresa_crossdocking>0) AND (CD_EMPRESA_CROSSDOCKING<>CD_EMPRESA) AND (idForcaCross=1)  THEN CD_EMPRESA_CROSSDOCKING');
       Add('           ELSE CD_EMPRESA');
       Add('           END CD_EMPRESA_CROSSDONKING');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,(VL_UNITARIO_COMPRA -(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) *(PC_ICMS_COMPRA*0.01) VL_REDUCAO');
       Add('       ,IdPedidoExcecao');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,CASE');
       Add('        WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.076');
       Add('       ELSE 0');
       Add('       END VL_PIS');
       Add('       ,CASE');
       Add('       WHEN  ID_COFINS=''T'' THEN (VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100)))*0.0165');
       Add('       ELSE 0');
       Add('       END VL_CONFINS');
       Add('       ,Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA)/100))) * (PC_ICMS_COMPRA/100),5)  AS VL_CREDITO_ICMS_SDESC');
       Add('       ,Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_ICMS_COMPRA/100),5)  AS VL_CREDITO_ICMS_CDESC');
       Add('       ,CASE');
       Add('       WHEN  ID_COFINS=''T'' THEN Round(VL_UNITARIO_COMPRA * 0.0925,5)');
       Add('       else 0');
       Add('       END  VL_PISCONFINS_SDESC');
       Add('       ,CASE');
       Add('       WHEN  ID_COFINS=''T'' THEN Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * 0.0925,5)');
       Add('       else 0');
       Add('       END  VL_PISCONFINS_CDESC');
       Add('       ,Round(VL_UNITARIO_COMPRA *(PC_IPI_MERCADORIA/100),5) VL_IPI');
       Add('       ,Round((VL_UNITARIO_COMPRA-(VL_UNITARIO_COMPRA*((PC_DESCONTO_PADRAO_COMPRA+PC_DESC_ADICIONAL)/100))) * (PC_IPI_MERCADORIA/100),5) AS   VL_IPI_C_DESC');
       Add('       ,PC_ICMS_COMPRA_LISTA');
       Add('       ,Case');
       Add('        when NR_DIAS_INFORMADO>0 then NR_DIAS_INFORMADO');
       Add('       Else  NR_DIAS_PADRAO');
       Add('       End  NR_DIAS_PEDIDO');
       Add('       ,NR_DIAS_INFORMADO');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
       Add('       ,VL_PRECO_VENDA');

       Add('       FROM');
       Add('       (');
       Add('       SELECT');
       Add('       QT_PEDIDO');
       Add('       , CASE');
       Add('          WHEN (QTD_CAIXA_PALETE>0) THEN  TRUNC((QT_PEDIDO/QTD_CAIXA_PALETE),0)');
       Add('        END QT_PARTE_INTEIRA_PALETE');
       Add('        ,CASE');
       Add('           WHEN  (MEDIA_PREVISAO>0) AND (QTD_CAIXA_PALETE>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/(QTD_CAIXA_PALETE) - TRUNC(QT_PEDIDO/(QTD_CAIXA_PALETE)),6))*(QTD_CAIXA_PALETE))/MEDIA_PREVISAO,4)');
       Add('        END QT_PARTE_FRACAO_PALETE');
       Add('        ,CASE');
       Add('           WHEN  (MEDIA_PREVISAO>0) AND (QTD_CAIXA_CAMADA>0) THEN  TRUNC(((1-  TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA - TRUNC(QT_PEDIDO/QTD_CAIXA_CAMADA),6))*(QTD_CAIXA_CAMADA))/MEDIA_PREVISAO,4)');
       Add('       END QT_FRACAO_CAMADA');
       Add('        ,CASE');
       Add('           WHEN (QTD_CAIXA_CAMADA>0) THEN TRUNC( QT_PEDIDO/QTD_CAIXA_CAMADA,0)');
       Add('        END QT_INTEIRA_CAMADA');
       Add('        ,MEDIA_PREVISAO');
       Add('       ,CD_EMPRESA');
       Add('       ,CD_MERCADORIA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,CASE');
       Add('       WHEN VL_COMPRA_EXCECAO>0 THEN VL_COMPRA_EXCECAO');
       Add('       ELSE VL_UNITARIO_COMPRA');
       Add('       END VL_UNITARIO_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('        ,PROJECAO_ESTOQUE');
       Add('        ,DT_BLOQUEIO_COMPRA');
       Add('        ,DT_INATIVACAO_FUTURA');
       Add('       ,QT_SEGURANCA');
       Add('       ,QTD_CAIXA_CAMADA');
       Add('       ,QTD_CAIXA_PALETE');
       Add('       ,FREQUENCIA_COMPRA');
       Add('       ,DIAS_ESTOQUE_PENDENCIA');
       Add('       ,QT_SEGURANCA');
       Add('        ,CONSUMO_ESTOQUE');
       Add('       ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CASE');
       Add('       WHEN CD_LISTA_EXCECAO >0 THEN CD_LISTA_EXCECAO');
       Add('       ELSE CD_LISTA_GAM');
       Add('       END CD_LISTA_GAM');
       Add('       ,VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,QT_PENDENTE');
       Add('       ,to_number(''0'') as  NR_DIAS_INFORMADO');
       Add('       ,1 as   IdPedidoExcecao');
       Add('       ,1 as idForcaCross');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,PC_IPI_MERCADORIA');
       Add('       ,CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add('       ,NR_DIAS_PADRAO');
       Add('       ,QT_DIAS_MEDIO_LEADTIME');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
        Add('       ,VL_PRECO_VENDA');

       Add('       FROM');
       Add('       (SELECT');
       Add('        MEDIA_PREVISAO');
       Add('       ,CD_EMPRESA');
       Add('       ,CD_MERCADORIA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,VL_UNITARIO_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('        ,CONSUMO_ESTOQUE');
       Add('        ,PROJECAO_ESTOQUE');
       Add('        ,DT_BLOQUEIO_COMPRA');
       Add('        ,DT_INATIVACAO_FUTURA');
       Add('       ,QT_SEGURANCA');
       Add('       ,QT_PENDENTE');
       Add('       ,QTD_CAIXA_CAMADA');
       Add('       ,QTD_CAIXA_PALETE');
       Add('       ,FREQUENCIA_COMPRA');
       Add('        ,CASE');
       Add('          WHEN MEDIA_PREVISAO>0 THEN  ROUND((QT_ESTOQUE + QT_PENDENTE) /MEDIA_PREVISAO,3)');
       Add('          ELSE (QT_ESTOQUE + QT_PENDENTE)/.5');
       Add('           END  DIAS_ESTOQUE_PENDENCIA');
       Add('       ,CASE');
       Add('            WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       Add('            WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       Add('                 (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       Add('                   AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       Add('           WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       Add('             ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA');
       Add('          ELSE 0');
       Add('        END   QT_PEDIDO');
       Add('       ,CASE');
       Add('            WHEN PROJECAO_ESTOQUE>QT_SEGURANCA THEN 0');
       Add('            WHEN ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') AND');
       Add('                 (ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)) /QT_EMBALAGEM_COMPRA,0)*QT_EMBALAGEM_COMPRA=0)');
       Add('                   AND (QT_SEGURANCA>0) AND ((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)>1) AND(PROJECAO_ESTOQUE<QT_SEGURANCA) THEN  QT_EMBALAGEM_COMPRA');
       Add('           WHEN   ((DT_BLOQUEIO_COMPRA=''01/01/2039'') or (DT_BLOQUEIO_COMPRA<=trunc(sysdate))) AND (DT_INATIVACAO_FUTURA=''01/01/2039'') THEN');
       Add('             ROUND(((CONSUMO_ESTOQUE+QT_SEGURANCA)-(QT_PENDENTE+QT_ESTOQUE)),0)');
       Add('          ELSE 0');
       Add('        END   QT_PEDIDO_IDEAL');
       Add('       ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,PC_IPI_MERCADORIA');
       Add('       ,CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add('       ,NR_DIAS_PADRAO');
       Add('       ,QT_DIAS_MEDIO_LEADTIME');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
       Add('       ,VL_PRECO_VENDA');
       Add('       FROM');
       Add('       (SELECT');
       Add('       CD_EMPRESA');
       Add('       ,CD_MERCADORIA');
       Add('       ,NM_MERCADORIA');
       Add('       ,DS_APRESENTACAO_MERCADORIA');
       Add('       , QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,CD_GRUPO_CURVA_FABRICANTE');
       Add('       ,QT_PENDENTE');
       Add('        --,MEDIA_PREVISAO');
       Add('        ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('        ,PC_DESCONTO_PADRAO_COMPRA');
       Add('        ,VL_UNITARIO_COMPRA');
       Add('        ,MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS CONSUMO_ESTOQUE');
       Add('        , (QT_ESTOQUE +QT_PENDENTE) - MEDIA_PREVISAO*(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME) AS PROJECAO_ESTOQUE');
       Add('        , DT_BLOQUEIO_COMPRA');
       Add('        , DT_INATIVACAO_FUTURA');
       Add('        , CASE');
       Add('          WHEN NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/ VL_INDICE_COMPRA<MEDIA_PREVISAO  THEN');
       Add('              ROUND(VLINDICENSPADRAO*SQRT((POWER((NVL(QT_DESVIOPADRAO_VENDA_DIARIA,0)/VL_INDICE_COMPRA),2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),0)');
       Add('         ELSE');
       Add('              ROUND(VLINDICENSPADRAO*SQRT((POWER(MEDIA_PREVISAO,2)* QT_DIAS_MEDIO_LEADTIME)+POWER(QT_DIAS_DESVIOPADRAO_LEADTIME,2)*POWER(MEDIA_PREVISAO,2)),3)');
       Add('         END  QT_SEGURANCA');
       Add('         ,MEDIA_PREVISAO');
       Add('         ,QTD_CAIXA_CAMADA');
       Add('         ,QTD_CAIXA_PALETE');
       Add('         ,FREQUENCIA_COMPRA');
       Add('       ,NR_OPERADOR_LOGISTICO');
       Add('       ,CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,PC_ICMS_COMPRA');
       Add('       ,PC_DESC_ADICIONAL');
       Add('       ,VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,PC_IPI_MERCADORIA');
       Add('       ,CD_EMPRESA_CROSSDOCKING,PC_ICMS_COMPRA_LISTA');
       Add('       ,round(CD_GRUPO_CURVA_FABRICANTE+QT_DIAS_MEDIO_LEADTIME,0) as NR_DIAS_PADRAO');
       Add('       ,QT_DIAS_MEDIO_LEADTIME');
       Add('       ,VL_CUSTO_GERENCIAL');
       Add('       ,PC_REPASSE_COMPRA');
       Add('        ,VL_PRECO_VENDA');

       Add('       FROM');
       Add('       (SELECT');
       Add('       ESTOQUE.CD_EMPRESA,');
       Add('       MERCADORIA.CD_MERCADORIA,');
       Add('       NM_MERCADORIA ,');
       Add('       DS_APRESENTACAO_MERCADORIA');
       Add('       ,QT_FISICO-(QT_RESERVADO+QT_RESERVA_PROBLEMATICA+QT_VENCIDO) QT_ESTOQUE');
       Add('       ,QT_EMBALAGEM_COMPRA');
       Add('       ,DT_BLOQUEIO_COMPRA');
       Add('       ,DT_INATIVACAO_FUTURA');
       Add('       ,FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       Add('       ,QT_DIAS_PRAZO_PADRAO');
       Add('       ,CASE');
       Add('       WHEn cd_operador>1 THEN PC_DESCONTO_PADRAO_COMPRA');
       Add('       ELSE PC_DESCONTO_PADRAO_COMPRA');
       Add('       END PC_DESCONTO_PADRAO_COMPRA');
       Add('       ,NVL(QT_PENDENTE,0)+Nvl(QT_TRANSFERENCIA,0) +Nvl(QT_TRANSITO,0) AS QT_PENDENTE ,');
       Add('        CASE');
       Add('         WHEN  (COMPRA.cd_empresa_crossdocking>0) AND (VENDA.CD_EMPRESA=1) THEN QT_DIAS_MEDIO_LEADTIME+5');
       Add('        ELSE QT_DIAS_MEDIO_LEADTIME');
       Add('        END QT_DIAS_MEDIO_LEADTIME');
       Add('        ,QT_DIAS_DESVIOPADRAO_LEADTIME');
       Add('       ,CASE');
       Add('          WHEN COMPRA.ID_CURVA_MERCADORIA=''A'' THEN 2.06');
       Add('          WHEN COMPRA.ID_CURVA_MERCADORIA=''B'' THEN 1.76');
       Add('          ELSE 1.56');
       Add('        END VLINDICENSPADRAO,');
       Add('        (28/FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE ) AS VL_INDICE_COMPRA');
       Add('        ,QT_DESVIOPADRAO_VENDA_DIARIA');
       Add('        ,VL_UNITARIO_COMPRA_L,');
       Add('         CASE');
       Add('           WHEN QT_PREVISAO<> -9999  THEN ROUND(QT_PREVISAO/30,5)');
       Add('           ELSE QT_MEDIA_VENDA_DIARIA');
       Add('        END MEDIA_PREVISAO');
       Add('        ,QT_CAIXA_PALETE');
       Add('        ,QT_CAIXA_CAMADA');
       Add('        ,QT_CAIXA_CAMADA * QT_EMBALAGEM_COMPRA AS QTD_CAIXA_CAMADA');
       Add('       , QT_CAIXA_PALETE* QT_EMBALAGEM_COMPRA AS QTD_CAIXA_PALETE');
       Add('       ,GFM.QT_DIAS_FREQUENCIA_COMPRA FREQUENCIA_COMPRA');
       Add('       ,CASE');
       Add('         WHEN VL_UNITARIO_COMPRA_L=0 THEN  VL_PRECO_COMPRA');
       Add('         ELSE    VL_UNITARIO_COMPRA_L');
       Add('         END  VL_UNITARIO_COMPRA');
       Add('       ,Nvl(1,1) AS NR_OPERADOR_LOGISTICO');
       Add('       ,NVL(CD_LISTA_GAM,0) as CD_LISTA_GAM,  nvl(VL_BASE_VENDA,0) as VL_BASE_VENDA,nvl(PC_ICMS_VENDA,0) as PC_ICMS_VENDA');
       Add('       ,CASE');
       Add('        WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   nvl(PC_CREDITO_ICMS,0)');
       Add('        WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN');
       Add('         (SELECT nvl(PC_CREDITO_ICMS,0) FROM PRDDM.DC_FISCAL_MERCADORIA FISCAL WHERE FISCAL.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
       Add('                                       AND  CD_EMPRESA=(SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=CD_EMPRESA_CROSSDOCKING))');
       Add('       END   PC_ICMS_COMPRA');
       Add('       ,Nvl(PC_ICMS_COMPRA,0) as PC_ICMS_COMPRA_LISTA');
       Add('       ,round(NVL(PC_DESCONTO_COMPRA,0),2) AS PC_DESC_ADICIONAL');
       Add('       ,NVL(VL_COMPRA_MERCADORIA,0) AS VL_COMPRA_EXCECAO');
       Add('       ,CD_LISTA_EXCECAO');
       Add('       ,NR_VERBA');
       Add('       ,NVL(PC_REPASSE,0) AS PC_REPASSE');
       Add('       ,ID_COFINS');
       Add('       ,Nvl(PC_IPI_MERCADORIA,000.0) AS PC_IPI_MERCADORIA');
       Add('       ,CASE');
       Add('          WHEN CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING)');
       Add('          WHEN CD_EMPRESA_CROSSDOCKING=0 THEN  COMPRA.cd_Empresa');
       Add('       END CD_EMPRESA_CROSSDOCKING');
       Add('        ,CASE');
       Add('           WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   VL_CUSTO_GERENCIAL');
       Add('          WHEN CD_EMPRESA_CROSSDOCKING>0 THEN  (SELECT VL_CUSTO_GERENCIAL FROM PRDDM.DC_FINANCEIRO_MERCADORIA FINAC  WHERE');
       Add('                                      FINAC.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  FINAC.CD_EMPRESA=(SELECT CD_EMPRESA_FISICA');
       Add('                                                  FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=COMPRA.CD_EMPRESA_CROSSDOCKING))');
       Add('           END  VL_CUSTO_GERENCIAL');
       Add('          ,CASE');
       Add('           WHEN  CD_EMPRESA_CROSSDOCKING=0 THEN   PC_REPASSE_COMPRA');
       Add('           WHEN CD_EMPRESA_CROSSDOCKING>0 THEN  (SELECT PC_REPASSE_COMPRA FROM PRDDM.DC_COMPRA_MERCADORIA COMPRA1  WHERE');
       Add('                                                COMPRA1.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  COMPRA1.CD_EMPRESA=(SELECT CD_EMPRESA_FISICA');
       Add('                                                FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA=COMPRA.CD_EMPRESA_CROSSDOCKING))');
       Add('        END  PC_REPASSE_COMPRA');
       Add('        ,VL_PRECO_VENDA');

       Add('       FROM');
       Add('         PRDDM.DC_MERCADORIA MERCADORIA,');
       Add('         PRDDM.DC_ESTOQUE_MERCADORIA  ESTOQUE,');
       Add('         PRDDM.DC_COMPRA_MERCADORIA  COMPRA,');
       Add('         PRDDM.DC_FINANCEIRO_MERCADORIA  FINANCEIRO,');
       Add('         PRDDM.DC_FISCAL_MERCADORIA  FISCAL,');
       Add('         PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
       Add('         PRDDM.DC_GRUPO_FORNECEDOR FORNECEDOR,');
       Add('         PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM,');
       Add('         --PRDDM.DCPCI ITEM_PEDIDO,');
       Add('         (SELECT CM.CD_EMPRESA, CM.CD_MERCADORIA,');
       Add('                LP.VL_UNITARIO_COMPRA AS VL_UNITARIO_COMPRA_L,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA, CD_LISTA_GAM, VL_BASE_VENDA,PC_ICMS_VENDA');
       Add('       ,CASE');
       Add('           WHEN PC_ICMS_COMPRA>0 THEN   Round((100-(100-PC_ICMS_VENDA)/(100-PC_ICMS_COMPRA)*100),2)');
       Add('           ELSE  0');
       Add('        END  PC_REPASSE');
       Add('              FROM');
       Add('              PRDDM.DC_COMPRA_MERCADORIA CM,');
       Add('              PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
       Add('              WHERE');
       Add('                 CM.CD_MERCADORIA=LP.CD_MERCADORIA');
       Add('                 AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),CM.cd_empresa) = LP.CD_EMPRESA');
       Add('                 AND CM.ID_SITUACAO_MERCADORIA=''A''');
       Add('                 AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
       Add('                 AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
       Add('                                         FROM');
       Add('                                           PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF,');
       Add('                                           PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       Add('                                         WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
       Add('                                         AND COMPRA.CD_MERCADORIA=LPF.CD_MERCADORIA');
       Add('                                         AND Nvl((SELECT cd_empresa_fisica FROM acesso.dc_empresa WHERE cd_empresa = CD_EMPRESA_CROSSDOCKING),compra.cd_empresa)=LPF.CD_EMPRESA');
       Add('                                         AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
       Add('                                         AND LPF.DT_MUDANCA_PRECO <= SYSDATE)) LISTA_PRECO,');
       Add('         (SELECT NROM_Y,CD_EMPRESA_DESTINO,LABP_P,SUM(QUAY_Y-CHEY_Y) QT_PENDENTE');
       Add('          FROM');
       Add('            PRDDM.DCPCC C,');
       Add('            PRDDM.DCPCI I,');
       Add('            ACESSO.DC_EMPRESA emp');
       Add('         WHERE');
       Add('          NROP_P=NROP_Y');
       Add('          AND SITY_Y IN(''N'',''P'')');
       Add('          AND SITP_P IN(''N'',''P'')');
       Add('          AND EMP.CD_EMPRESA=C.CD_EMPRESA_DESTINO');
       Add('          AND EMP.ID_EMPRESA_FISICA=''S''');
       Add('          AND ((c.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'') ) OR  c.CD_OPERACAO_REDE=0)');
       Add('         AND LABP_P=:PnrFornecedor');
       Add('         GROUP BY NROM_Y,CD_EMPRESA_DESTINO,LABP_P) PENDENCIA,');
       Add('        ( SELECT  cd_mercadoria');
       Add('          ,cd_empresa_destino');
       Add('          ,Sum(qt_transferencia) AS qt_transferencia');
       Add('         , Sum(qt_transito) AS   qt_transito');
       Add('        FROM PRDDM.DC_ESTOQUE_TRANSFERENCIA');
       Add('        GROUP BY cd_mercadoria');
       Add('         ,cd_empresa_destino) TRANS,');
       Add('         PRDDM.DC_LEADTIME_FORNECEDOR  LTIME,');
       Add('         PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR');
       Add('       ,(SELECT');
       Add('       CD_PRECO_FORNECEDOR_EXCECAO AS CD_LISTA_EXCECAO,');
       Add('           LPE.CD_EMPRESA,  LPE.CD_MERCADORIA,');
       Add('           VL_COMPRA_MERCADORIA,');
       Add('           VL_COMPRA_MERCADORIA_DESCONTO,');
       Add('           PC_DESCONTO_COMPRA,');
       Add('           NR_VERBA');
       Add('       FROM');
       Add('       PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPE,');
       Add('       prddM.DC_COMPRA_MERCADORIA cm');
       Add('       WHERE');
       Add('       LPE.CD_MERCADORIA=CM.CD_MERCADORIA');
       Add('       AND LPE.CD_EMPRESA=CM.CD_EMPRESA');
       Add('       AND CD_GRUPO_FORNECEDOR=137');
       Add('       --AND  LPE.CD_EMPRESA=1');
       Add('       AND CD_PRECO_FORNECEDOR_EXCECAO=0) LISTA_EXCECAO');
       Add('       ,(SELECT');
       Add('       COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
       Add('       CASE');
       Add('        when  QT_PREVISAO>0 then QT_PREVISAO');
       Add('        when  QT_PREVISAO<=0 then 0');
       Add('        when QT_PREVISAO is null then -9999');
       Add('        END QT_PREVISAO,');
       Add('        Nvl(DT_PREVISAO ,TRUNC(sysdate,''MONTH'')) AS DT_PREVISAO');
       Add('       FROM');
       Add('        PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
       Add('        GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
       Add('       WHERE');
       Add('         PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('         AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('         AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
       Add('         AND DT_PREVISAO(+)=TRUNC(sysdate,''MONTH'')) PREVISAO_NOVA');
       Add('       WHERE');
       Add('         MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
       Add('         AND COMPRA.CD_GRUPO_FORNECEDOR=LTIME.CD_GRUPO_FORNECEDOR(+)');
       Add('         AND CD_LEADTIME=4');
       Add('         AND COMPRA.CD_EMPRESA=LTIME.CD_EMPRESA(+)');
       Add('         AND ID_TERMOLABIL=''N''');
       Add('         AND OL_FORNECEDOR.CD_OPERADOR(+)=1');
       Add('         AND OL_FORNECEDOR.CD_empresa(+)= COMPRA.cd_empresa');
       Add('         AND OL_FORNECEDOR.CD_FORNECEDOR(+)=COMPRA.CD_GRUPO_FORNECEDOR');
       Add('');
       Add('         AND COMPRA.CD_GRUPO_FORNECEDOR= FORNECEDOR.CD_GRUPO_FORNECEDOR');
       Add('         AND GFM.ID_CURVA_MERCADORIA       = COMPRA.ID_CURVA_MERCADORIA');
       Add('         AND GFM.CD_GRUPO_CURVA_FABRICANTE = FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       Add('         AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
       Add('         AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
       Add('         AND FINANCEIRO.ID_SITUACAO_MERCADORIA=''A''');
       Add('         AND FISCAL.ID_SITUACAO_MERCADORIA=''A''');
       Add('         AND FISCAL.ID_VENDA_AUTORIZADA=''S''');
       Add('         AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('         AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
       Add('         AND FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('         AND FINANCEIRO.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
       Add('         AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
       Add('         AND FINANCEIRO.CD_EMPRESA=FISCAL.CD_EMPRESA');
       Add('         AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('         AND COMPRA.CD_MERCADORIA=LISTA_EXCECAO.CD_MERCADORIA(+)');
       Add('         AND COMPRA.CD_EMPRESA=LISTA_EXCECAO.CD_EMPRESA(+)');
       Add('         AND COMPRA.CD_MERCADORIA=LISTA_PRECO.CD_MERCADORIA(+)');
       Add('         AND COMPRA.CD_EMPRESA=LISTA_PRECO.CD_EMPRESA(+)');
       Add('         AND  COMPRA.CD_MERCADORIA=VENDA.CD_MERCADORIA(+)');
       Add('         AND CD_CANAL=0');
       Add('         AND  COMPRA.CD_EMPRESA=VENDA.CD_EMPRESA');
       Add('         AND (COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA) NOT IN');
       Add('        (SELECT cd_mercadoria,cd_empresa FROM prddm.dc_operacao_rede_mercadoria opr');
       Add('                      WHERE id_exclusivo_operacao_rede=''S''');
       Add('                       AND id_situacao=''A'' AND cd_operacao_rede=6)');
       Add('         AND   VENDA.DT_VENDA_MERCADORIA>=(SELECT Max(DT_VENDA_MERCADORIA)   FROM prddm.dw_venda_acumulada_mercadoria WHERE cd_canal=0)');
       Add('         AND COMPRA.CD_MERCADORIA=PREVISAO_NOVA.cd_mercadoria(+)');
       Add('         AND COMPRA.CD_EMPRESA=PREVISAO_NOVA.CD_EMPRESA(+)');
       Add('         AND COMPRA.CD_GRUPO_FORNECEDOR=PENDENCIA.LABP_P(+)');
       Add('         AND COMPRA.CD_MERCADORIA=NROM_Y(+)');
       Add('         AND COMPRA.CD_EMPRESA=PENDENCIA.CD_EMPRESA_DESTINO(+)');
       Add('         AND COMPRA.CD_MERCADORIA=TRANS.CD_MERCADORIA(+)');
       Add('         AND COMPRA.CD_EMPRESA=TRANS.CD_EMPRESA_DESTINO(+) ))))))');
















{      Add('SELECT');
      Add('ID_UNIDADE_FEDERACAO AS  CD  ,SUM(SUG_COMPRA) as QT_SUGERIDA,SUM(SUG_COMPRA*VL_PRECO_COMPRA ) VT_COMPRA,');
      Add('SUM(SUG_COMPRA*(VL_PRECO_COMPRA-(VL_PRECO_COMPRA*(PC_DESCONTO_PADRAO_COMPRA/100)))) AS VL_C_DESCONTO,');
      Add('SUM(SUG_COMPRA*VL_PRECO_VENDA) AS VT_VENDA,');
      Add('SUM(SUG_COMPRA*VL_BASE_VENDA) AS VT_FABRICA,');
      Add('CD_EMPRESA');
      Add('FROM');
      Add('(SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA,MERCADORIA.NM_MERCADORIA,');
      Add('MERCADORIA.DS_APRESENTACAO_MERCADORIA ,');
      Add('COMPRA.ID_CURVA_MERCADORIA,');
      Add('COMPRA.CD_EMPRESA,');
      Add('VL_PRECO_COMPRA,');
      Add('VL_PRECO_VENDA,');
      Add('PC_DESCONTO_PADRAO_COMPRA,');
      Add('QT_ESTOQUE_MAXIMO,');
      Add('(QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) AS QT_ESTOQUE,');
      Add('MES3,');
      Add('MES2,');
      Add('MES1,');
      Add('MES0,');
      Add('VENDA_TRIMESTRE,');
      Add('QT_VENDA,');
      Add('DIAS_ESTOQUE_ZERO,');
      Add('NR_DIAS_DIV ,');
      Add('MEDIA_VENDA_DIA,');
      Add('QT_DIAS_MEDIO_LEADTIME,');
      Add('VL_BASE_VENDA,');
      Add('CASE');
      Add('  WHEN MEDIA_VENDA_DIA>0 THEN ROUND((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)/MEDIA_VENDA_DIA,0)');
      Add('END DIAS_ESTOQUE,');
      Add('');
      Add('NVL(UNI_PENDENTE,0) AS UNI_PENDENTE,');
      Add('');
      Add('CASE');
      Add('   WHEN  ((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) - ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0))>0');
      Add('      AND');
      Add('      (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add('    ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)<=(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA)');
      Add('   THEN');
      Add('         ROUND(ROUND(((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) -');
      Add('         ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0)),0)/QT_EMBALAGEM_COMPRA,0) *QT_EMBALAGEM_COMPRA');
      Add('   WHEN');
      Add('');
      Add('    (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add(' ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)>(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA) THEN 0');
      Add('');
      Add('   ELSE 0');
      Add('END SUG_COMPRA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('ID_UNIDADE_FEDERACAO');
      Add('');
      Add('');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA');
      Add('JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA  AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA= ESTOQUE.CD_EMPRESA AND  ID_EMPRESA_FISICA=''S''');
      Add('');
      Add('LEFT JOIN DC_LEADTIME_FORNECEDOR LEADTIME ON  LEADTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LEADTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=ID_REFRIGERADO');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA.CD_GRUPO_FORNECEDOR');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM   ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
      Add('                                                           AND  GFM.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
      Add('                                                           AND  GFM.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');

      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');


      Add('LEFT OUTER JOIN');
      Add('');
      Add('(SELECT');
      Add('CD_MERCADORIA_VENDA,');
      Add('CD_EMPRESA_VENDA,');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
      Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
      Add('--SOMATORIO VENDA                                     ');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS VENDA_TRIMESTRE,');
      Add('');
      Add('SUM(QT_VENDIDA) AS QT_VENDA,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
      Add('MAX(NR_DIAS_DIV) AS NR_DIAS_DIV,');
      Add('');
      Add('');
      Add('--CALCULO MEDIA');
      Add('CASE');
      Add(' WHEN  (MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO))>0 THEN');
      Add('        ROUND((SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0))) / ( MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO)),2)');
      Add(' ELSE');
      Add('    0');
      Add(' END MEDIA_VENDA_DIA');

      Add('FROM');
      Add('(');
      Add('SELECT');
      Add('CM.CD_MERCADORIA AS CD_MERCADORIA_VENDA,');
      Add('VM.CD_EMPRESA AS CD_EMPRESA_VENDA,');
      Add('SUM(QT_VENDIDA) QT_VENDIDA,');
      Add('CASE');
      Add('WHEN CD_OPERADOR_LOGISTICO=1 THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
      Add('END QT_DIAS_ESTOQUE_ZERO,');
      Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
      Add('');
      Add(' CASE');
      Add('     WHEN DT_VENDA_MERCADORIA =ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00) THEN EXTRACT( DAY FROM SYSDATE)');
      Add('     ELSE');
      Add('        (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - MAX(DT_VENDA_MERCADORIA))');
      Add(' END       NR_DIAS_DIV');
      Add('');
      Add('');
      Add(' FROM');
      Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('');
      Add('WHERE');
      Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND  VM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND DT_VENDA_MERCADORIA<= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA_VENDA,CD_EMPRESA_VENDA');
      Add('ORDER BY CD_MERCADORIA_VENDA) VENDA ON VENDA.CD_MERCADORIA_VENDA=MERCADORIA.CD_MERCADORIA AND VENDA.CD_EMPRESA_VENDA=COMPRA.CD_EMPRESA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT   CM.CD_MERCADORIA,');
      Add('NVL(SUM(QUAY_Y  - CHEY_Y),0) AS UNI_PENDENTE,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIAFABRICA,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCIACUSTO,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA ,ITEM.CD_EMPRESA AS CD_EMPRESA');
      Add(' FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M1');
      Add(' WHERE');
      Add(' NROP_P=NROP_Y');
      Add('AND NROM_Y=CM.CD_MERCADORIA');
      Add('AND CM.CD_MERCADORIA=M1.CD_MERCADORIA');
      Add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND SITP_P IN(''N'',''P'')');
      Add('AND SITY_Y IN(''N'',''P'')');
      Add('AND EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');

 //     Add('AND item.cd_operacao_rede in(0,1)');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('GROUP BY CM.CD_MERCADORIA,');
      Add('             NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,ITEM.CD_EMPRESA) PENDENCIA  ON');
      Add('                                                             PENDENCIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add(')');
      Add('GROUP BY CD_EMPRESA,ID_UNIDADE_FEDERACAO');
      Add('Union all');
      Add('SELECT');
      Add('ID_UNIDADE_FEDERACAO AS  CD  ,SUM(SUG_COMPRA) as QT_SUGERIDA,SUM(SUG_COMPRA*VL_PRECO_COMPRA ) VT_COMPRA,');
      Add('SUM(SUG_COMPRA*(VL_PRECO_COMPRA-(VL_PRECO_COMPRA*(PC_DESCONTO_PADRAO_COMPRA/100)))) AS VL_C_DESCONTO,');
      Add('SUM(SUG_COMPRA*VL_PRECO_VENDA) AS VT_VENDA,');
      Add('SUM(SUG_COMPRA*VL_BASE_VENDA) AS VT_FABRICA,');
      Add('CD_EMPRESA');
      Add('FROM');
      Add('(SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA,MERCADORIA.NM_MERCADORIA,');
      Add('MERCADORIA.DS_APRESENTACAO_MERCADORIA ,');
      Add('COMPRA.ID_CURVA_MERCADORIA,');
      Add('500 CD_EMPRESA,');
      Add('VL_PRECO_COMPRA,');
      Add('VL_PRECO_VENDA,');
      Add('PC_DESCONTO_PADRAO_COMPRA,');
      Add('QT_ESTOQUE_MAXIMO,');
      Add('(QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) AS QT_ESTOQUE,');
      Add('MES3,');
      Add('MES2,');
      Add('MES1,');
      Add('MES0,');
      Add('VENDA_TRIMESTRE,');
      Add('QT_VENDA,');
      Add('DIAS_ESTOQUE_ZERO,');
      Add('NR_DIAS_DIV ,');
      Add('MEDIA_VENDA_DIA,');
      Add('QT_DIAS_MEDIO_LEADTIME,');
      Add('VL_BASE_VENDA,');
      Add('CASE');
      Add('  WHEN MEDIA_VENDA_DIA>0 THEN ROUND((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)/MEDIA_VENDA_DIA,0)');
      Add('END DIAS_ESTOQUE,');
      Add('');
      Add('NVL(UNI_PENDENTE,0) AS UNI_PENDENTE,');
      Add('');
      Add('CASE');
      Add('   WHEN  ((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) - ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0))>0');
      Add('      AND');
      Add('      (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add('    ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)<=(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA)');
      Add('   THEN');
      Add('         ROUND(ROUND(((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) -');
      Add('         ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0)),0)/QT_EMBALAGEM_COMPRA,0) *QT_EMBALAGEM_COMPRA');
      Add('   WHEN');
      Add('');
      Add('    (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add(' ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)>(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA) THEN 0');
      Add('');
      Add('   ELSE 0');
      Add('END SUG_COMPRA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('''GERAL'' AS ID_UNIDADE_FEDERACAO');
      Add('');
      Add('');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA');
      Add('JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA  AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA= ESTOQUE.CD_EMPRESA AND  ID_EMPRESA_FISICA=''S''');
      Add('');
      Add('LEFT JOIN DC_LEADTIME_FORNECEDOR LEADTIME ON  LEADTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LEADTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=ID_REFRIGERADO');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA.CD_GRUPO_FORNECEDOR');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM   ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
      Add('                                                           AND  GFM.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
      Add('                                                           AND  GFM.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');





      Add('LEFT OUTER JOIN');
      Add('');
      Add('(SELECT');
      Add('CD_MERCADORIA_VENDA,');
      Add('CD_EMPRESA_VENDA,');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
      Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
      Add('--SOMATORIO VENDA                                     ');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS VENDA_TRIMESTRE,');
      Add('');
      Add('SUM(QT_VENDIDA) AS QT_VENDA,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
      Add('MAX(NR_DIAS_DIV) AS NR_DIAS_DIV,');
      Add('');
      Add('');
      Add('--CALCULO MEDIA');
      Add('CASE');
      Add(' WHEN  (MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO))>0 THEN');
      Add('        ROUND((SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0))) / ( MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO)),2)');
      Add(' ELSE');
      Add('    0');
      Add(' END MEDIA_VENDA_DIA');

      Add('FROM');
      Add('(');
      Add('SELECT');
      Add('CM.CD_MERCADORIA AS CD_MERCADORIA_VENDA,');
      Add('VM.CD_EMPRESA AS CD_EMPRESA_VENDA,');
      Add('SUM(QT_VENDIDA) QT_VENDIDA,');
      Add('CASE');
      Add('WHEN (CD_OPERADOR_LOGISTICO=1) and (DT_VENDA_MERCADORIA <>ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00)) THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
      Add('END QT_DIAS_ESTOQUE_ZERO,');
      Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
      Add('');
      Add(' CASE');
      Add('     WHEN DT_VENDA_MERCADORIA =ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00) THEN EXTRACT( DAY FROM SYSDATE)');
      Add('     ELSE');
      Add('        (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - MAX(DT_VENDA_MERCADORIA))');
      Add(' END       NR_DIAS_DIV');
      Add('');
      Add('');
      Add(' FROM');
      Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('');
      Add('WHERE');
      Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND  VM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND DT_VENDA_MERCADORIA<= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA_VENDA,CD_EMPRESA_VENDA');
      Add('ORDER BY CD_MERCADORIA_VENDA) VENDA ON VENDA.CD_MERCADORIA_VENDA=MERCADORIA.CD_MERCADORIA AND VENDA.CD_EMPRESA_VENDA=COMPRA.CD_EMPRESA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT   CM.CD_MERCADORIA,');
      Add('NVL(SUM(QUAY_Y  - CHEY_Y),0) AS UNI_PENDENTE,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIAFABRICA,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCIACUSTO,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA ,ITEM.CD_EMPRESA AS CD_EMPRESA');
      Add(' FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('ACESSO.DC_EMPRESA EMP,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M1');
      Add(' WHERE');
      Add(' NROP_P=NROP_Y');
      Add('AND NROM_Y=CM.CD_MERCADORIA');
      Add('AND CM.CD_MERCADORIA=M1.CD_MERCADORIA');
      Add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
   //   Add('AND item.cd_operacao_rede in(0,1)');
      Add('AND SITP_P IN(''N'',''P'')');
      Add('AND SITY_Y IN(''N'',''P'')');
      Add('AND EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');

      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('GROUP BY CM.CD_MERCADORIA,');
      Add('             NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,ITEM.CD_EMPRESA) PENDENCIA  ON');
      Add('                                                             PENDENCIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add(')');
      Add('GROUP BY CD_EMPRESA,ID_UNIDADE_FEDERACAO');

      Add('ORDER BY CD_EMPRESA');}

      stQry.SaveToFile('C:\TEMP\QrySugestaoCompraNova.sql');
      with _cdsSugestaoCompra do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsBcd := PnrFornecedor;
        open;
      end;
      SetNomeCamposSugestao;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetNomeCamposSugestao;
begin

  TStringField(_cdsSugestaoCompra.FieldByName('CD')).DisplayLabel := 'LOCAL';
  TStringField(_cdsSugestaoCompra.FieldByName('CD')).DisplayWidth := 07;

  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_SUGERIDA')).DisplayLabel :='Qtd.Sugerida';
  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_SUGERIDA')).DisplayFormat :='###,###,###,##0';
  TIntegerField(_cdsSugestaoCompra.FieldByName('QT_SUGERIDA')).DisplayWidth := 10;

  TFloatField(_cdsSugestaoCompra.FieldByName('VT_COMPRA')).DisplayLabel :='Vlr.Total Lista';
  TFloatField(_cdsSugestaoCompra.FieldByName('VT_COMPRA')).DisplayFormat :='###,###,###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('VT_COMPRA')).DisplayWidth :=10;

  TFloatField(_cdsSugestaoCompra.FieldByName('VL_C_DESCONTO')).DisplayLabel :='Vlr.Total C Desc.';
  TFloatField(_cdsSugestaoCompra.FieldByName('VL_C_DESCONTO')).DisplayFormat :='###,###,###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('VL_C_DESCONTO')).DisplayWidth := 10;

  TFloatField(_cdsSugestaoCompra.FieldByName('VT_VENDA')).DisplayLabel :='Vlr.Total Venda';
  TFloatField(_cdsSugestaoCompra.FieldByName('VT_VENDA')).DisplayFormat :='###,###,###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('VT_VENDA')).DisplayWidth := 10;

  TFloatField(_cdsSugestaoCompra.FieldByName('VT_FABRICA')).DisplayLabel :='Vlr.Total Fabrica';
  TFloatField(_cdsSugestaoCompra.FieldByName('VT_FABRICA')).DisplayFormat :='###,###,###,##0.00';
  TFloatField(_cdsSugestaoCompra.FieldByName('VT_FABRICA')).DisplayWidth := 10;



  TIntegerField(_cdsSugestaoCompra.FieldByName('CD_EMPRESA_CROSSDONKING')).DisplayLabel :='Empresa';
  TIntegerField(_cdsSugestaoCompra.FieldByName('CD_EMPRESA_CROSSDONKING')).DisplayFormat := '00';
  TIntegerField(_cdsSugestaoCompra.FieldByName('CD_EMPRESA_CROSSDONKING')) .DisplayWidth := 07;

end;

procedure T_frmTelaCompras.DadosExcessoEstoque(PnrFornecedor: Integer);
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    with stQry do
    begin

       Add('          SELECT');
       Add('       (SELECT ID_UNIDADE_FEDERACAO FROM ACESSO.DC_EMPRESA E WHERE ID_EMPRESA_FISICA=''S'' AND E.CD_EMPRESA=CD) AS LOCAL');
       Add('      ,SUM(NR_UNIDADES_EXCESSO) AS NR_UNIDADES_EXCESSO');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_CUSTO_MERCADORIA)       AS VL_EXCESSO_CUSTO');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_UNITARIO_COMPRA_LISTA) AS VL_EXCESSO_LISTA');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_PRECO_VENDA) AS VL_EXCESSO_VENDA');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_BASE_VENDA) AS VL_EXCESSO_FABRICA');
       Add('      ,ROUND(SUM(NR_UNIDADES_EXCESSO*MTS_CUBICO),4)  AS   VL_EXCESSO_MTS_CUBICO');
       Add('      ,CD CD');
       Add('   FROM');
       Add('   (SELECT');
       Add('       CD_EMPRESA CD');
       Add('      ,CASE');
       Add('        WHEN (MEDIA >0) AND  ROUND(ESTOQUE/MEDIA,0)> DIAS_ESTOQUE_LEAD THEN ROUND((ROUND(ESTOQUE/MEDIA,0) - DIAS_ESTOQUE_LEAD)* NVL(MEDIA,0),0)');
       Add('        ELSE 0');
       Add('       END NR_UNIDADES_EXCESSO');
       Add('       ,DIAS_ESTOQUE_LEAD');
       Add('       ,VL_CUSTO_MERCADORIA');
       Add('       ,VL_UNITARIO_COMPRA_LISTA');
       Add('       ,VL_PRECO_VENDA');
       Add('       ,VL_BASE_VENDA');
       Add('       ,MTS_CUBICO');
       Add('   FROM');
       Add('   (SELECT');
       Add('     COMPRA.CD_EMPRESA');
       Add('    ,COMPRA.CD_MERCADORIA');
       Add('    ,SUM(QT_FISICO -  QT_RESERVADO - QT_RESERVA_PROBLEMATICA - QT_VENCIDO)  + SUM(NVL(QT_PENDENCIA,0))+(NVL(QT_TRANSFERENCIA,0))+ (NVL(QT_TRANSITO,0)) AS ESTOQUE');
       Add('   ,MAX(NVL(ID_PEDIDO_FATURADO,''N''))  AS ID_PEDIDO_FATURADO');
       Add('   ,SUM(NVL(ITEMPEDIDO.QT_PEDIDO,0)) AS QT_PEDIDO');
       Add('   ,SUM(NVL(QT_PENDENCIA,0)) AS PENDENCIA');
       Add('   ,SUM(NVL(QT_PENDENCIA,0))+(NVL(QT_TRANSFERENCIA,0))+ (NVL(QT_TRANSITO,0)) AS QT_PENDENTE');
       Add('   ,SUM(NVL(QT_ATENDIDA,0))+SUM(NVL(QT_MERCADORIA_ENTRADA,0)) AS QT_PROCESSADA');
       Add('   ,SUM(NVL(QT_TRANSFERENCIA,0)) QT_TRANSFERENCIA');
       Add('   ,(NVL(QT_TRANSITO,0)) AS QT_TRANSITO');
       Add('   ,SUM(NVL(QT_ATENDIDA,0)) AS QT_ATENDIDA');
       Add('   ,CASE');
       Add('      WHEN SUM(QT_PREVISAO)>0 THEN  ROUND(SUM(QT_PREVISAO)/30,4)');
       Add('      WHEN SUM(QT_PREVISAO)=0 THEN  0');
       Add('      WHEN  SUM(QT_PREVISAO)<0 THEN SUM(NVL(QT_MEDIA_VENDA_DIARIA,0))');
       Add('      END MEDIA,');
       Add('      ROUND(SUM(NVL(QT_ESTOQUE_MAXIMO,0))+ SUM(NVL(QT_DIAS_MEDIO_LEADTIME,0)),0) AS  DIAS_ESTOQUE_LEAD');
       Add('      ,SUM(VL_CUSTO_FINANCEIRO_MERCADORIA) AS VL_CUSTO_MERCADORIA');
       Add('      ,SUM(VL_UNITARIO_COMPRA) AS VL_UNITARIO_COMPRA_LISTA');
       Add('      ,SUM(VL_PRECO_VENDA) AS VL_PRECO_VENDA');
       Add('      ,SUM(VL_BASE_VENDA) AS VL_BASE_VENDA');
       Add('      ,SUM(((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) MTS_CUBICO');
       Add('   FROM');
       Add('   PRDDM.DC_ESTOQUE_MERCADORIA EM,');
       Add('   PRDDM.DC_FINANCEIRO_MERCADORIA FIN,');
       Add('   PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       Add('   LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA.CD_GRUPO_FORNECEDOR');
       Add('   JOIN PRDDM.DC_MERCADORIA MERCADORIA ON  MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('   LEFT JOIN DC_LEADTIME_FORNECEDOR LEADTIME ON  LEADTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LEADTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=ID_REFRIGERADO');
       Add('   LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM   ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
       Add('                                                              AND  GFM.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       Add('                                                              AND  GFM.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');
       Add('   LEFT OUTER JOIN (SELECT');
       Add('          COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
       Add('          CASE');
       Add('           WHEN  QT_PREVISAO>0 THEN QT_PREVISAO');
       Add('           WHEN  QT_PREVISAO<=0 THEN 0');
       Add('           WHEN QT_PREVISAO IS NULL THEN -9999');
       Add('          END QT_PREVISAO,');
       Add('          NVL(DT_PREVISAO ,TRUNC(SYSDATE,''MONTH'')) AS DT_PREVISAO');
       Add('          FROM');
       Add('          PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
       Add('          GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
       Add('          WHERE');
       Add('           PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('          AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('          AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
       Add('          AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('          AND DT_PREVISAO(+)=TRUNC(SYSDATE,''MONTH'')) PREVISAO ON COMPRA.CD_MERCADORIA=PREVISAO.CD_MERCADORIA AND  COMPRA.CD_EMPRESA=PREVISAO.CD_EMPRESA');
       Add('     LEFT OUTER JOIN  (SELECT VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,NVL(QT_MEDIA_VENDA_DIARIA,0) AS QT_MEDIA_VENDA_DIARIA');
       Add('     FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
       Add('             PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       Add('     WHERE');
       Add('           VENDA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('          AND VENDA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('          AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('       AND CD_CANAL=0');
       Add('       AND DT_VENDA_MERCADORIA=(SELECT MAX(DT_VENDA_MERCADORIA) FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA )) MEDIA_NORMAL ON COMPRA.CD_MERCADORIA=MEDIA_NORMAL.CD_MERCADORIA');
       Add('                                                                                                            AND  COMPRA.CD_EMPRESA=MEDIA_NORMAL.CD_EMPRESA');
       Add('   LEFT OUTER JOIN');
       Add('   (SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,LP.VL_BASE_VENDA');
       Add('   FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
       Add('   PRDDM.DC_COMPRA_MERCADORIA CM,');
       Add('   PRDDM.DC_MERCADORIA M,');
       Add('   PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
       Add('   WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
       Add('   AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
       Add('   AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
       Add('   AND M.ID_SITUACAO_MERCADORIA=''A''');
       Add('   AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
       Add('   AND M.ID_SITUACAO_MERCADORIA = ''A''');
       Add('   AND LP.CD_EMPRESA = EM.CD_EMPRESA');
       Add('   AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
       Add('   AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
       Add('                              FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
       Add('                              WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
       Add('                              AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
       Add('                              AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');
       Add('   LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('   AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');
       Add('    LEFT OUTER JOIN');
       Add('        (SELECT');
       Add('    ET.CD_MERCADORIA');
       Add('   ,CD_EMPRESA_DESTINO');
       Add('   ,SUM(NVL(QT_TRANSFERENCIA,0)) AS QT_TRANSFERENCIA');
       Add('   ,SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
       Add('   FROM');
       Add('     PRDDM.DC_ESTOQUE_TRANSFERENCIA ET,');
       Add('     PRDDM.DC_COMPRA_MERCADORIA CM');
       Add('   WHERE');
       Add('      ET.CD_MERCADORIA=CM.CD_MERCADORIA');
       Add('     AND CD_EMPRESA_DESTINO=CM.CD_EMPRESA');
       Add('   GROUP BY  ET.CD_MERCADORIA,CD_EMPRESA_DESTINO ) TRANS ON TRANS.CD_MERCADORIA= COMPRA.CD_MERCADORIA AND TRANS.CD_EMPRESA_DESTINO=COMPRA.CD_EMPRESA');
       Add('   LEFT OUTER JOIN (SELECT');
       Add('     NROM_Y,');
       Add('     CD_DESTINO,');
       Add('     QT_PENDENCIA,');
       Add('     QT_PEDIDO,');
       Add('     QT_ATENDIDA,');
       Add('    CD_EMPRESA AS CD_PEDIDO_CROSS');
       Add('   FROM');
       Add('   (SELECT');
       Add('             NROM_Y,');
       Add('             CD_EMPRESA_DESTINO CD_DESTINO,');
       Add('             SUM(ITEM.QUAY_Y -ITEM.CHEY_Y) QT_PENDENCIA,');
       Add('             SUM(ITEM.QUAY_Y) QT_PEDIDO,');
       Add('             SUM(ITEM.CHEY_Y) QT_ATENDIDA,');
       Add('             CAPA.CD_EMPRESA');
       Add('     FROM');
       Add('        PRDDM.DCPCC CAPA,');
       Add('        PRDDM.DCPCI ITEM,');
       Add('        ACESSO.DC_EMPRESA EMP');
       Add('     WHERE NROP_P=NROP_Y');
       Add('                AND SITP_P IN(''N'',''P'')');
       Add('                AND SITY_Y IN(''N'',''P'')');
       Add('          AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
       Add('          AND ((CAPA.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
       Add('          AND ID_EMPRESA_FISICA=''S''');
       Add('           AND LABP_P=16');
       Add('          GROUP BY CD_EMPRESA_DESTINO,NROM_Y,CAPA.CD_EMPRESA)) ITEMPEDIDO ON   ITEMPEDIDO.NROM_Y=COMPRA.CD_MERCADORIA AND ITEMPEDIDO.CD_DESTINO=COMPRA.CD_EMPRESA');
       Add('          LEFT OUTER JOIN');
       Add('   (SELECT');
       Add('     PEDIDO_ITEM_NFE.CD_MERCADORIA,');
       Add('    SUM(QT_MERCADORIA_ENTRADA) AS QT_MERCADORIA_ENTRADA,');
       Add('    PEDIDO_ITEM_NFE.CD_EMPRESA,');
       Add('      0 AS CD_EMPRESA_DESTINO');
       Add('   ,CASE');
       Add('    WHEN  SUM(QT_MERCADORIA_ENTRADA) >0 THEN ''S''');
       Add('    ELSE ''N''');
       Add('    END ID_PEDIDO_FATURADO');
       Add('   FROM');
       Add('   PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE,');
       Add('   PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
       Add('   PRDDM.DC_NFE_ENTRADA NFE,');
       Add('   PRDDM.DCPCC PED,');
       Add('   PRDDM.DCPCI ITEMPED');
       Add('   WHERE');
       Add('     ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
       Add('     AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
       Add('     AND NROP_P=NROP_Y');
       Add('     AND SITY_Y IN(''N'',''P'')');
       Add('     AND ((PED.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  PED.CD_OPERACAO_REDE=0)');
       Add('     AND PED.CD_EMPRESA_DESTINO=ITEM_NFE.CD_EMPRESA');
       Add('     AND NROM_Y=PEDIDO_ITEM_NFE.CD_MERCADORIA');
       Add('     AND CD_PEDIDO=NROP_P');
       Add('     AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
       Add('     AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
       Add('     AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
       Add('     AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
       Add('     AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
       Add('     AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
       Add('     AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
       Add('     AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
       Add('   GROUP BY');
       Add('            PEDIDO_ITEM_NFE.CD_MERCADORIA,');
       Add('            PEDIDO_ITEM_NFE.CD_EMPRESA) NFE ON NFE.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
       Add('                                            AND NFE.CD_EMPRESA=ITEMPEDIDO.CD_PEDIDO_CROSS');
       Add('   WHERE');
       Add('    COMPRA.CD_MERCADORIA=EM.CD_MERCADORIA');
       Add('   AND COMPRA.CD_EMPRESA=EM.CD_EMPRESA');
       Add('   AND COMPRA.CD_MERCADORIA=FIN.CD_MERCADORIA');
       Add('   AND COMPRA.CD_EMPRESA=FIN.CD_EMPRESA');
       Add('   AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('   AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
       Add('   GROUP BY COMPRA.CD_EMPRESA,COMPRA.CD_MERCADORIA,  QT_TRANSITO,QT_TRANSFERENCIA))');
       Add('   GROUP BY CD');
       Add('   UNION ALL');
       Add('   SELECT');
       Add('       ''GERAL'' AS LOCAL');
       Add('      ,SUM(NR_UNIDADES_EXCESSO) AS NR_UNIDADES_EXCESSO');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_CUSTO_MERCADORIA)       AS VL_EXCESSO_CUSTO');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_UNITARIO_COMPRA_LISTA) AS VL_EXCESSO_LISTA');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_PRECO_VENDA) AS VL_EXCESSO_VENDA');
       Add('      ,SUM(NR_UNIDADES_EXCESSO*VL_BASE_VENDA) AS VL_EXCESSO_FABRICA');
       Add('      ,ROUND(SUM(NR_UNIDADES_EXCESSO*MTS_CUBICO),4)  AS   VL_EXCESSO_MTS_CUBICO');
       Add('      ,CD_EMPRESA CD');
       Add('   FROM');
       Add('   (SELECT');
       Add('       500 CD_EMPRESA');
       Add('      ,CASE');
       Add('        WHEN (MEDIA >0) AND  ROUND(ESTOQUE/MEDIA,0)> DIAS_ESTOQUE_LEAD THEN ROUND((ROUND(ESTOQUE/MEDIA,0) - DIAS_ESTOQUE_LEAD)* NVL(MEDIA,0),0)');
       Add('        ELSE 0');
       Add('      END NR_UNIDADES_EXCESSO');
       Add('        ,DIAS_ESTOQUE_LEAD');
       Add('       , VL_CUSTO_MERCADORIA');
       Add('       ,VL_UNITARIO_COMPRA_LISTA');
       Add('       ,VL_PRECO_VENDA');
       Add('      ,VL_BASE_VENDA  ');
       Add('      ,MTS_CUBICO     ');
       Add('   FROM               ');
       Add('   (SELECT            ');
       Add('     COMPRA.CD_EMPRESA');
       Add('    ,COMPRA.CD_MERCADORIA');
       Add('    ,SUM(QT_FISICO -  QT_RESERVADO - QT_RESERVA_PROBLEMATICA - QT_VENCIDO)  + SUM(NVL(QT_PENDENCIA,0))+(NVL(QT_TRANSFERENCIA,0))+ (NVL(QT_TRANSITO,0)) AS ESTOQUE');
       Add('   ,MAX(NVL(ID_PEDIDO_FATURADO,''N''))  AS ID_PEDIDO_FATURADO');
       Add('   ,SUM(NVL(ITEMPEDIDO.QT_PEDIDO,0)) AS QT_PEDIDO');
       Add('   ,SUM(NVL(QT_PENDENCIA,0)) AS PENDENCIA');
       Add('   ,SUM(NVL(QT_PENDENCIA,0))+(NVL(QT_TRANSFERENCIA,0))+ (NVL(QT_TRANSITO,0)) AS QT_PENDENTE');
       Add('   ,SUM(NVL(QT_ATENDIDA,0))+SUM(NVL(QT_MERCADORIA_ENTRADA,0)) AS QT_PROCESSADA');
       Add('   ,SUM(NVL(QT_TRANSFERENCIA,0)) QT_TRANSFERENCIA');
       Add('   ,(NVL(QT_TRANSITO,0)) AS QT_TRANSITO');
       Add('   ,SUM(NVL(QT_ATENDIDA,0)) AS QT_ATENDIDA');
       Add('    ,CASE');
       Add('      WHEN SUM(QT_PREVISAO)>0 THEN  ROUND(SUM(QT_PREVISAO)/30,4)');
       Add('      WHEN SUM(QT_PREVISAO)=0 THEN  0');
       Add('      WHEN  SUM(QT_PREVISAO)<0 THEN SUM(NVL(QT_MEDIA_VENDA_DIARIA,0))');
       Add('      END MEDIA,');
       Add('      ROUND(SUM(NVL(QT_ESTOQUE_MAXIMO,0))+ SUM(NVL(QT_DIAS_MEDIO_LEADTIME,0)),0) AS  DIAS_ESTOQUE_LEAD');
       Add('      ,SUM(VL_CUSTO_FINANCEIRO_MERCADORIA) AS VL_CUSTO_MERCADORIA');
       Add('      ,SUM(VL_UNITARIO_COMPRA) AS VL_UNITARIO_COMPRA_LISTA');
       Add('      ,SUM(VL_PRECO_VENDA) AS VL_PRECO_VENDA');
       Add('      ,SUM(VL_BASE_VENDA) AS VL_BASE_VENDA');
       Add('      ,SUM(((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*QT_PROFUNDIDADE_MERCADORIA)/1000000)) MTS_CUBICO');
       Add('   FROM');
       Add('   PRDDM.DC_ESTOQUE_MERCADORIA EM,');
       Add('   PRDDM.DC_FINANCEIRO_MERCADORIA FIN,');
       Add('   PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       Add('   LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA.CD_GRUPO_FORNECEDOR');
       Add('   JOIN PRDDM.DC_MERCADORIA MERCADORIA ON  MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('   LEFT JOIN DC_LEADTIME_FORNECEDOR LEADTIME ON  LEADTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LEADTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=ID_REFRIGERADO');
       Add('   LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM   ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
       Add('                                                              AND  GFM.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
       Add('                                                              AND  GFM.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');
       Add('   LEFT OUTER JOIN (SELECT');
       Add('          COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
       Add('          CASE');
       Add('           WHEN  QT_PREVISAO>0 THEN QT_PREVISAO');
       Add('           WHEN  QT_PREVISAO<=0 THEN 0');
       Add('           WHEN QT_PREVISAO IS NULL THEN -9999');
       Add('          END QT_PREVISAO,');
       Add('          NVL(DT_PREVISAO ,TRUNC(SYSDATE,''MONTH'')) AS DT_PREVISAO');
       Add('          FROM');
       Add('          PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
       Add('          GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
       Add('          WHERE');
       Add('           PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('          AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('          AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
       Add('          AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('          AND DT_PREVISAO(+)=TRUNC(SYSDATE,''MONTH'')) PREVISAO ON COMPRA.CD_MERCADORIA=PREVISAO.CD_MERCADORIA AND  COMPRA.CD_EMPRESA=PREVISAO.CD_EMPRESA');
       Add('     LEFT OUTER JOIN  (SELECT VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,NVL(QT_MEDIA_VENDA_DIARIA,0) AS QT_MEDIA_VENDA_DIARIA');
       Add('     FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
       Add('             PRDDM.DC_COMPRA_MERCADORIA COMPRA');
       Add('     WHERE');
       Add('           VENDA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
       Add('          AND VENDA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
       Add('          AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('       AND CD_CANAL=0');
       Add('       AND DT_VENDA_MERCADORIA=(SELECT MAX(DT_VENDA_MERCADORIA) FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA )) MEDIA_NORMAL ON COMPRA.CD_MERCADORIA=MEDIA_NORMAL.CD_MERCADORIA');
       Add('                                                                                                            AND  COMPRA.CD_EMPRESA=MEDIA_NORMAL.CD_EMPRESA');
       Add('   LEFT OUTER JOIN');
       Add('   (SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,LP.VL_BASE_VENDA');
       Add('   FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
       Add('   PRDDM.DC_COMPRA_MERCADORIA CM,');
       Add('   PRDDM.DC_MERCADORIA M,');
       Add('   PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
       Add('   WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
       Add('   AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
       Add('   AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
       Add('   AND M.ID_SITUACAO_MERCADORIA=''A''');
       Add('   AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
       Add('   AND M.ID_SITUACAO_MERCADORIA = ''A''');
       Add('   AND LP.CD_EMPRESA = EM.CD_EMPRESA');
       Add('   AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
       Add('   AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
       Add('                              FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
       Add('                              WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
       Add('                              AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
       Add('                              AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');
       Add('   LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
       Add('   AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');
       Add('    LEFT OUTER JOIN');
       Add('        (SELECT');
       Add('    ET.CD_MERCADORIA');
       Add('   ,CD_EMPRESA_DESTINO');
       Add('   ,SUM(NVL(QT_TRANSFERENCIA,0)) AS QT_TRANSFERENCIA');
       Add('   ,SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
       Add('   FROM');
       Add('     PRDDM.DC_ESTOQUE_TRANSFERENCIA ET,');
       Add('     PRDDM.DC_COMPRA_MERCADORIA CM');
       Add('   WHERE');
       Add('      ET.CD_MERCADORIA=CM.CD_MERCADORIA');
       Add('     AND CD_EMPRESA_DESTINO=CM.CD_EMPRESA');
       Add('   GROUP BY  ET.CD_MERCADORIA,CD_EMPRESA_DESTINO ) TRANS ON TRANS.CD_MERCADORIA= COMPRA.CD_MERCADORIA AND TRANS.CD_EMPRESA_DESTINO=COMPRA.CD_EMPRESA');
       Add('   LEFT OUTER JOIN (SELECT');
       Add('     NROM_Y,');
       Add('     CD_DESTINO,');
       Add('     QT_PENDENCIA,');
       Add('     QT_PEDIDO,');
       Add('     QT_ATENDIDA,');
       Add('    CD_EMPRESA AS CD_PEDIDO_CROSS');
       Add('   FROM');
       Add('   (SELECT');
       Add('             NROM_Y,');
       Add('             CD_EMPRESA_DESTINO CD_DESTINO,');
       Add('             SUM(ITEM.QUAY_Y -ITEM.CHEY_Y) QT_PENDENCIA,');
       Add('             SUM(ITEM.QUAY_Y) QT_PEDIDO,');
       Add('             SUM(ITEM.CHEY_Y) QT_ATENDIDA,');
       Add('             CAPA.CD_EMPRESA');
       Add('     FROM');
       Add('        PRDDM.DCPCC CAPA,');
       Add('        PRDDM.DCPCI ITEM,');
       Add('        ACESSO.DC_EMPRESA EMP');
       Add('     WHERE NROP_P=NROP_Y');
       Add('                AND SITP_P IN(''N'',''P'')');
       Add('                AND SITY_Y IN(''N'',''P'')');
       Add('          AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
       Add('          AND ((CAPA.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
       Add('          AND ID_EMPRESA_FISICA=''S''');
       Add('           AND LABP_P=:PnrFornecedor');
       Add('          GROUP BY CD_EMPRESA_DESTINO,NROM_Y,CAPA.CD_EMPRESA)) ITEMPEDIDO ON   ITEMPEDIDO.NROM_Y=COMPRA.CD_MERCADORIA AND ITEMPEDIDO.CD_DESTINO=COMPRA.CD_EMPRESA');
       Add('          LEFT OUTER JOIN');
       Add('   (SELECT');
       Add('     PEDIDO_ITEM_NFE.CD_MERCADORIA,');
       Add('    SUM(QT_MERCADORIA_ENTRADA) AS QT_MERCADORIA_ENTRADA,');
       Add('    PEDIDO_ITEM_NFE.CD_EMPRESA,');
       Add('      0 AS CD_EMPRESA_DESTINO');
       Add('   ,CASE');
       Add('    WHEN  SUM(QT_MERCADORIA_ENTRADA) >0 THEN ''S''');
       Add('    ELSE ''N''');
       Add('    END ID_PEDIDO_FATURADO');
       Add('   FROM');
       Add('   PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE,');
       Add('   PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
       Add('   PRDDM.DC_NFE_ENTRADA NFE,');
       Add('   PRDDM.DCPCC PED,');
       Add('   PRDDM.DCPCI ITEMPED');
       Add('   WHERE');
       Add('             ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
       Add('        AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
       Add('     AND NROP_P=NROP_Y');
       Add('     AND SITY_Y IN(''N'',''P'')');
       Add('     AND ((PED.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  PED.CD_OPERACAO_REDE=0)');
       Add('     AND PED.CD_EMPRESA_DESTINO=ITEM_NFE.CD_EMPRESA');
       Add('     AND NROM_Y=PEDIDO_ITEM_NFE.CD_MERCADORIA');
       Add('    AND CD_PEDIDO=NROP_P');
       Add('        AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
       Add('        AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
       Add('        AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
       Add('        AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
       Add('        AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
       Add('        AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
       Add('        AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
       Add('        AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
       Add('   GROUP BY');
       Add('            PEDIDO_ITEM_NFE.CD_MERCADORIA,');
       Add('            PEDIDO_ITEM_NFE.CD_EMPRESA) NFE ON NFE.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
       Add('                                            AND NFE.CD_EMPRESA=ITEMPEDIDO.CD_PEDIDO_CROSS');
       Add('   WHERE');
       Add('    COMPRA.CD_MERCADORIA=EM.CD_MERCADORIA');
       Add('   AND COMPRA.CD_EMPRESA=EM.CD_EMPRESA');
       Add('   AND COMPRA.CD_MERCADORIA=FIN.CD_MERCADORIA');
       Add('   AND COMPRA.CD_EMPRESA=FIN.CD_EMPRESA');
       Add('   AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
       Add('   AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
     //  Add('   --AND COMPRA.CD_MERCADORIA=58294');
       Add('');
       Add('   GROUP BY COMPRA.CD_EMPRESA,COMPRA.CD_MERCADORIA,  QT_TRANSITO,QT_TRANSFERENCIA))');
       Add('   GROUP BY CD_EMPRESA');
       Add('   ORDER BY CD    ');





      {Add('Add('SELECT');
      AAdd('dd('ID_UNIDADE_FEDERACAO AS  CD ,');
      AAdd('dd('SUM(UNID_EXCESSO) UNID_EXCESSO,');
      AAdd('dd('SUM(UNID_EXCESSO*VL_CUSTO_UNITARIO) VL_EXCESSO_CUSTO,');
      AAdd('dd('SUM(UNID_EXCESSO*VL_PRECO_COMPRA) VL_EXCESSO_LISTA,');
      AAdd('dd('SUM(UNID_EXCESSO*VL_PRECO_VENDA) VL_EXCESSO_VENDA,');
      AAdd('dd('SUM(UNID_EXCESSO*VL_BASE_VENDA) VL_EXCESSO_FABRICA,');
      AAdd('dd('SUM(UNID_EXCESSO*MTS_CUBICO) VL_EXCESSO_CUBICO,');
      AAdd('dd('CD_EMPRESA');
      AAdd('dd('FROM');
      AAdd('dd('(SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA,MERCADORIA.NM_MERCADORIA,');
      Add('MERCADORIA.DS_APRESENTACAO_MERCADORIA ,');
      Add('COMPRA.ID_CURVA_MERCADORIA,');
      Add('COMPRA.CD_EMPRESA,');
      Add('VL_PRECO_COMPRA,');
      Add('VL_PRECO_VENDA,');
      Add('VL_CUSTO_FINANCEIRO_MERCADORIA AS VL_CUSTO_UNITARIO,');

      Add('PC_DESCONTO_PADRAO_COMPRA,');
      Add('QT_ESTOQUE_MAXIMO,');
      Add('(QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) AS QT_ESTOQUE,');
      Add('MES3,');
      Add('MES2,');
      Add('MES1,');
      Add('MES0,');
      Add('VENDA_TRIMESTRE,');
      Add('QT_VENDA,');
      Add('DIAS_ESTOQUE_ZERO,');
      Add('NR_DIAS_DIV ,');
      Add('MEDIA_VENDA_DIA,');
      Add('QT_DIAS_MEDIO_LEADTIME,');
      Add('VL_BASE_VENDA,');
      Add('CASE');
      Add('  WHEN MEDIA_VENDA_DIA>0 THEN ROUND((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)/MEDIA_VENDA_DIA,0)');
      Add('END DIAS_ESTOQUE,');
      Add('');
      Add('NVL(UNI_PENDENTE,0) AS UNI_PENDENTE,');
      Add('');
      Add('CASE');
      Add('   WHEN  ((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) - ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0))>0');
      Add('      AND');
      Add('      (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add('    ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)<=(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA)');
      Add('   THEN');
      Add('         ROUND(ROUND(((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) -');
      Add('         ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0)),0)/QT_EMBALAGEM_COMPRA,0) *QT_EMBALAGEM_COMPRA');
      Add('   WHEN');
      Add('');
      Add('    (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add(' ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)>(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA) THEN 0');
      Add('');
      Add('   ELSE 0');
      Add('END SUG_COMPRA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('ID_UNIDADE_FEDERACAO,');
      Add('((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*');
      Add('QT_PROFUNDIDADE_MERCADORIA)/1000000) MTS_CUBICO,');
      Add('CASE');
      Add('WHEN (MEDIA_VENDA_DIA>0) AND (ROUND((ROUND( ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO))/MEDIA_VENDA_DIA,0) - QT_ESTOQUE_MAXIMO),0))>0  THEN');
      Add('ROUND((ROUND(((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO))/MEDIA_VENDA_DIA,0) - QT_ESTOQUE_MAXIMO)*MEDIA_VENDA_DIA,0)');
      Add(' ELSE 0');
      Add('END UNID_EXCESSO');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA');
      Add('JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA  AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA= ESTOQUE.CD_EMPRESA AND  ID_EMPRESA_FISICA=''S''');
      Add('');
      Add('LEFT JOIN DC_LEADTIME_FORNECEDOR LEADTIME ON  LEADTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LEADTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=ID_REFRIGERADO');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA.CD_GRUPO_FORNECEDOR');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM   ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
      Add('                                                           AND  GFM.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
      Add('                                                           AND  GFM.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');

      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');


      Add('LEFT OUTER JOIN');
      Add('');
      Add('(SELECT');
      Add('CD_MERCADORIA_VENDA,');
      Add('CD_EMPRESA_VENDA,');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
      Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
      Add('--SOMATORIO VENDA                                     ');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS VENDA_TRIMESTRE,');
      Add('');
      Add('SUM(QT_VENDIDA) AS QT_VENDA,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
      Add('MAX(NR_DIAS_DIV) AS NR_DIAS_DIV,');
      Add('');
      Add('');
      Add('--CALCULO MEDIA');
      Add('CASE');
      Add(' WHEN  (MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO))>0 THEN');
      Add('        ROUND((SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0))) / ( MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO)),3)');
      Add(' ELSE');
      Add('    0');
      Add(' END MEDIA_VENDA_DIA');

      Add('FROM');
      Add('(');
      Add('SELECT');
      Add('CM.CD_MERCADORIA AS CD_MERCADORIA_VENDA,');
      Add('VM.CD_EMPRESA AS CD_EMPRESA_VENDA,');
      Add('SUM(QT_VENDIDA) QT_VENDIDA,');
      Add('CASE');
      Add('WHEN (CD_OPERADOR_LOGISTICO=1) AND (DT_VENDA_MERCADORIA <>ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00)) THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
      Add('END QT_DIAS_ESTOQUE_ZERO,');
      Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
      Add('');
      Add(' CASE');
      Add('     WHEN DT_VENDA_MERCADORIA =ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00) THEN EXTRACT( DAY FROM SYSDATE)');
      Add('     ELSE');
      Add('        (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - MAX(DT_VENDA_MERCADORIA))');
      Add(' END       NR_DIAS_DIV');
      Add('');
      Add('');
      Add(' FROM');
      Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('');
      Add('WHERE');
      Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND  VM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND DT_VENDA_MERCADORIA<= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA_VENDA,CD_EMPRESA_VENDA');
      Add('ORDER BY CD_MERCADORIA_VENDA) VENDA ON VENDA.CD_MERCADORIA_VENDA=MERCADORIA.CD_MERCADORIA AND VENDA.CD_EMPRESA_VENDA=COMPRA.CD_EMPRESA');

      Add('LEFT OUTER JOIN');
      Add('(SELECT   CM.CD_MERCADORIA,');
      Add('NVL(SUM(QUAY_Y  - CHEY_Y),0) AS UNI_PENDENTE,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIAFABRICA,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCIACUSTO,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA ,ITEM.CD_EMPRESA AS CD_EMPRESA');
      Add(' FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M1');
      Add(' WHERE');
      Add(' NROP_P=NROP_Y');
      Add('AND NROM_Y=CM.CD_MERCADORIA');
      Add('AND CM.CD_MERCADORIA=M1.CD_MERCADORIA');
   //   Add('AND item.cd_operacao_rede in(0,1)');
      Add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND SITP_P IN(''N'',''P'',''T'')');
      Add('AND SITY_Y IN(''N'',''P'',''T'')');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('GROUP BY CM.CD_MERCADORIA,');
      Add('             NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,ITEM.CD_EMPRESA) PENDENCIA  ON');
      Add('                                                             PENDENCIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add(')');
      Add('GROUP BY CD_EMPRESA,ID_UNIDADE_FEDERACAO');
      Add('Union all');
      Add('SELECT');
      Add('ID_UNIDADE_FEDERACAO AS  CD ,');
      Add('SUM(UNID_EXCESSO) UNID_EXCESSO,');
      Add('SUM(UNID_EXCESSO*VL_CUSTO_UNITARIO) AS  VL_EXCESSO_CUSTO,');
      Add('SUM(UNID_EXCESSO*VL_PRECO_COMPRA) VL_EXCESSO_LISTA,');
      Add('SUM(UNID_EXCESSO*VL_PRECO_VENDA) VL_EXCESSO_VENDA,');
      Add('SUM(UNID_EXCESSO*VL_BASE_VENDA) VL_EXCESSO_FABRICA,');
      Add('SUM(UNID_EXCESSO*MTS_CUBICO) VL_EXCESSO_CUBICO,');
      Add('CD_EMPRESA');
      Add('FROM');
      Add('(SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA,MERCADORIA.NM_MERCADORIA,');
      Add('MERCADORIA.DS_APRESENTACAO_MERCADORIA ,');
      Add('COMPRA.ID_CURVA_MERCADORIA,');
      Add('500 as CD_EMPRESA,');
      Add('VL_PRECO_COMPRA,');
      Add('VL_PRECO_VENDA,');
      Add('VL_CUSTO_FINANCEIRO_MERCADORIA AS VL_CUSTO_UNITARIO,');
      Add('PC_DESCONTO_PADRAO_COMPRA,');
      Add('QT_ESTOQUE_MAXIMO,');
      Add('(QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) AS QT_ESTOQUE,');
      Add('MES3,');
      Add('MES2,');
      Add('MES1,');
      Add('MES0,');
      Add('VENDA_TRIMESTRE,');
      Add('QT_VENDA,');
      Add('DIAS_ESTOQUE_ZERO,');
      Add('NR_DIAS_DIV ,');
      Add('MEDIA_VENDA_DIA,');
      Add('QT_DIAS_MEDIO_LEADTIME,');
      Add('VL_BASE_VENDA,');
      Add('CASE');
      Add('  WHEN MEDIA_VENDA_DIA>0 THEN ROUND((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)/MEDIA_VENDA_DIA,0)');
      Add('END DIAS_ESTOQUE,');
      Add('');
      Add('NVL(UNI_PENDENTE,0) AS UNI_PENDENTE,');
      Add('');
      Add('CASE');
      Add('   WHEN  ((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) - ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0))>0');
      Add('      AND');
      Add('      (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add('    ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)<=(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA)');
      Add('   THEN');
      Add('         ROUND(ROUND(((QT_ESTOQUE_MAXIMO+ QT_DIAS_MEDIO_LEADTIME)*MEDIA_VENDA_DIA) -');
      Add('         ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO)+NVL(UNI_PENDENTE,0)),0)/QT_EMBALAGEM_COMPRA,0) *QT_EMBALAGEM_COMPRA');
      Add('   WHEN');
      Add('');
      Add('    (QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO) -');
      Add(' ROUND((QT_DIAS_MEDIO_LEADTIME+QT_DIAS_FREQUENCIA_COMPRA)*MEDIA_VENDA_DIA,0)>(ROUND(QT_DIAS_MEDIO_LEADTIME,0)*MEDIA_VENDA_DIA) THEN 0');
      Add('');
      Add('   ELSE 0');
      Add('END SUG_COMPRA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('''GERAL'' AS ID_UNIDADE_FEDERACAO,');
      Add('((QT_LARGURA_MERCADORIA*QT_ALTURA_MERCADORIA*');
      Add('QT_PROFUNDIDADE_MERCADORIA)/1000000) MTS_CUBICO,');
      Add('CASE');
      Add('WHEN (MEDIA_VENDA_DIA>0) AND (ROUND((ROUND( ((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO))/MEDIA_VENDA_DIA,0) - QT_ESTOQUE_MAXIMO),0))>0  THEN');
      Add('ROUND((ROUND(((QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA - QT_VENCIDO))/MEDIA_VENDA_DIA,0) - QT_ESTOQUE_MAXIMO)*MEDIA_VENDA_DIA,0)');
      Add(' ELSE 0');
      Add('END UNID_EXCESSO');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA');
      Add('JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FINANCEIRO.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND FINANCEIRO.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA  AND CD_GRUPO_FORNECEDOR=:PnrFornecedor AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
      Add('JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA= ESTOQUE.CD_EMPRESA AND  ID_EMPRESA_FISICA=''S''');
      Add('');
      Add('LEFT JOIN DC_LEADTIME_FORNECEDOR LEADTIME ON  LEADTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LEADTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=ID_REFRIGERADO');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA.CD_GRUPO_FORNECEDOR');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM   ON   GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
      Add('                                                           AND  GFM.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
      Add('                                                           AND  GFM.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA, LP.VL_UNITARIO_COMPRA,LP.PC_ICMS_COMPRA,LP.VL_BASE_COMPRA,lp.VL_BASE_VENDA');
      Add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
      Add('WHERE EM.CD_EMPRESA = CM.CD_EMPRESA');
      Add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
      Add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
      Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
      Add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');
      Add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
      Add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
      Add('                           FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
      Add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
      Add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
      Add('                           AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');

      Add('LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');


      Add('LEFT OUTER JOIN');
      Add('');
      Add('(SELECT');
      Add('CD_MERCADORIA_VENDA,');
      Add('CD_EMPRESA_VENDA,');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
      Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
      Add('--SOMATORIO VENDA                                     ');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS VENDA_TRIMESTRE,');
      Add('');
      Add('SUM(QT_VENDIDA) AS QT_VENDA,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
      Add('MAX(NR_DIAS_DIV) AS NR_DIAS_DIV,');
      Add('');
      Add('');
      Add('--CALCULO MEDIA');
      Add('CASE');
      Add(' WHEN  (MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO))>0 THEN');
      Add('        ROUND((SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) +');
      Add('        SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0))) / ( MAX(NR_DIAS_DIV) - SUM(QT_DIAS_ESTOQUE_ZERO)),3)');
      Add(' ELSE');
      Add('    0');
      Add(' END MEDIA_VENDA_DIA');

      Add('FROM');
      Add('(');
      Add('SELECT');
      Add('CM.CD_MERCADORIA AS CD_MERCADORIA_VENDA,');
      Add('VM.CD_EMPRESA AS CD_EMPRESA_VENDA,');
      Add('SUM(QT_VENDIDA) QT_VENDIDA,');
      Add('CASE');
      Add('WHEN (CD_OPERADOR_LOGISTICO=1) AND (DT_VENDA_MERCADORIA <>ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00)) THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
      Add('END QT_DIAS_ESTOQUE_ZERO,');
      Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
      Add('');
      Add(' CASE');
      Add('     WHEN DT_VENDA_MERCADORIA =ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00) THEN EXTRACT( DAY FROM SYSDATE)');
      Add('     ELSE');
      Add('        (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0)  - MAX(DT_VENDA_MERCADORIA))');
      Add(' END       NR_DIAS_DIV');
      Add('');
      Add('');
      Add(' FROM');
      Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('');
      Add('WHERE');
      Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND  VM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND DT_VENDA_MERCADORIA<= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA_VENDA,CD_EMPRESA_VENDA');
      Add('ORDER BY CD_MERCADORIA_VENDA) VENDA ON VENDA.CD_MERCADORIA_VENDA=MERCADORIA.CD_MERCADORIA AND VENDA.CD_EMPRESA_VENDA=COMPRA.CD_EMPRESA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT   CM.CD_MERCADORIA,');
      Add('NVL(SUM(QUAY_Y  - CHEY_Y),0) AS UNI_PENDENTE,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIAFABRICA,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCIACUSTO,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA ,ITEM.CD_EMPRESA AS CD_EMPRESA');
      Add(' FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('ACESSO.DC_EMPRESA emp,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_MERCADORIA M1');
      Add(' WHERE');
      Add(' NROP_P=NROP_Y');
      Add('AND NROM_Y=CM.CD_MERCADORIA');
      Add('AND CM.CD_MERCADORIA=M1.CD_MERCADORIA');
      Add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
//      Add('AND item.cd_operacao_rede in(0,1)');

      Add('AND EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
      Add('AND EMP.ID_EMPRESA_FISICA=''S''');
     Add('AND SITP_P IN(''N'',''P'',''T'')');
      Add('AND SITY_Y IN(''N'',''P'',''T'')');
      Add('AND CM.CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      Add('GROUP BY CM.CD_MERCADORIA,');
      Add('             NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,ITEM.CD_EMPRESA) PENDENCIA  ON');
      Add('                                                             PENDENCIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add(')');
      Add('GROUP BY CD_EMPRESA,ID_UNIDADE_FEDERACAO');  }

     // Add('ORDER BY CD_EMPRESA');

      stQry.SaveToFile('C:\TEMP\QryExcessoNova.sql');
      with _cdsExcessoEstoque do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsBcd := PnrFornecedor;
        open;
      end;
      SetNomeCamposExcesso;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmTelaCompras.SetNomeCamposExcesso;
begin

  TStringField(_cdsExcessoEstoque.FieldByName('LOCAL')).DisplayLabel := 'Local';
  TStringField(_cdsExcessoEstoque.FieldByName('LOCAL')).DisplayWidth := 05;

  TIntegerField(_cdsExcessoEstoque.FieldByName('NR_UNIDADES_EXCESSO')).DisplayLabel :='Unid.Excesso';
  TIntegerField(_cdsExcessoEstoque.FieldByName('NR_UNIDADES_EXCESSO')).DisplayFormat :='###,###,###,##0';
  TIntegerField(_cdsExcessoEstoque.FieldByName('NR_UNIDADES_EXCESSO')).DisplayWidth := 10;
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_CUSTO')).DisplayLabel:= 'Vlr.Pre?o Custo';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_CUSTO')).DisplayFormat:= '###,###,###,##0.00';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_CUSTO')).DisplayWidth := 10;

  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_LISTA')).DisplayLabel:= 'Vlr.Pre?o Lista';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_LISTA')).DisplayFormat:= '###,###,###,##0.00';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_LISTA')).DisplayWidth := 10;

  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_VENDA')).DisplayLabel:= 'Vlr.P?o Venda.';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_VENDA')).DisplayFormat:= '###,###,###,##0.00';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_VENDA')).DisplayWidth := 10;


  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_FABRICA')).DisplayLabel:= 'Vlr.P?o Fabrica.';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_FABRICA')).DisplayFormat:= '###,###,###,##0.00';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_FABRICA')).DisplayWidth := 10;

  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_MTS_CUBICO')).DisplayLabel:= 'Mts.Cubico';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_MTS_CUBICO')).DisplayFormat:= '###,##0.000';
  TFloatField(_cdsExcessoEstoque.FieldByName('VL_EXCESSO_MTS_CUBICO')).DisplayWidth := 06;

  TIntegerField(_cdsExcessoEstoque.FieldByName('CD')).DisplayLabel := 'CD';
  TIntegerField(_cdsExcessoEstoque.FieldByName('CD')).DisplayFormat := '00';
  TIntegerField(_cdsExcessoEstoque.FieldByName('CD')).DisplayWidth := 003;

end;

procedure T_frmTelaCompras.MontaGraficoGeral(PGrafico: TBarSeries;
  PnrProduto, PnrEmpresa: Integer);
var
  _qtVenda: Integer;
  I: Integer;
  Ano, mes: Word;
  data: Tdate;
  stMes: String;
  corBarra: TColor;

begin
  _dtpData.Date := Date;
  PGrafico.Clear;
  Application.ProcessMessages;
  mes := MonthOf(_dtpData.Date);
  data := _dtpData.Date - mes + 1;
  Ano := YearOf(IncMonth(Date, -mes));

  for I := mes to 12 do
  begin
    stMes := UpperCase(ShortMonthNames[I]);
    nrQtadade := VendasSumarizadaUnidade[PnrEmpresa, I];

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;
    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    PGrafico.Add(nrQtadade, stMes, corBarra);
    if nrQtadade > nrMaiorValorUnidade then
      nrMaiorValorUnidade := nrQtadade;

  end;
  for I := 1 to mes - 1 do
  begin

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;

    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    nrQtadade := VendasSumarizadaUnidade[PnrEmpresa, I];
    stMes := UpperCase(ShortMonthNames[I]);
    PGrafico.Add(nrQtadade, stMes, corBarra);
    if nrQtadade > nrMaiorValorUnidade then
      nrMaiorValorUnidade := nrQtadade;
  end;
  corBarra := clWhite;
  if PnrEmpresa = 1 then
    corBarra := clTeal;
  if PnrEmpresa = 4 then
    corBarra := $000080FF;

  // MUDAR COR CONFORME MES SELECIONADO
  // if idMesSelecionado[13]='S' then
  // corBarra:=clSkyBlue;
  nrQtadade := VendasSumarizadaUnidade[PnrEmpresa, 13];
  stMes := 'ATUAL';
  PGrafico.Add(nrQtadade, stMes, corBarra);
  if nrQtadade > nrMaiorValorUnidade then
    nrMaiorValorUnidade := nrQtadade;
  Chart2.LeftAxis.SetMinMax(0, nrMaiorValorUnidade * 1.35);

end;

procedure T_frmTelaCompras.MontaGraficoGeralValor(PGrafico: TBarSeries;
  PnrProduto, PnrEmpresa: Integer);
var
  _qtVenda: Integer;
  I: Integer;
  Ano, mes: Word;
  data: Tdate;
  stMes: String;
  corBarra: TColor;
  vlVenda: Double;

begin
  _dtpData.Date := Date;
  PGrafico.Clear;
  Application.ProcessMessages;
  mes := MonthOf(_dtpData.Date);
  data := _dtpData.Date - mes + 1;
  Ano := YearOf(IncMonth(Date, -mes));

  for I := mes to 12 do
  begin
    stMes := UpperCase(ShortMonthNames[I]);
    vlVenda := VendasSumarizadaValor[PnrEmpresa, I];

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;
    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    PGrafico.Add(vlVenda, stMes, corBarra);
    if vlVenda > nrMaiorValorReais then
      nrMaiorValorReais := vlVenda;

  end;
  for I := 1 to mes - 1 do
  begin

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;

    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    vlVenda := VendasSumarizadaValor[PnrEmpresa, I];
    stMes := UpperCase(ShortMonthNames[I]);
    PGrafico.Add(vlVenda, stMes, corBarra);
    if vlVenda > nrMaiorValorReais then
      nrMaiorValorReais := vlVenda;
  end;
  corBarra := clWhite;
  if PnrEmpresa = 1 then
    corBarra := clTeal;
  if PnrEmpresa = 4 then
    corBarra := $000080FF;

  // MUDAR COR CONFORME MES SELECIONADO
  // if idMesSelecionado[13]='S' then
  // corBarra:=clSkyBlue;
  vlVenda := VendasSumarizadaValor[PnrEmpresa, 13];
  stMes := 'ATUAL';
  PGrafico.Add(vlVenda, stMes, corBarra);
  if vlVenda > nrMaiorValorReais then
    nrMaiorValorReais := vlVenda;
  Chart3.LeftAxis.SetMinMax(0, nrMaiorValorReais * 1.35);

end;

procedure T_frmTelaCompras.MontaGraficoLinha(PGrafico: TLineSeries;
  PnrProduto, PnrEmpresa: Integer);
var
  _qtVenda: Integer;
  I: Integer;
  Ano, mes: Word;
  data: Tdate;
  stMes: String;
  corBarra: TColor;

begin
  _dtpData.Date := Date;
  PGrafico.Clear;
  Application.ProcessMessages;
  mes := MonthOf(_dtpData.Date);
  data := _dtpData.Date - mes + 1;
  Ano := YearOf(IncMonth(Date, -mes));

  for I := mes to 12 do
  begin
    stMes := UpperCase(ShortMonthNames[I]);
    nrQtadade := VendasSumarizadaUnidade[PnrEmpresa, I];

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;
    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    corBarra := clDefault;
    PGrafico.Add(nrQtadade, stMes, corBarra);
    if nrQtadade > nrMaiorValorUnidade then
      nrMaiorValorUnidade := nrQtadade;

  end;
  for I := 1 to mes - 1 do
  begin

    corBarra := clWhite;
    if PnrEmpresa = 1 then
      corBarra := clTeal;
    if PnrEmpresa = 4 then
      corBarra := $000080FF;

    // MUDAR COR CONFORME MES SELECIONADO
    if idMesSelecionado[I] = 'S' then
      corBarra := clSkyBlue;

    corBarra := clDefault;
    nrQtadade := VendasSumarizadaUnidade[PnrEmpresa, I];
    stMes := UpperCase(ShortMonthNames[I]);
    PGrafico.Add(nrQtadade, stMes, corBarra);
    if nrQtadade > nrMaiorValorUnidade then
      nrMaiorValorUnidade := nrQtadade;
  end;
  corBarra := clWhite;
  if PnrEmpresa = 1 then
    corBarra := clTeal;
  if PnrEmpresa = 4 then
    corBarra := $000080FF;

  corBarra := clDefault;
  // MUDAR COR CONFORME MES SELECIONADO
  // if idMesSelecionado[13]='S' then
  // corBarra:=clSkyBlue;
  nrQtadade := VendasSumarizadaUnidade[PnrEmpresa, 13];
  stMes := 'ATUAL';
  PGrafico.Add(nrQtadade, stMes, corBarra);
  if nrQtadade > nrMaiorValorUnidade then
    nrMaiorValorUnidade := nrQtadade;
  Chart2.LeftAxis.SetMinMax(0, nrMaiorValorUnidade * 1.35);

end;

procedure T_frmTelaCompras.PreencheComboGrafico;
begin
  _cdsEmpresa.First;
  while not _cdsEmpresa.eof do
  begin
    _cbxEmpresa.Items.Add(FormatFloat('00',
      _cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger) + ' - ' +
      _cdsEmpresa.FieldByName('ID_UNIDADE_FEDERACAO').AsString);
    _cdsEmpresa.Next;
  end;
  _cdsEmpresa.First;
  _cbxEmpresa.ItemIndex := 0;

end;

procedure T_frmTelaCompras.MostraDiasEstoque;
begin

  try
    _stbCompras.Panels[1].Text := 'Mostra dias Estoque...';
    _cdsDiasEstoque := DiasEstoqueFinanceiroEST(nrCompradorPedido, 0,nrFornecedorPedido);
    if _cdsDiasEstoque <> nil then
    begin
      _chkDiasEstoqueComPendencia.Checked := true;
      _dsDiasEstoque.DataSet := _cdsDiasEstoque;
      _cdsDiasEstoque.IndexFieldNames := 'CD_EMPRESA';
      _cdsDiasEstoque.open;
      _cdsDiasEstoque.filter := 'CD_EMPRESA=1';
      _cdsDiasEstoque.Filtered := true;
     { vtEstoqueCompradorSC := _cdsDiasEstoque.FieldByName('VT_ESTOUE_COMPRADOR').AsFloat;
      vtEstoqueFornecedorSC := _cdsDiasEstoque.FieldByName('VT_ESTOQUE_FORNECEDOR').AsFloat;
      vtPendenciaCompradorSC := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_CPR').AsFloat;
      vtPendenciaFornecedorSC := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_FOR').AsFloat;
      vtCMVMedioCompradorSC := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_COMPRADOR').AsFloat;
      vtCMVMedioForncecedorSC := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_FORNECEDOR').AsFloat;

      _cdsDiasEstoque.filter := 'CD_EMPRESA=4';
      _cdsDiasEstoque.Filtered := true;
      vtEstoqueCompradorRS := _cdsDiasEstoque.FieldByName('VT_ESTOUE_COMPRADOR').AsFloat;
      vtEstoqueFornecedorRS := _cdsDiasEstoque.FieldByName('VT_ESTOQUE_FORNECEDOR').AsFloat;
      vtPendenciaCompradorRS := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_CPR').AsFloat;
      vtPendenciaFornecedorRS := _cdsDiasEstoque.FieldByName('VL_CUSTO_PENDENCIA_FOR').AsFloat;
      vtCMVMedioCompradorRS := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_COMPRADOR').AsFloat;
      vtCMVMedioForncecedorRS := _cdsDiasEstoque.FieldByName('VL_CMV_MEDIO_FORNECEDOR').AsFloat;}
      _cdsDiasEstoque.Filtered := false;

    end;
  except
    on E: Exception do
    begin
      trataerro(E.Message,
        'Erro ao Calcular Nr dias Estoque Fornecedor/compardor!!!');
    end;

  end;
end;

procedure T_frmTelaCompras.montaGraficoEstoqueDiario;
var
  vlPosicaoPedido: Double;
  PosicaoEstoque, qtUltimoCompra, PosicaoGrafico: Integer;
  dtUltimoPedido: Tdate;

  stDia: String;
  DadosUltimaCompra: TDadosUltimasCompra;
  DadosPedidoFornecedor: TDadosPedidoCompra;
  I, nrDiasEntrega: Integer;
begin
  if _cdsEstoqueDiario <> nil then
  begin
    _cdsEstoqueDiario.IndexFieldNames := 'DAEE_E';
    _cdsEstoqueDiario.open;
    _cdsEstoqueDiario.First;

    // qtMaxima    :=   DadosEstoqueCompra.nrEstoqueMaximo * vlMediaDiaCD;
    // qtSeguranca :=   DadosEstoqueCompra.nrEstoqueMInimo * vlMediaDiaCD;

    vlPosicaoPedido := (qtMaxima - (qtMaxima * 0.03)) * 1.35;

    vlEixoX := 0;
    Series3.Clear;
    Series8.Clear;
    Series9.Clear;
    Series10.Clear;
    Series11.Clear;
    PosicaoGrafico := 0;
    qtUltimoCompra := 0;
    nrDiasEntrega := StrToIntDef(FormatFloat('0000', nrLeadTime * 2), 0);

    while not _cdsEstoqueDiario.eof do
    begin
      if vlEixoX < _cdsEstoqueDiario.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger then
        vlEixoX := _cdsEstoqueDiario.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;
      if vlEixoX < qtMaxima then
        vlEixoX := qtMaxima;
      stDia := FormatDateTime('dd/mm', _cdsEstoqueDiario.FieldByName('DAEE_E').AsDateTime);
      PosicaoEstoque := _cdsEstoqueDiario.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;

      Series3.Add(qtSeguranca, '', clBlack);
      Series8.Add(qtMaxima, '', clRed);
      Series9.Add(PosicaoEstoque, stDia, clBlue);

      DadosUltimaCompra := FiltraUltimasCompras(nrProduto, nrEmpresa,
        _cdsEstoqueDiario.FieldByName('DAEE_E').AsDateTime);

      // if DadosUltimaCompra.qtComprada>0 then
      Series10.Add(DadosUltimaCompra.qtComprada, '', DadosUltimaCompra.Cor);

      DadosPedidoFornecedor := FiltraUltimoPedido(nrProduto, nrEmpresa,
        _cdsEstoqueDiario.FieldByName('DAEE_E').AsDateTime);

      if DadosPedidoFornecedor.idStatusPedido <> '' then
      begin
        if (DadosPedidoFornecedor.idStatusPedido = 'N') or
          (DadosPedidoFornecedor.idStatusPedido = 'P')  then
        begin
          qtUltimoCompra := DadosUltimaCompra.qtComprada;
          if qtUltimoCompra > 0 then
            dtUltimoPedido := DadosPedidoFornecedor.dtCompra;
        end;
        Series11.AddXY(PosicaoGrafico, vlPosicaoPedido, '',
                       DadosPedidoFornecedor.Cor);
      end;

      // if DadosUltimaCompra.qtComprada > vlEixoX then
      // vlEixoX := DadosUltimaCompra.qtComprada;

      Chart1.LeftAxis.SetMinMax(0, vlEixoX * 1.35);

      inc(PosicaoGrafico);

      _cdsEstoqueDiario.Next;
    end;
    for I := 0 to nrDiasEntrega do
    begin

      if (dtPedido + I) = (dtUltimoPedido + nrLeadTime) then
        PosicaoEstoque := PosicaoEstoque + qtUltimoCompra;
      if (dtPedido + I) = (dtPedido + nrLeadTime) then
        PosicaoEstoque := PosicaoEstoque +
          strtoint(FormatFloat('000000', nrQtdadeSusgetaoPossivel));

      PosicaoEstoque := PosicaoEstoque -
        StrToIntDef(FormatFloat('000000000', vlMediaDiaCD), 0);
      stDia := FormatDateTime('dd/mm', dtPedido + I);
      // if vlEixoX < PosicaoEstoque then
      // vlEixoX := PosicaoEstoque;

      DadosUltimaCompra := FiltraUltimasCompras(nrProduto, nrEmpresa,
        dtPedido + I);

      // if DadosUltimaCompra.qtComprada>0 then
      Series10.Add(DadosUltimaCompra.qtComprada, '', DadosUltimaCompra.Cor);

      Series3.Add(qtSeguranca, '', clBlack);
      Series8.Add(qtMaxima, '', clRed);
      Series9.Add(PosicaoEstoque, stDia, clLime);
      DadosPedidoFornecedor := FiltraUltimoPedido(nrProduto, nrEmpresa,
        dtPedido + I);

      if DadosPedidoFornecedor.idStatusPedido <> '' then
        Series11.AddXY(PosicaoGrafico, vlPosicaoPedido, '',
          DadosPedidoFornecedor.Cor);
      inc(PosicaoGrafico);
      // Chart1.LeftAxis.SetMinMax(0, vlEixoX * 1.35);

    end;

  end;

end;

Procedure T_frmTelaCompras.SetgraficoVenda;
begin
  if not Series2.Visible then
  begin
    Chart1.View3D := true;
    // Series1.Visible := true;
    Series2.Visible := true;
    Series3.Visible := false;
    Series8.Visible := false;
    Series9.Visible := false;
    Series10.Visible := false;
    Series11.Visible := false;
    //MostraMedia;
  end;

end;

Procedure T_frmTelaCompras.SetgraficoPosicaoEstoque;
begin
  if Series2.Visible then
  begin
    _cdsEstoqueDiario := PosicaoEstoqueDiario(nrProduto, nrEmpresa);

    if _cdsEstoqueDiario <> nil then
    begin
      Chart1.View3D := false;
      // Series1.Visible := false;
      Series2.Visible := false;
      Series3.Visible := true;
      Series8.Visible := true;
      Series9.Visible := true;
      Series10.Visible := true;
      Series11.Visible := true;
      Series3.Title := 'Est.Seguran?a';
      Series8.Title := 'Est.M?ximo';
      montaGraficoEstoqueDiario;
    end;

  end
  else
  begin
    Chart1.View3D := true;
    MostraMedia;
    // Series1.Visible := true;
    Series2.Visible := true;
    Series3.Visible := false;
    Series8.Visible := false;
    Series9.Visible := false;
    Series10.Visible := false;
    Series11.Visible := false;
  end;

end;

{ function T_frmTelaCompras.FiltraUltimasCompras(PnrProduto, PcdEmpresa: Integer;
  PdtCompra: Tdate): TDadosUltimasCompra;
  var
  dttemp: String;
  begin
  _cdsUltimasCompras.Filtered := false;
  if _cdsUltimasCompras <> nil then
  begin
  if PdtCompra > 0 then
  begin
  with _cdsUltimasCompras do
  begin
  filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' AND CD_EMPRESA=' +
  IntToStr(PcdEmpresa) + ' AND DT_COMPRA=' +
  QuotedStr(FormatDateTime('dd/mm/YYYY', PdtCompra));
  Filtered := true;
  First;
  end;
  Result.qtComprada := 0;
  if not _cdsUltimasCompras.IsEmpty then
  begin
  Result.qtComprada := _cdsUltimasCompras.FieldByName
  ('QT_COMPRA_ACUMULADA').AsInteger;
  Result.idStatusPedido := _cdsUltimasCompras.FieldByName
  ('ID_SITUACAO_COMPRA').AsString;
  Result.dtCompra := _cdsUltimasCompras.FieldByName('DT_COMPRA')
  .AsDateTime;

  if Result.idStatusPedido = 'F' then
  Result.Cor := clTeal;
  if Result.idStatusPedido = 'C' then
  Result.Cor := clRed;
  if Result.idStatusPedido = 'I' then
  Result.Cor := clRed;
  if Result.idStatusPedido = 'P' then
  Result.Cor := clYellow;
  if Result.idStatusPedido = 'N' then
  Result.Cor := clLime;
  end;
  end;
  end;
  end; }

function T_frmTelaCompras.FiltraUltimasPedido(PnrProduto, PcdEmpresa: Integer;
  PdtCompra: Tdate): TDadosUltimasCompra;
begin

end;

{ function T_frmTelaCompras.FiltraUltimoPedido(PnrProduto, PcdEmpresa: Integer;
  PdtCompra: Tdate): TDadosPedidoCompra;
  var
  dttemp: String;
  begin
  _cdsUltimasCompras.Filtered := false;
  if _cdsUltimasCompras <> nil then
  begin
  if PdtCompra > 0 then
  begin
  with _cdsPedidoNoFornecedor do
  begin
  filter := 'DT_COMPRA=' + QuotedStr(FormatDateTime('dd/mm/YYYY',
  PdtCompra)) + ' AND CD_EMPRESA=' + IntToStr(PcdEmpresa);
  Filtered := true;
  First;
  end;
  Result.idStatusPedido := '';
  if not _cdsPedidoNoFornecedor.IsEmpty then
  begin
  Result.idStatusPedido := _cdsUltimasCompras.FieldByName
  ('ID_SITUACAO_COMPRA').AsString;
  Result.dtCompra := _cdsUltimasCompras.FieldByName('DT_COMPRA')
  .AsDateTime;

  Result.Cor := clTeal;
  if Result.idStatusPedido = 'F' then
  Result.Cor := clTeal;
  if Result.idStatusPedido = 'C' then
  Result.Cor := clRed;
  if Result.idStatusPedido = 'I' then
  Result.Cor := clRed;
  if Result.idStatusPedido = 'P' then
  Result.Cor := clYellow;
  if Result.idStatusPedido = 'N' then
  Result.Cor := clLime;
  end;
  end;
  end;
  end;

}
function T_frmTelaCompras.FiltraUltimoPedido(PnrProduto, PcdEmpresa: Integer;
  PdtCompra: Tdate): TDadosPedidoCompra;
var
  dttemp: String;
begin
  _cdsUltimasCompras.Filtered := false;
  if _cdsUltimasCompras <> nil then
  begin
    if PdtCompra > 0 then
    begin
     if _cdsPedidoNoFornecedor<>nil then
     begin
      with _cdsPedidoNoFornecedor do
      begin
        Filtered := false;
        filter := 'DATP_P=' + QuotedStr(FormatDateTime('dd/mm/YYYY', PdtCompra))
          + ' AND cd_empresa_destino=' + IntToStr(PcdEmpresa);
        Filtered := true;
        First;
      end;
      Result.idStatusPedido := '';
      if not _cdsPedidoNoFornecedor.IsEmpty then
      begin
        Result.idStatusPedido := _cdsPedidoNoFornecedor.FieldByName
          ('SITY_Y').AsString;
        Result.dtCompra := _cdsPedidoNoFornecedor.FieldByName('DATP_P')
          .AsDateTime;

        Result.Cor := clTeal;
        if Result.idStatusPedido = 'F' then
          Result.Cor := clTeal;
        if Result.idStatusPedido = 'C' then
          Result.Cor := clRed;
        if Result.idStatusPedido = 'T' then
          Result.Cor := clTeal;
        if Result.idStatusPedido = 'K' then
          Result.Cor := clTeal;
        if Result.idStatusPedido = 'I' then
          Result.Cor := clRed;
        if Result.idStatusPedido = 'P' then
          Result.Cor := clYellow;
        if Result.idStatusPedido = 'N' then
          Result.Cor := clLime;
      end;
     end;
    end;
  end;
end;

procedure T_frmTelaCompras.SetDadosAgenda;
var
  dtAgenda: Tdate;
  nrDiferencaDias: Double;
  nrMenorDiaPedido, nrDiaSemana, vlAjuste: Integer;
  dsDiasPedido: String[10];
  vlTemp: Double;

begin
  dsDiasPedido := DadosFornecedor.dsDiasPedido;
  nrMenorDiaPedido := StrToIntDef(copy(MostraDiaPedido(dsDiasPedido), 1, 2), 0);
  dtAgenda := DadosFornecedor.dtAgenda;

  _dtpDataAgendada.Date := dtAgenda;
  _dtpDataPedido.Date := dtSistema;

   DadosFrequenciaCompra := GetFrequenciaEstoqueMaximo(DadosFornecedor.nrGrupoFornecedor);


//  if idAtualizaAgendaPedido then
  _dtpProximaAgenda.Date := DadosFornecedor.dtAgenda + DadosFrequenciaCompra.nrFrequenciaCompra;

//  if idAgendaAntecipada then
  //  dtAgenda := dtPedido;
{  if dtAgenda < dtPedido then
  begin
    nrDiferencaDias := dtPedido - dtAgenda;
    _dtpProximaAgenda.Date := dtAgenda + DadosFrequenciaCompra.nrFrequenciaCompra
                                       + nrDiferencaDias;
  end;}
  //_dtpProximaAgenda.Date := AJustaDataPedido(_dtpProximaAgenda.Date,
  //  nrMenorDiaPedido, DayOfWeek(_dtpProximaAgenda.Date));

//  _dtpDataUltimoPedidoMes.Date :=
  //  (AJustaDataPedido(dtAgenda + DadosFrequenciaCompra.nrFrequenciaCompra,
  //  nrMenorDiaPedido, nrDiaSemana));
  vlTemp := (_dtpProximaAgenda.Date - dtPedido) + nrLeadTime;
  //vlAjuste := StrToIntDef(FormatFloat('000',
  //  DadosFrequenciaCompra.nrFrequenciaCompra + nrLeadTime), 0);
  nrDiasAteProximaChegadaInicio := StrToIntDef(FormatFloat('000', vlTemp), vlAjuste);

end;

procedure T_frmTelaCompras.InicializaFornecedor;
begin
  NrFornecedor := StrToIntDef(_edtFornecedor.Text, 0);
  nrFornecedorPedido := NrFornecedor;
  if NrFornecedor > 0 then
  begin

    AbreDiasEstoque;


    InicializaDadosFornecedor(NrFornecedor);

    CarregaCSTProduto(NrFornecedor);



    nrMaiorValorUnidade := 0;
    nrMaiorValorReais := 0;
{    CarregaVendaSumarizada(0, 0);
    CarregaVendaSumarizada(0, 1);
    CarregaVendaSumarizada(0, 4);
    MostraDiasEstoque;
    // _cdsProduto.First;
    MontaGraficoGeral(Series4, 0, 0);
    MontaGraficoGeralValor(Series6, 0, 0);
    MontaGraficoGeral(Series5, 0, 1);
    MontaGraficoGeralValor(Series7, 0, 1);}
    _tbsSugestao.TabVisible := true;
    _stbCompras.Panels[1].Text := 'Dados Importados...';

    if GetLembreteFornecedor(NrFornecedor, dtSistema) then
    begin
      NrFornecedorObservacao := NrFornecedor;
      Application.CreateForm(T_frmObservacaoLaboratorio,    _frmObservacaoLaboratorio);
       _frmObservacaoLaboratorio.ShowModal;
      ShowWindow(_frmTelaCompras.Handle, SW_SHOWMAXIMIZED);
    end;

  end;

end;

function T_frmTelaCompras.FiltraUltimasCompras(PnrProduto, PcdEmpresa: Integer;
  PdtCompra: Tdate): TDadosUltimasCompra;
var
  dttemp: String;
begin
  _cdsUltimasCompras.Filtered := false;
  if _cdsPedidoNoFornecedor <> nil then
  begin
    if PdtCompra > 0 then
    begin
      with _cdsPedidoNoFornecedor do
      begin
        filter := 'NROM_Y=' + IntToStr(PnrProduto) + ' AND cd_empresa_destino=' +
          IntToStr(PcdEmpresa) + ' AND DATP_P=' +
          QuotedStr(FormatDateTime('dd/mm/YYYY', PdtCompra));
        Filtered := true;
        First;
      end;
      Result.qtComprada := 0;
      Result.idStatusPedido := '';
      if not _cdsPedidoNoFornecedor.IsEmpty then
      begin
        Result.qtComprada := _cdsPedidoNoFornecedor.FieldByName('QT_PEDIDO')
          .AsInteger;
        Result.idStatusPedido := _cdsPedidoNoFornecedor.FieldByName
          ('SITY_Y').AsString;
        Result.dtCompra := _cdsPedidoNoFornecedor.FieldByName('DATP_P')
          .AsDateTime;

        if Result.idStatusPedido = 'F' then
          Result.Cor := clTeal;
        if Result.idStatusPedido = 'C' then
          Result.Cor := clRed;
        if Result.idStatusPedido = 'I' then
          Result.Cor := clRed;
        if Result.idStatusPedido = 'P' then
          Result.Cor := clYellow;
        if Result.idStatusPedido = 'N' then
          Result.Cor := clLime;
      end;
    end;
  end;
end;

Function T_frmTelaCompras.FiltraPendenciaItem(PnrProduto, PcdEmpresa: Integer)
  : TClientDataSet;
begin
if  _cdsPendenciaItem <>nil then
begin
  with _cdsPendenciaItem do
  begin
    Filtered := false;
    //filter := 'NROM_Y=' + IntToStr(PnrProduto) + ' and CD_EMPRESA=' +
    filter := 'NROM_Y=' + IntToStr(PnrProduto) + ' and CD_DESTINO=' +
      IntToStr(PcdEmpresa);
    Filtered := true;
  end;
  Result := NIL;
  if NOT _cdsPendencia.IsEmpty then
    Result := _cdsPendenciaItem;
end;
end;

procedure T_frmTelaCompras.SetValorSugestaoPedido;
var
  cdEmpresa: Integer;
  vlEmpresa: Double;
  unEmpresa: Integer;
begin
  if _cdsPrePedido <> nil then
  begin
    _cdsPrePedido.First;
    while not _cdsPrePedido.eof do
    begin
      nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
      vlEmpresa := _cdsPrePedido.FieldByName('VT_SUGERIDO_BRUTO').AsFloat;
      unEmpresa := _cdsPrePedido.FieldByName('NR_UNIDADES_SUGERIDA').AsInteger;
      ValorSugestaoPedido[nrEmpresa] := vlEmpresa;
      UnidadesSugestaoPedido[nrEmpresa] := unEmpresa;
      _cdsPrePedido.Next;
    end;
  end;

end;

procedure T_frmTelaCompras.AvancaItem;
begin
  if _cdsPrePedido <> nil then
  begin
    _cdsPrePedido.Next;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
    TFloatField(_cdsPrePedido.FieldByName('DADY_Y')).DisplayFormat:='##0.00';
    TFloatField(_cdsPrePedido.FieldByName('PUNY_Y')).DisplayFormat :='###,###,##0.00';
    PmovimentoTabelaPedido;

  end;

end;

procedure T_frmTelaCompras.setCoresGraficoCurva(idCurva: String);
begin
  _lbeCurva.Font.Color := clBlack;
  _lbeCurva.Color := clBtnFace;
  _lbeCurva.Color := clBlack;
 // Chart1.Color := clBtnFace;
//  Chart1.Title.Font.Color := clBlack;
  Chart1.LeftAxis.LabelsFont.Color := clWhite;
  Chart1.BottomAxis.LabelsFont.Color := clBlack;
  if idCurva = 'A' then
  begin
    _lbeCurva.Font.Color := clBlack;
    _lbeCurva.Color := clInfoBk;
    Chart1.Color := clInfoBk;
    Chart1.Title.Font.Color := clBlack;
    Chart1.LeftAxis.LabelsFont.Color := clBlack;
    Chart1.BottomAxis.LabelsFont.Color := clBlack;
  end;
  if idCurva = 'B' then
  begin
    _lbeCurva.Font.Color := clBlack;
    _lbeCurva.Color := clSkyBlue;
    Chart1.Color := clSkyBlue;
    Chart1.Title.Font.Color := clBlack;
    Chart1.LeftAxis.LabelsFont.Color := clBlack;
    Chart1.BottomAxis.LabelsFont.Color := clBlack;
  end;
  if idCurva = 'C' then
  begin
    _lbeCurva.Font.Color := clWhite;
    _lbeCurva.Color := clMaroon;
    Chart1.Color := clMaroon;
    Chart1.Title.Font.Color := clWhite;
    Chart1.LeftAxis.LabelsFont.Color := clWhite;
    Chart1.BottomAxis.LabelsFont.Color := clWhite;
  end;
  if idCurva > 'C' then
  begin
    _lbeCurva.Font.Color := clWhite;
    _lbeCurva.Color := clRed;
    Chart1.Color := clRed;
    Chart1.Title.Font.Color := clWhite;
    Chart1.LeftAxis.LabelsFont.Color := clWhite;
    Chart1.BottomAxis.LabelsFont.Color := clWhite;
  end;

end;

procedure T_frmTelaCompras.FiltraVendaPorCanal(PnrProduto, PcdEmpresa: Integer;
  PdtPeriodo: String);
var
  stFiltro: String;

begin
 if PdtPeriodo='' then
    PdtPeriodo:=FormatDateTime('01/mm/yyyy',date);
 if _cdsVendaCanalOPerador<>nil then
 begin
  stFiltro := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' and CD_EMPRESA=' +
    IntToStr(PcdEmpresa) + ' AND DT_VENDA_MERCADORIA=' + QuotedStr(PdtPeriodo);
  with _cdsVendaCanalOPerador do
  begin
    Filtered := false;
    filter := stFiltro;
    Filtered := true;
  end;
 end;

end;


procedure T_frmTelaCompras.SetGridVendaCanal;
begin
  TIntegerField(_cdsVendaCanalOPerador.FieldByName('CD_MERCADORIA')).Visible := false;
  TIntegerField(_cdsVendaCanalOPerador.FieldByName('CD_EMPRESA')).Visible := false;

  TIntegerField(_cdsVendaCanalOPerador.FieldByName('VENDA_CANAL')).DisplayLabel:= 'Qtd.Venda';
  TIntegerField(_cdsVendaCanalOPerador.FieldByName('VENDA_CANAL')).DisplayWidth:= 06;
  TIntegerField(_cdsVendaCanalOPerador.FieldByName('VENDA_CANAL')).DisplayFormat:= '###,##0';

  TIntegerField(_cdsVendaCanalOPerador.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayLabel := 'Oper.Log.';
  TIntegerField(_cdsVendaCanalOPerador.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayWidth := 06;

//  TStringField(_cdsVendaCanalOPerador.FieldByName('DS_FARMA')).DisplayLabel := 'Des.Canal';
 // TStringField(_cdsVendaCanalOPerador.FieldByName('DS_FARMA')).DisplayWidth := 10;


  TIntegerField(_cdsVendaCanalOPerador.FieldByName('CD_CANAL')).DisplayLabel:= 'Canal';
  TIntegerField(_cdsVendaCanalOPerador.FieldByName('CD_CANAL')).DisplayWidth := 03;

  TDateField(_cdsVendaCanalOPerador.FieldByName('DT_VENDA_MERCADORIA')).DisplayLabel := 'Periodo';
  TDateField(_cdsVendaCanalOPerador.FieldByName('DT_VENDA_MERCADORIA')).DisplayWidth := 10;
  TDateField(_cdsVendaCanalOPerador.FieldByName('DT_VENDA_MERCADORIA')).DisplayFormat := 'dd/mm/yyyy';
end;


function T_frmTelaCompras.SetStatusPedidoGerado(PidStatus:String):Boolean;
begin
   _cdsEmpresaPedido.Open;
   _cdsEmpresaPedido.Edit;
   _cdsEmpresaPedido.FieldByName('ID_PEDIDO_GERADO').AsString:=PidStatus;
   _cdsEmpresaPedido.post;

end;

procedure T_frmTelaCompras.EliminaCondicaoPagamento;
begin
     if _cdsCondicaoPagamento.RecordCount>1 then
   begin
     if Confirma('Eliminar Prazo de Pagamento ?',MB_DEFBUTTON2)=idYes then
        _cdsCondicaoPagamento.Delete;
   end;

end;


function T_frmTelaCompras.LiberaCompraItem(PdtInativacaoFutura,
                                           PdtBloqueioCompra:Tdate;
                                           PidMostraMensagem,
                                           PidLiberaCompra,
                                           PidVendaAutorizada:Boolean):Boolean;
var
 dtTesteBloqueio,
 dtTesteSistema:Tdate;
begin
    Result:=true;

    dtTesteSistema:=dtSistema;
    dtTesteBloqueio:=PdtBloqueioCompra;

   if FormatDateTime('dd/mm/yyyy',PdtInativacaoFutura)<>'01/01/2039' then
   begin
    if PidMostraMensagem then
      Mensagem('Produto Marcado para Ser Inativado...'+#13+
               'N?o pode ser comprado!!',MB_ICONWARNING);
     Result:=false;
     exit;
   end;
  if ((PdtBloqueioCompra)<> strtodate('01/01/2039'))and
     ((dtTesteBloqueio)>=dtSistema)
      then
   begin
     if PidMostraMensagem then
      Mensagem('Produto Bloqueado Para Compra...'+#13+
               'N?o pode ser comprado!!',MB_ICONWARNING);
     Result:=PidLiberaCompra;
   end;
  if not PIdVendaAutorizada then
   begin
     if PidMostraMensagem then
      Mensagem('Produto Com a Venda N?o Autorizada...'+#13+
               'N?o pode ser comprado!!',MB_ICONWARNING);
     Result:=PIdVendaAutorizada;
   end;


end;


function T_frmTelaCompras.FiltroPedidoNaoFechados:String;
var
 i:Integer;
begin
    Result:=EmptyStr;
    for I := 0 to High(PedidoEmpresa) do
    if PedidoEmpresa[I] > 0 then
       if Result='' then
          Result := IntToStr(PedidoEmpresa[i])
       else
          Result := Result +','+ IntToStr(PedidoEmpresa[i]);

   stPedidos:=Result;
end;


procedure T_frmTelaCompras.IncioPedido;
begin
  try
    _edtNrVerbaInicio.Text := _edtNrVerbaDesconto.Text;
    InicializaFornecedor;
    _btnGeraPedido.Enabled := true;
    _btnGeraPedidoExcecao.Enabled := true;

  except

  end;

end;


procedure T_frmTelaCompras.EncerraPedido(PidConfirma:Boolean);
VAR
  I, cdPrazoPagamento: Integer;
begin

//  SetEmpresaPedidoInico(_cdsEmpresaPedido);
  if _cdsPrePedido.IsEmpty then
  begin
    dec(nrJanelasPedido);
    close;
    exit;
  end;

   cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);
   for I := 0 to High(PedidoEmpresa) do
   begin
      if PedidoEmpresa[I] > 0 then
      begin
        EliminaItemQuantidadeZerada(PedidoEmpresa[I]);
        ZeraItemAuditoria(PedidoEmpresa[I]);
        DadosLeadTime := SetLeadTime(I, 'N');
        nrLeadTime := DadosLeadTime.vlLeadTime;

        AtualizaCapaPedido(PedidoEmpresa[I], cdPrazoPagamento,
          cdoperadorLogisticoPedido, nrLeadTime, 'I', 'Ped.nao confirmado',
          false, dtPedido, dtPedido,
          dtPedido + DadosFornecedor.nrGrupoFornecedor,NrDiasEstoqueComprador,nrVerbaInicio,_chkBonificaPedido.Checked,0);
        AtualizaStatusItemPedido(PedidoEmpresa[I], 0,
          cdoperadorLogisticoPedido, 'I');
      end;
    end;
    dec(nrJanelasPedido);
    ZeraNumeroPedido;
    close;
  end;

Function T_frmTelaCompras.LocalizaDescontoOPerador(PnrProduto,
  PnrCD: Integer): double;
begin
  result := 0;
  if _cdsProdutoOL.Locate('CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrProduto, PnrCD]), []) then
    result := _cdsProdutoOL.FieldByName('PC_DESC_COMPRA').AsFloat;
END;


procedure T_frmTelaCompras.ExecutaPreco(PnrEmpresa:Integer);
begin

  precoLista := GetPrecoItem(nrProduto,
                             PnrEmpresa,
                             vlPrecoLista,
                             1,
                             idprecoAtual,
                             idBloqueiaPedido,
                             nrListaPrecoExcecao); { ,nrListaPreco };
  vlPrecoLista := precoLista.vlPrecoBase;

  if (nrListaPrecoExcecao > 0) then
  begin
    pcDescontoAdicional := precoLista.PcDescontoLista;
    if (cdoperadorLogisticoPedido = 1) then
         nrVerba := precoLista.nrVerba;
  end;

  if (_chkUltimoDesconto.Checked) or (_chkUsarUltimoDesconto.Checked) then
  begin
    pcDescontoAdicional := getUltimoDesconto(_cdsProduto.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger, nrProduto,
                                             PnrEmpresa, cdoperadorLogisticoPedido);
  end;

  PrecoItem := CalculaPrecoLiquido( vlPrecoLista,
                                   Mercadoria.vlPrecoVenda,
                                   Mercadoria.pcRepasseCompra,
                                   Mercadoria.pcDescontoPadrao,
                                   pcDescontoAdicional,
                                   Mercadoria.pcCreditoICMS,
                                   Mercadoria.pcIpiProduto,
                                   precoLista.PcIPILista,
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


end;


Procedure T_frmTelaCompras.CarregaParcelamentoPedido(PnrCondicaoPagamento:Integer);
var
  I: Integer;
begin


  ParcelamentoPedido:=nrParcelaPedido(PnrCondicaoPagamento);

   for I := 1 to ParcelamentoPedido.nrCondicaoPagamento do
        PrazoPedido(ParcelamentoPedido.nrDiasPrazo[I]);

    if _cdsCondicaoPagamento <> nil then
    begin
      _cdsCondicaoPagamento.open;
      _dsCondicaoPagamento.DataSet := _cdsCondicaoPagamento;
      _cdsCondicaoPagamento.recordCount;
    end;


end;


Procedure T_frmTelaCompras.GerarExcelPedidoLocal(PnrPedido:Integer;PidPrecoCusto,PidPercentualDesconto:Char);
var
  coluna, linha,nrLinaInicial: integer;
  excel: variant;
  valor: String ;
  data,dsCondicaoPagamento  :String;
  tipo : TFieldType;
  vlDefault :Variant;
  DadosCd :TDadosCD;
  _cdsTemp :TClientDataSet;
  DadosValoresPedido:TDadosValoresPedido;
  DadosFornecedor:TDadosFornecedor;
  vlItem,pcDescontoItem :Double;
  dsNmPlanilha,nmFornecedor:String;
   HDROP : THandle;

begin
  try
     try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
     except
          Application.MessageBox ('Vers?o do Ms-Excel'+
          'Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
     nrLinaInicial:=4;
     DadosValoresPedido:=GetValoresPedido(PnrPedido,false);
     DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);
     DadosCD:=GetDadosCD(DadosValoresPedido.cdEmpresa);


     if DadosFornecedor<>NIL then
     begin

//     getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
     dsCondicaoPagamento:=getPrazoPedido(PnrPedido,0);

     //_cdsPedido.First;
     try
        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        //Formatando c?lulas escritas
        excel.range['A1','A1'].Font.Bold      := true;
        excel.cells[02,01]:='Pedido de Compra :'+inttostr(DadosValoresPedido.nrPedido);
        excel.cells[03,01]:='Data Pedido      :'+FormatDateTime('DD/MM/YYYY',DadosValoresPedido.dtPedido);
        excel.cells[04,01]:='Cond. Pagamento  :'+ dsCondicaoPagamento;

       excel.Workbooks[1].WorkSheets[1].Name := 'Pedido - '+inttostr(DadosValoresPedido.nrPedido);;
       excel.Workbooks[1].WorkSheets['Pedido - '+inttostr(DadosValoresPedido.nrPedido)];


        excel.cells[06,01]:='Observa??es';
        excel.cells[07,01]:=' Informar Nr. do Nosso Pedido '+inttostr(DadosValoresPedido.nrPedido) +' na Nota Fiscal/Danfe em Dados Adicionais';
        excel.cells[08,01]:=' E no XML informar no campo correspondente (Tag compra x Ped)';
        if DadosValoresPedido.stObservacaoPedido<>'' then
        begin
          excel.cells[10,01]:='Importante.:'+DadosValoresPedido.stObservacaoPedido;
         excel.range['A10','A10'].Font.Bold      := true;
        end;
        // alterado para o nome da divisao conforme SS.: 11563 (em 28/09/2015 (Vete))
        //dsNmPlanilha:='Pedido_'+trim(DadosFornecedor.dsNomeFantasia)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';
        nmFornecedor:=TrocaCaracterEspecial(DadosFornecedor.dsGrupoFornecedor,true);
        if _chkBonificaPedido.Checked then
         dsNmPlanilha:='Pedido_BONIFICADO_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls'
        else
        dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';
     //    excel.Name:=dsNmPlanilha;

        if AnsiContainsStr(DadosValoresPedido.stObservacaoPedido,'Psicotr?picos') then
            if _chkBonificaPedido.Checked then
                dsNmPlanilha:='Pedido_BONIFICADO_'+trim(nmFornecedor)+'_'+inttostr(DadosValoresPedido.nrPedido) +'_Psicotropicos'+'_'+DadosCd.stEstado+'.xls'
           else
              dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+inttostr(DadosValoresPedido.nrPedido) +'_Psicotropicos'+'_'+DadosCd.stEstado+'.xls';




                    (* ==== Formata??o Cor da linha contorno ==== *)
{
         ColorIndex := 1 - Preto
         ColorIndex := 2 - Branco
         ColorIndex := 3 - Vermelho
         ColorIndex := 4 - Verde Claro
         ColorIndex := 5 - Azul
         ColorIndex := 6 - Amarelo
         ...
         ColorIndex := 56 - Cinza Escuro
}



        excel.cells[12,01]:='CNPJ para Faturamento:'+ DadosCd.nrCNPJ;
        excel.cells[13,01]:='Endere?o de Entrega';
        //Formatando c?lulas escritas
         excel.range['A13','A13'].Font.Bold      := true;

        excel.cells[14,01]:=TrimRight(DadosCd.stENDERECO)+', N?.: '+DadosCd.nrLogradouro;
        excel.cells[15,01]:='Bairro.: '+DadosCd.stBAIRRO;
        excel.cells[16,01]:='Cidade.: '+TrimRight(DadosCd.stCIDADE)+'    UF.:'+DadosCd.stEstado;
        excel.range['A16','A16'].Font.Bold      := true;
        excel.range['A16','A16'].Font.ColorIndex := 3;//Cor da linha: vermelhaPreto

        excel.cells[17,01]:='CEP.:'+DadosCd.stCEP;


        excel.cells[18,01]:='Cod. GAM';
        excel.cells[18,02]:='Cod.Fornec.';
        excel.cells[18,03]:='Cod.EAN';

        excel.cells[18,04]:='Qtdade';
        excel.cells[18,05]:='Nome e Apresenta??o';
        excel.cells[18,06]:='P?o. Unit.';
        excel.cells[18,07]:='% Desconto';
        excel.cells[18,08]:='Total Unit.';




         //Formatando c?lulas escritas

         excel.range['A18','G18'].Font.Bold      := true;

        linha:=18;
        coluna:=1;

         _cdstemp:=GeraTabelaItensPedidos(PnrPedido);
         _cdstemp.IndexFieldNames:='NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA';
        _cdstemp.First;
         while not _cdsTemp.Eof do
         begin
             if PidPrecoCusto='S' then
              vlItem:=_cdsTemp.FieldByName('PUNY_Y').AsFloat
           else
              vlItem:=_cdsTemp.FieldByName('PFBY_Y').AsFloat;

           if PidPercentualDesconto='S' then
               pcDescontoItem:=_cdsTemp.FieldByName('ABTY_Y').AsFloat+
                               _cdsTemp.FieldByName('DADY_Y').AsFloat
           else
               pcDescontoItem:=0;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=_cdsTemp.FieldByName('CD_PRODUTO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=_cdsTemp.FieldByName('CD_INTERNO_LABORATORIO').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=_cdsTemp.FieldByName('CD_EAN_COMPRA').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03].NumberFormat:='#############0_);(#############0)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=_cdsTemp.FieldByName('QUAY_Y').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04].NumberFormat:='#.##0_);( #.##0,00)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=_cdsTemp.FieldByName('NM_MERCADORIA').AsString+' '+
                                                           _cdsTemp.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString ;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=vlItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06].NumberFormat:='#.##0,00_);( #.##0,00)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=pcDescontoItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07].NumberFormat:='#.##0,00_);( #.##0,00 %)';


           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=_cdsTemp.FieldByName('QUAY_Y').AsInteger*vlItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08].NumberFormat:='#.##0,00_);( #.##0,00 )';
           // Borda da lina
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 2;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;


           inc(linha);
           Inc(coluna);
           _cdsTemp.Next;
         end;
       // end;                                                          _cdsPedido.AsVariant
            // Define o tamanho das Colunas (basta fazer em uma delas e as demais ser?o alteradas)


         excel.range['A19'].ColumnWidth := 10;  // Cod. GAM
         excel.range['B19'].ColumnWidth := 20;  //Cod.Fornec.';
         excel.range['C19'].ColumnWidth := 14; //Cod.EAN';
         excel.range['D19'].ColumnWidth := 10; // excel.cells[18,04]:='Qtdade';
         excel.range['E19'].ColumnWidth := 35; //Nome e Apresenta??o';
         excel.range['F19'].ColumnWidth := 14;// 'P?o. Unit.';
         excel.range['G19'].ColumnWidth := 14; //'% Desconto';
         excel.range['H19'].ColumnWidth := 14; //'Total Unit.';



         excel.range['A18','H18'].Borders.LineStyle := 1;
         excel.range['A18','H18'].Borders.Weight := 2;
         excel.range['A18','H18'].Borders.ColorIndex := 1;
         excel.Cells[linha+1,1].formula := 'Nr. de Unidades';
         excel.Cells[linha+1,5].formula := 'Total do Pedido (R$) ';
         //Mesclando C?lulas
         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
         excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].MergeCells := true;

         {alinhamento horizontal no centro}
         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].HorizontalAlignment := 3;
         excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].HorizontalAlignment := 3;


         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
         excel.Cells[linha+1,4].formulaLocal := '=Soma(D19:D'+inttostr(linha)+')';
         excel.Cells[linha+1,8].formulalocal := '=Soma(H19:H'+inttostr(linha)+')';
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 3;
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;

         //Formatando c?lulas escritas

         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Font.Bold      := true;
         if not FileExists(dsLocalPanilha+'\'+dsNmPlanilha) then
          excel.ActiveWorkBook.Saveas(dsLocalPanilha+'\'+dsNmPlanilha,56);


      //  excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     _cdsTemp.EnableControls;
     end;
  finally
        excel.quit;
     //   FreeAndNil(excel);
  end;
//   dsLocalPanilha+'\'+dsNmPlanilha
  ShellExecute(Handle, 'Open', pchar(dsNmPlanilha), nil, pchar(dsLocalPanilha+'\'), SW_SHOWNORMAL);

     //excel.quit;
end;






Function T_frmTelaCompras.CarregaCSTProduto(PnrFornecedor:Integer):Boolean;
var
  stQry: TStringList;
  stPedidoAtivos:String;

begin
  try
    try
      stQry := TStringList.Create;
      with stQry do
      begin
          Add('SELECT CM.CD_MERCADORIA,CD_GRUPO_FORNECEDOR,');
          Add('CD_COMPRADOR,CM.CD_EMPRESA,CD_CST_ENTRADA');
          Add('FROM');
          Add('PRDDM.DC_COMPRA_MERCADORIA cm,');
          Add('PRDDM.DC_FISCAL_MERCADORIA fm ');
          Add('WHERE');
          Add('cd_empresa_crossdocking>0 AND CM.ID_SITUACAO_MERCADORIA=''A''');
          Add('and CM.CD_MERCADORIA=FM.CD_MERCADORIA');
          Add('and CM.CD_EMPRESA=FM.CD_EMPRESA');
          Add('and CM.CD_GRUPO_FORNECEDOR=:PcdFornecedor');
          Add('and CD_CST_ENTRADA in(1,2,3,8)');
    end;
    stQry.SaveToFile('c:\temp\qryEmpresaPedido.sql');
    with _cdsForcaPedidoLocal do
    begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PcdFornecedor').AsBCD:=PnrFornecedor;
        open;
      end;

    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;

end;


Function T_frmTelaCompras.CarregaUltimoPre?oEntrada(PnrFornecedor:Integer):Boolean;
var
  stQry: TStringList;
  stPedidoAtivos:String;

begin
  try
    try
      stQry := TStringList.Create;
      with stQry do
      begin
              Add('SELECT CM.CD_EMPRESA,CM.CD_MERCADORIA,VL_FATURAMENTO_TOTAL_COMPRA,CD_COMPRADOR, PC_ALIQUOTA_ICMS ,VL_CUSTO_COMPRA,VT_VERBA');
          Add('FROM');
          Add('PRDDM.DC_ULTIMA_COMPRA_MERCADORIA UC,');
          Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
          Add('PRDDM.DC_MERCADORIA M,');
          Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL');
          Add('WHERE');
          Add('CM.CD_MERCADORIA=UC.NR_MERCADORIA');
          Add('AND CM.CD_MERCADORIA=M.CD_MERCADORIA');
          Add('AND CM.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
          Add('AND CM.CD_EMPRESA=UC.ID_EMPRESA');
          Add('AND CM.CD_EMPRESA=FISCAL.CD_EMPRESA');
          Add('AND CM.ID_SITUACAO_MERCADORIA=''A''');
          Add('AND M.ID_SITUACAO_MERCADORIA=''A''');
          Add('AND FISCAL.ID_SITUACAO_MERCADORIA=''A''');
          Add('AND ID_VENDA_AUTORIZADA=''S''');
          Add('AND  CD_GRUPO_FORNECEDOR=:PcdFornecedor') ;

    end;
    stQry.SaveToFile('c:\temp\Compras_qryUltimaPrecoEntrada.sql');
    with _cdsUltimoPrecoEntrada do
    begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PcdFornecedor').AsBCD:=PnrFornecedor;
        open;
      end;

    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;

end;




function T_frmTelaCompras.SetPedidoLocalCrossdocking(PnrProduto,PnrEmpresa:Integer):Boolean;
begin

  if _cdsForcaPedidolocal.active then
  begin
   result:=false;
   if _cdsForcaPedidolocal.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([PnrProduto, PnrEmpresa]), []) then
      result:=true;
  end;





end;


procedure T_frmTelaCompras.setDataInativacaoFuturaBloqueioProduto;
var
 nrProdutoLocal,
 nrCdLocal :Integer;
 dtInativacao,
 dtBloqueio :tdate;
  idPosicao:TBookmark;
begin
   _cdsInativaBloqueio.First;
   idPosicao:=_cdsProduto.Bookmark;
   while not _cdsInativaBloqueio.Eof do
   begin
    nrProdutoLocal:=_cdsInativaBloqueio.FieldByName('CD_MERCADORIA').AsInteger;
    nrCdLocal     :=_cdsInativaBloqueio.FieldByName('CD_EMPRESA').AsInteger;
    dtInativacao := _cdsInativaBloqueio.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime;
    dtBloqueio   :=_cdsInativaBloqueio.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime;
    idCalculaMedia:=false;
    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA', VarArrayOf([nrProdutoLocal, nrCdLocal]), []) then
    begin
      _cdsProduto.Edit ;
      _cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime :=dtInativacao;
      _cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime   :=dtBloqueio;
      _cdsProduto.post;
    end;


      _cdsInativaBloqueio.Next;
   end;

   _cdsProduto.Bookmark:=idPosicao;
   idCalculaMedia:=true;
   _cdsProduto.Next;
   _cdsProduto.Prior;


end;


function T_frmTelaCompras.ValidaVerba(PnrVerba:Integer):Integer;
begin


 nrVerbaInicio:=  GetVerbaFornecedor(PnrVerba, nrFornecedorLocal);
 if (PnrVerba > 0) and (nrVerbaInicio=0) then
  begin

       _edtNrVerbaInicio.Clear;
       _edtNrVerbaInicio.SetFocus;

       _edtNrVerbaDesconto.Clear;
       _edtNrVerbaDesconto.SetFocus;


       nrVerbaInicio:=0;
       exit;

   end;
   Result:=nrVerbaInicio;
end;


procedure T_frmTelaCompras.SetItemPedido;
var
nrReg, I:integer;
begin
   _cdsPrePedido.First;
   if not _chkTodosProduto.Checked then
          FiltraPrepedido;
    nrreg:=0;
   _cdsPrePedido.First;
   _cdsPrePedido.RecordCount;
   while Not _cdsPrePedido.Eof do
   begin

      inc(nrReg);
       nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
       nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
       NrPedido  := _cdsPrePedido.FieldByName('NROP_Y').AsInteger;
       qtdPedido :=_cdsPrePedido.FieldByName('QUAY_Y').AsInteger;
         GetDadosProduto;



       if (qtdPedido>0) or (_chkTodosProduto.Checked) then
         if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA', VarArrayOf([nrProduto, nrEmpresa]), []) then
            SetDadosProduto(nrEmpresa);

     _stbCompras.Panels[1].Text := FormatFloat('000000',_cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger) + ' - ' +
                                                _cdsPrePedido.FieldByName('NM_MERCADORIA').AsString;

      Application.ProcessMessages;

       _stbCompras.Panels[2].Text := FormatFloat('000000', _cdsPrePedido.recordCount)+ '--> ' + FormatFloat('000000', _cdsPrePedido.recordCount - nrReg);
    _stbCompras.Refresh;

     _cdsPrePedido.Next;
   end;
   _cdsPrePedido.Filtered:=false;

   for I := 0 to High(PedidoEmpresa) do
    if PedidoEmpresa[I] > 0 then
    begin
       NrPedido:=PedidoEmpresa[I];
       GravaLogPedidoCompraNova(nrPedido,nmLogin);
    end;


end;

procedure T_frmTelaCompras.FiltraPrepedido;
begin
  _cdsPrePedido.Filtered:=false;
  _cdsPrePedido.Filter:='QUAY_Y>0';
  _cdsPrePedido.Filtered:=true;

end;

procedure T_frmTelaCompras.SetDadosProduto(PnrEmpresa:Integer);
var
  idTermoLabil : String;
  nmProduto: String[100];
  stAlertaRestricao: String;
  idSetPedidoCrossdocking:boolean;
  qtInicial:Integer;





begin


  nrProduto := _cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
  nrEmpresa := _cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

  Mercadoria := DadosProdutos(nrProduto, nrEmpresa, cdoperadorLogisticoPedido);

  nrQtdEstoque := Mercadoria.qtEstoque;
  idTermoLabil := _cdsProduto.FieldByName('ID_REFRIGERADO').AsString;
  idCurva      := _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString[1];
  NrEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;

  idCrossDocking    :='N';
  if _cdsProduto.FieldByName('CD_EMPRESA_CROSSDOCKING').AsInteger>0 then
      idCrossDocking    :='S';

  idCrossDocking    :=_cdsPrePedido.FieldByName('OCD').AsString;

  nrQtdCaixa     := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
  nrQtdCxCamada  := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  nrQtdCxPalete  := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
  nrQtdUndCamada := nrQtdCxCamada * NrEmbalagemCompra;
  nrQtdUndPalete := nrQtdCxPalete * NrEmbalagemCompra;
  nrGeracaoVerba := _cdsProduto.FieldByName('NR_VERBA_GERACAO').AsInteger;
  pcGeracaoVerba := _cdsProduto.FieldByName('PC_VERBA_GERACAO').AsFloat;

  nrQtdVencido   := _cdsProduto.FieldByName('QT_VENCIDO').AsInteger;
  nrQtdAvariada  := _cdsProduto.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger;
  nrQtdReservada := _cdsProduto.FieldByName('QT_RESERVADO').AsInteger;
  pcDescontoRepasse := 0;

  nmProduto := _cdsProduto.FieldByName('NM_MERCADORIA').AsString + '  ' +
               _cdsProduto.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString;

  dtInativacaoFutura:= _cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime;
  dtBloqueiodeCompra:= _cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime;
  IdVendaAutorizada := true;
  if _cdsProduto.FieldByName('ID_VENDA_AUTORIZADA').AsString='N' then
     IdVendaAutorizada :=false;

  vlPrecoLista     := _cdsProduto.FieldByName('VL_PRECO_COMPRA').AsFloat;
  pcDescontoPadrao := _cdsProduto.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;

  nrEmpresaOCD     :=nrEmpresa;
  nrSomaLeadTimeOCD:=0;


  idSetPedidoCrossdocking:=idForcaPedidoLocal;

  if (not idSetPedidoCrossdocking) and (idCrossDocking='S') then
     idSetPedidoCrossdocking:=SetPedidoLocalCrossdocking(nrProduto,nrEmpresa);




  nrEmpresaOCD:=nrEmpresa;
  nrSomaLeadTimeOCD:=0;
  if (_cdsPrePedido.FieldByName('OCD').Asstring='S') AND (_chkCrossDocking.Checked) and (not idSetPedidoCrossdocking)  then
  begin
      nrEmpresaOCD     := _cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').AsInteger ;
      nrSomaLeadTimeOCD:= 5;

  end;

  precoLista := GetPrecoItem(nrProduto,
                             nrEmpresaOCD,
                             vlPrecoLista,
                             1,
                             idprecoAtual,
                             idBloqueiaPedido,
                             nrListaPrecoExcecao); { ,nrListaPreco };
  vlPrecoLista := precoLista.vlPrecoBase;

  if (nrListaPrecoExcecao > 0) then
  begin
    pcDescontoAdicional := precoLista.PcDescontoLista;
    if (cdoperadorLogisticoPedido = 1) then
         nrVerba := precoLista.nrVerba;
  end;


 if (nrListaPrecoExcecao > 0) then
  begin
    pcDescontoAdicional := precoLista.PcDescontoLista;
    if (cdoperadorLogisticoPedido = 1) then
         nrVerba := precoLista.nrVerba;
  end;


  DadosLeadTime := SetLeadTime(nrEmpresa,idTermoLabil);
  nrLeadTime    := DadosLeadTime.vlLeadTime+nrSomaLeadTimeOCD;


  DadosEstoqueCompra := setParamentroItemCurvaCompra(nrEmpresa,
                                                     NrDiasEstoque, // PnrDiasEstoque: Integer;
                                                     idCurva[1]); // : Char):TDadosEstoqueCurva;


  NrDiasEstoquePedido     := DadosEstoqueCompra.nrEstoqueMaximo;
  NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);

   nrQtdadeSusgetaoPossivel := qtdPedido;
   DadosMedia := CalculaMedia(nrEmpresaOCD);

   DadosMedia.vlMediaDiaNova:=_cdsPrePedido.FieldByName('VL_MEDIA_VENDA').AsFloat;
   //Esse Valor  gerencial esta sendo Usado para Armazenar QT_DESVIOPADRAO_VENDA_DIARIA
   //DadosMedia.vlDesvioPadrao:=_cdsPrePedido.FieldByName('VL_CUSTO_GERENCIAL').AsFloat;

   DadosPendencia := setPendenciaCD(nrProduto, nrEmpresaOCD);


  qtInicial:=qtdPedido;
  if (NrDiasEstoqueComprador > 0) or (qtInicial=0)  then
  begin
    FiltraVendaMesAtual(nrProduto, nrEmpresaOCD, 0,18);

    NrDiasEstoquePedido := NrDiasEstoqueComprador;

    if (qtInicial>0) and (_chkUsarUltimoDesconto.Checked) then
       qtdPedido:= qtInicial
    else
      qtdPedido:=SugetaoParaPeloDiasCompra;
  end;


   if cdoperadorLogisticoPedido>1 then
      pcDescontoPadrao := LocalizaDescontoOPerador(nrProduto,nrEmpresa);




  if (_chkUltimoDesconto.Checked) or (_chkUsarUltimoDesconto.Checked)  then
  begin
    pcDescontoAdicional := getUltimoDesconto(nrFornecedor, nrProduto,
                                             nrEmpresa, cdoperadorLogisticoPedido);
    if (pcDescontoAdicional > 0) and (nrVerba = 0)  then
        nrVerba := StrToIntDef(_edtNrVerbaDesconto.Text, 0);
    if (pcDescontoAdicional > 0) and (nrVerba > 0) then
       pcVerba:=100;



  end;

  PrecoItem := CalculaPrecoLiquido( vlPrecoLista,
                                   Mercadoria.vlPrecoVenda,
                                   Mercadoria.pcRepasseCompra,
                                   Mercadoria.pcDescontoPadrao,
                                   pcDescontoAdicional,
                                   Mercadoria.pcCreditoICMS,
                                   Mercadoria.pcIpiProduto,
                                   precoLista.PcIPILista,
                                   precoLista.pcReajustePreco,
                                   1,

                                   precoLista.nrListaPreco,
                                   'N', Mercadoria.idForcaRepasse,
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

        {GravaEventoLogPedidoCompra(0,
                                  nrPedido,
                                  dtSistema,
                                  0,
                                  0,
                                  23,
                                  'Item Inserido... usuario - '+nmLogin+' Produto = '+IntToStr(nrProduto)+' Qtdade='+FormatFloat('0000000',qtdPedido),
                                  dtSistema,
                                  copy(nmLogin,1,20),
                                  nrEmpresaOCD);}


    nrDiasEstoqueComPedido :=CalculaNrDiasEstoque(qtdPedido,
                                                  nrQtdEstoque,
                                                  DadosPendencia.qtPendente,
                                                   0,
                                                  DadosMedia.vlMediaDiaNova );

  if ((_chkTodosProduto.Checked) and  (qtInicial=0))  or (qtdPedido>0)then
  begin
        NrPedido:=PedidoEmpresa[PnrEmpresa];
        GravaItemPedido(NrPedido, nrProduto, nrEmpresaOCD, qtdPedido,pcDescontoAdicional,true);
  end

  else


  AtualizaItemPedidoInicio(nrPedido,
                     nrProduto,
                     qtdPedido,
                     0,
                     DadosFornecedor.nrPrazoPedido,
                     nrVerba,
                     nrEmpresaOCD,
                     1,
                     nrDiasEstoqueComPedido,
                     nrQtdadeSusgetaoPossivel,
                     'S',
                     'N',
                     'N',
                      pcDescontoPadrao,
                      pcDescontoAdicional,
                      0,
                      pcVerba,
                      0,
                      0,
                      PrecoItem.vlPrecolIquido,
                      PrecoItem.vlPrecoLista,
                      PrecoItem.vlPrecoCusto,
                      0,
                      0,
                      PrecoItem.vlVerba,
                      DadosMedia.vlMediaDia,
                      ' Tela Pedido',
                      nrEmpresaOCD,
                      precoLista.PcIcmsCompra,
                      precoLista.nrListaPreco,
                      idAtualizaDesconto,
                      nrCompradorPedido,
                      precoLista.pcIcmsVenda);







end;



procedure T_frmTelaCompras.FiltraItensSugestao;
begin

   _cdsPrePedido.Filtered:=false;
  if _chkItensSemSugestao.Checked then
  begin
    _cdsPrePedido.Filter:='QT_SUGERIDA=0 and QT_ESTOQUE>0';
    _cdsPrePedido.Filtered:=TRUE;
  end;
  if _chkItensComSugestao.Checked then
  begin
    _cdsPrePedido.Filter:='QT_SUGERIDA>0';
    _cdsPrePedido.Filtered:=TRUE;
  end;
  if _chkItensSemSugestaoSemEstoque.Checked then
  begin
    _cdsPrePedido.Filter:='QT_SUGERIDA=0 and QT_ESTOQUE=0 and QT_PENDENCIA=0';
    _cdsPrePedido.Filtered:=TRUE;
  end;

  if _chkItensCurvaA_B.Checked then
  begin
    _cdsPrePedido.Filter:='ID_CURVA_MERCADORIA=''A'' or ID_CURVA_MERCADORIA=''B''';
    _cdsPrePedido.Filtered:=TRUE;
  end;
  _cdsPrePedido.First;
  nrProduto:=_cdsPrePedido.FieldByName('cd_mercadoria').AsInteger;
  nrEmpresa:=_cdsPrePedido.FieldByName('cd_empresa').AsInteger;

  GetDadosProduto;

  PosicionaItemPedido(nrProduto, nrEmpresa);
  PmovimentoTabelaPedido;



end;




function T_frmTelaCompras.SugetaoParaPeloDiasCompra:Integer;
var
  DadosSugestaoCamadaPalete: TDadosSugestaoCamadaPalete;

begin


  nrQtdadeSusgetaoPossivel :=qtdPedido;

  DadosSugestao := CalculoSugestaoIdealNova(nrEmpresa, // PnrEmpresa:Integer;
                                            DadosEstoqueCompra.nrFrequenciaCompra, // PvlPE,
                                            0, // PnrDiasAjuste,
                                            nrLeadTime, // DadosFornecedor.nrDiasLeadTime,//     PLeadTimeCalculo,
                                            DadosMedia.vlMediaDiaNova, // PvlMediaDiaria: Double;
                                            nrQtdEstoque, // PnrQuantidadeEstoque,
                                            DadosPendencia.qtPendente, // PnrQuantidadaPendente,
                                            DadosEstoqueCompra.nrEstoqueMInimo, // PQtdEstoqueMinimo,
                                            NrDiasEstoquePedido, // PQtdEstoqueMaximo,
                                            cdoperadorLogisticoPedido, // PcdOPeradorLogistico:Integer;
                                            DadosEstoqueCompra.nrFrequenciaCompra,
                                            idCurva,
                                            DadosMedia.qtdPrevisaoCompra,
                                            DadosVendaNova[18].vlDesvioPadrao);
                                          // FrequenciaCompra: Double): TDadosQtdadeSugestao;



  nrQtdadeSusgetaoPossivel := SugestaoPossivel(NrEmbalagemCompra,DadosSugestao.nrQtdSugerida);

  if (DadosSugestao.nrQtdSugerida>0) and (nrQtdadeSusgetaoPossivel=0) and (nrQtdEstoque+DadosPendencia.qtPendente=0) then
     nrQtdadeSusgetaoPossivel :=NrEmbalagemCompra;
  //

  //nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));
  if (nrQtdadeSusgetaoPossivel=0) and (DadosSugestao.nrQtdSugerida>0) and (_cbxCaixaFechada.ItemIndex = 1)  then
      nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));

  if (_cbxCaixaFechada.ItemIndex = 0) and
    (DadosSugestao.nrDiasEstoqueFuturo < 0) and (nrQtdadeSusgetaoPossivel = 0)
    and (formatdateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime) = '01/01/2039') then
    nrQtdadeSusgetaoPossivel := NrEmbalagemCompra
  else
  begin
    if (DadosSugestao.nrQtdSugerida > 0) and (nrQtdadeSusgetaoPossivel = 0) and
      (DadosSugestao.nrDiasEstoqueFuturo < 0) and
      (formatdateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime) = '01/01/2039') then
    begin
    //Mudar Para Caixa fechada quando
    // quando a Unidade sugerida for menor que um periodo de compra
     // if ((DadosSugestao.nrQtdSugerida / NrEmbalagemCompra) * 100) >= 25 then
     if ((NrEmbalagemCompra-DadosSugestao.nrQtdSugerida)/DadosMedia.vlMediaDia)<=DadosFrequenciaCompra.nrFrequenciaCompra then
         nrQtdadeSusgetaoPossivel := NrEmbalagemCompra
      else
        nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));
    end;
  end;

 // if  ((formatdateTime('dd/mm/yyyy',dtBloqueiodeCompra))<>'01/01/2039')
   //   and  ((formatdateTime('dd/mm/yyyy',dtBloqueio)) > (formatdateTime('dd/mm/yyyy',dtSistema))) then
     // nrQtdadeSusgetaoPossivel :=0;


  if (nrQtdadeSusgetaoPossivel > 0) and (nrQtdCxCamada > 0) and
    (nrQtdCxPalete > 0) and (_chkAjustaCamadaPalete.Checked) and
    (DadosMedia.vlMediaDiaNova > 0) then
  begin
    DadosSugestaoCamadaPalete := SetQuantidadePaleteCamada(nrQtdadeSusgetaoPossivel, // PqtPedido,
                                                            NrEmbalagemCompra, // PqtEmbalagem,
                                                            nrQtdCxCamada, // PqtCamada,
                                                            nrQtdCxPalete, // PqtPalete,
                                                            DadosSugestao.NrDiasEstoque, // PDiasEstoque: Integer;
                                                            nrQtdEstoque +DadosPendencia.qtPendente,
                                                            DadosMedia.vlMediaDiaNova,                          // PvlMediaDia:Double
                                                            0,DadosEstoqueCompra.nrFrequenciaCompra,idCurva,
                                                            DadosPendencia.qtPendente,
                                                           StrToInt(formatfloat('00000',DadosSugestao.qtEstoqueSeguranca) ));
  nrQtdadeSusgetaoPossivel:=DadosSugestaoCamadaPalete.qtPedido;
  end
  else
    nrQtdadeSusgetaoPossivel:=nrQtdadeSusgetaoPossivel;

  if (DadosSugestao.nrQtdSugerida = 0) and
     (DadosSugestao.nrQtdSugeridaRejeitada > 0) then
  begin
    nrQtdadeSusgetaoPossivel := 0;
    nrQuantidadeRejeitada    :=StrToIntDef(FormatFloat('0000000',DadosSugestao.nrQtdSugeridaRejeitada), 0);
  end;

//---------------------------------
  if (_cbxCaixaFechada.ItemIndex = 0) then
  begin
  if (DadosSugestao.nrQtdSugerida>1) and (nrQtdadeSusgetaoPossivel=0)
    and (nrQtdEstoque+DadosPendencia.qtPendente>0) and (DadosMedia.vlMediaDiaNova>0) then
     if (((nrQtdEstoque+DadosPendencia.qtPendente)-
        ((nrLeadTime+DadosEstoqueCompra.nrFrequenciaCompra)*DadosMedia.vlMediaDiaNova))<DadosSugestao.qtEstoqueSeguranca) then
         nrQtdadeSusgetaoPossivel :=NrEmbalagemCompra;
  end;

//---------------------------------

 result:= nrQtdadeSusgetaoPossivel;


end;




PROCEDURE T_frmTelaCompras.FiltraVendaMesAtual(PnrProduto, PnrEmpresa, PnrCanal,PnrMes: Integer);
var
  nrMes, nrQtdade, nrDias, nrDiasEstoqueZero: Integer;
  vlMediaMes, vlDesvioPadrao: Double;
begin
  if _cdsVendaFornecedor <> nil then
  begin
    with _cdsVendaFornecedor do
    begin
      Filtered := false;
     _cdsVendaFornecedor.recordcount;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto)
                + ' and CD_EMPRESA=' +IntToStr(PnrEmpresa)
                + ' and CD_CANAL=' + IntToStr(PnrCanal)
                + ' and MES='+ IntToStr(PnrMes);
      Filtered := true;
    end;
    DadosMedia.vlMediaDiaNova:=0;
    DadosMedia.vlDesvioPadrao :=0;
    if not _cdsVendaFornecedor.IsEmpty then
    begin
      DadosMedia.vlMediaDiaNova:= _cdsVendaFornecedor.FieldByName ('qt_media_venda_diaria').AsFloat;
      DadosMedia.vlDesvioPadrao := _cdsVendaFornecedor.FieldByName('QT_DESVIOPADRAO_VENDA_DIARIA').AsFloat;
    end;
    _cdsVendaFornecedor.recordcount;

  end;
end;



procedure T_frmTelaCompras.PedidoExcecao;
var
  NrFornecedor: Integer;
  SomatorioqtSeguranca:Double;

begin
  if confirma('Esse pedido n?o gera pedido automatico, apenas sugere'+#13+
              ' e n?o altera as data de agenda do pr?ximo pedido.'+#13+
              'Gerar pedido Exce??o?',MB_DEFBUTTON2)=idYes then
  begin
   idAtualizaAgendaPedido:=false;
   TipoPedido:='EXCECAO';

  _edtNrVerbaInicio.Text := _edtNrVerbaDesconto.Text;
  NrFornecedor := StrToIntDef(_edtFornecedor.Text, 0);
  if NrFornecedor = 0 then
    InicializaFornecedor;
  try
    _btnGeraPedido.Enabled := false;
    _btnGeraPedidoExcecao.Enabled:=false;


    if NrFornecedor > 0 then
    begin
      _dbgEmpresa.Enabled := false;
      DadosFornecedor := GetDadosLaboratorio(NrFornecedor);
      if DadosFornecedor = nil then
      begin
        Mensagem('Fornecedor n?o encontrado !!!', MB_ICONWARNING);
        _edtFornecedor.SetFocus;
        exit;
      end;
      SetTabelasItensCurva(NrFornecedor, stEmpresaSelecionada);
      DadosFrequenciaCompra := GetFrequenciaEstoqueMaximo    (DadosFornecedor.nrGrupoFornecedor);

  //     AbreDadosFornecedor(nrFornecedor,stEmpresaSelecionada );}
      GeraPedido(NrFornecedor,true);

//      CarregaEmpresaPedido;
      _cdsPrePedido.Filtered := false;
    end
    else
      Mensagem('Fornecedor n?o encontrado !!!', MB_ICONWARNING);
    _cdsPrePedido.First;
  except
    Mensagem('Erro Na Leitura dados Fornecedor', MB_ICONERROR);
  end;
//    SomatorioqtSeguranca:=qtSegurancaAcumulada;
   _edtsomaSeguranca.Text:=FormatFloat('###,###,##0.00',SomatorioqtSeguranca);
   _pgcCompras.ActivePage:=_tbsCompras;
   _cdsPrePedido.First;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
   SetgraficoVenda;
   _tbsConfirma.TabVisible:=true;


    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([nrProduto, nrEmpresa]), []) then
      SLEEP(0);
      _edtQtdadePedido.SetFocus;
  end;

  // _cdsProduto.First;


end;


procedure T_frmTelaCompras.PedidoNovo(IdTipoPedido:Boolean);
var
  NrFornecedor,I: Integer;
  SomatorioqtSeguranca:Double;

  EmpresaSelecionada:TClientDataSet;
  qtdItemInserido:Integer;
  nrPedidoTemp,StCD:string;
  cdPrazoPagamento,
  nrDiasEstoqueInf,nrExcesao :Integer;



begin

   EmpresaSelecionada:=TClientDataSet.Create(nil);
   nrVerbaInicio     := StrToIntDef(_edtNrVerbaInicio.Text, 0);
   nrGeracaoVerba    := nrVerbaInicio;

  _edtNrVerbaInicio.Text := _edtNrVerbaDesconto.Text;

  idForcaPedidoLocal     :=true;
  NrFornecedor           := StrToIntDef(_edtFornecedor.Text, 0);
  stPedidos              :=EmptyStr;
  StCD                   :=EmptyStr;
  EmpresaSelecionada:=FSetEmpresaSelecionadasII(_cdsEmpresa);

  if _chkCrossDocking.Checked then
      idForcaPedidoLocal:=false;


  //Pedido Excexao
     nrExcesao:=1;
    if IdTipoPedido then
       nrExcesao:=2;

  EmpresaSelecionada.First;
  while NOT EmpresaSelecionada.Eof do
  begin
     nrEmpresa:=EmpresaSelecionada.FieldByName('CD_EMPRESA').AsInteger;
     if StCD=EmptyStr then
        StCD:=EmpresaSelecionada.FieldByName('CD_EMPRESA').AsString
     else
        StCD:=StCD+','+EmpresaSelecionada.FieldByName('CD_EMPRESA').AsString;


    NrPedido:=PedidoEmpresa[nrEmpresa];
    if nrPedido>0 then
    begin
         if stPedidos = '' then
              stPedidos := IntToStr(NrPedido)
           else
              stPedidos := stPedidos + ',' + IntToStr(NrPedido);

    end;

    try
      if NrPedido=0 then
      begin
        InicializaTransacoes;
        nrPedidoTemp:= formatfloat('00',nrEmpresa)+formatfloat('0000',cdUsuarioSistema);
        _stbCompras.Panels[1].Text:='Gerando Pedido Empresa--> '+inttostr(nrEmpresa);
        _stbCompras.refresh;

        //   Gerando Pedido
        nrDiasEstoqueInf:=setDiasEstoque(nrEmpresa);

        qtdItemInserido:=FGeraPedidoNovo(NrFornecedor,nrEmpresa,strtoint(nrPedidoTemp)*-1,cdoperadorLogisticoPedido,nrDiasEstoqueInf,nrExcesao,nrListaPrecoExcecao);

        cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);

       if qtdItemInserido>0 then
       begin
         try
           EliminaItemPedidoZerado(strtoint(nrPedidoTemp)*-1);
           NrPedido := GeraNumeroPedido('C');
            if not AlteraNumeroPedido(NrPedido,strtoint(nrPedidoTemp)*-1) then
            begin
               Mensagem('Erro ao Alterar Numero Pedido!!!', MB_ICONERROR);
                CancelaTransacoes;
                exit;


            end;


           if stPedidos = '' then
              stPedidos := IntToStr(NrPedido)
           else
              stPedidos := stPedidos + ',' + IntToStr(NrPedido);

            PedidoEmpresa[nrEmpresa] := NrPedido;

           if nrGeracaoVerba>0 then
              pcGeracaoVerba:= DadosFornecedor.pcGeracaoVerba;


        DadosLeadTime := SetLeadTime(nrEmpresa, 'N');
        nrLeadTime := DadosLeadTime.vlLeadTime;






           if not GravaCapaPedido(NrPedido, // NROP_P,//  NUMBER(6)
                                  nrFornecedor, // LABP_P :Integer;// NUMBER(6)
                                  dtPedido, // DATP_P :Tdate;// DATE
                                  pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                                  0, // DESP_P:Double;// NUMBER(5,2)
                                  'S', // SITP_P :String;//CHAR(1)
                                  DadosFornecedor.nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
                                  dtPedido + nrLeadTime, // PREP_P          //DATE
                                  ' ', // CHAR(40)
                                  TipoPedido, // SNRP_P           //  CHAR(10)
                                  0, // FLAP_P ,         //NUMBER(1)
                                  cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                                  nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                                  strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                                  dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                                  'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                                  cdoperadorLogisticoPedido,
                                  // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                                  NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                                  DadosFornecedor.dtAgenda,
                                  // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                                  dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                                  0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                                  0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                                  strtodate('01/01/2039'), nrCompradorPedido,
                                  nrEmpresa, 0, pcGeracaoVerba,
                                  nrGeracaoVerba,
                                  NrDiasEstoqueComprador,
                                  nrEmpresa,
                                  'N',0,nrListaPrecoExcecao) then
           _stbCompras.Panels[1].Text:='Pedido Gerado Empresa--> '+inttostr(nrEmpresa);

         except
            begin
                Mensagem('Erro ao criar Capa Pedido', MB_ICONERROR);
                CancelaTransacoes;
                exit;
              end;
         end;
         ConfirmaTransacoes;
       end
       else
         CancelaTransacoes;


    end;

    except
      Mensagem('Erro Ao Executar Pedido',MB_ICONERROR);
      Break;

    end;


     EmpresaSelecionada.Next;

  end;
   if (stPedidos='') then
   begin
    if not IdTipoPedido then
         mensagem('N?o ha Necessidade de Pedido Com Esse Paramentros',MB_ICONWARNING);
     stPedidos:='0';
   end;


  {  AbreItemPrePedidoMultiEmpresa(stPedidos, // :String;
    0, // PnrMercadoria,
    nrEmpresa, // PcdEmpresa: Integer;
    ''); // PidSituacao: String): Boolean;}

 // AbreItemPrePedidoMultiEmpresaNova(NrFornecedor,idforcaCross,stPedidos,StCD);
  idCalculaMedia:=false;


  // Ajusta Quantidade pedido
    if _chkUsarUltimoDesconto.Checked then
    begin
     AbreItemPrePedidoMultiEmpresaNova(NrFornecedor,idforcaCross,stPedidos,StCD);
     if not IdTipoPedido then
         SetItemPedido
    end
  else
  begin
    for I := 0 to High(PedidoEmpresa) do
    if PedidoEmpresa[I] > 0 then
    begin
       NrPedido:=PedidoEmpresa[I];
       GravaLogPedidoCompraNova(nrPedido,nmLogin);

    end;
  end;

  for I := 0 to High(PedidoEmpresa) do
     if PedidoEmpresa[I] > 0 then
     begin
       NrPedido:=PedidoEmpresa[I];
       idAuditoria := AuditoriaCompraCapa(NrPedido, // PCD_AUDITORIA    :Integer;
                                            dtSistema, // PDT_AUDITORIA    :Tdate;
                                            nrFornecedorPedido, // PNR_LABORATORIO  :Integer;
                                            copy(trim(TipoPedido), 1, 20), // PDS_MODULO       :String;
                                            _dtpDataAgendada.Date, // PDT_AGENDA_ANT   :Tdate;
                                            _dtpProximaAgenda.Date, // PDT_AGENDA_ATUAL :Tdate;
                                            _lbeGrupoPedido.Text, // PDS_GRUPO_ANT    :String;
                                            _lbeGrupoPedido.Text, // PDS_GRUPO_ATUAL  :String;
                                            nrLeadTime, // PNR_LEADTIME_ANT :Integer;
                                            nrLeadTime, // PNR_LEADTIME_ATUAL:Integer;
                                            DadosFornecedor.dsDiasPedido, // PDS_DIACOMPRA_ANT:String;
                                            DadosFornecedor.dsDiasPedido, // PDS_DIACOMPRA_ATUAL:String;
                                            DadosEstoqueCompra.nrEstoqueMaximo,// PNR_PARAM_ESTOQUE_ANT:Integer;
                                            DadosEstoqueCompra.nrEstoqueMaximo,// PNR_PARAM_ESTOQUE_ATUAL:Integer;
                                            0, // PQT_SUGERIDA_ANT:Integer;
                                            0, // PQT_SUGERIDA_ATUAL:Integer;
                                            0, // PQT_COMPRADA:Integer;
                                            0, // PVT_SUGERIDO_ANT,
                                            0, // PVT_SUGERIDO_ATUAL,
                                            0, // PVT_COMPRADO:Double;
                                            idPedidoAgendado, // PID_AGENDADO:String;
                                            NomeMaquina, // PNM_USUARIO:String;
                                            0, // PPC_DESC_FIN_ANT,
                                            0, // PPC_DESC_FIN_ATUAL,
                                            pcDescontoPadrao, // PPC_DESC_COM_ANT,
                                            pcDescontoPadrao, // PPC_DESC_COM_ATUAL:Double;
                                            ' ', // PDS_JUSTIFICATIVA:String;
                                            cdPrazoPagamento, // PNR_PRAZO_ANT:Integer;
                                            cdPrazoPagamento, { //PNR_PRAZO_ATUAL:Integer }
                                            1, NrPedido);



       InsereItemAuditoriaNOVA( NrPedido,
                                NrFornecedor,
                                NrPedido);
     end;



  AbreItemPedidoMultiEmpresa(stPedidos, 0, 0, '');
  AbreItemPrePedidoMultiEmpresaNova(NrFornecedor,idforcaCross,stPedidos,StCD);
  TotalizaPedidoMultiEmpresa(stPedidos, 0, '');
 _tbsCompras.TabVisible := true;
 _tbsConfirma.TabVisible:=true;
   idCalculaMedia:=TRUE;

  if _cdsPrePedido.Active then
  begin
    _cdsPrePedido.First;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;

    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([nrProduto, nrEmpresa]), []) then
      SLEEP(0);
       _pgcCompras.ActivePage:=_tbsCompras;

  end;

        _stbCompras.Panels[1].Text:='Pedido Gerado...';
        _stbCompras.refresh;
        PmovimentoTabelaPedido;
        _cdsPrePedido.First;
        _edtQtdadePedido.setfocus;


end;



procedure T_frmTelaCompras.PedidoNormal;
var
  SomatorioqtSeguranca:Double;

begin

  if _chkCrossDocking.Checked then
     idForcaPedidoLocal:=false;
  if NrFornecedor = 0 then
    InicializaFornecedor;
  try
    _btnGeraPedido.Enabled := false;
    _btnGeraPedidoExcecao.Enabled:=false;


    if NrFornecedor > 0 then
    begin
      _dbgEmpresa.Enabled := false;
      DadosFornecedor := GetDadosLaboratorio(NrFornecedor);
      if DadosFornecedor = nil then
      begin
        Mensagem('Fornecedor n?o encontrado !!!', MB_ICONWARNING);
        _edtFornecedor.SetFocus;
        exit;
      end;
      SetTabelasItensCurva(NrFornecedor, stEmpresaSelecionada);
      DadosFrequenciaCompra := GetFrequenciaEstoqueMaximo(DadosFornecedor.nrGrupoFornecedor);

  //     AbreDadosFornecedor(nrFornecedor,stEmpresaSelecionada );}
      GeraPedido(NrFornecedor,false);

//      CarregaEmpresaPedido;
      _cdsPrePedido.Filtered := false;
    end
    else
      Mensagem('Fornecedor n?o encontrado !!!', MB_ICONWARNING);
    _cdsPrePedido.First;
  except
    Mensagem('Erro Na Leitura dados Fornecedor', MB_ICONERROR);
  end;
//    SomatorioqtSeguranca:=qtSegurancaAcumulada;
 //  _edtsomaSeguranca.Text:=FormatFloat('###,###,##0.00',SomatorioqtSeguranca);
   _pgcCompras.ActivePage:=_tbsCompras;
   _cdsPrePedido.First;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
   SetgraficoVenda;
   _tbsConfirma.TabVisible:=true;


    if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([nrProduto, nrEmpresa]), []) then
      SLEEP(0);
      _edtQtdadePedido.SetFocus;

  // _cdsProduto.First;

end;


procedure T_frmTelaCompras.AbreDiasEstoque;
begin
    _cdsPeEstoque := ListaDiasEstoqueCD('');
    if _cdsPeEstoque <> nil then
    begin
    _dsPeEstoqueCd.DataSet := _cdsPeEstoque;
    _cdsPeEstoque.open;
    SetGridPEDiasEstoque;
  end;

end;



procedure T_frmTelaCompras.SetPosicaoGrafico(PnrProduto,PnrEmpresa:Integer);
begin

    nrProduto := PnrProduto ;//_cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    nrEmpresa := PnrEmpresa;//_cdsPrePedido..FieldByName('CD_EMPRESA').AsInteger;
    SetgraficoVenda;
    if idPosicionaProduto then
    begin
      idPosicionaProduto := false;
      if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([nrProduto, nrEmpresa]), []) then
        MostraMedia;;
    end;



end;





Function T_frmTelaCompras.MostraVendaVendasNovo(PnrProduto,PnrEmpresa,PAno,Pmes,PnrCanal:Integer):TDadosVendaProduto ;
begin

  if _cdsVendaFornecedor <> nil then
  begin
    with _cdsVendaFornecedor do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto)
                + ' and CD_EMPRESA=' +IntToStr(PnrEmpresa)
                + ' and ANO=' +IntToStr(PAno)
                + ' and MES=' +IntToStr(Pmes)
                + ' and CD_CANAL=' + IntToStr(PnrCanal);
      Filtered := true;
    end;

      Result.qtVendaVenda        := 0;
      Result.nrDiasEstoqueZero   := 0;
      Result.nrDias              := 0;
      Result.NrDiasFaturamento   := 0;
      Result.vlMediaMesPrevisao  := 0;

      Result.vlMediaMes          := 0;
      Result.vlDesvioPadrao      := 0;
      Result.vlMediaMesPrevisao  := 0;




    if not _cdsVendaFornecedor.IsEmpty then
    begin

      Result.qtVendaVenda        := _cdsVendaFornecedor.FieldByName('NR_UNIDADES').AsInteger;
      Result.nrDiasEstoqueZero   := _cdsVendaFornecedor.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
      Result.nrDias              := _cdsVendaFornecedor.FieldByName('NR_DIAS').AsInteger;
      Result.NrDiasFaturamento   := _cdsVendaFornecedor.FieldByName('QT_DIAS_VENDA').AsInteger;
      Result.vlMediaMes          := _cdsVendaFornecedor.FieldByName ('VL_MEDIA').AsFloat;
      Result.vlMediaMesPrevisao  := _cdsVendaFornecedor.FieldByName ('QT_MEDIA_VENDA_DIARIA').AsFloat;

      Result.vlDesvioPadrao      := _cdsVendaFornecedor.FieldByName('QT_DESVIOPADRAO_VENDA_DIARIA').AsFloat;
      Result.vlMediaMesPrevisao  :=_cdsVendaFornecedor.FieldByName ('QT_MEDIA_VENDA_DIARIA').AsFloat


    end;

  end;



end;



Function T_frmTelaCompras.MostraVendaVendasNovoII(PnrProduto,PnrEmpresa,PAno,Pmes,PnrCanal:Integer):TDadosVendaProduto ;
var
Mes,Ano:Integer;


begin

  if _cdsVendaFornecedor <> nil then
  begin
    with _cdsVendaFornecedor do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto)
                + ' and CD_EMPRESA=' +IntToStr(PnrEmpresa)
                + ' and CD_CANAL=' + IntToStr(PnrCanal);
      Filtered := true;
    end;



    _cdsVendaFornecedor.first;
    while not _cdsVendaFornecedor.eof do
    begin
       Mes:=_cdsVendaFornecedor.FieldByName('MES').AsInteger;
       Ano:=_cdsVendaFornecedor.FieldByName('ANO').AsInteger;

      DadosVendaNovaII[Mes,ano].qtVendaVenda := _cdsVendaFornecedor.FieldByName('NR_UNIDADES').AsInteger;
      DadosVendaNovaII[Mes,ano].nrDiasEstoqueZero   := _cdsVendaFornecedor.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
      DadosVendaNovaII[Mes,ano].nrDias              := _cdsVendaFornecedor.FieldByName('NR_DIAS').AsInteger;
      DadosVendaNovaII[Mes,ano].NrDiasFaturamento   := _cdsVendaFornecedor.FieldByName('QT_DIAS_VENDA').AsInteger;
      DadosVendaNovaII[Mes,ano].vlMediaMes          := _cdsVendaFornecedor.FieldByName('VL_MEDIA').AsFloat;
      DadosVendaNovaII[Mes,ano].vlMediaMesPrevisao  := _cdsVendaFornecedor.FieldByName('QT_MEDIA_VENDA_DIARIA').AsFloat;

      DadosVendaNovaII[Mes,ano].vlDesvioPadrao      := _cdsVendaFornecedor.FieldByName('QT_DESVIOPADRAO_VENDA_DIARIA').AsFloat;
      DadosVendaNovaII[Mes,ano].vlMediaMesPrevisao  :=_cdsVendaFornecedor.FieldByName ('QT_MEDIA_VENDA_DIARIA').AsFloat;

    _cdsVendaFornecedor.next;
    end;

  end;



end;



PROCEDURE T_frmTelaCompras.FiltraVendaII(PnrProduto,
                                         PnrEmpresa,
                                         PnrCanal: Integer);
var
  nrMes,ContaReg, nrQtdade, nrDias, nrDiasEstoqueZero: Integer;
  vlMediaMes, vlDesvioPadrao,nrMaiorValor: Double;
  stMes:String;
  corBarra: TColor;
  dtInicial:Tdate;
  nrAnoAtual,
  nrMesAtual,
  nrMesInicial,
  nrAnoInicial,I:Integer;
  dadosVenda:TDadosVendaProduto;

begin

    Series2.Clear;
    nrMaiorValor:=0;
    dtInicial:=IncMonth(DataSistema,-17);
    nrAnoInicial:=YearOf(dtInicial);
    nrMesInicial:=MonthOf(dtInicial);

    nrAnoAtual :=YearOf(dtSistema);
    nrMesAtual :=MonthOf(dtSistema);


    ContaReg:=0;
    nrMaiorValor:=0;

   if Mercadoria=NIL then
      EXIT;




    Chart1.Title.Text[0] := FormatFloat('0000000',Mercadoria.cdProduto)   + ' - ' + Mercadoria.nmProdutoCompleto;


    Fillchar(mesSelecao, SizeOf(mesSelecao), 0);
    Fillchar(DadosVendaNova,SIZEOf(DadosVendaNova),0);
    Fillchar(DadosVendaNovaII, SizeOf(DadosVendaNovaII), 0);
     MostraVendaVendasNovoII(PnrProduto,PnrEmpresa,nrAnoInicial,nrMesInicial,PnrCanal);
    for I := 1  to 18 do
    begin
     // dadosVenda:=MostraVendaVendasNovo(PnrProduto,PnrEmpresa,nrAnoInicial,nrMesInicial,PnrCanal);

      DadosVendaNova[i]:= DadosVendaNovaII[nrMesInicial,nrAnoInicial];
    //  DadosVendaNova[i]:=dadosVenda;
    //  DadosVendaNova[i]:=dadosVenda;

      nrQtadade:= DadosVendaNova[i].qtVendaVenda;

      mesSelecao[i].nrAno:=nrAnoInicial;
      mesSelecao[i].nrMes:=nrMesInicial;

      corBarra := clWhite;
      if PnrEmpresa = 1 then
      corBarra := clTeal;;
      if PnrEmpresa = 4 then
      corBarra := $000080FF;
      if PnrEmpresa = 5 then
      corBarra := clFuchsia;
      if PnrEmpresa = 7 then
      corBarra := clGradientActiveCaption;


 //    if idMesSelecionado[nrMes] = 'S' then
   //   corBarra := clSkyBlue;


      //Colocando Nome do Mes
        stMes := UpperCase(ShortMonthNames[nrMesInicial]);

     //if (nrMesAtual=nrMesInicial) and (nrAnoAtual=nrAnoInicial)then
     //   stMes :='ATUAL';

     Series2.Add(nrQtadade, stMes, corBarra);

       if nrQtadade > nrMaiorValor then
          nrMaiorValor := nrQtadade;

      Chart1.LeftAxis.SetMinMax(0, nrMaiorValor * 1.35);

      if nrMesInicial=12 then
      begin
        nrMesInicial:=0;
        inc(nrAnoInicial);
      end;

      inc(nrMesInicial);



    end;

    DadosMedia.vlMediaDiaNova:= DadosVendaNova[18].vlMediaMesPrevisao;
    DadosMedia.vlDesvioPadrao :=DadosVendaNova[18].vlDesvioPadrao;
    PSetCoresGRafico;
end;


Procedure T_frmTelaCompras.MontaGraficoNovo(PnrProduto,PnrEmpresa,PnrCanal:Integer);
begin
   if _pgcCompras.ActivePage = _tbsCompras then
   begin
     Series2.Title := 'CD - ' + _cdsProduto.FieldByName('ID_LOCAL_CD').AsString;
     FiltraVendaII(PnrProduto, PnrEmpresa, PnrCanal);
   end;


end;



Function T_frmTelaCompras.GetDadosProduto:Boolean;
begin
    Mercadoria:=NIL;
    Mercadoria:=TMercadoria.Create;
    nrProduto := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;

    nrEmpresa := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;


    nrEmpresaOCD:=nrEmpresa;
    if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
       (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='N' ) then
    begin
      idForcaPedidoLocal:=true;
      nrEmpresaOCD:=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
    end;
    if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
       (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='S' ) then
    begin
       idForcaPedidoLocal:=FALSE;
       nrEmpresaOCD:=_cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').Asinteger;
    end;






    Mercadoria.cdProduto        := _cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger;
    Mercadoria.nrProduto        := _cdsPrePedido.FieldByName('CD_MERCADORIA').AsInteger;
    Mercadoria.nrEmpresaProduto := _cdsPrePedido.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
    Mercadoria.nmProdutoCompleto:= _cdsPrePedido.FieldByName('NM_MERCADORIA').AsString+' - '+
                                  _cdsPrePedido.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString;
  // _cdsProduto.recordcount;
  //  _cdsProduto.Filtered:=false;

     Mercadoria := DadosProdutos(nrProduto , nrEmpresa, cdoperadorLogisticoPedido);


  if Mercadoria<>nil then
  begin

  nrQtdEstoque     := _cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;
  idTermoLabil      := _cdsProduto.FieldByName('ID_REFRIGERADO').AsString;
  idCurva           := _cdsProduto.FieldByName('ID_CURVA_MERCADORIA').AsString;
  NrEmbalagemCompra := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;

  idCrossDocking    :='N';
  if _cdsProduto.FieldByName('CD_EMPRESA_CROSSDOCKING').AsInteger>0 then
      idCrossDocking    :='S';

  idCrossDocking    := _cdsPrePedido.FieldByName('OCD').AsString;


  nrQtdCaixa       := _cdsProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
  nrQtdCxCamada    := _cdsProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
  nrQtdCxPalete    := _cdsProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
  nrQtdUndCamada   := nrQtdCxCamada * NrEmbalagemCompra;
  nrQtdUndPalete   := nrQtdCxPalete * NrEmbalagemCompra;
  nrGeracaoVerba   := _cdsProduto.FieldByName('NR_VERBA_GERACAO').AsInteger;
  pcGeracaoVerba   := _cdsProduto.FieldByName('PC_VERBA_GERACAO').AsFloat;
  pcCreditoICMS    := _cdsProduto.FieldByName('PC_CREDITO_ICMS').AsFloat;

  nrQtdVencido      := _cdsProduto.FieldByName('QT_VENCIDO').AsInteger;
  nrQtdAvariada     := _cdsProduto.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger;
  nrQtdReservada    := _cdsProduto.FieldByName('QT_RESERVADO').AsInteger;
  pcDescontoRepasse := 0;

  nmProduto := _cdsProduto.FieldByName('NM_MERCADORIA').AsString + '  ' +
               _cdsProduto.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString;



  DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);

  DadosLeadTime := SetLeadTime(nrEmpresa,idTermoLabil);
  nrLeadTime    := DadosLeadTime.vlLeadTime+nrSomaLeadTimeOCD;

  SetCorPendencia(DadosPendencia.QtPedido,
                  DadosPendencia.qtPendente,
                  DadosPendencia.qtAtendida,
                  DadosPendencia.qtProcessada,
                  DadosPendencia.qtTransito,
                  DadosPendencia.qtEstoqueCrossDocking,
                  DadosPendencia.qtPendencia);
   end
   else
   begin
      Mercadoria:=nil;
      mensagem('Item N?o Localizado na Tabela de Produtos...',MB_ICONERROR);
      exit;

   end;




    idCurva:=mercadoria.idCurva;

   _lbeCurva.Caption := 'Curva = ' + idCurva;

   PSetPrecoPoduto;
   dtSelecionadaFormatada := FormatDateTime('01/mm/yyyy', IncMonth(dtPedido, 0));
   FiltraVendaPorCanal(nrProduto, nrEmpresa, dtSelecionadaFormatada);
   PSetCoresGRafico;


end;



procedure T_frmTelaCompras.PSetPrecoPoduto;
var
  idSetPedidoCrossdocking:boolean;

begin
  nrEmpresaOCD:=nrEmpresa;
  nrSomaLeadTimeOCD:=0;

  idSetPedidoCrossdocking:=idForcaPedidoLocal;
  if _cdsPrePedido.Active then
     if _cdsPrePedido.FieldByName('OCD').Asstring='N' then
        idSetPedidoCrossdocking:=true;

  if (not idSetPedidoCrossdocking) and (idCrossDocking='S')  then
      idSetPedidoCrossdocking:=SetPedidoLocalCrossdocking(nrProduto,nrEmpresa);




  nrEmpresaOCD:=nrEmpresa;
  nrSomaLeadTimeOCD:=0;
//  if (idCrossDocking='S') AND (_chkCrossDocking.Checked) and (not idSetPedidoCrossdocking)   then
  if (idCrossDocking='S') AND (_chkCrossDocking.Checked) and (not idSetPedidoCrossdocking)   then
  begin
      nrEmpresaOCD:=_cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').asinteger;
      nrSomaLeadTimeOCD:=5;

  end;

           nrEmpresaOCD:=nrEmpresa;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='N' ) then
         begin
            idForcaPedidoLocal:=true;
            nrEmpresaOCD:=_dsPrePedido.DataSet.FieldByName('CD_EMPRESA_ORIGEM').AsInteger;
          end;
         if (_cdsPrePedido.FieldByName('CD_CROSSDOCKING').Asinteger>0)  and
           (upperCase(_cdsPrePedido.FieldByName('OCD').Asstring)='S' ) then
         begin
            idForcaPedidoLocal:=FALSE;
            nrEmpresaOCD:=_cdsPrePedido.FieldByName('CD_EMPRESA_CROSSDOCKING').Asinteger;
           nrSomaLeadTimeOCD:=5;
          end;




   DadosProdutoCross:=DadosProdutos(nrProduto,nrEmpresaOCD,cdoperadorLogisticoPedido);

     if (idCrossDocking='S') AND (DadosProdutoCross=nil) then
   begin
     Mensagem('Produto Crossdocking '+#13+
              'Mas o mesmo esta Inativo no CD Crossdocking',MB_ICONEXCLAMATION);


        exit;

   end;





  vlPrecoLista     :=  Mercadoria.vlPrecoCompra;

  idprecoAtual := 'S';
  idBloqueiaPedido := 0;



  precoLista := GetPrecoItem(nrProduto,
                             nrEmpresaOCD,
                             vlPrecoLista,
                             1,
                             idprecoAtual,
                             idBloqueiaPedido,
                             nrListaPrecoExcecao); { ,nrListaPreco };
  vlPrecoLista := precoLista.vlPrecoBase;


   

  if (nrListaPrecoExcecao > 0) then
  begin
    pcDescontoAdicional := precoLista.PcDescontoLista;
    if (cdoperadorLogisticoPedido = 1) then
         nrVerba := precoLista.nrVerba;
  end;

   if  (_cdsPrePedido.active) then
     if  _cdsPrePedido.FieldByName('DADY_Y').AsFloat>0 then
          pcDescontoAdicional := _cdsPrePedido.FieldByName('DADY_Y').AsFloat;

  if (_chkUltimoDesconto.Checked) or (_chkUsarUltimoDesconto.Checked) then
  begin
    pcDescontoAdicional := getUltimoDesconto(DadosProdutoCross.nrLaboratorio, nrProduto,
                                             nrEmpresa, cdoperadorLogisticoPedido);
  end;

  PrecoItem := CalculaPrecoLiquido( vlPrecoLista,
                                   DadosProdutoCross.vlPrecoVenda,
                                   DadosProdutoCross.pcRepasseCompra,
                                   DadosProdutoCross.pcDescontoPadrao,
                                   pcDescontoAdicional,
                                   DadosProdutoCross.pcCreditoICMS,
                                   DadosProdutoCross.pcIpiProduto,
                                   precoLista.PcIPILista,
                                   precoLista.pcReajustePreco,
                                   1,

                                   precoLista.nrListaPreco,
                                   'N', DadosProdutoCross.idForcaRepasse,
                                   DadosProdutoCross.idIpiLiquidoComRepasse,
                                   DadosProdutoCross.idIpiLiquidoSemRepasse,
                                   DadosProdutoCross.idIpiBrutoComRepasse,
                                   DadosProdutoCross.idIpiBrutoSemRepasse,
                                   DadosProdutoCross.idTipoListaFiscal,
                                   DadosFornecedor.idUnidadeFederacao,
                                   DadosProdutoCross.idSuperfulo,
                                   DadosProdutoCross.idIcmDestacado,
                                   DadosProdutoCross.idReduzIcms,
                                   DadosProdutoCross.idPisCofins);



  end;


procedure T_frmTelaCompras.PSetCoresGRafico;
var
  stAlertaRestricao: String;

begin


  Chart1.Color := clBtnFace;
  Chart1.Title.Font.Color := clBlack;

  if RestricaoDeCompra( Mercadoria.nrProduto) then
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
    Chart1.Title.Color := clRed;

    Chart1.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + #13 + ' - ';;
    Chart1.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
   idAlertaInativacao:=true;
  end;

  if FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').Asdatetime) <> '01/01/2039' then
  begin
    Chart1.Title.Color := clRed;
    Chart1.Title.Font.Color := clBlack;

    Chart1.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' + ' Produto Marcado para Ser Inativado ';
    Chart1.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
   idAlertaInativacao:=true;
  end;
  if (FormatDateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_BLOQUEIO_COMPRA').Asdatetime) <> '01/01/2039')
    and (FormatDateTime('dd/mm/yyyy',dtBloqueiodeCompra) <FormatDateTime('dd/mm/yyyy',dtSistema)) then
  begin
    Chart1.Title.Color := clRed;
    Chart1.Title.Font.Color := clBlack;

    Chart1.Title.Text[0] := FormatFloat('######0',
      _cdsProduto.FieldByName('CD_PRODUTO').AsInteger) + ' - ' +
      _cdsProduto.FieldByName('NM_COMPLETO').AsString + ' - ' + ' Produto Bloqueado Para compra ';
    Chart1.Refresh;
    Timer1.Interval := 500;
    Timer1.Enabled := true;
    idAlertaInativacao:=true;
  end;
  setCoresGraficoCurva(idCurva);
end;


procedure T_frmTelaCompras.PmovimentoTabelaPedido;
var
  stAlertaRestricao: String;
  DadosSugestaoCamadaPalete: TDadosSugestaoCamadaPalete;
  dtBloqueio:tdate;
  qtPendencia:Integer;


begin
    GetDadosProduto;

    NrPedido     := PedidoEmpresa[nrEmpresa];
    SetgraficoVenda;
    MontaGraficoNovo(nrProduto,nrEmpresa,0);


    if idPosicionaProduto then
    begin
      idPosicionaProduto := false;
      if _cdsProduto.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([nrProduto, nrEmpresa]), []) then
        MostraMedia;
    end;


   DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);

   DadosPrecoUltimaentrada:=SetPrecoUltimaEntrada(nrProduto,nrEmpresaOCD );


  DadosLeadTime := SetLeadTime(nrEmpresa,idTermoLabil);
  if DadosLeadTime.vlLeadTime>0 then
      nrLeadTime    := DadosLeadTime.vlLeadTime+nrSomaLeadTimeOCD;

 if nrLeadTime<=0 then
     nrLeadTime:=DadosFornecedor.nrDiasLeadTime+nrSomaLeadTimeOCD;


  SetCorPendencia(DadosPendencia.QtPedido,
                  DadosPendencia.qtPendente,
                  DadosPendencia.qtAtendida,
                  DadosPendencia.qtProcessada,
                  DadosPendencia.qtTransito,
                  DadosPendencia.qtEstoqueCrossdocking,
                  DadosPendencia.qtPendencia);


  qtPendencia:= DadosPendencia.qtPendente;
//                DadosPendencia.qtEstoqueCrossdocking+
  //              DadosPendencia.qtTransito;




  DadosEstoqueCompra := setParamentroItemCurvaCompra(nrEmpresa,
                                                     NrDiasEstoque, // PnrDiasEstoque: Integer;
                                                     idCurva[1]); // : Char):TDadosEstoqueCurva;

  NrDiasEstoquePedido     := DadosEstoqueCompra.nrEstoqueMaximo;
  NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);
  if NrDiasEstoqueComprador > 0 then
    NrDiasEstoquePedido := NrDiasEstoqueComprador;




   DadosItemPedidoLog := LocalizaItemPedido(NrPedido, nrProduto, nrEmpresa);







   vlMediaDiaCD:=DadosVendaNova[18].vlMediaMesPrevisao;
   DadosMedia.vlMediaDia:=DadosVendaNova[18].vlMediaMesPrevisao;


  DadosSugestao := CalculoSugestaoIdealNova(nrEmpresa, // PnrEmpresa:Integer;
                                            DadosEstoqueCompra.nrFrequenciaCompra, // PvlPE,
                                            0, // PnrDiasAjuste,
                                            nrLeadTime, // DadosFornecedor.nrDiasLeadTime,//     PLeadTimeCalculo,
                                            DadosVendaNova[18].vlMediaMesPrevisao, // PvlMediaDiaria: Double;
                                            nrQtdEstoque, // PnrQuantidadeEstoque,
                                            qtPendencia, // PnrQuantidadaPendente,
                                            DadosEstoqueCompra.nrEstoqueMInimo, // PQtdEstoqueMinimo,
                                            NrDiasEstoquePedido, // PQtdEstoqueMaximo,
                                            cdoperadorLogisticoPedido, // PcdOPeradorLogistico:Integer;
                                            DadosEstoqueCompra.nrFrequenciaCompra,
                                            idCurva,
                                            DadosMedia.qtdPrevisaoCompra,
                                            DadosVendaNova[18].vlDesvioPadrao);
                                          // FrequenciaCompra: Double): TDadosQtdadeSugestao;



  nrQtdadeSusgetaoPossivel := SugestaoPossivel(NrEmbalagemCompra,DadosSugestao.nrQtdSugerida);

  if (DadosSugestao.nrQtdSugerida>0) and (nrQtdadeSusgetaoPossivel=0) and (nrQtdEstoque+DadosPendencia.qtPendente=0) then
     nrQtdadeSusgetaoPossivel :=NrEmbalagemCompra;





  //nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));
  if (nrQtdadeSusgetaoPossivel=0) and (DadosSugestao.nrQtdSugerida>0) and (_cbxCaixaFechada.ItemIndex = 1)  then
      nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));

  if (_cbxCaixaFechada.ItemIndex = 0) and
    (DadosSugestao.nrDiasEstoqueFuturo < 0) and (nrQtdadeSusgetaoPossivel = 0)
    and (formatdateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime) = '01/01/2039') then
    nrQtdadeSusgetaoPossivel := NrEmbalagemCompra
  else
  begin
    if (DadosSugestao.nrQtdSugerida > 0) and (nrQtdadeSusgetaoPossivel = 0) and
      (DadosSugestao.nrDiasEstoqueFuturo < 0) and
      (formatdateTime('dd/mm/yyyy',_cdsProduto.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime) = '01/01/2039') then
    begin
    //Mudar Para Caixa fechada quando
    // quando a Unidade sugerida for menor que um periodo de compra
     // if ((DadosSugestao.nrQtdSugerida / NrEmbalagemCompra) * 100) >= 25 then
     if ((NrEmbalagemCompra-DadosSugestao.nrQtdSugerida)/DadosMedia.vlMediaDia)<=DadosFrequenciaCompra.nrFrequenciaCompra then
         nrQtdadeSusgetaoPossivel := NrEmbalagemCompra
      else
        nrQtdadeSusgetaoPossivel := strtoint(FormatFloat('00000000', DadosSugestao.nrQtdSugerida));
    end;
  end;


  if (nrQtdadeSusgetaoPossivel > 0) and (nrQtdCxCamada > 0) and
    (nrQtdCxPalete > 0) and (_chkAjustaCamadaPalete.Checked) and
    (DadosVendaNova[18].vlMediaMesPrevisao > 0) then
  begin
    DadosSugestaoCamadaPalete := SetQuantidadePaleteCamada(nrQtdadeSusgetaoPossivel, // PqtPedido,
                                                            NrEmbalagemCompra, // PqtEmbalagem,
                                                            nrQtdCxCamada, // PqtCamada,
                                                            nrQtdCxPalete, // PqtPalete,
                                                            DadosSugestao.NrDiasEstoque, // PDiasEstoque: Integer;
                                                            nrQtdEstoque +DadosPendencia.qtPendente,
                                                            DadosVendaNova[18].vlMediaMesPrevisao,                          // PvlMediaDia:Double
                                                            0,DadosEstoqueCompra.nrFrequenciaCompra,idCurva,
                                                            DadosPendencia.qtPendente,
                                                           StrToInt(formatfloat('00000',DadosSugestao.qtEstoqueSeguranca) ));
  nrQtdadeSusgetaoPossivel:=DadosSugestaoCamadaPalete.qtPedido;
  end
  else
    nrQtdadeSusgetaoPossivel:=nrQtdadeSusgetaoPossivel;

  if (DadosSugestao.nrQtdSugerida = 0) and
     (DadosSugestao.nrQtdSugeridaRejeitada > 0) then
  begin
    nrQtdadeSusgetaoPossivel := 0;
    nrQuantidadeRejeitada    :=StrToIntDef(FormatFloat('0000000',DadosSugestao.nrQtdSugeridaRejeitada), 0);
  end;


  if (_cbxCaixaFechada.ItemIndex = 0) then
  begin
  if (DadosSugestao.nrQtdSugerida>1) and (nrQtdadeSusgetaoPossivel=0)
    and (nrQtdEstoque+DadosPendencia.qtPendente>0) and (DadosVendaNova[18].vlMediaMesPrevisao>0) then
     if (((nrQtdEstoque+DadosPendencia.qtPendente)-((nrLeadTime+DadosEstoqueCompra.nrFrequenciaCompra)*DadosVendaNova[18].vlMediaMesPrevisao))<DadosSugestao.qtEstoqueSeguranca) then
         nrQtdadeSusgetaoPossivel :=NrEmbalagemCompra;
  end;








    MostraDadosProduto(nrQtdEstoque, // PnrQtdEstoque,
                     DadosPendencia.qtPendente ,
                     // + DadosPendencia.qtEstoqueCrossdocking+DadosPendencia.qttransito , // PnrQtdPendente,
                     DadosEstoqueCompra.nrEstoqueMaximo, // PnrCoberturaEstoque,
                     nrQtdadeSusgetaoPossivel, // Qtd. Pedido
                     DadosSugestao.qtEstoqueSeguranca,
                     DadosVendaNova[18].qtVendaVenda,
                     DadosVendaNova[18].vlMediaMesPrevisao,
                     DadosVendaNova[18].vlMediaMes,
                     DadosVendaNova[18].vlMediaMesPrevisao,
                     nrQtdCaixa,
                     nrQtdUndCamada, nrQtdUndPalete);





  _edtObservacaoInativacao.Visible:=false;
  idAlerteOCD:=false;
  idAlertaInativacao:=false;
  if idCrossDocking='S' then
  begin
     idAlerteOCD:=true;
     Timer1.Interval := 900;
     Timer1.Enabled := true;

    _edtObservacaoInativacao.Visible:=true;
    _edtObservacaoInativacao.Text:='Produto CrossDocking';

  end;
  //Mostrando observa??o de motivo Inativa??o futura
  if FormatDateTime('dd/mm/yyyy',dtInativacaoFutura)<>'01/01/2039' then
  begin
     _edtObservacaoInativacao.clear;
     _edtObservacaoInativacao.Visible:=false;
     idAlertaInativacao:=true;

    _edtObservacaoInativacao.Text:=GetObservacaoInativacaoBloqueio(nrProduto,'I');
    if trim(_edtObservacaoInativacao.Text)<>EmptyStr then
       _edtObservacaoInativacao.Visible:=true;
  end;
  //Mostrando observa??o de motivo Bloqueio de Compra
  if (FormatDateTime('dd/mm/yyyy',dtBloqueiodeCompra)<>'01/01/2039') and
      (dtBloqueiodeCompra>dtSistema) then
  begin

    _edtObservacaoInativacao.Text:=GetObservacaoInativacaoBloqueio(nrProduto,'B');
    if trim(_edtObservacaoInativacao.Text)<>EmptyStr then
       _edtObservacaoInativacao.Visible:=true;
  end;



 Application.ProcessMessages;
end;



function T_frmTelaCompras.FRecalculaCusto(PnrPedido:Integer):Boolean;
var
  idPosicao :TBookmark;
  nrMercadoria,nrDigitoMercadoria:Integer;
  vlLista,VlNota,vlDescontoCalculado,vlDescontoDigitado:Double;
  nomeColuna:String;
  nrVerba,
  nrDigitoProduto :Integer;
  idItemBonifiacado:Boolean;
begin

   _cdsPrePedido.First;
   _cdsPrecoItem:=GetListaPrecoLaboratorio(0, 1, 0, DadosPedidoAbertuta.nrFornecedor , PnrProduto,DadosPedidoAbertuta.cdEmpresa,idprecoAtual,dtSistema);
    if _cdsPrecoItem.active then
     _cdsPrecoItem.open;

   while not _cdsPrePedido.Eof do
   begin
      idBonificado:=false;
     qtdPedido:=_cdsPrePedido.FieldByName('QUAY_Y').AsInteger;
    if  (_cdsPrePedido.FieldByName('VCCI_Y').asfloat=0) and  (qtdPedido>0)then
    begin
       nrEmpresa          :=_cdsPrePedido.FieldByName('CD_EMPRESA').AsInteger;
       nrProduto          :=strtoint(copy(FormatFloat('00000000',_cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger),1,7));
       if _cdsPrePedido.FieldByName('QT_BONIFICADA').asfloat>0 then
           idbonificado:=true;

       nrDigitoMercadoria :=strtoint(copy(FormatFloat('00000000',_cdsPrePedido.FieldByName('CD_PRODUTO').AsInteger),8,1));
       Mercadoria:=GetMercadoriaNova(nrProduto,nrDigitoMercadoria,0,PcdEmpresa,DadosPedidoAbertuta.nrOperadorLogistico,'');
       pcDescontoAdicional:=_cdsPrePedido.FieldByName('DADY_Y').AsFloat;
       vlLista:=_cdsPrePedido.FieldByName('PFBY_Y').asfloat;
       nrVerba:=_cdsPrePedido.FieldByName('NRVV_Y').asINTEGER;
       VlNota := _cdsPrePedido.FieldByName('PUNY_Y').AsFloat;

       vlDescontoCalculado:= CalculaDescontoAdicional(vlLista,
                                                      vlNota,
                                                      0,
                                                      _cdsPrePedido.FieldByName('ABTY_Y').asfloat);

         precoLista := GetPrecoItemAlteraPedido(nrProduto,
                                                nrEmpresa,
                                                Mercadoria.vlPrecoVenda,
                                                 1,
                                                'S');
          vlPrecoLista:=precoLista.vlPrecoLista;

                  if vlDescontoCalculado>0 then
                    _cdsPrePedido.FieldByName('DADY_Y').asfloat:=vlDescontoCalculado;

                   if (_cdsPrePedido.FieldByName('PC_VERBA').AsFloat>=0) AND
                      (_cdsPrePedido.FieldByName('DADY_Y').AsFloat>0) then
                    begin
                     if _cdsPrePedido.FieldByName('NRVV_Y').AsInteger=0 then
                        nrVerba:=GetNumeroVerba(0,_cdsPedido.FieldByName('LABP_P').AsInteger)
                     else
                       nrVerba:=_cdsPrePedido.FieldByName('NRVV_Y').AsInteger ;

                       _cdsPrePedido.FieldByName('NRVV_Y').AsInteger:=nrVerba;
                      _cdsPrePedido.FieldByName('PC_VERBA').asfloat:=100;

                    end;
                   if (_cdsPrePedido.FieldByName('DADY_Y').AsFloat=0) AND (_cdsPrePedido.FieldByName('VCCI_Y').AsFloat>0) then
                   begin
                       _cdsPrePedido.FieldByName('NRVV_Y').AsInteger:=0;
                      _cdsPrePedido.FieldByName('PC_VERBA').asfloat:=0;
                   end;

                   idItemBonifiacado:=false;
                   if _cdsPrePedido.FieldByName('QT_BONIFICADA').AsInteger>0 then
                        idItemBonifiacado:=true;
                  idBonificado:= idItemBonifiacado;


        PrecoItem := CalculaPrecoLiquido(vlPrecoLista,
                                         Mercadoria.vlPrecoVenda,
                                         Mercadoria.pcRepasseCompra,
                                         Mercadoria.pcDescontoPadrao,
                                         pcDescontoAdicional,
                                         Mercadoria.pcCreditoICMS,
                                         Mercadoria.pcIpiProduto,
                                         precoLista.PcIPILista,
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

                   GravaItemPedido(PnrPedido, nrProduto, nrEmpresa, qtdPedido, pcDescontoAdicional,false);
           end;
                 {  AlteraItem(_cdsPedido.FieldByName('NROP_P').AsInteger,
                               nrMercadoria,
                               nrDigitoMercadoria,
                              _cdsPrePedido.FieldByName('QUAY_Y').AsInteger,
                              _cdsPrePedido.FieldByName('NRVV_Y').AsInteger,
                              _cdsPrePedido.FieldByName('CD_EMPRESA').AsInteger,
                              VlNota,_cdsPrePedido.FieldByName('ABTY_Y').asfloat,
                              vlDescontoDigitado,
                             _cdsPrePedido.FieldByName('PC_VERBA').asfloat,
                             idItemBonifiacado);}

     _cdsPrePedido.Next;
   end;
   idBonificado:=false;


end;


function T_frmTelaCompras.GetPrecoItemAlteraPedido(nrProduto,
                                                  cdEmpresa: Integer;
                                                  vlPrecoFornecedor,
                                                  pcDescontoAbatimento: double; IdPrecoAtual: Char): TListaPreco;
//var
// idprecoAtual:String[1];
begin
  //idprecoAtual:='N';
  with _cdsPrecoItem do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +
      inttostr(cdEmpresa);
    filtered := true;
    // Params.ParamByName()
  end;
  result.vlPrecoLista := vlPrecoFornecedor;
  result.nrListaPreco := 0;
  if not _cdsPrecoItem.IsEmpty then
  begin
    result.vlPrecoLista := _cdsPrecoItem.FieldByName('VL_BASE_COMPRA').AsFloat * pcDescontoAbatimento;
    result.pcReajustePreco := 0;
    result.nrListaPreco := _cdsPrecoItem.FieldByName('CD_LISTA_GAM').AsInteger;
    Result.PcIcmsCompra := _cdsPrecoItem.FieldByName('PC_ICMS_COMPRA').AsFloat;
    if IdPrecoAtual = 'N' then
    begin
      result.vlPrecoLista := _cdsPrecoItem.FieldByName('VL_LISTA_ANTERIOR').AsFloat * pcDescontoAbatimento;
      result.pcReajustePreco := _cdsPrecoItem.FieldByName('PC_MUDANCA_PRECO').AsFloat;
      result.nrListaPreco := _cdsPrecoItem.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.PcIcmsCompra := _cdsPrecoItem.FieldByName('PC_ICMS_COMPRA').AsFloat;
    end;
    if result.pcReajustePreco < 0 then
      result.pcReajustePreco := 0

  end;
end;



function T_frmTelaCompras.validaInclusaodItemPedido(PidPedidoCrossdocking:Boolean;PidItemCrossdocking:String):Boolean;
begin
 result:=true;
 if  (nrPedidoAlteracao>0)  then
 begin
  if (PidPedidoCrossdocking) and (PidItemCrossdocking='N') then
  begin
     Mensagem('Inclus?o de Item n?o permitida'+#13+
              ' pedido CrossDocking e item n?o ?  CrossDocking',MB_ICONWARNING);
     result:=false;
  end;
  if (not PidPedidoCrossdocking) and (PidItemCrossdocking='S') then
  begin
     Mensagem('Inclus?o de Item n?o permitida'+#13+
              ' pedido n?o ? CrossDocking e item ? CrossDocking',MB_ICONWARNING);
     result:=false;
  end;
 end;

end;

end.





