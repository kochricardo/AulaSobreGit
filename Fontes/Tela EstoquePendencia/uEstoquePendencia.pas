unit uEstoquePendencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, DBClient, Grids, DBGrids, uDm,
  uRotinasGenericas,sqlExpr,shellApi;

type
  T_frmEstoquePendencia = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _dbgEstoque: TDBGrid;
    _cdsEstoquePendencia: TClientDataSet;
    _dsEstoquePendencia: TDataSource;
    GroupBox2: TGroupBox;
    _btnExecuta: TBitBtn;
    _bitFechar: TBitBtn;
    _btnParaExcel: TBitBtn;
    _chkAgruparLaboratorio: TCheckBox;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    _btnExcelResumido: TBitBtn;
    Label4: TLabel;
    _cbxOperacaoRede: TComboBox;
    _chkSeparaCD: TCheckBox;
    Label1: TLabel;
    _cobComprador: TComboBox;
    procedure _btnExecutaClick(Sender: TObject);
    procedure _bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _dbgEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgEstoqueTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure _btnExcelResumidoClick(Sender: TObject);
  private
    procedure ExcecutaRelatorioEstoquePendencia(idLaboratorio: boolean);
    procedure setClientDataSet;
    procedure ExcecutaRelatorioEstoquePendenciaNovo(idLaboratorio: boolean;PnrComprador:integer);
    procedure CarregaEmpresa;
    procedure GerarTabelaArquivoResumidoCVS(PTabela: TDataSet;
      PstTituloRelatorio, PnmArquivo: String);
    procedure CarregaOperacaoRede;
    function CarregaCompradores(PnrComprador: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmEstoquePendencia: T_frmEstoquePendencia;

implementation

{$R *.dfm}


procedure T_frmEstoquePendencia.ExcecutaRelatorioEstoquePendencia(idLaboratorio:boolean);
var
  stQuery :TStringList;
  nrCd :integer;
begin
 try
   stQuery:=TStringList.Create;
   nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

   with stQuery do
   begin
    add('SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    if _chkAgruparLaboratorio.Checked then
    begin
     add('CD_GRUPO_FORNECEDOR,');
     add('DS_GRUPO_FORNECEDOR,');
    end;
    if nrCd>0 then
       add('COD_CD,');

    add('NVL(SUM(NR_ITENS),0) AS NR_ITENS,');
    add('NVL(SUM(ESTOQUE_FISICO),0) AS ESTOQUE_FISICO,');
    add('NVL(SUM(VT_CUSTO),0) AS VT_CUSTO,');
    add('NVL(SUM(VT_PRECO_COMPRA),0) AS VT_PRECO_COMPRA,');
    add('NVL(SUM(VT_PRECO_VENDA),0) AS VT_PRECO_VENDA,');
    add('NVL(SUM(NR_ITENS_MED),0) AS NR_ITENS_MED,');
    add('NVL(SUM(NR_ITENS_PERF),0) AS NR_ITENS_PERF,');
    add('NVL(SUM(NR_ITENS_OUTROS),0) AS NR_ITENS_OUTROS,');
    add('NVL(SUM(NR_ITENS_CURVA_A),0) AS NR_ITENS_CURVA_A,');
    add('NVL(SUM(NR_ITENS_CURVA_B),0) AS NR_ITENS_CURVA_B,');
    add('NVL(SUM(NR_ITENS_CURVA_C),0) AS NR_ITENS_CURVA_C,');
    add('NVL(SUM(NR_ITENS_CURVA_D),0) AS NR_ITENS_CURVA_D,');
    add('NVL(SUM(NR_ITENS_CURVA_E),0) AS NR_ITENS_CURVA_E,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CPRA),0) AS VL_ESTOQUE_MED_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CPRA),0) AS VL_ESTOQUE_PERF_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CPRA),0) AS VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CUSTO),0) AS VL_ESTOQUE_MED_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CUSTO),0) AS VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CUSTO),0) AS VL_ESTOQUE_OUTROS_PCO_CUSTO,');
    add('NVL(SUM(NR_ITENS_PEND),0) AS NR_ITENS_PEND,');
    add('NVL(SUM(QTD_PENDE),0) AS QTD_PENDE,');
    add('NVL(SUM(VL_PEND_PCO_FABRICA),0) AS VL_PEND_PCO_FABRICA,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO),0) AS VL_PEND_PCO_CUSTO,');
    add('NVL(SUM(QT_VENDIDA),0) AS QT_VENDIDA,');
    add('NVL(SUM(VT_FATURAMENTO_BRUTO),0) AS VT_FATURAMENTO_BRUTO,');
    add('NVL(SUM(VT_FATURAMENTO_LIQUIDO),0) AS VT_FATURAMENTO_LIQUIDO');
    add('FROM');
    add('(SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('ESTOQUE.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    if nrCd>0 then
      add('COD_CD,');
    add('NVL(SUM(NR_ITENS),0) AS NR_ITENS,');
    add('NVL(SUM(QT_FISICO),0) AS ESTOQUE_FISICO,');
    add('NVL(SUM(VT_CUSTO),0) AS VT_CUSTO,');
    add('NVL(SUM(VT_PRECO_COMPRA),0) AS VT_PRECO_COMPRA,');
    add('NVL(SUM(VT_PRECO_VENDA),0) AS VT_PRECO_VENDA,');
    add('NVL(SUM(NR_ITENS_MED),0) AS NR_ITENS_MED,');
    add('NVL(SUM(NR_ITENS_PERF),0) AS NR_ITENS_PERF,');
    add('NVL(SUM(NR_ITENS_OUTROS),0) AS NR_ITENS_OUTROS,');
    add('NVL(SUM(NR_ITENS_CURVA_A),0) AS NR_ITENS_CURVA_A,');
    add('NVL(SUM(NR_ITENS_CURVA_B),0) AS NR_ITENS_CURVA_B,');
    add('NVL(SUM(NR_ITENS_CURVA_C),0) AS NR_ITENS_CURVA_C,');
    add('NVL(SUM(NR_ITENS_CURVA_D),0) AS NR_ITENS_CURVA_D,');
    add('NVL(SUM(NR_ITENS_CURVA_E),0) AS NR_ITENS_CURVA_E,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CPRA),0) AS VL_ESTOQUE_MED_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CPRA),0) AS VL_ESTOQUE_PERF_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CPRA),0) AS VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CUSTO),0) AS VL_ESTOQUE_MED_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CUSTO),0) AS VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CUSTO),0) AS VL_ESTOQUE_OUTROS_PCO_CUSTO,');
    add('NVL(NR_ITENS_PEND,0) AS NR_ITENS_PEND,');
    add('NVL(QTD_PENDE,0) AS QTD_PENDE,');
    add('NVL(VL_PEND_PCO_FABRICA,0) AS VL_PEND_PCO_FABRICA,');
    add('NVL(VL_PEND_PCO_CUSTO,0) AS VL_PEND_PCO_CUSTO,');
    add('NVL(QT_VENDIDA,0) AS QT_VENDIDA,');
    add('NVL(VT_FATURAMENTO_BRUTO,0) AS VT_FATURAMENTO_BRUTO,');
    add('NVL(VT_FATURAMENTO_LIQUIDO,0) AS VT_FATURAMENTO_LIQUIDO');
    add('FROM');
    add('(SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('COMPRA.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
   if nrCd>0 then
      add('COMPRA.CD_EMPRESA AS COD_CD,');
    add('COUNT(*) NR_ITENS,');
    add('SUM((QT_FISICO)) QT_FISICO,');
    add('SUM((QT_FISICO)*VL_PRECO_COMPRA) VT_PRECO_COMPRA,');
    add('SUM((QT_FISIC)*VL_PRECO_VENDA) VT_PRECO_VENDA,');
    add('SUM(VT_CUSTO_FINANCEIRO_MERCADORIA) AS VT_CUSTO,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=1 THEN COUNT(*)');
    add('END NR_ITENS_MED,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=2 THEN COUNT(*)');
    add('END NR_ITENS_PERF,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM>2 THEN COUNT(*)');
    add('END NR_ITENS_OUTROS,');
    add('CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''A'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_A,');
    add('CASE');
    add('WHEN ID_CURVA_MERCADORIA=''B'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_B,');
    add('CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''C'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_C,');
    add('CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''D'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_D,');
    add('CASE');
    add('WHEN ID_CURVA_MERCADORIA=''E'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_E,');
    add('CASE');
    add('WHEN DS_NIVEL_ECNM=1 THEN SUM((QT_FISICO )*VL_PRECO_COMPRA)');
    add('END VL_ESTOQUE_MED_PCO_CPRA,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=2 THEN SUM((QT_FISICO )*VL_PRECO_COMPRA)');
    add('END VL_ESTOQUE_PERF_PCO_CPRA,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM>2 THEN SUM((QT_FISICO )*VL_PRECO_COMPRA)');
    add('END VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=1 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria)');
    add('END VL_ESTOQUE_MED_PCO_CUSTO,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=2 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria)');
    add('END VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM>2 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria)');
    add('END VL_ESTOQUE_OUTROS_PCO_CUSTO');
    add('FROM');
    add('PRDDM.DC_MERCADORIA MERCADORIA,');
    add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
    add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
    add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
    add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
    add('WHERE');
    add('COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
///    add('AND COMPRA.CD_EMPRESA=COMPRADOR.CD_EMPRESA');

    add('AND COMPRA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
    add('AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    add('AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
    add('AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
    add('GROUP BY   NR_COMPRADOR, NM_COMPRADOR_REDUZIDO,');
    add('COMPRA.CD_GRUPO_FORNECEDOR,DS_GRUPO_FORNECEDOR,DS_NIVEL_ECNM,');
    add('ID_CURVA_MERCADORIA');
    if nrCd>0 then
     add(',COMPRA.CD_EMPRESA');
    add(') ESTOQUE');
    add('LEFT OUTER JOIN (SELECT');
    add('CD_COMPRADOR,');
    add('LABP_P,');
    if nrCd>0 then
      add('COD_CD_P,');

    add('NVL(SUM(NR_ITENS_PEND),0) AS NR_ITENS_PEND,');
    add('NVL(SUM(VL_PEND_PCO_FABRICA),0) AS VL_PEND_PCO_FABRICA,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO),0) AS VL_PEND_PCO_CUSTO,');
    add('NVL(SUM(QTD_PENDE),0) AS QTD_PENDE,');
    add('NVL(SUM(QTD_PENDE_A),0) AS QTD_PENDE_A,');
    add('NVL(SUM(QTD_PENDE_B),0) AS QTD_PENDE_B,');
    add('NVL(SUM(QTD_PENDE_C),0) AS QTD_PENDE_C,');
    add('NVL(SUM(QTD_PENDE_D),0) AS QTD_PENDE_D,');
    add('NVL(SUM(QTD_PENDE_E),0) AS QTD_PENDE_E,');
    add('NVL(SUM(NR_ITENS_PEND_CURVA_A),0) AS NR_ITENS_PEND_CURVA_A,');
    add('NVL(SUM(NR_ITENS_PEND_CURVA_B),0) AS NR_ITENS_PEND_CURVA_B,');
    add('NVL(SUM(NR_ITENS_PEND_CURVA_C),0) AS NR_ITENS_PEND_CURVA_C,');
    add('NVL(SUM(NR_ITENS_PEND_CURVA_D),0) AS NR_ITENS_PEND_CURVA_D,');
    add('NVL(SUM(NR_ITENS_PEND_CURVA_E),0) AS NR_ITENS_PEND_CURVA_E,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO_A),0) AS VL_PEND_PCO_CUSTO_A,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO_B),0) AS VL_PEND_PCO_CUSTO_B,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO_C),0) AS VL_PEND_PCO_CUSTO_C,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO_D),0) AS VL_PEND_PCO_CUSTO_D,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO_E),0) AS VL_PEND_PCO_CUSTO_E ');
    add('FROM');
    add('(SELECT');
    add('COUNT(*) NR_ITENS_PEND,');
    add('LABP_P,COMPRA.CD_COMPRADOR,');
    if nrCd>0 then
      add('CAPA.CD_EMPRESA_DESTINO AS COD_CD_P,');

    add('SUM((QUAY_Y-CHEY_Y)* PFBY_Y) AS VL_PEND_PCO_FABRICA,');
    add('SUM((QUAY_Y-CHEY_Y)* VCCI_Y) AS VL_PEND_PCO_CUSTO,');
    add('SUM((QUAY_Y-CHEY_Y)) AS QTD_PENDE,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''A'' THEN SUM((QUAY_Y-CHEY_Y))');
    add('END  QTD_PENDE_A,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''B'' THEN SUM((QUAY_Y-CHEY_Y))');
    add('END  QTD_PENDE_B,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''C'' THEN SUM((QUAY_Y-CHEY_Y))');
    add('END  QTD_PENDE_C,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''D'' THEN SUM((QUAY_Y-CHEY_Y))');
    add('END  QTD_PENDE_D,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''E'' THEN SUM((QUAY_Y-CHEY_Y))');
    add('END  QTD_PENDE_E,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''A'' THEN COUNT(*)');
    add('END NR_ITENS_PEND_CURVA_A,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''B'' THEN COUNT(*)');
    add('END NR_ITENS_PEND_CURVA_B,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''C'' THEN COUNT(*)');
    add('END NR_ITENS_PEND_CURVA_C,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''D'' THEN COUNT(*)');
    add('END NR_ITENS_PEND_CURVA_D,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''E'' THEN COUNT(*)');
    add('END NR_ITENS_PEND_CURVA_E,');
    add('CASE                      ');
    add('  WHEN ID_CURVA_MERCADORIA=''A'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add('END VL_PEND_PCO_CUSTO_A,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''B'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add('END VL_PEND_PCO_CUSTO_B,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''C'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add('END VL_PEND_PCO_CUSTO_C,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''D'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add('END VL_PEND_PCO_CUSTO_D,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''E'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add('END VL_PEND_PCO_CUSTO_E');
    add('FROM');
    add('PRDDM.DC_MERCADORIA MERCADORIA,');
    add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    add('PRDDM.DCPCI ITEM,');
    add('PRDDM.DCPCC CAPA');
    add('WHERE');
    add('COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND COMPRA.CD_MERCADORIA=NROM_Y');
    add('AND COMPRA.CD_EMPRESA=CAPA.CD_EMPRESA');
    add('AND NROP_P=NROP_Y');
    add('AND SITP_P IN(''N'',''P'')');
    add('AND SITY_Y IN(''N'',''P'')');
    add('GROUP BY COMPRA.CD_COMPRADOR,ID_CURVA_MERCADORIA,LABP_P,CAPA.CD_EMPRESA_DESTINO)');
    add('GROUP BY      CD_COMPRADOR,LABP_P');
    if  nrCd>0 then
       add(',COD_CD_P');
    add(') PENDENCIA ON');
    add(' CD_COMPRADOR=ESTOQUE.NR_COMPRADOR AND LABP_P=ESTOQUE.CD_GRUPO_FORNECEDOR');
    add('LEFT OUTER JOIN (SELECT');
    add('COMPRA.CD_GRUPO_FORNECEDOR,');
    add('COMPRA.CD_COMPRADOR ,');
    add('SUM(QT_VENDIDA) AS QT_VENDIDA,');
    add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
    add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO');
    add('FROM');
    add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    add('LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON');
    add('VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    add('WHERE');
    add('DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
    add('GROUP BY COMPRA.CD_GRUPO_FORNECEDOR,COMPRA.CD_COMPRADOR');
    if  nrCd>0 then
       ADD(',COMPRA.CD_EMPRESA');
    ADD(')');
    add('VENDA ON VENDA.CD_COMPRADOR=PENDENCIA.CD_COMPRADOR AND');
    add('VENDA.CD_GRUPO_FORNECEDOR=PENDENCIA.LABP_P AND');
    add('VENDA.CD_GRUPO_FORNECEDOR=ESTOQUE.CD_GRUPO_FORNECEDOR AND');
    add('VENDA.CD_COMPRADOR=ESTOQUE.NR_COMPRADOR');
    add('GROUP BY');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('ESTOQUE.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    if  nrCd>0 then
       ADD('COD_CD,');
    add('NR_ITENS_PEND,');
    add('QTD_PENDE,');
    add('QT_VENDIDA,');
    add('VL_PEND_PCO_FABRICA,');
    add('VL_PEND_PCO_CUSTO,');
    add('VT_FATURAMENTO_BRUTO,');
    add('VT_FATURAMENTO_LIQUIDO)');
    if nrCd>0 then
       add('WHERE COD_CD=:PcdEmpresa');
    add('GROUP BY   NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO');
    if _chkAgruparLaboratorio.Checked then
    begin
     add(',CD_GRUPO_FORNECEDOR');
     add(',DS_GRUPO_FORNECEDOR');
    end;
    if nrCd>0 then
     add(',COD_CD');

   end;

   stQuery.SaveToFile('c:\temp\qryEstoquePendencia.sql');
   with _cdsEstoquePendencia do
   begin
     close;
     CommandText:=stQuery.Text;
    if nrCd>0 then
       Params.ParamByName('PcdEmpresa').AsInteger:=nrCd;
     open;
   end;
//   if not _cdsEstoquePendencia.IsEmpty then
    setClientDataSet;


 finally
   FreeAndNil(stQuery);
 end;

end;


procedure T_frmEstoquePendencia.ExcecutaRelatorioEstoquePendenciaNovo(idLaboratorio:boolean;PnrComprador:integer);
var
  stQuery :TStringList;
  nrCd,
  nrRede:integer;
begin
    try
   stQuery:=TStringList.Create;

    nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

    nrRede   := StrToIntDef(copy(_cbxOperacaoRede.Text,1,2),0);

   with stQuery do
   begin
     Add('SELECT');
     if _chkSeparaCD.Checked then
        Add('  nm_empresa,');
     Add('  CD_COMPRADOR,');
     Add('(SELECT NM_COMPRADOR_REDUZIDO FROM PRDDM.DC_COMPRADOR_GAM cg WHERE cg.nr_comprador=CD_COMPRADOR )AS NM_COMPRADOR_REDUZIDO,');
     if nrcd>0 then
      Add('  CD_EMPRESA AS COD_CD,');
     if idLaboratorio then
     begin
      Add('  NR_FORNECEDOR,');
      Add(' (SELECT DS_GRUPO_FORNECEDOR FROM PRDDM.DC_GRUPO_FORNECEDOR WHERE CD_GRUPO_FORNECEDOR=NR_FORNECEDOR) as DS_GRUPO_FORNECEDOR,');
     end;
     Add('  COUNT(*) NR_ITENS,');
     Add('SUM( QT_FISICO) as ESTOQUE_FISICO,');
     Add('SUM(VT_CUSTO_FINANCEIRO) AS VT_CUSTO_FINANCEIRO,');
     Add('SUM(VT_ESTOQUE_COMPRA)  AS VT_ESTOQUE_COMPRA,');
     Add('SUM(VT_ESTOQUE_VENDA) AS VT_ESTOQUE_VENDA,');
     Add('SUM(NR_ITEM_MEDICAMENTO) AS   NR_ITEM_MEDICAMENTO,');
     Add('SUM(NR_ITEM_PERFUMARIA) AS   NR_ITEM_PERFUMARIA,');
     Add('SUM(NR_ITEM_OUTROS) AS   NR_ITEM_OUTROS,');
     Add('SUM(NVL(NR_ITENS_CURVA_A,0)) AS NR_ITENS_CURVA_A,');
     Add('SUM(NVL(NR_ITENS_CURVA_B,0)) AS NR_ITENS_CURVA_B,');
     Add('SUM(NVL(NR_ITENS_CURVA_C,0)) AS NR_ITENS_CURVA_C,');
     Add('SUM(NVL(NR_ITENS_CURVA_D,0)) AS NR_ITENS_CURVA_D,');
     Add('SUM(NVL(NR_ITENS_CURVA_E,0)) AS NR_ITENS_CURVA_E,');
     Add('SUM(VT_ESTOQUE_COMPRA_MEDICAMENTO) AS VT_ESTOQUE_COMPRA_MEDICAMENTO,');
     Add('SUM(VT_ESTOQUE_COMPRA_PERFUMARIA) AS VT_ESTOQUE_COMPRA_PERFUMARIA,');
     Add('SUM(VT_ESTOQUE_COMPRA_OUTROS) AS VT_ESTOQUE_COMPRA_OUTROS,');
     Add('SUM(VT_ESTOQUE_CUSTO_MEDICAMENTO) AS VT_ESTOQUE_CUSTO_MEDICAMENTO,');
     Add('SUM(VT_ESTOQUE_CUSTO_PERFUMARIA) AS VT_ESTOQUE_CUSTO_PERFUMARIA,');
     Add('SUM(VT_ESTOQUE_CUSTO_OUTROS) AS VT_ESTOQUE_CUSTO_OUTROS,');
     Add('SUM(NR_ITENS_PENDENTE) AS NR_ITENS_PENDENTE,');
     Add('SUM(QT_UNIDADES_PENDENTE) AS QT_UNIDADES_PENDENTE,');
     Add('SUM(VL_PEND_PCO_FABRICA) AS VL_PEND_PCO_FABRICA  ,');
     Add('SUM(VL_PEND_PCO_CUSTO) AS  VL_PEND_PCO_CUSTO,');
     Add('SUM(QT_VENDIDA) AS QT_VENDIDA, ');
     Add('SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
     Add('SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO,');
     Add('SUM(CMV) AS CMV,');
     Add('SUM(VL_CUSTO_GERENCIAL_EST) AS VL_CUSTO_GERENCIAL_EST ,');
     Add('SUM(QT_ESTOQUE_CROSSDOCKING)+sum(QT_TRANSFERENCIA) AS QT_ESTOQUE_CROSSDOCKING,');
     Add('SUM(VL_FINANCEIRO_EST_CROSSDOCKING) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
     Add('SUM(VL_CUSTO_GEREN_EST_CROSSDOC) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
     Add('SUM(VL_CUSTO_FABRICA_EST_CROSSDOC) AS VL_CUSTO_FABRICA_EST_CROSSDOCK,');

     Add('SUM(NR_ITENS_TRANSITO)+sum(NR_ITENS_TRANS) AS  NR_ITENS_TRANSITO,');
     Add('SUM(QTD_PENDE_TRANSITO)+sum(QT_TRANSITO)+sum(QT_TRANSFERENCIA) AS QTD_PENDE_TRANSITO,');
     Add('SUM(VL_PEND_PCO_FABRICA_TRANST) AS VL_PEND_PCO_FABRICA_TRANST,');
     Add('Sum(VL_PEND_PCO_CUSTO_TRAN) AS VL_PEND_PCO_CUSTO_TRAN');



     Add('FROM');
     Add('(');
     Add('SELECT');
     Add('');
     Add('  CASE');
     Add('   WHEN ESTOQUE.CD_EMPRESA<>6   THEN  (SELECT  DISTINCT  CD_COMPRADOR  FROM PRDDM.DC_COMPRA_MERCADORIA CP');
     Add('                                       WHERE CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('                                            AND CP.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('                                            AND CD_GRUPO_FORNECEDOR NOT IN(98))');
     Add('   WHEN  ESTOQUE.CD_EMPRESA=6 THEN  (SELECT  DISTINCT  CD_COMPRADOR  FROM PRDDM.DC_COMPRA_MERCADORIA CP');
     Add('                                     WHERE   CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('                                             AND CD_GRUPO_FORNECEDOR NOT IN(98)');
     Add('                                             AND CP.CD_EMPRESA=4  )');
     Add('  END  CD_COMPRADOR,');
     Add('   ESTOQUE.CD_EMPRESA,');
     Add('   MERCADORIA.CD_MERCADORIA,');
     Add('   QT_FISICO - ESTOQUE.QT_CROSSDOCKING AS  QT_FISICO,');
     Add('    VT_CUSTO_FINANCEIRO_MERCADORIA AS  VT_CUSTO_FINANCEIRO,');
     Add('CASE');
     Add(' WHEN  ESTOQUE.CD_EMPRESA=6 THEN VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add(' WHEN  ESTOQUE.CD_EMPRESA<>6 THEN VL_PRECO_COMPRA * (QT_FISICO- ESTOQUE.QT_CROSSDOCKING)');
     Add('END  VT_ESTOQUE_COMPRA,');
     Add('CASE');
     Add(' WHEN  ESTOQUE.CD_EMPRESA=6 THEN VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add('    WHEN  ESTOQUE.CD_EMPRESA<>6 THEN   VL_PRECO_VENDA  * (QT_FISICO- ESTOQUE.QT_CROSSDOCKING)');
     Add('  END  VT_ESTOQUE_VENDA,');
     Add('');
     Add(' DS_NIVEL_ECNM,');
     Add(' CASE');
     Add('  WHEN ESTOQUE.CD_EMPRESA<>6 THEN');
     Add('                    (SELECT  DISTINCT  ID_CURVA_MERCADORIA  FROM PRDDM.DC_COMPRA_MERCADORIA CP');
     Add('                     WHERE CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND  CD_EMPRESA=ESTOQUE.CD_EMPRESA)');
     Add('  WHEN ESTOQUE.CD_EMPRESA=6 THEN ''M''');
     Add('  END ID_CURVA_MERCADORIA,');
     Add('');
     Add('CASE');
     Add('  WHEN (DS_NIVEL_ECNM=1) AND (ESTOQUE.CD_EMPRESA<>6)  THEN  VL_PRECO_COMPRA   * (QT_FISICO- ESTOQUE.QT_CROSSDOCKING)');
     Add('  WHEN (DS_NIVEL_ECNM=1) AND (ESTOQUE.CD_EMPRESA=6)  THEN  VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add('ELSE 0');
     Add('END  VT_ESTOQUE_COMPRA_MEDICAMENTO,');
     Add('CASE');
     Add('  WHEN DS_NIVEL_ECNM=2  AND   (ESTOQUE.CD_EMPRESA<>6) THEN VL_PRECO_COMPRA  * (QT_FISICO- ESTOQUE.QT_CROSSDOCKING)');
     Add('  WHEN (DS_NIVEL_ECNM=2)  AND (ESTOQUE.CD_EMPRESA=6)  THEN  VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add(' ELSE 0');
     Add('END  VT_ESTOQUE_COMPRA_PERFUMARIA,');
     Add('CASE');
     Add(' WHEN DS_NIVEL_ECNM>2 AND (ESTOQUE.CD_EMPRESA<>6)  THEN   VL_PRECO_COMPRA  * (QT_FISICO- ESTOQUE.QT_CROSSDOCKING)');
     Add(' WHEN (DS_NIVEL_ECNM>2) AND (ESTOQUE.CD_EMPRESA=6)  THEN  VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add(' ELSE 0');
     Add('END  VT_ESTOQUE_COMPRA_OUTROS,');
     Add(' CASE');
     Add('   WHEN DS_NIVEL_ECNM=1 THEN  VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add('   ELSE 0');
     Add(' END  VT_ESTOQUE_CUSTO_MEDICAMENTO,');
     Add(' CASE');
     Add('   WHEN DS_NIVEL_ECNM=2 THEN   VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add('   ELSE 0');
     Add(' END  VT_ESTOQUE_CUSTO_PERFUMARIA,');
     Add(' CASE');
     Add('   WHEN DS_NIVEL_ECNM>2 THEN  VT_CUSTO_FINANCEIRO_MERCADORIA');
     Add('   ELSE 0');
     Add(' END  VT_ESTOQUE_CUSTO_OUTROS,');
     Add('');
     Add(' NVL(CMV,0) AS CMV,');
     Add('  CASE');
     Add('   WHEN DS_NIVEL_ECNM=1 THEN 1');
     Add('   ELSE 0');
     Add(' END  NR_ITEM_MEDICAMENTO,');
     Add('  CASE');
     Add('   WHEN DS_NIVEL_ECNM=2 THEN 1');
     Add('   ELSE 0');
     Add(' END  NR_ITEM_PERFUMARIA,');
     Add('  CASE');
     Add('   WHEN DS_NIVEL_ECNM>2 THEN 1');
     Add('   ELSE 0');
     Add(' END  NR_ITEM_OUTROS,');
     Add(' (SELECT COUNT(*)');
     Add('   FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('   WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('       AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND ID_CURVA_MERCADORIA=''A''');
     Add('       GROUP BY ID_CURVA_MERCADORIA) AS NR_ITENS_CURVA_A,');
     Add(' (SELECT COUNT(*)');
     Add('   FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('   WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('       AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND ID_CURVA_MERCADORIA=''B''');
     Add('       GROUP BY ID_CURVA_MERCADORIA) AS NR_ITENS_CURVA_B,');
     Add('');
     Add(' (SELECT COUNT(*)');
     Add('   FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('   WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('       AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND ID_CURVA_MERCADORIA=''C''');
     Add('       GROUP BY ID_CURVA_MERCADORIA) AS NR_ITENS_CURVA_C,');
     Add(' (SELECT COUNT(*)');
     Add('   FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('   WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('       AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND ID_CURVA_MERCADORIA=''D''');
     Add('       GROUP BY ID_CURVA_MERCADORIA) AS NR_ITENS_CURVA_D,');
     Add(' (SELECT COUNT(*)');
     Add('   FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('   WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('       AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('       AND ID_CURVA_MERCADORIA=''E''');
     Add('       GROUP BY ID_CURVA_MERCADORIA) AS NR_ITENS_CURVA_E,');
     Add('  CASE');
     Add('   WHEN ESTOQUE.CD_EMPRESA=6 THEN');
     Add('                                (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
     Add('                                  FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('                                  WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('                                    AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('                                    AND CD_EMPRESA=4');
     Add('                                    GROUP BY CD_GRUPO_FORNECEDOR)');
     Add('');
     Add('   WHEN ESTOQUE.CD_EMPRESA<>6 THEN');
     Add('                                (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
     Add('                                  FROM PRDDM.DC_COMPRA_MERCADORIA');
     Add('                                  WHERE   CD_GRUPO_FORNECEDOR>0');
     Add('                                    AND CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('                                    AND CD_EMPRESA= ESTOQUE.CD_EMPRESA');
     Add('                                    GROUP BY CD_GRUPO_FORNECEDOR)');
     Add('END  NR_FORNECEDOR,');
     Add('NVL(NR_ITENS,0) AS NR_ITENS_PENDENTE,');

     Add('NVL(QT_UNIDADES_PENDENTE,0) AS QT_UNIDADES_PENDENTE,');
     Add('NVL(VL_PEND_PCO_FABRICA,0) AS VL_PEND_PCO_FABRICA  ,');
     Add('NVL(VL_PEND_PCO_CUSTO,0) AS VL_PEND_PCO_CUSTO,');

     Add('NVL(NR_ITENS_TRANSITO,0) AS NR_ITENS_TRANSITO,');
     Add('Nvl(QTD_PENDE_TRANSITO,0) AS QTD_PENDE_TRANSITO,');
     Add('Nvl(VL_PEND_PCO_FABRICA_TRANST,0) AS VL_PEND_PCO_FABRICA_TRANST,');
     Add('Nvl(vL_PEND_PCO_CUSTO_TRAN,0) AS VL_PEND_PCO_CUSTO_TRAN,');




     Add('  NVL(VL_CUSTO_GERENCIAL_EST,0) AS VL_CUSTO_GERENCIAL_EST ,');
     Add('  NVL(VL_FINANCEIRO_EST_CROSSDOCKING,0) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
     Add('  NVL(VL_CUSTO_GEREN_EST_CROSSDOC,0) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
     Add('  NVL(VL_CUSTO_FABRICA_EST_CROSSDOC,0) AS VL_CUSTO_FABRICA_EST_CROSSDOC,');
     Add('  NVL(QT_VENDA,0) AS QT_VENDIDA,');
     Add('  NVL(VT_FATURAMENTO_BRUTO,0) AS VT_FATURAMENTO_BRUTO,');
     Add('  NVL(VT_FATURAMENTO_LIQUIDO,0) AS VT_FATURAMENTO_LIQUIDO');

     Add('  ,NVL(QT_TRANSITO,0) AS QT_TRANSITO');
     Add('  ,NVL(QT_TRANSFERENCIA,0) AS QT_TRANSFERENCIA');
     Add('  ,NVL(NR_ITENS_TRANS,0) AS NR_ITENS_TRANS');


     if _chkSeparaCD.Checked then
          Add('  ,nm_empresa');

     Add(' ,NVL(QT_ESTOQUE_CROSSDOCKING,0) AS QT_ESTOQUE_CROSSDOCKING');
     Add('FROM');
     Add('PRDDM.DC_MERCADORIA MERCADORIA,');
     Add('PRDDM.DC_FINANCEIRO_MERCADORIA FM,');
     Add('PRDDM.DC_compra_MERCADORIA CM,');
     Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
     Add('');
     Add('LEFT OUTER JOIN');

     Add('(SELECT');
     Add(' CD_MERCADORIA');
     Add(' ,CD_EMPRESA_DESTINO');
     Add(' ,SUM(NVL(QT_TRANSFERENCIA,0)) AS QT_TRANSFERENCIA');
     Add(' ,SUM(NVL(QT_TRANSITO,0) ) AS QT_TRANSITO');
     Add(',case');
     Add('WHEN SUM(NVL(QT_TRANSITO,0) )+SUM(NVL(QT_TRANSFERENCIA,0))>0 then COUNT(*)');
     Add('ELSE 0');
     Add('END    NR_ITENS_TRANS');
     Add('  FROM');
     Add('  PRDDM.DC_ESTOQUE_TRANSFERENCIA');
     Add('  GROUP BY CD_MERCADORIA');
     Add(' ,CD_EMPRESA_DESTINO )  TRANS ON TRANS.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA AND TRANS.CD_EMPRESA_DESTINO=ESTOQUE.CD_EMPRESA');



     Add('--//DCIOS  (VENDA )');
     Add('LEFT OUTER JOIN (SELECT  I.CD_EMPRESA AS CD_EMPRESA, LABM_I,');
     Add('       SUM(VCCI_I) CMV,SUM(QUAI_I) AS QT_VENDA,SUM(VFTI_I) AS VT_FATURAMENTO_BRUTO,NROM_I');
     Add('       ,Sum (PLIQ_YI) AS VT_FATURAMENTO_LIQUIDO');
     Add('      FROM prddm.dcnot N, PRDDM.DCIOS I,prddm.dc_compra_mercadoria cm');
//     Add('           PRDDM.DC_COMPRA_MERCADORIA CM');
     Add('      WHERE');
     Add('        tipn_n=tipn_i');
     Add('        and tipn_n=''V''');
     Add('        and nroc_n=nroc_i');
      if nrRede>0 then
        add('and  cd_operacao_rede=:PnrRede')
     else
        add('and  cd_operacao_rede in(1,0)');

     Add('and cm.cd_empresa=i.cd_empresa');
     Add('        and n.nr_nfe=i.nr_nfe');
     Add('        and n.cd_empresa=i.cd_empresa');
     Add('        and cd_grupo_fornecedor=labm_i');
     Add('        and cd_mercadoria=nrom_i');

     Add('');
     Add('          AND I.NROM_I<>13000');
     if nrRede>0 then
        Add('          GROUP BY I.CD_EMPRESA,I.NROM_I,LABM_I ) ITEMNOTA ON ITEMNOTA.NROM_I=ESTOQUE.CD_MERCADORIA AND ITEMNOTA.CD_EMPRESA=4 and ESTOQUE.CD_EMPRESA=6')
     else
       Add('          GROUP BY I.CD_EMPRESA,I.NROM_I,LABM_I ) ITEMNOTA ON ITEMNOTA.NROM_I=ESTOQUE.CD_MERCADORIA AND ITEMNOTA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add('--// PENDENCIA');
     Add('LEFT OUTER JOIN (');
     Add('(SELECT');
     Add('       CD_COMPRADOR,');
     Add('       CD_MERCADORIA,');
     Add('');
     Add('       CD_EMPRESA,');
     Add('       NR_FORNECEDOR,');
//     Add('       COUNT(*) NR_ITENS,');
     Add('       SUM(QTD_PENDE) AS QT_UNIDADES_PENDENTE,');
     Add('       SUM(QTD_PENDE_TRANSITO) AS QTD_PENDE_TRANSITO,');
     Add('       SUM(VL_PEND_PCO_FABRICA_TRANST) AS VL_PEND_PCO_FABRICA_TRANST,');
     Add('       Sum(VL_PEND_PCO_CUSTO_TRANS) AS VL_PEND_PCO_CUSTO_TRAN,');
     Add('       SUM(VL_PEND_PCO_FABRICA) AS  VL_PEND_PCO_FABRICA,');
     Add('       SUM(VL_PEND_PCO_CUSTO) AS VL_PEND_PCO_CUSTO,');
     Add('       SUM(NR_ITENS) as NR_ITENS,');
     Add('       SUM(NR_ITENS_TRANSITO) as NR_ITENS_TRANSITO');



     Add('');
     Add('FROM');
     Add('(SELECT');
     Add('SITY_Y,');
     Add(' CAPA.CD_COMPRADOR,');
     Add('CASE ');
     Add('  WHEN SITY_Y IN(''N'',''P'') THEN COUNT(*)');
     Add('  ELSE 0');
     Add('  END  NR_ITENS,');

     Add('CASE ');
     Add('  WHEN SITY_Y=''T'' THEN 0');
     Add('  ELSE 0');
     Add('  END  NR_ITENS_TRANSITO,');


     Add(' CD_EMPRESA_DESTINO AS CD_EMPRESA,');
     Add(' CAPA.LABP_P AS NR_FORNECEDOR,');

     Add('CASE ');
     Add(' WHEN SITY_Y IN(''N'',''P'') THEN SUM(((QUAY_Y-CHEY_Y)* PFBY_Y))');
     ADD(' ELSE 0');
     Add(' END  VL_PEND_PCO_FABRICA,');

     Add('CASE ');
     Add(' WHEN SITY_Y IN(''N'',''P'') THEN  SUM(((QUAY_Y-CHEY_Y)* VCCI_Y))');
     ADD('ELSE 0');
     ADD(' END AS VL_PEND_PCO_CUSTO,');

     Add('CASE ');
          Add(' WHEN SITY_Y IN(''N'',''P'') THEN  SUM((QUAY_Y-CHEY_Y))');
     ADD('ELSE 0');
     ADD(' END QTD_PENDE,');

     Add('CASE ');
     Add('   WHEN SITY_Y IN(''T'') THEN SUM(((QUAY_Y-CHEY_Y)* PFBY_Y))');
     Add(' ELSE 0');
     Add('END VL_PEND_PCO_FABRICA_TRANST,');


     Add('CASE');
     Add('WHEN SITY_Y IN(''T'') THEN 0');
     Add('ELSE 0');
     Add('END  VL_PEND_PCO_CUSTO_TRANS,');


     Add('CASE');
     Add('WHEN SITY_Y IN(''T'') THEN 0');
     Add('ELSE 0');
     Add('END  QTD_PENDE_TRANSITO,');
     Add(' MERCADORIA.CD_MERCADORIA,');

     Add('CASE');
     Add(' WHEN ID_CURVA_MERCADORIA=''A'' THEN Count(*)');
     Add(' ELSE 0');
     Add('END NR_ITENS_CURVA_A,');

     Add('CASE');
     Add(' WHEN ID_CURVA_MERCADORIA=''B'' THEN Count(*)');
     Add(' ELSE 0');
     Add('END NR_ITENS_CURVA_B,');

     Add('CASE');
     Add(' WHEN ID_CURVA_MERCADORIA=''C'' THEN Count(*)');
     Add(' ELSE 0');
     Add('END NR_ITENS_CURVA_C,');


     Add('CASE');
     Add(' WHEN ID_CURVA_MERCADORIA=''D'' THEN Count(*)');
     Add(' ELSE 0');
     Add('END NR_ITENS_CURVA_D,');

     Add('CASE');
     Add(' WHEN ID_CURVA_MERCADORIA=''E'' THEN Count(*)');
     Add(' ELSE 0');
     Add('END NR_ITENS_CURVA_E,');

     Add('       VL_PRECO_VENDA');
     Add('');
     Add('');
     Add('');
     Add(' FROM');
     Add(' PRDDM.DC_MERCADORIA MERCADORIA');
     Add(' JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
     Add(' JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FINANCEIRO.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
     Add('                                                AND  ESTOQUE.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
     Add('                    JOIN PRDDM.DC_COMPRA_MERCADORIA compra ON   CD_GRUPO_FORNECEDOR>0');
     Add('                                                                AND compra.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add('                                                                AND compra.CD_EMPRESA=ESTOQUE.CD_EMPRESA');


     Add('');
     Add(' JOIN PRDDM.DCPCI ITEM ON SITY_Y IN(''N'',''P'') AND ESTOQUE.CD_MERCADORIA=NROM_Y');
     Add(' JOIN PRDDM.DCPCC CAPA ON NROP_P=NROP_Y AND  SITP_P IN(''N'',''P'')');
     Add('                                        AND CD_EMPRESA_DESTINO=ESTOQUE.CD_EMPRESA');
     Add('  AND  (Nvl(capa.CD_OPERACAO_REDE,1) IN(SELECT CD_EMPRESA FROM acesso.dc_empresa WHERE CD_OPERACAO_EMPRESA<>2) OR Nvl(capa.CD_OPERACAO_REDE,0)=0)');
     Add(' JOIN  ACESSO.DC_EMPRESA EMP on  EMP.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     Add(' WHERE');
     Add(' NROP_P>0');
     Add(' AND  CAPA.CD_COMPRADOR NOT IN(0,21)');
      if nrRede=0 then
         Add(' and EMP.ID_EMPRESA_FISICA=''S''');
       // Add('  AND CAPA.CD_OPERACAO_REDE in(0,1)');
      if nrRede>0 then
        Add('  AND CAPA.CD_OPERACAO_REDE=6');
      if nrRede=0 then
      begin
      Add('GROUP BY SITY_Y,CAPA.CD_COMPRADOR,CD_EMPRESA_DESTINO ,CAPA.LABP_P, MERCADORIA.CD_MERCADORIA,');
       Add('        ID_CURVA_MERCADORIA,VL_PRECO_VENDA)');
       Add('GROUP BY CD_COMPRADOR,NR_FORNECEDOR,CD_EMPRESA,CD_MERCADORIA)) PENDENCIA ON PENDENCIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
      end;
     if nrRede>0 then
     begin
      Add('GROUP BY SITY_Y,CAPA.CD_COMPRADOR,CAPA.CD_EMPRESA ,CAPA.LABP_P, MERCADORIA.CD_MERCADORIA,');
       Add('        ID_CURVA_MERCADORIA,VL_PRECO_VENDA)');
        Add('GROUP BY CD_COMPRADOR,NR_FORNECEDOR,CD_EMPRESA,CD_MERCADORIA)) PENDENCIA ON PENDENCIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA AND PENDENCIA.CD_EMPRESA=4 and ESTOQUE.CD_EMPRESA=6 ');
     end;
     Add('');
     Add('--//ESTOQUE');
     Add('');
     Add('LEFT OUTER JOIN (SELECT');
     Add('                    NROM_E,');
     Add('                    DCEST.CD_EMPRESA,');
     Add('                    SUM(ESTOQUE.QT_CROSSDOCKING) AS QT_ESTOQUE_CROSSDOCKING,');
     Add('                    SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING) * VL_CMEDIO_GERENCIAL) AS VL_CUSTO_GERENCIAL_EST,');
     Add('                    SUM(ESTOQUE.QT_CROSSDOCKING * VL_CUSTO_FINANCEIRO_MERCADORIA) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
     Add('                    SUM(ESTOQUE.QT_CROSSDOCKING * VL_CMEDIO_GERENCIAL) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
     Add('                    SUM(ESTOQUE.QT_CROSSDOCKING * VL_PRECO_COMPRA) AS VL_CUSTO_FABRICA_EST_CROSSDOC');
     Add('');
     Add('');
     Add('                    FROM');
     Add('                    PRDDM.DC_MERCADORIA MERCADORIA');
     Add('                    JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
     Add('                    JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON FINANCEIRO.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
     Add('                                                                    AND  ESTOQUE.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');


     Add('                    JOIN  PRDDM.DCEST DCEST ON DCEST.NROM_E=MERCADORIA.CD_MERCADORIA');
     Add('                                                                      AND DCEST.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
     Add('                                                                      AND DAEE_E=(SELECT MAX(DAEE_E) FROM PRDDM.DCEST WHERE NROM_E=1811)');
     Add('GROUP BY  NROM_E,');
     Add('                    DCEST.CD_EMPRESA)');
     Add('                                                                       DCEST1 ON  DCEST1.NROM_E=ESTOQUE.CD_MERCADORIA');
     Add('                                                                                  AND ESTOQUE.CD_EMPRESA=DCEST1.CD_EMPRESA');

     Add('JOIN acesso.dc_empresa emp ON emp.cd_empresa=estoque.cd_empresa');
     Add('WHERE');
     Add('     MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
     Add(' AND MERCADORIA.CD_MERCADORIA=FM.CD_MERCADORIA');
     Add(' AND MERCADORIA.CD_MERCADORIA=CM.CD_MERCADORIA');
     Add(' AND ESTOQUE.CD_EMPRESA=cM.CD_EMPRESA');
     Add(' AND ESTOQUE.CD_EMPRESA=FM.CD_EMPRESA');
   //  Add(' AND CD_COMPRADOR IN(SELECT nr_comprador FROM PRDDM.DC_COMPRADOR_GAM WHERE nr_comprador NOT IN(0,5,20,21))');

     if nrRede=0 then
      Add(' AND MERCADORIA.CD_MERCADORIA IN(SELECT CD_MERCADORIA FROM PRDDM.DC_COMPRA_MERCADORIA WHERE CD_GRUPO_FORNECEDOR>0 AND CD_GRUPO_FORNECEDOR NOT IN(98,700,755,748) AND CD_COMPRADOR NOT IN(0,20,21,5) )');

  {  if nrRede>0 then
    begin
     Add('AND MERCADORIA.CD_MERCADORIA IN(SELECT CD_MERCADORIA');
     Add('                         FROM PRDDM.DC_estoque_mercadoria');
     Add('                         WHERE cd_empresa=6)');
    end;}


     Add(' AND ESTOQUE.ID_SITUACAO_MERCADORIA=''A''');
     Add(' AND MERCADORIA.ID_SITUACAO_MERCADORIA=''A''');
     if PnrComprador>0 then
         Add(' AND CM.CD_COMPRADOR=:PnrComprador');


     if (nrCd>0) and (nrRede=0)  then
         Add(' AND ESTOQUE.CD_EMPRESA=:PcdEmpresa)');
     if (nrCd=0) and (nrRede=0)  then
          Add(' AND ESTOQUE.CD_EMPRESA<>6)');

     if (nrRede>0)and (nrCd=0) then
         Add(' AND ESTOQUE.CD_EMPRESA=:PnrRede)');
     if (nrRede>0)and (nrCd>0) then
         Add(' AND ESTOQUE.CD_EMPRESA=:PnrRede)');


     Add(' GROUP BY  CD_COMPRADOR');
      if _chkSeparaCD.Checked then
     Add(' ,nm_empresa');

     if nrCd>0 then
          Add(', CD_EMPRESA');
     if idLaboratorio then
     begin
          Add(', NR_FORNECEDOR');
     end;
     Add(' ORDER BY 1');



   end;
 try
   Screen.Cursor:=crHourGlass;
   stQuery.SaveToFile('c:\temp\qryPedenciaEstoque.sql');

   with _cdsEstoquePendencia do
   begin
     close;
     CommandText:=stQuery.Text;
    if (nrCd>0) and  (nrRede=0) then
       Params.ParamByName('PcdEmpresa').AsInteger:=nrCd;
    if (nrRede>0) and  (nrCd>0) then
       Params.ParamByName('PnrRede').AsInteger:=nrRede;
    if (nrRede>0) and  (nrCd=0) then
       Params.ParamByName('PnrRede').AsInteger:=nrRede;
    if PnrComprador>0  then
       Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;


     open;
   end;
  except
     begin
      Mensagem('Erro ao Executar Relatorio Estoque...',16);
      Screen.Cursor:=crDefault;
     end;
  end;
   if not _cdsEstoquePendencia.IsEmpty then
   begin
     _btnParaExcel.Enabled:=TRUE;
     setClientDataSet;
   end;


 finally
   FreeAndNil(stQuery);
   Screen.Cursor:=crDefault;

 end;

end;



procedure T_frmEstoquePendencia._bitFecharClick(Sender: TObject);
begin
 close;
end;

procedure T_frmEstoquePendencia._btnExcelResumidoClick(Sender: TObject);
VAR
 nmArquivo:String;
begin
  nmArquivo:='c:\TEMP\RelatorioPendencia_'+FormatDateTime('ddmmyyyyhhmmss',dtSistema)+'.csv';
  if _cdsEstoquePendencia<>nil then
  begin
     //  GerarExcel(_cdsRetorno,'RetornoPedido_'+FormatDateTime('ddmmyyyy',dtSistema)+trim(_edtNrLista.Text)+'.XLS');
      GerarTabelaArquivoResumidoCVS(_cdsEstoquePendencia,'Relatorio Estoque/Pendencia Resumido',  nmArquivo);

    ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
    Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
  end;

end;

procedure T_frmEstoquePendencia._btnExecutaClick(Sender: TObject);
var
nrComprador :Integer;
begin
 TRY
  _cdsEstoquePendencia.close;
   Application.ProcessMessages;

  _btnExecuta.Enabled:=FALSE;
  _btnParaExcel.Enabled:=FALSE;
  _btnExcelResumido.Enabled:=FALSE;
  StatusBar1.Panels[0].Text:='Aguarde Executando Pesquisa...';
  StatusBar1.refresh;
  nrComprador:= StrToIntDef(copy(_cobComprador.Text,1,2),0);

  ExcecutaRelatorioEstoquePendenciaNovo(_chkAgruparLaboratorio.Checked,nrComprador);
  _btnExecuta.Enabled:=TRUE;
  _btnExcelResumido.Enabled:=true;
   StatusBar1.Panels[0].Text:='Pesquisa Encerrada.';
   StatusBar1.refresh;
 EXCEPT

  _btnExecuta.Enabled:=TRUE;

 END;
end;

procedure T_frmEstoquePendencia._btnParaExcelClick(Sender: TObject);
begin
if not _cdsEstoquePendencia.IsEmpty then
     GerarExcel(_cdsEstoquePendencia);
end;

procedure T_frmEstoquePendencia._dbgEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=1  then // condi??o
begin
//  Dbgrid1.Canvas.Font.Color:= clInfoBk; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Font.Color:= clBlack;
  _dbgEstoque.Canvas.Brush.Color:= clInfoBk;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=2  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:=clBlack ; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clMoneyGreen;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=3  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clBlack; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clAqua;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=4  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clblack; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clYellow;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=5  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clBlack; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clskyblue;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=6  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clwhite; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clHotLight;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=7  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clWhite; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clRed;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=8  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clblack; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clInactiveBorder;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=9  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clblack; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clskyblue;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=10  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clBLACK; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clFuchsia;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=11  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clWhite; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clMaroon;
end;
If _cdsEstoquePendencia.FieldByName('CD_COMPRADOR').AsInteger=12  then // condi??o
begin
  _dbgEstoque.Canvas.Font.Color:= clBLACK; // coloque aqui a cor desejada
  _dbgEstoque.Canvas.Brush.Color:= clInactiveCaption;
end;
_dbgEstoque.DefaultDrawDataCell(Rect, _dbgEstoque.columns[datacol].field, State);

end;

procedure T_frmEstoquePendencia._dbgEstoqueTitleClick(Column: TColumn);
var
nmColuna:String;
begin
// GeraOrdenacao(_cdsEstoquePendencia,Column);
  nmColuna:=Column.FieldName;
  if (_chkAgruparLaboratorio.Checked) AND (_cbxOpcaoCDs.ItemIndex>0)then
     _cdsEstoquePendencia.IndexFieldNames:=nmColuna+';NR_FORNECEDOR;COD_CD';
  if (_chkAgruparLaboratorio.Checked) AND (_cbxOpcaoCDs.ItemIndex=0)then
     _cdsEstoquePendencia.IndexFieldNames:=nmColuna+';NR_FORNECEDOR';
  if (NOT _chkAgruparLaboratorio.Checked) AND (_cbxOpcaoCDs.ItemIndex>0)then
     _cdsEstoquePendencia.IndexFieldNames:=nmColuna+';COD_CD';
  if (NOT _chkAgruparLaboratorio.Checked) AND (_cbxOpcaoCDs.ItemIndex=0)then
     _cdsEstoquePendencia.IndexFieldNames:=nmColuna;
end;

procedure T_frmEstoquePendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmEstoquePendencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : close;
  end;
end;

procedure T_frmEstoquePendencia.FormShow(Sender: TObject);
begin
// ExcecutaRelatorioEstoquePendencia(false);
// GeraOrdenacao(_cdsEstoquePendencia,_dbgEstoque.Columns.Items[0]);
CarregaCompradores(0);
CarregaEmpresa;
CarregaOperacaoRede;
end;

procedure T_frmEstoquePendencia.setClientDataSet;
begin


   if _chkSeparaCD.Checked then
   begin
    TStringField(_cdsEstoquePendencia.FieldByName('NM_EMPRESA')).DisplayLabel:='CD';
    TStringField(_cdsEstoquePendencia.FieldByName('NM_EMPRESA')).DisplayWidth:=25;

   end;


    TIntegerField(_cdsEstoquePendencia.FieldByName('CD_COMPRADOR')).DisplayLabel:='Comprador';
    TIntegerField(_cdsEstoquePendencia.FieldByName('CD_COMPRADOR')).DisplayWidth:=9;

    TStringField(_cdsEstoquePendencia.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
    TStringField(_cdsEstoquePendencia.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=20;
    if _chkAgruparLaboratorio.Checked then
    begin
      TIntegerField(_cdsEstoquePendencia.FieldByName('NR_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
      TIntegerField(_cdsEstoquePendencia.FieldByName('NR_FORNECEDOR')).DisplayWidth:=9;

      TStringField(_cdsEstoquePendencia.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
      TStringField(_cdsEstoquePendencia.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=20;
    end;
    if _cbxOpcaoCDs.ItemIndex>0 then
    begin
    TIntegerField(_cdsEstoquePendencia.FieldByName('COD_CD')).DisplayLabel:='CD';
    TIntegerField(_cdsEstoquePendencia.FieldByName('COD_CD')).DisplayFormat:='##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('COD_CD')).DisplayWidth:=03;

    end;
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('ESTOQUE_FISICO')).DisplayLabel:='Unid.Estoque';
    TIntegerField(_cdsEstoquePendencia.FieldByName('ESTOQUE_FISICO')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('ESTOQUE_FISICO')).DisplayWidth:=9;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_CUSTO_FINANCEIRO')).DisplayLabel:='Vlr.Estoque(Fin)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_CUSTO_FINANCEIRO')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_CUSTO_FINANCEIRO')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA')).DisplayLabel:='Vlr.Estoque(Cpra)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_VENDA')).DisplayLabel:='Vlr.Estoque(Vda)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_VENDA')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_VENDA')).DisplayWidth:=12;



    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_MEDICAMENTO')).DisplayLabel:='Nr.Itens Med.';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_MEDICAMENTO')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_MEDICAMENTO')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_PERFUMARIA')).DisplayLabel:='Nr.Itens Perf.';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_PERFUMARIA')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_PERFUMARIA')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_OUTROS')).DisplayLabel:='Nr.Itens Outros';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_OUTROS')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITEM_OUTROS')).DisplayWidth:=9;




    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_A')).DisplayLabel:='Itens Curva A';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_A')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_A')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_B')).DisplayLabel:='Itens Curva B';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_B')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_B')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_C')).DisplayLabel:='Itens Curva C';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_C')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_C')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_D')).DisplayLabel:='Itens Curva D';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_D')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_D')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_E')).DisplayLabel:='Itens Curva E';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_E')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_CURVA_E')).DisplayWidth:=9;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_MEDICAMENTO')).DisplayLabel:='Vlr.Estq.Med(Cpra)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_MEDICAMENTO')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_MEDICAMENTO')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_PERFUMARIA')).DisplayLabel:='Vlr.Estq.Perf.(Cpra)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_PERFUMARIA')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_PERFUMARIA')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_OUTROS')).DisplayLabel:='Vlr.Estq.Outros(Cpra)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_OUTROS')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_COMPRA_OUTROS')).DisplayWidth:=12;


    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_MEDICAMENTO')).DisplayLabel:='Vlr.Estq.Med.Custo';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_MEDICAMENTO')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_MEDICAMENTO')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_PERFUMARIA')).DisplayLabel:='Vlr.Estq.Perf.Custo';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_PERFUMARIA')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_PERFUMARIA')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_OUTROS')).DisplayLabel:='Vlr.Estq.Outros Custo)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_OUTROS')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_ESTOQUE_CUSTO_OUTROS')).DisplayWidth:=12;

    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_PENDENTE')).DisplayLabel:='Nr.Itens Pend';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_PENDENTE')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_PENDENTE')).DisplayWidth:=9;

    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_UNIDADES_PENDENTE')).DisplayLabel:='Total Unid.Pend';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_UNIDADES_PENDENTE')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_UNIDADES_PENDENTE')).DisplayWidth:=9;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_CUSTO')).DisplayLabel:='Vlr.Pend.(P?o Custo)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_CUSTO')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_CUSTO')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_FABRICA')).DisplayLabel:='Vlr.Pend.(P?o.Vda)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_FABRICA')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_FABRICA')).DisplayWidth:=12;



    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_VENDIDA')).DisplayLabel:='Qtd.Unid.Fatur.';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_VENDIDA')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_VENDIDA')).DisplayWidth:=9;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayLabel:='Vlr.Fat.(Liquido)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_FATURAMENTO_LIQUIDO')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayLabel:='Vlr.Fat.(Bruto)';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VT_FATURAMENTO_BRUTO')).DisplayWidth:=12;

  //  TFloatField(_cdsEstoquePendencia.FieldByName('VL_FINANCEIRO_EST')).DisplayLabel:='Vlr.Est.Financ.';
 //   TFloatField(_cdsEstoquePendencia.FieldByName('VL_FINANCEIRO_EST')).DisplayFormat:='###,###,##0.00';
 //   TFloatField(_cdsEstoquePendencia.FieldByName('VL_FINANCEIRO_EST')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_GERENCIAL_EST')).DisplayLabel:='Vlr.Est.Custo.Med.';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_GERENCIAL_EST')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_GERENCIAL_EST')).DisplayWidth:=12;

   // TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_FABRICA_EST')).DisplayLabel:='Vlr.Est.Custo.Fabr.';
   // TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_FABRICA_EST')).DisplayFormat:='###,###,##0.00';
  //  TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_FABRICA_EST')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('CMV')).DisplayLabel:='Vlr.CMV';
    TFloatField(_cdsEstoquePendencia.FieldByName('CMV')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('CMV')).DisplayWidth:=12;


    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_ESTOQUE_CROSSDOCKING')).DisplayLabel:='Qtd.Unid.CROSSDOCKING.';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_ESTOQUE_CROSSDOCKING')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QT_ESTOQUE_CROSSDOCKING')).DisplayWidth:=9;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_FINANCEIRO_EST_CROSSDOCKING')).DisplayLabel:='Vlr.Est.(Fin)CROSSDOCKING';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_FINANCEIRO_EST_CROSSDOCKING')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_FINANCEIRO_EST_CROSSDOCKING')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_GEREN_EST_CROSSDOC')).DisplayLabel:='Vlr.Est.Custo CROSSDOCKING';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_GEREN_EST_CROSSDOC')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_GEREN_EST_CROSSDOC')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_FABRICA_EST_CROSSDOCK')).DisplayLabel:='Vlr.Est.Fabr. CROSSDOCKING';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_FABRICA_EST_CROSSDOCK')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_CUSTO_FABRICA_EST_CROSSDOCK')).DisplayWidth:=12;


    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_TRANSITO')).DisplayLabel:='Nr. itens Transito';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_TRANSITO')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('NR_ITENS_TRANSITO')).DisplayWidth:=9;


    TIntegerField(_cdsEstoquePendencia.FieldByName('QTD_PENDE_TRANSITO')).DisplayLabel:='Qtd. Transito';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QTD_PENDE_TRANSITO')).DisplayFormat:='###,###,##0';
    TIntegerField(_cdsEstoquePendencia.FieldByName('QTD_PENDE_TRANSITO')).DisplayWidth:=9;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_FABRICA_TRANST')).DisplayLabel:='Vlr.Est.Fabr. Transito';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_FABRICA_TRANST')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_FABRICA_TRANST')).DisplayWidth:=12;

    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_CUSTO_TRAN')).DisplayLabel:='Vlr.Est.Custo. Transito';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_CUSTO_TRAN')).DisplayFormat:='###,###,##0.00';
    TFloatField(_cdsEstoquePendencia.FieldByName('VL_PEND_PCO_CUSTO_TRAN')).DisplayWidth:=12;



//     Add('SUM(VL_CUSTO_GERENCIAL_EST) AS  ,');


end;




{procedure T_frmEstoquePendencia.ExcecutaRelatorioEstoquePendenciaNovo(idLaboratorio:boolean);
var
  stQuery :TStringList;
  nrCd :integer;
  nrDias,
  nrRede:Integer;
  dtStrinf :String;
begin
 try
 //  nrDias:=GetUltimoDiaEstoque;
 dtStrinf :=FormatDateTime('dd/mm/yyyy',dtSistema-2);
 if dtStrinf<>'' then
     sleep(0);
   nrDias:=1;
   if dayofweek(dtSistema)=2 then
      nrDias:=2;
   nrCd   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);

    nrRede   := StrToIntDef(copy(_cbxOperacaoRede.Text,1,2),0);

   stQuery:=TStringList.Create;
   with stQuery do
   begin
    add('SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    if _chkAgruparLaboratorio.Checked then
    begin
      add('ESTOQUE_CD.CD_GRUPO_FORNECEDOR,');
      add('DS_GRUPO_FORNECEDOR,');
    end;
    if nrCd>0 then
        add('COD_CD,');
    add('NVL(SUM(NR_ITENS),0) AS NR_ITENS,');
    add('NVL(SUM(ESTOQUE_FISICO),0) AS ESTOQUE_FISICO,');
    add('NVL(SUM(VT_CUSTO),0) AS VT_CUSTO,');
    add('NVL(SUM(VT_PRECO_COMPRA),0) AS VT_PRECO_COMPRA,');
    add('NVL(SUM(VT_PRECO_VENDA),0) AS VT_PRECO_VENDA,');
    add('NVL(SUM(NR_ITENS_MED),0) AS NR_ITENS_MED,');
    add('NVL(SUM(NR_ITENS_PERF),0) AS NR_ITENS_PERF,');
    add('NVL(SUM(NR_ITENS_OUTROS),0) AS NR_ITENS_OUTROS,');
    add('NVL(SUM(NR_ITENS_CURVA_A),0) AS NR_ITENS_CURVA_A,');
    add('NVL(SUM(NR_ITENS_CURVA_B),0) AS NR_ITENS_CURVA_B,');
    add('NVL(SUM(NR_ITENS_CURVA_C),0) AS NR_ITENS_CURVA_C,');
    add('NVL(SUM(NR_ITENS_CURVA_D),0) AS NR_ITENS_CURVA_D,');
    add('NVL(SUM(NR_ITENS_CURVA_E),0) AS NR_ITENS_CURVA_E,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CPRA),0) AS VL_ESTOQUE_MED_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CPRA),0) AS VL_ESTOQUE_PERF_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CPRA),0) AS VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CUSTO),0) AS VL_ESTOQUE_MED_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CUSTO),0) AS VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CUSTO),0) AS VL_ESTOQUE_OUTROS_PCO_CUSTO,');
    add('NVL(SUM(VL_FINANCEIRO_EST),0) AS  VL_FINANCEIRO_EST,');
    add('NVL(SUM(VL_CUSTO_GERENCIAL_EST),0) AS VL_CUSTO_GERENCIAL_EST,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST),0) AS VL_CUSTO_FABRICA_EST,');
    add('NVL(SUM(NR_ITENS_PEND),0) AS NR_ITENS_PEND,');
    add('NVL(SUM(QTD_PENDE),0) AS QTD_PENDE,');
    add('NVL(SUM(VL_PEND_PCO_FABRICA),0) AS VL_PEND_PCO_FABRICA,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO),0) AS VL_PEND_PCO_CUSTO,');
    add('NVL(SUM(QT_VENDIDA),0) AS QT_VENDIDA,');
    add('NVL(SUM(VT_FATURAMENTO_BRUTO),0) AS VT_FATURAMENTO_BRUTO,');
    add('NVL(SUM(VT_FATURAMENTO_LIQUIDO),0) AS VT_FATURAMENTO_LIQUIDO,');
    ADD('NVL(SUM(CMV),0) AS VT_CMV,');
    add('NVL(SUM(QT_FISICO_CROSSDOCKING),0) AS  QT_FISICO_CROSSDOCKING,');
    add('NVL(SUM(VL_FINANCEIRO_EST_CROSSDOCKING),0) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
    add('NVL(SUM(VL_CUSTO_GEREN_EST_CROSSDOC),0) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST_CROSSDOC),0) AS VL_CUSTO_FABRICA_EST_CROSSDOC');

    add('FROM');
    add('(SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('ESTOQUE.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('  COD_CD,');
    add('NVL(SUM(NR_ITENS),0) AS NR_ITENS,');
    add('NVL(SUM(ESTOQUE_FISICO),0) AS ESTOQUE_FISICO,');
    add('NVL(SUM(VT_CUSTO),0) AS VT_CUSTO,');
    add('NVL(SUM(VT_PRECO_COMPRA),0) AS VT_PRECO_COMPRA,');
    add('NVL(SUM(VT_PRECO_VENDA),0) AS VT_PRECO_VENDA,');
    add('NVL(SUM(NR_ITENS_MED),0) AS NR_ITENS_MED,');
    add('NVL(SUM(NR_ITENS_PERF),0) AS NR_ITENS_PERF,');
    add('NVL(SUM(NR_ITENS_OUTROS),0) AS NR_ITENS_OUTROS,');
    add('NVL(SUM(NR_ITENS_CURVA_A),0) AS NR_ITENS_CURVA_A,');
    add('NVL(SUM(NR_ITENS_CURVA_B),0) AS NR_ITENS_CURVA_B,');
    add('NVL(SUM(NR_ITENS_CURVA_C),0) AS NR_ITENS_CURVA_C,');
    add('NVL(SUM(NR_ITENS_CURVA_D),0) AS NR_ITENS_CURVA_D,');
    add('NVL(SUM(NR_ITENS_CURVA_E),0) AS NR_ITENS_CURVA_E,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CPRA),0) AS VL_ESTOQUE_MED_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CPRA),0) AS VL_ESTOQUE_PERF_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CPRA),0) AS VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CUSTO),0) AS VL_ESTOQUE_MED_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CUSTO),0) AS VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CUSTO),0) AS VL_ESTOQUE_OUTROS_PCO_CUSTO,');
    add('NVL(SUM(NR_ITENS_PEND),0) AS NR_ITENS_PEND,');
    add('NVL(SUM(QTD_PENDE),0) AS QTD_PENDE,');
    add('NVL(SUM(VL_PEND_PCO_FABRICA),0) AS VL_PEND_PCO_FABRICA,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO),0) AS VL_PEND_PCO_CUSTO,');
    add('NVL(SUM(VL_FINANCEIRO_EST),0) AS  VL_FINANCEIRO_EST,');
    add('NVL(SUM(VL_CUSTO_GERENCIAL_EST),0) AS VL_CUSTO_GERENCIAL_EST,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST),0) AS VL_CUSTO_FABRICA_EST,');
    add('NVL(SUM(QT_FISICO_CROSSDOCKING),0) AS  QT_FISICO_CROSSDOCKING,');
    add('NVL(SUM(VL_FINANCEIRO_EST_CROSSDOCKING),0) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
    add('NVL(SUM(VL_CUSTO_GEREN_EST_CROSSDOC),0) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST_CROSSDOC),0) AS VL_CUSTO_FABRICA_EST_CROSSDOC');

    add('FROM');
    add('(SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('  COD_CD,');
    add('NVL(SUM(NR_ITENS),0) AS NR_ITENS,');
    add('NVL(SUM(QT_FISICO),0) AS ESTOQUE_FISICO,');
    add('NVL(SUM(VT_CUSTO),0) AS VT_CUSTO,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST),0) AS VT_PRECO_COMPRA,');
    add('NVL(SUM(VT_PRECO_VENDA),0) AS VT_PRECO_VENDA,');
    add('NVL(SUM(NR_ITENS_MED),0) AS NR_ITENS_MED,');
    add('NVL(SUM(NR_ITENS_PERF),0) AS NR_ITENS_PERF,');
    add('NVL(SUM(NR_ITENS_OUTROS),0) AS NR_ITENS_OUTROS,');
    add('NVL(SUM(NR_ITENS_CURVA_A),0) AS NR_ITENS_CURVA_A,');
    add('NVL(SUM(NR_ITENS_CURVA_B),0) AS NR_ITENS_CURVA_B,');
    add('NVL(SUM(NR_ITENS_CURVA_C),0) AS NR_ITENS_CURVA_C,');
    add('NVL(SUM(NR_ITENS_CURVA_D),0) AS NR_ITENS_CURVA_D,');
    add('NVL(SUM(NR_ITENS_CURVA_E),0) AS NR_ITENS_CURVA_E,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CPRA),0) AS VL_ESTOQUE_MED_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CPRA),0) AS VL_ESTOQUE_PERF_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CPRA),0) AS VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('NVL(SUM(VL_ESTOQUE_MED_PCO_CUSTO),0) AS VL_ESTOQUE_MED_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_PERF_PCO_CUSTO),0) AS VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('NVL(SUM(VL_ESTOQUE_OUTROS_PCO_CUSTO),0) AS VL_ESTOQUE_OUTROS_PCO_CUSTO,');
    add('NVL(SUM(VL_FINANCEIRO_EST),0) AS  VL_FINANCEIRO_EST,');
    add('NVL(SUM(VL_CUSTO_GERENCIAL_EST),0) AS VL_CUSTO_GERENCIAL_EST,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST),0) AS VL_CUSTO_FABRICA_EST,');
    add('NVL(SUM(QT_FISICO_CROSSDOCKING),0) AS  QT_FISICO_CROSSDOCKING,');
    add('NVL(SUM(VL_FINANCEIRO_EST_CROSSDOCKING),0) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
    add('NVL(SUM(VL_CUSTO_GEREN_EST_CROSSDOC),0) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
    add('NVL(SUM(VL_CUSTO_FABRICA_EST_CROSSDOC),0) AS VL_CUSTO_FABRICA_EST_CROSSDOC');

    add('FROM');
    add('(SELECT');
    add('NR_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('COMPRA.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('COMPRA.CD_EMPRESA AS COD_CD,');
    add('ID_CURVA_MERCADORIA,');
    add('COUNT(*) NR_ITENS,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )) QT_FISICO,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*VL_PRECO_COMPRA) VT_PRECO_COMPRA,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*VL_PRECO_VENDA) VT_PRECO_VENDA,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria) AS VT_CUSTO,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=1 THEN COUNT(*)');
    add('END NR_ITENS_MED,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=2 THEN COUNT(*)');
    add('END NR_ITENS_PERF,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM>2 THEN COUNT(*)');
    add('END NR_ITENS_OUTROS,');
    add('CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''A'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_A,');
    add('CASE');
    add('WHEN ID_CURVA_MERCADORIA=''B'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_B,');
    add('CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''C'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_C,');
    add('CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''D'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_D,');
    add('CASE');
    add('WHEN ID_CURVA_MERCADORIA=''E'' THEN COUNT(*)');
    add('END NR_ITENS_CURVA_E,');
    add('CASE');
    add('WHEN DS_NIVEL_ECNM=1 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING)*VL_LISTA_COMPRA)');
    add('END VL_ESTOQUE_MED_PCO_CPRA,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=2 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING)*VL_LISTA_COMPRA)');
    add('END VL_ESTOQUE_PERF_PCO_CPRA,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM>2 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING)*VL_LISTA_COMPRA)');
    add('END VL_ESTOQUE_OUTROS_PCO_CPRA,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=1 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria)');
    add('END VL_ESTOQUE_MED_PCO_CUSTO,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM=2 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria)');
    add('END VL_ESTOQUE_PERF_PCO_CUSTO,');
    add('CASE');
    add(' WHEN DS_NIVEL_ECNM>2 THEN SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria)');
    add('END VL_ESTOQUE_OUTROS_PCO_CUSTO,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING )*vl_custo_financeiro_mercadoria) AS VL_FINANCEIRO_EST,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING) * VL_CMEDIO_GERENCIAL) AS VL_CUSTO_GERENCIAL_EST,');
    add('SUM((QT_FISICO- ESTOQUE.QT_CROSSDOCKING) * VL_LISTA_COMPRA) AS VL_CUSTO_FABRICA_EST,');
    add('SUM(Nvl(ESTOQUE.QT_CROSSDOCKING,0)) AS  QT_FISICO_CROSSDOCKING,');
    add('SUM(ESTOQUE.QT_CROSSDOCKING * VL_CUSTO_FINANCEIRO_MERCADORIA) AS VL_FINANCEIRO_EST_CROSSDOCKING,');
    add('SUM(ESTOQUE.QT_CROSSDOCKING * VL_CMEDIO_GERENCIAL) AS VL_CUSTO_GEREN_EST_CROSSDOC,');
    add('SUM(ESTOQUE.QT_CROSSDOCKING * VL_LISTA_COMPRA) AS VL_CUSTO_FABRICA_EST_CROSSDOC');

    add('FROM');
    add('PRDDM.DC_MERCADORIA MERCADORIA,');
    add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,');
    if nrRede>0 then
      add('PRDDM.DC_OPERACAO_REDE_MERCADORIA Rede,');
    add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
    add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
    add('PRDDM.DC_COMPRADOR_GAM COMPRADOR,');
    add('PRDDM.DCEST DCEST,');
    add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    add('LEFT OUTER JOIN');
    add('(SELECT EM.CD_EMPRESA, M.CD_MERCADORIA,');
    add('LP.VL_UNITARIO_COMPRA AS VL_LISTA_COMPRA');
    add('FROM PRDDM.DC_ESTOQUE_MERCADORIA EM,');
    add('PRDDM.DC_COMPRA_MERCADORIA CM,');
    add('PRDDM.DC_MERCADORIA M,');
    add('PRDDM.DC_LISTA_PRECO_FORNECEDOR LP');
    add('WHERE');
    if nrRede>0 then
     add('EM.CD_EMPRESA = 4')
    else
     add('EM.CD_EMPRESA = CM.CD_EMPRESA');

    add('AND EM.CD_MERCADORIA = CM.CD_MERCADORIA');
    add('AND EM.CD_MERCADORIA = M.CD_MERCADORIA');
    add('AND EM.ID_SITUACAO_MERCADORIA = ''A''');
    add('AND M.ID_SITUACAO_MERCADORIA = ''A''');
    if nrRede>0 then
      add('AND LP.CD_EMPRESA = 4')
    else
      add('AND LP.CD_EMPRESA = EM.CD_EMPRESA');

    add('AND LP.CD_MERCADORIA = EM.CD_MERCADORIA');
    add('AND LP.DT_MUDANCA_PRECO = (SELECT MAX(LPF.DT_MUDANCA_PRECO)');
    add('                          FROM PRDDM.DC_LISTA_PRECO_FORNECEDOR LPF');
    add('                           WHERE LPF.CD_MERCADORIA = LP.CD_MERCADORIA');
                                  if nrRede>0 then
                                    add('AND LPF.CD_EMPRESA =4')
                                  else
    add('                           AND LPF.CD_EMPRESA = LP.CD_EMPRESA');
    add('                          AND LPF.DT_MUDANCA_PRECO <= SYSDATE))');
    add(' LISTA ON LISTA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    if nrRede>0 then
     add('  AND LISTA.CD_EMPRESA=4')
    else
    add('  AND LISTA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    add('WHERE');
    if nrRede>0 then
    begin
       add('COMPRA.CD_EMPRESA=4');
       add('AND DCEST.CD_EMPRESA=4');
       add('AND COMPRA.CD_EMPRESA=4');
    end
    else
    begin
     add('COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     add('AND DCEST.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
     add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
    end;
    add('AND COMPRA.CD_COMPRADOR=COMPRADOR.NR_COMPRADOR');
    if nrRede>0 then
    begin
      add('AND rede.CD_MERCADORIA = ESTOQUE.CD_MERCADORIA');
      add('AND rede.CD_EMPRESA = ESTOQUE.CD_EMPRESA');
    end;


//--  add('  AND COMPRA.CD_EMPRESA=:PcdEmpresa');
    add('AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    add('AND MERCADORIA.CD_MERCADORIA=DCEST.NROM_E');
    add('AND DCEST.DAEE_E=TRUNC(SYSDATE-:PnrDias)');
    add('AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
    add('AND COMPRA.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND mercadoria.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND ESTOQUE.ID_SITUACAO_MERCADORIA<>''I''');
    add('GROUP BY   NR_COMPRADOR,');
    add(' NM_COMPRADOR_REDUZIDO,');
    add('COMPRA.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('DS_NIVEL_ECNM,');
    add('ID_CURVA_MERCADORIA');
    add(' ,COMPRA.CD_EMPRESA)');
    add(' GROUP BY   NR_COMPRADOR, NM_COMPRADOR_REDUZIDO');
    add(',CD_GRUPO_FORNECEDOR');
    add(',DS_GRUPO_FORNECEDOR');
    add(' ,COD_CD) ESTOQUE');
    add(' LEFT OUTER JOIN');
    add('(SELECT');
    add('CD_COMPRADOR,');
    add(' CD_GRUPO_FORNECEDOR,');
    add('COD_CD_P,');
    add('NVL(SUM(NR_ITENS_PEND),0) AS NR_ITENS_PEND,');
    add('NVL(SUM(VL_PEND_PCO_FABRICA),0) AS VL_PEND_PCO_FABRICA,');
    add('NVL(SUM(VL_PEND_PCO_CUSTO),0) AS VL_PEND_PCO_CUSTO,');
    add('NVL(SUM(QTD_PENDE),0) AS QTD_PENDE,');
    add('NVL(SUM(QTD_PENDE_A),0) AS QTD_PENDE_A,');
    add('NVL(SUM(QTD_PENDE_B),0) AS QTD_PENDE_B,');
    add('NVL(SUM(QTD_PENDE_C),0) AS QTD_PENDE_C,');
    add('NVL(SUM(QTD_PENDE_D),0) AS QTD_PENDE_D,');
    add('NVL(SUM(QTD_PENDE_E),0) AS QTD_PENDE_E,');
    add(' NVL(SUM(NR_ITENS_PEND_CURVA_A),0) AS NR_ITENS_PEND_CURVA_A,');
    add(' NVL(SUM(NR_ITENS_PEND_CURVA_B),0) AS NR_ITENS_PEND_CURVA_B,');
    add(' NVL(SUM(NR_ITENS_PEND_CURVA_C),0) AS NR_ITENS_PEND_CURVA_C,');
    add(' NVL(SUM(NR_ITENS_PEND_CURVA_D),0) AS NR_ITENS_PEND_CURVA_D,');
    add(' NVL(SUM(NR_ITENS_PEND_CURVA_E),0) AS NR_ITENS_PEND_CURVA_E,');
    add(' NVL(SUM(VL_PEND_PCO_CUSTO_A),0) AS VL_PEND_PCO_CUSTO_A,');
    add(' NVL(SUM(VL_PEND_PCO_CUSTO_B),0) AS VL_PEND_PCO_CUSTO_B,');
    add(' NVL(SUM(VL_PEND_PCO_CUSTO_C),0) AS VL_PEND_PCO_CUSTO_C,');
    add(' NVL(SUM(VL_PEND_PCO_CUSTO_D),0) AS VL_PEND_PCO_CUSTO_D,');
    add(' NVL(SUM(VL_PEND_PCO_CUSTO_E),0) AS VL_PEND_PCO_CUSTO_E ');
    add(' FROM');
    add(' (SELECT');
    add(' COUNT(*) NR_ITENS_PEND,');
    add(' LABP_P,COMPRA.CD_COMPRADOR,');
    add(' CD_GRUPO_FORNECEDOR,');
    add('   CAPA.CD_EMPRESA AS COD_CD_P,');
    add(' SUM((QUAY_Y-CHEY_Y)* PFBY_Y) AS VL_PEND_PCO_FABRICA,');
    add(' SUM((QUAY_Y-CHEY_Y)* VCCI_Y) AS VL_PEND_PCO_CUSTO,');
    add(' SUM((QUAY_Y-CHEY_Y)) AS QTD_PENDE,');
    add(' CASE');
    add(' WHEN ID_CURVA_MERCADORIA=''A'' THEN SUM((QUAY_Y-CHEY_Y))');
    add('END  QTD_PENDE_A,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''B'' THEN SUM((QUAY_Y-CHEY_Y))');
    add(' END  QTD_PENDE_B,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''C'' THEN SUM((QUAY_Y-CHEY_Y))');
    add(' END  QTD_PENDE_C,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''D'' THEN SUM((QUAY_Y-CHEY_Y))');
    add(' END  QTD_PENDE_D,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''E'' THEN SUM((QUAY_Y-CHEY_Y))');
    add(' END  QTD_PENDE_E,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''A'' THEN COUNT(*)');
    add(' END NR_ITENS_PEND_CURVA_A,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''B'' THEN COUNT(*)');
    add(' END NR_ITENS_PEND_CURVA_B,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''C'' THEN COUNT(*)');
    add(' END NR_ITENS_PEND_CURVA_C,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''D'' THEN COUNT(*)');
    add(' END NR_ITENS_PEND_CURVA_D,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''E'' THEN COUNT(*)');
    add(' END NR_ITENS_PEND_CURVA_E,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''A'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add(' END VL_PEND_PCO_CUSTO_A,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''B'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add(' END VL_PEND_PCO_CUSTO_B,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''C'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add(' END VL_PEND_PCO_CUSTO_C,');
    add(' CASE');
    add('   WHEN ID_CURVA_MERCADORIA=''D'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add(' END VL_PEND_PCO_CUSTO_D,');
    add('CASE');
    add('  WHEN ID_CURVA_MERCADORIA=''E'' THEN SUM((QUAY_Y-CHEY_Y)* VCCI_Y)');
    add(' END VL_PEND_PCO_CUSTO_E');
    add(' FROM');
    add(' PRDDM.DC_MERCADORIA MERCADORIA,');
    add(' PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    add(' PRDDM.DCPCI ITEM,');
    add(' PRDDM.DCPCC CAPA');
    add(' WHERE');
    add(' COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add(' AND COMPRA.CD_MERCADORIA=NROM_Y');
    if nrRede>0 then
    begin
       add(' AND COMPRA.CD_EMPRESA=4');
       add('AND CAPA.cd_operacao_rede=6');
    end
    else
        add(' AND COMPRA.CD_EMPRESA=CAPA.CD_EMPRESA');


    add(' AND NROP_P=NROP_Y');
    add(' AND SITP_P IN(''N'',''P'')');
    add(' AND SITY_Y IN(''N'',''P'')');
    add(' GROUP BY COMPRA.CD_COMPRADOR,ID_CURVA_MERCADORIA,LABP_P,');
    add('  CD_GRUPO_FORNECEDOR,');
    add('CAPA.CD_EMPRESA)');
    add(' GROUP BY      CD_COMPRADOR');
    add('  ,CD_GRUPO_FORNECEDOR');
    add('    ,COD_CD_P) PENDENCIA ON PENDENCIA.CD_COMPRADOR=ESTOQUE.NR_COMPRADOR');
    if nrRede>0 then
     add('AND PENDENCIA.COD_CD_P=4')
    else
     add('AND PENDENCIA.COD_CD_P=ESTOQUE.COD_CD');
    add('AND PENDENCIA.CD_GRUPO_FORNECEDOR=ESTOQUE.CD_GRUPO_FORNECEDOR');
    add('WHERE');
    add('NR_COMPRADOR NOT IN (0,5,21)');
    add('GROUP BY     NR_COMPRADOR,');
    add(' NM_COMPRADOR_REDUZIDO,');
    add(' ESTOQUE.CD_GRUPO_FORNECEDOR,');
    add(' DS_GRUPO_FORNECEDOR,');
    add('   COD_CD) ESTOQUE_CD');
    add('   LEFT OUTER JOIN');
    add('   (SELECT');
    add('    COMPRA.CD_GRUPO_FORNECEDOR,');
    add(' COMPRA.CD_COMPRADOR ,');
    add('       COMPRA.CD_EMPRESA,');
    add(' SUM(QT_VENDIDA) AS QT_VENDIDA,');
    add(' SUM(VT_FATURAMENTO_BRUTO) AS VT_FATURAMENTO_BRUTO,');
    add(' SUM(VT_FATURAMENTO_LIQUIDO) AS VT_FATURAMENTO_LIQUIDO');
    add(' FROM');
    add(' PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    add(' LEFT OUTER JOIN PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA ON');
    add(' VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    if nrRede>0 then
     add('AND VENDA.CD_EMPRESA=4')
    else
     add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');

    add(' WHERE');
    add(' DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
    add('   GROUP BY');
    add('       COMPRA.CD_GRUPO_FORNECEDOR,');
    add('   COMPRA.CD_COMPRADOR');
    add('    ,COMPRA.CD_EMPRESA');
    add(') VENDA ON VENDA.CD_COMPRADOR=ESTOQUE_CD.NR_COMPRADOR');
    if nrRede>0 then
    add('AND VENDA.CD_EMPRESA=4')
    else
    add('AND VENDA.CD_EMPRESA=ESTOQUE_CD.COD_CD');

    add('AND ESTOQUE_CD.CD_GRUPO_FORNECEDOR=VENDA.CD_GRUPO_FORNECEDOR');
    add('   LEFT OUTER JOIN (SELECT  I.CD_EMPRESA AS CD_EMPRESA,');
    add('   LABM_I,');
    add('   SUM(VCCI_I) CMV,SUM(QUAI_I) AS QT_VENDA,SUM(VFTI_I) AS VFTI_I');
    add('  FROM PRDDM.DCIOS I,');
    add('  PRDDM.DC_COMPRA_MERCADORIA CM');
    add('  WHERE');
    add('  CM.CD_MERCADORIA=NROM_I');
    add('  AND LABM_I=CD_GRUPO_FORNECEDOR');
    if nrRede>0 then
       add('  AND I.CD_EMPRESA=4')
     else
       add('  AND I.CD_EMPRESA=CM.CD_EMPRESA');

    add('  AND NROM_I<>13000');
    add('  AND ID_SITUACAO_MERCADORIA<>''I''');
    if nrCd>0 then
       add('AND I.CD_EMPRESA=:PcdEmpresa');
    add('AND LABM_I=CD_GRUPO_FORNECEDOR');
    add('AND TIPN_I=''V''');
    add('GROUP BY I.CD_EMPRESA,LABM_I) ioS ON ');
    if nrRede>0 then
       add('IOS.CD_EMPRESA=4')
    else
      add('IOS.CD_EMPRESA=VENDA.CD_EMPRESA');

    add('AND IOS.LABM_I=VENDA.CD_GRUPO_FORNECEDOR');
    if nrCd>0 then
    begin
     add('WHERE');
     add('COD_CD=:PcdEmpresa');
    end;
    add('GROUP BY');
    add('NR_COMPRADOR,');
    add(' NM_COMPRADOR_REDUZIDO');
    if _chkAgruparLaboratorio.Checked then
    begin
     add(',ESTOQUE_CD.CD_GRUPO_FORNECEDOR');
     add(',DS_GRUPO_FORNECEDOR');
    end;
    if nrCd>0 then
    add(',COD_CD');
   end;
 try
   Screen.Cursor:=crHourGlass;
   stQuery.SaveToFile('c:\temp\qryPedenciaEstoque.sql');
    with _cdsEstoquePendencia do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrDias').AsInteger:=nrDias;
    if nrCd>0 then
       Params.ParamByName('PcdEmpresa').AsInteger:=nrCd;

    //if nrRede>0 then
     //  Params.ParamByName('PopercaoRede').AsInteger:=nrRede;
     open;
   end;
  except
     begin
      Mensagem('Erro ao Executar Relatorio Estoque...',16);
      Screen.Cursor:=crDefault;
     end;
  end;
   if not _cdsEstoquePendencia.IsEmpty then
     _btnParaExcel.Enabled:=TRUE;
     setClientDataSet;


 finally
   FreeAndNil(stQuery);
   Screen.Cursor:=crDefault;

 end;

end;  }


procedure T_frmEstoquePendencia.CarregaEmpresa;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('ACESSO.DC_EMPRESA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''S''');
    tempQuery.SQL.Add('and ID_SITUACAO_EMPRESA=''A''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''N''');
    tempQuery.SQL.Add('ORDER BY 1');
    tempQuery.Open;
    tempQuery.First;

    _cbxOpcaoCDs.Clear;
    _cbxOpcaoCDs.Items.Add('00 - Todos');
    while not tempQuery.eof do
    begin
       _cbxOpcaoCDs.Items.Add( FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOpcaoCDs.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;




Procedure T_frmEstoquePendencia.GerarTabelaArquivoResumidoCVS(PTabela:TDataSet;PstTituloRelatorio,PnmArquivo:String);
var
 i: Integer; // Coluna
 j: Integer; // Linha

 arq: TextFile;
 nrlinHa:integer;
 stLinha,stLinhaTemp:WideString;
 stLista: TStringList;
 vlResultado: Variant;


 function retirarQuebraLinha(aTxt : string):string;
 begin
   atxt:=StringReplace(atxt,#13#10,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D#$A,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D,' ',[rfReplaceAll]);
   Result:=aTxt;
 end;

begin
  PTabela.Open;
  PTabela.First;

begin
  try
    stLista:=TStringList.Create;
    stLista.Clear;

    PnmArquivo:=PnmArquivo;
    AssignFile(arq,PnmArquivo );
    Rewrite(arq, PnmArquivo);

    stLinha:='Genesio A. Mendes & Cia. Ltda';
    Writeln(arq,stLinha);
    stLinha:=PstTituloRelatorio;
    Writeln(arq,stLinha);
    stLinha:='Data Emiss?o do Rel.:'+FormatDateTime('dd/mm/yyyy',dtSistema);
    Writeln(arq,stLinha);

   J:=0;
   stLinha:=EmptyStr;

   stLinha:= PTabela.Fields[0].DisplayName+';'+
             PTabela.Fields[1].DisplayName+';'+
             PTabela.Fields[2].DisplayName+';'+
             PTabela.Fields[3].DisplayName+';'+
             PTabela.Fields[4].DisplayName+';'+
             PTabela.Fields[5].DisplayName+';'+
             PTabela.Fields[6].DisplayName+';'+
             PTabela.Fields[7].DisplayName+';'+
             PTabela.Fields[32].DisplayName+';'+
             PTabela.Fields[33].DisplayName+';'+
             PTabela.Fields[34].DisplayName+';'+
             PTabela.Fields[35].DisplayName+';'+
             PTabela.Fields[36].DisplayName+';'+
             PTabela.Fields[37].DisplayName;


 {  while J<= PTabela.FieldCount - 1 do
   begin

      if PTabela.Fields[j].Visible then
      begin
        if stLinha<>'' then
          stLinha:= stLinha +';'+ PTabela.Fields[j].DisplayName
        else
          stLinha:= PTabela.Fields[j].DisplayName;

      end;
     inc(j);
   end;}
   Writeln(arq,stLinha);
   PTabela.First;
   PTabela.DisableControls;
   while not PTabela.Eof do
   begin
       J:=0;
       stLinha:=EmptyStr;


        stLinha:=  formatfloat('#####0', PTabela.Fields[0].value) +';'+
                   PTabela.Fields[1].value+';'+
                   formatfloat('#####0',PTabela.Fields[2].value)+';'+
                   formatfloat('#####0',PTabela.Fields[3].value)+';'+
                   formatfloat('#####0.00',PTabela.Fields[4].value)+';'+
                   formatfloat('#####0.00',PTabela.Fields[5].value)+';'+
                   formatfloat('#####0.00',PTabela.Fields[6].value)+';'+
                   formatfloat('#####0',PTabela.Fields[7].value)+';'+
                   formatfloat('#####0.00',PTabela.Fields[32].value)+';'+
                   formatfloat('#####0.00',PTabela.Fields[33].value)+';'+

                   formatfloat('#####0',PTabela.Fields[34].value)+';'+
                   formatfloat('#####0',PTabela.Fields[35].value)+';'+

                   formatfloat('#####0.00',PTabela.Fields[36].value)+';'+
                   formatfloat('#####0.00',PTabela.Fields[37].value) ;


           Writeln(arq,stLinha);

      PTabela.Next;
    end;
    CloseFile(arq);
   PTabela.EnableControls;

  //  ShellExecute(Handle, 'Open',PnmArquivo , nil, 'C:\TEMP\', SW_SHOWNORMAL);
  finally
    stLista.Free;
  end;


end;
end;



procedure T_frmEstoquePendencia.CarregaOperacaoRede;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('ACESSO.DC_EMPRESA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''N''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''S''');
    tempQuery.Open;
    tempQuery.First;

    _cbxOperacaoRede.Clear;

     _cbxOperacaoRede.Clear;

     _cbxOperacaoRede.Items.Add(FormatFloat('000',0)+' - '+
                                  FormatFloat('000',0)+' - '+
                                  'Todos' );

    while not tempQuery.eof do
    begin
       _cbxOperacaoRede.Items.Add(FormatFloat('000',tempQuery.FieldByName('cd_empresa').AsInteger)+' - '+
                                  FormatFloat('000',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOperacaoRede.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

function T_frmEstoquePendencia.CarregaCompradores(PnrComprador:Integer):Boolean;
var
  QryTemp: TSQLQuery;
begin
  try
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT NR_COMPRADOR,NM_COMPRADOR_REDUZIDO,');
      SQL.Add('DS_EMAIL_COMPRADOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('NR_COMPRADOR NOT IN(0,20,21,05) ORDER BY NM_COMPRADOR_REDUZIDO');
      open;
      first;
    end;
    Result:=true;
    _cobComprador.Clear;
    _cobComprador.Items.Add('00 - Comprador');

    while not QryTemp.Eof do
    begin
      _cobComprador.Items.Add(FormatFloat('00',QryTemp.FieldByName('NR_COMPRADOR').asinteger)+' - '+QryTemp.FieldByName('NM_COMPRADOR_REDUZIDO').AsString);
      QryTemp.Next;
    end;
    _cobComprador.ItemIndex:=0;
   finally
    FreeAndNil(QryTemp);
  end;
end;



end.

