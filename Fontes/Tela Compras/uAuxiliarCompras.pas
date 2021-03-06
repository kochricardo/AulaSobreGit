unit uAuxiliarCompras;

interface

uses
  Classes,  forms, Dialogs, Messages,
  Windows,
  SysUtils,
   DB,
  dBClient,
  SqlExpr,
  uRotinasGenericas,
  // StdCtrls,
  Inifiles,
  VarUtils,
  strutils,
  Variants,
  ComObj,
  Printers,
  dateUtils,
  uSistemaCompras,
  uProduto,
  Graphics,
  ShellApi,
  Registry,
   Controls,
   StdCtrls, ComCtrls, Grids, DBGrids, Buttons, uDm  ;

type
  PedidoCrossdocking=record
  cdEmpresaCrossDockin,
  cdEmpresaDestino:Integer;
end;


Type
 TDadosVendaProduto = record
  qtVendaVenda,
  nrDias,
  nrDiasEstoqueZero,
  NrDiasFaturamento:Integer;
  vlMediaMes,
  vlMediaMesPrevisao,
  vlDesvioPadrao:Double;


 end;


type
  TDadosQtdadeSugestao = record
    nrQtdSugerida: Double;
    nrQtdSugeridaRejeitada: Double;
    nrDiasEstoque :Double;
    nrDiasEstoqueFuturo :Double;
    qtEstoqueSeguranca:Double;
    NrDiasInformado:Integer;



  end;
type
  TDadosMedia = record
    vlMediaMes: Double;
    vlMediaDia: Double;
    vlMediaDiaNova: Double;
    vlMediaMesNova: Double;
    vlDesvioPadrao: Double;
    stCalculo: String;
    stCalculoNovo: String;
    qtdPrevisaoCompra  :Integer;
  end;


type
 TCodigoValido = record
  nrCodigo     : Integer;
  nrDigito     : Integer;
 end;

type
  TDadosLeadTime = record
    vlLeadTime: Double;
    vlDesvioPadrao: Double;
  end;


type
 TLeadTimeFornecedor = record
  nrLeadTime               : Integer;
  nrLeadTimeTermolabil     : Integer;
 end;

type
 TDadosFrequencia = record
 nrFrequenciaCompra :Double;
 nrEstoqueMaximo    :Integer;
end;
type
 TDadosEstoqueCurva = record
 nrFrequenciaCompra :Double;
 nrEstoqueMaximo :Integer;
 nrEstoqueMInimo :Integer;
end;

type
  TDadosSugestaoCamadaPalete = record
    qtPedido:Integer;
    nrDiasComSugestao: Integer;

  end;


var
  nrDiasPrazo: array [1 .. 12] of INTEGER;
  nrCondicaoPagamento: INTEGER;

type
  TCondicaoPagamento = record
    nrDiasPrazo: array [1 .. 12] of INTEGER;
    nrCondicaoPagamento: INTEGER;
  end;

type
  TTotaLizaPedido = record
    vlPedidoBruto,
    vlPedidoLiquido,
    vlPedidoLista,
    vlPedidoCMV: Double;
    nrUnidadesPedido: INTEGER;

  end;

type
  TDadosPendenciaPedido = record
    QtPedido,
    qtAtendida,
    qtPendente,
    qtPendencia,
    qtEstoqueCrossdocking,
    qtTransito,
    qtProcessada :Integer;
    vlPedido,
    vlPendente:Double;


  end;


type
  TDadosDiasEstoque = Record
  nrComprador          :Integer;
  cdEmpresa            :Integer;
  nmLocal              :String;
  vlDiasEstoqueFornecedor     :Double;
  vlDiasEstoquecomprador      :Double;
  vlDiasEstoqueFornecedorPen     :Double;
  vlDiasEstoquecompradorPen      :Double;
end;

type
  TDadosComprador = Record
  nrComprador          :Integer;
  cdEmpresa            :Integer;
  nmCompradorReduzido  :String;
  nmComprador          :String;
  nmReduzido           :String;
  dsEmailCcomprador    :String;
  idAtivo: Char;
end;



type
  TDadosCapaPedido = record
    nrPedido,
    nrFornecedor,
    cdPagamento,
    nrEmpresa,
    nrOPeradorLogistico,
    nrCD: INTEGER;
    DataPedido, dtAgenda: Tdate;
    pcDescontoPadrao: Double;
    idStatusPedido: Char;
    dsObsevacao :String;
    pcGeracaoVerba:Double;
    nrGeracaoVerba:Integer;
    nrCdDestino:Integer;
    idCrossDocking:String;
    nrListaPrecoExcecao:Integer;
  end;

type
  TDadosItemPedido = record
    pcVerba,
    pcDescontoPadrao,
    pcDescontoAdicional: Double;
    nrMercadoria,
    nrEmpresa,
    nrQuantidadePedido,
    nrVerba: INTEGER;
    pcGeracaoVerba:Double;
    nr_pedido:Integer;
    idStatusItem:String;
    qtSugerida:Integer;
    idItemGravado :Boolean;


  end;
type
  TDadosValoresPedido = class(TObject)
  private
    FnrPedido: Integer;
    FvtPrecoCustoPedido: Double;
    FnrItensPedido: Integer;
    FnrTotalUnidadesPedido: Integer;
    FvtPrecoFornecedorPedido: Double;
    FnrFornecedor: Integer;
    FdtPedido: Tdate;
    FnrCondicaoPagamento: Integer;
    FcdEmpresa: Integer;
    FstObservacaoPedido: String;
    FnrOperadorLogistico: Integer;
    FpcDescontoPadrao: Double;
    FdtPrevistaChegada: Tdate;
    FdtAgendada: Tdate;
    FnrPedidoVinculado: Integer;
    FidStatusPedido: String;
    FnrVerba: Integer;
    FpcParaVerba: Double;
    FnrCompradorPedido: Integer;
    FidPedidoBonificado: Boolean;
    FnrDiasPrazo: Integer;
    FvtPrecoLiquido: Double;
    FstCNPJ: String;
    FpcGeracaoVerba: Double;
    FnrGeracaoVerba: Integer;
    FdBloqueiodeDigitacao: Integer;
    FstModoPedido: String;
    FidOperacaoRede: Boolean;
    FidPedidoOperacaoRede: Boolean;
    FstNomeFornecedor: String;
    FidPedidoCrossDocking: String;
    FcdEmpresaDestino: Integer;
    FnrListaPrecoExcecao: Integer;

    procedure SetnrItensPedido(const Value: Integer);
    procedure SetnrPedido(const Value: Integer);
    procedure SetnrTotalUnidadesPedido(const Value: Integer);
    procedure SetvtPrecoCustoPedido(const Value: Double);
    procedure SetvtPrecoFornecedorPedido(const Value: Double);
    procedure SetnrFornecedor(const Value: Integer);
    procedure SetdtPedido(const Value: Tdate);
    procedure SetnrCondicaoPagamento(const Value: Integer);
    procedure SetcdEmpresa(const Value: Integer);
    procedure SetstObservacaoPedido(const Value: String);
    procedure SetnrOperadorLogistico(const Value: Integer);
    procedure SetpcDescontoPadrao(const Value: Double);
    procedure SetdtPrevistaChegada(const Value: Tdate);
    procedure SetdtAgendada(const Value: Tdate);
    procedure SetnrPedidoVinculado(const Value: Integer);
    procedure SetidStatusPedido(const Value: String);
    procedure SetnrVerba(const Value: Integer);
    procedure SetpcParaVerba(const Value: Double);
    procedure SetnrCompradorPedido(const Value: Integer);
    procedure SetidPedidoBonificado(const Value: Boolean);
    procedure SetnrDiasPrazo(const Value: Integer);
    procedure SetvtPrecoLiquido(const Value: Double);
    procedure SetstCNPJ(const Value: String);
    procedure SetpcGeracaoVerba(const Value: Double);
    procedure SetnrGeracaoVerba(const Value: Integer);
    procedure SetdBloqueiodeDigitacao(const Value: Integer);
    procedure SetstModoPedido(const Value: String);
    procedure SetidOperacaoRede(const Value: Boolean);
    procedure SetidPedidoOperacaoRede(const Value: Boolean);
    procedure SetstNomeFornecedor(const Value: String);
    procedure SetidPedidoCrossDocking(const Value: String);
    procedure SetcdEmpresaDestino(const Value: Integer);
    procedure SetnrListaPrecoExcecao(const Value: Integer);

  Public
    property nrPedido                     :Integer read FnrPedido write SetnrPedido;
    property cdEmpresa                    :Integer read FcdEmpresa write SetcdEmpresa;
    property cdEmpresaDestino             :Integer read FcdEmpresaDestino write SetcdEmpresaDestino;


    property nrItensPedido                :Integer read FnrItensPedido write SetnrItensPedido;
    property nrFornecedor                 :Integer read FnrFornecedor write SetnrFornecedor;
    property nrCondicaoPagamento          :Integer read FnrCondicaoPagamento write SetnrCondicaoPagamento;
    property nrDiasPrazo                  :Integer read FnrDiasPrazo write SetnrDiasPrazo;
    property nrPedidoVinculado            :Integer read FnrPedidoVinculado write SetnrPedidoVinculado;
    property nrCompradorPedido            :Integer read FnrCompradorPedido write SetnrCompradorPedido;
    property nrOperadorLogistico          :Integer read FnrOperadorLogistico write SetnrOperadorLogistico;
    property dtPedido                     :Tdate   read FdtPedido write SetdtPedido;
    property dtPrevistaChegada            :Tdate   read FdtPrevistaChegada write SetdtPrevistaChegada;
    property dtAgendada                   :Tdate   read FdtAgendada write SetdtAgendada;
    property nrTotalUnidadesPedido        :Integer read FnrTotalUnidadesPedido write SetnrTotalUnidadesPedido;
    property vtPrecoFornecedorPedido      :Double  read FvtPrecoFornecedorPedido write SetvtPrecoFornecedorPedido;
    property vtPrecoCustoPedido           :Double  read FvtPrecoCustoPedido write SetvtPrecoCustoPedido;
    property vtPrecoLiquido               :Double  read FvtPrecoLiquido write SetvtPrecoLiquido;
    property pcDescontoPadrao             :Double  read FpcDescontoPadrao write SetpcDescontoPadrao;
    property pcParaVerba                  :Double  read FpcParaVerba write SetpcParaVerba;
    property nrVerba                      :Integer read FnrVerba write SetnrVerba;
    property stObservacaoPedido           :String  read FstObservacaoPedido write SetstObservacaoPedido;
    property idStatusPedido               :String  read FidStatusPedido write SetidStatusPedido;
    property stCNPJ                       :String  read FstCNPJ write SetstCNPJ;
    property stModoPedido                 :String  read FstModoPedido write SetstModoPedido;
    property idPedidoBonificado           :Boolean read FidPedidoBonificado write SetidPedidoBonificado;
    property idOperacaoRede               :Boolean read FidOperacaoRede write SetidOperacaoRede;
    property idPedidoOperacaoRede         :Boolean read FidPedidoOperacaoRede write SetidPedidoOperacaoRede;
    property pcGeracaoVerba               :Double  read FpcGeracaoVerba write SetpcGeracaoVerba;
    property nrGeracaoVerba               :Integer  read FnrGeracaoVerba write SetnrGeracaoVerba;
    property idBloqueiodeDigitacao        :Integer  read FdBloqueiodeDigitacao write SetdBloqueiodeDigitacao;
    property stNomeFornecedor             :String  read FstNomeFornecedor write SetstNomeFornecedor;
    property idPedidoCrossDocking         :String  read FidPedidoCrossDocking write SetidPedidoCrossDocking;
    property nrListaPrecoExcecao          :Integer  read FnrListaPrecoExcecao write SetnrListaPrecoExcecao;

  protected
  end;
type
  TDadosCD = class(TObject)
  private
    FstCEP: String;
    FnrEANCD: String;
    FnrCD: Integer;
    FstCIDADE: String;
    FstENDERECO: String;
    FstEstado: String;
    FdsRazaoSocial: String;
    FnrLogradouro: sTRING;
    FstBAIRRO: String;
    FnrCNPJ: String;
    FnmCD: String;
    FnrInscricaoMunicipal: String;
    FnrInscricaoEstadual: String;
    procedure SetdsRazaoSocial(const Value: String);
    procedure SetnrCD(const Value: Integer);
    procedure SetnrCNPJ(const Value: String);
    procedure SetnrEANCD(const Value: String);
    procedure SetnrLogradouro(const Value: String);
    procedure SetstBAIRRO(const Value: String);
    procedure SetstCEP(const Value: String);
    procedure SetstCIDADE(const Value: String);
    procedure SetstENDERECO(const Value: String);
    procedure SetstEstado(const Value: String);
    procedure SetnrInscricaoEstadual(const Value: String);
    procedure SetnrInscricaoMunicipal(const Value: String);
    procedure SetnmCD(const Value: String);
    Public
      property nrCD                        :Integer read FnrCD write SetnrCD;
      property nmCD                        :String  read FnmCD write SetnmCD;
      property dsRazaoSocial               :String  read FdsRazaoSocial write SetdsRazaoSocial;
      property nrCNPJ                      :String  read FnrCNPJ write SetnrCNPJ;
      property nrEANCD                     :String read FnrEANCD write SetnrEANCD;
      property stEstado                    :String read FstEstado write SetstEstado;
      property stCIDADE                    :String read FstCIDADE write SetstCIDADE;
      property stBAIRRO                    :String read FstBAIRRO write SetstBAIRRO;
      property stENDERECO                  :String read FstENDERECO write SetstENDERECO;
      property stCEP                       :String read FstCEP write SetstCEP;
      property nrLogradouro                :STRING read FnrLogradouro write SetnrLogradouro;
      property nrInscricaoEstadual         :String read FnrInscricaoEstadual write SetnrInscricaoEstadual;
      property nrInscricaoMunicipal        :String read FnrInscricaoMunicipal write SetnrInscricaoMunicipal;

   protected
end;



function CalculaDescontoAdicional(vlPrecoLista, vlLiquido, pcRepasse,
  pcDescontoPadrao: Double): Double;
function Arredondar(Valor: Double; Dec: INTEGER): Double;

function GeraNumeroPedido(idTipoPedido: String): INTEGER;
function AbreItemPedidoMultiEmpresa(nrPedido, nrMercadoria, cdEmpresa: INTEGER;
  idSituacao: String): Boolean;

Function GetsituacaoNfe(PnrPedido,PnrProduto,PnrCd:Integer):boolean;
Function AlteraStatusItemPedido(PnrPedido,PnrProduto,PnrEmpresa:Integer;PnnLogin:String):boolean;
function AJustaDataPedido(dtPedido: Tdate;DiaPedido, DiaSemana: INTEGER): Tdate;
function MostraDiaPedido(stDiaspedido: String): String;
function TransformaStringCodigo(PstCodigo:String):TCodigoValido;
function DiasEstoqueFinanceiroAtual(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TDadosDiasEstoque;
function AbreEspecealidadeFornecedor(PnrFornecedor:Integer):TClientDataset;
Function SetQuantidadePaleteCamada( PqtPedido,
                                    PqtEmbalagem,
                                    PqtCamada,
                                    PqtPalete:Integer;
                                    PDiasEstoqueMaximo:Double;
                                    PquantidadeEstoquePendencia: Integer;
                                    PvlMediaDia,
                                    PpedidoEspecial:Double;
                                    PnrFrequenciaCompra:Double;
                                    PidCurva:String;
                                    PQtdPendencia,
                                    PQtdEstoqueSeguranca:Integer): TDadosSugestaoCamadaPalete;

function AlteraPrazoItemPedido(PnrPedido,PnrDias: INTEGER): Boolean;

function AbreProdutosFornecedorFornecedor(PnrFornecedor:Integer):TClientDataset;

function SetTabelaListaVerba(PTabela:TclientDataset):TclientDataset;
FUNCTION GetListaPrecoBUsca(vlPrecoFornecedor,
                            PpcDescontoAbatimento: Double;
                            NrListaPreco,
                            nrLaboratorio,
                            nrProduto,
                            nrEmpresa: INTEGER;
                            idPrecoAtual: String;
                            dtPedido: Tdate): TListaPreco;


function CalculaPrecoLiquido(Precofabrica,
                             PrecoVenda,
                             PcDescontoRepasse,
                             pcDescontoPadrao,
                             pcDescontoAdicional,
                             pcCreditoICMS,
                             pcIPI,
                             pcIPIListaPreco,
                             PpcMundancaPreco: Double;
                             qtPedido,
                             cdListaPreco: INTEGER;
                             IdAcumulaDesconto,
                             idForcaRepasse,
                             idIpiLiquidoComRepasse,
                             idIpiLiquidoSemRepasse,
                             idIpiBrutoComRepasse,
                             idIpiBrutoSemRepasse,
                             idTipoLista,
                             idUnidadeFederacao,
                             idSuperfluo,
                             idIcmDestacado,
                             idReduzIcms,
                             idPisConfins: STRING): TCalculoPreco;
Function DefineAliquotaICMS(idUF: String;
  idSuperfluo, IdFornecedorDestacaIcms: Char): Double;
Function VerificaReduzBCIcms(idReduzIcms, idIcmsDestacado, idSuperfulo,
  idTipoLista: String): Boolean;
Function PcRedutorBaseCalculo(idUF, idSuperfulo, idTipoLista,
  IdFornecedorDestacaIcms: String): Double;
function CalculaPreco(precoFornecedor,
                      pcRepasse,
                      pcDescontoPadrao,
                      pcDescontoAdicinal: Double;
                      idAcumulativo: String;
                      PvlPrecoBase,
                      PpcIcmsCompra:Double): Double;
function AbreCapaPedido(nrPedido, nrLaboratorio: INTEGER; idSituacao: String): TDadosCapaPedido;
FUNCTION GetListaPrecoLaboratorio(vlPrecoFornecedor, pcDescontoAbatimento
  : Double; NrListaPreco, nrLaboratorio, nrProduto, nrEmpresa: INTEGER;
  idPrecoAtual: String; dtPedido: Tdate): TClientDataSet;
Function DiasUtilDoMes:Integer;
Function DiasFaturamento:Integer;
Function GetNrItenValidoPedido(PnrPedido:Integer):Integer;
function EliminaItemQuantidadeZerada(PnrPedido:INTEGER): Boolean;
Function GetCodigoDun14(PnrProduto,PnrCd: INTEGER): String;
function GetOPeracaoLogistica(nrFornecedor: INTEGER): INTEGER;
function nrParcelaPedido(nrCondicao: INTEGER): TCondicaoPagamento;
function SetDataAgenda(cdGrupoFornecedor: INTEGER;
  dtAgenda, dtProximoPedido: Tdate): Boolean;
function runCalculoMargem(AliquotaIcms: Double; FamiliaProduto: INTEGER;
  { CMCM_M 1- medicamrnto 2- perfumaria }
  nrProduto,PnrFornecedor: INTEGER; idPisConfins: Char;
  vlCusto_mais_vlVerbaUnitario: Double;PnrOPeradorLogistico:Integer): Double;
function AbrePrecoListaAtiva(PnrLista:Integer):TClientDataSet;
function DiasdeCompra(stEntrada: String): String;
function RestricaoDeCompra(PnrProduto:Integer):Boolean;
function GetObservacaoInativacaoBloqueio(PnrProduto : Integer;PidTipo:String):WideString;
Function GetCriticaPedidoOPeracaoRede(PnrOperacao,PnrEmpresa:Integer):TClientDataSet;
Function GeraTabelaProdutoFornecedor(PnrFornecedor,PnrComprador,PnrCD:Integer):TClientDataSet;
function GetStatusNfe(PnrPedido, PnrProduto: Integer): Boolean;
Function CarregaEmpresaLogica(PcdEmpresaFisica:Integer):Integer;
Function CarregaEmpresaFisica(PcdEmpresaLogica:Integer):Integer;


function AlteraPrazoPedido(PnrPedido,PcdPrazo,PnrDias: INTEGER;PdtFaturamento,PdtPrevisao:Tdate): Boolean;
function TestaItemInativo(PnrPedido,PnrMercadoria,PnrEmpresa: Integer):Boolean;
function AtualizaEmpresaLogicaPedido(PnrPedido,PcdEmpresaLogica,PcdOperacaoRede: INTEGER;PidCrossDocking:String): Boolean;
function AtivaCapaPedidoAnalise(PnrPedido:Integer;PStatusDe,PidStatusPara,Pnmusuario: String ): Boolean;


function InsereObservacao(PidTipo: String;
                         PnrCliente,
                         PnrSequencia: Integer;
                         PdsObservacao: String;
                         PdtObserva??o,
                         PdtLancamento: Tdate;
                         PnmUsuario,
                         PidSituacao: String;
                         vlLancamento: Double): boolean;

function GetPedidoPsicotropico(PnrPedido:Integer):boolean;
function ListaVerbaFornecedor(PnrFornecedor:Integer):TClientDataSet;
function PedidoAlimentar(PnrFornecedor:Integer): Boolean;


(* ****************************************************** *)
{$REGION 'Insere Capa  Pedido'}
function GravaCapaPedido(PNROP_P, // NUMBER(6)
  PLABP_P: INTEGER; // NUMBER(6)
  PDATP_P: Tdate; // DATE
  PABTP_P, // NUMBER(5,2)
  PDESP_P: Double; // NUMBER(5,2)
  PSITP_P: String; // CHAR(1)
  PPRZP_P: INTEGER; // NUMBER(3)
  PPREP_P: Tdate; // DATE
  POBSP_P, // CHAR(40)
  PSNRP_P: String; // CHAR(10)
  PFLAP_P, // NUMBER(1)
  PNR_CONDICAO_PAGTO_P: INTEGER; // NUMBER(6)
  PNM_USUARIO: String; // NOT NULL VARCHAR2(10)
  PDT_FECHAMENTO_PEDIDO, // NOT NULL DATE
  PDT_PREVISTA_FATURAMENTO: Tdate; // NOT NULL DATE
  PID_CIF_FOB: String; // NOT NULL VARCHAR2(1)
  PCD_OPERADOR_LOGISTICO: INTEGER; // NOT NULL NUMBER(6)
  PNM_MAQUINA: String; // NOT NULL VARCHAR2(20)
  PDT_AGENDAMENTO_PEDIDO: Tdate; // NOT NULL DATE
  PDT_DIGITACAO: Tdate; // DATE
  PQT_PALETE, // NOT NULL NUMBER(15,6)
  PQT_CAIXA: Double; // NOT NULL NUMBER(15,6)
  PDT_TRANSMITIDO: Tdate;
  PCD_COMPRADOR: INTEGER;
  PCD_EMPRESA: INTEGER;
  PCD_PEDIDO_RELACIONADO:INTEGER;
  PPC_GERACAO_VERBA:Double;
  PNR_GERACAO_VERBA,
  PNR_DIAS_INFORMADO,
  PNR_CD_DESTINO:Integer;
  PID_CROSSDOCKING:STRING;
  PCD_OPERACAO_REDE:Integer;
  PnrListadePrecoExcecao:Integer): Boolean;
{$ENDREGION 'Insere Capa  Pedido'}
(* ****************************************************** *)
//function setBonificaPedido(nrPedido,nrVerba:Integer):boolean;
(* ****************************************************** *)

function AtualizaCapaPedido(PnrPedido,
                            PcdCondicaoPagamento,
                            PcdOperadorLogistico: INTEGER;
                            Pleadtime: Double;
                            PidStatusPedido,
                            PdsObservacao: String;
                            PidAtualizaagenda:Boolean;
                            PdtPrevisaoFaturamento,
                            PdtAgenda,
                            PdtProximaAgenda: Tdate;
                            PnrDiasEstoqueComprador,
                            PnrverbaGeracao:Integer;
                            PidBonificado:boolean;
                            PnrListaPrecoExcecao:Integer): Boolean;
(* ****************************************************** *)
function AtualizaDataTransmissao(PnrPedido,PnrLaboratorio,PnrCD:Integer):Boolean;
(* ****************************************************** *)
function setCondicaoPagamento(nrParcela,nrDias:Integer;pcParcela,vlParcela:Double;dtPagamento:TDATE):Boolean;
Function CriaDataSetPrazo:TclientDataset;
FUNCTION getPrazoPedido(nrPedido,nrcondicao:Integer):String;
Function GeraTabelaItensPedidos(nrPedido:Integer):TClientDataSet;
procedure Imprimir(PnrPedido:Integer;PidPrecoCusto,PidPercentualDesconto:Char);
Procedure GerarExcelPedido(PnrPedido:Integer;PidPrecoCusto,PidPercentualDesconto:Char);
Function setBonificaPedido(nrPedido,nrProduto,nrVerba:Integer):Boolean;
function GetValoresPedidoItensPsicotropico(nrPedido:Integer):TDadosValoresPedido;
function GetValoresPedidoItensCrossDocking(nrPedido:Integer):TDadosValoresPedido;

function GetIdSeparaPsicotropico(PnrPedido:Integer):boolean;
function GetIdSeparaCrossDocking(PnrPedido:Integer):boolean;

Function SetNumeroPedidoRelacionado(nrPedido,nrPedidoRelacionado:Integer):Boolean;
Function SetItensPedidoRelacionado(nrPedido,nrPedidoRelacionado,PnrOPeradorLogistico:Integer):Boolean;
Function SetItensPedidoCrossDocking(nrPedido,nrPedidoRelacionado,PnrOPeradorLogistico,PcdEmpresaPedido,PcdEmpresaDestino:Integer):Boolean;

function SeparaPedidoPsicotropico(Pnrpedido,PnrOperadorLogistico:Integer;
                                  PnrLeadTime:Double;PnrDiasEstoqueComprador:Integer;
                                  PdtPedido:Tdate;
                                  PidBonificado:Boolean;
                                  Pnrverba:Integer;
                                  PnrListaPrecoExcecao:Integer):Boolean;
function SeparaPedidoCrossDocking(Pnrpedido,PnrOperadorLogistico:Integer;PnrLeadTime:Double;
                                 PnrDiasEstoqueComprador:Integer;
                                 PdtPedido:Tdate;
                                 PidBonificado:boolean;
                                 PnrVerba:Integer):Boolean;

function GetPendenciaFornecedor(nrFornecedor,nrEmpresa: Integer):TClientDataSet;
function AbrePendenciaLaboratorioNova(nrLaboratorio: Integer): TClientDataSet;
function SetCurvaProduto(nrProduto,cdEmpresa:Integer;idCurva,idInativa:String):Boolean;
function getUltimoDesconto(PnrFornecedor,PnrProduto,PcdEmpresa,PcdOperadorLogistico:Integer):Double;
FUNCTION GetListaTipoProduto(PnrClassificaoEstrutura:Integer): TClientDataSet;
FUNCTION GetListaSubTipoProduto(PnrClassificaoEstrutura:Integer;stSubTipo:String): TClientDataSet;
FUNCTION GetListaCategoria(PnrClassificaoEstrutura:Integer;stCategoria:String): TClientDataSet;
function SetTabelaDiasEstoque(PTabela:TClientDataSet):TClientDataSet;
FUNCTION GetProdutoPorClassificacao(PnrProduto,
                                    PnrFornecedor,
                                    PnrComprador,
                                    PnrCD:Integer;
                                    stFiltroTipo,
                                    stFiltroSubTipo,
                                    StFiltroCategoria:String):TClientDataSet;
function GetListaSaldoVerba(PnrVerba,PnrFornecedor,PnrComprador: Integer):TClientDataSet;
function GetProdutosOl(PnrOPerador,PnrEmpresa: Integer):TClientDataSet;
function GetVendaProdutosComparacao(PnrCD,PnrFornecedor: Integer):TClientDataSet;
function GetCriticaDivergenciaQuantidade(PnrComprador: Integer):TClientDataSet;
function GetUltimosPrecos(PnrProduto,PnrCD:Integer;PdtInicial,PdtFinal:Tdate):TClientDataSet;
Function DadosVendaMes(PnrFornecedor,PnrProduto,PcdCDFisico: Integer):TClientDataSet;
Function DadosEntradaUltimosMeses(PnrFornecedor,PnrProduto,PcdCDFisico: Integer):TClientDataSet;
Function DadosPedidosUltimosMeses(PnrFornecedor,PnrProduto,PcdCDFisico: Integer):TClientDataSet;
Function AbrePendenciaComprador(PnrFornecedor,
                                PnrComprador,
                                PnrCD,
                                PnrPedido,
                                PnrProduto: Integer;
                                PidItemEmTransito,
                                PidNaoFaturados:Boolean;
                                PnrOPeracaoRede:Integer):TClientDataSet;
Function AbrePendenciaCompradorSugestao(PnrFornecedor,PnrComprador,PnrCD: Integer):TClientDataSet;
Function AbreNivelServico(PnrFornecedor,PnrComprador,PnrCD: Integer;idAgrupaCD,idAgrupaFornecedor:String):TClientDataSet;
Function DiasVendaPeriodo:TClientDataSet;
procedure AtualizaEvento(PnrPedido,PcdEvento:Integer;idStatusPedido,nmUsuaio,msg:String);
function TestaItemJaFaturado(PnrPedido,PnrProduto,PnrEmpresa: Integer):boolean;
function CarregaPedidoSemEventos:TClientDataSet;
function AtualizaDataTransmissaoEventePedido(PnrPedido,PnrLaboratorio,PnrCD:Integer):Boolean;
Function AbreNivelServicoII(PnrFornecedor,PnrComprador,PnrCD: Integer;idAgrupaCD,idAgrupaFornecedor:String):TClientDataSet;
//function SetInativacaoFuturaProduto(nrProdut:Integer;PidStatus:String):Boolean;
function SetInativacaoFuturaProduto(PnrProduto,PnrCD:Integer;PdtInativacao:Tdate):Boolean;
function SetBLoqueioProduto(PnrProduto,PnrCD:Integer;PdtInativacao:Tdate):Boolean;
function MotivosMudancaCurva(PidTipo:String):TClientDataSet;
function getMotivosMudancaCurva(PidTipo,PdsMotivo:String):TClientDataSet;
function InsertMotivosMudancaCurva(PidTipo,PdsMotivo:String;PcdMotivo:Integer):Boolean;
function GravaTabelaPrazo(PnrParcela,PnrDiasPrazo,PnrCondicao:Integer):boolean;
function GetMontaTabelaPrazo(nrCondicao: INTEGER): TClientDataSet;
function NumeroTemporarioAuditoria(PnrComprador:Integer):Integer;
function GetFrequenciaEstoqueMaximo(PnrGrupoFornecedor:Integer):TDadosFrequencia;
function AbreIndiceFalta(PnrFornecedor:Integer):TClientDataset;

function DiasEstoqueFinanceiro(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
function DiasEstoqueFinanceiroEST(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
function DiasEstoqueFinanceiroESTII(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
//function PedidosDataFaturamentoAtrasada(PnrComprador:Integer):TClientDataSet;

function TabelaLeadTimeTermolabil(PnrFornecedor:Integer):TClientDataset;

function GetPrecoListaAtiva(PnrLista,PnrCD,PnrProduto:Integer):TListaPrecoAtiva;
Function AtualizaStatusOPeracao(PnrEmpresa,PnrRede:Integer;PnmArquivo:String):boolean;
Function AbreGradeProduto(PnrFornecedor,PnrCD: Integer):TClientDataSet;
function GetNetStation(Tipo:Integer) : string;
function CaptureScreenRect(ARect: TRect): TBitmap;
function EnviaErroaoSuporte(Para, CC, Mensagem: String):Boolean;
function ExecutaPontoEncomenda(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
function Pendencia(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
function AbreDadosComprador(PnrComprador:Integer):TDadosComprador;
function GetCompradores(PnrComprador:Integer):TClientDataSet;
function GetTabelaMercadoria(PnrFornecedor ,PcdOperadorLogistico: Integer): TClientDataset;
Function GetTabelaQuantidadeEmbalagem(PnrFornecedor: Integer): TClientDataSet;
function GetTabelaLaboratorio(PnrFornecedor: Integer): TClientDataSet;
function DataUltimaCompraII(PnrFornecedor:Integer):TClientDataSet;
function VerificaItensFaturados(PnrPedido:Integer):Boolean;
Function AbreVendaLaboratorioMultiEmpresaAtual(PnrLaboratorio,
                                          PnrEmpresa,
                                          PnrOperadorLogistico: Integer): TClientDataSet;

function AtivaCapaPedido(PnrPedido,PcdOperadorLogistico,PnrLeadtime: INTEGER; PidStatusPedido: String;PidBonificado:Boolean;Pnrverba:Integer): Boolean;
function AtivarItemPedido (PnrPedido,PnrProduto,PnrEmpresa: INTEGER;PidStatusItem,PnmLogin: String): Boolean;
//AtivarItemPedido(PnrPedido,PnrProduto: INTEGER;PidStatusItem: String): Boolean;
function ProximoItemPedido(PnrPedido:Integer):Integer;

function DiasEstoqueFinanceiroNovaTabela(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
Function CalculaNrDiasEstoque(PqtdSugerida,
                              PnrQuantidadeEstoque,
                              PnrQuantidadaPendente,
                              Pnrlotecompra:Integer;
                              PvlMediaDiaria:Double ):Integer;

function VerificaProdutoVinculado(PnrProduto,PnrEmpresa,PnrOperacaoRede:Integer):boolean;

function AtualizaStatusPedidoNovo(PnrPedido,
                                  PcdPagamento,
                                  PnrOperadorLogistico,
                                  PnrLeadTime:Integer;
                                  PidStatusPedido,
                                  PStObservacao:String;
                                  PidAtualizaAgenda:Boolean;
                                  PdtPrevisatFaturamento,
                                  PdtAgenda,
                                  PdtProximaAgenda:Tdate;
                                  Pidbonificado:boolean;
                                  PnrVerba:Integer):Boolean;


Function GetDadosLaboratorioComprador(PnrComprador,PnrFornecedor: Integer): TDadosFornecedor;
function GetLembreteFornecedor(PnrFornecedor: Integer;PdtValidade:Tdate):Boolean;
function VendaCanalOperador(PnrFornecedor:Integer):TClientDataset;
Function GetNumeroVerba(PnrVerba,PnrLaboratorio:Integer):Integer;

Function GeraTabelaProdutoReservaVencidos(PnrFornecedor,PnrComprador,PnrCd:Integer;
                                                          PidReservaPedido,
                                                          PidReservaVencido,
                                                          PidReservaAvaria,
                                                          PidReservaBloqueado:Boolean):TClientDataSet;

Function GeraTabelaProdutoPossibilidadedeVencimemto(PnrFornecedor,PnrComprador,PnrCd:Integer):TClientDataSet;

Function AbrePedidosCompradorNovo(PnrComprador,
                               PnrFornecedor:Integer;
                               PidSituacao:String;
                               PcdSituacao:Integer;  // 0 - Todos 1 - Faturados 2 Novos 3 - Novos/Faturados/Pendentes
                               PdtInicio,PdtFinal:TDateTime;
                               PcdOperacaoRede:Integer):TClientDataSet;

function SugestaoPossivel(PnrQtdadeEmbalagem: Integer;
                          PnrQtdadeIdeal: Double): Integer;


FUNCTION ZeraItemPedido(PnrPedido,
                        PnrProduto,
                        PnrEmpresa,
                        Pquantidade:Integer):Boolean ;

function AlteraNumeroPedido(PnrPedido,PnrPedidoOld: INTEGER): Boolean;
function EliminaItemPedidoZerado(nrPedido:Integer): Boolean;
function AtualizaItemPedidoInicio(PnrPedido,
                                  PnrProduto,
                                  PnrQuantidadePedido,
                                  PnrQuantidadeChegou,
                                  PnrPrazoItem,
                                  PnrVerba,
                                  PnrQuantidadeBonificada,
                                  PnrCodigoOperadorLogistico,
                                  PnrDiasEstoque,
                                  PnrQuantidadeSugerida: INTEGER;
                                  PIdStatusItem,
                                  PidMargem,
                                  PidDescontoAcumulativo: String;
                                  PpcDescontoPadrao,
                                  PpcDescontoAdicional,
                                  PpcDescontoFinanceiro,
                                  PpcVerba,
                                  PpcBonificacao,
                                  PpcDescontoOL,
                                  PvlPrecoUnitario,
                                  PvlPrecoFabrica,
                                  PvlPrecoCusto,
                                  PvlMargemPadrao,
                                  PvlMargemNegociada,
                                  PvlVerba,
                                  PvlMediaVenda: Double;
                                  PnmTelaAlteracao:String;
                                  PcdEmpresa:Integer;
                                  PpcICMSCOMPRA:Double;
                                  PcdListaCOMPRA:Integer;
                                  PidAtualizaDesconto:Boolean;
                                  PnrComprador:integer;
                                  PpcICMSVENDA:Double): Boolean;
function DadosItemPedidoAtual(PnrPedido, PnrMercadoria,PnrEmpresa,PcdEmpresaCross: Integer): TDadosItemPedido;
function CorrigeSituacaoCrossdocking: Boolean;
function CorrigeoPERADORlOGISTICO: Boolean;
function CancelaListaPrecoExcecao(PcdLista: INTEGER): Boolean;
function DadosParamentoCompras(PnrSequencia,PnrGrupoFornecedor,PnrEmpresa,PcdOperadorLogistico: INTEGER):TClientDataSet;
function NrParamentoCompras(PnrGrupoFornecedor,PcdOperadorLogistico: INTEGER):Integer;
function IsValidEmail(const Value: string): Boolean;
function AbreAgendaLaboratorio(PnrComprador:Integer):TClientDataSet;
function DadosEmAnaliseApi(PnrComptrador,PnrEmpresa: INTEGER):TClientDataSet;

function GravaLogItemPedido(NROP_Y, // NUMBER(6)
  NROM_Y, // NUMBER(6)
  QUAY_Y, // NUMBER(7)
  CHEY_Y: INTEGER; // NUMBER(7)
  ABTY_Y: Double; // NUMBER(5,2)
  SITY_Y: String; // CHAR(1)
  PRZY_Y: INTEGER; // NUMBER(3)
  PUNY_Y, // NUMBER(17,6)
  PFBY_Y, // NUMBER(17,6)
  DADY_Y, // NUMBER(5,2)
  DFIY_Y, // NUMBER(5,2)
  VCCI_Y: Double; // NUMBER(17,6)
  NRVV_Y: INTEGER; // NUMBER(6)
  VL_MARGEM_PADRAO, // NOT NULL NUMBER(13,2)
  VL_MARGEM_NEGOCIADA: Double; // NOT NULL NUMBER(13,2)
  ID_MARGEM, // CHAR(1)
  ID_DESCONTO_ACUMULATIVO: String; // VARCHAR2(1)
  PC_VERBA, // NUMBER(5,2)
  VL_VERBA: Double; // NUMBER(13,2)
  QT_BONIFICADA: INTEGER; // NOT NULL NUMBER(6)
  PC_BONIFICACAO, // NOT NULL NUMBER(5,2)
  PC_DESCONTO_OL: Double; // NOT NULL NUMBER(5,2)
  NR_OPERADOR_LOGISTICO, // NOT NULL NUMBER(6)
  NR_DIAS_ESTOQUE, // NUMBER(3)
  QT_SUGERIDA: INTEGER; // NUMBER(7)
  VL_MEDIA_VENDA: Double; // NUMBER(13,2)
  CD_LISTA_COMPRA: INTEGER; // NUMBER(6)
  PC_MUDANCA_PRECO: Double;
  CD_EMPRESA:Integer;
  Ppc_ICMS_Compra:Double): Boolean; // NUMBER(7,4)

(* ****************************************************** *)


(* ****************************************************** *)
{$REGION 'Insere Item Pedido'}
(* ****************************************************** *)
function GravaItemPedidoAtual(NROP_Y, // NUMBER(6)
  NROM_Y, // NUMBER(6)
  QUAY_Y, // NUMBER(7)
  CHEY_Y: INTEGER; // NUMBER(7)
  ABTY_Y: Double; // NUMBER(5,2)
  SITY_Y: String; // CHAR(1)
  PRZY_Y: INTEGER; // NUMBER(3)
  PUNY_Y, // NUMBER(17,6)
  PFBY_Y, // NUMBER(17,6)
  DADY_Y, // NUMBER(5,2)
  DFIY_Y, // NUMBER(5,2)
  VCCI_Y: Double; // NUMBER(17,6)
  NRVV_Y: INTEGER; // NUMBER(6)
  VL_MARGEM_PADRAO, // NOT NULL NUMBER(13,2)
  VL_MARGEM_NEGOCIADA: Double; // NOT NULL NUMBER(13,2)
  ID_MARGEM, // CHAR(1)
  ID_DESCONTO_ACUMULATIVO: String; // VARCHAR2(1)
  PC_VERBA, // NUMBER(5,2)
  VL_VERBA: Double; // NUMBER(13,2)
  QT_BONIFICADA: INTEGER; // NOT NULL NUMBER(6)
  PC_BONIFICACAO, // NOT NULL NUMBER(5,2)
  PC_DESCONTO_OL: Double; // NOT NULL NUMBER(5,2)
  NR_OPERADOR_LOGISTICO, // NOT NULL NUMBER(6)
  NR_DIAS_ESTOQUE, // NUMBER(3)
  QT_SUGERIDA: INTEGER; // NUMBER(7)
  VL_MEDIA_VENDA: Double; // NUMBER(13,2)
  CD_LISTA_COMPRA: INTEGER; // NUMBER(6)
  PC_MUDANCA_PRECO: Double;
  CD_EMPRESA:Integer;
  Ppc_ICMS_Compra,
  PPCIPILista,
  PPC_REPASSE,
  PVL_PRECO_FABRICA,
  PPC_ICMS_VENDA,
  PPC_CREDITO_ICMS_LISTA:Double;
  PnrDiasInformado:Integer;
   PvlCustoGerencial:Double): Boolean; // NUMBER(7,4)

{$ENDREGION 'Insere Item Pedido'}
(* ****************************************************** *)

(* ****************************************************** *)
{$REGION 'Atualiza Item Pedido'}
(* ****************************************************** *)
function LocalizaItemPedido(PnrPedido,
                            PnrMercadoria,
                            PnrEmpresa: INTEGER): TDadosItemPedido;

(* ****************************************************** *)

{ function GravaItemPedido(nrPedido,nrProduto,nrQuantidadePedido,nrQuantidadeChegou,
  nrPrazoItem,nrVerba,nrQuantidadeBonificada,nrCodigoOperadorLogistico,
  nrDiasEstoque,nrQuantidadeSugerida:Integer;
  idStatusItem,idMargem,idDescontoAcumulativo:String;
  pcDescontoPadrao,pcDescontoAdicional,pcDescontoFinanceiro,
  pcVerba,pcBonificacao,pcDescontoOL,vlPrecoUnitario,vlPrecoFabrica,
  vlPrecoCusto,vlMargemPadrao,vlMargemNegociada,vlVerba,
  vlMediaVenda:Double):Boolean; }
  function AtualizaItemPedido(PnrPedido,
                            PnrProduto,
                            PnrQuantidadePedido,
                            PnrQuantidadeChegou,
                            PnrPrazoItem,
                            PnrVerba,
                            PnrQuantidadeBonificada,
                            PnrCodigoOperadorLogistico,
                            PnrDiasEstoque,
                            PnrQuantidadeSugerida: INTEGER;
                            PIdStatusItem,
                            PidMargem,
                            PidDescontoAcumulativo: String;
                            PpcDescontoPadrao,
                            PpcDescontoAdicional,
                            PpcDescontoFinanceiro,
                            PpcVerba,
                            PpcBonificacao,
                            PpcDescontoOL,
                            PvlPrecoUnitario,
                            PvlPrecoFabrica,
                            PvlPrecoCusto,
                            PvlMargemPadrao,
                            PvlMargemNegociada,
                            PvlVerba,
                            PvlMediaVenda: Double;
                            PnmTelaAlteracao:String;
                            PcdEmpresa:Integer;
                            PpcCreditoICMS:Double;
                            PcdListaCOMPRA:Integer;
                            PidAtualizaDesconto,
                            PidPedidoBonificado :Boolean;
                            PPcIcmsCompraLista:Double;
                            PnrDasInformado:Integer;
                            PvlPrecoBase:Double): Boolean;

function EliminaItemPedido(nrPedido, nrProduto: INTEGER;
  idStatusItem: String): Boolean;
function AtualizaStatusItemPedido(PnrPedido, PnrProduto,PnrOperadorLogistico: INTEGER;
  PidStatusItem: String): Boolean;
function AbrePrazoParcelamento(stDiasPrazo: String;
  nrParcelas: INTEGER): INTEGER;
function TotalizaPedido(PnrPedido, PnrMercadoria: INTEGER; PidSituacao: String)
  : TTotaLizaPedido;
function TotalizaPedidoEmpresa(nrPedidoSC, nrPedidoRS, nrMercadoria: INTEGER;
  idSituacao: String): TTotaLizaPedido;

function CalculaPcVerba(pcVerba, vlDescontoAdicional, pcoUnitario, pcIPI,
  vlVerbaAnterior, pcAliquotaIcms: Double;
  nrMercadoria, nrECNM_M, qtComprada,PnrFornecedor: INTEGER; idPisCofins: String): Double;
function InformacaoProduto(idTipoRegistro, idTipoBusca: String;
  cdOperadorLogistico, nrCliente, nrProduto, idTransmisao, idMostraMensagem
  : INTEGER): Boolean;
procedure CriaPrazoParcelamento(stDiasPrazo: String; nrParcelas: INTEGER);
function MeioVenda(nrOPeradorLogistico, nrFornecedor: INTEGER): INTEGER;
(* ****************************************************** *)
function CompradorPedido(PnrComprador ,PnrMatricula: INTEGER): TDadosComprador;
(* ****************************************************** *)
function AbreIndicePreco(nrLaboratorio: INTEGER): Double;
function GetDadosCD(nrCd:Integer):TDadosCD;
function GetValoresPedido(PnrPedido:Integer;PidAtivarPedido:Boolean):TDadosValoresPedido;
function VerificaPedido(idStatus:String;nrFornecedor:Integer):TClientDataSet;
Function AlteraStatusPedido(PnrPedido,PnrProduto:Integer;PidAtualizaItem:Boolean):boolean;
function DadosItemPedidoSuspenso(nrPedido,nrEmpresa: INTEGER):TClientDataSet;
function TopoPaginaPedido(nrPagina, nrLinha,nrPedido:Integer;DtPedido:TDate;msg,stLogradouro,stBairro,stCidade,stUF,stCep,dsFornecedor,stPrazo:String):Integer;
function CabecalhoPag(nrLinha,nrPagina: Integer;stObservacao:String):Integer;
function CabecalhoPagNovaPagina(nrLinha,nrPagina: Integer):Integer;
function LinhaDetalhePedido(nrLinha, nrCodigoGAM,
                              nrQuantidade:Integer;
                              nrCodigoFORNEC,nmProduto, nmApresentacao: String;
                              pcDesconto, vlPrecoUnitario: Double):Integer;
function RodaPeParcial(nrLinha,nrPagina: Integer;nrUnidadesParcial:Integer;vlPedido:Double):Integer;
function RodaPeFinal(nrLinha,nrPagina: Integer;nrUnidadesParcial:Integer;vlPedido:Double):Integer;
function GetInativadosCadastrados(PdtInicial,PdtFinal:TDate;nrCD,PnrComprador: Integer):TClientDataSet;
function GetProdutosComparacao(PnrCD,PnrFornecedor: Integer):TClientDataSet;

var
  _vlProdutoRepasse: Double;
  _vlCreditoIcms: Double;
  _cdsParcelaPrazoPagamento :TClientDataSet;

const
   vlIndiceNivelServico_A:Double=2.06;
   vlIndiceNivelServico_B:Double=1.76;
   vlIndiceNivelServico_C:Double=1.56;
   vlIndiceNivelServico_D:Double=1.56;
   vlIndiceNivelServico_E:Double=1.56;
implementation

uses  uRotinaMargemGam;



function AJustaDataPedido(dtPedido: Tdate;
  DiaPedido, DiaSemana: INTEGER): Tdate;
var
  dtAjustada: Tdate;
  diaSemanaAjustado: Word;
  dtTemp: String;
begin
  dtAjustada := dtPedido;
  if DiaSemana <> DiaPedido then
  begin
    repeat
      dtAjustada := dtAjustada - 1;
      diaSemanaAjustado := dayofweek(dtAjustada);
      dtTemp := DateToStr(dtAjustada);
    until diaSemanaAjustado = DiaPedido;
  end
  else
    dtAjustada := dtPedido;
  RESULT := dtAjustada;
end;

(* **********  Dia de Pedido ********************************** *)
function MostraDiaPedido(stDiaspedido: String): String;
var
  MaiorDia, MenorDIA: INTEGER;
  FazPedido: String[1];
  dsDiapedido, dsDias: String;
  I, NrPedidoSemana: INTEGER;
begin

  MaiorDia := 1;
  MenorDIA := 5;
  NrPedidoSemana := 0;
  RESULT := '';
  for I := 1 to 5 do
  begin
    FazPedido := copy(stDiaspedido, I, 1);
    if FazPedido = '1' then
    begin
      case I of
        1:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Segunda-Feira';
            MaiorDia := 2;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
        2:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Ter?a-Feira';
            MaiorDia := 3;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
        3:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Quarta-Feira';
            MaiorDia := 4;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
        4:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Quinta_Feira';
            MaiorDia := 5;
          end;
        5:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Sexta-Feira';
            MaiorDia := 6;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
      end;
      IF TRIM(dsDiapedido) <> '' THEN
        dsDias := dsDias + dsDiapedido + ' - '
      ELSE
        dsDias := dsDias + dsDiapedido;

      dsDias := formatfloat('00', MenorDIA) + formatfloat('00',
        MaiorDia) + dsDias;
    end;
    RESULT := dsDias;
  end;
end;



{$REGION 'Calcula Pre?o '}

function CalculaPrecoLiquido(Precofabrica,
                             PrecoVenda,
                             PcDescontoRepasse,
                             pcDescontoPadrao,
                             pcDescontoAdicional,
                             pcCreditoICMS,
                             pcIPI,
                             pcIPIListaPreco,
                             PpcMundancaPreco: Double;
                             qtPedido,
                             cdListaPreco: INTEGER;
                             IdAcumulaDesconto,
                             idForcaRepasse,
                             idIpiLiquidoComRepasse,
                             idIpiLiquidoSemRepasse,
                             idIpiBrutoComRepasse,
                             idIpiBrutoSemRepasse,
                             idTipoLista,
                             idUnidadeFederacao,
                             idSuperfluo,
                             idIcmDestacado,
                             idReduzIcms,
                             idPisConfins: STRING): TCalculoPreco;
VAR
  VlResultado, VlResultadocomRepasse, VlResultadoComDescAdicional,
  VlResultadoSemDescAdicional, vlBaseIpi,vlIPI,vlIPIComAdicional ,pcReducao, pcAliquotaIcms,

    vlCustoReduzidoSemDescAdicional, vlCustoReduzidoComDescAdicional,
    vlPisSemDescAdicional, vlConfisSemDescAdicional, vlPisAdicional,
    vlConfisAdicional, vlPrecoCustoSemDescAdicional,
    vlPrecoCustoComDescAdicional, vlCreditoIcmsCompraSemDescAdicional,
    vlCreditoIcmsCompraComDescAdicional,
    vlVerba,vlPisConfins,vlPisConfinsSem,
    vtDesconto,vlPrecoCusto: Double;

BEGIN
  PcDescontoRepasse:=0;
  vtDesconto:=0;
  vlPrecoCusto:=0;
  _vlProdutoRepasse := Precofabrica - ((Precofabrica * PcDescontoRepasse) / 100);

//   if idTipoLista='1' then

  IF IdAcumulaDesconto = 'N' THEN
  BEGIN
    vlPrecoCustoSemDescAdicional := CalculaPreco(Precofabrica,
                                                 PcDescontoRepasse,
                                                 pcDescontoPadrao,
                                                 0,
                                                 IdAcumulaDesconto,0,0);
    vlPrecoCustoComDescAdicional := CalculaPreco(Precofabrica,
                                                 PcDescontoRepasse,
                                                 pcDescontoPadrao,
                                                 pcDescontoAdicional,
                                                 IdAcumulaDesconto,0,0);

    VlResultadocomRepasse       := Precofabrica - ((Precofabrica * PcDescontoRepasse) / 100);
    VlResultado                 := VlResultadocomRepasse -  ((VlResultadocomRepasse * (pcDescontoPadrao)) / 100);
    VlResultadoSemDescAdicional := VlResultado;
    VlResultadoComDescAdicional := VlResultadocomRepasse -((VlResultadocomRepasse * (pcDescontoPadrao + pcDescontoAdicional)) / 100);
    if VlResultado < 0 then
      VlResultado := 0;

  END
  ELSE
  BEGIN
    VlResultado                 := Precofabrica - ((Precofabrica * PcDescontoRepasse) / 100);
    VlResultado                 := VlResultado - ((VlResultado * pcDescontoPadrao) / 100);
    VlResultadoSemDescAdicional := VlResultado;
    VlResultadoComDescAdicional := VlResultado - ((VlResultado * pcDescontoAdicional) / 100);

    if VlResultado < 0 then
      VlResultado := 0;
    { Result.vlPrecoLiquido:=VlResultadoComDescAdicional;
      Result.vtDesconto        := vtDesconto;
      Result.vlPrecoCusto      := vlPrecoCusto;
      Result.pcDescontoAdcional:= PcDescontoAdicional; }
  END;
  RESULT.vlPrecoLiquido     := VlResultadoComDescAdicional;
  RESULT.vtDesconto         := vtDesconto;
  RESULT.vlPrecoCusto       := vlPrecoCusto;
  RESULT.pcDescontoAdcional := pcDescontoAdicional;
  RESULT.cdListaPreco       := cdListaPreco;
  result.pcMundancaPreco    := PpcMundancaPreco;

  if idIpiBrutoComRepasse = 'S' then
    vlBaseIpi := PrecoVenda;
  if idIpiBrutoSemRepasse = 'S' then
    vlBaseIpi := _vlProdutoRepasse;
  if idIpiLiquidoComRepasse = 'S' then
    vlBaseIpi := _vlProdutoRepasse;

  // Define aliquota ICMS
  // pcAliquotaIcms := DefineAliquotaICMS(idUnidadeFederacao, idSuperfluo[1],idIcmDestacado[1]);
  pcAliquotaIcms := pcCreditoICMS;

  pcReducao := PcRedutorBaseCalculo(idUnidadeFederacao, idSuperfluo,idTipoLista, idIcmDestacado);

  vlCustoReduzidoSemDescAdicional := VlResultado;
  // * (1 - (pcCreditoICMS * 0.01));
  vlCustoReduzidoComDescAdicional := VlResultadoComDescAdicional;
  // * (1 - (pcCreditoICMS * 0.01));

  vlCreditoIcmsCompraSemDescAdicional := vlCustoReduzidoSemDescAdicional *    (pcAliquotaIcms * 0.01);

  //vlCreditoIcmsCompraComDescAdicional
  vlCreditoIcmsCompraComDescAdicional := vlCustoReduzidoComDescAdicional *    (pcAliquotaIcms * 0.01);
  vlIPI:= (Precofabrica*(pcIPI/100));
  vlIPIComAdicional:=0;
  if idTipoLista<>'1' then
  begin
    vlIPI:= (VlResultadoSemDescAdicional*(pcIPI/100));
    vlIPIComAdicional:=(VlResultadoComDescAdicional*(pcIPI/100));
  end;
  if idTipoLista='1' then
  begin
    vlIPIComAdicional:=(Precofabrica*(pcIPI/100));
    vlIPI:=vlIPIComAdicional;
  end;

  vlPrecoCusto := VlResultadoComDescAdicional -  vlCreditoIcmsCompraComDescAdicional;

  vlPisConfinsSem           := 0;
  vlPisConfins              := 0;
  if idPisConfins = 'T' then
  begin
    vlPisSemDescAdicional     := VlResultadoComDescAdicional * 0.076;
    vlConfisSemDescAdicional  := VlResultadoComDescAdicional * 0.0165;
    vlPrecoCusto              := vlPrecoCusto -  (vlPisSemDescAdicional+vlConfisSemDescAdicional);
    vlPisAdicional            := VlResultadocomRepasse * 0.076;
    vlConfisAdicional         := VlResultadocomRepasse * 0.0165;
    RESULT.vlPrecoLiquido     := VlResultadoComDescAdicional;
    vlPisConfinsSem           := VlResultadoSemDescAdicional * 0.0925;
    vlPisConfins              := VlResultadoComDescAdicional * 0.0925;
  end;
  vlVerba :=0;
  if pcDescontoAdicional>0.05 then
     vlVerba :=(VlResultadoSemDescAdicional + vlipi - vlPisConfinsSem-vlCreditoIcmsCompraSemDescAdicional)-
               (VlResultadoComDescAdicional + vlIPIComAdicional- vlPisConfins-vlCreditoIcmsCompraComDescAdicional);


 { vlVerba := (vlCustoReduzidoSemDescAdicional - RESULT.vlPrecoLiquido) -
    ((vlCustoReduzidoSemDescAdicional - RESULT.vlPrecoLiquido) *
    (pcAliquotaIcms * 0.01)) +
    ((vlCustoReduzidoSemDescAdicional - RESULT.vlPrecoLiquido) *
    (pcIPI * 0.01))};

  RESULT.vlCreditoIcmsCompra := vlCreditoIcmsCompraComDescAdicional;
  // vlCustoReduzidoComDescAdicional * (pcAliquotaIcms * 0.01);

  vlPrecoCustoSemDescAdicional := vlCreditoIcmsCompraSemDescAdicional -   vlCreditoIcmsCompraSemDescAdicional;
  // vlPrecoCusto                := Result.vlPrecoLiquido - Result.vlCreditoIcmsCompra;
  //vlPrecoCusto := VlResultadoComDescAdicional -  vlCreditoIcmsCompraComDescAdicional;
  if qtPedido = 0 then
    qtPedido := 1;
  vtDesconto := (VlResultado - vlCreditoIcmsCompraSemDescAdicional) -  vlPrecoCusto;

  // vlVerba := vlPrecoCusto - vlPrecoCustoSemDescAdicional;
  // Result.vlPrecoLiquido     := vlPrecoLiquido;
  RESULT.vtDesconto         := vtDesconto;
  RESULT.vlPrecoCusto       := vlPrecoCusto;
  RESULT.pcDescontoAdcional := pcDescontoAdicional;
  RESULT.vlPrecoLista       := Precofabrica;
  RESULT.vlVerba            := vlVerba;
  // _vtDescontoComDescAdicional :=

END;
{$ENDREGION 'Calcula Pre?o '}


Function PcRedutorBaseCalculo(idUF,
                              idSuperfulo,
                              idTipoLista,
                              IdFornecedorDestacaIcms: String): Double;
begin
  if idUF = 'SC' then
  begin
    if DefineAliquotaICMS(idUF, idSuperfulo[1], IdFornecedorDestacaIcms[1])
      = 17 then
      RESULT := 29.41
    else if DefineAliquotaICMS(idUF, idSuperfulo[1], IdFornecedorDestacaIcms[1]
      ) = 25 then
      RESULT := 52
  end
  else if idTipoLista[1] = '-' then
    RESULT := 10.49
  else if idTipoLista[1] = '=' then
    RESULT := 9.9;
end;

Function VerificaReduzBCIcms(idReduzIcms, idIcmsDestacado, idSuperfulo,
  idTipoLista: String): Boolean;
begin
  RESULT := False;
  if idIcmsDestacado <> 'N' then
    if idReduzIcms = 'S' then
      if (idSuperfulo = 'S') or (idSuperfulo = 'N') then
        if (idTipoLista = '-') or (idTipoLista = '=') then
          RESULT := True;
end;

Function DefineAliquotaICMS(idUF: String;
  idSuperfluo, IdFornecedorDestacaIcms: Char): Double;
begin
  if IdFornecedorDestacaIcms = 'N' then
    RESULT := 0
  else if idUF <> 'SC' then
    RESULT := 12
  else if idSuperfluo = 'S' then
    RESULT := 25
  else if idUF = 'SC' then
    RESULT := 17
  else
    RESULT := 12;
end;

function Arredondar(Valor: Double; Dec: INTEGER): Double;
var
  Valor1, Numero1, Numero2, Numero3: Double;
begin
  Valor1 := Exp(Ln(10) * (Dec + 1));
  Numero1 := Int(Valor * Valor1);
  Numero2 := (Numero1 / 10);
  Numero3 := Round(Numero2);
  RESULT := (Numero3 / (Exp(Ln(10) * Dec)));
end;

function CalculaDescontoAdicional(vlPrecoLista, vlLiquido, pcRepasse,
  pcDescontoPadrao: Double): Double;
var
  Percentual: Double;

begin
  RESULT := 0;
 if vlPrecoLista>0 then
 begin
  Percentual := (100 - pcRepasse) / 100;
  Percentual := vlLiquido / Percentual;
  Percentual := (1 - (Percentual / vlPrecoLista)) * 100;
  RESULT := Arredondar((Percentual - pcDescontoPadrao), 3);
  if RESULT < 0.03 then
    RESULT := 0;
 end;
end;

function GeraNumeroPedido(idTipoPedido: String): INTEGER;
begin
  (* * Incrementa Nro. do Pedido * *)
  _dm._spNumeroPedido.Close;
  _dm._spNumeroPedido.Params[0].AsString := idTipoPedido;
  _dm._spNumeroPedido.Prepared := False;
  _dm._spNumeroPedido.Close;
  try
    _dm._spNumeroPedido.ExecProc;
  except
    begin
      mensagem('N?o Atualizar numero do pedido',16);
      halt;
    end;
  end;
  if _dm._spNumeroPedido.Params[2].AsInteger > 0 then
  begin
    mensagem('N?o Consegui Gerar numero do pedido',16);
    halt;
  end
  else
  begin
    RESULT := _dm._spNumeroPedido.Params[1].AsInteger;
  end;
end;

{$REGION 'Grava Capa de Pedido'}

function GravaCapaPedido(PNROP_P, // NUMBER(6)
                         PLABP_P: INTEGER; // NUMBER(6)
                         PDATP_P: Tdate; // DATE
                         PABTP_P, // NUMBER(5,2)
                         PDESP_P: Double; // NUMBER(5,2)
                         PSITP_P: String; // CHAR(1)
                         PPRZP_P: INTEGER; // NUMBER(3)
                         PPREP_P: Tdate; // DATE
                         POBSP_P, // CHAR(40)
                         PSNRP_P: String; // nrPrdido no Laboratorio CHAR(10)
                         PFLAP_P, // NUMBER(1)
                         PNR_CONDICAO_PAGTO_P: INTEGER; // NUMBER(6)
                         PNM_USUARIO: String; // NOT NULL VARCHAR2(10)
                         PDT_FECHAMENTO_PEDIDO, // NOT NULL DATE
                         PDT_PREVISTA_FATURAMENTO: Tdate; // NOT NULL DATE
                         PID_CIF_FOB: String; // NOT NULL VARCHAR2(1)
                         PCD_OPERADOR_LOGISTICO: INTEGER; // NOT NULL NUMBER(6)
                         PNM_MAQUINA: String; // NOT NULL VARCHAR2(20)
                         PDT_AGENDAMENTO_PEDIDO: Tdate; // NOT NULL DATE
                         PDT_DIGITACAO: Tdate; // DATE
                         PQT_PALETE, // NOT NULL NUMBER(15,6)
                         PQT_CAIXA: Double; // NOT NULL NUMBER(15,6)
                         PDT_TRANSMITIDO: Tdate;
                         PCD_COMPRADOR: INTEGER;
                         PCD_EMPRESA: INTEGER;
                         PCD_PEDIDO_RELACIONADO:INTEGER;
                         PPC_GERACAO_VERBA:Double;
                         PNR_GERACAO_VERBA,
                         PNR_DIAS_INFORMADO,
                         PNR_CD_DESTINO:Integer;
                         PID_CROSSDOCKING:STRING;
                         PCD_OPERACAO_REDE:Integer;
                         PnrListadePrecoExcecao:Integer): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  cdEvento:Integer;
  DaDosPedido:TDadosValoresPedido;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into PRDDM.DCPCC (NROP_P,LABP_P,FLAP_P,NR_CONDICAO_PAGTO_P,');
        SQL.Add('PRZP_P,CD_OPERADOR_LOGISTICO,ABTP_P,DESP_P,QT_PALETE,QT_CAIXA,');
        SQL.Add('OBSP_P,SNRP_P,SITP_P,ID_CIF_FOB,NM_MAQUINA,NM_USUARIO,DATP_P,');
        SQL.Add('PREP_P,DT_FECHAMENTO_PEDIDO,DT_PREVISTA_FATURAMENTO,DT_AGENDAMENTO_PEDIDO,');
        SQL.Add('DT_DIGITACAO,DT_TRANSMITIDO,CD_COMPRADOR,CD_EMPRESA,');
        SQL.Add('CD_PEDIDO_RELACIONADO,PC_VERBA_GERACAO,NR_VERBA_GERACAO,NR_DIAS_INFORMADO,');
        SQL.Add('CD_EMPRESA_DESTINO, ID_CROSSDOCKING,CD_OPERACAO_REDE,NR_LISTA_PRECO)');

        SQL.Add('Values(');
        SQL.Add(':NROP_P,:LABP_P,:FLAP_P,:NR_CONDICAO_PAGTO_P,');
        SQL.Add(':PRZP_P,:CD_OPERADOR_LOGISTICO,:ABTP_P,:DESP_P,:QT_PALETE,:QT_CAIXA,');
        SQL.Add(':OBSP_P,:SNRP_P,:SITP_P,:ID_CIF_FOB,:NM_MAQUINA,:NM_USUARIO,:DATP_P,');
        SQL.Add(':PREP_P,:DT_FECHAMENTO_PEDIDO,:DT_PREVISTA_FATURAMENTO,:DT_AGENDAMENTO_PEDIDO,');
        SQL.Add('sysdate,:DT_TRANSMITIDO,:CD_COMPRADOR,:CD_EMPRESA,');
        SQL.Add(':CD_PEDIDO_RELACIONADO,:PC_GERACAO_VERBA,:PNR_GERACAO_VERBA,:PNR_DIAS_INFORMADO,');
        SQL.Add(':CD_EMPRESA_DESTINO,:ID_CROSSDOCKING,:PCD_OPERACAO_REDE,:PNR_LISTA_PRECO)');

        ParamByName('NROP_P').AsInteger := PNROP_P;
        ParamByName('LABP_P').AsInteger := PLABP_P;
        ParamByName('FLAP_P').AsInteger := PFLAP_P;
        ParamByName('NR_CONDICAO_PAGTO_P').AsInteger := PNR_CONDICAO_PAGTO_P;
        ParamByName('PRZP_P').AsInteger := PPRZP_P;
        ParamByName('CD_OPERADOR_LOGISTICO').AsInteger := PCD_OPERADOR_LOGISTICO;
        ParamByName('ABTP_P').AsBCD := PABTP_P;
        ParamByName('DESP_P').AsBCD := PDESP_P;
        ParamByName('QT_PALETE').AsBCD := PQT_PALETE;
        ParamByName('QT_CAIXA').AsBCD := PQT_CAIXA;
        ParamByName('OBSP_P').AsString := POBSP_P;
        ParamByName('SNRP_P').AsString := PSNRP_P;
        ParamByName('SITP_P').AsString := PSITP_P;
        ParamByName('ID_CIF_FOB').AsString := PID_CIF_FOB;
        ParamByName('NM_MAQUINA').AsString := PNM_MAQUINA;
        ParamByName('NM_USUARIO').AsString := PNM_USUARIO;
        ParamByName('DATP_P').AsDateTime   :=strtodate(FormatDateTime('dd/mm/yyyy',PDATP_P));
        ParamByName('PREP_P').AsDateTime   := strtodate(FormatDateTime('dd/mm/yyyy',PPREP_P));
        ParamByName('DT_FECHAMENTO_PEDIDO').AsDateTime := strtodate(FormatDateTime('dd/mm/yyyy',PDT_FECHAMENTO_PEDIDO));
        ParamByName('DT_PREVISTA_FATURAMENTO').AsDateTime :=strtodate(FormatDateTime('dd/mm/yyyy',PDT_PREVISTA_FATURAMENTO));
        ParamByName('DT_AGENDAMENTO_PEDIDO').AsDateTime := strtodate(FormatDateTime('dd/mm/yyyy',PDT_AGENDAMENTO_PEDIDO));
        // ParamByName('DT_DIGITACAO').AsDateTime:=dtSistema;
        ParamByName('DT_TRANSMITIDO').AsDateTime := strtodate(FormatDateTime('dd/mm/yyyy',PDT_TRANSMITIDO));
        ParamByName('CD_COMPRADOR').AsInteger := PCD_COMPRADOR;
        ParamByName('CD_EMPRESA').AsInteger := PCD_EMPRESA;
        ParamByName('CD_PEDIDO_RELACIONADO').AsInteger:=PCD_PEDIDO_RELACIONADO;
        ParamByName('PC_GERACAO_VERBA').AsBCD:=PPC_GERACAO_VERBA;
        ParamByName('PNR_GERACAO_VERBA').AsBCD:=PNR_GERACAO_VERBA;
        ParamByName('PNR_DIAS_INFORMADO').AsBCD:=PNR_DIAS_INFORMADO;
        ParamByName('CD_EMPRESA_DESTINO').AsBCD:=PNR_CD_DESTINO;
        ParamByName('ID_CROSSDOCKING').AsString:=PID_CROSSDOCKING;
        ParamByName('PCD_OPERACAO_REDE').AsBCD:= PCD_OPERACAO_REDE;
        ParamByName('PNR_LISTA_PRECO').asBcd   :=PnrListadePrecoExcecao;

        RESULT := True;
        if ExecSQL(False) <= 0 then
          RESULT := False;
     if PSITP_P='S' then
     begin
        msg:='Pedido Inicializado...usuario -->'+nmlogin;
        cdEvento:= 14;
     end;
     if PSITP_P='N' then
     begin
        msg:='Pedido Gerado... usuario -->'+nmlogin;
        cdEvento:= 15;
     end;
//     DaDosPedido:=GetDadosPedido(PNROP_P,0);
     DaDosPedido:=GetValoresPedido(PNROP_P,false);
     if  InsereEventoPedidoCompra(PNROP_P,
                                 DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 Psitp_p[1],
                                 dtSistema,
                                 nmLogin,
                                 DadosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     cdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);



      end;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Capa Pedido');
      end;
    end;
  finally
    FreeAndNil(QryTemp);
  end;

end;
{$ENDREGION 'Grava Capa de Pedido'}
{$REGION 'Atualiza  Capa de Pedido'}

function AtualizaCapaPedido(PnrPedido,
                            PcdCondicaoPagamento,
                            PcdOperadorLogistico: INTEGER;
                            Pleadtime: Double;
                            PidStatusPedido,
                            PdsObservacao: String;
                            PidAtualizaagenda:Boolean;
                            PdtPrevisaoFaturamento,
                            PdtAgenda,
                            PdtProximaAgenda: Tdate;
                            PnrDiasEstoqueComprador,
                            PnrverbaGeracao:Integer;
                            PidBonificado:boolean;
                            PnrListaPrecoExcecao:Integer): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
  pcverbaGeracao :Double;
begin
  try
     if PnrverbaGeracao=0 then
        pcverbaGeracao:=0;


    if PdsObservacao = '' then
      PdsObservacao := '';
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Update PRDDM.DCPCC set NR_CONDICAO_PAGTO_P=:PcdCondicaoPagamento');
    QryTemp.SQL.Add(',CD_OPERADOR_LOGISTICO=:PcdOperadorLogistico');
    QryTemp.SQL.Add(',SITP_P=:PidStatusPedido');
    QryTemp.SQL.Add(',OBSP_P=:PdsObservacao');
    QryTemp.SQL.Add(',DT_PREVISTA_FATURAMENTO=:PdtPrevisaoFaturamento');
 //   QryTemp.SQL.Add(',PREP_P=:PdtPrevisaoChegada');
    QryTemp.SQL.Add(',DATP_P=:PdtPrevisaoFaturamento');
    QryTemp.SQL.Add(',PC_VERBA_GERACAO=:PPC_VERBA_GERACAO');
    QryTemp.SQL.Add(',NR_VERBA_GERACAO=:PNR_VERBA_GERACAO');
    QryTemp.SQL.Add('where');
    QryTemp.SQL.Add('NROP_P=:PnrPedido');
    QryTemp.SQL.Add('AND SITP_P IN(''N'',''S'',''W'',''P'')');
    QryTemp.ParamByName('PcdCondicaoPagamento').AsInteger := PcdCondicaoPagamento;
    QryTemp.ParamByName('PcdOperadorLogistico').AsInteger := PcdOperadorLogistico;
    QryTemp.ParamByName('PidStatusPedido').AsString       := PidStatusPedido;
//    QryTemp.ParamByName('PdtPrevisaoChegada').AsDateTime := strtodate(FormatDateTime('dd/mm/yyyy',PdtPrevisaoFaturamento+Pleadtime));
    QryTemp.ParamByName('PdtPrevisaoFaturamento').AsDateTime := strtodate(FormatDateTime('dd/mm/yyyy',PdtPrevisaoFaturamento));
    QryTemp.ParamByName('PdsObservacao').AsString := copy(trim(PdsObservacao),1,40);
    QryTemp.ParamByName('PnrPedido').AsInteger := PnrPedido;
    QryTemp.ParamByName('PdtPrevisaoFaturamento').AsString := FormatDateTime('dd/mm/yyyy',PdtPrevisaoFaturamento);
    QryTemp.ParamByName('PNR_VERBA_GERACAO').Asbcd := PnrverbaGeracao;
    QryTemp.ParamByName('PPC_VERBA_GERACAO').Asbcd := pcverbaGeracao;


    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
     if PidStatusPedido='I' then
     begin
        msg:='Pedido Inativado...usuario -->'+nmlogin;
        cdEvento:= 03;
     end;
     if PidStatusPedido='C' then
     begin
        msg:='Pendencia Cancelada... usuario -->'+nmlogin;
        cdEvento:= 19;
     end;
     if PidStatusPedido='P' then
     begin
        msg:='Pendencia Atualizado... usuario -->'+nmlogin;
        cdEvento:= 21;
     end;
     if PidStatusPedido='N' then
     begin
         msg:='Pedido Atualizado... usuario -->'+nmLogin;
        cdEvento:= 21;
       DadosPedido:=GetValoresPedido(PnrPedido,false);
       if PidBonificado then
          setBonificaPedido(PnrPedido, 0, PnrverbaGeracao);
        if PidAtualizaagenda then
          SetDataAgenda(DadosPedido.nrFornecedor,PdtAgenda, PdtProximaAgenda);
       SeparaPedidoCrossDocking(PnrPedido,PcdOperadorLogistico,Pleadtime,PnrDiasEstoqueComprador,PdtPrevisaoFaturamento,PidBonificado,PnrverbaGeracao);
       SeparaPedidoPsicotropico(PnrPedido,PcdOperadorLogistico,Pleadtime,PnrDiasEstoqueComprador,PdtPrevisaoFaturamento,PidBonificado,PnrverbaGeracao,PnrListaPrecoExcecao);


     end;
     DaDosPedido:=GetValoresPedido(PnrPedido,false);
     if DaDosPedido.nrItensPedido>0 then
     begin


     if  InsereEventoPedidoCompra(PnrPedido,
                                  DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 PidStatusPedido[1],
                                 dtSistema,
                                 nmLogin,
                                 DaDosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     cdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);

     end;

  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;
{$ENDREGION 'Atualiza  Capa de Pedido'}

{$REGION 'Ativa  Capa de Pedido'}

function AtivaCapaPedido(PnrPedido,PcdOperadorLogistico,PnrLeadtime: INTEGER; PidStatusPedido: String;PidBonificado:Boolean;Pnrverba:Integer): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
begin
    try

    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Update PRDDM.DCPCC set ');
    QryTemp.SQL.Add('SITP_P=:PidStatusPedido');
  //  QryTemp.SQL.Add(',PREP_P=:PdtPrevisaoChegada');
    //QryTemp.SQL.Add(',DATP_P=:PdtPrevisaoFaturamento');
    QryTemp.SQL.Add('where');
    QryTemp.SQL.Add('NROP_P=:PnrPedido');
    QryTemp.SQL.Add('AND SITP_P IN(''C'',''I'',''S'')');
    QryTemp.ParamByName('PidStatusPedido').AsString := PidStatusPedido;
   // QryTemp.ParamByName('PdtPrevisaoChegada').AsDateTime := strtodate(FormatDateTime('dd/mm/yyyy',PdtPrevisaoFaturamento+Pleadtime));
    QryTemp.ParamByName('PnrPedido').AsInteger := PnrPedido;

    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
     if PidStatusPedido='I' then
     begin
        msg:='Pedido Inativado...usuario -->'+nmlogin;
        cdEvento:= 03;
     end;
     if PidStatusPedido='C' then
     begin
        msg:='Pendencia Cancelada... usuario -->'+nmlogin;
        cdEvento:= 19;
     end;
     if PidStatusPedido='N' then
     begin
         msg:='Pedido Reativado ... usuario -->'+nmLogin;
        cdEvento:= 21;
        DadosPedido:=GetValoresPedido(PnrPedido,false);
        SeparaPedidoCrossDocking(PnrPedido,PcdOperadorLogistico,Pnrleadtime,0,DaDosPedido.dtPedido,PidBonificado,Pnrverba);
        SeparaPedidoPsicotropico(PnrPedido,PcdOperadorLogistico,Pnrleadtime,0,DaDosPedido.dtPedido,PidBonificado,Pnrverba,DaDosPedido.nrListaPrecoExcecao);


     end;
     DaDosPedido:=GetValoresPedido(PnrPedido,false);
     if  InsereEventoPedidoCompra(PnrPedido,
                                 DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 PidStatusPedido[1],
                                 dtSistema,
                                 nmLogin,
                                 DaDosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     cdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);


  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;
{$ENDREGION 'Ativa Capa Pedido'}




{$REGION 'Ativa  Capa de Pedido Analise'}

function AtivaCapaPedidoAnalise(PnrPedido:Integer;PStatusDe,PidStatusPara,Pnmusuario: String ): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
begin
    try
    try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Update PRDDM.DCPCC set ');
    QryTemp.SQL.Add('SITP_P=:PidStatusPara');
    QryTemp.SQL.Add('where');
    QryTemp.SQL.Add('NROP_P=:PnrPedido');
    QryTemp.SQL.Add('AND SITP_P =:PStatusDe');
    QryTemp.ParamByName('PStatusDe').AsString := PStatusDe;
    QryTemp.ParamByName('PidStatusPara').AsString := PidStatusPara;
    QryTemp.ParamByName('PnrPedido').AsInteger := PnrPedido;

    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
     if PidStatusPara='I' then
     begin
        msg:='Pedido Inativado...usuario -->'+nmlogin;
        cdEvento:= 03;
     end;
     if PidStatusPara='C' then
     begin
        msg:='Pendencia Cancelada... usuario -->'+nmlogin;
        cdEvento:= 19;
     end;
     if PidStatusPara='N' then
     begin
         msg:='Pedido em Analise Ativado ... usuario -->'+nmLogin;
        cdEvento:= 21;
        DadosPedido:=GetValoresPedido(PnrPedido,false);
     end;
     DaDosPedido:=GetValoresPedido(PnrPedido,false);
     if  InsereEventoPedidoCompra(PnrPedido,
                                 DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 PidStatusPara[1],
                                 dtSistema,
                                 nmLogin,
                                 DaDosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     cdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);
    except

      RESULT := False
    end;



  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;
{$ENDREGION 'Ativa Capa Pedido'}


{$REGION 'Altera prazo Pedido Capa Pedido'}
function AlteraPrazoPedido(PnrPedido,PcdPrazo,PnrDias: INTEGER;PdtFaturamento,PdtPrevisao:Tdate): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
begin
  try

    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Update PRDDM.DCPCC set przp_p=:PnrDias,nr_condicao_pagto_p=:PcdPrazo,');
    QryTemp.SQL.Add('PREP_P=:PdtEntrega,DT_PREVISTA_FATURAMENTO=:PdtFaturmento');

    QryTemp.SQL.Add('where');
    QryTemp.SQL.Add('NROP_P=:PnrPedido');
    QryTemp.ParamByName('PnrDias').AsBCD   := PnrDias;
    QryTemp.ParamByName('PcdPrazo').AsBCD  := PcdPrazo;
    QryTemp.ParamByName('PnrPedido').AsBCD := PnrPedido;
    QryTemp.ParamByName('PdtEntrega').AsDateTime := PdtPrevisao;
    QryTemp.ParamByName('PdtFaturmento').AsDateTime := PdtFaturamento;


    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
    begin
      RESULT := True;
      AlteraPrazoItemPedido(PnrPedido,PnrDias);
    end;
      msg:='CONDICAO PARCELAMENTO Alterado...usuario -->'+nmlogin;
      cdEvento:= 24;
     DaDosPedido:=GetValoresPedido(PnrPedido,false);
     if  InsereEventoPedidoCompra(PnrPedido,
                                 DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 DadosPedido.FidStatusPedido[1],
                                 dtSistema,
                                 nmLogin,
                                 DaDosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     cdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);


  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;
{$ENDREGION 'Altera prazo Pedido Capa Pedido'}

{$REGION 'Altera prazo Item do Pedido '}

function AlteraPrazoItemPedido(PnrPedido,PnrDias: INTEGER): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
begin
  try

    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Update PRDDM.DCPCI set przy_y=:PnrDias');
    QryTemp.SQL.Add('where');
    QryTemp.SQL.Add('NROP_Y=:PnrPedido');
    QryTemp.ParamByName('PnrDias').AsBCD   := PnrDias;
    QryTemp.ParamByName('PnrPedido').AsBCD := PnrPedido;

    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;

  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;
{$ENDREGION 'Ativa Capa Pedido'}



(* ****************************************************** *)
{$REGION 'Insere Item Pedido'}

function GravaItemPedidoAtual(NROP_Y, // NUMBER(6)
                              NROM_Y, // NUMBER(6)
                              QUAY_Y, // NUMBER(7)
                              CHEY_Y: INTEGER; // NUMBER(7)
                              ABTY_Y: Double; // NUMBER(5,2)
                              SITY_Y: String; // CHAR(1)
                              PRZY_Y: INTEGER; // NUMBER(3)
                              PUNY_Y, // NUMBER(17,6)
                              PFBY_Y, // NUMBER(17,6)
                              DADY_Y, // NUMBER(5,2)
                              DFIY_Y, // NUMBER(5,2)
                              VCCI_Y: Double; // NUMBER(17,6)
                              NRVV_Y: INTEGER; // NUMBER(6)
                              VL_MARGEM_PADRAO, // NOT NULL NUMBER(13,2)
                              VL_MARGEM_NEGOCIADA: Double; // NOT NULL NUMBER(13,2)
                              ID_MARGEM, // CHAR(1)
                              ID_DESCONTO_ACUMULATIVO: String; // VARCHAR2(1)
                              PC_VERBA, // NUMBER(5,2)
                              VL_VERBA: Double; // NUMBER(13,2)
                              QT_BONIFICADA: INTEGER; // NOT NULL NUMBER(6)
                              PC_BONIFICACAO, // NOT NULL NUMBER(5,2)
                              PC_DESCONTO_OL: Double; // NOT NULL NUMBER(5,2)
                              NR_OPERADOR_LOGISTICO, // NOT NULL NUMBER(6)
                              NR_DIAS_ESTOQUE, // NUMBER(3)
                              QT_SUGERIDA: INTEGER; // NUMBER(7)
                              VL_MEDIA_VENDA: Double; // NUMBER(13,2)
                              CD_LISTA_COMPRA: INTEGER; // NUMBER(6)
                              PC_MUDANCA_PRECO: Double;
                              CD_EMPRESA:Integer;
                              Ppc_ICMS_Compra,
                              PPCIPILista,
                              PPC_REPASSE,
                              PVL_PRECO_FABRICA,
                              PPC_ICMS_VENDA,
                              PPC_CREDITO_ICMS_LISTA:Double;
                              PnrDiasInformado:Integer;
                              PvlCustoGerencial:Double): Boolean; // NUMBER(7,4)
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;


      if (NR_OPERADOR_LOGISTICO>1) or (DADY_Y=0) or (QUAY_Y=0) and (VCCI_Y>0) then
      begin
        NRVV_Y:=0;
        PC_VERBA:=0;
        vl_VERBA:=0;
      end;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert into PRDDM.DCPCI');
        SQL.Add('(NROP_Y,NROM_Y,QUAY_Y,CHEY_Y,ABTY_Y,SITY_Y,PRZY_Y,PUNY_Y,');
        SQL.Add('PFBY_Y,DADY_Y,DFIY_Y,VCCI_Y,NRVV_Y,VL_MARGEM_PADRAO,');
        SQL.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM,ID_DESCONTO_ACUMULATIVO,');
        SQL.Add('PC_VERBA,VL_VERBA,QT_BONIFICADA,PC_BONIFICACAO,');
        SQL.Add('PC_DESCONTO_OL,NR_OPERADOR_LOGISTICO,NR_DIAS_ESTOQUE,');
        SQL.Add('QT_SUGERIDA,VL_MEDIA_VENDA,CD_LISTA_COMPRA,PC_MUDANCA_PRECO,');
        SQL.Add('CD_EMPRESA,PC_ICMS_COMPRA,QT_MERCADORIA_TRANSITO,PC_IPI,PC_DESCONTO_NEGOCIADO,');
        SQL.Add('PC_REPASSE, VL_BASE_VENDA,PC_ICMS_VENDA,PC_CREDITO_ICMS,NR_DIAS_INFORMADO,VL_CUSTO_GERENCIAL) ');
        SQL.Add('Values(');
        SQL.Add(':NROP_Y,:NROM_Y,:QUAY_Y,:CHEY_Y,:ABTY_Y,:SITY_Y,:PRZY_Y,:PUNY_Y,');
        SQL.Add(':PFBY_Y,:DADY_Y,:DFIY_Y,:VCCI_Y,:NRVV_Y,:VL_MARGEM_PADRAO,');
        SQL.Add(':VL_MARGEM_NEGOCIADA,:ID_MARGEM,:ID_DESCONTO_ACUMULATIVO,');
        SQL.Add(':PC_VERBA,:VL_VERBA,:QT_BONIFICADA,:PC_BONIFICACAO,');
        SQL.Add(':PC_DESCONTO_OL,:NR_OPERADOR_LOGISTICO,:NR_DIAS_ESTOQUE,');
        SQL.Add(':QT_SUGERIDA,:VL_MEDIA_VENDA,:CD_LISTA_COMPRA,:PC_MUDANCA_PRECO,');
        SQL.Add(':CD_EMPRESA,:PC_ICMS_COMPRA,0,:PC_IPI,:PC_DESCONTO_NEGOCIADO,');
        SQL.Add(':PC_REPASSE, :VL_BASE_VENDA,:PC_ICMS_VENDA,:PC_CREDITO_ICMS,:PNR_DIAS_INFORMADO,:PVL_CUSTO_GERENCIAL) ');

        if DFIY_Y>999 then
           DFIY_Y:=999;
        ParamByName('NROP_Y').AsInteger := NROP_Y;
        ParamByName('NROM_Y').AsInteger := NROM_Y;
        ParamByName('QUAY_Y').AsInteger := QUAY_Y;
        ParamByName('CHEY_Y').AsInteger := 0;
        ParamByName('ABTY_Y').AsBCD := ABTY_Y;
        ParamByName('SITY_Y').AsString := SITY_Y;
        ParamByName('PRZY_Y').AsInteger := PRZY_Y;
        ParamByName('PUNY_Y').AsBCD := PUNY_Y;
        ParamByName('PFBY_Y').AsBCD := PFBY_Y;
        ParamByName('DADY_Y').AsBCD := DADY_Y;
        ParamByName('PC_DESCONTO_NEGOCIADO').AsBCD:=ABTY_Y+DADY_Y;
        ParamByName('DFIY_Y').AsBCD := DFIY_Y;
        ParamByName('VCCI_Y').AsBCD := VCCI_Y;
        ParamByName('NRVV_Y').AsInteger := NRVV_Y;
        ParamByName('VL_MARGEM_PADRAO').AsBCD := VL_MARGEM_PADRAO;
        ParamByName('VL_MARGEM_NEGOCIADA').AsBCD := VL_MARGEM_NEGOCIADA;
        ParamByName('ID_MARGEM').AsString := ID_MARGEM;
        ParamByName('ID_DESCONTO_ACUMULATIVO').AsString :=ID_DESCONTO_ACUMULATIVO;
        ParamByName('PC_VERBA').AsBCD := PC_VERBA;
        ParamByName('VL_VERBA').AsBCD := QUAY_Y * VL_VERBA;
        ParamByName('QT_BONIFICADA').AsInteger := QT_BONIFICADA;
        ParamByName('PC_BONIFICACAO').AsBCD := PC_BONIFICACAO;
        ParamByName('PC_DESCONTO_OL').AsBCD := PC_DESCONTO_OL;
        ParamByName('NR_OPERADOR_LOGISTICO').AsInteger := NR_OPERADOR_LOGISTICO;
        ParamByName('NR_DIAS_ESTOQUE').AsInteger := NR_DIAS_ESTOQUE;
        ParamByName('QT_SUGERIDA').AsInteger := QT_SUGERIDA;
        ParamByName('VL_MEDIA_VENDA').AsBCD := VL_MEDIA_VENDA;
        ParamByName('CD_LISTA_COMPRA').AsInteger := CD_LISTA_COMPRA;
        ParamByName('PC_MUDANCA_PRECO').AsBCD := PC_MUDANCA_PRECO;
        ParamByName('CD_EMPRESA').AsInteger := CD_EMPRESA;
        ParamByName('PC_ICMS_COMPRA').AsBCD :=PPC_CREDITO_ICMS_LISTA ;
        ParamByName('PC_IPI').AsBCD :=PPCIPILista;
        ParamByName('PC_REPASSE').AsBCD:=PPC_REPASSE;
        ParamByName('VL_BASE_VENDA').AsBCD:=PVL_PRECO_FABRICA;
        ParamByName('PC_ICMS_VENDA').AsBCD:=PPC_ICMS_VENDA;
        ParamByName('PC_CREDITO_ICMS').AsBCD:=Ppc_ICMS_Compra;
        ParamByName('PNR_DIAS_INFORMADO').AsBCD:=PnrDiasInformado;
        ParamByName('PVL_CUSTO_GERENCIAL').AsBCD:=PvlCustoGerencial;


      end;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Item Pedido'+formatfloat('0000000',nrom_y));
      end;
    end;

    RESULT := True;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      if QUAY_Y>0 then
        GravaEventoLogPedidoCompra(0,
                                  NROP_Y,
                                  dtSistema,
                                  0,
                                  0,
                                  23,
                                  'Item Inserido... usuario - '+nmLogin+' Produto = '+IntToStr(NROM_Y)+' Qtdade='+FormatFloat('0000000',QUAY_Y),
                                  dtSistema,
                                  copy(nmLogin,1,20),
                                  CD_EMPRESA);


  finally
    FreeAndNil(QryTemp);

  end;

end;
{$ENDREGION 'Insere Item Pedido'}
(* ****************************************************** *)


function GravaLogItemPedido(NROP_Y, // NUMBER(6)
  NROM_Y, // NUMBER(6)
  QUAY_Y, // NUMBER(7)
  CHEY_Y: INTEGER; // NUMBER(7)
  ABTY_Y: Double; // NUMBER(5,2)
  SITY_Y: String; // CHAR(1)
  PRZY_Y: INTEGER; // NUMBER(3)
  PUNY_Y, // NUMBER(17,6)
  PFBY_Y, // NUMBER(17,6)
  DADY_Y, // NUMBER(5,2)
  DFIY_Y, // NUMBER(5,2)
  VCCI_Y: Double; // NUMBER(17,6)
  NRVV_Y: INTEGER; // NUMBER(6)
  VL_MARGEM_PADRAO, // NOT NULL NUMBER(13,2)
  VL_MARGEM_NEGOCIADA: Double; // NOT NULL NUMBER(13,2)
  ID_MARGEM, // CHAR(1)
  ID_DESCONTO_ACUMULATIVO: String; // VARCHAR2(1)
  PC_VERBA, // NUMBER(5,2)
  VL_VERBA: Double; // NUMBER(13,2)
  QT_BONIFICADA: INTEGER; // NOT NULL NUMBER(6)
  PC_BONIFICACAO, // NOT NULL NUMBER(5,2)
  PC_DESCONTO_OL: Double; // NOT NULL NUMBER(5,2)
  NR_OPERADOR_LOGISTICO, // NOT NULL NUMBER(6)
  NR_DIAS_ESTOQUE, // NUMBER(3)
  QT_SUGERIDA: INTEGER; // NUMBER(7)
  VL_MEDIA_VENDA: Double; // NUMBER(13,2)
  CD_LISTA_COMPRA: INTEGER; // NUMBER(6)
  PC_MUDANCA_PRECO: Double;
  CD_EMPRESA:Integer;
  Ppc_ICMS_Compra:Double): Boolean; // NUMBER(7,4)
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      if (NR_OPERADOR_LOGISTICO>1) or (DADY_Y=0) then
      begin
        NRVV_Y:=0;
        PC_VERBA:=0;
        vl_VERBA:=0;
      end;
      if NR_DIAS_ESTOQUE>999  then
         NR_DIAS_ESTOQUE:=999;

      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert into PRDDM.DC_LOG_ITEM_PEDIDO_COMPRA');
        SQL.Add('(NROP_Y,NROM_Y,QUAY_Y,CHEY_Y,ABTY_Y,SITY_Y,PRZY_Y,PUNY_Y,');
        SQL.Add('PFBY_Y,DADY_Y,DFIY_Y,VCCI_Y,NRVV_Y,VL_MARGEM_PADRAO,');
        SQL.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM,ID_DESCONTO_ACUMULATIVO,');
        SQL.Add('PC_VERBA,VL_VERBA,QT_BONIFICADA,PC_BONIFICACAO,');
        SQL.Add('PC_DESCONTO_OL,NR_OPERADOR_LOGISTICO,NR_DIAS_ESTOQUE,');
        SQL.Add('QT_SUGERIDA,VL_MEDIA_VENDA,CD_LISTA_COMPRA,PC_MUDANCA_PRECO,');
        SQL.Add('CD_EMPRESA,PC_ICMS_COMPRA,QT_MERCADORIA_TRANSITO,');
        SQL.Add('DT_ATUALIZACAO, NM_USUARIO)');
        SQL.Add('Values(');
        SQL.Add(':NROP_Y,:NROM_Y,:QUAY_Y,:CHEY_Y,:ABTY_Y,:SITY_Y,:PRZY_Y,:PUNY_Y,');
        SQL.Add(':PFBY_Y,:DADY_Y,:DFIY_Y,:VCCI_Y,:NRVV_Y,:VL_MARGEM_PADRAO,');
        SQL.Add(':VL_MARGEM_NEGOCIADA,:ID_MARGEM,:ID_DESCONTO_ACUMULATIVO,');
        SQL.Add(':PC_VERBA,:VL_VERBA,:QT_BONIFICADA,:PC_BONIFICACAO,');
        SQL.Add(':PC_DESCONTO_OL,:NR_OPERADOR_LOGISTICO,:NR_DIAS_ESTOQUE,');
        SQL.Add(':QT_SUGERIDA,:VL_MEDIA_VENDA,:CD_LISTA_COMPRA,:PC_MUDANCA_PRECO,');
        SQL.Add(':CD_EMPRESA,:PC_ICMS_COMPRA,0,SYSDATE,:PNM_USUARIO)');

        ParamByName('NROP_Y').AsInteger := NROP_Y;
        ParamByName('NROM_Y').AsInteger := NROM_Y;
        ParamByName('QUAY_Y').AsInteger := QUAY_Y;
        ParamByName('CHEY_Y').AsInteger := 0;
        ParamByName('ABTY_Y').AsBCD := ABTY_Y;
        ParamByName('SITY_Y').AsString := SITY_Y;
        ParamByName('PRZY_Y').AsInteger := PRZY_Y;
        ParamByName('PUNY_Y').AsBCD := PUNY_Y;
        ParamByName('PFBY_Y').AsBCD := PFBY_Y;
        ParamByName('DADY_Y').AsBCD := DADY_Y;
        ParamByName('DFIY_Y').AsBCD := DFIY_Y;
        ParamByName('VCCI_Y').AsBCD := TruncaValor(VCCI_Y,5);
        ParamByName('NRVV_Y').AsInteger := NRVV_Y;
        ParamByName('VL_MARGEM_PADRAO').AsBCD := VL_MARGEM_PADRAO;
        ParamByName('VL_MARGEM_NEGOCIADA').AsBCD := VL_MARGEM_NEGOCIADA;
        ParamByName('ID_MARGEM').AsString := ID_MARGEM;
        ParamByName('ID_DESCONTO_ACUMULATIVO').AsString :=ID_DESCONTO_ACUMULATIVO;
        ParamByName('PC_VERBA').AsBCD := PC_VERBA;
        ParamByName('VL_VERBA').AsBCD := QUAY_Y * VL_VERBA;
        ParamByName('QT_BONIFICADA').AsInteger := QT_BONIFICADA;
        ParamByName('PC_BONIFICACAO').AsBCD := PC_BONIFICACAO;
        ParamByName('PC_DESCONTO_OL').AsBCD := PC_DESCONTO_OL;
        ParamByName('NR_OPERADOR_LOGISTICO').AsInteger := NR_OPERADOR_LOGISTICO;
        ParamByName('NR_DIAS_ESTOQUE').AsInteger := NR_DIAS_ESTOQUE;
        ParamByName('QT_SUGERIDA').AsInteger := QT_SUGERIDA;
        ParamByName('VL_MEDIA_VENDA').AsBCD := VL_MEDIA_VENDA;
        ParamByName('CD_LISTA_COMPRA').AsInteger := CD_LISTA_COMPRA;
        ParamByName('PC_MUDANCA_PRECO').AsBCD := PC_MUDANCA_PRECO;
        ParamByName('CD_EMPRESA').AsInteger := CD_EMPRESA;
        ParamByName('PC_ICMS_COMPRA').AsBCD :=Ppc_ICMS_Compra;
        ParamByName('PNM_USUARIO').AsString :=nmLogin;
      end;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Log Pedido Compra!!!');
      end;
    end;

    RESULT := True;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False

  finally
    FreeAndNil(QryTemp);

  end;

end;
{$ENDREGION 'Insere Item Pedido'}
(* ****************************************************** *)

{$REGION 'Atualiza Item Pedido'}

{$ENDREGION 'Atualiza Item Pedido'}
(* ****************************************************** *)

{$REGION 'Atualiza Item Pedido'}

function AtualizaItemPedido(PnrPedido,
                            PnrProduto,
                            PnrQuantidadePedido,
                            PnrQuantidadeChegou,
                            PnrPrazoItem,
                            PnrVerba,
                            PnrQuantidadeBonificada,
                            PnrCodigoOperadorLogistico,
                            PnrDiasEstoque,
                            PnrQuantidadeSugerida: INTEGER;
                            PIdStatusItem,
                            PidMargem,
                            PidDescontoAcumulativo: String;
                            PpcDescontoPadrao,
                            PpcDescontoAdicional,
                            PpcDescontoFinanceiro,
                            PpcVerba,
                            PpcBonificacao,
                            PpcDescontoOL,
                            PvlPrecoUnitario,
                            PvlPrecoFabrica,
                            PvlPrecoCusto,
                            PvlMargemPadrao,
                            PvlMargemNegociada,
                            PvlVerba,
                            PvlMediaVenda: Double;
                            PnmTelaAlteracao:String;
                            PcdEmpresa:Integer;
                            PpcCreditoICMS:Double;
                            PcdListaCOMPRA:Integer;
                            PidAtualizaDesconto,
                            PidPedidoBonificado:Boolean;
                            PPcIcmsCompraLista:Double;
                            PnrDasInformado:Integer;
                            PvlPrecoBase:Double): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
  DaDosPedido:TDadosValoresPedido;
  DadosItemPedidoLog :TDadosItemPedido;

begin
 try
  try
      if PnrDiasEstoque>999 then
        PnrDiasEstoque:=999;

     if PnrDasInformado>999 then
       PnrDasInformado:=999;
    PnrQuantidadeBonificada:=0;
    if PidPedidoBonificado then
    begin
       PnrQuantidadeBonificada:=PnrQuantidadePedido;
       PvlVerba:=PvlPrecoCusto;
    end;

   QryTemp := TSQLQuery.Create(NIL);
   QryTemp := _dm.criaQueryGenerica;
   QryTemp.Close;
   QryTemp.SQL.Clear;
   QryTemp.SQL.Add('Update PRDDM.DCPCI set');
   QryTemp.SQL.Add('QUAY_Y=:PnrQuantidadePedido');
  // QryTemp.SQL.Add(',CHEY_Y=:PnrQuantidadeChegou');
   QryTemp.SQL.Add(',PRZY_Y=:PnrPrazoItem');
   QryTemp.SQL.Add(',NRVV_Y=:PnrVerba');
   QryTemp.SQL.Add(',QT_BONIFICADA=:PnrQuantidadeBonificada');
   QryTemp.SQL.Add(',NR_OPERADOR_LOGISTICO=:PnrCodigoOperadorLogistico');
    QryTemp.SQL.Add(',NR_DIAS_ESTOQUE=:PnrDiasEstoque');
 //   QryTemp.SQL.Add(',QT_SUGERIDA=:PnrQuantidadeSugerida');
   QryTemp.SQL.Add(',SITY_Y=:PidStatusItem');
   QryTemp.SQL.Add(',ID_MARGEM=:PidMargem');
   QryTemp.SQL.Add(',ID_DESCONTO_ACUMULATIVO=:PidDescontoAcumulativo');
   QryTemp.SQL.Add(',ABTY_Y=:PpcDescontoPadrao');
   QryTemp.SQL.Add(',DADY_Y=:PpcDescontoAdicional');
   QryTemp.SQL.Add(',CD_EMPRESA=:PcdEmpresa');
   QryTemp.SQL.Add(',PC_VERBA=:PpcVerba');
   QryTemp.SQL.Add(',PC_BONIFICACAO=:PpcBonificacao');
   QryTemp.SQL.Add(',PC_DESCONTO_OL=:PpcDescontoOL');
   QryTemp.SQL.Add(',PUNY_Y=:PvlPrecoUnitario');
   QryTemp.SQL.Add(',PFBY_Y=:PvlPrecoFabrica');
   QryTemp.SQL.Add(',VCCI_Y=:PvlPrecoCusto');
   QryTemp.SQL.Add(',VL_MARGEM_PADRAO=:PvlMargemPadrao');
   QryTemp.SQL.Add(',VL_MARGEM_NEGOCIADA=:PvlMargemNegociada');
   QryTemp.SQL.Add(',VL_VERBA=:PvlVerba');
   QryTemp.SQL.Add(',PC_ICMS_COMPRA=:PpcICMSCOMPRA');
   QryTemp.SQL.Add(',PC_CREDITO_ICMS=:PC_CREDITO_ICMS');
   QryTemp.SQL.Add(',CD_LISTA_COMPRA=:PcdLISTACOMPRA');
   QryTemp.SQL.Add(',VL_BASE_VENDA=:PVL_BASE_VENDA');
   if PnrDasInformado>0 then
     QryTemp.SQL.Add(',nr_dias_informado=:PnrDasInformado');

   if PidAtualizaDesconto then
      QryTemp.SQL.Add(',PC_DESCONTO_NEGOCIADO=:PPC_DESCONTO_NEGOCIADO');

//   QryTemp.SQL.Add(',VL_MEDIA_VENDA=:PvlMediaVenda');
   QryTemp.SQL.Add('Where');
   QryTemp.SQL.Add(' NROP_Y=:PnrPedido');
   QryTemp.SQL.Add(' AND NROM_Y=:PnrProduto');
   QryTemp.SQL.Add(' AND SITY_Y in(''N'',''S'',''W'',''C'',''I'')');
   stTemp := QryTemp.Text;

     if (PnrCodigoOperadorLogistico>1) and (PidPedidoBonificado=false) then
      begin
        PnrVerba:=0;
        PpcVerba:=0;
        PvlVerba:=0;
      end;
    if PnrDiasEstoque>999 then
       PnrDiasEstoque:=999;
   with QryTemp do
   begin
     ParamByName('PnrQuantidadePedido').AsInteger := PnrQuantidadePedido;
//     ParamByName('PnrQuantidadeChegou').AsInteger := nrQuantidadeChegou;
     ParamByName('PnrPrazoItem').AsInteger := pnrPrazoItem;
     ParamByName('PnrVerba').ASBCD := PnrVerba;
     ParamByName('PnrQuantidadeBonificada').AsInteger :=PnrQuantidadeBonificada;
   ParamByName('PnrCodigoOperadorLogistico').AsInteger :=PnrCodigoOperadorLogistico;
     ParamByName('PnrDiasEstoque').AsBCD := PnrDiasEstoque;
 //    ParamByName('PnrQuantidadeSugerida').AsInteger := nrQuantidadeSugerida;
     ParamByName('PidStatusItem').AsString := PidStatusItem;
     ParamByName('PidMargem').AsString := PidMargem;
     ParamByName('PidDescontoAcumulativo').AsString := PidDescontoAcumulativo;
     ParamByName('PpcDescontoPadrao').AsBCD := PpcDescontoPadrao;
     ParamByName('PpcDescontoAdicional').AsBCD := PpcDescontoAdicional;
     if PidAtualizaDesconto then
        ParamByName('PPC_DESCONTO_NEGOCIADO').AsBCD:=PpcDescontoPadrao+PpcDescontoAdicional;
//     ParamByName('PpcDescontoFinanceiro').AsBCD := PpcDescontoFinanceiro;
     ParamByName('PpcVerba').AsBCD := PpcVerba;
     ParamByName('PpcBonificacao').AsBCD := PpcBonificacao;
     ParamByName('PpcDescontoOL').AsBCD :=PpcDescontoOL;
     ParamByName('PvlPrecoUnitario').AsBCD := PvlPrecoUnitario;
     ParamByName('PvlPrecoFabrica').AsBCD := PvlPrecoFabrica;
     ParamByName('PvlPrecoCusto').AsBCD :=PvlPrecoCusto;
     ParamByName('PvlMargemPadrao').AsBCD := PvlMargemPadrao;
     ParamByName('PvlMargemNegociada').AsBCD := PvlMargemNegociada;
     ParamByName('PvlVerba').AsBCD := PnrQuantidadePedido * PvlVerba;
     ParamByName('PcdEmpresa').AsBCD := PcdEmpresa;
     ParamByName('PnrPedido').AsBCD := PnrPedido;
     ParamByName('PnrProduto').AsBCD := PnrProduto;



    ParamByName('PpcICMSCOMPRA').AsBCD   := PPcIcmsCompraLista;
    ParamByName('PcdLISTACOMPRA').AsBCD  := PcdListaCOMPRA;
    ParamByName('PC_CREDITO_ICMS').AsBCD := PpcCreditoICMS;
    ParamByName('PVL_BASE_VENDA').AsBCD  := PvlPrecoBase;

    if PnrDasInformado>0 then
       ParamByName('PnrDasInformado').AsBCD :=PnrDasInformado;



   end;



   if QryTemp.ExecSQL(False) <= 0 then
   begin
     RESULT := False;
     //mensagem('N?o Atualizou Item Pedido!!!',16);
     //exit;
   end
   else
     RESULT := True;
// 77    DaDosPedido:=GetDadosPedido(PnrPedido,0);
      DaDosPedido:=GetValoresPedido(PnrPedido,false);

       DadosItemPedidoLog  := localizaItemPedido(PnrPedido,
                                                 PnrProduto,
                                                 PcdEmpresa);

               GravaLogPedidoCompra(PnrPedido,//PnrPedido,
                                    PnrProduto,//PnrMercadoria,
                                    DadosItemPedidoLog.nrQuantidadePedido,//PqtAnterior,
                                    PnrQuantidadePedido,//PqtAtual:Integer;
                                    DadosItemPedidoLog.pcDescontoAdicional,//PpcDescontoAnterior,
                                    PpcDescontoAdicional,// PpcDescontoAtual:Double;
                                    DadosItemPedidoLog.nrVerba,// PnrVerbaAnterior,
                                    PnrVerba,//:Integer;
                                    DadosItemPedidoLog.pcVerba, // PpcVerbaAnterior,
                                    PpcVerba,// PpcVerbaAtual:Double;
                                    nmLogin,//  PnmUsuario:String;
                                    DadosItemPedidoLog.idStatusItem,// PidStatusAnterior,
                                    'N',// PidStatusAtual:String;
                                    DadosItemPedidoLog.qtSugerida,// PqtSugeridaAnterior,
                                    PnrQuantidadeSugerida);//PqtSugeridaAtual:Integer):Boolean;


     if DadosPedido.nrFornecedor>0 then
        if  InsereEventoPedidoCompra(PnrPedido,
                                     dtPedido,
                                     STRTODATE('01/01/2039'),
                                     DaDosPedido.nrCompradorPedido,
                                     0,
                                     DadosPedido.nrFornecedor,
                                     DadosPedido.vtPrecoFornecedorPedido,
                                     DadosPedido.nrItensPedido,
                                     DadosPedido.nrTotalUnidadesPedido,
                                     PidStatusItem[1],
                                     dtSistema,
                                     nmLogin,
                                     PcdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                   DadosPedido.nrPedido,
                                   DadosPedido.dtPedido,
                                   0,
                                   0,
                                   21,
                                   'Item Atualizado -->  Produto '+IntToStr(PnrProduto)+' Quantidade '+inttostr(PnrQuantidadePedido)+' Tela -->'+PnmTelaAlteracao ,
                                   dtSistema,
                                   nmLogin,
                                   PcdEmpresa);

  except
     on E: Exception do
     begin
       trataerro(E.Message, 'Erro ao Gravar Parcelamento');
     end;
  end;

 finally
   FreeAndNil(QryTemp);

 end;
end;
{$ENDREGION 'Atualiza Item Pedido'}
{$REGION 'Atualiza Status Item Pedido'}

function AtualizaStatusItemPedido (PnrPedido, PnrProduto,PnrOperadorLogistico: INTEGER;
  PidStatusItem: String): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      QryTemp.Close;
      QryTemp.SQL.Clear;
      QryTemp.SQL.Add('Update PRDDM.DCPCI set');
      QryTemp.SQL.Add('SITY_Y=:PidStatusItem');
      if PnrOperadorLogistico>1 then
      begin
        QryTemp.SQL.Add(',NR_OPERADOR_LOGISTICO=:PnrOPerador');
        QryTemp.SQL.Add(',pc_verba=0');
        QryTemp.SQL.Add(',nrvv_y=0');
        QryTemp.SQL.Add(',vl_verba=0');
      end;
      QryTemp.SQL.Add('Where');
      QryTemp.SQL.Add('NROP_Y=:PnrPedido');
      if PidStatusItem='N' then
      begin
         QryTemp.SQL.Add('AND CHEY_Y=0 ');
         QryTemp.SQL.Add('AND quay_y>0 ');
         QryTemp.SQL.Add('AND SITY_Y in(''N'',''S'',''W'')');
      end;
      if PidStatusItem='I' then
      begin
         QryTemp.SQL.Add('AND CHEY_Y=0 ');
         QryTemp.SQL.Add('AND SITY_Y in(''N'',''S'',''W'')');
      end;
      if (PnrProduto > 0) AND (PnrPedido>0) then
      begin
        QryTemp.SQL.Add('AND NROM_Y=:PnrProduto');
        QryTemp.SQL.Add('AND SITY_Y in(''N'',''S'',''W'')');
      end;
      if PnrOperadorLogistico>1 then
          QryTemp.ParamByName('PnrOPerador').AsInteger := PnrOperadorLogistico;
      QryTemp.ParamByName('PidStatusItem').AsString := PidStatusItem;
      QryTemp.ParamByName('PnrPedido').AsInteger := PnrPedido;
      if PnrProduto > 0 then
        QryTemp.ParamByName('PnrProduto').AsInteger := PnrProduto;
      if QryTemp.ExecSQL(False) <= 0 then
        RESULT := False
      else
        RESULT := True;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Parcelamento');
      end;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;
{$ENDREGION 'Atualiza Status Item Pedido'}






function AtivarItemPedido (PnrPedido,PnrProduto,PnrEmpresa: INTEGER;PidStatusItem,PnmLogin: String): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      QryTemp.Close;
      QryTemp.SQL.Clear;
      QryTemp.SQL.Add('Update PRDDM.DCPCI set');
      QryTemp.SQL.Add('SITY_Y=:PidStatusItem');
      QryTemp.SQL.Add('Where');
      QryTemp.SQL.Add('NROP_Y=:PnrPedido');
      if PnrProduto>0 then
      QryTemp.SQL.Add('and NROM_Y=:PnrProduto');

      if PidStatusItem='N' then
      begin
         QryTemp.SQL.Add('AND CHEY_Y=0 ');
         QryTemp.SQL.Add('AND QUAY_Y>0 ');
         QryTemp.SQL.Add('AND SITY_Y in(''C'',''I'',''S'',''W'')');
      end;
      if PidStatusItem='I' then
      begin
         QryTemp.SQL.Add('AND CHEY_Y=0 ');
         QryTemp.SQL.Add('AND SITY_Y in(''N'',''S'')');
      end;
     if PidStatusItem='S' then
      begin
         QryTemp.SQL.Add('AND CHEY_Y=0 ');
         QryTemp.SQL.Add('AND QUAY_Y>0 ');
         QryTemp.SQL.Add('AND SITY_Y in(''S'',''I'')');
      end;
      QryTemp.ParamByName('PidStatusItem').AsString := PidStatusItem;
      if PnrProduto>0 then
       QryTemp.ParamByName('PnrProduto').Asbcd := PnrProduto;

      QryTemp.ParamByName('PnrPedido').Asbcd := PnrPedido;

      if QryTemp.ExecSQL(False) <= 0 then
        RESULT := False
      else
      begin
        RESULT := True;
      if PnrProduto>0 then
          GravaEventoLogPedidoCompra(0,
                                 PnrPedido,
                                 dtSistema,
                                 0,
                                 0,
                                 20,
                                 'Pendencia Reativada... usuario - '+PnmLogin+' Produto = '+IntToStr(PnrProduto),
                                 dtSistema,
                                 PnmLogin,
                                 PnrEmpresa);

      end;

    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Parcelamento');
      end;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;
{$ENDREGION 'Ativar  Item Pedido'}



function EliminaItemPedido(nrPedido, nrProduto: INTEGER;
  idStatusItem: String): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Delete PRDDM.DCPCI ');
    QryTemp.SQL.Add('Where');
    QryTemp.SQL.Add('NROP_Y=:PnrPedido');
    QryTemp.SQL.Add('AND NROM_Y=:PnrProduto');
    QryTemp.ParamByName('PnrPedido').AsInteger := nrPedido;
    QryTemp.ParamByName('PnrProduto').AsInteger := nrProduto;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function GetStatusNfe(PnrPedido, PnrProduto: Integer): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('SELECT ID_SITUACAO_NFE_ENTRADA');
    QryTemp.SQL.Add('FROM');
    QryTemp.SQL.Add('PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO ITEM,');
    QryTemp.SQL.Add('PRDDM.DC_NFE_ENTRADA NOTA');
    QryTemp.SQL.Add('WHERE');
    QryTemp.SQL.Add('ITEM.CD_EMPRESA=NOTA.CD_EMPRESA');
    QryTemp.SQL.Add('AND ITEM.CD_FABRICANTE=NOTA.CD_FABRICANTE');
    QryTemp.SQL.Add('AND ITEM.NR_NFE=NOTA.NR_NFE');
    QryTemp.SQL.Add('AND ITEM.NR_NFE_SERIE=NOTA.NR_NFE_SERIE');
    QryTemp.SQL.Add('AND CD_PEDIDO=:PnrPedido AND  CD_MERCADORIA=:PnrProduto');
    QryTemp.ParamByName('PnrPedido').AsInteger := PnrPedido;
    QryTemp.ParamByName('PnrProduto').AsInteger := PnrProduto;
    QryTemp.open;

    if (QryTemp.FieldByName('ID_SITUACAO_NFE_ENTRADA').AsString='T')  then
        RESULT := true
    else
        RESULT := false;
  finally
    FreeAndNil(QryTemp);
  end;
end;




{function EliminaItemQuantidadeZerada(PnrPedido:INTEGER): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('update  PRDDM.DCPCI set sity_y=''I''');
    QryTemp.SQL.Add('Where');
    QryTemp.SQL.Add('NROP_Y=:PnrPedido');
    QryTemp.SQL.Add('AND QUAY_Y=0  ');
    QryTemp.SQL.Add('AND ID_NFE_TRANSITO=''N''');
    QryTemp.ParamByName('PnrPedido').AsInteger := pnrPedido;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
  finally
    FreeAndNil(QryTemp);
  end;
end; }

function EliminaItemQuantidadeZerada(PnrPedido:INTEGER): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('delete PRDDM.DCPCI ');
    QryTemp.SQL.Add('Where');
    QryTemp.SQL.Add('NROP_Y=:PnrPedido');
    QryTemp.SQL.Add('AND QUAY_Y=0  ');
    QryTemp.SQL.Add('AND ID_NFE_TRANSITO=''N''');
    QryTemp.ParamByName('PnrPedido').AsInteger := pnrPedido;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
  finally
    FreeAndNil(QryTemp);
  end;
end;



function AbrePrazoParcelamento(stDiasPrazo: String;
  nrParcelas: INTEGER): INTEGER;
var
  I, pos: INTEGER;
  prazoParcelas: array [1 .. 12] of string[3];
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  for I := 1 to 12 do
    prazoParcelas[I] := '000';
  pos := 1;
  for I := 1 to nrParcelas do
  begin
    prazoParcelas[I] := copy(stDiasPrazo, pos, 3);
    pos := pos + 3;
  end;
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    with QryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select NR_CONDICAO_PAGTO,');
      SQL.Add('NR_DIAS_01,NR_DIAS_02,NR_DIAS_03,NR_DIAS_04,');
      SQL.Add('NR_DIAS_05,NR_DIAS_06,NR_DIAS_07,NR_DIAS_08,');
      SQL.Add('NR_DIAS_09,NR_DIAS_10,NR_DIAS_11,NR_DIAS_12');
      SQL.Add('from');
      SQL.Add('PRDDM.DC_CONDICAO_PAGTO_COMPRA');
      SQL.Add('where');
      SQL.Add('NR_DIAS_01    =:Nrdias01');
      SQL.Add('and NR_DIAS_02=:Nrdias02');
      SQL.Add('and NR_DIAS_03=:Nrdias03');
      SQL.Add('and NR_DIAS_04=:Nrdias04');
      SQL.Add('and NR_DIAS_05=:Nrdias05');
      SQL.Add('and NR_DIAS_06=:Nrdias06');
      SQL.Add('and NR_DIAS_07=:Nrdias07');
      SQL.Add('and NR_DIAS_08=:Nrdias08');
      SQL.Add('and NR_DIAS_09=:Nrdias09');
      SQL.Add('and NR_DIAS_10=:Nrdias10');
      SQL.Add('and NR_DIAS_11=:Nrdias11');
      SQL.Add('and NR_DIAS_12=:Nrdias12');

      ParamByName('Nrdias01').AsInteger := StrToIntDef(prazoParcelas[01], 0);
      ParamByName('Nrdias02').AsInteger := StrToIntDef(prazoParcelas[02], 0);
      ParamByName('Nrdias03').AsInteger := StrToIntDef(prazoParcelas[03], 0);
      ParamByName('Nrdias04').AsInteger := StrToIntDef(prazoParcelas[04], 0);
      ParamByName('Nrdias05').AsInteger := StrToIntDef(prazoParcelas[05], 0);
      ParamByName('Nrdias06').AsInteger := StrToIntDef(prazoParcelas[06], 0);
      ParamByName('Nrdias07').AsInteger := StrToIntDef(prazoParcelas[07], 0);
      ParamByName('Nrdias08').AsInteger := StrToIntDef(prazoParcelas[08], 0);
      ParamByName('Nrdias09').AsInteger := StrToIntDef(prazoParcelas[09], 0);
      ParamByName('Nrdias10').AsInteger := StrToIntDef(prazoParcelas[10], 0);
      ParamByName('Nrdias11').AsInteger := StrToIntDef(prazoParcelas[11], 0);
      ParamByName('Nrdias12').AsInteger := StrToIntDef(prazoParcelas[12], 0);
      open;
    end;
    QryTemp.open;
    RESULT := 0;
    if not QryTemp.IsEmpty then
      RESULT := QryTemp.FieldByName('NR_CONDICAO_PAGTO').AsInteger;
    if RESULT = 0 then
    begin
      CriaPrazoParcelamento(stDiasPrazo, nrParcelas);
      RESULT := AbrePrazoParcelamento(stDiasPrazo, nrParcelas);
    end;

  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;

procedure CriaPrazoParcelamento(stDiasPrazo: String; nrParcelas: INTEGER);
var
  I, pos: INTEGER;
  prazoParcelas: array [1 .. 12] of string[3];
  QryTemp: TSQLQuery;
  nrCodigo: INTEGER;
  stTemp: String;
begin
  for I := 1 to 12 do
    prazoParcelas[I] := '000';
  pos := 1;
  for I := 1 to nrParcelas do
  begin
    prazoParcelas[I] := copy(stDiasPrazo, pos, 3);
    pos := pos + 3;
  end;
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Select max(NR_CONDICAO_PAGTO)+1 as NR_CONDICAO_PAGTO ');
    QryTemp.SQL.Add('from');
    QryTemp.SQL.Add('PRDDM.DC_CONDICAO_PAGTO_COMPRA');
    stTemp := QryTemp.Text;
    QryTemp.open;
    nrCodigo := 0;

    if not QryTemp.IsEmpty then
      nrCodigo := QryTemp.FieldByName('NR_CONDICAO_PAGTO').AsInteger;
    try
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO PRDDM.DC_CONDICAO_PAGTO_COMPRA(');
        SQL.Add('NR_CONDICAO_PAGTO,NR_DIAS_01,NR_DIAS_02,NR_DIAS_03');
        SQL.Add(',NR_DIAS_04,NR_DIAS_05, NR_DIAS_06');
        SQL.Add(',NR_DIAS_07,NR_DIAS_08, NR_DIAS_09');
        SQL.Add(',NR_DIAS_10,NR_DIAS_11, NR_DIAS_12)');
        SQL.Add('VALUES(');
        SQL.Add(':NR_CONDICAO_PAGTO,:NR_DIAS_01,:NR_DIAS_02,:NR_DIAS_03');
        SQL.Add(',:NR_DIAS_04,:NR_DIAS_05,:NR_DIAS_06');
        SQL.Add(',:NR_DIAS_07,:NR_DIAS_08,:NR_DIAS_09');
        SQL.Add(',:NR_DIAS_10,:NR_DIAS_11,:NR_DIAS_12)');

        ParamByName('NR_CONDICAO_PAGTO').AsInteger := nrCodigo;
        ParamByName('NR_DIAS_01').AsInteger :=
          StrToIntDef(prazoParcelas[01], 0);
        ParamByName('NR_DIAS_02').AsInteger :=
          StrToIntDef(prazoParcelas[02], 0);
        ParamByName('NR_DIAS_03').AsInteger :=
          StrToIntDef(prazoParcelas[03], 0);
        ParamByName('NR_DIAS_04').AsInteger :=
          StrToIntDef(prazoParcelas[04], 0);
        ParamByName('NR_DIAS_05').AsInteger :=
          StrToIntDef(prazoParcelas[05], 0);
        ParamByName('NR_DIAS_06').AsInteger :=
          StrToIntDef(prazoParcelas[06], 0);
        ParamByName('NR_DIAS_07').AsInteger :=
          StrToIntDef(prazoParcelas[07], 0);
        ParamByName('NR_DIAS_08').AsInteger :=
          StrToIntDef(prazoParcelas[08], 0);
        ParamByName('NR_DIAS_09').AsInteger :=
          StrToIntDef(prazoParcelas[09], 0);
        ParamByName('NR_DIAS_10').AsInteger :=
          StrToIntDef(prazoParcelas[10], 0);
        ParamByName('NR_DIAS_11').AsInteger :=
          StrToIntDef(prazoParcelas[11], 0);
        ParamByName('NR_DIAS_12').AsInteger :=
          StrToIntDef(prazoParcelas[12], 0);
        if ExecSQL(False) <= 0 then
          mensagem('N?o Cadastrou Parcelamento!!!',16);
      end;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Parcelamento');
      end;
    end;

  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;

function TotalizaPedido(PnrPedido, PnrMercadoria: INTEGER; PidSituacao: String)
  : TTotaLizaPedido;
var
  stQry: TStringList;
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('SUM(QUAY_Y) AS QT_UNIDADES,');
    stQry.Add('SUM(QUAY_Y*PFBY_Y) AS VL_TOTAL_FABRICA,');
    stQry.Add('SUM(QUAY_Y*PUNY_Y) AS VL_TOTAL_LIQUIDO,');
    stQry.Add('SUM(QUAY_Y*VCCI_Y) AS VL_TOTAL_CMV');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROP_Y = ' + inttostr(PnrPedido));
    if PnrMercadoria > 0 then
      stQry.Add('AND NROM_Y = ' + inttostr(PnrMercadoria));
    with QryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(stQry.Text);
      open;
    end;
 //   nrTotalUnidadesPedido := 0;
//    vtPedidoFabrica := 0;
//    vtPedidoUnitario := 0;

    RESULT.vlPedidoBruto := 0;
    RESULT.vlPedidoLiquido := 0;
    RESULT.vlPedidoLista := 0;
    RESULT.nrUnidadesPedido := 0;
    if not QryTemp.IsEmpty then
    begin
      RESULT.vlPedidoBruto := QryTemp.FieldByName('VL_TOTAL_FABRICA').AsFloat;
      RESULT.vlPedidoLiquido := QryTemp.FieldByName('VL_TOTAL_LIQUIDO').AsFloat;
      RESULT.vlPedidoLista := 0;
      RESULT.nrUnidadesPedido := QryTemp.FieldByName('QT_UNIDADES').AsInteger;
      Result.vlPedidoCMV     := QryTemp.FieldByName('VL_TOTAL_CMV').AsFloat;

  //    nrTotalUnidadesPedido := QryTemp.FieldByName('QT_UNIDADES').AsInteger;
  //    vtPedidoFabrica       := QryTemp.FieldByName('VL_TOTAL_FABRICA').AsFloat;
   //   vtPedidoUnitario      := QryTemp.FieldByName('VL_TOTAL_LIQUIDO').AsFloat;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;

function TotalizaPedidoEmpresa(nrPedidoSC, nrPedidoRS, nrMercadoria: INTEGER;
  idSituacao: String): TTotaLizaPedido;
var
  stQry: TStringList;
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('SUM(QUAY_Y) AS QT_UNIDADES,');
    stQry.Add('SUM(QUAY_Y*PFBY_Y) AS VL_TOTAL_FABRICA,SUM(QUAY_Y*PUNY_Y) AS VL_TOTAL_LIQUIDO,');
    stQry.Add('SUM(QUAY_Y*VCCI_Y) AS VL_TOTAL_CMV');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND NROP_Y in(:PnrPedidoSC,:PnrPedidoRS)');
    if nrMercadoria > 0 then
      stQry.Add('AND NROM_Y = :PnrMercadoria');
    with QryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(stQry.Text);
      ParamByName('PnrPedidoSC').AsInteger := nrPedidoSC;
      ParamByName('PnrPedidoRS').AsInteger := nrPedidoRS;
      if nrMercadoria > 0 then
        ParamByName('PnrMercadoria').AsInteger := nrMercadoria;
      open;
    end;

    FillChar(Result,sizeof(Result),0);
    if not QryTemp.IsEmpty then
    begin
      RESULT.vlPedidoBruto    := QryTemp.FieldByName('VL_TOTAL_FABRICA').AsFloat;
      RESULT.vlPedidoLiquido  := QryTemp.FieldByName('VL_TOTAL_LIQUIDO').AsFloat;
      RESULT.vlPedidoLista    := 0;
      RESULT.nrUnidadesPedido := QryTemp.FieldByName('QT_UNIDADES').AsInteger;
      RESULT.vlPedidoCMV      := QryTemp.FieldByName('VL_TOTAL_CMV').AsFloat;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;

function CalculaPcVerba(pcVerba, vlDescontoAdicional, pcoUnitario, pcIPI,
   vlVerbaAnterior, pcAliquotaIcms: Double;
  nrMercadoria, nrECNM_M, qtComprada,PnrFornecedor: INTEGER; idPisCofins: String): Double;
var
  vlVerbaCalculado, vlCustoInicial: Double;
begin
  vlCustoInicial := 0;
  vlVerbaCalculado := qtComprada * vlDescontoAdicional;

  if pcVerba <= 100 then
    vlVerbaCalculado := vlVerbaCalculado * (pcVerba / 100);
  // vlVerbaCalculado := vlVerbaCalculado;// - (vlVerbaCalculado * (pcIPI / 100));
  RESULT := 0;
  if qtComprada > 0 then
    vlVerbaCalculado := (vlVerbaCalculado / qtComprada);
  if vlVerbaCalculado > 0 then
  begin
    IF vlVerbaAnterior = 0 THEN
      vlVerbaAnterior := vlVerbaCalculado;

    vlCustoInicial := pcoUnitario + (vlVerbaCalculado / qtComprada);
    RESULT := vlVerbaCalculado;
   if nmBaseDados<>'SIPRD' then
    runCalculoMargem(pcAliquotaIcms, nrECNM_M, nrMercadoria,PnrFornecedor, idPisCofins[1],vlCustoInicial,1);

  end;

  // VT_DESCONTO_ADIC := VT_DESCONTO_ADIC + VL_VERBA;
end;

(* ****************************************************** *)
{$REGION 'Calcula MArgem Item'}

function runCalculoMargem(AliquotaIcms: Double;
                          FamiliaProduto: INTEGER; { CMCM_M 1- medicamrnto 2- perfumaria }
                          nrProduto,PnrFornecedor: INTEGER; idPisConfins: Char;
                          vlCusto_mais_vlVerbaUnitario: Double;
                          PnrOPeradorLogistico:Integer): Double;
var
  rotinaMargem: TRotinaMargemGam;
  param: TParametrosRotinaMargemGam;
  nrMeioVenda: INTEGER;
begin
  rotinaMargem := TRotinaMargemGam.Create;
  param := TParametrosRotinaMargemGam.Create;

  InformacaoProduto('1', '1', PnrOPeradorLogistico, 98, nrProduto, 2, 0);
  nrMeioVenda := MeioVenda(PnrOPeradorLogistico, PnrFornecedor);

  param.AliquotaIcms := AliquotaIcms;
  param.aliquotaRepasse := 0;
  param.classificacaoMercadoria := FamiliaProduto;
  param.codigoCliente := 98;
  param.codigoEmpresa := 1;
  param.codigoMercadoria := nrProduto;
  param.codigoOperadorLogistico := PnrOPeradorLogistico;
  param.conexao := _dm._conexao;
  param.dataReferencia := dtSistema;
  param.indicadorDescontoInformado := 'S';
  param.indicadorPisCofins := idPisConfins;
  param.isOrgaoPublico := 'N';
  param.MeioVenda := nrMeioVenda;
  param.percentualDescontoInformado := 0;
  param.percentualDespesaVariavel := 0;
  param.percentualMargem := 0;
  param.quantidadeMercadoria := 1;
  param.sinalFlex := ' ';
  param.tipoRegistro := 'C';
  param.valorPrecoBase := 0;
  param.valorSustituicaoTributaria := 0;
  param.valorTotalImpostos := 0;
  param.valorUnitarioCustoGerencial := vlCusto_mais_vlVerbaUnitario;
  param.valorUnitarioDiferencialAliquota := 0;
  param.valorUnitarioFlex := 0;
  param.valorUnitarioMargem := 0;
  param.valorUnitarioVenda := 0;
  param.valorUnitarioVerba := 0;
  param.ufCliente := 'SC';

  rotinaMargem.setParametrosEntrada(param);
 try
   rotinaMargem.executaRotina;
 except
      on E: Exception do
      begin
        //trataerro(E.Message, 'Erro na Rotina margem Compra!!!');

      end;


 end;

  { RECUPERA O RETORNO DA ROTINA }
  //_vlMargem := rotinaMargem.getValorMargem;
 // _vlCorrigidoMargem := rotinaMargem.getValorCorrigidoMargem;
//  _pcMargemVenda :=0;
//  if _vlCorrigidoMargem>0 then
 //    _pcMargemVenda := _vlMargem / _vlCorrigidoMargem * 100
end;
{$ENDREGION 'Calcula MArgem Item'}
(* ****************************************************** *)
{$REGION 'Set Informa??o Produto'}

function InformacaoProduto(idTipoRegistro, idTipoBusca: String;
  cdOperadorLogistico, nrCliente, nrProduto, idTransmisao, idMostraMensagem
  : INTEGER): Boolean;
VAR
  stParametroEntrada, stParametroSaida: sTRING;
  vltemp: String;
  TEMP: sTRING;
  cdtemp, erro: INTEGER;
  idProdutoAtivo:String[1];
begin
  idProdutoAtivo := 'I';
  RESULT := True;
  cdOperadorLogistico := cdOperadorLogistico;
  cdtemp := cdOperadorLogistico;
  try
    stParametroEntrada := idTipoRegistro + formatfloat('000000',
      cdOperadorLogistico) + formatfloat('000000', nrCliente) + idTipoBusca +
      formatfloat('000000000000000', nrProduto);
    _dm._spInformacaoProduto.Close;
    _dm._spInformacaoProduto.ParamByName('ENTRADA_IN').AsString :=
      stParametroEntrada;
    _dm._spInformacaoProduto.Prepared := False;
    _dm._spInformacaoProduto.ExecProc;
    erro := _dm._spInformacaoProduto.ParamByName('erro_ou').value;
    IF erro = 0 then
    begin
      TEMP := '';
      stParametroSaida := _dm._spInformacaoProduto.ParamByName
        ('SAIDA_OU').value;
      idProdutoAtivo := copy(stParametroSaida, 1, 1);
      cdOperadorLogistico := StrToIntDef(copy(stParametroSaida, 9, 6), 1);
      //_pcDescontoOl := StrToFloatDef(copy(stParametroSaida, 15, 5), 0) / 100;
      TEMP := copy(stParametroSaida, 20, 6);
      IF (TRIM(TEMP) <> '') AND (TRIM(TEMP) <> '000000') THEN
        cdOperadorLogistico := STRTOINT(TEMP);
    end;
    if (idProdutoAtivo = 'I') AND (idMostraMensagem <> 1) then
    begin
      RESULT := False;
      mensagem('Produto n?o Cadastrado Para Este OPerador Logistico!!!' + #13 +
        ' N?o pode fazer Pedido se n?o estiver Cadastrado!!!' + #13 +
        '***************************************************' + #13 +
        '***************************************************' + #13 +
        '***** Obs : Se Necess?rio Cadastrar, Falar com CPD ********' + #13 +
        '***************************************************' + #13 +
        '***************************************************',16);
      cdOperadorLogistico := StrToIntDef(TEMP, 1);
      exit;
    end;
  except
    begin
      RESULT := False;
      mensagem('Erro Na Rotina que verifica se cliente Est? Ativos !!!' + #13 +
        'Comunicar Desenvolvimento',64);
    end;
  end;
end;
(* ****************************************************** *)
{$ENDREGION 'Set Informa??o Produto'}
(* ****************************************************** *)

{$REGION 'Set Meio venda'}

function MeioVenda(nrOPeradorLogistico, nrFornecedor: INTEGER): INTEGER;
VAR
  QryTemp: TSQLQuery;
  stQry: String;
BEGIN
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp.SQLConnection := _dm._conexao;

    stQry := 'SELECT cd_meio_venda  FROM prddm.dc_ol_fornecedor' +
      ' WHERE cd_operador=:nrOPeradorLogistico and CD_FORNECEDOR=:nrFornecedor';

    WITH QryTemp DO
    BEGIN
      Close;
      SQL.Clear;
      SQL.Add(stQry);
      ParamByName('nrOPeradorLogistico').AsInteger := nrOPeradorLogistico;
      ParamByName('nrFornecedor').AsInteger := nrFornecedor;
      open;
    END;
    RESULT := 0;
    if not QryTemp.IsEmpty then
      RESULT := QryTemp.FieldByName('cd_meio_venda').AsInteger;
    QryTemp.Close;
    QryTemp := nil;
    QryTemp.Free;
  EXCEPT
    BEGIN
      mensagem('Cod. Operador Inv?lido',16);
      QryTemp.Close;
      QryTemp := nil;
      QryTemp.Free;
    END;
  end;

end;
{$ENDREGION 'Set Meio venda'}

function CalculaPreco(precoFornecedor,
                      pcRepasse,
                      pcDescontoPadrao,
                      pcDescontoAdicinal: Double;
                      idAcumulativo: String;
                      PvlPrecoBase,
                      PpcIcmsCompra:Double): Double;
var
  VlResultado: Double;
begin
  if idAcumulativo = 'N' then
  begin
    VlResultado := precoFornecedor - ((precoFornecedor * pcRepasse) / 100);
    VlResultado := VlResultado -     ((VlResultado * (pcRepasse + pcDescontoAdicinal)) / 100);
    RESULT := VlResultado;
  end
  else
  begin
    VlResultado := precoFornecedor - ((precoFornecedor * pcRepasse) / 100);
    VlResultado := VlResultado - ((VlResultado * pcDescontoPadrao) / 100);
    VlResultado := VlResultado - ((VlResultado * pcDescontoAdicinal) / 100);
    RESULT := VlResultado;
  end;
end;

function LocalizaItemPedido(PnrPedido,
                            PnrMercadoria,
                            PnrEmpresa: INTEGER): TDadosItemPedido;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      Close;
      SQL.Add('Select NROM_Y,QUAY_Y,ABTY_Y,DADY_Y,NRVV_Y ,PC_VERBA,QT_SUGERIDA,SITY_Y');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCPCI ITEM,PRDDM.DCPCC CAPA');
      SQL.Add('WHERE');
      SQL.Add('NROP_Y    =NROP_P');
      SQL.Add('AND NROP_Y    =:nrPedido');
      SQL.Add('AND NROM_Y=:nrMercadoria');
      SQL.Add('AND CAPA.CD_EMPRESA=:cd_empresa');
      ParamByName('nrPedido').AsInteger := PnrPedido;
      ParamByName('nrMercadoria').AsInteger := PnrMercadoria;
      ParamByName('cd_empresa').AsInteger := PnrEmpresa;
      open;
    end;
    RESULT.pcVerba             := 0;
    RESULT.pcDescontoPadrao    := 0;
    RESULT.pcDescontoAdicional := 0;
    RESULT.nrMercadoria        := PnrMercadoria;
    RESULT.nrQuantidadePedido  := 0;
    RESULT.nrVerba             := 0;
    RESULT.nr_pedido           := 0;
    RESULT.idStatusItem        :='S';
    RESULT.qtSugerida          :=0;
    RESULT.idItemGravado       := false;
    RESULT.pcGeracaoVerba      :=0;


    if not QryTemp.IsEmpty then
    begin
      RESULT.pcVerba             := QryTemp.FieldByName('PC_VERBA').AsFloat;
      RESULT.pcDescontoPadrao    := QryTemp.FieldByName('ABTY_Y').AsFloat;
      RESULT.pcDescontoAdicional := QryTemp.FieldByName('DADY_Y').AsFloat;
      RESULT.nrMercadoria        := QryTemp.FieldByName('NROM_Y').AsInteger;
      RESULT.nrQuantidadePedido  := QryTemp.FieldByName('QUAY_Y').AsInteger;
      RESULT.nrVerba             := QryTemp.FieldByName('NRVV_Y').AsInteger;
      RESULT.nr_pedido           := Pnrpedido;
      RESULT.idStatusItem        := QryTemp.FieldByName('SITY_Y').AsString;
      RESULT.qtSugerida          := QryTemp.FieldByName('QT_SUGERIDA').AsInteger;
      RESULT.idItemGravado       := true;

    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function DadosItemPedidoSuspenso(nrPedido,nrEmpresa: INTEGER):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('Select CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,NM_MERCADORIA,');
      SQL.Add('DS_APRESENTACAO_MERCADORIA,QUAY_Y,ABTY_Y,DADY_Y,NRVV_Y ,PC_VERBA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCPCI ITEM,');
      SQL.Add('PRDDM.DCPCC CAPA,');
      SQL.Add('PRDDM.DC_MERCADORIA');
      SQL.Add('WHERE');
      SQL.Add('NROP_Y  =NROP_P');
      SQL.Add('AND NROM_Y  =CD_MERCADORIA');
      SQL.Add('AND NROP_Y    =:PnrPedido');
      SQL.Add('AND ITEM.CD_EMPRESA=:PcdEmpresa');
      ParamByName('PnrPedido').AsInteger := nrPedido;
      ParamByName('PcdEmpresa').AsInteger := nrEmpresa;

    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PnrPedido').AsInteger := nrPedido;
      Params.ParamByName('PcdEmpresa').AsInteger := nrEmpresa;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;



function DadosParamentoCompras(PnrSequencia,PnrGrupoFornecedor,PnrEmpresa,PcdOperadorLogistico: INTEGER):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT SQ_PARAM_PEDIDO_AUTOMATICO, P.CD_GRUPO_FORNECEDOR,DS_GRUPO_FORNECEDOR,');
      SQL.Add('P.CD_EMPRESA,NM_EMPRESA,');
      SQL.Add('ID_ENVIO_AUTOMATICO,');
      SQL.Add('CD_OPERADOR_LOGISTICO,');
      SQL.Add('trim(to_char(P.cd_empresa,''00''))||'' - ''|| nm_empresa AS NM_EMP,');
      SQL.Add('(SELECT trim(TO_Char(CD_OPERADOR_LOGISTICO,''0000''))||'' - ''||DS_OPERADOR_LOGISTICO FROM PRDDM.DC_OPERADOR_LOGISTICO WHERE CD_OPERADOR_LOGISTICO=P.CD_OPERADOR_LOGISTICO) as NM_OL');



      SQL.Add('FROM');
      SQL.Add('PEDIDOAUTOMATICO.DC_PARAM_PEDIDO_AUTOMATICO P,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
      SQL.Add('ACESSO.DC_EMPRESA EMP');
      SQL.Add('WHERE ');
      SQL.Add('P.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      SQL.Add('and P.CD_EMPRESA=EMP.CD_EMPRESA');
      SQL.Add('AND  ID_EMPRESA_FISICA=''S''');
      SQL.Add('AND P.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      if PnrSequencia>0 then
         SQL.Add(' AND SQ_PARAM_PEDIDO_AUTOMATICO=:PnrSequencia');

      if PnrGrupoFornecedor>0 then
         SQL.Add(' AND P.cd_grupo_fornecedor=:PnrGrupoFornecedor');
      if PnrEmpresa>0 then
         SQL.Add(' AND P.cd_empresa=:PcdEmpresa');
      if PcdOperadorLogistico>0 then
         SQL.Add(' AND P.CD_OPERADOR_LOGISTICO=:PnrOperador');



      SQL.Add('UNION ALL');
      SQL.Add('SELECT SQ_PARAM_PEDIDO_AUTOMATICO, P.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR,');
      SQL.Add('P.CD_EMPRESA,''TODAS'' AS NM_EMPRESA,ID_ENVIO_AUTOMATICO,');
      SQL.Add('CD_OPERADOR_LOGISTICO,');
      SQL.Add('trim(TO_Char(substr(P.cd_empresa,1,2),''99''))||'' - ''||''TODAS'' AS NM_EMP,');
      SQL.Add('(SELECT trim(TO_Char(CD_OPERADOR_LOGISTICO,''9999''))||'' - ''||DS_OPERADOR_LOGISTICO DS_OPERADOR_LOGISTICO FROM PRDDM.DC_OPERADOR_LOGISTICO WHERE CD_OPERADOR_LOGISTICO=P.CD_OPERADOR_LOGISTICO) as NM_OL');

      SQL.Add('FROM');
      SQL.Add('PEDIDOAUTOMATICO.DC_PARAM_PEDIDO_AUTOMATICO P,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GF');
      SQL.Add('WHERE');
      SQL.Add('P.CD_EMPRESA=999999');
      SQL.Add('AND P.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      if PnrSequencia>0 then
         SQL.Add(' AND SQ_PARAM_PEDIDO_AUTOMATICO=:PnrSequencia');

      if PnrEmpresa>0 then
         SQL.Add(' AND P.cd_empresa=:PcdEmpresa');

      if PnrGrupoFornecedor>0 then
         SQL.Add(' AND P.cd_grupo_fornecedor=:PnrGrupoFornecedor');
      if PcdOperadorLogistico>0 then
         SQL.Add(' AND P.CD_OPERADOR_LOGISTICO=:PnrOperador');

      sql.SaveToFile('C:\temp\qryComprasParamentro.sql');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      if PnrSequencia>0 then
         Params.ParamByName('PnrSequencia').AsBCD := PnrSequencia;

      if PnrGrupoFornecedor>0 then
         Params.ParamByName('PnrGrupoFornecedor').AsBCD := PnrGrupoFornecedor;

      if PnrEmpresa>0 then
         Params.ParamByName('PcdEmpresa').AsBCD := PnrEmpresa;

      if PcdOperadorLogistico>0 then
         Params.ParamByName('PnrOperador').AsBCD := PcdOperadorLogistico;
         open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function NrParamentoCompras(PnrGrupoFornecedor,PcdOperadorLogistico: INTEGER):Integer;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT COUNT(*) NR_ITENS');
      SQL.Add('FROM PEDIDOAUTOMATICO.DC_PARAM_PEDIDO_AUTOMATICO');
      SQL.Add('WHERE CD_GRUPO_FORNECEDOR=:PcdGrupoFornecedor AND CD_OPERADOR_LOGISTICO=:PcdoperadorLogistico');
      ParamByName('PcdGrupoFornecedor').AsBCD := PnrGrupoFornecedor;
      ParamByName('PcdoperadorLogistico').AsBCD := PcdOperadorLogistico;
      open;
    end;
    Result:=0;
    if not QryTemp.IsEmpty then
       Result:=QryTemp.FieldByName('NR_ITENS').AsInteger

  finally
    FreeAndNil(QryTemp);
  end;
end;




function GetPendenciaFornecedor(nrFornecedor,nrEmpresa: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
              try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;


     SQL.Add('     SELECT ');
     SQL.Add('     NROP_Y,');

     SQL.Add('CASE');
	   SQL.Add('WHEN (capa.cd_empresa<> CAPA.cd_empresa_destino) AND (qt_bonificada=0) THEN ''O.C.D''');
     SQL.Add('WHEN (capa.cd_empresa<> CAPA.cd_empresa_destino) AND (qt_bonificada>0) THEN ''BONIF. O.C.D''');
     SQL.Add('WHEN (capa.cd_empresa = CAPA.cd_empresa_destino) AND (qt_bonificada>0) THEN ''BONIF.NORMAL''');
     SQL.Add('WHEN (capa.cd_empresa = CAPA.cd_empresa_destino) AND (qt_bonificada=0) THEN ''NORMAL''');
     SQL.Add('END ID_TIPO,');
     SQL.Add('     DATP_P,');
     SQL.Add('     MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
     SQL.Add('     DT_AGENDAMENTO,');
     SQL.Add('     QUAY_Y AS QT_PEDIDO,');
     SQL.Add('     CASE');
     SQL.Add('     WHEN Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0)>0 THEN   NVL((SUM(NVL(QT_MERCADORIA_ENTRADA,0))),0)+ Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0)');
     SQL.Add('     WHEN  (QUAY_Y-CHEY_Y) >0 THEN  (QUAY_Y-CHEY_Y)');
     SQL.Add('     ELSE 0');
     SQL.Add('     END  QT_PENDENTE ');
     SQL.Add('     ,Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0) AS QT_MERCADORIA_ENTRADA');
     SQL.Add('     ,Nvl(QT_TRANSFERENCIA,0) AS QT_TRANSFERENCIA');
     SQL.Add('     ,Nvl(QT_TRANSITO,0) AS QT_TRANSITO');

     SQL.Add('     ,SITY_Y,ABTY_Y,DADY_Y');
     SQL.Add('     ,CASE');
     SQL.Add('     WHEN Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0)>0 THEN   nvl(NVL((SUM(NVL(QT_MERCADORIA_ENTRADA,0))),0)+ Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0) *PFBY_Y,0)');
     SQL.Add('     WHEN  (QUAY_Y-CHEY_Y) >0 THEN  (QUAY_Y-CHEY_Y)*PFBY_Y');
     SQL.Add('     ELSE 0');
     SQL.Add('     END   VL_PENDENTE,');
     SQL.Add('     NROM_Y,CAPA.CD_EMPRESA,VCCI_Y,');
     SQL.Add('     CASE');
     SQL.Add('     WHEN (Nvl(QT_TRANSITO,0)+Nvl(QT_TRANSITO,0)>0) or (Nvl(CRITICA.NR_NFE,0)>0) THEN ''S''');
     SQL.Add('     ELSE ID_NFE_TRANSITO');
     SQL.Add('     END ID_NFE_TRANSITO,');
     SQL.Add('     CAPA.cd_empresa_destino cd_destino');
     SQL.Add('     ,max(Nvl(QT_ITEM_PEDIDO,0)) AS QT_ITEM_PEDIDO');
     SQL.Add('');
     SQL.Add('     FROM');
     SQL.Add('     PRDDM.DC_COMPRA_MERCADORIA CM');
     SQL.Add('     JOIN PRDDM.DC_MERCADORIA MERCADORIA ON MERCADORIA.CD_MERCADORIA=CM.CD_MERCADORIA');
     SQL.Add('     JOIN PRDDM.DCPCI ITEM ON ITEM.NROM_Y=MERCADORIA.CD_MERCADORIA and SITY_Y IN(''N'',''P'')');
     SQL.Add('     JOIN PRDDM.DCPCC CAPA ON  NROP_Y  =NROP_P  AND SITP_P IN(''N'',''P'')   AND ((CAPA.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)  ');
     SQL.Add('     JOIN ACESSO.DC_EMPRESA EMP ON  EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO AND  EMP.ID_EMPRESA_FISICA=''S''');
     SQL.Add('     LEFT OUTER JOIN PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE ON  PEDIDO_ITEM_NFE.CD_PEDIDO = NROP_P');
     SQL.Add('                                                                          AND MERCADORIA.CD_MERCADORIA= PEDIDO_ITEM_NFE.CD_MERCADORIA');
     SQL.Add('                                                                          AND  PEDIDO_ITEM_NFE.cd_empresa=CAPA.CD_EMPRESA');
     SQL.Add('     LEFT OUTER JOIN PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE ON  ITEM_NFE.CD_EMPRESA = CAPA.CD_EMPRESA');
     SQL.Add('                                                                     AND ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
     SQL.Add('                                                                      AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
     SQL.Add('                                                                      AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
     SQL.Add('                                                                      AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
     SQL.Add('                                                                      AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
     SQL.Add('     LEFT OUTER  JOIN PRDDM.DC_NFE_ENTRADA NFE ON     NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
     SQL.Add('                                                      AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
     SQL.Add('                                                      AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
     SQL.Add('                                                       AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
     SQL.Add('                                                       AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
     SQL.Add('                                                       AND ITEM_NFE.CD_MERCADORIA = CM.CD_MERCADORIA');
     SQL.Add('                                                       AND ITEM_NFE.CD_EMPRESA = CM.CD_MERCADORIA');
     SQL.Add('      lEFT OUTER JOIN');
     SQL.Add('     (SELECT DISTINCT CRITICA.NR_CNPJ_EMITENTE,QT_ITEM_PEDIDO ,cm.CD_MERCADORIA,ITEM_CRITICA.NR_NFE as NR_NFE,NR_PEDIDO_GAM,CRITICA.CD_EMPRESA');
     SQL.Add('     FROM');
     SQL.Add('      PRDDM.DC_COMPRA_CRITICA_ENTRADA CRITICA,');
     SQL.Add('      PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA ITEM_CRITICA,');
     SQL.Add('      prddm.dc_compra_mercadoria CM');
     SQL.Add('     WHERE');
     SQL.Add('      CRITICA.NR_NFE=ITEM_CRITICA.NR_NFE');
     SQL.Add('      AND cm.cd_mercadoria=  ITEM_CRITICA.cd_mercadoria');
     SQL.Add('      AND CRITICA.CD_EMPRESA=ITEM_CRITICA.CD_EMPRESA');
     SQL.Add('      AND cm.cd_grupo_fornecedor=:PnrFornecedor) cRITICA ON CRITICA.NR_PEDIDO_GAM=ITEM.NROP_y');
     SQL.Add('                                                 AND  CRITICA.CD_MERCADORIA=ITEM.NROM_Y');
     SQL.Add('                                                 AND  CRITICA.CD_EMPRESA=ITEM.CD_empresa');
     SQL.Add('                                                 AND  CRITICA.nr_nfe=ITEM_NFE.NR_NFE_SERIE');
     SQL.Add('');
     SQL.Add('     LEFT OUTER JOIN GAMNFE.DC_EVT_NFE_COMPRA EVT ON  EVT.CD_PEDIDO=NROP_P AND EVT.CD_EMPRESA=CAPA.CD_EMPRESA  AND EVT.NR_NFE=ITEM_NFE.NR_NFE');
     SQL.Add('     LEFT OUTER JOIN GAMNFE.DC_EVT_AGENDAMENTO_DESCARGA EAG ON');
     SQL.Add('     EVT.SQ_AGENDAMENTO_DESCARGA = EAG.SQ_AGENDAMENTO_DESCARGA AND EVT.CD_EMPRESA = EAG.CD_EMPRESA');
     SQL.Add('');
     SQL.Add('     LEFT OUTER JOIN');
     SQL.Add('          (SELECT');
     SQL.Add('      CM.CD_MERCADORIA');
     SQL.Add('     ,CD_EMPRESA_DESTINO');
     SQL.Add('     ,SUM(NVL(QT_TRANSFERENCIA,0))  AS QT_TRANSFERENCIA');
     SQL.Add('     ,SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
     SQL.Add('     FROM');
     SQL.Add('       PRDDM.DC_ESTOQUE_TRANSFERENCIA ET,');
     SQL.Add('       PRDDM.DC_compra_mercadoria cm');
     SQL.Add('     WHERE');
     SQL.Add('       ET.CD_MERCADORIA=CM.CD_MERCADORIA');
     SQL.Add('       AND ET.CD_EMPRESA_DESTINO=CM.CD_EMPRESA');
     SQL.Add('       AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     SQL.Add('');
     SQL.Add('     GROUP BY  CM.CD_MERCADORIA,');
     SQL.Add('     CD_EMPRESA_DESTINO) TRANS ON TRANS.CD_MERCADORIA=ITEM.NROM_Y AND TRANS.CD_EMPRESA_DESTINO=CAPA.CD_EMPRESA_DESTINO');
     SQL.Add('');
     SQL.Add('');
     SQL.Add('');
     SQL.Add('');
     SQL.Add('     WHERE');
     SQL.Add('      MERCADORIA.CD_MERCADORIA=CM.CD_MERCADORIA');
     SQL.Add('      AND CM.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
     SQL.Add('      AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     SQL.Add('');
     SQL.Add('     GROUP BY NROP_Y,DATP_P,MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA ,');
     SQL.Add('     QUAY_Y ,SITY_Y,ABTY_Y,DADY_Y,CHEY_Y,VCCI_Y,PFBY_Y,ID_NFE_TRANSITO,qt_bonificada,');
     SQL.Add('     NROM_Y,CAPA.CD_EMPRESA,DT_AGENDAMENTO,CAPA.cd_empresa_destino,Nvl(CRITICA.NR_NFE,0)');
     SQL.Add('     ,Nvl(QT_TRANSFERENCIA,0)');
     SQL.Add('     ,Nvl(QT_TRANSITO,0)');


{      SQL.Add('SELECT');
      SQL.Add('NROP_Y,');
      SQL.Add('DATP_P,');
      SQL.Add('MERC.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
      SQL.Add('DT_AGENDAMENTO,');
      SQL.Add('QUAY_Y AS QT_PEDIDO,');
      SQL.Add('SITY_Y,ABTY_Y,DADY_Y,');
      SQL.Add('Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0) AS QT_MERCADORIA_ENTRADA,');
      SQL.Add('CASE');
      SQL.Add('WHEN Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0)>0 THEN   NVL((SUM(NVL(QT_MERCADORIA_ENTRADA,0))),0)+ Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0)');
      SQL.Add('WHEN  (QUAY_Y-CHEY_Y) >0 THEN  (QUAY_Y-CHEY_Y)');
      SQL.Add('ELSE 0');
      SQL.Add('END  QT_PENDENTE ,');
      SQL.Add('CASE');
      SQL.Add('WHEN Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0)>0 THEN   nvl(NVL((SUM(NVL(QT_MERCADORIA_ENTRADA,0))),0)+ Nvl(QT_TRANSFERENCIA,0)+Nvl(QT_TRANSITO,0) *PFBY_Y,0) ');
      SQL.Add('WHEN  (QUAY_Y-CHEY_Y) >0 THEN  (QUAY_Y-CHEY_Y)*PFBY_Y');
      SQL.Add('ELSE 0');
      SQL.Add('END   VL_PENDENTE,');
      SQL.Add('NROM_Y,CAPA.CD_EMPRESA,VCCI_Y,');
      SQL.Add('CASE');
      SQL.Add('WHEN VCCI_Y=0 THEN ''BONIF.''');
      SQL.Add('WHEN VCCI_Y>0 THEN ''NORMAL''');
      SQL.Add('END ID_TIPO,');
      SQL.Add('CASE');
      SQL.Add('WHEN (Nvl(QT_TRANSITO,0)+Nvl(QT_TRANSITO,0)>0) or (Nvl(CRITICA.NR_NFE,0)>0) THEN ''S''');
      SQL.Add('ELSE ID_NFE_TRANSITO');
      SQL.Add('END ID_NFE_TRANSITO,');
      SQL.Add('CAPA.cd_empresa_destino cd_destino ');
      SQL.Add(',max(Nvl(QT_ITEM_PEDIDO,0)) AS QT_ITEM_PEDIDO');
      SQL.Add(',Nvl(QT_TRANSFERENCIA,0) AS QT_TRANSFERENCIA');
      SQL.Add(',Nvl(QT_TRANSITO,0) AS QT_TRANSITO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA MERC');
      SQL.Add('JOIN PRDDM.DCPCI ITEM ON ITEM.NROM_Y=MERC.CD_MERCADORIA and SITY_Y IN(''N'',''P'')');
      SQL.Add('JOIN PRDDM.DCPCC CAPA ON  NROP_Y  =NROP_P  AND SITP_P IN(''N'',''P'')  ');
      SQL.Add('       AND ((CAPA.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');

      SQL.Add('JOIN ACESSO.DC_EMPRESA EMP ON  EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO AND  EMP.ID_EMPRESA_FISICA=''S''');
      //SQL.Add('LEFT OUTER JOIN PRDDM.DC_ESTOQUE_TRANSFERENCIA TRANS ON TRANS.CD_MERCADORIA=ITEM.NROM_Y AND TRANS.CD_EMPRESA_DESTINO=CAPA.cd_empresa_destino');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE ON  PEDIDO_ITEM_NFE.CD_PEDIDO = NROP_P AND ITEM.NROM_Y= PEDIDO_ITEM_NFE.CD_MERCADORIA');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE ON  ITEM_NFE.CD_EMPRESA = CAPA.CD_EMPRESA');
      SQL.Add('                                                                AND ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
      SQL.Add('                                                                 AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
      SQL.Add('                                                                 AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
      SQL.Add('                                                                 AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
      SQL.Add('                                                                 AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
      SQL.Add('LEFT OUTER  JOIN PRDDM.DC_NFE_ENTRADA NFE ON     NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
      SQL.Add('                                                 AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
      SQL.Add('                                                 AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
      SQL.Add('                                                  AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
      SQL.Add('                                                  AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
      SQL.Add('                                                  AND ITEM_NFE.CD_MERCADORIA = ITEM.NROM_Y');
      SQL.Add('LEFT OUTER JOIN');
      SQL.Add('(SELECT DISTINCT CRITICA.NR_CNPJ_EMITENTE,QT_ITEM_PEDIDO ,CD_MERCADORIA,ITEM_CRITICA.NR_NFE as NR_NFE,NR_PEDIDO_GAM,CRITICA.CD_EMPRESA');
      SQL.Add('FROM');
      SQL.Add(' PRDDM.DC_COMPRA_CRITICA_ENTRADA CRITICA,');
      SQL.Add(' PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA ITEM_CRITICA');
      SQL.Add('WHERE');
      SQL.Add(' CRITICA.NR_NFE=ITEM_CRITICA.NR_NFE');
      SQL.Add(' AND CRITICA.CD_EMPRESA=ITEM_CRITICA.CD_EMPRESA) CRITICA ON CRITICA.NR_PEDIDO_GAM=ITEM.NROP_y');
      SQL.Add('                                                                 AND  CRITICA.CD_MERCADORIA=ITEM.NROM_Y');
      SQL.Add('                                                                 AND CRITICA.CD_EMPRESA=ITEM.CD_empresa');

      SQL.Add('LEFT OUTER JOIN GAMNFE.DC_EVT_NFE_COMPRA EVT ON  EVT.CD_PEDIDO=NROP_P AND');
      SQL.Add('EVT.CD_EMPRESA=CAPA.CD_EMPRESA  AND EVT.NR_NFE=ITEM_NFE.NR_NFE');
      SQL.Add('LEFT OUTER JOIN GAMNFE.DC_EVT_AGENDAMENTO_DESCARGA EAG ON');
      SQL.Add('EVT.SQ_AGENDAMENTO_DESCARGA = EAG.SQ_AGENDAMENTO_DESCARGA AND EVT.CD_EMPRESA = EAG.CD_EMPRESA');
        SQL.Add('LEFT OUTER JOIN');
        SQL.Add('     (SELECT');
        SQL.Add('CM.CD_MERCADORIA');
        SQL.Add(',CD_EMPRESA_DESTINO');
        SQL.Add(',SUM(NVL(QT_TRANSFERENCIA,0))  AS QT_TRANSFERENCIA');
        SQL.Add(',SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
        SQL.Add('FROM');
        SQL.Add('  PRDDM.DC_ESTOQUE_TRANSFERENCIA ES,');
        SQL.Add('  PRDDM.DC_compra_mercadoria CM');
        SQL.Add('where ');
        SQL.Add(' es.cd_mercadoria=cm.cd_mercadoria');
        SQL.Add(' and  es.cd_empresa_destino=cm.cd_empresa');
        SQL.Add(' AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        SQL.Add('GROUP BY  CM.CD_MERCADORIA,');
        SQL.Add('CD_EMPRESA_DESTINO )  TRANS ON TRANS.CD_MERCADORIA=ITEM.NROM_Y AND TRANS.CD_EMPRESA_DESTINO=CAPA.CD_EMPRESA_DESTINO');


      SQL.Add('WHERE');
      SQL.Add('LABP_P=:PnrFornecedor');
      SQL.Add('GROUP BY NROP_Y,DATP_P,MERC.CD_MERCADORIA*10+NR_DV_MERCADORIA ,');
      SQL.Add('QUAY_Y ,SITY_Y,ABTY_Y,DADY_Y,CHEY_Y,VCCI_Y,PFBY_Y,ID_NFE_TRANSITO,');
      SQL.Add('NROM_Y,CAPA.CD_EMPRESA,DT_AGENDAMENTO,CAPA.cd_empresa_destino,Nvl(CRITICA.NR_NFE,0)');
      SQL.Add(',Nvl(QT_TRANSFERENCIA,0)');
      SQL.Add(',Nvl(QT_TRANSITO,0)');  }



      sql.SaveToFile('c:\temp\Compras_PendenciaFornecedorItem.sql');
      ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function GetProdutosOl(PnrOPerador,PnrEmpresa: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT CD_OPERADOR  ,  CD_FORNECEDOR  ,  CD_MERCADORIA,');
      SQL.Add('PC_DESC_VENDA_MINIMO,  PC_DESC_VENDA_MAXIMO,');
      SQL.Add('PC_DESC_COMPRA ,  ID_BONIFICACAO_COMPRA,');
      SQL.Add('ID_BONIFICACAO_VENDA  ,QT_DIAS_REPOSICAO ,');
      SQL.Add('QT_DIAS_ESTOQUE,  DT_ATUALIZACAO , NM_USUARIO, CD_EMPRESA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_OL_PRODUTO');
      SQL.Add('WHERE');
      SQL.Add('CD_OPERADOR=:PcdOPerador');
//    ParamByName('PcdOPerador').AsInteger := PnrOPerador;
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PcdOPerador').AsInteger := PnrOPerador;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function AbreCapaPedido(nrPedido, nrLaboratorio: INTEGER; idSituacao: String): TDadosCapaPedido;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    with QryTemp do
    begin

       FillChar(Result,sizeof(Result),0);

      if nrPedido > 0 then
      begin
        SQL.Add('SELECT');
        SQL.Add('NROP_P , LABP_P, DATP_P , ABTP_P , DESP_P , SITP_P,');
        SQL.Add('PRZP_P , PREP_P, OBSP_P , SNRP_P , FLAP_P , NR_CONDICAO_PAGTO_P,');
        SQL.Add('NM_USUARIO , DT_FECHAMENTO_PEDIDO, DT_PREVISTA_FATURAMENTO, ID_CIF_FOB,');
        SQL.Add('CD_OPERADOR_LOGISTICO , NM_MAQUINA,DT_AGENDAMENTO_PEDIDO, DT_DIGITACAO,');
        SQL.Add('QT_PALETE  , QT_CAIXA , DT_TRANSMITIDO,CD_EMPRESA,');
        SQL.Add('PC_VERBA_GERACAO,NR_VERBA_GERACAO,CD_EMPRESA_DESTINO,ID_CROSSDOCKING,NR_LISTA_PRECO');
        SQL.Add('FROM');
        SQL.Add('PRDDM.DCPCC');
        SQL.Add('WHERE');
        SQL.Add('NROP_P =:PnrPedido');
        ParamByName('PnrPedido').AsInteger := nrPedido;
        open;
        if not QryTemp.IsEmpty then
        begin
          RESULT.nrPedido := QryTemp.FieldByName('NROP_P').AsInteger;
          RESULT.nrFornecedor := QryTemp.FieldByName('LABP_P').AsInteger;
          RESULT.nrEmpresa := QryTemp.FieldByName('CD_EMPRESA').AsInteger;;
          RESULT.nrOPeradorLogistico := QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger;;
          RESULT.idStatusPedido := QryTemp.FieldByName('SITP_P').AsString[1];
          RESULT.DataPedido := QryTemp.FieldByName('DATP_P').AsDateTime;
          RESULT.cdPagamento := QryTemp.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger;
          RESULT.nrCD := QryTemp.FieldByName('CD_EMPRESA').AsInteger;
          RESULT.pcDescontoPadrao := QryTemp.FieldByName('ABTP_P').AsInteger;
          Result.dsObsevacao      := QryTemp.FieldByName('OBSP_P').AsString;
          Result.pcGeracaoVerba   := QryTemp.FieldByName('PC_VERBA_GERACAO').AsFloat;
          Result.nrGeracaoVerba   := QryTemp.FieldByName('NR_VERBA_GERACAO').AsInteger;
          Result.nrCdDestino      := QryTemp.FieldByName('CD_EMPRESA_DESTINO').AsInteger;
          Result.idCrossDocking   := QryTemp.FieldByName('ID_CROSSDOCKING').AsString;
          Result.nrListaPrecoExcecao := QryTemp.FieldByName('NR_LISTA_PRECO').AsInteger;

        end;
      end;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

FUNCTION GetListaPrecoLaboratorio(vlPrecoFornecedor,
                                  pcDescontoAbatimento: Double;
                                  NrListaPreco,
                                  nrLaboratorio,
                                  nrProduto,
                                  nrEmpresa: INTEGER;
                                  idPrecoAtual: String;
                                  dtPedido: Tdate): TClientDataSet;
var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
  _cdsTemp: TClientDataSet;
  stQry :TStringList;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    stQry:=TStringList.Create;

    with QryTemp do
    begin

      SQL.Add('SELECT');
      SQL.Add('A.CD_MERCADORIA,CD_LISTA_GAM,VL_LISTA_ANTERIOR,');
      SQL.Add('VL_UNITARIO_COMPRA  , PC_MUDANCA_PRECO,A.CD_EMPRESA,');
      SQL.Add('NVL(PC_ICMS_COMPRA,0) AS PC_ICMS_COMPRA, NVL(VL_BASE_COMPRA,0) AS VL_BASE_COMPRA,');
      SQL.Add('NVL(PC_ICMS_COMPRA_ANTERIOR,0) AS PC_ICMS_COMPRA_ANTERIOR,PC_IPI_MERCADORIA,');
      SQL.Add('NVL(VL_BASE_VENDA,0) AS VL_BASE_VENDA, NVL(PC_ICMS_VENDA,0) AS  PC_ICMS_VENDA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR A,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      SQL.Add('WHERE');
      SQL.Add('COMPRA.CD_MERCADORIA=A.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
      if nrProduto > 0 then
         SQL.Add('AND A.CD_MERCADORIA=:PnrProduto');

      SQL.Add('AND A.CD_MERCADORIA=A.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_EMPRESA=A.CD_EMPRESA');
      SQL.Add('AND A.DT_MUDANCA_PRECO=(SELECT MAX(B.DT_MUDANCA_PRECO)');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR B,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      SQL.Add('WHERE COMPRA.CD_MERCADORIA=B.CD_MERCADORIA');
      SQL.Add('AND A.CD_MERCADORIA=B.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
      SQL.Add('AND A.CD_EMPRESA=B.CD_EMPRESA');
      SQL.Add('AND COMPRA.CD_EMPRESA=B.CD_EMPRESA');
      SQL.Add('AND B.DT_ATUALIZACAO<=SYSDATE AND B.CD_EMPRESA=COMPRA.CD_EMPRESA)');
   //   SQL.Add('AND trumc(B.DT_MUDANCA_PRECO) <=TRUNC(SYSDATE) AND B.CD_EMPRESA=COMPRA.CD_EMPRESA)');




    end;

    stQry.Add(QryTemp.Text);
    stQry.SaveToFile('C:\TEMP\qryLIstaPreco.sql');
    with _cdsTemp do
    begin
      Close;
      CommandText := QryTemp.Text;
      if  nrLaboratorio>0 then
         Params.ParamByName('PnrLaboratorio').Asbcd := nrLaboratorio;
      if nrProduto > 0 then
        Params.ParamByName('PnrProduto').Asbcd   := nrProduto;
      open;
    end;
    RESULT := nil;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.RecordCount;
      RESULT := _cdsTemp;
    end;
  finally
    FreeAndNil(QryTemp);
    FreeAndNil(stQry);
  end;
end;



FUNCTION GetListaPrecoBUsca(vlPrecoFornecedor,
                                 PpcDescontoAbatimento: Double;
                                  NrListaPreco,
                                  nrLaboratorio,
                                  nrProduto,
                                  nrEmpresa: INTEGER;
                                  idPrecoAtual: String;
                                  dtPedido: Tdate): TListaPreco;
var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
  _cdsTemp: TClientDataSet;
  stQry :TStringList;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    stQry:=TStringList.Create;

    with QryTemp do
    begin

      SQL.Add('SELECT');
      SQL.Add('A.CD_MERCADORIA,CD_LISTA_GAM,VL_LISTA_ANTERIOR,');
      SQL.Add('VL_UNITARIO_COMPRA  , PC_MUDANCA_PRECO,A.CD_EMPRESA,');
      SQL.Add('NVL(PC_ICMS_COMPRA,0) AS PC_ICMS_COMPRA, NVL(VL_BASE_COMPRA,0) AS VL_BASE_COMPRA,');
      SQL.Add('NVL(PC_ICMS_COMPRA_ANTERIOR,0) AS PC_ICMS_COMPRA_ANTERIOR,PC_IPI_MERCADORIA,');
      SQL.Add('NVL(VL_BASE_VENDA,0) AS VL_BASE_VENDA, NVL(PC_ICMS_VENDA,0) AS  PC_ICMS_VENDA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR A,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      SQL.Add('WHERE');
      SQL.Add('COMPRA.CD_MERCADORIA=A.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
      if nrProduto > 0 then
         SQL.Add('AND A.CD_MERCADORIA=:PnrProduto');

      SQL.Add('AND A.CD_MERCADORIA=A.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_EMPRESA=A.CD_EMPRESA');
      SQL.Add('AND A.CD_EMPRESA=:PcdEmpresa');
      SQL.Add('AND A.DT_MUDANCA_PRECO=(SELECT MAX(B.DT_MUDANCA_PRECO)');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR B,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      SQL.Add('WHERE COMPRA.CD_MERCADORIA=B.CD_MERCADORIA');
      SQL.Add('AND A.CD_MERCADORIA=B.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
      SQL.Add('AND A.CD_EMPRESA=B.CD_EMPRESA');
      SQL.Add('AND COMPRA.CD_EMPRESA=B.CD_EMPRESA');
      SQL.Add('AND B.CD_EMPRESA=:PcdEmpresa');
      SQL.Add('AND B.DT_MUDANCA_PRECO <=:PdtPedido AND B.CD_EMPRESA=COMPRA.CD_EMPRESA)');
      ParamByName('PdtPedido').AsDateTime:=dtPedido;
      ParamByName('PcdEmpresa').Asbcd := nrEmpresa;
      if  nrLaboratorio>0 then
         ParamByName('PnrLaboratorio').Asbcd := nrLaboratorio;
      if nrProduto > 0 then
        Params.ParamByName('PnrProduto').Asbcd   := nrProduto;
      open;
    end;

    stQry.Add(QryTemp.Text);
    stQry.SaveToFile('C:\TEMP\qryLIstaPreco.sql');


    if not QryTemp.IsEmpty then
    begin
      Result.vlPrecoLista := QryTemp.FieldByName('VL_BASE_COMPRA').AsFloat ;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco    := QryTemp.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase     := QryTemp.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra    := QryTemp.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista      := QryTemp.FieldByName('PC_IPI_MERCADORIA').AsFloat;
      Result.pcIcmsVenda     := QryTemp.FieldByName('PC_ICMS_VENDA').AsFloat;
      Result.vlBaseVenda     := QryTemp.FieldByName('VL_BASE_VENDA').AsFloat;


    if Result.PcIcmsCompra>0 then
       Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));



    end;
  finally
    FreeAndNil(QryTemp);
    FreeAndNil(stQry);
  end;
end;


function GetOPeracaoLogistica(nrFornecedor: INTEGER): INTEGER;
var
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      SQL.Add('SELECT CD_FORNECEDOR,OL.CD_OPERADOR_LOGISTICO,');
      SQL.Add('DS_OPERADOR_LOGISTICO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_OL_FORNECEDOR OL_FOR,');
      SQL.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      SQL.Add('WHERE');
      SQL.Add('OL_FOR.CD_OPERADOR=OL.CD_OPERADOR_LOGISTICO');
      SQL.Add('AND ID_SITUACAO=''A''');
      SQL.Add('AND CD_FORNECEDOR=:PnrFornecedor');
      SQL.Add('UNION ALL');
      SQL.Add('SELECT 1,OL.CD_OPERADOR_LOGISTICO,DS_OPERADOR_LOGISTICO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      SQL.Add('WHERE');
      SQL.Add('OL.CD_OPERADOR_LOGISTICO=1');
      SQL.Add('ORDER BY CD_FORNECEDOR');
      ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
      RESULT := 0;
      if ExecSQL(False) > 1 then
        RESULT := ExecSQL(False);
      open;
    end;

    with _cdsTemp do
    begin
      Close;
      CommandText := QryTemp.Text;
      Params.ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
      open;
    end;
    if not _cdsTemp.IsEmpty then
      RESULT := _cdsTemp.RecordCount;

  finally
    FreeAndNil(QryTemp);
  end;
end;

function nrParcelaPedido(nrCondicao: INTEGER): TCondicaoPagamento;
var
  QryTemp: TSQLQuery;
  I: INTEGER;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;

    with QryTemp DO
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT  * ');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_CONDICAO_PAGTO_COMPRA');
      SQL.Add('WHERE nr_condicao_pagto =:PnrCondicao');
      ParamByName('PnrCondicao').AsInteger := nrCondicao;
      open;
    end;
    nrCondicaoPagamento := 0;
    FILLCHAR(RESULT,SIZEOF(RESULT),0);
    if not QryTemp.IsEmpty then
    begin
      for I := 1 to 12 do
      begin
        RESULT.nrDiasPrazo[I] := 0;
        RESULT.nrCondicaoPagamento := 0;
      end;

      IF QryTemp.FieldByName('NR_DIAS_01').AsInteger = 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[1] := QryTemp.FieldByName('NR_DIAS_01').AsInteger;
        RESULT.nrDiasPrazo[1] := 0;
      end;
      IF QryTemp.FieldByName('NR_DIAS_01').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[1] := QryTemp.FieldByName('NR_DIAS_01').AsInteger;
        RESULT.nrDiasPrazo[1] := QryTemp.FieldByName('NR_DIAS_01').AsInteger;;
      end;
      IF QryTemp.FieldByName('NR_DIAS_02').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[2] := QryTemp.FieldByName('NR_DIAS_02').AsInteger;
        RESULT.nrDiasPrazo[2] := QryTemp.FieldByName('NR_DIAS_02').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_03').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[3] := QryTemp.FieldByName('NR_DIAS_03').AsInteger;
        RESULT.nrDiasPrazo[3] := QryTemp.FieldByName('NR_DIAS_03').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_04').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[4] := QryTemp.FieldByName('NR_DIAS_04').AsInteger;
        RESULT.nrDiasPrazo[4] := QryTemp.FieldByName('NR_DIAS_04').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_05').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[5] := QryTemp.FieldByName('NR_DIAS_05').AsInteger;
        RESULT.nrDiasPrazo[5] := QryTemp.FieldByName('NR_DIAS_05').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_06').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[6] := QryTemp.FieldByName('NR_DIAS_06').AsInteger;
        RESULT.nrDiasPrazo[6] := QryTemp.FieldByName('NR_DIAS_06').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_07').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[7] := QryTemp.FieldByName('NR_DIAS_07').AsInteger;
        RESULT.nrDiasPrazo[7] := QryTemp.FieldByName('NR_DIAS_07').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_08').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[8] := QryTemp.FieldByName('NR_DIAS_08').AsInteger;
        RESULT.nrDiasPrazo[8] := QryTemp.FieldByName('NR_DIAS_08').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_09').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[9] := QryTemp.FieldByName('NR_DIAS_09').AsInteger;
        RESULT.nrDiasPrazo[9] := QryTemp.FieldByName('NR_DIAS_09').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_10').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[10] := QryTemp.FieldByName('NR_DIAS_10').AsInteger;
        RESULT.nrDiasPrazo[10] := QryTemp.FieldByName('NR_DIAS_10').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_11').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[11] := QryTemp.FieldByName('NR_DIAS_11').AsInteger;
        RESULT.nrDiasPrazo[11] := QryTemp.FieldByName('NR_DIAS_11').AsInteger;
      end;
      IF QryTemp.FieldByName('NR_DIAS_12').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        nrDiasPrazo[12] := QryTemp.FieldByName('NR_DIAS_12').AsInteger;
        RESULT.nrDiasPrazo[12] := QryTemp.FieldByName('NR_DIAS_12').AsInteger;
      end;
      RESULT.nrCondicaoPagamento := nrCondicaoPagamento;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;
function GetMontaTabelaPrazo(nrCondicao: INTEGER): TClientDataSet;
var
  QryTemp: TSQLQuery;
  I: INTEGER;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;

    with QryTemp DO
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT  * ');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_CONDICAO_PAGTO_COMPRA');
      SQL.Add('WHERE nr_condicao_pagto =:PnrCondicao');
      ParamByName('PnrCondicao').AsInteger := nrCondicao;
      open;
    end;
    _dm._cdsPrazo.close;
    _dm._cdsPrazo.CreateDataSet;
    nrCondicaoPagamento := 0;
    if not QryTemp.IsEmpty then
    begin

      IF QryTemp.FieldByName('NR_DIAS_01').AsInteger = 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_01').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_01').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_01').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_02').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_02').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_03').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_03').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_04').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_04').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_05').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_05').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_06').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_06').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_07').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_07').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_08').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_08').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_09').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_09').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_10').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_10').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_11').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_11').AsInteger,nrCondicao);
      end;
      IF QryTemp.FieldByName('NR_DIAS_12').AsInteger > 0 then
      begin
        inc(nrCondicaoPagamento);
        GravaTabelaPrazo(nrCondicaoPagamento,QryTemp.FieldByName('NR_DIAS_12').AsInteger,nrCondicao);
      end;
      RESULT:=_dm._cdsPrazo;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;


function GetCodigoDun14(PnrProduto,PnrCd: INTEGER): String;
var
  QryTemp: TSQLQuery;
  I: INTEGER;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;

    with QryTemp DO
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT  NR_CODBAR_MERCADORIA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_CODBAR_MERCADORIA');
      SQL.Add('WHERE');
      SQL.Add('id_codbar_mercadoria = ''C''');
      SQL.Add('AND NR_MERCADORIA=:PnrProduto');
      SQL.Add('AND CD_EMPRESA=:PnrEmpresa');
      ParamByName('PnrProduto').AsInteger := PnrProduto;
      ParamByName('PnrEmpresa').AsInteger := PnrCd;
      open;
    end;
    RESULT := '';
    if not QryTemp.IsEmpty then
      RESULT := QryTemp.FieldByName('NR_CODBAR_MERCADORIA').AsString;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function SetDataAgenda(cdGrupoFornecedor: INTEGER;
  dtAgenda, dtProximoPedido: Tdate): Boolean;
var
  QryTemp: TSQLQuery;
  I: INTEGER;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;

    with QryTemp DO
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE PRDDM.DC_GRUPO_FORNECEDOR SET DT_AGENDAMENTO=:PdtAgenda,');
      SQL.Add('DT_PROXIMO_PEDIDO=:PdtProximo,DT_ATUALIZACAO=sysdate');
      sql.Add('WHERE CD_GRUPO_FORNECEDOR=:PnrGrupoFornecedor');
      //sql.Add('and trunc(DT_AGENDAMENTO)<:PdtAgenda');
      ParamByName('PdtAgenda').AsDateTime := dtAgenda;
      ParamByName('PdtProximo').AsDateTime := dtProximoPedido;
      ParamByName('PnrGrupoFornecedor').AsInteger := cdGrupoFornecedor;
      RESULT := True;
      if ExecSQL(False) > 1 then
        RESULT := False;

    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function CompradorPedido(PnrComprador ,PnrMatricula: INTEGER): TDadosComprador;
var
  QryTemp: TSQLQuery;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;

    if (PnrComprador>0) or (PnrMatricula>0)then
    begin
      with QryTemp DO
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CD_EMPRESA, NR_COMPRADOR, NM_COMPRADOR,');
        SQL.Add('NM_COMPRADOR_REDUZIDO, DS_EMAIL_COMPRADOR,');
        SQL.Add('ID_ATIVO FROM PRDDM.DC_COMPRADOR_GAM');
        SQL.Add('WHERE');
        if PnrComprador>0 then
           SQL.Add('NR_COMPRADOR=:PnrComprador');
        if PnrMatricula>0 then
           SQL.Add('NR_MATRICULA=:PnrMatricula');
        if PnrComprador>0 then
           ParamByName('PnrComprador').AsInteger := PnrComprador;
        if PnrMatricula>0 then
           ParamByName('PnrMatricula').AsInteger := PnrMatricula;
         SQL.Add('order by NR_COMPRADOR');
        open;
        FIRST;
      end;
    end;
    RESULT.nrComprador := 0;
    RESULT.cdEmpresa := 0;
    RESULT.nmComprador := '';
    RESULT.nmReduzido := '';
    RESULT.idAtivo := 'I';
    if not QryTemp.IsEmpty then
    begin
      RESULT.nrComprador      := QryTemp.FieldByName('NR_COMPRADOR').AsInteger;
      RESULT.cdEmpresa        := QryTemp.FieldByName('CD_EMPRESA').AsInteger;
      RESULT.nmComprador      := QryTemp.FieldByName('NM_COMPRADOR').AsString;
      Result.dsEmailCcomprador:= QryTemp.FieldByName('DS_EMAIL_COMPRADOR').AsString;
      RESULT.nmReduzido       := QryTemp.FieldByName('NM_COMPRADOR_REDUZIDO').AsString;
      RESULT.idAtivo          := QryTemp.FieldByName('ID_ATIVO').AsString[1];

      if RESULT.idAtivo = 'N' then
      begin
        mensagem('Comprador Inativo',48);
        RESULT.nrComprador := 0;
      end;

    end;

  finally
    FreeAndNil(QryTemp);
  end;

end;

function AbreIndicePreco(nrLaboratorio: INTEGER): Double;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NROL_L,INDL_L ,UFIV_L');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCILA');
      SQL.Add('WHERE tipl_l=''C''');
      SQL.Add('AND  TIIL_L=''A''');
      SQL.Add('AND NROL_L=:PnrLAB');
      ParamByName('PnrLAB').AsInteger := nrLaboratorio;
      open;
    end;
    RESULT := 1;
    if not QryTemp.IsEmpty then
      RESULT := QryTemp.FieldByName('INDL_L').AsFloat;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function AbreItemPedidoMultiEmpresa(nrPedido, nrMercadoria, cdEmpresa: INTEGER;
  idSituacao: String): Boolean;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    with QryTemp do
    begin
      SQL.Add('SELECT');
      SQL.Add('NROP_Y , CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
      SQL.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,NR_DIAS_ESTOQUE,');
      SQL.Add('QUAY_Y , CHEY_Y , ABTY_Y ,PFBY_Y,PUNY_Y ,DADY_Y,');
      SQL.Add('VCCI_Y , SITY_Y , PRZY_Y ,DFIY_Y,VL_MARGEM_PADRAO,');
      SQL.Add('VL_MARGEM_NEGOCIADA,ID_MARGEM ,ID_DESCONTO_ACUMULATIVO,');
      SQL.Add('NRVV_Y, PC_VERBA ,VL_VERBA , QT_BONIFICADA ,PC_BONIFICACAO,');
      SQL.Add('PC_DESCONTO_OL ,NR_OPERADOR_LOGISTICO,DS_NIVEL_ECNM,CD_MERCADORIA,');
      SQL.Add('QT_SUGERIDA , VL_MEDIA_VENDA,NROM_Y,PC_CREDITO_ICMS');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCPCC CAPA,');
      SQL.Add('PRDDM.DCPCI ITEM,');
      SQL.Add('PRDDM.DC_MERCADORIA PRODUTO');
      SQL.Add('WHERE');
      SQL.Add('NROP_P=NROP_Y');
      SQL.Add('AND NROM_Y=CD_MERCADORIA');
      SQL.Add('AND NROP_Y = :PnrPedido');
      if nrMercadoria > 0 then
        SQL.Add('AND NROM_Y = :PnrMercadoria');
      SQL.Add('order by DFIY_Y');
      Params.ParamByName('PnrPedido').AsInteger := nrPedido;
      if nrMercadoria > 0 then
        Params.ParamByName('PnrMercadoria').AsInteger := nrMercadoria;
      open;
    end;
    RESULT := False;
    if not QryTemp.IsEmpty then
    begin
      RESULT := True;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

{ TDadosCD }

procedure TDadosCD.SetdsRazaoSocial(const Value: String);
begin
  FdsRazaoSocial := Value;
end;

procedure TDadosCD.SetnmCD(const Value: String);
begin
  FnmCD := Value;
end;

procedure TDadosCD.SetnrCD(const Value: Integer);
begin
  FnrCD := Value;
end;

procedure TDadosCD.SetnrCNPJ(const Value: String);
begin
  FnrCNPJ := Value;
end;

procedure TDadosCD.SetnrEANCD(const Value: String);
begin
  FnrEANCD := Value;
end;

procedure TDadosCD.SetnrInscricaoEstadual(const Value: String);
begin
  FnrInscricaoEstadual := Value;
end;

procedure TDadosCD.SetnrInscricaoMunicipal(const Value: String);
begin
  FnrInscricaoMunicipal := Value;
end;

procedure TDadosCD.SetnrLogradouro(const Value:String);
begin
  FnrLogradouro := Value;
end;

procedure TDadosCD.SetstBAIRRO(const Value: String);
begin
  FstBAIRRO := Value;
end;

procedure TDadosCD.SetstCEP(const Value: String);
begin
  FstCEP := Value;
end;

procedure TDadosCD.SetstCIDADE(const Value: String);
begin
  FstCIDADE := Value;
end;

procedure TDadosCD.SetstENDERECO(const Value: String);
begin
  FstENDERECO := Value;
end;

procedure TDadosCD.SetstEstado(const Value: String);
begin
  FstEstado := Value;
end;

function GetDadosCD(nrCd:Integer):TDadosCD;
var
  QryTemp: TSQLQuery;
  DadosCd :TDadosCD;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    DadosCd:=TDadosCD.Create;
    try
      with QryTemp do
      begin
       SQL.Add('SELECT CD_EMPRESA, NM_EMPRESA, NR_CNPJ_EMPRESA,');
       SQL.Add('EMPRESA.NR_EAN_CLIENTE,NOMP_P,INEP_P,INMP_P ,');
       SQL.Add('ENDP_P,BAIP_P,CEPP_P,EXCP_P ,');
       SQL.Add('MUNP_P , UFEP_P,NR_LOGRADOURO, DS_COMPLEMENTO,NR_CEP,');
       SQL.Add('DS_LOGRADOURO, ENDERECO.NM_BAIRRO , ID_ESTADO,NM_CIDADE, NR_CEP,');
       SQL.Add('NR_LOGRADOURO, DS_COMPLEMENTO,NR_CEP	, ENDERECO.NM_BAIRRO');
       SQL.Add('FROM');
       SQL.Add('ACESSO.DC_EMPRESA EMPRESA,');
       SQL.Add('PRDDM.DCPES PESSOA,');
       SQL.Add('PRDDM.DCCLI CLIENTE,');
       SQL.Add('PRDDM.DC_ENDERECO_CLIENTE ENDERECO');
       SQL.Add('WHERE');
       SQL.Add('NR_CNPJ_EMPRESA=CGCP_P');
       SQL.Add('AND CGCP_P=CGCP_C');
       SQL.Add('AND NR_CEP<> 88704410');
       SQL.Add('AND NROC_C=CD_CLIENTE');
       SQL.Add('and EMPRESA.CD_EMPRESA=:PnrCd');
       ParamByName('PnrCd').AsInteger:=nrCd;
       open;
       if not QryTemp.Eof then
       begin
          DadosCd.nrCD         :=QryTemp.FieldByName('CD_EMPRESA').AsInteger;
          DadosCd.nmCD         :=QryTemp.FieldByName('NM_EMPRESA').AsString;
          DadosCd.dsRazaoSocial:=QryTemp.FieldByName('NOMP_P').AsString;
          DadosCd.nrCNPJ       :=FormatFloat('00000000000000', QryTemp.FieldByName('NR_CNPJ_EMPRESA').AsFloat);;
          DadosCd.nrEANCD      :=QryTemp.FieldByName('NR_EAN_CLIENTE').AsString;
          DadosCd.stEstado     :=QryTemp.FieldByName('ID_ESTADO').AsString;
          DadosCd.stCIDADE     :=trim(QryTemp.FieldByName('NM_CIDADE').AsString);
          DadosCd.stBAIRRO     :=trim(QryTemp.FieldByName('NM_BAIRRO').AsString);
          DadosCd.stENDERECO   :=trim(QryTemp.FieldByName('DS_LOGRADOURO').AsString);
          DadosCd.stCEP        :=trim(QryTemp.FieldByName('NR_CEP').AsString);
          DadosCd.nrLogradouro :=QryTemp.FieldByName('NR_LOGRADOURO').AssTRING;
          DadosCd.nrInscricaoEstadual:=QryTemp.FieldByName('INEP_P').AsString;
          DadosCd.nrInscricaoMunicipal:=trim(QryTemp.FieldByName('inmp_p').AsString);
       end;
       Result:=DadosCd;
      end;

    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao testa conex?o com a base...');
      end;


    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;

{function setBonificaPedido(nrPedido,nrVerba:Integer):boolean;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    try
      with QryTemp do
      begin
       SQL.Add('UPDATE PRDDM.DCPCI SET VL_VERBA=VCCI_Y * QUAY_Y,');
       SQL.Add('NRVV_Y=:PnrVerba,PC_VERBA=100');
       SQL.Add('WHERE NROP_Y=:PnrPedido');
       SQL.Add('AND VCCI_Y>0');
       ParamByName('PnrVerba').AsInteger:=nrVerba;
       ParamByName('PnrPedido').AsInteger:=nrPedido;
       result:=true;
       if ExecSQL(false)<0 then
          result:=false
      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Bonificar Pedido...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;}

{ TDadosValoresPedido }

procedure TDadosValoresPedido.SetcdEmpresa(const Value: Integer);
begin
  FcdEmpresa := Value;
end;

procedure TDadosValoresPedido.SetcdEmpresaDestino(const Value: Integer);
begin
  FcdEmpresaDestino := Value;
end;

procedure TDadosValoresPedido.SetdBloqueiodeDigitacao(const Value: Integer);
begin
  FdBloqueiodeDigitacao := Value;
end;

procedure TDadosValoresPedido.SetdtAgendada(const Value: Tdate);
begin
  FdtAgendada := Value;
end;

procedure TDadosValoresPedido.SetdtPedido(const Value: Tdate);
begin
  FdtPedido := Value;
end;

procedure TDadosValoresPedido.SetdtPrevistaChegada(const Value: Tdate);
begin
  FdtPrevistaChegada := Value;
end;

procedure TDadosValoresPedido.SetidOperacaoRede(const Value: Boolean);
begin
  FidOperacaoRede := Value;
end;

procedure TDadosValoresPedido.SetidPedidoBonificado(const Value: Boolean);
begin
  FidPedidoBonificado := Value;
end;

procedure TDadosValoresPedido.SetidPedidoCrossDocking(const Value: String);
begin
  FidPedidoCrossDocking := Value;
end;

procedure TDadosValoresPedido.SetidPedidoOperacaoRede(const Value: Boolean);
begin
  FidPedidoOperacaoRede := Value;
end;

procedure TDadosValoresPedido.SetidStatusPedido(const Value: String);
begin
  FidStatusPedido := Value;
end;

procedure TDadosValoresPedido.SetnrCompradorPedido(const Value: Integer);
begin
  FnrCompradorPedido := Value;
end;

procedure TDadosValoresPedido.SetnrCondicaoPagamento(const Value: Integer);
begin
  FnrCondicaoPagamento := Value;
end;

procedure TDadosValoresPedido.SetnrDiasPrazo(const Value: Integer);
begin
  FnrDiasPrazo := Value;
end;

procedure TDadosValoresPedido.SetnrFornecedor(const Value: Integer);
begin
  FnrFornecedor := Value;
end;

procedure TDadosValoresPedido.SetnrGeracaoVerba(const Value: Integer);
begin
  FnrGeracaoVerba := Value;
end;

procedure TDadosValoresPedido.SetnrItensPedido(const Value: Integer);
begin
  FnrItensPedido := Value;
end;

procedure TDadosValoresPedido.SetnrListaPrecoExcecao(const Value: Integer);
begin
  FnrListaPrecoExcecao := Value;
end;

procedure TDadosValoresPedido.SetnrOperadorLogistico(const Value: Integer);
begin
  FnrOperadorLogistico := Value;
end;

procedure TDadosValoresPedido.SetnrPedido(const Value: Integer);
begin
  FnrPedido := Value;
end;

procedure TDadosValoresPedido.SetnrPedidoVinculado(const Value: Integer);
begin
  FnrPedidoVinculado := Value;
end;

procedure TDadosValoresPedido.SetnrTotalUnidadesPedido(const Value: Integer);
begin
  FnrTotalUnidadesPedido := Value;
end;

procedure TDadosValoresPedido.SetnrVerba(const Value: Integer);
begin
  FnrVerba := Value;
end;

procedure TDadosValoresPedido.SetpcDescontoPadrao(const Value: Double);
begin
  FpcDescontoPadrao := Value;
end;

procedure TDadosValoresPedido.SetpcGeracaoVerba(const Value: Double);
begin
  FpcGeracaoVerba := Value;
end;

procedure TDadosValoresPedido.SetpcParaVerba(const Value: Double);
begin
  FpcParaVerba := Value;
end;

procedure TDadosValoresPedido.SetstCNPJ(const Value: String);
begin
  FstCNPJ := Value;
end;

procedure TDadosValoresPedido.SetstModoPedido(const Value: String);
begin
  FstModoPedido := Value;
end;

procedure TDadosValoresPedido.SetstNomeFornecedor(const Value: String);
begin
  FstNomeFornecedor := Value;
end;

procedure TDadosValoresPedido.SetstObservacaoPedido(const Value: String);
begin
  FstObservacaoPedido := Value;
end;

procedure TDadosValoresPedido.SetvtPrecoCustoPedido(const Value: Double);
begin
  FvtPrecoCustoPedido := Value;
end;

procedure TDadosValoresPedido.SetvtPrecoFornecedorPedido(const Value: Double);
begin
  FvtPrecoFornecedorPedido := Value;
end;


procedure TDadosValoresPedido.SetvtPrecoLiquido(const Value: Double);
begin
  FvtPrecoLiquido := Value;
end;

function GetValoresPedido(PnrPedido:Integer;PidAtivarPedido:Boolean):TDadosValoresPedido;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    DadosValoresPedido:=TDadosValoresPedido.Create;
    try
      with QryTemp do
      begin
       SQL.Add('SELECT COUNT(*) NR_ITENS,');
       SQL.Add('NROP_P,DATP_P,DT_PREVISTA_FATURAMENTO,LABP_P,');
       SQL.Add('SUM(TOTAL_UNIDADES) AS TOTAL_UNIDADES,');
       SQL.Add('SUM(VL_PCO_FABRICA) AS VL_PCO_FABRICA,');
       SQL.Add('SUM(VL_PCO_CUSTO) AS VL_PCO_CUSTO,');
       SQL.Add('SUM(VL_PCO_LIQUIDO) AS VL_PCO_LIQUIDO,');
       SQL.Add('SUM(NVL(NR_ITENS_BONIFICADO,0)) AS NR_ITENS_BONIFICADO,');
       SQL.Add('CD_EMPRESA_DESTINO,CD_EMPRESA,NR_CONDICAO_PAGTO_P,OBSP_P,PRZP_P,SNRP_P,');
       SQL.Add('CD_PEDIDO_RELACIONADO,SITP_P,CD_OPERADOR_LOGISTICO,');
       SQL.aDD('CD_COMPRADOR,NR_CNPJ,FLAP_P,cd_operacao_rede,ds_grupo_fornecedor,ID_CROSSDOCKING,');
       SQL.aDD('Max(PC_VERBA_GERACAO) AS PC_VERBA_GERACAO, Max(NR_VERBA_GERACAO) AS NR_VERBA_GERACAO,');
       SQL.aDD('MAX(NR_LISTA_PRECO) as NR_LISTA_PRECO');

       SQL.Add('FROM');
       SQL.Add('(SELECT');
       SQL.Add('NROP_P,DATP_P,DT_PREVISTA_FATURAMENTO,LABP_P,COUNT(*) NR_ITENS,');
       SQL.Add('SUM(QUAY_Y) AS TOTAL_UNIDADES,SNRP_P,');
       SQL.Add('SUM(QUAY_Y* PFBY_Y) AS VL_PCO_FABRICA,');
       SQL.Add('SUM(QUAY_Y* VCCI_Y) AS VL_PCO_CUSTO,');
       SQL.Add('SUM(QUAY_Y* PUNY_Y) AS VL_PCO_LIQUIDO,');
       SQL.add('CASE');
       SQL.add('WHEN QT_BONIFICADA>0 THEN COUNT(*)');
       SQL.add('END NR_ITENS_BONIFICADO,capa.cd_operacao_rede,');
       SQL.Add('CAPA.CD_EMPRESA_DESTINO,NR_CONDICAO_PAGTO_P,OBSP_P,PRZP_P,FLAP_P,CAPA.ID_CROSSDOCKING,');
       SQL.Add('CD_PEDIDO_RELACIONADO,SITP_P,CD_OPERADOR_LOGISTICO,CAPA.CD_COMPRADOR,NR_CNPJ,ds_grupo_fornecedor,CAPA.CD_EMPRESA,');
       SQL.aDD('Max(CAPA.PC_VERBA_GERACAO) AS PC_VERBA_GERACAO, Max(CAPA.NR_VERBA_GERACAO) AS NR_VERBA_GERACAO,max(NR_LISTA_PRECO) as NR_LISTA_PRECO');
       SQL.Add('FROM');
       SQL.Add('PRDDM.DC_FABRICANTE FABRICANTE,');
       SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
       SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
       SQL.Add('PRDDM.DCPCC CAPA,');
       SQL.Add('PRDDM.DCPCI ITEM,');
       SQL.Add('ACESSO.DC_EMPRESA EMP');
       SQL.Add('WHERE');
       SQL.Add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
       SQL.ADD('AND FABRICANTE.CD_FABRICANTE=GRUPO_FORNECEDOR.CD_FABRICANTE');
       SQL.ADD('AND capa.CD_EMPRESA_DESTINO=emp.cd_empresa');
       SQL.ADD('AND id_empresa_fisica=''S''');

       SQL.Add('AND  cd_mercadoria=NROM_Y');
       SQL.Add('AND  NROP_P = NROP_Y');
       if not PidAtivarPedido then
         SQL.Add('AND SITY_Y NOT IN(''C'',''I'')');
       SQL.Add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=LABP_P');
       SQL.Add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.CD_EMPRESA_DESTINO');
       SQL.Add('AND nrop_p=:PnrPedido');
       SQL.Add('GROUP BY NROP_P,DATP_P,DT_PREVISTA_FATURAMENTO,LABP_P,CAPA.CD_EMPRESA_DESTINO,VCCI_Y,capa.cd_operacao_rede,');
       SQL.Add('NR_CONDICAO_PAGTO_P,OBSP_P,CD_PEDIDO_RELACIONADO,SITP_P,SNRP_P,CAPA.ID_CROSSDOCKING,CAPA.CD_EMPRESA,');
       SQL.Add('CD_OPERADOR_LOGISTICO,CAPA.CD_COMPRADOR,PRZP_P,NR_CNPJ,FLAP_P,DS_GRUPO_FORNECEDOR,QT_BONIFICADA)');
       SQL.Add('GROUP BY NROP_P,DATP_P,DT_PREVISTA_FATURAMENTO,LABP_P,CD_EMPRESA_DESTINO,NR_CONDICAO_PAGTO_P');
       SQL.Add(',OBSP_P,PRZP_P,CD_PEDIDO_RELACIONADO,SITP_P,SNRP_P,cd_operacao_rede,ID_CROSSDOCKING,CD_EMPRESA,');
         SQL.Add('CD_OPERADOR_LOGISTICO,CD_COMPRADOR,NR_CNPJ,FLAP_P,DS_GRUPO_FORNECEDOR');
       ParamByName('PnrPedido').AsInteger:=PnrPedido;
//       DadosValoresPedido:=nil;
       sql.SaveToFile('C:\temp\Compras_qryPedidoRedes.sql');
       open;
       if not QryTemp.IsEmpty then
       begin
        DadosValoresPedido.nrPedido               :=QryTemp.FieldByName('NROP_P').AsInteger;
        DadosValoresPedido.cdEmpresa              :=QryTemp.FieldByName('CD_EMPRESA').AsInteger;
        DadosValoresPedido.cdEmpresaDestino       :=QryTemp.FieldByName('CD_EMPRESA_DESTINO').AsInteger;
        DadosValoresPedido.dtPedido               :=QryTemp.FieldByName('DT_PREVISTA_FATURAMENTO').AsDateTime;
        DadosValoresPedido.nrItensPedido          :=QryTemp.FieldByName('NR_ITENS').AsInteger;
        DadosValoresPedido.nrFornecedor           :=QryTemp.FieldByName('LABP_P').AsInteger;
        DadosValoresPedido.nrTotalUnidadesPedido  :=QryTemp.FieldByName('TOTAL_UNIDADES').AsInteger;
        DadosValoresPedido.vtPrecoFornecedorPedido:=QryTemp.FieldByName('VL_PCO_FABRICA').AsFloat;
        DadosValoresPedido.vtPrecoCustoPedido     :=QryTemp.FieldByName('VL_PCO_CUSTO').AsFloat;
        DadosValoresPedido.vtPrecoLiquido         :=QryTemp.FieldByName('VL_PCO_LIQUIDO').AsFloat;
        DadosValoresPedido.nrCondicaoPagamento    :=QryTemp.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger;
        DadosValoresPedido.stObservacaoPedido     :=QryTemp.FieldByName('OBSP_P').AsString;
        DadosValoresPedido.nrPedidoVinculado      :=QryTemp.FieldByName('CD_PEDIDO_RELACIONADO').AsInteger;
        DadosValoresPedido.idStatusPedido         :=QryTemp.FieldByName('SITP_P').AsString;
        DadosValoresPedido.stCNPJ                 :=QryTemp.FieldByName('NR_CNPJ').AsString;
        DadosValoresPedido.stModoPedido           :=QryTemp.FieldByName('SNRP_P').AsString;
        DadosValoresPedido.nrOperadorLogistico    :=QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').asInteger;
        DadosValoresPedido.nrCompradorPedido      :=QryTemp.FieldByName('CD_COMPRADOR').asInteger;
        DadosValoresPedido.nrDiasPrazo            :=QryTemp.FieldByName('PRZP_P').asInteger;
        DadosValoresPedido.idBloqueiodeDigitacao  :=QryTemp.FieldByName('FLAP_P').asInteger;
        DadosValoresPedido.stNomeFornecedor       :=QryTemp.FieldByName('DS_GRUPO_FORNECEDOR').AsString;
        DadosValoresPedido.idPedidoCrossDocking   :=QryTemp.FieldByName('ID_CROSSDOCKING').AsString;
        DadosValoresPedido.pcGeracaoVerba         :=QryTemp.FieldByName('PC_VERBA_GERACAO').AsFloat;
        DadosValoresPedido.nrGeracaoVerba         :=QryTemp.FieldByName('NR_VERBA_GERACAO').AsInteger;
        DadosValoresPedido.nrListaPrecoExcecao    :=QryTemp.FieldByName('NR_LISTA_PRECO').AsInteger;





        DadosValoresPedido.idPedidoOperacaoRede:=false;
        DadosValoresPedido.idPedidoBonificado:=false;
        if QryTemp.FieldByName('NR_ITENS_BONIFICADO').asInteger>0 then
           DadosValoresPedido.idPedidoBonificado:=true;
       DadosValoresPedido.idOperacaoRede:=DadosValoresPedido.idPedidoOperacaoRede;
       end;
       result:=DadosValoresPedido;

      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Bonificar Pedido...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function AtualizaDataTransmissao(PnrPedido,PnrLaboratorio,PnrCD:Integer):Boolean;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    try
      with QryTemp do
      begin
       sql.Add('UPDATE PRDDM.DCPCC SET DT_TRANSMITIDO=trunc(sysdate)');
       sql.Add('WHERE NROP_P=:PnrPedido AND LABP_P=:nrLaboratorio');
       ParamByName('PnrPedido').AsBcd:=PnrPedido;
       ParamByName('nrLaboratorio').AsBcd:=PnrLaboratorio;
       result:=true;
       if ExecSQL(false)=0 then
          result:=false;
          AtualizaDataTransmissaoEventePedido(PnrPedido,PnrLaboratorio,PnrCD);

      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Atualizar data Transmissao de Pedido...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function AtualizaDataTransmissaoEventePedido(PnrPedido,PnrLaboratorio,PnrCD:Integer):Boolean;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    try
      with QryTemp do
      begin
       sql.Add('UPDATE GAMNFE.DC_EVT_PEDIDO_COMPRA SET DT_TRANSMISSAO_PEDIDO=sysdate');
       sql.Add('WHERE CD_PEDIDO=:PnrPedido AND CD_LABORATORIO=:nrLaboratorio');
       sql.Add('AND CD_EMPRESA=:PnrCD');
       ParamByName('PnrPedido').AsBcd:=PnrPedido;
       ParamByName('nrLaboratorio').AsBcd:=PnrLaboratorio;
       ParamByName('PnrCD').AsBcd:=PnrCD;
       result:=true;
       if ExecSQL(false)=0 then
          result:=false;
      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Atualizar data Transmissao de Evento Pedido...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function VerificaPedido(idStatus:String;nrFornecedor:Integer):TClientDataSet;
var
   QryTemp: TSQLQuery;
  _cdsTemp :TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp:=TClientDataSet.Create(nil);
    try
      with QryTemp do
      begin
        SQL.Add('SELECT');
        SQL.Add('NROP_P,SITP_P,DATP_P,NM_USUARIO,');
        SQL.Add('COUNT(nrom_Y) NR_ITENS,');
        SQL.Add('Nvl(SUM(QUAY_Y),0) AS TOTAL_UNIDADES,');
        SQL.Add('Nvl(SUM(QUAY_Y* PFBY_Y),0) AS VL_PCO_FABRICA,');
        SQL.Add('Nvl(SUM(QUAY_Y* VCCI_Y),0) AS VL_PCO_CUSTO,CAPA.CD_EMPRESA');
        SQL.Add('FROM');
        SQL.Add('PRDDM.DCPCC CAPA,');
        SQL.Add('PRDDM.DCPCI ITEM, ');
        SQL.Add('ACESSO.DC_EMPRESA EMP');

        SQL.Add('WHERE');
        SQL.Add('ITEM.NROP_Y=CAPA.NROP_P');
        SQL.ADD('AND capa.CD_EMPRESA_DESTINO=emp.cd_empresa');
        SQL.ADD('AND id_empresa_fisica=''S''');
        SQL.Add('and SITP_P=:PidStatus');
        SQL.Add('AND labp_p=:PnrFornecedor');
        SQL.Add('GROUP BY nrop_p,sitp_p,DATP_P,NM_USUARIO,CAPA.CD_EMPRESA');
//        ParamByName('PidStatus').AsString:=idStatus;
  //      ParamByName('PnrFornecedor').AsInteger:=nrFornecedor;
 //       open;
      end;
      with _cdsTemp do
      begin
         ProviderName:='_dspGenerica';
         RemoteServer:=_dm._LocalConexao;
         close;
         CommandText:=QryTemp.Text;
         Params.ParamByName('PidStatus').AsString:=idStatus;
         Params.ParamByName('PnrFornecedor').AsInteger:=nrFornecedor;
         open;
      end;
      Result:=nil;
      if not _cdsTemp.IsEmpty then
         Result:=_cdsTemp;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Abrir Pedidos...');
      end;
    end;
   finally
    begin
    FreeAndNil(QryTemp);
//    FreeAndNil(_cdsTemp);
    end;
  end;

end;

Function AlteraStatusPedido(PnrPedido,PnrProduto:Integer;PidAtualizaItem:Boolean):boolean;
var
  tempQuery : TSQLQuery;
  DadosPedido :TDadosPedido;
  DadosValoresPedido, DadosPedioTemp:TDadosValoresPedido;
  stMensagem :String;

begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    DadosValoresPedido:=GetValoresPedido(PnrPedido,false);
   if DadosValoresPedido<>nil then
   begin

    if PnrPedido>0 then
    begin

        with tempQuery do
        begin
          close;
          SQL.Add('UPDATE prddm.dcpcc SET sitp_p=');
          SQL.Add('CASE');
          SQL.Add('WHEN (sitp_p=''N'') AND');
          SQL.Add('((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 and quay_y>0 and (sity_y=''F'') AND nrop_y=:PnrPedido)=0)  THEN ''C''');
          SQL.Add('WHEN (sitp_p=''N'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  sity_y=''F'' AND nrop_y=:PnrPedido)>0) and ');
          SQL.Add(' ( (SELECT Sum(chey_y) AS nrItem FROM prddm.dcpci WHERE  sity_y<>''N'' AND nrop_y=:PnrPedido)>0) THEN ''F''');
          SQL.Add('WHEN (sitp_p=''P'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 AND nrop_y=:PnrPedido)>0) THEN ''F''');
          SQL.Add('WHEN (sitp_p=''S'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 AND nrop_y=:PnrPedido)>0) THEN ''F''');
          SQL.Add('WHEN (sitp_p=''I'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 AND nrop_y=:PnrPedido)>0) THEN ''F''');
          SQL.Add('WHEN (sitp_p=''C'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 AND nrop_y=:PnrPedido)>0) THEN ''F''');
          SQL.Add('WHEN (sitp_p=''F'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 AND nrop_y=:PnrPedido)>0) THEN ''F''');
          SQL.Add('WHEN (sitp_p=''S'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y>0 AND ID_NFE_TRANSITO=''N'' AND nrop_y=:PnrPedido)=0) THEN ''C''');
          SQL.Add('WHEN (sitp_p=''N'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE sity_y=''N'' and chey_y=0 and nrop_y=:PnrPedido)>0) and ');
          SQL.Add(' (SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  ((sity_y=''F'') OR (sity_y=''P'')) AND nrop_y=:PnrPedido)>0 THEN ''P''');
          SQL.Add('WHEN (sitp_p=''N'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y=0  AND nrop_y=:PnrPedido)>0) THEN ''C''');
          SQL.Add('WHEN (sitp_p=''P'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y=0  AND nrop_y=:PnrPedido)>0) THEN ''C''');
          SQL.Add('WHEN (sitp_p=''S'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y=0  AND nrop_y=:PnrPedido)>0) THEN ''I''');
          SQL.Add('WHEN (sitp_p=''I'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y=0  AND nrop_y=:PnrPedido)>0) THEN ''I''');
          SQL.Add('WHEN (sitp_p=''C'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y=0  AND nrop_y=:PnrPedido)>0) THEN ''C''');
          SQL.Add('WHEN (sitp_p=''S'') AND ((SELECT Count(*)AS nrItem FROM prddm.dcpci WHERE  chey_y=0  AND nrop_y=:PnrPedido)>0) THEN ''I''');

          SQL.Add('END ');
          SQL.Add('WHERE nrop_p=:PnrPedido');
          ParamByName('PnrPedido').Asbcd:=PnrPedido;
          result:=true;


          tempQuery.SQL.SaveToFile('C:\temp\qryEliminaPendencia.sql');
          if ExecSQL(false)<=0 then
          begin
//            Mensagem('Pendencia N?o Eliminada do Sistema',48);
             result:=false;
          end;
          if PidAtualizaItem then
              AlteraStatusItemPedido(PnrPedido,PnrProduto,DadosValoresPedido.FcdEmpresa,nmLogin);


        end;
         DadosPedioTemp:=GetValoresPedido(PnrPedido,true);

         stMensagem:= 'Usuario Alterou Status para '+ DadosPedioTemp.idStatusPedido + ' - '+nmLogin;
         if DadosPedioTemp.idStatusPedido='F' then
            stMensagem:='Usuario Alterou Status Pedido para Faturado '+nmlogin;
         if DadosPedioTemp.idStatusPedido='C' then
            stMensagem:='Usuario Alterou Status Pedido para Cancelado '+nmlogin;
         if DadosPedioTemp.idStatusPedido='I' then
            stMensagem:='Usuario Alterou Status Pedido para Inativado '+nmlogin;


        if (Result) and (NOT PidAtualizaItem) then
        begin
         if  InsereEventoPedidoCompra(PnrPedido,
                                 DadosValoresPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DadosValoresPedido.nrCompradorPedido,
                                 0,
                                 DadosValoresPedido.nrFornecedor,
                                 DadosValoresPedido.vtPrecoFornecedorPedido,
                                 DadosValoresPedido.nrItensPedido,
                                 DadosValoresPedido.nrTotalUnidadesPedido,
                                 DadosPedioTemp.idStatusPedido[1],
                                 dtSistema,
                                 nmLogin,
                                 DadosValoresPedido.cdEmpresa) then
          GravaEventoLogPedidoCompra(0,
                                     DadosValoresPedido.nrPedido,
                                     DadosValoresPedido.dtPedido,
                                     0,
                                     0,
                                     19,
                                     stMensagem,
                                     dtSistema,
                                     nmLogin,
                                     DadosValoresPedido.cdEmpresa);
        end;
    end;
    end
    else
      Mensagem('Pendencia N?o Eliminada do Sistema',48);
  finally
    FreeAndNil(tempQuery);
    //FreeAndNil(DadosPedido);
  end;
end;



function TopoPaginaPedido(nrPagina, nrLinha,nrPedido:Integer;DtPedido:TDate;msg,stLogradouro,stBairro,stCidade,stUF,stCep,dsFornecedor,stPrazo:String):Integer;
begin
  Printer.Canvas.Font.Style:=[fsBold];
  Printer.Canvas.Font.name:='Courier New';
  printer.canvas.font.Size := 12;
  Printer.Canvas.TextOut(0050, nrLinha, 'GAM - Gen?sio A. Mendes & Cia Ltda.'+'('+stUF+')');
  printer.canvas.font.Size := 09;
  Printer.Canvas.Font.Style:=[];
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 15;
  Printer.Canvas.TextOut(0050, nrLinha, 'Pedido de Compra Nr.: '+FormatFloat('000000',nrPedido));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, 'Fornecedor..........: '+dsFornecedor);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, 'Data do Pedido......: '+FormatDateTime('dd/mm/yyyy',DtPedido)+ ' Prazo Pagamento.: '+stPrazo);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, 'Endere?o Entrega....: '+stLogradouro+'  Bairro..: '+stBairro +'  Cidade..: ' +stCidade+'  CEP.....:'+stCep);
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, 'Observa??o..........: '+'Informar Nr. do Nosso Pedido '+inttostr(nrPedido)+' na Nota Fiscal/Danfe em Dados Adicionais');
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(1056, nrLinha,'E no XML informar no campo correspondente (Tag compra x Ped)');
  result:=nrLinha;
end;

(* ************************ *)

(* ************************ *)
function CabecalhoPag(nrLinha,nrPagina: Integer;stObservacao:String):Integer;
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  if trim(stObservacao)<>'' then
     Printer.Canvas.TextOut(0050, nrLinha, 'Importante..........: '+stObservacao);
  Printer.Canvas.TextOut(4650, nrLinha, 'Data  :  ' + FormatDateTime('dd/mm/yyyy', dtSistema));
  Printer.Canvas.TextOut(5650, nrLinha, 'Pagina: ' + FormatFloat('##0',nrPagina));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, 'C?digo GAM');
  Printer.Canvas.TextOut(0700, nrLinha, 'C?digo Lab');
  Printer.Canvas.TextOut(1300, nrLinha, 'Qtdade');
  Printer.Canvas.TextOut(1800, nrLinha, 'Descri??o do Produto');
  Printer.Canvas.TextOut(3700, nrLinha, '%. Desconto');
  Printer.Canvas.TextOut(4700, nrLinha, 'Pre?o Unit.');
  Printer.Canvas.TextOut(5700, nrLinha, 'Total Unit.');
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  result := nrLinha;
end;
function CabecalhoPagNovaPagina(nrLinha,nrPagina: Integer):Integer;
begin
  Printer.Canvas.Font.name:='Courier New';
  printer.canvas.font.Size := 12;
  Printer.Canvas.TextOut(0050, nrLinha, 'GAM - Gen?sio A. Mendes & Cia Ltda.');
  printer.canvas.font.Size := 09;
  Printer.Canvas.Font.Style:=[];
//  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(4650, nrLinha, 'Data  :  ' + FormatDateTime('dd/mm/yyyy', dtSistema));
  Printer.Canvas.TextOut(5650, nrLinha, 'Pagina: ' + FormatFloat('##0',nrPagina));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, 'C?digo GAM');
  Printer.Canvas.TextOut(0700, nrLinha, 'C?digo Lab');
  Printer.Canvas.TextOut(1300, nrLinha, 'Qtdade');
  Printer.Canvas.TextOut(1800, nrLinha, 'Descri??o do Produto');
  Printer.Canvas.TextOut(3700, nrLinha, '%. Desconto');
  Printer.Canvas.TextOut(4700, nrLinha, 'Pre?o Unit.');
  Printer.Canvas.TextOut(5700, nrLinha, 'Total Unit.');
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  result := nrLinha;
end;
function RodaPeParcial(nrLinha,nrPagina: Integer;nrUnidadesParcial:Integer;vlPedido:Double):Integer;
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0300, nrLinha, 'SubTotais Unid.:');
  Printer.Canvas.TextOut(1250, nrLinha,formataNumero(07,FormatFloat('##,###,##0', nrUnidadesParcial)));
  Printer.Canvas.TextOut(2500, nrLinha,'Obs.  Cont.Pag..:'+inttostr(nrPagina+1));
  Printer.Canvas.TextOut(5700, nrLinha,formataNumero(11,FormatFloat('##,###,##0.00', vlPedido)));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  result := nrLinha;
end;
function RodaPeFinal(nrLinha,nrPagina: Integer;nrUnidadesParcial:Integer;vlPedido:Double):Integer;
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 09;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0300, nrLinha, 'Totais Unid.:');
  Printer.Canvas.TextOut(1250, nrLinha,formataNumero(07,FormatFloat('##,###,##0', nrUnidadesParcial)));
  Printer.Canvas.TextOut(5700, nrLinha,formataNumero(11,FormatFloat('##,###,##0.00', vlPedido)));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  result := nrLinha;
end;


function LinhaDetalhePedido(nrLinha, nrCodigoGAM,
                              nrQuantidade:Integer;
                             nrCodigoFORNEC,nmProduto, nmApresentacao: String;
                             pcDesconto, vlPrecoUnitario: Double):Integer;
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0150, nrLinha,formataNumero(07,FormatFloat('######/#', nrCodigoGAM)));
  Printer.Canvas.TextOut(0650, nrLinha,formataNumero(10,nrCodigoFORNEC));
  Printer.Canvas.TextOut(1250, nrLinha,formataNumero(07,FormatFloat('##,###,##0', nrQuantidade)));
  Printer.Canvas.TextOut(1800, nrLinha, FormataString(nmProduto, 20));
  Printer.Canvas.TextOut(2500, nrLinha, FormataString(nmApresentacao, 20));
  Printer.Canvas.TextOut(3900, nrLinha,formataNumero(07,FormatFloat('##0.00', pcDesconto)));
  Printer.Canvas.TextOut(4900, nrLinha, formataNumero(06, FormatFloat('##0.00', vlPrecoUnitario)));
  Printer.Canvas.TextOut(5700, nrLinha,formataNumero(11, FormatFloat('##,###,##0.00', vlPrecoUnitario*nrQuantidade)));
  result := nrLinha;
end;



FUNCTION getPrazoPedido(nrPedido,nrcondicao:Integer):String;
var
  PrazoPedido :TCondicaoPagamento;
  I : iNTEGER;
  pcParcela,
  vtparcela,
  vlPedido:Double;
  dtPrevista :TDate;
  Dadospedido:TDadosValoresPedido;
  stCondicao:String;

BEGIN
   DadosPedido:=GetValoresPedido(nrPedido,false);
   PrazoPedido:=nrParcelaPedido(Dadospedido.nrCondicaoPagamento);
   vlPedido      := Dadospedido.vtPrecoFornecedorPedido;
   dtPrevista    := Dadospedido.dtPedido;
   if PrazoPedido.nrCondicaoPagamento>0 then
   begin
     pcParcela     := 100/PrazoPedido.nrCondicaoPagamento;
     vtparcela     := vlPedido/PrazoPedido.nrCondicaoPagamento;
   end;
   stCondicao:='';
   FOR I:=1 TO PrazoPedido.nrCondicaoPagamento DO
   BEGIN
    if stCondicao<>'' then
       stCondicao:=stCondicao +','+ FormatFloat('##0',PrazoPedido.nrDiasPrazo[i])+' Dias'
    else
       stCondicao:=FormatFloat('##0',PrazoPedido.nrDiasPrazo[i])+' Dias';
   END;
   Result:=stCondicao;
   //IF vtparcela<>100 THEN
    //  AJustaParcelas;
END;


Function CriaDataSetPrazo:TclientDataset;

begin
   with _cdsParcelaPrazoPagamento do
   begin
   TClientDataSet.Create(nil);
   close;
   FieldDefs.Clear;
   FieldDefs.Add('NR_PARCELAS',ftInteger);
   FieldDefs.Add('NR_DIAS',ftInteger);
   FieldDefs.Add('PC_PARCELAS',ftFloat);
   FieldDefs.Add('VL_PARCELAS',ftFloat);
   FieldDefs.Add('DT_PARCELAS',ftDate);
   CreateDataSet;
   end;
   Result:=_cdsParcelaPrazoPagamento;
end;


function setCondicaoPagamento(nrParcela,nrDias:Integer;pcParcela,vlParcela:Double;dtPagamento:TDATE):Boolean;
BEGIN
 TRY
  _cdsParcelaPrazoPagamento.Open;
  _cdsParcelaPrazoPagamento.Append;
  _cdsParcelaPrazoPagamento.FieldByName('NR_DIAS').AsInteger  :=nrDias;
  _cdsParcelaPrazoPagamento.FieldByName('PC_PARCELAS').AsFloat      := pcParcela;
  _cdsParcelaPrazoPagamento.FieldByName('VL_PARCELAS').AsFloat      :=vlParcela;
  _cdsParcelaPrazoPagamento.FieldByName('DT_PAGAMENTOS').AsDateTime :=dtPagamento;
  _cdsParcelaPrazoPagamento.Post;
  Result:=true;
 EXCEPT
   BEGIN
    Mensagem('Erro Na Grava??o forma Pagamento',16);
    Result:=false;
   END;
 END;
END;


Function GeraTabelaItensPedidos(nrPedido:Integer):TClientDataSet;
var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
    add('SELECT CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('NROP_Y, NROM_Y, QUAY_Y, CHEY_Y,SITY_Y, ABTY_Y,DADY_Y,');
    add('PRZY_Y, PUNY_Y,  PFBY_Y,  DFIY_Y, VCCI_Y,');
    add('NRVV_Y  ,CD_INTERNO_LABORATORIO,PC_VERBA ,VL_VERBA , ID_DESCONTO_ACUMULATIVO,');
    add('CD_LISTA_COMPRA,PC_MUDANCA_PRECO,NR_OPERADOR_LOGISTICO,CD_EAN_COMPRA');
    add('FROM');
    add('PRDDM.DCPCI,');
    add('PRDDM.DC_MERCADORIA');
    add('WHERE NROM_Y=CD_MERCADORIA');
    Add('AND SITY_Y NOT IN(''C'',''I'')');
    add('AND NROP_Y = :PnrPedido');
   end;
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrPedido').AsInteger:=nrPedido;
     open;
    end;
    Result:=_cdsTemp;
//    if not _cdsTemp.IsEmpty then
  //     Result:=_cdsTemp;
 finally
   FreeAndNil(stQuery);
 end;
end;

Function DiasVendaPeriodo:TClientDataSet;
var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
    add('SELECT  DATD_D,EXTRACT(MONTH FROM DATD_D) MES,DIAD_D');
    add('FROM PRDDM.DCDIA');
    add('WHERE DATD_D>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
    add('AND DATD_D < TRUNC(SYSDATE,''MONTH'') AND TIPD_D=''U''');
    add('UNION all');
    add('SELECT  DATD_D,13,DIAD_D');
    add('FROM PRDDM.DCDIA');
    add('WHERE DATD_D>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0) AND TIPD_D=''U''');
   end;
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     open;
    end;
    Result:=nil;
    if not _cdsTemp.isempty then
        Result:=_cdsTemp;
 finally
   FreeAndNil(stQuery);
 end;
end;

Function DiasUtilDoMes:Integer;
var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
    add('SELECT  DATD_D,13,DIAD_D');
    add('FROM PRDDM.DCDIA');
    add('WHERE DATD_D>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0) AND TIPD_D=''U''');
   end;
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     open;
    end;
    Result:=0;
    if not _cdsTemp.isempty then
        Result:=_cdsTemp.FieldByName('DIAD_D').AsInteger;
 finally
   FreeAndNil(stQuery);
 end;
end;

Function DiasFaturamento:Integer;
var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
    add('SELECT  DATD_D,13,DIAD_D');
    add('FROM PRDDM.DCDIA');
    add('WHERE DATD_D>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0) AND TIPD_D=''A''');
   end;
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     open;
    end;
    Result:=0;
    if not _cdsTemp.isempty then
        Result:=_cdsTemp.FieldByName('DIAD_D').AsInteger;
 finally
   FreeAndNil(stQuery);
 end;
end;



Function SetBonificaPedido(nrPedido,nrProduto,nrVerba:Integer):Boolean;
var
  tempQuery : TSQLQuery;
begin
 try
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      SQL.add('UPDATE PRDDM.DCPCI SET VL_VERBA=VCCI_Y*QUAY_Y,QT_BONIFICADA=quay_y,PC_VERBA=100,');
      SQL.add('NRVV_Y=:PnrVerba');
      SQL.add('WHERE');
      SQL.add('NROP_Y = :PnrPedido');
      if nrProduto>0 then
       SQL.add('AND NROM_Y=:PnrProduto');
    //  SQL.add('AND VCCI_Y>0');
      ParamByName('PnrPedido').AsBCD:=nrPedido;
      ParamByName('PnrVerba').AsBCD:=nrVerba;
      if nrProduto>0 then
         ParamByName('PnrProduto').AsBCD:=nrProduto;
       Result:=true;
       if ExecSQL(false)<=0 then
          Result:=false
    end;
  except
   on E: Exception do
   begin
     trataerro(E.Message,'Erro ao Bonificar Pedido...');
    end;
  end;

 finally
   FreeAndNil(tempQuery);
 end;
end;
Function SetBonificaZeraCusto(PnrPedido,PnrProduto,PnrVerba:Integer):Boolean;
var
  tempQuery : TSQLQuery;
begin
 try
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      SQL.add('UPDATE PRDDM.DCPCI SET VCCI_Y=0');
      SQL.add('WHERE');
      SQL.add('NROP_Y = :PnrPedido');
      if PnrProduto>0 then
       SQL.add('AND NROM_Y=:PnrProduto');
    //  SQL.add('AND VCCI_Y>0');
      ParamByName('PnrPedido').AsBCD:=PnrPedido;
      if PnrProduto>0 then
         ParamByName('PnrProduto').AsBCD:=PnrProduto;
       Result:=true;
       if ExecSQL(false)<=0 then
          Result:=false
    end;
  except
   on E: Exception do
   begin
     trataerro(E.Message,'Erro ao Bonificar Pedido...');
    end;
  end;

 finally
   FreeAndNil(tempQuery);
 end;
end;




procedure Imprimir(PnrPedido:Integer;PidPrecoCusto,PidPercentualDesconto:Char);
var
  nrLinha,ctLinha,nrPag,
  nrTotalUnidades:Integer;
  vlPedido,vlItemImpressao,
  pcDesconto :Double;
  idTipoOrientacaoPagina,
  stPrazoPredido:String;
  DadosValoresPedido:TDadosValoresPedido;
  DadosCD:TDadosCD;
  DadosFornecedor:TDadosFornecedor;
  _cdstemp:TClientDataSet;
  stObs:String;
begin
  DadosValoresPedido:=GetValoresPedido(PnrPedido,false);
  DadosCD:=GetDadosCD(DadosValoresPedido.cdEmpresa);
  DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);
  stPrazoPredido:=getPrazoPedido(PnrPedido,0);
  with Printer do
  begin
    nrLinha := 0;
    ctLinha :=0;
    nrTotalUnidades:=0;
    vlPedido :=0;
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 08;
    nrPag   := 1;
    nrLinha := 185;
    Title := 'Pedido Compra';
    Orientation := poLandscape;
    BeginDoc;
    nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
    nrLinha:=TopoPaginaPedido(nrPag, nrLinha, PnrPedido,DadosValoresPedido.dtPedido,'',DadosCD.stENDERECO+' N?. '+DadosCD.nrLogradouro,
    DadosCD.stBAIRRO,DadosCD.stCIDADE+'/'+DadosCD.stEstado,DadosCD.stEstado,DadosCD.stCEP,FormatFloat('00000',DadosFornecedor.nrFornecedor)+' - '+DadosFornecedor.dsRazaoSocial,stPrazoPredido);
    stObs:=DadosValoresPedido.stObservacaoPedido;
    if DadosValoresPedido.nrPedidoVinculado>0 then
        stObs:=trim(stObs) + ' Existe outro Pedido Vinculado a Este --> '+FormatFloat('000000',DadosValoresPedido.nrPedidoVinculado);
    nrLinha:=CabecalhoPag(nrLinha,nrPag,stObs);
    _cdstemp:=GeraTabelaItensPedidos(PnrPedido);
    _cdstemp.IndexFieldNames:='NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA';
    _cdstemp.First;
    while not _cdstemp.Eof do
    begin
      inc(ctLinha);
         if PidPrecoCusto='N' then
            vlItemImpressao:= _cdstemp.FieldByName('PFBY_Y').AsFloat;
        if PidPrecoCusto='S' then
           vlItemImpressao:= _cdstemp.FieldByName('PUNY_Y').AsFloat;

        if PidPercentualDesconto='S' then
           pcDesconto     := _cdstemp.FieldByName('ABTY_Y').AsFloat+
                            _cdstemp.FieldByName('DADY_Y').AsFloat
        else
           pcDesconto     :=0;




      nrLinha:=LinhaDetalhePedido(nrLinha,
                           _cdstemp.FieldByName('CD_PRODUTO').AsInteger,
                           _cdstemp.FieldByName('QUAY_Y').AsInteger,
                           _cdstemp.FieldByName('CD_INTERNO_LABORATORIO').AsString,
                           _cdstemp.FieldByName('NM_MERCADORIA').AsString,
                           _cdstemp.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString,
                            pcDesconto,
                           vlItemImpressao);
       nrTotalUnidades := nrTotalUnidades +_cdstemp.FieldByName('QUAY_Y').AsInteger;
       vlPedido        := vlPedido +(_cdstemp.FieldByName('QUAY_Y').AsInteger*
                                    vlItemImpressao);
      if ctLinha > 38 then
      begin
        RodaPeParcial(nrLinha,nrPag,nrTotalUnidades,vlPedido);
        Printer.NewPage;
        ctLinha := 0;
        nrLinha := 200;
        Inc(nrPag);
        nrLinha:=CabecalhoPagNovaPagina(nrLinha,nrPag);
      end;
      _cdstemp.Next;
    end;
    RodaPeFinal(nrLinha,0,nrTotalUnidades,vlPedido);
   EndDoc;
  end;
end;


Procedure GerarExcelPedido(PnrPedido:Integer;PidPrecoCusto,PidPercentualDesconto:Char);
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
        dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';
     //    excel.Name:=dsNmPlanilha;

        if AnsiContainsStr(DadosValoresPedido.stObservacaoPedido,'Psicotr?picos') then
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
  ShellExecute(HDROP, 'Open', pchar(dsNmPlanilha), nil, pchar(dsLocalPanilha+'\'), SW_SHOWNORMAL);

     //excel.quit;
end;


function GetValoresPedidoItensPsicotropico(nrPedido:Integer):TDadosValoresPedido;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    DadosValoresPedido:=TDadosValoresPedido.Create;
    try
      with QryTemp do
      begin
       SQL.Add('SELECT');
         SQL.Add('NROP_P,DATP_P,LABP_P,COUNT(*) NR_ITENS,SNRP_P,');
       SQL.Add('SUM(QUAY_Y) AS TOTAL_UNIDADES,');
       SQL.Add('SUM(QUAY_Y* PFBY_Y) AS VL_PCO_FABRICA,');
       SQL.Add('SUM(QUAY_Y* VCCI_Y) AS VL_PCO_CUSTO,');
       SQL.Add('CAPA.CD_EMPRESA,NR_CONDICAO_PAGTO_P,OBSP_P,ABTP_P,PRZP_P,');
       SQL.Add('PREP_P,DT_AGENDAMENTO_PEDIDO,CD_OPERADOR_LOGISTICO,CAPA.CD_COMPRADOR,');
       SQL.Add('GRUPO_FORNECEDOR.PC_VERBA_GERACAO,GRUPO_FORNECEDOR.NR_VERBA_GERACAO,CD_EMPRESA_DESTINO,max(NR_LISTA_PRECO) as NR_LISTA_PRECO');
       SQL.Add('FROM');
       SQL.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
       SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
       SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
       SQL.Add('PRDDM.DCPCC CAPA,');
       SQL.Add('PRDDM.DCPCI ITEM');
       SQL.Add('WHERE');
       SQL.Add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
       SQL.Add('AND MERCADORIA.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
       SQL.Add('AND MERCADORIA.cd_mercadoria=NROM_Y');
       SQL.Add('AND ID_PSICOTROPICO=''S''');
//       SQL.Add('AND DS_NIVEL_ECTM IN(171,173,176,178)');
       SQL.Add('AND  NROP_P = NROP_Y');
       SQL.Add('AND  SITY_Y NOT IN(''F'',''I'',''C'')');
       SQL.Add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=LABP_P');
       SQL.Add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa');
       SQL.Add('AND nrop_p=:PnrPedido');
       SQL.Add('GROUP BY NROP_P,DATP_P,LABP_P,CAPA.CD_EMPRESA,SNRP_P,');
       SQL.Add('NR_CONDICAO_PAGTO_P,OBSP_P,ABTP_P,PRZP_P,PREP_P,DT_AGENDAMENTO_PEDIDO,CD_OPERADOR_LOGISTICO,CAPA.CD_COMPRADOR,');
       SQL.Add('GRUPO_FORNECEDOR.PC_VERBA_GERACAO,GRUPO_FORNECEDOR.NR_VERBA_GERACAO,CD_EMPRESA_DESTINO');
       ParamByName('PnrPedido').AsInteger:=nrPedido;
       open;
       if not QryTemp.IsEmpty then
       begin
        DadosValoresPedido.nrPedido               :=QryTemp.FieldByName('NROP_P').AsInteger;
        DadosValoresPedido.cdEmpresa              :=QryTemp.FieldByName('CD_EMPRESA').AsInteger;
        DadosValoresPedido.dtPedido               :=QryTemp.FieldByName('DATP_P').AsDateTime;
        DadosValoresPedido.nrItensPedido          :=QryTemp.FieldByName('NR_ITENS').AsInteger;
        DadosValoresPedido.nrFornecedor           :=QryTemp.FieldByName('LABP_P').AsInteger;
        DadosValoresPedido.nrTotalUnidadesPedido  :=QryTemp.FieldByName('TOTAL_UNIDADES').AsInteger;
        DadosValoresPedido.vtPrecoFornecedorPedido:=QryTemp.FieldByName('VL_PCO_FABRICA').AsFloat;
        DadosValoresPedido.vtPrecoCustoPedido     :=QryTemp.FieldByName('VL_PCO_CUSTO').AsFloat;
        DadosValoresPedido.nrCondicaoPagamento    :=QryTemp.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger;
        DadosValoresPedido.stObservacaoPedido     :=QryTemp.FieldByName('OBSP_P').AsString;
        DadosValoresPedido.pcDescontoPadrao       :=QryTemp.FieldByName('ABTP_P').AsFloat;
        DadosValoresPedido.dtPrevistaChegada      :=QryTemp.FieldByName('PREP_P').AsDateTime;
        DadosValoresPedido.dtAgendada             :=QryTemp.FieldByName('DT_AGENDAMENTO_PEDIDO').AsDateTime;
        DadosValoresPedido.nrOperadorLogistico    :=QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').asInteger;
        DadosValoresPedido.nrCompradorPedido      :=QryTemp.FieldByName('CD_COMPRADOR').asInteger;
        DadosValoresPedido.pcGeracaoVerba         :=QryTemp.FieldByName('PC_VERBA_GERACAO').AsFloat;
        DadosValoresPedido.nrGeracaoVerba         :=QryTemp.FieldByName('NR_VERBA_GERACAO').AsInteger;
        DadosValoresPedido.stModoPedido           :=QryTemp.FieldByName('SNRP_P').AsString;
        DadosValoresPedido.nrDiasPrazo            :=QryTemp.FieldByName('PRZP_P').AsInteger;
        DadosValoresPedido.cdEmpresaDestino        :=QryTemp.FieldByName('CD_EMPRESA_DESTINO').AsInteger;
        DadosValoresPedido.nrListaPrecoExcecao     :=QryTemp.FieldByName('NR_LISTA_PRECO').AsInteger;



       end;
       result:=DadosValoresPedido;

      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Ler dados do Pedido...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;



function GetValoresPedidoItensCrossDocking(nrPedido:Integer):TDadosValoresPedido;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
  stQry :TStringList;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    stQry:=TStringList.Create;
    DadosValoresPedido:=TDadosValoresPedido.Create;
    try
      with QryTemp do
      begin
       SQL.Add('SELECT');
       SQL.Add('NROP_P,DATP_P,LABP_P,COUNT(*) NR_ITENS,SNRP_P,');
       SQL.Add('SUM(QUAY_Y) AS TOTAL_UNIDADES,');
       SQL.Add('SUM(QUAY_Y* PFBY_Y) AS VL_PCO_FABRICA,');
       SQL.Add('SUM(QUAY_Y* VCCI_Y) AS VL_PCO_CUSTO,');
       SQL.Add('CAPA.CD_EMPRESA,NR_CONDICAO_PAGTO_P,OBSP_P,ABTP_P,');
       SQL.Add('PREP_P,PRZP_P,DT_AGENDAMENTO_PEDIDO,CD_OPERADOR_LOGISTICO,CAPA.CD_COMPRADOR,');
       SQL.Add('GRUPO_FORNECEDOR.PC_VERBA_GERACAO,GRUPO_FORNECEDOR.NR_VERBA_GERACAO,CD_EMPRESA_DESTINO,max(NR_LISTA_PRECO) as NR_LISTA_PRECO');
       SQL.Add('FROM');
       SQL.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
       SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
       SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
       SQL.Add('PRDDM.DCPCC CAPA,');
       SQL.Add('PRDDM.DCPCI ITEM');
       SQL.Add('WHERE');
       SQL.Add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
       SQL.Add('AND MERCADORIA.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
       SQL.Add('AND MERCADORIA.cd_mercadoria=NROM_Y');
//       SQL.Add('AND ID_PSICOTROPICO=''S''');
       sql.Add('And QT_BONIFICADA<>ITEM.cd_empresa');
       SQL.Add('AND  NROP_P = NROP_Y');
       SQL.Add('AND  SITY_Y NOT IN(''F'',''I'',''C'')');
       SQL.Add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=LABP_P');
       SQL.Add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa');
       SQL.Add('AND nrop_p=:PnrPedido');
       SQL.Add('GROUP BY NROP_P,DATP_P,LABP_P,CAPA.CD_EMPRESA,SNRP_P,');
       SQL.Add('NR_CONDICAO_PAGTO_P,OBSP_P,ABTP_P,PREP_P,PRZP_P,DT_AGENDAMENTO_PEDIDO,CD_OPERADOR_LOGISTICO,CAPA.CD_COMPRADOR,');
       SQL.Add('GRUPO_FORNECEDOR.PC_VERBA_GERACAO,GRUPO_FORNECEDOR.NR_VERBA_GERACAO,CD_EMPRESA_DESTINO');
       ParamByName('PnrPedido').AsInteger:=nrPedido;
        stQry.Add(QryTemp.Text);
        stQry.SaveToFile('C:\temp\qrySeparapedidoCross.sql');

       open;
       if not QryTemp.IsEmpty then
       begin
        DadosValoresPedido.nrPedido               :=QryTemp.FieldByName('NROP_P').AsInteger;
        DadosValoresPedido.cdEmpresa              :=QryTemp.FieldByName('CD_EMPRESA').AsInteger;
        DadosValoresPedido.dtPedido               :=QryTemp.FieldByName('DATP_P').AsDateTime;
        DadosValoresPedido.nrItensPedido          :=QryTemp.FieldByName('NR_ITENS').AsInteger;
        DadosValoresPedido.nrFornecedor           :=QryTemp.FieldByName('LABP_P').AsInteger;
        DadosValoresPedido.nrTotalUnidadesPedido  :=QryTemp.FieldByName('TOTAL_UNIDADES').AsInteger;
        DadosValoresPedido.vtPrecoFornecedorPedido:=QryTemp.FieldByName('VL_PCO_FABRICA').AsFloat;
        DadosValoresPedido.vtPrecoCustoPedido     :=QryTemp.FieldByName('VL_PCO_CUSTO').AsFloat;
        DadosValoresPedido.nrCondicaoPagamento    :=QryTemp.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger;
        DadosValoresPedido.stObservacaoPedido     :=QryTemp.FieldByName('OBSP_P').AsString;
        DadosValoresPedido.pcDescontoPadrao       :=QryTemp.FieldByName('ABTP_P').AsFloat;
        DadosValoresPedido.dtPrevistaChegada      :=QryTemp.FieldByName('PREP_P').AsDateTime;
        DadosValoresPedido.dtAgendada             :=QryTemp.FieldByName('DT_AGENDAMENTO_PEDIDO').AsDateTime;
        DadosValoresPedido.nrOperadorLogistico    :=QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').asInteger;
        DadosValoresPedido.nrCompradorPedido      :=QryTemp.FieldByName('CD_COMPRADOR').asInteger;
        DadosValoresPedido.pcGeracaoVerba         :=QryTemp.FieldByName('PC_VERBA_GERACAO').AsFloat;
        DadosValoresPedido.nrGeracaoVerba         :=QryTemp.FieldByName('NR_VERBA_GERACAO').AsInteger;
        DadosValoresPedido.stModoPedido           :=QryTemp.FieldByName('SNRP_P').AsString;
        DadosValoresPedido.nrDiasPrazo            :=QryTemp.FieldByName('PRZP_P').asInteger;
        DadosValoresPedido.cdEmpresadESTINO       :=QryTemp.FieldByName('CD_EMPRESA_DESTINO').asInteger;
        DadosValoresPedido.nrListaPrecoExcecao    :=QryTemp.FieldByName('NR_LISTA_PRECO').AsInteger;


       end;
       result:=DadosValoresPedido;

      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Ler dados do Pedido...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;



function GetIdSeparaPsicotropico(PnrPedido:Integer):boolean;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    Result:=False;
    try
      with QryTemp do
      begin
        sql.add('SELECT COUNT(*) NR_REGISTRO');
        sql.add('FROM');
        sql.add('(SELECT');
        sql.add('DISTINCT  CASE');
        sql.add('WHEN ID_PSICOTROPICO=''S'' THEN ''PSICO''');
        sql.add('WHEN ID_PSICOTROPICO<>''S'' THEN ''OUTROS''');
        sql.add('END ID_TIPO_PRODUTO');
        sql.add('FROM');
        sql.add('PRDDM.DC_MERCADORIA MERCADORIA ,');
        sql.add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
        sql.add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        sql.add('PRDDM.DCPCI,');
        sql.add('PRDDM.DCPCC');
        sql.add('WHERE');
        sql.add('NROP_Y  =NROP_P');
        sql.Add('and sity_y in(''N'',''S'')');
        sql.add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
        sql.add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        sql.add('AND NROM_Y  =MERCADORIA.CD_MERCADORIA');
        sql.add('AND NROP_P=:PnrPedido)');
        ParamByName('PnrPedido').AsInteger:=pnrPedido;
        open;
        if not QryTemp.IsEmpty then
           if QryTemp.FieldByName('NR_REGISTRO').AsInteger >1 then
              Result:=TRUE;
      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Identificar Pedido Psicotropico...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;




function GetPedidoPsicotropico(PnrPedido:Integer):boolean;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    Result:=False;
    try
      with QryTemp do
      begin
        sql.add('SELECT');
        sql.add('DISTINCT  CASE');
        sql.add('WHEN ID_PSICOTROPICO=''S'' THEN ''PSICO''');
        sql.add('WHEN ID_PSICOTROPICO<>''S'' THEN ''OUTROS''');
        sql.add('END ID_TIPO_PRODUTO');
        sql.add('FROM');
        sql.add('PRDDM.DC_MERCADORIA MERCADORIA ,');
        sql.add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
        sql.add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        sql.add('PRDDM.DCPCI,');
        sql.add('PRDDM.DCPCC');
        sql.add('WHERE');
        sql.add('NROP_Y  =NROP_P');
        sql.add('AND quay_Y>0');
        sql.Add('and sity_y in(''N'',''S'')');
        sql.add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
        sql.add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        sql.add('AND id_psicotropico=''S''');
        sql.add('AND NROM_Y  =MERCADORIA.CD_MERCADORIA');
        sql.add('AND NROP_P=:PnrPedido');
        ParamByName('PnrPedido').AsInteger:=pnrPedido;
        open;
         Result:=false;
        if not QryTemp.IsEmpty then
              Result:=TRUE;
      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Indentificar Pedido Psicotropico...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;



function GetIdSeparaCrossDocking(PnrPedido:Integer):boolean;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    Result:=False;
    try
      with QryTemp do
      begin
        sql.add('SELECT COUNT(*) NR_REGISTRO');
        sql.add('FROM');
        sql.add('(SELECT');
        sql.add('DISTINCT  CASE');
        sql.add('WHEN QT_BONIFICADA<> 5 THEN ''CROSSDOCKING''');
        sql.add('WHEN QT_BONIFICADA=1 THEN ''NORMAL''');
        sql.add('END ID_TIPO_PRODUTO');
        sql.add('FROM');
        sql.add('PRDDM.DC_MERCADORIA MERCADORIA ,');
        sql.add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
        sql.add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        sql.add('PRDDM.DCPCI Item,');
        sql.add('PRDDM.DCPCC');
        sql.add('WHERE');
        sql.add('NROP_Y  =NROP_P');
        sql.Add('and sity_y in(''N'',''S'')');
        sql.Add('and ((Item.cd_empresa<>QT_BONIFICADA))');
        sql.add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
        sql.add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        sql.add('AND NROM_Y  =MERCADORIA.CD_MERCADORIA');
        sql.add('AND NROP_P=:PnrPedido)');
        ParamByName('PnrPedido').AsInteger:=pnrPedido;
        open;
        if not QryTemp.IsEmpty then
           if QryTemp.FieldByName('NR_REGISTRO').AsInteger >0 then
              Result:=TRUE;
      end;
    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Identificar Pedido Psicotropico...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function GetIdSeparaCrossDockingNova(PnrPedido:Integer):TclientDataset;
var
  QryTemp: TSQLQuery;
  DadosValoresPedido :TDadosValoresPedido;
  _cdstemp:TclientDataset;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    Result:=nil;
    try
      with QryTemp do
      begin
        SQL.ADD('SELECT');
        SQL.ADD(' ITEM.CD_EMPRESA CD_EMPRESA_CROSSDOCKING,');
        SQL.ADD(' CD_EMPRESA_DESTINO,');
        SQL.ADD(' Count(*)');
        SQL.ADD('FROM');
        SQL.ADD('PRDDM.DCPCI ITEM,');
        SQL.ADD('PRDDM.DCPCC');
        SQL.ADD('WHERE');
        SQL.ADD('NROP_Y  =NROP_P');
        SQL.ADD('AND SITY_Y IN(''N'',''S'')');
        SQL.ADD('AND QUAY_Y>0');
        SQL.ADD('AND NROP_P=:PnrPedido');
        SQL.ADD('GROUP BY ITEM.CD_EMPRESA ,');
        SQL.ADD('CD_EMPRESA_DESTINO');
        SQL.ADD('ORDER BY CD_EMPRESA_CROSSDOCKING');
      end;
    QryTemp.SQL.SaveToFile('C:\TEMP\Compra_SeparaPedidoCrossDocking.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := QryTemp.Text;
      Params.ParamByName('PnrPedido').AsInteger := PnrPedido;
      open;
    end;
    result := NIL;
    if NOT _cdsTemp.IsEmpty then
    begin
      _cdsTemp.recordCount;
      result := _cdsTemp;
    end;


    except
      on E: Exception do
     begin
       trataerro(E.Message,'Erro ao Identificar Pedido Psicotropico...');
      end;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;



Function SetNumeroPedidoRelacionado(nrPedido,nrPedidoRelacionado:Integer):Boolean;
var
  tempQuery : TSQLQuery;
begin
 try
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      SQL.add('UPDATE PRDDM.DCPCC SET');
      SQL.add('CD_PEDIDO_RELACIONADO=:PnrPedidoRelacionado');
      SQL.add('WHERE NROP_P=:PnrPedido');
      ParamByName('PnrPedidoRelacionado').AsInteger:=nrPedidoRelacionado;
      ParamByName('PnrPedido').AsInteger:=nrPedido;
       Result:=true;
       if ExecSQL(false)<=0 then
          Result:=false
    end;
  except
   on E: Exception do
   begin
     trataerro(E.Message,'Erro ao atualizar nr Pedido Relacionado!!!!');
    end;
  end;

 finally
   FreeAndNil(tempQuery);
 end;
end;


Function SetItensPedidoRelacionado(nrPedido,nrPedidoRelacionado,PnrOPeradorLogistico:Integer):Boolean;
var
  tempQuery : TSQLQuery;
begin
 try
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      SQL.add('UPDATE PRDDM.DCPCI SET NROP_Y=:PnrPedidoNovo,NR_OPERADOR_LOGISTICO=:PnrOPeradorLogistico');
      SQL.add('WHERE');
      SQL.add('NROP_Y=:PNRPEDIDO AND NROM_Y IN(');
      SQL.add('SELECT NROM_Y ');
      SQL.add('FROM');
      SQL.add('PRDDM.DC_MERCADORIA MERCADORIA ,');
      SQL.add('PRDDM.DCPCI,');
      SQL.add('PRDDM.DCPCC');
      SQL.add('WHERE');
      SQL.add('NROP_Y  =NROP_P');
      SQL.add('AND NROM_Y  =MERCADORIA.CD_MERCADORIA');
      SQL.add('AND ID_PSICOTROPICO=''S''');
//      SQL.add('AND DS_NIVEL_ECTM IN(171,173,176,178)');
      SQL.add('AND NROP_P=:PnrPedido)');
      ParamByName('PnrPedidoNovo').AsInteger:=nrPedidoRelacionado;
      ParamByName('PnrOPeradorLogistico').AsInteger:=PnrOPeradorLogistico;
      ParamByName('PnrPedido').AsInteger:=nrPedido;
      Result:=true;
      if ExecSQL(false)<=0 then
          Result:=false
    end;
  except
   on E: Exception do
   begin
     trataerro(E.Message,'Erro ao atualizar Itens do Pedido de Psicotropico!!!!');
    end;
  end;

 finally
   FreeAndNil(tempQuery);
 end;
end;

Function SetItensPedidoCrossDocking(nrPedido,nrPedidoRelacionado,PnrOPeradorLogistico,PcdEmpresaPedido,PcdEmpresaDestino:Integer):Boolean;
var
  tempQuery : TSQLQuery;
begin
 try
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      SQL.add('UPDATE PRDDM.DCPCI SET NROP_Y=:PnrPedidoNovo,NR_OPERADOR_LOGISTICO=:PnrOPeradorLogistico,');
      SQL.add('cd_empresa=:PcdEmpresaDestino');
      SQL.add('WHERE');
      SQL.add('NROP_Y=:PNRPEDIDO AND NROM_Y IN(');
      SQL.add('SELECT NROM_Y ');
      SQL.add('FROM');
      SQL.add('PRDDM.DC_MERCADORIA MERCADORIA ,');
      SQL.add(' PRDDM.DCPCI I,');
      SQL.add('PRDDM.DCPCC c');
      SQL.add('WHERE');
      SQL.add('NROP_Y  =NROP_P');
      SQL.add('AND NROM_Y  =MERCADORIA.CD_MERCADORIA');
      SQL.add('AND i.cd_empresa=:PcdEmpresaPedido');
      SQL.add('AND NROP_P=:PnrPedido)');
      ParamByName('PnrPedidoNovo').AsBCD:=nrPedidoRelacionado;
      ParamByName('PnrOPeradorLogistico').AsInteger:=PnrOPeradorLogistico;
      ParamByName('PnrPedido').AsBCD:=nrPedido;
      ParamByName('PcdEmpresaPedido').AsBCD:=PcdEmpresaPedido;
      ParamByName('PcdEmpresaDestino').AsBCD:=PcdEmpresaPedido;
      Result:=true;
      if ExecSQL(false)<=0 then
          Result:=false
    end;
  except
   on E: Exception do
   begin
     trataerro(E.Message,'Erro ao atualizar Itens do Pedido de Psicotropico!!!!');
    end;
  end;

 finally
   FreeAndNil(tempQuery);
 end;
end;




function SeparaPedidoPsicotropico(Pnrpedido,PnrOperadorLogistico:Integer;
                                  PnrLeadTime:Double;PnrDiasEstoqueComprador:Integer;
                                  PdtPedido:Tdate;
                                  PidBonificado:boolean;
                                  PnrVerba:Integer;
                                  PnrListaPrecoExcecao:Integer):Boolean;
VAR
 DadosValoresPedido:TDadosValoresPedido;
 nrPedidoNovo,
 CdEmpresaLogica,
 nrPedidoAnterior:Integer;
 DadosFornecedor:TDadosFornecedor;
 stObs:String[40];
begin

   if GetIdSeparaPsicotropico(Pnrpedido) then
   begin

   DadosValoresPedido:=GetValoresPedidoItensPsicotropico(pnrpedido);
   DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);

   //nrCompradorPedido:=DadosValoresPedido.nrCompradorPedido;
   CdEmpresaLogica:=0;
   if DadosValoresPedido.nrItensPedido>0 then
   begin
    nrPedidoAnterior:=DadosValoresPedido.nrPedido;
    nrPedidoNovo:=GeraNumeroPedido('C');
    CdEmpresaLogica:=CarregaEmpresaLogica(DadosValoresPedido.cdEmpresa);
    if CdEmpresaLogica=DadosValoresPedido.cdEmpresa then
      CdEmpresaLogica:=0;


    if nrPedidoNovo>0 then
    begin
      if  GravaCapaPedido(nrPedidoNovo, // NROP_P,//  NUMBER(6)
                       DadosValoresPedido.nrFornecedor, // LABP_P :Integer;// NUMBER(6)
                       PdtPedido, // DATP_P :Tdate;// DATE
                       DadosValoresPedido.pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                       0, // DESP_P:Double;// NUMBER(5,2)
                       'S', // SITP_P :String;//CHAR(1)
                       DadosValoresPedido.nrDiasPrazo, // PRZP_P :Integer;//NUMBER(3)
                       DadosValoresPedido.dtPrevistaChegada, // PREP_P          //DATE
                       trim(DadosValoresPedido.stObservacaoPedido), // CHAR(40)
                       DadosValoresPedido.stModoPedido, // SNRP_P           //  CHAR(10)
                       0, // FLAP_P ,         //NUMBER(1)
                       DadosValoresPedido.nrCondicaoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                       nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                       strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                       DadosValoresPedido.dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                       'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                       PnrOperadorLogistico,
                       // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                       NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                       DadosValoresPedido.dtAgendada, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                       dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                       0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                       0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                       strtodate('01/01/2039'),
                       DadosValoresPedido.nrCompradorPedido,
                       DadosValoresPedido.cdEmpresa,
                       nrPedidoAnterior,
                       DadosValoresPedido.pcGeracaoVerba,
                       DadosValoresPedido.nrGeracaoVerba ,
                       PnrDiasEstoqueComprador,
                       DadosValoresPedido.cdEmpresaDestino,'N',CdEmpresaLogica,
                       DadosValoresPedido.nrListaPrecoExcecao) then
                       begin


                        SetItensPedidoRelacionado(nrPedidoAnterior,nrPedidoNovo,PnrOperadorLogistico);
                        SetNumeroPedidoRelacionado(nrPedidoAnterior,nrPedidoNovo);

                        DadosValoresPedido:=GetValoresPedidoItensPsicotropico(nrPedidoNovo);
                        if DadosValoresPedido.nritensPedido>0 then
                        begin
                          stObs:='Ped.de Psicotr?p.';
                          if PidBonificado then
                             stObs:='Ped.de Psicotr?p.- Bonificado';


                         AtualizaCapaPedido(nrPedidoNovo,
                                            DadosValoresPedido.nrCondicaoPagamento,
                                            PnrOperadorLogistico,PnrLeadTime ,'N',stObs,false,
                                            PdtPedido,
                                            PdtPedido,
                                            PdtPedido,
                                            PnrDiasEstoqueComprador,
                                            PnrVerba,PidBonificado,DadosValoresPedido.nrListaPrecoExcecao);
                         AtualizaStatusItemPedido(nrPedidoNovo, 0, 0,'N');
                         GerarExcelPedido(nrPedidoNovo, 'N', 'S');
                        end
                        else
                         AtualizaCapaPedido(nrPedidoNovo, DadosValoresPedido.nrCondicaoPagamento, PnrOperadorLogistico,PnrLeadTime ,'I','Pedido sem itens',false,dtPedido,dtPedido,
                         dtPedido,PnrDiasEstoqueComprador,pnrVerba,PidBonificado,DadosValoresPedido.nrListaPrecoExcecao);

                       end;


      end;
    end;

end;

end;


function SeparaPedidoCrossDocking(Pnrpedido,
                                  PnrOperadorLogistico:Integer;
                                  PnrLeadTime:Double;
                                  PnrDiasEstoqueComprador:Integer;
                                  PdtPedido:Tdate;
                                  PidBonificado:boolean;
                                  PnrVerba:Integer):Boolean;
VAR
 DadosValoresPedido:TDadosValoresPedido;
 nrPedidoNovo,
 cdDestino,
 cdCrossDocking,
 CdEmpresaLogica,
 CdEmpresaFisica,
 nrPedidoAnterior:Integer;
 DadosFornecedor:TDadosFornecedor;
 _cdstemp:TClientDataSet;
 stObs:String[40];
begin


   result:=true;
  _cdstemp:=GetIdSeparaCrossDockingNova(Pnrpedido);

  if _cdstemp<>nil then
  begin
     _cdstemp.Open;
     _cdstemp.First;

      DadosValoresPedido:=GetValoresPedidoItensCrossDocking(pnrpedido);
      DadosFornecedor   :=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);

     while not _cdstemp.Eof do
     begin
       cdCrossDocking:=_cdstemp.FieldByName('CD_EMPRESA_CROSSDOCKING').AsInteger;
       cdDestino     := _cdstemp.FieldByName('CD_EMPRESA_DESTINO').AsInteger;

       //Pedido Todo CrossDocking...apenas empresa crossdoking
       CdEmpresaFisica:=CarregaEmpresaFisica(cdCrossDocking);
       if (cdCrossDocking<>cdDestino) and (_cdstemp.recordcount=1) then
       begin
          CdEmpresaLogica:=CarregaEmpresaLogica(cdCrossDocking);
          AtualizaEmpresaLogicaPedido(Pnrpedido,CdEmpresaFisica,CdEmpresaLogica,'S');
          SetItensPedidoCrossDocking(pnrpedido,pnrpedido,PnrOperadorLogistico,cdCrossDocking,cdDestino);
       end;

       //Pedido Todo CrossDocking...com itens que n?o fazem crossDoking
       if (cdCrossDocking<>cdDestino) and (_cdstemp.recordcount>1) then
       begin
        nrPedidoNovo:=GeraNumeroPedido('C');
        if nrPedidoNovo>0 then
        begin
          CdEmpresaLogica:=CarregaEmpresaLogica(cdCrossDocking);

         if  GravaCapaPedido(nrPedidoNovo, // NROP_P,//  NUMBER(6)
                       DadosValoresPedido.nrFornecedor, // LABP_P :Integer;// NUMBER(6)
                       PdtPedido, // DATP_P :Tdate;// DATE
                       DadosValoresPedido.pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                       0, // DESP_P:Double;// NUMBER(5,2)
                       'S', // SITP_P :String;//CHAR(1)
                       DadosValoresPedido.nrDiasPrazo, // PRZP_P :Integer;//NUMBER(3)
                       DadosValoresPedido.dtPrevistaChegada, // PREP_P          //DATE
                       DadosValoresPedido.stObservacaoPedido, // CHAR(40)
                       DadosValoresPedido.stModoPedido, // SNRP_P           //  CHAR(10)
                       0, // FLAP_P ,         //NUMBER(1)
                       DadosValoresPedido.nrCondicaoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                       nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                       strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                       DadosValoresPedido.dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                       'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                       PnrOperadorLogistico,
                       // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                       NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                       DadosValoresPedido.dtAgendada, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                       dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                       0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                       0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                       strtodate('01/01/2039'),
                       DadosValoresPedido.nrCompradorPedido,
                       cdCrossDocking,
                       DadosValoresPedido.nrPedido,
                       DadosValoresPedido.pcGeracaoVerba,
                       DadosValoresPedido.nrGeracaoVerba
                       ,PnrDiasEstoqueComprador,
                       cdDestino,'S',CdEmpresaLogica,DadosValoresPedido.nrListaPrecoExcecao) then
                       begin
                         stObs:='Ped.CrossDocking';
                          if PidBonificado then
                             stObs:='Ped.CrossDocking - Bonificado';


                        SetItensPedidoCrossDocking(pnrpedido,nrPedidoNovo,PnrOperadorLogistico,cdCrossDocking,cdDestino);
                        SetNumeroPedidoRelacionado(pnrpedido,nrPedidoNovo);
                        AtualizaCapaPedido(nrPedidoNovo, DadosValoresPedido.nrCondicaoPagamento, PnrOperadorLogistico,PnrLeadTime ,'N',stObs,false,
                                          PdtPedido,PdtPedido,PdtPedido,PnrDiasEstoqueComprador,PnrVerba,PidBonificado,DadosValoresPedido.nrListaPrecoExcecao);
                        AtualizaStatusItemPedido(nrPedidoNovo, 0, 0,'N');
                        GerarExcelPedido(nrPedidoNovo, 'N', 'S');
//                         GerarExcelPedido(nrPedidoNovo,'S', 'S');

                       end;

             end;

           end;
        _cdstemp.Next;
     end;


end;


end;



function AbrePendenciaLaboratorioNova(nrLaboratorio: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
    try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

    STQRY.Add('(SELECT');
    STQRY.Add(' MERCADORIA.CD_EMPRESA');
    STQRY.Add(' ,MERCADORIA.CD_MERCADORIA');
    STQRY.Add(',Max(NVL(ID_PEDIDO_FATURADO,''N''))  AS ID_PEDIDO_FATURADO');
    STQRY.Add(',Sum(NVL(QT_PEDIDO,0)) AS QT_PEDIDO');
    STQRY.Add(',Sum(NVL(QT_PENDENCIA,0)) AS PENDENCIA');
    STQRY.Add(',Sum(NVL(QT_PENDENCIA,0))+(NVL(QT_TRANSFERENCIA,0))+ (nvl(QT_TRANSITO,0)) AS QT_PENDENTE');
    STQRY.Add(',Sum(NVL(QT_ATENDIDA,0))+Sum(NVL(QT_MERCADORIA_ENTRADA,0)) AS QT_PROCESSADA');
    STQRY.Add(',Sum(NVL(QT_TRANSFERENCIA,0)) QT_TRANSFERENCIA');
    STQRY.Add(',(NVL(QT_TRANSITO,0)) AS QT_TRANSITO');
   STQRY.Add(',Sum(NVL(QT_ATENDIDA,0)) AS QT_ATENDIDA');

    STQRY.Add('fROM');
    STQRY.Add('PRDDM.DC_COMPRA_MERCADORIA MERCADORIA');
     STQRY.Add(' LEFT OUTER JOIN');
     STQRY.Add('     (SELECT');
     STQRY.Add(' ET.CD_MERCADORIA');
     STQRY.Add(',CD_EMPRESA_DESTINO');
     STQRY.Add(',SUM(NVL(QT_TRANSFERENCIA,0)) AS QT_TRANSFERENCIA');
     STQRY.Add(',SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
     STQRY.Add('FROM');
     STQRY.Add('  PRDDM.DC_ESTOQUE_TRANSFERENCIA ET,');
     STQRY.Add('  PRDDM.DC_COMPRA_MERCADORIA CM');
     STQRY.Add('WHERE');
     STQRY.Add('   ET.CD_MERCADORIA=CM.CD_MERCADORIA');
     STQRY.Add('  AND CD_EMPRESA_DESTINO=CM.CD_EMPRESA');
     STQRY.Add('');
     STQRY.Add('GROUP BY  ET.CD_MERCADORIA,CD_EMPRESA_DESTINO ) TRANS ON TRANS.CD_MERCADORIA= MERCADORIA.CD_MERCADORIA AND TRANS.CD_EMPRESA_DESTINO=MERCADORIA.CD_empresa');
          STQRY.Add('LEFT OUTER JOIN (SELECT');
     STQRY.Add('  NROM_Y,');
     STQRY.Add('  CD_DESTINO,');
     STQRY.Add('  QT_PENDENCIA,');
     STQRY.Add('  QT_PEDIDO,');
     STQRY.Add('  QT_ATENDIDA,');
     STQRY.Add(' CD_EMPRESA AS cd_pedido_cross');
     STQRY.Add('FROM');
     STQRY.Add('(SELECT');
     STQRY.Add('          NROM_Y,');
     STQRY.Add('          CD_EMPRESA_DESTINO CD_DESTINO,');
     STQRY.Add('          SUM(ITEM.QUAY_Y -ITEM.CHEY_Y) QT_PENDENCIA,');
     STQRY.Add('          SUM(ITEM.QUAY_Y) QT_PEDIDO,');
     STQRY.Add('          SUM(ITEM.CHEY_Y) QT_ATENDIDA,');
     STQRY.Add('         ');
     STQRY.Add('          CAPA.CD_EMPRESA');
     STQRY.Add('  FROM');
     STQRY.Add('     PRDDM.DCPCC CAPA,');
     STQRY.Add('     PRDDM.DCPCI ITEM,');
     STQRY.Add('     ACESSO.DC_EMPRESA EMP');
     STQRY.Add('  WHERE NROP_P=NROP_Y');
     STQRY.Add('             AND SITP_P IN(''N'',''P'')');
     STQRY.Add('             AND SITY_Y IN(''N'',''P'')');
     STQRY.Add('');
     STQRY.Add('       AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
     STQRY.Add('       AND ((CAPA.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
     STQRY.Add('       AND ID_EMPRESA_FISICA=''S''');
     STQRY.Add('');
     STQRY.Add('        AND LABP_P=:PnrLaboratorio');
     STQRY.Add('       GROUP BY CD_EMPRESA_DESTINO,NROM_Y,CAPA.CD_EMPRESA)) ITEMPEDIDO ON   ITEMPEDIDO.nrom_y=mercadoria.cd_mercadoria AND iTEMPEDIDO.CD_DESTINO=mercadoria.cd_empresa ');
     STQRY.Add('');
     STQRY.Add('       LEFT OUTER JOIN');
     STQRY.Add('(SELECT');
     STQRY.Add('  ');
     STQRY.Add('  PEDIDO_ITEM_NFE.CD_MERCADORIA,');
     STQRY.Add(' SUM(QT_MERCADORIA_ENTRADA) AS QT_MERCADORIA_ENTRADA,');
     STQRY.Add(' PEDIDO_ITEM_NFE.CD_EMPRESA,');
     STQRY.Add('   0 AS CD_EMPRESA_DESTINO');
    STQRY.Add(',CASE');
     STQRY.Add(' WHEN  SUM(QT_MERCADORIA_ENTRADA) >0 THEN ''S''');
     STQRY.Add(' ELSE ''N''');
     STQRY.Add(' END ID_PEDIDO_FATURADO');

     STQRY.Add('FROM');
     STQRY.Add('');
     STQRY.Add('PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE,');
     STQRY.Add('PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
     STQRY.Add('PRDDM.DC_NFE_ENTRADA NFE,');
     STQRY.Add('PRDDM.DCPCC PED,');
     STQRY.Add('PRDDM.DCPCI ITEMPED');

     STQRY.Add('');
     STQRY.Add('');
     STQRY.Add('WHERE');
     STQRY.Add('          ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
     STQRY.Add('     AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
     STQRY.Add('  AND NROP_P=NROP_Y');
     STQRY.Add('  AND SITY_Y IN(''N'',''P'')');
     STQRY.Add('  AND ((ped.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  ped.CD_OPERACAO_REDE=0)');
     STQRY.Add('  AND PED.CD_EMPRESA_DESTINO=ITEM_NFE.CD_EMPRESA');
     STQRY.Add('  AND NROM_Y=PEDIDO_ITEM_NFE.CD_MERCADORIA');

     STQRY.Add(' AND CD_PEDIDO=NROP_P ');
     STQRY.Add('     AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
     STQRY.Add('     AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
     STQRY.Add('     AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
     STQRY.Add('     AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
     STQRY.Add('     AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
     STQRY.Add('     AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
     STQRY.Add('     AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
     STQRY.Add('     AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
     STQRY.Add('GROUP BY ');
     STQRY.Add('         PEDIDO_ITEM_NFE.CD_MERCADORIA,');
     STQRY.Add('         PEDIDO_ITEM_NFE.CD_EMPRESA) NFE ON NFE.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
     STQRY.Add('                                         AND NFE.CD_EMPRESA=ITEMPEDIDO.cd_pedido_cross');
     STQRY.Add('');



     STQRY.Add('WHERE');
     STQRY.Add('CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
     STQRY.Add('AND id_situacao_mercadoria=''A''');
     STQRY.Add('GROUP BY MERCADORIA.CD_EMPRESA,MERCADORIA.CD_MERCADORIA,  QT_transito,QT_TRANSFERENCIA)');






    stQry.SaveToFile('C:\TEMP\Compra_pendenciaLabatual.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
      open;
    end;
    result := NIL;
    if NOT _cdsTemp.IsEmpty then
    begin
      _cdsTemp.recordCount;
      result := _cdsTemp;
    end;
  finally
    // FreeAndNil(_cdsTemp);
    FreeAndNil(stQry);
  end;
end;

function SetCurvaProduto(nrProduto,cdEmpresa:Integer;idCurva,idInativa:String):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('Update PRDDM.DC_COMPRA_MERCADORIA set ID_CURVA_MERCADORIA=:PidCurva');
    qryTemp.SQL.Add('where CD_MERCADORIA=:PnrProduto');
    qryTemp.SQL.Add('and cd_empresa=:PcdEmpresa');
    qryTemp.ParamByName('PidCurva').AsString:=idCurva;
    qryTemp.ParamByName('PnrProduto').AsBCD:=nrProduto;
    qryTemp.ParamByName('PcdEmpresa').AsBCD:=cdEmpresa;
    if qryTemp.ExecSQL(false)<=0 then
      result := false
    else
      result := true;
    except
      Mensagem('Erro ao Atualizar curva do Produto!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;


{function SetInativacaoFuturaProduto(nrProdut:Integer;PidStatus:String):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('Update PRDDM.DC_MERCADORIA set ID_INATIVACAO_FUTURA=:PidStatus');
    qryTemp.SQL.Add('where CD_MERCADORIA=:PnrProduto');
    qryTemp.ParamByName('PnrProduto').AsBCD:=nrProduto;
    qryTemp.ParamByName('PidStatus').AsString:=PidStatus;
    if qryTemp.ExecSQL(false)<=0 then
      result := false
    else
      result := true;
    except
      Mensagem('Erro ao Atualizar Inativa??o futura!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;}

{function SetInativacaoFuturaProduto(nrProdut:Integer;PidStatus:String):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('Update PRDDM.DC_MERCADORIA set ID_INATIVACAO_FUTURA=:PidStatus');
    qryTemp.SQL.Add('where CD_MERCADORIA=:PnrProduto');
    qryTemp.ParamByName('PnrProduto').AsBCD:=nrProduto;
    qryTemp.ParamByName('PidStatus').AsString:=PidStatus;
    if qryTemp.ExecSQL(false)<=0 then
      result := false
    else
      result := true;
    except
      Mensagem('Erro ao Atualizar Inativa??o futura!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;}


function SetInativacaoFuturaProduto(PnrProduto,PnrCD:Integer;PdtInativacao:Tdate):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('Update PRDDM.DC_COMPRA_MERCADORIA set DT_INATIVACAO_FUTURA=:PdtInativacao');
    qryTemp.SQL.Add('where CD_MERCADORIA=:PnrProduto');
    qryTemp.SQL.Add('and CD_EMPRESA=:PnrEmpresa');
    qryTemp.ParamByName('PdtInativacao').Asdatetime:=PdtInativacao;
    qryTemp.ParamByName('PnrProduto').AsBCD:=PnrProduto;
    qryTemp.ParamByName('PnrEmpresa').AsBcd:=PnrCD;
    result := true;
    if qryTemp.ExecSQL(false)<=0 then
      result := false;
    except
      Mensagem('Erro ao Atualizar Inativa??o futura!!',16);
    end;

 finally
  FreeAndNil(qryTemp);
 end;
end;

function SetBLoqueioProduto(PnrProduto,PnrCD:Integer;PdtInativacao:Tdate):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('Update PRDDM.DC_COMPRA_MERCADORIA set DT_BLOQUEIO_COMPRA=:PdtInativacao');
    qryTemp.SQL.Add('where CD_MERCADORIA=:PnrProduto');
    qryTemp.SQL.Add('and CD_EMPRESA=:PnrEmpresa');
    qryTemp.ParamByName('PdtInativacao').Asdatetime:=PdtInativacao;
    qryTemp.ParamByName('PnrProduto').AsBCD:=PnrProduto;
    qryTemp.ParamByName('PnrEmpresa').AsBcd:=PnrCD;
    result := true;
    if qryTemp.ExecSQL(false)<=0 then
      result := false;
    except
      Mensagem('Erro ao Atualizar Inativa??o futura!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;




function getUltimoDesconto(PnrFornecedor,PnrProduto,PcdEmpresa,PcdOperadorLogistico:Integer):Double;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('SELECT DATP_P,DADY_Y');
    qryTemp.SQL.Add('FROM');
    qryTemp.SQL.Add('(SELECT  Max(DATP_P) DATP_P,DADY_Y');
    qryTemp.SQL.Add('from');
    qryTemp.SQL.Add('PRDDM.DCPCC CAPA,');
    qryTemp.SQL.Add('PRDDM.DCPCI ITEM');
    qryTemp.SQL.Add('where');
    qryTemp.SQL.Add('Nrop_p=Nrop_y');
    qryTemp.SQL.Add('AND sity_y IN(''N'',''P'',''F'')');
    qryTemp.SQL.Add('AND LABP_P=:PnrFornecedor');
    qryTemp.SQL.Add('AND NROM_Y=:PnrProduto');
//    qryTemp.SQL.Add('AND DADY_Y>0');
    qryTemp.SQL.Add('AND NR_OPERADOR_LOGISTICO=:PcdOperador');
    qryTemp.SQL.Add('and CAPA.CD_EMPRESA_DESTINO=:Pcdempresa');
    qryTemp.SQL.Add('AND ITEM.cd_operacao_rede in(0,1)');
    qryTemp.SQL.Add('GROUP BY DADY_Y');
    qryTemp.SQL.Add('ORDER BY DATP_P DESC)');
    qryTemp.SQL.Add('WHERE');
    qryTemp.SQL.Add('ROWNUM=1');

    qryTemp.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
    qryTemp.ParamByName('PnrProduto').AsInteger:=PnrProduto;
    qryTemp.ParamByName('PcdOperador').AsInteger:=PcdOperadorLogistico;
    qryTemp.ParamByName('Pcdempresa').AsInteger:=PcdEmpresa;
    qryTemp.Open;
    result :=0;
    if not qryTemp.IsEmpty then
      result := qryTemp.FieldByName('DADY_Y').AsFloat;
    except
      Mensagem('Erro ao Verificar ultimo desconto!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;


FUNCTION GetListaTipoProduto(PnrClassificaoEstrutura:Integer): TClientDataSet;
var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
  _cdsTemp: TClientDataSet;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with QryTemp do
    begin
      SQL.Add('SELECT distinct DS_ESTRUTURA as CD_ESTRUTURA,');
      SQL.Add('DS_DESCRICAO_ESTRUTURA DS_ESTRUTURA,''N'' AS ID_SELECIONADO,');
      SQL.Add('CASE');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''01'' THEN ''M''');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''02'' THEN ''P''');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''03'' THEN ''A''');
      SQL.Add('END ID_TIPO');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO');
      SQL.Add('WHERE LENGTH(DS_ESTRUTURA)=:PnrEstrutura');
      SQL.Add('ORDER BY SUBSTR(CD_ESTRUTURA,1,2), DS_DESCRICAO_ESTRUTURA');
      if PnrClassificaoEstrutura > 0 then
        ParamByName('PnrEstrutura').AsInteger := PnrClassificaoEstrutura;
    end;
    with _cdsTemp do
    begin
      Close;
      CommandText := QryTemp.Text;
      if PnrClassificaoEstrutura>0 then
         Params.ParamByName('PnrEstrutura').AsInteger := PnrClassificaoEstrutura;
      open;
    end;
    RESULT := nil;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.RecordCount;
      RESULT := _cdsTemp;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;


FUNCTION GetListaSubTipoProduto(PnrClassificaoEstrutura:Integer;stSubTipo:String): TClientDataSet;
var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
  _cdsTemp: TClientDataSet;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with QryTemp do
    begin
      SQL.Add('SELECT distinct DS_ESTRUTURA as CD_ESTRUTURA,');
      SQL.Add('DS_DESCRICAO_ESTRUTURA DS_ESTRUTURA,''N'' AS ID_SELECIONADO,');
      SQL.Add('CASE');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''01'' THEN ''M''');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''02'' THEN ''P''');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''03'' THEN ''A''');
      SQL.Add('END ID_TIPO');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO');
      SQL.Add('WHERE LENGTH(DS_ESTRUTURA)=:PnrEstrutura');
      SQL.Add('AND SUBSTR(DS_ESTRUTURA,1,2) in('+stSubTipo+')');
      SQL.Add('ORDER BY SUBSTR(CD_ESTRUTURA,1,2), DS_ESTRUTURA');
      if PnrClassificaoEstrutura > 0 then
        ParamByName('PnrEstrutura').AsInteger := PnrClassificaoEstrutura;
    end;
    with _cdsTemp do
    begin
      Close;
      CommandText := QryTemp.Text;
      if PnrClassificaoEstrutura>0 then
         Params.ParamByName('PnrEstrutura').AsInteger := PnrClassificaoEstrutura;
      open;
    end;
    RESULT := nil;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.RecordCount;
      RESULT := _cdsTemp;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;
FUNCTION GetListaCategoria(PnrClassificaoEstrutura:Integer;stCategoria:String): TClientDataSet;
var
  vlPrecoFornecedorAnterior: Double;
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with QryTemp do
    begin
      SQL.Add('SELECT distinct DS_ESTRUTURA as CD_ESTRUTURA,');
      SQL.Add('DS_DESCRICAO_ESTRUTURA DS_ESTRUTURA,''N'' AS ID_SELECIONADO,');
      SQL.Add('CASE');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''01'' THEN ''M''');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''02'' THEN ''P''');
      SQL.Add('WHEN SUBSTR(DS_ESTRUTURA,1,2)=''03'' THEN ''A''');
      SQL.Add('END ID_TIPO');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO');
      SQL.Add('WHERE LENGTH(DS_ESTRUTURA)=:PnrEstrutura');
      SQL.Add('AND SUBSTR(DS_ESTRUTURA,1,4) in('+stCategoria+')');
      SQL.Add('ORDER BY SUBSTR(CD_ESTRUTURA,1,4), DS_ESTRUTURA');
      if PnrClassificaoEstrutura > 0 then
        ParamByName('PnrEstrutura').AsInteger := PnrClassificaoEstrutura;
    end;
    with _cdsTemp do
    begin
      Close;
      CommandText := QryTemp.Text;
      if PnrClassificaoEstrutura>0 then
         Params.ParamByName('PnrEstrutura').AsInteger := PnrClassificaoEstrutura;
      open;
    end;
    RESULT := nil;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.RecordCount;
      RESULT := _cdsTemp;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

FUNCTION GetProdutoPorClassificacao(PnrProduto,
                                    PnrFornecedor,
                                    PnrComprador,
                                    PnrCD:Integer;
                                    stFiltroTipo,
                                    stFiltroSubTipo,
                                    StFiltroCategoria:String):TClientDataSet;
var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
  _cdsTemp: TClientDataSet;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with QryTemp do
    begin
      SQL.Add('Select NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('COMPRA.CD_GRUPO_FORNECEDOR NR_LABORATORIO,');
      SQL.Add('DS_GRUPO_FORNECEDOR NOME_FORNECEDOR,');
      SQL.Add('CASE');
      SQL.Add('WHEN COMPRA.CD_EMPRESA=1 THEN ''SC''');
      SQL.Add('WHEN COMPRA.CD_EMPRESA=4 THEN ''RS''');
      SQL.Add('END ID_CD,');
      SQL.Add('MERCADORIA.CD_MERCADORIA*10+MERCADORIA.NR_DV_MERCADORIA CODIGO,');
      SQL.Add('NM_MERCADORIA NOME ,');
      SQL.Add('DS_APRESENTACAO_MERCADORIA APRESENTACAO,');
      SQL.Add('DS_MERCADORIA,');
      SQL.Add('QT_FISICO - (QT_RESERVADO + QT_RESERVA_PROBLEMATICA');
      SQL.Add('+QT_VENCIDO+QT_BLOQUEADO) ESTOQUE ,');
      SQL.Add('QT_RESERVA_PROBLEMATICA BLOQUEADOS,');
      SQL.Add('QT_VENCIDO VENCIDOS,');
      SQL.Add('VL_PRECO_COMPRA PRECO_FABRICA,');
      SQL.Add('QT_FISICO * VL_PRECO_COMPRA VL_ESTOQUE,');
      SQL.Add('QT_RESERVA_PROBLEMATICA * VL_PRECO_COMPRA VL_ESTOQUE_PROBLEMATICO,');
      SQL.Add('QT_VENCIDO * VL_PRECO_COMPRA VL_ESTOQUE_VENCIDO,');
      SQL.Add('T.CLASSE AS CATEGORIA ,');
      SQL.Add('CASE');
      SQL.Add('WHEN DS_NIVEL_ECNM=2 THEN R.CATEGORIA');
      SQL.Add('WHEN DS_NIVEL_ECNM=1 THEN S.DESC_CLASSE');
      SQL.Add('END CLASSIFICACAO,');
      SQL.Add('CASE');
      SQL.Add('WHEN DS_NIVEL_ECNM=2 AND L.TIPO_PRECO=''SEM NIVEL'' THEN ''PERFUMARIA''');
      SQL.Add('WHEN DS_NIVEL_ECNM=1 AND L.TIPO_PRECO=''SEM NIVEL'' THEN ''NAO CLASSIFICADO''');
      SQL.Add('ELSE L.TIPO_PRECO');
      SQL.Add('END SUB_CLASSIFICACAO,');
      SQL.Add('ID_VENDA_MERCADO,');
      SQL.Add('ROUND(VL_CUSTO_GERENCIAL,2) AS VL_CUSTO_GERENCIAL,');
      SQL.Add('VL_PRECO_COMPRA,');
      SQL.Add('VL_PRECO_VENDA,');
      SQL.Add('CASE');
      SQL.Add('WHEN DS_NIVEL_ECNM=2 THEN ''P''');
      SQL.Add('WHEN DS_NIVEL_ECNM=1 THEN ''M''');
      SQL.Add('WHEN DS_NIVEL_ECNM>2 THEN ''O''');
      SQL.Add('END ID_TIPO');
//      SQL.Add('
//      SQL.Add('    --,DS_NIVEL_EMAM,
  //    SQL.Add('    --DS_NIVEL_ERGM,
//      SQL.Add('   -- DS_NIVEL_EPRM,
//      SQL.Add('   -- DS_NIVEL_ERTM,
 //     SQL.Add('   -- DS_NIVEL_ECTM,
 //     SQL.Add('   -- DS_NIVEL_EITM
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
      SQL.Add('PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,');
      SQL.Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
      SQL.Add('PRDDM.DCPES PESSOA,');
      SQL.Add('PRDDM.DC_FABRICANTE FABRICANTE,');
      SQL.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO,');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR,');
      SQL.Add('(SELECT NR_SEQUENCIAL,  DS_DESCRICAO_ESTRUTURA CLASSE');
      SQL.Add('FROM   PRDDM.DC_CLASSIFICACAO_PRODUTO');
      SQL.Add('WHERE DS_DESCRICAO_ESTRUTURA>'' '') T,');
      SQL.Add('(SELECT NR_SEQUENCIAL,  DS_DESCRICAO_ESTRUTURA CATEGORIA');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO WHERE DS_DESCRICAO_ESTRUTURA>''  '') R,');
      SQL.Add('(SELECT NR_SEQUENCIAL, DS_DESCRICAO_ESTRUTURA TIPO_PRECO');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO) L,');
      SQL.Add('(SELECT NR_SEQUENCIAL,DS_DESCRICAO_ESTRUTURA TIPO_RESTRICAO');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO) F,');
      SQL.Add('(SELECT NR_SEQUENCIAL, DS_DESCRICAO_ESTRUTURA  DESC_CLASSE');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO) S,');
      SQL.Add('(SELECT NR_SEQUENCIAL, DS_DESCRICAO_ESTRUTURA TIPO_CONTROLE');
      SQL.Add('FROM PRDDM.DC_CLASSIFICACAO_PRODUTO) P');
      SQL.Add('WHERE');
      SQL.Add('FABRICANTE.CD_FABRICANTE = GRUPO.CD_FABRICANTE');
      SQL.Add('AND MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=GRUPO.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      SQL.Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      SQL.Add('AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
      SQL.Add('AND COMPRA.CD_EMPRESA=:PnrCD');
      SQL.Add('AND CGCP_P=NR_CNPJ');
      SQL.Add('AND COMPRA.CD_COMPRADOR=NR_COMPRADOR');
      SQL.Add('AND COMPRA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
      SQL.Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
      SQL.Add('AND DS_NIVEL_EMAM=T.NR_SEQUENCIAL');
      SQL.Add('AND DS_NIVEL_ERGM=R.NR_SEQUENCIAL');
      SQL.Add('AND DS_NIVEL_EPRM=L.NR_SEQUENCIAL');
      SQL.Add('AND DS_NIVEL_ERTM=F.NR_SEQUENCIAL');
      SQL.Add('AND DS_NIVEL_ECTM=P.NR_SEQUENCIAL');
      SQL.Add('AND DS_NIVEL_EITM=S.NR_SEQUENCIAL');
      if stFiltroTipo<>'' then
       SQL.Add('AND DS_NIVEL_ECNM in('+stFiltroTipo+')');
      if (stFiltroSubTipo<>'') and (StFiltroCategoria='') then
      begin
       SQL.Add('AND DS_NIVEL_ERGM IN(select NR_SEQUENCIAL');
       SQL.Add('from PRDDM.dc_classificacao_produto');
       SQL.Add('where length(DS_ESTRUTURA)=4');
       SQL.Add('AND SUBSTR(DS_ESTRUTURA,1,4) IN('+stFiltroSubTipo+'))');
      end;
      if StFiltroCategoria<>'' then
      begin
       SQL.Add('AND DS_NIVEL_ERGM IN(select NR_SEQUENCIAL');
       SQL.Add('from PRDDM.dc_classificacao_produto');
       SQL.Add('where length(DS_ESTRUTURA)=6');
       SQL.Add('AND SUBSTR(DS_ESTRUTURA,1,6) IN('+StFiltroCategoria+'))');
      end;

      SQL.Add('AND NR_COMPRADOR=CD_COMPRADOR');
//      SQL.Add('AND DT_ULTIMA_ENTRADA<''01/01/2039''');
      if PnrFornecedor=0 then
         SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR<>98');
      if PnrFornecedor>0 then
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
      SQL.Add('AND NR_COMPRADOR=:PnrComprador');
//      SQL.Add('AND DS_NIVEL_ECNM=:PTipoProduto');
//      SQL.Add('AND DS_NIVEL_ERGM=4212');
    end;
    with _cdsTemp do
    begin
      Close;
      CommandText := QryTemp.Text;
       Params.ParamByName('PnrCD').AsInteger := PnrCD;

      if PnrFornecedor>0 then
         Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      if PnrComprador>0 then
         Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
      open;
    end;
    RESULT := nil;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.RecordCount;
      RESULT := _cdsTemp;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function GetListaSaldoVerba(PnrVerba,PnrFornecedor,PnrComprador: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
  stQry:TStringList;
begin
  try
    stQry:=TStringList.Create;
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT');
      SQL.Add('CD_GRUPO_FORNECEDOR AS NR_LABORATORIO,');
      SQL.Add('DS_GRUPO_FORNECEDOR AS NM_FANTASIA,');
      SQL.Add('NR_VERBA,');
  //    SQL.Add('NVL(SUM(CREDITO),0) AS CREDITO , NVL(SUM(DEBITO),0) AS DEBITO,');
//      SQL.Add('NVL(SUM(CREDITO),0) - NVL(SUM(DEBITO),0) AS SALDO_PERIODO,');
      SQL.Add('SALDO,');
      SQL.Add('NR_COMPRADOR, NM_COMPRADOR');
      SQL.Add('FROM');
    //  SQL.Add('-- SALDO DO PERIODO');
      SQL.Add('(SELECT');
      SQL.Add('NR_VERBA,');
      SQL.Add('DECODE(ID_LANCAMENTO,''DEBITO'', SUM(VL_LC_VERBA))');
      SQL.Add('DEBITO,DECODE(ID_LANCAMENTO,''CREDITO'', SUM(VL_LC_VERBA)) CREDITO');
      SQL.Add('FROM');
      SQL.Add('(SELECT');
      SQL.Add('NROV_I NR_VERBA,');
      SQL.Add('SUM(VLRI_I) VL_LC_VERBA ,');
      SQL.Add('DECODE(TIPI_I,''E'',''CREDITO'',''C'',''CREDITO'',''T'',');
      SQL.Add('''DEBITO'',''F'',''DEBITO'',''P'',''DEBITO'') ID_LANCAMENTO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCIVE');
      SQL.Add('WHERE');
      SQL.Add('NROV_I>=1');
      SQL.Add('AND TIPI_I IN(''P'',''T'',''F'',''C'',''E'')');
      SQL.Add('AND DTAI_I BETWEEN ''01/10/2009'' AND TRUNC(SYSDATE)');
      SQL.Add('GROUP BY NROV_I,TIPI_I)');
      SQL.Add('GROUP BY NR_VERBA,ID_LANCAMENTO),');
      SQL.Add('PRDDM.DCVEB,');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM,');
      SQL.Add('(SELECT DISTINCT GF.CD_GRUPO_FORNECEDOR,');
      SQL.Add('DS_GRUPO_FORNECEDOR,CD_COMPRADOR FROM');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      SQL.Add('WHERE');
      SQL.Add('GF.CD_GRUPO_FORNECEDOR=CM.CD_GRUPO_FORNECEDOR) FORNECEDOR,');
      SQL.Add('(SELECT');
      SQL.Add('NR_VERBA AS NR_VERBA_SALDO,');
      SQL.Add('NVL(SUM(CREDITO),0) - NVL(SUM(DEBITO),0)  AS  SALDO');
      SQL.Add('FROM');
  //    SQL.Add('-- SALDO DA CAPA NOTA');
      SQL.Add('(SELECT');
      SQL.Add('NROV_I NR_VERBA,SUM(VLRI_I) VL_LC_VERBA ,');
      SQL.Add('CASE');
      SQL.Add('WHEN (TIPI_I=''E'') OR (TIPI_I=''C'') THEN  SUM(VLRI_I)');
      SQL.Add('END AS CREDITO,');
      SQL.Add('CASE');
      SQL.Add('WHEN (TIPI_I=''T'') OR (TIPI_I=''F'') OR (TIPI_I=''P'') THEN SUM(VLRI_I)');
      SQL.Add('END AS  DEBITO');
      SQL.Add('FROM PRDDM.DCIVE');
      SQL.Add('WHERE');
      SQL.Add('NROV_I>=1');
      SQL.Add('AND TIPI_I IN(''P'',''T'',''F'',''C'',''E'')');
//      SQL.Add('    -- N?O MEXER NESTA DATA');
      SQL.Add('AND DTAI_I BETWEEN ''01/10/0001'' AND TRUNC(SYSDATE)');
      SQL.Add(' GROUP BY NROV_I,TIPI_I)');
      SQL.Add('GROUP BY NR_VERBA)');
      SQL.Add('WHERE');
      SQL.Add('FORNECEDOR.CD_GRUPO_FORNECEDOR=LABV_V');
      SQL.Add('AND NR_VERBA=NROV_V');
      SQL.Add('AND NR_VERBA_SALDO=NROV_V');
      SQL.Add('AND NR_COMPRADOR=CD_COMPRADOR');
      SQL.Add('AND LABV_V NOT IN(1,2)');
      SQL.Add('AND STAV_V not in(''N'',''I'')');
      SQL.Add('AND CD_GRUPO_FORNECEDOR NOT IN(287,367,427)');
      if PnrFornecedor>0 then
         SQL.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
         SQL.Add('AND NR_COMPRADOR=:PnrComprador');
      if PnrVerba>0 then
         SQL.Add('AND NR_VERBA=:PnrVerba');
      SQL.Add('GROUP BY');
      SQL.Add('CD_GRUPO_FORNECEDOR,');
      SQL.Add('DS_GRUPO_FORNECEDOR,');
      SQL.Add('NR_VERBA,');
      SQL.Add('SDOV_V,');
      SQL.Add('SALDO,');
      SQL.Add('NR_COMPRADOR, NM_COMPRADOR');
   {  if PnrFornecedor>0 then
         ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
     if PnrComprador>0 then
         ParamByName('PnrComprador').AsInteger := PnrComprador;
     if PnrVerba>0 then
         ParamByName('PnrVerba').AsInteger := PnrVerba;}
    end;
    stQry.Add(QryTemp.Text);

    stQry.SaveToFile('C:\TEMP\qryListagemVerba.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
     if PnrFornecedor>0 then
         params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
     if PnrComprador>0 then
         params.ParamByName('PnrComprador').AsInteger := PnrComprador;
     if PnrVerba>0 then
         params.ParamByName('PnrVerba').AsInteger := PnrVerba;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function GetInativadosCadastrados(PdtInicial,PdtFinal:TDate;nrCD,PnrComprador: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
  stQry :TStringList;
begin
   try
    stQry:=TStringList.Create;
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT  COMPRADOR.NR_COMPRADOR,COMPRADOR.NM_COMPRADOR_REDUZIDO,');
      SQL.Add('NVL(NR_ITENS_INATIVADOS,0) AS NR_ITENS_INATIVADOS ,');
      SQL.Add('NVL(NR_CADASTROS_NOVOS,0) AS NR_CADASTROS_NOVOS,');
      SQL.Add('NR_ITENS_CPRA,');
      SQL.Add('NR_UNID_COMPRADA,');
      SQL.Add('VT_PCO_FORNECEDOR,');
      SQL.Add('VT_PCO_CUSTO,');
      SQL.Add('NR_UNID_PENDENTES');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('LEFT OUTER JOIN (SELECT');
      SQL.Add('NR_COMPRADOR,');
      SQL.Add('NM_COMPRADOR_REDUZIDO,COUNT(*) NR_ITENS_INATIVADOS');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO,');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=GRUPO.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND COMPRA.CD_COMPRADOR=NR_COMPRADOR');
      SQL.Add('AND NR_COMPRADOR=CD_COMPRADOR');
      SQL.Add('AND MERCADORIA.DT_INATIVACAO BETWEEN :PdtInicial AND :PdtFinal');
      SQL.Add('AND COMPRA.CD_GRUPO_FORNECEDOR<>98');
      SQL.Add('GROUP BY  NR_COMPRADOR,');
      SQL.Add('NM_COMPRADOR_REDUZIDO) TB_INATIVOS ON');
      SQL.Add('TB_INATIVOS.NR_COMPRADOR=COMPRADOR.NR_COMPRADOR');
      SQL.Add('LEFT OUTER JOIN (SELECT');
      SQL.Add('NR_COMPRADOR,');
      SQL.Add('NM_COMPRADOR_REDUZIDO,COUNT(*) NR_CADASTROS_NOVOS');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO,');
      SQL.Add('PRDDM.DC_FISCAL_MERCADORIA FM,');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('M.CD_MERCADORIA=CM.CD_MERCADORIA');
      SQL.Add('AND M.CD_MERCADORIA=FM.CD_MERCADORIA');
      SQL.Add('AND CM.CD_GRUPO_FORNECEDOR=GRUPO.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND CM.CD_EMPRESA=FM.CD_EMPRESA');
      SQL.Add('AND CM.CD_COMPRADOR=NR_COMPRADOR');
      SQL.Add('AND NR_COMPRADOR=CD_COMPRADOR');
      SQL.Add('AND DT_CADASTRO_MERCADORIA BETWEEN :PdtInicial AND :PdtFinal');
      SQL.Add('AND CM.CD_GRUPO_FORNECEDOR<>98');
      SQL.Add('GROUP BY');
      SQL.Add('NR_COMPRADOR,NM_COMPRADOR_REDUZIDO) TB_NOVOS ON');
      sql.Add('COMPRADOR.NR_COMPRADOR=TB_NOVOS.NR_COMPRADOR');
      SQL.Add('LEFT OUTER JOIN (SELECT');
      SQL.Add('CD_COMPRADOR,SUM(NR_ITENS_CPRA) NR_ITENS_CPRA ,');
      SQL.Add('SUM(NR_UNID_COMPRADA) AS NR_UNID_COMPRADA,');
      SQL.Add('SUM(VT_PCO_FORNECEDOR) AS VT_PCO_FORNECEDOR,');
      SQL.Add('SUM(VT_PCO_CUSTO) AS VT_PCO_CUSTO,');
      SQL.Add('SUM(NR_UNID_PENDENTES) AS NR_UNID_PENDENTES');
      SQL.Add('FROM');
      SQL.Add('(SELECT');
      SQL.Add('CD_GRUPO_FORNECEDOR NR_FORNCEDOR,DS_GRUPO_FORNECEDOR');
      SQL.Add(' AS NM_FORNCEDOR,COUNT(*) NR_ITENS_CPRA,');
      SQL.Add('SUM(QUAY_Y) NR_UNID_COMPRADA,');
      SQL.Add('SUM(QUAY_Y*PFBY_Y) AS VT_PCO_FORNECEDOR,');
      SQL.Add('SUM(QUAY_Y*PUNY_Y) AS VT_PCO_CUSTO,');
      SQL.Add('SUM(QUAY_Y-CHEY_Y) AS NR_UNID_PENDENTES');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCPCC CAPA,');
      SQL.Add('PRDDM.DCPCI ITEM,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GF');
      SQL.Add('WHERE');
      SQL.Add('NROP_P = NROP_Y');
      SQL.Add('AND LABP_P = GF.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND SITP_P IN(''N'',''P'',''F'',''T'')');
      SQL.Add('AND SITY_Y IN(''N'',''P'',''F'',''T'')');
      SQL.Add('AND ITEM.cd_operacao_rede in(0,1)');
      SQL.Add('AND DATP_P BETWEEN :PdtInicial AND :PdtFinal');
      SQL.Add('GROUP BY CD_GRUPO_FORNECEDOR,DS_GRUPO_FORNECEDOR) TB_COMPRA');
      SQL.Add('LEFT OUTER JOIN (SELECT DISTINCT CD_COMPRADOR,CD_GRUPO_FORNECEDOR');
      SQL.Add('FROM PRDDM.DC_COMPRA_MERCADORIA) TB_COMPRADOR');
      SQL.Add('ON TB_COMPRADOR.CD_GRUPO_FORNECEDOR= TB_COMPRA.NR_FORNCEDOR');
      SQL.Add('GROUP BY CD_COMPRADOR)');
      SQL.Add('TB_SOMA ON TB_SOMA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('COMPRADOR.NR_COMPRADOR NOT IN (21,20,5,0)');
    end;
    stQry.Add(QryTemp.Text);
    stQry.SaveToFile('C:\Temp\qryCadastadoInativadosCompardor.qry');
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      params.ParamByName('PdtInicial').AsDateTime := PdtInicial;
      params.ParamByName('PdtFinal').AsDateTime   := PdtFinal;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function GetProdutosComparacao(PnrCD,PnrFornecedor: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT  DISTINCT  ''A'' as id_ANO,');
      SQL.Add('M.cd_mercadoria*10+nr_dv_mercadoria AS Codigo, nm_mercadoria,');
      SQL.Add('ds_apresentacao_mercadoria,ds_unidade_medida,''  '' ID_CD ,0 MES_01,0 MES_02,0');
      SQL.Add('MES_03,0 MES_04,0 MES_05,0 MES_06,0 MES_07,0 MES_08,0 MES_09,');
      SQL.Add('0 MES_10,0 MES_11,0 MES_12,0 MES_ATUAL,0 ID_REG');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      SQL.Add('WHERE');
      SQL.Add('M.CD_MERCADORIA=CM.CD_MERCADORIA');
      SQL.Add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      SQL.Add('AND cd_grupo_fornecedor=:PnrFornecedor');
      // and CM.CD_empresa=:PnrCD');
      SQL.Add('UNION ALL');
      SQL.Add('SELECT DISTINCT  ''B'' as id_ANO,');
      SQL.Add('M.cd_mercadoria*10+nr_dv_mercadoria AS Codigo, nm_mercadoria,');
      SQL.Add('''  '',ds_unidade_medida,''  '' ID_CD,0 MES_01,0 MES_02,0');
      SQL.Add('MES_03,0 MES_04,0 MES_05,0 MES_06,0 MES_07,0 MES_08,0 MES_09,');
      SQL.Add('0 MES_10,0 MES_11,0 MES_12,0 MES_ATUAL,0 ID_REG');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      SQL.Add('WHERE');
      SQL.Add('M.CD_MERCADORIA=CM.CD_MERCADORIA');
      SQL.Add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      SQL.Add('AND cd_grupo_fornecedor=:PnrFornecedor');
      // and CM.cd_empresa=:PnrCD');
      SQL.Add('ORDER BY nm_mercadoria,Codigo,id_ano');

    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
     /// params.ParamByName('PnrCD').AsInteger := PnrCD;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function GetVendaProdutosComparacao(PnrCD,PnrFornecedor: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
 {     SQL.Add('SELECT CODIGO');
      if PnrCD>0 then
       SQL.Add(',CD_EMPRESA');
      SQL.Add(',DATW_W , MES,');
      SQL.Add('SUM(QUAW_W) AS QT_VENDIDA');
      SQL.Add('FROM');
      SQL.Add('((SELECT');
      SQL.Add('M.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CODIGO');
      if PnrCD>0 then
       SQL.Add(',CM.CD_EMPRESA');
      SQL.Add(',DATW_W,');
      SQL.Add('EXTRACT(MONTH  FROM DATW_W) MES,');
      SQL.Add('EXTRACT(YEAR  FROM DATW_W) ANO, QUAW_W ,');
      SQL.Add('TO_CHAR(DATW_W,''MON'') NM_MES');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA M');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA CM');
      sql.Add('ON CM.CD_MERCADORIA=M.CD_MERCADORIA AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      SQL.Add('LEFT OUTER JOIN PRDDM.DCWEN VM ON VM.NROM_W=CM.CD_MERCADORIA AND');
      SQL.Add('CM.CD_EMPRESA=VM.CD_EMPRESA');
      if PnrCD>0 then
      SQL.Add('AND CM.CD_EMPRESA=:PnrCD');
      SQL.Add('AND DATW_W BETWEEN ADD_MONTHS(SYSDATE,-24)');
      SQL.Add('AND LAST_DAY(ADD_MONTHS(SYSDATE,0))');
      SQL.Add('WHERE');
      SQL.Add('M.CD_MERCADORIA=VM.NROM_W)');
      SQL.Add('UNION ALL');
      SQL.Add('(SELECT');
      SQL.Add('M.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CODIGO');
      if PnrCD>0 then
       SQL.Add(',CM.CD_EMPRESA');
      SQL.Add(',DATW_W,');
      SQL.Add('EXTRACT(MONTH  FROM DATW_W) MES,');
      SQL.Add('EXTRACT(YEAR  FROM DATW_W) ANO, QUAW_W ,');
      SQL.Add('TO_CHAR(DATW_W,''MON'') NM_MES');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA M');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA CM ');
      SQL.Add('ON CM.CD_MERCADORIA=M.CD_MERCADORIA AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor ');
      SQL.Add('LEFT OUTER JOIN PRDDM.DCWEM VM ON VM.NROM_W=M.CD_MERCADORIA');
      SQL.Add('AND CM.CD_EMPRESA=VM.CD_EMPRESA ');
      if PnrCD>0 then
      SQL.Add('AND CM.CD_EMPRESA=:PnrCD');
      SQL.Add('AND DATW_W BETWEEN ADD_MONTHS(SYSDATE,-24)');
      SQL.Add('AND LAST_DAY(ADD_MONTHS(SYSDATE,0))');
      SQL.Add('WHERE');
      SQL.Add('M.CD_MERCADORIA=VM.NROM_W))');
      SQL.Add('GROUP BY CODIGO');
      if PnrCD>0 then
       SQL.Add(',CD_EMPRESA');
      SQL.Add(',DATW_W , MES');}

      SQL.Add('SELECT M.CD_MERCADORIA*10+NR_DV_MERCADORIA as CODIGO,NM_MERCADORIA,');
      if PnrCD>0 then
      begin
       SQL.Add('case');
       SQL.Add('WHEN VENDA.CD_EMPRESA=1 THEN ''SC''');
       SQL.Add('WHEN VENDA.CD_EMPRESA=4 THEN ''RS''');
       SQL.Add('END id_cd,');
      end;
      SQL.Add('DATW_W,');
      SQL.Add('EXTRACT(MONTH  FROM DATW_W) MES,');
      SQL.Add('EXTRACT(YEAR  FROM DATW_W) ANO,');
      SQL.Add('Sum(QUAW_W) as QT_VENDIDA ,');
      SQL.Add('TO_CHAR(DATW_W,''MON'') NM_MES');
      SQL.Add('FROM  PRDDM.DCWEN VENDA,');
      SQL.Add('PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      SQL.Add('WHERE');
      SQL.Add('NROM_W=M.CD_MERCADORIA');
      SQL.Add('AND M.CD_MERCADORIA=CM.CD_MERCADORIA');
      SQL.Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
      SQL.Add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      SQL.Add('AND DATW_W BETWEEN Last_Day(ADD_MONTHS(SYSDATE,-25))   AND LAST_DAY(ADD_MONTHS(SYSDATE,0))');
      SQL.Add('AND CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      if PnrCD>0 then
         SQL.Add('AND CM.CD_EMPRESA=:PnrCD');
      SQL.Add('AND CD_GRUPO_FORNECEDOR =:PnrFornecedor');
      SQL.Add('GROUP BY M.CD_MERCADORIA*10+NR_DV_MERCADORIA,NM_MERCADORIA,');
      if PnrCD>0 then
      SQL.Add('VENDA.CD_EMPRESA,');
      SQL.Add('DATW_W,');
      SQL.Add('EXTRACT(MONTH  FROM DATW_W),');
      SQL.Add('EXTRACT(YEAR  FROM DATW_W),');
      SQL.Add('TO_CHAR(DATW_W,''MON'')');
      SQL.Add('ORDER BY  M.CD_MERCADORIA*10+NR_DV_MERCADORIA,DATW_W');

      if PnrCD>0 then
  //       SQL.Add('AND cd_grupo_fornecedor=:PnrFornecedor');


    //  SQL.Add('ORDER BY nm_mercadoria,Codigo,ano');

    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      if PnrCD>0 then
         params.ParamByName('PnrCD').AsInteger := PnrCD;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function GetCriticaDivergenciaQuantidade(PnrComprador: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
              try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NOMP_P FORNECEDOR, CD_LABORATORIO LAB,A.SQ_ORDEM CRITICA,');
      SQL.Add('NR_NOTA_FISCAL NFISCAL,NR_PEDIDO_GAM PEDIDO,');
      SQL.Add('DT_CRITICA DATA_CRITICA, DT_LIBERACAO DATA_LIBERACAO,');
      SQL.Add('NR_ITEM_ORDEM ITEM,DS_OBSERVACAO_SISTEMA MOTIVO_PENDENCIA,');
      SQL.Add('DS_COMPRA_SOLUCAO_DIVERGENCIA SOLUCAO');
      SQL.Add('FROM PRDDM.DC_COMPRA_CRITICA_ENTRADA A,');
      SQL.Add('PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA B,');
      SQL.Add('PRDDM.DC_COMPRA_DIVERGENCIA C,');
      SQL.Add('PRDDM.DC_COMPRA_SOLUCAO_DIVERGENCIA D,');
      SQL.Add('PRDDM.DCFOR,');
      SQL.Add('PRDDM.DCPES');
      SQL.Add('WHERE A.SQ_ORDEM = B.SQ_ORDEM');
      SQL.Add('AND B.CD_COMPRA_DIVERGENCIA = C.CD_COMPRA_DIVERGENCIA');
      SQL.Add('AND ID_SITUACAO_CRITICA <> 5');
      SQL.Add('AND CD_FORNECEDOR = NROF_F');
      SQL.Add('AND CGCP_P = CGCP_F');
      SQL.Add('AND B.CD_COMPRA_DIVERGENCIA = 8');
      SQL.Add('AND D.CD_COMPRA_DIVERGENCIA = 8');
      SQL.Add('AND B.CD_COMPRA_SOLUCAO_DIVERGENCIA = D.CD_COMPRA_SOLUCAO_DIVERGENCIA');
      SQL.Add('AND CD_COMPRADOR = :PnrComprador');
      SQL.Add('ORDER BY NOMP_P,NR_NOTA_FISCAL,NR_ITEM_ORDEM');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      params.ParamByName('PnrComprador').AsInteger := PnrComprador;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;
function GetUltimosPrecos(PnrProduto,PnrCD:Integer;PdtInicial,PdtFinal:Tdate):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
 try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenericaSihst;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenericaSihst';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT  MIN(ROUND(VFTI_I/QUAI_I,2)) VL_PRECO,');
      SQL.Add('SUBSTR(DENN_YI,4,2) MES,MAX(DENN_YI) DT_FATURAMENTO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.V_DCIOS12');
      SQL.Add('WHERE');
      SQL.Add('TIPN_I=''C''');
      SQL.Add('AND CD_EMPRESA=:PnrCD');
      SQL.Add('AND NROM_I=:PnrProduto');
      SQL.Add('AND DENN_YI BETWEEN :PdtInicial AND :PdtFinal');
      SQL.Add('GROUP BY SUBSTR(DENN_YI,4,2)');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      params.ParamByName('PnrCD').AsInteger := PnrCD;
      params.ParamByName('PnrProduto').AsInteger := PnrProduto;
      params.ParamByName('PdtInicial').AsDateTime  := PdtInicial;
      params.ParamByName('PdtFinal').AsDateTime    := PdtFinal;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function AbreParamentoCompraLaboratorio(nrGrupo: Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try

    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenericaSihst;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT  MIN(ROUND(VFTI_I/QUAI_I,2)) VL_PRECO,');
      SQL.Add('SELECT  ');
      SQL.Add('CD_GRUPO_CURVA_FABRICANTE, ID_CURVA_MERCADORIA,');
      SQL.Add('QT_DIAS_FREQUENCIA_COMPRA, QT_ESTOQUE_MAXIMO,QT_ESTOQUE_MINIMO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA ');
      SQL.Add('WHERE');
      SQL.Add('CD_GRUPO_CURVA_FABRICANTE= :PnrGrupo');
      open;
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      params.ParamByName('PnrGrupo').AsInteger := nrGrupo;
      open;
    end;
    Result :=nil;
    if not _cdsTemp.IsEmpty then
      Result :=_cdsTemp;
  finally
    FreeAndNil(QryTemp);
  end;
end;


Function DadosVendaMes(PnrFornecedor,PnrProduto,PcdCDFisico: Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT');
      Add('DT_VENDA_MERCADORIA,');
      Add('COMPRA.CD_MERCADORIA,');
      Add('VENDA.CD_EMPRESA,');
      Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
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
      Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('WHERE');
      Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('AND VENDA.CD_EMPRESA=:Pnrcd');
      Add('AND VENDA.CD_EMPRESA=:Pnrcd');
      Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
      Add('AND VENDA.CD_MERCADORIA=:PnrProduto');
      Add('GROUP BY DT_VENDA_MERCADORIA,COMPRA.CD_MERCADORIA,VENDA.CD_EMPRESA');
      Add('ORDER BY DT_VENDA_MERCADORIA');

      stQry.SaveToFile('QryVendaConsultaProduto.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
          Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
        Params.ParamByName('Pnrcd').AsInteger := PcdCDFisico;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


Function DadosEntradaUltimosMeses(PnrFornecedor,PnrProduto,PcdCDFisico: Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT SUM(QUAY_Y) as QT_ENTRADA,CD_EMPRESA, MES, ANO');
      Add('FROM');
      Add('(SELECT');
      Add('QUAY_Y,CAPA.CD_EMPRESA,');
      Add('CASE');
      Add('WHEN EXTRACT(YEAR  FROM DATO_O) = EXTRACT(YEAR  FROM sysdate)');
      Add('AND EXTRACT(MONTH  FROM DATO_O)= EXTRACT(MONTH  FROM sysdate) then 13');
      Add('WHEN EXTRACT(YEAR  FROM DATO_O) <> EXTRACT(YEAR  FROM sysdate)');
      Add('OR  EXTRACT(MONTH  FROM DATO_O)<>EXTRACT(MONTH  FROM sysdate)');
      Add('THEN EXTRACT(MONTH  FROM DATO_O)');
      Add('END MES,');
      Add('EXTRACT(YEAR  FROM DATO_O) ANO');
      Add('FROM');
      Add('PRDDM.DCCPA CAPA,');
      Add('PRDDM.DCYCP ITEM');
      Add('WHERE NROO_O=NROO_Y AND STAO_O=''F''');
      Add('AND NROM_Y=:PnrProduto');
      Add('AND CAPA.CD_EMPRESA=:Pnrcd');
      Add('AND DATO_O BETWEEN ADD_MONTHS(SYSDATE,-12)');
      Add('AND LAST_DAY(ADD_MONTHS(SYSDATE,0)))');
      Add('GROUP BY  CD_EMPRESA, MES,ANO');
      Add('ORDER BY ANO,MES');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
          Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
        Params.ParamByName('Pnrcd').AsInteger := PcdCDFisico;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


Function DadosPedidosUltimosMeses(PnrFornecedor,PnrProduto,PcdCDFisico: Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT SUM(QUAY_Y) as QT_PEDIDA,CD_EMPRESA, MES, ANO');
      Add('FROM');
      Add('(SELECT');
      Add('QUAY_Y,CAPA.CD_EMPRESA,');
      Add('CASE');
      Add('WHEN EXTRACT(YEAR  FROM DATP_P) = EXTRACT(YEAR  FROM sysdate)');
      Add('AND EXTRACT(MONTH  FROM DATP_P)= EXTRACT(MONTH  FROM sysdate) then 13');
      Add('WHEN EXTRACT(YEAR  FROM DATP_P) <> EXTRACT(YEAR  FROM sysdate)');
      Add('OR  EXTRACT(MONTH  FROM DATP_P)<>EXTRACT(MONTH  FROM sysdate)');
      Add('THEN EXTRACT(MONTH  FROM DATP_P)');
      Add('END MES,');
      Add('EXTRACT(YEAR  FROM DATP_P) ANO');
      Add('FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM');
      Add('WHERE NROP_P=NROP_Y');
      ADD('AND SITP_P IN(''N'',''F'',''P'')');
      ADD('AND SITY_Y IN(''N'',''F'',''P'')');
      Add('AND NROM_Y=:PnrProduto');
      Add('AND CAPA.CD_EMPRESA=:Pnrcd');
      Add('AND ITEM.cd_operacao_rede in(0,1)');
      Add('AND DATP_P BETWEEN ADD_MONTHS(SYSDATE,-12)');
      Add('AND LAST_DAY(ADD_MONTHS(SYSDATE,0)))');
      Add('GROUP BY  CD_EMPRESA, MES,ANO');
      Add('ORDER BY ANO,MES');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
          Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
        Params.ParamByName('Pnrcd').AsInteger := PcdCDFisico;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


Function AbrePendenciaComprador(PnrFornecedor,
                                PnrComprador,
                                PnrCD,
                                PnrPedido,
                                PnrProduto: Integer;
                                PidItemEmTransito,
                                PidNaoFaturados:Boolean;
                                PnrOPeracaoRede:Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
     Add('SELECT NR_FORNCEDOR, NM_FORNECEDOR,NR_PEDIDO,');
     Add('CASE');
     Add('WHEN qt_bonificada>0 THEN ''Item Bonificado''');
     Add('ELSE ''  ''');
       Add('END BONIFICADO,');

     Add('ID_CD,NM_EMPRESA, DECODE(ID_CROSSDOCKING,''S'',''O.C.D'',''Normal'') id_Crossdocking,');
     Add('DT_PEDIDO, DT_PREVISAO,');
     Add('CASE');
     Add('When  Nvl(NR_NFE_FORNECEDOR,0)>0 THEN  To_char(DT_AGENDAMENTO,''dd/mm/yyyy'')');
     Add(' Else   Nvl(To_char(DT_AGENDAMENTO,''dd/mm/yyyy''),'' '')');
     Add(' END DT_AGENDAMENTO,');
     Add('CASE');
     Add('When  NR_NFE_FORNECEDOR>0 then NR_NFE_FORNECEDOR');
     Add(' Else   0 ');
     Add(' END NR_NFE_FORNECEDOR,');
     Add('CASE');
     Add('WHEN Nvl(To_char(DT_AGENDAMENTO,''dd/mm/yyyy''),'' '')<> '' '' and QT_MERCADORIA>0 THEN QT_MERCADORIA');
     Add('Else  0');
     Add(' END QT_MERCADORIA,');
     Add('QT_PEDIDO');
     Add(',QT_PEDIDO*PUNY_Y AS VL_PEDIDO');
     Add(',CASE');
     Add('  WHEN Nvl(To_char(DT_AGENDAMENTO,''dd/mm/yyyy''),'' '')<> '' '' and QT_MERCADORIA>0 THEN QT_MERCADORIA');
     Add('  Else  0');
     Add('END QT_MERCADORIA_ENTRADA');
     Add(',CASE');
     Add('  WHEN Nvl(To_char(DT_AGENDAMENTO,''dd/mm/yyyy''),'' '')<> '' '' and QT_MERCADORIA>0 THEN nvl(QT_MERCADORIA*PUNY_Y,0)');
     Add('  Else  0');
     Add('END VL_TRANSITO');
     add(',NVL(QT_ATENDIDA,0) AS QT_ATENDIDA');
     add(',NVL(QT_ATENDIDA*PUNY_Y,0) AS VL_ATENDIDO');
     add(',QT_PEDIDO - QT_ATENDIDA  AS QT_PENDENTE');
     add(',(QT_PEDIDO - QT_ATENDIDA )*PUNY_Y AS VL_PENDENTE,');
     Add('       CD_PRODUTO,TO_CHAR(CD_EAN_VENDA,''00000000000000'') as CD_EAN_VENDA,NM_MERCADORIA ,DS_APRESENTACAO,');
     Add('       ID_ITEM ,ID_CAPA,DADY_Y ,ABTY_Y,PUNY_Y,PFBY_Y,NRVV_Y,');
     Add('       ITEMPEDIDO.CD_EMPRESA,');
     Add('CASE ');
     Add(' WHEN CRITICA.QT_ITEM_PEDIDO>0 THEN ''S''');
     Add('     ELSE  ID_NFE_TRANSITO');
     Add(' END ID_NFE_TRANSITO,');
     Add('  ID_BONIFICADO, NROM_Y,');
     Add('  Nvl(NOTA_FATURADA.CD_CNPJ_FORNECEDOR,0) AS CD_CNPJ_FORNECEDOR,');
     Add('   Nvl(NR_NFE_FORNECEDOR,0) AS NR_NFE,CD_COMPRADOR,');
     add('  (SELECT NM_COMPRADOR FROM PRDDM.DC_COMPRADOR_GAM WHERE NR_COMPRADOR=CD_COMPRADOR) as nm_comprador');
     add(',NVL(CRITICA.QT_ITEM_PEDIDO,0) AS QT_ITEM_PEDIDO_CRITICA');
     Add('FROM  ((');
     Add('SELECT LABP_P NR_FORNCEDOR, DS_GRUPO_FORNECEDOR NM_FORNECEDOR,');
     Add('NROP_P AS NR_PEDIDO,');
     Add('ID_UNIDADE_FEDERACAO AS ID_CD, NM_EMPRESA,ID_CROSSDOCKING,');
     Add('DATP_P DT_PEDIDO, PREP_P DT_PREVISAO,DT_AGENDAMENTO_PEDIDO,');
     Add('QUAY_Y AS QT_PEDIDO,CHEY_Y AS QT_ATENDIDA,');
     Add('CD_MERCADORIA*10+NR_DV_MERCADORIA CD_PRODUTO,ME.CD_EAN_VENDA,NM_MERCADORIA ,');
     Add('DS_APRESENTACAO_MERCADORIA DS_APRESENTACAO,');
     Add('SITY_Y ID_ITEM ,SITP_P ID_CAPA,DADY_Y ,ABTY_Y,PFBY_Y,PUNY_Y,VCCI_Y,NRVV_Y,ITEM.CD_EMPRESA,NROM_Y,NROP_P,ID_NFE_TRANSITO,');
     Add('CASE');
     Add('WHEN qt_bonificada>0 THEN ''S''');
     Add('else''N''');
     Add('END ID_BONIFICADO,CD_COMPRADOR,qt_bonificada,capa.CD_EMPRESA_DESTINO');
     Add('FROM');
     Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
     Add('PRDDM.DC_MERCADORIA ME,');
     Add('PRDDM.DCPCC CAPA,');
     Add('PRDDM.DCPCI ITEM,');
     Add('ACESSO.DC_EMPRESA EMPRESA');

     Add('WHERE');
     Add('NROP_P = NROP_Y');
     add('and  EMPRESA.CD_EMPRESA=capa.CD_EMPRESA_DESTINO');
     add('AND quay_y>0');
     Add('AND SITY_Y IN(''N'',''P'')');
     if PidItemEmTransito then
       Add('AND id_nfe_transito=''N''');

     Add('AND NROM_Y=ME.CD_MERCADORIA');
     Add('AND LABP_P = GF.CD_GRUPO_FORNECEDOR');
     if PnrFornecedor>0 then
        Add('AND LABP_P = :PnrFornecedor')
     else
       Add('AND LABP_P not in(98)');

     if PnrCD>0 then
        Add('AND ITEM_CD_EMPRESA = :Pnrcd');
     if PnrPedido>0 then
        Add('AND NROP_Y = :PnrPedido');
     if PnrProduto>0 then
        Add('AND NROM_Y = :PnrProduto');

      Add('AND ITEM.cd_operacao_rede = :PcdOperacaoRede');

     Add('AND GF.CD_GRUPO_FORNECEDOR IN (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
     Add('FROM PRDDM.DC_COMPRA_MERCADORIA');
     if PnrComprador>0 then
       add('WHERE  id_situacao_mercadoria=''A'' and CD_COMPRADOR=:PnrComprador)')
     else add(')');
     Add(') itempedido');

  Add(' LEFT OUTER JOIN (SELECT  NROP_P,NROM_Y NR_PRODUTO,PED.CD_EMPRESA,QUAY_Y,sum(QT_MERCADORIA) as QT_MERCADORIA,');
  Add('                               NOTA_TRANSITO.NR_NFE NR_NFE_FORNECEDOR,');
  Add('                               CD_EMPRESA_DESTINO ,DATP_P,SITY_Y ,NOTA_TRANSITO.CD_CNPJ_FORNECEDOR');
  Add('                               ');
  Add('FROM');
  Add('PRDDM.DCPCC PED,');
  Add('PRDDM.DCPCI ITEM_PED,');
  Add('PRDDM.DC_NFE_NOTA_TRANSITO  NOTA_TRANSITO,');
  Add('PRDDM.DC_NFE_ITEM_NOTA_TRANSITO NFE_ITEM_TRANS');
  Add(',PRDDM.DC_MERCADORIA MERCADORIA');
 // Add(',GAMNFE.DC_EVT_AGENDAMENTO_NFE AGENDAMENTO_NFE');
 // Add(',GAMNFE.DC_EVT_AGENDAMENTO_DESCARGA   AGENDAMENTO_DESCARGA');
//  Add(',GAMNFE.DC_EVT_AGENDAMENTO_FORNECEDOR    AGENDAMENTO_FORNECEDOR');
  Add('WHERE');
  Add('PED.NROP_P=ITEM_PED.NROP_Y');
  Add('AND MERCADORIA.CD_MERCADORIA=ITEM_PED.NROM_Y');
  Add('AND  NFE_ITEM_TRANS.NR_EAN_MERCADORIA=MERCADORIA.CD_EAN_VENDA');
  Add('AND NFE_ITEM_TRANS.CD_CHAVE_NFE=NOTA_TRANSITO.CD_CHAVE_NFE');
  Add('AND NOTA_TRANSITO.NR_PEDIDO_COMPRA=PED.NROP_P');
//  Add('AND AGENDAMENTO_NFE.NR_NFE=NOTA_TRANSITO.NR_NFE');
 // Add('AND AGENDAMENTO_FORNECEDOR.SQ_AGENDAMENTO_DESCARGA =AGENDAMENTO_DESCARGA.SQ_AGENDAMENTO_DESCARGA');
 // Add('AND AGENDAMENTO_FORNECEDOR.SQ_AGENDAMENTO_FORNECEDOR= AGENDAMENTO_NFE.SQ_AGENDAMENTO_FORNECEDOR');
//  Add('AND  AGENDAMENTO_NFE.CD_EMPRESA=AGENDAMENTO_DESCARGA.CD_EMPRESA');
//  Add('AND AGENDAMENTO_NFE.SQ_AGENDAMENTO_DESCARGA=AGENDAMENTO_DESCARGA.SQ_AGENDAMENTO_DESCARGA');
 // Add('AND NOTA_TRANSITO.CD_CNPJ_FORNECEDOR = AGENDAMENTO_FORNECEDOR.CD_CNPJ_FORNECEDOR');
  Add('AND SITY_Y IN(''P'',''N'')');
  Add('GROUP BY NROP_P,NROM_Y ,PED.CD_EMPRESA,QUAY_Y,');
  Add('                             NOTA_TRANSITO.NR_NFE,');
  Add('                             CD_EMPRESA_DESTINO ,DATP_P,SITY_Y ,NOTA_TRANSITO.CD_CNPJ_FORNECEDOR');
  Add('                             ');

  Add(') NOTA_FATURADA ON  NOTA_FATURADA.NROP_P=ITEMPEDIDO.NR_PEDIDO');
  Add('AND NOTA_FATURADA.NR_PRODUTO=ITEMPEDIDO.NROM_Y AND  NOTA_FATURADA.CD_EMPRESA_DESTINO=ITEMPEDIDO.CD_EMPRESA_DESTINO');




  Add(' LEFT OUTER JOIN');
  Add('    ( SELECT DT_AGENDAMENTO,  AGENDAMENTO_DESCARGA.CD_EMPRESA');
  Add('    , NR_NFE  ,NR_NFE_SERIE,CD_CNPJ_FORNECEDOR');
  Add('      FROM');
  Add('    GAMNFE.DC_EVT_AGENDAMENTO_NFE AGENDAMENTO_NFE');
  Add('    ,GAMNFE.DC_EVT_AGENDAMENTO_FORNECEDOR    AGENDAMENTO_FORNECEDOR');
  Add('    ,GAMNFE.DC_EVT_AGENDAMENTO_DESCARGA AGENDAMENTO_DESCARGA');
  Add('    WHERE');
  Add('         AGENDAMENTO_NFE.SQ_AGENDAMENTO_FORNECEDOR =  AGENDAMENTO_FORNECEDOR.SQ_AGENDAMENTO_FORNECEDOR');
  Add('     AND AGENDAMENTO_NFE.SQ_AGENDAMENTO_DESCARGA   =  AGENDAMENTO_FORNECEDOR.SQ_AGENDAMENTO_DESCARGA');
  Add('     AND  AGENDAMENTO_NFE.SQ_AGENDAMENTO_DESCARGA =  AGENDAMENTO_DESCARGA.SQ_AGENDAMENTO_DESCARGA');
  Add('     AND AGENDAMENTO_NFE.CD_EMPRESA = AGENDAMENTO_FORNECEDOR.CD_EMPRESA');
  Add('     AND AGENDAMENTO_NFE.CD_EMPRESA = AGENDAMENTO_DESCARGA.CD_EMPRESA');
  Add('     )  DATA_AGENDA ON DATA_AGENDA.NR_NFE=NOTA_FATURADA.NR_NFE_FORNECEDOR AND DATA_AGENDA.NR_NFE=NOTA_FATURADA.NR_NFE_FORNECEDOR');
  Add('                  AND DATA_AGENDA.CD_CNPJ_FORNECEDOR= NOTA_FATURADA.CD_CNPJ_FORNECEDOR AND DATA_AGENDA.CD_EMPRESA=NOTA_FATURADA.CD_EMPRESA_DESTINO');
  Add('LEFT OUTER JOIN');
  Add('(SELECT');
  Add('     NR_CNPJ_EMITENTE ,CD_MERCADORIA, Sum(QT_ITEM_PEDIDO) AS QT_ITEM_PEDIDO , NR_PEDIDO_GAM,CD_EMPRESA');
  Add('FROM');
  Add('(SELECT DISTINCT CRITICA.NR_CNPJ_EMITENTE ,CD_MERCADORIA, QT_ITEM_PEDIDO, ITEM_CRITICA.NR_NFE,NR_PEDIDO_GAM,CRITICA.CD_EMPRESA');
  Add('FROM');
  Add(' PRDDM.DC_COMPRA_CRITICA_ENTRADA CRITICA,');
  Add(' PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA ITEM_CRITICA');
  Add('WHERE');
  Add(' CRITICA.NR_NFE=ITEM_CRITICA.NR_NFE');
  Add('AND CD_COMPRA_SITUACAO_CRITICA in(1,2)');

    if PnrCD>0 then
        Add('AND CRITICA.CD_EMPRESA = :Pnrcd');
     if PnrPedido>0 then
        Add('AND CRITICA.NR_PEDIDO_GAM = :PnrPedido');
     if PnrProduto>0 then
        Add('AND ITEM_CRITICA.CD_MERCADORIA = :PnrProduto');
     Add(' AND CRITICA.CD_EMPRESA=ITEM_CRITICA.CD_EMPRESA)');
     Add('GROUP BY NR_CNPJ_EMITENTE ,CD_MERCADORIA, NR_PEDIDO_GAM,CD_EMPRESA) CRITICA ON CRITICA.NR_PEDIDO_GAM=ITEMPEDIDO.NROP_P');
     Add('                                                        AND  CRITICA.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
     Add('                                                        AND CRITICA.CD_EMPRESA=ITEMPEDIDO.CD_EMPRESA)');







     stQry.SaveToFile('c:\temp\Compras_PendenciaComprador.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        if PnrFornecedor>0 then
            Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
        if PnrCD>0 then
            Params.ParamByName('Pnrcd').AsInteger:=PnrCD;
        if PnrComprador>0 then
          Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
        if PnrPedido>0 then
           Params.ParamByName('PnrPedido').AsBCD:=PnrPedido;
        if PnrProduto>0 then
           Params.ParamByName('PnrProduto').AsBCD:=PnrProduto;


        Params.ParamByName('PcdOperacaoRede').AsBCD:=PnrOPeracaoRede;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;




Function AbrePendenciaCompradorSugestao(PnrFornecedor,PnrComprador,PnrCD: Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
     Add('SELECT');
     Add('NROM_Y,NROP_P,DATP_P,SITY_Y,LABP_P, SUM(QUAY_Y - CHEY_Y) AS QT_PENDENTE,');
     Add('SUM((QUAY_Y - CHEY_Y)* PFBY_Y) AS VL_PENDENCIA_FABRICA,');
     Add('SUM((QUAY_Y - CHEY_Y)* VCCI_Y) AS VL_PENDENCIA_CUSTO,ITEM.CD_EMPRESA');
     Add('FROM');
     Add('PRDDM.DCPCC CAPA,');
     Add('PRDDM.DCPCI  ITEM');
     Add('WHERE');
     Add('NROP_P=NROP_Y');
     Add('AND SITY_Y IN(''N'',''P'',''T'')');
     Add('AND SITP_P IN(''N'',''P'',''T'')');
     Add('AND LABP_P = :PnrFornecedor');
     if PnrCD>0 then
        Add('AND CAPA.CD_EMPRESA = :Pnrcd');
     add('and item.cd_operacao_rede in(0,1)');
     Add('GROUP BY NROM_Y,SITY_Y,LABP_P,NROP_P,DATP_P,ITEM.CD_EMPRESA');
     Add('ORDER BY DATP_P,NROM_Y');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
        if PnrCD>0 then
            Params.ParamByName('Pnrcd').AsInteger:=PnrCD;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;



(***********************************************************************)
{$REGION 'Nivel Servi?o'}
(***********************************************************************)
Function AbreNivelServico(PnrFornecedor,PnrComprador,PnrCD: Integer;idAgrupaCD,idAgrupaFornecedor:String):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
     Add('SELECT');
     if PnrCD=0 then
     begin
      Add('''CD SC/CD RS'' as  ID_CD,');
     end;
     if PnrCD=1 then
     begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=1 THEN ''CD.SC''');
      Add('END ID_CD,');
     end;
     if PnrCD=2 then
     begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=1 THEN ''CD.SC''');
      Add('WHEN CD_EMPRESA=4 THEN ''CD.RS''');
      Add('END ID_CD,');
     end;
     if PnrCD=4 then
     begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=4 THEN ''CD.RS''');
      Add('END ID_CD,');
     end;
     Add('CD_COMPRADOR,');
    Add('NM_COMPRADOR_REDUZIDO,');
    if idAgrupaFornecedor='S' then
    begin
     Add('CD_GRUPO_FORNECEDOR,');
     Add('DS_GRUPO_FORNECEDOR,');
    end;
     Add('NR_ITENS,');
     Add('NR_ITENS_MED,');
     Add('NR_ITENS_PER,');
     Add('NR_ITENS_FALTA ,');
     Add('UNID_ESTOQUE,');
     Add('CASE');
     Add('WHEN NR_ITENS>0 THEN   ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
     Add('WHEN NR_ITENS=0 THEN 0');
     Add('END INDICE_FALTA_UNITARIA,');
     Add('CASE');
     Add('WHEN NR_ITENS>0 THEN 100 -ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
     Add('WHEN NR_ITENS=0 THEN 0');
     Add('END NIVEL_SERVICO_UNITARIO');
     Add('FROM');
     Add('(SELECT');
     if PnrCD>0 then
       Add('CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     if idAgrupaFornecedor='S' then
     begin
      Add('CD_GRUPO_FORNECEDOR,');
      Add('DS_GRUPO_FORNECEDOR,');
     end;
     Add('COUNT(NR_ITENS) AS NR_ITENS,');
     Add('SUM(nvl(NR_ITENS_MED,0)) NR_ITENS_MED,');
     Add('SUM(nvl(NR_ITENS_PER,0)) NR_ITENS_PER,');

     Add('SUM(NR_ITENS_ZERO) NR_ITENS_FALTA ,');
     Add('SUM(ESTOQUE) AS UNID_ESTOQUE');
     Add('FROM');
     Add('(SELECT COMPRA_MERCADORIA.CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     if idAgrupaFornecedor='S' then
     begin
      Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR,');
      Add('DS_GRUPO_FORNECEDOR,');
     end;
     Add(' MERCADORIA.CD_MERCADORIA,');
     Add('COUNT(*) AS NR_ITENS,');
     Add('CASE');
     Add('WHEN DS_NIVEL_ECNM =2  THEN COUNT(*)');
     Add('END NR_ITENS_PER,');
     Add('CASE');
     Add('WHEN ds_nivel_ecnm <>2  THEN COUNT(*)');
     Add('END NR_ITENS_MED,');

     Add('SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)) AS ESTOQUE,');
     Add('CASE');
     Add('WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))=0 THEN COUNT(*)');
     Add('WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))>0 THEN 0');
     Add('END NR_ITENS_ZERO');
     Add('FROM');
     Add('PRDDM.DC_MERCADORIA MERCADORIA,');
     Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA,');
     Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
     Add('WHERE');
     Add('MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
     Add('AND COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
     Add('AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
     if (PnrCD>0) and (PnrCD<>2) then
       Add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrCD');
     Add('AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     Add('AND COMPRA_MERCADORIA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
     Add('AND COMPRADOR.NR_COMPRADOR NOT IN(0,5,21)');
     Add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     if PnrComprador>0 then
       Add('and COMPRADOR.NR_COMPRADOR=:PnrComprador');
     Add('GROUP BY COMPRA_MERCADORIA.CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     Add('DS_NIVEL_ECNM,');
     if idAgrupaFornecedor='S' then
     begin
       Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR,');
       Add('DS_GRUPO_FORNECEDOR,');
     end;
     Add('MERCADORIA.CD_MERCADORIA)');
     Add('GROUP BY');
     if PnrCD>0then
       add('CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO');
     if idAgrupaFornecedor='S' then
     begin
       Add(',CD_GRUPO_FORNECEDOR,');
       Add('DS_GRUPO_FORNECEDOR');
     end;
     Add('ORDER BY 1)');


     Add('union all');

     Add('SELECT');
     Add('ID_CD,');
     Add('CASE');
     Add('WHEN NR_CD=1 THEN  100');
     Add('WHEN NR_CD=4 then  400');
     Add('WHEN NR_CD=5 then  500');
     Add('WHEN NR_CD=100 then  1000');
     Add('END NR_COMPRADOR,');
     Add('CASE');
     Add('WHEN nr_cd=1 THEN  ''CD Tubar?o/SC''');
     Add('WHEN nr_CD=4 then  ''CD Sta. Cruz do Sul/RS''');
     Add('WHEN nr_CD=100 then  ''Empresa Geral CD SC/CD RS''');
     Add('END NM_COMPRADOR_REDUZIDO,');
     if idAgrupaFornecedor='S' then
     begin
     Add('CASE');
     Add('WHEN nr_cd=001 THEN  1000');
     Add('WHEN nr_CD=004 then  4000');
     Add('WHEN nr_CD=100 then  1000');
     Add('END  CD_GRUPO_FORNECEDOR,');
     Add('CASE');
     Add('WHEN nr_cd=001 THEN  ''SC''');
     Add('WHEN nr_CD=004 then  ''RS''');
     Add('WHEN nr_CD=100 then ''GERAL''');
     Add('END  DS_GRUPO_FORNECEDOR,');
     end;


     Add('Sum(NR_ITENS) AS NR_ITENS,');
     Add('Sum(NR_ITENS_MED) as  NR_ITENS_MED,');
     Add('Sum(NR_ITENS_PER) AS NR_ITENS_PER,');
     Add('Sum(NR_ITENS_FALTA) AS  NR_ITENS_FALTA,');
     Add('Sum(UNID_ESTOQUE) AS UNID_ESTOQUE,');
     Add('Round((Sum(NR_ITENS_FALTA)/Sum(NR_ITENS))*100,2)  as INDICE_FALTA_UNITARIA,');
     Add('100-Round((Sum(NR_ITENS_FALTA)/Sum(NR_ITENS))*100,2)  as  NIVEL_SERVICO_UNITARIO');



     ADD('FROM');


    Add('(SELECT');
    if PnrCD=0 then
      Add('''CD SC/CD RS'' as  ID_CD,');
    if PnrCD=1 then
    begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=1 THEN ''CD.SC''');
      Add('END ID_CD,');
    end;
     if PnrCD=2 then
     begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=1 THEN ''CD.SC''');
      Add('WHEN CD_EMPRESA=4 THEN ''CD.RS''');
      Add('WHEN CD_EMPRESA=5 THEN ''CD.ES''');
      Add('END ID_CD,');
     end;
     if PnrCD=4 then
     begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=4 THEN ''CD.RS''');
      Add('END ID_CD,');
     end;
     if PnrCD=0 then
       Add('500 NR_CD,');
     if PnrCD>0 then
     begin
      Add('CASE');
      Add('WHEN CD_EMPRESA=1 THEN 1');
      Add('WHEN CD_EMPRESA=4 THEN 4');
      Add('END NR_CD,');
     end;
   Add('CD_COMPRADOR,');
   Add('NM_COMPRADOR_REDUZIDO,');
   if idAgrupaFornecedor='S' then
   begin
   Add('CASE');
   Add('WHEN CD_EMPRESA=1 THEN 1000');
   Add('WHEN CD_EMPRESA=4 THEN 4000');
   Add('END  CD_GRUPO_FORNECEDOR,');
   Add('CASE');
   Add('WHEN CD_EMPRESA=1 THEN ''CD SC''');
   Add('WHEN CD_EMPRESA=4 THEN ''CD RS''');
   Add(' END DS_GRUPO_FORNECEDOR,');
   end;


    Add('NR_ITENS,');
    Add('NR_ITENS_MED,');
     Add('NR_ITENS_PER,');
     Add('NR_ITENS_FALTA ,');
     Add('UNID_ESTOQUE,');
     Add('CASE');
     Add('WHEN NR_ITENS>0 THEN   ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
     Add('WHEN NR_ITENS=0 THEN 0');
     Add('END INDICE_FALTA_UNITARIA,');
     Add('CASE');
     Add('WHEN NR_ITENS>0 THEN 100 -ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
     Add('WHEN NR_ITENS=0 THEN 0');
     Add('END NIVEL_SERVICO_UNITARIO');
     Add('FROM');
     Add('(SELECT');
     if PnrCD>0 then
       Add('CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     Add('COUNT(NR_ITENS) AS NR_ITENS,');
     Add('SUM(NVL(NR_ITENS_MED,0)) NR_ITENS_MED,');
     Add('SUM(NVL(NR_ITENS_PER,0)) NR_ITENS_PER,');

     Add('SUM(NR_ITENS_ZERO) NR_ITENS_FALTA ,');
     Add('SUM(ESTOQUE) AS UNID_ESTOQUE');
     Add('FROM');
     Add('(SELECT COMPRA_MERCADORIA.CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     Add(' MERCADORIA.CD_MERCADORIA,');
     if idAgrupaFornecedor='S' then
     begin
     Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR,');
     Add('DS_GRUPO_FORNECEDOR,');
     end;
     Add('COUNT(*) AS NR_ITENS,');
     Add('CASE');
     Add('WHEN DS_NIVEL_ECNM =2  THEN COUNT(*)');
     Add('END NR_ITENS_PER,');
     Add('CASE');
     Add('WHEN ds_nivel_ecnm <>2  THEN COUNT(*)');
     Add('END NR_ITENS_MED,');

     Add('SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)) AS ESTOQUE,');
     Add('CASE');
     Add('WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))=0 THEN COUNT(*)');
     Add('WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))>0 THEN 0');
     Add('END NR_ITENS_ZERO');
     Add('FROM');
     Add('PRDDM.DC_MERCADORIA MERCADORIA,');
     Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA,');
     Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
     Add('WHERE');
     Add('MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
     Add('AND COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
     Add('AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
     if ((PnrCD>0) and (PnrCD<>2)) then
       Add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrCD');
     Add('AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     Add('AND COMPRA_MERCADORIA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
     Add('AND COMPRADOR.NR_COMPRADOR NOT IN(0,5,21)');
     Add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
//     if PnrComprador>0 then
  //     Add('and COMPRADOR.NR_COMPRADOR=:PnrComprador');
     Add('GROUP BY COMPRA_MERCADORIA.CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     Add('DS_NIVEL_ECNM,');
     if idAgrupaFornecedor='S' then
     begin
     Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR,');
     Add('DS_GRUPO_FORNECEDOR,');
     end;

     Add('MERCADORIA.CD_MERCADORIA)');
     Add('GROUP BY');
     if PnrCD>0then
       add('CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO');
     if idAgrupaFornecedor='S' then
     begin
       Add(',CD_GRUPO_FORNECEDOR,');
       Add('DS_GRUPO_FORNECEDOR');
     end;
     Add('))');
     Add('GROUP BY ID_CD,NR_CD');
     if idAgrupaFornecedor='S' then
     begin
       Add(',CD_GRUPO_FORNECEDOR,');
       Add('DS_GRUPO_FORNECEDOR');
     end;






      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        if PnrComprador>0 then
           Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
     if (PnrCD>0) and (PnrCD<>2) then
           Params.ParamByName('PnrCD').AsInteger := PnrCD;
        open;

      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;
(* ****************************************************** *)
{$ENDREGION 'Nivel Servi?o'}
(* ****************************************************** *)

procedure AtualizaEvento(PnrPedido,PcdEvento:Integer;idStatusPedido,nmUsuaio,msg:String);
Var
 DaDosPedido:TDadosValoresPedido;

begin
      DaDosPedido:=GetValoresPedido(PnrPedido,false);
     if  InsereEventoPedidoCompra(DaDosPedido.nrPedido,
                                 DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 idStatusPedido[1],
                                 dtSistema,
                                 nmLogin,
                                 DadosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     PcdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);

end;

function TestaItemJaFaturado(PnrPedido,PnrProduto,PnrEmpresa: Integer):boolean;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try

    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenericaSihst;
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT Count(*) Nr_Item');
      SQL.Add('FROM PRDDM.DCPCI');
      SQL.Add('WHERE  NROP_Y=:PnrPedido');
      if PnrProduto>0 then
        SQL.Add('AND NROM_Y=:PnrProduto');
      SQL.Add('AND ID_NFE_TRANSITO=''S''');
      SQL.Add('AND CD_EMPRESA=:PnrCD');
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      if PnrProduto>0 then
      ParamByName('PnrPedido').AsInteger:=PnrProduto;
      ParamByName('PnrCD').AsInteger:=PnrEmpresa;
      open;
    end;
    Result :=false;
    if not QryTemp.IsEmpty then
      if QryTemp.FieldByName('Nr_Item').AsInteger>0 then
         Result :=true;
  finally
    FreeAndNil(QryTemp);
  end;
end;


function CarregaPedidoSemEventos:TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT * FROM PRDDM.DCPCC capa,PRDDM.DCPCI item');
      SQL.Add('WHERE');
      SQL.Add('NROP_P=NROP_Y');
      SQL.Add('AND SITP_P IN(''N'')');
      SQL.Add('AND SITY_Y IN(''N'')');
      SQL.Add('AND LABP_P NOT IN(98)');
      SQL.ADD('AND CAPA.CD_OPERACAO_REDE=ITEM.CD_OPERACAO_REDE');
      SQL.ADD('AND CAPA.CD_OPERACAO_REDE in(0,1)');
      SQL.Add('AND DATP_P>=''01/06/2014''');
      SQL.Add('AND NROP_P NOT IN(SELECT');
      SQL.Add('DISTINCT CD_PEDIDO FROM GAMNFE.DC_EVT_PEDIDO_COMPRA)');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;



Function AbreNivelServicoII(PnrFornecedor,PnrComprador,PnrCD: Integer;idAgrupaCD,idAgrupaFornecedor:String):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
     add('SELECT');
     Add('ID_CD ,');
     add('INDICE.CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO,');
     if idAgrupaFornecedor='S' then
     begin
      add('INDICE.CD_GRUPO_FORNECEDOR,');
      Add('DS_GRUPO_FORNECEDOR,');
     end;
     add('NR_ITENS,');
     Add('NR_ITENS_MED,');
     add('NR_ITENS_PER,');
     Add('NR_ITENS_FALTA ,');
     add('UNID_ESTOQUE,');
     Add('CASE');
     add('WHEN NR_ITENS>0 THEN   ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
     Add('WHEN NR_ITENS=0 THEN 0');
     add('END INDICE_FALTA_UNITARIA,');
     Add('CASE');
     add('WHEN NR_ITENS>0 THEN 100 -ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
     Add('WHEN NR_ITENS=0 THEN 0');
     add('END NIVEL_SERVICO_UNITARIO,');
     Add('INDICE_FALTA_FINANCEIRA,');
     add(' NIVEL_SERVICO_FINANCEIRA');
     Add('FROM');
     add('(SELECT');
     Add(' CD_EMPRESA,');
     add(' ID_CD,');
     Add(' CD_COMPRADOR,');
     Add(' NM_COMPRADOR_REDUZIDO,');
     if idAgrupaFornecedor='S' then
     begin
      Add('CD_GRUPO_FORNECEDOR,');
      add('DS_GRUPO_FORNECEDOR,');
     end;
     Add(' COUNT(NR_ITENS) AS NR_ITENS,');
     add(' SUM(nvl(NR_ITENS_MED,0)) NR_ITENS_MED,');
     Add(' SUM(nvl(NR_ITENS_PER,0)) NR_ITENS_PER,');
     add(' SUM(NR_ITENS_ZERO) NR_ITENS_FALTA ,');
     Add(' SUM(ESTOQUE) AS UNID_ESTOQUE');
     add('FROM');
     Add('(SELECT');
     Add('  ID_UNIDADE_FEDERACAO ID_CD,');
     Add('  COMPRA_MERCADORIA.CD_EMPRESA,');
     add(' CD_COMPRADOR,');
     Add(' NM_COMPRADOR_REDUZIDO,');
     if idAgrupaFornecedor='S' then
     begin
       add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR,');
       Add('DS_GRUPO_FORNECEDOR,');
     end;
     add(' MERCADORIA.CD_MERCADORIA,');
     Add(' COUNT(*) AS NR_ITENS,');
     add(' CASE');
     Add(' WHEN DS_NIVEL_ECNM =2  THEN COUNT(*)');
     add(' END NR_ITENS_PER,');
     Add('CASE');
     add('WHEN ds_nivel_ecnm <>2  THEN COUNT(*)');
     Add('END NR_ITENS_MED,');
     Add('SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)) AS ESTOQUE,');
     add('CASE');
     Add('WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))=0 THEN COUNT(*)');
     add('WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))>0 THEN 0');
     Add('END NR_ITENS_ZERO');
     add('FROM');
     Add('PRDDM.DC_MERCADORIA MERCADORIA,');
     add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA,');
     Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
     add('  ,ACESSO.DC_EMPRESA EMP');
     add('WHERE');
     Add('MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
     add('   AND COMPRA_MERCADORIA.CD_EMPRESA=emp.cd_empresa');
     add('  AND id_empresa_fisica=''S''');
     add('  AND id_situacao_empresa=''A''');

     add('AND COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
     Add('AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
//     Add('-- AND COMPRA_MERCADORIA.CD_EMPRESA=4');
     Add('AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     Add('AND COMPRA_MERCADORIA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
     Add('AND COMPRADOR.NR_COMPRADOR NOT IN(0,5,21)');
     add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     add('AND DT_PRIMEIRA_COMPRA<>''01/01/2039''');
     Add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     if PnrComprador>0 then
     Add('and COMPRADOR.NR_COMPRADOR=:PnrComprador');
     if (PnrCD>0) and (PnrCD<>2) then
        Add('AND ESTOQUE_MERCADORIA.CD_EMPRESA=:PnrCd');

     Add('GROUP BY COMPRA_MERCADORIA.CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     add('  ID_UNIDADE_FEDERACAO,');
     add('  NM_EMPRESA,');


     Add('NM_COMPRADOR_REDUZIDO,');
     Add('DS_NIVEL_ECNM,');
     if idAgrupaFornecedor='S' then
     begin
       Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR,');
       Add('DS_GRUPO_FORNECEDOR,');
     end;
     Add('MERCADORIA.CD_MERCADORIA)');
     Add('GROUP BY');
     Add('ID_CD,');
     Add('CD_EMPRESA,');
     Add('CD_COMPRADOR,');
     Add('NM_COMPRADOR_REDUZIDO');
     if idAgrupaFornecedor='S' then
     begin
      Add(',CD_GRUPO_FORNECEDOR,');
      Add('DS_GRUPO_FORNECEDOR');
     end;
     Add(')  INDICE');

     Add('LEFT OUTER JOIN');
     Add('(  SELECT');
     Add('VENDATOTAL.CD_EMPRESA,');
     Add('VENDATOTAL.CD_COMPRADOR,');
     if idAgrupaFornecedor='S' then
       Add('VENDATOTAL.CD_GRUPO_FORNECEDOR,');
    Add('SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
    Add(',SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO_PERDIDO,');
    Add('CASE');
    Add('WHEN  SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0))>0 THEN');
    Add('ROUND(SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0))/');
    Add('SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)),4)*100');
    ADD('ELSE  0');
    Add('END INDICE_FALTA_FINANCEIRA,');
    Add('CASE');
    Add(' WHEN SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0))>0 THEN ');
    Add('100- ROUND(SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0))/');
    Add('SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)),4)*100');
    ADD('ELSE  0');
    Add('END NIVEL_SERVICO_FINANCEIRA');
    Add('FROM');
   Add('(SELECT');
   Add('VENDA.CD_EMPRESA,');
   Add('CD_COMPRADOR,');
   if idAgrupaFornecedor='S' then
     Add('CD_GRUPO_FORNECEDOR,');
   Add('SUM(NVL(VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   Add('FROM');
   Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
   Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON');
   Add('ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
   Add('LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
   Add('ON VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
   Add('WHERE');
   Add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
   Add(' AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
   Add(' --AND QT_FISICO<=0');
   Add(' GROUP BY');
   Add(' VENDA.CD_EMPRESA');
   if idAgrupaFornecedor='S' then
    Add(',CD_GRUPO_FORNECEDOR');
   Add(' ,CD_COMPRADOR) VENDATOTAL');
   Add(' LEFT OUTER JOIN');
   Add('(SELECT');
   Add(' VENDA.CD_EMPRESA,');
   Add(' CD_COMPRADOR,');
   if idAgrupaFornecedor='S' then
     Add('CD_GRUPO_FORNECEDOR,');
   Add(' SUM(NVL(VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   Add(' FROM');
   Add(' PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
   Add(' LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA');
   Add('ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
   Add(' LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON');
   Add('VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
   Add(' WHERE');
   Add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
   Add(' AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
  if (PnrCD>0) and (PnrCD<>2) then
       Add('AND ESTOQUE.CD_EMPRESA=:PnrCd');

   Add(' AND QT_FISICO - (QT_RESERVADO+QT_RESERVA_PROBLEMATICA+ QT_VENCIDO+ QT_BLOQUEADO)<=0');
   Add(' GROUP BY');
   Add(' VENDA.CD_EMPRESA');
   if idAgrupaFornecedor='S' then
     Add(' ,CD_GRUPO_FORNECEDOR');
   Add(' ,CD_COMPRADOR) VENDAPERDIDA ON VENDAPERDIDA.CD_EMPRESA=VENDATOTAL.CD_EMPRESA');
   Add('AND  VENDAPERDIDA.CD_COMPRADOR= VENDATOTAL.CD_COMPRADOR');
   if idAgrupaFornecedor='S' then
      Add(' AND  VENDAPERDIDA.CD_GRUPO_FORNECEDOR= VENDATOTAL.CD_GRUPO_FORNECEDOR');
   Add(' GROUP BY');
   Add(' VENDATOTAL.CD_EMPRESA');
   Add(' ,VENDATOTAL.CD_COMPRADOR');
   if idAgrupaFornecedor='S' then
    Add(',VENDATOTAL.CD_GRUPO_FORNECEDOR');
   Add(' ) NIVEL ON NIVEL.CD_EMPRESA=INDICE.CD_EMPRESA AND NIVEL.CD_COMPRADOR=INDICE.CD_COMPRADOR');
   if idAgrupaFornecedor='S' then
     Add(' AND NIVEL.CD_GRUPO_FORNECEDOR=INDICE.CD_GRUPO_FORNECEDOR');

   add('Union All');

   add('  ( SELECT');
   add('  ID_CD,');
   add('  INDICE.CD_COMPRADOR,');
   add('  NM_COMPRADOR_REDUZIDO,');
   if idAgrupaFornecedor='S' then
   begin
    add('INDICE.CD_COMPRADOR CD_GRUPO_FORNECEDOR,');
   add('''Indice Geral''||''  ''||NM_COMPRADOR_REDUZIDO DS_GRUPO_FORNECEDOR,');
   end;
   add('  NR_ITENS,');
   add('  NR_ITENS_MED,');
   add('  NR_ITENS_PER,');
   add('  NR_ITENS_FALTA ,');
   add('  UNID_ESTOQUE,');
   add('  CASE');
   add('  WHEN NR_ITENS>0 THEN   ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
   add('  WHEN NR_ITENS=0 THEN 0');
   add('  END INDICE_FALTA_UNITARIA,');
   add('  CASE');
   add('  WHEN NR_ITENS>0 THEN 100 -ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
   add('  WHEN NR_ITENS=0 THEN 0');
   add('  END NIVEL_SERVICO_UNITARIO,');
   add('  INDICE_FALTA_FINANCEIRA,');
   add('  NIVEL_SERVICO_FINANCEIRA');
   add('  FROM');
   add('  (SELECT');
   add('   CD_EMPRESA,');
   add('   ID_CD,');
   add('   CD_COMPRADOR,');
   add('   NM_COMPRADOR_REDUZIDO,');

   add('   COUNT(NR_ITENS) AS NR_ITENS,');
   add('   SUM(nvl(NR_ITENS_MED,0)) NR_ITENS_MED,');
   add('   SUM(nvl(NR_ITENS_PER,0)) NR_ITENS_PER,');
   add('   SUM(NR_ITENS_ZERO) NR_ITENS_FALTA ,');
   add('   SUM(ESTOQUE) AS UNID_ESTOQUE');
   add('  FROM');
   add('  (SELECT');
   add('    ID_UNIDADE_FEDERACAO as ID_CD,');
   add('    COMPRA_MERCADORIA.CD_EMPRESA,');
   add('    COMPRA_MERCADORIA.CD_EMPRESA*100 CD_COMPRADOR,');
   add('     nm_empresa as NM_COMPRADOR_REDUZIDO,');
   add('   MERCADORIA.CD_MERCADORIA,');
   add('   COUNT(*) AS NR_ITENS,');
   add('   CASE');
   add('   WHEN DS_NIVEL_ECNM =2  THEN COUNT(*)');
   add('   END NR_ITENS_PER,');
   add('  CASE');
   add('  WHEN ds_nivel_ecnm <>2  THEN COUNT(*)');
   add('  END NR_ITENS_MED,');
   add('');
   add('  SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO) AS ESTOQUE,');
   add('  CASE');
   add('  WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))=0 THEN COUNT(*)');
   add('  WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))>0 THEN 0');
   add('  END NR_ITENS_ZERO');
   add('  FROM');
   add('  PRDDM.DC_MERCADORIA MERCADORIA,');
   add('  PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA,');
   add('  PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
   add('  PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
   add('  PRDDM.DC_COMPRADOR_GAM COMPRADOR');
   add('  ,ACESSO.DC_EMPRESA EMP');

   add('  WHERE');
   add('  MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
   add('   AND COMPRA_MERCADORIA.CD_EMPRESA=emp.cd_empresa');
   add('  AND id_empresa_fisica=''S''');
   add('  AND id_situacao_empresa=''A''');

   add('  AND COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
   add('  AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
   add('  AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
   add('  AND COMPRA_MERCADORIA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
   add('  AND COMPRADOR.NR_COMPRADOR NOT IN(0,5,21)');
   add('  AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
   add(  'AND DT_PRIMEIRA_COMPRA<>''01/01/2039''');
   add('  AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
   if (PnrCD>0) and (PnrCD<>2) then
        Add('AND ESTOQUE_MERCADORIA.CD_EMPRESA=:PnrCd');

   add('  GROUP BY COMPRA_MERCADORIA.CD_EMPRESA,');
   add('  CD_COMPRADOR,');
   add('  NM_COMPRADOR_REDUZIDO,');
   add('  ID_UNIDADE_FEDERACAO,');
   add('  NM_EMPRESA,');

   add('  DS_NIVEL_ECNM,');
   add('  MERCADORIA.CD_MERCADORIA)');
   add('');
   add('  GROUP BY');
   add('  ID_CD,');
   add('  CD_EMPRESA,');
   add('  CD_COMPRADOR,');
   add('  NM_COMPRADOR_REDUZIDO )  INDICE');
   add('');
   add('  LEFT OUTER JOIN');
   add('');
   add(' ( SELECT');
   add(' VENDATOTAL.CD_EMPRESA,');
   add(' VENDATOTAL.CD_COMPRADOR,');
   add(' SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   add(' ,SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO_PERDIDO,');
   add(' CASE');
   add('  WHEN  SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0))>0 THEN ROUND(SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0))/ SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)),4)*100');
   add(' END INDICE_FALTA_FINANCEIRA,');
   add(' CASE');
   add('  WHEN  SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0))>0 THEN 100- ROUND(SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0))/ SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)),4)*100');
   add('  ELSE 0');
   add(' END NIVEL_SERVICO_FINANCEIRA');
   add('');
   add('FROM');
   add('');
   add('(SELECT');
   add(' VENDA.CD_EMPRESA,');
   add('    VENDA.CD_EMPRESA*100 CD_COMPRADOR,');
   add(' SUM(NVL(VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   add(' FROM');
   add(' PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
   add(' LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add(' LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add('');
   add('  WHERE');
   add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
   add(' AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
   add(' GROUP BY');
   add(' VENDA.CD_EMPRESA');
   add(' ,CD_COMPRADOR) VENDATOTAL');
   add(' LEFT OUTER JOIN');
   add('(SELECT');
   add(' VENDA.CD_EMPRESA,');
   add('     VENDA.CD_EMPRESA *100 CD_COMPRADOR,');
   add(' SUM(NVL(VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   add(' FROM');
   add(' PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
   add(' LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add(' LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add(' WHERE');
   add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
   add(' AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
   add(' AND (QT_FISICO - (QT_RESERVADO+QT_RESERVA_PROBLEMATICA+ QT_VENCIDO+ QT_BLOQUEADO))<=0');
   if (PnrCD>0) and (PnrCD<>2) then
       Add('AND ESTOQUE.CD_EMPRESA=:PnrCd');

   add(' GROUP BY');
   add(' VENDA.CD_EMPRESA');
   add('  ,CD_COMPRADOR) VENDAPERDIDA ON   VENDAPERDIDA.CD_EMPRESA= VENDATOTAL.CD_EMPRESA AND  VENDAPERDIDA.CD_COMPRADOR= VENDATOTAL.CD_COMPRADOR');
   add('  GROUP BY');
   add(' VENDATOTAL.CD_EMPRESA');
   add(' ,VENDATOTAL.CD_COMPRADOR');
   add(' ) NIVEL ON NIVEL.CD_EMPRESA=INDICE.CD_EMPRESA AND NIVEL.CD_COMPRADOR=INDICE.CD_COMPRADOR)');
   add('');
   add('UNION ALL');
   add('');
   add('( SELECT');
   add('  ID_CD,');
   add('  INDICE.CD_COMPRADOR,');
   add('  NM_COMPRADOR_REDUZIDO,');
  if idAgrupaFornecedor='S' then
   begin
    add('CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
   end;

   add('  NR_ITENS,');
   add('  NR_ITENS_MED,');
   add('  NR_ITENS_PER,');
   add('  NR_ITENS_FALTA ,');
   add('  UNID_ESTOQUE,');
   add('  CASE');
   add('  WHEN NR_ITENS>0 THEN   ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
   add('  WHEN NR_ITENS=0 THEN 0');
   add('  END INDICE_FALTA_UNITARIA,');
   add('  CASE');
   add('  WHEN NR_ITENS>0 THEN 100 -ROUND((NR_ITENS_FALTA/NR_ITENS)*100,2)');
   add('  WHEN NR_ITENS=0 THEN 0');
   add('  END NIVEL_SERVICO_UNITARIO,');
   add('  INDICE_FALTA_FINANCEIRA,');
   add('  NIVEL_SERVICO_FINANCEIRA');
   add('');
   add('');
   add('  FROM');
   add('  (SELECT');
   add('   ID_CD,');
   add('   CD_COMPRADOR,');
   add('   NM_COMPRADOR_REDUZIDO,');
   if idAgrupaFornecedor='S' then
   begin
    add('CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
   end;
   add('   SUM(nvl(NR_ITENS_MED,0))+SUM(nvl(NR_ITENS_PER,0)) AS NR_ITENS,');
   add('   SUM(nvl(NR_ITENS_MED,0)) NR_ITENS_MED,');
   add('   SUM(nvl(NR_ITENS_PER,0)) NR_ITENS_PER,');
   add('   SUM(NR_ITENS_ZERO) NR_ITENS_FALTA ,');
   add('   SUM(ESTOQUE) AS UNID_ESTOQUE');
   add('  FROM');
   add('  (SELECT');
   add('    ''Geral'' ID_CD,');
   add('     COMPRA_MERCADORIA.CD_EMPRESA,');
   add('     1000  CD_COMPRADOR,');
   add('     ''Indice Geral'' NM_COMPRADOR_REDUZIDO,');
   if idAgrupaFornecedor='S' then
   begin
    add('     1000 CD_GRUPO_FORNECEDOR,');
    add('    ''Indice Geral'' DS_GRUPO_FORNECEDOR,');
   end;
   add('   MERCADORIA.CD_MERCADORIA,');
   add('   COUNT(*) AS NR_ITENS,');
   add('   CASE');
   add('   WHEN DS_NIVEL_ECNM =2  THEN COUNT(*)');
   add('   END NR_ITENS_PER,');
   add('  CASE');
   add('  WHEN ds_nivel_ecnm <>2  THEN COUNT(*)');
   add('  END NR_ITENS_MED,');
   add('');
   add('  SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)) AS ESTOQUE,');
   add('  CASE');
   add('  WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))=0 THEN COUNT(*)');
   add('  WHEN SUM((QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO))>0 THEN 0');
   add('  END NR_ITENS_ZERO');
   add('  FROM');
   add('  PRDDM.DC_MERCADORIA MERCADORIA,');
   add('  PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA,');
   add('  PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
   add('  PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
   add('  PRDDM.DC_COMPRADOR_GAM COMPRADOR');
   //add('  ACESSO.DC_EMPRESA EMP');

   add('  WHERE');
   add('  MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
//   add('   AND COMPRA_MERCADORIA.CD_EMPRESA=emp.cd_empresa');
 //  add(' AND id_empresa_fisica=''S''');
 //  add(' AND id_situacao_empresa=''A''');

   add('  AND COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
   add('  AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
   add('  AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
   add('  AND COMPRA_MERCADORIA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
   add('  AND COMPRADOR.NR_COMPRADOR NOT IN(0,5,21)');
   add('  AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
   add('  AND DT_PRIMEIRA_COMPRA<>''01/01/2039''');
  if (PnrCD>0) and (PnrCD<>2) then
        Add('AND ESTOQUE_MERCADORIA.CD_EMPRESA=:PnrCd');
   add('  AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
   add('  GROUP BY');
   add('   COMPRA_MERCADORIA.CD_EMPRESA,');
   add('  NM_COMPRADOR_REDUZIDO,');
///   add('  ID_UNIDADE_FEDERACAO,');
 //  add('  NM_EMPRESA,');
   add('  DS_NIVEL_ECNM,');
   add('  MERCADORIA.CD_MERCADORIA)');
   add('  GROUP BY');
   add('  ID_CD,');
   add('  CD_COMPRADOR,');
   add('  NM_COMPRADOR_REDUZIDO  )  INDICE');
   add('  LEFT OUTER JOIN');
   add('');
   add(' (  SELECT');
   add(' 1000  CD_COMPRADOR,');
   add(' SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   add(' ,SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO_PERDIDO,');
   add(' CASE');
   add('  WHEN  SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0))>0 THEN ROUND(SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0))/ SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)),4)*100');
   add(' END INDICE_FALTA_FINANCEIRA,');
   add(' CASE');
   add('  WHEN  SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0))>0 THEN 100- ROUND(SUM(NVL(VENDAPERDIDA.VT_FATURAMENTO_BRUTO,0))/ SUM(NVL(VENDATOTAL.VT_FATURAMENTO_BRUTO,0)),4)*100');
   add(' END NIVEL_SERVICO_FINANCEIRA');
   add('');
   add('FROM');
   add('');
   add('(SELECT');
   add('   1000  CD_COMPRADOR,');
   add(' SUM(NVL(VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   add(' FROM');
   add(' PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
   add(' LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add(' LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add('');
   add('  WHERE');
   add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
   add(' AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
   add('  ) VENDATOTAL');
   add(' LEFT OUTER JOIN');
   add('(SELECT');
   add('   1000  CD_COMPRADOR,');
   add(' SUM(NVL(VT_FATURAMENTO_BRUTO,0)) AS VT_FATURAMENTO_BRUTO');
   add(' FROM');
   add(' PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
   add(' LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON ESTOQUE.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add(' LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
   add(' WHERE');
   add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');

   add(' AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
   add(' AND QT_FISICO - (QT_RESERVADO+QT_RESERVA_PROBLEMATICA+ QT_VENCIDO+ QT_BLOQUEADO)<=0 ) VENDAPERDIDA ON   VENDAPERDIDA.CD_COMPRADOR= VENDATOTAL.CD_COMPRADOR');
   add(' ) NIVEL ON  NIVEL.CD_COMPRADOR=INDICE.CD_COMPRADOR )');

    if idAgrupaFornecedor='S' then
     add('ORDER BY  CD_COMPRADOR, CD_GRUPO_FORNECEDOR,ID_CD desc');

   if idAgrupaFornecedor='N' then
     add('ORDER BY  CD_COMPRADOR, ID_CD desc');



   stQry.SaveToFile('c:\temp\qryIndicadoresServico.sql');
   with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        if PnrComprador>0 then
           Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
     if (PnrCD>0) and (PnrCD<>2) then
           Params.ParamByName('PnrCD').AsInteger := PnrCD;
        open;

      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;
(* ****************************************************** *)
{$ENDREGION 'Nivel Servi?o'}
(* ****************************************************** *)


Function AbreFaturamentoMedio(PnrFornecedor,PnrComprador,PnrCD: Integer;idAgrupaCD,idAgrupaFornecedor:String):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin

    end;
  finally

  end;
end;


function MotivosMudancaCurva(PidTipo:String):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT');
      SQL.Add('CD_MOTIVO, DS_MOTIVO, ID_MOTIVO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MOTIVOS');
      SQL.Add('WHERE');
      SQL.Add('ID_MOTIVO = :PidMotivo');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PidMotivo').AsString := PidTipo;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function getMotivosMudancaCurva(PidTipo,PdsMotivo:String):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT');
      SQL.Add('CD_MOTIVO, DS_MOTIVO, ID_MOTIVO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MOTIVOS');
      SQL.Add('WHERE');
      SQL.Add('ID_MOTIVO = :PidMotivo');
      SQL.Add(' and  DS_MOTIVO = :PdsMotivo');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PidMotivo').AsString := PidTipo;
      Params.ParamByName('PdsMotivo').AsString := PdsMotivo;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function InsertMotivosMudancaCurva(PidTipo,PdsMotivo:String;PcdMotivo:Integer):Boolean;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
  cdMotivo:integer;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    cdMotivo:=Incrementa('PRDDM.DC_MOTIVOS','CD_MOTIVO');
    with QryTemp do
    begin
      Close;
      SQL.Add('INSERT INTO PRDDM.DC_MOTIVOS');
      SQL.Add('(CD_MOTIVO, DS_MOTIVO, ID_MOTIVO)');
      SQL.Add('VALUES');
      SQL.Add('(:PCD_MOTIVO, :PDS_MOTIVO, :PID_MOTIVO)');
      ParamByName('PCD_MOTIVO').Asinteger := cdMotivo;
      ParamByName('PDS_MOTIVO').AsString := PdsMotivo;
      ParamByName('PID_MOTIVO').AsString := PidTipo;
      Result:=true;
      if ExecSQL(false)=0 then
         Result:=false;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function GravaTabelaPrazo(PnrParcela,PnrDiasPrazo,PnrCondicao:Integer):boolean;
begin
   _dm._cdsPrazo.Open;
   _dm._cdsPrazo.append;
   _dm._cdsPrazonrParcela.AsInteger:=PnrParcela;
   _dm._cdsPrazonrDiasPrazo.AsInteger:=PnrDiasPrazo;
   _dm._cdsPrazonrCondicao.AsInteger:=PnrCondicao;
   _dm._cdsPrazo.post;
end;

//Gera nUmero Temporario
function NumeroTemporarioAuditoria(PnrComprador:Integer):Integer;
var
NrTemporario:Integer;
begin
    NrTemporario:=Random(9999);
    NrTemporario:=strtoint(inttostr(PnrComprador)+ FormatFloat('0000',NrTemporario));
    result:=NrTemporario;
end;



Function AbreGradeProduto(PnrFornecedor,PnrCD: Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    _cdsTemp.ReadOnly:=false;
    with stQry do
    begin
     Add('SELECT');
     Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_MERCADORIA,');
     Add(' COMPRA.CD_EMPRESA,');
     Add(' NM_MERCADORIA,');
     Add(' DS_APRESENTACAO_MERCADORIA,');
     Add(' trim(NM_MERCADORIA)||''  ''||trim(DS_APRESENTACAO_MERCADORIA) AS NM_COMPLETO,');
     Add(' QT_EMBALAGEM_COMPRA,');
     Add(' QT_CAIXA_CAMADA,');
     Add(' QT_CAIXA_PALETE,');
     Add(' MERCADORIA.CD_MERCADORIA AS NR_MERCADORIA,');
     Add(' NR_DV_MERCADORIA AS NR_DIGITO_MERCADORIA,');
     Add(' rownum  AS NR_SEQUENCIA,');
     Add(' QT_EMBALAGEM_COMPRA,');
     Add(' CD_INTERNO_LABORATORIO,');
     Add(' ESTOQUE.ID_SITUACAO_MERCADORIA AS ID_INATIVO,');
     Add(' ID_INATIVACAO_FUTURA,');
     Add(' 0 AS QT_SUGESTAO_IDEAL,');
     Add(' 0 AS QT_SUGESTAO_POSSIVEL,');
     Add(' 0 AS NR_DIAS_ESTOQUE,');
     Add(' 0.00 AS VL_MEDIA_MENSAL,');
     Add(' 0.00 AS VL_MEDIA_DIARIA,');
     Add(' 0 AS NR_QUANTIDADE_PEDIDO,');
     Add(' 0 AS NR_UNIDADES_MENSAL,');
     Add(' 0 AS NR_COBERTURA_ESTOQUE,');
     Add(' 0 AS NR_COBERTURA_ESTOQUE_PENDENCIA,');
     Add(' 0 AS NR_UNIDADES_PENDENTES,');
     Add(' QT_FISICO - QT_RESERVADO - QT_RESERVA_PROBLEMATICA  - QT_VENCIDO AS  NR_UNIDADES_ESTOQUE,');
     Add(' VL_PRECO_COMPRA AS VL_PRECO_FABRICANTE,');
     Add(' COMPRA.ID_CURVA_MERCADORIA AS  ID_CURVA,');
     Add(' 0.00 AS VL_VERBA,');
//     Add(' PC_REPASSE_COMPRA AS PC_REPASSE,');
     Add(' 0.00 AS PC_REPASSE,');
     Add(' PC_DESCONTO_PADRAO_COMPRA AS PC_DESCONTO_PADRAO,');
     Add(' 0.00 AS PC_DESCONTO_ADICIONAL,');
     ADD('CASE');
     Add(' WHEN COMPRA.CD_EMPRESA=1 THEN  ''SC''');
     Add(' WHEN COMPRA.CD_EMPRESA=4 THEN  ''RS''');
     ADD('END  ID_LOCAL_CD,');
     Add('');
     Add(' QT_RESERVADO,');
     Add(' QT_VENCIDO , ');
     Add(' QT_RESERVA_PROBLEMATICA,');
     Add('');
     Add(' QT_FISICO,');
     Add(' QT_PEDIDO,');
     Add(' QT_BLOQUEADO ,');
     Add('');
     Add('');
     Add('');
     Add(' DS_SIGLA_MERCADORIA,DS_SIGLA_RESUMIDA,');
     Add(' NR_LISTA_ABAFARMA,');
     Add(' ID_REFRIGERADO,ID_VENDA_EXCLUSIVA_HOSPITALAR,');
     Add(' ID_ORGAO_PUBLICO, ID_ORIGEM_MERCADORIA,');
     Add(' DS_UNIDADE_MEDIDA,');
     Add(' QT_PESO_MERCADORIA,');
     Add(' QT_EMBALAGEM_VENDA,');
     Add('');
     Add('');
     Add(' mercadoria.ID_SITUACAO_MERCADORIA,');
     Add(' CD_EAN_COMPRA,  CD_EAN_VENDA,');
     Add(' QT_LARGURA_MERCADORIA, QT_ALTURA_MERCADORIA,');
     Add(' QT_PROFUNDIDADE_MERCADORIA, QT_LARGURA_CAIXA,');
     Add(' QT_ALTURA_CAIXA, QT_PROFUNDIDADE_CAIXA,');
     Add(' ((QT_LARGURA_MERCADORIA * QT_ALTURA_MERCADORIA');
     Add(' *QT_PROFUNDIDADE_MERCADORIA)/1000000) AS MTS_CUBICO,');
     Add(' ID_INATIVACAO_FUTURA, COMPRA.DT_INATIVACAO, DS_OBSERVACAO_INATIVACAO,');
     Add(' ID_VENDA_MERCADO, ID_REVISTA,');
     Add(' CD_FAMILIA_MARKETING, NR_FAMILIA_MERCADORIA,');
     Add(' NR_NCM, DS_MINISTERIO_SAUDE,');
     Add(' DS_NIVEL_ECNM, DS_NIVEL_EMAM, DS_NIVEL_ERGM, DS_NIVEL_EPRM, DS_NIVEL_ERTM,');
     Add(' DS_NIVEL_ECTM, DS_NIVEL_EITM, DS_NIVEL_ESIM,');
     Add(' VL_PESO_CAIXA,NR_EXTENSAO_IPI, MERCADORIA.ID_CALCULA_PRECO,');
     Add(' QT_MULTIPLO_ALIMENTAR, QT_MULTIPLO_FARMA,');
     Add(' ID_PACK_PROMOCIONAL, ID_VINCULADO_PACK,');
     Add(' VL_TEMPERATURA_MINIMA, VL_TEMPERATURA_MAXIMA,');
     Add(' DS_MERCADORIA, DT_ATUALIZACAO_SID, DT_ATUALIZACAO_MERCADORIA,');
     Add(' COMPRA.CD_GRUPO_FORNECEDOR,');
     Add(' ID_REPASSE_ICMS, ID_SUPERFLUO, ID_RETEM_ICMS, ID_CIPADO,');
     Add(' ID_TIPO_LISTA_FISCAL,ID_REDUCAO_BASE, ID_TRIBUTACAO_NFE,');
     Add(' CD_TRIBUTACAO_ICMS, CD_CST, CD_CST_PIS_VENDA,CD_CST_COFINS_VENDA,');
     Add(' CD_CST_ENTRADA, CD_CST_SAIDA, PC_CREDITO_ICMS, PC_MARGEM_VENDA,');
     Add(' PC_MARGEM_VENDA_ALIMENTAR, PC_IPI_MERCADORIA, DT_CADASTRO_MERCADORIA,');
     Add(' DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA, ID_COFINS, ID_PIS,');
     Add(' VL_PRECO_VENDA,VL_PRECO_VENDA_ANTERIOR,');
     Add(' VL_PRECO_COMPRA_ANTERIOR,');
     Add(' ID_VENDA_AUTORIZADA, ID_PROMOCAO_COTACAO_QTD,DT_ATUALIZACAO_FISCAL,');
     Add(' PC_DESCONTO_PADRAO_COMPRA,');
     Add(' COMPRA.ID_SITUACAO_MERCADORIA  AS ID_SITUACAO_COMPRA,CD_CST_PIS_COMPRA,');
     Add(' CD_CST_COFINS_COMPRA,0.00 as PC_REPASSE_COMPRA,');
     Add(' DT_PRIMEIRA_COMPRA,CD_LOCALIZACAO,');
     Add(' QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
     Add(' QT_RESERVA_PROBLEMATICA,');
     Add(' QT_VENCIDO ,');
     Add(' QT_BLOQUEADO ,');
     Add(' QT_FISICO - QT_RESERVADO - QT_RESERVA_PROBLEMATICA  - QT_VENCIDO  AS ESTOQUE,');
     Add(' DT_ATUALIZACAO_ESTOQUE,');
     Add(' ESTOQUE.ID_SITUACAO_MERCADORIA as ID_SITUACAO_ESTOQUE,');
     Add(' VT_CUSTO_FINANCEIRO_MERCADORIA,');
     Add(' DT_ATUALIZACAO_PRECO_VENDA,VL_CUSTO_GERENCIAL,');
     Add(' NR_VERBA_GERACAO,PC_VERBA_GERACAO');

     Add('');
     Add(' FROM');
     Add(' PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
//     Add(' PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,');
     Add(' PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
     Add(' PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
     Add(' PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     Add(' PRDDM.DC_MERCADORIA  MERCADORIA ');
     Add(' LEFT OUTER JOIN PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA ON LOGISTICA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
     Add(' LEFT OUTER JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
     Add(' WHERE');
     Add(' MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
     Add(' AND MERCADORIA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
     Add(' AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
     Add(' AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
//     Add(' AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add(' AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
  //   Add(' AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
  //   Add(' AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add(' AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
     Add(' AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
     Add(' AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
    // Add(' AND FINANCEIRO.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add(' AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
     Add(' AND ESTOQUE.ID_SITUACAO_MERCADORIA <>''I''');
     Add(' AND COMPRA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     Add(' AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     if (PnrCD=1) OR (PnrCD=4) then
     Add(' AND COMPRA.CD_EMPRESA=:PnrEmpresa');
     stqry.SaveToFile('c:\temp\qryGradeproduto.sql');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
        if (PnrCD=1) OR (PnrCD=4) then
            Params.ParamByName('PnrEmpresa').AsInteger:=PnrCD;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
         result:=_cdstemp

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


function  EnviaErroaoSuporte(Para, CC, Mensagem: String):Boolean;
 var
   OutlookApp,
   Mapi, Msg  : Variant;
   BitMap     : TBitMap;
 begin
   OutlookApp := CreateOleObject('Outlook.Application');
   try
     Mapi := OutlookApp.GetNameSpace('MAPI');
     Msg := Mapi.Application.CreateItem(0);
     Msg.Subject := 'Erro no aplicativo '+UpperCase(Application.Title);
     Msg.To := Para;
     Msg.CC := CC;
     Msg.Body := 'Ocorreu um erro na m?quina : '+GetNetStation(1)+#13+
       'Esta m?quina encontra-se no grupo : '+GetNetStation(2)+#13+
       'A mensagem de erro ? : '+#13+Mensagem+#13+#13+
       'A tela que o usu?rio utilizava antes do erro segue em anexo.'+#13;

     // Captura e salva a tela atual antes do erro para anex?-la e enviar ao suporte.
     BitMap := TBitmap.Create;
     BitMap := CaptureScreenRect(Bounds(0,0,Screen.Width,Screen.Height));
     BitMap.SaveToFile(ExtractFilePath(Application.ExeName)+'erro.bmp');
     BitMap.Free;
     Msg.Attachments.Add(ExtractFilePath(Application.ExeName)+'erro.bmp');

     // Envia o email.
     Msg.Send;
   finally
     OutlookApp := Unassigned;
   end;
 end;



function GetNetStation(Tipo:Integer) : string;
// Requer a Registry declarada na clausula uses da unit
// Tipo : 1 - Nome do Computador na rede
// 2 - Nome do Grupo de trabalho
// 3 - Descri??o do computador na rede
var
Reg : TRegistry;
begin
Reg := TRegistry.create;
Result := '(n/a)';
with Reg do
try
 RootKey := HKEY_LOCAL_MACHINE;
 if OpenKey('SystemCurrentControlSetServicesVxDVNETSUP', false) then
 begin
   Case Tipo of
    1: Result := ReadString('ComputerName');
    2: Result := ReadString('Workgroup');
    3: Result := ReadString('Comment');
  end;
 end;
Finally
 CloseKey;
 free;
end;
end;


function CaptureScreenRect(ARect: TRect): TBitmap;
// Captura a tela e salva-a em um Bitmap
// Use-a assim:
// Image1.picture.Assign(CaptureScreenRect(Rect(0,0,Width,Height)));
var
   ScreenDC: HDC;
begin
   Result := TBitmap.Create;
   with Result, ARect do
   begin
      Width := Right - Left;
      Height := Bottom - Top;
      ScreenDC := GetDC(0);
      try
         BitBlt(Canvas.Handle, 0, 0, Width, Height, ScreenDC, Left, Top, SRCCOPY);
      finally
         ReleaseDC(0, ScreenDC);
      end;
      //    Palette := GetSystemPalette;
   end;
end;




function ExecutaPontoEncomenda(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var

   stQry  :TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry :=TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT');
      Add('COD_PRODUTO,');
      Add('NM_MERCADORIA,');
      Add('APRESENTACAO_MERCADORIA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('VL_UNITARIO_COMPRA,');
      Add('DT_AGENDA,');

      add('case');
      add('WHEN (DT_AGENDA - Trunc(SYSDATE))>0 then  (DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE');
      add('else QT_DIAS_LEADTIME_FABRICANTE');
      Add('end NR_DIAS,');
      Add('ESTOQUE_DISPONIVEL,');
      Add('QT_PENDENTE,');
      Add('QT_VENDA,');
      Add('MEDIA_DIA,');
      Add('VL_MEDIA_DIARIA,');
      Add('CASE');
      Add('WHEN MEDIA_DIA> 0 THEN ROUND(ESTOQUE_DISPONIVEL/MEDIA_DIA,0)');
      Add('END NR_DIAS_ESTOQUE,');
      Add('CASE');
      Add('WHEN (DT_AGENDA - Trunc(SYSDATE))>0 then');
      Add('Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0)');
      add(' ELSE QT_DIAS_LEADTIME_FABRICANTE * MEDIA_DIA');
      add('END NR_PREVISAO_VENDA,');
      Add('');
      Add('(( ESTOQUE_DISPONIVEL) -  Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0)) PR_ESTQ_COM_PENDENCIA,');
      Add('(( ESTOQUE_DISPONIVEL) - Round((((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE)) * MEDIA_DIA,0)) AS PR_ESTQ_SEM_PENDENCIA,');
      Add('CD_GRUPO_CURVA_FABRICANTE,');
      Add('CD_GRUPO_FORNECEDOR  ,');
      Add('DS_GRUPO_FORNECEDOR,');
      Add('CD_COMPRADOR,');
      Add('ID_CURVA_MERCADORIA,');
      Add('CD_EMPRESA,');
      Add('QT_ESTOQUE_MAXIMO,');
      Add('QT_ESTOQUE_MINIMO,');
      Add('DIAS_ESTOQUE_ZERO,');
      Add('QT_DIAS_FREQUENCIA_COMPRA,');
      Add('QT_DIAS_LEADTIME_FABRICANTE,');
      Add('CASE');
      Add('  WHEN QT_SUGERIDA_COM_PENDENCIA>0 THEN QT_SUGERIDA_COM_PENDENCIA');
      Add('  ELSE 0');
      Add('END QT_SUGERIDA_COM_PENDENCIA,');
      Add('CASE');
      Add('  WHEN QT_SUGERIDA_SEM_PENDENCIA>0 THEN QT_SUGERIDA_SEM_PENDENCIA');
      Add('  ELSE 0');
      Add('END QT_SUGERIDA_SEM_PENDENCIA,');
      Add('NR_PRODUTO');
      Add('');
      Add('from');
      Add('((SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+MERCADORIA.NR_DV_MERCADORIA AS COD_PRODUTO,');
      Add('MERCADORIA.NM_MERCADORIA AS NM_MERCADORIA,');
      Add('MERCADORIA.DS_APRESENTACAO_MERCADORIA AS APRESENTACAO_MERCADORIA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('VL_UNITARIO_COMPRA,');
      Add('COMPRA_MERCADORIA.ID_CURVA_MERCADORIA,');
      Add('GF.CD_GRUPO_CURVA_FABRICANTE,');
      Add('TRUNC(GF.DT_AGENDAMENTO) DT_AGENDA,');
      Add('GF.CD_GRUPO_FORNECEDOR  ,');
      Add('DS_GRUPO_FORNECEDOR,');
      Add('CD_COMPRADOR,');
      Add('COMPRA_MERCADORIA.CD_EMPRESA,');
      Add('QT_VENDA,');
      Add('CASE');
      Add('  WHEN (NR_DIAS- DIAS_ESTOQUE_ZERO)>0 THEN TRUNC(QT_VENDA/(NR_DIAS-DIAS_ESTOQUE_ZERO),2)');
      Add('ELSE');
      Add('  0');
     Add('END MEDIA_DIA,');
      add('VL_MEDIA_DIARIA,');
        Add('NVL(DIAS_ESTOQUE_ZERO,0) AS DIAS_ESTOQUE_ZERO,');
      Add('GFM.QT_DIAS_FREQUENCIA_COMPRA,');
      Add('QT_DIAS_LEADTIME_FABRICANTE,');
      Add('');
      Add('      GFM.QT_ESTOQUE_MAXIMO,GFM.QT_ESTOQUE_MINIMO,');
      Add('(QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) AS ESTOQUE_DISPONIVEL,');
      Add(' NVL(QT_PENDENTE,0) AS QT_PENDENTE,');
      Add('CASE');
      Add('WHEN (NR_DIAS-NVL(DIAS_ESTOQUE_ZERO,0))>0 THEN');
      Add('   ROUND( (((GFM.QT_ESTOQUE_MAXIMO + QT_DIAS_LEADTIME_FABRICANTE) * (QT_VENDA/(NR_DIAS-DIAS_ESTOQUE_ZERO)) -');
      Add('    ((QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) ))/ QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
      Add('END QT_SUGERIDA_COM_PENDENCIA,');
      Add('CASE');
      Add('WHEN (NR_DIAS-NVL(DIAS_ESTOQUE_ZERO,0))>0 THEN');
      Add('   ROUND( (((GFM.QT_ESTOQUE_MAXIMO + QT_DIAS_LEADTIME_FABRICANTE) * (QT_VENDA/(NR_DIAS-DIAS_ESTOQUE_ZERO)) -');
      Add('    ((QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) ))/ QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
      Add('END QT_SUGERIDA_SEM_PENDENCIA,MERCADORIA.CD_MERCADORIA as NR_PRODUTO');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA  MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA ON ESTOQUE_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON  COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
      Add('                                                                AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      Add('');
      Add('LEFT JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM ON GFM.CD_GRUPO_CURVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE AND GFM.ID_CURVA_MERCADORIA=COMPRA_MERCADORIA.ID_CURVA_MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA MAXIMO ON MAXIMO.CD_GRUPO_CURVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE');
      Add('                                             AND  COMPRA_MERCADORIA.ID_CURVA_MERCADORIA=MAXIMO.ID_CURVA_MERCADORIA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT');
      Add('CD_MERCADORIA,NVL(MAX(VL_BASE_COMPRA),0) AS VL_UNITARIO_COMPRA,nvl(max(PC_ICMS_COMPRA),0) asPC_ICMS_COMPRA , nvl(max(VL_BASE_COMPRA),0) as VL_BASE_COMPRA');
      Add(',CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR A');
      Add('WHERE');
      Add('TRUNC(A.DT_MUDANCA_PRECO)=(SELECT MAX(B.DT_MUDANCA_PRECO)');
      Add('FROM');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR B,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('WHERE COMPRA.CD_MERCADORIA=B.CD_MERCADORIA');
      Add('AND A.CD_MERCADORIA=B.CD_MERCADORIA');
      Add('AND COMPRA.CD_EMPRESA=B.CD_EMPRESA');
      Add('AND TRUNC(B.DT_ATUALIZACAO) <=TRUNC(SYSDATE) AND B.CD_EMPRESA= A.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA');
      Add(',CD_EMPRESA');
      Add(') LISTA_PRECO ON LISTA_PRECO.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('       AND LISTA_PRECO.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
      Add('');
      Add('  LEFT OUTER JOIN (SELECT');
      Add('CD_MERCADORIA AS NR_PRODUTO_2,');
      Add('CD_EMPRESA_02,');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
      Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
      Add('SUM(NR_DIAS_DIV) AS NR_DIAS_DIV,');
      Add('SUM(QT_VENDIDA) AS QT_VENDA,');
      Add('Sum(QT_MEDIA_VENDA_DIARIA) AS VL_MEDIA_DIARIA,');
      Add('ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0) -  ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) AS NR_DIAS');
      Add('FROM');
      Add('(SELECT');
      Add('CM.CD_MERCADORIA ,');
      Add('VM.CD_EMPRESA AS CD_EMPRESA_02,');
      Add('SUM(QT_VENDIDA) QT_VENDIDA,');
      Add('CASE');
      Add('WHEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)= EXTRACT(MONTH FROM SYSDATE) THEN  Sum(qt_media_venda_diaria)');
//      Add('ELSE 0');
      Add('END QT_MEDIA_VENDA_DIARIA,');

      Add('CASE');
      Add('WHEN CD_OPERADOR_LOGISTICO=1 THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
      Add('END QT_DIAS_ESTOQUE_ZERO,');
      Add('');
      Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
      Add('           (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),-1)  - TRUNC(MAX(DT_VENDA_MERCADORIA))) NR_DIAS_DIV');
      Add('FROM');
      Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
      add('and cd_operador_logistico=1');
      Add('AND    VM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('');
      Add('AND CD_GRUPO_FORNECEDOR>0');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND DT_VENDA_MERCADORIA< ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA,CD_EMPRESA_02) VENDA ON VENDA.NR_PRODUTO_2 = MERCADORIA.CD_MERCADORIA AND ESTOQUE_MERCADORIA.CD_EMPRESA=CD_EMPRESA_02');

      Add('LEFT OUTER JOIN (SELECT  DATP_P,');
      Add('NROM_Y,');
      Add('QUAY_Y-CHEY_Y AS QT_PENDENTE,');
      Add('ITEM.CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM_P');
      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND SITP_P IN(''P'',''N'',''T'')');
      Add('AND SITY_Y IN(''P'',''N'',''T'')');
      Add('AND ITEM.cd_operacao_rede in(0,1)');
      Add('AND NROM_Y=CM_P.CD_MERCADORIA');
      Add('AND ITEM.CD_EMPRESA=CM_P.CD_EMPRESA ) PENDENCIA');
      Add('ON PENDENCIA.NROM_Y=MERCADORIA.CD_MERCADORIA AND COMPRA_MERCADORIA.CD_EMPRESA=PENDENCIA.CD_EMPRESA');
      Add('WHERE');
      Add('MERCADORIA.CD_MERCADORIA>0');
      if PnrFornecedor>0 then
         Add('AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
         Add('AND CD_COMPRADOR=:PnrComprador');
      Add('AND DT_PRIMEIRA_COMPRA<>''01/01/2039''');

      Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
      Add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''))');
     // Add('AND TRUNC(GF.DT_AGENDAMENTO)>SYSDATE))');
      Add('WHERE');
      Add('COD_PRODUTO>0');

//      --SQL.Add('(ESTOQUE_DISPONIVEL  +qt_pendente ) -  Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0) <0');
       if PnrEmpresa>0 then
          Add('AND CD_EMPRESA=:PnrEmpresa');
//      SQL.Add('ORDER by CD_GRUPO_FORNECEDOR,NM_MERCADORIA,APRESENTACAO_MERCADORIA,CD_EMPRESA');
      end;
      stQry.SaveToFile('c:\temp\QryPontoEncomendaSistema.sql');
      with _cdsTemp do
      begin
       close;
       CommandText:=stQry.Text;
       if PnrComprador >0 then
          Params.ParamByName('PnrComprador').AsInteger := PnrComprador;

       if PnrEmpresa>0 then
          Params.ParamByName('PnrEmpresa').AsInteger   := PnrEmpresa;
       if PnrFornecedor>0 then
          Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       open;
      end;
      result:=nil;
      if not _cdsTemp.IsEmpty then
         result:=_cdsTemp;

  finally
      freeAndNil(stQry);
  end;
end;




function Pendencia(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT   CM1.CD_MERCADORIA AS  NR_PRODUTO');
      Add(',MIN(PREP_P) AS DT_PREVISAO_CHEGADA,');
      Add('CM1.CD_COMPRADOR,');
      Add('NVL(SUM(QUAY_Y  - CHEY_Y),0) AS QT_PENDENTE,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y ) * PFBY_Y),0) AS VTPENDENCIAFABRICA,');
      Add('NVL(SUM(( QUAY_Y - CHEY_Y )  * VCCI_Y),0) AS VTPENDENCIACUSTO,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA ,ITEM.CD_EMPRESA AS CD_PENDENCIA_EMPRESA');
      Add('FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM1,');
      Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
      Add('PRDDM.DC_MERCADORIA M1');
      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND NROM_Y=CM1.CD_MERCADORIA');
      Add('AND CM1.CD_MERCADORIA=M1.CD_MERCADORIA');
      Add('AND GF.CD_GRUPO_FORNECEDOR=CM1.CD_GRUPO_FORNECEDOR');
      Add('AND ITEM.CD_EMPRESA=CM1.CD_EMPRESA');
      Add('AND SITP_P IN(''N'',''P'',''T'')');
      Add('AND SITY_Y IN(''N'',''P'',''T'')');
      Add('AND ITEM.cd_operacao_rede in(0,1)');
      Add('AND CM1.CD_GRUPO_FORNECEDOR >0');
     // Add('AND PREP_P>=TRUNC(SYSDATE)');
    //  Add('AND TRUNC(PREP_P)   <=TRUNC(DT_AGENDAMENTO)');
      if PnrComprador>0 then
         Add('AND CM1.CD_COMPRADOR=:PnrComprador');
      if PnrFornecedor>0 then
         Add('AND CM1.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('GROUP BY CM1.CD_MERCADORIA,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,ITEM.CD_EMPRESA,CM1.CD_COMPRADOR');
    end;
    stQry.SaveToFile('c:\temp\qryPendenciaSistema.sql');
    with _cdsTemp do
    begin
       close;
       CommandText:=stQry.Text;
       if PnrComprador >0 then
          Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
       if PnrFornecedor>0 then
          Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       open;
      end;
      result:=nil;
      if not _cdsTemp.IsEmpty then
         result:=_cdsTemp;

  finally
     FreeAndNil(stQry);
  end;
end;



function AbreDadosComprador(PnrComprador:Integer):TDadosComprador;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('NM_COMPRADOR,DS_EMAIL_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('NR_COMPRADOR=:PnrComprador');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;
      open;
    end;
     Result.nrComprador           :=0;
     Result.nmCompradorReduzido  :='';
     Result.nmCompradorReduzido           :='';
     Result.dsEmailCcomprador     :='';
    if not _cdsTemp.IsEmpty then
    begin
       Result.nrComprador          :=_cdsTemp.FieldByName('NR_COMPRADOR').AsInteger;
       Result.nmCompradorReduzido  :=_cdsTemp.FieldByName('NM_COMPRADOR_REDUZIDO').AsString;
       Result.nmCompradorReduzido  :=_cdsTemp.FieldByName('NM_COMPRADOR').AsString;
       Result.dsEmailCcomprador     :=_cdsTemp.FieldByName('DS_EMAIL_COMPRADOR').AsString;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function GetCompradores(PnrComprador:Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('DS_EMAIL_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('NR_COMPRADOR NOT IN(0,20) ORDER BY NM_COMPRADOR_REDUZIDO ');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      open;
    end;
    Result:=nil;
    if not _cdsTemp.IsEmpty then
    begin
    Result:=_cdsTemp;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function GetTabelaMercadoria(PnrFornecedor ,PcdOperadorLogistico: Integer): TClientDataset;
var
  DadosFornecedor: TDadosFornecedor;
  stQry: TStringList;
 _cdsTemp:TClientDataSet;

begin
try
  if stQry<>nil then
     stQry:=nil;
  stQry :=TStringList.Create;
  _cdsTemp := TClientDataSet.Create(nil);
  _cdsTemp.RemoteServer := _dm._LocalConexao;
  _cdsTemp.ProviderName := '_dspGenerica';

  with stQry do
  begin
    Clear;
    Add('SELECT ');
    Add('MERCADORIA.CD_MERCADORIA,NR_DV_MERCADORIA,');
    Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    Add('NM_MERCADORIA||''  ''||DS_APRESENTACAO_MERCADORIA AS NM_COMPLETO,');
    Add('DS_SIGLA_MERCADORIA,DS_SIGLA_RESUMIDA,');
    Add('NR_LISTA_ABAFARMA,');
    Add('ID_REFRIGERADO,ID_VENDA_EXCLUSIVA_HOSPITALAR,');
    Add('ID_ORGAO_PUBLICO, ID_ORIGEM_MERCADORIA,');
    Add('CD_INTERNO_LABORATORIO,DS_UNIDADE_MEDIDA,');
    Add('QT_PESO_MERCADORIA, QT_EMBALAGEM_COMPRA,');
    Add('QT_EMBALAGEM_VENDA, mercadoria.ID_SITUACAO_MERCADORIA,');
    Add('CD_EAN_COMPRA,  CD_EAN_VENDA,');
    Add('QT_LARGURA_MERCADORIA, QT_ALTURA_MERCADORIA,');
    Add('QT_PROFUNDIDADE_MERCADORIA, QT_LARGURA_CAIXA,');
    Add('QT_ALTURA_CAIXA, QT_PROFUNDIDADE_CAIXA,');
    Add('((QT_LARGURA_MERCADORIA * QT_ALTURA_MERCADORIA');
    Add('*QT_PROFUNDIDADE_MERCADORIA)/1000000) AS MTS_CUBICO,');
    Add('ID_INATIVACAO_FUTURA, COMPRA.DT_INATIVACAO, DS_OBSERVACAO_INATIVACAO,');
    Add('ID_VENDA_MERCADO, ID_REVISTA,');
    Add('CD_FAMILIA_MARKETING, NR_FAMILIA_MERCADORIA,');
    Add('NR_NCM, DS_MINISTERIO_SAUDE,');
    Add('DS_NIVEL_ECNM, DS_NIVEL_EMAM, DS_NIVEL_ERGM, DS_NIVEL_EPRM, DS_NIVEL_ERTM,');
    Add('DS_NIVEL_ECTM, DS_NIVEL_EITM, DS_NIVEL_ESIM,');
    Add('VL_PESO_CAIXA,NR_EXTENSAO_IPI, MERCADORIA.ID_CALCULA_PRECO,');
    Add('QT_MULTIPLO_ALIMENTAR, QT_MULTIPLO_FARMA,');
    Add('ID_PACK_PROMOCIONAL, ID_VINCULADO_PACK,');
    Add('VL_TEMPERATURA_MINIMA, VL_TEMPERATURA_MAXIMA,');
    Add('DS_MERCADORIA, DT_ATUALIZACAO_SID, DT_ATUALIZACAO_MERCADORIA,');
    Add('CD_GRUPO_FORNECEDOR,');
    Add('ID_REPASSE_ICMS, ID_SUPERFLUO, ID_RETEM_ICMS, ID_CIPADO,');
    Add('ID_TIPO_LISTA_FISCAL,ID_REDUCAO_BASE, ID_TRIBUTACAO_NFE,');
    Add('CD_TRIBUTACAO_ICMS, CD_CST, CD_CST_PIS_VENDA,CD_CST_COFINS_VENDA,');
    Add('CD_CST_ENTRADA, CD_CST_SAIDA, PC_CREDITO_ICMS, PC_MARGEM_VENDA,');
    Add('PC_MARGEM_VENDA_ALIMENTAR, PC_IPI_MERCADORIA, DT_CADASTRO_MERCADORIA,');
    Add('DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA, ID_COFINS, ID_PIS,');
    Add('VL_PRECO_COMPRA,VL_PRECO_VENDA,VL_PRECO_VENDA_ANTERIOR,');
    Add('VL_PRECO_COMPRA_ANTERIOR,');
    Add('ID_VENDA_AUTORIZADA, ID_PROMOCAO_COTACAO_QTD,DT_ATUALIZACAO_FISCAL,');
    Add('PC_DESCONTO_PADRAO_COMPRA,COMPRA.ID_SITUACAO_MERCADORIA');
    Add('AS ID_SITUACAO_COMPRA,CD_CST_PIS_COMPRA,');
    Add('CD_CST_COFINS_COMPRA,0.00 as PC_REPASSE_COMPRA,COMPRA.ID_CURVA_MERCADORIA,');
    Add('DT_PRIMEIRA_COMPRA,CD_LOCALIZACAO, QT_CXA_CAMADA_LOGISTICO,');
    Add('QT_CXA_PALETE_LOGISTICO,QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
    Add('QT_CAIXA_CAMADA,QT_CAIXA_PALETE,');
    Add('QT_RESERVA_PROBLEMATICA,QT_VENCIDO ,QT_BLOQUEADO ,');
    Add('(QT_FISICO - QT_RESERVADO -  QT_RESERVA_PROBLEMATICA');
    Add('- QT_VENCIDO)  AS ESTOQUE,');
    Add('DT_ATUALIZACAO_ESTOQUE, ESTOQUE.ID_SITUACAO_MERCADORIA');
    Add('as ID_SITUACAO_ESTOQUE,VT_CUSTO_FINANCEIRO_MERCADORIA,');
    Add('DT_ATUALIZACAO_PRECO_VENDA,CD_COMPRADOR,COMPRA.CD_EMPRESA');
    Add('FROM');
    Add('PRDDM.DC_MERCADORIA  MERCADORIA,');
    Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    Add('PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,');
    Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
    Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
    Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
    Add('WHERE');
    Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    Add('AND MERCADORIA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
    Add('AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
    Add('AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    Add('AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    Add('AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
    Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    Add('AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    Add('AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
    Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
    Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
    Add('AND FINANCEIRO.CD_EMPRESA=ESTOQUE.CD_EMPRESA');

    Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
    Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
   end;
    stQry.savetofile('c:\temp\QryTabelaProdutoCompra.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
      open;
    end;
    Result:=nil;
    if not _cdsTemp.IsEmpty then
    Result:=_cdsTemp;


finally

  FreeAndNil(stQry);

end;
END;



Function GetTabelaQuantidadeEmbalagem(PnrFornecedor: Integer): TClientDataSet;
var
  tempQuery: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  tempQuery := nil;

  _cdsTemp := TClientDataSet.Create(nil);
  _cdsTemp.RemoteServer := _dm._LocalConexao;
  _cdsTemp.ProviderName := '_dspGenerica';

  try
    tempQuery := TSQLQuery.Create(nil);
    tempQuery.SQLConnection := _dm._conexao;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT DISTINCT cm.CD_MERCADORIA,QT_EMBALAGEM');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_WMS_LOCALIZACAO WM,');
    tempQuery.SQL.Add('prddm.DC_compra_mercadoria CM');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('wm.CD_MERCADORIA=cm.CD_MERCADORIA');
    tempQuery.SQL.Add('AND cd_grupo_fornecedor=:PnrFornecedor');
    with _cdsTemp do
    begin
      close;
      CommandText:=tempQuery.Text;
      Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
      open;
    end;
    Result:=nil;
    if not _cdsTemp.IsEmpty then
       Result:=_cdsTemp;
  finally
    FreeAndNil(tempQuery);
  end;
end;



function GetTabelaLaboratorio(PnrFornecedor: Integer): TClientDataSet;
var
  tempQuery: TSQLQuery;
  DadosFornecedor: TDadosFornecedor;
  _cdsTemp :TClientDataSet;

begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';

    with tempQuery do
    begin
      SQL.Add('SELECT');
      SQL.Add('FABRICANTE.CD_FABRICANTE, NR_DV_FABRICANTE, CD_FABRICANTE_PAI,');
      SQL.Add('CD_GRUPO_CURVA_FABRICANTE, NR_CNPJ,QT_DIAS_PRAZO_PADRAO,');
      SQL.Add('ID_REPASSE_ICMS, PC_REPASSE_ICMS, PC_ABATIMENTO_PADRAO,');
      SQL.Add('ID_RETEM_ICMS, ID_PEDIDO_GAM, ID_REDUZ_ICMS, ID_RETENCAO_ALIQUOTA,');
      SQL.Add('ID_ICMS_DESTACADO, ID_PROCESSA_NFE, ID_COBRA_IPI, ID_REGIME_ESPECIAL_REDUCAO,');
      SQL.Add('ID_NFE_EMITE, DT_NFE_INICIO,');
      SQL.Add('QT_DIAS_LEADTIME_FABRICANTE, QT_DIAS_LEADTIME_TERMOLABIL, DT_AGENDAMENTO,');
      SQL.Add('DT_PROXIMO_PEDIDO, DS_NUMERO_DIA_SEMANA, NM_RESPONSAVEL_TI, DS_TELEFONE_TI,');
      SQL.Add('DS_EMAIL_TI, DS_OBSERVACAO, PC_MARGEM_VENDA, PC_MARGEM_VENDA_MEDICAMENTO,');
      SQL.Add('PC_MARGEM_VENDA_PERFUMARIA, PC_MARGEM_VENDA_PADRAO,');
      SQL.Add('NR_VERSAO_LAYOUT, NM_ARQUIVO, DT_FORNEC_CLIENTE,');
      SQL.Add('CD_FORNEC_CLIENTE, DT_ATUALIZACAO_SID, CD_FABRICANTE_SID, NR_DV_FABRICANTE_SID,');
      SQL.Add('FABRICANTE.NM_USUARIO, ID_ALMOXARIFADO, ID_SITUACAO_FABRICANTE,UFEP_P,NOMP_P,SIGP_P,');
      SQL.Add('DS_GRUPO_FORNECEDOR,PC_VERBA_GERACAO,CD_GRUPO_FORNECEDOR,NR_VERBA_GERACAO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_FABRICANTE FABRICANTE,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
      SQL.Add('PRDDM.DCPES');
      SQL.Add('WHERE');
      SQL.Add('NR_CNPJ=CGCP_P');
      SQL.Add('AND GRUPO_FORNECEDOR.CD_FABRICANTE=FABRICANTE.CD_FABRICANTE');
      SQL.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=tempQuery.Text;
      Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
      open;
    end;
    Result:=nil;
    if not _cdsTemp.IsEmpty then
       Result:=_cdsTemp;
  finally
      FreeAndNil(tempQuery);
  end;
end;

function DataUltimaCompraII(PnrFornecedor:Integer):TClientDataSet;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  _cdsTemp: TClientDataSet;
begin
    tempQuery := nil;
    tempQuery := TSQLQuery.Create(nil);
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';

   try
      with TempQuery do
      begin
        SQL.Clear;
        SQL.Add('SELECT   Nvl(Max(DT_COMPRA),''01/01/1899'')');
        SQL.Add('DT_ULTIMA_COMPRA,cm.CD_MERCADORIA,CD_OPERADOR_LOGISTICO,cm.CD_EMPRESA');
        SQL.Add('FROM');
        SQL.Add('PRDDM.DC_COMPRA_SUMARIZADA CS,');
        SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
        SQL.Add('WHERE');
        SQL.Add('cs.cd_mercadoria=cm.cd_mercadoria');
        SQL.Add('AND id_situacao_compra NOT IN(''C'',''I'')');
        SQL.Add('AND cd_grupo_fornecedor=:PnrForncedor');
        SQL.Add('GROUP BY cm.CD_MERCADORIA,CD_OPERADOR_LOGISTICO,cm.CD_EMPRESA');
      end;
      Result:=nil;
      with _cdsTemp do
      begin
        close;
        CommandText:=tempQuery.Text;
        Params.ParamByName('PnrForncedor').AsInteger:=PnrFornecedor;
        open;
      end;
      if not _cdsTemp.IsEmpty then
        Result:=_cdsTemp;
   finally
     FreeAndNil(tempQuery);
   end;
end;

function VerificaItensFaturados(PnrPedido:Integer):Boolean;
VAR
  qryTemp :TSQLQuery;
   stQry: TStringList;
  STRQRY,filtroQuantidade  :STRING;
begin
try
 try
     stQry:= TStringList.Create;
     qryTemp:= TSQLQuery.Create(NIL);
     qryTemp.SQLConnection:=_dm._conexao;
     stQry.Add('SELECT Count(*),NROP_Y FROM prddm.dcpci');
     stQry.Add('WHERE chey_y>0');
     stQry.Add('AND NROP_Y=:PnrPedido');
     stQry.Add('GROUP BY NROP_Y');

     with qryTemp do
     begin
      close;
      sql.Add(stQry.Text);
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      open;
     end;
     Result:=false;
     if not qryTemp.Eof then
      Result:=true;
  except
   Mensagem('Erro na pesquisa de itens J? Faturado no pedido!!!',MB_ICONERROR);
  end;
finally
  FreeAndNil(qryTemp);
  FreeAndNil(stQry);
end;
end;
(**
**)



function DiasEstoqueFinanceiro(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT');
      Add('CASE');
      Add('WHEN  CD_EMPRESA=4 THEN  ''CD.STA.CRUZ SUL''');
      Add('WHEN  CD_EMPRESA=1 THEN  ''CD.TUBAR?O''');
      Add('WHEN  CD_EMPRESA=5 THEN  ''GERAL''');
      Add('END EMPRESA,');
      Add('NR_DIAS_ESTOQUE,');
      Add('MEDIA_FINANCEIRA,');
      Add('CUSTO_FINANCEIRO_MERCADORIA');
      Add('FROM');
      Add('(SELECT');
      Add('VENDA.CD_EMPRESA,');
      Add('SUM(VL_MEDIA_FINANCEIRA) AS MEDIA_FINANCEIRA,');
      Add('SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) AS CUSTO_FINANCEIRO_MERCADORIA,');
      Add('ROUND((SUM(VT_CUSTO_FINANCEIRO_MERCADORIA)/SUM(VL_MEDIA_FINANCEIRA)),0) AS NR_DIAS_ESTOQUE');
      Add('FROM');
      Add('(SELECT CD_EMPRESA, SUM(VCCI_I),');
      Add('ROUND( SUM(VCCI_I)/30,2) VL_MEDIA_FINANCEIRA,LABM_I');
      Add('FROM');
      Add('PRDDM.V_DCIOS4@SIHST12');
      Add('WHERE TIPN_I=''V'' AND DEMN_YI>=TRUNC(SYSDATE-30)');
      Add('AND LABM_I  =:PnrFornecedor');
      Add('GROUP BY LABM_I,CD_EMPRESA) VENDA,');
      Add('(SELECT CM.CD_EMPRESA,');
      Add('CD_GRUPO_FORNECEDOR,SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) AS VT_CUSTO_FINANCEIRO_MERCADORIA');
      Add('FROM');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FM');
      Add('WHERE');
      Add('CM.CD_MERCADORIA=FM.CD_MERCADORIA');
      Add('AND CM.CD_EMPRESA=FM.CD_EMPRESA');
      Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('GROUP BY CD_GRUPO_FORNECEDOR,CM.CD_EMPRESA) ESTOQUE');
      Add(' WHERE');
      Add('VENDA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      Add('AND VENDA.LABM_I=ESTOQUE.CD_GRUPO_FORNECEDOR');
      Add('GROUP BY VENDA.CD_EMPRESA');
      Add('UNION ALL');
      Add('SELECT 5 CD_EMPRESA,');
      Add('VL_MEDIA_FINANCEIRA,');
      Add('VT_CUSTO_FINANCEIRO_MERCADORIA,');
      Add('ROUND(VT_CUSTO_FINANCEIRO_MERCADORIA/VL_MEDIA_FINANCEIRA,0) AS NR_DIAS_ESTOQUE');
      Add('FROM');
      Add('(SELECT');
      Add(' SUM(VCCI_I),');
      Add(' ROUND( SUM(VCCI_I)/30,2) VL_MEDIA_FINANCEIRA');
      Add('FROM');
      Add('PRDDM.V_DCIOS4@SIHST12');
      Add('WHERE TIPN_I=''V'' AND DEMN_YI>=TRUNC(SYSDATE-30)');
      Add('AND LABM_I=:PnrFornecedor),');
      Add('(SELECT');
      Add('SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) AS VT_CUSTO_FINANCEIRO_MERCADORIA');
      add('FROM');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FM');
      Add('WHERE');
      Add('CM.CD_MERCADORIA=FM.CD_MERCADORIA');
      Add('AND CM.CD_EMPRESA=FM.CD_EMPRESA');
      Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor))');


    end;
    stQry.SaveToFile('qryDiasEstoque.sql');
    with _cdsTemp do
    begin
       close;
       CommandText:=stQry.Text;
       Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       open;
      end;
      result:=nil;
      if not _cdsTemp.IsEmpty then
      begin
       _cdsTemp:=SetTabelaDiasEstoque(_cdsTemp);
         result:=_cdsTemp;
      end;


  finally
     FreeAndNil(stQry);
  end;
end;


function SetTabelaDiasEstoque(PTabela:TClientDataSet):TClientDataSet;
begin
   if PTabela.Active then
   begin





//   TfloatField(PTabela.FieldByName('VT_ESTOQUE')).DisplayLabel:='Vlr. Estoque';
  // TFloatField(PTabela.FieldByName('VT_ESTOQUE')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_ESTOQUE_COMPRADOR')).DisplayLabel:='Vlr.Estoque Compr.';
   TFloatField(PTabela.FieldByName('VL_ESTOQUE_COMPRADOR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_ESTOQUE_FORNECEDOR')).DisplayLabel:='Vlr.Estoque Fornec';
   TFloatField(PTabela.FieldByName('VL_ESTOQUE_FORNECEDOR')).Visible:=false;

 //  TfloatField(PTabela.FieldByName('VL_CMV_MEDIO_COMPRADOR')).DisplayLabel:='Vlr.CMV Compr';
 //  TFloatField(PTabela.FieldByName('VL_CMV_MEDIO_COMPRADOR')).Visible:=false;

//   TfloatField(PTabela.FieldByName('VL_CMV_MEDIO_FORNECEDOR')).DisplayLabel:='Vlr.CMV Fornec';
//   TFloatField(PTabela.FieldByName('VL_CMV_MEDIO_FORNECEDOR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_ESTOQUE_COMPRADOR_PEND')).DisplayLabel:='Vlr.Pendenacia Compr.';
   TFloatField(PTabela.FieldByName('VL_ESTOQUE_COMPRADOR_PEND')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_ESTOQUE_FORNECEDOR_PEND')).DisplayLabel:='Vlr.Pendenacia Fornec.';
   TFloatField(PTabela.FieldByName('VL_ESTOQUE_FORNECEDOR_PEND')).Visible:=false;

   TIntegerField(PTabela.FieldByName('CD_EMPRESA')).DisplayLabel:='CD';
   TIntegerField(PTabela.FieldByName('CD_EMPRESA')).DisplayWidth:=03;
//   TIntegerField(PTabela.FieldByName('CD_EMPRESA')).Visible:=false;

   TStringField(PTabela.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayLabel:='UF';
   TStringField(PTabela.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayWidth:=03;


   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_FORNECEDOR')).DisplayLabel:='Fornecedor';
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_FORNECEDOR')).DisplayWidth:=10;
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_FORNECEDOR')).DisplayFormat:='##0.00';

   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR')).DisplayLabel:='Comprador';
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR')).DisplayWidth:=10;
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR')).DisplayFormat:='##0.00';


   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_FORNECEDOR_PEND')).DisplayLabel:='Fornecedor';
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_FORNECEDOR_PEND')).DisplayWidth:=10;
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR_PEND')).DisplayFormat:='##0.00';

   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR_PEND')).DisplayLabel:='Comprador';
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR_PEND')).DisplayWidth:=10;
   TfloatField(PTabela.FieldByName('DIAS_ESTOQUE_COMPRADOR_PEND')).DisplayFormat:='##0.00';


   Result:=PTabela;
   end;
end;




function DiasEstoqueFinanceiroEST(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
   try
    with stQry do
    begin
      ADD('SELECT');
      ADD(' CD_EMPRESA,');
      ADD(' ID_UNIDADE_FEDERACAO,');
      ADD(' Sum(VL_ESTOQUE_COMPRADOR) AS VL_ESTOQUE_COMPRADOR,Sum(VL_ESTOQUE_COMPRADOR+VL_CUSTO_PENDENCIA_COMPRADOR) AS VL_ESTOQUE_COMPRADOR_PEND,');
      ADD(' Sum(VL_ESTOQUE_FORNECEDOR) AS VL_ESTOQUE_FORNECEDOR,Sum(VL_ESTOQUE_FORNECEDOR+VL_CUSTO_PENDENCIA_FORNECEDOR) AS VL_ESTOQUE_FORNECEDOR_PEND,');
      ADD('case');
      add(' when (Sum(VL_ESTOQUE_COMPRADOR)>0) AND (Sum(VT_CUSTO_VENDA_COMPRADOR)>0) then');
      ADD(' Round(30/( Sum(VT_CUSTO_VENDA_COMPRADOR)/Sum(VL_ESTOQUE_COMPRADOR)),2)');
      add(' else 0');
      add(' end DIAS_ESTOQUE_COMPRADOR,');
      add('case');
      ADD(' WHEN (Sum(VL_ESTOQUE_COMPRADOR+VL_CUSTO_PENDENCIA_COMPRADOR)>0) AND(Sum(VT_CUSTO_VENDA_COMPRADOR)>0) THEN');
      ADD(' Round(30/( Sum(VT_CUSTO_VENDA_COMPRADOR)/Sum(VL_ESTOQUE_COMPRADOR+VL_CUSTO_PENDENCIA_COMPRADOR)),2) ');
      ADD(' ELSE 0');
      ADD('END AS DIAS_ESTOQUE_COMPRADOR_PEND,');
      add('case');
      ADD(' WHEN (Sum(VL_VENDA_FORNECEDOR)>0) and (Sum(VL_ESTOQUE_FORNECEDOR)>0) then');
      ADD(' Round(30/( Sum(VL_VENDA_FORNECEDOR)/Sum(VL_ESTOQUE_FORNECEDOR)),2)');
      add('else 0');
      add('END AS DIAS_ESTOQUE_FORNECEDOR,');
      add('case');
      ADD(' WHEN (Sum(VL_VENDA_FORNECEDOR)>0) AND (Sum(VL_ESTOQUE_FORNECEDOR+VL_CUSTO_PENDENCIA_FORNECEDOR)>0) THEN');
      ADD(' Round(30/(Sum(VL_VENDA_FORNECEDOR)/Sum(VL_ESTOQUE_FORNECEDOR+VL_CUSTO_PENDENCIA_FORNECEDOR)),2)');
      ADD('ELSE 0');
      ADD('END AS DIAS_ESTOQUE_FORNECEDOR_PEND');
      ADD('  FROM');
      ADD('  ( select E.CD_EMPRESA,');
      ADD('          ID_UNIDADE_FEDERACAO,');
      ADD('          NROM_E AS CD_MERCADORIA,');
      ADD('          FISM_E ,');
      ADD('          dECODE(FISM_E,0,0,FINM_E) VL_ESTOQUE_COMPRADOR  ,');
      ADD('          QT_ESTOQUE_DISPONIVEL_VENDA,');
      ADD('          Nvl(VT_CUSTO_VENDA,0) AS VT_CUSTO_VENDA_COMPRADOR,');
      ADD('          ROUND((NVL(VCCI_Y*(QUAY_Y-CHEY_Y),0)),2) VL_CUSTO_PENDENCIA_COMPRADOR,');
      ADD('          Decode(CD_GRUPO_FORNECEDOR,:PnrFornecedor,dECODE(FISM_E,0,0,FINM_E),0.0001) AS VL_ESTOQUE_FORNECEDOR,');
      ADD('          Decode(CD_GRUPO_FORNECEDOR,:PnrFornecedor,Nvl(VT_CUSTO_VENDA,0),0.0001) AS VL_VENDA_FORNECEDOR,');
      ADD('          Decode(CD_GRUPO_FORNECEDOR,:PnrFornecedor,ROUND((NVL(VCCI_Y*(QUAY_Y-CHEY_Y),0)),2),0) AS VL_CUSTO_PENDENCIA_FORNECEDOR');
      ADD('from');
      ADD('PRDDM.DCEST E,');
      ADD('PRDDM.DC_GERENCIAMENTO_ESTOQUE_BI@SIHST G,');
      ADD('PRDDM.DC_COMPRA_MERCADORIA@SIHST CM');
      ADD('LEFT OUTER JOIN PRDDM.DCPCC CAPA ON CAPA.LABP_P=CM.CD_GRUPO_FORNECEDOR AND SITP_P IN(''N'',''P'')');
      ADD('LEFT OUTER JOIN PRDDM.DCPCI ITEM ON ITEM.NROP_Y=CAPA.NROP_p AND SITY_Y IN(''N'',''P'') AND ITEM.CD_EMPRESA=CAPA.CD_EMPRESA');
      ADD('                                      AND NROM_Y=CD_MERCADORIA AND ITEM.CD_EMPRESA=CM.CD_EMPRESA AND ITEM.cd_operacao_rede in(0,1)');
      ADD('JOIN ACESSO.DC_EMPRESA EMP ON  EMP.id_empresa_fisica=''S'' AND EMP.cd_empresa_fisica=ITEM.CD_EMPRESA AND  EMP.cd_empresa_fisica=cm.CD_EMPRESA AND id_situacao_empresa=''A''');
      ADD('WHERE');
      ADD('DAEE_E = (TRUNC(SYSDATE) - 1)');
      ADD('and E.CD_EMPRESA = G.CD_EMPRESA');
      ADD('and E.NROM_E = G.CD_MERCADORIA');
      ADD('and E.CD_EMPRESA = CM.CD_EMPRESA');
      ADD('and E.NROM_E = CM.CD_MERCADORIA');
      ADD('AND CM.CD_comprador=:PnrComprador');

      ADD('and TO_CHAR(G.DT_BASE,''MMYYYY'') = TO_CHAR(DAEE_E,''MMYYYY''))');
      ADD('GROUP BY CD_EMPRESA,ID_UNIDADE_FEDERACAO');






    end;
    stQry.SaveToFile('C:\TEMP\qryDiasEstoque.sql');
    with _cdsTemp do
    begin
       close;
       CommandText:=stQry.Text;
       Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
       open;
      end;
      result:=nil;
      if not _cdsTemp.IsEmpty then
      begin
       _cdsTemp:=SetTabelaDiasEstoque(_cdsTemp);
         result:=_cdsTemp;
      end;
   except
      on E: Exception do
      begin
        result:=nil;
        trataerro(E.Message, 'Erro ao Abrir Dias de Estoque');
      end;

   end;


  finally
     FreeAndNil(stQry);
  end;
end;




function DiasEstoqueFinanceiroESTII(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
   try
    with stQry do
    begin

      add('SELECT ESTOQUE.CD_EMPRESA,');
      add('case');
      Add('WHEN ESTOQUE.CD_EMPRESA=1 THEN ''CD. TUBAR?O''');
      Add('WHEN ESTOQUE.CD_EMPRESA=4 THEN ''CD. STA.CRUZ DO SUL''');
      Add('WHEN ESTOQUE.CD_EMPRESA=5 THEN ''GERAL''');
      Add('END  LOCAL_CD,');

      add('SUM( VT_ESTOQUE) as VT_ESTOQUE,');
      add('SUM(VT_ESTOUE_COMPRADOR) AS VT_ESTOUE_COMPRADOR,');
      add('SUM(VT_ESTOQUE_FORNECEDOR)AS VT_ESTOQUE_FORNECEDOR,');
      add('SUM(VL_CMV_MEDIO_COMPRADOR) AS VL_CMV_MEDIO_COMPRADOR,');
      add('SUM(VL_CMV_MEDIO_FORNECEDOR)  AS VL_CMV_MEDIO_FORNECEDOR,');
      add('SUM(NVL(VL_CUSTO_PENDENCIA_CPR,0)) AS VL_CUSTO_PENDENCIA_CPR,');
      add('SUM(NVL(VL_CUSTO_PENDENCIA_FOR,0)) AS VL_CUSTO_PENDENCIA_FOR,');
      add('case');
      add('WHEN nvl(SUM(VL_CMV_MEDIO_COMPRADOR),0)>0 THEN');
      add('ROUND(SUM(VT_ESTOUE_COMPRADOR)/SUM(VL_CMV_MEDIO_COMPRADOR),0)');
      ADD('ELSE 0');
      add('END NR_DIAS_COMPRADOR,');
      ADD('case');
      add('when nvl(SUM(VL_CMV_MEDIO_FORNECEDOR),0)>0 then ');
      add('ROUND(SUM(VT_ESTOQUE_FORNECEDOR)/SUM(VL_CMV_MEDIO_FORNECEDOR),0)');
      add('else 0');
      add('end NR_DIAS_FORNECEDOR,');
      add('case');
      add('when SUM(VL_CMV_MEDIO_COMPRADOR)>0 then');
      add('ROUND( (SUM(VT_ESTOUE_COMPRADOR)+SUM(NVL(VL_CUSTO_PENDENCIA_CPR,0)))/SUM(VL_CMV_MEDIO_COMPRADOR),0)');
      add('else 0');
      add('end NR_DIAS_COMPRADOR_PEN,');
      add('case');
      add('when SUM(VL_CMV_MEDIO_FORNECEDOR)>0 then');
      add('ROUND((SUM(VT_ESTOQUE_FORNECEDOR)+SUM(NVL(VL_CUSTO_PENDENCIA_FOR,0)))/SUM(VL_CMV_MEDIO_FORNECEDOR),0)');
      add('else 0');
      add('end NR_DIAS_FORNECEDOR_PEN');
      add(' FROM');
      add(' (SELECT');
      add(' EM.CD_EMPRESA,');
      add(' CD_GRUPO_FORNECEDOR,');
      add(' (SUM(QT_FISICO*VL_CUSTO_FINANCEIRO_MERCADORIA)) AS VT_ESTOQUE,');
      add(' SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) VT_ESTOUE_COMPRADOR,');
      add(' DECODE(CD_GRUPO_FORNECEDOR,:PnrFornecedor, SUM(NVL(VT_CUSTO_FINANCEIRO_MERCADORIA,0)),0) AS VT_ESTOQUE_FORNECEDOR');
      add(' FROM');
      add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      add('PRDDM.DC_ESTOQUE_MERCADORIA  EM,');
      add('PRDDM.DC_FINANCEIRO_MERCADORIA  FM');
      add('WHERE');
      add('CM.CD_MERCADORIA=EM.CD_MERCADORIA');
      add('AND FM.CD_MERCADORIA=EM.CD_MERCADORIA');
      add('');
      add('');
      add('AND CM.CD_EMPRESA=EM.CD_EMPRESA');
      add('');
      add('AND FM.CD_EMPRESA=EM.CD_EMPRESA');
      add(' AND CD_COMPRADOR=:PnrComprador');
      add('GROUP BY EM.CD_EMPRESA,CD_GRUPO_FORNECEDOR) ESTOQUE');
      add('LEFT OUTER JOIN(SELECT');
      add('ITEM.CD_EMPRESA,');
      add('CD_GRUPO_FORNECEDOR,');
      add('---CM.CD_MERCADORIA,');
      add('ROUND(SUM(NVL(VCCI_Y*(QUAY_Y-CHEY_Y),0)),2) VL_CUSTO_PENDENCIA_CPR,');
      add('DECODE(CD_GRUPO_FORNECEDOR,:PnrFornecedor,SUM(NVL(VCCI_Y*(QUAY_Y-CHEY_Y),0)),0) AS VL_CUSTO_PENDENCIA_FOR');
      add('FROM');
      add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      add('PRDDM.DC_MERCADORIA M,');
      add('PRDDM.DCPCC CAPA,');
      add('PRDDM.DCPCI ITEM ');
      add('WHERE');
      add('NROP_P=NROP_Y');
      add('AND SITY_Y IN(''N'',''P'',''T'')');
      add('AND SITP_P IN(''P'',''N'',''T'')');
      add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
      add('AND M.CD_MERCADORIA=CM.CD_MERCADORIA');
      add('AND ITEM.cd_operacao_rede in(0,1)');
      add('AND CM.CD_MERCADORIA=NROM_Y');
      add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      add('AND CM.ID_SITUACAO_MERCADORIA<>''I''');
      add('');
      add('AND   CAPA.CD_EMPRESA=CM.CD_EMPRESA');
      add('AND CM.CD_COMPRADOR=:PnrComprador');
      add('AND CD_GRUPO_FORNECEDOR=LABP_P');
      add('GROUP BY ITEM.CD_EMPRESA,CD_GRUPO_FORNECEDOR) PENDENCIA ON PENDENCIA.CD_EMPRESA=ESTOQUE.CD_EMPRESA AND PENDENCIA.CD_GRUPO_FORNECEDOR=ESTOQUE.CD_GRUPO_FORNECEDOR');
      add('LEFT OUTER JOIN (SELECT');
      add(' CD_EMPRESA,');
      add('CD_GRUPO_FORNECEDOR,');
      add('SUM(NVL(VL_CMV_MEDIO_COMPRADOR,0)) AS VL_CMV_MEDIO_COMPRADOR,');
      add('SUM(NVL(VL_CMV_MEDIO_FORNECEDOR,0)) AS VL_CMV_MEDIO_FORNECEDOR');
      add('');
      add('FROM');
      add('');
      add('(SELECT');
      add('CM.CD_EMPRESA,');
      add('CD_GRUPO_FORNECEDOR,');
      add('DT_VENDA_MERCADORIA,');
      add('SUM(QT_VENDIDA),');
      add('SUM(VT_CMV),');
      add('VL_CUSTO_FINANCEIRO_MERCADORIA,');
      add('MAX(QT_MEDIA_VENDA_DIARIA),');
      add('');
      add('ROUND(VL_CUSTO_FINANCEIRO_MERCADORIA* (MAX(QT_MEDIA_VENDA_DIARIA)*5/7),2) VL_CMV_MEDIO_COMPRADOR,');
      add('DECODE(CD_GRUPO_FORNECEDOR,:PnrFornecedor,ROUND(VL_CUSTO_FINANCEIRO_MERCADORIA* (MAX(QT_MEDIA_VENDA_DIARIA)*5/7),2),0) AS VL_CMV_MEDIO_FORNECEDOR');
      add('');
      add('  FROM');
      add('    PRDDM.DC_COMPRA_MERCADORIA CM,');
      add('    PRDDM.DC_FINANCEIRO_MERCADORIA FMV,');
      add('    PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM');
      add('WHERE');
      add('  CM.CD_MERCADORIA=VM.CD_MERCADORIA');
      add('  AND CM.CD_MERCADORIA=FMV.CD_MERCADORIA');
      add('  AND CM.CD_EMPRESA=VM.CD_EMPRESA');
      add('  AND CM.CD_EMPRESA=FMV.CD_EMPRESA');
      add('');
      add('');
      add(' AND CM.CD_COMPRADOR=:PnrComprador');
      add('  AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1)');
      add('  GROUP BY  CM.CD_EMPRESA,');
      add('            CM.CD_MERCADORIA,');
      add('            DT_VENDA_MERCADORIA,');
      add('            CD_GRUPO_FORNECEDOR,');
      add('         VL_CUSTO_FINANCEIRO_MERCADORIA)');
      add('GROUP BY    CD_EMPRESA,CD_GRUPO_FORNECEDOR) VENDA ON VENDA.CD_EMPRESA=PENDENCIA.CD_EMPRESA');
      add('                                                  AND VENDA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      add('                                                  AND VENDA.CD_GRUPO_FORNECEDOR=PENDENCIA.CD_GRUPO_FORNECEDOR');
      add('                                                  AND PENDENCIA.CD_GRUPO_FORNECEDOR=ESTOQUE.CD_GRUPO_FORNECEDOR');
      add('');
      add('GROUP BY ESTOQUE.CD_EMPRESA');

    end;
    stQry.SaveToFile('c:\temp\qryDiasEstoqueNovo25.sql');
    with _cdsTemp do
    begin
       close;
       CommandText:=stQry.Text;
       Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
       open;
      end;
      result:=nil;
      if not _cdsTemp.IsEmpty then
      begin
       _cdsTemp:=SetTabelaDiasEstoque(_cdsTemp);
         result:=_cdsTemp;
      end;
   except
      on E: Exception do
      begin
        result:=nil;
        trataerro(E.Message, 'Erro ao Abrir Dias de Estoque');
      end;

   end;


  finally
     FreeAndNil(stQry);
  end;
end;

function DiasEstoqueFinanceiroNovaTabela(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
   try
    with stQry do
    begin

      add('SELECT ESTOQUE.CD_EMPRESA,UF AS LOCAL_CD,');
      add('SUM( VT_ESTOQUE) as VT_ESTOQUE,');
      add('SUM(VT_ESTOUE_COMPRADOR) AS VT_ESTOUE_COMPRADOR,');
      add('SUM(VT_ESTOQUE_FORNECEDOR)AS VT_ESTOQUE_FORNECEDOR,');
      add('SUM(VL_CMV_MEDIO_COMPRADOR) AS VL_CMV_MEDIO_COMPRADOR,');
      add('SUM(VL_CMV_MEDIO_FORNECEDOR)  AS VL_CMV_MEDIO_FORNECEDOR,');
      add('SUM(NVL(VL_CUSTO_PENDENCIA_CPR,0)) AS VL_CUSTO_PENDENCIA_CPR,');
      add('SUM(NVL(VL_CUSTO_PENDENCIA_FOR,0)) AS VL_CUSTO_PENDENCIA_FOR,');
      add('case');
      add('WHEN nvl(SUM(VL_CMV_MEDIO_COMPRADOR),0)>0 THEN');
      add('ROUND(SUM(VT_ESTOUE_COMPRADOR)/SUM(VL_CMV_MEDIO_COMPRADOR),0)');
      ADD('ELSE 0');
      add('END NR_DIAS_COMPRADOR,');
      ADD('case');
      add('when nvl(SUM(VL_CMV_MEDIO_FORNECEDOR),0)>0 then ');
      add('ROUND(SUM(VT_ESTOQUE_FORNECEDOR)/SUM(VL_CMV_MEDIO_FORNECEDOR),0)');
      add('else 0');
      add('end NR_DIAS_FORNECEDOR,');
      add('case');
      add('when SUM(VL_CMV_MEDIO_COMPRADOR)>0 then');
      add('ROUND( (SUM(VT_ESTOUE_COMPRADOR)+SUM(NVL(VL_CUSTO_PENDENCIA_CPR,0)))/SUM(VL_CMV_MEDIO_COMPRADOR),0)');
      add('else 0');
      add('end NR_DIAS_COMPRADOR_PEN,');
      add('case');
      add('when SUM(VL_CMV_MEDIO_FORNECEDOR)>0 then');
      add('ROUND((SUM(VT_ESTOQUE_FORNECEDOR)+SUM(NVL(VL_CUSTO_PENDENCIA_FOR,0)))/SUM(VL_CMV_MEDIO_FORNECEDOR),0)');
      add('else 0');
      add('end NR_DIAS_FORNECEDOR_PEN');
      add(' FROM');
      add(' (SELECT');
      add(' EM.CD_EMPRESA,');
      add(' CD_GRUPO_FORNECEDOR,');
      add(' (SUM(QT_FISICO*VL_CUSTO_FINANCEIRO_MERCADORIA)) AS VT_ESTOQUE,');
      add(' SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) VT_ESTOUE_COMPRADOR,');
      add(' DECODE(CD_GRUPO_FORNECEDOR,:PnrFornecedor, SUM(NVL(VT_CUSTO_FINANCEIRO_MERCADORIA,0)),0) AS VT_ESTOQUE_FORNECEDOR');
      add(' FROM');
      add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      add('PRDDM.DC_ESTOQUE_MERCADORIA  EM,');
      add('PRDDM.DC_FINANCEIRO_MERCADORIA FM,');
      add('ACESSO.DC_EMPRESA EMPRESA');
      add('WHERE');
      add('EMPRESA.ID_EMPRESA_FISICA=''S''');
      add('and EMPRESA.id_situacao_empresa=''A''');
      add('AND EM.CD_EMPRESA=EMPRESA.CD_EMPRESA');
      add('CM.CD_MERCADORIA=EM.CD_MERCADORIA');
      add('AND FM.CD_MERCADORIA=EM.CD_MERCADORIA');
      add('');
      add('');
      add('AND CM.CD_EMPRESA=EM.CD_EMPRESA');
      add('');
      add('AND FM.CD_EMPRESA=EM.CD_EMPRESA');
      add(' AND CD_COMPRADOR=:PnrComprador');
      add('GROUP BY EM.CD_EMPRESA,CD_GRUPO_FORNECEDOR) ESTOQUE');
      add('LEFT OUTER JOIN(SELECT');
      add('ITEM.CD_EMPRESA,');
      add('CD_GRUPO_FORNECEDOR,');
      add('---CM.CD_MERCADORIA,');
      add('ROUND(SUM(NVL(VCCI_Y*(QUAY_Y-CHEY_Y),0)),2) VL_CUSTO_PENDENCIA_CPR,');
      add('DECODE(CD_GRUPO_FORNECEDOR,:PnrFornecedor,SUM(NVL(VCCI_Y*(QUAY_Y-CHEY_Y),0)),0) AS VL_CUSTO_PENDENCIA_FOR');
      add('FROM');
      add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      add('PRDDM.DC_MERCADORIA M,');
      add('PRDDM.DCPCC CAPA,');
      add('PRDDM.DCPCI ITEM ');
      add('WHERE');
      add('NROP_P=NROP_Y');
      add('AND SITY_Y IN(''N'',''P'',''T'')');
      add('AND SITP_P IN(''P'',''N'',''T'')');
      add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
      add('AND M.CD_MERCADORIA=CM.CD_MERCADORIA');
      add('AND CM.CD_MERCADORIA=NROM_Y');
      add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      add('AND CM.ID_SITUACAO_MERCADORIA<>''I''');
      add('AND ITEM.cd_operacao_rede in(0,1)');
      add('AND   CAPA.CD_EMPRESA=CM.CD_EMPRESA');
      add('AND CM.CD_COMPRADOR=:PnrComprador');
      add('AND CD_GRUPO_FORNECEDOR=LABP_P');
      add('GROUP BY ITEM.CD_EMPRESA,CD_GRUPO_FORNECEDOR) PENDENCIA ON PENDENCIA.CD_EMPRESA=ESTOQUE.CD_EMPRESA AND PENDENCIA.CD_GRUPO_FORNECEDOR=ESTOQUE.CD_GRUPO_FORNECEDOR');
      add('LEFT OUTER JOIN (SELECT');
      add(' CD_EMPRESA,');
      add('CD_GRUPO_FORNECEDOR,');
      add('SUM(NVL(VL_CMV_MEDIO_COMPRADOR,0)) AS VL_CMV_MEDIO_COMPRADOR,');
      add('SUM(NVL(VL_CMV_MEDIO_FORNECEDOR,0)) AS VL_CMV_MEDIO_FORNECEDOR');
      add('');
      add('FROM');
      add('');
      add('(SELECT');
      add('CM.CD_EMPRESA,');
      add('CD_GRUPO_FORNECEDOR,');
      add('DT_VENDA_MERCADORIA,');
      add('SUM(QT_VENDIDA),');
      add('SUM(VT_CMV),');
      add('VL_CUSTO_FINANCEIRO_MERCADORIA,');
      add('MAX(QT_MEDIA_VENDA_DIARIA),');
      add('');
      add('ROUND(VL_CUSTO_FINANCEIRO_MERCADORIA* (MAX(QT_MEDIA_VENDA_DIARIA)*5/7),2) VL_CMV_MEDIO_COMPRADOR,');
      add('DECODE(CD_GRUPO_FORNECEDOR,:PnrFornecedor,ROUND(VL_CUSTO_FINANCEIRO_MERCADORIA* (MAX(QT_MEDIA_VENDA_DIARIA)*5/7),2),0) AS VL_CMV_MEDIO_FORNECEDOR');
      add('');
      add('  FROM');
      add('    PRDDM.DC_COMPRA_MERCADORIA CM,');
      add('    PRDDM.DC_FINANCEIRO_MERCADORIA FMV,');
      add('    PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VM');
      add('WHERE');
      add('  CM.CD_MERCADORIA=VM.CD_MERCADORIA');
      add('AND VM.Cd_operador_logistico=1');
      add('AND VM.cd_canal=0');
      add('  AND CM.CD_MERCADORIA=FMV.CD_MERCADORIA');
      add('  AND CM.CD_EMPRESA=VM.CD_EMPRESA');
      add('  AND CM.CD_EMPRESA=FMV.CD_EMPRESA');
      add(' AND CM.CD_COMPRADOR=:PnrComprador');
//    add('  AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1)');
      add('  AND DT_VENDA_MERCADORIA>= SELECT Max(dt_venda_mercadoria) AS dt_venda_mercadoria FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA');
      add('  GROUP BY  CM.CD_EMPRESA,');
      add('            CM.CD_MERCADORIA,');
      add('            DT_VENDA_MERCADORIA,');
      add('            CD_GRUPO_FORNECEDOR,');
      add('         VL_CUSTO_FINANCEIRO_MERCADORIA)');
      add('GROUP BY    CD_EMPRESA,CD_GRUPO_FORNECEDOR) VENDA ON VENDA.CD_EMPRESA=PENDENCIA.CD_EMPRESA');
      add('                                                  AND VENDA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      add('                                                  AND VENDA.CD_GRUPO_FORNECEDOR=PENDENCIA.CD_GRUPO_FORNECEDOR');
      add('                                                  AND PENDENCIA.CD_GRUPO_FORNECEDOR=ESTOQUE.CD_GRUPO_FORNECEDOR');
      add('');
      add('GROUP BY ESTOQUE.CD_EMPRESA');

    end;
    stQry.SaveToFile('c:\temp\qryDiasEstoqueNovaTabela.sql');
    with _cdsTemp do
    begin
       close;
       CommandText:=stQry.Text;
       Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
       open;
      end;
      result:=nil;
      if not _cdsTemp.IsEmpty then
      begin
       _cdsTemp:=SetTabelaDiasEstoque(_cdsTemp);
         result:=_cdsTemp;
      end;
   except
      on E: Exception do
      begin
        result:=nil;
        trataerro(E.Message, 'Erro ao Abrir Dias de Estoque');
      end;

   end;


  finally
     FreeAndNil(stQry);
  end;
end;



Function AbreVendaLaboratorioMultiEmpresaAtual(PnrLaboratorio,
                                               PnrEmpresa,
                                               PnrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
 _cdsTemp:TClientDataSet;

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
        Add('SUM(NVL(VT_CMV,0)) AS VT_CUSTO_MEDIO,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO');
        if PnrOperadorLogistico>1 then
        add(',venda.CD_OPERADOR_LOGISTICO');

        Add(' FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add(' AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Add('GROUP BY VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,DT_VENDA_MERCADORIA');
         if PnrOperadorLogistico>1 then
           add(',venda.CD_OPERADOR_LOGISTICO');

        Add('UNION ALL');
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('VENDA.CD_MERCADORIA,');
        Add('0 AS CD_EMPRESA,');
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
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO');
         if PnrOperadorLogistico>1 then
        add(',venda.CD_OPERADOR_LOGISTICO');

        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add('AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Add('GROUP BY VENDA.CD_MERCADORIA,DT_VENDA_MERCADORIA');
        if PnrOperadorLogistico>1 then
         add(',venda.CD_OPERADOR_LOGISTICO');

        Add(' --,VENDA.CD_OPERADOR_LOGISTICO');
       Add('ORDER BY MES,DT_VENDA_MERCADORIA,CD_MERCADORIA,CD_EMPRESA');
      end;

      stQry.SaveToFile('c:\temp\VendaFornecedor.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        Params.ParamByName('PnrFornecedor').AsInteger := PnrLaboratorio;
        open;
      end;
      if not _cdsTemp.isEmpty then
        _cdsTemp.IndexFieldNames := 'CD_MERCADORIA';

      result := _cdsTemp;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logaistico %d',
          [PnrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;


Function GetDadosLaboratorioComprador(PnrComprador,PnrFornecedor: Integer): TDadosFornecedor;
var
  tempQuery: TSQLQuery;
  DadosFornecedor: TDadosFornecedor;

begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;

    with tempQuery do
    begin
      SQL.Add('SELECT');
      SQL.Add('DISTINCT FABRICANTE.CD_FABRICANTE, NR_DV_FABRICANTE, CD_FABRICANTE_PAI,');
      SQL.Add('CD_GRUPO_CURVA_FABRICANTE, NR_CNPJ,QT_DIAS_PRAZO_PADRAO,');
      SQL.Add('ID_REPASSE_ICMS, PC_REPASSE_ICMS, PC_ABATIMENTO_PADRAO,');
      SQL.Add('ID_RETEM_ICMS, ID_PEDIDO_GAM, ID_REDUZ_ICMS, ID_RETENCAO_ALIQUOTA,');
      SQL.Add('ID_ICMS_DESTACADO, ID_PROCESSA_NFE, ID_COBRA_IPI, ID_REGIME_ESPECIAL_REDUCAO,');
      SQL.Add('ID_NFE_EMITE, DT_NFE_INICIO,');
      SQL.Add('QT_DIAS_LEADTIME_FABRICANTE, QT_DIAS_LEADTIME_TERMOLABIL, DT_AGENDAMENTO,');
      SQL.Add('DT_PROXIMO_PEDIDO, DS_NUMERO_DIA_SEMANA, NM_RESPONSAVEL_TI, DS_TELEFONE_TI,');
      SQL.Add('DS_EMAIL_TI, DS_OBSERVACAO, PC_MARGEM_VENDA, PC_MARGEM_VENDA_MEDICAMENTO,');
      SQL.Add('PC_MARGEM_VENDA_PERFUMARIA, PC_MARGEM_VENDA_PADRAO,');
      SQL.Add('NR_VERSAO_LAYOUT, NM_ARQUIVO, DT_FORNEC_CLIENTE,');
      SQL.Add('CD_FORNEC_CLIENTE, DT_ATUALIZACAO_SID, CD_FABRICANTE_SID, NR_DV_FABRICANTE_SID,');
      SQL.Add('FABRICANTE.NM_USUARIO, ID_ALMOXARIFADO, ID_SITUACAO_FABRICANTE,UFEP_P,NOMP_P,SIGP_P,');
      SQL.Add('DS_GRUPO_FORNECEDOR,PC_VERBA_GERACAO,GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,NR_VERBA_GERACAO,CD_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_FABRICANTE FABRICANTE,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
      SQL.Add('PRDDM.DCPES');
      SQL.Add('WHERE');
      SQL.Add('NR_CNPJ=CGCP_P');
      sql.add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND GRUPO_FORNECEDOR.CD_FABRICANTE=FABRICANTE.CD_FABRICANTE');
      SQL.Add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
        SQL.Add('AND CD_COMPRADOR=:PnrComprador');
      Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      if PnrComprador>0 then
         Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
      Open;

    end;
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
    DadosFornecedor.dsGrupoFornecedor:='';

    if not tempQuery.IsEmpty then
    begin
      DadosFornecedor.nrPrazoPedido      := tempQuery.FieldByName('QT_DIAS_PRAZO_PADRAO').AsInteger;
      DadosFornecedor.dtAgenda           := tempQuery.FieldByName('DT_AGENDAMENTO')     .AsDateTime;
      DadosFornecedor.dsUnidadeFederacao := tempQuery.FieldByName('UFEP_P').AsString;
      DadosFornecedor.nrGrupoFornecedor  := tempQuery.FieldByName('CD_GRUPO_CURVA_FABRICANTE').AsInteger;
      DadosFornecedor.dsDiasPedido       := tempQuery.FieldByName('DS_NUMERO_DIA_SEMANA').AsString;
      DadosFornecedor.idIcmDestacado     := tempQuery.FieldByName('ID_ICMS_DESTACADO').AsString[1];
      DadosFornecedor.idReduzIcms        := tempQuery.FieldByName('ID_REDUZ_ICMS').AsString[1];
      DadosFornecedor.idForcaRepasse     := tempQuery.FieldByName('ID_REPASSE_ICMS').AsString[1];
      DadosFornecedor.nrFornecedor       := tempQuery.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger;
      DadosFornecedor.dsRazaoSocial      := tempQuery.FieldByName('NOMP_P').AsString;
      DadosFornecedor.dsNomeFantasia     := tempQuery.FieldByName('SIGP_P').AsString;
      DadosFornecedor.stCNPJ             := formatfloat('00000000000000', tempQuery.FieldByName('NR_CNPJ').AsFloat);
      DadosFornecedor.nrPrazoPedido      := tempQuery.FieldByName('QT_DIAS_PRAZO_PADRAO').AsInteger;
      DadosFornecedor.nrDiasLeadTime     := tempQuery.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger;
      DadosFornecedor.pcGeracaoVerba     := tempQuery.FieldByName('PC_VERBA_GERACAO').AsFloat;
      DadosFornecedor.nrGeracaoVerba     := tempQuery.FieldByName('NR_VERBA_GERACAO').AsInteger;
      DadosFornecedor.dsGrupoFornecedor  := tempQuery.FieldByName('DS_GRUPO_FORNECEDOR').AsString;
      DadosFornecedor.nrComprador        := tempQuery.FieldByName('CD_COMPRADOR').AsInteger;
     end;

    Result := DadosFornecedor;
  finally
    FreeAndNil(tempQuery);
  end;

end;

function TransformaStringCodigo(PstCodigo:String):TCodigoValido;
var
 nrTemp,cdTemp,dvTem :Integer;
begin
  nrTemp:= StrToIntDef(PstCodigo,0);
  Result.nrCodigo:= StrToIntDef(copy(FormatFloat('00000000',nrTemp),1,7),0);
  Result.nrDigito:= StrToIntDef(copy(FormatFloat('00000000',nrTemp),8,1),0);
end;



function DiasEstoqueFinanceiroAtual(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TDadosDiasEstoque;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
   try
    with stQry do
    begin
      Add('SELECT');
      Add('CD_EMPRESA,');
      Add('CASE');
      Add('WHEN CD_EMPRESA=1 THEN ''CD. TUBAR?O''');
      Add('      WHEN CD_EMPRESA=4 THEN ''CD. STA.CRUZ DO SUL''');
      Add('      WHEN CD_EMPRESA=5 THEN ''GERAL''');
      Add('      END  LOCAL_CD,');
      Add('');
      Add('   SUM(VT_CMV),SUM(VT_CUSTO),');
      Add('   ROUND(SUM(VT_CUSTO)/ (SUM(VT_CMV)/30),0) NR_DIAS');
      Add('FROM');
      Add('(SELECT  ESTOQUE.CD_EMPRESA,ESTOQUE.CD_MERCADORIA,ESTOQUE.CD_MERCADORIA ,VT_ESTOQUE,QT_FISICO,VT_CUSTO , VT_CMV');
      Add('FROM');
      Add('(SELECT  EM.CD_MERCADORIA AS CD_MERCADORIA,EM.CD_EMPRESA,SUM(QT_FISICO) AS QT_FISICO ,(SUM(QT_FISICO*VL_CUSTO_FINANCEIRO_MERCADORIA)) AS VT_ESTOQUE, SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) VT_CUSTO FROM');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DC_ESTOQUE_MERCADORIA  EM,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA  FM');
      Add('WHERE');
      Add('CM.CD_MERCADORIA=EM.CD_MERCADORIA');
      Add('AND FM.CD_MERCADORIA=EM.CD_MERCADORIA');
      Add('');
      Add('AND CM.CD_EMPRESA=EM.CD_EMPRESA');
      Add('');
      Add('AND FM.CD_EMPRESA=EM.CD_EMPRESA');
     if PnrEmpresa>0 then
       Add('AND FM.CD_EMPRESA=:PnrEmpresa');

      if PnrFornecedor>0 then
         Add(' AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
          Add(' AND CD_COMPRADOR=:Pnrcomprador');
      Add('');
      Add('GROUP BY EM.CD_EMPRESA,EM.CD_MERCADORIA) ESTOQUE');
      Add('');
      Add('LEFT OUTER JOIN');
      Add('(SELECT CM.CD_EMPRESA,CM.CD_MERCADORIA,SUM(QT_VENDIDA),ROUND(SUM( VT_CMV ),2) VT_CMV');
      Add('  FROM');
      Add('    PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('    PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM');
      Add('WHERE');
      Add('  CM.CD_MERCADORIA=VM.CD_MERCADORIA');
      Add('  AND CM.CD_EMPRESA=VM.CD_EMPRESA');
       if PnrEmpresa>0 then
       Add('AND CM.CD_EMPRESA=:PnrEmpresa');
     if PnrFornecedor>0 then
         Add(' AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
         Add(' AND CD_COMPRADOR=:Pnrcomprador');
      Add('  AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1)');
      Add('  GROUP BY CM.CD_EMPRESA,CM.CD_MERCADORIA) VENDA ON VENDA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
      Add('                                                   AND VENDA.CD_EMPRESA=ESTOQUE.CD_EMPRESA)');
      Add('GROUP BY CD_EMPRESA');



    end;
    stQry.SaveToFile('c:\temp\qryDiasEstoqueNovo.sql');
    with _cdsTemp do
    begin
       close;
       CommandText:=stQry.Text;
       if PnrFornecedor>0 then
          Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       if PnrComprador>0 then
          Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
       if PnrEmpresa>0 then
          Params.ParamByName('PnrEmpresa').AsInteger := PnrEmpresa;
       open;
      end;
//      result:=0;
      result.nrComprador:=0;
      result.cdEmpresa:=0;
      result.vlDiasEstoqueFornecedor:=0;
      result.vlDiasEstoquecomprador:=0;
      result.vlDiasEstoqueFornecedorPen:=0;
      result.vlDiasEstoquecompradorPen:=0;
      result.nmLocal:=' ';
      if not _cdsTemp.IsEmpty then
      begin
//       _cdsTemp:=SetTabelaDiasEstoque(_cdsTemp);
         result.nmLocal:=_cdsTemp.FieldByName('LOCAL_CD').AsString;
         result.cdEmpresa:=_cdsTemp.FieldByName('CD_EMPRESA').AsInteger;
         result.nrComprador:=PnrComprador;
         if PnrFornecedor>0 then
           result.vlDiasEstoqueFornecedor:=_cdsTemp.FieldByName('NR_DIAS').AsFloat;
         If (PnrComprador>0)and (PnrFornecedor=0) then
           result.vlDiasEstoquecomprador:=_cdsTemp.FieldByName('NR_DIAS').AsFloat;
      end;
   except
      on E: Exception do
      begin
//        result:=0;
        trataerro(E.Message, 'Erro ao Abrir Dias de Estoque');
      end;

   end;


  finally
     FreeAndNil(stQry);
  end;
end;


function RestricaoDeCompra(PnrProduto:Integer):Boolean;
var
  stQry: TstringList;
  tempQuery :TSQLQuery;
begin
  try
    tempQuery := nil;
     tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;

    with tempQuery do
    begin
      SQL.Add('SELECT * FROM DC_RECALL_MERCADORIA');
      SQL.Add('WHERE');
      SQL.Add('CD_RECALL_MERCADORIA=8');
      sql.add('and DT_RETORNO_FABRICANTE<trunc(sysdate)');
      sql.add('and DT_AVISO_RECALL_MERCADORIA>trunc(sysdate)');
      SQL.Add('AND CD_MERCADORIA=:PnrProduto');
      ParamByName('PnrProduto').AsInteger:=PnrProduto;
      open;
    end;
    Result:=false;
    if not tempQuery.IsEmpty then
       result:=true;
  finally
    FreeAndNil(tempQuery);
  end;
end;

function AbreEspecealidadeFornecedor(PnrFornecedor:Integer):TClientDataset;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT DS_DESCRICAO_ESTRUTURA AS ESPECEALIDADE,NR_SEQUENCIAL');
      Add('FROM');
      Add('PRDDM.DC_CLASSIFICACAO_PRODUTO,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      aDD('M.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND NR_SEQUENCIAL=DS_NIVEL_EITM');
      Add('AND CM.CD_GRUPO_FORNECEDOR = :PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      Add('AND DS_NIVEL_ECNM=1');
      Add('GROUP BY DS_DESCRICAO_ESTRUTURA , NR_SEQUENCIAL');
      Add('UNION ALL');
      Add('(SELECT DS_DESCRICAO_ESTRUTURA AS ESPECEALIDADE, NR_SEQUENCIAL');
      Add('FROM');
      Add('PRDDM.DC_CLASSIFICACAO_PRODUTO,');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      aDD('M.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND NR_SEQUENCIAL=DS_NIVEL_ERGM');
      Add('AND CD_GRUPO_FORNECEDOR = :PnrFornecedor');
      Add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
      Add('AND DS_NIVEL_ECNM>1');
      Add('GROUP BY DS_DESCRICAO_ESTRUTURA ,NR_SEQUENCIAL)');
      Add('ORDER BY  ESPECEALIDADE');
    end;
    stQry.SaveToFile('C:\Temp\AbreEspecealidade.qry');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


Function SetQuantidadePaleteCamada( PqtPedido,
                                    PqtEmbalagem,
                                    PqtCamada,
                                    PqtPalete:Integer;
                                    PDiasEstoqueMaximo:Double;
                                    PquantidadeEstoquePendencia: Integer;
                                    PvlMediaDia,
                                    PpedidoEspecial:Double;
                                    PnrFrequenciaCompra:Double;
                                    PidCurva:String;
                                    PQtdPendencia,
                                    PQtdEstoqueSeguranca:Integer):TDadosSugestaoCamadaPalete;

var
  qtMultiplo,
  qtInteira,
  qtdCamada,
  qtdPalete,

  QtdUnidadeCamada,
  QtdUnidadePalete,
  NrDiasSugestao : Integer;
  qtPedidoTemp,
  pcDiferencaQuantidade,
  pcDiferencaDiasEstoque,
  nrDiasEstoqueCalculado,
  nrDiasEstoquePedido,
  QtdSugestaoCamada,
  QtdSugestaoPalete,
  nrQuantidadeParametro,
  nrDiasCamada,
  NrDiasPalete,
  difCamada,
  difPalete,
  DiasPalete_30Dias,
  DiasCamada_30Dias,

  vlParamentro:Double;

  vlParteInteira  :Integer;

  qtdRestoCamada,
  qtdRestoPalete,
  nrDiasRestoPalete,
  nrDiasRestoCamada,
  vlParteFracionada :Double;
begin

  QtdUnidadeCamada:=   PqtCamada *  PqtEmbalagem;
  QtdUnidadePalete:=   PqtPalete *  PqtEmbalagem;


  DiasPalete_30Dias := 0;
  DiasCamada_30Dias := 0;
  qtPedidoTemp:=PqtPedido;
 try

  nrDiasEstoquePedido:=  PquantidadeEstoquePendencia/PvlMediaDia;

  if QtdUnidadePalete>0 then
  begin
     vlParteInteira     :=  trunc(PqtPedido / QtdUnidadePalete);
     vlParteFracionada  :=   frac(PqtPedido / QtdUnidadePalete);

     nrDiasRestoPalete  := ((1 - vlParteFracionada)*QtdUnidadePalete)/PvlMediaDia;

     if (nrDiasRestoPalete+nrDiasEstoquePedido)>PnrFrequenciaCompra then
       QtdSugestaoPalete := vlParteInteira
     else
       QtdSugestaoPalete := vlParteInteira +1;


    if QtdSugestaoPalete>0 then
       qtPedidoTemp:=  QtdSugestaoPalete *QtdUnidadePalete

   end;

  if (QtdUnidadeCamada>0) and (QtdSugestaoPalete=0) then
  begin
     vlParteInteira     :=  trunc((PqtPedido)  / QtdUnidadeCamada);
     vlParteFracionada  :=  frac((PqtPedido) / QtdUnidadeCamada);

     nrDiasRestoCamada  := ((1 - vlParteFracionada)*QtdUnidadeCamada)/PvlMediaDia;

     if (nrDiasRestoCamada+nrDiasEstoquePedido)>PnrFrequenciaCompra then
       QtdSugestaoCamada := vlParteInteira
     else
       QtdSugestaoCamada := vlParteInteira +1;
    if QtdSugestaoCamada>0 then
       qtPedidoTemp:=  QtdSugestaoCamada *QtdUnidadeCamada

  end;

  NrDiasSugestao:=CalculaNrDiasEstoque(strtoint(formatfloat('0000000000',qtPedidoTemp)),
                                        PquantidadeEstoquePendencia,
                                        0,
                                        strtoint(formatfloat('0000000000',PvlMediaDia*PnrFrequenciaCompra)) ,
                                        PvlMediaDia );


  Result.qtPedido:= strtoint(formatfloat('00000000',qtPedidoTemp));
  Result.nrDiasComSugestao:=NrDiasSugestao;

 except
 begin
   mensagem('Produto :'+formatfloat('000.00',PvlMediaDia) ,MB_ICONERROR );
 end;

 end;

end;




function AbreProdutosFornecedorFornecedor(PnrFornecedor:Integer):TClientDataset;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_MERCADORIA,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('PC_DESCONTO_PADRAO_COMPRA AS PC_DESCONTO_PADRAO,');
      Add('0.00 AS PC_DESCONTO_ADICIONAL,');
      Add('0.00 AS VT_CAIXA_FECHADA,');
      Add('0.00 AS VT_CAIXA_FECHADA_DESCONTO,');
      Add('0.00 AS VL_COMPRA_MERCADORIA,');
      Add('0.00 AS VL_COMPRA_MERCADORIA_DESCONTO,');
      Add('0.00 AS PC_DESCONTO_ADICIONAL_RS,');
      Add('0.00 AS VT_CAIXA_FECHADA_RS,');
      Add('0.00 AS VT_CAIXA_FECHADA_DESCONTO_RS,');
      Add('0.00 AS VL_COMPRA_MERCADORIA_RS,');
      Add('0.00 AS VL_COMPRA_MERCADORIA_DESC_RS,VL_PRECO_COMPRA,COMPRA.CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA  MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
      Add('LEFT OUTER JOIN PRDDM.DC_FISCAL_MERCADORIA FISCAL ON MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
      Add('LEFT OUTER JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FISCAL.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA AND FISCAL.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON COMPRA.CD_GRUPO_FORNECEDOR=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
      Add('LEFT OUTER JOIN PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA ON LOGISTICA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND FISCAL.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
      Add('LEFT OUTER JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND ESTOQUE.CD_EMPRESA=LOGISTICA.CD_EMPRESA AND ESTOQUE.ID_SITUACAO_MERCADORIA <>''I''');
      Add('WHERE');
      Add('COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('GROUP BY MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA ,');
      Add('NM_MERCADORIA,');
      Add('DS_APRESENTACAO_MERCADORIA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('PC_DESCONTO_PADRAO_COMPRA,VL_PRECO_COMPRA,COMPRA.CD_EMPRESA');

    end;
    stQry.SaveToFile('C:\Temp\ListaProdutoFornecedor.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


function GetPrecoListaAtiva(PnrLista,PnrCD,PnrProduto:Integer):TListaPrecoAtiva;
var
  stQry: TstringList;
  tempQuery :TSQLQuery;
begin
  try
    tempQuery := nil;
     tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;

    with tempQuery do
    begin
      SQL.Add('SELECT CD_PRECO_FORNECEDOR_EXCECAO,');
      SQL.Add('VL_COMPRA_MERCADORIA,');
      SQL.Add('VL_COMPRA_MERCADORIA_DESCONTO,');
      SQL.Add('PC_DESCONTO_COMPRA,');
      SQL.Add('NR_VERBA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO');
      SQL.Add('WHERE');
      SQL.Add('CD_PRECO_FORNECEDOR_EXCECAO=:PnrLista');
      SQL.Add('AND CD_EMPRESA=:PnrEmpresa');
      SQL.Add('AND CD_MERCADORIA=:PnrProduto');
      ParamByName('PnrLista').Asbcd:=PnrLista;
      ParamByName('PnrEmpresa').Asbcd:=PnrCD;
      ParamByName('PnrProduto').Asbcd:=PnrProduto;
      open;
    end;
    Result.vlPrecoLista:=0;
    Result.vlPrecoComdesconto:=0;
    Result.PcIcmsCompra:=0;
    Result.PcDescontoAdicional:=0;
    Result.nrListaPreco:=0;
    Result.nrVerba:=0;
    if not tempQuery.IsEmpty then
    begin
     Result.vlPrecoLista:=tempQuery.FieldByName('VL_COMPRA_MERCADORIA').AsFloat;;
     Result.vlPrecoComdesconto:=tempQuery.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO').AsFloat;;
     Result.PcDescontoAdicional :=tempQuery.FieldByName('PC_DESCONTO_COMPRA').AsFloat;
     Result.nrListaPreco:=PnrLista;
     Result.nrVerba:=tempQuery.FieldByName('NR_VERBA').AsInteger;

    end;
  finally
    FreeAndNil(tempQuery);
  end;
end;



function AbrePrecoListaAtiva(PnrLista:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT CD_PRECO_FORNECEDOR_EXCECAO, CD_EMPRESA,  CD_MERCADORIA,');
      Add('VL_COMPRA_MERCADORIA,');
      Add('VL_COMPRA_MERCADORIA_DESCONTO,');
      Add('PC_DESCONTO_COMPRA,');
      Add('NR_VERBA');
      Add('FROM');
      Add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO');
      Add('WHERE');
      Add('CD_PRECO_FORNECEDOR_EXCECAO=:PnrLista');
    end;
     stQry.SaveToFile('C:\Temp\ItemListaProdutoFornecedor.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrLista').AsBCD:=PnrLista;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;



  finally
    FreeAndNil(stQry);
  end;
end;



function ListaVerbaFornecedor(PnrFornecedor:Integer):TClientDataSet;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT NROV_V,CD_GRUPO_FORNECEDOR , DS_GRUPO_FORNECEDOR,STAV_V');
      Add('FROM');
      Add('PRDDM.DCVEB,');
      Add('PRDDM.DC_GRUPO_FORNECEDOR');
      Add('WHERE');
      Add('LABV_V=CD_GRUPO_FORNECEDOR');
      Add('AND  STAV_V NOT IN(''I'',''N'')');
      Add('AND CD_GRUPO_FORNECEDOR=:PnrForncedor');
      Add('AND NROV_V>0');

    end;
     stQry.SaveToFile('C:\Temp\Compra_ListaProdutoVerbasDisponivel.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrForncedor').AsBCD:=PnrFornecedor;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
    begin
       _cdsTemp:=SetTabelaListaVerba(_cdsTemp);
       result:=_cdsTemp;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;



function SetTabelaListaVerba(PTabela:TclientDataset):TclientDataset;
begin
//  NROV_V,CD_GRUPO_FORNECEDOR , DS_GRUPO_FORNECEDOR,STAV_V
 TIntegerField(PTabela.FieldByName('NROV_V')).DisplayLabel:='Nr.verba';
 TIntegerField(PTabela.FieldByName('NROV_V')).DisplayWidth:=6;

 TIntegerField(PTabela.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
 TIntegerField(PTabela.FieldByName('NROV_V')).DisplayWidth:=6;

 TIntegerField(PTabela.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
 TIntegerField(PTabela.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=30;

 Result:=PTabela;



end;

function TabelaLeadTimeTermolabil(PnrFornecedor:Integer):TClientDataset;

var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with stQry do
    begin
      Add('SELECT lt.CD_EMPRESA,ID_UNIDADE_FEDERACAO,ID_TERMOLABIL,');
      Add('case');
      Add(' WHEN id_unidade_federacao=''ES''  AND (Trunc(sysdate)<=To_Date(''31/12/2018''))');
      Add(' THEN qt_dias_leadtime_fabricante');
      Add(' ELSE QT_DIAS_MEDIO_LEADTIME');
      Add('END  QT_DIAS_MEDIO_LEADTIME,');
      Add('QT_DIAS_DESVIOPADRAO_LEADTIME');
      Add('FROM');
      Add('PRDDM.DC_LEADTIME_FORNECEDOR LT,');
      Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
      Add('ACESSO.DC_EMPRESA EMP');
      Add('WHERE CD_LEADTIME=4');
      ADD('AND ID_EMPRESA_FISICA=''S''');
      add('and GF.CD_GRUPO_FORNECEDOR= LT.CD_GRUPO_FORNECEDOR');
      ADD('AND LT.CD_EMPRESA=EMP.CD_EMPRESA');
      Add('AND LT.CD_GRUPO_FORNECEDOR=:PnrFornecedor');  ;
    end;

    stQry.SaveToFile('C:\Temp\qryBuscaLeadTime.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;

  finally
    FreeAndNil(stQry);
  end;

end;



function GetFrequenciaEstoqueMaximo(PnrGrupoFornecedor:Integer):TDadosFrequencia;
var
  stQry: TstringList;
  tempQuery :TSQLQuery;
begin
  try
    tempQuery := nil;
     tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;

    with tempQuery do
    begin
     SQL.Add('SELECT MIN(QT_DIAS_FREQUENCIA_COMPRA) as QT_DIAS_FREQUENCIA_COMPRA,');
     SQL.Add('MIN(QT_ESTOQUE_MAXIMO) as QT_ESTOQUE_MAXIMO');
     SQL.Add('FROM');
     SQL.Add('PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA');
     SQL.Add('WHERE');
     SQL.Add('CD_GRUPO_CURVA_FABRICANTE=:PnrGrupoFornecedor');
     ParamByName('PnrGrupoFornecedor').AsBCD:=PnrGrupoFornecedor;
      OPEN;

    end;

    result.nrFrequenciaCompra:=7;
    result.nrEstoqueMaximo:=28;
    if not tempQuery.IsEmpty then
    begin
      Result.nrFrequenciaCompra:=tempQuery.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsFloat;
      Result.nrEstoqueMaximo   :=tempQuery.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger;
    end;
  finally
    FreeAndNil(tempQuery);
  end;

end;


function AbreIndiceFalta(PnrFornecedor:Integer):TClientDataset;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
      Add('SELECT');
      Add('EXTRACT(MONTH FROM  LAST_DAY(DT_VENDA_MERCADORIA)) MES,');
      Add('DT_VENDA_MERCADORIA,COMPRA_MERCADORIA.CD_MERCADORIA,');
      Add('VAM.CD_EMPRESA,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
      Add('CASE');
      Add('WHEN EXTRACT(MONTH FROM  LAST_DAY(SYSDATE))=EXTRACT(MONTH FROM  LAST_DAY(DT_VENDA_MERCADORIA)) THEN');
      Add('ROUND(SUM(QT_DIAS_ESTOQUE_ZERO)/EXTRACT(DAY FROM  SYSDATE-1) *100,0)');
      Add('ELSE');
      Add('ROUND(SUM(QT_DIAS_ESTOQUE_ZERO)/EXTRACT(DAY FROM  LAST_DAY(DT_VENDA_MERCADORIA)) *100,0)');
      Add('END INDICE_FALTA');
      Add('FROM');
      Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VAM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA');
      Add('WHERE');
      Add('VAM.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
      Add('AND VAM.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA');
      Add('AND DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1)');
      Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND cd_operador_logistico=1');
      Add('AND CD_CANAL=0');
      Add('GROUP BY VAM.CD_EMPRESA,COMPRA_MERCADORIA.CD_MERCADORIA,DT_VENDA_MERCADORIA');

    end;
    stQry.SaveToFile('C:\Temp\AbreIndiceFalta.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;



function AtualizaStatusPedidoNovo(PnrPedido,
                                  PcdPagamento,
                                  PnrOperadorLogistico,
                                  PnrLeadTime:Integer;
                                  PidStatusPedido,
                                  PStObservacao:String;
                                  PidAtualizaAgenda:Boolean;
                                  PdtPrevisatFaturamento,
                                  PdtAgenda,
                                  PdtProximaAgenda:Tdate;
                                  PidBonificado:boolean;
                                  PnrVerba:Integer):Boolean;
begin
       if  AtualizaCapaPedido(PnrPedido,
                           PcdPagamento,
                           PnrOperadorLogistico,
                           PnrLeadTime,
                           PidStatusPedido,
                           PstObservacao,
                           PidAtualizaAgenda,
                           PdtPrevisatFaturamento,
                           PdtAgenda,
                           PdtProximaAgenda,0,
                           PnrVerba,
                           Pidbonificado,0) then
           AtualizaStatusItemPedido(PnrPedido, 0, PnrOperadorLogistico,PidStatusPedido);
end;



function DiasdeCompra(stEntrada: String): String;
var
  I: Integer;
  stDias: string;
begin
  stDias := '';
  for I := 1 to 5 do
  begin
    if copy(stEntrada, I, 1) = '1' then
      if stDias = '' then
        stDias := Diasemana[I + 1]
      else
        stDias := stDias + ',' + Diasemana[I + 1];

  end;
  result := stDias;
end;


function GetLembreteFornecedor(PnrFornecedor: Integer;PdtValidade:Tdate):Boolean;
VAR
  qryTemp: TSQLQuery;
  ST_QRY: STRING;
begin
  TRY
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;

    with qryTemp do
    begin
      close;
      sql.Clear;
      sql.Add('select TIPS_S,NROS_S,SEQS_S,OBSS_S,DVAS_S,DLCS_S');
      sql.Add(' from prddm.dcobs where tips_s=''L'' and nros_s=:PnrFornecedor');
      sql.Add('order by DLCS_S desc');
      ParamByname('PnrFornecedor').AsInteger := PnrFornecedor;
      open;
      first;
    END;
   Result:=false;
    if not qryTemp.IsEmpty then
      Result:=true;
  finally
    FreeAndNil(qryTemp);
  end;
end;


function GetObservacaoInativacaoBloqueio(PnrProduto : Integer;PidTipo:String):WideString;
VAR
  qryTemp: TSQLQuery;
  ST_QRY: STRING;
begin
  TRY
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;

    with qryTemp do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT OBSS_S,NUSS_S FROM prddm.dcobs');
      sql.Add('WHERE tips_s=:PidTipo');
      sql.Add('AND  dlcs_s=(SELECT Max(dlcs_s) FROM prddm.dcobs');
      sql.Add('                                WHERE   tips_s=:PidTipo AND nros_s=:PnrProduto)');
      sql.Add('AND nros_s=:PnrProduto');
      ParamByname('PnrProduto').AsBCD := PnrProduto;
      ParamByname('PidTipo').AsString := PidTipo;
      open;
      first;
    END;
    Result:=EmptyStr;
    if not qryTemp.IsEmpty then
      Result:=qryTemp.FieldByName('OBSS_S').ASSTRING+' - '+
              qryTemp.FieldByName('NUSS_S').AsString;
  finally
    FreeAndNil(qryTemp);
  end;
end;




function VendaCanalOperador(PnrFornecedor:Integer):TClientDataset;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin


     Add(' SELECT');
     Add(' VENDA.CD_MERCADORIA,');
     Add(' VENDA.CD_EMPRESA,');
     Add(' QT_VENDIDA VENDA_CANAL ,');
     Add(' CD_CANAL,');
     Add('CASE');
     Add('WHEN CD_CANAL=0 AND CD_OPERADOR_LOGISTICO=1 THEN ''Empresa''');
     Add('WHEN CD_CANAL=1 AND CD_OPERADOR_LOGISTICO=1 THEN ''FARMA''');
     Add('WHEN CD_CANAL=2 THEN ''ALIMENTAR''');
     Add('WHEN CD_CANAL=3 THEN ''HOSPITALAR''');
     aDD('WHEN CD_OPERADOR_LOGISTICO>1 THEN ''Op. Logistica''');
     Add('END DS_CANAL,');
     Add('CD_OPERADOR_LOGISTICO,');
     Add('DT_VENDA_MERCADORIA');
     Add('FROM');
     Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
     Add('PRDDM.DC_COMPRA_MERCADORIA CM');
     Add('WHERE');
     Add('VENDA.CD_MERCADORIA=CM.CD_MERCADORIA');
     Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
     Add('AND CD_CANAL>0');
 //    Add('--AND cm.CD_MERCADORIA=760');
//     aDD('--AND  DT_VENDA_MERCADORIA ='01/03/2020'');
//     Add('--AND cm.cd_empresa=4');
     Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),-17)');
     Add('');
     Add('');
  {   Add('UNION ALL');
     Add('');
     Add('');
     Add('');
     Add('SELECT');
     Add('');
     Add(' CD_MERCADORIA');
     Add(' ,CD_EMPRESA');
     aDD(' ,Abs(sum(TOTAL_EMPRESA) - SUM((OUTROS))) TOTAL_EMPRESA');
     Add(' ,1 CD_CANAL');
     Add(' ,''FARMA'' DS_CANAL');
     Add(' ,1 CD_OPERADOR_LOGISTICO');
     Add(' ,DT_VENDA_MERCADORIA');
     Add('from');
     Add('');
     Add('(SELECT');
     Add(' VENDA.CD_MERCADORIA,');
     Add(' VENDA.CD_EMPRESA,');
     Add(' QT_VENDIDA TOTAL_EMPRESA ,');
     Add(' 0 AS outros');
     Add(' ,0 CD_CANAL,');
     aDD('CASE');
     Add('WHEN CD_CANAL=0 AND CD_OPERADOR_LOGISTICO=1 THEN ''Empresa''');
     Add('WHEN CD_CANAL=1 AND CD_OPERADOR_LOGISTICO=1 THEN ''FARMA''');
     Add('WHEN CD_CANAL=2 THEN ''ALIMENTAR''');
     Add('WHEN CD_CANAL=3 THEN ''HOSPITALAR''');
     Add('WHEN CD_OPERADOR_LOGISTICO>1 THEN ''Op. Logistica''');
     Add('END DS_CANAL,');
     Add('CD_OPERADOR_LOGISTICO,DT_VENDA_MERCADORIA');
     Add('FROM');
     Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
     Add('PRDDM.DC_COMPRA_MERCADORIA CM');
     Add('WHERE');
     Add('VENDA.CD_MERCADORIA=CM.CD_MERCADORIA');
     aDD('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
     Add('AND CD_CANAL=0');
//     Add('--AND cm.CD_MERCADORIA=760');
 //    Add('--AND  DT_VENDA_MERCADORIA ='01/03/2020'');
  //   Add('--AND cm.cd_empresa=4');
     Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),-12)');
     Add('');
     Add('UNION all');
     Add('');
     Add('SELECT');
     Add(' VENDA.CD_MERCADORIA,');
     Add(' VENDA.CD_EMPRESA,');
     aDD(' 0 TOTAL_EMPRESA ,');
     Add(' Sum(QT_VENDIDA) outros ,');
     Add('  500 CD_CANAL,');
     Add('''OUTROS'' DS_CANAL,');
     Add('500  CD_OPERADOR_LOGISTICO');
     Add(',DT_VENDA_MERCADORIA');
     Add('FROM');
     Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
     Add('PRDDM.DC_COMPRA_MERCADORIA CM');
     Add('WHERE');
     Add('VENDA.CD_MERCADORIA=CM.CD_MERCADORIA');
     Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
     aDD('AND CD_CANAL>0');
     Add('AND ID_SITUACAO_MERCADORIA=''A''');
     Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),-12)');
     Add('GROUP BY');
     Add('VENDA.CD_MERCADORIA,');
     Add('VENDA.CD_EMPRESA,');
     Add('DT_VENDA_MERCADORIA)');
     Add('GROUP BY');
     Add('CD_MERCADORIA');
     Add(',CD_EMPRESA');
     Add(',DT_VENDA_MERCADORIA');



       ///-------
    {  Add('(SELECT CD_MERCADORIA,CD_EMPRESA,  SUM(TOTAL_EMPRESA- TOTAL_CANAL) ');
      Add('VENDA_CANAL, 1 as CD_CANAL,''FARMA'' DS_CANAL , 1 CD_OPERADOR_LOGISTICO,DT_VENDA_MERCADORIA');
      aDD('');
      Add('FROM');
      Add('(SELECT VENDA.CD_MERCADORIA,VENDA.CD_EMPRESA,');
      Add('SUM(QT_VENDIDA) TOTAL_EMPRESA ,0 TOTAL_CANAL ,0 CD_CANAL,''GERAL'' AS DS_CANAL ,1 CD_OPERADOR_LOGISTICO,DT_VENDA_MERCADORIA');
      Add('');
      Add('FROM');
      Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      Add('VENDA.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CD_CANAL=0');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),-12)');
      Add('GROUP BY VENDA.CD_MERCADORIA,VENDA.CD_EMPRESA,DT_VENDA_MERCADORIA');
      Add('UNION ALL');
      Add('SELECT VENDA.CD_MERCADORIA,VENDA.CD_EMPRESA,0  TOTAL_EMPRESA,');
      Add('SUM(QT_VENDIDA) AS TOTAL_CANAL , 0 CD_CANAL,''GERAL'' AS DS_CANAL , 1 CD_OPERADOR_LOGISTICO,');
      add('DT_VENDA_MERCADORIA');

      Add('FROM');
      Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      Add('VENDA.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CD_CANAL>0');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),-12)');

//      Add('AND DT_VENDA_MERCADORIA= '01/10/2017''
      Add('GROUP BY VENDA.CD_MERCADORIA,VENDA.CD_EMPRESA,DT_VENDA_MERCADORIA)');
      Add('GROUP BY CD_MERCADORIA,CD_EMPRESA,DT_VENDA_MERCADORIA)');
      Add('UNION ALL');
      Add('SELECT VENDA.CD_MERCADORIA,VENDA.CD_EMPRESA,');
      Add('SUM(QT_VENDIDA) TOTAL_EMPRESA ,CD_CANAL,');

      Add('CASE');
      Add('WHEN CD_CANAL=1 THEN ''FARMA''');
      Add('WHEN CD_CANAL=2 THEN ''ALIMENTAR''');
      Add('WHEN CD_CANAL=3 THEN ''HOSPITALAR''');
      Add('WHEN CD_CANAL>3 THEN ''Op. Logistica''');
      Add('END DS_CANAL,');

      Add('CD_OPERADOR_LOGISTICO,DT_VENDA_MERCADORIA');

      Add('FROM');
      Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      Add('VENDA.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND VENDA.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CD_CANAL>0');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE, ''MONTH''),-12)');
      Add('GROUP BY VENDA.CD_MERCADORIA,VENDA.CD_EMPRESA,CD_CANAL , CD_OPERADOR_LOGISTICO,DT_VENDA_MERCADORIA');}
    end;
    stQry.SaveToFile('C:\Temp\qryVendaCanalOperador.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
      _cdsTemp.IndexFieldNames:='DS_CANAL';
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


Function GetNumeroVerba(PnrVerba,PnrLaboratorio:Integer):Integer;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT NROV_V,LABV_V');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DCVEB');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('STAV_V not in(''N'',''I'')');
    if PnrVerba>0 then
    begin
      tempQuery.SQL.Add('AND  NROV_V=:PnrVerba');
     tempQuery.ParamByName('PnrVerba').AsInteger:=Pnrverba;
    end;
    if PnrLaboratorio>0 then
    begin
      tempQuery.SQL.Add('AND LABV_V=:PnrLaboratorio');
      tempQuery.ParamByName('PnrLaboratorio').AsInteger:=PnrLaboratorio;
    end;
    tempQuery.Open;
    Result:=0;
    if not tempQuery.IsEmpty then
           result:=tempQuery.FieldByName('NROV_V').AsInteger;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;





Function AbrePedidosCompradorNovo(PnrComprador,
                               PnrFornecedor:Integer;
                               PidSituacao:String;
                               PcdSituacao:Integer;  // 0 - Todos 1 - Faturados 2 Novos 3 - Novos/Faturados/Pendentes
                               PdtInicio,PdtFinal:TDateTime;
                               PcdOperacaoRede:Integer):TClientDataSet;
var
 stQuery :TStringList;
_cdsTemp:TClientDataSet;

begin
 try

 case PcdSituacao of
    0: PidSituacao:=' ';
    1: PidSituacao:='F';
    2: PidSituacao:='N';
    3: PidSituacao:='Z';
  end;


    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';


   stQuery:=TStringList.Create;
   with stQuery do
   begin
     add('SELECT NROP_P,');
     ADD('ID_UNIDADE_FEDERACAO AS LOCAL_CD,');
     add('LABP_P,NM_FORNECEDOR,DT_PEDIDO ,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,SITP_P,');
     add('SUM(NR_ITENS) AS NR_ITENS,SUM(NR_UNIDADES) AS NR_UNIDADES,');
     add('NVL(SUM(NR_CANCELADO),0) AS NR_CANCELADO,');
     add('NVL(SUM(NR_NOVO),0) AS NR_NOVO,ROUND(SUM(VL_PEDIDO_CUSTO),2) AS VL_PEDIDO_CUSTO,');
     add('SUM(VL_PED_LIQ) AS VL_PED_LIQ,');
     add('ROUND(SUM(VL_PEDIDO_FABR),2) AS VL_PEDIDO_FABR,SUM(NVL(NR_FATURADO,0)) AS NR_FATURADO,');
     add('SUM(NVL(QT_FATURADO,0)) AS QT_FATURADO,');
     add('SUM(VL_PED_FAT_LIQ) AS VL_PED_FAT_LIQ,');
     add('ROUND(SUM(VL_PED_FAT_CUSTO),2) AS VL_PEDIDO_FAT,');
     add('ROUND(SUM(VL_PED_FAT_FABR),2) AS VL_PED_FAT_FABR,');
     add('NR_CONDICAO_PAGTO_P,CD_EMPRESA,');
     add('sum(Nvl(NR_ITENS_BONIFICADO,0)) AS NR_ITENS_BONIFICADO,');
     add('CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO');
     add('FROM');
     add('(SELECT');
     add('LABP_P,NROP_P,DATP_P AS DT_PEDIDO,PREP_P AS DT_PREVISTA,DT_PREVISTA_FATURAMENTO,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,');
     add('SITP_P,COUNT(*) NR_ITENS,SUM(QUAY_Y) as NR_UNIDADES,');
     add('SUM(QUAY_Y *VCCI_Y) as VL_PEDIDO_CUSTO,SUM(QUAY_Y *PFBY_Y) AS VL_PEDIDO_FABR,');
     add('SUM(CHEY_Y *VCCI_Y) as VL_PED_FAT_CUSTO,SUM(CHEY_Y * PFBY_Y) AS VL_PED_FAT_FABR,');
     add('SUM(QUAY_Y * PUNY_Y) AS VL_PED_LIQ,');
     add('SUM(CHEY_Y * PUNY_Y) AS VL_PED_FAT_LIQ,');

     add('CASE');
     add('WHEN SITY_Y=''P'' THEN COUNT(*)');
     add('END NR_PARCIAL,');
     add('CASE');
     add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN COUNT(*)');
     add('END NR_FATURADO,');
     add('CASE');
     add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN Sum(CHEY_Y)');
     add('END QT_FATURADO,');
     add('CASE');
     add('WHEN SITY_Y=''C'' THEN COUNT(*)');
     add('END NR_CANCELADO,');
     add('CASE');
     add('WHEN SITY_Y=''N'' THEN COUNT(*)');
     add('END NR_NOVO,');
     add('NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,');
     add('CASE');
     add('WHEN VCCI_Y=0 THEN COUNT(*)');
     add('END NR_ITENS_BONIFICADO,');
     add('CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM,');
     add('ACESSO.DC_EMPRESA EMP');
     add('WHERE');
     ADD('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.CD_EMPRESA=EMP.CD_EMPRESA');
     add('AND NROP_P = NROP_Y');
     add('AND LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa');
     add('AND COMPRA_MERCADORIA.CD_MERCADORIA = ITEM.NROM_Y');
     if PnrFornecedor>0 then
         add('AND LABP_P=:PnrFornecedor');
     if (PcdSituacao<>3) and (trim(PidSituacao)<>'') then
         add('AND sitp_p=:PidStatus');
     if PcdSituacao=3 then
         add('AND sitp_p in(''N'',''P'',''F'',''T'')');
     if PcdSituacao=1 then
         add('AND sity_y not in(''C'',''I'',''S'',''T'')');
     if PcdOperacaoRede>0 then
       add('AND CD_OPERACAO_REDE=:PcdOperacao');



     add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
     add('AND DATP_P between :PdtInicio and :PdtFinal');
     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,SITP_P,SITY_Y,NROP_P,DATP_P,PREP_P,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,VCCI_Y,CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO)');
     add('GROUP BY LABP_P,NM_FORNECEDOR,NROP_P,SITP_P,DT_PEDIDO,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,CD_EMPRESA,CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO');
     add('ORDER BY DT_PEDIDO,LABP_P,NROP_P');
     stQuery.SaveToFile('c:\temp\qryRelacaoPedidoOPeracao.sql');
   end;
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;

     Params.ParamByName('PdtInicio').AsDateTime:=PdtInicio;
     Params.ParamByName('PdtFinal').AsDateTime :=PdtFinal;
     Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;
     if PnrFornecedor>0 then
       Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
     if (PcdSituacao>0) and (PcdSituacao<3) then
       Params.ParamByName('PidStatus').AsString:=PidSituacao;
     if PcdOperacaoRede>0 then
       Params.ParamByName('PcdOperacao').AsInteger:=PcdOperacaoRede;

     open;
   end;
   Result:=nil;
   if not _cdsTemp.isEmpty then
      Result:=_cdsTemp;

//   SetGridPedidos;
//   SetGridItemPedido;
//   setDesabilitaEdicaoItem;

 finally
   FreeAndNil(stQuery);
 end;
end;


function SugestaoPossivel(PnrQtdadeEmbalagem: Integer;
                          PnrQtdadeIdeal: Double): Integer;
begin
  Result := strtoint(FormatFloat('########0', PnrQtdadeIdeal));
  if PnrQtdadeEmbalagem > 0 then
    Result := strtoint(FormatFloat('########0',(PnrQtdadeIdeal / PnrQtdadeEmbalagem)));
  Result := Result * PnrQtdadeEmbalagem;

end;


Function CalculaNrDiasEstoque(PqtdSugerida,
                              PnrQuantidadeEstoque,
                              PnrQuantidadaPendente,
                              Pnrlotecompra:Integer;
                              PvlMediaDiaria:Double ):Integer;
begin
   result :=0;
   if PvlMediaDiaria>0 then
          result := strtoint(formatfloat('000000',((PqtdSugerida+PnrQuantidadeEstoque +
                                                   PnrQuantidadaPendente) )/PvlMediaDiaria));



end;



function InsereObservacao(PidTipo: String;
                         PnrCliente,
                         PnrSequencia: Integer;
                         PdsObservacao: String;
                         PdtObserva??o,
                         PdtLancamento: Tdate;
                         PnmUsuario,
                         PidSituacao: String;
                         vlLancamento: Double): boolean;
VAR
  qryTemp: TSQLQuery;
  ST_QRY: STRING;
begin
  TRY
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;

    with qryTemp do
    begin
      close;
      sql.Clear;

      sql.Add('insert into PRDDM.DCOBS');
      sql.Add('(TIPS_S,NROS_S,SEQS_S,OBSS_S,DVAS_S,DLCS_S,NUSS_S,SITS_S,VLRS_S)');
      sql.Add('values(:PidTipo,:PnrCliente,:PnrSequencia,:PdsObservacao,:PdtObservacao,sysdate,:PnmAtendenete,''P'',:PvlLancamento)');
      ParamByname('PidTipo').AsString := PidTipo;

      ParamByname('PnrCliente').Asbcd := PnrCliente;

      ParamByname('PnrSequencia').Asbcd := PnrSequencia;

      ParamByname('PdsObservacao').AsString := PdsObservacao;

      ParamByname('PdtObservacao').AsDateTime := PdtObserva??o;

      ParamByname('PnmAtendenete').AsString := copy(pnmUsuario,1,10);

      ParamByname('PvlLancamento').AsBCD    :=vlLancamento;

      result := TRUE;
      if ExecSQL(false) <= 0 then
        result := false;
    END;
  finally
    qryTemp.close;
    FreeAndNil(qryTemp);
  end;
end;


Function GetCriticaPedidoOPeracaoRede(PnrOperacao,PnrEmpresa:Integer):TClientDataSet;
var
  tempQuery : TSQLQuery;
  _cdsTemp:TClientDataSet;

begin
  tempQuery := nil;


    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

  try

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT DT_LANCAMENTO,DS_PEDIDO_COMPRA_RETORNO,NM_ARQUIVO_ORIGEM,');
    tempQuery.SQL.Add('CD_EMPRESA, CD_OPERACAO_REDE ');
    tempQuery.SQL.Add('FROM PRDDM.DC_INF_PEDIDO_COMPRA');
    tempQuery.SQL.Add('WHERE CD_EMPRESA =:PnrEmpresa');
    tempQuery.SQL.Add('AND CD_OPERACAO_REDE = :PnrOpercao');
    tempQuery.SQL.Add(' AND ID_RETORNO = 8');
//    tempQuery.ParamByName('PnrOpercao').AsBcd:=PnrOperacao;
    Result:=nil;

   with _cdsTemp do
   begin
     close;
     CommandText:=tempQuery.Text;
     Params.ParamByName('PnrEmpresa').AsBCD:=PnrEmpresa;
     Params.ParamByName('PnrOpercao').AsBCD:=PnrOperacao;
     open;
   end;
   Result:=nil;
   if not _cdsTemp.isEmpty then
      Result:=_cdsTemp;


  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

Function AtualizaStatusOPeracao(PnrEmpresa,PnrRede:Integer;PnmArquivo:String):boolean;
var
  tempQuery : TSQLQuery;

begin
  tempQuery := nil;


  try

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('UPDATE PRDDM.DC_INF_PEDIDO_COMPRA');
    tempQuery.SQL.Add('SET ID_RETORNO=7');
    tempQuery.SQL.Add('WHERE CD_EMPRESA = :PcdEmpresa');
    tempQuery.SQL.Add('AND CD_OPERACAO_REDE = :PnrOperacao');
    tempQuery.SQL.Add('AND ID_RETORNO = 8');
    tempQuery.SQL.Add('AND  UPPER(NM_ARQUIVO_ORIGEM)= UPPER(:PnmArquivo)');

    tempQuery.ParamByName('PnrOperacao').AsBcd:=PnrRede;
    tempQuery.ParamByName('PcdEmpresa').AsBcd:=PnrEmpresa;
    tempQuery.ParamByName('PnmArquivo').AsString:=PnmArquivo;
    Result:=true;

    result := TRUE;
    if tempQuery.ExecSQL(false) <= 0 then
       result := false;


  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;


function VerificaProdutoVinculado(PnrProduto,PnrEmpresa,PnrOperacaoRede:Integer):boolean;
var
  tempQuery : TSQLQuery;

begin
  tempQuery := nil;
  try

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT * FROM prddm.dc_operacao_rede_mercadoria');
    tempQuery.SQL.Add('WHERE  id_situacao=''A''');
    tempQuery.SQL.Add('AND CD_MERCADORIA=:PnrProduto');
    tempQuery.SQL.Add('AND CD_OPERACAO_REDE=:PnrOperacaoRede');
    tempQuery.SQL.Add('AND cd_empresa=:PnrEmpresa');
    tempQuery.ParamByName('PnrOperacaoRede').AsBcd:=PnrOperacaoRede;
    tempQuery.ParamByName('PnrEmpresa').AsBcd:=PnrEmpresa;
    tempQuery.ParamByName('PnrProduto').AsInteger:=PnrProduto;
    tempQuery.Open;
    Result:=true;
    if tempQuery.IsEmpty then
       result := false;


  finally
    tempQuery.Close;
    tempQuery.Free;
  end;

end;





Function GetPedidoEmEspera(PnrOperacao,PnrEmpresa:Integer):TClientDataSet;
var
  tempQuery : TSQLQuery;
  _cdsTemp:TClientDataSet;

begin
  tempQuery := nil;


    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

  try

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT  M.CD_MERCADORIA*10+NR_DV_MERCADORIA,');
    tempQuery.SQL.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    tempQuery.SQL.Add('QT_FISICO - QT_RESERVADO - QT_VENCIDO -');
    tempQuery.SQL.Add('QT_RESERVA_PROBLEMATICA- QT_BLOQUEADO DISPONIVEL,QT_RESERVADO ,EM.CD_EMPRESA,');
    tempQuery.SQL.Add('NROO_O,SNRO_O,DATO_O');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDIA.DCORD C,');
    tempQuery.SQL.Add('PRDDIA.DCYTE I,');
    tempQuery.SQL.Add('PRDDM.DC_MERCADORIA M,');
    tempQuery.SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA EM');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('NROO_O=NROO_Y');
    tempQuery.SQL.Add('AND M.ID_SITUACAO_MERCADORIA<>''I''');
    tempQuery.SQL.Add('AND EM.ID_SITUACAO_MERCADORIA<>''I''');
    tempQuery.SQL.Add('AND EM.CD_EMPRESA NOT IN(6)');
    tempQuery.SQL.Add('AND (STAO_O=''E'' OR (DATO_O>TRUNC(SYSDATE)))');
    tempQuery.SQL.Add('AND QT_FISICO - QT_RESERVADO - QT_VENCIDO -QT_RESERVA_PROBLEMATICA- QT_BLOQUEADO=0');
    tempQuery.SQL.Add('AND M.CD_MERCADORIA=EM.CD_MERCADORIA');
    tempQuery.SQL.Add('AND (QT_RESERVADO >0 OR QT_VENCIDO>0 OR QT_RESERVA_PROBLEMATICA>0 OR  QT_BLOQUEADO>0)');
    tempQuery.SQL.Add('AND M.CD_MERCADORIA=NROM_Y');
    tempQuery.SQL.Add('GROUP BY');
    tempQuery.SQL.Add(' M.CD_MERCADORIA*10+NR_DV_MERCADORIA,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    tempQuery.SQL.Add('QT_FISICO - QT_RESERVADO - QT_VENCIDO -QT_RESERVA_PROBLEMATICA- QT_BLOQUEADO,');
    tempQuery.SQL.Add('EM.CD_EMPRESA,QT_RESERVADO,NROO_O,SNRO_O ,DATO_O');
    tempQuery.SQL.Add('ORDER BY NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');

    Result:=nil;
   with _cdsTemp do
   begin
     close;
     CommandText:=tempQuery.Text;
     open;
   end;
   Result:=nil;
   if not _cdsTemp.isEmpty then
      Result:=_cdsTemp;


  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;




Function GeraTabelaProdutoFornecedor(PnrFornecedor,PnrComprador,PnrCD:Integer):TClientDataSet;
var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
    add('SELECT DIStinct CM.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR,');
    add('        M.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    add('        CD_INTERNO_LABORATORIO CD_INDUSTRIA ,');
    add('        CD_EAN_COMPRA ||''  '' as CD_EAN_COMPRA,');
    add('      NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA , PC_DESCONTO_PADRAO_COMPRA');
    add('  FROM');
    add('     PRDDM.DC_MERCADORIA M,');
    add('     PRDDM.DC_COMPRA_MERCADORIA CM ,');
    add('     PRDDM.DC_GRUPO_FORNECEDOR GF');
    add('      WHERE');
    add('     CM.CD_MERCADORIA=M.CD_MERCADORIA');
    add('     AND GF.CD_GRUPO_FORNECEDOR=CM.CD_GRUPO_FORNECEDOR');
    add('     AND GF.CD_GRUPO_FORNECEDOR not in(98)');

    if PnrFornecedor>0 then
    add('     AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    if PnrComprador>0 then
    add('    AND  CD_COMPRADOR=:PnrComprador');
    if PnrCD>0 then
       add('    AND  cm.CD_EMPRESA=:PnrCD');
    add('    AND  CM.ID_SITUACAO_MERCADORIA<>''I''');
    add(' ORDER BY 5,6');
   end;

   stQuery.SaveToFile('C:\Temp\Compras_qryProdutosFornecedor.sql');
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     if PnrFornecedor>0 then
        Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
     if PnrComprador>0 then
        Params.ParamByName('PnrComprador').AsBCD:=PnrComprador;
     if PnrCD>0 then
        Params.ParamByName('PnrCD').AsBCD:=PnrCD;

     open;

    end;
    Result:=_cdsTemp;
//    if not _cdsTemp.IsEmpty then
  //     Result:=_cdsTemp;
 finally
   FreeAndNil(stQuery);
 end;
end;


Function GeraTabelaProdutoReservaVencidos(PnrFornecedor,PnrComprador,PnrCd:Integer;
                                                          PidReservaPedido,
                                                          PidReservaVencido,
                                                          PidReservaAvaria,
                                                          PidReservaBloqueado:Boolean):TClientDataSet;

var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
     Add('SELECT  CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
     Add('           CD_GRUPO_FORNECEDOR ,  DS_GRUPO_FORNECEDOR,');
     Add('           CD, CD_PRODUTO,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
     Add(' CD_EAN_COMPRA,Sum(QT_MERCADORIA) AS QT_MERCADORIA ,DS_LOTE,DT_VALIDADE , CD_EMPRESA,PC_DESCONTO_PADRAO_COMPRA,VL_PRECO_COMPRA,');
     Add(' Sum(QT_MERCADORIA*VL_PRECO_COMPRA) as vt_compra');

     Add('   from');
     Add('   (SELECT DISTINCT (SELECT NM_EMPRESA     FROM     ACESSO.DC_EMPRESA');
     Add('           WHERE     ID_EMPRESA_FISICA=''S'' and ID_SITUACAO_EMPRESA=''A''');
     Add('           AND ID_OPERACAO_REDE=''N'' AND cd_empresa_fisica=wms.cd_empresa) CD,');
     Add('           WMS.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_PRODUTO,NM_MERCADORIA,');
     Add('           DS_APRESENTACAO_MERCADORIA,WMS.DS_LOTE,DT_VALIDADE , QT_MERCADORIA ,WMS.CD_EMPRESA,');
     Add('           CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,GF.CD_GRUPO_FORNECEDOR ,  DS_GRUPO_FORNECEDOR,CD_EAN_COMPRA,PC_DESCONTO_PADRAO_COMPRA,VL_PRECO_COMPRA');




     Add('');
     Add('    FROM PRDDM.DC_WMS_LOCALIZACAO WMS');
     Add('');
     Add('   LEFT OUTER JOIN (SELECT CD_MERCADORIA,R.CD_MOTIVO,DS_LOTE,SUM(QT_RESERVA),CD_EMPRESA,');
     Add('                     CASE');
     Add('                     WHEN LENGTH(TRIM(DS_MOTIVO))>0 THEN DS_MOTIVO');
     Add('                         ELSE NM_MOTIVO');
     Add('                     END  DS_MOTIVO');
     Add('           FROM PRDDM.DC_WMS_RESERVA R,');
     Add('               PRDDM.DC_WMS_RESERVA_MOTIVO RM');
     Add('           WHERE R.CD_MOTIVO IN (5,57,61)');
     Add('                 AND R.CD_MOTIVO=RM.CD_MOTIVO');
     Add('                AND QT_RESERVA - QT_FATURAMENTO- QT_FATURADO - QT_LIBERACAO - QT_LIBERADO > 0');
     Add('           GROUP BY  CD_MERCADORIA,R.CD_MOTIVO,DS_LOTE,CD_EMPRESA,DS_MOTIVO,NM_MOTIVO) R ON R.CD_MERCADORIA=WMS.CD_MERCADORIA');
     Add('                                                                                         AND R.CD_EMPRESA=WMS.CD_EMPRESA');
     Add('                                                                                         AND TRIM(R.DS_LOTE)=TRIM(WMS.DS_LOTE)');
     Add('    JOIN PRDDM.DC_MERCADORIA M ON M.CD_MERCADORIA=WMS.CD_MERCADORIA');
     Add('    JOIN prddm.dc_compra_mercadoria CM ON CM.CD_MERCADORIA=WMS.CD_MERCADORIA AND CM.CD_EMPRESA=WMS.CD_EMPRESA');
     Add('    JOIN prddm.dc_financeiro_mercadoria fM ON fM.CD_MERCADORIA=WMS.CD_MERCADORIA AND fM.CD_EMPRESA=WMS.CD_EMPRESA');
     Add('    JOIN PRDDM.DC_COMPRADOR_GAM CPRA ON CPRA.NR_COMPRADOR=CD_COMPRADOR');
     Add('    JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON  GF.CD_GRUPO_FORNECEDOR=CM.CD_GRUPO_FORNECEDOR');
     Add('   WHERE');



     Add('     WMS.ID_SITUACAO=''B''');
     if PnrFornecedor>0 then
         add('     AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
     if PnrComprador>0 then
         add('    AND  CD_COMPRADOR=:PnrComprador');
     if PnrCD>0 then
          add('    AND  cm.CD_EMPRESA=:PnrCD');

     add('  AND DT_VALIDADE<= TRUNC(SYSDATE+60)  AND QT_MERCADORIA>0 AND cd_andar=6  )');
     Add('     GROUP BY CD_PRODUTO,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,DS_LOTE,DT_VALIDADE , CD_EMPRESA,CD,');
     Add('              CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,CD_GRUPO_FORNECEDOR ,  DS_GRUPO_FORNECEDOR,CD_EAN_COMPRA,PC_DESCONTO_PADRAO_COMPRA,vl_preco_compra');
     Add('     ORDER BY  cd_comprador,cd_grupo_fornecedor,nm_mercadoria,ds_apresentacao_mercadoria');





   end;

   stQuery.SaveToFile('C:\temp\sqlRelatorioProdutosVencidos.sql');
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     if PnrFornecedor>0 then
        Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
     if PnrComprador>0 then
        Params.ParamByName('PnrComprador').AsBCD:=PnrComprador;
     if PnrCD>0 then
        Params.ParamByName('PnrCD').AsBCD:=PnrCD;

     open;

    end;
    Result:=_cdsTemp;
//    if not _cdsTemp.IsEmpty then
  //     Result:=_cdsTemp;
 finally
   FreeAndNil(stQuery);
 end;
end;


Function GeraTabelaProdutoPossibilidadedeVencimemto(PnrFornecedor,PnrComprador,PnrCd:Integer):TClientDataSet;
var
 stQuery :TStringList;
 _cdsTemp:TClientDataSet;
begin
 try
   stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';
   with stQuery do
   begin
    add('SELECT * ');
    add('     FROM');
    add('     (   ');
    add('     SELECT NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,  (SELECT NM_EMPRESA     FROM     ACESSO.DC_EMPRESA');
    Add('        WHERE     ID_EMPRESA_FISICA=''S'' and ID_SITUACAO_EMPRESA=''A''');
    Add('        AND ID_OPERACAO_REDE=''N'' AND cd_empresa_fisica=wms.cd_empresa) CD,');
    add('             GF.CD_GRUPO_FORNECEDOR  , DS_GRUPO_FORNECEDOR ,');
    add('              M.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_PRODUTO,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('             DS_LOTE ,SUM(QT_MERCADORIA) AS QT_MERCADORIA , DT_VALIDADE, WMS.CD_EMPRESA ,');
    add(' DT_VALIDADE-TRUNC(SYSDATE) DIAS_A_VENCER ,  QT_MEDIA_VENDA_DIARIA,');
    add('');
    add('    ROUND((DT_VALIDADE-TRUNC(SYSDATE)) * QT_MEDIA_VENDA_DIARIA,0) VENDA_ESTIMADA  , QT_CROSSDOCKING');
    add('       FROM');
    add('        PRDDM.DC_MERCADORIA M');
    add('                             ');
    add('                             ');
    add('        JOIN PRDDM.DC_WMS_LOCALIZACAO WMS ON M.CD_MERCADORIA=WMS.CD_MERCADORIA AND QT_MERCADORIA>0 AND  WMS.ID_SITUACAO=''A''');
    add('                                            --AND  EM.CD_MERCADORIA=WMS.CD_MERCADORIA AND EM.CD_EMPRESA=WMS.CD_EMPRESA');
    add('                                             --AND CM.CD_MERCADORIA=WMS.CD_MERCADORIA AND CM.CD_EMPRESA=WMS.CD_EMPRESA');
    add('        LEFT OUTER JOIN  PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA ON VENDA.CD_MERCADORIA=WMS.CD_MERCADORIA AND VENDA.CD_EMPRESA=WMS.CD_EMPRESA AND');
    add('                                                                      VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0) AND');
    add('                                                                      M.CD_MERCADORIA=VENDA.CD_MERCADORIA AND');
    add('                                                                       CD_CANAL=0');
    add('        LEFT JOIN PRDDM.DC_COMPRA_MERCADORIA CM  ON  CM.CD_MERCADORIA=M.CD_MERCADORIA AND  CM.CD_MERCADORIA=WMS.CD_MERCADORIA AND CM.CD_MERCADORIA=VENDA.CD_MERCADORIA');
    add('                                                 AND CM.CD_EMPRESA=WMS.CD_EMPRESA AND CM.CD_EMPRESA=VENDA.CD_EMPRESA  AND  CM.CD_EMPRESA=WMS.CD_EMPRESA');
    add('');
    add('        LEFT JOIN PRDDM.DC_ESTOQUE_MERCADORIA EM ON  EM.CD_MERCADORIA=CM.CD_MERCADORIA AND CM.CD_EMPRESA=EM.CD_EMPRESA  AND  EM.CD_MERCADORIA=M.CD_MERCADORIA');
    add('        LEFT JOIN PRDDM.DC_GRUPO_FORNECEDOR GF   ON  GF.CD_GRUPO_FORNECEDOR=CM.CD_GRUPO_FORNECEDOR');
    add('        LEFT JOIN PRDDM.DC_COMPRADOR_GAM    GAM   ON  GAM.NR_COMPRADOR=CM.CD_COMPRADOR');
    add('');
    add('');
    add('        WHERE');
    add('');
    add('           QT_MERCADORIA>0');
    if PnrCd>0 then
       add('           AND wms.CD_EMPRESA=:PnrCd');
    if PnrFornecedor>0 then
       add('           AND GF.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    if PnrComprador>0 then
       add('           AND CM.CD_COMPRADOR=:PnrComprador');

    add('                                 ');
    add('          GROUP BY WMS.CD_MERCADORIA,DS_LOTE,DT_VALIDADE, WMS.CD_EMPRESA,');
    add('                   QT_MEDIA_VENDA_DIARIA,M.CD_MERCADORIA*10+NR_DV_MERCADORIA,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,QT_CROSSDOCKING,');
    add('                   GF.CD_GRUPO_FORNECEDOR  , DS_GRUPO_FORNECEDOR,NR_COMPRADOR,NM_COMPRADOR_REDUZIDO)');
    add('       WHERE');
    add('');
    add('          VENDA_ESTIMADA <  (QT_MERCADORIA-QT_CROSSDOCKING)');
    add('');
    add('          ORDER BY CD_GRUPO_FORNECEDOR,CD_PRODUTO');

   end;

   stQuery.SaveToFile('C:\temp\sqlProdutosPossibilidadeVencimento.sql');
   with _cdsTemp do
   begin
     close;
     CommandText:=stQuery.Text;
     if PnrFornecedor>0 then
        Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
     if PnrComprador>0 then
        Params.ParamByName('PnrComprador').AsBCD:=PnrComprador;
     if PnrCD>0 then
        Params.ParamByName('PnrCD').AsBCD:=PnrCD;

     open;

    end;
    Result:=_cdsTemp;
//    if not _cdsTemp.IsEmpty then
  //     Result:=_cdsTemp;
 finally
   FreeAndNil(stQuery);
 end;
end;


(*******)
Function AlteraStatusItemPedido(PnrPedido,PnrProduto,PnrEmpresa:Integer;PnnLogin:String):boolean;
var
  tempQuery : TSQLQuery;
  DaDosPedido:TDadosValoresPedido;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      close;
      SQL.Add('UPDATE prddm.dcpci SET sity_y=');
      SQL.Add('CASE');
      SQL.Add('WHEN ((sity_y=''N'') or (sity_y=''P'')) and  (chey_y>0) THEN ''F''');
      SQL.Add('WHEN ((sity_y=''S'')  or (sity_y=''I'')) THEN ''I''');
      SQL.Add('WHEN ((sity_y=''F'')) THEN ''F''');
      SQL.Add('else ''C''');
      SQL.Add('END');
      SQL.Add('WHERE NROP_Y=:PnrPedido');
     if PnrEmpresa>0 then
        SQL.Add('AND CD_EMPRESA=:PcdEmpresa');
//      SQL.Add('AND ID_NFE_TRANSITO=''N''');
      if PnrProduto>0 then
         SQL.Add('and nrom_y=:PnrProduto');
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      if PnrEmpresa>0 then
          ParamByName('PcdEmpresa').AsInteger:=PnrEmpresa;
      if PnrProduto>0 then
         ParamByName('PnrProduto').AsInteger:=PnrProduto;

      tempQuery.SQL.SaveToFile('C:\temp\qryEliminaItemPendencia.sql');
      result:=true;
      if ExecSQL(false)<=0 then
      begin
        Mensagem('Pendencia N?o Eliminada do Sistema',48);
        result:=false;
      end;
      GravaEventoLogPedidoCompra(0,
                                 PnrPedido,
                                 dtSistema,
                                 0,
                                 0,
                                 20,
                                 'Pendencia Cancelada... usuario - '+PnnLogin+' Produto = '+IntToStr(PnrProduto),
                                 dtSistema,
                                 PnnLogin,
                                 PnrEmpresa);


           if  GetNrItenValidoPedido(PnrPedido)=0 then
                AlteraStatusPedido(PnrPedido,0,false);


    end;
  finally
    FreeAndNil(tempQuery);
  end;
end;


Function GetNrItenValidoPedido(PnrPedido:Integer):Integer;
var
  tempQuery : TSQLQuery;
  DaDosPedido:TDadosValoresPedido;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      close;
      SQL.Add('SELECT count(*) nr_ITENS');
      SQL.Add('FROM PRDDM.DCPCC ,PRDDM.DCPCI');
      SQL.Add('WHERE  NROP_P=NROP_Y');
//      SQL.Add('AND sity_y IN(''P'',''N'',''F'') AND nrop_p=:PnrPedido');
      SQL.Add('AND sity_y IN(''P'',''N'') AND nrop_p=:PnrPedido');
      ParamByName('PnrPedido').Asbcd:=PnrPedido;
      open;
    end;
    result:=0;
    if not tempQuery.IsEmpty then
       result:=tempQuery.FieldByName('nr_ITENS').AsInteger;

  finally
    FreeAndNil(tempQuery);
  end;
end;


Function GetsituacaoNfe(PnrPedido,PnrProduto,PnrCd:Integer):boolean;
var
  tempQuery : TSQLQuery;
  DaDosPedido:TDadosValoresPedido;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      close;
      SQL.Add('SELECT ID_SITUACAO');
      SQL.Add('FROM PRDDM.DC_NFE_COMPRA_GED');
      SQL.Add('WHERE');
      SQL.Add('ID_SITUACAO=''C''');
      SQL.Add('AND (id_empresa,NR_NFE) IN(SELECT cd_empresa,NR_NFE FROM PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO');
      SQL.Add('              WHERE CD_PEDIDO=:PnrPedido AND CD_MERCADORIA=:PnrProduto AND cd_empresa=:Pnrcd)');
      ParamByName('PnrPedido').AsBCD:=PnrPedido;
      ParamByName('PnrProduto').AsBCD:=PnrProduto;
      ParamByName('Pnrcd').AsBCD:=Pnrcd;
      open;
    end;
    result:=false;
    if not tempQuery.IsEmpty then
       result:=true;

  finally
    FreeAndNil(tempQuery);
  end;
end;



FUNCTION ZeraItemPedido(PnrPedido,
                        PnrProduto,
                        PnrEmpresa,
                        Pquantidade:Integer):Boolean ;
 var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      SQL.Add('UPDATE prddm.dcpci SET ');
      SQL.Add('QUAY_Y=:Pquantidade WHERE nrop_y=:PnrPedido AND nrom_y=:PnrProduto');
      SQL.Add('and cd_empresa=:PnrEmpresa');

      ParamByName('Pquantidade').AsBCD := Pquantidade;
      ParamByName('PnrPedido').AsBCD := PnrPedido;
      ParamByName('PnrProduto').AsBCD := PnrProduto;
      ParamByName('PnrEmpresa').AsBCD := PnrEmpresa;

       Result:=true;
      if ExecSQL(false)<=0 then
         Result:=false;

    end;
  except


  end;
 end;




{$REGION 'Altera prazo Item do Pedido '}

function AlteraNumeroPedido(PnrPedido,PnrPedidoOld: INTEGER): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
begin
  try
    try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('UPDATE prddm.dcpci SET nrop_y=:PnrPedidoNovo WHERE nrop_y=:PnrPedido');
    QryTemp.ParamByName('PnrPedidoNovo').AsBCD   := PnrPedido;
    QryTemp.ParamByName('PnrPedido').AsBCD := PnrPedidoOld;

    QryTemp.ExecSQL(False);
    RESULT := True;

    except

    RESULT := False

    end;

  finally
    QryTemp.Close;
    QryTemp.Free;
  end;
end;
{$ENDREGION 'Ativa Capa Pedido'}




function EliminaItemPedidoZerado(nrPedido:Integer): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('DELETE PRDDM.DCPCI WHERE NROP_Y=:PnrPedido AND QUAY_Y=0 AND QT_SUGERIDA=0');
    QryTemp.ParamByName('PnrPedido').AsInteger := nrPedido;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False
    else
      RESULT := True;
  finally
    FreeAndNil(QryTemp);
  end;
end;




function AtualizaItemPedidoInicio(PnrPedido,
                                  PnrProduto,
                                  PnrQuantidadePedido,
                                  PnrQuantidadeChegou,
                                  PnrPrazoItem,
                                  PnrVerba,
                                  PnrQuantidadeBonificada,
                                  PnrCodigoOperadorLogistico,
                                  PnrDiasEstoque,
                                  PnrQuantidadeSugerida: INTEGER;
                                  PIdStatusItem,
                                  PidMargem,
                                  PidDescontoAcumulativo: String;
                                  PpcDescontoPadrao,
                                  PpcDescontoAdicional,
                                  PpcDescontoFinanceiro,
                                  PpcVerba,
                                  PpcBonificacao,
                                  PpcDescontoOL,
                                  PvlPrecoUnitario,
                                  PvlPrecoFabrica,
                                  PvlPrecoCusto,
                                  PvlMargemPadrao,
                                  PvlMargemNegociada,
                                  PvlVerba,
                                  PvlMediaVenda: Double;
                                  PnmTelaAlteracao:String;
                                  PcdEmpresa:Integer;
                                  PpcICMSCOMPRA:Double;
                                  PcdListaCOMPRA:Integer;
                                  PidAtualizaDesconto:Boolean;
                                  PnrComprador:integer;
                                  PpcICMSVENDA:Double): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
  DaDosPedido:TDadosValoresPedido;
  DadosItemPedidoLog :TDadosItemPedido;

begin
 try
  try

   QryTemp := TSQLQuery.Create(NIL);
   QryTemp := _dm.criaQueryGenerica;
   QryTemp.Close;
   QryTemp.SQL.Clear;
   QryTemp.SQL.Add('Update PRDDM.DCPCI set');
   QryTemp.SQL.Add('QUAY_Y=:PnrQuantidadePedido');
   QryTemp.SQL.Add(',PRZY_Y=:PnrPrazoItem');
   QryTemp.SQL.Add(',NRVV_Y=:PnrVerba');
   QryTemp.SQL.Add(',QT_BONIFICADA=:PnrQuantidadeBonificada');
    QryTemp.SQL.Add(',NR_DIAS_ESTOQUE=:PnrDiasEstoque');
   QryTemp.SQL.Add(',SITY_Y=:PidStatusItem');
   QryTemp.SQL.Add(',ID_MARGEM=:PidMargem');
   QryTemp.SQL.Add(',ID_DESCONTO_ACUMULATIVO=:PidDescontoAcumulativo');
   QryTemp.SQL.Add(',ABTY_Y=:PpcDescontoPadrao');
   QryTemp.SQL.Add(',DADY_Y=:PpcDescontoAdicional');
   //QryTemp.SQL.Add(',DFIY_Y=:PpcDescontoFinanceiro');
   QryTemp.SQL.Add(',PC_VERBA=:PpcVerba');
   QryTemp.SQL.Add(',PC_BONIFICACAO=:PpcBonificacao');
   QryTemp.SQL.Add(',PC_DESCONTO_OL=:PpcDescontoOL');
   QryTemp.SQL.Add(',PUNY_Y=:PvlPrecoUnitario');
   QryTemp.SQL.Add(',PFBY_Y=:PvlPrecoFabrica');
   QryTemp.SQL.Add(',VCCI_Y=:PvlPrecoCusto');
   QryTemp.SQL.Add(',VL_MARGEM_PADRAO=:PvlMargemPadrao');
   QryTemp.SQL.Add(',VL_MARGEM_NEGOCIADA=:PvlMargemNegociada');
   QryTemp.SQL.Add(',VL_VERBA=:PvlVerba');
   QryTemp.SQL.Add(',PC_ICMS_COMPRA=:PpcICMSCOMPRA');
   QryTemp.SQL.Add(',CD_LISTA_COMPRA=:PcdLISTACOMPRA');
   QryTemp.SQL.Add(',PC_ICMS_VENDA=:PpcIcmsVenda');

   if PidAtualizaDesconto then
      QryTemp.SQL.Add(',PC_DESCONTO_NEGOCIADO=:PPC_DESCONTO_NEGOCIADO');

   QryTemp.SQL.Add('Where');
   QryTemp.SQL.Add(' NROP_Y=:PnrPedido');
   QryTemp.SQL.Add(' AND NROM_Y=:PnrProduto');
   QryTemp.SQL.Add(' AND SITY_Y in(''N'',''S'',''C'',''I'')');
   stTemp := QryTemp.Text;

     if (PnrCodigoOperadorLogistico>1) or (PpcDescontoAdicional=0) then
      begin
      //  PnrVerba:=0;
      //  PpcVerba:=0;
        PvlVerba:=0;
      end;

   with QryTemp do
   begin
     ParamByName('PnrQuantidadePedido').AsInteger := PnrQuantidadePedido;
     ParamByName('PnrPrazoItem').AsInteger := pnrPrazoItem;
     ParamByName('PnrVerba').AsInteger := PnrVerba;
     ParamByName('PnrQuantidadeBonificada').AsInteger :=PnrQuantidadeBonificada;
     ParamByName('PnrDiasEstoque').AsInteger := PnrDiasEstoque;
     ParamByName('PidStatusItem').AsString := PidStatusItem;
     ParamByName('PidMargem').AsString := PidMargem;
     ParamByName('PidDescontoAcumulativo').AsString := PidDescontoAcumulativo;
     ParamByName('PpcDescontoPadrao').AsBCD := PpcDescontoPadrao;
     ParamByName('PpcDescontoAdicional').AsBCD := PpcDescontoAdicional;
     if PidAtualizaDesconto then
        ParamByName('PPC_DESCONTO_NEGOCIADO').AsBCD:=PpcDescontoPadrao+PpcDescontoAdicional;
   //  ParamByName('PpcDescontoFinanceiro').AsBCD := PpcDescontoFinanceiro;
     ParamByName('PpcVerba').AsBCD := PpcVerba;
     ParamByName('PpcBonificacao').AsBCD := PpcBonificacao;
     ParamByName('PpcDescontoOL').AsBCD :=PpcDescontoOL;
     ParamByName('PvlPrecoUnitario').AsBCD := PvlPrecoUnitario;
     ParamByName('PvlPrecoFabrica').AsBCD := PvlPrecoFabrica;
     ParamByName('PvlPrecoCusto').AsBCD := PvlPrecoCusto;
     ParamByName('PvlMargemPadrao').AsBCD := PvlMargemPadrao;
     ParamByName('PvlMargemNegociada').AsBCD := PvlMargemNegociada;
     ParamByName('PvlVerba').AsBCD := PnrQuantidadePedido * PvlVerba;
     ParamByName('PnrPedido').AsInteger := PnrPedido;
     ParamByName('PnrProduto').AsInteger := PnrProduto;



    ParamByName('PpcICMSCOMPRA').AsBCD:=PpcICMSCOMPRA;
    ParamByName('PcdLISTACOMPRA').AsBCD:=PcdListaCOMPRA;

    ParamByName('PpcIcmsVenda').AsBCD:=PpcICMSVENDA;



   end;



   if QryTemp.ExecSQL(False) <= 0 then
   begin
     RESULT := False;
     mensagem('N?o Atualizou Item Pedido!!!',16);
     exit;
   end
   else
     RESULT := True;
      //DaDosPedido:=GetValoresPedido(PnrPedido,false);

         { GravaLogPedidoCompra(PnrPedido,//PnrPedido,
                                    PnrProduto,//PnrMercadoria,
                                    0,//PqtAnterior,
                                    PnrQuantidadePedido,//PqtAtual:Integer;
                                    PpcDescontoAdicional,//PpcDescontoAnterior,
                                    PpcDescontoAdicional,// PpcDescontoAtual:Double;
                                    PnrVerba,// PnrVerbaAnterior,
                                    0,//:Integer;
                                    PpcVerba, // PpcVerbaAnterior,
                                    0,// PpcVerbaAtual:Double;
                                    nmLogin,//  PnmUsuario:String;
                                    'S',// PidStatusAnterior,
                                    'N',// PidStatusAtual:String;
                                    PnrQuantidadeSugerida,// PqtSugeridaAnterior,
                                    0);//PqtSugeridaAtual:Integer):Boolean;}


        GravaEventoLogPedidoCompra(0,
                                   PnrPedido,
                                   dtPedido,
                                   0,
                                   0,
                                   23,
                                   'Item Atualizado -->  Produto '+IntToStr(PnrProduto)+' Quantidade '+inttostr(PnrQuantidadePedido)+' Tela -->'+PnmTelaAlteracao ,
                                   dtSistema,
                                   nmLogin,
                                   PcdEmpresa);

  except
     on E: Exception do
     begin
       trataerro(E.Message, 'Erro ao Gravar Parcelamento');
     end;
  end;

 finally
   FreeAndNil(QryTemp);

 end;
end;
{$ENDREGION 'Atualiza Item Pedido'}


function ProximoItemPedido(PnrPedido:Integer):Integer;
VAR
  qryTemp :TSQLQuery;
  stQry: TStringList;
  STRQRY,filtroQuantidade  :STRING;
begin
try
 try
     stQry:= TStringList.Create;
     qryTemp:= TSQLQuery.Create(NIL);
     qryTemp.SQLConnection:=_dm._conexao;
     stQry.Add('SELECT max(DFIY_Y+1) nr_item FROM prddm.dcpci');
     stQry.Add('WHERE');
     stQry.Add('NROP_Y=:PnrPedido');

     with qryTemp do
     begin
      close;
      sql.Add(stQry.Text);
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      open;
     end;
     Result:=1;
     if not qryTemp.isempty then
      Result:=qryTemp.FieldByName('nr_item').AsInteger
  except
   Mensagem('Erro na pesquisa de itens J? Faturado no pedido!!!',MB_ICONERROR);
  end;
finally
  FreeAndNil(qryTemp);
  FreeAndNil(stQry);
end;
end;


function VeirificaItemPedido(PnrPedido,PnrEmpresa,PnrProduto:Integer):TDadosItemPedido;
VAR
  qryTemp :TSQLQuery;
   stQry: TStringList;
  STRQRY,filtroQuantidade  :STRING;
begin
try
 try
     stQry:= TStringList.Create;
     qryTemp:= TSQLQuery.Create(NIL);
     qryTemp.SQLConnection:=_dm._conexao;
     stQry.Add('SELECT * FROM prddm.dcpci');
     stQry.Add('WHERE');
     stQry.Add('NROP_Y=:PnrPedido');
     stQry.Add('and NROM_Y=:PnrProduto');

     with qryTemp do
     begin
      close;
      sql.Add(stQry.Text);
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      ParamByName('PnrProduto').AsInteger:=PnrProduto;
      open;
     end;

        Result.pcVerba := 0;
        Result.pcDescontoPadrao := 0;
        Result.pcDescontoAdicional := 0;
        Result.nrMercadoria := PnrProduto;
        Result.nrQuantidadePedido := 0;
        Result.nrVerba := 0;
        Result.nr_pedido := 0;
        Result.idStatusItem := '';
        Result.qtSugerida := 0;
        Result.nrEmpresa := PnrEmpresa;
        Result.idItemGravado := false;



     if not qryTemp.isempty then
     begin

        Result.pcVerba             := qryTemp.FieldByName('PC_VERBA').AsFloat;
        Result.pcDescontoPadrao    := qryTemp.FieldByName('ABTY_Y').AsFloat;
        Result.pcDescontoAdicional := qryTemp.FieldByName ('DADY_Y').AsFloat;
        Result.nrMercadoria        := qryTemp.FieldByName('NROM_Y').AsInteger;
        Result.nrQuantidadePedido  := qryTemp.FieldByName('QUAY_Y').AsInteger;
        Result.nrVerba             := qryTemp.FieldByName('NRVV_Y').AsInteger;
        Result.nr_pedido           := PnrPedido;
        Result.idStatusItem        := qryTemp.FieldByName('SITY_Y').AsString;
        Result.qtSugerida          := qryTemp.FieldByName('QT_SUGERIDA').AsInteger;
        Result.nrEmpresa           := qryTemp.FieldByName('CD_EMPRESA').AsInteger;

        Result.idItemGravado := true;



     end;
  except
   Mensagem('Erro na pesquisa de itens J? Faturado no pedido!!!',MB_ICONERROR);
  end;
finally
  FreeAndNil(qryTemp);
  FreeAndNil(stQry);
end;
end;


function DadosItemPedidoAtual(PnrPedido, PnrMercadoria,PnrEmpresa,PcdEmpresaCross: Integer): TDadosItemPedido;
VAR
  qryTemp :TSQLQuery;
  stQry: TStringList;
  STRQRY,filtroQuantidade  :STRING;
begin
try
 try
     stQry:= TStringList.Create;
     qryTemp:= TSQLQuery.Create(NIL);
     qryTemp.SQLConnection:=_dm._conexao;
     stQry.Add('SELECT NROM_Y,QUAY_Y,ABTY_Y,DADY_Y,NRVV_Y');
     stQry.Add(',PC_VERBA,SITY_Y,QT_SUGERIDA,QT_BONIFICADA,');
     stQry.Add('CASE');
     stQry.Add(' WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA = CD_EMPRESA_CROSSDOCKING)');
     stQry.Add('ELSE I.CD_EMPRESA');
     stQry.Add('END CD_EMPRESA_CROSSDOCKING');
     stQry.Add('FROM');
     stQry.Add('PRDDM.DCPCC C,');
     stQry.Add('PRDDM.DCPCI I,');
     stQry.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
     stQry.Add('WHERE');
     stQry.Add(' NROP_P=NROP_Y');
     stQry.Add('and CM.CD_MERCADORIA=NROM_Y');
     stQry.Add('AND CM.CD_EMPRESA=C.CD_EMPRESA_destino');
     stQry.Add('AND NROP_Y=:PnrPedido');
     stQry.Add('AND NROM_Y=:PnrProduto');
//     stQry.Add('AND I.CD_EMPRESA=:PnrEmpresa');
     with qryTemp do
     begin
      close;
      sql.Add(stQry.Text);
      ParamByName('PnrPedido').Asbcd:=PnrPedido;
      ParamByName('PnrProduto').Asbcd:=PnrMercadoria;
     // ParamByName('PnrEmpresa').AsInteger:=PcdEmpresaCross;
      open;
    end;
     Result.pcVerba := 0;
    Result.pcDescontoPadrao := 0;
    Result.pcDescontoAdicional := 0;
    Result.nrMercadoria := PnrMercadoria;
    Result.nrQuantidadePedido := 0;
    Result.nrVerba := 0;
    Result.nr_pedido := 0;
      Result.idStatusItem := '';
    Result.qtSugerida := 0;
    Result.nrEmpresa := PnrEmpresa;
    Result.idItemGravado := false;

     if not qryTemp.isempty then
     begin
        Result.pcVerba             := qryTemp.FieldByName('PC_VERBA').AsFloat;
        Result.pcDescontoPadrao    := qryTemp.FieldByName('ABTY_Y').AsFloat;
        Result.pcDescontoAdicional := qryTemp.FieldByName ('DADY_Y').AsFloat;
        Result.nrMercadoria        := qryTemp.FieldByName('NROM_Y').AsInteger;
        Result.nrQuantidadePedido  := qryTemp.FieldByName('QUAY_Y').AsInteger;
        Result.nrVerba             := qryTemp.FieldByName('NRVV_Y').AsInteger;
        Result.nr_pedido           := PnrPedido;
        Result.idStatusItem        := qryTemp.FieldByName('SITY_Y').AsString;
        Result.qtSugerida          := qryTemp.FieldByName('QT_SUGERIDA').AsInteger;
        Result.nrEmpresa           := qryTemp.FieldByName('CD_EMPRESA_CROSSDOCKING').AsInteger;

        Result.idItemGravado := true;
    end
    else
    begin
       Result.nrEmpresa           := PcdEmpresaCross;

    end;



  except
   Mensagem('Erro na pesquisa de itens no pedido!!!',MB_ICONERROR);
  end;
finally
  FreeAndNil(qryTemp);
  FreeAndNil(stQry);
end;


End;





function TestaItemInativo(PnrPedido,PnrMercadoria,PnrEmpresa: Integer):Boolean;
VAR
  qryTemp :TSQLQuery;
  stQry: TStringList;
  STRQRY,filtroQuantidade  :STRING;
begin
try
 try
     stQry:= TStringList.Create;
     qryTemp:= TSQLQuery.Create(NIL);
     qryTemp.SQLConnection:=_dm._conexao;
     stQry.Add('SELECT NROP_Y,M.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_MERCADORIA , NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
     stQry.Add('FROM');
     stQry.Add('   PRDDM.DCPCC C,');
     stQry.Add('   PRDDM.DCPCI I,');
     stQry.Add('   prddm.dc_compra_mercadoria CM,');
     stQry.Add('   prddm.dc_mercadoria M');
     stQry.Add('WHERE');
     stQry.Add(' nrop_p=nrop_y');
     stQry.Add('AND nrom_y=cm.cd_mercadoria');
     stQry.Add('AND C.CD_EMPRESA_DESTINO=cm.cd_EMPRESA');
     stQry.Add('AND m.cd_mercadoria=cm.cd_mercadoria');
     stQry.Add('AND cm.id_situacao_mercadoria=''I''');
     stQry.Add('AND quay_y>0');
     stQry.Add('AND nrop_y=:PnrPedido');

     with qryTemp do
     begin
      close;
      sql.Add(stQry.Text);
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      open;
    end;
    Result:= false;

     if not qryTemp.isempty then
     begin
       Mensagem('Este Pedido tem item que foi Inativado... '+#13+
                'Pedido = '+inttostr(PnrPedido)+ '  Cod. do Item ' + qryTemp.FieldByName('CD_MERCADORIA').AsString+
                                                 ' -  ' +qryTemp.FieldByName('NM_MERCADORIA').AsString+' - ' +
                                                         qryTemp.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString
                                                   ,MB_ICONERROR);

        Result:= true;
    end;



  except
   Mensagem('Erro na pesquisa de itens no pedido!!!',MB_ICONERROR);
  end;
finally
  FreeAndNil(qryTemp);
  FreeAndNil(stQry);
end;


End;


Function CarregaEmpresaLogica(PcdEmpresaFisica:Integer):Integer;
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
        Add('SELECT distinct emp.CD_EMPRESA');
        Add('FROM ACESSO.DC_EMPRESA EMP,');
        Add('     PRDDM.DC_COMPRA_MERCADORIA CM');
        Add('WHERE id_situacao_mercadoria=''A'' AND CD_EMPRESA_CROSSDOCKING=emp.cd_empresa AND cd_operacao_empresa = 3 AND cd_empresa_fisica =:PcdEmpresaFisica');
      end;
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PcdEmpresaFisica').asBcd:=PcdEmpresaFisica;
        open;
      end;
      result:=PcdEmpresaFisica;
      if not _cdsTemp.isempty then
         result:=_cdsTemp.fieldByName('CD_EMPRESA').asinteger;

    except
       mensagem('Erro ao pesquisa Empresa Logica',MB_ICONERROR);
    end;

  finally
        FreeAndNil(stQry);
        FreeAndNil(_cdsTemp);
  end;
end;


Function CarregaEmpresaFisica(PcdEmpresaLogica:Integer):Integer;
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
       Add('SELECT CD_EMPRESA_FISICA');
       Add('FROM ACESSO.DC_EMPRESA WHERE  CD_EMPRESA =:PcdEmpresaLogica');
      end;
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PcdEmpresaLogica').asBcd:=PcdEmpresaLogica;
        open;
      end;
      result:=PcdEmpresaLogica;
      if not _cdsTemp.isempty then
         result:=_cdsTemp.fieldByName('CD_EMPRESA_FISICA').asinteger;

    except
       mensagem('Erro ao pesquisa Empresa Fisica',MB_ICONERROR);
    end;

  finally
        FreeAndNil(stQry);
        FreeAndNil(_cdsTemp);
  end;
end;



function AtualizaEmpresaLogicaPedido(PnrPedido,PcdEmpresaLogica,PcdOperacaoRede: INTEGER;PidCrossDocking:String): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
  pcverbaGeracao :Double;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('Update PRDDM.DCPCC set CD_EMPRESA=:PcdEmpresaLogica,ID_CROSSDOCKING=:PidCrossDocking,cd_operacao_rede=:PcdOperacaoRede');
    QryTemp.SQL.Add('where');
    QryTemp.SQL.Add('NROP_P=:PnrPedido');
    QryTemp.ParamByName('PcdEmpresaLogica').AsBCD  := PcdEmpresaLogica;
    QryTemp.ParamByName('PidCrossDocking').AsString:= PidCrossDocking;
    QryTemp.ParamByName('PcdOperacaoRede').AsBCD := PcdOperacaoRede;
    QryTemp.ParamByName('PnrPedido').AsBCD := PnrPedido;

      RESULT := True;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False;
  finally
    FreeAndNil(QryTemp);
  end;
end;


function CancelaListaPrecoExcecao(PcdLista: INTEGER): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
  pcverbaGeracao :Double;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('UPDATE PRDDM.DC_PRECO_FORNECEDOR_EXCECAO SET ID_SITUACAO=''I'' WHERE CD_PRECO_FORNECEDOR_EXCECAO=:PcdLista');
    QryTemp.ParamByName('PcdLista').AsBCD  := PcdLista;
      RESULT := True;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False;
  finally
    FreeAndNil(QryTemp);
  end;
end;




function CorrigeSituacaoCrossdocking: Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
  pcverbaGeracao :Double;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('UPDATE     prddm.dcpcc SET  CD_OPERACAO_REDE =0');
    QryTemp.SQL.Add('WHERE id_crossdocking = ''N''  AND sitp_p=''N''');
    QryTemp.SQL.Add('AND CD_EMPRESA=CD_EMPRESA_DESTINO');
    QryTemp.SQL.Add('AND CD_OPERACAO_REDE in(84,85,87,81)');
      RESULT := True;
    if QryTemp.ExecSQL(False) <= 0 then
      RESULT := False;
  finally
    FreeAndNil(QryTemp);
  end;
end;



function CorrigeoPERADORlOGISTICO: Boolean;
Var
  QryTemp,qryUpdate: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
  pcverbaGeracao :Double;
begin
  try
     qryUpdate:= TSQLQuery.Create(NIL);
     qryUpdate:= _dm.criaQueryGenerica;

    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('SELECT DISTINCT  datp_p, nrop_p, c.cd_operador_logistico, i.nr_operador_logistico');
    QryTemp.SQL.Add('                FROM prddm.dcpcc c, prddm.dcpci i');
    QryTemp.SQL.Add('                WHERE');
    QryTemp.SQL.Add('                    nrop_p=nrop_y');
    QryTemp.SQL.Add('                AND datp_p >=''23/03/2021''');
    QryTemp.SQL.Add('                AND sitp_p IN(''N'',''P'')');
    QryTemp.SQL.Add('                AND  CD_OPERADOR_LOGISTICO<> i.nr_operador_logistico  ORDER BY 1');
    QryTemp.OPEN;
    QryTemp.first;

    while not QryTemp.eof do
    begin

       qryUpdate.close;
       qryUpdate.SQL.Clear;
       qryUpdate.SQL.Add('UPDATE     prddm.dcpci SET NR_OPERADOR_LOGISTICO=:POl,vl_verba=0  WHERE nrop_y=:PnrPedido and NR_OPERADOR_LOGISTICO=1 ANd SITY_Y=''N''');
       qryUpdate.ParamByName('POl').AsBCD:=QryTemp.FieldByName('cd_operador_logistico').AsInteger;
       qryUpdate.ParamByName('PnrPedido').AsBCD:=QryTemp.FieldByName('nrop_p').AsInteger;

         RESULT := True;
        if qryUpdate.ExecSQL(False) <= 0 then
         RESULT := False;



      QryTemp.Next
    end;





  finally
    FreeAndNil(QryTemp);
    FreeAndNil(qryUpdate);
  end;
end;



function PedidoAlimentar(PnrFornecedor:Integer): Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  DaDosPedido :TDadosValoresPedido;
  cdEvento :Integer;
  pcverbaGeracao :Double;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    QryTemp.Close;
    QryTemp.SQL.Clear;
    QryTemp.SQL.Add('SELECT ID_VENDA_MERCADO, CD_GRUPO_FORNECEDOR FROM');
    QryTemp.SQL.Add('PRDDM.DC_MERCADORIA M,');
    QryTemp.SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
    QryTemp.SQL.Add('WHERE');
    QryTemp.SQL.Add('M.ID_SITUACAO_MERCADORIA=''A''');
    QryTemp.SQL.Add('AND CM.ID_SITUACAO_MERCADORIA=''A''');
    QryTemp.SQL.Add('AND CM.CD_MERCADORIA=M.CD_MERCADORIA');
    QryTemp.SQL.Add('AND ID_VENDA_MERCADO=''S''');
    QryTemp.SQL.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    QryTemp.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
    QryTemp.Open;
    QryTemp.first;
    RESULT := True;
    if QryTemp.Eof then
      RESULT := False;
  finally
    FreeAndNil(QryTemp);
  end;
end;

function IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;




function AbreAgendaLaboratorio(PnrComprador:Integer):TClientDataSet;
var
  stQry : TStringList;
 _cdsTemp:TClientDataSet;

begin
 try
   stQry := TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

   with stQry do
   begin
     add('SELECT NR_FORNECEDOR, NM_FORNECEDOR, DT_AGENDAMENTO,NR_ITENS,ID_SITUACAO_AGENDA');
     add('FROM');
     add('(SELECT');
     add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR AS NR_FORNECEDOR,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,');
     add('Count(*) NR_ITENS,');
     add('CD_FABRICANTE,');
     add('DT_AGENDAMENTO,');
     add('DT_PROXIMO_PEDIDO,');
     add('DS_NUMERO_DIA_SEMANA,');
     add('QT_DIAS_LEADTIME_TERMOLABIL,');
     add('QT_DIAS_LEADTIME_FABRICANTE,');
     add('DS_GRUPO_FORNECEDOR,');
     add('CD_GRUPO_CURVA_FABRICANTE,');
     add('case');
     add('when trunc(DT_AGENDAMENTO)<trunc(SYSDATE) then ''Atrasado''');
     add('when trunc(DT_AGENDAMENTO)=trunc(SYSDATE) then ''Agendado''');
     add('when trunc(DT_AGENDAMENTO)>trunc(SYSDATE) then ''Antecipado''');
     add('end ID_SITUACAO_AGENDA');
     add('FROM');
     ADD('PRDDM.DC_MERCADORIA MERCADORIA,');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DC_FISCAL_MERCADORIA FISCAL');
     add('WHERE');
     add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND MERCADORIA.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA ');
     add('AND COMPRA_MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA ');
     add('AND COMPRA_MERCADORIA.CD_EMPRESA=FISCAL.CD_EMPRESA');
     add('AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA ');
     add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     add('AND COMPRA_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     add('AND GRUPO_FORNECEDOR.ID_SITUACAO<>''I''');
     aDD('AND ID_VENDA_AUTORIZADA=''S''');
     if PnrComprador>0 then
        add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
//     add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrEmpresa');
     add('GROUP BY  GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
     add('CD_FABRICANTE,');
     add('DT_AGENDAMENTO,');
     add('DT_PROXIMO_PEDIDO,');
     add('DS_NUMERO_DIA_SEMANA,');
     add('QT_DIAS_LEADTIME_TERMOLABIL,');
     add('QT_DIAS_LEADTIME_FABRICANTE,');
     add('DS_GRUPO_FORNECEDOR,');
     add('CD_GRUPO_CURVA_FABRICANTE');
     add('ORDER BY DT_AGENDAMENTO ASC)');
   end;
   stQry.SaveToFile('C:\TEMP\qryAgendaComprador.sql');
   with _cdsTemp do
   begin
     close;
     CommandText:=stQry.Text;
     if PnrComprador>0 then
        Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;
    // Params.ParamByName('PnrEmpresa').AsInteger:=1;
     open;
   end;
   if not _cdsTemp.IsEmpty then
   begin
      //, , DT_AGENDAMENTO,NR_ITENS,
     TIntegerField(_cdsTemp.FieldByName('NR_FORNECEDOR')).DisplayFormat:='##,###,##0';
     TIntegerField(_cdsTemp.FieldByName('NR_FORNECEDOR')).DisplayLabel:='Nr. Lab.';
     TIntegerField(_cdsTemp.FieldByName('NR_FORNECEDOR')).DisplayWidth:=06;

     TStringField(_cdsTemp.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
     TStringField(_cdsTemp.FieldByName('NM_FORNECEDOR')).DisplayWidth:=30;

     TStringField(_cdsTemp.FieldByName('ID_SITUACAO_AGENDA')).DisplayLabel:='Situa??o';
     TStringField(_cdsTemp.FieldByName('ID_SITUACAO_AGENDA')).DisplayWidth:=12;

     TIntegerField(_cdsTemp.FieldByName('NR_ITENS')).DisplayFormat:='##,###,##0';
     TIntegerField(_cdsTemp.FieldByName('NR_ITENS')).DisplayLabel:='Nr. Prod.';
     TIntegerField(_cdsTemp.FieldByName('NR_ITENS')).DisplayWidth:=06;

     TDateField(_cdsTemp.FieldByName('DT_AGENDAMENTO')).DisplayFormat:='dd/mm/yyyy';
     TDateField(_cdsTemp.FieldByName('DT_AGENDAMENTO')).DisplayLabel:='Dt. Agenda';
     TDateField(_cdsTemp.FieldByName('DT_AGENDAMENTO')).DisplayWidth:=12;



   end;
   Result:=_cdsTemp;

 finally
  FreeAndNil(stQry);
 end;
end;



function DadosEmAnaliseApi(PnrComptrador,PnrEmpresa: INTEGER):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NROP_P, NM_COMPRADOR,');
      SQL.Add('ID_UNIDADE_FEDERACAO AS LOCAL_CD,');
      SQL.Add('CASE');
      SQL.Add('WHEN CD_EMPRESA_DESTINO<>CD_EMPRESA THEN ''O.C.D''');
      SQL.Add('ELSE ''Normal''');
      SQL.Add('END ID_OCD,');
      SQL.Add('LABP_P,NM_FORNECEDOR,DT_PEDIDO ,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,SITP_P,NM_USUARIO,OBSP_P,NR_CONDICAO_PAGTO_P,');
      SQL.Add('SUM(NR_ITENS) AS NR_ITENS,SUM(NR_UNIDADES) AS NR_UNIDADES,');
      SQL.Add('NVL(SUM(NR_CANCELADO),0) AS NR_CANCELADO,');
      SQL.Add('NVL(SUM(NR_NOVO),0) AS NR_NOVO,ROUND(SUM(VL_PEDIDO_CUSTO),2) AS VL_PEDIDO_CUSTO,');
      SQL.Add('SUM(VL_PED_LIQ) AS VL_PED_LIQ,');
      SQL.Add('ROUND(SUM(VL_PEDIDO_FABR),2) AS VL_PEDIDO_FABR,SUM(NVL(NR_FATURADO,0)) AS NR_FATURADO,');
      SQL.Add('SUM(NVL(QT_FATURADO,0)) AS QT_FATURADO,');
      SQL.Add('SUM(VL_PED_FAT_LIQ) AS VL_PED_FAT_LIQ,');
      SQL.Add('ROUND(SUM(VL_PED_FAT_CUSTO),2) AS VL_PEDIDO_FAT,');
      SQL.Add('ROUND(SUM(VL_PED_FAT_FABR),2) AS VL_PED_FAT_FABR,');
      SQL.Add('CD_EMPRESA,');
      SQL.Add('sum(Nvl(NR_ITENS_BONIFICADO,0)) AS NR_ITENS_BONIFICADO,');
      SQL.Add('CD_OPERADOR_LOGISTICO,FLAP_P,ID_CROSSDOCKING,CD_EMPRESA_DESTINO,CD_EMPRESA');
      SQL.Add('FROM');
      SQL.Add('(SELECT');
      SQL.Add('LABP_P,NROP_P,DATP_P AS DT_PEDIDO,PREP_P AS DT_PREVISTA,DT_PREVISTA_FATURAMENTO,');
      SQL.Add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,ID_UNIDADE_FEDERACAO,');
      SQL.Add('SITP_P,COUNT(*) NR_ITENS,SUM(QUAY_Y) as NR_UNIDADES,');
      SQL.Add('SUM(QUAY_Y *VCCI_Y) as VL_PEDIDO_CUSTO,SUM(QUAY_Y *PFBY_Y) AS VL_PEDIDO_FABR,');
      SQL.Add('SUM(CHEY_Y *VCCI_Y) as VL_PED_FAT_CUSTO,SUM(CHEY_Y * PFBY_Y) AS VL_PED_FAT_FABR,');
      SQL.Add('SUM(QUAY_Y * PUNY_Y) AS VL_PED_LIQ,');
      SQL.Add('SUM(CHEY_Y * PUNY_Y) AS VL_PED_FAT_LIQ,');
      SQL.Add('CASE');
      SQL.Add('WHEN SITY_Y=''P'' THEN COUNT(*)');
      SQL.Add('END NR_PARCIAL,');
      SQL.Add('CASE');
      SQL.Add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN COUNT(*)');
      SQL.Add('END NR_FATURADO,');
      SQL.Add('CASE');
      SQL.Add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN Sum(CHEY_Y)');
      SQL.Add('END QT_FATURADO,');
      SQL.Add('CASE');
      SQL.Add('WHEN SITY_Y=''C'' THEN COUNT(*)');
      SQL.Add('END NR_CANCELADO,');
      SQL.Add('CASE');
      SQL.Add('WHEN SITY_Y=''N'' THEN COUNT(*)');
      SQL.Add('END NR_NOVO,');
      SQL.Add('NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,');
      SQL.Add('CASE');
      SQL.Add('WHEN QT_BONIFICADA>0 THEN COUNT(*)');
      SQL.Add('END NR_ITENS_BONIFICADO,');
      SQL.Add('CD_OPERADOR_LOGISTICO,FLAP_P,CAPA.ID_CROSSDOCKING,CD_EMPRESA_DESTINO,CAPA.NM_USUARIO');
      SQL.Add(',OBSP_P');
      SQL.Add(',NM_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
      SQL.Add('PRDDM.DCPCC CAPA,');
      SQL.Add('PRDDM.DCPCI ITEM,');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPR,');
      SQL.Add('ACESSO.DC_EMPRESA CD');
      SQL.Add('WHERE');
      SQL.Add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND  NROP_P = NROP_Y');
      SQL.Add('AND  capa.cd_comprador=COMPR.nr_comprador');
      SQL.Add('AND ((CAPA.CD_OPERACAO_REDE IN (select CD_EMPRESA FROM acesso.dc_empresa WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
      SQL.Add('AND CD.CD_EMPRESA=CAPA.cd_empresa_destino');
      SQL.Add('AND ID_EMPRESA_FISICA=''S''');
      SQL.Add('AND  LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND  LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
      SQL.Add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa_destino');
      SQL.Add('AND COMPRA_MERCADORIA.CD_MERCADORIA = ITEM.NROM_Y');
      SQL.Add('AND sitp_p in(''W'')');
      SQL.Add('AND sity_y not in(''C'',''I'',''S'')');
 //     SQL.Add('--AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
   //   SQL.Add('--AND trunc(DATP_P) between :PdtInicio and :PdtFinal');
      SQL.Add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,SITP_P,SITY_Y,NROP_P,OBSP_P,');
      SQL.Add('DATP_P,PREP_P,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P, NM_COMPRADOR,');
      SQL.Add('CAPA.CD_EMPRESA,VCCI_Y,CD_OPERADOR_LOGISTICO,FLAP_P,capa.id_crossdocking,ID_UNIDADE_FEDERACAO,CD_EMPRESA_DESTINO,QT_BONIFICADA,CAPA.NM_USUARIO)');
      SQL.Add('GROUP BY LABP_P,NM_FORNECEDOR,NROP_P,SITP_P,DT_PEDIDO,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,CD_EMPRESA,CD_OPERADOR_LOGISTICO,FLAP_P,');
      SQL.Add('id_crossdocking,ID_UNIDADE_FEDERACAO,CD_EMPRESA_DESTINO,CD_EMPRESA,NM_USUARIO,OBSP_P ,NM_COMPRADOR');
      SQL.Add('ORDER BY DT_PEDIDO,LABP_P,NROP_P');


    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
//      Params.ParamByName('PnrPedido').AsInteger := nrPedido;
  //    Params.ParamByName('PcdEmpresa').AsInteger := nrEmpresa;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;



end.

