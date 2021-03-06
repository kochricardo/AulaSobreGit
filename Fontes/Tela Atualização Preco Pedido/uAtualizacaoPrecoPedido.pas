
unit uAtualizacaoPrecoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ComCtrls,uAuxiliarCompras,
  Buttons,uRotinasGenericas, ExtCtrls,uProduto;

type
  T_frmAtualizaprecoPedido = class(TForm)
    _stbAtualizaPreco: TStatusBar;
    GroupBox40: TGroupBox;
    _dbgListaPreco: TDBGrid;
    _dsListaPreco: TDataSource;
    _cdsListaPrecoAtiva: TClientDataSet;
    _cdsItemListaPreco: TClientDataSet;
    _cdsTabelaPreco: TClientDataSet;
    GroupBox4: TGroupBox;
    _dbgItemPedido: TDBGrid;
    _edtNrVerbaDesconto: TEdit;
    Label27: TLabel;
    _edtDescAdicional: TEdit;
    Label1: TLabel;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    _btnAltera: TBitBtn;
    _edtNrPedido: TEdit;
    Label2: TLabel;
    _edtNomeFornecedor: TEdit;
    _rgDescontoAdicional: TRadioGroup;
    Label8: TLabel;
    _edtPcVerba: TEdit;
    procedure _dbgListaPrecoDblClick(Sender: TObject);
    procedure _btnAlteraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgItemPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure _dbgListaPrecoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure _edtNrVerbaDescontoExit(Sender: TObject);
  private
    { Private declarations }
    nrListaPrecoExcecao :Integer;
    nrVerba :integer;
    pcVerba :Double;

    procedure AbreDadosFornedor(PnrPedido: Integer);
    procedure AltualizaPrecoPedido(PnrPedido: Integer);
    procedure AbreItensPedidos(nrPedido: Integer);
    procedure SetGridItemPedido;
    function ListaPrecoAtivas(PnrFornecedor, PnrProduto: Integer): Boolean;
    procedure SetGridListaPreco;
    function GetPrecoItem(PnrProduto, PcdEmpresa: Integer; PvlPrecoFornecedor,
      PpcDescontoAbatimento: Double; PIdPrecoAtual: Char; PidPedidoBloqueado,
      PnrLIstaPrecoAtiva: Integer): TListaPreco;
    function SetListaPrecoAtiva(PnrLista, PnrProduto,
      PnrEmpresa: Integer): TListaPrecoAtiva;
    function ValidaVerba(PnrVerba: Integer): Integer;
  public
    { Public declarations }
  DadosPedidoAbertuta: TDadosValoresPedido;
  DadosPedido :TDadosValoresPedido;
  end;

var
  _frmAtualizaprecoPedido: T_frmAtualizaprecoPedido;
  nrPedidoAlteracao :Integer;
   precoLista: TListaPreco;
  PrecoItem: TCalculoPreco;
  pcDescontoAdicional:Double;
  DadosFornecedor:TDadosFornecedor;


implementation







{$R *.dfm}

procedure T_frmAtualizaprecoPedido._dbgItemPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _dbgItemPedido do
  begin
    If odd(_dsItemPedido.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
  end
  else
  begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
  end;
(**  if (_dsItemPedido.DataSet.FieldByName('CHEY_Y').AsInteger=0) then
    begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:=clYellow;
   end;*)
 if (Column.Field.FieldName = 'VCCI_Y') then
 begin
   if (_dsItemPedido.DataSet.FieldByName('VCCI_Y').AsFloat=0) then
   begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clblue;
  end;
 end;

  if (_dsItemPedido.DataSet.FieldByName('ID_NFE_TRANSITO').AsString='S') then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clGreen;
  end;


 if (Column.Field.FieldName = 'SITY_Y') then
 begin
  if (_dsItemPedido.DataSet.FieldByName('SITY_Y').AsString='C') then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clRed;
  end;
  if (_dsItemPedido.DataSet.FieldByName('SITY_Y').AsString='F') and
     ((_dsItemPedido.DataSet.FieldByName('CHEY_Y').AsInteger=0)<>
     (_dsItemPedido.DataSet.FieldByName('QUAY_Y').AsInteger=0)) then
  begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:=clYellow;
  end;
 end;
 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clMoneyGreen;
    Canvas.Font.Color:= clBlack;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmAtualizaprecoPedido._dbgListaPrecoDblClick(Sender: TObject);
begin
  if nrListaPrecoExcecao = 0 then
  begin
    _cdsListaPrecoAtiva.Edit;
    nrListaPrecoExcecao := _cdsListaPrecoAtiva.FieldByName('NR_LISTA') .AsInteger;
    if _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString = 'N' then
      _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'S'
    else
    begin
      _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'N';
      nrListaPrecoExcecao := 0;
    end;
  end
  else
  begin
    if nrListaPrecoExcecao > 0 then
    begin
      _cdsListaPrecoAtiva.Edit;
      if _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString = 'N' then
        _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'S'
      else
      begin
        _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString := 'N';
        nrListaPrecoExcecao := 0;
      end;

    end;
  end;
  _cdsListaPrecoAtiva.post;
  _cdsListaPrecoAtiva.open;
  _cdsItemListaPreco := nil;
  if nrListaPrecoExcecao > 0 then
    _cdsItemListaPreco := AbrePrecoListaAtiva(nrListaPrecoExcecao);
  if _cdsItemListaPreco <> nil then
    _cdsItemListaPreco.open;

end;


procedure T_frmAtualizaprecoPedido._dbgListaPrecoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // mude a cor das celulas em que valor = 0
  with _dbgListaPreco do
  begin
    if odd(_cdsListaPrecoAtiva.RecNo) then
    begin
      _dbgListaPreco.Canvas.Font.Color := clBlack;
      _dbgListaPreco.Canvas.Brush.Color := clMoneyGreen;
    end
    else
    begin
      _dbgListaPreco.Canvas.Font.Color := clBlack;
      _dbgListaPreco.Canvas.Brush.Color := clWhite;
    end;
    if _cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO').AsString = 'S' then
    begin
      _dbgListaPreco.Canvas.Font.Color := clWhite;
      _dbgListaPreco.Canvas.Brush.Color := clGreen;
    end;

    defaultDrawColumncell(Rect, DataCol, Column, State);
  end;

end;

procedure T_frmAtualizaprecoPedido._edtNrVerbaDescontoExit(Sender: TObject);
begin

  nrverba :=StrToIntDef(_edtNrVerbaDesconto.Text,0);


   if nrVerba>0 then
      nrVerba:=ValidaVerba(nrVerba);

end;

procedure T_frmAtualizaprecoPedido.AbreDadosFornedor(PnrPedido:Integer);
begin

    DadosPedidoAbertuta := GetValoresPedido(PnrPedido, false);
    if DadosPedidoAbertuta <> nil then
    begin
       _edtNrPedido.Text       :=  FormatFloat('#########0',  DadosPedidoAbertuta.nrPedido);
       _edtNomeFornecedor.Text := DadosPedidoAbertuta.stNomeFornecedor;



    end;



end;


procedure T_frmAtualizaprecoPedido.AltualizaPrecoPedido(PnrPedido:Integer);
var
 nrProduto,
 nrDigitoMercadoria,
 cdListapreco ,
 cdoperadorLogisticoPedido,
 nrVerbaItem,
 nrQuantidadePedido,
 nrPrazoDias :Integer;
 DadosProduto :TMercadoria;
 pcDescontoAdicionalItem,
 pcVerbaLocal,
 pcCreditoICMS,
 vlPrecoCusto,
 pcDescontoPadrao,
 vlCustoItem:Double;
 nrVerbaLocal,
 qtBonificado:Integer;
 idbonificado:boolean;


begin


  _cdsItemPedido.First;

  _stbAtualizaPreco.Panels[0].Text:='Aguarde... Atualizando pre?o do itens.';

  while not _cdsItemPedido.Eof do
  begin

         nrProduto:=_cdsItemPedido.FieldByName('NROM_Y').AsInteger;
         nrDigitoMercadoria:=StrToIntDef(COPY(formatfloat('0000000',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger),7,1),0);
         cdListapreco :=_cdsItemPedido.FieldByName('CD_LISTA_COMPRA').AsInteger;
         cdoperadorLogisticoPedido :=_cdsItemPedido.FieldByName('NR_OPERADOR_LOGISTICO').AsInteger;
         nrQuantidadePedido        :=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
         vlPrecoCusto              :=_cdsItemPedido.FieldByName('VCCI_Y').AsFloat;
         nrPrazoDias               :=_cdsItemPedido.FieldByName('PRZY_Y').AsInteger;
         qtBonificado              :=_cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger;
         nrVerbaLocal:= nrVerba;
         pcVerbaLocal:=pcVerba;

         if pcVerbaLocal=0 then
            pcVerbaLocal:=_cdsItemPedido.FieldByName('PC_VERBA').AsFloat;
         if nrVerba=0 then
            nrVerbaLocal:=_cdsItemPedido.FieldByName('NRVV_Y').AsInteger ;

         if (pcDescontoAdicional=0) and (qtBonificado=0) then
         begin
            nrVerbaLocal:=0;
            pcVerbaLocal:=0;
         end;



        DadosProduto:=GetMercadoriaNova(nrProduto,nrDigitoMercadoria,0,DadosPedidoAbertuta.cdEmpresa,DadosPedidoAbertuta.nrOperadorLogistico,'');
        _stbAtualizaPreco.Panels[1].Text:=' Produto --> '+formatfloat('0000000', DadosProduto.cdProduto)+' - '+ DadosProduto.nmProdutoCompleto;

     if DadosProduto<>nil then
     begin
        pcDescontoAdicionalItem:=pcDescontoAdicional;
        nrVerbaItem            :=nrVerbaLocal;
        if _rgDescontoAdicional.ItemIndex=0 then
        begin
           pcDescontoAdicionalItem:=_cdsItemPedido.FieldByName('DADY_Y').Asfloat;
           nrVerbaItem            :=_cdsItemPedido.FieldByName('NRVV_Y').AsInteger;
           nrVerba:=nrVerbaItem;

        end;
        if _rgDescontoAdicional.ItemIndex=2 then
        begin
           pcDescontoAdicionalItem:=_cdsItemPedido.FieldByName('DADY_Y').Asfloat+pcDescontoAdicional;
           nrVerbaItem            :=_cdsItemPedido.FieldByName('NRVV_Y').AsInteger;
        end;

        if (nrVerbaItem=0) and (_cdsItemPedido.FieldByName('NRVV_Y').AsInteger>0) then
        begin
            nrVerbaItem            :=_cdsItemPedido.FieldByName('NRVV_Y').AsInteger;
            nrVerba                :=nrVerbaItem;

        end;


        if (pcDescontoAdicional=0) and (qtBonificado=0) then
         begin
            nrVerbaLocal:=0;
            pcVerbaLocal:=0;
            nrVerbaItem :=0
         end;




         precoLista := GetPrecoItem(nrProduto,
                                    DadosPedidoAbertuta.cdEmpresa,// nrEmpresaOCD,
                                    DadosProduto.vlPrecoCompra,
                                    1,
                                    'S',
                                    0,
                                    nrListaPrecoExcecao);


//         vlPrecoLista := precoLista.vlPrecoBase;


         if (nrVerbaItem>0) AND (pcVerbaLocal=0) then
            pcVerbaLocal:=100;
        if (nrListaPrecoExcecao > 0) then
        begin
          pcDescontoAdicionalItem := precoLista.PcDescontoLista;
          if (cdoperadorLogisticoPedido = 1) and (qtBonificado=0) then
               nrVerbaItem := precoLista.nrVerba;
        end;

        if nrVerbaItem=0 then
           nrVerbaItem:=nrVerbaLocal;
        if (pcDescontoAdicionalItem=0) and (qtBonificado=0) then
        begin
           nrVerbaItem:=0;
           pcVerbaLocal:=0;
        end;


             PrecoItem := CalculaPrecoLiquido( precoLista.vlPrecoBase,
                                               DadosProduto.vlPrecoVenda,
                                               DadosProduto.pcRepasseCompra,
                                               DadosProduto.pcDescontoPadrao,
                                               pcDescontoAdicionalItem,
                                               DadosProduto.pcCreditoICMS,
                                               DadosProduto.pcIpiProduto,
                                               precoLista.PcIPILista,
                                               precoLista.pcReajustePreco,
                                               1,

                                               precoLista.nrListaPreco,
                                               'N',
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



 {   if nrVerbaItem > 0 then
    begin
      PrecoItem.vlVerba := CalculaPcVerba(pcVerba, PrecoItem.vlVerba,
      PrecoItem.vlPrecoCusto, DadosProduto.pcIpiProduto, 0,
      DadosProduto.pcCreditoICMS, DadosProduto.nrProduto, DadosProduto.nrTipoProduto,
      nrQuantidadePedido,DadosProduto.nrLaboratorio ,DadosProduto.idPis);
    end;}

    vlCustoItem:=PrecoItem.vlPrecoCusto;

    idbonificado:=false;
    if qtBonificado>0 then
       idbonificado:=true;


   if PrecoItem.vlPrecoLista>0 then
   begin
   AtualizaItemPedido(DadosPedidoAbertuta.nrPedido,
                      DadosProduto.nrProduto,
                      nrQuantidadePedido,
                      0,
                      nrPrazoDias,
                      nrVerbaItem,
                      0,
                      1,
                      _cdsItemPedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger,
                      _cdsItemPedido.FieldByName('QT_SUGERIDA').AsInteger,
                      'N',
                      'N',
                      'N',
                      DadosProduto.pcDescontoPadrao,
                      pcDescontoAdicionalItem,
                      0,
                      pcVerbaLocal,
                      0,
                      0,
                      PrecoItem.vlPrecoLiquido,
                      PrecoItem.vlPrecoLista,
                      vlCustoItem,
                      0,
                      0,
                      PrecoItem.vlVerba,
                      _cdsItemPedido.FieldByName('VL_MEDIA_VENDA').AsFloat,
                      'Tela Altualiza Pre?o Pedido',
                       DadosPedidoAbertuta.cdEmpresa,
                       DadosProduto.pcCreditoICMS,
                       precoLista.nrListaPreco,
                       false,
                       idbonificado,
                       precoLista.PcIcmsCompra,
                       0,
                       precoLista.vlBaseVenda);

      pcCreditoICMS:=DadosProduto.pcCreditoICMS;   //  SSS 33688   // SS 33688  alterado 01/09/2020
      //if (PrecoLista.PcIcmsCompra>0) and (dtSistema>=StrToDate('01/12/2016')) then
         //pcCreditoICMS:=precoLista.PcIcmsCompra;



      GravaLogItemPedido(DadosPedidoAbertuta.nrPedido,// NROP_Y, // NUMBER(6)
                         DadosProduto.nrProduto,// NROM_Y, // NUMBER(6)
                         nrQuantidadePedido,// QUAY_Y, // NUMBER(7)
                         0,// CHEY_Y: INTEGER; // NUMBER(7)
                         DadosProduto.pcDescontoPadrao,// ABTY_Y: Double; // NUMBER(5,2)
                         _cdsItemPedido.FieldByName('SITY_Y').AsString,//: String; // CHAR(1)
                         _cdsItemPedido.FieldByName('PRZY_Y').AsInteger, // NUMBER(3)
                         PrecoItem.vlPrecoLiquido, // NUMBER(17,6)
                         PrecoItem.vlPrecoLista, // NUMBER(17,6)
                         pcDescontoAdicionalItem, // NUMBER(5,2)
                         _cdsItemPedido.FieldByName('DFIY_Y').AsFloat, // NUMBER(5,2)
                         vlCustoItem,//: Double; // NUMBER(17,6)
                         nrVerbaLocal,//: INTEGER; // NUMBER(6)
                          0, // NOT NULL NUMBER(13,2)
                          0,//VL_MARGEM_NEGOCIADA: Double; // NOT NULL NUMBER(13,2)
                          'N',//ID_MARGEM, // CHAR(1)
                          'N',//ID_DESCONTO_ACUMULATIVO: String; // VARCHAR2(1)
                          pcVerbaLocal, // NUMBER(5,2)
                          PrecoItem.vlVerba,//: Double; // NUMBER(13,2)
                          0,//QT_BONIFICADA NOT NULL NUMBER(6)
                          0,//PC_BONIFICACAO NOT NULL NUMBER(5,2)
                          0,//PC_DESCONTO_OL: Double; // NOT NULL NUMBER(5,2)
                          _cdsItemPedido.FieldByName('NR_OPERADOR_LOGISTICO').AsInteger, // NOT NULL NUMBER(6)
                          _cdsItemPedido.FieldByName('NR_DIAS_ESTOQUE').AsInteger, // NUMBER(3)
                          _cdsItemPedido.FieldByName('QT_SUGERIDA').AsInteger,//: INTEGER; // NUMBER(7)
                          _cdsItemPedido.FieldByName('VL_MEDIA_VENDA').AsFloat,//: Double; // NUMBER(13,2)
                          precoLista.nrListaPreco, // NUMBER(6)
                          precoLista.pcReajustePreco,//  PC_MUDANCA_PRECO: Double;
                          DadosPedidoAbertuta.cdEmpresa,// CD_EMPRESA:Integer;
                           pcCreditoICMS{:Double});

   end;



     end;

    _cdsItemPedido.Next;
  end;
   nrVerba                :=nrVerbaItem;



end;


function T_frmAtualizaprecoPedido.GetPrecoItem(PnrProduto,
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
      Result.vlPrecoBase  := _cdsTabelaPreco.FieldByName('VL_BASE_COMPRA').AsFloat;
      Result.PcIcmsCompra := _cdsTabelaPreco.FieldByName('PC_ICMS_COMPRA').AsFloat;
      Result.PcIPILista      := _cdsTabelaPreco.FieldByName('PC_IPI_MERCADORIA').AsFloat;
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

function T_frmAtualizaprecoPedido.SetListaPrecoAtiva(PnrLista, PnrProduto,
  PnrEmpresa: Integer): TListaPrecoAtiva;
begin

  Result.vlPrecoLista := 0;
  Result.vlPrecoComdesconto := 0;
  Result.PcIcmsCompra := 0;
  Result.pcDescontoAdicional := 0;
  Result.nrListaPreco := 0;
  Result.nrVerba := 0;

  if _cdsItemListaPreco.Locate('CD_PRECO_FORNECEDOR_EXCECAO;CD_MERCADORIA;CD_EMPRESA',
    VarArrayOf([PnrLista, PnrProduto, PnrEmpresa]), []) then
  begin

    Result.vlPrecoLista := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA').AsFloat;
    Result.vlPrecoComdesconto := _cdsItemListaPreco.FieldByName('VL_COMPRA_MERCADORIA_DESCONTO').AsFloat;
    Result.pcDescontoAdicional := _cdsItemListaPreco.FieldByName('PC_DESCONTO_COMPRA').AsFloat;
    Result.nrListaPreco := PnrLista;
    Result.nrVerba := _cdsItemListaPreco.FieldByName('NR_VERBA').AsInteger;

  end;

end;


procedure T_frmAtualizaprecoPedido._btnAlteraClick(Sender: TObject);
begin
_btnAltera.Enabled:=false;
_cdsTabelaPreco := GetListaPrecoLaboratorio(0, 1, 0, DadosPedidoAbertuta.nrFornecedor, 0, 0, 'S',dtSistema);

 nrverba :=StrToIntDef(_edtNrVerbaDesconto.Text,0);
 pcVerba := StrToFloatDef(_edtPcVerba.Text,0);

 if pcVerba>100 then
 begin
     Mensagem('Verba n?o pode ser maior que 100,00%',MB_ICONWARNING);
     _edtPcVerba.SelectAll;
     _edtPcVerba.SetFocus;
     exit;
 end;

 if DadosPedidoAbertuta.idPedidoBonificado then
 begin
     if Confirma('Pedido bonificado !!!'+#13+
                 'Deseja realmente Aplicar verba em Pedido',MB_DEFBUTTON1)=idno then
     begin
         Mensagem('Atualiza??o n?o efetuada...',MB_ICONWARNING);
        exit;

     end;

 end;

   pcDescontoAdicional:=StrToFloatDef(_edtDescAdicional.Text,0);
   DadosFornecedor:=GetDadosLaboratorio(DadosPedidoAbertuta.nrFornecedor);
   AltualizaPrecoPedido(nrPedidoAlteracao);
  _btnAltera.Enabled:=true;
   AbreItensPedidos(nrPedidoAlteracao);

 if DadosPedidoAbertuta.idPedidoBonificado then
    setBonificaPedido(DadosPedidoAbertuta.nrPedido, 0,nrVerba);





end;

procedure T_frmAtualizaprecoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmAtualizaprecoPedido.FormCreate(Sender: TObject);
begin
 nrListaPrecoExcecao:=0;
end;

procedure T_frmAtualizaprecoPedido.FormShow(Sender: TObject);
begin
  _btnAltera.Enabled:=false;
   AbreDadosFornedor(nrPedidoAlteracao);
   AbreItensPedidos(nrPedidoAlteracao);

   Application.ProcessMessages;
  ListaPrecoAtivas(DadosPedidoAbertuta.nrFornecedor,0);
  _btnAltera.Enabled:=true;



end;

procedure T_frmAtualizaprecoPedido.AbreItensPedidos(nrPedido:Integer);
var
 stQuery :TStringList;
 cdProdutoLocal:Integer;
begin
 try
  //cdProdutoLocal:=StrToIntDef(_edtCodigoProduto.Text,0);
  //cdProdutoLocal:= StrToIntDef(copy(formatfloat('00000000',cdProdutoLocal),1,7),0);

   stQuery:=TStringList.Create;
   with stQuery do
   begin

    add('SELECT CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('NROP_Y, NROM_Y, QUAY_Y, CHEY_Y,SITY_Y, ABTY_Y,DADY_Y,PC_DESCONTO_NEGOCIADO,');
    add('PRZY_Y, PUNY_Y,  PFBY_Y,  DFIY_Y, VCCI_Y,QT_BONIFICADA,');
    add('NRVV_Y  ,CD_INTERNO_LABORATORIO,PC_VERBA ,VL_VERBA , ID_DESCONTO_ACUMULATIVO,');
    add('CD_LISTA_COMPRA,PC_MUDANCA_PRECO,NR_OPERADOR_LOGISTICO,CD_EMPRESA,');
    add('NR_DIAS_ESTOQUE,QT_SUGERIDA,VL_MEDIA_VENDA,ID_NFE_TRANSITO,CD_EAN_COMPRA');
    add('FROM');
    add('PRDDM.DCPCI,');
    add('PRDDM.DC_MERCADORIA');
    add('WHERE NROM_Y=CD_MERCADORIA');
    add('AND sity_y not in(''C'',''I'',''S'',''F'',''P'')');
    add('AND NROP_Y = :PnrPedido');
   end;
   stQuery.SaveToFile('c:\temp\qryRelacaoPedidoItem.sql');
   with _cdsItemPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrPedido').AsBcd:=nrPedido;
     open;
     SetGridItemPedido;
   end;
 finally
   FreeAndNil(stQuery);
 end;
end;

procedure T_frmAtualizaprecoPedido.SetGridItemPedido;
begin
  if _cdsItemPedido.Active then
  begin
   TIntegerField(_cdsItemPedido.FieldByName('NROM_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('DFIY_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('CD_EMPRESA')).Visible:=false;
   TStringField(_cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO')).visible:=false;


   TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Prod.';
   TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayWidth:=7;

   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

   TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresentacao Produto';
   TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=25;


   TIntegerField(_cdsItemPedido.FieldByName('NROP_Y')).DisplayLabel:='Nr.Pedido';
   TIntegerField(_cdsItemPedido.FieldByName('NROP_Y')).DisplayWidth:=7;

   TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayLabel:='Qtd.Pedido';
   TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayWidth:=6;

   TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayLabel:='Qtd.Atendida';
   TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayWidth:=6;

   TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayLabel:='Status';
   TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayWidth:=3;

   TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayLabel:='%Desc.';
   TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayWidth:=6;
   TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayFormat:=('##0.00%');

   TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayLabel:='%Desc.Adic.';
   TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayWidth:=6;
   TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayFormat:=('##0.00%');

   TFloatField(_cdsItemPedido.FieldByName('PC_DESCONTO_NEGOCIADO')).DisplayLabel:='%Desc.Negoc.';
   TFloatField(_cdsItemPedido.FieldByName('PC_DESCONTO_NEGOCIADO')).DisplayWidth:=6;
   TFloatField(_cdsItemPedido.FieldByName('PC_DESCONTO_NEGOCIADO')).DisplayFormat:=('##0.00%');

   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayLabel:='Cd.Prazo';
   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayWidth:=6;

   TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayLabel:='P?o.Unit?rio';
   TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayWidth:=09;
   TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayFormat:=('###,###,##0.00');

   TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayLabel:='P?o.Fornecedor';
   TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayWidth:=09;
   TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayFormat:=('###,###,##0.00');

   TFloatField(_cdsItemPedido.FieldByName('VCCI_Y')).DisplayLabel:='P?o.Custo';
   TFloatField(_cdsItemPedido.FieldByName('VCCI_Y')).DisplayWidth:=09;
   TFloatField(_cdsItemPedido.FieldByName('VCCI_Y')).DisplayFormat:=('###,###,##0.00');


   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayLabel:='Cd.Prazo';
   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayWidth:=6;

   TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
   TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayWidth:=6;

   TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayLabel:='% Verba';
   TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayWidth:=06;
   TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayFormat:=('##0.00');

   TFloatField(_cdsItemPedido.FieldByName('VL_VERBA')).DisplayLabel:='Vlr.Verba';
   TFloatField(_cdsItemPedido.FieldByName('VL_VERBA')).DisplayWidth:=06;
   TFloatField(_cdsItemPedido.FieldByName('VL_VERBA')).DisplayFormat:=('###,###,##0.00');

   TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayLabel:='Nota em Transito';
   TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayWidth:=25;


   _cdsItemPedido.FieldByName('PC_DESCONTO_NEGOCIADO').ReadOnly:=true;

  end;

  //  add('  ,CD_INTERNO_LABORATORIO, , , ID_DESCONTO_ACUMULATIVO,');
  //  add('CD_LISTA_COMPRA,PC_MUDANCA_PRECO,NR_OPERADOR_LOGISTICO');

end;



function T_frmAtualizaprecoPedido.ListaPrecoAtivas(PnrFornecedor, PnrProduto: Integer): Boolean;
var
  stQry: TStringList;
  _cdsTemp: TClientDataSet;
begin
  try
    stQry := nil;
    stQry := TStringList.Create;
    _cdsTemp := TClientDataSet.Create(nil);

    with stQry do
    begin
      Add('SELECT CD_PRECO_FORNECEDOR_EXCECAO');
      Add(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) NR_ITENS,NR_VERBA,''N'' AS ID_SELECIONADO');
      Add('FROM');
      Add('PRDDM.DC_PRECO_FORNECEDOR_EXCECAO LPF,');
      Add('PRDDM.DC_COMPRA_MERCADORIA  CM');
      Add('WHERE');
      Add('LPF.CD_MERCADORIA=CM.CD_MERCADORIA');
      Add('AND LPF.CD_EMPRESA=CM.CD_EMPRESA');
      Add('AND CM.ID_SITUACAO_MERCADORIA<>''I''');
      if PnrFornecedor > 0 then
        Add('AND CD_GRUPO_FORNECEDOR=:PnrFornecedor');
      if PnrProduto > 0 then
        Add('AND CM.CD_MERCADORIA=:PnrProduto');
      Add('AND ID_SITUACAO=''A''');
      Add('GROUP BY CD_PRECO_FORNECEDOR_EXCECAO,DT_INICIO_VALIDADE ,DT_FIM_VALIDADE,NR_VERBA');
      add('ORDER BY inicio desc');

    end;

    Result := false;
    stQry.SaveToFile('C:\temp\qryListaPrecoAtiva.sql');
    with _cdsListaPrecoAtiva do
    begin
      close;
      CommandText := stQry.Text;
      if PnrFornecedor > 0 then
        Params.ParamByName('PnrFornecedor').AsBCD := PnrFornecedor;
      if PnrProduto > 0 then
        Params.ParamByName('PnrProduto').AsBCD := PnrProduto;
      open;
    end;
    SetGridListaPreco;
    if not _cdsListaPrecoAtiva.IsEmpty then
    begin
      Result := true;
    end;
  finally
    FreeAndNil(stQry);
  end;
end;

procedure T_frmAtualizaprecoPedido.SetGridListaPreco;
begin
  // CD_PRECO_FORNECEDOR_EXCECAO');
  // ADD(' AS NR_LISTA,DT_INICIO_VALIDADE INICIO,DT_FIM_VALIDADE FINAL,COUNT(*) ');

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_LISTA')).DisplayLabel :=
    'Nr. Lista';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_LISTA')).DisplayWidth := 6;

  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayLabel :=
    'Dt.Inicio';
  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayWidth := 10;
  TDateField(_cdsListaPrecoAtiva.FieldByName('INICIO')).DisplayFormat :=
    'dd/mm/yyyy';

  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayLabel :=
    'Dt.FinalL';
  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayWidth := 10;
  TDateField(_cdsListaPrecoAtiva.FieldByName('FINAL')).DisplayFormat :=
    'dd/mm/yyyy';

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_ITENS')).DisplayLabel :=
    'Nr. Itens';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_ITENS')).DisplayWidth := 6;

  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_VERBA')).DisplayLabel :=
    'Nr.Verba';
  TIntegerField(_cdsListaPrecoAtiva.FieldByName('NR_VERBA')).DisplayWidth := 6;

  TStringField(_cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO'))
    .DisplayLabel := 'Id.';
  TStringField(_cdsListaPrecoAtiva.FieldByName('ID_SELECIONADO'))
    .DisplayWidth := 02;
end;



function T_frmAtualizaprecoPedido.ValidaVerba(PnrVerba:Integer):Integer;
begin


  nrVerba:=  GetNumeroVerba(PnrVerba, DadosPedidoAbertuta.nrFornecedor);
 if (PnrVerba > 0) and (nrVerba=0) then
  begin

    Mensagem('Essa verba n?o pertence a esse fornecedor !!!', MB_ICONWARNING);
       _edtNrVerbaDesconto.Clear;
       _edtNrVerbaDesconto.SetFocus;
       nrVerba:=0;
  end;
  Result:=nrVerba;
end;


end.
