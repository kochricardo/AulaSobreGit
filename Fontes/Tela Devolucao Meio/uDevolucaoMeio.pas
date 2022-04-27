unit uDevolucaoMeio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBClient, StdCtrls, CheckLst, Buttons, Grids, DBGrids,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  T_frmDevolucaoMeio = class(TForm)
    Label8: TLabel;
    Label9: TLabel;
    btn_executar: TBitBtn;
    _chkProcessadas: TCheckBox;
    GroupBox1: TGroupBox;
    _chkAgrupar: TCheckListBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    _cbMeioTransmissao: TComboBox;
    _cbDistrito: TComboBox;
    _cbSetor: TComboBox;
    _edtCodigoCliente: TEdit;
    _dtpInicio: TDateTimePicker;
    _dtpDtFinal: TDateTimePicker;
    _cdsRelatorioDevolucao: TClientDataSet;
    _dsRelatorioDevolucao: TDataSource;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    Chart1: TChart;
    Series1: TBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_executarClick(Sender: TObject);
  private
    procedure DevolucaoMeio(dtInicial, dtFinal: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmDevolucaoMeio: T_frmDevolucaoMeio;

implementation

uses uDm;

{$R *.dfm}

procedure T_frmDevolucaoMeio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmDevolucaoMeio.btn_executarClick(Sender: TObject);
begin
  DevolucaoMeio(DateToStr(_dtpInicio.Date),DateToStr(_dtpDtFinal.Date));
end;

procedure T_frmDevolucaoMeio.DevolucaoMeio(dtInicial,dtFinal:String);
var
  stQry : TStringList;
  nrDistritoFinal:integer;
begin
  _cbMeioTransmissao.Enabled:=false;
  _cdsRelatorioDevolucao.FILTERED:=FALSE;
  stQry := TStringList.Create;
  stQry.Add('SELECT');
  stQry.Add('Sum(PVPY_Y+VIRY_Y) AS VL_DEVOLUCAO');
  stQry.Add(',Count(*) as Nr_Item');
  stQry.Add(',MEIOTRANSMISSAO.CD_MEIO_TRANSMISSAO');
  stQry.Add(',DS_MEIO_TRANSMISSAO');
  stQry.Add('FROM');
  stQry.Add('PRDDM.DCMER,');
  stQry.Add('PRDDM.DC_DEV_DETALHE D,');
  stQry.Add('PRDDM.DC_DEV_MOTIVO M,');
  stQry.Add('PRDDM.DCVEN V,');
  stQry.Add('PRDDM.DCCLI,');
  stQry.Add('PRDDM.DCPES,');
  stQry.Add('PRDDM.DCPDC,');
  stQry.Add('PRDDM.DCPDI ITEM');
  stQry.Add('LEFT OUTER JOIN PRDDM.DC_USUARIO USUARIO  ON USUARIO.CD_USUARIO=NTLV_Y');
  stQry.Add('LEFT OUTER jOIN PRDDM.DC_MEIO_TRANSMISSAO MEIOTRANSMISSAO  ON ITEM.CD_MEIO_TRANSMISSAO=MEIOTRANSMISSAO.CD_MEIO_TRANSMISSAO');
  stQry.Add('WHERE');
  stQry.Add('NROO_O=NROO_Y');
  stQry.Add('AND NROM_M=NROM_Y');
  stQry.Add('AND NROC_O=NROC_C');
  stQry.Add('AND CGCP_P=CGCP_C');
  stQry.Add('AND NROV_O=NROV_V');
  stQry.Add('AND NTLV_Y=CD_USUARIO');
  stQry.Add('AND D.CD_DETALHE=CD_MOTIVO_DEVOLUCAO');
  stQry.Add('AND NROM_M not in(13000,2222)');
  stQry.Add('AND  D.CD_DETALHE=CD_MOTIVO_DEVOLUCAO');
  stQry.Add('AND DATO_O BETWEEN '+QuotedStr(dtInicial)+' AND '+QuotedStr(dtFinal));
  stQry.Add('AND STAO_O=''F''');
  stQry.Add('AND TIPO_O IN(1,2)');
  stQry.Add('GROUP BY item.CD_MEIO_TRANSMISSAO,MEIOTRANSMISSAO.CD_MEIO_TRANSMISSAO,DS_MEIO_TRANSMISSAO');
  stQry.Add('ORDER BY Sum(PVPY_Y+VIRY_Y)');
  with _cdsRelatorioDevolucao do
  begin
    close;
    CommandText:=stQry.Text;
    open;
    First;
  end;
  Series1.Clear;
   while not _cdsRelatorioDevolucao.Eof do
   begin
     Series1.Add(_cdsRelatorioDevolucao.FieldByName('VL_DEVOLUCAO').AsFloat,_cdsRelatorioDevolucao.FieldByName('DS_MEIO_TRANSMISSAO').AsString,clTeeColor);
     //Series1.LegendString(_cdsRelatorioDevolucao.FieldByName('CD_MEIO_TRANSMISSAO').asinteger,_cdsRelatorioDevolucao.FieldByName('DS_MEIO_TRANSMISSAO').AsString);
    _cdsRelatorioDevolucao.next;
   end;

end;

end.
