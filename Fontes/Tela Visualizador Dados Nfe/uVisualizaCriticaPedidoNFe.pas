unit uVisualizaCriticaPedidoNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls, Grids,
  DBGrids, DBCtrls, ComCtrls, ExtCtrls,IdSMTP,IdMessage, uDm;

type
  T_frVisualizaCriticaNFe = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    dbmmDsCritica: TDBMemo;
    dbMemoMotivocritica: TDBMemo;
    DBGridListaCritica: TDBGrid;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btSalvar: TButton;
    cbSituacaoCritica: TComboBox;
    mmObsComprador: TMemo;
    btFechar: TButton;
    SQLItemCritica: TSQLQuery;
    SQLItemCriticaSQ_ORDEM: TBCDField;
    SQLItemCriticaNR_ITEM_ORDEM: TBCDField;
    SQLItemCriticaDS_COMPRA_DIVERGENCIA: TStringField;
    SQLItemCriticaDS_OBSERVACAO_SISTEMA: TStringField;
    SQLItemCriticaDS_OBSERVACAO_COMPRADOR: TStringField;
    SQLItemCriticaCD_COMPRA_DIVERGENCIA: TBCDField;
    SQLItemCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TStringField;
    DSPItemCritica: TDataSetProvider;
    CDSItemCritica: TClientDataSet;
    CDSItemCriticaSQ_ORDEM: TBCDField;
    CDSItemCriticaNR_ITEM_ORDEM: TBCDField;
    CDSItemCriticaDS_COMPRA_DIVERGENCIA: TStringField;
    CDSItemCriticaDS_OBSERVACAO_SISTEMA: TStringField;
    CDSItemCriticaDS_OBSERVACAO_COMPRADOR: TStringField;
    CDSItemCriticaCD_COMPRA_DIVERGENCIA: TBCDField;
    CDSItemCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TStringField;
    DSItemCritica: TDataSource;
    SQLSolucaoCritica: TSQLQuery;
    SQLSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TBCDField;
    SQLSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TStringField;
    SQLSolucaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    SQLSolucaoCriticaNM_USUARIO: TStringField;
    DSPSolucaoCritica: TDataSetProvider;
    CDSSolucaoCritica: TClientDataSet;
    CDSSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TBCDField;
    CDSSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA: TStringField;
    CDSSolucaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    CDSSolucaoCriticaNM_USUARIO: TStringField;
    DSSolucao: TDataSource;
    SQLSituacaoCritica: TSQLQuery;
    SQLSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA: TBCDField;
    SQLSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField;
    SQLSituacaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    SQLSituacaoCriticaNM_USUARIO: TStringField;
    DSPSituacaoCritica: TDataSetProvider;
    CDSSituacaoCritica: TClientDataSet;
    CDSSituacaoCriticaCD_COMPRA_SITUACAO_DIVERGENCIA: TBCDField;
    CDSSituacaoCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField;
    CDSSituacaoCriticaDT_ATUALIZACAO: TSQLTimeStampField;
    CDSSituacaoCriticaNM_USUARIO: TStringField;
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
    SQLStatusItemDivergenciaCD_COMPRA_SOLUCAO_DIVERGENCIA: TBCDField;
    SQLStatusItemDivergenciaNR_ITEM_ORDEM: TBCDField;
    SQLStatusItemDivergenciaDS_COMPRA_DIVERGENCIA: TStringField;
    CDSStatusItemDivergenciaCD_COMPRA_SOLUCAO_DIVERGENCIA: TBCDField;
    CDSStatusItemDivergenciaNR_ITEM_ORDEM: TBCDField;
    CDSStatusItemDivergenciaDS_COMPRA_DIVERGENCIA: TStringField;
    rgEnviaMSG: TRadioGroup;
    SQLItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TBCDField;
    CDSItemCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA: TBCDField;
    SQLItemCriticaID_SITUACAO: TStringField;
    CDSItemCriticaID_SITUACAO: TStringField;
    SQLItemCriticaDS_REFERENCIA_ITEM_NF: TStringField;
    CDSItemCriticaDS_REFERENCIA_ITEM_NF: TStringField;
    GroupBox5: TGroupBox;
    lbCodProduto: TLabel;
    edCodProduto: TEdit;
    btBuscaPedido: TButton;
    SQLBuscaPedido: TSQLQuery;
    DSPBuscaPedido: TDataSetProvider;
    CDSBuscaPedido: TClientDataSet;
    DSBuscaPedido: TDataSource;
    SQLBuscaPedidoNROP_P: TBCDField;
    SQLBuscaPedidoSITP_P: TStringField;
    SQLBuscaPedidoDATA: TSQLTimeStampField;
    CDSBuscaPedidoNROP_P: TBCDField;
    CDSBuscaPedidoSITP_P: TStringField;
    CDSBuscaPedidoDATA: TSQLTimeStampField;
    DBGridBuscaPedido: TDBGrid;
    GroupBox6: TGroupBox;
    Button1: TButton;
    GroupBox7: TGroupBox;
    edNovoPedidoCompra: TEdit;
    lbNovoPedido: TLabel;
    btAlterarPedidoCompra: TButton;
    CheckBoxAlteraPedido: TCheckBox;
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
    procedure btAlterarPedidoCompraClick(Sender: TObject);
    procedure CheckBoxAlteraPedidoClick(Sender: TObject);
    procedure edNovoPedidoCompraKeyPress(Sender: TObject; var Key: Char);
  private
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
    BOOKMARK: TBookmarkStr;
    NOME_COMPRADOR : string;
    ID_MULT_DIVERVENCIA : Boolean;
    LISTA_ITEM_DIVERGECIA : string;
    NRO_PEDIDO_COMPRA : string;
    ID_PEDIDO_ATUAL : Boolean;

    procedure CarregaDadosCritica;
    procedure MudaStatusCritica(cdStatus,sqOrdem,id_destino_msg,nrPedidoCompra:integer;obsComprador:WideString);
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
  _frVisualizaCriticaNFe: T_frVisualizaCriticaNFe;

implementation

uses  U_CriticaPedidoNfe,U_VisualizaDadosNFe, URotinasGenericas,
  U_VisualizaPedidoCompra, U_HistoricoCriticaNFe;

{$R *.dfm}

procedure T_frVisualizaCriticaNFe.AlteraDivergenciaItem_Inativar;
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

procedure T_frVisualizaCriticaNFe.AlteraPedidoCompraGED(nrPedido:integer);
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

procedure T_frVisualizaCriticaNFe.solucionarDivergencia;
begin
  CDSSolucaoCritica.Close;
  SQLSolucaoCritica.ParamByName('CD_DIVERGENCIA').AsString:=CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsString;
  CDSSolucaoCritica.Open;
  cbSolucaoCritica.Text:='';
  cbSolucaoCritica.Items.Clear;
  while not CDSSolucaoCritica.Eof do
  begin
    cbSolucaoCritica.Items.Add(FormatFloat('###000',CDSSolucaoCriticaCD_COMPRA_SOLUCAO_DIVERGENCIA.AsInteger) +' - '+ CDSSolucaoCriticaDS_COMPRA_SOLUCAO_DIVERGENCIA.AsString);
    CDSSolucaoCritica.Next;
  end;

  NR_ITEM_OBS:=CDSItemCriticaNR_ITEM_ORDEM.AsString;
  if edPedidoCompra.Enabled = true then
    edPedidoCompra.SetFocus
  else
  begin
    cbSolucaoCritica.Text:='INFORME O MOTIVO DA DIVERGÊNCIA';
    cbSolucaoCritica.Enabled:=true;
    cbSolucaoCritica.SetFocus;
    BOOKMARK:=CDSItemCritica.Bookmark;
  end;
end;

procedure T_frVisualizaCriticaNFe.sendEmail(nrNota,nmFornecedor,dsMensagem:string;id_destinoMsg:integer);
var
  IdMessage1: TIdMessage;
  IdSMTP1 : TIdSMTP;
begin
  try
    IdSMTP1:=TIdSMTP.Create(Self);
    IdSMTP1.host:='mail.gam.com.br';
    IdSMTP1.UserId:='criticapedido';
    IdSMTP1.Password:='cr123';
    IdSMTP1.Connect;

    IdMessage1:=TidMessage.create(Self);
    IdMessage1.Subject:='Divergencia de Nota Fiscal - '+ DateTimeToStr(now);
    IdMessage1.From.Name:='GAM - Genesio A. Mendes & Cia Ltda.';
    IdMessage1.From.Address:='criticapedido@gam.com.br';

    // DESTINATARIO
    case id_destinoMsg of
      1 : IdMessage1.Recipients.EMailAddresses:='rafaels@gam.com.br;marcio.monteiro@gam.com.br;paulo@gam.com.br';
      2 : IdMessage1.Recipients.EMailAddresses:='bete@gam.com.br';
    end;

    IdMessage1.CCList.EMailAddresses:='silvestre@gam.com.br';

    // CORPO DA MENSAGEM
    IdMessage1.body.Add('');
    IdMessage1.body.Add('COMPRADOR: ' + NOME_COMPRADOR);
    IdMessage1.body.Add('FORNECEDOR: ' + nmFornecedor);
    IdMessage1.body.Add('Nº NOTA FISCAL: ' + nrNota);
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

procedure T_frVisualizaCriticaNFe.CarregaDadosCritica;
begin
  NRO_ORDEM:=_frCriticaPedidoNfe.CDSRelacaoCriticaSQ_ORDEM.ASSTRING;
  NRO_CHAVE_NFE:=_frCriticaPedidoNfe.CDSRelacaoCriticaDS_NFE_CHAVE.AsString;
  OBS_COMPRADOR_NOTA:=_frCriticaPedidoNfe.CDSRelacaoCriticaDS_OBSERVACAO_COMPRADOR.AsString;
  NM_FORNECEDOR:=_frCriticaPedidoNfe.CDSRelacaoCriticaNOMP_P.AsString;
  NRO_NOTA_FISCAL:=_frCriticaPedidoNfe.CDSRelacaoCriticaNR_NOTA_FISCAL.AsString;
  NRO_PEDIDO_COMPRA:=_frCriticaPedidoNfe.CDSRelacaoCriticaNR_PEDIDO_GAM.AsString;
  NOME_COMPRADOR:=_frCriticaPedidoNfe.CDSRelacaoCriticaNM_COMPRADOR_REDUZIDO.AsString;
  Caption:=' FORNECEDOR: '+ NM_FORNECEDOR + ' PEDIDO DE COMPRA: '+ NRO_PEDIDO_COMPRA ;
end;

function T_frVisualizaCriticaNFe.ItemDivergenciaAberto(sqOrdem : string ): widestring;
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

procedure T_frVisualizaCriticaNFe.GravaMotivoDivergencia(nrItem,cdSolucao:string);
var
  sql : string;
begin
  if ID_MULT_DIVERVENCIA = false then
  begin
    sql:='UPDATE PRDDM.DC_COMPRA_ITEM_CRITICA_ENTRADA SET CD_COMPRA_SOLUCAO_DIVERGENCIA = :CD_COMPRA_SOLUCAO_DIVERGENCIA,DT_ATUALIZACAO = SYSDATE WHERE SQ_ORDEM = :ORDEM AND NR_ITEM_ORDEM = :NR_ITEM ';
    SQLGenenicaSIPROD.Close;
    SQLGenenicaSIPROD.SQL.Clear;
    SQLGenenicaSIPROD.SQL.Text:=sql;
    SQLGenenicaSIPROD.ParamByName('CD_COMPRA_SOLUCAO_DIVERGENCIA').AsString:=cdSolucao;
    SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
    SQLGenenicaSIPROD.ParamByName('NR_ITEM').AsString:=nrItem;
    SQLGenenicaSIPROD.ExecSQL();
  end;

  if ID_MULT_DIVERVENCIA = true then
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

procedure T_frVisualizaCriticaNFe.DadosCritica;
begin
  CDSItemCritica.Close;
  SQLItemCritica.Params[0].AsString:=NRO_ORDEM;
  CDSItemCritica.Open;

  QTD_ITEM_CRITICA:=inttostr(CDSItemCritica.RecordCount);

  if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 4) or (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 6)) then
    CheckBoxAlteraPedido.Enabled:=true
  else
    CheckBoxAlteraPedido.Enabled:=false;

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

procedure T_frVisualizaCriticaNFe.MudaStatusGED(cdstatus,nrPedidoCompra,cdDivergencia:integer;nrChaveNFe:string);
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
      if cdDivergencia = 6 then
        situacao:='N'
      else
      begin
        case cdstatus of
          1 : situacao:='N';
          2 : situacao:='A';
          3 : situacao:='L';
          4 : situacao:='B';
          5 : situacao:='N';
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

procedure T_frVisualizaCriticaNFe.MudaStatusCritica(cdStatus,sqOrdem,id_destino_msg,nrPedidoCompra:integer;obsComprador:WideString);
var
  sql : string;
begin
  try
    if nrPedidoCompra > 0 then
    begin
      sql:='UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET DS_OBSERVACAO_COMPRADOR = :OBS_COMPRADOR, ';
      sql:=sql + 'ID_SITUACAO_CRITICA = :CD_STATUS, NR_PEDIDO_GAM = :NR_PEDIDO, DT_LIBERACAO = SYSDATE ,NM_USUARIO = :USUARIO,ID_DESTINATARIO_MSG = :ID_DESTINO_MSG WHERE SQ_ORDEM = :ORDEM ';

      SQLGenenicaSIPROD.Close;
      SQLGenenicaSIPROD.SQL.Clear;
      SQLGenenicaSIPROD.SQL.Text:=sql;
      SQLGenenicaSIPROD.ParamByName('OBS_COMPRADOR').AsString:=obsComprador;
      SQLGenenicaSIPROD.ParamByName('CD_STATUS').AsString:=inttostr(cdStatus);
      SQLGenenicaSIPROD.ParamByName('NR_PEDIDO').AsString:=inttostr(nrPedidoCompra);
      SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
      SQLGenenicaSIPROD.ParamByName('USUARIO').AsString:=NOME_COMPRADOR;
      SQLGenenicaSIPROD.ParamByName('ID_DESTINO_MSG').AsString:=inttostr(id_destino_msg);
      SQLGenenicaSIPROD.ExecSQL();
    end
    else
    begin
      sql:='UPDATE PRDDM.DC_COMPRA_CRITICA_ENTRADA SET DS_OBSERVACAO_COMPRADOR = :OBS_COMPRADOR, ';
      sql:=sql + 'ID_SITUACAO_CRITICA = :CD_STATUS,DT_LIBERACAO = SYSDATE ,NM_USUARIO = :USUARIO,ID_DESTINATARIO_MSG = :ID_DESTINO_MSG WHERE SQ_ORDEM = :ORDEM ';

      SQLGenenicaSIPROD.Close;
      SQLGenenicaSIPROD.SQL.Clear;
      SQLGenenicaSIPROD.SQL.Text:=sql;
      SQLGenenicaSIPROD.ParamByName('OBS_COMPRADOR').AsString:=obsComprador;
      SQLGenenicaSIPROD.ParamByName('CD_STATUS').AsString:=inttostr(cdStatus);
      SQLGenenicaSIPROD.ParamByName('ORDEM').AsString:=NRO_ORDEM;
      SQLGenenicaSIPROD.ParamByName('USUARIO').AsString:=NOME_COMPRADOR;
      SQLGenenicaSIPROD.ParamByName('ID_DESTINO_MSG').AsString:=inttostr(id_destino_msg);
      SQLGenenicaSIPROD.ExecSQL();
    end;
  except
    ShowMessage('OCORREU UM PROBLEMA AO MUDAR STATUS DA CRITICA');
  end;

end;

procedure T_frVisualizaCriticaNFe.btSalvarClick(Sender: TObject);
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
  msgObsComprador : WideString;
begin
  nrPedidoCompra:=StrToIntDef(edPedidoCompra.Text,0);
  {
  if nrPedidoCompra = 0 then
  begin
    ShowMessage('INFORME UM NUMERO DE PEDIDO VÁLIDO!');
    edPedidoCompra.SetFocus;
    exit;
  end;
  }
  if ((length(cbSituacaoCritica.Text) = 0) or (cbSituacaoCritica.Text = 'INFORME A SITUAÇÃO')) then
  begin
    ShowMessage('ESCOLHA A SITUAÇÃO DA CRITICA NA LISTA DE OPÇÕES');
    cbSituacaoCritica.SetFocus;
    exit;
  end;
  cdSituacao:=strtoint(copy(cbSituacaoCritica.Text,1,3));

  for I:= 0 to mmObsComprador.Lines.Count do
    msgObsComprador:=msgObsComprador + trim(UpperCase(mmObsComprador.Lines.Strings[I])) + ' ';

  if Length(msgObsComprador) = 0 then
  begin
    ShowMessage('OBSERVAÇÃO DO COMPRADOR É UMA INFORMAÇÃO OBRIGATÓRIA.');
    mmObsComprador.SetFocus;
    exit;
  end;

  // ENVIA EMAIL COM A OBSERVAÇÃO DO COMPRADOR PARA O SETOR INDICADO
  id_DestinoMsg:=0;
  case rgEnviaMSG.ItemIndex of
    1 : begin
          id_DestinoMsg:=1;
          sendEmail(NRO_NOTA_FISCAL,NM_FORNECEDOR,msgObsComprador,id_DestinoMsg);
        end;
    2 : begin
          id_DestinoMsg:=2;
          sendEmail(NRO_NOTA_FISCAL,NM_FORNECEDOR,msgObsComprador,id_DestinoMsg);
        end;
  end;

  try
    MudaStatusCritica(cdSituacao,StrToInt(NRO_ORDEM),id_DestinoMsg,nrPedidoCompra,msgObsComprador);
    MudaStatusGED(cdSituacao,nrPedidoCompra,CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger,NRO_CHAVE_NFE);
    rgEnviaMSG.Enabled:=false;
    mmObsComprador.Clear;
    Label3.Enabled:=false;
    cbSituacaoCritica.Enabled:=false;
    btSalvar.Enabled:=false;
    close;
  except
    ShowMessage('ERRO AO MUDAR STATUS DA CRITICA');
  end;
end;

procedure T_frVisualizaCriticaNFe.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure T_frVisualizaCriticaNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frVisualizaCriticaNFe:=nil;
  Action:=cafree;
end;

procedure T_frVisualizaCriticaNFe.DBGridListaCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ID_MULT_DIVERVENCIA:=false;
    if ((CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 1)  or
        (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 3)  or
        (CDSItemCriticaCD_COMPRA_DIVERGENCIA.AsInteger = 4)) then
    begin
      edCodProduto.Text:=copy(CDSItemCriticaDS_OBSERVACAO_SISTEMA.AsString,10,5);
      lbCodProduto.Enabled:=true;
      btBuscaPedido.Enabled:=true;
    end;
    solucionarDivergencia;
  end;

  if key = #27 then
    close;
end;

procedure T_frVisualizaCriticaNFe.DBGridListaCriticaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  conta_item_selecao : integer;
  lista_itens_tela  : string;
  confItemselecionado : string;
begin
  if key = VK_F1 then
  begin
    if formexiste(_frVisualizaDanfe) = false then
    begin
      _frVisualizaDanfe:= T_frVisualizaDanfe.create(self);
    end
    else
    begin
      _frVisualizaCriticaNFe.windowstate := wsnormal;
      _frVisualizaCriticaNFe.bringtofront;
      _frVisualizaCriticaNFe.setfocus;
    end;
  end;

  if key = VK_F2 then
  begin
    if formexiste(_frVisualizaPedidoCompra) = false then
    begin
      _frVisualizaPedidoCompra:= T_frVisualizaPedidoCompra.create(self);
    end
    else
    begin
      _frVisualizaPedidoCompra.windowstate := wsnormal;
      _frVisualizaPedidoCompra.bringtofront;
      _frVisualizaPedidoCompra.setfocus;
    end;
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
          Application.MessageBox(pchar('DIVERGENCIA INVALIDA ( '+ CDSItemCriticaNR_ITEM_ORDEM.AsString+ ' )'),'ATENÇÃO',MB_ICONERROR);
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
        ID_MULT_DIVERVENCIA:=true;
        solucionarDivergencia;
      end
      else
        DBGridListaCritica.SetFocus;
    end
    else
    begin
      lista_itens_tela:='';
      LISTA_ITEM_DIVERGECIA:='';
      Application.MessageBox(pchar('DIVERGENCIAS SELECIONADOS = ' + inttostr(conta_item_selecao) + ' ( MAX = 25 )'),'ATENÇÃO',MB_ICONERROR);
      DBGridListaCritica.SetFocus;
    end;
  end;
end;

procedure T_frVisualizaCriticaNFe.cbSolucaoCriticaKeyPress(Sender: TObject;
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
    if ((Length(cbSolucaoCritica.Text) > 0) and (cbSolucaoCritica.Text <> 'INFORME O MOTIVO DA DIVERGÊNCIA')) then
    begin
      GravaMotivoDivergencia(NR_ITEM_OBS,copy(cbSolucaoCritica.Text,1,3));
      CDSItemCritica.Close;
      SQLItemCritica.Params[0].AsString:=NRO_ORDEM;
      CDSItemCritica.Open;
      CDSItemCritica.Bookmark:=BOOKMARK;

      // TESTA SE É A ULTIMA DIVERGENCIA E SE TODAS FORAM CRITICADAS
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

procedure T_frVisualizaCriticaNFe.mmObsCompradorChange(Sender: TObject);
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

procedure T_frVisualizaCriticaNFe.mmObsCompradorEnter(Sender: TObject);
begin
  Label6.Visible:=true;
end;

procedure T_frVisualizaCriticaNFe.mmObsCompradorExit(Sender: TObject);
begin
  Label6.Visible:=false;
end;

procedure T_frVisualizaCriticaNFe.mmObsCompradorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    //cbSituacaoCritica.Text:='INFORME A SITUAÇÃO';
    cbSituacaoCritica.SetFocus;
  end;

  if key = #27 then
  begin
    mmObsComprador.Clear;
    Label6.Caption:='( 200 )';
    Application.ProcessMessages;
  end;

end;

procedure T_frVisualizaCriticaNFe.cbSituacaoCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btSalvar.SetFocus;
    btSalvar.Click;
  end;
end;

procedure T_frVisualizaCriticaNFe.edPedidoCompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    cbSolucaoCritica.Text:='INFORME O MOTIVO DA DIVERGÊNCIA';
    cbSolucaoCritica.Enabled:=true;
    cbSolucaoCritica.SetFocus;
  end;
end;

procedure T_frVisualizaCriticaNFe.FormShow(Sender: TObject);
begin
  ID_PEDIDO_ATUAL:=true;
  ID_MULT_DIVERVENCIA:=false;
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
end;

procedure T_frVisualizaCriticaNFe.btBuscaPedidoClick(Sender: TObject);
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
    Application.MessageBox(pchar('NENHUM PEDIDO DE COMPRA EM ABERTO '+ #13 + 'CONTENDO ESTE PRODUTO.'),'ATENÇÃO',MB_ICONERROR);
    cbSolucaoCritica.SetFocus;
  end;
end;

procedure T_frVisualizaCriticaNFe.DBGridBuscaPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ID_PEDIDO_ATUAL:=false;
    if formexiste(_frVisualizaPedidoCompra) = false then
    begin
      _frVisualizaPedidoCompra:= T_frVisualizaPedidoCompra.create(self);
    end
    else
    begin
      _frVisualizaPedidoCompra.windowstate := wsnormal;
      _frVisualizaPedidoCompra.bringtofront;
      _frVisualizaPedidoCompra.setfocus;
    end;
  end;

  if key = #27 then
  begin
    DBGridBuscaPedido.Visible:=false;
    cbSolucaoCritica.SetFocus;
  end;
end;

procedure T_frVisualizaCriticaNFe.Button1Click(Sender: TObject);
begin
  if formexiste(_frHistoricoCriticaNFe) = false then
  begin
    _frHistoricoCriticaNFe:= T_frHistoricoCriticaNFe.create(self);
  end
  else
  begin
    _frHistoricoCriticaNFe.windowstate := wsnormal;
    _frHistoricoCriticaNFe.bringtofront;
    _frHistoricoCriticaNFe.setfocus;
  end;
end;

procedure T_frVisualizaCriticaNFe.btAlterarPedidoCompraClick(
  Sender: TObject);
var
  nrPedido : integer;
begin
  try
    nrPedido:=strtoint(edNovoPedidoCompra.Text);
  except
    Application.MessageBox('NUMERO DE PEDIDO INVALIDO','ATENÇÃO',MB_ICONERROR);
    edNovoPedidoCompra.SetFocus;
    exit;
  end;

  if MessageDlg(' A CRITICA DEVERÁ SER INATIVADA APÓS ESSE PROCESSO ! ' + #13 +
                ' DESEJA REALMENTE MUDAR O PEDIDO DE COMPRA ?',mtConfirmation,mbOKCancel,0) = idOK then
  begin
    try
      // ALTERA PEDIDO DE COMPRA NO GED
      AlteraPedidoCompraGED(nrPedido);

      // MUDA TIPO DA CRITICA ( ITENS ) PARA INATIVA
      AlteraDivergenciaItem_Inativar;

      // LIBERA CRITICA PARA FINALIZACAO
      mmObsComprador.Enabled:=true;
      mmObsComprador.Clear;
      mmObsComprador.SetFocus;
      cbSituacaoCritica.Enabled:=true;
      cbSituacaoCritica.Text:='005 - INATIVA';
      Application.MessageBox('PEDIDO DE COMPRA ALTERADO COM SUCESSO','ATENÇÃO',MB_ICONEXCLAMATION);
    except
      Application.MessageBox('ERRO AO ALTERAR PEDIDO DE COMPRA','ATENÇÃO',MB_ICONERROR);
    end;
  end
  else
    Application.MessageBox('ALTERAÇÃO CANCELADA PELO USUARIO','ALTERAR PEDIDO DE COMPRA',MB_ICONERROR);


end;

procedure T_frVisualizaCriticaNFe.CheckBoxAlteraPedidoClick(Sender: TObject);
begin
  if CheckBoxAlteraPedido.Checked = false then
  begin
    lbNovoPedido.Enabled:=false;
    edNovoPedidoCompra.Enabled:=false;
    btAlterarPedidoCompra.Enabled:=false;
  end
  else
  begin
    lbNovoPedido.Enabled:=true;
    edNovoPedidoCompra.Enabled:=true;
    btAlterarPedidoCompra.Enabled:=true;
    edNovoPedidoCompra.SetFocus;
  end;
end;

procedure T_frVisualizaCriticaNFe.edNovoPedidoCompraKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btAlterarPedidoCompra.Click;
end;

end.
