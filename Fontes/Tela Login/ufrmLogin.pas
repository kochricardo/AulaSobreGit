unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, FMTBcd, DB, SqlExpr, uAlteraSenha,
  DBClient, uRotinasGenericas, uTelaPrincipal, ComCtrls;

type
  T_frmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtLogin: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    bbtnOK: TBitBtn;
    bbtnCancela: TBitBtn;
    bbtnAlteraSenha: TBitBtn;
    _cdsUsuario: TClientDataSet;
    StatusBar1: TStatusBar;
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mudarComEnter(Sender: TObject; Var Key: Char);
    procedure edtLoginExit(Sender: TObject);
    procedure bbtnAlteraSenhaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    senha,
    senhaDescriptada: string;

    codUsuario: integer;
    NumeroDeTentativa : Integer;
    SucessodeLogin    : Boolean;
    function VerificaUsuario(nmUsuario, dsSenha: String): Boolean;
    function ConexaoComOServidor: Boolean;
    function CriteriosParaLogin:boolean;
//   function AbreUsuario(cdUsuario,cdUsuarioGeral:Integer;IdDousuario, Senha: String): Boolean;
  public
    { Public declarations }
    nomeUsuario, nomeLogin: string;
    nomeUsuarioLogado,
    senhaLogado,
    senhaEncriptada :String;
  end;

var
  _frmLogin: T_frmLogin;
   idEncerraSistema:Boolean;

implementation

uses uDm, uUsuario, uAuxiliarCompras;


{$R *.dfm}

procedure T_frmLogin.mudarComEnter(Sender: TObject; Var Key: Char);
begin
   if Key = #13 then
      Perform(Wm_NextDlgCtl,0,0);
end;

procedure T_frmLogin.bbtnOKClick(Sender: TObject);
var
  senhaDescriptada, senhaDigitada: string;
  tempQuery : TSQLQuery;
  data_ponto : TDate;
  Abre_tela  : String;
  Usuario :TUsuario;
  DadosComprador :TDadosComprador;

begin
   if CriteriosParaLogin then
   begin
   // if _dmGeral.RunQueryUsuario(0,edtLogin.Text,'') then
     Usuario:=GetUsuario(0,0,edtLogin.Text,'');
     if Usuario=NIL then
     begin
        StatusBar1.SimpleText:=format('Acesso: %s',['Negado']);
         Application.MessageBox('Usu?rio n?o Cadastrado.','Acesso Negado',0 + 16);
         exit;
     end;


     if Usuario<>NIL then
     begin
       DadosComprador :=CompradorPedido(0,Usuario.nrMatricula);

      cdUsuario          := Usuario.nrMatricula;
      cdUsuarioSistema   := cdUsuario ;
      nmUsuario          := DadosComprador.nmReduzido;
      idPrivilegio       := 7;
      nmLogin            :=Usuario.dsLogin;
      nrCompradorSistema := DadosComprador.nrComprador;
      nrCompradorLogado  := DadosComprador.nrComprador;


      //nrCentroCusto    := _cdsUsuario.FieldByName('NR_CCUSTO').AsInteger;
      //nrGrupoPedido    :=_cdsUsuario.FieldByName('NR_GRUPO').AsInteger;




      if Usuario.idSituacao=ativo then
      begin
         { validar senha informada }
        if isSenhaValida(trim(edtSenha.Text),usuario.dsSenha) then
        begin
             { consultar permiss?o de acesso ao sistema }
               strToAcesso(false);
             if ValidaPermissaoAcesso(cdSistema,Usuario.nrMatricula) then
             begin
               strToAcesso(true);
               InicializarDadosTelaSistema;
               CarregaTelaAcesso(cdSistema,Usuario.nrMatricula);
                _frmTelaPrincipal.Enabled:=TRUE;
                 close;
             end
             else
             begin
              StatusBar1.SimpleText:=format('Acesso: %s',['Negado']);
              Application.MessageBox('Usu?rio n?o Cadastrado para acessar o programa.','Acesso Negado',0 + 16);
             end;

         end
         else
         begin
          StatusBar1.SimpleText:=format('Acesso: %s',['Negado']);
          Application.MessageBox('Senha Inv?lida.','Acesso Negado',0 + 16);
         end;

      end
      else
      begin
        if Usuario.idSituacao=inativo then
        begin
              StatusBar1.SimpleText:=format('Usuario Inativo : %s',[usuario.dsNnomeCompleto]);
              Application.MessageBox('Usu?rio n?o liberado para acessar o programa.','Acesso Negado',0 + 16);
        end;
      end;
     end;


   end;

end;

procedure T_frmLogin.bbtnCancelaClick(Sender: TObject);
begin
   idEncerraSistema:=false;
   if (Application.MessageBox('Deseja encerrar o programa?','Confirma??o',MB_YESNO+MB_ICONQUESTION)) = ID_YES then
   begin
    //  TELA_ATIVA:=TRUE;
      idEncerraSistema:=TRUE;
      close;
   end;
end;

procedure T_frmLogin.FormCreate(Sender: TObject);
begin
  Panel1.Caption := Panel1.Caption + ' '+ dsVersaoSistema;
  bbtnAlteraSenha.Enabled:= false;
  NumeroDeTentativa:=0;
end;

procedure T_frmLogin.FormShow(Sender: TObject);
begin
//Conex?o do Banco de Dado
 if ConexaoComOServidor then
 Begin

       // LblAviso.Visible   := False;
         FalhadeConexao     := False;
        //EdtIDLOGIN.Text := DtmLogDoUsuario.CdsNomesDosPCsNomeDoUsuario.AsString;

        edtLogin.Text := '';
        edtSenha.Text := '';
//        if edtLogin.CanFocus then edtLogin.SetFocus;

  End;

   {if (edtLogin.Text <> '' )  AND (edtSenha.Text = '') then
    begin
        EdtSENHA.SetFocus;
    end;}

end;

procedure T_frmLogin.edtLoginExit(Sender: TObject);
begin
{  if trim(edtLogin.Text)<>'' then
  begin
   if not VerificaUsuario(edtLogin.Text,'') then
    begin
      edtLogin.SetFocus;
      raise Exception.Create('Login n?o digitado!');
   end;
  end;}
  nmLogin:=trim(edtLogin.Text);

end;

procedure T_frmLogin.bbtnAlteraSenhaClick(Sender: TObject);
begin
   _frmAlteraSenha:= T_frmAlteraSenha.Create(Self);
//   _frmAlteraSenha.codUsuario:= codUsuario;
   _frmAlteraSenha.edtSenhaAtual.Text:= senha;
   _frmAlteraSenha.ShowModal;
   _frmAlteraSenha.Free;
end;

procedure T_frmLogin.FormActivate(Sender: TObject);
begin
   if  edtLogin.CanFocus then
       edtLogin.SetFocus;
    exit;
end;

procedure T_frmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
  if _frmLogin.ModalResult<>mrOk then
  begin
   //Encerra_sistema:=true;
//    Application.Terminate;

  end;
//  frmPrincipal.Enabled:=true;       // caso a usuario seja diferente do Admin
end;

function T_frmLogin.VerificaUsuario(nmUsuario,dsSenha:String):Boolean;
var
   senhaDigitada: string;
   tempQuery : TSQLQuery;
begin
    if trim(nmUsuario) = '' then
    begin
      Mensagem('Informe o Login!',48);
      edtLogin.SetFocus;
      exit;
    end;
    if trim(dsSenha)= '' then
    begin
      Mensagem('Informe a Senha!',48);
      edtSenha.SetFocus;
      exit;
    end;
 end;
procedure T_frmLogin.edtSenhaExit(Sender: TObject);
begin
 // VerificaUsuario(edtLogin.Text,edtSenha.Text)
    if _dm.RunQueryUsuario(0,nmLogin,senhaDescriptada) then
    begin
      if UpperCase(edtSenha.text)=UpperCase(DesEncripta(_dm.senhaEncriptada)) then
      begin
        bbtnAlteraSenha.Enabled:=true;
      end;
    end;

end;

function T_frmLogin.ConexaoComOServidor: Boolean;
begin

// 3 - ==========Conecta a aplica??o ao banco de dado existente no caminho previsto
//Nunca convie nas vari?veis sem atribui??o de valor.

    Result := False;

    try
        _dm :=    T_dm.Create(nil);
        _dm._conexao.Connected:=true;

        If _dm._conexao.Connected then
        begin
            Result := True;
        End
        else
        begin
            FalhadeConexao     := True;
        end;

    except
        FalhadeConexao     := True;
    end;
end;

function T_FrmLogin.CriteriosParaLogin:boolean;
begin
//Verificar dados de Preenchimentos
   result:=true;
   if trim(edtLogin.Text)='' then
   begin
     Mensagem('Usuario Inv?lido',16);
     edtLogin.SetFocus;
     exit;
     result:=false;
   end;
   if EdtSENHA.Text = '' then
    begin
        ShowMessage('Senha n?o pode estar em branco!!!');
        edtSenha.SetFocus;
        result:=false;
        Abort;
    end;

//2 - Checar Usuario

end;



end.
