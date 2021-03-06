unit ucliente;

interface

uses SysUtils,Math,SqlExpr,DB,DBClient, Classes;

type
  TDadosRepresentante = record
   nmRepresentante :String[50];
   nrTelefone      :String[15];
  end;
Type
 TDadosBloqueioCliente = record
   nrBloqueio            :Integer;
   IdBloqueioPedido      :String[1];
   IdBloqueioMedicamento :String[1];
   idBloqueiaPsicotropico:String[1];
   stDescricaoBloqueio:String;
 end;
type
 TRedeCliente = Class(TObject)
 Private
    FnmRede: String;
    FidTipoRede: String;
    FnrRede: Integer;
    procedure SetidTipoRede(const Value: String);
    procedure SetnmRede(const Value: String);
    procedure SetnrRede(const Value: Integer);
 public
  property nrRede      : Integer  read  FnrRede write SetnrRede;
  property nmRede      :String  read  FnmRede write SetnmRede;
  property idTipoRede  :String  read  FidTipoRede write SetidTipoRede;

 protected
 end;


type
  TCliente = class(TObject)
    private
    FcdCliente: Integer;
    FidBloqueioPsicotropico: Char;
    FidRepassaSC: Char;
    FidStatusCliente: Char;
    FidStatusPessoa: Char;
    FvlSegundoPedido: Double;
    FvlSaldoCliente: Double;
    FvlPrimeiroPedido: Double;
    FvlLimiteCompra: Double;
    FpcDesconto: Double;
    FnrCliente: Integer;
    FnrRoteiro: Integer;
    FnrQuantidadeCotacao: integer;
    FnrDigitoCliente: Integer;
    FnrCanal: Integer;
    FnrDiasPrazoEspecial: Integer;
    FnrTransportador: Integer;
    FnrQuantidadepedidoDia: Integer;
    FnrCondicao: Integer;
    FidRepresentanteLibera: Integer;
    FnrVendedor: Integer;
    FnrCep: Integer;
    FnrListaPreco: Integer;
    FcdPrazo: Integer;
    FnrTipoCliente: Integer;
    FdsUnidadeFederacao: String;
    FnmProprietario: String;
    Fdsemail: String;
    FnmGerente: String;
    FdsBairro: String;
    FdsEsmail1: String;
    FdsIncricaoEstadual: String;
    FdsEsmail2: String;
    FnmRazaoSocial: String;
    FdsMunicipio: String;
    FnrCNPJCliente: String;
    FdsAcordo: String;
    FdsEndereco: String;
    FnrFax: String;
    FdtFundacao: TDateTime;
    FdtPrimeiraCompra: TDateTime;
    FdtVencimentoAlvara: TDateTime;
    FdtBloqueio: TDateTime;
    FidFaturaEmpresa: String;
    FnrClassificaoCliente: Integer;
    FpcDespesasVariaveis: Double;
    FnrTipoEmpresa: Integer;
    FnrTipoTributacao: Integer;
    FdtUltimaCompra: TDateTime;
    FcdAcordo: Integer;
    FnrDiasValidadeMercadoria: Integer;
    FidSituacaoCliente: Char;
    FnrSubClassificaoCliente: Integer;
    FdsResponsavelEntrega: String;
    FnrClassificaoFiscalCliente: Integer;
    FidSimples: String;
    FidAtivo: String;
    FnrPrazoMaximoPedido: Integer;
    FnrCDEstoque: Integer;
    FvlPedidoMinimo: Double;
    FnrCNPJFORMATADO: String;
    FdsTipoCliente: String;
    FnrPrazoCliente: Integer;
    FdsCanal: String;
    FdsTipoTributacao: String;
    FnmRepresentante: String;
    FnrTelefoneRepresentante: String;
    FnmRepresentanteUQM: String;
    FidFarmaciaPopular: Boolean;
    FnrQuantidadeItemCotacao: integer;
    procedure SetcdCliente(const Value: Integer);
    procedure SetcdPrazo(const Value: Integer);
    procedure SetdsAcordo(const Value: String);
    procedure SetdsBairro(const Value: String);
    procedure Setdsemail(const Value: String);
    procedure SetdsEndereco(const Value: String);
    procedure SetdsEsmail1(const Value: String);
    procedure SetdsEsmail2(const Value: String);
    procedure SetdsIncricaoEstadual(const Value: String);
    procedure SetdsMunicipio(const Value: String);
    procedure SetdsUnidadeFederacao(const Value: String);
    procedure SetdtBloqueio(const Value: TDateTime);
    procedure SetdtFundacao(const Value: TDateTime);
    procedure SetdtPrimeiraCompra(const Value: TDateTime);
    procedure SetdtVencimentoAlvara(const Value: TDateTime);
    procedure SetidBloqueioPsicotropico(const Value: Char);
    procedure SetidRepassaSC(const Value: Char);
    procedure SetidRepresentanteLibera(const Value: Integer);
    procedure SetidStatusCliente(const Value: Char);
    procedure SetidStatusPessoa(const Value: Char);
    procedure SetnmGerente(const Value: String);
    procedure SetnmProprietario(const Value: String);
    procedure SetnmRazaoSocial(const Value: String);
    procedure SetnrCanal(const Value: Integer);
    procedure SetnrCep(const Value: Integer);
    procedure SetnrCliente(const Value: Integer);
    procedure SetnrCNPJCliente(const Value: String);
    procedure SetnrCondicao(const Value: Integer);
    procedure SetnrDiasPrazoEspecial(const Value: Integer);
    procedure SetnrDigitoCliente(const Value: Integer);
    procedure SetnrFax(const Value: String);
    procedure SetnrListaPreco(const Value: Integer);
    procedure SetnrQuantidadeCotacao(const Value: integer);
    procedure SetnrQuantidadepedidoDia(const Value: Integer);
    procedure SetnrRoteiro(const Value: Integer);
    procedure SetnrTipoCliente(const Value: Integer);
    procedure SetnrTransportador(const Value: Integer);
    procedure SetnrVendedor(const Value: Integer);
    procedure SetpcDesconto(const Value: Double);
    procedure SetvlLimiteCompra(const Value: Double);
    procedure SetvlPrimeiroPedido(const Value: Double);
    procedure SetvlSaldoCliente(const Value: Double);
    procedure SetvlSegundoPedido(const Value: Double);
    procedure SetidFaturaEmpresa(const Value: String);
    procedure SetnrClassificaoCliente(const Value: Integer);
    procedure SetpcDespesasVariaveis(const Value: Double);
    procedure SetnrTipoEmpresa(const Value: Integer);
    procedure SetnrTipoTributacao(const Value: Integer);
    procedure SetdtUltimaCompra(const Value: TDateTime);
    procedure SetcdAcordo(const Value: Integer);
    procedure SetnrDiasValidadeMercadoria(const Value: Integer);
    procedure SetidSituacaoCliente(const Value: Char);
    procedure SetnrSubClassificaoCliente(const Value: Integer);
    procedure SetdsResponsavelEntrega(const Value: String);
    procedure SetnrClassificaoFiscalCliente(const Value: Integer);
    procedure SetidSimples(const Value: String);
    procedure SetidAtivo(const Value: String);
    procedure setnrCDEstoque(const Value: Integer);
    procedure setnrPrazoMaximoPedido(const Value: Integer);
    procedure SetvlPedidoMinimo(const Value: Double);
    procedure SetdsTipoCliente(const Value: String);
    procedure SetnrCNPJFORMATADO(const Value: String);
    procedure SetnrPrazoCliente(const Value: Integer);
    procedure SetdsCanal(const Value: String);
    procedure SetdsTipoTributacao(const Value: String);
    procedure setnmRepresentante(const Value: String);
    procedure setnrTelefoneRepresentante(const Value: String);
    procedure setnmRepresentanteUQM(const Value: String);
    procedure SetidFarmaciaPopular(const Value: Boolean);
    procedure SetnrQuantidadeItemCotacao(const Value: integer);

    public
    property  cdCliente                        : Integer read FcdCliente write SetcdCliente;
    property  nmRazaoSocial                    : String read FnmRazaoSocial write SetnmRazaoSocial;
    property  dsMunicipio                      : String read FdsMunicipio write SetdsMunicipio;
    property  dsEndereco                       : String read FdsEndereco write SetdsEndereco;
    property  dsBairro                         : String read FdsBairro write SetdsBairro;
    property  nrCep                            : Integer read FnrCep write SetnrCep;
    property  nrFax                            : String read FnrFax write SetnrFax;
    property  dsIncricaoEstadual               : String read FdsIncricaoEstadual write SetdsIncricaoEstadual;
    property  dtVencimentoAlvara               : TDateTime read FdtVencimentoAlvara write SetdtVencimentoAlvara;
    property  nrVendedor                       : Integer read FnrVendedor write SetnrVendedor;
    property  cdPrazo                          : Integer read FcdPrazo write SetcdPrazo;
    property  nrPrazoCliente                   : Integer read FnrPrazoCliente write SetnrPrazoCliente;
    property  pcDesconto                       : Double read FpcDesconto write SetpcDesconto;
    property  dtPrimeiraCompra                 : TDateTime read FdtPrimeiraCompra write SetdtPrimeiraCompra;
    property  dtUltimaCompra                   : TDateTime read FdtUltimaCompra write SetdtUltimaCompra;
    property  vlLimiteCompra                   : Double read FvlLimiteCompra write SetvlLimiteCompra;
    property  vlSaldoCliente                   : Double read FvlSaldoCliente write SetvlSaldoCliente;
    property  idStatusCliente                  : Char read FidStatusCliente write SetidStatusCliente;
    property  nrCondicao                       : Integer read FnrCondicao write SetnrCondicao;
    property  dsUnidadeFederacao               : String read FdsUnidadeFederacao write SetdsUnidadeFederacao;
    property  dtFundacao                       : TDateTime read FdtFundacao write SetdtFundacao;
    property  nrCanal                          : Integer read FnrCanal write SetnrCanal;
    property  nrClassificaoCliente             : Integer  read FnrClassificaoCliente write SetnrClassificaoCliente;
    property  nrClassificaoFiscalCliente       : Integer  read FnrClassificaoFiscalCliente write SetnrClassificaoFiscalCliente;
    property  nrSubClassificaoCliente          : Integer  read FnrSubClassificaoCliente write SetnrSubClassificaoCliente;
    property  idStatusPessoa                   : Char read FidStatusPessoa write SetidStatusPessoa;
    property  nrTipoCliente                    : Integer read FnrTipoCliente write SetnrTipoCliente;
    property  nrCliente                        : Integer read FnrCliente write SetnrCliente;
    property  nrDigitoCliente                  : Integer read FnrDigitoCliente write SetnrDigitoCliente;
    property  dsTipoCliente                    : String read FdsTipoCliente write SetdsTipoCliente;
    property  dsemail                          : String read Fdsemail write Setdsemail;
    property  nrCNPJCliente                    : String read FnrCNPJCliente write SetnrCNPJCliente;
    property  nrCNPJFORMATADO                  : String read FnrCNPJFORMATADO write SetnrCNPJFORMATADO;
    property  nrRoteiro                        : Integer read FnrRoteiro write SetnrRoteiro;
    property  nrTransportador                  : Integer read FnrTransportador write SetnrTransportador;
    property  vlPrimeiroPedido                 : Double read FvlPrimeiroPedido write SetvlPrimeiroPedido;
    property  vlSegundoPedido                  : Double read FvlSegundoPedido write SetvlSegundoPedido;
    property  nmProprietario                   : String read FnmProprietario write SetnmProprietario;
    property  nmGerente                        : String read FnmGerente write SetnmGerente;
    property  dsAcordo                         : String read FdsAcordo write SetdsAcordo;
    property  cdAcordo                         : Integer read FcdAcordo write SetcdAcordo ;
    property  idBloqueioPsicotropico           : Char read FidBloqueioPsicotropico write SetidBloqueioPsicotropico;
    property  idSituacaoCliente                : Char read FidSituacaoCliente write SetidSituacaoCliente;
    property  nrListaPreco                     : Integer read FnrListaPreco write SetnrListaPreco;
    property  nrQuantidadepedidoDia            : Integer read FnrQuantidadepedidoDia write SetnrQuantidadepedidoDia;
    property  dtBloqueio                       : TDateTime read FdtBloqueio write SetdtBloqueio;
    property  nrQuantidadeCotacao              : integer read FnrQuantidadeCotacao write SetnrQuantidadeCotacao;
    property  nrQuantidadeItemCotacao          : integer read FnrQuantidadeItemCotacao write SetnrQuantidadeItemCotacao;
    property  dsEsmail1                        : String read FdsEsmail1 write SetdsEsmail1;
    property  dsEsmail2                        : String read FdsEsmail2 write SetdsEsmail2;
    property  idRepassaSC                      : Char read FidRepassaSC write SetidRepassaSC;
    property  nrDiasPrazoEspecial              : Integer read FnrDiasPrazoEspecial write SetnrDiasPrazoEspecial;
    property  idRepresentanteLibera            : Integer read FidRepresentanteLibera write SetidRepresentanteLibera;
    Property  idFaturaEmpresa                  : String read FidFaturaEmpresa write SetidFaturaEmpresa;
    property  pcDespesasVariaveis              : Double read FpcDespesasVariaveis write SetpcDespesasVariaveis;
    property  nrTipoEmpresa                    : Integer read FnrTipoEmpresa write SetnrTipoEmpresa;
    property  nrTipoTributacao                 : Integer  read FnrTipoTributacao write SetnrTipoTributacao;
    Property  idSimples                        : String read FidSimples write SetidSimples;
    Property  idFarmaciaPopular                : Boolean read FidFarmaciaPopular write SetidFarmaciaPopular;


    property  nrDiasValidadeMercadoria         : Integer  read FnrDiasValidadeMercadoria write SetnrDiasValidadeMercadoria;
    Property  dsResponsavelEntrega             : String read FdsResponsavelEntrega write SetdsResponsavelEntrega;
    Property  dsCanal                          : String read FdsCanal write SetdsCanal;
    property  dsTipoTributacao                 : String  read FdsTipoTributacao write SetdsTipoTributacao;

    Property  idAtivo                          : String read FidAtivo write SetidAtivo;
    property  nrPrazoMaximoPedido              : Integer read FnrPrazoMaximoPedido write setnrPrazoMaximoPedido;
    property  vlPedidoMinimo                   : Double read FvlPedidoMinimo write SetvlPedidoMinimo;
    property  nrCDEstoque                      : Integer read FnrCDEstoque write setnrCDEstoque;
    property  nmRepresentante                  : String read FnmRepresentante write setnmRepresentante;
    property  nrTelefoneRepresentante          : String read FnrTelefoneRepresentante write setnrTelefoneRepresentante;
    property  nmRepresentanteUQM               : String read FnmRepresentanteUQM write setnmRepresentanteUQM;


    procedure SetDadosClientes(nrCliente:Integer);
      protected
end;
type
  TClienteAtivo = class(TObject)
  private
    FnrCliente: Integer;
    FcdOPeradorLogistico: Integer;
    FvlPedidoMinimo: Double;
    FnrPrazoMaximoPedido: Integer;
    FidAtivo: String;
    FcdResposavelOperador: Integer;
    FnrCDEstoque: Integer;
    procedure SetcdOPeradorLogistico(const Value: Integer);
    procedure SetnrCliente(const Value: Integer);
    procedure SetidAtivo(const Value: String);
    procedure SetnrPrazoMaximoPedido(const Value: Integer);
    procedure SetvlPedidoMinimo(const Value: Double);
    procedure SetcdResposavelOperador(const Value: Integer);
    procedure SetnrCDEstoque(const Value: Integer);
    Public
      property cdOPeradorLogistico         :Integer read FcdOPeradorLogistico write SetcdOPeradorLogistico;
      property nrCliente                   :Integer read FnrCliente write SetnrCliente;
      property idAtivo                     :String read FidAtivo write SetidAtivo;
      property nrPrazoMaximoPedido        :Integer read FnrPrazoMaximoPedido write SetnrPrazoMaximoPedido;
      property vlPedidoMinimo              :Double read FvlPedidoMinimo write SetvlPedidoMinimo;
      property cdResposavelOperador        :Integer read FcdResposavelOperador write SetcdResposavelOperador;
      property nrCDEstoque                 :Integer read FnrCDEstoque write SetnrCDEstoque;

   protected
end;



  function GetCliente(PnrCliente,PnrDigito,PnrOPeradorLogistico:Integer;PnrCnpj:String):TCliente;
  Function GetClienteAtivo(cdOperadorLogistico,nrCliente:Integer):TclienteAtivo;
  Function GetBloqueioCliente(cdOperadorLogistico,nrCliente:Integer):TDadosBloqueioCliente;
//  function HorarioCaminhao(idRegistro: String; nrCaminhao: Integer): String;
  function getTransportador(nrCliente:integer):String;
  function DadosFuncionariosCliente(PnrCliente:integer):TClientDataSet;
  function GetRepresentante(PnrVendedor:Integer):TDadosRepresentante;
  function GetRepresentanteUQM(PnrVendedor,PnrFornecedor:Integer):TDadosRepresentante;
  function GetTipoRede(PidTipoRede:String;PnrRede:Integer):TRedeCliente;




//  Function GetClienteAtivo(cdOperadorLogistico,nrCliente:Integer):TclienteAtivo;


implementation

uses  uDm, uRotinasGenericas;


{ TCliente }

procedure TCliente.SetcdAcordo(const Value: Integer);
begin
  FcdAcordo := Value;
end;

procedure TCliente.SetcdCliente(const Value: Integer);
begin
  FcdCliente := Value;
end;

procedure TCliente.SetcdPrazo(const Value: Integer);
begin
  FcdPrazo := Value;
end;

procedure TCliente.SetDadosClientes(nrCliente: Integer);
begin

end;



function ClientesComPedidoEmEspera(PcdProduto:Integer):TClientDataSet;
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
      SQL.Add('NROC_C*10+DIGC_C AS CODIGO, NOMP_P , ENDP_P , FONP_P  ,');
      SQL.Add('FO1C_C  , FO2C_C , FO3C_C , DVAP_P , NROV_C  ,');
      SQL.Add('PRZC_C  , DESC_C , DPCC_C , LIMC_C , SDOC_C  ,');
      SQL.Add('STAC_C  , CONDICAO,UFEP_P , FUNP_P , CANC_C  ,');
      SQL.Add('STAP_P  , MUNP_P  ,TIPC_C , NROC_C , EMAC_C  ,');
      SQL.Add('CGCP_P  , ROTC_C ,  NROT_C  ,  VMPC_C,   VMSC_C,');
      SQL.Add('DNPC_C,  DNGC_C,  DNCC_C  ,     PROC_C, GERC_C,');
      SQL.Add('ACOC_C ,CD_ACORDO_ST,BLPC_C,  NCLC_C  ,QPDC_C, BAIP_P,');
      SQL.Add('CEPP_P, FAXP_P, INEP_P,DIGC_C,  DT_BLOQUEIO,');
      SQL.Add('DUCC_C,DPCC_C,NR_DIAS_VALIDADE_MERCADORIA,');
      SQL.Add('QT_COTACAO,QT_ITEM_COTACAO,  ETEC_C,');
      SQL.Add('NM_EMAIL1,NM_EMAIL2,ID_REPASSE_SC,');
      SQL.Add('NR_DIAS_PRAZO_ESPECIAL,');
      SQL.Add('ID_REPRESENTANTE_LIBERA_PEDIDO,');
      SQL.Add('ID_FATURA_EMPRESA,PC_DESPESA_VARIAVEL,NR_TRIBUTACAO_ESTADUAL,');
      SQL.Add('ID_SITUACAO_CLIENTE,ECNC_C,NR_CLASSIFICACAO_FISCAL');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCPES,PRDDM.DCCLI');
      SQL.Add('WHERE');
      SQL.Add('CGCP_P = CGCP_C');
      SQL.Add('AND ID_SITUACAO_CLIENTE<>''I''');
      SQL.Add('AND (NROC_C = :PNR_CLIENTE AND DIGC_C = :PDG_CLIENTE');
      SQL.Add('OR CGCP_C  = :PNR_CNPJ)');

    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PcdProduto').AsInteger:=PcdProduto;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;



function GetCliente(PnrCliente,PnrDigito,PnrOPeradorLogistico:Integer;PnrCnpj:String):TCliente;
var
  Cliente : TCliente;
  DadosClienteAtivo:TClienteAtivo;
  DadosRepresentante :TDadosRepresentante;
  QryTemp: TSQLQuery;
 _cdsTemp:TClientDataSet;
 qrySt :TstringList;
begin

  result:=nil;
  //Cliente:=NIL;
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    qryst :=TStringList.Create;
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT');
      SQL.Add('NROC_C*10+DIGC_C AS CODIGO, NOMP_P , ENDP_P , FONP_P  ,');
      SQL.Add('FO1C_C  , FO2C_C , FO3C_C , DVAP_P , NROV_C  ,');
      SQL.Add('PRZC_C  , DESC_C , DPCC_C , LIMC_C , SDOC_C  ,');
      SQL.Add('STAC_C  , CONDICAO,UFEP_P , FUNP_P , CANC_C  ,');
      SQL.Add('STAP_P  , MUNP_P  ,TIPC_C , NROC_C , EMAC_C  ,');
      SQL.Add('SUBSTR(TO_CHAR(CGCP_P,''00000000000000''), 1, 3) || ''.'' || SUBSTR(TO_CHAR(CGCP_P,''00000000000000''), 4, 3) || ''.'' ||');
      SQL.Add('SUBSTR(TO_CHAR(CGCP_P,''00000000000000''), 7, 3) || ''/'' || SUBSTR(TO_CHAR(CGCP_P,''00000000000000''), 10, 4)|| ''-'' ||');
      SQL.Add('SUBSTR(TO_CHAR(CGCP_P,''00000000000000''), 14) AS CNPJ_FORMATADO,');
      SQL.Add('CGCP_P AS CNPJ , ROTC_C ,  NROT_C  ,  VMPC_C,   VMSC_C,');
      SQL.Add('DNPC_C,  DNGC_C,  DNCC_C  ,     PROC_C, GERC_C,');
      SQL.Add('ACOC_C ,CD_ACORDO_ST,BLPC_C,  NCLC_C  ,QPDC_C, BAIP_P,');
      SQL.Add('CEPP_P, FAXP_P, INEP_P,DIGC_C,  DT_BLOQUEIO,');
      SQL.Add('DUCC_C,DPCC_C,NR_DIAS_VALIDADE_MERCADORIA,');
      SQL.Add('QT_COTACAO,QT_ITEM_COTACAO,  ETEC_C,');
      SQL.Add('NM_EMAIL1,NM_EMAIL2,ID_REPASSE_SC,');
      SQL.Add('NR_DIAS_PRAZO_ESPECIAL,');
      SQL.Add('ID_REPRESENTANTE_LIBERA_PEDIDO,');
      SQL.Add('ID_FATURA_EMPRESA,PC_DESPESA_VARIAVEL,NR_TRIBUTACAO_ESTADUAL,');
      SQL.Add('ID_SITUACAO_CLIENTE,ECNC_C,NR_CLASSIFICACAO_FISCAL,');
      SQL.Add('TABELA_TIPO.NOMT_T AS  DS_TIPO_CLIENTE,');
      SQL.Add('SUBSTR(TABELA_PRAZO.NOMT_T,1,3) AS DS_PRAZO,DT_VALIDADE_FARMACIA_POPULAR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCPES PESSOA,');
      SQL.Add('PRDDM.DCCLI cliente');
      SQL.Add('LEFT OUTER JOIN PRDDM.DCTAB TABELA_TIPO ON TABELA_TIPO.TIPT_T=''C'' AND TABELA_TIPO.NROT_T=CLIENTE.TIPC_C');
      SQL.Add('LEFT OUTER JOIN PRDDM.DCTAB TABELA_PRAZO ON TABELA_PRAZO.TIPT_T=''Z'' AND TABELA_PRAZO.NROT_T=CLIENTE.PRZC_C');
      SQL.Add('WHERE');
      SQL.Add('CGCP_P = CGCP_C');
      SQL.Add('AND ID_SITUACAO_CLIENTE<>''I''');
//      SQL.Add('AND ID_SITUACAO_CLIENTE<>''I''');
      if PnrCliente>0 then
       SQL.Add('AND (NROC_C = :PNR_CLIENTE AND DIGC_C = :PDG_CLIENTE)');
     if Length(trim(PnrCnpj))>1 then
       SQL.Add('and CGCP_C  = :PNR_CNPJ');

    end;
    qrySt.Add(QryTemp.Text);
    qryst.SaveToFile('C:\temp\sqlCliente.sql');
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      if PnrCliente>0 then
      begin
       Params.ParamByName('PNR_CLIENTE').AsInteger := PnrCliente;
       Params.ParamByName('PDG_CLIENTE').AsInteger := PnrDigito;
      end;
     if Length(trim(PnrCnpj))>1 then
        Params.ParamByName('PNR_CNPJ').AsString := PnrCnpj;
    open;
    end;




    if _cdsTemp.IsEmpty then
    begin
        result:=nil;
        exit;
    end;
    if not _cdsTemp.IsEmpty then
    begin
        Cliente:=TCliente.Create;
        Cliente.cdCliente                := _cdsTemp.fieldByName('CODIGO').asinteger;
        Cliente.nrCliente                := _cdsTemp.fieldByName('NROC_C').asinteger;
        Cliente.nrDigitoCliente          := _cdsTemp.fieldByName('DIGC_C').asinteger;
        Cliente.nrCNPJCliente            := _cdsTemp.fieldByName('CNPJ').AsString;//FormatFloat('00,000,000.0000-00',_cdsTemp.fieldByName('CGCP_P').AsFloat);
        Cliente.nrCNPJFORMATADO          := _cdsTemp.fieldByName('CNPJ_FORMATADO').AsString;//FormatFloat('00,000,000.0000-00',_cdsTemp.fieldByName('CGCP_P').AsFloat);
        Cliente.nmRazaoSocial            := _cdsTemp.fieldByName('NOMP_P').AsString;
        Cliente.dsEndereco               := _cdsTemp.FieldByName('ENDP_P').AsString;
        Cliente.dsMunicipio              := _cdsTemp.fieldByName('MUNP_P').AsString;
        Cliente.dsUnidadeFederacao       := _cdsTemp.fieldByName('UFEP_P').AsString;
        Cliente.nrTipoCliente            := _cdsTemp.fieldByName('TIPC_C').AsInteger;
        Cliente.nrCanal                  := _cdsTemp.fieldByName('CANC_C').AsInteger;
        Cliente.idFaturaEmpresa          := _cdsTemp.fieldByName('ID_FATURA_EMPRESA').AsString;
        Cliente.nrClassificaoCliente     := _cdsTemp.fieldByName('NCLC_C').AsInteger;
        Cliente.nrSubClassificaoCliente  := _cdsTemp.fieldByName('ECNC_C').AsInteger;
        Cliente.nrVendedor               := _cdsTemp.fieldByName('NROV_C').AsInteger;
        Cliente.dsAcordo                 := _cdsTemp.fieldByName('ACOC_C').AsString;
        Cliente.cdAcordo                 := _cdsTemp.FieldByName('CD_ACORDO_ST').AsInteger;
        Cliente.pcDespesasVariaveis      := _cdsTemp.fieldByName('PC_DESPESA_VARIAVEL').AsFloat;
        Cliente.cdPrazo                  := _cdsTemp.fieldByName('PRZC_C').AsInteger;
        Cliente.nrQuantidadepedidoDia    := _cdsTemp.fieldByName('QPDC_C').AsInteger;
        Cliente.vlPrimeiroPedido         := _cdsTemp.fieldByName('VMPC_C').AsInteger;
        Cliente.vlSegundoPedido          := _cdsTemp.fieldByName('VMSC_C').AsInteger;
        Cliente.nrTipoEmpresa            := _cdsTemp.fieldByName('ETEC_C').AsInteger;
        Cliente.nrQuantidadeCotacao      := _cdsTemp.fieldByName('QT_COTACAO').AsInteger;
        Cliente.nrQuantidadeItemCotacao  := _cdsTemp.fieldByName('QT_ITEM_COTACAO').AsInteger;
        Cliente.nrTipoTributacao         := _cdsTemp.fieldByName('NR_TRIBUTACAO_ESTADUAL').AsInteger;
        Cliente.dsTipoCliente            := _cdsTemp.fieldByName('DS_TIPO_CLIENTE').AsString;
        Cliente.nrPrazoCliente           := StrToIntDef(_cdsTemp.fieldByName('DS_PRAZO').AsString,0);
        Cliente.vlLimiteCompra           := _cdsTemp.fieldByName('LIMC_C').AsFloat;

        Cliente.idSimples:='N';
        Cliente.dsTipoTributacao:='Normal';
        if Cliente.nrTipoTributacao=2 then
        begin
          Cliente.idSimples:='S';
          Cliente.dsTipoTributacao:='Simples';
        end;
        if Cliente.nrCanal=1 then
           Cliente.dsCanal:='Farma';
        if Cliente.nrCanal=2 then
           Cliente.dsCanal:='Alimentar';
        if Cliente.nrCanal=3 then
           Cliente.dsCanal :='Hospitalar';

        Cliente.dsemail                  := _cdsTemp.fieldByName('EMAC_C').AsString;
        Cliente.dsEsmail1                := _cdsTemp.fieldByName('NM_EMAIL1').AsString;
        Cliente.dsEsmail2                := _cdsTemp.fieldByName('NM_EMAIL2').AsString;
        Cliente.vlLimiteCompra           := _cdsTemp.fieldByName('LIMC_C').AsFloat;
        Cliente.dtUltimaCompra           := _cdsTemp.fieldByName('DUCC_C').AsDateTime;
        Cliente.dtVencimentoAlvara       := _cdsTemp.fieldByName('DVAP_P').AsDateTime;
        Cliente.nrTransportador          := _cdsTemp.fieldByName('NROT_C').AsInteger;
        Cliente.idBloqueioPsicotropico   := _cdsTemp.fieldByName('blpc_c').AsString[1];
        Cliente.nrDiasValidadeMercadoria := _cdsTemp.fieldByName('NR_DIAS_VALIDADE_MERCADORIA').AsInteger;
        Cliente.nrDiasPrazoEspecial      := _cdsTemp.fieldByName('NR_DIAS_PRAZO_ESPECIAL').AsInteger;
        Cliente.idSituacaoCliente        := _cdsTemp.fieldByName('ID_SITUACAO_CLIENTE').AsString[1];

        Cliente.nrClassificaoFiscalCliente:=_cdsTemp.fieldByName('NR_CLASSIFICACAO_FISCAL').AsInteger;
        Cliente.dsResponsavelEntrega     := getTransportador(Cliente.nrCliente);

        Cliente.idFarmaciaPopular:=false;
        if (FormatDateTime('dd/mm/yyyy',_cdsTemp.fieldByName('DT_VALIDADE_FARMACIA_POPULAR').AsDateTime)<>'01/01/2039') and
           (_cdsTemp.fieldByName('DT_VALIDADE_FARMACIA_POPULAR').AsDateTime>dtSistema) then
           Cliente.idFarmaciaPopular:=true;


        DadosClienteAtivo:=GetClienteAtivo(PnrOPeradorLogistico, Cliente.nrCliente);
        if DadosClienteAtivo<>nil then
        begin
         Cliente.idAtivo                          := DadosClienteAtivo.idAtivo;
         Cliente.nrPrazoMaximoPedido              := DadosClienteAtivo.nrPrazoMaximoPedido;
         Cliente.vlPedidoMinimo                   := DadosClienteAtivo.vlPedidoMinimo;
         Cliente.nrCDEstoque                      := DadosClienteAtivo.nrCDEstoque;
         if DadosClienteAtivo.idAtivo='I' then
         begin
           Mensagem('Cliente Inativo Para esse Meio Pedido',16);
         end;

        end;

         DadosRepresentante := GetRepresentante(Cliente.nrVendedor);
         if DadosRepresentante.nmRepresentante<>'' then
         begin
           Cliente.nmRepresentante        :=DadosRepresentante.nmRepresentante;
           Cliente.nrTelefoneRepresentante:=DadosRepresentante.nrTelefone;
         end;

         DadosRepresentante:=GetRepresentanteUQM(Cliente.nrCliente,287);
         if DadosRepresentante.nmRepresentante<>'' then
           Cliente.nmRepresentanteUQM     :=DadosRepresentante.nmRepresentante;


    end;
    result:=Cliente;
  finally
    FreeAndNil(QryTemp);
  end;
end;


{function HorarioCaminhao(idRegistro:String;nrCaminhao:Integer):String;
var
 stParamentro :String;
begin

 try
    stParamentro:=idRegistro+FormatFloat('000000',nrCaminhao);
    with _dmPrincipal._stpHorarioCaminhao do
    begin
     Close;
     StoredProcName:='PR_HORARIO_CAMINHAO';
     ParamByName('ENTRADA_IN').AsString:=stParamentro;
     Prepared:=false;
     ExecProc;
     Result:='Erro Na Rotina Horario Caminh?o -  '+FormatFloat('000000',ParamByName('ERRO_OU').AsInteger);
    if ParamByName('ERRO_OU').AsInteger=0 then
        result:=ParamByName('SAIDA_OU').AsString;
    end;
 except
    Result:='Erro Na Rotina Horario Caminh?o -  '+FormatFloat('000000',_dmPrincipal._stpHorarioCaminhao.ParamByName('ERRO_OU').AsInteger);
end;


end;}

function getTransportador(nrCliente:integer):String;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT c.cd_entrega_caminhao_secundario,ds_local_entrega,ds_transportador');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('prddm.dccli c,');
    tempQuery.SQL.Add('prddm.dc_entrega_caminhao_secundario e,');
    tempQuery.SQL.Add('prddm.dc_frete_transportador t');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('nroc_c=:PnrCliente');
    tempQuery.SQL.Add('AND c.id_entrega_caminhao_secundario=e.id_entrega_caminhao_secundario');
    tempQuery.SQL.Add('AND c.cd_entrega_caminhao_secundario=e.cd_entrega_caminhao_secundario');
    tempQuery.SQL.Add('AND e.cd_transportador=t.cd_transportador');
    tempQuery.ParamByName('PnrCliente').AsInteger:=nrCliente;
    tempQuery.Open;
    Result:='N?o Encontrado';
    if not tempQuery.IsEmpty then
           result:=  tempQuery.FieldByName('CD_ENTREGA_CAMINHAO_SECUNDARIO').AsString+' - '+tempQuery.FieldByName('ds_transportador').AsString;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

function DadosFuncionariosCliente(PnrCliente:integer):TClientDataSet;
var
  tempQuery : TSQLQuery;
  _cdsTemp  : TClientDataSet;
begin
  tempQuery := nil;
  try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT  NR_CLIENTE, NM_COMPRADOR, ID_COMPRADOR_PADRAO,');
    tempQuery.SQL.Add('DS_FUNCAO_COMPRADOR, DT_ANIVERSARIO_COMPRADOR');
    tempQuery.SQL.Add('FROM PRDDM.DC_COMPRADOR_CLIENTE');
    tempQuery.SQL.Add('WHERE  NR_CLIENTE=:PnrCliente');
    Result:=nil;
    with _cdsTemp do
    begin
      _cdsTemp.Close;
      _cdsTemp.CommandText:=tempQuery.Text;
      Params.ParamByName('PnrCliente').AsInteger:=PnrCliente;
      open;
    end;
    if not _cdsTemp.IsEmpty then
           result:= _cdsTemp ;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;



Function GetClienteAtivo(cdOperadorLogistico,nrCliente:Integer):TclienteAtivo;
var
  ClienteAtivo : TClienteAtivo;
  erro         : double;
  stParamentoEntrada,
  stParamentoSaida   :String;

begin
    result:=nil;
    try
      stParamentoEntrada:='1'+FormatFloat('000000',cdOperadorLogistico)+'1'+FormatFloat('000000000000000',nrCliente);
      _dm._spClienteAtivo.Close;
      _dm._spClienteAtivo.StoredProcName:='PR_INFORMACAO_CLIENTE';
      _dm._spClienteAtivo.ParamByName('ENTRADA_IN').AsString:=stParamentoEntrada;
      _dm._spClienteAtivo.Close;
      _dm._spClienteAtivo.Prepared:=false;
      _dm._spClienteAtivo.ExecProc;
       erro :=_dm._spClienteAtivo.ParamByName('ERRO_OU').Value;
       stParamentoSaida:=_dm._spClienteAtivo.ParamByName('SAIDA_OU').AsString;
       if erro=0 then
       begin
         ClienteAtivo:=TClienteAtivo.Create;
         ClienteAtivo.idAtivo            := copy(stParamentoSaida,1,1);
         ClienteAtivo.nrPrazoMaximoPedido:=StrToIntDef(copy(stParamentoSaida,09,03),0);
         ClienteAtivo.vlPedidoMinimo     := StrToFloatDef(copy(stParamentoSaida,12,13),0)/100;
         ClienteAtivo.nrCDEstoque        := StrToIntDef(copy(stParamentoSaida,35,06),0);
         result:=ClienteAtivo;
       end;
    EXCEPT
        result:=nil;
        exit;
    end;
end;




Function GetBloqueioCliente(cdOperadorLogistico,nrCliente:Integer):TDadosBloqueioCliente;
var
  ClienteAtivo : TClienteAtivo;
  erro         : double;
  stParamentoEntrada,
  stParamentoSaida,
  stParamentoErro,
  stDescricao    :String;
  idTipoBloqueio :String[1];

begin
    Result.nrBloqueio:=0;
    Result.IdBloqueioMedicamento:='N';
    Result.idBloqueiaPsicotropico:='N';
    Result.stDescricaoBloqueio:='';
    Result.IdBloqueioPedido:='N';
    try
     stParamentoEntrada:='0'+FormatFloat('000000',nrCliente)+FormatFloat('000000',cdOperadorLogistico);
    with  _dm._stpBloqueioCliente do
    begin
     Close;
     StoredProcName:='PR_BLOQUEIO_CLIENTE';
     ParamByname('entrada_in').AsString  := stParamentoEntrada;
     ExecProc;
     stParamentoSaida := ParamByname('saida_ou').AsString;
     stParamentoErro  := ParamByname('erro_ou').AsString;

     Result.IdBloqueioMedicamento  :=copy(stParamentoSaida,2,1);
     Result.idBloqueiaPsicotropico :=copy(stParamentoSaida,3,1);
     idTipoBloqueio:=copy(stParamentoSaida,4,2);
     case StrToIntDef(idTipoBloqueio,0) of
          01 : begin
                  Result.stDescricaoBloqueio:='Alvar? Vencido';
               end;
          02 : Result.stDescricaoBloqueio:='Alvar? Vencido a mais de 90 dias';
          03 : begin
                 Result.stDescricaoBloqueio:='Dias em Atraso';
                 Result.IdBloqueioPedido:='S';
       //          MensagemRepresentante;
               end;
          04 : BEGIN
               Result.stDescricaoBloqueio:='Limite de Credito';
               Result.IdBloqueioPedido:='S';
     //          MensagemRepresentante;
               END;
          05 : begin
                 Result.stDescricaoBloqueio:='Bloqueio Credito e Cobranca';
   //              MensagemRepresentante;
                 Result.IdBloqueioPedido:='S';
               end;
          09 :  Result.stDescricaoBloqueio:='Venda Somente de Perfumaria';
          08 : begin
                Result.stDescricaoBloqueio:='Data do Bloqueio - Credito e Cobran?a';
 //               MensagemRepresentante;
                 Result.IdBloqueioPedido:='S';
               end;
     end;




    if stParamentoErro='4' then
       Mensagem('Erro na Rotina de Bloqueio de Cliente',16);
    end;
  finally
    _dm._stpBloqueioCliente.Close;
  end;
end;





procedure TCliente.SetdsAcordo(const Value: String);
begin
  FdsAcordo := Value;
end;

procedure TCliente.SetdsBairro(const Value: String);
begin
  FdsBairro := Value;
end;

procedure TCliente.SetdsCanal(const Value: String);
begin
  FdsCanal := Value;
end;

procedure TCliente.Setdsemail(const Value: String);
begin
  Fdsemail := Value;
end;

procedure TCliente.SetdsEndereco(const Value: String);
begin
  FdsEndereco := Value;
end;

procedure TCliente.SetdsEsmail1(const Value: String);
begin
  FdsEsmail1 := Value;
end;

procedure TCliente.SetdsEsmail2(const Value: String);
begin
  FdsEsmail2 := Value;
end;

procedure TCliente.SetdsIncricaoEstadual(const Value: String);
begin
  FdsIncricaoEstadual := Value;
end;

procedure TCliente.SetdsMunicipio(const Value: String);
begin
  FdsMunicipio := Value;
end;

procedure TCliente.SetdsResponsavelEntrega(const Value: String);
begin
  FdsResponsavelEntrega := Value;
end;

procedure TCliente.SetdsTipoCliente(const Value: String);
begin
  FdsTipoCliente := Value;
end;

procedure TCliente.SetdsTipoTributacao(const Value: String);
begin
  FdsTipoTributacao := Value;
end;

procedure TCliente.SetdsUnidadeFederacao(const Value: String);
begin
  FdsUnidadeFederacao := Value;
end;

procedure TCliente.SetdtBloqueio(const Value: TDateTime);
begin
  FdtBloqueio := Value;
end;

procedure TCliente.SetdtFundacao(const Value: TDateTime);
begin
  FdtFundacao := Value;
end;

procedure TCliente.SetdtPrimeiraCompra(const Value: TDateTime);
begin
  FdtPrimeiraCompra := Value;
end;

procedure TCliente.SetdtUltimaCompra(const Value: TDateTime);
begin
  FdtUltimaCompra := Value;
end;

procedure TCliente.SetdtVencimentoAlvara(const Value: TDateTime);
begin
  FdtVencimentoAlvara := Value;
end;

procedure TCliente.SetidAtivo(const Value: String);
begin
  FidAtivo := Value;
end;

procedure TCliente.SetidBloqueioPsicotropico(const Value: Char);
begin
  FidBloqueioPsicotropico := Value;
end;


procedure TCliente.SetidFarmaciaPopular(const Value: Boolean);
begin
  FidFarmaciaPopular := Value;
end;

procedure TCliente.SetidFaturaEmpresa(const Value: String);
begin
  FidFaturaEmpresa := Value;
end;

procedure TCliente.SetidRepassaSC(const Value: Char);
begin
  FidRepassaSC := Value;
end;

procedure TCliente.SetidRepresentanteLibera(const Value: Integer);
begin
  FidRepresentanteLibera := Value;
end;

procedure TCliente.SetidSimples(const Value: String);
begin
  FidSimples := Value;
end;

procedure TCliente.SetidSituacaoCliente(const Value: Char);
begin
  FidSituacaoCliente := Value;
end;

procedure TCliente.SetidStatusCliente(const Value: Char);
begin
  FidStatusCliente := Value;
end;

procedure TCliente.SetidStatusPessoa(const Value: Char);
begin
  FidStatusPessoa := Value;
end;

procedure TCliente.SetnmGerente(const Value: String);
begin
  FnmGerente := Value;
end;

procedure TCliente.SetnmProprietario(const Value: String);
begin
  FnmProprietario := Value;
end;

procedure TCliente.SetnmRazaoSocial(const Value: String);
begin
  FnmRazaoSocial := Value;
end;

procedure TCliente.setnmRepresentante(const Value: String);
begin
  FnmRepresentante := Value;
end;

procedure TCliente.setnmRepresentanteUQM(const Value: String);
begin
  FnmRepresentanteUQM := Value;
end;

procedure TCliente.SetnrCanal(const Value: Integer);
begin
  FnrCanal := Value;
end;

procedure TCliente.setnrCDEstoque(const Value: Integer);
begin
  FnrCDEstoque := Value;
end;

procedure TCliente.SetnrCep(const Value: Integer);
begin
  FnrCep := Value;
end;

procedure TCliente.SetnrClassificaoCliente(const Value: Integer);
begin
  FnrClassificaoCliente := Value;
end;

procedure TCliente.SetnrClassificaoFiscalCliente(const Value: Integer);
begin
  FnrClassificaoFiscalCliente := Value;
end;

procedure TCliente.SetnrCliente(const Value: Integer);
begin
  FnrCliente := Value;
end;

procedure TCliente.SetnrCNPJCliente(const Value: String);
begin
  FnrCNPJCliente := Value;
end;

procedure TCliente.SetnrCNPJFORMATADO(const Value: String);
begin
  FnrCNPJFORMATADO := Value;
end;

procedure TCliente.SetnrCondicao(const Value: Integer);
begin
  FnrCondicao := Value;
end;

procedure TCliente.SetnrDiasPrazoEspecial(const Value: Integer);
begin
  FnrDiasPrazoEspecial := Value;
end;

procedure TCliente.SetnrDiasValidadeMercadoria(const Value: Integer);
begin
  FnrDiasValidadeMercadoria := Value;
end;

procedure TCliente.SetnrDigitoCliente(const Value: Integer);
begin
  FnrDigitoCliente := Value;
end;

procedure TCliente.SetnrFax(const Value: String);
begin
  FnrFax := Value;
end;

procedure TCliente.SetnrListaPreco(const Value: Integer);
begin
  FnrListaPreco := Value;
end;

procedure TCliente.SetnrPrazoCliente(const Value: Integer);
begin
  FnrPrazoCliente := Value;
end;

procedure TCliente.setnrPrazoMaximoPedido(const Value: Integer);
begin
  FnrPrazoMaximoPedido := Value;
end;

procedure TCliente.SetnrQuantidadeCotacao(const Value: integer);
begin
  FnrQuantidadeCotacao := Value;
end;

procedure TCliente.SetnrQuantidadeItemCotacao(const Value: integer);
begin
  FnrQuantidadeItemCotacao := Value;
end;

procedure TCliente.SetnrQuantidadepedidoDia(const Value: Integer);
begin
  FnrQuantidadepedidoDia := Value;
end;

procedure TCliente.SetnrRoteiro(const Value: Integer);
begin
  FnrRoteiro := Value;
end;

procedure TCliente.SetnrSubClassificaoCliente(const Value: Integer);
begin
  FnrSubClassificaoCliente := Value;
end;

procedure TCliente.setnrTelefoneRepresentante(const Value: String);
begin
  FnrTelefoneRepresentante := Value;
end;

procedure TCliente.SetnrTipoCliente(const Value: Integer);
begin
  FnrTipoCliente := Value;
end;

procedure TCliente.SetnrTipoEmpresa(const Value: Integer);
begin
  FnrTipoEmpresa := Value;
end;

procedure TCliente.SetnrTipoTributacao(const Value: Integer);
begin
  FnrTipoTributacao := Value;
end;

procedure TCliente.SetnrTransportador(const Value: Integer);
begin
  FnrTransportador := Value;
end;

procedure TCliente.SetnrVendedor(const Value: Integer);
begin
  FnrVendedor := Value;
end;

procedure TCliente.SetpcDesconto(const Value: Double);
begin
  FpcDesconto := Value;
end;

procedure TCliente.SetpcDespesasVariaveis(const Value: Double);
begin
  FpcDespesasVariaveis := Value;
end;

procedure TCliente.SetvlLimiteCompra(const Value: Double);
begin
  FvlLimiteCompra := Value;
end;

procedure TCliente.SetvlPedidoMinimo(const Value: Double);
begin
  FvlPedidoMinimo := Value;
end;

procedure TCliente.SetvlPrimeiroPedido(const Value: Double);
begin
  FvlPrimeiroPedido := Value;
end;

procedure TCliente.SetvlSaldoCliente(const Value: Double);
begin
  FvlSaldoCliente := Value;
end;

procedure TCliente.SetvlSegundoPedido(const Value: Double);
begin
  FvlSegundoPedido := Value;
end;






procedure TClienteAtivo.SetcdOPeradorLogistico(const Value: Integer);
begin
  FcdOPeradorLogistico := Value;
end;

procedure TClienteAtivo.SetcdResposavelOperador(const Value: Integer);
begin
  FcdResposavelOperador := Value;
end;

procedure TClienteAtivo.SetidAtivo(const Value: String);
begin
  FidAtivo := Value;
end;

procedure TClienteAtivo.SetnrCDEstoque(const Value: Integer);
begin
  FnrCDEstoque := Value;
end;

procedure TClienteAtivo.SetnrCliente(const Value: Integer);
begin
  FnrCliente := Value;
end;

procedure TClienteAtivo.SetnrPrazoMaximoPedido(const Value: Integer);
begin
  FnrPrazoMaximoPedido := Value;
end;

procedure TClienteAtivo.SetvlPedidoMinimo(const Value: Double);
begin
  FvlPedidoMinimo := Value;
end;


function GetRepresentante(PnrVendedor:Integer):TDadosRepresentante;
var
  tempQuery : TSQLQuery;
  _cdsTemp  : TClientDataSet;
begin
  tempQuery := nil;
  try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT NOMV_V,NR_TELEFONE_CONTATO');
    tempQuery.SQL.Add('FROM PRDDM.DCVEN,PRDDM.DCPES');
    tempQuery.SQL.Add('WHERE CGCP_P=CGCP_V');
    tempQuery.SQL.Add('AND NROV_V =:PnrVendedor');
    tempQuery.ParamByName('PnrVendedor').AsInteger:=PnrVendedor;
    tempQuery.open;
    result.nmRepresentante:= 'Representante N?o Cadastrado';
    result.nrTelefone     := '';
    if not tempQuery.IsEmpty then
    begin
        result.nmRepresentante:= tempQuery.FieldByName('NOMV_V').AsString;
        result.nrTelefone     := tempQuery.FieldByName('NR_TELEFONE_CONTATO').AsString;
    end;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

function GetRepresentanteUQM(PnrVendedor,PnrFornecedor:Integer):TDadosRepresentante;
var
  tempQuery : TSQLQuery;
  _cdsTemp  : TClientDataSet;
begin
  tempQuery := nil;
  try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('select');
    tempQuery.SQL.Add('distinct  LABM_X, NROC_X, NROV_X, NOMS_S');
    tempQuery.SQL.Add('from');
    tempQuery.SQL.Add('PRDDM.DCLCS,PRDDM.DCLSE');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('NROV_X = NROS_S');
    tempQuery.SQL.Add('AND NROC_X  =:PnrCliente');
    tempQuery.SQL.Add('AND LABM_X  =:PnrLaboratorio');
    tempQuery.ParamByName('PnrCliente').AsInteger:=PnrVendedor;
    tempQuery.ParamByName('PnrLaboratorio').AsInteger:=PnrFornecedor;
    tempQuery.open;
    result.nmRepresentante:= 'Representante N?o Cadastrado';
    result.nrTelefone     := '';
    if not tempQuery.IsEmpty then
    begin
        result.nmRepresentante:= tempQuery.FieldByName('NOMS_S').AsString;
        result.nrTelefone     := '';
    end;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;




function GetTipoRede(PidTipoRede:String;PnrRede:Integer):TRedeCliente;
var
  RedeCliente : TRedeCliente;
  qryTemp : TSQLQuery;
begin
   qryTemp:= TSQLQuery.Create(NIL);
   qryTemp.SQLConnection:=_dm._conexao;
   RedeCliente:=TRedeCliente.Create;
   with qryTemp do
   begin
     Close;
     sql.Add('SELECT NROT_T,NOMT_T');
     sql.Add('FROM');
     sql.Add('PRDDM.DCTAB');
     sql.Add('WHERE');
     sql.Add('TIPT_T=:PidTipoRede');
     sql.Add('AND NROT_T= :PnrTipoCliente');
     ParamByName('PidTipoRede').AsString:=PidTipoRede;
     ParamByName('PnrTipoCliente').AsInteger:=PnrRede;
     open;
   end;

   RedeCliente.nrRede:=PnrRede;
   RedeCliente.idTipoRede:=PidTipoRede;
   RedeCliente.nmRede:='';
   if not qryTemp.IsEmpty then
   begin
    RedeCliente.nrRede:=PnrRede;
    RedeCliente.idTipoRede:=PidTipoRede;
    RedeCliente.nmRede:=qryTemp.fieldByName('NOMT_T').AsString;
   end;
   Result:=RedeCliente;
 end;



{ TRedeCliente }

procedure TRedeCliente.SetidTipoRede(const Value: String);
begin
  FidTipoRede := Value;
end;

procedure TRedeCliente.SetnmRede(const Value: String);
begin
  FnmRede := Value;
end;

procedure TRedeCliente.SetnrRede(const Value: Integer);
begin
  FnrRede := Value;
end;

end.
