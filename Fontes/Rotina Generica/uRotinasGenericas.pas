UNIT URotinasGenericas;

interface

uses
  windows,
  Classes,
  Controls,
  SqlExpr,
  Graphics,
  WinSock,
  forms,
  Dialogs,
  Messages,
  IniFiles,
  SysUtils,
  DBGrids,
  DB,
  dBClient,
  StdCtrls,
  dateUtils,
  Menus,
  UtilConexao,
  ComObj,
  Commctrl, Variants,
  DBXCommon;

 type
    TTelaSistema = record
    codigo    : integer;
    descri??o : string;
    nomeMenu  : TMenuItem;
  end;

type
  TListaPreco = record
    vlPrecoCusto,
    vlPrecoLista,
    pcReajustePreco,
    vlPrecoBase,
    PcIcmsCompra,
    PcIPILista,
    PcDescontoLista,
    pcIcmsVenda ,
    pcRepasse,
    vlBaseVenda: Double;
    nrListaPreco,
    nrVerba: Integer;
  end;

type
  TDadosEmpresa = record
    stEmpresa: string;
    stUF: String;
  end;

type
  TListaPrecoAtiva = record
    vlPrecoLista,
    vlPrecoComdesconto,
    PcIcmsCompra,
    PcDescontoAdicional: Double;
    nrListaPreco,
    nrVerba: Integer;
  end;

type
  DadosExecucao = record
  dtUltimaExecucao :Tdate;
  idFinalizou      :Boolean;
  nmArquivo        :String;
end;

type
    TCalculoPreco = record
    vlPrecoCusto,
    vlPrecoLiquido,
    vlPrecoLista,
    vlCreditoIcmsCompra,
    vtDesconto,
    pcDescontoAdcional,
    vlVerba,
    pcMundancaPreco,
    pcIPILista  : Double;
    cdListaPreco:Integer;
    nrVerba     : Integer;

  end;

type
 TCodigoValido = record
  nrCodigo     : Integer;
  nrDigito     : Integer;
 end;

type
    TDataRetorno = record
    NomeMes:String;
    DiaDaSemana:String;
    DiadoMes:Integer;
    Ano:Integer;
    NrDiaSemana:Integer;
    DataExtenso:String;
  end;
type
  TDescricaoFornecedor = Record
  nr_Fornecedor  :Integer;
  nm_Fornecedor  :String;
  end;


procedure Mensagem(strTexto: string;cdIcone:Integer);
function mensagemMult(Texto: string; Botao: TMsgDlgButtons = [mbOk]; Rotulo:String = 'Aten??o'; Icon : TMsgDlgType = mtWarning): integer;

function GeraOrdenacaoMul(tabela: TClientDataSet; Coluna, Coluna2: TField): String;
Function DataSistema: TDateTime;
Function DataEmpresa: TDateTime;
function DataExtenso(Data: TDateTime): String;
Function getIndiceMes(PnmMes: String): Integer;
function nrPedidoSequecial: Integer;
function AtualizaNrPedido: boolean;
function GeraOrdenacaoTeste(tabela: TClientDataSet;stColuna:String): String;

// function Confirma(strTexto: string): integer;
function Confirma(strTexto: string; Focobotao: Integer): Integer;
function ConfirmaIcone(RotuloAviso: string;MsgJanela:String; codidoBotao,CodigoIcon ,Focobotao: Integer): Integer;
function GetComputerNetName: string;
Function MostraCurvaItem(nrProduto, nrEmpresa: Integer): String;
function TestaConexaoBase(conecta: TSqlConnection; nrConexao: Integer): boolean;
function TrataErro(msgErro, msgAuxiliar: String): boolean;
Function Saudacao: string;
function NomeMaquina: String;
function MostraDiaPedido(stDiaspedido: String): String;
function AJustaDataPedido(dtPedido: TDATE;
  DiaPedido, DiaSemana: Integer): TDATE;
FUNCTION GetListaprecoNova(vlPrecoFornecedor, pcDescontoAbatimento: Double;
  nrListaPreco, nrProduto, nrEmpresa: Integer; idPrecoAtual: String;
  dtPedido: TDATE): TListaPreco;
procedure FormPos(Form: TForm; const Horz, Vert: byte);
Function GetNumeroVerba(Pnrverba, PnrLaboratorio: Integer): Integer;
Function GetVerbaFornecedor(Pnrverba, PnrLaboratorio: Integer): INTEGER;

function RandomKey: Integer;
function GetTempKey(Cds: TDataSet): Integer;
procedure AssignTempKey(DataSet: TDataSet);
Procedure GerarExcel(Consulta: TClientDataSet);
function Incrementa(Nome_Tabela: String; FieldName: string): Integer;
function GeraOrdenacao(tabela: TClientDataSet; Coluna: TColumn): String;
Function VersaoExe: String;
function NomedoMes(dData: TDateTime): string;
function replicate(Caracter: String; Quant: Integer): string;
function formataNumero(tamanho: Integer; Numero: string): string;
function FormataString(stri: string; intComprimento: Integer): string;
function TruncaValor(Value: Double; Casas: Integer): Double;
function insereCaracterEsquerda(Valor: String; Caracter: Char;
  tamanho: Integer): String;
function insereCaracterDireita(Valor: String; Caracter: Char;
  tamanho: Integer): String;

function HexToInt(const HexStr: string): longint;
Function DesEncripta(st:string):string;
function Encripta(st:string):string;
function AtualizaHoraMicro(diaBase,hrBase:TDateTime):boolean;
Function SetVersaoSistema(dsVersao: String; cdPrograma: Integer): boolean;
Function GetVersaoSistema(dsVersao, ipMaquina: String;cdPrograma: Integer): boolean;
Function InsereControlePrograma(PdsVersao,PdsSistema,Pnmusuario: String): boolean;
function DataUltimaCompra(PnrProduto,PcdOperadorLogistico,PnrCD:Integer):Tdate;
function InformacaoData(Data: TDateTime):TDataRetorno;
function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
function AbreDadosFornecedor(PnrFornecedor:Integer):TDescricaoFornecedor;
function ClientesComPedidoEmEspera(PcdProduto:Integer):TClientDataSet;
function ProdutosEmEspera(PnrFornecedor,PnrComporador:Integer):TClientDataSet;
function GetUltimoDiaEstoque:Integer;
Function ExtractNameSISTEMA(const Filename: String): String;
function SetDadosLeitura(PnmArquivo:String):DadosExecucao;
function CriaArquivoInicializacao(Parquivo:String; PdtLeitura:Tdate;PidFinalizou:Boolean):DadosExecucao;
function AtualizaArquivoInicializacao(Pnmarquivo:String; PdtLeitura:Tdate;PidFinalizou:Boolean):DadosExecucao;
function LendoArquivoInicializacao(PnmArquivo:String):DadosExecucao;
Procedure GerarExcelNovo(Consulta: TClientDataSet);
Procedure GerarExcelTeste(Consulta:TClientDataSet);
function TranformaStringCodigo(PstCodigo:String):TCodigoValido;
Procedure GerarArquivoCVS(Consulta: TClientDataSet;PnmArquivo:String);
function GetDataSistema: Boolean;

function MacAddress1: String;

function SetDataSistema: boolean;


{$REGION 'Auditoria Item Compra Item...'}
Function InsereItemAuditoria( PCD_AUDITORIA,
                              PCD_PRODUTO,
                              PQT_SUGERIDA,
                              PQT_COMPRADA:Integer;
                              PVL_SUGERIDO,
                              PVL_COMPRADO:Double;
                              PQT_PENDENTE,
                              PQT_ESTOQUE:Integer;
                              PVL_MEDIA_VENDA:Double;
                              PNR_DIAS_ESTOQUE,
                              PCD_EMPRESA,
                              PNR_PEDIDO_COMPRA:Integer):Boolean;
{$ENDREGION 'Auditoria Item Compra Item...'}
Function LocalizaItemAuditoria( PCD_AUDITORIA,
                                PCD_PRODUTO:Integer):Boolean;
function IDConexaoBase(PnrBase:Integer): Boolean;


Function ManutencaoItemAuditoria( PCD_AUDITORIA,
                                  PCD_PRODUTO,
                                  PQT_SUGERIDA,
                                  PQT_COMPRADA:Integer;
                                  PVL_SUGERIDO,
                                  PVL_COMPRADO:Double;
                                  PQT_PENDENTE,
                                  PQT_ESTOQUE:Integer;
                                  PVL_MEDIA_VENDA:Double;
                                  PNR_DIAS_ESTOQUE,
                                  PCD_EMPRESA,
                                  PNR_PEDIDO_COMPRA:Integer;
                                  PidInicio:Boolean):Boolean;

{$REGION 'Auditoria Item Compra Item...'}
Function ZeraItemAuditoria(PCD_AUDITORIA:Integer):Boolean;
function SetTipoCampoII(tipoCampo: TFieldType): String;
Procedure GerarTabelaArquivoCVS(PTabela:TDataSet;PstTituloRelatorio,PnmArquivo:String);
function PreencheStringTabela(tipo:String; Indice, coluna, Linha: Integer;campo: TDataSet):String;

procedure CancelaTransacoes;
procedure ConfirmaTransacoes;
procedure InicializaTransacoes;
{$REGION 'Auditoria Item Compra Item...'}
Function InsereItemAuditoriaNOVA( PCD_AUDITORIA,
                              PNR_FORNECEDOR,
                              PNR_PEDIDO_COMPRA:Integer):Boolean;
{$ENDREGION 'Auditoria Item Compra Item...'}



{$REGION 'Auditoria Compra Capa'}

Function  AuditoriaCompraCapa(PCD_AUDITORIA    :Integer;
                               PDT_AUDITORIA    :Tdate;
                               PNR_LABORATORIO  :Integer;
                               PDS_MODULO       :String;
                               PDT_AGENDA_ANT   :Tdate;
                               PDT_AGENDA_ATUAL :Tdate;
                               PDS_GRUPO_ANT    :String;
                               PDS_GRUPO_ATUAL  :String;
                               PNR_LEADTIME_ANT ,
                               PNR_LEADTIME_ATUAL:Double;
                               PDS_DIACOMPRA_ANT:String;
                               PDS_DIACOMPRA_ATUAL:String;
                               PNR_PARAM_ESTOQUE_ANT:Integer;
                               PNR_PARAM_ESTOQUE_ATUAL:Integer;
                               PQT_SUGERIDA_ANT:Integer;
                               PQT_SUGERIDA_ATUAL:Integer;
                               PQT_COMPRADA:Integer;
                               PVT_SUGERIDO_ANT,
                               PVT_SUGERIDO_ATUAL,
                               PVT_COMPRADO:Double;
                               PID_AGENDADO:String;
                               PNM_USUARIO:String;
                               PPC_DESC_FIN_ANT,
                               PPC_DESC_FIN_ATUAL,
                               PPC_DESC_COM_ANT,
                               PPC_DESC_COM_ATUAL:Double;
                               PDS_JUSTIFICATIVA:String;
                               PNR_PRAZO_ANT:Integer;
                               PNR_PRAZO_ATUAL,
                               PCD_EMPRESA,
                               PNR_PEDIDO_COMPRA:Integer): boolean;


{$ENDREGION 'Auditoria Compra Capa'}

{$REGION 'Altera Auditoria Compra Capa'}
function AlteraAuditoria(PcdAuditoria,
                         PnrFornecedor:Integer;
                         PdtAgendaAtual:TDate;
                         PqtComprada:Integer;
                         PvlComprado:Double;
                         PDS_JUSTIFICATIVA:String;
                         PNR_PRAZO_ATUAL:Integer):Boolean;
{$ENDREGION 'Altera Auditoria Compra Capa'}


{$REGION 'Altera Codigo Auditoria Compra Capa'}
function AlteraCodigoAuditoria(PcdAuditoria,
                               PcdAuditoriaNovo,
                               PnrFornecedor:Integer):Boolean;

{$endREGION 'Altera Codigo Auditoria Compra Capa'}

var
  DiaSemana: array [2 .. 6] of STRING = (
    'Segunda-feira',
    'Ter?a-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira'
  );
  MesAno: array [1 .. 13] of STRING = (
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ',
    'ATUAL'
  );

  dtSistema, dtEmpresa, dtPedido: TDATE;
  nrCompradorSistema,nrCompradorLogado: Integer;
  ipMaquina, dsNomeComputador, nmAplicacao, nmBaseDados, idServidor,
    hrSistema, pathSistema, nmArquivoPerfil,  nmUsuario, dsVersao,
    dsVersaoSistema: String;
    nmLogin:string[20];
  cdUsuarioParaPedido,
  idPrivilegio,CdUsuario ,cdUsuarioSistema, nrJanelasPedido,
    nrBase,cdSistema: Integer;
 FalhadeConexao,
  idLogado,
 idFazerLogin :Boolean;
 telaLiberada : array[0..100] of TTelaSistema;

 EnderecoMacPlaca,
 EnderecominhaPlaca:String;
 idTransacaoRAC, idTransacaoCD: TDBXTransaction;


  Const
     dsLocalPanilha='C:\PlanilhasPedidoCompras';


implementation

uses uDm;

Function DataSistema: TDateTime;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('Select SYSDATE AS DT_SISTEMA FROM DUAL');
    tempQuery.Open;
    Result := 0;
    if not tempQuery.IsEmpty then
      Result := tempQuery.FieldByName('DT_SISTEMA').AsDateTime;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

Function DataEmpresa: TDateTime;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery :=TSQLQuery.Create(nil);
    tempQuery.SQLConnection := _dm._conexao;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add ('SELECT NOME_E,CGCP_E,trunc(DATE_E) DT_EMPRESA,trunc(DAPE_E) DT_PEDIDO FROM PRDDM.DCEMP');
    tempQuery.Open;
    Result := 0;
    dtSistema := Now;
    dtEmpresa := dtSistema;
    dtPedido := dtEmpresa;
    if not tempQuery.IsEmpty then
    begin
      Result := tempQuery.FieldByName('DT_EMPRESA').AsDateTime;
      dtEmpresa := tempQuery.FieldByName('DT_EMPRESA').AsDateTime;
      dtSistema := dtEmpresa;
      dtPedido := tempQuery.FieldByName('DT_PEDIDO').AsDateTime;
    end;
  finally
    tempQuery.Close;
    freeandnil(tempQuery);
  end;

end;

function DataExtenso(Data: TDateTime): String;
{ Retorna uma data por extenso }
var
  NoDia: Integer;
  DiaDaSemana: array [1 .. 7] of String;
  Meses: array [1 .. 12] of String;
  Dia, Mes, Ano: Word;
begin
  { Dias da Semana }
  DiaDaSemana[1] := 'Domingo';
  DiaDaSemana[2] := 'Segunda-feira';
  DiaDaSemana[3] := 'Ter?a-feira';
  DiaDaSemana[4] := 'Quarta-feira';
  DiaDaSemana[5] := 'Quinta-feira';
  DiaDaSemana[6] := 'Sexta-feira';
  DiaDaSemana[7] := 'S?bado';
  { Meses do ano }
  Meses[1] := 'Janeiro';
  Meses[2] := 'Fevereiro';
  Meses[3] := 'Mar?o';
  Meses[4] := 'Abril';
  Meses[5] := 'Maio';
  Meses[6] := 'Junho';
  Meses[7] := 'Julho';
  Meses[8] := 'Agosto';
  Meses[9] := 'Setembro';
  Meses[10] := 'Outubro';
  Meses[11] := 'Novembro';
  Meses[12] := 'Dezembro';
  DecodeDate(Data, Ano, Mes, Dia);
  NoDia := DayOfWeek(Data);
  Result := DiaDaSemana[NoDia] + ', ' + IntToStr(Dia) + ' de ' + Meses[Mes] +
    ' de ' + IntToStr(Ano);
end;

function InformacaoData(Data: TDateTime):TDataRetorno;
{ Retorna uma data por extenso }
var
  Dadosdata :TDataRetorno;
  NoDia: Integer;
  DiaDaSemana: array [1 .. 7] of String;
  Meses: array [1 .. 12] of String;
  Dia, Mes, Ano: Word;
begin
  { Dias da Semana }
  Dadosdata.NomeMes:='';
  Dadosdata.DiaDaSemana:='';
  Dadosdata.DataExtenso:='';
  Dadosdata.DiadoMes:=0;
  Dadosdata.Ano:=0;
  Dadosdata.NrDiaSemana:=0;


  DiaDaSemana[1] := 'Domingo';
  DiaDaSemana[2] := 'Segunda-feira';
  DiaDaSemana[3] := 'Ter?a-feira';
  DiaDaSemana[4] := 'Quarta-feira';
  DiaDaSemana[5] := 'Quinta-feira';
  DiaDaSemana[6] := 'Sexta-feira';
  DiaDaSemana[7] := 'S?bado';
  { Meses do ano }
  Meses[1] := 'Janeiro';
  Meses[2] := 'Fevereiro';
  Meses[3] := 'Mar?o';
  Meses[4] := 'Abril';
  Meses[5] := 'Maio';
  Meses[6] := 'Junho';
  Meses[7] := 'Julho';
  Meses[8] := 'Agosto';
  Meses[9] := 'Setembro';
  Meses[10] := 'Outubro';
  Meses[11] := 'Novembro';
  Meses[12] := 'Dezembro';

  DecodeDate(Data, Ano, Mes, Dia);

  NoDia := DayOfWeek(Data);

  Dadosdata.NomeMes      :=Meses[mes];
  Dadosdata.DiaDaSemana:=DiaDaSemana[NoDia];
  Dadosdata.DataExtenso:=DiaDaSemana[NoDia] + ', '   +
                         IntToStr(Dia)      + ' de ' +
                          Meses[Mes]        + ' de ' +
                          IntToStr(Ano);
  Dadosdata.DiadoMes:=Dia;
  Dadosdata.Ano:=Ano;
  Dadosdata.NrDiaSemana:=NoDia;
  Result:=Dadosdata;

end;


// Rotina para apresentar uma caixa de mensagem.
procedure Mensagem(strTexto: string;cdIcone:Integer);
begin
  Application.BringToFront;
  Application.MessageBox(PChar(strTexto), 'Aviso do Sistema',
    mb_OK + cdIcone);
end;

// Fun??o para pedir confirma??o de uma opera??o.
function Confirma(strTexto: string; Focobotao: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(strTexto), 'Aten??o',
    mb_YesNo + mb_IconQuestion + Focobotao);
end;

function GetComputerNetName: string;
var
  buffer: array [0 .. 255] of Char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

Function MostraCurvaItem(nrProduto, nrEmpresa: Integer): String;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := TSQLQuery.Create(nil);
    tempQuery.SQLConnection := _dm._conexao;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT ID_CURVA_MERCADORIA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_COMPRA_MERCADORIA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('CD_EMPRESA =:PnrEMPRESA');
    tempQuery.SQL.Add('AND CD_MERCADORIA=:PnrProduto');
    tempQuery.ParamByName('PnrEMPRESA').AsInteger := nrEmpresa;
    tempQuery.ParamByName('PnrProduto').AsInteger := nrProduto;
    tempQuery.Open;
    Result := '';
    if not tempQuery.IsEmpty then
      Result := tempQuery.FieldByName('ID_CURVA_MERCADORIA').AsString;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

procedure FormPos(Form: TForm; const Horz, Vert: byte);
{ Horz: 1=esquerda, 2=centro, 3=direita
  Vert: 1=topo, 2=centro, 3=em baixo }
var
  R: TRect;
begin
  if not SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0) then
    R := Rect(0, 0, Screen.Width, Screen.Height);
  with Form do
    case Horz of
      1:
        Form.Left := 0;
      2:
        Form.Left := (R.Right - R.Left - Width) div 2;
      3:
        Form.Left := R.Right - Width;
    end;
  with Form do
    case Vert of
      1:
        Form.Top := 0;
      2:
        Form.Top := (R.Bottom - R.Top - Height) div 2;
      3:
        Form.Top := R.Bottom - Height;
    end;
end;

function TruncaValor(Value: Double; Casas: Integer): Double;
var
  sPot: String;
  iPot: Integer;
  x: Integer;
begin
  sPot := '1';
  for x := 1 to Casas do
    sPot := sPot + '0';
  begin
    iPot := StrToInt(sPot);
  end;
  Result := StrToInt(IntToStr(Trunc(Value * iPot))) / iPot;
end;

function TestaConexaoBase(conecta: TSqlConnection; nrConexao: Integer): boolean;
begin
  Try
    Result := true;
    _dm._conexao.Close;
    _dm._conexao.connected := false;
    _dm._conexao.CloseDataSets;
    _dm._conexao.Params.Clear;
    _dm._conexao.Params.LoadFromFile(loadConexao(nrConexao));
    _dm._conexao.connected := true;
     nmBaseDados := UpperCase(_dm._conexao.Params.Values['database']);
    _dm._conexao.Params.Names[0];;
    _dm._conexao.Params. ValueFromIndex[1];
    _dm._conexao.Params.Names[2];;
    _dm._conexao.Params.Names[3];;
    _dm._conexao.Params.Names[4];;
    _dm._conexao.Params.Names[5];;

  except
    begin
      ShowMessage('N?o Conectado Com Dados ' + conecta.ConnectionName);
      Result := false;
    end;
  end;

end;

(* ******************************************************************** *)

function TrataErro(msgErro, msgAuxiliar: String): boolean;
var
  nrErro: Integer;
begin
  nrErro := StrToIntDef(copy(msgErro, 5, 5), 0);

  case nrErro of
    913:
      begin
        Mensagem('Campos h? mais Em lado da query !!!' + #13 + msgErro + #13 +
          msgAuxiliar,64);
      end;
    1:
      begin
        Mensagem('Erro Chave Primaria. Numero J? cadastrado !!!' + #13 + msgErro
          + #13 + msgAuxiliar,64);
      end;
  else
    Mensagem(msgErro,MB_ICONERROR);
  end;

end;

(* ******************************************************************** *)
Function Saudacao: string;
begin
  Result := 'Boa-noite!';
  if (time >= 0.25) and (time < 0.5) then
    Result := 'Bom-dia!';
  if (time >= 0.5) and (time < 0.80) then
    Result := 'Boa-tarde!';
end;
(* ******************************************************************** *)

(* ******************************************************************** *)

function NomeMaquina: String;
var
  wVersionRequested: Word;
  wsaData: TWSAData;
  p: PHostEnt;
  s: array [0 .. 128] of Char;
  p2: PChar;

begin
  ///
  ///
  wVersionRequested := MAKEWORD(1, 1);
  WSAStartup(wVersionRequested, wsaData);
  ///
  GetHostName(@s, 128);
  p := GetHostByName(@s);
  Result := p^.h_Name;
end;
(* ******************************************************************** *)

(* **********  Dia de Pedido ********************************** *)
function MostraDiaPedido(stDiaspedido: String): String;
var
  MaiorDia, MenorDIA: Integer;
  FazPedido: String[1];
  dsDiapedido, dsDias: String;
  I, NrPedidoSemana: Integer;
begin

  MaiorDia := 1;
  MenorDIA := 5;
  NrPedidoSemana := 0;
  Result := '';
  for I := 1 to 5 do
  begin
    FazPedido := copy(stDiaspedido, I, 1);
    if FazPedido = '1' then
    begin
      case I of
        1:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Segunda-Feira';
            MaiorDia := 2;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
        2:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Ter?a-Feira';
            MaiorDia := 3;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
        3:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Quarta-Feira';
            MaiorDia := 4;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
        4:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Quinta_Feira';
            MaiorDia := 5;
          end;
        5:
          begin
            inc(NrPedidoSemana);
            dsDiapedido := 'Sexta-Feira';
            MaiorDia := 6;
            IF MenorDIA > MaiorDia THEN
              MenorDIA := MaiorDia;
          end;
      end;
      IF TRIM(dsDiapedido) <> '' THEN
        dsDias := dsDias + dsDiapedido + ' - '
      ELSE
        dsDias := dsDias + dsDiapedido;

      dsDias := formatfloat('00', MenorDIA) + formatfloat('00',
        MaiorDia) + dsDias;
    end;
    Result := dsDias;
  end;
end;

function AJustaDataPedido(dtPedido: TDATE;
  DiaPedido, DiaSemana: Integer): TDATE;
var
  dtAjustada: TDATE;
  diaSemanaAjustado: Word;
  dtTemp: String;
begin
  dtAjustada := dtPedido;
  if DiaSemana <> DiaPedido then
  begin
    repeat
      dtAjustada := dtAjustada - 1;
      diaSemanaAjustado := DayOfWeek(dtAjustada);
      dtTemp := DateToStr(dtAjustada);
    until diaSemanaAjustado = DiaPedido;
  end
  else
    dtAjustada := dtPedido;
  Result := dtAjustada;
end;

FUNCTION GetListaprecoNova(vlPrecoFornecedor, pcDescontoAbatimento: Double;
                          nrListaPreco,
                          nrProduto,
                          nrEmpresa: Integer; idPrecoAtual: String;
  dtPedido: TDATE): TListaPreco;
var
  QryTemp: TSQLQuery;
  vlPrecoFornecedorAnterior: Double;
begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      SQL.Add('SELECT CD_LISTA_GAM,VL_LISTA_ANTERIOR  , VL_UNITARIO_COMPRA  ,');
      SQL.Add('PC_ICMS_COMPRA,VL_BASE_COMPRA,PC_IPI_MERCADORIA,PC_MUDANCA_PRECO,PC_ICMS_VENDA,VL_BASE_VENDA');
      SQL.Add('FROM');
      SQL.Add('(SELECT CD_LISTA_GAM,VL_LISTA_ANTERIOR  , VL_UNITARIO_COMPRA ,');
      SQL.Add('nvl(PC_ICMS_COMPRA,0) as PC_ICMS_COMPRA ,nvl(VL_BASE_COMPRA,0) as VL_BASE_COMPRA,');
      SQL.Add('nvl(PC_IPI_MERCADORIA,0) as PC_IPI_MERCADORIA,NVL(PC_MUDANCA_PRECO,0) AS PC_MUDANCA_PRECO,');
      SQL.Add('nvl(PC_ICMS_VENDA,0) as PC_ICMS_VENDA , nvl(VL_BASE_VENDA,0) as VL_BASE_VENDA');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR');
      SQL.Add('WHERE');
      SQL.Add('CD_MERCADORIA=:PnrProduto');
      SQL.Add('and CD_EMPRESA=:PnrEmpresa');
      SQL.Add('and DT_MUDANCA_PRECO <=:PdtPedido');
      if nrListaPreco>0 then
      SQL.Add('CD_LISTA_GAM=:PnrLista');


      SQL.Add('order by Trunc(DT_MUDANCA_PRECO) desc)');
      SQL.Add('where');
      SQL.Add('ROWNUM<=1');

      ParamByName('PdtPedido').AsString := FormatDateTime('DD/MM/YYYY', dtPedido);

      ParamByName('PnrProduto').AsBCD := nrProduto;
      ParamByName('PnrEmpresa').Asbcd := nrEmpresa;
      if nrListaPreco>0 then
         ParamByName('PnrLista').AsBCD := nrListaPreco;

      Open;
    end;
    vlPrecoFornecedorAnterior := vlPrecoFornecedor;
    nrListaPreco := 0;
    Result.vlPrecoBase     := 0;
    Result.PcIcmsCompra    := 0;
    Result.PcIPILista      := 0;
    Result.PcDescontoLista  := 0;
    Result.pcIcmsVenda      :=0;
    Result.vlBaseVenda      :=0;
    Result.pcRepasse        :=0;
    if not QryTemp.IsEmpty then
    begin
      Result.vlPrecoLista    := QryTemp.FieldByName('VL_UNITARIO_COMPRA').AsFloat *pcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco    := QryTemp.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase     := QryTemp.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra    := QryTemp.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista      := QryTemp.FieldByName('PC_IPI_MERCADORIA').AsFloat;
      Result.pcIcmsVenda     := QryTemp.FieldByName('PC_ICMS_VENDA').AsFloat;
      Result.vlBaseVenda     := QryTemp.FieldByName('VL_BASE_VENDA').AsFloat;



        if Result.PcIcmsCompra>0 then
        Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));



      if idPrecoAtual = 'N' then
      begin
        Result.vlPrecoLista     := QryTemp.FieldByName('VL_LISTA_ANTERIOR').AsFloat  * pcDescontoAbatimento;
        Result.pcReajustePreco  := QryTemp.FieldByName('PC_MUDANCA_PRECO').AsFloat;
        Result.nrListaPreco     := QryTemp.FieldByName('CD_LISTA_GAM').AsInteger;
        Result.PcIcmsCompra    := QryTemp.FieldByName('PC_ICMS_COMPRA').AsFloat;
        Result.pcIcmsVenda     := QryTemp.FieldByName('PC_ICMS_VENDA').AsFloat;
        Result.vlBaseVenda     := QryTemp.FieldByName('VL_BASE_VENDA').AsFloat;
        if Result.PcIcmsCompra>0 then
        Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));
      end;
      if Result.pcReajustePreco < 0 then
        Result.pcReajustePreco := 0
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;



Function GetNumeroVerba(Pnrverba, PnrLaboratorio: Integer): INTEGER;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT NROV_V,STAV_V');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DCVEB');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('NROV_V>0');
   // tempQuery.SQL.Add('and STAV_V not in(''N'',''I'')');
    if Pnrverba>0 then
    begin
     tempQuery.SQL.Add('and NROV_V=:PnrVerba');
     tempQuery.ParamByName('PnrVerba').AsInteger := Pnrverba;
    end;
    if PnrLaboratorio>0 then
    begin
     tempQuery.SQL.Add('AND LABV_V=:PnrLaboratorio');
     tempQuery.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
   end;
    tempQuery.SQL.Add('ORDER BY STAV_V');
    tempQuery.Open;
    Result := 0;


    if  (not tempQuery.IsEmpty) then
    begin

     if (tempQuery.FieldByName('STAV_V').AsString='I') or (tempQuery.FieldByName('STAV_V').AsString='N') then
     begin
         Mensagem('Verba Inativa... N?o pode ser usada',MB_ICONWARNING);
         Result :=0;
     end
     else
        Result := tempQuery.FieldByName('NROV_V').AsInteger;

    end;
    if (tempQuery.IsEmpty) and (PnrVerba>0) then
        Result := 0;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;



Function GetVerbaFornecedor(Pnrverba, PnrLaboratorio: Integer): INTEGER;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT NROV_V,STAV_V');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DCVEB');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add(' LABV_V>1');
    tempQuery.SQL.Add('and STAV_V not in(''N'',''I'')');
    if Pnrverba>0 then
    begin
     tempQuery.SQL.Add('and NROV_V=:PnrVerba');
     tempQuery.ParamByName('PnrVerba').AsInteger := Pnrverba;
    end;
    if PnrLaboratorio>0 then
    begin
     tempQuery.SQL.Add('AND LABV_V=:PnrLaboratorio');
     tempQuery.ParamByName('PnrLaboratorio').AsInteger := PnrLaboratorio;
   end;
    tempQuery.SQL.Add('ORDER BY STAV_V');
    tempQuery.Open;
    Result := 0;


    if  (not tempQuery.IsEmpty) then
    begin

     if (tempQuery.FieldByName('STAV_V').AsString='I') or (tempQuery.FieldByName('STAV_V').AsString='N') then
     begin
         Mensagem('Verba Inativa... N?o pode ser usada',MB_ICONWARNING);
         Result :=0;
     end
     else
        Result := tempQuery.FieldByName('NROV_V').AsInteger;

    end;
    if (tempQuery.IsEmpty) and (PnrVerba>0) then
        Result := 0;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;


(* *************************************** *)
function RandomKey: Integer;
begin
  randomize;
  Result := random( high(Word));
end;

(* *********************************************************************************** *)
(* *********************************************************************************** *)
function GetTempKey(Cds: TDataSet): Integer;
var
  local: Integer;
begin
  repeat
    local := RandomKey;
  until not Cds.locate(Cds.Fields[0].FieldName, Local, []);
  Result := Local;
end;
(* *********************************************************************************** *)

procedure AssignTempKey(DataSet: TDataSet);
begin
  DataSet.Fields[0].AsInteger := DataSet.Tag;
  // atribui a chave tempor?ria gerada no BeforeInsert
end;

function Incrementa(Nome_Tabela: String; FieldName: string): Integer;
var
  Qry: TSQLQuery;
begin
  Qry := TSQLQuery.Create(nil); // cria uma inst?ncia do objeto
  try
    Qry.SQLConnection := _dm._conexao; // componente de conex?o
    Qry.SQL.Add('SELECT MAX(' + FieldName + ') FROM ' + Nome_Tabela);
    Qry.Open;
    if Qry.Fields[0].IsNull then // se a tabela est? vazia retornar? nulo
      Result := 1 // ent?o este ser? o primeiro registro
    else
      Result := Qry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(Qry); // tira o objeto da mem?ria
  end;
end;

(* ******************************************************************** *)
Procedure GerarExcel(Consulta: TClientDataSet);
var
  Coluna, linha: Integer;
  excel: variant;
  Valor: String;
  Data: String;
begin
  try
    excel := CreateOleObject('Excel.Application');
    excel.Workbooks.Add(1);
  except
    Application.MessageBox('Vers?o do Ms-Excel' + 'Incompat?vel', 'Erro',
      mb_OK + MB_ICONEXCLAMATION);
  end;

  Consulta.First;

  try
    Consulta.DisableControls;
    for linha := 0 to Consulta.RecordCount - 1 do
    begin
      for Coluna := 1 to Consulta.FieldCount do
      // eliminei a coluna 0 da rela??o do Excel
      begin
        // valor:= Consulta.Fields[coluna-1].value;
        // excel.cells [linha+2,coluna]:=valor;
        try // excel.cells [linha+2,coluna]:=Consulta.Fields[coluna-1].value;
          if Consulta.Fields[Coluna - 1].DataType <> ftUnknown then
          begin
            if Consulta.Fields[Coluna - 1].DataType = ftWideString then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsWideString;
            if Consulta.Fields[Coluna - 1].DataType = ftString then
            begin
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna].numberformat := '00000000000000';
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna]:= Consulta.Fields[Coluna - 1].AsString;
            end;
            if Consulta.Fields[Coluna - 1].DataType = ftinteger then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsInteger;
            if Consulta.Fields[Coluna - 1].DataType = ftFMTBcd then
            begin
//              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna].numberformat := '0000000000000000';
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=Consulta.Fields[Coluna - 1].AsFloat;
            end;
            if Consulta.Fields[Coluna - 1].DataType = ftBCD then
            begin
//              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna].numberformat := '00000000000000';
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=Consulta.Fields[Coluna - 1].AsFloat;

            end;
            if Consulta.Fields[Coluna - 1].DataType = ftFloat then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsFloat;
            if Consulta.Fields[Coluna - 1].DataType = ftTimeStamp then
            begin
              Data := FormatDateTime('mm/dd/YYYY', Consulta.Fields[Coluna - 1].AsDateTime);
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] := Data;
            end;
          end;
        except
          Mensagem(Consulta.Fields[Coluna - 1].AsString,MB_ICONERROR);
        end;

      end;
      Consulta.Next;
    end;
    Consulta.EnableControls;

    for Coluna := 1 to Consulta.FieldCount do
    // eliminei a coluna 0 da rela??o do Excel
    begin
      Valor := Consulta.Fields[Coluna - 1].DisplayLabel;
      excel.cells[1, Coluna] := Valor;
    end;
    excel.columns.AutoFit;
    // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
    excel.visible := true;
  except
    Application.MessageBox('Aconteceu um erro desconhecido durante a convers?o'
      + 'da tabela para o Ms-Excel', 'Erro', mb_OK + MB_ICONEXCLAMATION);
  end;
  // excel.quit;
end;



Procedure GerarArquivoCVS(Consulta: TClientDataSet;PnmArquivo:String);
var
 arq: TextFile;
 nrlinHa:integer;
 stLinha,stLinhaTemp:WideString;
 stLista: TStringList;
 Coluna:Integer;

 function retirarQuebraLinha(aTxt : string):string;
 begin
   atxt:=StringReplace(atxt,#13#10,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D#$A,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D,' ',[rfReplaceAll]);
   Result:=aTxt;
 end;

begin
  Consulta.Open;
  Consulta.First;

begin
  try
    AssignFile(arq,PnmArquivo );
    Rewrite(arq, PnmArquivo);



    for Coluna := 1 to Consulta.FieldCount do
        if stLinha=EmptyStr then
          stLinha:= Consulta.Fields[Coluna - 1].DisplayLabel
        else
         stLinha:= stLinha +';'+ Consulta.Fields[Coluna - 1].DisplayLabel;


       Writeln(arq,stLinha);
    Consulta.first;
    while not Consulta.Eof do
    begin
      stLinha:=EmptyStr;
      for Coluna := 1 to Consulta.FieldCount do
      begin

         if Consulta.Fields[Coluna - 1].DataType <> ftUnknown then
          begin
            if Consulta.Fields[Coluna - 1].DataType = ftWideString then
               if stLinha=EmptyStr then
                 stLinha := Consulta.Fields[Coluna - 1].AsWideString
               else
                 stLinha := stLinha +';'+Consulta.Fields[Coluna - 1].AsWideString;
            if Consulta.Fields[Coluna - 1].DataType = ftString then
            begin
               if stLinha=EmptyStr then
                 stLinha := Consulta.Fields[Coluna - 1].AsString
               else
                 stLinha := stLinha +';'+ Consulta.Fields[Coluna - 1].AsString;
            end;

            if Consulta.Fields[Coluna - 1].DataType = ftinteger then
            begin
              if stLinha=EmptyStr then
                stLinha := FormatFloat('00000000',Consulta.Fields[Coluna - 1].AsInteger)
              else
                stLinha := stLinha +';'+  FormatFloat('00000000',Consulta.Fields[Coluna - 1].AsInteger);
            end;
            if Consulta.Fields[Coluna - 1].DataType = ftFMTBcd then
               if stLinha=EmptyStr then
                 stLinha :=  FormatFloat('00000000.00',Consulta.Fields[Coluna - 1].AsFloat)
                else
                 stLinha := stLinha +';'+  FormatFloat('00000000.00',Consulta.Fields[Coluna - 1].AsFloat);
            if Consulta.Fields[Coluna - 1].DataType = ftBCD then
               if stLinha=EmptyStr then
                  stLinha := FormatFloat('00000000.00',Consulta.Fields[Coluna - 1].AsFloat)
               else
                 stLinha := stLinha +';'+FormatFloat('00000000.00',Consulta.Fields[Coluna - 1].AsFloat);


            if Consulta.Fields[Coluna - 1].DataType = ftFloat then
              if stLinha=EmptyStr then
                stLinha := FormatFloat('00000000.00',Consulta.Fields[Coluna - 1].AsFloat)
              else
                stLinha := stLinha +';'+ FormatFloat('00000000.00',Consulta.Fields[Coluna - 1].AsFloat);

            if Consulta.Fields[Coluna - 1].DataType = ftTimeStamp then
               if stLinha=EmptyStr then
                  stLinha := FormatDateTime('dd/mm/yyyy',Consulta.Fields[Coluna - 1].AsDateTime)
                else
                  stLinha := stLinha +';'+ FormatDateTime('dd/mm/yyyy',Consulta.Fields[Coluna - 1].AsDateTime);
          end;
          end;


          Writeln(arq,stLinha);




      Consulta.Next;
    end;
    CloseFile(arq);

    //ShellExecute(Handle, 'Open',PnmArquivo , nil, 'C:\TEMP\', SW_SHOWNORMAL);
  finally

  end;



end;
end;


(* ***** *)
function GeraOrdenacao(tabela: TClientDataSet; Coluna: TColumn): String;
Var
  indice: string;
  idDec: boolean;
begin
  indice := Coluna.FieldName + IntToStr(random(9999));
  if tabela.IndexDefs.Count > 0 then
  begin
    if (ixDescending in tabela.IndexDefs[0].Options) then
      idDec := true
    else
      idDec := false;
  end
  else
    idDec := true;
  tabela.IndexDefs.Clear;
  if not idDec then
    tabela.IndexDefs.Add(indice, Coluna.FieldName, [ixDescending])
  else
    tabela.IndexDefs.Add(indice, Coluna.FieldName, []);
  tabela.IndexName := indice;
  tabela.First;
  Result := indice;
end;


function GeraOrdenacaoTeste(tabela: TClientDataSet;stColuna:String): String;
Var
  indice: string;
  idDec: boolean;
begin
  indice := stColuna + IntToStr(random(9999));
  if tabela.IndexDefs.Count > 0 then
  begin
    if (ixDescending in tabela.IndexDefs[0].Options) then
      idDec := true
    else
      idDec := false;
  end
  else
    idDec := true;
  tabela.IndexDefs.Clear;
  if not idDec then
    tabela.IndexDefs.Add(indice, stColuna, [ixDescending])
  else
    tabela.IndexDefs.Add(indice, stColuna, []);
  tabela.IndexName := indice;
  tabela.First;
  Result := indice;
end;


function GeraOrdenacaoMul(tabela: TClientDataSet;
  Coluna, Coluna2: TField): String;
Var
  indice: string;
  idDec: boolean;
begin
  indice := Coluna.FieldName + ';' + Coluna2.FieldName + IntToStr(random(9999));
  if tabela.IndexDefs.Count > 0 then
  begin
    if (ixDescending in tabela.IndexDefs[0].Options) then
      idDec := true
    else
      idDec := false;
  end
  else
    idDec := true;
  tabela.IndexDefs.Clear;
  if not idDec then
    tabela.IndexDefs.Add(indice, Coluna.FieldName + ';' + Coluna2.FieldName,
      [ixDescending])
  else
    tabela.IndexDefs.Add(indice, Coluna.FieldName + ';' +
      Coluna2.FieldName, []);
  tabela.IndexName := indice;
  tabela.First;
  Result := indice;
end;

{$REGION 'Pegar a Vers?o do Sistema'}

Function VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: dword;
  Len: Longint;
  Data: PChar;
  buffer: Pointer;
  tamanho: dword;
  Parquivo: PChar;
  Arquivo: String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', buffer, tamanho);
      F := PFFI(buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs),
        LoWord(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;
{$ENDREGION}
(* *************************************************************** *)
// Retorna o nome do mee, em extenso, de uma determinada data

function NomedoMes(dData: TDateTime): string;
var
  nAno, nMes, nDia: Word;
  cMes: array [1 .. 12] of string;
begin
  cMes[01] := 'Janeiro';
  cMes[02] := 'Fevereiro';
  cMes[03] := 'Mar?o';
  cMes[04] := 'Abril';
  cMes[05] := 'Maio';
  cMes[06] := 'Junho';
  cMes[07] := 'Julho';
  cMes[08] := 'Agosto';
  cMes[09] := 'Setembro';
  cMes[10] := 'Outubro';
  cMes[11] := 'Novembro';
  cMes[12] := 'Dezembro';
  DecodeDate(dData, nAno, nMes, nDia);
  if (nMes >= 1) and (nMes <= 13) then
  begin
    Result := cMes[nMes];
  end
  else
  begin
    Result := '';
  end;
end;

// Rotina para repetir Um caracter
function replicate(Caracter: String; Quant: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Quant do
    Result := Result + Caracter;
end;

// Formata Numero
function formataNumero(tamanho: Integer; Numero: string): string;
var
  I, tam: Integer;
begin
  Result := '';
  tam := Length(Numero);
  for I := 1 to tamanho - tam do
    Numero := ' ' + Numero;
  Result := Numero;
end;

(* *************************************** *)
function FormataString(stri: string; intComprimento: Integer): string;
var
  strValor, strZeros, strRetorno: string;
  intTamanho, intContador: Integer;
begin
  strValor := stri;
  intTamanho := Length(TRIM(strValor));
  strZeros := '';
  for intContador := 1 to intComprimento - intTamanho do
    strZeros := strZeros + ' ';
  strRetorno := strValor + strZeros;
  Result := strRetorno;
end;

(* *************************************** *)

Function getIndiceMes(PnmMes: String): Integer;
var
  I: Integer;
begin
  for I := 1 to 13 do
  begin
    if MesAno[I] = PnmMes then
    begin
      Result := I;
      break;
    end;
  end;
end;

function insereCaracterEsquerda(Valor: String; Caracter: Char;
  tamanho: Integer): String;
Var
  I: Integer;
begin
  Result := '';
  if (tamanho - Length(Valor)) <= 0 then
  begin
    Result := Valor;
    Exit;
  end;
  for I := 1 to tamanho - Length(Valor) do
  begin
    Result := Result + Caracter;
  end;
  Result := Result + Valor;
end;

function insereCaracterDireita(Valor: String; Caracter: Char;
  tamanho: Integer): String;
Var
  I: Integer;
begin
  Result := '';
  if (tamanho - Length(Valor)) <= 0 then
  begin
    Result := Valor;
    Exit;
  end;
  for I := 1 to tamanho - Length(Valor) do
  begin
    Result := Result + Caracter;
  end;
  Result := Valor + Result;
end;

function AtualizaNrPedido: boolean;
var
  tempQuery: TSQLQuery;
  nrTestt: Integer;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('update PRDDM.DCTAB set NOMT_T=NOMT_T+1');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('NROT_T=0');
    tempQuery.SQL.Add('AND TIPT_T=''0''');
    Result := true;
    if tempQuery.ExecSQL(false) < 0 then
      Result := false;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

function nrPedidoSequecial: Integer;
var
  tempQuery: TSQLQuery;
begin
  if AtualizaNrPedido then
  begin
    tempQuery := nil;
    try
      tempQuery := _dm.criaQueryGenerica;
      tempQuery.SQL.Clear;
      tempQuery.SQL.Add('SELECT NOMT_T');
      tempQuery.SQL.Add('FROM');
      tempQuery.SQL.Add('PRDDM.DCTAB');
      tempQuery.SQL.Add('WHERE');
      tempQuery.SQL.Add('NROT_T=''0''');
      tempQuery.SQL.Add('AND TIPT_T=''0''');
      tempQuery.Open;
      Result := 0;
      if not tempQuery.IsEmpty then
        Result := StrToIntDef(TRIM(tempQuery.FieldByName('NOMT_T')
          .AsString), 0);
    finally
      tempQuery.Close;
      tempQuery.Free;
    end;
  end;
end;

function mensagemMult(Texto: string; Botao: TMsgDlgButtons = [mbOk]; Rotulo:String = 'Aten??o'; Icon : TMsgDlgType = mtWarning): integer;
var
  wl_mensagem: TForm;
begin

  wl_Mensagem := CreateMessageDialog(Texto, Icon, Botao);

  (wl_mensagem.FindComponent('YES') as TButton).Caption := '&Sim';
  (wl_mensagem.FindComponent('NO') as TButton).Caption  := '&N?o';
  (wl_mensagem.FindComponent('OK') as TButton).Caption  := '&Ok';
  (wl_mensagem.FindComponent('CANCEL') as TButton).Caption  := '&Cancela';

  wl_mensagem.Color := clBtnFace;
  wl_mensagem.BorderStyle := bsSingle;
  wl_mensagem.BorderIcons := [];

  wl_mensagem.Caption := Rotulo;

  result := wl_mensagem.ShowModal;
end;


(**********************************************************************)


{$Region 'Encripta String Hexadecimal'}
function Encripta(st:string):string;
var
   stc : string;
   i, n : integer;
   chave : byte;
begin
   Result := '';
   Randomize;
   chave := Random(255);

   stc:=IntToHex((23 xor chave),2);
   if Length(st) > 0 then
   begin
      n := Length(st);
      for i := 1 to n do
      begin
         Result := Result + IntToHex(chave xor (ord(st[i])+i),2)
      end;
   Result := stc+Result;
   end;
end;
(*******************************************************)

(*******************************************************)
Function DesEncripta(st:string):string;
var
   i, n : integer;
   chave : byte;
   Caracter : String[2];
begin
   Result := '';
   if Length(st) > 0 then
   begin
      Caracter := Copy(st,1,2);
      chave := 23 xor ord(HexToInt(Caracter));

      n:=length(st);
      n := n div 2;
      st := Copy(st,3,length(st));
      for i := 1 to n-1 do
      begin
        Caracter := Copy(st,1,2);
        st := Copy(st,3,length(st));
        Caracter := chr((Chave xor ord(HexToInt(Caracter))-i));
        Result   := Result + Caracter;
      end;
   end;
end;
(*******************************************************)
(*******************************************************)
function HexToInt(const HexStr: string): longint;
var
  iNdx: integer;
  cTmp: Char;
begin
  Result := 0;
  for iNdx := 1 to Length(HexStr) do
  begin
    cTmp := HexStr[iNdx];
    case cTmp of
    '0'..'9': Result := 16 * Result + (Ord(cTmp) - $30);
    'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37);
    'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57);
    else
      raise EConvertError.Create('Senha Com Caracter Inv?lido !!!');
    end;
  end;
end;
(*******************************************************)

function GetDataSistema: Boolean;
VAR
  QryTemp: TSQLQuery;
  dtLocal: TDate;
BEGIN
  TRY
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp.SQLConnection := _dm._conexao;
      with QryTemp do
      begin
        close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('TO_CHAR(DT_EMPRESA,  ''dd/mm/yyyy'') AS DT_EMPRESA,');
        SQL.Add('NM_EMPRESA , TO_CHAR(DT_PEDIDO,''dd/mm/yyyy'') AS DT_PEDIDO,');
        SQL.Add('DT_EMPRESA,');
        SQL.Add('TO_CHAR(SYSDATE, ''HH24:MI:ss'') as HORA,ID_HORARIO');
        SQL.Add('HR_TOLERANCIA_HORARIO,VL_TAXA_JURO_DIARIO,PC_TAXA_JURO ,PC_TAXA_JURO');
        SQL.Add('FROM');
        SQL.Add('acesso.dc_empresa');
        SQL.Add('WHERE cd_empresa=1');;
        open;
      end;
      Result := false;
    except
      on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        Mensagem('Erro Na Consulta Base...' + #13 +
          'O sistema Sera Finalizado', 16);
      end;

    end;
    dtLocal := Date;
    //  dtLocal := strtodate('02/08/2018');
    if not QryTemp.IsEmpty then
    begin
      Result := true;
      dtSistema := QryTemp.fieldByName('DT_EMPRESA').AsDateTime;
      hrSistema := QryTemp.fieldByName('HORA').AsString;
      if dtSistema >= dtLocal then
      begin
        Result := true;
      end
      else
      begin
        dtSistema := Date;
        hrsistema := FormatDateTime('HH:MM:SS', now);
        Result := false;
      end;
    end;
  finally
    FreeAndNil(QryTemp);
  end;
end;
{$ENDREGION  'Set Data Sistema'}





function AtualizaHoraMicro(diaBase,hrBase:TDateTime):boolean;
var
 SystemTime : TSystemTime;
 Ano, Mes, Dia,
 hora,Minuto,Segundo,milSegundo : word;

begin
  decodeDate(DiaBase,ano,mes,dia);
  DecodeTime(hrBase,hora,Minuto,Segundo,milSegundo);
  With SystemTime do
  begin
  //Definindo o dia do sistema
    wYear  := Ano;
    wMonth := Mes;
    wDay   := Dia;
   //Definindo a hora do sistema
    wHour  := hora; //hora
    wMinute:= Minuto; //minutos
    wSecond:= Segundo; //segundos
  end;
  //Colocar a hora e data do sistema
   SetLocalTime(SystemTime);
end;

Function GetVersaoSistema(dsVersao, ipMaquina: String;
  cdPrograma: Integer): boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  result:=true;
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT DT_VALIDADE_INICIAL,CD_PROGRAMA,');
    tempQuery.SQL.Add('DS_VERSAO,ID_ATUALIZACAO_VERSAO ,');
    tempQuery.SQL.Add('ID_SITUACAO FROM PRDDM.DC_CONTROLE_VERSAO');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('CD_PROGRAMA=:PnrPrograma');
    tempQuery.ParamByName('PnrPrograma').AsInteger := cdPrograma;
    tempQuery.Open;
    Result := False;
    if (tempQuery.IsEmpty)and
       ((EnderecoMacPlaca=EnderecominhaPlaca)) then
    begin
      if confirma('Deseja Inserir o Sistema no controle Vers?o?',MB_DEFBUTTON1)=idyes then
      begin
        InsereControlePrograma(dsVersao,'Sistema de Compras MultiEmpresa',nmLogin)

      end;


    end;

    if not tempQuery.IsEmpty then
    begin
      dsVersaoBase := Trim(tempQuery.fieldbyName('DS_VERSAO').AsString);
      if dsVersaoBase = dsVersao then
        Result := True
      else
      begin
        if (EnderecoMacPlaca=EnderecominhaPlaca) then
         begin
          Result := false;
          if  Confirma('Atualiza Nr. de versao ?',MB_DEFBUTTON2)=idYes then
          begin
            if SetVersaoSistema(dsVersao,cdPrograma) then
            begin
            Result := true;
            Mensagem('Vers?o  foi Atualizada!!!',MB_ICONINFORMATION);
            exit;
            end;
          end;
         end;

        Mensagem('Vers?o N?o foi Atualizada!!!' + #13 +
          '******** VERSAO PROGRAMA= ' + Trim(dsVersao) + '*******' + #13 +
          '******** VERSAO DA BASE = ' + Trim(dsVersaoBase) + '*********' + #13
          + '***** O Programa ser? encerrado !!!        ********' + #13 +
          '***************************************************' + #13 +
          '***************************************************',64);
        //if Confirma('Sair Do Sistema ? ', MB_DEFBUTTON2) = IDYES then
        result:=false;
      end;
    end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;

Function SetVersaoSistema(dsVersao: String; cdPrograma: Integer): boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('UPDATE  PRDDM.DC_CONTROLE_VERSAO');
    tempQuery.SQL.Add('SET  DS_VERSAO=:PdsVersao');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('CD_PROGRAMA=:PnrPrograma');
    tempQuery.ParamByName('PdsVersao').AsString := dsVersao;
    tempQuery.ParamByName('PnrPrograma').AsInteger := cdPrograma;
    Result := True;
    if tempQuery.ExecSQL(False) <= 0 then
      Result := False
    else
      Mensagem('Nr. da Vers?o foi Atualizada na Base!!!',64);
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;

Function InsereControlePrograma(PdsVersao,PdsSistema,Pnmusuario: String): boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('INSERT INTO PRDDM.DC_CONTROLE_VERSAO');
    tempQuery.SQL.Add('(DT_VALIDADE_INICIAL, CD_PROGRAMA, DS_VERSAO,');
    tempQuery.SQL.Add('ID_ATUALIZACAO_VERSAO, ID_SITUACAO, DS_MUDANCA_VERSAO,');
    tempQuery.SQL.Add('DT_ATUALIZACAO, NM_USUARIO)');
    tempQuery.SQL.Add('VALUES (SYSDATE ,(SELECT Max(CD_PROGRAMA)+1');
    tempQuery.SQL.Add('FROM prddm.dc_controle_versao),:PdsVersao,''S'',''A'',');
    tempQuery.SQL.Add(':PdsSistema,SYSDATE,:PnmUsuario)');
    tempQuery.ParamByName('PdsVersao').AsString := PdsVersao;
    tempQuery.ParamByName('PdsSistema').AsString := PdsSistema;
    tempQuery.ParamByName('PnmUsuario').AsString := PnmUsuario;
    Result := false;
    if tempQuery.ExecSQL(False) = 1 then
      Result := true
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
// Fun??o para pedir confirma??o de uma opera??o.
function ConfirmaIcone(RotuloAviso: string;MsgJanela:String; codidoBotao,CodigoIcon ,Focobotao: Integer): Integer;
(*
  Botoes
      0 Mostra o bot?o OK  mb_ok
      1 Mostra os bot?es OK e Cancela mb_okCancel
      2 Mostra os bot?es Anular, Repetir e ignorar mb_AbortRetryIgnore
      3 Mostra os bot?es Sim, N?o e Cancelar  mb_YesNoCancel
      4 Mostra os bot?es Sim e N?o mb_YesNo
      5 Mostra os bot?es Repetir e Cancelar  mb_RetryCancel
      Incones
      16 Mostra ?cone de parada cr?tica  mb_iconstop
      32 Mostra ?cone de interroga??o mb_iconquestion
      48 Mostra ?cone de exclama??o mb_iconexclamation
      64 Mostra ?cone de informa??o mb_iconinformation
  Posicao
       0 Coloca o 1? bot?o em foco  mb_defbutton1
     256 Coloca o 2? bot?o em foco mb_defbutton2
     512 Coloca o 3? bot?o em foco mb_defbutton3
  Tipo Janela
       0 Coloca a janela de forma modal mb_applmodal
    4096 Coloca a janela de forma n?o modal mb_systemmodal
    8192 Id?ntico ao zero, s? que o par?metro n?mero tem que ter o valor zero  mb_taskmodal


*)

begin
  Result := Application.MessageBox(PChar(MsgJanela),pwideChar(RotuloAviso),
    codidoBotao + CodigoIcon + Focobotao);
end;

(****************************************************)
function DataUltimaCompra(PnrProduto,PcdOperadorLogistico,PnrCD:Integer):Tdate;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  tempQuery := nil;
  tempQuery := _dm.criaQueryGenerica;
   try
      with TempQuery do
      begin
        SQL.Clear;
        SQL.Add('SELECT   Nvl(Max(DT_COMPRA),''01/01/1899'') DT_ULTIMA_COMPRA');
        SQL.Add('FROM');
        SQL.Add('PRDDM.DC_COMPRA_SUMARIZADA');
        SQL.Add('WHERE');
        SQL.Add('CD_MERCADORIA=:PnrProduto');
        SQL.Add('AND CD_OPERADOR_LOGISTICO =:PcdOperador');
        SQL.Add('AND CD_EMPRESA=:PnrCD');
        ParamByName('PnrProduto').AsInteger:=PnrProduto;
        ParamByName('PcdOperador').AsInteger:=PcdOperadorLogistico;
        ParamByName('PnrCD').AsInteger:=PnrCD;
        open;
      end;
      Result:=0;
      if not tempQuery.IsEmpty then
        Result:=tempQuery.FieldByName('DT_ULTIMA_COMPRA').AsDateTime;
   finally
     FreeAndNil(tempQuery);
   end;
end;


//Fun??o para substituir caracteres especiais.

function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('?', '?', '?', '?', '?','?', '?', '?', '?', '?',
                                     '?', '?','?', '?','?', '?','?', '?',
                                     '?', '?', '?','?', '?','?', '?', '?', '?', '?',
                                     '?', '?', '?','?','?', '?','?','?','?','?');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..50] of string = ('<','>','!','@','#','$','%','?','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','?','`',
                                     '?','?','?','?','?','?','?','?','?','?',
                                     '?','?','?','?','?','?','?','?','/','''');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o par?metro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 50 do
       xTexto := StringReplace(xTexto, xCarExt[i], '_', [rfreplaceall]);
   Result := xTexto;
end;


{$REGION 'Auditoria Compra Capa'}
Function  AuditoriaCompraCapa(PCD_AUDITORIA    :Integer;
                               PDT_AUDITORIA    :Tdate;
                               PNR_LABORATORIO  :Integer;
                               PDS_MODULO       :String;
                               PDT_AGENDA_ANT   :Tdate;
                               PDT_AGENDA_ATUAL :Tdate;
                               PDS_GRUPO_ANT    :String;
                               PDS_GRUPO_ATUAL  :String;
                               PNR_LEADTIME_ANT ,
                               PNR_LEADTIME_ATUAL:Double;
                               PDS_DIACOMPRA_ANT:String;
                               PDS_DIACOMPRA_ATUAL:String;
                               PNR_PARAM_ESTOQUE_ANT:Integer;
                               PNR_PARAM_ESTOQUE_ATUAL:Integer;
                               PQT_SUGERIDA_ANT:Integer;
                               PQT_SUGERIDA_ATUAL:Integer;
                               PQT_COMPRADA:Integer;
                               PVT_SUGERIDO_ANT,
                               PVT_SUGERIDO_ATUAL,
                               PVT_COMPRADO:Double;
                               PID_AGENDADO:String;
                               PNM_USUARIO:String;
                               PPC_DESC_FIN_ANT,
                               PPC_DESC_FIN_ATUAL,
                               PPC_DESC_COM_ANT,
                               PPC_DESC_COM_ATUAL:Double;
                               PDS_JUSTIFICATIVA:String;
                               PNR_PRAZO_ANT:Integer;
                               PNR_PRAZO_ATUAL,
                               PCD_EMPRESA,
                               PNR_PEDIDO_COMPRA:Integer): boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  nrErro: Integer;

begin
  tempQuery := nil;

  try
   try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('INSERT INTO PRDDM.DC_AUDITORIA_COMPRA');
    tempQuery.SQL.Add('(CD_AUDITORIA, DT_AUDITORIA, NR_LABORATORIO,');
    tempQuery.SQL.Add('DS_MODULO, DT_AGENDA_ANT, DT_AGENDA_ATUAL, DS_GRUPO_ANT,');
    tempQuery.SQL.Add('DS_GRUPO_ATUAL, NR_LEADTIME_ANT, NR_LEADTIME_ATUAL,');
    tempQuery.SQL.Add('DS_DIACOMPRA_ANT, DS_DIACOMPRA_ATUAL, NR_PARAM_ESTOQUE_ANT,');
    tempQuery.SQL.Add('NR_PARAM_ESTOQUE_ATUAL, QT_SUGERIDA_ANT,');
    tempQuery.SQL.Add('QT_SUGERIDA_ATUAL, QT_COMPRADA,VT_SUGERIDO_ANT,VT_SUGERIDO_ATUAL,');
    tempQuery.SQL.Add('VT_COMPRADO, ID_AGENDADO, NM_USUARIO,PC_DESC_FIN_ANT,');
    tempQuery.SQL.Add('PC_DESC_FIN_ATUAL, PC_DESC_COM_ANT, PC_DESC_COM_ATUAL,');
    tempQuery.SQL.Add('DS_JUSTIFICATIVA, NR_PRAZO_ANT, NR_PRAZO_ATUAL,CD_EMPRESA,NR_PEDIDO_COMPRA)');
    tempQuery.SQL.Add('VALUES');
    tempQuery.SQL.Add('(:PCD_AUDITORIA, sysdate, :PNR_LABORATORIO,');
    tempQuery.SQL.Add(':PDS_MODULO, :PDT_AGENDA_ANT, :PDT_AGENDA_ATUAL, :PDS_GRUPO_ANT,');
    tempQuery.SQL.Add(':PDS_GRUPO_ATUAL, :PNR_LEADTIME_ANT, :PNR_LEADTIME_ATUAL,');
    tempQuery.SQL.Add(':PDS_DIACOMPRA_ANT, :PDS_DIACOMPRA_ATUAL, :PNR_PARAM_ESTOQUE_ANT,');
    tempQuery.SQL.Add(':PNR_PARAM_ESTOQUE_ATUAL, :PQT_SUGERIDA_ANT,');
    tempQuery.SQL.Add(':PQT_SUGERIDA_ATUAL, :PQT_COMPRADA,:PVT_SUGERIDO_ANT,:PVT_SUGERIDO_ATUAL,');
    tempQuery.SQL.Add(':PVT_COMPRADO, :PID_AGENDADO, :PNM_USUARIO,:PPC_DESC_FIN_ANT,');
    tempQuery.SQL.Add(':PPC_DESC_FIN_ATUAL, :PPC_DESC_COM_ANT, :PPC_DESC_COM_ATUAL,');
    tempQuery.SQL.Add(':PDS_JUSTIFICATIVA, :PNR_PRAZO_ANT, :PNR_PRAZO_ATUAL,:PCD_EMPRESA,:PnrPedido)');
    tempQuery.ParamByName('PCD_AUDITORIA').AsBcd             :=PCD_AUDITORIA;
    tempQuery.ParamByName('PNR_LABORATORIO').AsBcd           :=PNR_LABORATORIO;
    tempQuery.ParamByName('PDS_MODULO').AsString                 :=copy(PDS_MODULO,1,20);
    tempQuery.ParamByName('PDT_AGENDA_ANT').AsDateTime           :=PDT_AGENDA_ANT;
    tempQuery.ParamByName('PDT_AGENDA_ATUAL').AsDateTime         :=PDT_AGENDA_ATUAL;
    tempQuery.ParamByName('PDS_GRUPO_ANT').AsString              :=PDS_GRUPO_ANT;
    tempQuery.ParamByName('PDS_GRUPO_ATUAL').AsString            :=PDS_GRUPO_ATUAL;
    tempQuery.ParamByName('PNR_LEADTIME_ANT').AsBCD              :=PNR_LEADTIME_ANT;
    tempQuery.ParamByName('PNR_LEADTIME_ATUAL').AsBCD            :=PNR_LEADTIME_ATUAL;
    tempQuery.ParamByName('PDS_DIACOMPRA_ANT').AsString          :=PDS_DIACOMPRA_ANT;
    tempQuery.ParamByName('PDS_DIACOMPRA_ATUAL').AsString        :=PDS_DIACOMPRA_ATUAL;
    tempQuery.ParamByName('PNR_PARAM_ESTOQUE_ANT').AsBcd     :=PNR_PARAM_ESTOQUE_ANT;
    tempQuery.ParamByName('PNR_PARAM_ESTOQUE_ATUAL').AsBcd   :=PNR_PARAM_ESTOQUE_ATUAL;
    tempQuery.ParamByName('PQT_SUGERIDA_ANT').AsBcd          :=PQT_SUGERIDA_ANT;
    tempQuery.ParamByName('PQT_SUGERIDA_ATUAL').AsBcd        :=PQT_SUGERIDA_ATUAL;
    tempQuery.ParamByName('PQT_COMPRADA').AsBcd              :=PQT_COMPRADA;
    tempQuery.ParamByName('PVT_SUGERIDO_ANT').AsBCD              :=PVT_SUGERIDO_ANT;
    tempQuery.ParamByName('PVT_SUGERIDO_ATUAL').AsBCD            :=PVT_SUGERIDO_ATUAL;
    tempQuery.ParamByName('PVT_COMPRADO').Asbcd                  :=PVT_COMPRADO;
    tempQuery.ParamByName('PID_AGENDADO').AsString               :=PID_AGENDADO;
    tempQuery.ParamByName('PNM_USUARIO').AsString                :=COPY(PNM_USUARIO,1,10);
    tempQuery.ParamByName('PPC_DESC_FIN_ANT').Asbcd              :=PPC_DESC_FIN_ANT;
    tempQuery.ParamByName('PPC_DESC_FIN_ATUAL').Asbcd            :=PPC_DESC_FIN_ATUAL;
    tempQuery.ParamByName('PPC_DESC_COM_ANT').Asbcd              :=PPC_DESC_COM_ANT;
    tempQuery.ParamByName('PPC_DESC_COM_ATUAL').Asbcd            :=PPC_DESC_COM_ATUAL;
    tempQuery.ParamByName('PDS_JUSTIFICATIVA').AsString          :=PDS_JUSTIFICATIVA;
    tempQuery.ParamByName('PNR_PRAZO_ANT').AsBcd             :=PNR_PRAZO_ANT;
    tempQuery.ParamByName('PNR_PRAZO_ATUAL').AsBcd           :=PNR_PRAZO_ATUAL;
    tempQuery.ParamByName('PCD_EMPRESA').AsBcd               :=PCD_EMPRESA;
    tempQuery.ParamByName('PnrPedido').AsBcd                 :=PNR_PEDIDO_COMPRA;
    Result := false;
    if tempQuery.ExecSQL(False) = 1 then
      Result := true;
   except
     on E: Exception do
     begin
      //trataerro(E.Message, 'Erro ao testa conex?o com a base...');
     Mensagem('Erro ao criar Capa Tabela Auxiliar capa Pedido Compra...',MB_ICONERROR);

      nrErro := StrToIntDef(copy(E.Message, 5, 5), 0);
      result:=false;
      if nrerro<>1 then
      begin
         trataerro(E.Message, 'Erro ao criar Capa Tabela Auxiliar capa Pedido Compra...');
         result:=false;
      end;
     end;

   end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
{$EndREGION 'Auditoria Compra Capa'}



{$REGION 'Localiza Auditoria Compra Capa'}

function LocalizaAuditoria(PcdAuditoria,PnrFornecedor:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  tempQuery := nil;
  tempQuery := _dm.criaQueryGenerica;
   try
      with TempQuery do
      begin
        SQL.Clear;
        SQL.Add('SELECT CD_AUDITORIA');
        SQL.Add('FROM PRDDM.DC_AUDITORIA_COMPRA');
        SQL.Add('WHERE');
        SQL.Add('CD_AUDITORIA=:PcdAuditoria');
        SQL.Add('AND trunc(DT_AUDITORIA)=trunc(sysdate) AND NR_LABORATORIO=:PnrFornecedor');
        ParamByName('PcdAuditoria').AsBcd:=PcdAuditoria;
        ParamByName('PnrFornecedor').AsBcd:=PnrFornecedor;
        open;
      end;
      Result:=false;
      if not tempQuery.IsEmpty then
        Result:=true;
   finally
     FreeAndNil(tempQuery);
   end;
end;
{$ENDREGION 'Localiza Auditoria Compra Capa'}


{$REGION 'Altera Auditoria Compra Capa'}
function AlteraAuditoria(PcdAuditoria,
                         PnrFornecedor:Integer;
                         PdtAgendaAtual:TDate;
                         PqtComprada:Integer;
                         PvlComprado:Double;
                         PDS_JUSTIFICATIVA:String;
                         PNR_PRAZO_ATUAL:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  tempQuery := nil;
  tempQuery := _dm.criaQueryGenerica;
   try
      with TempQuery do
      begin
        SQL.Clear;
        SQL.Add('UPDATE  PRDDM.DC_AUDITORIA_COMPRA  SET');
        SQL.Add('DT_AGENDA_ATUAL=:PDT_AGENDA_ATUAL,');
        SQL.Add('QT_COMPRADA=:PQT_COMPRADA,');
        SQL.Add('VT_COMPRADO=:PVT_COMPRADO, ');
        SQL.Add('DS_JUSTIFICATIVA= DS_JUSTIFICATIVA ||'' - ''|| :PDS_JUSTIFICATIVA,');
        SQL.Add('NR_PRAZO_ATUAL=:PNR_PRAZO_ATUAL');
        SQL.Add('WHERE');
        SQL.Add('cd_auditoria=:PcdAuditoria');
        SQL.Add('AND Trunc(DT_AUDITORIA)=Trunc(SYSDATE)');
        SQL.Add('AND NR_LABORATORIO=:PnrLaboratorio');
        ParamByName('PDT_AGENDA_ATUAL').AsDateTime:=PdtAgendaAtual;
        ParamByName('PQT_COMPRADA').AsBcd     :=PqtComprada;
        ParamByName('PVT_COMPRADO').AsBCD         :=PvlComprado;
        ParamByName('PDS_JUSTIFICATIVA').AsString :=PDS_JUSTIFICATIVA;
        ParamByName('PNR_PRAZO_ATUAL').AsBcd:=PNR_PRAZO_ATUAL;

        ParamByName('PcdAuditoria').AsBcd     :=PcdAuditoria;
        ParamByName('PnrLaboratorio').AsBcd   :=PnrFornecedor;
      end;
      Result:=false;
      if tempQuery.ExecSQL(False) = 1 then
         Result := true

   finally
     FreeAndNil(tempQuery);
   end;
end;
{$endREGION 'Altera Auditoria Compra Capa'}

{$REGION 'Altera Auditoria Compra Capa'}
function AlteraCodigoAuditoria(PcdAuditoria,
                               PcdAuditoriaNovo,
                               PnrFornecedor:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
begin
  tempQuery := nil;
  tempQuery := _dm.criaQueryGenerica;
   try
    try
      with TempQuery do
      begin
        SQL.Clear;
        SQL.Add('UPDATE  PRDDM.DC_AUDITORIA_COMPRA  SET');
        SQL.Add('CD_AUDITORIA=:PcdAuditoriaNovo');
        SQL.Add('WHERE');
        SQL.Add('cd_auditoria=:PcdAuditoria');
        SQL.Add('AND Trunc(DT_AUDITORIA)=Trunc(SYSDATE)');
        SQL.Add('AND NR_LABORATORIO=:PnrLaboratorio');

        ParamByName('PcdAuditoria').AsBcd     :=PcdAuditoria;
        ParamByName('PcdAuditoriaNovo').AsBcd :=PcdAuditoriaNovo;
        ParamByName('PnrLaboratorio').AsBcd   :=PnrFornecedor;
      end;
      Result:=false;
      if tempQuery.ExecSQL(False) = 1 then
         Result := true
    except
         Mensagem('Erro na Altera??o de tabela Auxiliar de Pedido!!!',MB_ICONERROR);
    end;

   finally
     FreeAndNil(tempQuery);
   end;
end;
{$endREGION 'Altera Cod.auditoria Compra Capa'}


{$REGION 'Auditoria Item Compra Item...'}
Function InsereItemAuditoria( PCD_AUDITORIA,
                              PCD_PRODUTO,
                              PQT_SUGERIDA,
                              PQT_COMPRADA:Integer;
                              PVL_SUGERIDO,
                              PVL_COMPRADO:Double;
                              PQT_PENDENTE,
                              PQT_ESTOQUE:Integer;
                              PVL_MEDIA_VENDA:Double;
                              PNR_DIAS_ESTOQUE,
                              PCD_EMPRESA,
                              PNR_PEDIDO_COMPRA:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  nrErro: Integer;

begin
  tempQuery := nil;
  try
   try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
    SQL.Clear;
    SQL.Add('INSERT INTO PRDDM.DC_ITEM_AUDITORIA_COMPRA');
    SQL.Add('(CD_AUDITORIA, CD_PRODUTO, QT_SUGERIDA, QT_COMPRADA,');
    SQL.Add('VL_SUGERIDO, VL_COMPRADO, QT_PENDENTE, QT_ESTOQUE,');
    SQL.Add('VL_MEDIA_VENDA, NR_DIAS_ESTOQUE,CD_EMPRESA,NR_PEDIDO_COMPRA)');
    SQL.Add('VALUES');
    SQL.Add('(:PCD_AUDITORIA, :PCD_PRODUTO, :PQT_SUGERIDA, :PQT_COMPRADA,');
    SQL.Add(':PVL_SUGERIDO, :PVL_COMPRADO, :PQT_PENDENTE, :PQT_ESTOQUE,');
    SQL.Add(':PVL_MEDIA_VENDA, :PNR_DIAS_ESTOQUE,:PCD_EMPRESA,:PnrPedido)');
    ParamByName('PCD_AUDITORIA').AsBcd   :=PCD_AUDITORIA;
    ParamByName('PCD_PRODUTO').AsBcd     :=PCD_PRODUTO;
    ParamByName('PQT_SUGERIDA').AsBcd    :=PQT_SUGERIDA;
    ParamByName('PQT_COMPRADA').AsBcd    :=PQT_COMPRADA;
    ParamByName('PVL_SUGERIDO').AsBCD    :=PVL_SUGERIDO;
    ParamByName('PVL_COMPRADO').AsBCD    :=PVL_COMPRADO;
    ParamByName('PQT_PENDENTE').AsBcd    :=PQT_PENDENTE;
    ParamByName('PQT_ESTOQUE').AsBcd     :=PQT_ESTOQUE;
    ParamByName('PVL_MEDIA_VENDA').AsBCD :=PVL_MEDIA_VENDA;
    ParamByName('PNR_DIAS_ESTOQUE').AsBcd:=PNR_DIAS_ESTOQUE;
    ParamByName('PCD_EMPRESA').AsBcd     :=PCD_EMPRESA;
    ParamByName('PnrPedido').AsBcd       :=PNR_PEDIDO_COMPRA;

    end;

    Result := false;
    if tempQuery.ExecSQL(False) = 1 then
      Result := true;
   except
     on E: Exception do
     begin
      //trataerro(E.Message, 'Erro ao testa conex?o com a base...');
      nrErro := StrToIntDef(copy(E.Message, 5, 5), 0);
      if nrerro<>1 then
      begin
         trataerro(E.Message, 'Erro ao criar Item Tabela Auxiliar Item Pedido Compra...');
         result:=true;
      end;
     end;

   end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
{$EndREGION 'Auditoria Item Compra Item...'}



{$REGION 'Auditoria Item Compra Item...'}
Function InsereItemAuditoriaNOVA( PCD_AUDITORIA,
                              PNR_FORNECEDOR,
                              PNR_PEDIDO_COMPRA:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  nrErro: Integer;

begin
  tempQuery := nil;
  try
   try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
    SQL.Clear;
    SQL.Add('INSERT INTO PRDDM.DC_ITEM_AUDITORIA_COMPRA (CD_AUDITORIA, CD_PRODUTO,');
    SQL.Add('QT_SUGERIDA, QT_COMPRADA, VL_SUGERIDO, VL_COMPRADO, QT_PENDENTE,');
    SQL.Add('QT_ESTOQUE, VL_MEDIA_VENDA, NR_DIAS_ESTOQUE, CD_EMPRESA, NR_PEDIDO_COMPRA)');
    SQL.Add('SELECT :PcdAuditoria,PED.NROM_Y, NVL(QT_SUGERIDA,0) ,NVL(QUAY_Y,0),nvl(QT_SUGERIDA*PFBY_Y,0) AS VL_SUGERIDO,');
    SQL.Add('NVL(QUAY_Y*PFBY_Y,0) VL_COMPRADO,NVL(QT_PENDENTE,0) AS QT_PENDENTE ,');
    SQL.Add('NVL(QT_FISICO-QT_RESERVADO-QT_RESERVA_PROBLEMATICA-QT_VENCIDO,0) ,nvl(VL_MEDIA_VENDA,0),nvl(NR_DIAS_ESTOQUE,0),CAPA.CD_EMPRESA_DESTINO,NROP_Y');
    SQL.Add('FROM');
    SQL.Add('PRDDM.DCPCC CAPA');
    SQL.Add('JOIN PRDDM.DCPCI PED ON CAPA.NROP_P=PED.NROP_Y');
    SQL.Add('JOIN PRDDM.DC_ESTOQUE_MERCADORIA EM ON EM.CD_MERCADORIA=PED.NROM_Y AND EM.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
    SQL.Add('LEFT OUTER JOIN (SELECT NROM_Y,SUM(QUAY_Y-CHEY_Y) QT_PENDENTE,CD_EMPRESA_DESTINO');
    SQL.Add(' FROM');
    SQL.Add(' PRDDM.DCPCC,PRDDM.DCPCI');
    SQL.Add('WHERE');
    SQL.Add(' NROP_P=NROP_Y');
    SQL.Add(' AND  SITP_P IN(''N'',''P'',''T'')');
    SQL.Add(' AND  SITY_Y IN(''N'',''P'',''T'')');
    SQL.Add(' AND  LABP_P=:PnrFORNECEDOR');
    SQL.Add(' AND  CD_EMPRESA_DESTINO=1');
    SQL.Add(' GROUP BY NROM_Y,CD_EMPRESA_DESTINO) PENDE ON PENDE.NROM_Y=PED.NROM_Y AND PENDE.CD_EMPRESA_DESTINO=PED.CD_EMPRESA');
    SQL.Add('WHERE nrop_y=:PNR_PEDIDO_COMPRA');



    ParamByName('PcdAuditoria').AsBcd   :=PCD_AUDITORIA;
    ParamByName('PnrFORNECEDOR').AsBcd  :=PNR_FORNECEDOR;
    ParamByName('PNR_PEDIDO_COMPRA').AsBcd  :=PNR_PEDIDO_COMPRA;
    end;

    Result := false;
    if tempQuery.ExecSQL(False) = 1 then
      Result := true;
   except
     on E: Exception do
     begin
      //trataerro(E.Message, 'Erro ao testa conex?o com a base...');
      nrErro := StrToIntDef(copy(E.Message, 5, 5), 0);
      if nrerro<>1 then
      begin
         trataerro(E.Message, 'Erro ao criar Item Tabela Auxiliar Item Pedido Compra...');
         result:=true;
      end;
     end;

   end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
{$EndREGION 'Auditoria Item Compra Item...'}




{$REGION 'Auditoria Item Compra Item...'}
Function AlteraItemAuditoria( PCD_AUDITORIA,
                              PCD_PRODUTO,
                              PQT_SUGERIDA,
                              PQT_COMPRADA:Integer;
                              PVL_SUGERIDO,
                              PVL_COMPRADO:Double;
                              PQT_PENDENTE,
                              PQT_ESTOQUE:Integer;
                              PVL_MEDIA_VENDA:Double;
                              PNR_DIAS_ESTOQUE:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  nrErro: Integer;

begin
  tempQuery := nil;
  try
   try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
    SQL.Clear;
    SQL.Add('UPDATE PRDDM.DC_ITEM_AUDITORIA_COMPRA');
    SQL.Add('set QT_SUGERIDA=:PQT_SUGERIDA,QT_COMPRADA=:PQT_COMPRADA,');
    SQL.Add('VL_SUGERIDO=:PVL_SUGERIDO,');
    SQL.Add('VL_COMPRADO=:PVL_COMPRADO,QT_PENDENTE=:PQT_PENDENTE,');
    SQL.Add('VL_MEDIA_VENDA=:PVL_MEDIA_VENDA,NR_DIAS_ESTOQUE=:PNR_DIAS_ESTOQUE');
    SQL.Add('WHERE');
    SQL.Add('CD_AUDITORIA=:PCD_AUDITORIA');
    SQL.Add('AND CD_PRODUTO=:PCD_PRODUTO');
    ParamByName('PCD_AUDITORIA').AsBcd   :=PCD_AUDITORIA;
    ParamByName('PCD_PRODUTO').AsBcd     :=PCD_PRODUTO;
    ParamByName('PQT_SUGERIDA').AsBcd    :=PQT_SUGERIDA;
    ParamByName('PQT_COMPRADA').AsBcd    :=PQT_COMPRADA;
    ParamByName('PVL_SUGERIDO').AsBCD        :=PVL_SUGERIDO;
    ParamByName('PVL_COMPRADO').AsBCD        :=PVL_COMPRADO;
    ParamByName('PQT_PENDENTE').AsBcd    :=PQT_PENDENTE;
    ParamByName('PVL_MEDIA_VENDA').AsBCD     :=PVL_MEDIA_VENDA;
    ParamByName('PNR_DIAS_ESTOQUE').AsBcd:=PNR_DIAS_ESTOQUE;
    end;

    Result := false;
    if tempQuery.ExecSQL(False) = 1 then
      Result := true;
   except
     on E: Exception do
     begin
      //trataerro(E.Message, 'Erro ao testa conex?o com a base...');
      nrErro := StrToIntDef(copy(E.Message, 5, 5), 0);
      if nrerro<>1 then
      begin
         trataerro(E.Message, 'Erro ao atualizar Item Tabela Auxiliar Item Pedido Compra...');
         result:=true;
      end;
     end;

   end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
{$EndREGION 'Auditoria Item Compra Item...'}


{$REGION 'Auditoria Item Compra Item...'}
Function ZeraItemAuditoria(PCD_AUDITORIA:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  nrErro: Integer;

begin
  tempQuery := nil;
  try
   try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
    SQL.Clear;
    SQL.Add('UPDATE PRDDM.DC_ITEM_AUDITORIA_COMPRA');
    SQL.Add('set QT_COMPRADA=0,');
    SQL.Add('VL_COMPRADO=0');
    SQL.Add('WHERE');
    SQL.Add('CD_AUDITORIA=:PCD_AUDITORIA');
    ParamByName('PCD_AUDITORIA').AsBcd   :=PCD_AUDITORIA;
    end;

    Result := false;
    if tempQuery.ExecSQL(False) = 1 then
      Result := true;
   except
     on E: Exception do
     begin
      //trataerro(E.Message, 'Erro ao testa conex?o com a base...');
      nrErro := StrToIntDef(copy(E.Message, 5, 5), 0);
      if nrerro<>1 then
      begin
         trataerro(E.Message, 'Erro ao zerar Item Tabela Auxiliar Item Pedido Compra...');
         result:=true;
      end;
     end;

   end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
{$EndREGION 'Auditoria Item Compra Item...'}



{$REGION 'Auditoria Item Compra Item...'}
Function LocalizaItemAuditoria( PCD_AUDITORIA,
                                PCD_PRODUTO:Integer):Boolean;
var
  tempQuery: TSQLQuery;
  dsVersaoBase: String;
  nrErro: Integer;

begin
  tempQuery := nil;
  try
   try
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
    close;
    SQL.Clear;
    SQL.Add('SELECT *  FROM PRDDM.DC_ITEM_AUDITORIA_COMPRA');
    SQL.Add('WHERE CD_AUDITORIA=:PCD_AUDITORIA AND  CD_PRODUTO=:PCD_PRODUTO');
    ParamByName('PCD_AUDITORIA').AsBcd   :=PCD_AUDITORIA;
    ParamByName('PCD_PRODUTO').AsBcd     :=PCD_PRODUTO;
    open;
    end;
    Result := false;
    if not  tempQuery.IsEmpty then
      Result := true;
   except
     on E: Exception do
     begin
      //trataerro(E.Message, 'Erro ao testa conex?o com a base...');
      nrErro := StrToIntDef(copy(E.Message, 5, 5), 0);
      if nrerro<>1 then
      begin
         trataerro(E.Message, 'Erro ao criar Item Tabela Auxiliar Item Pedido Compra...');
         result:=true;
      end;
     end;

   end;
  finally
    tempQuery.close;
    tempQuery.FREE;
  end;
end;
{$EndREGION 'Auditoria Item Compra Item...'}


function ProdutosEmEspera(PnrFornecedor,PnrComporador:Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT  M.CD_MERCADORIA*10+NR_DV_MERCADORIA AS COD_PRODUTO,');
      SQL.Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
      SQL.Add('case');
      SQL.Add('WHEN ITEM.CD_EMPRESA=1 THEN ''CD-SC''');
      SQL.Add('WHEN ITEM.CD_EMPRESA=4 THEN ''CD-RS''');
      SQL.Add('END CD,');
      SQL.Add('SUM(QUAY_Y) QTPEDIDO,');
      SQL.Add(' (QT_FISICO - QT_VENCIDO-QT_RESERVA_PROBLEMATICA-QT_BLOQUEADO) ESTOQUE, QT_RESERVADO,');
      SQL.Add('CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,gf.CD_GRUPO_FORNECEDOR,DS_GRUPO_FORNECEDOR');
      SQL.Add('FROM');
      SQL.Add('PRDDIA.DCORD,');
      SQL.Add('PRDDIA.DCYTE ITEM,');
      SQL.Add('PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DC_COMPRA_MERCADORIA CM,');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR  GF,');
      SQL.Add('PRDDM.DC_ESTOQUE_MERCADORIA EM,');
      SQL.Add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
      SQL.Add('WHERE');
      SQL.Add('NROO_O=NROO_Y');
      SQL.Add('AND NROM_Y=M.CD_MERCADORIA');
      SQL.Add('AND ITEM.CD_EMPRESA=CM.CD_EMPRESA');
      SQL.Add('AND CM.CD_MERCADORIA=EM.CD_MERCADORIA');
      SQL.Add('AND CM.CD_EMPRESA=EM.CD_EMPRESA');
      SQL.Add('AND NR_COMPRADOR=CD_COMPRADOR');
      SQL.Add('AND M.CD_MERCADORIA=CM.CD_MERCADORIA');
      SQL.Add('AND CM.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      if PnrFornecedor>0 then
       SQL.Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComporador>0 then
       SQL.Add('AND CM.CD_COMPRADOR=:PnrComprador');

      SQL.Add('AND STAO_O=''X''');
      SQL.Add('GROUP BY');
      SQL.Add(' M.CD_MERCADORIA*10+NR_DV_MERCADORIA,');
      SQL.Add(' NM_MERCADORIA,');
      SQL.Add(' ITEM.CD_EMPRESA,');
      SQL.Add(' CD_COMPRADOR,');
      SQL.Add(' NM_COMPRADOR_REDUZIDO,');
      SQL.Add('  QT_FISICO , QT_PEDIDO,QT_RESERVADO, QT_VENCIDO,QT_RESERVA_PROBLEMATICA,QT_BLOQUEADO,');
      SQL.Add(' DS_APRESENTACAO_MERCADORIA,gf.CD_GRUPO_FORNECEDOR,DS_GRUPO_FORNECEDOR');
      SQL.Add(' ORDER BY NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
     if PnrFornecedor>0 then
       Params.ParamByName('PnrFornecedor').AsBcd:=PnrFornecedor;
     if PnrComporador>0 then
        Params.ParamByName('PnrComprador').AsBcd:=PnrComporador;

      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;



function ClientesComPedidoEmEspera(PcdProduto:Integer):TClientDataSet;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT  NROO_O,SUM(QUAY_Y) QT_PEDIDO,NROC_C*10+DIGC_C,NOMP_P,DT_INICIO_PEDIDO,DATO_O,SNRO_O');
      SQL.Add('FROM');
      SQL.Add('PRDDIA.DCORD,');
      SQL.Add('PRDDIA.DCYTE ITEM,');
      SQL.Add('PRDDM.DC_MERCADORIA M,');
      SQL.Add('PRDDM.DCCLI,');
      SQL.Add('PRDDM.DCPES');
      SQL.Add('WHERE');
      SQL.Add('NROO_O=NROO_Y');
      SQL.Add('AND NROM_Y=M.CD_MERCADORIA');
      SQL.Add('AND NROC_C=NROC_O');
      SQL.Add('AND CGCP_P=CGCP_C');
      SQL.Add('AND M.CD_MERCADORIA*10+NR_DV_MERCADORIA=:PcdProduto');
      SQL.Add('AND STAO_O=''X''');
      SQL.Add('GROUP BY NROO_O,NROC_C*10+DIGC_C,');
      SQL.Add('NOMP_P,DT_INICIO_PEDIDO,DATO_O,SNRO_O');

    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PcdProduto').AsBcd:=PcdProduto;
      open;
    end;
    result:=nil;
    if not _cdsTemp.IsEmpty then
       result:=_cdsTemp;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function AbreDadosFornecedor(PnrFornecedor:Integer):TDescricaoFornecedor;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp := _dm.criaQueryGenerica;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT CD_GRUPO_FORNECEDOR,DS_GRUPO_FORNECEDOR');
      SQL.Add('FROM');
      SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR');
      SQL.Add('WHERE');
      SQL.Add('CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      Params.ParamByName('PnrFornecedor').AsBcd:=PnrFornecedor;
      open;
    end;
     Result.nr_Fornecedor           :=0;
     Result.nm_Fornecedor  :='';
    if not _cdsTemp.IsEmpty then
    begin
       Result.nr_Fornecedor       :=_cdsTemp.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger;
       Result.nm_Fornecedor       :=_cdsTemp.FieldByName('DS_GRUPO_FORNECEDOR').AsString;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;


function GetUltimoDiaEstoque:Integer;
var
  QryTemp: TSQLQuery;
  _cdsTemp:TClientDataSet;
begin
  try
    QryTemp := TSQLQuery.Create(NIL);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';
    with QryTemp do
    begin
      Close;
      SQL.Add('SELECT trunc(SYSDATE)-Max(daee_e) nrdias');
      SQL.Add('FROM PRDDM.DCEST');
      SQL.Add('WHERE  DCEST.DAEE_E>=ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
    end;
    with _cdsTemp do
    begin
      close;
      CommandText:=QryTemp.Text;
      open;
    end;
     Result :=0;
    if not _cdsTemp.IsEmpty then
    begin
       Result:=_cdsTemp.FieldByName('nrdias').AsInteger;
    end;
   finally
    FreeAndNil(QryTemp);
  end;
end;

function IDConexaoBase(PnrBase:Integer): Boolean;
var
  tempQuery: TSQLQuery;
  i :Integer;
begin
  tempQuery := nil;
  try
   try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    with tempQuery do
    begin
      SQL.Add('SELECT * FROM  dual');
      Open;
    end;
    Result:=false;
    if not tempQuery.IsEmpty then
      Result:=true;
   except
       TestaConexaoBase(_dm._conexao, nrBase);
   end;

  finally
    FreeAndNil(tempQuery);
    //FreeAndNil(Usuario);
  end;

end;


{$REGION 'Manuten??o Auditoria Item Compra Item...'}
Function ManutencaoItemAuditoria( PCD_AUDITORIA,
                                  PCD_PRODUTO,
                                  PQT_SUGERIDA,
                                  PQT_COMPRADA:Integer;
                                  PVL_SUGERIDO,
                                  PVL_COMPRADO:Double;
                                  PQT_PENDENTE,
                                  PQT_ESTOQUE:Integer;
                                  PVL_MEDIA_VENDA:Double;
                                  PNR_DIAS_ESTOQUE,
                                  PCD_EMPRESA,
                                  PNR_PEDIDO_COMPRA:Integer;
                                  PidInicio:Boolean):Boolean;
begin

 if not PidInicio then
 begin
  if not LocalizaItemAuditoria(PCD_AUDITORIA,PCD_PRODUTO) then
  begin
     InsereItemAuditoria ( PCD_AUDITORIA,
                           PCD_PRODUTO,
                           PQT_SUGERIDA,
                           PQT_COMPRADA,
                           PVL_SUGERIDO,
                           PVL_COMPRADO,
                           PQT_PENDENTE,
                           PQT_ESTOQUE,
                           PVL_MEDIA_VENDA,
                           PNR_DIAS_ESTOQUE,
                           PCD_EMPRESA,
                           PNR_PEDIDO_COMPRA);
  end
  else
    AlteraItemAuditoria( PCD_AUDITORIA,
                           PCD_PRODUTO,
                           PQT_SUGERIDA,
                           PQT_COMPRADA,
                           PVL_SUGERIDO,
                           PVL_COMPRADO,
                           PQT_PENDENTE,
                           PQT_ESTOQUE,
                           PVL_MEDIA_VENDA,
                           PNR_DIAS_ESTOQUE);
 end;


end;

{$endREGION 'Manuten??o Auditoria Item Compra Item...'}


Function ExtractNamesISTEMA(const Filename: String): String;
{Retorna o nome do Arquivo sem extens?o}
var
aExt : String;
aPos : Integer;
begin
aExt := ExtractFileExt(Filename);
Result := ExtractFileName(Filename);
if aExt <> '' then
   begin
   aPos := Pos(aExt,Result);
   if aPos > 0 then
      begin
      Delete(Result,aPos,Length(aExt));
      end;
   end;
end;



function SetDadosLeitura(PnmArquivo:String):DadosExecucao;
var
 arq :TIniFile;
 nmArqTemp:string;
begin

    if not FileExists(PnmArquivo) then
       Result:=CriaArquivoInicializacao(PnmArquivo,dtSistema,false)
    else
     begin
       Result:=LendoArquivoInicializacao(PnmArquivo);
     end;


end;

function CriaArquivoInicializacao(Parquivo:String; PdtLeitura:Tdate;PidFinalizou:Boolean):DadosExecucao;
var
 ArqIni :TIniFile;
begin
     ArqIni := TIniFile.Create(Parquivo);
    try
      ArqIni.WriteDate('Ultima Execucao', 'Data', PdtLeitura);
      ArqIni.WriteBool('Ultima Execucao', 'Finalizou', false);
  finally
    ArqIni.Free;
  end;
  Result.dtUltimaExecucao :=PdtLeitura;
  Result.idFinalizou      :=false;
  Result.nmArquivo       := Parquivo;


end;
function AtualizaArquivoInicializacao(Pnmarquivo:String; PdtLeitura:Tdate;PidFinalizou:Boolean):DadosExecucao;
var
 ArqIni :TIniFile;
begin
     ArqIni := TIniFile.Create(Pnmarquivo);
    try
      ArqIni.WriteDate('Ultima Execucao', 'Data', PdtLeitura);
      ArqIni.WriteBool('Ultima Execucao', 'Finalizou', PidFinalizou);
  finally
    ArqIni.Free;
  end;
   Result.dtUltimaExecucao :=PdtLeitura;
   Result.idFinalizou      :=PidFinalizou;
   Result.nmArquivo       := PnmArquivo;
end;

function LendoArquivoInicializacao(PnmArquivo:String):DadosExecucao;
var
 ArqIni :TIniFile;
begin
     ArqIni := TIniFile.Create(PnmArquivo);
    try
     Result.dtUltimaExecucao:= ArqIni.ReadDate('Ultima Execucao', 'Data', 0);
     Result.idFinalizou     :=  ArqIni.ReadBool('Ultima Execucao', 'Finalizou', false);
     Result.nmArquivo       := PnmArquivo;
  finally
    ArqIni.Free;
  end;
end;




Procedure GerarExcelNovo(Consulta: TClientDataSet);
var
  Coluna, linha: Integer;
  excel: variant;
  Valor: String;
  Data: String;
begin
  try
    excel := CreateOleObject('Excel.Application');
    excel.Workbooks.Add(1);
  except
    Application.MessageBox('Vers?o do Ms-Excel' + 'Incompat?vel', 'Erro',
      mb_OK + MB_ICONEXCLAMATION);
  end;

  Consulta.First;

  try
    Consulta.DisableControls;
    for linha := 0 to Consulta.RecordCount - 1 do
    begin
      for Coluna := 1 to Consulta.FieldCount do
      // eliminei a coluna 0 da rela??o do Excel
      begin
        // valor:= Consulta.Fields[coluna-1].value;
        // excel.cells [linha+2,coluna]:=valor;
        try // excel.cells [linha+2,coluna]:=Consulta.Fields[coluna-1].value;
          if Consulta.Fields[Coluna - 1].DataType <> ftUnknown then
          begin
            if Consulta.Fields[Coluna - 1].DataType = ftWideString then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsWideString;
            if Consulta.Fields[Coluna - 1].DataType = ftString then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsString;
            if Consulta.Fields[Coluna - 1].DataType = ftinteger then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsInteger;
            if Consulta.Fields[Coluna - 1].DataType = ftFMTBcd then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsFloat;
            if Consulta.Fields[Coluna - 1].DataType = ftBCD then
            begin
//              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna].numberformat := '00000000000000';
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=Consulta.Fields[Coluna - 1].AsFloat;
            end;
            if Consulta.Fields[Coluna - 1].DataType = ftFloat then
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] :=
                Consulta.Fields[Coluna - 1].AsFloat;
            if Consulta.Fields[Coluna - 1].DataType = ftTimeStamp then
            begin
              Data := FormatDateTime('mm/dd/YYYY', Consulta.Fields[Coluna - 1].AsDateTime);
              excel.Workbooks[1].Sheets[1].cells[linha + 2, Coluna] := Data;
            end;
          end;
        except
          Mensagem(Consulta.Fields[Coluna - 1].AsString,MB_ICONERROR);
        end;

      end;
      Consulta.Next;
    end;
    Consulta.EnableControls;

    for Coluna := 1 to Consulta.FieldCount do
    // eliminei a coluna 0 da rela??o do Excel
    begin
      Valor := Consulta.Fields[Coluna - 1].DisplayLabel;
      excel.cells[1, Coluna] := Valor;
    end;
    excel.columns.AutoFit;
    // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
    excel.visible := true ;

  except
    Application.MessageBox('Aconteceu um erro desconhecido durante a convers?o'
      + 'da tabela para o Ms-Excel', 'Erro', mb_OK + MB_ICONEXCLAMATION);
  end;
  // excel.quit;
end;



Procedure GerarExcelTeste(Consulta:TClientDataSet);
var
     coluna, linha: integer;
     excel: variant;
     valor: string;
begin
     try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
     except
          Application.MessageBox ('Vers?o do Ms-Excel'+
          'Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;

     Consulta.First;
     Consulta.DisableControls;

     try
        for linha:=0 to Consulta.RecordCount-1 do
        begin
            for coluna:=1 to Consulta.FieldCount do // eliminei a coluna 0 da rela??o do Excel
            begin
                 valor:= Consulta.Fields[coluna-1].AsString;
                 excel.cells [linha+2,coluna]:=valor;
            end;
            Consulta.Next;
        end;

        for coluna:=1 to Consulta.FieldCount do // eliminei a coluna 0 da rela??o do Excel
        begin
             valor:= Consulta.Fields[coluna-1].DisplayLabel;
             excel.cells[1,coluna]:=valor;
        end;
        excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
     Consulta.EnableControls;

end;
function TranformaStringCodigo(PstCodigo:String):TCodigoValido;
var
 nrTemp,cdTemp,dvTem :Integer;
begin
  nrTemp:= StrToIntDef(PstCodigo,0);
  Result.nrCodigo:= StrToIntDef(copy(FormatFloat('00000000',nrTemp),1,7),0);
  Result.nrDigito:= StrToIntDef(copy(FormatFloat('00000000',nrTemp),8,1),0);
end;





Procedure GerarTabelaArquivoCVS(PTabela:TDataSet;PstTituloRelatorio,PnmArquivo:String);
var
 i: Integer; // Coluna
 j: Integer; // Linha

 arq: TextFile;
 nrlinHa:integer;
 stLinha,stLinhaTemp:WideString;
 stLista: TStringList;
 vlResultado: Variant;


 function retirarQuebraLinha(aTxt : string):string;
 begin
   atxt:=StringReplace(atxt,#13#10,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D#$A,'',[rfReplaceAll]);
   atxt:=StringReplace(atxt,#$D,' ',[rfReplaceAll]);
   Result:=aTxt;
 end;

begin
  PTabela.Open;
  PTabela.First;

begin
  try
    stLista:=TStringList.Create;
    stLista.Clear;

    PnmArquivo:=PnmArquivo;
    AssignFile(arq,PnmArquivo );
    Rewrite(arq, PnmArquivo);

    stLinha:='Genesio A. Mendes & Cia. Ltda';
    Writeln(arq,stLinha);
    stLinha:=PstTituloRelatorio;
    Writeln(arq,stLinha);
    stLinha:='Data Emiss?o do Rel.:'+FormatDateTime('dd/mm/yyyy',dtSistema);
    Writeln(arq,stLinha);

   J:=0;
   stLinha:=EmptyStr;

   while J<= PTabela.FieldCount - 1 do
   begin

      if PTabela.Fields[j].Visible then
      begin
        if stLinha<>'' then
          stLinha:= stLinha +';'+ PTabela.Fields[j].DisplayName
        else
          stLinha:= PTabela.Fields[j].DisplayName;

      end;
     inc(j);
   end;
   Writeln(arq,stLinha);
   PTabela.First;
   PTabela.DisableControls;
   while not PTabela.Eof do
   begin
       J:=0;
       stLinha:=EmptyStr;
     while J<= PTabela.FieldCount - 1 do
     begin

      if PTabela.Fields[j].Visible then
      begin

        vlResultado := SetTipoCampoII(PTabela.Fields[J].DataType);

        if stLinha<>'' then
          stLinha:= stLinha+';'+PreencheStringTabela(vlResultado, J, i, j, PTabela)
        else
          stLinha:= PreencheStringTabela(vlResultado, J, i, j, PTabela);

      end;
     inc(j);
   end;
   Writeln(arq,stLinha);

      PTabela.Next;
    end;
    CloseFile(arq);
   PTabela.EnableControls;

  // ShellExecute(Handle, 'Open',PnmArquivo , nil, 'C:\TEMP\', SW_SHOWNORMAL);
  finally
    stLista.Free;
  end;


end;
end;





function PreencheStringTabela(tipo:String; Indice, coluna, Linha: Integer;campo: TDataSet):String;
var
  teste: string;
  vlTesteDouble: Double;

begin
  if tipo = '' then
  begin
    teste := campo.Fields[Indice].value;
    result:=teste;
  end;
  if tipo = 'string' then
  begin
    teste := ' ';
    if campo.Fields[Indice].value <> null then
      teste := campo.Fields[Indice].value;
  end;
  if tipo = 'data' then
  begin
    teste := ' ';
    if campo.Fields[Indice].value <> null then
      teste := FormatDateTime('dd/mm/yyyy',campo.Fields[Indice].value);
  end;

  if tipo = 'Integer' then
  begin
    teste := ' ';
    if campo.Fields[Indice].value <> null then
      teste := IntToStr(campo.Fields[Indice].value);
  end;
  if tipo = 'float' then
  begin
    if campo.Fields[Indice].value <> null then
      vlTesteDouble := StrToFloatDef(campo.Fields[Indice].value, 0);
   if campo.Fields[Indice].value <> null then
     teste := FloatToStr(campo.Fields[Indice].value);
  end;
  result:=teste;

end;


function SetTipoCampoII(tipoCampo: TFieldType): String;
VAR
  i: Integer;
  teste: string;
  vlTesteDouble: Double;

begin

  result := '';
  if tipoCampo in [ftString, ftFixedChar, ftWideString] then
  begin
    // teste:=DateToStr(vlCampo.Fields[0].Value);
    result := 'string';
  end;
  if tipoCampo in [ftDate, ftTime, ftDateTime, ftTimeStamp] then
  begin
    // teste:=DateToStr(vlCampo.Fields[0].Value);
    result := 'data';
  end;
  if tipoCampo in [ftSmallint, ftinteger, ftLargeint] then
  begin
    result := 'inteiro';
    // vlCampo.Fields[0].Value;// Sheet.getCellByPosition(i,j).SetValue(aDataset.Fields[i].Value);
  end;
  if tipoCampo in [ftFloat, ftCurrency, ftFMTBcd] then
  begin
    result := 'float'; // vlTesteDouble;
  end;


end;


function MacAddress1: String;
 var
   Lib: Cardinal;
   Func: function(GUID: PGUID): Longint; stdcall;
   GUID1, GUID2: TGUID;
 begin
   Result := '';
   Lib := LoadLibrary('rpcrt4.dll');
   if Lib <> 0 then
   begin
     @Func := GetProcAddress(Lib, 'UuidCreateSequential');
     if Assigned(Func) then
     begin
       if (Func(@GUID1) = 0) and
          (Func(@GUID2) = 0) and
          (GUID1.D4[2] = GUID2.D4[2]) and
          (GUID1.D4[3] = GUID2.D4[3]) and
          (GUID1.D4[4] = GUID2.D4[4]) and
          (GUID1.D4[5] = GUID2.D4[5]) and
          (GUID1.D4[6] = GUID2.D4[6]) and
          (GUID1.D4[7] = GUID2.D4[7]) then
       begin
         Result :=
           IntToHex(GUID1.D4[2], 2) + '-' +
           IntToHex(GUID1.D4[3], 2) + '-' +
           IntToHex(GUID1.D4[4], 2) + '-' +
           IntToHex(GUID1.D4[5], 2) + '-' +
           IntToHex(GUID1.D4[6], 2) + '-' +
           IntToHex(GUID1.D4[7], 2);
       end;
     end;
   end;
 end;


procedure InicializaTransacoes;
VAR
  vlTransacao: integer;
begin
  if idTransacaoRAC <> NIL then
     idTransacaoRAC := NIL;
  idTransacaoRAC := _dm._conexao.BeginTransaction;

end;

procedure ConfirmaTransacoes;
begin
  if _dm._conexao.InTransaction then
    _dm._conexao.CommitFreeAndNil(idTransacaoRAC);

end;

procedure CancelaTransacoes;
begin
  if _dm._conexao.InTransaction then
    _dm._conexao.RollbackFreeAndNil(idTransacaoRAC);

end;


function SetDataSistema: boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    result := true;
    stQry.Add('SELECT');
    stQry.Add('TO_CHAR(DATE_E,''dd/mm/yyyy'') AS DT_EMPRESA,');
    stQry.Add('NOME_E , ATGE_E,TO_CHAR(DAPE_E,''dd/mm/yyyy'') AS DT_PEDIDO,');
    stQry.Add('ID_ATUALIZA_EMAIL,PC_ATRASO_BLOQUEIO,DT_AGENDAMENTO_ROTA,');
    stQry.Add('TO_CHAR(SYSDATE, ''HH24:MI:ss'') as HORA,ID_HORARIO');
    stQry.Add('HR_TOLERANCIA_HORARIO');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCEMP');
    try
      with _dm._cdsGenerico do
      begin
        close;
        CommandText := stQry.Text;
        open;
      end;
      result := false;
    except
      on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        Mensagem('Erro Na Consulta Base...' + #13 +
          'O sistema Sera Finalizado',MB_ICONERROR);
      end;

    end;
    if not _dm._cdsGenerico.IsEmpty then
    begin
      result := true;
      dtSistema := _dm._cdsGenerico.fieldByName('DT_EMPRESA').AsDateTime;
      // dtPedidoSistema           :=_dmPrincipal._cdsGenerico.fieldByName('DT_PEDIDO').AsDateTime;
      hrSistema := _dm._cdsGenerico.fieldByName('HORA').AsString;
      // nrMinutosToleranciaSistema:=_dmPrincipal._cdsGenerico.fieldByName('HR_TOLERANCIA_HORARIO').AsInteger;
      //AtualizaHoraMicro(dtSistema, StrToTimeDef(hrSistema, now));
    end;
  finally
    FreeAndNil(stQry);
  end;
end;


end.
