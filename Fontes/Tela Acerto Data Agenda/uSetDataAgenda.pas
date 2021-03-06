unit uSetDataAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaPadrao, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls, uDm, uRotinasGenericas, SqlExpr, uAuxiliarCompras, ExtCtrls;

type
  T_frmAcertaDataAgenda = class(T_frmPadrao)
    dsDadosFornecedor: TDataSource;
    _cdsDadosFornecedor: TClientDataSet;
    _lbeNumeroComprador: TLabeledEdit;
    procedure _btnExecutaClick(Sender: TObject);
    procedure _btnParaExcelClick(Sender: TObject);
  private
    function GetDadosFornecedor(nrComprador: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmAcertaDataAgenda: T_frmAcertaDataAgenda;

implementation

{$R *.dfm}


function T_frmAcertaDataAgenda.GetDadosFornecedor(nrComprador:Integer):Boolean;
var
  QryTemp: TSQLQuery;
  i :Integer;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;

    with  QryTemp DO
    begin
     close;
     SQL.Clear;
     sql.Add('SELECT DISTINCT GRUPO_FORNECEDOR.CD_FABRICANTE,');
     sql.Add('COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR, DT_AGENDAMENTO,DT_PROXIMO_PEDIDO,dagl_l,DPRL_L');
     sql.Add('FROM');
     sql.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     sql.Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     if nrBase=1 then
       sql.Add('PRDDM.DCLAB');
     if nrBase=2 then
       sql.Add('PRDDM.DCLAB@RAC');
     sql.Add('WHERE');
     sql.Add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     sql.Add('AND COMPRA_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     sql.Add('AND nrol_l=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     sql.Add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
    end;
    with _cdsDadosFornecedor do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PnrComprador').AsInteger:=nrComprador;
      open;
    end;
  finally
    FreeAndNil(QryTemp);
  end;

end;
procedure T_frmAcertaDataAgenda._btnExecutaClick(Sender: TObject);
begin
  inherited;
   GetDadosFornecedor(StrToIntDef(_lbeNumeroComprador.Text,0));
  end;
procedure T_frmAcertaDataAgenda._btnParaExcelClick(Sender: TObject);
begin
  inherited;
  _cdsDadosFornecedor.First;
  while not _cdsDadosFornecedor.Eof do
  begin
      SetDataAgenda(_cdsDadosFornecedor.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger,
                    _cdsDadosFornecedor.FieldByName('DAGL_L').AsDateTime,
                    _cdsDadosFornecedor.FieldByName('DPRL_L').AsDateTime);
     _cdsDadosFornecedor.Next;

end;

end;

end.
