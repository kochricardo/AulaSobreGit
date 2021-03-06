unit uVisualizaCriticaPedidoNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls, Grids,
  DBGrids, DBCtrls, ComCtrls, ExtCtrls,IdSMTP,IdMessage, uDm, SimpleDS;

type
  TComprador = record
    codigo: integer;
    nome : string;
  end;

  T_frmVisualizaCriticaNFe = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    dbmmDsCritica: TDBMemo;
    dbMemoMotivocritica: TDBMemo;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btSalvar: TButton;
    cbSituacaoCritica: TComboBox;
    mmObsComprador: TMemo;
    btFechar: TButton;
    SQLItemCritica: TSQLQuery;
    DSPItemCritica: TDataSetProvider;
    CDSItemCritica: TClientDataSet;
    DSItemCritica: TDataSource;
    SQLSolucaoCritica: TSQLQuery;
    DSPSolucaoCritica: TDataSetProvider;
    CDSSolucaoCritica: TClientDataSet;
    DSSolucao: TDataSource;
    SQLSituacaoCritica: TSQLQuery;
    DSPSituacaoCritica: TDataSetProvider;
    CDSSituacaoCritica: TClientDataSet;
    DSSituacaoCritica: TDataSource;
    SQLGenenicaSIPROD: TSQLQuery;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    edPedidoCompra: TEdit;
    Label2: TLabel;
    cbSolucaoCritica: TComboBox;
    SQLStatusItemDivergencia: TSQLQuery;
    DSPStatusItemDivergencia: TDataSetProvider;
    CDSStatusItemDivergencia: TClientDataSet;
    rgEnviaMSG: TRadioGroup;
    GroupBox5: TGroupBox;
    lbCodProduto: TLabel;
    edCodProduto: TEdit;
    btBuscaPedido: TButton;
    SQLBuscaPedido: TSQLQuery;
    DSPBuscaPedido: TDataSetProvider;
    CDSBuscaPedido: TClientDataSet;
    DSBuscaPedido: TDataSource;
    DBGridBuscaPedido: TDBGrid;
    GroupBox6: TGroupBox;
    Button1: TButton;
    GroupBox7: TGroupBox;
    edNovoPedidoCompra: TEdit;
    lbNovoPedido: TLabel;
    btAlterarDadosCritica: TButton;
    CheckBoxAlteraPedido: TCheckBox;
    DBGridListaCritica: TDBGrid;
    SQLItemCriticaSQ_ORDEM: TFMTBCDField;
    SQLItemCriticaNR_ITEM_ORDEM: TFMTBCDField;
    SQLItemCriticaDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQLItemCriticaDS_OBSERVACAO_SISTEMA: TWideStringField;
    SQLItemCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    SQLItemCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField;
    SQLItemCriticaDS_REFERENCIA_ITEM_NF: TWideStringField;
    SQLItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField;
    SQLItemCriticaID_SITUACAO: TWideStringField;
    CDSItemCriticaSQ_ORDEM: TFMTBCDField;
    CDSItemCriticaNR_ITEM_ORDEM: TFMTBCDField;
    CDSItemCriticaDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDSItemCriticaDS_OBSERVACAO_SISTEMA: TWideStringField;
    CDSItemCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    CDSItemCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField;
    CDSItemCriticaDS_REFERENCIA_ITEM_NF: TWideStringField;
    CDSItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField;
    CDSItemCriticaID_SITUACAO: TWideStringField;
    SQLBuscaPedidoNROP_P: TFMTBCDField;
    SQLBuscaPedidoSITP_P: TWideStringField;
    SQLBuscaPedidoDATA: TSQLTimeStampField;
    CDSBuscaPedidoNROP_P: TFMTBCDField;
    CDSBuscaPedidoSITP_P: TWideStringField;
    CDSBuscaPedidoDATA: TSQLTimeStampField;
    SQLSolucaoCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    SQLSolucaoCriticaDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQLSolucaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    SQLSolucaoCriticaNM_USUARIO: TWideStringField;
    CDSSolucaoCriticaCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    CDSSolucaoCriticaDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDSSolucaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    CDSSolucaoCriticaNM_USUARIO: TWideStringField;
    SQLSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA: TFMTBCDField;
    SQLSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    SQLSituacaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    SQLSituacaoCriticaNM_USUARIO: TWideStringField;
    CDSSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA: TFMTBCDField;
    CDSSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    CDSSituacaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    CDSSituacaoCriticaNM_USUARIO: TWideStringField;
    SQLStatusItemDivergenciaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField;
    SQLStatusItemDivergenciaNR_ITEM_ORDEM: TFMTBCDField;
    SQLStatusItemDivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDSStatusItemDivergenciaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField;
    CDSStatusItemDivergenciaNR_ITEM_ORDEM: TFMTBCDField;
    CDSStatusItemDivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQLSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField;
    CDSSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TFMTBCDField;
    SQLSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField;
    CDSSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TWideStringField;
    rgStatusRetornoFornec: TRadioGroup;
    CheckBoxReprocessarCriticaToda: TCheckBox;
    CheckBoxAlterarComprador: TCheckBox;
    cmbListaDeComprador: TComboBox;
    SQLItemCriticaDS_OBSERVACAO_SOLUCIONADOR: TWideStringField;
    CDSItemCriticaDS_OBSERVACAO_SOLUCIONADOR: TWideStringField;
    procedure btSalvarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridListaCriticaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridListaCriticaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbSolucaoCriticaKeyPress(Sender: TObject; var Key: Char);
    procedure mmObsCompradorChange(Sender: TObject);
    procedure mmObsCompradorEnter(Sender: TObject);
    procedure mmObsCompradorExit(Sender: TObject);
    procedure mmObsCompradorKeyPress(Sender: TObject; var Key: Char);
    procedure cbSituacaoCriticaKeyPress(Sender: TObject; var Key: Char);
    procedure edPedidoCompraKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btBuscaPedidoClick(Sender: TObject);
    procedure DBGridBuscaPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btAlterarDadosCriticaClick(Sender: TObject);
    procedure CheckBoxAlteraPedidoClick(Sender: TObject);
    procedure edNovoPedidoCompraKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxReprocessarCriticaTodaClick(Sender: TObject);
    procedure CheckBoxAlterarCompradorClick(Sender: TObject);
    procedure cmbListaDeCompradorCloseUp(Sender: TObject);
  private
    procedure carregarListaDeComprador;
    procedure AlterarCompradorGED(nrComprador: integer);
    procedure excluirEventoNFePedidoCompra(nrPedido: integer;
      dsChaveNFe: string);
    { Private declarations }
  public
    { Public declarations }
    NM_FORNECEDOR : string;
    NRO_ORDEM : string;
    NR_ITEM_OBS : string;
    NRO_CHAVE_NFE : string;
    NRO_NOTA_FISCAL : string;
    OBS_COMPRADOR_NOTA : WideString;
    QTD_ITEM_CRITICA : string;
    BOOKMARK: TBookmark;
    NOME_COMPRADOR : string;
    ID_MULT_DIVERGENCIA : Boolean;
    LISTA_ITEM_DIVERGECIA : string;
    NRO_PEDIDO_COMPRA : string;
    ID_PEDIDO_ATUAL : Boolean;

    procedure CarregaDadosCritica;
    procedure MudaStatusCritica(cdStatus,sqOrdem,id_destino_msg,nrPedidoCompra:integer;
      obsComprador:WideString;idRetornoFornec:String);
    procedure MudaStatusGED(cdstatus,nrPedidoCompra,cdDivergencia:integer;nrChaveNFe:string);
    procedure DadosCritica;
    procedure GravaMotivoDivergencia(nrItem,cdSolucao : string);
    function ItemDivergenciaAberto(sqOrdem : string ): WideString;
    procedure sendEmail(nrNota,nmFornecedor,dsMensagem:string;id_destinoMsg:integer);
    procedure solucionarDivergencia;
    procedure AlteraPedidoCompraGED(nrPedido:integer);
    procedure AlteraDivergenciaItem_Inativar;
  end;

var
  _frmVisualizaCriticaNFe: T_frmVisualizaCriticaNFe;
  NRO_CHAVE_NFE_FRM:String;
  DS_REFERENCIA_ITEM_FRM:String;
  LISTA_DE_COMPRADOR : array [0..20] of TComprador;

implementation

uses   URotinasGenericas, uVisualizaPedidoCompra, uHistoricoCriticaNFe,
  UVisualizaDadosNFe, uCriticaPedidoNfe;

{$R *.dfm}

procedure T_frmVisualizaCriticaNFe.AlteraDivergenciaItem_Inativar;
var
  sql : string;
begin
  sql:='UPDATE PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA ' +
       'SET CD_COMPRA_SOLUCAO_DIVERGENCIA = :CD_COMPRA_SOLUCAO_DIVERGENCIA '+
       ',CD_COMPRA_DIVERGENCIA = :CD_COMPRA_DIVERGENCIA '+
       ',NM_USUARIO = ' + QuotedStr(NOME_COMPRADOR) +
       ' ,DT_ATUALIZACAO = SYSDATE ' +
       'WHERE SQ_ORDEM = :ORDEM ';
  SQLGenenicaSIPROD.Close;
  SQLGenenicaSIPROD.SQL.Clear;
  SQLGenenicaSIPROD.SQL.Text:=sql;
  SQLGenenicaSIPROD.ParamByName('CD_COMPRA_SOLUCAO_DIVERGENCIA').AsString:='1';
  SQLGenenicaSIPROD.ParamByName('CD_COMPRA_DIVERGENCIA').AsString:='7';
  SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
  SQLGenenicaSIPROD.ExecSQL();
end;

procedure T_frmVisualizaCriticaNFe.AlteraPedidoCompraGED(nrPedido:integer);
var
  sql : string;
begin
  sql:='UPDATE PRDDM.DC_NFE_COMPRA_GED '+
       'SET NR_PEDIDO_COMPRA = ' + inttostr(nrPedido) +
       ' ,ID_SITUACAO = ''N'' ' +
       ' ,NM_USUARIO = ' + QuotedStr(NOME_COMPRADOR) +
       ' ,DT_ATUALIZACAO = SYSDATE ' +
       ' WHERE DS_NFE_CHAVE = ' + QuotedStr(NRO_CHAVE_NFE) ;

  SQLGenenicaSIPROD.Close;
  SQLGenenicaSIPROD.SQL.Clear;
  SQLGenenicaSIPROD.SQL.Text:=SQL;
  SQLGenenicaSIPROD.ExecSQL();
end;

procedure T_frmVisualizaCriticaNFe.excluirEventoNFePedidoCompra(nrPedido:integer;dsChaveNFe:string);
var
  sql : string;
begin
  sql:='DELETE GAMNFE.DC_EVT_NFE_COMPRA '+
       'WHERE CD_PEDIDO = ' + inttostr(nrPedido) +
       ' AND DS_CHAVE_NFE = ' + QuotedStr(NRO_CHAVE_NFE) ;

  SQLGenenicaSIPROD.Close;
  SQLGenenicaSIPROD.SQL.Clear;
  SQLGenenicaSIPROD.SQL.Text:=SQL;
  SQLGenenicaSIPROD.ExecSQL();
end;

procedure T_frmVisualizaCriticaNFe.AlterarCompradorGED(nrComprador:integer);
var
  sql : string;
begin
  sql:='UPDATE PRDDM.DC_NFE_COMPRA_GED '+
       'SET CD_COMPRADOR = ' + inttostr(nrComprador) +
       ' ,ID_SITUACAO = ''N'' ' +
       ' ,NM_USUARIO = ' + QuotedStr(NOME_COMPRADOR) +
       ' ,DT_ATUALIZACAO = SYSDATE ' +
       ' WHERE DS_NFE_CHAVE = ' + QuotedStr(NRO_CHAVE_NFE) ;

  SQLGenenicaSIPROD.Close;
  SQLGenenicaSIPROD.SQL.Clear;
  SQLGenenicaSIPROD.SQL.Text:=SQL;
  SQLGenenicaSIPROD.ExecSQL();
end;

procedure T_frmVisualizaCriticaNFe.solucionarDivergencia;
var
  i: integer;
  idSolucaoAutomatica: integer;
begin
  CDSSolucaoCritica.Close;
  SQLSolucaoCritica.ParamByName('CD_DIVERGENCIA').AsString:=CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsString;
  CDSSolucaoCritica.Open;
  cbSolucaoCritica.Text:='';
  cbSolucaoCritica.Items.Clear;
  i:=0;
  idSolucaoAutomatica:=0;
  while not CDSSolucaoCritica.Eof do
  begin
    cbSolucaoCritica.Items.Add(FormatFloat('###000',CDSSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA.AsInteger) +' - '+ CDSSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA.AsString);
    if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 8) and (CDSSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA.AsInteger = 5)) then
      idSolucaoAutomatica:=i;

    inc(i);
    CDSSolucaoCritica.Next;
  end;

  NR_ITEM_OBS:=CDSItemCriticaNR_ITEM_ORDEM.AsString;
  rgStatusRetornoFornec.Enabled:=True;
  if edPedidoCompra.Enabled = true then
    edPedidoCompra.SetFocus
  else
  begin
    { quantidade recebida menor que a solicitada no pedido }
    if CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger <> 8 then
    begin
      cbSolucaoCritica.Text:='INFORME O MOTIVO DA DIVERG?NCIA';
      cbSolucaoCritica.Enabled:=true;
      cbSolucaoCritica.SetFocus;
    end
    else
    begin
      { posicionar o combo na solu??o autom?tica }
      cbSolucaoCritica.ItemIndex:=idSolucaoAutomatica;
      cbSolucaoCritica.Enabled:=true;
      cbSolucaoCritica.SetFocus;
    end;
    BOOKMARK:=CDSItemCritica.Bookmark;
  end;
end;

procedure T_frmVisualizaCriticaNFe.sendEmail(nrNota,nmFornecedor,dsMensagem:string;id_destinoMsg:integer);
var
  IdMessage1: TIdMessage;
  IdSMTP1 : TIdSMTP;
begin
  try
    IdSMTP1:=TIdSMTP.Create(Self);
    IdSMTP1.host:='mail.gam.com.br';
    IdSMTP1.Username:='criticapedido';
    IdSMTP1.Password:='cr123';
    IdSMTP1.Connect;

    IdMessage1:=TidMessage.create(Self);
    IdMessage1.Subject:='Divergencia de Nota Fiscal - '+ DateTimeToStr(now);
    IdMessage1.From.Name:='GAM - Genesio A. Mendes & Cia Ltda.';
    IdMessage1.From.Address:='criticapedido@gam.com.br';

    // DESTINATARIO
    case id_destinoMsg of
      1 : IdMessage1.Recipients.EMailAddresses:='alessandro.albino@gam.com.br;marcio.monteiro@gam.com.br;moreno@gam.com.br';
      2 : IdMessage1.Recipients.EMailAddresses:='bete@gam.com.br';
    end;

    IdMessage1.CCList.EMailAddresses:='silvestre@gam.com.br';

    // CORPO DA MENSAGEM
    IdMessage1.body.Add('');
    IdMessage1.body.Add('COMPRADOR: ' + NOME_COMPRADOR);
    IdMessage1.body.Add('FORNECEDOR: ' + nmFornecedor);
    IdMessage1.body.Add('N? NOTA FISCAL: ' + nrNota);
    IdMessage1.body.Add('MENSAGEM : '+ #13 + dsMensagem);

    IdMessage1.MessageParts.clear;
    IdMessage1.Priority:=mpHighest;
    idmessage1.Date:=date;
    IdMessage1.Organization:='GAM';
    IdSMTP1.Send(IdMessage1);
    IdSMTP1.Disconnect;
  except

  end;

end;

procedure T_frmVisualizaCriticaNFe.CarregaDadosCritica;
begin
  NRO_ORDEM:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaSQ_ORDEM.ASSTRING;
  NRO_CHAVE_NFE:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaDS_NFE_CHAVE.AsString;
  OBS_COMPRADOR_NOTA:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaDS_OBSERVACAO_COMPRADOR.AsString;
  NM_FORNECEDOR:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaNOMP_P.AsString;
  NRO_NOTA_FISCAL:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaNR_NFE.AsString;
  NRO_PEDIDO_COMPRA:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaNR_PEDIDO_GAM.AsString;
  NOME_COMPRADOR:=_frmNfeCriticaPedidoNfe.CDSRelacaoCriticaNM_COMPRADOR_REDUZIDO.AsString;

  case _frmNfeCriticaPedidoNfe.CDSRelacaoCriticaID_RETORNO_FORNECEDOR.AsString[1] of
   'Z': rgStatusRetornoFornec.ItemIndex:=0;
   'A': rgStatusRetornoFornec.ItemIndex:=1;
   'S': rgStatusRetornoFornec.ItemIndex:=2;
   'N': rgStatusRetornoFornec.ItemIndex:=3;
  end;

  Caption:=' FORNECEDOR: '+ NM_FORNECEDOR + ' PEDIDO DE COMPRA: '+ NRO_PEDIDO_COMPRA ;
end;

function T_frmVisualizaCriticaNFe.ItemDivergenciaAberto(sqOrdem : string ): widestring;
begin
  CDSStatusItemDivergencia.Close;
  SQLStatusItemDivergencia.ParamByName('SQ_ORDEM').AsString:=sqOrdem;
  CDSStatusItemDivergencia.Open;

  if CDSStatusItemDivergencia.RecordCount > 0 then
  begin
    while not CDSStatusItemDivergencia.Eof do
    begin
      Result:=Result + #13 + CDSStatusItemDivergenciaNR_ITEM_ORDEM.AsString + ' ' + CDSStatusItemDivergenciaDS_COMPRA_DIVERGENCIA.AsString;
      CDSStatusItemDivergencia.Next;
    end;
  end
  else
    Result:='';
end;

procedure T_frmVisualizaCriticaNFe.GravaMotivoDivergencia(nrItem,cdSolucao:string);
var
  sql : string;
begin
  if not ID_MULT_DIVERGENCIA then
  begin
    sql:='UPDATE PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA SET CD_COMPRA_SOLUCAO_DIVERGENCIA = :CD_COMPRA_SOLUCAO_DIVERGENCIA,DT_ATUALIZACAO = SYSDATE WHERE SQ_ORDEM = :ORDEM AND NR_ITEM_ORDEM = :NR_ITEM ';
    SQLGenenicaSIPROD.Close;
    SQLGenenicaSIPROD.SQL.Clear;
    SQLGenenicaSIPROD.SQL.Text:=sql;
    SQLGenenicaSIPROD.ParamByName('CD_COMPRA_SOLUCAO_DIVERGENCIA').AsString:=cdSolucao;
    SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
    SQLGenenicaSIPROD.ParamByName('NR_ITEM').AsString:=nrItem;
    SQLGenenicaSIPROD.ExecSQL();
  end
  else
  begin
    sql:='UPDATE PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA SET CD_COMPRA_SOLUCAO_DIVERGENCIA = :CD_COMPRA_SOLUCAO_DIVERGENCIA,DT_ATUALIZACAO = SYSDATE  '+
         'WHERE SQ_ORDEM = :ORDEM AND NR_ITEM_ORDEM IN ('+ LISTA_ITEM_DIVERGECIA + ')';
    SQLGenenicaSIPROD.Close;
    SQLGenenicaSIPROD.SQL.Clear;
    SQLGenenicaSIPROD.SQL.Text:=sql;
    SQLGenenicaSIPROD.ParamByName('CD_COMPRA_SOLUCAO_DIVERGENCIA').AsString:=cdSolucao;
    SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
    SQLGenenicaSIPROD.ExecSQL();
  end;

end;

procedure T_frmVisualizaCriticaNFe.DadosCritica;
begin
  CDSItemCritica.Close;
  SQLItemCritica.Params[0].AsString:=NRO_ORDEM;
  CDSItemCritica.Open;

  QTD_ITEM_CRITICA:=inttostr(CDSItemCritica.RecordCount);

  if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 4) or (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 6)) then
    CheckBoxAlteraPedido.Enabled:=true
  else
    CheckBoxAlteraPedido.Enabled:=false;

  if CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 5 then
  begin
    CheckBoxAlterarComprador.Enabled:=true;
    carregarListaDeComprador;

  end
  else
    CheckBoxAlterarComprador.Enabled:=false;

  CDSSituacaoCritica.Close;
  CDSSituacaoCritica.Open;

  cbSituacaoCritica.Text:='';
  cbSituacaoCritica.Items.Clear;
  while not CDSSituacaoCritica.Eof do
  begin
    cbSituacaoCritica.Items.Add(FormatFloat('###000',CDSSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA.AsInteger) +' - '+ CDSSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA.AsString);
    CDSSituacaoCritica.Next;
  end;
end;

procedure T_frmVisualizaCriticaNFe.MudaStatusGED(cdstatus,nrPedidoCompra,cdDivergencia:integer;nrChaveNFe:string);
var
  sql : string;
  situacao : string;
begin
  try
    if nrPedidoCompra > 0 then
    begin
      if cdstatus = 4 then
        situacao:='B'
      else
        situacao:='N';

      sql:='UPDATE PRDDM.DC_NFE_COMPRA_GED SET ID_SITUACAO = :SITUACAO, NR_PEDIDO_COMPRA = :PEDIDO WHERE DS_NFE_CHAVE = :CHAVE';
      SQLGenenicaSIPROD.Close;
      SQLGenenicaSIPROD.SQL.Clear;
      SQLGenenicaSIPROD.SQL.Text:=sql;
      SQLGenenicaSIPROD.ParamByName('SITUACAO').AsString:=situacao;
      SQLGenenicaSIPROD.ParamByName('PEDIDO').AsString:=inttostr(nrPedidoCompra);
      SQLGenenicaSIPROD.ParamByName('CHAVE').AsString:=nrChaveNFe;
      SQLGenenicaSIPROD.ExecSQL();
    end
    else
    begin
      { MERCADORIA NAO LOCALIZADA e critica n?o bloqueada }
      if ((cdDivergencia = 6) and (cdstatus <> 4)) then
        situacao:='N' { reprocessar }
      else
      begin
        case cdstatus of
          1 : situacao  :='N';
          2 : situacao  :='A';
          3 : situacao  :='L';
          4 : situacao  :='B';
          5,6 : situacao:='N';
        end;
      end;

      sql:='UPDATE PRDDM.DC_NFE_COMPRA_GED SET ID_SITUACAO = :SITUACAO WHERE DS_NFE_CHAVE = :CHAVE';
      SQLGenenicaSIPROD.Close;
      SQLGenenicaSIPROD.SQL.Clear;
      SQLGenenicaSIPROD.SQL.Text:=sql;
      SQLGenenicaSIPROD.ParamByName('SITUACAO').AsString:=situacao;
      SQLGenenicaSIPROD.ParamByName('CHAVE').AsString:=nrChaveNFe;
      SQLGenenicaSIPROD.ExecSQL();
    end;
  except
    ShowMessage('OCORREU UM PROBLEMA AO MUDAR STATUS TABELA GED_COMPRA ');
  end;

end;

procedure T_frmVisualizaCriticaNFe.MudaStatusCritica(cdStatus,sqOrdem,id_destino_msg,nrPedidoCompra:integer;obsComprador:WideString;idRetornoFornec:String);
var
  sql : string;
begin
  try
    if nrPedidoCompra > 0 then
    begin
      sql:='UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET DS_OBSERVACAO_SOLUCIONADOR = :OBS_COMPRADOR, ';
      sql:=sql + 'CD_COMPRA_SITUACAO_CRITICA = :CD_STATUS, NR_PEDIDO_GAM = :NR_PEDIDO, DT_LIBERACAO = SYSDATE ,NM_USUARIO = :USUARIO,ID_DESTINATARIO_MSG = :ID_DESTINO_MSG WHERE SQ_ORDEM = :ORDEM ';

      SQLGenenicaSIPROD.Close;
      SQLGenenicaSIPROD.SQL.Clear;
      SQLGenenicaSIPROD.SQL.Text:=sql;
      SQLGenenicaSIPROD.ParamByName('OBS_COMPRADOR').AsString:=obsComprador;
      SQLGenenicaSIPROD.ParamByName('CD_STATUS').AsString:=inttostr(cdStatus);
      SQLGenenicaSIPROD.ParamByName('NR_PEDIDO').AsString:=inttostr(nrPedidoCompra);
      SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
      SQLGenenicaSIPROD.ParamByName('USUARIO').AsString:=NOME_COMPRADOR;
      SQLGenenicaSIPROD.ParamByName('ID_DESTINO_MSG').AsString:=IntToStr(id_destino_msg);
      SQLGenenicaSIPROD.ExecSQL();
    end
    else
    begin
      sql:='UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET DS_OBSERVACAO_SOLUCIONADOR = :OBS_COMPRADOR, ';
      sql:=sql + 'CD_COMPRA_SITUACAO_CRITICA = :CD_STATUS,DT_LIBERACAO = SYSDATE ,NM_USUARIO = :USUARIO,ID_DESTINATARIO_MSG = :ID_DESTINO_MSG, ';
      sql:=sql + 'ID_RETORNO_FORNECEDOR = :ID_RETORNO_FORNECEDOR ';
      sql:=sql + 'WHERE SQ_ORDEM = :ORDEM ';

      SQLGenenicaSIPROD.Close;
      SQLGenenicaSIPROD.SQL.Clear;
      SQLGenenicaSIPROD.SQL.Text:=sql;
      SQLGenenicaSIPROD.ParamByName('OBS_COMPRADOR').AsString:=obsComprador;
      SQLGenenicaSIPROD.ParamByName('CD_STATUS').AsString:=inttostr(cdStatus);
      SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
      SQLGenenicaSIPROD.ParamByName('USUARIO').AsString:=NOME_COMPRADOR;
      SQLGenenicaSIPROD.ParamByName('ID_DESTINO_MSG').AsString:=inttostr(id_destino_msg);
      SQLGenenicaSIPROD.ParamByName('ID_RETORNO_FORNECEDOR').AsString:=idRetornoFornec;
      SQLGenenicaSIPROD.ExecSQL();
    end;
  except
    on E:Exception do
      raise Exception.CreateFmt('OCORREU UM PROBLEMA AO MUDAR STATUS DA CRITICA. DETALHES: %s',[E.Message]);
  end;

end;

procedure T_frmVisualizaCriticaNFe.btSalvarClick(Sender: TObject);
const
  CD_CRITICA_BLOQUEADA = 4;

  function TiraEspaco(texto:WideString):WideString;
  begin
    Result:='';
    Result := StringReplace(texto,'  ','',[rfReplaceAll]);
  end;
var
  I : integer;
  cdSituacao : integer;
  nrPedidoCompra : integer;
  id_DestinoMsg : integer;
  id_retornoFornecedor : string;
  msgObsComprador : WideString;
begin
  { divergencia de pedido de compra nao informado }
  nrPedidoCompra:=StrToIntDef(edPedidoCompra.Text,0);

  { situa?ao da critica }
  cdSituacao:=strtoint(copy(cbSituacaoCritica.Text,1,3));

  if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 5) and (nrPedidoCompra = 0) and (cdSituacao <> CD_CRITICA_BLOQUEADA) ) then
  begin
    ShowMessage('INFORME UM NUMERO DE PEDIDO V?LIDO!');
    edPedidoCompra.SetFocus;
    exit;
  end;

  if ((length(cbSituacaoCritica.Text) = 0) or (cbSituacaoCritica.Text = 'INFORME A SITUA??O')) then
  begin
    ShowMessage('ESCOLHA A SITUA??O DA CRITICA NA LISTA DE OP??ES');
    cbSituacaoCritica.SetFocus;
    exit;
  end;

  { situa?ao da critica }
  cdSituacao:=strtoint(copy(cbSituacaoCritica.Text,1,3));

  // ENVIA EMAIL COM A OBSERVA??O DO COMPRADOR PARA O SETOR INDICADO
  id_DestinoMsg:=rgEnviaMSG.ItemIndex;

  if id_DestinoMsg > 0 then
  begin
    for I:= 0 to mmObsComprador.Lines.Count do
      msgObsComprador:=msgObsComprador + trim(UpperCase(mmObsComprador.Lines.Strings[I])) + ' ';

    if Length(msgObsComprador) = 0 then
    begin
      ShowMessage('OBSERVA??O DO COMPRADOR ? UMA INFORMA??O OBRIGAT?RIA.');
      mmObsComprador.SetFocus;
      exit;
    end
    else
      sendEmail(NRO_NOTA_FISCAL,NM_FORNECEDOR,msgObsComprador,id_DestinoMsg);
  end;

  // Controle de retorno do fornecedor
  case rgStatusRetornoFornec.ItemIndex of
    0 : id_retornoFornecedor:='Z';
    1 : id_retornoFornecedor:='A';
    2 : id_retornoFornecedor:='S';
    3 : id_retornoFornecedor:='N';
  end;

  try
    MudaStatusCritica(cdSituacao,StrToInt(NRO_ORDEM),id_DestinoMsg,nrPedidoCompra,msgObsComprador,id_retornoFornecedor);
    MudaStatusGED(cdSituacao,nrPedidoCompra,CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger,NRO_CHAVE_NFE);

    rgEnviaMSG.Enabled:=false;
    mmObsComprador.Clear;
    Label3.Enabled:=false;
    cbSituacaoCritica.Enabled:=false;
    btSalvar.Enabled:=false;
    close;
  except
    on E:Exception do
      raise Exception.CreateFmt('ERRO AO MUDAR STATUS DA CRITICA. DETALHES: %s',[E.Message  ]);

  end;
end;

procedure T_frmVisualizaCriticaNFe.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure T_frmVisualizaCriticaNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frmVisualizaCriticaNFe:=nil;
  Action:=cafree;
end;

procedure T_frmVisualizaCriticaNFe.DBGridListaCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ID_MULT_DIVERGENCIA:=false;
    if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 1)  or
        (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 3)  or
        (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 4)  or
        (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 8)) then
    begin
      edCodProduto.Text:=copy(CDSItemCriticaDS_OBSERVACAO_SISTEMA.AsString,10,5);
      lbCodProduto.Enabled:=true;
      btBuscaPedido.Enabled:=true;

      if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 3) or ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 8) and (CDSItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA.AsInteger <> 5)) ) then
        CheckBoxReprocessarCriticaToda.Enabled:=True
      else
        CheckBoxReprocessarCriticaToda.Enabled:=False;
    end;

    solucionarDivergencia;
  end;

  if key = #27 then
    close;
end;

procedure T_frmVisualizaCriticaNFe.DBGridListaCriticaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  conta_item_selecao : integer;
  lista_itens_tela  : string;
  confItemselecionado : string;
begin
  if key = VK_F1 then
  begin
       NRO_CHAVE_NFE:=NRO_CHAVE_NFE_FRM;
       DS_REFERENCIA_ITEM:=CDSItemCriticaDS_REFERENCIA_ITEM_NF.AsString;

      _frmNfeVisualizaDanfe:= T_frmNfeVisualizaDanfe.create(self);
      _frmNfeVisualizaDanfe.windowstate := wsnormal;
      _frmNfeVisualizaDanfe.bringtofront;
      _frmNfeVisualizaDanfe.setfocus;
  end;

  if key = VK_F2 then
  begin
      _frmVisualizaPedidoCompra:= T_frmVisualizaPedidoCompra.create(self);
      _frmVisualizaPedidoCompra.windowstate := wsnormal;
      _frmVisualizaPedidoCompra.bringtofront;
      _frmVisualizaPedidoCompra.setfocus;
  end;

  // SELECIONAR DIVERGENCIAS E USAR A MESMA SOLUCAO PARA TODAS
  if key = vk_F5 then
  begin
    confItemselecionado:='';
    lista_itens_tela:='';
    LISTA_ITEM_DIVERGECIA:='';
    with DBGridListaCritica do
    begin
      for conta_item_selecao:=0 to pred(SelectedRows.Count) do
      begin
        DSItemCritica.DataSet.Bookmark:=SelectedRows[conta_item_selecao];
        if (length(confItemselecionado) = 0 ) or (confItemselecionado = CDSItemCriticaDS_COMPRA_DIVERGENCIA.AsString) then
        begin
          confItemselecionado:=CDSItemCriticaDS_COMPRA_DIVERGENCIA.AsString;
          lista_itens_tela:=lista_itens_tela + CDSItemCriticaNR_ITEM_ORDEM.AsString + ' - '+ CDSItemCriticaDS_COMPRA_DIVERGENCIA.AsString + #13;
          LISTA_ITEM_DIVERGECIA:=LISTA_ITEM_DIVERGECIA + CDSItemCriticaNR_ITEM_ORDEM.AsString + ',';
        end
        else
        begin
          Application.MessageBox(pchar('DIVERGENCIA INVALIDA ( '+ CDSItemCriticaNR_ITEM_ORDEM.AsString+ ' )'),'ATEN??O',MB_ICONERROR);
          DBGridListaCritica.SetFocus;
          exit;
        end;
      end;
    end;

    if conta_item_selecao <= 25 then
    begin
      LISTA_ITEM_DIVERGECIA:=copy(LISTA_ITEM_DIVERGECIA,1,length(LISTA_ITEM_DIVERGECIA)-1);
      if MessageDlg(' DIVERGENCIAS SELECIONADAS: ( '+ inttostr(conta_item_selecao) + ' )' + #13 + lista_itens_tela + #13 + 'SOLUCIONAR DIVERGENCIAS ?',mtConfirmation,mbOKCancel,0) = idOK then
      begin
        ID_MULT_DIVERGENCIA:=true;
        solucionarDivergencia;
      end
      else
        DBGridListaCritica.SetFocus;
    end
    else
    begin
      lista_itens_tela:='';
      LISTA_ITEM_DIVERGECIA:='';
      Application.MessageBox(pchar('DIVERGENCIAS SELECIONADOS = ' + inttostr(conta_item_selecao) + ' ( MAX = 25 )'),'ATEN??O',MB_ICONERROR);
      DBGridListaCritica.SetFocus;
    end;
  end;
end;

procedure T_frmVisualizaCriticaNFe.cbSolucaoCriticaKeyPress(Sender: TObject;
  var Key: Char);
var
  listaCriticaAberta : WideString;
begin
  if key = #13 then
  begin
    listaCriticaAberta:='';
    lbCodProduto.Enabled:=false;
    edCodProduto.Clear;
    btBuscaPedido.Enabled:=false;
    if ((Length(cbSolucaoCritica.Text) > 0) and (cbSolucaoCritica.Text <> 'INFORME O MOTIVO DA DIVERG?NCIA')) then
    begin
      GravaMotivoDivergencia(NR_ITEM_OBS,copy(cbSolucaoCritica.Text,1,3));

      CDSItemCritica.Close;
      SQLItemCritica.Params[0].AsString:=NRO_ORDEM;
      CDSItemCritica.Open;
      CDSItemCritica.Bookmark:=BOOKMARK;

      // TESTA SE ? A ULTIMA DIVERGENCIA E SE TODAS FORAM CRITICADAS
      if NR_ITEM_OBS = QTD_ITEM_CRITICA then
      begin
        listaCriticaAberta:=ItemDivergenciaAberto(NRO_ORDEM);
        if length(listaCriticaAberta) = 0  then
        begin
          mmObsComprador.Enabled:=true;
          mmObsComprador.Clear;
          mmObsComprador.SetFocus;
          cbSolucaoCritica.Text:='';
        end
        else
        begin
          ShowMessage('VERIFICAR DIVERGENCIA EM ABERTO' + #13 + listaCriticaAberta);
          cbSolucaoCritica.Text:='';
          DBGridListaCritica.SetFocus;
          exit;
        end;
      end
      else
      begin
        cbSolucaoCritica.Text:='';
        DBGridListaCritica.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('INFORME O MOTIVO DA CRITICA');
      cbSolucaoCritica.SetFocus;
      exit;
    end;
    cbSolucaoCritica.Enabled:=false;
  end;

  if key = #27 then
  begin
    DBGridListaCritica.SetFocus;
    lbCodProduto.Enabled:=false;
    cbSolucaoCritica.Text:='';
    edCodProduto.Clear;
    btBuscaPedido.Enabled:=false;
  end;
end;

procedure T_frmVisualizaCriticaNFe.mmObsCompradorChange(Sender: TObject);
begin
  if mmObsComprador.Enabled = true then
  begin
    Label6.Caption:='( ' + inttostr( 200 - (length(mmObsComprador.Text))) + ' )';
    if length(mmObsComprador.Text) > 0 then
    begin
      Label3.Enabled:=true;
      rgEnviaMSG.Enabled:=true;
      cbSituacaoCritica.Enabled:=true;
      btSalvar.Enabled:=true;
    end
    else
    begin
      Label3.Enabled:=false;
      rgEnviaMSG.Enabled:=false;
      cbSituacaoCritica.Enabled:=false;
      btSalvar.Enabled:=false;
    end
  end;

end;

procedure T_frmVisualizaCriticaNFe.mmObsCompradorEnter(Sender: TObject);
begin
  Label6.Visible:=true;
end;

procedure T_frmVisualizaCriticaNFe.mmObsCompradorExit(Sender: TObject);
begin
  Label6.Visible:=false;
end;

procedure T_frmVisualizaCriticaNFe.mmObsCompradorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //cbSituacaoCritica.Text:='INFORME A SITUA??O';
    if not cbSituacaoCritica.Enabled then
      cbSituacaoCritica.Enabled:=true;
    btSalvar.Enabled:=true;
    cbSituacaoCritica.SetFocus;
  end;

  if key = #27 then
  begin
    mmObsComprador.Clear;
    Label6.Caption:='( 200 )';
    Application.ProcessMessages;
  end;

end;

procedure T_frmVisualizaCriticaNFe.cbSituacaoCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btSalvar.SetFocus;
    btSalvar.Click;
  end;
end;

procedure T_frmVisualizaCriticaNFe.edPedidoCompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    cbSolucaoCritica.Text:='INFORME O MOTIVO DA DIVERG?NCIA';
    cbSolucaoCritica.Enabled:=true;
    cbSolucaoCritica.SetFocus;
  end;
end;

procedure T_frmVisualizaCriticaNFe.FormShow(Sender: TObject);
begin
  try
    ID_PEDIDO_ATUAL:=true;
    ID_MULT_DIVERGENCIA:=false;
    LISTA_ITEM_DIVERGECIA:='';
    CheckBoxAlteraPedido.Checked:=false;

    CarregaDadosCritica;

    QTD_ITEM_CRITICA:='0';
    lbCodProduto.Enabled:=false;
    edPedidoCompra.Clear;
    btBuscaPedido.Enabled:=false;

    DadosCritica;

    rgEnviaMSG.ItemIndex:=0;
    Label6.Caption:='( 200 )';
    mmObsComprador.Clear;
    mmObsComprador.Enabled:=false;
    rgEnviaMSG.Enabled:=false;

    if Length(OBS_COMPRADOR_NOTA) > 1 then
      mmObsComprador.Text:=OBS_COMPRADOR_NOTA;

    if CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 5 then
    begin
      Label1.Enabled:=true;
      edPedidoCompra.Enabled:=true;
      DBGridListaCritica.SetFocus;
    end
    else
    begin
      Label1.Enabled:=false;
      edPedidoCompra.Enabled:=false;
      DBGridListaCritica.SetFocus;
    end;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure T_frmVisualizaCriticaNFe.btBuscaPedidoClick(Sender: TObject);
begin
  CDSBuscaPedido.Close;
  SQLBuscaPedido.ParamByName('CD_PRODUTO').AsString:=edCodProduto.Text;
  CDSBuscaPedido.Open;

  if CDSBuscaPedido.RecordCount > 0 then
  begin
    DBGridBuscaPedido.Left:=275;
    DBGridBuscaPedido.Top:=165;
    DBGridBuscaPedido.Visible:=true;
    DBGridBuscaPedido.SetFocus;
  end
  else
  begin
    Application.MessageBox(pchar('NENHUM PEDIDO DE COMPRA EM ABERTO '+ #13 + 'CONTENDO ESTE PRODUTO.'),'ATEN??O',MB_ICONERROR);
    cbSolucaoCritica.SetFocus;
  end;
end;

procedure T_frmVisualizaCriticaNFe.DBGridBuscaPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ID_PEDIDO_ATUAL:=false;
    _frmVisualizaPedidoCompra:= T_frmVisualizaPedidoCompra.create(self);
    _frmVisualizaPedidoCompra.windowstate := wsnormal;
    _frmVisualizaPedidoCompra.bringtofront;
    _frmVisualizaPedidoCompra.setfocus;
  end;

  if key = #27 then
  begin
    DBGridBuscaPedido.Visible:=false;
    cbSolucaoCritica.SetFocus;
  end;
end;

procedure T_frmVisualizaCriticaNFe.Button1Click(Sender: TObject);
begin
    _frmNfeHistoricoCriticaNFe:= T_frmNfeHistoricoCriticaNFe.create(self);
    _frmNfeHistoricoCriticaNFe.windowstate := wsnormal;
    _frmNfeHistoricoCriticaNFe.bringtofront;
    _frmNfeHistoricoCriticaNFe.setfocus;
end;

procedure T_frmVisualizaCriticaNFe.btAlterarDadosCriticaClick(
  Sender: TObject);
var
  nrPedido : integer;
  nrComprador: integer;
begin
  if CheckBoxAlteraPedido.Checked then
  begin
    try
      nrPedido:=strtoint(edNovoPedidoCompra.Text);
    except
      Application.MessageBox('NUMERO DE PEDIDO INVALIDO','ATEN??O',0 + 16);
      edNovoPedidoCompra.SetFocus;
      exit;
    end;

    if Application.MessageBox(' A CRITICA(NFe) DEVER? SER REPROCESSADA. ! ' + #13 +
                  ' DESEJA REALMENTE MUDAR O PEDIDO DE COMPRA ?','ATEN??O',4 + 32) = 6 then
    begin
      try
        // ALTERA PEDIDO DE COMPRA NO GED
        AlteraPedidoCompraGED(nrPedido);

        // MUDA TIPO DA CRITICA ( ITENS ) PARA INATIVA
        AlteraDivergenciaItem_Inativar;

        // Excluir evento nfe pedido
        excluirEventoNFePedidoCompra(strtoint(NRO_PEDIDO_COMPRA),NRO_CHAVE_NFE);

        // LIBERA CRITICA PARA FINALIZACAO
        cbSituacaoCritica.Enabled:=true;
        cbSituacaoCritica.Text:='006 - REPROCESSADA';
        Application.MessageBox('PEDIDO DE COMPRA ALTERADO COM SUCESSO','ATEN??O',0 + 64);
        mmObsComprador.Enabled:=true;
        mmObsComprador.Clear;
        mmObsComprador.SetFocus;
        mmObsComprador.Lines.Add('CRITICA REPROCESSADA');

      except
        Application.MessageBox('ERRO AO ALTERAR PEDIDO DE COMPRA','ATEN??O',0 + 16);
      end;
    end
    else
      Application.MessageBox('ALTERA??O CANCELADA PELO USUARIO','ALTERAR PEDIDO DE COMPRA',0 + 64);
  end;

  if CheckBoxAlterarComprador.Checked then
  begin
    try
      nrComprador:=0;

      nrComprador:=LISTA_DE_COMPRADOR[cmbListaDeComprador.ItemIndex].codigo;
      if nrComprador = 0 then
        raise Exception.Create('Comprador inv?lido.');
    except
      Application.MessageBox('COMPRADOR INVALIDO','ATEN??O',0 + 16);
      edNovoPedidoCompra.SetFocus;
      exit;
    end;

    if Application.MessageBox(' A CRITICA(NFe) DEVER? SER REPROCESSADA ! ' + #13 +
                              ' DESEJA REALMENTE MUDAR O COMPRADOR ?','ATEN??O',4 + 32) = 6 then
    begin
      try
        // ALTERA COMPRADOR NO GED
        AlterarCompradorGED(nrComprador);

        // MUDA TIPO DA CRITICA ( ITENS ) PARA INATIVA
        AlteraDivergenciaItem_Inativar;

        Application.MessageBox('COMPRADOR ALTERADO COM SUCESSO','ATEN??O',0 + 64);

        // LIBERA CRITICA PARA FINALIZACAO
        cbSituacaoCritica.Enabled:=true;
        cbSituacaoCritica.Text:='006 - REPROCESSAR';
        mmObsComprador.Enabled:=true;
        mmObsComprador.Clear;
        mmObsComprador.SetFocus;
        mmObsComprador.Lines.Add('CRITICA REPROCESSADA');
      except
        Application.MessageBox('ERRO AO ALTERAR COMPRADOR','ATEN??O',0 + 16);
      end;
    end
    else
      Application.MessageBox('ALTERA??O CANCELADA PELO USUARIO','ALTERAR PEDIDO DE COMPRA',0 + 64);
  end;

end;

procedure T_frmVisualizaCriticaNFe.CheckBoxAlteraPedidoClick(Sender: TObject);
begin
  if CheckBoxAlteraPedido.Checked then
  begin
    lbNovoPedido.Enabled:=true;
    edNovoPedidoCompra.Enabled:=true;
    btAlterarDadosCritica.Enabled:=true;
    edNovoPedidoCompra.SetFocus;
  end
  else
  begin
    lbNovoPedido.Enabled:=false;
    edNovoPedidoCompra.Enabled:=false;
    btAlterarDadosCritica.Enabled:=false;
  end;
end;

procedure T_frmVisualizaCriticaNFe.carregarListaDeComprador;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;
  i:integer;
begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=_dm._conexao;
  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    sqlTxt.Add('SELECT NR_COMPRADOR,NM_COMPRADOR_REDUZIDO');
    sqlTxt.Add('FROM PRDDM.DC_COMPRADOR_GAM');
    sqlTxt.Add('WHERE ID_ATIVO = ''S'' ');
    sqlTxt.Add('ORDER BY NM_COMPRADOR_REDUZIDO');

    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.Open;
    i:=0;
    while not sqlDados.Eof do
    begin
      LISTA_DE_COMPRADOR[i].codigo:=sqlDados.FieldByName('NR_COMPRADOR').AsInteger;
      LISTA_DE_COMPRADOR[i].nome  :=sqlDados.FieldByName('NM_COMPRADOR_REDUZIDO').AsString;

      cmbListaDeComprador.Items.Add(sqlDados.FieldByName('NM_COMPRADOR_REDUZIDO').AsString);
      inc(i);
      sqlDados.Next;
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;

end;

procedure T_frmVisualizaCriticaNFe.CheckBoxAlterarCompradorClick(
  Sender: TObject);
begin
  if CheckBoxAlterarComprador.Checked then
  begin
    cmbListaDeComprador.Enabled:=True;
    cmbListaDeComprador.SetFocus;
  end
  else
    cmbListaDeComprador.Enabled:=False;
end;

procedure T_frmVisualizaCriticaNFe.CheckBoxReprocessarCriticaTodaClick(
  Sender: TObject);
begin
  if CheckBoxReprocessarCriticaToda.Checked then
  begin
    if Application.MessageBox(' A CRITICA(NFe) DEVER? SER REPROCESSADA ! ' + #13 +
                  ' DESEJA REALMENTE REPROCESSAR A NFE ?','ATEN??O',4 + 32) = 6 then
    begin
      try
        // MUDA TIPO DA CRITICA ( ITENS ) PARA INATIVA
        AlteraDivergenciaItem_Inativar;

        // LIBERA CRITICA PARA FINALIZACAO
        cbSituacaoCritica.Enabled:=true;
        cbSituacaoCritica.Text:='006 - REPROCESSADA';
        Application.MessageBox('CRITICA LIBERADA PARA INATIVA??O','ATEN??O',MB_ICONEXCLAMATION);
        mmObsComprador.Enabled:=true;
        mmObsComprador.Clear;
        mmObsComprador.Lines.Add('CRITICA REPROCESSADA');
        mmObsComprador.SetFocus;
      except
        Application.MessageBox('ERRO AO LIBERAR NFE PARA REPROCESSAMENTO','ATEN??O',MB_ICONERROR);
      end;
    end
    else
    begin
      Application.MessageBox('ALTERA??O CANCELADA PELO USUARIO','ALTERAR PEDIDO DE COMPRA',MB_ICONERROR);
      CheckBoxReprocessarCriticaToda.Checked:=False;
    end;
  end;

end;

procedure T_frmVisualizaCriticaNFe.cmbListaDeCompradorCloseUp(Sender: TObject);
begin
  btAlterarDadosCritica.Enabled:=True;
end;

procedure T_frmVisualizaCriticaNFe.edNovoPedidoCompraKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btAlterarDadosCritica.Click;
end;

end.
