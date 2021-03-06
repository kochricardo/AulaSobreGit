unit uPrecoDescontoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uRotinasGenericas, uAuxiliarCompras, uProduto,
  uRelatorioVerbas;

type
  T_frmPrecoDesconto = class(TForm)
    GroupBox1: TGroupBox;
    _lbePrecoFornecedorSC: TLabeledEdit;
    _lbeDescontorepasseSC: TLabeledEdit;
    _lbeDescontoPadraoSC: TLabeledEdit;
    _lbeDescontoAdicionalSC: TLabeledEdit;
    _lbePrecoNotaSC: TLabeledEdit;
    _lbeValorCreditoIcmsSC: TLabeledEdit;
    _lbePrecoCustoSC: TLabeledEdit;
    _lbeValorVerbaSC: TLabeledEdit;
    _lbeNumeroVerbaSC: TLabeledEdit;
    _lbePcVerbaSC: TLabeledEdit;
    _chkPcParaVerbaSC: TCheckBox;
    _rgbPreco: TGroupBox;
    _lbePrecoFornecedorRS: TLabeledEdit;
    _lbeDescontorepasseRS: TLabeledEdit;
    _lbeDescontoPadraoRS: TLabeledEdit;
    _lbeDescontoAdicionalRS: TLabeledEdit;
    _lbePrecoNotaRS: TLabeledEdit;
    _lbeValorCreditoIcmsRS: TLabeledEdit;
    _lbePrecoCustoRS: TLabeledEdit;
    _lbeValorVerbaRS: TLabeledEdit;
    _lbeNumeroVerbaRS: TLabeledEdit;
    _lbePcVerbaRS: TLabeledEdit;
    _chkPcParaVerbaRS: TCheckBox;
    _chkFixaDescontoAdicional: TCheckBox;
    _chkSemDescontoAdicional: TCheckBox;
    _chkDigitaPrecoNota: TCheckBox;
    _chkMostraUltimoDesconto: TCheckBox;
    _cbxListaPreco: TComboBox;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure _lbeDescontoAdicionalSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _chkDigitaPrecoNotaClick(Sender: TObject);
    procedure _lbePrecoNotaSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure _lbeNumeroVerbaSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GravaCapa(nrPedido, nrPrazoPedido,cdEmpresa,PnrDiasInformado: Integer): Boolean;
    function GravaItem(nrPedido,
                       nrMercadoria,
                       nrQuantidade,
                       nrVerba: Integer;
                       pcDescontoPadrao,
                       PcDesconAdcional,
                       pcVerba: Double;
                       cdEmpresa:Integer;
                       Ppc_ICMS_COMPRA:Double): Boolean;
    function SetPrecoItem(nrProduto, nrPedido,nrQuantidadeComprada,nrVerba: Integer;
      vlNota, pcDescontoPadrao, pcAdicional: Double):TCalculoPreco;
    procedure SetPrecoSCLocal;
    function GeraPedido(nrPedido, nrProduto,cdEmpresa, nrQuantidadePedido,nrVerba: Integer;
      pcDescontoPadrao, pcDescontoAdicional,pcVerba: Double): Integer;
    { Private declarations }
  public
    { Public declarations }
    vlPrecoFornecedor: Double;
    vlPrecoLista, vlPrecoVenda, vlPrecoNotaAnteriorSC, vlPrecoNotaAnteriorRS,
      pcDescontoRepasse, pcDescontoPadrao, pcDescontoAdicional,
      pcAliquotaIcms: Double;
    nrQuantidadeComprada,
    nrVerbaSC,nrVerbaRS: Integer;
    idForcaRepasse, idIpiLiquidoComRepasse, idIpiLiquidoSemRepasse,
      idIpiBrutoComRepasse, idIpiBrutoSemRepasse, idTipoLista: Char;
  end;

var
  _frmPrecoDesconto: T_frmPrecoDesconto;
  idTipoPedidoPreco, nrprodutoPreco, nrDigitoPreco, nrQuantidadepedidoSC,
  nrQuantidadepedidoRS, nrPedidoSCDesconto, nrPedidoRSDesconto, nrLeadTimeSC,
  nrLeaDTimeRS, nrPrazoPedidoSC, nrPrazoPedidoRS, nrOPeradorLogistico,
  nrVerbaSC,nrVerbaRS : Integer;
  pcVerbaSC,pcVerbaRS :Double;
  idPrecoAtualDesconto: Char;
  PrecoLista: TListaPreco;
  Mercadoria: TMercadoria;
  PrecoItemSC: TCalculoPreco;
  PrecoItemRS: TCalculoPreco;
  PrecoItem: TCalculoPreco;
  dsUnidadeFederacao: String[02];
  idDigitaPrecoNota: Boolean;

implementation

{$R *.dfm}

procedure T_frmPrecoDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CAFREE;
end;

procedure T_frmPrecoDesconto.FormCreate(Sender: TObject);
begin
 nrVerbaSC:=0;
 nrVerbaRS:=0;
end;

procedure T_frmPrecoDesconto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      CLOSE;
  end;
end;

procedure T_frmPrecoDesconto.FormShow(Sender: TObject);
begin
  if (idTipoPedidoPreco = 1) or (idTipoPedidoPreco = 3) then
  begin
    if _lbeDescontoAdicionalSC.CanFocus then
      _lbeDescontoAdicionalSC.SetFocus;
    vlPrecoNotaAnteriorSC := StrToFloatDef(_lbePrecoNotaSC.Text, 0);
  end;
  if (idTipoPedidoPreco = 2) or (idTipoPedidoPreco = 3) then
  begin
    if _lbeDescontoAdicionalRS.CanFocus then
      _lbeDescontoAdicionalSC.SetFocus;
    vlPrecoNotaAnteriorRS := StrToFloatDef(_lbePrecoNotaRS.Text, 0);
  end;

  if idDigitaPrecoNota then
  begin
    _chkDigitaPrecoNota.Checked := true;
    if (idTipoPedidoPreco = 1) or (idTipoPedidoPreco = 3) then
    begin
      _lbePrecoNotaSC.SetFocus;
      _lbePrecoNotaSC.SelectAll;
    end;
    if (idTipoPedidoPreco = 2) then
    begin
      _lbePrecoNotaRS.SetFocus;
      _lbePrecoNotaRS.SelectAll;
    end;

  end;

end;

procedure T_frmPrecoDesconto._chkDigitaPrecoNotaClick(Sender: TObject);
begin
  idDigitaPrecoNota := false;
  if _chkDigitaPrecoNota.Checked then
  begin
    idDigitaPrecoNota := true;
    _lbePrecoNotaSC.SetFocus;
    _lbePrecoNotaSC.SelectAll;
  end;
end;

procedure T_frmPrecoDesconto._lbeDescontoAdicionalSCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        pcDescontoAdicional := StrToFloatDef(_lbeDescontoAdicionalSC.Text, 0);

        Mercadoria := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0,0,1,'');
        if idDigitaPrecoNota then
        begin
           _lbeDescontoAdicionalSC.Text:='0,00';
           _lbeNumeroVerbaSC.SetFocus;
           _lbeNumeroVerbaSC.SelectAll;
           exit;
        end;

        if (pcDescontoAdicional + Mercadoria.pcDescontoPadrao) > 100 then
        begin
          Mensagem('Percentual de Desconto Adicional + Desc. Padr?o' + #13 +
            ' ultrapassa ? 100%',64);
          _lbeDescontoAdicionalSC.SetFocus;
          _lbeDescontoAdicionalSC.SelectAll;
          exit;
        end;
        if (pcDescontoAdicional = 0) and (not idDigitaPrecoNota) then
        begin
          nrPedidoSCDesconto := GeraPedido(0, 0,1, nrQuantidadepedidoSC,nrVerbaSC ,0, 0,0);
          SetPrecoItem(nrprodutoPreco, nrPedidoSCDesconto,nrQuantidadepedidoSC,nrVerbaSC, 0, 0, pcDescontoAdicional);
          PrecoItemSC:=PrecoItem;
          if nrQuantidadepedidoSC > 0 then
              nrPedidoSCDesconto:=GeraPedido(nrPedidoSCDesconto, Mercadoria.nrProduto, 1,nrQuantidadepedidoSC,nrVerbaSC,
                                             Mercadoria.pcDescontoPadrao,pcDescontoAdicional,0);

          SetPrecoSCLocal;
        end;
        if (pcDescontoAdicional > 0) and (not idDigitaPrecoNota) then
        begin
          SetPrecoItem(nrprodutoPreco,0,nrQuantidadepedidoSC,nrVerbaSC,0,0,pcDescontoAdicional);
          PrecoItemSC:=PrecoItem;
          SetPrecoSCLocal;
          if nrQuantidadepedidoSC=0 then
          begin
           _lbeDescontoAdicionalSC.SetFocus;
           _lbeDescontoAdicionalSC.SelectAll;
           exit;
          end;
          if nrQuantidadepedidoSC>0 then
          begin
           _lbeNumeroVerbaSC.SetFocus;
           _lbeNumeroVerbaSC.SelectAll;
          end;
        end;
      end;
  end;

end;

procedure T_frmPrecoDesconto._lbeNumeroVerbaSCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : begin
                 nrVerbaSC:=StrToIntDef(_lbeNumeroVerbaSC.Text,0);
                 if trim(_lbeNumeroVerbaSC.Text)='' then
                 begin
                   Application.CreateForm(T_frmRelatorioVerba,_frmRelatorioVerba);
                   nrVerbaSC:=0;
                   nrLaboratorioVerba:=Mercadoria.nrLaboratorio;
                   _frmRelatorioVerba.ShowModal;
                   _lbeNumeroVerbaSC.Text:=IntToStr(nrVerbaGrid);
                    nrVerbaSC:=StrToIntDef(_lbeNumeroVerbaSC.Text,0);
                   _frmRelatorioVerba.Free;

                 end;

                 if GetNumeroVerba(nrVerbaSC,Mercadoria.nrLaboratorio)=0 then
                 begin
                   Mensagem('Verba N?o Cadastrada',64);
                   _lbeNumeroVerbaSC.Clear;
                   _lbeNumeroVerbaSC.SetFocus;
                   exit;
                 end;
                 if _chkPcParaVerbaSC.Checked then
                   _lbePcVerbaSC.SetFocus
                 else
                 begin
                    _lbePcVerbaSC.Text:='100,00';
                    pcVerbaSC:=StrToFloatDef(_lbePcVerbaSC.Text,0);
                    nrPedidoSCDesconto := GeraPedido(0, 0, 1,nrQuantidadepedidoSC,nrVerbaSC,0,  pcDescontoAdicional, pcVerbaSC);
                    SetPrecoItem(nrprodutoPreco, nrPedidoSCDesconto,nrQuantidadepedidoSC,nrVerbaSC, 0, pcDescontoPadrao ,pcDescontoAdicional);
                    PrecoItemSC:=PrecoItem;
                    if nrQuantidadepedidoSC > 0 then
                        nrPedidoSCDesconto:=GeraPedido(nrPedidoSCDesconto, Mercadoria.nrProduto, 1,nrQuantidadepedidoSC,nrVerbaSC,
                                                       Mercadoria.pcDescontoPadrao,pcDescontoAdicional,pcVerbaSC);

                 end;


                end;
  end;

end;

procedure T_frmPrecoDesconto._lbePrecoNotaSCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  pcDescontoAdicionalLocal: Double;
  vlNota: Double;
begin
  case Key of
    vk_return:
      begin
        vlNota := StrToFloatDef(_lbePrecoNotaSC.Text, 0);
        if vlNota > vlPrecoNotaAnteriorSC then
        begin
          Mensagem('Pre?o da Nota n?o pode ser Maior que atual' + #13 +
            'Para Aumentar Custo do item, terar de reduzir' + #13 +
            ' o desconto Padr?o !',64);
          _lbePrecoNotaSC.SetFocus;
          _lbePrecoNotaSC.SelectAll;
          exit;
        end;
          if nrPrazoPedidoSC>0 then
             nrPrazoPedidoSC := GeraPedido(0, 0,1, 0, 0,nrVerbaSC,0,0);
          SetPrecoItem(nrprodutoPreco, 0,nrQuantidadepedidoSC,nrVerbaSC, vlNota,0,pcDescontoAdicional);
          PrecoItemSC:=PrecoItem;
          SetPrecoSCLocal;
        end;
      end;
end;

function T_frmPrecoDesconto.GravaCapa(nrPedido, nrPrazoPedido,cdEmpresa,PnrDiasInformado: Integer):Boolean;
var
 DadosPedido:TDadosCapaPedido;


begin
 DadosPedido:=AbreCapaPedido(nrPedido,0,'');
 if DadosPedido.nrPedido=0 then
 begin

  result := GravaCapaPedido(nrPedido, // NUMBER(6)
    Mercadoria.nrLaboratorio, // LABP_P :Integer;// NUMBER(6)
    dtPedido, // DATP_P :Tdate;// DATE
    0, // ABTP_P,      //  NUMBER(5,2)
    0, // DESP_P:Double;// NUMBER(5,2)
    'S', // SITP_P :String;//CHAR(1)
    nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
    dtPedido + nrLeadTimeSC, // PREP_P :Tdate;//DATE
    ' ', // OBSP_P ,// CHAR(40)
    '0', // SNRP_P :String;//  CHAR(10)
    0, // FLAP_P ,//NUMBER(1)
    0, // NR_CONDICAO_PAGTO_P :Integer;// NUMBER(6)
    nmLogin, // NM_UzSUARIO :String;//        NOT NULL VARCHAR2(10)
    strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
    dtPedido + nrLeadTimeSC,
    // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
    'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
    nrOPeradorLogistico, // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
    dsNomeComputador, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
    dtPedido, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
    dtSistema, // DT_DIGITACAO :Tdate;//  DATE
    0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
    0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
    strtodate('01/01/2039'),
    nrCompradorSistema,
    cdEmpresa,
    0,
    Mercadoria.pcGeracaoVerba,
    Mercadoria.nrGeracaoVerba,
    PnrDiasInformado ,
    cdEmpresa,'N',0,DadosPedido.nrListaPrecoExcecao); // DT_TRANSMITIDO :tdate
   end;

end;

function T_frmPrecoDesconto.GravaItem(nrPedido,
                                      nrMercadoria,
                                      nrQuantidade,
                                      nrVerba: Integer;
                                      pcDescontoPadrao,
                                      PcDesconAdcional,
                                      pcVerba: Double;
                                      cdEmpresa:Integer;
                                      Ppc_ICMS_COMPRA:Double): Boolean;
VAR

PC_REPASSE,
VL_BASE_VENDA,
pcRepasseCompra,
vlCustoGerencial :Double;

begin

   Ppc_ICMS_COMPRA:=Mercadoria.pcCreditoICMS;
   vlCustoGerencial:=Mercadoria.vlCustoGerencial;
   pcRepasseCompra :=Mercadoria.pcRepasseCompra;
   //if (PrecoLista.PcIcmsCompra>0) and (dtSistema>=StrToDate('01/12/2016')) then
     //   Ppc_ICMS_COMPRA:=precoLista.PcIcmsCompra; // SS 33688  alterado 01/09/2020


 result:=GravaItemPedidoAtual( nrPedido ,//   NUMBER(6)
    nrMercadoria,//NUMBER(6)
    nrQuantidade,//NUMBER(7)
    0,//CHEY_Y :Integer;//NUMBER(7)
    pcDescontoPadrao,// :Double;//NUMBER(5,2)
    'S',//SITY_Y :String;//CHAR(1)
    0,//PRZY_Y :Integer;//NUMBER(3)
    PrecoItem.vlPrecoLiquido ,//PUNY_Y NUMBER(17,6)
    PrecoItem.vlPrecoLista,  //PFBY_Y ,//NUMBER(17,6)
    PrecoItem.pcDescontoAdcional,// DADY_Y ,//NUMBER(5,2)
    0,//DFIY_Y ,//NUMBER(5,2)
    PrecoItem.vlPrecoCusto,// VCCI_Y :Double;//   NUMBER(17,6)
    nrVerba,// :Integer;//NUMBER(6)
    0,//VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
    0,//VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
    'n',//ID_MARGEM,//CHAR(1)
    'N',//ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
    pcVerba,// PC_VERBA,//  NUMBER(5,2)
    0,//VL_VERBA:Double;//NUMBER(13,2)
    0,//QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
    0,//PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
    0,//PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
    1,//NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
    0,//NR_DIAS_ESTOQUE,//NUMBER(3)
    0,//QT_SUGERIDA :Integer;//NUMBER(7)
    0,//VL_MEDIA_VENDA :Double;//NUMBER(13,2)
    PrecoLista.nrListaPreco,//  CD_LISTA_COMPRA:Integer;//NUMBER(6)
    PrecoLista.pcReajustePreco,
    cdEmpresa,
    Ppc_ICMS_COMPRA,
    PrecoLista.PcIPILista,
    pcRepasseCompra,
    PrecoLista.vlBaseVenda,
    PrecoLista.pcIcmsVenda,
    PrecoLista.PcIcmsCompra,
    0,//  PC_MUDANCA_PRECO:Double);:Boolean;//NUMBER(7,4) }
    vlCustoGerencial);

end;

procedure T_frmPrecoDesconto.SetPrecoSCLocal;
begin

  _lbePrecoFornecedorSC.Text := FormatFloat('###,##0.00',PrecoLista.vlPrecoLista);
  _lbeDescontorepasseSC.Text := FormatFloat('###,##0.00',Mercadoria.pcRepasseCompra);
  _lbeDescontoPadraoSC.Text := FormatFloat('###,##0.00',
    Mercadoria.pcDescontoPadrao);

  _lbeDescontoAdicionalSC.Text := FormatFloat('###,##0.00',
    pcDescontoAdicional);
  _lbePrecoNotaSC.Text := FormatFloat('###,##0.00', PrecoItemSC.vlPrecoLiquido);
  _lbeValorCreditoIcmsSC.Text := FormatFloat('###,##0.00',
    PrecoItemSC.vlCreditoIcmsCompra);
  _lbePrecoCustoSC.Text := FormatFloat('###,##0.00', PrecoItemSC.vlPrecoCusto);
  _lbeValorVerbaSC.Text := FormatFloat('###,##0.00', PrecoItemSC.vtDesconto);

end;

Function T_frmPrecoDesconto.SetPrecoItem(nrProduto, nrPedido,nrQuantidadeComprada,nrVerba: Integer;
  vlNota, pcDescontoPadrao, pcAdicional: Double):TCalculoPreco;
var
  pcDescontoAdicionalLocal: Double;

begin
  Mercadoria := GetMercadoriaNova(nrprodutoPreco, nrDigitoPreco, 0,0,1,'');
  PrecoLista := GetListaprecoNova(Mercadoria.vlPrecoCadastro,
    // Preco Fornecedor
    1, // % desconto Adcional
    0, // Nr Lista Precos --> N?o utiliza
    Mercadoria.nrProduto,1, // Nr. Produto
    idPrecoAtualDesconto, dtPedido);
  if vlNota > 0 then
  begin
    pcDescontoAdicionalLocal := CalculaDescontoAdicional
      (PrecoLista.vlPrecoLista, vlNota, Mercadoria.pcRepasseCompra,
      Mercadoria.pcDescontoPadrao);

    pcDescontoAdicional := pcDescontoAdicionalLocal;

  end;

  PrecoItem := CalculaPrecoLiquido(PrecoLista.vlPrecoLista, // Pre?o Lista
    Mercadoria.vlPrecoCadastro, // Pre?o venda Cadastro
    Mercadoria.pcRepasseCompra, Mercadoria.pcDescontoPadrao,
    pcDescontoAdicional, Mercadoria.pcCreditoICMS,
    Mercadoria.pcIpiProduto,
    precoLista.PcIPILista,
    PrecoLista.pcReajustePreco,nrQuantidadeComprada,PrecoLista.nrListaPreco, 'N',
    Mercadoria.idForcaRepasse,
    Mercadoria.idIpiLiquidoComRepasse,
    Mercadoria.idIpiLiquidoSemRepasse, Mercadoria.idIpiBrutoComRepasse,
    Mercadoria.idIpiBrutoSemRepasse, Mercadoria.idTipoListaFiscal,
    dsUnidadeFederacao, Mercadoria.idSuperfulo, Mercadoria.idIcmDestacado,
    Mercadoria.idReduzIcms, Mercadoria.idPisCofins);
  _lbeDescontoAdicionalSC.SelectAll;

end;

function T_frmPrecoDesconto.GeraPedido(nrPedido, nrProduto,cdEmpresa, nrQuantidadePedido,nrVerba
  : Integer; pcDescontoPadrao, pcDescontoAdicional,pcVerba: Double): Integer;
var
  nrPedidoLocal: Integer;
begin
  if  nrQuantidadePedido > 0 then
  begin
    result:=nrPedido;
    if nrPedido = 0 then
    begin
     result := GeraNumeroPedido('C');
     nrPedido:= result;
     if not GravaCapa(result, 0,cdEmpresa,0) then
     begin
      exit
     end;
    end;
    if (result > 0) and (nrQuantidadePedido > 0) then
      GravaItem(result,
                Mercadoria.nrProduto,
                nrQuantidadePedido,
                nrVerba,
                pcDescontoPadrao,
                pcDescontoAdicional,
                pcVerba,
                Mercadoria.nrEmpresaProduto,
                Mercadoria.pcCreditoICMS);

  end;
end;

end.
