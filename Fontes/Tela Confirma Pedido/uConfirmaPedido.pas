unit uConfirmaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uAuxiliarCompras, Buttons, Grids,
  DBGrids, uRotinasGenericas, uDm, DB, DBClient, uDividiPedido,SqlExpr;

type
  T_frmConfirmaPedido = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    _lbeSugeridoSC: TLabeledEdit;
    _lbeCompradoSC: TLabeledEdit;
    GroupBox12: TGroupBox;
    _lbeValorSugeridoSC: TLabeledEdit;
    _lbeValorCompradoSC: TLabeledEdit;
    _lbeValorCompradoCustoSC: TLabeledEdit;
    _chkObservacaoPedidoSC: TCheckBox;
    _edtObservacaoPedidoSC: TEdit;
    _chkObservacaoPedidoRS: TCheckBox;
    _edtObservacaoPedidoRS: TEdit;
    _chkImprimirSC: TCheckBox;
    _chkImprimirRS: TCheckBox;
    _chkGeraExcelRS: TCheckBox;
    _chkGeraExcelSC: TCheckBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    _lbeSugeridoRS: TLabeledEdit;
    _lbeCompradoRS: TLabeledEdit;
    GroupBox15: TGroupBox;
    _lbeValorSugeridoRS: TLabeledEdit;
    _lbeValorCompradoRS: TLabeledEdit;
    _lbeValorCompradoCustoRS: TLabeledEdit;
    _grbParcelaPrazo: TGroupBox;
    _dbgPrazoSC: TDBGrid;
    _btnDividePedidoSC: TBitBtn;
    GroupBox23: TGroupBox;
    _dbgPrazoRS: TDBGrid;
    BitBtn1: TBitBtn;
    _chkBonificaPedidoSC: TCheckBox;
    _chkBonificaPedidoRS: TCheckBox;
    _btnConfirma: TBitBtn;
    _cdsCondicaoPagamentoCDSC: TClientDataSet;
    _dsParcelaPrazoCDSC: TDataSource;
    _cdsCondicaoPagamentoCDRS: TClientDataSet;
    _dsParcelaPrazoCDRS: TDataSource;
    BitBtn2: TBitBtn;
    _edtNrVerbaSC: TEdit;
    _lbNrVerbaSC: TLabel;
    _edtNrVerbaRS: TEdit;
    _lbNrVerbaRS: TLabel;
    _dtpProximaAgenda: TDateTimePicker;
    Label12: TLabel;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    _cbOPeradorLogistico: TComboBox;
    Label1: TLabel;
    _dtpPedido: TDateTimePicker;
    Label2: TLabel;
    _cdsCondicaoPagamentoCDSCnrParcela: TIntegerField;
    _cdsCondicaoPagamentoCDSCnrDiasPrazo: TIntegerField;
    _cdsCondicaoPagamentoCDSCnrCondicao: TIntegerField;
    _cdsCondicaoPagamentoCDRSnrParcela: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure _btnConfirmaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure _chkBonificaPedidoSCClick(Sender: TObject);
    procedure _chkBonificaPedidoRSClick(Sender: TObject);
    procedure _edtNrVerbaSCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtNrVerbaRSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnDividePedidoSCClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure _chkObservacaoPedidoSCClick(Sender: TObject);
    procedure _chkObservacaoPedidoRSClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure SetCamposvaloresPedidoSC;
    procedure SetCamposvaloresPedidoRS;
    function AtualizaStatusPedido(idStatus: Char): Boolean;
    procedure PrazoRS(nrDiasPrazo: Integer);
    procedure PrazoSC(nrDiasPrazo: Integer);
    function PrazoPagamento(tabela: TClientDataSet): string;
    procedure setNumeroVerbaSC;
    procedure setNumeroVerbaRS;
    procedure setNumeroOperador(PnrFornecedor:Integer);
    { Private declarations }
  public
    { Public declarations }
    DadosValoresPedidoSC:TDadosValoresPedido;
    DadosValoresPedidoRS:TDadosValoresPedido;
    nrContaItem:Integer;
    idPrecoCusto,idMostraDesconto:Char;

  end;

var
  _frmConfirmaPedido: T_frmConfirmaPedido;
   nrPedidoFimSC,nrPedidoFimRS,
   nrDiasPrazo,
   nrOperadorLogisticoFim,
   nrCompradorPedidoFIM,
   nrLaboratorioFIM,
   nrAuditoriaSCFim,nrAuditoriaRSFim :Integer;
   vlSugeridoSCFim,vlSugeridoRSFim,nrDiasAjusteFim :Double;
   nrUNidadesSugeridaSCFim,NrUnidadesSugeridaRSFim,
   nrVerbaFim    :Integer;
   PnrLeadTime:Double;
   idPedidoFechado:boolean;
   dtProximaAgendaFim,
   dtAgendafim :Tdate;
   idAtualizaAgendaFim:Boolean;
   PedidoBonificado:Boolean;

implementation

uses uRelatorioVerbas;

{$R *.dfm}

procedure T_frmConfirmaPedido.BitBtn1Click(Sender: TObject);
begin
     idAtualizaAgendaDividir:=idAtualizaAgendaFim;
    dtAgendaDivividir:=dtAgendafim;
    dtProximoPedidoDividir:=dtProximaAgendaFim;
    Application.CreateForm(T_frmDivisaoDePedido, _frmDivisaoDePedido);
//     FormPos(_frmDivisaoDePedido,1,1);

     nrPedidoDividir:=nrPedidoFimRS;
    _frmDivisaoDePedido.ShowModal;
    if (idFechouPedidoSC) then
    begin
       nrPedidoFimSC:=0;
       if nrPedidoFimRS=0 then
       begin
         idPedidoFechado:=true;
         close;
        end;
    end;
    if (idFechouPedidoRS) then
    begin
       nrPedidoFimRS:=0;
       if nrPedidoFimSC=0 then
       begin
         idPedidoFechado:=true;
         close;
        end;
    end;


end;

procedure T_frmConfirmaPedido.BitBtn2Click(Sender: TObject);
begin
  if Confirma('Deseja Realmente Cancela Pedido?',MB_DEFBUTTON2)=IDYES then
  begin
   if AtualizaStatusPedido('I') then
   begin
    ZeraItemAuditoria(nrAuditoriaSCFim);
    ZeraItemAuditoria(nrAuditoriaRSFim);

   nrPedidoFimSC:=0;
   nrPedidoFimRS:=0;
   idPedidoFechado:=true;
   close;
   end;
  end;

end;

procedure T_frmConfirmaPedido._btnConfirmaClick(Sender: TObject);
var
 idCancelaFechamanto:Boolean;
begin
  dtAgendafim:=_dtpProximaAgenda.Date;
  dtProximaAgendaFim:=_dtpProximaAgenda.Date+nrDiasAjusteFim;
  if (dtProximaAgendaFim<(dtSistema-28)) then
     dtProximaAgendaFim:=dtSistema+1;

  idCancelaFechamanto:=false;
  dtPedido:=_dtpPedido.Date;


  if _cbOPeradorLogistico.Visible then
  begin
    nrOperadorLogisticoFim:=StrToIntDef(copy(_cbOPeradorLogistico.Items.Strings[_cbOPeradorLogistico.ItemIndex] ,1,4),1);
  end;
  if _chkBonificaPedidoSC.Checked then
  begin
     nrVerbaFim:=StrToIntDef(_edtNrVerbaSC.Text,0);
     if nrVerbaFim=0 then
     begin
      if Confirma('Pedido Bonificado Sem Verba',MB_DEFBUTTON1)=IDno then
      begin
       Mensagem('Pedido Bonificado Sem Nr. de verba',16);
       _edtNrVerbaSC.SetFocus;
       idCancelaFechamanto:=true;
     end;
    end;
  end;
  if _chkBonificaPedidoRS.Checked then
  begin
     nrVerbaFim:=StrToIntDef(_edtNrVerbaRS.Text,0);
     if nrVerbaFim=0 then
     begin
      if Confirma('Pedido Bonfificado Sem Verba',MB_DEFBUTTON1)=IDno then
      begin
        Mensagem('Pedido Bonificado Sem Nr. de verba',16);
       _edtNrVerbaRS.SetFocus;
       idCancelaFechamanto:=true;
      end;
    end;
  end;

 if Not idCancelaFechamanto then
 begin
   if AtualizaStatusPedido('N') then
   begin
    nrPedidoFimSC:=0;
    nrPedidoFimRS:=0;
    idPedidoFechado:=true;
    close;
   end;
 end;


end;

procedure T_frmConfirmaPedido._btnDividePedidoSCClick(Sender: TObject);
begin
    idAtualizaAgendaDividir:=idAtualizaAgendaFim;
    dtAgendaDivividir:=dtAgendafim;
    dtProximoPedidoDividir:=dtProximaAgendaFim;
    Application.CreateForm(T_frmDivisaoDePedido, _frmDivisaoDePedido);
//     FormPos(_frmDivisaoDePedido,1,1);

     nrPedidoDividir:=nrPedidoFimSC;
    _frmDivisaoDePedido.ShowModal;
    if (idFechouPedidoSC) then
    begin
       nrPedidoFimSC:=0;
       if nrPedidoFimRS=0 then
       begin
         idPedidoFechado:=true;
         close;
        end;
    end;
    if (idFechouPedidoRS) then
    begin
       nrPedidoFimRS:=0;
       if nrPedidoFimSC=0 then
       begin
         idPedidoFechado:=true;
         close;
        end;
    end;


end;

procedure T_frmConfirmaPedido.FormActivate(Sender: TObject);
begin
  if nrPedidoFimSC>0 then
  begin
    sleep(0);
  end;
  if nrOperadorLogisticoFim<=1 then
     setNumeroOperador(nrLaboratorioFIM);

end;

procedure T_frmConfirmaPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=caFree;
end;

procedure T_frmConfirmaPedido.FormCreate(Sender: TObject);
begin
 idPedidoFechado:=false;
 setNumeroVerbaSC;
 setNumeroVerbaRS;
 _dtpProximaAgenda.Date:=dtAgendafim;
 _dtpPedido.Date:=dtSistema;
 if nrPedidoFimSC>0 then
 begin
    DadosValoresPedidoSC:=GetValoresPedido(nrPedidoFimSC,false);
 end;
 if nrPedidoFimRS>0 then
 begin
    DadosValoresPedidoRS:=GetValoresPedido(nrPedidoFimRS,false);
 end;

 if DadosValoresPedidoSC<>nil then
    SetCamposvaloresPedidoSC;
 if DadosValoresPedidoRS<>nil then
    SetCamposvaloresPedidoRS;
//   PrazoSC(nrDiasPrazo);
  // PrazoRS(nrDiasPrazo);
  if DadosValoresPedidoSC<>nil then
  begin
  _cdsCondicaoPagamentoCDSC:=GetMontaTabelaPrazo(DadosValoresPedidoSC.nrCondicaoPagamento);
  if _cdsCondicaoPagamentoCDSC<>nil then
  begin
     _cdsCondicaoPagamentoCDSC.Open;
     _dsParcelaPrazoCDSC.DataSet:=_cdsCondicaoPagamentoCDSC;
     _dbgPrazoSC.DataSource:=_dsParcelaPrazoCDSC;
     _cdsCondicaoPagamentoCDSC.recordcount;

  end;

  end;
  if DadosValoresPedidoRS<>nil then
  begin
  _cdsCondicaoPagamentoCDRS:=GetMontaTabelaPrazo(DadosValoresPedidoRS.nrCondicaoPagamento);
    if _cdsCondicaoPagamentoCDRS<>nil then
    begin
     _dsParcelaPrazoCDRS.DataSet:=_cdsCondicaoPagamentoCDRS;
     _cdsCondicaoPagamentoCDRS.Open;
    end;

  end;


end;


procedure T_frmConfirmaPedido.FormShow(Sender: TObject);
begin
 if nrPedidoFimSC>0 then
    if PedidoBonificado then
       _chkBonificaPedidoSC.Checked:=true;
 if nrPedidoFimRS>0 then
    if PedidoBonificado then
       _chkBonificaPedidoRS.Checked:=true;

end;

procedure  T_frmConfirmaPedido.SetCamposvaloresPedidoSC;
begin
  _lbeSugeridoSC.Text:=FormatFloat('###,###,##0',nrUNidadesSugeridaSCFim);
  _lbeCompradoSC.Text:=FormatFloat('###,###0',DadosValoresPedidoSC.nrTotalUnidadesPedido);
  _lbeValorSugeridoSC.Text:=FormatFloat('###,###,##0.00',vlSugeridoSCFIM);
  _lbeValorCompradoSC.Text:=FormatFloat('###,###,##0.00',DadosValoresPedidoSC.vtPrecoFornecedorPedido);
  _lbeValorCompradoCustoSC.Text:=FormatFloat('###,###,##0.00',DadosValoresPedidoSC.vtPrecoCustoPedido);
end;
procedure T_frmConfirmaPedido._chkBonificaPedidoRSClick(Sender: TObject);
begin
  setNumeroVerbaRS;
  if _chkBonificaPedidoRS.Checked then
  begin
    _chkObservacaoPedidoRS.Checked:=true;
    _edtObservacaoPedidoRS.Text:='PEDIDO BONIFICADO ';
//    _chkObservacaoPedidoRS.Enabled:=false;
    if _edtNrVerbaRS.CanFocus then _edtNrVerbaRS.SetFocus;
  end;
  if not _chkBonificaPedidoSC.Checked then
  begin
    _chkObservacaoPedidoRS.Checked:=false;
    _chkObservacaoPedidoRS.Enabled:=true;
    _edtObservacaoPedidoRS.Enabled:=false;
  end;


end;

procedure T_frmConfirmaPedido._chkBonificaPedidoSCClick(Sender: TObject);
begin
  setNumeroVerbaSC;
  if _chkBonificaPedidoSC.Checked then
  begin
    _chkObservacaoPedidoSC.Checked:=true;
    _edtObservacaoPedidoSC.Text:='PEDIDO BONIFICADO ';
//    _chkObservacaoPedidoSC.Enabled:=false;
    if _edtNrVerbaSC.CanFocus then _edtNrVerbaSC.SetFocus;
  end;
  if not _chkBonificaPedidoSC.Checked then
  begin
    _chkObservacaoPedidoSC.Checked:=false;
    _chkObservacaoPedidoSC.Enabled:=true;
    _edtObservacaoPedidoSC.Enabled:=false;
  end;

end;

procedure T_frmConfirmaPedido._chkObservacaoPedidoRSClick(Sender: TObject);
begin
  if _chkObservacaoPedidoRS.Checked then
    _edtObservacaoPedidoRS.Enabled:=true
  else
    _edtObservacaoPedidoRS.Enabled:=false;

end;

procedure T_frmConfirmaPedido._chkObservacaoPedidoSCClick(Sender: TObject);
begin

  if _chkObservacaoPedidoSC.Checked then
     _edtObservacaoPedidoSC.Enabled:=true
  else
    _edtObservacaoPedidoSC.Enabled:=false;



end;

procedure T_frmConfirmaPedido._edtNrVerbaRSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case key of
   VK_RETURN :
                begin
                  nrVerbaFim := StrToIntDef(_edtNrVerbaRS.Text, 0);
                  if trim(_edtNrVerbaRS.Text) = '' then
                  begin
                    Application.CreateForm(T_frmRelatorioVerba, _frmRelatorioVerba);
                    nrCompradorVerba := nrCompradorPedidoFIM;
                    nrVerbaFim := 0;
                    nrLaboratorioVerba := nrLaboratorioFIM;
                    _frmRelatorioVerba.ShowModal;
                    _edtNrVerbaRS.Text := inttostr(nrVerbaGrid);
                    nrVerbaFim := StrToIntDef(_edtNrVerbaRS.Text, 0);
                    _frmRelatorioVerba.Free;

                  end;

                  if GetNumeroVerba(nrVerbaFim, nrLaboratorioFIM)=0 then
                  begin
                    Mensagem('Verba N?o Cadastrada',16);
                    _edtNrVerbaRS.Clear;
                    _edtNrVerbaRS.SetFocus;
                    exit;
                  end;
                  _btnConfirma.SetFocus;
                end;
                end;

end;

procedure T_frmConfirmaPedido._edtNrVerbaSCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case key of
   VK_RETURN :
                begin
                  nrVerbaFim := StrToIntDef(_edtNrVerbaSC.Text, 0);
                  if trim(_edtNrVerbaSC.Text) = '' then
                  begin
                    Application.CreateForm(T_frmRelatorioVerba, _frmRelatorioVerba);
                    nrCompradorVerba := nrCompradorPedidoFIM;
                    nrVerbaFim := 0;
                    nrLaboratorioVerba := nrLaboratorioFIM;
                    _frmRelatorioVerba.ShowModal;
                    _edtNrVerbaSC.Text := inttostr(nrVerbaGrid);
                    nrVerbaFim := StrToIntDef(_edtNrVerbaSC.Text, 0);
                    _frmRelatorioVerba.Free;

                  end;
                  if (nrVerbaFim>0) then
                   begin
                    if  GetNumeroVerba(nrVerbaFim, nrLaboratorioFIM)=0 then
                     begin
                      Mensagem('Verba N?o Cadastrada',16);
                      _edtNrVerbaSC.Clear;
                      _edtNrVerbaSC.SetFocus;
                      exit;
                     end;
                   end;
                  _btnConfirma.SetFocus;
                end;

 end;
end;

procedure  T_frmConfirmaPedido.SetCamposvaloresPedidoRS;
begin
  _lbeSugeridoRS.Text:=FormatFloat('###,###,##0',NrUnidadesSugeridaRSFim);;
  _lbeCompradoRS.Text:=FormatFloat('###,###0',DadosValoresPedidoRS.nrTotalUnidadesPedido);
  _lbeValorSugeridoRS.Text:=FormatFloat('###,###,##0.00',vlSugeridoRSFIM);
  _lbeValorCompradoRS.Text:=FormatFloat('###,###,##0.00',DadosValoresPedidoRS.vtPrecoFornecedorPedido);
  _lbeValorCompradoCustoRS.Text:=FormatFloat('###,###,##0.00',DadosValoresPedidoRS.vtPrecoCustoPedido);
end;


function T_frmConfirmaPedido.AtualizaStatusPedido(idStatus: Char): Boolean;
var
  stPrazo: String;
  cdPagamento: Integer;
  stObservacaoSC,
  stObservacaoRS:String;
begin
  if not TestaConexaoBase(_dm._conexao, nrBase) then
  begin
    Mensagem('N?o conectado com Servidor',16);
    close;
    exit;
  end;
  result := false;
  stObservacaoSC:='';
  stObservacaoRS:='';
  idPrecoCusto:='N';
  if _chkRelatorioPrecoCusto.Checked then
      idPrecoCusto:='S';
   idMostraDesconto:='N';
   if _chkMostraDesconto.Checked then
      idMostraDesconto:='S';


  if (nrPedidoFimSC > 0)  or  (nrPedidoFimRS>0)then
  begin
    try
      EliminaItemQuantidadeZerada(nrPedidoFimSC);
      EliminaItemQuantidadeZerada(nrPedidoFimRS);
      if nrPedidoFimSC > 0 then
      begin



        if _chkObservacaoPedidoSC.Checked then
           stObservacaoSC:=_edtObservacaoPedidoSC.Text;
        stPrazo := PrazoPagamento(_cdsCondicaoPagamentoCDSC);
        cdPagamento := AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamentoCDSC.recordCount);
        AtualizaCapaPedido(nrPedidoFimSC, cdPagamento, nrOperadorLogisticoFim, PnrLeadTime,
                          idStatus,stObservacaoSC,idAtualizaAgendaFim, _dtpPedido.Date,dtAgendafim,dtProximaAgendaFim,0,0,_chkBonificaPedidoSC.Checked,0);
        AtualizaStatusItemPedido(nrPedidoFimSC, 0, nrOperadorLogisticoFim,idStatus);
       DadosValoresPedidoSC:=GetValoresPedido(nrPedidoFimSC,false);
        AlteraAuditoria(nrAuditoriaSCFim,
                         DadosValoresPedidoSC.nrFornecedor,// PnrFornecedor:Integer;
                         dtAgendafim,//PdtAgendaAtual:TDate;
                         DadosValoresPedidoSC.nrTotalUnidadesPedido,// PqtComprada:Integer;
                         DadosValoresPedidoSC.vtPrecoFornecedorPedido,// PvlComprado:Double;
                         'Pedido Fechado',// PDS_JUSTIFICATIVA:String;
                         DadosValoresPedidoSC.nrCondicaoPagamento);



        if (idStatus='N') and (_chkImprimirSC.Checked) then
        begin
           Imprimir(nrPedidoFimSC,idPrecoCusto,idMostraDesconto);
           if DadosValoresPedidoSC.nrPedidoVinculado>0 then
              imprimir(DadosValoresPedidoSC.nrPedidoVinculado,idPrecoCusto,idMostraDesconto);
        end;
        if (idStatus='N') and (_chkGeraExcelSC.Checked) then
        begin
          if DadosValoresPedidoSC.nrTotalUnidadesPedido>0 then
          begin
            GerarExcelPedido(nrPedidoFimSC,idPrecoCusto,idMostraDesconto);
           if DadosValoresPedidoSC.nrPedidoVinculado>0 then
             GerarExcelPedido(DadosValoresPedidoSC.nrPedidoVinculado,idPrecoCusto,idMostraDesconto);
          end;
        end;

        if _chkBonificaPedidoSC.Checked then
        begin
          nrVerbaFim:=StrToIntDef(_edtNrVerbaSC.Text,0);
          setBonificaPedido(nrPedidoFimSC,0,nrVerbaFim);
          if DadosValoresPedidoSC.nrPedidoVinculado>0 then
             setBonificaPedido(DadosValoresPedidoSC.nrPedidoVinculado,0,nrVerbaFim);

        end;
      end;
    if nrPedidoFimRS > 0 then
    begin
        stObservacaoRS:=_edtObservacaoPedidoRS.Text;
        if _chkObservacaoPedidoRS.Checked then
           stObservacaoRS:=_edtObservacaoPedidoRS.Text;
        stPrazo := PrazoPagamento(_cdsCondicaoPagamentoCDRS);
        cdPagamento := AbrePrazoParcelamento(stPrazo,
          _cdsCondicaoPagamentoCDRS.recordCount);
        AtualizaCapaPedido(nrPedidoFimRS, cdPagamento, nrOperadorLogisticoFim,PnrLeadTime ,idStatus, stObservacaoRS,idAtualizaAgendaFim, _dtpPedido.Date,dtAgendafim,dtProximaAgendaFim,0,0,_chkBonificaPedidoRS.Checked,0);
        AtualizaStatusItemPedido(nrPedidoFimRS, 0,nrOperadorLogisticoFim ,idStatus);
        DadosValoresPedidoRS:=GetValoresPedido(nrPedidoFimRS,false);
         AlteraAuditoria(nrAuditoriaRSFim,
                         DadosValoresPedidoRS.nrFornecedor,// PnrFornecedor:Integer;
                         dtAgendafim,//PdtAgendaAtual:TDate;
                         DadosValoresPedidoRS.nrTotalUnidadesPedido,// PqtComprada:Integer;
                         DadosValoresPedidoRS.vtPrecoFornecedorPedido,// PvlComprado:Double;
                         'Pedido Fechado',// PDS_JUSTIFICATIVA:String;
                         DadosValoresPedidoRS.nrCondicaoPagamento);

        if (idStatus='N') and (_chkImprimirRS.Checked) then
        begin
           Imprimir(nrPedidoFimRS,idPrecoCusto,idMostraDesconto);
           if DadosValoresPedidoRS.nrPedidoVinculado>0 then
              Imprimir(DadosValoresPedidoRS.nrPedidoVinculado,idPrecoCusto,idMostraDesconto);
        end;
        if (idStatus='N') and (_chkGeraExcelSC.Checked) then
        begin
         if DadosValoresPedidoRS.nrTotalUnidadesPedido>0 then
         begin

           GerarExcelPedido(nrPedidoFimRS,idPrecoCusto,idMostraDesconto);
           if DadosValoresPedidoRS.nrPedidoVinculado>0 then
              GerarExcelPedido(DadosValoresPedidoRS.nrPedidoVinculado,idPrecoCusto,idMostraDesconto);
         end;
        end;
        if _chkBonificaPedidoRS.Checked then
        begin
          nrVerbaFim:=StrToIntDef(_edtNrVerbaRS.Text,0);
          setBonificaPedido(nrPedidoFimRS,0,nrVerbaFim);
          if DadosValoresPedidoRS.nrPedidoVinculado>0 then
             setbonificaPedido(DadosValoresPedidoRS.nrPedidoVinculado,0,nrVerbaFim);
        end;

    end;
    except
      on E: Exception do
      begin
        trataerro(E.Message,
          format('Erro na Consulta Venda Fornecedor para Oper.Logaistico %d',
          [nrOperadorLogisticoFim]));
        result := false;
      end;
    end;
    nrContaItem := 0;
    result := true
  end;
  nrPedidoFimSC := 0;
  nrPedidoFimRS := 0;
end;


procedure T_frmConfirmaPedido.PrazoSC(nrDiasPrazo:Integer);
begin
    _cdsCondicaoPagamentoCDSC.close;
    _cdsCondicaoPagamentoCDSC.CreateDataSet;
    _cdsCondicaoPagamentoCDSC.open;
    _cdsCondicaoPagamentoCDSC.Append;
    _cdsCondicaoPagamentoCDSCnrDiasPrazo.AsInteger := nrDiasPrazo;
    _cdsCondicaoPagamentoCDSC.post;
    _cdsCondicaoPagamentoCDSC.open;

end;
procedure T_frmConfirmaPedido.PrazoRS(nrDiasPrazo:Integer);
begin
    _cdsCondicaoPagamentoCDRS.close;
    _cdsCondicaoPagamentoCDRS.CreateDataSet;
    _cdsCondicaoPagamentoCDRS.open;
    _cdsCondicaoPagamentoCDRS.Append;
    _cdsCondicaoPagamentoCDRS.FieldByName('nrDiasPrazo').AsInteger := nrDiasPrazo;
    _cdsCondicaoPagamentoCDRS.post;
    _cdsCondicaoPagamentoCDRS.open;

end;


function T_frmConfirmaPedido.PrazoPagamento(tabela: TClientDataSet): string;
var
  stPrazo: String[36];
begin
  tabela.First;
  stPrazo := '';
  while Not tabela.eof do
  begin
    stPrazo := stPrazo + FormatFloat('000', tabela.FieldByName('NRDIASPRAZO')
      .AsInteger);
    tabela.Next;
  end;
  result := stPrazo;
end;


procedure T_frmConfirmaPedido.setNumeroVerbaSC;
begin
   if _chkBonificaPedidoSC.Checked then
   begin
     _lbNrVerbaSC.Visible:=true;
     _edtNrVerbaSC.Visible:=true;
   end;
   if not _chkBonificaPedidoSC.Checked then
   begin
     _lbNrVerbaSC.Visible:=false;
     _edtNrVerbaSC.Visible:=false;
   end;

end;
procedure T_frmConfirmaPedido.setNumeroVerbaRS;
begin
   if _chkBonificaPedidoRS.Checked then
   begin
     _lbNrVerbaRS.Visible:=true;
     _edtNrVerbaRS.Visible:=true;
   end;
   if not _chkBonificaPedidoRS.Checked then
   begin
     _lbNrVerbaRS.Visible:=false;
     _edtNrVerbaRS.Visible:=false;
   end;

end;

procedure T_frmConfirmaPedido.setNumeroOperador(PnrFornecedor:Integer);
var
    QryTemp :TSQLQuery;

begin
 try
   TestaConexaoBase(_dm._conexao,nrBase);
   QryTemp:=TSQLQuery.Create(nil);
   QryTemp.SQLConnection:=_dm._conexao;
   with QryTemp do
   begin
    sql.Add('SELECT CD_FORNECEDOR,OL.CD_OPERADOR_LOGISTICO as CD_OPERADOR_LOGISTICO,');
    sql.Add('DS_OPERADOR_LOGISTICO,ID_VENDA_EXCLUSIVA,ID_REGISTRA_VENDA_OL,');
    sql.Add('ID_REPOSICAO_ESTOQUE');
    sql.Add('FROM');
    sql.Add('PRDDM.DC_OL_FORNECEDOR OL_FOR,');
    sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
    sql.Add('WHERE');
    sql.Add('OL_FOR.CD_OPERADOR=OL.CD_OPERADOR_LOGISTICO');
    sql.Add('AND ID_SITUACAO=''A''');
    sql.Add('AND CD_FORNECEDOR=:PnrFornecedor');
    sql.Add('UNION ALL');
    sql.Add('SELECT 1,OL.CD_OPERADOR_LOGISTICO,DS_OPERADOR_LOGISTICO,');
    sql.Add('''N'',''N'',''S''');
    sql.Add('FROM');
    sql.Add('PRDDM.DC_OPERADOR_LOGISTICO OL');
    sql.Add('WHERE');
    sql.Add('OL.CD_OPERADOR_LOGISTICO=1');
    sql.Add('ORDER BY CD_FORNECEDOR');
    ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
    OPen;
    First;
   end;
   _cbOPeradorLogistico.Items.Clear;
   if not QryTemp.IsEmpty then
   begin
     _cbOPeradorLogistico.Visible:=true;
     Label1.Visible:=true;
   end;

   while not QryTemp.Eof do
   begin
     close;
     _cbOPeradorLogistico.Items.Add(FormatFloat('0000',QryTemp.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger) +' - '+QryTemp.FieldByName('DS_OPERADOR_LOGISTICO').AsString);
     QryTemp.Next;
   end;
   if _cbOPeradorLogistico.Visible then
      _cbOPeradorLogistico.ItemIndex:=0;
 finally
   FreeAndNil(QryTemp);
 end;
end;




end.


