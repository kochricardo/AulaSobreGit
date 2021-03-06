unit uComparacaoAnual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, DBClient, ComCtrls,
  uRotinasGenericas;

type
  T_frmComparacaoAnual = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label18: TLabel;
    _edtNrFornecedor: TEdit;
    _cbxOpcaoCDs: TComboBox;
    _btnExecuta: TBitBtn;
    _btnParaExcel: TBitBtn;
    GroupBox2: TGroupBox;
    _dbgGridItens: TDBGrid;
    _cdsComparacaoItem: TClientDataSet;
    _dsComparacaoItem: TDataSource;
    _cdsComparacaoItemCD_PRODUTO: TIntegerField;
    _cdsComparacaoItemNM_PRODUTO: TStringField;
    _cdsComparacaoItemDS_APRESENTACAO_PRODUTO: TStringField;
    _cdsComparacaoItemNR_UNIDADES_PERIODO: TIntegerField;
    _cdsComparacaoItemNM_PERIODO_01: TStringField;
    _cdsComparacaoItemNM_PERIODO_02: TStringField;
    _cdsComparacaoItemNM_PERIODO_03: TStringField;
    _cdsComparacaoItemNM_PERIODO_04: TStringField;
    _cdsComparacaoItemNM_PERIODO_05: TStringField;
    _cdsComparacaoItemNM_PERIODO_06: TStringField;
    _cdsComparacaoItemNM_PERIODO_07: TStringField;
    _cdsComparacaoItemNM_PERIODO_08: TStringField;
    _cdsComparacaoItemNM_PERIODO_09: TStringField;
    _cdsComparacaoItemNM_PERIODO_10: TStringField;
    _cdsComparacaoItemNM_PERIODO_11: TStringField;
    _cdsComparacaoItemNM_PERIODO_12: TStringField;
    _cdsComparacaoItemID_PRODUTO_SEQ: TStringField;
    StatusBar1: TStatusBar;
  private
    procedure _btnExecutaClick(Sender: TObject);
    procedure MostraItemFornecedor(nrFornecedor, nrCd: Integer);
    procedure SetGridItens;
    procedure _btnParaExcelClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmComparacaoAnual: T_frmComparacaoAnual;

implementation

{$R *.dfm}


procedure T_frmComparacaoAnual.MostraItemFornecedor(nrFornecedor,nrCd:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
    add('SELECT MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA as CODIGO,NM_MERCADORIA,');
    add('DS_APRESENTACAO_MERCADORIA, VL_PRECO_COMPRA,GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
    add('DS_GRUPO_FORNECEDOR,');
    add('CASE');
    add('WHEN ESTOQUE_MERCADORIA.CD_EMPRESA=1 THEN ''SC''');
    add('WHEN ESTOQUE_MERCADORIA.CD_EMPRESA=4 THEN ''RS''');
    add('END CD');
    add('FROM');
    add('PRDDM.DC_MERCADORIA MERCADORIA,');
    add('PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA ,');
    add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO_MERCADORIA,');
    add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
    add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR');
    add('WHERE');
    add('ESTOQUE_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND FINANCEIRO_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND FINANCEIRO_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
    add('AND COMPRA_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
    add('AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
    add('AND GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
    add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND ESTOQUE_mercadoria.cd_EMPRESA=:PnrCD');
    add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
    add('AND QT_FISICO -  QT_RESERVADO -  QT_RESERVA_PROBLEMATICA- QT_VENCIDO<=0');
    add('AND CD_COMPRADOR=:PnrComprador');
   end;
   with _cdsComparacaoItem do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrCD').AsInteger:=nrCd;
     Params.ParamByName('PnrComprador').AsInteger:=nrFornecedor;
    open;
    SetGridItens;
   end;
    if not _cdsComparacaoItem.IsEmpty then
    begin
      _cdsComparacaoItem.IndexFieldNames:='CD_GRUPO_FORNECEDOR;NM_MERCADORIA;DS_APRESENTACAO_MERCADORIA';
      _cdsComparacaoItem.First;
      StatusBar1.Panels[1].Text:='Nr. Itens a Zero --> '+FormatFloat('###,###,##0',_cdsComparacaoItem.RecordCount);
    end;


 finally
   freeAndNil(stQuery);
 end;
end;
procedure T_frmComparacaoAnual._btnExecutaClick(Sender: TObject);
var
 nrComprador,nrCD:Integer;
begin
  nrComprador:=StrToIntDef(_edtNrFornecedor.Text,0);
  nrCD :=_cbxOpcaoCDs.ItemIndex+1;
  if (nrComprador>0) and (nrComprador<20) then
  begin
     MostraItemFornecedor(nrComprador,nrcd);
  end;
end;


procedure T_frmComparacaoAnual._btnParaExcelClick(Sender: TObject);
begin
if not _cdsComparacaoItem.IsEmpty then
        GerarExcel(_cdsComparacaoItem);

end;

procedure T_frmComparacaoAnual.SetGridItens;
begin
  TIntegerField(_cdsComparacaoItem.FieldByName('CODIGO')).DisplayLabel:='Codigo';
  TIntegerField(_cdsComparacaoItem.FieldByName('CODIGO')).DisplayWidth:=8;

  TStringField(_cdsComparacaoItem.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsComparacaoItem.FieldByName('NM_MERCADORIA')).DisplayWidth:=25;

{  TStringField(_cdsEstoqueZero.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdsEstoqueZero.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=25;

  TFloatField(_cdsEstoqueZero.FieldByName('VL_PRECO_COMPRA')).DisplayLabel:='Pre?o Compra';
  TFloatField(_cdsEstoqueZero.FieldByName('VL_PRECO_COMPRA')).DisplayWidth:=13;
  TFloatField(_cdsEstoqueZero.FieldByName('VL_PRECO_COMPRA')).DisplayFormat:='###,###,##0.00';

  TIntegerField(_cdsEstoqueZero.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr. Fornecedor';
  TIntegerField(_cdsEstoqueZero.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=8;

  TStringField(_cdsEstoqueZero.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Forncedor';
  TStringField(_cdsEstoqueZero.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=30;

  TStringField(_cdsEstoqueZero.FieldByName('CD')).DisplayLabel:='CD';
  TStringField(_cdsEstoqueZero.FieldByName('CD')).DisplayWidth:=02;}
end;

end.
