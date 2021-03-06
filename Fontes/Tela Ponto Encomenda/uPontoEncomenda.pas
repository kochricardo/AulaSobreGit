unit uPontoEncomenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, DBClient,
  uRotinasGenericas,uAuxiliarCompras,DateUtils,uProduto;

type
   TDadosPendencia = record
     QT_PENDENDETE :INTEGER;
     DT_PEDIDO     :TDATE;
   end;
type
  T_frmPontoEncomenda = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _edtComprador: TEdit;
    _lbeCOmprador: TLabel;
    GroupBox2: TGroupBox;
    _dbgFornecedor: TDBGrid;
    _btnFechar: TBitBtn;
    GroupBox3: TGroupBox;
    _dbgItemPonto: TDBGrid;
    _btnExecutaPonto: TBitBtn;
    _cdsPontoEncomendaItem: TClientDataSet;
    _dsPontoEncomendaItem: TDataSource;
    _edtNrFornecedor: TEdit;
    Label1: TLabel;
    _cdsPontoEncomendaCapa: TClientDataSet;
    _dsPontoEncomendaCapa: TDataSource;
    _cdsFornecedores: TClientDataSet;
    _cdsFornecedoresNR_FORNECEDOR: TIntegerField;
    _cdsFornecedoresNM_FORNECEDOR: TStringField;
    _cdsFornecedoresNR_ITENS: TIntegerField;
    _cdsFornecedoresNR_QUANTIDADE: TIntegerField;
    _cdsFornecedoresVL_TOTAL_PEDIDO: TFloatField;
    _cdsFornecedoresCD_EMPRESA: TIntegerField;
    _cdsPendencia: TClientDataSet;
    _dsFornecedores: TDataSource;
    _dsItensPontoEncomenda: TDataSource;
    _cdsFornecedoresNR_TOTAL_ITENS: TAggregateField;
    _cdsFornecedoresVL_TOTAL_PEDIDO2: TAggregateField;
    _edtTotalPedidos: TEdit;
    _edtNrItens: TEdit;
    _btnGerarPedido: TBitBtn;
    _cdsTabelaPreco: TClientDataSet;
    _cdsFornecedoresID_CD: TStringField;
    _cdsItensPontoEncomenda: TClientDataSet;
    _cdsItensPontoEncomendaCD_PRODUTO: TIntegerField;
    _cdsItensPontoEncomendaNM_PRODUTO: TStringField;
    _cdsItensPontoEncomendaDS_APRESENTACAO: TStringField;
    _cdsItensPontoEncomendaQT_PEDIDO: TIntegerField;
    _cdsItensPontoEncomendaVL_ITEM: TFloatField;
    _cdsItensPontoEncomendaVT_ITEM: TFloatField;
    _cdsItensPontoEncomendaNR_PRODUTO: TIntegerField;
    _cdsItensPontoEncomendaNR_FORNECEDOR: TIntegerField;
    _cdsItensPontoEncomendaCD_EMPRESA: TIntegerField;
    _cdsItensPontoEncomendaNR_DIAS_ESTOQUE: TIntegerField;
    _cdsItensPontoEncomendaVL_MEDIA_DIA: TFloatField;
    _cdsItensPontoEncomendaNR_QTD_SUGERIDA: TIntegerField;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnFecharClick(Sender: TObject);
    procedure _btnExecutaPontoClick(Sender: TObject);
    procedure _dbgItemPontoTitleClick(Column: TColumn);
    procedure _dbgItemPontoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgItemPontoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure _dbgFornecedorTitleClick(Column: TColumn);
    procedure _dbgFornecedorDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnGerarPedidoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure _dbgItemPontoDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgItemPontoCellClick(Column: TColumn);
  private
    procedure SetGridItens;
    procedure SetGridCapa;
    function GravaFornecedor(PnrEmpresa,
                             PnrForncedor,
                             PnrQuantidade:Integer;
                             PvlItem:Double;
                             PnmFornecedor:String):Boolean;
    function LocalizaPendencia(PnrProduto,
      PnrEmpresa: Integer): TDadosPendencia;
   function InserePedidoItemPonto(PnrEmpresa,
                                  PnrFornecedor,
                                  PnrQuantidade,
                                  PcdProduto,
                                  PnrProduto,
                                  PnrDiasEstoque:Integer;
                                  PvlItem,vlMediaDia:Double;
                                  PnmProduto,PdsApresentacao:String):Boolean;
    function GetPrecoItem(nrProduto, cdEmpresa: Integer; vlPrecoFornecedor,
      pcDescontoAbatimento: double; IdPrecoAntual: Char): TListaPreco;
    procedure CriaTelaGrafico(PcdProduto: Integer);
    { Private declarations }
  public
    { Public declarations }
    idprecoAtual :String[1];
    DadosComprador :TDadosComprador;
    nrPedidoPonto:Integer;
  end;

var
  _frmPontoEncomenda: T_frmPontoEncomenda;
    nrCompradorPontoEncomenda   :Integer;
    DadosFornecedor :TDadosFornecedor;


implementation

uses    uGraficoPedidoVendas;

{$R *.dfm}

procedure T_frmPontoEncomenda._btnExecutaPontoClick(Sender: TObject);
var
 cdProduto,
 nrEmpresa,qtEstoque,
 qtPendente,nrProduto,
 nrDias,qtPedidoPonto,nrPPE,
 nrDiasEstoque,nrDiaPE,
 qtEmbalagemCompra  :Integer;
 nrCoberturaEstoque,vlMedia,
 vlPontoEncomenda,vlQtdCompra,
 vlItem  :Double;
 DadosPendecia:TDadosPendencia;
 dtAgendaProximoPedido :Tdate;
 nmFornecedor,nmInidiceNomeProduto,
 nmProduto,dsApresentacao     :String[60];
begin

    if strtointdef(_edtnrfornecedor.text,0)>0then
    begin
      dadosfornecedor:=getdadoslaboratoriocomprador(strtointdef(_edtcomprador.text,0),
                                                    strtointdef(_edtnrfornecedor.text,0));

      if dadosfornecedor<>nil then
      begin
        _edtcomprador.text:=formatfloat('0000',dadosfornecedor.nrcomprador);
       if (strtointdef(_edtnrfornecedor.text,0)>0) and (dadosfornecedor.nrfornecedor=0) then
       begin
          mensagem('fornecedor n?o encontrado !!!',mb_iconwarning);
          _edtnrfornecedor.setfocus;
          exit;
       end;
      end;
    end;


{     if _cdsPontoEncomendaCapa<>nil then
       _cdsPontoEncomendaCapa.Close;

    nrComprador:=StrToIntDef(_edtComprador.Text,0);
    nrFornecedor:=StrToIntDef(_edtNrFornecedor.Text,0);
   nrEmpresa:=StrToIntDef('0',0);
  _cdsPontoEncomendaCapa:=ExecutaPontoEncomendaCapa(nrComprador,nrEmpresa,nrFornecedor);
  if _cdsPontoEncomendaCapa<>nil then
  begin
     _dsPontoEncomendaCapa.DataSet:=_cdsPontoEncomendaCapa;
    _cdsPontoEncomendaCapa.Open;       ]
    //SetGridItens;
  end; }

   if _cdsPontoEncomendaItem<>nil then
       _cdsPontoEncomendaItem.Close;


    nrCompradorPontoEncomenda:=StrToIntDef(_edtComprador.Text,0);
    //nrFornecedorPontoEncomenda:=StrToIntDef(_edtNrFornecedor.Text,0);
    nrEmpresa:=StrToIntDef('0',0);
  _cdsPontoEncomendaItem:=ExecutaPontoEncomenda(nrCompradorPontoEncomenda,nrEmpresa,0);
  if _cdsPontoEncomendaItem=nil then
  begin
     Mensagem('Sem Produto Para Ponto Encomenda!!!',MB_ICONWARNING);
     exit;
  end;

  if _cdsPontoEncomendaItem<>nil then
  begin
     _dsPontoEncomendaItem.DataSet:=_cdsPontoEncomendaItem;
    _cdsPontoEncomendaItem.Open;
    SetGridItens;
  end;
  _cdsPendencia:=Pendencia(nrCompradorPontoEncomenda,nrEmpresa,0);
{  if _cdsPendencia=nil then
  begin
     Mensagem('N?o abriu Pendencia Fornecedor...',MB_ICONWARNING);
     exit;
  end;}


  Application.ProcessMessages;
  _cdsPontoEncomendaItem.First;
  _cdsFornecedores.CLOSE;
  _cdsFornecedores.CreateDataSet;
  _cdsItensPontoEncomenda.CLOSE;
  _cdsItensPontoEncomenda.CreateDataSet;
 try
  while not _cdsPontoEncomendaItem.Eof do
  begin
      vlMedia               := _cdsPontoEncomendaItem.FieldByName('MEDIA_DIA').AsFloat;
      qtEstoque             := _cdsPontoEncomendaItem.FieldByName('ESTOQUE_DISPONIVEL').AsInteger;
      nrProduto             := _cdsPontoEncomendaItem.FieldByName('NR_PRODUTO').AsInteger;
      cdProduto             := _cdsPontoEncomendaItem.FieldByName('COD_PRODUTO').AsInteger;
      nrEmpresa             := _cdsPontoEncomendaItem.FieldByName('CD_EMPRESA').AsInteger;
      dtAgendaProximoPedido := _cdsPontoEncomendaItem.FieldByName('DT_AGENDA').AsDateTime;
      nrDias                := _cdsPontoEncomendaItem.FieldByName('NR_DIAS').AsInteger;
      //nrFornecedorPontoEncomenda := _cdsPontoEncomendaItem.FieldByName('CD_GRUPO_FORNECEDOR').AsInteger;
      vlItem                := _cdsPontoEncomendaItem.FieldByName('VL_UNITARIO_COMPRA').AsFloat;
      nmFornecedor          := _cdsPontoEncomendaItem.FieldByName('DS_GRUPO_FORNECEDOR').AsString;
      nmProduto             := _cdsPontoEncomendaItem.FieldByName('NM_MERCADORIA').AsString;
      dsApresentacao        := _cdsPontoEncomendaItem.FieldByName('APRESENTACAO_MERCADORIA').AsString;
      nrDiasEstoque         := _cdsPontoEncomendaItem.FieldByName('NR_DIAS_ESTOQUE').AsInteger;
      qtEmbalagemCompra      := _cdsPontoEncomendaItem.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
      if dtAgendaProximoPedido<=dtSistema then
        nrDiaPE              :=  0
      else
      nrDiaPE              :=  DaysBetween(dtSistema,dtAgendaProximoPedido);
      //vlMedia               := _cdsPontoEncomendaItem.FieldByName('_DIAS_ESTOQUE').AsInteger;

      nrCoberturaEstoque:=0;
      vlPontoEncomenda  :=0;
      qtPedidoPonto     :=0;
      vlQtdCompra       :=0;
      nrPPE             :=  nrDiaPE +
                           _cdsPontoEncomendaItem.FieldByName('QT_ESTOQUE_Maximo').AsInteger+
                           _cdsPontoEncomendaItem.FieldByName('QT_DIAS_LEADTIME_FABRICANTE').asinteger;
      if  vlMedia >0 then
          nrCoberturaEstoque:= qtEstoque/vlMedia;

      if  vlMedia >0 then
        vlPontoEncomenda := (qtEstoque / vlMedia) *30;


      DadosPendecia:=LocalizaPendencia(nrProduto,nrEmpresa);

      if DadosPendecia.QT_PENDENDETE>0 then
      begin
         _cdsPontoEncomendaItem.Edit;
         _cdsPontoEncomendaItem.FieldByName('QT_PENDENTE').AsInteger:=DadosPendecia.QT_PENDENDETE;
      end;


    try
      if nrCoberturaEstoque < nrdias then
      begin
         vlQtdCompra:= (nrPPE * vlMedia) - (qtEstoque+DadosPendecia.QT_PENDENDETE);
          vlQtdCompra:=strtofloat(formatfloat('0000000000000',(vlQtdCompra/qtEmbalagemCompra)))*qtEmbalagemCompra ;
         if vlQtdCompra>0 then
         begin
         qtPedidoPonto := strtoint(formatfloat('0000000000000',vlQtdCompra));

         GravaFornecedor(nrEmpresa,
                         0,
                          qtPedidoPonto,
                          vlItem,
                          nmFornecedor);

          InserePedidoItemPonto(nrEmpresa,
                                 0,
                                 qtPedidoPonto,
                                 cdProduto,
                                 nrProduto,
                                 nrDiasEstoque,
                                 vlItem,
                                 vlMedia,
                                 nmProduto,dsApresentacao);

         end;

      end;

         except
             Mensagem('Nr Produto '+IntToStr(nrProduto),MB_ICONERROR );
         end;


     Application.ProcessMessages;
    _cdsPontoEncomendaItem.Next;
  end;
       except
             Mensagem('Nr Produto '+IntToStr(nrProduto),MB_ICONERROR );
        end;

  _cdsFornecedores.IndexDefs.Clear;
  if _cdsFornecedores.Active then
  begin
      with _cdsFornecedores.IndexDefs.AddIndexDef do
      begin
      Name:='OrdenarNomeProduto';
      Fields:='VL_TOTAL_PEDIDO;NM_FORNECEDOR;CD_EMPRESA';
      nmInidiceNomeProduto:='OrdenarNomeProduto';
      Options:= [ixDescending, ixCaseInsensitive];
      end;
      _cdsFornecedores.IndexName:=nmInidiceNomeProduto;
  end;

{  if _cdsItensPontoEncomenda.Active then
  begin
      with _cdsItensPontoEncomenda.IndexDefs.AddIndexDef do
      begin
      Name:='OrdenarItemProduto';
      Fields:='NM_PRODUTO';
      nmInidiceNomeProduto:='OrdenarItemProduto';
      Options:= [ixCaseInsensitive];
      end;
      _cdsItensPontoEncomenda.IndexName:=nmInidiceNomeProduto;
  end;}

  _cdsPontoEncomendaItem.Open;
  if _cdsFornecedoresNR_TOTAL_ITENS.Asvariant<>null then
     _edtNrItens.Text      :=  FormatFloat('###,###,##0',_cdsFornecedoresNR_TOTAL_ITENS.Asvariant);
  if _cdsFornecedoresVL_TOTAL_PEDIDO2.Asvariant<>null then
    _edtTotalPedidos.Text := FormatFloat('###,###,##0.00',_cdsFornecedoresVL_TOTAL_PEDIDO2.Asvariant);
   _cdsFornecedores.First;

end;

procedure T_frmPontoEncomenda._dbgFornecedorDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsFornecedores.active then
  begin
   with _dbgFornecedor do
   begin
    if odd(_cdsFornecedores.RecNo) then
    begin
      _dbgFornecedor.Canvas.Font.Color := clBlack;
      _dbgFornecedor.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgFornecedor.Canvas.Font.Color := clBlack;
      _dbgFornecedor.Canvas.Brush.Color := clWhite;
    end;
     // mude a cor de celulas selecionadas
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := clYellow;
      Canvas.Font.Color := clBlack;
    end;
    // mude a cor das celulas com foco
    if (gdfocused in State) then
    begin
      Canvas.Brush.Color := clGreen;
      Canvas.Font.Color := clWhite;
    end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
  end;

end;

procedure T_frmPontoEncomenda._dbgFornecedorTitleClick(Column: TColumn);
begin
////  GeraOrdenacao(_cdsFornecedores,Column);
  //_cdsFornecedores.IndexFieldNames:=Column '_cdsFornecedoresID_CD.AsString ;
end;

procedure T_frmPontoEncomenda._dbgItemPontoCellClick(Column: TColumn);
begin
     with _cdsPontoEncomendaItem do
    begin
      filter:='COD_PRODUTO='+_cdsItensPontoEncomendaCD_PRODUTO.AsString;
      Filtered:=true;
    end;

end;

procedure T_frmPontoEncomenda._dbgItemPontoDblClick(Sender: TObject);
begin
    with _cdsPontoEncomendaItem do
    begin
      filter:='COD_PRODUTO='+_cdsItensPontoEncomendaCD_PRODUTO.AsString;
      Filtered:=true;
    end;
//    if confirM  then

  //  CriaTelaGrafico(_cdsItensPontoEncomendaCD_PRODUTO.AsInteger);

end;

procedure T_frmPontoEncomenda._dbgItemPontoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsItensPontoEncomenda.active then
  begin
   with _dbgItemPonto do
   begin
    if odd(_cdsItensPontoEncomenda.RecNo) then
    begin
      _dbgItemPonto.Canvas.Font.Color := clBlack;
      _dbgItemPonto.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgItemPonto.Canvas.Font.Color := clBlack;
      _dbgItemPonto.Canvas.Brush.Color := clWhite;
    end;
     // mude a cor de celulas selecionadas
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := clYellow;
      Canvas.Font.Color := clBlack;
    end;
    // mude a cor das celulas com foco
    if (gdfocused in State) then
    begin
      Canvas.Brush.Color := clGreen;
      Canvas.Font.Color := clWhite;
    end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
  end;

end;

procedure T_frmPontoEncomenda._dbgItemPontoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
// X coluna
// Y Linha
//                        Coluna Qtda embalagem de compra
if (_dbgItemPonto.MouseCoord(X, Y).X in [4]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := 'Quantidade da Embalagem de Compra';
end
else
//                        Coluna Data Agenda
if (_dbgItemPonto.MouseCoord(X, Y).X in [6]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := 'Data Agendado para compra';
end
else
//                        Coluna nr Dias
if (_dbgItemPonto.MouseCoord(X, Y).X in [7]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := 'Nr. de dias que faltam para data Agendada ';
end
else
if (_dbgItemPonto.MouseCoord(X, Y).X in [8]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := 'Estoque Disponivel';
end
else
if (_dbgItemPonto.MouseCoord(X, Y).X in [10]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := 'Somatorio das Vendas dos Ultimos tres Meses';
end
else
if (_dbgItemPonto.MouseCoord(X, Y).X in [11]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := 'M?dia de Venda dia (Somatorio/ (Nr. Dias 3 meses - Nr dias sem Estoque))';
end
else
if (_dbgItemPonto.MouseCoord(X, Y).X in [12]) and (_dbgItemPonto.MouseCoord(X, Y).Y in [0]) then
begin
     _dbgItemPonto.ShowHint := True;
     _dbgItemPonto.Hint := '(Nr. dias que falta para o Pedido + LeadTime do Fornecedor ) X Media Dia';
end
else
begin
     _dbgItemPonto.ShowHint := False;
end;
end;

procedure T_frmPontoEncomenda._dbgItemPontoTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsItensPontoEncomenda,Column);
end;

procedure T_frmPontoEncomenda._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_RETURN: begin
                 DadosFornecedor:=GetDadosLaboratorioComprador(StrToIntDef(_edtComprador.Text,0),
                                                             StrToIntDef(_edtNrFornecedor.Text,0));

               if DadosFornecedor<>NIL then
               begin

                _edtComprador.Text:=FormatFloat('0000',DadosFornecedor.nrComprador);
               if (StrToIntDef(_edtNrFornecedor.Text,0)>0) and (DadosFornecedor.nrFornecedor=0) then
               begin
                  Mensagem('Fornecedor n?o encontrado !!!',MB_ICONWARNING);
                  _edtNrFornecedor.SetFocus;
                  exit;
               end;
               _btnExecutaPonto.Click;
               end;

      end;


   end;
end;

procedure T_frmPontoEncomenda.DBGrid1DblClick(Sender: TObject);
begin
  _cdsPontoEncomendaItem.Filtered:=false;


end;

procedure T_frmPontoEncomenda.DBGrid1TitleClick(Column: TColumn);
begin
   GeraOrdenacao(_cdsPontoEncomendaItem,Column);
end;

procedure T_frmPontoEncomenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmPontoEncomenda.FormCreate(Sender: TObject);
begin
//  nrPedidoPontoEncomenda:=0;
//  nrFornecedorPontoEncomenda:=0;
  _edtComprador.Text := IntToStr(nrCompradorSistema);
  if cdUsuarioSistema<>3212 then
     _btnGerarPedido.Enabled:=FALSE;
end;

procedure T_frmPontoEncomenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
if not (ActiveControl is TDBGrid) then
begin
Key := #0;
Perform(WM_NEXTDLGCTL, 0, 0);
end
else if (ActiveControl is TDBGrid) then
with TDBGrid(ActiveControl) do
if selectedindex < (fieldcount -1) then
selectedindex := selectedindex +1
else
selectedindex := 0;
end;

procedure T_frmPontoEncomenda._btnFecharClick(Sender: TObject);
begin
  close;
end;


procedure T_frmPontoEncomenda._btnGerarPedidoClick(Sender: TObject);
var
 cdPrazoPagamento,
 nrEmpresa,nrGeracaoVerba,
 nrCompradorPonto,
 nrContaItem  :Integer;
 DadosFornecedor :TDadosFornecedor;
 DadosProduto    :TMercadoria;
 cdTemporario,nrDigito,
 nrDiasEstoqueAtual,
 nrUnidadesPossivel :Integer;
 pcDescontoPadrao,pcGeracaoVerba,
 vlMediaMes,pcIcmsCompra,
 PC_REPASSE,VL_BASE_VENDA ,
 pcRepasseCompra     :Double;
 precoLista      :TListaPreco;
 PrecoItem       :TCalculoPreco;
 vlCustoGerencial:Double;

begin
    idprecoAtual:='S';
    DadosFornecedor    :=GetDadosLaboratorio(_cdsFornecedoresNR_FORNECEDOR.AsInteger);
    cdTemporario       := _cdsItensPontoEncomendaNR_PRODUTO.AsInteger;
    nrDigito           := StrToInt(copy(formatfloat('00000000',_cdsItensPontoEncomendaCD_PRODUTO.AsInteger),8,1));
    nrEmpresa          :=_cdsFornecedoresCD_EMPRESA.AsInteger;


    DadosProduto   :=GetMercadoriaNova(cdTemporario,nrDigito,0,nrEmpresa,1,'');

    if (DadosFornecedor.nrFornecedor>0) and (DadosProduto<>nil) then
    begin

     pcDescontoPadrao := DadosProduto.pcDescontoPadrao;
     pcGeracaoVerba   := DadosProduto.pcGeracaoVerba;
     nrGeracaoVerba   := DadosProduto.nrGeracaoVerba;
     nrCompradorPonto := DadosProduto.nrComprador;

     _cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, DadosFornecedor.nrFornecedor, 0, 0, 'S', dtSistema);



    cdPrazoPagamento := AbrePrazoParcelamento(inttostr( DadosFornecedor.nrPrazoPedido), 1);
//    cdPrazoPagamentoAudititoria:=cdPrazoPagamento;
    nrPedidoPonto := GeraNumeroPedido('C');
     GravaCapaPedido(nrPedidoPonto, // NROP_P,//  NUMBER(6)
      DadosFornecedor.nrFornecedor, // LABP_P :Integer;// NUMBER(6)
      dtPedido, // DATP_P :Tdate;// DATE
      pcDescontoPadrao, // ABTP_P,      //  NUMBER(5,2)
      0, // DESP_P:Double;// NUMBER(5,2)
      'S', // SITP_P :String;//CHAR(1)
      DadosFornecedor.nrPrazoPedido, // PRZP_P :Integer;//NUMBER(3)
      dtPedido + DadosFornecedor.nrDiasLeadTime, // PREP_P          //DATE
      ' ', // CHAR(40)
      '0', // SNRP_P           //  CHAR(10)
      0, // FLAP_P ,         //NUMBER(1)
      cdPrazoPagamento, // NR_CONDICAO_PAGTO_P, // NUMBER(6)
      nmLogin, // NM_USUARIO :String;//        NOT NULL VARCHAR2(10)
      strtodate('01/01/2039'), // DT_FECHAMENTO_PEDIDO,//      NOT NULL DATE
      dtPedido + 1, // DT_PREVISTA_FATURAMENTO:Tdate; //     NOT NULL DATE
      'C', // ID_CIF_FOB :String;//  NOT NULL VARCHAR2(1)
      1,
      // CD_OPERADOR_LOGISTICO :Integer;// NOT NULL NUMBER(6)
      NomeMaquina, // NM_MAQUINA :String;//NOT NULL VARCHAR2(20)
      DadosFornecedor.dtAgenda, // DT_AGENDAMENTO_PEDIDO:Tdate;// NOT NULL DATE
      dtSistema, // DT_DIGITACAO :Tdate;//  DATE
      0, // QT_PALETE ,        // NOT NULL NUMBER(15,6)
      0, // QT_CAIXA  :Double;//   NOT NULL NUMBER(15,6)
      strtodate('01/01/2039'),
      nrCompradorPonto,
      nrEmpresa, 0,
      DadosFornecedor.pcGeracaoVerba,
      DadosFornecedor.nrGeracaoVerba,0,
      nrEmpresa,
      'N',0,0);
    end;
    _cdsItensPontoEncomenda.First;
    nrContaItem:=0;
    while not _cdsItensPontoEncomenda.Eof do
    begin
      cdTemporario        := _cdsItensPontoEncomendaNR_PRODUTO.AsInteger;
       nrDigito           := StrToInt(copy(formatfloat('00000000',_cdsItensPontoEncomendaCD_PRODUTO.AsInteger),8,1));
       DadosProduto       := GetMercadoriaNova(cdTemporario,nrDigito,0,nrEmpresa,1,'');

       if DadosProduto<>nil then
       begin
         Inc(nrContaItem);
        precoLista := GetPrecoItem(DadosProduto.nrProduto, nrEmpresa,  _cdsItensPontoEncomendaVL_ITEM.AsFloat, 1, 'N');

        PrecoItem := CalculaPrecoLiquido(precoLista.vlPrecoLista,
                                          DadosProduto.vlPrecoVenda,
                                          DadosProduto.pcRepasseCompra,
                                          DadosProduto.pcDescontoPadrao,
                                          0,
                                          DadosProduto.pcCreditoICMS,
                                          DadosProduto.pcIpiProduto,
                                          precoLista.PcIPILista,
                                          precoLista.pcReajustePreco,
                                          _cdsItensPontoEncomendaQT_PEDIDO.AsInteger,

                                          precoLista.nrListaPreco, 'N',
                                          DadosProduto.idForcaRepasse,
                                          DadosProduto.idIpiLiquidoComRepasse,
                                          DadosProduto.idIpiLiquidoSemRepasse,
                                          DadosProduto.idIpiBrutoComRepasse,
                                          DadosProduto.idIpiBrutoSemRepasse,
                                          DadosProduto.idTipoListaFiscal,
                                          DadosFornecedor.idUnidadeFederacao,
                                          DadosProduto.idSuperfulo,
                                          DadosProduto.idIcmDestacado,
                                          DadosProduto.idReduzIcms,
                                          DadosProduto.idPisCofins);


              nrDiasEstoqueAtual := _cdsItensPontoEncomendaNR_DIAS_ESTOQUE.AsInteger;
              nrUnidadesPossivel := _cdsItensPontoEncomendaNR_QTD_SUGERIDA.AsInteger;
              vlMediaMes         := _cdsItensPontoEncomendaVL_MEDIA_DIA.AsFloat*30;
              vlCustoGerencial   := DadosProduto.vlCustoGerencial;
              pcRepasseCompra    := DadosProduto.pcRepasseCompra;
              pcIcmsCompra:=DadosProduto.pcCreditoICMS; ///  SS  33688
           //   if (PrecoLista.PcIcmsCompra>0) and (dtSistema>=StrToDate('01/12/2016')) then
             //  pcIcmsCompra:=precoLista.PcIcmsCompra;






              GravaItemPedidoAtual(nrPedidoPonto, // NUMBER(6)
                                   DadosProduto.nrProduto, // NROM_Y ,//NUMBER(6)
                                   _cdsItensPontoEncomendaQT_PEDIDO.AsInteger, // QUAY_Y ,//NUMBER(7)
                                    0, // CHEY_Y :Integer;//NUMBER(7)
                                    pcDescontoPadrao, // ABTY_Y :Double;//NUMBER(5,2)
                                    'S', // SITY_Y :String;//CHAR(1)
                                    DadosFornecedor.nrPrazoPedido, // PRZY_Y :Integer;//NUMBER(3)
                                    PrecoItem.vlPrecoLiquido, // PUNY_Y ,//NUMBER(17,6)
                                    PrecoItem.vlPrecoLista, // PFBY_Y ,//NUMBER(17,6)
                                    0, // DADY_Y ,//NUMBER(5,2)
                                    nrContaItem, // DFIY_Y ,   //NUMBER(5,2)
                                    PrecoItem.vlPrecoCusto, // VCCI_Y :Double;//   NUMBER(17,6)
                                    0, // NRVV_Y :Integer;//NUMBER(6)
                                    0, // VL_MARGEM_PADRAO,//NOT NULL NUMBER(13,2)
                                    0, // VL_MARGEM_NEGOCIADA:Double;//NOT NULL NUMBER(13,2)
                                    'N', // ID_MARGEM,//CHAR(1)
                                    'N', // ID_DESCONTO_ACUMULATIVO :String;//VARCHAR2(1)
                                    0, // PC_VERBA,//  NUMBER(5,2)
                                    0, // VL_VERBA:Double;//NUMBER(13,2)
                                    0, // QT_BONIFICADA :Integer;//NOT NULL NUMBER(6)
                                    0, // PC_BONIFICACAO,//NOT NULL NUMBER(5,2)
                                    0, // PC_DESCONTO_OL:Double;//NOT NULL NUMBER(5,2)
                                    1, // NR_OPERADOR_LOGISTICO,//NOT NULL NUMBER(6)
                                    nrDiasEstoqueAtual, // NR_DIAS_ESTOQUE,//NUMBER(3)
                                    nrUnidadesPossivel, // QT_SUGERIDA :Integer;//NUMBER(7)
                                    vlMediaMes, // VL_MEDIA_VENDA :Double;//NUMBER(13,2)
                                    PrecoItem.cdListaPreco, // CD_LISTA_COMPRA:Integer;//NUMBER(6)
                                    PrecoItem.pcMundancaPreco,
                                    nrEmpresa,
                                    PcIcmsCompra,
                                    PrecoItem.pcIPILista,
                                    pcRepasseCompra,
                                    precoLista.vlBaseVenda,
                                    precoLista.pcIcmsVenda,
                                    precoLista.PcIcmsCompra,
                                    0                                   // PC_MUDANCA_PRECO:Double):Boolean;//NUMBER(7,4)
                                    ,vlCustoGerencial);



                                   end;

       _cdsItensPontoEncomenda.next;
    end;
   DadosComprador:=CompradorPedido(nrCompradorPontoEncomenda,0);
  if (nrCompradorPontoEncomenda>0) and (nrPedidoPonto>0) then
  begin
   //nrCompradorPedidoLocal:=DadosComprador.nrComprador;
  // nrPedidoPontoEncomenda:=nrPedidoPonto;

 //  cdoperadorLogisticoPedido:=1;
 //  cdoperadorLogisticoPedido:=cdoperadorLogisticoPedido;
 //   Application.CreateForm(T_frmCompras, _frmCompras);
     ///_frmCompras:=T_frmCompras.Create(self);
   //  _frmCompras.Show;
   //  FormPos(_frmCompras,1,1);
     Close;
  end;




end;

procedure T_frmPontoEncomenda.SetGridItens;
begin
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('COD_PRODUTO')).DisplayLabel:='Cod.Prod.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('COD_PRODUTO')).DisplayWidth:=8;

  TStringField(_cdsPontoEncomendaItem.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsPontoEncomendaItem.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsPontoEncomendaItem.FieldByName('APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdsPontoEncomendaItem.FieldByName('APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayLabel:='Qtd.Embal.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayWidth:=8;

  TFloatField(_cdsPontoEncomendaItem.FieldByName('VL_UNITARIO_COMPRA')).DisplayLabel:='P?o. Lista';
  TFloatField(_cdsPontoEncomendaItem.FieldByName('VL_UNITARIO_COMPRA')).DisplayFormat:='###,###,##0.00';
  TFloatField(_cdsPontoEncomendaItem.FieldByName('VL_UNITARIO_COMPRA')).DisplayWidth:=8;

  TStringField(_cdsPontoEncomendaItem.FieldByName('ID_CURVA_MERCADORIA')).DisplayLabel:='Curva';
  TStringField(_cdsPontoEncomendaItem.FieldByName('ID_CURVA_MERCADORIA')).DisplayWidth:=03;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_GRUPO_CURVA_FABRICANTE')).DisplayLabel:='Grupo Fornec.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_GRUPO_CURVA_FABRICANTE')).DisplayWidth:=5;

  TFloatField(_cdsPontoEncomendaItem.FieldByName('DT_AGENDA')).DisplayLabel:='Dt.Agenda';
  TFloatField(_cdsPontoEncomendaItem.FieldByName('DT_AGENDA')).DisplayFormat:='dd/mm/yyyy';
  TFloatField(_cdsPontoEncomendaItem.FieldByName('DT_AGENDA')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TStringField(_cdsPontoEncomendaItem.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
  TStringField(_cdsPontoEncomendaItem.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_COMPRADOR')).DisplayWidth:=5;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_EMPRESA')).DisplayLabel:='Empresa';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_EMPRESA')).DisplayWidth:=5;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_VENDA')).DisplayLabel:='Qtd. Venda';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_VENDA')).DisplayWidth:=8;

  TFloatField(_cdsPontoEncomendaItem.FieldByName('VL_MEDIA_DIARIA')).DisplayLabel:='M?dia Vda.Dia';
  TFloatField(_cdsPontoEncomendaItem.FieldByName('VL_MEDIA_DIARIA')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsPontoEncomendaItem.FieldByName('VL_MEDIA_DIARIA')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayLabel:='Dias Estq.Max.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayWidth:=8;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayLabel:='Dias de Falta';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayWidth:=8;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel:='Dias Estoque';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_DIAS_ESTOQUE')).DisplayWidth:=8;


  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayLabel:='Freq.Compra';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayWidth:=8;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayLabel:='LeadTime';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayWidth:=8;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd.Pendente';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_PENDENTE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('QT_PENDENTE')).DisplayWidth:=8;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('ESTOQUE_DISPONIVEL')).DisplayLabel:='Estoq.Dispon.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('ESTOQUE_DISPONIVEL')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('ESTOQUE_DISPONIVEL')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_DIAS')).DisplayLabel:='Proxima Entrada(dias)';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_DIAS')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_DIAS')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayLabel:='Previs?o Est.C/Pend.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayWidth:=10;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayLabel:='Previs?o Est.S/Pend.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayWidth:=10;

 end;

procedure T_frmPontoEncomenda.SetGridCapa;
begin
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=8;

  TStringField(_cdsPontoEncomendaItem.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Curva';
  TStringField(_cdsPontoEncomendaItem.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=03;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_EMPRESA')).DisplayLabel:='CD';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('CD_EMPRESA')).DisplayWidth:=02;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=010;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayLabel:='Posi??o Estq. C/Pend.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayWidth:=010;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayLabel:='Posi??o Estq. C/Pend.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayWidth:=010;

  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayLabel:='Posi??o Estq. S/Pend.';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsPontoEncomendaItem.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayWidth:=010;
    {
      Sum(QT_SUGERIDA_COM_PENDENCIA) AS QT_SUGERIDA_COM_PENDENCIA,
      Sum(QT_SUGERIDA_SEM_PENDENCIA) AS QT_SUGERIDA_SEM_PENDENCIA,
      Sum(QT_SUGERIDA_COM_PENDENCIA*VL_UNITARIO_COMPRA) AS VL_SUGERIDO_COM_PENDENCIA,
      Sum(QT_SUGERIDA_SEM_PENDENCIA*VL_UNITARIO_COMPRA) AS VL_SUGERIDO_SEM_PENDENCIA

}

end;




function T_frmPontoEncomenda.GravaFornecedor(PnrEmpresa,
                                             PnrForncedor,
                                             PnrQuantidade:Integer;
                                             PvlItem:Double;
                                             PnmFornecedor:String):Boolean;
begin
    _cdsFornecedores.Open;
    if _cdsFornecedores.Locate('CD_EMPRESA;NR_FORNECEDOR',VarArrayOf([PnrEmpresa,PnrForncedor]),[]) then
    begin
     _cdsFornecedores.Edit;
     _cdsFornecedoresNR_ITENS.AsInteger:=_cdsFornecedoresNR_ITENS.AsInteger + 1;
     _cdsFornecedoresNR_QUANTIDADE.AsInteger:=_cdsFornecedoresNR_QUANTIDADE.AsInteger + PnrQuantidade;
     _cdsFornecedoresVL_TOTAL_PEDIDO.AsFloat :=_cdsFornecedoresVL_TOTAL_PEDIDO.AsFloat + (PvlItem*PnrQuantidade);
    end
    else
    begin
     _cdsFornecedores.Insert;
     _cdsFornecedoresCD_EMPRESA.AsInteger    :=PnrEmpresa;
     if PnrEmpresa=1 then
      _cdsFornecedoresID_CD.AsString:='SC';
     if PnrEmpresa=4 then
      _cdsFornecedoresID_CD.AsString:='RS';
     _cdsFornecedoresNR_FORNECEDOR.AsInteger :=PnrForncedor;
     _cdsFornecedoresNM_FORNECEDOR.AsString  :=PnmFornecedor;
     _cdsFornecedoresNR_ITENS.AsInteger      :=_cdsFornecedoresNR_ITENS.AsInteger + 1;
     _cdsFornecedoresNR_QUANTIDADE.AsInteger :=_cdsFornecedoresNR_QUANTIDADE.AsInteger + PnrQuantidade;
     _cdsFornecedoresVL_TOTAL_PEDIDO.AsFloat :=_cdsFornecedoresVL_TOTAL_PEDIDO.AsFloat + (PvlItem*PnrQuantidade);
    end;
   _cdsFornecedores.post;
   _cdsFornecedores.Open;

end;


function T_frmPontoEncomenda.InserePedidoItemPonto(PnrEmpresa,
                                  PnrFornecedor,
                                  PnrQuantidade,
                                  PcdProduto,
                                  PnrProduto,
                                  PnrDiasEstoque:Integer;
                                  PvlItem,vlMediaDia:Double;
                                  PnmProduto,PdsApresentacao:String):Boolean;
begin
   try
    _cdsItensPontoEncomenda.Open;
    _cdsItensPontoEncomenda.Insert;
    _cdsItensPontoEncomendaCD_EMPRESA.AsInteger:=PnrEmpresa;

    _cdsItensPontoEncomendaNR_FORNECEDOR.AsInteger:=PnrFornecedor;
    _cdsItensPontoEncomendaNM_PRODUTO.AsString:=PnmProduto;
    _cdsItensPontoEncomendaDS_APRESENTACAO.AsString:=PdsApresentacao;
    _cdsItensPontoEncomendaNR_PRODUTO.AsInteger:=PnrProduto;
    _cdsItensPontoEncomendaCD_PRODUTO.AsInteger:=PcdProduto;
    _cdsItensPontoEncomendaQT_PEDIDO.AsInteger:=PnrQuantidade;
    _cdsItensPontoEncomendaNR_QTD_SUGERIDA.AsInteger:=PnrQuantidade;
    _cdsItensPontoEncomendaVL_MEDIA_DIA.AsFloat:=vlMediaDia;
    _cdsItensPontoEncomendaNR_DIAS_ESTOQUE.AsInteger:=PnrDiasEstoque;
    _cdsItensPontoEncomendaVL_ITEM.AsFloat:=PvlItem;
    _cdsItensPontoEncomendaVT_ITEM.AsFloat:=PvlItem*PnrQuantidade;
    _cdsItensPontoEncomenda.Post;
   except
    Mensagem('Erro '+IntToStr(PnrProduto),MB_ICONERROR);

   end;

end;


function T_frmPontoEncomenda.LocalizaPendencia(PnrProduto,PnrEmpresa:Integer):TDadosPendencia;
begin
    Result.QT_PENDENDETE:=0;
    Result.DT_PEDIDO    :=0;
    if _cdsPendencia<>nil then
    begin
      _cdsPendencia.Open;
      if _cdsPendencia.Locate('NR_PRODUTO;CD_PENDENCIA_EMPRESA',VarArrayOf([PnrProduto,PnrEmpresa]),[]) then
      begin
        Result.QT_PENDENDETE:=_cdsPendencia.FieldByName('QT_PENDENTE').AsInteger;
        Result.DT_PEDIDO    :=_cdsPendencia.FieldByName('DT_PREVISAO_CHEGADA').AsDateTime;
      end;


    end;

end;


function T_frmPontoEncomenda.GetPrecoItem(nrProduto, cdEmpresa: Integer;
  vlPrecoFornecedor, pcDescontoAbatimento: double; IdPrecoAntual: Char): TListaPreco;
begin
  with _cdsTabelaPreco do
  begin
    filtered := false;
    filter := 'CD_MERCADORIA=' + inttostr(nrProduto) + ' AND CD_EMPRESA=' +
      inttostr(cdEmpresa);
    filtered := true;
    // Params.ParamByName()
  end;
  result.vlPrecoLista := vlPrecoFornecedor;
  result.nrListaPreco := 0;
  if not _cdsTabelaPreco.isEmpty then
  begin
    result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_UNITARIO_COMPRA').AsFloat * pcDescontoAbatimento;
    result.pcReajustePreco := 0;
    result.nrListaPreco :=  _cdsTabelaPreco.FieldByName('CD_LISTA_GAM').AsInteger;
    result.PcIPILista   :=  _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;


    if idprecoAtual = 'N' then
    begin
      result.vlPrecoLista := _cdsTabelaPreco.FieldByName('VL_LISTA_ANTERIOR').AsFloat * pcDescontoAbatimento;
      result.pcReajustePreco := _cdsTabelaPreco.FieldByName('PC_MUDANCA_PRECO').AsFloat;
      result.nrListaPreco := _cdsTabelaPreco.FieldByName('CD_LISTA_GAM') .AsInteger;
      resulT.PcIPILista   :=_cdsTabelaPreco.FieldByName('PC_IP?') .AsFloat;
    end;
    if result.pcReajustePreco < 0 then
      result.pcReajustePreco := 0

  end;
end;

procedure T_frmPontoEncomenda.CriaTelaGrafico(PcdProduto:Integer);
Var
 DadosCodigo:TCodigoValido;
begin

try
//   FiltraTabela(nrProduto,0,0,'');
   DadosCodigo:= TransformaStringCodigo(inttostr(PcdProduto));
   cdProdutoGrafico:=PcdProduto;
   nrProdutoGrafico:=DadosCodigo.nrCodigo;

  cdsTemporario:=_cdsPontoEncomendaItem;
   Application.CreateForm(T_frmGraficoPedidoVendas, _frmGraficoPedidoVendas);


 except
   _frmGraficoPedidoVendas.Free;
 end;
end;


end.
