unit uPedidoPreElaborado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,db, StdCtrls, Buttons, Grids, DBGrids, DBClient,
  uAuxiliarCompras;

type
  T_frmPedidoElabortado = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _edtNrComprador: TEdit;
    Label1: TLabel;
    _edtNrFornecedor: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    _cdsPedido: TClientDataSet;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    StatusBar2: TStatusBar;
    _dsPedido: TDataSource;
    BitBtn1: TBitBtn;
    Label12: TLabel;
    _cbxOpcaoCDs: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    function ExecutaPedidoElaborador(PnrComprador, PnrEmpresa,
      PnrFornecedor: Integer): TClientDataSet;
    procedure SetGridItens;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmPedidoElabortado: T_frmPedidoElabortado;

implementation

uses uDm, uProduto, uRotinasGenericas;

{$R *.dfm}

procedure T_frmPedidoElabortado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ACTION:=CAFREE;
end;


procedure T_frmPedidoElabortado.BitBtn1Click(Sender: TObject);
var
 nrComprador,
 nrEmpresa ,
 nrFornecedor :Integer;
 DadosFornecedor :TDadosFornecedor;


begin
 nrComprador:=StrToIntDef(_edtNrComprador.Text,0);
 nrFornecedor:=StrToIntDef(_edtNrFornecedor.Text,0);
 if _cbxOpcaoCDs.ItemIndex=0 then
     nrEmpresa :=0;
 if _cbxOpcaoCDs.ItemIndex=1 then
     nrEmpresa :=1;
 if _cbxOpcaoCDs.ItemIndex=2 then
     nrEmpresa :=4;
 if strtointdef(_edtnrfornecedor.text,0)>0then
 begin
   dadosfornecedor:=getdadoslaboratoriocomprador(strtointdef(_edtNrComprador.text,0),
                                                 strtointdef(_edtNrFornecedor.text,0));

  if dadosfornecedor<>nil then
  begin
    _edtNrComprador.text:=formatfloat('0000',dadosfornecedor.nrcomprador);
    if (strtointdef(_edtnrfornecedor.text,0)>0) and (dadosfornecedor.nrfornecedor=0) then
    begin
          mensagem('fornecedor n?o encontrado !!!',mb_iconwarning);
          _edtNrFornecedor.setfocus;
          exit;
    end;
  end;
 end;

   _cdsPedido:=ExecutaPedidoElaborador(nrComprador,nrEmpresa,nrFornecedor);

 if _cdsPedido<>nil then
 begin
   _dsPedido.DataSet:=_cdsPedido;
   _cdsPedido.Open;
   SetGridItens;
 end;

end;

function T_frmPedidoElabortado.ExecutaPedidoElaborador(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
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
      Add(' 0 AS QT_PENDENTE,');
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
      Add('WHERE');
      Add('MERCADORIA.CD_MERCADORIA>0');
      if PnrFornecedor>0 then
         Add('AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
         Add('AND CD_COMPRADOR=:PnrComprador');

      if PnrEmpresa>0 then
         Add('AND ESTOQUE_MERCADORIA.CD_EMPRESA=:PnrEmpresa');

      Add('AND DT_PRIMEIRA_COMPRA<>''01/01/2039''');

      Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
      Add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''))');
     // Add('AND TRUNC(GF.DT_AGENDAMENTO)>SYSDATE))');
      Add('WHERE');
      Add('COD_PRODUTO>0');

//      --SQL.Add('(ESTOQUE_DISPONIVEL  +qt_pendente ) -  Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0) <0');
//      SQL.Add('ORDER by CD_GRUPO_FORNECEDOR,NM_MERCADORIA,APRESENTACAO_MERCADORIA,CD_EMPRESA');
      end;
      stQry.SaveToFile('c:\temp\QryPedidoPreElaborado.sql');
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



procedure T_frmPedidoElabortado.SetGridItens;
begin
  TIntegerField(_cdsPedido.FieldByName('COD_PRODUTO')).DisplayLabel:='Cod.Prod.';
  TIntegerField(_cdspedido.FieldByName('COD_PRODUTO')).DisplayWidth:=8;

  TStringField(_cdspedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdspedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdspedido.FieldByName('APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdspedido.FieldByName('APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

  TIntegerField(_cdspedido.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayLabel:='Qtd.Embal.';
  TIntegerField(_cdspedido.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayWidth:=8;

  TFloatField(_cdspedido.FieldByName('VL_UNITARIO_COMPRA')).DisplayLabel:='P?o. Lista';
  TFloatField(_cdspedido.FieldByName('VL_UNITARIO_COMPRA')).DisplayFormat:='###,###,##0.00';
  TFloatField(_cdspedido.FieldByName('VL_UNITARIO_COMPRA')).DisplayWidth:=8;

  TStringField(_cdspedido.FieldByName('ID_CURVA_MERCADORIA')).DisplayLabel:='Curva';
  TStringField(_cdspedido.FieldByName('ID_CURVA_MERCADORIA')).DisplayWidth:=03;

  TIntegerField(_cdspedido.FieldByName('CD_GRUPO_CURVA_FABRICANTE')).DisplayLabel:='Grupo Fornec.';
  TIntegerField(_cdspedido.FieldByName('CD_GRUPO_CURVA_FABRICANTE')).DisplayWidth:=5;

  TFloatField(_cdspedido.FieldByName('DT_AGENDA')).DisplayLabel:='Dt.Agenda';
  TFloatField(_cdspedido.FieldByName('DT_AGENDA')).DisplayFormat:='dd/mm/yyyy';
  TFloatField(_cdspedido.FieldByName('DT_AGENDA')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdspedido.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TStringField(_cdspedido.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
  TStringField(_cdspedido.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TIntegerField(_cdspedido.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdspedido.FieldByName('CD_COMPRADOR')).DisplayWidth:=5;

  TIntegerField(_cdspedido.FieldByName('CD_EMPRESA')).DisplayLabel:='Empresa';
  TIntegerField(_cdspedido.FieldByName('CD_EMPRESA')).DisplayWidth:=5;

  TIntegerField(_cdspedido.FieldByName('QT_VENDA')).DisplayLabel:='Qtd. Venda';
  TIntegerField(_cdspedido.FieldByName('QT_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('QT_VENDA')).DisplayWidth:=8;

  TFloatField(_cdspedido.FieldByName('VL_MEDIA_DIARIA')).DisplayLabel:='M?dia Vda.Dia';
  TFloatField(_cdspedido.FieldByName('VL_MEDIA_DIARIA')).DisplayFormat:='###,##0.00';
  TFloatField(_cdspedido.FieldByName('VL_MEDIA_DIARIA')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayLabel:='Dias Estq.Max.';
  TIntegerField(_cdspedido.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayWidth:=8;

  TIntegerField(_cdspedido.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayLabel:='Dias de Falta';
  TIntegerField(_cdspedido.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayWidth:=8;

  TIntegerField(_cdspedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel:='Dias Estoque';
  TIntegerField(_cdspedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('NR_DIAS_ESTOQUE')).DisplayWidth:=8;


  TIntegerField(_cdspedido.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayLabel:='Freq.Compra';
  TIntegerField(_cdspedido.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayWidth:=8;

  TIntegerField(_cdspedido.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayLabel:='LeadTime';
  TIntegerField(_cdspedido.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayWidth:=8;

  TIntegerField(_cdspedido.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd.Pendente';
  TIntegerField(_cdspedido.FieldByName('QT_PENDENTE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('QT_PENDENTE')).DisplayWidth:=8;

  TIntegerField(_cdspedido.FieldByName('ESTOQUE_DISPONIVEL')).DisplayLabel:='Estoq.Dispon.';
  TIntegerField(_cdspedido.FieldByName('ESTOQUE_DISPONIVEL')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('ESTOQUE_DISPONIVEL')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('NR_DIAS')).DisplayLabel:='Proxima Entrada(dias)';
  TIntegerField(_cdspedido.FieldByName('NR_DIAS')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('NR_DIAS')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdspedido.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdspedido.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayLabel:='Previs?o Est.C/Pend.';
  TIntegerField(_cdspedido.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayWidth:=10;

  TIntegerField(_cdspedido.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayLabel:='Previs?o Est.S/Pend.';
  TIntegerField(_cdspedido.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdspedido.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayWidth:=10;

 end;


end.
