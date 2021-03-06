unit uPedidoFaturamemtoAtrasado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, DBClient, Grids, DBGrids,uRotinasGenericas,
  FMTBcd, SqlExpr, Buttons;

type
  T_frmPedidosFaturamentoAtrasados = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _dbgPedidosAtrasado: TDBGrid;
    _dsPedidosFaturamentoAtrasado: TDataSource;
    _cdsPedidosFaturamentoAtrasado: TClientDataSet;
    SQLQuery1: TSQLQuery;
    GroupBox2: TGroupBox;
    _edtQtdUnidades: TEdit;
    _edtValorCusto: TEdit;
    _edtValorFornecedor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    _cdsPedidosFaturamentoAtrasadoQT_PEDIDO: TAggregateField;
    _cdsPedidosFaturamentoAtrasadoVT_PEDIDO_CUSTO: TAggregateField;
    _cdsPedidosFaturamentoAtrasadoVT_PEDIDO_FORNECEDOR: TAggregateField;
    _btnFechar: TBitBtn;
    _btnParaExcel: TBitBtn;
    _edtNumeroComprador: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    _edtNumeroItens: TEdit;
    Label5: TLabel;
    _cdsPedidosFaturamentoAtrasadoTOTAL_DE_ITENS: TAggregateField;
    _chkListaPedidoRedes: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure _btnFecharClick(Sender: TObject);
    procedure _dbgPedidosAtrasadoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _edtNumeroCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPedidosAtrasadoTitleClick(Column: TColumn);
  private
    function PedidosDataFaturamentoAtrasada(
      PnrComprador: Integer): TClientDataSet;
    procedure setGridPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmPedidosFaturamentoAtrasados: T_frmPedidosFaturamentoAtrasados;
  DadosPrimeiraLeitura :DadosExecucao;
  nrCompradorPedidoAtrasados:Integer;

implementation

uses uAuxiliarCompras, uDm;



{$R *.dfm}

procedure T_frmPedidosFaturamentoAtrasados._dbgPedidosAtrasadoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgPedidosAtrasado do
  begin
   If odd(_dsPedidosFaturamentoAtrasado.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
   end
   else
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
   end;
   // cor da celula e foco
   if(gdFocused in State) then
   begin
      Canvas.brush.Color:= clYellow;
      Canvas.Font.Color:= clblue;
   end;
   DefaultDrawColumnCell(Rect,DataCol,Column,state);
  end;

end;

procedure T_frmPedidosFaturamentoAtrasados._dbgPedidosAtrasadoTitleClick(
  Column: TColumn);
begin
  GeraOrdenacao(_cdsPedidosFaturamentoAtrasado,Column);
end;

procedure T_frmPedidosFaturamentoAtrasados._edtNumeroCompradorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
     VK_RETURN: BitBtn1.Click;
  end;
end;

procedure T_frmPedidosFaturamentoAtrasados.BitBtn1Click(Sender: TObject);
begin
 nrCompradorPedidoAtrasados:=StrToIntDef(_edtNumeroComprador.Text,nrCompradorSistema);
 PedidosDataFaturamentoAtrasada(nrCompradorPedidoAtrasados);
    _edtQtdUnidades.Text:=FormatFloat('###,###,##0',0);
    _edtNumeroItens.Text:=FormatFloat('###,###,##0',0);
    _edtValorCusto.Text:=FormatFloat('###,###,##0.00',0);
    _edtValorFornecedor.Text:=FormatFloat('###,###,##0.00',0);
  if _cdsPedidosFaturamentoAtrasadoQT_PEDIDO.AsVariant<>null then
   begin
    _edtQtdUnidades.Text:=FormatFloat('###,###,##0',_cdsPedidosFaturamentoAtrasadoQT_PEDIDO.AsVariant);
    _edtNumeroItens.Text:=FormatFloat('###,###,##0',_cdsPedidosFaturamentoAtrasadoTOTAL_DE_ITENS.AsVariant);
    _edtValorCusto.Text:=FormatFloat('###,###,##0.00',_cdsPedidosFaturamentoAtrasadoVT_PEDIDO_CUSTO.AsVariant);
    _edtValorFornecedor.Text:=FormatFloat('###,###,##0.00',_cdsPedidosFaturamentoAtrasadoVT_PEDIDO_FORNECEDOR.AsVariant);
   end;

end;

procedure T_frmPedidosFaturamentoAtrasados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AtualizaArquivoInicializacao(DadosPrimeiraLeitura.nmArquivo,dtSistema,true);
  action:=cafree;

end;

procedure T_frmPedidosFaturamentoAtrasados.FormShow(Sender: TObject);
begin
 DadosPrimeiraLeitura:=SetDadosLeitura(pathSistema+'AberturaSistemaCompra.ini');
 PedidosDataFaturamentoAtrasada(nrCompradorPedidoAtrasados);
  _edtNumeroComprador.Text:=IntToStr(nrCompradorPedidoAtrasados);
 if _cdsPedidosFaturamentoAtrasado<>nil then
 begin
   _dsPedidosFaturamentoAtrasado.DataSet:=_cdsPedidosFaturamentoAtrasado;
   _cdsPedidosFaturamentoAtrasado.Open;

   if _cdsPedidosFaturamentoAtrasadoQT_PEDIDO.AsVariant<>null then
   begin
    _edtQtdUnidades.Text:=FormatFloat('###,###,##0',_cdsPedidosFaturamentoAtrasadoQT_PEDIDO.AsVariant);
    _edtNumeroItens.Text:=FormatFloat('###,###,##0',_cdsPedidosFaturamentoAtrasadoTOTAL_DE_ITENS.AsVariant);
    _edtValorCusto.Text:=FormatFloat('###,###,##0.00',_cdsPedidosFaturamentoAtrasadoVT_PEDIDO_CUSTO.AsVariant);
    _edtValorFornecedor.Text:=FormatFloat('###,###,##0.00',_cdsPedidosFaturamentoAtrasadoVT_PEDIDO_FORNECEDOR.AsVariant);
   end;
 end;

end;



function T_frmPedidosFaturamentoAtrasados.PedidosDataFaturamentoAtrasada(PnrComprador:Integer):TClientDataSet;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  _cdsTemp: TClientDataSet;
  stQuery:TStringList;
begin
    tempQuery := nil;
    tempQuery := TSQLQuery.Create(nil);
    stQuery:=TStringList.Create;
   _cdsTemp := TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer := _dm._LocalConexao;
   _cdsTemp.ProviderName := '_dspGenerica';

   try
      with TempQuery do
      begin
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('ID_CD,NR_FORNCEDOR,NM_FORNECEDOR,NR_PEDIDO,');
        SQL.Add('DT_PEDIDO,DT_PREVISTA_FATURAMENTO,DT_PREVISAO_ENTREGA,');
        SQL.Add('NR_ITEM,QT_PEDIDO, QT_ATENDIDA, VT_CUSTO, VT_FORNECEDOR,');
        SQL.Add('ID_CAPA,CD_COMPRADOR,QT_MERCADORIA_TRANSITO,CD_OPERACAO_REDE');
        SQL.Add('FROM');
        SQL.Add('(SELECT');
        SQL.Add('LABP_P NR_FORNCEDOR,');
        SQL.Add('DS_GRUPO_FORNECEDOR NM_FORNECEDOR,');
        SQL.Add('NROP_P AS NR_PEDIDO,');
        {SQL.Add('CASE');
        SQL.Add('WHEN ITEM.CD_EMPRESA=1 THEN ''SC''');
        SQL.Add('WHEN ITEM.CD_EMPRESA=4 THEN ''RS''');
        SQL.Add('END ID_CD,');}
        SQL.Add('(SELECT NM_EMPRESA FROM ACESSO.DC_EMPRESA Emp WHERE emp.CD_EMPRESA=ITEM.CD_EMPRESA) AS  ID_CD,');
        SQL.Add('DATP_P DT_PEDIDO,DT_PREVISTA_FATURAMENTO, PREP_P DT_PREVISAO_ENTREGA,');
        SQL.Add('nvl(Count(*),0) as NR_ITEM,');
        SQL.Add('Sum(Nvl(QUAY_Y,0)) AS QT_PEDIDO,Sum(CHEY_Y) AS QT_ATENDIDA,');
        SQL.Add('Sum(qt_mercadoria_transito) AS QT_MERCADORIA_TRANSITO,');
        SQL.Add('Sum(QUAY_Y*VCCI_Y) AS VT_CUSTO,');
        SQL.Add('Sum(QUAY_Y*PFBY_Y) AS VT_FORNECEDOR,');
        SQL.Add('SITP_P ID_CAPA,');
        SQL.Add('CD_COMPRADOR,CAPA.CD_OPERACAO_REDE');
        SQL.Add('FROM');
        SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
        SQL.Add('PRDDM.DC_MERCADORIA ME,');
        SQL.Add('PRDDM.DCPCC CAPA,');
        SQL.Add('PRDDM.DCPCI ITEM');
        SQL.Add('WHERE');
        SQL.Add('NROP_P = NROP_Y');
        SQL.Add('AND NROM_Y=ME.CD_MERCADORIA');
        SQL.Add('AND LABP_P = GF.CD_GRUPO_FORNECEDOR');
        SQL.Add('AND DT_PREVISTA_FATURAMENTO<=Trunc(SYSDATE)-3');
        SQL.Add('AND SITY_Y NOT IN(''I'',''C'',''S'')');
        SQL.Add('AND GF.CD_GRUPO_FORNECEDOR IN (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
        SQL.Add('FROM PRDDM.DC_COMPRA_MERCADORIA');
        SQL.Add('WHERE id_situacao_mercadoria<>''I'' and');
        if _chkListaPedidoRedes.Checked then
           SQL.Add('CAPA.CD_OPERACAO_REDE>0)')
        else
           SQL.Add('CD_COMPRADOR=:PnrComprador)');
        SQL.Add('GROUP BY LABP_P ,');
        SQL.Add('         DS_GRUPO_FORNECEDOR,');
        SQL.Add('NROP_P,');
        SQL.Add('DATP_P , PREP_P ,');
        SQL.Add('ITEM.CD_EMPRESA,');
        SQL.Add('SITP_P ,');
        SQL.Add('CAPA.CD_OPERACAO_REDE,');
        SQL.Add('CD_COMPRADOR,DT_PREVISTA_FATURAMENTO)');
        SQL.Add('WHERE qt_atendida=0 and qt_mercadoria_transito=0');
        SQL.Add('AND id_capa NOT IN(''C'',''I'',''Y'')');
        SQL.Add('order by DT_PEDIDO');

      end;
//      Result:=nil;

      stQuery.Add(tempQuery.Text);

      stQuery.SaveToFile('C:\temp\qryPedidoFaturamentoArasado.sql');

      with _cdsPedidosFaturamentoAtrasado do
      begin
        close;
        CommandText:=tempQuery.Text;
       if not _chkListaPedidoRedes.Checked then
          Params.ParamByName('PnrComprador').AsBcd:=PnrComprador;
        open;
      end;
       setGridPedido;
      if not _cdsPedidosFaturamentoAtrasado.IsEmpty then
      begin
       setGridPedido;
      end;
   finally
     FreeAndNil(tempQuery);
   end;
end;


procedure T_frmPedidosFaturamentoAtrasados.setGridPedido;
begin


   TStringField(_cdsPedidosFaturamentoAtrasado.FieldByName('ID_CD')).DisplayLabel:='Local CD';
   TStringField(_cdsPedidosFaturamentoAtrasado.FieldByName('ID_CD')).DisplayWidth:=15;

   TStringField(_cdsPedidosFaturamentoAtrasado.FieldByName('ID_CAPA')).DisplayLabel:='Status Ped';
   TStringField(_cdsPedidosFaturamentoAtrasado.FieldByName('ID_CAPA')).DisplayWidth:=06;


   TFloatField(_cdsPedidosFaturamentoAtrasado.FieldByName('VT_CUSTO')).DisplayLabel:='Vl. Custo Pedidoo';
   TFloatField(_cdsPedidosFaturamentoAtrasado.FieldByName('VT_CUSTO')).DisplayFormat:='###,###,##0.00';
   TFloatField(_cdsPedidosFaturamentoAtrasado.FieldByName('VT_CUSTO')).DisplayWidth:=10;

   TFloatField(_cdsPedidosFaturamentoAtrasado.FieldByName('VT_FORNECEDOR')).DisplayLabel:='Vl. Fornec. Pedido';
   TFloatField(_cdsPedidosFaturamentoAtrasado.FieldByName('VT_FORNECEDOR')).DisplayFormat:='###,###,##0.00';
   TFloatField(_cdsPedidosFaturamentoAtrasado.FieldByName('VT_FORNECEDOR')).DisplayWidth:=10;

   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtd.Pedido';
   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('QT_PEDIDO')).DisplayWidth:=10;

   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('NR_ITEM')).DisplayLabel:='Nr. Itens';
   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('NR_ITEM')).DisplayWidth:=10;

   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('QT_ATENDIDA')).DisplayLabel:='Qtd.Atendida';
   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('QT_ATENDIDA')).DisplayWidth:=10;

   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('NR_FORNCEDOR')).DisplayLabel:='Nr.Fornecedor';
   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('NR_FORNCEDOR')).DisplayWidth:=10;

   TStringField(_cdsPedidosFaturamentoAtrasado.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
   TStringField(_cdsPedidosFaturamentoAtrasado.FieldByName('NM_FORNECEDOR')).DisplayWidth:=30;


   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('NR_PEDIDO')).DisplayLabel:='nr.Pedido';
   TIntegerField(_cdsPedidosFaturamentoAtrasado.FieldByName('NR_PEDIDO')).DisplayWidth:=10;

//   ,,


   TdateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
   TDateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PEDIDO')).DisplayWidth:=10;
   TDateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';

   TdateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayLabel:='Dt.Faturamento';
   TDateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayWidth:=10;
   TDateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayFormat:='dd/mm/yyyy';

   TdateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PREVISAO_ENTREGA')).DisplayLabel:='Previsao Entrega';
   TDateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PREVISAO_ENTREGA')).DisplayWidth:=10;
   TDateField(_cdsPedidosFaturamentoAtrasado.FieldByName('DT_PREVISAO_ENTREGA')).DisplayFormat:='dd/mm/yyyy';




end;

procedure T_frmPedidosFaturamentoAtrasados._btnFecharClick(Sender: TObject);
begin

 close;
end;

procedure T_frmPedidosFaturamentoAtrasados._btnParaExcelClick(Sender: TObject);
begin
Screen.Cursor := crSQLWait;
_btnParaExcel.enabled:=false;
if not _cdsPedidosFaturamentoAtrasado.IsEmpty then
begin
     GerarExcel(_cdsPedidosFaturamentoAtrasado);
     Mensagem('Planilha Gerada',64);
end;
Screen.Cursor := crDefault;
_btnParaExcel.enabled:=true;

end;

end.
