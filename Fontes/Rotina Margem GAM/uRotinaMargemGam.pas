unit uRotinaMargemGam;

interface

uses SysUtils,Math,SqlExpr,DB;

type
  TParametrosRotinaMargemGam = class(TObject)
    public
      tipoRegistro                     : Char;
      dataReferencia                   : TDateTime;
      codigoCliente                    : Integer;
      codigoMercadoria                 : Integer;
      valorUnitarioFlex                : Double;
      sinalFlex                        : char;
      valorUnitarioVerba               : Double;
      quantidadeMercadoria             : integer;
      indicadorDescontoInformado       : char;
      percentualDescontoInformado      : double;
      meioVenda                        : Integer;
      codigoOperadorLogistico          : Integer;
      codigoEmpresa                    : Byte;
      percentualDespesaVariavel        : double;
      classificacaoMercadoria          : Integer; // medicamento/perfumaria
      valorUnitarioVenda               : double;
      valorUnitarioDiferencialAliquota : double;
      aliquotaRepasse                  : double;
      valorTotalImpostos               : double;
      valorSustituicaoTributaria       : double;
      aliquotaICMS                     : double;
      isOrgaoPublico                   : char;
      valorUnitarioCustoGerencial      : double;
      indicadorPisCofins               : char;
      valorUnitarioMargem              : double;
      percentualMargem                 : double;
      valorPrecoBase                   : double;
      conexao                          : TSQLConnection;
      ufCliente                        : String[2];

      constructor create;

end;

type
  TRotinaMargemGam = Class(TObject)
  private
    outValorMargem                 : double;
    outPercentualMargem            : double;
    outValorCorrigidoMargem        : double;
    outValorUnitarioVenda          : double;
    outValorUnitarioCustoGerencial : double;
    outValorVerbaABaixar           : double;
    outValorRepasse                : double;
    outValorVerba                  : double;
    outPercentualVerba             : double;
    outErroRotina                  : WideString;
    parametroEntradaRotina         : WideString;
    conexao                        : TSQLConnection;

    function insereCaracterEsquerda(Valor:String;Caracter:Char;Tamanho:Integer):String;
    function arredondar(Value: Extended; Decimals: integer): Extended;

    procedure setParametrosSaida(parametrosSaidaRotina,erroRotina : WideString);
    function insereCaracterDireita(Valor: String; Caracter: Char;
      Tamanho: Integer): String;
  protected

  public
    function getValorMargem:double;
    function getPercentualMargem : double;
    function getValorCorrigidoMargem : double;
    function getValorUnitarioVenda : double;
    function getValorUnitarioCustoGerencial : double;
    function getVerbaABaixar : double;
    function getValorVerba : double;
    function getPercentualVerba : double;
    function getErroRotina : WideString;

    procedure setParametrosEntrada(parametrosEntrada : TParametrosRotinaMargemGam);
    procedure executaRotina;

  published

end;

implementation

uses uDm;


procedure TRotinaMargemGam.setParametrosSaida(parametrosSaidaRotina,erroRotina : WideString);
begin
  outValorMargem                 := (StrToFloat(copy(parametrosSaidaRotina,1,14)))/1000000;
  outPercentualMargem            := (StrToFloat(copy(parametrosSaidaRotina,15,8)))/100;
  outValorCorrigidoMargem        := (StrToFloat(copy(parametrosSaidaRotina,23,14)))/1000000;
  outValorUnitarioVenda          := (StrToFloat(copy(parametrosSaidaRotina,37,14)))/100;
  outValorUnitarioCustoGerencial := (StrToFloat(copy(parametrosSaidaRotina,51,14)))/1000000;
  outValorVerbaABaixar           := (StrToFloat(copy(parametrosSaidaRotina,65,14)))/100;
  outValorRepasse                := (StrToFloat(copy(parametrosSaidaRotina,79,14)))/1000000;
  outValorVerba                  := (StrToFloat(copy(parametrosSaidaRotina,93,14)))/100;
  outPercentualVerba             := (StrToFloat(copy(parametrosSaidaRotina,107,8)))/100;
end;

procedure TRotinaMargemGam.setParametrosEntrada(parametrosEntrada : TParametrosRotinaMargemGam);
begin

  if parametrosEntrada.conexao = nil then
    raise Exception.Create('Não foi informado a conexao nos parametros de entrada');

  parametroEntradaRotina := parametrosEntrada.tipoRegistro;
  parametroEntradaRotina := parametroEntradaRotina + FormatDateTime('ddMMyy',parametrosEntrada.dataReferencia);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(IntToStr(parametrosEntrada.codigoCliente),'0',6);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(IntToStr(parametrosEntrada.codigoMercadoria),'0',6);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorUnitarioFlex,6) * 1000000),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + parametrosEntrada.sinalFlex;
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorUnitarioVerba,6) * 1000000),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(IntToStr(parametrosEntrada.quantidadeMercadoria),'0',6);
  parametroEntradaRotina := parametroEntradaRotina + parametrosEntrada.indicadorDescontoInformado;
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.percentualDescontoInformado,2) * 100),'0',5);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(intToStr(parametrosEntrada.meioVenda),'0',6);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(intToStr(parametrosEntrada.codigoOperadorLogistico),'0',6);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(intToStr(parametrosEntrada.codigoEmpresa),'0',1);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.percentualDespesaVariavel,2) * 100),'0',5);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(intToStr(parametrosEntrada.classificacaoMercadoria),'0',1);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorUnitarioVenda,2) * 100),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorUnitarioDiferencialAliquota,2) * 100),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.aliquotaRepasse,2) * 100),'0',5);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorTotalImpostos,6) * 1000000),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorSustituicaoTributaria,2) * 100),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.aliquotaICMS,2) * 100),'0',5);
  parametroEntradaRotina := parametroEntradaRotina + parametrosEntrada.isOrgaoPublico;
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorUnitarioCustoGerencial,6) * 1000000),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + parametrosEntrada.indicadorPisCofins;
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorUnitarioMargem,2) * 100),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.percentualMargem,2) * 100),'0',5);
  parametroEntradaRotina := parametroEntradaRotina + insereCaracterEsquerda(FloatToStr(arredondar(parametrosEntrada.valorPrecoBase,2) * 100),'0',13);
  parametroEntradaRotina := parametroEntradaRotina + parametrosEntrada.ufCliente;


  conexao := parametrosEntrada.conexao;
end;

procedure TRotinaMargemGam.executaRotina;
var
  //tempRotina : TSQLStoredProc;
  tempParametroSaida : WideString;
  tempErroRotina : WideString;
begin
  try
   // tempRotina := TSQLStoredProc.Create(nil);
  //  tempRotina.SQLConnection := conexao;
//    tempRotina.StoredProcName := 'PR_MARGEM_GAM';
    try
    _dm._spMargemGAM.Close;
    _dm._spMargemGAM.SQLConnection:=_dm._conexao;
    _dm._spMargemGAM.ParamByname('entrada_in').AsString  := parametroEntradaRotina;
    _dm._spMargemGAM.ExecProc;
    tempParametroSaida := _dm._spMargemGAM.ParamByname('saida_ou').AsString;
    tempErroRotina := _dm._spMargemGAM.ParamByname('erro_ou').AsString;

    if tempErroRotina='4' then
    begin
       raise Exception.create('Mercadoria sem preço para este Meio');
    end;

    setParametrosSaida(tempParametroSaida,tempErroRotina);
    except
        sleep(0);
    end;

  finally
    _dm._spMargemGAM.Close;
//    tempRotina.Free;
//    tempRotina := nil;
  end;

end;

function TRotinaMargemGam.arredondar(Value: Extended; Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  { A conversão para string e depois para float evita
    erros de arredondamentos indesejáveis. }
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    Result := Result + 1
  else if Fraction <= -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;

function TRotinaMargemGam.insereCaracterEsquerda(Valor:String;Caracter:Char;Tamanho:Integer):String;
Var
  i : integer;
begin
  Result := '';
  if (Tamanho - Length(Valor))<=0 then
  begin
    Result := Valor;
    Exit;
  end;
  for i:=1 to Tamanho - Length(Valor) do
  begin
    Result :=Result + Caracter;
  end;
  Result := Result + Valor;
end;

function TRotinaMargemGam.insereCaracterDireita(Valor:String;Caracter:Char;Tamanho:Integer):String;
Var
  i : integer;
begin
  Result := '';
  if (Tamanho - Length(Valor))<=0 then
  begin
    Result := Valor;
    Exit;
  end;
  for i:=1 to Tamanho - Length(Valor) do
  begin
    Result :=Result + Caracter;
  end;
  Result :=  Valor + Result;
end;


function TRotinaMargemGam.getValorMargem:double;
begin
  result := outValorMargem;
end;

function TRotinaMargemGam.getPercentualMargem:double;
begin
  result := outPercentualMargem;
end;

function TRotinaMargemGam.getValorCorrigidoMargem:double;
begin
  result := outValorCorrigidoMargem;
end;

function TRotinaMargemGam.getValorUnitarioVenda:double;
begin
  result := outValorUnitarioVenda;
end;

function TRotinaMargemGam.getValorUnitarioCustoGerencial : double;
begin
  result := outValorUnitarioCustoGerencial;
end;

function TRotinaMargemGam.getVerbaABaixar : double;
begin
  result := outValorVerbaABaixar;
end;

function TRotinaMargemGam.getValorVerba : double;
begin
  result := outValorVerba;
end;

function TRotinaMargemGam.getPercentualVerba : double;
begin
  result := outPercentualVerba;
end;

function TRotinaMargemGam.getErroRotina : WideString;
begin
  result := outErroRotina;
end;

constructor TParametrosRotinaMargemGam.create;
begin
  conexao := nil;
end;




end.
