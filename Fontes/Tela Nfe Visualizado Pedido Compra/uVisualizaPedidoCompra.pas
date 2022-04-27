unit uVisualizaPedidoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, DBClient, Provider, Grids, DBGrids,
  ComCtrls, StdCtrls, uDm;

const
  MSG_CAPTION = 'Visualiza Pedido de Compra ( PEDIDO Nº: ';

type
  T_frmVisualizaPedidoCompra = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DSPItemPedidoCompra: TDataSetProvider;
    CDSItemPedidoCompra: TClientDataSet;
    DSItemPedidoCompra: TDataSource;
    SQLItemPedidoCompra: TSQLQuery;
    SQLItemPedidoCompraNROM_M: TFMTBCDField;
    SQLItemPedidoCompraNOMM_M: TWideStringField;
    SQLItemPedidoCompraAPRM_M: TWideStringField;
    SQLItemPedidoCompraQUAY_Y: TFMTBCDField;
    SQLItemPedidoCompraSITY_Y: TWideStringField;
    SQLItemPedidoCompraCHEY_Y: TFMTBCDField;
    SQLItemPedidoCompraABTY_Y: TFMTBCDField;
    SQLItemPedidoCompraPUNY_Y: TFMTBCDField;
    SQLItemPedidoCompraPFBY_Y: TFMTBCDField;
    SQLItemPedidoCompraDADY_Y: TFMTBCDField;
    CDSItemPedidoCompraNROM_M: TFMTBCDField;
    CDSItemPedidoCompraNOMM_M: TWideStringField;
    CDSItemPedidoCompraAPRM_M: TWideStringField;
    CDSItemPedidoCompraQUAY_Y: TFMTBCDField;
    CDSItemPedidoCompraSITY_Y: TWideStringField;
    CDSItemPedidoCompraCHEY_Y: TFMTBCDField;
    CDSItemPedidoCompraABTY_Y: TFMTBCDField;
    CDSItemPedidoCompraPUNY_Y: TFMTBCDField;
    CDSItemPedidoCompraPFBY_Y: TFMTBCDField;
    CDSItemPedidoCompraDADY_Y: TFMTBCDField;
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
  _frmVisualizaPedidoCompra: T_frmVisualizaPedidoCompra;

implementation

uses uVisualizaCriticaPedidoNFe;


{$R *.dfm}


procedure T_frmVisualizaPedidoCompra.ListaItemPedidoCompra;
begin
  CDSItemPedidoCompra.Close;
  SQLItemPedidoCompra.ParamByName('NR_PEDIDO').AsString:=NR_PEDIDO_CONSULTA;
  CDSItemPedidoCompra.Open;
end;

procedure T_frmVisualizaPedidoCompra.FormShow(Sender: TObject);
begin
  if _frmVisualizaCriticaNFe.ID_PEDIDO_ATUAL = true then
    NR_PEDIDO_CONSULTA:=_frmVisualizaCriticaNFe.NRO_PEDIDO_COMPRA
  else
    NR_PEDIDO_CONSULTA:=_frmVisualizaCriticaNFe.CDSBuscaPedidoNROP_P.AsString;
  Caption:=MSG_CAPTION + NR_PEDIDO_CONSULTA +' )';
  ListaItemPedidoCompra;
end;

procedure T_frmVisualizaPedidoCompra.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure T_frmVisualizaPedidoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frmVisualizaCriticaNFe.ID_PEDIDO_ATUAL:=true;
  _frmVisualizaPedidoCompra:=nil;
  Action:=caFree;
end;

end.
