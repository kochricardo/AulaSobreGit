unit uSqlConsultaSistemas;


interface


uses DBXCommon, sqlexpr,Sysutils,Dialogs,Forms,db,
     Windows,Math,classes,dbclient,ComObj, OleServer, Excel2000,
     DBGrids,Winsock,udm;

type
 TDadosPedido = record
   nrPedido      : Integer;
   dtPedido      : Tdate;
   idStatus      : String[1];
   qtPedido      : Integer;
   qtFaturada    : Integer;
   QtSugerida    : Integer;
   dtTransmissao : Tdate;
 end;
type
 TDadosItemNota   = record
   nrPedido      : Integer;
   dtEntrada     : Tdate;
   dtEmissao     : Tdate;
   dtValidade    : Tdate;
   qtFaturada    : Integer;
 end;


function BuscaProduto(PnrProduto, PcdProduto,PnrFornecedor,PnrCd: Integer;
                      PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                      PstEstruturaMedicamento,
                       PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;

function EntradaProduto(PnrProduto, PcdProduto,PnrFornecedor,PnrCd: Integer;
                        PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                        PstEstruturaMedicamento,
                        PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
FUNCTION UltimoPedidoCompra(PnrProduto:Integer;PnrEmpresa:Integer):TDate;
function BuscaProdutoCompleto(PnrProduto, PcdProduto,PnrFornecedor,PnrComprador,PnrCd: Integer;
                      PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                      PstEstruturaMedicamento,
                       PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
Function PosicaoEstoque(PnrProduto,PcdCDFisico: Integer):TClientDataSet;
Function VendaProdutos(PnrProduto,PcdCDFisico,PnrOperadorLogistico: Integer):TClientDataSet;
function AbreUltimasCompraLaboratorio(PnrProduto,
                                     PnrFornecedor,
                                     PnrOperadorLogistico,
                                     PcdEmpresa: Integer): TClientDataSet;
function EntradaProdutoCompleto(PnrProduto, PcdProduto,PnrFornecedor,PnrCd: Integer;
                                PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                                PstEstruturaMedicamento,
                                PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
Function AbreVendaLaboratorioMultiEmpresa(PnrProduto, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
function AbrePedidoFornecedor( PnrFornecedor,
                                     PnrOperadorLogistico,
                                     PcdEmpresa: Integer): TClientDataSet;

Function PosicaoEstoqueGeral(PnrEmpresa,PnrProduto: Integer):TClientDataSet;
function TabelaEntradaFornecedor(PnrProduto, PnrEmpresa, PnrOperadorLogistico: Integer): TClientDataSet;
Function TabeladePedido(PnrProduto, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
Function TabeladeEntrada(PnrProduto, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
Function LocalizaPedido(PnrEmpresa,PnrProduto,PnrPedido: Integer):TDadosPedido;
Function PosicaoEstoqueDiario(PnrProduto,PcdCDFisico: Integer):TClientDataSet;
function AbreUltimasCompraLaboratorioSomarizada(PnrLaboratorio,
                                      PnrOperadorLogistico,
                                      PcdEmpresa: Integer): TClientDataSet;

function PedidoCompraLaboratorio(PnrLaboratorio,
                                 PnrOperadorLogistico,
                                 PcdEmpresa: Integer): TClientDataSet;

function PedidoCompraLaboratorio90(PnrLaboratorio,
                                 PnrOperadorLogistico,
                                 PcdEmpresa: Integer): TClientDataSet;
function ItensComPedidoPendente(PnrLaboratorio,
                                PnrProduto,
                                PcdEmpresa: Integer):Boolean;
function ItemCrossdocking(PnrProduto:Integer):Boolean;


implementation

uses  uRotinasGenericas;



function BuscaProduto(PnrProduto, PcdProduto,PnrFornecedor,PnrCd: Integer;
                      PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                      PstEstruturaMedicamento,
                       PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
Var
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;

begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
  try
    with QryTemp do
    begin
      SQL.Add('SELECT SYSDATE HORA,  TBA.CD_MERCADORIA,NR_DV_MERCADORIA,');
      SQL.Add('CM.CD_GRUPO_FORNECEDOR,QT_DIAS_ZERADOS,');
      SQL.Add('M.CD_MERCADORIA*10+NR_DV_MERCADORIA as CODIGO,NM_MERCADORIA,');
      SQL.Add('DS_APRESENTACAO_MERCADORIA,');
      SQL.Add('CM.ID_CURVA_MERCADORIA, GF.CD_GRUPO_CURVA_FABRICANTE,QT_ESTOQUE_MAXIMO , QT_ESTOQUE_MINIMO,');
      SQL.Add('NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('M.ID_SITUACAO_MERCADORIA');
      SQL.Add('FROM PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      SQL.Add('(');
      SQL.Add('SELECT DISTINCT CD_MERCADORIA');
      SQL.Add('FROM PRDDM.DC_ITEM_PR_PEDIDO');
      SQL.Add('WHERE CD_ERRO_ITEM=107');
      SQL.Add('AND DT_PEDIDO >=SYSDATE-7');
      SQL.Add('AND CD_EMPRESA= :PnrCd');
      SQL.Add(') TBA,');
      SQL.Add('(');
      SQL.Add('SELECT NROM_E CD_MERCADORIA,COUNT(*) QT_DIAS_ZERADOS');
      SQL.Add('FROM PRDDM.DCEST');
      SQL.Add('WHERE CD_EMPRESA = :PnrCd');
      SQL.Add('AND QT_ESTOQUE_DISPONIVEL_VENDA=0');
      SQL.Add('AND DAEE_E BETWEEN TO_DATE( SYSDATE )-90 AND  SYSDATE');
      SQL.Add('GROUP BY NROM_E');
      SQL.Add(') TBB,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      SQL.Add('JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON CM.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA');
      SQL.Add(' maximo ON maximo.cd_grupo_curva_fabricante=GF.cd_grupo_curva_fabricante');
      SQL.Add('AND  cm.id_curva_mercadoria=maximo.id_curva_mercadoria');
      SQL.Add('LEFT OUTER JOIN  PRDDM.DC_COMPRADOR_GAM COMPRADOR ON   NR_COMPRADOR=CD_COMPRADOR');

      SQL.Add('WHERE TBA.CD_MERCADORIA = TBB.CD_MERCADORIA');
      SQL.Add('AND QT_DIAS_ZERADOS>20');
      SQL.Add('AND TBA.CD_MERCADORIA = M.CD_MERCADORIA');
      SQL.Add('AND M.CD_MERCADORIA = CM.CD_MERCADORIA');
      SQL.Add('AND M.CD_MERCADORIA = EM.CD_MERCADORIA');
      SQL.Add('AND CM.CD_EMPRESA=:PnrCd');
      SQL.Add('AND CM.CD_EMPRESA= EM.CD_EMPRESA');
      SQL.Add('AND (EM.QT_FISICO-EM.QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO-QT_BLOQUEADO)=0');
     end;
     with _cdsTemp do
     begin
       Close;
       CommandText := QryTemp.Text;
       if PcdProduto>0 then
         Params.ParamByName('PcdProduto').AsInteger := PcdProduto;
       if PnmSigla<>'' then
         Params.ParamByName('PnmSIGLA').AsString := PnmSigla;
       if PnrCd>0 then
         Params.ParamByName('PnrCD').AsInteger := PnrCd;

       open;
     end;
     RESULT := nil;
     if not _cdsTemp.IsEmpty then
     begin
      _cdsTemp.RecordCount;
     // _cdsTemp.IndexFieldNames:='NR_ITEM';
      RESULT := _cdsTemp;
    end;
  finally

  end;

end;


function BuscaProdutoCompleto(PnrProduto, PcdProduto,PnrFornecedor,PnrComprador,PnrCd: Integer;
                      PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                      PstEstruturaMedicamento,
                       PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
Var
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;
  stQry :TStringList;
begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    stQry:=TStringList.Create;
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

  try
    with QryTemp do
    begin
      SQL.Add('SELECT');
      SQL.Add('SYSDATE DATA,');
      SQL.Add('COD_PRODUTO,');
      SQL.Add('NM_MERCADORIA,');
      SQL.Add('DS_APRESENTACAO_MERCADORIA,');
      SQL.Add('QT_EMBALAGEM_COMPRA,');
      SQL.Add('SUM(ESTOQUE_SC) AS ESTOQUE_SC,');
      SQL.Add('SUM(ESTOQUE_RS) AS ESTOQUE_RS,');
      SQL.Add('SUM(MEDIA_DIA_SC) AS MEDIA_DIA_SC,');
      SQL.Add('SUM(MEDIA_DIA_RS) AS MEDIA_DIA_RS,');
      SQL.Add('SUM(MEDIA_NOVA_DIA_SC) AS MEDIA_NOVA_DIA_SC,');
      SQL.Add('SUM(MEDIA_NOVA_DIA_RS) AS MEDIA_NOVA_DIA_RS,');
      SQL.Add('CASE');
      SQL.Add('WHEN Sum(MEDIA_DIA_SC)>0 THEN Round(Sum(ESTOQUE_SC)/Sum(MEDIA_DIA_SC),0)');
      SQL.Add('WHEN Sum(MEDIA_DIA_SC)<=0 THEN Round(Sum(ESTOQUE_SC)/1)');
      SQL.Add('END DIAS_ESTOQUE_SC,');
      SQL.Add('CASE');
      SQL.Add('WHEN Sum(MEDIA_DIA_RS)>0 THEN Round(Sum(ESTOQUE_RS)/Sum(MEDIA_DIA_RS),0)');
      SQL.Add('WHEN Sum(MEDIA_DIA_RS)<=0 THEN Round(Sum(ESTOQUE_RS)/1)');
      SQL.Add('END DIAS_ESTOQUE_RS,');
      SQL.Add('LEADTIME,');
      SQL.Add('NR_FORNECEDOR,');
      SQL.Add('DS_GRUPO_FORNECEDOR,');
      SQL.Add('CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,');

      SQL.Add('MAX(CURVA_SC) AS CURVA_SC,');
      SQL.Add('MAX(CURVA_RS)AS CURVA_RS,');
      SQL.Add('CD_GRUPO_CURVA_FABRICANTE,');
      SQL.Add('QT_ESTOQUE_MAXIMO , QT_ESTOQUE_MINIMO,');
      SQL.Add('SUM(QT_VENDIDA_SC) AS QT_VENDIDA_SC,');
      SQL.Add('SUM(QT_VENDIDA_RS) AS QT_VENDIDA_RS,');
      SQL.Add('SUM(NR_DIAS_SEM_ESTOQUE_SC) AS DIAS_SEM_ESTOQUE_SC,');
      SQL.Add('SUM(NR_DIAS_SEM_ESTOQUE_RS) AS DIAS_SEM_ESTOQUE_RS,');
      SQL.Add('NR_DIAS_VENDA,');
      SQL.Add('ID_SITUACAO_MERCADORIA, max(DT_PRIMEIRA_COMPRA) as DT_PRIMEIRA_COMPRA,');
      SQL.Add('MAX(QT_DIA_VENDA_SC) AS QT_DIA_VENDA_SC,MAX(QT_DIA_VENDA_RS) AS QT_DIA_VENDA_RS');

      SQL.Add('FROM');
      SQL.Add('(SELECT');
      SQL.Add('VENDA.CD_EMPRESA,');
      SQL.Add('VENDA.CD_MERCADORIA,');
      SQL.Add('MERCADORIA.CD_MERCADORIA*10+MERCADORIA.NR_DV_MERCADORIA AS COD_PRODUTO,');
      SQL.Add('NM_MERCADORIA,');
      SQL.Add('DS_APRESENTACAO_MERCADORIA,');
      SQL.Add('QT_EMBALAGEM_COMPRA,');
      SQL.Add('MERCADORIA.ID_SITUACAO_MERCADORIA,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA=1) THEN  COMPRA_MERCADORIA.ID_CURVA_MERCADORIA');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>1) THEN  ''  ''');
      SQL.Add('END CURVA_SC,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA=4) THEN  COMPRA_MERCADORIA.ID_CURVA_MERCADORIA');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>4) THEN  ''  ''');
      SQL.Add('END CURVA_RS,');
      SQL.Add('GF.CD_GRUPO_CURVA_FABRICANTE,');
      SQL.Add('QT_ESTOQUE_MAXIMO , QT_ESTOQUE_MINIMO,');
      SQL.Add('QT_DIAS_LEADTIME_FABRICANTE LEADTIME,');
      SQL.Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR AS NR_FORNECEDOR,');
      SQL.Add('DS_GRUPO_FORNECEDOR,');
      SQL.Add('CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA=1) THEN  VENDA.QT_VENDIDA');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>1) THEN  0');
      SQL.Add('END  QT_VENDIDA_SC,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA=4) THEN  VENDA.QT_VENDIDA');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>4) THEN  0');
      SQL.Add('END  QT_VENDIDA_RS,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA=1) THEN  NVL(NR_DIAS_SEM_ESTOQUE,0)');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>1) THEN  0');
      SQL.Add('END NR_DIAS_SEM_ESTOQUE_SC,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA=4) THEN  NVL(NR_DIAS_SEM_ESTOQUE,0)');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>4) THEN  0');
      SQL.Add('END NR_DIAS_SEM_ESTOQUE_RS,');
      SQL.Add('NR_DIAS_VENDA,');
      SQL.Add('CASE');
      SQL.Add('WHEN ((NR_DIAS_VENDA-nvl(NR_DIAS_SEM_ESTOQUE,0))> 0) AND (VENDA.CD_EMPRESA=1) THEN  MEDIA_NOVA.QT_MEDIA_VENDA_DIARIA');
      SQL.Add('WHEN VENDA.CD_EMPRESA<>1 THEN 0');
      SQL.Add('WHEN  (venda.QT_DIAS_VENDA>=1) and ((NVL(venda.QT_DIAS_VENDA,0)<NR_DIAS_SEM_ESTOQUE)) AND  (VENDA.CD_EMPRESA=1) THEN MEDIA_NOVA.QT_MEDIA_VENDA_DIARIA');
      SQL.Add('END MEDIA_DIA_SC,');
      SQL.Add('CASE');
      SQL.Add('WHEN VENDA.CD_EMPRESA=1 THEN  MEDIA_NOVA.QT_MEDIA_VENDA_DIARIA');
      SQL.Add('WHEN VENDA.CD_EMPRESA<>1 THEN 0');
      SQL.Add('END MEDIA_NOVA_DIA_SC,');

      SQL.Add('CASE');
      SQL.Add('WHEN ((venda.NR_DIAS_VENDA-nvl(NR_DIAS_SEM_ESTOQUE,0))> 0) AND (VENDA.CD_EMPRESA=4) THEN  MEDIA_NOVA.QT_MEDIA_VENDA_DIARIA');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>4) THEN 0');
      SQL.Add('WHEN  (venda.QT_DIAS_VENDA>=1) AND ((venda.QT_DIAS_VENDA<NR_DIAS_SEM_ESTOQUE))  AND  (VENDA.CD_EMPRESA=4) THEN MEDIA_NOVA.QT_MEDIA_VENDA_DIARIA');
      SQL.Add('END MEDIA_DIA_RS,');
      SQL.Add('CASE');
      SQL.Add('WHEN VENDA.CD_EMPRESA=4 THEN  MEDIA_NOVA.QT_MEDIA_VENDA_DIARIA');
      SQL.Add('WHEN VENDA.CD_EMPRESA<>4 THEN 0');
      SQL.Add('END MEDIA_NOVA_DIA_RS,');
     SQL.Add('CASE');
      SQL.Add('WHEN VENDA.CD_EMPRESA =  1  THEN ESTOQUE_MERCADORIA.QT_FISICO-ESTOQUE_MERCADORIA.QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO-QT_BLOQUEADO');
      SQL.Add('WHEN VENDA.CD_EMPRESA <> 1  THEN 0');
      SQL.Add('END  ESTOQUE_SC,');
      SQL.Add('CASE');
      SQL.Add('WHEN VENDA.CD_EMPRESA =  4  THEN ESTOQUE_MERCADORIA.QT_FISICO-ESTOQUE_MERCADORIA.QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO-QT_BLOQUEADO');
      SQL.Add('WHEN VENDA.CD_EMPRESA <> 4  THEN 0');
      SQL.Add('END  ESTOQUE_RS,');
      SQL.Add('NVL(NR_DIAS_SEM_ESTOQUE,0) AS NR_DIAS_SEM_ESTOQUE,');
      SQL.Add('DT_PRIMEIRA_COMPRA,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>4) THEN 0');
      SQL.Add('WHEN  (venda.QT_DIAS_VENDA>=1) AND ((venda.QT_DIAS_VENDA<NR_DIAS_SEM_ESTOQUE))  AND  (VENDA.CD_EMPRESA=4) THEN venda.QT_DIAS_VENDA');
      SQL.Add('END QT_DIA_VENDA_RS,');
      SQL.Add('CASE');
      SQL.Add('WHEN (VENDA.CD_EMPRESA<>1) THEN 0');
      SQL.Add('WHEN  (venda.QT_DIAS_VENDA>=1) AND ((venda.QT_DIAS_VENDA<NR_DIAS_SEM_ESTOQUE))  AND  (VENDA.CD_EMPRESA=1) THEN venda.QT_DIAS_VENDA');
      SQL.Add('END QT_DIA_VENDA_SC');

      SQL.Add('');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_MERCADORIA  MERCADORIA,');
      SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA MEDIA_NOVA ON  MEDIA_NOVA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA AND MEDIA_NOVA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
      sql.Add('AND DT_VENDA_MERCADORIA = ADD_MONTHS(TRUNC(sysdate,''MONTH''),0)');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON  COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_COMPRADOR_GAM COMPRADOR  ON COMPRADOR.NR_COMPRADOR=COMPRA_MERCADORIA.CD_COMPRADOR');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA MAXIMO ON MAXIMO.CD_GRUPO_CURVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE AND  COMPRA_MERCADORIA.ID_CURVA_MERCADORIA=MAXIMO.ID_CURVA_MERCADORIA');
      SQL.Add('LEFT OUTER JOIN (SELECT CD_EMPRESA,CD_MERCADORIA,');
      SQL.Add('SUM(QT_VENDIDA) AS QT_VENDIDA,');
      SQL.Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
      SQL.Add('SUM(VT_IMPOSTO) AS VT_IMPOSTO,');
      SQL.Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
      SQL.Add('sum(QT_DIAS_VENDA) AS  QT_DIAS_VENDA,');
      SQL.Add('');
      SQL.Add('NVL(SUM(QT_DIAS_ESTOQUE_ZERO),0) AS  QT_DIAS_ESTOQUE_ZERO,');
      SQL.Add('MAX(QT_MEDIA_VENDA_DIARIA) AS QT_MEDIA_VENDA_DIARIA,');
      SQL.Add('((ADD_MONTHS(TRUNC(MAX(DT_VENDA_MERCADORIA),''MONTH''),1)  - TRUNC(MIN(DT_VENDA_MERCADORIA)))- SUM(QT_DIAS_ESTOQUE_ZERO)) NR_DIAS,');
      SQL.Add('((ADD_MONTHS(TRUNC(MAX(DT_VENDA_MERCADORIA),''MONTH''),1)  - TRUNC(MIN(DT_VENDA_MERCADORIA)))) AS NR_DIAS_VENDA,');
      SQL.Add('ADD_MONTHS(TRUNC(MAX(DT_VENDA_MERCADORIA),''MONTH''),0),');
      SQL.Add('TRUNC(MIN(DT_VENDA_MERCADORIA))');
      SQL.Add('');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA');
      SQL.Add('WHERE');
      SQL.Add('DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      SQL.Add('AND DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
      SQL.Add('GROUP BY CD_EMPRESA,CD_MERCADORIA) VENDA   ON VENDA.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA_MERCADORIA.CD_EMPRESA');
      SQL.Add('LEFT OUTER JOIN (SELECT  NROM_E,SUM(FISM_E) ,COUNT(*) NR_DIAS_SEM_ESTOQUE,CD_EMPRESA');
      SQL.Add('FROM PRDDM.DCEST');
      SQL.Add('WHERE');
      SQL.Add('DAEE_E>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      SQL.Add('AND DAEE_E<TRUNC(SYSDATE,''MONTH'')');
      SQL.Add('AND QT_ESTOQUE_DISPONIVEL_VENDA=0');
      SQL.Add('AND NROM_E=:PnrProduto');
      SQL.Add('GROUP BY NROM_E,CD_EMPRESA ) TB_SEM_ESTOQUE ON TB_SEM_ESTOQUE.NROM_E= VENDA.CD_MERCADORIA AND TB_SEM_ESTOQUE.CD_EMPRESA=VENDA.CD_EMPRESA');
      SQL.Add('');
      SQL.Add('WHERE');
      SQL.Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
//      SQL.Add('and MERCADORIA.ID_SITUACAO_MEDICAMENTO<>''I''');
      SQL.Add('AND VENDA.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA');
      SQL.Add('AND COMPRA_MERCADORIA.CD_MERCADORIA=:PnrProduto');
      SQL.Add(')');
      SQL.Add('GROUP  BY SYSDATE,COD_PRODUTO,');
      SQL.Add('NM_MERCADORIA,');
      SQL.Add('DS_APRESENTACAO_MERCADORIA,');
      SQL.Add('QT_EMBALAGEM_COMPRA,');
      SQL.Add('CD_GRUPO_CURVA_FABRICANTE,');
      SQL.Add('QT_ESTOQUE_MAXIMO , QT_ESTOQUE_MINIMO,');
      SQL.Add('LEADTIME,');
      //SQL.Add('DT_PRIMEIRA_COMPRA,');
      SQL.Add('NR_FORNECEDOR,');
      SQL.Add('DS_GRUPO_FORNECEDOR,');
      SQL.Add('CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('NR_DIAS_VENDA,ID_SITUACAO_MERCADORIA');

      stQry.add(QryTemp.Text);

      stQry.SaveToFile('C:\temp\qryMedia.sql');
    end;
    with _cdsTemp do
    begin
       Close;
       CommandText := QryTemp.Text;
       Params.ParamByName('PnrProduto').AsInteger:=PnrProduto;
       open;
     end;
     RESULT := nil;
     if not _cdsTemp.IsEmpty then
     begin
      _cdsTemp.RecordCount;
     // _cdsTemp.IndexFieldNames:='NR_ITEM';
      RESULT := _cdsTemp;
    end;
  finally

  end;

end;


function EntradaProduto(PnrProduto, PcdProduto,PnrFornecedor,PnrCd: Integer;
                        PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                      PstEstruturaMedicamento,
                       PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
Var
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;

begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
  try
    with QryTemp do
    begin

      SQL.Add('SELECT NROM_I, SUM(QUAI_I) QT_ENTRADA,DENN_YI,CD_EMPRESA');
      SQL.Add('FROM PRDDM.V_DCIOS4@SIHST');
      SQL.Add('WHERE TIPN_I=''C''');
      SQL.Add('AND DENN_YI BETWEEN  ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3) AND SYSDATE');
      SQL.Add('AND NROM_I IN ');
      SQL.Add('(SELECT TBA.CD_MERCADORIA');
      SQL.Add('FROM PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      SQL.Add('(');
      SQL.Add('SELECT DISTINCT CD_MERCADORIA');
      SQL.Add('FROM PRDDM.DC_ITEM_PR_PEDIDO');
      SQL.Add('WHERE CD_ERRO_ITEM=107');
      SQL.Add('AND DT_PEDIDO >=SYSDATE-7');
      SQL.Add('AND CD_EMPRESA= :PnrCd');
      SQL.Add(') TBA,');
      SQL.Add('(');
      SQL.Add('SELECT NROM_E CD_MERCADORIA,COUNT(*) QT_DIAS_ZERADOS');
      SQL.Add('FROM PRDDM.DCEST');
      SQL.Add('WHERE CD_EMPRESA = :PnrCd');
      SQL.Add('AND QT_ESTOQUE_DISPONIVEL_VENDA=0');
      SQL.Add('AND DAEE_E BETWEEN TO_DATE( SYSDATE )-90 AND  SYSDATE');
      SQL.Add('GROUP BY NROM_E');
      SQL.Add(') TBB,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      SQL.Add('JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON CM.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      SQL.Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA');
      SQL.Add(' maximo ON maximo.cd_grupo_curva_fabricante=GF.cd_grupo_curva_fabricante');
      SQL.Add('AND  cm.id_curva_mercadoria=maximo.id_curva_mercadoria');

      SQL.Add('WHERE TBA.CD_MERCADORIA = TBB.CD_MERCADORIA');
      SQL.Add('AND QT_DIAS_ZERADOS>20');
      SQL.Add('AND TBA.CD_MERCADORIA = M.CD_MERCADORIA');
      SQL.Add('AND M.CD_MERCADORIA = CM.CD_MERCADORIA');
      SQL.Add('AND M.CD_MERCADORIA = EM.CD_MERCADORIA');
      SQL.Add('AND CM.CD_EMPRESA=:PnrCd');
      SQL.Add('AND CM.CD_EMPRESA= EM.CD_EMPRESA');
      SQL.Add('AND (EM.QT_FISICO-EM.QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO-QT_BLOQUEADO)=0)');
      SQL.Add('GROUP BY  NROM_I, CD_EMPRESA,DENN_YI');
     end;
     with _cdsTemp do
     begin
       Close;
       CommandText := QryTemp.Text;
       if PcdProduto>0 then
         Params.ParamByName('PcdProduto').AsInteger := PcdProduto;
       if PnmSigla<>'' then
         Params.ParamByName('PnmSIGLA').AsString := PnmSigla;
       if PnrCd>0 then
         Params.ParamByName('PnrCD').AsInteger := PnrCd;

       open;
     end;
     RESULT := nil;
     if not _cdsTemp.IsEmpty then
     begin
      _cdsTemp.RecordCount;
     // _cdsTemp.IndexFieldNames:='NR_ITEM';
      RESULT := _cdsTemp;
    end;
  finally

  end;

end;



function EntradaProdutoCompleto(PnrProduto, PcdProduto,PnrFornecedor,PnrCd: Integer;
                                PnmSigla, PnmAcesso, PnmProduto, PstEstruturaPerfumaria,
                                PstEstruturaMedicamento,
                                PstFiltroSal, PstFiltroGenerico, PstFiltroSugeste: String): TClientDataSet;
Var
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;

begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
  try
    with QryTemp do
    begin

      SQL.Add('SELECT NROM_I, SUM(QUAI_I) QT_ENTRADA,DEMN_YI,DENN_YI,CD_EMPRESA,LABM_I');
      SQL.Add('FROM PRDDM.V_DCIOS4@SIHST');
      SQL.Add('WHERE TIPN_I=''C''');
      SQL.Add('AND DENN_YI BETWEEN  ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3) AND SYSDATE');
      SQL.Add('GROUP BY  NROM_I, CD_EMPRESA,DEMN_YI,DENN_YI,LABM_I');
     end;
     with _cdsTemp do
     begin
       Close;
       CommandText := QryTemp.Text;
       if PcdProduto>0 then
         Params.ParamByName('PcdProduto').AsInteger := PcdProduto;
       if PnmSigla<>'' then
         Params.ParamByName('PnmSIGLA').AsString := PnmSigla;
       if PnrCd>0 then
         Params.ParamByName('PnrCD').AsInteger := PnrCd;

       open;
     end;
     RESULT := nil;
     if not _cdsTemp.IsEmpty then
     begin
      _cdsTemp.RecordCount;
     // _cdsTemp.IndexFieldNames:='NR_ITEM';
      RESULT := _cdsTemp;
    end;
  finally

  end;

end;

function TabelaEntradaFornecedor(PnrProduto, PnrEmpresa, PnrOperadorLogistico: Integer): TClientDataSet;
Var
  QryTemp: TSQLQuery;
  _cdsTemp: TClientDataSet;

begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
  try
    with QryTemp do
    begin

      SQL.Add('SELECT SUM(QUAI_I) QT_ENTRADA,DENN_YI,CD_EMPRESA,LABM_I');
      SQL.Add('FROM PRDDM.V_DCIOS4@SIHST');
      SQL.Add('WHERE TIPN_I=''C''');
      SQL.Add('AND DENN_YI BETWEEN  ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3) AND SYSDATE');
      SQL.Add('AND NROM_I=:PnrProduto');
      SQL.Add('GROUP BY CD_EMPRESA,DENN_YI,LABM_I');
     end;
     with _cdsTemp do
     begin
       Close;
       CommandText := QryTemp.Text;
       Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
       open;
     end;
     RESULT := nil;
     if not _cdsTemp.IsEmpty then
     begin
      _cdsTemp.RecordCount;
     // _cdsTemp.IndexFieldNames:='NR_ITEM';
      RESULT := _cdsTemp;
    end;
  finally

  end;

end;


FUNCTION UltimoPedidoCompra(PnrProduto:Integer;PnrEmpresa:Integer):TDate;
Var
  QryTemp: TSQLQuery;

begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
  try
    with QryTemp do
    begin
     SQL.Add('SELECT Max(DATP_P) DT_PEDIDO');
     SQL.Add('FROM');
     SQL.Add('PRDDM.DCPCC C,');
     SQL.Add('PRDDM.DCPCI I');
     SQL.Add('WHERE');
     SQL.Add('NROP_P=NROP_Y');
     SQL.Add('AND C.CD_EMPRESA=I.CD_EMPRESA');
     SQL.Add('AND C.CD_EMPRESA=:PnrCD');
     SQL.Add('AND I.NROM_Y =:PnrProduto');
     SQL.Add('AND DATP_P <= ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3)');
     SQL.Add('ORDER BY DATP_P');;
       if PnrProduto>0 then
         Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
       if PnrEmpresa>0 then
         Params.ParamByName('PnrCD').AsInteger := PnrEmpresa;
      open;
    end;
     RESULT := 0;
     if not QryTemp.IsEmpty then
        RESULT := QryTemp.FieldByName('DT_PEDIDO').AsDateTime;

  finally
   FreeAndNil(QryTemp);
  end;

end;


Function PosicaoEstoque(PnrProduto,PcdCDFisico: Integer):TClientDataSet;
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
      Add('SELECT EXTRACT(DAY FROM DAEE_E)AS DIA,QT_ESTOQUE_DISPONIVEL_VENDA ,DAEE_E,NROM_E');
      Add('FROM');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DCEST ES');
      Add('WHERE');
      Add('CM.CD_MERCADORIA=NROM_E');
      Add('AND CM.CD_EMPRESA=ES.CD_EMPRESA');
      Add('AND CM.CD_EMPRESA=:PnrCd');
      Add('AND CM.CD_MERCADORIA =:PnrProduto');
      Add('AND DAEE_E  BETWEEN ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3) AND SYSDATE');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger :=PnrProduto;
        Params.ParamByName('PnrCd').AsInteger := PcdCDFisico;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
      begin
         _cdsTemp.IndexFieldNames:='DAEE_E';
         result:=_cdstemp
      end;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


Function PosicaoEstoqueGeral(PnrEmpresa,PnrProduto: Integer):TClientDataSet;
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
      Add('SELECT EXTRACT(DAY FROM DAEE_E)AS DIA,QT_ESTOQUE_DISPONIVEL_VENDA ,DAEE_E,NROM_E,ES.CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      Add('PRDDM.DCEST ES');
      Add('WHERE');
      Add('CM.CD_MERCADORIA=NROM_E');
      Add('AND CM.CD_EMPRESA=ES.CD_EMPRESA');
      Add('AND CM.CD_MERCADORIA =:PnrProduto');
      if PnrEmpresa>0 then
      Add('AND CM.CD_EMPRESA =:PnrEmpresa');

      Add('AND DAEE_E  BETWEEN ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3) AND SYSDATE');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger :=PnrProduto;
        if PnrEmpresa>0 then
        Params.ParamByName('PnrEmpresa').AsInteger :=PnrEmpresa;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
      begin
         _cdsTemp.IndexFieldNames:='DAEE_E';
         result:=_cdstemp
      end;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


Function VendaProdutos(PnrProduto,PcdCDFisico,PnrOperadorLogistico: Integer):TClientDataSet;
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
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
      Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
      //Add('NVL(ID_REPOSICAO_ESTOQUE,''N'') AS ID_REPOSICAO_ESTOQUE,');
      //aDD('CD_OPERADOR_LOGISTICO,');
      Add('EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) mes,');
      Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) Ano,');
      Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
      Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA MERCADORIA,');
      Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('join PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA  ON  VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR OL_FORNECEDOR ON');
      Add('OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO AND CD_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR ');
      Add('WHERE');
      Add('VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
      Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
      Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
      Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
      Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND VENDA.DT_VENDA_MERCADORIA< ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('AND  VENDA.CD_MERCADORIA=:PnrProduto');
      if PnrOperadorLogistico>1 then
        Add('AND  CD_OPERADOR_LOGISTICO>:PnrOPerador');
//      Add('AND  venda.CD_EMPRESA=:PnrCD');
      Add('GROUP BY DT_VENDA_MERCADORIA,');
      Add('COMPRA.CD_MERCADORIA,');
      // CD_OPERADOR_LOGISTICO,');
//      aDD('(ID_REPOSICAO_ESTOQUE,');
      Add('VENDA.CD_EMPRESA');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger :=PnrProduto;
        if PnrOperadorLogistico>1 then
        Params.ParamByName('PnrOperador').AsInteger :=PnrOperadorLogistico;
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


function AbreUltimasCompraLaboratorio(PnrProduto,
                                     PnrFornecedor,
                                     PnrOperadorLogistico,
                                     PcdEmpresa: Integer): TClientDataSet;

var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
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
    stQry.Add('AND SUMARIZADA.ID_SITUACAO_COMPRA<>''I''');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
  //  stQry.Add('AND COMPRA.CD_EMPRESA=:PcdEmpresa');
    stQry.Add('AND SUMARIZADA.CD_MERCADORIA=:PcdProduto');
    stQry.Add('AND SUMARIZADA.DT_COMPRA BETWEEN add_MONTHS(trunc(sysdate,''month''),-3) and SYSDATE+20');
   // stQry.Add('AND SUMARIZADA.CD_OPERADOR_LOGISTICO =:PcdOPeradorLogistico');
    stQry.Add('GROUP BY SUMARIZADA.CD_MERCADORIA , SUMARIZADA.DT_COMPRA,');
    stQry.Add('SUMARIZADA.DT_ATUALIZACAO, SUMARIZADA.NM_USUARIO,');
    stQry.Add('SUMARIZADA.ID_SITUACAO_COMPRA,COMPRA.CD_EMPRESA');

    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PcdProduto').AsInteger           := PnrProduto;
      Params.ParamByName('PnrLaboratorio').AsInteger       := PnrFornecedor;
      open;
    end;
     result := NIL;
     if NOT _cdsTemp.IsEmpty then
       result := _cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


function AbrePedidoFornecedor(PnrFornecedor,
                              PnrOperadorLogistico,
                              PcdEmpresa: Integer): TClientDataSet;

var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

   stQry.Add('SELECT  DISTINCT DATP_P, CD_EMPRESA,LABP_P');
   stQry.Add('FROM prddm.dcpcc c');
   stQry.Add('WHERE');
   stQry.Add('datp_p BETWEEN add_MONTHS(trunc(sysdate,''day''),-3) and SYSDATE');
   stQry.Add('AND sitp_p<>''I''');
   stQry.Add('and labp_p=:PnrFornecedor');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrFornecedor').AsInteger:= PnrFornecedor;
      open;
    end;
     result := NIL;
     if NOT _cdsTemp.IsEmpty then
       result := _cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


Function AbreVendaLaboratorioMultiEmpresa(PnrProduto, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
    try
      stQry := TStringList.Create;
      with stQry do
      begin
         add('SELECT CD_EMPRESA, CD_MERCADORIA,DT_VENDA_MERCADORIA,');
         add('case');
         add('WHEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)= EXTRACT(MONTH FROM sysdate) AND');
         add('   EXTRACT(year FROM DT_VENDA_MERCADORIA)= EXTRACT(year FROM sysdate)THEN 13');
         add('ELSE');
         add('EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
         ADD('END MES,');

         add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA ) AS ANO, sum(QT_VENDIDA) as QT_VENDIDA');
         add('FROM');
         add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA');
         add('WHERE');
         add('DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
         add('AND CD_MERCADORIA=:PnrProduto');
         add('GROUP BY  cd_empresa, CD_MERCADORIA,DT_VENDA_MERCADORIA');
//         add('ORDER BY ANO,MES');
      end;
         with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger := PnrProduto;
        open;
      end;
      if not _cdsTemp.isEmpty then
        _cdsTemp.IndexFieldNames := 'ANO;MES';

      result := _cdsTemp;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logistico %d',
          [nrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;




{Function AbreVendaLaboratorioMultiEmpresa(nrLaboratorio, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
    _cdsTemp.RemoteServer := _dmPrincipal._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
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
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO');
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
        Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO');
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

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        Params.ParamByName('PnrLaboratorio').AsInteger := nrLaboratorio;
        open;
      end;
      if not _cdsTemp.isEmpty then
        _cdsTemp.IndexFieldNames := 'CD_MERCADORIA';

      result := _cdsTemp;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logistico %d',
          [nrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
  end;}


Function TabeladePedido(PnrProduto, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
    try
      stQry := TStringList.Create;
      with stQry do
      begin
         add('SELECT NROP_P,DATP_P, LABP_P,NROM_Y ,SITY_Y,QUAY_Y,  CHEY_Y , QT_SUGERIDA ,DT_TRANSMITIDO,I.CD_EMPRESA');
         add('FROM');
         add('PRDDM.DCPCC C,');
         add('PRDDM.DCPCI I');
         add('WHERE');
         add('NROP_P=NROP_Y');
         add('AND C.CD_EMPRESA=I.CD_EMPRESA');
         add('AND SITP_P NOT IN(''I'',''S'')');
         add('AND SITY_Y NOT IN(''I'',''S'')');
         add('AND DATP_P BETWEEN  ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) AND SYSDATE');
         add('And NROM_Y=:PnrProduto');


      end;
         with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger:=PnrProduto;
        open;
      end;

      result := _cdsTemp;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logistico %d',
          [nrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

Function TabeladeEntrada(PnrProduto, nrEmpresa, nrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
    try
      stQry := TStringList.Create;
      with stQry do
      begin
         add('SELECT NRON_O,DT_VALIDADE,NROM_Y,QUAP_Y,NR_PEDIDO_COMPRA,quay_y,');
         add('DATE_O, trunc(DT_ATUALIZACAO) as DT_ATUALIZACAO,I.CD_EMPRESA');
         add('FROM');
         add('PRDDM.DCCPA C,');
         add('PRDDM.DCYCP i');
         add('WHERE');
         add('NROO_O=NROO_Y');
         add('AND STAO_O=''F''');
         add('AND DATO_O  BETWEEN  ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) AND SYSDATE');
         add('AND NROM_Y=:PnrProduto');
      end;
     with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger:=PnrProduto;
        open;
      end;

      result := _cdsTemp;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logistico %d',
          [nrOperadorLogistico]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;




Function LocalizaPedido(PnrEmpresa,PnrProduto,PnrPedido: Integer):TDadosPedido;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(NIL);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;
    try
      stQry := TStringList.Create;
      with stQry do
      begin
         add('SELECT   NROP_P,DATP_P,QUAY_Y,CHEY_Y,QT_SUGERIDA,DT_TRANSMITIDO,');
         add('SITY_Y');
         add('FROM');
         add('PRDDM.DCPCC C,');
         add('PRDDM.DCPCI I');
         add('WHERE NROP_P=NROP_Y');
         add('AND NROP_Y=:PnrPedido AND NROM_Y=:PnrProduto');
         add('AND I.CD_EMPRESA=:PnrEmpresa');
      end;
     with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrPedido').AsInteger:=PnrPedido;
        Params.ParamByName('PnrProduto').AsInteger:=PnrProduto;
        Params.ParamByName('PnrEmpresa').AsInteger:=PnrEmpresa;
        open;
      end;

      result.nrPedido:=0;
      result.dtPedido:=0;
      Result.dtTransmissao:=0;
      result.qtPedido:=0;
      result.qtFaturada:=0;
      result.QtSugerida:=0;
      if not _cdsTemp.IsEmpty then
      begin
       Result.nrPedido     :=_cdsTemp.FieldByName('NROP_P').AsInteger;
       Result.dtPedido     :=_cdsTemp.FieldByName('DATP_P').AsDateTime;
       Result.dtTransmissao:=_cdsTemp.FieldByName('DT_TRANSMITIDO').AsDateTime;;
       Result.idStatus     :=_cdsTemp.FieldByName('SITY_Y').AsString;
       Result.qtPedido     :=_cdsTemp.FieldByName('QUAY_Y').AsInteger; ;
       Result.qtFaturada   :=_cdsTemp.FieldByName('CHEY_Y').AsInteger;;
       Result.QtSugerida   :=_cdsTemp.FieldByName('QT_SUGERIDA').AsInteger;;
      end;

    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Pedido Fornecedor para Oper.Logistico %d',   [PnrPedido]));
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;



Function PosicaoEstoqueDiario(PnrProduto,PcdCDFisico: Integer):TClientDataSet;
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
      Add('SELECT QT_ESTOQUE_DISPONIVEL_VENDA ,DAEE_E,NROM_E');
      Add('FROM');
      Add('PRDDM.DCEST ES');
      Add('WHERE');
      Add('CD_EMPRESA=:PnrCd');
      Add('AND NROM_E =:PnrProduto');
      Add('AND DAEE_E>ADD_MONTHS(TRUNC(SYSDATE,''DAY''),-3)');
      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrProduto').AsInteger :=PnrProduto;
        Params.ParamByName('PnrCd').AsInteger := PcdCDFisico;
        open;
      end;
      result:=nil;
      if not _cdstemp.isEmpty then
      begin
         _cdsTemp.IndexFieldNames:='DAEE_E';
         result:=_cdstemp
      end;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;


function AbreUltimasCompraLaboratorioSomarizada(PnrLaboratorio,
                                      PnrOperadorLogistico,
                                      PcdEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(nil);
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

    stQry.Add('AND SUMARIZADA.ID_SITUACAO_COMPRA<>''I''');
    stQry.Add('AND SUMARIZADA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    stQry.Add( 'AND SUMARIZADA.DT_COMPRA BETWEEN add_MONTHS(trunc(sysdate,''day''),-3) and SYSDATE');
    stQry.Add('AND SUMARIZADA.CD_OPERADOR_LOGISTICO =:PcdOPeradorLogistico');
    stQry.Add('GROUP BY SUMARIZADA.CD_MERCADORIA , SUMARIZADA.DT_COMPRA,');
    stQry.Add('SUMARIZADA.DT_ATUALIZACAO, SUMARIZADA.NM_USUARIO,');
    stQry.Add('SUMARIZADA.ID_SITUACAO_COMPRA,COMPRA.CD_EMPRESA');

    stQry.SaveToFile('C:\Temp\qryUltimasCompras.qry');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PcdOPeradorLogistico').AsInteger :=  PnrOperadorLogistico;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      open;
    end;
     result := NIL;
     if NOT _cdsTemp.IsEmpty then
        result := _cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


function PedidoCompraLaboratorio(PnrLaboratorio,
                                 PnrOperadorLogistico,
                                 PcdEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

    stQry.Add('SELECT');
    stQry.Add(' distinct SUMARIZADA.DT_COMPRA,');
    stQry.Add('SUMARIZADA.DT_ATUALIZACAO,ID_SITUACAO_COMPRA,COMPRA.CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_COMPRA_SUMARIZADA SUMARIZADA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    stQry.Add('WHERE');
    stQry.Add('SUMARIZADA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND SUMARIZADA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrLaboratorio');
    stQry.Add( 'AND SUMARIZADA.DT_COMPRA BETWEEN add_MONTHS(trunc(sysdate,''day''),-3) and SYSDATE');
    stQry.Add('AND SUMARIZADA.CD_OPERADOR_LOGISTICO =:PcdOPeradorLogistico');

    stQry.SaveToFile('C:\Temp\qryVendsaSumarizada.qry');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PcdOPeradorLogistico').AsInteger :=  PnrOperadorLogistico;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      open;
    end;
    result := NIL;
     if NOT _cdsTemp.IsEmpty then
        result := _cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;





function PedidoCompraLaboratorio90(PnrLaboratorio,
                                 PnrOperadorLogistico,
                                 PcdEmpresa: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

    stQry.Add('SELECT DATP_P,NROM_Y,SUM(QUAY_Y) QT_PEDIDO,SITY_Y,');
    stQry.Add('NM_MAQUINA,I.CD_EMPRESA,cd_empresa_destino');
    stQry.Add('FROM PRDDM.DCPCC C,PRDDM.DCPCI I');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND C.CD_EMPRESA=I.CD_EMPRESA');
    stQry.Add('AND LABP_P=:PnrLaboratorio');
    stQry.Add('AND CD_OPERADOR_LOGISTICO=:PcdOPeradorLogistico');
    stQry.Add('AND SITP_P NOT IN(''S'',''I'',''T'',''K'')');
    stQry.Add('AND SITy_y NOT IN(''S'',''I'',''T'',''K'')');
    stQry.Add('AND DATP_P>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
    stQry.Add('GROUP BY DATP_P,NROM_Y,SITY_Y  ,NM_MAQUINA,I.CD_EMPRESA,cd_empresa_destino');
    stQry.Add('ORDER BY DATP_P');

    stQry.SaveToFile('C:\Temp\QryUltimosPedido.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PcdOPeradorLogistico').AsInteger :=  PnrOperadorLogistico;
      Params.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
      open;
    end;
    result := NIL;
     if NOT _cdsTemp.IsEmpty then
        result := _cdsTemp;
  finally
    FreeAndNil(stQry);
  end;
end;


function ItensComPedidoPendente(PnrLaboratorio,
                                PnrProduto,
                                PcdEmpresa: Integer):Boolean;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    stQry := TStringList.Create;

    stQry.Add('SELECT DATP_P,NROM_Y,SUM(QUAY_Y) QT_PEDIDO,SITY_Y,');
    stQry.Add('NM_MAQUINA,I.CD_EMPRESA,CD_EMPRESA_DESTINO');
    stQry.Add('FROM PRDDM.DCPCC C,PRDDM.DCPCI I');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND C.CD_EMPRESA=I.CD_EMPRESA');
  //  stQry.Add('AND LABP_P=:PnrLaboratorio');
    stQry.Add('AND NROM_Y=:PnrProduto');
    stQry.Add('AND CD_EMPRESA_DESTINO=:PnrEmpresa');
    stQry.Add('and i.cd_operacao_rede in(0,1)');
    stQry.Add('AND SITP_P IN(''N'',''P'',''T'')');
    stQry.Add('AND SITy_y IN(''N'',''P'',''T'')');
    stQry.Add('AND DATP_P>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
    stQry.Add('GROUP BY DATP_P,NROM_Y,SITY_Y  ,NM_MAQUINA,I.CD_EMPRESA,cd_empresa_destino');
    stQry.Add('ORDER BY DATP_P');

    stQry.SaveToFile('C:\Temp\QryItensComPedido.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      Params.ParamByName('PnrProduto').Asbcd :=  PnrProduto;
      //Params.ParamByName('PnrLaboratorio').Asbcd := PnrLaboratorio;
      Params.ParamByName('PnrEmpresa').AsBcd := PcdEmpresa;
      open;
    end;
    result := false;
     if NOT _cdsTemp.IsEmpty then
        result := true;
  finally
    FreeAndNil(stQry);
  end;
end;

function ItemCrossdocking(PnrProduto:Integer):Boolean;
Var
  QryTemp: TSQLQuery;
  stqry  : TStringList;
begin
    TestaConexaoBase(_dm._conexao,1);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    stqry:=TStringList.Create;


begin
  try

    With QryTemp do
    begin
     SQL.Add('SELECT * FROM prddm.dc_compra_mercadoria');
     SQL.Add('WHERE id_situacao_mercadoria=''A'' AND CD_EMPRESA_CROSSDOCKING>0');
     SQL.Add('AND cd_empresa<>5 AND cd_mercadoria=:PnrProduto');
     ParamByName('PnrProduto').Asbcd :=  PnrProduto;
     open;
    end;
    stqry.Add(QryTemp.Text);
    stqry.SaveToFile('C:\Temp\QryItemCrossdocking.sql');
    result := false;
    if not QryTemp.IsEmpty then
        result := true;
  finally
    FreeAndNil(stQry);
    FreeAndNil(QryTemp);
  end;
  end;
end;


end.
