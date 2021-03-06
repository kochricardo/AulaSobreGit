unit uTelaPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ActnList, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  PlatformDefaultStyleActnCtrls, ExtCtrls, jpeg, uDMImagensMovas,
  IdBaseComponent, IdComponent, IdIPWatch, uRotinasGenericas,
  uAgendaLaboratorio, uTransferenciaDeArquivo, uRotinaMargemGam,
  uEstoqueAcimadeXdias, uExcessoProduto, uRelatorioVerbas, uRelacaoPedido,
  uSugestaodeCompra, uLaboratorioPendencia, uEstoquePendencia, uDadosProdutos,
  uCadastroParamentoVan, uSetDataAgenda, uRelacaoNFeRecebida, uCriticaPedidoNfe,
  uEstoqueZero, uRelatorioProdutoClassificacao, uCorrecaoVerbaPedido,
  uListagemSaldoVerba, uInativadosCadastrados, uComparaVendaAnual, ClipBrd,
  uRelatorioCriticaEntradaNovo, uRelatorioCriticaQuantidade, uPendenciaComprador,
  AppEvnts, XPStyleActnCtrls, StdStyleActnCtrls;

type
  T_frmTelaPrincipal = class(TForm)
    _stbarMessagem: TStatusBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    acmControleMenu: TActionManager;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    acAgendaPedidos: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    acEncerraSistema: TAction;
    acCadastrosParamentrosArquivos: TAction;
    idIP: TIdIPWatch;
    Timer1: TTimer;
    acDivissaoPedido: TAction;
    acAcessoBaseProducao: TAction;
    acAcessoBaseTeste: TAction;
    acGeraPedidoVan: TAction;
    acAplicaVerbaPedido: TAction;
    acAtualizaDataAgenda: TAction;
    acDadosProdutos: TAction;
    acPedidos: TAction;
    acPedidoemAtraso: TAction;
    acPendencias: TAction;
    acPendenciaPorLaboratorio: TAction;
    acSugestaodeCompra: TAction;
    acRelacaoPedido: TAction;
    acRelatorioVerba: TAction;
    acRelatoriodeExcesso: TAction;
    acEstoqueAcimadeXDias: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    acRelacacaoNfeRecebida: TAction;
    acCriticaPedidoXML: TAction;
    acItensEstoqueZerado: TAction;
    acRelatorioClassificacao: TAction;
    acCorrecaoVerba: TAction;
    acListagemVerbas: TAction;
    acRelatorioCadastradosInativados: TAction;
    acComparacaoAnualVenda: TAction;
    acRelat?rioCriticaPedidoxXMLNFe: TAction;
    acRelatorioCriticadeQuantidade: TAction;
    acLogomSistema: TAction;
    Action1: TAction;
    acPendenciaComprador: TAction;
    acNivelServi?o: TAction;
    _csCadastraEventosPedidos: TAction;
    acListagemAgendaFornecedor: TAction;
    Image1: TImage;
    Action2: TAction;
    acPontoEncomenda: TAction;
    acTrocaNrComprador: TAction;
    acCadastroVerbaUsuario: TAction;
    acRelatorioItensN?oAtendidos: TAction;
    acRelatorioPedidosFaturamentoAtrasado: TAction;
    acPedidoPreElaborado: TAction;
    acFormaPedidoEspecial: TAction;
    ToolButton6: TToolButton;
    acImportaPrecoFornecedor: TAction;
    ApplicationEvents1: TApplicationEvents;
    acNovaTelaCompras: TAction;
    acAtivarPedido: TAction;
    acCadastrodeObserva?aoFornecedor: TAction;
    AcPedidoOPeracaoRedes: TAction;
    acCriticaOperacaoRede: TAction;
    acImportaPedidoFornecedor: TAction;
    acCorrigemIcmsCompra: TAction;
    acRelatorioProdutoFornecedor: TAction;
    Action3: TAction;
    acCancelaPendeciaExcel: TAction;
    Action7: TAction;
    procedure FormCreate(Sender: TObject);
    procedure _acAgendaPedidoExecute(Sender: TObject);
    procedure acAgendaPedidosExecute(Sender: TObject);
    procedure acEncerraSistemaExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure _stbarMessagemDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure acDivissaoPedidoExecute(Sender: TObject);
    procedure acGeraPedidoVanExecute(Sender: TObject);
    procedure acAplicaVerbaPedidoExecute(Sender: TObject);
    procedure acAcessoBaseProducaoExecute(Sender: TObject);
    procedure acAcessoBaseTesteExecute(Sender: TObject);
    procedure acEstoqueAcimadeXDiasExecute(Sender: TObject);
    procedure acRelatoriodeExcessoExecute(Sender: TObject);
    procedure acRelatorioVerbaExecute(Sender: TObject);
    procedure acRelacaoPedidoExecute(Sender: TObject);
    procedure acSugestaodeCompraExecute(Sender: TObject);
    procedure acPendenciaPorLaboratorioExecute(Sender: TObject);
    procedure acPendenciasExecute(Sender: TObject);
    procedure acDadosProdutosExecute(Sender: TObject);
    procedure acCadastrosParamentrosArquivosExecute(Sender: TObject);
    procedure acAtualizaDataAgendaExecute(Sender: TObject);
    procedure acRelacacaoNfeRecebidaExecute(Sender: TObject);
    procedure acCriticaPedidoXMLExecute(Sender: TObject);
    procedure acItensEstoqueZeradoExecute(Sender: TObject);
    procedure acRelatorioClassificacaoExecute(Sender: TObject);
    procedure acCorrecaoVerbaExecute(Sender: TObject);
    procedure acListagemVerbasExecute(Sender: TObject);
    procedure acRelatorioCadastradosInativadosExecute(Sender: TObject);
    procedure acComparacaoAnualVendaExecute(Sender: TObject);
    procedure acRelat?rioCriticaPedidoxXMLNFeExecute(Sender: TObject);
    procedure acRelatorioCriticadeQuantidadeExecute(Sender: TObject);
    procedure acLogomSistemaExecute(Sender: TObject);
    procedure acPendenciaCompradorExecute(Sender: TObject);
    procedure acNivelServi?oExecute(Sender: TObject);
    procedure _csCadastraEventosPedidosExecute(Sender: TObject);
    procedure acListagemAgendaFornecedorExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure acPontoEncomendaExecute(Sender: TObject);
    procedure acTrocaNrCompradorExecute(Sender: TObject);
    procedure acCadastroVerbaUsuarioExecute(Sender: TObject);
    procedure acRelatorioItensN?oAtendidosExecute(Sender: TObject);
    procedure acRelatorioPedidosFaturamentoAtrasadoExecute(Sender: TObject);
    procedure acPedidoPreElaboradoExecute(Sender: TObject);
    procedure acFormaPedidoEspecialExecute(Sender: TObject);
    procedure acImportaPrecoFornecedorExecute(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure acAtivarPedidoExecute(Sender: TObject);
    procedure acCadastrodeObserva?aoFornecedorExecute(Sender: TObject);
    procedure AcPedidoOPeracaoRedesExecute(Sender: TObject);
    procedure acCriticaOperacaoRedeExecute(Sender: TObject);
    procedure acImportaPedidoFornecedorExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCorrigemIcmsCompraExecute(Sender: TObject);
    procedure acRelatorioProdutoFornecedorExecute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure acRelatorioProdutoComReservaVenvidosExecute(Sender: TObject);
    procedure acestoquepossibilidadevencimentoExecute(Sender: TObject);
    procedure acRelatorioEstoquePorCDExecute(Sender: TObject);
    procedure acCancelaPendeciaExcelExecute(Sender: TObject);
  private
    procedure LogaUsuario;
    procedure HabilitaMenu(nrPrivilegio: Integer);
    procedure FotoErro(Sender: TObject; E: Exception);
    procedure liberarMenuUsuario;
    procedure desabilitarMenuGeral;
    { Private declarations }
  public
    { Public declarations }
//    CompradorSistema : array[1..20] of Integer;
    NrCompradorAutorizado : array[1..20] of Integer;
  end;
const
    ScreenWidth: LongInt =800;
    ScreenHeight: LongInt =600;

var
  _frmTelaPrincipal: T_frmTelaPrincipal;
  nmAplicacao:WideString;
  DadosPrimeiraLeitura :DadosExecucao;
implementation

uses ufrmLogin, uDm, uDividiPedido, uEnvioPedido, uAplicarVerbaPedido,
  uNivelServico, uCadasrtaEventoPedido, uListaAgendaCompradores,
  uProdutoEmEspera, uPontoEncomenda, uTelaComprador, uCadastrodeVerbaUsuario,
  uItensNaoAtendidos, uPedidoFaturamemtoAtrasado, uGraficoPedidoVendas,
  uPedidoPreElaborado, uTelaPedidoEspecial, uImportaPrecoFornecedor,
  uTelaComprasNovaII, uAtivarPedido, uObservacaoNoFornecedor,
  uPedidoOperacaoRede, uCriticaPedidoOPeracaoRede, uImportaPedidoCompra,
  UCorrecaoIcmaCompra, uObservacaoInativacaoBloqueio,
  uRelatorioProdutoFornecedor, uProdutosReservaVencidos,
  uProdutoPossibilidadeVencimento, uRelatorioEstoquePorCD,
  uCancelaPendenciaExcel;

{$R *.dfm}

procedure T_frmTelaPrincipal.acAcessoBaseProducaoExecute(Sender: TObject);
begin
  nrBase := 1;
  TestaConexaoBase(_dm._conexao, nrBase);

end;

procedure T_frmTelaPrincipal.acAcessoBaseTesteExecute(Sender: TObject);
begin
  nrBase := 2;
  TestaConexaoBase(_dm._conexao, nrBase);

end;

procedure T_frmTelaPrincipal.acAgendaPedidosExecute(Sender: TObject);
begin
   DataEmpresa;

   GetVersaoSistema(dsVersaoSistema,ipMaquina,18) ;
  _frmAgendaCompras := T_frmAgendaCompras.Create(Self);
  _frmAgendaCompras.Show;

end;

procedure T_frmTelaPrincipal.acAplicaVerbaPedidoExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmAplicarVerbaPedido, _frmAplicarVerbaPedido);
  _frmAplicarVerbaPedido.Show;
  FormPos(_frmAplicarVerbaPedido, 2, 1);

end;

procedure T_frmTelaPrincipal.acAtivarPedidoExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmAtivaPedido, _frmAtivaPedido);
  _frmAtivaPedido.Show;
  FormPos(_frmAtivaPedido, 2, 1);

end;

procedure T_frmTelaPrincipal.acAtualizaDataAgendaExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmAcertaDataAgenda, _frmAcertaDataAgenda);
  _frmAcertaDataAgenda.Show;
  FormPos(_frmAcertaDataAgenda, 2, 1);

end;

procedure T_frmTelaPrincipal.acCadastrodeObserva?aoFornecedorExecute(
  Sender: TObject);
begin
      NrFornecedorObservacao :=0;
      Application.CreateForm(T_frmObservacaoLaboratorio,    _frmObservacaoLaboratorio);
       _frmObservacaoLaboratorio.ShowModal;
end;

procedure T_frmTelaPrincipal.acCadastrosParamentrosArquivosExecute(
  Sender: TObject);
begin
  Application.CreateForm(T_frmCadastroParamentoVan, _frmCadastroParamentoVan);

end;

procedure T_frmTelaPrincipal.acCadastroVerbaUsuarioExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmCadastroVerbaUsuario, _frmCadastroVerbaUsuario);

  FormPos(_frmCadastroVerbaUsuario,2,1)
  { Horz: 1=esquerda, 2=centro, 3=direita
  Vert: 1=topo, 2=centro, 3=em baixo }


end;

procedure T_frmTelaPrincipal.acCancelaPendeciaExcelExecute(Sender: TObject);
begin
   Application.CreateForm(T_frmCancelaPendenciaExcel, _frmCancelaPendenciaExcel);
  _frmCancelaPendenciaExcel.ShowModal;
  FormPos(_frmCancelaPendenciaExcel, 2, 1);
end;

procedure T_frmTelaPrincipal.acComparacaoAnualVendaExecute(Sender: TObject);
begin
    _frmComparacaoAnualVenda:= T_frmComparacaoAnualVenda.create(self);
    FormPos(_frmComparacaoAnualVenda,0,0);

end;

procedure T_frmTelaPrincipal.acCorrecaoVerbaExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmCorrecaoVerba, _frmCorrecaoVerba);
  _frmCorrecaoVerba.Show;
  FormPos(_frmCorrecaoVerba, 2, 1);

end;

procedure T_frmTelaPrincipal.acCorrigemIcmsCompraExecute(Sender: TObject);
begin
   _frmCorrecaoIcmCompra:= T_frmCorrecaoIcmCompra.create(self);
    FormPos(_frmCorrecaoIcmCompra,1,1);

end;

procedure T_frmTelaPrincipal.acDadosProdutosExecute(Sender: TObject);
begin
  _frmDadosProduto := T_frmDadosProduto.Create(Self);
  _frmDadosProduto.Top := 01;
  _frmDadosProduto.Left := 05;
  _frmDadosProduto.Show;

end;

procedure T_frmTelaPrincipal.acDivissaoPedidoExecute(Sender: TObject);
begin

if cdUsuarioSistema<>212 then
begin
  Mensagem('Modulo sendo valido para nova Modalidade CrossDockin'+#13+
           'Assim que valida??o estive colncluida modulo esta disponive!!!',MB_ICONWARNING);
  exit;
end;


  Application.CreateForm(T_frmDivisaoDePedido, _frmDivisaoDePedido);
  FormPos(_frmDivisaoDePedido, 1, 1);
  _frmDivisaoDePedido.ShowModal;

end;

procedure T_frmTelaPrincipal.acEncerraSistemaExecute(Sender: TObject);
begin
   // Application.Terminate;
   CLOSE;
end;

procedure T_frmTelaPrincipal.acEstoqueAcimadeXDiasExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmEstoqueAcimadeXDias, _frmEstoqueAcimadeXDias);
  FormPos(_frmEstoqueAcimadeXDias, 2, 1);
  _frmEstoqueAcimadeXDias.Show;

end;

procedure T_frmTelaPrincipal.acFormaPedidoEspecialExecute(Sender: TObject);
begin
   Application.CreateForm(T_frmPedidoEspecial, _frmPedidoEspecial);
  _frmPedidoEspecial.Show;
  FormPos(_frmPedidoEspecial, 2, 1);

end;

procedure T_frmTelaPrincipal.acGeraPedidoVanExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmEnvioPedido, _frmEnvioPedido);
  _frmEnvioPedido.Show;
  FormPos(_frmEnvioPedido, 1, 1);

end;

procedure T_frmTelaPrincipal.acImportaPedidoFornecedorExecute(Sender: TObject);
begin


   _frmImportaPedidoFornecedor:= T_frmImportaPedidoFornecedor.create(self);
    FormPos(_frmImportaPedidoFornecedor,1,1);

end;

procedure T_frmTelaPrincipal.acImportaPrecoFornecedorExecute(Sender: TObject);
begin

    _frmImportaPrecoFornecedor:= T_frmImportaPrecoFornecedor.create(self);
    FormPos(_frmImportaPrecoFornecedor,1,1);


end;

procedure T_frmTelaPrincipal.acItensEstoqueZeradoExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmEstoqueZero, _frmEstoqueZero);
  FormPos(_frmEstoqueZero, 2, 1);
  _frmEstoqueZero.Show;

end;

procedure T_frmTelaPrincipal.acListagemAgendaFornecedorExecute(Sender: TObject);
begin
    _frmListaAgendaCompradores:= T_frmListaAgendaCompradores.create(self);
    FormPos(_frmListaAgendaCompradores,2,1);

end;

procedure T_frmTelaPrincipal.acLogomSistemaExecute(Sender: TObject);
begin
 LogaUsuario;
end;

procedure T_frmTelaPrincipal.acNivelServi?oExecute(Sender: TObject);
begin
    _frmNivelServico:= T_frmNivelServico.create(self);
    FormPos(_frmNivelServico,2,1);

end;

procedure T_frmTelaPrincipal.AcPedidoOPeracaoRedesExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmPedidosRedes, _frmPedidosRedes);
  FormPos(_frmPedidosRedes, 2, 1);

end;

procedure T_frmTelaPrincipal.acPedidoPreElaboradoExecute(Sender: TObject);
begin
   _frmPedidoElabortado:= T_frmPedidoElabortado.create(self);
    FormPos(_frmPedidoElabortado,2,1);



end;

procedure T_frmTelaPrincipal.acPendenciaCompradorExecute(Sender: TObject);
begin
    _frmPendenciaComprador:= T_frmPendenciaComprador.create(self);
    FormPos(_frmPendenciaComprador,0,0);

end;

procedure T_frmTelaPrincipal.acPendenciasExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmEstoquePendencia, _frmEstoquePendencia);
  FormPos(_frmEstoquePendencia, 2, 1);
  _frmEstoquePendencia.Show;

end;

procedure T_frmTelaPrincipal.acPontoEncomendaExecute(Sender: TObject);
begin
   _frmPontoEncomenda:= T_frmPontoEncomenda.create(self);
    FormPos(_frmPontoEncomenda,2,1);

end;

procedure T_frmTelaPrincipal.acRelacacaoNfeRecebidaExecute(Sender: TObject);
begin
  _frmNfeRelacaoNFeRecebida:= T_frmNfeRelacaoNFeRecebida.create(self);
    FormPos(_frmNfeRelacaoNFeRecebida, 2, 1);

end;

procedure T_frmTelaPrincipal.acRelacaoPedidoExecute(Sender: TObject);
begin

  Application.CreateForm(T_frmRelacaoPedidos, _frmRelacaoPedidos);
end;

procedure T_frmTelaPrincipal.acRelatorioCadastradosInativadosExecute(
  Sender: TObject);
begin
    _frmCadastradosInativados:= T_frmCadastradosInativados.create(self);
    FormPos(_frmCadastradosInativados,2,1);

end;

procedure T_frmTelaPrincipal.acRelatorioClassificacaoExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmRelatorioClassificacaoProduto, _frmRelatorioClassificacaoProduto);
  FormPos(_frmRelatorioClassificacaoProduto, 1, 1);

end;

procedure T_frmTelaPrincipal.acRelatorioCriticadeQuantidadeExecute(
  Sender: TObject);
begin
   _frRelatorioCriticaQuantidade:= T_frRelatorioCriticaQuantidade.create(self);
    FormPos(_frRelatorioCriticaQuantidade,2,1);

end;

procedure T_frmTelaPrincipal.acRelatoriodeExcessoExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmRelatoriodeExcesso, _frmRelatoriodeExcesso);
  FormPos(_frmRelatoriodeExcesso, 1, 1);

end;

procedure T_frmTelaPrincipal.acRelatorioEstoquePorCDExecute(Sender: TObject);
begin
 _frmRelatorioEstoquePorCD:= T_frmRelatorioEstoquePorCD.create(self);
    FormPos(_frmRelatorioEstoquePorCD,2,1);

end;

procedure T_frmTelaPrincipal.acRelatorioItensN?oAtendidosExecute(
  Sender: TObject);
begin
   Application.CreateForm(T_frmItensNaoAtendidos, _frmItensNaoAtendidos);
  FormPos(_frmItensNaoAtendidos, 2, 1);


end;

procedure T_frmTelaPrincipal.acRelatorioPedidosFaturamentoAtrasadoExecute(
  Sender: TObject);
begin
   nrCompradorPedidoAtrasados:=nrCompradorSistema;
   Application.CreateForm(T_frmPedidosFaturamentoAtrasados,_frmPedidosFaturamentoAtrasados);
  _frmPedidosFaturamentoAtrasados.ShowModal;
  _frmPedidosFaturamentoAtrasados.FREE;

end;

procedure T_frmTelaPrincipal.acRelatorioProdutoFornecedorExecute(
  Sender: TObject);
begin
    _frmRelatorioProdutoFornecedor:= T_frmRelatorioProdutoFornecedor.create(self);
    FormPos(_frmRelatorioProdutoFornecedor,2,1);

end;

procedure T_frmTelaPrincipal.acListagemVerbasExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmListagemdeverbas, _frmListagemdeverbas);
  FormPos(_frmListagemdeverbas, 2, 1);
end;

procedure T_frmTelaPrincipal.acRelatorioVerbaExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmRelatorioVerba, _frmRelatorioVerba);
  nrCompradorVerba := nrCompradorSistema;
  _frmRelatorioVerba.ShowModal;

end;

procedure T_frmTelaPrincipal.acRelat?rioCriticaPedidoxXMLNFeExecute(
  Sender: TObject);
begin
   _frRelatorioCriticaEntradaNovo:= T_frRelatorioCriticaEntradaNovo.create(self);
    FormPos(_frRelatorioCriticaEntradaNovo,2,1);

end;

procedure T_frmTelaPrincipal.acSugestaodeCompraExecute(Sender: TObject);
begin
  Application.CreateForm(T_frmSugestaodeCompra, _frmSugestaodeCompra);
  _frmSugestaodeCompra.Top := 0;
  _frmSugestaodeCompra.Left := 0;

end;

procedure T_frmTelaPrincipal.Action2Execute(Sender: TObject);
begin
    _frmProdutoEmEspera:= T_frmProdutoEmEspera.create(self);
    FormPos(_frmProdutoEmEspera,2,1);

end;

procedure T_frmTelaPrincipal.Action3Execute(Sender: TObject);
begin
    _frmRelatorioProdutoReservaVencidos:= T_frmRelatorioProdutoReservaVencidos.create(self);
    FormPos(_frmRelatorioProdutoReservaVencidos,2,1);
end;

procedure T_frmTelaPrincipal.acestoquepossibilidadevencimentoExecute(Sender: TObject);
begin
    _frmProdutoPossibilidadeVencimento:= T_frmProdutoPossibilidadeVencimento.create(self);
    FormPos(_frmProdutoPossibilidadeVencimento,2,1);
end;

procedure T_frmTelaPrincipal.acRelatorioProdutoComReservaVenvidosExecute(Sender: TObject);
begin
    _frmRelatorioProdutoReservaVencidos:= T_frmRelatorioProdutoReservaVencidos.create(self);
    FormPos(_frmRelatorioProdutoReservaVencidos,2,1);
end;

procedure T_frmTelaPrincipal.acTrocaNrCompradorExecute(Sender: TObject);
begin
         _frmCompradorDisponivel:= T_frmCompradorDisponivel.create(self);
         Application.CreateForm(T_frmCompradorDisponivel, _frmCompradorDisponivel);
         _frmCompradorDisponivel.ShowModal;
          FormPos(_frmCompradorDisponivel,2,1);

end;

procedure T_frmTelaPrincipal.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var i: SmallInt;
begin
// rolagem do scroll do mouse no DBGrid

{if Msg.message = WM_MOUSEWHEEL then
begin
application.ProcessMessages;
Msg.message := WM_KEYDOWN;
Msg.lParam := 0;

i := HiWord(Msg.wParam);


if i > 0 then
Msg.wParam := VK_UP
else
Msg.wParam := VK_DOWN;

Handled := False;
end;}

  end;

procedure T_frmTelaPrincipal.acCriticaOperacaoRedeExecute(Sender: TObject);
begin
    _FrmCriticaPedidoOperacao:= T_FrmCriticaPedidoOperacao.create(self);
    FormPos(_FrmCriticaPedidoOperacao,1,1);

end;

procedure T_frmTelaPrincipal.acCriticaPedidoXMLExecute(Sender: TObject);
begin
    _frmNfeCriticaPedidoNfe:= T_frmNfeCriticaPedidoNfe.create(self);
    FormPos(_frmNfeCriticaPedidoNfe,2,1);

end;

procedure T_frmTelaPrincipal.FormActivate(Sender: TObject);
begin
  if not idLogado then
  begin
    LogaUsuario;
    nrCompradorPedidoAtrasados:=nrCompradorSistema;
    DadosPrimeiraLeitura:=SetDadosLeitura(pathSistema+'AberturaSistemaCompra.ini');
    //_frmTelaPrincipal.Enabled:=false;
    if not (DadosPrimeiraLeitura.idFinalizou) OR (DadosPrimeiraLeitura.dtUltimaExecucao<>dtSistema) then
    begin
     try
         Application.CreateForm(T_frmPedidosFaturamentoAtrasados,_frmPedidosFaturamentoAtrasados);
                                _frmPedidosFaturamentoAtrasados.ShowModal;
                                _frmPedidosFaturamentoAtrasados.free;


     finally

     end;
    end;
  end;




end;

procedure T_frmTelaPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 Application.Terminate;
 action:=cafree;
end;

procedure T_frmTelaPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (nrJanelasPedido > 0) then
  begin
    Mensagem('Exite um janela de pedido Aberta...' + #13 +
      'Feche para encerrar o Sistema!!',48);
    CanClose := False;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure T_frmTelaPrincipal.FormCreate(Sender: TObject);
begin
  nrJanelasPedido:=0;
  EnderecoMacPlaca:=MacAddress1;
  EnderecominhaPlaca:='24-F5-AA-F2-40-E2';
  EnderecominhaPlaca:='98-83-89-04-BE-BC';
  nmAplicacao := ExtractFileName(Application.ExeName);
  pathSistema := ExtractFilePath(Application.ExeName);

  getDataSistema;
  //  NrCompradorAutorizado:=[3000,3002,3008,3004,3006,3007,3100,97007,3010];
  if not DirectoryExists('C:\temp') then
       ForceDirectories('C:\temp');
  if not DirectoryExists(dsLocalPanilha) then
       ForceDirectories(dsLocalPanilha);
  if not DirectoryExists('C:\PlanilhasPedidoCompras') then
       ForceDirectories('C:\PlanilhasPedidoCompras');


  shortdateformat:='dd/mm/yyyy';
  nrBase :=1;
  idFazerLogin:=true;
  idLogado:=false;
  ipMaquina := idIP.LocalIP;
  HabilitaMenu(0);
  Color:=clwhite;
  TestaConexaoBase(_dm._conexao, nrBase);
  NrCompradorAutorizado[01]:=3000;
  NrCompradorAutorizado[02]:=3002;
  NrCompradorAutorizado[03]:=3008;
  NrCompradorAutorizado[04]:=3004;
  NrCompradorAutorizado[05]:=0;
  NrCompradorAutorizado[06]:=3006;
  NrCompradorAutorizado[07]:=3007;
  NrCompradorAutorizado[08]:=3100;
  NrCompradorAutorizado[09]:=97007;
  NrCompradorAutorizado[10]:=3010;
 // scaled := true;
{ if (screen.width <> ScreenWidth) then
 begin
  height := longint(height) * longint(screen.height) DIV ScreenHeight;
  width := longint(width) * longint(screen.width) DIV ScreenWidth;
  scaleBy(screen.width, ScreenWidth);
 end
 else
 begin
  with _frmTelaPrincipal do
   begin
    Width:=1150;
    Height:=768;
   end;
 end;}
  dsVersaoSistema := VersaoExe;

  if not  GetVersaoSistema(dsVersaoSistema,ipMaquina,18) then
  begin
    self.free;              //usado somente se estiver dentro de uma form ou datamodule
    application.free;    //se o objeto application estiver dispon?vel;
    exitprocess(0);
    application.free;
    close;
    idlogado:=true;
    exit;
  end;
      ;
  if not getDataSistema then
   begin
      Mensagem('Data do Sistema N?o Atualizada',48);
      dtSistema := Date;
    end;
    dtPedido:=dtsistema;
    dtEmpresa:=dtSistema;

  if(EnderecoMacPlaca=EnderecominhaPlaca) then
  begin
    idFazerLogin := false;
  //  idFazerLogin := true;
    GetVersaoSistema(dsVersaoSistema,ipMaquina,18) ;

   idLogado:=False;
//       cdUsuarioSistema   := 3000;

    nrBase:=1;
    idPrivilegio := 7;
    nmLogin      := 'RICARDO';
    nmlogin      := nmLogin;
    cdUsuarioSistema   := 212;
    nrCompradorSistema :=10;
    HabilitaMenu(idPrivilegio);
    Timer1.Enabled:=true;
    try
     if not TestaConexaoBase(_dm._conexao, nrBase) then
     begin
      Mensagem('N?o conectado com Servidor',16);
      close;
      exit;
     end;
    except
     on E: Exception do
     begin
      trataerro(E.Message, 'Erro ao testa conex?o com a base...');
     end;
   end;

  end;

  nmAplicacao := ExtractFileName(Application.ExeName);
  pathSistema := ExtractFilePath(Application.ExeName);



  with _frmTelaPrincipal do
  begin
    Width:=1200;
    Height:=750;
  end;

  _frmTelaPrincipal.WindowState:=wsMaximized;

  nmAplicacao := 'SisCpa MultiEmpresa - TESTE novo Vers?o.';


  try
    if FileExists(pathSistema + 'gam.jpg') then
      Image1.Picture.LoadFromFile(pathSistema + 'gam.jpg');
  except
  end;
 _frmTelaPrincipal.Caption := nmAplicacao + ' - ' + dsVersaoSistema+' Pedido Pre Elaborado Grafico 18...C';
   if idEncerraSistema then
   begin
     close;
     Application.Terminate;
     halt;
   end
   else
   begin
    if not GetVersaoSistema(dsVersaoSistema,ipMaquina,18) then
            if not GetVersaoSistema(dsVersaoSistema,ipMaquina,18) then
               Mensagem('Sistema N?o est? cadastrado no controle vers?o',16);


   end;




end;

procedure T_frmTelaPrincipal.FormShow(Sender: TObject);
begin
//  if not idLogado then
  //  LogaUsuario;

end;

procedure T_frmTelaPrincipal._acAgendaPedidoExecute(Sender: TObject);
begin
  sleep(1000);
end;

procedure T_frmTelaPrincipal.acPendenciaPorLaboratorioExecute(Sender: TObject);
begin
   Application.CreateForm(T_frmLaboratorioPendencia, _frmLaboratorioPendencia);
end;

procedure T_frmTelaPrincipal._csCadastraEventosPedidosExecute(Sender: TObject);
begin
   Application.CreateForm(T_frmCadastraEventoPedido, _frmCadastraEventoPedido);
  _frmCadastraEventoPedido.Show;
  FormPos(_frmCadastraEventoPedido, 2, 1);

end;

procedure T_frmTelaPrincipal._stbarMessagemDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  _stbarMessagem.Canvas.Brush.Color := clSkyBlue;
  _stbarMessagem.Canvas.FillRect(Rect);
  _stbarMessagem.Canvas.TextOut(Rect.Left + 18, Rect.Top, Panel.Text);
  if Saudacao = 'Bom-dia!' then
    if (Panel.Index = 1) or (Panel.Index = 0) then
      _dmImagensPequenas.ListaImagensPequenas.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 23);
  if Saudacao = 'Boa-tarde!' Then
    if (Panel.Index = 1) or (Panel.Index = 0) then
      _dmImagensPequenas.ListaImagensPequenas.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 23);
  if Saudacao = 'Boa-noite!' then
    if (Panel.Index = 1) or (Panel.Index = 0) then
      _dmImagensPequenas.ListaImagensPequenas.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 23);
  if Panel.Index = 0 then
    _dmImagensPequenas.ListaImagensPequenas.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 92);
  if Panel.Index = 2 then
    _dmImagensPequenas.ListaImagensPequenas.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 01)

end;

procedure T_frmTelaPrincipal.LogaUsuario;
begin
  if idFazerLogin then
  begin
    Timer1.Enabled:=false;
       cdsistema:=132;
   _frmTelaPrincipal.Enabled := false;
    _frmLogin := T_frmLogin.Create(Self);
    SetForegroundWindow(_frmLogin.Handle);
    _frmLogin.ShowModal;
    _frmLogin.Free;
    _frmLogin := nil;
    idLogado := true;
    Timer1.Enabled:=true;
    if idEncerraSistema then
    begin
      application.terminate;
    end;
    if (ipMaquina = '10.10.8.28')  or(ipMaquina = '10.10.8.19')  or (ipMaquina ='10.10.8.22') then
    begin
      nmLogin := 'RICARDO';
      nmlogin   := nmLogin;
      cdUsuarioSistema   := 3000;
      idPrivilegio := 7;
    end;
    HabilitaMenu(idPrivilegio);

    if nrCompradorSistema=0 then
    begin
       nrCompradorSistema :=1;
       if Confirma('Deseja Mudar Numero Comprador?',MB_DEFBUTTON1)=IDYES then
       begin
        try
         _frmCompradorDisponivel:= T_frmCompradorDisponivel.create(self);
         Application.CreateForm(T_frmCompradorDisponivel, _frmCompradorDisponivel);
         _frmCompradorDisponivel.ShowModal;
          FormPos(_frmCompradorDisponivel,2,1);
        finally
           _frmCompradorDisponivel.release;
           FreeAndNil(_frmCompradorDisponivel);
        end;
       end;
    end;


    {if cdUsuarioSistema = NrCompradorAutorizado[nrCompradorSistema] then
    begin
      nrBase:=1;
      TestaConexaoBase(_dm._conexao, nrBase);

    end
    else
      begin
        Mensagem('Sistema Indisponivel para teste',MB_ICONWARNING);
        Application.Terminate;
        halt;
      end;}

    if not getDataSistema then
    begin
      Mensagem('Data do Sistema N?o Atualizada',48);
      dtSistema := Date;
    end;
    dtPedido:=dtsistema;
    dtEmpresa:=dtSistema;
    //HabilitaMenu;
  end;
  try
    if not TestaConexaoBase(_dm._conexao, nrBase) then
    begin
      Mensagem('N?o conectado com Servidor',16);
      close;
      exit;
    end;
  except
    on E: Exception do
    begin
      trataerro(E.Message, 'Erro ao testa conex?o com a base...');
    end;

  end;
end;


procedure T_frmTelaPrincipal.Timer1Timer(Sender: TObject);
var
  msgSaudacao: String;
begin
  msgSaudacao := Saudacao + ' Hoje ? ' + formatdatetime('dddddd', dtEmpresa) +
    '    Nome Usuario :' + nmLogin + '    Ip Maq : ' + ipMaquina;
  _stbarMessagem.Panels[1].Text := msgSaudacao;
  _stbarMessagem.Panels[0].Text := 'GAM - Gen?sio A. Mendes & Cia Ltda.';
  _stbarMessagem.Panels[2].Text := 'Servidor = ' + nmBaseDados + ' Maq=' +
    NomeMaquina;
  _stbarMessagem.Repaint;

end;


Procedure T_frmTelaPrincipal.HabilitaMenu(nrPrivilegio:Integer);
begin

     if nrPrivilegio<7 then
     begin
//      acAcessoBaseProducao.Enabled:=false;
      acAcessoBaseTeste.Enabled:=false;
      acAtualizaDataAgenda.Enabled:=false;
//      acCriticaPedidoXML.Enabled:=false;
      acCorrecaoVerba.Enabled:=false;
      //acPontoEncomenda.Enabled:=FALSE;
     end;
     if nrPrivilegio>=7 then
     begin
      acAcessoBaseProducao.Enabled:=true;
      acAcessoBaseTeste.Enabled:=true;
      acAtualizaDataAgenda.Enabled:=true;
      acCorrecaoVerba.Enabled:=true;
     // acPontoEncomenda.Enabled:=TRUE;
     end;
end;

procedure T_frmTelaPrincipal.FotoErro(Sender: TObject; E: Exception);
var
  bmp : TBitmap;
  jpeg : TJPEGImage;
  dia,mes,ano,hora,min,seg, mseg : word;
begin
  bmp := TBitmap.Create;
  Clipboard.Clear;
  keybd_event(vk_snapshot,0, 0, 0);
  Application.ProcessMessages;
  bmp.LoadFromClipboardFormat(CF_BITMAP,clipboard.GetAsHandle(CF_BITMAP),0);
  jpeg := TJPEGImage.Create;
  jpeg.Assign(bmp);
  DecodeDate(now,ano,mes,dia);
  DecodeTime(now,hora,min,seg,mseg);
  jpeg.SaveToFile(ExtractFilePath(Application.ExeName) + inttostr(dia) + '.' + inttostr(mes) + '.' + inttostr(ano) + '.' + inttostr(hora) + '.' + inttostr(min) + '.' + inttostr(seg) + E.Message + '.jpg');
  jpeg.Free;
  bmp.Free;

  MessageDlg(E.Message + #13#13 +'Contate o Suporte T?cnico!',mtError, [mbOK], 0);
end;


procedure T_frmTelaPrincipal.liberarMenuUsuario;
var
  i: integer;
begin
  try
    for i := 0 to 99 do
    begin
      if telaLiberada[i].codigo > 0 then
      begin
        //telaLiberada[i].nomeMenu:=getNomeMenu(telaLiberada[i].codigo);

       // TMenuItem (telaLiberada[i].nomeMenu).Enabled:=True;

       case telaLiberada[i].codigo of


            // Botoes de atalho
          601:  acAgendaPedidos.Enabled                  :=true;
          602:  acCadastrosParamentrosArquivos.Enabled   :=true;
          603:  begin
                  acGeraPedidoVan.Enabled                  :=true;
                  acAcessoBaseTeste.Enabled                :=true;
                  acAcessoBaseProducao.Enabled             :=true;
                  acDivissaoPedido.Enabled                 :=true;
                  acAtualizaDataAgenda.Enabled             :=false;
                  acAplicaVerbaPedido.Enabled              :=true;
                  acCorrecaoVerba.Enabled                  :=true;
                  _csCadastraEventosPedidos.Enabled        :=False;

                end;
          604:  acRelacaoPedido.Enabled                     :=true;
          608:  acDadosProdutos.Enabled                     :=true;
          615:  acRelatorioClassificacao.Enabled            :=true;
          616:  acPedidoemAtraso.Enabled                    :=true;
          617:  acPendencias.Enabled                        :=true;
          618:  acPendenciaPorLaboratorio.Enabled           :=true;
          619:  acPendenciaComprador.Enabled                :=true;
          620:  acRelatorioCadastradosInativados.Enabled    :=true;
          621:  acEstoqueAcimadeXDias.Enabled               :=true;
          622:  acRelatoriodeExcesso.Enabled                :=true;
          623:  acItensEstoqueZerado.Enabled                :=true;
          624:  acRelatorioVerba.Enabled                    :=true;
          625:  acListagemVerbas.Enabled                    :=true;
          626:  acSugestaodeCompra.Enabled                  :=true;
          627:  acComparacaoAnualVenda.Enabled              :=true;
          628:  acNivelServi?o.Enabled                      :=true;
          629:  acListagemAgendaFornecedor.Enabled          :=true;

                            // Menu ciritica
          630:  acRelacacaoNfeRecebida.Enabled              :=True;
          631:  acCriticaPedidoXML.Enabled                  :=True;
          632:  acRelat?rioCriticaPedidoxXMLNFe.Enabled     :=True;
          633:  acRelatorioCriticadeQuantidade.Enabled      :=True;


       end;
      end
      else
        exit;
    end;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao montar menu do usu?rio. Detalhes: %s',[E.Message]);
  end;
end;


procedure T_frmTelaPrincipal.desabilitarMenuGeral;
var
  I : integer;
  st :string;
begin
      acCadastrosParamentrosArquivos.Enabled:=False;

      // Botoes de atalho
      acAgendaPedidos.Enabled       :=False;
      acRelacaoPedido.Enabled       :=False;

      //Menu Ferramentas do Sistemas
      acGeraPedidoVan.Enabled          :=False;
      acAcessoBaseTeste.Enabled        :=false;
      acAcessoBaseProducao.Enabled     :=false;
      acDivissaoPedido.Enabled         :=false;
      acAtualizaDataAgenda.Enabled     :=false;
      acAplicaVerbaPedido.Enabled      :=false;
      acCorrecaoVerba.Enabled          :=false;
      _csCadastraEventosPedidos.Enabled:=False;

      // menu Relatorios
      acDadosProdutos.Enabled                  :=False;
      acRelatorioClassificacao.Enabled         :=False;
      acPedidos.Enabled                        :=False;
      acPedidoemAtraso.Enabled                 :=False;
      acRelacaoPedido.Enabled                  :=False;
      acPendencias.Enabled                     :=False;
      acPendenciaPorLaboratorio.Enabled        :=False;
      acPendenciaComprador.Enabled             :=False;
      acPendenciaComprador.Enabled             :=False;
      acRelatorioCadastradosInativados.Enabled :=false;
      acEstoqueAcimadeXDias.Enabled            :=false;
      acRelatoriodeExcesso.Enabled             :=false;
      acItensEstoqueZerado.Enabled             :=false;
      acRelatorioVerba.Enabled                 :=false;
      acListagemVerbas.Enabled                 :=false;
      acListagemAgendaFornecedor.Enabled       :=false;
      acSugestaodeCompra.Enabled               :=false;
      acComparacaoAnualVenda.Enabled           :=false;
      acNivelServi?o.Enabled                   :=false;

      // Menu ciritica
      acRelacacaoNfeRecebida.Enabled           :=False;
      acCriticaPedidoXML.Enabled               :=False;
      acCriticaPedidoXML.Enabled               :=False;
      acRelat?rioCriticaPedidoxXMLNFe.Enabled  :=False;
      acRelatorioCriticadeQuantidade.Enabled   :=False;
      acPontoEncomenda.Enabled                 :=False;




end;

end.
