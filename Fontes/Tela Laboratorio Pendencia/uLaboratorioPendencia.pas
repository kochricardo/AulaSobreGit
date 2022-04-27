unit uLaboratorioPendencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, uTelaPadrao, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls, uRotinasGenericas, uSistemaCompras, uAuxiliarCompras;

type
  T_frmLaboratorioPendencia = class(T_frmPadrao)
    _dbgPendenciaLaboratorio: TDBGrid;
    _cdsLabPendencia: TClientDataSet;
    _dsLabPendencia: TDataSource;
    _cdsPedidoPendente: TClientDataSet;
    _dsPedidoPendente: TDataSource;
    GroupBox4: TGroupBox;
    _dbgItemPedido: TDBGrid;
    _dsItemPedido: TDataSource;
    _cdsItemPedido: TClientDataSet;
    BitBtn1: TBitBtn;
    _dbgPedidoPendente: TDBGrid;
    Edit1: TEdit;
    procedure _btnExecutaClick(Sender: TObject);
    procedure _dbgPendenciaLaboratorioTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure _dsLabPendenciaDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure _dsPedidoPendenteDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _dbgPendenciaLaboratorioDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPedidoPendenteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgItemPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPedidoPendenteEnter(Sender: TObject);
    procedure _dbgItemPedidoDblClick(Sender: TObject);
    procedure _dbgItemPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPedidoPendenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPendenciaLaboratorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPendenciaLaboratorioDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure _dbgPedidoPendenteTitleClick(Column: TColumn);
  private
    procedure AbreLaboratorioPendencia(nrComprador:Integer);
    procedure SetGridPendenciaLaboratorio;
    procedure AbrePedidoComPendencia(nrLaboratorio: Integer);
    procedure SetGridPedidoPendente;
    procedure AbreItemPedidoComPendencia(nrPedido: Integer);
    procedure SetGridItemPedidoPendente;
    procedure ApagaCapaPedido;
    procedure EliminaPedndenciaItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmLaboratorioPendencia: T_frmLaboratorioPendencia;

implementation

{$R *.dfm}

procedure T_frmLaboratorioPendencia.AbreLaboratorioPendencia(nrComprador:Integer);
var
 stQuery :TStringList;
begin
try
   stQuery:=TStringList.Create;
   with stQuery do
   begin


     add('SELECT LABP_P,');
     add('DS_GRUPO_FORNECEDOR,');
     add('SUM(NR_ITENS) AS NR_ITENS,NVL(SUM(NR_PARCIAL),0) AS NR_PARCIAL,');
     add('NVL(SUM(NR_CANCELADO),0) AS NR_CANCELADO,');
     add('NVL(SUM(NR_NOVO),0) AS NR_NOVO,');
     add('COUNT(QT_MERCADORIA_ENTRADA) QT_TRANSITO');
     add('FROM');
     add('(SELECT');
     add('CAPA.LABP_P,GF.DS_GRUPO_FORNECEDOR,COUNT(*) NR_ITENS,');
     add('CASE');
     add('WHEN SITY_Y=''P'' THEN COUNT(*)');
     add('END NR_PARCIAL,');
     add('CASE');
     add('WHEN SITY_Y=''C'' THEN COUNT(*)');
     add('END NR_CANCELADO,');
     add('CASE');
     add('WHEN SITY_Y=''N'' THEN COUNT(*)');
     add('END NR_NOVO,');
     add('NROM_Y,');
     add('ITEM.CD_EMPRESA,');
     add('NROP_P');
     add('');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM');
     add('WHERE');
     add('    NROP_P = NROP_Y');
     add('AND SITY_Y IN(''N'',''P'')');
     add('AND LABP_P = GF.CD_GRUPO_FORNECEDOR');
     add('AND GF.CD_GRUPO_FORNECEDOR IN (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
     add('FROM PRDDM.DC_COMPRA_MERCADORIA WHERE CD_COMPRADOR=:PnrComprador)');
     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,NROM_Y,SITY_Y,ITEM.CD_EMPRESA,NROP_P,LABP_P,DS_GRUPO_FORNECEDOR');
     add(') ITEMPEDIDO');
     add('LEFT OUTER JOIN');
     add('(SELECT');
     add('CD_PEDIDO ,');
     add('PEDIDO_ITEM_NFE.CD_MERCADORIA,');
     add('SUM(QT_MERCADORIA_ENTRADA) AS QT_MERCADORIA_ENTRADA,');
     add('PEDIDO_ITEM_NFE.CD_EMPRESA ,');
     add('NFE.NR_NFE');
     add('FROM');
     add('PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE,');
     add('PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE,');
     add('PRDDM.DC_NFE_ENTRADA NFE');
     add('WHERE');
     add('ITEM_NFE.CD_EMPRESA = PEDIDO_ITEM_NFE.CD_EMPRESA');
     add('AND ITEM_NFE.CD_FABRICANTE = PEDIDO_ITEM_NFE.CD_FABRICANTE');
     add('AND ITEM_NFE.NR_NFE = PEDIDO_ITEM_NFE.NR_NFE');
     add('AND ITEM_NFE.NR_NFE_SERIE = PEDIDO_ITEM_NFE.NR_NFE_SERIE');
     add('AND ITEM_NFE.CD_MERCADORIA = PEDIDO_ITEM_NFE.CD_MERCADORIA');
     add('AND NFE.CD_EMPRESA = ITEM_NFE.CD_EMPRESA');
     add('AND NFE.CD_FABRICANTE = ITEM_NFE.CD_FABRICANTE');
     add('AND NFE.NR_NFE = ITEM_NFE.NR_NFE');
     add('AND NFE.NR_NFE_SERIE = ITEM_NFE.NR_NFE_SERIE');
     add('AND TO_CHAR(NFE.DT_PROCESSAMENTO_ENTRADA,''DD/MM/YYYY'') = ''01/01/2039''');
     add('GROUP BY CD_PEDIDO,');
     add('PEDIDO_ITEM_NFE.CD_MERCADORIA,');
     add('PEDIDO_ITEM_NFE.CD_EMPRESA,NFE.NR_NFE) NFE ON NFE.CD_PEDIDO=ITEMPEDIDO.NROP_P');
     add('AND NFE.CD_MERCADORIA=ITEMPEDIDO.NROM_Y');
     add('AND NFE.CD_EMPRESA=ITEMPEDIDO.CD_EMPRESA');
     add('GROUP BY DS_GRUPO_FORNECEDOR,LABP_P');












    { add('SELECT LABP_P,DS_GRUPO_FORNECEDOR,Sum(NR_ITENS) as NR_ITENS,Nvl(sum(NR_PARCIAL),0) AS NR_PARCIAL,');
     add('Nvl(sum(NR_CANCELADO),0) AS NR_CANCELADO,');
     add('Nvl(sum(NR_NOVO),0) AS NR_NOVO');
     add('FROM');
     add(' (SELECT');
     add('LABP_P,DS_GRUPO_FORNECEDOR,Count(*) NR_ITENS,');
     add('CASE');
     add('WHEN sitY_y=''P'' THEN Count(*)');
     add('END NR_PARCIAL,');
     add('CASE');
     add('WHEN sitY_y=''C'' THEN Count(*)');
     add('END NR_CANCELADO,');
     add('CASE');
     add('WHEN sitY_y=''N'' THEN Count(*)');
     add('END NR_NOVO');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
     add('PRDDM.DCPCC,');
     add('PRDDM.DCPCI ');
     add('WHERE');
     add('    NROP_P = NROP_Y');
     add('AND SITY_Y IN(''N'',''P'')');
     add('AND LABP_P = GF.CD_GRUPO_FORNECEDOR');
     //add('AND PREP_P<=trunc(sysdate)');
     add('AND GF.CD_GRUPO_FORNECEDOR IN (SELECT DISTINCT CD_GRUPO_FORNECEDOR');
     add('FROM PRDDM.DC_COMPRA_MERCADORIA WHERE CD_COMPRADOR=:PnrComprador)');
     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,SITY_Y)');
     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR');}
   end;
   stQuery.SaveToFile('C:\TEMP\LaboratorioPendencia.sql');

   with _cdsLabPendencia do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrComprador').AsInteger:=nrComprador;
     open;
   end;
   SetGridPendenciaLaboratorio;
//   SetGridPedidoPendente;

//   if not _cdsLabPendencia.isEmpty then
  //    SetGridPendenciaLaboratorio

 finally
   FreeAndNil(stQuery);
 end;
end;

procedure T_frmLaboratorioPendencia.AbrePedidoComPendencia(nrLaboratorio:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
     add('SELECT NROP_P');
     Add(',CD');
     ADD(',DATP_P,PREP_P,SITP_P, SUM(NR_ITENS) AS NR_ITENS');
     add(',NVL(SUM(NR_PARCIAL),0) AS NR_PARCIAL,');
     add('NVL(SUM(NR_NOVO),0) AS NR_NOVO, cd_empresa');
     add('FROM');
     add('(SELECT');
     add('NROP_P,DATP_P,PREP_P,SITP_P,CAPA.CD_EMPRESA, NM_EMPRESA CD,');
     add('COUNT(*) NR_ITENS,');
     add('CASE');
     add('WHEN SITY_Y=''P'' THEN COUNT(*)');
     add('END NR_PARCIAL,');
     add('CASE');
     add('WHEN SITY_Y=''N'' THEN COUNT(*)');
     add('END NR_NOVO');
     add('FROM');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM,');
     add('ACESSO.DC_EMPRESA EMP');
     add('WHERE');
     add('NROP_P = NROP_Y');
     add('AND ITEM.CD_EMPRESA=CAPA.CD_EMPRESA');
     Add('AND ID_EMPRESA_FISICA=''S''');
     add('AND EMP.CD_EMPRESA=CD_EMPRESA_DESTINO');
     add('AND SITY_Y IN(''N'',''P'')');;
     add('AND labp_p=:PnrLaboratorio');
   //  add('AND PREP_P<=TRUNC(SYSDATE)');
     add('GROUP BY NROP_P,DATP_P,PREP_P,SITP_P,SITY_Y,capa.cd_empresa,NM_EMPRESA)');
     add('GROUP BY NROP_P,DATP_P,SITP_P,PREP_P,CD_EMPRESA,cd');
   end;
   stQuery.SaveToFile('C:\TEMP\PedidoComPendencia.sql');
   with _cdsPedidoPendente do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrLaboratorio').AsInteger:=nrLaboratorio;
     open;
   end;
   if not _cdsPedidoPendente.IsEmpty then
        SetGridPedidoPendente;
  { with _cdsPedidoPendente do
   begin
     filtered:=false;
     Filter:='SITP_P IN(''N'',''P'')';
     filtered:=true;
   end; }

//   if not _cdsPedidoPendente.IsEmpty then
  //    SetGridPedidoPendente;
 finally

 end;

end;


procedure T_frmLaboratorioPendencia.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
//  if Confirma('Deseja Eliminar Pendencia?',MB_DEFBUTTON1)=IDYES then
  //   AlteraStatusPedido(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);
//  AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);
  AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);

end;

procedure T_frmLaboratorioPendencia.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  If odd(_dsPedidoPendente.DataSet.RecNo) then
 begin
  _dbgPendenciaLaboratorio.Canvas.Font.Color:= clBlack;
  _dbgPendenciaLaboratorio.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgPendenciaLaboratorio.Canvas.Font.Color:= clBlack;
  _dbgPendenciaLaboratorio.Canvas.Brush.Color:= clWhite;
 end;
 if(gdFocused in State) then
 begin
    _dbgPendenciaLaboratorio.Canvas.brush.Color:= clYellow;
    _dbgPendenciaLaboratorio.     Canvas.Font.Color:= clblue;
 end;

 _dbgPendenciaLaboratorio.Canvas.FillRect(Rect);
 _dbgPendenciaLaboratorio.DefaultDrawDataCell(Rect,_dbgPendenciaLaboratorio.columns[datacol].field, State);

end;

procedure T_frmLaboratorioPendencia.AbreItemPedidoComPendencia(nrPedido:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
     add('SELECT');
     add('CD_MERCADORIA*10+NR_DV_MERCADORIA CODIGO,NM_MERCADORIA,');
     add('DS_APRESENTACAO_MERCADORIA,SITY_Y,QUAY_Y,CHEY_Y,ABTY_Y,');
      add('DADY_Y,NRVV_Y,NROM_Y,capa.CD_EMPRESA,ID_NFE_TRANSITO');
     add('FROM');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM,');
     add('PRDDM.DC_MERCADORIA');
     add('WHERE');
     add('NROP_P = NROP_Y');
     add('AND NROM_Y = CD_MERCADORIA');
    // add('AND SITP_P IN(''N'',''P'')');;
     add('AND SITY_Y IN(''N'',''P'')');;
     add('AND NROP_P=:PnrPedido');
   end;
   with _cdsItemPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrPedido').AsInteger:=nrPedido;
     open;
   end;
   if not _cdsPedidoPendente.IsEmpty then
      SetGridItemPedidoPendente;
 finally

 end;

end;


procedure T_frmLaboratorioPendencia._btnExecutaClick(Sender: TObject);
begin
  AbreLaboratorioPendencia(StrToInt64(Edit1.Text));
//  nrCompradorSistema:=StrToInt64(Edit1.Text);
  SetGridPendenciaLaboratorio;

//  inherited;
end;

procedure T_frmLaboratorioPendencia._dbgItemPedidoDblClick(Sender: TObject);

begin
  EliminaPedndenciaItem;
  AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);

 // inherited;

end;

procedure T_frmLaboratorioPendencia._dbgItemPedidoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 If odd(_dsItemPedido.DataSet.RecNo) then
 begin
  _dbgItemPedido.Canvas.Font.Color:= clBlack;
  _dbgItemPedido.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgItemPedido.Canvas.Font.Color:= clBlack;
  _dbgItemPedido.Canvas.Brush.Color:= clWhite;
 end;

 if _dsItemPedido.DataSet.FieldByName('ID_NFE_TRANSITO').AsString='S' then
 begin
  _dbgItemPedido.Canvas.Font.Color:= clWhite;
  _dbgItemPedido.Canvas.Brush.Color:= clGreen;

 end;

 if(gdFocused in State) then
 begin
    _dbgItemPedido.Canvas.brush.Color:= clYellow;
    _dbgItemPedido.     Canvas.Font.Color:= clblue;
 end;
 _dbgItemPedido.Canvas.FillRect(Rect);
 _dbgItemPedido.DefaultDrawDataCell(Rect,_dbgItemPedido.columns[datacol].field, State);

end;

procedure T_frmLaboratorioPendencia._dbgItemPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
     vk_f5  : EliminaPedndenciaItem;
  VK_DELETE : EliminaPedndenciaItem;

  end;

end;

procedure T_frmLaboratorioPendencia._dbgPedidoPendenteDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 If odd(_dsPedidoPendente.DataSet.RecNo) then
 begin
  _dbgPedidoPendente.Canvas.Font.Color:= clBlack;
  _dbgPedidoPendente.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgPedidoPendente.Canvas.Font.Color:= clBlack;
  _dbgPedidoPendente.Canvas.Brush.Color:= clWhite;
 end;
 if(gdFocused in State) then
 begin
    _dbgPedidoPendente.Canvas.brush.Color:= clYellow;
    _dbgPedidoPendente.     Canvas.Font.Color:= clblue;
 end;
 _dbgPedidoPendente.Canvas.FillRect(Rect);
 _dbgPedidoPendente.DefaultDrawDataCell(Rect,_dbgPedidoPendente.columns[datacol].field, State);

end;

procedure T_frmLaboratorioPendencia._dbgPedidoPendenteEnter(Sender: TObject);
begin
  inherited;
  AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);

end;

procedure T_frmLaboratorioPendencia._dbgPedidoPendenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN :AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);

    VK_DELETE :  ApagaCapaPedido;
    VK_F10    : ApagaCapaPedido;

  end;
end;

procedure T_frmLaboratorioPendencia._dbgPedidoPendenteTitleClick(
  Column: TColumn);
begin
  inherited;
  GeraOrdenacao(_cdsPedidoPendente,Column);
end;

procedure T_frmLaboratorioPendencia._dbgPendenciaLaboratorioDblClick(
  Sender: TObject);
begin
  inherited;
    if not _cdsLabPendencia.IsEmpty then
       AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);

end;

procedure T_frmLaboratorioPendencia._dbgPendenciaLaboratorioDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  If odd(_dsLabPendencia.DataSet.RecNo) then
 begin
  _dbgPendenciaLaboratorio.Canvas.Font.Color:= clBlack;
  _dbgPendenciaLaboratorio.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgPendenciaLaboratorio.Canvas.Font.Color:= clBlack;
  _dbgPendenciaLaboratorio.Canvas.Brush.Color:= clWhite;
 end;
 if(gdFocused in State) then
 begin
    _dbgPendenciaLaboratorio.Canvas.brush.Color:= clYellow;
    _dbgPendenciaLaboratorio.     Canvas.Font.Color:= clblue;
 end;

 _dbgPendenciaLaboratorio.Canvas.FillRect(Rect);
 _dbgPendenciaLaboratorio.DefaultDrawDataCell(Rect,_dbgPendenciaLaboratorio.columns[datacol].field, State);

end;

procedure T_frmLaboratorioPendencia._dbgPendenciaLaboratorioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
   VK_RETURN : AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);
  end;
end;

procedure T_frmLaboratorioPendencia._dbgPendenciaLaboratorioTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsLabPendencia,Column);
  inherited;

end;

procedure T_frmLaboratorioPendencia._dsLabPendenciaDataChange(Sender: TObject;
  Field: TField);
begin
  _cdsPedidoPendente.Close;
  _cdsItemPedido.Close;
  if ActiveControl=_dbgPendenciaLaboratorio then
     AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);
  inherited;

end;

procedure T_frmLaboratorioPendencia._dsPedidoPendenteDataChange(Sender: TObject;
  Field: TField);
begin
{ _cdsItemPedido.Close;
 if ActiveControl=_dbgPedidoPendente then
 begin
  if _frmLaboratorioPendencia.Active then
     AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);
 end;}
 // inherited;

end;

procedure T_frmLaboratorioPendencia.FormCreate(Sender: TObject);
begin
  inherited;
    TestaConexaoBase(_dm._conexao, nrBase);

end;

procedure T_frmLaboratorioPendencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
   VK_ESCAPE : close;
  end;
end;

procedure T_frmLaboratorioPendencia.FormShow(Sender: TObject);
begin
  AbreLaboratorioPendencia(nrCompradorSistema);
  GeraOrdenacao(_cdsLabPendencia,_dbgPendenciaLaboratorio.Columns.Items[1]);
  AbreItemPedidoComPendencia(0);
  SetGridPendenciaLaboratorio;
  if not _cdsPedidoPendente.IsEmpty then
  begin
   SetGridPedidoPendente;
   SetGridItemPedidoPendente;
  end;
  inherited;

end;

procedure T_frmLaboratorioPendencia.SetGridPendenciaLaboratorio;
begin
  TIntegerField(_cdsLabPendencia.FieldByName('LABP_P')).DisplayLabel:='Nr.Forn.';
  TIntegerField(_cdsLabPendencia.FieldByName('LABP_P')).DisplayWidth:=8;

  TStringField(_cdsLabPendencia.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Razão Social Forn.';
  TStringField(_cdsLabPendencia.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=35;

//  TStringField(_cdsLabPendencia.FieldByName('SITP_P')).DisplayLabel:='Status Ped.';
 // TStringField(_cdsLabPendencia.FieldByName('SITP_P')).DisplayWidth:=10;

  TIntegerField(_cdsLabPendencia.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens Pend.';
  TIntegerField(_cdsLabPendencia.FieldByName('NR_ITENS')).DisplayWidth:=8;

  TIntegerField(_cdsLabPendencia.FieldByName('NR_PARCIAL')).DisplayLabel:='Fat.Parcial';
  TIntegerField(_cdsLabPendencia.FieldByName('NR_PARCIAL')).DisplayWidth:=8;

  TIntegerField(_cdsLabPendencia.FieldByName('NR_NOVO')).DisplayLabel:='Não Faturado';
  TIntegerField(_cdsLabPendencia.FieldByName('NR_NOVO')).DisplayWidth:=8;

  TIntegerField(_cdsLabPendencia.FieldByName('NR_CANCELADO')).DisplayLabel:='Itens Cancel.';
  TIntegerField(_cdsLabPendencia.FieldByName('NR_CANCELADO')).DisplayWidth:=8;

  TIntegerField(_cdsLabPendencia.FieldByName('QT_TRANSITO')).DisplayLabel:='Itens Transito';
  TIntegerField(_cdsLabPendencia.FieldByName('QT_TRANSITO')).DisplayWidth:=8;
end;

procedure T_frmLaboratorioPendencia.SetGridPedidoPendente;
begin

//    ,DATP_P, PREP_P, DT_PREVISTA_FATURAMENTO,Count(*) NR_ITENS

  TStringField(_cdsPedidoPendente.FieldByName('CD')).DisplayLabel:='CD.';
  TStringField(_cdsPedidoPendente.FieldByName('CD')).DisplayWidth:=20;

  TIntegerField(_cdsPedidoPendente.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
  TIntegerField(_cdsPedidoPendente.FieldByName('NROP_P')).DisplayWidth:=8;

  TDateField(_cdsPedidoPendente.FieldByName('DATP_P')).DisplayLabel:='Dt.Pedido';
  TdateField(_cdsPedidoPendente.FieldByName('DATP_P')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsPedidoPendente.FieldByName('DATP_P')).DisplayWidth:=10;

  TDateField(_cdsPedidoPendente.FieldByName('PREP_P')).DisplayLabel:='Dt.Prev.Entrega';
  TdateField(_cdsPedidoPendente.FieldByName('PREP_P')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsPedidoPendente.FieldByName('PREP_P')).DisplayWidth:=10;

  TStringField(_cdsPedidoPendente.FieldByName('SITP_P')).DisplayLabel:='Status Ped.';
  TStringField(_cdsPedidoPendente.FieldByName('SITP_P')).DisplayWidth:=10;


  TIntegerField(_cdsPedidoPendente.FieldByName('NR_PARCIAL')).DisplayLabel:='Fat.Parcial';
  TIntegerField(_cdsPedidoPendente.FieldByName('NR_PARCIAL')).DisplayWidth:=8;

  TIntegerField(_cdsPedidoPendente.FieldByName('NR_NOVO')).DisplayLabel:='Não Faturado';
  TIntegerField(_cdsPedidoPendente.FieldByName('NR_NOVO')).DisplayWidth:=8;

  TIntegerField(_cdsPedidoPendente.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
  TIntegerField(_cdsPedidoPendente.FieldByName('NR_ITENS')).DisplayWidth:=8;
end;
procedure T_frmLaboratorioPendencia.SetGridItemPedidoPendente;
begin

//    ,DATP_P, PREP_P, DT_PREVISTA_FATURAMENTO,Count(*) NR_ITENS
 //,,,
  TIntegerField(_cdsItemPedido.FieldByName('CODIGO')).DisplayLabel:='Codigo';
  TIntegerField(_cdsItemPedido.FieldByName('CODIGO')).DisplayWidth:=8;

  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresentação';
  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayLabel:='Status';
  TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayWidth:=5;

  TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayLabel:='Quant.Ped.';
  TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayWidth:=8;

  TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayLabel:='Quant.Atend.';
  TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayWidth:=8;

  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayLabel:='Desc.Padrão';
  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayFormat:='##0.00';
  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayWidth:=6;

  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayLabel:='Desc.Adic';
  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayFormat:='##0.00';
  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayWidth:=6;

  TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayLabel:='Nr. Verba';
  TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayWidth:=8;

//   IA,SITY_Y,QUAY_Y,CHEY_Y,ABTY_Y,');
  //    ,capa.CD_EMPRESA');

  TIntegerField(_cdsItemPedido.FieldByName('NROM_Y')).Visible:=FALSE;
  TIntegerField(_cdsItemPedido.FieldByName('CD_EMPRESA')).Visible:=FALSE;

  TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayLabel:='Pedido Em Transito';
  TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayWidth:=5;

end;


procedure T_frmLaboratorioPendencia.ApagaCapaPedido;
VAR
 idMarcador :TBookmark;

begin
                if Confirma('Elimina todo Pedido da Pendencia !!!'+#13+
                            'Deseja Eliminar Pendencia?',MB_DEFBUTTON1)=IDYES then
                begin
                   idMarcador:=_cdsPedidoPendente.Bookmark;
                   AlteraStatusPedido(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger,0,true);
                   AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);
                   if _cdsPedidoPendente.RecordCount>1 then
                     _cdsPedidoPendente.Bookmark:=idMarcador;


                end;
                AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);
               SetGridPedidoPendente;
               SetGridItemPedidoPendente;

end;


Procedure T_frmLaboratorioPendencia.EliminaPedndenciaItem;
var
  idMarcadorCapa :TBookmark;
begin
   idMarcadorCapa:=_cdsPedidoPendente.Bookmark;

  try
   if Confirma('Deseja Eliminar item da Pendencia?',MB_DEFBUTTON1)=IDYES then
   begin
     if _cdsItemPedido.FieldByName('ID_NFE_TRANSITO').AsString='S' then
     begin
      if not GetsituacaoNfe(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger,
                        _cdsItemPedido.FieldByName('NROM_Y').AsInteger,_cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger)then
      begin
       if GetStatusNfe(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger,
                       _cdsItemPedido.FieldByName('NROM_Y').AsInteger) then
       begin
          Mensagem('Este Item Já Foi Faturado No Fornecedor!!!'+#13+
                   'Não pode ser excluida!!!',MB_ICONWARNING);
                           exit;

                          exit;

       end;
      end;
     end;


     AlteraStatusItemPedido(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger,
                           _cdsItemPedido.FieldByName('NROM_Y').AsInteger,
                           _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,nmLogin);
  AbreItemPedidoComPendencia(_cdsPedidoPendente.FieldByName('NROP_P').AsInteger);
  AbrePedidoComPendencia(_cdsLabPendencia.FieldByName('LABP_P').AsInteger);
  if _cdsPedidoPendente.RecordCount>1 then
     _cdsPedidoPendente.Bookmark:=idMarcadorCapa;
   end;
  except

  end;

end;
end.
