
unit uSistemaCompras;

interface

uses
  windows,
  Classes,
  Controls,
  SqlExpr,
  Graphics,
  WinSock,
  forms,
  Dialogs,
  Messages,

  SysUtils,
  DBGrids,
  DB,
  dBClient,
  //StdCtrls,
   dateUtils, UtilConexao,
   ComObj,
   Commctrl, Variants, uDm, uRotinasGenericas;
type
 TDadosPedido = record
 nrPedido,
 nrLaboratorio,
 nrItens,
 nrUnidades,
 nrPrazoPadrao,
 cdEmpresa,
 cdComprador:Integer;
 pcDescontoComercial,
 pcDescontoEspecial,
 vlLiquidoPedido,
 vlBrutoPedido :Double;
 stRazaoSocial,
 stNomeFantasia,
 idSituacaoPedido,
 stObservacao:String;
 dtPedido,
 dtPrevistaEntrega,
 dtDigitacao :Tdate;
end;

//Function AlteraStatusItemPedido(PnrPedido,PnrProduto,PnrEmpresa:Integer;PnnLogin:String):boolean;
function AbreEventoPedidoCompra(nrPedido:Integer;dtEvento:TDate):boolean;
Function GetDadosPedidoI(nrPedido,nrProduto:Integer):TDadosPedido;
function GravaLogPedidoCompraNova(PnrPedido:Integer;PnmUsuario:String):Boolean;

function InsereEventoPedidoCompra(PnrPedido:Integer;
                                  PdtPedido,
                                  PdtTransmissao:Tdate;
                                  PnrComprador:Integer;
                                  PnrCNPJLaboratorio:Longint;
                                  PnrLaboratorio:Integer;
                                  PvtPedido:Double;
                                  PnrLinhaPedido:Integer;
                                  PqtUnidadePedido:Integer;
                                  PidSituacao:Char;
                                  PdtAtualizacao:Tdate;
                                  PnmUsuario:String;
                                  PcdEmpresa:Integer):boolean;

function GravaEventoLogPedidoCompra(PsqEvtLogCompra,
                                    PnrPedido:Integer;
                                    PdtPedido:Tdate;
                                    PnrNfeE,
                                    PnrNfeSerie,
                                    PcdEvento :Integer;
                                    PdsObservacao:String;
                                    PdtAtualizacao:Tdate;
                                    PnmLogin:String;
                                    PcdEmpresa:Integer):Boolean;

function GravaLogPedidoCompra(PnrPedido,
                              PnrMercadoria,
                              PqtAnterior,
                              PqtAtual:Integer;
                              PpcDescontoAnterior,
                              PpcDescontoAtual:Double;
                              PnrVerbaAnterior,
                              PnrVerbaAtual:Integer;
                              PpcVerbaAnterior,
                              PpcVerbaAtual:Double;
                              PnmUsuario:String;
                              PidStatusAnterior,
                              PidStatusAtual:String;
                              PqtSugeridaAnterior,
                              PqtSugeridaAtual:Integer):Boolean;


implementation

function AbreEventoPedidoCompra(nrPedido:Integer;dtEvento:TDate):boolean;
var
  qryTemp :TSQLQuery;
begin
 try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    qryTemp.SQL.Add('Select CD_PEDIDO');
    qryTemp.SQL.Add('from');
    qryTemp.SQL.Add('GAMNFE.DC_EVT_PEDIDO_COMPRA');
    qryTemp.SQL.Add('where');
    qryTemp.SQL.Add('CD_PEDIDO= :Pnrpedido');
    qryTemp.ParamByName('Pnrpedido').AsBCD:=nrPedido;
    qryTemp.Open;
    Result:=false;
    if not qryTemp.IsEmpty then
       Result:=true;
 finally
  FreeAndNil(qryTemp);
 end;
end;


function InsereEventoPedidoCompra(PnrPedido:Integer;
                                  PdtPedido,
                                  PdtTransmissao:Tdate;
                                  PnrComprador:Integer;
                                  PnrCNPJLaboratorio:Longint;
                                  PnrLaboratorio:Integer;
                                  PvtPedido:Double;
                                  PnrLinhaPedido:Integer;
                                  PqtUnidadePedido:Integer;
                                  PidSituacao:Char;
                                  PdtAtualizacao:Tdate;
                                  PnmUsuario:String;
                                  PcdEmpresa:Integer):boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
   if PnrLaboratorio>0 then
   begin
   if not AbreEventoPedidoCompra(PnrPedido,PdtPedido) then
   begin
    qryTemp.SQL.Add('Insert into GAMNFE.DC_EVT_PEDIDO_COMPRA');
    qryTemp.SQL.Add('( CD_PEDIDO,DT_PEDIDO,DT_TRANSMISSAO_PEDIDO,CD_COMPRADOR,');
    qryTemp.SQL.Add('CD_CNPJ_FORNECEDOR,CD_LABORATORIO,VT_PEDIDO,QT_LINHA_PEDIDO,');
    qryTemp.SQL.Add('QT_UNIDADE_PEDIDO,ID_SITUACAO,DT_ATUALIZACAO,NM_USUARIO,CD_EMPRESA)');
    qryTemp.SQL.Add('VALUES(:CD_PEDIDO,:DT_PEDIDO,:DT_TRANSMISSAO_PEDIDO,:CD_COMPRADOR,');
    qryTemp.SQL.Add(':CD_CNPJ_FORNECEDOR,:CD_LABORATORIO,:VT_PEDIDO,:QT_LINHA_PEDIDO,');
    qryTemp.SQL.Add(':QT_UNIDADE_PEDIDO,:ID_SITUACAO,sysdate,:NM_USUARIO,:CD_EMPRESA)');
     if dtPedido=0 then
        dtPedido:=date;
    qryTemp.Params.ParamByName('CD_PEDIDO').AsBCD      := PnrPedido;
    qryTemp.Params.ParamByName('DT_PEDIDO').AsString   := FormatDateTime('dd/mm/yyyy',PdtPedido);
    qryTemp.Params.ParamByName('CD_EMPRESA').AsBCD      := PcdEmpresa;
    qryTemp.ParamByName('DT_TRANSMISSAO_PEDIDO').AsString   := FormatDateTime('dd/mm/yyyy',PdtTransmissao);
    qryTemp.ParamByName('CD_COMPRADOR').AsBCD:= PnrComprador;
    qryTemp.ParamByName('CD_CNPJ_FORNECEDOR').AsBCD:= PnrCNPJLaboratorio;
    qryTemp.ParamByName('CD_LABORATORIO').AsBCD:= PnrLaboratorio;
    qryTemp.ParamByName('VT_PEDIDO').AsBCD:= PvtPedido;
    qryTemp.ParamByName('QT_LINHA_PEDIDO').AsInteger:= PnrLinhaPedido;
    qryTemp.ParamByName('QT_UNIDADE_PEDIDO').AsBCD:= PqtUnidadePedido;
    qryTemp.ParamByName('ID_SITUACAO').AsString:= PidSituacao;
    qryTemp.ParamByName('NM_USUARIO').AsString:= PnmUsuario;
   end
   else
   begin

    if PqtUnidadePedido>999999 then
       PqtUnidadePedido:=999999;

    qryTemp.SQL.Add('Update GAMNFE.DC_EVT_PEDIDO_COMPRA set');
    qryTemp.SQL.Add('DT_TRANSMISSAO_PEDIDO = :DT_TRANSMISSAO_PEDIDO,');
    qryTemp.SQL.Add('CD_COMPRADOR = :CD_COMPRADOR,');
    qryTemp.SQL.Add('CD_CNPJ_FORNECEDOR =:CD_CNPJ_FORNECEDOR,');
    qryTemp.SQL.Add('CD_LABORATORIO =:CD_LABORATORIO,VT_PEDIDO=:VT_PEDIDO,QT_LINHA_PEDIDO=:QT_LINHA_PEDIDO,');
    qryTemp.SQL.Add('QT_UNIDADE_PEDIDO =:QT_UNIDADE_PEDIDO,ID_SITUACAO=:ID_SITUACAO,DT_ATUALIZACAO=sysdate,');
    qryTemp.SQL.Add('NM_USUARIO=:NM_USUARIO,CD_EMPRESA=:CD_EMPRESA');
    qryTemp.SQL.Add(',DT_PEDIDO=:dtPedido');

    qryTemp.SQL.Add('where CD_PEDIDO = :Pnrpedido');
    qryTemp.ParamByName('DT_TRANSMISSAO_PEDIDO').AsString   := FormatDateTime('dd/mm/yyyy',PdtTransmissao);
    qryTemp.ParamByName('dtPedido').AsString   := FormatDateTime('dd/mm/yyyy',PdtPedido);
    qryTemp.ParamByName('CD_COMPRADOR').AsBCD:= PnrComprador;
    qryTemp.ParamByName('CD_CNPJ_FORNECEDOR').AsBCD:= PnrCNPJLaboratorio;
    qryTemp.ParamByName('CD_LABORATORIO').AsBCD:= PnrLaboratorio;
    qryTemp.ParamByName('VT_PEDIDO').AsBCD:= PvtPedido;
    qryTemp.ParamByName('QT_LINHA_PEDIDO').AsInteger:= PnrLinhaPedido;
    qryTemp.ParamByName('QT_UNIDADE_PEDIDO').AsBCD:= PqtUnidadePedido;
    qryTemp.ParamByName('ID_SITUACAO').AsString:= PidSituacao;
    qryTemp.ParamByName('NM_USUARIO').AsString:= PnmUsuario;
    qryTemp.ParamByName('Pnrpedido').AsBCD:=PnrPedido;
    qryTemp.ParamByName('CD_EMPRESA').AsBCD:=PcdEmpresa;
   end;
   if qryTemp.ExecSQL(false)<=0 then
      result := false
    else
      result := true;
   end;
  except
     Mensagem('Erro ao Incluir Evento Compra!!',16);
  end;
 finally
    FreeAndNil(qryTemp);
 end;

end;
function GravaEventoLogPedidoCompra(PsqEvtLogCompra,
                                    PnrPedido:Integer;
                                    PdtPedido:Tdate;
                                    PnrNfeE,
                                    PnrNfeSerie,
                                    PcdEvento :Integer;
                                    PdsObservacao:String;
                                    PdtAtualizacao:Tdate;
                                    PnmLogin:String;
                                    PcdEmpresa:integer):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    with qryTemp do
    begin
      SQL.Add('Insert into GAMNFE.DC_EVT_LOG_COMPRA');
      SQL.Add('(SQ_EVT_LOG_COMPRA,');
      SQL.Add('CD_PEDIDO, DT_PEDIDO, NR_NFE,');
      SQL.Add('NR_NFE_SERIE, CD_EVENTO, DS_OBSERVACAO,');
      SQL.Add('DT_ATUALIZACAO, NM_USUARIO,CD_EMPRESA)');
      SQL.Add('VALUES(GAMNFE.SQ_EVT_LOG_COMPRA.NEXTVAL,');
      SQL.Add(':CD_PEDIDO, :DT_PEDIDO, :NR_NFE,');
      SQL.Add(':NR_NFE_SERIE, :CD_EVENTO, :DS_OBSERVACAO, sysdate,');
      SQL.Add(':NM_USUARIO,:CD_EMPRESA)');
      ParamByName('CD_PEDIDO').AsInteger   :=PnrPedido;
      ParamByName('DT_PEDIDO').AsDateTime  :=PdtPedido;
      ParamByName('NR_NFE').AsInteger      :=0;
      ParamByName('NR_NFE_SERIE').AsInteger:=0;
      ParamByName('CD_EVENTO').AsInteger   :=PcdEvento;
      ParamByName('DS_OBSERVACAO').AsString:=PdsObservacao;
      ParamByName('NM_USUARIO').AsString   :=PnmLogin;
      ParamByName('CD_EMPRESA').AsInteger   :=PcdEmpresa;
      result := true;
      if qryTemp.ExecSQL(false)<=0 then
        result := false
      end;
    except
      Mensagem('Erro ao Incluir Log Evento Compra!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;


function GravaLogPedidoCompra(PnrPedido,
                              PnrMercadoria,
                              PqtAnterior,
                              PqtAtual:Integer;
                              PpcDescontoAnterior,
                              PpcDescontoAtual:Double;
                              PnrVerbaAnterior,
                              PnrVerbaAtual:Integer;
                              PpcVerbaAnterior,
                              PpcVerbaAtual:Double;
                              PnmUsuario:String;
                              PidStatusAnterior,
                              PidStatusAtual:String;
                              PqtSugeridaAnterior,
                              PqtSugeridaAtual:Integer):Boolean;



var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    with qryTemp do
    begin
        SQL.Add('Insert into PRDDM.DC_LOG_PEDIDO_COMPRA');
        SQL.Add('(nr_pedido,cd_meradoria,qt_anterior,qt_atual,pc_desc_anterior,');
        SQL.Add('pc_desc_atual,nr_verba_anterior,nr_verba_atual,');
        SQL.Add('pc_verba_anterior,pc_verba_atual,nm_usuario,dt_alteracao,');
        SQL.Add('id_item_pedido_compra_anterior,id_item_pedido_compra_atual,');
        SQL.Add('qt_sugerida_anterior,qt_sugerida_atual)');
        SQL.Add('VALUES(:PnrPpedido,:PcdMeradoria,:PqtAnterior,');
        SQL.Add(':Pqtatual,:Ppcdescanterior,');
        SQL.Add(':PpcdescAtual,:PnrverbaAnterior,:PnrverbaAatual,');
        SQL.Add(':PpcVerbaAanterior,:PpcVerbaAatual,:PnmUsuario,sysdate,');
        SQL.Add(':PidItemPedidoCompraAnterior,:PidItemPedidoCompraAtual,');
        SQL.Add(':PqtSugeridaAnterior,:PqtSugeridaAtual)');

        ParamByName('PnrPpedido').AsInteger:=PnrPedido;
        ParamByName('PcdMeradoria').AsInteger:=PnrMercadoria;
        ParamByName('PqtAnterior').AsInteger:=PqtAnterior;
        ParamByName('Pqtatual').AsInteger:=PqtAtual;
        ParamByName('Ppcdescanterior').AsBCD:=PpcDescontoAnterior;
        ParamByName('PpcdescAtual').AsBCD:=PpcDescontoAtual;
        ParamByName('PnrverbaAnterior').AsInteger:=PnrVerbaAnterior;
        ParamByName('PnrverbaAatual').AsInteger:=PnrVerbaAtual;
        ParamByName('PpcVerbaAanterior').AsBCD:=PpcVerbaAnterior;
        ParamByName('PpcVerbaAatual').AsBCD:=PpcVerbaAtual;
        ParamByName('PnmUsuario').AsString:=PnmUsuario;
        ParamByName('PidItemPedidoCompraAnterior').AsString:=PidStatusAnterior;
        ParamByName('PidItemPedidoCompraAtual').AsString:=PidStatusAtual;
        ParamByName('PqtSugeridaAnterior').AsInteger:=PqtSugeridaAnterior;
        ParamByName('PqtSugeridaAtual').AsInteger:=PqtSugeridaAtual;
        result := true;
        if qryTemp.ExecSQL(false)<=0 then
        result := false
      end;
    except
      Mensagem('Erro ao Incluir Log Evento Compra!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;


function GravaLogPedidoCompraNova(PnrPedido:Integer;PnmUsuario:String):Boolean;
var
  qryTemp :TSQLQuery;
begin
 try
   try
    qryTemp:= TSQLQuery.Create(NIL);
    qryTemp.SQLConnection:=_dm._conexao;
    with qryTemp do
    begin
        SQL.Add('Insert into PRDDM.DC_LOG_PEDIDO_COMPRA');
        SQL.Add('(nr_pedido,');
        SQL.Add('cd_meradoria,');
        SQL.Add('qt_anterior,');
        SQL.Add('qt_atual,');
        SQL.Add('pc_desc_anterior,');
        SQL.Add('pc_desc_atual,');
        SQL.Add('nr_verba_anterior,');
        SQL.Add('nr_verba_atual,');
        SQL.Add('pc_verba_anterior,');
        SQL.Add('pc_verba_atual,');
        SQL.Add('nm_usuario,');
        SQL.Add('dt_alteracao,');
        SQL.Add('id_item_pedido_compra_anterior,');
        SQL.Add('id_item_pedido_compra_atual,');
        SQL.Add('qt_sugerida_anterior,');
        SQL.Add('qt_sugerida_atual)');
        SQL.Add('');
        SQL.Add('SELECT nrop_y,nrom_y,0,nvl(quay_y,0) as quay_y,0,abty_y+dady_y,0,nrvv_y,0,');
        SQL.Add('pc_verba,:Pnmusuario,SYSDATE,''S'',''S'',0,qt_sugerida');
        SQL.Add('FROM');
        SQL.Add('prddm.dcpci');
        SQL.Add('WHERE nrop_y=:PnrPedido');
        ParamByName('PnrPedido').AsInteger:=PnrPedido;
        ParamByName('PnmUsuario').AsString:=PnmUsuario;
        result := true;
        if qryTemp.ExecSQL(false)<=0 then
        result := false
      end;
    except
      Mensagem('Erro ao Incluir Log Evento Compra!!',16);
    end;
 finally
  FreeAndNil(qryTemp);
 end;
end;



(*******)
{Function AlteraStatusItemPedido(PnrPedido,PnrProduto,PnrEmpresa:Integer;PnnLogin:String):boolean;
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
      SQL.Add('WHEN (sity_y=''F'') or (sity_y=''P'') or (chey_y>0) THEN ''F''');
      SQL.Add('WHEN (sity_y=''S'')  or(sity_y=''I'') THEN ''I''');
      SQL.Add('else ''C''');
      SQL.Add('END');
      SQL.Add('WHERE NROP_Y=:PnrPedido');
      SQL.Add('AND CD_EMPRESA=:PcdEmpresa');
//      SQL.Add('AND ID_NFE_TRANSITO=''N''');
      if PnrProduto>0 then
         SQL.Add('and nrom_y=:PnrProduto');
      ParamByName('PnrPedido').AsInteger:=PnrPedido;
      ParamByName('PcdEmpresa').AsInteger:=PnrEmpresa;
      if PnrProduto>0 then
         ParamByName('PnrProduto').AsInteger:=PnrProduto;
      result:=true;
      if ExecSQL(false)<=0 then
      begin
        Mensagem('Pendencia Não Eliminada do Sistema',48);
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


           DaDosPedido:=GetValoresPedido(PnrPedido,false);
           if DadosPedido.nrItensPedido=0 then
              AlteraStatusPedido(PnrPedido,0,false);


    end;
  finally
    FreeAndNil(tempQuery);
  end;
end;    }



Function GetDadosPedidoI(nrPedido,nrProduto:Integer):TDadosPedido;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
      close;
      SQL.Add('SELECT');
      SQL.Add('NROP_P AS NR_PEDIDO,');
      SQL.Add('NROL_L AS NR_LABORATORIO,');
      SQL.Add('NOMT_T AS RAZO_SOCIAL,');
      SQL.Add('DATP_P AS DT_PEDIDO,');
      SQL.Add('ABTP_P AS PC_DESC_COMERCIAL,');
      SQL.Add('DESP_P AS PC_DESC_ESPECIAL,');
      SQL.Add('SITP_P AS ID_SITUACAO_PEDIDO,');
      SQL.Add('PRZP_P AS PRAZO_PADRAO,');
      SQL.Add('PREP_P AS DT_PREVISTA,');
      SQL.Add('NVL(OBSP_P,'' '') AS OBERSEVACAO,');
      SQL.Add('SIGT_T AS NOME_FANTASIA,');
      SQL.Add('SUM(PUNY_Y*QUAY_Y) AS VL_LIQUIDO,');
      SQL.Add('SUM(PFBY_Y*QUAY_Y) AS VL_FORNECEDOR,');
      SQL.Add('DT_DIGITACAO,');
      SQL.Add('Count(*) NR_ITENS,');
      SQL.Add('SUM(QUAY_Y) AS NR_UNIDADES,CAPA.CD_EMPRESA,CAPA.CD_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DCLAB,');
      SQL.Add('PRDDM.DCTAB,');
      SQL.Add('PRDDM.DCPCC CAPA,');
      SQL.Add('PRDDM.DCPCI ITEM');
      SQL.Add('WHERE');
      SQL.Add('NROL_L=NROT_T');
      SQL.Add('AND  TIPT_T=''L''');
      SQL.Add('AND NROP_P=NROP_Y');
      SQL.Add('AND NROP_P=:PnrPedido');
      if nrProduto>0 then
         SQL.Add('AND NROM_Y=:PnrPRODUTO');

      SQL.Add('AND  NROL_L=LABP_P');
      SQL.Add('AND SITP_P');
      SQL.Add('IN(''N'',''P'',''I'',''S'',''F'',''C'')');
      SQL.Add('AND COML_L=:PnrComprador');
      SQL.Add('GROUP BY');
      SQL.Add('NROP_P,');
      SQL.Add('NROL_L,');
      SQL.Add('NOMT_T,');
      SQL.Add('DATP_P,');
      SQL.Add('ABTP_P,');
      SQL.Add('DESP_P,');
      SQL.Add('SITP_P,');
      SQL.Add('PRZP_P,');
      SQL.Add('PREP_P,');
      SQL.Add('NVL(OBSP_P,'' ''),');
      SQL.Add('SIGT_T,');
      SQL.Add('DT_DIGITACAO,CAPA.CD_EMPRESA,CAPA.CD_COMPRADOR');
      ParamByName('PnrPedido').AsInteger:=nrPedido;
      ParamByName('PnrComprador').AsInteger:=nrCompradorSistema;
      if nrProduto>0 then
      ParamByName('PnrProduto').AsInteger:=nrProduto;
      open;
    end;
       Result.nrPedido     :=0;
       Result.nrLaboratorio:=0;
       Result.nrItens      :=0;
       Result.nrPrazoPadrao:=0;
       Result.nrUnidades   :=0;
       Result.cdEmpresa    :=0;
       Result.cdComprador  :=0;

       Result.pcDescontoComercial:=0;
       Result.pcDescontoEspecial :=0;
       Result.vlLiquidoPedido    :=0;
       Result.vlBrutoPedido      :=0;

       Result.dtPedido           :=0;
       Result.dtPrevistaEntrega  :=0;
       Result.idSituacaoPedido   :='S';
    if not tempQuery.IsEmpty then
    begin
       Result.nrPedido     :=tempQuery.FieldByName('NR_PEDIDO').AsInteger;
       Result.nrLaboratorio:=tempQuery.FieldByName('NR_LABORATORIO').AsInteger;
       Result.nrItens      :=tempQuery.FieldByName('NR_ITENS').AsInteger;
       Result.nrPrazoPadrao:=tempQuery.FieldByName('PRAZO_PADRAO').AsInteger;
       Result.nrUnidades   :=tempQuery.FieldByName('NR_UNIDADES').AsInteger;
       Result.cdEmpresa    :=tempQuery.FieldByName('CD_EMPRESA').AsInteger;
       Result.cdComprador  :=tempQuery.FieldByName('CD_COMPRADOR').AsInteger;
       Result.idSituacaoPedido :=tempQuery.FieldByName('ID_SITUACAO_PEDIDO').AsString;

       Result.pcDescontoComercial:=tempQuery.FieldByName('PC_DESC_COMERCIAL').AsFloat;
       Result.pcDescontoEspecial :=tempQuery.FieldByName('PC_DESC_ESPECIAL').AsFloat;
       Result.vlLiquidoPedido    :=tempQuery.FieldByName('VL_LIQUIDO').AsFloat;
       Result.vlBrutoPedido      :=tempQuery.FieldByName('VL_FORNECEDOR').AsFloat;

       Result.dtPedido           :=tempQuery.FieldByName('DT_PEDIDO').AsDateTime;
       Result.dtPrevistaEntrega  :=tempQuery.FieldByName('DT_PREVISTA').AsDateTime;
    end;
  finally
    FreeAndNil(tempQuery);
  end;
end;


function SetTabelaDiasEstoque(PTabela:TClientDataSet):TClientDataSet;
begin
   if PTabela.Active then
   begin

   TfloatField(PTabela.FieldByName('VT_ESTOQUE')).DisplayLabel:='Vlr. Estoque';
   TFloatField(PTabela.FieldByName('VT_ESTOQUE')).Visible:=false;

   TfloatField(PTabela.FieldByName('VT_ESTOUE_COMPRADOR')).DisplayLabel:='Vlr.Estoque Compr.';
   TFloatField(PTabela.FieldByName('VT_ESTOUE_COMPRADOR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VT_ESTOQUE_FORNECEDOR')).DisplayLabel:='Vlr.Estoque Fornec';
   TFloatField(PTabela.FieldByName('VT_ESTOQUE_FORNECEDOR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_CMV_MEDIO_COMPRADOR')).DisplayLabel:='Vlr.CMV Compr';
   TFloatField(PTabela.FieldByName('VL_CMV_MEDIO_COMPRADOR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_CMV_MEDIO_FORNECEDOR')).DisplayLabel:='Vlr.CMV Fornec';
   TFloatField(PTabela.FieldByName('VL_CMV_MEDIO_FORNECEDOR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_CUSTO_PENDENCIA_CPR')).DisplayLabel:='Vlr.Pendenacia Compr.';
   TFloatField(PTabela.FieldByName('VL_CUSTO_PENDENCIA_CPR')).Visible:=false;

   TfloatField(PTabela.FieldByName('VL_CUSTO_PENDENCIA_FOR')).DisplayLabel:='Vlr.Pendenacia Fornec.';
   TFloatField(PTabela.FieldByName('VL_CUSTO_PENDENCIA_FOR')).Visible:=false;

   TIntegerField(PTabela.FieldByName('CD_EMPRESA')).DisplayLabel:='Empresa';
   TIntegerField(PTabela.FieldByName('CD_EMPRESA')).Visible:=false;

   TStringField(PTabela.FieldByName('LOCAL_CD')).DisplayLabel:='Local CD';
   TStringField(PTabela.FieldByName('LOCAL_CD')).DisplayWidth:=15;


   TIntegerField(PTabela.FieldByName('NR_DIAS_FORNECEDOR')).DisplayLabel:='Fornecedor';
   TIntegerField(PTabela.FieldByName('NR_DIAS_FORNECEDOR')).DisplayWidth:=10;

   TIntegerField(PTabela.FieldByName('NR_DIAS_COMPRADOR')).DisplayLabel:='Comprador';
   TIntegerField(PTabela.FieldByName('NR_DIAS_COMPRADOR')).DisplayWidth:=10;


   TIntegerField(PTabela.FieldByName('NR_DIAS_FORNECEDOR_PEN')).DisplayLabel:='Fornecedor';
   TIntegerField(PTabela.FieldByName('NR_DIAS_FORNECEDOR_PEN')).DisplayWidth:=10;

   TIntegerField(PTabela.FieldByName('NR_DIAS_COMPRADOR_PEN')).DisplayLabel:='Comprador';
   TIntegerField(PTabela.FieldByName('NR_DIAS_COMPRADOR_PEN')).DisplayWidth:=10;


   Result:=PTabela;
   end;
end;


end.
