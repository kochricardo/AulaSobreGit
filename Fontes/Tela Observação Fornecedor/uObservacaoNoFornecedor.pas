unit uObservacaoNoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, sqlExpr,uDm, uRotinasGenericas, uProduto;

type
  T_frmObservacaoLaboratorio = class(TForm)
    GroupBox1: TGroupBox;
    _mmObservacao: TMemo;
    GroupBox2: TGroupBox;
    _dtpObservacao: TDateTimePicker;
    _btnGravaObservacao: TBitBtn;
    _edtNrFornecedor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    _edtNomeFornecedor: TEdit;
    StatusBar1: TStatusBar;
    procedure _btnGravaObservacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _mmObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function ApagaObervacaoCliente(PnrFornecedor:Integer;PDtValidade:Tdate):Boolean;
    procedure MostraUltimasObservacoes(PnrFornecedor: Integer;
      PdtValidade: Tdate);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmObservacaoLaboratorio: T_frmObservacaoLaboratorio;
   NrFornecedorObservacao:Integer;
   DadosFornecedor:TDadosFornecedor;

implementation

uses uAuxiliarCompras;



{$R *.dfm}


function T_frmObservacaoLaboratorio.ApagaObervacaoCliente(PnrFornecedor:Integer;PDtValidade:Tdate): boolean;
VAR
  qryTemp: TSQLQuery;
  ST_QRY: STRING;
begin
  TRY
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;

    with qryTemp do
    begin
      close;
      sql.Clear;
      sql.Add('delete prddm.dcobs where tips_s=''L'' and nros_s=:PnrFornecedor');
     // sql.Add('AND DVAS_S >=:PdtValidade');
      ParamByname('PnrFornecedor').AsInteger := PnrFornecedor;
     // ParamByname('PdtValidade').AsDateTime   := PDtValidade;
      result := TRUE;
      if ExecSQL(false) <= 0 then
        result := false;
    END;
  finally
    qryTemp.close;
    FreeAndNil(qryTemp);
  end;
end;





procedure T_frmObservacaoLaboratorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=caFree;
  NrFornecedorObservacao:=0;
end;

procedure T_frmObservacaoLaboratorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
     VK_ESCAPE:close;
  end;
end;

procedure T_frmObservacaoLaboratorio.FormShow(Sender: TObject);
begin
    _dtpObservacao.Date:=dtSistema;
    if NrFornecedorObservacao>0 then
    begin
      DadosFornecedor:=GetDadosLaboratorio(NrFornecedorObservacao);
      if DadosFornecedor<>nil then
       begin
        _edtNomeFornecedor.Text:=DadosFornecedor.dsNomeFantasia;
        _edtNrFornecedor.Text :=inttostr(DadosFornecedor.nrFornecedor);
        _edtNrFornecedor.ReadOnly:=true;
        MostraUltimasObservacoes(NrFornecedorObservacao,dtSistema);
        _mmObservacao.SetFocus;
     end;
    end;
   if NrFornecedorObservacao=0 then
      _edtNrFornecedor.SetFocus;


end;




procedure T_frmObservacaoLaboratorio.MostraUltimasObservacoes(PnrFornecedor: Integer;PdtValidade:Tdate);
VAR
  qryTemp: TSQLQuery;
  ST_QRY: STRING;
begin
  TRY
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;
    _mmObservacao.Clear;

    with qryTemp do
    begin
      close;
      sql.Clear;
      sql.Add('select TIPS_S,NROS_S,SEQS_S,OBSS_S,DVAS_S,DLCS_S');
      sql.Add(' from prddm.dcobs where tips_s=''L'' and nros_s=:PnrFornecedor');
//      sql.Add('AND DVAS_S >=:PdtValidade');
      sql.Add('order by DLCS_S desc,seqs_s');
      ParamByname('PnrFornecedor').AsInteger := PnrFornecedor;
  //    ParamByname('PdtValidade').AsDateTime   := PDtValidade;
      open;
      first;
    END;
    while not qryTemp.Eof do
    begin
      _dtpObservacao.date := qryTemp.fieldByName('DVAS_S').AsDateTime;
      _mmObservacao.Lines.Add( FormatDateTime('dd/mm/yyyy',qryTemp.FieldByName('dlcs_s').AsDateTime)+' -  ' +  qryTemp.FieldByName('OBSS_S').AsString);
      qryTemp.Next;
    end;
    _frmObservacaoLaboratorio.Repaint;
  finally
    qryTemp.close;
    FreeAndNil(qryTemp);
  end;
end;



procedure T_frmObservacaoLaboratorio._btnGravaObservacaoClick(Sender: TObject);
var
  i,nrPosicao: Integer;
  dtLancamento: Tdate;
  dsObservacao:String;
begin
  dtLancamento := dtSistema;
  ApagaObervacaoCliente(NrFornecedorObservacao,dtSistema);
  for i := 0 to _mmObservacao.Lines.Count do
  begin
    dsObservacao:=_mmObservacao.Lines.Strings[i];
    nrPosicao :=pos('-',dsObservacao)+1;
    if trim(dsObservacao) <> '' then
    begin
       dsObservacao:=copy(dsObservacao,nrPosicao,length(dsObservacao));
       InsereObservacao('L', NrFornecedorObservacao, i + 1,
        UpperCase(copy(TRIM(dsObservacao), 1, 80)), dtLancamento,
        dtSistema, copy(nmLogin, 1, 10), 'P', 0);
    end;
  end;
  MostraUltimasObservacoes(NrFornecedorObservacao,dtLancamento);
end;

procedure T_frmObservacaoLaboratorio._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: begin
                if StrToIntDef(_edtNrFornecedor.Text,0)>0 then
                   DadosFornecedor:=GetDadosLaboratorio(StrToIntDef(_edtNrFornecedor.Text,0));
                   if DadosFornecedor<>nil then
                   begin
                    _edtNomeFornecedor.Text:=DadosFornecedor.dsNomeFantasia;
                    NrFornecedorObservacao:=DadosFornecedor.nrFornecedor;
                    MostraUltimasObservacoes(DadosFornecedor.nrFornecedor,dtSistema);
                    _mmObservacao.SetFocus;
                   end;
               end;
  end;
end;

procedure T_frmObservacaoLaboratorio._mmObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['-']) then
    Key := #0;

end;

end.
