unit uRelatorioCriticaQuantidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,shellApi, ExtCtrls, uDm, uAuxiliarCompras, DB,
  DBClient;

type
  T_frRelatorioCriticaQuantidade = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Timer1: TTimer;
    _cdsCriticaDivergenciaQuantidade: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure gerarPlanilha;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frRelatorioCriticaQuantidade: T_frRelatorioCriticaQuantidade;

implementation

uses  URotinasGenericas;

{$R *.dfm}

procedure T_frRelatorioCriticaQuantidade.FormShow(Sender: TObject);
begin
//   _cdsCriticaDivergenciaQuantidade:=GetCriticaDivergenciaQuantidade(nrCompradorSistema);
//   _cdsCriticaDivergenciaQuantidade.Open;
 //  GerarExcel(_cdsCriticaDivergenciaQuantidade);
end;

procedure T_frRelatorioCriticaQuantidade.gerarPlanilha;
const
  nomePLanilha ='RelatorioCriticaQuantidadependente.xls';

//r
//NativeExcel : TmxNativeExcel;
begin
  Screen.Cursor:=crSQLWait;
  Label1.Visible:=true;
  Application.ProcessMessages;
   _cdsCriticaDivergenciaQuantidade:=GetCriticaDivergenciaQuantidade(nrCompradorSistema);
   _cdsCriticaDivergenciaQuantidade.Open;
   GerarExcel(_cdsCriticaDivergenciaQuantidade);

//  NativeExcel:=TmxNativeExcel.Create(nil);
  try
    {if DM_Novo.processaDadoRelatorioCriticaQuantidade(inttostr(NrCpra)) > 0 then
    begin
      with NativeExcel do
      begin
        linha:=1;
        NewFile;
        FileName:=nomePLanilha;
        WriteLabel(linha,1,'FORNECEDOR');
        WriteLabel(linha,2,'LAB');
        WriteLabel(linha,3,'CRITICA');
        WriteLabel(linha,4,'NFISCAL');
        WriteLabel(linha,5,'PEDIDO');
        WriteLabel(linha,6,'DATA CRITICA');
        WriteLabel(linha,7,'DATA LIBERACAO');
        WriteLabel(linha,8,'ITEM');
        WriteLabel(linha,9,'MOTIVO PENDENCIA');
        WriteLabel(linha,10,'SOLUCAO');
        inc(linha);
        ActiveFont:=0;
        DM_Novo.CDS_CRITICA_QUANTIDADE.First;
        while not DM_Novo.CDS_CRITICA_QUANTIDADE.Eof do
        begin
          WriteData(linha,1,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[0].AsString);
          WriteData(linha,2,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[1].Value);
          WriteData(linha,3,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[2].Value);
          WriteData(linha,4,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[3].Value);
          WriteData(linha,5,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[4].Value);
          WriteData(linha,6,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[5].AsDateTime);
          WriteData(linha,7,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[6].AsDateTime);
          WriteData(linha,8,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[7].AsInteger);
          WriteData(linha,9,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[8].AsString);
          WriteData(linha,10,DM_Novo.CDS_CRITICA_QUANTIDADE.Fields.Fields[9].AsString);
          Inc(linha);

          DM_Novo.CDS_CRITICA_QUANTIDADE.Next;
        end;
        Shading:=false;
        CloseFile;
        SaveToFile;
      end;
    ShellExecute(0,nil,pchar(nomePlanilha),nil,nil,sw_showmaximized);
    end;}
  finally
    Label1.Visible:=false;
    Screen.Cursor:=crDefault;
  //  NativeExcel.Free;
  end;
end;
procedure T_frRelatorioCriticaQuantidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frRelatorioCriticaQuantidade:=nil;
  Action:=caFree;
end;

procedure T_frRelatorioCriticaQuantidade.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  try
    gerarPlanilha;
    close;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;


end.
