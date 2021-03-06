unit uUltimosPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ComCtrls, Grids, DBGrids, uDm;

type
  T_frmUltimosPedidos = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _cdsUltimosPedido: TClientDataSet;
    _dbgUltimosPedido: TDBGrid;
    _dsUltimosPedido: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure _dbgUltimosPedidoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    procedure MostraUltimosPedido(PnrProduto,PcdEmpresa:Integer);
    procedure setGridUltimosPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmUltimosPedidos: T_frmUltimosPedidos;
  nrProdutoUltimosPedido,
  nrEmpresaUltimoPedido:Integer;

implementation

{$R *.dfm}

procedure T_frmUltimosPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmUltimosPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_ESCAPE : close;
  end;
end;

procedure T_frmUltimosPedidos.FormShow(Sender: TObject);
begin
  MostraUltimosPedido(nrProdutoUltimosPedido,nrEmpresaUltimoPedido);
end;

procedure T_frmUltimosPedidos.MostraUltimosPedido(PnrProduto,PcdEmpresa:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
    add('SELECT');
    add('DATP_P , NROP_P, SITY_Y, QUAY_Y  , CHEY_Y,  DADY_Y ,');
    add('ABTY_Y , PUNY_Y,');
    add('case');
    add('when QT_MERCADORIA_ENTRADA>0 then');
    add('nvl(Round((VL_PRODUTO-VL_DESCONTO) /QT_MERCADORIA_ENTRADA,4),0)');
    add('else 0');
    add('End VL_NOTA,');
    add('nvl(ITEM_NFE.nr_nfe,0) as NR_NFE, NRVV_Y, PC_VERBA,');
    add('PFBY_Y,  mercadoria.CD_INTERNO_LABORATORIO,VCCI_Y,item.cd_empresa,ITEM.NR_OPERADOR_LOGISTICO,');
    add('(select nm_empresa FROM acesso.dc_empresa WHERE id_empresa_fisica=''S'' AND cd_empresa=capa.cd_empresa_destino) as Cd_Destino');
    add('FROM');
    add('PRDDM.DCPCC CAPA,');
    add('PRDDM.DCPCI ITEM');
    add('JOIN PRDDM.DC_MERCADORIA MERCADORIA ON MERCADORIA.CD_MERCADORIA=ITEM.NROM_Y');
    add('LEFT OUTER JOIN PRDDM.DC_ITEM_NFE_ENTRADA_PEDIDO PEDIDO_ITEM_NFE ON  PEDIDO_ITEM_NFE.CD_PEDIDO=NROP_Y');
    add('                                                                     AND PEDIDO_ITEM_NFE.CD_EMPRESA=ITEM.CD_EMPRESA');
    add('                                                                     AND PEDIDO_ITEM_NFE.CD_MERCADORIA=NROM_Y');
    add('LEFT OUTER JOIN PRDDM.DC_ITEM_NFE_ENTRADA ITEM_NFE ON  ITEM_NFE.CD_EMPRESA=PEDIDO_ITEM_NFE.CD_EMPRESA');
    add('                                                       AND ITEM_NFE.NR_NFE=PEDIDO_ITEM_NFE.NR_NFE');
    add('                                                       AND ITEM_NFE.NR_NFE_SERIE=PEDIDO_ITEM_NFE.NR_NFE_SERIE');
    add('                                                       AND ITEM_NFE.CD_MERCADORIA=PEDIDO_ITEM_NFE.CD_MERCADORIA');
    add('                                                       AND ITEM_NFE.CD_FABRICANTE= ITEM_NFE.CD_FABRICANTE');
    add('WHERE');
    add('SITP_P IN(''N'',''P'',''F'')');
    add('AND SITY_Y IN(''N'',''P'',''F'')');
   // add('AND item.CD_OPERACAO_REDE=0');
    add('AND NROP_P=NROP_Y');
    add('AND DATP_P>=''01/01/2015''');
    add('AND NROM_Y=:PnrProduto');
  //  add('and item.cd_empresa=capa.cd_empresa');
    add('and capa.cd_empresa_destino=:PcdEmpresa');
    add('ORDER BY DATP_P DESC');


   end;
   stQuery.SaveToFile('c:\temp\CompraS_qryUltimosPedidos.sql');
   with _cdsUltimosPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrProduto').Asbcd:=PnrProduto;
     Params.ParamByName('PcdEmpresa').Asbcd:=PcdEmpresa;

     open;
   end;
   if not _cdsUltimosPedido.IsEmpty then
     _cdsUltimosPedido.First;
   setGridUltimosPedido;
//     _cdsUltimosPedido.IndexFieldNames:='DATP_P';

 finally
   FreeAndNil(stQuery);
 end;

end;
procedure T_frmUltimosPedidos.setGridUltimosPedido;
begin
  TDateField(_cdsUltimosPedido.FieldByName('DATP_P')).DisplayLabel:='Dt.Pedido';
  TDateField(_cdsUltimosPedido.FieldByName('DATP_P')).DisplayWidth:=10;

  TIntegerField(_cdsUltimosPedido.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
  TIntegerField(_cdsUltimosPedido.FieldByName('NROP_P')).DisplayWidth:=9;

  TStringField(_cdsUltimosPedido.FieldByName('SITY_Y')).DisplayLabel:='Situa??o';
  TStringField(_cdsUltimosPedido.FieldByName('SITY_Y')).DisplayWidth:=5;

  TIntegerField(_cdsUltimosPedido.FieldByName('QUAY_Y')).DisplayLabel:='Qtd.Pedido';
  TIntegerField(_cdsUltimosPedido.FieldByName('QUAY_Y')).DisplayWidth:=9;

  TIntegerField(_cdsUltimosPedido.FieldByName('CHEY_Y')).DisplayLabel:='Qtd.Atendida';
  TIntegerField(_cdsUltimosPedido.FieldByName('CHEY_Y')).DisplayWidth:=9;

  TFloatField(_cdsUltimosPedido.FieldByName('ABTY_Y')).DisplayLabel:='Desc.Padr?o';
  TFloatField(_cdsUltimosPedido.FieldByName('ABTY_Y')).DisplayFormat:='##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('ABTY_Y')).DisplayWidth:=6;


  TFloatField(_cdsUltimosPedido.FieldByName('DADY_Y')).DisplayLabel:='Desc.Adic.';
  TFloatField(_cdsUltimosPedido.FieldByName('DADY_Y')).DisplayFormat:='##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('DADY_Y')).DisplayWidth:=6;


  TFloatField(_cdsUltimosPedido.FieldByName('PUNY_Y')).DisplayLabel:='Vlr.Pedido';
  TFloatField(_cdsUltimosPedido.FieldByName('PUNY_Y')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('PUNY_Y')).DisplayWidth:=12;

  TFloatField(_cdsUltimosPedido.FieldByName('VL_NOTA')).DisplayLabel:='Vlr.Nota';
  TFloatField(_cdsUltimosPedido.FieldByName('VL_NOTA')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('VL_NOTA')).DisplayWidth:=12;

  TIntegerField(_cdsUltimosPedido.FieldByName('NR_NFE')).DisplayLabel:='Nr. Nfe';
  TIntegerField(_cdsUltimosPedido.FieldByName('NR_NFE')).DisplayWidth:=12;



  TFloatField(_cdsUltimosPedido.FieldByName('VCCI_Y')).DisplayLabel:='Vlr.Custo';
  TFloatField(_cdsUltimosPedido.FieldByName('VCCI_Y')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('VCCI_Y')).DisplayWidth:=6;

  TIntegerField(_cdsUltimosPedido.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
  TIntegerField(_cdsUltimosPedido.FieldByName('NRVV_Y')).DisplayWidth:=9;

  TIntegerField(_cdsUltimosPedido.FieldByName('CD_EMPRESA')).DisplayLabel:='CD';
  TIntegerField(_cdsUltimosPedido.FieldByName('CD_EMPRESA')).DisplayWidth:=03;

  TIntegerField(_cdsUltimosPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayLabel:='Opera.Logist.';
  TIntegerField(_cdsUltimosPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayWidth:=06;


  TFloatField(_cdsUltimosPedido.FieldByName('PC_VERBA')).DisplayLabel:='% p/ Verba';
  TFloatField(_cdsUltimosPedido.FieldByName('PC_VERBA')).DisplayFormat:='##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('PC_VERBA')).DisplayWidth:=6;

//  TStringField(_cdsUltimosPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayLabel:='Acumulativo';
 // TStringField(_cdsUltimosPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayWidth:=5;

  TFloatField(_cdsUltimosPedido.FieldByName('PFBY_Y')).DisplayLabel:='Pre?o Fornecedor';
  TFloatField(_cdsUltimosPedido.FieldByName('PFBY_Y')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsUltimosPedido.FieldByName('PFBY_Y')).DisplayWidth:=13;

  TStringField(_cdsUltimosPedido.FieldByName('CD_INTERNO_LABORATORIO')).DisplayLabel:='Cod. no Fornecedor';
  TStringField(_cdsUltimosPedido.FieldByName('CD_INTERNO_LABORATORIO')).DisplayWidth:=15;

  TStringField(_cdsUltimosPedido.FieldByName('Cd_Destino')).DisplayLabel:='CD. Destino';
  TStringField(_cdsUltimosPedido.FieldByName('Cd_Destino')).DisplayWidth:=15;


end;
procedure T_frmUltimosPedidos._dbgUltimosPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _dbgUltimosPedido do
  begin
   If odd(_dsUltimosPedido.DataSet.RecNo) then
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

end.
