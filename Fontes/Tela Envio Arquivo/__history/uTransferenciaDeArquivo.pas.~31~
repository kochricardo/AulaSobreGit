unit uTransferenciaDeArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,idFTPCommon,

  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,UploadArquivo, ComCtrls,
  uRotinasGenericas;

type
  T_frmTransferenciaArquivo = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    _idFtp: TIdFTP;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure _idFtpStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure _idFtpWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure _idFtpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure _idFtpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    nrByteTransferido :LongInt;
    procedure TransfereArquivo;
    function Conecta(PstHost, PnmUsuario, PstPassword: String;
      PnrPorta: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmTransferenciaArquivo: T_frmTransferenciaArquivo;
 //ThreadUpLoad:TUpload;
 TransNmArquivo:String;
 TransDsLocalArquivo,
 TransDsDestinoArquivo,
 TransDsTNSMAQUINA,
 TransNmUsuario,
 TransDsSenhaUsuatio:STRING;
 NrTamanhoArquivo :LongInt;
 stExtensaoArquivo,
 stNomePrincipalArquivo :String;
 idTransferido :boolean;


implementation

{$R *.dfm}

procedure T_frmTransferenciaArquivo.Button1Click(Sender: TObject);
begin
 try
  Application.ProcessMessages;
  TransfereArquivo;
  idTransferido:=true;
  Mensagem('Arquivo Transferido com sucesso...',64);
  Button4.Enabled:=true;
  Close;

 except
  Mensagem('Houve Um erro na Transmissão Pedido...'+#13+
           'Verifique ou tente transmitir novamente',MB_ICONSTOP);
  idTransferido:=false;;

 end;

//  TransfereArquivo;
end;

procedure T_frmTransferenciaArquivo.Button2Click(Sender: TObject);
begin
//ThreadUpload.Suspend;
Button2.Enabled := False;
Button3.Enabled := True;
end;

procedure T_frmTransferenciaArquivo.Button3Click(Sender: TObject);
begin
//ThreadUpload.Resume;
Button2.Enabled := True;
Button3.Enabled := False;
end;

procedure T_frmTransferenciaArquivo.Button4Click(Sender: TObject);
begin
//ThreadUpload.Suspend;
_idFtp.Abort;
//ThreadUpload.Terminate;
_IdFTP.Quit;
//Button4.Enabled := False;
//Button2.Enabled := False;
//Button3.Enabled := False;
//Button1.Enabled := True;
//ProgressBar1.Position := 0;
//Memo1.Lines.Add('Transferencia Cancelada!');
close;
end;

procedure T_frmTransferenciaArquivo.FormActivate(Sender: TObject);
begin
 if _frmTransferenciaArquivo.Visible then
     Button1.Click;

{ try
  Application.ProcessMessages;
  TransfereArquivo;
  Mensagem('Arquivo Transferido com sucesso...',64);
  Button4.Enabled:=true;
   _frmTransferenciaArquivo.Close;
 except
  Mensagem('Houve Um erro na Transmissão Pedido...'+#13+
           'Verifique ou tente transmitir novamente',MB_ICONSTOP);

 end;}

end;

procedure T_frmTransferenciaArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmTransferenciaArquivo.FormShow(Sender: TObject);
begin
  Edit1.Text:=TransDsLocalArquivo+'\'+TransNmArquivo;

{try
  Application.ProcessMessages;
  TransfereArquivo;
  Mensagem('Arquivo Transferido com sucesso...',64);
  Button4.Enabled:=true;
   _frmTransferenciaArquivo.Close;
 except
  Mensagem('Houve Um erro na Transmissão Pedido...'+#13+
           'Verifique ou tente transmitir novamente',MB_ICONSTOP);

 end;}


//  TransfereArquivo;

  //Button1.Click;
// try
//  Application.ProcessMessages;
//  TransfereArquivo;
//  sleep(2000);
///  Mensagem('Arquivo Transferido com sucesso...',64);
// except
//  Mensagem('Houve Um erro na Transmissão Pedido...'+#13+
 //          'Verifique ou tente transmitir novamente',MB_ICONSTOP);

 ///end;
 // close;
end;

procedure T_frmTransferenciaArquivo._idFtpStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
 Memo1.Lines.Add(AStatusText);
end;

procedure T_frmTransferenciaArquivo._idFtpWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
Var
Transferido : Integer;
begin
Transferido := AWorkCount div 1024;
nrByteTransferido:=AWorkCount;
Memo1.Lines.Add('Transferido: ' + IntToStr(Transferido) + '/kb.');
ProgressBar1.Position := AWorkCount;
end;

procedure T_frmTransferenciaArquivo._idFtpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
ProgressBar1.Position := 0;
ProgressBar1.Max := AWorkCountMax;
end;

procedure T_frmTransferenciaArquivo._idFtpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
ProgressBar1.Position := ProgressBar1.Max;
 Memo1.Lines.Add('Transferencia Concluída!');
Button1.Enabled := false;
Button2.Enabled := False;
Button3.Enabled := False;
Button4.Enabled := False;
//ThreadUpload.Terminate;
//ShowMessage('Arquivo Transferido !!!');
//_frmTransferenciaArquivo.Close;
//_frmTransferenciaArquivo.Free;
end;


procedure T_frmTransferenciaArquivo.TransfereArquivo;
begin

 try
     upNmArquivo       :=TransNmArquivo;
     upDsLocalArquivo  :=TransDsLocalArquivo;
     upDsDestinoArquivo:=TransDsDestinoArquivo;
     upDsTNSMAQUINA    :=TransDsTNSMAQUINA;
     upNmUsuario       :=TransNmUsuario;
     upDsSenhaUsuatio  :=TransDsSenhaUsuatio;
 //ThreadUpload := Tupload.Criar(_idFtp, Edit1);

  with _idFtp do
  begin

     if not Connected then
     begin
      if Conecta(TransDsTNSMAQUINA,TransNmUsuario,TransDsSenhaUsuatio,21) then
      begin
       ChangeDir(trim(upDsDestinoArquivo));
       try
        Put(upDsLocalArquivo+'/'+upNmArquivo,TRIM(stNomePrincipalArquivo+'.TMP'),false);
        if NrTamanhoArquivo<>nrByteTransferido then
        begin
           Mensagem('Arquivo transferido com Problemas...'+#13+
                    'Faça o envio novamente...',16);
           DELETE(stNomePrincipalArquivo+'.TMP');
           Quit;
           halt;

        end;
        Rename(TRIM(stNomePrincipalArquivo  +'.TMP'),TRIM(stNomePrincipalArquivo+'.TXT'));
        except
         on E : Exception do
               ShowMessage('Erro ao fazer Upload: ' + E.Message);

        end;
       end;
     end;
  end;
//finally
//end;



 finally

 end;

end;





function T_frmTransferenciaArquivo.Conecta(PstHost,PnmUsuario,PstPassword:String;PnrPorta:Integer):Boolean;
begin
      RESULT:=FALSE;
     with _IdFTP do
     begin
     if not Connected then
     begin
      Host :=PstHost;
      Port := PnrPorta;
      //TransferType:=ftBinary;;
      Username := PnmUsuario;
      Password := PstPassword;
      Passive  := true;
      try
        Connect;
        RESULT:=TRUE;
      except
        On E : Exception do
         Begin
          ShowMessage('Não conectou : ' + E.Message);
          Disconnect;
          Exit;
         End;
      end;
     end;
     end;
end;

end.
