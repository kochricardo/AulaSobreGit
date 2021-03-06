unit uTelaPedidoEspecial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  uRotinasGenericas,uAuxiliarCompras,DateUtils,uProduto, Grids, DBGrids,
  StdCtrls, Buttons, ComCtrls, DB, DBClient,StrUtils, Provider;

type
  T_frmPedidoEspecial = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _lbeCOmprador: TLabel;
    Label1: TLabel;
    _edtComprador: TEdit;
    _btnExecutaPonto: TBitBtn;
    _edtNrFornecedor: TEdit;
    GroupBox2: TGroupBox;
    _dbgProdutos: TDBGrid;
    _dsTabelaProduto: TDataSource;
    _cdsTabelaProduto: TClientDataSet;
    _cdsTabelaProdutoVT_ESTOQUE_DISPONIVEL: TAggregateField;
    _cdsTabelaProdutoVT_PENDENCIA: TAggregateField;
    _cdsTabelaProdutoQTDE_ESTOQUE_DISPONIVEL: TAggregateField;
    _cdsTabelaProdutoQTDE_PENDENCIA: TAggregateField;
    _cdsTabelaProdutoVT_VENDA_MEDIA: TAggregateField;
    _edtNomeFornecedor: TEdit;
    _cbxOpcaoCDs: TComboBox;
    Label18: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    _edtQtdadePendente: TEdit;
    _btnGeraPedido: TBitBtn;
    _edtValorPendente: TEdit;
    _edtQtdadeEstoque: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    _edtValorEstoque: TEdit;
    _edtValorVendaMedia: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    _edtQtdadeVendaMedia: TEdit;
    _cdsTabelaProdutoQTDE_VENDA_MEDIA: TAggregateField;
    _cbxValorQuantidade: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    _edtParametro: TEdit;
    Label10: TLabel;
    _edtParametroEspecial: TEdit;
    Label11: TLabel;
    _edtCoberturaEstoque: TEdit;
    Label12: TLabel;
    _cdsTabelaProdutoQT_PEDIDO: TAggregateField;
    _edtValorPedido: TEdit;
    Label13: TLabel;
    _edtQtadePedido: TEdit;
    Label14: TLabel;
    _cdsTabelaProdutoVT_PEDIDO: TAggregateField;
    _btnParaExcel: TBitBtn;
    _grbEspecealidade: TGroupBox;
    DBGrid2: TDBGrid;
    _cdsEspecealidade: TClientDataSet;
    _dsEpecealidade: TDataSource;
    _chkFiltro: TCheckBox;
    _chkAjustaCamadaPalete: TCheckBox;
    procedure _btnExecutaPontoClick(Sender: TObject);
    procedure _dbgProdutosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure _edtNrFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnGeraPedidoClick(Sender: TObject);
    procedure _dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _edtCoberturaEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _chkFiltroClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    nrEmpresa:Integer;
    procedure SetGridItens;
    function ExecutaPontoEncomenda(PnrComprador, PnrEmpresa,
      PnrFornecedor: Integer): TClientDataSet;
    procedure SetParametroCompra;
    procedure SelecionaItem;
    procedure ValoresFornecedor;
    procedure EliminaItensSelecao;
    procedure MontaPedido;
    procedure SetGridEspecealidade;
    function FiltraPorEspecealidade(nrSequencia: Integer): boolean;
  public
    { Public declarations }
    vlParamentro:Variant;
    vlPeeEspecial,
    vlCoberturaGeral:Double;
    vlEstoqueIncial,
    vlMediaInicial,
    vlPendenciaInicial,
    vlEstoque,
    vlMedia,
    vlPendencia :Double;
    qtEstoqueIncial,
    qtMediaInicial,
    qtPendenciaInicial,
    qtEstoque,
    qtMedia,
    qtPendencia :Integer;
    DadosSugestaoCamadaPalete: TDadosSugestaoCamadaPalete;


  end;

var
  _frmPedidoEspecial: T_frmPedidoEspecial;
   nrCompradorPontoEncomenda   :Integer;
   nrFornecedorPontoEncomenda  :Integer;
  DadosFornecedor :TDadosFornecedor;


implementation

uses uDm;

{$R *.dfm}

procedure T_frmPedidoEspecial._btnExecutaPontoClick(Sender: TObject);
begin
//    vlParamentro:=StrToIntDef(_edtParametro.Text,0);

      _edtQtdadePendente.clear;
      _edtValorPendente.clear;
      _edtQtdadeEstoque.clear;
      _edtValorEstoque.clear;
      _edtValorVendaMedia.clear;
      _edtQtdadeVendaMedia.clear;


     qtEstoque:=0;
     qtMedia:=0;
     qtPendencia:=0;
     vlEstoque:=0;
     vlMedia:=0;
     vlPendencia:=0;


    Screen.Cursor:=crHourGlass;
   Application.ProcessMessages;

    if strtointdef(_edtnrfornecedor.text,0)>0then
    begin
      dadosfornecedor:=getdadoslaboratoriocomprador(strtointdef(_edtcomprador.text,0),
                                                    strtointdef(_edtnrfornecedor.text,0));
       _cdsEspecealidade:=AbreEspecealidadeFornecedor(DadosFornecedor.nrFornecedor);
       if _cdsEspecealidade<>nil then
       begin
         _dsEpecealidade.DataSet:=_cdsEspecealidade;
         _cdsEspecealidade.Open;
         _grbEspecealidade.Visible:=true;
         SetGridEspecealidade;
       end;
      if dadosfornecedor<>nil then
      begin
        _edtcomprador.text:=formatfloat('0000',dadosfornecedor.nrcomprador);
        _edtNomeFornecedor.Text:=DadosFornecedor.dsNomeFantasia;
        if (strtointdef(_edtnrfornecedor.text,0)>0) and (dadosfornecedor.nrfornecedor=0) then
       begin
          mensagem('fornecedor n?o encontrado !!!',mb_iconwarning);
          _edtnrfornecedor.setfocus;
          exit;
       end;
      end;
    end;

       if _cdsTabelaProduto<>nil then
       _cdsTabelaProduto.Close;


    nrCompradorPontoEncomenda:=StrToIntDef(_edtComprador.Text,0);
    nrFornecedorPontoEncomenda:=StrToIntDef(_edtNrFornecedor.Text,0);

    if _cbxOpcaoCDs.ItemIndex=0 then
        nrEmpresa:=0;
    if _cbxOpcaoCDs.ItemIndex=1 then
        nrEmpresa:=1;
    if _cbxOpcaoCDs.ItemIndex=2 then
        nrEmpresa:=4;
//    nrEmpresa:=StrToIntDef('0',0);
    ExecutaPontoEncomenda(nrCompradorPontoEncomenda,nrEmpresa,nrFornecedorPontoEncomenda);
    if _cdsTabelaProduto.IsEmpty then
    begin
     Mensagem('Sem Produto Para Ponto Encomenda!!!',MB_ICONWARNING);
     exit;
    end;

  if _cdsTabelaProduto<>nil then
  begin
     _dsTabelaProduto.DataSet:=_cdsTabelaProduto;
    _cdsTabelaProduto.Open;
    _btnGeraPedido.Enabled:=true;

    SetGridItens;
    _btnParaExcel.Enabled:=true;

    vlEstoqueIncial    :=_cdsTabelaProdutoVT_ESTOQUE_DISPONIVEL.AsVariant;
    vlMediaInicial     :=_cdsTabelaProdutoVT_VENDA_MEDIA.AsVariant;
    vlPendenciaInicial :=_cdsTabelaProdutoVT_PENDENCIA.AsVariant;


    qtEstoqueIncial    := _cdsTabelaProdutoQTDE_ESTOQUE_DISPONIVEL.AsVariant;
    qtMediaInicial     := _cdsTabelaProdutoQTDE_VENDA_MEDIA.AsVariant;
    qtPendenciaInicial := _cdsTabelaProdutoQTDE_PENDENCIA.AsVariant;
    ValoresFornecedor;


  end;
  SetParametroCompra;
  Screen.Cursor:=crDefault;

  StatusBar1.Panels[0].Text:= 'Nr. Itens --> '+ FormatFloat('###,###,##0',_cdsTabelaProduto.RecordCount)


end;

procedure T_frmPedidoEspecial._btnParaExcelClick(Sender: TObject);
begin
 GerarExcel(_cdsTabelaProduto);
end;

procedure T_frmPedidoEspecial._dbgProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _dbgProdutos do
  begin
 {   if _dsTabelaProduto.DataSet.FieldByName('CD_EMPRESA').AsInteger=1 then
    begin
      Canvas.Font.Color:= clBlack;
      Canvas.Brush.Color:= clSkyBlue;
    end;
    if _dsPedidoElaboradorSC.DataSet.FieldByName('CD_EMPRESA').AsInteger=4 then
    begin
      Canvas.Font.Color:= clBlack;
//      Canvas.Brush.Color:= clFuchsia;
      //Canvas.Brush.Color:= $000080FF;
      Canvas.Brush.Color:= clInactiveCaption;
    end;}
    If odd(_dsTabelaProduto.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;

  if (_cdsTabelaProduto.FieldByName('ID_SELECIONADO').AsString)='N'then
  begin
    Canvas.brush.Color:= clRed;
    Canvas.Font.Color:= clWhite;
  end;


 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clBlue;
    Canvas.Font.Color:= clWhite;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmPedidoEspecial._dbgProdutosTitleClick(Column: TColumn);
begin
  GeraOrdenacao(_cdsTabelaProduto,Column);
end;

procedure T_frmPedidoEspecial._edtCoberturaEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 vlPeeCalculado ,
 vlPedidoCalculado:Double;
begin
  case key of
   VK_RETURN:begin
              vlPeeCalculado:= StrToFloatDef(_edtCoberturaEstoque.Text,0)/30;

              vlEstoque    :=vlEstoqueIncial;
              vlMedia      :=vlMediaInicial;
              vlPendencia  :=vlPendenciaInicial;


              qtEstoque  := qtEstoqueIncial;
              qtMedia   := qtMediaInicial;
              qtPendencia:= qtPendenciaInicial;
              if vlPeeCalculado>0 then
              begin
                    vlPedidoCalculado:=(vlPeeCalculado*vlMediaInicial)-(vlEstoqueIncial+vlPendenciaInicial);
                    _edtParametro.Text:=FormatFloat('###,###,##0.00',vlPedidoCalculado);

             end;
   end;
   end;

end;

procedure T_frmPedidoEspecial._edtNrFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
   VK_RETURN:begin
              if strtointdef(_edtnrfornecedor.text,0)>0then
              begin
                dadosfornecedor:=getdadoslaboratoriocomprador(strtointdef(_edtcomprador.text,0),
                                                              strtointdef(_edtnrfornecedor.text,0));

                if dadosfornecedor<>nil then
                begin
                 _btnGeraPedido.Enabled:=false;
                  _edtcomprador.text:=formatfloat('0000',dadosfornecedor.nrcomprador);
                  _edtNomeFornecedor.Text:=DadosFornecedor.dsNomeFantasia;
                  _edtParametro.SetFocus;
                 if (strtointdef(_edtnrfornecedor.text,0)>0) and (dadosfornecedor.nrfornecedor=0) then
                 begin
                    _btnGeraPedido.Enabled:=false;
                    mensagem('fornecedor n?o encontrado !!!',mb_iconwarning);
                    _edtnrfornecedor.setfocus;
                    exit;
                 end;
                end;
              end;

             end;
  end;
end;

procedure T_frmPedidoEspecial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmPedidoEspecial.FormCreate(Sender: TObject);
begin
 _edtComprador.Text:=IntToStr(nrCompradorSistema);
 _btnGeraPedido.Enabled:=false;
end;

procedure T_frmPedidoEspecial.FormShow(Sender: TObject);
begin
   _edtNrFornecedor.SetFocus;
end;

procedure T_frmPedidoEspecial.SetGridItens;
begin
  TIntegerField(_cdsTabelaProduto.FieldByName('COD_PRODUTO')).DisplayLabel:='Cod.Prod.';
  TIntegerField(_cdsTabelaProduto.FieldByName('COD_PRODUTO')).DisplayWidth:=8;

  TStringField(_cdsTabelaProduto.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsTabelaProduto.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsTabelaProduto.FieldByName('APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdsTabelaProduto.FieldByName('APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

  TIntegerField(_cdsTabelaProduto.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayLabel:='Qtd.Embal.';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayWidth:=8;

  TFloatField(_cdsTabelaProduto.FieldByName('VL_UNITARIO_COMPRA')).DisplayLabel:='P?o. Lista';
  TFloatField(_cdsTabelaProduto.FieldByName('VL_UNITARIO_COMPRA')).DisplayFormat:='###,###,##0.00';
  TFloatField(_cdsTabelaProduto.FieldByName('VL_UNITARIO_COMPRA')).DisplayWidth:=8;

  TStringField(_cdsTabelaProduto.FieldByName('ID_CURVA_MERCADORIA')).DisplayLabel:='Curva';
  TStringField(_cdsTabelaProduto.FieldByName('ID_CURVA_MERCADORIA')).DisplayWidth:=03;

  TIntegerField(_cdsTabelaProduto.FieldByName('CD_GRUPO_CURVA_FABRICANTE')).DisplayLabel:='Grupo Fornec.';
  TIntegerField(_cdsTabelaProduto.FieldByName('CD_GRUPO_CURVA_FABRICANTE')).DisplayWidth:=5;

  TFloatField(_cdsTabelaProduto.FieldByName('DT_AGENDA')).DisplayLabel:='Dt.Agenda';
  TFloatField(_cdsTabelaProduto.FieldByName('DT_AGENDA')).DisplayFormat:='dd/mm/yyyy';
  TFloatField(_cdsTabelaProduto.FieldByName('DT_AGENDA')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsTabelaProduto.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TStringField(_cdsTabelaProduto.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
  TStringField(_cdsTabelaProduto.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=5;

  TIntegerField(_cdsTabelaProduto.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdsTabelaProduto.FieldByName('CD_COMPRADOR')).DisplayWidth:=5;

  TIntegerField(_cdsTabelaProduto.FieldByName('CD_EMPRESA')).DisplayLabel:='Empresa';
  TIntegerField(_cdsTabelaProduto.FieldByName('CD_EMPRESA')).DisplayWidth:=5;

  TIntegerField(_cdsTabelaProduto.FieldByName('QT_VENDA')).DisplayLabel:='Qtd. Venda';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_VENDA')).DisplayWidth:=8;

  TIntegerField(_cdsTabelaProduto.FieldByName('QT_PEDIDO')).DisplayLabel:='Qtd. Pedido';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_PEDIDO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_PEDIDO')).DisplayWidth:=8;

  TFloatField(_cdsTabelaProduto.FieldByName('VL_MEDIA_DIARIA')).DisplayLabel:='M?dia Vda.Dia';
  TFloatField(_cdsTabelaProduto.FieldByName('VL_MEDIA_DIARIA')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsTabelaProduto.FieldByName('VL_MEDIA_DIARIA')).DisplayWidth:=10;

  TFloatField(_cdsTabelaProduto.FieldByName('MEDIA_DIA')).DisplayLabel:='M?dia Dia';
  TFloatField(_cdsTabelaProduto.FieldByName('MEDIA_DIA')).DisplayFormat:='###,##0.00';
  TFloatField(_cdsTabelaProduto.FieldByName('MEDIA_DIA')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayLabel:='Dias Estq.Max.';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_ESTOQUE_MAXIMO')).DisplayWidth:=8;

  TIntegerField(_cdsTabelaProduto.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayLabel:='Dias de Falta';
  TIntegerField(_cdsTabelaProduto.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('DIAS_ESTOQUE_ZERO')).DisplayWidth:=8;

  TIntegerField(_cdsTabelaProduto.FieldByName('NR_DIAS_ESTOQUE')).DisplayLabel:='Dias Estoque';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_DIAS_ESTOQUE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_DIAS_ESTOQUE')).DisplayWidth:=8;


  TIntegerField(_cdsTabelaProduto.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayLabel:='Freq.Compra';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_DIAS_FREQUENCIA_COMPRA')).DisplayWidth:=8;

  TIntegerField(_cdsTabelaProduto.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayLabel:='LeadTime';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_DIAS_LEADTIME_FABRICANTE')).DisplayWidth:=8;

  TIntegerField(_cdsTabelaProduto.FieldByName('QT_PENDENTE')).DisplayLabel:='Qtd.Pendente';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_PENDENTE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('QT_PENDENTE')).DisplayWidth:=8;

  TIntegerField(_cdsTabelaProduto.FieldByName('ESTOQUE_DISPONIVEL')).DisplayLabel:='Estoq.Dispon.';
  TIntegerField(_cdsTabelaProduto.FieldByName('ESTOQUE_DISPONIVEL')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('ESTOQUE_DISPONIVEL')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('NR_DIAS')).DisplayLabel:='Proxima Entrada(dias)';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_DIAS')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_DIAS')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('NR_PREVISAO_VENDA')).DisplayLabel:='Previs?o Venda';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_PREVISAO_VENDA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('NR_PREVISAO_VENDA')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayLabel:='Previs?o Est.C/Pend.';
  TIntegerField(_cdsTabelaProduto.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('PR_ESTQ_COM_PENDENCIA')).DisplayWidth:=10;

  TIntegerField(_cdsTabelaProduto.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayLabel:='Previs?o Est.S/Pend.';
  TIntegerField(_cdsTabelaProduto.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsTabelaProduto.FieldByName('PR_ESTQ_SEM_PENDENCIA')).DisplayWidth:=10;

 end;




procedure T_frmPedidoEspecial._btnGeraPedidoClick(Sender: TObject);
var
 vlCobertura,
 vlPedidoNovo,
 vlCoberturaAnterior:Double;
 nrFiltro,
 qtPedidoNovo:Integer;
begin
     SetParametroCompra;
     nrFiltro:=0;
     vlCoberturaAnterior:=vlCoberturaGeral;
     repeat
      Inc(nrFiltro);
      if vlCoberturaGeral<vlCoberturaAnterior then
        vlCoberturaAnterior:=vlCoberturaGeral;
       SelecionaItem;
       ValoresFornecedor;
       SetParametroCompra;
       StatusBar1.Panels[1].Text:= 'Nr. de Filtro --> '+ FormatFloat('###,###,##0',nrFiltro);
       Application.ProcessMessages;
     until vlCoberturaAnterior<=vlCoberturaGeral;
     StatusBar1.Panels[0].Text:= 'Nr. Itens --> '+ FormatFloat('###,###,##0',_cdsTabelaProduto.RecordCount);
     MontaPedido;

      _edtQtdadePendente.Text := FormatFloat('###,###,##0', qtPendenciaInicial);
      _edtValorPendente.Text  := FormatFloat('###,###,##0.00',vlPendenciaInicial);
      _edtQtdadeEstoque.Text  := FormatFloat('###,###,##0', qtEstoqueIncial);
      _edtValorEstoque.Text   := FormatFloat('###,###,##0.00',vlEstoqueIncial);
      _edtValorVendaMedia.Text:= FormatFloat('###,###,##0.00',vlMediaInicial);
      _edtQtdadeVendaMedia.Text:= FormatFloat('###,###,##0',qtMediaInicial);

      vlPedidoNovo:=_cdsTabelaProdutoVT_PEDIDO.AsVariant;
      qtPedidoNovo:=_cdsTabelaProdutoQT_PEDIDO.AsVariant;

     if _cbxValorQuantidade.ItemIndex=0 then
         vlPeeEspecial:=(vlEstoqueIncial+vlPendenciaInicial+vlPedidoNovo)/vlMediaInicial;
     if _cbxValorQuantidade.ItemIndex=1 then
         vlPeeEspecial:=(qtEstoqueIncial+qtPendenciaInicial+qtPedidoNovo)/qtMediaInicial;
     _edtParametroEspecial.Text:=FormatFloat('##0.00',vlPeeEspecial);
     vlCoberturaGeral:=vlPeeEspecial*30;
     _edtCoberturaEstoque.Text:=FormatFloat('###,##0',vlCoberturaGeral);
     EliminaItensSelecao;


end;

function T_frmPedidoEspecial.ExecutaPontoEncomenda(PnrComprador,PnrEmpresa,PnrFornecedor:Integer):TClientDataSet;
var

   stQry  :TStringList;
  _cdsTemp:TClientDataSet;
begin
  try
   stQry :=TStringList.Create;
    with stQry do
    begin
      Add('SELECT');
      Add('COD_PRODUTO,');
      Add('NM_MERCADORIA,');
      Add('APRESENTACAO_MERCADORIA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('VL_UNITARIO_COMPRA,');
      Add('DT_AGENDA,');

      add('case');
      add('WHEN (DT_AGENDA - Trunc(SYSDATE))>0 then  (DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE');
      add('else QT_DIAS_LEADTIME_FABRICANTE');
      Add('end NR_DIAS,');
      Add('ESTOQUE_DISPONIVEL,');
      Add('QT_PENDENTE,');
      Add('QT_VENDA,');
      Add('MEDIA_DIA,');
      Add('VL_MEDIA_DIARIA,');
      Add('CASE');
      Add('WHEN MEDIA_DIA> 0 THEN ROUND(ESTOQUE_DISPONIVEL/MEDIA_DIA,0)');
      Add('END NR_DIAS_ESTOQUE,');
      Add('0  as  QT_PEDIDO,');
      Add('CASE');
      Add('WHEN (DT_AGENDA - Trunc(SYSDATE))>0 then');
      Add('Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0)');
      add(' ELSE QT_DIAS_LEADTIME_FABRICANTE * MEDIA_DIA');
      add('END NR_PREVISAO_VENDA,');
      Add('');
      Add('case');
      Add('WHEN (DT_AGENDA - Trunc(SYSDATE))>0 then ( ESTOQUE_DISPONIVEL+QT_PENDENTE) - Round(QT_DIAS_LEADTIME_FABRICANTE * MEDIA_DIA,0)');
      Add('ELSE');
      Add('(( ESTOQUE_DISPONIVEL+QT_PENDENTE) -  Round((QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0))');
      Add('END PR_ESTQ_COM_PENDENCIA,');
      Add('case');
      Add('WHEN (DT_AGENDA - Trunc(SYSDATE))>0 then  ( ESTOQUE_DISPONIVEL) - Round((QT_DIAS_LEADTIME_FABRICANTE * MEDIA_DIA),0)');
      Add('ELSE (( ESTOQUE_DISPONIVEL) - Round(((QT_DIAS_LEADTIME_FABRICANTE)) * MEDIA_DIA,0))');
      Add('END PR_ESTQ_SEM_PENDENCIA,');
//     Add('(( ESTOQUE_DISPONIVEL) -  Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0)) PR_ESTQ_COM_PENDENCIA,');
  ///   Add('(( ESTOQUE_DISPONIVEL) - Round((((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE)) * MEDIA_DIA,0)) AS PR_ESTQ_SEM_PENDENCIA,');
     // Add('0 as  PR_ESTQ_COM_PENDENCIA,');
    //  Add('0  AS PR_ESTQ_SEM_PENDENCIA,');
      Add('CD_GRUPO_CURVA_FABRICANTE,');
      Add('CD_GRUPO_FORNECEDOR  ,');
      Add('DS_GRUPO_FORNECEDOR,');
      Add('CD_COMPRADOR,');
      Add('ID_CURVA_MERCADORIA,');
      Add('CD_EMPRESA,');
      Add('QT_ESTOQUE_MAXIMO,');
      Add('QT_ESTOQUE_MINIMO,');
      Add('DIAS_ESTOQUE_ZERO,');
      Add('QT_DIAS_FREQUENCIA_COMPRA,');
      Add('QT_DIAS_LEADTIME_FABRICANTE,');
      Add('QT_CAIXA_CAMADA,');
      Add('QT_CAIXA_PALETE,');

  //    Add('CASE');
  //    Add('  WHEN QT_SUGERIDA_COM_PENDENCIA>0 THEN QT_SUGERIDA_COM_PENDENCIA');
   //   Add('  ELSE 0');
//      Add('0  as  QT_SUGERIDA_COM_PENDENCIA,');
 //     Add('CASE');
  //    Add('  WHEN QT_SUGERIDA_SEM_PENDENCIA>0 THEN QT_SUGERIDA_SEM_PENDENCIA');
    //  Add('  ELSE 0');
      Add('0 as  QT_SUGERIDA_SEM_PENDENCIA,');
      Add('NR_PRODUTO, ''S'' AS ID_SELECIONADO,');
      Add('DS_NIVEL_EITM,');
      Add('DS_NIVEL_ERGM');

      Add('');
      Add('from');
      Add('((SELECT');
      Add('MERCADORIA.CD_MERCADORIA*10+MERCADORIA.NR_DV_MERCADORIA AS COD_PRODUTO,');
      Add('MERCADORIA.NM_MERCADORIA AS NM_MERCADORIA,');
      Add('MERCADORIA.DS_APRESENTACAO_MERCADORIA AS APRESENTACAO_MERCADORIA,');
      Add('QT_EMBALAGEM_COMPRA,');
      Add('QT_CAIXA_CAMADA,');
      Add('QT_CAIXA_PALETE,');
      Add('VL_UNITARIO_COMPRA,');
      Add('COMPRA_MERCADORIA.ID_CURVA_MERCADORIA,');
      Add('GF.CD_GRUPO_CURVA_FABRICANTE,');
      Add('TRUNC(GF.DT_AGENDAMENTO) DT_AGENDA,');
      Add('GF.CD_GRUPO_FORNECEDOR  ,');
      Add('DS_GRUPO_FORNECEDOR,');
      Add('CD_COMPRADOR,');
      Add('COMPRA_MERCADORIA.CD_EMPRESA,');
      Add('QT_VENDA,');
      Add('CASE');
      Add('  WHEN (NR_DIAS- DIAS_ESTOQUE_ZERO)>0 THEN TRUNC(QT_VENDA/(NR_DIAS-DIAS_ESTOQUE_ZERO),2)');
      Add('ELSE');
      Add('  0');
     Add('END MEDIA_DIA,');
      add('VL_MEDIA_DIARIA,');
        Add('NVL(DIAS_ESTOQUE_ZERO,0) AS DIAS_ESTOQUE_ZERO,');
      Add('GFM.QT_DIAS_FREQUENCIA_COMPRA,');
      Add('QT_DIAS_LEADTIME_FABRICANTE,');
      Add('');
      Add('      GFM.QT_ESTOQUE_MAXIMO,GFM.QT_ESTOQUE_MINIMO,');
      Add('(QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) AS ESTOQUE_DISPONIVEL,');
      Add(' NVL(QT_PENDENTE,0) AS QT_PENDENTE,');
      Add('CASE');
      Add('WHEN (NR_DIAS-NVL(DIAS_ESTOQUE_ZERO,0))>0 THEN');
      Add('   ROUND( (((GFM.QT_ESTOQUE_MAXIMO + QT_DIAS_LEADTIME_FABRICANTE) * (QT_VENDA/(NR_DIAS-DIAS_ESTOQUE_ZERO)) -');
      Add('    ((QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) ))/ QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
      Add('END QT_SUGERIDA_COM_PENDENCIA,');
      Add('CASE');
      Add('WHEN (NR_DIAS-NVL(DIAS_ESTOQUE_ZERO,0))>0 THEN');
      Add('   ROUND( (((GFM.QT_ESTOQUE_MAXIMO + QT_DIAS_LEADTIME_FABRICANTE) * (QT_VENDA/(NR_DIAS-DIAS_ESTOQUE_ZERO)) -');
      Add('    ((QT_FISICO - QT_RESERVADO - QT_VENCIDO - QT_RESERVA_PROBLEMATICA) ))/ QT_EMBALAGEM_COMPRA),0)*QT_EMBALAGEM_COMPRA');
      Add('END QT_SUGERIDA_SEM_PENDENCIA,MERCADORIA.CD_MERCADORIA as NR_PRODUTO,');
      Add('DS_NIVEL_EITM,');
      Add('DS_NIVEL_ERGM');

      Add('FROM');
      Add('PRDDM.DC_MERCADORIA  MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE_MERCADORIA ON ESTOQUE_MERCADORIA.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA ON  COMPRA_MERCADORIA.CD_MERCADORIA=ESTOQUE_MERCADORIA.CD_MERCADORIA');
      Add('                                                                AND COMPRA_MERCADORIA.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR GF ON COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      Add('');
      Add('LEFT JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA GFM ON GFM.CD_GRUPO_CURVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE AND GFM.ID_CURVA_MERCADORIA=COMPRA_MERCADORIA.ID_CURVA_MERCADORIA');
      Add('LEFT OUTER JOIN PRDDM.DC_GRUPO_FABRICANTE_MERCADORIA MAXIMO ON MAXIMO.CD_GRUPO_CURVA_FABRICANTE=GF.CD_GRUPO_CURVA_FABRICANTE');
      Add('                                             AND  COMPRA_MERCADORIA.ID_CURVA_MERCADORIA=MAXIMO.ID_CURVA_MERCADORIA');
      Add('LEFT OUTER JOIN');
      Add('(SELECT');
      Add('CD_MERCADORIA,NVL(MAX(VL_BASE_COMPRA),0) AS VL_UNITARIO_COMPRA,nvl(max(PC_ICMS_COMPRA),0) asPC_ICMS_COMPRA , nvl(max(VL_BASE_COMPRA),0) as VL_BASE_COMPRA');
      Add(',CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR A');
      Add('WHERE');
      Add('TRUNC(A.DT_MUDANCA_PRECO)=(SELECT MAX(B.DT_MUDANCA_PRECO)');
      Add('FROM');
      Add('PRDDM.DC_LISTA_PRECO_FORNECEDOR B,');
      Add('PRDDM.DC_COMPRA_MERCADORIA COMPRA');
      Add('WHERE COMPRA.CD_MERCADORIA=B.CD_MERCADORIA');
      Add('AND A.CD_MERCADORIA=B.CD_MERCADORIA');
      Add('AND COMPRA.CD_EMPRESA=B.CD_EMPRESA');
      Add('AND TRUNC(B.DT_ATUALIZACAO) <=TRUNC(SYSDATE) AND B.CD_EMPRESA= A.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA');
      Add(',CD_EMPRESA');
      Add(') LISTA_PRECO ON LISTA_PRECO.CD_MERCADORIA=MERCADORIA.CD_MERCADORIA');
      Add('       AND LISTA_PRECO.CD_EMPRESA=ESTOQUE_MERCADORIA.CD_EMPRESA');
      Add('');
      Add('  LEFT OUTER JOIN (SELECT');
      Add('CD_MERCADORIA AS NR_PRODUTO_2,');
      Add('CD_EMPRESA_02,');
      Add('SUM(NVL(DECODE(PERIODO,''MES3'',QT_VENDIDA),0)) AS MES3,');
      Add('SUM(NVL(DECODE(PERIODO,''MES2'',QT_VENDIDA),0)) AS MES2,');
      Add('SUM(NVL(DECODE(PERIODO,''MES1'',QT_VENDIDA),0)) AS MES1,');
      Add('SUM(NVL(DECODE(PERIODO,''MES0'',QT_VENDIDA),0)) AS MES0,');
      Add('SUM(QT_DIAS_ESTOQUE_ZERO) AS DIAS_ESTOQUE_ZERO,');
      Add('SUM(NR_DIAS_DIV) AS NR_DIAS_DIV,');
      Add('SUM(QT_VENDIDA) AS QT_VENDA,');
      Add('Sum(QT_MEDIA_VENDA_DIARIA) AS VL_MEDIA_DIARIA,');
      Add('ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),0) -  ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3) AS NR_DIAS');
      Add('FROM');
      Add('(SELECT');
      Add('CM.CD_MERCADORIA ,');
      Add('VM.CD_EMPRESA AS CD_EMPRESA_02,');
      Add('SUM(QT_VENDIDA) QT_VENDIDA,');
      Add('CASE');
      Add('WHEN  EXTRACT(MONTH FROM DT_VENDA_MERCADORIA)= EXTRACT(MONTH FROM SYSDATE) THEN  Sum(qt_media_venda_diaria)');
//      Add('ELSE 0');
      Add('END QT_MEDIA_VENDA_DIARIA,');

      Add('CASE');
      Add('WHEN CD_OPERADOR_LOGISTICO=1 THEN SUM(QT_DIAS_ESTOQUE_ZERO)');
      Add('END QT_DIAS_ESTOQUE_ZERO,');
      Add('');
      Add('DECODE(DT_VENDA_MERCADORIA,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3),''MES3''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-2),''MES2''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-1),''MES1''');
      Add('                          ,ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),00),''MES0'') AS PERIODO,');
      Add('           (ADD_MONTHS(TRUNC(MAX(SYSDATE),''MONTH''),-1)  - TRUNC(MAX(DT_VENDA_MERCADORIA))) NR_DIAS_DIV');
      Add('FROM');
      Add('PRDDM.DC_VENDA_ACUMULADA_MERCADORIA VM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      Add('VM.CD_MERCADORIA=CM.CD_MERCADORIA');
      add('and cd_operador_logistico=1');
      Add('AND    VM.CD_EMPRESA=CM.CD_EMPRESA');
      Add('');
      Add('AND CD_GRUPO_FORNECEDOR>0');
      Add('AND DT_VENDA_MERCADORIA>= ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),-3)');
      Add('AND DT_VENDA_MERCADORIA< ADD_MONTHS(TRUNC(SYSDATE,''MONTH''),0)');
      Add('GROUP BY CM.CD_MERCADORIA,DT_VENDA_MERCADORIA,CD_OPERADOR_LOGISTICO,VM.CD_EMPRESA)');
      Add('GROUP BY CD_MERCADORIA,CD_EMPRESA_02) VENDA ON VENDA.NR_PRODUTO_2 = MERCADORIA.CD_MERCADORIA AND ESTOQUE_MERCADORIA.CD_EMPRESA=CD_EMPRESA_02');

      Add('LEFT OUTER JOIN (SELECT  ');
      Add('NROM_Y,');
      Add('SUM(QUAY_Y-CHEY_Y) AS QT_PENDENTE,');
      Add('ITEM.CD_EMPRESA');
      Add('FROM');
      Add('PRDDM.DCPCC CAPA,');
      Add('PRDDM.DCPCI ITEM,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM_P');
      Add('WHERE');
      Add('NROP_P=NROP_Y');
      Add('AND SITP_P IN(''P'',''N'')');
      Add('AND SITY_Y IN(''P'',''N'')');
      Add('AND NROM_Y=CM_P.CD_MERCADORIA');
      Add('AND ITEM.CD_EMPRESA=CM_P.CD_EMPRESA');
      aDD('GROUP BY NROM_Y,ITEM.CD_EMPRESA) PENDENCIA');
      Add('ON PENDENCIA.NROM_Y=MERCADORIA.CD_MERCADORIA AND COMPRA_MERCADORIA.CD_EMPRESA=PENDENCIA.CD_EMPRESA');
      Add('WHERE');
      Add('MERCADORIA.CD_MERCADORIA>0');
      if PnrFornecedor>0 then
         Add('AND COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrComprador>0 then
         Add('AND CD_COMPRADOR=:PnrComprador');
      Add('AND DT_PRIMEIRA_COMPRA<>''01/01/2039''');
      if PnrEmpresa>0 then
          Add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrEmpresa');


      Add('AND MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
      Add('AND ESTOQUE_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''))');
     // Add('AND TRUNC(GF.DT_AGENDAMENTO)>SYSDATE))');
      Add('WHERE');
      Add('COD_PRODUTO>0');

//      --SQL.Add('(ESTOQUE_DISPONIVEL  +qt_pendente ) -  Round(((DT_AGENDA - Trunc(SYSDATE))+QT_DIAS_LEADTIME_FABRICANTE) * MEDIA_DIA,0) <0');
//      SQL.Add('ORDER by CD_GRUPO_FORNECEDOR,NM_MERCADORIA,APRESENTACAO_MERCADORIA,CD_EMPRESA');
      end;
      stQry.SaveToFile('c:\temp\QryPontoEncomendaSistema.sql');
      with _cdsTabelaProduto do
      begin
       close;
       CommandText:=stQry.Text;
       if PnrComprador >0 then
          Params.ParamByName('PnrComprador').AsInteger := PnrComprador;

       if PnrEmpresa>0 then
          Params.ParamByName('PnrEmpresa').AsInteger   := PnrEmpresa;
       if PnrFornecedor>0 then
          Params.ParamByName('PnrFornecedor').AsInteger := PnrFornecedor;
       open;
      end;
      result:=nil;
      if not _cdsTabelaProduto.IsEmpty then
         result:=_cdsTemp;

  finally
      freeAndNil(stQry);
  end;
end;

procedure T_frmPedidoEspecial.SetParametroCompra;
begin
     vlPeeEspecial:=0;
     _edtParametro.Text:=AnsiReplaceStr(_edtParametro.Text,'.','');
     vlParamentro:=StrToFloatDef(_edtParametro.Text,0);
    if _cbxValorQuantidade.ItemIndex=0 then
     _edtParametro.Text:= FormatFloat('###,###,##0.00',vlParamentro);
    if _cbxValorQuantidade.ItemIndex=1 then
      _edtParametro.Text:= FormatFloat('###,###,##0',vlParamentro);
    if vlParamentro=0 then
    begin
      Mensagem('Valor Parametro ? Necessario!!',MB_ICONWARNING);
      _edtParametro.SetFocus;
      _edtParametro.SelectAll;
    end;


  if vlMediaInicial>0 then
  begin
     if _cbxValorQuantidade.ItemIndex=0 then
         vlPeeEspecial:=(vlEstoque+vlPendencia+vlParamentro)/vlMedia;
     if _cbxValorQuantidade.ItemIndex=1 then
         vlPeeEspecial:=(qtEstoque+qtPendencia+vlParamentro)/qtMedia;
     _edtParametroEspecial.Text:=FormatFloat('##0.00',vlPeeEspecial);
     vlCoberturaGeral:=vlPeeEspecial*30;
     _edtCoberturaEstoque.Text:=FormatFloat('###,##0',vlCoberturaGeral);
  end;

end;

procedure T_frmPedidoEspecial.SelecionaItem;
var
 vlMedia,
 vlDiasEstoque,
 vtTotalItem,
 vlPendencia,
 vlEstoque,
 vlSugestaoIdeal,
 vlSugstaoPossivel,

 vlItem:Double;
 nrDiasEstoque,
 nrItens,
 qtEmbalagemCompra,
 nrProdutoLocal:Integer;
begin

 _cdsTabelaProduto.First;
 while Not _cdsTabelaProduto.Eof do
 begin
    _cdsTabelaProduto.Edit;
    if _cbxValorQuantidade.ItemIndex=0 then
       vlItem := _cdsTabelaProduto.FieldByName('VL_UNITARIO_COMPRA').AsFloat
     else
       vlItem:=1;
    nrProdutoLocal   := _cdsTabelaProduto.FieldByName('NR_PRODUTO').AsInteger;
    vlMedia          := _cdsTabelaProduto.FieldByName('MEDIA_DIA').AsFloat*vlItem;
    vlPendencia      := _cdsTabelaProduto.FieldByName('QT_PENDENTE').AsInteger    *vlItem;
    vlEstoque        := _cdsTabelaProduto.FieldByName('ESTOQUE_DISPONIVEL').AsInteger*vlItem;
    qtEmbalagemCompra:= _cdsTabelaProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;

    vlSugestaoIdeal  := (vlMedia*(vlPeeEspecial*30)) -   (vlEstoque + vlPendencia);
    vlSugstaoPossivel := 0;
    if vlSugestaoIdeal>0 then
       vlSugstaoPossivel :=  strtoint(FormatFloat('000000',vlSugestaoIdeal/qtEmbalagemCompra));




    nrDiasEstoque:= 0;
    if vlMedia>0 then
       nrDiasEstoque:= strtoint(formatfloat('00000000',(vlEstoque+vlPendencia)/vlMedia));
    if (nrDiasEstoque> vlCoberturaGeral) or (vlSugstaoPossivel=0)  then
      _cdsTabelaProduto.FieldByName('ID_SELECIONADO').AsString:='N';

   _cdsTabelaProduto.Next;
 end;
 if not _cdsTabelaProduto.IsEmpty then
        nrItens:=_cdsTabelaProduto.RecordCount;
 EliminaItensSelecao;

 ValoresFornecedor;
end;

procedure T_frmPedidoEspecial.ValoresFornecedor;
begin
    if _cdsTabelaProdutoQTDE_PENDENCIA.AsVariant<>null then
    begin

    vlEstoque    :=_cdsTabelaProdutoVT_ESTOQUE_DISPONIVEL.AsVariant;
    vlMedia      :=_cdsTabelaProdutoVT_VENDA_MEDIA.AsVariant;
    vlPendencia  :=_cdsTabelaProdutoVT_PENDENCIA.AsVariant;


    qtEstoque   := _cdsTabelaProdutoQTDE_ESTOQUE_DISPONIVEL.AsVariant;
    qtMedia     := _cdsTabelaProdutoQTDE_VENDA_MEDIA.AsVariant;
    qtPendencia := _cdsTabelaProdutoQTDE_PENDENCIA.AsVariant;


      _edtQtdadePendente.Text := FormatFloat('###,###,##0', qtPendencia);
      _edtValorPendente.Text  := FormatFloat('###,###,##0.00',vlPendencia);
      _edtQtdadeEstoque.Text  := FormatFloat('###,###,##0', qtEstoque);
      _edtValorEstoque.Text   := FormatFloat('###,###,##0.00',vlEstoque);
      _edtValorVendaMedia.Text:= FormatFloat('###,###,##0.00',vlMedia);
      _edtQtdadeVendaMedia.Text:= FormatFloat('###,###,##0',qtMedia);

      _edtQtadePedido.Text:= FormatFloat('###,###,##0',_cdsTabelaProdutoQT_PEDIDO.AsVariant);
      _edtValorPedido.Text:= FormatFloat('###,###,##0.00',_cdsTabelaProdutoVT_PEDIDO.AsVariant);

    end;

end;


procedure T_frmPedidoEspecial._chkFiltroClick(Sender: TObject);
begin
  if _chkFiltro.Checked then
    _cdsTabelaProduto.Filtered:=false;

end;

procedure T_frmPedidoEspecial.DBGrid2DblClick(Sender: TObject);
begin
 FiltraPorEspecealidade(_cdsEspecealidade.FieldByName('NR_SEQUENCIAL').AsInteger);
end;

procedure T_frmPedidoEspecial.EliminaItensSelecao;
begin
     with _cdsTabelaProduto do
     begin
       Filtered:=false;
       Filter  :='ID_SELECIONADO=''S''';
       Filtered:=TRUE;
     end;
end;


procedure T_frmPedidoEspecial.MontaPedido;
var
 vlMedia,
 vlDiasEstoque,
 vtTotalItem,
 vlPendencia,
 vlEstoque,
 vlItem,
 vlSugestaoIdeal,
 vlSugstaoPossivel:Double;
 nrDiasEstoque,
 NrDiasEstoqueCadastro,
 qtPedido,
 qtSugeridaCamadaPalete,
 qtCamada,
 qtPalete,
 qtEmbalagemCompra,
 nrProdutoLocal:Integer;

begin

 _cdsTabelaProduto.First;
 while Not _cdsTabelaProduto.Eof do
 begin
    _cdsTabelaProduto.Edit;
 {   if _cbxValorQuantidade.ItemIndex=0 then
       vlItem := _cdsTabelaProduto.FieldByName('VL_UNITARIO_COMPRA').AsFloat
     else
       vlItem:=1;}
    nrProdutoLocal         :=_cdsTabelaProduto.FieldByName('NR_PRODUTO').AsInteger;
    qtEmbalagemCompra      := _cdsTabelaProduto.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
    vlMedia                := _cdsTabelaProduto.FieldByName('MEDIA_DIA').AsFloat;
    vlPendencia            := _cdsTabelaProduto.FieldByName('QT_PENDENTE').AsInteger ;
    vlEstoque              := _cdsTabelaProduto.FieldByName('ESTOQUE_DISPONIVEL').AsInteger;
    qtCamada               := _cdsTabelaProduto.FieldByName('QT_CAIXA_CAMADA').AsInteger;
    qtPalete               := _cdsTabelaProduto.FieldByName('QT_CAIXA_PALETE').AsInteger;
    NrDiasEstoqueCadastro  := _cdsTabelaProduto.FieldByName('QT_ESTOQUE_MAXIMO').AsInteger;
    _cdsTabelaProduto.FieldByName('VL_MEDIA_DIARIA').asfloat:= (vlPeeEspecial*30);
    nrDiasEstoque:= 0;
    if vlMedia>0 then
       nrDiasEstoque:= strtoint(formatfloat('00000000',(vlEstoque+vlPendencia)/vlMedia));

     vlSugestaoIdeal:=    (vlMedia*(vlPeeEspecial*30)) -   (vlEstoque + vlPendencia);
     vlSugstaoPossivel := 0;
     qtPedido:= 00;
     if vlSugestaoIdeal>0 then
       qtPedido:=  strtoint(FormatFloat('000000',vlSugestaoIdeal/qtEmbalagemCompra))*qtEmbalagemCompra;

     if _chkAjustaCamadaPalete.Checked then
     begin
      DadosSugestaoCamadaPalete   := SetQuantidadePaleteCamada(qtPedido,// PqtPedido,
                                                            qtEmbalagemCompra,// PqtEmbalagem,
                                                            qtCamada,// PqtCamada,
                                                            qtPalete,// PqtPalete,
                                                            NrDiasEstoqueCadastro+
                                                            dadosfornecedor.nrDiasLeadTime,

                                                            _cdsTabelaProduto.FieldByName('ESTOQUE_DISPONIVEL').AsInteger+
                                                            _cdsTabelaProduto.FieldByName('QT_PENDENTE').AsInteger ,

                                                            vlMedia
                                                            ,vlPeeEspecial,_cdsTabelaProduto.FieldByName('QT_DIAS_FREQUENCIA_COMPRA').AsInteger,
                                                            _cdsTabelaProduto.FieldByName('ID_CURVA_MERCADORIA').AssTRING,
                                                            _cdsTabelaProduto.FieldByName('QT_PENDENTE').AsInteger,
                                                            0);

     qtSugeridaCamadaPalete:=DadosSugestaoCamadaPalete.qtPedido;
     if qtSugeridaCamadaPalete>0 then
       _cdsTabelaProduto.FieldByName('QT_PEDIDO').AsFloat:=qtSugeridaCamadaPalete;
     end
     else
       _cdsTabelaProduto.FieldByName('QT_PEDIDO').AsFloat:=qtPedido;


//     if _cdsTabelaProduto.FieldByName('QT_PEDIDO').AsFloat=0  then
  //     _cdsTabelaProduto.FieldByName('ID_SELECIONADO').AsString:='N';







//    if nrDiasEstoque> vlCoberturaGeral  then
  //    _cdsTabelaProduto.FieldByName('ID_SELECIONADO').AsString:='N';


   _cdsTabelaProduto.Next;
 end;
 ValoresFornecedor;
end;


procedure T_frmPedidoEspecial.SetGridEspecealidade;
begin
  TIntegerField(_cdsEspecealidade.FieldByName('NR_SEQUENCIAL')).DisplayLabel:='Nr.Especealidade';
  TIntegerField(_cdsEspecealidade.FieldByName('NR_SEQUENCIAL')).DisplayWidth:=8;

  TStringField(_cdsEspecealidade.FieldByName('ESPECEALIDADE')).DisplayLabel:='Especealidade';
  TStringField(_cdsEspecealidade.FieldByName('ESPECEALIDADE')).DisplayWidth:=25;

end;


FUNCTION T_frmPedidoEspecial.FiltraPorEspecealidade(nrSequencia: Integer): boolean;
BEGIN
  WITH _cdsTabelaProduto DO
  BEGIN
    Filtered := False;
    filter := 'DS_NIVEL_EITM=' + IntToStr(nrSequencia) + ' OR DS_NIVEL_ERGM=' +IntToStr(nrSequencia);
    Filtered := true;
  END;
END;





end.
