unit uDadosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uProduto, DB, DBClient, ComObj,
  uAuxiliarCompras, Grids, DBGrids, TeEngine, Series, TeeProcs, Chart,dateUtils,
  uRotinasGenericas, Buttons;

type
  T_frmDadosProduto = class(TForm)
    StatusBar1: TStatusBar;
    _lbeCodigoProduto: TLabeledEdit;
    _lbeProdutoApresentacao: TLabeledEdit;
    _lbeCipado: TLabeledEdit;
    _lbeCdInternoLaboratorio: TLabeledEdit;
    _lbeCompradorMes: TLabeledEdit;
    _lbeMudancaPreco: TLabeledEdit;
    _lbeUltEntrada: TLabeledEdit;
    _lbeUltimaSaida: TLabeledEdit;
    _lbeFinalidade: TLabeledEdit;
    _lbeLaboratorio: TLabeledEdit;
    _lbeLinha: TLabeledEdit;
    _lbeLocalizacao: TLabeledEdit;
    _lbeRepasseIcms: TLabeledEdit;
    _lbeRetemIcms: TLabeledEdit;
    _lbeSuperfulo: TLabeledEdit;
    _lbeUnidadeMedida: TLabeledEdit;
    _edtEstoqueProblematico: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    _edtReservaPedido: TEdit;
    _edtReservaVencido: TEdit;
    Label3: TLabel;
    _edtEstoqueFisico: TEdit;
    Label4: TLabel;
    _edtValorEstoqueFinanceiro: TEdit;
    Label5: TLabel;
    _edtTaxaIPI: TEdit;
    Label6: TLabel;
    _edtEmbalagemCompra: TEdit;
    Label7: TLabel;
    _edtEmbalagemVenda: TEdit;
    Label8: TLabel;
    _edtPrecoCompra: TEdit;
    Label9: TLabel;
    _edtdescontoPadrao: TEdit;
    Label10: TLabel;
    _edtPrecoAtual: TEdit;
    Label11: TLabel;
    _edtPrecoVendaAnterior: TEdit;
    Label12: TLabel;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    _edtCurva: TEdit;
    Label13: TLabel;
    _cdsVendasProduto: TClientDataSet;
    _dsVendasProduto: TDataSource;
    _chtVendas: TChart;
    Series1: TBarSeries;
    _chtEntradas: TChart;
    BarSeries1: TBarSeries;
    _chtPedidos: TChart;
    BarSeries2: TBarSeries;
    _cdsEntradas: TClientDataSet;
    _cdsUltimospedido: TClientDataSet;
    BitBtn1: TBitBtn;
    _lbeSituacao: TLabeledEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _lbeCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    dtReferenciaLocal:Tdate;

    procedure SetDadosProduto;
    procedure ZeraArray;
    procedure CarregaVendasArraySC;
    procedure MontaGraficoSC;
    procedure FiltraVendaLaboratorio(nrProduto, nrEmpresa,
      nrOperadorLogistico: Integer);
    function MaiorVendaProduto(PnrProduto,PnrCD:Integer): double;
    procedure MontaGraficoIncial;
    procedure CarregaEntradas;
    procedure FiltraEntradaProduto(nrProduto, nrEmpresa,
      nrOperadorLogistico: Integer);
    procedure MontaGraficoEntradas;
    function MaiorEntradaProduto(PnrProduto, PnrCD: Integer): double;
    procedure CarregaPedidos;
    procedure MontaGraficoPedidos;
    function MaiorpedidoProduto(PnrProduto, PnrCD: Integer): double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmDadosProduto: T_frmDadosProduto;
  DadosProduto :TMercadoria;
  nrCdFisico  :Integer;
  qtVendaMesSC: array[1..13] of double;
  qtVendaMesRS: array[1..13] of double;
  qtEntradas  : array[1..13] of double;
  qtPedidos   : array[1..13] of double;


implementation

{$R *.dfm}

procedure T_frmDadosProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmDadosProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : close;
  end;
end;

procedure T_frmDadosProduto._lbeCodigoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 nrTemp,dgtemp :Integer;
 stTemp:String;
begin
  case key of
  VK_RETURN :begin
               nrTemp:=StrToIntDef(copy( FormatFloat('0000000',StrToIntDef(_lbeCodigoProduto.Text,0)),1,6),0);
               dgTemp:=StrToIntDef(copy( FormatFloat('0000000',StrToIntDef(_lbeCodigoProduto.Text,0)),7,1),0);
               if nrTemp=0 then
               begin
                 _lbeCodigoProduto.SetFocus;
                 exit;
               end;
               if _cbxOpcaoCDs.ItemIndex=0 then
                  nrCdFisico:=1;
               if _cbxOpcaoCDs.ItemIndex=1 then
                  nrCdFisico:=4;
              ZeraArray;
              MontaGraficoIncial;

               DadosProduto:=GetMercadoriaNova(nrTemp,dgtemp,0,nrCdFisico,1,'');


               if DadosProduto<>nil then
                  SetDadosProduto;
  _lbeCodigoProduto.SelectAll;
  _lbeCodigoProduto.SetFocus;


  end;

  end;

end;

procedure T_frmDadosProduto.SetDadosProduto;
var
  stLinha:String[15];
  nmTituloGrafico:String;
  corBarra :Tcolor;
begin
  _lbeCodigoProduto.Text:= FormatFloat('0000000',DadosProduto.cdProduto);
  _lbeProdutoApresentacao.Text:= DadosProduto.nmProdutoCompleto;
  _lbeFinalidade.Text:=DadosProduto.dsFinalidade;
  _lbeCipado.Text:='N?o';
  if DadosProduto.idCipado='S' then
     _lbeCipado.Text:='Sim';

  _lbeRepasseIcms.Text:='N?o';
  if DadosProduto.idRepasseIcms='S' then
     _lbeRepasseIcms.Text:='Sim';

  _lbeRetemIcms.Text:='N?o';
  if DadosProduto.idRetemICMS='S' then
    _lbeRetemIcms.Text:='Sim';
  _lbeSuperfulo.Text:='N?o';
  if DadosProduto.idSuperfulo='S' then
    _lbeSuperfulo.Text:='Sim';

  _lbeSituacao.Text:='Ativo';
  if DadosProduto.idSituacaoMercadoriaCompra='I' then
     _lbeSituacao.Text:='Inativo';


  _lbeLaboratorio.Text :=  FormatFloat('0000000',DadosProduto.nrLaboratorio)+' - '+
                           DadosProduto.dsRazaoSocialFornecedor;

  _lbeCdInternoLaboratorio.Text:=DadosProduto.cdInternoFornecedor;

     if DadosProduto.nrTipoProduto=1 then
      stLinha:='Medicamento';
   if DadosProduto.nrTipoProduto=2 then
      stLinha:='Perfumaria';
   if DadosProduto.nrTipoProduto>2 then
      stLinha:='Outros';
     _lbeLinha.Text:=stLinha;
    _lbeLocalizacao.Text:= DadosProduto.dsLocalizacao;
    _lbeMudancaPreco.Text:=FormatDateTime('DD/MM/YYYY',DadosProduto.dtAtualizacaoPreco);
    _edtPrecoAtual.Text  :=FormatFloat('###,###,##0.00',DadosProduto.vlPrecoVenda);
    _edtPrecoCompra.Text  :=FormatFloat('###,###,##0.00',DadosProduto.vlPrecoCompra);
    _edtTaxaIPI.Text       :=FormatFloat('###,###,##0.00',DadosProduto.pcIpiProduto);
    _edtdescontoPadrao.Text  :=FormatFloat('###,###,##0.00',DadosProduto.pcDescontoPadrao);
    _edtValorEstoqueFinanceiro.Text  :=FormatFloat('###,###,##0.00',DadosProduto.vlFinanceiroEstoque);

    _edtPrecoVendaAnterior.Text  :=FormatFloat('###,###,##0.00',DadosProduto.vlPrecoVendaAnterior);
    _lbeUltEntrada.Text          :=FormatDateTime('DD/MM/YYYY',DadosProduto.dtUltimaEntrada);
    _lbeUltimaSaida.Text         :=FormatDateTime('DD/MM/YYYY',DadosProduto.dtUltimaSaida);

    _edtEmbalagemCompra.Text      :=FormatFloat('###,###,##0',DadosProduto.qtEmbalagemCompra);
    _edtEmbalagemVenda.Text      :=FormatFloat('###,###,##0',DadosProduto.qtEmbalagemVenda);
    _edtEstoqueFisico.Text       :=FormatFloat('###,###,##0',DadosProduto.qtEstoqueFISICO);
    _edtEstoqueProblematico.Text :=FormatFloat('###,###,##0',DadosProduto.nrReservaProblematica);
    _edtReservaPedido.Text       :=FormatFloat('###,###,##0',DadosProduto.nrUnidadeReservaPedido);
    _edtReservaVencido.Text      :=FormatFloat('###,###,##0',DadosProduto.nrUnidadesVencidas);
    _edtCurva.Text               :=DadosProduto.idCurva;
    _lbeUnidadeMedida.Text       :=DadosProduto.dsUnidadeMedia;
    Application.ProcessMessages;
   _cdsVendasProduto:=DadosVendaMes(0,DadosProduto.nrProduto,nrCdFisico);
    if _cdsVendasProduto<>NIL then
    begin
     _cdsVendasProduto.Open;
     if _cdsVendasProduto.Active then
     begin
          _cdsVendasProduto.RecordCount;
          _dsVendasProduto.DataSet:=_cdsVendasProduto;
          CarregaVendasArraySC
     end;
     Application.ProcessMessages;
     _cdsEntradas:=DadosEntradaUltimosMeses(0,DadosProduto.nrProduto,nrCdFisico);


   nmTituloGrafico:='Entadas no CD RS';
   corBarra := $000080FF; ;
   if nrCdFisico=1 then
   begin
     nmTituloGrafico:='Entadas no CD SC';
     corBarra := clTeal;
    end;
    _chtEntradas.Title.Caption:=nmTituloGrafico;

     if _cdsEntradas<>nil then
     begin
       CarregaEntradas;
       MontaGraficoEntradas;
     end;
     Application.ProcessMessages;
     _cdsUltimospedido:=DadosPedidosUltimosMeses(0,DadosProduto.nrProduto,nrCdFisico);
//   contaMes := Mesreferencia;
  BarSeries2.Clear;
  nmTituloGrafico:='Pedidos para o CD RS';
  corBarra := $000080FF; ;
  if nrCdFisico=1 then
  begin
  nmTituloGrafico:='Pedidos para o CD SC';
     corBarra := clTeal;
  end;
  _chtPedidos.Title.Caption:=nmTituloGrafico;


     if _cdsUltimospedido<>nil then
     begin
       CarregaPedidos;
       MontaGraficoPedidos;
     end;


   end;


end;

procedure T_frmDadosProduto.ZeraArray;
var
 i :Integer;
begin
   for I := 1 to 13 do
  begin
    qtVendaMesSC[I] := 0;
    qtVendaMesRS[I] := 0;
    qtEntradas[i]   := 0;
    qtPedidos[i]    := 0;
  end;
end;

procedure T_frmDadosProduto.CarregaVendasArraySC;
var
nrMesReferencia :Integer;
begin
   _cdsVendasProduto.Open;
   dtReferenciaLocal:=_cdsVendasProduto.FieldByName('DT_VENDA_MERCADORIA').AsDateTime;
   while not _cdsVendasProduto.Eof do
   begin

      nrMesReferencia:=_cdsVendasProduto.FieldByName('MES').AsInteger;
      qtVendaMesSC[nrMesReferencia] := _cdsVendasProduto.FieldByName('NR_UNIDADES').AsInteger;
     _cdsVendasProduto.Next;
   end;
   MontaGraficoSC;
end;

procedure T_frmDadosProduto.BitBtn1Click(Sender: TObject);
var
 objExcel,
 Sheet,
 Chart,s : Variant;
cTitulo : string;
i : integer;
begin
//OBS: Voce deve usar a Clausula ComObj no USES para usar o EXCEL
// Utilize tamb?m a Clausula Clipbrd pois neste exemplo faremos uso da mem?ria

// Cria uma instancia para utilizar o Excel
cTitulo := 'Planilha de Teste';
objExcel := CreateOleObject('Excel.Application');
objExcel.Visible := True;
objExcel.Caption := cTitulo;

// Caso queria abrir uma planilha ao inv?z de gera-la use os comandos abaixo
//objExcel.Workbooks.Open('c:teste.xls');
//Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];
// Daqui em diante os comandos na Planilha s?o os mesmos do resto do Exemplo
//Sheet.Range['A1','Z70'].Replace('Nome','Alterado');

// Adiciona planilha(sheet)
objExcel.Workbooks.Add;
objExcel.Workbooks[1].Sheets.Add;
objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

// ? possivel copiar um valor da mem?ria diretamente para a planilha
// mas como n?o se tem controle de onde ele ser? colado, este processo pode
// ser meio inconveniente
//Clipboard.AsText := 'Linha Copiada para Mem?ria';
//Sheet.paste;

// Nota:
// Pode-se preencher as linhas usando o comando abaixo, desta forma vc usaria
// a planilha como se ela fosse uma Array, em alguns casos pode ser interessante
// mas no geral considero bem mais trabalhoso, abaixo demonstro outra forma de trabalho
// usando o RANGE que torna o trabalho bem mais simples
//Sheet.Cells[1,1] := 'Coluna[1,1]';

// Preenchendo as Colunas
// Usando o RANGE vc pode preencher v?rias colunas ao mesmo tempo usando ['A1','A10']
// Ou preencher apenas uma usando ['A1'], isso torna o processo ?gil e simples
Sheet.Range['A1'] := 'C?digo';
Sheet.Range['B1'] := 'Nome';
Sheet.Range['C1'] := 'Fone';
Sheet.Range['D1'] := 'Sal?rio';

// por aqui tu limparias a planilha


// No caso do FOR se torna interessante usar o SHEET.CELLS (veja como)
// Atente que usei o FOR a partir do numero 2 desta forma pularemos a
// primeira linha que ja contem um cabe?alho preenchido acima
for i := 2 to 10 do begin
Sheet.Cells[i,1] := i;
Sheet.Cells[i,2] := 'Nome Cliente '+inttostr(i);
Sheet.Cells[i,3] := 'Fone Cliente '+inttostr(i);
// Formata o Numero para se tornar MOEDA
Sheet.Cells[i,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
Sheet.Cells[i,4] := 1000*i;
end;

// Formatando o Cabe?alho
Sheet.Range['A1','D1'].font.name := 'Verdana'; // Fonte
Sheet.Range['A1','D1'].font.size := 12; // Tamanho da Fonte
Sheet.Range['A1','D1'].font.bold := true; // Negrito
Sheet.Range['A1','D1'].font.italic := true; // Italico
Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
Sheet.Range['A1','D1'].Interior.Color := $00ffcf9c; // Cor da C?lula
// Define o tamanho das Colunas (basta fazer em uma delas e as demais ser?o alteradas)
Sheet.Range['B1','C1' ].ColumnWidth := 27;
Sheet.Range['B1','C1' ].RowHeight := 25;
Sheet.Range['D1'] .ColumnWidth := 16;

// Outras formas de Formatar
Sheet.Range['E1'] := 'Subscrito';
Sheet.Range['E2'] := 'Superescrito';
Sheet.Range['E3'] := 'Sublinhado';
Sheet.Range['E4'] := 'Strike';
Sheet.Range['E1'].font.Subscript := true; // Subscrito
Sheet.Range['E2'].font.Superscript := true; // Superescrito
Sheet.Range['E3'].font.Underline := true; // Sublinhado
Sheet.Range['E4'].font.Strikethrough := true; // Strike

// Colocando a Borda em um unico lado da C?lula
Sheet.Range['E5'].Font.size := 7;
Sheet.Range['E5'].ColumnWidth := 20;
Sheet.Range['E5'] := 'S? um lado da Celula com Borda';
Sheet.Range['E5'].Borders.Item[$00000009].Weight := $FFFFEFD6;
Sheet.Range['E5'].Borders.Item[$00000009].Color := clRed;
//-- Espessura da Linha
//========================
{xlHairline = $00000001;
xlMedium = $FFFFEFD6;
xlThick = $00000004;
xlThin = $00000002;}
//-- Posi??o da Celula que se deseja colocar a Borda
//=====================================================
{xlInsideHorizontal = $0000000C;
xlInsideVertical = $0000000B;
xlDiagonalDown = $00000005;
xlDiagonalUp = $00000006;
xlEdgeBottom = $00000009;
xlEdgeLeft = $00000007;
xlEdgeRight = $0000000A;
xlEdgeTop = $00000008;}

// Incluindo Formulas (a formula deve ser incluida com seu nome original em Ingl?s
// caso contr?rio podera ocorrer problemas)
Sheet.Cells[i,3] := 'Total R$';
// Na linha abaixo inclui uma soma e converti para Moeda atravez do NUMBERFORMAT
Sheet.Cells[i,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
Sheet.Cells[i,4].formula := '=SUM(D210)';

// Alinhando as C?lulas
Sheet.Range['A1'].VerticalAlignment := 1; // 1=Top - 2=Center - 3=Bottom
Sheet.Range['B1'].VerticalAlignment := 2;
Sheet.Range['C1'].VerticalAlignment := 3;

Sheet.Range['B1'].HorizontalAlignment := 3; // 3=Center - 4=Right
Sheet.Range['C1'].HorizontalAlignment := 3;
Sheet.Range['D1'].HorizontalAlignment := 4;

// Adiciona Grade nas Colunas
Sheet.Range['A1','D11'].Borders.LineStyle := 1;
Sheet.Range['A1','D11'].Borders.Weight := 2;
Sheet.Range['A1','D11'].Borders.ColorIndex := 1;

// Excecuta um Replace na Celula localizada
// Lembre-se que ele alterara todas as celulas localizadas dentro
// do RANGE escolhido, ou seja, se ouverem 10 Colunas com o texto
// desejado este comando alterara as 10
Sheet.Range['A1','Z70'].Replace('Fone Cliente 10','Repassou o Texto');

 //Cria Grafico
Sheet.ChartObjects.Add(10,160,450,130); // Coordenadas (Left,Top,Width,Height)
Chart := Sheet.ChartObjects[1]; // Cria o Grafico
Chart.Chart.ChartType := $FFFFEFFA; // Tipo do Grafico (veja tabela abaixo)
Chart.Chart.SeriesCollection.Add(Sheet.Range['D12']);

end;

procedure T_frmDadosProduto.CarregaEntradas;
var
nrMesReferencia :Integer;
begin
   _cdsEntradas.Open;
   while not _cdsEntradas.Eof do
   begin
      nrMesReferencia:=_cdsEntradas.FieldByName('MES').AsInteger;
      qtEntradas[nrMesReferencia] := _cdsEntradas.FieldByName('QT_ENTRADA').AsInteger;
     _cdsEntradas.Next;
   end;
   MontaGraficoEntradas;
end;
procedure T_frmDadosProduto.CarregaPedidos;
var
nrMesReferencia :Integer;
begin
   _cdsUltimospedido.Open;
   while not _cdsUltimospedido.Eof do
   begin
      nrMesReferencia:=_cdsUltimospedido.FieldByName('MES').AsInteger;
      qtPedidos[nrMesReferencia] := _cdsUltimospedido.FieldByName('QT_PEDIDA').AsInteger;
     _cdsUltimospedido.Next;
   end;
   MontaGraficoPedidos;
end;


procedure T_frmDadosProduto.MontaGraficoSC;
var
  I: Integer;
  nrReferencia:Double;
  Mesreferencia,
  contaMes: Integer;
  stMes,stTexto: string[12];
  dtreferencia: tdate;
  nmTituloGrafico :String;
  corBarra :Tcolor;
begin
  dtreferencia := IncMonth(dtReferenciaLocal -12);
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  Mesreferencia := MonthOf(dtreferencia);

  contaMes := Mesreferencia;
  Series1.Clear;
  nmTituloGrafico:='Vendas do CD RS';
  corBarra := $000080FF; ;
  if nrCdFisico=1 then
  begin
     nmTituloGrafico:='Vendas do CD SC';
     corBarra := clTeal;
  end;
  _chtVendas.Title.Caption:=nmTituloGrafico;
   nrReferencia := MaiorVendaProduto(_cdsVendasProduto.FieldByName('CD_MERCADORIA').AsInteger,1);

   for I := 1 to 12 do
   begin
      if contaMes>12 then
         contaMes:=1;
     stTexto:= UpperCase(ShortMonthNames[contaMes]);
     stMes :=UpperCase(Copy(stTexto,1,1))+LowerCase(Copy(stTexto,2,Length(stTexto)));
     Series1.Add(qtVendaMesSC[contaMes],stMes,corBarra);
     inc(contaMes);
   end;
   Series1.Add(qtVendaMesSC[13],'Atual',corBarra);
 end;

procedure T_frmDadosProduto.MontaGraficoEntradas;
var
  I: Integer;
  nrReferencia:Double;
  Mesreferencia,
  contaMes: Integer;
  stMes,stTexto: string[12];
  dtreferencia: tdate;
  nmTituloGrafico :String;
  corBarra :Tcolor;
begin
  dtreferencia := IncMonth(dtReferenciaLocal, -12);
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  Mesreferencia := MonthOf(dtreferencia);

  contaMes := Mesreferencia;
  BarSeries1.Clear;
  nmTituloGrafico:='Entadas no CD RS';
  corBarra := $000080FF; ;
  if nrCdFisico=1 then
  begin
     nmTituloGrafico:='Entadas no CD SC';
     corBarra := clTeal;
  end;
  _chtEntradas.Title.Caption:=nmTituloGrafico;
   nrReferencia := MaiorEntradaProduto(0,1);
   _chtEntradas.LeftAxis.SetMinMax(0,nrReferencia*1.25);
   for I := 1 to 12 do
   begin
      if contaMes>12 then
         contaMes:=1;
     stTexto:= UpperCase(ShortMonthNames[contaMes]);
     stMes :=UpperCase(Copy(stTexto,1,1))+LowerCase(Copy(stTexto,2,Length(stTexto)));
     BarSeries1.Add(qtEntradas[contaMes],stMes,corBarra);
     inc(contaMes);
   end;
  BarSeries1.Add(qtEntradas[13],'Atual',corBarra);
 end;

procedure T_frmDadosProduto.MontaGraficoPedidos;
var
  I: Integer;
  nrReferencia:Double;
  Mesreferencia,
  contaMes: Integer;
  stMes,stTexto: string[12];
  dtreferencia: tdate;
  nmTituloGrafico :String;
  corBarra :Tcolor;
begin
  dtreferencia := IncMonth(dtReferenciaLocal, -12);
  stMes := ShortMonthNames[MonthOf(dtreferencia)];
  Mesreferencia := MonthOf(dtreferencia);

  contaMes := Mesreferencia;
  BarSeries2.Clear;
  nmTituloGrafico:='Pedidos para o CD RS';
  corBarra := $000080FF; ;
  if nrCdFisico=1 then
  begin
  nmTituloGrafico:='Pedidos para o CD SC';
     corBarra := clTeal;
  end;
  _chtPedidos.Title.Caption:=nmTituloGrafico;
   nrReferencia := MaiorpedidoProduto(0,1);
   _chtPedidos.LeftAxis.SetMinMax(0,nrReferencia*1.25);
   for I := 1 to 12 do
   begin
      if contaMes>12 then
         contaMes:=1;
     stTexto:= UpperCase(ShortMonthNames[contaMes]);
     stMes :=UpperCase(Copy(stTexto,1,1))+LowerCase(Copy(stTexto,2,Length(stTexto)));
     BarSeries2.Add(qtpedidos[contaMes],stMes,corBarra);
     inc(contaMes);
   end;
  BarSeries2.Add(qtPedidos[13],'Atual',corBarra);
 end;

function T_frmDadosProduto.MaiorEntradaProduto(PnrProduto,PnrCD:Integer): double;
var
  I: Integer;
  nrMaiorEntrada: double;

begin
  nrMaiorEntrada := 0;
  begin
    for I := 1 to 13 do
    begin
      if nrMaiorEntrada < qtEntradas[I] then
        nrMaiorEntrada := qtEntradas[I];
    end;
    result := nrMaiorEntrada;
  end;
end;

function T_frmDadosProduto.MaiorpedidoProduto(PnrProduto,PnrCD:Integer): double;
var
  I: Integer;
  nrMaiorPedido: double;

begin
  nrMaiorPedido := 0;
  begin
    for I := 1 to 13 do
    begin
      if nrMaiorPedido < qtPedidos[I] then
        nrMaiorPedido := qtPedidos[I];
    end;
    result := nrMaiorPedido;
  end;
end;

function T_frmDadosProduto.MaiorVendaProduto(PnrProduto,PnrCD:Integer): double;
var
  I: Integer;
  nrMaiorVenda: double;

begin
  nrMaiorVenda := 0;
  FiltraVendaLaboratorio(PnrProduto, PnrCD,1);
  begin
    for I := 1 to 13 do
    begin
      if nrMaiorVenda < qtVendaMesSC[I] then
        nrMaiorVenda := qtVendaMesSC[I];
    end;
    result := nrMaiorVenda;
  end;
end;

procedure T_frmDadosProduto.FiltraEntradaProduto(nrProduto, nrEmpresa,
  nrOperadorLogistico: Integer);
var
  stFiltroOperador: String;
begin
  with _cdsEntradas do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' and CD_EMPRESA=' +
      inttostr(nrEmpresa);
    filtered := true;
  end;
end;


procedure T_frmDadosProduto.FiltraVendaLaboratorio(nrProduto, nrEmpresa,
  nrOperadorLogistico: Integer);
var
  stFiltroOperador: String;
begin
  stFiltroOperador := '';
  if nrOperadorLogistico > 1 then
    stFiltroOperador := format(' AND CD_OPERADOR_LOGISTICO=%d', [nrOperadorLogistico]);

  with _cdsVendasProduto do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' and CD_EMPRESA=' +
      inttostr(nrEmpresa);
    filtered := true;
  end;
end;

procedure T_frmDadosProduto.MontaGraficoIncial;
var
  I: Integer;
  nrReferencia:Double;
  Mesreferencia,
  contaMes: Integer;
  stMes,stTexto: string[12];
  dtreferencia: tdate;
  nmTituloGrafico :String;
  corBarra: TColor;


begin
  Series1.Clear;
  BarSeries1.Clear;
  BarSeries2.Clear;
  nmTituloGrafico:='Vendas do CD RS';
  corBarra := $000080FF; ;
  if nrCdFisico=1 then
  begin
     nmTituloGrafico:='Vendas do CD SC';
     corBarra := clTeal;
  end;
  _chtVendas.Title.Caption:=nmTituloGrafico;

   for I := 1 to 12 do
   begin
      if contaMes>12 then
         contaMes:=1;
     stTexto:= UpperCase(ShortMonthNames[contaMes]);
     stMes :=UpperCase(Copy(stTexto,1,1))+LowerCase(Copy(stTexto,2,Length(stTexto)));
     Series1.Add(qtVendaMesSC[contaMes],stMes,corbarra);
     BarSeries1.Add(qtVendaMesSC[contaMes],stMes,corbarra);
     BarSeries2.Add(qtVendaMesSC[contaMes],stMes,corbarra);
     inc(contaMes);
   end;
  Series1.Add(qtVendaMesSC[13],'Atual',corBarra);
  BarSeries1.Add(qtVendaMesSC[13],stMes,corbarra);
  //BarSeries2.Add(qtVendaMesSC[13],stMes,corbarra);
end;

end.
