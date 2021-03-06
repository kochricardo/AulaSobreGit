unit uCadastrodeVerbaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModelo, DB, Menus, ActnList, ImgList, ComCtrls, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, ToolWin, FMTBcd, Mask, DBCtrls, SqlExpr,
  Provider, DBClient;

type
  T_frmCadastroVerbaUsuario = class(T_frmModelo)
    _cdsVerbaXUsuario: TClientDataSet;
    _dspVerbaXUsuario: TDataSetProvider;
    _sqlVerbaXUsuario: TSQLQuery;
    _sqlPesquisaVerbaXUsuario: TSQLQuery;
    _dspPesquisaVerbaXUsuario: TDataSetProvider;
    _cdsPesquisaVerbaXUsuario: TClientDataSet;
    _cdsVerbaXUsuarioNR_VERBA: TFMTBCDField;
    _cdsVerbaXUsuarioNR_MATRICULA: TFMTBCDField;
    _cdsVerbaXUsuarioNM_USUARIO: TWideStringField;
    _cdsVerbaXUsuarioNM_USUARIO_1: TWideStringField;
    _cdsVerbaXUsuarioDT_ATUALIZACAO: TSQLTimeStampField;
    Label1: TLabel;
    _dbeNumeroVerba: TDBEdit;
    Label2: TLabel;
    _dbeNrMatricula: TDBEdit;
    Label3: TLabel;
    _dbeNegociador: TDBEdit;
    Label4: TLabel;
    _edtFornecedor: TEdit;
    _cdsPesquisaVerbaXUsuarioNR_VERBA: TFMTBCDField;
    _cdsPesquisaVerbaXUsuarioNR_MATRICULA: TFMTBCDField;
    _cdsPesquisaVerbaXUsuarioNM_USUARIO: TWideStringField;
    _cdsPesquisaVerbaXUsuarioDT_ATUALIZACAO: TSQLTimeStampField;
    _cdsPesquisaVerbaXUsuarioNM_USUARIO_1: TWideStringField;
    _cdsVerbaXUsuarioCD_GRUPO_FORNECEDOR: TFMTBCDField;
    _cdsVerbaXUsuarioDS_GRUPO_FORNECEDOR: TWideStringField;
    _cdsVerbaXUsuarioLABV_V: TFMTBCDField;
    _cdsPesquisaVerbaXUsuarioLABV_V: TFMTBCDField;
    _cdsPesquisaVerbaXUsuarioCD_GRUPO_FORNECEDOR: TFMTBCDField;
    _cdsPesquisaVerbaXUsuarioDS_GRUPO_FORNECEDOR: TWideStringField;
    _cdsPesquisaVerba: TClientDataSet;
    _sqlPesquisaVerba: TSQLQuery;
    _sqlUsuario: TSQLQuery;
    _dspUsuario: TDataSetProvider;
    _cdsUsuario: TClientDataSet;
    _dspPesquisaVerba: TDataSetProvider;
    _cdsPesquisaVerbaNROV_V: TFMTBCDField;
    _cdsPesquisaVerbaCD_GRUPO_FORNECEDOR: TFMTBCDField;
    _cdsPesquisaVerbaDS_GRUPO_FORNECEDOR: TWideStringField;
    _cdsUsuarioNR_MATRICULA: TFMTBCDField;
    _cdsUsuarioNM_USUARIO: TWideStringField;
    procedure acGravarExecute(Sender: TObject);
    procedure _dbgPesquisaDblClick(Sender: TObject);
    procedure _dbeNumeroVerbaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acIncluirExecute(Sender: TObject);
    procedure _dbeNrMatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acExcluirExecute(Sender: TObject);
  private
    function InsereGravaVerbaUsuario(PnrVerba, PnrMatricula: Integer;
      PnmUsuario: String): Boolean;
    function ConsultaVerbaUsuario(PnrVerba, PnrMatricula: Integer): Boolean;
    procedure PesquisaVerba;
    procedure PesquisaUsuario;
    function AtualizaVerbaUsuario(PnrVerbaAtual,
                                  PnrMatriculaAtual,
                                  PnrVerbaNovo,
                                  PnrMatriculaNova: Integer;
                                  PnmUsuario: String): Boolean;
    function ConsultaMatricula(PnrMatricula: Integer): String;
    function EliminaVerbaUsuario(PnrVerba, PnrMatricula: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
    nrVerba,
    nrMatriculaUsuario:Integer;

  end;

var
  _frmCadastroVerbaUsuario: T_frmCadastroVerbaUsuario;

implementation

uses uDm, uRotinasGenericas, uTelaPesquisa;

{$R *.dfm}

procedure T_frmCadastroVerbaUsuario.acExcluirExecute(Sender: TObject);
begin
  //nherited;

  if (nrVerba>0) and (nrMatriculaUsuario>0)then
  begin
  if Confirma('Deseja Realmente Excluir Regiatro',MB_DEFBUTTON2)=idyes then
  begin
  if EliminaVerbaUsuario(nrVerba,nrMatriculaUsuario) then
     Mensagem('Registro  Verba X Usuario Eliminado!!!',MB_ICONERROR)
  else
     Mensagem('Erro ao Eliminar registro  Verba X Usuario !!!',MB_ICONERROR);
    dsPesquisa.DataSet.Close;
    dsPesquisa.DataSet.open;
    _cdsVerbaXUsuario.Close;
    _cdsVerbaXUsuario.Open;
  end;
  end;

    PageControl1.ActivePage:=tbConsulta;



end;

procedure T_frmCadastroVerbaUsuario.acGravarExecute(Sender: TObject);
var
nrVerbaNova,
nrMatriculaNova:Integer;

begin
  //inherited;
  if ds.DataSet.State=dsEdit then
  begin
      nrVerbaNova    :=StrToIntDef(_dbeNumeroVerba.Text,0);
      nrMatriculaNova:=StrToIntDef(_dbeNrMatricula.Text,0);

   AtualizaVerbaUsuario(  nrVerba,//Nr Verba Atual
                          nrMatriculaUsuario,// PnrMatriculaAtual,
                          nrVerbaNova,//    PnrVerbaNovo,
                          nrMatriculaNova,///   PnrMatriculaNova:Integer;
                          nmLogin);
  end;


  if ds.DataSet.State=dsInsert then
  begin
    nrVerba           :=StrToIntDef(_dbeNumeroVerba.Text,0);
    nrMatriculaUsuario:=StrToIntDef(_dbeNrMatricula.Text,0);
    if (nrVerba>0) and (nrMatriculaUsuario>0) then
    begin
     try
       InsereGravaVerbaUsuario(nrVerba,
                               nrMatriculaUsuario,
                               nmLogin);


       Mensagem('Registro gravado!!!',MB_ICONERROR);
     except
       begin
         Mensagem('Erro ao inserir registro!!!',MB_ICONERROR);
         exit;
       end;
     end;

    end;
  end;
    _cdsPesquisaVerbaXUsuario.Close;
    _cdsPesquisaVerbaXUsuario.Open;
    dsPesquisa.DataSet.Close;
    dsPesquisa.DataSet.open;
    _cdsVerbaXUsuario.Close;
    _cdsVerbaXUsuario.Open;

    PageControl1.ActivePage:=tbConsulta;






end;

function T_frmCadastroVerbaUsuario.InsereGravaVerbaUsuario(PnrVerba,
                                                           PnrMatricula:Integer;
                                                           PnmUsuario:String):Boolean;
var
  qryTemp :TSQLQuery;
begin

  try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('INSERT INTO PRDDM.DC_VERBA_USUARIO');
    SQL.Add('( NR_VERBA, NR_MATRICULA, NM_USUARIO, DT_ATUALIZACAO)');
    SQL.Add('VALUES (:PNR_VERBA, :PNR_MATRICULA, :PNM_USUARIO, SYSDATE)');
    ParamByName('PNR_VERBA').AsInteger    := PnrVerba;
    ParamByName('PNR_MATRICULA').AsInteger:= PnrMatricula;
    ParamByName('PNM_USUARIO').AsString   := PnmUsuario;
    result :=false;
    if ExecSQL(false)=1 then
       result :=true
   end;
  except
    begin
     Mensagem('Erro ao vincular verba ao Usuario!!!',MB_ICONERROR);
     result :=false;
    end;
  end;


end;



function T_frmCadastroVerbaUsuario.AtualizaVerbaUsuario(   PnrVerbaAtual,
                                                           PnrMatriculaAtual,
                                                           PnrVerbaNovo,
                                                           PnrMatriculaNova:Integer;
                                                           PnmUsuario:String):Boolean;
var
  qryTemp :TSQLQuery;
begin

  try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('UPDATE PRDDM.DC_VERBA_USUARIO SET');
    SQL.Add('NR_VERBA=:PnrVerbaNovo,NR_MATRICULA=:PnrMatriuculaNova,');
    SQL.Add('NM_USUARIO=:PnmLogin,DT_ATUALIZACAO=SYSDATE');
    SQL.Add('where');
    SQL.Add(' NR_VERBA =:PnrVerba');
    SQL.Add(' and NR_MATRICULA=:PnrMatricula');
    ParamByName('PnrVerba').AsInteger    := PnrVerbaAtual;
    ParamByName('PnrMatricula').AsInteger:= PnrMatriculaAtual;
    ParamByName('PnrVerbaNovo').AsInteger    := PnrVerbaNovo;
    ParamByName('PnrMatriuculaNova').AsInteger:= PnrMatriculaNova;
    ParamByName('PnmLogin').AsString   := PnmUsuario;
    result :=false;
    if ExecSQL(false)=1 then
       result :=true
   end;
  except
    begin
     Mensagem('Erro ao ao alterar Dados Verba X Usuario!!!',MB_ICONERROR);
     result :=false;
    end;
  end;


end;



procedure T_frmCadastroVerbaUsuario._dbeNrMatriculaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 nrMat:Integer;
begin
  //inherited;
  case key of
    VK_RETURN :begin
                if Trim(_dbeNrMatricula.Text)=EmptyStr then
                   PesquisaUsuario;
                 if Trim(_dbeNrMatricula.Text)<>EmptyStr then
                 begin
                     nrMat:=StrToIntDef(_dbeNrMatricula.Text,0);
                     if nrMat>0 then
                      _dbeNegociador.Text:= ConsultaMatricula(nrMat) ;
                 end;


               end;
  end;

end;

procedure T_frmCadastroVerbaUsuario._dbeNumeroVerbaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //inherited;
  case key of
    VK_RETURN :begin
                if Trim(_dbeNumeroVerba.Text)=EmptyStr then
                   PesquisaVerba;
               end;
  end;

end;

procedure T_frmCadastroVerbaUsuario._dbgPesquisaDblClick(Sender: TObject);
begin
  ConsultaVerbaUsuario(_cdsPesquisaVerbaXUsuarioNR_VERBA.AsInteger,
                       _cdsPesquisaVerbaXUsuarioNR_MATRICULA.AsInteger);
  inherited;

end;

procedure T_frmCadastroVerbaUsuario.acIncluirExecute(Sender: TObject);
begin
  inherited;
  if _dbeNumeroVerba.CanFocus then
  begin
    _dbeNumeroVerba.SetFocus;
    _edtFornecedor.Clear;
  end;

end;

function T_frmCadastroVerbaUsuario.ConsultaVerbaUsuario(PnrVerba,
                                                        PnrMatricula:Integer):Boolean;
var
  qryTemp :TSQLQuery;
begin

  try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('Select    NR_VERBA, VU.NR_MATRICULA,US.NM_USUARIO,');
    SQL.Add('VU.NM_USUARIO,');
    SQL.Add('VU.DT_ATUALIZACAO,');
    SQL.Add('LABV_V,');
    SQL.Add('CD_GRUPO_FORNECEDOR,');
    SQL.Add('DS_GRUPO_FORNECEDOR');
    SQL.Add('FROM');
    SQL.Add('PRDDM.DC_VERBA_USUARIO VU,');
    SQL.Add('ACESSO.DC_USUARIO US,');
    SQL.Add('PRDDM.DCVEB,');
    SQL.Add('PRDDM.DC_GRUPO_FORNECEDOR');
    SQL.Add('WHERE');
    SQL.Add('VU.NR_MATRICULA=US.NR_MATRICULA');
    SQL.Add('AND NROV_V=nr_verba');
    SQL.Add('AND CD_GRUPO_FORNECEDOR=LABV_V');
    SQL.Add(' AND NR_VERBA=:PnrVerba');
    SQL.Add('AND VU.NR_MATRICULA=:PnrMatricula');
   end;
   with  _cdsVerbaXUsuario do
   begin
     close;
     CommandText:=qryTemp.Text;
     Params.ParamByName('PnrVerba').AsInteger    := PnrVerba;
     Params.ParamByName('PnrMatricula').AsInteger:= PnrMatricula;
     open;
   end;
   if not _cdsVerbaXUsuario.IsEmpty then
   begin
       nrVerba:=PnrVerba;
       nrMatriculaUsuario:=PnrMatricula;
      _edtFornecedor.Text:= FormatFloat('0000',_cdsVerbaXUsuarioCD_GRUPO_FORNECEDOR.AsInteger)
                                        +' -  '+  _cdsVerbaXUsuarioDS_GRUPO_FORNECEDOR.AsString;

   end;
  except
    begin
     Mensagem('Erro ao vincular verba ao Usuario!!!',MB_ICONERROR);
     result :=false;
    end;
  end;


end;


procedure T_frmCadastroVerbaUsuario.PesquisaVerba;
begin
    Application.CreateForm(T_frmPesquisa,_frmPesquisa);
   _frmPesquisa._dsPesquisa.DataSet:=_cdsPesquisaVerba;;
   _frmPesquisa.ShowModal;


    _dbeNumeroVerba.Text :=  IntToStr(_cdsPesquisaVerbaNROV_V.AsInteger);
    _edtFornecedor.Text :=  formatfloat('00000',_cdsPesquisaVerbaCD_GRUPO_FORNECEDOR.AsInteger)
                            +' - '+  _cdsPesquisaVerbaDS_GRUPO_FORNECEDOR.AsString;

   FreeAndNil(_frmPesquisa);
end;

procedure T_frmCadastroVerbaUsuario.PesquisaUsuario;
begin
    Application.CreateForm(T_frmPesquisa,_frmPesquisa);
   _frmPesquisa._dsPesquisa.DataSet:=_cdsUsuario;;
   _frmPesquisa.ShowModal;


    _dbeNrMatricula.Text :=  IntToStr(_cdsUsuarioNR_MATRICULA.AsInteger);
    _dbeNegociador.Text :=  _cdsUsuarioNM_USUARIO.AsString;

   FreeAndNil(_frmPesquisa);
end;




function T_frmCadastroVerbaUsuario.ConsultaMatricula(PnrMatricula:Integer):String;
var
  qryTemp :TSQLQuery;
begin

  try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('SELECT NM_USUARIO FROM ACESSO.DC_USUARIO WHERE nr_matricula=:PnrMatricula');
    ParamByName('PnrMatricula').AsInteger:= PnrMatricula;
    open;
   end;
   result :='';
   if not qryTemp.IsEmpty then
     result :=qryTemp.FieldByName('NM_USUARIO').AsString
   else
   begin
     Mensagem('Usuario N?o Encontrado!!!',MB_ICONWARNING);
     if _dbeNrMatricula.CanFocus then
        _dbeNrMatricula.SetFocus;

   end;

  except
    begin
     Mensagem('Erro ao Consultar Matricula de Usuario!!!',MB_ICONERROR);
     result :='';
    end;
  end;


end;


function T_frmCadastroVerbaUsuario.EliminaVerbaUsuario(PnrVerba,
                                                       PnrMatricula:Integer):Boolean;
var
  qryTemp :TSQLQuery;
begin

  try
   QryTemp:= TSQLQuery.Create(NIL);
   QryTemp:=_dm.criaQueryGenerica;
   with qryTemp do
   begin
    Close;
    SQL.Add('delete PRDDM.DC_VERBA_USUARIO ');
    SQL.Add('where');
    SQL.Add(' NR_VERBA =:PnrVerba');
    SQL.Add(' and NR_MATRICULA=:PnrMatricula');
    ParamByName('PnrVerba').AsInteger    := PnrVerba;
    ParamByName('PnrMatricula').AsInteger:= PnrMatricula;
    result :=false;
    if ExecSQL(false)=1 then
       result :=true
   end;
  except
    begin
     Mensagem('Erro ao ao alterar Dados Verba X Usuario!!!',MB_ICONERROR);
     result :=false;
    end;
  end;


end;


end.
