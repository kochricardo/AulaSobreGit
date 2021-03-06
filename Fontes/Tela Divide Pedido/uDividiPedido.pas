unit uDividiPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, Grids, DBGrids, DBClient, StdCtrls, uRotinasGenericas,
  uDm, Buttons, ExtCtrls, uAuxiliarCompras, uProduto, uPrecoDescontoItem;

type
  TDadosNovoPedido = record
  cdPrazo      :Integer;
  nrDiasPedido :Integer;
  dtPedido     :TdaTe;
end;

type

   TMinhaJanelaHint = class(THintWindow)
   public
       procedure doActivateHint(Sender: TObject);
end;



type
  TCellGrid = class(Grids.TCustomGrid);
  T_frmDivisaoDePedido = class(TForm)
    StatusBar1: TStatusBar;
    _grbInformacaoPedido: TGroupBox;
    Label1: TLabel;
    _edtqtPedido: TEdit;
    _cdsPercentualPedido: TClientDataSet;
    _dsPercentualPedido: TDataSource;
    DBGrid1: TDBGrid;
    _cdsPercentualPedidoNR_PEDIDO: TIntegerField;
    _cdsPercentualPedidoPC_PEDIDO: TFloatField;
    GroupBox1: TGroupBox;
    _dbgPedido: TDBGrid;
    GroupBox2: TGroupBox;
    _cdsPercentualPedidoID_SELECIONADO: TStringField;
    Label2: TLabel;
    _edtNrPedido: TEdit;
    _dsPedidoNovo: TDataSource;
    _cdsPedidoNovo: TClientDataSet;
    Label3: TLabel;
    _edtFornecedor: TEdit;
    _edtNrCNPJ: TEdit;
    Label4: TLabel;
    _dtPedido: TEdit;
    _dtPrevista: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    _btnSetQuantidade: TBitBtn;
    _grbPrazoPed_01: TGroupBox;
    _dbgPrazoRS: TDBGrid;
    _grbPrazoPed_02: TGroupBox;
    DBGrid2: TDBGrid;
    _grbPrazoPed_03: TGroupBox;
    DBGrid3: TDBGrid;
    _grbPrazoPed_04: TGroupBox;
    DBGrid4: TDBGrid;
    _grbPrazoPed_05: TGroupBox;
    DBGrid5: TDBGrid;
    _grbPrazoPed_06: TGroupBox;
    DBGrid6: TDBGrid;
    _grbPrazoPed_07: TGroupBox;
    DBGrid7: TDBGrid;
    _grbPrazoPed_08: TGroupBox;
    DBGrid8: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    _cdsCondicaoPagamento1: TClientDataSet;
    _cdsCondicaoPagamento1NR_PARCELA: TAutoIncField;
    _cdsCondicaoPagamento1NR_DIAS: TIntegerField;
    _dsCondicaoPagamento1: TDataSource;
    _cdsCondicaoPagamento2: TClientDataSet;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    _dsCondicaoPagamento2: TDataSource;
    _cdsCondicaoPagamento3: TClientDataSet;
    AutoIncField2: TAutoIncField;
    IntegerField2: TIntegerField;
    _dsCondicaoPagamento3: TDataSource;
    _cdsCondicaoPagamento4: TClientDataSet;
    AutoIncField3: TAutoIncField;
    IntegerField3: TIntegerField;
    _dsCondicaoPagamento4: TDataSource;
    _cdsCondicaoPagamento5: TClientDataSet;
    AutoIncField4: TAutoIncField;
    IntegerField4: TIntegerField;
    _dsCondicaoPagamento5: TDataSource;
    _cdsCondicaoPagamento6: TClientDataSet;
    AutoIncField5: TAutoIncField;
    IntegerField5: TIntegerField;
    _dsCondicaoPagamento6: TDataSource;
    _cdsCondicaoPagamento7: TClientDataSet;
    AutoIncField6: TAutoIncField;
    IntegerField6: TIntegerField;
    _dsCondicaoPagamento7: TDataSource;
    _cdsCondicaoPagamento8: TClientDataSet;
    AutoIncField7: TAutoIncField;
    IntegerField7: TIntegerField;
    _dsCondicaoPagamento8: TDataSource;
    _dtpPedido_01: TDateTimePicker;
    Label9: TLabel;
    _dtpPedido_02: TDateTimePicker;
    _dtpPedido_03: TDateTimePicker;
    _dtpPedido_04: TDateTimePicker;
    _dtpPedido_05: TDateTimePicker;
    _dtpPedido_06: TDateTimePicker;
    _dtpPedido_07: TDateTimePicker;
    _dtpPedido_08: TDateTimePicker;
    _edtCdDestino: TEdit;
    Label10: TLabel;
    _chkObservacaoPedidoSC: TCheckBox;
    _edtObservacaoPedidoSC: TEdit;
    _chkImprimirSC: TCheckBox;
    _chkGeraExcelSC: TCheckBox;
    _chkBonificaPedidoSC: TCheckBox;
    _edtNrVerba: TEdit;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _edtqtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _cdsPercentualPedidoPC_PEDIDOValidate(Sender: TField);
    procedure _edtNrPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure _btnSetQuantidadeClick(Sender: TObject);
    procedure _dbgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPedidoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure _chkBonificaPedidoSCClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _dtpPedido_02Exit(Sender: TObject);
    procedure _dtpPedido_01Exit(Sender: TObject);
    procedure _dtpPedido_03Exit(Sender: TObject);
    procedure _dtpPedido_04Exit(Sender: TObject);
    procedure _dtpPedido_05Exit(Sender: TObject);
    procedure _dtpPedido_06Exit(Sender: TObject);
    procedure _dtpPedido_07Exit(Sender: TObject);
    procedure _dtpPedido_08Exit(Sender: TObject);
    procedure _edtqtPedidoExit(Sender: TObject);
    procedure _edtNrVerbaExit(Sender: TObject);

  private
    nrCompradorPedido :Integer;
    function CriaTabelaPedido: TClientDataSet;
    procedure CarregaQuantidadePedido(nrPedido: Integer);
    procedure CarregaPercentualPedido(nrPosicao,qtPedido:Integer;pcPedido:Double);
    procedure filtraNrPedido(idFiltro,idfiltro2:String);
    procedure DesmarcaSelecao;
    procedure PosicionaRegistro(nrRegistro:Integer);
    function somarSelecao(idFiltro, idFiltro1: String): Double;
    procedure AbrePedidoOriginal(nrPedido: Integer);
    procedure setGriPedido;
    procedure SetQuantidadePedido(nrdePedido: Integer);
    procedure SetEscondeQuantidadePedido;
    procedure MontaPedidoNovos(nrPedido:Integer);
    procedure CarregaArrayPcPedido;
    procedure ZeraPcArray;
    procedure ZeraQtPedidoMult(nrPedido:Integer);
    procedure CarregaPercentualPedidoII(nrPosicao, qtPedido: Integer;
      pcPedido: Double);
    procedure CarregaArrayPercentual(nrRegistro: Integer);
    procedure setPercentualPedido;
    procedure mouseToCell(X, Y: integer; var ACol, ARow: Integer);
    procedure EscondeCondicaoPagamento(qtPedido: Integer);
    procedure MostraCondicaoPagamento(qtPedido: Integer);
    function carregaCondicaoPagamento(tabela: TClientdataSet;nrDias:Integer): BooLean;
    function SetDataPedido(DtPedido: TDateTimePicker; dataPedido: Tdate): boolean;
    function OcultaDataPedido(DtPedido: TDateTimePicker): boolean;
    function MostraDataPedido(DtPedido: TDateTimePicker): boolean;
    function geraPedido(qtPedido: integer): Boolean;
    function PrazoPagamento(tabela: TClientDataSet): string;
    function TabelaTemporaria(tabela: TClientDataSet): TClientDataSet;
    function CriaTabelaPrazo(nmTabela: String): TClientDataSet;
    function RetornacdPrazoPedido(nrIndicePedido: Integer): TDadosNovoPedido;
    function GetDataPedido(nrIndicePedido: Integer): TDate;
    procedure ExecutaDivisao;
    procedure GetPercetualPedido;
    procedure AtualizaPedidooriginal(PnrPedido: Integer);

    { Private declarations }
  public
    { Public declarations }
    pcPedidoAr:Array[1..8] of Double;
    qtPorPedido:Array[1..8] of Integer;
    qtPorPedidoMult:Array[1..8, 1..1000] of Integer;
    MeuHint: TMinhaJanelaHint;
    DadosFornecedor :TDadosFornecedor;
//    DadosPedido     :TDadosCapaPedido;
    DadosPedidoAbertuta: TDadosValoresPedido;
    PrecoLista: TListaPreco;
    DadosCD :TDadosCD;
    NrVerbaDividi :Integer;
    dsObervacaoDividi:String;


  end;

var
  _frmDivisaoDePedido: T_frmDivisaoDePedido;
  nrPedidoDividir,nrPedidoSCDividir,
  nrPedidoRSDividir :Integer;
  idFechouPedidoSC,idFechouPedidoRS:Boolean;
  dtProximoPedidoDividir,dtAgendaDivividir:Tdate;
  idAtualizaAgendaDividir :Boolean;


implementation

{$R *.dfm}

procedure T_frmDivisaoDePedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 nrPedidoDividir:=0;
 Action:=cafree;
end;

procedure T_frmDivisaoDePedido.FormCreate(Sender: TObject);
begin
 MeuHint := TMinhaJanelaHint.Create(Self);
 idFechouPedidoSC:=False;
 idFechouPedidoRS:=false;

end;

procedure T_frmDivisaoDePedido.FormShow(Sender: TObject);
begin
   _edtNrPedido.Text:=IntToStr(nrPedidoDividir);
   if nrPedidoDividir>0 then
   begin
     _edtqtPedido.Text:='1';
     GetPercetualPedido;
     ExecutaDivisao;
   end;
   EscondeCondicaoPagamento(8);
end;

procedure T_frmDivisaoDePedido._btnSetQuantidadeClick(Sender: TObject);
var
 qtPedidos:Integer;
 nrPedidoDigitado :Integer;
begin




  qtPedidos:=StrToIntDef(_edtqtPedido.Text,0);
  NrVerbaDividi:=StrToIntDef(_edtNrVerba.Text,0);

  NrVerbaDividi:=  GetNumeroVerba(NrVerbaDividi, DadosFornecedor.nrFornecedor);
 if (NrVerbaDividi=0) then
  begin
   Mensagem('Essa verba n?o pertence a esse fornecedor !!!', MB_ICONWARNING);
       _edtNrVerba.Clear;
       _edtNrVerba.SetFocus;
       NrVerbaDividi:=0;
       exit;
  end;


  dsObervacaoDividi:=trim(_edtObservacaoPedidoSC.Text);

  _dbgPedido.Enabled:=false;

  if (NrVerbaDividi=0) and (_chkBonificaPedidoSC.Checked) then
  begin
    Mensagem('? necessario um numero de verba para bonificar pedido',64);
    _edtNrVerba.SetFocus;
    exit;
  end;

 try
  try
   geraPedido(qtPedidos);
  except
    Mensagem('Erro Ao gerar novos Pedido!!!',64);
    exit;
  end;
 finally
    nrPedidoDigitado:=StrToIntDef(_edtNrPedido.Text,0);
    DadosPedidoAbertuta:= GetValoresPedido(nrPedidoDigitado, false);



    if NrVerbaDividi=0 then
       NrVerbaDividi:=DadosPedidoAbertuta.nrGeracaoVerba;


    //AtualizaPedidooriginal(nrPedidoDigitado);


    AtualizaCapaPedido(nrPedidoDigitado,DadosPedidoAbertuta.nrCondicaoPagamento, 1,
                       DadosFornecedor.nrDiasLeadTime,'I', 'Inativado gera Pedidos a partir dele',False,
                       dtPedido,dtPedido,dtPedido,0,DadosPedidoAbertuta.nrGeracaoVerba,_chkBonificaPedidoSC.Checked,DadosPedidoAbertuta.nrListaPrecoExcecao);
    AtualizaStatusItemPedido(nrPedidoDigitado, 0,1, 'I');
    mensagem('Pedido original foi Inativado'+#13+
             'Pedido Inativado '+formatfloat('000000',nrPedidoDigitado),64);

 end;

  _dbgPedido.Enabled:=true;
  Mensagem('Pedidos Gerados',64);
  close;

end;

procedure T_frmDivisaoDePedido._cdsPercentualPedidoPC_PEDIDOValidate(
  Sender: TField);
var
  vlPercentual :Double;
begin
 {   _cdsPercentualPedido.open;
    _cdsPercentualPedido.Edit;
     vlPercentual:=somarSelecao('S','');
     if vlPercentual+ _cdsPercentualPedidoPC_PEDIDO.AsFloat>100  then
     begin
        Mensagem('Percentual muito alto para este pedido!!!');
        _cdsPercentualPedido.CancelUpdates;
     end;  }
end;

procedure T_frmDivisaoDePedido._chkBonificaPedidoSCClick(Sender: TObject);
begin
  if _chkBonificaPedidoSC.Checked then
  begin
    _chkObservacaoPedidoSC.Checked:=true;
    _edtObservacaoPedidoSC.Text:='PEDIDO BONIFICADO ';
    _chkObservacaoPedidoSC.Enabled:=false;
  end;

end;

procedure T_frmDivisaoDePedido._dbgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var I : integer;
begin
   with _dbgPedido do
   begin

// mude a cor das Linha
   If odd(_cdsPedidoNovo.RecNo) then
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


      if _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger<
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger)
       then
       begin
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Color := clYellow;
      end;
      if _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger>
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger)
       then
       begin
        Canvas.Font.Color := clWhite;
        Canvas.Brush.Color := clRed;
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
         Canvas.brush.Color:= clBlue;
         Canvas.Font.Color:= clwhite;
      end;

      DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;
end;


procedure T_frmDivisaoDePedido._dbgPedidoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   MColumn, MRow: Longint;
begin
  if _dbgPedido.DataSource.DataSet.State<>dsEdit then
  begin
   // A partir da posi??o do mouse obtemos a coordenada da c?lula do grid
   MouseToCell(X,Y,MColumn,MRow);
   // Se for uma c?lula v?lida ...
   if (MRow > 0) and (MColumn >0) and (Mcolumn <= _dbgPedido.Columns.Count) then
   begin
      // Fazemos a coluna do Grid ser a coluna apontada pelo mouse, para isso usamos a classe amiga
      // definida no come?o da unit
      TCellGrid(_dbgPedido).Col := MColumn;

      // Movemos o DataSet para a linha apontada pelo mouse deslocando em rela??o ? sua posi??o
      // anterior
      _dbgPedido.DataSource.DataSet.MoveBy(MRow - TCellGrid(_dbgPedido).Row);

      // Se o dado apontado n?o for do tipo String nem Variant n?o apresentamos o Hint
     { if (_dbgPedido.Columns[MColumn-1].Field.DataType <> ftString) and
         (_dbgPedido.Columns[MColumn-1].Field.DataType <> ftVariant) then
      begin
         _dbgPedido.Hint := '';
         MeuHint.ReleaseHandle;
         Exit;
      end;}
      if not _cdsPedidoNovo.IsEmpty then
      begin

         if _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger=
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger) then
         begin
         _dbgPedido.Hint := '';
          MeuHint.ReleaseHandle;
        end;


       if _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger>
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger) then
       BEGIN
         _dbgPedido.Hint := 'Quantidade Menor que pedido Original --> '+FormatFloat('###,###,##0',
         _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger-
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger));

          MeuHint.doActivateHint(_dbgPedido);


       END;
       if _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger<
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger) then
       BEGIN
         _dbgPedido.Hint := 'Quantidade Maior que pedido Original --> '+FormatFloat('###,###,##0',
         (_cdsPedidoNovo.FieldByName('QT_PEDIDO_01').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_02').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_03').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_04').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_05').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_06').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_07').AsInteger+
         _cdsPedidoNovo.FieldByName('QT_PEDIDO_08').AsInteger)-
         _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger);

          MeuHint.doActivateHint(_dbgPedido);
        END;
      end;
   end
   else
   begin
      // Se n?o for c?lula v?lida limpo o Hint
      DBGrid1.Hint := '';
      MeuHint.ReleaseHandle;
    end;
  end;
end;


procedure T_frmDivisaoDePedido._dtpPedido_01Exit(Sender: TObject);
begin
  if _dtpPedido_01.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_01.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._dtpPedido_02Exit(Sender: TObject);
begin
  if _dtpPedido_02.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_02.SetFocus
  end;
end;

procedure T_frmDivisaoDePedido._dtpPedido_03Exit(Sender: TObject);
begin
   if _dtpPedido_03.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_03.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._dtpPedido_04Exit(Sender: TObject);
begin
    if _dtpPedido_04.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_04.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._dtpPedido_05Exit(Sender: TObject);
begin
  if _dtpPedido_05.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_05.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._dtpPedido_06Exit(Sender: TObject);
begin
  if _dtpPedido_06.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_06.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._dtpPedido_07Exit(Sender: TObject);
begin
   if _dtpPedido_07.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_07.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._dtpPedido_08Exit(Sender: TObject);
begin
  if _dtpPedido_08.Date<dtSistema then
  begin
    Mensagem('Data Menor Data Pedido',16);
    _dtpPedido_08.SetFocus
  end;

end;

procedure T_frmDivisaoDePedido._edtNrPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
   VK_RETURN : begin
                 ExecutaDivisao;

               end;
  end;
end;

procedure T_frmDivisaoDePedido._edtNrVerbaExit(Sender: TObject);
var
 nrVerba:Integer;
begin
  nrVerba:=StrToIntDef(_edtNrVerba.Text,0);
  nrVerba:=  GetNumeroVerba(nrVerba, 0);
 if (nrVerba=0) then
  begin
   Mensagem('Essa verba n?o pertence a esse fornecedor !!!', MB_ICONWARNING);
       _edtNrVerba.Clear;
       _edtNrVerba.SetFocus;
       nrVerba:=0;
  end;
  NrVerbaDividi:=nrVerba;

end;

procedure T_frmDivisaoDePedido._edtqtPedidoExit(Sender: TObject);
begin
  if _cdsPercentualPedido.IsEmpty then
     GetPercetualPedido;

end;

procedure T_frmDivisaoDePedido._edtqtPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  qtPedidos:Integer;
begin
  case key of
   VK_RETURN:begin
               GetPercetualPedido;
             end;
  end;
  end;

function T_frmDivisaoDePedido.CriaTabelaPedido:TClientDataSet;
var
    cdsTemp : TClientDataSet;
    dsTemp  : TDataSource;
    nmCampo :String;
begin
  cdsTemp := TClientDataSet.Create(nil);
  cdsTemp.Close;
  cdsTemp.FieldDefs.Clear;
  cdsTemp.FieldDefs.add('CODIGO',ftInteger);
  cdsTemp.FieldDefs.add('NOME',ftString,20);
  cdsTemp.FieldDefs.add('APRESENTACAO',ftString,20);
  cdsTemp.FieldDefs.add('QT_EMBALAGEM',ftInteger);
  cdsTemp.FieldDefs.add('QT_PEDIDO',ftInteger);
  cdsTemp.FieldDefs.add('VL_PRECO',ftFloat);
  cdsTemp.FieldDefs.add('PC_DESCONTO_PADRAO',ftFloat);
  cdsTemp.FieldDefs.add('PC_DESCONTO_ADICIONAL',ftFloat);
  _cdsPercentualPedido.First;
  while not _cdsPercentualPedido.Eof do
  begin
     nmCampo:='PEDIDO_'+FormatFloat('00',_cdsPercentualPedidoNR_PEDIDO.AsInteger);
     cdsTemp.FieldDefs.add(nmCampo,ftInteger);
    _cdsPercentualPedido.Next;
  end;
  cdsTemp.CreateDataSet;
  Result:=cdsTemp;
  FreeAndNil(cdsTemp);
end;

procedure T_frmDivisaoDePedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  nrPosicao,
  qtPedidos:integer;
begin
 case key of
   VK_RETURN: begin
//               DesmarcaSelecao;
               nrPosicao:=_cdsPercentualPedidoNR_PEDIDO.AsInteger;
              _cdsPercentualPedido.Open;
              _cdsPercentualPedido.Edit;
              _cdsPercentualPedidoID_SELECIONADO.AsString:='X';
               CarregaArrayPercentual(_cdsPercentualPedido.RecordCount);
              PosicionaRegistro(nrPosicao);
              CarregaPercentualPedidoII(nrPosicao,_cdsPercentualPedido.RecordCount,_cdsPercentualPedidoPC_PEDIDO.AsFloat);
              setPercentualPedido;
              if not  _cdsPedidoNovo.IsEmpty then
               begin
                 qtPedidos:=StrToIntDef(_edtqtPedido.Text,0);
                 ZeraQtPedidoMult(qtPedidos);
                 MontaPedidoNovos(qtPedidos);
                end;

              //DesmarcaSelecao;
              end;
 end;

end;

procedure T_frmDivisaoDePedido.CarregaQuantidadePedido(nrPedido:Integer);
var
  I: Integer;
  pcTemp,somaPc :Double;


begin
 _cdsPercentualPedido.close;
 _cdsPercentualPedido.CreateDataSet;
  pcTemp:=100/nrPedido;
  somaPc:=0;
  for I := 1 to nrPedido do
  begin
    _cdsPercentualPedido.Open;
    _cdsPercentualPedido.Append;
    _cdsPercentualPedidoNR_PEDIDO.AsInteger:=I;
    _cdsPercentualPedidoPC_PEDIDO.AsFloat:=TruncaValor(pcTemp,0);
    somaPc:=somaPc+TruncaValor(pcTemp,0);
    if i<nrPedido then
       pcTemp:=(100-somaPc)/(nrPedido-i);
    _cdsPercentualPedido.Post;
  end;
  _cdsPercentualPedido.Open;
end;

procedure T_frmDivisaoDePedido.CarregaPercentualPedido(nrPosicao,qtPedido:Integer;pcPedido:Double);
var
  I,
  nrPedidoRestante: Integer;
  vlPercentual,
  vlResultado,vlPercentualRestante:Double;
begin
  vlPercentual:=0;
  _cdsPercentualPedido.Open;
   nrPedidoRestante:=_cdsPercentualPedido.RecordCount;

  if (qtPedido>0) and (pcPedido>0) then
  begin

     filtraNrPedido('S','X');
    _cdsPercentualPedido.First;
     nrPedidoRestante:=0;
     while Not _cdsPercentualPedido.Eof do
     begin
       inc(nrPedidoRestante);
        vlPercentual:=vlPercentual + _cdsPercentualPedidoPC_PEDIDO.AsFloat;
       _cdsPercentualPedido.Next;
     end;
     filtraNrPedido('N','');
     nrPedidoRestante:=_cdsPercentualPedido.RecordCount;

     if qtPedido>0 then
       vlResultado:= TruncaValor((100 - vlPercentual)/(nrPedidoRestante),0);
     vlPercentualRestante:= vlResultado+vlPercentual;
     filtraNrPedido('N','');
    _cdsPercentualPedido.First;
     nrPedidoRestante:=0;
     while Not _cdsPercentualPedido.Eof do
     begin
       _cdsPercentualPedido.edit;
       inc(nrPedidoRestante);
       _cdsPercentualPedidoPC_PEDIDO.AsFloat:=vlResultado;
       vlResultado:= 100 - vlPercentualRestante;
        vlPercentualRestante:=vlPercentualRestante+ vlResultado;
       _cdsPercentualPedidoID_SELECIONADO.AsString:='N';
       _cdsPercentualPedido.Next;
     end;
    _cdsPercentualPedido.filtered:=false;

     end;
end;
procedure T_frmDivisaoDePedido.CarregaPercentualPedidoII(nrPosicao,qtPedido:Integer;pcPedido:Double);
var
 pcTemp:Double;
  I: Integer;
begin
  pcTemp:= 100/qtPedido;
  for I := nrPosicao to qtPedido do
  begin
     if I=1 then
     begin
        if pcPedido=0 then
           pcPedidoAr[i]:=TruncaValor(pcTemp,0)
        else
           pcPedidoAr[i]:=pcPedido;
         pcPedido:=0;

     end;
     if I=2 then
     begin
        if pcPedido=0 then
           pcPedidoAr[i]:= TruncaValor((100-pcPedidoAr[1])/(qtPedido - (i-1)),0)
       else
           pcPedidoAr[i]:=pcPedido;
       pcPedido:=0;
     end;
     if I=3 then
     begin
        if pcPedido=0 then
           pcPedidoAr[i]:= TruncaValor((100-(pcPedidoAr[1]+pcPedidoAr[2]))/(qtPedido - (i-1)),0)
       else
           pcPedidoAr[i]:=pcPedido;
        pcPedido:=0;
     end;
     if I=4 then
     begin
        if pcPedido=0 then
           pcPedidoAr[i]:= TruncaValor((100-(pcPedidoAr[1]+pcPedidoAr[2]+pcPedidoAr[3]))/(qtPedido - (i-1)),0)
       else
           pcPedidoAr[i]:=pcPedido;
         pcPedido:=0;
     end;
     if I=5 then
     begin
        if pcPedido=0 then
           pcPedidoAr[i]:= TruncaValor((100-(pcPedidoAr[1]+pcPedidoAr[2]+pcPedidoAr[3])+pcPedidoAr[4])/(qtPedido - (i-1)),0)
       else
           pcPedidoAr[i]:=pcPedido;
         pcPedido:=0;
     end;
  end;
end;


procedure T_frmDivisaoDePedido.filtraNrPedido(idFiltro,idfiltro2:String);
var
 filtro:String;
begin
   filtro:='ID_SELECIONADO ='+QuotedStr(idFiltro);
   if trim(idfiltro2)<>'' then
      filtro:=filtro+' OR ID_SELECIONADO ='+QuotedStr(idFiltro2);
   _cdsPercentualPedido.Filtered:=false;
   with _cdsPercentualPedido do
   begin
     filter:=filtro;
     Filtered:=true;
   end;
end;
procedure T_frmDivisaoDePedido.DesmarcaSelecao;
begin
   _cdsPercentualPedido.Filtered:=false;
   while Not _cdsPercentualPedido.Eof do
   begin
       _cdsPercentualPedido.edit;
       _cdsPercentualPedidoID_SELECIONADO.AsString:='N';
      _cdsPercentualPedido.Next;
    end;
end;

procedure T_frmDivisaoDePedido.PosicionaRegistro(nrRegistro:Integer);
begin
    _cdsPercentualPedido.IndexFieldNames:=('NR_PEDIDO');
    _cdsPercentualPedido.SetKey;
    _cdsPercentualPedido.FieldByName('NR_PEDIDO').AsInteger:=nrRegistro;
    _cdsPercentualPedido.GotoKey;
end;

procedure T_frmDivisaoDePedido.CarregaArrayPercentual(nrRegistro:Integer);
begin
    _cdsPercentualPedido.First;
    ZeraPcArray;
    while not _cdsPercentualPedido.Eof do
    begin
       pcPedidoAr[_cdsPercentualPedidoNR_PEDIDO.AsInteger]:=_cdsPercentualPedidoPC_PEDIDO.AsFloat;
      _cdsPercentualPedido.Next;
    end;
end;


function T_frmDivisaoDePedido.somarSelecao(idFiltro,idFiltro1:String):Double;
begin
   filtraNrPedido(idFiltro,idFiltro1);
  _cdsPercentualPedido.first;
  result:=0;
   while Not _cdsPercentualPedido.Eof do
   begin
       Result:=result +_cdsPercentualPedidoPC_PEDIDO.AsFloat;
      _cdsPercentualPedido.Next;
    end;
end;


procedure T_frmDivisaoDePedido.AbrePedidoOriginal(nrPedido:Integer);
var
  stQry :TStringList;
begin
    stQry:=TStringList.Create;
    with stQry do
    begin
      add('SELECT');
      add('CD_MERCADORIA*10+NR_DV_MERCADORIA as CODIGO,NM_MERCADORIA,');
      add('DS_APRESENTACAO_MERCADORIA,QT_EMBALAGEM_COMPRA,QUAY_Y,ABTY_Y,DADY_Y,');
      add('NRVV_Y,PC_VERBA,');
      add('0 AS QT_PEDIDO_01,');
      add('0 AS QT_PEDIDO_02,');
      add('0 AS QT_PEDIDO_03,');
      add('0 AS QT_PEDIDO_04,');
      add('0 AS QT_PEDIDO_05,');
      add('0 AS QT_PEDIDO_06,');
      add('0 AS QT_PEDIDO_07,');
      add('0 AS QT_PEDIDO_08,');
      add('NROP_P, DATP_P,NROM_Y,SITP_P,SITY_Y,PUNY_Y, PFBY_Y,LABP_P,VCCI_Y,VL_VERBA,');
      add('NR_OPERADOR_LOGISTICO, NR_DIAS_ESTOQUE,QT_SUGERIDA,CAPA.CD_EMPRESA,CD_COMPRADOR,');
      Add('VL_MEDIA_VENDA,CD_LISTA_COMPRA,PC_MUDANCA_PRECO,NR_DV_MERCADORIA,CD_PEDIDO_RELACIONADO');
      add('FROM');
      add('PRDDM.DCPCC CAPA,');
      add('PRDDM.DCPCI ITEM,');
      add('PRDDM.DC_MERCADORIA');
      add('WHERE');
      add('NROP_P=NROP_Y');
      add('AND NROM_Y=CD_MERCADORIA');
      add('AND CHEY_Y=0');
      add('AND SITP_P=SITY_Y');
      add('AND NROP_P=:PnrPedido');
      add('AND SITP_P IN(''N'',''S'')');
    end;

   with _cdsPedidoNovo do
   begin
     close;
     CommandText:=stQry.Text;
     Params.ParamByName('PnrPedido').AsInteger:=nrPedido;
     open;
     setGriPedido;
   end;


end;

procedure T_frmDivisaoDePedido.setGriPedido;
begin
    TIntegerField(_cdsPedidoNovo.FieldByName('CODIGO')).ReadOnly:=TRUE;
  TIntegerField(_cdsPedidoNovo.FieldByName('CODIGO')).DisplayLabel:='Codigo';
  TIntegerField(_cdsPedidoNovo.FieldByName('CODIGO')).DisplayWidth:=8;
  TStringField(_cdsPedidoNovo.FieldByName('NM_MERCADORIA')).ReadOnly:=TRUE;
  TStringField(_cdsPedidoNovo.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsPedidoNovo.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsPedidoNovo.FieldByName('DS_APRESENTACAO_MERCADORIA')).ReadOnly:=TRUE;
  TStringField(_cdsPedidoNovo.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsPedidoNovo.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=20;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_EMBALAGEM_COMPRA')).ReadOnly:=TRUE;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayLabel:='Emb.Cpra';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayWidth:=10;

  TIntegerField(_cdsPedidoNovo.FieldByName('QUAY_Y')).ReadOnly:=TRUE;
  TIntegerField(_cdsPedidoNovo.FieldByName('QUAY_Y')).DisplayLabel:='Qtd.Ped';
  TIntegerField(_cdsPedidoNovo.FieldByName('QUAY_Y')).DisplayWidth:=07;

  TFloatField(_cdsPedidoNovo.FieldByName('ABTY_Y')).ReadOnly:=TRUE;
  TFloatField(_cdsPedidoNovo.FieldByName('ABTY_Y')).DisplayLabel:='% Padr?o';
  TFloatField(_cdsPedidoNovo.FieldByName('ABTY_Y')).DisplayWidth:=06;
  TFloatField(_cdsPedidoNovo.FieldByName('ABTY_Y')).DisplayFormat:='##0.00';

  TFloatField(_cdsPedidoNovo.FieldByName('DADY_Y')).DisplayLabel:='% Desc.Adic.';
  TFloatField(_cdsPedidoNovo.FieldByName('DADY_Y')).DisplayWidth:=06;
  TFloatField(_cdsPedidoNovo.FieldByName('DADY_Y')).DisplayFormat:='##0.00';

  TFloatField(_cdsPedidoNovo.FieldByName('PC_VERBA')).DisplayLabel:='% Verba';
  TFloatField(_cdsPedidoNovo.FieldByName('PC_VERBA')).DisplayWidth:=06;
  TFloatField(_cdsPedidoNovo.FieldByName('PC_VERBA')).DisplayFormat:='##0.00';


  TIntegerField(_cdsPedidoNovo.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
  TIntegerField(_cdsPedidoNovo.FieldByName('NRVV_Y')).DisplayWidth:=08;
//  TIntegerField(_cdsPedidoNovo.FieldByName('NRVV_Y')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_01')).DisplayLabel:='1?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_01')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_01')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_02')).DisplayLabel:='2?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_02')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_02')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_03')).DisplayLabel:='3?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_03')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_03')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_04')).DisplayLabel:='4?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_04')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_04')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_05')).DisplayLabel:='5?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_05')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_05')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_06')).DisplayLabel:='6?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_06')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_06')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_07')).DisplayLabel:='7?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_07')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_07')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_08')).DisplayLabel:='8?Ped.';
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_08')).DisplayWidth:=07;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_PEDIDO_08')).Visible:=false;

  TIntegerField(_cdsPedidoNovo.FieldByName('NROP_P')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('DATP_P')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('NROM_Y')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('SITP_P')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('SITY_Y')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('PFBY_Y')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('LABP_P')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('NR_OPERADOR_LOGISTICO')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('NR_DIAS_ESTOQUE')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('QT_SUGERIDA')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('CD_EMPRESA')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('NR_DV_MERCADORIA')).Visible:=false;
  TFloatField(_cdsPedidoNovo.FieldByName('VL_MEDIA_VENDA')).Visible:=false;
  TIntegerField(_cdsPedidoNovo.FieldByName('CD_LISTA_COMPRA')).Visible:=false;
  TFloatField(_cdsPedidoNovo.FieldByName('PC_MUDANCA_PRECO')).Visible:=false;
end;

procedure T_frmDivisaoDePedido.SetQuantidadePedido(nrdePedido:Integer);
var
  I: Integer;
  nmCampo:String;

begin
 SetEscondeQuantidadePedido;
  for I := 1 to nrdePedido do
  begin
    if not _cdsPedidoNovo.isEmpty then
    begin
      nmCampo:='QT_PEDIDO_'+FormatFloat('00',i);
      if  _cdsPercentualPedido.Active then
          _cdsPedidoNovo.FieldByName(nmCampo).Visible:=true;
    end;
  end;

end;


procedure T_frmDivisaoDePedido.SetEscondeQuantidadePedido;
var
  I: Integer;
  nmCampo:String;

begin
  for I := 1 to 8 do
  begin
    if not _cdsPedidoNovo.isEmpty then
    begin
      nmCampo:='QT_PEDIDO_'+FormatFloat('00',i);
      if  _cdsPercentualPedido.Active then
          _cdsPedidoNovo.FieldByName(nmCampo).Visible:=false;
    end;
  end;
end;

procedure T_frmDivisaoDePedido.ZeraPcArray;
var
  I: Integer;
begin
   for I := 1 to 8 do
   begin
     pcpedidoAr[i]:=0;
     qtPorPedido[i]:=0;
   end;
end;

procedure T_frmDivisaoDePedido.ZeraQtPedidoMult(nrPedido:Integer);
var
  Pedido,QTPedido: Integer;
begin
   for Pedido := 1 to nrPedido do
   begin
     for QTPedido := 1 to 1000 do
         qtPorPedidoMult[Pedido,QTPedido]:=0;
   end;
end;


procedure T_frmDivisaoDePedido.BitBtn1Click(Sender: TObject);
VAR
 DadosValoresPedido:TDadosValoresPedido;
 nrPedidoNovo,
 nrPedidoAnterior:Integer;
begin

{   if GetIdSeparaPsicotropico(177233) then
   begin

   DadosValoresPedido:=GetValoresPedidoItensPsicotropico(177233);

   if DadosValoresPedido.nrItensPedido>0 then
   begin
    nrPedidoAnterior:=DadosValoresPedido.nrPedido;
    nrPedidoNovo:=GeraNumeroPedido('C');
    if nrPedidoNovo>0 then
    begin
         if   GravaCapaPedido(nrPedidoNovo, // NROP_P,//  NUMBER(6)
                       DadosValoresPedido.nrFornecedor, // LABP_P :Integer;// NUMBER(6)
                       DadosValoresPedido.dtPedido, // DATP_P :Tdate;// DATE
                       DadosValoresPedido.pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                       0, // DESP_P:Double;// NUMBER(5,2)
                       'S', // SITP_P :String;//CHAR(1)
                       DadosValoresPedido.nrCondicaoPagamento, // PRZP_P :Integer;//NUMBER(3)
                       DadosValoresPedido.dtPrevistaChegada, // PREP_P          //DATE
                       ' ', // CHAR(40)
                       '0', // SNRP_P           //  CHAR(10)
                       0, // FLAP_P ,         //NUMBER(1)
                       DadosValoresPedido.nrCondicaoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                       nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                       dtPedido, // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                       DadosValoresPedido.dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                       'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                       DadosValoresPedido.nrOperadorLogistico,
                       // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                       NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                       DadosPedido.dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                       dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                       0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                       0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                       0,
                       nrCompradorSistema,
                       DadosValoresPedido.cdEmpresa,
                       nrPedidoAnterior) then
                       begin
                        SetItensPedidoRelacionado(nrPedidoAnterior,nrPedidoNovo);
                        SetNumeroPedidoRelacionado(nrPedidoAnterior,nrPedidoNovo);
                        AtualizaCapaPedido(nrPedidoNovo, DadosValoresPedido.nrCondicaoPagamento, 1, 'N','Pedido de Psicotr?picos', dtPedido);
                       end;


      end;
    end;


   end;}

end;

procedure T_frmDivisaoDePedido.CarregaArrayPcPedido;
var
  I: Integer;
begin
   ZeraPcArray;
   _cdsPercentualPedido.First;
   i:=0;
   while not _cdsPercentualPedido.Eof do
   begin
      Inc(i);
      pcPedidoAr[i]:=_cdsPercentualPedidoPC_PEDIDO.AsFloat;
     _cdsPercentualPedido.Next;
   end;
end;


procedure T_frmDivisaoDePedido.MontaPedidoNovos(nrPedido:Integer);
var
  I: Integer;
  nmCampo:String;
  qtPedido,NrItem,
  qtEmbalagem :Integer;
  qtPedidoCalculada,
  qtFracao,qtInteira:Double;

begin
 CarregaArrayPcPedido;
 for I := 1 to nrPedido do
 begin
   NrItem:=0;
   nmCampo:='QT_PEDIDO_'+FormatFloat('00',i);
  _cdsPedidoNovo.First;
  while not _cdsPedidoNovo.Eof do
  begin
       inc(NrItem);
      _cdsPedidoNovo.edit;
      qtInteira:=0;
      qtFracao:=0;
      qtPedido:= _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger ;
      qtEmbalagem:=_cdsPedidoNovo.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
      qtInteira:= qtPedido div qtEmbalagem;
      qtInteira := qtPedido;
      qtFracao := qtPedido mod qtEmbalagem;;
      qtInteira:= qtPedido / qtEmbalagem;
      if qtPedido=0 then
         qtPedido:= strtoIntDef(formatFloat('000000000',qtInteira),0);

      if i=1 then
      begin
        if qtInteira<=1 then
           qtPedidoCalculada:=qtPedido
        else
        begin
          qtPedidoCalculada:=(strtoIntDef(formatFloat('000000000',qtInteira*(pcPedidoAr[1]/100)),0));
          qtPedidoCalculada:=(qtPedidoCalculada * qtEmbalagem);
        end;
      end;
      if i=2 then
      begin
        if qtInteira<=1 then
           qtPedidoCalculada:=qtPedido-(qtPorPedidoMult[1,NrItem])
        else
        begin
         qtPedidoCalculada:= strtointdef(formatFloat('000000000',(qtInteira* ((pcPedidoAr[1]+pcPedidoAr[2])/100))),0);
         qtPedidoCalculada:=qtPedidoCalculada * qtEmbalagem;
         qtPedidoCalculada:= qtPedidoCalculada -(qtPorPedidoMult[1,NrItem]);
        end;
      end;
      if i=3 then
      begin
        if qtInteira<=1 then
           qtPedidoCalculada:=qtPedido -((qtPorPedidoMult[1,NrItem]+qtPorPedidoMult[2,NrItem]))
        else
        begin
           qtPedidoCalculada:=strtointdef(formatFloat('000000000',(qtInteira * ((pcPedidoAr[1]+pcPedidoAr[2]+pcPedidoAr[3]))/100)),0);
           qtPedidoCalculada:=qtPedidoCalculada * qtEmbalagem;
           qtPedidoCalculada:= qtPedidoCalculada -((qtPorPedidoMult[1,NrItem]+qtPorPedidoMult[2,NrItem]));
        end;
      end;
      if i=4 then
      begin
        if qtInteira<=1 then
           qtPedidoCalculada:=qtPedido-((qtPorPedidoMult[1,NrItem]+qtPorPedidoMult[2,NrItem]+qtPorPedidoMult[3,NrItem]))
        else
        begin
           qtPedidoCalculada:= strtoIntDef(formatFloat('000000000',(qtInteira * (pcPedidoAr[1]+pcPedidoAr[2]+pcPedidoAr[3]+pcPedidoAr[4])/100)),0);
           qtPedidoCalculada:=qtPedidoCalculada * qtEmbalagem;
           qtPedidoCalculada:= qtPedidoCalculada -((qtPorPedidoMult[1,NrItem]+qtPorPedidoMult[2,NrItem]+qtPorPedidoMult[3,NrItem]));
        end;
      end;
     //---Set Qtade Pedido
      if qtPedidoCalculada<0 then
         qtPedidoCalculada:=0;
       qtPorPedidoMult[i,NrItem]:= strtoIntDef(formatFloat('000000000',qtPedidoCalculada),0);
     _cdsPedidoNovo.FieldByName(nmCampo).AsInteger:=qtPorPedidoMult[i,NrItem];
    _cdsPedidoNovo.Next;
  end;
 end;

end;

procedure T_frmDivisaoDePedido.setPercentualPedido;
var
  i: Integer;
begin
  for i := 1 to 8 do
  begin
   if PcPedidoAr[i]>0 then
   begin
     PosicionaRegistro(i);
     _cdsPercentualPedido.Open;
     _cdsPercentualPedido.Edit;
     _cdsPercentualPedidoPC_PEDIDO.AsFloat:=pcPedidoAr[i];
   end;

  end;
end;


procedure T_frmDivisaoDePedido.mouseToCell(X, Y: integer; var ACol, ARow: Integer);

var
   Coord: TGridCoord;
begin
   Coord := _dbgPedido.MouseCoord(X,Y);
   ACol := Coord.X;
ARow := Coord.Y;
end;


procedure TMinhaJanelaHint.doActivateHint(Sender: TObject);

var
   r : TRect;
   wdth_hint, hght_hint : integer;
begin
   if (Sender is TDbGrid) then
   begin
      // Calculo as dimens?es necess?rias ? janela de Hint sendo o limite igual ? 1/3 da tela
      r := CalcHintRect((Screen.Width div 3), (Sender as TDbGrid).Hint, nil);
      wdth_hint := r.Right - r.Left;
      hght_hint := r.Bottom - r.Top;

      // Reposiciono a janela do Hint para pr?ximo da posi??o do mouse mantendo o tamanho
      // calculado pela rotina anterior
      r.Left := r.Left + mouse.CursorPos.X + 16;
      r.Top := r.Top + mouse.CursorPos.Y + 16;
      r.Right := r.Left + wdth_hint;
      r.Bottom := r.Top + hght_hint;
      // Executo o procedimento para exibi??o do Hint na tela

      ActivateHint(r,(Sender as TDbGrid).Hint);
   end;
end;


Procedure T_frmDivisaoDePedido.EscondeCondicaoPagamento(qtPedido:Integer);
var
  I: Integer;
  ComponeteGroupoBox:TGroupBox;
begin
  for I := 2 to 8 do
  begin
      if I=2 then
      begin
         _grbPrazoPed_02.Visible:=false;
         OcultaDataPedido(_dtpPedido_02);
      end;
      if I=3 then
      begin
         _grbPrazoPed_03.Visible:=false;
         OcultaDataPedido(_dtpPedido_03);
      end;
      if I=4 then
      begin
         _grbPrazoPed_04.Visible:=false;
         OcultaDataPedido(_dtpPedido_04);
      end;
      if I=5 then
      begin
         _grbPrazoPed_05.Visible:=false;
         OcultaDataPedido(_dtpPedido_05);
      end;
      if I=6 then
      begin
         _grbPrazoPed_06.Visible:=false;
         OcultaDataPedido(_dtpPedido_06);
      end;
      if I=7 then
      begin
         _grbPrazoPed_07.Visible:=false;
         OcultaDataPedido(_dtpPedido_07);
      end;
      if I=8 then
      begin
         _grbPrazoPed_08.Visible:=false;
         OcultaDataPedido(_dtpPedido_08);
      end;
  end;
end;

Procedure T_frmDivisaoDePedido.MostraCondicaoPagamento(qtPedido:Integer);
var
  I: Integer;
  ComponeteGroupoBox:TGroupBox;
begin
  carregaCondicaoPagamento(_cdsCondicaoPagamento1,DadosFornecedor.nrPrazoPedido);
  MostraDataPedido(_dtpPedido_01);
  SetDataPedido(_dtpPedido_01,DadosPedidoAbertuta.dtPedido);
  for I := 1 to qtPedido do
  begin
      if I=1 then
      begin
         _grbPrazoPed_01.Visible:=true;
         MostraDataPedido(_dtpPedido_01);
         SetDataPedido(_dtpPedido_01,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento1,DadosFornecedor.nrPrazoPedido);
      end;
      if I=2 then
      begin
         _grbPrazoPed_02.Visible:=true;
         MostraDataPedido(_dtpPedido_02);
         SetDataPedido(_dtpPedido_02,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento2,DadosFornecedor.nrPrazoPedido);
      end;
      if I=3 then
      begin
         _grbPrazoPed_03.Visible:=true;
         MostraDataPedido(_dtpPedido_03);
         SetDataPedido(_dtpPedido_03,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento3,DadosFornecedor.nrPrazoPedido);
      end;
      if I=4 then
      begin
         _grbPrazoPed_04.Visible:=true;
         MostraDataPedido(_dtpPedido_04);
         SetDataPedido(_dtpPedido_04,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento4,DadosFornecedor.nrPrazoPedido);
      end;
      if I=5 then
      begin
         _grbPrazoPed_05.Visible:=true;
         MostraDataPedido(_dtpPedido_05);
         SetDataPedido(_dtpPedido_05,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento5,DadosFornecedor.nrPrazoPedido);
      end;
      if I=6 then
      begin
         _grbPrazoPed_06.Visible:=true;
         MostraDataPedido(_dtpPedido_06);
         SetDataPedido(_dtpPedido_06,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento6,DadosFornecedor.nrPrazoPedido);
      end;
      if I=7 then
      begin
         _grbPrazoPed_07.Visible:=true;
         MostraDataPedido(_dtpPedido_07);
         SetDataPedido(_dtpPedido_07,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento7,DadosFornecedor.nrPrazoPedido);
      end;
      if I=8 then
      begin
         _grbPrazoPed_08.Visible:=true;
         MostraDataPedido(_dtpPedido_08);
         SetDataPedido(_dtpPedido_08,DadosPedidoAbertuta.dtPedido);
         carregaCondicaoPagamento(_cdsCondicaoPagamento8,DadosFornecedor.nrPrazoPedido);
      end;
  end;
end;

function T_frmDivisaoDePedido.carregaCondicaoPagamento(tabela:TClientdataSet;nrDias:Integer):Boolean;
begin
   tabela.close;
   tabela.CreateDataSet;
   tabela.Open;
   tabela.Append;
   tabela.FieldByName('NR_DIAS').AsInteger:=nrDias;
   tabela.Post;
end;


function T_frmDivisaoDePedido.SetDataPedido(DtPedido:TDateTimePicker;dataPedido:Tdate):boolean;
begin
  DtPedido.Date:=dataPedido;
end;

function T_frmDivisaoDePedido.OcultaDataPedido(DtPedido:TDateTimePicker):boolean;
begin
  DtPedido.Visible:=false;
end;
function T_frmDivisaoDePedido.MostraDataPedido(DtPedido:TDateTimePicker):boolean;
begin
  DtPedido.Visible:=true;
end;


function T_frmDivisaoDePedido.geraPedido(qtPedido:integer):Boolean;
var
  i: Integer;
  nrPedidoLocal,
  cdPrazoPagamento,
  nrProduto,
  dgMercadoria,
  nrVerba,
  cdCentroDistribuicao,
  nrItemPedido,
  nrDiasEstoqueAtual,
  nrUnidadesPossivel,
  nrPrazoPedido,
  nrListaPreco  :Integer;
  stPrazo,idUnidadeFederacao :string;
  dadoNovoPedido:TDadosNovoPedido;
  TabelaTemp:TClientDataSet;
  pcDescontoPadrao,
  pcDescontoAdicional,
  pcVerba,pcDescontoRepasse,
  vlPrecoFornecedor,
  vlPrecoUnitario,
  vlPrecoCusto,
  vlVerbaUnitario,
  pcAliquotaIcms,
  pcIpi,vlVerba,
   pcRepasseCompra,
  PcIpiListaPreco,
  vlMediaMes,
  pcIndicePreco,pcIcmsCompra,
  PC_REPASSE,
  vlCustoGerencial,
  vl_base_venda   :Double;
  Mercadoria: TMercadoria;
  idIpiLiquidoComRepasse,
   idIpiLiquidoSemRepasse,
  idIpiBrutoComRepasse,idIpiBrutoSemRepasse,
  idIcmDestacado, idTipoLista,  idForcaRepasse,
  idReduzIcms, idSuperfluo,
  idPisConfins, idProdutoAtivo,idStatus: String[1];
  idPrecoCusto,idMostraDesconto:Char;


begin
  nrPedidoLocal:=StrToIntDef(_edtNrPedido.Text,0);
  idStatus:='N';
  if DadosPedidoAbertuta.cdEmpresaDestino=1 then
     idFechouPedidoSC:=true;
  if DadosPedidoAbertuta.cdEmpresaDestino=4 then
     idFechouPedidoRS:=true;

  for i := 1 to qtPedido do
  begin
   if i>0 then
   begin
      nrPedidoLocal:=GeraNumeroPedido('C');
//     dtPedido:=GetDataPedido(i);
   end;
   dadoNovoPedido := RetornacdPrazoPedido(i);
   if nrPedidoLocal=0 then
   begin
     Mensagem('Nr Pedido Com Problema',16);

     exit;
   end;
     if I>0 then
     begin
       GravaCapaPedido(nrPedidoLocal, // NROP_P,//  NUMBER(6)
                       DadosFornecedor.nrFornecedor, // LABP_P :Integer;// NUMBER(6)
                       dadoNovoPedido.dtPedido, // DATP_P :Tdate;// DATE
                       DadosPedidoAbertuta.pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
                       0, // DESP_P:Double;// NUMBER(5,2)
                       'S', // SITP_P :String;//CHAR(1)
                       dadoNovoPedido.nrDiasPedido, // PRZP_P :Integer;//NUMBER(3)
                       dtPedido + DadosFornecedor.nrDiasLeadTime, // PREP_P          //DATE
                       dsObervacaoDividi, // CHAR(40)
                       '0', // SNRP_P           //  CHAR(10)
                       0, // FLAP_P ,         //NUMBER(1)
                       dadoNovoPedido.cdPrazo, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
                       nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
                       strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
                       dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
                       'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
                       DadosPedidoAbertuta.nrOperadorLogistico,
                       // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
                       NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
                       DadosPedidoAbertuta.dtAgendada, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
                       dtSistema, // DT_DIGITACAO :Tdate;//  DATE
                       0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
                       0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
                       strtodate('01/01/2039'),
                       nrCompradorPedido,
                       DadosPedidoAbertuta.cdEmpresa,
                       0,
                       DadosFornecedor.pcGeracaoVerba,
                       DadosFornecedor.nrGeracaoVerba,0,
                       DadosPedidoAbertuta.cdEmpresaDestino,
                       DadosPedidoAbertuta.idPedidoCrossDocking,0,DadosPedidoAbertuta.nrListaPrecoExcecao);
     end;
    _cdsPedidoNovo.First;
    nrItemPedido:=0;
//    PrazoPedido:=nrParcelaPedido(Dadospedido.nrCondicaoPagamento);
    dadoNovoPedido := RetornacdPrazoPedido(i);
    while not _cdsPedidoNovo.Eof do
    begin
     stPrazo     := _cdsPedidoNovo.Fields.Fields[I+8].DisplayName;
     qtPedido    := _cdsPedidoNovo.Fields.Fields[I+8].AsInteger;
     nrProduto   := _cdsPedidoNovo.FieldByName('NROM_Y').AsInteger;
     dgMercadoria:= _cdsPedidoNovo.FieldByName('NR_DV_MERCADORIA').AsInteger;
     Mercadoria  := GetMercadoriaNova(nrProduto,dgMercadoria,0,DadosPedidoAbertuta.cdEmpresaDestino,1,'');
     if mercadoria=nil then
     begin
       Mensagem('Erro Ao abrir Produto...'+#13+
                'Produto '+_cdsPedidoNovo.FieldByName('CODIGO').asstring+' - '+
                           _cdsPedidoNovo.FieldByName('NM_MERCADORIA').asstring+' - '+
                           _cdsPedidoNovo.FieldByName('DS_APRESENTACAO_MERCADORIA').asstring+#13+
                ' Item N?o foi Incluido no pedido',MB_ICONERROR);
       break;
     end;
     if Mercadoria<>nil then
     begin
     pcDescontoRepasse :=Mercadoria.pcRepasseCompra;
     pcAliquotaIcms    :=Mercadoria.pcCreditoICMS;
     pcIpi             :=Mercadoria.pcIpiProduto;
     vlCustoGerencial  :=Mercadoria.vlCustoGerencial;
     idUnidadeFederacao:=DadosFornecedor.idUnidadeFederacao;

      idForcaRepasse         := DadosFornecedor.idForcaRepasse;
      idIpiLiquidoComRepasse := DadosFornecedor.idIpiLiquidoComRepasse;
      idIpiLiquidoSemRepasse := DadosFornecedor.idIpiLiquidoSemRepasse;
      idIpiBrutoComRepasse   := DadosFornecedor.idIpiBrutoComRepasse;
      idIpiBrutoSemRepasse   := DadosFornecedor.idIpiLiquidoSemRepasse;
      idTipoLista            := Mercadoria.idTipoListaFiscal;
      idSuperfluo            := Mercadoria.idSuperfulo;
      idIcmDestacado         := DadosFornecedor.idIcmDestacado;
      idReduzIcms            := DadosFornecedor.idReduzIcms;
      nrPrazoPedido          := DadosFornecedor.nrPrazoPedido;
      idPisConfins           := Mercadoria.idPisCofins;



     pcDescontoPadrao     :=_cdsPedidoNovo.FieldByName('ABTY_Y').AsFloat;
     pcDescontoAdicional  :=_cdsPedidoNovo.FieldByName('DADY_Y').AsFloat;
     pcVerba              :=_cdsPedidoNovo.FieldByName('PC_VERBA').AsFloat;
     nrVerba              :=_cdsPedidoNovo.FieldByName('NRVV_Y').AsInteger;

     cdCentroDistribuicao :=_cdsPedidoNovo.FieldByName('CD_EMPRESA').AsInteger;
     vlPrecoFornecedor    :=_cdsPedidoNovo.FieldByName('PFBY_Y').AsFloat;
     vlPrecoUnitario      :=_cdsPedidoNovo.FieldByName('PUNY_Y').AsFloat;
     vlPrecoCusto         :=_cdsPedidoNovo.FieldByName('VCCI_Y').AsFloat;
     if (nrVerba>0) and (PcDescontoAdicional>0) and (pcVerba=0) then
        pcVerba:=100;
     if (nrVerba=0) and (PcDescontoAdicional>0) and (pcVerba>=0) then
        pcVerba:=0;


     nrDiasEstoqueAtual  := _cdsPedidoNovo.FieldByName('NR_DIAS_ESTOQUE').AsInteger;
     nrUnidadesPossivel  := _cdsPedidoNovo.FieldByName('QT_SUGERIDA').AsInteger;
     vlMediaMes          := _cdsPedidoNovo.FieldByName('VL_MEDIA_VENDA').AsFloat;
     nrListaPreco        := _cdsPedidoNovo.FieldByName('CD_LISTA_COMPRA').AsInteger;
     pcIndicePreco       := _cdsPedidoNovo.FieldByName('PC_MUDANCA_PRECO').AsFloat;
     if _cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger>0 then
        vlVerba             := _cdsPedidoNovo.FieldByName('VL_VERBA').AsFloat/_cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger;




     pcIndicePreco := AbreIndicePreco(DadosFornecedor.nrFornecedor);
     dtPedido:=dtsistema;
     PrecoLista :=GetListaprecoNova(0, pcIndicePreco, 1, nrProduto,DadosPedidoAbertuta.cdEmpresaDestino,  'S', dtPedido);
     PcIpiListaPreco:=PrecoLista.PcIPILista;

     pcIcmsCompra:=Mercadoria.pcCreditoICMS;
     pcRepasseCompra:=Mercadoria.pcRepasseCompra;
  // if (PrecoLista.PcIcmsCompra>0) and (dtSistema>=StrToDate('01/12/2016')) then
    //    pcIcmsCompra:=precoLista.PcIcmsCompra;      // SS 33688  alterado 01/09/2020


   PC_REPASSE:=0;



{        SetPrecoItem(nrProduto, Mercadoria.n, nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoAdicional);
          PrecoItemSC := PrecoItem;}

    PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista,
                                    vlPrecoFornecedor,
                                    pcDescontoRepasse, pcDescontoPadrao,
                                    pcDescontoAdicional,
                                    pcAliquotaIcms,
                                    pcIpi,
                                    PrecoLista.PcIPILista,
                                    PrecoLista.pcReajustePreco,
                                    qtPedido,
                                    PrecoLista.nrListaPreco, 'N',
                                    idForcaRepasse[1],
                                    idIpiLiquidoComRepasse[1],
                                    idIpiLiquidoSemRepasse[1],
                                    idIpiBrutoComRepasse[1],
                                    idIpiBrutoSemRepasse[1],
                                    idTipoLista[1],
                                    idUnidadeFederacao,
                                    idSuperfluo,
                                    idIcmDestacado,
                                    idReduzIcms,
                                    idPisConfins);
       if nrVerba=0 then
      begin
        pcVerba:=0;
        vlVerba:=0;
      end;
      if (nrVerba>0) and (pcDescontoAdicional>0) AND (vlVerba=0)  then
      begin
       vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba, PrecoItem.vlPrecoCusto,
                                 Mercadoria.pcIpiProduto, 0,Mercadoria.pcCreditoICMS, Mercadoria.nrProduto,
                                 Mercadoria.nrTipoProduto, qtPedido,Mercadoria.nrLaboratorio,Mercadoria.idPis);
      end;



       if qtPedido>0 then
       begin
        sleep(0);
        if AbreItemPedidoMultiEmpresa(nrPedidoLocal, nrProduto,cdCentroDistribuicao, 'N') then
        begin
        end
        else
        begin
            inc(nrItemPedido);

             GravaItemPedidoAtual(nrPedidoLocal, // NUMBER(6)
                                  nrProduto, // NROM_Y ,//NUMBER(6)
                                  qtPedido, //nrQuantidadeComprada, // QUAY_Y ,//NUMBER(7)
                                  0, // CHEY_Y :Integer;//NUMBER(7)
                                  pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
                                  'N', // SITY_Y :String;//CHAR(1)
                                  dadoNovoPedido.nrDiasPedido,//nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
                                  vlPrecoUnitario, // PUNY_Y ,//NUMBER(17,6)
                                  vlPrecoFornecedor, // PFBY_Y ,//NUMBER(17,6)
                                  pcDescontoAdicional, // DADY_Y ,//NUMBER(5,2)
                                  nrItemPedido, // DFIY_Y ,   //NUMBER(5,2)
                                  vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
                                  nrVerba, // NRVV_Y :Integer;//NUMBER(6)
                                  0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
                                  0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
                                  'N', // ID_MARGEM,//CHAR(1)
                                  'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
                                  pcVerba, // PC_VERBA,//  NUMBER(5,2)
                                  vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
                                  0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
                                  0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
                                  0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
                                  0, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
                                  nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
                                  nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
                                  vlMediaMes, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
                                  nrListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
                                  pcIndicePreco,
                                  cdCentroDistribuicao,
                                  PcIcmsCompra,
                                  PcIpiListaPreco ,
                                  pcRepasseCompra,
                                  PrecoLista.vlBaseVenda,
                                  PrecoLista.pcIcmsVenda,
                                  PrecoLista.PcIcmsCompra,0, // PC_MUDANCA_PRECO:Double):Boolean;//NUMBER(7,4)}
                                  vlCustoGerencial);

        end;
    end;
     Application.ProcessMessages;
    _cdsPedidoNovo.Next;
   end;
   idPrecoCusto:='N';
   if _chkRelatorioPrecoCusto.Checked then
      idPrecoCusto:='S';
   idMostraDesconto:='N';
   if _chkMostraDesconto.Checked then
      idMostraDesconto:='S';

    AtualizaCapaPedido(NrPedidoLocal,
                      dadoNovoPedido.cdPrazo,
                      1,
                      DadosFornecedor.nrDiasLeadTime,
                      idStatus,
                     dsObervacaoDividi,idAtualizaAgendaDividir, dadoNovoPedido.dtPedido,
      dtAgendaDivividir,dtProximoPedidoDividir,0,
      DadosPedidoAbertuta.nrGeracaoVerba,_chkBonificaPedidoSC.Checked,0);
    if (idStatus='N') and (_chkImprimirSC.Checked) then
       Imprimir(nrPedidoLocal,idPrecoCusto,idMostraDesconto);
    if (idStatus='N') and (_chkGeraExcelSC.Checked) then
        GerarExcelPedido(nrPedidoLocal,idPrecoCusto,idMostraDesconto);
    if _chkBonificaPedidoSC.Checked then
    begin
          NrVerbaDividi:=StrToIntDef(_edtNrVerba.Text,0);
          setBonificaPedido(nrPedidoLocal,0,NrVerbaDividi);
   end;
 end;

  end;
end;

function T_frmDivisaoDePedido.PrazoPagamento(tabela: TClientDataSet): string;
var
    stPrazo: String[36];
begin
  tabela.open;
  tabela.First;
  stPrazo := '';
  while Not tabela.eof do
  begin
    stPrazo := stPrazo + FormatFloat('000', tabela.FieldByName('NR_DIAS')
      .AsInteger);
    tabela.Next;
  end;
  result := stPrazo;
end;

function T_frmDivisaoDePedido.TabelaTemporaria(tabela: TClientDataSet): TClientDataSet;
begin
   tabela.Open;
   tabela.RecordCount;
   result:=TClientDataSet.Create(tabela);
end;


function T_frmDivisaoDePedido.CriaTabelaPrazo(nmTabela:String):TClientDataSet;
var
    cdsTemp : TClientDataSet;
    dsTemp  : TDataSource;
    nmCampo :String;
begin
  cdsTemp := TClientDataSet.Create(nil);
  cdsTemp.Close;
  cdsTemp.FieldDefs.Clear;
  cdsTemp.FieldDefs.add('NR_PARCELA',ftInteger);
  cdsTemp.FieldDefs.add('NR_DIAS',ftInteger);
  cdsTemp.CreateDataSet;
  Result:=cdsTemp;
  FreeAndNil(cdsTemp);
end;


function T_frmDivisaoDePedido.RetornacdPrazoPedido(nrIndicePedido:Integer):TDadosNovoPedido;
var
 stPrazo:String;
begin
    if nrIndicePedido=1 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento1);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento1.RecordCount);
       result.dtPedido:=_dtpPedido_01.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=2 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento2);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento2.RecordCount);
       result.dtPedido:=_dtpPedido_02.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=3 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento3);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento3.RecordCount);
       result.dtPedido:=_dtpPedido_03.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=4 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento4);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento4.RecordCount);
       result.dtPedido:=_dtpPedido_04.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=5 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento5);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento5.RecordCount);
       result.dtPedido:=_dtpPedido_05.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=6 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento6);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento6.RecordCount);
       result.dtPedido:=_dtpPedido_06.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=7 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento7);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento7.RecordCount);
       result.dtPedido:=_dtpPedido_07.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
    if nrIndicePedido=8 then
    begin
       stPrazo:= PrazoPagamento(_cdsCondicaoPagamento8);
       result.cdPrazo:=AbrePrazoParcelamento(stPrazo,_cdsCondicaoPagamento8.RecordCount);
       result.dtPedido:=_dtpPedido_08.Date;
       result.nrDiasPedido:=StrToIntDef(stPrazo,0);
    end;
end;

function T_frmDivisaoDePedido.GetDataPedido(nrIndicePedido:Integer):TDate;
begin
{  if nrIndicePedido=2 then
     Result:=_dtpPedido_02;
  if nrIndicePedido=3 then
     Result:=_dtpPedido_03;
  if nrIndicePedido=4 then
     Result:=_dtpPedido_04;
  if nrIndicePedido=5 then
     Result:=_dtpPedido_05;
  if nrIndicePedido=6 then
     Result:=_dtpPedido_06;
  if nrIndicePedido=7 then
     Result:=_dtpPedido_07;
  if nrIndicePedido=8 then
     Result:=_dtpPedido_08;}
end;


Function CriaDataSetPrazo:TclientDataset;

begin
   with _cdsParcelaPrazoPagamento do
   begin
   TClientDataSet.Create(nil);
   close;
   FieldDefs.Clear;
   FieldDefs.Add('NR_PARCELAS',ftInteger);
   FieldDefs.Add('NR_DIAS',ftInteger);
   FieldDefs.Add('PC_PARCELAS',ftFloat);
   FieldDefs.Add('VL_PARCELAS',ftFloat);
   FieldDefs.Add('DT_PARCELAS',ftDate);
   CreateDataSet;
   end;
   Result:=_cdsParcelaPrazoPagamento;
end;

procedure T_frmDivisaoDePedido.ExecutaDivisao;
var
 nrPedidoDigitado,
 qtPedidos :Integer;
 DadosCd   :TDadosCD;

begin
                nrPedidoDigitado:=StrToIntDef(_edtNrPedido.Text,0);
                qtPedidos:=StrToIntDef(_edtqtPedido.Text,0);
                if qtPedidos<1 then
                begin
                   Mensagem('Informe quantidade de Pedido para divis?o...',16);
                   _edtqtPedido.SetFocus;
                   exit;
                end;

                GetPercetualPedido;
                AbrePedidoOriginal(nrPedidoDigitado);
                if _cdsPedidoNovo.FieldByName('CD_PEDIDO_RELACIONADO').AsInteger>0 then
                begin
                 if  Confirma('Este pedido possui um pedido Vinculado a ele'+#13+
                           'ou J? foi desmembrado de Outro Pedido'+#13+
                           'Deseja Continuar com a importa??o ?',MB_DEFBUTTON2)=idNo then
                       exit;
                end;
                nrCompradorPedido:=_cdsPedidoNovo.FieldByName('CD_COMPRADOR').AsInteger;
                DadosFornecedor   := GetDadosLaboratorio(_cdsPedidoNovo.FieldByName('LABP_P').AsInteger);
                if DadosFornecedor.nrFornecedor>0 then
                begin
                   _edtFornecedor.Text:=DadosFornecedor.dsNomeFantasia;
                   _edtNrCNPJ.Text  :=DadosFornecedor.stCNPJ;
                   _dtPedido.Text   :=FormatDateTime('DD/MM/YYYY',_cdsPedidoNovo.FieldByName('DATP_P').AsDateTime);
                   _dtPrevista.Text :=FormatDateTime('DD/MM/YYYY',_cdsPedidoNovo.FieldByName('DATP_P').AsDateTime+DadosFornecedor.nrDiasLeadTime);

                end;
                if _cdsPercentualPedido.Active then
                   if qtPedidos>0 then
                      SetQuantidadePedido(qtPedidos);
                if not  _cdsPedidoNovo.IsEmpty then
                begin
                 qtPedidos:=StrToIntDef(_edtqtPedido.Text,0);
                 ZeraQtPedidoMult(qtPedidos);
                 DadosPedidoAbertuta:=  GetValoresPedido(nrPedidoDigitado,false);
                 MontaPedidoNovos(qtPedidos);
                 MostraCondicaoPagamento(qtPedidos);
                 DadosCd:=GetDadosCD(DadosPedidoAbertuta.cdEmpresaDestino);
                 _edtObservacaoPedidoSC.Text:=DadosPedidoAbertuta.stObservacaoPedido;
                 if DadosCd<>nil then
                    _edtCdDestino.Text:='Pedido para '+DadosCd.stEstado;


                end;

end;

procedure T_frmDivisaoDePedido.GetPercetualPedido;
var
 qtPedidos:Integer;
begin
               qtPedidos:=StrToIntDef(_edtqtPedido.Text,0);
               if qtPedidos>8 then
               begin
                 Mensagem('Nr. maximo Pedido ? 8!!!',64);
                 _edtqtPedido.Clear;
                 _edtqtPedido.SetFocus;
                 exit;
               end;
               if qtPedidos=0 then
               begin
                 Mensagem('Falta colocar Nr. para divis?o!!!'+#13+
                          'No Minimo 1' ,64);
                 _edtqtPedido.Clear;
                 _edtqtPedido.SetFocus;
                 exit;
               end;

               if qtPedidos>0 then
               begin
                  CarregaQuantidadePedido(qtPedidos);
                  DesmarcaSelecao;
                  if _cdsPercentualPedido.Active then
                      SetQuantidadePedido(qtPedidos);
                  _edtNrPedido.SetFocus;
               end;

end;

procedure  T_frmDivisaoDePedido.AtualizaPedidooriginal(PnrPedido:Integer);
var
  i: Integer;
  nrPedidoLocal,
  cdPrazoPagamento,
  nrProduto,
  dgMercadoria,
  nrVerba,
  cdCentroDistribuicao,
  nrItemPedido,
  nrDiasEstoqueAtual,
  nrUnidadesPossivel,
  nrPrazoPedido,
  nrListaPreco,
  qtPedido  :Integer;
  stPrazo,idUnidadeFederacao :string;
  dadoNovoPedido:TDadosNovoPedido;
  TabelaTemp:TClientDataSet;
  pcDescontoPadrao,
  pcDescontoAdicional,
  pcVerba,pcDescontoRepasse,
  vlPrecoFornecedor,
  vlPrecoUnitario,
  vlPrecoCusto,
  vlVerbaUnitario,
  pcCreditoIcms,
  pcIpi,vlVerba,
  vlMediaMes,
  pcIndicePreco   :Double;
  Mercadoria: TMercadoria;
  idIpiLiquidoComRepasse,
   idIpiLiquidoSemRepasse,
  idIpiBrutoComRepasse,idIpiBrutoSemRepasse,
  idIcmDestacado, idTipoLista,  idForcaRepasse,
  idReduzIcms, idSuperfluo,
  idPisConfins, idProdutoAtivo,idStatus: String[1];
  idPrecoCusto,idMostraDesconto:Char;


begin
    _cdsPedidoNovo.first;
    dadoNovoPedido := RetornacdPrazoPedido(1);
    while not _cdsPedidoNovo.Eof do
    begin
     stPrazo     := _cdsPedidoNovo.Fields.Fields[1+8].DisplayName;
     qtPedido    := _cdsPedidoNovo.Fields.Fields[1+8].AsInteger;
     nrProduto   := _cdsPedidoNovo.FieldByName('NROM_Y').AsInteger;
     dgMercadoria:= _cdsPedidoNovo.FieldByName('NR_DV_MERCADORIA').AsInteger;
     Mercadoria  := GetMercadoriaNova(nrProduto,dgMercadoria,0,DadosPedidoAbertuta.cdEmpresaDestino,1,'');
     pcDescontoRepasse :=Mercadoria.pcRepasseCompra;
     pcCreditoIcms    :=Mercadoria.pcCreditoICMS;
     pcIpi             :=Mercadoria.pcIpiProduto;
     idUnidadeFederacao:=DadosFornecedor.idUnidadeFederacao;

      idForcaRepasse         := DadosFornecedor.idForcaRepasse;
      idIpiLiquidoComRepasse := DadosFornecedor.idIpiLiquidoComRepasse;
      idIpiLiquidoSemRepasse := DadosFornecedor.idIpiLiquidoSemRepasse;
      idIpiBrutoComRepasse   := DadosFornecedor.idIpiBrutoComRepasse;
      idIpiBrutoSemRepasse   := DadosFornecedor.idIpiLiquidoSemRepasse;
      idTipoLista            := Mercadoria.idTipoListaFiscal;
      idSuperfluo            := Mercadoria.idSuperfulo;
      idIcmDestacado         := DadosFornecedor.idIcmDestacado;
      idReduzIcms            := DadosFornecedor.idReduzIcms;
      nrPrazoPedido          := DadosFornecedor.nrPrazoPedido;
      idPisConfins           := Mercadoria.idPisCofins;



     pcDescontoPadrao     :=_cdsPedidoNovo.FieldByName('ABTY_Y').AsFloat;
     pcDescontoAdicional  :=_cdsPedidoNovo.FieldByName('DADY_Y').AsFloat;
     pcVerba              :=_cdsPedidoNovo.FieldByName('PC_VERBA').AsFloat;
     nrVerba              :=_cdsPedidoNovo.FieldByName('NRVV_Y').AsInteger;

     cdCentroDistribuicao :=_cdsPedidoNovo.FieldByName('CD_EMPRESA').AsInteger;
     vlPrecoFornecedor    :=_cdsPedidoNovo.FieldByName('PFBY_Y').AsFloat;
     vlPrecoUnitario      :=_cdsPedidoNovo.FieldByName('PUNY_Y').AsFloat;
     vlPrecoCusto         :=_cdsPedidoNovo.FieldByName('VCCI_Y').AsFloat;
     if (nrVerba>0) and (PcDescontoAdicional>0) and (pcVerba=0) then
        pcVerba:=100;
     if (nrVerba=0) and (PcDescontoAdicional>0) and (pcVerba>=0) then
        pcVerba:=0;


     nrDiasEstoqueAtual  :=_cdsPedidoNovo.FieldByName('NR_DIAS_ESTOQUE').AsInteger;
     nrUnidadesPossivel  :=_cdsPedidoNovo.FieldByName('QT_SUGERIDA').AsInteger;
     vlMediaMes          :=_cdsPedidoNovo.FieldByName('VL_MEDIA_VENDA').AsFloat;
     nrListaPreco        :=_cdsPedidoNovo.FieldByName('CD_LISTA_COMPRA').AsInteger;
     pcIndicePreco       :=_cdsPedidoNovo.FieldByName('PC_MUDANCA_PRECO').AsFloat;
     vlVerba             := _cdsPedidoNovo.FieldByName('VL_VERBA').AsFloat/_cdsPedidoNovo.FieldByName('QUAY_Y').AsInteger;




     pcIndicePreco := AbreIndicePreco(DadosFornecedor.nrFornecedor);

     PrecoLista :=GetListaprecoNova(0, pcIndicePreco, 1, nrProduto, 1,  'N', dtPedido);


{        SetPrecoItem(nrProduto, Mercadoria.n, nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoAdicional);
          PrecoItemSC := PrecoItem;}

    PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista, vlPrecoFornecedor,
                                    pcDescontoRepasse, pcDescontoPadrao,
                                    pcDescontoAdicional, pcCreditoIcms,pcIpi,
                                    PrecoLista.PcIPILista,
                                    PrecoLista.pcReajustePreco,
                                    qtPedido,PrecoLista.nrListaPreco, 'N',
                                    idForcaRepasse[1],
                                    idIpiLiquidoComRepasse[1],
                                    idIpiLiquidoSemRepasse[1],
                                    idIpiBrutoComRepasse[1],
                                    idIpiBrutoSemRepasse[1],
                                    idTipoLista[1],
                                    idUnidadeFederacao,
                                    idSuperfluo,
                                    idIcmDestacado,
                                    idReduzIcms,
                                    idPisConfins);

       if nrVerba=0 then
      begin
        pcVerba:=0;
        vlVerba:=0;
      end;
      if (nrVerba>0) and (pcDescontoAdicional>0) AND (vlVerba=0)  then
      begin
       vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba, PrecoItem.vlPrecoCusto,
                  Mercadoria.pcIpiProduto, 0,Mercadoria.pcCreditoICMS, Mercadoria.nrProduto,
                  Mercadoria.nrTipoProduto, qtPedido,Mercadoria.nrLaboratorio,
                  Mercadoria.idPis);
      end;



       if qtPedido>0 then
       begin
        sleep(0);
        inc(nrItemPedido);
        if AbreItemPedidoMultiEmpresa(PnrPedido, nrProduto,cdCentroDistribuicao, 'N') then
        begin
          if AtualizaItemPedido(PnrPedido,
                              nrProduto,
                              qtPedido,
                               0,
                               dadoNovoPedido.nrDiasPedido,
                               nrVerba,
                               0,
                               1,
                               nrDiasEstoqueAtual,
                               nrUnidadesPossivel,
                               'N',
                               'N',
                               'N',
                               pcDescontoPadrao,
                               pcDescontoAdicional,
                               0,
                               pcVerba,
                               0,
                               0,
                               vlPrecoUnitario,
                               vlPrecoFornecedor,
                               vlPrecoCusto,
                               0,
                               0,
                               vlVerba,
                               vlMediaMes,
                               'Tela Divisao Pedido',
                               cdCentroDistribuicao,
                               pcCreditoIcms,
                               PrecoLista.nrListaPreco,
                               false,
                               false,
                               PrecoLista.PcIcmsCompra,
                               0,
                               PrecoLista.vlBaseVenda) then
                     AtualizaStatusItemPedido(nrPedidoLocal, nrProduto,0, 'N');
        end;
    end;
    _cdsPedidoNovo.Next;
   end;
   idStatus:='N';
   AtualizaCapaPedido(PnrPedido, dadoNovoPedido.cdPrazo, 1,DadosFornecedor.nrDiasLeadTime ,idStatus,
      dsObervacaoDividi,idAtualizaAgendaDividir, dadoNovoPedido.dtPedido,
      dtAgendaDivividir,dtProximoPedidoDividir,0,NrVerbaDividi,_chkObservacaoPedidoSC.Checked,0);
   if (idStatus='N') and (_chkImprimirSC.Checked) then
       Imprimir(PnrPedido,idPrecoCusto,idMostraDesconto);
  if (idStatus='N') and (_chkGeraExcelSC.Checked) then
        GerarExcelPedido(PnrPedido,idPrecoCusto,idMostraDesconto);
  if _chkBonificaPedidoSC.Checked then
  begin
          NrVerbaDividi:=StrToIntDef(_edtNrVerba.Text,0);
          setBonificaPedido(PnrPedido,0,NrVerbaDividi);
   end;



end;
end.
