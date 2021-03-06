unit uTelaPrazoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, DB, DBClient, Buttons,
  uAuxiliarCompras, uRotinasGenericas;

type
  T_frmTelaPrazoPedido = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    _dsCondicaoPagamento: TDataSource;
    _cdsCondicaoPagamento: TClientDataSet;
    _cdsCondicaoPagamentoNR_PARCELAS: TAutoIncField;
    _cdsCondicaoPagamentoNR_DIAS: TIntegerField;
    _cdsCondicaoPagamentoPC_PARCELAS: TFloatField;
    _cdsCondicaoPagamentoVL_PARCELAS: TFloatField;
    _cdsCondicaoPagamentoDT_PAGAMENTOS: TDateField;
    _grbParcelaPrazo: TGroupBox;
    _dbgPrazoSC: TDBGrid;
    _cdsPrazoPedido: TClientDataSet;
    _cdsCondicaoPagamentoNR_PARCELA: TAutoIncField;
    IntegerField1: TIntegerField;
    _dsPrazoPedido: TDataSource;
    _btnConfirma: TBitBtn;
    _dtpDtFaturemento: TDateTimePicker;
    _dtpPrevisaoEntrega: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    _cdsTabelaLeadTime: TClientDataSet;
    _dsTabelaLeadTime: TDataSource;
    _bitFechar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure _dbgPrazoSCDblClick(Sender: TObject);
    procedure _dbgPrazoSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnConfirmaClick(Sender: TObject);
    procedure _dtpDtFaturementoChange(Sender: TObject);
    procedure _bitFecharClick(Sender: TObject);
  private
//    procedure PrazoPedido(PnrDiasPrazo: Integer);
    function getCondicaoPagamento(Pnrcondicao: Integer): Boolean;
    procedure AJustaParcelas;
    function setCondicaoPagamentoLocal(nrParcela, nrDias: Integer; pcParcela,
      vlParcela: Double; dtPagamento: TDATE): Boolean;
    procedure CarregaPrazoPedido(PnrDiasPrazo: Integer);
    procedure EliminaCondicaoPagamento;
    function SetPrazoPagamento(tabela: TClientDataSet): string;
    function SetLeadTime(PnrEmpresa: Integer;
      PidTermoLabil: String): TDadosLeadTime;
    procedure FechatabelaPrazo;
    { Private declarations }
  public
    { Public declarations }
    DadosLeadTime: TDadosLeadTime;

  end;

var
  _frmTelaPrazoPedido: T_frmTelaPrazoPedido;
  nrPrazoPedido:Integer;
  vlPedidoPrazo :Double ;
  dtFaturamentoPrazo,
  dtPrevisaoEntregaPrazo:Tdate;
  nrPedidoPrazo:Integer;
  nrLeadTimeEntrega,
  nrFornecedorPrazo,
  NrCDPrazo :Integer;
  idPedidoOCD :Boolean;
  LeadTime,LeadTimeOCD:Double;

implementation



{$R *.dfm}

procedure T_frmTelaPrazoPedido.FormShow(Sender: TObject);
begin
  _cdsCondicaoPagamento.close;
  _cdsCondicaoPagamento.CreateDataSet;
  _cdsPrazoPedido.Close;
  _cdsPrazoPedido.CreateDataSet;

  getCondicaoPagamento(nrPrazoPedido);
  _dtpDtFaturemento.Date:=dtFaturamentoPrazo;
  _dtpPrevisaoEntrega.Date:=dtPrevisaoEntregaPrazo;

   _cdsTabelaLeadTime := TabelaLeadTimeTermolabil(nrFornecedorPrazo);

   DadosLeadTime := SetLeadTime(NrCDPrazo,'N');
   LeadTime:=DadosLeadTime.vlLeadTime;
   if idPedidoOCD then
      LeadTime:=  LeadTime+5;

  // _dtpPrevisao.Date:=_dtpDtFaturemento.Date+LeadTime;

  if _cdsTabelaLeadTime <> nil then
  begin
    _dsTabelaLeadTime.DataSet := _cdsTabelaLeadTime;
    _cdsTabelaLeadTime.open;
    //SetGridLeadTime;
  end;


  { PrazoPedido(nrPrazoPedido);

  get

   if _cdsCondicaoPagamento <> nil then
   begin
     _cdsCondicaoPagamento.open;
     _dsCondicaoPagamento.DataSet := _cdsCondicaoPagamento;
     _cdsCondicaoPagamento.recordCount;
  end;}

end;

procedure T_frmTelaPrazoPedido.CarregaPrazoPedido(PnrDiasPrazo: Integer);
begin
  _cdsPrazoPedido.open;
  _cdsPrazoPedido.Append;
  _cdsPrazoPedido.FieldByName('NR_DIAS').AsInteger := PnrDiasPrazo;
  _cdsPrazoPedido.post;
  _cdsPrazoPedido.open;

end;


FUNCTION T_frmTelaPrazoPedido.getCondicaoPagamento(Pnrcondicao:Integer):Boolean;
var
  PrazoPedido :TCondicaoPagamento;
  I : iNTEGER;
  pcParcela,
  vtparcela,
  vlPedido:Double;
  dtPrevista :TDate;
BEGIN
   _cdsCondicaoPagamento.Close;
   _cdsCondicaoPagamento.CreateDataSet;
   PrazoPedido:=nrParcelaPedido(Pnrcondicao);
   vlPedido      := vlPedidoPrazo;
   dtPrevista    := dtFaturamentoPrazo;
   pcParcela     := 100/PrazoPedido.nrCondicaoPagamento;
   vtparcela     := vlPedido/PrazoPedido.nrCondicaoPagamento;;
   FOR I:=1 TO PrazoPedido.nrCondicaoPagamento DO
   BEGIN
      setCondicaoPagamentoLocal(I,PrazoPedido.nrDiasPrazo[I],pcParcela,vtparcela,dtPrevista+PrazoPedido.nrDiasPrazo[I]);
      CarregaPrazoPedido(PrazoPedido.nrDiasPrazo[I]);
   END;
   _cdsCondicaoPagamento.OPEN;
   _cdsCondicaoPagamento.FIRST;
   vtparcela:=0;
   pcParcela:=0;
   WHILE  NOT _cdsCondicaoPagamento.Eof DO
   BEGIN
    pcParcela:=   pcParcela  + _cdsCondicaoPagamentoPC_PARCELAS.AsFloat;
    _cdsCondicaoPagamento.Next;
   END;
   IF vtparcela<>100 THEN
      AJustaParcelas;
END;


PROCEDURE T_frmTelaPrazoPedido.AJustaParcelas;
VAR
  nrParcelas,I: Integer;
  pcParcela : Double;
  vlAcumulado:Double;
  nrRepeticao:Integer;
BEGIN
   _cdsCondicaoPagamento.Open;
   _cdsCondicaoPagamento.First;
//   VT_PC_PARCELA:=0;
   vlAcumulado:=0;
   nrParcelas:= _cdsCondicaoPagamento.RecordCount;
   nrRepeticao:=0;
   FOR I:=1 TO nrParcelas DO
   BEGIN
       pcParcela:=(100 - vlAcumulado)/(nrParcelas - nrRepeticao);
       Inc(nrRepeticao);
       vlAcumulado:= vlAcumulado + StrToFloat(FormatFloat('##000',pcParcela));
       _cdsCondicaoPagamento.Open;
       if _cdsCondicaoPagamento.Locate('NR_PARCELAS',I,[]) THEN
       begin
         _cdsCondicaoPagamento.Edit;
         _cdsCondicaoPagamentoPC_PARCELAS.AsFloat:=StrToFloatDef(FormatFloat('##000',pcParcela),0);
         _cdsCondicaoPagamento.Post;
       END;
   END;
END;



procedure T_frmTelaPrazoPedido.EliminaCondicaoPagamento;
begin
     if _cdsPrazoPedido.RecordCount>1 then
   begin
     if Confirma('Eliminar Prazo de Pagamento ?',MB_DEFBUTTON2)=idYes then
        _cdsPrazoPedido.Delete;
   end;

end;



function T_frmTelaPrazoPedido.setCondicaoPagamentoLocal(nrParcela,nrDias:Integer;pcParcela,vlParcela:Double;dtPagamento:TDATE):Boolean;
BEGIN
 TRY
  _cdsCondicaoPagamento.Open;
  _cdsCondicaoPagamento.Append;
  _cdsCondicaoPagamento.FieldByName('NR_DIAS').AsInteger  :=nrDias;
  _cdsCondicaoPagamento.FieldByName('PC_PARCELAS').AsFloat      := pcParcela;
  _cdsCondicaoPagamento.FieldByName('VL_PARCELAS').AsFloat      :=vlParcela;
  _cdsCondicaoPagamento.FieldByName('DT_PAGAMENTOS').AsDateTime :=dtPagamento;
  _cdsCondicaoPagamento.Post;
  Result:=true;
 EXCEPT
   BEGIN
    Mensagem('Erro Na Grava??o forma Pagamento',MB_ICONERROR);
    Result:=false;
   END;
 END;
END;


procedure T_frmTelaPrazoPedido._bitFecharClick(Sender: TObject);
begin
 close;
end;

procedure T_frmTelaPrazoPedido._btnConfirmaClick(Sender: TObject);
var
 stPrazo :String;
 cdPagamento :Integer;
 nrDias :Integer;
begin
         _cdsPrazoPedido.First;
         dtFaturamentoPrazo:=_dtpDtFaturemento.Date;
         nrDias:=_cdsPrazoPedido.FieldByName('NR_DIAS').AsInteger;
         stPrazo := SetPrazoPagamento(_cdsPrazoPedido);

         cdPagamento := AbrePrazoParcelamento(stPrazo,_cdsPrazoPedido.recordCount);

         if Confirma('Altera Prazo Pedido ?',MB_DEFBUTTON1)=IDYES then
         begin
           if AlteraPrazoPedido(nrPedidoPrazo,cdPagamento,nrDias,_dtpDtFaturemento.Date,_dtpPrevisaoEntrega.Date ) then
           begin
               Mensagem('Prazo Alterado',MB_ICONINFORMATION);
              FechatabelaPrazo;
              getCondicaoPagamento(cdPagamento);
              _btnConfirma.Enabled:=false;

           end
           else
              Mensagem('Erro ao alterar Prazo....'+#13+
                       'Prazo N?o  Alterado',MB_ICONERROR);



         end;



end;

procedure T_frmTelaPrazoPedido._dbgPrazoSCDblClick(Sender: TObject);
var
 idPosicao:TBookmark;
begin
       idPosicao:=_cdsPrazoPedido.Bookmark;
       _cdsPrazoPedido.edit;
      _cdsPrazoPedido.Post;
     _cdsPrazoPedido.open;

   if _cdsPrazoPedido.RecordCount>1 then
   begin
     _cdsPrazoPedido.Bookmark:=idPosicao;
     EliminaCondicaoPagamento;
   end;

end;

procedure T_frmTelaPrazoPedido._dbgPrazoSCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 idPosicao:TbookMark;
begin

 case key of
      VK_RETURN: begin
                 _cdsPrazoPedido.edit;
                 idPosicao:=_cdsPrazoPedido.Bookmark;
                 _cdsPrazoPedido.Post;
                  _cdsPrazoPedido.open;
                  _cdsPrazoPedido.Bookmark:=idPosicao;

                 if _cdsPrazoPedido.FieldByName('NR_DIAS').AsInteger=0 then
                 EliminaCondicaoPagamento;
      end;
 end;

end;


procedure T_frmTelaPrazoPedido._dtpDtFaturementoChange(Sender: TObject);
begin
_dtpPrevisaoEntrega.Date:=_dtpDtFaturemento.Date+LeadTime;
end;

function T_frmTelaPrazoPedido.SetPrazoPagamento(tabela: TClientDataSet): string;
var
  stPrazo: String[36];
begin
  tabela.First;
  stPrazo := '';
  while Not tabela.eof do
  begin
    stPrazo := stPrazo + FormatFloat('000', tabela.FieldByName('NR_DIAS')
      .AsInteger);
    tabela.Next;
  end;
  Result := stPrazo;
end;


function T_frmTelaPrazoPedido.SetLeadTime(PnrEmpresa: Integer;
  PidTermoLabil: String): TDadosLeadTime;
begin
  if _cdsTabelaLeadTime <> nil then
  begin
    with _cdsTabelaLeadTime do
    begin
      Filtered := false;
      filter := 'CD_EMPRESA=' + IntToStr(PnrEmpresa) + ' AND ID_TERMOLABIL=' + QuotedStr(PidTermoLabil);
      Filtered := true;
    end;
    Result.vlLeadTime := 0;
    Result.vlDesvioPadrao := 0;
    if not _cdsTabelaLeadTime.IsEmpty then
    begin
      Result.vlLeadTime := _cdsTabelaLeadTime.FieldByName('QT_DIAS_MEDIO_LEADTIME').AsFloat;
      Result.vlDesvioPadrao := _cdsTabelaLeadTime.FieldByName('QT_DIAS_DESVIOPADRAO_LEADTIME').AsFloat;
    end;
  end;
end;

procedure T_frmTelaPrazoPedido.FechatabelaPrazo;
begin
   _cdsPrazoPedido.Close;
  _cdsPrazoPedido.CreateDataSet;

end;

end.
