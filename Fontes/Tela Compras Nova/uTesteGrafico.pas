unit uTesteGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  Grids, DBGrids, DB, DBClient,DateUtils, ComCtrls;
type
 TDadosMedia = record
  vlMediaMes :Double;
  vlMediaDia :Double;
 end;

type
  T_frmComprasNova = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Chart1: TChart;
    Series1: TBarSeries;
    Series3: TBarSeries;
    Series2: TBarSeries;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    _cdsVendaFornecedor: TClientDataSet;
    _dsVendaFornecedor: TDataSource;
    _edt: TEdit;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    _cdsProduto: TClientDataSet;
    _dsPrtoduto: TDataSource;
    BitBtn2: TBitBtn;
    _dtpData: TDateTimePicker;
    _edtMediaEmpresa: TEdit;
    _edtMediaCd: TEdit;
    _edtMediaDia: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    _edtPendenciaMes: TEdit;
    _edtEstoque: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label3: TLabel;
    _lbEstoque: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure _cdsProdutoAfterRefresh(DataSet: TDataSet);
    procedure _cdsProdutoAfterScroll(DataSet: TDataSet);
    procedure _cdsProdutoAfterRowRequest(Sender: TObject;
      var OwnerData: OleVariant);
    procedure _dsPrtodutoDataChange(Sender: TObject; Field: TField);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
  private
    function AbreVendaLaboratorioMultiEmpresaAtual(PnrLaboratorio, PnrEmpresa,
      PnrOperadorLogistico: Integer): TClientDataSet;
    procedure FiltraVenda(PnrProduto, PnrEmpresa: Integer);
    Function AbreProdutosLaboratorio(nrLaboratorio,nrComprador: Integer):TClientDataSet;
    procedure MontaGrafico(PGrafico: TBarSeries;PnrProduto,PnrEmpresa:Integer);
    function QtadadeFiltraVenda(PnrProduto, PnrEmpresa, Pano,
      PMes: Integer): Integer;
    procedure MontaGraficoEmpresa(PGrafico: TBarSeries;PnrProduto,PnrEmpresa:Integer);
    procedure ZeraVendaAnual;
    procedure InicializaMesSelecionados;
    function CalculaMedia(PnrEmpresa:Integer): TDadosMedia;
    procedure MostraMedia;
    function getIndiceMes(PnmMes: String): Integer;
    procedure MostraDadosProduto(PnrQtdEstoque,
                                 PnrQtdPendente,
                                 PnrCoberturaEstoque,
                                 PnrCoberturaEstoquePendencia: Integer;
                                 PvlMediaMesEmpresa,
                                 PvlMediaMesCD,
                                 PvlMediaDiaCD:Double);
    { Private declarations }
  public
    { Public declarations }

  VendaAnual         : Array[0..6, 1..13]of integer;
  nrDiasEstoqueAZero : Array[0..6, 1..13]of integer;
  nrDiasMes          : Array[0..6, 1..13]of integer;
  idMesSelecionado   : Array[1..13] of string[1];

  nrQtadade,
  NrProduto,
  nrEmpresa :Integer;
  dtPedido :Tdate;

  end;

var
  _frmComprasNova: T_frmComprasNova;

   MesAno: array [1 .. 13] of STRING = (
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ',
    'ATUAL'
  );


implementation

uses uDM;

{$R *.dfm}

procedure T_frmComprasNova.BitBtn1Click(Sender: TObject);
var
  I,NrFornecedor: Integer;
  vlGrafico1,
  vlGrafico2,
  vlGrafico3,
  vlEixoX :Double;
  stMes :String;
begin
 Randomize;
 InicializaMesSelecionados;
 Series1.Clear;
 Series2.Clear;
 Series3.Clear;
 NrFornecedor:=StrToIntDef(_edt.Text,0);
 _cdsProduto:=AbreProdutosLaboratorio(NrFornecedor,7);

   _cdsVendaFornecedor:=AbreVendaLaboratorioMultiEmpresaAtual(NrFornecedor,0,1);
   if _cdsVendaFornecedor<>nil then
   begin
      _dsVendaFornecedor.DataSet:=_cdsVendaFornecedor;
      _cdsVendaFornecedor.Open;
   end;
   if _cdsProduto<>nil then
   begin
     _cdsProduto.Open;
     _dsPrtoduto.DataSet:=_cdsProduto;

   end;
end;


procedure T_frmComprasNova.BitBtn2Click(Sender: TObject);
begin
  MontaGrafico(Series1,0,0);
end;

procedure T_frmComprasNova.MontaGrafico(PGrafico:TBarSeries;PnrProduto,PnrEmpresa:Integer);
var
 _qtVenda:Integer;
  I,nrMaiorValor: Integer;
  Ano,
  Mes :Word;
  data :Tdate;
  stMes :String;
  corBarra: TColor;

begin
  _dtpData.Date:=date;
    PGrafico.Clear;
   Application.ProcessMessages;
   mes:=MonthOf(_dtpData.Date);
   data:= _dtpData.Date-mes+1;
   Ano:=YearOf(IncMonth(date, -mes));
   nrMaiorValor:=0;



   for I := mes to 12 do
   begin
     stMes := UpperCase(ShortMonthNames[i]);
     nrQtadade:=vendaAnual[PnrEmpresa,i];

     corBarra := clWhite;
     if PnrEmpresa=1 then
      corBarra := clTeal;
     if PnrEmpresa=4 then
      corBarra := $000080FF;
     //MUDAR COR CONFORME MES SELECIONADO
     if idMesSelecionado[I]='S' then
        corBarra:=clSkyBlue;

     PGrafico.Add(nrQtadade, stMes,corBarra );
     if nrQtadade>nrMaiorValor then
        nrMaiorValor:=nrQtadade;

   end;
   for I := 1 to mes-1 do
   begin

       corBarra := clWhite;
     if PnrEmpresa=1 then
      corBarra := clTeal;
     if PnrEmpresa=4 then
      corBarra := $000080FF;

     //MUDAR COR CONFORME MES SELECIONADO
     if idMesSelecionado[I]='S' then
        corBarra:=clSkyBlue;

     nrQtadade:=vendaAnual[PnrEmpresa,i];
     stMes := UpperCase(ShortMonthNames[i]);
     PGrafico.Add(nrQtadade, stMes,corbarra);
     if nrQtadade>nrMaiorValor then
        nrMaiorValor:=nrQtadade;
  end;
     corBarra := clWhite;
     if PnrEmpresa=1 then
      corBarra := clTeal;
     if PnrEmpresa=4 then
      corBarra := $000080FF;

     //MUDAR COR CONFORME MES SELECIONADO
     if idMesSelecionado[13]='S' then
        corBarra:=clSkyBlue;
     nrQtadade:=vendaAnual[PnrEmpresa,13];
     stMes := 'ATUAL';
     PGrafico.Add(nrQtadade, stMes,corbarra );
     if nrQtadade>nrMaiorValor then
        nrMaiorValor:=nrQtadade;
     Chart1.LeftAxis.SetMinMax(0,nrMaiorValor*1.35);

{  _cdsVendaFornecedor.First;
  while _cdsVendaFornecedor.Eof do
  begin

      PGrafico.Add()
    _cdsVendaFornecedor.Next;
  end;}

end;


procedure T_frmComprasNova.MontaGraficoEmpresa(PGrafico:TBarSeries;PnrProduto,PnrEmpresa:Integer);
var
 _qtVenda:Integer;
  I: Integer;
  Ano,
  Mes :Word;
  data :Tdate;
  stMes :String;
  nrQtadade,
  NrProduto,
  nrEmpresa :Integer;
begin
  _dtpData.Date:=date;
  Series2 .Clear;

   mes:=MonthOf(_dtpData.Date);
   data:= _dtpData.Date-mes+1;
   Ano:=YearOf(IncMonth(date, -mes));
   for I := mes to 12 do
   begin
     stMes := UpperCase(ShortMonthNames[I]);
     nrQtadade:=QtadadeFiltraVenda(PnrProduto,PnrEmpresa,ANO,I);
     Series2.Add(nrQtadade, stMes,clDefault );

   end;
   for I := 1 to mes-1 do
   begin

     nrQtadade:=QtadadeFiltraVenda(PnrProduto,PnrEmpresa,ANO+1,I);
     stMes := UpperCase(ShortMonthNames[i]);
     Series2.Add(nrQtadade, stMes,clDefault );
   end;

{  _cdsVendaFornecedor.First;
  while _cdsVendaFornecedor.Eof do
  begin

      PGrafico.Add()
    _cdsVendaFornecedor.Next;
  end;}

end;


PROCEDURE T_frmComprasNova.FiltraVenda(PnrProduto,PnrEmpresa:Integer);
var
 nrMes,
 nrQtdade,
 nrDias,
 nrDiasEstoqueZero :Integer;
begin
   if _cdsVendaFornecedor<>nil then
   begin
     with _cdsVendaFornecedor do
     begin
      filtered:=false;
      filter:='CD_MERCADORIA='+inttostr(PnrProduto)+' and CD_EMPRESA='+IntToStr(PnrEmpresa);
      filtered:=true;
     end;
     _cdsVendaFornecedor.First;
     while not _cdsVendaFornecedor.Eof do
     begin
        nrMes             :=_cdsVendaFornecedor.FieldByName('MES').AsInteger;
        nrQtdade          :=_cdsVendaFornecedor.FieldByName('NR_UNIDADES').AsInteger;
        nrDiasEstoqueZero :=_cdsVendaFornecedor.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
        nrDias         :=_cdsVendaFornecedor.FieldByName('NR_DIAS').AsInteger;
        VendaAnual[PnrEmpresa,nrMes]:=nrqtdade;
        nrDiasMes[PnrEmpresa,nrMes] :=nrDias;
        nrDiasEstoqueAZero[PnrEmpresa,nrMes]:=nrDiasEstoqueZero;
       _cdsVendaFornecedor.Next;
     end;

   end;
end;

procedure T_frmComprasNova.FormCreate(Sender: TObject);
begin
 dtPedido:=date;
end;

procedure T_frmComprasNova.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var
  DadosMedia :TDadosMedia;
begin
 case key of
    VK_return :begin
                 if _cdsProduto.Active then
                  begin

                      NrProduto:=_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
                      nrEmpresa:=_cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

                   FiltraVenda(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,
                              _cdsProduto.FieldByName('CD_EMPRESA').AsInteger);
                    Series2.Clear;
                    MontaGrafico(Series2,NrProduto,nrEmpresa);

                   FiltraVenda(_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger,0);
                    Series1.Clear;
                    MontaGrafico(Series1,NrProduto,0);
                    DadosMedia:=CalculaMedia(nrEmpresa);
                    _edtMediaCd.Text := FormatFloat('###,###0.00',DadosMedia.vlMediaMes );
                    _edtMediaEmpresa.Text := FormatFloat('###,###0.00',DadosMedia.vlMediaMes);
                  end;
                end;

{                VK_UP,VK_DOWN :begin
                 if _cdsProduto.Active then
                  begin
                      ZeraVendaAnual;
                      NrProduto:=_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
                      nrEmpresa:=_cdsProduto.FieldByName('CD_EMPRESA').AsInteger;

                      FiltraVenda(NrProduto,nrEmpresa);
                      Series2.Clear;
                      MontaGrafico(Series2,NrProduto,nrEmpresa);
                      FiltraVenda(NrProduto,0);
                    Series1.Clear;
                    MontaGrafico(Series1,NrProduto,0);
                    _edtMediaEmpresa.Text := FormatFloat('###,###0.00',CalculaMedia(0));
                    _edtMediaCd.Text      := FormatFloat('###,###0.00',CalculaMedia(nrEmpresa));

//                    MontaGraficoEmpresa(Series2,NrProduto,nrEmpresa);
                  end;
                end;    }

 end;

end;

function T_frmComprasNova.QtadadeFiltraVenda(PnrProduto,PnrEmpresa,Pano,PMes:Integer):Integer;
begin
   if _cdsVendaFornecedor<>nil then
   begin
     with _cdsVendaFornecedor do
     begin
      filtered:=false;
      filter:='CD_MERCADORIA='+inttostr(PnrProduto)+' and CD_EMPRESA='+IntToStr(PnrEmpresa)+
              ' AND ANO='+inttostr(PaNO)+' and MES='+IntToStr(pMES);
      filtered:=true;
     end;
     result:=0;
     if not _cdsVendaFornecedor.IsEmpty then
        result:=_cdsVendaFornecedor.FieldByName('nr_unidades').AsInteger;
   end;
end;


Function T_frmComprasNova.AbreVendaLaboratorioMultiEmpresaAtual(PnrLaboratorio,
                                               PnrEmpresa,
                                               PnrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
 _cdsTemp:TClientDataSet;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

      with stQry do
      begin
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('VENDA.CD_MERCADORIA,');
        Add('VENDA.CD_EMPRESA,');
        Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) ANO,');
        Add('CASE');
        Add(' WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
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
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_MEDIA_VENDA_DIARIA) VL_MEDIA,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('max(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(NVL(VT_CMV,0)) AS VT_CUSTO_MEDIO,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO,');
         if PnrOperadorLogistico>1 then
        add(',venda.CD_OPERADOR_LOGISTICO,');

        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) THEN   EXTRACT(DAY FROM Last_Day(DT_VENDA_MERCADORIA))');
        Add('ELSE EXTRACT(DAY FROM Trunc(SYSDATE)-1)');
        Add('END nr_dias  ');

        Add(' FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add(' AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Add('GROUP BY VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,DT_VENDA_MERCADORIA');
         if PnrOperadorLogistico>1 then
           add(',venda.CD_OPERADOR_LOGISTICO');

        Add('UNION ALL');
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('VENDA.CD_MERCADORIA,');
        Add('0 AS CD_EMPRESA,');
        Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) ANO,');
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
        Add('    SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_MEDIA_VENDA_DIARIA) VL_MEDIA,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('max(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(NVL(VT_CMV,0)) AS VT_CUSTO_MEDIO,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO,');
         if PnrOperadorLogistico>1 then
        add(',venda.CD_OPERADOR_LOGISTICO,');

        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) THEN   EXTRACT(DAY FROM Last_Day(DT_VENDA_MERCADORIA))');
        Add('ELSE EXTRACT(DAY FROM Trunc(SYSDATE)-1)');
        Add('END nr_dias  ');


        Add('FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add('AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
        Add('GROUP BY VENDA.CD_MERCADORIA,DT_VENDA_MERCADORIA');
        if PnrOperadorLogistico>1 then
         add(',venda.CD_OPERADOR_LOGISTICO');

        Add(' --,VENDA.CD_OPERADOR_LOGISTICO');
       Add('ORDER BY CD_MERCADORIA,ANO,MES,CD_EMPRESA');
      end;

      stQry.SaveToFile('c:\temp\qryVendaFornecedor.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        Params.ParamByName('PnrFornecedor').AsInteger := PnrLaboratorio;
        open;
      end;
      if not _cdsTemp.isEmpty then
        _cdsTemp.IndexFieldNames := 'CD_MERCADORIA';

      result := _cdsTemp;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;



Function T_frmComprasNova.AbreProdutosLaboratorio(nrLaboratorio,nrComprador: Integer):TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp :TClientDataSet;
begin
      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    // stQry.Add('-- MERCADORIA

    stQry.Add('COMPRA.CD_EMPRESA,MERCADORIA.CD_MERCADORIA,NR_DV_MERCADORIA,');
    stQry.Add('MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
    stQry.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    stQry.Add('trim(NM_MERCADORIA)||''  ''||trim(DS_APRESENTACAO_MERCADORIA) AS NM_COMPLETO,');
    stQry.Add('DS_SIGLA_MERCADORIA,DS_SIGLA_RESUMIDA,');
    stQry.Add('NR_LISTA_ABAFARMA,');
    stQry.Add('ID_REFRIGERADO,ID_VENDA_EXCLUSIVA_HOSPITALAR,');
    stQry.Add('ID_ORGAO_PUBLICO, ID_ORIGEM_MERCADORIA,');
    stQry.Add('CD_INTERNO_LABORATORIO,DS_UNIDADE_MEDIDA,');
    stQry.Add('QT_PESO_MERCADORIA, QT_EMBALAGEM_COMPRA,');
    stQry.Add('QT_EMBALAGEM_VENDA, mercadoria.ID_SITUACAO_MERCADORIA,');
    stQry.Add('CD_EAN_COMPRA,  CD_EAN_VENDA,');
    stQry.Add('QT_LARGURA_MERCADORIA, QT_ALTURA_MERCADORIA,');
    stQry.Add('QT_PROFUNDIDADE_MERCADORIA, QT_LARGURA_CAIXA,');
    stQry.Add('QT_ALTURA_CAIXA, QT_PROFUNDIDADE_CAIXA,');
    stQry.Add('((QT_LARGURA_MERCADORIA * QT_ALTURA_MERCADORIA');
    stQry.Add('*QT_PROFUNDIDADE_MERCADORIA)/1000000) AS MTS_CUBICO,');
    stQry.Add('ID_INATIVACAO_FUTURA, COMPRA.DT_INATIVACAO, DS_OBSERVACAO_INATIVACAO,');
    stQry.Add('ID_VENDA_MERCADO, ID_REVISTA,');
    stQry.Add('CD_FAMILIA_MARKETING, NR_FAMILIA_MERCADORIA,');
    stQry.Add('NR_NCM, DS_MINISTERIO_SAUDE,');
    stQry.Add('DS_NIVEL_ECNM, DS_NIVEL_EMAM, DS_NIVEL_ERGM, DS_NIVEL_EPRM, DS_NIVEL_ERTM,');
    stQry.Add('DS_NIVEL_ECTM, DS_NIVEL_EITM, DS_NIVEL_ESIM,');
    stQry.Add('VL_PESO_CAIXA,NR_EXTENSAO_IPI, ID_CALCULA_PRECO,');
    stQry.Add('QT_MULTIPLO_ALIMENTAR, QT_MULTIPLO_FARMA,');
    stQry.Add('ID_PACK_PROMOCIONAL, ID_VINCULADO_PACK,');
    stQry.Add('VL_TEMPERATURA_MINIMA, VL_TEMPERATURA_MAXIMA,');
    stQry.Add('DS_MERCADORIA, DT_ATUALIZACAO_SID, DT_ATUALIZACAO_MERCADORIA,');
    stQry.Add('CD_GRUPO_FORNECEDOR,');
    stQry.Add('ID_REPASSE_ICMS, ID_SUPERFLUO, ID_RETEM_ICMS, ID_CIPADO,');
    stQry.Add('ID_TIPO_LISTA_FISCAL,ID_REDUCAO_BASE, ID_TRIBUTACAO_NFE,');
    stQry.Add('CD_TRIBUTACAO_ICMS, CD_CST, CD_CST_PIS_VENDA,CD_CST_COFINS_VENDA,');
    stQry.Add('CD_CST_ENTRADA, CD_CST_SAIDA, PC_CREDITO_ICMS, PC_MARGEM_VENDA,');
    stQry.Add('PC_MARGEM_VENDA_ALIMENTAR, PC_IPI_MERCADORIA, DT_CADASTRO_MERCADORIA,');
    stQry.Add('DT_ULTIMA_ENTRADA,DT_ULTIMA_SAIDA, ID_COFINS, ID_PIS,');
    stQry.Add('VL_PRECO_COMPRA,VL_PRECO_VENDA,');
    stQry.Add('ID_VENDA_AUTORIZADA, ID_PROMOCAO_COTACAO_QTD,DT_ATUALIZACAO_FISCAL,');
    stQry.Add('PC_DESCONTO_PADRAO_COMPRA,COMPRA.ID_SITUACAO_MERCADORIA,CD_CST_PIS_COMPRA,');
    stQry.Add('CD_CST_COFINS_COMPRA,0.00 as PC_REPASSE_COMPRA,COMPRA.ID_CURVA_MERCADORIA,');
    stQry.Add('DT_PRIMEIRA_COMPRA,CD_LOCALIZACAO, QT_CXA_CAMADA_LOGISTICO,');
    stQry.Add('QT_CXA_PALETE_LOGISTICO,QT_FISICO, QT_RESERVADO, QT_PEDIDO,');
    stQry.Add('QT_RESERVA_PROBLEMATICA,QT_VENCIDO ,QT_BLOQUEADO,');
    stQry.Add('QT_CAIXA_PALETE ,QT_CAIXA_CAMADA,');
    stQry.Add('CASE');
    stQry.Add('WHEN  QT_FISICO - QT_RESERVADO - ');
    stQry.Add('QT_RESERVA_PROBLEMATICA - QT_VENCIDO - QT_BLOQUEADO <0 THEN 0');
    stQry.Add('ELSE QT_FISICO - QT_RESERVADO - QT_RESERVA_PROBLEMATICA');
    stQry.Add('end ESTOQUE_FISICO,');
    // stQry.Add('QT_FISICO - QT_RESERVADO - QT_PEDIDO - QT_RESERVA_PROBLEMATICA');
    // stQry.Add('- QT_VENCIDO - QT_BLOQUEADO AS ESTOQUE_FISICO,');
    stQry.Add('DT_ATUALIZACAO_ESTOQUE, ESTOQUE.ID_SITUACAO_MERCADORIA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_MERCADORIA  MERCADORIA,');
    stQry.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
    stQry.Add('PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,');
    stQry.Add('PRDDM.DC_FISCAL_MERCADORIA FISCAL,');
    stQry.Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
    stQry.Add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE');
    stQry.Add('WHERE');
    stQry.Add('MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
    stQry.Add('AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA');
    stQry.Add('AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA');
    stQry.Add('AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
    stQry.Add('AND FINANCEIRO.CD_EMPRESA=ESTOQUE.CD_EMPRESA');

    stQry.Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA <>''I''');
    stQry.Add('AND COMPRA.ID_SITUACAO_MERCADORIA <>''I''');
    stQry.Add('AND ESTOQUE.ID_SITUACAO_MERCADORIA <>''I''');
    // stQry.Add('AND COMPRA.CD_EMPRESA=1');

//    stQry.Add('AND COMPRA.CD_COMPRADOR=:PnrComprador');
    stQry.Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFabricante');
    stQry.Add('ORDER BY COMPRA.CD_MERCADORIA,COMPRA.CD_EMPRESA');
    stQry.SaveToFile('C:\temp\QryProdutoGrafico.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
   //   Params.ParamByName('PnrComprador').AsInteger  := nrComprador;
      Params.ParamByName('PnrFabricante').AsInteger := nrLaboratorio;
      open;
    end;
    Result:=nil;
    if not _cdsTemp.IsEmpty then
       Result:=_cdsTemp;

    Application.ProcessMessages;
  finally
    FreeAndNil(stQry);
  end;
end;



procedure T_frmComprasNova.ZeraVendaAnual;
var
  I: Integer;
  j: Integer;
begin
    for j := 0 to 6 do
        for I := 1 to 13 do
        begin
          VendaAnual[j,i]:=0;
          nrDiasEstoqueAZero[j,i]:=0;
          nrDiasMes[j,i]:=0;
        end;
end;
procedure T_frmComprasNova._cdsProdutoAfterRefresh(DataSet: TDataSet);
begin
MostraMedia;
end;

procedure T_frmComprasNova._cdsProdutoAfterRowRequest(Sender: TObject;
  var OwnerData: OleVariant);
begin
MostraMedia;
end;

procedure T_frmComprasNova._cdsProdutoAfterScroll(DataSet: TDataSet);
begin
MostraMedia;
end;

procedure T_frmComprasNova._dsPrtodutoDataChange(Sender: TObject; Field: TField);
begin
MostraMedia;
end;

procedure T_frmComprasNova.InicializaMesSelecionados;
var
  I: Integer;
begin
        for I := 1 to 13 do
             idMesSelecionado[i]:='N';

  idMesSelecionado[MonthOf(IncMonth(dtPedido, -3))] := 'S';
  idMesSelecionado[MonthOf(IncMonth(dtPedido, -2))] := 'S';
  idMesSelecionado[MonthOf(IncMonth(dtPedido, -1))] := 'S';
end;


function T_frmComprasNova.CalculaMedia(PnrEmpresa:Integer):TDadosMedia;
var
  I: Integer;
  nrAcumulaVenda:Integer;
  nrAcumulaNrDias,
  nrAcumulaNrDiasVenda,
  nrAcumulaNrDiasEstoqueZero,
  nrAcumulaNrMes:Integer;
  
begin
  nrAcumulaVenda:=0;
  nrAcumulaNrDias:=0;
  nrAcumulaNrMes:=0;
  nrAcumulaNrDiasEstoqueZero:=0;
  nrAcumulaNrDiasVenda:=0;

  for I := 1 to 13 do
  begin
     if idMesSelecionado[i]='S' then
     begin
         nrAcumulaVenda    := nrAcumulaVenda + vendaAnual[PnrEmpresa,i];
         inc(nrAcumulaNrMes);
         nrAcumulaNrDiasEstoqueZero:=nrAcumulaNrDiasEstoqueZero +  nrDiasEstoqueAZero[PnrEmpresa,i];
         nrAcumulaNrDiasVenda      :=nrAcumulaNrDiasVenda  + nrDiasMes[PnrEmpresa,i];
     end;

 end;
     if (nrAcumulaNrMes>0) and (((nrAcumulaNrDiasVenda -nrAcumulaNrDias)*nrAcumulaNrDiasVenda)>0) then
     begin
        Result.vlMediaMes:= ((nrAcumulaVenda/(nrAcumulaNrDiasVenda -nrAcumulaNrDias))*nrAcumulaNrDiasVenda)/  nrAcumulaNrMes;
       if (nrAcumulaNrDiasVenda -nrAcumulaNrDias)>0 then
          Result.vlMediaDia:= nrAcumulaVenda/(nrAcumulaNrDiasVenda -nrAcumulaNrDias)
     end;



end;


procedure T_frmComprasNova.Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
  stMes: String;
  nrMes: Integer;
begin
  if Series2.Active then
  begin
    nrMes := ValueIndex;
    stMes := Series2.XLabel[ValueIndex];
    nrMes := getIndiceMes(stMes);
    if stMes <> '' then
      sleep(0);
    if idMesSelecionado[nrMes] = 'S' then
      idMesSelecionado[nrMes] := 'N'
    else
      idMesSelecionado[nrMes] := 'S';
      MostraMedia;
//  MostraGraficoVendaGrid;
  //MostraDaDosCalculoGrid
  end;


end;

procedure T_frmComprasNova.MostraMedia;
var
 DadosMedia   :TDadosMedia;
 nrQtdEstoque :Integer;
 vlMediaMesCD :Double;
 vlMediaDiaCD :Double;
begin
                      ZeraVendaAnual;
                      vlMediaMesCD:=0;

                      NrProduto   :=_cdsProduto.FieldByName('CD_MERCADORIA').AsInteger;
                      nrEmpresa   :=_cdsProduto.FieldByName('CD_EMPRESA').AsInteger;
                      nrQtdEstoque:=_cdsProduto.FieldByName('ESTOQUE_FISICO').AsInteger;



                      FiltraVenda(NrProduto,nrEmpresa);
                      Series2.Clear;
                      MontaGrafico(Series2,NrProduto,nrEmpresa);
                      DadosMedia:=CalculaMedia(nrEmpresa);

                      vlMediaMesCD:= DadosMedia.vlMediaMes;




                      FiltraVenda(NrProduto,0);
                      Series1.Clear;
                      MontaGrafico(Series1,NrProduto,0);
                      DadosMedia:=CalculaMedia(0);




                      MostraDadosProduto(nrQtdEstoque, //PnrQtdEstoque,
                                         0,//PnrQtdPendente,
                                         0,//PnrCoberturaEstoque,
                                         0,//PnrCoberturaEstoquePendencia
                                         DadosMedia.vlMediaMes,
                                         vlMediaMesCD,
                                         vlMediaDiaCD);


end;



procedure T_frmComprasNova.MostraDadosProduto(PnrQtdEstoque,
                                          PnrQtdPendente,
                                          PnrCoberturaEstoque,
                                          PnrCoberturaEstoquePendencia:Integer;
                                          PvlMediaMesEmpresa,
                                          PvlMediaMesCD,
                                          PvlMediaDiaCD:Double);
begin

_edtEstoque.Text      := FormatFloat('###,###0',PnrQtdEstoque);
_edtMediaEmpresa.Text := FormatFloat('###,###0',PvlMediaMesEmpresa);
_edtMediaCd.Text      := FormatFloat('###,###0',PvlMediaMesCD );
_edtMediaDia.Text     := FormatFloat('###,###0.00',PvlMediaDiaCD );



end;
Function T_frmComprasNova.getIndiceMes(PnmMes: String): Integer;
var
  I: Integer;
begin
  for I := 1 to 13 do
  begin
    if MesAno[I] = PnmMes then
    begin
      Result := I;
      break;
    end;
  end;
end;


end.
