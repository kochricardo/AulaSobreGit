unit uRelacaoNFeRecebida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ComCtrls, Grids,
  DBGrids, StdCtrls, Menus, ExtCtrls, uDm, uAgendaLaboratorio,
  uVisualizaCriticaPedidoNFe;

type
  T_frmNfeRelacaoNFeRecebida = class(TForm)
    GroupBox1: TGroupBox;
    DBGridConsultaGED: TDBGrid;
    StatusBar1: TStatusBar;
    SQLConsultaGED: TSQLQuery;
    DSPConsultaGED: TDataSetProvider;
    CDSConsultaGED: TClientDataSet;
    DSConsultaGED: TDataSource;
    Timer1: TTimer;
    CDSConsultaGEDID_SITUACAO: TWideStringField;
    CDSConsultaGEDCD_FORNECEDOR: TFMTBCDField;
    CDSConsultaGEDNOMP_P: TWideStringField;
    CDSConsultaGEDDT_EMISSAO: TSQLTimeStampField;
    CDSConsultaGEDDT_ATUALIZACAO: TSQLTimeStampField;
    CDSConsultaGEDNM_COMPRADOR_REDUZIDO: TWideStringField;
    CDSConsultaGEDDS_NFE_CHAVE: TWideStringField;
    CDSConsultaGEDNR_NFE: TFMTBCDField;
    CDSConsultaGEDNR_PEDIDO_COMPRA: TFMTBCDField;
    CDSConsultaGEDID_CD: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridConsultaGEDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridConsultaGEDTitleClick(Column: TColumn);
    procedure SAIR1Click(Sender: TObject);
    procedure DBGridConsultaGEDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGridConsultaGEDDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    procedure AbreVisualizadorDanfe;
    { Private declarations }
  public
    { Public declarations }
    procedure ConsultaGED;
  end;

var
  _frmNfeRelacaoNFeRecebida: T_frmNfeRelacaoNFeRecebida;

implementation

uses URotinasGenericas, uVisualizaDadosNFe;

{$R *.dfm}

procedure T_frmNfeRelacaoNFeRecebida.ConsultaGED;
begin
  StatusBar1.Panels[0].Text:='Aguarde, consultando rela??o de NFe..';
  Application.ProcessMessages;

  CDSConsultaGED.Close;
  CDSConsultaGED.Params.ParamByName('NRO_COMPRADOR').AsInteger:=nrCompradorSistema;
  //SQLConsultaGED.Params[1].AsString:=datetostr(data_sistema);
  CDSConsultaGED.Open;
  if CDSConsultaGED.RecordCount > 0 then
    DBGridConsultaGED.SetFocus
  else
    ShowMessage('NENHUM REGISTRO FOI ENCONTRADO');

  StatusBar1.Panels[1].Text:='QUANTIDADE DE REGISTROS: ' + inttostr(CDSConsultaGED.RecordCount);
  StatusBar1.Panels[0].Text:='Consulta concluida...';
  Application.ProcessMessages;
end;

procedure T_frmNfeRelacaoNFeRecebida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _frmNfeRelacaoNFeRecebida:=nil;
  Action:=caFree;
end;

procedure T_frmNfeRelacaoNFeRecebida.DBGridConsultaGEDDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   with DBGridConsultaGED do
   begin

// mude a cor das Linha
   If odd(CDSConsultaGED.RecNo) then
   begin
      Canvas.Font.Color := clblack;
     Canvas.Brush.Color := clSkyBlue;
   end
  else
  begin
    Canvas.Font.Color := clblack;
    Canvas.Brush.Color := clWhite;
  end;
//


// mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
      if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clBlue;
         Canvas.Font.Color:= clwhite;
      end;
      DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;


end;

procedure T_frmNfeRelacaoNFeRecebida.DBGridConsultaGEDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
     AbreVisualizadorDanfe;
end;

procedure T_frmNfeRelacaoNFeRecebida.DBGridConsultaGEDTitleClick(
  Column: TColumn);
begin
 GeraOrdenacao(CDSConsultaGED,Column);
{  if Column.FieldName = 'NOMP_P' then
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
  end;}
end;

procedure T_frmNfeRelacaoNFeRecebida.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure T_frmNfeRelacaoNFeRecebida.DBGridConsultaGEDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     AbreVisualizadorDanfe;

  if key = #27 then
    close;
end;

procedure T_frmNfeRelacaoNFeRecebida.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;

procedure T_frmNfeRelacaoNFeRecebida.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  ConsultaGED();
end;

procedure T_frmNfeRelacaoNFeRecebida.AbreVisualizadorDanfe;
begin
       NRO_CHAVE_NFE:=CDSConsultaGEDDS_NFE_CHAVE.AsString;
       NRO_CHAVE_NFE_FRM:=NRO_CHAVE_NFE;
      _frmNfeVisualizaDanfe:= T_frmNfeVisualizaDanfe.create(self);
      _frmNfeVisualizaDanfe.Top:=0;
      _frmNfeVisualizaDanfe.windowstate := wsnormal;
      _frmNfeVisualizaDanfe.bringtofront;
      _frmNfeVisualizaDanfe.setfocus;

end;
end.
