unit uAtivarPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,uAuxiliarCompras, DB, DBClient, Buttons, Grids,
  DBGrids,sqlExpr, uDm ;

type
  T_frmAtivaPedido = class(TForm)
    StatusBar1: TStatusBar;
    _edtNumeroPedido: TEdit;
    Label1: TLabel;
    _cdsTabelaLeadTime: TClientDataSet;
    _btnAtivaPedido: TBitBtn;
    GroupBox1: TGroupBox;
    _dbgPedido: TDBGrid;
    _cdsLogPedido: TClientDataSet;
    _dsLogPedido: TDataSource;
    _edtSituacao: TEdit;
    _edtTotalPedido: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure _edtNumeroPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnAtivaPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    nrpedido:Integer;
    function SetLeadTime(PnrEmpresa: Integer; PidTermoLabil: String): Double;
    procedure AtivaPedido;
    function AbreLogPedido(PnrPedido: Integer): boolean;
    procedure setGridLog;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmAtivaPedido: T_frmAtivaPedido;
   DadosPedidoAbertuta: TDadosValoresPedido;
   nrLeadTime  :Integer;


implementation

uses uRotinasGenericas;


{$R *.dfm}

procedure T_frmAtivaPedido._btnAtivaPedidoClick(Sender: TObject);
begin
 AtivaPedido;
end;

procedure T_frmAtivaPedido._edtNumeroPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  idStatus:Char;
begin
  case key of
      VK_RETURN :begin
                  nrpedido:=StrToIntDef(_edtNumeroPedido.Text, 0);
                  if nrpedido>0 then
                  begin
                     AbreLogPedido(nrpedido);
                     DadosPedidoAbertuta := GetValoresPedido(nrpedido,true);
                     if DadosPedidoAbertuta<>nil then
                     begin
                         idStatus:=DadosPedidoAbertuta.idStatusPedido[1];
                         if idStatus='C' then
                            _edtSituacao.Text:='Cancelado';
                         if idStatus='I' then
                            _edtSituacao.Text:='Inativado';
                         if idStatus='S' then
                            _edtSituacao.Text:='Suspenso';

                         _edtTotalPedido.Text:=FormatFloat('###,###,##0.00',DadosPedidoAbertuta.vtPrecoFornecedorPedido);

                       _btnAtivaPedido.Enabled:=false;
                       if idStatus in ['C','I','S'] then
                         _btnAtivaPedido.Enabled:=true;
                     end;

                  end;
                   //AtivaPedido;
      end;
  end;
end;


procedure T_frmAtivaPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmAtivaPedido.FormCreate(Sender: TObject);
begin
 _btnAtivaPedido.Enabled:=false;
end;

function T_frmAtivaPedido.SetLeadTime(PnrEmpresa: Integer;
                                      PidTermoLabil: String): Double;
begin
  with _cdsTabelaLeadTime do
  begin
    filtered := false;
    filter := 'CD_EMPRESA=' + inttostr(PnrEmpresa) + ' AND ID_TERMOLABIL=' +
      QuotedStr(PidTermoLabil);
    filtered := true;
  end;
  result := 0;
  if not _cdsTabelaLeadTime.isEmpty then
    result := _cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME')
      .AsInteger;
end;


procedure T_frmAtivaPedido.AtivaPedido;
begin
                     if trim(_edtNumeroPedido.Text)<>'' then
                    begin
                     DadosPedidoAbertuta := GetValoresPedido(StrToIntDef(_edtNumeroPedido.Text, 0),true);

                      _cdsTabelaLeadTime := TabelaLeadTimeTermolabil(DadosPedidoAbertuta.nrFornecedor);
                      if _cdsTabelaLeadTime<>nil then
                         nrLeadTime := StrToIntDef(formatfloat('#######0',SetLeadTime(DadosPedidoAbertuta.cdEmpresa, 'N')),0);

                     if (DadosPedidoAbertuta.idStatusPedido='N') then
                     begin
                      Mensagem('Pedido J? esta ativo!!!',MB_ICONWARNING);
                      exit;
                     end;


                     if (DadosPedidoAbertuta.idStatusPedido='C') or
                       (DadosPedidoAbertuta.idStatusPedido='S') or
                         (DadosPedidoAbertuta.idStatusPedido='I') then
                     begin
                       if Confirma('Deseja Realmente Ativar Pedido',MB_DEFBUTTON1)=idYes then
                       begin
                               EliminaItemQuantidadeZerada(NrPedido);
                           if AtivaCapaPedido(DadosPedidoAbertuta.nrPedido,DadosPedidoAbertuta.nrOperadorLogistico,nrLeadTime,'N',DadosPedidoAbertuta.idPedidoBonificado,DadosPedidoAbertuta.nrVerba) then
                             if  AtivarItemPedido(DadosPedidoAbertuta.nrPedido,0,DadosPedidoAbertuta.cdEmpresa,'N',nmLogin) then
                             begin
                                 Mensagem('Pedido Ativado!!!',MB_ICONWARNING);
                                 close;
                             end
                             else
                                 Mensagem('Pedido N?o Ativado!!!',MB_ICONWARNING);


                       end;

                     end;
                    end;

end;



function T_frmAtivaPedido.AbreLogPedido(PnrPedido:Integer):boolean;
var
  stQry : TStringList;

begin
  try
    stQry :=nil;
    stQry := TStringList.Create;
    with stQry  do
    begin
     Clear;
     Add('SELECT dt_atualizacao,ds_observacao');
     Add('FROM GAMNFE.DC_EVT_LOG_COMPRA');
     Add('WHERE cd_pedido=:PnrPedido');
     Add('ORDER BY sq_evt_log_compra');
    end;
    with _cdsLogPedido do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrPedido').AsBcd:=PnrPedido;
      open;
      setGridLog;
    end;


  finally
    FreeAndNil(stQry);
  end;

end;

procedure T_frmAtivaPedido.setGridLog;
begin
 TDateField(_cdsLogPedido.FieldByName('dt_atualizacao')).DisplayLabel:='Dt.Evento';
 TDateField(_cdsLogPedido.FieldByName('dt_atualizacao')).DisplayWidth:=20;

 TDateField(_cdsLogPedido.FieldByName('ds_observacao')).DisplayLabel:='Observa??o';
 TDateField(_cdsLogPedido.FieldByName('ds_observacao')).DisplayWidth:=80;


end;

end.
