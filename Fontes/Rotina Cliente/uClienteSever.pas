// 
// Created by the DataSnap proxy generator.
// 13/01/2012 14:43:24
// 

unit uClienteSever;

interface

uses DBXCommon,  DBXJSON,  Classes, SysUtils, DB, SqlExpr, DBXDBReaders, DBXJSONReflect;

type
  T_dmServerModuloPrincipalClient = class(TDSAdminClient)
  private
    FAloTesteCommand: TDBXCommand;
    FClienteAtivoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AloTeste: string;
    function ClienteAtivo(nrCliente: Integer; nrOperadorLogistico: Integer; prEntrada: WideString): string;
  end;

implementation

function T_dmServerModuloPrincipalClient.AloTeste: string;
begin
  if FAloTesteCommand = nil then
  begin
    FAloTesteCommand := FDBXConnection.CreateCommand;
    FAloTesteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAloTesteCommand.Text := 'T_dmServerModuloPrincipal.AloTeste';
    FAloTesteCommand.Prepare;
  end;
  FAloTesteCommand.ExecuteUpdate;
  Result := FAloTesteCommand.Parameters[0].Value.GetWideString;
end;

function T_dmServerModuloPrincipalClient.ClienteAtivo(nrCliente: Integer; nrOperadorLogistico: Integer; prEntrada: WideString): string;
begin
  if FClienteAtivoCommand = nil then
  begin
    FClienteAtivoCommand := FDBXConnection.CreateCommand;
    FClienteAtivoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteAtivoCommand.Text := 'T_dmServerModuloPrincipal.ClienteAtivo';
    FClienteAtivoCommand.Prepare;
  end;
  FClienteAtivoCommand.Parameters[0].Value.SetInt32(nrCliente);
  FClienteAtivoCommand.Parameters[1].Value.SetInt32(nrOperadorLogistico);
  FClienteAtivoCommand.Parameters[2].Value.SetWideString(prEntrada);
  FClienteAtivoCommand.ExecuteUpdate;
  Result := FClienteAtivoCommand.Parameters[3].Value.GetWideString;
end;


constructor T_dmServerModuloPrincipalClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor T_dmServerModuloPrincipalClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor T_dmServerModuloPrincipalClient.Destroy;
begin
  FreeAndNil(FAloTesteCommand);
  FreeAndNil(FClienteAtivoCommand);
  inherited;
end;

end.
