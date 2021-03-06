unit uDm;

interface

uses
  SysUtils, Classes, DBXOracle, DB, SqlExpr, FMTBcd, Provider, DBClient,
  TConnect;

type
  T_dm = class(TDataModule)
    _conexao: TSQLConnection;
    _LocalConexao: TLocalConnection;
    _dspGenerica: TDataSetProvider;
    _sqlGenerica: TSQLQuery;
    _spNumeroPedido: TSQLStoredProc;
    _spMargemGAM: TSQLStoredProc;
    _spInformacaoProduto: TSQLStoredProc;
    _cdsUsuario: TClientDataSet;
    _cdsUsuarioCD_USUARIO: TFMTBCDField;
    _cdsUsuarioNM_USUARIO: TWideStringField;
    _cdsUsuarioNR_CCUSTO: TFMTBCDField;
    _cdsUsuarioNM_LOGIN: TWideStringField;
    _cdsUsuarioID_COMISSAO: TWideStringField;
    _cdsUsuarioDS_PASSWD: TWideStringField;
    _cdsUsuarioNR_GRUPO: TFMTBCDField;
    _cdsUsuarioID_PRIVILEGIO: TFMTBCDField;
    _cdsUsuarioHR_INICIAL: TFMTBCDField;
    _cdsUsuarioHR_FINAL: TFMTBCDField;
    _cdsUsuarioPC_MARGEM: TFMTBCDField;
    _cdsUsuarioNR_MATRICULA: TFMTBCDField;
    _dsUsuario: TDataSource;
    _cdsGenerico: TClientDataSet;
    _conexaoSihst: TSQLConnection;
    _sqlGenericaSihst: TSQLQuery;
    _dspGenericasihst: TDataSetProvider;
    _cdsGenericoSihst: TClientDataSet;
    _cdsPrazo: TClientDataSet;
    _cdsPrazonrParcela: TIntegerField;
    _cdsPrazonrDiasPrazo: TIntegerField;
    _cdsPrazonrCondicao: TIntegerField;
    _spClienteAtivo: TSQLStoredProc;
    _stpBloqueioCliente: TSQLStoredProc;
    procedure _conexaoAfterConnect(Sender: TObject);
    function criaQueryGenerica:TSQLQuery;
    function criaQueryGenericaSihst: TSQLQuery;
    procedure _conexaoSihstAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
     senhaEncriptada:String[30];
    function RunQueryUsuario(cdUsuario:Integer;IdDousuario, Senha: String): Boolean;


    { Public declarations }
  end;

var
  _dm: T_dm;
  AtualizabaseRac :TTransactionDesc ;
  AtualizabaseCD :TTransactionDesc ;


implementation

{$R *.dfm}

procedure T_dm._conexaoAfterConnect(Sender: TObject);
begin
  _conexao.Execute('alter session set NLS_NUMERIC_CHARACTERS=''.,''', NIL,NIL);
  _conexao.Execute('alter session set NLS_date_format=''dd/mm/RRRR HH24:MI:SS''', NIL,NIL);

end;

procedure T_dm._conexaoSihstAfterConnect(Sender: TObject);
begin
  _conexaoSihst.Execute('alter session set NLS_NUMERIC_CHARACTERS=''.,''', NIL,NIL);
  _conexaoSihst.Execute('alter session set NLS_date_format=''dd/mm/RRRR HH24:MI:SS''', NIL,NIL);

end;

function T_dm.criaQueryGenerica:TSQLQuery;
var
  bQuery : TSQLQuery;
begin
  bQuery               := TSQLQuery.Create(nil);
  bQuery.SQLConnection := _dm._conexao;
  bQuery.DisableControls;
  result := bQuery;
end;

function T_dm.criaQueryGenericaSihst:TSQLQuery;
var
  bQuery : TSQLQuery;
begin
  bQuery               := TSQLQuery.Create(nil);
  bQuery.SQLConnection := _dm._conexaoSihst;
  bQuery.DisableControls;
  result := bQuery;
end;

procedure T_dm.DataModuleCreate(Sender: TObject);
begin

end;

(**********************************************************************)
(**********************************************************************)
function T_dm.RunQueryUsuario(cdUsuario:Integer;IdDousuario, Senha: String): Boolean;
begin
    Result := False;

    if  Not _cdsUsuario.IsEmpty Then
    Begin
        _cdsUsuario.recordcount;
        if _cdsUsuarioCD_USUARIO.AsInteger > 0 then
        begin
            Result := True;
            senhaEncriptada:=_cdsUsuarioDS_PASSWD.AsString;
           // nmlogin :=_cdsUsuarioNM_LOGIN.AsString;

//            nrCentroCusto       := _cdsUsuarioNR_CCUSTO.AsInteger;
           // cdUsuarioSistema    := _cdsUsuarioCD_USUARIO.AsInteger;
           // nmUsuario           := _cdsUsuarioNM_USUARIO.AsString;
           // idPrivilegio        := _cdsUsuarioID_PRIVILEGIO.AsInteger;
           // nrCompradorSistema  := _cdsUsuarioNR_GRUPO.AsInteger;
        end
        Else
            Result := False;
    End
    Else
      Result := False;
end;



end.
