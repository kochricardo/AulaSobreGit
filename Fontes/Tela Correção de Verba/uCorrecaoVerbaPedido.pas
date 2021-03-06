unit uCorrecaoVerbaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls,
  uAuxiliarCompras, uProduto, uRotinasGenericas, uRelatorioVerbas;

type
  T_frmCorrecaoVerba = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    _dtpDtInicio: TDateTimePicker;
    _dtpDtFinal: TDateTimePicker;
    _edtNumeroComprador: TEdit;
    _edtNumeroFornecedor: TEdit;
    _rgStatus: TRadioGroup;
    _btnMostraPedidos: TBitBtn;
    _edtNrPedido: TEdit;
    GroupBox2: TGroupBox;
    _dbgcapaPedido: TDBGrid;
    GroupBox4: TGroupBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    _rgTipoDesconto: TRadioGroup;
    _btnTesteValor: TBitBtn;
    _edtValorVerba: TEdit;
    _edtValorParaverba: TEdit;
    _edtPcVerba: TEdit;
    _edtNumeroVerba: TEdit;
    _btnImprimir: TBitBtn;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    _chkMantemDesconto: TCheckBox;
    _dspedido: TDataSource;
    _cdsPedido: TClientDataSet;
    _cdsPedidoNR_TOTAL_ITENS: TAggregateField;
    _cdsPedidoNR_TOTAL_UNIDADES: TAggregateField;
    _cdsPedidoVL_PEDIDO_FORNECEDOR: TAggregateField;
    _cdsPedidoVL_PEDIDO_CUSTO: TAggregateField;
    _cdsPedidoNR_UNIDADES_FAT: TAggregateField;
    _cdsPedidoVL_FATURADO_CUSTO: TAggregateField;
    _cdsPedidoVL_FATURADO_FORNEC: TAggregateField;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    DBGrid1: TDBGrid;
    procedure _btnMostraPedidosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _dbgcapaPedidoDblClick(Sender: TObject);
    procedure _btnTesteValorClick(Sender: TObject);
    procedure _edtNumeroVerbaExit(Sender: TObject);
  private
    nrCompradorPedido       :Integer;
    procedure AbreItensPedidos(nrPedido: Integer);
    procedure AbrePedidosComprador(nrComprador, nrFornecedor, NrOrdem: Integer;
      idSituacao: String; dtInicio, dtFinal: TDateTime);
    procedure SetGridItemPedido;
    procedure SetGridPedidos;
    procedure TesteValoresporItem;
    function  converteValor(stValor:String):Double;
    function ValidaVerba(PnrVerba, PnrFornecedor: Integer): Integer;
    { Private declarations }
  public
    { Public declarations }
    vlParaVerba,
    vlTotalPedido :Double;
    nrVerba :Integer;
  end;

var
  _frmCorrecaoVerba: T_frmCorrecaoVerba;
  PrecoLista: TListaPreco;

implementation

uses uSistemaCompras;

{$R *.dfm}

procedure T_frmCorrecaoVerba._btnMostraPedidosClick(Sender: TObject);
var
 dtInicio,dtFinal :String[10];
 idStatus :String[10];
begin
  dtInicio:=FormatDateTime('dd/mm/yyyy',_dtpDtInicio.Date);
  dtFinal:=FormatDateTime('dd/mm/yyyy',_dtpDtFinal.Date);
  idStatus:='N';
  _cdsPedido.ControlsDisabled;
  _cdsItemPedido.DisableControls;
   case _rgStatus.ItemIndex of
    0: idStatus:=' ';
    1: idStatus:='F';
    2: idStatus:='N';
    3: idStatus:='Z';
  end;

  AbrePedidosComprador(StrToIntDef(_edtNumeroComprador.Text,nrCompradorSistema),
                       StrToIntDef(_edtNumeroFornecedor.Text,0),StrToIntDef(_edtNrPedido.Text,0),
                       idStatus,StrToDateDef(dtInicio,dtSistema),StrToDateDef(dtFinal,dtSistema));
  _cdsItemPedido.EnableControls;

end;

procedure T_frmCorrecaoVerba._btnTesteValorClick(Sender: TObject);
begin
   TesteValoresporItem;
end;

procedure T_frmCorrecaoVerba._dbgcapaPedidoDblClick(Sender: TObject);
begin
  AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
end;

procedure T_frmCorrecaoVerba._edtNumeroVerbaExit(Sender: TObject);
begin

  nrverba :=StrToIntDef(_edtNumeroVerba.Text,0);
  if nrVerba>0 then
      nrVerba:=ValidaVerba(nrVerba,0);

end;


function T_frmCorrecaoVerba.ValidaVerba(PnrVerba,PnrFornecedor:Integer):Integer;
begin


  nrVerba:=  GetNumeroVerba(PnrVerba, PnrFornecedor);
 if (PnrVerba > 0) and (nrVerba=0) then
  begin
   Mensagem('Essa verba n?o pertence a esse fornecedor !!!', MB_ICONWARNING);
       _edtNumeroVerba.Clear;
       _edtNumeroVerba.SetFocus;
       nrVerba:=0;
  end;
  Result:=nrVerba;
end;


procedure T_frmCorrecaoVerba.TesteValoresporItem;
var
  i: Integer;
  nrPedidoLocal,
  cdPrazoPagamento,
  nrProduto,
  dgMercadoria,
  cdCentroDistribuicao,
  nrItemPedido,
  nrDiasEstoqueAtual,
  nrUnidadesPossivel,
  nrPrazoPedido,
  nrListaPreco,
  qtPedido     :Integer;

  stPrazo,idUnidadeFederacao :string;


  pcDescontoPadrao,
  pcDescontoAdicional,
  pcDescontoAdicionalCalculado,
  pcVerba,pcDescontoRepasse,
  vlPrecoFornecedor,
  pcAliquotaIcms,
  pcIpi,vlVerba,
  vlMediaMes,
  pcIndicePreco,
  vlVerbaCalculado:Double;

  Mercadoria: TMercadoria;
  idIpiLiquidoComRepasse, idIpiLiquidoSemRepasse,
  idIpiBrutoComRepasse,idIpiBrutoSemRepasse,
  idIcmDestacado, idTipoLista,  idForcaRepasse,
  idReduzIcms, idSuperfluo,
  idPisConfins, idProdutoAtivo,idStatus: String[1];

  TabelaTemp      : TClientDataSet;
  DadosFornecedor : TDadosFornecedor;
  PrecoLista      : TListaPreco;
  PrecoItem       : TCalculoPreco;
  idbonificado :Boolean;
  nrVerbaPedido:Integer;

begin
    _cdsItemPedido.First;

    vlParaVerba:=converteValor(_edtValorParaVerba.Text);
    vlTotalPedido:=_cdsPedido.FieldByName('VL_PEDIDO').AsFloat;
    pcDescontoAdicional:=0;
    nrCompradorPedido:=_cdsPedido.FieldByName('CD_COMPRADOR').AsInteger;
    if _rgTipoDesconto.ItemIndex=0 then
    begin
      if vlTotalPedido>0 then
      pcDescontoAdicionalCalculado:=(vlParaVerba/vlTotalPedido)*100;
    end
    else
    begin
      pcDescontoAdicionalCalculado:=vlParaVerba;
      if (vlParaVerba=0) or (vlParaVerba>100)  then
         pcDescontoAdicionalCalculado:=100;
    end;

      DadosFornecedor:= GetDadosLaboratorio(_cdsPedido.FieldByName('LABP_P').AsInteger);


    pcVerba              :=StrToFloatDef(_edtPcVerba.Text,0);
    nrVerbaPedido        :=StrToIntDef(_edtNumeroVerba.Text,0);



      if nrVerbaPedido>0 then
      begin
        nrVerba:=ValidaVerba(nrVerbaPedido,DadosFornecedor.nrFornecedor);
        _edtNumeroVerba.SelectAll;
        _edtNumeroVerba.SetFocus;
        exit;
      end;




    if StrToIntDef(_edtNumeroVerba.Text,0)=0 then
    begin
      //Mensagem('Falta Nr. verba',48);
     // _edtNumeroVerba.SetFocus;
     // exit;
     nrVerba:=_cdsItemPedido.FieldByName('NRVV_Y').AsInteger
    end;

       if nrVerba>0 then
      begin
        nrVerba:=ValidaVerba(nrVerba,DadosFornecedor.nrFornecedor);
        _edtNumeroVerba.SelectAll;
        _edtNumeroVerba.SetFocus;
        exit;
      end;



    vlVerbaCalculado :=0;
    while Not _cdsItemPedido.Eof do
    begin
     nrPedidoLocal     :=  _cdsItemPedido.FieldByName('NROP_Y').AsInteger;
     qtPedido          := _cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
     nrProduto         := _cdsItemPedido.FieldByName('NROM_Y').AsInteger;
     dgMercadoria      := _cdsItemPedido.FieldByName('NR_DV_MERCADORIA').AsInteger;
     vlPrecoFornecedor := _cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
     if _chkMantemDesconto.Checked then
     begin
         PcDescontoAdicional:=_cdsItemPedido.FieldByName('DADY_Y').AsFloat;
         pcVerba            :=_cdsItemPedido.FieldByName('pc_verba').AsFloat;
     end
     else
         PcDescontoAdicional:= pcDescontoAdicionalCalculado;
     Mercadoria        := GetMercadoriaNova(nrProduto,dgMercadoria,0,_cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,1,'');
     pcDescontoRepasse := Mercadoria.pcRepasseCompra;
     pcAliquotaIcms    := Mercadoria.pcCreditoICMS;
     pcIpi             := Mercadoria.pcIpiProduto;
     idUnidadeFederacao:= DadosFornecedor.idUnidadeFederacao;

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



     pcDescontoPadrao     :=_cdsItemPedido.FieldByName('ABTY_Y').AsFloat;

     cdCentroDistribuicao :=_cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger;
     vlPrecoFornecedor    :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
     if (nrVerba>0) and (PcDescontoAdicional>0) and (pcVerba=0) then
        pcVerba:=100;
     if (nrVerba=0) and (PcDescontoAdicional>0) and (pcVerba>=0)    then
        pcVerba:=0;

     idbonificado:=false;
     if _cdsItemPedido.FieldByName('QT_BONIFICADA').AsInteger>0 then
        idbonificado:=true;
     if (PcDescontoAdicional=0) and (pcVerba>=0) and (nrVerba=0)  then
     begin
        pcVerba:=0;
        nrVerba:=0;
     end;

     nrListaPreco        :=_cdsItemPedido.FieldByName('CD_LISTA_COMPRA').AsInteger;
     pcIndicePreco       :=_cdsItemPedido.FieldByName('PC_MUDANCA_PRECO').AsFloat;

     PrecoLista :=GetListaprecoNova(0, pcIndicePreco, 1, nrProduto, 1,  'N', dtPedido);


{        SetPrecoItem(nrProduto, Mercadoria.n, nrEmpresa, 0,
            nrQuantidadeComprada, nrVerbaSC, 0, 0, pcDescontoAdicional);
          PrecoItemSC := PrecoItem;}

    PrecoItem := CalculaPrecoLiquido(vlPrecoFornecedor, vlPrecoFornecedor,
                                    pcDescontoRepasse, pcDescontoPadrao,
                                    pcDescontoAdicional,
                                    pcAliquotaIcms,
                                    pcIpi,
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
      if (nrVerba>0) and (pcDescontoAdicional>0) then
      begin
       vlVerba := CalculaPcVerba(pcVerba,
                                 PrecoItem.vlVerba,
                                 PrecoItem.vlPrecoCusto,
                                 Mercadoria.pcIpiProduto,
                                 0,
                                 Mercadoria.pcCreditoICMS,
                                 Mercadoria.nrProduto,
                                 Mercadoria.nrTipoProduto,
                                 qtPedido,Mercadoria.nrLaboratorio,
                                 Mercadoria.idPis);
      end;



       if qtPedido>0 then
       begin
        sleep(0);
        inc(nrItemPedido);
        _cdsItemPedido.edit;
        _cdsItemPedido.fieldByName('VL_VERBA').asFloat:=vlVerba;
        //_cdsItemPedido.fieldByName('DADY_Y').asFloat:=pcDescontoAdicional;
        _cdsItemPedido.fieldByName('PC_VERBA').asFloat:=pcVerba;
        vlVerbaCalculado :=vlVerbaCalculado + vlVerba*qtPedido;

        if AbreItemPedidoMultiEmpresa(nrPedidoLocal, nrProduto,cdCentroDistribuicao, 'N') then
        begin
          if NOT AtualizaItemPedido(nrPedidoLocal,
                               nrProduto,
                               qtPedido,
                               _cdsItemPedido.fieldByName('CHEY_Y').AsInteger,
                               _cdsItemPedido.fieldByName('PRZY_Y').AsInteger,
                               nrVerba,
                               _cdsItemPedido.fieldByName('QT_BONIFICADA').AsInteger,
                               _cdsItemPedido.fieldByName('NR_OPERADOR_LOGISTICO').AsInteger,
                               _cdsItemPedido.fieldByName('NR_DIAS_ESTOQUE').AsInteger,
                               _cdsItemPedido.fieldByName('QT_SUGERIDA').AsInteger,
                               _cdsItemPedido.fieldByName('SITY_Y').AsString,
                               _cdsItemPedido.fieldByName('ID_MARGEM').AsString,
                               _cdsItemPedido.fieldByName('ID_DESCONTO_ACUMULATIVO').AsString,
                               _cdsItemPedido.fieldByName('ABTY_Y').AsFloat,
                               pcDescontoAdicional,
                               _cdsItemPedido.fieldByName('DFIY_Y').AsFloat,
                               pcVerba,
                               _cdsItemPedido.fieldByName('PC_BONIFICACAO').AsFloat,
                               _cdsItemPedido.fieldByName('PC_DESCONTO_OL').AsFloat,
                               _cdsItemPedido.fieldByName('PUNY_Y').AsFloat,
                               _cdsItemPedido.fieldByName('PFBY_Y').AsFloat,
                               _cdsItemPedido.fieldByName('VCCI_Y').AsFloat,
                               _cdsItemPedido.fieldByName('VL_MARGEM_PADRAO').AsFloat,
                               _cdsItemPedido.fieldByName('VL_MARGEM_NEGOCIADA').AsFloat,
                               vlVerba,
                               _cdsItemPedido.fieldByName('VL_MEDIA_VENDA').AsFloat,' Tela Correcao Verba',
                               cdCentroDistribuicao,
                                _cdsItemPedido.fieldByName('PC_CREDITO_ICMS').AsFloat,
                                nrListaPreco ,
                                false,
                                idbonificado,
                                _cdsItemPedido.fieldByName('PC_ICMS_COMPRA').AsFloat,0,
                                _cdsItemPedido.fieldByName('VL_BASE_VENDA').AsFloat) THEN

                  Mensagem('Erro Na Atualiza??o do Item!!',16);
        end;







      _cdsItemPedido.Next;
    end;
    _edtValorVerba.Text := FormatFloat('###,###,##0.00',vlVerbaCalculado);
    end;
    _cdsItemPedido.EnableControls;
end;


procedure T_frmCorrecaoVerba.AbrePedidosComprador(nrComprador,nrFornecedor,NrOrdem:Integer;idSituacao:String;dtInicio,dtFinal:TDateTime);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
     add('SELECT NROP_P,');
     add('case');
     add('WHEN CD_EMPRESA=1 THEN ''SC''');
     add('WHEN CD_EMPRESA=4 THEN ''RS''');
     add('END LOCAL_CD,');
     add('LABP_P,NM_FORNECEDOR,DT_PEDIDO ,DT_PREVISTA,SITP_P,');
     add('SUM(NR_ITENS) AS NR_ITENS,SUM(NR_UNIDADES) AS NR_UNIDADES,');
     add('NVL(SUM(NR_CANCELADO),0) AS NR_CANCELADO,');
     add('NVL(SUM(NR_NOVO),0) AS NR_NOVO,ROUND(SUM(VL_PEDIDO_CUSTO),2) AS VL_PEDIDO,');
     add('ROUND(SUM(VL_PEDIDO_FABR),2) AS VL_PEDIDO_FABR,SUM(NVL(NR_FATURADO,0)) AS NR_FATURADO,');
     add('SUM(NVL(QT_FATURADO,0)) AS QT_FATURADO,');
     add('ROUND(SUM(VL_PED_FAT_CUSTO),2) AS VL_PEDIDO_FAT,');
     add('ROUND(SUM(VL_PED_FAT_FABR),2) AS VL_PED_FAT_FABR,');
     add('sum(NR_CONDICAO_PAGTO_P) as NR_CONDICAO_PAGTO_P,');
     add('CD_EMPRESA,CD_COMPRADOR');
     add('FROM');
     add('(SELECT');
     add('LABP_P,NROP_P,DATP_P AS DT_PEDIDO,PREP_P AS DT_PREVISTA,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,');
     add('SITP_P,COUNT(*) NR_ITENS,SUM(QUAY_Y) as NR_UNIDADES,');
     add('SUM(QUAY_Y *PUNY_Y) as VL_PEDIDO_CUSTO,SUM(QUAY_Y *PFBY_Y) AS VL_PEDIDO_FABR,');
     add('SUM(CHEY_Y *PUNY_Y) as VL_PED_FAT_CUSTO,SUM(CHEY_Y * PFBY_Y) AS VL_PED_FAT_FABR,');

     add('CASE');
     add('WHEN SITY_Y=''P'' THEN COUNT(*)');
     add('END NR_PARCIAL,');
     add('CASE');
     add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN COUNT(*)');
     add('END NR_FATURADO,');
     add('CASE');
     add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN Sum(CHEY_Y)');
     add('END QT_FATURADO,');
     add('CASE');
     add('WHEN SITY_Y=''C'' THEN COUNT(*)');
     add('END NR_CANCELADO,');
     add('CASE');
     add('WHEN SITY_Y=''N'' THEN COUNT(*)');
     add('END NR_NOVO,');
     add('NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,CAPA.CD_COMPRADOR');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM');
     add('WHERE');
     ADD('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND  NROP_P = NROP_Y');
     add('AND  LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND  LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa');
     add('AND CAPA.cd_empresa = ITEM.cd_empresa');
     add('AND COMPRA_MERCADORIA.CD_MERCADORIA = ITEM.NROM_Y');
     if nrOrdem>0 then
         add('AND NROP_P=:PnrOrdem');
     if nrFornecedor>0 then
         add('AND LABP_P=:PnrFornecedor');
     add('AND sitp_p=:PidStatus');
     add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
     if nrOrdem=0 then
     add('AND DATP_P between :PdtInicio and :PdtFinal');
     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,SITP_P,SITY_Y,NROP_P,');
     add('DATP_P,PREP_P,NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,CAPA.CD_COMPRADOR)');
     add('GROUP BY LABP_P,NM_FORNECEDOR,NROP_P,SITP_P,DT_PEDIDO,DT_PREVISTA,CD_EMPRESA,CD_COMPRADOR');
     add('ORDER BY DT_PEDIDO,LABP_P,NROP_P');

   end;
   with _cdsPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrComprador').AsInteger:=nrComprador;
     if nrOrdem=0 then
     begin
      Params.ParamByName('PdtInicio').AsDateTime:=dtInicio;
      Params.ParamByName('PdtFinal').AsDateTime :=dtFinal;
     end;

     if nrOrdem>0 then
     Params.ParamByName('PnrOrdem').AsInteger:=nrOrdem;
     if nrFornecedor>0 then
       Params.ParamByName('PnrFornecedor').AsInteger:=nrFornecedor;
     Params.ParamByName('PidStatus').AsString:=idSituacao;
     open;
   end;
   SetGridPedidos;
   AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);

   SetGridItemPedido;
 finally
   FreeAndNil(stQuery);
 end;
end;



procedure T_frmCorrecaoVerba.AbreItensPedidos(nrPedido:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
    add('SELECT CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('NROP_Y, NROM_Y, QUAY_Y, CHEY_Y,SITY_Y, ABTY_Y,DADY_Y,');
    add('PRZY_Y, PUNY_Y,  PFBY_Y,  DFIY_Y, VCCI_Y,');
    add('NRVV_Y ,PC_VERBA ,VL_VERBA ,CD_INTERNO_LABORATORIO ,');
    add('ID_DESCONTO_ACUMULATIVO,CD_LISTA_COMPRA,PC_MUDANCA_PRECO,PC_ICMS_COMPRA,');
    add('NR_OPERADOR_LOGISTICO,NR_DV_MERCADORIA,CAPA.CD_EMPRESA,QT_BONIFICADA,');
    add('NR_DIAS_ESTOQUE,QT_SUGERIDA,ID_MARGEM,ID_DESCONTO_ACUMULATIVO,');
    add('PC_BONIFICACAO,PC_DESCONTO_OL,VL_MARGEM_PADRAO,VL_MARGEM_NEGOCIADA,');
    add('VL_MEDIA_VENDA,PC_CREDITO_ICMS,VL_BASE_VENDA');
    add('FROM');
    add('PRDDM.DCPCC CAPA,');
    add('PRDDM.DCPCI ITEM,');
    add('PRDDM.DC_MERCADORIA');
    add('WHERE');
    add('NROP_P=NROP_Y');
    add('AND NROM_Y=CD_MERCADORIA');
    add('AND SITY_Y = ''N''');
    add('AND NROP_Y = :PnrPedido');



   end;
   with _cdsItemPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrPedido').AsInteger:=nrPedido;
     open;

     SetGridItemPedido;
     _dsItemPedido.DataSet:=_cdsItemPedido;
   end;
 finally
   FreeAndNil(stQuery);
 end;
end;

procedure T_frmCorrecaoVerba.SetGridPedidos;
begin
 TIntegerField(_cdsPedido.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
 TIntegerField(_cdsPedido.FieldByName('NROP_P')).DisplayWidth:=7;

 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayWidth:=10;

 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayLabel:='Dt.Prevista';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayWidth:=10;

 TIntegerField(_cdsPedido.FieldByName('LABP_P')).DisplayLabel:='Nr.Fornec.';
 TIntegerField(_cdsPedido.FieldByName('LABP_P')).DisplayWidth:=7;

 TStringField(_cdsPedido.FieldByName('LOCAL_CD')).DisplayLabel:='Local.CD';
 TStringField(_cdsPedido.FieldByName('LOCAL_CD')).DisplayWidth:=05;

 TStringField(_cdsPedido.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
 TStringField(_cdsPedido.FieldByName('NM_FORNECEDOr')).DisplayWidth:=25;

 TStringField(_cdsPedido.FieldByName('SITP_P')).DisplayLabel:='Status';
 TStringField(_cdsPedido.FieldByName('SITP_P')).DisplayWidth:=04;

 TIntegerField(_cdsPedido.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
 TIntegerField(_cdsPedido.FieldByName('NR_ITENS')).DisplayWidth:=7;

 TIntegerField(_cdsPedido.FieldByName('NR_UNIDADES')).DisplayLabel:='Nr.Unid.';
 TIntegerField(_cdsPedido.FieldByName('NR_UNIDADES')).DisplayFormat:='###,###,##0';
 TIntegerField(_cdsPedido.FieldByName('NR_UNIDADES')).DisplayWidth:=7;

 TIntegerField(_cdsPedido.FieldByName('NR_CANCELADO')).DisplayLabel:='Nr.Itens Cancel.';
 TIntegerField(_cdsPedido.FieldByName('NR_CANCELADO')).DisplayWidth:=7;
 TIntegerField(_cdsPedido.FieldByName('NR_NOVO')).DisplayLabel:='Itens Nao Fat.';
 TIntegerField(_cdsPedido.FieldByName('NR_NOVO')).DisplayWidth:=7;

 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO')).DisplayLabel:='Vlr. Pedido';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO')).DisplayLabel:='Vlr. Pedido';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO')).DisplayWidth:=12;

 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FABR')).DisplayLabel:='Vlr.Ped.P?o Fornec.';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FABR')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FABR')).DisplayWidth:=12;

 TIntegerField(_cdsPedido.FieldByName('NR_FATURADO')).DisplayLabel:='Nr.Unid.Fat';
 TIntegerField(_cdsPedido.FieldByName('NR_FATURADO')).DisplayWidth:=7;

 TIntegerField(_cdsPedido.FieldByName('QT_FATURADO')).DisplayLabel:='Qtd.Unid.Fat';
 TIntegerField(_cdsPedido.FieldByName('QT_FATURADO')).DisplayWidth:=7;

  TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FAT')).DisplayLabel:='Vlr.Faturador Custo';
  TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FAT')).DisplayFormat:='##,###,###,##0.00';
  TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FAT')).DisplayWidth:=12;

  TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_FABR')).DisplayLabel:='Vlr.Faturador Fornec.';
  TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_FABR')).DisplayFormat:='##,###,###,##0.00';
  TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_FABR')).DisplayWidth:=12;

  TIntegerField(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayLabel:='Cond.Pag.';
  TIntegerField(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayWidth:=7;
end;
procedure T_frmCorrecaoVerba.SetGridItemPedido;
begin
   TIntegerField(_cdsItemPedido.FieldByName('NROM_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('DFIY_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('NROP_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('CD_LISTA_COMPRA')).Visible:=false;
   TFloatField(_cdsItemPedido.FieldByName('PC_MUDANCA_PRECO')).Visible:=false;
   TStringField(_cdsItemPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('QT_BONIFICADA')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('NR_DIAS_ESTOQUE')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('QT_SUGERIDA')).Visible:=false;

   TStringField(_cdsItemPedido.FieldByName('ID_MARGEM')).Visible:=false;
   TStringField(_cdsItemPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).Visible:=false;
   TFloatField(_cdsItemPedido.FieldByName('PC_BONIFICACAO')).Visible:=false;
   TFloatField(_cdsItemPedido.FieldByName('PC_DESCONTO_OL')).Visible:=false;
   TFloatField(_cdsItemPedido.FieldByName('VL_MARGEM_PADRAO')).Visible:=false;
   TFloatField(_cdsItemPedido.FieldByName('VL_MARGEM_NEGOCIADA')).Visible:=false;
   TFloatField(_cdsItemPedido.FieldByName('VL_MEDIA_VENDA')).Visible:=false;
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
   TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayFormat:=('###,###,##0');

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

end;
function T_frmCorrecaoVerba.converteValor(stValor:String):Double;
var
 stTemp:String;
begin
      stTemp:= StringReplace(stValor,'.','',[rfReplaceAll]);
     result:=StrToFloatDef(stTemp,0);
end;

procedure T_frmCorrecaoVerba.FormShow(Sender: TObject);
begin
  _edtNumeroComprador.Text:=IntToStr(nrCompradorSistema);
  _dtpDtInicio.Date:=dtSistema-1;
  _dtpDtFinal.Date :=dtSistema;

end;

end.
