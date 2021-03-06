unit uRelatorioCriticaEntradaNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DBClient,
  Provider, DB, SqlExpr, ComCtrls, Grids, DBGrids, StdCtrls, uDm;

type
  T_frRelatorioCriticaEntradaNovo = class(TForm)
    SQL_Divergencia: TSQLQuery;
    DSP_Divergencia: TDataSetProvider;
    CDS_Divergencia: TClientDataSet;
    SQL_TotalCritica: TSQLQuery;
    CDS_TotalCritica: TClientDataSet;
    DSP_TotalCritica: TDataSetProvider;
    StatusBar1: TStatusBar;
    SQL_GeralComprador: TSQLQuery;
    DSP_GeralComprador: TDataSetProvider;
    CDS_GeralComprador: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ChartTotalDivergencia: TChart;
    Series2: TBarSeries;
    ChartDivergencia: TChart;
    Series1: THorizBarSeries;
    ChartPercDivergencia: TChart;
    HorizBarSeries1: THorizBarSeries;
    TabSheet2: TTabSheet;
    ChartFornecPeriodo: TChart;
    BarSeries1: TBarSeries;
    ChartFornecQtdTipo: TChart;
    BarSeries2: THorizBarSeries;
    SQL_Divergencia_Fonecedor: TSQLQuery;
    DSP_Divergencia_Fonecedor: TDataSetProvider;
    CDS_Divergencia_Fonecedor: TClientDataSet;
    DS_Divergencia_Fonecedor: TDataSource;
    DBGridFornecedor: TDBGrid;
    SQL_Divergencia_Detalhe: TSQLQuery;
    DSP_Divergencia_Detalhe: TDataSetProvider;
    CDS_Divergencia_Detalhe: TClientDataSet;
    SQL_ControleDataCritica: TSQLQuery;
    DSP_ControleDataCritica: TDataSetProvider;
    CDS_ControleDataCritica: TClientDataSet;
    SQL_DivergenciaGeralPeriodoFornec: TSQLQuery;
    DSP_DivergenciaGeralPeriodoFornec: TDataSetProvider;
    CDS_DivergenciaGeralPeriodoFornec: TClientDataSet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton4: TRadioButton;
    DBGridDivergencia: TDBGrid;
    ChartDivergenciaFornec: TChart;
    SQL_DivergenciaGeralPeriodoFornecDiv: TSQLQuery;
    DSP_DivergenciaGeralPeriodoFornecDiv: TDataSetProvider;
    CDS_DivergenciaGeralPeriodoFornecDiv: TClientDataSet;
    SQL_Divergencia_FonecedorDiv: TSQLQuery;
    SQL_Divergencia_FonecedorDivTOTAL: TFMTBCDField;
    DSP_Divergencia_FonecedorDiv: TDataSetProvider;
    CDS_Divergencia_FonecedorDiv: TClientDataSet;
    DS_Divergencia_FonecedorDiv: TDataSource;
    Series3: TBarSeries;
    SQL_DivergenciaCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    SQL_DivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQL_DivergenciaTOTAL: TFMTBCDField;
    CDS_DivergenciaCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    CDS_DivergenciaDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDS_DivergenciaTOTAL: TFMTBCDField;
    SQL_TotalCriticaID_SITUACAO_CRITICA: TWideStringField;
    SQL_TotalCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    SQL_TotalCriticaTOTAL: TFMTBCDField;
    CDS_TotalCriticaID_SITUACAO_CRITICA: TWideStringField;
    CDS_TotalCriticaDS_COMPRA_SITUACAO_DIVERGENCIA: TWideStringField;
    CDS_TotalCriticaTOTAL: TFMTBCDField;
    SQL_GeralCompradorDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQL_GeralCompradorTOTAL: TFMTBCDField;
    CDS_GeralCompradorDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDS_GeralCompradorTOTAL: TFMTBCDField;
    SQL_Divergencia_FonecedorCD_FORNECEDOR: TFMTBCDField;
    SQL_Divergencia_FonecedorNOMP_P: TWideStringField;
    SQL_Divergencia_FonecedorTOTAL: TFMTBCDField;
    CDS_Divergencia_FonecedorCD_FORNECEDOR: TFMTBCDField;
    CDS_Divergencia_FonecedorNOMP_P: TWideStringField;
    CDS_Divergencia_FonecedorTOTAL: TFMTBCDField;
    SQL_Divergencia_DetalheTOTAL: TFMTBCDField;
    SQL_Divergencia_DetalheDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQL_Divergencia_DetalheCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    SQL_Divergencia_DetalheNM_COMPRADOR_REDUZIDO: TWideStringField;
    CDS_Divergencia_DetalheDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDS_Divergencia_DetalheTOTAL: TFMTBCDField;
    CDS_Divergencia_DetalheCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    CDS_Divergencia_DetalheNM_COMPRADOR_REDUZIDO: TWideStringField;
    SQL_ControleDataCriticaDATA_MIN: TSQLTimeStampField;
    SQL_ControleDataCriticaDATA_MAX: TSQLTimeStampField;
    CDS_ControleDataCriticaDATA_MIN: TSQLTimeStampField;
    CDS_ControleDataCriticaDATA_MAX: TSQLTimeStampField;
    SQL_DivergenciaGeralPeriodoFornecTOTAL: TFMTBCDField;
    CDS_DivergenciaGeralPeriodoFornecTOTAL: TFMTBCDField;
    SQL_DivergenciaGeralPeriodoFornecDivCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    SQL_DivergenciaGeralPeriodoFornecDivDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQL_DivergenciaGeralPeriodoFornecDivTOTAL: TFMTBCDField;
    CDS_DivergenciaGeralPeriodoFornecDivCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    CDS_DivergenciaGeralPeriodoFornecDivDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDS_DivergenciaGeralPeriodoFornecDivTOTAL: TFMTBCDField;
    SQL_Divergencia_FonecedorDivCD_FORNECEDOR: TFMTBCDField;
    SQL_Divergencia_FonecedorDivNOMP_P: TWideStringField;
    SQL_Divergencia_FonecedorDivCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    SQL_Divergencia_FonecedorDivDS_COMPRA_DIVERGENCIA: TWideStringField;
    SQL_Divergencia_FonecedorDivCD_LABORATORIO: TFMTBCDField;
    CDS_Divergencia_FonecedorDivNOMP_P: TWideStringField;
    CDS_Divergencia_FonecedorDivTOTAL: TFMTBCDField;
    CDS_Divergencia_FonecedorDivCD_FORNECEDOR: TFMTBCDField;
    CDS_Divergencia_FonecedorDivCD_COMPRA_DIVERGENCIA: TFMTBCDField;
    CDS_Divergencia_FonecedorDivDS_COMPRA_DIVERGENCIA: TWideStringField;
    CDS_Divergencia_FonecedorDivCD_LABORATORIO: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBGridFornecedorCellClick(Column: TColumn);
    procedure DBGridFornecedorKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBGridFornecedorTitleClick(Column: TColumn);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBGridDivergenciaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDivergenciaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProcessaRelatorio;
    procedure detalheFornecedor;
    procedure fornecedorPeriodo;
    procedure processaFornecedor;
    procedure fornecedorPeriodoDivergencia;
    function NomeMes(recData:string): string;
    function RetornaUltimoDiaMes(dataAtual:TDateTime): string;
    procedure processaFornecedorDiv(tipoDivergencia:integer);
  end;

var
  _frRelatorioCriticaEntradaNovo: T_frRelatorioCriticaEntradaNovo;

implementation

uses  URotinasGenericas;

{$R *.dfm}

function T_frRelatorioCriticaEntradaNovo.NomeMes(recData:string): string;
begin
  case strtoint(copy(recData,4,2)) of
    01 : Result:='JAN/';
    02 : Result:='FEV/';
    03 : Result:='MAR/';
    04 : Result:='ABR/';
    05 : Result:='MAI/';
    06 : Result:='JUN/';
    07 : Result:='JUL/';
    08 : Result:='AGO/';
    09 : Result:='SET/';
    10 : Result:='OUT/';
    11 : Result:='NOV/';
    12 : Result:='DEZ/';
  end;
  Result:=Result + copy(recData,7,4);
end;

function T_frRelatorioCriticaEntradaNovo.retornaUltimoDiaMes(dataAtual:TDateTime): string;
var
  Ano, Mes, Dia : Word;
begin
  DecodeDate(dataAtual, Ano, Mes, Dia);
  dataAtual := dataAtual + (32 - Dia);
  DecodeDate(dataAtual, Ano, Mes, Dia);
  dataAtual := EncodeDate(Ano, Mes, 01 ) -1;
  DecodeDate(dataAtual, Ano, Mes, Dia);
  Result:=DateToStr(dataAtual);
end;

procedure T_frRelatorioCriticaEntradaNovo.fornecedorPeriodoDivergencia;
var
  dtInicioCriticaGeral,dtFinalCriticaGeral,dtInicioConsulta,dtFinalConsulta  : TDate;
  mesConsulta : string;
begin
  CDS_ControleDataCritica.Close;
  CDS_ControleDataCritica.Open;
  dtInicioCriticaGeral:=CDS_ControleDataCriticaDATA_MIN.AsDateTime;
  dtFinalCriticaGeral:=CDS_ControleDataCriticaDATA_MAX.AsDateTime;

  Series3.ParentChart:=ChartDivergenciaFornec;
  Series3.Clear;
  dtInicioConsulta:=dtInicioCriticaGeral;
  while dtInicioConsulta <= dtFinalCriticaGeral do
  begin
    dtFinalConsulta:=StrToDate(retornaUltimoDiaMes(dtInicioConsulta));
    mesConsulta:=NomeMes(datetostr(dtinicioConsulta));
    CDS_DivergenciaGeralPeriodoFornecDiv.Close;
    SQL_DivergenciaGeralPeriodoFornecDiv.Params[0].AsString:=CDS_Divergencia_FonecedorDivCD_COMPRA_DIVERGENCIA.AsString;
    SQL_DivergenciaGeralPeriodoFornecDiv.Params[1].AsString:=DateToStr(dtInicioConsulta);
    SQL_DivergenciaGeralPeriodoFornecDiv.Params[2].AsString:=DateToStr(dtFinalConsulta);
    SQL_DivergenciaGeralPeriodoFornecDiv.Params[3].AsString:=CDS_Divergencia_FonecedorDivCD_FORNECEDOR.AsString;
    CDS_DivergenciaGeralPeriodoFornecDiv.open;
    Series3.Add(CDS_DivergenciaGeralPeriodoFornecDivTOTAL.AsInteger,mesConsulta,clTeeColor);
    dtInicioConsulta:=dtFinalConsulta + 1;
  end;
  ChartDivergenciaFornec.Title.Text.Clear;
  ChartDivergenciaFornec.Title.Text.Add(trim(CDS_Divergencia_FonecedorDivNOMP_P.AsString) + ' - ' + CDS_Divergencia_FonecedorDivDS_COMPRA_DIVERGENCIA.AsString);
end;

procedure T_frRelatorioCriticaEntradaNovo.processaFornecedorDiv(tipoDivergencia:integer);
begin
  CDS_Divergencia_FonecedorDiv.Close;
  SQL_Divergencia_FonecedorDiv.Params[0].AsString:=inttostr(tipoDivergencia);
  SQL_Divergencia_FonecedorDiv.Params[1].AsString:=inttostr(nrCompradorSistema);
  CDS_Divergencia_FonecedorDiv.Open;
  DBGridDivergencia.SetFocus;
  fornecedorPeriodoDivergencia;
end;

procedure T_frRelatorioCriticaEntradaNovo.fornecedorPeriodo;
var
  dtInicioCriticaGeral,dtFinalCriticaGeral,dtInicioConsulta,dtFinalConsulta  : TDate;
  mesConsulta : string;
begin
  CDS_ControleDataCritica.Close;
  CDS_ControleDataCritica.Open;
  dtInicioCriticaGeral:=CDS_ControleDataCriticaDATA_MIN.AsDateTime;
  dtFinalCriticaGeral:=CDS_ControleDataCriticaDATA_MAX.AsDateTime;

  BarSeries1.ParentChart:=ChartFornecPeriodo;
  BarSeries1.Clear;
  dtInicioConsulta:=dtInicioCriticaGeral;
  while dtInicioConsulta <= dtFinalCriticaGeral do
  begin
    dtFinalConsulta:=StrToDate(retornaUltimoDiaMes(dtInicioConsulta));
    mesConsulta:=NomeMes(datetostr(dtinicioConsulta));
    CDS_DivergenciaGeralPeriodoFornec.Close;
    SQL_DivergenciaGeralPeriodoFornec.Params[0].AsString:=DateToStr(dtInicioConsulta);
    SQL_DivergenciaGeralPeriodoFornec.Params[1].AsString:=DateToStr(dtFinalConsulta);
    SQL_DivergenciaGeralPeriodoFornec.Params[2].AsString:=CDS_Divergencia_FonecedorCD_FORNECEDOR.AsString;
    SQL_DivergenciaGeralPeriodoFornec.Params[3].AsString:=inttostr(nrCompradorSistema);
    CDS_DivergenciaGeralPeriodoFornec.open;
    BarSeries1.Add(CDS_DivergenciaGeralPeriodoFornecTOTAL.AsInteger,mesConsulta,clTeeColor);
    dtInicioConsulta:=dtFinalConsulta + 1;
  end;
  ChartFornecPeriodo.Title.Text.Clear;
  ChartFornecPeriodo.Title.Text.Add(CDS_Divergencia_FonecedorNOMP_P.AsString);
end;

procedure T_frRelatorioCriticaEntradaNovo.detalheFornecedor;
var
  totalLab : integer;
begin
  CDS_Divergencia_Detalhe.Close;
  SQL_Divergencia_Detalhe.Params[0].AsString:=CDS_Divergencia_FonecedorCD_FORNECEDOR.AsString;
  SQL_Divergencia_Detalhe.Params[1].AsString:=inttostr(nrCompradorSistema);
  CDS_Divergencia_Detalhe.Open;
  BarSeries2.ParentChart:=ChartFornecQtdTipo;
  BarSeries2.Clear;
  CDS_Divergencia_Detalhe.First;
  while not CDS_Divergencia_Detalhe.Eof do
  begin
    totalLab:=CDS_Divergencia_DetalheTOTAL.AsInteger;
    BarSeries2.Add(totalLab,CDS_Divergencia_DetalheDS_COMPRA_DIVERGENCIA.AsString,clTeeColor);
    CDS_Divergencia_Detalhe.Next;
  end;
  ChartFornecQtdTipo.Title.Text.Clear;
  ChartFornecQtdTipo.Title.Text.Add(CDS_Divergencia_FonecedorNOMP_P.AsString);
end;

procedure T_frRelatorioCriticaEntradaNovo.processaFornecedor;
begin
  CDS_Divergencia_Fonecedor.Close;
  SQL_Divergencia_Fonecedor.Params[0].AsString:=inttostr(nrCompradorSistema);
  CDS_Divergencia_Fonecedor.Open;
  DBGridFornecedor.SetFocus;
  detalheFornecedor;
  FornecedorPeriodo;
end;

procedure T_frRelatorioCriticaEntradaNovo.ProcessaRelatorio;
var
  totalCritica : integer;
begin
  // Tipo de Divergencias
  CDS_Divergencia.Close;
  SQL_Divergencia.Params[0].AsString:=inttostr(nrCompradorSistema);
  CDS_Divergencia.Open;

  Series1.ParentChart:=ChartDivergencia;
  Series1.Clear;
  Series2.ParentChart:=ChartTotalDivergencia;
  Series2.Clear;
  while not CDS_Divergencia.Eof do
  begin
    totalCritica:=CDS_DivergenciaTOTAL.AsInteger;
    Series1.Add(totalCritica,CDS_DivergenciaDS_COMPRA_DIVERGENCIA.AsString,clTeeColor);
    CDS_Divergencia.Next;
  end;

  // Total Criticas
  CDS_TotalCritica.Close;
  SQL_TotalCritica.Params[0].AsString:=inttostr(nrCompradorSistema);
  CDS_TotalCritica.Open;
  while not CDS_TotalCritica.Eof do
  begin
    Series2.Add(CDS_TotalCriticaTOTAL.AsInteger,CDS_TotalCriticaDS_COMPRA_SITUACAO_DIVERGENCIA.AsString,clTeeColor);
    CDS_TotalCritica.Next;
  end;

  // Percentual
  HorizBarSeries1.ParentChart:=ChartPercDivergencia;
  HorizBarSeries1.Clear;
  CDS_GeralComprador.Close;
  SQL_GeralComprador.Params[0].AsString:=inttostr(nrCompradorSistema);
  CDS_GeralComprador.Open;
  while not CDS_GeralComprador.Eof do
  begin
    HorizBarSeries1.Add(CDS_GeralCompradorTOTAL.AsInteger,CDS_GeralCompradorDS_COMPRA_DIVERGENCIA.AsString,clTeeColor);
    CDS_GeralComprador.Next;
  end;
end;

procedure T_frRelatorioCriticaEntradaNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure T_frRelatorioCriticaEntradaNovo.TabSheet2Show(Sender: TObject);
begin
  processaFornecedor;
  CDS_Divergencia_Detalhe.First;
end;

procedure T_frRelatorioCriticaEntradaNovo.TabSheet1Show(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  try
    ProcessaRelatorio;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure T_frRelatorioCriticaEntradaNovo.DBGridFornecedorCellClick(
  Column: TColumn);
begin
  detalheFornecedor;
  fornecedorPeriodo;
end;

procedure T_frRelatorioCriticaEntradaNovo.DBGridFornecedorKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    detalheFornecedor;
    fornecedorPeriodo;
  end;
end;

procedure T_frRelatorioCriticaEntradaNovo.DBGridFornecedorTitleClick(
  Column: TColumn);
begin
  if Column.FieldName = 'NOMP_P' then
  begin
    CDS_Divergencia_Fonecedor.IndexFieldNames:='NOMP_P';
    detalheFornecedor;
    FornecedorPeriodo;
    CDS_Divergencia_Fonecedor.First;
  end;

  if Column.FieldName = 'TOTAL' then
  begin
    CDS_Divergencia_Fonecedor.IndexFieldNames:='TOTAL';
    detalheFornecedor;
    FornecedorPeriodo;
    CDS_Divergencia_Fonecedor.First;
  end;

end;

procedure T_frRelatorioCriticaEntradaNovo.RadioButton1Click(
  Sender: TObject);
begin
  processaFornecedorDiv(1);
end;

procedure T_frRelatorioCriticaEntradaNovo.RadioButton2Click(
  Sender: TObject);
begin
  processaFornecedorDiv(2);
end;

procedure T_frRelatorioCriticaEntradaNovo.RadioButton3Click(
  Sender: TObject);
begin
  processaFornecedorDiv(3);
end;

procedure T_frRelatorioCriticaEntradaNovo.RadioButton5Click(
  Sender: TObject);
begin
  processaFornecedorDiv(6);
end;

procedure T_frRelatorioCriticaEntradaNovo.RadioButton6Click(
  Sender: TObject);
begin
  processaFornecedorDiv(4);
end;

procedure T_frRelatorioCriticaEntradaNovo.RadioButton4Click(
  Sender: TObject);
begin
  processaFornecedorDiv(5);
end;

procedure T_frRelatorioCriticaEntradaNovo.TabSheet3Show(Sender: TObject);
begin
  processaFornecedorDiv(1);
end;

procedure T_frRelatorioCriticaEntradaNovo.DBGridDivergenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
  fornecedorPeriodoDivergencia;
end;

procedure T_frRelatorioCriticaEntradaNovo.DBGridDivergenciaCellClick(
  Column: TColumn);
begin
  fornecedorPeriodoDivergencia;
end;

end.
