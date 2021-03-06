unit U_HistoricoCriticaNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids, DBGrids,
  StdCtrls, ComCtrls;

type
  T_frHistoricoCriticaNFe = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    DBGridCapaCritica: TDBGrid;
    DBGridItemCritica: TDBGrid;
    SQLCapaCritica: TSQLQuery;
    SQLItemCritica: TSQLQuery;
    DSPCapaCritica: TDataSetProvider;
    CDSCapaCritica: TClientDataSet;
    DSCapaCritica: TDataSource;
    DSPItemCritica: TDataSetProvider;
    CDSItemCritica: TClientDataSet;
    DSItemCritica: TDataSource;
    SQLItemCriticaSQ_ORDEM: TBCDField;
    SQLItemCriticaNR_ITEM_ORDEM: TBCDField;
    SQLItemCriticaDS_OBSERVACAO_SISTEMA: TStringField;
    SQLCapaCriticaSQ_ORDEM: TBCDField;
    SQLCapaCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField;
    SQLCapaCriticaDT_CRITICA: TSQLTimeStampField;
    SQLCapaCriticaDT_LIBERACAO: TSQLTimeStampField;
    SQLCapaCriticaDS_OBSERVACAO_COMPRADOR: TStringField;
    CDSCapaCriticaSQ_ORDEM: TBCDField;
    CDSCapaCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TStringField;
    CDSCapaCriticaDT_CRITICA: TSQLTimeStampField;
    CDSCapaCriticaDT_LIBERACAO: TSQLTimeStampField;
    CDSCapaCriticaDS_OBSERVACAO_COMPRADOR: TStringField;
    CDSItemCriticaSQ_ORDEM: TBCDField;
    CDSItemCriticaNR_ITEM_ORDEM: TBCDField;
    CDSItemCriticaDS_OBSERVACAO_SISTEMA: TStringField;
    SQLItemCriticaDS_COMPRA_DIVERGENCIA: TStringField;
    CDSItemCriticaDS_COMPRA_DIVERGENCIA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridCapaCriticaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridItemCriticaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListaHistoricoCritica(dsChaveNF:string);
    procedure ListaItemHistoricoCritica(nrOrdem:integer);
  end;

var
  _frHistoricoCriticaNFe: T_frHistoricoCriticaNFe;

implementation

uses U_db, U_VisualizaCriticaPedidoNFe;

{$R *.dfm}

procedure T_frHistoricoCriticaNFe.ListaHistoricoCritica(dsChaveNF:string);
begin
  CDSCapaCritica.Close;
  SQLCapaCritica.ParamByName('chavenfe').AsString:=dsChaveNF;
  CDSCapaCritica.Open;
end;

procedure T_frHistoricoCriticaNFe.ListaItemHistoricoCritica(nrOrdem:integer);
begin
  CDSItemCritica.Close;
  SQLItemCritica.ParamByName('nrOrdem').AsString:=inttostr(nrOrdem);
  CDSItemCritica.Open;
end;

procedure T_frHistoricoCriticaNFe.FormShow(Sender: TObject);
begin
  ListaHistoricoCritica(_frVisualizaCriticaNFe.NRO_CHAVE_NFE);
end;

procedure T_frHistoricoCriticaNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CDSCapaCritica.Close;
  CDSItemCritica.Close;
  _frHistoricoCriticaNFe:=nil;
  Action:=caFree;
end;

procedure T_frHistoricoCriticaNFe.DBGridCapaCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    ListaItemHistoricoCritica(CDSCapaCriticaSQ_ORDEM.AsInteger);

  if Key = #27 then
    close;
end;

procedure T_frHistoricoCriticaNFe.DBGridItemCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    DBGridCapaCritica.SetFocus;
end;

end.
