unit uParametroCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, Grids, DBGrids, DBClient, StdCtrls, Calendar,SqlExpr,
  Buttons, uProduto;

type
  T_frmCadastroParametro = class(TForm)
    PageControl1: TPageControl;
    _tbsParametro: TTabSheet;
    StatusBar1: TStatusBar;
    _edtGrupoFornecedor: TEdit;
    Label1: TLabel;
    _edtNomeDivisao: TEdit;
    _edtDivisaoFornecedor: TLabel;
    _cdsAgenda: TClientDataSet;
    _cdsAgendacdSequencia: TIntegerField;
    _cdsAgendaData_Agenda: TDateField;
    _dsAgenda: TDataSource;
    GroupBox1: TGroupBox;
    _dbgParametro: TDBGrid;
    _cbxOpcaoCDs: TComboBox;
    Label2: TLabel;
    _cbxEnvioAutomatico: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    _btnGravar: TBitBtn;
    _cbOPeradorLogistico: TComboBox;
    _cdsParametroCompra: TClientDataSet;
    _dsParametroCompra: TDataSource;
    _btnNovo: TBitBtn;
    _btnAltera: TBitBtn;
    _btnCancelar: TBitBtn;
    _grbemails: TGroupBox;
    _btnAdicionaEmails: TBitBtn;
    _edtemails: TEdit;
    _btnLimpaEmails: TBitBtn;
    _ltbEmail: TListBox;
    _cdsAgendaid_pedido_gerado: TStringField;
    GroupBox2: TGroupBox;
    _dbgAgenda: TDBGrid;
    _mcAgenda: TMonthCalendar;
    _cdsFornecedor: TClientDataSet;
    BitBtn1: TBitBtn;
    procedure _mcAgendaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _btnGravarClick(Sender: TObject);
    procedure _edtGrupoFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgParametroDblClick(Sender: TObject);
    procedure _btnNovoClick(Sender: TObject);
    procedure _edtGrupoFornecedorExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnAlteraClick(Sender: TObject);
    procedure _btnCancelarClick(Sender: TObject);
    procedure _btnAdicionaEmailsClick(Sender: TObject);
    procedure _btnLimpaEmailsClick(Sender: TObject);
    procedure _edtemailsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _mmEmilasDblClick(Sender: TObject);
    procedure _ltbEmailDblClick(Sender: TObject);
    procedure _ltbEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgAgendaDblClick(Sender: TObject);
    procedure _dbgAgendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgParametroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure _cbOPeradorLogisticoExit(Sender: TObject);
  private
    function CadastraAgenda(Pdate: TDate;PidGerado:String): Boolean;
    procedure CarregaEmpresa;
    function CadastroParmentro(PcdFornecedor, PcdEmpresa, PcdOperador: Integer;
      PidEnvio: String): boolean;
    function GetNrSequencia: Integer;
    procedure setNumeroOperador(PnrFornecedor, PcdOperador: Integer);
    function carregaParamentros(PnrSequencia,PnrGrupoFornecedor,PnrEmpresa,PcdOperadorLogistico:Integer):boolean;
    procedure setGridParamentro;
    procedure MostradaDados;
    procedure NovoCadastroParametro;
    procedure LimpaCampos;
    function AtualizaParmetro(PnrSequencia, PcdFornecedor, PcdEmpresa,
      PcdOperador: Integer; PidEnvio: String): boolean;
    function validaDados: Boolean;
    procedure HabilitaBotaoEdicao;
    procedure HabilitaBotaoGravacao;
    procedure HabilitaBotaoNovo;
    procedure HabilitaBotaoCencelar;
    function AdicionaEmail(Pemail: String): boolean;
    function GetNrSequenciaEmail: Integer;
    function GravaEmailParametro(PnrSequencia:Integer;PdsEmail:String):boolean;
    function InsereEmailParamento(PnrSequenciaParametro:Integer):boolean;
    procedure CarregaEmailParametro(PnrSequencia: Integer);
    function ApagaEmailParamenteBase(PnrSequencia: Integer; PdsEmail,
      nmUsuario: String): Boolean;
    function ApagaTodosEmailParamenteBase(PnrSequencia: Integer): Boolean;
    function GetNrSequenciaAgenda: Integer;
    function GravaAgendaParametro(PnrSequencia:Integer;PdtPedido:Tdate;Pidgerador:String):boolean;
    function InsereDataAgenda(PnrSequenciaParametro: Integer): Boolean;
    function ApagaTodoasAgendaParamenteBase(PnrSequencia: Integer): Boolean;
    procedure CarregaAgendaParametro(PnrSequencia: Integer);
    procedure SetFornecedor;
    function permiteInclusao(PnrEmpresa: Integer):boolean;
    function CadastroParametroGeral: Boolean;
    { Private declarations }
  public

     DadosFornecedor :TDadosFornecedor ;
     nrSequencia,
     cdGrupoFornecedor,
     cdOperadorLogistico,
     cdEmpresa:Integer;
     idEnvioAutomatico:String;
     idEdicao:Boolean;
    { Public declarations }
  end;

var
  _frmCadastroParametro: T_frmCadastroParametro;

implementation

uses uDm, uRotinasGenericas, uAuxiliarCompras, uTelaPesquisa;

{$R *.dfm}

function T_frmCadastroParametro.CadastraAgenda(Pdate:TDate;PidGerado:String):Boolean;
var
 nrReg:Integer;
begin

 _cdsAgenda.Open;
 _cdsAgenda.Last;
 nrReg:=_cdsAgendacdSequencia.AsInteger;
 if NOT _cdsAgenda.Locate('DATA_AGENDA',Pdate,[]) then
 begin
  _cdsAgenda.Append;
  _cdsAgendacdSequencia.AsInteger:= nrReg+1;
  _cdsAgendaData_Agenda.AsDateTime:= Pdate;
  _cdsAgendaid_pedido_gerado.AsString:=PidGerado;

  _cdsAgenda.Post;


 end;
 _cdsAgenda.IndexFieldNames:='DATA_AGENDA';

end;

procedure T_frmCadastroParametro._dbgAgendaDblClick(Sender: TObject);
begin
   if  _cdsAgenda.FieldByName('DATA_AGENDA').AsDateTime>dtSistema then
   begin
       if Confirma('Excluir essa agenda ?',MB_DEFBUTTON1)=IDYES then
         _cdsAgenda.Delete;
   end
   else
      Mensagem('Data Inferio a data Sistema!!!',MB_ICONWARNING);

end;

procedure T_frmCadastroParametro._dbgAgendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if _dsAgenda.DataSet.Active then
begin
 If odd(_dsAgenda.DataSet.RecNo) then
 begin
  _dbgAgenda.Canvas.Font.Color:= clBlack;
  _dbgAgenda.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgAgenda.Canvas.Font.Color:= clBlack;
  _dbgAgenda.Canvas.Brush.Color:= clWhite;
 end;
 _dbgAgenda.Canvas.FillRect(Rect);
 _dbgAgenda.DefaultDrawDataCell(Rect,_dbgAgenda.columns[datacol].field, State);
end;
end;

procedure T_frmCadastroParametro._dbgAgendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_DELETE:begin
                _dbgAgenda.OnDblClick(Sender);
            end;
  end;

end;

procedure T_frmCadastroParametro._dbgParametroDblClick(Sender: TObject);
begin
 HabilitaBotaoEdicao;
 NrSequencia:=_cdsParametroCompra.FieldByName('SQ_PARAM_PEDIDO_AUTOMATICO').AsInteger;
 carregaParamentros(nrSequencia,0,0,0);
 CarregaEmailParametro(nrSequencia);
 CarregaAgendaParametro(nrSequencia);
 MostradaDados;
 idEdicao:=true;
 _cbxOpcaoCDs.Enabled:=false;

end;

procedure T_frmCadastroParametro._dbgParametroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

if _dsParametroCompra.DataSet.Active then
begin
 If odd(_dsParametroCompra.DataSet.RecNo) then
 begin
  _dbgParametro.Canvas.Font.Color:= clBlack;
  _dbgParametro.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgParametro.Canvas.Font.Color:= clBlack;
  _dbgParametro.Canvas.Brush.Color:= clWhite;
 end;
 _dbgParametro.Canvas.FillRect(Rect);
 _dbgParametro.DefaultDrawDataCell(Rect,_dbgParametro.columns[datacol].field, State);
end;

end;

procedure T_frmCadastroParametro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmCadastroParametro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of

     VK_RETURN : begin
                 if not (ActiveControl is TDBGrid) then
                        Perform(WM_NEXTDLGCTL, 0, 0)
                else if (ActiveControl is TDBGrid) then
                begin
                  with TDBGrid(ActiveControl) do
                    if selectedindex < (fieldcount -1) then
                      selectedindex := selectedindex +1
                    else
                      selectedindex := 0;
                  end;
                end;
  end;
end;

procedure T_frmCadastroParametro.FormShow(Sender: TObject);
begin
CarregaEmpresa;

_cdsFornecedor:=AbreAgendaLaboratorio(0);

if _cdsFornecedor<>nil then
   _cdsFornecedor.Open;

carregaParamentros(0,0,0,0);
HabilitaBotaoNovo;
_mcAgenda.Date:=dtSistema;
end;

procedure T_frmCadastroParametro._mcAgendaDblClick(Sender: TObject);
var
stData :String;
begin

 if trunc(_mcAgenda.Date)<= trunc(dtSistema) then
 begin
   Mensagem('Data deve ser superior a data de cadastro !!!',MB_ICONWARNING);
   exit;
 end;

 stData:= FormatDateTime('dd/dd/yyyy',_mcAgenda.Date);

 if stData<>'' then
     CadastraAgenda(_mcAgenda.Date,'N');

end;



procedure T_frmCadastroParametro._edtemailsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of

     VK_RETURN:_btnAdicionaEmails.Click;

   end;
end;

procedure T_frmCadastroParametro._edtGrupoFornecedorExit(Sender: TObject);
begin




              if Length(_edtGrupoFornecedor.Text)>0 then
              begin
                SetFornecedor;
              end;

end;

procedure T_frmCadastroParametro._edtGrupoFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case  key of

  VK_RETURN:begin
                cdGrupoFornecedor  :=StrToIntDef(_edtGrupoFornecedor.Text,0);

                if cdGrupoFornecedor=0 then
                begin
                  carregaParamentros(0,0,0,0);
                  exit;
                end;


                  DadosFornecedor := GetDadosLaboratorio(cdGrupoFornecedor);

                  if DadosFornecedor=nil then
                  begin
                    Mensagem('Fornecedor Invalido',MB_ICONWARNING);
                  end;
                  if not  carregaParamentros(0,cdGrupoFornecedor,0,0) then
                     HabilitaBotaoGravacao;
                   setNumeroOperador(cdGrupoFornecedor,1);
                  _edtNomeDivisao.Text:=DadosFornecedor.dsNomeFantasia;

             end;




  end;
end;




procedure T_frmCadastroParametro._ltbEmailDblClick(Sender: TObject);
begin
    if Confirma('Eliminar email da lista ?',MB_DEFBUTTON1)=IDYES then
    begin
         _ltbEmail.DeleteSelected;
    end;
end;

procedure T_frmCadastroParametro._ltbEmailKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of

   VK_DELETE:begin
              if Confirma('Eliminar email da lista ?',MB_DEFBUTTON1)=IDYES then
              begin
                  _ltbEmail.DeleteSelected;
              end;

            end;
  end;
end;

procedure T_frmCadastroParametro._mmEmilasDblClick(Sender: TObject);
var
 nrlinha:Integer;
begin
  nrlinha:=_ltbEmail.ItemIndex;


end;

procedure T_frmCadastroParametro.CarregaEmpresa;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('ACESSO.DC_EMPRESA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''S''');
    tempQuery.SQL.Add('and ID_SITUACAO_EMPRESA=''A''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''N''');
    tempQuery.SQL.Add('ORDER BY 1');
    tempQuery.Open;
    tempQuery.First;

    _cbxOpcaoCDs.Clear;
    _cbxOpcaoCDs.Items.Add('99 - TODAS');
    while not tempQuery.eof do
    begin
       _cbxOpcaoCDs.Items.Add( FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOpcaoCDs.ItemIndex:=-1;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;




procedure T_frmCadastroParametro._btnAdicionaEmailsClick(Sender: TObject);
begin
 AdicionaEmail(_edtemails.Text);
end;

procedure T_frmCadastroParametro._btnAlteraClick(Sender: TObject);
begin



  if validaDados then
  begin
  if idEdicao then
  begin
    if (NrParamentoCompras(cdGrupoFornecedor,cdOperadorLogistico)>1) and (cdEmpresa=999999) then
    begin
        mensagem('Esta opera??o n?o pode ser realizada !!!',MB_ICONWARNING);
        carregaParamentros(0,cdGrupoFornecedor,0,0);
        MostradaDados;
        idEdicao:=false;
    end
    else
    begin
     AtualizaParmetro(nrSequencia,cdGrupoFornecedor,cdEmpresa,cdOperadorLogistico,idEnvioAutomatico);

     carregaParamentros(nrSequencia,0,0,0);
     MostradaDados;
     idEdicao:=false;
    end
   end;

  end;
  HabilitaBotaoNovo;

end;

procedure T_frmCadastroParametro._btnGravarClick(Sender: TObject);
begin

 if  validaDados then
 begin
  ///idEdicao:=false;
  ///
  ///
  ///
  if cdEmpresa=999999 then
     if carregaParamentros(0,cdGrupoFornecedor,0,cdOperadorLogistico) then
     begin
       idEdicao:=true;
       NrSequencia:=_cdsParametroCompra.FieldByName('SQ_PARAM_PEDIDO_AUTOMATICO').AsInteger;
       mensagem('Esta opera??o n?o pode ser realizada !!!',MB_ICONWARNING);
       exit;
     end;


 { if cdEmpresa=999999 then
  begin
     CadastroParametroGeral;
     exit;
  end; }

     

  if  carregaParamentros(0,cdGrupoFornecedor,cdEmpresa,cdOperadorLogistico) then
  begin
       idEdicao:=true;
       NrSequencia:=_cdsParametroCompra.FieldByName('SQ_PARAM_PEDIDO_AUTOMATICO').AsInteger;
       mensagem('Esta opera??o n?o pode ser realizada !!!',MB_ICONWARNING);
       exit;
  end;



      if  not carregaParamentros(0,cdGrupoFornecedor,999999,cdOperadorLogistico) then
      begin
       if ((not NrParamentoCompras(cdGrupoFornecedor,cdOperadorLogistico)<1) and (cdEmpresa=999999)) or ((cdEmpresa<>999999))    then
          CadastroParmentro(cdGrupoFornecedor,cdEmpresa,cdOperadorLogistico,idEnvioAutomatico);

      end
      else
      begin
        mensagem('Esta opera??o n?o pode ser realizada !!!',MB_ICONWARNING);
        carregaParamentros(0,cdGrupoFornecedor,0,0);
        exit;
      end;
   carregaParamentros(0,cdGrupoFornecedor,0,0);
   HabilitaBotaoNovo;
end;


end;

procedure T_frmCadastroParametro._btnLimpaEmailsClick(Sender: TObject);
begin
  _ltbEmail.Clear
end;

procedure T_frmCadastroParametro._btnNovoClick(Sender: TObject);
begin
    HabilitaBotaoGravacao;
    idEdicao:=false;
    NovoCadastroParametro;
   _cbxOpcaoCDs.Enabled:=true;

end;

procedure T_frmCadastroParametro._cbOPeradorLogisticoExit(Sender: TObject);
begin


   cdOperadorLogistico:=StrToIntDef(Copy(_cbOPeradorLogistico.Text,1,4),0);

   if cdOperadorLogistico<1 then
   begin
      Mensagem('Selecione operador Logistico',MB_ICONWARNING);
     _cbOPeradorLogistico.SetFocus;
     exit;
   end;




    cdEmpresa          :=StrToIntDef(Copy(_cbxOpcaoCDs.Text,1,2),0);

   if cdEmpresa<1 then
   begin
      Mensagem('Selecione operador Logistico',MB_ICONWARNING);
      _cbxOpcaoCDs.SetFocus;
      exit;

   end;

   if cdEmpresa=99 then
      cdEmpresa:=999999;

    if _btnGravar.Enabled=false then
       if  permiteInclusao(cdEmpresa)=true then
           _btnGravar.Enabled:=True
        else
        begin
          _btnGravar.Enabled:=false;
          _btnGravar.Enabled:=true;

        end;

end;

procedure T_frmCadastroParametro._btnCancelarClick(Sender: TObject);
begin
 idEdicao:=false;
 LimpaCampos;
 HabilitaBotaoNovo;
  carregaParamentros(0,0,0,0);
end;

function T_frmCadastroParametro.CadastroParmentro(PcdFornecedor,PcdEmpresa,PcdOperador:Integer;PidEnvio:String):boolean;
var
  tempQuery : TSQLQuery;
  nrReg :Integer;
begin
  tempQuery := nil;
  try

    nrReg:=GetNrSequencia;
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
     close;
     SQL.Clear;
     SQL.Add('INSERT INTO PEDIDOAUTOMATICO.DC_PARAM_PEDIDO_AUTOMATICO');
     SQL.Add('(SQ_PARAM_PEDIDO_AUTOMATICO,CD_GRUPO_FORNECEDOR,');
     SQL.Add('CD_EMPRESA, ID_ENVIO_AUTOMATICO,CD_OPERADOR_LOGISTICO,');
     SQL.Add('NM_USUARIO,DT_ATUALIZACAO)');
     SQL.Add('VALUES(:PSQ_PARAM_PEDIDO_AUTOMATICO,:PCD_GRUPO_FORNECEDOR,');
     SQL.Add(':PCD_EMPRESA, :PID_ENVIO_AUTOMATICO,:PCD_OPERADOR_LOGISTICO,');
     SQL.Add(':PNM_USUARIO,sysdate)');
     ParamByName('PSQ_PARAM_PEDIDO_AUTOMATICO').AsInteger:=nrReg;
     ParamByName('PCD_GRUPO_FORNECEDOR').AsInteger:=PcdFornecedor;
     ParamByName('PCD_EMPRESA').AsInteger:=PcdEmpresa;
     ParamByName('PID_ENVIO_AUTOMATICO').AsString:=PidEnvio;
     ParamByName('PCD_OPERADOR_LOGISTICO').AsInteger:=PcdOperador;
     ParamByName('PNM_USUARIO').AsString:=nmLogin;

     result:=true;
     if ExecSQL(false)=0 then
        result:=False;

    end;
    if Result then
    begin
       InsereEmailParamento(nrReg);
       InsereDataAgenda(nrReg);
    end;
  except
   on E: Exception do
   begin
//    Mensagem('Erro ao Inserir Paramentro de Pedido ', MB_ICONERROR);
      trataerro(E.Message, 'Erro ao Inserir Paramentro de Pedido');
   end;
  end;

end;



function T_frmCadastroParametro.GravaEmailParametro(PnrSequencia:Integer;PdsEmail:String):boolean;
var
  tempQuery : TSQLQuery;
  nrReg :Integer;
begin
  tempQuery := nil;
  try

    nrReg:=GetNrSequenciaEmail;
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
     close;
     SQL.Clear;
     SQL.Add('INSERT INTO PEDIDOAUTOMATICO.DC_EMAIL_PEDIDO_AUTOMATICO');
     SQL.Add('(SQ_EMAIL_PEDIDO_AUTOMATICO, SQ_PARAM_PEDIDO_AUTOMATICO,');
     SQL.Add(' DS_ENDERECO_EMAIL, NM_USUARIO, DT_ATUALIZACAO)');
     SQL.Add('VALUES(:PSQ_EMAIL_PEDIDO_AUTOMATICO, :PSQ_PARAM_PEDIDO_AUTOMATICO,');
     SQL.Add(':PDS_ENDERECO_EMAIL, :PNM_USUARIO, sysdate)');
     ParamByName('PSQ_EMAIL_PEDIDO_AUTOMATICO').AsBCD:=nrReg;
     ParamByName('PSQ_PARAM_PEDIDO_AUTOMATICO').AsBCD:=PnrSequencia;
     ParamByName('PDS_ENDERECO_EMAIL').AsString:=PdsEmail;
     ParamByName('PNM_USUARIO').AsString:=nmLogin;

     result:=true;
     if ExecSQL(false)=0 then
        result:=False;

    end;

  except
   on E: Exception do
   begin
//    Mensagem('Erro ao Inserir Paramentro de Pedido ', MB_ICONERROR);
      trataerro(E.Message, 'Erro ao Inserir Emial de Pedido');
   end;
  end;

end;


function T_frmCadastroParametro.GravaAgendaParametro(PnrSequencia:Integer;PdtPedido:Tdate;Pidgerador:String):boolean;
var
  tempQuery : TSQLQuery;
  nrReg :Integer;
begin
  tempQuery := nil;
  try

    nrReg:=GetNrSequenciaAgenda;
    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
     close;
     SQL.Clear;
     SQL.Add('INSERT INTO  PEDIDOAUTOMATICO.DC_AGENDA_PEDIDO_AUTOMATICO');
     SQL.Add('(SQ_AGENDA_PEDIDO_AUTOMATICO, CD_PARAM_PEDIDO_AUTOMATICO,');
     SQL.Add('DT_PEDIDO, ID_PEDIDO_GERADO, NM_USUARIO, DT_ATUALIZACAO )');
     SQL.Add('values(:PSQ_AGENDA_PEDIDO_AUTOMATICO, :PCD_PARAM_PEDIDO_AUTOMATICO,');
     SQL.Add(':PDT_PEDIDO, :PID_PEDIDO_GERADO, :PNM_USUARIO, sysdate )');


     ParamByName('PSQ_AGENDA_PEDIDO_AUTOMATICO').AsBCD:=nrReg;
     ParamByName('PCD_PARAM_PEDIDO_AUTOMATICO').AsBCD:=PnrSequencia;
     ParamByName('PID_PEDIDO_GERADO').asstring:= Pidgerador;
     ParamByName('PDT_PEDIDO').AsDateTime:=PdtPedido;
     ParamByName('PNM_USUARIO').AsString:=nmLogin;

     result:=true;
     if ExecSQL(false)=0 then
        result:=False;

    end;

  except
   on E: Exception do
   begin
//    Mensagem('Erro ao Inserir Paramentro de Pedido ', MB_ICONERROR);
      trataerro(E.Message, 'Erro ao Inserir Emial de Pedido');
   end;
  end;

end;






function T_frmCadastroParametro.AtualizaParmetro(PnrSequencia,PcdFornecedor,PcdEmpresa,PcdOperador:Integer;PidEnvio:String):boolean;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try

    tempQuery := _dm.criaQueryGenerica;
    with tempQuery do
    begin
     close;
     SQL.Clear;
     SQL.Add('UPDATE PEDIDOAUTOMATICO.DC_PARAM_PEDIDO_AUTOMATICO Set');
     SQL.Add('CD_GRUPO_FORNECEDOR=:PCD_GRUPO_FORNECEDOR,');
     SQL.Add('CD_EMPRESA=:PCD_EMPRESA, ID_ENVIO_AUTOMATICO=:PID_ENVIO_AUTOMATICO,CD_OPERADOR_LOGISTICO=:PCD_OPERADOR_LOGISTICO,');
     SQL.Add('NM_USUARIO=:PNM_USUARIO,DT_ATUALIZACAO=sysdate');
     SQL.Add('where SQ_PARAM_PEDIDO_AUTOMATICO=:PSQ_PARAM_PEDIDO_AUTOMATICO');

     ParamByName('PSQ_PARAM_PEDIDO_AUTOMATICO').AsInteger:=PnrSequencia;
     ParamByName('PCD_GRUPO_FORNECEDOR').AsInteger:=PcdFornecedor;
     ParamByName('PCD_EMPRESA').AsInteger:=PcdEmpresa;
     ParamByName('PID_ENVIO_AUTOMATICO').AsString:=PidEnvio;
     ParamByName('PCD_OPERADOR_LOGISTICO').AsInteger:=PcdOperador;
     ParamByName('PNM_USUARIO').AsString:=nmLogin;

     result:=true;
     if ExecSQL(false)=0 then
        result:=False;

    end;
    if Result then
    begin
       InsereEmailParamento(PnrSequencia);
       InsereDataAgenda(PnrSequencia)
    end;


  except
   on E: Exception do
   begin
//    Mensagem('Erro ao Inserir Paramentro de Pedido ', MB_ICONERROR);
      trataerro(E.Message, 'Erro ao Inserir Paramentro de Pedido');
   end;
  end;

end;



procedure T_frmCadastroParametro.BitBtn1Click(Sender: TObject);
begin
                 Application.CreateForm(T_frmPesquisa,_frmPesquisa);
                _frmPesquisa._dsPesquisa.DataSet:=_cdsFornecedor;;
                _frmPesquisa.ShowModal;

                 _edtGrupoFornecedor.Text:=FormatFloat('0000',_cdsFornecedor.FieldByName('NR_FORNECEDOR').AsInteger);
                 SetFornecedor;
                 _edtGrupoFornecedor.SetFocus;



end;

function T_frmCadastroParametro.GetNrSequencia:Integer;
Var
  QryTemp: TSQLQuery;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.add('select Nvl(max(SQ_PARAM_PEDIDO_AUTOMATICO)+1,1) AS NR_SEQ');
        SQL.add('from PEDIDOAUTOMATICO.DC_PARAM_PEDIDO_AUTOMATICO');
        Open;
      end;
      Result:=0;
      if NOT QryTemp.IsEmpty then
         Result:=QryTemp.FieldByName('NR_SEQ').AsInteger;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Capa Lista Pre?oo');
      end;

    end;
  finally
      FreeAndNil(QryTemp);
  end;
end;


function T_frmCadastroParametro.GetNrSequenciaEmail:Integer;
Var
  QryTemp: TSQLQuery;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.add('select Nvl(max(sq_email_pedido_automatico)+1,1) AS NR_SEQ');
        SQL.add('from PEDIDOAUTOMATICO.DC_EMAIL_PEDIDO_AUTOMATICO');
        Open;
      end;
      Result:=0;
      if NOT QryTemp.IsEmpty then
         Result:=QryTemp.FieldByName('NR_SEQ').AsInteger;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Capa Lista Pre?oo');
      end;

    end;
  finally
      FreeAndNil(QryTemp);
  end;
end;

function T_frmCadastroParametro.GetNrSequenciaAgenda:Integer;
Var
  QryTemp: TSQLQuery;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.add('select Nvl(max(SQ_AGENDA_PEDIDO_AUTOMATICO)+1,1) AS NR_SEQ');
        SQL.add('from PEDIDOAUTOMATICO.DC_AGENDA_PEDIDO_AUTOMATICO');
        Open;
      end;
      Result:=0;
      if NOT QryTemp.IsEmpty then
         Result:=QryTemp.FieldByName('NR_SEQ').AsInteger;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Capa Lista Pre?oo');
      end;

    end;
  finally
      FreeAndNil(QryTemp);
  end;
end;




Function T_frmCadastroParametro.carregaParamentros(PnrSequencia,PnrGrupoFornecedor,PnrEmpresa,PcdOperadorLogistico:Integer):boolean;
begin
  _cdsParametroCompra:=DadosParamentoCompras(PnrSequencia,PnrGrupoFornecedor,Pnrempresa,PcdOperadorLogistico);

  result:=false;
  if _cdsParametroCompra<>nil then
  begin
      result:=true;
    _dsParametroCompra.DataSet:=_cdsParametroCompra;
    _cdsParametroCompra.Open;
    setGridParamentro;
 _cdsParametroCompra.IndexFieldNames:='DS_GRUPO_FORNECEDOR;CD_EMPRESA;CD_OPERADOR_LOGISTICO';
  end;

end;


procedure T_frmCadastroParametro.setNumeroOperador(PnrFornecedor,PcdOperador: Integer);
var
  QryTemp: TSQLQuery;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      sql.Add('SELECT CD_FORNECEDOR,OL.CD_OPERADOR_LOGISTICO as CD_OPERADOR_LOGISTICO,');
      sql.Add('DS_OPERADOR_LOGISTICO,ID_VENDA_EXCLUSIVA,ID_REGISTRA_VENDA_OL,');
      sql.Add('ID_REPOSICAO_ESTOQUE');
      sql.Add('FROM');
      sql.Add('PRDDM.DC_OL_FORNECEDOR OL_FOR,');
      sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      sql.Add('WHERE');
      sql.Add('OL_FOR.CD_OPERADOR=OL.CD_OPERADOR_LOGISTICO');
      sql.Add('AND ID_SITUACAO=''A''');
      sql.Add('AND CD_FORNECEDOR=:PnrFornecedor');
      if PcdOperador>1 then
         sql.Add('AND OL.CD_OPERADOR_LOGISTICO=:PcdOperador');


      if PcdOperador=1 then
      begin
      sql.Add('UNION ALL');
      sql.Add('SELECT 1,OL.CD_OPERADOR_LOGISTICO,DS_OPERADOR_LOGISTICO,');
      sql.Add('''N'',''N'',''S''');
      sql.Add('FROM');
      sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
      sql.Add('WHERE');
      sql.Add('OL.CD_OPERADOR_LOGISTICO=1');
      end;
      sql.Add('ORDER BY CD_FORNECEDOR');
      ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
      if PcdOperador>1 then
       ParamByName('PcdOperador').AsInteger := PcdOperador;
       open;
      First;
    end;
    _cbOPeradorLogistico.Items.Clear;
    if not QryTemp.IsEmpty then
    begin
      _cbOPeradorLogistico.Visible := true;
     // Label19.Visible := true;
    end;

    while not QryTemp.eof do
    begin
      //close;
      _cbOPeradorLogistico.Items.Add(FormatFloat('0000',
        QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger) + ' - ' +
        QryTemp.FieldByName('DS_OPERADOR_LOGISTICO').AsString);
      QryTemp.Next;
    end;
    if _cbOPeradorLogistico.Visible then
      _cbOPeradorLogistico.ItemIndex := 0;
  finally
    FreeAndNil(QryTemp);
  end;
end;



procedure T_frmCadastroParametro.setGridParamentro;
begin

 TIntegerField(_cdsParametroCompra.FieldByName('SQ_PARAM_PEDIDO_AUTOMATICO')).Visible:=false;

 TStringField(_cdsParametroCompra.FieldByName('NM_EMP')).Visible:=false;
 TStringField(_cdsParametroCompra.FieldByName('NM_OL')).Visible:=false;
 TIntegerField(_cdsParametroCompra.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornecedor';
 TIntegerField(_cdsParametroCompra.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=06;

 TStringField(_cdsParametroCompra.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Fornecedor';
 TStringField(_cdsParametroCompra.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=25;

 TIntegerField(_cdsParametroCompra.FieldByName('CD_EMPRESA')).DisplayLabel:='Nr.Emp.';
 TIntegerField(_cdsParametroCompra.FieldByName('CD_EMPRESA')).DisplayWidth:=06;

 TStringField(_cdsParametroCompra.FieldByName('NM_EMPRESA')).DisplayLabel:='Empresa';
 TStringField(_cdsParametroCompra.FieldByName('NM_EMPRESA')).DisplayWidth:=25;


 TStringField(_cdsParametroCompra.FieldByName('ID_ENVIO_AUTOMATICO')).DisplayLabel:='Id.Envio Autom.';
 TStringField(_cdsParametroCompra.FieldByName('ID_ENVIO_AUTOMATICO')).DisplayWidth:=01;

 TIntegerField(_cdsParametroCompra.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayLabel:='Oper.Log.';
 TIntegerField(_cdsParametroCompra.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayWidth:=06;

end;


procedure T_frmCadastroParametro.MostradaDados;
var
 nrPosicao:Integer;
 nritens:Integer;
 id :Boolean;
 SuaVariavel:String;
begin

  _edtGrupoFornecedor.Text:=_cdsParametroCompra.FieldByName('CD_GRUPO_FORNECEDOR').AsString;

  _edtNomeDivisao.Text:=_cdsParametroCompra.FieldByName('DS_GRUPO_FORNECEDOR').AsString;


    //Carregando Empresa
   SuaVariavel:=_cdsParametroCompra.FieldByName('NM_EMP').AsString;
  _cbxOpcaoCDs.ItemIndex:= _cbxOpcaoCDs.Items.IndexOf(SuaVariavel);

  setNumeroOperador(_cdsParametroCompra.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger,1);


  //Carregando operador Logistico
   SuaVariavel:=_cdsParametroCompra.FieldByName('NM_OL').AsString;
  _cbOPeradorLogistico.ItemIndex:= _cbOPeradorLogistico.Items.IndexOf(SuaVariavel);


  //Carregando Envio Autmatico
   SuaVariavel:=_cdsParametroCompra.FieldByName('ID_ENVIO_AUTOMATICO').AsString;
   if SuaVariavel='S' then
     _cbxEnvioAutomatico.ItemIndex:= _cbxEnvioAutomatico.Items.IndexOf('Sim')
   else
     _cbxEnvioAutomatico.ItemIndex:= _cbxEnvioAutomatico.Items.IndexOf('N?o');








end;


procedure  T_frmCadastroParametro.NovoCadastroParametro;
begin

LimpaCampos;
CarregaEmpresa;

carregaParamentros(0,0,0,0);
_edtGrupoFornecedor.SetFocus;
end;


procedure T_frmCadastroParametro.LimpaCampos;
begin

 _edtGrupoFornecedor.Clear;

 _edtNomeDivisao.Clear;
 _ltbEmail.Clear;
 _edtemails.Clear;

 _cbxOpcaoCDs.ItemIndex:=-1;
 _cbxEnvioAutomatico.ItemIndex:=-1;
 _cbxEnvioAutomatico.ItemIndex:=-1;

end;


function T_frmCadastroParametro.validaDados:Boolean;
begin

    Result:=true;

   cdGrupoFornecedor  :=StrToIntDef(_edtGrupoFornecedor.Text,0);

   DadosFornecedor := GetDadosLaboratorio(cdGrupoFornecedor);

     if DadosFornecedor=nil then
     begin
       Result:=false;
        Mensagem('Fornecerdor Invalido',MB_ICONWARNING);
       _edtGrupoFornecedor.SetFocus;
       exit;

     end;



   _edtNomeDivisao.text:=DadosFornecedor.dsNomeFantasia;


   cdEmpresa          :=StrToIntDef(Copy(_cbxOpcaoCDs.Text,1,2),0);

   if cdEmpresa<1 then
   begin
      Result:=false;
      Mensagem('Selecione operador Logistico',MB_ICONWARNING);
      _cbxOpcaoCDs.SetFocus;
      exit;

   end;

   if cdEmpresa=99 then
      cdEmpresa:=999999;

   cdOperadorLogistico:=StrToIntDef(Copy(_cbOPeradorLogistico.Text,1,4),0);

   if cdOperadorLogistico<1 then
   begin
      Result:=false;
      Mensagem('Selecione operador Logistico',MB_ICONWARNING);
     _cbOPeradorLogistico.SetFocus;
     exit;
   end;

   idEnvioAutomatico:=copy(_cbxEnvioAutomatico.Text,1,1);

   if trim(idEnvioAutomatico)='' then
   begin
      Result:=false;
      Mensagem('Selecione Envio de arquivo',MB_ICONWARNING);
     _cbxEnvioAutomatico.SetFocus;
     exit;
   end;

end;


procedure T_frmCadastroParametro.HabilitaBotaoEdicao;
begin
     _btnNovo.Enabled:=false;
    _btnAltera.Enabled:=true;
    _btnGravar.Enabled:=false;

end;


procedure T_frmCadastroParametro.HabilitaBotaoGravacao;
begin
    _btnNovo.Enabled:=false;
    _btnAltera.Enabled:=false;
    _btnGravar.Enabled:=true;
end;

procedure T_frmCadastroParametro.HabilitaBotaoNovo;
begin
    _btnNovo.Enabled:=true;
    _btnAltera.Enabled:=false;
    _btnGravar.Enabled:=false;
    _btnCancelar.Enabled:=true;

end;

procedure T_frmCadastroParametro.HabilitaBotaoCencelar;
begin
    _btnNovo.Enabled:=true;
    _btnAltera.Enabled:=false;
    _btnGravar.Enabled:=false;
    _btnCancelar.Enabled:=true;
end;


Function T_frmCadastroParametro.AdicionaEmail(Pemail:String):boolean;
begin

  if IsValidEmail(Pemail) then
  begin
     _ltbEmail.Items.Add(Pemail);
  end
  else
    Mensagem('Email n?o eh valido !!!',MB_ICONWARNING);
end;


function T_frmCadastroParametro.InsereEmailParamento(PnrSequenciaParametro:Integer):boolean;
var
 i:Integer;
 stEmail :String;
begin

  ApagaTodosEmailParamenteBase(PnrSequenciaParametro);
  for i:=0 to pred( _ltbEmail.Count) do
  begin
     stEmail:=_ltbEmail.Items.Strings[i];
     if IsValidEmail(stEmail) then
        GravaEmailParametro(PnrSequenciaParametro,stEmail);


  end;


end;


procedure T_frmCadastroParametro.CarregaEmailParametro(PnrSequencia:Integer);
var
  QryTemp: TSQLQuery;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
    begin
      sql.Add('SELECT DS_ENDERECO_EMAIL FROM  PEDIDOAUTOMATICO.DC_EMAIL_PEDIDO_AUTOMATICO WHERE SQ_PARAM_PEDIDO_AUTOMATICO=:PnrSequencia');
      ParamByName('PnrSequencia').AsBCD:=PnrSequencia;
      open;
    end;
    _ltbEmail.Clear;
    while not QryTemp.Eof do
    begin
    _ltbEmail.Items.Add(QryTemp.FieldByName('DS_ENDERECO_EMAIL').AsString);
     QryTemp.Next;
   end;



  finally
  FreeAndNil(QryTemp);
  end;
end;



procedure T_frmCadastroParametro.CarregaAgendaParametro(PnrSequencia:Integer);
var
  QryTemp: TSQLQuery;

begin
  try
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    _cdsAgenda.Close;
    _cdsAgenda.CreateDataSet;
    with QryTemp do
    begin
      sql.Add('SELECT DT_PEDIDO,ID_PEDIDO_GERADO FROM  PEDIDOAUTOMATICO.DC_AGENDA_PEDIDO_AUTOMATICO WHERE CD_PARAM_PEDIDO_AUTOMATICO=:PnrSequencia');
      ParamByName('PnrSequencia').AsBCD:=PnrSequencia;
      open;
    end;
    //_ltbEmail.Clear;
    while not QryTemp.Eof do
    begin
      CadastraAgenda(QryTemp.FieldByName('DT_PEDIDO').AsDateTime,QryTemp.FieldByName('ID_PEDIDO_GERADO').AsString);
      QryTemp.Next;
   end;



  finally
  FreeAndNil(QryTemp);
  end;
end;




function T_frmCadastroParametro.ApagaEmailParamenteBase(PnrSequencia:Integer;PdsEmail,nmUsuario:String):Boolean;
var
  QryTemp: TSQLQuery;

begin
  try
   TRY
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
     begin
      sql.add('DELETE PEDIDOAUTOMATICO.DC_EMAIL_PEDIDO_AUTOMATICO');
      sql.add('WHERE');
      sql.add('SQ_PARAM_PEDIDO_AUTOMATICO=:PnrSequenciaParmametro');
      sql.add(format('AND trim(DS_ENDERECO_EMAIL) LIKE %s',[QuotedStr(PdsEmail)]));
      ParamByName('PnrSequenciaParmametro').AsBCD :=PnrSequencia;

      Result:=true;
      if ExecSQL(false)=0 then
         Result:=false;
     end;
        result:=true;
       EXCEPT
         MENSAGEM('Erro no Excluir email',MB_ICONWARNING);
          result:=false;
       END;
  finally
    FreeAndNil(QryTemp);
  end;
end;


function T_frmCadastroParametro.ApagaTodosEmailParamenteBase(PnrSequencia:Integer):Boolean;
var
  QryTemp: TSQLQuery;

begin
  try
   TRY
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
     begin
      sql.add('DELETE PEDIDOAUTOMATICO.DC_EMAIL_PEDIDO_AUTOMATICO');
      sql.add('WHERE');
      sql.add('SQ_PARAM_PEDIDO_AUTOMATICO=:PnrSequenciaParmametro');
      ParamByName('PnrSequenciaParmametro').AsBCD :=PnrSequencia;
      Result:=true;
      if ExecSQL(false)=0 then
         Result:=false;
     end;
        result:=true;
       EXCEPT
         MENSAGEM('Erro no Excluir email',MB_ICONWARNING);
          result:=false;
       END;
  finally
    FreeAndNil(QryTemp);
  end;
end;


function T_frmCadastroParametro.ApagaTodoasAgendaParamenteBase(PnrSequencia:Integer):Boolean;
var
  QryTemp: TSQLQuery;

begin
  try
   TRY
    TestaConexaoBase(_dm._conexao, nrBase);
    QryTemp := TSQLQuery.Create(nil);
    QryTemp.SQLConnection := _dm._conexao;
    with QryTemp do
     begin
      sql.add('DELETE PEDIDOAUTOMATICO.DC_AGENDA_PEDIDO_AUTOMATICO');
      sql.add('WHERE');
      sql.add('cd_param_pedido_automatico=:PnrSequenciaParmametro');
      ParamByName('PnrSequenciaParmametro').AsBCD :=PnrSequencia;
      Result:=true;
      if ExecSQL(false)=0 then
         Result:=false;
     end;
        result:=true;
       EXCEPT
         MENSAGEM('Erro no Excluir email',MB_ICONWARNING);
          result:=false;
       END;
  finally
    FreeAndNil(QryTemp);
  end;
end;



function T_frmCadastroParametro.InsereDataAgenda(PnrSequenciaParametro:Integer):Boolean;
var
dtPedido :Tdate;
begin


   _cdsAgenda.Open;
   _cdsAgenda.First;

   ApagaTodoasAgendaParamenteBase(PnrSequenciaParametro);

   while not _cdsAgenda.Eof do
   begin
      dtPedido:=_cdsAgendaData_Agenda.AsDateTime;
      GravaAgendaParametro(PnrSequenciaParametro,
                           dtPedido,
                           _cdsAgendaid_pedido_gerado.AsString);

     _cdsAgenda.Next
   end;


end;


procedure T_frmCadastroParametro.SetFornecedor;
begin

              if Length(_edtGrupoFornecedor.Text)>0 then
              begin
                  if DadosFornecedor=nil then
                  begin
                    cdGrupoFornecedor  :=StrToIntDef(_edtGrupoFornecedor.Text,0);
                    DadosFornecedor := GetDadosLaboratorio(cdGrupoFornecedor);
                    if DadosFornecedor=nil then
                    begin
                     Mensagem('Fornecedor Invalido',MB_ICONWARNING);
                     _edtGrupoFornecedor.SetFocus;
                     exit;
                    end;

                  end;
                   setNumeroOperador(cdGrupoFornecedor,1);
                   _cbxOpcaoCDs.Enabled:=true;
                 _edtNomeDivisao.Text:=DadosFornecedor.dsNomeFantasia;
              end;


end;


function T_frmCadastroParametro.permiteInclusao(PnrEmpresa:Integer):Boolean;
begin
  result:=true;
  if PnrEmpresa=999999 then
     if carregaParamentros(0,cdGrupoFornecedor,0,cdOperadorLogistico) then
     begin
       idEdicao:=true;
       NrSequencia:=_cdsParametroCompra.FieldByName('SQ_PARAM_PEDIDO_AUTOMATICO').AsInteger;
       mensagem('Esta opera??o n?o pode ser realizada !!!',MB_ICONWARNING);
       result:=false;
       exit;
     end;

  if  carregaParamentros(0,cdGrupoFornecedor,PnrEmpresa,cdOperadorLogistico) then
  begin
       //idEdicao:=true;
       NrSequencia:=_cdsParametroCompra.FieldByName('SQ_PARAM_PEDIDO_AUTOMATICO').AsInteger;
       mensagem('Esta opera??o n?o pode ser realizada !!!',MB_ICONWARNING);
       result:=false;
       exit;

  end;

end;




function T_frmCadastroParametro.CadastroParametroGeral:Boolean;
var
 _cdsTemp:TClientDataSet;
 stQry :TStringList;
begin
 try
     stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';



  try
  
     with stQry do
     begin
      Clear;
      Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
      Add('FROM');
      Add('ACESSO.DC_EMPRESA');
      Add('WHERE');
      Add('ID_EMPRESA_FISICA=''S''');
      Add('and ID_SITUACAO_EMPRESA=''A''');
      Add('AND ID_OPERACAO_REDE=''N''');
      Add('ORDER BY 1');
     end;

     with _cdsTemp do
     begin
       Close;
       _cdsTemp.CommandText:=stQry.Text;
       open;
       First;
     end;

    while not _cdsTemp.eof do
    begin

       cdEmpresa:=_cdsTemp.FieldByName('CD_EMPRESA').AsInteger;


      if not carregaParamentros(0,cdGrupoFornecedor,cdEmpresa,cdOperadorLogistico) then
             CadastroParmentro(cdGrupoFornecedor,cdEmpresa,cdOperadorLogistico,idEnvioAutomatico);

      _cdsTemp.Next;
    end;
   except
   
     on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Cadastrar empresa Geral!!!!');
      end;
  end;
   

  finally
  end;
  

end;


end.

