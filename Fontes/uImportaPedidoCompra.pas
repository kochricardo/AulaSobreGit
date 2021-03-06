unit uImportaPedidoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Gauges,
   SHELLAPI ,ComObj, OleServer,math,
  StrUtils,uRotinasGenericas, uAuxiliarCompras,uProduto, DB, DBClient,
  uDm, uFinalizaPedidoExcel;

type
  T_frmImportaPedidoFornecedor = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    _gaPlanilha: TGauge;
    _edtArquivo: TEdit;
    _btnImportaLista: TBitBtn;
    _edtNrFornecedor: TEdit;
    _edtNmForncedor: TEdit;
    _btnImportaDados: TBitBtn;
    GroupBox2: TGroupBox;
    _dbgPrePedido: TDBGrid;
    _cdsPrePedido: TClientDataSet;
    _cdsPrePedidoCD_PRODUTO: TIntegerField;
    _cdsPrePedidoNM_PRODUTO: TStringField;
    _cdsPrePedidoDS_APRESENTACAO_PRODUTO: TStringField;
    _cdsPrePedidoVL_PRECO_PEDIDO: TFloatField;
    _cdsPrePedidoPC_DESCONTO_PADRAO: TFloatField;
    _cdsPrePedidoPC_DESCONTO_ADICIONAL: TFloatField;
    _cdsPrePedidoQT_PEDIDO: TIntegerField;
    _cdsPrePedidoNR_VERBA: TIntegerField;
    _cdsPrePedidoPC_VERBA: TFloatField;
    _opdLocalizaArquivo: TOpenDialog;
    GroupBox3: TGroupBox;
    _dbgEmpresa: TDBGrid;
    _dsEmpresa: TDataSource;
    _cdsEmpresa: TClientDataSet;
    _stbMensagem: TStatusBar;
    _cdsPrePedidoVL_PRECO_FORNECEDOR: TFloatField;
    _dsPrePedido: TDataSource;
    _cdsPrePedidoCD_OPERADOR_LOGISTICO: TIntegerField;
    _cdsPrePedidoCD_EMPRESA: TIntegerField;
    _cdsPrePedidoID_CROSSDOCKING: TStringField;
    GroupBox4: TGroupBox;
    BitBtn1: TBitBtn;
    _cdsTabelaLeadTime: TClientDataSet;
    _dsTabelaLeadTime: TDataSource;
    _edtNrVerba: TEdit;
    Label4: TLabel;
    _cdsPeEstoque: TClientDataSet;
    _cdsPrePedidoNR_MERCADORIA: TIntegerField;
    _cdsTabelaPreco: TClientDataSet;
    _cdsPrePedidoNR_DIAS_CROSSDOCKING: TIntegerField;
    _cdsItemListaPreco: TClientDataSet;
    _cdsPrePedidoNR_EMPRESA_OCD: TIntegerField;
    _cdsPendencia: TClientDataSet;
    _cdsPrePedidoQT_ESTOQUE: TIntegerField;
    _cdsItensCurva: TClientDataSet;
    _cdsPrePedidoNR_LEADTIME: TIntegerField;
    _cdsPrePedidoID_CURVA: TStringField;
    _cdsPrePedidoPC_CREDITOICMS: TFloatField;
    _cdsPrePedidoPC_IPI_LISTA: TFloatField;
    _cdsDataUltimaCompra: TClientDataSet;
    _cdsTotalizaPedido: TClientDataSet;
    _grbTotaisPedido: TGroupBox;
    _dbgPedido: TDBGrid;
    _dsTotalizaPedido: TDataSource;
    _cdsVendaFornecedor: TClientDataSet;
    _btnConfirma: TBitBtn;
    _btnFechaCancela: TBitBtn;
    _cdsPrePedidoPC_DESCONTO_TOTAL: TFloatField;
    _cdsPrePedidoNR_DIAS_ESTOQUE: TFloatField;
    _cdsPrePedidoVL_MEDIA_VENDA: TFloatField;
    _cdsPrePedidoQT_PENDENTE: TIntegerField;
    _cdsPrePedidoQT_EMBALAGEM_COMPRA: TIntegerField;
    _cbxCaixaFechada: TComboBox;
    Label11: TLabel;
    _chkCrossDocking: TCheckBox;
    _cdsPrePedidoCD_EMPRESA_CROSSDOCKING: TIntegerField;
    _cdsPrePedidoNR_CROSSDOKING: TIntegerField;
    _cdsPrePedidoID_SEM_CROSSDOCKING: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnImportaListaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _dbgEmpresaDblClick(Sender: TObject);
    procedure _dbgEmpresaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _stbMensagemDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure _btnImportaDadosClick(Sender: TObject);
    procedure _dbgEmpresaTitleClick(Column: TColumn);
    procedure _dbgPrePedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure _dbgPrePedidoTitleClick(Column: TColumn);
    procedure _dbgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnConfirmaClick(Sender: TObject);
    procedure _btnFechaCancelaClick(Sender: TObject);
  private
    procedure AbreExcel(stArquivo: wideString);
    procedure CarregaEmpresa;
    procedure ImportarPlanilhaNova(var ArquivoExcel: OLEVariant;
      var DataSet: TClientDataSet; const Planilha: integer);
    procedure setGridEmpresa(PTabela: TClientDataSet);
    function SetEmpresaSelecionadas(PTabela: TClientDataSet): TDadosEmpresa;
    function CadastraTabelaPreco(PnrLista,
                                 PcdProduto,
                                 PnrQtdEmbalagem,
                                 PnrQtdPedido: Integer;
                                 PvlCaixaFecha,
                                 PvlCaixaFechaComDesconto,
                                 PvlUnitario,
                                 PvlUnitarioComDesconto,
                                 PpcDesconto,
                                 PpcDescontoAdicional,
                                 PpcDescontoTotal: Double;
                                 PcdEmpresa,
                                 PnrVerba,
                                 PnrOperadorLogistico: Integer;
                                 PnmProduto,
                                 PdsApresentacao,
                                 PidCrossdocking:String;
                                 PnrProduto:Integer;
                                 PnrDiasCrossdoking,
                                 PqtEstoque,
                                 PqtPendente,
                                 PqtEmbalagemCompra,
                                 PnrLeadTime:Integer;
                                 PnrDiasEstoque:Double;
                                 PidCurva:String;
                                 PpcCreditoICMS,
                                 PpcIPILista,
                                 PvlMediaDia:Double;
                                 PnrCrossdocking:Integer;
                                 PidSemCrossdocking:String): Boolean;
    procedure SetStatusBar;
    procedure geraPedido(PidStatus:String);
    procedure FiltraEmpresa;
    procedure Abreplanilha;
    procedure FiltraItenspedido(PnrEmpesa: integer);
    function GeraCapaPedido(PnrPedido,PnrEmpresa: Integer;Pidstatus:String): Boolean;
    function SetLeadTime(PnrEmpresa: Integer;
      PidTermoLabil: String): TDadosLeadTime;
    function ListaDiasEstoqueCD(PstEmpresa: String): TClientDataSet;
    function setDiasEstoque(PnrEmpresa: Integer): Integer;
    function GetPrecoItem(PnrProduto, PcdEmpresa: Integer; PvlPrecoFornecedor,
      PpcDescontoAbatimento: Double; PIdPrecoAtual: Char; PidPedidoBloqueado,
      PnrLIstaPrecoAtiva: Integer): TListaPreco;
    function LiberaCompraItem(PdtInativacaoFutura, PdtBloqueioCompra: Tdate;
      PidMostraMensagem, PidLiberaCompra, PidVendaAutorizada: Boolean): Boolean;
    function SetListaPrecoAtiva(PnrLista, PnrProduto,
      PnrEmpresa: Integer): TListaPrecoAtiva;
    function setPendenciaCD(nrProduto,
      cdEmpresa: Integer): TDadosPendenciaPedido;
    function CalculaMedia(PnrEmpresa: Integer): TDadosMedia;
    function setParamentroItemCurvaCompra(PnrEmpresa, PnrDiasEstoque: Integer;
      PidCurva: Char): TDadosEstoqueCurva;
    procedure SetTabelasItensCurva(PnrFornecedor: Integer; PnrEmpresa: String);
    function CalculoSugestaoIdealNova(PnrEmpresa: Integer;
                                      PvlPE,
                                      PnrDiasAjuste,
                                      PLeadTimeCalculo,
                                      PvlMediaDiaria: Double;
                                      PnrQuantidadeEstoque,
                                      PnrQuantidadaPendente,
                                      PQtdEstoqueMinimo,
                                      PQtdEstoqueMaximo,
                                      PcdOPeradorLogistico: Integer;
                                      PnrFrequenciaCompra: Double;
                                      PidCurva: String): TDadosQtdadeSugestao;
    function GetUltimaCompra(PnrProduto, PnrCD, PnrOPerador: Integer): Tdate;
    function TotalizaPedidoMultiEmpresa(PstPedido: String; PcdEmpresa: Integer;
      PidSituacao: String): Boolean;
    procedure SetGridTotalizaPedido;
    procedure FiltraVenda(PnrProduto, PnrEmpresa, PnrCanal: Integer);
    function AbreVendaLaboratorioMultiEmpresa(PnrLaboratorio, PnrEmpresa,
      PnrOperadorLogistico: Integer): TClientDataSet;
    procedure ZeraArray;
    procedure EncerraPedido(PidConfirma: Boolean);
    function VerificaProblemasCrossdocking: Boolean;




    { Private declarations }
  public
     stEmpresaSelecionada,
     stPedido :string;
     nrCompradorPedido,
     nrProduto,
     cdoperadorLogisticoPedido,
     NrDiasEstoqueComprador,
     nrListaPrecoExcecao :Integer;
     DadosMedia: TDadosMedia;
     DadosEstoqueCompra: TDadosEstoqueCurva;
     DadosSugestao  : TDadosQtdadeSugestao;


     VendaAnual: Array [0 .. 6, 1 .. 13] of Integer;
     nrDiasMes: Array [0 .. 6, 1 .. 13] of Integer;
     MediaAnual: Array [0 .. 6, 1 .. 13] of Double;
     DesvioPadraoAnual: Array [0 .. 6, 1 .. 13] of Double;
     nrDiasEstoqueAZero: Array [0 .. 6, 1 .. 13] of Integer;

     qtSeguranca,qtMaxima,
     qtSegurancaAcumulada :Double;

    { Public declarations }
  end;

var
  _frmImportaPedidoFornecedor: T_frmImportaPedidoFornecedor;
   DadosFornecedor :TDadosFornecedor;
   DadosProduto,Mercadoria,MercadoriaCross :TMercadoria;
   DadosLeadTime: TDadosLeadTime;
   DadosPendencia: TDadosPendenciaPedido;


   dadosEmpresa: TDadosEmpresa;
   precoLista: TListaPreco;
   PrecoItem: TCalculoPreco;



implementation

uses uSetDataAgenda;






{$R *.dfm}

procedure T_frmImportaPedidoFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure T_frmImportaPedidoFornecedor.FormShow(Sender: TObject);
begin
 SetLength(PedidoEmpresa,10);
 ZeraArray;
 CarregaEmpresa;
 SetStatusBar;
end;

procedure T_frmImportaPedidoFornecedor._btnFechaCancelaClick(Sender: TObject);
begin
  if Confirma('Deseja Realmente Cancelar Pedidos', MB_DEFBUTTON2) = IDYES then
     EncerraPedido(true);

end;

procedure T_frmImportaPedidoFornecedor._btnImportaDadosClick(Sender: TObject);
begin
   _btnImportaDados.Enabled:=false;




   if not VerificaProblemasCrossdocking then
      exit;



   gerapedido('S');
   if stPedido<>EmptyStr then
      TotalizaPedidoMultiEmpresa(stPedido, 0, '');


  if not _cdsPrePedido.IsEmpty then
     _btnConfirma.Enabled:=true
  else
   _btnImportaDados.Enabled:=true


end;

procedure T_frmImportaPedidoFornecedor._btnImportaListaClick(Sender: TObject);
begin
  _edtArquivo.Clear;
  _cdsPrePedido.Close;
  _cdsPrePedido.CreateDataSet;
  if not _opdLocalizaArquivo.Execute then
     Exit;
     Abreplanilha;

    SetTabelasItensCurva(DadosFornecedor.nrFornecedor, stEmpresaSelecionada);


end;

procedure T_frmImportaPedidoFornecedor._dbgEmpresaDblClick(Sender: TObject);
begin
  if _cdsEmpresa.Active then
  begin
    _cdsEmpresa.Edit;
    if _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString = 'S' then
      _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString := 'N'
    else
      _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString := 'S';

    dadosEmpresa := SetEmpresaSelecionadas(_cdsEmpresa);
    stEmpresaSelecionada := dadosEmpresa.stEmpresa;
  end;

end;

procedure T_frmImportaPedidoFornecedor._dbgEmpresaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString <> 'S' then
  begin
    if odd(_cdsEmpresa.RecNo) then
    begin
      _dbgEmpresa.Canvas.Font.Color := clBlack;
      _dbgEmpresa.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgEmpresa.Canvas.Font.Color := clBlack;
      _dbgEmpresa.Canvas.Brush.Color := clWhite;
    end;
  end;
  if _cdsEmpresa.FieldByName('ID_SELECIONADO').AsString = 'S' then
  begin
    _dbgEmpresa.Canvas.Font.Color := clWhite;
    _dbgEmpresa.Canvas.Brush.Color := clGreen;
  end;
  _dbgEmpresa.Canvas.fillRect(Rect);
  _dbgEmpresa.defaultDrawColumncell(Rect, DataCol, Column, State);

end;

procedure T_frmImportaPedidoFornecedor._dbgEmpresaTitleClick(Column: TColumn);
begin
 _cdsEmpresa.Filtered:=false;
end;

procedure T_frmImportaPedidoFornecedor._dbgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsTotalizaPedido <> nil then
  begin
    if _cdsTotalizaPedido.Active then
    begin
      if odd(_cdsTotalizaPedido.RecNo) then
      begin
        _dbgPedido.Canvas.Font.Color := clBlack;
        _dbgPedido.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgPedido.Canvas.Font.Color := clBlack;
        _dbgPedido.Canvas.Brush.Color := clWhite;
      end;
    end;
    _dbgPedido.Canvas.fillRect(Rect);
    _dbgPedido.defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmImportaPedidoFornecedor._dbgPrePedidoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgPrePedido do
  begin
   If odd(_dsPrePedido.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;

  if (_dsPrePedido.DataSet.FieldByName('PC_DESCONTO_TOTAL').AsFloat>0) AND
     (_dsPrePedido.DataSet.FieldByName('PC_DESCONTO_ADICIONAL').AsFloat=0)  then
  begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clYellow;
  end;
  if (_dsPrePedido.DataSet.FieldByName('PC_DESCONTO_TOTAL').AsFloat<0)
  then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:= clRed;
  end;

  if (_dsPrePedido.DataSet.FieldByName('ID_SEM_CROSSDOCKING').AsString='S')
  then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:= clRed;
  end;


 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clBlue;
    Canvas.Font.Color:= clWhite;
 end;
 DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmImportaPedidoFornecedor._dbgPrePedidoTitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsPrePedido,Column);
end;

procedure T_frmImportaPedidoFornecedor._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_RETURN: begin
               DadosFornecedor:=GetDadosLaboratorioComprador(StrToIntDef('0',0),
                                                             StrToIntDef(_edtNrFornecedor.Text,0));

               if DadosFornecedor<>NIL then
               begin
                    _btnImportaLista.Enabled:=true;
                //_edtComprador.Text:=FormatFloat('0000',DadosFornecedor.nrComprador);
               if (StrToIntDef(_edtNrFornecedor.Text,0)>0) and (DadosFornecedor.nrFornecedor=0) then
               begin
                  Mensagem('Fornecedor n?o encontrado !!!',MB_ICONWARNING);
                  _edtNrFornecedor.SetFocus;
                  exit;
               end;
               _edtNmForncedor.Text:=DadosFornecedor.dsNomeFantasia;

                _cdsTabelaLeadTime := TabelaLeadTimeTermolabil(DadosFornecedor.nrFornecedor);
                if _cdsTabelaLeadTime <> nil then
                begin
                  _dsTabelaLeadTime.DataSet := _cdsTabelaLeadTime;
                  _cdsTabelaLeadTime.open;
                end;


                _cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, DadosFornecedor.nrFornecedor, 0, 0, 'S',dtSistema);
                if _cdsTabelaPreco<>nil then
                   _cdsTabelaPreco.Open;


                   _cdsItemListaPreco := nil;
                  if nrListaPrecoExcecao > 0 then
                    _cdsItemListaPreco := AbrePrecoListaAtiva(nrListaPrecoExcecao);
                  if _cdsItemListaPreco <> nil then
                    _cdsItemListaPreco.open;

                  _cdsPendencia     := AbrePendenciaLaboratorioNova(DadosFornecedor.nrFornecedor);
                  if _cdsPendencia<>nil then
                     _cdsPendencia.Open;
                  _cdsDataUltimaCompra := DataUltimaCompraII(DadosFornecedor.nrFornecedor);

                  if _cdsDataUltimaCompra<>nil then
                     _cdsDataUltimaCompra.Open;

                    _cdsVendaFornecedor :=    AbreVendaLaboratorioMultiEmpresa(DadosFornecedor.nrFornecedor, 0, 0);

                   if _cdsVendaFornecedor<>nil then
                     _cdsVendaFornecedor.open;

               //_cdsTabelaProdutoFornecedor:=AbreProdutosFornecedorFornecedor(DadosFornecedor.nrFornecedor);
               //ListaPrecoAtivas(DadosFornecedor.nrFornecedor,0);

{               if  _cdsTabelaProdutoFornecedor<>nil then
               begin
                 _btnImportaLista.Enabled:=true;
                 _dsTabelaProdutoFornecedor.DataSet:=_cdsTabelaProdutoFornecedor;
                 _cdsTabelaProdutoFornecedor.Open;
                 SetGridProdutos;
               end;}

               //_btnExecutaPonto.Click;
               end;

      end;

end;
end;

procedure T_frmImportaPedidoFornecedor._stbMensagemDrawPanel(
  StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
    if Panel = _stbMensagem.Panels[1] then
    with _gaPlanilha do
    begin

         Top := Rect.Top;
          Left := Rect.Left;
          Width := Rect.Right - Rect.Left - 00;
          Height := Rect.Bottom - Rect.Top;
        end;

end;

procedure T_frmImportaPedidoFornecedor.AbreExcel(stArquivo:wideString);
var
	Excel: OLEVariant;
  CaminhoArquivo: string;
  nrLinha:Integer;
begin
  // carrega o arquivo XLSX que est? na mesma pasta do execut?vel
  CaminhoArquivo := stArquivo;
  // cria uma inst?ncia do Excel
  Excel := CreateOleObject('Excel.Application');

  try
    Screen.Cursor := crHourGlass;

    // evita que o Excel seja exibido na tela
    Excel.Visible := False;

//    nrLinha:=Excel.activeCell.row;
    // abre o arquivo XLSX
	  Excel.Workbooks.Open(CaminhoArquivo);

    // importa??o da primeira planilha (Clientes)
    ImportarPlanilhaNova(Excel, _cdsPrePedido, 1);

    // importa??o da segunda planilha (Produtos)
   // ImportarPlanilha(Excel, cdsProdutos, 2);

    // importa??o da terceira planilha (Usu?rios)
   // ImportarPlanilha(Excel, cdsUsuarios, 3);
  finally
	  if not VarIsEmpty(Excel) then
    begin
		  Excel.Quit;
      Excel := Unassigned;
		end;
    Screen.Cursor := crDefault;
	end;
  //_chkListaFornecedor.Enabled:=true;

end;


procedure T_frmImportaPedidoFornecedor.ImportarPlanilhaNova(var ArquivoExcel: OLEVariant;
  var DataSet: TClientDataSet; const Planilha: integer);
var
  Linha: integer;
  nrLinhas,
  nrEmpresaOCD,
  nrSomaLeadTimeOCD:Integer;
  idCrossDocking,
  cdEan ,stCodigo,
  idSemCrossDocking  :String;
  qtPedido,
  cdProduto,
  dgProduto,
  cdEmpresa,
  colunaTeste,
  nrOPeradorLogistico,
  NrVerba,
  nrQtdadeSusgetaoPossivel:Integer;
  vlPrecoUnitario,
  vlPrecoUnitarioDesconto,
  pcDescontoAdicional,
  pcDescontoTotal,
  vlPrecoLista,
  pcPedido,
  qtCalculada,
  qtPedidoOriginal,
  nrDiasEstoqueComPedido,
  vlMediaDiaCD :Double;
  DadosCodigo :TCodigoValido;
begin

  // ativa a planilha
//  ArquivoExcel.Workbooks[1].WorkSheets[0].Activate;
  ArquivoExcel.Workbooks[1].WorkSheets[Planilha].Activate;

  colunaTeste:=1;
  Linha :=1;

  stCodigo :=AnsiReplaceStr(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1],'/','');
  if trim(stCodigo)=''  then
     colunaTeste:=1;


  Linha :=2;


//  ArquivoExcel.Workbooks.open(Planilha);
  //Pegar o n?mero da ?ltima linha

   //nrLinhas:=ArquivoExcel.Activecell.Row;

   nrLinhas:=linha-1;
try
  while not ((ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste].value = varEmpty) and
            (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste+1].value = varEmpty) and
            (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste+2].value = varEmpty))

    do
  begin
    inc(nrLinhas);
    inc(Linha);
  end;
except
 Mensagem('Linha'+IntToStr(nrLinhas)+' Dados Coluna --> '+ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste].Value,16);

end;

  // linha da planilha que cont?m os valores
  Linha := 2;

  // limpa o conte?do existente no DataSet
  DataSet.EmptyDataSet;

  // desabilita os controles (para evitar o efeito de navega??o enquanto insere os registros
  DataSet.DisableControls;
   // nrLinhar := excel.ActiveCell.Row;

  _gaPlanilha.MinValue:=0;
  _gaPlanilha.MaxValue:=nrLinhas;

//   cd_empresa	cd_mercadoria	preco_final_com_desconto	desc_adicional	nr_verba


  // Filtra Empresa selecionada
  dadosEmpresa := SetEmpresaSelecionadas(_cdsEmpresa);
  stEmpresaSelecionada := dadosEmpresa.stEmpresa;
  FiltraEmpresa;

  // loop para inser??o de cada linha at? que encontre uma linha em branco
  while not ((ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste].value = varEmpty) and
            (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste+1].value = varEmpty) and
            (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, colunaTeste+2].value = varEmpty))
   do


  begin
   stCodigo              :=AnsiReplaceStr(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1],'/','');
   DadosCodigo           :=TransformaStringCodigo(stCodigo);
   nrProduto             :=DadosCodigo.nrCodigo;
   dgProduto             :=DadosCodigo.nrDigito;
   cdEan:='';




   if DadosCodigo.nrCodigo=0 then
      cdEan                  := ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 3];

   qtPedido               :=0;
   if trim(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 4])<> '' then
      qtPedido               := StrToIntDef(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 4],0);



   vlPrecoUnitarioDesconto:=0;
   if trim(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 6])<>'' then
      vlPrecoUnitarioDesconto:= StrToFloatDef(FormatFloat('00000.00', ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 6]),0);

   pcDescontoAdicional    :=0;
   pcDescontoTotal:=0;
   if trim(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 7])<>'' then
      pcDescontoAdicional    := ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 7];



     if trim(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 8])<>'' then
      pcDescontoTotal    := ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 8];



   if nrOPeradorLogistico=0 then
      nrOPeradorLogistico:=1;




   NrVerba                :=0;
   if trim(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 9])<>'' then
      NrVerba                :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 9];

   _edtNrVerba.Text :=IntToStr(NrVerba);

   nrOPeradorLogistico    :=1;
   if trim(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 10])<>'' then
      nrOPeradorLogistico    := ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 10];



    _cdsEmpresa.First;

    qtCalculada:=0;
    qtPedidoOriginal := qtPedido;
    while not _cdsEmpresa.Eof do
    begin

     idSemCrossDocking:='N';

     cdEmpresa:=_cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger;

     pcPedido :=_cdsEmpresa.FieldByName('PC_PEDIDO').AsFloat;

     nrEmpresaOCD:=cdEmpresa;



     Mercadoria        := GetMercadoriaNova(nrProduto,
                                         dgProduto,
                                         0,
                                         nrEmpresaOCD,

                                        1,cdEan);


     // Calculando a quantidade Pedido pelo % Informado

     qtCalculada := qtPedidoOriginal  * (pcPedido/100);


     qtPedido   := StrToIntDef(FormatFloat('0000000',qtCalculada),0);


     if Mercadoria<>nil then
     begin
       idCrossDocking    :='N';
        if _chkCrossDocking.Checked then
           idCrossDocking    :=Mercadoria.idCrossdocking;





        nrEmpresaOCD:=cdEmpresa;
        nrSomaLeadTimeOCD:=0;
        if (idCrossDocking='S')  then
        begin
         nrEmpresaOCD:=Mercadoria.nrCrossdocking;
         nrSomaLeadTimeOCD:=5;


          MercadoriaCross:=GetMercadoriaNova(nrProduto,
                                             dgProduto,
                                             0,
                                            nrEmpresaOCD,
                                            1,cdEan);

          if MercadoriaCross=nil then
          begin
            idSemCrossDocking:='S';
          end;



        end;

        nrCompradorPedido := Mercadoria.nrComprador;
        vlPrecoLista:=Mercadoria.vlPrecoCompra;


       FiltraVenda(Mercadoria.nrProduto,cdEmpresa,0);

       DadosMedia := CalculaMedia(cdEmpresa);

       vlMediaDiaCD:=DadosMedia.vlMediaDiaNova;


       DadosPendencia := setPendenciaCD(Mercadoria.nrProduto, cdEmpresa);

     if _cbxCaixaFechada.ItemIndex=1 then

     if _cbxCaixaFechada.ItemIndex=0 then
     begin

      nrQtdadeSusgetaoPossivel := SugestaoPossivel(Mercadoria.qtEmbalagemCompra,qtPedido );

      if (qtPedido>0) and (nrQtdadeSusgetaoPossivel=0) and (Mercadoria.qtEstoque+DadosPendencia.qtPendente=0) and (vlMediaDiaCD>0) then
           nrQtdadeSusgetaoPossivel :=Mercadoria.qtEmbalagemCompra;
       qtPedido:=nrQtdadeSusgetaoPossivel;
     end;



      nrDiasEstoqueComPedido :=CalculaNrDiasEstoque(strtoint(formatfloat('0000000000',qtPedido)),
                                                          Mercadoria.qtEstoque,
                                                          DadosPendencia.qtPendente,
                                                          0,
                                                          vlMediaDiaCD );




        vlPrecoUnitario:=Mercadoria.vlPrecoCompra;
       _stbMensagem.Panels[0].Text:=FormatFloat('0000',lInha)+' de '+FormatFloat('0000',nrLinhas);
       _stbMensagem.Repaint;


       if (pcDescontoAdicional=0) and (vlPrecoUnitarioDesconto>0) then
           pcDescontoAdicional:= Arredondar((1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100,2);
       if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
          pcDescontoAdicional:= Arredondar((1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100,2);


     if vlPrecoUnitarioDesconto>vlPrecoUnitario then
     begin
        pcDescontoAdicional:=0;
        NrVerba:=0;
        pcDescontoTotal:=-1;
        vlPrecoUnitarioDesconto:=0;

     end;
           precoLista := GetPrecoItem(nrProduto,
                                      nrEmpresaOCD,
                                      vlPrecoLista,
                                      1,
                                      'S',
                                      0,
                                      nrListaPrecoExcecao); { ,nrListaPreco };



             if (pcDescontoTotal>Mercadoria.pcDescontoPadrao) and (pcDescontoAdicional=0) then
             begin
                 pcDescontoAdicional:= pcDescontoTotal - Mercadoria.pcDescontoPadrao;
                 if NrVerba=0 then
                    NrVerba:=GetNumeroVerba(0,Mercadoria.nrLaboratorio);
             end;


             PrecoItem := CalculaPrecoLiquido(vlPrecoUnitario,
                                           Mercadoria.vlPrecoVenda,
                                           Mercadoria.pcRepasseCompra,
                                           Mercadoria.pcDescontoPadrao,
                                           pcDescontoAdicional,
                                           Mercadoria.pcCreditoICMS,
                                           Mercadoria.pcIpiProduto,
                                           precoLista.PcIPILista,
                                           precoLista.pcReajustePreco,
                                           1,
                                           precoLista.nrListaPreco,
                                           'N',
                                           Mercadoria.idForcaRepasse,
                                           Mercadoria.idIpiLiquidoComRepasse,
                                           Mercadoria.idIpiLiquidoSemRepasse,
                                           Mercadoria.idIpiBrutoComRepasse,
                                           Mercadoria.idIpiBrutoSemRepasse,
                                           Mercadoria.idTipoListaFiscal,
                                           DadosFornecedor.idUnidadeFederacao,
                                           Mercadoria.idSuperfulo,
                                           Mercadoria.idIcmDestacado,
                                           Mercadoria.idReduzIcms,
                                           Mercadoria.idPisCofins);






      if (Mercadoria<>nil) and (vlPrecoUnitario>0) and (Mercadoria.idSituacaoMercadoriaCompra='A')     then
          CadastraTabelaPreco(0,     //PnrLista,
                              Mercadoria.cdProduto,    // PnrProduto,
                              Mercadoria.qtEmbalagemCompra,    // PnrQtdEmbalagem,
                              qtPedido,    // PnrQtdPedido: Integer;
                              0,    // PvlCaixaFecha,
                              0,    // PvlCaixaFechaComDesconto,
                              Mercadoria.vlPrecoCompra,    // PvlUnitario,
                              vlPrecoUnitarioDesconto,    //  PvlUnitarioComDesconto,
                              Mercadoria.pcDescontoPadrao,     // PpcDesconto,
                              pcDescontoAdicional,    // PpcDescontoAdicional: Double;
                              pcDescontoTotal,//  % Desconto Total
                              cdEmpresa,     //  PcdEmpresa,
                              NrVerba,     // PnrVerba: Integer;
                              nrOPeradorLogistico,// OPerador Logistico
                              Mercadoria.nmProduto,     // PnmProduto,
                              Mercadoria.dsApresentacao ,    // PdsApresentacao:String
                              idCrossDocking,
                              Mercadoria.nrProduto,
                              nrSomaLeadTimeOCD,
                              Mercadoria.qtEstoque,
                              DadosPendencia.qtPendente,
                              Mercadoria.qtEmbalagemCompra,
                              DadosFornecedor.nrDiasLeadTime,
                              nrDiasEstoqueComPedido,
                              Mercadoria.idCurva,
                              Mercadoria.pcCreditoICMS,
                              precoLista.PcIPILista,
                              vlMediaDiaCD,
                              nrEmpresaOCD,
                              idSemCrossDocking);
      end;
     _cdsEmpresa.Next;
   end;

    Inc(Linha); // move para a pr?xima linha
    _gaPlanilha.Progress:=Linha;
  end;

  // move para o primeiro registro ap?s todas as inser??es
  DataSet.First;
  DataSet.Open;
  DataSet.EnableControls;

  //AtualizaListaPrecoBase(DataSet);

  // habilita os controles para navega??o
end;




procedure T_frmImportaPedidoFornecedor.CarregaEmpresa;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

      with stQry do
      begin
        Add('SELECT  CD_EMPRESA,ID_UNIDADE_FEDERACAO,NM_EMPRESA,''N'' AS ID_SELECIONADO,100.00 AS PC_PEDIDO');
        Add('FROM ACESSO.DC_EMPRESA WHERE ID_EMPRESA_FISICA=''S''');
        Add('order by CD_EMPRESA')
      end;

      stQry.SaveToFile('c:\temp\qryEmpresa.sql');

      with _cdsEmpresa do
      begin
        close;
        CommandText := stQry.Text;
        // if nrEmpresa>0 then
        // Params.ParamByName('PnrEmpresa').AsInteger := nrEmpresa;
        open;
        First
      end;
      // _cbxEmpresa.Items.Add(FormatFloat('00',0)+' - '+'GERAL');

      if not _cdsEmpresa.IsEmpty then
        setGridEmpresa(_cdsEmpresa);

      // _cbxEmpresa.ItemIndex:=0;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;


procedure T_frmImportaPedidoFornecedor.setGridEmpresa(PTabela: TClientDataSet);
begin
  TIntegerField(_cdsEmpresa.FieldByName('CD_EMPRESA')).DisplayLabel := 'Nr.CD.';
  TIntegerField(_cdsEmpresa.FieldByName('CD_EMPRESA')).DisplayWidth := 3;
  TIntegerField(_cdsEmpresa.FieldByName('CD_EMPRESA')).ReadOnly:=TRUE;

  TStringField(_cdsEmpresa.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayLabel := 'UF';
  TStringField(_cdsEmpresa.FieldByName('ID_UNIDADE_FEDERACAO')).DisplayWidth := 02;
  TStringField(_cdsEmpresa.FieldByName('ID_UNIDADE_FEDERACAO')).ReadOnly := TRUE;


  TFLOATField(_cdsEmpresa.FieldByName('PC_PEDIDO')).DisplayLabel := '% Pedido.';
  TFLOATField(_cdsEmpresa.FieldByName('PC_PEDIDO')).DisplayWidth := 6;
  TFLOATField(_cdsEmpresa.FieldByName('PC_PEDIDO')).DisplayFormat := '##0.00';

  TStringField(_cdsEmpresa.FieldByName('NM_EMPRESA')).DisplayLabel := 'Nome CD';
  TStringField(_cdsEmpresa.FieldByName('NM_EMPRESA')).DisplayWidth := 30;
  TStringField(_cdsEmpresa.FieldByName('NM_EMPRESA')).ReadOnly := TRUE;

  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).DisplayLabel := 'Sel.';
  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).DisplayWidth := 03;
  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).Visible := false;
//  TStringField(_cdsEmpresa.FieldByName('ID_SELECIONADO')).ReadOnly := TRUE;

end;



FUNCTION T_frmImportaPedidoFornecedor.SetEmpresaSelecionadas(PTabela: TClientDataSet)
  : TDadosEmpresa;
var
  stcdSelecionado: String;
  cdMaximo: Integer;
begin
  stcdSelecionado := '';
  cdMaximo := 1;
  Result.stEmpresa := '';
  Result.stUF := '';
  if PTabela.Active then
  begin
    with PTabela do
    begin
      Filtered := false;
      filter := 'ID_SELECIONADO=''S''';
      Filtered := true;
      First;
    end;
    while not PTabela.eof do
    begin
      if cdMaximo < PTabela.FieldByName('CD_EMPRESA').AsInteger then
        cdMaximo := PTabela.FieldByName('CD_EMPRESA').AsInteger;

      if stcdSelecionado = '' then
      begin
        Result.stEmpresa := FormatFloat('00', PTabela.FieldByName('CD_EMPRESA').AsInteger);
        Result.stUF := QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO').AsString);
        stcdSelecionado := Result.stUF;
      end
      else
      begin
        Result.stEmpresa := Result.stEmpresa + ',' +
        FormatFloat('00', PTabela.FieldByName('CD_EMPRESA').AsInteger);
        Result.stUF := Result.stUF + ',' +
                       QuotedStr(PTabela.FieldByName('ID_UNIDADE_FEDERACAO').AsString);
      end;

      PTabela.Next;
    end;
   // SetLength(PedidoEmpresa, cdMaximo + 1);
    PTabela.Filtered := false;
  end;

end;



function T_frmImportaPedidoFornecedor.CadastraTabelaPreco(PnrLista,
                                                           PcdProduto,
                                                           PnrQtdEmbalagem,
                                                           PnrQtdPedido: Integer;
                                                           PvlCaixaFecha,
                                                           PvlCaixaFechaComDesconto,
                                                           PvlUnitario,
                                                           PvlUnitarioComDesconto,
                                                           PpcDesconto,
                                                           PpcDescontoAdicional,
                                                           PpcDescontoTotal: Double;
                                                           PcdEmpresa,
                                                           PnrVerba,
                                                           PnrOperadorLogistico: Integer;
                                                           PnmProduto,
                                                           PdsApresentacao,
                                                           PidCrossdocking:String;
                                                           PnrProduto:Integer;
                                                           PnrDiasCrossdoking,
                                                           PqtEstoque,
                                                           PqtPendente,
                                                           PqtEmbalagemCompra,
                                                           PnrLeadTime:Integer;
                                                           PnrDiasEstoque:Double;
                                                           PidCurva:String;
                                                           PpcCreditoICMS,
                                                           PpcIPILista,
                                                           PvlMediaDia:DoublE;
                                                           PnrCrossdocking:Integer;
                                                           PidSemCrossdocking:String ): Boolean;

begin

 _cdsPrePedido.open;

 if not _cdsPrePedido.Locate('CD_PRODUTO;CD_EMPRESA',VarArrayOf([PnrProduto,PcdEmpresa]),[])then
 begin
     _cdsPrePedido.append;
     _cdsPrePedidoCD_PRODUTO.AsInteger            :=PcdProduto;
     _cdsPrePedidoNM_PRODUTO.AsString             :=PnmProduto;
     _cdsPrePedidoDS_APRESENTACAO_PRODUTO.AsString:=PdsApresentacao;
     _cdsPrePedidoQT_PEDIDO.AsInteger             :=PnrQtdPedido;
     _cdsPrePedidoPC_DESCONTO_PADRAO.AsFloat      :=PpcDesconto;
     _cdsPrePedidoPC_DESCONTO_ADICIONAL.AsFloat   :=PpcDescontoAdicional;
     _cdsPrePedidoPC_DESCONTO_TOTAL.AsFloat       :=PpcDescontoTotal;
     _cdsPrePedidoVL_PRECO_FORNECEDOR.AsFloat     :=PvlUnitario;
     _cdsPrePedidoVL_PRECO_PEDIDO.AsFloat         :=PvlUnitarioComDesconto;
     _cdsPrePedidoNR_VERBA.AsInteger              :=PnrVerba;
     _cdsPrePedidoCD_EMPRESA.AsInteger            :=PcdEmpresa;
     _cdsPrePedidoNR_MERCADORIA.AsInteger         :=PnrProduto;
     _cdsPrePedidoNR_DIAS_CROSSDOCKING.AsInteger  :=PnrDiasCrossdoking;
     _cdsPrePedidoQT_ESTOQUE.AsInteger            :=PqtEstoque;
     _cdsPrePedidoNR_LEADTIME.AsInteger           :=PnrLeadTime;
     _cdsPrePedidoID_CURVA.AsString               :=PidCurva;
     _cdsPrePedidoPC_CREDITOICMS.AsFloat          :=PpcCreditoICMS;
     _cdsPrePedidoPC_IPI_LISTA.AsFloat            :=PpcIPILista;

     _cdsPrePedidoQT_PENDENTE.AsInteger           :=PqtPendente;
     _cdsPrePedidoQT_EMBALAGEM_COMPRA.AsInteger   :=PqtEmbalagemCompra;

     _cdsPrePedidoNR_DIAS_ESTOQUE.AsFloat         :=PnrDiasEstoque;
     _cdsPrePedidoVL_MEDIA_VENDA.AsFloat          :=PvlMediaDia;
     _cdsPrePedidoID_SEM_CROSSDOCKING.AsString    :=PidSemCrossdocking;







     _cdsPrePedidoID_CROSSDOCKING.AsString:=PidCrossdocking;

     _cdsPrePedidoNR_EMPRESA_OCD.AsInteger:=PcdEmpresa;
     if PidCrossdocking='S' then
     _cdsPrePedidoNR_EMPRESA_OCD.AsInteger:=PnrCrossdocking;

     if PnrVerba>0 then
     _cdsPrePedidoPC_VERBA.AsFloat:=100
     else
      _cdsPrePedidoPC_VERBA.AsFloat:=00;
    _cdsPrePedidoCD_OPERADOR_LOGISTICO.AsInteger:=PnrOperadorLogistico;

     _cdsPrePedido.post;
 end
 else
 begin

 end;
end;


procedure T_frmImportaPedidoFornecedor.SetStatusBar;
 var
  ProgressBarStyle: integer;
begin

  _stbMensagem.Panels[1].Style := psOwnerDraw;
  _gaPlanilha.Parent:=_stbMensagem;
  _gaPlanilha.Height:=_stbMensagem.Height-3;
  _gaPlanilha.BackColor:=clWhite;
  _gaPlanilha.ForeColor:=clBlue;


end;

procedure T_frmImportaPedidoFornecedor.geraPedido(PidStatus:String);
var
  NrPedido,
  NrProduto,
  QtdadePedido,
  nrEmpresa,
  nrEmpresaOCD,
  nrQtdEstoque,
  NrDiasEstoquePedido,
  NrDiasEstoquePendencia,
  nrLeadTime:Integer;


  nrItem,
  nrVerba,
  nrDiasEstoqueComPedido,
  NrDiasEstoque :Integer;
  vlVerba,
  pcVerba,
  pcDescontoAdicional,
  pccreditoIcms,
  PC_REPASSE,
  VL_BASE_VENDA,
  Ppc_ICMS_COMPRA,
  vlMediaDiaCD,
  vlCustoGerencial,
  pcRepasseCompra,
  vlPrecoLista:Double;

  idCurva :String;
  DadosCodigo :TCodigoValido;

begin
     FiltraEmpresa;

     _cdsEmpresa.First;


    _cdsPeEstoque := ListaDiasEstoqueCD('');

    if _cdsPeEstoque <> nil then
      _cdsPeEstoque.open;

     stPedido:=EmptyStr;
     while not _cdsEmpresa.Eof do
     begin
        _cdsPrePedido.First;
        FiltraItenspedido(_cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger);

        if not _cdsPrePedido.IsEmpty then
        begin
           NrPedido := GeraNumeroPedido('C');
           PedidoEmpresa[_cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger]:=NrPedido;
           if _cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger>0 then
             if GeraCapaPedido(NrPedido,_cdsEmpresa.FieldByName('CD_EMPRESA').AsInteger,PidStatus) then
             begin
               if stPedido=EmptyStr then
                  stPedido:=IntToStr(NrPedido)
               else
                  stPedido:=stPedido+','+IntToStr(NrPedido);

             end;



        end;

        nrItem:=0;
        while not _cdsPrePedido.Eof do
        begin
              inc(nritem);
               nrVerba:=_cdsPrePedidoNR_VERBA.AsInteger;
               pcDescontoAdicional:=_cdsPrePedidoPC_DESCONTO_ADICIONAL.AsFloat;
               pcVerba            :=_cdsPrePedidoPC_VERBA.AsFloat;
               NrProduto    := _cdsPrePedidoNR_MERCADORIA.AsInteger ;
               nrEmpresa    := _cdsPrePedidoCD_EMPRESA.AsInteger;
               nrQtdEstoque := _cdsPrePedidoQT_ESTOQUE.AsInteger;
               nrLeadTime   := _cdsPrePedidoNR_LEADTIME.AsInteger;
               cdoperadorLogisticoPedido :=_cdsPrePedidoCD_OPERADOR_LOGISTICO.AsInteger;
               idCurva                   :=_cdsPrePedidoID_CURVA.AsString;
               QtdadePedido              := _cdsPrePedidoQT_PEDIDO.AsInteger ;


               DadosCodigo           :=TransformaStringCodigo(_cdsPrePedidoCD_PRODUTO.AsString);

               NrDiasEstoqueComprador := setDiasEstoque(nrEmpresa);

               FiltraVenda(NrProduto,nrEmpresa,0);

               nrEmpresaOCD := _cdsPrePedidoNR_EMPRESA_OCD.AsInteger;
               if (_cdsPrePedidoID_CROSSDOCKING.AsString='S') and (not _chkCrossDocking.Checked) then
                   nrEmpresaOCD:=_cdsPrePedidoCD_EMPRESA.AsInteger;


              Mercadoria        := GetMercadoriaNova(DadosCodigo.nrCodigo,
                                                     DadosCodigo.nrDigito,
                                                     0,
                                                     nrEmpresaOCD,

                                                      1,'');





       if mercadoria=nil then
       begin

          Mensagem(' Marcadoria n?o encontrada '+#13+
                   _cdsPrePedidoCD_PRODUTO.AsString +' - '+_cdsPrePedidoNM_PRODUTO.AsString +' - '+
                   _cdsPrePedidoDS_APRESENTACAO_PRODUTO.AsString,MB_ICONWARNING);

       end;



       if mercadoria<>nil then
       begin

       DadosPendencia := setPendenciaCD(nrProduto, nrEmpresa);

       DadosMedia := CalculaMedia(nrEmpresa);



        vlMediaDiaCD:=DadosMedia.vlMediaDiaNova;
       if vlMediaDiaCD > 0 then
         begin
           NrDiasEstoque := strtoint(FormatFloat('######0',nrQtdEstoque / vlMediaDiaCD));
           NrDiasEstoquePendencia := strtoint(FormatFloat('######0', (nrQtdEstoque + DadosPendencia.qtPendente) /     vlMediaDiaCD));

          end;

         DadosEstoqueCompra := setParamentroItemCurvaCompra(nrEmpresa,
                                                                 NrDiasEstoque, // PnrDiasEstoque: Integer;
                                                                  idCurva[1]); // : Char):TDadosEstoqueCurva;


          nrDiasEstoqueComPedido :=CalculaNrDiasEstoque(strtoint(formatfloat('0000000000',_cdsPrePedidoQT_PEDIDO.AsInteger)),
                                                          nrQtdEstoque,
                                                          DadosPendencia.qtPendente,
                                                          0,
                                                          vlMediaDiaCD );

           NrDiasEstoquePedido := DadosEstoqueCompra.nrEstoqueMaximo;




           DadosSugestao := CalculoSugestaoIdealNova(nrEmpresa, // PnrEmpresa:Integer;
                                                      DadosEstoqueCompra.nrFrequenciaCompra, // PvlPE,
                                                      0, // PnrDiasAjuste,
                                                      nrLeadTime, // DadosFornecedor.nrDiasLeadTime,//     PLeadTimeCalculo,
                                                      DadosMedia.vlMediaDiaNova, // PvlMediaDiaria: Double;
                                                      nrQtdEstoque, // PnrQuantidadeEstoque,
                                                      DadosPendencia.qtPendente, // PnrQuantidadaPendente,
                                                      DadosEstoqueCompra.nrEstoqueMInimo, // PQtdEstoqueMinimo,
                                                      NrDiasEstoquePedido, // PQtdEstoqueMaximo,
                                                      cdoperadorLogisticoPedido, // PcdOPeradorLogistico:Integer;
                                                      DadosEstoqueCompra.nrFrequenciaCompra,
                                                      idCurva);
                                                    // FrequenciaCompra: Double): TDadosQtdadeSugestao;

//            nrQtdadeSusgetaoPossivel := SugestaoPossivel(NrEmbalagemCompra,DadosSugestao.nrQtdSugerida);

         vlPrecoLista:=Mercadoria.vlPrecoCompra;
         pccreditoIcms:=Mercadoria.pcCreditoICMS;
         vlCustoGerencial:=Mercadoria.vlCustoGerencial;
         pcRepasseCompra :=Mercadoria.pcRepasseCompra;

           precoLista := GetPrecoItem(nrProduto,
                                      nrEmpresaOCD,
                                      vlPrecoLista,
                                      1,
                                      'S',
                                      0,
                                      nrListaPrecoExcecao); { ,nrListaPreco };
            vlPrecoLista := precoLista.vlPrecoBase;

             Ppc_ICMS_COMPRA:=Mercadoria.pcCreditoICMS;  // SS 33688   // SS 33688  alterado 01/09/2020
             //if (PrecoLista.PcIcmsCompra>0) and (dtSistema>=StrToDate('01/12/2016')) then
               //   Ppc_ICMS_COMPRA:=precoLista.PcIcmsCompra;



             PrecoItem := CalculaPrecoLiquido(vlPrecoLista,
                                           Mercadoria.vlPrecoVenda,
                                           Mercadoria.pcRepasseCompra,
                                           Mercadoria.pcDescontoPadrao,
                                           pcDescontoAdicional,
                                           Ppc_ICMS_COMPRA,
                                           Mercadoria.pcIpiProduto,
                                           precoLista.PcIPILista,
                                           precoLista.pcReajustePreco,
                                           1,
                                           precoLista.nrListaPreco,
                                           'N',
                                           Mercadoria.idForcaRepasse,
                                           Mercadoria.idIpiLiquidoComRepasse,
                                           Mercadoria.idIpiLiquidoSemRepasse,
                                           Mercadoria.idIpiBrutoComRepasse,
                                           Mercadoria.idIpiBrutoSemRepasse,
                                           Mercadoria.idTipoListaFiscal,
                                           DadosFornecedor.dsUnidadeFederacao,
                                           Mercadoria.idSuperfulo,
                                           Mercadoria.idIcmDestacado,
                                           Mercadoria.idReduzIcms,
                                           Mercadoria.idPisCofins);


                {
                 Calculando a verba
                }
                vlVerba :=0;
                if (nrVerba > 0) and(pcDescontoAdicional>0) then
                begin
                  vlVerba := CalculaPcVerba(pcVerba,
                                           PrecoItem.vlVerba,
                                           PrecoItem.vlPrecoCusto,
                                           Mercadoria.pcIpiProduto,
                                           0,
                                            precoLista.PcIcmsCompra,
                                            Mercadoria.nrProduto,
                                            Mercadoria.nrTipoProduto,
                                            QtdadePedido,
                                            Mercadoria.nrLaboratorio,
                                            Mercadoria.idPis);
                end;

             if nrEmpresaOCD>0 then
              GravaItemPedidoAtual(NrPedido, // NUMBER(6)
                                   NrProduto, // NROM_Y ,//NUMBER(6)
                                  _cdsPrePedidoQT_PEDIDO.AsInteger, // QUAY_Y ,//NUMBER(7)
                                  0, // CHEY_Y :Integer;//NUMBER(7)
                                  _cdsPrePedidoPC_DESCONTO_PADRAO.AsFloat, // ABTY_Y :Double;//NUMBER(5,2)
                                  PidStatus, // SITY_Y :String;//CHAR(1)
                                  DadosFornecedor.nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
                                  PrecoItem.vlPrecolIquido, // PUNY_Y ,//NUMBER(17,6)
                                  PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
                                  _cdsPrePedidoPC_DESCONTO_ADICIONAL.AsFloat, // DADY_Y ,//NUMBER(5,2)
                                  nrItem, // DFIY_Y ,   //NUMBER(5,2)
                                  PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
                                  _cdsPrePedidoNR_VERBA.AsInteger, // NRVV_Y :Integer;//NUMBER(6)
                                  0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
                                  0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
                                  'N', // ID_MARGEM,//CHAR(1)
                                  'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
                                  _cdsPrePedidoPC_VERBA.AsFloat, // PC_VERBA,//  NUMBER(5,2)
                                  vlVerba, // VL_VERBA:Double;//NUMBER(13,2)
                                  0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6) Ultilizando campo Para marcar o Cd Destino
                                  0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
                                  0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
                                  _cdsPrePedidoCD_OPERADOR_LOGISTICO.AsInteger, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
                                  nrDiasEstoqueComPedido, // NR_DIAS_ESTOQUE,//NUMBER(3)
                                  strtoint(formatfloat('00000',DadosSugestao.nrQtdSugerida)), // QT_SUGERIDA :Integer;//NUMBER(7)
                                  vlMediaDiaCD, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
                                  PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
                                  PrecoItem.pcMundancaPreco,
                                  nrEmpresaOCD,
                                  Ppc_ICMS_COMPRA ,
                                  _cdsPrePedidoPC_IPI_LISTA.AsFloat,
                                  precoLista.pcRepasse,
                                  precoLista.vlBaseVenda,
                                  precoLista.pcIcmsVenda,
                                  precoLista.PcIcmsCompra,
                                  DadosSugestao.NrDiasInformado,
                                  vlCustoGerencial);

          end;

          _cdsPrePedido.Next;
        end;
       _cdsEmpresa.Next;
     end;

end;


procedure T_frmImportaPedidoFornecedor.FiltraEmpresa;
begin
    with _cdsEmpresa do
    begin
      filter :='ID_SELECIONADO=''S''';
      Filtered:=true;
    end;
end;

procedure T_frmImportaPedidoFornecedor.Abreplanilha;
begin
  _edtArquivo.Clear;
  _cdsPrePedido.Close;
  _cdsPrePedido.CreateDataSet;
  _edtArquivo.Text := _opdLocalizaArquivo.FileName;
   FiltraEmpresa;
   if _cdsEmpresa.IsEmpty then
   begin
      Mensagem('Selecione o CD''s para Pedido',MB_ICONWARNING);
      _cdsEmpresa.Filtered:=false;
      exit;
   end;
   if (trim(_edtArquivo.Text)<>'') and (not _cdsEmpresa.IsEmpty) then
       AbreExcel(_edtArquivo.Text);

  _cdsPrePedido.Open;



end;

procedure T_frmImportaPedidoFornecedor.FiltraItenspedido(PnrEmpesa:integer);
begin
    with _cdsPrePedido do
    begin
      filter :='CD_EMPRESA='+IntToStr(PnrEmpesa)+' and qt_pedido>0';
      Filtered:=true;
    end;
end;



procedure T_frmImportaPedidoFornecedor.BitBtn1Click(Sender: TObject);
begin
 Abreplanilha;
end;

procedure T_frmImportaPedidoFornecedor._btnConfirmaClick(Sender: TObject);
begin
  stPedidoFechando:=stPedido;
  DadosFornecedorFechaPedido:=DadosFornecedor;
//  DadosFrequenciaCompraFechaPedido:=DadosFrequenciaCompra;
  NrDiasEstoqueCompradorFechaPedido:=NrDiasEstoqueComprador;
  cdoperadorLogisticoPedidoFecha:=cdoperadorLogisticoPedido;
  Application.CreateForm(T_frmFinalizaPedidoExcel, _frmFinalizaPedidoExcel);
  FormPos(_frmFinalizaPedidoExcel, 2, 2);
  _frmFinalizaPedidoExcel.ShowModal;
  close;
  //_frmFinalizaPedidoExcel.Free;
  FreeAndNil(_frmFinalizaPedidoExcel);
end;

function  T_frmImportaPedidoFornecedor.GeraCapaPedido(PnrPedido,PnrEmpresa:Integer;Pidstatus:String):Boolean;
var
 nrLeadTime,
 pcGeracaoVerba:Double;
 cdPrazoPagamento,
 cdoperadorLogisticoPedido,
 nrGeracaoVerba,
 NrDiasEstoqueComprador :integer;

 TipoPedido:String;

begin
      FillChar(DadosLeadTime,sizeof(DadosLeadTime),0);
      DadosLeadTime := SetLeadTime(PnrEmpresa,'N');
      if DadosLeadTime.vlLeadTime<=0  then
         DadosLeadTime.vlLeadTime:=DadosFornecedor.nrDiasLeadTime;


      nrLeadTime := DadosLeadTime.vlLeadTime+0;
      tipopedido:='Importado';
      cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);
      cdoperadorLogisticoPedido:=StrToIntDef(_edtNrVerba.Text,0);
      pcGeracaoVerba:=DadosFornecedor.pcGeracaoVerba;
      nrGeracaoVerba:=DadosFornecedor.nrGeracaoVerba;

      NrDiasEstoqueComprador := setDiasEstoque(PnrEmpresa);



       Result:=true;
      if not GravaCapaPedido(PNrPedido, // NROP_P,//  NUMBER(6)
        DadosFornecedor.nrFornecedor, // LABP_P :Integer;// NUMBER(6)
        dtSistema, // DATP_P :Tdate;// DATE
        0, // ABTP_P,      //  NUMBER(5,2)
        0, // DESP_P:Double;// NUMBER(5,2)
        Pidstatus, // SITP_P :String;//CHAR(1)
        DadosFornecedor.nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
        dtSistema + nrLeadTime, // PREP_P          //DATE
        ' ', // CHAR(40)
        TipoPedido, // SNRP_P           //  CHAR(10)
        0, // FLAP_P ,         //NUMBER(1)
        cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
        nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
        strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
        dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
        'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
        cdoperadorLogisticoPedido,
        // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
        NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
        DadosFornecedor.dtAgenda,
        // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
        dtSistema, // DT_DIGITACAO :Tdate;//  DATE
        0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
        0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
        strtodate('01/01/2039'),
        nrCompradorPedido,
        PnrEmpresa,
        0,
        pcGeracaoVerba,
        nrGeracaoVerba,
        NrDiasEstoqueComprador,
        PnrEmpresa,
        'N',0,0) then
      begin
        Mensagem('Erro ao criar Capa Pedido', MB_ICONERROR);
        Result:=false;
        close;
      end;

end;



function T_frmImportaPedidoFornecedor.SetLeadTime(PnrEmpresa: Integer; PidTermoLabil: String): TDadosLeadTime;
begin
   Result.vlLeadTime := 0;
   Result.vlDesvioPadrao := 0;

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


function T_frmImportaPedidoFornecedor.ListaDiasEstoqueCD(PstEmpresa: String)
  : TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
begin
  _cdsTemp := TClientDataSet.Create(nil);
  _cdsTemp.RemoteServer := _dm._LocalConexao;
  _cdsTemp.ProviderName := '_dspGenerica';
  try
    stQry := TStringList.Create;
    with stQry do
    begin
      Add('SELECT CD_EMPRESA,ID_UNIDADE_FEDERACAO,');
      Add('0 NR_DIAS_ESTOQUE FROM ACESSO.DC_EMPRESA');
      Add('WHERE id_empresa_fisica=''S''');
      add('AND ID_SITUACAO_EMPRESA=''A''');
      if trim(PstEmpresa) <> '' then
        Add('AND cd_empresa in(' + PstEmpresa + ')');

    end;

    Result := nil;
    stQry.SaveToFile('C:\temp\qryPEDiasEstoque.sql');
    with _cdsTemp do
    begin
      close;
      CommandText := stQry.Text;
      open;
    end;
    if not _cdsTemp.IsEmpty then
    begin
      _cdsTemp.IndexFieldNames := 'CD_EMPRESA;ID_UNIDADE_FEDERACAO';
      Result := _cdsTemp;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;


function T_frmImportaPedidoFornecedor.setDiasEstoque(PnrEmpresa: Integer): Integer;
begin
  Result := 0;
  if _cdsPeEstoque.Locate('CD_EMPRESA', PnrEmpresa, []) then
    Result := _cdsPeEstoque.FieldByName('NR_DIAS_ESTOQUE').AsInteger;
end;



function T_frmImportaPedidoFornecedor.GetPrecoItem(PnrProduto,
                                       PcdEmpresa: Integer;
                                       PvlPrecoFornecedor,
                                       PpcDescontoAbatimento: Double;
                                       PIdPrecoAtual: Char;
                                       PidPedidoBloqueado,
                                       PnrLIstaPrecoAtiva: Integer): TListaPreco;
Var
  DadosListaPreco: TListaPrecoAtiva;
begin
  with _cdsTabelaPreco do
  begin
    Filtered := false;
    filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' AND CD_EMPRESA=' + IntToStr(PcdEmpresa);
    Filtered := true;
    // Params.ParamByName()
  end;
  Result.vlPrecoLista := PvlPrecoFornecedor;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;
  Result.PcDescontoLista := 0;
  Result.PcIcmsCompra := 0;
  Result.pcIcmsVenda     := 0;
  Result.vlBaseVenda     := 0;

  if not _cdsTabelaPreco.IsEmpty then
  begin
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat > 0 then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;

      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
      Result.pcIcmsVenda     := _cdsTabelaPreco.FieldByName('PC_ICMS_VENDA').AsFloat;
      Result.vlBaseVenda     := _cdsTabelaPreco.FieldByName('VL_BASE_VENDA').AsFloat;


    if Result.PcIcmsCompra>0 then
       Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));



    end;
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat = 0 then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
      Result.vlPrecoBase := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA_ANTERIOR').AsFloat;
      Result.PcIPILista := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
      Result.pcIcmsVenda     := _cdsTabelaPreco.FieldByName('PC_ICMS_VENDA').AsFloat;
      Result.vlBaseVenda     := _cdsTabelaPreco.FieldByName('VL_BASE_VENDA').AsFloat;
      if Result.PcIcmsCompra>0 then
         Result.pcRepasse:=STRTOFLOAT(FormatFloat('00000.000',(100-(100-Result.pcIcmsVenda)/(100-Result.pcIcmscompra)*100)));
    end;

    if PidPedidoBloqueado = 1 then
    begin

    end;

    if PIdPrecoAtual = 'N' then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_LISTA_ANTERIOR').AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := _cdsTabelaPreco.FieldByName('PC_MUDANCA_PRECO').AsFloat;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
    end;
    if Result.pcReajustePreco < 0 then
      Result.pcReajustePreco := 0;

    if PnrLIstaPrecoAtiva > 0 then
    begin
      DadosListaPreco := SetListaPrecoAtiva(PnrLIstaPrecoAtiva, PnrProduto,
        PcdEmpresa);
      if (DadosListaPreco.vlPrecoLista > 0) then
      begin
        Result.nrListaPreco    := PnrLIstaPrecoAtiva;
        Result.vlPrecoBase     := DadosListaPreco.vlPrecoLista;
        Result.PcDescontoLista := DadosListaPreco.pcDescontoAdicional;
        Result.vlPrecoLista    := DadosListaPreco.vlPrecoComdesconto;
        Result.nrVerba         := DadosListaPreco.nrVerba;
      end;
      if (DadosListaPreco.vlPrecoLista = 0) and
        (DadosListaPreco.pcDescontoAdicional > 0) then
      begin
        Result.PcDescontoLista := DadosListaPreco.pcDescontoAdicional;
        Result.nrVerba := DadosListaPreco.nrVerba;
      end;

    end;

  end;
end;


function T_frmImportaPedidoFornecedor.LiberaCompraItem(PdtInativacaoFutura,
                                           PdtBloqueioCompra:Tdate;
                                           PidMostraMensagem,
                                           PidLiberaCompra,
                                           PidVendaAutorizada:Boolean):Boolean;
begin
    Result:=true;
   if FormatDateTime('dd/mm/yyyy',PdtInativacaoFutura)<>'01/01/2039' then
   begin
    if PidMostraMensagem then
      Mensagem('Produto Marcado para Ser Inativado...'+#13+
               'N?o pode ser comprado!!',MB_ICONWARNING);
     Result:=false;
     exit;
   end;
  if (FormatDateTime('dd/mm/yyyy',PdtBloqueioCompra)<>'01/01/2039') and
     ( FormatDateTime('dd/mm/yyyy',PdtBloqueioCompra)<FormatDateTime('dd/mm/yyyy',dtSistema)) then
   begin
     if PidMostraMensagem then
      Mensagem('Produto Bloqueado Para Compra...'+#13+
               'N?o pode ser comprado!!',MB_ICONWARNING);
     Result:=PidLiberaCompra;
   end;
  if not PIdVendaAutorizada then
   begin
     if PidMostraMensagem then
      Mensagem('Produto Com a Venda N?o Autorizada...'+#13+
               'N?o pode ser comprado!!',MB_ICONWARNING);
     Result:=PIdVendaAutorizada;
   end;


end;


function T_frmImportaPedidoFornecedor.SetListaPrecoAtiva(PnrLista,
                                                         PnrProduto,
                                                         PnrEmpresa: Integer): TListaPrecoAtiva;
begin

  Result.vlPrecoLista := 0;
  Result.vlPrecoComdesconto := 0;
  Result.PcIcmsCompra := 0;
  Result.pcDescontoAdicional := 0;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;

  if _cdsItemListaPreco.Locate
    ('CD_PRECO_FORNECEDOR_EXCECAO;CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrLista, PnrProduto, PnrEmpresa]), []) then
  begin

    Result.vlPrecoLista := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA').AsFloat;
    Result.vlPrecoComdesconto := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO').AsFloat;
    Result.pcDescontoAdicional := _cdsItemListaPreco.FieldByName('PC_DESCONTO_COMPRA').AsFloat;
    Result.nrListaPreco := PnrLista;
    Result.nrVerba := _cdsItemListaPreco.FieldByName('NR_VERBA').AsInteger;

  end;

end;



function T_frmImportaPedidoFornecedor.setPendenciaCD(nrProduto, cdEmpresa: Integer)
  : TDadosPendenciaPedido;
begin
  Result.QtPedido := 0;
  Result.qtAtendida := 0;
  Result.qtPendente := 0;
  Result.qtProcessada := 0;
  Result.vlPedido := 0;
  Result.vlPendente := 0;
  if _cdsPendencia <> nil then
  begin
    if _cdsPendencia.Locate('CD_MERCADORIA;CD_EMPRESA',
      VarArrayOf([nrProduto, cdEmpresa]), []) then
    begin
      Result.QtPedido := _cdsPendencia.FieldByName('QT_PEDIDO').AsInteger;;
      Result.qtAtendida := _cdsPendencia.FieldByName('QT_ATENDIDA').AsInteger;
      Result.qtPendente := _cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
     // Result.vlPedido := _cdsPendencia.FieldByName('VL_PENDENTE').AsFloat;
      Result.qtProcessada := _cdsPendencia.FieldByName('QT_PROCESSADA')  .AsInteger;
    end;
  end;
end;



function T_frmImportaPedidoFornecedor.CalculaMedia(PnrEmpresa: Integer): TDadosMedia;
var
  I: Integer;
  nrAcumulaVenda: Integer;
  nrAcumulaNrDias, nrAcumulaNrDiasVenda, nrAcumulaNrDiasEstoqueZero,
    nrAcumulaNrMes: Integer;
  vlMediaDiaNova, vlMediaDiaNovaAcumulada, vlDesvioPadraoAcumulado: Double;
    mesPesquisa: Integer;
  mes, Dia, Ano: Word;



begin
  nrAcumulaVenda := 0;
  nrAcumulaNrDias := 0;
  nrAcumulaNrMes := 0;
  nrAcumulaNrDiasEstoqueZero := 0;
  nrAcumulaNrDiasVenda := 0;
  vlMediaDiaNova := 0;
  vlMediaDiaNovaAcumulada := 0;
  vlDesvioPadraoAcumulado := 0;
  DecodeDate(Date, Ano, mes, Dia);

  nrAcumulaNrMes := 1;
  mesPesquisa:=13;

  if dia=1 then
     mesPesquisa:=mes-1;

//  vlVendaCd := VendaAnual[nrEmpresa, mesPesquisa];


  nrAcumulaNrDiasVenda := nrAcumulaNrDiasVenda + nrDiasMes[PnrEmpresa, mesPesquisa];
  vlMediaDiaNovaAcumulada := vlMediaDiaNovaAcumulada + MediaAnual[PnrEmpresa, mesPesquisa];
  vlDesvioPadraoAcumulado := vlDesvioPadraoAcumulado + DesvioPadraoAnual[PnrEmpresa, mesPesquisa];

  if (nrAcumulaNrMes > 0) and
    ((nrAcumulaNrDiasVenda - nrAcumulaNrDiasEstoqueZero) > 0) then
  begin
    Result.vlMediaMes :=
      ((nrAcumulaVenda / (nrAcumulaNrDiasVenda - nrAcumulaNrDiasEstoqueZero)) *
      nrAcumulaNrDiasVenda) / nrAcumulaNrMes;
    if (nrAcumulaNrDiasVenda - nrAcumulaNrDias) > 0 then
    begin
      Result.vlMediaDia := nrAcumulaVenda /
        (nrAcumulaNrDiasVenda - nrAcumulaNrDiasEstoqueZero);
    end;
    vlMediaDiaNova := vlMediaDiaNovaAcumulada / nrAcumulaNrMes;
    Result.vlDesvioPadrao := vlDesvioPadraoAcumulado / nrAcumulaNrMes;
  end;
  Result.vlMediaDiaNova := vlMediaDiaNova;
  Result.vlMediaMesNova := vlMediaDiaNova * nrAcumulaNrDiasVenda;
  Result.stCalculoNovo := FormatFloat('###,##0.00', vlMediaDiaNovaAcumulada) +
    '/' + FormatFloat('###,##0', nrAcumulaNrMes) + ' = ' +
    FormatFloat('###,##0.00', vlMediaDiaNova);

  Result.stCalculo := FormatFloat('###,##0', nrAcumulaVenda) + '/' + '(' +
    FormatFloat('###,##0', nrAcumulaNrDiasVenda) + ' - ' +
    FormatFloat('###,##0', nrAcumulaNrDiasEstoqueZero) + ')=' +
    FormatFloat('###,##0.000', Result.vlMediaDia);
end;



function T_frmImportaPedidoFornecedor.setParamentroItemCurvaCompra(PnrEmpresa,
                                                       PnrDiasEstoque: Integer;
                                                       PidCurva: Char): TDadosEstoqueCurva;
var
  vlTempo: Integer;
begin
  try
    if trim(PidCurva) = '' then
      PidCurva := 'A';
    Result.nrFrequenciaCompra := PnrDiasEstoque;
    Result.nrEstoqueMInimo := 0;
    Result.nrEstoqueMaximo := 0;
    if _cdsItensCurva.Locate('CD_EMPRESA;ID_CURVA_MERCADORIA',VarArrayOf([PnrEmpresa, PidCurva]), []) then
    // if not _cdsParamentoCompra.isEmpty then
    begin
      Result.nrFrequenciaCompra := _cdsItensCurva.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsFloat;
      Result.nrEstoqueMaximo    := _cdsItensCurva.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger;
      Result.nrEstoqueMInimo := _cdsItensCurva.FieldByName('QT_ESTOQUE_MINIMO').AsInteger;
      vlTempo := StrToIntDef(FormatFloat('###0',Result.nrFrequenciaCompra * 3), 0);

    end;
    if PnrDiasEstoque > 0 then
      Result.nrEstoqueMaximo := PnrDiasEstoque;

  except
    on E: Exception do
    begin
      trataerro(E.Message, 'Erro ao Acessar Para paramentro de Compra...');
    end;

  end;
end;



procedure T_frmImportaPedidoFornecedor.SetTabelasItensCurva(PnrFornecedor: Integer; PnrEmpresa: String);
var
  stQry: TStringList;
begin
  try
    try
      stQry := TStringList.Create;
      with stQry do
      begin
        Add('SELECT CM.CD_EMPRESA,');
        Add('GFM.ID_CURVA_MERCADORIA,COUNT(CM.CD_MERCADORIA) NR_ITEM,');
        Add('GFM.QT_DIAS_FREQUENCIA_COMPRA,GFM.QT_ESTOQUE_MAXIMO, GFM.QT_ESTOQUE_MINIMO');
        Add('FROM');
        Add('PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM,');
        Add('PRDDM.DC_GRUPO_FORNECEDOR GF,');
        Add('PRDDM.DC_COMPRA_MERCADORIA CM ,');
        Add('PRDDM.DC_MERCADORIA M');
        Add('WHERE');
        Add('GFM.ID_CURVA_MERCADORIA       = CM.ID_CURVA_MERCADORIA');
        Add('AND GFM.CD_GRUPO_CURVA_FABRICANTE = GF.CD_GRUPO_CURVA_FABRICANTE');
        Add('AND CM.CD_GRUPO_FORNECEDOR        = GF.CD_GRUPO_FORNECEDOR');
        Add('AND CM.ID_CURVA_MERCADORIA        = GFM.ID_CURVA_MERCADORIA');
        Add('AND CM.CD_MERCADORIA              = M.CD_MERCADORIA');
        Add('AND CM.ID_SITUACAO_MERCADORIA    = ''A''');
        Add('AND  M.ID_SITUACAO_MERCADORIA    = ''A''');
        Add('AND CM.CD_GRUPO_FORNECEDOR=:PnrForncedor');
        if PnrEmpresa <> '' then
          Add('AND CM.CD_EMPRESA in(' + PnrEmpresa + ')');
        Add('GROUP BY  CM.CD_EMPRESA,GFM.ID_CURVA_MERCADORIA,');
        Add('GFM.QT_DIAS_FREQUENCIA_COMPRA, GFM.QT_ESTOQUE_MAXIMO,');
        Add('GFM.QT_ESTOQUE_MINIMO');
        Add('ORDER BY CD_EMPRESA,GFM.ID_CURVA_MERCADORIA');
      end;
      stQry.SaveToFile('C:\temp\qryItensCruva.sql');
      with _cdsItensCurva do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrForncedor').AsBcd := PnrFornecedor;
        open;
      end;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Abrir Nr. de Itens Curva...');
      end;

    end;
  finally
    FreeAndNil(stQry);
  end;
end;



function T_frmImportaPedidoFornecedor.CalculoSugestaoIdealNova(PnrEmpresa: Integer;
                                                               PvlPE,
                                                               PnrDiasAjuste,
                                                               PLeadTimeCalculo,
                                                               PvlMediaDiaria: Double;
                                                               PnrQuantidadeEstoque,
                                                               PnrQuantidadaPendente,
                                                               PQtdEstoqueMinimo,
                                                               PQtdEstoqueMaximo,
                                                               PcdOPeradorLogistico: Integer;
                                                               PnrFrequenciaCompra: Double;
                                                               PidCurva: String): TDadosQtdadeSugestao;
var
  vlTemp, nrDiasUltimacompra: Double;
  dtUltimaCompra: Tdate;
  qtEstoqueMaximo: Double;
  vlInidiceNSPadrao,
  vlPadrao,
  vlIndicePadrao: Double;
  nrUnidadeMinima,
  //nrUnidadesEstoqueMaximo,
  nrUnidadesRejeitada: Double;
  ConsumEstoqueFuturo,
  ProjecaoEstoqueFuturo,
  ProjecaoEstoqueFuturoProximoPedido,
  loteCompraPeriodoReposicao,
  qtSugerida,
  nrDiasEstoqueFuturo,
  EstoqueFuturo: Double;
  idTesteMediaEDesvio: Boolean;
  vlDesvioEMedia, DiasEstoqueNovo: Double;
  NrDiasInformado:Integer;

begin
  Result.nrQtdSugerida := 0;
  Result.nrQtdSugeridaRejeitada := 0;
  qtEstoqueMaximo:=0;
  qtSeguranca   :=0;


  if PidCurva = 'A' then
    vlInidiceNSPadrao := vlIndiceNivelServico_A;
  if PidCurva = 'B' then
    vlInidiceNSPadrao := vlIndiceNivelServico_B;
  if PidCurva = 'C' then
    vlInidiceNSPadrao := vlIndiceNivelServico_C;
  if PidCurva = 'D' then
    vlInidiceNSPadrao := vlIndiceNivelServico_D;
  if PidCurva = 'E' then
    vlInidiceNSPadrao := vlIndiceNivelServico_E;

 vlIndicePadrao :=0;
 if PnrFrequenciaCompra>0 then
    vlIndicePadrao := 28 / PnrFrequenciaCompra;


  if vlIndicePadrao > 0 then
    vlDesvioEMedia := DadosMedia.vlDesvioPadrao / vlIndicePadrao
  else
    SLEEP(0);

  if vlDesvioEMedia < PvlMediaDiaria then
  begin
    qtSeguranca := vlInidiceNSPadrao *
                  Sqrt((power(DadosMedia.vlDesvioPadrao / vlIndicePadrao,2)* PLeadTimeCalculo)
                  + power(DadosLeadTime.vlDesvioPadrao, 2) * power(PvlMediaDiaria, 2));
  end;
  if vlDesvioEMedia > PvlMediaDiaria then
  begin
    qtSeguranca := vlInidiceNSPadrao *
                   Sqrt((power(PvlMediaDiaria, 2) * PLeadTimeCalculo) +
                   power(DadosLeadTime.vlDesvioPadrao, 2) * power(PvlMediaDiaria, 2));
  end;

  // Somatorio qtSeguranca
  qtSegurancaAcumulada := qtSegurancaAcumulada + qtSeguranca;

  loteCompraPeriodoReposicao := PnrFrequenciaCompra * PvlMediaDiaria;

  qtEstoqueMaximo := qtSeguranca + (PnrFrequenciaCompra  * PvlMediaDiaria);
  // qtMaxima eh usado para Posi??o Grafico
   qtMaxima := qtEstoqueMaximo;

  DiasEstoqueNovo := 0;
  if PvlMediaDiaria > 0 then
    DiasEstoqueNovo := qtEstoqueMaximo / PvlMediaDiaria;



  dtUltimaCompra     := GetUltimaCompra(nrProduto, PnrEmpresa, PcdOPeradorLogistico);
  nrDiasUltimacompra := dtSistema - dtUltimaCompra;


  ConsumEstoqueFuturo   := (PnrFrequenciaCompra + PLeadTimeCalculo) * PvlMediaDiaria;


  ProjecaoEstoqueFuturo := (PnrQuantidadeEstoque + PnrQuantidadaPendente) - ConsumEstoqueFuturo;


  EstoqueFuturo:=qtSeguranca;

  if ProjecaoEstoqueFuturo>=EstoqueFuturo then
     qtSugerida:=0
  else
    qtSugerida  := (qtSeguranca+ConsumEstoqueFuturo)-(PnrQuantidadeEstoque + PnrQuantidadaPendente);

  // Nr. de dias Sugerido Pelo Comprador Ignora calculo e de reposicao
    NrDiasInformado:=StrToIntDef(formatfloat('##0',( PnrFrequenciaCompra+ PLeadTimeCalculo)),0);

  if NrDiasEstoqueComprador > 0 then
  begin
//  ProjecaoEstoqueFuturo := 0;
  NrDiasInformado:=StrToIntDef(formatfloat('##0',(NrDiasEstoqueComprador + PnrDiasAjuste + PLeadTimeCalculo)),0);
    qtSugerida := ((NrDiasEstoqueComprador + PnrDiasAjuste + PLeadTimeCalculo) *
                   PvlMediaDiaria) - (PnrQuantidadeEstoque + PnrQuantidadaPendente);
  end;

  if qtSugerida<0 then
     qtSugerida:=0;
  nrUnidadesRejeitada := 0;

  nrDiasEstoqueFuturo :=0;


 //Calcula dias estoque na Tela de Compras
 //
 ProjecaoEstoqueFuturo:=(PnrQuantidadeEstoque + PnrQuantidadaPendente)-loteCompraPeriodoReposicao;

 nrDiasEstoqueFuturo :=0;
 if PvlMediaDiaria>0  then
    nrDiasEstoqueFuturo := ((qtSugerida+PnrQuantidadeEstoque + PnrQuantidadaPendente) )/PvlMediaDiaria;



  Result.nrQtdSugerida    := qtSugerida;
  Result.NrDiasEstoque    := DiasEstoqueNovo;
  Result.nrQtdSugeridaRejeitada := nrUnidadesRejeitada;
  Result.nrDiasEstoqueFuturo := nrDiasEstoqueFuturo;
  result.qtEstoqueSeguranca  := qtSeguranca;
  Result.NrDiasInformado     :=NrDiasInformado;


end;


function T_frmImportaPedidoFornecedor.GetUltimaCompra(PnrProduto, PnrCD,
  PnrOPerador: Integer): Tdate;
begin
  if _cdsDataUltimaCompra <> nil then
  begin
    with _cdsDataUltimaCompra do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' AND CD_EMPRESA=' +
        IntToStr(PnrCD) + ' AND CD_OPERADOR_LOGISTICO =' +
        IntToStr(PnrOPerador);
      Filtered := true;
    end;
    Result := strtodate('01/01/1899');
    if not _cdsDataUltimaCompra.IsEmpty then
      Result := _cdsDataUltimaCompra.FieldByName('DT_ULTIMA_COMPRA').AsDateTime;
  end;
end;




function T_frmImportaPedidoFornecedor.TotalizaPedidoMultiEmpresa(PstPedido: String;
  PcdEmpresa: Integer; PidSituacao: String): Boolean;
var
  stQry: TStringList;
  cdEmpresa: Integer;
  vlEmpresa: Double;
  unEmpresa: Integer;
begin
  try
    stQry := TStringList.Create;
    stQry.Add('SELECT');
    stQry.Add('CD,');
    stQry.Add('ID_OCD,');
    stQry.Add('NR_UNIDADES_SUGERIDA,');
    stQry.Add('VT_SUGERIDO_BRUTO,');
    stQry.Add('VT_SUGERIDO_LIQUIDO,');
    stQry.Add('NR_UNIDADES_COMPRADA,');
    stQry.Add('VT_COMPRADO_BRUTO,');
    stQry.Add('VT_COMPRADO_LIQUIDO,');
    stQry.Add('CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('(SELECT');
    stQry.Add('ID_UNIDADE_FEDERACAO AS CD,');
    stQry.Add('CASE');
    stQry.Add('WHEN (ITEM.CD_EMPRESA<>CAPA.CD_EMPRESA_DESTINO) THEN ''OCD''');
    stQry.Add('ELSE ''NORM''');
    stQry.Add('END ID_OCD,');
    stQry.Add('Sum(QUAY_Y) AS NR_UNIDADES_COMPRADA,');
    stQry.Add('Sum(QT_SUGERIDA) AS NR_UNIDADES_SUGERIDA,');
    stQry.Add('Sum(QT_SUGERIDA*PFBY_Y) AS VT_SUGERIDO_BRUTO,');
    stQry.Add('Sum(QUAY_Y*PFBY_Y) AS VT_COMPRADO_BRUTO,');
    stQry.Add('Sum(QT_SUGERIDA*puny_y) AS VT_SUGERIDO_LIQUIDO,');
    stQry.Add('Sum(QUAY_Y*PUNY_Y) AS VT_COMPRADO_LIQUIDO,');
    stQry.Add('CAPA.CD_EMPRESA_DESTINO CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
    stQry.Add('ACESSO.DC_EMPRESA CD');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND CD.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND NROP_Y In(' + PstPedido + ')');
    stQry.Add('GROUP BY NROP_Y,ID_UNIDADE_FEDERACAO,ITEM.CD_EMPRESA,QT_BONIFICADA,CAPA.CD_EMPRESA_DESTINO');
    stQry.Add('UNION ALL');
    stQry.Add('SELECT');
    stQry.Add('''Geral'' AS CD,');
    stQry.Add('''Geral'' AS ID_OCD,');
    stQry.Add('Sum(QUAY_Y) AS NR_UNIDADES_COMPRADA,');
    stQry.Add('Sum(QT_SUGERIDA) AS NR_UNIDADES_SUGERIDA,');
    stQry.Add('Sum(QT_SUGERIDA*PFBY_Y) AS VT_SUGERIDO_BRUTO,');
    stQry.Add('Sum(QUAY_Y*PFBY_Y) AS VT_COMPRADO_BRUTO,');
    stQry.Add('Sum(QT_SUGERIDA*puny_y) AS VT_SUGERIDO_LIQUIDO,');
    stQry.Add('Sum(QUAY_Y*PUNY_Y) AS VT_COMPRADO_LIQUIDO,');
    stQry.Add('500 CD_EMPRESA');
    stQry.Add('FROM');
    stQry.Add('PRDDM.DCPCC CAPA,');
    stQry.Add('PRDDM.DCPCI ITEM,');
    stQry.Add('PRDDM.DC_MERCADORIA PRODUTO,');
    stQry.Add('ACESSO.DC_EMPRESA CD');
    stQry.Add('WHERE');
    stQry.Add('NROP_P=NROP_Y');
    stQry.Add('AND CD.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
    stQry.Add('AND NROM_Y=CD_MERCADORIA');
    stQry.Add('AND ID_EMPRESA_FISICA=''S''');
    stQry.Add('AND NROP_Y In(' + PstPedido + '))');
    stQry.Add('ORDER BY CD_EMPRESA');

    stQry.SaveToFile('C:\temp\qryTotalizaPedido.sql');
    with _cdsTotalizaPedido do
    begin
      close;
      CommandText := stQry.Text;
      open;
      First;
    end;
    Result := false;
    // TotalizaPedido(PnrPedidoSC, 0, '');
    if not _cdsPrePedido.IsEmpty then
    begin
      SetGridTotalizaPedido;
      Result := true;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmImportaPedidoFornecedor.SetGridTotalizaPedido;
begin

  TStringField(_cdsTotalizaPedido.FieldByName('CD')).DisplayLabel := 'CD';
  TStringField(_cdsTotalizaPedido.FieldByName('CD')).DisplayWidth := 05;

  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_COMPRADA')).DisplayLabel := 'Unid.Comp.';
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_COMPRADA')).DisplayWidth := 07;
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_COMPRADA')).DisplayFormat := '###,###,##0';

  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_SUGERIDA')).DisplayLabel := 'Unid.Sug.';
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_SUGERIDA')).DisplayWidth := 07;
  TIntegerField(_cdsTotalizaPedido.FieldByName('NR_UNIDADES_SUGERIDA')).DisplayFormat := '###,###,##0';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_BRUTO')).DisplayLabel:= 'Total Sug.';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_BRUTO')).DisplayWidth := 12;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_BRUTO')).DisplayFormat:= '###,###,##0.00';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_BRUTO')).DisplayLabel:= 'Total Compr.';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_BRUTO')).DisplayWidth := 12;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_BRUTO')).DisplayFormat:= '###,###,##0.00';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_LIQUIDO')).DisplayLabel := 'Total Sug.C/Desc';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_LIQUIDO')).DisplayWidth := 12;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_SUGERIDO_LIQUIDO')).DisplayFormat := '###,###,##0.00';

  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_LIQUIDO')).DisplayLabel := 'Total Comp.C/Desc.';
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_LIQUIDO')).DisplayWidth := 11;
  TFloatField(_cdsTotalizaPedido.FieldByName('VT_COMPRADO_LIQUIDO')).DisplayFormat := '###,###,##0.00';

  TIntegerField(_cdsTotalizaPedido.FieldByName('CD_EMPRESA')).DisplayLabel:= 'Nr.cd';
  TIntegerField(_cdsTotalizaPedido.FieldByName('CD_EMPRESA')).DisplayWidth := 02;

end;




PROCEDURE T_frmImportaPedidoFornecedor.FiltraVenda(PnrProduto, PnrEmpresa,
  PnrCanal: Integer);
var
  nrMes, nrQtdade, nrDias, nrDiasEstoqueZero: Integer;
  vlMediaMes, vlDesvioPadrao: Double;
begin
  if _cdsVendaFornecedor <> nil then
  begin
    with _cdsVendaFornecedor do
    begin
      Filtered := false;
      filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto)
                + ' and CD_EMPRESA=' +IntToStr(PnrEmpresa)
                + ' and CD_CANAL=' + IntToStr(PnrCanal);
      Filtered := true;
    end;
    _cdsVendaFornecedor.First;
    while not _cdsVendaFornecedor.eof do
    begin
      nrMes := _cdsVendaFornecedor.FieldByName('MES').AsInteger;
      nrQtdade := _cdsVendaFornecedor.FieldByName('NR_UNIDADES').AsInteger;
      nrDiasEstoqueZero := _cdsVendaFornecedor.FieldByName('QT_DIAS_ESTOQUE_ZERO').AsInteger;
      nrDias := _cdsVendaFornecedor.FieldByName('NR_DIAS').AsInteger;
      vlMediaMes := _cdsVendaFornecedor.FieldByName ('qt_media_venda_diaria').AsFloat;
      vlDesvioPadrao := _cdsVendaFornecedor.FieldByName('QT_DESVIOPADRAO_VENDA_DIARIA').AsFloat;

      VendaAnual[PnrEmpresa, nrMes] := nrQtdade;
      MediaAnual[PnrEmpresa, nrMes] := vlMediaMes;
      nrDiasMes[PnrEmpresa, nrMes] := nrDias;
      DesvioPadraoAnual[PnrEmpresa, nrMes] := vlDesvioPadrao;
      nrDiasEstoqueAZero[PnrEmpresa, nrMes] := nrDiasEstoqueZero;
      _cdsVendaFornecedor.Next;
    end;

  end;
end;




Function T_frmImportaPedidoFornecedor.AbreVendaLaboratorioMultiEmpresa(PnrLaboratorio,
  PnrEmpresa, PnrOperadorLogistico: Integer): TClientDataSet;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;

begin
  try
    try
      stQry := TStringList.Create;

      _cdsTemp := TClientDataSet.Create(nil);
      _cdsTemp.RemoteServer := _dm._LocalConexao;
      _cdsTemp.ProviderName := '_dspGenerica';

      with stQry do
      begin
        Add('SELECT');
        Add('DT_VENDA_MERCADORIA,');
        Add('VENDA.CD_MERCADORIA,');
        Add('VENDA.CD_EMPRESA,');
        Add('nvl(QT_MEDIA_VENDA_DIARIA,0) as QT_MEDIA_VENDA_DIARIA,CD_CANAL,CD_OPERADOR_LOGISTICO,');
        Add('EXTRACT(YEAR FROM DT_VENDA_MERCADORIA) ANO,');
        Add('CASE');
        Add(' WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <> EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) <> EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) = EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) = EXTRACT(MONTH FROM SYSDATE) AND');
        Add('EXTRACT(YEAR  FROM DT_VENDA_MERCADORIA) = EXTRACT(YEAR FROM SYSDATE)');
        Add('THEN  13');
        Add('END MES,');
        Add('SUM(QT_VENDIDA) AS NR_UNIDADES,');
        Add('SUM(QT_MEDIA_VENDA_DIARIA) VL_MEDIA,');
        Add('SUM(QT_VENDIDA*NVL(VL_PRECO_COMPRA,0)) AS VT_VENDA,');
        Add('max(QT_DIAS_ESTOQUE_ZERO) AS QT_DIAS_ESTOQUE_ZERO,');
        Add('SUM(NVL(VT_CMV,0)) AS VT_CUSTO_MEDIO,');
        Add('SUM(VT_FATURAMENTO_LIQUIDO)AS VT_FATURAMENTO_LIQUIDO,');
        Add('SUM(VT_FATURAMENTO_BRUTO)  AS  VT_FATURAMENTO_BRUTO');
        Add(',venda.CD_OPERADOR_LOGISTICO,');

        Add('CASE');
        Add('WHEN EXTRACT(MONTH FROM DT_VENDA_MERCADORIA) <> EXTRACT(MONTH FROM SYSDATE) THEN   EXTRACT(DAY FROM Last_Day(DT_VENDA_MERCADORIA))');
        Add('ELSE EXTRACT(DAY FROM Trunc(SYSDATE)-1)');
        Add('END nr_dias,');
        Add('SUM(QT_DESVIOPADRAO_VENDA_DIARIA) AS QT_DESVIOPADRAO_VENDA_DIARIA');

        Add(' FROM');
        Add('PRDDM.DC_MERCADORIA MERCADORIA,');
        Add('PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,');
        Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA,');
        Add('PRDDM.DW_VENDA_ACUMULADA_MERCADORIA VENDA');
        Add('LEFT OUTER JOIN PRDDM.DC_OL_FORNECEDOR');
        Add('OL_FORNECEDOR ON OL_FORNECEDOR.CD_OPERADOR= VENDA.CD_OPERADOR_LOGISTICO');
        Add(' AND OL_FORNECEDOR.CD_FORNECEDOR=:PnrFornecedor');
        Add('WHERE');
        Add('    VENDA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND COMPRA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA');
        Add('AND VENDA.CD_MERCADORIA=COMPRA.CD_MERCADORIA');
        Add('AND VENDA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA');
        Add('AND VENDA.CD_EMPRESA=COMPRA.CD_EMPRESA');
        Add('AND VENDA.DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-12)');
        Add('AND COMPRA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');

        Add('GROUP BY VENDA.CD_EMPRESA,VENDA.CD_MERCADORIA,DT_VENDA_MERCADORIA');
        Add(',QT_MEDIA_VENDA_DIARIA,CD_CANAL,CD_OPERADOR_LOGISTICO');

        Add(',venda.CD_OPERADOR_LOGISTICO');

      end;

      stQry.SaveToFile('c:\temp\qryVendaFornecedor.sql');

      with _cdsTemp do
      begin
        close;
        CommandText := stQry.Text;
        Params.ParamByName('PnrFornecedor').Asbcd := PnrLaboratorio;
        open;
      end;
      Result := nil;
      if not _cdsTemp.IsEmpty then
        Result := _cdsTemp;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

  finally
    FreeAndNil(stQry);
  end;
end;


procedure T_frmImportaPedidoFornecedor.ZeraArray;
var
  I: Integer;
begin

    for I :=0 to High(PedidoEmpresa) do
    begin
      PedidoEmpresa[I] := 0;
    end;


end;


procedure T_frmImportaPedidoFornecedor.EncerraPedido(PidConfirma:Boolean);
VAR
  I, cdPrazoPagamento: Integer;
begin

//  SetEmpresaPedidoInico(_cdsEmpresaPedido);
{  if _cdsPrePedido.IsEmpty then
  begin
    dec(nrJanelasPedido);
    close;
    exit;
  end;}

   cdPrazoPagamento := AbrePrazoParcelamento(IntToStr(DadosFornecedor.nrPrazoPedido), 1);
   for I := 0 to High(PedidoEmpresa) do
   begin
      if PedidoEmpresa[I] > 0 then
      begin
        EliminaItemQuantidadeZerada(PedidoEmpresa[I]);
        ZeraItemAuditoria(PedidoEmpresa[I]);
        DadosLeadTimeFechaPedido := SetLeadTime(I, 'N');
        //nrLeadTime := DadosLeadTime.vlLeadTime;

        AtualizaCapaPedido(PedidoEmpresa[I],
                          cdPrazoPagamento,
                          cdoperadorLogisticoPedidoFecha,
                          DadosLeadTimeFechaPedido.vlLeadTime,
                          'I',
                           'Ped.nao confirmado',
                          false, dtPedido, dtPedido,
                          dtPedido + DadosFornecedor.nrGrupoFornecedor,
                          NrDiasEstoqueCompradorFechaPedido,
                          0,false,0);
        AtualizaStatusItemPedido(PedidoEmpresa[I],
                                 0,
                                 cdoperadorLogisticoPedidoFecha, 'I');
      end;
    end;
    if nrJanelasPedido>0 then
       dec(nrJanelasPedido);
    //ZeraNumeroPedido;
    close;
  end;




function T_frmImportaPedidoFornecedor.VerificaProblemasCrossdocking:Boolean;
begin
    Result:=true;
   // if _cdsPrePedido.Locate('ID_SEM_CROSSDOCKING','S',[]) then
   // begin
      with _cdsPrePedido do
      begin
        Filter:='ID_SEM_CROSSDOCKING=''S''';
        Filtered:=true;
      end;
      if not _cdsPrePedido.IsEmpty then
        if Confirma('Itens Com problema de Cadastro Crossdocking'+#13+
           'Deseja Continuar ?',MB_DEFBUTTON2 )=IDNO then
           Result:=false;

     _cdsPrePedido.Filtered:=false;

end;


end.
