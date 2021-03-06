unit uItensNaoAtendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, DBClient,
  ShellAPI;

type
  T_frmItensNaoAtendidos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    _dtpDtInicio: TDateTimePicker;
    _dtpDtFinal: TDateTimePicker;
    _edtNumeroComprador: TEdit;
    _btnPesquisa: TBitBtn;
    _edtNumeroFornecedor: TEdit;
    _rgStatus: TRadioGroup;
    _grbAlerta: TGroupBox;
    _lbeAlerta: TLabel;
    GroupBox2: TGroupBox;
    _dbgItemPendentes: TDBGrid;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    _btnExceItensNaoAtendido: TBitBtn;
    Label7: TLabel;
    _edtTotalItendCompra: TEdit;
    _edtNumerosItens: TEdit;
    Label5: TLabel;
    _cdsItemPedidoNR_TOTAL_DE_ITENS: TAggregateField;
    _cdsItemPedidoVT_ITENS_PRECO_FORNECEDOR: TAggregateField;
    _cdsItemPedidoVT_ITENS_PEDIDO_CUSTO: TAggregateField;
    _edtVtPrecoFornecedor: TEdit;
    Label6: TLabel;
    _cdsItemPedidoNR_TOTAL_UNIDADES: TAggregateField;
    Label8: TLabel;
    _edtTotalUnidades: TEdit;
    procedure _btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure _dbgItemPendentesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgItemPendentesTitleClick(Column: TColumn);
    procedure _btnExceItensNaoAtendidoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dsItemPedidoDataChange(Sender: TObject; Field: TField);
  private
    procedure setGridItemPendente;


      Function AbreItemPendenciaNaoAntendia_Cancelada(PnrFornecedor,
                                                PnrComprador,
                                                PnrCD: Integer;
                                                PdtInicio,
                                                PdtFinal:Tdate;
                                                PidTipoRelatorio:String {P itens n?o atendidos C: Itens Canceladoe}):TClientDataSet;

    { Private declarations }
  public
    { Public declarations }
     idNavegando,idItemBonifiacado:Boolean;

  end;

var
  _frmItensNaoAtendidos: T_frmItensNaoAtendidos;

implementation

uses uAuxiliarCompras, uRotinasGenericas, uDm;

{$R *.dfm}

procedure T_frmItensNaoAtendidos._dbgItemPendentesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   with _dbgItemPendentes do
   begin

// mude a cor das Linha
 if _cdsItemPedido<>nil then
 begin
   If odd(_cdsItemPedido.RecNo) then
   begin
      Canvas.Font.Color := clblack;
     Canvas.Brush.Color := clSkyBlue;
   end
  else
  begin
    Canvas.Font.Color := clblack;
    Canvas.Brush.Color := clWhite;
  end;
//

// mude a cor da Linha para Itens Bonificadi
if _cdsItemPedido.FieldByName('ID_BONIFICADO').AsString='S' then
begin
        Canvas.brush.Color:= clBlue;
        Canvas.Font.Color:= clwhite;
end;
// mude a cor da Linha para pedidos em transito
if _cdsItemPedido.FieldByName('ID_NFE_TRANSITO').AsString='S' then
begin
        Canvas.brush.Color:= clGreen;
        Canvas.Font.Color:= clwhite;
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
         Canvas.brush.Color:= clYellow;
         Canvas.Font.Color:= clBlack;
      end;

     if (Column.Field.FieldName = 'QT_PENDENTE') then
     begin
      if (_cdsItemPedido.FieldByName('QT_PENDENTE').AsInteger>0) AND
         (_cdsItemPedido.FieldByName('DT_PREVISAO').AsDateTime<dtSistema) then
      begin
        Canvas.brush.Color:= clYellow;
        Canvas.Font.Color:= clBLACK;
      end;
     end;



     if (Column.Field.FieldName = 'ID_CD') then
     begin
      if _cdsItemPedido.FieldByName('ID_CD').AsString='SC' then
      begin
        Canvas.brush.Color:= clGreen;
        Canvas.Font.Color:= clwhite;
      end;
      if _cdsItemPedido.FieldByName('ID_CD').AsString='RS' then
      begin
        Canvas.brush.Color := $000080FF;
        Canvas.Font.Color := clBlack;
      end;
    end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;
  end;

end;

procedure T_frmItensNaoAtendidos._dbgItemPendentesTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsItemPedido,Column);

end;

procedure T_frmItensNaoAtendidos._dsItemPedidoDataChange(Sender: TObject;
  Field: TField);
  var
   stAlerta :String;
begin
  inherited;
  if idNavegando then
  begin
    _grbAlerta.Visible:=false;
    idItemBonifiacado:=false;
    stAlerta:='';
   if _cdsItemPedido.FieldByName('ID_BONIFICADO').AsString='S' then
   begin
      _grbAlerta.Visible:=True;
      idItemBonifiacado:=true;
      stAlerta:='Pedido Bonificado ou Com Itens Bonif.';
      _lbeAlerta.Caption:=stAlerta;
   end;

   if (_cdsItemPedido.FieldByName('QT_PENDENTE').AsInteger>0) AND
     (_cdsItemPedido.FieldByName('DT_PREVISAO').AsDateTime<dtSistema) then
   begin
      _grbAlerta.Visible:=True;
      if stAlerta<>EmptyStr then
        stAlerta:=stAlerta+#13+'Pedido Atrasado....'
      else
        stAlerta:='Pedido Atrasado....';


      _lbeAlerta.Caption:=stAlerta;
   end;
   Application.ProcessMessages

  end;

end;

procedure T_frmItensNaoAtendidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmItensNaoAtendidos.FormCreate(Sender: TObject);
begin
  _edtNumeroComprador.Text:=FormatFloat('000',nrCompradorSistema);
  _dtpDtInicio.Date:=dtSistema-30;
  _dtpDtFinal.Date :=dtSistema;


end;

procedure T_frmItensNaoAtendidos._btnExceItensNaoAtendidoClick(Sender: TObject);
var
 nmArquivo:String;
begin
Screen.Cursor := crSQLWait;
_btnExceItensNaoAtendido.enabled:=false;
{if not _cdsItemPedido.IsEmpty then
begin
     StatusBar1.Panels[0].Text:='Aguarde, Gerando Excel...';
     GerarExcel(_cdsItemPedido);
     StatusBar1.Panels[0].Text:='Relatorio em Excel gerado...';


end;}

  nmArquivo:='c:\TEMP\RelatorioItensNaoAtendidos_'+FormatDateTime('ddmmyyyyhhmmss',dtSistema)+'.csv';
  if _cdsItemPedido<>nil then
  begin
     //  GerarExcel(_cdsRetorno,'RetornoPedido_'+FormatDateTime('ddmmyyyy',dtSistema)+trim(_edtNrLista.Text)+'.XLS');
      GerarTabelaArquivoCVS(_cdsItemPedido,'Relatorio Itens N?o Atendidos ',  nmArquivo);

    ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
    Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION)
  end;


Screen.Cursor := crDefault;
Mensagem('Planilha Gerada',64);
_btnExceItensNaoAtendido.enabled:=true;

end;

procedure T_frmItensNaoAtendidos._btnPesquisaClick(Sender: TObject);
var
 dtInicio,dtFinal :String[10];
 idStatus :String[10];
 nrFornecedor,
 nrComprador:Integer;
begin
  //inherited;
  idNavegando:=false;
 // PesquisaPedido;
  //inherited;

  nrFornecedor:=StrToIntDef(_edtNumeroFornecedor.Text,0);
  nrComprador :=StrToIntDef(_edtNumeroComprador.Text,0);
  case _rgStatus.ItemIndex of
    0: idStatus:='P';
    1: idStatus:='C';
  end;
  dtInicio:=FormatDateTime('dd/mm/yyyy',_dtpDtInicio.Date);
  dtFinal:=FormatDateTime('dd/mm/yyyy',_dtpDtFinal.Date);
  _cdsItemPedido.ControlsDisabled;
  _cdsItemPedido.DisableControls;

    _edtTotalItendCompra.Text:=FormatFloat('###,###,##0.00',0);
    _edtVtPrecoFornecedor.Text:=FormatFloat('###,###,##0.00',0);
    _edtNumerosItens.Text:=FormatFloat('###,###,##0',0);

   StatusBar1.Panels[0].Text:='Aguarde, executando pesquisa';
  AbreItemPendenciaNaoAntendia_Cancelada(nrFornecedor,
                                                nrComprador,
                                                0,
                                               strtodate(dtInicio),
                                                strtodate(dtFinal),
                                                idStatus);// {P itens n?o atendidos C: Itens Canceladoe}):TClientDataSet;

   if not _cdsItemPedido.IsEmpty then
   begin
     setGridItemPendente;
     _dsItemPedido.DataSet:=_cdsItemPedido;
     _cdsItemPedido.IndexFieldNames:='NR_FORNCEDOR;DT_PEDIDO';
     _cdsItemPedido.First;
    _btnExceItensNaoAtendido.Enabled:=true;
    if _cdsItemPedidoVT_ITENS_PEDIDO_CUSTO.AsVariant<>null then

    _edtTotalItendCompra.Text:=FormatFloat('###,###,##0.00',_cdsItemPedidoVT_ITENS_PEDIDO_CUSTO.AsVariant);
    _edtVtPrecoFornecedor.Text:=FormatFloat('###,###,##0.00',_cdsItemPedidoVT_ITENS_PRECO_FORNECEDOR.AsVariant);
    _edtNumerosItens.Text:=FormatFloat('###,###,##0',_cdsItemPedidoNR_TOTAL_DE_ITENS.AsVariant);
     _edtTotalUnidades.Text:=FormatFloat('###,###,##0',_cdsItemPedidoNR_TOTAL_UNIDADES.AsVariant);

    _cdsItemPedido.EnableControls;
    StatusBar1.Panels[0].Text:='Pesquisa Finalizada...';
    idNavegando:=true;


   end
   else
   begin

    Mensagem('N?o Existe dados no periodo !!!',MB_ICONWARNING);
    exit;

   end;


end;





procedure T_frmItensNaoAtendidos.setGridItemPendente;
begin
  TIntegerField(_cdsItemPedido.FieldByName('NR_FORNCEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsItemPedido.FieldByName('NR_FORNCEDOR')).DisplayWidth:=005;

  TStringField(_cdsItemPedido.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
  TStringField(_cdsItemPedido.FieldByName('NM_FORNECEDOR')).DisplayWidth:=20;

  TIntegerField(_cdsItemPedido.FieldByName('NR_PEDIDO')).DisplayLabel:='Nr.Pedido';
  TIntegerField(_cdsItemPedido.FieldByName('NR_PEDIDO')).DisplayWidth:=008;

  TDateField(_cdsItemPedido.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
  TDateField(_cdsItemPedido.FieldByName('DT_PEDIDO')).DisplayWidth:=010;
  TDateField(_cdsItemPedido.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';

  TDateField(_cdsItemPedido.FieldByName('DT_PREVISAO')).DisplayLabel:='Dt.Previs?o';
  TDateField(_cdsItemPedido.FieldByName('DT_PREVISAO')).DisplayWidth:=010;
  TDateField(_cdsItemPedido.FieldByName('DT_PREVISAO')).DisplayFormat:='dd/mm/yyyy';

  TIntegerField(_cdsItemPedido.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtd.Pedido';
  TIntegerField(_cdsItemPedido.FieldByName('QT_PEDIDO')).DisplayWidth:=008;

  TIntegerField(_cdsItemPedido.FieldByName('QT_ATENDIDA')).DisplayLabel:='Qtd.Atendida Ped.';
  TIntegerField(_cdsItemPedido.FieldByName('QT_ATENDIDA')).DisplayWidth:=012;

  TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Produto';
  TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayWidth:=008;

  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO')).DisplayWidth:=30;

  TStringField(_cdsItemPedido.FieldByName('ID_ITEM')).DisplayLabel:='Id.Item';
  TStringField(_cdsItemPedido.FieldByName('ID_ITEM')).DisplayWidth:=03;

  TStringField(_cdsItemPedido.FieldByName('ID_CAPA')).DisplayLabel:='Id.Capa';
  TStringField(_cdsItemPedido.FieldByName('ID_CAPA')).DisplayWidth:=03;

  TStringField(_cdsItemPedido.FieldByName('ID_CD')).DisplayLabel:='CD';
  TStringField(_cdsItemPedido.FieldByName('ID_CD')).DisplayWidth:=02;

  TIntegerField(_cdsItemPedido.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdsItemPedido.FieldByName('CD_COMPRADOR')).DisplayWidth:=005;


  TStringField(_cdsItemPedido.FieldByName('NM_COMPRADOR')).DisplayLabel:='Comprador';
  TStringField(_cdsItemPedido.FieldByName('NM_COMPRADOR')).DisplayWidth:=25;

  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayLabel:='Desc.Adic.';
  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayWidth:=006;
  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayFormat:='##0.00';

  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayLabel:='Desc.Padr?o';
  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayWidth:=010;
  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayFormat:='###,##0.00';

  TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayLabel:='Pre?o Unit.Unit?rio';
  TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayWidth:=010;
  TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayFormat:='###,##0.00';


  TFloatField(_cdsItemPedido.FieldByName('VCCi_Y')).DisplayLabel:='Pre?o Unit.Custo';
  TFloatField(_cdsItemPedido.FieldByName('VCCi_Y')).DisplayWidth:=010;
  TFloatField(_cdsItemPedido.FieldByName('VCCi_Y')).DisplayFormat:='###,##0.00';


  TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayLabel:='Pre?o Fornecedor';
  TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayWidth:=010;
  TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayFormat:='###,##0.00';


  TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
  TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayWidth:=005;


  TIntegerField(_cdsItemPedido.FieldByName('qt_mercadoria_entrada')).DisplayLabel:='Qtd. Em Transito';
  TIntegerField(_cdsItemPedido.FieldByName('qt_mercadoria_entrada')).DisplayWidth:=005;

//  TIntegerField(_cdsItemPedido.FieldByName('nr_nfe')).DisplayLabel:='Qtd. Em Transito';
//  TIntegerField(_cdsItemPedido.FieldByName('nr_nfe')).DisplayWidth:=005;

  TIntegerField(_cdsItemPedido.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd. Pendente';
  TIntegerField(_cdsItemPedido.FieldByName('QT_PENDENTE')).DisplayWidth:=10;
  TIntegerField(_cdsItemPedido.FieldByName('QT_PENDENTE')).DisplayFormat:='#,###,##0';

  TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayLabel:='Item em Transito';
  TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayWidth:=10;

end;


Function T_frmItensNaoAtendidos.AbreItemPendenciaNaoAntendia_Cancelada(PnrFornecedor,
                                                PnrComprador,
                                                PnrCD: Integer;
                                                PdtInicio,
                                                PdtFinal:Tdate;
                                                PidTipoRelatorio:String {P itens n?o atendidos C: Itens Canceladoe}):TClientDataSet;
var
  stQry: TStringList;
  //_cdsTemp:TClientDataSet;
begin
  try
    stQry := TStringList.Create;
//    _cdsTemp := TClientDataSet.Create(nil);
 //  _cdsTemp.RemoteServer := _dm._LocalConexao;
 //   _cdsTemp.ProviderName := '_dspGenerica';
    with stQry do
    begin
     Add('SELECT NR_FORNCEDOR, NM_FORNECEDOR,NR_PEDIDO,');
     Add('       ID_CD,DT_PEDIDO, DT_PREVISAO,');
     Add('QT_PEDIDO, Nvl(QT_MERCADORIA_ENTRADA,0) AS QT_MERCADORIA_ENTRADA,');
     add('QT_ATENDIDA,');
     add('QT_PEDIDO - QT_ATENDIDA -  Nvl(QT_MERCADORIA_ENTRADA,0) AS QT_PENDENTE,');
     Add('       CD_PRODUTO,NM_MERCADORIA ,DS_APRESENTACAO,');
     Add('       ID_ITEM ,ID_CAPA,DADY_Y ,ABTY_Y,PUNY_Y,PFBY_Y,VCCi_Y,NRVV_Y,');
     Add('       ITEMPEDIDO.CD_EMPRESA,ID_NFE_TRANSITO,');
     Add('       ID_BONIFICADO,');
     Add('       CD_COMPRADOR,');
     add('   (SELECT NM_COMPRADOR FROM PRDDM.DC_COMPRADOR_GAM WHERE NR_COMPRADOR=CD_COMPRADOR) as nm_comprador');
     Add('FROM  ((');
     Add('SELECT LABP_P NR_FORNCEDOR, DS_GRUPO_FORNECEDOR NM_FORNECEDOR,');
     Add('NROP_P AS NR_PEDIDO,');
     Add('CASE');
     Add('WHEN ITEM.CD_EMPRESA=1 THEN ''SC''');
     Add('WHEN ITEM.CD_EMPRESA=4 THEN ''RS''');
     Add('END ID_CD,');
     Add('DATP_P DT_PEDIDO, PREP_P DT_PREVISAO,');
     Add('QUAY_Y AS QT_PEDIDO,CHEY_Y AS QT_ATENDIDA,');
     Add('CD_MERCADORIA*10+NR_DV_MERCADORIA CD_PRODUTO,NM_MERCADORIA ,');
     Add('DS_APRESENTACAO_MERCADORIA DS_APRESENTACAO,');
     Add('SITY_Y ID_ITEM ,SITP_P ID_CAPA,DADY_Y,vcci_y ,ABTY_Y,PFBY_Y,PUNY_Y,NRVV_Y,ITEM.CD_EMPRESA,NROM_Y,NROP_P,ID_NFE_TRANSITO,');
     Add('CASE');
     Add('WHEN vcci_y=0 THEN ''S''');
     Add('WHEN vcci_y>0 THEN ''N''');
     Add('END ID_BONIFICADO,CD_COMPRADOR');
     Add('FROM');
     Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
     Add('PRDDM.DC_MERCADORIA ME,');
     Add('PRDDM.DCPCC CAPA,');
     Add('PRDDM.DCPCI ITEM');
     Add('WHERE');
     Add('NROP_P = NROP_Y');
     Add('AND NROM_Y=ME.CD_MERCADORIA');
     Add('AND LABP_P = GF.CD_GRUPO_FORNECEDOR');
     if PnrFornecedor>0 then
        Add('AND LABP_P = :PnrFornecedor');
     if PnrCD>0 then
        Add('AND ITEM_CD_EMPRESA = :Pnrcd');
     Add('AND GF.CD_GRUPO_FORNECEDOR IN (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
     Add('FROM PRDDM.DC_COMPRA_MERCADORIA');
     if PnrComprador>0 then
       add('WHERE CD_COMPRADOR=:PnrComprador)')
     else add(')');
     Add(') itempedido');
     Add('LEFT OUTER JOIN');
     Add('(SELECT');
     Add('CD_PEDIDO ,');
     Add('PEDIDO_ITEM_NFE.CD_MERCADORIA,');
     Add('SUM(QT_MERCADORIA_ENTRADA) AS QT_MERCADORIA_ENTRADA,');
     Add('PEDIDO_ITEM_NFE.CD_EMPRESA ,');
     Add('nfe.NR_NFE');
     Add('FROM');
     Add('PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE,');
     Add('PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
     Add('PRDDM.DC_NFE_ENTRADA NFE');
     Add('WHERE');
     Add('ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
     Add('AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
     Add('AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
     Add('AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
     Add('AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
     Add('AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
     Add('AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
     Add('AND NFE.NR_NFE = ITEM_NFE.NR_NFE');

     Add('AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
     Add('AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
     Add('GROUP BY CD_PEDIDO,');
     Add('PEDIDO_ITEM_NFE.CD_MERCADORIA,');
     Add('PEDIDO_ITEM_NFE.CD_EMPRESA,nfe.NR_NFE) NFE ON NFE.CD_PEDIDO=ITEMPEDIDO.NROP_P');
     Add('AND NFE.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
     Add('AND NFE.CD_EMPRESA=ITEMPEDIDO.CD_EMPRESA)');
     add('Where');
     add('nr_pedido>0');
     if PidTipoRelatorio='P' then
     begin
       Add('AND id_item in(''P'',''N'')');
       add('AND (Nvl(QT_MERCADORIA_ENTRADA,0)=0 AND QT_ATENDIDA=0)');
     end;
     if PidTipoRelatorio='C' then
     begin
       Add('AND id_item =''C''');
     end;
    if PnrComprador>0 then
      add(' and cd_comprador=:PnrComprador');


     add('and dt_pedido between :PdtIncio and :PdtFinal');






     stQry.SaveToFile('c:\temp\PendenciaNaoAntendia_Cancelada.sql');

      with _cdsItemPedido do
      begin
        close;
        CommandText := stQry.Text;
        if PnrFornecedor>0 then
            Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
        if PnrCD>0 then
            Params.ParamByName('Pnrcd').AsInteger:=PnrCD;
        if PnrComprador>0 then
          Params.ParamByName('PnrComprador').AsInteger := PnrComprador;
        Params.ParamByName('PdtIncio').AsDateTime:=PdtInicio;
        Params.ParamByName('PdtFinal').AsDateTime:=PdtFinal;
        open;
      end;



    end;
  finally
    FreeAndNil(stQry);
  end;
end;


end.
