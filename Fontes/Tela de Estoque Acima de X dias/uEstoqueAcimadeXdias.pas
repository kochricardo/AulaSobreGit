unit uEstoqueAcimadeXdias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, DBClient, uDm,
  uRotinasGenericas,ShellAPI,sqlExpr;

type
  T_frmEstoqueAcimadeXDias = class(TForm)
    GroupBox1: TGroupBox;
    _dbgEstoqueAcimadeX: TDBGrid;
    _cdsEstoque: TClientDataSet;
    _dsEstoque: TDataSource;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    _edtNrdiasEstoque: TEdit;
    _edtCodProduto: TEdit;
    _edtNrFornecedor: TEdit;
    _edtNrComprador: TEdit;
    _btnExecuta: TBitBtn;
    _bitFechar: TBitBtn;
    _btnParaExcel: TBitBtn;
    _edtValordoAcimaCusto: TEdit;
    _edtValorAcimaPcoCompra: TEdit;
    _edtValorAcimaPcoVda: TEdit;
    _edtNrUnidadesAcima: TEdit;
    Label8: TLabel;
    _cbxOpcaoCDs: TComboBox;
    Label18: TLabel;
    _cdsEstoqueVT_ACIMA_CUSTO: TAggregateField;
    _cdsEstoqueVT_ACIMA_COMPRA: TAggregateField;
    _cdsEstoqueVT_ACIMA_VENDA: TAggregateField;
    _cdsEstoqueNR_UNIDADES_ACIMA: TAggregateField;
    procedure _btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _bitFecharClick(Sender: TObject);
    procedure _dbgEstoqueAcimadeXDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgEstoqueAcimadeXTitleClick(Column: TColumn);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _edtNrdiasEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GeraTabelaEstoque(nrDiasExcesso, cdProduto, nrFornecedor,
      nrComprador,cdEmpresa: Integer): Boolean;
    procedure SetGridEstoqueAcima(PnrCdEmpresa:Integer);
    procedure ZeraTotalizadores;
    procedure ExecutaPesquisa;
    procedure CarregaCD;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmEstoqueAcimadeXDias: T_frmEstoqueAcimadeXDias;

implementation

{$R *.dfm}

procedure T_frmEstoqueAcimadeXDias._bitFecharClick(Sender: TObject);
begin
 CLOSE;
end;

procedure T_frmEstoqueAcimadeXDias._btnExecutaClick(Sender: TObject);
begin
   ExecutaPesquisa;
end;


procedure T_frmEstoqueAcimadeXDias._btnParaExcelClick(Sender: TObject);
var
 nmArquivo: String;
begin
Screen.Cursor := crSQLWait;
_btnParaExcel.enabled:=false;
{if not _cdsEstoque.IsEmpty then
     GerarExcel(_cdsEstoque);}
if not _cdsEstoque.IsEmpty then
begin
 _cdsEstoque.DisableControls;
_btnParaExcel.Enabled:=false;
 nmArquivo:='c:\TEMP\RelatorioEstoque_'+FormatDateTime('ddmmyyyyhhmmss',now)+'.csv';
 GerarArquivoCVS(_cdsEstoque,nmArquivo);

_btnParaExcel.Enabled:=true;
 _cdsEstoque.EnableControls;

 ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
end;


Screen.Cursor := crDefault;
Mensagem('Planilha Gerada',64);
_btnParaExcel.enabled:=true;

end;

procedure T_frmEstoqueAcimadeXDias._dbgEstoqueAcimadeXDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   with _dbgEstoqueAcimadeX do
   begin

// mude a cor das Linha
   If odd(_cdsEstoque.RecNo) then
   begin
      Canvas.Font.Color := clblack;
     Canvas.Brush.Color := clSkyBlue;
   end
  else
  begin
    Canvas.Font.Color := clblack;
    Canvas.Brush.Color := clWhite;
  end;
  // mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
      if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clBlue;
         Canvas.Font.Color:= clwhite;
      end;
      DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;

end;

procedure T_frmEstoqueAcimadeXDias._dbgEstoqueAcimadeXTitleClick(
  Column: TColumn);
begin
  GeraOrdenacao(_cdsEstoque,Column);
end;

procedure T_frmEstoqueAcimadeXDias._edtNrdiasEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      case key of
       VK_RETURN : executaPesquisa;
      end;
end;

procedure T_frmEstoqueAcimadeXDias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmEstoqueAcimadeXDias.FormCreate(Sender: TObject);
begin
   _edtNrComprador.Text:=IntToStr(nrCompradorSistema);
   CarregaCD;
end;

Function T_frmEstoqueAcimadeXDias.GeraTabelaEstoque(nrDiasExcesso,cdProduto,nrFornecedor,nrComprador,cdEmpresa:Integer):Boolean;
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






   { add('SELECT');
    add('CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('ID_CD,');
    add('CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('TIPO,');
    add('ID_CURVA_MERCADORIA,');
    add('ESTOQUE_FISICO,');
    ADD('VT_CUSTO_FINANCEIRO_MERCADORIA,');
    add('UNID_VENDIDA,');
    add('NR_DIAS_VENDA,');
    add('QT_DIAS_ESTOQUE_ZERO,');
//    add('NR_PERIODO,');
  //  add('MEDIA_CALC,');
//    add('NR_DIAS,');
  //  add('QT_DIAS_VENDA,');
    add('MEDIA_DIA,');
    add('Case');
    add('when MEDIA_DIA>0 then round(ESTOQUE_FISICO/MEDIA_DIA,0)');
    add('when MEDIA_DIA<=0 then round(ESTOQUE_FISICO/30,0)');
    add('end  DIAS_ESTOQUE,');

    add('MEDIA_DIA*30 AS MEDIA_MENSAL,');
    add('QT_ESTOQUE_MAXIMO,');
    add('QT_ESTOQUE_MINIMO,');
    add('ROUND((ESTOQUE_FISICO/MEDIA_DIA) - :PnrDiasInformado,0)  AS NR_DIAS_ACIMA,');
    add('ROUND((ROUND((ESTOQUE_FISICO/MEDIA_DIA)- :PnrDiasInformado,0))*MEDIA_DIA,0)AS NR_UNIDADES_ACIMA,');
    add('VL_CUSTO,');
    add('VL_PRECO_COMPRA,');
    add('VL_PRECO_VENDA,');
    add('ROUND((ROUND((ESTOQUE_FISICO/MEDIA_DIA) ,0) - :PnrDiasInformado)*MEDIA_DIA,0)*VL_CUSTO VL_ACIMA_FINANCEIRO,');
    add('ROUND((ROUND((ESTOQUE_FISICO/MEDIA_DIA) ,0) - :PnrDiasInformado)*MEDIA_DIA,0)*VL_PRECO_COMPRA VL_ACIMA_COMPRA,');
    add('ROUND((ROUND((ESTOQUE_FISICO/MEDIA_DIA) ,0) - :PnrDiasInformado)*MEDIA_DIA,0)*VL_PRECO_VENDA VL_ACIMA_VENDA,');
    add('CD_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO');
    if cdEmpresa>0 then
     add(',CD_EMPRESA');
    add('FROM');
    add('(SELECT');
    add('MERCADORIA.CD_MERCADORIA*10+ NR_DV_MERCADORIA AS CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('CD_COMPRADOR,');
    add('NM_COMPRADOR_REDUZIDO,');
    add('DECODE(ESTOQUE.CD_EMPRESA,4,''RS'',''SC'') AS ID_CD,');
    add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR, DS_GRUPO_FORNECEDOR,');
    add('DECODE(DS_NIVEL_ECNM,1,''MED'',2,''PERF'',''OUTR'') TIPO,');
    add('COMPRA.ID_CURVA_MERCADORIA,');
    add('(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO) ESTOQUE_FISICO,');
    add('NVL(QT_VENDIDA,0) AS UNID_VENDIDA,');
    add('NVL(NR_DIAS,0) AS NR_DIAS_VENDA,');
    add('NVL(QT_DIAS_ESTOQUE_ZERO,0) AS QT_DIAS_ESTOQUE_ZERO,');
    add('NVL(NR_PERIODO,0) AS NR_PERIODO,');
    add('NVL(MEDIA_SIS,0) AS MEDIA_SIS,');
    add('NVL(MEDIA_CALC,0) AS MEDIA_CALC,');
    add('NVL(NR_DIAS,0) AS NR_DIAS,');
    add('NVL(QT_DIAS_VENDA,0) AS QT_DIAS_VENDA,');
    add('CASE');
    add('WHEN NR_DIAS - QT_DIAS_ESTOQUE_ZERO >0 THEN');
//    add('ROUND(NVL(QT_VENDIDA,0)/ (NR_DIAS - QT_DIAS_ESTOQUE_ZERO),2)');
    add('ROUND(NVL(QT_VENDIDA,0)/ (DIAD_D - QT_DIAS_ESTOQUE_ZERO),2)');
    add('ELSE 0');
    add('END MEDIA_DIA,');
    add('QT_ESTOQUE_MAXIMO,');
    add('QT_ESTOQUE_MINIMO,');
    ADD('VT_CUSTO_FINANCEIRO_MERCADORIA,');
    add('CASE');
    add(' WHEN QT_FISICO>0 THEN ROUND(VT_CUSTO_FINANCEIRO_MERCADORIA/QT_FISICO,2)');
    add('ELSE 0');
    add('END VL_CUSTO,');
    add('DIAD_D as NR_DIAS_FATURAMENTO,');
    add('VL_PRECO_COMPRA,');
    add('VL_PRECO_VENDA');
    if cdEmpresa>0 then
    add(',COMPRA.CD_EMPRESA');
    add('FROM');
    add('(SELECT SUM(DIAD_D) DIAD_D');
    add('FROM PRDDM.DCDIA');
    add('WHERE DATD_D>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
    add('AND DATD_D < TRUNC(SYSDATE,''MONTH'') AND TIPD_D=''U''),');

    add('PRDDM.DC_MERCADORIA MERCADORIA');
    add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE ON ESTOQUE.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA AND ESTOQUE.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND ESTOQUE.ID_SITUACAO_MERCADORIA=MERCADORIA.ID_SITUACAO_MERCADORIA');
    add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA ON COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA AND Round(SYSDATE-DT_PRIMEIRA_COMPRA,0)>=90');
    add('LEFT OUTER JOIN PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO ON COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON  GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
    add('LEFT OUTER JOIN PRDDM.DC_COMPRADOR_GAM COMPRADOR   ON COMPRADOR.NR_COMPRADOR=COMPRA.CD_COMPRADOR');
    add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA CURVA_GRUPO ON CURVA_GRUPO.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE');
    add('AND CURVA_GRUPO.ID_CURVA_MERCADORIA=COMPRA.ID_CURVA_MERCADORIA');
    add('LEFT OUTER JOIN');
    add('(SELECT');
    if cdEmpresa>0 then
       add('CD_EMPRESA,');
    add('CD_MERCADORIA,');
    add('SUM(QT_VENDIDA) AS QT_VENDIDA,');
    add('ROUND(( ADD_MONTHS(TRUNC(sysdate,''MONTH''),0)  - TRUNC(MIN(DT_VENDA_MERCADORIA)))- MAX(QT_DIAS_ESTOQUE_ZERO),0) NR_DIAS,');
    add('COUNT(*) AS NR_PERIODO,');
    add('MAX(QT_DIAS_ESTOQUE_ZERO) QT_DIAS_ESTOQUE_ZERO,');
    add('ROUND(SUM(QT_MEDIA_VENDA_DIARIA) /COUNT(*),2) MEDIA_SIS,');
    add('ROUND(SUM(QT_VENDIDA)/ROUND((SYSDATE  - TRUNC(MIN(DT_VENDA_MERCADORIA)))- MAX(QT_DIAS_ESTOQUE_ZERO),0),2) MEDIA_CALC,');
    add('SUM(QT_DIAS_VENDA) AS QT_DIAS_VENDA');
    add('FROM');
    add('(SELECT');
    if cdEmpresa>0 then
      add('venda.CD_EMPRESA,');
    add('DT_VENDA_MERCADORIA,');
    add('CD_MERCADORIA,');
    add('SUM(QT_VENDIDA) AS QT_VENDIDA,');
    add('QT_DIAS_ESTOQUE_ZERO,');
    add('MAX(QT_DIAS_VENDA) AS QT_DIAS_VENDA,');
    add('MAX(QT_MEDIA_VENDA_DIARIA) AS QT_MEDIA_VENDA_DIARIA,');
    add('ROUND(SUM(QT_VENDIDA)/ MAX(QT_DIAS_VENDA),2) AS MEDIA,');
    add('((ADD_MONTHS(TRUNC(MAX(DT_VENDA_MERCADORIA),''MONTH''),1)  - TRUNC(MIN(DT_VENDA_MERCADORIA)))- SUM(QT_DIAS_ESTOQUE_ZERO)) NR_DIAS,');
    add('ROUND((SYSDATE  - TRUNC(MIN(DT_VENDA_MERCADORIA)))- SUM(QT_DIAS_ESTOQUE_ZERO),0) NR_DIAS,');
    add('SUM(QT_DIAS_ESTOQUE_ZERO) DIAS_SEM_ESTOQUE,');
    add('CASE');
    add('WHEN ROUND(SYSDATE - TRUNC(MIN(DT_VENDA_MERCADORIA))-MAX(QT_DIAS_ESTOQUE_ZERO),0)>0 THEN');
    add('ROUND(SUM(QT_VENDIDA)/ ROUND(SYSDATE - TRUNC(MIN(DT_VENDA_MERCADORIA))-MAX(QT_DIAS_ESTOQUE_ZERO),0),2)');
    add('ELSE 0');
    add('END MEDIA_DIARIA');
    add('FROM');
    add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
    add(' WHERE');
    add('DT_VENDA_MERCADORIA>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
    add('and DT_VENDA_MERCADORIA<TRUNC(SYSDATE,''MONTH'')');
    add('GROUP BY');
    add('DT_VENDA_MERCADORIA,');
    add('CD_MERCADORIA,');
    if cdEmpresa>0 then
       Add('VENDA.CD_EMPRESA,');
    add('QT_DIAS_ESTOQUE_ZERO)');
    add('GROUP BY ');
     if cdEmpresa>0 then
       Add('CD_EMPRESA,');
    add('CD_MERCADORIA) VENDA ON VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    if cdEmpresa>0 then
    add(' and VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
    add('WHERE');
     if cdEmpresa>0 then
        add('venda.CD_EMPRESA=:PcdEmpresa and');
    add('COMPRA.CD_GRUPO_FORNECEDOR NOT IN(98))');
    add('WHERE');
    add('MEDIA_DIA>0');
    add('AND (ESTOQUE_FISICO/MEDIA_DIA)>:PnrDiasInformado');
    if cdProduto>0 then
       add('AND CD_PRODUTO=:PcdProduto');
    if nrFornecedor>0 then
       add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    if nrComprador>0 then
      add('AND CD_COMPRADOR=:PnrComprador');}


    add('SELECT');
    if cdEmpresa>0 then
    begin
      ///add('  CD_EMPRESA');
      add(' LOCAL,');
    end;
     add(' CD_COMPRADOR');
    add(' ,NM_COMPRADOR_REDUZIDO');
    add(' ,CD_GRUPO_FORNECEDOR');
    add(' ,DS_GRUPO_FORNECEDOR');

   // add(' ,CD_MERCADORIA');
    add(' , CD_PRODUTO');
    add(' ,NM_MERCADORIA');
    add(' ,DS_APRESENTACAO_MERCADORIA');
    add(' , TIPO');
    add(' , ESTOQUE_FISICO');
    add(' , VL_CUSTO_FINANCEIRO');
    add(' , QT_VENDIDA  AS UNID_VENDIDA');
    add(' , MEDIA  AS MEDIA_DIA');
    add(' , DIAS_ESTOQUE');
    add(' , MEDIA_MENSAL');
    add(' , QT_ESTOQUE_MAXIMO');
    add(' , QT_ESTOQUE_MINIMO');
    add(' , NR_DIAS_ACIMA AS  NR_DIAS_EXCESSO');
    add(' , QT_DIAS_MEDIO_LEADTIME');
    add(' ,((DIAS_ESTOQUE-:PnrDiasInformado)*MEDIA) as NR_UNID_EXCESSO');
    add(' , VL_CUSTO_FINANCEIRO_MERCADORIA  AS VL_CUSTO');
    add(' , VL_PRECO_COMPRA');
    add(' , VL_PRECO_VENDA');
    add(' , (((DIAS_ESTOQUE - :PnrDiasInformado)*MEDIA) * VL_CUSTO_FINANCEIRO_MERCADORIA)  AS VL_EXCESSO_FINANCEIRO');
    add(' , (((DIAS_ESTOQUE - :PnrDiasInformado)*MEDIA) * VL_PRECO_COMPRA) AS VL_EXCESSO_COMPRA');
    add(' , (((DIAS_ESTOQUE - :PnrDiasInformado)*MEDIA) * VL_PRECO_VENDA) AS VL_EXCESSO_VENDA');
    add('');
    add('FROM');
    add('');
    add('(SELECT');
    if cdEmpresa>0 then
    begin
     add('  COMPRA.CD_EMPRESA');
     add('  ,NM_EMPRESA  AS LOCAL,');
    end;
    add('');
    add('  COMPRA.CD_MERCADORIA');
    add(' ,MERCADORIA.CD_MERCADORIA*10+ NR_DV_MERCADORIA AS CD_PRODUTO');
    add(' ,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
    add(' ,CD_COMPRADOR');
    add(' ,NM_COMPRADOR_REDUZIDO');
    add(' ,GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
    add(' ,DS_GRUPO_FORNECEDOR');
    add(' ,DECODE(DS_NIVEL_ECNM,1,''MED'',2,''PERF'',''OUTR'') TIPO');
    add('');
    add(' ,SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO) AS  ESTOQUE_FISICO');
    add(' ,ROUND(SUM(VL_CUSTO_FINANCEIRO_MERCADORIA * QT_FISICO),2) AS VL_CUSTO_FINANCEIRO');
    add(' ,SUM(QT_VENDIDA) AS QT_VENDIDA');
    add('');
    add(' ,CASE');
    add('   WHEN SUM(QT_PREVISAO)>0 THEN  ROUND(SUM(QT_PREVISAO)/30,2)');
    add('   WHEN SUM(QT_PREVISAO)<=0 THEN  ROUND(SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),2)');
    add('   WHEN SUM(QT_PREVISAO) IS NULL THEN  ROUND(SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),2)');
    add('  END MEDIA');
    add('');
    add(' ,CASE');
    add('   WHEN (SUM(QT_PREVISAO)>0) AND (SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)>0)   THEN  ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ROUND(SUM(QT_PREVISAO)/30,4),0)');
    add('   WHEN (SUM(QT_PREVISAO)<=0 ) AND (SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)>0)');
    add(' AND (SUM(NVL(QT_MEDIA_VENDA_DIARIA,0))>0) THEN ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),0)');
    add('   WHEN (SUM(QT_PREVISAO) IS NULL)  AND (SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)>0)  THEN  ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),0)');
    add('   ELSE 0');
    add('  END DIAS_ESTOQUE');
    add(' ,CASE');
    add('   WHEN SUM(QT_PREVISAO)>0 THEN  ROUND(SUM(QT_PREVISAO),4)');
    add('   WHEN SUM(QT_PREVISAO)<=0 THEN  SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)*30)');
    add('   WHEN SUM(QT_PREVISAO) IS NULL THEN SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)*30)');
    add('  END MEDIA_MENSAL');
    add('  ,ROUND(SUM(QT_ESTOQUE_MAXIMO+QT_DIAS_MEDIO_LEADTIME),0) AS  QT_ESTOQUE_MAXIMO');
    add('  ,ROUND(SUM(QT_ESTOQUE_MINIMO+QT_DIAS_MEDIO_LEADTIME),0) AS QT_ESTOQUE_MINIMO');
    add(' ,CASE');
    add('   WHEN (SUM(QT_PREVISAO)>0) AND (SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)>0)');
    add('   AND  (ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ROUND(SUM(QT_PREVISAO)/30,4),0)>AVG(QT_ESTOQUE_MAXIMO+QT_DIAS_MEDIO_LEADTIME))');
    add('  THEN  ROUND( ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ROUND(SUM(QT_PREVISAO)/30,4),0) - AVG(QT_ESTOQUE_MAXIMO+QT_DIAS_MEDIO_LEADTIME),0)');
    add('   WHEN (SUM(QT_PREVISAO)<=0 ) AND (SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)>0) AND (SUM(NVL(QT_MEDIA_VENDA_DIARIA,0))>0)');
    add(' THEN  ROUND( ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),0) -  AVG(QT_ESTOQUE_MAXIMO+QT_DIAS_MEDIO_LEADTIME),0)');
    add('   WHEN (SUM(QT_PREVISAO) IS NULL)  AND (SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)>0)');
    add('   AND (ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),0)> AVG(QT_ESTOQUE_MAXIMO+QT_DIAS_MEDIO_LEADTIME) )');
    add('  THEN  ROUND(SUM(QT_FISICO -QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO)/ SUM(NVL(QT_MEDIA_VENDA_DIARIA,0)),0)');
    add('   ELSE 0');
    add('  END NR_DIAS_ACIMA');
    add('  ,ROUND(AVG(QT_DIAS_MEDIO_LEADTIME)) QT_DIAS_MEDIO_LEADTIME');
    add('  ,ROUND(AVG(VL_CUSTO_FINANCEIRO_MERCADORIA),2) VL_CUSTO_FINANCEIRO_MERCADORIA');
    add('  ,ROUND(AVG(VL_PRECO_COMPRA),2) VL_PRECO_COMPRA');
    add('  ,ROUND(AVG(VL_PRECO_VENDA),2) VL_PRECO_VENDA');
    add('FROM');
    add(' PRDDM.DC_MERCADORIA MERCADORIA,');
    add(' PRDDM.DC_ESTOQUE_MERCADORIA EM,');
    add(' PRDDM.DC_FINANCEIRO_MERCADORIA FINA,');
    add(' PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    add(' LEFT OUTER JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA=COMPRA.CD_EMPRESA  AND  ID_EMPRESA_FISICA=''S''');
    add(' LEFT OUTER JOIN PRDDM.DC_COMPRADOR_GAM COMPRADOR ON COMPRADOR.NR_COMPRADOR=COMPRA.CD_COMPRADOR');
    add(' LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR ON  GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR');
    add(' LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA CURVA_GRUPO ON CURVA_GRUPO.CD_GRUPO_CURVA_FABRICANTE=GRUPO_FORNECEDOR.CD_GRUPO_CURVA_FABRICANTE AND CURVA_GRUPO.id_curva_mercadoria=compra.id_curva_mercadoria');
    add(' LEFT OUTER JOIN  PRDDM.DC_LEADTIME_FORNECEDOR LTIME ON  LTIME.CD_GRUPO_FORNECEDOR=COMPRA.CD_GRUPO_FORNECEDOR AND LTIME.CD_EMPRESA=COMPRA.CD_EMPRESA AND CD_LEADTIME=4 AND ID_TERMOLABIL=''N''');
    add(' LEFT OUTER JOIN (SELECT  COMPRA.CD_EMPRESA ,COMPRA.CD_MERCADORIA ,');
    add('       CASE');
    add('        WHEN  QT_PREVISAO>0 THEN QT_PREVISAO');
    add('        WHEN  QT_PREVISAO<=0 THEN 0');
    add('        WHEN QT_PREVISAO IS NULL THEN -9999');
    add('       END QT_PREVISAO,');
    add('       NVL(DT_PREVISAO ,TRUNC(SYSDATE,''MONTH'')) AS DT_PREVISAO');
    add('       FROM');
    add('       PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    add('       GAMLAB.DC_PREVISAO_VENDA PREVISAO_NOVA');
    add('       WHERE');
    add('        PREVISAO_NOVA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
    add('       AND PREVISAO_NOVA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
    add('       AND PREVISAO_NOVA.QT_PREVISAO(+)>=0');
       if nrFornecedor>0 then
     add('       AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    add('       AND DT_PREVISAO(+)=TRUNC(SYSDATE,''MONTH'')) PREVISAO ON COMPRA.CD_MERCADORIA=PREVISAO.CD_MERCADORIA AND  COMPRA.CD_EMPRESA=PREVISAO.CD_EMPRESA');
    add('');
    add('  LEFT OUTER JOIN  (SELECT VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,NVL(QT_MEDIA_VENDA_DIARIA,0) AS QT_MEDIA_VENDA_DIARIA ,QT_VENDIDA');
    add('  FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA,');
    add('          PRDDM.DC_COMPRA_MERCADORIA COMPRA');
    add('  WHERE');
    add('        VENDA.CD_MERCADORIA(+)=COMPRA.CD_MERCADORIA');
    add('       AND VENDA.CD_EMPRESA(+)=COMPRA.CD_EMPRESA');
     if nrFornecedor>0 then
       add('       AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    add('      AND CD_CANAL=0');
    add('      AND DT_VENDA_MERCADORIA=(SELECT MAX(DT_VENDA_MERCADORIA) FROM PRDDM.DW_VENDA_ACUMULADA_MERCADORIA )) MEDIA_NORMAL ON COMPRA.CD_MERCADORIA=MEDIA_NORMAL.CD_MERCADORIA');
    add('                                                                                                       AND  COMPRA.CD_EMPRESA=MEDIA_NORMAL.CD_EMPRESA');
    add('LEFT OUTER JOIN');
    add('     (SELECT');
    add('       ET.CD_MERCADORIA');
    add('      ,CD_EMPRESA_DESTINO');
    add('      ,SUM(NVL(QT_TRANSFERENCIA,0)) AS QT_TRANSFERENCIA');
    add('     ,SUM(NVL(QT_TRANSITO,0)) AS   QT_TRANSITO');
    add('   FROM');
    add('     PRDDM.DC_ESTOQUE_TRANSFERENCIA ET,');
    add('    PRDDM.DC_COMPRA_MERCADORIA CM');
    add('   WHERE');
    add('      ET.CD_MERCADORIA=CM.CD_MERCADORIA');
    add('   AND CD_EMPRESA_DESTINO=CM.CD_EMPRESA');
    add('   GROUP BY  ET.CD_MERCADORIA,CD_EMPRESA_DESTINO ) TRANS ON TRANS.CD_MERCADORIA= COMPRA.CD_MERCADORIA AND TRANS.CD_EMPRESA_DESTINO=COMPRA.CD_EMPRESA');
    add('LEFT OUTER JOIN (SELECT');
    add('  NROM_Y,');
    add('  CD_DESTINO,');
    add('  QT_PENDENCIA,');
    add('  QT_PEDIDO,');
    add('  QT_ATENDIDA,');
    add(' CD_EMPRESA AS CD_PEDIDO_CROSS');
    add('FROM');
    add('(SELECT');
    add('          NROM_Y,');
    add('          CD_EMPRESA_DESTINO CD_DESTINO,');
    add('          SUM(ITEM.QUAY_Y -ITEM.CHEY_Y) QT_PENDENCIA,');
    add('          SUM(ITEM.QUAY_Y) QT_PEDIDO,');
    add('          SUM(ITEM.CHEY_Y) QT_ATENDIDA,');
    add('           CAPA.CD_EMPRESA');
    add('  FROM');
    add('     PRDDM.DCPCC CAPA,');
    add('     PRDDM.DCPCI ITEM,');
    add('     ACESSO.DC_EMPRESA EMP');
    add('  WHERE NROP_P=NROP_Y');
    add('             AND SITP_P IN(''N'',''P'')');
    add('             AND SITY_Y IN(''N'',''P'')');
    add('       AND CAPA.CD_EMPRESA_DESTINO=EMP.CD_EMPRESA');
    add('       AND ((CAPA.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  CAPA.CD_OPERACAO_REDE=0)');
    add('       AND ID_EMPRESA_FISICA=''S''');
      if nrFornecedor>0 then
        add('       AND LABP_P=:PnrFornecedor');
    add('       GROUP BY CD_EMPRESA_DESTINO,NROM_Y,CAPA.CD_EMPRESA)) ITEMPEDIDO ON   ITEMPEDIDO.NROM_Y=COMPRA.CD_MERCADORIA AND ITEMPEDIDO.CD_DESTINO=COMPRA.CD_EMPRESA');
    add(' LEFT OUTER JOIN');
    add('(SELECT');
    add('');
    add('  PEDIDO_ITEM_NFE.CD_MERCADORIA,');
    add(' SUM(QT_MERCADORIA_ENTRADA) AS QT_MERCADORIA_ENTRADA,');
    add(' PEDIDO_ITEM_NFE.CD_EMPRESA,');
    add('   0 AS CD_EMPRESA_DESTINO');
    add(',CASE');
    add(' WHEN  SUM(QT_MERCADORIA_ENTRADA) >0 THEN ''S''');
    add(' ELSE ''N''');
    add(' END ID_PEDIDO_FATURADO');
    add('FROM');
    add(' PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE,');
    add(' PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
    add(' PRDDM.DC_NFE_ENTRADA NFE,');
    add(' PRDDM.DCPCC PED,');
    add(' PRDDM.DCPCI ITEMPED');
    add('WHERE');
    add('      ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
    add('  AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
    add('  AND NROP_P=NROP_Y');
    add('  AND SITY_Y IN(''N'',''P'')');
    add('  AND ((PED.CD_OPERACAO_REDE IN (SELECT CD_EMPRESA FROM ACESSO.DC_EMPRESA WHERE ID_OPERACAO_REDE=''N'' ) ) OR  PED.CD_OPERACAO_REDE=0)');
    add('  AND PED.CD_EMPRESA_DESTINO=ITEM_NFE.CD_EMPRESA');
    add('  AND NROM_Y=PEDIDO_ITEM_NFE.CD_MERCADORIA');
    add('  AND CD_PEDIDO=NROP_P');
    add('  AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
    add('  AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
    add('  AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
    add('  AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
    add('  AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
    add('  AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
    add('  AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
    add('  AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
    add('GROUP BY');
    add('         PEDIDO_ITEM_NFE.CD_MERCADORIA,');
    add('         PEDIDO_ITEM_NFE.CD_EMPRESA) NFE ON NFE.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
    add('                                         AND NFE.CD_EMPRESA=ITEMPEDIDO.CD_PEDIDO_CROSS');
    add('WHERE');
    add('   COMPRA.CD_MERCADORIA=EM.CD_MERCADORIA');
    add('AND COMPRA.CD_EMPRESA=EM.CD_EMPRESA');
    add('AND  COMPRA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND COMPRA.CD_MERCADORIA=FINA.CD_MERCADORIA');
    add('AND COMPRA.CD_EMPRESA=FINA.CD_EMPRESA');


    if cdEmpresa>0 then
      add('AND COMPRA.CD_EMPRESA=:PcdEmpresa');

    if nrFornecedor>0 then
       add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    add('AND COMPRA.ID_SITUACAO_MERCADORIA=''A''');
    if cdProduto>0 then
       add('AND MERCADORIA.CD_MERCADORIA*10+ NR_DV_MERCADORIA=:PcdProduto');
    if nrComprador>0 then
      add('  AND COMPRA.CD_COMPRADOR=:PnrComprador');;
    add('GROUP BY');
    if cdEmpresa>0 then
    begin
      add('  COMPRA.CD_EMPRESA');
      add(' ,NM_EMPRESA,');
    end;
    add(' COMPRA.CD_MERCADORIA');
    add(' ,MERCADORIA.CD_MERCADORIA*10+ NR_DV_MERCADORIA');
    add(' ,NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
    add(' ,CD_COMPRADOR');
    add(',NM_COMPRADOR_REDUZIDO');
    add(',GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
    add(',DS_GRUPO_FORNECEDOR');
    add(',DS_NIVEL_ECNM)');
    add('WHERE');
    add('DIAS_ESTOQUE>=:PnrDiasInformado');






   end;



    stQuery.SaveToFile('C:\temp\EstoqueAcimaDiasInformado.qry');
   with _cdsEstoque do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrDiasInformado').Asbcd:=nrDiasExcesso;
    if cdProduto>0 then
       Params.ParamByName('PcdProduto').Asbcd:=cdProduto;
    if nrFornecedor>0 then
       Params.ParamByName('PnrFornecedor').Asbcd:=nrFornecedor;
    if nrComprador>0 then
       Params.ParamByName('PnrComprador').Asbcd:=nrComprador;
    if cdEmpresa>0 then
       Params.ParamByName('PcdEmpresa').Asbcd:=cdEmpresa;
      open;
    end;
    Result:=true;
 finally
   FreeAndNil(stQuery);
 end;
end;

procedure T_frmEstoqueAcimadeXDias.SetGridEstoqueAcima(PnrCdEmpresa:Integer);
begin
  TIntegerField(_cdsEstoque.FieldByName('CD_COMPRADOR')).DisplayLabel:='Comprador';
  TIntegerField(_cdsEstoque.FieldByName('CD_COMPRADOR')).DisplayWidth:=5;

  TStringField(_cdsEstoque.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome';
  TStringField(_cdsEstoque.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=13;

  TIntegerField(_cdsEstoque.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Prod';
  TIntegerField(_cdsEstoque.FieldByName('CD_PRODUTO')).DisplayWidth:=7;

  TStringField(_cdsEstoque.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsEstoque.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsEstoque.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsEstoque.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=20;
  if PnrCdEmpresa>0 then
  begin
   TStringField(_cdsEstoque.FieldByName('LOCAL')).DisplayLabel:='Local';
   TStringField(_cdsEstoque.FieldByName('LOCAL')).DisplayWidth:=15;
  end;

  TIntegerField(_cdsEstoque.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsEstoque.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TStringField(_cdsEstoque.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
  TStringField(_cdsEstoque.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=20;

  TStringField(_cdsEstoque.FieldByName('TIPO')).DisplayLabel:='Tipo Prod.';
  TStringField(_cdsEstoque.FieldByName('TIPO')).DisplayWidth:=05;

 // TStringField(_cdsEstoque.FieldByName('ID_CURVA_MERCADORIA')).DisplayLabel:='Curva';
//  TStringField(_cdsEstoque.FieldByName('ID_CURVA_MERCADORIA')).DisplayWidth:=03;

  TIntegerField(_cdsEstoque.FieldByName('ESTOQUE_FISICO')).DisplayLabel:='Estoque';
  TIntegerField(_cdsEstoque.FieldByName('ESTOQUE_FISICO')).DisplayWidth:=8;
  TIntegerField(_cdsEstoque.FieldByName('ESTOQUE_FISICO')).DisplayFormat:='###,###,##0';

  TIntegerField(_cdsEstoque.FieldByName('UNID_VENDIDA')).DisplayLabel:='Qtd. Faturada';
  TIntegerField(_cdsEstoque.FieldByName('UNID_VENDIDA')).DisplayWidth:=8;
  TIntegerField(_cdsEstoque.FieldByName('UNID_VENDIDA')).DisplayFormat:='###,###,##0';

 // TIntegerField(_cdsEstoque.FieldByName('NR_DIAS_VENDA')).DisplayLabel:='Dias Vda.';
 // TIntegerField(_cdsEstoque.FieldByName('NR_DIAS_VENDA')).DisplayWidth:=5;
//  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS_VENDA')).DisplayFormat:='###,##0';

//  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_ESTOQUE_ZERO')).DisplayLabel:='Nr.Dias c/Estq 0';
//  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_ESTOQUE_ZERO')).DisplayWidth:=5;
//  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_ESTOQUE_ZERO')).DisplayFormat:='###,##0';

{  TIntegerField(_cdsEstoque.FieldByName('NR_PERIODO')).DisplayLabel:='Nr.Meses';
  TIntegerField(_cdsEstoque.FieldByName('NR_PERIODO')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('NR_PERIODO')).DisplayFormat:='###,##0';
 }
{  TFloatField(_cdsEstoque.FieldByName('MEDIA_SIS')).DisplayLabel:='Media da Base';
  TFloatField(_cdsEstoque.FieldByName('MEDIA_SIS')).DisplayWidth:=5;
  TFloatField(_cdsEstoque.FieldByName('MEDIA_SIS')).DisplayFormat:='###,##0.00';
 }
{  TFloatField(_cdsEstoque.FieldByName('MEDIA_CALC')).DisplayLabel:='Media da Calc.';
  TFloatField(_cdsEstoque.FieldByName('MEDIA_CALC')).DisplayWidth:=5;
  TFloatField(_cdsEstoque.FieldByName('MEDIA_CALC')).DisplayFormat:='###,##0.00';
 }
  TFloatField(_cdsEstoque.FieldByName('DIAS_ESTOQUE')).DisplayLabel:='Dias Estoq.';
  TFloatField(_cdsEstoque.FieldByName('DIAS_ESTOQUE')).DisplayWidth:=5;
  TFloatField(_cdsEstoque.FieldByName('DIAS_ESTOQUE')).DisplayFormat:='###,###,##0';



  TFloatField(_cdsEstoque.FieldByName('MEDIA_DIA')).DisplayLabel:='Media Dia';
  TFloatField(_cdsEstoque.FieldByName('MEDIA_DIA')).DisplayWidth:=5;
  TFloatField(_cdsEstoque.FieldByName('MEDIA_DIA')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsEstoque.FieldByName('MEDIA_MENSAL')).DisplayLabel:='Media Mensal';
  TFloatField(_cdsEstoque.FieldByName('MEDIA_MENSAL')).DisplayWidth:=5;
  TFloatField(_cdsEstoque.FieldByName('MEDIA_MENSAL')).DisplayFormat:='###,##0.00';

{  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS')).DisplayLabel:='Nr.Dias';
  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS')).DisplayFormat:='###,##0';

  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_VENDA')).DisplayLabel:='Nr.Dias Vda.';
  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_VENDA')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_VENDA')).DisplayFormat:='###,##0';

  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_VENDA')).DisplayLabel:='Nr.Dias Vda.';
  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_VENDA')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_VENDA')).DisplayFormat:='###,##0';
 }
  TIntegerField(_cdsEstoque.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayLabel:='Dias Estq.Max.';
  TIntegerField(_cdsEstoque.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayFormat:='###,##0';

  TIntegerField(_cdsEstoque.FieldByName('QT_ESTOQUE_MINIMO')).DisplayLabel:='Dias Estq.Min.';
  TIntegerField(_cdsEstoque.FieldByName('QT_ESTOQUE_MINIMO')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('QT_ESTOQUE_MINIMO')).DisplayFormat:='###,##0';

  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_MEDIO_LEADTIME')).DisplayLabel:='LeadTime Medio';
  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_MEDIO_LEADTIME')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('QT_DIAS_MEDIO_LEADTIME')).DisplayFormat:='###,##0';



  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS_EXCESSO')).DisplayLabel:='Nr.Dias Excesso.';
  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS_EXCESSO')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('NR_DIAS_EXCESSO')).DisplayFormat:='###,##0';


  TIntegerField(_cdsEstoque.FieldByName('NR_UNID_EXCESSO')).DisplayLabel:='Nr.Unid.Acima do Inf.';
  TIntegerField(_cdsEstoque.FieldByName('NR_UNID_EXCESSO')).DisplayWidth:=5;
  TIntegerField(_cdsEstoque.FieldByName('NR_UNID_EXCESSO')).DisplayFormat:='###,##0';

  TFloatField(_cdsEstoque.FieldByName('VL_CUSTO')).DisplayLabel:='Vlr.Unit.Custo';
  TFloatField(_cdsEstoque.FieldByName('VL_CUSTO')).DisplayWidth:=09;
  TFloatField(_cdsEstoque.FieldByName('VL_CUSTO')).DisplayFormat:='###,##0.00';


  TFloatField(_cdsEstoque.FieldByName('VL_CUSTO_FINANCEIRO')).DisplayLabel:='Vlr.Financ.Estq.';
  TFloatField(_cdsEstoque.FieldByName('VL_CUSTO_FINANCEIRO')).DisplayWidth:=12;
  TFloatField(_cdsEstoque.FieldByName('VL_CUSTO_FINANCEIRO')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsEstoque.FieldByName('VL_PRECO_COMPRA')).DisplayLabel:='Vlr.Unit.Compra';
  TFloatField(_cdsEstoque.FieldByName('VL_PRECO_COMPRA')).DisplayWidth:=09;
  TFloatField(_cdsEstoque.FieldByName('VL_PRECO_COMPRA')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsEstoque.FieldByName('VL_PRECO_VENDA')).DisplayLabel:='Vlr.Unit.Vda';
  TFloatField(_cdsEstoque.FieldByName('VL_PRECO_VENDA')).DisplayWidth:=09;
  TFloatField(_cdsEstoque.FieldByName('VL_PRECO_VENDA')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_FINANCEIRO')).DisplayLabel:='Vlr.Acima.Pco.Custo';
  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_FINANCEIRO')).DisplayWidth:=12;
  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_FINANCEIRO')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_COMPRA')).DisplayLabel:='Vlr.Acima.Pco.Compra';
  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_COMPRA')).DisplayWidth:=12;
  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_COMPRA')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_VENDA')).DisplayLabel:='Vlr.Acima.Pco.Vda';
  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_VENDA')).DisplayWidth:=12;
  TFloatField(_cdsEstoque.FieldByName('VL_EXCESSO_VENDA')).DisplayFormat:='###,##0.00';
end;

procedure T_frmEstoqueAcimadeXDias.ZeraTotalizadores;
begin
    _edtValordoAcimaCusto.Text:=FormatFloat('###,###,##0.00',0);
    _edtValorAcimaPcoCompra.Text:=FormatFloat('###,###,##0.00',0);
    _edtValorAcimaPcoVda.Text:=FormatFloat('###,###,##0.00',0);
    _edtNrUnidadesAcima.Text :=FormatFloat('###,###,##0',0);

end;

procedure T_frmEstoqueAcimadeXDias.ExecutaPesquisa;
var
 nrDiasEstoque,
 cdProduto,
 nrFornecedor,
 nrComprador,nrEmpresa :Integer;
begin
  ZeraTotalizadores;
  if not TestaConexaoBase(_dm._conexao, nrBase) then
  begin
    Mensagem('N?o conectado com Servidor',16);
    close;
    exit;
  end;
 nrEmpresa:=0;
 nrEmpresa   := StrToIntDef(copy(_cbxOpcaoCDs.Text,1,2),0);


 _btnExecuta.Enabled:=false;
 nrDiasEstoque:=StrToIntDef(_edtNrdiasEstoque.Text,0);
 cdProduto    :=StrToIntDef(_edtCodProduto.Text,0);
 nrFornecedor :=StrToIntDef(_edtNrFornecedor.Text,0);
 nrComprador  :=StrToIntDef(_edtNrComprador.Text,0);
 GeraTabelaEstoque(nrDiasEstoque,cdProduto,nrFornecedor,nrComprador,nrEmpresa);
 _dsEstoque.DataSet:=_cdsEstoque;
 _cdsEstoque.Open;
 if not _cdsEstoque.IsEmpty then
 begin
    _edtValordoAcimaCusto.Text:=FormatFloat('###,###,##0.00',_cdsEstoqueVT_ACIMA_CUSTO.AsVariant);
    _edtValorAcimaPcoCompra.Text:=FormatFloat('###,###,##0.00',_cdsEstoqueVT_ACIMA_COMPRA.AsVariant);
    _edtValorAcimaPcoVda.Text:=FormatFloat('###,###,##0.00',_cdsEstoqueVT_ACIMA_VENDA.AsVariant);
    _edtNrUnidadesAcima.Text :=FormatFloat('###,###,##0',_cdsEstoqueNR_UNIDADES_ACIMA.AsVariant);
 end;

 SetGridEstoqueAcima(nrEmpresa);
 _btnExecuta.Enabled:=true;
end;


Procedure T_frmEstoqueAcimadeXDias.CarregaCD;
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
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''S''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''N''');
    tempQuery.SQL.Add('order by CD_EMPRESA');
    tempQuery.Open;
    tempQuery.First;

    _cbxOpcaoCDs.Clear;

     _cbxOpcaoCDs.Items.Add(FormatFloat('00',0)+' - '+   'Todos' );
    while not tempQuery.eof do
    begin
       _cbxOpcaoCDs.Items.Add(  FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOpcaoCDs.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

end.
