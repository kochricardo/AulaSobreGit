unit uGraficoPedidoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dateUtils, ComCtrls, Series, TeEngine, ExtCtrls, TeeProcs, Chart, StdCtrls, DB,
  DBClient, RpBase, RpSystem, RpCon, RpDefine, RpRave,
  RPTChart, RpConDS, Buttons, uSqlConsultaSistemas;
 type
   TRegistroCompra = record
   dtPedido      : Tdate;
   QtPedido      : Integer;
   idStatus      :String[1];
 end;

type
  T_frmGraficoPedidoVendas = class(TForm)
    StatusBar1: TStatusBar;
    _gbGraficoEstoqueRS: TGroupBox;
    _chtGraficoRS: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series6: TBarSeries;
    _gbGraficoEstoqueSc: TGroupBox;
    _chtGraficoSC: TChart;
    _cdsPosicaoEstoqueSC: TClientDataSet;
    _cdsProdutos: TClientDataSet;
    _cdsVenda: TClientDataSet;
    Series10: TLineSeries;
    Series11: TLineSeries;
    _cdsUltimasCompras: TClientDataSet;
    Series12: TBarSeries;
    Series13: TBarSeries;
    Series14: TBarSeries;
    Series15: TBarSeries;
    _cdsEntradas: TClientDataSet;
    Series16: TBarSeries;
    _cdsPosicaoEstoqueRS: TClientDataSet;
    Series4: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    _gbGraficoVenda: TGroupBox;
    _chtGraficoVendaSC: TChart;
    _cdsVendaAnual: TClientDataSet;
    Series17: TBarSeries;
    _gbGraficoVendaRS: TGroupBox;
    _chtGraficoVendaRS: TChart;
    Series18: TBarSeries;
    RvProject1: TRvProject;
    RvCustomConnection1: TRvCustomConnection;
    RvSystem1: TRvSystem;
    RvCustomConnection2: TRvCustomConnection;
    _cdsDadosProdutoSC: TClientDataSet;
    _cdsDadosProdutoSCNR_COMPRADOR: TIntegerField;
    _cdsDadosProdutoSCNM_COMPRADOR: TStringField;
    _cdsDadosProdutoSCVL_MEDIA: TFloatField;
    _cdsDadosProdutoSCNR_GRUPO: TIntegerField;
    _cdsDadosProdutoSCNR_ESTOQUE_MAXIMO: TIntegerField;
    _cdsDadosProdutoRS: TClientDataSet;
    _cdsDadosProdutoRSNR_COMPRADOR: TIntegerField;
    _cdsDadosProdutoRSNM_COMPRADOR: TStringField;
    _cdsDadosProdutoRSVL_MEDIA: TFloatField;
    _cdsDadosProdutoRSNR_GRUPO: TIntegerField;
    _cdsDadosProdutoRSNR_ESTOQUE_MAXIMO: TIntegerField;
    rdsDadosProdutosSC: TRvDataSetConnection;
    rdsDadosProdutosRS: TRvDataSetConnection;
    _btnImprimir: TBitBtn;
    _cdsDadosProdutoRSNR_LEADTIME: TIntegerField;
    _cdsDadosProdutoSCNR_LEADTIME: TIntegerField;
    _cdsPedidoFornecedor: TClientDataSet;
    Series5: TLineSeries;
    Series19: TPointSeries;
    Series20: TPointSeries;
    _cdsPosicaoEstoqueGeral: TClientDataSet;
    _cdsEntradasFornecedor: TClientDataSet;
    Series21: TPointSeries;
    Series22: TPointSeries;
    _edtMediaSC: TEdit;
    _edtMediaRs: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    _chkDefinirImpressora: TCheckBox;
    Label3: TLabel;
    _edtSomaVendaRS: TEdit;
    _edtSomaVendaSC: TEdit;
    Label4: TLabel;
    _edtNrDiasVendaRS: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    _edtNrDiasVendaSC: TEdit;
    _edtDiasSemEstoqueSC: TEdit;
    Label7: TLabel;
    _edtDiasSemEstoqueRS: TEdit;
    Label8: TLabel;
    _cdsTabelaPedido: TClientDataSet;
    _cdsTabelaEntradas: TClientDataSet;
    _cdsDadosPedido: TClientDataSet;
    _cdsDadosPedidoDT_PEDIDO: TDateField;
    _cdsDadosPedidoDT_ENTRADA_NFE: TDateField;
    _cdsDadosPedidoQT_PEDIDO: TIntegerField;
    _cdsDadosPedidoQT_ENTRADA: TIntegerField;
    _cdsDadosPedidoQT_SUGERIDA: TIntegerField;
    _cdsDadosPedidoDT_VALIDADE: TDateField;
    _cdsDadosPedidoDT_EMISSAO_NFE: TDateField;
    _cdsDadosPedidoNR_PEDIDO: TIntegerField;
    _cdsDadosPedidoNR_TOTAL_QTD_PEDIDO: TAggregateField;
    _cdsDadosPedidoNR_TOTAL_QTD_FATURADA: TAggregateField;
    _cdsDadosPedidoNR_LEADTIME: TIntegerField;
    _cdsDadosPedidoNR_LEADTIME_FORN: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RvCustomConnection1GetCols(Connection: TRvCustomConnection);
    procedure RvCustomConnection1GetRow(Connection: TRvCustomConnection);
    procedure RvCustomConnection2GetCols(Connection: TRvCustomConnection);
    procedure RvCustomConnection2GetRow(Connection: TRvCustomConnection);
    procedure _btnImprimirClick(Sender: TObject);
    procedure _chtGraficoSCClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure _chtGraficoSCMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure _chtGraficoRSClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure LimpaGrafico;
    procedure MontagraficoRS(PnrProduto:Integer);
    procedure MontagraficoSC(PnrProduto:Integer);
//    function CalculaMedia(PnrEmpresa: Integer): Double;
    procedure filtraVendaEmpresa(PnrCd: Integer);
    function FiltraCompras(PcdEmpresa: Integer): Boolean;
    function MontaGraficoUltimasCompras(PnrProduto, PnrEmpresa: Integer;
      PdtCompra: tdate;nrPosicaoGrafico:Integer): Boolean;
    function MontaGraficoEntradaSC(PnrProduto, PnrEmpresa: Integer;
      PdtCompra: tdate): Boolean;
    function FiltraEntrada(PnrProduto, PnrEmpresa: Integer;
      dtCompra: tdate): TRegistroCompra;
    function MontaGraficoUltimasComprasRS(PnrProduto, PnrEmpresa: Integer;
      PdtCompra: tdate): Boolean;
    function MontaGraficoEntradaRS(PnrProduto, PnrEmpresa: Integer;
      PdtCompra: tdate): Boolean;
    procedure MontaGraficoVenda(PnrProduto: Integer);
    function FiltraVendaAnual(PnrCD,PAno,PMes: Integer):Integer;
    procedure ZeraListaVenda;
    procedure CarregaListaVenda(PnrCd,PnrProduto,PAnoAnterior,PAnoAtual:Integer);
    function MontaGraficoVendasSC(PnrProduto, PnrEmpresa: Integer;
      PdtCompra: tdate): Boolean;
    procedure CarregaListaVendaRS(PnrCd, PnrProduto, PAnoAnterior,
      PAnoAtual: Integer);
    function MontaGraficoVendasRS(PnrProduto, PnrEmpresa: Integer;
      PdtCompra: tdate): Boolean;
    procedure CarregadosProdutoSC(PnrComprador: Integer;
                                  PnmComprador: String;
                                  PvlMedia: Double;
                                  PnrGrupo,
                                  PnrEstoqueMaximo:Integer;
                                  PnrLeadTime: Double);
    procedure CarregadosProdutoRS(PnrComprador: Integer; PnmComprador: String;
      PvlMedia: Double; PnrGrupo, PnrEstoqueMaximo,PnrLeadTime: Integer);

    function FiltraPedidoFornecedor(PnrEmpresa,PnrFornecedor:Integer;PdtPedido:TDate):boolean;
    procedure MontaGraficoPedidoFornecedor(PvlPosicao:Double;PnrEmpresa, PnrFornecedor: Integer;
      PdtPedido: Tdate);
    function MaiorPosicaoEstoque(PnrCd: Integer): Integer;
    function FiltraPosicaoEstoque(PnrCd: Integer): Integer;
    function FiltraEntradafornecedor(PnrFornecedor, PnrEmpresa: Integer;
      dtCompra: tdate): Boolean;
    function FiltroTabelaPedido(PnrEmpresa, PnrProduto: Integer; PdtPedido: String): TDadosPedido;
    procedure PreencheDadoPedido;
    function FiltroItemdaNota(PnrEmpresa,PnrProduto,PnrPedido:Integer;PdtEntada:Tdate): TDadosItemNota;
    procedure PreencheDadosPedidoNovos(PnrEmpresa,PnrPedido,PnrProduto:Integer);
    procedure FiltraProdutoEmpresa(PnrProduto, PnrEmpresa: Integer);
    { Private declarations }
  public
    vlMAximoGraficoSC,
        vlMAximoGraficoRS:Double;
    DadosPedido  :TDadosPedido;
    DadosItemNota:TDadosItemNota;

    { Public declarations }
    function FiltraUltimasCompras(nrProduto, PcdEmpresa: Integer;
      dtCompra: tdate): TRegistroCompra;

//     ListaVendaAnual: array[50..100,1..13] of Integer;

  end;

var
  _frmGraficoPedidoVendas: T_frmGraficoPedidoVendas;
  nrProdutoGrafico,
  cdProdutoGrafico,cdProdutoReduzido:Integer;
   nrRecno :Integer;
   idMontouGrafico:boolean;
  idPoiscaoGrid:TBookmark;
  ListaVenda:array[2014..2060,1..13] of Integer;
  ListaVendaAtual:array[1..13] of Integer;
  idProcessando:Boolean;
  cdsTemporario:TClientDataSet;


implementation

uses  uRotinasGenericas, udm, uDadosPedido;

{$R *.dfm}

procedure T_frmGraficoPedidoVendas.FormActivate(Sender: TObject);
var
cdTemp:Integer;

begin
if not idMontouGrafico then
begin
 try
   idProcessando:=true;

    _frmGraficoPedidoVendas.Enabled:=true;

 _frmGraficoPedidoVendas.WindowState:=wsMaximized;
 Application.ProcessMessages;

//  cdTemp := strtoint(copy(FormatFloat('00000000',nrProdutoGrafico) ,1,7));
   cdProdutoReduzido:=nrProdutoGrafico;
 Application.ProcessMessages;
 _cdsProdutos:=cdsTemporario;
  //_frmProdutosCompleto._cdsProdutosCompleto.open;
{    _cdsProdutos:=BuscaProdutoCompleto(nrProdutoGrafico,//PnrProduto,
                                       cdProdutoGrafico,//PcdProduto,
                                       0,//PnrFornecedor,
                                       1,//PnrCd,
                                       0,//
                                       '',//PnmSigla,
                                       '',//PnmAcesso,
                                       '',//PnmProduto,
                                       '',//PstEstruturaPerfumaria,
                                       '',//PstEstruturaMedicamento,
                                       '',//PstFiltroSal,
                                       '',//PstFiltroGenerico,
//                                       '' {PstFiltroSugeste}
//);

    if _cdsProdutos<>nil then
   begin
     _cdsProdutos.Open;
     _cdsProdutos.RecordCount;

   _cdsEntradasFornecedor:=TabelaEntradaFornecedor(nrProdutoGrafico,0,0);
   _cdsTabelaPedido :=TabeladePedido(nrProdutoGrafico,0,0);
   _cdsTabelaEntradas:=TabeladeEntrada(nrProdutoGrafico,0,0);
   _cdsPedidoFornecedor:=AbrePedidoFornecedor(_cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger,0,0);
   end;


   if _cdsTabelaPedido<>nil then
   begin
     _cdsTabelaPedido.Open;
     _cdsTabelaPedido.RecordCount;
   end;

   if _cdsTabelaEntradas<>nil then
   begin
     _cdsTabelaEntradas.Open;
     _cdsTabelaEntradas.RecordCount;

   end;

//  _cdsEntradas:=_frmProdutosCompleto._cdsEntradas;
  if not _cdsEntradas.IsEmpty then
     _cdsEntradas.RecordCount;


   FiltraProdutoEmpresa(nrProdutoGrafico,1);
  _edtMediaSC.Text         :=FormatFloat('###,##0.00',_cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat);
  _edtSomaVendaSC.Text     :=FormatFloat('###,###,##0',_cdsProdutos.FieldByName('QT_VENDA').AsInteger);
  _edtNrDiasVendaSC.Text   :=FormatFloat('###,###,##0',_cdsProdutos.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsInteger);
  _edtDiasSemEstoqueSC.Text:=FormatFloat('###,###,##0',_cdsProdutos.FieldByName('DIAS_ESTOQUE_ZERO').AsInteger);
   MontagraficoSC(nrProdutoGrafico);

   CarregadosProdutoSC(_cdsProdutos.FieldByName('CD_COMPRADOR').AsInteger,
                       '',
                       _cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat,
                      _cdsProdutos.FieldByName('CD_GRUPO_CURVA_FABRICANTE').asinteger,
                      _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').asinteger,
                     _cdsProdutos.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger);

  FiltraProdutoEmpresa(nrProdutoGrafico,4);
  _edtMediaRs.Text               :=FormatFloat('###,##0.00',_cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat);
  _edtSomaVendaRS.Text           :=FormatFloat('###,###,##0',_cdsProdutos.FieldByName('QT_VENDA').AsInteger);
  _edtNrDiasVendaRS.Text         :=FormatFloat('###,###,##0',_cdsProdutos.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsInteger);
  _edtDiasSemEstoqueRS.Text      :=FormatFloat('###,###,##0',_cdsProdutos.FieldByName('DIAS_ESTOQUE_ZERO').AsInteger);


  Application.ProcessMessages;
  MontagraficoRS(nrProdutoGrafico);
  MontaGraficoVendasRS(0,4,0);
  idMontouGrafico:=true;

           CarregadosProdutoRS(_cdsProdutos.FieldByName('CD_COMPRADOR').AsInteger,
                               '',
                               _cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat,
                              _cdsProdutos.FieldByName('CD_GRUPO_CURVA_FABRICANTE').asinteger,
                             _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').asinteger,
                           _cdsProdutos.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger);


    _cdsDadosProdutoSC.Open;
    _cdsDadosProdutoRS.Open;
    _frmGraficoPedidoVendas.Enabled:=true;
    _chtGraficoRS.SetFocus;
     idProcessando:=false;
 except
    _frmGraficoPedidoVendas.close;
 end;


end;


end;

procedure T_frmGraficoPedidoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmGraficoPedidoVendas.FormCreate(Sender: TObject);
begin
  idMontouGrafico:=false;

 _frmGraficoPedidoVendas.WindowState:=wsMaximized;
 Application.ProcessMessages;
 _chtGraficoVendaSC.Title.Text[0]:='Venda CD. Tubarão-SC';
 _chtGraficoVendaRS.Title.Text[0]:='Venda CD. Sta. Cruz Do Sul-RS';


  _chtGraficoSC.Title.Text[0]:='Aguarde momtando Grafico....';
  _chtGraficoRS.Title.Text[0]:='Aguarde momtando Grafico....';
  _gbGraficoVenda.Top:=0;
  _gbGraficoVenda.Height:=235;

  _gbGraficoVendaRS.Top:=0;
  _gbGraficoVendaRS.Height:=235;

  _gbGraficoEstoqueSc.Top:= 136;
  _gbGraficoEstoqueRS.Top:= 136;


end;

procedure T_frmGraficoPedidoVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE,VK_RETURN : begin
                           if not idProcessando then
                           begin

                           //_frmProdutosCompleto._cdsProdutosCompleto.Filtered:=false;
                        //   _cdsPosicaoEstoqueSC.Bookmark:=idPoiscaoGrid;
                           // _frmProdutosCompleto._cdsProdutosCompleto.GotoCurrent(_cdsProdutos);
                             close;
                           end
                           else
                              key:=0;
                          end;
  end;
end;


procedure T_frmGraficoPedidoVendas.LimpaGrafico;
begin
   Series1.Clear;
   series5.Clear;
   Series10.Clear;
   Series11.Clear;
{   BarSeries2.Clear;
   BarSeries3.Clear;
   BarSeries4.Clear;
   BarSeries5.Clear;
   Series1.Clear;
   Series2.Clear;
   Series3.Clear;
   Series4.Clear;
   Series6.Clear;
   Series7.Clear;
   Series8.Clear;
   Series9.Clear;}

end;

procedure T_frmGraficoPedidoVendas.MontagraficoSC(PnrProduto:Integer);
var
 vlPosicao :Integer;
 vlMedia,vlExioX,vlMaiorEstoque,vlPosicaoFutura,
 vlPosicaoPedido,vlPosicaoEntrada :Double;
 nrProduto,cdProduto,nrDiasEntrega,nrUltimoEstoque:Integer;
 nmProduto:String;
  I,nrContaPosicao: Integer;
 dadosEntadaFornecedor:TRegistroCompra;

begin


  _cdsPosicaoEstoqueGeral :=PosicaoEstoqueGeral(1,PnrProduto);


  vlPosicaoPedido:=MaiorPosicaoEstoque(1);

  _cdsProdutos.open;

  cdProduto:= _cdsProdutos.FieldByName('COD_PRODUTO').AsInteger;
  _cdsUltimasCompras   := AbreUltimasCompraLaboratorio(PnrProduto,//PnrProduto
                                                    _cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').asinteger,//  PnrLaboratorio,
                                                     1,//      PnrOperadorLogistico,
                                                     1{    PcdEmpresa: Integer});
 _cdsVenda           := VendaProdutos(PnrProduto,1,1);
  nmProduto:= FormatFloat('000000/0',cdProduto)+' - '+ _cdsProdutos.FieldByName('NM_MERCADORIA').AsString+'  '+
                     _cdsProdutos.FieldByName('APRESENTACAO_MERCADORIA').AsString;
  nrDiasEntrega:= _cdsProdutos.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger*2;
 _cdsProdutos.Open;

 if not _cdsProdutos.IsEmpty then
 begin
 if _cdsPosicaoEstoqueGeral<>nil then
 begin
   _cdsPosicaoEstoqueGeral.Open;
   _cdsPosicaoEstoqueGeral.First;
    vlMedia:=_cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat;




  _chtGraficoSC.Title.Text[0]:=nmproduto + ' - '+ ' CD - Tub. SC';

  vlMaiorEstoque:= vLmedia * _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').asinteger;
  if vlMaiorEstoque<50 then
     vlMaiorEstoque:=50;

   nrContaPosicao:=0;
   if vlMaiorEstoque>vlPosicaoPedido then
     vlPosicaoPedido:=vlMaiorEstoque;

   vlPosicaoPedido:= (vlPosicaoPedido - (vlPosicaoPedido* 0.1))*1.35;
   vlPosicaoEntrada:=(vlPosicaoPedido - (vlPosicaoPedido* 0.325))*1.35;

   while not _cdsPosicaoEstoqueGeral.Eof do
   begin
     Application.ProcessMessages;
     nrUltimoEstoque:= _cdsPosicaoEstoqueGeral.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;
    if vlMaiorEstoque< nrUltimoEstoque  then
         vlMaiorEstoque:=nrUltimoEstoque;

      vlExioX:= vlMaiorEstoque *1.35;


     vlPosicao:=_cdsPosicaoEstoqueGeral.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;
     _chtGraficoSC.LeftAxis.SetMinMax(0, vlExioX );

     vlMAximoGraficoSC:=vlExioX;
     Series5.Add( _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger * vlMedia,'',clRed);
     Series10.Add(_cdsProdutos.FieldByName('QT_ESTOQUE_MINIMO').AsInteger  * vlMedia,'');
     Series11.Add(vlPosicao,FormatDateTime('dd/mm/yy',_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime),clBlue);

     MontaGraficoUltimasCompras(PnrProduto,1,_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime ,nrContaPosicao);


     MontaGraficoEntradaSC(PnrProduto,1 ,_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime );
   if FiltraPedidoFornecedor(1,_cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').asinteger, _cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime) then
       Series19.AddXY(nrContaPosicao,vlPosicaoPedido,'',clred);
   if FiltraEntradafornecedor(_cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').asinteger,1, _cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime) then
       Series21.AddXY(nrContaPosicao,vlPosicaoEntrada,'',clGreen);

   Inc(nrContaPosicao);



     _cdsPosicaoEstoqueGeral.Next;
   end;
   vlPosicaoFutura:=vlPosicao;
   for I := 1 to nrDiasEntrega do
   begin
      vlPosicaoFutura:=vlPosicaoFutura - vlMedia;
     vlMedia:=_cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat;

     if vlPosicao>0 then
     begin
      Series5.Add( _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger * vlMedia,'',clRed);
      Series10.Add(_cdsProdutos.FieldByName('QT_ESTOQUE_MINIMO').AsInteger  * vlMedia,'');
      Series11.Add(vlPosicaoFutura,FormatDateTime('dd/mm/yy',_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime+i),clLime);
      MontaGraficoUltimasCompras(PnrProduto,1,_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime+i,nrContaPosicao);
      Inc(nrContaPosicao);
     end;


   end;
    MontaGraficoVenda(PnrProduto);



 end;
 end;
end;

Procedure T_frmGraficoPedidoVendas.MontaGraficoVenda(PnrProduto:Integer);
var
 qtVenda :Integer;
 nmMes:String;
 begin
 _cdsVendaAnual:=AbreVendaLaboratorioMultiEmpresa(PnrProduto,0,0);
  MontaGraficoVendasSC(PnrProduto,1,now)

end;


function T_frmGraficoPedidoVendas.FiltraVendaAnual(PnrCD,PAno,PMes: Integer):Integer;
begin

  with _cdsVendaAnual do
  begin
    Filtered:=false;
//    Filter:='CD_EMPRESA='+IntToStr(PnrCD)+' and ano='+inttostr(PAno)+' and mes='+inttostr(Pmes);
    Filter:='CD_EMPRESA='+IntToStr(PnrCD);
    Filtered:=True;
  end;
  result:=0;
  if not _cdsVendaAnual.IsEmpty then
     result:=_cdsVendaAnual.FieldByName('QT_VENDIDA').AsInteger;

end;


procedure T_frmGraficoPedidoVendas.MontagraficoRS(PnrProduto:Integer);
var
 vlPosicao :Integer;
 vlMedia,vlExioX,vlMaiorEstoque,
 vlPosicaoFutura,vlPosicaoPedido,vlPosicaoEntrada :Double;
 nrProduto,cdProduto,nrDiasEntrega,nrUltimoEstoque:Integer;
 dtUltimaDiaEstoque:Tdate;
 nmProduto:String;
  I,nrContaPosicao: Integer;

begin

     _cdsPosicaoEstoqueGeral :=PosicaoEstoqueGeral(4,PnrProduto);

     vlPosicaoPedido:=MaiorPosicaoEstoque(4);



  _cdsProdutos.open;

  cdProduto:= _cdsProdutos.FieldByName('COD_PRODUTO').AsInteger;
  _cdsUltimasCompras   := AbreUltimasCompraLaboratorio(PnrProduto,//PnrProduto
                                                    _cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').asinteger,//  PnrLaboratorio,
                                                     1,//      PnrOperadorLogistico,
                                                     4{    PcdEmpresa: Integer});
 _cdsVenda            := VendaProdutos(PnrProduto,4,1);

  nmProduto:= FormatFloat('000000/0',cdProduto)+' - '+ _cdsProdutos.FieldByName('NM_MERCADORIA').AsString+'  '+
                     _cdsProdutos.FieldByName('APRESENTACAO_MERCADORIA').AsString;
  nrDiasEntrega:= _cdsProdutos.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger*2;
 _cdsProdutos.Open;

 if not _cdsProdutos.IsEmpty then
 begin
 if _cdsPosicaoEstoqueGeral<>nil then
 begin
   _cdsPosicaoEstoqueGeral.Open;
   _cdsPosicaoEstoqueGeral.First;
    vlMedia:=_cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat;


  _chtGraficoRS.Title.Text[0]:=nmproduto + ' - '+ ' CD - Sta.C.do Sul-RS';

  vlMaiorEstoque:= vLmedia * _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').asinteger;;
  if vlMaiorEstoque<50 then
     vlMaiorEstoque:=50;
    nrContaPosicao:=0;

   if vlMaiorEstoque>vlPosicaoPedido then
     vlPosicaoPedido:=vlMaiorEstoque;
   vlPosicaoPedido:= (vlPosicaoPedido - (vlPosicaoPedido* 0.1))*1.35;
   vlPosicaoEntrada:= (vlPosicaoPedido - (vlPosicaoPedido* 0.325))*1.35;
   while not _cdsPosicaoEstoqueGeral.Eof do
   begin
     Application.ProcessMessages;
     nrUltimoEstoque:= _cdsPosicaoEstoqueGeral.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;
    if vlMaiorEstoque< nrUltimoEstoque  then
         vlMaiorEstoque:=nrUltimoEstoque;

      vlExioX:= vlMaiorEstoque *1.35;


     vlPosicao:=_cdsPosicaoEstoqueGeral.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;


     _chtGraficoRS.LeftAxis.SetMinMax(0, vlExioX );
      vlMAximoGraficoRS:=vlExioX;
   {  if vlMAximoGraficoSC>vlMAximoGraficoRS then
        _chtGraficoRS.LeftAxis.SetMinMax(0, vlMAximoGraficoSC);
      if vlMAximoGraficoSC<vlMAximoGraficoRS then
        _chtGraficoSC.LeftAxis.SetMinMax(0, vlMAximoGraficoRS);}
     Series1.Add( _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger * vlMedia,'',clRed);
     Series2.Add(_cdsProdutos.FieldByName('QT_ESTOQUE_MINIMO').AsInteger  * vlMedia,'');
     Series3.Add(vlPosicao,FormatDateTime('dd/mm/yy',_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime),clBlue);

     MontaGraficoUltimasComprasRS(PnrProduto,4,_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime );

     MontaGraficoEntradaRS(PnrProduto,4 ,_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime );
     dtUltimaDiaEstoque:=_cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime;
    // Grafico Ponto Pedido no fornecedor
     if FiltraPedidoFornecedor(4,_cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').asinteger, _cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime) then
       Series20.AddXY(nrContaPosicao,vlPosicaoPedido,'',clred);

     // Grafico Ponto Entradas do Fornecedor
      if FiltraEntradafornecedor(_cdsProdutos.FieldByName('CD_GRUPO_FORNECEDOR').asinteger,4, _cdsPosicaoEstoqueGeral.FieldByName('DAEE_E').AsDateTime) then
       Series22.AddXY(nrContaPosicao,vlPosicaoEntrada,'',clGreen);


         Inc(nrContaPosicao);

     _cdsPosicaoEstoqueGeral.Next;
   end;
   vlPosicaoFutura:=vlPosicao;
   for I := 1 to nrDiasEntrega do
   begin
     vlMedia:=_cdsProdutos.FieldByName('VL_MEDIA_DIARIA').AsFloat;
      vlPosicaoFutura:=vlPosicaoFutura - vlMedia;

     if (vlPosicao>0) and (vlPosicaoFutura>0) then
     begin
      Series1.Add( _cdsProdutos.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger * vlMedia,'',clRed);
      Series2.Add(_cdsProdutos.FieldByName('QT_ESTOQUE_MINIMO').AsInteger  * vlMedia,'');
      Series3.Add(vlPosicaoFutura,FormatDateTime('dd/mm/yy',dtUltimaDiaEstoque+I),clLime);
      MontaGraficoUltimasComprasRS(PnrProduto,4,dtUltimaDiaEstoque+i );
     end;



   end;



 end;
 end;
end;


{function T_frmGraficoPedidoVendas.CalculaMedia(PnrEmpresa:Integer):Double;
var
  nrUnidadesVendidas,
  nrDiasSemEstoque :Integer;
begin
  if _cdsVenda<>nil  then
  begin
     _cdsVenda.Open;
     filtraVendaEmpresa(PnrEmpresa);;
     nrDiasSemEstoque   :=_cdsProdutos.fi
     nrDias             :=0;
     nrUnidadesVendidas :=0;
     nrMaioVenda        :=0;
     Result             :=0;
     _cdsVenda.First;
     while not _cdsVenda.Eof do
     begin
        nrDias             := nrDias  +   DaysInMonth(_cdsVenda.FieldByName('DT_VENDA_MERCADORIA').AsDateTime);
        nrUnidadesVendidas := nrUnidadesVendidas +  _cdsVenda.FieldByName('NR_UNIDADES').AsInteger;
        if (nrDias-nrDiasSemEstoque)>0 then
           Result:= nrUnidadesVendidas/(nrDias-nrDiasSemEstoque);
        if (nrDias-nrDiasSemEstoque)<0 then
           Result:= nrUnidadesVendidas/(30);
       _cdsVenda.Next;
     end;

  end;
end;}
procedure T_frmGraficoPedidoVendas.filtraVendaEmpresa(PnrCd:Integer);
begin
     with _cdsVenda do
     begin
       Filtered:=false;
       Filter:='CD_EMPRESA='+IntToStr(PnrCd);
       Filtered:=true;
     end;
end;


function T_frmGraficoPedidoVendas.FiltraCompras(PcdEmpresa: Integer): Boolean;
var
  dttemp: String;
begin
 if _cdsUltimasCompras<>nil then
 begin
  _cdsUltimasCompras.filtered := false;
  if _cdsUltimasCompras <> nil then
  begin
    _cdsUltimasCompras.recordcount;
      with _cdsUltimasCompras do
      begin
        filter := 'CD_EMPRESA=' + inttostr(PcdEmpresa);
        filtered := true;
        First;
      end;
      result := false;
  end;
 end;
end;

function T_frmGraficoPedidoVendas.FiltraUltimasCompras(nrProduto,
                                                  PcdEmpresa: Integer;
                                                  dtCompra: tdate): TRegistroCompra;
var
  dttemp: String;
begin
  if _cdsUltimasCompras <> nil then
  begin
    _cdsUltimasCompras.filtered := false;
    _cdsUltimasCompras.recordcount;
    result.dtPedido := 0;
    result.QtPedido := 0;
    result.idStatus := '';
    if dtCompra > 0 then
    begin
      with _cdsUltimasCompras do
      begin
        filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +
          inttostr(PcdEmpresa) + ' AND DT_COMPRA=' +
          QuotedStr(FormatDateTime('dd/mm/YYYY', dtCompra));
        filtered := true;
        First;
      end;
      if not _cdsUltimasCompras.IsEmpty then
      begin
        result.dtPedido := _cdsUltimasCompras.FieldByName('DT_COMPRA').AsDateTime;
        result.QtPedido := _cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA').AsInteger;
        result.idStatus := _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString;
      end;
    end;
  end;
end;



function T_frmGraficoPedidoVendas.MontaGraficoUltimasComprasRS(PnrProduto,
                                                              PnrEmpresa: Integer;
                                                              PdtCompra: tdate): Boolean;
var
  dttemp: String;
  corColuna: TColor;
  dtUltimaCompra:TDate;
  nrDiasParaAgenda:double;
begin
  result := false;
  if _cdsUltimasCompras <> nil then
  begin
    // Series5.clear;
     FiltraUltimasCompras(PnrProduto, PnrEmpresa,PdtCompra);
    if _cdsUltimasCompras.isEmpty then
    begin
      Series4.Marks.Visible := false;
      Series5.Marks.Visible := false;
      Series6.Marks.Visible := false;
      Series7.Marks.Visible := false;
      Series9.Marks.Visible := false;
      Series4.Add(0, '', clTeeColor);
      Series6.Add(0, '', clTeeColor);
      Series7.Add(0, '', clTeeColor);
      Series9.Add(0, '', clTeeColor);
      //
//      Series13.Add(0, '', clTeeColor);
  //    Series14.Add(0, '', clTeeColor);
//      Series16.Add(0, '', clTeeColor);

    end;
    dttemp := FormatDateTime('dd/mm', PdtCompra);
    while not _cdsUltimasCompras.eof do
    begin
      Series4.Marks.Visible := false;
      corColuna := clred;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'F' then
      begin
        corColuna := clAqua;
        Series9.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);

       Series6.Add(0, '', corColuna);
       Series4.ADd(0,'', corColuna);
       Series7.add(0, '', corColuna);
      end;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'C' then
      begin
        corColuna := clRed;
        Series7.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series6.Add(0, '', corColuna);
       Series4.ADd(0,'', corColuna);
       Series9.add(0, '', corColuna);
      end;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'I' then
      begin
        corColuna := clRed;
        Series7.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series6.Add(0, '', corColuna);
       Series4.ADd(0,'', corColuna);
       Series9.add(0, '', corColuna);
      end;
     if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'P' then
      begin
        corColuna := clYellow;
        Series6.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series5.Add(0, '', corColuna);
       Series7.Add(0, '', corColuna);
       Series4.ADd(0,'', corColuna);
       Series9.add(0, '', corColuna);
      end;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'N' then
      begin
       corColuna := clLime;
       Series4.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series6.Add(0, '', corColuna);
       Series7.ADd(0,'', corColuna);
       Series9.add(0, '', corColuna);
      end;

      dtUltimaCompra := _cdsUltimasCompras.FieldByName('DT_COMPRA').AsDateTime;
//      nrDiasParaAgenda:=DiasParaFormaAgenda(_cdsProdutos.FieldByName('CD_GRUPO_CURVA_FABRICANTE').AsInteger);

//      Series5.Add(vlm
      _cdsUltimasCompras.Next;
    end;
  end;
end;



function T_frmGraficoPedidoVendas.MontaGraficoUltimasCompras(PnrProduto,
                                                              PnrEmpresa: Integer;
                                                              PdtCompra: tdate;nrPosicaoGrafico:Integer): Boolean;
var
  dttemp: String;
  corColuna: TColor;
  dtUltimaCompra:TDate;
  nrDiasParaAgenda:double;
begin
  result := false;
  if _cdsUltimasCompras <> nil then
  begin
    // Series5.clear;
     FiltraUltimasCompras(PnrProduto, PnrEmpresa,PdtCompra);
    if _cdsUltimasCompras.isEmpty then
    begin
      Series12.Marks.Visible := false;
      Series13.Marks.Visible := false;
      Series14.Marks.Visible := false;
      Series15.Marks.Visible := false;
      Series12.Add(0, '', clTeeColor);
      Series13.Add(0, '', clTeeColor);
      Series14.Add(0, '', clTeeColor);
      Series15.Add(0, '', clTeeColor);
      //
//      Series13.Add(0, '', clTeeColor);
  //    Series14.Add(0, '', clTeeColor);
//      Series16.Add(0, '', clTeeColor);

    end;
    dttemp := FormatDateTime('dd/mm', PdtCompra);
    while not _cdsUltimasCompras.eof do
    begin
      Series4.Marks.Visible := false;
      corColuna := clTeeColor;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'F' then
      begin
        corColuna := clAqua;
        Series15.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series13.Add(0, '', corColuna);
       Series14.Add(0, '', corColuna);
       Series12.Add(0, '', corColuna);
      end;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'C' then
      begin
        corColuna := clRed;
        Series13.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series12.Add(0, '', corColuna);
       Series14.Add(0, '', corColuna);
       Series15.Add(0, '', corColuna);
      end;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'I' then
      begin
        corColuna := clRed;
        Series13.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series12.Add(0, '', corColuna);
       Series14.Add(0, '', corColuna);
       Series15.Add(0, '', corColuna);
      end;
     if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'P' then
      begin
        corColuna := clYellow;
        Series14.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series13.Add(0, '', corColuna);
       Series12.Add(0, '', corColuna);
       Series15.Add(0, '', corColuna);
      end;
      if _cdsUltimasCompras.FieldByName('ID_SITUACAO_COMPRA').AsString = 'N' then
      begin
        corColuna := clLime;
       Series12.Add(_cdsUltimasCompras.FieldByName('QT_COMPRA_ACUMULADA') .AsInteger, '', corColuna);
       Series13.Add(0, '', corColuna);
       Series14.Add(0, '', corColuna);
       Series15.Add(0, '', corColuna);
      end;

      dtUltimaCompra := _cdsUltimasCompras.FieldByName('DT_COMPRA').AsDateTime;
//      nrDiasParaAgenda:=DiasParaFormaAgenda(_cdsProdutos.FieldByName('CD_GRUPO_CURVA_FABRICANTE').AsInteger);

//      Series5.Add(vlm
      _cdsUltimasCompras.Next;
    end;
  end;
end;


function T_frmGraficoPedidoVendas.MontaGraficoEntradaSC(PnrProduto,PnrEmpresa: Integer;
                                                        PdtCompra: tdate): Boolean;
var
  dttemp: String;
  corColuna: TColor;
  dtUltimaCompra:TDate;
  nrDiasParaAgenda:double;
begin
  result := false;
  corColuna:=clMoneyGreen;
  if _cdsEntradas <> nil then
  begin
     FiltraEntrada(PnrProduto,PnrEmpresa,PdtCompra);
    if _cdsEntradas.isEmpty then
    begin
      Series16.Marks.Visible := false;
      Series16.Add(0, '', corColuna);
    end;
    dttemp := FormatDateTime('dd/mm', PdtCompra);
    while not _cdsEntradas.eof do
    begin
      Series6.Marks.Visible := false;
      corColuna := clBlack;
      Series16.Add(_cdsEntradas.FieldByName('QT_ENTRADA').AsInteger, '', corColuna);
      _cdsEntradas.Next;
    end;
  end;

end;

procedure T_frmGraficoPedidoVendas.MontaGraficoPedidoFornecedor(PvlPosicao:Double;PnrEmpresa,PnrFornecedor:Integer;PdtPedido:Tdate);
begin
    FiltraPedidoFornecedor(PnrEmpresa,PnrFornecedor,PdtPedido);
    _cdsPedidoFornecedor.First;
      Series19.Delete(0);
       Series15.Add(0, '');
       Series13.Add(0, '');
       Series14.Add(0, '');
       Series12.Add(0, '');



end;

function T_frmGraficoPedidoVendas.MontaGraficoEntradaRS(PnrProduto,PnrEmpresa: Integer;
                                                        PdtCompra: tdate): Boolean;
var
  dttemp: String;
  corColuna: TColor;
  dtUltimaCompra:TDate;
  nrDiasParaAgenda:double;
begin
  result := false;
  corColuna:=clMoneyGreen;
  if _cdsEntradas <> nil then
  begin
     FiltraEntrada(PnrProduto,PnrEmpresa,PdtCompra);
    if _cdsEntradas.isEmpty then
    begin
      Series8.Marks.Visible := false;
      Series8.Add(0, '', corColuna);
    end;
    dttemp := FormatDateTime('dd/mm', PdtCompra);
    while not _cdsEntradas.eof do
    begin
      Series8.Marks.Visible := false;
      corColuna := clBlack;
      Series8.Add(_cdsEntradas.FieldByName('QT_ENTRADA').AsInteger, '', corColuna);
      _cdsEntradas.Next;
    end;
  end;

end;


 function T_frmGraficoPedidoVendas.FiltraEntrada(PnrProduto,PnrEmpresa:Integer;dtCompra: tdate):TRegistroCompra;
var
  dttemp: String;
begin
  if _cdsEntradas <> nil then
  begin
     _cdsEntradas.filtered := false;
    if dtCompra > 0 then
    begin
      result.dtPedido:= 0;
      result.QtPedido:= 0;
      result.idStatus:= '';
  try
    if _cdsEntradas.active then
    begin
      with _cdsEntradas do
      begin
        filter := 'NROM_I='+INTTOSTR(PnrProduto)+' AND CD_EMPRESA='+INTTOSTR(PnrEmpresa) +' AND DENN_YI='+QuotedStr(FormatDateTime('dd/mm/YYYY', dtCompra));
        filtered := true;
        First;
      end;

    end;
     except
     on E: Exception do
     begin
      trataerro(E.Message, 'Erro no filtro tableas de Entrada...');
     end;
    end;

      if not _cdsEntradas.IsEmpty then
      begin
       result.dtPedido:= _cdsEntradas.FieldByName('DENN_YI').AsDateTime;
       result.QtPedido:= _cdsEntradas.FieldByName('QT_ENTRADA').AsInteger;
       result.idStatus:= '';
      end;
    end;
    end;
end;

 function T_frmGraficoPedidoVendas.FiltraEntradafornecedor(PnrFornecedor,PnrEmpresa:Integer;dtCompra: tdate):Boolean;
var
  dttemp: String;
begin
  if _cdsEntradasFornecedor <> nil then
  begin
     _cdsEntradasFornecedor.filtered := false;
     _cdsEntradasFornecedor.open;
     result:= false;
    if _cdsEntradasFornecedor.active then
    begin
      with _cdsEntradasFornecedor do
      begin
        filter := 'CD_EMPRESA='+INTTOSTR(PnrEmpresa) +' AND DENN_YI='+QuotedStr(FormatDateTime('dd/mm/YYYY', dtCompra))+' and LABM_I='+inttostr(PnrFornecedor);
        filtered := true;
        First;
      end;
      if not _cdsEntradasFornecedor.IsEmpty then
       result:=true;
    end;
  end;
end;



procedure T_frmGraficoPedidoVendas.ZeraListaVenda;
var
  Ano,Mes, I:Integer;

begin
   for I := 1 to 13 do
         ListaVendaAtual[I]:=0;
end;

procedure T_frmGraficoPedidoVendas.CarregaListaVenda(PnrCd,PnrProduto,PAnoAnterior,PAnoAtual:Integer);
var
  Ano,Mes,qtVenda,i,
  nrContaMes,nrMes :Integer;
  nmMes :String;
begin

 Series17.Clear;
 if _cdsVendaAnual.Active then
 begin

  FiltraVendaAnual(1,0,0);
  _cdsVendaAnual.First;

  while not _cdsVendaAnual.Eof do
 begin
    ListaVendaAtual[_cdsVendaAnual.FieldByName('MES').AsInteger]:=_cdsVendaAnual.FieldByName('QT_VENDIDA').AsInteger;
   _cdsVendaAnual.Next;
 end;
 nrContaMes:=0;
 nrMes:=MonthOf(dtSistema);
 for I := 1 to 12 do
 begin
  nmMes:=ShortMonthNames[nrMes];
  if nrMes>12 then
     nrMes:=1;
  Series17.Add(ListaVendaAtual[nrMes],nmMes,clTeal);
  inc(nrMes);
 end;
   Series17.Add(ListaVendaAtual[13],'Atual',clTeal);

end;

end;



procedure T_frmGraficoPedidoVendas.CarregaListaVendaRS(PnrCd,PnrProduto,PAnoAnterior,PAnoAtual:Integer);
var
  Ano,Mes,qtVenda,i,
  nrContaMes,nrMes :Integer;
  nmMes :String;
begin

 Series18.Clear;
 if _cdsVendaAnual.Active then
 begin

  FiltraVendaAnual(4,0,0);
  _cdsVendaAnual.First;

  while not _cdsVendaAnual.Eof do
 begin
    ListaVendaAtual[_cdsVendaAnual.FieldByName('MES').AsInteger]:=_cdsVendaAnual.FieldByName('QT_VENDIDA').AsInteger;
   _cdsVendaAnual.Next;
 end;
 nrContaMes:=0;
 nrMes:=MonthOf(dtEmpresa);
 for I := 1 to 12 do
 begin
  nmMes:=ShortMonthNames[nrMes];
  if nrMes>12 then
     nrMes:=1;
  Series18.Add(ListaVendaAtual[nrMes],nmMes,$000080FF);
  inc(nrMes);
 end;
   Series18.Add(ListaVendaAtual[13],'Atual',$000080FF);

end;

end;


function T_frmGraficoPedidoVendas.MontaGraficoVendasSC(PnrProduto,PnrEmpresa: Integer;
                                                        PdtCompra: tdate): Boolean;
var
  dttemp: String;
  corColuna: TColor;
  dtUltimaCompra,dtAtual:TDate;
  nrDiasParaAgenda:double;
  qtVenda,AnoAtual,AnoAnterior:Integer;


begin
  dtAtual:=dtAtual;
  AnoAnterior:=YearOf(dtSistema-365);
  AnoAtual:=YearOf(dtSistema);
  result := false;
  corColuna:=clMoneyGreen;
 _chtGraficoVendaSC.Title.Text[0]:='Venda CD. Tubarão-SC';

  ZeraListaVenda;
  CarregaListaVenda(PnrEmpresa,PnrProduto,AnoAnterior,AnoAtual);

end;

procedure T_frmGraficoPedidoVendas.RvCustomConnection1GetCols(
  Connection: TRvCustomConnection);
begin
 with Connection do
 begin
  WriteField('ChartGrafico', dtGraphic, 0, '', '');
 end;

end;

procedure T_frmGraficoPedidoVendas.RvCustomConnection1GetRow(
  Connection: TRvCustomConnection);
begin
   WriteChartData(Connection, _chtGraficoSC);

end;

procedure T_frmGraficoPedidoVendas.RvCustomConnection2GetCols(
  Connection: TRvCustomConnection);
begin
 with Connection do
 begin
  WriteField('ChartGrafico', dtGraphic, 0, '', '');
 end;

end;

procedure T_frmGraficoPedidoVendas.RvCustomConnection2GetRow(
  Connection: TRvCustomConnection);
begin
WriteChartData(Connection, _chtGraficoRS);

end;

function T_frmGraficoPedidoVendas.MontaGraficoVendasRS(PnrProduto,PnrEmpresa: Integer;
                                                        PdtCompra: tdate): Boolean;
var
  dttemp: String;
  corColuna: TColor;
  dtUltimaCompra,dtAtual:TDate;
  nrDiasParaAgenda:double;
  qtVenda,AnoAtual,AnoAnterior:Integer;


begin
  dtAtual:=dtAtual;
  AnoAnterior:=YearOf(dtSistema-365);
  AnoAtual:=YearOf(dtSistema);
  result := false;
  corColuna:=clMoneyGreen;
  ZeraListaVenda;
 _chtGraficoVendaRS.Title.Text[0]:='Venda CD. Sta. Cruz Do Sul-RS';
  CarregaListaVendaRS(PnrEmpresa,PnrProduto,AnoAnterior,AnoAtual);

end;


procedure T_frmGraficoPedidoVendas.CarregadosProdutoSC(PnrComprador:Integer;
                                                  PnmComprador:String;
                                                  PvlMedia:Double;
                                                  PnrGrupo:Integer;
                                                  PnrEstoqueMaximo:Integer;
                                                  PnrLeadTime:Double);
begin
    _cdsDadosProdutoSC.Close;
    _cdsDadosProdutoSC.CreateDataSet;
    _cdsDadosProdutoSC.Open;
    _cdsDadosProdutoSC.Append;

    _cdsDadosProdutoSCNR_COMPRADOR.AsInteger      :=PnrComprador;
    _cdsDadosProdutoSCNM_COMPRADOR.AsString       :=PnmComprador;
    _cdsDadosProdutoSCVL_MEDIA.AsFloat            :=PvlMedia;
    _cdsDadosProdutoSCNR_GRUPO.AsInteger          :=PnrGrupo;
    _cdsDadosProdutoSCNR_ESTOQUE_MAXIMO.AsInteger :=PnrEstoqueMaximo;
    _cdsDadosProdutoSCNR_LEADTIME.AsFloat         :=PnrLeadTime;
    _cdsDadosProdutoSC.Post;

end;


procedure T_frmGraficoPedidoVendas._btnImprimirClick(Sender: TObject);
begin
  _btnImprimir.Enabled:=false;
  RvProject1.Close;
  RvProject1.ProjectFile:=pathSistema+'\RelatorioGraficoProduto.rav';
  if _chkDefinirImpressora.Checked then
  begin
    RvSystem1.DefaultDest:=rdPreview
  end
  else
    RvSystem1.DefaultDest:=rdPrinter;
//RvSystem1.DoNativeOutput:=false;
  RvProject1.Execute;
  _btnImprimir.Enabled:=true;
  _chtGraficoRS.Refresh;
  _chtGraficoSC.Refresh;
end;

procedure T_frmGraficoPedidoVendas._chtGraficoRSClickSeries(
  Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  nrMes :Integer;
  stMes :String;
  vlSerie:String;
  nmSerie:String;
  corColuna :TColor;
  dtData :Tdate;
  stData :String[10];
begin

  if Series9.Active then
  begin
    nrMes  := ValueIndex;
    stMes  := Series11.XLabel[ValueIndex];

    corColuna:=Series.Color;

    Application.ProcessMessages;

    vlSerie:= Series11.ValueMarkText[ValueIndex];
//     Showmessage('Data             : '+ stMes+#13+
  //               'Qtdade Pedido    : '+ vlSerie );


  try
    dtData :=StrToDate(stmes);
    stData :=FormatDateTime('dd/mm/yyyy',dtData);
   DadosPedido:=FiltroTabelaPedido(4,cdProdutoReduzido,stData);
   PreencheDadosPedidoNovos(4, DadosPedido.nrPedido,cdProdutoReduzido);

   if DadosPedido.nrPedido>0 then
   begin
      DadosItemNota:=FiltroItemdaNota(4,cdProdutoReduzido,DadosPedido.nrPedido,0);
      _cdsDadosPedido.open;

   end;

   if DadosPedido.nrPedido=0 then
   begin
     DadosItemNota:=FiltroItemdaNota(4,cdProdutoReduzido,DadosPedido.nrPedido,StrToDateDef(stMes,0) );
     DadosPedido:=LocalizaPedido(4,cdProdutoReduzido , DadosItemNota.nrPedido);
     _cdsDadosPedido.open;
   end;
   if not _cdsDadosPedido.IsEmpty then
   begin
     //DadosItemNota:=FiltroItemdaNota(1,cdProdutoReduzido,DadosPedido.nrPedido,0);
     If _frmDadosPedido=nil then
     begin
         _frmDadosPedido:=T_frmDadosPedido.Create(application);
         _frmDadosPedido._cdsDadosPedido:=_cdsDadosPedido;

//          PreencheDadoPedido;
         FormPos(_frmDadosPedido,2,2);
        _frmDadosPedido.ShowModal;
        FreeAndNil(_frmDadosPedido);
     end;
   end;
   except
   end;
  end;



 end;

procedure T_frmGraficoPedidoVendas._chtGraficoSCClickSeries(
  Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  nrMes :Integer;
  stMes :String;
  vlSerie:String;
  nmSerie:String;
  corColuna :TColor;
  stData :String[10];
  dtData :Tdate;
begin

  if Series15.Active then
  begin
    nrMes  := ValueIndex;
    stMes  := Series11.XLabel[ValueIndex];

    corColuna:=Series.Color;

    Application.ProcessMessages;

    vlSerie:= Series15.ValueMarkText[ValueIndex];
//     Showmessage('Data             : '+ stMes+#13+
  //               'Qtdade Pedido    : '+ vlSerie );

   try
   dtData:=StrToDate(stMes);
   stData:=FormatDateTime('dd/mm/yyyy',dtData);
   DadosPedido:=FiltroTabelaPedido(1,cdProdutoReduzido,stData);
   PreencheDadosPedidoNovos(1, DadosPedido.nrPedido,cdProdutoReduzido);

   if DadosPedido.nrPedido>0 then
   begin
      DadosItemNota:=FiltroItemdaNota(1,cdProdutoReduzido,DadosPedido.nrPedido,0);
      _cdsDadosPedido.open;

   end;

   if DadosPedido.nrPedido=0 then
   begin
     DadosItemNota:=FiltroItemdaNota(1,cdProdutoReduzido,DadosPedido.nrPedido,StrToDateDef(stMes,0) );
     DadosPedido:=LocalizaPedido(1,cdProdutoReduzido , DadosItemNota.nrPedido);
     _cdsDadosPedido.open;
   end;
   if not _cdsDadosPedido.IsEmpty then
   begin
     //DadosItemNota:=FiltroItemdaNota(1,cdProdutoReduzido,DadosPedido.nrPedido,0);
     If _frmDadosPedido=nil then
     begin
         _frmDadosPedido:=T_frmDadosPedido.Create(application);
         _frmDadosPedido._cdsDadosPedido:=_cdsDadosPedido;

//          PreencheDadoPedido;
         FormPos(_frmDadosPedido,2,2);
        _frmDadosPedido.ShowModal;
        FreeAndNil(_frmDadosPedido);
     end;
   end;
   except
   end;



//    nrMes := getIndiceMes(stMes);
{    if idMesSelecionado[nrMes] = 'S' then
      idMesSelecionado[nrMes] := 'N'
    else
      idMesSelecionado[nrMes] := 'S';
    MostraGraficoVendaGrid;
    MostraDaDosCalculoGrid}
  end;

end;

procedure T_frmGraficoPedidoVendas._chtGraficoSCMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 var
   TmpPosicao:LongInt;
  nrMes :Integer;
  stMes :String;
  vlSerie:String;
  nmSerie:String;

begin
   TmpPosicao:=Series15.Clicked(x,y);  { <-- if mouse is over a gantt bar... }
  _chtGraficoSC.ShowHint:=false;
  if TmpPosicao<>-1 then
  begin
    nrMes  := TmpPosicao;
    stMes  := Series11.XLabel[TmpPosicao];
    vlSerie:= Series15.ValueMarkText[TmpPosicao];
    //_edtData.Text:=vlSerie;
    _chtGraficoSC.Hint:='Pedido Faturado '+#13+
                        'Qtdade Pedido.. '+vlSerie;
    _chtGraficoSC.ShowHint:=true;
  end
  else
  begin


  end;
end;

procedure T_frmGraficoPedidoVendas.CarregadosProdutoRS(PnrComprador:Integer;
                                                  PnmComprador:String;
                                                  PvlMedia:Double;
                                                  PnrGrupo:Integer;
                                                  PnrEstoqueMaximo,PnrLeadTime :Integer);
begin
    _cdsDadosProdutoRS.Close;
    _cdsDadosProdutoRS.CreateDataSet;
    _cdsDadosProdutoRS.Open;
    _cdsDadosProdutoRS.Append;

    _cdsDadosProdutoRSNR_COMPRADOR.AsInteger      :=PnrComprador;
    _cdsDadosProdutoRSNM_COMPRADOR.AsString       :=PnmComprador;
    _cdsDadosProdutoRSVL_MEDIA.AsFloat            :=PvlMedia;
    _cdsDadosProdutoRSNR_GRUPO.AsInteger          :=PnrGrupo;
    _cdsDadosProdutoRSNR_ESTOQUE_MAXIMO.AsInteger :=PnrEstoqueMaximo;
    _cdsDadosProdutoRSNR_LEADTIME.AsInteger       :=PnrLeadTime;
    _cdsDadosProdutoRS.Post;

end;


function T_frmGraficoPedidoVendas.FiltraPedidoFornecedor(PnrEmpresa,PnrFornecedor:Integer;PdtPedido:TDate):boolean;
begin
  with _cdsPedidoFornecedor do
  begin
    OPen;
    Filtered:=false;
    Filter:='CD_EMPRESA='+IntToStr(PnrEmpresa)+' and LABP_P='+IntToStr(PnrFornecedor)+' AND datp_p='+QuotedStr(FormatDateTime('dd/mm/yyyy',PdtPedido));
    Filtered:=TRUE;
  end;
  result:=false;
  if not _cdsPedidoFornecedor.IsEmpty then
     result:=true;
end;

function T_frmGraficoPedidoVendas.MaiorPosicaoEstoque(PnrCd:Integer):Integer;
var
  qtMaior :Integer;
begin
   qtMaior:=0;
   FiltraPosicaoEstoque(PnrCd);
   while not _cdsPosicaoEstoqueGeral.Eof do
   begin
     if _cdsPosicaoEstoqueGeral.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger>qtMaior then
        qtMaior:=_cdsPosicaoEstoqueGeral.FieldByName('QT_ESTOQUE_DISPONIVEL_VENDA').AsInteger;
     _cdsPosicaoEstoqueGeral.Next;
   end;
   Result:=qtMaior;
end;

function T_frmGraficoPedidoVendas.FiltraPosicaoEstoque(PnrCd:Integer):Integer;
var
  qtMaior :Integer;
begin
   qtMaior:=0;
   with _cdsPosicaoEstoqueGeral do
   begin
      Filtered:=false;
      Filter:='CD_EMPRESA='+INTTOSTR(PnrCd);
      Filtered:=TRUE;
   end;
end;


function T_frmGraficoPedidoVendas.FiltroTabelaPedido(PnrEmpresa,PnrProduto:Integer;PdtPedido:String):TDadosPedido;
begin
     Result.nrPedido     :=0;
     Result.dtPedido     :=0;
     Result.dtTransmissao:=0;
     Result.idStatus     :='';
     Result.qtPedido     :=0;
     Result.qtFaturada   :=0;
     Result.QtSugerida   :=0;
  try
    if _cdsTabelaPedido.active then
    begin
       _cdsTabelaPedido.open;
       _cdsTabelaPedido.recordcount;
    end;

    with _cdsTabelaPedido do
    begin
      Filtered:=false;
      Filter:='DATP_P='+QuotedStr(PdtPedido)+' AND NROM_Y='+IntToStr(PnrProduto)+' AND CD_EMPRESA='+IntToStr(PnrEmpresa);
      Filtered:=TRUE;
    end;
   if not _cdsTabelaPedido.IsEmpty then
   begin
     Result.nrPedido     :=_cdsTabelaPedido.FieldByName('NROP_P').AsInteger;
     Result.dtPedido     :=_cdsTabelaPedido.FieldByName('DATP_P').AsDateTime;
     Result.dtTransmissao:=_cdsTabelaPedido.FieldByName('DT_TRANSMITIDO').AsDateTime;;
     Result.idStatus     :=_cdsTabelaPedido.FieldByName('SITY_Y').AsString;
     Result.qtPedido     :=_cdsTabelaPedido.FieldByName('QUAY_Y').AsInteger; ;
     Result.qtFaturada   :=_cdsTabelaPedido.FieldByName('CHEY_Y').AsInteger;;
     Result.QtSugerida   :=_cdsTabelaPedido.FieldByName('QT_SUGERIDA').AsInteger;
   end;
  except
     on E: Exception do
     begin
      trataerro(E.Message, 'Erro no filtro tableas de pedido...');
     end;

  end;
end;
function T_frmGraficoPedidoVendas.FiltroItemdaNota(PnrEmpresa,PnrProduto,PnrPedido:Integer;PdtEntada:Tdate):TDadosItemNota;
begin
     Result.nrPedido     :=0;
     Result.dtEntrada    :=0;
     Result.dtEmissao    :=0;
     Result.dtValidade   :=0;
     Result.qtFaturada   :=0;
  try
    if _cdsTabelaEntradas.active then
    begin
       _cdsTabelaEntradas.open;
       _cdsTabelaEntradas.recordcount;
    end;

    with _cdsTabelaEntradas do
    begin
      Filtered:=false;
      if PdtEntada=0 then
        Filter:='NR_PEDIDO_COMPRA='+inttostr(PnrPedido)+' AND NROM_Y = '+IntToStr(PnrProduto)+' AND CD_EMPRESA='+IntToStr(PnrEmpresa);
      if PdtEntada>0 then
        Filter:='DT_ATUALIZACAO='+QuotedStr(DateToStr(PdtEntada))+' AND NROM_Y = '+IntToStr(PnrProduto)+' AND CD_EMPRESA='+IntToStr(PnrEmpresa);
      Filtered:=TRUE;
    end;
    if not _cdsTabelaEntradas.isempty then
    begin
     _cdsDadosPedido.Close;
     _cdsDadosPedido.CreateDataSet;
     _cdsTabelaEntradas.first;
    end;
  while not _cdsTabelaEntradas.eof do
   begin
    _cdsDadosPedido.Open;
    _cdsDadosPedido.Append;
    _cdsDadosPedidoNR_PEDIDO.AsInteger:=_cdsTabelaEntradas.FieldByName('NR_PEDIDO_COMPRA').AsInteger;
     DadosPedido:=LocalizaPedido(PnrEmpresa,PnrProduto,_cdsDadosPedidoNR_PEDIDO.AsInteger);
     if DadosPedido.nrPedido>0 then
     begin
     _cdsDadosPedidoDT_PEDIDO.AsDateTime:=DadosPedido.dtPedido;
     _cdsDadosPedidoQT_PEDIDO.AsInteger:=DadosPedido.qtPedido;
     _cdsDadosPedidoQT_SUGERIDA.AsInteger:=DadosPedido.QtSugerida;
     if _cdsTabelaEntradas.FieldByName('DATE_O').AsDateTime>0 then
        _cdsDadosPedidoNR_LEADTIME.AsInteger := StrToIntDef(formatfloat('###0', _cdsTabelaEntradas.FieldByName('DT_ATUALIZACAO').AsDateTime-DadosPedido.dtPedido),0);
       _cdsDadosPedidoNR_LEADTIME_FORN.AsInteger :=_cdsProdutos.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger;
     end;


     _cdsDadosPedidoDT_EMISSAO_NFE.AsDateTime  := _cdsTabelaEntradas.FieldByName('DATE_O').AsDateTime;
     _cdsDadosPedidoDT_ENTRADA_NFE.AsDateTime  := _cdsTabelaEntradas.FieldByName('DT_ATUALIZACAO').AsDateTime;
     _cdsDadosPedidoDT_VALIDADE.AsDateTime     := _cdsTabelaEntradas.FieldByName('DT_VALIDADE').AsDateTime;;
     _cdsDadosPedidoQT_ENTRADA.AsInteger       := _cdsTabelaEntradas.FieldByName('QUAY_Y').AsInteger;;
     _cdsDadosPedido.Post;
     _cdsTabelaEntradas.next;
   end;
  except
     on E: Exception do
     begin
      trataerro(E.Message, 'Erro no filtro tableas de pedido...');
     end;

  end;
end;

procedure T_frmGraficoPedidoVendas.PreencheDadosPedidoNovos(PnrEmpresa,PnrPedido,PnrProduto:Integer);
begin
  _cdsDadosPedido.Close;
  _cdsDadosPedido.CreateDataSet;
  _cdsDadosPedido.Open;
  _cdsDadosPedido.Append;
  _cdsDadosPedidoNR_PEDIDO.AsInteger:=DadosPedido.nrPedido;
  if DadosPedido.nrPedido>0 then
   begin
     _cdsDadosPedidoDT_PEDIDO.AsDateTime       := DadosPedido.dtPedido;
     _cdsDadosPedidoQT_PEDIDO.AsInteger        := DadosPedido.qtPedido;
     _cdsDadosPedidoQT_SUGERIDA.AsInteger      := DadosPedido.QtSugerida;
     _cdsDadosPedidoNR_LEADTIME.AsInteger      := 0;
     _cdsDadosPedidoNR_LEADTIME_FORN.AsInteger := _cdsProdutos.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').AsInteger;


  end;
     _cdsDadosPedido.Post;

end;

procedure T_frmGraficoPedidoVendas.PreencheDadoPedido;
begin
{    _frmDadosPedido._edtTotalUnidadesPedida.Text:=FormatDateTime('dd/mm/yyyy',DadosPedido.dtPedido);
    _frmDadosPedido._edtQtdadePedido.Text:=FormatFloat('###,##0',DadosPedido.qtPedido);
    if DadosItemNota.nrPedido>0 then
    begin
    _frmDadosPedido._edDataEmissaoNfe.Text:=FormatDateTime('dd/mm/yyyy',DadosItemNota.dtEmissao);
    _frmDadosPedido._edtEntradaNfe.Text:=FormatDateTime('dd/mm/yyyy',DadosItemNota.dtEntrada);
    _frmDadosPedido._edtDataValidade.Text:=FormatDateTime('dd/mm/yyyy',DadosItemNota.dtValidade);
    _frmDadosPedido._edtQtdadeNfe.Text:=FormatFloat('###,##0',DadosItemNota.qtFaturada);

    end;}


end;

Procedure T_frmGraficoPedidoVendas.FiltraProdutoEmpresa(PnrProduto,PnrEmpresa:Integer);
begin
   with _cdsProdutos do
   begin
     filter:='NR_PRODUTO='+inttostr(PnrProduto)+' and cd_EMPRESA='+inttostr(PnrEmpresa);
     Filtered:=true;
   end;
end;



end.
