unit uCancelaPedidoSuspenso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, DB, DBClient, Buttons,
  uAuxiliarCompras, uSistemaCompras;

type
  T_frmCancelaPedidoSuspensos = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    _dbgItemPedido: TDBGrid;
    _dbgCapapedido: TDBGrid;
    _cdsPedidoSuspenso: TClientDataSet;
    _dsPedidoSuspenso: TDataSource;
    BitBtn1: TBitBtn;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _dsPedidoSuspensoDataChange(Sender: TObject; Field: TField);
    procedure _dbgCapapedidoDblClick(Sender: TObject);
  private
    procedure setgridCapa;
    procedure CarregaPedidoSuspensos;
    procedure setgridItemPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCancelaPedidoSuspensos: T_frmCancelaPedidoSuspensos;
  nrLaboratorioCancelaPedido:Integer;

implementation

{$R *.dfm}

procedure T_frmCancelaPedidoSuspensos.BitBtn1Click(Sender: TObject);
begin  close;
end;

procedure T_frmCancelaPedidoSuspensos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if _cdsPedidoSuspenso=nil then
      Action:=cafree;
end;

procedure T_frmCancelaPedidoSuspensos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
  DadosPedido :TDadosCapaPedido;
begin
  case key of
    VK_F5 :begin
              if _cdsPedidoSuspenso.Active then
              begin
              DadosPedido:=AbreCapaPedido(_cdsPedidoSuspenso.FieldByName('nrop_p').AsInteger,0,'');

              if DadosPedido.nrPedido=0 then
                 close;

              if DadosPedido.nrPedido>0  then
              begin
              AlteraStatusPedido(DadosPedido.nrPedido,0,true);
              CarregaPedidoSuspensos;
              end;
              {AtualizaCapaPedido(DadosPedido.nrPedido,
                                DadosPedido.cdPagamento,
                                DadosPedido.nrOPeradorLogistico,
                                'I','Pedido Suspenso Cancelado',
                                DadosPedido.DataPedido)}
             end;
    end;
  end;
end;

procedure T_frmCancelaPedidoSuspensos.FormShow(Sender: TObject);
begin
 CarregaPedidoSuspensos;
end;

procedure T_frmCancelaPedidoSuspensos.setgridCapa;
begin
  TIntegerField(_cdsPedidoSuspenso.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
  TIntegerField(_cdsPedidoSuspenso.FieldByName('NROP_P')).DisplayWidth:=6;

  TStringField(_cdsPedidoSuspenso.FieldByName('SITP_P')).DisplayLabel:='Status';
  TStringField(_cdsPedidoSuspenso.FieldByName('SITP_P')).DisplayWidth:=4;

  TStringField(_cdsPedidoSuspenso.FieldByName('NM_USUARIO')).DisplayLabel:='Usuario';
  TStringField(_cdsPedidoSuspenso.FieldByName('NM_USUARIO')).DisplayWidth:=20;

  TDateField(_cdsPedidoSuspenso.FieldByName('DATP_P')).DisplayLabel:='Dt.Pedido';
  TDateField(_cdsPedidoSuspenso.FieldByName('DATP_P')).DisplayWidth:=10;

  TIntegerField(_cdsPedidoSuspenso.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
  TIntegerField(_cdsPedidoSuspenso.FieldByName('NR_ITENS')).DisplayWidth:=6;

  TIntegerField(_cdsPedidoSuspenso.FieldByName('TOTAL_UNIDADES')).DisplayLabel:='Nr.Unid';
  TIntegerField(_cdsPedidoSuspenso.FieldByName('TOTAL_UNIDADES')).DisplayWidth:=6;

  TFloatField(_cdsPedidoSuspenso.FieldByName('VL_PCO_FABRICA')).DisplayLabel:='Vlr.P?o. Fornec';
  TFloatField(_cdsPedidoSuspenso.FieldByName('VL_PCO_FABRICA')).DisplayWidth:=12;
  TFloatField(_cdsPedidoSuspenso.FieldByName('VL_PCO_FABRICA')).DisplayFormat:='###,###,##0.00';

  TFloatField(_cdsPedidoSuspenso.FieldByName('VL_PCO_CUSTO')).DisplayLabel:='Vlr.P?o. Custo';
  TFloatField(_cdsPedidoSuspenso.FieldByName('VL_PCO_CUSTO')).DisplayWidth:=12;
  TFloatField(_cdsPedidoSuspenso.FieldByName('VL_PCO_CUSTO')).DisplayFormat:='###,###,##0.00';

  TIntegerField(_cdsPedidoSuspenso.FieldByName('CD_EMPRESA')).DisplayLabel:='Empresa';
  TIntegerField(_cdsPedidoSuspenso.FieldByName('CD_EMPRESA')).DisplayWidth:=6;

end;

procedure T_frmCancelaPedidoSuspensos._dbgCapapedidoDblClick(Sender: TObject);
begin
  _cdsItemPedido:=DadosItemPedidoSuspenso(_cdsPedidoSuspenso.FieldByName('NROP_P').AsInteger,
                                          _cdsPedidoSuspenso.FieldByName('CD_EMPRESA').AsInteger);
   _dsItemPedido.DataSet:=_frmCancelaPedidoSuspensos._cdsItemPedido;
   if _cdsItemPedido<>NIL then
   begin
    _cdsItemPedido.Open;
    setgridItemPedido;
   end;

end;

procedure T_frmCancelaPedidoSuspensos._dsPedidoSuspensoDataChange(
  Sender: TObject; Field: TField);
begin

  // //_cdsItemPedido:=DadosItemPedidoSuspenso(_cdsPedidoSuspenso.FieldByName('NROP_P').AsInteger,
     //                                      _cdsPedidoSuspenso.FieldByName('CD_EMPRESA').AsInteger);
  // _dsItemPedido.DataSet:=_frmCancelaPedidoSuspensos._cdsItemPedido;
 //  if _cdsItemPedido<>NIL then
 //  begin
  //   _cdsItemPedido.Open;
  //   setgridItemPedido;
 //  end;

end;

procedure T_frmCancelaPedidoSuspensos.CarregaPedidoSuspensos;
begin
    _cdsPedidoSuspenso:=VerificaPedido('S',nrLaboratorioCancelaPedido);
     if _cdsItemPedido<>nil then
     begin
     _dsPedidoSuspenso.DataSet:=_frmCancelaPedidoSuspensos._cdsPedidoSuspenso;
     _cdsPedidoSuspenso.Open;
     end;
     if _cdsPedidoSuspenso<>nil then
     begin
      _cdsPedidoSuspenso.Open;
      setgridCapa;
     end
     else
      close;
end;

procedure T_frmCancelaPedidoSuspensos.setgridItemPedido;
begin
  TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Item';
  TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayWidth:=6;

  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=20;

  TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayLabel:='Qtd.Ped.';
  TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayWidth:=6;

  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayLabel:='% Padr?o';
  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayWidth:=6;

  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayLabel:='% Adic.';
  TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayWidth:=6;

  TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
  TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayWidth:=6;

  TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayLabel:='% Verba';
  TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayWidth:=6;

end;


end.
