unit U_CriticaPedidoNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FMTBcd, DB, SqlExpr, StdCtrls, ExtCtrls, Grids,
  DBGrids, DBClient, Provider;

type
  T_frCriticaPedidoNfe = class(TForm)
    StatusBar1: TStatusBar;
    RGroupStatusCritica: TRadioGroup;
    SQLRelacaoCritica: TSQLQuery;
    DSPRelacaoCritica: TDataSetProvider;
    CDSRelacaoCritica: TClientDataSet;
    DSRelacaoCritica: TDataSource;
    SQLMudaStatusCritica: TSQLQuery;
    GroupBox1: TGroupBox;
    DbGridRelacaoCritica: TDBGrid;
    SQLRelacaoCriticaSQ_ORDEM: TBCDField;
    SQLRelacaoCriticaCD_FABRICANTE: TFMTBCDField;
    SQLRelacaoCriticaNOMP_P: TStringField;
    SQLRelacaoCriticaNR_NOTA_FISCAL: TBCDField;
    SQLRelacaoCriticaNR_PEDIDO_GAM: TBCDField;
    SQLRelacaoCriticaDT_CRITICA: TSQLTimeStampField;
    SQLRelacaoCriticaDS_NFE_CHAVE: TStringField;
    SQLRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField;
    SQLRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField;
    SQLRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TStringField;
    SQLRelacaoCriticaNM_COMPRADOR_REDUZIDO: TStringField;
    CDSRelacaoCriticaSQ_ORDEM: TBCDField;
    CDSRelacaoCriticaCD_FABRICANTE: TFMTBCDField;
    CDSRelacaoCriticaNOMP_P: TStringField;
    CDSRelacaoCriticaNR_NOTA_FISCAL: TBCDField;
    CDSRelacaoCriticaNR_PEDIDO_GAM: TBCDField;
    CDSRelacaoCriticaDT_CRITICA: TSQLTimeStampField;
    CDSRelacaoCriticaDS_NFE_CHAVE: TStringField;
    CDSRelacaoCriticaDT_LIBERACAO: TSQLTimeStampField;
    CDSRelacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField;
    CDSRelacaoCriticaDS_OBSERVACAO_COMPRADOR: TStringField;
    CDSRelacaoCriticaNM_COMPRADOR_REDUZIDO: TStringField;
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
  _frCriticaPedidoNfe: T_frCriticaPedidoNfe;

implementation

uses U_db, U_VisualizaCriticaPedidoNFe, URotinasGenericas;

{$R *.dfm}

procedure T_frCriticaPedidoNfe.MudaStatusCritica(statusCritica:string);
var
  sql : string;
begin
  if STATUS_CRITICA = '1' then
  begin
    sql:='UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET ID_SITUACAO_CRITICA = 2 WHERE SQ_ORDEM = :ORDEM ';
    SQLMudaStatusCritica.Close;
    SQLMudaStatusCritica.SQL.Clear;
    SQLMudaStatusCritica.SQL.Text:=sql;
    SQLMudaStatusCritica.ParamByName('ORDEM').AsString:=CDSRelacaoCriticaSQ_ORDEM.AsString;
    SQLMudaStatusCritica.ExecSQL();
  end;
end;

procedure T_frCriticaPedidoNfe.AtualizaRelacaoCritica;
begin
  case RGroupStatusCritica.ItemIndex of
    0 : STATUS_CRITICA:='1';
    1 : STATUS_CRITICA:='2';
    2 : STATUS_CRITICA:='3';
    3 : STATUS_CRITICA:='4';
    4 : STATUS_CRITICA:='5';
  end;

  CDSRelacaoCritica.Close;
  CDSRelacaoCritica.Params[0].AsBcd:=NrCpra ;
  CDSRelacaoCritica.Params[1].AsString:=STATUS_CRITICA;
  CDSRelacaoCritica.Open;
  setGridRelacaodeCritica;
  if STATUS_CRITICA='2' then
      verificarNFeFaturada;

  StatusBar1.SimpleText:='QUANTIDADE DE REGISTROS: ' + inttostr(CDSRelacaoCritica.RecordCount);
  Application.ProcessMessages;
  DbGridRelacaoCritica.SetFocus;
end;

procedure T_frCriticaPedidoNfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure T_frCriticaPedidoNfe.inativarCritica(nrCritica:integer);
var
  sqlDados: TSQLQuery;
  i: integer;

begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=DM_DB.Conexao_SIPROD;
  try
    try
      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Add('UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET');
      sqlDados.SQL.Add('DS_OBSERVACAO_COMPRADOR = ''CRITICA INATIVADA - NAO TRATADA PELO COMPRADOR'',');
      sqlDados.SQL.Add('ID_SITUACAO_CRITICA = 5,DT_LIBERACAO = SYSDATE ,NM_USUARIO = ''NFECLIENT'',ID_DESTINATARIO_MSG = 0');
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

function T_frCriticaPedidoNfe.isStatusNFeFaturada(dsChave:string):Boolean;
var
  sqlDados: TSQLQuery;
begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=DM_DB.Conexao_Sihst;
  result:=false;
  try
    try
      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Add('SELECT NR_NFE FROM PRDDM.V_DCNOT4');
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

procedure T_frCriticaPedidoNfe.verificarNFeFaturada;
begin
  if Application.MessageBox('Deseja inativar as criticas referentes as NFe que já deram entrada?','Confirmação',4 + 32) = 6 then
  begin
    while not CDSRelacaoCritica.Eof do
    begin
      if isStatusNFeFaturada(CDSRelacaoCriticaDS_NFE_CHAVE.AsString) then
        inativarCritica(CDSRelacaoCriticaSQ_ORDEM.AsInteger);

      CDSRelacaoCritica.Next;
    end;
  end;
end;

procedure T_frCriticaPedidoNfe.RGroupStatusCriticaClick(Sender: TObject);
begin
  AtualizaRelacaoCritica;
  //verificarNFeFaturada;
end;

procedure T_frCriticaPedidoNfe.DbGridRelacaoCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if CDSRelacaoCritica.RecordCount > 0 then
    begin
      try
        MudaStatusCritica(STATUS_CRITICA);
        if formexiste(_frVisualizaCriticaNFe) = false then
        begin
          _frVisualizaCriticaNFe:= t_frVisualizaCriticaNFe.create(self);
        end
        else
        begin
          _frVisualizaCriticaNFe.windowstate := wsnormal;
          _frVisualizaCriticaNFe.bringtofront;
          _frVisualizaCriticaNFe.setfocus;
        end;
      except
        ShowMessage('OCORREU UM PROBLEMA AO MUDAR STATUS DA CRITICA');
      end;
    end
    else
    begin
      Application.MessageBox('NENHUMA CRÍTICA DISPONÍVEL PARA ANALISE','ATENÇÃO',MB_ICONWARNING);
      exit;
    end;
  end;

  if key = #27 then
    close;
end;

procedure T_frCriticaPedidoNfe.DbGridRelacaoCriticaTitleClick(
  Column: TColumn);
begin
  if Column.FieldName = 'NOMP_P' then
  begin
    CDSRelacaoCritica.IndexFieldNames:='NOMP_P';
    AtualizaRelacaoCritica;
  end;

  if Column.FieldName = 'SQ_ORDEM' then
  begin
    CDSRelacaoCritica.IndexFieldNames:='SQ_ORDEM';
    AtualizaRelacaoCritica;
  end;
end;

procedure T_frCriticaPedidoNfe.FormActivate(Sender: TObject);
begin
  if RGroupStatusCritica.ItemIndex < 2 then
    AtualizaRelacaoCritica;
end;


procedure T_frCriticaPedidoNfe.setGridRelacaodeCritica;
begin

  TStringField(CDSRelacaoCritica.FieldByName('DS_NFE_CHAVE')).Visible:=false;
  TStringField(CDSRelacaoCritica.FieldByName('DS_OBSERVACAO_COMPRADOR')).Visible:=false;
  TStringField(CDSRelacaoCritica.FieldByName('NM_COMPRADOR_REDUZIDO')).Visible:=false;

  TIntegerField(CDSRelacaoCritica.FieldByName('SQ_ORDEM')).DisplayLabel:='Nº.Critica';
  TIntegerField(CDSRelacaoCritica.FieldByName('SQ_ORDEM')).DisplayWidth:=6;

  TIntegerField(CDSRelacaoCritica.FieldByName('CD_FABRICANTE')).DisplayLabel:='Nº.Laborat.';
  TIntegerField(CDSRelacaoCritica.FieldByName('CD_FABRICANTE')).DisplayWidth:=6;

  TStringField(CDSRelacaoCritica.FieldByName('NOMP_P')).DisplayLabel:='Razão Social';
  TStringField(CDSRelacaoCritica.FieldByName('NOMP_P')).DisplayWidth:=50;

  TIntegerField(CDSRelacaoCritica.FieldByName('NR_NOTA_FISCAL')).DisplayLabel:='Nº.NFe';
  TIntegerField(CDSRelacaoCritica.FieldByName('NR_NOTA_FISCAL')).DisplayWidth:=6;

  TIntegerField(CDSRelacaoCritica.FieldByName('NR_PEDIDO_GAM')).DisplayLabel:='Nº.Pedido';
  TIntegerField(CDSRelacaoCritica.FieldByName('NR_PEDIDO_GAM')).DisplayWidth:=6;

  TStringField(CDSRelacaoCritica.FieldByName('DS_COMPRA_SITUACAO_DIVERGENCIA')).DisplayLabel:='Status';
  TStringField(CDSRelacaoCritica.FieldByName('DS_COMPRA_SITUACAO_DIVERGENCIA')).DisplayWidth:=20;

  TDateField(CDSRelacaoCritica.FieldByName('DT_CRITICA')).DisplayLabel:='Dt.Critica';
  TDateField(CDSRelacaoCritica.FieldByName('DT_CRITICA')).DisplayFormat:='dd/mm/yyyy';
  TDateField(CDSRelacaoCritica.FieldByName('DT_CRITICA')).DisplayWidth:=10;

  TDateField(CDSRelacaoCritica.FieldByName('DT_LIBERACAO')).DisplayLabel:='Dt.Liberação';
  TDateField(CDSRelacaoCritica.FieldByName('DT_LIBERACAO')).DisplayFormat:='dd/mm/yyyy';
  TDateField(CDSRelacaoCritica.FieldByName('DT_LIBERACAO')).DisplayWidth:=10;


end;
procedure T_frCriticaPedidoNfe.FormCreate(Sender: TObject);
begin
setGridRelacaodeCritica;
end;

end.
