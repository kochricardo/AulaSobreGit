unit uListagemSaldoVerba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRotinasGenericas, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  ComCtrls, uAuxiliarCompras;

type
  T_frmListagemdeverbas = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    _edtNrFornecedor: TEdit;
    Label1: TLabel;
    _edtNrComprador: TEdit;
    _cdsListaSaldoVerba: TClientDataSet;
    _dsListaSaldoVerba: TDataSource;
    _dbgListagemVerba: TDBGrid;
    _btnExecuta: TBitBtn;
    _btnParaExcel: TBitBtn;
    Label2: TLabel;
    _edtNrVerba: TEdit;
    BitBtn2: TBitBtn;
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _btnExecutaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgListagemVerbaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    procedure SetGridListaVerba;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmListagemdeverbas: T_frmListagemdeverbas;

implementation

{$R *.dfm}

procedure T_frmListagemdeverbas._btnExecutaClick(Sender: TObject);
var
  nrVerba,
  NrFornecedor,
  NrComprador:Integer;
begin
    nrVerba:=StrToIntDef(_edtNrVerba.Text,0);
    NrFornecedor:=StrToIntDef(_edtNrFornecedor.Text,0);
    NrComprador:=StrToIntDef(_edtNrComprador.Text,0);
   _cdsListaSaldoVerba:=GetListaSaldoVerba(nrVerba,NrFornecedor,NrComprador);
   if _cdsListaSaldoVerba<>nil then
   begin
    _dsListaSaldoVerba.DataSet:=_cdsListaSaldoVerba;
    _cdsListaSaldoVerba.Open;
    SetGridListaVerba
   end;
end;

procedure T_frmListagemdeverbas._btnParaExcelClick(Sender: TObject);
begin
    if not _cdsListaSaldoVerba.IsEmpty then
     GerarExcel(_cdsListaSaldoVerba);

end;
procedure T_frmListagemdeverbas._dbgListagemVerbaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   with _dbgListagemVerba do
   begin

// mude a cor das Linha
   If odd(_cdsListaSaldoVerba.RecNo) then
   begin
      Canvas.Font.Color := clblack;
     Canvas.Brush.Color := clSkyBlue;
   end
  else
  begin
    Canvas.Font.Color := clblack;
    Canvas.Brush.Color := clWhite;
  end;
  // mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
  if (Column.Field.FieldName = 'SALDO') then
  begin
   if (_dsListaSaldoVerba.DataSet.FieldByName('SALDO').AsFloat<0) then
   begin
       Canvas.brush.Color:= clRed;
       Canvas.Font.Color:= clWhite;
   end;
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


procedure T_frmListagemdeverbas.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure T_frmListagemdeverbas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmListagemdeverbas.SetGridListaVerba;
begin
 TIntegerField(_cdsListaSaldoVerba.FieldByName('NR_LABORATORIO')).DisplayLabel:='Nr.Fornecedor';
 TIntegerField(_cdsListaSaldoVerba.FieldByName('NR_LABORATORIO')).DisplayWidth:=8;

 TStringField(_cdsListaSaldoVerba.FieldByName('NM_FANTASIA')).DisplayLabel:='Nome Fornecedor';
 TStringField(_cdsListaSaldoVerba.FieldByName('NM_FANTASIA')).DisplayWidth:=30;

 TIntegerField(_cdsListaSaldoVerba.FieldByName('NR_VERBA')).DisplayLabel:='Nr.Verba';
 TIntegerField(_cdsListaSaldoVerba.FieldByName('NR_VERBA')).DisplayWidth:=8;

// TFloatField(_cdsListaSaldoVerba.FieldByName('CREDITO')).DisplayLabel:='Vlr.Crédito';
// TFloatField(_cdsListaSaldoVerba.FieldByName('CREDITO')).DisplayWidth:=12;
// TFloatField(_cdsListaSaldoVerba.FieldByName('CREDITO')).DisplayFormat:='###,###,##0.00';



// TFloatField(_cdsListaSaldoVerba.FieldByName('DEBITO')).DisplayLabel:='Vlr.Débito';
// TFloatField(_cdsListaSaldoVerba.FieldByName('DEBITO')).DisplayWidth:=12;
// TFloatField(_cdsListaSaldoVerba.FieldByName('DEBITO')).DisplayFormat:='###,###,##0.00';

// TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO_PERIODO')).DisplayLabel:='Vlr.Débito';
// TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO_PERIODO')).DisplayWidth:=12;
// TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO_PERIODO')).DisplayFormat:='###,###,##0.00';
// TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO_PERIODO')).Visible:=false;

 TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO')).DisplayLabel:='Vlr.Saldo';
 TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO')).DisplayWidth:=12;
 TFloatField(_cdsListaSaldoVerba.FieldByName('SALDO')).DisplayFormat:='###,###,##0.00';

 TIntegerField(_cdsListaSaldoVerba.FieldByName('NR_COMPRADOR')).DisplayLabel:='Nr.Compr.';
 TIntegerField(_cdsListaSaldoVerba.FieldByName('NR_COMPRADOR')).DisplayWidth:=8;

 TStringField(_cdsListaSaldoVerba.FieldByName('NM_COMPRADOR')).DisplayLabel:='Nome Comprador';
 TStringField(_cdsListaSaldoVerba.FieldByName('NM_COMPRADOR')).DisplayWidth:=30;
end;


end.
