unit uCriticaPedidoNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FMTBcd, DB, SqlExpr, StdCtrls, ExtCtrls, Grids,
  DBGrids, DBClient, Provider, uDm;

type
  T_frmNfeCriticaPedidoNfe = class(TForm)
    StatusBar1: TStatusBar;
    RGroupStatusCritica: TRadioGroup;
    SQLRelacaoCritica: TSQLQuery;
    DSPRelacaoCritica: TDataSetProvider;
    CDSRelacaoCritica: TClientDataSet;
    DSRelacaoCritica: TDataSource;
    SQLMudaStatusCritica: TSQLQuery;
    GroupBox1: TGroupBox;
    DbGridRelacaoCritica: TDBGrid;
    SQLRelacaoCriticaCD_FABRICANTE: TFMTBCDField;
    SQLRelacaoCriticaSQ_ORDEM: TFMTBCDField;
    SQLRelacaoCriticaNOMP_P: TWideStringField;
    SQLRelacaoCriticaNR_PEDIDO_GAM: TFMTBCDField;
    SQLRelacaoCriticaDT_CRITICA: TSQLTimeStampField;
    SQLRelacaoCriticaDS_NFE_CHAVE: TWideStringField;
    SQLRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField;
    SQLRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    SQLRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TWideStringField;
    SQLRelacaoCriticaNM_COMPRADOR_REDUZIDO: TWideStringField;
    CDSRelacaoCriticaSQ_ORDEM: TFMTBCDField;
    CDSRelacaoCriticaCD_FABRICANTE: TFMTBCDField;
    CDSRelacaoCriticaNOMP_P: TWideStringField;
    CDSRelacaoCriticaNR_PEDIDO_GAM: TFMTBCDField;
    CDSRelacaoCriticaDT_CRITICA: TSQLTimeStampField;
    CDSRelacaoCriticaDS_NFE_CHAVE: TWideStringField;
    CDSRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField;
    CDSRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    CDSRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TWideStringField;
    CDSRelacaoCriticaNM_COMPRADOR_REDUZIDO: TWideStringField;
    SQLRelacaoCriticaID_CD: TWideStringField;
    CDSRelacaoCriticaID_CD: TWideStringField;
    SQLRelacaoCriticaID_RETORNO_FORNECEDOR: TWideStringField;
    CDSRelacaoCriticaID_RETORNO_FORNECEDOR: TWideStringField;
    SQLRelacaoCriticaDS_RETORNO_FORNEC: TWideStringField;
    CDSRelacaoCriticaDS_RETORNO_FORNEC: TWideStringField;
    SQLRelacaoCriticaNR_NFE: TFMTBCDField;
    CDSRelacaoCriticaNR_NFE: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGroupStatusCriticaClick(Sender: TObject);
    procedure DbGridRelacaoCriticaKeyPress(Sender: TObject; var Key: Char);
    procedure DbGridRelacaoCriticaTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure setGridRelacaodeCritica;
    function isStatusNFeFaturada(dsChave: string): Boolean;
    procedure verificarNFeFaturada;
    procedure inativarCritica(nrCritica: integer);
    { Private declarations }
  public
    { Public declarations }
    STATUS_CRITICA : string;
    procedure AtualizaRelacaoCritica;
    procedure MudaStatusCritica(statusCritica:string);
  end;

var
  _frmNfeCriticaPedidoNfe: T_frmNfeCriticaPedidoNfe;
  IS_MOSTRAR_AVISO_ENTRADA : Boolean;

implementation

uses  URotinasGenericas, uVisualizaCriticaPedidoNFe;

{$R *.dfm}

procedure T_frmNfeCriticaPedidoNfe.MudaStatusCritica(statusCritica:string);
var
  sql : string;
begin
  if STATUS_CRITICA = '1' then
  begin
    sql:='UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET cd_compra_situacao_critica = 2 WHERE SQ_ORDEM = :ORDEM ';
    SQLMudaStatusCritica.Close;
    SQLMudaStatusCritica.SQL.Clear;
    SQLMudaStatusCritica.SQL.Text:=sql;
    SQLMudaStatusCritica.ParamByName('ORDEM').AsString:=CDSRelacaoCriticaSQ_ORDEM.AsString;
    SQLMudaStatusCritica.ExecSQL();
  end;
end;

procedure T_frmNfeCriticaPedidoNfe.AtualizaRelacaoCritica;
begin
  case RGroupStatusCritica.ItemIndex of
    0 : STATUS_CRITICA:='1';
    1 : STATUS_CRITICA:='2';
    2 : STATUS_CRITICA:='3';
    3 : STATUS_CRITICA:='4';
    4 : STATUS_CRITICA:='5';
  end;

  CDSRelacaoCritica.Close;
  CDSRelacaoCritica.Params[0].AsInteger:=nrCompradorSistema ;
  CDSRelacaoCritica.Params[1].AsString:=STATUS_CRITICA;
  CDSRelacaoCritica.Open;
  setGridRelacaodeCritica;

  if ((STATUS_CRITICA='2') and (not CDSRelacaoCritica.IsEmpty)) then
  begin
    if IS_MOSTRAR_AVISO_ENTRADA then
      verificarNFeFaturada;
    IS_MOSTRAR_AVISO_ENTRADA:=False;
  end;

  StatusBar1.Panels[0].Text:='QUANTIDADE DE REGISTROS: ' + inttostr(CDSRelacaoCritica.RecordCount);
  Application.ProcessMessages;
  DbGridRelacaoCritica.SetFocus;
end;

procedure T_frmNfeCriticaPedidoNfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure T_frmNfeCriticaPedidoNfe.inativarCritica(nrCritica:integer);
var
  sqlDados: TSQLQuery;
  i: integer;

begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=_dm._conexao;
  try
    try
      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Add('UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET');
      sqlDados.SQL.Add('ds_observacao_solucionador = ''CRITICA INATIVADA - NAO TRATADA PELO COMPRADOR'',');
      sqlDados.SQL.Add('cd_compra_situacao_critica = 5,DT_LIBERACAO = SYSDATE ,NM_USUARIO = ''NFECLIENT'',ID_DESTINATARIO_MSG = 0');
      sqlDados.SQL.Add('WHERE SQ_ORDEM = :NR_CRITICA');
      sqlDados.ParamByName('NR_CRITICA').AsString:=inttostr(nrCritica);
      i:=sqlDados.ExecSQL;
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao inativar capa da critica. Detalhes: %s',[E.message])
    end;


    if i > 0 then
    begin
      try
        sqlDados.Close;
        sqlDados.SQL.Clear;
        sqlDados.SQL.Add('UPDATE PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA SET ');
        sqlDados.SQL.Add('CD_COMPRA_SOLUCAO_DIVERGENCIA = 1,CD_COMPRA_DIVERGENCIA = 7,NM_USUARIO = ''NFECLIENT'',DT_ATUALIZACAO = SYSDATE ');
        sqlDados.SQL.Add('WHERE SQ_ORDEM = :NR_CRITICA ');
        sqlDados.ParamByName('NR_CRITICA').AsString:=inttostr(nrCritica);
        sqlDados.ExecSQL;
      except
        on E:Exception do
          raise Exception.Createfmt('Erro ao inativar item da critica. Detalhes: %s',[E.message])
      end;
   end;
  finally
    sqlDados.Close;
    sqlDados.Free;
  end;

end;

function T_frmNfeCriticaPedidoNfe.isStatusNFeFaturada(dsChave:string):Boolean;
var
  sqlDados: TSQLQuery;
begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=_dm._conexaoSihst;
  result:=false;
  try
    try
      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Add('SELECT NR_NFE FROM PRDDM.V_DCNOT12');
      sqlDados.SQL.Add('WHERE TIPN_N = ''C'' AND DS_CHAVE_NFE = :DS_CHAVE_NFE');
      sqlDados.ParamByName('DS_CHAVE_NFE').AsString:=dsChave;
      sqlDados.Open;
      if not sqlDados.IsEmpty then
        Result:=true;
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao consultar status da NFe. Detalhes: %s',[E.message])
    end;
  finally
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure T_frmNfeCriticaPedidoNfe.verificarNFeFaturada;
begin
  if Application.MessageBox('Deseja inativar as criticas referentes as NFe que j? deram entrada?','Confirma??o',4 + 32) = 6 then
  begin
    while not CDSRelacaoCritica.Eof do
    begin
      if isStatusNFeFaturada(CDSRelacaoCriticaDS_NFE_CHAVE.AsString) then
        inativarCritica(CDSRelacaoCriticaSQ_ORDEM.AsInteger);

      CDSRelacaoCritica.Next;
    end;
  end;
end;

procedure T_frmNfeCriticaPedidoNfe.RGroupStatusCriticaClick(Sender: TObject);
begin
  AtualizaRelacaoCritica;
  //verificarNFeFaturada;
end;

procedure T_frmNfeCriticaPedidoNfe.DbGridRelacaoCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
                        if key = #13 then
  begin
    if CDSRelacaoCritica.RecordCount > 0 then
    begin
      try
        MudaStatusCritica(STATUS_CRITICA);

        NRO_CHAVE_NFE_FRM :=CDSRelacaoCriticaDS_NFE_CHAVE.AsString;
        if _frmVisualizaCriticaNFe  = nil then
          _frmVisualizaCriticaNFe:= T_frmVisualizaCriticaNFe.create(self);

        _frmVisualizaCriticaNFe.windowstate := wsnormal;
        _frmVisualizaCriticaNFe.bringtofront;
        if _frmVisualizaCriticaNFe.CanFocus then
          _frmVisualizaCriticaNFe.setfocus;
      except
        on E:Exception do
          raise Exception.Createfmt('OCORREU UM PROBLEMA AO MUDAR STATUS DA CRITICA',[E.Message]);
      end;
    end
    else
    begin
      Application.MessageBox('NENHUMA CR?TICA DISPON?VEL PARA ANALISE','ATEN??O',MB_ICONWARNING);
      exit;
    end;
  end;

  if key = #27 then
    close;
end;

procedure T_frmNfeCriticaPedidoNfe.DbGridRelacaoCriticaTitleClick(
  Column: TColumn);
begin
{  if Column.FieldName = 'NOMP_P' then
  begin
    CDSRelacaoCritica.IndexFieldNames:='NOMP_P';
    AtualizaRelacaoCritica;
  end;

  if Column.FieldName = 'SQ_ORDEM' then
  begin
    CDSRelacaoCritica.IndexFieldNames:='SQ_ORDEM';
    AtualizaRelacaoCritica;
  end;}
  GeraOrdenacao(CDSRelacaoCritica,Column);
//  AtualizaRelacaoCritica;
end;

procedure T_frmNfeCriticaPedidoNfe.FormActivate(Sender: TObject);
begin
  if RGroupStatusCritica.ItemIndex < 2 then
    AtualizaRelacaoCritica;
end;


procedure T_frmNfeCriticaPedidoNfe.setGridRelacaodeCritica;
begin

  TStringField(CDSRelacaoCritica.FieldByName('DS_NFE_CHAVE')).Visible:=false;
  TStringField(CDSRelacaoCritica.FieldByName('ID_RETORNO_FORNECEDOR')).Visible:=false;

  TStringField(CDSRelacaoCritica.FieldByName('DS_OBSERVACAO_COMPRADOR')).Visible:=false;
  TStringField(CDSRelacaoCritica.FieldByName('NM_COMPRADOR_REDUZIDO')).Visible:=false;

  TIntegerField(CDSRelacaoCritica.FieldByName('SQ_ORDEM')).DisplayLabel:='N?.Critica';
  TIntegerField(CDSRelacaoCritica.FieldByName('SQ_ORDEM')).DisplayWidth:=6;

  TIntegerField(CDSRelacaoCritica.FieldByName('CD_FABRICANTE')).DisplayLabel:='N?.Laborat.';
  TIntegerField(CDSRelacaoCritica.FieldByName('CD_FABRICANTE')).DisplayWidth:=6;

  TStringField(CDSRelacaoCritica.FieldByName('NOMP_P')).DisplayLabel:='Raz?o Social';
  TStringField(CDSRelacaoCritica.FieldByName('NOMP_P')).DisplayWidth:=50;

  TIntegerField(CDSRelacaoCritica.FieldByName('NR_NFE')).DisplayLabel:='N?.NFe';
  TIntegerField(CDSRelacaoCritica.FieldByName('NR_NFE')).DisplayWidth:=6;

  TIntegerField(CDSRelacaoCritica.FieldByName('NR_PEDIDO_GAM')).DisplayLabel:='N?.Pedido';
  TIntegerField(CDSRelacaoCritica.FieldByName('NR_PEDIDO_GAM')).DisplayWidth:=6;

  TStringField(CDSRelacaoCritica.FieldByName('DS_COMPRA_SITUACAO_DIVERGENCIA')).DisplayLabel:='Status';
  TStringField(CDSRelacaoCritica.FieldByName('DS_COMPRA_SITUACAO_DIVERGENCIA')).DisplayWidth:=20;

  TDateField(CDSRelacaoCritica.FieldByName('DT_CRITICA')).DisplayLabel:='Dt.Critica';
  TDateField(CDSRelacaoCritica.FieldByName('DT_CRITICA')).DisplayFormat:='dd/mm/yyyy';
  TDateField(CDSRelacaoCritica.FieldByName('DT_CRITICA')).DisplayWidth:=10;

  TDateField(CDSRelacaoCritica.FieldByName('DT_LIBERACAO')).DisplayLabel:='Dt.Libera??o';
  TDateField(CDSRelacaoCritica.FieldByName('DT_LIBERACAO')).DisplayFormat:='dd/mm/yyyy';
  TDateField(CDSRelacaoCritica.FieldByName('DT_LIBERACAO')).DisplayWidth:=10;

  TIntegerField(CDSRelacaoCritica.FieldByName('DS_RETORNO_FORNEC')).DisplayLabel:='Retorno Fornecedor';
  TIntegerField(CDSRelacaoCritica.FieldByName('DS_RETORNO_FORNEC')).DisplayWidth:=20;

end;
procedure T_frmNfeCriticaPedidoNfe.FormCreate(Sender: TObject);
begin
  IS_MOSTRAR_AVISO_ENTRADA:=True;
  setGridRelacaodeCritica;
end;

end.
