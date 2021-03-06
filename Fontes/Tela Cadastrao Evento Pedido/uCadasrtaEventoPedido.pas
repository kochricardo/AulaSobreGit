unit uCadasrtaEventoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, StdCtrls, Buttons;

type
  T_frmCadastraEventoPedido = class(TForm)
    _grPedidoSemEvento: TGroupBox;
    BitBtn1: TBitBtn;
    _cdsPedidoSemEventos: TClientDataSet;
    _dsPedidoSemEventos: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCadastraEventoPedido: T_frmCadastraEventoPedido;

implementation

uses uAuxiliarCompras, uSistemaCompras, uRotinasGenericas;

{$R *.dfm}

procedure T_frmCadastraEventoPedido.BitBtn1Click(Sender: TObject);
begin
  _cdsPedidoSemEventos:=CarregaPedidoSemEventos;
  _dsPedidoSemEventos.DataSet:=_cdsPedidoSemEventos;
  if _cdsPedidoSemEventos<>nil then
      _cdsPedidoSemEventos.open;
end;

procedure T_frmCadastraEventoPedido.BitBtn2Click(Sender: TObject);
var
   DaDosPedido:TDadosValoresPedido;
   cdEvento:Integer;
   msg:String;
begin
   if _cdsPedidoSemEventos.Active then
   begin
     _cdsPedidoSemEventos.First;


     while not _cdsPedidoSemEventos.Eof do
     begin
       DaDosPedido:=GetValoresPedido(_cdsPedidoSemEventos.FieldByName('NROP_P').AsInteger,false);
     if DadosPedido.idStatusPedido='N' then
      begin
        msg:='Pedido Gerado... usuario -->'+nmlogin;
        cdEvento:= 15;
     end;

       if  InsereEventoPedidoCompra(DaDosPedido.nrPedido,
                                 DaDosPedido.dtPedido,
                                 STRTODATE('01/01/2039'),
                                 DaDosPedido.nrCompradorPedido,
                                 0,
                                 DadosPedido.nrFornecedor,
                                 DadosPedido.vtPrecoFornecedorPedido,
                                 DadosPedido.nrItensPedido,
                                 DadosPedido.nrTotalUnidadesPedido,
                                 DadosPedido.idStatusPedido[1],
                                 DaDosPedido.dtPedido,
                                 nmLogin,
                                 DadosPedido.cdEmpresa) then
        GravaEventoLogPedidoCompra(0,
                                     DadosPedido.nrPedido,
                                     DadosPedido.dtPedido,
                                     0,
                                     0,
                                     cdEvento,
                                     msg,
                                     dtSistema,
                                     nmLogin,
                                     DaDosPedido.cdEmpresa);


       _cdsPedidoSemEventos.Next;
     end;
   end;
end;

end.
