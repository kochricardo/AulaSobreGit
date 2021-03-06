unit uCadastroParamentoVan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModelo, DB, Menus, ActnList, ImgList, ComCtrls, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, ToolWin, uDm, FMTBcd, Mask, DBCtrls, DBClient,
  Provider, SqlExpr, DBTables, MConnect, uRotinasGenericas, uRotinaMargemGam,
  uAuxiliarCompras, uProduto;
type
  RVan = record
  nrFornecedor :Integer;
  nrSequencia  :Integer;
end;
type
  T_frmCadastroParamentoVan = class(T_frmModelo)
    _dbrgTipoCodioBarra: TDBRadioGroup;
    _dbrgidCaixaFechada: TDBRadioGroup;
    _dbrgIdVAN: TDBRadioGroup;
    _sqlVAN: TSQLQuery;
    _dspVAN: TDataSetProvider;
    _cdsVAN: TClientDataSet;
    _cdsVANCD_SEQUENCIA: TFMTBCDField;
    _cdsVANID_VAN: TWideStringField;
    _cdsVANNR_LABORATORIO: TFMTBCDField;
    _cdsVANDS_IDENTIFICACAO_VAN: TWideStringField;
    _cdsVANDS_CONDICAO_PAGTO: TWideStringField;
    _cdsVANNR_CNPJ_FORNECEDOR: TFMTBCDField;
    _cdsVANDS_IDENTIFICACAO_FORNECEDOR: TWideStringField;
    Label1: TLabel;
    _dbrNrForncedor: TDBEdit;
    Label2: TLabel;
    _dbeNomeFantasia: TDBEdit;
    Label3: TLabel;
    _dbeIndentificacaoVan: TDBEdit;
    Label4: TLabel;
    _dbeCondicaoPagamento: TDBEdit;
    Label5: TLabel;
    _dbeNrParcelas: TDBEdit;
    Label6: TLabel;
    _dbeNrDias: TDBEdit;
    Label7: TLabel;
    _dbeDiretorio: TDBEdit;
    Label8: TLabel;
    _dbeNrCNPJ: TDBEdit;
    _dspVanPesquisa: TDataSetProvider;
    _cdsVanPesquisa: TClientDataSet;
    FMTBCDField1: TFMTBCDField;
    WideStringField1: TWideStringField;
    FMTBCDField2: TFMTBCDField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    FMTBCDField5: TFMTBCDField;
    _sqlVanPesquisa: TSQLQuery;
    _cdsVANNR_PARCELA: TFMTBCDField;
    _cdsVANNR_DIAS: TFMTBCDField;
    _cdsVANDS_DIRETORIO_PEDIDO: TWideStringField;
    _cdsVANID_CODIGO_BARRAS: TWideStringField;
    _cdsVANID_CAIXA_FECHADA: TWideStringField;
    _sqlVANCD_SEQUENCIA: TFMTBCDField;
    _sqlVANID_VAN: TWideStringField;
    _sqlVANNR_LABORATORIO: TFMTBCDField;
    _sqlVANDS_IDENTIFICACAO_VAN: TWideStringField;
    _sqlVANDS_CONDICAO_PAGTO: TWideStringField;
    _sqlVANNR_PARCELA: TFMTBCDField;
    _sqlVANNR_DIAS: TFMTBCDField;
    _sqlVANNR_CNPJ_FORNECEDOR: TFMTBCDField;
    _sqlVANDS_DIRETORIO_PEDIDO: TWideStringField;
    _sqlVANDS_IDENTIFICACAO_FORNECEDOR: TWideStringField;
    _sqlVANID_CODIGO_BARRAS: TWideStringField;
    _sqlVANID_CAIXA_FECHADA: TWideStringField;
    _sqlVAN2: TSQLDataSet;
    _sqlVAN2CD_SEQUENCIA: TFMTBCDField;
    _sqlVAN2ID_VAN: TWideStringField;
    _sqlVAN2NR_LABORATORIO: TFMTBCDField;
    _sqlVAN2DS_IDENTIFICACAO_VAN: TWideStringField;
    _sqlVAN2DS_CONDICAO_PAGTO: TWideStringField;
    _sqlVAN2SIGT_T: TWideStringField;
    _sqlVAN2NR_PARCELA: TFMTBCDField;
    _sqlVAN2NR_DIAS: TFMTBCDField;
    _sqlVAN2NR_CNPJ_FORNECEDOR: TFMTBCDField;
    _sqlVAN2DS_DIRETORIO_PEDIDO: TWideStringField;
    _sqlVAN2DS_IDENTIFICACAO_FORNECEDOR: TWideStringField;
    _sqlVAN2ID_CODIGO_BARRAS: TWideStringField;
    _sqlVAN2ID_CAIXA_FECHADA: TWideStringField;
    Label9: TLabel;
    _dbeIdentificacaoFornecedor: TDBEdit;
    _sqlVANDS_GRUPO_FORNECEDOR: TWideStringField;
    _cdsVANDS_GRUPO_FORNECEDOR: TWideStringField;
    _cdsVanPesquisaDS_GRUPO_FORNECEDOR: TWideStringField;
    procedure _dbgPesquisaDblClick(Sender: TObject);
    procedure _dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acGravarExecute(Sender: TObject);
    procedure _dspVANBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure _cdsVANBeforeInsert(DataSet: TDataSet);
    procedure _cdsVANBeforePost(DataSet: TDataSet);
    procedure acIncluirExecute(Sender: TObject);
    procedure _dbrNrForncedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbrgidCaixaFechadaClick(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure _dbrNrForncedorExit(Sender: TObject);
//    procedure GetTemporayKey(DataSet: TDataSet);
   private
    function GetDadosVan(PcdSequencia,PnrFornecedor: Integer):RVan;

    procedure UpdateDeltaValue (DeltaDs : TCustomClientDataSet; FieldName : string; NewValue : variant);
    function InsereNovoFornecedor(cdSEQUENCIA:Integer;
                                  idVAN:String;
                                  nrLABORATORIO:Integer;
                                  dsIDENTIFICACAO_VAN:String;
                                  dsCONDICAO_PAGTO:String;
                                  nrPARCELA:Integer;
                                  nrDIAS:Integer;
                                  dsDIRETORIO_PEDIDO:String;
                                  nrCNPJ_FORNECEDOR:String;
                                  dsIDENTIFICACAO_FORNECEDOR:String;
                                  idCODIGO_BARRAS:String;
                                  idCAIXA_FECHADA:String;
                                  dsENVIO_ARQUIVO:String):Boolean;
    function AlteraNovoFornecedor(cdSEQUENCIA: Integer; idVAN: String;
      nrLABORATORIO: Integer; dsIDENTIFICACAO_VAN, dsCONDICAO_PAGTO: String;
      nrPARCELA, nrDIAS: Integer; dsDIRETORIO_PEDIDO, nrCNPJ_FORNECEDOR,
      dsIDENTIFICACAO_FORNECEDOR, idCODIGO_BARRAS, idCAIXA_FECHADA,
      dsENVIO_ARQUIVO: String): Boolean;
    function DeleteItenDcVAN(PcdSEQUENCIA, PnrForncdor: Integer): Boolean;
    function ConsultaCadastroVan(PcdSEQUENCIA, PnrFornecdor: Integer): Boolean;
    procedure SelecionaFornecedor;
    function ValidaCampos: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCadastroParamentoVan: T_frmCadastroParamentoVan;
  van:RVan;

implementation

{$R *.dfm}

procedure T_frmCadastroParamentoVan._cdsVANBeforeInsert(DataSet: TDataSet);
begin
   DataSet.Tag:=GetTempKey(DataSet); //guarda uma chave tempor?ria

  DataSet.Tag:=GetTempKey(DataSet);
//  inherited;

end;

procedure T_frmCadastroParamentoVan._cdsVANBeforePost(DataSet: TDataSet);
begin

 //Incrementa('DC_VAN','CD_SEQUENCIA');
//  inherited;

end;

procedure T_frmCadastroParamentoVan._dbgPesquisaDblClick(Sender: TObject);
begin
  van:=GetDadosVan(dsPesquisa.dataset.FieldByName('CD_SEQUENCIA').AsInteger,
                  dsPesquisa.dataset.FieldByName('NR_LABORATORIO').AsInteger);

  inherited;

end;
procedure T_frmCadastroParamentoVan.UpdateDeltaValue(DeltaDs: TCustomClientDataSet;
  FieldName: string; NewValue: variant);
begin
 DeltaDs.edit;
 DeltaDs.FieldByName(FieldName).value:=NewValue;
 nrConta:=NewValue;
 DeltaDs.post;
end;



procedure T_frmCadastroParamentoVan._dbgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CASE KEY OF
       VK_RETURN :  GetDadosVan(dsPesquisa.dataset.FieldByName('NR_LABORATORIO').AsInteger,dsPesquisa.dataset.FieldByName('CD_SEQUENCIA').AsInteger);

  END;

//  inherited;

end;

procedure T_frmCadastroParamentoVan._dspVANBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  if UpdateKind=ukInsert then
    UpdateDeltaValue(DeltaDS,DeltaDS.Fields[0].FieldName,incrementa('DC_VAN','CD_SEQUENCIA'));

//  inherited;

end;

procedure T_frmCadastroParamentoVan.acExcluirExecute(Sender: TObject);
begin
 // inherited;

 if ConfirmaIcone('Excluir Registro do Envio de Arquivo','Excluir Registro?',4,32,0)=IDYES then
    if   DeleteItenDcVAN(_cdsVANCD_SEQUENCIA.AsInteger,_cdsVANNR_LABORATORIO.AsInteger) then
    begin
         Mensagem('Registro excluido!!!',MB_ICONINFORMATION);
         _cdsVAN.Close;
    end
    else
        Mensagem('N?o foi possivel excluir Registro !!!',MB_ICONERROR);




end;

procedure T_frmCadastroParamentoVan.acGravarExecute(Sender: TObject);
begin
  //inherited;

  if ds.DataSet.State=dsEdit then
  begin
  //inherited;
  AlteraNovoFornecedor(_cdsVANCD_SEQUENCIA.AsInteger,//cdSEQUENCIA:Integer;
                       _dbrgIdVAN.Value,//idVAN:String;
                       StrToIntDef(_dbrNrForncedor.Text,0),//nrLABORATORIO:Integer;
                      _dbeIndentificacaoVan.Text,//dsIDENTIFICACAO_VAN:String;
                      _dbeCondicaoPagamento.Text,// dsCONDICAO_PAGTO:String;
                      StrToIntDef(_dbeNrParcelas.Text,0),//  nrPARCELA:Integer;
                      StrToIntDef(_dbeNrDias.Text,0),// nrDIAS:Integer;
                      _dbeDiretorio.Text,// dsDIRETORIO_PEDIDO:String;
                      _dbeNrCNPJ.Text,// nrCNPJ_FORNECEDOR:String;
                      _dbeIdentificacaoFornecedor.Text,// dsIDENTIFICACAO_FORNECEDOR:String;
                      _dbrgTipoCodioBarra.Value,// idCODIGO_BARRAS:String;
                      _dbrgidCaixaFechada.Value,// idCAIXA_FECHADA:String;
                     ' ');
  end;

  if ds.DataSet.State=dsInsert then
  begin

  try
  InsereNovoFornecedor(Incrementa('DC_VAN','CD_SEQUENCIA'),//cdSEQUENCIA:Integer;
                      _dbrgIdVAN.Value,//idVAN:String;
                      _cdsVANNR_LABORATORIO.AsInteger,//nrLABORATORIO:Integer;
                      _cdsVANDS_IDENTIFICACAO_VAN.AsString,//dsIDENTIFICACAO_VAN:String;
                      _cdsVANDS_CONDICAO_PAGTO.AsString,// dsCONDICAO_PAGTO:String;
                      _cdsVANNR_PARCELA.AsInteger,//  nrPARCELA:Integer;
                      _cdsVANNR_DIAS.AsInteger,// nrDIAS:Integer;
                      _dbeDiretorio.text,// dsDIRETORIO_PEDIDO:String;
                      _cdsVANNR_CNPJ_FORNECEDOR.AsString,// nrCNPJ_FORNECEDOR:String;
                      _cdsVANDS_IDENTIFICACAO_FORNECEDOR.AsString,// dsIDENTIFICACAO_FORNECEDOR:String;
                      _dbrgTipoCodioBarra.Value,// idCODIGO_BARRAS:String;
                      _dbrgidCaixaFechada.Value,// idCAIXA_FECHADA:String;
                       ' ');
   Mensagem('Registro gravado!!!',MB_ICONERROR);
  except
     Mensagem('Erro ao inserir registro!!!',MB_ICONERROR);
     exit;
  end;
  end;

  _cdsVAN.Close;
  _cdsVAN.OPEN;
//  _cdsVanPesquisa.Close;
//  _cdsVanPesquisa.Open;

// CriaIndice('','NROV_V',0);
 PageControl1.ActivePage:=tbConsulta;

end;

function T_frmCadastroParamentoVan.GetDadosVan(PcdSequencia,PnrFornecedor: Integer):RVan;
var
  qryTemp :TSQLQuery;
begin

 try
   ds.DataSet.Close;
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;

  with qryTemp do
   begin
    Close;
    SQL.Add('SELECT');
    SQL.Add('Nvl(CD_SEQUENCIA,0) AS CD_SEQUENCIA,');
    SQL.Add('Nvl(ID_VAN,'' '') AS ID_VAN,');
    SQL.Add('case');
    SQL.Add('WHEN Nvl(NR_LABORATORIO,0)=0 THEN GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
    SQL.Add('WHEN Nvl(NR_LABORATORIO,0)>0 THEN NR_LABORATORIO');
    SQL.Add('END NR_LABORATORIO,');
    SQL.Add('nvl(DS_IDENTIFICACAO_VAN,'' '') AS DS_IDENTIFICACAO_VAN,');
    SQL.Add('Nvl(DS_CONDICAO_PAGTO,0) AS DS_CONDICAO_PAGTO,');
    SQL.Add('DS_GRUPO_FORNECEDOR ,');
    SQL.Add('Nvl(NR_PARCELA,0) AS NR_PARCELA,');
    SQL.Add('Nvl(NR_DIAS,0) AS NR_DIAS,');
    SQL.Add('Nvl(NR_CNPJ_FORNECEDOR,0) as NR_CNPJ_FORNECEDOR,');
    SQL.Add('Nvl(DS_DIRETORIO_PEDIDO,'' '') AS DS_DIRETORIO_PEDIDO,');
    SQL.Add('Nvl(DS_IDENTIFICACAO_FORNECEDOR, '' '') AS DS_IDENTIFICACAO_FORNECEDOR,');
    SQL.Add('Nvl(ID_CODIGO_BARRAS,'' '') AS ID_CODIGO_BARRAS,');
    SQL.Add('Nvl(ID_CAIXA_FECHADA,'' '') AS ID_CAIXA_FECHADA');
    SQL.Add('FROM');
    SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
    SQL.Add('JOIN  PRDDM.DC_VAN van ON VAN.NR_LABORATORIO=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
    if (PnrFornecedor>0) or (PcdSequencia>0) then
    SQL.Add('WHERE');

    if PcdSequencia>0 then
       SQL.Add(' CD_SEQUENCIA =:PcdSequencia');
    if (PnrFornecedor>0) and (PcdSequencia>0) then
       SQL.Add('and VAN.NR_LABORATORIO =:PnrFornecedor');
    if (PnrFornecedor>0) and (PcdSequencia=0) then
       SQL.Add('  VAN.NR_LABORATORIO =:PnrFornecedor');
   end;

  with _cdsVAN do
  begin
    close;
    _cdsVAN.CommandText:=qryTemp.Text;
    if PcdSequencia>0 then
       Params.ParamByName('PcdSequencia').AsInteger:=PcdSequencia;
    if PnrFornecedor>0 then
      Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
    Open;
  end;
  result.nrFornecedor:=0;
  result.nrSequencia:=0;
  if not _cdsVAN.IsEmpty then
  begin
   result.nrFornecedor:=PnrFornecedor;
   result.nrSequencia :=PcdSequencia;
   //PageControl1.ActivePage:= tbCadastro;
  end;
 finally
   FreeAndNil(qryTemp);
 end;


end;



function T_frmCadastroParamentoVan.InsereNovoFornecedor(cdSEQUENCIA:Integer;
                                                        idVAN:String;
                                                        nrLABORATORIO:Integer;
                                                        dsIDENTIFICACAO_VAN:String;
                                                        dsCONDICAO_PAGTO:String;
                                                        nrPARCELA:Integer;
                                                        nrDIAS:Integer;
                                                        dsDIRETORIO_PEDIDO:String;
                                                        nrCNPJ_FORNECEDOR:String;
                                                        dsIDENTIFICACAO_FORNECEDOR:String;
                                                        idCODIGO_BARRAS:String;
                                                        idCAIXA_FECHADA:String;
                                                        dsENVIO_ARQUIVO:String):Boolean;
var
  qryTemp :TSQLQuery;
begin

try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('INSERT INTO PRDDM.DC_VAN');
    SQL.Add('(CD_SEQUENCIA, ID_VAN, NR_LABORATORIO, DS_IDENTIFICACAO_VAN,');
    SQL.Add('DS_CONDICAO_PAGTO, NR_PARCELA, NR_DIAS, DS_DIRETORIO_PEDIDO,');
    SQL.Add('NR_CNPJ_FORNECEDOR, DS_IDENTIFICACAO_FORNECEDOR, ID_CODIGO_BARRAS,');
    SQL.Add('ID_CAIXA_FECHADA, DS_ENVIO_ARQUIVO)');
    SQL.Add('VALUES');
    SQL.Add('(:PCD_SEQUENCIA,:PidVAN, :PnrLABORATORIO,:PdsIDENTIFICACAO_VAN,');
    SQL.Add(':PdsCONDICAO_PAGTO,:PnrPARCELA,:PnrDIAS, :PdsDIRETORIO_PEDIDO,');
    SQL.Add(':PnrCNPJ_FORNECEDOR, :PdsIDENTIFICACAO_FORNECEDOR, :PidCODIGO_BARRAS,');
    SQL.Add(':PidCAIXA_FECHADA, :PdsENVIO_ARQUIVO)');
    ParamByName('PCD_SEQUENCIA').AsInteger:=cdSEQUENCIA;
    ParamByName('PidVAN').AsString:=idVAN;
    ParamByName('PnrLABORATORIO').AsInteger:=nrLABORATORIO;
    ParamByName('PdsCONDICAO_PAGTO').AsString:=dsCONDICAO_PAGTO;
    ParamByName('PdsIDENTIFICACAO_VAN').AsString:=dsIDENTIFICACAO_VAN;
    ParamByName('PnrPARCELA').AsInteger:=nrPARCELA;
    ParamByName('PnrDIAS').AsInteger:=nrDIAS;
    ParamByName('PdsDIRETORIO_PEDIDO').AsString:=dsDIRETORIO_PEDIDO;
    ParamByName('PnrCNPJ_FORNECEDOR').AsString:=nrCNPJ_FORNECEDOR;
    ParamByName('PdsIDENTIFICACAO_FORNECEDOR').AsString:=dsIDENTIFICACAO_FORNECEDOR;
    ParamByName('PidCODIGO_BARRAS').AsString:=idCODIGO_BARRAS;
    ParamByName('PidCAIXA_FECHADA').AsString:=idCAIXA_FECHADA;
    ParamByName('PdsENVIO_ARQUIVO').AsString:=dsENVIO_ARQUIVO;
    Result:=TRUE;
    if ExecSQL(False)<=0 then
       RESULT:=FALSE;

   end;
finally
 FreeAndNil(qryTemp);
end;
end;


procedure T_frmCadastroParamentoVan.acIncluirExecute(Sender: TObject);
begin
  //inherited;
 _cdsVAN.Close;
 PageControl1.ActivePageIndex:=0;
 GetDadosVan(1000,0);
 _cdsVAN.Edit;
 _dbrNrForncedor.SetFocus;
end;

function T_frmCadastroParamentoVan.AlteraNovoFornecedor(cdSEQUENCIA:Integer;
                                                        idVAN:String;
                                                        nrLABORATORIO:Integer;
                                                        dsIDENTIFICACAO_VAN:String;
                                                        dsCONDICAO_PAGTO:String;
                                                        nrPARCELA:Integer;
                                                        nrDIAS:Integer;
                                                        dsDIRETORIO_PEDIDO:String;
                                                        nrCNPJ_FORNECEDOR:String;
                                                        dsIDENTIFICACAO_FORNECEDOR:String;
                                                        idCODIGO_BARRAS:String;
                                                        idCAIXA_FECHADA:String;
                                                        dsENVIO_ARQUIVO:String):Boolean;
var
  qryTemp :TSQLQuery;
begin

try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('Update PRDDM.DC_VAN set');
    SQL.Add('ID_VAN=:PidVAN,DS_IDENTIFICACAO_VAN=:PdsIDENTIFICACAO_VAN,');
    SQL.Add('DS_CONDICAO_PAGTO=:PdsCONDICAO_PAGTO, NR_PARCELA=:PnrPARCELA,');
    SQL.Add('NR_DIAS=:PnrDIAS,DS_DIRETORIO_PEDIDO=:PdsDIRETORIO_PEDIDO,');
    SQL.Add('NR_CNPJ_FORNECEDOR=:PnrCNPJ_FORNECEDOR,');
    SQL.Add('DS_IDENTIFICACAO_FORNECEDOR=:PdsIDENTIFICACAO_FORNECEDOR,');
    SQL.Add('ID_CODIGO_BARRAS=:PidCODIGO_BARRAS,ID_CAIXA_FECHADA=:PidCAIXA_FECHADA,');
    SQL.Add('DS_ENVIO_ARQUIVO=:PdsENVIO_ARQUIVO');
    SQL.Add('where');
    SQL.Add('CD_SEQUENCIA=:PcdSEQUENCIA');
    SQL.Add('and NR_LABORATORIO=:PnrLABORATORIO');

    ParamByName('PcdSEQUENCIA').AsInteger:=cdSEQUENCIA;
    ParamByName('PidVAN').AsString:=idVAN;
    ParamByName('PnrLABORATORIO').AsInteger:=nrLABORATORIO;
    ParamByName('PdsCONDICAO_PAGTO').AsString:=dsCONDICAO_PAGTO;
    ParamByName('PdsIDENTIFICACAO_VAN').AsString:=dsIDENTIFICACAO_VAN;
    ParamByName('PnrPARCELA').AsInteger:=nrPARCELA;
    ParamByName('PnrDIAS').AsInteger:=nrDIAS;
    ParamByName('PdsDIRETORIO_PEDIDO').AsString:=dsDIRETORIO_PEDIDO;
    ParamByName('PnrCNPJ_FORNECEDOR').AsString:=nrCNPJ_FORNECEDOR;
    ParamByName('PdsIDENTIFICACAO_FORNECEDOR').AsString:=dsIDENTIFICACAO_FORNECEDOR;
    ParamByName('PidCODIGO_BARRAS').AsString:=idCODIGO_BARRAS;
    ParamByName('PidCAIXA_FECHADA').AsString:=idCAIXA_FECHADA;
    ParamByName('PdsENVIO_ARQUIVO').AsString:=dsENVIO_ARQUIVO;
    Result:=TRUE;
    if ExecSQL(False)<=0 then
       RESULT:=FALSE;

   end;
finally
 FreeAndNil(QryTemp)
end;


end;


procedure T_frmCadastroParamentoVan._dbrgidCaixaFechadaClick(Sender: TObject);
begin
  _cdsVANID_CAIXA_FECHADA.Value:=_dbrgidCaixaFechada.Value;
  inherited;

end;

procedure T_frmCadastroParamentoVan._dbrNrForncedorExit(Sender: TObject);
begin
  //inherited;

  if _dbeNomeFantasia.Text='' then
  begin
      SelecionaFornecedor;
  end;


end;

procedure T_frmCadastroParamentoVan._dbrNrForncedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //inherited;
  case key of
    VK_RETURN : begin
                  SelecionaFornecedor;
                end;
  end;


end;


function T_frmCadastroParamentoVan.DeleteItenDcVAN(PcdSEQUENCIA,PnrForncdor:Integer):Boolean;
var
  qryTemp :TSQLQuery;
begin

try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('Delete PRDDM.DC_VAN where ');
    SQL.Add('CD_SEQUENCIA=:PCD_SEQUENCIA and  NR_LABORATORIO=:PnrLABORATORIO');
    ParamByName('PCD_SEQUENCIA').AsInteger:=PcdSEQUENCIA;
    ParamByName('PnrLABORATORIO').AsInteger:=PnrForncdor;
    Result:=TRUE;
    if ExecSQL(False)<=0 then
       RESULT:=FALSE;
   end;
finally
 FreeAndNil(qryTemp);
end;
end;


function T_frmCadastroParamentoVan.ConsultaCadastroVan(PcdSEQUENCIA,PnrFornecdor:Integer):Boolean;
var
  qryTemp :TSQLQuery;
begin

try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('SELECT');
    SQL.Add('Nvl(CD_SEQUENCIA,0) AS CD_SEQUENCIA,');
    SQL.Add('Nvl(ID_VAN,'' '') AS ID_VAN,');
    SQL.Add('case');
    SQL.Add('WHEN Nvl(NR_LABORATORIO,0)=0 THEN GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
    SQL.Add('WHEN Nvl(NR_LABORATORIO,0)>0 THEN NR_LABORATORIO');
    SQL.Add('END NR_LABORATORIO,');
    SQL.Add('nvl(DS_IDENTIFICACAO_VAN,'' '') AS DS_IDENTIFICACAO_VAN,');
    SQL.Add('Nvl(DS_CONDICAO_PAGTO,0) AS DS_CONDICAO_PAGTO,');
    SQL.Add('DS_GRUPO_FORNECEDOR ,');
    SQL.Add('Nvl(NR_PARCELA,0) AS NR_PARCELA,');
    SQL.Add('Nvl(NR_DIAS,0) AS NR_DIAS,');
    SQL.Add('Nvl(NR_CNPJ_FORNECEDOR,0) as NR_CNPJ_FORNECEDOR,');
    SQL.Add('Nvl(DS_DIRETORIO_PEDIDO,'' '') AS DS_DIRETORIO_PEDIDO,');
    SQL.Add('Nvl(DS_IDENTIFICACAO_FORNECEDOR, '' '') AS DS_IDENTIFICACAO_FORNECEDOR,');
    SQL.Add('Nvl(ID_CODIGO_BARRAS,'' '') AS ID_CODIGO_BARRAS,');
    SQL.Add('Nvl(ID_CAIXA_FECHADA,'' '') AS ID_CAIXA_FECHADA');
    SQL.Add('FROM');
    SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
    SQL.Add('JOIN  PRDDM.DC_VAN van ON VAN.NR_LABORATORIO=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
   end;
   with _cdsVAN do
   begin
     close
   end;
finally


end;
end;


procedure T_frmCadastroParamentoVan.SelecionaFornecedor;
Var
 DadosFornecedor :TDadosFornecedor;
 nrTemp,nrFornecedor :Integer;

begin
                 nrFornecedor:=StrToIntDef(_dbrNrForncedor.Text,0);
                 Van:=GetDadosVan(0,nrFornecedor);
                 DadosFornecedor:=GetDadosLaboratorio(nrFornecedor);
                 if van.nrFornecedor=0 then
                 begin
                   _cdsVAN.close;
                   _cdsVAN.OPen;
                   _cdsVAN.Append;
                   _cdsVANCD_SEQUENCIA.AsInteger:=Incrementa('DC_VAN','CD_SEQUENCIA');
                   _cdsVANID_VAN.AsString:='T';
                   _cdsVANID_CAIXA_FECHADA.AsString:='N';
                   _cdsVANID_CODIGO_BARRAS.AsString:='1';
                   _cdsVANDS_GRUPO_FORNECEDOR.AsString:=DadosFornecedor.dsGrupoFornecedor;
                   _cdsVANNR_LABORATORIO.AsInteger:=DadosFornecedor.nrFornecedor;
                   _cdsVANNR_CNPJ_FORNECEDOR.AsString:=DadosFornecedor.stCNPJ;
                   _cdsVANDS_IDENTIFICACAO_VAN.AsString:=DadosFornecedor.stCNPJ;
                   _cdsVANDS_IDENTIFICACAO_FORNECEDOR.AsString:=DadosFornecedor.stCNPJ;
                   _cdsVANDS_CONDICAO_PAGTO.AsString:='99';
                   _cdsVANNR_PARCELA.AsInteger:=99;
                   _cdsVANNR_DIAS.AsInteger :=99;
                   _cdsVANDS_DIRETORIO_PEDIDO.AsString:='C:\EDIW\PEDIDOS';
                 end
                 else
                  GetDadosVan(van.nrSequencia,van.nrFornecedor);
end;


function T_frmCadastroParamentoVan.ValidaCampos:Boolean;
begin
   Result:=true;

   if _dbrgTipoCodioBarra.Value='' then
   begin
     Mensagem('Selecione tipo codigo de Barra !!!',MB_ICONWARNING);
     _dbrgTipoCodioBarra.SetFocus;
     Result:=false;
     exit;
   end;
   if _dbrgidCaixaFechada.Value='' then
   begin
     Mensagem('Selecione se ? Caixa fechada ou n?o !!!',MB_ICONWARNING);
     _dbrgidCaixaFechada.SetFocus;
     Result:=false;
     exit;
   end;
   if _dbrgIdVAN.Value='' then
   begin
     Mensagem('Selecione Van de Envio!!!',MB_ICONWARNING);
     _dbrgIdVAN.SetFocus;
     exit;
     Result:=false;
   end;



end;
end.
