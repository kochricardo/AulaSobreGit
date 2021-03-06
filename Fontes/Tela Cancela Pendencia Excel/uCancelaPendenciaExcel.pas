unit uCancelaPendenciaExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, Gauges,
   COMoBJ,OleServer, DB, DBClient;

type
  T_frmCancelaPendenciaExcel = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    _gaPlanilha: TGauge;
    _edtArquivo: TEdit;
    _btnImportaLista: TBitBtn;
    GroupBox2: TGroupBox;
    _dbgItemPedido: TDBGrid;
    _opdLocalizaArquivo: TOpenDialog;
    _cdsTabela: TClientDataSet;
    _dsTabela: TDataSource;
    _cdsTabelaNR_PEDIDO: TIntegerField;
    _cdsTabelaNR_FORNECEDOR: TIntegerField;
    _cdsTabelaNM_FORNECEDOR: TStringField;
    _cdsTabelaCD_PRODUTO: TIntegerField;
    _cdsTabelaNM_PRODUTO: TStringField;
    _cdsTabelaQT_PEDIDO: TIntegerField;
    _cdsTabelaQT_FATURADA: TIntegerField;
    _cdsItemPedido: TClientDataSet;
    _cdsTabelaID_STATUS: TStringField;
    _cdsTabelaNR_PRODUTO: TIntegerField;
    _btnCancelaPendencia: TBitBtn;
    _cdsTabelaCD_EMPRESA: TIntegerField;
    _cdsTabelaNM_CD: TStringField;
    _stbMensagem: TStatusBar;
    procedure _btnImportaListaClick(Sender: TObject);
    procedure _dbgItemPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnCancelaPendenciaClick(Sender: TObject);
    procedure _stbMensagemDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure FormShow(Sender: TObject);
  private
     procedure ImportaTabelaExcel(PstArquivo:String);
    function TestaCabecalhoPlanilha(PnmColuna: String;
      PnrColuna: Integer): Boolean;
    procedure GetItemPedido(PnrPedido,PnrProduto:Integer);
    procedure SetStatusBar;
    { Private declarations }
  public
    { Public declarations }
  end;
  const
  Cabecalho: array[1..05] of string = ('NR DO PEDIDO',' COD PRODUTO','EAN PRODUTO','DESCRICAO PRODUTO','QTD PARA CANCELAR PEDENCIA');

var
  _frmCancelaPendenciaExcel: T_frmCancelaPendenciaExcel;

implementation

uses uRotinasGenericas, uAuxiliarCompras;

{$R *.dfm}

function T_frmCancelaPendenciaExcel.TestaCabecalhoPlanilha(PnmColuna:String;PnrColuna:Integer):Boolean;

begin
 result:=true;
 if trim(PnmColuna)<>trim(Cabecalho[PnrColuna])  then
 begin
   Mensagem('Planilha N?o eh Padr?o'+#13+
   'Panilha--> '+ PnmColuna+#13+
   ' Deveria ser -->'+trim(Cabecalho[PnrColuna]),MB_ICONINFORMATION);
   result:=false;
 end;

end;

procedure T_frmCancelaPendenciaExcel._btnCancelaPendenciaClick(Sender: TObject);
begin
  _cdsTabela.First;


  while Not _cdsTabela.Eof do
  begin


   if (_cdsTabelaID_STATUS.AsString='N')  or
      (_cdsTabelaID_STATUS.AsString='P')  or
      (_cdsTabelaID_STATUS.AsString='T') then

   begin

     if not GetStatusNfe(_cdsTabelaNR_PEDIDO.AsInteger,
                        _cdsTabelaNR_PRODUTO.AsInteger)   then
     begin
         Mensagem('Este Item J? Foi Faturado No Fornecedor!!!'+#13+
                  'N?o pode ser excluida!!!',MB_ICONWARNING);
                           exit;

        end;

      AlteraStatusItemPedido(_cdsTabelaNR_PEDIDO.AsInteger,
                           _cdsTabelaNR_PRODUTO.AsInteger,
                           _cdsTabelaCD_EMPRESA.AsInteger,nmLogin);


   end;





    _cdsTabela.Next;
  end;

end;

procedure T_frmCancelaPendenciaExcel._btnImportaListaClick(Sender: TObject);
begin
_edtArquivo.Clear;

  _cdsTabela.CreateDataSet;
//  _cdsTabela.CreateDataSet;
   _dsTabela.DataSet:=_cdsTabela;

  if not _opdLocalizaArquivo.Execute then
     Exit;
  _edtArquivo.Text := _opdLocalizaArquivo.FileName;

  if  _edtArquivo.Text<>EmptyStr then
       ImportaTabelaExcel(_edtArquivo.Text);

end;


procedure T_frmCancelaPendenciaExcel.ImportaTabelaExcel(PstArquivo:String);
var
	Excel: OLEVariant;
//  DadosEXCEL: OLEVariant;
  Linha,nrLinha,nrColuna,Planilha :Integer;
  I,nrPedido,nrProduto: Integer;
  TestaNomeColuna,
  stNrPedido,stNrproduto:String ;
  DadosPedidoAbertuta: TDadosValoresPedido;


begin
    Excel := CreateOleObject('Excel.Application');
    Planilha:=1;
    Linha:=1;
 try


    Screen.Cursor := crHourGlass;

    // evita que o Excel seja exibido na tela
    Excel.Visible := False;

//    nrLinha:=Excel.activeCell.row;
    // abre o arquivo XLSX
	  Excel.Workbooks.Open(PstArquivo);


    // evita que o Excel seja exibido na tela
    Excel.Visible := False;

    // abre o arquivo XLSX
   Excel.Workbooks[1].WorkSheets[Planilha].Activate;

//    nrLinha do Excel;
   nrLinha := Excel.Cells.SpecialCells(11).Row;

   _gaPlanilha.MinValue:=0;
  _gaPlanilha.MaxValue:=nrLinha;


//    nrLinha de Coluna;

   nrColuna := Excel.Cells.SpecialCells(11).Column;

   for I := 1 to nrColuna do
   begin
     TestaNomeColuna:=UpperCase(excel.WorkBooks[1].Sheets[Planilha].Cells[1, i]);


     if TestaNomeColuna<>'' then
     if not TestaCabecalhoPlanilha(TestaNomeColuna,i) then
     begin
        break;
        exit;
     end;

   end;





    //Abre o Workbook
    //XLApp.Workbooks.Open(AXLSFile);
    _cdsTabela.Open;
  try
    //DadosEXCEL:= Excel.Workbooks[ExtractFileName(PstArquivo)].WorkSheets[1];
    //DadosEXCEL.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
  except
      on E: Exception do
      begin
        trataerro(E.Message,
          'Problemas na Planilha...'+#13+
          'Coluna com informa??es com tipo diferente'+#13+
          'Valores numericos e alfanumericos em uma mesma coluna '+#13+
          'Verifique');
        exit;

      end;

  end;

  nrLinha:=2 ;
  TestaNomeColuna:=excel.WorkBooks[1].Sheets[Planilha].Cells[1,nrLinha];
  while TestaNomeColuna<>'' do
  begin
    _gaPlanilha.Progress:=nrLinha;

    TestaNomeColuna:=excel.WorkBooks[1].Sheets[Planilha].Cells[nrLinha,1];

    stNrPedido :=excel.WorkBooks[1].Sheets[Planilha].Cells[nrLinha,1];
    stNrproduto:=excel.WorkBooks[1].Sheets[Planilha].Cells[nrLinha,2];




    nrPedido:=StrToIntDef(stNrPedido,0);
    nrProduto:= StrToIntDef(copy(formatfloat('00000000',StrToIntDef(stNrproduto,0)),1,7),0);
    DadosPedidoAbertuta:=nil;
    if nrPedido>0 then
       DadosPedidoAbertuta:=GetValoresPedido(nrPedido,false);


    if DadosPedidoAbertuta<>nil then
    begin


       GetItemPedido(DadosPedidoAbertuta.nrPedido,nrProduto);



      _cdsItemPedido.First;
      while not _cdsItemPedido.Eof do
      begin
      _cdsTabela.Open;
      _cdsTabela.Append;

      _cdsTabelaNR_PEDIDO.AsInteger:=DadosPedidoAbertuta.nrPedido;
      _cdsTabelaNR_FORNECEDOR.AsInteger:=DadosPedidoAbertuta.nrFornecedor;
      _cdsTabelaNM_FORNECEDOR.AsString:=DadosPedidoAbertuta.stNomeFornecedor;

      _cdsTabelaNM_CD.AsString      :=_cdsItemPedido.FieldByName('NM_EMPRESA').AsString;

      _cdsTabelaCD_PRODUTO.AsInteger:=_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger;

      _cdsTabelaNM_PRODUTO.AsString:=_cdsItemPedido.FieldByName('NM_COMPLETO').AsString;

      _cdsTabelaQT_PEDIDO.AsInteger :=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
      _cdsTabelaQT_FATURADA.AsInteger :=_cdsItemPedido.FieldByName('CHEY_Y').AsInteger;
      _cdsTabelaID_STATUS.AsString :=_cdsItemPedido.FieldByName('SITY_Y').AsString;
      _cdsTabelaCD_EMPRESA.AsInteger:=_cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger;
      _cdsTabelaNR_PRODUTO.AsInteger:=_cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger;









      _cdsItemPedido.Next;
      end;



    end;


    inc(nrLinha);
    inc(Linha);

 end;

  finally


 	  if not VarIsEmpty(Excel) then
    begin
		  Excel.Quit;
      Excel := Unassigned;
		end;
    Screen.Cursor := crDefault;
    end;

   _btnCancelaPendencia.Enabled:=FALSE;
   if NOT _cdsTabela.IsEmpty then
      _btnCancelaPendencia.Enabled:=TRUE;


end;




procedure T_frmCancelaPendenciaExcel._dbgItemPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   with _dbgItemPedido do
   begin

// mude a cor das Linha
   If odd(_cdsTabela.RecNo) then
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

procedure T_frmCancelaPendenciaExcel._stbMensagemDrawPanel(
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

procedure T_frmCancelaPendenciaExcel.FormShow(Sender: TObject);
begin
 SetStatusBar;

end;

procedure T_frmCancelaPendenciaExcel.GetItemPedido(PnrPedido,PnrProduto:Integer);
Var
  stQuery :TStringList;
begin
    stQuery:=TStringList.Create;
    with stQuery do
    begin
     Add('SELECT');
     Add('NROP_Y, CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
     Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
	   Add('CD_EAN_COMPRA,QT_EMBALAGEM_COMPRA,NROM_Y,');
	   Add('QUAY_Y,  CHEY_Y,  ABTY_Y,  SITY_Y,PRZY_Y,');
	   Add('PUNY_Y, PFBY_Y, DADY_Y, DFIY_Y, VCCI_Y,');
     Add('NRVV_Y, VL_MARGEM_PADRAO, VL_MARGEM_NEGOCIADA,');
     Add('ID_MARGEM,ID_DESCONTO_ACUMULATIVO, PC_VERBA, VL_VERBA,');
     Add('QT_BONIFICADA, PC_BONIFICACAO ,PC_DESCONTO_OL,ITEM.CD_EMPRESA,');
	   Add('NR_OPERADOR_LOGISTICO,');
     add('NM_MERCADORIA||''  ''||DS_APRESENTACAO_MERCADORIA as NM_COMPLETO,');
    add('PC_ICMS_COMPRA,NM_EMPRESA');

     Add('FROM');
     Add('PRDDM.DCPCC CAPA,');
     Add('PRDDM.DCPCI ITEM,');
     ADD('ACESSO.DC_EMPRESA EMP,');
     Add('PRDDM.DC_MERCADORIA');
     Add('WHERE');
     ADD('NROP_P=NROP_Y');
     Add('AND ID_EMPRESA_FISICA=''S''');
     Add('AND EMP.CD_EMPRESA=CAPA.CD_EMPRESA_DESTINO');
     Add('AND NROP_Y = :PnrPedido');
     Add('and NROM_Y = :PnrProduto');
     Add('AND NROM_Y=CD_MERCADORIA');
     //Add('AND SITY_Y IN(''T'',''P'',''N'')');
    end;
    with _cdsItemPedido do
    begin
      close;
      CommandText:=stQuery.Text;
      Params.ParamByName('PnrPedido').AsInteger:=PnrPedido;
      Params.ParamByName('PnrProduto').AsInteger:=PnrProduto;
      open;
      First;
    end;
end;


procedure T_frmCancelaPendenciaExcel.SetStatusBar;
 var
  ProgressBarStyle: integer;
begin

  _stbMensagem.Panels[1].Style := psOwnerDraw;
  _gaPlanilha.Parent:=_stbMensagem;
  _gaPlanilha.Height:=_stbMensagem.Height-3;
  _gaPlanilha.BackColor:=clWhite;
  _gaPlanilha.ForeColor:=clBlue;


end;


end.
