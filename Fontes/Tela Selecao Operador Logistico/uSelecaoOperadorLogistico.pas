unit uSelecaoOperadorLogistico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, uRotinasGenericas,
  SqlExpr,DBGrids,DB,dBClient, Grids, StdCtrls;

type
  TAuxDBGrid = class(TDBGrid);
  T_frmSelecaoOPeradorLogistico = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _dbgOperadorLogistico: TDBGrid;
    _dsOperadorLogistico: TDataSource;
    _cdsOperadorLogistico: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure _dbgOperadorLogisticoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgOperadorLogisticoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgOperadorLogisticoDblClick(Sender: TObject);
  private
    { Private declarations }
   function GetOPeracaoLogistica(nrFornecedor: Integer): TClientDataSet;
    procedure SetGridOperadorLogistico;
  public
    { Public declarations }
  end;

var
  _frmSelecaoOPeradorLogistico: T_frmSelecaoOPeradorLogistico;
  cdOPeradorLogisticoSelecao,
  nrFornecedorLogisticoSelecao :Integer;

implementation

uses uDm;

{$R *.dfm}


procedure T_frmSelecaoOPeradorLogistico._dbgOperadorLogisticoDblClick(
  Sender: TObject);
begin
   cdOPeradorLogisticoSelecao:=_cdsOperadorLogistico.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger;
   close;
end;

procedure T_frmSelecaoOPeradorLogistico._dbgOperadorLogisticoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(_cdsOperadorLogistico.RecNo) then
  begin
    _dbgOperadorLogistico.Canvas.Font.Color := clBlack;
    _dbgOperadorLogistico.Canvas.Brush.Color := clSkyBlue;
  end
  else
  begin
    _dbgOperadorLogistico.Canvas.Font.Color := clBlack;
    _dbgOperadorLogistico.Canvas.Brush.Color := clWhite;
  end;
   if ((TAuxDBGrid(_dbgOperadorLogistico).DataLink.ActiveRecord + 1 =
    TAuxDBGrid(_dbgOperadorLogistico).Row) or (gdSelected in State)) then
    begin
    _dbgOperadorLogistico.Canvas.Brush.Color := clGreen;
    _dbgOperadorLogistico.Canvas.Font.Color := clWHITE;
    end;
    _dbgOperadorLogistico.Canvas.fillRect(rect);
    _dbgOperadorLogistico.defaultDrawColumncell(rect,Datacol,column,state);
end;

procedure T_frmSelecaoOPeradorLogistico._dbgOperadorLogisticoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN :begin
                cdOPeradorLogisticoSelecao:=_cdsOperadorLogistico.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger;
                close;
               end;
  end;
end;

procedure T_frmSelecaoOPeradorLogistico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmSelecaoOPeradorLogistico.FormShow(Sender: TObject);
begin
  _cdsOperadorLogistico:= GetOPeracaoLogistica(nrFornecedorLogisticoSelecao);
  SetGridOperadorLogistico;
end;

function T_frmSelecaoOPeradorLogistico.GetOPeracaoLogistica(nrFornecedor:Integer):TClientDataSet;
var
    QryTemp :TSQLQuery;
   _cdsTemp:TclientDataSet;

begin
 try
   TestaConexaoBase(_dm._conexao,nrBase);
   QryTemp:=TSQLQuery.Create(nil);
   QryTemp.SQLConnection:=_dm._conexao;
   _cdsTemp:=TClientDataSet.Create(nil);
   _cdsTemp.RemoteServer:=_dm._LocalConexao;
   _cdsTemp.ProviderName:= '_dspGenerica';
   QryTemp.SQLConnection:=_dm._conexao;
   _dsOperadorLogistico.DataSet:=_cdsTemp;
   with QryTemp do
   begin
    sql.Add('SELECT CD_FORNECEDOR,OL.CD_OPERADOR_LOGISTICO as CD_OPERADOR_LOGISTICO,');
    sql.Add('DS_OPERADOR_LOGISTICO,ID_VENDA_EXCLUSIVA,ID_REGISTRA_VENDA_OL,');
    sql.Add('ID_REPOSICAO_ESTOQUE');
    sql.Add('FROM');
    sql.Add('PRDDM.DC_OL_FORNECEDOR OL_FOR,');
    sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
    sql.Add('WHERE');
    sql.Add('OL_FOR.CD_OPERADOR=OL.CD_OPERADOR_LOGISTICO');
    sql.Add('AND ID_SITUACAO=''A''');
    sql.Add('AND CD_FORNECEDOR=:PnrFornecedor');
    sql.Add('UNION ALL');
    sql.Add('SELECT 1,OL.CD_OPERADOR_LOGISTICO,DS_OPERADOR_LOGISTICO,');
    sql.Add('''N'',''N'',''S''');
    sql.Add('FROM');
    sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
    sql.Add('WHERE');
    sql.Add('OL.CD_OPERADOR_LOGISTICO=1');
    sql.Add('ORDER BY CD_FORNECEDOR');
    ParamByName('PnrFornecedor').AsInteger:=nrFornecedor;
   end;
   with _cdsTemp do
   begin
     close;
     CommandText:=QryTemp.Text;
     Params.ParamByName('PnrFornecedor').AsInteger:=nrFornecedor;
     open;
   end;
   Result:=nil;
   if not _cdsTemp.IsEmpty then
     Result:=_cdsTemp

 finally
   FreeAndNil(QryTemp);
 end;
end;

Procedure T_frmSelecaoOPeradorLogistico.SetGridOperadorLogistico;
begin
   TIntegerField(_cdsOperadorLogistico.FieldByName('CD_FORNECEDOR')).Visible:=false;

   TIntegerField(_cdsOperadorLogistico.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayLabel:='Nr.Operador';
   TIntegerField(_cdsOperadorLogistico.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayWidth:=11;

   TStringField(_cdsOperadorLogistico.FieldByName('DS_OPERADOR_LOGISTICO')).DisplayLabel:='Nome Operação';
   TStringField(_cdsOperadorLogistico.FieldByName('DS_OPERADOR_LOGISTICO')).DisplayWidth:=35;

   TStringField(_cdsOperadorLogistico.FieldByName('ID_VENDA_EXCLUSIVA')).DisplayLabel:='Venda Exclusiva';
   TStringField(_cdsOperadorLogistico.FieldByName('ID_VENDA_EXCLUSIVA')).DisplayWidth:=15;

   TStringField(_cdsOperadorLogistico.FieldByName('ID_REGISTRA_VENDA_OL')).DisplayLabel:='Registra Venda';
   TStringField(_cdsOperadorLogistico.FieldByName('ID_REGISTRA_VENDA_OL')).DisplayWidth:=15;

   TStringField(_cdsOperadorLogistico.FieldByName('ID_REPOSICAO_ESTOQUE')).DisplayLabel:='Repoem Estoque';
   TStringField(_cdsOperadorLogistico.FieldByName('ID_REPOSICAO_ESTOQUE')).DisplayWidth:=15;

end;

end.
