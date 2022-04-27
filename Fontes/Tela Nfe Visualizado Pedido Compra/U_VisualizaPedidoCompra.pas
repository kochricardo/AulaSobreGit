unit U_VisualizaPedidoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, DBClient, Provider, Grids, DBGrids,
  ComCtrls, StdCtrls;

const
  MSG_CAPTION = 'Visualiza Pedido de Compra ( PEDIDO Nº: ';

type
  T_frVisualizaPedidoCompra = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DSPItemPedidoCompra: TDataSetProvider;
    CDSItemPedidoCompra: TClientDataSet;
    DSItemPedidoCompra: TDataSource;
    SQLItemPedidoCompra: TSQLQuery;
    SQLItemPedidoCompraNROM_M: TBCDField;
    SQLItemPedidoCompraNOMM_M: TStringField;
    SQLItemPedidoCompraAPRM_M: TStringField;
    SQLItemPedidoCompraQUAY_Y: TBCDField;
    SQLItemPedidoCompraSITY_Y: TStringField;
    SQLItemPedidoCompraCHEY_Y: TBCDField;
    SQLItemPedidoCompraABTY_Y: TBCDField;
    SQLItemPedidoCompraPUNY_Y: TFMTBCDField;
    SQLItemPedidoCompraPFBY_Y: TFMTBCDField;
    SQLItemPedidoCompraDADY_Y: TBCDField;
    CDSItemPedidoCompraNROM_M: TBCDField;
    CDSItemPedidoCompraNOMM_M: TStringField;
    CDSItemPedidoCompraAPRM_M: TStringField;
    CDSItemPedidoCompraQUAY_Y: TBCDField;
    CDSItemPedidoCompraSITY_Y: TStringField;
    CDSItemPedidoCompraCHEY_Y: TBCDField;
    CDSItemPedidoCompraABTY_Y: TBCDField;
    CDSItemPedidoCompraPUNY_Y: TFMTBCDField;
    CDSItemPedidoCompraPFBY_Y: TFMTBCDField;
    CDSItemPedidoCompraDADY_Y: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    NR_PEDIDO_CONSULTA :string;
    procedure ListaItemPedidoCompra;
  end;

var
  _frVisualizaPedidoCompra: T_frVisualizaPedidoCompra;

implementation

uses U_db, U_VisualizaCriticaPedidoNFe;

{$R *.dfm}


procedure T_frVisualizaPedidoCompra.ListaItemPedidoCompra;
begin
  CDSItemPedidoCompra.Close;
  SQLItemPedidoCompra.ParamByName('NR_PEDIDO').AsString:=NR_PEDIDO_CONSULTA;
  CDSItemPedidoCompra.Open;
end;

procedure T_frVisualizaPedidoCompra.FormShow(Sender: TObject);
begin
  if _frVisualizaCriticaNFe.ID_PEDIDO_ATUAL = true then
    NR_PEDIDO_CONSULTA:=_frVisualizaCriticaNFe.NRO_PEDIDO_COMPRA
  else
    NR_PEDIDO_CONSULTA:=_frVisualizaCriticaNFe.CDSBuscaPedidoNROP_P.AsString;
  Caption:=MSG_CAPTION + NR_PEDIDO_CONSULTA +' )';
  ListaItemPedidoCompra;
end;

procedure T_frVisualizaPedidoCompra.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure T_frVisualizaPedidoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frVisualizaCriticaNFe.ID_PEDIDO_ATUAL:=true;
  _frVisualizaPedidoCompra:=nil;
  Action:=caFree;
end;

end.
