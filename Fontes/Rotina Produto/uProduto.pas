unit uProduto;

interface

uses SysUtils, Math, SqlExpr, DB, uDm, uRotinasGenericas,Classes;

type
  TParamentroLaboratorio = Record
    idForcaRepasse, idIpiLiquidoComRepasse, idIpiLiquidoSemRepasse,
      idIpiBrutoComRepasse, idIpiBrutoSemRepasse: char;

  end;

type
  TParamentroFornecedor = Class(TObject)
  private
    FidIpiBrutoComRepasse: char;
    FidForcaRepasse: char;
    FidIpiLiquidoSemRepasse: char;
    FidIpiLiquidoComRepasse: char;
    FidIpiBrutoSemRepasse: char;
    FidIcmDestacado: char;
    FidReduzIcms: char;
    FdsNomeFantasia: String;
    FdsUnidadeFederacao: String;
    FdtAgenda: TDate;
    FnrGrupoFornecedor: Integer;
    FnrPrazoPedido: Integer;
    FcdFornecedorPai: Integer;
    FnrFornecedor: Integer;
    FdsRazaoSocial: String;
    FdsDiasPedido: String;
    FnrDiasLeadTime: Integer;
    FstCNPJ: String;
    procedure SetidForcaRepasse(const Value: char);
    procedure SetidIpiBrutoComRepasse(const Value: char);
    procedure SetidIpiBrutoSemRepasse(const Value: char);
    procedure SetidIpiLiquidoComRepasse(const Value: char);
    procedure SetidIpiLiquidoSemRepasse(const Value: char);
    procedure SetidIcmDestacado(const Value: char);
    procedure SetidReduzIcms(const Value: char);
    procedure SetcdFornecedorPai(const Value: Integer);
    procedure SetdsDiasPedido(const Value: String);
    procedure SetdsNomeFantasia(const Value: String);
    procedure SetdsRazaoSocial(const Value: String);
    procedure SetdsUnidadeFederacao(const Value: String);
    procedure SetdtAgenda(const Value: TDate);
    procedure SetnrFornecedor(const Value: Integer);
    procedure SetnrGrupoFornecedor(const Value: Integer);
    procedure SetnrPrazoPedido(const Value: Integer);
    procedure SetnrDiasLeadTime(const Value: Integer);
    procedure SetstCNPJ(const Value: String);
  public
    property idForcaRepasse: char read FidForcaRepasse write SetidForcaRepasse;
    property idIpiLiquidoComRepasse: char read FidIpiLiquidoComRepasse
      write SetidIpiLiquidoComRepasse;
    property idIpiLiquidoSemRepasse: char read FidIpiLiquidoSemRepasse
      write SetidIpiLiquidoSemRepasse;
    property idIpiBrutoComRepasse: char read FidIpiBrutoComRepasse
      write SetidIpiBrutoComRepasse;
    property idIpiBrutoSemRepasse: char read FidIpiBrutoSemRepasse
      write SetidIpiBrutoSemRepasse;
    property idIcmDestacado: char read FidIcmDestacado write SetidIcmDestacado;
    property idReduzIcms: char read FidReduzIcms write SetidReduzIcms;
    property dsRazaoSocial: String read FdsRazaoSocial write SetdsRazaoSocial;
    property dsNomeFantasia: String read FdsNomeFantasia
      write SetdsNomeFantasia;
    property dsUnidadeFederacao: String read FdsUnidadeFederacao
      write SetdsUnidadeFederacao;
    property dsDiasPedido: String read FdsDiasPedido write SetdsDiasPedido;
    property stCNPJ: String read FstCNPJ write SetstCNPJ;
    property nrFornecedor: Integer read FnrFornecedor write SetnrFornecedor;
    property cdFornecedorPai: Integer read FcdFornecedorPai
      write SetcdFornecedorPai;
    property nrPrazoPedido: Integer read FnrPrazoPedido write SetnrPrazoPedido;
    property nrGrupoFornecedor: Integer read FnrGrupoFornecedor
      write SetnrGrupoFornecedor;
    property dtAgenda: TDate read FdtAgenda write SetdtAgenda;
    property nrDiasLeadTime: Integer read FnrDiasLeadTime
      write SetnrDiasLeadTime;



    // idPisConfins

  protected

  end;

type
  TEstoqueMercadoria = Class(TObject)
  private
    FnrQuantidadeBloqueado: Integer;
    FnrQuantidadeFisico: Integer;
    FnrReservaProblematica: Integer;
    FnrQuantidadePedido: Integer;
    FnrQuantidadeVencido: Integer;
    FnrQuantidadeReserva: Integer;
    FnrQuantidadeEstoque: Integer;
    FidSituacaoEstoque: String;
    procedure SetnrQuantidadeBloqueado(const Value: Integer);
    procedure SetnrQuantidadeFisico(const Value: Integer);
    procedure SetnrQuantidadePedido(const Value: Integer);
    procedure SetnrQuantidadeReserva(const Value: Integer);
    procedure SetnrQuantidadeVencido(const Value: Integer);
    procedure SetnrReservaProblematica(const Value: Integer);
    procedure SetnrQuantidadeEstoque(const Value: Integer);
    procedure SetidSituacaoEstoque(const Value: String);
  public
    property nrQuantidadeFisico: Integer Read FnrQuantidadeFisico
      Write SetnrQuantidadeFisico;
    property nrQuantidadeReserva: Integer Read FnrQuantidadeReserva
      Write SetnrQuantidadeReserva;
    property nrReservaProblematica: Integer read FnrReservaProblematica
      write SetnrReservaProblematica;
    property nrQuantidadeVencido: Integer read FnrQuantidadeVencido
      write SetnrQuantidadeVencido;
    property nrQuantidadeBloqueado: Integer read FnrQuantidadeBloqueado
      write SetnrQuantidadeBloqueado;
    property nrQuantidadePedido: Integer Read FnrQuantidadePedido
      Write SetnrQuantidadePedido;
    property nrQuantidadeEstoque: Integer Read FnrQuantidadeEstoque
      Write SetnrQuantidadeEstoque;
    property idSituacaoEstoque: String Read FidSituacaoEstoque
      Write SetidSituacaoEstoque;


  protected
  end;

type
  TValorEstoqueMercadoria = Class(TObject)
  private
    FvtCustoFinanceiroMercadoria: Double;
    FvtCustoGerencialMercadoria: Double;
    FvtCustoFinanceiroUnitarioMercadoria: Double;
    FvlPrecoCompraMercadoria: Double;
    FvlPrecoVendaMercadoria: Double;
    procedure SetvtCustoFinanceiroMercadoria(const Value: Double);
    procedure SetvtCustoFinanceiroUnitarioMercadoria(const Value: Double);
    procedure SetvtCustoGerencialMercadoria(const Value: Double);
    procedure SetvlPrecoCompraMercadoria(const Value: Double);
    procedure SetvlPrecoVendaMercadoria(const Value: Double);
  public
    property vtCustoFinanceiroMercadoria: Double
      Read FvtCustoFinanceiroMercadoria Write SetvtCustoFinanceiroMercadoria;
    property vtCustoGerencialMercadoria: Double Read FvtCustoGerencialMercadoria
      Write SetvtCustoGerencialMercadoria;
    property vtCustoFinanceiroUnitarioMercadoria: Double
      Read FvtCustoFinanceiroUnitarioMercadoria
      Write SetvtCustoFinanceiroUnitarioMercadoria;
    property vlPrecoCompraMercadoria: Double Read FvlPrecoCompraMercadoria
      Write SetvlPrecoCompraMercadoria;
    property vlPrecoVendaMercadoria: Double Read FvlPrecoVendaMercadoria
      Write SetvlPrecoVendaMercadoria;

  protected
  end;

type
  TDadosFornecedor = Class(TObject)
  private
    FnrPrazoPedido: Integer;
    FidUnidadeFederacao: String;
    FnrGrupoLaboratorio: Integer;
    FidIcmDestacado: char;
    FdsDiasPedido: String;
    FdtAgendaFornecedor: TDate;
    FidIpiBrutoComRepasse: char;
    FdsNomeFantasia: String;
    FdsUnidadeFederacao: String;
    FnrDiasLeadTime: Integer;
    FdtAgenda: TDate;
    FnrGrupoFornecedor: Integer;
    FidForcaRepasse: char;
    FcdFornecedorPai: Integer;
    FnrFornecedor: Integer;
    FidIpiLiquidoSemRepasse: char;
    FidReduzIcms: char;
    FidIpiLiquidoComRepasse: char;
    FstCNPJ: String;
    FdsRazaoSocial: String;
    FidIpiBrutoSemRepasse: char;
    FpcGeracaoVerba: Double;
    FnrGeracaoVerba: Integer;
    FdsGrupoFornecedor: string;
    FnrComprador: Integer;

    procedure SetdsDiasPedido(const Value: String);
    procedure SetdtAgendaFornecedor(const Value: TDate);
    procedure SetidIcmDestacado(const Value: char);
    procedure SetidUnidadeFederacao(const Value: String);
    procedure SetnrPrazoPedido(const Value: Integer);
    procedure SetcdFornecedorPai(const Value: Integer);
    procedure SetdsNomeFantasia(const Value: String);
    procedure SetdsRazaoSocial(const Value: String);
    procedure SetdsUnidadeFederacao(const Value: String);
    procedure SetdtAgenda(const Value: TDate);
    procedure SetidForcaRepasse(const Value: char);
    procedure SetidIpiBrutoComRepasse(const Value: char);
    procedure SetidIpiBrutoSemRepasse(const Value: char);
    procedure SetidIpiLiquidoComRepasse(const Value: char);
    procedure SetidIpiLiquidoSemRepasse(const Value: char);
    procedure SetidReduzIcms(const Value: char);
    procedure SetnrDiasLeadTime(const Value: Integer);
    procedure SetnrFornecedor(const Value: Integer);
    procedure SetnrGrupoFornecedor(const Value: Integer);
    procedure SetstCNPJ(const Value: String);
    procedure SetpcGeracaoVerba(const Value: Double);
    procedure SetnrGeracaoVerba(const Value: Integer);
    procedure SetdsGrupoFornecedor(const Value: String);
    procedure SetnrComprador(const Value: Integer);
  public
    property nrPrazoPedido: Integer Read FnrPrazoPedido Write SetnrPrazoPedido;
    property nrGrupoLaboratorio: Integer Read FnrGrupoLaboratorio   Write SetnrPrazoPedido;
    property dtAgendaFornecedor: TDate read FdtAgendaFornecedor    write SetdtAgendaFornecedor;
    property idUnidadeFederacao: String read FidUnidadeFederacao    write SetidUnidadeFederacao;
    property dsDiasPedido: String read FdsDiasPedido write SetdsDiasPedido;
    property idIcmDestacado: char read FidIcmDestacado write SetidIcmDestacado;
    property idForcaRepasse: char read FidForcaRepasse write SetidForcaRepasse;
    property idIpiLiquidoComRepasse: char read FidIpiLiquidoComRepasse    write SetidIpiLiquidoComRepasse;
    property idIpiLiquidoSemRepasse: char read FidIpiLiquidoSemRepasse    write SetidIpiLiquidoSemRepasse;
    property idIpiBrutoComRepasse: char read FidIpiBrutoComRepasse      write SetidIpiBrutoComRepasse;
    property idIpiBrutoSemRepasse: char read FidIpiBrutoSemRepasse    write SetidIpiBrutoSemRepasse;
    property idReduzIcms: char read FidReduzIcms write SetidReduzIcms;
    property dsRazaoSocial: String read FdsRazaoSocial write SetdsRazaoSocial;
    property dsNomeFantasia: String read FdsNomeFantasia    write SetdsNomeFantasia;
    property dsUnidadeFederacao: String read FdsUnidadeFederacao   write SetdsUnidadeFederacao;
    property stCNPJ: String read FstCNPJ write SetstCNPJ;
    property nrFornecedor: Integer read FnrFornecedor write SetnrFornecedor;
    property cdFornecedorPai: Integer read FcdFornecedorPai write SetcdFornecedorPai;
    property nrGrupoFornecedor: Integer read FnrGrupoFornecedor   write SetnrGrupoFornecedor;
    property dtAgenda: TDate read FdtAgenda write SetdtAgenda;
    property nrDiasLeadTime: Integer read FnrDiasLeadTime    write SetnrDiasLeadTime;
    property pcGeracaoVerba : Double read FpcGeracaoVerba   write SetpcGeracaoVerba;
    property nrGeracaoVerba : Integer read FnrGeracaoVerba   write SetnrGeracaoVerba;
    property dsGrupoFornecedor: String read FdsGrupoFornecedor write SetdsGrupoFornecedor;
    property nrComprador : Integer read FnrComprador   write SetnrComprador;


  protected
  end;

type
  TMercadoria = Class(TObject)
  private
    FpcRepasseCompra: Double;
    FpcDescontoPadrao: Double;
    FidCurva: char;
    FvlPrecoCadastro: Double;
    FcdProduto: Integer;
    FnmProduto: String;
    FdsApresentacao: String;
    FdgProduto: Integer;
    FnrProduto: Integer;
    FqtEstoque: Integer;
    FqtMetroCubico: Double;
    FqtEmbalagemCompra: Integer;
    FqtdCaixaCamada: Integer;
    FqtdCaixaPalete: Integer;
    FdtUltimaEntrada: TDateTime;
    FdtUltimaSaida: TDateTime;
    FidTipoListaFiscal: char;
    FidSuperfulo: char;
    FpcCreditoICMS: Double;
    FnrUnidadeBloqueada: Integer;
    FnrUnidadesVencidas: Integer;
    FnrReservadaProblematica: Integer;
    FnrUnidadeReservaPedido: Integer;
    FnmProdutoCompleto: String;
    FnrLaboratorio: Integer;
    FidForcaRepasse: char;
    FidIpiBrutoComRepasse: char;
    FidIpiLiquidoSemRepasse: char;
    FidIpiLiquidoComRepasse: char;
    FidIpiBrutoSemRepasse: char;
    FidIcmDestacado: char;
    FidPisCofins: char;
    FidReduzIcms: char;
    FidPis: char;
    FidCofins: char;
    FpcIpiProduto: Double;
    FnrTipoProduto: Integer;
    FvlFinanceiroEstoque: Double;
    FqtEstoqueFISICO: Integer;
    FdsTipoApresentacao: String;
    FdsFinalidade: String;
    FidCipado: char;
    FdsRazaoSocialFornecedor: String;
    FdtAgendaFornecedor: TDateTime;
    FdsFantasiaFornecedor: String;
    FcdInternoFornecedor: String;
    FdsLocalizacao: String;
    FdtAtualizacaoPreco: TDateTime;
    FdsUndidadeFederacaoFornecedor: String;
    FnrEmpresaProduto: Integer;
    FidSituacaoMercadoriaCompra: char;
    FidSituacaoMercadoriaEstoque: char;
    FvlPrecoVenda: Double;
    FvlPrecoCompra: Double;
    FvlPrecoCompraAnterior: Double;
    FvlPrecoVendaAnterior: Double;
    FqtEmbalagemVenda: Integer;
    FidRepasseIcms: char;
    FidRetemICMS: char;
    FdsUnidadeMedia: String;
    FpcGeracaoVerba: Double;
    FnrGeracaoVerba: Integer;
    FnrComprador: Integer;
    FidCrossdocking: String;
    FcdEmpresaCrossdocking: Integer;
    FnrCrossdockingwrite: Integer;
    FvlCustoGerencial: Double;
    procedure SetpcRepasseCompra(const Value: Double);
    procedure SetpcDescontoPadrao(const Value: Double);
    procedure SetidCurva(const Value: char);
    procedure SetvlPrecoCadastro(const Value: Double);
    procedure SetcdProduto(const Value: Integer);
    procedure SetnmProduto(const Value: String);
    procedure SetdgProduto(const Value: Integer);
    procedure SetdsApresentacao(const Value: String);
    procedure SetnrProduto(const Value: Integer);
    procedure SetqtEstoque(const Value: Integer);
    procedure SetqtMetroCubico(const Value: Double);
    procedure SetqtEmbalagemCompra(const Value: Integer);
    procedure SetqtdCaixaCamada(const Value: Integer);
    procedure SetqtdCaixaPalete(const Value: Integer);
    procedure SetdtUltimaEntrada(const Value: TDateTime);
    procedure SetdtUltimaSaida(const Value: TDateTime);
    procedure SetidTipoListaFiscal(const Value: char);
    procedure SetidSuperfulo(const Value: char);
    procedure SetpcCreditoICMS(const Value: Double);
    procedure SetnrReservadaProblematica(const Value: Integer);
    procedure SetnrUnidadeBloqueada(const Value: Integer);
    procedure SetnrUnidadeReservaPedido(const Value: Integer);
    procedure SetnrUnidadesVencidas(const Value: Integer);
    procedure SetnmProdutoCompleto(const Value: String);
    procedure SetnrLaboratorio(const Value: Integer);
    procedure SetidForcaRepasse(const Value: char);
    procedure SetidIpiBrutoComRepasse(const Value: char);
    procedure SetidIpiBrutoSemRepasse(const Value: char);
    procedure SetidIpiLiquidoComRepasse(const Value: char);
    procedure SetidIpiLiquidoSemComRepasse(const Value: char);
    procedure SetidIcmDestacado(const Value: char);
    procedure SetidPisCofins(const Value: char);
    procedure SetidReduzIcms(const Value: char);
    procedure SetidCofins(const Value: char);
    procedure SetidPis(const Value: char);
    procedure SetpcIpiProduto(const Value: Double);
    procedure SetnrTipoProduto(const Value: Integer);
    procedure SetvlFinanceiroEstoque(const Value: Double);
    procedure SetqtEstoqueFISICO(const Value: Integer);
    procedure SetdsTipoApresentacao(const Value: String);
    procedure SetdsFinalidade(const Value: String);
    procedure SetidCipado(const Value: char);
    procedure SetdsFantasiaFornecedor(const Value: String);
    procedure SetdsRazaoSocialFornecedor(const Value: String);
    procedure SetdtAgendaFornecedor(const Value: TDateTime);
    procedure SetcdInternoFornecedor(const Value: String);
    procedure SetdsLocalizacao(const Value: String);
    procedure SetdtAtualizacaoPreco(const Value: TDateTime);
    procedure SetdsUndidadeFederacaoFornecedor(const Value: String);
    procedure SetnrEmpresaProduto(const Value: Integer);
    procedure SetidSituacaoMercadoriaCompra(const Value: char);
    procedure SetidSituacaoMercadoriaEstoque(const Value: char);
    procedure SetvlPrecoCompra(const Value: Double);
    procedure SetvlPrecoVenda(const Value: Double);
    procedure SetvlPrecoCompraAnterior(const Value: Double);
    procedure SetvlPrecoVendaAnterior(const Value: Double);
    procedure SetqtEmbalagemVenda(const Value: Integer);
    procedure SetidRepasseIcms(const Value: char);
    procedure SetidRetemICMS(const Value: char);
    procedure SetdsUnidadeMedia(const Value: String);
    procedure SetpcGeracaoVerba(const Value: Double);
    procedure SetnrGeracaoVerba(const Value: Integer);
    procedure SetnrComprador(const Value: Integer);
    procedure SetidCrossdocking(const Value: String);
    procedure SetcdEmpresaCrossdocking(const Value: Integer);
    procedure SetnrCrossdocking(const Value: Integer);
    procedure SetvlCustoGerencial(const Value: Double);

  public

    property cdProduto: Integer read FcdProduto write SetcdProduto;
    property nrProduto: Integer read FnrProduto write SetnrProduto;
    property dgProduto: Integer read FdgProduto write SetdgProduto;
    property qtEstoque: Integer read FqtEstoque write SetqtEstoque;
    property qtEmbalagemCompra: Integer read FqtEmbalagemCompra write SetqtEmbalagemCompra;
    property qtEmbalagemVenda : Integer read FqtEmbalagemVenda write SetqtEmbalagemVenda;
    property nrEmpresaProduto :Integer read FnrEmpresaProduto write SetnrEmpresaProduto;
    property nrLaboratorio: Integer read FnrLaboratorio write SetnrLaboratorio;
    property nrUnidadesVencidas: Integer read FnrUnidadesVencidas  write SetnrUnidadesVencidas;
    property nrReservaProblematica: Integer read FnrReservadaProblematica write SetnrReservadaProblematica;
    property nrUnidadeReservaPedido: Integer read FnrUnidadeReservaPedido   write SetnrUnidadeReservaPedido;
    property nrUnidadeBloqueada: Integer read FnrUnidadeBloqueada            write SetnrUnidadeBloqueada;
    property qtdCaixaPalete: Integer read FqtdCaixaPalete     write SetqtdCaixaPalete;
    property qtdCaixaCamada: Integer read FqtdCaixaCamada     write SetqtdCaixaCamada;
    property nrTipoProduto: Integer read FnrTipoProduto write SetnrTipoProduto;
    property qtEstoqueFISICO: Integer read FqtEstoqueFISICO write SetqtEstoqueFISICO;
    property vlFinanceiroEstoque: Double read FvlFinanceiroEstoque    write SetvlFinanceiroEstoque;
    property qtMetroCubico: Double read FqtMetroCubico write SetqtMetroCubico;
    property pcRepasseCompra: Double read FpcRepasseCompra    write SetpcRepasseCompra;
    property pcDescontoPadrao: Double read FpcDescontoPadrao     write SetpcDescontoPadrao;
    property pcIpiProduto: Double read FpcIpiProduto write SetpcIpiProduto;
    property pcCreditoICMS: Double read FpcCreditoICMS write SetpcCreditoICMS;
    property vlPrecoCadastro: Double read FvlPrecoCadastro    write SetvlPrecoCadastro;
    property vlPrecoCompra: Double read FvlPrecoCompra write SetvlPrecoCompra;
    property vlPrecoVenda: Double read FvlPrecoVenda write SetvlPrecoVenda;
    property vlPrecoCompraAnterior: Double read FvlPrecoCompraAnterior write SetvlPrecoCompraAnterior;
    property vlPrecoVendaAnterior: Double read FvlPrecoVendaAnterior write SetvlPrecoVendaAnterior;
    property vlCustoGerencial: Double read FvlCustoGerencial write SetvlCustoGerencial;


    property idCurva: char read FidCurva write SetidCurva;
    property nmProduto: String read FnmProduto write SetnmProduto;
    property nmProdutoCompleto: String read FnmProduto write SetnmProduto;
    property dsApresentacao: String read FdsApresentacao   write SetdsApresentacao;
    property dsTipoApresentacao: String read FdsTipoApresentacao    write SetdsTipoApresentacao;
    property dsFinalidade: String read FdsFinalidade write SetdsFinalidade;
    property dsRazaoSocialFornecedor: String read FdsRazaoSocialFornecedor    write SetdsRazaoSocialFornecedor;
    property dsUndidadeFederacaoFornecedor: String read FdsUndidadeFederacaoFornecedor   write SetdsUndidadeFederacaoFornecedor;
    property dsFantasiaFornecedor: String read FdsFantasiaFornecedor   write SetdsFantasiaFornecedor;
    property cdInternoFornecedor: String read FcdInternoFornecedor  write SetcdInternoFornecedor;

    property idCrossdocking: String read FidCrossdocking  write SetidCrossdocking;
    property dtUltimaSaida: TDateTime read FdtUltimaSaida  write SetdtUltimaSaida;
    property dtUltimaEntrada: TDateTime read FdtUltimaEntrada    write SetdtUltimaEntrada;
    property dtAgendaFornecedor: TDateTime read FdtAgendaFornecedor    write SetdtAgendaFornecedor;
    property dtAtualizacaoPreco: TDateTime read FdtAtualizacaoPreco write SetdtAtualizacaoPreco;
    property idTipoListaFiscal: char read FidTipoListaFiscal    write SetidTipoListaFiscal;
    property idSuperfulo: char read FidSuperfulo write SetidSuperfulo;
    property idCipado: char read FidCipado write SetidCipado;
    property idRepasseIcms: char read FidRepasseIcms write SetidRepasseIcms;

    property idForcaRepasse: char read FidForcaRepasse write SetidForcaRepasse;
    property idIpiLiquidoComRepasse: char read FidIpiLiquidoComRepasse   write SetidIpiLiquidoComRepasse;
    property idIpiLiquidoSemRepasse: char read FidIpiLiquidoSemRepasse   write SetidIpiLiquidoSemComRepasse;
    property idIpiBrutoComRepasse: char read FidIpiBrutoComRepasse   write SetidIpiBrutoComRepasse;
    property idIpiBrutoSemRepasse: char read FidIpiBrutoSemRepasse write SetidIpiBrutoSemRepasse;

    property idIcmDestacado: char read FidIcmDestacado write SetidIcmDestacado;
    property idReduzIcms: char read FidReduzIcms write SetidReduzIcms;
    property idPisCofins: char read FidPisCofins write SetidPisCofins;
    property idCofins: char read FidCofins write SetidCofins;
    property idRetemICMS: char read FidRetemICMS write SetidRetemICMS;
    property idPis: char read FidPis write SetidPis;
    property dsLocalizacao: String read FdsLocalizacao write SetdsLocalizacao;
    property dsUnidadeMedia: String read FdsUnidadeMedia write SetdsUnidadeMedia;
    property idSituacaoMercadoriaCompra: char read FidSituacaoMercadoriaCompra write SetidSituacaoMercadoriaCompra;
    property idSituacaoMercadoriaEstoque: char read FidSituacaoMercadoriaEstoque write SetidSituacaoMercadoriaEstoque;
    property pcGeracaoVerba             : Double read FpcGeracaoVerba write SetpcGeracaoVerba;
    property nrGeracaoVerba             : Integer read FnrGeracaoVerba write SetnrGeracaoVerba;
    property nrComprador                : Integer read FnrComprador write SetnrComprador;
    property cdEmpresaCrossdocking      : Integer read FcdEmpresaCrossdocking write SetcdEmpresaCrossdocking;
    property nrCrossdocking             : Integer read FnrCrossdockingwrite write SetnrCrossdocking;



  protected
  End;

Function GetEspecealidade(nrEspecealidade: Integer): String;
Function GetQuantidadeEmbalagem(nrProduto: Integer): Integer;
Function GetMercadoriaNova(PnrProduto,
                           PnrDigito,
                           PnrFornecedor,
                           PcdEmpresa,
                           PcdOperadorLogistico: Integer;
                           PcdEan:String): TMercadoria;

function GetParamentroLaboratorio(nrLaboratorio: Integer): TParamentroFornecedor;
Function GetEstoque(nrProduto, nrEmpresa: Integer): TEstoqueMercadoria;
function GetDadosLaboratorio(nrFornecedor: Integer): TDadosFornecedor;
function GetValorFinanceiroEstoque(nrProduto, nrEmpresa: Integer): TValorEstoqueMercadoria;
function GetPcProdutosOl(PnrOPerador,PnrProduto,PnrEmpresa: Integer):Double;
function GetDadosLaboratorioCNPJ(PnrFornecedor: Integer;PnrCNPJ:String): TDadosFornecedor;



// Function GetParamentroLaboratorio(nrLaboratorio: Integer): Boolean;

implementation

var
  SetParamento: TParamentroFornecedor;

  { TMercadoria }

procedure TMercadoria.SetcdEmpresaCrossdocking(const Value: Integer);
begin
  FcdEmpresaCrossdocking := Value;
end;

procedure TMercadoria.SetcdInternoFornecedor(const Value: String);
begin
  FcdInternoFornecedor := Value;
end;

procedure TMercadoria.SetcdProduto(const Value: Integer);
begin
  FcdProduto := Value;
end;

procedure TMercadoria.SetdgProduto(const Value: Integer);
begin
  FdgProduto := Value;
end;

procedure TMercadoria.SetdsApresentacao(const Value: String);
begin
  FdsApresentacao := Value;
end;

procedure TMercadoria.SetdsFantasiaFornecedor(const Value: String);
begin
  FdsFantasiaFornecedor := Value;
end;

procedure TMercadoria.SetdsFinalidade(const Value: String);
begin
  FdsFinalidade := Value;
end;

procedure TMercadoria.SetdsLocalizacao(const Value: String);
begin
  FdsLocalizacao := Value;
end;

procedure TMercadoria.SetdsRazaoSocialFornecedor(const Value: String);
begin
  FdsRazaoSocialFornecedor := Value;
end;

procedure TMercadoria.SetdsTipoApresentacao(const Value: String);
begin
  FdsTipoApresentacao := Value;
end;

procedure TMercadoria.SetdsUndidadeFederacaoFornecedor(const Value: String);
begin
  FdsUndidadeFederacaoFornecedor := Value;
end;

procedure TMercadoria.SetdsUnidadeMedia(const Value: String);
begin
  FdsUnidadeMedia := Value;
end;

procedure TMercadoria.SetdtAgendaFornecedor(const Value: TDateTime);
begin
  FdtAgendaFornecedor := Value;
end;

procedure TMercadoria.SetdtAtualizacaoPreco(const Value: TDateTime);
begin
  FdtAtualizacaoPreco := Value;
end;

procedure TMercadoria.SetdtUltimaEntrada(const Value: TDateTime);
begin
  FdtUltimaEntrada := Value;
end;

procedure TMercadoria.SetdtUltimaSaida(const Value: TDateTime);
begin
  FdtUltimaSaida := Value;
end;

procedure TMercadoria.SetidCipado(const Value: char);
begin
  FidCipado := Value;
end;

procedure TMercadoria.SetidCofins(const Value: char);
begin
  FidCofins := Value;
end;

procedure TMercadoria.SetidCrossdocking(const Value: String);
begin
  FidCrossdocking := Value;
end;

procedure TMercadoria.SetidCurva(const Value: char);
begin
  FidCurva := Value;
end;

procedure TMercadoria.SetidForcaRepasse(const Value: char);
begin
  FidForcaRepasse := Value;
end;

procedure TMercadoria.SetidIcmDestacado(const Value: char);
begin
  FidIcmDestacado := Value;
end;

procedure TMercadoria.SetidIpiBrutoComRepasse(const Value: char);
begin
  FidIpiBrutoComRepasse := Value;
end;

procedure TMercadoria.SetidIpiBrutoSemRepasse(const Value: char);
begin
  FidIpiBrutoSemRepasse := Value;
end;

procedure TMercadoria.SetidIpiLiquidoComRepasse(const Value: char);
begin
  FidIpiLiquidoComRepasse := Value;
end;

procedure TMercadoria.SetidIpiLiquidoSemComRepasse(const Value: char);
begin
  FidIpiLiquidoSemRepasse := Value;
end;

procedure TMercadoria.SetidPis(const Value: char);
begin
  FidPis := Value;
end;

procedure TMercadoria.SetidPisCofins(const Value: char);
begin
  FidPisCofins := Value;
end;

procedure TMercadoria.SetidReduzIcms(const Value: char);
begin
  FidReduzIcms := Value;
end;

procedure TMercadoria.SetidRepasseIcms(const Value: char);
begin
  FidRepasseIcms := Value;
end;

procedure TMercadoria.SetidRetemICMS(const Value: char);
begin
  FidRetemICMS := Value;
end;

procedure TMercadoria.SetidSituacaoMercadoriaCompra(const Value: char);
begin
  FidSituacaoMercadoriaCompra := Value;
end;

procedure TMercadoria.SetidSituacaoMercadoriaEstoque(const Value: char);
begin
  FidSituacaoMercadoriaEstoque := Value;
end;

procedure TMercadoria.SetidSuperfulo(const Value: char);
begin
  FidSuperfulo := Value;
end;

procedure TMercadoria.SetidTipoListaFiscal(const Value: char);
begin
  FidTipoListaFiscal := Value;
end;

procedure TMercadoria.SetnmProduto(const Value: String);
begin
  FnmProduto := Value;
end;

procedure TMercadoria.SetnmProdutoCompleto(const Value: String);
begin
  FnmProdutoCompleto := Value;
end;

procedure TMercadoria.SetnrComprador(const Value: Integer);
begin
  FnrComprador := Value;
end;

procedure TMercadoria.SetnrCrossdocking(const Value: Integer);
begin
  FnrCrossdockingwrite := Value;
end;

procedure TMercadoria.SetnrEmpresaProduto(const Value: Integer);
begin
  FnrEmpresaProduto := Value;
end;

procedure TMercadoria.SetnrGeracaoVerba(const Value: Integer);
begin
  FnrGeracaoVerba := Value;
end;

procedure TMercadoria.SetnrLaboratorio(const Value: Integer);
begin
  FnrLaboratorio := Value;
end;

procedure TMercadoria.SetnrProduto(const Value: Integer);
begin
  FnrProduto := Value;
end;

procedure TMercadoria.SetnrReservadaProblematica(const Value: Integer);
begin
  FnrReservadaProblematica := Value;
end;

procedure TMercadoria.SetnrTipoProduto(const Value: Integer);
begin
  FnrTipoProduto := Value;
end;

procedure TMercadoria.SetnrUnidadeBloqueada(const Value: Integer);
begin
  FnrUnidadeBloqueada := Value;
end;

procedure TMercadoria.SetnrUnidadeReservaPedido(const Value: Integer);
begin
  FnrUnidadeReservaPedido := Value;
end;

procedure TMercadoria.SetnrUnidadesVencidas(const Value: Integer);
begin
  FnrUnidadesVencidas := Value;
end;

procedure TMercadoria.SetpcCreditoICMS(const Value: Double);
begin
  FpcCreditoICMS := Value;
end;

procedure TMercadoria.SetpcDescontoPadrao(const Value: Double);
begin
  FpcDescontoPadrao := Value;
end;

procedure TMercadoria.SetpcGeracaoVerba(const Value: Double);
begin
  FpcGeracaoVerba := Value;
end;

procedure TMercadoria.SetpcIpiProduto(const Value: Double);
begin
  FpcIpiProduto := Value;
end;

procedure TMercadoria.SetpcRepasseCompra(const Value: Double);
begin
  FpcRepasseCompra := Value;
end;

procedure TMercadoria.SetqtdCaixaCamada(const Value: Integer);
begin
  FqtdCaixaCamada := Value;
end;

procedure TMercadoria.SetqtdCaixaPalete(const Value: Integer);
begin
  FqtdCaixaPalete := Value;
end;

procedure TMercadoria.SetqtEmbalagemCompra(const Value: Integer);
begin
  FqtEmbalagemCompra := Value;
end;

procedure TMercadoria.SetqtEmbalagemVenda(const Value: Integer);
begin
  FqtEmbalagemVenda := Value;
end;

procedure TMercadoria.SetqtEstoque(const Value: Integer);
begin
  FqtEstoque := Value;
end;

procedure TMercadoria.SetqtEstoqueFISICO(const Value: Integer);
begin
  FqtEstoqueFISICO := Value;
end;

procedure TMercadoria.SetqtMetroCubico(const Value: Double);
begin
  FqtMetroCubico := Value;
end;

procedure TMercadoria.SetvlCustoGerencial(const Value: Double);
begin
  FvlCustoGerencial := Value;
end;

procedure TMercadoria.SetvlFinanceiroEstoque(const Value: Double);
begin
  FvlFinanceiroEstoque := Value;
end;

procedure TMercadoria.SetvlPrecoCadastro(const Value: Double);
begin
  FvlPrecoCadastro := Value;
end;

procedure TMercadoria.SetvlPrecoCompra(const Value: Double);
begin
  FvlPrecoCompra := Value;
end;

procedure TMercadoria.SetvlPrecoCompraAnterior(const Value: Double);
begin
  FvlPrecoCompraAnterior := Value;
end;

procedure TMercadoria.SetvlPrecoVenda(const Value: Double);
begin
  FvlPrecoVenda := Value;
end;

procedure TMercadoria.SetvlPrecoVendaAnterior(const Value: Double);
begin
  FvlPrecoVendaAnterior := Value;
end;

Function GetEstoque(nrProduto, nrEmpresa: Integer): TEstoqueMercadoria;
var
  tempQuery: TSQLQuery;
  MercadoriaEstoque: TEstoqueMercadoria;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
    tempQuery.SQL.Add('QT_RESERVA_PROBLEMATICA, QT_VENCIDO, QT_BLOQUEADO,');
    tempQuery.SQL.Add('QT_FISICO - QT_RESERVADO-QT_RESERVA_PROBLEMATICA');
    tempQuery.SQL.Add('-QT_VENCIDO  as ESTOQUE,DT_ATUALIZACAO_ESTOQUE,');
    tempQuery.SQL.Add('EM.ID_SITUACAO_MERCADORIA,ID_INATIVACAO_FUTURA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_MERCADORIA M,');
    tempQuery.SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA EM');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('M.CD_MERCADORIA=EM.CD_MERCADORIA');
    tempQuery.SQL.Add('AND CD_EMPRESA =:PnrEMPRESA');
    tempQuery.SQL.Add('AND EM.CD_MERCADORIA=:PnrProduto');
    tempQuery.ParamByName('PnrEMPRESA').AsInteger := nrEmpresa;
    tempQuery.ParamByName('PnrProduto').AsInteger := nrProduto;
    tempQuery.Open;
    Result := nil;
    if not tempQuery.IsEmpty then
    begin
      MercadoriaEstoque := TEstoqueMercadoria.Create;
      MercadoriaEstoque.nrQuantidadeFisico    := tempQuery.FieldByName('QT_FISICO').AsInteger;
      MercadoriaEstoque.nrQuantidadeReserva   := tempQuery.FieldByName('QT_RESERVADO').AsInteger;
      MercadoriaEstoque.nrQuantidadePedido    := tempQuery.FieldByName('QT_PEDIDO').AsInteger;
      MercadoriaEstoque.nrReservaProblematica := tempQuery.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger;
      MercadoriaEstoque.nrQuantidadeVencido   := tempQuery.FieldByName('QT_VENCIDO').AsInteger;
      MercadoriaEstoque.nrQuantidadeBloqueado := tempQuery.FieldByName('QT_BLOQUEADO').AsInteger;
      MercadoriaEstoque.nrQuantidadeEstoque   := tempQuery.FieldByName('ESTOQUE').AsInteger;
      MercadoriaEstoque.idSituacaoEstoque     := tempQuery.FieldByName('ID_SITUACAO_MERCADORIA').AsString;
      Result := MercadoriaEstoque;
    end;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

Function GetValorFinanceiroEstoque(nrProduto, nrEmpresa: Integer)
  : TValorEstoqueMercadoria;
var
  tempQuery: TSQLQuery;
  ValorFinanceiroMercadoria: TValorEstoqueMercadoria;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
    tempQuery.SQL.Add('QT_RESERVA_PROBLEMATICA, QT_VENCIDO, QT_BLOQUEADO,');
    tempQuery.SQL.Add('QT_FISICO - QT_RESERVADO-QT_RESERVA_PROBLEMATICA');
    tempQuery.SQL.Add('-QT_VENCIDO  as ESTOQUE,DT_ATUALIZACAO_ESTOQUE,');
    tempQuery.SQL.Add('VT_CUSTO_FINANCEIRO_MERCADORIA,VL_CUSTO_GERENCIAL,');
    tempQuery.SQL.Add('VL_PRECO_COMPRA,VL_PRECO_VENDA,');
    tempQuery.SQL.Add('CASE');
    tempQuery.SQL.Add
      ('WHEN QT_FISICO>0 THEN ROUND(VT_CUSTO_FINANCEIRO_MERCADORIA/QT_FISICO,2)');
    tempQuery.SQL.Add('ELSE 0');
    tempQuery.SQL.Add('END VL_CUSTO_FINANCEIRO_UNITARIO');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
    tempQuery.SQL.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('FINANCEIRO.CD_EMPRESA =ESTOQUE.CD_EMPRESA');
    tempQuery.SQL.Add('AND FINANCEIRO.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    tempQuery.SQL.Add('AND FINANCEIRO.CD_EMPRESA =:PnrEMPRESA');
    tempQuery.SQL.Add('AND FINANCEIRO.CD_MERCADORIA=:PnrProduto');
    tempQuery.ParamByName('PnrEMPRESA').AsInteger := nrEmpresa;
    tempQuery.ParamByName('PnrProduto').AsInteger := nrProduto;
    tempQuery.Open;
    Result := nil;
    if not tempQuery.IsEmpty then
    begin
      ValorFinanceiroMercadoria := TValorEstoqueMercadoria.Create;
      ValorFinanceiroMercadoria.vtCustoFinanceiroMercadoria :=
        tempQuery.FieldByName('VT_CUSTO_FINANCEIRO_MERCADORIA').AsFloat;
      ValorFinanceiroMercadoria.vtCustoFinanceiroUnitarioMercadoria :=
        tempQuery.FieldByName('VL_CUSTO_FINANCEIRO_UNITARIO').AsFloat;
      ValorFinanceiroMercadoria.vtCustoGerencialMercadoria :=
        tempQuery.FieldByName('VL_CUSTO_GERENCIAL').AsFloat;
      ValorFinanceiroMercadoria.vlPrecoCompraMercadoria :=
        tempQuery.FieldByName('VL_PRECO_COMPRA').AsFloat;
      Result := ValorFinanceiroMercadoria;
    end;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

function GetMercadoriaNova(PnrProduto,
                           PnrDigito,
                           PnrFornecedor,
                           PcdEmpresa,
                           PcdOperadorLogistico: Integer;
                           PcdEan:String): TMercadoria;
var
  Mercadoria: TMercadoria;
  DadosFornecedor: TDadosFornecedor;
  QryTemp: TSQLQuery;
  stQry: TStringList;
begin
try
TRY
  if stQry<>nil then
     stQry:=nil;
  stQry :=TStringList.Create;
  QryTemp := TSQLQuery.Create(nil);
  QryTemp.SQLConnection := _dm._conexao;

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
    Add('QT_FISICO - QT_RESERVADO - QT_RESERVA_PROBLEMATICA');
    Add('- QT_VENCIDO  AS ESTOQUE,');
    Add('DT_ATUALIZACAO_ESTOQUE, ESTOQUE.ID_SITUACAO_MERCADORIA');
    Add('as ID_SITUACAO_ESTOQUE,VT_CUSTO_FINANCEIRO_MERCADORIA,');
    Add('DT_ATUALIZACAO_PRECO_VENDA,CD_COMPRADOR,CD_EMPRESA_CROSSDOCKING');
    Add(',CASE');
    Add(' WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN ''S''');
    Add(' else ''N''');
    Add('END ID_CROSSDOCKING');
    Add(',CASE');
    Add(' WHEN  CD_EMPRESA_CROSSDOCKING>0 THEN (SELECT CD_EMPRESA_FISICA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA = CD_EMPRESA_CROSSDOCKING)');
    Add(' ELSE COMPRA.CD_EMPRESA');
    Add('END NR_EMPRESA_CROSSDOCKING,VL_CUSTO_GERENCIAL');

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

   // Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
   if PnrProduto>0 then
   begin
    Add('AND MERCADORIA.CD_MERCADORIA=:PnrProduto');
    Add('AND MERCADORIA.NR_DV_MERCADORIA=:PnrDigito');
   end;
   if PcdEan<>'' then
    Add('AND CD_EAN_VENDA=:PcdEan');


    if PcdEmpresa > 0 then
       Add('AND COMPRA.CD_EMPRESA=:PcdEmpresa');
   end;

  stQry.SaveToFile('C:\temp\qryProduto.sql');
  with QryTemp do
  begin
      Close;

      SQL.Clear;
      SQL.Add(stQry.Text);
      if PnrProduto > 0 then
      begin
        ParamByName('PnrProduto').AsBCD := PnrProduto;
        ParamByName('PnrDigito').AsBCD  := PnrDigito;

      end;
      if PcdEmpresa > 0 then
          ParamByName('PcdEmpresa').AsBCD := PcdEmpresa;

      if PcdEan<>'' then
         ParamByName('PcdEan').AsString:=PcdEan;
      open;

  end;


  if QryTemp.IsEmpty then
  begin
    Result := nil;
    exit;
  end
  else
  begin
   Mercadoria := TMercadoria.Create;

   Mercadoria.cdProduto               := QryTemp.FieldByName('CD_PRODUTO').AsInteger;
   Mercadoria.nrProduto               := QryTemp.FieldByName('CD_MERCADORIA').AsInteger;
   Mercadoria.dgProduto               := QryTemp.FieldByName('NR_DV_MERCADORIA').AsInteger;
   Mercadoria.qtEstoque               := QryTemp.FieldByName('ESTOQUE').AsInteger;
   Mercadoria.qtEstoqueFISICO         := QryTemp.FieldByName('QT_FISICO').AsInteger;
   Mercadoria.nrLaboratorio           := QryTemp.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger;

   Mercadoria.nrUnidadesVencidas     := QryTemp.FieldByName('QT_VENCIDO')  .AsInteger;
   Mercadoria.nrReservaProblematica  := QryTemp.FieldByName('QT_RESERVA_PROBLEMATICA').AsInteger;
   Mercadoria.nrUnidadeReservaPedido := QryTemp.FieldByName('QT_RESERVADO').AsInteger;
   Mercadoria.nrUnidadeBloqueada     := QryTemp.FieldByName('QT_BLOQUEADO').AsInteger;
   Mercadoria.qtEmbalagemCompra      := QryTemp.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
   Mercadoria.qtEmbalagemVenda       := QryTemp.FieldByName('QT_EMBALAGEM_VENDA').AsInteger;
   Mercadoria.qtdCaixaPalete         := QryTemp.FieldByName('QT_CAIXA_PALETE').AsInteger;
   Mercadoria.qtdCaixaCamada         := QryTemp.FieldByName('QT_CAIXA_CAMADA').AsInteger;
   Mercadoria.qtMetroCubico          := QryTemp.FieldByName('MTS_CUBICO').AsFloat;
   Mercadoria.nrTipoProduto          := QryTemp.FieldByName('DS_NIVEL_ECNM').AsInteger;
   Mercadoria.pcRepasseCompra        := QryTemp.FieldByName('PC_REPASSE_COMPRA').AsFloat;
   Mercadoria.pcCreditoICMS          := QryTemp.FieldByName('PC_CREDITO_ICMS').AsFloat;
   Mercadoria.pcIpiProduto           := QryTemp.FieldByName('PC_IPI_MERCADORIA').AsFloat;
   Mercadoria.vlPrecoCadastro        := QryTemp.FieldByName('VL_PRECO_COMPRA').AsFloat;
   Mercadoria.vlPrecoCompra          := QryTemp.FieldByName('VL_PRECO_COMPRA').AsFloat;
   Mercadoria.vlPrecoVenda           := QryTemp.FieldByName('VL_PRECO_VENDA').AsFloat;
   Mercadoria.vlPrecoVendaAnterior   := QryTemp.FieldByName('VL_PRECO_VENDA_ANTERIOR').AsFloat;
   Mercadoria.vlPrecoCompraAnterior  := QryTemp.FieldByName('VL_PRECO_COMPRA_ANTERIOR').AsFloat;
   Mercadoria.vlCustoGerencial       :=  QryTemp.FieldByName('VL_CUSTO_GERENCIAL').AsFloat;

   Mercadoria.nmProduto              := QryTemp.FieldByName('NM_MERCADORIA').AsString;
   Mercadoria.dsApresentacao         := QryTemp.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString;
   Mercadoria.nmProdutoCompleto      := QryTemp.FieldByName('NM_COMPLETO').AsString;
   if QryTemp.FieldByName('DS_NIVEL_ECNM').AsInteger = 1 then
     Mercadoria.dsFinalidade := GetEspecealidade(QryTemp.FieldByName('DS_NIVEL_EITM').AsInteger)
   else
     Mercadoria.dsFinalidade    :=GetEspecealidade(QryTemp.FieldByName('DS_NIVEL_ERGM').AsInteger);
   Mercadoria.idCurva           := QryTemp.FieldByName('ID_CURVA_MERCADORIA').AsString[1];
   Mercadoria.dtUltimaSaida     := QryTemp.FieldByName('DT_ULTIMA_SAIDA').AsDateTime;
   Mercadoria.dtUltimaEntrada   := QryTemp.FieldByName('DT_ULTIMA_ENTRADA').AsDateTime;
   Mercadoria.idTipoListaFiscal := QryTemp.FieldByName('ID_TIPO_LISTA_FISCAL').AsString[1];
   Mercadoria.idSuperfulo       := QryTemp.FieldByName('ID_SUPERFLUO').AsString[1];
   Mercadoria.idPisCofins       := QryTemp.FieldByName('ID_COFINS').AsString[1];
   Mercadoria.idPis             := QryTemp.FieldByName('ID_PIS').AsString[1];
   Mercadoria.idCofins          := QryTemp.FieldByName('ID_COFINS').AsString[1];
   Mercadoria.idCipado          := QryTemp.FieldByName('ID_CIPADO').AsString[1];
   Mercadoria.idRetemICMS       := QryTemp.FieldByName('ID_RETEM_ICMS').AsString[1];
   Mercadoria.idRepasseIcms     := QryTemp.FieldByName('ID_REPASSE_ICMS').AsString[1];


   Mercadoria.idCrossdocking     := QryTemp.FieldByName('ID_CROSSDOCKING').AsString;

   Mercadoria.cdInternoFornecedor  := QryTemp.FieldByName('CD_INTERNO_LABORATORIO').AsString;
   Mercadoria.qtEmbalagemCompra    := GetQuantidadeEmbalagem(Mercadoria.nrProduto);

   if Mercadoria.qtEmbalagemCompra < 1 then
     Mercadoria.qtEmbalagemCompra     :=QryTemp.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
   Mercadoria.qtEmbalagemVenda        :=QryTemp.FieldByName('QT_EMBALAGEM_VENDA').AsInteger;
   DadosFornecedor                    := GetDadosLaboratorio(Mercadoria.nrLaboratorio);
   Mercadoria.idForcaRepasse          := DadosFornecedor.idForcaRepasse;
   Mercadoria.idIpiLiquidoComRepasse  := DadosFornecedor.idIpiLiquidoComRepasse;
   Mercadoria.idIpiLiquidoSemRepasse  := DadosFornecedor.idIpiLiquidoSemRepasse;
   Mercadoria.idIpiBrutoComRepasse    := DadosFornecedor.idIpiBrutoComRepasse;
   Mercadoria.idIpiBrutoSemRepasse    := DadosFornecedor.idIpiBrutoSemRepasse;
   Mercadoria.idIcmDestacado          := DadosFornecedor.idIcmDestacado;
   Mercadoria.idReduzIcms             := DadosFornecedor.idReduzIcms;
   Mercadoria.dsRazaoSocialFornecedor := DadosFornecedor.dsRazaoSocial;
   Mercadoria.dsUndidadeFederacaoFornecedor :=DadosFornecedor.dsUnidadeFederacao;
   Mercadoria.dsFantasiaFornecedor        := DadosFornecedor.dsNomeFantasia;
   Mercadoria.pcGeracaoVerba              := DadosFornecedor.pcGeracaoVerba;
   Mercadoria.nrGeracaoVerba              := DadosFornecedor.nrGeracaoVerba;

   Mercadoria.dsLocalizacao               :=QryTemp.FieldByName('CD_LOCALIZACAO').AsString;
   Mercadoria.dtAtualizacaoPreco          :=QryTemp.FieldByName('DT_ATUALIZACAO_PRECO_VENDA').AsDateTime;
   Mercadoria.nrEmpresaProduto            :=PcdEmpresa;
   Mercadoria.idSituacaoMercadoriaCompra  :=  QryTemp.FieldByName('ID_SITUACAO_COMPRA').AsString[1];
   Mercadoria.idSituacaoMercadoriaEstoque :=  QryTemp.FieldByName('ID_SITUACAO_ESTOQUE').AsString[1];
   Mercadoria.vlFinanceiroEstoque         :=  QryTemp.FieldByName('VT_CUSTO_FINANCEIRO_MERCADORIA').AsFloat;
   Mercadoria.vlFinanceiroEstoque         :=  QryTemp.FieldByName('VT_CUSTO_FINANCEIRO_MERCADORIA').AsFloat;
   Mercadoria.dsUnidadeMedia              :=  QryTemp.FieldByName('DS_UNIDADE_MEDIDA').AsString;
   Mercadoria.nrComprador                 :=  QryTemp.FieldByName('CD_COMPRADOR').AsInteger;


   Mercadoria.pcDescontoPadrao := QryTemp.FieldByName('PC_DESCONTO_PADRAO_COMPRA').AsFloat;

   Mercadoria.cdEmpresaCrossdocking       :=  QryTemp.FieldByName('CD_EMPRESA_CROSSDOCKING').AsInteger;
   Mercadoria.nrCrossdocking              :=  QryTemp.FieldByName('NR_EMPRESA_CROSSDOCKING').AsInteger;



   //if PcdOperadorLogistico>1 then
      // Mercadoria.pcDescontoPadrao := GetPcProdutosOl(PcdOperadorLogistico,Mercadoria.nrProduto,PcdEmpresa);

   Result := Mercadoria;
  end;
EXCEPT
  on E: Exception do
  begin
    trataerro(E.Message,'Erro ao consultar Produto fun??o ''GetMercadoria''');
    FreeAndNil(QryTemp);

  end;

END;

finally
    FreeAndNil(QryTemp);
end;

end;

Function GetParamentroLaboratorio(nrLaboratorio: Integer)
  : TParamentroFornecedor;
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
    tempQuery.Open;
    if SetParamento <> nil then
      SetParamento := nil;
    SetParamento := TParamentroFornecedor.Create;
    SetParamento.idForcaRepasse := 'N';
    SetParamento.idIpiLiquidoComRepasse := 'N';
    SetParamento.idIpiLiquidoSemRepasse := 'N';
    SetParamento.idIpiBrutoComRepasse := 'N';
    SetParamento.idIpiBrutoSemRepasse := 'N';
    IF not tempQuery.IsEmpty THEN
    BEGIN
      SetParamento.idForcaRepasse := tempQuery.FieldByName
        ('ID_REPASSE_PERFUMARIA').AsString[1];
      SetParamento.idIpiLiquidoComRepasse :=
        tempQuery.FieldByName('ID_IPI_VLR_LIQUIDO_COM_REPASSE').AsString[1];
      SetParamento.idIpiLiquidoSemRepasse :=
        tempQuery.FieldByName('ID_IPI_VLR_LIQUIDO').AsString[1];
      SetParamento.idIpiBrutoComRepasse :=
        tempQuery.FieldByName('ID_IPI_VLR_BRUTO_APOS_REPASSE').AsString[1];
      SetParamento.idIpiBrutoSemRepasse :=
        tempQuery.FieldByName('ID_IPI_VLR_BRUTO').AsString[1];
      SetParamento.idIcmDestacado := 'S';
      // tempQuery.FieldByName('ID_IPI_VLR_BRUTO').AsString[1];
      SetParamento.idReduzIcms := 'N';
      // tempQuery.FieldByName('ID_IPI_VLR_BRUTO').AsString[1];
    END;
    Result := SetParamento;
  finally
    FreeAndNil(tempQuery);
  end;
end;

Function GetTipoApresentacaoProduto(idTipo: char;
  nrApresentcao: Integer): String;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      SQL.Clear;
      SQL.Add('SELECT NOMT_T as TipoApresentacao');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCTAB');
      SQL.Add('WHERE');
      SQL.Add('TIPT_T =:PidTipo');
      SQL.Add('AND NROT_T =:PnrApresentcao');
      ParamByName('idTipo').AsString := idTipo;
      ParamByName('PnrApresentcao').AsInteger := nrApresentcao;
      Open;
    end;
    Result := 'N?o cadastrada...';
    if not tempQuery.IsEmpty then
      Result := tempQuery.FieldByName('TipoApresentacao').AsString;

  finally
    FreeAndNil(tempQuery);
  end;
end;

function GetEspecealidade(nrEspecealidade: Integer): String;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT NR_SEQUENCIAL,');
      SQL.Add('DS_DESCRICAO_ESTRUTURA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_CLASSIFICACAO_PRODUTO');
      SQL.Add('WHERE');
      SQL.Add('NR_SEQUENCIAL = :PnrEspecealidade');
      ParamByName('PnrEspecealidade').AsInteger := nrEspecealidade;
      Open;
    end;
    Result := 'N?o cadastrada...';
    if not tempQuery.IsEmpty then
      Result := tempQuery.FieldByName('DS_DESCRICAO_ESTRUTURA').AsString;
  finally
    FreeAndNil(tempQuery);
  end;
end;

Function GetQuantidadeEmbalagem(nrProduto: Integer): Integer;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;

  try
    tempQuery := TSQLQuery.Create(nil);
    tempQuery.SQLConnection := _dm._conexao;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT QT_EMBALAGEM');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_WMS_LOCALIZACAO');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('CD_MERCADORIA=:PnrProduto');
    tempQuery.SQL.Add('AND TRUNC(DT_ATUALIZACAO)=(SELECT Max(trunc(DT_ATUALIZACAO))');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_WMS_LOCALIZACAO');
    tempQuery.SQL.Add('WHERE CD_MERCADORIA=:PnrProduto)');
    // tempQuery.SQL.Add('GROUP BY QT_EMBALAGEM');
    tempQuery.ParamByName('PnrProduto').AsInteger := nrProduto;
    tempQuery.Open;
    Result := 0;
    IF not tempQuery.IsEmpty THEN
      Result := tempQuery.FieldByName('QT_EMBALAGEM').AsInteger;
  finally
    FreeAndNil(tempQuery);
  end;
end;

{ TDadoFornecedor }

procedure TDadosFornecedor.SetcdFornecedorPai(const Value: Integer);
begin
  FcdFornecedorPai := Value;
end;

procedure TDadosFornecedor.SetdsDiasPedido(const Value: String);
begin
  FdsDiasPedido := Value;
end;

procedure TDadosFornecedor.SetdsGrupoFornecedor(const Value: String);
begin
  FdsGrupoFornecedor := Value;
end;

procedure TDadosFornecedor.SetdsNomeFantasia(const Value: String);
begin
  FdsNomeFantasia := Value;
end;

procedure TDadosFornecedor.SetdsRazaoSocial(const Value: String);
begin
  FdsRazaoSocial := Value;
end;

procedure TDadosFornecedor.SetdsUnidadeFederacao(const Value: String);
begin
  FdsUnidadeFederacao := Value;
end;

procedure TDadosFornecedor.SetdtAgenda(const Value: TDate);
begin
  FdtAgenda := Value;
end;

procedure TDadosFornecedor.SetdtAgendaFornecedor(const Value: TDate);
begin
  FdtAgendaFornecedor := Value;
end;

procedure TDadosFornecedor.SetidForcaRepasse(const Value: char);
begin
  FidForcaRepasse := Value;
end;

procedure TDadosFornecedor.SetidIcmDestacado(const Value: char);
begin
  FidIcmDestacado := Value;
end;

procedure TDadosFornecedor.SetidIpiBrutoComRepasse(const Value: char);
begin
  FidIpiBrutoComRepasse := Value;
end;

procedure TDadosFornecedor.SetidIpiBrutoSemRepasse(const Value: char);
begin
  FidIpiBrutoSemRepasse := Value;
end;

procedure TDadosFornecedor.SetidIpiLiquidoComRepasse(const Value: char);
begin
  FidIpiLiquidoComRepasse := Value;
end;

procedure TDadosFornecedor.SetidIpiLiquidoSemRepasse(const Value: char);
begin
  FidIpiLiquidoSemRepasse := Value;
end;

procedure TDadosFornecedor.SetidReduzIcms(const Value: char);
begin
  FidReduzIcms := Value;
end;

procedure TDadosFornecedor.SetidUnidadeFederacao(const Value: String);
begin
  FidUnidadeFederacao := Value;
end;

procedure TDadosFornecedor.SetnrComprador(const Value: Integer);
begin
  FnrComprador := Value;
end;

procedure TDadosFornecedor.SetnrDiasLeadTime(const Value: Integer);
begin
  FnrDiasLeadTime := Value;
end;

procedure TDadosFornecedor.SetnrFornecedor(const Value: Integer);
begin
  FnrFornecedor := Value;
end;

procedure TDadosFornecedor.SetnrGeracaoVerba(const Value: Integer);
begin
  FnrGeracaoVerba := Value;
end;

procedure TDadosFornecedor.SetnrGrupoFornecedor(const Value: Integer);
begin
  FnrGrupoFornecedor := Value;
end;

procedure TDadosFornecedor.SetnrPrazoPedido(const Value: Integer);
begin
  FnrPrazoPedido := Value;
end;

procedure TDadosFornecedor.SetpcGeracaoVerba(const Value: Double);
begin
  FpcGeracaoVerba := Value;
end;

procedure TDadosFornecedor.SetstCNPJ(const Value: String);
begin
  FstCNPJ := Value;
end;

{ TParamentroLaboratorioNova }

procedure TParamentroFornecedor.SetcdFornecedorPai(const Value: Integer);
begin
  FcdFornecedorPai := Value;
end;

procedure TParamentroFornecedor.SetdsDiasPedido(const Value: String);
begin
  FdsDiasPedido := Value;
end;

procedure TParamentroFornecedor.SetdsNomeFantasia(const Value: String);
begin
  FdsNomeFantasia := Value;
end;

procedure TParamentroFornecedor.SetdsRazaoSocial(const Value: String);
begin
  FdsRazaoSocial := Value;
end;

procedure TParamentroFornecedor.SetdsUnidadeFederacao(const Value: String);
begin
  FdsUnidadeFederacao := Value;
end;

procedure TParamentroFornecedor.SetdtAgenda(const Value: TDate);
begin
  FdtAgenda := Value;
end;

procedure TParamentroFornecedor.SetidForcaRepasse(const Value: char);
begin
  FidForcaRepasse := Value;
end;

procedure TParamentroFornecedor.SetidIcmDestacado(const Value: char);
begin
  FidIcmDestacado := Value;
end;

procedure TParamentroFornecedor.SetidIpiBrutoComRepasse(const Value: char);
begin
  FidIpiBrutoComRepasse := Value;
end;

procedure TParamentroFornecedor.SetidIpiBrutoSemRepasse(const Value: char);
begin
  FidIpiBrutoSemRepasse := Value;
end;

procedure TParamentroFornecedor.SetidIpiLiquidoComRepasse(const Value: char);
begin
  FidIpiLiquidoComRepasse := Value;
end;

procedure TParamentroFornecedor.SetidIpiLiquidoSemRepasse(const Value: char);
begin
  FidIpiLiquidoSemRepasse := Value;
end;

procedure TParamentroFornecedor.SetidReduzIcms(const Value: char);
begin
  FidReduzIcms := Value;
end;

procedure TParamentroFornecedor.SetnrDiasLeadTime(const Value: Integer);
begin
  FnrDiasLeadTime := Value;
end;

procedure TParamentroFornecedor.SetnrFornecedor(const Value: Integer);
begin
  FnrFornecedor := Value;
end;

procedure TParamentroFornecedor.SetnrGrupoFornecedor(const Value: Integer);
begin
  FnrGrupoFornecedor := Value;
end;

procedure TParamentroFornecedor.SetnrPrazoPedido(const Value: Integer);
begin
  FnrPrazoPedido := Value;
end;

procedure TParamentroFornecedor.SetstCNPJ(const Value: String);
begin
  FstCNPJ := Value;
end;

{ TEstoqueMercadoria }

procedure TEstoqueMercadoria.SetidSituacaoEstoque(const Value: String);
begin
  FidSituacaoEstoque := Value;
end;

procedure TEstoqueMercadoria.SetnrQuantidadeBloqueado(const Value: Integer);
begin
  FnrQuantidadeBloqueado := Value;
end;

procedure TEstoqueMercadoria.SetnrQuantidadeEstoque(const Value: Integer);
begin
  FnrQuantidadeEstoque := Value;
end;

procedure TEstoqueMercadoria.SetnrQuantidadeFisico(const Value: Integer);
begin
  FnrQuantidadeFisico := Value;
end;

procedure TEstoqueMercadoria.SetnrQuantidadePedido(const Value: Integer);
begin
  FnrQuantidadePedido := Value;
end;

procedure TEstoqueMercadoria.SetnrQuantidadeReserva(const Value: Integer);
begin
  FnrQuantidadeReserva := Value;
end;

procedure TEstoqueMercadoria.SetnrQuantidadeVencido(const Value: Integer);
begin
  FnrQuantidadeVencido := Value;
end;

procedure TEstoqueMercadoria.SetnrReservaProblematica(const Value: Integer);
begin
  FnrReservaProblematica := Value;
end;

function GetDadosLaboratorio(nrFornecedor: Integer): TDadosFornecedor;
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
      Params.ParamByName('PnrFornecedor').AsInteger := nrFornecedor;
      Open;

    end;
    if DadosFornecedor <> nil then
      DadosFornecedor := nil;
    if not tempQuery.IsEmpty then
    begin
      DadosFornecedor := TDadosFornecedor.Create;
      DadosFornecedor.nrPrazoPedido      := tempQuery.FieldByName('QT_DIAS_PRAZO_PADRAO').AsInteger;
      DadosFornecedor.dtAgenda           := tempQuery.FieldByName('DT_AGENDAMENTO').AsDateTime;
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
     end;

    Result := DadosFornecedor;
  finally
    FreeAndNil(tempQuery);
  end;

end;


function GetDadosLaboratorioCNPJ(PnrFornecedor: Integer;PnrCNPJ:String): TDadosFornecedor;
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
      if PnrFornecedor>0 then
      begin
        SQL.Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      end;

      if PnrCNPJ<>'' then
      begin
        SQL.Add('AND NR_CNPJ=:PnrCNPJ');
        Params.ParamByName('PnrCNPJ').AsString := PnrCNPJ;

      end;

      Open;

    end;
    if DadosFornecedor <> nil then
      DadosFornecedor := nil;
    if not tempQuery.IsEmpty then
    begin
      DadosFornecedor := TDadosFornecedor.Create;
      DadosFornecedor.nrPrazoPedido      := tempQuery.FieldByName('QT_DIAS_PRAZO_PADRAO').AsInteger;
      DadosFornecedor.dtAgenda           := tempQuery.FieldByName('DT_AGENDAMENTO').AsDateTime;
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
     end;

    Result := DadosFornecedor;
  finally
    FreeAndNil(tempQuery);
  end;

end;


{ TValorEstoqueMercadoria }

procedure TValorEstoqueMercadoria.SetvlPrecoCompraMercadoria
  (const Value: Double);
begin
  FvlPrecoCompraMercadoria := Value;
end;

procedure TValorEstoqueMercadoria.SetvlPrecoVendaMercadoria
  (const Value: Double);
begin
  FvlPrecoVendaMercadoria := Value;
end;

procedure TValorEstoqueMercadoria.SetvtCustoFinanceiroMercadoria
  (const Value: Double);
begin
  FvtCustoFinanceiroMercadoria := Value;
end;

procedure TValorEstoqueMercadoria.SetvtCustoFinanceiroUnitarioMercadoria
  (const Value: Double);
begin
  FvtCustoFinanceiroUnitarioMercadoria := Value;
end;

procedure TValorEstoqueMercadoria.SetvtCustoGerencialMercadoria
  (const Value: Double);
begin
  FvtCustoGerencialMercadoria := Value;
end;


function GetPcProdutosOl(PnrOPerador,PnrProduto,PnrEmpresa: Integer):Double;
var
  QryTemp: TSQLQuery;
begin
              try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
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
      SQL.Add('AND CD_MERCADORIA=:PcdProduto');
      SQL.Add('AND CD_EMPRESA=:PcdEmpresa');
      ParamByName('PcdOPerador').AsInteger:=PnrOPerador;
      ParamByName('PcdProduto').AsInteger:=PnrProduto;
      ParamByName('PcdEmpresa').AsInteger:=PnrEmpresa;
     open;
    end;
    result:=0;
    if not QryTemp.IsEmpty then
       result:=QryTemp.FieldByName('PC_DESC_COMPRA').AsFloat;
   finally
    FreeAndNil(QryTemp);
  end;
end;





end.
