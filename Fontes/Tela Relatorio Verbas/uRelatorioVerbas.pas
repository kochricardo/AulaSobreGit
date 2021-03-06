unit uRelatorioVerbas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, uDm, DB, DBClient, Buttons,
  uRotinasGenericas;

type
  T_frmRelatorioVerba = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _dbgRelatorioVerba: TDBGrid;
    _dsRelatorio: TDataSource;
    _cdsRelatorioVerbas: TClientDataSet;
    _btnNrVerba: TBitBtn;
    _edtNumeroVerba: TEdit;
    Label1: TLabel;
    _cdsRelatorioVerbasVT_SALDO: TAggregateField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    _edtSaldoVerba: TEdit;
    _edtTotalGasto: TEdit;
    _edtTotalRecebido: TEdit;
    _edtTotalNegociado: TEdit;
    _cdsRelatorioVerbasVT_GASTO: TAggregateField;
    _cdsRelatorioVerbasVT_RECEBIDO: TAggregateField;
    _cdsRelatorioVerbasVT_NEGOCIADO: TAggregateField;
    _chkAgrupaFornecedor: TCheckBox;
    _edtNrComprador: TEdit;
    Label6: TLabel;
    _btnParaExcel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure _dbgRelatorioVerbaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure _dbgRelatorioVerbaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnNrVerbaClick(Sender: TObject);
    procedure _dbgRelatorioVerbaTitleClick(Column: TColumn);
    procedure _chkAgrupaFornecedorClick(Sender: TObject);
    procedure _btnParaExcelClick(Sender: TObject);
  private
    function AbreRelatorioVerbas(nrLaboratorio, nrVerba,nrComprador: integer): Boolean;
    procedure setGridRelatorioVerba;
    procedure SetTotais;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmRelatorioVerba: T_frmRelatorioVerba;
  nrLaboratorioVerba,
  nrVerbaGrid,nrCompradorVerba :Integer;

implementation

{$R *.dfm}

function T_frmRelatorioVerba.AbreRelatorioVerbas(nrLaboratorio,nrVerba,nrComprador:integer):Boolean;
var
  stQry: TStringList;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    if not _chkAgrupaFornecedor.Checked then
        stQry.Add('NR_VERBA,');
    stQry.Add('NR_LABORATORIO,NM_LABORATORIO,Sum(VL_NEGOCIADO) AS VL_NEGOCIADO,');
    stQry.Add('Sum(Nvl(VL_RECEBIDO,0)) AS VL_RECEBIDO,');
    stQry.Add('Sum(VL_RECEBIDO_TRANSFERIDO) AS VL_RECEBIDO_TRANSFERIDO,');
    stQry.Add('Sum(Nvl(VL_GASTO,0)) AS VL_GASTO,Sum(saldo) AS saldo');
    stQry.Add('FROM');
    stQry.Add('(SELECT NR_VERBA,DS_ORIGEM_VERBA,DT_NEGOCIACAO,DT_PREVISTA_CHEGADA,');
    stQry.Add('VL_NEGOCIADO,Sum(Nvl(VL_RECEBIDO,0)) AS VL_RECEBIDO,');
    stQry.Add('Sum(Nvl(VL_GASTO,0)) AS VL_GASTO,Sum(Nvl(VL_RECEBIDO,0)) + ');
    stQry.Add('Sum(Nvl(VL_CREDITO_TRANSFERIDO,0)) - Sum(Nvl(VL_GASTO,0)) AS saldo,');
    stQry.Add('DS_DESTINO_VERBA,NR_LABORATORIO,NM_LABORATORIO,DT_FECHAMENTO,');
    stQry.Add('Sum(Nvl(VL_RECEBIDO,0)) + Sum(Nvl(VL_CREDITO_TRANSFERIDO,0))');
    stQry.Add('AS VL_RECEBIDO_TRANSFERIDO,DS_RESPONSAVEL, USUARIO');
    stQry.Add('FROM');
    stQry.Add('( SELECT CD_GRUPO_FORNECEDOR AS NR_LABORATORIO,');
    stQry.Add('NM_FORNECEDOR AS NM_LABORATORIO,NR_VERBA,');
    stQry.Add('DS_ORIGEM_VERBA,DS_DESTINO_VERBA,DT_NEGOCIACAO,DT_PREVISTA_CHEGADA,');
    stQry.Add('DT_FECHAMENTO,VL_NEGOCIADO,');
    stQry.Add('CASE');
    stQry.Add('WHEN TIPI_I IN (''P'',''F'',''T'',''A'',''D'') THEN Sum(Nvl(VL_LANCAMENTO,0))');
    stQry.Add('END VL_GASTO,');
    stQry.Add('CASE');
    stQry.Add('WHEN TIPI_I IN (''C'') THEN Sum(VL_LANCAMENTO)');
    stQry.Add('END VL_RECEBIDO,');
    stQry.Add('CASE');
    stQry.Add('WHEN TIPI_I IN (''E'') THEN Sum(VL_LANCAMENTO)');
    stQry.Add('END VL_CREDITO_TRANSFERIDO ,');
    stQry.Add('DS_RESPONSAVEL,');
    stQry.Add('USUARIO');
    stQry.Add('FROM');
    stQry.Add('(SELECT   TIPI_I,GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
    stQry.Add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,');
    stQry.Add('NROV_V AS NR_VERBA,');
    stQry.Add('DEOV_V AS DS_ORIGEM_VERBA,DEDV_V AS DS_DESTINO_VERBA,');
    stQry.Add('DTNV_V AS DT_NEGOCIACAO,DTPV_V AS DT_PREVISTA_CHEGADA,');
    stQry.Add('DTFV_V AS DT_FECHAMENTO,RESV_V AS DS_RESPONSAVEL,');
    stQry.Add('USUV_V AS USUARIO,SUM(VLRI_I) AS VL_LANCAMENTO,');
    stQry.Add('SUM(VL_RESERVA_GAM) AS VL_RESERVADO,VLPV_V AS VL_NEGOCIADO');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
    stQry.Add('PRDDM.DCVEB CAPAVERBA');
    stQry.Add('LEFT OUTER JOIN PRDDM.DCIVE itemVerba ON itemVerba.NROV_I=NROV_V AND TIPI_I in(''T'',''P'',''F'',''E'',''C'',''D'',''A'')');
//    stQry.Add('PRDDM.DC_COMPRADOR_GAM');
    stQry.Add('WHERE');
    stQry.Add('LABV_V=GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
  //  stQry.Add('AND NR_COMPRADOR=:PnrComprador');
    if nrLaboratorio>0 then
      stQry.Add('AND LABV_V=:PnrLaboratorio');
    stQry.Add('AND GRUPO_FORNECEDOR.ID_SITUACAO<>''I''');
    stQry.Add('AND stav_v not in(''I'',''N'')');
    stQry.Add('AND LABV_V IN(SELECT DISTINCT CD_GRUPO_FORNECEDOR');
    stQry.Add(' FROM PRDDM.DC_COMPRA_MERCADORIA WHERE   CD_COMPRADOR=:PnrComprador)');
    stQry.Add('GROUP BY TIPI_I,GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
    stQry.Add('DS_GRUPO_FORNECEDOR,');
    stQry.Add('NROV_V ,DEOV_V ,DEDV_V ,DTNV_V ,');
    stQry.Add('DTPV_V ,DTFV_V ,LABV_V ,VLPV_V ,RESV_V,USUV_V )');
    stQry.Add('GROUP BY CD_GRUPO_FORNECEDOR,NM_FORNECEDOR,');
    stQry.Add('TIPI_I,NR_VERBA,DS_ORIGEM_VERBA,');
    stQry.Add('DS_DESTINO_VERBA,DT_NEGOCIACAO,DT_PREVISTA_CHEGADA,DT_FECHAMENTO,');
    stQry.Add('DS_RESPONSAVEL,VL_NEGOCIADO,USUARIO)');
    stQry.Add('GROUP BY NR_LABORATORIO,NM_LABORATORIO,NR_VERBA,DS_ORIGEM_VERBA,');
    stQry.Add('DS_DESTINO_VERBA,DT_NEGOCIACAO,DT_PREVISTA_CHEGADA,DT_FECHAMENTO,');
    stQry.Add('VL_NEGOCIADO,DS_RESPONSAVEL,USUARIO)');
    stQry.Add('GROUP BY');
    if not _chkAgrupaFornecedor.Checked then
        stQry.Add('NR_VERBA,');
    stQry.Add('NR_LABORATORIO,NM_LABORATORIO');
    stQry.SaveToFile('c:\temp\qryRelatorioComprasVerbas.sql');
    with _cdsRelatorioVerbas do
    begin
      close;
      CommandText:=stQry.Text;
      if nrLaboratorio>0 then
         Params.ParamByName('PnrLaboratorio').AsInteger:=nrLaboratorio;
      Params.ParamByName('PnrComprador').AsInteger:=nrComprador;
      open;
      setGridRelatorioVerba;
      if not _cdsRelatorioVerbas.IsEmpty then
        _cdsRelatorioVerbas.IndexFieldNames:='NR_LABORATORIO';
    end;
  finally

  end;

end;

procedure T_frmRelatorioVerba.FormShow(Sender: TObject);
begin
 _edtNrComprador.Text:=IntToStr(nrCompradorVerba);
 AbreRelatorioVerbas(nrLaboratorioVerba,0,nrCompradorVerba);
end;

procedure T_frmRelatorioVerba.setGridRelatorioVerba;
begin
 if not _chkAgrupaFornecedor.Checked then
 begin
  TIntegerField(_cdsRelatorioVerbas.FieldByName('NR_VERBA')).DisplayLabel:='Nr.Verba';
  TIntegerField(_cdsRelatorioVerbas.FieldByName('NR_VERBA')).DisplayWidth:=8;
 end;

  TIntegerField(_cdsRelatorioVerbas.FieldByName('NR_LABORATORIO')).DisplayLabel:='Nr.Lab';
  TIntegerField(_cdsRelatorioVerbas.FieldByName('NR_LABORATORIO')).DisplayWidth:=8;

  TStringField(_cdsRelatorioVerbas.FieldByName('NM_LABORATORIO')).DisplayLabel:='Raz?o Social';
  TStringField(_cdsRelatorioVerbas.FieldByName('NM_LABORATORIO')).DisplayWidth:=50;

  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_NEGOCIADO')).DisplayLabel:='Vlr. Negociado';
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_NEGOCIADO')).DisplayWidth:=14;
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_NEGOCIADO')).DisplayFormat:='###,###,##0.00';

  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_RECEBIDO')).DisplayLabel:='Vlr. Recebido';
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_RECEBIDO')).DisplayWidth:=14;
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_RECEBIDO')).DisplayFormat:='###,###,##0.00';

  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_RECEBIDO_TRANSFERIDO')).DisplayLabel:='Vlr. Receb.+Trans';
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_RECEBIDO_TRANSFERIDO')).DisplayWidth:=14;
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_RECEBIDO_TRANSFERIDO')).DisplayFormat:='###,###,##0.00';

  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_GASTO')).DisplayLabel:='Vlr. Gasto';
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_GASTO')).DisplayWidth:=14;
  TFloatField(_cdsRelatorioVerbas.FieldByName('VL_GASTO')).DisplayFormat:='###,###,##0.00';

  TFloatField(_cdsRelatorioVerbas.FieldByName('SALDO')).DisplayLabel:='Saldo';
  TFloatField(_cdsRelatorioVerbas.FieldByName('SALDO')).DisplayWidth:=14;
  TFloatField(_cdsRelatorioVerbas.FieldByName('SALDO')).DisplayFormat:='###,###,##0.00';
  SetTotais;
end;

procedure T_frmRelatorioVerba._btnNrVerbaClick(Sender: TObject);
begin
  AbreRelatorioVerbas(StrToIntDef(_edtNumeroVerba.Text,0),0,StrToIntDef(_edtNrComprador.Text,0));
end;

procedure T_frmRelatorioVerba._btnParaExcelClick(Sender: TObject);
begin
 GerarExcel(_cdsRelatorioVerbas);
end;

procedure T_frmRelatorioVerba._chkAgrupaFornecedorClick(Sender: TObject);
begin
 _btnNrVerba.Click;
end;

procedure T_frmRelatorioVerba._dbgRelatorioVerbaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

   with _dbgRelatorioVerba do
   begin

// mude a cor das Linha
   If odd(_cdsRelatorioVerbas.RecNo) then
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
// Caso o saldo da Verba seja negativo
// Pinta a linha do Grid de Vermelho.
  if _cdsRelatorioVerbas.FieldByName('SALDO').AsFloat<0 then
  begin
   _dbgRelatorioVerba.Canvas.Brush.color:=ClRed;
   _dbgRelatorioVerba.Canvas.font.color:=Clwhite;
  end;

// mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
      if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clYellow;
         Canvas.Font.Color:= clBlack;
      end;



      DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;



end;

procedure T_frmRelatorioVerba._dbgRelatorioVerbaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
   VK_RETURN: begin

                nrVerbaGrid:=_cdsRelatorioVerbas.FieldByName('NR_VERBA').AsInteger;
                close;
              end;
  end;
end;

procedure T_frmRelatorioVerba._dbgRelatorioVerbaTitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsRelatorioVerbas,Column);
end;

procedure T_frmRelatorioVerba.SetTotais;
begin
  if not _cdsRelatorioVerbas.IsEmpty then
  begin
    _edtSaldoVerba.Text:= FormatFloat('###,###,##0.00',_cdsRelatorioVerbasVT_SALDO.AsVariant);
    _edtTotalGasto.Text:= FormatFloat('###,###,##0.00',_cdsRelatorioVerbasVT_GASTO.AsVariant);
    _edtTotalRecebido.Text:= FormatFloat('###,###,##0.00',_cdsRelatorioVerbasVT_RECEBIDO.AsVariant);
    _edtTotalNegociado.Text:= FormatFloat('###,###,##0.00',_cdsRelatorioVerbasVT_NEGOCIADO.AsVariant);
  end;
end;


end.
