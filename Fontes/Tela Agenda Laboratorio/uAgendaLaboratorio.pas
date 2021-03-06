unit uAgendaLaboratorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBClient, StdCtrls, ExtCtrls, Grids, DBGrids,dateutils,
  uAuxiliarCompras, uSelecaoOperadorLogistico, uCancelaPedidoSuspenso;

type
  TAuxDBGrid = class(TDBGrid);
  T_frmAgendaCompras = class(TForm)
    StatusBar1: TStatusBar;
    _lbeComprador: TLabeledEdit;
    _lbeNrLaboratorio: TLabeledEdit;
    _lbeNomeLaboratorio: TLabeledEdit;
    _cdsAgendaLaboratorio: TClientDataSet;
    _dsAgendaLaboratorio: TDataSource;
    _dbgAgenda: TDBGrid;
    _lbeNomeComprador: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure _dbgAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _dbgAgendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeNrLaboratorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeCompradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeNrLaboratorioKeyPress(Sender: TObject; var Key: Char);
    procedure _dbgAgendaDblClick(Sender: TObject);
    procedure _lbeCompradorExit(Sender: TObject);
  private
    procedure AbreAgendaLaboratorio(PnrComprador: Integer);
    procedure LaboratorioSelecionado;
    procedure executaSaidaCampo;
    { Private declarations }
  public
    { Public declarations }

   DadosComprador :TDadosComprador;

  end;

var
  _frmAgendaCompras: T_frmAgendaCompras;
  nrCompradorAgenda,
  nrFornecedor :integer;

implementation

uses uRotinasGenericas, uDm, uTelaComprasNovaII;

{$R *.dfm}

Procedure T_frmAgendaCompras.AbreAgendaLaboratorio(PnrComprador:Integer);
var
  stQry : TStringList;
begin
 try
   stQry := TStringList.Create;

   with stQry do
   begin
     add('SELECT NR_FORNECEDOR, NM_FORNECEDOR, DT_AGENDAMENTO,NR_ITENS,ID_SITUACAO_AGENDA');
     add('FROM');
     add('(SELECT');
     add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR AS NR_FORNECEDOR,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,');
     add('Count(*) NR_ITENS,');
     add('CD_FABRICANTE,');
     add('DT_AGENDAMENTO,');
     add('DT_PROXIMO_PEDIDO,');
     add('DS_NUMERO_DIA_SEMANA,');
     add('QT_DIAS_LEADTIME_TERMOLABIL,');
     add('QT_DIAS_LEADTIME_FABRICANTE,');
     add('DS_GRUPO_FORNECEDOR,');
     add('CD_GRUPO_CURVA_FABRICANTE,');
     add('case');
     add('when trunc(DT_AGENDAMENTO)<trunc(SYSDATE) then ''Atrasado''');
     add('when trunc(DT_AGENDAMENTO)=trunc(SYSDATE) then ''Agendado''');
     add('when trunc(DT_AGENDAMENTO)>trunc(SYSDATE) then ''Antecipado''');
     add('end ID_SITUACAO_AGENDA');
     add('FROM');
     ADD('PRDDM.DC_MERCADORIA MERCADORIA,');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DC_FISCAL_MERCADORIA FISCAL');
     add('WHERE');
     add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND MERCADORIA.CD_MERCADORIA=COMPRA_MERCADORIA.CD_MERCADORIA ');
     add('AND COMPRA_MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA ');
     add('AND COMPRA_MERCADORIA.CD_EMPRESA=FISCAL.CD_EMPRESA');
     add('AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA ');
     add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     add('AND COMPRA_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     add('AND GRUPO_FORNECEDOR.ID_SITUACAO<>''I''');
     aDD('AND ID_VENDA_AUTORIZADA=''S''');
     add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
//     add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrEmpresa');
     add('GROUP BY  GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
     add('CD_FABRICANTE,');
     add('DT_AGENDAMENTO,');
     add('DT_PROXIMO_PEDIDO,');
     add('DS_NUMERO_DIA_SEMANA,');
     add('QT_DIAS_LEADTIME_TERMOLABIL,');
     add('QT_DIAS_LEADTIME_FABRICANTE,');
     add('DS_GRUPO_FORNECEDOR,');
     add('CD_GRUPO_CURVA_FABRICANTE');
     add('ORDER BY DT_AGENDAMENTO ASC)');
   end;
   stQry.SaveToFile('C:\TEMP\qryAgendaComprador.sql');
   with _cdsAgendaLaboratorio do
   begin
     close;
     CommandText:=stQry.Text;
     Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;
    // Params.ParamByName('PnrEmpresa').AsInteger:=1;
     open;
   end;
   if not _cdsAgendaLaboratorio.IsEmpty then
   begin
      //, , DT_AGENDAMENTO,NR_ITENS,
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_FORNECEDOR')).DisplayFormat:='##,###,##0';
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_FORNECEDOR')).DisplayLabel:='Nr. Lab.';
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_FORNECEDOR')).DisplayWidth:=06;

     TStringField(_cdsAgendaLaboratorio.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
     TStringField(_cdsAgendaLaboratorio.FieldByName('NM_FORNECEDOR')).DisplayWidth:=30;

     TStringField(_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_AGENDA')).DisplayLabel:='Situa??o';
     TStringField(_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_AGENDA')).DisplayWidth:=12;

     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_ITENS')).DisplayFormat:='##,###,##0';
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_ITENS')).DisplayLabel:='Nr. Prod.';
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_ITENS')).DisplayWidth:=06;

     TDateField(_cdsAgendaLaboratorio.FieldByName('DT_AGENDAMENTO')).DisplayFormat:='dd/mm/yyyy';
     TDateField(_cdsAgendaLaboratorio.FieldByName('DT_AGENDAMENTO')).DisplayLabel:='Dt. Agenda';
     TDateField(_cdsAgendaLaboratorio.FieldByName('DT_AGENDAMENTO')).DisplayWidth:=12;


     {TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_UNID_ULT3M')).DisplayFormat:='###,###,##0';
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_UNID_ULT3M')).DisplayLabel:='Nr.Unid. Vend.(3 meses)';
     TIntegerField(_cdsAgendaLaboratorio.FieldByName('NR_UNID_ULT3M')).DisplayWidth:=22;
     TStringField(_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_FABRICANTE')).Visible:=false;}

   end;

 finally
  FreeAndNil(stQry);
 end;
end;

procedure T_frmAgendaCompras._dbgAgendaDblClick(Sender: TObject);
begin
   LaboratorioSelecionado;
end;

procedure T_frmAgendaCompras._dbgAgendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 If odd(_cdsAgendaLaboratorio.RecNo) then
 begin
  _dbgAgenda.Canvas.Font.Color:= clBlack;
  _dbgAgenda.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
 _dbgAgenda.Canvas.Font.Color:= clBlack;
 _dbgAgenda.Canvas.Brush.Color:= clWhite;
 end;

 if ((TAuxDBGrid(_dbgAgenda).DataLink.ActiveRecord + 1 =
      TAuxDBGrid(_dbgAgenda).Row) or (gdSelected in State)) then
  begin
    _dbgAgenda.Canvas.Brush.Color := clGreen;
    _dbgAgenda.Canvas.Font.Style := _dbgAgenda.Canvas.Font.Style + [fsBold];
    _dbgAgenda.Canvas.Font.Color := clWHITE;
  end;

 if Column.Field.FieldName='ID_SITUACAO_AGENDA' then
 begin
  if (_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_AGENDA').AsString='Agendado')   THEN
  begin
   _dbgAgenda.Canvas.Font.Color:= clWhite;
   _dbgAgenda.Canvas.Brush.Color:= clGreen;
  end;
  if (_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_AGENDA').AsString='Antecipado')   THEN
  begin
   _dbgAgenda.Canvas.Font.Color:= clBlack;
   _dbgAgenda.Canvas.Brush.Color:= clYellow;
  end;
  if (_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_AGENDA').AsString='Atrasado')   THEN
  begin
   _dbgAgenda.Canvas.Font.Color:= clWhite;
   _dbgAgenda.Canvas.Brush.Color:= clRed;
  end;
 end;
  _dbgAgenda.Canvas.fillRect(rect);
  _dbgAgenda.DefaultDrawDataCell(Rect, _dbgAgenda.columns[DATACOL].field, State);
//  _dbgAgenda.Canvas.fillRect(rect);
// _dbgAgenda.defaultDrawColumncell(rect,Datacolcolumn,state);

end;

procedure T_frmAgendaCompras._dbgAgendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 difDias :Double;
begin
  case key of
   VK_RETURN : LaboratorioSelecionado;
  end;
end;

procedure T_frmAgendaCompras._lbeCompradorExit(Sender: TObject);
begin
 executaSaidaCampo;
end;

procedure T_frmAgendaCompras._lbeCompradorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
     VK_RETURN : begin
                   nrCompradorAgenda:=StrToIntDef(_lbeComprador.Text,0);
                   DadosComprador:=CompradorPedido(nrCompradorAgenda,0);
                   _lbeNomeComprador.Text:=DadosComprador.nmComprador;
                   if (DadosComprador.nrComprador>0) and (DadosComprador.idAtivo='S') then
                       AbreAgendaLaboratorio(StrToIntDef(_lbeComprador.Text,0));
                   _lbeNrLaboratorio.SetFocus;
                 end;
    end;
end;

procedure T_frmAgendaCompras._lbeNrLaboratorioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
case key of
 VK_RETURN : begin
              if TRIM(_lbeNrLaboratorio.Text)<>'' then
              begin
                if _cdsAgendaLaboratorio.locate('NR_FORNECEDOR',_lbeNrLaboratorio.Text,[]) then
                begin
                   if _dbgAgenda.CanFocus then _dbgAgenda.SetFocus;
                   _lbeNomeLaboratorio.Text:=_cdsAgendaLaboratorio.FieldByName('NM_FORNECEDOR').AsString;
                end
                else
                begin
                 Mensagem('Laborat?rio N?o Encontrado !!!',16);
                 _lbeNrLaboratorio.SelectAll;
                 _lbeNrLaboratorio.SetFocus;
                end;

              end;
             end;
end;
end;

procedure T_frmAgendaCompras._lbeNrLaboratorioKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(key in['0'..'9',#8,#13,#27]) then
     key:=#0;
end;

procedure T_frmAgendaCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=cafree;
end;

procedure T_frmAgendaCompras.FormCreate(Sender: TObject);
begin
  // Scaled:=true;
   if not TestaConexaoBase(_dm._conexao,nrBase) then
   begin
    Mensagem('N?o conectado com Servidor',16);
    close;
    exit;
   end;

 _lbeNomeLaboratorio.Clear;
 nrCompradorAgenda:= nrCompradorSistema;
_lbeComprador.Text:=IntToStr(nrCompradorAgenda);
 DadosComprador:=CompradorPedido(nrCompradorAgenda,0);
_lbeNomeComprador.Text:=DadosComprador.nmComprador;
 AbreAgendaLaboratorio(nrCompradorAgenda);
end;

procedure T_frmAgendaCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
   VK_ESCAPE: close;
 end;
end;

procedure T_frmAgendaCompras.LaboratorioSelecionado;
var
  _cdsTemp:TClientDataSet;
begin
    //nrDiasAntecipacao:=0;
    //nrPedidoPontoEncomenda:=0;
    nrFornecedor:=_cdsAgendaLaboratorio.FieldByName('NR_FORNECEDOR').AsInteger;
   // cdoperadorLogisticoPedido:=1;
    _cdsTemp:=VerificaPedido('S',nrFornecedor);
    if _cdsTemp<>nil then
    begin
     _cdsTemp.Open;
     if not _cdsTemp.IsEmpty then
     begin
       _cdsTemp.recordcount;
       Mensagem('Existem Pedido deste Laboratorio N?o finalizado',48);
       Application.CreateForm(T_frmCancelaPedidoSuspensos,_frmCancelaPedidoSuspensos);
       _frmCancelaPedidoSuspensos._cdsPedidoSuspenso:=_cdsTemp;
       nrLaboratorioCancelaPedido:=nrFornecedor;
       _frmCancelaPedidoSuspensos.ShowModal;
     end;
    end;
    cdOperadorLogisticoLocal:=1;
    if GetOPeracaoLogistica(nrFornecedor)>1 then
    begin
        nrFornecedorLogisticoSelecao:=nrFornecedor;
        Application.CreateForm(T_frmSelecaoOPeradorLogistico, _frmSelecaoOPeradorLogistico);
         _frmSelecaoOPeradorLogistico.ShowModal;
         cdOperadorLogisticoLocal:=cdOPeradorLogisticoSelecao;
         _frmSelecaoOPeradorLogistico.Free;
    end;
    idSituacao          :=_cdsAgendaLaboratorio.FieldByName('ID_SITUACAO_AGENDA').AsString;
    nmLaboratorioLocal  :=FormatFloat('00000',nrFornecedor)+' - '+ _cdsAgendaLaboratorio.FieldByName('NM_FORNECEDOR').AsString;
    idPedidoAgendado    :='N';

    //idAtualizaAgenda:=false;
    idAgendaAntecipada:=false;


    if StrToDateDef(FormatDateTime('dd/mm/yyyy',_cdsAgendaLaboratorio.FieldByName('DT_AGENDAMENTO').AsDateTime),dtSistema)>dtPedido then
    begin
      if confirma('Data pedido Menor que data Agendada!!!'+#13+
                 'Deseja Antecipar Pedido?',MB_DEFBUTTON1)=idyes then
      begin
        if confirma('Deseja Antecipar a Proxima Agenda !!!',MB_DEFBUTTON1)=idno then
        begin
         sleep(0);
   //      nrDiasAntecipacao:= DaysBetween(_cdsAgendaLaboratorio.FieldByName('DT_AGENDAMENTO').AsDateTime,dtPedido);
       end
       else
         idAgendaAntecipada:=true;
      end;
    end;

    if StrToDateDef(FormatDateTime('dd/mm/yyyy',_cdsAgendaLaboratorio.FieldByName('DT_AGENDAMENTO').AsDateTime),dtSistema)=dtPedido then
     //  idAgendado:='S';
      nrCompradorPedidoLocal  := DadosComprador.nrComprador;
      nrFornecedorLocal       := nrFornecedor;


      Application.CreateForm(T_frmTelaCompras, _frmTelaCompras);
     _frmTelaCompras.Show;
     FormPos(_frmTelaCompras,1,1);
     Close;


end;

procedure T_frmAgendaCompras.executaSaidaCampo;
begin
                   nrCompradorAgenda:=StrToIntDef(_lbeComprador.Text,0);
                   DadosComprador:=CompradorPedido(nrCompradorAgenda,0);
                   _lbeNomeComprador.Text:=DadosComprador.nmComprador;
                   if (DadosComprador.nrComprador>0) and (DadosComprador.idAtivo='S') then
                   begin
                       AbreAgendaLaboratorio(StrToIntDef(_lbeComprador.Text,0));
                   _lbeNrLaboratorio.SetFocus;
                   end
                   else
                   begin
                      Mensagem('Comprador N?o ? valido...',16);
                      _lbeComprador.SetFocus;
                      exit;
                   end;

end;
end.
