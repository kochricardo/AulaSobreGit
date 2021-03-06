unit uImportaPrecoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, ComObj, OleServer, Grids,
  OleCtrls, DBGrids, DB, DBClient, uProduto,sqlExpr,
  FMTBcd, Provider, Gauges, SHELLAPI ,StrUtils,uRotinasGenericas, uAuxiliarCompras;

type
  T_frmImportaPrecoFornecedor = class(TForm)
    _stbMensagem: TStatusBar;
    GroupBox1: TGroupBox;
    _opdLocalizaArquivo: TOpenDialog;
    _edtArquivo: TEdit;
    Label1: TLabel;
    _btnImportaLista: TBitBtn;
    Label2: TLabel;
    _edtNrFornecedor: TEdit;
    _edtNmForncedor: TEdit;
    GroupBox2: TGroupBox;
    _dbgListaPre?o: TDBGrid;
    _cdsTabelaProdutoFornecedor: TClientDataSet;
    _cdsTabelaPrecoFornecedor: TClientDataSet;
    _cdsTabelaPrecoFornecedorNR_LISTA_FORNECEDOR: TIntegerField;
    _cdsTabelaPrecoFornecedorNR_MERCADORIA: TIntegerField;
    _cdsTabelaPrecoFornecedorQT_EMBALAGEM: TIntegerField;
    _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA: TFloatField;
    _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA_DESCONTO: TFloatField;
    _cdsTabelaPrecoFornecedorVL_UNITARIO: TFloatField;
    _cdsTabelaPrecoFornecedorVL_UNITARIO_DESCONTO: TFloatField;
    _cdsTabelaPrecoFornecedorPC_DESCONTO: TFloatField;
    _cdsTabelaPrecoFornecedorCD_EMPRESA: TIntegerField;
    _dsTabelaProdutoFornecedor: TDataSource;
    _btnImportaPlanilha: TBitBtn;
    _gaPlanilha: TGauge;
    _dsTabelaPrecoFornecedor: TDataSource;
    _cdsListaPrecoAtiva: TClientDataSet;
    _cdsTabelaPrecoFornecedorNR_VERBA: TIntegerField;
    GroupBox3: TGroupBox;
    _dbgBaseXLista: TDBGrid;
    _dsListaPreco: TDataSource;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    _cdsLIstaBaseXListaPreco: TClientDataSet;
    _dsLIstaBaseXListaPreco: TDataSource;
    _chkListaDiferenca: TCheckBox;
    _btnImportaDados: TBitBtn;
    _chkListaFornecedor: TCheckBox;
    _cdsTabelaPreco: TClientDataSet;
    gr: TGroupBox;
    _dtpDataInicial: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    _dtpDataFinal: TDateTimePicker;
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnImportaListaClick(Sender: TObject);
    procedure _dbgListaPre?oTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _stbMensagemDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure _dbgListaPre?oDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure _btnImportaDadosClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure _dbgBaseXListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _chkListaDiferencaClick(Sender: TObject);
    procedure _btnImportaPlanilhaClick(Sender: TObject);
    procedure _dbgBaseXListaTitleClick(Column: TColumn);
    procedure _dbgListaPre?oDblClick(Sender: TObject);
    procedure _chkListaFornecedorClick(Sender: TObject);
  private
    procedure SetGridProdutos;
    procedure ImportaDadosExcel(PstArquivo: String);
    function CadastraTabelaPreco(PnrLista,
                                 PnrProduto,
                                 PnrQtdEmbalagem:Integer;
                                 PvlCaixaFecha,
                                 PvlCaixaFechaComDesconto,
                                 PvlUnitario,
                                 PvlUnitarioComDesconto,
                                 PpcDesconto:Double;
                                 PcdEmpresa:Integer;
                                 PnrVerba:Integer):Boolean;
    procedure ImportarPlanilha(var ArquivoExcel: OLEVariant;
      var DataSet: TClientDataSet; const Planilha: integer);
    procedure AbreExcel(stArquivo: wideString);
    procedure SetStatusBar;
    function ListaPrecoFornecedor(PnrFornecedor,
                                  PnrProduto: Integer):Boolean;
    function GravaListaPreco(PCD_PRECO_FORNECEDOR_EXCECAO: Integer;
                             PDT_INICIO_VALIDADE,
                             PDT_FIM_VALIDADE: Tdate;
                             PCD_MERCADORIA: Integer;
                             PCD_INTERNO_LABORATORIO: String;
                             PQT_EMBALAGEM_COMPRA: Integer;
                             PVT_CAIXA_FECHADA,
                             PVT_CAIXA_FECHADA_DESCONTO,
                             PVL_COMPRA_MERCADORIA,
                             PVL_COMPRA_MERCADORIA_DESCONTO,
                             PPC_DESCONTO_COMPRA: Double;
                             PID_SITUACAO,
                             PNM_USUARIO: String;
                             PDT_ATUALIZACAO: Tdate;
                             PCD_EMPRESA,PNR_VERBA: Integer): Boolean;
    function NrUltimaLista: Integer;
    procedure AtualizaListaPrecoBase(Tabela: TclientDataset);
    function ListaPrecoAtivas(PnrFornecedor, PnrProduto: Integer): Boolean;
    procedure SetGridListaPreco;
    function TestaItemListaPrecoAtivas(PnrFornecedor, PnrProduto,
      PnrEmpresa: Integer; PdtInicio, PdtFinal: Tdate): Boolean;
    function AtualizaListaPreco(PCD_PRECO_FORNECEDOR_EXCECAO: Integer;
      PDT_INICIO_VALIDADE, PDT_FIM_VALIDADE: Tdate; PCD_MERCADORIA: Integer;
      PCD_INTERNO_LABORATORIO: String; PQT_EMBALAGEM_COMPRA: Integer;
      PVT_CAIXA_FECHADA, PVT_CAIXA_FECHADA_DESCONTO, PVL_COMPRA_MERCADORIA,
      PVL_COMPRA_MERCADORIA_DESCONTO, PPC_DESCONTO_COMPRA: Double; PID_SITUACAO,
      PNM_USUARIO: String; PDT_ATUALIZACAO: Tdate; PCD_EMPRESA,
      PNR_VERBA: Integer): Boolean;
    function ComparaListaPrecoAtivas(PnrFornecedor,PnrLista:Integer):Boolean;
    { Private declarations }
    procedure SetGridListaPrecoNova;
    procedure filtraDiferenca;
    function SetCampoLista(PnrProduto,PnrEmpresa:Integer;PvlLista:Double):Boolean;
    procedure AlteraPreco(PcdProduto, PnrEmpresa: Integer; PvlPreco: Double);
    function LocalizaPrecoFornecedor(PcdProduto, PnrEmpresa: Integer): Double;
    function CompraListaPrecoFornecedorExcel(PnrFornecedor,
      PnrProduto: Integer): Boolean;
    function SetPrecoComparacao(PnrProduto, PnrEmpresa: Integer;
      PvlLista: Double): Boolean;
    procedure ImportarPlanilhaNova(var ArquivoExcel: OLEVariant;
      var DataSet: TClientDataSet; const Planilha: integer);
    function GetPrecoItem(PnrProduto, PcdEmpresa: Integer; PvlPrecoFornecedor,
      PpcDescontoAbatimento: Double; PIdPrecoAtual: Char; PidPedidoBloqueado,
      PnrLIstaPrecoAtiva: Integer): TListaPreco;
    function SetListaPrecoAtiva(PnrLista, PnrProduto,
      PnrEmpresa: Integer): TListaPrecoAtiva;
  public
     Mercadoria:TMercadoria;
    { Public declarations }
  end;

var
  _frmImportaPrecoFornecedor: T_frmImportaPrecoFornecedor;
  nrCompradorPontoEncomenda   :Integer;
  DadosFornecedor :TDadosFornecedor;
  DadosProduto :TMercadoria;
  precoLista: TListaPreco;
  PrecoItem: TCalculoPreco;



implementation

uses uDm;






{$R *.dfm}

procedure T_frmImportaPrecoFornecedor._btnImportaListaClick(Sender: TObject);
begin
   _chkListaFornecedor.Enabled:=false;
  _edtArquivo.Clear;
  _cdsTabelaPrecoFornecedor.Close;
  _cdsTabelaPrecoFornecedor.CreateDataSet;
  if not _opdLocalizaArquivo.Execute then
     Exit;
  _edtArquivo.Text := _opdLocalizaArquivo.FileName;

   if trim(_edtArquivo.Text)<>'' then
      AbreExcel(_edtArquivo.Text);
//      SetGridListaPreco;
//      _cdsListaPrecoAtiva.Close;





end;

procedure T_frmImportaPrecoFornecedor._btnImportaDadosClick(Sender: TObject);
begin
   AtualizaListaPrecoBase(_cdsTabelaPrecoFornecedor);
end;

procedure T_frmImportaPrecoFornecedor._dbgListaPre?oDblClick(Sender: TObject);
begin
AlteraPreco(0,0,0);
end;

procedure T_frmImportaPrecoFornecedor._dbgListaPre?oDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgListaPre?o do
  begin
    if _dsTabelaPrecoFornecedor.DataSet.FieldByName('CD_EMPRESA').AsInteger=1 then
    begin
      Canvas.Font.Color:= clBlack;
      Canvas.Brush.Color:= clSkyBlue;
    end;
    if _dsTabelaPrecoFornecedor.DataSet.FieldByName('CD_EMPRESA').AsInteger=4 then
    begin
        Canvas.Font.Color:= clBlack;
        Canvas.Brush.Color:= clWhite;
        //Canvas.Brush.Color:= $000080FF;
     // Canvas.Brush.Color:= clInactiveCaption;
    end;
{    If odd(_dsPedidoElaboradorSC.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clScrollBar;
 end;}


 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clBlue;
    Canvas.Font.Color:= clWhite;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmImportaPrecoFornecedor._dbgListaPre?oTitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsTabelaPrecoFornecedor,Column);
end;

procedure T_frmImportaPrecoFornecedor._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_RETURN: begin
                 DadosFornecedor:=GetDadosLaboratorioComprador(StrToIntDef('0',0),
                                                             StrToIntDef(_edtNrFornecedor.Text,0));

               if DadosFornecedor<>NIL then
               begin

                //_edtComprador.Text:=FormatFloat('0000',DadosFornecedor.nrComprador);
               if (StrToIntDef(_edtNrFornecedor.Text,0)>0) and (DadosFornecedor.nrFornecedor=0) then
               begin
                  Mensagem('Fornecedor n?o encontrado !!!',MB_ICONWARNING);
                  _edtNrFornecedor.SetFocus;
                  exit;
               end;
               _edtNmForncedor.Text:=DadosFornecedor.dsNomeFantasia;
               _cdsTabelaProdutoFornecedor:=AbreProdutosFornecedorFornecedor(DadosFornecedor.nrFornecedor);
               ListaPrecoAtivas(DadosFornecedor.nrFornecedor,0);

              _cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, DadosFornecedor.nrFornecedor, 0, 0, 'S',
                                                                  dtSistema);



               if  _cdsTabelaProdutoFornecedor<>nil then
               begin
                 _btnImportaLista.Enabled:=true;
                 _dsTabelaProdutoFornecedor.DataSet:=_cdsTabelaProdutoFornecedor;
                 _cdsTabelaProdutoFornecedor.Open;
                 SetGridProdutos;
               end;

               //_btnExecutaPonto.Click;
               end;

      end;


   end;

end;



procedure T_frmImportaPrecoFornecedor._stbMensagemDrawPanel(
  StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
   if Panel = StatusBar.Panels[1] then
    with _gaPlanilha do
    begin

         Top := Rect.Top;
          Left := Rect.Left;
          Width := Rect.Right - Rect.Left - 00;
          Height := Rect.Bottom - Rect.Top;
        end;

end;

procedure T_frmImportaPrecoFornecedor.SetStatusBar;
 var
  ProgressBarStyle: integer;
begin

  _stbMensagem.Panels[1].Style := psOwnerDraw;
  _gaPlanilha.Parent:=_stbMensagem;
  _gaPlanilha.Height:=_stbMensagem.Height-3;
  _gaPlanilha.BackColor:=clWhite;
  _gaPlanilha.ForeColor:=clBlue;


end;


procedure T_frmImportaPrecoFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmImportaPrecoFornecedor.FormShow(Sender: TObject);
begin
 SetStatusBar;
 _chkListaFornecedor.Enabled:=false;

 _dtpDataInicial.Date:=dtSistema;
 _dtpDataFinal.Date:=dtSistema+30;

end;

procedure T_frmImportaPrecoFornecedor.SetGridProdutos;
begin
// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('ID_LOCAL_CD')).DisplayLabel:='CD';
// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('ID_LOCAL_CD')).DisplayWidth:=03;

 TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('CD_MERCADORIA')).DisplayLabel:='Cod.Prod.';
 TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('CD_MERCADORIA')).DisplayWidth:=6;

 TStringField(_cdsTabelaProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
 TStringField(_cdsTabelaProdutoFornecedor.FieldByName('NM_MERCADORIA')).DisplayWidth:=27;

 TStringField(_cdsTabelaProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
 TStringField(_cdsTabelaProdutoFornecedor.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=27;

 TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayLabel:='Embal.';
 TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayWidth:=6;

 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO')).DisplayLabel:='% Padr?o';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_PADRAO')).DisplayFormat:='##0.00';

 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_ADICIONAL')).DisplayLabel:='% Desc.Adic.';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_ADICIONAL')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_ADICIONAL')).DisplayFormat:='##0.00';

 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA')).DisplayLabel:='Vlr. Caixa';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA')).DisplayFormat:='##0.00';


 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_DESCONTO')).DisplayLabel:='Vlr.Cx. C/Desc.';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_DESCONTO')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_DESCONTO')).DisplayFormat:='##0.00';

 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA')).DisplayLabel:='Vlr. Unit.';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA')).DisplayFormat:='###,##0.00';


 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO')).DisplayLabel:='Vlr.Unit.C/Desc.';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO')).DisplayWidth:=10;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO')).DisplayFormat:='###,##0.00';


 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_ADICIONAL_RS')).DisplayLabel:='% Adic.(RS)';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_ADICIONAL_RS')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('PC_DESCONTO_ADICIONAL_RS')).DisplayFormat:='##0.00';

 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_RS')).DisplayLabel:='Vlr.Caixa (RS)' ;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_RS')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_RS')).DisplayFormat:='##0.00';


 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_DESCONTO_RS')).DisplayLabel:='Vlr. Caixa C/Desc.(RS)';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_DESCONTO_RS')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VT_CAIXA_FECHADA_DESCONTO_RS')).DisplayFormat:='##0.00';

 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_RS')).DisplayLabel:='Vlr.Unit.(RS)';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_RS')).DisplayWidth:=6;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_RS')).DisplayFormat:='###,##0.00';


 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_DESC_RS')).DisplayLabel:='Vlr.Unit.C/Desc.(RS)';
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_DESC_RS')).DisplayWidth:=10;
 TFloatField(_cdsTabelaProdutoFornecedor.FieldByName('VL_COMPRA_MERCADORIA_DESC_RS')).DisplayFormat:='###,##0.00';




// TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('QT_CAIXA_CAMADA')).DisplayLabel:='Qtd.CX. Camada';
 //TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('QT_CAIXA_CAMADA')).DisplayWidth:=6;

// TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('QT_CAIXA_PALETE')).DisplayLabel:='Qtd.CX. Palete';
// TIntegerField(_cdsTabelaProdutoFornecedor.FieldByName('QT_CAIXA_PALETE')).DisplayWidth:=6;

// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('CD_INTERNO_LABORATORIO')).DisplayLabel:='Cod. Interno';
// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('CD_INTERNO_LABORATORIO')).DisplayWidth:=10;

// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('CD_EAN_COMPRA')).DisplayLabel:='Cod. EAN Compra';
// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('CD_EAN_COMPRA')).DisplayWidth:=13;

// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('CD_EAN_VENDA')).DisplayLabel:='Cod. EAN Venda';
// TStringField(_cdsTabelaProdutoFornecedor.FieldByName('CD_EAN_VENDA')).DisplayWidth:=13;



 end;


procedure T_frmImportaPrecoFornecedor.ImportaDadosExcel(PstArquivo:String);
const xlCellTypeLastCell = $0000000B;
var
 	Excel,
  DadosEXCEL: OLEVariant;
  Linha,nrLinha,Planilha :Integer;
  qtMinima,qtMaxima,
  cdProduto,
  linhaInicio,
  nrContaLinhaPlanilha,
  nrVerbaLocal,
  nrMercadoria,
  NrDigitoMercadoria,
  NrItens: Integer;
  vlMargemMinimaTemp,pcDesconto,
  pcVerba,
  vlCotado:Double;
  vlTempo :String;
  idMedicamento,
  nrContaReg:integer;
  nmProduto,
  nmColuna,nmColunaOriginal :String;



begin
    Excel := CreateOleObject('Excel.Application');
    Planilha:=1;
    Linha:=1;
     try
    // evita que o Excel seja exibido na tela
    Excel.Visible := False;

    // abre o arquivo XLSX
	  Excel.Workbooks.Open(PstArquivo);

    //Abre o Workbook
    //XLApp.Workbooks.Open(AXLSFile);
  try
    DadosEXCEL:= Excel.Workbooks[ExtractFileName(PstArquivo)].WorkSheets[1];
    DadosEXCEL.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
  except
      on E: Exception do
      begin
        trataerro(E.Message,
          'Problemas na Planilha...'+#13+
          'Coluna com informa??es com tipo diferente'+#13+
          'Valores numericos e alfanumericos em uma mesma coluna '+#13+
          'Verifique');
        exit;
        _btnImportaPlanilha.Enabled:=true;
      end;

  end;
   //Pegar o n?mero da ?ltima linha
    nrLinha := excel.ActiveCell.Row;





      // ativa a planilha
    Excel.Workbooks[1].WorkSheets[Planilha].Activate;



  nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1];
  nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
  nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
  if nmColuna<>'COD.PRODUTO' then
  begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = Cod. Produto '+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser? interrompido',MB_ICONWARNING);
    exit;
  end;
  nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 2];
  nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
  nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
  if nmColuna<>'%DESCONTO' then
  begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = % Desconto '+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
   end;
   nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 3];
   nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
   nmColuna:=StringReplace(nmColuna,'?','?',[]);
   nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
   if nmColuna<>'PRE?OCOTADO' then
   begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = Pre?o Cotado '+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
   end;
   nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 4];
   nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
   nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
   if nmColuna<>'NR.VERBA' then
   begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = Nr. Verba'+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
   end;
  nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha,5];
  nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
  nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
  if nmColuna<>'%DEVERBA' then
   begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = % de Verba'+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
  end;
   nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 6];
   nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
  nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
  if nmColuna<>'QTDEMINIMA' then
  begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = Qtde Minima'+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
   end;

   nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 7];
   nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
   nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
   if nmColuna<>'QTDEMAXIMA' then
   begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = Qtde Maxima'+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
  end;
  nmColunaOriginal:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 8];
  nmColuna:=UpperCase(StringReplace(nmColunaOriginal,' ','',[]));
  nmColuna:=AnsiReplaceStr(nmColuna,' ', '');
  if nmColuna<>'%MARGEMMINIMA' then
  begin
     Mensagem('Nome da Coluna  n?o corresponde a none Padr?o!!! '+#13+
                   'Nome Padr?o = % Margem Minima'+#13+
                   'Coluna '+nmColunaOriginal+#13+
                   'Processo ser interrompido',MB_ICONWARNING);
     exit;
  end;


  // linha da planilha que cont?m os valores
  nrLinha :=1;
  Linha := 2;
 try
  while not (excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1].Value = varEmpty) do
  begin
    inc(nrLinha);
    inc(Linha);

  end;
 except
   on E: Exception do
   begin
     trataerro(E.Message,'Problemas na Planilha...'+#13+
                         'Coluna com informa??es com tipo diferente'+#13+
                         'Valores numericos e alfanumericos em uma mesma coluna '+#13+
                         'Verifique');
                         exit;
                       _btnImportaPlanilha.Enabled:=true;
      end;
 end;

  _gaPlanilha.MinValue:=0;
  _gaPlanilha.MaxValue:=nrLinha;

  // limpa o conte?do existente no DataSet
//  _cdsTabelaPromocao.EmptyDataSet;

  // desabilita os controles (para evitar o efeito de navega??o enquanto insere os registros
  _cdsTabelaPrecoFornecedor.DisableControls;
  nrContaReg:=0;
  NrItens:=nrLinha+_cdsTabelaPrecoFornecedor.RecordCount;

  Linha := 2;

  // loop para inser??o de cada linha at? que encontre uma linha em branco
  while not (excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1].Value = varEmpty) do
  begin
       inc(nrContaReg);
       //:=NrItens+nrLinha;
      if nrContaReg=30 then
      begin
       _cdsTabelaPrecoFornecedor.open;
      _cdsTabelaPrecoFornecedor.EnableControls;
       Application.ProcessMessages;
       nrContaReg:=0;
       _cdsTabelaPrecoFornecedor.DisableControls;

      end;


    cdProduto:= Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1];

    nrMercadoria       :=strtoint(copy(formatfloat('0000000',cdProduto),1,6));
    NrDigitoMercadoria :=strtoint(copy(formatfloat('0000000',cdProduto),7,1));

    if (cdProduto>0)  then
    begin
     if DadosProduto<>nil then
       DadosProduto:=nil;
      DadosProduto:=GetMercadoriaNova(nrMercadoria ,//PnrProduto,
                                      NrDigitoMercadoria,
                                      0,
                                      0,
                                      0,'');

     if (DadosProduto<>nil) then
     begin
       idMedicamento:=DadosProduto.nrTipoProduto;
       nmProduto:=DadosProduto.nmProdutoCompleto;
     end;

   if DadosProduto<>nil then
     _stbMensagem.Panels[2].Text:= 'Nr. de registros--> '+formatfloat('000,000',_cdsTabelaPrecoFornecedor.RecordCount+1)+ ' de '+formatfloat('000,000', NrItens-1);



     pcDesconto  := Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 2];
     vlCotado    := Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 3];
     nrVerbaLocal:= Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 4];
     pcVerba :=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 5];
     qtMinima:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 6];
     if qtMinima=0 then
       qtMinima:=1;
     qtMaxima:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 7];
     if qtMaxima=0 then
       qtMaxima:=999999;

    vlMargemMinimaTemp:=Excel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 8];
    if vlMargemMinimaTemp>100 then
       vlMargemMinimaTemp:=100;
    if (cdProduto>0)  then
     //CadastraPlanilhaLocal(cdProduto,idMedicamento,nmProduto,pcDesconto,vlCotado,nrVerbaLocal,pcVerba,qtMinima,qtMaxima,vlMargemMinimaTemp);
   end;


    Inc(Linha); // move para a pr?xima linha
    _gaPlanilha.Progress:=linha;
  end;

  // move para o primeiro registro ap?s todas as inser??es
  //_cdsTabelaPromocao.First;
 // _cdsTabelaPromocao.EnableControls;

  // habilita os controles para navega??o
//  DataSet.EnableControl



  finally
	  if not VarIsEmpty(Excel) then
    begin
		  Excel.Quit;
      Excel := Unassigned;
		end;
	end;


end;



function T_frmImportaPrecoFornecedor.CadastraTabelaPreco(PnrLista,
                                                         PnrProduto,
                                                         PnrQtdEmbalagem:Integer;
                                                         PvlCaixaFecha,
                                                         PvlCaixaFechaComDesconto,
                                                         PvlUnitario,
                                                         PvlUnitarioComDesconto,
                                                         PpcDesconto:Double;
                                                         PcdEmpresa,
                                                         PnrVerba:Integer):Boolean;
begin

 _cdsTabelaPrecoFornecedor.open;

 if not _cdsTabelaPrecoFornecedor.Locate('NR_MERCADORIA;CD_EMPRESA',VarArrayOf([PnrProduto,PcdEmpresa]),[])then
 begin
     _cdsTabelaPrecoFornecedor.append;
     _cdsTabelaPrecoFornecedorNR_LISTA_FORNECEDOR.AsInteger:=PnrLista;
     _cdsTabelaPrecoFornecedorNR_MERCADORIA.AsInteger:=PnrProduto;
     _cdsTabelaPrecoFornecedorQT_EMBALAGEM.AsInteger:=PnrQtdEmbalagem;
     _cdsTabelaPrecoFornecedorPC_DESCONTO.AsFloat:=PpcDesconto;
     _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA.AsFloat:=PvlCaixaFecha;
     _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA_DESCONTO.AsFloat:=PvlCaixaFechaComDesconto;
     _cdsTabelaPrecoFornecedorVL_UNITARIO.AsFloat:=PvlUnitario;
     _cdsTabelaPrecoFornecedorVL_UNITARIO_DESCONTO.AsFloat:=PvlUnitarioComDesconto;
     _cdsTabelaPrecoFornecedorCD_EMPRESA.AsInteger:=PcdEmpresa;
     _cdsTabelaPrecoFornecedorNR_VERBA.AsInteger:=PnrVerba;

     _cdsTabelaPrecoFornecedor.post;
 end
 else
 begin
     _cdsTabelaPrecoFornecedor.Edit;
     _cdsTabelaPrecoFornecedorQT_EMBALAGEM.AsInteger:=PnrProduto;
     _cdsTabelaPrecoFornecedorPC_DESCONTO.AsFloat:=PpcDesconto;
     _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA.AsFloat:=PvlCaixaFecha;
     _cdsTabelaPrecoFornecedorVL_CAIXA_FECHADA_DESCONTO.AsFloat:=PvlCaixaFechaComDesconto;
     _cdsTabelaPrecoFornecedorVL_UNITARIO.AsFloat:=PvlUnitario;
     _cdsTabelaPrecoFornecedorVL_UNITARIO_DESCONTO.AsFloat:=PvlUnitarioComDesconto;
     _cdsTabelaPrecoFornecedorCD_EMPRESA.AsInteger:=PcdEmpresa;

     _cdsTabelaPrecoFornecedor.post;

 end;

end;



procedure T_frmImportaPrecoFornecedor._chkListaFornecedorClick(Sender: TObject);
var
nrProduto,
nrEmpresa :Integer;
vlPrecoFornecedor,
vlLista:Double;


begin
 if _chkListaFornecedor.checked then
 begin
    if DadosFornecedor<>nil then
       CompraListaPrecoFornecedorExcel(DadosFornecedor.nrFornecedor,0)
    else
     Mensagem('Selecione fornecedor antes',MB_ICONWARNING);

    if not _cdsTabelaProdutoFornecedor.IsEmpty then
    begin
      _cdsTabelaProdutoFornecedor.First;
      while not _cdsTabelaPrecoFornecedor.Eof do
      begin
           nrProduto:=_cdsTabelaPrecoFornecedorNR_MERCADORIA.AsInteger;
           nrEmpresa:=_cdsTabelaPrecoFornecedorCD_EMPRESA.AsInteger;
           vlLista  := _cdsTabelaPrecoFornecedorVL_UNITARIO.AsFloat;
           SetPrecoComparacao(nrProduto,nrEmpresa,vlLista);

        _cdsTabelaPrecoFornecedor.Next;
      end;
    end;
 end;

end;

procedure T_frmImportaPrecoFornecedor._btnImportaPlanilhaClick(Sender: TObject);
begin
 GerarExcel(_cdsLIstaBaseXListaPreco);
end;

procedure T_frmImportaPrecoFornecedor._chkListaDiferencaClick(Sender: TObject);
begin
filtraDiferenca;
end;

procedure T_frmImportaPrecoFornecedor.AbreExcel(stArquivo:wideString);
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
    ImportarPlanilhaNova(Excel, _cdsTabelaPrecoFornecedor, 1);

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
  _chkListaFornecedor.Enabled:=true;

end;



procedure T_frmImportaPrecoFornecedor.ImportarPlanilha(var ArquivoExcel: OLEVariant;
  var DataSet: TClientDataSet; const Planilha: integer);
var
  Linha: integer;
  nrLinhas:Integer;
  cdProduto,
  NrVerba:Integer;
  vlPrecoUnitario,
  vlPrecoUnitarioDesconto,
  pcDescontoAdicional  :Double;
begin

  // ativa a planilha
//  ArquivoExcel.Workbooks[1].WorkSheets[0].Activate;
  ArquivoExcel.Workbooks[1].WorkSheets[Planilha].Activate;



  Linha :=2;

//  ArquivoExcel.Workbooks.open(Planilha);
  //Pegar o n?mero da ?ltima linha

   //nrLinhas:=ArquivoExcel.Activecell.Row;

   nrLinhas:=linha-1;
try
  while not (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, 1].value = varEmpty) do
  begin
    inc(nrLinhas);
    inc(Linha);
  end;
except
 Mensagem('Linha'+IntToStr(nrLinhas)+' Dados Coluna --> '+ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, 1].Value,16);

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

  // loop para inser??o de cada linha at? que encontre uma linha em branco
  while not (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, 1].Value = varEmpty) do
  begin
   cdProduto              :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1];
   vlPrecoUnitario        :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 2];
   vlPrecoUnitarioDesconto:= StrToFloatDef(FormatFloat('00000.00', ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 3]),0);
   pcDescontoAdicional    :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 6];
   NrVerba                :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 7];




   _stbMensagem.Panels[0].Text:=FormatFloat('0000',lInha)+' de '+FormatFloat('0000',nrLinhas);
   _stbMensagem.Repaint;

   if vlPrecoUnitario=0 then
   begin
      vlPrecoUnitario:=LocalizaPrecoFornecedor(cdProduto,1);
      vlPrecoUnitarioDesconto:=vlPrecoUnitarioDesconto;
   end;


   if (pcDescontoAdicional=0) and (vlPrecoUnitario>0) then
      pcDescontoAdicional:= (1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100;
   if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
      pcDescontoAdicional:= (1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100;

   if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
     CadastraTabelaPreco(  0 ,//PnrLista,
                           cdProduto,// PnrProduto,
                          0,// PnrQtdEmbalagem:Integer;
                          0,// PvlCaixaFecha,
                          0,// PvlCaixaFechaComDesconto,
                          vlPrecoUnitario,// PvlUnitario,
                          vlPrecoUnitarioDesconto,// PvlUnitarioComDesconto,
                          pcDescontoAdicional,//  PpcDesconto:Double;
                          1,
                          NrVerba);// PcdEmpresa:Integer):Boolean;

   vlPrecoUnitario        :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 4];
//   vlPrecoUnitarioDesconto:=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 5];
   vlPrecoUnitarioDesconto:= strtofloat(FormatFloat('00000.00', ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 5]));
   pcDescontoAdicional    :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 6];

   if vlPrecoUnitario=0 then
   begin
      vlPrecoUnitario:=LocalizaPrecoFornecedor(cdProduto,4);
      vlPrecoUnitarioDesconto:=vlPrecoUnitarioDesconto;
   end;


   if (pcDescontoAdicional=0) and (vlPrecoUnitario>0) then
      pcDescontoAdicional:= (1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100;
    if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
      pcDescontoAdicional:= (1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100;

    if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
     CadastraTabelaPreco(  0 ,//PnrLista,
                           cdProduto,// PnrProduto,
                          0,// PnrQtdEmbalagem:Integer;
                          0,// PvlCaixaFecha,
                          0,// PvlCaixaFechaComDesconto,
                          vlPrecoUnitario,// PvlUnitario,
                          vlPrecoUnitarioDesconto,// PvlUnitarioComDesconto,
                          pcDescontoAdicional,//  PpcDesconto:Double;
                          4,
                          nrVerba);// PcdEmpresa:Integer):Boolean;


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




procedure T_frmImportaPrecoFornecedor.ImportarPlanilhaNova(var ArquivoExcel: OLEVariant;
  var DataSet: TClientDataSet; const Planilha: integer);
var
  Linha: integer;
  nrLinhas:Integer;
  cdEan ,stCodigo:String;
  cdProduto,
  nrProduto,
  dgProduto,
  cdEmpresa,
  NrVerba:Integer;
  vlPrecoUnitario,
  vlPrecoUnitarioDesconto,
  pcDescontoAdicional  :Double;
  DadosCodigo :TCodigoValido;
begin

  // ativa a planilha
//  ArquivoExcel.Workbooks[1].WorkSheets[0].Activate;
  ArquivoExcel.Workbooks[1].WorkSheets[Planilha].Activate;



  Linha :=2;

//  ArquivoExcel.Workbooks.open(Planilha);
  //Pegar o n?mero da ?ltima linha

   //nrLinhas:=ArquivoExcel.Activecell.Row;

   nrLinhas:=linha-1;
try
  while not (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, 1].value = varEmpty) do
  begin
    inc(nrLinhas);
    inc(Linha);
  end;
except
 Mensagem('Linha'+IntToStr(nrLinhas)+' Dados Coluna --> '+ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, 1].Value,16);

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


  // loop para inser??o de cada linha at? que encontre uma linha em branco
  while not (ArquivoExcel.WorkBooks[1].Sheets[1].Cells[Linha, 1].Value = varEmpty) do


  begin
   stCodigo              :=AnsiReplaceStr(ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 2],'/','');
   cdempresa             :=ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 1];

   DadosCodigo  :=TransformaStringCodigo(stCodigo);

   nrProduto             :=DadosCodigo.nrCodigo;
   dgProduto             :=DadosCodigo.nrDigito;


   cdEan                 :='';
//   vlPrecoUnitario        :=ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 3];
   vlPrecoUnitarioDesconto:= StrToFloatDef(FormatFloat('00000.00', ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 3]),0);
   pcDescontoAdicional    :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 4];
   NrVerba                :=  ArquivoExcel.WorkBooks[1].Sheets[Planilha].Cells[Linha, 5];


     Mercadoria        := GetMercadoriaNova(nrProduto,
                                         dgProduto,
                                         0,
                                         cdEmpresa,
                                         1,'');
   if Mercadoria<>nil then
   begin
    vlPrecoUnitario:=Mercadoria.vlPrecoCompra;

    if vlPrecoUnitario=0 then
    begin
             precoLista := GetPrecoItem(Mercadoria.nrProduto,
                                  cdEmpresa,
                                  vlPrecoUnitario, 1,
                                  'S',//idprecoAtual,
                                  0,//idBloqueiaPedido,
                                  0//nrListaPrecoExcecao
                                  ); { ,nrListaPreco };
     vlPrecoUnitario:= precoLista.vlPrecoLista;
     FillChar(precoLista,sizeof(precoLista),0);
    end;

    _stbMensagem.Panels[0].Text:=FormatFloat('0000',lInha)+' de '+FormatFloat('0000',nrLinhas);
    _stbMensagem.Repaint;

    if vlPrecoUnitarioDesconto=0 then
    begin
        precoLista := GetPrecoItem(Mercadoria.nrProduto,
                                  cdEmpresa,
                                  vlPrecoUnitario, 1,
                                  'S',//idprecoAtual,
                                  0,//idBloqueiaPedido,
                                  0//nrListaPrecoExcecao
                                  ); { ,nrListaPreco };



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


        vlPrecoUnitarioDesconto:=PrecoItem.vlPrecoLiquido;

   end;


   if (pcDescontoAdicional=0) and (vlPrecoUnitario>0) then
      pcDescontoAdicional:= (1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100;
   if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
      pcDescontoAdicional:= (1- (vlPrecoUnitarioDesconto/vlPrecoUnitario))*100;
   if vlPrecoUnitarioDesconto>vlPrecoUnitario then
   begin
      pcDescontoAdicional:=0;
     // NrVerba:=0;
   end;
   if (pcDescontoAdicional>0) and (Mercadoria.pcDescontoPadrao>0) then
      pcDescontoAdicional:=pcDescontoAdicional- Mercadoria.pcDescontoPadrao;





//   if (vlPrecoUnitario>0) AND (vlPrecoUnitarioDesconto>0) then
    if (Mercadoria<>nil) and (vlPrecoUnitario>0) then

     CadastraTabelaPreco(  0 ,//PnrLista,
                          Mercadoria.cdProduto,// PnrProduto,
                          Mercadoria.qtEmbalagemCompra,// PnrQtdEmbalagem:Integer;
                          0,// PvlCaixaFecha,
                          0,// PvlCaixaFechaComDesconto,
                          vlPrecoUnitario,// PvlUnitario,
                          vlPrecoUnitarioDesconto,// PvlUnitarioComDesconto,
                          pcDescontoAdicional,//  PpcDesconto:Double;
                          cdempresa,
                          NrVerba);// PcdEmpresa:Integer):Boolean;

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


function T_frmImportaPrecoFornecedor.ListaPrecoFornecedor(PnrFornecedor,PnrProduto:Integer):Boolean;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with stQry do
    begin
      Add('SELECT');
      Add('Nvl(CD_PRECO_FORNECEDOR_EXCECAO,0) NR_LISTA,');
      Add('M.CD_MERCADORIA*10+NR_DV_MERCADORIA,');
      Add('NM_MERCADORIA||''  ''||DS_APRESENTACAO_MERCADORIA NM_PRODUTO,');
      Add('Nvl(DT_INICIO_VALIDADE,''01/01/2339'') AS DT_INICIO,');
      Add('Nvl(DT_FIM_VALIDADE,''01/01/2339'') AS DT_FINAL,');
      Add('Nvl(LISTA.CD_INTERNO_LABORATORIO,'' '') AS CD_FORNECEDOR,');
      Add('Nvl(LISTA.QT_EMBALAGEM_COMPRA,0) AS QT_EMBALAGEM_COMPRA,');
      Add('Nvl(VT_CAIXA_FECHADA,0) AS VT_CAIXA_FECHADA,');
      Add('Nvl(VT_CAIXA_FECHADA_DESCONTO,0) AS VT_CAIXA_FECHADA_DESCONTO ,');
      Add('Nvl(VL_COMPRA_MERCADORIA,0) AS VL_COMPRA_MERCADORIA,');
      Add('Nvl(VL_COMPRA_MERCADORIA_DESCONTO,0) AS VL_COMPRA_MERCADORIA_DESCONTO,');
      Add('Nvl(PC_DESCONTO_COMPRA,0.00) AS PC_DESCONTO ,');
      Add('ID_SITUACAO,');
      Add('LISTA.NM_USUARIO,');
      Add('DT_ATUALIZACAO,');
      Add('Nvl(LISTA.CD_EMPRESA,0) AS CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA M');
      Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA  CM ON CM.CD_MERCADORIA=M.CD_MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LISTA ON');
      Add('LISTA.CD_MERCADORIA=M.CD_MERCADORIA AND LISTA.CD_EMPRESA=CM.CD_EMPRESA');
      Add('WHERE');
      Add('M.ID_SITUACAO_MERCADORIA<>''I''');
      if PnrFornecedor>0 then
       Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrProduto>0 then
         Add('AND M.CD_MERCADORIA=:PnrProduto');

    end;
    Result:=false;
    with _cdsTabelaProdutoFornecedor do
    begin
         close;
         CommandText:=stQry.Text;
        if PnrFornecedor>0 then
            Params.ParamByName('PnrFornecedor').AsBCD:=PnrProduto;
        if PnrProduto>0 then
            Params.ParamByName('PnrProduto').AsBCD:=PnrProduto;
        open;
    end;
    if not _cdsTabelaProdutoFornecedor.IsEmpty then
       result:=true;
  finally
    FreeAndNil(stQry);
  end;
end;



function T_frmImportaPrecoFornecedor.CompraListaPrecoFornecedorExcel(PnrFornecedor,PnrProduto:Integer):Boolean;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.RemoteServer := _dm._LocalConexao;
    _cdsTemp.ProviderName := '_dspGenerica';

    with stQry do
    begin
      Add('SELECT');
      Add('M.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_MERCADORIA,');
      add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
      add('CM.CD_EMPRESA,VL_PRECO_COMPRA as VL_COMPRA_BASE , 0.0000  AS VL_COMPRA_LISTA ');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA M');
      Add('JOIN PRDDM.DC_COMPRA_MERCADORIA  CM ON CM.CD_MERCADORIA=M.CD_MERCADORIA');
      Add('JOIN PRDDM.DC_FINANCEIRO_MERCADORIA  FM ON FM.CD_MERCADORIA=CM.CD_MERCADORIA AND CM.CD_EMPRESA=FM.CD_EMPRESA');
      Add('WHERE');
      Add('M.ID_SITUACAO_MERCADORIA<>''I''');
      if PnrFornecedor>0 then
       Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
    end;
    Result:=false;
    stQry.SaveToFile('C:\TEMP\QryListaPrecoFornecedor');
    with _cdsLIstaBaseXListaPreco do
    begin
         close;
         CommandText:=stQry.Text;
         Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
        open;
    end;
    if not _cdsLIstaBaseXListaPreco.IsEmpty then
    begin
       result:=true;
       SetGridListaPrecoNova;
    end;
    if not _cdsTabelaProdutoFornecedor.IsEmpty then
       result:=true;
  finally
    FreeAndNil(stQry);
  end;
end;



function T_frmImportaPrecoFornecedor.GravaListaPreco(PCD_PRECO_FORNECEDOR_EXCECAO:Integer;
                                                     PDT_INICIO_VALIDADE,
                                                     PDT_FIM_VALIDADE:Tdate;
                                                     PCD_MERCADORIA:Integer;
                                                     PCD_INTERNO_LABORATORIO:String;
                                                     PQT_EMBALAGEM_COMPRA:Integer;
                                                     PVT_CAIXA_FECHADA,
                                                     PVT_CAIXA_FECHADA_DESCONTO,
                                                     PVL_COMPRA_MERCADORIA,
                                                     PVL_COMPRA_MERCADORIA_DESCONTO,
                                                     PPC_DESCONTO_COMPRA:Double;
                                                     PID_SITUACAO,
                                                     PNM_USUARIO:String;
                                                     PDT_ATUALIZACAO:Tdate;
                                                     PCD_EMPRESA,
                                                     PNR_VERBA:Integer):Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  cdEvento:Integer;
  DaDosPedido:TDadosValoresPedido;
begin
  try
    try
      result:=true;
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.add('INSERT INTO PRDDM.DC_PRECO_FORNECEDOR_EXCECAO');
        SQL.add('(CD_PRECO_FORNECEDOR_EXCECAO, CD_EMPRESA, DT_INICIO_VALIDADE,');
        SQL.add('DT_FIM_VALIDADE, CD_MERCADORIA, CD_INTERNO_LABORATORIO,');
        SQL.add('QT_EMBALAGEM_COMPRA, VT_CAIXA_FECHADA, VL_COMPRA_MERCADORIA,');
        SQL.add('VT_CAIXA_FECHADA_DESCONTO, VL_COMPRA_MERCADORIA_DESCONTO,');
        SQL.add('PC_DESCONTO_COMPRA, ID_SITUACAO, NM_USUARIO, DT_ATUALIZACAO,');
        SQL.add('NR_VERBA)');
        SQL.Add('VALUES');
        SQL.add('(:PCD_PRECO_FORNECEDOR_EXCECAO, :PCD_EMPRESA, :PDT_INICIO_VALIDADE,');
        SQL.add(':PDT_FIM_VALIDADE, :PCD_MERCADORIA, :PCD_INTERNO_LABORATORIO,');
        SQL.add(':PQT_EMBALAGEM_COMPRA, :PVT_CAIXA_FECHADA, :PVL_COMPRA_MERCADORIA,');
        SQL.add(':PVT_CAIXA_FECHADA_DESCONTO, :PVL_COMPRA_MERCADORIA_DESCONTO,');
        SQL.add(':PPC_DESCONTO_COMPRA, :PID_SITUACAO, :PNM_USUARIO,sysdate,');
        SQL.add(':PNR_VERBA)');

         ParamByName('PCD_PRECO_FORNECEDOR_EXCECAO').AsInteger:=PCD_PRECO_FORNECEDOR_EXCECAO;
         ParamByName('PCD_EMPRESA').AsInteger:=PCD_EMPRESA;
         ParamByName('PDT_INICIO_VALIDADE').AsString:=FormatDateTime('dd/mm/yyyy', PDT_INICIO_VALIDADE);
         ParamByName('PDT_FIM_VALIDADE').AsString:=FormatDateTime('dd/mm/yyyy',PDT_FIM_VALIDADE);
         ParamByName('PCD_MERCADORIA').AsInteger:=PCD_MERCADORIA;
         ParamByName('PCD_INTERNO_LABORATORIO').AsString:=PCD_INTERNO_LABORATORIO;
         ParamByName('PQT_EMBALAGEM_COMPRA').AsInteger:=PQT_EMBALAGEM_COMPRA;
         ParamByName('PVT_CAIXA_FECHADA').AsBCD:=PVT_CAIXA_FECHADA;
         ParamByName('PVL_COMPRA_MERCADORIA').AsBCD:=PVL_COMPRA_MERCADORIA;
         ParamByName('PVT_CAIXA_FECHADA_DESCONTO').AsBCD:=PVT_CAIXA_FECHADA_DESCONTO;
         ParamByName('PVL_COMPRA_MERCADORIA_DESCONTO').AsBCD:=PVL_COMPRA_MERCADORIA_DESCONTO;
         ParamByName('PPC_DESCONTO_COMPRA').AsBCD:=PPC_DESCONTO_COMPRA;
         ParamByName('PID_SITUACAO').AsString:=PID_SITUACAO;
         ParamByName('PNM_USUARIO').AsString:=PNM_USUARIO;
         paramByName('PNR_VERBA').AsInteger:=PNR_VERBA;
         //paramByName('PdtAtualizacao').AsString:=  FormatDateTime('dd/mm/yyyy',dtSistema);
         RESULT := True;
         if ExecSQL(False) <= 0 then
          RESULT := False;


      end;
    except
    on E: Exception do
      begin
        ShowMessage(E.Message+#13+
                    'Erro ao Gravar Capa Lista Pre?o' +
                    #13+QryTemp.TEXT);
        RESULT := False;
      end;

    end;
  finally
      FreeAndNil(QryTemp);
  end;
end;







function T_frmImportaPrecoFornecedor.AtualizaListaPreco(PCD_PRECO_FORNECEDOR_EXCECAO:Integer;
                                                     PDT_INICIO_VALIDADE,
                                                     PDT_FIM_VALIDADE:Tdate;
                                                     PCD_MERCADORIA:Integer;
                                                     PCD_INTERNO_LABORATORIO:String;
                                                     PQT_EMBALAGEM_COMPRA:Integer;
                                                     PVT_CAIXA_FECHADA,
                                                     PVT_CAIXA_FECHADA_DESCONTO,
                                                     PVL_COMPRA_MERCADORIA,
                                                     PVL_COMPRA_MERCADORIA_DESCONTO,
                                                     PPC_DESCONTO_COMPRA:Double;
                                                     PID_SITUACAO,
                                                     PNM_USUARIO:String;
                                                     PDT_ATUALIZACAO:Tdate;
                                                     PCD_EMPRESA,
                                                     PNR_VERBA:Integer):Boolean;

Var
  QryTemp: TSQLQuery;
  stTemp,msg: String;
  cdEvento:Integer;
  DaDosPedido:TDadosValoresPedido;
begin
  try
    try
      result:=true;
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.add('update  PRDDM.DC_PRECO_FORNECEDOR_EXCECAO');
        SQL.add('set QT_EMBALAGEM_COMPRA=:PQT_EMBALAGEM_COMPRA,');
        SQL.add('VT_CAIXA_FECHADA=:PVT_CAIXA_FECHADA,');
        SQL.add('VL_COMPRA_MERCADORIA=:PVL_COMPRA_MERCADORIA,');
        SQL.add('VT_CAIXA_FECHADA_DESCONTO=:PVT_CAIXA_FECHADA_DESCONTO,');
        SQL.add('VL_COMPRA_MERCADORIA_DESCONTO=:PVL_COMPRA_MERCADORIA_DESCONTO,');
        SQL.add('PC_DESCONTO_COMPRA=:PPC_DESCONTO_COMPRA,');
        SQL.add('DT_ATUALIZACAO=sysdate,');
        SQL.add('NR_VERBA=:PNR_VERBA,NM_USUARIO=:PNM_USUARIO');
        SQL.add('where');
        SQL.Add('CD_MERCADORIA=:PCD_MERCADORIA');
        SQL.Add('AND CD_EMPRESA=:PCD_EMPRESA');
        SQL.Add('AND trunc(DT_INICIO_VALIDADE)=:PDT_INICIO_VALIDADE');
        SQL.Add('and trunc(DT_FIM_VALIDADE)=:PDT_FIM_VALIDADE');
        SQL.ADD('AND ID_SITUACAO=''A''');

         ParamByName('PCD_EMPRESA').AsInteger:=PCD_EMPRESA;
         ParamByName('PDT_INICIO_VALIDADE').AsString:=FormatDateTime('dd/mm/yyyy',PDT_INICIO_VALIDADE);
         ParamByName('PDT_FIM_VALIDADE').AsString:=FormatDateTime('dd/mm/yyyy',PDT_FIM_VALIDADE);
         ParamByName('PCD_MERCADORIA').AsInteger:=PCD_MERCADORIA;
         ParamByName('PQT_EMBALAGEM_COMPRA').AsInteger:=PQT_EMBALAGEM_COMPRA;
         ParamByName('PVT_CAIXA_FECHADA').AsBCD:=PVT_CAIXA_FECHADA;
         ParamByName('PVL_COMPRA_MERCADORIA').AsBCD:=PVL_COMPRA_MERCADORIA;
         ParamByName('PVT_CAIXA_FECHADA_DESCONTO').AsBCD:=PVT_CAIXA_FECHADA_DESCONTO;
         ParamByName('PVL_COMPRA_MERCADORIA_DESCONTO').AsBCD:=PVL_COMPRA_MERCADORIA_DESCONTO;
         ParamByName('PPC_DESCONTO_COMPRA').AsBCD:=PPC_DESCONTO_COMPRA;
         ParamByName('PNM_USUARIO').AsString:=PNM_USUARIO;
         paramByName('PNR_VERBA').AsInteger:=PNR_VERBA;
         RESULT := True;
         if ExecSQL(False) <= 0 then
          RESULT := False;


      end;
    except
    on E: Exception do
      begin
        ShowMessage(E.Message+#13+
                    'Erro ao Atualiza Lista Pre?o'+#13+
                    QryTemp.TEXT);
        RESULT := False;
      end;

    end;
  finally
      FreeAndNil(QryTemp);
  end;
end;



function T_frmImportaPrecoFornecedor.NrUltimaLista:Integer;
Var
  QryTemp: TSQLQuery;
begin
  try
    try
      QryTemp := TSQLQuery.Create(NIL);
      QryTemp := _dm.criaQueryGenerica;
      with QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.add('select Nvl(max(CD_PRECO_FORNECEDOR_EXCECAO)+1,1) AS NR_LISTA');
        SQL.add('from PRDDM.DC_PRECO_FORNECEDOR_EXCECAO');
        Open;
      end;
      Result:=0;
      if NOT QryTemp.IsEmpty then
         Result:=QryTemp.FieldByName('NR_LISTA').AsInteger;
    except
      on E: Exception do
      begin
        trataerro(E.Message, 'Erro ao Gravar Capa Lista Pre?o..');
      end;

    end;
  finally
      FreeAndNil(QryTemp);
  end;
end;



procedure T_frmImportaPrecoFornecedor.AtualizaListaPrecoBase(Tabela:TclientDataset);
var
 nrLista:Integer;
 DadosCodigo :TCodigoValido;
 nrregistro:Integer;
 dtInicial,
 dtFinal:TDate;
begin

tabela.Open;
tabela.First;

nrLista:=NrUltimaLista;
_gaPlanilha.MinValue:=0;
_gaPlanilha.MaxValue:=Tabela.RecordCount;
 nrregistro:=0;

 dtInicial:=_dtpDataInicial.Date;
 dtFinal  :=_dtpDataFinal.Date;
while not Tabela.Eof do
begin
  inc(nrregistro);
  _gaPlanilha.Progress:=nrregistro;

  DadosCodigo:= TransformaStringCodigo(tabela.FieldByName('NR_MERCADORIA').AsString);
  Mercadoria :=nil;
  Mercadoria        := GetMercadoriaNova(DadosCodigo.nrCodigo,
                                         DadosCodigo.nrDigito,
                                         0,
                                         Tabela.FieldByName('CD_EMPRESA').AsInteger,
                                         1,'');

if Mercadoria<>NIL then
begin
if not TestaItemListaPrecoAtivas(Mercadoria.nrLaboratorio,
                             Mercadoria.nrProduto,
                             Tabela.FieldByName('CD_EMPRESA').AsInteger,
                             dtSistema,
                             dtSistema+30) then
begin

if not GravaListaPreco( nrLista, //PCD_PRECO_FORNECEDOR_EXCECAO:Integer;
                        dtInicial,// //PDT_INICIO_VALIDADE,
                        dtFinal,//PDT_FIM_VALIDADE:Tdate;
                        Mercadoria.nrProduto,//PCD_MERCADORIA:Integer;
                        Mercadoria.cdInternoFornecedor,
                        Mercadoria.qtEmbalagemCompra,//   PQT_EMBALAGEM_COMPRA:Integer;
                        Tabela.FieldByName('VL_UNITARIO').AsFloat*Mercadoria.qtEmbalagemCompra,//PVT_CAIXA_FECHADA,
                        Tabela.FieldByName('VL_UNITARIO_DESCONTO').AsFloat*Mercadoria.qtEmbalagemCompra,//PVT_CAIXA_FECHADA_DESCONTO,
                        Tabela.FieldByName('VL_UNITARIO').AsFloat,// PVL_COMPRA_MERCADORIA,
                        Tabela.FieldByName('VL_UNITARIO_DESCONTO').AsFloat,//PVL_COMPRA_MERCADORIA_DESCONTO,
                        Tabela.FieldByName('PC_DESCONTO').AsFloat,//PPC_DESCONTO_COMPRA:Double;
                         'A',//         PID_SITUACAO,
                         nmLogin,//   PNM_USUARIO:String;
                         dtSistema,//  PDT_ATUALIZACAO:Tdate;
                         Tabela.FieldByName('CD_EMPRESA').AsInteger,// PCD_EMPRESA,
                         Tabela.FieldByName('NR_VERBA').AsInteger) then
         begin
           if Confirma('Erro ao gravar tabela pre?o fornecedor!!!'+#13+
                      'Provalmente j? existe uma lista ativa para esse periodo'+#13+
                      'Cancelar Importa??o de dados ?',MB_DEFBUTTON2)= idyes then
                 exit;

         end;
end
else
begin
   AtualizaListaPreco(nrLista, //PCD_PRECO_FORNECEDOR_EXCECAO:Integer;
                        dtInicial,// //PDT_INICIO_VALIDADE,
                        dtFinal,//PDT_FIM_VALIDADE:Tdate;
                        Mercadoria.nrProduto,//PCD_MERCADORIA:Integer;
                        Mercadoria.cdInternoFornecedor,
                        Mercadoria.qtEmbalagemCompra,//   PQT_EMBALAGEM_COMPRA:Integer;
                        Tabela.FieldByName('VL_UNITARIO').AsFloat*Mercadoria.qtEmbalagemCompra,//PVT_CAIXA_FECHADA,
                        Tabela.FieldByName('VL_UNITARIO_DESCONTO').AsFloat*Mercadoria.qtEmbalagemCompra,//PVT_CAIXA_FECHADA_DESCONTO,
                        Tabela.FieldByName('VL_UNITARIO').AsFloat,// PVL_COMPRA_MERCADORIA,
                        Tabela.FieldByName('VL_UNITARIO_DESCONTO').AsFloat,//PVL_COMPRA_MERCADORIA_DESCONTO,
                        Tabela.FieldByName('PC_DESCONTO').AsFloat,//PPC_DESCONTO_COMPRA:Double;
                         'A',//         PID_SITUACAO,
                         nmLogin,//   PNM_USUARIO:String;
                         dtSistema,//  PDT_ATUALIZACAO:Tdate;
                         Tabela.FieldByName('CD_EMPRESA').AsInteger,// PCD_EMPRESA,
                         Tabela.FieldByName('NR_VERBA').AsInteger)
end;
end;

 Tabela.NEXT;
end;
 Mensagem('Tabela Importada!!! ',MB_ICONWARNING);
end;




function T_frmImportaPrecoFornecedor.ListaPrecoAtivas(PnrFornecedor,PnrProduto:Integer):Boolean;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);

    with stQry do
    begin
      ADD('SELECT CD_PRECO_FORNECEDOR_EXCECAO');
      ADD(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) NR_ITENS,NR_VERBA');
      ADD('FROM');
      ADD('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPF,');
      ADD('PRDDM.DC_COMPRA_MERCADORIA  CM');
      ADD('WHERE');
      ADD('LPF.CD_MERCADORIA=CM.CD_MERCADORIA');
      ADD('AND LPF.CD_EMPRESA=CM.CD_EMPRESA');
      if PnrFornecedor>0 then
         ADD('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrProduto>0 then
         Add('AND CM.CD_MERCADORIA=:PnrProduto');
      ADD('AND ID_SITUACAO=''A''');
      ADD('GROUP BY CD_PRECO_FORNECEDOR_EXCECAO,DT_INICIO_VALIDADE ,DT_FIM_VALIDADE,NR_VERBA');
      add('ORDER BY CD_PRECO_FORNECEDOR_EXCECAO DESC');

   end;
    Result:=false;
    with _cdsListaPrecoAtiva do
    begin
         close;
         CommandText:=stQry.Text;
        if PnrFornecedor>0 then
            Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
        if PnrProduto>0 then
            Params.ParamByName('PnrProduto').AsBCD:=PnrProduto;
        open;
    end;
    if not _cdsListaPrecoAtiva.IsEmpty then
    begin
       result:=true;
       SetGridListaPreco;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;




procedure T_frmImportaPrecoFornecedor.SetGridListaPreco;
begin
//CD_PRECO_FORNECEDOR_EXCECAO');
  //    ADD(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) ');

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_LISTA')).DisplayLabel:='Nr. Lista';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_LISTA')).DisplayWidth:=6;

  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayLabel:='Dt.Inicio';
  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayWidth:=10;
  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayFormat:='dd/mm/yyyy';

  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayLabel:='Dt.FinalL';
  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayWidth:=10;
  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayFormat:='dd/mm/yyyy';

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_ITENS')).DisplayLabel:='Nr. Itens';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_ITENS')).DisplayWidth:=6;

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_VERBA')).DisplayLabel:='Nr. Itens';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_VERBA')).DisplayWidth:=6;
end;



function T_frmImportaPrecoFornecedor.TestaItemListaPrecoAtivas(PnrFornecedor,PnrProduto,PnrEmpresa:Integer;PdtInicio,PdtFinal:Tdate):Boolean;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);

    with stQry do
    begin
      ADD('SELECT CD_PRECO_FORNECEDOR_EXCECAO');
      ADD(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) NR_ITENS,NR_VERBA');
      ADD('FROM');
      ADD('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPF,');
      ADD('PRDDM.DC_COMPRA_MERCADORIA  CM');
      ADD('WHERE');
      ADD('LPF.CD_MERCADORIA=CM.CD_MERCADORIA');
      ADD('AND LPF.CD_EMPRESA=CM.CD_EMPRESA');
      ADD('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      Add('AND CM.CD_MERCADORIA=:PnrProduto');
      Add('AND CM.CD_EMPRESA=:PnrEmpresa');
      Add('AND trunc(DT_INICIO_VALIDADE)=:PdtIncio');
      Add('and trunc(DT_FIM_VALIDADE)=:PdtFinal');
      ADD('AND ID_SITUACAO=''A''');
      ADD('GROUP BY CD_PRECO_FORNECEDOR_EXCECAO,DT_INICIO_VALIDADE ,DT_FIM_VALIDADE,NR_VERBA');

   end;
    Result:=false;
    stQry.SaveToFile('C:\temp\qryListaPrecoExcecao.sql');
    with _cdsListaPrecoAtiva do
    begin
     close;
     CommandText:=stQry.Text;
     Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
     Params.ParamByName('PnrProduto').AsBCD:=PnrProduto;
     Params.ParamByName('PnrEmpresa').AsBCD:=PnrEmpresa;
     Params.ParamByName('PdtIncio').AsString:=FormatDateTime('dd/mm/yyyy',PdtInicio);
     Params.ParamByName('PdtFinal').AsString:=FormatDateTime('dd/mm/yyyy',PdtFinal);
     open;
    end;
    if not _cdsListaPrecoAtiva.IsEmpty then
    begin
       result:=true;
      // SetGridListaPreco;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;



function T_frmImportaPrecoFornecedor.ComparaListaPrecoAtivas(PnrFornecedor,PnrLista:Integer):Boolean;
var
  stQry: TstringList;
  _cdsTemp:TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);

    with stQry do
    begin
      ADD('SELECT');
      ADD('M.CD_MERCADORIA*10+NR_DV_MERCADORIA CD_MERCADORIA,NM_MERCADORIA,');
      ADD('DS_APRESENTACAO_MERCADORIA,VL_COMPRA_BASE,CM.CD_EMPRESA,  Round(nvl(LISTA_NOVA.vl_compra_mercadoria,0),2) VL_COMPRA_LISTA');
      ADD('FROM');
      ADD('PRDDM.DC_MERCADORIA M');
      ADD('JOIN PRDDM.DC_COMPRA_MERCADORIA CM ON CM.CD_MERCADORIA=M.CD_MERCADORIA');
      ADD('LEFT OUTER JOIN PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LISTA_NOVA ON');
      ADD('LISTA_NOVA.CD_MERCADORIA=CM.CD_MERCADORIA');
      ADD('AND LISTA_NOVA.CD_EMPRESA=CM.CD_EMPRESA AND CD_PRECO_FORNECEDOR_EXCECAO=:PnrLista');
      ADD('LEFT OUTER JOIN');
      ADD('(SELECT');
      ADD('CD_MERCADORIA,MAX(VL_UNITARIO_COMPRA) AS  VL_COMPRA_BASE,CD_EMPRESA,0.00 AS VL_COMPRA_LISTA');
      ADD('FROM');
      ADD('PRDDM.DC_LISTA_PRECO_FORNECEDOR A');
      ADD('WHERE');
      ADD('A.DT_MUDANCA_PRECO=(SELECT MAX(B.DT_MUDANCA_PRECO)');
      ADD('FROM');
      ADD('PRDDM.DC_LISTA_PRECO_FORNECEDOR B,');
      ADD('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      ADD('WHERE COMPRA.CD_MERCADORIA=B.CD_MERCADORIA');
      ADD('AND A.CD_MERCADORIA=B.CD_MERCADORIA');
      ADD('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      ADD('');
      ADD('AND COMPRA.CD_EMPRESA=B.CD_EMPRESA');
      ADD('AND B.DT_ATUALIZACAO <=TRUNC(SYSDATE) AND B.CD_EMPRESA= A.CD_EMPRESA)');
      ADD('GROUP BY CD_MERCADORIA,CD_EMPRESA) LISTA');
      ADD('ON LISTA.CD_MERCADORIA=CM.CD_MERCADORIA AND LISTA.CD_EMPRESA=CM.CD_EMPRESA');
      ADD('WHERE');
      ADD('M.ID_SITUACAO_MERCADORIA<>''I''');
      ADD('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');

   end;
    Result:=false;
    with _cdsLIstaBaseXListaPreco do
    begin
         close;
         CommandText:=stQry.Text;
         Params.ParamByName('PnrFornecedor').AsBCD:=PnrFornecedor;
         Params.ParamByName('PnrLista').AsBCD:=PnrLista;
        open;
    end;
    if not _cdsLIstaBaseXListaPreco.IsEmpty then
    begin
       result:=true;
       SetGridListaPrecoNova;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;





procedure T_frmImportaPrecoFornecedor._dbgBaseXListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var
  vlPrecoBase,
  vlPrecoLista:Double;
  stPrecoBase,
  stPrecoLista:String;
begin
  with _dbgBaseXLista do
  begin
    if _dsLIstaBaseXListaPreco.DataSet.FieldByName('CD_EMPRESA').AsInteger=1 then
    begin
      Canvas.Font.Color:= clBlack;
      Canvas.Brush.Color:= clSkyBlue;
    end;
    if _dsLIstaBaseXListaPreco.DataSet.FieldByName('CD_EMPRESA').AsInteger=4 then
    begin
        Canvas.Font.Color:= clBlack;
        Canvas.Brush.Color:= clWhite;
        //Canvas.Brush.Color:= $000080FF;
     // Canvas.Brush.Color:= clInactiveCaption;
    end;
    stPrecoBase := FormatFloat('###,###,##0.00',_dsLIstaBaseXListaPreco.DataSet.FieldByName('VL_COMPRA_BASE').AsFloat);
    stPrecoLista:= FormatFloat('###,###,##0.00',_dsLIstaBaseXListaPreco.DataSet.FieldByName('VL_COMPRA_LISTA').AsFloat);


    vlPrecoBase := strtofloat(FormatFloat('###,###,##0.00',_dsLIstaBaseXListaPreco.DataSet.FieldByName('VL_COMPRA_BASE').AsFloat));
    vlPrecoLista:= strtofloat(FormatFloat('###,###,##0.00',_dsLIstaBaseXListaPreco.DataSet.FieldByName('VL_COMPRA_LISTA').AsFloat));

    if (vlPrecoBase<>vlPrecoLista)     then
    begin
        Canvas.Font.Color:= clBlack;
        Canvas.Brush.Color:= clYellow;
        //Canvas.Brush.Color:= $000080FF;
     // Canvas.Brush.Color:= clInactiveCaption;
    end;
    if (vlPrecoLista=0)     then
    begin
        Canvas.Font.Color:= clBlack;
        Canvas.Brush.Color:= clRed;
        //Canvas.Brush.Color:= $000080FF;
     // Canvas.Brush.Color:= clInactiveCaption;
    end;

{    If odd(_dsPedidoElaboradorSC.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clScrollBar;
 end;}


 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clBlue;
    Canvas.Font.Color:= clWhite;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmImportaPrecoFornecedor._dbgBaseXListaTitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsLIstaBaseXListaPreco,Column);
end;

procedure T_frmImportaPrecoFornecedor.DBGrid2DblClick(Sender: TObject);
begin
 if DadosFornecedor<>nil then
 begin
   if _cdsListaPrecoAtiva.Active then
    ComparaListaPrecoAtivas(DadosFornecedor.nrFornecedor,
                            _cdsListaPrecoAtiva.FieldByName('NR_LISTA').AsInteger )
   else
      ComparaListaPrecoAtivas(DadosFornecedor.nrFornecedor,
                            0);

 end;

end;

procedure T_frmImportaPrecoFornecedor.SetGridListaPrecoNova;
begin

  TIntegerField(_cdsLIstaBaseXListaPreco.FieldByName('CD_MERCADORIA')).DisplayLabel:='Cod.Produto';
  TIntegerField(_cdsLIstaBaseXListaPreco.FieldByName('CD_MERCADORIA')).DisplayWidth:=6;

  TStringField(_cdsLIstaBaseXListaPreco.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
  TStringField(_cdsLIstaBaseXListaPreco.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsLIstaBaseXListaPreco.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
  TStringField(_cdsLIstaBaseXListaPreco.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=20;


  TFloatField(_cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_BASE')).DisplayLabel:='Vlr. Base';
  TFloatField(_cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_BASE')).DisplayFormat:='###,###,##0.00';
  TFloatField(_cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_BASE')).DisplayWidth:=12;

  TFloatField(_cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_LISTA')).DisplayLabel:='Vlr.Lista Nova';
  TFloatField(_cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_LISTA')).DisplayFormat:='###,###,##0.00';
  TFloatField(_cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_LISTA')).DisplayWidth:=12;

  TIntegerField(_cdsLIstaBaseXListaPreco.FieldByName('CD_EMPRESA')).DisplayLabel:='CD';
  TIntegerField(_cdsLIstaBaseXListaPreco.FieldByName('CD_EMPRESA')).DisplayWidth:=2;

//  TIntegerField(_cdsLIstaBaseXListaPreco.FieldByName('NR_PRODUTO')).DisplayLabel:='Nr.Produto';
  //TIntegerField(_cdsLIstaBaseXListaPreco.FieldByName('NR_PRODUTO')).DisplayWidth:=6;
end;

procedure T_frmImportaPrecoFornecedor.filtraDiferenca;
begin
   _cdsLIstaBaseXListaPreco.Filtered:=false;
   if _chkListaDiferenca.Checked then
    with _cdsLIstaBaseXListaPreco do
    begin
      Filtered:=false;
      filter:='VL_COMPRA_LISTA<>VL_COMPRA_BASE';
      Filtered:=true;
    end;

end;


function T_frmImportaPrecoFornecedor.SetCampoLista(PnrProduto,PnrEmpresa:Integer;PvlLista:Double):Boolean;
begin
    if _cdsLIstaBaseXListaPreco.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([PnrProduto, PnrEmpresa]), []) then
    begin
      _cdsLIstaBaseXListaPreco.Open;
      _cdsLIstaBaseXListaPreco.Edit;
      _cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_LISTA').AsFloat:=PvlLista;

    end;

end;


procedure T_frmImportaPrecoFornecedor.AlteraPreco(PcdProduto,PnrEmpresa:Integer;PvlPreco:Double);
var
stPrecoLista:String;
begin
    if DadosFornecedor=NIL then
    begin
      Mensagem('Digiete nr. Fornecedor',MB_ICONWARNING);
      _edtNrFornecedor.SelectAll;
      _edtNrFornecedor.SetFocus;
      exit;
    end;


     if DadosFornecedor<>nil then
      ComparaListaPrecoAtivas(DadosFornecedor.nrFornecedor,
                            0);

   _cdsTabelaPrecoFornecedor.First;
   while not _cdsTabelaPrecoFornecedor.Eof do
   begin
      stPrecoLista:= FormatFloat('###,###,##0.00',_cdsTabelaPrecoFornecedorVL_UNITARIO.AsFloat);

     SetCampoLista(_cdsTabelaPrecoFornecedorNR_MERCADORIA.AsInteger,
                   _cdsTabelaPrecoFornecedorCD_EMPRESA.AsInteger,
                   strtofloat(stPrecoLista));

      Application.ProcessMessages;
     _cdsTabelaPrecoFornecedor.Next;
   end;


end;


function T_frmImportaPrecoFornecedor.LocalizaPrecoFornecedor(PcdProduto,PnrEmpresa:Integer):Double;
begin

    if  _cdsTabelaProdutoFornecedor.Locate('CD_MERCADORIA;CD_EMPRESA',VarArrayOf([PcdProduto,PnrEmpresa]),[]) then
        Result:=_cdsTabelaProdutoFornecedor.FieldByName('VL_PRECO_COMPRA').AsFloat;

end;

function T_frmImportaPrecoFornecedor.SetPrecoComparacao(PnrProduto,PnrEmpresa:Integer;PvlLista:Double):Boolean;
begin
   _cdsLIstaBaseXListaPreco.open;
   if _cdsLIstaBaseXListaPreco.Locate('CD_MERCADORIA;cd_EMPRESA',VarArrayOf([PnrProduto,PnrEmpresa]),[]) then
   begin
     _cdsLIstaBaseXListaPreco.edit;
     _cdsLIstaBaseXListaPreco.FieldByName('VL_COMPRA_LISTA').AsFloat:=PvlLista;
     _cdsLIstaBaseXListaPreco.post;
   end;

end;



function T_frmImportaPrecoFornecedor.GetPrecoItem(PnrProduto,
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
    filter := 'CD_MERCADORIA=' + IntToStr(PnrProduto) + ' AND CD_EMPRESA=' +
      IntToStr(PcdEmpresa);
    Filtered := true;
    // Params.ParamByName()
  end;
  Result.vlPrecoLista := PvlPrecoFornecedor;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;
  Result.PcDescontoLista := 0;

  if not _cdsTabelaPreco.IsEmpty then
  begin
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat > 0 then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA')
        .AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM')
        .AsInteger;
      Result.vlPrecoBase := _cdsTabelaPreco.FieldByName
        ('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName
        ('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista := _cdsTabelaPreco.FieldByName
        ('PC_IPI_MERCADORIA').AsFloat;
    end;
    if _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat = 0 then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA')
        .AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := 0;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM')
        .AsInteger;
      Result.vlPrecoBase := _cdsTabelaPreco.FieldByName
        ('VL_UNITARIO_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName
        ('PC_ICMS_COMPRA_ANTERIOR').AsFloat;
      Result.PcIPILista := _cdsTabelaPreco.FieldByName
        ('PC_IPI_MERCADORIA').AsFloat;
    end;

    if PidPedidoBloqueado = 1 then
    begin

    end;

    if PIdPrecoAtual = 'N' then
    begin
      Result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_LISTA_ANTERIOR')
        .AsFloat * PpcDescontoAbatimento;
      Result.pcReajustePreco := _cdsTabelaPreco.FieldByName
        ('PC_MUDANCA_PRECO').AsFloat;
      Result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM')
        .AsInteger;
    end;
    if Result.pcReajustePreco < 0 then
      Result.pcReajustePreco := 0;

    if PnrLIstaPrecoAtiva > 0 then
    begin
      DadosListaPreco := SetListaPrecoAtiva(PnrLIstaPrecoAtiva, PnrProduto,
        PcdEmpresa);
      if (DadosListaPreco.vlPrecoLista > 0) then
      begin
        Result.nrListaPreco := PnrLIstaPrecoAtiva;
        Result.vlPrecoBase := DadosListaPreco.vlPrecoLista;
        Result.PcDescontoLista := DadosListaPreco.pcDescontoAdicional;
        Result.vlPrecoLista := DadosListaPreco.vlPrecoComdesconto;
        Result.nrVerba := DadosListaPreco.nrVerba;
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


function T_frmImportaPrecoFornecedor.SetListaPrecoAtiva(PnrLista, PnrProduto,
  PnrEmpresa: Integer): TListaPrecoAtiva;
begin

  Result.vlPrecoLista := 0;
  Result.vlPrecoComdesconto := 0;
  Result.PcIcmsCompra := 0;
  Result.pcDescontoAdicional := 0;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;

  if _cdsListaPrecoAtiva.Locate
    ('CD_PRECO_FORNECEDOR_EXCECAO;CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrLista, PnrProduto, PnrEmpresa]), []) then
  begin

    Result.vlPrecoLista := _cdsListaPrecoAtiva.FieldByName
      ('VL_COMPRA_MERCADORIA').AsFloat;
    Result.vlPrecoComdesconto := _cdsListaPrecoAtiva.FieldByName
      ('VL_COMPRA_MERCADORIA_DESCONTO').AsFloat;
    Result.pcDescontoAdicional := _cdsListaPrecoAtiva.FieldByName
      ('PC_DESCONTO_COMPRA').AsFloat;
    Result.nrListaPreco := PnrLista;
    Result.nrVerba := _cdsListaPrecoAtiva.FieldByName('NR_VERBA').AsInteger;

  end;

end;


end.
