unit uPedidoEmAnaliseApi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DB, DBClient;

type
  T_frmPedidoEmAnalise = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    _cdsPedidoemAnalise: TClientDataSet;
    _dsPedidoemAnalise: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure SetGridPedidos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmPedidoEmAnalise: T_frmPedidoEmAnalise;

implementation

{$R *.dfm}

procedure T_frmPedidoEmAnalise.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    If odd(_dsPedidoemAnalise.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;
  if( _cdsPedidoemAnalise.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger>1) then
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clAqua;
 end;
 if( _cdsPedidoemAnalise.FieldByName('NR_ITENS').AsInteger=_cdsPedidoemAnalise.FieldByName('NR_ITENS_BONIFICADO').AsInteger) then
 begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:= clBlue;
 end;

 if( _cdsPedidoemAnalise.FieldByName('SITP_P').AsString='W') then
 begin
    Canvas.Font.Color:= clAqua;
    Canvas.Brush.Color:= clBlack;

 end;

 if (Column.Field.FieldName = 'LOCAL_CD') then
 begin
  if _cdsPedidoemAnalise.FieldByName('LOCAL_CD').AsString='SC' then
  begin
    Canvas.brush.Color:= clGreen;
    Canvas.Font.Color:= clwhite;
  end;
  if _cdsPedidoemAnalise.FieldByName('LOCAL_CD').AsString='RS' then
  begin
    Canvas.brush.Color := $000080FF;
    Canvas.Font.Color := clBlack;
  end;
  if _cdsPedidoemAnalise.FieldByName('LOCAL_CD').AsString='ES' then
  begin
    Canvas.brush.Color := clFuchsia;
    Canvas.Font.Color := clBlack;
  end;


 end;
  if (Column.Field.FieldName ='NM_USUARIO') then
 begin
  if _cdsPedidoemAnalise.FieldByName('NM_USUARIO').AsString='API' then
  begin

   Canvas.brush.Color := clGreen;
   Canvas.Font.Color := clWhite;
  end;
 end;



 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clblue;
    Canvas.Font.Color:= clYellow;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmPedidoEmAnalise.FormShow(Sender: TObject);
begin
  if _cdsPedidoemAnalise<>nil then
  begin
    _dsPedidoemAnalise.DataSet:=_cdsPedidoemAnalise;

    _cdsPedidoemAnalise.Open;
    SetGridPedidos;

  end;


end;


procedure T_frmPedidoEmAnalise.SetGridPedidos;
begin
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NROP_P')).DisplayWidth:=7;

 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PEDIDO')).DisplayWidth:=10;

 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PREVISTA')).DisplayLabel:='Dt.Prevista';
 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PREVISTA')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PREVISTA')).DisplayWidth:=10;

 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_LIQ')).DisplayLabel:='Vlr.Ped.Liquido';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_LIQ')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_LIQ')).DisplayWidth:=12;


 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_FAT_LIQ')).DisplayLabel:='Vlr.Fatur.Liquido';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_FAT_LIQ')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_FAT_LIQ')).DisplayWidth:=12;


 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayLabel:='Dt.Faturar em';
 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedidoemAnalise.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayWidth:=10;


 TIntegerField(_cdsPedidoemAnalise.FieldByName('LABP_P')).DisplayLabel:='Nr.Fornec.';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('LABP_P')).DisplayWidth:=7;

 TStringField(_cdsPedidoemAnalise.FieldByName('LOCAL_CD')).DisplayLabel:='Local.CD';
 TStringField(_cdsPedidoemAnalise.FieldByName('LOCAL_CD')).DisplayWidth:=05;

 TStringField(_cdsPedidoemAnalise.FieldByName('ID_OCD')).DisplayLabel:='O.C.D';
 TStringField(_cdsPedidoemAnalise.FieldByName('ID_OCD')).DisplayWidth:=05;

 TStringField(_cdsPedidoemAnalise.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
 TStringField(_cdsPedidoemAnalise.FieldByName('NM_FORNECEDOr')).DisplayWidth:=25;

 TStringField(_cdsPedidoemAnalise.FieldByName('NM_USUARIO')).DisplayLabel:='Usuario';
 TStringField(_cdsPedidoemAnalise.FieldByName('NM_USUARIO')).DisplayWidth:=15;
 TStringField(_cdsPedidoemAnalise.FieldByName('NM_USUARIO')).Visible:=FALSE;

 TStringField(_cdsPedidoemAnalise.FieldByName('OBSP_P')).DisplayLabel:='Observa??o';
 TStringField(_cdsPedidoemAnalise.FieldByName('OBSP_P')).DisplayWidth:=45;



 TStringField(_cdsPedidoemAnalise.FieldByName('SITP_P')).DisplayLabel:='Status';
 TStringField(_cdsPedidoemAnalise.FieldByName('SITP_P')).DisplayWidth:=04;

 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_ITENS')).DisplayWidth:=7;

 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_UNIDADES')).DisplayLabel:='Nr.Unid.';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_UNIDADES')).DisplayFormat:='###,###,##0';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_UNIDADES')).DisplayWidth:=7;

 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_CANCELADO')).DisplayLabel:='Nr.Itens Cancel.';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_CANCELADO')).DisplayWidth:=7;
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_NOVO')).DisplayLabel:='Itens Nao Fat.';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_NOVO')).DisplayWidth:=7;

 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_CUSTO')).DisplayLabel:='Vlr.Pedido Custo';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_CUSTO')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_CUSTO')).DisplayWidth:=12;

 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_FABR')).DisplayLabel:='Vlr.Ped.P?o Fornec.';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_FABR')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_FABR')).DisplayWidth:=12;

 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_FATURADO')).DisplayLabel:='Nr.Unid.Fat';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_FATURADO')).DisplayWidth:=7;

 TIntegerField(_cdsPedidoemAnalise.FieldByName('QT_FATURADO')).DisplayLabel:='Qtd.Unid.Fat';
 TIntegerField(_cdsPedidoemAnalise.FieldByName('QT_FATURADO')).DisplayWidth:=7;

  TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_FAT')).DisplayLabel:='Vlr.Faturador Custo';
  TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_FAT')).DisplayFormat:='##,###,###,##0.00';
  TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PEDIDO_FAT')).DisplayWidth:=12;

  TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_FAT_FABR')).DisplayLabel:='Vlr.Faturador Fornec.';
  TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_FAT_FABR')).DisplayFormat:='##,###,###,##0.00';
  TFloatField(_cdsPedidoemAnalise.FieldByName('VL_PED_FAT_FABR')).DisplayWidth:=12;

  TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayLabel:='Cond.Pag.';
  TIntegerField(_cdsPedidoemAnalise.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayWidth:=7;
end;


end.
