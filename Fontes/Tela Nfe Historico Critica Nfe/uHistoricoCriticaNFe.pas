unit uHistoricoCriticaNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids, DBGrids,
  StdCtrls, ComCtrls, uDm;

type
  T_frmNfeHistoricoCriticaNFe = class(TForm)
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
    SQLCapaCriticaSQ_ORDEM: TFMTBCDField;
    SQLCapaCriticaDT_CRITICA: TSQLTimeStampField;
    SQLCapaCriticaDT_LIBERACAO: TSQLTimeStampField;
    SQLItemCriticaSQ_ORDEM: TFMTBCDField;
    SQLItemCriticaNR_ITEM_ORDEM: TFMTBCDField;
    SQLItemCriticaDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQLItemCriticaDS_OBSERVACAO_SISTEMA: TWideStringField;
    CDSItemCriticaSQ_ORDEM: TFMTBCDField;
    CDSItemCriticaNR_ITEM_ORDEM: TFMTBCDField;
    CDSItemCriticaDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDSItemCriticaDS_OBSERVACAO_SISTEMA: TWideStringField;
    SQLCapaCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    SQLCapaCriticaDS_OBSERVACAO_SOLUCIONADOR: TWideStringField;
    CDSCapaCriticaSQ_ORDEM: TFMTBCDField;
    CDSCapaCriticaDT_CRITICA: TSQLTimeStampField;
    CDSCapaCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    CDSCapaCriticaDT_LIBERACAO: TSQLTimeStampField;
    CDSCapaCriticaDS_OBSERVACAO_SOLUCIONADOR: TWideStringField;
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
  _frmNfeHistoricoCriticaNFe: T_frmNfeHistoricoCriticaNFe;

implementation

uses  UVisualizaCriticaPedidoNFe;

{$R *.dfm}

procedure T_frmNfeHistoricoCriticaNFe.ListaHistoricoCritica(dsChaveNF:string);
begin
  CDSCapaCritica.Close;
  SQLCapaCritica.ParamByName('chavenfe').AsString:=dsChaveNF;
  CDSCapaCritica.Open;
end;

procedure T_frmNfeHistoricoCriticaNFe.ListaItemHistoricoCritica(nrOrdem:integer);
begin
  CDSItemCritica.Close;
  SQLItemCritica.ParamByName('nrOrdem').AsString:=inttostr(nrOrdem);
  CDSItemCritica.Open;
end;

procedure T_frmNfeHistoricoCriticaNFe.FormShow(Sender: TObject);
begin
  ListaHistoricoCritica(_frmVisualizaCriticaNFe.NRO_CHAVE_NFE);
end;

procedure T_frmNfeHistoricoCriticaNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CDSCapaCritica.Close;
  CDSItemCritica.Close;
  _frmNfeHistoricoCriticaNFe:=nil;
  Action:=caFree;
end;

procedure T_frmNfeHistoricoCriticaNFe.DBGridCapaCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    ListaItemHistoricoCritica(CDSCapaCriticaSQ_ORDEM.AsInteger);

  if Key = #27 then
    close;
end;

procedure T_frmNfeHistoricoCriticaNFe.DBGridItemCriticaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    DBGridCapaCritica.SetFocus;
end;

end.
