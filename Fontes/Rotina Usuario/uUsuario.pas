unit uUsuario;

interface

uses SysUtils,classes ,Math, SqlExpr, DB, uDm, uRotinasGenericas;


type
  TSituacao = (ativo,inativo,desconhecida);
  TAcesso    =(Liberado,Negado);

  TAmbiente = (Producao,Homologacao);

  TUsuario = Class(TObject)
  private
    FdsNomeCompleto: string;
    FidAmbiente: TAmbiente;
    FidSituacao: TSituacao;
    FnrCodigo: integer;
    FnrMatricula: integer;
    FdsSenha: string;
    FdsLogin: string;
    procedure setdsLogin(const Value: string);
    procedure setdsNomeCompleto(const Value: string);
    procedure setdsSenha(const Value: string);
    procedure setidAmbiente(const Value: TAmbiente);
    procedure setidSituacao(const Value: TSituacao);
    procedure setnrCodigo(const Value: integer);
    procedure setnrMatricula(const Value: integer);
  public

    property nrMatricula    : integer read FnrMatricula   write setnrMatricula;
    property dsLogin        : string  read FdsLogin       write setdsLogin;
    property dsSenha        : string  read FdsSenha        write setdsSenha;
    property dsNnomeCompleto: string  read FdsNomeCompleto write setdsNomeCompleto;
    property nrCodigo       : integer read FnrCodigo       write setnrCodigo;
    property idSituacao     : TSituacao read FidSituacao write setidSituacao;
    property idAmbiente     : TAmbiente read FidAmbiente write setidAmbiente;

  protected

  End;
 function strToSituacao(str:string):TSituacao;
 function strToAcesso(idTipo:Boolean):TAcesso;

 function GetUsuario(PcdUsuario,PcdUsuarioGeral:Integer;PIdUsuario, PSenha: String): TUsuario;
 function isSenhaValida(aSenhaInformada,aSenhaDB:string):Boolean;
 function criptografaMD5(value:AnsiString):string;
 function ValidaPermissaoAcesso(PcdSistema,PnrMatricula:Integer): Boolean;
 procedure InicializarDadosTelaSistema;
 function CarregaTelaAcesso(PcdSistema,PnrMatricula:Integer): Boolean;





implementation

uses MessageDigest_5;

function strToSituacao(str:string):TSituacao;
begin
  case str[1] of
    'A' : Result:=ativo;
    'I' : Result:=inativo;
    else
      Result:=desconhecida;
  end;
end;
function strToAcesso(idTipo:Boolean):TAcesso;
begin
  case idTipo of
    true : Result:=Liberado;
    false: Result:=Negado;
  end;
end;


function GetUsuario(PcdUsuario,PcdUsuarioGeral:Integer;PIdUsuario, PSenha: String): TUsuario;
var
  tempQuery: TSQLQuery;
  Usuario :TUsuario;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    Usuario:=TUsuario.Create;
    with tempQuery do
    begin
      SQL.Add('SELECT NM_USUARIO,NR_MATRICULA,CD_USUARIO,DS_LOGIN,DS_PASSWD,CD_EMPRESA,ID_ATIVO');
      SQL.Add('FROM');
      SQL.Add('ACESSO.DC_USUARIO');
      SQL.Add('WHERE');
      if (PIdUsuario)<>'' then
        SQL.Add('DS_LOGIN =:PnrLogin');
      if (PSenha)<>'' then
        SQL.Add(' and DS_PASSWD=:PdsPasswd');
     ParamByName('PnrLogin').AsString:=PIdUsuario;

     Open;
    end;
    Result:=nil;
    if not tempQuery.IsEmpty then
    begin
      Usuario.dsNnomeCompleto:= tempQuery.FieldByName('NM_USUARIO').AsString;
      Usuario.dsLogin        := tempQuery.FieldByName('DS_LOGIN').AsString;
      Usuario.dsSenha        := tempQuery.FieldByName('DS_PASSWD').AsString;
      Usuario.nrMatricula    := tempQuery.FieldByName('NR_MATRICULA').AsInteger;
      Usuario.nrCodigo       := tempQuery.FieldByName('CD_USUARIO').AsInteger;
      Usuario.idSituacao     := strToSituacao(tempQuery.FieldByName('ID_ATIVO').AsString);

      Result:=Usuario;
    end;
  finally
    FreeAndNil(tempQuery);
    //FreeAndNil(Usuario);
  end;
end;

function ValidaPermissaoAcesso(PcdSistema,PnrMatricula:Integer): Boolean;
var
  tempQuery: TSQLQuery;
  Usuario :TUsuario;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    Usuario:=TUsuario.Create;
    with tempQuery do
    begin
      SQL.Add('SELECT 1 FROM ACESSO.V_ACESSO_SISTEMA');
      SQL.Add('WHERE NR_MATRICULA = :PnrMatricula AND CD_SISTEMA = :PcdSistema');
      ParamByName('PnrMatricula').AsInteger:=PnrMatricula;
      ParamByName('PcdSistema').AsInteger:=PcdSistema;
      Open;
    end;
    Result:=false;
    if not tempQuery.IsEmpty then
    Result:=true;

  finally
    FreeAndNil(tempQuery);
    //FreeAndNil(Usuario);
  end;
end;


function CarregaTelaAcesso(PcdSistema,PnrMatricula:Integer): Boolean;
var
  tempQuery: TSQLQuery;
  Usuario :TUsuario;
  i :Integer;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    Usuario:=TUsuario.Create;
    with tempQuery do
    begin
      SQL.Add('SELECT CD_TELA, NM_TELA, DS_TELA FROM ACESSO.V_ACESSO_TELA');
      SQL.Add('WHERE NR_MATRICULA = :PnrMatricula AND CD_SISTEMA = :PcdSistema');
      ParamByName('PnrMatricula').AsInteger:=PnrMatricula;
      ParamByName('PcdSistema').AsInteger:=PcdSistema;
      Open;
      First;
    end;
    i:=0;
    while not tempQuery.Eof do
    begin
      telaLiberada[i].codigo   :=tempQuery.FieldByName('CD_TELA').AsInteger;
      telaLiberada[i].descri??o:=tempQuery.FieldByName('CD_TELA').AsString;
      inc(i);
      tempQuery.Next;
    end;
    Result:=true;

  finally
    FreeAndNil(tempQuery);
    //FreeAndNil(Usuario);
  end;
end;

procedure InicializarDadosTelaSistema;
var
  i: integer;
begin
  for i:= 0 to 99 do
  begin
    telaLiberada[i].codigo:=0;
    telaLiberada[i].descri??o:='';
    telaLiberada[i].nomeMenu:=nil;
  end;
end;


function isSenhaValida(aSenhaInformada,aSenhaDB:string):Boolean;
begin
  aSenhaInformada:=criptografaMD5(aSenhaInformada);
  Result:=isHexEquals(aSenhaInformada,aSenhaDB);
end;


function criptografaMD5(value:AnsiString):string;
var
  hash: MessageDigest_5.IMD5;
begin
  hash := MessageDigest_5.GetMD5();
  hash.Update(Value);
  Result := hash.AsString();
end;






{ TUsuario }

procedure TUsuario.setdsLogin(const Value: string);
begin
  FdsLogin := Value;
end;

procedure TUsuario.setdsNomeCompleto(const Value: string);
begin
  FdsNomeCompleto := Value;
end;

procedure TUsuario.setdsSenha(const Value: string);
begin
  FdsSenha := Value;
end;

procedure TUsuario.setidAmbiente(const Value: TAmbiente);
begin
  FidAmbiente := Value;
end;

procedure TUsuario.setidSituacao(const Value: TSituacao);
begin
  FidSituacao := Value;
end;

procedure TUsuario.setnrCodigo(const Value: integer);
begin
  FnrCodigo := Value;
end;

procedure TUsuario.setnrMatricula(const Value: integer);
begin
  FnrMatricula := Value;
end;

end.
