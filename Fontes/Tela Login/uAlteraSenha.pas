unit uAlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uDm, uRotinasGenericas ;

type
  T_frmAlteraSenha = class(TForm)
    bbtnConfirma: TBitBtn;
    bbtnCancela: TBitBtn;
    edtSenhaAtual: TEdit;
    edtNovaSenha: TEdit;
    lblSenhaAtual: TLabel;
    lblNovaSenha: TLabel;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure bbtnConfirmaClick(Sender: TObject);
  private
    { Private declarations }
    senha: string;
    codUsuario: integer;
    NumeroDeTentativa : Integer;
    SucessodeLogin    : Boolean;

  public
    { Public declarations }
  end;

var
  _frmAlteraSenha: T_frmAlteraSenha;
implementation


{$R *.dfm}



procedure T_frmAlteraSenha.bbtnCancelaClick(Sender: TObject);
begin
   Close;
end;

procedure T_frmAlteraSenha.bbtnConfirmaClick(Sender: TObject);
var
   senhaDig: string;
begin

   if (Application.MessageBox('Deseja gravar alteração de senha?','Confirmação',MB_YESNO+MB_ICONQUESTION)) = ID_YES then
   begin
     senhaDig:= Encripta(edtNovaSenha.Text);
     if UpperCase(edtSenhaAtual.text)<>UpperCase(DesEncripta(_dm.senhaEncriptada)) then
     begin
      Mensagem('Senha Inválida !!!',16);
      inc(NumeroDeTentativa);
      if NumeroDeTentativa > 4 then
      Begin
            ShowMessage('Número de Tentativas Excedeu o Limite!');
            Application.Terminate;
      End;
      ShowMessage('Acesso Negado, Verifique o Nome de Usuário ou Senha');
      edtSenhaAtual.SetFocus;
      exit;
     end;
    _dm._cdsUsuario.Edit;
    _dm._cdsUsuarioDS_PASSWD.AsString:= senhaDig;
    _dm._cdsUsuario.post;
    _dm._cdsUsuario.ApplyUpdates(0);
     close;
      //if setSenha(senhaDig,IntToStr(codUsuario)) then
        //Mensagem('Alteração de senha efetuada com sucesso!')
      //else
       // Mensagem('Não foi possivel alterar a senha.');
   end;
end;

end.
