unit UploadArquivo;

interface

uses
  Classes, IdFTP, StdCtrls, SysUtils , Dialogs;

type
  TUpload = class(TThread)
  private
   CFTP : TidFTP;
   CEdit : TEdit;
  protected
    procedure Execute; override;
    procedure FazUpload() ;  protected
    function  TranfereArquivoFtp(dsLocalArquivo,dsDestinoArquivo,nmArquivo,dsTNSMAQUINA,nmUsuario,dsSenhaUsuatio:STRING):Boolean; protected

   public
    constructor Criar(ftp : Tidftp; edit : tedit);
  end;

var
     upNmArquivo:String;
     upDsLocalArquivo,
     upDsDestinoArquivo,
     upDsTNSMAQUINA,
     upNmUsuario,
     upDsSenhaUsuatio:STRING;



implementation

{ TUpload }

constructor TUpload.Criar(ftp: Tidftp; edit : tedit );
begin
inherited Create(True);
FreeOnTerminate := True;
CFTP := ftp;
CEdit := edit;
resume;
end;

procedure TUpload.Execute;
begin
 If (Not Terminated) Then
     TranfereArquivoFtp(upDsLocalArquivo,upDsDestinoArquivo,upNmArquivo,upDsTNSMAQUINA,upNmusuario,upDsSenhaUsuatio)
//   FazUpload;
end;

procedure TUpload.FazUpload;
begin
 With CFTP Do
  Begin
   Try
    If not Connected Then
     Connect;
   except
    On E : Exception do
     Begin
      ShowMessage('N?o conectou : ' + E.Message);
      Exit;
     End;
   end;
   Try
    Try
     Put(CEdit.Text, ExtractFileName(CEdit.Text));
//     ShowMessage('Arquivo Transferido com sucesso...');
    except
     on E : Exception do
      ShowMessage('Erro ao fazer Upload: ' + E.Message);
    end;
   Finally
    Quit;
   End;
  End;
end;

function TUpload.TranfereArquivoFtp(dsLocalArquivo,dsDestinoArquivo,nmArquivo,dsTNSMAQUINA,nmUsuario,dsSenhaUsuatio:STRING):Boolean;
var
 LocalDestino,
 LocalOrigem:String;

BEGIN
    with CFTP do
    begin
     try
      LocalDestino:=dsDestinoArquivo+nmArquivo;
      LocalOrigem :=dsLocalArquivo+'\'+nmArquivo;
      Disconnect();
      Host :=dsTNSMAQUINA;
      Port := 21;
      Username := nmUSUARIO;
      Password := dsSenhaUsuatio;
      try
        Connect;
      except
        On E : Exception do
         Begin
          ShowMessage('N?o conectou : ' + E.Message);
          Disconnect;
          Exit;
         End;
      end;

      ChangeDir(trim(dsDestinoArquivo));
      try
        Put(LocalOrigem,TRIM(nmArquivo),false);
      except
        on E : Exception do
           ShowMessage('Erro ao fazer Upload: ' + E.Message);

      end;
     Except
     begin
      MakeDir(dsDestinoArquivo);
      ChangeDir(dsDestinoArquivo);
      quit;
     End;
    end;
  end;
end;



end.
