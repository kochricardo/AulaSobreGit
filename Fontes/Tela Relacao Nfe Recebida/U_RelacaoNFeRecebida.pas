unit U_RelacaoNFeRecebida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ComCtrls, Grids,
  DBGrids, StdCtrls, Menus, ExtCtrls;

type
  T_frRelacaoNFeRecebida = class(TForm)
    GroupBox1: TGroupBox;
    DBGridConsultaGED: TDBGrid;
    StatusBar1: TStatusBar;
    SQLConsultaGED: TSQLQuery;
    DSPConsultaGED: TDataSetProvider;
    CDSConsultaGED: TClientDataSet;
    DSConsultaGED: TDataSource;
    SQLConsultaGEDID_SITUACAO: TStringField;
    SQLConsultaGEDCD_FORNECEDOR: TBCDField;
    SQLConsultaGEDNOMP_P: TStringField;
    SQLConsultaGEDDT_EMISSAO: TSQLTimeStampField;
    SQLConsultaGEDDT_ATUALIZACAO: TSQLTimeStampField;
    SQLConsultaGEDNM_COMPRADOR_REDUZIDO: TStringField;
    SQLConsultaGEDDS_NFE_CHAVE: TStringField;
    SQLConsultaGEDNR_NFE: TBCDField;
    CDSConsultaGEDID_SITUACAO: TStringField;
    CDSConsultaGEDCD_FORNECEDOR: TBCDField;
    CDSConsultaGEDNOMP_P: TStringField;
    CDSConsultaGEDDT_EMISSAO: TSQLTimeStampField;
    CDSConsultaGEDDT_ATUALIZACAO: TSQLTimeStampField;
    CDSConsultaGEDNM_COMPRADOR_REDUZIDO: TStringField;
    CDSConsultaGEDDS_NFE_CHAVE: TStringField;
    CDSConsultaGEDNR_NFE: TBCDField;
    SQLConsultaGEDNR_PEDIDO_COMPRA: TBCDField;
    CDSConsultaGEDNR_PEDIDO_COMPRA: TBCDField;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridConsultaGEDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridConsultaGEDTitleClick(Column: TColumn);
    procedure SAIR1Click(Sender: TObject);
    procedure DBGridConsultaGEDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConsultaGED;
  end;

var
  _frRelacaoNFeRecebida: T_frRelacaoNFeRecebida;

implementation

uses U_db, URotinasGenericas, U_VisualizaDadosNFe,
  U_VisualizaCriticaPedidoNFe;

{$R *.dfm}

procedure T_frRelacaoNFeRecebida.ConsultaGED;
begin
  StatusBar1.SimpleText:='Aguarde, consultando relação de NFe..';
  Application.ProcessMessages;

  CDSConsultaGED.Close;
  SQLConsultaGED.Params[0].AsString:=inttostr(NrCpra);
  //SQLConsultaGED.Params[1].AsString:=datetostr(data_sistema);
  CDSConsultaGED.Open;
  if CDSConsultaGED.RecordCount > 0 then
    DBGridConsultaGED.SetFocus
  else
    ShowMessage('NENHUM REGISTRO FOI ENCONTRADO');

  StatusBar1.SimpleText:='QUANTIDADE DE REGISTROS: ' + inttostr(CDSConsultaGED.RecordCount);
  Application.ProcessMessages;
end;

procedure T_frRelacaoNFeRecebida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frRelacaoNFeRecebida:=nil;
  Action:=caFree;
end;

procedure T_frRelacaoNFeRecebida.DBGridConsultaGEDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
  begin
    if formexiste(_frVisualizaDanfe) = false then
    begin
      _frVisualizaDanfe:= T_frVisualizaDanfe.create(self);
    end
    else
    begin
      _frVisualizaCriticaNFe.windowstate := wsnormal;
      _frVisualizaCriticaNFe.bringtofront;
      _frVisualizaCriticaNFe.setfocus;
    end;
  end;
end;

procedure T_frRelacaoNFeRecebida.DBGridConsultaGEDTitleClick(
  Column: TColumn);
begin
  if Column.FieldName = 'NOMP_P' then
  begin
    CDSConsultaGED.IndexFieldNames:='NOMP_P';
    ConsultaGED;
  end;

  if Column.FieldName = 'ID_SITUACAO' then
  begin
    CDSConsultaGED.IndexFieldNames:='ID_SITUACAO';
    ConsultaGED;
  end;

  if Column.FieldName = 'DT_ATUALIZACAO' then
  begin
    CDSConsultaGED.IndexFieldNames:='DT_ATUALIZACAO';
    ConsultaGED;
  end;

  if Column.FieldName = 'DT_EMISSAO' then
  begin
    CDSConsultaGED.IndexFieldNames:='DT_EMISSAO';
    ConsultaGED;
  end;
end;

procedure T_frRelacaoNFeRecebida.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure T_frRelacaoNFeRecebida.DBGridConsultaGEDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if formexiste(_frVisualizaDanfe) = false then
    begin
      _frVisualizaDanfe:= T_frVisualizaDanfe.create(self);
    end
    else
    begin
      _frVisualizaCriticaNFe.windowstate := wsnormal;
      _frVisualizaCriticaNFe.bringtofront;
      _frVisualizaCriticaNFe.setfocus;
    end;
  end;

  if key = #27 then
    close;
end;

procedure T_frRelacaoNFeRecebida.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;

procedure T_frRelacaoNFeRecebida.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  ConsultaGED();
end;

end.
