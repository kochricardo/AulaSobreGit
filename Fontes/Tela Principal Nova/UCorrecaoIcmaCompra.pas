unit UCorrecaoIcmaCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, StdCtrls, ComCtrls,uRotinasGenericas,SqlExpr,
  Buttons;

type
  T_frmCorrecaoIcmCompra = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _cdsItemSemIcmCompra: TClientDataSet;
    _dsItemSemIcmCompra: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
   Function AbreItensComProblemas:TClientDataSet;
    function GetListaprecoNova(vlPrecoFornecedor,
                               pcDescontoAbatimento: Double;
                               nrListaPreco,
                               nrProduto,
                               nrEmpresa: Integer;
                               idPrecoAtual: String;
                               dtPedido: TDATE): TListaPreco;
    function CorrigeItem(PnrPedido, PnrProduto, PnrEmpresa: Integer;
      PpcICMS: Double): Boolean;
    function AtualizaItemPedidoI(PnrPedido, PnrProduto, PnrQuantidadePedido,
      PnrQuantidadeChegou, PnrPrazoItem, PnrVerba, PnrQuantidadeBonificada,
      PnrCodigoOperadorLogistico, PnrDiasEstoque,
      PnrQuantidadeSugerida: INTEGER; PIdStatusItem, PidMargem,
      PidDescontoAcumulativo: String; PpcDescontoPadrao, PpcDescontoAdicional,
      PpcDescontoFinanceiro, PpcVerba, PpcBonificacao, PpcDescontoOL,
      PvlPrecoUnitario, PvlPrecoFabrica, PvlPrecoCusto, PvlMargemPadrao,
      PvlMargemNegociada, PvlVerba, PvlMediaVenda: Double;
      PnmTelaAlteracao: String; PcdEmpresa: Integer; PpcICMSCOMPRA: Double;
      PcdListaCOMPRA: Integer; PidAtualizaDesconto,
      PidPedidoBonificado: Boolean): Boolean;
    function CorrigeEmpresaItem(PnrPedido, PnrProduto,
      PcdEmpresaAtual: Integer): Boolean;
    function CorrigePC_ICMS_EmpresaItem(PnrPedido, PnrProduto,
      PcdEmpresaAtual: Integer; PpcCreditoIcmsCompra: Double): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCorrecaoIcmCompra: T_frmCorrecaoIcmCompra;
  ListaPreco:  TListaPreco;
  PrecoItem: TCalculoPreco;

implementation

uses uAuxiliarCompras, uDm, uProduto;



{$R *.dfm}

Function T_frmCorrecaoIcmCompra.AbreItensComProblemas:TClientDataSet;
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


   SQL.Add('SELECT nrom_y,NROP_P ,c.cd_empresa, cd_empresa_destino,i.cd_empresa as cd_empresaITEM,CD_LISTA_COMPRA  FROM');
   SQL.Add('prddm.dcpcc C,');
   SQL.Add('prddm.dcpci i');
   SQL.Add('WHERE');
   SQL.Add('nrop_p=nrop_y');
   //SQL.Add('AND i.cd_empresa<>c.cd_empresa');
   SQL.Add('AND sity_y IN(''N'',''P'')');
   SQL.Add('AND PC_CREDITO_ICMS>=0');
   SQL.Add('AND CD_LISTA_COMPRA>0');




    {  SQL.Add('SELECT DATP_P,NROP_P,NROM_Y, c.CD_EMPRESA,CD_EMPRESA_DESTINO,');
      SQL.Add('PC_ICMS_COMPRA, CD_LISTA_COMPRA,nr_dv_mercadoria,');
      SQL.Add('nr_operador_logistico,abty_y,DADY_Y,quay_y');
      SQL.Add(',pc_verba,NRVV_Y');
      SQL.Add('FROM PRDDM.DCPCC C,PRDDM.DCPCI I,prddm.dc_mercadoria');
      SQL.Add('WHERE SITP_P IN(''N'',''P'') AND SITy_y IN(''N'',''P'') and ');
      SQL.Add('NROP_P=NROP_Y');
      SQL.Add('and cd_mercadoria=NROM_Y');
      SQL.Add('and c.CD_EMPRESA<> CD_EMPRESA_DESTINO ');
     // SQL.Add('and i.cd_empresa<>c.cd_empresa');
      SQL.Add('AND nrop_p=129936'); }
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




procedure T_frmCorrecaoIcmCompra.BitBtn1Click(Sender: TObject);
begin
  //_cdsItemSemIcmCompra.Close;
  _cdsItemSemIcmCompra:=AbreItensComProblemas;

  if _cdsItemSemIcmCompra<>nil then
  begin
    _dsItemSemIcmCompra.DataSet:=_cdsItemSemIcmCompra;
    _cdsItemSemIcmCompra.Open;
  end;



end;



procedure T_frmCorrecaoIcmCompra.BitBtn2Click(Sender: TObject);
var
 nrPedido,
 nrProduto,
 nrEmpresa,
 cdLista ,
 qtPedido,
 nrDigitoMercadoria,
 NroperadorLogistico,
 nrVerba :Integer;
 Mercadoria:TMercadoria;
 pcDescontoPadrao,
 pcDescontoAdicional,
 vlPrecoLista,
 PCvERBA,
 vlVerba:Double;
 dtPedido :Tdate;

DadosFornecedor: TDadosFornecedor;

listaPreco:TListaPreco;



begin

  if _cdsItemSemIcmCompra.Active then
  begin
      while Not _cdsItemSemIcmCompra.Eof do
      begin
         nrPedido := _cdsItemSemIcmCompra.FieldByName('NROP_P').AsInteger;
         cdLista := _cdsItemSemIcmCompra.FieldByName('CD_LISTA_COMPRA').AsInteger;
         nrProduto:= _cdsItemSemIcmCompra.FieldByName('NROM_Y').AsInteger;
         nrEmpresa:= _cdsItemSemIcmCompra.FieldByName('cd_empresa').AsInteger;


     listaPreco:= GetListaprecoNova( 0,//vlPrecoFornecedor,
                            0,//   pcDescontoAbatimento: Double;
                            cdLista,//   nrListaPreco,
                            nrProduto,///   nrProduto,
                            nrEmpresa,//   nrEmpresa: Integer;
                            'N',// idPrecoAtual: String;
                           dtPedido);

        if listaPreco.PcIcmsCompra>0 then
                    CorrigePC_ICMS_EmpresaItem(nrPedido,
                                                nrProduto,
                                                 1,
                                                listaPreco.PcIcmsCompra);




 
          _cdsItemSemIcmCompra.Next;
      end;
  end;


end;

FUNCTION T_frmCorrecaoIcmCompra. GetListaprecoNova(vlPrecoFornecedor,
                               pcDescontoAbatimento: Double;
                               nrListaPreco,
                               nrProduto,
                               nrEmpresa: Integer;
                               idPrecoAtual: String;
                               dtPedido: TDATE): TListaPreco;
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
      SQL.Add('SELECT CD_LISTA_GAM,VL_LISTA_ANTERIOR  , VL_UNITARIO_COMPRA  ,');
      SQL.Add('PC_ICMS_COMPRA,VL_BASE_COMPRA,PC_IPI_MERCADORIA,PC_MUDANCA_PRECO');
      SQL.Add('FROM');
      SQL.Add('(SELECT CD_LISTA_GAM,VL_LISTA_ANTERIOR  , VL_UNITARIO_COMPRA ,');
      SQL.Add('nvl(PC_ICMS_COMPRA,0) as PC_ICMS_COMPRA ,nvl(VL_BASE_COMPRA,0) as VL_BASE_COMPRA,');
      SQL.Add('nvl(PC_IPI_MERCADORIA,0) as PC_IPI_MERCADORIA,NVL(PC_MUDANCA_PRECO,0) AS PC_MUDANCA_PRECO');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR');
      SQL.Add('WHERE');
      SQL.Add('CD_MERCADORIA=:PnrProduto');
      SQL.Add('and CD_EMPRESA=:PnrEmpresa');
     SQL.Add('and CD_LISTA_GAM =:PcdListao');
      SQL.Add('order by Trunc(DT_MUDANCA_PRECO) desc)');
      SQL.Add('where');
      SQL.Add('ROWNUM<=1');

      ParamByName('PcdListao').AsBCD := nrListaPreco;
      ParamByName('PnrProduto').AsInteger := nrProduto;
      ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
      Open;
    end;
    vlPrecoFornecedorAnterior := vlPrecoFornecedor;
    nrListaPreco := 0;
    Result.vlPrecoBase     := 0;
    Result.PcIcmsCompra    := 0;
    Result.PcIPILista      := 0;
    Result.PcDescontoLista  := 0;
    if not QryTemp.IsEmpty then
    begin
      Result.vlPrecoLista    := QryTemp.FieldByName('VL_UNITARIO_COMPRA').AsFloat *pcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco    := QryTemp.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase     := QryTemp.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra    := QryTemp.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista           := QryTemp.FieldByName('PC_IPI_MERCADORIA').AsFloat;

      if idPrecoAtual = 'N' then
      begin
        Result.vlPrecoLista     := QryTemp.FieldByName('VL_LISTA_ANTERIOR').AsFloat  * pcDescontoAbatimento;
        Result.pcReajustePreco  := QryTemp.FieldByName('PC_MUDANCA_PRECO').AsFloat;
        Result.nrListaPreco     := QryTemp.FieldByName('CD_LISTA_GAM').AsInteger;
        Result.PcIcmsCompra     := QryTemp.FieldByName('PC_ICMS_COMPRA').AsFloat;
      end;
      if Result.pcReajustePreco < 0 then
        Result.pcReajustePreco := 0
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;


FUNCTION T_frmCorrecaoIcmCompra.CorrigeItem(PnrPedido,
                                            PnrProduto,
                                            PnrEmpresa:Integer;
                                            PpcICMS:Double):Boolean ;

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
      SQL.Add('pc_icms_compra=:PpcIcm WHERE nrop_y=:PnrPedido AND nrom_y=:PnrProduto');
      SQL.Add('and cd_empresa=:PnrEmpresa');

      ParamByName('PpcIcm').AsBCD := PpcICMS;
      ParamByName('PnrPedido').AsBCD := PnrPedido;
      ParamByName('PnrProduto').AsInteger := PnrProduto;
      ParamByName('PnrEmpresa').AsInteger := PnrEmpresa;

       Result:=true;
      if ExecSQL(false)<=0 then
         Result:=false;

    end;
  except


  end;
 end;



 function T_frmCorrecaoIcmCompra.AtualizaItemPedidoI(PnrPedido,
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
                                                    PidAtualizaDesconto,
                                                    PidPedidoBonificado :Boolean): Boolean;
Var
  QryTemp: TSQLQuery;
  stTemp: String;
  DaDosPedido:TDadosValoresPedido;
  DadosItemPedidoLog :TDadosItemPedido;

begin
 try
  try
  //   if nrDiasEstoque>999 then
    //    nrDiasEstoque:=999;

   QryTemp := TSQLQuery.Create(NIL);
   QryTemp := _dm.criaQueryGenerica;
   QryTemp.Close;
   QryTemp.SQL.Clear;
   QryTemp.SQL.Add('Update PRDDM.DCPCI set');
   QryTemp.SQL.Add('QUAY_Y=:PnrQuantidadePedido');
   QryTemp.SQL.Add(',PRZY_Y=:PnrPrazoItem');
   QryTemp.SQL.Add(',NRVV_Y=:PnrVerba');
   QryTemp.SQL.Add(',QT_BONIFICADA=:PnrQuantidadeBonificada');
//   QryTemp.SQL.Add(',NR_DIAS_ESTOQUE=:PnrDiasEstoque');
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
   QryTemp.SQL.Add(',CD_LISTA_COMPRA=:PcdLISTACOMPRA');

   if PidAtualizaDesconto then
      QryTemp.SQL.Add(',PC_DESCONTO_NEGOCIADO=:PPC_DESCONTO_NEGOCIADO');

//   QryTemp.SQL.Add(',VL_MEDIA_VENDA=:PvlMediaVenda');
   QryTemp.SQL.Add('Where');
   QryTemp.SQL.Add(' NROP_Y=:PnrPedido');
   QryTemp.SQL.Add(' AND NROM_Y=:PnrProduto');
   QryTemp.SQL.Add(' AND SITY_Y in(''N'',''S'',''C'',''I'')');
   stTemp := QryTemp.Text;

     if (PnrCodigoOperadorLogistico>1) or (PpcDescontoAdicional=0) and (PidPedidoBonificado=false) then
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
     ParamByName('PnrVerba').AsInteger := PnrVerba;
     ParamByName('PnrQuantidadeBonificada').AsInteger :=PnrQuantidadeBonificada;
 //  ParamByName('PnrCodigoOperadorLogistico').AsInteger :=nrCodigoOperadorLogistico;
 //    ParamByName('PnrDiasEstoque').AsInteger := PnrDiasEstoque;
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
     ParamByName('PvlPrecoCusto').AsBCD := TruncaValor(PvlPrecoCusto,5);
     ParamByName('PvlMargemPadrao').AsBCD := PvlMargemPadrao;
     ParamByName('PvlMargemNegociada').AsBCD := PvlMargemNegociada;
     ParamByName('PvlVerba').AsBCD := PnrQuantidadePedido * PvlVerba;
     ParamByName('PcdEmpresa').AsBCD := PcdEmpresa;
     ParamByName('PnrPedido').AsInteger := PnrPedido;
     ParamByName('PnrProduto').AsInteger := PnrProduto;



    ParamByName('PpcICMSCOMPRA').AsBCD:=PpcICMSCOMPRA;
    ParamByName('PcdLISTACOMPRA').AsBCD:=PcdListaCOMPRA;



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



Function T_frmCorrecaoIcmCompra.CorrigeEmpresaItem(PnrPedido,PnrProduto,PcdEmpresaAtual:Integer):Boolean;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    with QryTemp do
    begin
      Close;
      SQL.Add('Update  prddm.dcpci i set cd_empresa=:PcdEmpresaAtual');
      SQL.Add('WHERE');
      SQL.Add('nrop_y=:PnrPedido');
      SQL.Add('AND NROM_Y=:PnrProduto');
      SQL.Add('AND sity_y IN(''N'',''P'')');
      ParamByName('PcdEmpresaAtual').AsBCD:=PcdEmpresaAtual;
      ParamByName('PnrPedido').AsBCD:=PnrPedido;
      ParamByName('PnrProduto').AsBCD:=PnrProduto;
      Result:=false;
     if ExecSQL(false)<=0 then
        Result:=false;

    end;
finally

end;
end;


Function T_frmCorrecaoIcmCompra.CorrigePC_ICMS_EmpresaItem(PnrPedido,
                                                           PnrProduto,
                                                           PcdEmpresaAtual:Integer;
                                                           PpcCreditoIcmsCompra:Double):Boolean;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    with QryTemp do
    begin
      Close;
      SQL.Add('Update  prddm.dcpci i set PC_CREDITO_ICMS=:PC_CREDITO_ICMS');
      SQL.Add('WHERE');
      SQL.Add('nrop_y=:PnrPedido');
      SQL.Add('AND NROM_Y=:PnrProduto');
      SQL.Add('AND sity_y IN(''N'',''P'')');
      ParamByName('PC_CREDITO_ICMS').AsBCD:=PpcCreditoIcmsCompra;
      ParamByName('PnrPedido').AsBCD:=PnrPedido;
      ParamByName('PnrProduto').AsBCD:=PnrProduto;
      Result:=false;
     if ExecSQL(false)<=0 then
        Result:=false;

    end;
finally

end;
end;



end.
